package in.fiinfra.login.facade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Component
public class LoginController {
	
	/*@Autowired
	LoginService loginService;

	
	public	UserDetailsJson getUserDetails(String username) throws Exception {
		UserDetailsJson userDetailsJson = loginService.getUserDetails(username);
		return userDetailsJson;
	}
	

	// to unlock the user if user is locked
		
	public	Boolean expiredLockAccount(String username) throws Exception {
		Boolean result = loginService.expireLockAccount(username);
		return result;
	}
	

	// if user failed to login with credentials
	
	public Integer loginAttemptFailed(String username,String IPaddress) {
		Integer result = loginService.loginAttemptFailed(username, IPaddress);
		return result;
	}

	// user successfully login to the system
	
  public UserSession getSessionDataForSuccessfulLogin(String username, String IPaddress) 
	{
		return loginService.getSessionDataForSuccessfulLogin(username,IPaddress);

	}
	
	
	// user successfully login to the system for Client Portal
		
	public UserSession getSessionUserDetail(String token, String ip) 
	{
		return loginService.getUserByToken(token, ip);
	}

	//getPassword Policy for Username
		
	public Response  getPasswordPolicy(String username)
	{
		BaseResponse<PasswordPolicy> baseResponse = new BaseResponse<PasswordPolicy>();
		baseResponse.setResponseObject(null);
		baseResponse.setResponseListObject(loginService.getPasswordPolicy(username));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	
	// for reset the password

		public Response resetpassword(String username, KeyValue keyValue) 
		{
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			baseResponse.setResponseObject(loginService.resetPassword(username, keyValue.getName(),keyValue.getId()));
			baseResponse.setResponseListObject(null);
			baseResponse.setStatus("SUCCESS");
			Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
			return response;
		}
	*/
	//@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public ModelAndView login(HttpServletRequest request,
//			HttpServletResponse response) {
//		//return new ModelAndView("redirect:" + newRedirectUrl);
//		
//		ModelAndView mav = new ModelAndView("common/Login");
//	//	mav.addObject("tagDatas", tagDatas);
//		return mav;
//	}
}
