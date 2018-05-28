package in.fiinfra.forgotpassword.controllers;



import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.forgotpassword.models.ForgotPasswordBean;
import in.fiinfra.forgotpassword.validators.ForgotPasswordBeanValidator;
import in.fiinfra.framework.models.Notification;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


public class ForgotPasswordController extends MultiActionController{
	
	
	RestTemplate restTemplate;
	
	
	Md5PasswordEncoder passwordEncoder;
	
	
	private ObjectMapper objectMapper;
	
	 private Properties  properties = new Properties();
	 private InputStream inputStream=null;
	 
	private static final Logger LOGGER = Logger.getLogger(ForgotPasswordController.class);
	
	@Value("${RETRIVE_USER_DETAILS}")
	private String userDetailsURL;

	@Value("${RETRIVE_SECURITY_QUESTION}")	
	private String securityQuestionurl;
	
	@Value("${PASSWORD_POLICY}")
	private String passwordPolicyurl;
	
	@Value("${RESET_PASSWORD}")
	private String resetPasswordUrl;
	

	@Value("${SEND_NOTIFICATION}")
	private String SEND_NOTIFICATION_URL;
	
	
	
	private ForgotPasswordBeanValidator forgotPasswordBeanValidator;
	
	
	public  void submitForEmailId(HttpServletRequest request,HttpServletResponse response1,ForgotPasswordBean forgotPasswordBean) throws IOException
	{		
		List<String> resulList=new ArrayList<>();
		String message="";
		ServletRequestDataBinder binder = new ServletRequestDataBinder(forgotPasswordBean, "forgotPasswordBean");
		//set the Validator on this command object
		
		UserDetailsJson userDetailsJson = getUserByUsername(forgotPasswordBean.getUserName());
		forgotPasswordBeanValidator=new ForgotPasswordBeanValidator();
		forgotPasswordBeanValidator.setValidationForEmailId(true);
		forgotPasswordBeanValidator.setUserDetailsJson(userDetailsJson);
		binder.setValidator(forgotPasswordBeanValidator);
		binder.validate();
//		forgotPasswordBeanValidator.validate(forgotPasswordBean, bindingResult);
		BindingResult bindingResult=binder.getBindingResult();
		if(bindingResult.hasErrors()){
			ObjectError error = bindingResult.getGlobalError();
			String errorCode= error.getCode();
			String errorMessage =  null;
			try 
			{
				inputStream = ForgotPasswordController.class.getClassLoader().getResourceAsStream("error.properties");
				properties.load(inputStream);
				errorMessage =  properties.getProperty(errorCode);
			} 
			catch (Exception exception) 
			{
				LOGGER.debug("error while reading properties file for error		"+exception.getMessage());
			}
			message=errorMessage;
			resulList.add(FiinfraConstants.FAIL);
			resulList.add(errorMessage);
		}
		else
		{
			String newPassword =  generatePassword(forgotPasswordBean.getUserName());
			String encreptedPassword = passwordEncoder.encodePassword(newPassword, null);
			KeyValue keyValue = new KeyValue();
			keyValue.setName(encreptedPassword);
			keyValue.setId(1);
			BaseResponse<KeyValue> response = new BaseResponse<>();
			response =  restTemplate.postForObject(resetPasswordUrl+forgotPasswordBean.getUserName(), keyValue, BaseResponse.class);
			if(response.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				sendNotification(forgotPasswordBean.getUserName(), userDetailsJson.getBuId(), userDetailsJson.getUserID(),newPassword,userDetailsJson.getPartyId(),request.getSession().getId());
				message= "You have successfully changed the passowrd. Please login with the new credentials. You will be redirect to the login screen.";
				resulList.add(FiinfraConstants.SUCCESS);
				resulList.add(message);
			}
			else
			{
				message= "please try again after some time";
				resulList.add(FiinfraConstants.FAIL);
				resulList.add(message);
			}
		}
		PrintWriter out = null;
		out = response1.getWriter();
		response1.setContentType("application/json");
		objectMapper.writeValue(out, resulList);
	}
	
	
	public void submitForSecurityQuestion(HttpServletRequest request,HttpServletResponse response1,ForgotPasswordBean forgotPasswordBean) throws IOException
	{
		List<String> resulList=new ArrayList<>();
		String message="";
		ServletRequestDataBinder binder = new ServletRequestDataBinder(forgotPasswordBean, "forgotPasswordBean");
		// retrieve userdetailjson from app web service
		UserDetailsJson userDetailsJson = getUserByUsername(forgotPasswordBean.getUserName());
		forgotPasswordBeanValidator=new ForgotPasswordBeanValidator();		
		forgotPasswordBeanValidator.setValidationForEmailId(false);
		forgotPasswordBeanValidator.setUserDetailsJson(userDetailsJson);

		//call validate and pass userdetailjson
		binder.setValidator(forgotPasswordBeanValidator);
		binder.validate();
//		forgotPasswordBeanValidator.validate(forgotPasswordBean, bindingResult);
		BindingResult bindingResult=binder.getBindingResult();
		
		if(bindingResult.hasErrors()){
			ObjectError error = bindingResult.getGlobalError();
			String errorCode= error.getCode();
			String errorMessage =  null;
			try 
			{
				inputStream = ForgotPasswordController.class.getClassLoader().getResourceAsStream("error.properties");
				properties.load(inputStream);
				errorMessage =  properties.getProperty(errorCode);
			} 
			catch (Exception exception) 
			{
				LOGGER.debug("error while reading properties file for error		"+exception.getMessage());
			}
		
			message= errorMessage;
			resulList.add(FiinfraConstants.FAIL);
			resulList.add(errorMessage);
		}
		else{			
			String newPassword =  generatePassword(forgotPasswordBean.getUserName());
			String encreptedPassword = passwordEncoder.encodePassword(newPassword, null);
			KeyValue keyValue = new KeyValue();
			keyValue.setName(encreptedPassword);
			keyValue.setId(1);
			BaseResponse<KeyValue> response = new BaseResponse<>();
			response =  restTemplate.postForObject(resetPasswordUrl+forgotPasswordBean.getUserName(), keyValue, BaseResponse.class);
			if(response.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			{
				sendNotification(forgotPasswordBean.getUserName(), userDetailsJson.getBuId(), userDetailsJson.getUserID(),newPassword,userDetailsJson.getPartyId(),request.getSession().getId());
				message= "You have successfully changed the passowrd. Please login with the new credentials. You will be redirect to the login screen.";
				resulList.add(FiinfraConstants.SUCCESS);
				resulList.add(message);
			}
			else
			{
				message= "please try again after some time";
				resulList.add(FiinfraConstants.FAIL);
				resulList.add(message);
			}
		}
		PrintWriter out = null;
		out = response1.getWriter();
		response1.setContentType("application/json");
		objectMapper.writeValue(out, resulList);
	}
	
	private UserDetailsJson getUserByUsername(String username) 
	{
		UserDetailsJson userDetailsJson = restTemplate.getForObject(
				userDetailsURL + username, UserDetailsJson.class);
		System.out.println("userDetailsJson:----"+userDetailsJson);
		if (userDetailsJson != null) 
		{
			if (userDetailsJson.getAccountLocked() == null)
				userDetailsJson.setAccountLocked(true);
		}
			return userDetailsJson;
	}

	
	private String generatePassword(String username)
	{
		Integer passwordMinSize=8;
		Random random = new Random();
		String password="";
		int size= 0;
			
		for(; size<2;++size)
		{
			password =password+Character.toUpperCase(username.charAt(random.nextInt(username.length())));
		}
		
		while(size<passwordMinSize)
		{
			for(int length=password.length();size<length+2;++size)
			{
				password =password+username.charAt(random.nextInt(username.length()));  
			}
			for(;size<passwordMinSize;++size)
			{
				String result =System.currentTimeMillis()%size+"";
				password =password+ result.charAt(0);
			}
		}		
				
				
			
		return password;
	}
	
	private String sendNotification(String username,Integer buId, Integer userId,String password,Integer partyId,String sessionId)
	{
		Notification notification = null;
		Map<String,String> payloadMap=new HashMap<String, String>();
		payloadMap.put("temporaryPassword",password);
		notification=new Notification();
		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(partyId);
		notification.setNotifyEventID(FiinfraConstants.FORGOT_PASSWORD);
//		notification.setDeliveryChannelID(32001);
		notification.setBuId(buId);
		notification.setPayloadMap(payloadMap);
		notification.setSessionID(sessionId);
		FrameworkUtil.notify(notification);
		return null;
	}


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


	public Md5PasswordEncoder getPasswordEncoder() {
		return passwordEncoder;
	}


	public void setPasswordEncoder(Md5PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
	
	
}
