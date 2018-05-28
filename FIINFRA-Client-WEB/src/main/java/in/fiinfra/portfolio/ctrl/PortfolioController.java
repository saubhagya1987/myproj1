package in.fiinfra.portfolio.ctrl;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductPurchaseURLs;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ActionPlanData;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.Logger;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.cp.AchievementScaleData;
import in.fiinfra.cp.AllocationData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.PlanData;
import in.fiinfra.cp.common.CpConstants;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.model.AssetRequest;
import in.fiinfra.cp.common.model.CommonRequest;
import in.fiinfra.cp.common.model.FinancialRequest;
import in.fiinfra.cp.common.model.GraphData;
import in.fiinfra.cp.common.model.PortfolioRequest;
import in.fiinfra.cp.common.service.CommonService;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.cp.common.util.Link;
import in.fiinfra.financial.Service.FinancialService;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.portfolio.DashboardAjax;
import in.fiinfra.portfolio.PortfolioSummary;
import in.fiinfra.portfolio.service.PortfolioService;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

@Controller
@RequestMapping("/portfolio")
public class PortfolioController extends AbstractController {

	
	final String BUY_ONLINE = "My Plan";

	@Link(label="My Goals", family="My Goals", parent = "" )
	@RequestMapping(value = "/myGoals", method = { RequestMethod.GET })
	public String showGoals(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());

		PortfolioService service = getBean(PortfolioService.class);
		List<GoalData> goalData = service.getListOfGoals(request);
		m.addAttribute("goalData", goalData);
		//m.addAttribute("goalData", new ArrayList<GoalData>());
		//populateGoalGraphData(goalData, m);
		return "cp/mygoals";
	}

	@InitBinder
    public void initBinder(WebDataBinder binder) {
       binder.registerCustomEditor(Integer.TYPE,new MyCustomNumberEditor(Integer.class));
       binder.registerCustomEditor(Long.TYPE,new MyCustomNumberEditor(Long.class));
       binder.registerCustomEditor(Float.TYPE,new MyCustomNumberEditor(Float.class));
    }
	
	public class MyCustomNumberEditor extends CustomNumberEditor {

	    public MyCustomNumberEditor(Class<? extends Number> numberClass) throws IllegalArgumentException {
	        super(numberClass, true);
	    }

	    @Override
	    public void setAsText(String text) throws IllegalArgumentException {
	        if (StringUtils.isEmpty(text)) {
	            setValue(0);
	        }else {
	            super.setAsText(text.trim());
	        }
	    }
	}
	

	@RequestMapping(value = "/myGoals/initiate", method = { RequestMethod.GET })
	public String initiateGoals(PortfolioRequest request, Model m,
			GoalData goal, RedirectAttributes redirectAttributes,
			HttpServletRequest servletRequest) {
		UserSession user = AuthHandler.getCurrentUser();
		PortfolioService service = getBean(PortfolioService.class);
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		List<GoalData> goalData = service.getListOfGoals(request);
		for(GoalData g:goalData){
		if(goal.getId().equals(g.getId())){
			goal.setPartyId(g.getPartyId());
			goal.setGoalName(g.getGoalName());
			goal.setGoalTypeId(g.getGoalTypeId());
			goal.setGoalTypeName(g.getGoalTypeName());
			goal.setGoalAmountFv(g.getGoalAmountFv());
			goal.setGoalAmountPv(g.getGoalAmountPv());
			goal.setGoalPriorityId(g.getGoalPriorityId());
			goal.setGoalStatusId(g.getGoalStatusId());
			goal.setGoalStartYear(g.getGoalStartYear());
			goal.setGoalEndYear(g.getGoalEndYear());
	
		}
		}
		Calendar cal=Calendar.getInstance();
		cal.add(Calendar.DAY_OF_YEAR, 3);
		Task task=new Task();
		task.setOriginatedPartyId(user.getPartyId());
		task.setOwnerPartyId(user.getPartyId());
		task.setTargetPartyId(user.getPartyId());
		task.setDueDateTime(new Timestamp(cal.getTimeInMillis()));
		task.setDueDateTimeString(CommonUtils.format(cal.getTime(),	"dd-MM-yy"));
		task.setStatusId(19001);
		task.setCategoryId(17003);
		task.setPriorityId(18003);
		task.setTargetContactTypeId(user.getPartyTypeId());
		task.setSubject(user.getName()+ " has initiated request for goal");
		task.setDescription(user.getName()
				+ " has initiated the request for following goal "
				+ goal.getGoalName() + " "
				+ CommonUtils.emptyIfNull(goal.getStartYear()) + ""
				+ CommonUtils.emptyIfNull(goal.getGoalAmountPv()));
		task.setCompletionDateTimeString("");
		task.setCreatedBy(user.getUserId()); 
		
		service.saveTask(task);
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.goal.inform"));
		
		Notification notification=new Notification();
        Map<String,String> payloadMap=new HashMap<String, String>();
        payloadMap.put("user", user.getName());
        payloadMap.put("goal name",goal.getGoalName());
        payloadMap.put("GoalName",goal.getGoalName());
//        payloadMap.put("Password",map.getValue());
         
        notification.setSourceSystemID(user.getSourceSystemId());
        notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notification.setNotifyPartyID(user.getPartyId());
        notification.setNotifyEventID(FiinfraConstants.EVENT_CP_INITIATE_GOAL);
        notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
        notification.setBuId(user.getBuId());
        notification.setPayloadMap(payloadMap);
        
      //  notification.setAttachment1DocumentID(doc.getDocumentId());
        notification.setSessionID(servletRequest.getSession().getId());
        FrameworkUtil.notify(notification);
		
		return "redirect:/portfolio/myGoals";	
	}
	
	@RequestMapping(value = "/myGoals/graph", method = { RequestMethod.GET})
	public String showGoalsGraph(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(27641);
		request.setBuId(user.getBuId());

		PortfolioService service = getBean(PortfolioService.class);
		List<GoalData> goalData = service.getListOfGoals(request);
		m.addAttribute("goalData", goalData);
		
		List<GraphData> graphData = new ArrayList<GraphData>();

		for (GoalData goal : goalData) {
			GraphData g = new GraphData();
			g.setLabel(goal.getGoalName());
			g.setData(CommonUtils.convertToLac(Long.parseLong(goal
					.getGoalAmountPv())));
			graphData.add(g);
		}
		m.addAttribute("graphData", new Gson().toJson(graphData));
		
		return "widget/goals";
	}

	@RequestMapping(value = "/achievementScale", method = { RequestMethod.GET})
	public String showAchievementScale(PortfolioRequest request, Model m){
		
		return "widget/achievementScale";
	}
	
	@RequestMapping(value = "/dashboard/ajax", method = { RequestMethod.GET})
	public @ResponseBody
	DashboardAjax getDashBoardData() {
		DashboardAjax data = new DashboardAjax();
		data.setNetWorth(getNetworthData());
		data.setGoalData(getGoalData());
		data.setEarningExpenses(getEarningExpensesData());
		data.setAchivementScale(getAchievementScaleData());
		return data;
	}
	
	public Object getAchievementScaleData() {
		PortfolioRequest request=new PortfolioRequest();
		UserSession user=AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		
		PortfolioService service=getBean(PortfolioService.class);
		AchievementScaleData a= service.getAchievementScale(request);
		
		Object[] data = new Object[7];
		data[0]=a.getGoalScale();
		data[1]=a.getRiskScale();
		data[2]=a.getSuccessionScale();
		data[3]=a.getTotalScale();
		data[4]=a.isInvestmentKnown();
		data[5]=a.isMoneyKnown();
		data[6]=a.isWillPrepared();			
		
		return data;

	}
	
	public Object getEarningExpensesData() {
		UserSession user = AuthHandler.getCurrentUser();
		FinancialRequest request = new FinancialRequest();
		request.setPartyId(user.getPartyId());
		FinancialService service = getBean(FinancialService.class);
		List<FinancialData> lstFinancials = service.getMyFinancials(user
				.getPartyId());

		ObjectMapper mapper = new ObjectMapper();
		ArrayNode array =  mapper.createArrayNode();
		{
			ArrayNode title = mapper.createArrayNode();
			title.add("Age");
			title.add("Income");
			title.add("Expenses");
			array.add(title);
		}	
		
		for (FinancialData d : lstFinancials) {
			ArrayNode value = mapper.createArrayNode();
			value.add(d.getAge());
			value.add(d.getIncome());
			value.add(d.getExpenses());
			array.add(value);
		}
		Object[] data = new Object[6];
		data[0] = array;

		List<ExpenseData> lstExpense = service.getListOfExpense(request);
		List<IncomeData> lstIncome = service.getListOfIncome(request);
//		FinancialData f=new FinancialData();
		long income = populateIncomeGraphData(data, request, lstIncome);
		long expenses = populateExpensesGraphData( request, data,lstExpense);
		long saving = income-expenses;
		//f.setIncome(populateIncomeGraphData(data, request, lstIncome));		
//		f.setExpenses(expenses);
		List<GraphData> lstSaving=new ArrayList<GraphData>(); 
		GraphData g1=new GraphData();
		// g1.setData(CommonUtils.convertToK(populateIncomeGraphData(data,
		// request, lstIncome)-populateExpensesGraphData(request, data,
		// lstExpense)));
//		g1.setLabel("My Saving");
		g1.setData(income);
		g1.setLabel("Earning");
		GraphData g2=new GraphData();
		g2.setData(expenses);
		g2.setLabel("Expenses");
		lstSaving.add(g1);
		lstSaving.add(g2);
		data[1] =lstSaving;
		data[2] =CommonUtils.formatAmountINR(saving);
		data[3] = CommonUtils.emptyIfNull(CommonUtils.formatAmountINR(income));
		data[4] = CommonUtils.emptyIfNull(CommonUtils.formatAmountINR(expenses));
		return data;
	}
	
	private long populateIncomeGraphData(Object[] data,
			FinancialRequest request,List<IncomeData> lstIncome) {

		List<GraphData> graphData = new ArrayList<GraphData>();

		long totalIncomeYearly = 0;
		for (IncomeData d : lstIncome) {
			totalIncomeYearly += CommonUtils.calculateAmountYearly(
					d.getIncomeAmount(), d.getIncomeFrequencyId());
		}

		return totalIncomeYearly;

	}

	private long populateExpensesGraphData(FinancialRequest request,
			Object[] data, List<ExpenseData> lstExpense) {

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

		return totalExpenseYearly;
	}

	private Object getGoalData(){
		UserSession user = AuthHandler.getCurrentUser();

		PortfolioRequest request = new PortfolioRequest();
		//todo hardcoded remove it once we have data
		request.setPartyId(user.getPartyId());

		PortfolioService service = getBean(PortfolioService.class);
		List<GoalData> goalData = service.getListOfGoals(request);
		
		List<GraphData> graphData = new ArrayList<GraphData>();

		StringBuilder latestGoal = new StringBuilder();
		Calendar cal =  Calendar.getInstance();
		int latestYr = cal.get(Calendar.YEAR); 
		long totalGoalValue =0;
		
		Comparator<GoalData> sort = new Comparator<GoalData>() {

			@Override
			public int compare(GoalData a1, GoalData a2) {
				if(a1.getGoalStartYear() ==null){
					return 1;
				}
				if(a2.getGoalStartYear() ==null){
					return -1;
				}

				return a1.getGoalStartYear().compareTo(a2.getGoalStartYear());
			}
			
		};
		Collections.sort(goalData,sort);
		
		int achievedGoalsCount=0;
		int achievableGoals=0;
		double regularInvestAmount=0;
		
		double achivableWeightedTotal= 0;
		double achivableTotal = 0;
		
		for (GoalData goal : goalData) {
			double pv = CommonUtils.toDouble(goal.getGoalAmountPv());
			double fv = CommonUtils.toDouble(goal.getGoalAmountFv());
			
			GraphData g = new GraphData();
			g.setLabel(goal.getGoalName());
			
			g.setData((long)pv);
			graphData.add(g);
			totalGoalValue += fv;
			
			if (goal.getGoalStartYear() != null
					&& goal.getGoalStartYear().intValue() >= cal
							.get(Calendar.YEAR) && latestGoal.length() == 0) {
				
				if(latestYr != goal.getGoalStartYear().intValue()){
					latestGoal.setLength(0);
				}
				
				if(latestGoal.indexOf(goal.getGoalName()) <=0){
					if(latestGoal.length() >0){
						latestGoal.append(",");
					}
					latestGoal.append(goal.getGoalName()).append(" ")
							.append(goal.getGoalStartYear());
				}
				latestYr = goal.getGoalStartYear();
			}
			
			double perCompleted = CommonUtils.toDouble(goal
					.getGoalCompletedPercent());
			
			if(((int)perCompleted) == 100){
				achievedGoalsCount++;
			}
			if (perCompleted>80 && perCompleted<100){
				achievableGoals++;
				achivableWeightedTotal += CommonUtils
						.multiply(fv, perCompleted);
				achivableTotal += fv;
			}
			
			if (perCompleted<=80 ){
				regularInvestAmount += CommonUtils.toDouble(goal
						.getRegularInvestAmt());
				
			}
			
		}	
		String latestCompletedGoal="";
		String upComingGoal="";
		for(GoalData g:goalData){
			if (g.getGoalStartYear().intValue() <= cal.get(Calendar.YEAR)
					&& g.getGoalStatusId() == 71005) {
				latestCompletedGoal = g.getGoalName() + " ("
						+ g.getGoalStartYear() + ")";
				break;
			} else if (g.getGoalStartYear().intValue() >= cal
					.get(Calendar.YEAR) && g.getGoalStatusId() != 71005) {
				upComingGoal = g.getGoalName() + " (" + g.getGoalStartYear()
						+ ")";
				break;
			}
		}
		
		Object[] data = new Object[10];
		data[0] = graphData;
		data[1] = goalData;
		data[2] = CommonUtils.formatAmountINR(totalGoalValue);
		data[3] = upComingGoal;
		data[4] = latestCompletedGoal;
		data[5] = achievedGoalsCount;
		data[6]=achievableGoals;
		data[7]=CommonUtils.formatAmountINR(regularInvestAmount);
		data[8]=CommonUtils.divide(achivableWeightedTotal, achivableTotal);
		data[9]=goalData.size();
		
		return data;
	}
	
	private Object getNetworthData(){
		
		UserSession user = AuthHandler.getCurrentUser();
		PortfolioService service = getBean(PortfolioService.class);
		
		PortfolioRequest request = new PortfolioRequest();
		request.setPartyId(user.getPartyId());
		
		List<AssetData> lstAsset = service.getListOfPortfolio(request);
		//m.addAttribute("my-portfolio", request);
		List<LoanData> loanData=service.getListOfLoan(request);
		Map<Integer,AssetData> map=new HashMap<Integer, AssetData>();
		Map<Integer,GraphData> mapGraph=new HashMap<Integer, GraphData>();
		
		List<GraphData> graphList=new ArrayList<GraphData>();
		List<GraphData> loanGraph=new ArrayList<GraphData>();
		
		List<AssetData> displayLst = new ArrayList<AssetData>();
		
		
			
			
		Map<String,List<AssetData>> mapAsset=new HashMap<String,List<AssetData>>();

		for(AssetData asset:lstAsset){
			final String key = getAssetKey(asset);
			if(!StringUtils.isEmpty(key)){
			List<AssetData> parent= mapAsset.get(key);
			if(parent==null){
				parent=new ArrayList< AssetData>();
				mapAsset.put(key, parent);
			}
			
			parent.add(asset);
			}

		}
		 List<GraphData> lstGraph = new ArrayList<GraphData>();
		Map<String,Long> valueMap = new HashMap<String,Long>();
		
		 for(Map.Entry<String, List<AssetData>> entry:mapAsset.entrySet()){
			  String title = entry.getKey();
			  
			
		   for(AssetData asset:entry.getValue()){
				String newTitle = "";
				long value = asset.getCurrentValue();
				   
				if (StringUtils.equals(entry.getKey(), "FD")
						|| StringUtils.equals(entry.getKey(), "RD")
						|| StringUtils.equals(entry.getKey(), "SAVING")) {
					newTitle = "Deposits";
					   
					if (StringUtils.equals(entry.getKey(), "FD")) {
						value = asset.getMaturityAmount();
					} else if (StringUtils.equals(entry.getKey(), "RD")) {

						value = getFVForRD(
								asset.getSipAmount(),
								asset.getInterestRate(),
								getMonthsDifference(asset.getInvestmentDate(),
										new Date()));
		    }
			   
			   }
				else if(StringUtils.equals(entry.getKey(), "MF")){
					newTitle = "Mutual Fund";
				}
				else if(StringUtils.equals(entry.getKey(), "STOCK")){
					newTitle = "Stock";
				}
				else if(StringUtils.equals(entry.getKey(), "PROPERTY")){
					newTitle = "Property";
				}
				else if(StringUtils.equals(entry.getKey(), "GOLD")){
					newTitle = "Gold";
				}
				else if(StringUtils.equals(entry.getKey(), "EPF") || StringUtils.equals(entry.getKey(), "PPF")){
					newTitle = "Retirement Fund";
				}
		      else{
					newTitle = entry.getKey();
		    }

				
				Long oldValue = valueMap.get(newTitle);
				if(oldValue ==null){
					oldValue = 0l;
		   }
				oldValue += value;
		   
				valueMap.put(newTitle, oldValue);
		      
			}
		}
		   
		long totalAsset = 0;
		for(Map.Entry<String, Long> entry:valueMap.entrySet()){
		   GraphData data = new GraphData();
			data.setCategory(entry.getKey());
			data.setLabel(entry.getKey());
			data.setData(entry.getValue());
		   lstGraph.add(data);
			totalAsset+= entry.getValue();
		  }
		  //m.addAttribute("lstGraph", lstGraph);
		  //m.addAttribute("graphData",new Gson().toJson(lstGraph));
		  
		long totalLoan=0;
		for(LoanData l:loanData ){
			
			GraphData graph=new GraphData();
			graph.setLabel(l.getLoanType());
			graph.setData(l.getLoanAmount());
			loanGraph.add(graph);
			totalLoan+=l.getLoanAmount();
		}
		
		Object[] data = new Object[6];
		data[0] = lstGraph;
		data[1] = loanGraph;
		data[2] = CommonUtils.formatAmountINR(totalLoan);
		data[3] = CommonUtils.formatAmountINR(totalAsset);
	    data[4] = CommonUtils.formatAmountINR(totalAsset - totalLoan);
		return data;
	}
	@Link(label="My plans", family="My Portfolio", parent = "" )
	@RequestMapping(value = "/myPlans", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showPlans(PortfolioRequest request, Model m) {
		try {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
			List<ProductPurchaseURLs> productsOnline = null ;
		PortfolioService service = getBean(PortfolioService.class);
		List<PlanData> planData = service.getPlans(request);
			String product = "";
			for(PlanData p:planData){
			for(AllocationData a:p.getAllocation())
			{	
				product = product+a.getProductId()+",";
			}
			}
			request.setProductsId(product);
			request.setPartnerPartyId(user.getOwnerId());
			request.setSettingTypeID(146003);
			request.setExecutionId(null);
			productsOnline = service.getPlansOnline(request);
			List<ProductPurchaseURLs> URLjson = new ArrayList<>();
			  List<ProductPurchaseURLs> productsURLs = new ArrayList<>();
			  ObjectMapper objectMapper = new ObjectMapper();
			   URLjson = objectMapper.readValue(objectMapper.writeValueAsString(productsOnline), List.class);
			   for (int i=0;i<URLjson.size()-1;++i) {
			    productsURLs.add(objectMapper.readValue(objectMapper.writeValueAsString(URLjson.get(i)), ProductPurchaseURLs.class));
			  
			  }
		m.addAttribute("planData", planData);
			m.addAttribute("productsOnline", productsURLs);
			
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "cp/myPlans";
	}
	
	@Link(label="My Loan", family="My Portfolio", parent = "My Assets" )
	@RequestMapping(value = "/myLoan", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showLoan(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		PortfolioService service = getBean(PortfolioService.class);
		List<LoanData> loanData = service.getListOfLoan(request);
		m.addAttribute("loanData", loanData);
		List<GraphData> loanGraph=new ArrayList<GraphData>();
		long totalEmi=0;
		long totalLoanAmount=0;
		for(LoanData l:loanData ){
			
			GraphData graph=new GraphData();
			graph.setLabel(l.getLoanType());
			graph.setData(CommonUtils.convertToK(l.getLoanAmount()));
			loanGraph.add(graph);
			totalEmi += CommonUtils.calculateAmountMonthly(l.getEmiAmount(),
					l.getEmiFreqId());
			totalLoanAmount +=l.getLoanAmount();
		}
		populateLoanForm(m, loanData);
		populateDcAssetData(m);
		m.addAttribute("loanGraph", new Gson().toJson(loanGraph));
		m.addAttribute("totalEmi",CommonUtils.formatAmountINR(totalEmi,true));
		m.addAttribute("totalLoanAmount",
				CommonUtils.formatAmountINR(totalLoanAmount, true));
		return "cp/myLoan";
	}
	
	private void populateLoanForm(Model m, List<LoanData> loanList) {
		FinancialService service = getBean(FinancialService.class);
		List<CodeValueData> loanTypes = service.getCodeValue("76");
		Collections.sort(loanTypes);
		m.addAttribute("loanTypes", loanTypes);
		List<CodeValueData> lst = service.getCodeValue("63");
		Collections.sort(lst);
		for (Iterator<CodeValueData> iter = lst.iterator(); iter.hasNext();) {
			CodeValueData cv = iter.next();
			if (!(cv.getCodeValueId() == 63003 || cv.getCodeValueId() == 63006
					|| cv.getCodeValueId() == 63004 || cv.getCodeValueId() == 63005)) {
				iter.remove();
			}
		}
		m.addAttribute("freqList", lst);
	}
	
	@RequestMapping(value = "/myLoan/save", method = RequestMethod.POST)
	public String saveLoan(PortfolioRequest req, Model m, LoanData loan,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		loan.setPartyId(user.getPartyId());
		loan.setCreatedBy(user.getUserId());
		loan.setLastModifiedBy(user.getUserId());

		String action = request.getParameter("action");
		if ("del".equals(action)) {
			req.setLoanId(loan.getPartyLoanId());
			deleteLoan(req, m);
			return "0";
		} else {

			PortfolioService service = getBean(PortfolioService.class);
			service.addUpdateLoan(loan);
			return "redirect:/portfolio/myLoan";
		}
		
	}
	
	@RequestMapping(value = "/myFinancialAccount/save", method = RequestMethod.POST)
	public String saveAccount(PortfolioRequest req, Model m,
			FinancialAccountData financialAccountData,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		financialAccountData.setPartyId(user.getPartyId().toString());
		financialAccountData.setCreatedBy(user.getUserId());
		PortfolioService service = getBean(PortfolioService.class);
		 service.saveFinancialAccount(financialAccountData);
		 return "redirect:/portfolio/asset/addUpdate/?assetClassId=48011";
	}
	@Link(label="Add Account", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/myFinancialAccount/add", method = RequestMethod.GET)
	public String addAccount(PortfolioRequest req, Model m,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();
		m.addAttribute("account", new FinancialAccountData());
		return "cp/account/add";
		
	}
	
	
	@RequestMapping(value = "/sendToIFA", method = RequestMethod.GET)
	public String sendToIFA(PortfolioRequest req, Model m,
			HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();
		Notification notification=new Notification();
        Map<String,String> payloadMap=new HashMap<String, String>();
        payloadMap.put("user", user.getName());
//        payloadMap.put("Password",map.getValue());
         
        notification.setSourceSystemID(user.getSourceSystemId());
        notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notification.setNotifyPartyID(user.getPartyId());
        notification.setNotifyEventID(FiinfraConstants.EVENT_CP_INFORM_IFA);
        notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
        notification.setBuId(user.getBuId());
        notification.setPayloadMap(payloadMap);
      //  notification.setAttachment1DocumentID(doc.getDocumentId());
        notification.setSessionID(request.getSession().getId());
        FrameworkUtil.notify(notification);

		m.addAttribute("account", new FinancialAccountData());
		if(StringUtils.equals(req.getIfa(), "income") ){
			return "redirect:/financial/myIncome";
		}
		else if(StringUtils.equals(req.getIfa(), "expense")){
			return "redirect:/financial/myExpenses";
		}
		else if(StringUtils.equals(req.getIfa(), "loan")){
			return "redirect:/portfolio/myLoan";
		}
		else if(StringUtils.equals(req.getIfa(), "stock")||StringUtils.equals(req.getIfa(), "retirement")||StringUtils.equals(req.getIfa(), "deposits")||StringUtils.equals(req.getIfa(), "mf")||StringUtils.equals(req.getIfa(), "property")){
			return "redirect:/portfolio/myAssets";	
		}
		
		return "redirect:/portfolio/myAssets";
		
	}
	
	@RequestMapping(value = "/myLoan/delete", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String deleteLoan(PortfolioRequest request, Model m) {
		PortfolioService service = getBean(PortfolioService.class);
		service.deleteLoan(request);
		return "redirect:/portfolio/myLoan";
	}
	
	@RequestMapping(value = "/myPlans/approve", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String approvePlans(Model m, PortfolioRequest request,
			HttpServletRequest servletRequest,final RedirectAttributes redirectAttributes) {
		
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		PortfolioService service = getBean(PortfolioService.class);
		String approve=service.approvePlans(request);
		Notification notification=new Notification();
        Map<String,String> payloadMap=new HashMap<String, String>();
        payloadMap.put("user", user.getName());
//        payloadMap.put("Password",map.getValue());
         
        notification.setSourceSystemID(user.getSourceSystemId());
        notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notification.setNotifyPartyID(user.getPartyId());
        notification.setNotifyEventID(416);
        notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
        notification.setBuId(user.getBuId());
        notification.setPayloadMap(payloadMap);
      //  notification.setAttachment1DocumentID(doc.getDocumentId());
        notification.setSessionID(servletRequest.getSession().getId());
        FrameworkUtil.notify(notification);
        
		redirectAttributes.addFlashAttribute("success",
				getMessage("plan.approval"));

		return "redirect:/portfolio/myPlans";
	}

	@RequestMapping(value = "/myPlans/buyOnline", method = RequestMethod.GET)
	public @ResponseBody String productOnline(PortfolioRequest request, Model m,
			ActionPlanData planData) {
		UserSession user = AuthHandler.getCurrentUser();
		
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		String eventTextXML="usp_DIY_getProductsPurchaseLinks("+user.getOwnerId()+","+request.getProductsId()+","+146003+","+request.getExecutionId()+")";
		/*logger.info("eventTextXML========="+eventTextXML);*/
		Audit audit = new Audit();
		audit.setActionByPartyId(user.getPartyId());
		/*audit.setObjectName(String.valueOf(opPartyId));*/
		audit.setActionByUserID(user.getUserId());
		audit.setEventID(FiinfraConstants.EVENT_CP_BUY_PRODUCTS_ONLINE);
		audit.setSourceSystemID(FiinfraConstants.CLIENT_PORTAL);
		audit.setSourceModule(BUY_ONLINE);
		audit.setSourceScreen("Mp Plans Buy Product Online");
		audit.setEventTextXML(eventTextXML);
		FrameworkUtil.audit(audit);
		return "cp/myPlans";

	}
	
	@RequestMapping(value = "/myPortfolio/graph", method = RequestMethod.POST)
	public String portfolioGraph(PortfolioRequest request, Model m,
			ActionPlanData planData) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		PortfolioService service = getBean(PortfolioService.class);
		
		return "cp/myPlans";

	}

	@Link(label="My Assets", family="My Assets", parent = "" )
	@RequestMapping(value = "/myPortfolio", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showPortfolio(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		PortfolioService service = getBean(PortfolioService.class);
		
		List<AssetData> lstAsset = service.getListOfPortfolio(request);
		
		Comparator<AssetData> comparator = new Comparator<AssetData>() {

			@Override
			public int compare(AssetData a1, AssetData a2) {
				return a1.getAssetTypeId().compareTo(a2.getAssetTypeId());
			}
			
		};
		
		//populateDcAssetData(m);
		
		Collections.sort(lstAsset,comparator);
		
		Map<Integer,AssetData> map=new HashMap<Integer, AssetData>();
		Map<Integer,GraphData> mapGraph=new HashMap<Integer, GraphData>();
		
		List<AssetData> displayLst = new ArrayList<AssetData>();
		List<GraphData> graphList=new ArrayList<GraphData>();
		long currentValTotal=0;
		long netAsest = 0;
		long netInvestment = 0;
		for(AssetData asset:lstAsset){
			AssetData parent=map.get(asset.getAssetTypeId());
			GraphData graph = mapGraph.get(asset.getAssetTypeId());
			if(parent == null){
				parent = new AssetData();
				graph = new GraphData();
				graph.setFormatData(new ArrayList());
				graph.setLabel(asset.getAssetType());
				parent.setAssetTypeId(asset.getAssetTypeId());
				parent.setAssetType(asset.getAssetType());
				parent.setAssetType(asset.getAssetType());
				parent.setAssetTypeId(asset.getAssetTypeId());
				map.put(parent.getAssetTypeId(), parent);
				mapGraph.put(parent.getAssetTypeId(), graph);
				displayLst.add(parent);
				graphList.add(graph);
				
			}
			netInvestment += asset.getInvestmentValue();
			netAsest += asset.getCurrentValue();
			
//			long amoutToAdd = 0;
//			if(Integer.valueOf(46004).equals(asset.getAssetClassId())){
//				amoutToAdd=asset.getInvestmentValue();
//			}
//			else{
//				amoutToAdd=asset.getSipAmount();
//			}
//			amoutToAdd=asset.getInvestmentValue();
			parent.setInvestmentValue(parent.getInvestmentValue()
					+ asset.getInvestmentValue());
			graph.setData(CommonUtils.convertToK(parent.getInvestmentValue()));
			
			PortfolioSummary summary = new PortfolioSummary();
			summary.setCurrentValue(Long.toString(asset.getCurrentValue()));
			summary.setProduct(asset.getAssetName());
			summary.setInvestement(Long.toString(asset.getInvestmentValue()));
			graph.getFormatData().add(summary);
			parent.setCurrentValue(parent.getCurrentValue()
					+ asset.getCurrentValue());
			
			for(GoalData g:asset.getGoals()){
				boolean found = false;
				for(GoalData gp:parent.getGoals()){
					if(gp.getFpGoalId().equals(g.getFpGoalId())){
						found = true;
						break;
					}
				}
				if(!found){
					
					parent.addGoal(g);
					//GoalSummary goalSummary=new GoalSummary();
					
				}
			}
			
			displayLst.add(asset);
			currentValTotal+=asset.getCurrentValue();
			
		}
		
		m.addAttribute("assetList", displayLst);
		m.addAttribute("netInvestment",netInvestment);
		
		m.addAttribute("graphData",new Gson().toJson(graphList) );
		m.addAttribute("currentValTotal", currentValTotal);
		m.addAttribute("netAssest", netAsest);
		
		return "cp/myPortfolio";
	}

	@Link(label="Mutual Fund", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/asset/mutualFund", method = {	RequestMethod.GET})
	public String addMutualFund(AssetRequest request, Model m) { 
		
		return addAssets(request, m);
	}
	@Link(label="Bank Deposit", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/asset/bankDeposit", method = {	RequestMethod.GET})
	public String addBankDeposit(AssetRequest request, Model m) { 
		
		return addAssets(request, m);
	}
	@Link(label="Retirement Fund", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/asset/retirementFund", method = {	RequestMethod.GET})
	public String addRetirementFund(AssetRequest request, Model m) { 
		
		return addAssets(request, m);
	}
	@Link(label="Gold", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/asset/gold", method = {	RequestMethod.GET})
	public String addGold(AssetRequest request, Model m) { 
		
		return addAssets(request, m);
	}
	@Link(label="Property", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/asset/property", method = {	RequestMethod.GET})
	public String addProperty(AssetRequest request, Model m) { 
		
		return addAssets(request, m);
	}
	@Link(label="Stock", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/asset/stock", method = {	RequestMethod.GET})
	public String addStock(AssetRequest request, Model m) { 
		
		return addAssets(request, m);
	}
	@Link(label="Add Asset", family="My Assets", parent = "My Assets" )
	@RequestMapping(value = "/asset/addUpdate", method = {	RequestMethod.GET})
	public String addAssets(AssetRequest request, Model m) { 
		UserSession user = AuthHandler.getCurrentUser();
		
		AssetData asset = null;
		request.setPartyId(user.getPartyId());
		if(request.getAssetId() ==null){
			asset = new AssetData();
			asset.setAssetTypeId(request.getAssetClassId());
			
		} else {
			PortfolioService service=getBean(PortfolioService.class);
			asset=service.getAsset(request);
			m.addAttribute("key", asset.getAssetTypeId());
			m.addAttribute("assetId", asset.getPartyAssetId());
		}
		
		String key = getAssetKey(asset);
		populateFamilyMembers(request, m, asset);
		populatetrxType(m);
		m.addAttribute("assetData", asset);
		m.addAttribute("bankDeposit", asset);
		populateFreq(m);
		if("MF".equalsIgnoreCase(key)){
			return "cp/mutualFund";
		} else if ("PROPERTY".equalsIgnoreCase(key)) {
			
			return "cp/property";
		}
		
		else if("STOCK".equalsIgnoreCase(key)){
			return "cp/stock";
		} else if ("GOLD".equalsIgnoreCase(key)) {
			return "cp/gold";
		}
		
		else if("FD".equalsIgnoreCase(key)){
			return "cp/bankDeposits";
		} else if ("RD".equalsIgnoreCase(key)) {
			return "cp/bankDeposits";
		} else if ("SAVING".equalsIgnoreCase(key)) {
			return "cp/bankDeposits";
		} else if ("EPF".equalsIgnoreCase(key)) {
			
			return "cp/retirement";
		} else if ("PPF".equalsIgnoreCase(key)) {
			
			return "cp/retirement";
		}
		return "";
	}
     
	private void populatetrxType(Model m) {
		FinancialService service = getBean(FinancialService.class);

		List<CodeValueData> lst = service.getCodeValue("502");
		for (Iterator<CodeValueData> iter = lst.iterator(); iter.hasNext();) {
			CodeValueData cv = iter.next();
			if (!(cv.getCodeValueId() == 502010 || cv.getCodeValueId() == 502014)) {
				iter.remove();
			}
		}
		m.addAttribute("transList", lst);

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
	@Link(label="My Assets", family="My Assets", parent = "" )
	@RequestMapping(value = "/myAssets", method = {	RequestMethod.GET })
	public String showAssets(PortfolioRequest request, Model m) { 
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		PortfolioService service=getBean(PortfolioService.class);
		List<AssetData> lstAsset = service.getListOfPortfolio(request);
		Map<String,List<AssetData>> mapAsset=new HashMap<String,List<AssetData>>();
		 
		for(AssetData asset:lstAsset){
			final String key = getAssetKey(asset);
			if(!StringUtils.isEmpty(key)){
			List<AssetData> parent= mapAsset.get(key);
			if(parent==null){
				parent=new ArrayList< AssetData>();
				mapAsset.put(key, parent);
			}
			
			parent.add(asset);
			}

		}
		populateDcAssetData(m);
		populateAssetGraph(m, request, lstAsset,mapAsset);
		
		m.addAttribute("mapAsset", mapAsset);
		m.addAttribute("my-assets", request);
		return "cp/myAssets";
	}
	
	private void populateAssetGraph(Model m, PortfolioRequest request,
			List<AssetData> lstAssets, Map<String, List<AssetData>> mapAsset) {
		
		 List<GraphData> lstGraph = new ArrayList<GraphData>();
		Map<String,Long> valueMap = new HashMap<String,Long>();
		
		  for(Map.Entry<String, List<AssetData>> entry:mapAsset.entrySet()){
			  String title = entry.getKey();
			  
			 
		   for(AssetData asset:entry.getValue()){
				String newTitle = "";
				long value = asset.getCurrentValue();
				   
				if (StringUtils.equals(entry.getKey(), "FD")
						|| StringUtils.equals(entry.getKey(), "RD")
						|| StringUtils.equals(entry.getKey(), "SAVING")) {
					newTitle = "Deposits";
					   
			 if(StringUtils.equals(entry.getKey(), "FD")){
						value = asset.getMaturityAmount();
					} else if (StringUtils.equals(entry.getKey(), "RD")) {

						value = getFVForRD(
								asset.getSipAmount(),
								asset.getInterestRate(),
								getMonthsDifference(asset.getInvestmentDate(),
										new Date()));
		    }
				
		    }
				else if(StringUtils.equals(entry.getKey(), "MF")){
					newTitle = "Mutual Fund";
		    }
				else if(StringUtils.equals(entry.getKey(), "STOCK")){
					newTitle = "Stock";
				}
				else if(StringUtils.equals(entry.getKey(), "PROPERTY")){
					newTitle = "Property";
				}
				else if(StringUtils.equals(entry.getKey(), "GOLD")){
					newTitle = "Gold";
				}
				else if(StringUtils.equals(entry.getKey(), "EPF") || StringUtils.equals(entry.getKey(), "PPF")){
					newTitle = "Retirement Fund";
			   }
		      else{
					newTitle = entry.getKey();
		    }

				
				Long oldValue = valueMap.get(newTitle);
				if(oldValue ==null){
					oldValue = 0l;
		   }
				oldValue += value;
		   
				valueMap.put(newTitle, oldValue);
		      
			}
		}
		   
		for(Map.Entry<String, Long> entry:valueMap.entrySet()){
		   GraphData data = new GraphData();
			data.setCategory(entry.getKey());
			data.setLabel(entry.getKey());
			data.setData(entry.getValue());
		   lstGraph.add(data);
		  }
		  m.addAttribute("lstGraph", lstGraph);
		  m.addAttribute("graphData",new Gson().toJson(lstGraph));
		  
	}
	
	private static long getFVForRD(long monthlyAmount,
			double annualInterestRate, int months) {
		if(months>0&&annualInterestRate>0){ 	 	
		double quarters=Math.floor(months/3);
				double prin=monthlyAmount;
			double monthPayment = prin
					* ((Math.pow(annualInterestRate / 400 + 1, quarters) - 1) * (1200 / annualInterestRate + 2));
				double numPayments=monthPayment-prin*months;
				
				return (long)numPayments+(long) (prin*months);
		} else {
			return monthlyAmount;
		}
	}
	
	public static final int getMonthsDifference(Date date1, Date date2) {
		Calendar startCalendar = new GregorianCalendar();
		startCalendar.setTime(date1);
		Calendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(date2);

		int diffYear = endCalendar.get(Calendar.YEAR)
				- startCalendar.get(Calendar.YEAR);
		int diffMonth = diffYear * 12 + endCalendar.get(Calendar.MONTH)
				- startCalendar.get(Calendar.MONTH);
		return diffMonth;
	}
	
	public  String getAssetKey(AssetData asset){
		if (asset.getAssetTypeId().equals(CpConstants.MUTUAL_FUND)
				|| (asset.getProductTypeId() != null && (asset
						.getProductTypeId().equals(47001)
						|| asset.getProductTypeId().equals(47004) || asset
						.getProductTypeId().equals(47005)))) {
			return "MF";
		}
		if ((asset.getAssetTypeId().equals(CpConstants.STOCK) || asset
				.getProductTypeId() != null
				&& asset.getProductTypeId().equals(47002))) {
			return "STOCK";
		}
		if( asset.getAssetTypeId().equals(48052)){
			return "SAVING";
		}

		if(asset.getAssetTypeId().equals(48011)){
			return "FD";
		}

		if(asset.getAssetTypeId().equals(48053)){
			return "RD";
		}

		if (asset.getAssetTypeId().equals(CpConstants.PROPERTY)
				|| asset.getProductTypeId() != null
				&& (asset.getProductTypeId().equals(47017) || asset
						.getProductTypeId().equals(47011))) {
			return "PROPERTY";
		}

		if (asset.getAssetTypeId().equals(CpConstants.GOLD)
				|| asset.getProductTypeId() != null
				&& (asset.getProductTypeId().equals(47018))) {
			return "GOLD";
		}

		if(asset.getAssetTypeId().equals(48008)){
			return "PPF";
		}

		if(asset.getAssetTypeId().equals(48009)){
			return "PF";
		}

		if(asset.getAssetTypeId().equals(48012)){
			return "EPF";
		}

		return "";
	}
	
	@RequestMapping(value = "/myAsset/save", method ={  RequestMethod.POST})
	public String saveAsset(PortfolioRequest req, Model m, AssetData asset,
			HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {

		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		
		asset.setCreatedBy(user.getUserId());
		asset.setLastModifiedBy(user.getUserId());
        asset.setPartyId(user.getPartyId());
		String action = request.getParameter("action");
		if ("add".equals(action)) {
			PortfolioService service = getBean(PortfolioService.class);
			if(StringUtils.isEmpty(asset.getAssetName())){
				asset.setAssetName("");
			}
			service.addUpdateAsset(asset);
			redirectAttributes.addFlashAttribute("success",
					getMessage("asset.data.save"));
			return "redirect:/portfolio/asset/addUpdate?assetClassId="
					+ asset.getAssetTypeId();
			
		} else {

			PortfolioService service = getBean(PortfolioService.class);
			
			
			service.addUpdateAsset(asset);
			redirectAttributes.addFlashAttribute("success",
					getMessage("asset.data.save"));
		}
		return "redirect:/portfolio/myAssets";
	}
	
	public void populateFamilyMembers(AssetRequest req, Model m, AssetData asset) {
		UserSession user = AuthHandler.getCurrentUser();
		CommonRequest request=new CommonRequest();
		
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		asset.setPartyId(user.getPartyId());
		PortfolioService service = getBean(PortfolioService.class);
		CommonService service1 = getBean(CommonService.class);
		List<KeyValue> familyMembers=service.getFamilyMembers(req);
		List<KeyValue> lst=new ArrayList<KeyValue>();
		m.addAttribute("familyMembers", familyMembers);
		
		if (asset.getOwnerPartyId()!=null) {
			
			request.setPartyId(asset.getOwnerPartyId());
			for(FinancialAccountData f:service1.getAccounts(request)){
				KeyValue c=new KeyValue();
				c.setName(f.getAccountNumber()+" - "+f.getBankName());
				c.setId(f.getPartyFinancialAccountID());
				lst.add(c);
				
				}
			m.addAttribute("accounts",lst );
		} else {
			request.setPartyId(asset.getPartyId());
			for(FinancialAccountData f:service1.getAccounts(request)){
				KeyValue c=new KeyValue();
				c.setName(f.getAccountNumber()+" - "+f.getBankName());
				c.setId(f.getPartyFinancialAccountID());
				lst.add(c);
		
				}
			m.addAttribute("accounts", lst);
			
		}
	}

	@RequestMapping(value = "/myAssets/bankDeposits", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String bankDeposits(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(27641);
		request.setBuId(user.getBuId());
		m.addAttribute("bank-deposits", request);
		return "cp/bankDeposits";
	}

	@RequestMapping(value = "/myAssets/retirement", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String retirement(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(27641);
		request.setBuId(user.getBuId());
		m.addAttribute("retirement", request);
		return "cp/retirement";
	}

	@RequestMapping(value = "/myAssets/mutualFund", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String mutualFund(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(27641);
		request.setBuId(user.getBuId());
		m.addAttribute("mutualFund", request);
		return "cp/mutualFund";
	}

	@RequestMapping(value = "/myAssets/gold", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String gold(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(27641);
		request.setBuId(user.getBuId());
		m.addAttribute("gold", request);
		return "cp/gold";
	}

	@RequestMapping(value = "/myAssets/property", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String property(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(27641);
		request.setBuId(user.getBuId());
		m.addAttribute("property", request);
		return "cp/property";
	}

	@RequestMapping(value = "/myAssets/stock", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String stock(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(27641);
		request.setBuId(user.getBuId());
		PortfolioService service=getBean(PortfolioService.class);
		m.addAttribute("stock", request);
		return "cp/stock";
	}
	
	@RequestMapping(value = "/asset/delete", method = { RequestMethod.GET })
	public String deleteAsset(PortfolioRequest request, Model m) {

		PortfolioService service = getBean(PortfolioService.class);
		service.deleteAssets(request);
		return showAssets(request, m);
	}
	

	
	public String deletePortfolio(PortfolioRequest request, Model m) {

		PortfolioService service = getBean(PortfolioService.class);
		service.deleteLoan(request);
		return showPortfolio(request, m);
	}
	
	@RequestMapping(value = "/myReports", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showReports(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		m.addAttribute("my-reports", request);

		return "cp/myReports";
	}

	@RequestMapping(value = "/myAccount", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showAccount(PortfolioRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		m.addAttribute("my-account", request);

		return "cp/myAccount";
	}
	@Link(label="Add Loan", family="My Portfolio", parent = "My Loan" )
	@RequestMapping(value = "/myLoan/addUpdate", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addUpdateLoan(PortfolioRequest request, Model m , LoanData loanList,HttpServletRequest req) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		LoanData loan = null;
		if(request.getPartyLoanId()==null){
		    loan = new LoanData();
		    m.addAttribute("loan", loan);
		} else {
			PortfolioService service=getBean(PortfolioService.class);
			loan=service.getLoanForId(request);
			m.addAttribute("loan", loan);
		}
		FinancialService service = getBean(FinancialService.class);
		List<CodeValueData> loanTypes = service.getCodeValue("76");
		Collections.sort(loanTypes);
		m.addAttribute("loanTypes", loanTypes);
		List<CodeValueData> lst = service.getCodeValue("63");
		Collections.sort(lst);
		for (Iterator<CodeValueData> iter = lst.iterator(); iter.hasNext();) {
			CodeValueData cv = iter.next();
			if (!(cv.getCodeValueId() == 63003 || cv.getCodeValueId() == 63006
					|| cv.getCodeValueId() == 63004 || cv.getCodeValueId() == 63005)) {
				iter.remove();
			}
		}
		m.addAttribute("freqList", lst);

		return "cp/loan/add";
	}
	
	private void populateDcAssetData(Model model ){
		PortfolioService service = getBean(PortfolioService.class);
		UserSession user=AuthHandler.getCurrentUser();
		List<QuestionDetails> lst= service.getDcData(39005, 29,user.getPartyId());
		List<QuestionDetails> lstRetiremnt= service.getDcData(39006, 29,user.getPartyId());
		List<QuestionDetails> lstLoans= service.getDcData(39008, 29,user.getPartyId());
		if(lst != null && !lst.isEmpty()){
		double totalDeposits=0;
		
			for(QuestionDetails q:lst){
			if(q.getAttributeValue().equals("94027")){
				model.addAttribute("dcStock", CommonUtils.toDouble(q.getAttributeRefferenceValue()));
				
			}
			else if(q.getAttributeValue().equals("94028")){
				model.addAttribute("dcProperty", CommonUtils.toDouble(q.getAttributeRefferenceValue()));
				
			}
			else if(q.getAttributeValue().equals("94029")){
				totalDeposits+=CommonUtils.toDouble(q.getAttributeRefferenceValue());
				
				
			}
			
			else if(q.getAttributeValue().equals("94031")){
				totalDeposits+=CommonUtils.toDouble(q.getAttributeRefferenceValue());
			}
				
			else if(q.getAttributeValue().equals("94030")){
				
				model.addAttribute("dcMF",CommonUtils.toDouble(q.getAttributeRefferenceValue()));
				
			}
				
				
			else if(q.getAttributeValue().equals("94032")){
				model.addAttribute("dcGOLD", CommonUtils.toDouble(q.getAttributeRefferenceValue()));
				
			}
			else if(q.getAttributeValue().equals("94033")){
					totalDeposits+=CommonUtils.toDouble(q.getAttributeRefferenceValue());

				
			}
			
			
			
		}
			model.addAttribute("deposits", totalDeposits);
			
		}
		
		if(lstRetiremnt!=null){
			double retirement=0;
			for(QuestionDetails q:lstRetiremnt){
				if(q.getAttributeValue().equals("94051")){
	
				retirement+=CommonUtils.toDouble(q.getAttributeRefferenceValue());
	
			}
				else if(q.getAttributeValue().equals("94052")){

					retirement+=CommonUtils.toDouble(q.getAttributeRefferenceValue());
				
			}
				else if(q.getAttributeValue().equals("94053")){
			
					retirement+=CommonUtils.toDouble(q.getAttributeRefferenceValue());
				
			}
				else if(q.getAttributeValue().equals("94054")){

					retirement+=CommonUtils.toDouble(q.getAttributeRefferenceValue());
				
			}
			
			
			
				
		}
			model.addAttribute("dcRetirement", retirement);
		}
		
		if(lstLoans!=null){
			for(QuestionDetails q:lstLoans){
					
				if(q.getAttributeCodeId()==94091){
					 model.addAttribute("dcOutstandingLoan", CommonUtils.toDouble(q.getAttributeRefferenceValue()));
				 }
		}
		}
		
	}
	

	
}
