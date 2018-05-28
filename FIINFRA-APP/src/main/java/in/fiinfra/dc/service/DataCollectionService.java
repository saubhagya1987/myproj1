package in.fiinfra.dc.service;

import java.util.List;

import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.KeyValue;

public interface DataCollectionService {
	public Boolean createFpPlan(Integer partyid);

	public Boolean saveOrUpdateDcInputData(List<DcInputData> dcInputDataList);

	public List<DcInputData> getDcInputData(Integer partyId,
			List<Integer> atributesIds);

	public List<KeyValue> getRelationshipIdForPartyId(Integer partyId);
	
	public Boolean updateFpPlanActivityTracker(Integer currentStatus, Integer partyId);
}
