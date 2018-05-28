package in.fiinfra.serviceportal.facade;

import java.io.IOException;

import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.service.vo.QuerySp;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.serviceportal.service.QueryspService;

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
@Path("/querysp")
public class QueryspController extends MultiActionController 
{
	Response response;
	private static final Logger logger = Logger.getLogger(QueryspController.class);

	@Autowired
	QueryspService queryspservice;
	
	//QuerySpController queryspservice;
	private ObjectMapper objectMapper;
	
	
	
	
	
	
	
	public QueryspService getQueryspservice() {
		return queryspservice;
	}
	public void setQueryspservice(QueryspService queryspservice) {
		this.queryspservice = queryspservice;
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
	@Path("/getQueryList/{user}/{token}")
	 public Response getQueryList(@PathParam("token") String token,
				@PathParam("user") String name,
				QuerySp query)
	   {
		   BaseResponse<QuerySp> br = new BaseResponse<>();
	   response=queryspservice.getQueryList(query);
			return response;
	   }
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientList/{user}/{token}")
	public Response getClientList(	QuerySp query,
			@PathParam("token") String token, @PathParam("user") String name){		
		
		
	
		response = queryspservice.getClientList(query);
		return response;
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addQuery/{user}/{token}")
	public Response addQuery(QuerySp query,
			@PathParam("token") String token,
			@PathParam("user") String name	
			
			) throws IOException 
	{



BaseResponse<Integer> br = new BaseResponse<>();
   response=queryspservice.addQuery(query);
	return response;
	}
	
	

}
