package in.fiinfra.partner.service;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.partner.ActionPlanData;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AuditData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.partner.ETData;
import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.common.partner.NotesData;
import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;
import in.fiinfra.partner.dao.ETDao;

import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class ETServiceImpl implements ETService{

	@Autowired
	private ETDao etDao;
	@Override
	public List<ActionPlanData> getApDetails(int partyId, int buId,int partnerId) {
		// TODO Auto-generated method stub
		return etDao.getApDetails(buId, partyId,partnerId);
	}
	
	@Override
	public List<ContactData> quickSearchContacts(String searchString,int buId,int partnerId, int nodeId){
		return etDao.quickSearchContacts( searchString,buId,partnerId,nodeId);
	}
	public ETDao getEtDao() {
		return etDao;
	}
	public void setEtDao(ETDao etDao) {
		this.etDao = etDao;
	}

	@Override
	public List<Object> bulkUpload(int buId) {
		// TODO Auto-generated method stub
		return etDao.bulkUpload(buId);
	}

	@Override
	public ETData getExecutionDetails(int buId, int fpActionPlanId) {
		// TODO Auto-generated method stub
		return etDao.getExecutionDetails(buId,fpActionPlanId);
	}

	@Override
	public List<ETData> getRecommendedInvestment(int buId, int fpActionPlanId) {
		// TODO Auto-generated method stub
		return etDao.getRecommendedInvestment(buId, fpActionPlanId);
	}

	@Override
	public List<ETData> getProposedInvestment(int buId, int fpActionPlanId) {
		// TODO Auto-generated method stub
		return etDao.getProposedInvestment(buId, fpActionPlanId);
	}

	@Override
	public Map<String, Map<String, String>> getExecutionDetailsPickList(int buId,int fpActionPlanId) {
		return etDao.getExecutionDetailsPickList(buId,fpActionPlanId);
	}

	@Override
	public void saveProposedInvestments(int buId,int fpActionPlanId,int createdBy, List<ETData> etData) {
		// TODO Auto-generated method stub
		etDao.saveProposedInvestments(buId,fpActionPlanId,createdBy, etData);
		
	}

	public ETData getExecutionStatus(int buId,int fpActionPlanId){
		
		return etDao.getExecutionStatus(buId,fpActionPlanId);
	}
	public void cancelExecution(int buId,int fpApActionPlan,String comment,int createdBy){
		etDao.cancelExecution(buId,fpApActionPlan,comment,createdBy);
	}
	public int saveEtForm(int buId,int fpExecutionId,ETPrePrintedFormData etForm,int createdBy){
		return etDao.saveEtForm(buId,fpExecutionId,etForm,createdBy);
	}
	public List<ETPrePrintedFormData> getPrePrintedFormProducts(int buId,int fpActionPlanId){
		return etDao.getPrePrintedFormProducts(buId,fpActionPlanId);
	}
	public ETPrePrintedFormData loadEtForm(int buId,int fpExecutionId){
		return etDao.loadEtForm(buId,fpExecutionId);
	}
	
	public ETPrePrintedFormData autoPolpulateEtForm(int buId,int fpActionPlanId){
		
		return etDao.autoPolpulateEtForm(buId, fpActionPlanId);
	}
	public Map<String,String> getAllProductManufacturer(int buId){
		return etDao.getAllProductManufacturer(buId);
	}
	

	
	

	@Override
	public void generateEtForm(int buId, int fpExecutionId, int createdBy) {
		// TODO Auto-generated method stub
		etDao.generateEtForm( buId, fpExecutionId, createdBy);
		
	}

	@Override
	public Map<String, String> loadProductsForManufacturer(int buId,
			String manufacturerCode) {
		// TODO Auto-generated method stub
		etDao.loadProductsForManufacturer(buId, manufacturerCode);
		return null;
	}
	public List<ETPrePrintedFormData> getAvailablePrePrintedForm(int buId,int fpActionPlanId){
		return etDao.getAvailablePrePrintedForm(buId, fpActionPlanId);
	}
	public List<DocumentData> getAllEtDocuments(int buId,int fpActionPlanId){
		return etDao.getAllEtDocuments(buId, fpActionPlanId);
	}
	public List<NotesData> getNotes(int buId,int fpActionPlanId){
		return etDao.getNotes(buId, fpActionPlanId);
	}
	public void saveEtNote(int buId,int fpActionPlanId,String noteText,int noteId,int createdBy){
		etDao.saveEtNote(buId,fpActionPlanId,noteText,noteId,createdBy);
	}
	public void deleteEtNotes(String noteIds,int buId){
	etDao.deleteEtNotes(noteIds, buId);	
	}
	public String uploadDoc(int fpActionPlanId,int  buId,int createdBy,List<DocumentData> docs){
		
		
		return etDao.uploadDoc(fpActionPlanId,buId,createdBy,docs);
	}
	public String deleteEtDocs(String docIds,int buId){
		return etDao.deleteEtDocs(docIds,buId);
	}	
	public String  bulkUploadTxn( int txnSourceId,int buId,int createdBy,List<DocumentData> docs){
		return etDao.bulkUploadTxn(txnSourceId,buId,createdBy,docs);
	} 

	@Override
	public List<TransactionData> getBulkUploadTxnHistory(int buId, int createdBy) {
		return etDao.getBulkUploadTxnHistory(buId , createdBy);
	}
	public void updateETClientApproval(int buId, int fpExecutionId) {
		etDao.updateETClientApproval(buId, fpExecutionId);
	}
	public List<AuditData> getEtTrackingHistory(int buId,int fpActionPlanId){
		return etDao.getEtTrackingHistory(buId, fpActionPlanId);
	}

	@Override
	public ETPrePrintedFormData loadfolioDetails(int buId, String folioId) {
		return etDao.loadFolioDetails(buId, folioId);
		
	}

	@Override
	public List<Map<String, String>> getBulkUploadTransactionHistoryErrorCount(
			int buId, int queueId) {
		return etDao.getBulkUploadTransactionHistoryErrorCount(buId, queueId);
	}

	@Override
	public List<TransactionHistoryData> getBulkUploadTransactionHistoryDetails(
			int buId, int queueId,int partnerId) {
		return etDao.getBulkUploadTransactionHistoryDetails(buId, queueId,partnerId);
	}

	@Override
	public void requestForReporcess(int buId, int queueId, int createdBy) {
		// TODO Auto-generated method stub
		etDao.requestForReporcess(buId, queueId, createdBy);
//		return new String("success");
	}

	@Override
	public Response getApplicantDetailsList(ETPrePrintedFormData formData) {
		// TODO Auto-generated method stub
		return etDao.getApplicantDetailsList(formData);
	}

	@Override
	public Response getClientDetailsForApprovel(ETData etData) {
		return etDao.getClientDetailsForApprovel(etData);
	}
	public List<ETPrePrintedFormData> loadMutualFundProduct(int buId,
			String searchStr) {
		return etDao.loadMutualFundProduct(buId,searchStr);

	}

	@Override
	public ETPrePrintedFormData loadPortFolioPrePrintedForm(int buId, int productid,int clientPartyId) {
		return etDao.loadPortFolioPrePrintedForm(buId,productid,clientPartyId);
	}

	@Override
	public List<ETPrePrintedFormData> loadAvailablePrePrintedForms(int buId,
			int clientPartyId, String ownerPartyId) {
		return etDao.loadAvailablePrePrintedForms(buId, clientPartyId,ownerPartyId);
	}

	@Override
	public List<AssetAllocatedToGoal> assetAutoAllocation(int partnerId,
			int nodeId, int buId) {
		return etDao.assetAutoAllocation(partnerId, nodeId, buId);
	}

	@Override
	public void deleteAsset(String goalAssetId, int buId) {
		etDao.deleteAsset(goalAssetId, buId);	
	}

	@Override
	public void confirmAsset(String goalAssetId, int buId, String userId) {
		etDao.confirmAsset(goalAssetId, buId, userId);	
	}

	@Override
	public AssetAllocatedToGoal assetAutoAllocationDetailsWhileEdit(
			String goalAssetId, int buId) {
		return etDao.assetAutoAllocationDetailsWhileEdit(goalAssetId, buId);	
	}
	
}
