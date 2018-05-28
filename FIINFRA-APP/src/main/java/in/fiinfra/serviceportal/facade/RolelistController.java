package in.fiinfra.serviceportal.facade;

import java.io.IOException;

import in.fiinfra.common.service.vo.Role;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.serviceportal.service.RoleServices;

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
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/role")
public class RolelistController extends MultiActionController 
{
	Response response;

	@Autowired
	RoleServices roleServices;

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/roleList/{user}/{token}")
	public Response roleList(@PathParam("token") String token, @PathParam("user") String name, @RequestBody Role role) 
	{
		response = roleServices.getRoleList(role);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteRole/{user}/{token}")
	public Response deleteRole(@RequestBody Role role, 
			
			   @PathParam("token") String token,
			   @PathParam("user") String name ) throws IOException 
	{
		response = roleServices.deleteRole(role);
		return response;
	}

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/uiquerole/{user}/{token}")
	public Response uiqueRoleName(@RequestBody Role role, 
			   @PathParam("token") String token,
			   @PathParam("user") String name ) throws IOException 
	{
		response = roleServices.uiqueRoleName(role);
		return response;
	}
	
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNewRole/{username}/{token}")
	public Response addNewRole(@PathParam("username") String userName,
							   @PathParam("token") String token,
							   @QueryParam("buId") int buId,
			                   @RequestBody Role roleData) 
	{
		Response response = null;
		if (buId <= 0) 
		{
			buId = FiinfraConstants.AXISMFBUID;
		}

		response = roleServices.addNewRole(roleData);
		return response;
	}
	
	
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/roleUpdate/{username}/{token}")
	public Response roleUpdate(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") int buId,@RequestBody Role roleData) 
	{
		Response response = null;
		if (buId <= 0) 
		{
			buId = FiinfraConstants.AXISMFBUID;
		}

		response = roleServices.roleUpdate(roleData);
		return response;
	}
	
	
	//role access list 
		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getAllRoleAccessList/{user}/{token}")
		public Response getAllRoleAccessList(@PathParam("token") String token, @PathParam("user") String name,@RequestBody RoleAccess roleAccess) 
		{
			response = roleServices.getAllRoleAccessList(roleAccess);
			return response;
		}

		
		@POST
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getSourceSystemList/{user}/{token}")
		public Response getSourceSystemList() 
		{
			response = roleServices.getSourceSystemList();
			return response;
		}

		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/updateRoleAccessList/{user}/{token}")
		public Response updateRoleAccessList(
				@QueryParam("Lists") String objectIdList,
				@QueryParam("roleId") int roleId,
				@QueryParam("createdby") int createdby,
				@QueryParam("sourceId") int sourceId,
				@PathParam("token") String token, 
				@PathParam("user") String name) {


			response = roleServices.updateRoleAccessList(objectIdList,roleId,createdby,sourceId);
			return response;

		}
}
