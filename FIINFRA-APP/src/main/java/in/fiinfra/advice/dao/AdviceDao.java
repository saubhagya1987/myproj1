package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartySettingInput;

import java.util.List;

public interface AdviceDao
{
	
	public List<AdviceAssumption> getAdvicesForPartyId( PartySettingInput partySettingInput );	
	public boolean saveOrUpdateAdvicesForPartyId( AdviceAssumption adviceAssumption );
	public boolean deleteAdviceAssumptionForPartyId( Integer partyId );
	public Boolean saveAssumptions(Integer partnerPartyId, Integer clientPartyId, Integer buId, String assumtionXml);
}
