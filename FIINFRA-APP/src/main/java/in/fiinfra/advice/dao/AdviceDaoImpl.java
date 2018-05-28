package in.fiinfra.advice.dao;

import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartySettingInput;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("adviceDao")
public class AdviceDaoImpl implements AdviceDao
{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_ADVICES_FOR_PARTYID = "{CALL usp_DIY_getAdviceAssumptionsForPartyId(?,?,?,?)}";
	private static final String SP_SAVE_ADVICES_ASSUMPTIONS = "{CALL usp_DIY_insertOrUpdateAdviceAssumptions(?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_DELETE_ADVICE_ASSUMPTION_FOR_PARTYID = "{CALL usp_DIY_deleteAdviceAssumptionForPartyId(?)}";
	private static final String SP_INSERT_ASSUMTIONS_FOR_CLIENT = "{CALL usp_DIY_insertOrUpdateAssumptionsForClient(?,?,?,?)}";

	@Override
	public List<AdviceAssumption> getAdvicesForPartyId( PartySettingInput partySettingInput ) {
		return jdbcTemplate.query(SP_GET_ADVICES_FOR_PARTYID, new Object[] {partySettingInput.getClientPartyId(), partySettingInput.getPartnerPartyId(),
					partySettingInput.getBuPartyId(), partySettingInput.getAssumptionCodeIds()}, new BeanPropertyRowMapper<AdviceAssumption>(AdviceAssumption.class));
	}

	@Override
	public boolean saveOrUpdateAdvicesForPartyId( AdviceAssumption adviceAssumption ) {
		jdbcTemplate.update(SP_SAVE_ADVICES_ASSUMPTIONS, new Object[] {adviceAssumption.getId(),adviceAssumption.getRecordTypeId(),adviceAssumption.getPartyId(),adviceAssumption.getAssumptionCodeId(),
				adviceAssumption.getAssumptionValue(),adviceAssumption.getValueDataTypeId(),adviceAssumption.getValueStartRange(),adviceAssumption.getValueEndRange(),
				adviceAssumption.getDisplayLabel(),adviceAssumption.getCreatedBy(),adviceAssumption.getLastModifiedBy()});
		return true;
	}

	@Override
	public boolean deleteAdviceAssumptionForPartyId(Integer partyId) {
		
		jdbcTemplate.update(SP_DELETE_ADVICE_ASSUMPTION_FOR_PARTYID, new Object[] {partyId});
		return true;
	}

	@Override
	public Boolean saveAssumptions(Integer partnerPartyId, Integer clientPartyId, Integer buId, String assumtionXml) {
			jdbcTemplate.update(SP_INSERT_ASSUMTIONS_FOR_CLIENT, new Object[]{buId, partnerPartyId, clientPartyId,assumtionXml}); 
			return true;
	}
}
