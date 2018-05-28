package in.fiinfra.party.dao;

import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.Chek_BoxDetails;
import in.fiinfra.common.diy.models.Form_Details;
import in.fiinfra.common.diy.models.Form_Field_Details;
import in.fiinfra.common.diy.models.JobRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.Product_Mst;

import java.util.List;

public interface PartyDao {

	public Party getParty(Integer partyId);
	/////////////Add by anurag/////////////////////////
	public List<JobRequest> getBatchJobRequest(Integer partyId);
	public List<Product_Mst> getProduct_BatchJobReques(Integer productId);
	public List<Form_Details> getForm_Details(Integer Parm1);

	public List<Form_Field_Details> getForm_Field_Details(Integer form_id);
	
	public List<Chek_BoxDetails> getChek_Box_index(Integer Form_id,String Field_Name ,Integer Field_IND);

	public Chek_BoxDetails getChek_Box_indexff(Integer Form_id );

	
	//////////////////////////////////////////////////
	public List<Party> getFamilyDetailsForPartyId(Integer partyId);
	
	public List<Address> getAddressForParty(Integer partyId);
	
	public void updateparty(Party party);
	
	public void updateOrInsertAddress(Address address);
	
	public void updateOrInsertFamilyDetails(Party party);

	public void saveParty(Party party);
	
	public Boolean deleteParty(String listOfParty);
	

}
