package in.fiinfra.profile.service;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.common.model.ProfileRequest;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;
import in.fiinfra.cp.common.util.AuthHandler;

import java.util.List;



public class ProfileService extends BasicService{
	
	public Party getProfile(ProfileRequest request) {
		UserSession user =  AuthHandler.getCurrentUser();
		Party party =  getService().getForObject(Services.getPartyProfile,request, Party.class, 
				new String[]{user.getUserName(),""+request.getPartyId(),user.getToken()});
		
		party.setDobAsString(CommonUtils.format(party.getDob(), "dd-MMM-YYYY"));
		if(party.getAssociatedParties() != null){
			for(Party p:party.getAssociatedParties()){
				p.setDobAsString(CommonUtils.format(p.getDob(), "dd-MMM-YYYY"));
			}
		}
		
		return party;
	}
	
	public Boolean saveProfile(Party party) {

		return getService().postForObject(Services.UPDATE_PARTY_INFO, party,
				Boolean.class, appendPathParam());
	}

	public Boolean createParty(Party party) {
		return getService().postForObject(Services.ADD_PARTY_INFO, party,
				Boolean.class, appendPathParam());
	}

	public List<CodeValueData> getCityList(ProfileRequest request){
		return getService().getForObjectCollection(Services.getCityList, request, CodeValueData.class, appendPathParam());
	}

	public Boolean deleteFamilyMember(int relatedPartyID) {
		UserSession user = AuthHandler.getCurrentUser();
		String[] pathParams = new String[]{user.getUserName(),""+relatedPartyID,user.getToken()};
				
		return getService().postForObject(Services.deleteFamilyMembers,relatedPartyID, Boolean.class,pathParams);
		
	}
	
	
	
	

}
