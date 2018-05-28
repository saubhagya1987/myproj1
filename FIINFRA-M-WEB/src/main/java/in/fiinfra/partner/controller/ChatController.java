package in.fiinfra.partner.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import in.fiinfra.common.admin.AddChat;
import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ChatData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/partner")
public class ChatController {
	
	@Autowired
	private CommonController commonController;
	
	private static final Logger LOGGER = Logger.getLogger(ChatController.class);
	String url;
	@Autowired
	RestTemplate restTemplate;
	@Autowired
	private ObjectMapper objectMapper;

	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;
	
	@Value("${URL_GET_USER_LIST}")
	private String URL_GET_USER_LIST;
	
	@Value("${URL_GET_CHAT_AND_COMMENT_LIST}")
	private String URL_GET_CHAT_AND_COMMENT_LIST;
	
	@Value("${URL_INSERT_CHAT_RECORD}")
	private String URL_INSERT_CHAT_RECORD;
	
	@Value("${URL_GET_DOCUMENT_RECORD}")
	private String URL_GET_DOCUMENT_RECORD;
	
	@Value("${URL_GET_USER_FOR_TAGGING_LIST}")
	private String URL_GET_USER_FOR_TAGGING_LIST;

	
	@RequestMapping(value = "/chat", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showChat(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String chat = "";
		int chatLink = 324;
		chat = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(), userSession.getUserName(), userSession.getBuId(), chatLink);
		model.addAttribute("roleBaseLinks",chat);
		
		
		String partnerSetupLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 283);// Partner Setup links
		//model.addAttribute("partnerSetupLinks", partnerSetupLinks);
		request.getSession().setAttribute("partnerSetupLinks", partnerSetupLinks);
		
		String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 323);// Partner Dashboard links
		model.addAttribute("roleBaseLinks", roleBaseLinks);
		request.getSession().setAttribute("smallMenuLinks", roleBaseLinks);
		
		
		model.addAttribute("flag", 2);
		model.addAttribute("hierarchy", 1);
		
		request.getSession().removeAttribute("headerName");
		return "partner/chat";
	}
	

	/**
	 * Retrieve the list of picklist values needed in add/edit query page
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getPicklistValues", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getPicklistValues(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		url = URL_GET_PICKLIST_VALUE_LIST + "xyz/1234";
		String codeTypeIds = request.getParameter("codeTypeIds");
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("codeTypeIds", codeTypeIds);
		uriCB.queryParam("buId", FiinfraConstants.AXISMFBUID);
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList = br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
	}
	
	/**
	 * retrieves the list of contact based on contacttypeid
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getUserList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getUserList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String recordType;
		String loggedInUserPartyId;
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		loggedInUserPartyId=userSession.getPartyId().toString();
		int buId=userSession.getBuId();
		recordType=request.getParameter("recordType");
		url = URL_GET_USER_LIST+userSession.getUserName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("recordType", recordType);
		uriCB.queryParam("loggedInUserPartyId",loggedInUserPartyId);
		uriCB.queryParam("buId",buId);
		List<UserData> userList=(List<UserData>) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
		PrintWriter out= null; 
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, userList);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getChatList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getChatList(Model model,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		String loggedInUserPartyId;
		int startValue;
		loggedInUserPartyId=request.getParameter("partyId");
		startValue=Integer.parseInt(request.getParameter("startValue"));
		String nodeId = request.getSession().getAttribute("nodeId").toString();
		int buId=userSession.getBuId();
		//LOGGER.debug("buId==========="+buId);
		url = URL_GET_CHAT_AND_COMMENT_LIST+userSession.getUserName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("loggedInUserPartyId",loggedInUserPartyId);
		uriCB.queryParam("startValue", startValue);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("nodeId", nodeId);
		model.addAttribute("hierarchy", 1);
		List<Object> chatterList=(List<Object>) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
		PrintWriter out= null; 
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, chatterList);
	 
	}
	
	@RequestMapping(value = "/saveChat", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void insertChatRecord(HttpServletRequest request,
			HttpServletResponse response,ChatData addChat) throws Exception {
		try{
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		long currentTime = new Date().getTime();
		int buId=userSession.getBuId();
		addChat.setBuId(buId);
		int createdBy = userSession.getUserId();
		MultipartFile[] m=null;
		
		if(addChat.getChatType().equals("chat")){
		m = addChat.getChatAttachment();
		
		if(m!=null){
		for (MultipartFile f : addChat.getChatAttachment()) {
			LOGGER.debug("f.getOriginalFilename():--"
					+ f.getOriginalFilename());
			if (f.getOriginalFilename() != null
					&& !f.getOriginalFilename().equals("")) {
				String fileName = null;
				String extension = null;
				DocumentData d = new DocumentData();
				d.setDocumentName(f.getOriginalFilename());
				d.setDocumentStorageLocation(82001);
				d.setDocumentType(10001);
				d.setCreatedBy(createdBy);
				fileName = f.getOriginalFilename().substring(0,
						f.getOriginalFilename().lastIndexOf("."));
				extension = f.getOriginalFilename().substring(
						f.getOriginalFilename().lastIndexOf("."));
				LOGGER.debug("File name is :--" + fileName);
				LOGGER.debug("extension is:--" + extension);
				LOGGER.debug("filename to set:---" + fileName + "_"
						+ currentTime + extension);
				d.setFileName(fileName + "_" + currentTime + extension);
				d.setFileSize((int) f.getSize());
				d.setFileTypeId(11006);
				documentDatas.add(d);
			}
		}
		
		}
		}
		else{
			m = addChat.getCommentAttachment();
			
			if(m!=null){
			for (MultipartFile f : addChat.getCommentAttachment()) {
				LOGGER.debug("f.getOriginalFilename():--"
						+ f.getOriginalFilename());
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					DocumentData d = new DocumentData();
					d.setDocumentName(f.getOriginalFilename());
					d.setDocumentStorageLocation(82001);
					d.setDocumentType(10001);
					d.setCreatedBy(createdBy);
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = f.getOriginalFilename().substring(
							f.getOriginalFilename().lastIndexOf("."));
					LOGGER.debug("File name is :--" + fileName);
					LOGGER.debug("extension is:--" + extension);
					LOGGER.debug("filename to set:---" + fileName + "_"
							+ currentTime + extension);
					d.setFileName(fileName + "_" + currentTime + extension);
					d.setFileSize((int) f.getSize());
					d.setFileTypeId(11006);
					documentDatas.add(d);
				}
			}
			
			}
		}
		LOGGER.debug("documentDatas:--"+documentDatas);
		if (documentDatas.size()>0) {
			addChat.setAttachmentCount(documentDatas.size());
			addChat.setAttachment(true);
		}
		
		addChat.setChatPartyId(userSession.getPartyId()); /*this variable is in session*/
		addChat.setRecordTypeId(userSession.getPartyTypeId()); /*this variable is in session*/
		addChat.setCreatedBy(createdBy);
		url = URL_INSERT_CHAT_RECORD+userSession.getName()+"/1234";
		addChat.setDocumentDatas(documentDatas);
		addChat.setChatAttachment(null);
		addChat.setCommentAttachment(null);
		addChat = restTemplate.postForObject(url, addChat, ChatData.class);
		LOGGER.debug("addChat="+addChat);
		String basePath = addChat.getBasePath();
		int chatId = addChat.getChatId();
		LOGGER.debug("chatid:--" + chatId);
		LOGGER.debug("base path:--" + basePath);
		if (documentDatas.size()>0) {
			File baseFolder = new File(basePath);
			for (MultipartFile f : m) {
				if (f.getOriginalFilename() != null
						&& !f.getOriginalFilename().equals("")) {
					String fileName = null;
					String extension = null;
					fileName = f.getOriginalFilename().substring(0,
							f.getOriginalFilename().lastIndexOf("."));
					extension = f.getOriginalFilename().substring(
							f.getOriginalFilename().lastIndexOf("."));
					LOGGER.debug("File name is :--" + fileName);
					LOGGER.debug("extension is:--" + extension);
					LOGGER.debug("filename to set:---" + fileName + "_"
							+ currentTime + extension);
					fileName = fileName + "_" + currentTime + extension;
					String filePath = basePath + "\\" + fileName;
					File fileToUpload = new File(filePath);
					if (baseFolder.exists()) {
					} else {
						baseFolder.mkdirs();// creates directory
					}
					// uploads file to that directory
					try {
						f.transferTo(fileToUpload);
					} catch (Exception e) {
						e.printStackTrace();
						// logger.error(e.getMessage());
					}
				}
			}
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		PrintWriter out= null; 
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
	}
	
	/**
	 * Downloads the document
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/downloadDocument", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void downloadDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		LOGGER.debug("URL --> " + url);
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_DOCUMENT_RECORD+userSession.getUserName()+"/1234";
		int docId=Integer.parseInt(request.getParameter("docId"));
		
		int buId=userSession.getBuId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("docId",docId);
		uriCB.queryParam("buId",buId);
//		DocumentData documentData=(DocumentData) FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
		BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		DocumentData documentData=new DocumentData();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			documentData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), DocumentData.class);
//			documentData=br.getResponseObject();
		LOGGER.debug("file name is:--"+documentData.getDocumentName());
		LOGGER.debug("file path is:--"+documentData.getFileStoragePathURI());
		InputStream file = new FileInputStream(new File(documentData.getFileStoragePathURI()));
		LOGGER.debug("file:----"+file.available());
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment; filename=\"" + documentData.getDocumentName() +"\"");
        FileCopyUtils.copy(file, response.getOutputStream());
	}
	
	@RequestMapping(value = "/getUserForTaggingList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void getUserForTaggingList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List allDataList= new ArrayList();
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		String partyId;
		String searchText;
		partyId=request.getParameter("partyId");
		searchText=request.getParameter("post");
		//LOGGER.debug("partyId==========="+partyId);
		//LOGGER.debug("searchText==========="+searchText);
		/*buId should come from session*/
		int buId=userSession.getBuId();
		//LOGGER.debug("buId in getUserForTaggingList==========="+buId);
		url = URL_GET_USER_FOR_TAGGING_LIST+userSession.getName()+"/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId",partyId);
		uriCB.queryParam("searchText", searchText);
		uriCB.queryParam("buId", buId);
		List userTaggingList=(List) FiinfraUtility.postRequest(uriCB,List.class,restTemplate);
		allDataList.add(userTaggingList);
		
//		Gson gson= new Gson();
//		  LOGGER.debug("getUserForTaggingList========="+gson.toJson(allDataList));
		
		//LOGGER.debug("userTaggingList:------------------"+userTaggingList);
		PrintWriter out= null; 
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, allDataList);
	}
	
}
