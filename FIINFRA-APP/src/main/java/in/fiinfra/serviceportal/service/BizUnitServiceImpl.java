package in.fiinfra.serviceportal.service;



import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.serviceportal.dao.BizUnitDao;

import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class BizUnitServiceImpl implements BizUnitService 
{


	@Autowired
	private BizUnitDao bizunitDao;
	
	public BizUnitDao getBizunitDao() {
		return bizunitDao;
	}

	public void setBizunitDao(BizUnitDao bizunitDao) {
		this.bizunitDao = bizunitDao;
	}

	@Override
	public Response getBizUnitList( BizUnit bizunit	) {
		Response bizList=bizunitDao.getBizUnitList(bizunit);
		   return bizList;
	}
	
	@Override
	public Response addBizUnit(BizUnit bizUnit) {
		Response cityList=bizunitDao.addBizUnit(bizUnit);
		   return cityList;
		   }
	@Override
	public Response updateBizUnit(BizUnit bizUnit) {
		Response count=bizunitDao.updateBizUnit(bizUnit);
		   return count;
		
	}
	
	@Override
	public Response getBizUnitDeatil(int partyId)
	{
		Response bizList=bizunitDao.getBizUnitDeatil(partyId);
		   return bizList;
	}
	@Override
	public Response deleteBizUnit(String partyId,int lastModifiedBy) {
		Response count=bizunitDao.deleteBizUnit(partyId,lastModifiedBy);
		   return count;
	}

	@Override
	public Response getStateList(int parentId) 
	{
		Response stateList=bizunitDao.getStateList(parentId);
		   return stateList;
	}

	
	@Override
	public Response addEmailBizUnit(int partyId, String emailId, String emailName,int createdBy) {
		Response count=bizunitDao.addEmailBizUnit(partyId, emailId, emailName,createdBy);
		   return count;
	}
	

	@Override
	public Response addDndTemplate(int partyId, String dndTemplate,int createdBy) {
		Response count=bizunitDao.addDndTemplate(partyId, dndTemplate,createdBy);
		   return count;
	}
	
	

	@Override
	public Response addDisclaimer(int partyId, String disclaimer,int createdBy) {
		Response count=bizunitDao.addDisclaimer(partyId, disclaimer,createdBy);
		   return count;
	}
	
	

	@Override
	public Response addEmailSignBiz(int partyId, String emailSign,int createdBy) {
		Response count=bizunitDao.addEmailSignBiz(partyId, emailSign,createdBy);
		   return count;
	}

	
	@Override
	public Response getWhiteLableDetail(int partyId) {
		Response detail= bizunitDao.getWhiteLableDetail(partyId);
		return detail;
	}

	@Override
	public Response copyBu(BizUnit bizunit) {
		Response count=bizunitDao.copyBu(bizunit);
		   return count;
	
	}

	@Override
	public Response getUniqueUser(String bizUnitName) {
		Response detail= bizunitDao.getUniqueUser(bizUnitName);
		return detail;
	}

	@Override
	public Response addSms(BizUnit bizunit) {
		Response detail= bizunitDao.addSms(bizunit);
		return detail;
	}

	@Override
	public Response updateBizUnitGeneral(BizUnit bizUnit) {
		Response count=bizunitDao.updateBizUnitGeneral(bizUnit);
		return count;
	}

	/*
	@Override
	public List<BizUnit> getCountryList() {
		 List<BizUnit>counrtryList=bizunitDao.getCountryList();
		   return counrtryList;
	}


	@Override
	public List<BizUnit> getCityList(int stateId) 
	{
		 List<BizUnit>cityList=bizunitDao.getCityList(stateId);
		   return cityList;
		
	}












	@Override
	public List<BizUnit> getColorList() {
		List<BizUnit> count=bizunitDao.getColorList();
		   return count;
	}

	@Override
	public int addOtherDetail(int partyId, int theme, String smsSign,
			String imagename, String filePathUrl, int fileSize) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BizUnit> getWhiteLableDetail(int partyId) {
		List<BizUnit> detail= bizunitDao.getWhiteLableDetail(partyId);
		return detail;
	}
*/
}
