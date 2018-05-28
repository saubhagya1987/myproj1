package in.fiinfra.party.service;

import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.Chek_BoxDetails;
import in.fiinfra.common.diy.models.Form_Details;
import in.fiinfra.common.diy.models.Form_Field_Details;
import in.fiinfra.common.diy.models.JobRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.diy.models.Product_Mst;
import in.fiinfra.party.dao.PartyDao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("partyService")
public class PartyServiceImpl implements PartyService 
{
	@Autowired
	PartyDao partyDao;

	//return party for party Id
	@Override
	public List<PartySearchCriteria> getAllPartiesForAdvisor(Integer ownerPartyId) 
	{
		//return partyDao.getAllPartiesForAdvisor(ownerPartyId);
		PartySearchCriteria partySearchCriteria = new PartySearchCriteria();
		partySearchCriteria.setOwnerPartyId(ownerPartyId);
		return null;
	}

	//return party for search criteria	
	@Override
	public List<PartySearchCriteria> getAllPartiesForSearchCriteria(
			PartySearchCriteria partySearchCriteria)
	{
		return null;
	}

	//delete party(disable party isActive=0)
	@Override
	public Boolean deleteParty(String listOfParty)
	{
		return partyDao.deleteParty(listOfParty);
	}

	@Override
	public Party getParty(Integer partyId) 
	{
		Party party = partyDao.getParty(partyId);
		
		if(party!=null)
		{
			party.setAssociatedParties(partyDao.getFamilyDetailsForPartyId(partyId));
			party.setAddressList(partyDao.getAddressForParty(partyId));
		}
		return party;
	}

	

	@Override
	public void updatePartyDetails(Party party) 
	{
		
		//update party DETAILS
		partyDao.updateparty(party);
		
		//update or insert address for party
		if(CollectionUtils.isNotEmpty(party.getAddressList()))
		{
			for (Address address : party.getAddressList()) 
			{
				partyDao.updateOrInsertAddress(address);
			}
			
		}
		//update or insert family details for party
		if(CollectionUtils.isNotEmpty(party.getAssociatedParties()))								
		{
			for (Party familyMember : party.getAssociatedParties()) 
			{
				partyDao.updateOrInsertFamilyDetails(familyMember);
			}
			
		}
		
	}

	@Override
	public void saveParty(Party party) 
	{
		partyDao.saveParty(party);
	}

	
	@Override
	public List<JobRequest> getBatchJobRequest(Integer partyId) {
		List<JobRequest> JobRequest = partyDao.getBatchJobRequest(partyId);

		return JobRequest;
	}

	@Override
	public List<Product_Mst> getProduct_BatchJobReques(Integer productId) {
		List<Product_Mst> Product_Mst = partyDao.getProduct_BatchJobReques(productId);

		return Product_Mst;
	}

	@Override
	public List<Form_Details> getForm_Details(Integer Parm1) {
		List<Form_Details> Form_Details = partyDao.getForm_Details(Parm1);

		return Form_Details;
	}

	@Override
	public List<Form_Field_Details> getForm_Field_Details(Integer form_id) {
		List<Form_Field_Details> Form_field_details = partyDao.getForm_Field_Details(form_id);

		return Form_field_details;
		
	}

	@Override
	public List<Chek_BoxDetails> getChek_Box_index(Integer Form_id,String Field_Name ,Integer Field_IND) {
		
		List<Chek_BoxDetails> Chek_BoxDetails = partyDao.getChek_Box_index(Form_id,Field_Name,Field_IND);

		return Chek_BoxDetails;
		
	}

	@Override
	public Chek_BoxDetails getChek_Box_indexff(Integer Form_id) {
		
		Chek_BoxDetails Chek_BoxDetails =partyDao.getChek_Box_indexff(Form_id);
		
		return Chek_BoxDetails;
	}

	

	
	
	

}
