package in.fiinfra.serviceportal.dao;

import javax.ws.rs.core.Response;

import in.fiinfra.common.service.vo.QuerySp;

public interface QueryspDao
{
	Response getQueryList(QuerySp query);

	Response getClientList(QuerySp query);

	Response addQuery(QuerySp query);

}
