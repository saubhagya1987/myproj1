package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.service.vo.Role;
import in.fiinfra.cp.CommonUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;
//import org.w3c.tidy.Out;

import com.google.gson.JsonParseException;

public class RolelistController extends MultiActionController {
	
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(RolelistController.class);
	
	private RestTemplate restTemplate;

	private ObjectMapper objectMapper;

	@Value("${URL_LIST_ROLE}")
	private String URL_LIST_ROLE;

	@Value("${URL_LIST_UNIQUEROLE}")
	private String URL_LIST_UNIQUEROLE;

	@Value("${URL_ADD_ROLE}")
	private String URL_ADD_ROLE;

	@Value("${URL_UPDATE_ROLE}")
	private String URL_UPDATE_ROLE;

	@Value("${URL_DELETE_ROLE}")
	private String URL_DELETE_ROLE;

	@Value("${URL_ALL_ROLE_ACCESS_LIST}")
	private String URL_ALL_ROLE_ACCESS_LIST;

	@Value("${URL_SYSTEM_SOURCE_LIST}")
	private String URL_SYSTEM_SOURCE_LIST;

	@Value("${URL_UPDATE_ROLE_ACCESS_LIST}")
	private String URL_UPDATE_ROLE_ACCESS_LIST;

	String url;

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadrole", method = RequestMethod.GET)
	public ModelAndView loadrole(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		ModelAndView mav = new ModelAndView("role/role_list");
		
		String searchTextVal = null;
		String pagesize=request.getParameter("pageSize");
		if(pagesize==null){
			pagesize="10";
		}

		
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		try {
			
			Role role = new Role();
			role.setSearchText(searchTextVal);
			
			url = URL_LIST_ROLE + userSession.getUserName() + "/1234";
			BaseResponse<Role> br = new BaseResponse<Role>();
			br = restTemplate.postForObject(url, role, BaseResponse.class);
			
			List<Role> roleDataList = new ArrayList<Role>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				roleDataList = br.getResponseListObject();
		//mav.addObject("roleDataList", roleDataList);
			mav.addObject("roleDataList", objectMapper.writeValueAsString(roleDataList));
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addNewRole", method = RequestMethod.POST)
	public void addRole(HttpServletRequest request,HttpServletResponse response, Role roleData) throws IOException {
		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int userId = userSession.getUserId();
		roleData.setCreateOrModifiedBy(userId);
		url = URL_ADD_ROLE + userSession.getUserName() + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		
		br = restTemplate.postForObject(url, roleData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) 
		{
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
		/*	FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 
									97168,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_ROLE,
									FiinfraConstants.SRP_ADD_ROLE);
		
		*/
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_ROLE_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_ROLE,FiinfraConstants.SRP_ADD_ROLE,
					"SP="+FiinfraConstants.SP_ADD_NEW_ROLE+",RoleName="+roleData.getRoleName() +",RoleDescription="+roleData.getRoleDescription() +",isActive="+roleData.getisActive() +",StartDate="+ roleData.getStartDate() +",EndDate="+  roleData.getExpiryDate() +",CreateBy="+roleData.getCreateOrModifiedBy(),FiinfraConstants.SRP_ADD_ROLE);
			
		
		}

		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
		} 
		catch (IOException e) 
		{
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);

	}

	@SuppressWarnings("unchecked")
	public void getUniqueRoleName(HttpServletRequest request,
			HttpServletResponse response) throws IOException

	{
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String roleName = request.getParameter("roleName");

		url = URL_LIST_UNIQUEROLE + userSession.getUserName() + "/1234";

		
		Role role = new Role();
		role.setRoleName(roleName);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		
		br = restTemplate.postForObject(url, role, BaseResponse.class);
		//Integer codeValueDataList = null;
		Integer status = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			status = br.getResponseObject();
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, status);

	}

	@SuppressWarnings("unchecked")
	public void deleteRole(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		int userId = userSession.getUserId();
		String list = request.getParameter("Lists");
		url = URL_DELETE_ROLE + userSession.getUserName() + "/1234";

		
		Role role = new Role();
		role.setDeleteList(list);
		role.setCreateOrModifiedBy(userId);
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		
		br = restTemplate.postForObject(url, role, BaseResponse.class);
		//Integer codeValueDataList = null;
		String result = FiinfraConstants.FAIL;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), FiinfraConstants.SRP_DELETE_ROLE_EVENT_ID,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_ROLE,
									FiinfraConstants.SRP_DELETE_ROLE,
									"SP="+FiinfraConstants.SP_DELETE_ROLE+",RoleList="+role.getDeleteList()+",LastModifiedBy="+role.getCreateOrModifiedBy(),FiinfraConstants.SRP_DELETE_ROLE
					);
		}

		
		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);

	}

	@SuppressWarnings("unchecked")
	public void roleUpdate(HttpServletRequest request,
			HttpServletResponse response, Role roleData) throws IOException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int userId = userSession.getUserId();
		boolean isActive = false;
		roleData.setCreateOrModifiedBy(userId);
		String isActiveString = request.getParameter("isactiveId");
		if (isActiveString != null
				&& (isActiveString.equals("on") || isActiveString.equals("1"))) {
			isActive = true;
		}

		

		url = URL_UPDATE_ROLE + userSession.getUserName() + "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, roleData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			/*FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97169,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_ROLE,
									FiinfraConstants.SRP_EDIT_ROLE);
			*/
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_EDIT_ROLE_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_ROLE,	FiinfraConstants.SRP_EDIT_ROLE,
					"SP="+FiinfraConstants.SP_EDIT_ROLE+",RoleID="+roleData.getRoleId()+",RoleName="+roleData.getRoleName() +",RoleDescription="+roleData.getRoleDescription() +",isActive="+roleData.getisActive() +",StartDate="+ roleData.getStartDate() +",EndDate="+  roleData.getExpiryDate() +",ModifyBy"+roleData.getCreateOrModifiedBy(),FiinfraConstants.SRP_EDIT_ROLE);
			
			
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		}
		catch (IOException e)
		{
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);

	}

	// role access list related methods start

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/roleAccessList", method = RequestMethod.GET)
	public ModelAndView roleAccessList(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		ModelAndView mav = new ModelAndView("role/role_access_list");

		int sourceId = 0;
		int roleId = 0;
		String memberName = null;
		String searchTextVal = null;
		
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
		
		
		if (request.getParameterMap().containsKey("sourceId")) {
			sourceId = Integer.parseInt(request.getParameter("sourceId"));

		} else {
			sourceId = 31001;

		}

		if (request.getParameterMap().containsKey("roleId")
				&& request.getParameterMap().containsKey("roleName")) {
			roleId = Integer.parseInt(request.getParameter("roleId"));
			memberName = request.getParameter("roleName");
		} else {
			
			roleId = Integer.parseInt(request.getParameter("roleId"));

		}
		
		// roleId = Integer.parseInt(request.getParameter("roleId"));
		RoleAccess roleAccess = new RoleAccess();
		roleAccess.setSourceSystemId(sourceId);
		roleAccess.setRoleId(roleId);
		roleAccess.setSearchText(searchTextVal);
		
		HttpSession hes=request.getSession();
		hes.setAttribute("setattrroleid", request.getParameter("roleId"));
		hes.setAttribute("setattrrolename", request.getParameter("roleName"));
		hes.setAttribute("setattrmembername", request.getParameter("memberName"));
/*		request.setAttribute("setattrroleid",request.getParameter("roleId"));
		request.setAttribute("setattrrolename",request.getParameter("memberName"));*/
		
		
		try {
			//get system source id list
			url = URL_SYSTEM_SOURCE_LIST + userSession.getUserName() + "/1234";
			
			BaseResponse<RoleAccess> br = new BaseResponse<RoleAccess>();
			br = restTemplate.postForObject(url, roleAccess, BaseResponse.class);
			List<RoleAccess> sourceList = new ArrayList<RoleAccess>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				sourceList = br.getResponseListObject();

			mav.addObject("sourceList", sourceList);
			
			
			url = URL_ALL_ROLE_ACCESS_LIST + userSession.getUserName()
					+ "/1234";
			br = restTemplate.postForObject(url, roleAccess, BaseResponse.class);
			
			List<RoleAccess> roleAccessList = new ArrayList<RoleAccess>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				roleAccessList = br.getResponseListObject();
			//mav.addObject("roleAccessList", roleAccessList);
			mav.addObject("roleAccessList", objectMapper.writeValueAsString(roleAccessList));
			mav.addObject("roleId", roleId);
			mav.addObject("sourceId", sourceId);
			mav.addObject("memberName", memberName);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}

	
	@SuppressWarnings("unchecked")
	public void saveNewRoleAccessList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		if (request.getParameter("selectedlvalz") != null) {

			String list = request.getParameter("selectedlvalz");
			int roleId = Integer.parseInt(request.getParameter("roleId"));
			int sourceId = Integer.parseInt(request.getParameter("sourceId"));
			
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			
			int createdby = userSession.getUserId();

			url = URL_UPDATE_ROLE_ACCESS_LIST + userSession.getUserName()
					+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("roleId", roleId);
			uriCB.queryParam("createdby", createdby);
			uriCB.queryParam("sourceId", sourceId);

			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.getForEntity(
					FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
					.getBody();
			Integer result = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				result = br.getResponseObject();
			
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97171,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_ROLE,
									FiinfraConstants.SRP_EDIT_ROLE_ACCESS_LIST);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, result);
		}
	}
	//

	 public void roleExecl(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in Role excel");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;
		  }
		   Role role = new Role();
		
			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
		  //TODO change hard coding
		  Integer advisorPartyId = userSession.getPartyId(); //6326
		  Integer buId = userSession.getBuId();
		  String token = "153443";
		  url = URL_LIST_ROLE+"ramu"+"/1234";
		
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("searchText", searchTextVal);
		  BaseResponse<Role> baseResponse = new BaseResponse<Role>();
		  
		  
		  baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),role, BaseResponse.class);
		 
		  
		  List<Role> roleListAsJson = new ArrayList<Role> ();
		  List<Role> roleList = new ArrayList<Role> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   roleListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<roleListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   Role roleList2;
				   roleList2 = objectMapper.readValue(objectMapper.writeValueAsString(roleListAsJson.get(i)), Role.class);
									
					
				  roleList.add(roleList2);
				}


		   } catch (JsonParseException e) {
			   logger.error(""+e);
		   } catch (JsonMappingException e) {
			   logger.error(""+e);
		   } catch (JsonGenerationException e) {
			   logger.error(""+e);
		   } catch (IOException e) {
			   logger.error(""+e);
		   }
		  }
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=RoleList.xls");
		   
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Role Name"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Start Date"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Expiry Date"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Status"));
		   
	
		   
		   writer.println();
		   for(Role list:roleList){
			   
				    
		   
		    writer.print(CommonUtils.escape(list.getRoleName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getStartDate()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getExpiryDate()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getisActive()==true?"Active":"InActive"));
		    writer.println();
		    
		   }
		       
		  } catch (IOException e) {
			  logger.error(""+e);
		  }
		 }
	
	
	
	 
	 

	 public void roleCSV(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in Role excel");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		  try{
		  
		   if(userSession == null) {
		   response.sendRedirect("/login");
		   return ;
		  }
		   Role role = new Role();
		   String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal ="";
			}
		  //TODO change hard coding
		  Integer advisorPartyId = userSession.getPartyId(); //6326
		  Integer buId = userSession.getBuId();
		  String token = "153443";
		  url = URL_LIST_ROLE+"ramu"+"/1234";
		  //UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_FAQ_LIST + "/"+userSession.getUserName()+"/" + advisorPartyId + "/"+token+"&buId="+buId);
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("searchText", searchTextVal);
		  BaseResponse<Role> baseResponse = new BaseResponse<Role>();
		  
		  //call service for all parties associated 
		  baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),role, BaseResponse.class);
		  //baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		  
		  List<Role> roleListAsJson = new ArrayList<Role> ();
		  List<Role> roleList = new ArrayList<Role> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   roleListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<roleListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
				   Role roleList2;
				   roleList2 = objectMapper.readValue(objectMapper.writeValueAsString(roleListAsJson.get(i)), Role.class);
									
					
				  roleList.add(roleList2);
				}


		   } catch (JsonParseException e) {
			   logger.error(""+e);
		   } catch (JsonMappingException e) {
			   logger.error(""+e);
		   } catch (JsonGenerationException e) {
			   logger.error(""+e);
		   } catch (IOException e) {
			   logger.error(""+e);
		   }
		  }
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=RoleList.csv");
		   
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Role Name"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Start Date"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Expiry Date"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Status"));
		   
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   writer.println();
		   
		   for(Role list:roleList){
			   
				    
		   
		    writer.print(CommonUtils.escape(list.getRoleName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getStartDate()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getExpiryDate()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getisActive()==true?"Active":"InActive"));
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
			  logger.error(""+e);
		  }
		 }
	
	
	 

	 
	 @SuppressWarnings("unchecked")
		public void roleAccessListExport(HttpServletRequest request,
				HttpServletResponse response) {

			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			
			int sourceId = 0;
			int roleId = 0;
			String memberName = null;
			String searchTextVal = null;
			
			String userToken = null;
			if (userSession.getUserName() != null) {
				userToken = userSession.getUserName();
			} else {
				userToken = "abc";
			}

			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
			
			
			if (request.getParameterMap().containsKey("sourceId")) {
				sourceId = Integer.parseInt(request.getParameter("sourceId"));

			} else {
				sourceId = 31001;

			}

			if (request.getParameterMap().containsKey("roleId")
					&& request.getParameterMap().containsKey("roleName")) {
				roleId = Integer.parseInt(request.getParameter("roleId"));
				memberName = request.getParameter("roleName");
			} else {
				roleId = 0;

			}
			// roleId = Integer.parseInt(request.getParameter("roleId"));
			RoleAccess roleAccess = new RoleAccess();
			roleAccess.setSourceSystemId(sourceId);
			roleAccess.setRoleId(roleId);
			roleAccess.setSearchText(searchTextVal);
			
		

			try {

				List<RoleAccess> premAsJson = new ArrayList<RoleAccess>();
				List<RoleAccess> premumList = new ArrayList<RoleAccess>();

				//get system source id list
				url = URL_SYSTEM_SOURCE_LIST + userSession.getUserName() + "/1234";
				
				BaseResponse<RoleAccess> baseResponse = new BaseResponse<RoleAccess>();
				baseResponse = restTemplate.postForObject(url, roleAccess, BaseResponse.class);
				List<RoleAccess> sourceList = new ArrayList<RoleAccess>();
				if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					sourceList = baseResponse.getResponseListObject();

				url = URL_ALL_ROLE_ACCESS_LIST + userSession.getUserName()
						+ "/1234";
				baseResponse = restTemplate.postForObject(url, roleAccess, BaseResponse.class);

				if (baseResponse.getStatus().equalsIgnoreCase(
						FiinfraConstants.success)) {
					try {
						premAsJson = objectMapper.readValue(objectMapper
								.writeValueAsString(baseResponse
										.getResponseListObject()), ArrayList.class);

						for (int i = 0; i < premAsJson.size(); i++) {
							// get the actual party object from its LinkedHashMap
							// representation
							RoleAccess list2;
							list2 = objectMapper.readValue(objectMapper
									.writeValueAsString(premAsJson.get(i)),
									RoleAccess.class);

							premumList.add(list2);
						}

					} catch (JsonParseException e) {
						logger.error(""+e);
					} catch (JsonMappingException e) {
						logger.error(""+e);
					} catch (JsonGenerationException e) {
						logger.error(""+e);
					} catch (IOException e) {
						logger.error(""+e);
					}
				}

				String type = request.getParameter("type");
				String seperator = ",";
				if (type.equals("CSV")) {
					response.addHeader("Content-Disposition",
							"attachment;filename=roleAccessList.csv");
					seperator = ",";
				}
				if (type.equals("excel")) {
					response.addHeader("Content-Disposition",
							"attachment;filename=roleAccessList.xls");
					seperator = "\t";
				}

				
				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Object Type"));

				writer.print(seperator);
				writer.print(CommonUtils.escape("Object Name"));
				
				writer.print(seperator);
				writer.print(CommonUtils.escape("Action Name"));
				
				writer.print(seperator);
				writer.print(CommonUtils.escape("Last Updated By"));
				
				writer.print(seperator);
				writer.print(CommonUtils.escape("Last Updated On"));
				

				writer.println();
				for (RoleAccess list : premumList) {

					writer.print(CommonUtils.escape("" + list.getObjectType()));
					writer.print(seperator);

					writer.print(CommonUtils.escape("" + list.getObjectName()));
					writer.print(seperator);
					
					writer.print(CommonUtils.escape("" + list.getActionName()));
					writer.print(seperator);
					
					writer.print(CommonUtils.escape("" + list.getLastUpdatedBy()));
					writer.print(seperator);
					
					writer.print(CommonUtils.escape("" + list.getLastModifiedDate()));
					writer.print(seperator);

					writer.println();
				}

				// }

			} catch (Exception e) {
				logger.error(""+e);
			}

		}
	
}
