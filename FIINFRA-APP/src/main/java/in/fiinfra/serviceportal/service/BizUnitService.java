package in.fiinfra.serviceportal.service;


import in.fiinfra.common.service.vo.BizUnit;

import java.util.List;

import javax.ws.rs.core.Response;

public interface BizUnitService
{
	Response getBizUnitList( BizUnit bizunit);
	Response addBizUnit(BizUnit bizUnit);
	Response updateBizUnit(BizUnit bizUnit);
	 Response getBizUnitDeatil(int partyId);
	 Response deleteBizUnit(String partyId,int lastModifiedBy);
	 Response getStateList(int parentId);
	 Response addEmailBizUnit(int partyId,String emailId,String emailName,int createdBy);
	 Response addDndTemplate(int partyId,String dndTemplate,int createdBy);
	 Response addDisclaimer(int partyId,String disclaimer,int createdBy);
	 Response addEmailSignBiz(int partyId,String emailSign,int createdBy);
	 Response getWhiteLableDetail(int partyId);
	 Response copyBu(BizUnit bizunit);
	 Response getUniqueUser(String bizUnitName);
	 Response addSms(BizUnit bizunit);
	 Response updateBizUnitGeneral(BizUnit bizUnit);
	 /*List<BizUnit> getCountryList();
	
	List<BizUnit> getCityList(int stateId);
	
	
	int addBizUnit(String bizUnitName,String shortName,String companyName,String add1,String add2,String add3,int countryId,int stateId,int cityId,int zipCode, int createdBy);
   
    
    
   
    
    List<BizUnit>getColorList();
    int addOtherDetail(int partyId,int theme,String smsSign,String imagename,String filePathUrl,int fileSize);
    List<BizUnit> getWhiteLableDetail(int partyId); */

}
