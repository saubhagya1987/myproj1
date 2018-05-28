package in.fiinfra.partner.service;

import in.fiinfra.common.common.PartnerProfile;

import java.util.List;

public interface PartnerProfileService {

	public PartnerProfile load(int id);	
	
	public List<PartnerProfile> getAll();

	public PartnerProfile create(PartnerProfile contactProfile);
	
	public PartnerProfile update(PartnerProfile contactProfile);
	
	public PartnerProfile delete(int id);
}
