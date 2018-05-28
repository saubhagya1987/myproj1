package in.fiinfra.serviceportal.facade;

import in.fiinfra.common.service.vo.QuartzJob;
import in.fiinfra.serviceportal.service.QuartzJobService;

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
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/quartzjob")
public class QuartzJobController extends MultiActionController {
	Response response;

	private ObjectMapper objectMapper;

	@Autowired
	QuartzJobService quartzJobService;

	public QuartzJobService getQuartzJobService() {
		return quartzJobService;
	}

	public void setQuartzJobService(QuartzJobService quartzJobService) {
		this.quartzJobService = quartzJobService;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/quratzJobList/{username}/{token}")
	public Response quratzJobList(@PathParam("username") String userName,
			@PathParam("token") String token, @RequestBody QuartzJob quartzJob) {
		Response response = null;
		response = quartzJobService.getquratzJobList(quartzJob);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/quratzJobUpdate/{username}/{token}")
	public Response quratzJobUpdate(@PathParam("username") String userName,
			@PathParam("token") String token, @RequestBody QuartzJob quartzJob) {
		Response response = null;
		response = quartzJobService.getquratzJobUpdate(quartzJob);
		return response;
	}

}
