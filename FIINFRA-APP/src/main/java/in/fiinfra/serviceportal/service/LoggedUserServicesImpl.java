package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.EmailSmsVo;
import in.fiinfra.common.service.vo.LoggedUser;
import in.fiinfra.common.service.vo.PrePrintedForm;
import in.fiinfra.serviceportal.dao.LoggedUserDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;




public class LoggedUserServicesImpl implements  LoggedUserServices {

	@Autowired
	private LoggedUserDao loggedUserDao;
	
	
	public LoggedUserDao getLoggedUserDao() {
		return loggedUserDao;
	}


	public void setLoggedUserDao(LoggedUserDao loggedUserDao) {
		this.loggedUserDao = loggedUserDao;
	}


	@Override
	public Response getloggedUser(LoggedUser loggedUser) {
		Response resp=loggedUserDao.getloggedUser(loggedUser);
		return resp;
	}


	@Override
	public Response getchartUser(String buId) {
		Response resp=loggedUserDao.getchartUser(buId);
		return resp;
	}


	@Override
	public Response getEmailSms(EmailSmsVo emailSmsVo) {
		Response resp=loggedUserDao.getEmailSms(emailSmsVo);
		return resp;
	}


	@Override
	public Response getEmailSmsChart(String buId) {
		Response resp=loggedUserDao.getEmailSmsChart(buId);
		return resp;
	}


	@Override
	public Response getPrePrintedFormList(PrePrintedForm preForm) {
		Response resp=loggedUserDao.getPrePrintedFormList(preForm);
		return resp;
		
	}


	@Override
	public Response getPrePrintedFormChart(PrePrintedForm preForm) {
		Response resp=loggedUserDao.getPrePrintedFormChart(preForm);
		return resp;
	}


	@Override
	public Response deleteTask(String description,Integer lastModifiedBy) {
		Response resp=loggedUserDao.deleteTask(description,lastModifiedBy);
		return resp;
	}
	
}
