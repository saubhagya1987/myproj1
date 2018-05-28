package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.CodeTypeData;
import in.fiinfra.common.service.vo.CodeValueData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.Logger;
import in.fiinfra.cp.CommonUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.google.gson.JsonParseException;


public class CodetypeController extends MultiActionController
{
	private RestTemplate restTemplate;

	private ObjectMapper objectMapper;

	
	@Value("${URL_GET_CODETYPE_LIST}")
	private String URL_GET_CODETYPE_LIST;
	
	@Value("${URL_GET_MAXCODETYPEID}")
	private String URL_GET_MAXCODETYPEID;
	
	@Value("${URL_ADD_NEWCODETYPE}")
	private String URL_ADD_NEWCODETYPE;
	
	@Value("${URL_UPDATE_CODETYPE}")
	private String URL_UPDATE_CODETYPE;
	
	@Value("${URL_DELETE_CODETYPE}")
	private String URL_DELETE_CODETYPE;
	
	@Value("${URL_GET_VIEWCODETYPE}")
	private String URL_GET_VIEWCODETYPE;
	
	@Value("${URL_SAVE_REORDERCODEVALUE}")
	private String URL_SAVE_REORDERCODEVALUE;
	
	@Value("${URL_SAVE_DEFAULTCODEVALUE}")
	private String URL_SAVE_DEFAULTCODEVALUE;
	
	//CODEVALUE
	@Value("${URL_GET_CODEVALUE_LIST}")
	private String URL_GET_CODEVALUE_LIST;
	
	@Value("${URL_DELETE_CODEVALUE}")
	private String URL_DELETE_CODEVALUE;
	
	@Value("${URL_GET_CODETYPELIST}")
	private String URL_GET_CODETYPELIST;
	
	@Value("${URL_GET_PARENTCODEVALUES}")
	private String URL_GET_PARENTCODEVALUES;
	
	@Value("${URL_GET_MAXCODEVALUEID}")
	private String URL_GET_MAXCODEVALUEID;
	
	@Value("${URL_GET_MAXDISPSEQNO}")
	private String URL_GET_MAXDISPSEQNO;
	
	@Value("${URL_ADD_NEWCODEVALUE}")
	private String URL_ADD_NEWCODEVALUE;
	
	@Value("${URL_GET_CODEVALUETOUPDATE}")
	private String URL_GET_CODEVALUETOUPDATE;
	
	@Value("${URL_UPDATE_CODEVALUE}")
	private String URL_UPDATE_CODEVALUE;

	String url;


	public ObjectMapper getObjectMapper() 
	{
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) 
	{
		this.objectMapper = objectMapper;
	}
	
	public RestTemplate getRestTemplate() 
	{
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) 
	{
		this.restTemplate = restTemplate;
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadcodetypedata", method = RequestMethod.GET)
	public ModelAndView loadcodetypedata(HttpServletRequest request,HttpServletResponse response) 
	{
		logger.info("Load Codetype List ");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		ModelAndView mav = new ModelAndView("codetype/CodetypeList");
		
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		
		String searchText = null;
		if (request.getParameterMap().containsKey("searchtext")) 
		{
			searchText = request.getParameter("searchtext").trim();
		} else {
			searchText = "";
		}
		String userToken = null;
		if(userSession.getUserName()!=null)
		{
			userToken = userSession.getUserName();
		}
		else
		{
			userToken = "abc";
		}
	
		try 
		{
			BaseResponse<CodeTypeData> br = new BaseResponse<CodeTypeData>();
			CodeTypeData codetypedata = new CodeTypeData();
			logger.info(searchText);
			codetypedata.setSearchText(searchText);
			
			url = URL_GET_CODETYPE_LIST + userSession.getUserName() + "/1234";
			br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
		
			List<CodeTypeData> codeTypeList = new ArrayList<CodeTypeData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeTypeList = br.getResponseListObject();
			
			mav.addObject("codeTypedata", codeTypeList);
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			try 
			{
				out = response.getWriter();
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

		return mav;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public void getMaxCodeTypeID(HttpServletRequest request,HttpServletResponse response) throws IOException
	{

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");

		url = URL_GET_MAXCODETYPEID + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		CodeTypeData codetypedata = new CodeTypeData();
		//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),BaseResponse.class).getBody();
		br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
		
		Integer maxCodetypeId = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		maxCodetypeId = br.getResponseObject();
        
	    //System.out.println("max code value "+maxcodetypeid);
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, maxCodetypeId);
	} 
	
	
	@SuppressWarnings("unchecked")
	public void addNewCodeType(HttpServletRequest request,HttpServletResponse response, CodeTypeData codetypedata) throws IOException 
	{
		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				
		url = URL_ADD_NEWCODETYPE + userSession.getUserName()+ "/1234";
		
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			result = FiinfraConstants.SUCCESS;
		
		}
		
		FiinfraUtility.doAudit(userSession.getPartyId(), 
							   userSession.getUserId(), 
							   FiinfraConstants.SRP_ADD_CODETYPE_EVENT_ID,
							   FiinfraConstants.SERVICE_PORTAL,
							   FiinfraConstants.SRP_SOURCE_MODULE_CODETYPE,
							   FiinfraConstants.SRP_ADD_CODETYPE,
							   "Add New CodeType: "+codetypedata.getCodeType());
		
		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		
		objectMapper.writeValue(out, result);
		
	}
	
	@SuppressWarnings("unchecked")
	public void updateCodeType(HttpServletRequest request,HttpServletResponse response, CodeTypeData codetypedata) throws IOException 
		{
		 
		 
		    String result = FiinfraConstants.FAIL;
			UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		
			url = URL_UPDATE_CODETYPE + userSession.getUserName()+ "/1234";
			
			BaseResponse<String> br = new BaseResponse<String>();
			br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				result = FiinfraConstants.SUCCESS;
			
			}
			
			FiinfraUtility.doAudit(userSession.getPartyId(), 
								   userSession.getUserId(), 
								   FiinfraConstants.SRP_EDIT_CODETYPE_EVENT_ID,
								   FiinfraConstants.SERVICE_PORTAL,
								   FiinfraConstants.SRP_SOURCE_MODULE_CODETYPE,
								   FiinfraConstants.SRP_EDIT_CODETYPE,
								   "Updated CodeTypeID: "+codetypedata.getCodeTypeId());
			
			PrintWriter out = null;
			try 
			{
				out = response.getWriter();
			}
			catch (IOException e) 
			{
				e.printStackTrace();
			}
			
			objectMapper.writeValue(out, result);
			
		}
	


	@SuppressWarnings("unchecked")
	public void deletecodetypes(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		   logger.info("in delete method");   
		   UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		   
		   String deleteList=request.getParameter("Lists");
		   
		   url = URL_DELETE_CODETYPE + userSession.getUserName()+ "/1234";
		   
		   BaseResponse<Integer> br = new BaseResponse<Integer>();
		   CodeTypeData codetypedata = new CodeTypeData();
		   codetypedata.setDeleteList(deleteList);
		      
		   //UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		   //uriCB.queryParam("Lists", deleteList);
		      
		   //Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		   //BaseResponse<Integer> br = new BaseResponse<Integer>();
		   //br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		   br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
		   
		   Integer codetypeList=null;
		   if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		   codetypeList= br.getResponseObject();   
		      
		   Logger.logEntry(this.getClass(), "Code Type List:---"+ codetypeList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		   
		   FiinfraUtility.doAudit(userSession.getPartyId(), 
				   				  userSession.getUserId(), 
				   				  FiinfraConstants.SRP_DELETE_CODETYPE_EVENT_ID,
				   				  FiinfraConstants.SERVICE_PORTAL,
				   				  FiinfraConstants.SRP_SOURCE_MODULE_CODETYPE,
				   				  FiinfraConstants.SRP_DELETE_CODETYPE,
				   				  "Deleted CodeTypeID: "+deleteList);
		   
		   PrintWriter out = null;
		   out = response.getWriter(); 
		   response.setContentType("application/json"); 
		  
		   objectMapper.writeValue(out, codetypeList); 
	}
	
	 
	@SuppressWarnings("unchecked")
	public void viewCodevaluesofcodetype(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		   logger.info("in viewcodevalue method");   
		   UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		   
		   int codeTypeId=Integer.parseInt(request.getParameter("codetypeId"));
		   url = URL_GET_VIEWCODETYPE + userSession.getUserName()+ "/1234";
		   
		   BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		   CodeTypeData codetypedata = new CodeTypeData();
		   codetypedata.setCodeTypeId(codeTypeId);;
		      
		   UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		   //uriCB.queryParam("codeTypeId", codeTypeId);
		      
		   Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		   //br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		   br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
		   
		   List<CodeValueData> codetypeList = new ArrayList<CodeValueData>();
		   if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		   codetypeList= br.getResponseListObject();   
		      
		   Logger.logEntry(this.getClass(), "Code Type List:---"+ codetypeList, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		   PrintWriter out = null;
		   out = response.getWriter(); 
		   response.setContentType("application/json"); 
		   objectMapper.writeValue(out, codetypeList);  
		
	}
	
	@SuppressWarnings("unchecked")
	public void saveReorderedCodevalues(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{  
			   
			   UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			   String codeValueIDs = request.getParameter("codeValueIds");
			   
			   url = URL_SAVE_REORDERCODEVALUE + userSession.getUserName()+ "/1234";
		
			   //UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			   //uriCB.queryParam("codeValueIds", codeValueIDs);
			   CodeTypeData codetypedata = new CodeTypeData();
			   codetypedata.setCodeValueIDs(codeValueIDs);;
			   
			   Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			   BaseResponse<Integer> br = new BaseResponse<Integer>();
			   //br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			   br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
			   Integer recordCount=null;
			   //Integer addDepartmentList=null;
			   if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			   recordCount = br.getResponseObject(); 
			   
			   PrintWriter out = null; 
			   out = response.getWriter();
			   response.setContentType("application/json");
			   objectMapper.writeValue(out, recordCount);        
			  
	  }
	
	
	@SuppressWarnings("unchecked")
	public void saveDefaultValueforCodeValues(HttpServletRequest request,HttpServletResponse response) throws IOException
	{ 
		
		 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		   
		 	Integer codeTypeId=Integer.parseInt(request.getParameter("codetypeId"));
		 	Integer codeValueId=Integer.parseInt(request.getParameter("codevalueId"));
		 	
			logger.info("codeTypeId"+codeTypeId);
			logger.info("codeValueId"+codeValueId);
			
			CodeValueData codevaluedata=new CodeValueData();
			
			codevaluedata.setCodeValueId(codeValueId);
			codevaluedata.setCodeTypeId(codeTypeId);
			
			url = URL_SAVE_DEFAULTCODEVALUE + userSession.getUserName()+ "/1234";
			//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);

			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<Integer> br = new BaseResponse<Integer>();

			br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
		    Integer recordCount=null;
		    if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		    recordCount = br.getResponseObject(); 
		    Logger.logEntry(this.getClass(), "recordCount:---"+ recordCount, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		    PrintWriter out = null; 
		    out = response.getWriter();
		    response.setContentType("application/json");
		    objectMapper.writeValue(out, recordCount);
		

	}
	
	@SuppressWarnings("unchecked")
	public void codetypeCSV(HttpServletRequest request, HttpServletResponse response) 
	{
		logger.info("In export in codetypeCSV");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		try {

			if (userSession == null) 
			{
				response.sendRedirect("/login");
				return;
			}
			String searchText = null;
			if (request.getParameterMap().containsKey("searchtext"))
			{
				searchText = request.getParameter("searchtext").trim();
			} 
			else 
			{
				searchText = "";
			}

			Integer advisorPartyId = userSession.getPartyId(); 
			Integer buId = userSession.getBuId();
			String token = "153443";
			
			BaseResponse<CodeTypeData> baseResponse = new BaseResponse<CodeTypeData>();
			CodeTypeData codetypedata = new CodeTypeData();
			codetypedata.setSearchText(searchText);
			
			url = URL_GET_CODETYPE_LIST + "ramu" + "/1234";
			baseResponse = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
		
			//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//uriCB.queryParam("searchText", searchTextVal);
		
			List<CodeTypeData> codetypeListAsJson = new ArrayList<CodeTypeData>();
			List<CodeTypeData> codetypeList = new ArrayList<CodeTypeData>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) 
			{
				try 
				{
					codetypeListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < codetypeListAsJson.size(); i++) 
					{
						//CodeTypeData codetypedata;
						codetypedata = objectMapper.readValue(objectMapper.writeValueAsString(codetypeListAsJson.get(i)),CodeTypeData.class);
						codetypeList.add(codetypedata);
					}

				} catch (JsonParseException e) {
				
					e.printStackTrace();
				} catch (JsonMappingException e) {
					
					e.printStackTrace();
				} catch (JsonGenerationException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}

			response.addHeader("Content-Disposition","attachment;filename=CodeTypeList.csv");

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Code Type ID "));
			writer.print(",");
			writer.print(CommonUtils.escape("Code Type"));
			writer.print(",");
			writer.print(CommonUtils.escape("Code Type Description"));
			writer.print(",");
			writer.print(CommonUtils.escape("Count CodeValues[InActive]"));
			writer.println();
			
			for (CodeTypeData list : codetypeList) 
			{
			 int codetid= list.getCodeTypeId();
			 String str1 = "" + codetid;
					 
				writer.print(CommonUtils.escape(str1));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getCodeType()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getCodeTypeDescription()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getTemp()));
				writer.println();
			}

		} catch (IOException e) 
		{
			e.printStackTrace();
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public void codetypeExecl(HttpServletRequest request, HttpServletResponse response) 
	{
		  logger.info("In export in codetypeExecl");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		  try
		  {
			  if(userSession == null) 
		   {
		   response.sendRedirect("/login");
		   return ;
		  }

		   String searchText = null;
			if (request.getParameterMap().containsKey("searchtext")) 
			{
				searchText = request.getParameter("searchtext").trim();
			} 
			else 
			{
				searchText = "";
			}
		  Integer advisorPartyId = userSession.getPartyId(); //6326
		  Integer buId = userSession.getBuId();
		  String token = "153443";
		  
		  BaseResponse<CodeTypeData> baseResponse = new BaseResponse<CodeTypeData>();
		  CodeTypeData codetypedata = new CodeTypeData();
		  codetypedata.setSearchText(searchText);
		  url = URL_GET_CODETYPE_LIST+"ramu"+"/1234";
		  baseResponse = restTemplate.postForObject(url, codetypedata, BaseResponse.class);

		 // UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		 // uriCB.queryParam("searchText", searchTextVal);
		 // BaseResponse<CodeTypeData> baseResponse = new BaseResponse<CodeTypeData>();
		   
		 // baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		  
		  List<CodeTypeData> codeTypeAsJson = new ArrayList<CodeTypeData> ();
		  List<CodeTypeData> codeTypeList = new ArrayList<CodeTypeData> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		  {
		   try {
			   codeTypeAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<codeTypeAsJson.size(); i++)
			   {
				  // CodeTypeData codetypedata;
				   codetypedata = objectMapper.readValue(objectMapper.writeValueAsString(codeTypeAsJson.get(i)), CodeTypeData.class);
									
					
				   codeTypeList.add(codetypedata);
				}


		   } catch (JsonParseException e) 
		   {
			   e.printStackTrace();
		   } catch (JsonMappingException e) 
		   {
			   e.printStackTrace();
		   } catch (JsonGenerationException e) 
		   {
			   e.printStackTrace();
		   } catch (IOException e) 
		   {
			   e.printStackTrace();
		   }
		  }
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=CodeTypeList.xls");
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Code Type ID "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Code Type"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Code Type Description"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Count Code Values[InActive]"));
		   writer.println();
		   
		   for(CodeTypeData list:codeTypeList)
		   {		   
			     int codetid= list.getCodeTypeId();
				 String str1 = "" + codetid;
				 //int count= list.getInActiveCount();
				 //String str2 = "" + count;
			   				 
			writer.print(CommonUtils.escape(str1));
			writer.print("\t");
			writer.print(CommonUtils.escape(list.getCodeType()));
			writer.print("\t");
			writer.print(CommonUtils.escape(list.getCodeTypeDescription()));
			writer.print("\t");
			writer.print(CommonUtils.escape(list.getTemp()));
			writer.println();
		   
		   }
		       
		  } catch (IOException e) 
		  {
		      e.printStackTrace();
		  }
		 }

	//CODE FOR CODEVALUE
	
	@SuppressWarnings("unchecked")
	//@RequestMapping(value = "/loadcodevalue", method = RequestMethod.GET)
	public ModelAndView loadCodeValue(HttpServletRequest request,HttpServletResponse response) 
	{
		
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		
		String searchText = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchText = request.getParameter("searchtext").trim();
		} else {
			searchText = "";
		}
		Integer buId = userSession.getBuId();
		String userToken = null;
		if(userSession.getUserName()!=null)
		{
			userToken = userSession.getUserName();
		}
		else
		{
			userToken = "abc";
		}
		ModelAndView mav = new ModelAndView("codevalue/CodevaluesList");

		try 
		{
			url = URL_GET_CODEVALUE_LIST + userSession.getUserName() + "/1234";
			Integer codeTypeId=Integer.parseInt(request.getParameter("codeTypeId"));
			request.setAttribute("Ids", codeTypeId);
			//HttpSession b=request.getSession();
			//b.setAttribute("ids", codeTypeId);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//uriCB.queryParam("searchText", searchTextVal);
			//uriCB.queryParam("codeTypeId", codeTypeId);
			CodeValueData codevaluedata = new CodeValueData();
			codevaluedata.setCodeTypeId(codeTypeId);
			codevaluedata.setSearchText(searchText);
			
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			//br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
			
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueList = br.getResponseListObject();
			mav.addObject("codevaluedata", codeValueList);
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			try 
			{
				out = response.getWriter();
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

		return mav;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public void deletecodevalues(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		logger.info("in deletecodevalue method");   
		   UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		   String deleteList=request.getParameter("Lists");
		   url = URL_DELETE_CODEVALUE + userSession.getUserName()+ "/1234";
		      
		   UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		   CodeTypeData codetypedata = new CodeTypeData();
		   codetypedata.setDeleteList(deleteList);
		   //uriCB.queryParam("Lists", list);
		      
		   Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		   BaseResponse<Integer> br = new BaseResponse<Integer>();
		   //br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		   br = restTemplate.postForObject(url, codetypedata, BaseResponse.class);
		   
		   Integer codeValue=null;
		   if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		   codeValue= br.getResponseObject();   
		      
		   Logger.logEntry(this.getClass(), "Code value List:---"+ codeValue, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		   
		   FiinfraUtility.doAudit(userSession.getPartyId(), 
				   				  userSession.getUserId(), 
				   				  FiinfraConstants.SRP_DELETE_CODEVALUE_EVENT_ID,
				   				  FiinfraConstants.SERVICE_PORTAL,
				   				  FiinfraConstants.SRP_SOURCE_MODULE_CODEVALUE,
				   				  FiinfraConstants.SRP_DELETE_CODEVALUE,
				   				  "Deleted CodeValueID: "+deleteList);
		   
		   PrintWriter out = null;
		   out = response.getWriter(); 
		   response.setContentType("application/json"); 
		   
		   objectMapper.writeValue(out, codeValue); 
	}
	
	
	@SuppressWarnings("unchecked")
	public void getCodeTypeList(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
		 
		 
		 logger.info("Geting codeTypeList");
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			url = URL_GET_CODETYPELIST + userSession.getUserName()+ "/1234";
		
			//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<CodeTypeData> br = new BaseResponse<CodeTypeData>();
			//CodeTypeData codetypedata = new CodeTypeData();
			
			//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			br = restTemplate.postForObject(url, null, BaseResponse.class);
			
			List<CodeTypeData>list = new ArrayList<CodeTypeData>();
			
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			list= br.getResponseListObject();
			
			Logger.logEntry(this.getClass(), "codeTypeList:---"+ list, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, list);

		} 	
	
	@SuppressWarnings("unchecked")
	public void getParentCodeValues(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
	 logger.info("in ParentCodeValues");
	 
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_PARENTCODEVALUES + userSession.getUserName()+ "/1234";
		Integer codeTypeId=Integer.parseInt(request.getParameter("codetypeId"));
		
		//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		
		//uriCB.queryParam("codetypeId", codetypeId);
		
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		CodeValueData codevaluedata = new CodeValueData();
		codevaluedata.setCodeTypeId(codeTypeId);
		
		//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
		
		List<CodeValueData> parentCodevalues = new ArrayList<CodeValueData>();
		
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		parentCodevalues= br.getResponseListObject();
		
		Logger.logEntry(this.getClass(), "ParentCodevalues:---"+ parentCodevalues, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, parentCodevalues);

	}

	

	@SuppressWarnings("unchecked")
	public void getMaxCodeValueId(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		logger.info("in getMaxCodeValueId");
		 
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_MAXCODEVALUEID +userSession.getName()+"/1234";
		Integer codeTypeId=Integer.parseInt(request.getParameter("codeTypeId"));
	
		//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("codeTypeId", codeTypeId);
		
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		CodeValueData codevaluedata = new CodeValueData();
		codevaluedata.setCodeTypeId(codeTypeId);
		//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
		
		Integer MaxCodeValueId=null;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		MaxCodeValueId= br.getResponseObject();  
		   
		Logger.logEntry(this.getClass(), "MaxCodeValueId:---"+ MaxCodeValueId, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, MaxCodeValueId);
		
	}
	
	@SuppressWarnings("unchecked")
	public void getMaxDisplaySeqNo(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		logger.info("in getMaxDisplaySeqNo");
		 
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_MAXDISPSEQNO + userSession.getUserName()+ "/1234";
		Integer codeTypeId=Integer.parseInt(request.getParameter("codetypeId"));
	
		//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		//uriCB.queryParam("codetypeId", codeTypeId);
		
		Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		CodeValueData codevaluedata = new CodeValueData();
		codevaluedata.setCodeTypeId(codeTypeId);
		
		//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
		
		Integer Maxdisplayseqno = null ;	
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		Maxdisplayseqno= br.getResponseObject();
		
		Logger.logEntry(this.getClass(), "MaxDisplaySeqNo:---"+ Maxdisplayseqno, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, Maxdisplayseqno);
	
	
	}
	
	@SuppressWarnings("unchecked")
	public void addNewCodeValue(HttpServletRequest request,HttpServletResponse response, CodeValueData codevaluedata) throws IOException 
	{
		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
				
		url = URL_ADD_NEWCODEVALUE + userSession.getUserName()+ "/1234";
		
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			result = FiinfraConstants.SUCCESS;
		
		}
		
		FiinfraUtility.doAudit(userSession.getPartyId(), 
							   userSession.getUserId(), 
							   FiinfraConstants.SRP_ADD_CODEVALUE_EVENT_ID,
							   FiinfraConstants.SERVICE_PORTAL,
							   FiinfraConstants.SRP_SOURCE_MODULE_CODEVALUE,
							   FiinfraConstants.SRP_ADD_CODEVALUE,
							   "Add New CodeValue: "+codevaluedata.getCodeValue());
		
		PrintWriter out = null;
		try 
		{
			out = response.getWriter();
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		
		objectMapper.writeValue(out, result);
		
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	public void getCodeValueDetalisToUpdate(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		 logger.info("in ParentCodeValues");
		 
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			url = URL_GET_CODEVALUETOUPDATE + userSession.getUserName()+ "/1234";
			Integer codeValueId=Integer.parseInt(request.getParameter("codeValueId"));
			
			//UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//uriCB.queryParam("codeValueId", codeValueId);
			
			Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			CodeValueData codevaluedata = new CodeValueData();
			codevaluedata.setCodeValueId(codeValueId);
			
			//br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
			
			List<CodeValueData> codeValueDetailsToUpdate = new ArrayList<CodeValueData>();
			
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDetailsToUpdate= br.getResponseListObject();
			
			Logger.logEntry(this.getClass(), "codeValueDetailsToUpdate:---"+ codeValueDetailsToUpdate, Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDetailsToUpdate);
	
	}
	
	@SuppressWarnings("unchecked")
	public void updateCodeValue(HttpServletRequest request,HttpServletResponse response, CodeValueData codevaluedata) throws IOException
	{
		logger.info("in Update codevalue");
		
			    String result = FiinfraConstants.FAIL;
				UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
			
				url = URL_UPDATE_CODEVALUE + userSession.getUserName()+ "/1234";
				
				BaseResponse<String> br = new BaseResponse<String>();
				br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
				if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				{
					result = FiinfraConstants.SUCCESS;
				
				}
				
				FiinfraUtility.doAudit(userSession.getPartyId(), 
									   userSession.getUserId(), 
									   FiinfraConstants.SRP_EDIT_CODEVALUE_EVENT_ID,
									   FiinfraConstants.SERVICE_PORTAL,
									   FiinfraConstants.SRP_SOURCE_MODULE_CODEVALUE,
									   FiinfraConstants.SRP_EDIT_CODEVALUE,
									   "Updated CodeValueID: "+codevaluedata.getCodeValueId());
				
				PrintWriter out = null;
				try 
				{
					out = response.getWriter();
				}
				catch (IOException e) 
				{
					e.printStackTrace();
				}
				
				objectMapper.writeValue(out, result);
				
			}
		
	@SuppressWarnings("unchecked")
	public void codevalueCSV(HttpServletRequest request, HttpServletResponse response) 
	{
		logger.info("In export in codevalueCSV");
		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		try {

			if (userSession == null) {
				response.sendRedirect("/login");
				return;
			}
			String searchText = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchText = request.getParameter("searchtext").trim();
			} else {
				searchText = "";
			}
			Integer advisorPartyId = userSession.getPartyId(); 
			Integer buId = userSession.getBuId();
			String token = "153443";
			Integer codeTypeId=Integer.parseInt(request.getParameter("codeTypeId"));
			url = URL_GET_CODEVALUE_LIST + "ramu" + "/1234";
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//uriCB.queryParam("searchText", searchTextVal);
			//uriCB.queryParam("codeTypeId", codeTypeId);
			
			CodeValueData codevaluedata = new CodeValueData();
			codevaluedata.setCodeTypeId(codeTypeId);
			codevaluedata.setSearchText(searchText);
			
			BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
			//br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
					
			List<CodeValueData> codeValueListAsJson = new ArrayList<CodeValueData>();
			List<CodeValueData> codeValueList = new ArrayList<CodeValueData>();
			
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				try {
					codeValueListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < codeValueListAsJson.size(); i++) 
					{
						CodeValueData codeValueData;
						codeValueData = objectMapper.readValue(objectMapper.writeValueAsString(codeValueListAsJson.get(i)),CodeValueData.class);

						codeValueList.add(codeValueData);
					}

				} catch (JsonParseException e) {
				
					e.printStackTrace();
				} catch (JsonMappingException e) {
					
					e.printStackTrace();
				} catch (JsonGenerationException e) {
					
					e.printStackTrace();
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}

			response.addHeader("Content-Disposition","attachment;filename=CodeValueList.csv");
			
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Code Type"));
			writer.print(",");
			writer.print(CommonUtils.escape("Code Value ID"));
			writer.print(",");
			writer.print(CommonUtils.escape("Code Value"));
			writer.print(",");
			writer.print(CommonUtils.escape("Display Seq No"));
			writer.print(",");
			writer.print(CommonUtils.escape("Parent Code Value"));
			writer.print(",");
			writer.print(CommonUtils.escape("Control Flags"));
			writer.print(",");
			writer.print(CommonUtils.escape("Updated On"));
			writer.println();
			
			for (CodeValueData list : codeValueList) 
			{
						
				int codeValueId= list.getCodeValueId();
				String str1 = "" + codeValueId;
				int displaySeqNo= list.getDisplaySeqNo();
				String str2 = "" + displaySeqNo;
			 
				String display=null,active=null,defaults=null;
				if(list.getIsDisplay()==true)
				{
					display="Display";
				}
				else
				{
					display="Display";
				}
				if(list.getIsActive()==true)
				{
					active="Active";
				}
				else
				{
					active="";
				}
				if(list.getIsDefault()==true)
				{
					defaults="Default";
				}
				else
				{
					defaults="";
				}
				
				writer.print(CommonUtils.escape(list.getCodeType()));
				writer.print(",");
				writer.print(CommonUtils.escape(str1));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getCodeValue()));
				writer.print(",");
				writer.print(CommonUtils.escape(str2));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getParentCodeValue()));
				writer.print(",");
				writer.print(CommonUtils.escape(display+" "+active+" "+defaults));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getLastModifiedDate()));
				writer.println();
				 
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public void codevalueExecl(HttpServletRequest request, HttpServletResponse response) 
	{
		 logger.info("In export in codevalueExecl");
		  UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		  try
		  {
		   if(userSession == null) 
		   {
			   response.sendRedirect("/login");
			   return ;
		  }
		   
		   String searchText = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchText = request.getParameter("searchtext").trim();
			} else {
				searchText = "";
			}
		  Integer advisorPartyId = userSession.getPartyId(); //6326
		  Integer buId = userSession.getBuId();
		  String token = "153443";
		  url = URL_GET_CODEVALUE_LIST+"ramu"+"/1234";
		  Integer codeTypeId=Integer.parseInt(request.getParameter("codeTypeId"));
			
		  UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		  //uriCB.queryParam("searchText", searchTextVal);
	      //uriCB.queryParam("codeTypeId", codeTypeId);
		  
		  CodeValueData codevaluedata = new CodeValueData();
		  codevaluedata.setCodeTypeId(codeTypeId);
		  codevaluedata.setSearchText(searchText);
			
		  BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		  //br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		  br = restTemplate.postForObject(url, codevaluedata, BaseResponse.class);
		  
		  //BaseResponse<CodeValueData> baseResponse = new BaseResponse<CodeValueData>();
		  //baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		  
		  List<CodeValueData> codeValueListAsJson = new ArrayList<CodeValueData> ();
		  List<CodeValueData> codeValueList = new ArrayList<CodeValueData> ();
		  
		  if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   codeValueListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<codeValueListAsJson.size(); i++)
			   {
				   CodeValueData codeValueData;
				   codeValueData = objectMapper.readValue(objectMapper.writeValueAsString(codeValueListAsJson.get(i)), CodeValueData.class);
									
					
				   codeValueList.add(codeValueData);
				}


		   } catch (JsonParseException e) 
		   {
			   e.printStackTrace();
		   } catch (JsonMappingException e) 
		   {
			   e.printStackTrace();
		   } catch (JsonGenerationException e) 
		   {
			   e.printStackTrace();
		   } catch (IOException e) 
		   {
			   e.printStackTrace();
		   }
		  }
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=CodeTypeList.xls");
		        
		    PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Code Type"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Code Value ID"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Code Value"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Display Seq No"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Parent Code Value"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Control Flags"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Updated On"));
			writer.println();
			for (CodeValueData list : codeValueList) 
			{
						
			 int codeValueId= list.getCodeValueId();
			 String str1 = "" + codeValueId;
			 int displaySeqNo= list.getDisplaySeqNo();
			 String str2 = "" + displaySeqNo;
			 
				String display=null,active=null,defaults=null;
				if(list.getIsDisplay()==true)
				{
					display="Display";
				}
				else
				{
					display="Display";
				}
				if(list.getIsActive()==true)
				{
					active="Active";
				}
				else
				{
					active="";
				}
				if(list.getIsDefault()==true)
				{
					defaults="Default";
				}
				else
				{
					defaults="";
				}
		
				writer.print(CommonUtils.escape(list.getCodeType()));
				writer.print("\t");
				writer.print(CommonUtils.escape(str1));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getCodeValue()));
				writer.print("\t");
				writer.print(CommonUtils.escape(str2));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getParentCodeValue()));
				writer.print("\t");
				writer.print(CommonUtils.escape(display+" "+active+" "+defaults));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getLastModifiedDate()));
				writer.println();
		   
		   }
		       
		  } catch (IOException e) 
		  {
		      e.printStackTrace();
		  }
		 }

	
}

