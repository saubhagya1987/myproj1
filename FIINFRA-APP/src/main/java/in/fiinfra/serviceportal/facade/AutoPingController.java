package in.fiinfra.serviceportal.facade;


import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.service.vo.ActivityTarcker;
import in.fiinfra.common.service.vo.AutoPing;
import in.fiinfra.common.service.vo.NotifyTemplate;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.serviceportal.service.AutoPingService;
import in.fiinfra.serviceportal.service.DashboardService;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/autoping")
public class AutoPingController extends MultiActionController{

	Response response;
	private static final Logger logger = Logger.getLogger(AutoPingController.class);
	@Autowired
	AutoPingService autopingService;
	
	
	public AutoPingService getAutopingService() {
		return autopingService;
	}


	public void setAutopingService(AutoPingService autopingService) {
		this.autopingService = autopingService;
	}

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveAutoPingEvent/{user}/{token}")
	 public Response saveAutoPingEvent(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody AutoPing autoping)
	   {
		 response=autopingService.addAutoPingEvent(autoping);
			return response;

	   }
		
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventAutoPing/{user}/{token}")
	 public Response getEventAutoPing(@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<AutoPing> br = new BaseResponse<>();
		   response=autopingService.getEventAutoPingList();  
		   return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventAutoPingForPartner/{user}/{token}")
	 public Response getEventAutoPingForPartner(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<AutoPing> br = new BaseResponse<>();
		   response=autopingService.getEventAutoPingListForPartner(partyId);  
		   return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateEventStatusAutoPingForPartner/{user}/{token}")
	 public Response updateEventStatusAutoPingForPartner(@QueryParam("partyId") int partyId,@QueryParam("eventId") int eventId,@QueryParam("flag") String flag,@QueryParam("lastUpdatedBy") int lastUpdatedBy,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<Integer> br = new BaseResponse<>();
		   br.setResponseObject(autopingService.updateEventStatusAutoPingForPartner(partyId,eventId,flag,lastUpdatedBy));  
		   response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		   return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getScheduledAutoPing/{user}/{token}")
	 public Response getScheduledAutoPing(@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<AutoPing> br = new BaseResponse<>();
		   response=autopingService.getSchAutoPingList();  
		   return response;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAutoPingList/{user}/{token}")
	 public Response getAutoPingList(@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<AutoPing> br = new BaseResponse<>();
		   response=autopingService.getAutoTopPingList();  
		   return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSelectEventList/{user}/{token}")
	 public Response getSelectEventList(@QueryParam("selectSource") int selectSource,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<AutoPing> br = new BaseResponse<>();
		   response=autopingService.getSelectEventList(selectSource);  
		   return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveAutoPing/{user}/{token}")
	 public Response saveAutoPing(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody AutoPing autoping)
	   {
		 response=autopingService.addAutoPing(autoping);
			return response;

	   }
		
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/scheduledAutoPing/{user}/{token}")
	 public Response scheduledAutoPing(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody AutoPing autoping)
	   {
		 response=autopingService.schAutoPing(autoping);
			return response;

	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventEdit/{user}/{token}")
	 public Response getEventEdit(@QueryParam("eventId") int eventId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<AutoPing> br = new BaseResponse<>();
		   response=autopingService.getEventAutoPingEditList(eventId);  
		   return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStandardAutoPingList/{username}/{token}")
	public Response getStandardAutoPingList(@PathParam("username") String userName,
			@PathParam("token") String token, @RequestBody NotifyTemplateData notifyTemplateData) {
		
			Response response=null;
			response =autopingService.getStandardAutoPingList(notifyTemplateData);
			return response;

	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addAutoPingTemplate/{username}/{token}")
	public Response addAutoPingTemplate(@PathParam("username") String userName,
			@PathParam("token") String token, @RequestBody NotifyTemplateData notifyTemplateData) {
		Response response = null;
		response = autopingService.getAddAutoPingTemp(notifyTemplateData);
		return response;
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAutoPingEditList/{user}/{token}")
	 public Response getAutoPingEditList(@QueryParam("notifyTemplateId") int notifyTemplateId,@QueryParam("buId") int buId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		   BaseResponse<NotifyTemplateData> br = new BaseResponse<>();
		   response=autopingService.getAutoPingEditList(notifyTemplateId,buId);  
		   return response;
	}
}
