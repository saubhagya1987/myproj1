package in.fiinfra.controller;


import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.DepartmentListData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;

import java.io.IOException;   
import java.io.PrintWriter;  
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class DepartmentListController extends MultiActionController {
	
	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(DepartmentListController.class);
	 
	private RestTemplate restTemplate;
	String url;
	
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
 
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
	
	private ObjectMapper objectMapper;  
	 
	public ObjectMapper getObjectMapper() {    
		return objectMapper;  
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}     
	  
	@Value("${URL_GET_DEPARTMENT_LIST}")
	private String URL_GET_DEPARTMENT_LIST;
	@Value("${URL_DELETE_DEPARTMENT}")
	private String URL_DELETE_DEPARTMENT; 
	@Value("${URL_GET_DEPARTMENT_BIZUNIT}")
	private String URL_GET_DEPARTMENT_BIZUNIT; 
	@Value("${URL_GET_DEPARTMENT_SECTION}")
	private String URL_GET_DEPARTMENT_SECTION; 
	@Value("${URL_ADD_DEPARTMENT}")
	private String URL_ADD_DEPARTMENT; 
	@Value("${URL_UPDATE_DEPARTMENT}")
	private String URL_UPDATE_DEPARTMENT; 
	@Value("${URL_CASCADE_DELETE}")
	private String URL_CASCADE_DELETE;
	
	
	public ModelAndView getDepartmentlist(HttpServletRequest request,
			HttpServletResponse response) throws IOException
	{
			
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int sessionid =userSession.getBuId();
			ModelAndView mav = new ModelAndView("department/department_list");
			
			try {
					url = URL_GET_DEPARTMENT_LIST+userSession.getUserName()+"/1234";
					UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					uriCB.queryParam("sessionbuId", sessionid);
					BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>(); 
					br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
					List<DepartmentListData> departmentList = new ArrayList<DepartmentListData>();
					if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					departmentList=br.getResponseListObject();
			/*		mav.addObject("departmentList", departmentList);*/
					mav.addObject("departmentList", objectMapper.writeValueAsString(departmentList));
					PrintWriter out= null; 
					try {   
						out = response.getWriter();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						logger.error(e);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch 
					logger.error(e);
				}
				   return mav;
	}  
	
	   

	public void deleteList(HttpServletRequest request,HttpServletResponse response) throws IOException 
	  {
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String list=request.getParameter("Lists");
			int userID = userSession.getUserId() ;
			url = URL_DELETE_DEPARTMENT + userSession.getUserName()+ "/1234";
			logger.debug("selectedlvalzzzzzzzzzzzzzzzzzzzzzzzzzzzzz:::"+request.getParameter("Lists"));
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("Lists", list);
			uriCB.queryParam("userID", userID); 
		
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			Integer departmentList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				departmentList= br.getResponseObject();  
			  
			Logger.logEntry(this.getClass(), "departmentList:---"+ departmentList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			
			//insert code for audit functionality
			   
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 
									97109, 
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_DEPARTMENT, 
									FiinfraConstants.SRP_DELETE_DEPARTMENT, 
									"SP="+FiinfraConstants.SP_DELETE_DEPARTMENT+",List="+list, 
									"Department Names : "+list);
			 
			   
			PrintWriter out = null;  
			out = response.getWriter();   
			response.setContentType("application/json");
			objectMapper.writeValue(out, departmentList); 
				  
			}    

	public void cascadeDeleteList(HttpServletRequest request,HttpServletResponse response) {
		 
		 try {
		  UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		  logger.debug(userSession.getUserName());
		  url = URL_CASCADE_DELETE +"ramu"+"/1234";
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  uriCB.queryParam("deletelist",request.getParameter("Lists"));
		  Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		  BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>();
		  br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  List<DepartmentListData> list = new ArrayList<DepartmentListData>();
		  if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		  list= br.getResponseListObject(); 
		  Logger.logEntry(this.getClass(), "DATA LIST:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		  PrintWriter out = null;
		  out = response.getWriter();
		  response.setContentType("application/json");
		  objectMapper.writeValue(out, list);
		 } catch (Exception e) { 
			 logger.error(e); 
		 }
		}  
	
	public void getBizunitSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_DEPARTMENT_BIZUNIT + userSession.getUserName()+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<DepartmentListData> bizUnitlist = new ArrayList<DepartmentListData>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			bizUnitlist= br.getResponseListObject();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			bizUnitlist= br.getResponseListObject();
		
		Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ bizUnitlist, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, bizUnitlist);  
	}
	
	public void getDepartmentSection(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		 
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_DEPARTMENT_SECTION + userSession.getUserName()+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<DepartmentListData> br = new BaseResponse<DepartmentListData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		List<DepartmentListData> deptlist = new ArrayList<DepartmentListData>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			deptlist= br.getResponseListObject();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			deptlist= br.getResponseListObject();
		
		Logger.logEntry(this.getClass(), "bizUnitSectionList:---"+ deptlist, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, deptlist);   
	}
	
   
	public void addDepartment(HttpServletRequest request,
			HttpServletResponse response) throws IOException {  
			
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String bizUnit_Name =request.getParameter("bizUnitName");   
			int departmenttypeid = Integer.parseInt( request.getParameter("departmentType"));
			String department_Name = request.getParameter("departmentName");
			String departmentShort_Name = request.getParameter("departmentShortName");  
			
			
			url = URL_ADD_DEPARTMENT + userSession.getUserName()+ "/1234";
			
			DepartmentListData  departmentVo = new DepartmentListData();
			departmentVo.setBizUnit(bizUnit_Name); 
			departmentVo.setDepartment_Name(department_Name);
			departmentVo.setDepartmentname(department_Name);  
			departmentVo.setDepartmentTypeID(departmenttypeid); 
			departmentVo.setDepartment_SortName(departmentShort_Name);
			departmentVo.setCreateby(userSession.getUserId());  
			  
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, departmentVo, BaseResponse.class);
			int recordCount=0;
			Integer addDepartmentList=null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				recordCount = br.getResponseObject(); 
			
			//if(recordCount == 1)
			//{ 
				//insert code for audit functionality
				FiinfraUtility.doAudit(userSession.getPartyId(),
										userSession.getUserId(), 97107,
										FiinfraConstants.SERVICE_PORTAL,
										FiinfraConstants.SRP_SOURCE_MODULE_DEPARTMENT,
										FiinfraConstants.SRP_ADD_DEPARTMENT,  
										"SP="+FiinfraConstants.SP_ADD_NEW_DEPARTMENT+",bizUnit_Name="+bizUnit_Name+",department_Name="+department_Name+",department type id="+departmenttypeid+",departmentShort_Name="+departmentShort_Name, 
										"Department Names : " + department_Name);
			//}   
			
			PrintWriter out = null; 
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, recordCount);        
		
	}
	
	public void departmentUpdate(HttpServletRequest request,
		HttpServletResponse response) throws IOException {
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int departmentId=Integer.parseInt(request.getParameter("departmentIdEdit")) ; 
		String bizunitName = request.getParameter("bizunitEdit");        
		String department_Type = request.getParameter("departmentTypeEdit"); 
		int departmenttypeid = Integer.parseInt(request.getParameter("departmentTypeEdit"));   
		//String department_Type = request.getParameter("departmentTypeEdit");   
		String department_Name = request.getParameter("departmentNameEdit");
		String departmentShort_Name = request.getParameter("departmentShortNameEdit");   
		   
		DepartmentListData  departmentVo = new DepartmentListData();
		departmentVo.setDepartmentId(departmentId); 
		departmentVo.setBizUnit(bizunitName);;
		departmentVo.setDepartmentTypeID(departmenttypeid);
		departmentVo.setDepartment_Type(department_Name);  
		departmentVo.setDepartment_Name(department_Name);    
		departmentVo.setDepartment_SortName(departmentShort_Name); 
		departmentVo.setCreateby(userSession.getUserId());     
		 
		
		url = URL_UPDATE_DEPARTMENT + userSession.getUserName()+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
	
		br = restTemplate.postForObject(url, departmentVo, BaseResponse.class); 
		Integer updatedepartmentList=null; 
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			updatedepartmentList= br.getResponseObject();
		Logger.logEntry(this.getClass(), "codeValueDataList:---"+ updatedepartmentList, Logger.DEBUG, Thread.currentThread()
				.getStackTrace()[1].getMethodName());
		
		//insert code for audit functionality
		FiinfraUtility.doAudit(userSession.getPartyId(),
								userSession.getUserId(), 97108,
								FiinfraConstants.SERVICE_PORTAL,
								FiinfraConstants.SRP_SOURCE_MODULE_DEPARTMENT,
								FiinfraConstants.SRP_EDIT_DEPARTMENT,
								"SP="+FiinfraConstants.SP_EDIT_DEPARTMENT+",bizUnit_Name="+bizunitName+",department_Name="+department_Name+",department type id="+departmenttypeid+",departmentShort_Name="+departmentShort_Name,
								"Department Name : "+department_Name);  
		 
		 
		PrintWriter out = null; 
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, updatedepartmentList);
		
	} 
}   
	

