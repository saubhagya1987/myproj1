package in.fiinfra.task.facade;

import java.util.List;

import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.TaskSearchCriteria;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.task.service.TaskService;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;

@Component
@Path("/task")
public class TaskFacade 
{
	@Autowired
	TaskService taskService;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTasksForAdvisor/{username}/{advisorPartyId}/{token}")
	public Response getTasksForAdvisor(@PathParam("username") String userName,@PathParam("advisorPartyId") Integer advisorPartyId,@QueryParam("nodeId") int nodeId,
			@PathParam("token") String token, @QueryParam("buId") int buId,@QueryParam("taskSearchValue") String taskSearchValue) {

		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		//System.out.println("........................"+taskSearchValue);
		baseResponse.setResponseListObject(taskService.getListOfTask(advisorPartyId,taskSearchValue,nodeId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTasksForAdvisorWithSearchCriteria/{username}/{token}")	
	public Response getTasksForAdvisorWithSearchCriteria(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") int buId, @RequestBody TaskSearchCriteria taskSearchCriteria) {
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		baseResponse.setResponseListObject(taskService.getTasksForAdvisorWithSearchCriteria(taskSearchCriteria));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveTask/{username}/{token}")
	public Response saveTask(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") int buId,@RequestBody Task task) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(taskService.saveTask(task));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
 
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveTask1/{username}/{token}")
	public Response saveTask1(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") int buId,@RequestBody Task task) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<String> lsttask=taskService.saveTask1(task);
		BaseResponse<String> baseResponse = new BaseResponse<String>();
	
		baseResponse.setResponseListObject(lsttask);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
 
		
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateTask/{username}/{token}")
	public Response updateTask(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") int buId,@RequestBody Task task) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(taskService.updateTask(task));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartyName/{username}/{ownerPartyId}/{recordTypeId}/{token}")
	public Response getPartyIdNameForAdvisorAndRecordType(@PathParam("username") String userName,@PathParam("ownerPartyId") Integer ownerPartyId,
			@PathParam("recordTypeId") Integer recordTypeId,@PathParam("token") String token, @QueryParam("buId") int buId) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(taskService.getPartyIdNameForAdvisorAndRecordType(ownerPartyId, recordTypeId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTeamMembersForParty/{username}/{partyId}/{recordTypeId}/{token}")
	public Response getTeamMembersForParty(@PathParam("username") String userName,@PathParam("partyId") Integer partyId,@PathParam("token") String token, @QueryParam("buId") int buId) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		baseResponse.setResponseListObject(taskService.getTeamMembersForParty(partyId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteTask/{username}/{listOfTaskId}/{token}")
	public Response deleteTask(@PathParam("username") String userName,@PathParam("listOfTaskId")String listOfTaskId ,@PathParam("token") String token, @QueryParam("buId") int buId) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(taskService.deleteTask(listOfTaskId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTaskForTaskId/{username}/{taskId}/{token}")
	public Response getTaskForTaskId(@PathParam("username") String userName,@PathParam("taskId") Integer taskId,@PathParam("token") String token, @QueryParam("buId") int buId) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<Task> baseResponse = new BaseResponse<Task>();
		baseResponse.setResponseObject(taskService.getTaskForTaskId(taskId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	

	
}
