package in.fiinfra.whatif.dao;

import in.fiinfra.common.diy.models.WhatIfData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("whatIfDao")
public class WhatIfDaoImpl implements WhatIfDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_WHAT_IF_DATA = "{CALL usp_DIY_getAssetSummaryForPartyId(?)}";
	private static final String SP_SAVE_WHAT_IF_DATA = "{CALL usp_DIY_saveAssetSummaryData(?)}";
	
	@Override
	public List<WhatIfData> getWhatIfData(Integer partyId) {
		
		return jdbcTemplate.query(SP_GET_WHAT_IF_DATA, new Object[] {partyId}, new BeanPropertyRowMapper<WhatIfData>(WhatIfData.class));
	}

	@Override
	public Boolean saveWhatIfData(String whatIfXml) {
		jdbcTemplate.update(SP_SAVE_WHAT_IF_DATA, new Object[]{whatIfXml});
		return true;
	}
}
