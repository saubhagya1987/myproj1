package in.fiinfra.controller;

import in.fiinfra.cp.CommonUtils;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

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

public class FaqController extends MultiActionController {

	private RestTemplate restTemplate;

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(FaqController.class);
	@Value("${URL_GET_FAQ_LIST}")
	private String URL_GET_FAQ_LIST;
	@Value("${URL_GET_PICKLIST_VALUE_LIST}")
	private String URL_GET_PICKLIST_VALUE_LIST;
	@Value("${URL_ADD_FAQ}")
	private String URL_ADD_FAQ;
	@Value("${URL_GET_BUPARTY_NAME}")
	private String URL_GET_BUPARTY_NAME;
	@Value("${URL_UPDATE_FAQ}")
	private String URL_UPDATE_FAQ;
	@Value("${URL_DELETE_FAQ}")
	private String URL_DELETE_FAQ;
	
	@Value("${URL_GET_FAQ_DETAIL}")
	private String URL_GET_FAQ_DETAIL;
	
	
	@Value("${URL_GET_PICK_VALUE}")
	private String URL_GET_PICK_VALUE;
	
	
	@Value("${URL_GET_FAQ_LIST_ADMIN}")
	private String URL_GET_FAQ_LIST_ADMIN;
	
	String url;
	
	private ObjectMapper objectMapper;
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	
	
	
	 public void getBupartyname(HttpServletRequest request,HttpServletResponse response) throws IOException 
	  {
	   
	   
	   logger.info("In get bU party");
	   
	   UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
	   
	   String data=request.getParameter("data");
	   FaqList faqlist=new FaqList();
	   if(data == ""||data == null)
	   {
	    faqlist.setCreatedBy(0);
	   }
	   else
	   {
	    faqlist.setCreatedBy(1);
	   }
	   
	   String userToken = null;
	   if(userSession.getUserName()!=null){
	    userToken = userSession.getUserName();
	   }
	   else{
	    userToken = "abc";
	   }
	   url = URL_GET_BUPARTY_NAME + userToken+ "/1234";
	   UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
	   BaseResponse<FaqList> br = new BaseResponse<FaqList>();

	   
	   faqlist.setPartyID(userSession.getPartyId());
	   
	   faqlist.setBuId(userSession.getBuId());
	   br = restTemplate.postForObject(url, faqlist, BaseResponse.class);

	   List<FaqList> list = new ArrayList<FaqList>();
	   if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
	    list= br.getResponseListObject();
	   PrintWriter out = null;
	   out = response.getWriter();
	   response.setContentType("application/json");
	   objectMapper.writeValue(out, list);

	}
/*	
	 public void getBupartyname(HttpServletRequest request,HttpServletResponse response) throws IOException 
		{
		 
		 
		 logger.info("In get bU party");
		 
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			
			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}
			url = URL_GET_BUPARTY_NAME + userToken+ "/1234";
			///UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<FaqList> br = new BaseResponse<FaqList>();
			FaqList faqlist=new FaqList();
			faqlist.setBuId(userSession.getBuId());
			br = restTemplate.postForObject(url, faqlist, BaseResponse.class);
			List<FaqList> list = new ArrayList<FaqList>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				list= br.getResponseListObject();
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, list);

} 	
	*/
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value ="/getPicklistValues", method = RequestMethod.GET)
	public void getPicklistValues(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("In get code value from code type");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		url = URL_GET_PICK_VALUE+"xyz/1234";
		String codeTypeIds=request.getParameter("codeTypeIds");

		
		FaqList faqlist=new FaqList();

		faqlist.setDeleteList(codeTypeIds);
		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		br = restTemplate.postForObject(url, faqlist, BaseResponse.class);
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			codeValueDataList= br.getResponseListObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, codeValueDataList);
		
		
		
		
		
		

	}
	

	@SuppressWarnings("unchecked")
	//@RequestMapping(value ="/getPicklistValues", method = RequestMethod.GET)
	public void addFaq(HttpServletRequest request,HttpServletResponse response) throws Exception {
		logger.info("In add faq");
		
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int fAQModuleID = Integer.parseInt(request.getParameter("qtype"));
		int bupartyid=Integer.parseInt(request.getParameter("bupartyname"));
		String qtext=request.getParameter("quetext");
		String atext=request.getParameter("anstext");
		String sourceID=request.getParameter("sourceId");
		
		
		url = URL_ADD_FAQ + userSession.getUserName()+ "/1234";
		String newQue=qtext.replaceAll("[^\\p{Print}]", "");
		String newAns = atext.replaceAll("[^\\p{Print}]", "");  
		String OBJECT_STRING ="bizUnitName="+ bupartyid +",fAQModuleID="+fAQModuleID +",Question text="+newQue+",Answer Text="+ newAns +",Portal="+sourceID+",Created by="+userSession.getUserId();
		FaqList faqList=new FaqList();
		faqList.setFaqModuleID(String.valueOf(fAQModuleID));
		faqList.setBuId(bupartyid);
		faqList.setFaqQuestionText(newQue);
		faqList.setFaqAnswerText(newAns);
		faqList.setCreatedBy( userSession.getUserId());
		faqList.setSourceID(sourceID);
		//Logger.logEntry(this.getClass(), "URL --> " + url,Logger.DEBUG, Thread.currentThread().getStackTrace()[1].getMethodName());
		BaseResponse<Integer> br = new BaseResponse<>();
		br = restTemplate.postForObject(url, faqList, BaseResponse.class);
		int recordCount=0;
		Integer codeValueDataList=null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recordCount = br.getResponseObject();
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		
		logger.info("Result In add faq "+recordCount);
		
		if(recordCount==1)
		{
			
			
			

			
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_ADD_FAQ_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_FAQ,FiinfraConstants.SRP_ADD_FAQ,"SP="+FiinfraConstants.SP_USP_FAQ_ADD,OBJECT_STRING);
		}
		
		
		objectMapper.writeValue(out, recordCount);/*eDataList);*/
	}

	
	public void deleteFaq(HttpServletRequest request,HttpServletResponse response) throws IOException 
	{
		
		
	      logger.info("In delete faq");
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			String list=request.getParameter("Lists");
			url = URL_DELETE_FAQ + userSession.getUserName()+ "/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			FaqList faqlist=new FaqList();
            faqlist.setCreatedBy(userSession.getUserId());
			faqlist.setDeleteList(list);
			String OBJECT_STRING="Update by="+userSession.getUserId()+",Faq ID="+list;
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, faqlist, BaseResponse.class);
			Integer codeValueDataList=null;
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				 codeValueDataList= br.getResponseObject();
			//FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_FAQ_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_FAQ,FiinfraConstants.SRP_DELETE_FAQ);
			FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_DELETE_FAQ_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_FAQ,FiinfraConstants.SRP_DELETE_FAQ,"SP="+FiinfraConstants.SP_USP_DELETE_FAQ,OBJECT_STRING);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, codeValueDataList);
	}
	
	
	
	
	public void updateFaq(HttpServletRequest request,HttpServletResponse response,FaqList f) throws IOException ,NumberFormatException
	{
		
		 logger.info("In update faq");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int fAQModuleID = Integer.parseInt(request.getParameter("qtypes"));
		int  bupartyid=Integer.parseInt(request.getParameter("partyname"));
		String qtext=request.getParameter("editque");
		String atext=request.getParameter("editans");
		int faqid=Integer.parseInt(request.getParameter("faqsId"));
		String newQue=qtext.replaceAll("[^\\p{Print}]", "");
		String newAns = atext.replaceAll("[^\\p{Print}]", "");  
		String sourceID=request.getParameter("sourceId");
		FaqList faq=new FaqList();
		faq.setFaqId(String.valueOf(faqid));
		faq.setBuId(bupartyid);
		faq.setFaqQuestionText(newQue);
		faq.setFaqAnswerText(newAns);
		faq.setFaqModuleID(String.valueOf(fAQModuleID));
		faq.setCreatedBy( userSession.getUserId());
		faq.setSourceID(sourceID);
		
		String OBJECT_STRING ="Faq ID"+faqid+"bizUnitName="+ bupartyid +",fAQModuleID="+fAQModuleID +",Question text="+newQue+",Answer Text="+ newAns +",Portal="+sourceID+"Updated by"+userSession.getUserId();
		url = URL_UPDATE_FAQ + userSession.getUserName()+ "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, faq, BaseResponse.class);
		Integer codeValueDataList=null;
		if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			 codeValueDataList= br.getResponseObject();
		//Logger.logEntry(this.getClass(), "codeValueDataList:---"+ codeValueDataList, Logger.DEBUG, Thread.currentThread()				.getStackTrace()[1].getMethodName());
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
if(codeValueDataList==1)
{
	    FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_EDIT_FAQ_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_FAQ,FiinfraConstants.SRP_EDIT_FAQ,"SP="+FiinfraConstants.SP_USP_UPDATE_FAQ,OBJECT_STRING);
		//FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(),FiinfraConstants.SRP_EDIT_FAQ_EVENT_ID,FiinfraConstants.SERVICE_PORTAL,FiinfraConstants.SRP_SOURCE_MODULE_FAQ,FiinfraConstants.SRP_EDIT_FAQ);
}		
		logger.info("Result In update faq"+codeValueDataList);
		objectMapper.writeValue(out, codeValueDataList);
				}
	
	
	

	

	@RequestMapping(value ="/loadFaqLists", method = RequestMethod.GET)
	public ModelAndView loadFaqListsAdmin(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mav = new ModelAndView("faq/FaqListAdmin");
	
				
				return mav;
						
	}


			public void loadFaqListsAdmin1(HttpServletRequest request,
					HttpServletResponse response) throws Exception {

				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				
		String searchTextVal="";
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{
					userToken = "abc";
				}

				
				
					
						url = URL_GET_FAQ_LIST_ADMIN+userToken+"/1234";
						UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
						BaseResponse<FaqList> br = new BaseResponse<FaqList>();
					FaqList  faqlist=new FaqList();
					faqlist.setSearchText(searchTextVal);
					br = restTemplate.postForObject(url, faqlist, BaseResponse.class);
					List<FaqList> faqList = new ArrayList<FaqList>();
						if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						faqList=br.getResponseListObject();
				PrintWriter out = null;
				out = response.getWriter();
				response.setContentType("application/json");
				objectMapper.writeValue(out, faqList);
				
		
			}
	
	
	
	
	

	@RequestMapping(value ="/loadFaqLists", method = RequestMethod.GET)
	public ModelAndView loadFaqLists(HttpServletRequest request,HttpServletResponse response)
	{
		logger.info("In load faqlist ");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		
		ModelAndView mav = new ModelAndView("faq/FaqList");
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

		String searchTextVal = null;
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		String userToken = null;
		if(userSession.getUserName()!=null){
			userToken = userSession.getUserName();
		}
		else{
			userToken = "abc";
		}

		
		
			try {
				url = URL_GET_FAQ_LIST+userToken+"/1234";
			//	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				BaseResponse<FaqList> br = new BaseResponse<FaqList>();
			FaqList  faqlist=new FaqList();
			faqlist.setSearchText(searchTextVal);
				//br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			br = restTemplate.postForObject(url, faqlist, BaseResponse.class);
			List<FaqList> faqList = new ArrayList<FaqList>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				faqList=br.getResponseListObject();
				
				mav.addObject("faqList", objectMapper.writeValueAsString(faqList));
				
	/*			mav.addObject("listfaq", faqList);*/
				mav.addObject("size", pagesize);
				
				
				
				
				PrintWriter out = null;
				
				
				
				
				try {
					out = response.getWriter();
				} catch (Exception e) {
			//		e.printStackTrace();
				}
			} catch (Exception e) {
			//	e.printStackTrace();
			}
				
				
				return mav;
						
	}

	
	
	//@RequestMapping(value = "/task/csv", method = RequestMethod.GET)
	 public void faqCSV(HttpServletRequest request, HttpServletResponse response) {
		 logger.info("In export in faq csv");
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			
			//ModelAndView mav = new ModelAndView("faq/FaqList");
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			}

			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}

			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}

			
			
				try {
					url = URL_GET_FAQ_LIST+"ramu"+"/1234";
				//	UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					BaseResponse<FaqList> baseResponse = new BaseResponse<FaqList>();
				FaqList  faqlist=new FaqList();
				faqlist.setSearchText(searchTextVal);
				baseResponse = restTemplate.postForObject(url, faqlist, BaseResponse.class);
	  
	  List<FaqList> faqListAsJson = new ArrayList<FaqList> ();
	  List<FaqList> faqList = new ArrayList<FaqList> ();
	  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
	   try {
		   faqListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		   for(int i = 0; i<faqListAsJson.size(); i++){
				FaqList faqList2;
				faqList2 = objectMapper.readValue(objectMapper.writeValueAsString(faqListAsJson.get(i)), FaqList.class);
				faqList.add(faqList2);
			}


	   } catch (JsonParseException e) {
	    // TODO Auto-generated catch block
	   // e.printStackTrace();
	   } catch (JsonMappingException e) {
	    // TODO Auto-generated catch block
	   // e.printStackTrace();
	   } catch (JsonGenerationException e) {
	    // TODO Auto-generated catch block
	   // e.printStackTrace();
	   } catch (IOException e) {
	    // TODO Auto-generated catch block
	   // e.printStackTrace();
	   }
	  }
	  
	  
	  
	   response.addHeader("Content-Disposition", "attachment;filename=FaqList.csv");
	   
	        
	   PrintWriter writer = response.getWriter();
	   writer.print(CommonUtils.escape("Biz Unit "));
	   writer.print(",");
	   writer.print(CommonUtils.escape("FAQ Section "));
	   writer.print(",");
	   writer.print(CommonUtils.escape("Question Text"));
	   writer.print(",");
	   writer.print(CommonUtils.escape("Answer Text"));
	   writer.print(",");
	   writer.print(CommonUtils.escape("Updated By"));
	   writer.print(",");
	   writer.print(CommonUtils.escape( "Updated on"));
	   writer.println();
	   for(FaqList list:faqList){
		   
			    
		 
	    writer.print(CommonUtils.escape(list.getLastName()));
	    writer.print(",");
	    writer.print(CommonUtils.escape(list.getCodeValue()));
	    writer.print(",");
	    String  Qtext = list.getFaqQuestionText().replaceAll("\\<.*?\\>", "");
	    
	    String Qtext1 = Qtext.replace(",", "");
	    String qText2 = Qtext1.replace("&nbsp;", "");
	     
	    
	    writer.print(CommonUtils.escape(qText2));
	    writer.print(",");
	    String  ansText = list.getFaqAnswerText().replaceAll("\\<.*?\\>", "");
	    String ansText1 = ansText.replace(",", "");
	    String ansText2 = ansText1.replace("&nbsp;", "");
	    writer.print(CommonUtils.escape(ansText2));
	    writer.print(",");
	    writer.print(CommonUtils.escape(""+list.getUserName()));
	    writer.print(",");
	    writer.print(CommonUtils.escape(list.getLastModifiedDate()));
	    writer.println();
	   }
	       
	  } catch (IOException e) {
	     // e.printStackTrace();
	  }
	 }
	 

		/*
		//@RequestMapping(value = "/task/csv", method = RequestMethod.GET)
		 public void faqCSVAdmin(HttpServletRequest request, HttpServletResponse response) {
			 logger.info("In export in faq csv");
				UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				
			//	ModelAndView mav = new ModelAndView("faq/FaqList");
				String pagesize = request.getParameter("pageSize");
				if (pagesize == null) {
					pagesize = "10";
				}

				String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) {
					searchTextVal = request.getParameter("searchtext").trim();
				} else {
					searchTextVal = "";
				}

				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{
					userToken = "abc";
				}

				
				
					try {
						url = URL_GET_FAQ_LIST+"ramu"+"/1234";
						UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
						BaseResponse<FaqList> baseResponse = new BaseResponse<FaqList>();
					FaqList  faqlist=new FaqList();
					faqlist.setSearchText(searchTextVal);
						//br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
					baseResponse = restTemplate.postForObject(url, faqlist, BaseResponse.class);
		  
		  List<FaqList> faqListAsJson = new ArrayList<FaqList> ();
		  List<FaqList> faqList = new ArrayList<FaqList> ();
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   faqListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
			   for(int i = 0; i<faqListAsJson.size(); i++){
					FaqList faqList2;
					faqList2 = objectMapper.readValue(objectMapper.writeValueAsString(faqListAsJson.get(i)), FaqList.class);
					faqList.add(faqList2);
				}


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   }
		  }
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=FaqList.csv");
		   
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Biz Unit "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("FAQ Section "));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Question Text"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Answer Text"));
		   writer.print(",");
		   writer.print(CommonUtils.escape("Updated By"));
		   writer.print(",");
		   writer.print(CommonUtils.escape( "Updated on"));
		   writer.println();
		   for(FaqList list:faqList){
			   
				    
			 
		    writer.print(CommonUtils.escape(list.getLastName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getCodeValue()));
		    writer.print(",");
		    String  Qtext = list.getFaqQuestionText().replaceAll("\\<.*?\\>", "");
		    writer.print(CommonUtils.escape(Qtext));
		    writer.print(",");
		    String  ansText = list.getFaqAnswerText().replaceAll("\\<.*?\\>", "");
		    writer.print(CommonUtils.escape(ansText));
		    writer.print(",");
		    writer.print(CommonUtils.escape(""+list.getUserName()));
		    writer.print(",");
		    writer.print(CommonUtils.escape(list.getLastModifiedDate()));
		    writer.println();
		   }
		       
		  } catch (IOException e) {
		     // e.printStackTrace();
		  }
		 }
		 
		 */
		
	 
	 public void faqExecl(HttpServletRequest request, HttpServletResponse response) {
		 
		 
		 
		 
		 
		 logger.info("In export in faq excel");
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			
	//		ModelAndView mav = new ModelAndView("faq/FaqList");
			String pagesize = request.getParameter("pageSize");
			if (pagesize == null) {
				pagesize = "10";
			}

			String searchTextVal = null;
			if (request.getParameterMap().containsKey("searchtext")) {
				searchTextVal = request.getParameter("searchtext").trim();
			} else {
				searchTextVal = "";
			}

			String userToken = null;
			if(userSession.getUserName()!=null){
				userToken = userSession.getUserName();
			}
			else{
				userToken = "abc";
			}

			
			
				try {
					url = URL_GET_FAQ_LIST+"ramu"+"/1234";
			//		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
					BaseResponse<FaqList> baseResponse = new BaseResponse<FaqList>();
				FaqList  faqlist=new FaqList();
				faqlist.setSearchText(searchTextVal);
					//br =  restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
				baseResponse = restTemplate.postForObject(url, faqlist, BaseResponse.class);
		  
		  List<FaqList> faqListAsJson = new ArrayList<FaqList> ();
		  List<FaqList> faqList = new ArrayList<FaqList> ();
		  
		  if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
		   try {
			   faqListAsJson =  objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), ArrayList.class);
		       
			   for(int i = 0; i<faqListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					FaqList faqList2;
					faqList2 = objectMapper.readValue(objectMapper.writeValueAsString(faqListAsJson.get(i)), FaqList.class);
									
					
					faqList.add(faqList2);
				}


		   } catch (JsonParseException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   } catch (JsonMappingException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   } catch (JsonGenerationException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   } catch (IOException e) {
		    // TODO Auto-generated catch block
		   // e.printStackTrace();
		   }
		  }
		  
		  
		  
		   response.addHeader("Content-Disposition", "attachment;filename=FaqList.xls");
		   
		        
		   PrintWriter writer = response.getWriter();
		   writer.print(CommonUtils.escape("Biz Unit "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("FAQ Section "));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Question Text"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Answer Text"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape("Updated By"));
		   writer.print("\t");
		   writer.print(CommonUtils.escape( "Updated on"));
	/*	   writer.print(",");
		   writer.print(CommonUtils.escape("STATUS"));*/
		   
		   writer.println();
		   for(FaqList list:faqList){
			   
				    
		   
		    writer.print(CommonUtils.escape(list.getLastName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getCodeValue()));
		    writer.print("\t");
		    String  Qtext = list.getFaqQuestionText().replaceAll("\\<.*?\\>", "");
		    String Qtext1 = Qtext.replace(",", "");
		    String qtext2 = Qtext1.replace("&nbsp;", "");
		    writer.print(CommonUtils.escape(qtext2));
		    writer.print("\t");
		    String  ansText = list.getFaqAnswerText().replaceAll("\\<.*?\\>", "");
		    String ansText1 = ansText.replace(",", "");
		       
		    String ansText2 = ansText1.replace("&nbsp;", "");
		    writer.print(CommonUtils.escape(ansText2));
		    
		    //writer.print(CommonUtils.escape(ansText1));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(""+list.getUserName()));
		    writer.print("\t");
		    writer.print(CommonUtils.escape(list.getLastModifiedDate()));
		    writer.println();
		    /*writer.print(CommonUtils.escape(task.getStatusName()));
		    writer.println();*/
		   }
		       
		  } catch (IOException e) {
		     // e.printStackTrace();
		  }
		 }


	 
	 
		public void getFaqDetail(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			logger.info("Get biz unit detail");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int faqId = Integer.parseInt(request.getParameter("faqId"));
			url = URL_GET_FAQ_DETAIL + userSession.getUserName() + "/1234";
	//		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			FaqList faqlist=new FaqList();
			faqlist.setDeleteFaq(faqId);
			BaseResponse<BizUnit> br = new BaseResponse<BizUnit>();
			//br = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB),BaseResponse.class);
			br = restTemplate.postForObject(url, faqlist, BaseResponse.class);

			FaqList list = null;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				list = objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()),
						FaqList.class);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, list);

		}
	 
	 
	 
	
	
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}	
	
	
	
	
	}



