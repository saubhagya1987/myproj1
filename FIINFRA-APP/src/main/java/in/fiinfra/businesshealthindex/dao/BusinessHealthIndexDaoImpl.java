package in.fiinfra.businesshealthindex.dao;

import in.fiinfra.common.diy.models.BusinessHealthIndex;
import in.fiinfra.common.util.CommonStoredProcedure;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("businessHealthIndexDao")
public class BusinessHealthIndexDaoImpl implements BusinessHealthIndexDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_BUSINESS_HEALTH_QUESTIONNAIRE = "{CALL usp_DIY_getBusinessHealthIndexQuestionnaire(?)}";
	
	private static final String SP_GET_IFA_CLASSIFICATION = "{CALL usp_DIY_getIFAClassification(?)}";
	
	private static final String SP_SAVE_BUSINESS_HEALTH_QUESTIONNAIRE = "{CALL usp_DIY_InsertOrUpdateBusinessHealthIndexQuestionnaire(?,?,?)}";
	
	@Override
	public List<BusinessHealthIndex> getBusinessHealthIndexQuestionnaire(Integer partyId) {
		
		return jdbcTemplate.query(SP_GET_BUSINESS_HEALTH_QUESTIONNAIRE, new Object[] {partyId}, new BeanPropertyRowMapper<BusinessHealthIndex>(BusinessHealthIndex.class));
	}
	
	@Override
	public String getIFAClassification(Integer partyId) {
		
		return jdbcTemplate.queryForObject(SP_GET_IFA_CLASSIFICATION, new Object[]{partyId},String.class);
	}

	@Override
	public Boolean saveBusinessHealthIndexQuestionnaire(Integer partyId, Integer qBankId, String businessHealthIndexXml) {
		jdbcTemplate.update(SP_SAVE_BUSINESS_HEALTH_QUESTIONNAIRE, new Object[] {partyId, qBankId, businessHealthIndexXml});
		return true;
	}
	
}
