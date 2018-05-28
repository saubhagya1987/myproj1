package in.fiinfra.partner.controller;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.query.model.ProfileRequest;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.pdfcrowd.Client;

@Controller
@RequestMapping("/xray")
public class XrayController 
{
	@Autowired
	RestTemplate restTemplate;
	
	private static final Logger LOGGER = Logger.getLogger(XrayController.class);
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Value("${GET_X_RAY_QUESTIONS}")
	private String GET_X_RAY_QUESTIONS; 
	
	
	@Value("${SAVE_ANSWERS_FOR_XRAY}")
	private String SAVE_ANSWERS_FOR_XRAY; 
	

	@Value("${INSERT_ENTRY_FOR_XRAY}")
	private String INSERT_ENTRY_FOR_XRAY;
	
	
	@RequestMapping(value="/showQuestions")
	public String showQuestions(Model model,HttpServletRequest request,RedirectAttributes redirectAttributes){
		try {
			String clientPartyId = request.getParameter("partyID");
			String contactName = request.getParameter("name");
			String type = request.getParameter("recordType");
			String totalScore = request.getParameter("totalScore");
			if(type != null){
				if (type.equals("14006")) {
					contactName = contactName + " (Client)";
				} else if (type.equals("14005")) {
					contactName = contactName + " (Opportunity)";
				}
			}			
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			List<QuestionData> questionList = getQuestionsForXray(userSession.getUserName(),Integer.valueOf(clientPartyId), userSession.getBuId());
			model.addAttribute("lstQuestions", questionList);
			model.addAttribute("questionList",objectMapper.writeValueAsString(questionList));
			model.addAttribute("clientPartyID", clientPartyId);
			model.addAttribute("headerName", contactName);
			if(totalScore != null) {
				model.addAttribute("xraySuccess", "X-RAY Section saved successfully.</br>Your score is "+totalScore);
			}
		} 
		catch (Exception e) {
			LOGGER.debug("exception while geting x ray questions"+e.getMessage());
			
		}
		
		return "xray/question";
	}
	
	@RequestMapping(value = "/ThankYou", method = RequestMethod.GET)
	public String xrayThankYou(Model model) {
		//model.addAttribute("view", 1);
		return "xray/ThankYou"; 
	}

	@RequestMapping(value= "/answer/save", method=RequestMethod.POST)
	public @ResponseBody AnswerData saveAnswer(Model m,AnswerData answer,HttpServletRequest request){
		try {
			String partyID = request.getParameter("contactPartyId");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			answer.setPartyId(Integer.valueOf(partyID));
			String questionId = request.getParameter("optionId");
			if(questionId != null){
				String [] arr = questionId.split(",");
				OptionData[] arraydata=new OptionData[arr.length];
				for(int i=0; i<arr.length;++i){
					Integer qId = Integer.valueOf(arr[i]);
					OptionData  data = new OptionData();
					data.setOptionId(qId);
					arraydata[i]=data;
				}
				answer.setSelectedOptions(arraydata);
				/*Integer qId = Integer.valueOf(questionId);
				OptionData  data = new OptionData();
				data.setOptionId(qId);
				OptionData[] arraydata= {data};
				answer.setSelectedOptions(arraydata);*/
			}
			//answer.getSelectedOptions()[0].setOptionId(Integer.valueOf(questionId));
			String url = SAVE_ANSWERS_FOR_XRAY + userSession.getUserName()
					+ "/" + "3234a";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("buId", userSession.getBuId());
			BaseResponse<AnswerData> baseResponse = new BaseResponse<>();
			baseResponse = restTemplate.postForObject(
					FiinfraUtility.getURLWithParams(uriCB), answer,
					BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				answer = objectMapper.readValue(objectMapper
						.writeValueAsString(baseResponse.getResponseObject()),
						AnswerData.class);
			}
		} 
		catch (Exception e) {
			LOGGER.debug("Exception while saving x ray questions"+e.getMessage());
			
		}
		return answer;
	}
	
	@RequestMapping(value="/questions/submit", method=RequestMethod.GET)
	public String questionSubmit(Model model,HttpServletRequest request,HttpServletResponse response,final RedirectAttributes redirectAttributes)
	{
		UserSession user = (UserSession) request.getSession()
				.getAttribute("userSession");
		String partyID = request.getParameter("contactPartyId");
		String contactName=request.getParameter("name");
		model.addAttribute("user", user);
		List<QuestionData> lstQuestions = getQuestionsForXray(user.getUserName(), Integer.valueOf(partyID), user.getBuId());
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
		model.addAttribute("headerName", contactName);
		//model.addAttribute("totalScore", total);
		
		String url = INSERT_ENTRY_FOR_XRAY+user.getUserName()+"/"+partyID+"/"+user.getUserId()+"/3234a";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<Boolean> bs = new BaseResponse<Boolean>(); 
		bs = 	restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		
/*		if(answered){
			
		try {
			
			DocumentRequest req = new DocumentRequest();
			req.setBuId(user.getBuId());
			req.setPartyId(user.getPartyId());
			req.setRefTypeId(111020);
			req.setRefId(user.getPartyId());
			String url = GET_DOCUMENT_DATA+user.getUserName()+"/23s";
			List<DocumentData> docs=null;
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("req", req.toString());
			BaseResponse<DocumentData> baseResponse = new BaseResponse<DocumentData>();
			baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				docs = baseResponse.getResponseListObject();
			}
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
				String url1 = GET_FILE_STORAGE_PATH+user.getUserName()+"/23d";
				UriComponentsBuilder uriCB1 = UriComponentsBuilder.fromHttpUrl(url1);
				uriCB.queryParam("buId", user.getBuId());
				uriCB.queryParam("storageId", FiinfraUtility.getStorageCodeIdFromDocumentRefType(111020));
				uriCB.queryParam("partyId", user.getPartyId());
				BaseResponse<String> base = new BaseResponse<String>();
				base = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB1), BaseResponse.class);
				String storagePath="";
				if(base.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				storagePath = base.getResponseObject();
				}
				doc.setFileStoragePathURI(storagePath);
				File basePath = new File(storagePath);
				File f = FiinfraUtility.ensureFolder(FiinfraUtility.ensureFolder(basePath, "FPT"),"" + user.getPartyId());
				pdfFile = new File(f, user.getPartyId() + "_xray" + ".pdf");
			}
			
			
			{
//				QuestionService service = getBean(QuestionService.class);

				{
					//ProfileService profileService = getBean(ProfileService.class);
					//get information for party
					BaseResponse<Party> partyResponce = new BaseResponse<Party>();
					String url2 = GET_PARTY_PROFILE+user.getUserName()+"/"+user.getPartyId()+"/234";
					UriComponentsBuilder uriCBParty = UriComponentsBuilder.fromHttpUrl(url2);
					uriCBParty.queryParam("buId", user.getBuId());
					partyResponce = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCBParty), BaseResponse.class);
					Party party =null;
					if(partyResponce.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
						party = partyResponce.getResponseObject();
						party.setDobAsString(CommonUtils.format(party.getDob(), "dd-MMM-YYYY"));
						if(party.getAssociatedParties() != null){
							for(Party p:party.getAssociatedParties()){
								p.setDobAsString(CommonUtils.format(p.getDob(), "dd-MMM-YYYY"));
							}
						}
					}
					String salutation = "";
					{
						BaseResponse<CodeValueData> codeValueResponce = new BaseResponse<CodeValueData>();
						String url3 = URL_GET_PICKLIST_VALUE_LIST+user.getUserName()+"/"+user.getPartyId()+"/234";
						UriComponentsBuilder uriCBCodeValue = UriComponentsBuilder.fromHttpUrl(url3);
						uriCBParty.queryParam("buId", user.getBuId());
						uriCBParty.queryParam("codeTypeIds", 81);
						codeValueResponce = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCBCodeValue), BaseResponse.class);
						//List<CodeValueData> salutations = profileService.getCodeValue("81");
						List<CodeValueData> salutations = codeValueResponce.getResponseListObject();
								
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
						//get information for owner party
						BaseResponse<Party> ownerResponce = new BaseResponse<Party>();
						String url3 = GET_PARTY_PROFILE+user.getUserName()+"/"+user.getOwnerId()+"/234";
						UriComponentsBuilder uriCBOwner = UriComponentsBuilder.fromHttpUrl(url3);
						uriCBParty.queryParam("buId", user.getBuId());
						ownerResponce = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCBParty), BaseResponse.class);
						Party ownerParty = null;
						if(ownerResponce.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
							ownerParty = ownerResponce.getResponseObject();
						}
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

			//doc.setDocumentId(docService.saveDocumentData(doc));
			
			String saveDocURL = SAVE_DOCUMENT+user.getUserName()+"/2343";
			UriComponentsBuilder uriCBDoc = UriComponentsBuilder.fromHttpUrl(saveDocURL);
			uriCBDoc.queryParam("buId", user.getBuId());
			BaseResponse<Integer> saveDcoResponse = new BaseResponse<Integer>();
			saveDcoResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), doc, BaseResponse.class);
			
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
		//	LOGGER.error("Error while generating Report", ex);
			ex.printStackTrace();
		}
		}*/
		redirectAttributes.addFlashAttribute("view", answered?1:0);
		redirectAttributes.addFlashAttribute("partyId", partyID);
		redirectAttributes.addFlashAttribute("headerName", contactName);
		return "redirect:/xray/showQuestions?partyID="+partyID+"&totalScore="+total+"&name="+contactName;
	}
	
	private List<QuestionData> getQuestionsForXray(String username,Integer partyID, Integer buID)
	{

		try {
			List<QuestionData> questionList;
			String url = GET_X_RAY_QUESTIONS+username+"/"+"3234a";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId", partyID);
			uriCB.queryParam("questionType", 58001);//question type
			uriCB.queryParam("sourceSystemId", 31006);//source system ID
			uriCB.queryParam("buId",buID);
			BaseResponse<QuestionData> response = new BaseResponse<QuestionData>(); 
			response = 	restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			List<QuestionData> questionListjson = new ArrayList<QuestionData>(); // response.getResponseListObject(); 
			questionList = new ArrayList<QuestionData>();
			if(response.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				questionListjson = objectMapper.readValue(objectMapper.writeValueAsString(response.getResponseListObject()), List.class);
				for(int i=0;i<questionListjson.size();++i){
					QuestionData questionData = null;
					questionData = objectMapper.readValue(objectMapper.writeValueAsString(questionListjson.get(i)), QuestionData.class);
					questionList.add(questionData);
				}
			}
			return questionList;
		}catch (Exception e) {
			LOGGER.debug("exception while submitting x ray "+e.getMessage());
			
		}
		return null;
	}
	
	
	
			
}
