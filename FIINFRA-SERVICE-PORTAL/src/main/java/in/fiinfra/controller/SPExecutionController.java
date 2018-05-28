package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.cp.CommonUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;



public class SPExecutionController extends MultiActionController
{
	
	
	private RestTemplate restTemplate;
	String url;
	
	private ObjectMapper objectMapper;



	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}



	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	@Value("${URL_GET_PRIPEINTED_FORM}")
	private String URL_GET_PRIPEINTED_FORM;
	
	public ModelAndView loadPripintedList(HttpServletRequest request,
			HttpServletResponse response) 
	{
		
		logger.info("Load loadPripintedList List ");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		
		
		Integer partnerId = Integer.parseInt(request.getParameter("partnerId"));
        Integer clientId = Integer.parseInt(request.getParameter("clientId"));
		System.out.println("bajirao");
		System.out.println("searchPartnerId"+partnerId);
		System.out.println("searchclientId"+clientId);
	//	ModelAndView mav = new ModelAndView("bizunit/BizUnitList");
		ModelAndView mav = new ModelAndView("partner/Executiontracker_form1");
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

			
			BaseResponse<ETPrePrintedFormData> br = new BaseResponse<ETPrePrintedFormData>();
			ETPrePrintedFormData data = new ETPrePrintedFormData();
			data.setSearchText(searchTextVal); 
			data.setPartnerId(partnerId);
			data.setClientId(clientId);
			url = URL_GET_PRIPEINTED_FORM + userToken + "/1234";
			br = restTemplate.postForObject(url, data, BaseResponse.class);
			List<ETPrePrintedFormData> list = new ArrayList<ETPrePrintedFormData>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				list = br.getResponseListObject();
			mav.addObject("trackData", list);
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			
			
			try {
				out = response.getWriter();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}
		
	
	
	
	
	public void priprintedExcel(HttpServletRequest request,HttpServletResponse response) 
	{
		logger.info("IN emport in excel for biz unit");
	//	logger.info("In export bizunit csv");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		//ModelAndView mav = new ModelAndView("bizunit/BizUnitList");
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
				BaseResponse<ETPrePrintedFormData> baseResponse = new BaseResponse<ETPrePrintedFormData>();
				ETPrePrintedFormData data = new ETPrePrintedFormData();
				data.setSearchText(searchTextVal);
			
			url = URL_GET_PRIPEINTED_FORM + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, data, BaseResponse.class);

			List<ETPrePrintedFormData> faqListAsJson = new ArrayList<ETPrePrintedFormData>();
			List<ETPrePrintedFormData> faqList = new ArrayList<ETPrePrintedFormData>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					faqListAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < faqListAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						ETPrePrintedFormData faqList2;
						faqList2 = objectMapper.readValue(objectMapper
								.writeValueAsString(faqListAsJson.get(i)),
								ETPrePrintedFormData.class);

						faqList.add(faqList2);
					}

				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			response.addHeader("Content-Disposition","attachment;filename=PriprintedForm.xls");

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Product"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Form Name"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Generated On"));
			writer.print("\t");
			writer.print(CommonUtils.escape("Form Path"));
		/*	writer.print("\t");
			writer.print(CommonUtils.escape("Common Name   "));
			writer.print("\t");
			writer.print(CommonUtils.escape("Updated on"));*/
		

			writer.println();
			for (ETPrePrintedFormData list : faqList) {

				// lastName

				writer.print(CommonUtils.escape(list.getProduct()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getFormName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getGeneratedOn()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getFormPath()));
		/*		writer.print("\t");
				writer.print(CommonUtils.escape("" + list.getCommName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getUpdateon()));*/
				writer.println();
				/*
				 * writer.print(CommonUtils.escape(task.getStatusName()));
				 * writer.println();
				 */
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void priprintedCSV(HttpServletRequest request,HttpServletResponse response) 
	{
		logger.info("IN emport in excel for biz unit");
	//	logger.info("In export bizunit csv");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
	//	ModelAndView mav = new ModelAndView("bizunit/BizUnitList");
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
				BaseResponse<ETPrePrintedFormData> baseResponse = new BaseResponse<ETPrePrintedFormData>();
				ETPrePrintedFormData data = new ETPrePrintedFormData();
				data.setSearchText(searchTextVal);
			url = URL_GET_PRIPEINTED_FORM + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, data, BaseResponse.class);

			List<ETPrePrintedFormData> faqListAsJson = new ArrayList<ETPrePrintedFormData>();
			List<ETPrePrintedFormData> faqList = new ArrayList<ETPrePrintedFormData>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					faqListAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < faqListAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						ETPrePrintedFormData faqList2;
						faqList2 = objectMapper.readValue(objectMapper
								.writeValueAsString(faqListAsJson.get(i)),
								ETPrePrintedFormData.class);

						faqList.add(faqList2);
					}

				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			response.addHeader("Content-Disposition","attachment;filename=PriprintedForm.csv");

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Product"));
			writer.print(",");
			writer.print(CommonUtils.escape("Form Name"));
			writer.print(",");
			writer.print(CommonUtils.escape("Generated On"));
			writer.print(",");
			writer.print(CommonUtils.escape("Form Path"));
		/*	writer.print("\t");
			writer.print(CommonUtils.escape("Common Name   "));
			writer.print("\t");
			writer.print(CommonUtils.escape("Updated on"));*/
		

			writer.println();
			for (ETPrePrintedFormData list : faqList) {

				// lastName

				writer.print(CommonUtils.escape(list.getProduct()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getFormName()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getGeneratedOn()));
				writer.print(",");
				writer.print(CommonUtils.escape(list.getFormPath()));
		/*		writer.print("\t");
				writer.print(CommonUtils.escape("" + list.getCommName()));
				writer.print("\t");
				writer.print(CommonUtils.escape(list.getUpdateon()));*/
				writer.println();
				/*
				 * writer.print(CommonUtils.escape(task.getStatusName()));
				 * writer.println();
				 */
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	
	
	
	
	
	
public RestTemplate getRestTemplate() {
	return restTemplate;
}

public void setRestTemplate(RestTemplate restTemplate) {
	this.restTemplate = restTemplate;
}
}






