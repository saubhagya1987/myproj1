package in.fiinfra.login.facade;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.login.service.LoginService;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Path("/user")
public class LoginController {
	@Autowired
	LoginService loginService;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/get/{username}")
	public @ResponseBody
	UserDetailsJson getUserDetails(@PathParam("username") String username) throws Exception {
		UserDetailsJson userDetailsJson = loginService.getUserDetails(username);
		return userDetailsJson;
	}

	// to unlock the user if user is locked
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/unlock/{username}")
	public @ResponseBody
	Boolean expiredLockAccount(@PathParam("username") String username) {
		Boolean result = loginService.expireLockAccount(username);
		return result;
	}

	// if user failed to login with credentials
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/loginfailed/{username}/{IPaddress}")
	public @ResponseBody
	Integer loginAttemptFailed(@PathParam("username") String username,
			@PathParam("IPaddress") String IPaddress) {
		Integer result = loginService.loginAttemptFailed(username, IPaddress);
		return result;
	}

	// user successfully login to the system
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/loginsuccessful/{username}/{IPaddress}")
	public @ResponseBody
	UserSession getSessionDataForSuccessfulLogin(@PathParam("username") String username,
			@PathParam("IPaddress") String IPaddress) 
	{
		return loginService.getSessionDataForSuccessfulLogin(username, IPaddress);
	}
	
	
	// get userid for username
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/getUserIdForUsername/{username}/{token}")
	public @ResponseBody
	Integer getSessionForUser(@PathParam("username") String username,@PathParam("token") String token) 
	{
		return loginService.getUserIdForUsername(username);
	}

	
	// user successfully login to the system for Client Portal
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/getUserByToken")
	public @ResponseBody
	UserSession getSessionUserDetail(@QueryParam("token") String token,
			@QueryParam("ip") String ip) 
	{
		return loginService.getUserByToken(BaseRequest.decode(token), ip);
	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/getSessionUserByToken")
	public @ResponseBody
	UserSession getUserByToken(@QueryParam("sourceSystemId") int sourceSystemId, @QueryParam ("u") String userName,  @QueryParam("token") String token) 
	{
		return loginService.getSessionUserByToken(sourceSystemId, userName, BaseRequest.decode(token));
	}

	//getPassword Policy for Username
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/passwordPolicy/{username}")
	public Response  getPasswordPolicy(@PathParam("username") String username)
	{
		BaseResponse<PasswordPolicy> baseResponse = new BaseResponse<PasswordPolicy>();
		baseResponse.setResponseObject(null);
		baseResponse.setResponseListObject(loginService.getPasswordPolicy(username));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	
	}
	
	
	// for reset the password
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/resetPassword/{username}")
		public Response resetpassword(@PathParam("username") String username, @RequestBody KeyValue keyValue) 
		{
		
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			baseResponse.setResponseObject(loginService.resetPassword(username, keyValue.getName(),keyValue.getId()));
			baseResponse.setResponseListObject(null);
			baseResponse.setStatus("SUCCESS");
			Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
			return response;
			
		}
	
	
	// for log user access log 
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/userAccessLog/{username}/{token}")
	public Response saveUserAccessLog(@PathParam("username") String username,@PathParam("token") String token, @RequestBody UserAccessLog userAccessLog) 
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(loginService.saveUserAccessLog(userAccessLog));
		baseResponse.setResponseListObject(null);
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	// for logout user from system 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/logoutUserFromSystem/{username}/{token}")
	public Response logoutUserFromSystem(@PathParam("username") String username,@PathParam("token") String token) 
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(loginService.logoutUserFromSystem(username));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	// if session expired 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value = "/userSessionExpired/{username}/{token}")
	public Response userSessionExpired(@PathParam("username") String username,@PathParam("token") String token) 
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(loginService.userSessionExpired(username));
		baseResponse.setStatus("SUCCESS");
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getRoleBasedSecurity/{username}/{partyId}/{sourceId}/{sectionTypeId}/{token}")
	public Response getRoleBasedSecurityIds(@PathParam("username") String username,@PathParam("token") String token,
				@PathParam("partyId") Integer partyId, @PathParam("sourceId") Integer sourceId, @PathParam("sectionTypeId") Integer sectionTypeId, @QueryParam("buId") Integer buId){
		
		String mappedControlIds = loginService.getRoleBasedSecurityIds(partyId, sourceId, sectionTypeId);
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse.setResponseObject(mappedControlIds);
		Response response  = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
}
