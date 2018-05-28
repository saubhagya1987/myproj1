package in.fiinfra.sync.controller;

import java.util.Arrays;
import java.util.List;

import in.fiinfra.common.common.SyncRequest;
import in.fiinfra.common.common.UserTokenRequest;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.diy.models.UserToken;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.ContactSyncResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.sync.service.SyncService;

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

import com.sun.jersey.api.core.InjectParam;

@Component
@Path("/sync")
public class SyncController {
	@Autowired
	SyncService syncService;

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/save/")
	public Response saveSync(@PathParam("token") String token, SyncData sync,
			@QueryParam("buId") int buId) {
		Response response = null;
		BaseResponse<ContactSyncResponse> baseResponse = new BaseResponse<ContactSyncResponse>();
		List<ContactSyncResponse> lst=syncService.saveSyncData(buId, sync);
		baseResponse
				.setResponseListObject( lst);
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMasterData/")
	public Response getListOfContacts(@InjectParam SyncRequest request) {
		Response response = null;
		BaseResponse<SyncData> baseResponse = new BaseResponse<SyncData>();
		baseResponse.setResponseObject(syncService.getMasterData(request));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/register/")
	public Response register(@InjectParam UserTokenRequest req) {
		BaseResponse<Boolean> baseResponse =   syncService.register(req);
		return Response.status(200).entity(baseResponse).build();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/activate/")
	public Response activate(@InjectParam UserTokenRequest req) {
		return Response.status(200).entity(syncService.activateUserToken(req)).build();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUserToken/")
	public Response getUserToken(@InjectParam UserTokenRequest request) {
		Response response = null;
		BaseResponse<UserToken> baseResponse = new BaseResponse<UserToken>();
		baseResponse.setResponseListObject(syncService.getUserToken(request));
		response = FiinfraResponseBuilder
				.getSuccessResponse(baseResponse, null);

		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/confirmToken/")
	public Response confirmToken(@InjectParam UserTokenRequest request) {
		return Response.status(200).entity(syncService.confirmToken(request)).build();
	}

}
