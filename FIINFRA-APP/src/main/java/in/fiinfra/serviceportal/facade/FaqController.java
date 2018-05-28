package in.fiinfra.serviceportal.facade;
import  in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.serviceportal.service.AddFaqService;

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

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/faq")
public class FaqController extends MultiActionController {
	Response response;
	private static final Logger logger = Logger.getLogger(FaqController.class);
	@Autowired
	AddFaqService service;
	private ObjectMapper objectMapper;
	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}



	public AddFaqService getService() {
		return service;
	}
	public void setService(AddFaqService service) {
		this.service = service;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/listFaq/{user}/{token}")
	 public Response getLists(@PathParam("token") String token,
				@PathParam("user") String name,
				FaqList faqlist)
	   {
		   BaseResponse<FaqList> br = new BaseResponse<>();
		   response=service.allSearchFaq(faqlist);
			return response;
	   }
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/listFaqAdmin/{user}/{token}")
	 public Response listFaqAdmin(@PathParam("token") String token,
				@PathParam("user") String name,
				FaqList faqlist)
	   {
		   BaseResponse<FaqList> br = new BaseResponse<>();
		   response=service.allSearchFaqAdmin(faqlist);
			return response;
	   }
	
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/getBupartyname/{user}/{token}")
	 public Response getBupartyname(@PathParam("token") String token,
				@PathParam("user") String name	,	FaqList faqlist		) throws IOException 
		{
		BaseResponse<FaqList> br = new BaseResponse<>();
		   response=service.getbupartyNames(faqlist);
			return response;
} 
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addFaq/{user}/{token}")
	public Response  addFaq(FaqList faqList, 
			@PathParam("token") String token,
			@PathParam("user") String name			
			) throws IOException {
		
		BaseResponse<Integer> br = new BaseResponse<>();
		   response=service.addFaqQuery(faqList);
			return response;
		

	}
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateFaq/{user}/{token}")
	public Response  updateFaq(
			FaqList faqList,
			@PathParam("token") String token,
			@PathParam("user") String name	
			) throws IOException ,NumberFormatException
	{
		int result;
		

					
					BaseResponse<Integer> br = new BaseResponse<>();
					   response=service.updateFaqs(faqList);
						return response;

				}
	
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteFaq/{user}/{token}")
	public Response deleteFaq(	@QueryParam("Lists") String codetypeIds, 
			@PathParam("token") String token,
			@PathParam("user") String name	,FaqList faqlist) throws IOException 
{
BaseResponse<Integer> br = new BaseResponse<>();
response=service.deleteFaqs(faqlist);
	return response;
}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFaqDetail/{user}/{token}")
	public Response getFaqDetail(
			@PathParam("token") String token,
			@PathParam("user") String name	,FaqList faqlist) throws IOException 
{
BaseResponse<Integer> br = new BaseResponse<>();
response=service.getFaqDetail(faqlist.getDeleteFaq());
	return response;
}		
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPickListValue/{user}/{token}")
	public Response getPickListValue(	@QueryParam("Lists") String codetypeIds, 
			@PathParam("token") String token,
			@PathParam("user") String name	,FaqList faqlist) throws IOException 
{
BaseResponse<Integer> br = new BaseResponse<>();
response=service.getPickListValue(faqlist.getDeleteList());
	return response;
}			
	

	   	
}
