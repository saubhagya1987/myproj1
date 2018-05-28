package in.fiinfra.chat.ctrl;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ChatData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.common.util.AuthHandler;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
@RequestMapping("/chat")
public class ChatController {
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

	/**
	 * This method is responsible to show the dashboard screen after successful
	 * login
	 * 
	 * @param request
	 *            of type {@link javax.servlet.http.HttpServletRequest}
	 * @return result of type {@link java.lang.String}
	 */
	@RequestMapping(value = "/chat", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showChat(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
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
	 * 
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
		UserSession userSession = AuthHandler.getCurrentUser();
		loggedInUserPartyId = userSession.getPartyId().toString();
		int buId = userSession.getBuId();
		recordType = request.getParameter("recordType");
		url = URL_GET_USER_LIST + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("recordType", recordType);
		uriCB.queryParam("loggedInUserPartyId", loggedInUserPartyId);
		uriCB.queryParam("buId", buId);
		List<UserData> userList = (List<UserData>) FiinfraUtility.postRequest(
				uriCB, List.class, restTemplate);
		
		UserData u = new UserData();
		u.setPartyId(userSession.getPartyId());
		u.setName(userSession.getOwnerName());
		userList.add(u);
		PrintWriter out = null;
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
	public void getChatList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserSession userSession = AuthHandler.getCurrentUser();
		String loggedInUserPartyId;
		int startValue;
		loggedInUserPartyId = userSession.getPartyId().toString();
		startValue = Integer.parseInt(request.getParameter("startValue"));
		int buId = userSession.getBuId();
		// System.out.println("buId==========="+buId);
		url = URL_GET_CHAT_AND_COMMENT_LIST + userSession.getUserName()
				+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("loggedInUserPartyId", loggedInUserPartyId);
		uriCB.queryParam("startValue", startValue);
		uriCB.queryParam("buId", buId);
		List<Object> chatterList = (List<Object>) FiinfraUtility.postRequest(
				uriCB, List.class, restTemplate);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, chatterList);

	}

	@RequestMapping(value = "/saveChat", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void insertChatRecord(BaseRequest request,
			HttpServletResponse response, ChatData addChat) throws Exception {
		try {

			UserSession user = AuthHandler.getCurrentUser();
			request.setPartyId(user.getPartyId());
			request.setBuId(user.getBuId());

			List<DocumentData> documentDatas = new ArrayList<DocumentData>();
			long currentTime = new Date().getTime();
			MultipartFile[] m = null;

			if (addChat.getChatType().equals("chat")) {
				m = addChat.getChatAttachment();

				if (m != null) {
					for (MultipartFile f : addChat.getChatAttachment()) {
						System.out.println("f.getOriginalFilename():--"
								+ f.getOriginalFilename());
						if (f.getOriginalFilename() != null
								&& !f.getOriginalFilename().equals("")) {
							String fileName = null;
							String extension = null;
							DocumentData d = new DocumentData();
							d.setDocumentName(f.getOriginalFilename());
							d.setDocumentStorageLocation(82001);
							d.setDocumentType(10001);
							d.setCreatedBy(user.getUserId());
							fileName = f.getOriginalFilename().substring(0,
									f.getOriginalFilename().lastIndexOf("."));
							extension = f.getOriginalFilename().substring(
									f.getOriginalFilename().lastIndexOf("."));
							System.out.println("File name is :--" + fileName);
							System.out.println("extension is:--" + extension);
							System.out.println("filename to set:---" + fileName
									+ "_" + currentTime + extension);
							d.setFileName(fileName + "_" + currentTime
									+ extension);
							d.setFileSize((int) f.getSize());
							d.setFileTypeId(11006);
							documentDatas.add(d);
						}
					}

				}
			} else {
				m = addChat.getCommentAttachment();

				if (m != null) {
					for (MultipartFile f : addChat.getCommentAttachment()) {
						System.out.println("f.getOriginalFilename():--"
								+ f.getOriginalFilename());
						if (f.getOriginalFilename() != null
								&& !f.getOriginalFilename().equals("")) {
							String fileName = null;
							String extension = null;
							DocumentData d = new DocumentData();
							d.setDocumentName(f.getOriginalFilename());
							d.setDocumentStorageLocation(82001);
							d.setDocumentType(10001);
							/* d.setCreatedBy(createdBy); */
							fileName = f.getOriginalFilename().substring(0,
									f.getOriginalFilename().lastIndexOf("."));
							extension = f.getOriginalFilename().substring(
									f.getOriginalFilename().lastIndexOf("."));
							System.out.println("File name is :--" + fileName);
							System.out.println("extension is:--" + extension);
							System.out.println("filename to set:---" + fileName
									+ "_" + currentTime + extension);
							d.setFileName(fileName + "_" + currentTime
									+ extension);
							d.setFileSize((int) f.getSize());
							d.setFileTypeId(11006);
							documentDatas.add(d);
						}
					}

				}
			}
			System.out.println("documentDatas:--" + documentDatas);
			if (documentDatas.size() > 0) {
				addChat.setAttachmentCount(documentDatas.size());
				addChat.setAttachment(true);
			}

			addChat.setCreatedBy(user.getUserId());
			addChat.setBuId(user.getBuId());
			
			addChat.setChatPartyId(user.getPartyId()); /*
														 * this variable is in
														 * session
														 */
			addChat.setRecordTypeId(user.getPartyTypeId()); /*
															 * this variable is
															 * in session
															 */
			/* addChat.setCreatedBy(createdBy); */
			url = URL_INSERT_CHAT_RECORD + user.getName() + "/1234";
			addChat.setDocumentDatas(documentDatas);
			addChat.setChatAttachment(null);
			addChat.setCommentAttachment(null);
			addChat = restTemplate.postForObject(url, addChat, ChatData.class);
			System.out.println("addChat=" + addChat);
			String basePath = addChat.getBasePath();
			int chatId = addChat.getChatId();
			System.out.println("chatid:--" + chatId);
			System.out.println("base path:--" + basePath);
			if (documentDatas.size() > 0) {
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
						System.out.println("File name is :--" + fileName);
						System.out.println("extension is:--" + extension);
						System.out.println("filename to set:---" + fileName
								+ "_" + currentTime + extension);
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, FiinfraConstants.SUCCESS);
	}

	/**
	 * Downloads the document
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/downloadDocument", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void downloadDocument(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("URL --> " + url);
		UserSession userSession = AuthHandler.getCurrentUser();
		url = URL_GET_DOCUMENT_RECORD + userSession.getUserName() + "/1234";
		int docId = Integer.parseInt(request.getParameter("docId"));

		int buId = userSession.getBuId();
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("docId", docId);
		uriCB.queryParam("buId", buId);
		// DocumentData documentData=(DocumentData)
		// FiinfraUtility.postRequest(uriCB,DocumentData.class,restTemplate);
		BaseResponse<DocumentData> br = new BaseResponse<DocumentData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		DocumentData documentData = new DocumentData();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			documentData = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseObject()),
					DocumentData.class);
		// documentData=br.getResponseObject();
		System.out.println("file name is:--" + documentData.getDocumentName());
		System.out.println("file path is:--"
				+ documentData.getFileStoragePathURI());
		InputStream file = new FileInputStream(new File(
				documentData.getFileStoragePathURI()));
		System.out.println("file:----" + file.available());
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ documentData.getDocumentName() + "\"");
		FileCopyUtils.copy(file, response.getOutputStream());
	}

	@RequestMapping(value = "/getUserForTaggingList", method = {
			RequestMethod.GET, RequestMethod.POST })
	public void getUserForTaggingList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List allDataList = new ArrayList();
		UserSession userSession = AuthHandler.getCurrentUser();
		String partyId;
		String searchText;
		partyId = request.getParameter("partyId");
		searchText = request.getParameter("post");
		// System.out.println("partyId==========="+partyId);
		// System.out.println("searchText==========="+searchText);
		/* buId should come from session */
		int buId = userSession.getBuId();
		// System.out.println("buId in getUserForTaggingList==========="+buId);
		url = URL_GET_USER_FOR_TAGGING_LIST + userSession.getName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("searchText", searchText);
		uriCB.queryParam("buId", buId);
		List userTaggingList = (List) FiinfraUtility.postRequest(uriCB,
				List.class, restTemplate);
		allDataList.add(userTaggingList);

		// Gson gson= new Gson();
		// System.out.println("getUserForTaggingList========="+gson.toJson(allDataList));

		// System.out.println("userTaggingList:------------------"+userTaggingList);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, allDataList);
	}

}
