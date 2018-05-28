package in.fiinfra.party.dao;

import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.Chek_BoxDetails;
import in.fiinfra.common.diy.models.Form_Details;
import in.fiinfra.common.diy.models.Form_Field_Details;
import in.fiinfra.common.diy.models.JobRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartySearchCriteria;
import in.fiinfra.common.diy.models.Product_Mst;

import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;



@Repository("partyDao")
public class PartyDaoImpl implements PartyDao {

	private static final String SP_RETRIVE_SEARCH_PARTIES_FOR_SEARCH_CRITERIA = "{CALL usp_DIY_getPartyForSearchCriteria(?,?,?,?,?)}";
	private static final String SP_RETRIVE_PARTIY_DETAILS_FOR_PARTY_ID = "{CALL usp_DIY_getPartyForPartyId(?)}";
	private static final String SP_RETRIVE_FAMILY_DETAILS_FOR_PARTY_ID="{CALL usp_DIY_getFamilyDetailsForPartyId(?)}";
	private static final String SP_RETRIVE_ADDRESS_FOR_PARTY_ID = "{CALL usp_DIY_getAddressForPartyId(?)}";
	private static final String SP_UPDATE_OR_INSERT_FAMILY_DETAILS = "{CALL usp_DIY_insertOrUpdateFamilyDetails(?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_UPDATE_OR_INSERT_ADDRESS_FOR_PARTY_ID = "{CALL usp_DIY_insertOrUpdateAddress(?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_UPDATE_PARTY_FOR_PARTID = "{CALL usp_DIY_updatePartyDetails(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_SAVE_PARTY = "{CALL usp_DIY_insertParty(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_DELETE_PARTY = "{CALL usp_DIY_deletePartyForPartyId(?)}";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;	
	
	public List<PartySearchCriteria> getAllPartiesForSearchCriteria(
			PartySearchCriteria partySearchCriteria){
		return null;
	}
	
//	@Override
	/*public List<PartySearchCriteria> getAllPartiesForSearchCriteria(
			PartySearchCriteria partySearchCriteria) 
	{
		List<PartyKeyValue> partyKeyValues = partySearchCriteria.getPartySearchList();
		
		Integer statusId=null;
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
		}*/
			
			
	/*	return jdbcTemplate.query(SP_RETRIVE_SEARCH_PARTIES_FOR_SEARCH_CRITERIA, new Object[]{partySearchCriteria.getOwnerPartyId(),partySearchCriteria.getGenericSearch(),statusId,sourceTypeId,recordTypeId}, 
					new BeanPropertyRowMapper<PartySearchCriteria>(PartySearchCriteria.class));
			
	}*/

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

	//update party details
	@Override
	public void updateparty(Party party)
	{
		//TODO need to replace with session variable
		Integer lastModifiedBy=1;
		
		jdbcTemplate.update(SP_UPDATE_PARTY_FOR_PARTID, new Object[]{party.getId(),party.getLastName(),party.getMiddleName(),party.getFirstName(),
				party.getSalutationId(),party.getCompanyName(),party.getContactMobile1(),party.getContactMobile2(),party.getContactEmail1(),party.getWorkDesignation(),
				party.getWorkProfession(), party.getWorkCompanyName(),party.getDob(),party.getGenderId(),party.getMaritalStatusID(),party.getCampaignName(),
				party.getContactSourceTypeID(),party.getContactReferalName(),party.getConvertProbablity(),party.getOppotunityRatingId(),
				party.getOppotunityStatusId(),party.getNextActionId(),lastModifiedBy,party.getBuPartyId()});
	}

	//update or insert address for party
	@Override
	public void updateOrInsertAddress(Address address) 
	{
		//TODO need to replace with session variable
		Integer lastModifiedBy=1;
		Integer createdBy=1;
		
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
		Integer lastModifiedBy=1;
		Integer createdBy=1;
		//hard coded record type id and party user map type id		

		
		jdbcTemplate.update(SP_UPDATE_OR_INSERT_FAMILY_DETAILS, new Object[]{party.getFirstName(),party.getLastName(),
				party.getDob(),party.getAge(),createdBy,lastModifiedBy,party.getRelatedPartyId(),party.getRelationshipId(),party.getId(),
				party.getPartyUserMapTypeId(),party.getRecordTypeId()});
		
	}

	@Override
	public void saveParty(Party party)
	{
		
		Address address = null;
		
		if(CollectionUtils.isNotEmpty(party.getAddressList())){
			address = party.getAddressList().get(0);
		}
		else{
			address = new Address();
		}
		
		Integer lastModifiedBy=1;
		Integer createdBy=1;
		
		//hard coded record type id and party user map type id		
		//TODO need to replace with session variable
		//party.setRecordTypeId(14006);
		party.setPartyUserMapTypeId(41003);
		address.setAddressTypeId(9001);
		
		jdbcTemplate.update(SP_SAVE_PARTY, new Object[] {party.getRecordTypeId(),party.getOwnerPartyId(),address.getAddressTypeId(),party.getLastName(),
				party.getFirstName(),party.getSalutationId(),party.getCompanyName(),party.getContactMobile1(),party.getContactMobile2(),party.getContactEmail1(),
				party.getWorkDesignation(),party.getWorkProfession(),party.getDob(),party.getGenderId(),party.getMaritalStatusID(),party.getCampaignName(),party.getContactSourceTypeID(),
				party.getContactReferalName(),party.getPanNumber(),address.getStreet1(),address.getStreet2(),address.getStreet3(),address.getPostalCode(),
				address.getCityId(),address.getStateId(),address.getCountryId(),createdBy,lastModifiedBy});
		
	}

	@Override
	public Boolean deleteParty(String listOfParty)
	{
		jdbcTemplate.update(SP_DELETE_PARTY, listOfParty);
		return true;
	}


	@Override
	public List<JobRequest> getBatchJobRequest(Integer partyId) {

			
		        //String sql ="SELECT Param1namevalue,Param2namevalue,Param3namevalue,Param4namevalue from ZZ_BatchJob_RequestQ";
				
		         String sql ="SELECT  BatchJobRequestQTypeID, Param1namevalue,Param2namevalue,Param3namevalue,Param4namevalue from ZZ_BatchJob_RequestQ where  BatchJobRequestQTypeID= ? ";


				
				//return jdbcTemplate.queryForObject(sql, new Object[]{110002},new BeanPropertyRowMapper<JobRequest>(JobRequest.class));

				return jdbcTemplate.query(sql, new Object[]{110002},new BeanPropertyRowMapper<JobRequest>(JobRequest.class));

	}

	@Override
	public List<Product_Mst> getProduct_BatchJobReques(Integer productId) {
		  
		
		String sql ="SELECT  * from MST_Product where  ProductID= ? ";

			//return jdbcTemplate.queryForObject(sql, new Object[]{110002},new BeanPropertyRowMapper<JobRequest>(JobRequest.class));

			return jdbcTemplate.query(sql, new Object[]{productId},new BeanPropertyRowMapper<Product_Mst>(Product_Mst.class));

}

	@Override
	public List<Form_Details> getForm_Details(Integer Parm1) {
		
		
		String sql ="SELECT  * from TXN_FPExecution_FormDetail where  FPExecutionID= ? ";


		return jdbcTemplate.query(sql, new Object[]{Parm1},new BeanPropertyRowMapper<Form_Details>(Form_Details.class));

}

	@Override
	public List<Form_Field_Details> getForm_Field_Details(Integer form_id) {

		//String sql ="SELECT  * from TXN_FPExecution_FormDetail where  FPExecutionID= ? ";
		String sql=" select * from FORM_DETAILS where form_id= ?";


		return jdbcTemplate.query(sql, new Object[]{form_id},new BeanPropertyRowMapper<Form_Field_Details>(Form_Field_Details.class));

		
	}
	

	@Override
	public List<Chek_BoxDetails> getChek_Box_index( Integer Form_id ,String Field_Name ,Integer Field_IND) {
		
		// String s="InvestorStatusID";
		 
		 Integer d= Field_IND;
		String sql=" select * from Form_CheckBox_Details where Form_ID= ? and Field_Name =? and  Field_IND = ? ";

		return jdbcTemplate.query(sql, new Object[]{Form_id,Field_Name,d},new BeanPropertyRowMapper<Chek_BoxDetails>(Chek_BoxDetails.class));

	}

	@Override
	public Chek_BoxDetails getChek_Box_indexff(Integer Form_id) {

		String sql=" select  *  from Form_CheckBox_Details where Form_ID= 2 ";

		
		return jdbcTemplate.queryForObject(sql, new Object[]{Form_id}, 
				new BeanPropertyRowMapper<Chek_BoxDetails>(Chek_BoxDetails.class));
	}	}
	
	

