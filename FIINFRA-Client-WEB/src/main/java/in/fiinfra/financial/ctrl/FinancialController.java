package in.fiinfra.financial.ctrl;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.note.Note;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.model.FinancialRequest;
import in.fiinfra.cp.common.model.GraphData;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.cp.common.util.Link;
import in.fiinfra.financial.Service.FinancialService;
import in.fiinfra.financial.model.Series;
import in.fiinfra.portfolio.service.PortfolioService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

@Controller
@RequestMapping("/financial")
public class FinancialController extends AbstractController {

	@Link(label="My Income", family="My Cashflow", parent = "" ) 
	@RequestMapping(value = "/myIncome", method = RequestMethod.GET)
	public String showIncome(FinancialRequest request, Model m) {

		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId()); 
		request.setBuId(user.getBuId());

		FinancialService service = getBean(FinancialService.class);
		List<IncomeData> lstIncome = service.getListOfIncome(request);
		m.addAttribute("income", new IncomeData());
		populateIncomeForm(m, lstIncome);

		populateIncomeGraphData(m, request,lstIncome);
		populateDcData(m);
		// if (lstIncome.isEmpty()) {
		// lstIncome.add(new IncomeData());
		// }
		List<GraphData> incomeGraphData = new ArrayList<GraphData>();

		long totalIncomeYearly = 0;

		for (IncomeData d : lstIncome) {
			GraphData g = new GraphData();

			long yearly = (CommonUtils.calculateAmountYearly(
					d.getIncomeAmount(), d.getIncomeFrequencyId()));
			long monthly = (CommonUtils.calculateAmountMonthly(
					d.getIncomeAmount(), d.getIncomeFrequencyId()));

			totalIncomeYearly += yearly;
			g.setLabel(d.getIncomeName());
			g.setData(CommonUtils.convertToK(monthly));
			g.setCategory(d.getIncomeType());
			incomeGraphData.add(g);
		}
		m.addAttribute("incomeData", new Gson().toJson(incomeGraphData));
		m.addAttribute("lstIncome", lstIncome);
		return "cp/myincome";
	}

	@Link(label="Add Income", family="My Cashflow", parent = "My Income" )
	@RequestMapping(value = "/myIncome/addUpdate", method = RequestMethod.GET)
	public String addIncome(FinancialRequest request, Model m, IncomeData income) {
		UserSession user = AuthHandler.getCurrentUser();
		FinancialService service = getBean(FinancialService.class);
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		IncomeData incomeData = new IncomeData();

		List<CodeValueData> freq = service.getCodeValue("63");
		List<CodeValueData> incomeTypes = service.getCodeValue("74");
		populateFreq(m);
         m.addAttribute("incomeTypes", incomeTypes);
		if(request.getIncomeId() <= 0)
        {
			m.addAttribute("incomeData",  new IncomeData());
        	return "cp/myIncome/add";
        }
		else
		{
		 incomeData=service.getIncomeForId(request);
		 m.addAttribute("incomeData", incomeData);
		}
		return "cp/myIncome/add";
	}

	@Link(label="Add Expense", family="My Cashflow", parent = "My Expenses" )
	@RequestMapping(value = "/myExpense/addUpdate", method = RequestMethod.GET)
	public String addExpense(FinancialRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		FinancialService service = getBean(FinancialService.class);
		ExpenseData expense = null;
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
        List<CodeValueData> expenseTypes = service.getCodeValue("75");
        Collections.sort(expenseTypes);
		m.addAttribute("expenseTypes", expenseTypes);
		populateExpensesForm(m, null);
		if(request.getExpenseId() <= 0)
		{
		m.addAttribute("expense", new ExpenseData());
		return "cp/myExpense/add";
		}
		else
		{
		expense = service.getExpenseForId(request);
		m.addAttribute("expense", expense);
		return "cp/myExpense/add";
		}
	}

	@RequestMapping(value = "/myIncome/save", method = RequestMethod.POST)
	public String saveIncome(FinancialRequest req, Model m, IncomeData income,final RedirectAttributes redirectAttributes,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		IncomeData incomeData = null;
		req.setBuId(user.getBuId());
		
			income.setPartyId(user.getPartyId());
			income.setIncomeAmount(income.getIncomeAmount());
			income.setCreatedBy(user.getUserId());
			income.setLastModifiedBy(user.getUserId());
			income.setAnnualIncomeAmount(CommonUtils.calculateAmountYearly(
			income.getIncomeAmount(), income.getIncomeFrequencyId()));
			FinancialService service = getBean(FinancialService.class);
			String action = request.getParameter("action");
			if ("add".equals(action)) {
				
				if(StringUtils.isEmpty(income.getIncomeName())){
					
					income.setIncomeName("");
				}
				service.addUpdateIncome(income);
				redirectAttributes.addFlashAttribute("success",
						getMessage("success.income.add"));
				return "redirect:/financial/myIncome/addUpdate?partyIncomeId="+income.getPartyIncomeId();
				
			} else {
				service.addUpdateIncome(income);
				redirectAttributes.addFlashAttribute("success",
						getMessage("success.income.add"));
			}
			income.setIncomeSubTypeId(0);
		    service.addUpdateIncome(income);
		    redirectAttributes.addFlashAttribute("success",
					getMessage("success.income.add"));
		    return "redirect:/financial/myIncome";
		}
		

	@RequestMapping(value = "/myExpense/save", method = RequestMethod.POST)
	public String saveExpense(FinancialRequest req, Model m,final RedirectAttributes redirectAttributes,
			ExpenseData expense, HttpServletRequest request) {
		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		expense.setPartyID(user.getPartyId());
		expense.setExpenseAmount(expense.getExpenseAmount());
		expense.setAnnualExpenseAmount(CommonUtils.calculateAmountYearly(
					expense.getExpenseAmount(), expense.getExpenseFrequencyID()));
		expense.setCreatedBy(user.getUserId());
		expense.setLastModifiedBy(user.getUserId());
		FinancialService service = getBean(FinancialService.class);
		String action = request.getParameter("action");
		if ("add".equals(action)) {
			
			if(StringUtils.isEmpty(expense.getExpenseName())){
				expense.setExpenseName("");
				/*income.setIncomeName("");*/
			}
			service.addUpdateExpense(expense);
			redirectAttributes.addFlashAttribute("success",
					getMessage("success.expense.add"));
			return "redirect:/financial/myExpense/addUpdate?partyExpenseId="+expense.getPartyExpenseID();
			
		} else {
			service.addUpdateExpense(expense);
			redirectAttributes.addFlashAttribute("success",
					getMessage("success.expense.add"));
		}
		
		
		
		
		
		service.addUpdateExpense(expense);
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.expense.add"));
		return "redirect:/financial/myExpenses";
		
		
	}

	private void populateIncomeForm(Model m, List<IncomeData> incomeList) {
		long totalIncomeYearly = 0;
		if (incomeList != null) {
			for (IncomeData d : incomeList) {
				totalIncomeYearly += CommonUtils.calculateAmountYearly(
						d.getIncomeAmount(), d.getIncomeFrequencyId());
			}
		}
		FinancialService service = getBean(FinancialService.class);
		m.addAttribute("totalIncome",
				CommonUtils.formatAmountINR(totalIncomeYearly));
		List<CodeValueData> incomeTypes = service.getCodeValue("74");
		Collections.sort(incomeTypes);
		m.addAttribute("incomeTypes", incomeTypes );
		populateFreq(m);
	}

	private void populateFreq(Model m) {
		FinancialService service = getBean(FinancialService.class);

		List<CodeValueData> lst = service.getCodeValue("63");
		for (Iterator<CodeValueData> iter = lst.iterator(); iter.hasNext();) {
			CodeValueData cv = iter.next();
			if (!(cv.getCodeValueId() == 63003 || cv.getCodeValueId() == 63006)) {
				iter.remove();
			}
		}
		m.addAttribute("freqList", lst);

	}
	private void populateDcData(Model model ){
		UserSession user=AuthHandler.getCurrentUser();
		PortfolioService service = getBean(PortfolioService.class);
		List<QuestionDetails> lst= service.getDcData(39002, 29,user.getPartyId());
		if(lst!=null){
			
		for(QuestionDetails q:lst){
		if(q.getAttributeCodeId()==94067){
			model.addAttribute("dcIncome", CommonUtils.toDouble(q.getAttributeRefferenceValue()));
			
		}
		
		else if(q.getAttributeCodeId()==94074){
				model.addAttribute("dcExpense", CommonUtils.toDouble(q.getAttributeRefferenceValue()));
			
		}
		
		
	}
		
	}
	
	}

	@RequestMapping(value = "/income/graph", method = RequestMethod.GET)
	public String showIncomeGraph(FinancialRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		FinancialService service = getBean(FinancialService.class);
		List<IncomeData> lstIncome = new ArrayList<IncomeData>();
		lstIncome = service.getListOfIncome(request);
		m.addAttribute("lstIncome", lstIncome);
		populateIncomeGraphData(m, request,lstIncome);

		return "cp/incomegraph";
	}

	@RequestMapping(value = "/expense/graph", method = RequestMethod.GET)
	public String showExpensesGraph(FinancialRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());

		FinancialService service = getBean(FinancialService.class);
		List<ExpenseData> lstExpense = service.getListOfExpense(request);

		populateExpensesGraphData(request, m, lstExpense);
		m.addAttribute("lstExpense", lstExpense);

		return "cp/expensegraph";
	}

	private List<GraphData> populateIncomeGraphData(Model m,
			FinancialRequest request,List<IncomeData> lstIncome) {

//		FinancialService service = getBean(FinancialService.class);
//		List<IncomeData> lstIncome = service.getListOfIncome(request);

		List<GraphData> graphData = new ArrayList<GraphData>();

		long totalIncomeYearly = 0;
		for (IncomeData d : lstIncome) {
			totalIncomeYearly += CommonUtils.calculateAmountYearly(
					d.getIncomeAmount(), d.getIncomeFrequencyId());
		}

		long totalIncomeMonthly = 0;
		for (IncomeData d : lstIncome) {
			GraphData g = new GraphData();
			g.setLabel(d.getIncomeName());

			long monthly = (CommonUtils.calculateAmountMonthly(
					d.getIncomeAmount(), d.getIncomeFrequencyId()));
			totalIncomeMonthly += monthly;
			g.setData(CommonUtils.convertToK(monthly));
			graphData.add(g);
		}

		m.addAttribute("graphData", new Gson().toJson(graphData));
		m.addAttribute("totalMonthlyIncome",CommonUtils.formatAmountINR(totalIncomeMonthly,true));
		m.addAttribute("totalYearlyIncome",CommonUtils.formatAmountINR(totalIncomeYearly,true));

		return graphData;
	}

	private List<GraphData> populateExpensesGraphData(FinancialRequest request,
			Model m, List<ExpenseData> lstExpense) {

		List<GraphData> graphData = new ArrayList<GraphData>();

		long totalExpenseYearly = 0;
		for (ExpenseData d : lstExpense) {
			GraphData g = new GraphData();
			g.setLabel(d.getExpenseName());

			long yearly = CommonUtils.calculateAmountYearly(
					d.getExpenseAmount(), d.getExpenseFrequencyID());
			totalExpenseYearly += yearly;

			g.setData(CommonUtils.convertToK(yearly));
			graphData.add(g);

		}

		long totalExpenseMonthly = 0;
		for (ExpenseData d : lstExpense) {

			long monthly = (CommonUtils.calculateAmountMonthly(
					d.getExpenseAmount(), d.getExpenseFrequencyID()));
			totalExpenseMonthly += monthly;

		}

		m.addAttribute("graphData", new Gson().toJson(graphData));
		m.addAttribute("totalExpenseMonthly",CommonUtils.formatAmountINR(totalExpenseMonthly,true));
		m.addAttribute("totalExpenseYearly",CommonUtils.formatAmountINR(totalExpenseYearly,true));

		return graphData;
	}

	@RequestMapping(value = "/note", method = RequestMethod.GET)
	public String showNote(FinancialRequest request, Model m) {
		m.addAttribute("note", new Note());
		return "cp/note";
	}

	@Link(label="My Expenses", family="My Cashflow", parent = "" ) 
	@RequestMapping(value = "/myExpenses", method = RequestMethod.GET)
	public String showExpenses(FinancialRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		FinancialService service = getBean(FinancialService.class);
		List<ExpenseData> lstExpense = new ArrayList<ExpenseData>();
		lstExpense = service.getListOfExpense(request);
		populateExpensesForm(m, lstExpense);
		populateExpensesGraphData(request, m,lstExpense);
		populateDcData(m);
		m.addAttribute("lstExpense", lstExpense);
		Assumption inflation = service.getInflationRate(request.getPartyId());
		if (inflation == null) {
			inflation = new Assumption();
			inflation.setValue("7");
		}
		if (StringUtils.isEmpty(inflation.getStartRange())) {
			inflation.setStartRange("-10");
		}
		if (StringUtils.isEmpty(inflation.getEndRange())) {
			inflation.setEndRange("10");
		}
		List<GraphData> expensesGraphData = new ArrayList<GraphData>();

		long totalIncomeYearly = 0;
		long totalExpensesYearly = 0;

		for (ExpenseData d : lstExpense) {
			GraphData g = new GraphData();
			g.setLabel(d.getExpenseName());

			long yearly = (CommonUtils.calculateAmountYearly(
					d.getExpenseAmount(), d.getExpenseFrequencyID()));
			long monthly = (CommonUtils.calculateAmountMonthly(
					d.getExpenseAmount(), d.getExpenseFrequencyID()));

			totalExpensesYearly += yearly;
			g.setData(CommonUtils.convertToK(monthly));
			expensesGraphData.add(g);
		}
		m.addAttribute("expensesData", new Gson().toJson(expensesGraphData));

		m.addAttribute("inflationRate", inflation.getValue());
		m.addAttribute("inflationStartRange", inflation.getStartRange());
		m.addAttribute("inflationEndRange", inflation.getEndRange());
		return "cp/myexpenses";
	}

	@RequestMapping(value = "/myFinancials", method = RequestMethod.GET)
	public String myFinancials(FinancialRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		FinancialService service = getBean(FinancialService.class);
		List<FinancialData> lstFinancials = service.getMyFinancials(user
				.getPartyId());
		// populateExpensesForm(m, lstFinancials);
		m.addAttribute("lstFinancials", lstFinancials);

		List<String> categories = new ArrayList<String>();
		List<Long> series1 = new ArrayList<Long>();
		List<Long> series2 = new ArrayList<Long>();
		for (FinancialData d : lstFinancials) {
			categories.add("" + d.getAge());
			series1.add(CommonUtils.convertToK(d.getIncome()) * 1000);
			series2.add(CommonUtils.convertToK(d.getExpenses()) * 1000);
		}
		Series s1 = new Series();
		Series s2 = new Series();
		s1.setData(series1.toArray(new Long[series1.size()]));
		s1.setName("Income");
		s2.setData(series2.toArray(new Long[series2.size()]));
		s2.setName("Expenses");
		List<Series> lst = new ArrayList<Series>();
		lst.add(s1);
		lst.add(s2);
		Gson gson = new Gson();
		m.addAttribute("category", categories);
		m.addAttribute("series", gson.toJson(lst));

		return "widget/myFinancial";
	}

	private void populateExpensesForm(Model m, List<ExpenseData> expList) {
		long totalExpensesYearly = 0;
		if (expList != null) {
			for (ExpenseData d : expList) {
				totalExpensesYearly += CommonUtils.calculateAmountYearly(
						d.getExpenseAmount(), d.getExpenseFrequencyID());
			}
		}

		m.addAttribute("totalExpenses",
				CommonUtils.formatAmountMonthly(totalExpensesYearly));
		FinancialService service = getBean(FinancialService.class);
        List<CodeValueData> expenseTypes = service.getCodeValue("75");
        Collections.sort(expenseTypes);
		m.addAttribute("expenseTypes", expenseTypes);
		populateFreq(m);
	}

	@RequestMapping(value = "/income/delete", method = RequestMethod.GET)
	public String deleteIncome(FinancialRequest request, Model m,final RedirectAttributes redirectAttributes) {

		FinancialService service = getBean(FinancialService.class);

		service.deleteIncome(request);
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.income.delete"));
		return "redirect:/financial/myIncome";
	}
	@RequestMapping(value = "/expense/delete", method = RequestMethod.GET)
	public String deleteExpense(FinancialRequest request, Model m,final RedirectAttributes redirectAttributes) {

		FinancialService service = getBean(FinancialService.class);

		service.deleteExpense(request);
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.expense.delete"));
		return "redirect:/financial/myExpenses";

	}

	/*
	 * @RequestMapping(value = "/myFinancials", method = RequestMethod.GET)
	 * public String showFinancials(FinancialRequest request, Model m) {
	 * 
	 * m.addAttribute("myFinancials", request); return "cp/myFinancials"; }
	 */
	@Link(label="My Savings", family="My Cashflow", parent = "" ) 
	@RequestMapping(value = "/savings", method = RequestMethod.GET)
	public String showSavings(FinancialRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		FinancialService service = getBean(FinancialService.class);
		List<IncomeData> lstIncome = service.getListOfIncome(request);
		List<ExpenseData> lstExpenses = service.getListOfExpense(request);

		List<GraphData> incomeGraphData = new ArrayList<GraphData>();
		List<GraphData> expensesGraphData = new ArrayList<GraphData>();

		long totalIncomeYearly = 0;
		long totalExpensesYearly = 0;

		for (IncomeData d : lstIncome) {
			GraphData g = new GraphData();

			long yearly = (CommonUtils.calculateAmountYearly(
					d.getIncomeAmount(), d.getIncomeFrequencyId()));
			long monthly = (CommonUtils.calculateAmountMonthly(
					d.getIncomeAmount(), d.getIncomeFrequencyId()));

			totalIncomeYearly += yearly;
			g.setLabel(d.getIncomeName());
			g.setData(CommonUtils.convertToK(monthly));
			g.setCategory(d.getIncomeType());
			incomeGraphData.add(g);
		}

		for (ExpenseData d : lstExpenses) {
			GraphData g = new GraphData();
			g.setLabel(d.getExpenseName());

			long yearly = (CommonUtils.calculateAmountYearly(
					d.getExpenseAmount(), d.getExpenseFrequencyID()));
			long monthly = (CommonUtils.calculateAmountMonthly(
					d.getExpenseAmount(), d.getExpenseFrequencyID()));

			totalExpensesYearly += yearly;
			g.setData(CommonUtils.convertToK(monthly));
			expensesGraphData.add(g);
		}
		long totalIncomeMonthly = totalIncomeYearly / 12;
		long totalExpensesMonthly = totalExpensesYearly / 12;

		m.addAttribute("incomeData", new Gson().toJson(incomeGraphData));
		m.addAttribute("expensesData", new Gson().toJson(expensesGraphData));
		m.addAttribute("totalMonthlyIncome",
				CommonUtils.formatAmountINR(totalIncomeMonthly));
		m.addAttribute("totalMonthlyExpenses",
				CommonUtils.formatAmountINR(totalExpensesMonthly));
		m.addAttribute(
				"totalMonthlySaving",
				CommonUtils.formatAmountINR(totalIncomeMonthly
						- totalExpensesMonthly));
		m.addAttribute(
				"totalYearlySaving",
				CommonUtils.formatAmountINR(totalIncomeYearly
						- totalExpensesYearly));
		m.addAttribute("lstIncome", lstIncome);
		m.addAttribute("lstExpenses", lstExpenses);
		m.addAttribute("totalYearlyIncome", totalIncomeYearly);
		m.addAttribute("totalYearlyExpenses", totalExpensesYearly);

		return "cp/savings";
	}

}
