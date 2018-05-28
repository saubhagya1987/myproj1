package in.fiinfra.serviceportal.facade;

import java.io.IOException;

import in.fiinfra.serviceportal.service.NotifyEventServices;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET; 
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.util.BaseResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/notificationevent")
public class NotifyEventController extends MultiActionController {
	
	Response response;
	private static final Logger logger = Logger.getLogger(DepartmentListController.class);
	
	@Autowired
	NotifyEventServices NotifyEventServices;  

	public NotifyEventServices getNotifyEventServices() {
		return NotifyEventServices;
	}

	public void setNotifyEventServices(NotifyEventServices notifyEventServices) {
		this.NotifyEventServices = notifyEventServices;  
	}  

	private ObjectMapper objectMapper;  
	 
	public ObjectMapper getObjectMapper() {    
		return objectMapper;  
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	 
	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventlist/{user}/{token}") 
	public Response getEventlist( 
			@PathParam("token") String token,
			@PathParam("user") String name,  @RequestBody NotifyEvent notifyEvent	)
   {
		BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>(); 
		response =NotifyEventServices.getNitifyEventList(notifyEvent);   
 		return response;
	}
	  
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteEventList/{user}/{token}")
	public Response deleteEventList(	@QueryParam("Lists") String deletelist, @QueryParam("userId") int deleteuserId, 
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
			{

			BaseResponse<Integer> br = new BaseResponse<>();
			response=NotifyEventServices.deleteNotifyEvent(deletelist, deleteuserId);
			return response; 
			   
			}  
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCategorySection/{user}/{token}")
	 public Response getCategorySection() throws IOException 
		{
		BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
		   response=NotifyEventServices.showCategoryList();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSystemSection/{user}/{token}")
	 public Response getSystemSection() throws IOException 
		{
		BaseResponse<NotifyEvent> br = new BaseResponse<NotifyEvent>();
		   response=NotifyEventServices.showSystemList(); 
			return response; 
		} 
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNotifyevent/{user}/{token}")
	public Response  addNotifyevent(NotifyEvent eventList, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		
		BaseResponse<Integer> br = new BaseResponse<>();
		response=NotifyEventServices.addNotifyEvent(eventList.getName(),eventList.getDescription(), eventList.getEventcategoryid(), eventList.getSourcesystemid(),eventList.getUserID());
		return response;
			
	}
	

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editNotifyevent/{user}/{token}")
	public Response  editNotifyevent( 
			NotifyEvent eventList, 
			@PathParam("token") String token,
			@PathParam("user") String name	
			) throws IOException ,NumberFormatException
	{
		  
		BaseResponse<Integer> br = new BaseResponse<>();
		response=NotifyEventServices.editNotifyEvent(eventList.getNotifyeventid(), eventList.getName(),eventList.getDescription() ,eventList.getEventcategoryid(), eventList.getSourcesystemid(),eventList.getUserID());
		return response;

		}    
	 
} 
	
	
   

