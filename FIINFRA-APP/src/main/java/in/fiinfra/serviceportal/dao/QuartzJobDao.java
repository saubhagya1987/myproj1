package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.QuartzJob;

import javax.ws.rs.core.Response;

public interface QuartzJobDao {
	public Response getquratzJobList(QuartzJob quartzJob);
	public Response getquratzJobUpdate(QuartzJob quartzJob);
	
}
