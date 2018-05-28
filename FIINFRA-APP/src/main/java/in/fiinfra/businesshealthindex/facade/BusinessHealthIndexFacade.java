package in.fiinfra.businesshealthindex.facade;

import in.fiinfra.businesshealthindex.service.BusinessHealthIndexService;
import in.fiinfra.common.diy.models.BusinessHealthIndex;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;

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
@Path("/businessHealthIndex")
public class BusinessHealthIndexFacade {

	@Autowired
	BusinessHealthIndexService businessHealthIndexService;
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getBusinessHealthIndex/{user}/{token}/{partyId}")
	public Response getBusinessHealthIndex( @PathParam("user") String user, @PathParam("token") String token, @PathParam("partyId") Integer partyId, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 )
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		List<BusinessHealthIndex> businessHealthIndexList = businessHealthIndexService.getBusinessHealthIndexQuestionnaire(partyId);
		BaseResponse<BusinessHealthIndex> baseResponse = new BaseResponse<BusinessHealthIndex>();
		baseResponse.setResponseListObject(businessHealthIndexList);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/getIFAClassification/{partyId}/{user}/{token}")
	public Response getIFAClassification( @PathParam("partyId") Integer partyId, @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId )
	{
		Response response = null;
		if( buId <= 0 )
		{
			buId = FiinfraConstants.AXISMFBUID;
		}
		String IFAClass = businessHealthIndexService.getIFAClassification(partyId);
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse.setResponseObject(IFAClass);
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path(value="/saveBusinessHealthIndex/{user}/{token}")
	public Response saveBusinessHealthIndex( @PathParam("user") String user, @PathParam("token") String token, @QueryParam("buId") Integer buId, @RequestBody List<BusinessHealthIndex> businessHealthIndexList )
	{
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		baseResponse.setResponseObject(businessHealthIndexService.saveBusinessHealthIndexQuestionnaire(businessHealthIndexList));
		Response response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}
	
}
