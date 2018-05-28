package in.fiinfra.query.ctrl;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.QueryRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommentData;
import in.fiinfra.cp.common.util.Link;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.query.ctrl.service.QueryService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/query")
public class QueryController extends AbstractController {
	
	private static final String QUERY_SOURCE="Query";

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String defaultQueryList(Model m, QueryRequest q, BindingResult result) {
		return queryList(m, q, result);
	}

	@Link(label="Add Query", family="Add Query", parent = "Query" )
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String createQuery(Model m, QueryRequest q) {
		QueryData query = new QueryData();
		m.addAttribute("bean", new QueryData());
		m.addAttribute("query", query);
		if(StringUtils.isEmpty(q.getReturnUrl())){
			q.setReturnUrl("/query/list");
		}

		m.addAttribute("returnUrl", q.getReturnUrl());
		if(StringUtils.equals(q.getReturnUrl(),"/financial/myIncome"))
		{
		m.addAttribute("queryMsg", "Income");
		m.asMap().put("currentPage","cashflow");
		}
		else if(StringUtils.equals(q.getReturnUrl(),"/financial/myExpenses"))
		{
		m.addAttribute("queryMsg", "Expenses");
		m.asMap().put("currentPage","cashflow");
		}
		else if(StringUtils.equals(q.getReturnUrl(),"/portfolio/myLoan"))
		{
		m.addAttribute("queryMsg", "Loan");
		m.asMap().put("currentPage","portfolio");
		}
		else if(StringUtils.equals(q.getReturnUrl(),"/portfolio/myPlans"))
		{
		m.addAttribute("queryMsg", "Plan");
		m.asMap().put("currentPage","plan");
		}
		else{
			m.addAttribute("queryMsg", " ");
		}
		populateQuerySearchData(m, q);
		return "cp/query/add";
	}
	
	@Link(label="Edit Query", family="Edit Query", parent = "Query" )
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editQuery(Model m, QueryRequest q) {
		QueryService service=getBean(QueryService.class);
		UserSession user =  AuthHandler.getCurrentUser();
		QueryData query= service.getQuery(user.getPartyId(), q.getQueryId());
		populateQuerySearchData(m, q);
		if(StringUtils.isEmpty(q.getReturnUrl())){
			q.setReturnUrl("/query/list");
		}
		m.addAttribute("returnUrl", q.getReturnUrl());
		m.addAttribute("query", query);
		return "cp/query/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String createQuery(@ModelAttribute("query") QueryData query,
			BindingResult result, Model m, HttpServletRequest request,
			final RedirectAttributes redirectAttributes,QueryRequest req,
			HttpServletResponse response) {
		UserSession user = AuthHandler.getCurrentUser();
		int buId = user.getBuId();
		query.setBuId(buId);
		QueryService service = getBean(QueryService.class);

		String returnUrl = request.getParameter("returnUrl");
		m.addAttribute("returnUrl", returnUrl);
        QueryRequest q = new QueryRequest(); 
		String result1 = "fail";
		query.setCreatedBy(user.getUserId());
		query.setQueryOwner(user.getPartyId());
		query.setQueryTo(user.getOwnerId());
		query.setContactId(user.getPartyId());
		query.setContactType(user.getPartyTypeId());
		query.setCreatedBy(user.getUserId());
		q.setReturnUrl(returnUrl);
		query = service.addUpdateQuery(query);

		int queryId = query.getQueryId();
		if (queryId > 0) {
			result1 = "success";
		}
		else{
			m.addAttribute("error", "Error while Saving Query");
			populateQuerySearchData(m, q);
			return "cp/query/add";
		}
		if(req.getQueryId() > 0)
		{ redirectAttributes.addFlashAttribute("success",
				getMessage("success.query.edit"));
		}
		else
		{
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.query.save"));
		}
		return "redirect:" + returnUrl;
	}

	@Link(label="Query", family="Query", parent = "" )
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String queryList(Model m, @ModelAttribute("q") QueryRequest q,
			BindingResult result) {

		UserSession user = AuthHandler.getCurrentUser();
		q.setPartyId(user.getPartyId());
		populateDefault(q);
		QueryService service = getBean(QueryService.class);
		q.setPartyId(user.getPartyId());
		q.setQueryPanel("inbox");

		List<QueryData> lstQuery = service.searchQuery(q);
		m.addAttribute("data", lstQuery);

		m.addAttribute("q", q);

		return "cp/query/list";
	}

	@Link(label="Messages", family="Query", parent = "Query" )
	@RequestMapping(value = "/messages", method = RequestMethod.GET)
	public String viewMessages(Model m, QueryRequest q,final RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
		
		UserSession user = AuthHandler.getCurrentUser();

		if (q.getQueryId() > 0) {

			// check validation

			QueryService service = getRestService(QueryService.class);
			if(StringUtils.isEmpty(q.getReturnUrl())){
				q.setReturnUrl("/query/list");
			}

			m.addAttribute("returnUrl", q.getReturnUrl());

			QueryData query = service.getQuery(user.getPartyId(), q.getQueryId());
			CommentData newComment = new CommentData();

			newComment.setCommentTypeName("Public");
			newComment.setQueryId(q.getQueryId());
			newComment.setStatus(query.getStatus());
			populateCommentFormData(m, newComment);

			m.addAttribute("data", query);
			m.addAttribute("queryComment", newComment);
		}
		return "cp/query/message";
	}

	@RequestMapping(value = "/delete", method=RequestMethod.GET)
	public String deleteQuery( Model m,HttpServletRequest request, final RedirectAttributes redirectAttributes ,
			QueryRequest q) {
		
		UserSession userSession = AuthHandler.getCurrentUser();
		
		QueryService service = getRestService(QueryService.class);
		Response responce = service.deleteQuery(q);
		if(responce == null) {
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DELETE_QUERY_SUCCESSFUL, QUERY_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_DELETE_QUERY);
		}
		else {
			audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_DELETE_QUERY_FAILED, QUERY_SOURCE, FiinfraConstants.DIY_SOURCE_MODULE_DELETE_QUERY);
		}
		
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.query.delete"));
		return "redirect:/query/list"; 
	}
	
	

	public void populateQuerySearchData(Model m, QueryRequest q) {

		QueryService service = getBean(QueryService.class);

		List<KeyValue> contacts = new ArrayList<KeyValue>();

		UserSession user = AbstractController.getSessionUser();

		m.addAttribute("partyId", user.getPartyId());
		q.setPartyId(user.getPartyId());
		// PartyData p = service.getAllocatedTeamMember(q);

		// List<KeyValue> queryTo = new ArrayList<KeyValue>();
		//
		// queryTo.add(new KeyValue(user.getPartyId(), "[ Self ]"));
		//
		// if (p.getPstPartyId() != 0) {
		// queryTo.add(new KeyValue(p.getPstPartyId(), p.getPstName() + "["
		// + p.getPstDepartmentName() + "]"));
		// }
		// if (p.getMstPartyId() != 0) {
		// queryTo.add(new KeyValue(p.getMstPartyId(), p.getMstName() + "["
		// + p.getMstDepartmentName() + "]"));
		// }
		// if (p.getFpaPartyId() != 0) {
		// queryTo.add(new KeyValue(p.getFpaPartyId(), p.getFpaName() + "["
		// + p.getFpaDepartmentName() + "]"));
		// }
		// if (p.getMst2PartyId() != 0) {
		// queryTo.add(new KeyValue(p.getMst2PartyId(), p.getMst2Name() + "["
		// + p.getMst2DepartmentName() + "]"));
		// }
		//
		// m.addAttribute("contacts", contacts);
		// m.addAttribute("queryTo", queryTo);
		List<CodeValueData> lstType = service.getCodeValue("20");
		List<KeyValue> qTypes = new ArrayList<KeyValue>();
		for (CodeValueData c : lstType) {
			if ( c.getCodeValueId() == 20005) {
				continue;
			}
			qTypes.add(new KeyValue(c.getCodeValueId(), c.getCodeValue()));
		}
		m.addAttribute("queryTypes", qTypes);
		// Integer[] contactTypes = new Integer[3];
		//
		// {
		// List<CodeValueData> lst = service.getCodeValue("14");
		//
		// for (CodeValueData d : lst) {
		// if (d.getCodeValue().equalsIgnoreCase("Opportunity")) {
		// contactTypes[0] = d.getCodeValueId();
		// } else if (d.getCodeValue().equalsIgnoreCase("Premium Client")) {
		// contactTypes[2] = d.getCodeValueId();
		// } else if (d.getCodeValue().equalsIgnoreCase("Client")) {
		// contactTypes[1] = d.getCodeValueId();
		// }
		// }
		//
		// m.addAttribute("contactTypes", contactTypes);
		//
		// m.addAttribute("contacts", contacts);
		// }
	}

	public void populateFormData(Model m, QueryData query) {

		QueryRequest q = new QueryRequest();

		populateQuerySearchData(m, q);

		QueryService service = getBean(QueryService.class);

		List<KeyValue> contacts = new ArrayList<KeyValue>();
		List<KeyValue> statusCodes = toKeyValue(service.getCodeValue("22"));

		Integer[] contactTypes = new Integer[3];

		{
			List<CodeValueData> lst = service.getCodeValue("14");

			for (CodeValueData d : lst) {
				if (d.getCodeValue().equalsIgnoreCase("Opportunity")) {
					contactTypes[0] = d.getCodeValueId();
				} else if (d.getCodeValue().equalsIgnoreCase("Premium Client")) {
					contactTypes[2] = d.getCodeValueId();
				} else if (d.getCodeValue().equalsIgnoreCase("Client")) {
					contactTypes[1] = d.getCodeValueId();
				}
			}

			m.addAttribute("contactTypes", contactTypes);
			contacts = service.getPartyName(q,
					query.getContactType() > 0 ? query.getContactType()
							: contactTypes[0]);
			m.addAttribute("contacts", contacts);
		}

		UserSession user = AbstractController.getSessionUser();

		m.addAttribute("partyId", user.getPartyId());
		q.setPartyId(user.getPartyId());
		m.addAttribute("status", statusCodes);
		m.addAttribute("mySelf", query.getContactId() == user.getPartyId());
		m.addAttribute("RefTypeId", "111006");
		m.addAttribute("sectionId", "1");

		// for add notes
		// for (CodeValueData d:)

	}

	private void populateDefault(QueryRequest q) {
		UserSession user = AbstractController.getSessionUser();
		q.setBuId(user.getBuId());
		q.setPartyId(user.getPartyId());
	}

	public void populateCommentFormData(Model m, CommentData comment) {
		QueryService service = getBean(QueryService.class);

		List<KeyValue> statusCodes = new ArrayList<KeyValue>();

		{
			List<CodeValueData> lst = service.getCodeValue("22");
			for (CodeValueData d : lst) {
				KeyValue k = new KeyValue();
				k.setId(d.getCodeValueId());
				k.setName(d.getCodeValue());
				statusCodes.add(k);
			}
		}
		m.addAttribute("status", statusCodes);
	}

	@RequestMapping(value = "/comment/save", method = RequestMethod.POST)
	public String saveComment(Model m,
			final RedirectAttributes redirectAttributes,
			@ModelAttribute("queryComment") CommentData queryCommentData,
			HttpServletRequest request) {

		// check validation
		QueryService service = getRestService(QueryService.class);

		UserSession user = AbstractController.getSessionUser();

		String returnUrl = request.getParameter("returnUrl");
		m.addAttribute("returnUrl", returnUrl);
		
		String result = "fail";

		QueryCommentData comment = new QueryCommentData();

		/* List<DocumentData> documentDatas = new ArrayList<DocumentData>(); */
		comment.setCommentPartyId(user.getPartyId());
		comment.setCommentText(queryCommentData.getCommentText());
		comment.setQueryId(queryCommentData.getQueryId());
		long currentTime = new Date().getTime();
		service.addUpdateComment(comment);
		QueryRequest q = new QueryRequest();
		if(StringUtils.isEmpty(q.getReturnUrl())){
			q.setReturnUrl("/query/list");
		}

		m.addAttribute("returnUrl", q.getReturnUrl());
		q.setStatus(queryCommentData.getStatus());
		service.updateStatus(q);

		redirectAttributes.addFlashAttribute("success",
				getMessage("success.comment.save"));
		
		return "redirect:" + returnUrl;
	}
	private void audit(int actionByPartyId, int actionByUserId, int eventId, String sourceModule, String sourceScreen){
		try{
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);				
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			FrameworkUtil.audit(audit);
		} catch(Exception exception){
	//		LOGGER.error("Error occured while doing Audit", exception);
		}		
	}

}