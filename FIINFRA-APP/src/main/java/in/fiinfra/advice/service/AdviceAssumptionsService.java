package in.fiinfra.advice.service;

import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.cp.Assumption;

import java.util.List;

public interface AdviceAssumptionsService
{	
	public List<AdviceAssumption> getAdvicesForPartyId( PartySettingInput partySettingInput );
	public boolean saveOrUpdateAdvicesForPartyId( List<AdviceAssumption> adviceAssumption );
	public boolean deleteAdviceAssumptionForPartyId( Integer partyId );
	public Boolean saveAssumptions(Integer partnerPartyId, Integer clientPartyId, Integer buId, List<AdviceAssumption> assumptions);
}
