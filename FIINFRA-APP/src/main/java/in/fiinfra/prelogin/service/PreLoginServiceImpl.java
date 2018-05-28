package in.fiinfra.prelogin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.fiinfra.common.video.model.VideoDetailsJson;
import in.fiinfra.prelogin.dao.PreLoginDao;


@Service("preLoginService")
public class PreLoginServiceImpl implements PreLoginService 
{
	@Autowired
	PreLoginDao videoDao;
	
	@Override
	public List<VideoDetailsJson> preLoginUrlDetails(String BU) 
	{
		return videoDao.preLoginUrlDetails(BU); 
	}

}
