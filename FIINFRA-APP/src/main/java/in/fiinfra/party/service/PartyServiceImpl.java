package in.fiinfra.party.service;

import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.party.dao.PartyDao;

import java.util.ArrayList;
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
		//return partyDao.getAllPartiesForSearchCriteria(partySearchCriteria);
		return null;
	}

	//return party for search criteria	
	@Override
	public List<PartySearchCriteria> getAllPartiesForSearchCriteria(
			PartySearchCriteria partySearchCriteria,String nodeId)
	{
		return partyDao.getAllPartiesForSearchCriteria(partySearchCriteria,nodeId);
	}
	
	@Override
	public List<PartySearchCriteria> getAutoPlanClients(
			PartySearchCriteria partySearchCriteria)
	{
		return partyDao.getAutoPlanClients(partySearchCriteria);
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
			party.setPartyAttributes(partyDao.getPartyAttributes(partyId));
			
			List<PartyAttribute> offerings = partyDao.getPartyAttributes(partyId);
			buildOfferings(party, offerings);
		}
		return party;
	}

	private void buildOfferings(Party party, List<PartyAttribute> offerings) {
		List<PartyAttribute> partyAttributes = new ArrayList<PartyAttribute>();
		
		boolean isPresent = false;
		
		for(int i=91007;i<=91015;i++){
			for(PartyAttribute partyAttribute : offerings){			
				Integer codeValue = null;
				if(partyAttribute.getAttributeCodeID() == i){
					try{
						if(partyAttribute.getAttributeValue() != null){
							codeValue = Integer.parseInt(((String)partyAttribute.getAttributeValue()).trim());
						}
					}catch(Exception e){
						
					}
					
					if(codeValue!=0 && codeValue!=1)					
					{
						partyAttribute.setAttributeValue(1);
					}
					
					if(codeValue == null){
						partyAttribute.setAttributeValue(0);
					}
						
					partyAttributes.add(partyAttribute);
					isPresent = true;
					break;
					
				}
			}
			
			if(!isPresent){
				PartyAttribute partyAttribute = new PartyAttribute();				
				partyAttribute.setAttributeCodeID(i);
				partyAttribute.setAttributeValue(0);
				partyAttributes.add(partyAttribute);				
			} 
			isPresent = false;
		}
		
		party.setPartyAttributes(partyAttributes);
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
				partyDao.updateOrInsertAddress(address, party.getCreatedBy());
			}
			
		}
		//update or insert family details for party
		if(CollectionUtils.isNotEmpty(party.getAssociatedParties()))								
		{
			for (Party familyMember : party.getAssociatedParties()) 
			{
				if(!familyMember.getLastName().equals(""))
					partyDao.updateOrInsertFamilyDetails(familyMember);
			}
			
		}
		
		if(CollectionUtils.isNotEmpty(party.getPartyAttributes()))
		{
			String partyAttributeXML = FiinfraUtility.getPartyAttributeXml(party.getPartyAttributes());
			partyDao.updatePartyAttributeForPartyId(partyAttributeXML,party.getId());
		}
		
	}

	@Override
	public Integer saveParty(Party party) 
	{
		return partyDao.saveParty(party);
	}

	@Override
	public List<JsonData> getFamilyMembers( Integer partyId, Integer recordTypeId ) {
		
		return partyDao.getFamilyMembers(partyId, recordTypeId);
	}
	
	@Override
	public void updatepartyForContact(Party party) {
		
		
		partyDao.updatepartyForContact(party);
		if(CollectionUtils.isNotEmpty(party.getAddressList()))
		{
			for (Address address : party.getAddressList()) 
			{
				partyDao.updateOrInsertAddress(address, party.getCreatedBy());
			}
			
		}
	}

	@Override
	public Boolean activateDCT(String listOfParty,Integer userId) {
		 
		return partyDao.activateDCT(listOfParty,userId);
	}

	@Override
	public String getValidatePanNumber(String panNo,Integer partyId) {
		
		String msg = partyDao.getValidatePanNumber(panNo,partyId);
		return msg;
	}

	@Override
	public Integer deleteFamilyMemmberForPArtyId(Integer partyId,
			Integer familyPartyId) {
		return partyDao.deleteFamilyMemmberForPArtyId(partyId, familyPartyId);
	}
	@Override
	public Boolean insertEntryForXray(Integer partyId,Integer userId)
	{
		return partyDao.insertEntryForXray(partyId,userId);
	} 
	
	@Override
	public Boolean updatePartyAttributeForPartyId(
			List<PartyAttribute> partyAttributes, Integer partyId) {
		String partyAttributeXML = FiinfraUtility.getPartyAttributeXml(partyAttributes);
		return partyDao.updatePartyAttribute(partyAttributeXML,partyId);
		
	}

	@Override
	public List<PartyAttribute> getPartyAttributeForPartyId(Integer partyId,String attributeCodeIds) {
		return partyDao.getPartyAttributeForPartyId(partyId,attributeCodeIds);

	}
	
}
