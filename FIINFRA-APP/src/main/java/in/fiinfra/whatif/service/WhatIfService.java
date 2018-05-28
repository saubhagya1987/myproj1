package in.fiinfra.whatif.service;

import in.fiinfra.common.diy.models.WhatIfData;

import java.util.List;

public interface WhatIfService {
	
	public List<WhatIfData> getWhatIfData( Integer partyId );

	public Boolean saveWhatIfData(List<WhatIfData> whatIfDataList);
}
