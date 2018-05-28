package in.fiinfra.controller;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.service.vo.QuartzJob;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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

/*****
 * 
 * 
 * @author sanket navale
 * 
 */
public class QuartzJobController extends MultiActionController {

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(QuartzJobController.class);

	private RestTemplate restTemplate;

	private ObjectMapper objectMapper;
	
	@Value("${URL_UPDATE_QUARTZ}")
	private String URL_UPDATE_QUARTZ;
	
	@Value("${URL_QUARTZ_JOB_LIST}")
	private String URL_QUARTZ_JOB_LIST;

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

	String url;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getQuartzList", method = RequestMethod.GET)
	public ModelAndView getQuartzList(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		ModelAndView mav = new ModelAndView("/quartzjob/quartzjob");
		try {

			QuartzJob qz = new QuartzJob();
			url = URL_QUARTZ_JOB_LIST + userToken + "/1234";

			BaseResponse<QuartzJob> br = new BaseResponse<QuartzJob>();
			br = restTemplate.postForObject(url, qz, BaseResponse.class);
			List<QuartzJob> quratzList = new ArrayList<QuartzJob>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				quratzList = br.getResponseListObject();
			mav.addObject("quratzList", quratzList);

		} catch (Exception e) {
			logger.error("" + e);
		}

		return mav;
	}

	
	@SuppressWarnings("unchecked")
	public void updateQuartz(HttpServletRequest request,
			HttpServletResponse response, QuartzJob quartzJob)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		url = URL_UPDATE_QUARTZ + userSession.getUserName()
				+ "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, quartzJob, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}
	
	//this method use to redirect autoping page
		public ModelAndView getRedirectQz(HttpServletRequest request,HttpServletResponse response){
			
			ModelAndView mav = new ModelAndView("/quartzjob/quartzjob");
			return mav;
		}

}
