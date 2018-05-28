package in.fiinfra.serviceportal.service;


import in.fiinfra.common.service.vo.QuartzJob;

import javax.ws.rs.core.Response;

public interface QuartzJobService {
	public Response getquratzJobList(QuartzJob quartzJob);
	public Response getquratzJobUpdate(QuartzJob quartzJob);
	

}
