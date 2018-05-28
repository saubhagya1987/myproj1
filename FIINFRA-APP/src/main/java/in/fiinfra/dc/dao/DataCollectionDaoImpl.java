package in.fiinfra.dc.dao;

import java.util.List;

import in.fiinfra.common.diy.models.DcInputData;
import in.fiinfra.common.diy.models.KeyValue;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("dataCollectionDao")
public class DataCollectionDaoImpl implements DataCollectionDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	private static final String SP_CREATE_FP_PLAN_FOR_PARTYID = "{CALL usp_DIY_insertFpPlan(?,?,?)}";
	private static final String SP_SAVE_OR_UPDATE_DATACOLLECTION_INPUT_DATA = "{CALL usp_DIY_insertOrUpdateDcInputData(?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_RETRIVE_DATACOLLECTION_INPUT_DATA = "{CALL usp_DIY_retrieveDcInputData(?,?)}";
	private static final String SP_GET_RELATIONSHIPID_FOR_PARTYID = "{CALL usp_DIY_getRelationshipIdForPartyId(?)}";
	private static final String SP_UPDATE_FP_PLAN_ACTIVITY_TRACKER = "{CALL usp_DIY_updateFpPlanActivityTracker(?,?)}";
	
	@Override
	public Boolean createFpPlan(Integer partyid) {
		// TODO need to replace with session variable
		Integer lastModifiedBy = 1;
		Integer createdBy = 1;
		jdbcTemplate.update(SP_CREATE_FP_PLAN_FOR_PARTYID, new Object[] {
				partyid, createdBy, lastModifiedBy });
		return true;
	}

	@Override
	public Boolean saveOrUpdateDcInputData(DcInputData dcInputData) {
		// TODO need to replace with session variable
		Integer lastModifiedBy = 1;
		Integer createdBy = 1;
		jdbcTemplate.update(
				SP_SAVE_OR_UPDATE_DATACOLLECTION_INPUT_DATA,
				new Object[] { dcInputData.getId(), dcInputData.getPartyId(),
						dcInputData.getFpPlanId(),
						dcInputData.getAttributeCodeId(),
						dcInputData.getAttributeValue(),
						dcInputData.getAttributeValueDataTypeId(),
						dcInputData.getAttributeReferenceValue(),
						dcInputData.getAttributeSequenceNo(), createdBy,
						lastModifiedBy });
		return true;
	}

	// GET DCInputData
	@Override
	public List<DcInputData> getDcInputData(Integer partyId,
			List<Integer> atributesIds) {
		StringBuilder attributes = new StringBuilder();
		// building string separated by ,
		if (CollectionUtils.isNotEmpty(atributesIds)) {
			for (int i = 0; i < atributesIds.size(); i++) {
				if (i == (atributesIds.size() - 1)) {
					attributes.append(atributesIds.get(i));
				} else {
					attributes.append(atributesIds.get(i) + ",");
				}
			}
		}
		//System.out.println(attributes);
		return jdbcTemplate.query(SP_RETRIVE_DATACOLLECTION_INPUT_DATA,
				new Object[] { partyId, attributes },
				new BeanPropertyRowMapper<DcInputData>(DcInputData.class));

	}

	@Override
	public List<KeyValue> getRelationshipIdForPartyId(Integer partyId) {
		return jdbcTemplate.query(SP_GET_RELATIONSHIPID_FOR_PARTYID,
				new Object[] { partyId }, new BeanPropertyRowMapper<KeyValue>(
						KeyValue.class));
	}

	@Override
	public Boolean updateFpPlanActivityTracker(Integer currentStatus,
			Integer partyId) 
	{
		jdbcTemplate.update(SP_UPDATE_FP_PLAN_ACTIVITY_TRACKER,new Object[] {currentStatus,partyId});
		return true;
	}
}
