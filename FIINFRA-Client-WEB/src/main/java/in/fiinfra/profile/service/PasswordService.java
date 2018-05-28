package in.fiinfra.profile.service;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.cp.common.model.ProfileRequest;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;

import java.util.List;



public class PasswordService extends BasicService{
	
	
	public List<PasswordPolicy> passwordPolicy(ProfileRequest request){
		return getService().getForObjectCollection(Services.changePassword, request, PasswordPolicy.class, new String[]{request.getUsername()});
	}
	
	public UserDetailsJson getUserDetailJson(ProfileRequest request){
		return getService().getWithoutResponseObject(Services.get_user_details, request, UserDetailsJson.class, new String[]{request.getUsername()});
	}
	
	
}
