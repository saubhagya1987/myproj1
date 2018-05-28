package in.fiinfra.common;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.common.SyncRequest;
import in.fiinfra.common.common.UserTokenRequest;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.ContactSyncResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
@RequestMapping("/sync")
public class SyncController extends AbstractController {

	@Autowired
	SyncService syncService;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public @ResponseBody
	BaseResponse<Boolean> register(HttpServletRequest request, Model m,
			HttpServletRequest servletRequest, HttpServletResponse response,
			UserTokenRequest req) throws IOException {

		BaseResponse<Boolean> rep = new BaseResponse<Boolean>();
		req.setSourceSystemId(FiinfraConstants.INTEGRATION_PORTAL);

		// check username if active and not already registered.
		// if Ok then generate 6digit radom number and save it in database
		// and create notification and return sucesss

		return syncService.register(req);

	}

	@RequestMapping(value = "/activate", method = RequestMethod.POST)
	public @ResponseBody
	BaseResponse<String> activate(HttpServletRequest request, Model m,
			HttpServletRequest servletRequest, HttpServletResponse response,
			UserTokenRequest req) throws IOException {
		req.setSourceSystemId(FiinfraConstants.INTEGRATION_PORTAL);
		// check username and otp is valid
		// if valid generate token using device+userName+otp and encrypt it
		// using a random seed
		// save token in database
		// return token
		return syncService.activate(req);

	}

	@RequestMapping(value = "/getSync", method = RequestMethod.POST)
	public @ResponseBody
	BaseResponse<SyncData> getContactData(HttpServletRequest request, Model m,
			HttpServletRequest servletRequest, HttpServletResponse response)
			throws IOException {

		UserSession userSession = AuthHandler.getCurrentUser();
		// UserSession userSession = new UserSession();

		SyncRequest req = new SyncRequest();
		req.setPartyId(userSession.getPartyId());
		req.setLastUpdatedBy(userSession.getUserId());
		long lastSyncTime = CommonUtils.toLong(request
				.getParameter("lastSyncTime"));
		if (lastSyncTime > 0) {
			req.setLastSyncTime(lastSyncTime);
		}
		// req.setLastSyncTime(new Date(0L));
		BaseResponse<SyncData> data = syncService.getSyncData(req);
		data.getResponseObject().setThemeId(userSession.getThemeId());
		return data;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public @ResponseBody
	BaseResponse<ContactSyncResponse> sync(HttpServletRequest request) {
		String data = request.getParameter("data");
		SyncData syncData = new Gson().fromJson(data, SyncData.class);
		UserSession user = AuthHandler.getCurrentUser();
		syncData.setUserId(user.getUserId());
		syncData.setPartnerId(user.getPartyId());
		BaseResponse<ContactSyncResponse> response = new BaseResponse<ContactSyncResponse>();
		//
		// //SyncData syncData=new SyncData();
		// SyncContactData contact=new SyncContactData();
		//
		// DcAttribute[] dcAttArray=new DcAttribute[1];
		// dcAttArray[0]=new DcAttribute();
		// dcAttArray[0].setAttributeCodeId(94018);
		// dcAttArray[0].setAttributeValue("68");
		// dcAttArray[0].setAttributeReferenceValue("67");
		//
		//
		//
		// DcGoal[] dcGoals=new DcGoal[1];
		// dcGoals[0]=new DcGoal();
		// dcGoals[0].setEndYear("2035");
		// dcGoals[0].setGoalAmountPv("2000000");
		// dcGoals[0].setGoalTypeId(35001);
		// dcGoals[0].setGoalDescription("Higher Education");
		// contact.setDcAttribute(dcAttArray);
		// contact.setDcGoals(dcGoals);
		// contact.setfName("Kishore1");
		// contact.setlName("Patel1");
		// contact.setEmailId("kishore.patel1@gmail.com");
		// contact.setMaritalStatusId(13001);
		// contact.setDob("19/07/1984");
		// contact.setMobile("8974855134");
		// //contact.setPartyId(350697);
		// contact.setLocalId(1);
		//
		// List<SyncContactData> lst=new ArrayList<SyncContactData>();
		// lst.add(contact);
		// syncData.setContacts(lst);
		// UserSession userSession = AuthHandler.getCurrentUser();
		// syncData.setPartnerId(userSession.getPartyId());
		// syncData.setCreatedBy(userSession.getUserId());
		// syncData.setLastModifiedBy(userSession.getUserId());
		// System.out.println(new Gson().toJson(syncData));
		return syncService.saveSync(syncData);
		// return null;
		// response.setResponseObject(sync);
		// response.setStatus("true");
		// return "Status :" + response.getStatus();
	}

	@RequestMapping(value = "/resend", method = RequestMethod.POST)
	public @ResponseBody
	BaseResponse<Boolean> resend(HttpServletRequest request,
			UserTokenRequest req) {
		BaseResponse<SyncData> response = new BaseResponse<SyncData>();
		SyncData sync = new SyncData();
		response.setStatus("true");
		response.setResponseObject(sync);
		req.setSourceSystemId(FiinfraConstants.INTEGRATION_PORTAL);
		return syncService.register(req);
	}

	@RequestMapping(value = "/confirmToken", method = RequestMethod.POST)
	public @ResponseBody
	BaseResponse<SyncData> confirmToken(HttpServletRequest request,
			UserTokenRequest req) {
		BaseResponse<Boolean> response = new BaseResponse<Boolean>();
		response.setStatus("true");
		req.setSourceSystemId(FiinfraConstants.INTEGRATION_PORTAL);
		BaseResponse<SyncData> sync = syncService.confirmToken(req);

		return sync;
	}

	@RequestMapping(value = "report/files", method = RequestMethod.GET)
	@ResponseBody
	public void downloadFile(Integer fileId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		/*
		 * if(!true){ response.setContentType("");
		 * response.setHeader("Content-Disposition", "inline; filename=\"" + "a"
		 * + "\""); FileCopyUtils.copy(new FileInputStream(new
		 * File("D:/Stuff/a.pdf")), response.getOutputStream());
		 * response.flushBuffer(); return ; }
		 */
		DocumentRequest req = new DocumentRequest();
		UserSession user = AuthHandler.getCurrentUser();

		req.setBuId(user.getBuId());
		req.setPartyId(user.getPartyId());
		req.setDocumentId(fileId);
		DocumentData doc = syncService.getDocument(req);

		try {
			File f = new File(doc.getFileStoragePathURI());
			if (f.exists()) {
				String fileType = doc.getFileName().substring(
						doc.getFileName().lastIndexOf(".") + 1);

				response.setContentType(getContentType(fileType));
				response.setHeader("Content-Disposition", "inline; filename=\""
						+ doc.getFileName() + "\"");
				FileCopyUtils.copy(
						new FileInputStream(doc.getFileStoragePathURI()),
						response.getOutputStream());
				response.flushBuffer();
			} else {
				PrintWriter writer;
				try {
					writer = response.getWriter();
				} catch (IOException e1) {
					try {
						response.sendRedirect("/document/view");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					;
					return;
				}
				writer.write("<div id='errorMsg'>Error downloading File. File Not Found. </div>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// response.setHeader("Content-Disposition",
		// "attachment; filename="+doc.getFileName());

		// return new FileSystemResource(doc.getFileStoragePathURI());
	}

	public static String getContentType(String fileType) {
		if ("pdf".equalsIgnoreCase(fileType)) {
			return "application/pdf";
		}
		if ("doc".equalsIgnoreCase(fileType)
				|| "docx".equalsIgnoreCase(fileType)) {
			return "application/msword";
		}
		if ("xls".equalsIgnoreCase(fileType)) {
			return "application/vnd.ms-excel";
		}
		if (FiinfraUtility.isImageType(fileType)) {
			return "application/image";
		}

		return "application/octet-stream";

	}

	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public @ResponseBody
	BaseResponse<Boolean> sendEmail(Integer fileId, HttpServletRequest request,
			UserTokenRequest req) {
		UserSession user = AuthHandler.getCurrentUser();
		Notification notification = new Notification();
		Map<String, String> payloadMap = new HashMap<String, String>();
		payloadMap.put("user", user.getName());
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(user.getPartyId());
		notification.setNotifyEventID(430);
		notification.setAttachment1DocumentID(fileId);
		notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(user.getBuId());
		notification.setPayloadMap(payloadMap);
		// notification.setAttachment1DocumentID(doc.getDocumentId());
		// notification.setSessionID(getSession().getId());
		FrameworkUtil.notify(notification);
		return syncService.register(req);
	}

}
