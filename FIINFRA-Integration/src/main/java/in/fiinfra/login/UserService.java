package in.fiinfra.login;

import in.fiinfra.common.BasicService;
import in.fiinfra.common.Services;
import in.fiinfra.common.common.GetRequest;
import in.fiinfra.common.diy.models.UserSession;


public class UserService extends BasicService {
	
	
	public UserSession getUserByToken(int sourceSystemId, String userName, String token){
		return getService().getUserByToken(Services.getSessionUserByToken, new GetRequest().param("token", token).param("sourceSystemId", sourceSystemId).param("u", userName) , new String[0]);
	}

}
