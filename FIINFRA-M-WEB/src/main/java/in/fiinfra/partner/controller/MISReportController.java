package in.fiinfra.partner.controller;

import in.fiinfra.common.controller.CommonController;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/report")
public class MISReportController {
	private static final Logger LOGGER = Logger.getLogger(MISReportController.class);
	String url;
	@Autowired
	RestTemplate restTemplate;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private CommonController commonController;
	
	@RequestMapping(value = "/reports", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String reports(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		UserSession userSession =  (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null)
		{
			return "redirect:/login";
		}
		String rbsLinks = commonController.getRoleBasedSecurityIDS(userSession.getPartyId(),
				(String)request.getSession().getAttribute("USER_NAME"), userSession.getBuId(), 327);// MIS reports links
		model.addAttribute("rbsLinks",rbsLinks);
		request.getSession().removeAttribute("headerName");
		return "report/mis-report";
	}
	
	@RequestMapping(value = "/clientholding", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String clientholding(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientholding";
	}
	
	@RequestMapping(value = "/clientsipdue", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String clientsipdue(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientsipdue";
	}
	

	
	@RequestMapping(value = "/clientportfoliodetailedstatement", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String clientportfoliodetailedstatement(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientportfoliodetailedstatement";
	}
	
	@RequestMapping(value = "/clienttransactionhistory", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String clienttransactionhistory(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clienttransactionhistory";
	}
	
	@RequestMapping(value = "/clientmissingnomination", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String clientmissingnomination(Model model, HttpServletRequest request,
			HttpServletResponse response,
			final RedirectAttributes redirectAttributes) {
		request.getSession().removeAttribute("headerName");
		return "report/clientmissingnomination";
	}
	
	
	
	
	@RequestMapping(value = "/getContactList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public void  getContactList(HttpServletRequest request,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		
		String url = FiinfraUtility.getRestDBURL();
		String searchString=request.getParameter("searchString");
		//partner and bu id needs to fetch from session
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int createdBy = userSession.getUserId();
		int partnerId = userSession.getPartyId();
		int buId = userSession.getBuId();
		url = url + "services/et/quickSearchContacts?buId="+buId+"&searchString="+searchString+"&partnerId="+partnerId;
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		LOGGER.debug("url::::::"+url);
		List<ContactData> contactData= Arrays.asList(restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), ContactData[].class).getBody());
	    LOGGER.debug("contactData::::::"+contactData);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, contactData);
		}
	
}
