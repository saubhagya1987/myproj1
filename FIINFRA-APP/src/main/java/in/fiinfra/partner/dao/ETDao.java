package in.fiinfra.partner.dao;

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

import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;
public interface ETDao {

	public List<ActionPlanData> getApDetails(int buId,int partyId,int partnerId);
	public List<ContactData> quickSearchContacts(String searchString,int buId,int partnerId,int nodeId);
	//public List<ActionPlanData> getApRecommendations(int buId,int partyId);
	public List<Object> bulkUpload(int buId);
	public ETData getExecutionDetails(int buId,int fpActionPlanId);
	public List<ETData> getRecommendedInvestment(int buId,int fpActionPlanId);
	public List<ETData> getProposedInvestment(int buId,int fpActionPlanId);
	public Map<String,Map<String,String>> getExecutionDetailsPickList(int buId,int fpActionPlanId);
	public void saveProposedInvestments(int buId,int fpActionPlanId,int createdBy,List<ETData> etData);
	public ETData getExecutionStatus(int buId,int fpActionPlanId);
	public void cancelExecution(int buId,int fpApActionPlan,String comment,int createdBy);
	public int saveEtForm(int buId,int fpExecutionId,ETPrePrintedFormData etForm,int createdBy);
	public List<ETPrePrintedFormData> getPrePrintedFormProducts(int buId,int fpActionPlanId);
	public ETPrePrintedFormData loadEtForm(int buId,int fpExecutionId);
	public ETPrePrintedFormData autoPolpulateEtForm(int buId,int fpActionPlanId);
	public Map<String,String> getAllProductManufacturer(int buId);
	public Map<String ,String> loadProductsForManufacturer(int buId,String manufacturerCode);
	public void generateEtForm(int buId, int fpExecutionId, int createdBy);
	public List<ETPrePrintedFormData> getAvailablePrePrintedForm(int buId,int fpActionPlanId);
	public List<DocumentData> getAllEtDocuments(int buId,int fpActionPlanId);
	public List<NotesData> getNotes(int buId,int fpActionPlanId);
	public void saveEtNote(int buId,int fpActionPlanId,String noteText,int noteId,int createdBy);
	public void deleteEtNotes(String noteIds,int buId);
	public String uploadDoc(int fpActionPlanId,int  buId,int createdBy,List<DocumentData> docs);
	public String deleteEtDocs(String docIds,int buId);
	public String  bulkUploadTxn( int txnSourceId,int buId,int createdBy,List<DocumentData> docs);
	public List<TransactionData>  getBulkUploadTxnHistory(int buId,int createdBy);
	public void updateETClientApproval(int buId, int fpExecutionId);
	public List<AuditData> getEtTrackingHistory(int buId,int fpActionPlanId);
	public ETPrePrintedFormData loadFolioDetails(int buId , String folioId);
	public List<Map<String,String>> getBulkUploadTransactionHistoryErrorCount(int buId , int queueId);
	public List<TransactionHistoryData> getBulkUploadTransactionHistoryDetails(int buId , int queueId,int partnerId);
	public void requestForReporcess(int buId, int queueId, int createdBy);
	public Response getApplicantDetailsList(ETPrePrintedFormData formData);
	public Response getClientDetailsForApprovel(ETData etData);
	
	public List<ETPrePrintedFormData> loadMutualFundProduct(int buId,String searchStr);
	public ETPrePrintedFormData loadPortFolioPrePrintedForm(int buId,int productid,int clientPartyId);
	public List<ETPrePrintedFormData> loadAvailablePrePrintedForms(int buId,int clientPartyId,String ownerPartyId);
	public List<AssetAllocatedToGoal> assetAutoAllocation(int partnerId,int nodeId, int buId);
	public void deleteAsset(String goalAssetId,int buId);
	public void confirmAsset(String goalAssetId,int buId, String userId);
	public AssetAllocatedToGoal assetAutoAllocationDetailsWhileEdit(String goalAssetId,int buId);
	
}
