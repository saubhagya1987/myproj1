package in.fiinfra.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.EmailSmsVo;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.LoggedUser;
import in.fiinfra.common.service.vo.PrePrintedForm;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.cp.CommonUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;


public class PrePrintedFormController extends MultiActionController
{
	private RestTemplate restTemplate;

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(PrePrintedFormController.class);
	String url;
	
	private ObjectMapper objectMapper;

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	
	
	
	@Value("${URL_GET_PREPRINTED_FORM}")
	private String URL_GET_PREPRINTED_FORM;

	
	@Value("${URL_GET_PREPRINTED_FORM_CHART}")
	private String URL_GET_PREPRINTED_FORM_CHART;

	
	
	

	public ModelAndView loadPrePrintedForm(HttpServletRequest request,HttpServletResponse response)
	{
		logger.info("In load faqlist ");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		int userId=userSession.getUserId();
		int buPartyId=userSession.getBuId();
		ModelAndView mav = new ModelAndView("loggedinuser/PrePrintedForms");
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

/*		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}
*/
		String userToken = null;
		if(userSession.getUserName()!=null){
			userToken = userSession.getUserName();
		}
		else{
			userToken = "abc";
		}

		
		
			try {
				url = URL_GET_PREPRINTED_FORM+userToken+"/1234";
				BaseResponse<PrePrintedForm> br = new BaseResponse<PrePrintedForm>();
				PrePrintedForm  preprintedForm=new PrePrintedForm();
				preprintedForm.setUserId(userId);
				preprintedForm.setBuPartyId(buPartyId);
		 	br = restTemplate.postForObject(url, preprintedForm, BaseResponse.class);
		   	List<PrePrintedForm> data = new ArrayList<PrePrintedForm>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					data=br.getResponseListObject();
				
				

				mav.addObject("prePrintedList",objectMapper.writeValueAsString( data));
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

	

	 
	 public void prePrintedExecl(HttpServletRequest request, HttpServletResponse response) {
		 
		 
		 
		 
		 
		 logger.info("In export in prePrintedForm excel");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			}

/*			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}
*/
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}

			
			
				try {
					url = URL_GET_PREPRINTED_FORM+userToken+"/1234";
					BaseResponse<PrePrintedForm> baseResponse = new BaseResponse<PrePrintedForm>();
					PrePrintedForm  prePrintedData=new PrePrintedForm();
				baseResponse = restTemplate.postForObject(url, prePrintedData, BaseResponse.class);
		  
		  List<PrePrintedForm> prePrintedListAsJson = new ArrayList<PrePrintedForm> ();
		  List<PrePrintedForm> prePrintedList = new ArrayList<PrePrintedForm> ();
		  
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   prePrintedListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<prePrintedListAsJson.size(); i++){
				   PrePrintedForm prePrintedList2;
					prePrintedList2 = objectMapper.readValue(objectMapper.writeValueAsString(prePrintedListAsJson.get(i)), PrePrintedForm.class);
									
					
					prePrintedList.add(prePrintedList2);
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
						"attachment;filename=PrePrintedFormList.csv");
				seperator = ",";
			}
			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=PrePrintedFormList.xls");
				seperator = "\t";
			}
		  
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Product"));
		   writer.print(seperator);
		   writer.print(CommonUtils.escape("Form Name"));
		   writer.print(seperator);
		   writer.print(CommonUtils.escape("Form Path"));
		   writer.print(seperator);
		   writer.print(CommonUtils.escape("Generated On"));
		   		   writer.println();
		   for(PrePrintedForm list:prePrintedList){
			   
				    
		   
		    writer.print(CommonUtils.escape(list.getProduct()));
		    writer.print(seperator);
		    writer.print(CommonUtils.escape(list.getFormName()));
		    writer.print(seperator);
		    writer.print(CommonUtils.escape(list.getFormPath()));
		    
		    writer.print(seperator);
		    writer.print(CommonUtils.escape(list.getGeneratedOn()));
		    
		    
		    writer.println();
		    
		   }
		       
		  } catch (IOException e) {
			  logger.error(""+e);
		  }
		 }
	 
	 

		public void getChartData(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
			
			
		     
				 
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{
					userToken = "abc";
				}

				PrePrintedForm data=new PrePrintedForm();
				data.setUserId(userSession.getUserId());
				data.setBuPartyId(userSession.getBuId());
				url = URL_GET_PREPRINTED_FORM_CHART + userToken+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				BaseResponse<PrePrintedForm> br = new BaseResponse<PrePrintedForm>();
				br = restTemplate.postForObject(url, data, BaseResponse.class);
				
				List<PrePrintedForm> list = new ArrayList<PrePrintedForm>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					list= br.getResponseListObject();
				
				
				
				
				
				
				ObjectMapper mapper = new ObjectMapper();
				ArrayNode array =  mapper.createArrayNode();
				{
					ArrayNode title = mapper.createArrayNode();
					title.add("Month");
					title.add("Shubhchintak");
					title.add("FIINFRA");
					title.add("SPA");
					title.add("DFDA");
					array.add(title);
				}	
				List<PrePrintedForm> myObjects=null;
				
				ObjectMapper mapper2 = new CustomJacksonObjectMapper();
				String jsonSuccessString=mapper.writeValueAsString(list);
				logger.info(jsonSuccessString);
				 myObjects = mapper2.readValue(jsonSuccessString, mapper2.getTypeFactory().constructCollectionType(List.class, PrePrintedForm.class));
			for(int i=0;i<list.size();i++){
				ArrayNode value = mapper.createArrayNode();
				value.add(myObjects.get(i).getMonths());
				value.add(myObjects.get(i).getShubhchintak());
				value.add(myObjects.get(i).getFiinfra());
				value.add(myObjects.get(i).getSpa());
				value.add(myObjects.get(i).getDfda());
				array.add(value);
			}
				
				
				Object[] data1 = new Object[4];
				data1[0] = array;
				
				
				//return data;

				
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, array);
				
/*
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, list);*/
		}

/*
		public void getChartData(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
			
			
		     
				 
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{
					userToken = "abc";
				}

				PrePrintedForm data=new PrePrintedForm();
				data.setUserId(userSession.getUserId());
				url = URL_GET_PREPRINTED_FORM_CHART + userToken+ "/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				BaseResponse<PrePrintedForm> br = new BaseResponse<PrePrintedForm>();
				br = restTemplate.postForObject(url, data, BaseResponse.class);
				
				List<PrePrintedForm> list = new ArrayList<PrePrintedForm>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					list= br.getResponseListObject();
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, list);
		}
			*/
	 
/*

@RequestMapping(value = "/getEmailChart", method = RequestMethod.GET)
public void getEmailChart(HttpServletRequest request,
		HttpServletResponse response) throws Exception{

	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
	int buId = userSession.getBuId();
	
		
	url = URL_GET_PREPRINTED_FORM_CHART +"kjhklhkj/1234";
//	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	
	PrePrintedForm data =new PrePrintedForm();
	data.setUserId(userSession.getUserId());
	//uriCB.queryParam("buId", buId);	
	
	
	BaseResponse<PrePrintedForm> br = new BaseResponse<PrePrintedForm>();
	
	//br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
	
	br = restTemplate.postForObject(url, data, BaseResponse.class);
	List<PrePrintedForm> chartList = new ArrayList<PrePrintedForm>();
	//List<LoggedUser> lstLoggedUser = service.getMyFinancials(user.getPartyId());
	if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		chartList = br.getResponseListObject();
	
	ObjectMapper mapper = new ObjectMapper();
	ArrayNode array =  mapper.createArrayNode();
	{
		ArrayNode title = mapper.createArrayNode();
		title.add("Time");
		title.add("Email");
		title.add("SMS");
		array.add(title);
	}	
	List<PrePrintedForm> myObjects=null;
	
	ObjectMapper mapper2 = new CustomJacksonObjectMapper();
	String jsonSuccessString=mapper.writeValueAsString(chartList);
	logger.info(jsonSuccessString);
	 myObjects = mapper2.readValue(jsonSuccessString, mapper2.getTypeFactory().constructCollectionType(List.class, PrePrintedForm.class));

	 
for(int i=0;i<chartList.size();i++){
	ArrayNode value = mapper.createArrayNode();
	value.add(myObjects.get(i).getTime());
	value.add(myObjects.get(i).getEmail_ct());
	value.add(myObjects.get(i).getSms_ct());
	array.add(value);
}
	
	
	
	
	//return data;
	//System.out.println("dada"+array);
	
	PrintWriter out = null;
	out = response.getWriter();
	response.setContentType("application/json");
	objectMapper.writeValue(out, array);
	

	

}
*/



	 
	
	
}
