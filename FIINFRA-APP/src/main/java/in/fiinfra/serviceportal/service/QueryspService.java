package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.QuerySp;

import javax.ws.rs.core.Response;

public interface QueryspService 
{
	Response getQueryList(QuerySp query);

	Response getClientList(QuerySp query);

	Response addQuery(QuerySp query);

}
