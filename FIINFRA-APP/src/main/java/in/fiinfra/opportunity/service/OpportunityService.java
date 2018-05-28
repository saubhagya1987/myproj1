package in.fiinfra.opportunity.service;

import java.util.List;

import javax.ws.rs.core.Response;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotesData;








import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.opportunity.OpportunityTask;


public interface OpportunityService{
	//List<OpportunityData> getOpportunitiesList(int partyId, int buId,String oppSearchValue,int nodeId);
	public Response getOpportunitiesList(int partyId, int buId,String oppSearchValue,int nodeId,int pageNo,int pageSize,String orderBy,String sord);
	//List<OpportunityTask> getOpportunitiesTask(int partyId, int buId,String oppSearchValue);
	public Response getOpportunitiesTask(int partyId, int buId,String oppSearchValue);
	
	List<Integer> saveOpportunity(int partyId, String opportunityXMLString, int createdBy,int buId, String offeringXML,int opPartyId);
	public OpportunityData getOpportunityRecord(int partyId);
	List<Integer> insertBulkDcActivation(String partyIds,int buId);
	
	//Opportunity Profile
	OpportunityProfileData getOpportunityProfileDetails(int partyId, int buId);
	List<Integer> updateOpportunityProfile(String sectionName, String dataXml,
	int buId, String partyId,int lastModifiedBy, String offeringXML);

	//DC Activation
	List<Integer> insertDcActivationRecord(String userXMLString, int createdBy,int buId);
	List<String> insertXRayActivationRecord(String userXMLString,String partyIds,int createdBy,int buId);
	
	List<List<OpportunityData>> insertBulkOpportunity(String bulkopportunityXML, int createdBy);
//	int insertBulkDcActivationForBulkOpportunity(List<OpportunityData> lstSuccessOpportunityDC, int createdBy,int buId);
//	int insertBulkXRayActivationForBulkOpportunity(List<OpportunityData> lstSuccessOpportunityDC, int createdBy,int buId);
	
	//Note
//	NotesData insertNote(NotesData noteData);
	String deleteNote(String noteIds,int buId);
	List<Integer> insertNote(NotesData noteData);
	//Document
	DocumentData  insertDocument(DocumentData documentData);
	String deleteDocument(String documentIds,int buId);
	
	//List<OpportunityStageData> getOpportunitiesStageList(int partyId, int buId,int nodeId);
	public Response getOpportunitiesStageList(int partyId, int buId,int nodeId);
	String deleteOpportunities(String partyIds,int buId,int createdBy);
	String updateFpplanType(int fpPlanTypeId, int dcInputPartyId,int buId);
	List<OpportunityData> getSendReport(int partyId);
	
}