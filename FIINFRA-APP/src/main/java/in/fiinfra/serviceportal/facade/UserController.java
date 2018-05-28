package in.fiinfra.serviceportal.facade;


import java.io.IOException;

import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.serviceportal.service.UserService;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


//import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/serviceportaluser")
public class UserController extends MultiActionController
{
	Response response;
	
	@Autowired
	UserService userServices;
	private ObjectMapper objectMapper;
	
	public UserService getUserServices() 
	{
		return userServices;
	}

	public void setUserServices(UserService userServices) 
	{
		this.userServices = userServices;
	}

	public ObjectMapper getObjectMapper() 
	{
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) 
	{
		this.objectMapper = objectMapper;
	}


	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTopUserLists/{user}/{token}")
	 public Response getTopUserLists(@QueryParam("buId") int buId,
			 						 @QueryParam("userId") int userId,
			 						 @PathParam("token") String token,
			 						 @PathParam("user") String name) throws IOException
	   {
		   response=userServices.getTopLoginList(buId,userId);
		   return response;
	   }
	
	// User functionality done by Rahul
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getAllUser/{user}/{token}") 
	public Response getAllUser(@PathParam("token") String token,
							   @PathParam("user") String name, 
							   @RequestBody User userData) throws IOException
	{ 
		response =userServices.getAllUser(userData);   
 		return response;
	}

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getPartyName/{user}/{token}")
	public Response getPartyName() throws IOException
	{
		response =userServices.getPartyName();
	 	return response;
				 	
	} 
		 
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getRoleName/{user}/{token}")
	public Response getRoleName() throws IOException
	{
		response = userServices.getRoleName();	
		return response;
	}	
		
	
		 	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/updateDetailUser/{user}/{token}")
	public Response updateDetailUser(@PathParam("user") String name,
									 @PathParam("token") String token,
									 @RequestBody User userData) throws IOException
	{					
         response = userServices.getUserDteail(userData);
         return response;
	} 

	@POST
    @Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getUnqUserName/{user}/{token}")
	public Response getUniqueMember(@PathParam("token") String token, 
									@PathParam("user") String name,
									@RequestBody User userData) throws IOException
	{
		response = userServices.getUnqUserName(userData);
		return response;
	}
	 	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/updateUser/{username}/{token}")
	public Response updateUser(@PathParam("username") String userName,
							   @PathParam("token") String token,
							   @QueryParam("buId") int buId,
							   @RequestBody User userData) throws IOException
	{
		Response response = null;
		if (buId <= 0) 
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		response = userServices.updateUser(userData);
		return response;
	}
		
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/addNewUser/{username}/{token}")
	public Response addNewUser(@PathParam("username")String userName,
							   @PathParam("token") String token,
			                   @QueryParam("buId") int buId,
			                   @RequestBody User userData) throws IOException
	{
		Response response = null;
		if (buId <= 0) 
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		response = userServices.addNewUser(userData);
		return response;
	}
		 
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/deleteUser/{user}/{token}")
	public Response deleteUser(@PathParam("token") String token,
			                   @PathParam("user") String name,
			                   @RequestBody User userData) throws IOException
	{
		response=userServices.deleteUser(userData);
		return response;	
	}
		
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/resetPassword/{user}/{token}")
	public Response resetPassword(@PathParam("token") String token,
								  @PathParam("user") String name,
								  @RequestBody User userData) throws IOException
	{
		response=userServices.resetPassword(userData);
		return response;	
	}
	
	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/showAuditHistory/{user}/{token}") 
	public Response showAuditHistory(@PathParam("token") String token,
									 @PathParam("user") String name, 
									 @RequestBody User userData) 
	{
		response = userServices.showAuditHistory(userData);
		return response;
	}
	
	
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/updateUserProfileHeirarchy/{username}/{token}")
	public Response updateUserProfileHeirarchy(@PathParam("username")String userName,
							   @PathParam("token") String token,
			                   @QueryParam("buId") int buId,
			                   @RequestBody User userData) throws IOException
	{
		Response response = null;
		if (buId <= 0) 
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		response = userServices.updateUserProfileHeirarchy(userData);
		return response;
	}
}
