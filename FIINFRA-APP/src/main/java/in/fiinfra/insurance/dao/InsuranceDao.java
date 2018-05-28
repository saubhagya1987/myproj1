package in.fiinfra.insurance.dao;

import java.util.List;

import in.fiinfra.common.common.InsuranceData;

public interface InsuranceDao {

	List<InsuranceData> getInsuranceForPartyId(InsuranceData insuranceData);

	Integer insertOrUpdateInsurance(InsuranceData insuranceData);

	List<InsuranceData> getInsuranceDetailList(Integer partyId,
			String insuranceTypeIds);

	List<InsuranceData> getInsuranceDetails(Integer partyId, Integer partyInsuranceId);
	
	public boolean deleteInsuranceDetails(Integer partyId,Integer partyInsuranceId,Integer isAsset);

}
