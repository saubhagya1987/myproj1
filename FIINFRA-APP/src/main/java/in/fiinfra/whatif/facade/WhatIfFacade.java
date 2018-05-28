package in.fiinfra.whatif.facade;

import in.fiinfra.common.diy.models.WhatIfData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.whatif.service.WhatIfService;

import java.util.List;

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

@Controller
@Path("/whatif")
public class WhatIfFacade {

	@Autowired
	WhatIfService whatIfService;
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getWhatIfData/{partyId}/{user}/{token}")
	public Response getWhatIfData(@PathParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<WhatIfData> whatIfDataList = whatIfService.getWhatIfData(partyId);
		BaseResponse<WhatIfData> baseResponse = new BaseResponse<WhatIfData>();
		baseResponse.setResponseListObject(whatIfDataList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/saveWhatIfData/{user}/{token}")
	public Response saveWhatIfData(@PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody List<WhatIfData> whatIfDataList)
	{
		Response response = null;
		if( buId <= 0 ) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(whatIfService.saveWhatIfData(whatIfDataList));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}

}
