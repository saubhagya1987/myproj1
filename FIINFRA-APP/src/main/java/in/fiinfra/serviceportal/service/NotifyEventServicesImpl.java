package in.fiinfra.serviceportal.service;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.serviceportal.dao.NotifyEventDaoImpl;

public class NotifyEventServicesImpl implements NotifyEventServices {

	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	@Autowired
	private NotifyEventDaoImpl  notifyEventDao;

	public NotifyEventDaoImpl getNotifyEventDao() {
		return notifyEventDao;
	} 
  
	public void setNotifyEventDao(NotifyEventDaoImpl notifyEventDao) {
		this.notifyEventDao = notifyEventDao;
	}
 
	@Override
	public Response getNitifyEventList(NotifyEvent notifyEvent) {
		// TODO Auto-generated method stub 
		Response notifyEventList = notifyEventDao.getNitifyEventList(notifyEvent);
		return notifyEventList; 
	} 

	@Override
	public Response deleteNotifyEvent(String deletelist,int deleteuserId) {
		// TODO Auto-generated method stub
		Response deleteEvent=notifyEventDao.deleteNotifyEvent(deletelist, deleteuserId);
		return deleteEvent;
	}

	@Override 
	public Response showCategoryList() {
		// TODO Auto-generated method stub
		Response categoryList = notifyEventDao.showCategoryList();
		return categoryList;
	}

	@Override
	public Response showSystemList() {
		// TODO Auto-generated method stub
		Response systemList = notifyEventDao.showSystemList();
		return systemList; 
	}

	@Override
	public Response addNotifyEvent(String name, String description,
			int eventcategoryid, int sourcesystemid,int userId) {
		// TODO Auto-generated method stub
		Response result = null;
		result = notifyEventDao.addNotifyEvent(name, description, eventcategoryid, sourcesystemid,userId);
		return result;
	}

	@Override 
	public Response editNotifyEvent(int notifyeventid, String name,
			String description, int eventcategoryid, int sourcesystemid,int userId) {
		// TODO Auto-generated method stub
		Response result = null;
		result = notifyEventDao.editNotifyEvent(notifyeventid, name, description, eventcategoryid, sourcesystemid,userId);
		return result;
	} 
  
	  	
}
