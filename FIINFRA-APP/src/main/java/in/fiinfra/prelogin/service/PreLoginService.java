package in.fiinfra.prelogin.service;

import java.util.List;

import in.fiinfra.common.video.model.VideoDetailsJson;


public interface PreLoginService
{
	public List<VideoDetailsJson> preLoginUrlDetails(String BU);

}
