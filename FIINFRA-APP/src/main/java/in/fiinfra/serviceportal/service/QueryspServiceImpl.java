package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.QuerySp;
import in.fiinfra.serviceportal.dao.QueryspDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class QueryspServiceImpl implements QueryspService 
{

	@Autowired
	private QueryspDao queryspDao;

	
	
	
	
	


	public QueryspDao getQueryspDao() {
		return queryspDao;
	}








	public void setQueryspDao(QueryspDao queryspDao) {
		this.queryspDao = queryspDao;
	}








	@Override
	public Response getQueryList(QuerySp query) {
		
		Response queryList=queryspDao.getQueryList(query);
		   return queryList;
	}








	@Override
	public Response getClientList(QuerySp query) {
		Response queryList=queryspDao.getClientList(query);
		   return queryList;
	}








	@Override
	public Response addQuery(QuerySp query) {
		Response count=queryspDao.addQuery(query);
		   return count;
	}

}
