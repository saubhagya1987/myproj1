package in.fiinfra.opportunity.service;

import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;














import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.opportunity.OpportunityStageData;
import in.fiinfra.common.opportunity.OpportunityTask;
import in.fiinfra.opportunity.dao.OpportunityDao;
@Component
public class OpportunityServiceImpl implements OpportunityService{
	@Autowired
	private OpportunityDao opportunityDao;

	public OpportunityDao getOpportunityDao() {
		return opportunityDao; 
	}

	public void setOpportunityDao(OpportunityDao opportunityDao) {
		this.opportunityDao = opportunityDao;
	}

	@Override
	/*public List<OpportunityData> getOpportunitiesList(int partyId, int buId,String oppSearchValue,int nodeId) {
		List<OpportunityData> opportunityDatas=opportunityDao.getOpportunitiesList(partyId,buId,oppSearchValue,nodeId);
		return opportunityDatas;
	}*/
	public Response getOpportunitiesList(int partyId, int buId,String oppSearchValue,int nodeId,int pageNo,int pageSize,String orderBy,String sord) {
		Response result = opportunityDao.getOpportunitiesList(partyId,buId,oppSearchValue,nodeId,pageNo,pageSize,orderBy,sord);
		return result;
	}
	
	/*@Override
	public List<OpportunityTask> getOpportunitiesTask(int partyId, int buId,String oppSearchValue) {
		List<OpportunityTask> opportunityDatas=opportunityDao.getOpportunitiesTask(partyId,buId,oppSearchValue);
		return opportunityDatas;
	}*/
	
	public Response getOpportunitiesTask(int partyId, int buId,String oppSearchValue) {
		Response opportunityDatas=opportunityDao.getOpportunitiesTask(partyId,buId,oppSearchValue);
		return opportunityDatas;
	}

	@Override
	public List<Integer> saveOpportunity(int partyId, String opportunityXMLString, int createdBy,int buId,String offeringXML,int opPartyId) {
		List<Integer> recordCount=opportunityDao.saveOpportunity(partyId,opportunityXMLString,createdBy,buId,offeringXML,opPartyId);
		return recordCount;
	}
	
	@Override
	public List<Integer> insertDcActivationRecord(String userXMLString, int createdBy,int buId) {
		List<Integer> recordCount=opportunityDao.insertDcActivationRecord(userXMLString,createdBy,buId);
		return recordCount;
	}
	
	@Override
	public List<String> insertXRayActivationRecord(String userXMLString,String partyIds,int createdBy,int buId) {
		List<String> recordCount=opportunityDao.insertXRayActivationRecord(userXMLString,partyIds,createdBy,buId);
		return recordCount;
	}
	
	@Override
	public List<List<OpportunityData>> insertBulkOpportunity(String bulkopportunityXML, int createdBy) {
		List<List<OpportunityData>> recordCount=opportunityDao.insertBulkOpportunity(bulkopportunityXML,createdBy);
		return recordCount;
	}
	
//	public int insertBulkDcActivationForBulkOpportunity(List<OpportunityData> lstSuccessOpportunityDC, int createdBy,int buId){
//		int recordCount=opportunityDao.insertBulkDcActivationForBulkOpportunity(lstSuccessOpportunityDC,createdBy,buId);
//		return recordCount;
//	}
//	
//	public int insertBulkXRayActivationForBulkOpportunity(List<OpportunityData> lstSuccessOpportunityDC, int createdBy,int buId){
//		int recordCount=opportunityDao.insertBulkXRayActivationForBulkOpportunity(lstSuccessOpportunityDC,createdBy,buId);
//		return recordCount;
//	}
	
	
	//to retrieve opportunity
	@Override
	public OpportunityData getOpportunityRecord(int partyId) 
	{
		return opportunityDao.getOpportunityRecord(partyId);
	}
		
	
	@Override
	public OpportunityProfileData getOpportunityProfileDetails(int partyId, int buId) {
		
		OpportunityProfileData opportunityProfileData=opportunityDao.getOpportunityProfileDetails(partyId,buId);
		return opportunityProfileData ;
	}
	
	@Override
	public List<Integer> updateOpportunityProfile(String sectionName, String dataXml,
			int buId, String partyId,int lastModifiedBy,String offeringXML) {
		List<Integer> recordCount=opportunityDao.updateOpportunityProfile(sectionName,dataXml,buId,partyId,lastModifiedBy,offeringXML);
		return recordCount;
	}
	
	@Override
	public List<Integer> insertBulkDcActivation(String partyIds,int buId) {
		List<Integer> result=opportunityDao.insertBulkDcActivation(partyIds,buId);
		return result;
	}
	
//	@Override
//	public NotesData insertNote(NotesData noteData) {
//		noteData=opportunityDao.insertNote(noteData);
//		return noteData;
//	}
//	
	@Override
	public List<Integer> insertNote(NotesData noteData) {
		List<Integer> recordCount=opportunityDao.insertNote(noteData);
		return recordCount;
	}
	
	
	@Override
	public String deleteNote(String noteIds,int buId) {
		String result=opportunityDao.deleteNote(noteIds,buId);
		return result;
	}
	
	@Override
	public DocumentData insertDocument(DocumentData documentData) {
		documentData=opportunityDao.insertDocument(documentData);
		return documentData;
	}
	
	@Override
	public String deleteDocument(String documentIds,int buId) {
		String result=opportunityDao.deleteDocument(documentIds,buId);
		return result;
	}
	
	/*@Override
	public List<OpportunityStageData> getOpportunitiesStageList(int partyId,
			int buId,int nodeId) {
		List<OpportunityStageData> opportunityStageDatas=opportunityDao.getOpportunitiesStageList(partyId, buId,nodeId);
		return opportunityStageDatas;
	}*/
	public Response getOpportunitiesStageList(int partyId,
			int buId,int nodeId) {
		Response result = opportunityDao.getOpportunitiesStageList(partyId,buId,nodeId);
		return result;
	}
	
	@Override
	public String deleteOpportunities(String partyIds,int buId,int createdBy) {
		String result=opportunityDao.deleteOpportunities(partyIds,buId,createdBy);
		return result;
	}
	public String updateFpplanType(int fpPlanTypeId, int dcInputPartyId,int buId)
	{
		String result=opportunityDao.updateFpplanType(fpPlanTypeId,dcInputPartyId,buId);
		return result;
	}
	
	@Override
	public List<OpportunityData> getSendReport(int partyId)
	{
		List<OpportunityData> sendReportDatas=opportunityDao.getSendReport(partyId);
		return sendReportDatas;
	}
}