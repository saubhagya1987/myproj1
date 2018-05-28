package in.fiinfra.advice.service;

import in.fiinfra.advice.dao.AdviceDao;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.PartySettingInput;
import in.fiinfra.common.util.FiinfraUtility;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adviceAssumptionsService")
public class AdviceAssumptionsServiceImpl implements AdviceAssumptionsService
{
	@Autowired
	AdviceDao adviceDao;
	
	@Override
	public List<AdviceAssumption> getAdvicesForPartyId(PartySettingInput partySettingInput) 
	{
		return adviceDao.getAdvicesForPartyId(partySettingInput);
	}

	@Override
	public boolean saveOrUpdateAdvicesForPartyId(List<AdviceAssumption> adviceAssumptions) 
	{
		if(CollectionUtils.isNotEmpty(adviceAssumptions))
		{
			for (AdviceAssumption adviceAssumption : adviceAssumptions) 
			{
				adviceDao.saveOrUpdateAdvicesForPartyId(adviceAssumption);
			}
			return true;
		}
		return true;
	}

	@Override
	public boolean deleteAdviceAssumptionForPartyId(Integer partyId) 
	{
		adviceDao.deleteAdviceAssumptionForPartyId(partyId);
		return true;
	}

	@Override
	public Boolean saveAssumptions(Integer partnerPartyId, Integer clientPartyId, Integer buId, List<AdviceAssumption> assumptions) {
		String assumtionXml = FiinfraUtility.getAssumptionsXml(assumptions);
		return adviceDao.saveAssumptions(partnerPartyId, clientPartyId, buId, assumtionXml);
	}
}
