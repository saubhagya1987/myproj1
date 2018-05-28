package in.fiinfra.serviceportal.service;

import in.fiinfra.common.partner.ETPrePrintedFormData;

import javax.ws.rs.core.Response;

public interface SPExecutionService 
{
  Response	getTrcakerDetail(ETPrePrintedFormData data);

}
