package in.fiinfra.businesshealthindex.service;

import java.util.ArrayList;
import java.util.List;

import in.fiinfra.businesshealthindex.dao.BusinessHealthIndexDao;
import in.fiinfra.common.diy.models.BusinessHealthIndex;
import in.fiinfra.common.util.FiinfraUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("businessHealthIndexService")
public class BusinessHealthIndexServiceImpl implements BusinessHealthIndexService{

	@Autowired BusinessHealthIndexDao businessHealthIndexDao;

	@Override
	public List<BusinessHealthIndex> getBusinessHealthIndexQuestionnaire(Integer partyId) {
		List<BusinessHealthIndex> businessHealthIndexList=new ArrayList<BusinessHealthIndex>();
		businessHealthIndexList=businessHealthIndexDao.getBusinessHealthIndexQuestionnaire(partyId);
		return businessHealthIndexList;
	}
	
	@Override
	public String getIFAClassification(Integer partyId) {
		String IFAClass = "";
		IFAClass=businessHealthIndexDao.getIFAClassification(partyId);
		return IFAClass;
	}
	
	@Override
	public Boolean saveBusinessHealthIndexQuestionnaire(List<BusinessHealthIndex> businessHealthIndexList) {
		
		if( !businessHealthIndexList.isEmpty() ) {
			Integer partyId = businessHealthIndexList.get(0).getPartyId();
			Integer qBankId = businessHealthIndexList.get(0).getQBankId();
			String businessHealthIndexXml = FiinfraUtility.getBusinessHealthIndexXML(businessHealthIndexList);
			businessHealthIndexDao.saveBusinessHealthIndexQuestionnaire(partyId,qBankId,businessHealthIndexXml);
		}
		return true;
	}
	
}
