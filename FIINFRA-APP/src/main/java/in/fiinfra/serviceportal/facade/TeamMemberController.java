package in.fiinfra.serviceportal.facade;

import in.fiinfra.common.service.vo.TeamMember;
import in.fiinfra.common.service.vo.TeamMemberAllocation;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.serviceportal.service.TeamMemberServices;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/teamMember")
public class TeamMemberController extends MultiActionController {

	Response response;
	
	@Autowired
	TeamMemberServices teamMemberServices; 
	
	private ObjectMapper objectMapper;

	public TeamMemberServices getTeamMemberServices() {
		return teamMemberServices;
	}

	public void setTeamMemberServices(TeamMemberServices teamMemberServices) {
		this.teamMemberServices = teamMemberServices;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/listOfTeamMember/{user}/{token}")
	public Response listOfTeamMember(@PathParam("token") String token, @PathParam("user") String name, @RequestBody TeamMember teamMember) {
		
		response = teamMemberServices.getAllTeamMember(teamMember);
		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNewTeamMember/{username}/{token}")
	public Response addNewTeamMember(@PathParam("username") String userName,@PathParam("token") String token, @RequestBody TeamMember teamMember) 
	{
		Response response = null;
		
		response = teamMemberServices.addTeamMember(teamMember);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUniqueMember/{user}/{token}")
	public Response getUniqueMember(
			@PathParam("token") String token, @PathParam("user") String name, @RequestBody TeamMember teamMember) {

		response = teamMemberServices.getUniqueMemberName(teamMember);
		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateTeamMember/{username}/{token}")
	public Response updateTeamMember(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") int buId,@RequestBody TeamMember teamMember) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		response = teamMemberServices.updateTeamMember(teamMember);
		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteTeamMember/{user}/{token}")
	public Response deleteTeamMember(@PathParam("token") String token,@PathParam("user") String name,@RequestBody TeamMember teamMember) {

		response = teamMemberServices.deleteTeamMember(teamMember);
		return response;

	}
	
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/allocationList/{user}/{token}")
	public Response allocationList(@PathParam("token") String token,@QueryParam("partyID") int partyID, @PathParam("user") String name) {

		response = teamMemberServices.getAllocationList(partyID);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/departmentSectionList/{user}/{token}")
	public Response departmentSectionList(@PathParam("token") String token,@QueryParam("buid") int buid, @PathParam("user") String name) {

		response = teamMemberServices.getDepartmentName(buid);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUniqueAllocation/{user}/{token}")
	public Response getUniqueAllocation(@PathParam("token") String token, @PathParam("user") String name,@QueryParam("partyID") int partyID,@QueryParam("buid") int buid,@QueryParam("departmentId") int departmentId) {

		response = teamMemberServices.getUnqAllocation(partyID, buid, departmentId);
		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addAllocation/{username}/{token}")
	public Response addAllocation(@PathParam("username") String userName,@PathParam("token") String token, @RequestBody TeamMemberAllocation teamMemberAllocation) 
	{
		Response response = null;
		/*if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}*/

		response = teamMemberServices.addNewAllocation(teamMemberAllocation);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateAllocation/{username}/{token}")
	public Response updateAllocation(@PathParam("username") String userName,@PathParam("token") String token, @RequestBody TeamMemberAllocation teamMemberAllocation) 
	{
		Response response = null;
		/*if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}*/

		response = teamMemberServices.updateAllocation(teamMemberAllocation);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAvailableBizUnitDeptList/{user}/{token}")
	public Response getAvailableBizUnitDeptList(@PathParam("token") String token, @PathParam("user") String name) {

		response = teamMemberServices.getAvailableBizUnitDeptList();
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addBulkAllocation/{username}/{token}")
	public Response addBulkAllocation(@PathParam("username") String userName,@PathParam("token") String token,@RequestBody TeamMember teamMember)  
	{
		Response response = null;
		/*if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}*/
		

		response = teamMemberServices.addBulkAllocation(teamMember);
		return response;
	}
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteAllocation/{user}/{token}")
	public Response deleteAllocation(@PathParam("token") String token,@PathParam("user") String name,@RequestBody TeamMemberAllocation teamMemberAllocation) {

		response = teamMemberServices.deleteAllocation(teamMemberAllocation);
		return response;

	}
}
