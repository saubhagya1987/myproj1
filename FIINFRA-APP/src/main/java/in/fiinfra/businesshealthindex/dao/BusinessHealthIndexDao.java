package in.fiinfra.businesshealthindex.dao;

import in.fiinfra.common.diy.models.BusinessHealthIndex;

import java.util.List;

public interface BusinessHealthIndexDao {

	public List<BusinessHealthIndex> getBusinessHealthIndexQuestionnaire(Integer partyId);
	
	public String getIFAClassification(Integer partyId);
	
	public Boolean saveBusinessHealthIndexQuestionnaire(Integer partyId, Integer qBankId, String businessHealthIndexXml);
	
}
