package in.fiinfra.alert.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.Alerts;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.partner.controller.PartnerProfileController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/alert")
public class AlertController 
{
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	ObjectMapper objectMapper;
	
	@Autowired
	private CommonController commonController;
	
	private static final Logger LOGGER = Logger.getLogger(AlertController.class);
	
	@Value("${GET_ALERTS_FOR_PARTYID}")
	private String GET_ALERTS_FOR_PARTYID; 
	

	@Value("${URL_SEND_CUSTOM_PING}")
	private String URL_SEND_CUSTOM_PING;
	

	@RequestMapping(value="/showAlerts", method=RequestMethod.GET)
	public String showAlertsForParty(Model model,HttpServletRequest request,final RedirectAttributes redirectAttributes)
	{
		try
		{
			Integer noOfAlerts = 0;
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			if(userSession == null) 
			{
				return "redirect:/login";
			}
			
			String partnerSetupLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 283);// Partner Setup links
			model.addAttribute("partnerSetupLinks", partnerSetupLinks);
			request.getSession().setAttribute("partnerSetupLinks", partnerSetupLinks);
			
			String roleBaseLinks =commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
					(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 323);// Partner Dashboard links
			model.addAttribute("roleBaseLinks", roleBaseLinks);
			request.getSession().setAttribute("smallMenuLinks", roleBaseLinks);

			
			userSession.getPartyId();
			Alerts alerts = new Alerts();
			String token = "45g";
			Integer partyId = userSession.getPartyId();
			//code for hierarchy 
			model.addAttribute("hierarchy", 1);
			String nodeId = request.getSession().getAttribute("nodeId").toString();
			String url=GET_ALERTS_FOR_PARTYID+userSession.getUserName()+"/"+partyId+"/"+nodeId+"/"+token;
			BaseResponse<Alerts> response = new BaseResponse<>();
			response=restTemplate.getForObject(url, BaseResponse.class);
			if(response.getStatus().equalsIgnoreCase(FiinfraConstants.SUCCESS))
			{
				alerts = objectMapper.readValue(objectMapper.writeValueAsString(response.getResponseObject()), Alerts.class);
			}
			List<Task> taskList = alerts.getListOfTask();
			List<QueryData> queryList = alerts.getListOfQuery();
			model.addAttribute("taskList", taskList);
			model.addAttribute("queryList", queryList);

					
		} 
		catch (Exception exception) 
		{
			LOGGER.debug("error while getting list of alerts "+exception);
			redirectAttributes.addFlashAttribute("error", "Please try again later.");
			return "redirect:/login";
		} 		
	return "alert";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/reportIssue")
	public String showReportIsssue() 
	{
		return "profile/reportIssue";
	}

	@RequestMapping(method=RequestMethod.POST, value="/notifyIssue")
	public String  notifyIssue(HttpServletRequest request,HttpServletResponse response,NotifyTemplateData notifyTemplateData,final RedirectAttributes redirectAttributes) throws IOException
	{
		String url="";
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int buId = userSession.getBuId();
		int partyID=userSession.getPartyId();
		long currentTime = new Date().getTime();
		List<DocumentData> documentDatas = new ArrayList<DocumentData>();
		MultipartFile[] m = notifyTemplateData.getTemplateAttachment();
		notifyTemplateData.setTemplateAttachment(null);
		documentDatas = FiinfraUtility.getDocumentDatasFromMultiPartFiles(m,
		currentTime, createdBy);
		notifyTemplateData.setDocumentDatas(documentDatas);
		if (documentDatas.size() > 0) {
			notifyTemplateData.setAttachmentCount(documentDatas.size());
			notifyTemplateData.setAttachment(true);
		}
			notifyTemplateData.setNotifyTypeID(56002);
			notifyTemplateData.setPublic(true);
			notifyTemplateData.setSourceSystemID(FiinfraConstants.DIY);
			notifyTemplateData.setCreatedBy(createdBy);
			notifyTemplateData.setLastModifiedBy(createdBy);
			notifyTemplateData.setSessionId(request.getSession().getId());
			
			url = URL_SEND_CUSTOM_PING + userSession.getUserName() + "/1234";
			BaseResponse<String> br = new BaseResponse<String>();
			List<String> resultList=new ArrayList<>();
			br = restTemplate.postForObject(url, notifyTemplateData, BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				resultList = br.getResponseListObject();
			int recordCount=Integer.parseInt(resultList.get(0));
			if(recordCount>0){
				String basePath = resultList.get(1);
				if (documentDatas.size() > 0) {
					FiinfraUtility.uploadAttachments(m, basePath,
							currentTime);
				}
			}
			
		redirectAttributes.addFlashAttribute("success","your issue has been logged successfully" );	
		return "redirect:/partner/dashboard?flag=0";
	}

	
}
