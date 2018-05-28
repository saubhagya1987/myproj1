package in.fiinfra.partner.service;

import in.fiinfra.common.partner.ClientPortfolioSummarryData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.partner.FixedIncomePortfolioData;
import in.fiinfra.common.partner.MFPortfolioData;
import in.fiinfra.common.partner.NomineeData;
import in.fiinfra.common.partner.PortFolioProductInfo;
import in.fiinfra.common.partner.PortfolioData;
import in.fiinfra.common.partner.StockPortfolioData;
import in.fiinfra.common.utility.GoalData;

import java.util.List;
import java.util.Map;

public interface FolioService {

	public Map<String,String> getFolioSummary(int partnerId,int buId, int nodeId);

	public List<List<PortFolioProductInfo>> getPortFolioProductInfo(int partnerId, int buId, int nodeId);
	
	public Map<String,String> getPartnerAUMMonthWise(int partnerId, int buId,String chartType,int nodeId);
	
	public Map<String,Map<String,String>> displayFolioPieChart(int partnerId, int buId,int nodeId);
		
	public Map<String,List<ClientPortfolioSummarryData>> getClientPortfolioSummary(int partyId, int buId,int partnerId,int nodeId);
	
	public Map<String,List<Map<String,String>>> getClientPortFolioTransactions(int buId , int partyAssetId);
	
	public Map<String,List<Map<String,String>>> getClientPortFolioGoalMapping(int buId,int partyAssetId);
	
	public void updateGoalMapping(int buId,GoalData[] goaldData,int createdBy,int partyAssetId);
	
	public List<NomineeData> getClientPortFolioNominations(int buId,int partyAssetId);
	
	public void updateFolioNominations(int buId,NomineeData nominee,int createdBy,String folioNo, int partyId,int partnerId,int clientId,int partyAssetId);
	
	public void deleteFolioNominations(int buId , int createdBy , String idsToDelete);
	
	public NomineeData getNomineeDataByPartyId(int buId , int partyId);
	
	public List<ContactData> getPortfolioClientList(int buId,int partnerId,int nodeId);
	
	/**
	 * 
	 * @param buId parameter to select the database
	 * @return {@link Map} returns a map that contains data to be shown on the addEdit form on the UI
	 */
	public Map<String, List<Map<String, String>>> getClientStockDetailsForAddEditForm(int buId, int partyId);
	
	public void addEntryForStock(int buId,int createdBy,int clientId,StockPortfolioData stockPortfolioData);
	
	/**
	 * The method return the suggestion for stock name on Add/Edit stock form
	 * @param buId : Id used to select the database
	 * @param searchType : The entity to serach for e.g stockType
	 * @param searchString : The string for suggestions search
	 */
	public Map<String , String> getAssetForAddEditForm(int buId, String searchType, String searchString, int mfAMCId, int clientPartyId);
	
	public Map<String, List<Map<String, String>>> getClientMFDetailsForAddEditForm(int buId, int partyId);
	
	/**
	 * Method to store the mf entry from Add/Edit MFform  
	 * @param buId Id used to select the database
	 * @param createdBy partner Id
	 * @param clientId customer Id
	 * @param mfPortfolioData
	 */
	public void addEntryForMF(int buId,int createdBy, int clientId,int pmTxnID, MFPortfolioData mfPortfolioData);
	public Map<String, List<Map<String, String>>> getClientULIPDetailsForAddEditForm(int buId, int partyId);
	/**
	 * Method to store the ulip entry from Add/Edit Ulipform  
	 * @param buId Id used to select the database
	 * @param createdBy partner Id
	 * @param clientId customer Id
	 * @param ulipPortfolioData
	 */
	public void addEntryForULIP(int buId,int createdBy, int clientId, PortfolioData ulipPortfolioData);
	public Map<String, List<Map<String, String>>> getClientFIDetailsForAddEditForm(int buId, int partyId);
	public void addEntryForFI(int buId,int createdBy, int clientId, FixedIncomePortfolioData fiPortfolioData);
	
	public List<ContactData> getAMCList(int buId,int clientPartyId);
	
	public Map<String,List<Map<String, String>>> getClientPropertyDetailsForAddEditForm(int buId, int partyId);
	
	public void addEntryForProperty(int buId,int createdBy,int clientId, PortfolioData propertyPortfolioData);
	
	public Map<String,List<Map<String, String>>> getClientGoldDetailsForAddEditForm(int buId, int partyId);
	public void addEntryForGold(int buId,int createdBy,int clientId, PortfolioData goldPortfolioData);
	
	public void deleteClientTransaction(int buId,int createdBy,int clientId,StockPortfolioData stockPortfolioData);
	public List<MFPortfolioData> getClientMFTransactionDetailst(int partnerId,int partyAssetId,int clientId,String amc,String productId,int txnType,String startDate,String endDate);
	public List<MFPortfolioData> getSelectedCMFTransaction(int buId,int pmTxnId);
	public void deleteClientMFTransaction(int buId , int createdBy , int pmTxnId);
}
