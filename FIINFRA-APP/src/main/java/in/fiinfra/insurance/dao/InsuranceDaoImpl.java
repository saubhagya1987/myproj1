package in.fiinfra.insurance.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import in.fiinfra.common.common.InsuranceData;

@Repository("insuranceDao")
public class InsuranceDaoImpl implements InsuranceDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;	
	
	private static final String SP_INSURANCE_LIST_FOR_PARTYID = "{CALL usp_DIY_getInsuranceForPartyId(?,?)}";
	private static final String SP_SAVE_INSURANCE_DETAILS = "{CALL usp_DIY_saveInsuranceDetails(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_GET_INSURANCE_DETAIL_LIST = "{CALL usp_DIY_getInsuranceDetailsList(?,?)}";
	private static final String SP_GET_INSURANCE_DETAILS = "{CALL usp_DIY_getInsuranceDetails(?,?)}";
	private static final String SP_DELETE_INSURANCE_DETAILS = "{CALL usp_DIY_deleteInsuranceDetails(?,?,?)}";
	
	public void setDao(DataSource dataSource){
		jdbcTemplate = new JdbcTemplate(dataSource);		
	}
	
	@Override
	public List<InsuranceData> getInsuranceForPartyId(InsuranceData insuranceData) {
		return jdbcTemplate.query(SP_INSURANCE_LIST_FOR_PARTYID, new Object[]{insuranceData.getPartyID(), insuranceData.getInsuranceTypeIds()}, 
				new BeanPropertyRowMapper<InsuranceData>(InsuranceData.class));
	}

	@Override
	public Integer insertOrUpdateInsurance(InsuranceData insuranceData) {
		
		return jdbcTemplate.update(SP_SAVE_INSURANCE_DETAILS, new Object[]{insuranceData.getPartyInsuranceId(), insuranceData.getPartyID(), insuranceData.getInsuranceTypeID(), insuranceData.getInsuranceName(), insuranceData.getProductID(),
				insuranceData.getProductName(), insuranceData.getInsuranceCoverAmount(), insuranceData.getInsurancePaymentTerm(), insuranceData.getInsurancePremiumAmount(), 
				insuranceData.getInsurancePremiumPeriodTypeID(), insuranceData.getInsurancePremiumPeriodValue(), insuranceData.getBatchRunId(), insuranceData.getCurrentValue(), insuranceData.getInsurenceOwnerTypeId(), 
				insuranceData.getAssociatedFamilyPartyId(), insuranceData.getIndividualSumAssured(), insuranceData.getUserId(), insuranceData.getAssetTypeId(),insuranceData.getFamilyMembersName(),
				insuranceData.getFamilyType(),insuranceData.getAssetName(),insuranceData.getTenure(),insuranceData.getCommencementDate(),insuranceData.getMaturityDate(),insuranceData.getMaturityAmount(),insuranceData.getInsurancePolicyNumber()});
	}

	@Override
	public List<InsuranceData> getInsuranceDetailList(Integer partyId,
			String insuranceTypeIds) {
		return jdbcTemplate.query(SP_GET_INSURANCE_DETAIL_LIST, new Object[]{partyId, insuranceTypeIds}, 
				new BeanPropertyRowMapper<InsuranceData>(InsuranceData.class));
	}

	@Override
	public List<InsuranceData> getInsuranceDetails(Integer partyId,
			Integer partyInsuranceId) {
		return  jdbcTemplate.query(SP_GET_INSURANCE_DETAILS, new Object[]{partyId, partyInsuranceId}, 
				new BeanPropertyRowMapper<InsuranceData>(InsuranceData.class));
	}

	@Override
	public boolean deleteInsuranceDetails(Integer partyId, Integer partyInsuranceId, Integer isAsset) {
		jdbcTemplate.update(SP_DELETE_INSURANCE_DETAILS,new Object[] {partyId,partyInsuranceId,isAsset});
		return true;
	}

}
