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

import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.service.vo.NotifyTemplate;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.serviceportal.service.NotifyTemplateServices;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
  
@Controller
@Path("/notificationtemplate")
public class NotifyTemplateController extends MultiActionController {
	
	private static final Logger logger = Logger.getLogger(NotifyTemplateController.class);
	 
	@Autowired 
	NotifyTemplateServices NotifyTemplateServices ;
	Response response;
     
	public NotifyTemplateServices getNotifyTemplateServices() {
		return NotifyTemplateServices;
	}  

	public void setNotifyTemplateServices(  
			NotifyTemplateServices notifyTemplateServices) {
		this.NotifyTemplateServices = notifyTemplateServices;
	}      
	 
	private ObjectMapper objectMapper ;  

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	
  
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTemplateList/{user}/{token}")
	 public Response getTemplateList(    
				@PathParam("token") String token,
				@PathParam("user") String name, @QueryParam("searchText") String searchText	)
	   {
			
		   BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response =NotifyTemplateServices.getNotifyTemplateList(searchText); 
		   return response; 
	   }*/
	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTemplateList/{user}/{token}") 
	public Response getTemplateList( 
			@PathParam("token") String token,
			@PathParam("user") String name,  @RequestBody NotifyTemplate notifyTemplate)
   {
			BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
			response =NotifyTemplateServices.getNotifyTemplateList(notifyTemplate); 
		    return response; 
	}  
	  
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteTemplateList/{user}/{token}")
	public Response deleteTemplateList(	@QueryParam("Lists") String deletelist,
			@QueryParam("userID") int userID,
			@PathParam("token") String token, 
			@PathParam("user") String name	) throws IOException 
			{ 

			BaseResponse<Integer> br = new BaseResponse<>();
			response=NotifyTemplateServices.deleteNotifyTemplate(deletelist,userID);  
			return response;
			  
			}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getBizUnitSection/{user}/{token}")
	 public Response getBizUnitSection() throws IOException 
		{
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response=NotifyTemplateServices.showBizUnit(); 
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSystemSection/{user}/{token}")
	 public Response getSystemSection() throws IOException 
		{
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response=NotifyTemplateServices.showSystem();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventSection/{user}/{token}")
	 public Response getEventSection() throws IOException 
		{
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response=NotifyTemplateServices.showEvent();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNameSection/{user}/{token}")
	 public Response getNameSection() throws IOException 
		{
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response= NotifyTemplateServices.showName();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEmailPhoneSection/{user}/{token}")    
	 public Response getEmailPhoneSection(@QueryParam("channel") String toDoList,
			 @PathParam("token") String token,
				@PathParam("user") String name) throws IOException 
		{ 
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response=NotifyTemplateServices.showEmailPhone(toDoList);  
			return response;   
		}  
	   
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEmailSection/{user}/{token}") 
	 public Response getEmailSection(
			 @PathParam("token") String token,
				@PathParam("user") String name) throws IOException 
		{ 
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response=NotifyTemplateServices.showEmail();  
			return response;  
		} 
	 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRecepientSection/{user}/{token}")
	 public Response getRecepientSection() throws IOException 
		{
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response= NotifyTemplateServices.showRecepient();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON) 
	@Path("/getChannelSection/{user}/{token}")
	 public Response getChannelSection() throws IOException 
		{
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response=NotifyTemplateServices.showChannel();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSignSection/{user}/{token}")
	 public Response getSignSection() throws IOException 
		{
		BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
		   response= NotifyTemplateServices.showSignature();
			return response; 
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getXmlValues/{user}/{token}") 
	public Response getXmlValues(	@QueryParam("Lists") String notifyTemplateId, 
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
			{
			
			BaseResponse<NotifyTemplate> br = new BaseResponse<NotifyTemplate>();
			response=NotifyTemplateServices.getXmlValues(notifyTemplateId); 
			return response; 
			   
			} 
	 
	@POST 
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNotifyTemplate/{user}/{token}")
	public Response addNotifyTemplate(NotifyTemplate templateList,
			@PathParam("token") String token, @PathParam("user") String name){		
		
		Integer recordCount= NotifyTemplateServices.addNotifyTemplate(templateList.getPartyID(), templateList.getNotifyTypeID(),
				templateList.getName(), templateList.getDescription(), templateList.getEventid(), templateList.getNotifyTargetID(),
				templateList.getDeliveryChannelID(), templateList.getUseSignatureID(), templateList.getisActive(), templateList.getisAddDND(),
				templateList.getisAddDiscl(), templateList.getTemplate(), templateList.getFileName(), 
				templateList.getFileStoragePathURI(), templateList.getFileSizeKB(),templateList.getFileName1(),
				templateList.getFileStoragePathURI1(), templateList.getFileSizeKB1(), templateList.getFileName2(),
				templateList.getFileStoragePathURI2(), templateList.getFileSizeKB2(),templateList.getUserID());
		
		BaseResponse<Integer> br=new BaseResponse<>();  
		br.setResponseObject(recordCount);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null); 
		return response;   
	}
	   
	@POST 
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editNotifyTemplate/{user}/{token}")
	public Response editNotifyTemplate(NotifyTemplate templateList,
			@PathParam("token") String token, @PathParam("user") String name){		
		        
		Integer recordCount= NotifyTemplateServices.editNotifyTemplate(templateList.getNotifyTemplateID(), templateList.getName(), templateList.getDescription(),templateList.getTemplate(),
				templateList.getPartyID(), templateList.getSourceSystemID(), templateList.getNotifyTargetID(),templateList.getDeliveryChannelID(),templateList.getEventid(),templateList.getUseSignatureID(),templateList.getisAddDND(),
				templateList.getisAddDiscl(),templateList.getUserID()); 
		   
		BaseResponse<Integer> br=new BaseResponse<>();  
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null); 
		return response;   
	}  
	
	@POST 
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/importTemplate/{user}/{token}")
	public Response importTemplate(NotifyTemplate templateList,
			@PathParam("token") String token, @PathParam("user") String name){		
		        
		Integer recordCount= NotifyTemplateServices.importNotifyTemplate(templateList.getNotifyTemplateID(),templateList.getTemplate());
		BaseResponse<Integer> br=new BaseResponse<>();  
		br.setResponseObject(recordCount);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null); 
		return response;   
	}   
	
}
