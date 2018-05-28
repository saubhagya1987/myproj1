package in.fiinfra.insurance.service;

import in.fiinfra.common.common.InsuranceData;
import in.fiinfra.insurance.dao.InsuranceDao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("insuranceService")
public class InsuranceServiceImpl implements InsuranceService {
	
	@Autowired
	InsuranceDao insuranceDao;
	
	@Override
	public List<InsuranceData> getInsuranceForPartyId(
			InsuranceData insuranceData) {
			return insuranceDao.getInsuranceForPartyId(insuranceData);
	}

	@Override
	public Integer insertOrUpdateInsurance(InsuranceData insuranceData) {		
		return insuranceDao.insertOrUpdateInsurance(insuranceData);
	}

	@Override
	public List<InsuranceData> getInsuranceDetailList(Integer partyId,
			String insuranceTypeIds) {
		
		return insuranceDao.getInsuranceDetailList(partyId, insuranceTypeIds);
	}

	@Override
	public InsuranceData getInsuranceDetails(Integer partyId,
			Integer partyInsuranceId) {
		return insuranceDao.getInsuranceDetails(partyId, partyInsuranceId).get(0);
	}

	@Override
	public boolean deleteInsuranceDetails(Integer partyId, Integer partyInsuranceId, Integer isAsset) {
		
		insuranceDao.deleteInsuranceDetails(partyId,partyInsuranceId,isAsset);
		return true;
	}

}
