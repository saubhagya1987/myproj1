package in.fiinfra.businesshealthindex.service;

import in.fiinfra.common.diy.models.BusinessHealthIndex;

import java.util.List;

public interface BusinessHealthIndexService {

	public List<BusinessHealthIndex> getBusinessHealthIndexQuestionnaire(Integer partyId);
	
	public String getIFAClassification(Integer partyId);
	
	public Boolean saveBusinessHealthIndexQuestionnaire(List<BusinessHealthIndex> businessHealthIndexList);
	
}
