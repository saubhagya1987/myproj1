package in.fiinfra.party.dao;

import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PartyKeyValue;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.JsonData;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;



@Repository("partyDao")
public class PartyDaoImpl implements PartyDao {

	private static final String SP_RETRIVE_SEARCH_PARTIES_FOR_SEARCH_CRITERIA = "{CALL usp_DIY_getPartyForSearchCriteria(?,?,?,?,?,?)}";
	private static final String SP_RETRIVE_PARTIY_DETAILS_FOR_PARTY_ID = "{CALL usp_DIY_getPartyForPartyId(?)}";
	private static final String SP_RETRIVE_FAMILY_DETAILS_FOR_PARTY_ID="{CALL usp_DIY_getFamilyDetailsForPartyId(?)}";
	private static final String SP_RETRIVE_ADDRESS_FOR_PARTY_ID = "{CALL usp_DIY_getAddressForPartyId(?)}";
	private static final String SP_UPDATE_OR_INSERT_FAMILY_DETAILS = "{CALL usp_DIY_insertOrUpdateFamilyDetails(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_UPDATE_OR_INSERT_ADDRESS_FOR_PARTY_ID = "{CALL usp_DIY_insertOrUpdateAddress(?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_UPDATE_PARTY_FOR_PARTID = "{CALL usp_DIY_updatePartyDetails(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_SAVE_PARTY = "{CALL usp_DIY_insertParty(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_DELETE_PARTY = "{CALL usp_DIY_deletePartyForPartyId(?)}";
	private static final String SP_RETRIVE_PARTYATTRIBUTE_FOR_PARTYID = "{CALL usp_DIY_getPartyAttributeForPartyId(?)}";
	private static final String SP_UPDATE_PARTYATTRIBUTE_FOR_PARTYID = "{CALL usp_DIY_updatePartyAttributeForPartyId(?,?)}";
	private static final String SP_GET_FAMILY_DETAILS = "{CALL usp_DIY_getFamilyDetails(?,?)}";
	private static final String SP_UPDATE_PARTY_FOR_CONTACT = "{CALL usp_DIY_updatePartyDetailsForContact(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_ACTIVATE_DCT_FOR_PARTYID = "{CALL usp_DIY_activateDCTForPartyId(?,?)}";
	private static final String SP_GET_AUTOPLAN_PARTIES = "{CALL usp_DIY_getAutoPlanParties(?,?,?,?,?)}";
	private static final String SP_DELETE_FAMILY_MEMBER_FOR_PARTYID = "{usp_DIY_deleteFamilyMemberForPartyId}";
	private static final String SP_INSERTENTRYFOR_XRAY = "{CALL usp_DIY_insertEntryForXray(?,?)}";
	private static final String SP_GET_PARTY_ATTRIBUTE = "{CALL usp_DIY_getPartyAttributes(?,?)}";
	private static final String SP_SAVE_PARTY_ATTRIBUTE = "{CALL usp_DIY_updatePartyAttribute(?,?)}";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;	
	
	public void setDao(DataSource dataSource){
		jdbcTemplate = new JdbcTemplate(dataSource);		
	}
	
	@Override
	public List<PartySearchCriteria> getAllPartiesForSearchCriteria(
			PartySearchCriteria partySearchCriteria,String nodeId) 
	{
		List<PartyKeyValue> partyKeyValues = partySearchCriteria.getPartySearchList();
		
		/*Integer statusId=null;
		Integer recordTypeId=null;
		Integer sourceTypeId=null;
		
		
		if(CollectionUtils.isNotEmpty(partyKeyValues))
		{
			for (PartyKeyValue partyKeyValue : partyKeyValues) 
			{
				if(partyKeyValue.getPartySearch() == PartySearchCriteriaEnum.STATUS)
				{
					statusId=partyKeyValue.getId();
				}
				else if(partyKeyValue.getPartySearch() == PartySearchCriteriaEnum.SOURCE)
				{
					sourceTypeId = partyKeyValue.getId();
				}
				else if(partyKeyValue.getPartySearch() == PartySearchCriteriaEnum.TYPE)
				{
					sourceTypeId = partyKeyValue.getId();
				}
			}
		}
		*/	
			
		return jdbcTemplate.query(SP_RETRIVE_SEARCH_PARTIES_FOR_SEARCH_CRITERIA, new Object[]{partySearchCriteria.getOwnerPartyId(),partySearchCriteria.getGenericSearch(),partySearchCriteria.getOpportunityStatusID(),partySearchCriteria.getContactSourceTypeID(),partySearchCriteria.getRecordTypeID(),nodeId}, 
					new BeanPropertyRowMapper<PartySearchCriteria>(PartySearchCriteria.class));
			
	}

	@Override
	public Party getParty(Integer partyId){
		return jdbcTemplate.queryForObject(SP_RETRIVE_PARTIY_DETAILS_FOR_PARTY_ID, new Object[]{partyId}, 
				new BeanPropertyRowMapper<Party>(Party.class));
	}

	@Override
	public List<Party> getFamilyDetailsForPartyId(Integer partyId) 
	{
		return jdbcTemplate.query(SP_RETRIVE_FAMILY_DETAILS_FOR_PARTY_ID, new Object[]{partyId}, new BeanPropertyRowMapper<Party>(Party.class));
	}

	@Override
	public List<Address> getAddressForParty(Integer partyId) 
	{
		return jdbcTemplate.query(SP_RETRIVE_ADDRESS_FOR_PARTY_ID, new Object[]{partyId}, new BeanPropertyRowMapper<Address>(Address.class));
	}

	@Override
	public List<PartyAttribute> getPartyAttributes(Integer partyId) 
	{
		return jdbcTemplate.query(SP_RETRIVE_PARTYATTRIBUTE_FOR_PARTYID, new Object[] {partyId}, new BeanPropertyRowMapper<PartyAttribute>(PartyAttribute.class));
	}

	//update party details
	@Override
	public void updateparty(Party party)
	{
		//TODO need to replace with session variable
		Integer lastModifiedBy=party.getCreatedBy();
		
		jdbcTemplate.update(SP_UPDATE_PARTY_FOR_PARTID, new Object[]{party.getId(),party.getLastName(),party.getMiddleName(),party.getFirstName(),
				party.getSalutationId(),party.getCompanyName(),party.getContactMobile1(),party.getContactMobile2(),party.getContactEmail1(),party.getWorkDesignation(),
				party.getWorkProfession(), party.getWorkCompanyName(),party.getDob(),party.getGenderId(),party.getMaritalStatusID(),party.getCampaignName(),
				party.getContactSourceTypeID(),party.getContactReferalName(),party.getConvertProbablity(),party.getOppotunityRatingId(),
				party.getOppotunityStatusId(),party.getNextActionId(),lastModifiedBy,party.getBuPartyId(),party.getPanNumber()});
	}

	//update or insert address for party
	@Override
	public void updateOrInsertAddress(Address address, Integer createdBy) 
	{
		// TODO - Need to remove this hardcoding
		if(createdBy == null)
			createdBy=1000;
		
		Integer lastModifiedBy=createdBy;
		
		//hard coded value for Address Type Id
		 
		jdbcTemplate.update(SP_UPDATE_OR_INSERT_ADDRESS_FOR_PARTY_ID, new Object[] {address.getPartyId(),address.getStreet1(),address.getStreet2(),
				address.getStreet3(),address.getPostalCode(),address.getCityId(),address.getStateId(),address.getCountryId(),createdBy,lastModifiedBy,
				address.getId(),address.getAddressTypeId()});
		
	}

	//update or insert family details for party
	@Override
	public void updateOrInsertFamilyDetails(Party party) 
	{
		//TODO need to replace with session variable
		Integer lastModifiedBy=party.getCreatedBy();
		Integer createdBy=party.getCreatedBy();
		//hard coded record type id and party user map type id		

		
		jdbcTemplate.update(SP_UPDATE_OR_INSERT_FAMILY_DETAILS, new Object[]{party.getFirstName(),party.getLastName(),
				party.getDob(),party.getAge(),createdBy,lastModifiedBy,party.getRelatedPartyId(),party.getRelationshipId(),party.getId(),
				party.getPartyUserMapTypeId(),party.getRecordTypeId(),party.getPanNumber(),party.getWorkProfession()});
		
	}
	
	@Override
	public Boolean updatePartyAttributeForPartyId(String partyAttributeXML,Integer partyId) 
	{
		int result = jdbcTemplate.update(SP_UPDATE_PARTYATTRIBUTE_FOR_PARTYID, new Object[] {partyAttributeXML,partyId});
		return (result>0)?true:false;		
	}

	@Override
	public Integer saveParty(Party party)
	{
		
		Address address = null;
		if(CollectionUtils.isNotEmpty(party.getAddressList())){
			address = party.getAddressList().get(0);
		}
		else{
			address = new Address();
		}
		
		Integer lastModifiedBy=party.getCreatedBy();
		Integer createdBy=party.getCreatedBy();
		
		
		return jdbcTemplate.queryForObject(SP_SAVE_PARTY, new Object[] {party.getRecordTypeId(),party.getOwnerPartyId(),address.getAddressTypeId(),party.getLastName(),
				party.getFirstName(),party.getSalutationId(),party.getCompanyName(),party.getContactMobile1(),party.getContactMobile2(),party.getContactEmail1(),
				party.getWorkDesignation(),party.getWorkProfession(),party.getDob(),party.getGenderId(),party.getMaritalStatusID(),party.getCampaignName(),party.getContactSourceTypeID(),
				party.getContactReferalName(),party.getPanNumber(),address.getStreet1(),address.getStreet2(),address.getStreet3(),address.getPostalCode(),
				address.getCityId(),address.getStateId(),address.getCountryId(),party.getCurrentStageId(),createdBy,lastModifiedBy,party.getBuPartyId(),party.getOppotunityStatusId()}, Integer.class);
		
	}

	@Override
	public Boolean deleteParty(String listOfParty)
	{
		jdbcTemplate.update(SP_DELETE_PARTY, listOfParty);
		return true;
	}

	@Override
	public List<JsonData> getFamilyMembers( Integer partyId, Integer recordTypeId ) {
		
		return jdbcTemplate.query(SP_GET_FAMILY_DETAILS, new Object[] {partyId,recordTypeId}, new BeanPropertyRowMapper<JsonData>(JsonData.class));
	}
	
	@Override
	public void updatepartyForContact(Party party) {
		Integer lastModifiedBy=party.getCreatedBy();
		
		jdbcTemplate.update(SP_UPDATE_PARTY_FOR_CONTACT, new Object[]{party.getId(),party.getLastName(),party.getMiddleName(),party.getFirstName(),
				party.getSalutationId(),party.getCompanyName(),party.getContactMobile1(),party.getContactMobile2(),party.getContactEmail1(),party.getWorkDesignation(),
				party.getWorkProfession(), party.getWorkCompanyName(),party.getDob(),party.getGenderId(),party.getMaritalStatusID(),party.getCampaignName(),
				party.getContactSourceTypeID(),party.getContactReferalName(),party.getConvertProbablity(),party.getOppotunityRatingId(),
				party.getNextActionId(),lastModifiedBy,party.getBuPartyId(),party.getPanNumber()});
		
	}

	@Override
	public Boolean activateDCT(String listOfParty,Integer userId) {
		jdbcTemplate.update(SP_ACTIVATE_DCT_FOR_PARTYID, listOfParty,userId);
		return true;
	}

	@Override
	public String getValidatePanNumber(String panNo,Integer partyId) {
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_validatePanNumber");
		SqlParameter PanNumber = new SqlParameter("PanNumber", Types.VARCHAR);
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter Message = new SqlOutParameter("Message", Types.VARCHAR);
		SqlParameter[] param = {PanNumber,PartyId,Message};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PanNumber", panNo);
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		String msg = (String)storedProcedureResult.get("Message");
		
		return msg;
	}

	@Override
	public List<PartySearchCriteria> getAutoPlanClients(
			PartySearchCriteria partySearchCriteria) {
List<PartyKeyValue> partyKeyValues = partySearchCriteria.getPartySearchList();
		return jdbcTemplate.query(SP_GET_AUTOPLAN_PARTIES, new Object[]{partySearchCriteria.getOwnerPartyId(),partySearchCriteria.getGenericSearch(),partySearchCriteria.getOpportunityStatusID(),partySearchCriteria.getContactSourceTypeID(),partySearchCriteria.getRecordTypeID()}, 
					new BeanPropertyRowMapper<PartySearchCriteria>(PartySearchCriteria.class));
			
	}

	@Override
	public Integer deleteFamilyMemmberForPArtyId(Integer partyId,
			Integer familyPartyId) {
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_deleteFamilyMemberForPartyId");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlParameter FamilyPartyId = new SqlParameter("FamilyPartyId", Types.INTEGER);
		SqlOutParameter isDeleted = new SqlOutParameter("isDeleted", Types.INTEGER);
		SqlParameter[] param = {PartyId,FamilyPartyId,isDeleted};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		paramValue.put("FamilyPartyId", familyPartyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		Integer result2 =(Integer) storedProcedureResult.get("isDeleted");
			
		return result2;
		
	}
	
	@Override
	public Boolean insertEntryForXray(Integer partyId,Integer userId)
	{
		 jdbcTemplate.update(SP_INSERTENTRYFOR_XRAY,partyId,userId);
		 return true;
		
	}
	
	@Override
	public List<PartyAttribute> getPartyAttributeForPartyId(Integer partyId,String attributeCodeIds) {
		return jdbcTemplate.query(SP_GET_PARTY_ATTRIBUTE, new Object[] {partyId,attributeCodeIds}, new BeanPropertyRowMapper<PartyAttribute>(PartyAttribute.class));
	}

	@Override
	public Boolean updatePartyAttribute(String partyAttributeXML, Integer partyId) {
		jdbcTemplate.update(SP_SAVE_PARTY_ATTRIBUTE, new Object[] {partyAttributeXML,partyId});
		return true;
		
	}
}
