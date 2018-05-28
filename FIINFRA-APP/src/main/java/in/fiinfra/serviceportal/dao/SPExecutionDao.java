package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.partner.ETPrePrintedFormData;

import javax.ws.rs.core.Response;

public interface SPExecutionDao 
{
	Response	getTrcakerDetail(ETPrePrintedFormData data);

}
