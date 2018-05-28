package in.fiinfra.serviceportal.service;


import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.service.vo.AutoPing;

import javax.ws.rs.core.Response;

public interface AutoPingService {
   
	Response getAutoTopPingList();
	Response getEventAutoPingList();
	Response getSchAutoPingList();
	Response getAutoPingEditList(int notifyTemplateId,int buId);
	Response getSelectEventList(int selectSource);
	Response addAutoPing(AutoPing autoping);
	Response schAutoPing(AutoPing autoPing);
	Response getEventAutoPingEditList(int eventId);
	Response addAutoPingEvent(AutoPing autoPing);
	Response getEventAutoPingListForPartner(int partyId);
	Integer updateEventStatusAutoPingForPartner(int partyId, int eventId,
			String flag,int lastUpdatedBy);
	public Response getStandardAutoPingList(NotifyTemplateData notifyTemplateData);
	public Response getAddAutoPingTemp(NotifyTemplateData notifyTemplateData);
	
	

}
