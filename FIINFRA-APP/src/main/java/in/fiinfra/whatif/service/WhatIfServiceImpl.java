package in.fiinfra.whatif.service;

import in.fiinfra.common.diy.models.WhatIfData;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.whatif.dao.WhatIfDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("whatIfService")
public class WhatIfServiceImpl implements WhatIfService {
	
	@Autowired
	WhatIfDao whatIfDao;
	
	@Override
	public List<WhatIfData> getWhatIfData(Integer partyId) {
		
		return whatIfDao.getWhatIfData(partyId);
	}

	@Override
	public Boolean saveWhatIfData(List<WhatIfData> whatIfDataList) {
		String whatIfXml = FiinfraUtility.getWhatIfXml(whatIfDataList);
		return whatIfDao.saveWhatIfData(whatIfXml);
	}
}
