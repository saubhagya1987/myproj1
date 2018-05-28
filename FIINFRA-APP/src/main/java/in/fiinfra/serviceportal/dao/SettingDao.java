package in.fiinfra.serviceportal.dao;


import in.fiinfra.common.service.vo.Setting;

import java.util.List;

import javax.ws.rs.core.Response;

public interface SettingDao 
{
	Response getSettingList(int partyId);
	Response addSetting(Setting setting);
	Response deleteSetting(String List, int lastModifiedBy);
	Response getSettingDetail(int party,int partySettingId);
	Response updateSetting(Setting setting);
	Response getUniqueSetting(Setting setting);
}
