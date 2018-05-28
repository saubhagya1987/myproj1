package in.fiinfra.serviceportal.facade;

import in.fiinfra.common.service.vo.Broadcast;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.serviceportal.service.BroadcastService;

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
@Path("/broadcast")
public class BroadcastController extends MultiActionController {

	Response response;

	@Autowired
	BroadcastService broadcastService;

	private ObjectMapper objectMapper;

	public BroadcastService getBroadcastService() {
		return broadcastService;
	}

	public void setBroadcastService(BroadcastService broadcastService) {
		this.broadcastService = broadcastService;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/listBroadcast/{user}/{token}")
	public Response getBroadcastLists(@PathParam("token") String token, @PathParam("user") String name,@RequestBody Broadcast broadcast) {

		// BaseResponse<Broadcast> br = new BaseResponse<>();
		/*
		 * if(searchText == null){ searchText = ""; }
		 */
		response = broadcastService.showBroadcastList(broadcast);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/userTypeList/{user}/{token}")
	public Response getUserTypeLists(@PathParam("token") String token, @PathParam("user") String name,@RequestBody Broadcast broadcast) {

		response = broadcastService.getUserTypeList(broadcast);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/roleList/{user}/{token}")
	public Response getRoleList(@PathParam("token") String token, @PathParam("user") String name,@RequestBody Broadcast broadcast) {

		response = broadcastService.getAllRoleList(broadcast);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteBroadcast/{user}/{token}")
	public Response deleteBroadcast(@PathParam("token") String token,@PathParam("user") String name,@RequestBody Broadcast broadcast) {

		response = broadcastService.deleteBroadCastList(broadcast);
		return response;

	}

	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNewBroadcast/{username}/{token}")
	public Response addNewBroadcast(@PathParam("username") String userName,@PathParam("token") String token, @QueryParam("buId") int buId,@RequestBody Broadcast broadcast) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		//BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		response = broadcastService.insertOrUpdateBroadcast(broadcast);
		return response;
	}
}
