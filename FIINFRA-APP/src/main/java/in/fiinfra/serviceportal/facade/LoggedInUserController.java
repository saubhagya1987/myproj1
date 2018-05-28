package in.fiinfra.serviceportal.facade;

import java.io.IOException;

import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.service.vo.EmailSmsVo;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.LoggedUser;
import in.fiinfra.common.service.vo.PrePrintedForm;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.serviceportal.service.LoggedUserServices;
import in.fiinfra.serviceportal.service.TestimonialServices;

import javax.ws.rs.Consumes;
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

@Controller
@Path("/loggedinuser")
public class LoggedInUserController {


	Response response;
	String url;
	@Autowired
	LoggedUserServices loggedUserServices;
	private ObjectMapper objectMapper;	

	
	public LoggedUserServices getLoggedUserServices() {
		return loggedUserServices;
	}
	public void setLoggedUserServices(LoggedUserServices loggedUserServices) {
		this.loggedUserServices = loggedUserServices;
	}
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}


	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getListOfloggedUser/{user}/{token}")
	public Response getListOfloggedUser(@PathParam("token") String token,
			LoggedUser loggedUser)
	{
	
		 			//System.out.println("Naval Makwana");
					//BaseResponse<TestimonialData> br = new BaseResponse<>();
		response=loggedUserServices.getloggedUser(loggedUser);
		//System.out.println("Naval  Makwana 2"+response);
		 return response;
			
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getchartUser/{user}/{token}")
	public Response getchartUser(@PathParam("token") String token,
			@QueryParam("buId") String buId)
	{
	
		 			//System.out.println("Naval Makwana");
					//BaseResponse<TestimonialData> br = new BaseResponse<>();
		response=loggedUserServices.getchartUser(buId);
		//System.out.println("NAval  makwana 2"+response);
		 return response;
			
	}
	
	
	
	
	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getListOfEmailSms/{user}/{token}")
	public Response getListOfEmailSms(@PathParam("token") String token,
			EmailSmsVo emailSmsVo)
	{
	
		 			//System.out.println("Naval Makwana");
					//BaseResponse<TestimonialData> br = new BaseResponse<>();
		response=loggedUserServices.getEmailSms(emailSmsVo);
		//System.out.println("Naval  Makwana 2"+response);
		 return response;
			
	}
	

	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEmailSmsChart/{user}/{token}")
	public Response getEmailSmsChart(@PathParam("token") String token,
			@QueryParam("buId") String buId)
	{
	
		response=loggedUserServices.getEmailSmsChart(buId);
		//System.out.println("NAval  makwana 2"+response);
		 return response;
			
	}
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getPrePrintedFormList/{user}/{token}")
	 public Response getLists(@PathParam("token") String token,
				@PathParam("user") String name,
				PrePrintedForm preForm)
	   {
		   BaseResponse<FaqList> br = new BaseResponse<>();
		   response=loggedUserServices.getPrePrintedFormList(preForm);
			return response;
	   }
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getPrePrintedFormChart/{user}/{token}")
	 public Response getPrePrintedFormChart(@PathParam("token") String token,
				@PathParam("user") String name,
				PrePrintedForm preForm)
	   {
		   BaseResponse<FaqList> br = new BaseResponse<>();
		   response=loggedUserServices.getPrePrintedFormChart(preForm);
			return response;
	   }
	
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteTask/{user}/{token}")
	public Response deleteTask(	@QueryParam("Lists") String codetypeIds, 
			@PathParam("token") String token,
			@PathParam("user") String name	,Task task) throws IOException 
{
BaseResponse<Integer> br = new BaseResponse<>();
response=loggedUserServices.deleteTask(task.getDescription(),task.getCreatedBy());
	return response;
}
	
	
	
	
	
}
