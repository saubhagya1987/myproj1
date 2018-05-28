package in.fiinfra.party.dao;

import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.util.JsonData;

import java.util.List;



public interface PartyDao {

	public Party getParty(Integer partyId);
	
	public List<Party> getFamilyDetailsForPartyId(Integer partyId);
	
	public List<Address> getAddressForParty(Integer partyId);
	
	public void updateparty(Party party);
	
	public void updateOrInsertAddress(Address address, Integer createdBy);
	
	public void updateOrInsertFamilyDetails(Party party);

	public Integer saveParty(Party party);
	
	public List<PartySearchCriteria> getAllPartiesForSearchCriteria(PartySearchCriteria partySearchCriteria,String nodeId); 
	
	public Boolean deleteParty(String listOfParty);
	
	public List<PartyAttribute> getPartyAttributes(Integer partyId);
	
	public Boolean updatePartyAttributeForPartyId(String partyAttributeXML, Integer partyId);
	
	public List<JsonData> getFamilyMembers( Integer partyId, Integer recordTypeId );
	
	public void updatepartyForContact(Party party);
	
	public Boolean activateDCT(String listOfParty,Integer userId);
	
	public String getValidatePanNumber( String panNo,Integer partyId );
	
	public List<PartySearchCriteria> getAutoPlanClients(PartySearchCriteria partySearchCriteria);
	
	public Integer deleteFamilyMemmberForPArtyId(Integer partyId,Integer familyPartyId);
	
	public Boolean insertEntryForXray(Integer partyId,Integer userId);
	
	public List<PartyAttribute> getPartyAttributeForPartyId(Integer partyId,String attributeCodeIds);

	public Boolean updatePartyAttribute(String partyAttributeXML, Integer partyId);
	
	
}
