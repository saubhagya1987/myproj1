package in.fiinfra.forgotpassword.controllers;



import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.forgotpassword.models.ForgotPasswordBean;
import in.fiinfra.forgotpassword.validators.ForgotPasswordBeanValidator;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.io.InputStream;
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
import javax.servlet.http.HttpSession;
import javax.ws.rs.Produces;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/password")
public class ForgotPasswordController {
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired 
	Md5PasswordEncoder passwordEncoder;
	
	@Autowired
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
	
	private static String CHANGE_PASSWORD_SOUECE = "Change Password";
	
	@Autowired
	public ForgotPasswordController(ForgotPasswordBeanValidator forgotPasswordBeanValidator)
	{
		this.forgotPasswordBeanValidator = forgotPasswordBeanValidator;
	}
	
	
	@RequestMapping(value="/validatePassword", method=RequestMethod.GET)
	public String validatePassword()
	{
		try 
		{
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			UserDetailsJson userDetailsJson = getUserByUsername(authentication.getName());
			if(userDetailsJson.getForceChangePasswordOnLogin())
			{
				return "password/resetPassword";
			}
			else if(checkNumberOfHours(userDetailsJson.getNextPasswordChangeDtm()))
			{
				return "password/resetPassword";
			}
			else
			{
				return "redirect:/partner/dashboard";
			}
		} 
		catch (Exception exception) 
		{
			LOGGER.debug("Exception while reseting the password  "+exception.getMessage());
			return "redirect:login";
		}
	}
	
	@RequestMapping("/changePassword")
	public String changedPassword()
	{
		return "password/resetPassword";
	}
	
	
	@Produces("application/json")
	@RequestMapping(value="/resetPassword",method=RequestMethod.GET)
	public @ResponseBody String resetPassword(HttpServletRequest request)
	{
		HttpSession httpSession = request.getSession();
		String username =(String) httpSession.getAttribute("USER_NAME");
		UserDetailsJson userDetailsJson = getUserByUsername(username);
		BaseResponse<PasswordPolicy> baseResponse = new BaseResponse<PasswordPolicy>();
		List<PasswordPolicy> passwordPolicy = new ArrayList<PasswordPolicy>();
		List<PasswordPolicy> policies = new ArrayList<PasswordPolicy>();
		baseResponse  =  restTemplate.getForObject(passwordPolicyurl+username, BaseResponse.class);
		if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try 
			{	//to extract password policy from responce object
				passwordPolicy = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				for(int i=0;i<passwordPolicy.size();++i)
				{
					PasswordPolicy  policy= objectMapper.readValue(objectMapper.writeValueAsString(passwordPolicy.get(i)), PasswordPolicy.class);
					policies.add(policy);
				}
				//validation logic
				String oldencreptedPassword = userDetailsJson.getPassword();
				String existingPassword= request.getParameter("existingPassword");
				String newPassword=request.getParameter("newPassword");
				String reEnterPassword = request.getParameter("reEnterPassword");
				Integer minSpecialCharactrs=null;
				Integer minCapitalLetters = null;
				String specialCharacters = "[";
				Integer passwordMinSize=null;
				Integer passwordMaxSize=null;
				
				
				for (PasswordPolicy Policy : policies) 
				{
					// Retrieve special characters set
					if(Policy.getAttributCodeId() == 98072)
					{
						specialCharacters =specialCharacters + Policy.getAttributeValue()+"]";
					}
					// Retrieve number of min capital letter allowed 
					if(Policy.getAttributCodeId() == 98073)
					{
						minCapitalLetters =Integer.parseInt(Policy.getAttributeValue());
					}
					// Retrieve number of min Special characters allowed
					if(Policy.getAttributCodeId() == 98074)
					{
						minSpecialCharactrs =Integer.parseInt(Policy.getAttributeValue());
					}
					// Retrieve  password minimum size
					if(Policy.getAttributCodeId() == 98069)
					{
						passwordMinSize =Integer.parseInt(Policy.getAttributeValue());
					}
					// Retrieve  password maximum size
					if(Policy.getAttributCodeId() == 98070)
					{
						passwordMaxSize =Integer.parseInt(Policy.getAttributeValue());
					}
					
				}
				
				
				
				//creating pattern to match special characters 
				Pattern specialCharacterPattern = Pattern.compile(specialCharacters);
				Matcher specialCharactermatcher = specialCharacterPattern.matcher(newPassword);
				Pattern capitalLettersPattern = Pattern.compile("[A-Z]");
				Matcher capitalLettersMatcher = capitalLettersPattern.matcher(newPassword);
				
				if(!(passwordEncoder.isPasswordValid(oldencreptedPassword, existingPassword, null)))
				{
					return "Please enter valid existing password.";
				}
				else if(newPassword.length()<passwordMinSize)
				{
					return "Minimum size for password is "+passwordMinSize+".";
				}
				else if(newPassword.length()>passwordMaxSize)
				{
					return "Maximum size for password is "+passwordMaxSize+".";
				}
				else if (!(specialCharactermatcher.find())) 
				{
					return "Please use atleast "+minSpecialCharactrs+" special character from "+specialCharacters+".";
				}
				else if(!(capitalLettersMatcher.find()))
				{
					return "Please use atleast "+minCapitalLetters+"capital letter.";
				}
				else if(!(newPassword.equals(reEnterPassword)))
				{
					return "New Password and Re-enter password doesn't match.";
				}
				else
				{
					// calling service to update
					BaseResponse<Boolean> response = new BaseResponse<>();
					KeyValue keyValue = new KeyValue();
					//Encrepting new password
					String password = passwordEncoder.encodePassword(newPassword, null);
					keyValue.setName(password);
					keyValue.setId(0);
					response =  restTemplate.postForObject(resetPasswordUrl+username, keyValue, BaseResponse.class);
					UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
					if(response.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					{
						request.getSession().invalidate();
						audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CHANGE_PASSWORD_SUCCESSFUL,CHANGE_PASSWORD_SOUECE,FiinfraConstants.DIY_SOURCE_MODULE_CHANGE_PASSWORD);
						return "You have successfully changed the password. Please login with the new password. You will be redirect to the login screen.";
					}
					else
					{
						audit(userSession.getPartyId(), userSession.getUserId(), FiinfraConstants.DIY_CHANGE_PASSWORD_SUCCESSFUL,CHANGE_PASSWORD_SOUECE,FiinfraConstants.DIY_SOURCE_MODULE_CHANGE_PASSWORD);
						return "Please try again after some time.";
					}
					
				}
			}
			catch(Exception exception)
			{
				LOGGER.debug("Error while reseting the password "+exception.getMessage());
				return null;
			}
		}
		return "redirct:login";
	}
		
	@RequestMapping("/forgotpassword")
	public ModelAndView forgotPassword()
	{
		ForgotPasswordBean forgotPasswordBean = new ForgotPasswordBean();
			
		return new ModelAndView("forgotpassword", "forgotPasswordBean", forgotPasswordBean); 
	}
		
	@Produces("application/json")
	@RequestMapping(value="/submitForEmailId", method=RequestMethod.GET)
	public @ResponseBody String submitForEmailId(@ModelAttribute ForgotPasswordBean forgotPasswordBean, BindingResult bindingResult,HttpServletRequest  request)
	{		
		UserDetailsJson userDetailsJson = getUserByUsername(forgotPasswordBean.getUserName());
		forgotPasswordBeanValidator.setValidationForEmailId(true);
		forgotPasswordBeanValidator.setUserDetailsJson(userDetailsJson);
		forgotPasswordBeanValidator.validate(forgotPasswordBean, bindingResult);
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
		
			return errorMessage;
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
				return "You have successfully changed the password. Please login with the new credentials. You will be redirect to the login screen.";
			}
			else
			{
				return "please try again after some time";
			}
		}
	}
	
	
	@Produces("application/json")
	@RequestMapping(value= "/submitForSecurityQuestion", method=RequestMethod.GET)
	public @ResponseBody String submitForSecurityQuestion(@ModelAttribute("forgotPasswordBean") ForgotPasswordBean forgotPasswordBean, BindingResult bindingResult,HttpServletRequest request)
	{
		
		// retrieve userdetailjson from app web service
		UserDetailsJson userDetailsJson = getUserByUsername(forgotPasswordBean.getUserName());
				
		forgotPasswordBeanValidator.setValidationForEmailId(false);
		forgotPasswordBeanValidator.setUserDetailsJson(userDetailsJson);

		//call validate and pass userdetailjson
		forgotPasswordBeanValidator.validate(forgotPasswordBean, bindingResult);
		
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
		
			return errorMessage;
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
				return "You have successfully changed the password. Please login with the new credentials. You will be redirect to the login screen.";
			}
			else
			{
				return "please try again after some time";
			}
		}		
	}
	
	private UserDetailsJson getUserByUsername(String username) 
	{
		UserDetailsJson userDetailsJson = restTemplate.getForObject(
				userDetailsURL + username, UserDetailsJson.class);

		if (userDetailsJson != null) 
		{
			if (userDetailsJson.getAccountLocked() == null)
				userDetailsJson.setAccountLocked(true);
		}
			return userDetailsJson;
	}

	private Boolean checkNumberOfHours(Timestamp passwordChangeDttm) 
	{
		DateTime currentDate = new DateTime(System.currentTimeMillis());
		DateTime passwordChangeDate = new DateTime(passwordChangeDttm);
		Integer result =  currentDate.compareTo(passwordChangeDate);
		if(result>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	private String generatePassword(String username)
	{
		Integer passwordMinSize=null;
		Integer minCapitalLetters=null;
		Integer minSpecialCharactrs=null;
		String password="";
		String specialCharacters[]={};
		Random random = new Random();
		BaseResponse<PasswordPolicy> baseResponse = new BaseResponse<>();
		
		List<PasswordPolicy> passwordPolicy = new ArrayList<PasswordPolicy>();
		List<PasswordPolicy> policies = new ArrayList<PasswordPolicy>();
		baseResponse  =  restTemplate.getForObject(passwordPolicyurl+username, BaseResponse.class);
		if(baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success))
		{
			try 
			{	//to extract password policy from responce object
				passwordPolicy = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				for(int i=0;i<passwordPolicy.size();++i)
				{
					PasswordPolicy  policy= objectMapper.readValue(objectMapper.writeValueAsString(passwordPolicy.get(i)), PasswordPolicy.class);
					policies.add(policy);
				}
				for (PasswordPolicy Policy : policies) 
				{
					// Retrieve special characters set
					if(Policy.getAttributCodeId() == 98072)
					{
						specialCharacters = Policy.getAttributeValue().split(",");
					}
					// Retrieve number of min capital letter allowed 
					else if(Policy.getAttributCodeId() == 98073)
					{
						minCapitalLetters =Integer.parseInt(Policy.getAttributeValue());
					}
					// Retrieve number of min Special characters allowed
					else if(Policy.getAttributCodeId() == 98074)
					{
						minSpecialCharactrs =Integer.parseInt(Policy.getAttributeValue());
					}
					// Retrieve  password minimum size
					else if(Policy.getAttributCodeId() == 98069)
					{
						passwordMinSize =Integer.parseInt(Policy.getAttributeValue());
					}
				}
				int size= 0;
				for(; size<minCapitalLetters;++size)
				{
					password =password+Character.toUpperCase(username.charAt(random.nextInt(username.length())));
				}
				while(size<passwordMinSize)
				{
					for(int i=0; i<minSpecialCharactrs;++size)
					{
						password =password+specialCharacters[random.nextInt(specialCharacters.length)];  //specialChar[random.nextInt(specialChar.length)];
						i++;
					}
					for(int length=password.length();size<length+2;++size)
					{
						password =password+username.charAt(random.nextInt(username.length()));  //specialChar[random.nextInt(specialChar.length)];
					}
					for(;size<passwordMinSize;++size)
					{
						String result =System.currentTimeMillis()%size+"";
						password =password+ result.charAt(0);
					}
				}
			}
			catch(Exception exception)
			{
				LOGGER.debug("error while generating password  "+exception);
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
		notification.setSourceSystemID(FiinfraConstants.DIY);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(partyId);
		notification.setNotifyEventID(FiinfraConstants.FORGOT_PASSWORD);
		//notification.setDeliveryChannelID(32001);
		notification.setSessionID(sessionId);
		notification.setBuId(buId);
		notification.setPayloadMap(payloadMap);
		FrameworkUtil.notify(notification);
		return null;
	}
	
	private void audit(int actionByPartyId, int actionByUserId, int eventId, String sourceModule, String sourceScreen){
		try{
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);				
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			FrameworkUtil.audit(audit);
		} catch(Exception exception){
			LOGGER.error("Error occured while doing Audit", exception);
		}		
	}
}
