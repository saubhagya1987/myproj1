package in.fiinfra.partner.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Path;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/hierarchy")
public class HierarchyController 
{
	private static final Logger LOGGER = Logger.getLogger(HierarchyController.class);
	
	@Value("${URL_GET_NODE_OR_PARTNER_NAME}")
	private String URL_GET_NODE_OR_PARTNER_NAME;
	
	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping(method=RequestMethod.GET,value="/updateNode")
	public @ResponseBody String updateNode(HttpServletRequest request)
	{
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		Integer oldPartyId =(Integer) request.getSession().getAttribute("oldPartyID");
		request.getSession().setAttribute("oldPartyID", userSession.getPartyId());
		request.getSession().removeAttribute("isPartnerChanged");
		int nodeId=Integer.parseInt(request.getParameter("nodeId"));
		int partyId=Integer.parseInt(request.getParameter("partyId"));
		String token = "abc";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_NODE_OR_PARTNER_NAME+userSession.getName()+"/"+token);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("currentNodeId", nodeId);
			
		BaseResponse<String> br1= new BaseResponse<String>();
		br1= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		String name = br1.getResponseObject();
		request.getSession().setAttribute("selectedNode", name);
		LOGGER.info("nodeId:---"+nodeId);
		LOGGER.info("partyId:---"+partyId);
		request.getSession().setAttribute("nodeId", nodeId);
		request.getSession().setAttribute("HPartyId", userSession.getPartyId());
		if(nodeId==0){
			if(oldPartyId != partyId)
			{
				request.getSession().setAttribute("isPartnerChanged", true);
			}
			((UserSession) request.getSession().getAttribute("userSession")).setPartyId(partyId);
		}
		return "success";
	}

}
