package in.fiinfra.partner.service;

import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.controller.AbstractController;
import in.fiinfra.common.service.Services;
import in.fiinfra.query.service.BasicService;

public class PartnerService extends BasicService {
	
	public ProfileData getProfile(BaseRequest request){
		ProfileData data = getService().getForObject(Services.getProfileRecord, request, ProfileData.class, appendPathParam());
		if(data != null){
			data.setDob(AbstractController.reFormatDate(data.getDob()));
		}
		return data;
	}

	public Integer saveProfile(ProfileData bean){
		return getService().postForObject(Services.updatePartnerProfile, bean, Integer.class, appendPathParam());
	}
	
	
}
