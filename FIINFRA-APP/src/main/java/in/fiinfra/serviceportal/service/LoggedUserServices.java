package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.EmailSmsVo;
import in.fiinfra.common.service.vo.LoggedUser;
import in.fiinfra.common.service.vo.PrePrintedForm;

import javax.ws.rs.core.Response;

public interface LoggedUserServices {

	
	Response getloggedUser(LoggedUser loggedUser);

	Response getchartUser(String buId);

	Response getEmailSms(EmailSmsVo emailSmsVo);

	Response getEmailSmsChart(String buId);

	Response getPrePrintedFormList(PrePrintedForm preForm);

	Response getPrePrintedFormChart(PrePrintedForm preForm);

	Response deleteTask(String description, Integer lastModifiedBy);
}
