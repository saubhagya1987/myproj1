package in.fiinfra.insurance.service;

import in.fiinfra.common.common.InsuranceData;

import java.util.List;

public interface InsuranceService {

	List<InsuranceData> getInsuranceForPartyId(InsuranceData insuranceData);

	Integer insertOrUpdateInsurance(InsuranceData insuranceData);

	List<InsuranceData> getInsuranceDetailList(Integer partyId,
			String insuranceTypeIds);

	InsuranceData getInsuranceDetails(Integer partyId, Integer partyInsuranceId);
	
	public boolean deleteInsuranceDetails(Integer partyId,Integer partyInsuranceId, Integer isAsset);

}
