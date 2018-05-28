package in.fiinfra.auth.service;

import in.fiinfra.auth.model.GetRequest;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;

public class UserService extends BasicService {
	
	
	public UserSession getUserByToken(String token, String ipAddress){
		return getService().getUserByToken(Services.getUserByToken, new GetRequest().param("token", token).param("ip", ipAddress) , new String[0]);
	}

}
