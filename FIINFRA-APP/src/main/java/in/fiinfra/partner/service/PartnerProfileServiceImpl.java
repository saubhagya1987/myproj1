package in.fiinfra.partner.service;

import in.fiinfra.partner.dao.PartnerProfileRepo;
import in.fiinfra.common.common.PartnerProfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("partnerProfileService")
public class PartnerProfileServiceImpl implements PartnerProfileService {
	
	@Autowired PartnerProfileRepo partnerProfileRepo;
	
	public PartnerProfile load(int id){
		return partnerProfileRepo.load(id);
	}
	
	public List<PartnerProfile> getAll(){
		return partnerProfileRepo.getAll();
	}

	public PartnerProfile create(PartnerProfile contactProfile){
		return partnerProfileRepo.create(contactProfile);
	}
	
	public PartnerProfile update(PartnerProfile contactProfile){
		return partnerProfileRepo.create(contactProfile);
	}
	
	public PartnerProfile delete(int id){
		return partnerProfileRepo.delete(id);
	}
}
