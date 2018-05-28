package in.fiinfra.forgotpassword.validators;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.forgotpassword.models.ForgotPasswordBean;

@Component
public class ForgotPasswordBeanValidator implements Validator
{

	private boolean validationForEmailId;
	private UserDetailsJson userDetailsJson;
	
	@Override
	public boolean supports(Class clazz) 
	{
		return ForgotPasswordBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) 
	{
		ForgotPasswordBean forgotPasswordBean = (ForgotPasswordBean)target;
		// first check if userdetailsJson is null
		if(userDetailsJson==null)
		{
			errors.reject("error.invalid.username");
			return; 
		}	
		
		// check for inactive account
		if(!userDetailsJson.getActive())
		{
			errors.reject("error.account.inactive");
			return;
		}
		
		// check for account locked
		if(userDetailsJson.getAccountLocked())
		{	errors.reject("error.account.locked");
			return;
		}
		 
		//check for account expireed
		if(isAccountExpire(userDetailsJson.getAccessStartDate(),userDetailsJson.getAccessExpiryDate()))
		{
			errors.reject("error.account.expire");
			return;
		}
		
		if(validationForEmailId )
		{
			if(!isEmailIdMatching(forgotPasswordBean.getEmail(), userDetailsJson.getEmailId()))
				{
				errors.reject("error.invalid.emailId");
				return;
				}
				
		}
			
		
		else if(!validationForEmailId)
		{
			if(!isSecurityQuestionIdValid(forgotPasswordBean.getQuestionId(), userDetailsJson.getSecurityQuestionID()))
			{	errors.reject("error.invalid.questionId");
				return;
			}
			if(!isSecurityAnswerMatching(forgotPasswordBean.getAnswer(), userDetailsJson.getSecurityAnswer()))
			{
				errors.reject("error.invalid.answer");
				return;
			}
					
		}
	
	}
		
		
	private boolean isAccountExpire(Timestamp accessStartDate, Timestamp accessExpiryDate)
	{
		Timestamp currentDttm = new Timestamp(System.currentTimeMillis());
		// Checking if Current Date is between Access StartDate and ExpiryDate
		if (currentDttm.after(accessStartDate) && currentDttm.before(accessExpiryDate))
			return false;
		else
			return true;
	}	

	
	private boolean isSecurityAnswerMatching(String selectedsecurityAnswer, String securityAnswer) 
	{
		return selectedsecurityAnswer.equalsIgnoreCase(securityAnswer);
	}
	
	
	private boolean isSecurityQuestionIdValid(Integer selectedSecurityQuestionId, Integer securityQuestionId) 
	{
		return selectedSecurityQuestionId.equals(securityQuestionId);
	}

		
	private boolean isEmailIdMatching(String userGiveEmailId, String storedEmailId)
	{
		return userGiveEmailId.equals(storedEmailId);
	}
	
	//getters setters
	
	public boolean isValidationForEmailId() 
	{
		return validationForEmailId;
	}

	public void setValidationForEmailId(boolean validationForEmailId) 
	{
		this.validationForEmailId = validationForEmailId;
	}

	public UserDetailsJson getUserDetailsJson() {
		return userDetailsJson;
	}

	public void setUserDetailsJson(UserDetailsJson userDetailsJson) {
		this.userDetailsJson = userDetailsJson;
	}
	
	
}
