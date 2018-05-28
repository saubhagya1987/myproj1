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
import in.fiinfra.partner.dao.FolioDao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class FolioServiceImpl implements FolioService {

	@Autowired
	FolioDao folioDao;
	@Override
	public Map<String, String> getFolioSummary(int partnerId, int buId, int nodeId) {
		return folioDao.getFolioSummary(partnerId, buId, nodeId);
	}
	@Override
	public List<List<PortFolioProductInfo>> getPortFolioProductInfo(
			int partnerId, int buId, int nodeId) {
		// TODO Auto-generated method stub
		return folioDao.getPortFolioProductInfo(partnerId , buId, nodeId);
	}
	public Map<String,String> getPartnerAUMMonthWise(int partnerId, int buId,String chartType,int nodeId){
		return folioDao.getPartnerAUMMonthWise(partnerId , buId,chartType,nodeId);
	}
	
	public Map<String,Map<String,String>> displayFolioPieChart(int partnerId, int buId,int nodeId){
		return folioDao.displayFolioPieChart(partnerId, buId,nodeId);
	}
	public Map<String,List<ClientPortfolioSummarryData>> getClientPortfolioSummary(int partyId, int buId,int partnerId,int nodeId){
		return folioDao.getClientPortfolioSummary(partyId, buId,partnerId,nodeId);
	}
	@Override
	public Map<String,List<Map<String,String>>> getClientPortFolioTransactions(int buId,
			int partyAssetId) {
		// TODO Auto-generated method stub
		return folioDao.getClientPortFolioTransactions(buId, partyAssetId);
	}
	public Map<String,List<Map<String,String>>> getClientPortFolioGoalMapping(int buId,int partyAssetId){
		return folioDao.getClientPortFolioGoalMapping(buId, partyAssetId);
	}
	public void updateGoalMapping(int buId,GoalData[] goaldData,int createdBy,int partyAssetId){
		folioDao.updateGoalMapping(buId,goaldData,createdBy,partyAssetId);
	}
	public List<NomineeData> getClientPortFolioNominations(int buId,int partyAssetId){
		return folioDao.getClientPortFolioNominations(buId, partyAssetId);
	}
	public void updateFolioNominations(int buId,NomineeData nominee,int createdBy,String folioNo, int partyId,int partnerId,int clientId,int partyAssetId){
		folioDao.updateFolioNominations(buId,nominee,createdBy,folioNo,partyId,partnerId,clientId,partyAssetId);
	}
	
	
	
	@Override
	public NomineeData getNomineeDataByPartyId(int buId, int partyId) {
		// TODO Auto-generated method stub
		return folioDao.getNomineeDataByPartyId(buId, partyId);
	}
	
	/**
	 * @see FolioService#getClientStockDetailsForAddEditForm(int)
	 */
	@Override
	public Map<String, List<Map<String, String>>> getClientStockDetailsForAddEditForm(
			int buId, int partyId) {
		return folioDao.getClientStockDetailsForAddEditForm(buId, partyId);
	}
	
	public void addEntryForStock(
			int buId,int createdBy,int clientId,StockPortfolioData stockPortfolioData){
			folioDao.addEntryForStock(buId,createdBy,clientId,stockPortfolioData);
		}
	
	/**
	 * @see FolioService#getAssetForAddEditForm(String, String)
	 */
	@Override
	public Map<String, String> getAssetForAddEditForm(int buId, String searchType,
			String searchString, int mfAMCId, int clientPartyId) {
		
		return folioDao.getAssetForAddEditForm(buId, searchType, searchString, mfAMCId, clientPartyId);
	}
	public Map<String, List<Map<String, String>>> getClientMFDetailsForAddEditForm(int buId, int partyId){
		return folioDao.getClientMFDetailsForAddEditForm(buId, partyId);
	}
	/**
	 * @see FolioService#addEntryForMF(int, int, int, MFPortfolioData)
	 */
	@Override
	public void addEntryForMF(int buId, int createdBy, int clientId,int pmTxnID,
			MFPortfolioData mfPortfolioData) {
		folioDao.addEntryForMF(buId, createdBy, clientId,pmTxnID, mfPortfolioData);
		
	}
	@Override
	public void deleteFolioNominations(int buId, int createdBy,
			String idsToDelete) {
			/*String commaSeperatedList = "";
			int i = 0;
			for(String id : idsToDelete.){
				if(i < idsToDelete.length()-1)
					commaSeperatedList = commaSeperatedList+id+",";
				else
					commaSeperatedList = commaSeperatedList+id;
				
				i++;
			}*/
			 folioDao.deleteFolioNominations(buId, createdBy, idsToDelete);
			
		
	}
	public Map<String, List<Map<String, String>>> getClientULIPDetailsForAddEditForm(int buId, int partyId){
		return folioDao.getClientULIPDetailsForAddEditForm(buId, partyId);
	}
	public void addEntryForULIP(int buId,int createdBy, int clientId, PortfolioData ulipPortfolioData){
		folioDao.addEntryForULIP(buId, createdBy, clientId, ulipPortfolioData);
	}
	public Map<String, List<Map<String, String>>> getClientFIDetailsForAddEditForm(int buId, int partyId){
		return folioDao.getClientFIDetailsForAddEditForm(buId, partyId);
	}
	public void addEntryForFI(int buId,int createdBy, int clientId, FixedIncomePortfolioData fiPortfolioData){
		folioDao.addEntryForFI(buId, createdBy, clientId, fiPortfolioData);
	}
	
	@Override
	public List<ContactData> getAMCList(int buId,int clientPartyId) {
		
		return folioDao.getAMCList(buId,clientPartyId);
	}
	@Override
	public List<ContactData> getPortfolioClientList(int buId, int partnerId,
			int nodeId) {
		return folioDao.getPortfolioClientList(buId, partnerId, nodeId);
	}
	
	@Override
	public Map<String, List<Map<String, String>>> getClientPropertyDetailsForAddEditForm(
			int buId, int partyId) {
		return folioDao.getClientPropertyDetailsForAddEditForm(buId, partyId);
	}
	@Override
	public void addEntryForProperty(int buId, int createdBy, int clientId,
			PortfolioData propertyPortfolioData) {
		folioDao.addEntryForProperty(buId, createdBy, clientId, propertyPortfolioData);
		
	}
	@Override
	public Map<String, List<Map<String, String>>> getClientGoldDetailsForAddEditForm(
			int buId, int partyId) {
		return folioDao.getClientGoldDetailsForAddEditForm(buId, partyId);
	}
	@Override
	public void addEntryForGold(int buId, int createdBy, int clientId,
			PortfolioData goldPortfolioData) {
		folioDao.addEntryForGold(buId, createdBy, clientId, goldPortfolioData);
		
	}
	@Override
	public void deleteClientTransaction(int buId, int createdBy,int clientId,
			StockPortfolioData stockPortfolioData) {
		folioDao.deleteClientTransaction(buId, createdBy,clientId, stockPortfolioData);
		
	}
	
	@Override
	public List<MFPortfolioData> getClientMFTransactionDetailst(int partnerId,int partyAssetId,int clientId,
			String amc, String productId, int txnType, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return folioDao.getClientMFTransactionDetailst(partnerId,partyAssetId,clientId,amc,productId,txnType,startDate,endDate);
	}
	@Override
	public void deleteClientMFTransaction(int buId, int createdBy, int pmTxnId) {
		// TODO Auto-generated method stub
		 folioDao.deleteClientMFTransaction(buId, createdBy, pmTxnId);
	}
	@Override
	public List<MFPortfolioData> getSelectedCMFTransaction(int buId, int pmTxnId) {
		// TODO Auto-generated method stub
		return folioDao.getSelectedCMFTransaction(buId,pmTxnId);
	}
}
