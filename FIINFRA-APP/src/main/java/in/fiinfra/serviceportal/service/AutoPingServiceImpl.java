package in.fiinfra.serviceportal.service;

import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.service.vo.AutoPing;
import in.fiinfra.serviceportal.dao.AutoPingDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class AutoPingServiceImpl implements AutoPingService {

	@Autowired
	AutoPingDao autopingDao;
	
	
	public AutoPingDao getAutopingDao() {
		return autopingDao;
	}


	public void setAutopingDao(AutoPingDao autopingDao) {
		this.autopingDao = autopingDao;
	}


	@Override
	public Response getAutoTopPingList() {
		// TODO Auto-generated method stub
		Response autopinglist=autopingDao.getAutoPingList();
		return autopinglist;
	}


	@Override
	public Response getSelectEventList(int selectSource) {
		// TODO Auto-generated method stub
		Response eventlist=autopingDao.getSelectEventList(selectSource);
		return eventlist;
	}


	@Override
	public Response addAutoPing(AutoPing autoping) {
		// TODO Auto-generated method stub
		Response addautoping=autopingDao.addAutoPing(autoping);
		return addautoping;
	}


	@Override
	public Response schAutoPing(AutoPing autoPing) {
		// TODO Auto-generated method stub
		Response schautoping=autopingDao.schAutoPing(autoPing);
		return schautoping;
	}


	@Override
	public Response getEventAutoPingList() {
		// TODO Auto-generated method stub
		Response eventList=autopingDao.getEventAutoPingList();
		return eventList;
	}


	@Override
	public Response getSchAutoPingList() {
		// TODO Auto-generated method stub
		Response schList=autopingDao.getSchAutoPingList();
		return schList;
	}


	@Override
	public Response addAutoPingEvent(AutoPing autoPing) {
		// TODO Auto-generated method stub
		Response addautopingevent=autopingDao.addAutoPingEvent(autoPing);
		return addautopingevent;
	}


	@Override
	public Response getEventAutoPingListForPartner(int partyId) {
		Response eventList=autopingDao.getEventAutoPingListForPartner(partyId);
		return eventList;
	}


	@Override
	public Integer updateEventStatusAutoPingForPartner(int partyId,
			int eventId, String flag,int lastUpdatedBy) {
		return autopingDao.updateEventStatusAutoPingForPartner(partyId,eventId,flag,lastUpdatedBy);
	}


	@Override
	public Response getEventAutoPingEditList(int eventId) {
		// TODO Auto-generated method stub
		Response eventlist=autopingDao.getEventAutoPingEditList(eventId);
		return eventlist;
	}


	@Override
	public Response getStandardAutoPingList(
			NotifyTemplateData notifyTemplateData) {
		// TODO Auto-generated method stub
		Response autopinglist=autopingDao.getStandardAutoPingList(notifyTemplateData);
		return autopinglist;
	}


	@Override
	public Response getAddAutoPingTemp(NotifyTemplateData notifyTemplateData) {
		// TODO Auto-generated method stub
		Response addtemplate=autopingDao.getAddAutoPingTemp(notifyTemplateData);
		return addtemplate;
	}


	@Override
	public Response getAutoPingEditList(int notifyTemplateId, int buId) {
		// TODO Auto-generated method stub
		Response eventlist=autopingDao.getAutoPingEditList(notifyTemplateId,buId);
		return eventlist;
	}

}
