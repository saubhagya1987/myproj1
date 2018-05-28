package in.fiinfra.party.service;

import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.util.JsonData;

import java.util.List;

public interface PartyService 
{
	public List<PartySearchCriteria> getAllPartiesForAdvisor(Integer ownerPartyId);

	public List<PartySearchCriteria> getAllPartiesForSearchCriteria(PartySearchCriteria partySearchCriteria,String nodeId);
	
	public Party getParty(Integer partyId);
	
	public void updatePartyDetails(Party party);
	
	public Integer saveParty(Party party);
	
	public Boolean deleteParty(String listOfParty);
	
	public List<JsonData> getFamilyMembers( Integer partyId, Integer recordTypeId );
	
	public void updatepartyForContact(Party party);
	
	public Boolean activateDCT(String listOfParty,Integer userId);
	
	public String getValidatePanNumber( String panNo,Integer partyId );
	
	public List<PartySearchCriteria> getAutoPlanClients(PartySearchCriteria partySearchCriteria);
	
	public Integer deleteFamilyMemmberForPArtyId(Integer partyId,Integer familyPartyId);
	
	public Boolean insertEntryForXray(Integer partyId,Integer userId);
	public Boolean updatePartyAttributeForPartyId(
			List<PartyAttribute> partyAttributes,Integer partyId);

	public List<PartyAttribute> getPartyAttributeForPartyId(Integer partyId,String attributeCodeIds);
	
	
}
