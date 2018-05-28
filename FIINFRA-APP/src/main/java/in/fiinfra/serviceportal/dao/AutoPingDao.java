package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.service.vo.AutoPing;

import javax.ws.rs.core.Response;

public interface AutoPingDao {

	Response getAutoPingList();
	Response getEventAutoPingList();
	Response getSchAutoPingList();
	Response getSelectEventList(int selectSource);
	Response addAutoPing(AutoPing autoping);
	Response schAutoPing(AutoPing autoPing);
	Response addAutoPingEvent(AutoPing autoPing);
	Response getEventAutoPingEditList(int eventId);
	Response getEventAutoPingListForPartner(int partyId);
	Integer updateEventStatusAutoPingForPartner(int partyId, int eventId,
			String flag,int lastUpdatedBy);
	public Response getStandardAutoPingList(NotifyTemplateData notifyTemplateData);
	public Response getAddAutoPingTemp(NotifyTemplateData notifyTemplateData);
	Response getAutoPingEditList(int notifyTemplateId,int buId);
}
