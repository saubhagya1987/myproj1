package in.fiinfra.serviceportal.service;



import in.fiinfra.common.service.vo.Setting;
import in.fiinfra.serviceportal.dao.SettingDao;

import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingDao settingDao;
	

	public SettingDao getSettingDao() {
		return settingDao;
	}


	public void setSettingDao(SettingDao settingDao) {
		this.settingDao = settingDao;
	}


	@Override
	public Response getSettingList(int partyId) {
	//	System.out.println("bajirao");
	//	System.out.println(partyId);
		Response list=settingDao.getSettingList(partyId);
		return list;
	}

	@Override
	public Response addSetting(Setting setting) 
	{
		Response list=settingDao.addSetting(setting);
		return list;
	}


	@Override
	public Response deleteSetting(String List,int lastModifiedBy) {
		Response list=settingDao.deleteSetting(List,lastModifiedBy);
		return list;
	}


	@Override
	public Response getSettingDetail(int party, int partySettingId) {
		
		Response list=settingDao.getSettingDetail(party,partySettingId);
		return list;
	
	}


	@Override
	public Response updateSetting(Setting setting) {
		Response list=settingDao.updateSetting(setting);
				
				
		return list;
	}


	@Override
	public Response getUniqueSetting(Setting setting) {
		Response list=settingDao.getUniqueSetting(setting);
		return list;
		
	}
}
