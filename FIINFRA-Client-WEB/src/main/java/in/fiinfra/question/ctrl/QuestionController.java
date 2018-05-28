package in.fiinfra.question.ctrl;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.model.ProfileRequest;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.cp.common.util.Link;
import in.fiinfra.document.service.DocumentService;
import in.fiinfra.financial.model.Series;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.profile.service.ProfileService;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.question.Service.QuestionService;

import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pdfcrowd.Client;

@Controller
@RequestMapping("/question")
public class QuestionController extends AbstractController {

	private static final Logger LOGGER = Logger
			.getLogger(QuestionController.class);
	
	@Link(label="Financial X-Ray", family="xray", parent = "" )
	@RequestMapping(value = "/xray", method = RequestMethod.GET)
	public String showXray(AnswerData ans, Model m) {

		UserSession user = AuthHandler.getCurrentUser();

		QuestionService service = getBean(QuestionService.class);
		List<QuestionData> lstQuestions = service.getQuestions(
				user.getPartyId(), 58001);
		// for first time open remove all previous selections
		for (QuestionData q : lstQuestions) {
			for (OptionData op : q.getOptions()) {
				//op.setSelected(false);
				//why to send score on client side
				op.setScore(null);
			}
		}

		m.addAttribute("lstQuestions", lstQuestions);
		m.addAttribute("questionList", new Gson().toJson(lstQuestions));

		return "cp/myQuestions";
	}

	@RequestMapping(value = "/answer/save", method = RequestMethod.POST)
	public @ResponseBody
	AnswerData saveAnswer(AnswerData answer, Model m) {
		QuestionService service = getBean(QuestionService.class);
		UserSession user = AuthHandler.getCurrentUser();
		answer.setPartyId(user.getPartyId());
		answer = service.saveAnswer(answer);
		return answer;
	}

	@RequestMapping(value = "/xray/submit", method = RequestMethod.GET)
	public String submitXray(Model m, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) {

		UserSession user = AuthHandler.getCurrentUser();

		m.addAttribute("user", user);
		QuestionService service = getBean(QuestionService.class);
		List<QuestionData> lstQuestions = service.getQuestions(
				user.getPartyId(), 58001);

		int total = 0;
		boolean answered = false;
		for (QuestionData q : lstQuestions) {
			List<Integer> selectedOptions = new ArrayList<Integer>();
			for (OptionData op : q.getOptions()) {
				if (op.isSelected()) {
					answered = true;
					selectedOptions.add(op.getSeq());
					total += op.getScore();
				}
			}
		}
		m.addAttribute("totalScore", total);
		
		
		if(answered){
			
			

		
		// String reportFilePath =
		// "http://202.87.46.144:8081/FIINFRA-M-WEB/partner/report/generate-report-analysis/"
		// + partyId + "/" + reportFor + "/" + userSession.getUserName() + "/" +
		// userSession.getBuId();
		try {
			
			DocumentService docService = getBean(DocumentService.class);
			DocumentRequest req = new DocumentRequest();
			req.setBuId(user.getBuId());
			req.setPartyId(user.getPartyId());
			req.setRefTypeId(111020);
			req.setRefId(user.getPartyId());
			List<DocumentData> docs =  docService.getDocuments(req);
			final DocumentData  doc;
			File pdfFile = null ;
			if(!docs.isEmpty()){
				doc = docs.iterator().next();
				pdfFile = new File(doc.getFileStoragePathURI());
			}
			else{
				doc = new DocumentData();
			}
			
			if(pdfFile ==null || !pdfFile.exists()){
				doc.setDocumentStorageLocation(FiinfraUtility.getStorageCodeIdFromDocumentRefType(111020));
				
				String storagePath = docService.getStoragePath(user.getPartyId(), user.getBuId(), doc.getDocumentStorageLocation());
				
				doc.setFileStoragePathURI(storagePath);
				File basePath = new File(storagePath);
				File f = FiinfraUtility.ensureFolder(FiinfraUtility.ensureFolder(basePath, "CP"),"" + user.getPartyId());
				pdfFile = new File(f, user.getPartyId() + "_xray" + ".pdf");
			}
			
			
			{
//				QuestionService service = getBean(QuestionService.class);

				{
					ProfileService profileService = getBean(ProfileService.class);
					ProfileRequest req1 = new ProfileRequest();
					req1.setPartyId(user.getPartyId());
					req1.setBuId(user.getBuId());
					Party party = profileService.getProfile(req1);
					String salutation = "";
					{
						List<CodeValueData> salutations = profileService
								.getCodeValue("81");
						for (CodeValueData cd : salutations) {
							if (party.getSalutationId() != null
									&& cd.getCodeValueId() == party.getSalutationId()
											.intValue()) {
								salutation = cd.getCodeValue();
							}
						}
						request.setAttribute(
								"name",
								salutation + " . "
										+ CommonUtils.emptyIfNull(party.getFirstName())
										+ " "
										+ CommonUtils.emptyIfNull(party.getLastName()));
					}
					
					{
						ProfileRequest req2 = new ProfileRequest();
						req2.setBuId(user.getBuId());
						req2.setPartyId(user.getOwnerId());
						Party ownerParty = profileService.getProfile(req2);
						if(ownerParty != null && !StringUtils.isEmpty(ownerParty.getCompanyName())){
							request.setAttribute("companyName", ownerParty.getCompanyName());
						}
						else if(ownerParty != null){
							request.setAttribute("companyName", CommonUtils.emptyIfNull(ownerParty.getFirstName())
									+ " "
									+ CommonUtils.emptyIfNull(ownerParty.getLastName()));
						}
					}
				}

				Map<Integer, List<Integer>> answersMap = new HashMap<Integer, List<Integer>>();
				int counter = 0;
				 total = 0;
				for (QuestionData q : lstQuestions) {
					List<Integer> selectedOptions = new ArrayList<Integer>();
					StringBuilder sb = new StringBuilder();
					sb.append(" "+q.getQuestionId());
					for (OptionData op : q.getOptions()) {
						if (op.isSelected()) {
							sb.append("  ").append(op.getOptionId()).append("  ").append(" Score = ").append(op.getScore());
							selectedOptions.add(op.getSeq());
							total += op.getScore();
						}
					}
//					System.out.println(sb.toString());
					answersMap.put(q.getSeqNo(), selectedOptions);
					counter++;
				}
				for (int i = 1; i < 25; i++) {
					if (answersMap.containsKey(i)) {
						continue;
					}
					List<Integer> selectedOptions = new ArrayList<Integer>();
					answersMap.put(i, selectedOptions);

				}
				request.setAttribute("answersMap", answersMap);
				request.setAttribute("totalScore", total);
			}
//			String reportFilePath = request.getRequestURL().toString();
//			reportFilePath = reportFilePath.replace("submit", "report");
			
//			
//			if ( ( request.getServerPort() == 80 ) ||
//			         ( request.getServerPort() == 443 ) ){
//				reportFilePath = request.getScheme() + "://" + request.getServerName() +"/xray/report" ;				
//			}
//			else{
//				reportFilePath = request.getScheme() + "://" +
//				        request.getServerName() + ":" + request.getServerPort()+"/xray/report";				
//			}

			//pdfFile.getAbsolutePath()
			request.setAttribute("baseUrl", getCurrentBaseURL(request));
			convertToPDF("report/X-rayReport.jsp" ,request, response , pdfFile.getAbsolutePath());

			doc.setFileName(pdfFile.getName());
			doc.setFileStoragePathURI(pdfFile.getAbsolutePath());
			doc.setPartyId(user.getPartyId());
			doc.setRefTypeId(111020);
			doc.setRefId(user.getPartyId());
			doc.setBuId(user.getBuId());
			doc.setDocumentName("Xray Report ");
			doc.setCreatedBy(user.getUserId());
			doc.setDocumentType(10001);
			doc.setSectionId(24001);
			doc.setDocumentStorageLocation(FiinfraUtility.getStorageCodeIdFromDocumentRefType(doc.getRefTypeId()));

			doc.setDocumentId(docService.saveDocumentData(doc));
		
			Notification notification=new Notification();
            Map<String,String> payloadMap=new HashMap<String, String>();
            payloadMap.put("user", user.getName());
//            payloadMap.put("Password",map.getValue());
            
            notification.setSourceSystemID(user.getSourceSystemId());
            notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
            notification.setNotifyPartyID(user.getPartyId());
            notification.setNotifyEventID(FiinfraConstants.EVENT_CP_XRAY_REPORT);
            notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
            notification.setBuId(user.getBuId());
            notification.setPayloadMap(payloadMap);
            notification.setAttachmentCount(1);
            notification.setAttachmentPresent(true);
            notification.setAttachment1DocumentID(doc.getDocumentId());
            notification.setSessionID(request.getSession().getId());
            FrameworkUtil.notify(notification);

		} catch (Exception ex) {
			LOGGER.error("Error while generating Report", ex);
		}
		}

		redirectAttributes.addFlashAttribute("view",answered?1:0 );
		return "redirect:/question/xray/ThankYou";
	}

	private String getCurrentBaseURL(HttpServletRequest request){
		String baseUrl = "";
		if ( ( request.getServerPort() == 80 ) ||
		         ( request.getServerPort() == 443 ) ){
			baseUrl = request.getScheme() + "://" + request.getServerName() ;				
		}
		else{
			baseUrl = request.getScheme() + "://" +
			        request.getServerName() + ":" + request.getServerPort();				
		}
		
		return baseUrl;
	}


	@RequestMapping(value = "/xray/ThankYou", method = RequestMethod.GET)
	public String xrayThankYou(Model m, HttpServletRequest request, HttpServletResponse response) {
		
		if(m.asMap().get("view") ==null){
			return "redirect:/profile/dashboard";	
		}
		 
		return "xray/finalReport"; 
	}
	
	@RequestMapping(value = "/feedback/ThankYou", method = RequestMethod.GET)
	public String feedbackThankYou(Model m, HttpServletRequest request, HttpServletResponse response) {
		if(m.asMap().get("view") ==null){
			return "redirect:/profile/dashboard";	
		}
		return "feedback/finalReport"; 
	}

	@RequestMapping(value = "/xray/report", method = RequestMethod.GET)
	public String xrayReport(Model m, HttpServletRequest request) {

		UserSession user = AuthHandler.getCurrentUser();

		QuestionService service = getBean(QuestionService.class);
		List<QuestionData> lstQuestions = service.getQuestions(
				user.getPartyId(), 58001);

		{
			ProfileService profileService = getBean(ProfileService.class);
			ProfileRequest req = new ProfileRequest();
			req.setPartyId(user.getPartyId());
			req.setBuId(user.getBuId());
			Party party = profileService.getProfile(req);
			{
				ProfileRequest req1 = new ProfileRequest();
				req1.setBuId(user.getBuId());
				req1.setPartyId(user.getOwnerId());
				Party ownerParty = profileService.getProfile(req);
				if(ownerParty != null && !StringUtils.isEmpty(ownerParty.getCompanyName())){
					m.addAttribute("companyName", ownerParty.getCompanyName());
				}
				else if(ownerParty != null){
					m.addAttribute("companyName", CommonUtils.emptyIfNull(ownerParty.getEmailCommunicationName()));
				}
			}
			String salutation = "";
			{
				List<CodeValueData> salutations = profileService
						.getCodeValue("81");
				for (CodeValueData cd : salutations) {
					if (party.getSalutationId() != null
							&& cd.getCodeValueId() == party.getSalutationId()
									.intValue()) {
						salutation = cd.getCodeValue();
					}
				}
				m.addAttribute(
						"name",
						salutation + " "
								+ CommonUtils.emptyIfNull(party.getFirstName())
								+ " "
								+ CommonUtils.emptyIfNull(party.getLastName()));
			}
		}

		Map<Integer, List<Integer>> answersMap = new HashMap<Integer, List<Integer>>();
		int counter = 0;
		int total = 0;
		for (QuestionData q : lstQuestions) {
			List<Integer> selectedOptions = new ArrayList<Integer>();
			StringBuilder sb = new StringBuilder();
			sb.append(" "+q.getQuestionId());
			for (OptionData op : q.getOptions()) {
				if (op.isSelected()) {
					sb.append("  ").append(op.getOptionId()).append("  ").append(" Score = ").append(op.getScore());
					selectedOptions.add(op.getSeq());
					total += op.getScore();
				}
			}
//			System.out.println(sb.toString());
			answersMap.put(q.getSeqNo(), selectedOptions);
			counter++;
		}
		for (int i = 1; i < 25; i++) {
			if (answersMap.containsKey(i)) {
				continue;
			}
			List<Integer> selectedOptions = new ArrayList<Integer>();
			answersMap.put(i, selectedOptions);

		}
		m.addAttribute("answersMap", answersMap);
		m.addAttribute("totalScore", total);
		m.addAttribute("themeId",user.getThemeId());
		request.setAttribute("baseUrl", getCurrentBaseURL(request));
		
		return "report/xray";

	}

	@Link(label="Polls", family="Polls", parent = "" )
	@RequestMapping(value = "/polls", method = RequestMethod.GET)
	public String getPolls(Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		QuestionService service = getBean(QuestionService.class);
		List<QuestionData> lstPolls = service.getPolls(user.getPartyId());
		QuestionData poll = null;
		QuestionData lastPoll = null;

		if (lstPolls.size() > 0) {
			poll = lstPolls.get(0);
		}

		if (lstPolls.size() > 1) {
			lastPoll = lstPolls.get(1);
		}

		ObjectMapper mapper = new ObjectMapper();

		{
			ArrayNode ob = mapper.createArrayNode();

			{
				ArrayNode title = mapper.createArrayNode();
				title.add("Element");
				title.add("Value");

				ObjectNode n = mapper.createObjectNode();
				n.put("role", "style");
				title.add(n);
				ob.add(title);
			}
			int index = 0;
			String[] colors = { "#C0504D", "#4F81BD", "#9BBB59", "#b87333" };
			if(lastPoll != null){
			for (OptionData op : lastPoll.getOptions()) {
				ArrayNode n = mapper.createArrayNode();
				n.add(op.getOptionText());
				n.add(op.getSelectedTotal());
				n.add(colors[index]);
				ob.add(n);
				index++;
			}

			try {
				m.addAttribute("lastPollData", mapper.writeValueAsString(ob));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}

		}
		{
			ArrayNode ob = mapper.createArrayNode();

			{
				ArrayNode title = mapper.createArrayNode();
				title.add("Element");
				title.add("Value");

				ObjectNode n = mapper.createObjectNode();
				n.put("role", "style");
				title.add(n);
				ob.add(title);
			}
			int index = 0;
			String[] colors = { "#C0504D", "#4F81BD", "#9BBB59", "#b87333" };
			if(poll != null){
			for (OptionData op : poll.getOptions()) {
				ArrayNode n = mapper.createArrayNode();
				n.add(op.getOptionText());
				n.add(op.getSelectedTotal());
				n.add(colors[index]);
				ob.add(n);
				index++;
			}

			try {
				m.addAttribute("currentPollData", mapper.writeValueAsString(ob));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
		if (lastPoll != null) {
			List<Series> lstSeries = new ArrayList<Series>();
			List<String> lastPollCategories = new ArrayList<String>();
			for (OptionData op : lastPoll.getOptions()) {
				Series s = new Series();
				s.setName(op.getOptionText());
				s.setData(new Long[1]);
				s.getData()[0] = new Long(op.getSelectedTotal());
				lstSeries.add(s);
				lastPollCategories.add(op.getOptionText());
			}
			m.addAttribute("lastPollCategories",
					new Gson().toJson(lastPollCategories));
			m.addAttribute("lastPollGraph", new Gson().toJson(lstSeries));
		}

		if (poll != null && poll.isAnswered()) {
			List<Series> lstSeries = new ArrayList<Series>();
			List<String> currentPollCategories = new ArrayList<String>();
			for (OptionData op : poll.getOptions()) {
				Series s = new Series();
				s.setName(op.getOptionText());
				s.setData(new Long[1]);
				s.getData()[0] = new Long(op.getSelectedTotal());
				lstSeries.add(s);
				currentPollCategories.add(op.getOptionText());
			}
			m.addAttribute("currentPollCategories",
					new Gson().toJson(currentPollCategories));
			m.addAttribute("currentPollGraph", new Gson().toJson(lstSeries));
		}

		m.addAttribute("answered", poll.isAnswered());
		m.addAttribute("latest", poll);
		m.addAttribute("last", lastPoll);
		m.addAttribute("lastPollAnswered", lastPoll.isAnswered());
		m.addAttribute("lastPolls", new Gson().toJson(lstPolls.get(1)));
		m.addAttribute("latestPolls", new Gson().toJson(lstPolls.get(0)));
		/*
		 * m.addAttribute("pollList", lstPolls); m.addAttribute("listOfPolls",
		 * new Gson().toJson(lstPolls)); m.addAttribute("latestPoll", new
		 * Gson().toJson(lstPolls.get(0))); m.addAttribute("lastPoll", new
		 * Gson().toJson(lstPolls.get(1)));
		 */

		return "cp/polls";
	}

	@RequestMapping(value = "/polls/save", method = RequestMethod.POST)
	public String savePolls(AnswerData answer, Model m) {
		QuestionService service = getBean(QuestionService.class);
		UserSession user = AuthHandler.getCurrentUser();
		answer.setPartyId(user.getPartyId());
		answer = service.savePolls(answer);
		return "redirect:/question/polls";
	}

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(OptionData[].class,
				new OptionEditor());

	}

	public static class OptionEditor extends PropertyEditorSupport {
		@Override
		public void setAsText(String source) throws IllegalArgumentException {
			List<OptionData> lst = new ArrayList<OptionData>();
			if (!StringUtils.isEmpty(source)) {
				String[] tokens = source.split(",");
				for (String s : tokens) {
					int val = CommonUtils.toInt(s);
					OptionData op = new OptionData();
					op.setOptionId(val);
					lst.add(op);
				}
			}
			setValue(lst.toArray(new OptionData[lst.size()]));
		}
	}

	@Link(label="Feedback", family="Feedback", parent = "" )
	@RequestMapping(value = "/feedback", method = RequestMethod.GET)
	public String getFeedbackQuestions(AnswerData ans, Model m) {

		UserSession user = AuthHandler.getCurrentUser();

		QuestionService service = getBean(QuestionService.class);
		List<QuestionData> lstQuestions = service.getQuestions(
				user.getPartyId(), 58003);
		
		// for first time open remove all previous selections
		for (QuestionData q : lstQuestions) {
			for (OptionData op : q.getOptions()) {
				op.setSelected(false);
				//why to send score on client side
				op.setScore(null);
			}
		}


		m.addAttribute("lstQuestions", lstQuestions);
		m.addAttribute("questionList", new Gson().toJson(lstQuestions));

		return "cp/feedback";
	}

	@RequestMapping(value = "/feedback/submit", method = RequestMethod.GET)
	public String submitFeedback(Model m, RedirectAttributes redirectAttribute) {

		UserSession user = AuthHandler.getCurrentUser();

		QuestionService service = getBean(QuestionService.class);
		List<QuestionData> lstQuestions = service.getQuestions(
				user.getPartyId(), 58003);

		m.addAttribute("lstQuestions", lstQuestions);
		Map<Integer, List<Integer>> answersMap = new HashMap<Integer, List<Integer>>();
		int counter = 0;
		boolean answered = false;
		for (QuestionData q : lstQuestions) {
			List<Integer> selectedOptions = new ArrayList<Integer>();
			for (OptionData op : q.getOptions()) {
				if (op.isSelected()) {
					selectedOptions.add(op.getSeq());
					answered = true;
				}
			}
			answersMap.put(q.getSeqNo(), selectedOptions);
			counter++;
		}
		m.addAttribute("answered", answered);
		for (int i = 1; i < 25; i++) {
			if (answersMap.containsKey(i)) {
				continue;
			}
			List<Integer> selectedOptions = new ArrayList<Integer>();
			answersMap.put(i, selectedOptions);

		}

		m.addAttribute("answersMap", answersMap);
		// if(answersMap.get(1).contains(1) && answersMap.get(3).contains(1) ){
		//
		// }
		redirectAttribute.addFlashAttribute("view", answered?1:0);

		return "redirect:/question/feedback/ThankYou";
		
	}


	
//	private String readURL(String url)throws Exception{
//		BufferedReader in = null;
//		StringBuilder sb = new StringBuilder();
//		try{
//		
//			URL connection = new URL(url);
//	        URLConnection yc = connection.openConnection();
//	        in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
//	        String inputLine;
//	        while ((inputLine = in.readLine()) != null) {
//	        	sb.append(inputLine);
//	        }
//	        IOUtils.closeQuietly(in);    
//		}finally{
//			in.close();
//		}
//		return sb.toString();
//			
//	}
	
	
//	   private String renderViewToString(Model map, HttpServletRequest request, HttpServletResponse httpServletResponse)throws Exception {
//		   
//		   HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(httpServletResponse) {
//			    private final StringWriter sw = new StringWriter();
//
//			    @Override
//			    public PrintWriter getWriter() throws IOException {
//			        return new PrintWriter(sw);
//			    }
//
//			    @Override
//			    public String toString() {
//			       return sw.toString();
//			    }
//			};
//			
//			request.getRequestDispatcher("/xray/report").include(request, responseWrapper);
//			
//		    return responseWrapper.toString();
//	    }
//
//	   public static class CharArrayWriterResponse extends HttpServletResponseWrapper {
//			
//		   private final CharArrayWriter charArray = new CharArrayWriter();
//		  
//		   public CharArrayWriterResponse(HttpServletResponse response) {
//		     super(response);
//		   }
//		  
//		   @Override
//		   public PrintWriter getWriter() throws IOException {
//		     return new PrintWriter(charArray);
//		   }
//		  
//		   public String getOutput() {
//		     return charArray.toString();
//		   }
//		 }
	
	@Override
	protected void convertToPDF(String jspPath, HttpServletRequest request,HttpServletResponse response, 
			 String pdfFilePath)
			throws Exception {
		String output = getHtmlOutput(jspPath, request, response);
		
		Client client = new Client("fiinfra",
				"c9dfe99bda3c5ec77067fb1a4611b299");
		client.enableHyperlinks();
		
		
//		client.setFooterHtml("<div class=\"footer clearfix\">  <div class=\"fr page_no\">(<span class=\"no\">%p</span>)</div> </div>");
		
		FileOutputStream fileStream = new FileOutputStream(new File(pdfFilePath));
		try {
			client.convertHtml(output, fileStream);
		} finally {
			IOUtils.closeQuietly(fileStream);
		}
	}
	
}
