package in.fiinfra.partner.dao;

import in.fiinfra.common.common.PartnerProfile;

import java.util.List;

public interface PartnerProfileRepo {

	public PartnerProfile load(int id);	
	
	public List<PartnerProfile> getAll();

	public PartnerProfile create(PartnerProfile contactProfile);
	
	public PartnerProfile update(PartnerProfile contactProfile);
	
	public PartnerProfile delete(int id);
}
