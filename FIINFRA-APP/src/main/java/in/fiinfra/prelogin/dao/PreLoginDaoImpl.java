package in.fiinfra.prelogin.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import in.fiinfra.common.video.model.VideoDetailsJson;
import in.fiinfra.prelogin.mappers.VideoDetailsMapper;

@Repository("preLoginDao")
public class PreLoginDaoImpl implements PreLoginDao 
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	
 
	private static final String RETRIVE_PRE_LOGIN_URLS = "{CALL retrievePreLoginUrls(?)}";
	
	@Override
	public List<VideoDetailsJson> preLoginUrlDetails(String BU) 
	{
		List<VideoDetailsJson> videoDetailsJsons = jdbcTemplate.query(RETRIVE_PRE_LOGIN_URLS, new Object[] {BU}, new VideoDetailsMapper());
		if(CollectionUtils.isNotEmpty(videoDetailsJsons))
		{
			return videoDetailsJsons;
		}
		else
			return null;
	}

}
