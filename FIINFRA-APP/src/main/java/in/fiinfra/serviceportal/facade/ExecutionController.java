package in.fiinfra.serviceportal.facade;

import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.serviceportal.service.BizUnitService;
import in.fiinfra.serviceportal.service.SPExecutionService;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import javax.ws.rs.core.Response;

@Controller
@Path("/executionsp")
public class ExecutionController
{
	
	private ObjectMapper objectMapper;
	
	  @Autowired
	  SPExecutionService spexecutionService;
	  
	  Response response;
	  
	
	public SPExecutionService getSpexecutionService() {
		return spexecutionService;
	}



	public void setSpexecutionService(SPExecutionService spexecutionService) {
		this.spexecutionService = spexecutionService;
	}



	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}



	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}



	
	@POST 
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPrinprintedFormDetail/{user}/{token}") 
	public Response getPrinprintedFormDetail( 
			@PathParam("token") String token,
			@PathParam("user") String name,  @RequestBody ETPrePrintedFormData data	)
   {
		BaseResponse<ETPrePrintedFormData> br = new BaseResponse<ETPrePrintedFormData>(); 
		response =spexecutionService.getTrcakerDetail(data);   
 		return response;
	}

}
