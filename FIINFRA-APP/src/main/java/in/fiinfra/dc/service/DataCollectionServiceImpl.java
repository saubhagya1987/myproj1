package in.fiinfra.dc.service;

import java.util.List;

import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.dc.dao.DataCollectionDao;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dataCollectionService")
public class DataCollectionServiceImpl implements DataCollectionService {
	
	@Autowired DataCollectionDao dataCollectionDao;

	@Override
	public Boolean createFpPlan(Integer partyid) {
		return dataCollectionDao.createFpPlan(partyid);
	}

	@Override
	public Boolean saveOrUpdateDcInputData(List<DcInputData> dcInputDataList) {
		if (CollectionUtils.isNotEmpty(dcInputDataList)) {
			for (DcInputData dcInputData : dcInputDataList) {
				dataCollectionDao.saveOrUpdateDcInputData(dcInputData);
			}
			return true;
		}
		return true;
	}

	@Override
	public List<DcInputData> getDcInputData(Integer partyId,
			List<Integer> atributesIds) {
		return dataCollectionDao.getDcInputData(partyId, atributesIds);
	}

	@Override
	public List<KeyValue> getRelationshipIdForPartyId(Integer partyId) {
		return dataCollectionDao.getRelationshipIdForPartyId(partyId);
	}

	@Override
	public Boolean updateFpPlanActivityTracker(Integer currentStatus,
			Integer partyId) 
	{
		return dataCollectionDao.updateFpPlanActivityTracker(currentStatus, partyId);
	}
}
