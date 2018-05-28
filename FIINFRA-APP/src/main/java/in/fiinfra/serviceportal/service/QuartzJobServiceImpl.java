package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.QuartzJob;
import in.fiinfra.serviceportal.dao.QuartzJobDao;
import javax.ws.rs.core.Response;
import org.springframework.beans.factory.annotation.Autowired;

public class QuartzJobServiceImpl implements QuartzJobService {

	@Autowired
	private QuartzJobDao quartzJobDao;

	public QuartzJobDao getQuartzJobDao() {
		return quartzJobDao;
	}

	public void setQuartzJobDao(QuartzJobDao quartzJobDao) {
		this.quartzJobDao = quartzJobDao;
	}

	@Override
	public Response getquratzJobList(QuartzJob quartzJob) {
		// TODO Auto-generated method stub
		Response result = quartzJobDao.getquratzJobList(quartzJob);
		return result;
	}

	@Override
	public Response getquratzJobUpdate(QuartzJob quartzJob) {
		// TODO Auto-generated method stub
		Response result = quartzJobDao.getquratzJobUpdate(quartzJob);
		return result;
	}
}
