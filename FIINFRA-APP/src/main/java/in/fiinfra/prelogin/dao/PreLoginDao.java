package in.fiinfra.prelogin.dao;

import java.util.List;

import in.fiinfra.common.video.model.VideoDetailsJson;

public interface PreLoginDao 
{
	public List<VideoDetailsJson> preLoginUrlDetails(String BU);
}
