package in.fiinfra.dc.dao;

import java.util.List;

import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.KeyValue;

public interface DataCollectionDao 
{
	public Boolean createFpPlan(Integer partyid);
	
	public Boolean saveOrUpdateDcInputData(DcInputData dcInputData); 
	
	public List<DcInputData> getDcInputData(Integer partyId, List<Integer> atributesIds);
	
	public List<KeyValue> getRelationshipIdForPartyId(Integer partyId);
	
	public Boolean updateFpPlanActivityTracker(Integer currentStatus, Integer partyId);
}
