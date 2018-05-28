package in.fiinfra.whatif.dao;

import in.fiinfra.common.diy.models.WhatIfData;

import java.util.List;

public interface WhatIfDao {
	
	public List<WhatIfData> getWhatIfData( Integer partyId );

	public Boolean saveWhatIfData(String whatIfXml);
}
