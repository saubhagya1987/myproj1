package in.fiinfra.serviceportal.service;

import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.serviceportal.dao.AddFaqDao;
import in.fiinfra.serviceportal.dao.SPExecutionDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class SPExecutionServiceImpl implements SPExecutionService 
{

	
	@Autowired
	private SPExecutionDao spExecutionDao;
	
	public SPExecutionDao getSpExecutionDao() {
		return spExecutionDao;
	}

	public void setSpExecutionDao(SPExecutionDao spExecutionDao) {
		this.spExecutionDao = spExecutionDao;
	}

	@Override
	public Response getTrcakerDetail(ETPrePrintedFormData data) {
		Response data1=spExecutionDao.getTrcakerDetail(data);
		   return data1;
	}

}
