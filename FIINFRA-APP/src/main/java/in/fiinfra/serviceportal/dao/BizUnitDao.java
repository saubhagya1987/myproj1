package in.fiinfra.serviceportal.dao;



import in.fiinfra.common.service.vo.BizUnit;

import java.util.List;

import javax.ws.rs.core.Response;

public interface BizUnitDao
{
	Response getBizUnitList(BizUnit bizunit);
	Response addBizUnit(BizUnit bizUnit);
	Response updateBizUnit(BizUnit bizUnit);
	 Response getBizUnitDeatil(int partyId);
	 Response deleteBizUnit(String partyId, int lastModifiedBy);
	 Response getStateList(int parentId);
	 Response addEmailBizUnit(int partyId,String emailId,String emailName,int createdBy);
	  Response addDndTemplate(int partyId,String dndTemplate,int createdBy);
	  Response addDisclaimer(int partyId,String disclaimer,int createdBy);
	  Response addEmailSignBiz(int partyId,String emailSign,int createdBy);
	  
	  Response addSms(BizUnit bizunit);
	  Response getWhiteLableDetail(int partyId);
	  Response copyBu(BizUnit bizunit);
	  Response getUniqueUser(String bizUnitName);
	  Response updateBizUnitGeneral(BizUnit biUnit);
	 
}
