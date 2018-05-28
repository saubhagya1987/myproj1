package in.fiinfra.serviceportal.service;


import in.fiinfra.common.service.vo.Setting;

import java.util.List;

import javax.ws.rs.core.Response;

public interface SettingService
{

	Response getSettingList(int partyId);
	Response deleteSetting(String List, int createdBy);
	Response addSetting(Setting setting);
	Response updateSetting(Setting setting);
	Response getSettingDetail(int party,int partySettingId);
	
	Response getUniqueSetting(Setting setting);
}
