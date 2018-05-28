package in.fiinfra.common.facade;

import in.fiinfra.common.service.DocumentDataService;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.DocumentDataInsert;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


@Controller
@Path("/documentData")
public class DocumentDataController extends MultiActionController 
{
	Response response;
	private static final Logger logger = Logger.getLogger(DocumentDataController.class);
	
	@Autowired
	DocumentDataService documentDataService;
	private ObjectMapper objectMapper;
	public ObjectMapper getObjectMapper() 
	{
		return objectMapper;
	}
	
	public void setObjectMapper(ObjectMapper objectMapper) 
	{
		this.objectMapper = objectMapper;
	}



	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@Path("/insertorupdate/{user}/{token}")
	 public Response insertorupdate(@PathParam("token") String token,
				@PathParam("user") String name,DocumentDataInsert doc)
	   {
		   BaseResponse<FaqList> br = new BaseResponse<>();
		   response=documentDataService.insertorupdate(doc);
			return response;
	   }
	
	
}
