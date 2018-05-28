package in.fiinfra.serviceportal.facade;


import java.io.IOException;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.Setting;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.serviceportal.service.SettingService;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/setting")
public class SettingController  extends MultiActionController
{
	Response response;
	 @Autowired
		
	  SettingService settingServices;
		private ObjectMapper objectMapper;
		public SettingService getSettingServices() {
			return settingServices;
		}
		public void setSettingServices(SettingService settingServices) {
			this.settingServices = settingServices;
		}
		public ObjectMapper getObjectMapper() {
			return objectMapper;
		}
		public void setObjectMapper(ObjectMapper objectMapper) {
			this.objectMapper = objectMapper;
		}
		
		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/listSetting/{user}/{token}")
		public Response loadProfileSetting(@QueryParam("partyId") int partyId,
				 @PathParam("token") String token,
					@PathParam("user") String name) throws NullPointerException
		{

		//	logger.info("\nHELLO ViewProfile_Setting  WelcomeController ");
	

	   BaseResponse<Setting> br = new BaseResponse<>();
	   response=settingServices.getSettingList(partyId);
		return response;
		
		}
	
		
		
		
		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getSettingDetail/{user}/{token}")
		public Response getSettingDetail(@QueryParam("partyId") int partyId,
				@QueryParam("partySettingId") int partySettingId
				, @PathParam("token") String token,
					@PathParam("user") String name) throws NullPointerException
		{
			//logger.info("\nHELLO ViewProfile_Setting  WelcomeController ");
	   BaseResponse<Setting> br = new BaseResponse<>();
	   response=settingServices.getSettingDetail( partyId, partySettingId);
	   return response;
		
		}
		
		
		
		
		
		
		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/deleteBizUnitSetting/{user}/{token}")
		public Response deleteFaq(	@QueryParam("Lists") String codetypeIds,
				@QueryParam("createdBy")  int createdBy,
				@PathParam("token") String token,
				@PathParam("user") String name	) throws IOException 
	{

	BaseResponse<Integer> br = new BaseResponse<>();
	response=settingServices.deleteSetting(codetypeIds,createdBy);
		return response;




	}
		
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/addBizUnitSetting/{user}/{token}")
		public Response addBizunitSetting(Setting setting,
				 @PathParam("token") String token,
					@PathParam("user") String name) throws NullPointerException
		{
		//	logger.info("\nHELLO ViewProfile_Setting  WelcomeController ");
	   response=settingServices.addSetting(setting);
	   return response;
		
		}
	
		
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/updateBizunitSetting/{user}/{token}")
		public Response updateBizunitSetting(Setting setting,
				 @PathParam("token") String token,
					@PathParam("user") String name) throws NullPointerException
		{
		//	logger.info("\nHELLO ViewProfile_Setting  WelcomeController ");
	   response=settingServices.updateSetting(setting);
	   return response;
		
		}
		
		@POST
		@Consumes(MediaType.APPLICATION_JSON)
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getUniqueSetting/{user}/{token}")
		public Response getUniqueSetting(Setting setting,
				 @PathParam("token") String token,
					@PathParam("user") String name) throws NullPointerException
		{
		//	logger.info("\nHELLO ViewProfile_Setting  WelcomeController ");
	   response=settingServices.getUniqueSetting(setting);
	   return response;
		
		}
		
		
		
		
		
}


