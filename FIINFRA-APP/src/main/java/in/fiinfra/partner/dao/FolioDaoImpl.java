package in.fiinfra.partner.dao;

import in.fiinfra.common.common.XStreamTranslator;
import in.fiinfra.common.partner.ClientPortfolioSummarryData;
import in.fiinfra.common.partner.ContactData;
import in.fiinfra.common.partner.FixedIncomePortfolioData;
import in.fiinfra.common.partner.MFPortfolioData;
import in.fiinfra.common.partner.NomineeData;
import in.fiinfra.common.partner.PortFolioProductInfo;
import in.fiinfra.common.partner.PortfolioData;
import in.fiinfra.common.partner.StockPortfolioData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;

public class FolioDaoImpl implements FolioDao {
	
	private static final Logger logger = Logger.getLogger(FolioDaoImpl.class);
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	@Override
	public Map<String, String> getFolioSummary(int partnerId, int buId, int nodeId) {

		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getmfportfoliosummary");
		
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter nodeidParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter[] paramArray = {partnerIdParam,nodeidParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partnerId",partnerId);
		paramValues.put("nodeId", nodeId);
		
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		Map<String,String> resultMap = new HashMap<String,String>();
		for(Map<String,Object> col : columnList){
			String clientCount = col.get("ClientCount").toString();
			resultMap.put("Clients",clientCount);
			String folioCount = col.get("FolioCount").toString();
			resultMap.put("Folios",folioCount);
			String aum = col.get("AUM").toString();
			resultMap.put("AUM",aum);
			String sipCount = col.get("SIPCount").toString();
			resultMap.put("SIP",sipCount);
			String purchaseCount = col.get("PurchaseCount").toString();
			resultMap.put("Purchase",purchaseCount);
			String redemptionCount = col.get("RedemptionCount").toString();
			resultMap.put("Redemption",redemptionCount);
			
			//TODO 
			resultMap.put("Upfront Commission","-");
			resultMap.put("Trail Commission","-");
			
			
			String amcCount = col.get("AMCCount").toString();
			resultMap.put("AMC",amcCount);
			String productCount = col.get("ProductCount").toString();
			resultMap.put("Products",productCount);
			
		}
		return resultMap;
	}

	@Override
	public List<List<PortFolioProductInfo>> getPortFolioProductInfo(
			int partnerId, int buId, int nodeId) {
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getPartnerTop10Products");
		
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter nodeidParam = new SqlParameter("nodeId", Types.INTEGER);
		
		SqlParameter[] paramArray = {partnerIdParam,nodeidParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partnerId",partnerId);
		paramValues.put("nodeId", nodeId);
		
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<PortFolioProductInfo> list1 = new ArrayList<PortFolioProductInfo>();
		for(Map<String,Object> col : columnList){
			PortFolioProductInfo obj = new PortFolioProductInfo();
			obj.setProductCategory(col.get("ProductName").toString());
			obj.setPurchaseAmount(col.get("Purchase").toString());
			obj.setRedemptionAmount(col.get("Redemption").toString());
			obj.setNetSales(col.get("NetSales").toString());
			obj.setSip(col.get("SIP").toString());
			list1.add(obj);
		}
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<PortFolioProductInfo> list2 = new ArrayList<PortFolioProductInfo>();
		for(Map<String,Object> col : columnList){
			PortFolioProductInfo obj = new PortFolioProductInfo();
			obj.setProductCategory(col.get("ProductType").toString());
			obj.setPurchaseAmount(col.get("Purchase").toString());
			obj.setRedemptionAmount(col.get("Redemption").toString());
			obj.setNetSales(col.get("NetSales").toString());
			obj.setSip(col.get("SIP").toString());
			list2.add(obj);
		}
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		List<PortFolioProductInfo> list3 = new ArrayList<PortFolioProductInfo>();
		for(Map<String,Object> col : columnList){
			PortFolioProductInfo obj = new PortFolioProductInfo();
			obj.setProductCategory(col.get("ProductCategory").toString());
			obj.setPurchaseAmount(col.get("Purchase").toString());
			obj.setRedemptionAmount(col.get("Redemption").toString());
			obj.setNetSales(col.get("NetSales").toString());
			obj.setSip(col.get("SIP").toString());
			list3.add(obj);
		}
		
		List<List<PortFolioProductInfo>> result = new ArrayList<List<PortFolioProductInfo>>();
		result.add(list1);
		result.add(list2);
		result.add(list3);
		return result;
	}
		public Map<String,String> getPartnerAUMMonthWise(int partnerId, int buId,String chartType,int nodeId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_displayFolioBarChart");
		
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter chartTypeParam=new SqlParameter("chartType",Types.VARCHAR);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		
		SqlParameter[] paramArray = {partnerIdParam,chartTypeParam,nodeIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		
		LinkedHashMap <String, Object> paramValues = new LinkedHashMap<String, Object>();
		paramValues.put("partnerId",partnerId);
		paramValues.put("chartType",chartType);
		paramValues.put("nodeId",nodeId);
		Map<String, Object> storedProcResult =  myStoredProcedure.execute(paramValues);
		//System.out.println("storedProcResult 1.1"+storedProcResult);
		List<LinkedHashMap <String,Object>> columnList=(List<LinkedHashMap <String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("storedProcResult 1.1.1"+columnList);
		/*TreeMap<String,String> resultMap = new TreeMap<String,String>();*/
		Map<String,String> resultMap=new LinkedHashMap<>();
		for(LinkedHashMap <String,Object> col : columnList){
			String month = col.get("Key").toString();
			String asset = col.get("Value").toString();
			resultMap.put(month, asset);
				
		}
		//System.out.println("storedProcResult 1.2"+resultMap);
		return resultMap;
		
	}
	
	public Map<String,Map<String,String>> displayFolioPieChart(int partnerId, int buId,int nodeId){
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getPartnerFolioPieChart");
		
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		
		SqlParameter[] paramArray = {partnerIdParam,nodeIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partnerId",partnerId);
		paramValues.put("nodeId",nodeId);
		
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		Map<String,String> subResultMap1 = new HashMap<String,String>();
		Map<String,String> subResultMap2 = new HashMap<String,String>();
		Map<String,Map<String,String>> resultMap=new HashMap<String,Map<String,String>>();
		for(Map<String,Object> col : columnList){
			String key = col.get("Key").toString();
			String value= col.get("Value").toString();
			subResultMap1.put(key, value);
				
		}
		resultMap.put("ProductType",subResultMap1);
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		for(Map<String,Object> col : columnList){
			String key = col.get("Key").toString();
			String value= col.get("Value").toString();
			subResultMap2.put(key, value);
				
		}
		resultMap.put("SubCategory",subResultMap2);
		return resultMap;
	}
	
	
	
	public Map<String,List<ClientPortfolioSummarryData>> getClientPortfolioSummary(int partyId, int buId,int partnerId, int nodeId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientPortFolioSummary");
		Map<String,List<ClientPortfolioSummarryData>> resultMap = new HashMap<String,List<ClientPortfolioSummarryData>>();
		try{
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter partnerIdParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter nodeIdIdParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter[] paramArray = {partyIdParam,partnerIdParam,nodeIdIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partyId",partyId);
		paramValues.put("partnerId",partnerId);
		paramValues.put("nodeId",nodeId);
		
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		
		List<ClientPortfolioSummarryData> summaryList=new ArrayList<ClientPortfolioSummarryData>();
		ClientPortfolioSummarryData summary;
		for(Map<String,Object> col : columnList){
			summary=new ClientPortfolioSummarryData();
			summary.setToatalAssets(col.get("Assets").toString());
			summary.setLiablities(col.get("Liablities").toString());
			summary.setNetWorth(col.get("NetWorth").toString());
			summary.setBankAcs(col.get("BankAccount").toString());
			summary.setDpAcs(col.get("DPAccount").toString());	
			summary.setName(col.get("Name").toString());
			summary.setClientId(col.get("PartyId").toString());
			summaryList.add(summary);							
		}
		resultMap.put("clientportfolioaggregatesummary", summaryList);
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		for(Map<String,Object> col : columnList){
			summary=new ClientPortfolioSummarryData();
			summary.setAssetType(col.get("AssetType").toString());
			summary.setInvestmentValue(col.get("InvestmentCost").toString());
			summary.setCurrentValue(col.get("CurrentCost").toString());
			summary.setNetGainLoss(col.get("NetGainLoss").toString());
			summary.setCagr(col.get("CAGR").toString());			
			summaryList.add(summary);							
		}
		resultMap.put("clientportfoliosummary", summaryList);
		
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
			for(Map<String,Object> col : columnList){
				summary=new ClientPortfolioSummarryData();
				summary.setInvestorName(col.get("Investor").toString());
				summary.setAssetName(col.get("StockName").toString());
				summary.setQuantity(col.get("Quantity").toString());
				summary.setInvestmentValue(col.get("InvestmentValue").toString());
				summary.setCurrentPrice(col.get("CurrentPrice").toString());
				summary.setCurrentPriceDate(col.get("CurrentPriceDate").toString());
				summary.setCurrentValue(col.get("CurrentValue").toString());
				summary.setNetGainLoss(col.get("NetGainLoss").toString());
				summary.setNominationStatus(col.get("NominationStatus").toString());
				summary.setMappedToGoal(col.get("MappedToGoal").toString());
				summary.setGoalAllocationPercent(col.get("Allocation").toString());
				summary.setPartyAssetId(col.get("PartyAssetId").toString());
				//summary.setTransactionDate(col.get("transactionDate").toString());
				//summary.setPurchasePrice(col.get("purchasePrice").toString());
				//summary.setPurchasePrice(String.valueOf(col.get("purchasePrice")));
				summary.setInvestmentDate(col.get("investmentDate").toString());
				summary.setTxnPriceNAV(col.get("txnPriceNAV").toString());
				summary.setTxnAmount(col.get("txnAmount").toString());
				summary.setClientId(col.get("clientId").toString());
				summary.setProductId(col.get("productId").toString());
				summary.setTxnType(col.get("transactionType").toString());
				summaryList.add(summary);							
			}
		
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("stocks", summaryList);
		}
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
			for(Map<String,Object> col : columnList){
				summary=new ClientPortfolioSummarryData();
				summary.setInvestorName(col.get("Investor").toString());
				summary.setAssetName(col.get("SchemeName").toString());
				summary.setTxnType(col.get("TxnType").toString());
				summary.setFolioNo(col.get("FolioNo").toString());
				summary.setQuantity(col.get("UnitsHeld").toString());
				summary.setInvestmentValue(col.get("InvestmentValue").toString());
				//summary.setCurrentPrice(col.get("NAV").toString());
				summary.setCurrentPrice(String.valueOf(col.get("NAV")));
				summary.setCurrentPriceDate(col.get("NAVDate").toString());
				summary.setNetGainLoss(col.get("NetGainLoss").toString());
				summary.setCurrentValue(col.get("CurrentValue").toString());
				summary.setCagr(col.get("CAGR").toString());
				summary.setNominationStatus(col.get("NominationStatus").toString());
				summary.setMappedToGoal(col.get("MappedToGoal").toString());
				summary.setGoalAllocationPercent(col.get("Allocation").toString());
				summary.setPartyAssetId(col.get("PartyAssetId").toString());
				//summary.setTransactionDate(col.get("transactionDate").toString());
				//summary.setPurchasePrice(String.valueOf(col.get("purchasePrice")));
				summaryList.add(summary);											
			}
		
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("mf", summaryList);
		}
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
			for(Map<String,Object> col : columnList){
				summary=new ClientPortfolioSummarryData();
				summary.setInvestorName(col.get("Investor").toString());
				summary.setAssetName(col.get("SchemeName").toString());
				summary.setTxnType(col.get("TxnType").toString());
				summary.setFolioNo(col.get("policyNo").toString());
				summary.setQuantity(col.get("UnitsHeld").toString());
				summary.setInvestmentValue(col.get("InvestmentValue").toString());
				summary.setCurrentPrice(col.get("NAV").toString());
				summary.setCurrentPriceDate(col.get("NAVDate").toString());
				summary.setNetGainLoss(col.get("NetGainLoss").toString());
				summary.setCurrentValue(col.get("CurrentValue").toString());
				summary.setCagr(col.get("CAGR").toString());
				summary.setNominationStatus(col.get("NominationStatus").toString());
				summary.setMappedToGoal(col.get("MappedToGoal").toString());
				summary.setGoalAllocationPercent(col.get("Allocation").toString());
				summary.setPartyAssetId(col.get("PartyAssetId").toString());
				summary.setTransactionDate(col.get("transactionDate").toString());
				summary.setPurchasePrice(String.valueOf(col.get("purchasePrice")));
				summary.setTxnAmount(col.get("txnAmount").toString());
				summary.setClientId(col.get("clientId").toString());
				summary.setProductId(col.get("productId").toString());
				
				summaryList.add(summary);											
			}
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("ulip", summaryList);
		}
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-6");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
		for(Map<String,Object> col : columnList){
			summary=new ClientPortfolioSummarryData();
			summary.setInvestorName(col.get("Investor").toString());
			summary.setAssetName(col.get("Name").toString());
			summary.setType(col.get("Type").toString());
			summary.setInvestmentValue(col.get("InvestmentAmount").toString());
			summary.setInvestmentDate(col.get("InvestmentDate").toString());
			summary.setInterestRate(col.get("InterestRate").toString());
			summary.setInvestmentPeriod(col.get("InvestmentPeriod").toString());
			summary.setMaturityValue(col.get("MaturityValue").toString());
			summary.setMaturityDate(col.get("MaturityDate").toString());
			summary.setCurrentValue(col.get("CurrentValue").toString());
			summary.setNominationStatus(col.get("NominationStatus").toString());
			summary.setMappedToGoal(col.get("MappedToGoal").toString());
			summary.setGoalAllocationPercent(col.get("Allocation").toString());
			summary.setPartyAssetId(col.get("PartyAssetId").toString());
			summaryList.add(summary);											
			
		}
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("fd", summaryList);
		}
		
		
		/*columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-7");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
			for(Map<String,Object> col : columnList){
			summary=new ClientPortfolioSummarryData();
			summary.setAssetName(col.get("Name").toString());
			summary.setType(col.get("Type").toString());
			summary.setInvestmentValue(col.get("InvestmentAmount").toString());
			summary.setInvestmentDate(col.get("InvestmentDate").toString());
			summary.setInterestRate(col.get("InterestRate").toString());
			summary.setInvestmentPeriod(col.get("InvestmentPeriod").toString());
			summary.setMaturityValue(col.get("MaturityValue").toString());
			summary.setMaturityDate(col.get("MaturityDate").toString());
			summary.setCurrentValue(col.get("CurrentValue").toString());
			summary.setNominationStatus(col.get("NominationStatus").toString());
			summary.setMappedToGoal(col.get("MappedToGoal").toString());
			summary.setGoalAllocationPercent(col.get("Allocation").toString());
			summary.setPartyAssetId(col.get("PartyAssetId").toString());
			summaryList.add(summary);									
		}
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("postOffice", summaryList);
		}*/
		
		
		/*columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-8");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
		for(Map<String,Object> col : columnList){
			summary=new ClientPortfolioSummarryData();
			summary.setAssetName(col.get("Name").toString());
			summary.setType(col.get("Type").toString());
			summary.setInvestmentValue(col.get("InvestmentAmount").toString());
			summary.setInvestmentDate(col.get("InvestmentDate").toString());
			summary.setInterestRate(col.get("InterestRate").toString());
			summary.setInvestmentPeriod(col.get("InvestmentPeriod").toString());
			summary.setMaturityValue(col.get("MaturityValue").toString());
			summary.setMaturityDate(col.get("MaturityDate").toString());
			summary.setCurrentValue(col.get("CurrentValue").toString());
			summary.setNominationStatus(col.get("NominationStatus").toString());
			summary.setMappedToGoal(col.get("MappedToGoal").toString());
			summary.setGoalAllocationPercent(col.get("Allocation").toString());
			summary.setPartyAssetId(col.get("PartyAssetId").toString());
			summaryList.add(summary);							
		}
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("retirement", summaryList);
		}*/
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-7");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
		for(Map<String,Object> col : columnList){
			summary=new ClientPortfolioSummarryData();
			summary.setInvestorName(col.get("Investor").toString());
			summary.setAssetName(col.get("SchemeName").toString());
			//summary.setTxnType(col.get("TxnType").toString());
			//summary.setFolioNo(col.get("FolioNo").toString());
			//summary.setQuantity(col.get("UnitsHeld").toString());
			summary.setInvestmentValue(col.get("InvestmentValue").toString());
			//summary.setCurrentPrice(col.get("NAV").toString());
			//summary.setCurrentPriceDate(col.get("NAVDate").toString());
			//summary.setNetGainLoss(col.get("NetGainLoss").toString());
			summary.setCurrentValue(col.get("CurrentValue").toString());
			//summary.setCagr(col.get("CAGR").toString());
			summary.setNominationStatus(col.get("NominationStatus").toString());
			summary.setMappedToGoal(col.get("MappedToGoal").toString());
			summary.setGoalAllocationPercent(col.get("Allocation").toString());
			summary.setPartyAssetId(col.get("PartyAssetId").toString());
			summary.setInvestmentDate(col.get("investmentDate").toString());
			summary.setClientId(col.get("clientId").toString());
			summary.setTxnType(col.get("transactionType").toString());
			summaryList.add(summary);										
		}
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("gold", summaryList);
		}
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-8");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		try{
		for(Map<String,Object> col : columnList){
			summary=new ClientPortfolioSummarryData();
			summary.setAssetName(col.get("PropertyName").toString());
			//summary.setPropertyLocation(col.get("Location").toString());
			//summary.setPropertyArea(col.get("Area").toString());
			//summary.setPurchaseRate(col.get("Rate").toString());
			summary.setInvestmentDate(col.get("PurchaseDate").toString());
			summary.setInvestmentValue(col.get("PurchasePrice").toString());
			//summary.setCurrentPrice(col.get("CurrentRate").toString());
			summary.setCurrentValue(col.get("CurrentValue").toString());			
			summary.setNetGainLoss(col.get("NetGainLoss").toString());
			//summary.setCagr(col.get("CAGR").toString());
			summary.setMappedToGoal(col.get("MappedToGoal").toString());
			summary.setGoalAllocationPercent(col.get("Allocation").toString());
			summary.setPartyAssetId(col.get("PartyAssetId").toString());
			summary.setNominationStatus(col.get("NominationStatus").toString());
			summary.setClientId(col.get("clientId").toString());
			summary.setTxnType(col.get("transactionType").toString());
			summaryList.add(summary);							
		}
		}catch(Exception e){
			logger.info(e.getMessage());
		} finally{
			resultMap.put("property", summaryList);
		}
		
		//TODO : just to get the party Id on UI this result set is addded. Need to write a new method in DAO to return a partyId.
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-9");
		summaryList=new ArrayList<ClientPortfolioSummarryData>();
		Map<String, Object> col = columnList.get(0);
		String clientId = col.get("partyId").toString();	
		summary=new ClientPortfolioSummarryData();
		summary.setClientId(clientId);
		summaryList.add(summary);
		resultMap.put("partyId", summaryList);
		}catch(Exception e){
			logger.info(e.getMessage());
		}finally{
			return resultMap;
		}
		
		
	}

	@Override
	public Map<String,List<Map<String,String>>> getClientPortFolioTransactions(int buId,
			int partyAssetId) {
		
		 Map<String,List<Map<String,String>>>  result = new HashMap();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientPortFolioTxn");
		
		SqlParameter partyAssetIdParam = new SqlParameter("partyAssetId", Types.INTEGER);
		SqlParameter[] paramArray = {partyAssetIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partyAssetId",partyAssetId);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String,String>> transactionSummary = new ArrayList<>();
		for(Map<String,Object> col : columnList){
			Map<String,String> map = new HashMap<String,String>();
			map.put("assetName", col.get("assetName").toString());
			map.put("currentValue", col.get("currentValue").toString());
			map.put("allocatedValue", col.get("allocatedValue").toString());
			map.put("availableValue", col.get("availableValue").toString());
			map.put("assetType", "");
			
			transactionSummary.add(map);
			
		}
		result.put("transactionSummary", transactionSummary);
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String,String>> transactionTableSummary = new ArrayList<>();
		for(Map<String,Object> col : columnList){
			Map<String,String> map = new HashMap<String,String>();
			map.put("txnDate", col.get("txnDate").toString());
			map.put("txnType", col.get("txnType").toString());
			map.put("txnAmount", col.get("txnAmount").toString());
			map.put("units", col.get("units").toString());
			map.put("txnPrice", col.get("txnPrice").toString());
			transactionTableSummary.add(map);
			
		}
		result.put("transactionTableSummary", transactionTableSummary);
		
		
		
		
		return result;
	}
	@Override
	public Map<String,List<Map<String,String>>> getClientPortFolioGoalMapping(int buId,
			int partyAssetId) {
		
		 Map<String,List<Map<String,String>>>  result = new HashMap();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientPortfolioGoalMapping");
		
		SqlParameter partyAssetIdParam = new SqlParameter("partyAssetId", Types.INTEGER);
		SqlParameter[] paramArray = {partyAssetIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partyAssetId",partyAssetId);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String,String>> transactionSummary = new ArrayList<>();
		for(Map<String,Object> col : columnList){
			Map<String,String> map = new HashMap<String,String>();
			map.put("assetName", col.get("assetName").toString());
			map.put("currentValue", col.get("currentValue").toString());
			map.put("allocatedValue", col.get("allocatedValue").toString());
			map.put("availableValue", col.get("availableValue").toString());
			map.put("assetType", "");
			
			transactionSummary.add(map);
			
		}
		result.put("transactionSummary", transactionSummary);
		
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String,String>> goalSummary = new ArrayList<>();
		for(Map<String,Object> col : columnList){
			Map<String,String> map = new HashMap<String,String>();
			map.put("goalId", col.get("GoalId").toString());
			map.put("goalType", col.get("GoalType").toString());
			map.put("goalName", col.get("GoalName").toString());
			map.put("goalValue", col.get("GoalValue").toString());
			map.put("goalYear", col.get("GoalYear").toString());
			map.put("goalCurrentAmount", col.get("GoalCurrentAmount").toString());
			map.put("assetList", col.get("AllocatedAssetList").toString());
			map.put("allocate", col.get("IsAllocated").toString());
			map.put("allocationPercent", col.get("AllocationPercent").toString());
			goalSummary.add(map);
			
		}
		result.put("goalSummary", goalSummary);
		
		
		
		
		return result;
	}
	public void updateGoalMapping(int buId,GoalData[] goaldData,int createdBy,int partyAssetId){
		// TODO Auto-generated method stub
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_updateGoalMapping");
		SqlParameter xmlString = new SqlParameter("xmlString", Types.VARCHAR);
		
		SqlParameter createdByParam=new  SqlParameter("createdBy",Types.INTEGER);
		SqlParameter partyAssetIdParam=new  SqlParameter("partyAssetId",Types.INTEGER);
		
		SqlParameter[] paramArray = {xmlString,createdByParam,partyAssetIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("xmlString",xmlTransaltor.toXMLString(goaldData));
		
		paramValues.put("createdBy",createdBy);
		paramValues.put("partyAssetId", partyAssetId);
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	
		
		//System.out.println("xmlTransaltor::::::xml:"+xmlTransaltor.toXMLString(goaldData));

	}
	@Override
	public List<NomineeData> getClientPortFolioNominations(int buId,
			int partyAssetId) {
		
		List<NomineeData>  result = new ArrayList<NomineeData>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientPortfolioNominations");
		
		SqlParameter partyAssetIdParam = new SqlParameter("partyAssetId", Types.INTEGER);
		SqlParameter[] paramArray = {partyAssetIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partyAssetId",partyAssetId);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String,Object> col : columnList){
			NomineeData nominee=new NomineeData();
			nominee.setFolioNo(col.get("FolioNo").toString());
			nominee.setName(col.get("Name").toString());
			nominee.setRelationship(col.get("Relationship").toString());
			nominee.setDob(col.get("DOB").toString());
			nominee.setComments(col.get("Comment").toString());
			nominee.setPartyId(Integer.parseInt(col.get("PartyId").toString()));
			/*nominee.setState(col.get("state").toString());
			nominee.setCity(col.get("city").toString());
			nominee.setCountry(col.get("country").toString());*/
			result.add(nominee);
		}
		return result;
	}	
	public void updateFolioNominations(int buId,NomineeData nominee,int createdBy,String folioNo, int partyId,int partnerId,int clientId,int partyAssetId){
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		//System.out.println("xmlTransaltor::::::xml:"+xmlTransaltor.toXMLString(nominee));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_updateFolioNominations");
		SqlParameter xmlString = new SqlParameter("xmlString", Types.VARCHAR);
		
		SqlParameter createdByParam=new  SqlParameter("createdBy",Types.INTEGER);
		/*SqlParameter partyIdParam=new  SqlParameter("folioNo",Types.VARCHAR);
		SqlParameter folioNoParam=new  SqlParameter("nomineePartyId",Types.INTEGER);*/
		SqlParameter folioNoParam=new  SqlParameter("folioNo",Types.VARCHAR);
		SqlParameter partyIdParam=new  SqlParameter("nomineePartyId",Types.INTEGER);
		SqlParameter partnerIdParam=new  SqlParameter("partnerId",Types.INTEGER);
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.INTEGER);
		SqlParameter partyAssetIdParam=new  SqlParameter("partyAssetId",Types.INTEGER);
		
		SqlParameter[] paramArray = {xmlString,createdByParam,folioNoParam,partyIdParam,partnerIdParam,clientIdParam,partyAssetIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("xmlString",xmlTransaltor.toXMLString(nominee));
		
		paramValues.put("createdBy",createdBy);
		paramValues.put("folioNo", folioNo);
		paramValues.put("nomineePartyId", partyId);
		paramValues.put("partnerId", partnerId);
		paramValues.put("clientId", clientId);
		paramValues.put("partyAssetId", partyAssetId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	
		
		

	}

	@Override
	public void deleteFolioNominations(int buId, int createdBy,
			String commaSeperatedList) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_deleteFolioNominations");
		
		SqlParameter createdByParam=new  SqlParameter("createdBy",Types.INTEGER);
		SqlParameter nomineeIdsParam=new  SqlParameter("nomineePartyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {createdByParam,nomineeIdsParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("createdBy",createdBy);
		paramValues.put("nomineePartyId",commaSeperatedList);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		
		//return "success";
	}

	@Override
	public NomineeData getNomineeDataByPartyId(int buId, int partyId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getFolioNomineeDetails");
		
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("partyId",partyId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		NomineeData nominee=new NomineeData();
		for(Map<String,Object> col : columnList){
			nominee.setName(col.get("Name").toString());
			nominee.setRelationship(col.get("Relationship").toString());
			nominee.setDob(col.get("DOB").toString());
			nominee.setCity(col.get("City").toString());
			nominee.setState(col.get("State").toString());
			nominee.setAddress(col.get("Address").toString());
			nominee.setCountry(col.get("country").toString());
		}
		return nominee;
	}

	/**
	 * @see FolioDao#getClientStockDetailsForAddEditForm(int)
	 */

	@Override
	public Map<String, List<Map<String, String>>> getClientStockDetailsForAddEditForm(
			int buId, int partyId) {
		Map<String, List<Map<String , String>>> resultMap = new HashMap<String, List<Map<String,String>>>();
		try{
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientStocksDetailsForAddEditForm");
		
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("partyId",partyId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String , String>> transactionTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> transactionType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			transactionType.put("name", name);
			transactionType.put("key", key);
			transactionTypeList.add(transactionType);
		}
		resultMap.put("transactionType", transactionTypeList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String , String>> exchangeTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> exchangeType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			exchangeType.put("name", name);
			exchangeType.put("key", key);
			exchangeTypeList.add(exchangeType);
		}
		resultMap.put("exchangeType", exchangeTypeList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		List<Map<String , String>> dMatAccounts = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> dMatAcc = new HashMap<String, String>();
			String name = col.get("accountNumber").toString();
			String key = name;
			dMatAcc.put("name", name);
			dMatAcc.put("key", key);
			dMatAccounts.add(dMatAcc);
		}
		resultMap.put("dMatAccounts", dMatAccounts);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		List<Map<String , String>> investorNames = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> invName = new HashMap<String, String>();
			String name = col.get("InvestorName").toString();
			String key = col.get("PartyID").toString();
			invName.put("name", name);
			invName.put("key", key);
			investorNames.add(invName);
		}
		resultMap.put("investorNames", investorNames);
		}catch(Exception e){
			
		}
		return resultMap;
	}
	public void addEntryForStock(int buId,int createdBy,int clientId,StockPortfolioData stockPortfolioData){
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		//System.out.println("xmString:--"+xmlTransaltor.toXMLString(stockPortfolioData));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_addEntryForStock");
		
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		
		
		SqlParameter[] paramArray = {clientIdParam,xmlStrParam,createdIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("clientId",clientId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(stockPortfolioData));
		paramValues.put("createdBy",createdBy);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
	}

	@Override
	public Map<String, String> getAssetForAddEditForm(int buId ,String searchType,
			String searchString, int mfAMCId, int clientPartyId) {
		Map<String, String> result = new HashMap<String ,String>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAssetsForAddEditForm");
		
		SqlParameter searchTypeParam=new  SqlParameter("searchType",Types.VARCHAR);
		SqlParameter searchStringParam=new  SqlParameter("searchString",Types.VARCHAR);
		SqlParameter mfAMCIdParam=new  SqlParameter("mfAMCId",Types.INTEGER);
		SqlParameter clientPartyIdParam = new SqlParameter("clientPartyId",Types.INTEGER);
		
		SqlParameter[] paramArray = {searchTypeParam, searchStringParam, mfAMCIdParam,clientPartyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("searchType",searchType);
		paramValues.put("searchString",searchString);
		paramValues.put("mfAMCId",mfAMCId);
		paramValues.put("clientPartyId", clientPartyId);
		
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String, Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		for(Map<String,Object> col : columnList){
			String productId = col.get("productId").toString();
			String productName = col.get("productName").toString();
			result.put(productId, productName);
		}
		return result;
	}
	public Map<String, List<Map<String, String>>> getClientMFDetailsForAddEditForm(int buId, int partyId){
		Map<String, List<Map<String , String>>> resultMap = new HashMap<String, List<Map<String,String>>>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientMFDetailsForAddEditForm");
		
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("partyId",partyId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String , String>> transactionTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> transactionType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			transactionType.put("name", name);
			transactionType.put("key", key);
			transactionTypeList.add(transactionType);
		}
		resultMap.put("transactionType", transactionTypeList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String , String>> folioNoList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> folioNo = new HashMap<String, String>();
			String name = col.get("FolioNo").toString();
			String key =name;
			folioNo.put("name", name);
			folioNo.put("key", key);
			folioNoList.add(folioNo);
		}
		resultMap.put("folioNo", folioNoList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		List<Map<String , String>> sipFreequencyList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> sipFreequency = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			sipFreequency.put("name", name);
			sipFreequency.put("key", key);
			sipFreequencyList.add(sipFreequency);
		}
		resultMap.put("sipFrequency", sipFreequencyList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		List<Map<String , String>> investorNames = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> invName = new HashMap<String, String>();
			String name = col.get("InvestorName").toString();
			String key = col.get("PartyID").toString();
			invName.put("name", name);
			invName.put("key", key);
			investorNames.add(invName);
		}
		resultMap.put("investorNames", investorNames);
		
		}catch(Exception e){
		
		}
		return resultMap;

	}

	/**
	 * @see FolioDao#addEntryForMF(int, int, int, MFPortfolioData)
	 */
	@Override
	public void addEntryForMF(int buId, int createdBy, int clientId,int pmTxnID,
			MFPortfolioData mfPortfolioData) {

		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		//System.out.println("xmString:--"+xmlTransaltor.toXMLString(mfPortfolioData));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_addEntryForMF");
		
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		SqlParameter pmTxnIdParam=new  SqlParameter("pmTxnID",Types.VARCHAR);
		
		SqlParameter[] paramArray = {clientIdParam,xmlStrParam,createdIdParam,pmTxnIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("clientId",clientId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(mfPortfolioData));
		paramValues.put("createdBy",createdBy);
		paramValues.put("pmTxnID", pmTxnID);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	}
	public Map<String, List<Map<String, String>>> getClientULIPDetailsForAddEditForm(int buId, int partyId){
		Map<String, List<Map<String , String>>> resultMap = new HashMap<String, List<Map<String,String>>>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientULIPDetailsForAddEditForm");
		
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("partyId",partyId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String , String>> transactionTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> transactionType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			transactionType.put("name", name);
			transactionType.put("key", key);
			transactionTypeList.add(transactionType);
		}
		resultMap.put("transactionType", transactionTypeList);	
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String , String>> investorNames = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> invName = new HashMap<String, String>();
			String name = col.get("InvestorName").toString();
			String key = col.get("PartyID").toString();
			invName.put("name", name);
			invName.put("key", key);
			investorNames.add(invName);
		}
		resultMap.put("investorNames", investorNames);
		
		}catch(Exception e){
			
		}
		return resultMap;
	}
	@Override
	public void addEntryForULIP(int buId, int createdBy, int clientId,
			PortfolioData ulipPortfolioData) {

		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		//System.out.println("xmString:--"+xmlTransaltor.toXMLString(ulipPortfolioData));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_addEntryForULIP");
		
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		
		
		SqlParameter[] paramArray = {clientIdParam,xmlStrParam,createdIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("clientId",clientId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(ulipPortfolioData));
		paramValues.put("createdBy",createdBy);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	}
	public Map<String, List<Map<String, String>>> getClientFIDetailsForAddEditForm(int buId, int partyId){
		Map<String, List<Map<String , String>>> resultMap = new HashMap<String, List<Map<String,String>>>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientFixedIncomeDetailsForAddEditForm");
		
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("partyId",partyId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String , String>> transactionTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> transactionType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			transactionType.put("name", name);
			transactionType.put("key", key);
			transactionTypeList.add(transactionType);
		}
		resultMap.put("transactionType", transactionTypeList);			
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String , String>> depositTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> desositType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			desositType.put("name", name);
			desositType.put("key", key);
			depositTypeList.add(desositType);
		}
		resultMap.put("depositType", depositTypeList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		List<Map<String , String>> interestFrequencyList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> interestFrequency = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			interestFrequency.put("name", name);
			interestFrequency.put("key", key);
			interestFrequencyList.add(interestFrequency);
		}
		resultMap.put("interestFrequency", interestFrequencyList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		List<Map<String , String>> interestPayoutFrequencyList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> interestPayoutFrequency = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			interestPayoutFrequency.put("name", name);
			interestPayoutFrequency.put("key", key);
			interestPayoutFrequencyList.add(interestPayoutFrequency);
		}
		resultMap.put("interestPayoutFrequency", interestPayoutFrequencyList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		List<Map<String , String>> payoutOptionList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> payoutOption = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			payoutOption.put("name", name);
			payoutOption.put("key", key);
			payoutOptionList.add(payoutOption);
		}
		resultMap.put("payoutOption", payoutOptionList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-6");
		List<Map<String , String>> installmentFrequencyList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> installmentFrequency = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			installmentFrequency.put("name", name);
			installmentFrequency.put("key", key);
			installmentFrequencyList.add(installmentFrequency);
		}
		resultMap.put("installmentFrequency", installmentFrequencyList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-7");
		List<Map<String , String>> investorNames = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> invName = new HashMap<String, String>();
			String name = col.get("InvestorName").toString();
			String key = col.get("PartyID").toString();
			invName.put("name", name);
			invName.put("key", key);
			investorNames.add(invName);
		}
		resultMap.put("investorNames", investorNames);
		}catch(Exception e){
			
		}
		return resultMap;
	}
	@Override
	public void addEntryForFI(int buId, int createdBy, int clientId,
			FixedIncomePortfolioData fiPortfolioData) {

		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		//System.out.println("xmString:--"+xmlTransaltor.toXMLString(fiPortfolioData));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_addEntryForFixedIncome");
		
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		
		
		SqlParameter[] paramArray = {clientIdParam,xmlStrParam,createdIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("clientId",clientId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(fiPortfolioData));
		paramValues.put("createdBy",createdBy);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	}

	
	@Override
	public List<ContactData> getAMCList(int buId,int clientPartyId) {
		List<ContactData> contactList=new ArrayList<ContactData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAMCListForClientPortFolio");
		SqlParameter clientPartyIdParam = new SqlParameter("clientPartyId", Types.INTEGER);
		SqlParameter[] paramArray = {clientPartyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("clientPartyId",clientPartyId);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paranValues);

		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ContactData contactData=null;
		for(Map<String, Object> row:l){
			contactData=new ContactData();
			contactData.setPartyId((int)row.get("PartyId"));
			contactData.setlName((String)row.get("lName"));
			contactList.add(contactData);
		
	}
	
		return contactList;
	}

	@Override
	public List<ContactData> getPortfolioClientList(int buId, int partnerId,
			int nodeId) {
		List<ContactData> contactList=new ArrayList<ContactData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getAllClientPortfolioList");
		SqlParameter partnerParam = new SqlParameter("partnerId", Types.INTEGER);
		SqlParameter nodeidParam = new SqlParameter("nodeId", Types.INTEGER);
		SqlParameter[] paramArray = {partnerParam,nodeidParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partnerId",partnerId);
		paranValues.put("nodeId", nodeId);
		//System.out.println("paranValues:--"+paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		ContactData contactData=null;
		for(Map<String, Object> row:l){
			contactData=new ContactData();
			contactData.setPartyId((int)row.get("PartyId"));
			/*contactData.setfName((String)row.get("fName"));
			contactData.setlName((String)row.get("lName"));*/
			contactData.setName((String)row.get("name"));
			contactList.add(contactData);
		
	}
	
		return contactList;
	}

	@Override
	public Map<String, List<Map<String, String>>> getClientPropertyDetailsForAddEditForm(
			int buId, int partyId) {
		Map<String, List<Map<String , String>>> resultMap = new HashMap<String, List<Map<String,String>>>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientPropertyDetailsForAddEditForm");
		
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("partyId",partyId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String , String>> transactionTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> transactionType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			transactionType.put("name", name);
			transactionType.put("key", key);
			transactionTypeList.add(transactionType);
		}
		resultMap.put("transactionType", transactionTypeList);			
		
		/*columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String , String>> depositTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> desositType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			desositType.put("name", name);
			desositType.put("key", key);
			depositTypeList.add(desositType);
		}
		resultMap.put("depositType", depositTypeList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		List<Map<String , String>> interestFrequencyList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> interestFrequency = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			interestFrequency.put("name", name);
			interestFrequency.put("key", key);
			interestFrequencyList.add(interestFrequency);
		}
		resultMap.put("interestFrequency", interestFrequencyList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		List<Map<String , String>> interestPayoutFrequencyList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> interestPayoutFrequency = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			interestPayoutFrequency.put("name", name);
			interestPayoutFrequency.put("key", key);
			interestPayoutFrequencyList.add(interestPayoutFrequency);
		}
		resultMap.put("interestPayoutFrequency", interestPayoutFrequencyList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		List<Map<String , String>> payoutOptionList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> payoutOption = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			payoutOption.put("name", name);
			payoutOption.put("key", key);
			payoutOptionList.add(payoutOption);
		}
		resultMap.put("payoutOption", payoutOptionList);
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-6");
		List<Map<String , String>> installmentFrequencyList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> installmentFrequency = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			installmentFrequency.put("name", name);
			installmentFrequency.put("key", key);
			installmentFrequencyList.add(installmentFrequency);
		}
		resultMap.put("installmentFrequency", installmentFrequencyList);*/
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String , String>> investorNames = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> invName = new HashMap<String, String>();
			String name = col.get("InvestorName").toString();
			String key = col.get("PartyID").toString();
			invName.put("name", name);
			invName.put("key", key);
			investorNames.add(invName);
		}
		resultMap.put("investorNames", investorNames);
		}catch(Exception e){
			
		}
		return resultMap;
	}
	
	@Override
	public void addEntryForProperty(int buId, int createdBy, int clientId,
			PortfolioData propertyPortfolioData) {

		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		//System.out.println("xmString:--"+xmlTransaltor.toXMLString(fiPortfolioData));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_addEntryForProperty");
		
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		
		
		SqlParameter[] paramArray = {clientIdParam,xmlStrParam,createdIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("clientId",clientId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(propertyPortfolioData));
		paramValues.put("createdBy",createdBy);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
	}

	@Override
	public Map<String, List<Map<String, String>>> getClientGoldDetailsForAddEditForm(
			int buId, int partyId) {
		Map<String, List<Map<String , String>>> resultMap = new HashMap<String, List<Map<String,String>>>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientGoldDetailsForAddEditForm");
		
		SqlParameter partyIdParam=new  SqlParameter("partyId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("partyId",partyId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		List<Map<String,Object>> columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<Map<String , String>> transactionTypeList = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> transactionType = new HashMap<String, String>();
			String name = col.get("codeValue").toString();
			String key = col.get("codeValueId").toString();
			transactionType.put("name", name);
			transactionType.put("key", key);
			transactionTypeList.add(transactionType);
		}
		resultMap.put("transactionType", transactionTypeList);			
		
		columnList=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<Map<String , String>> investorNames = new ArrayList<Map<String , String>>(); 
		for(Map<String,Object> col : columnList){
			Map<String, String> invName = new HashMap<String, String>();
			String name = col.get("InvestorName").toString();
			String key = col.get("PartyID").toString();
			invName.put("name", name);
			invName.put("key", key);
			investorNames.add(invName);
		}
		resultMap.put("investorNames", investorNames);
		}catch(Exception e){
			
		}
		return resultMap;
	}

	@Override
	public void addEntryForGold(int buId, int createdBy, int clientId,
			PortfolioData goldPortfolioData) {
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		//System.out.println("xmString:--"+xmlTransaltor.toXMLString(fiPortfolioData));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_addEntryForGold");
		
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		
		
		SqlParameter[] paramArray = {clientIdParam,xmlStrParam,createdIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("clientId",clientId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(goldPortfolioData));
		paramValues.put("createdBy",createdBy);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
	}

	@Override
	public void deleteClientTransaction(int buId, int createdBy,int clientId,
			StockPortfolioData stockPortfolioData) {
		XStreamTranslator xmlTransaltor=XStreamTranslator.getInstance();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_addEntryForStock");
		
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.VARCHAR);
		SqlParameter xmlStrParam=new  SqlParameter("xmlStr",Types.VARCHAR);
		SqlParameter createdIdParam=new  SqlParameter("createdBy",Types.VARCHAR);
		
		
		SqlParameter[] paramArray = {clientIdParam,xmlStrParam,createdIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("clientId",clientId);
		paramValues.put("xmlStr",xmlTransaltor.toXMLString(stockPortfolioData));
		paramValues.put("createdBy",createdBy);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
	}
	
	@Override
	public List<MFPortfolioData> getClientMFTransactionDetailst(int partnerId,int partyAssetId,int clientId,
			String amc, String productId, int txnType, String startDate, String endDate) {
		// TODO Auto-generated method stub
		List<MFPortfolioData> contactList=new ArrayList<MFPortfolioData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		//jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientMFTransactionDetails");
		SqlParameter partnerIdParam=new  SqlParameter("partnerId",Types.INTEGER);
		SqlParameter partyAssetIdParam=new  SqlParameter("partyAssetId",Types.INTEGER);
		SqlParameter clientIdParam=new  SqlParameter("clientId",Types.INTEGER);
		SqlParameter amcParam=new  SqlParameter("amc",Types.VARCHAR);
		SqlParameter productIdParam=new  SqlParameter("productId",Types.VARCHAR);
		SqlParameter txnTypeParam=new  SqlParameter("txnType",Types.INTEGER);
		SqlParameter startDateParam=new  SqlParameter("startDate",Types.VARCHAR);
		SqlParameter endDateParam=new  SqlParameter("endDate",Types.VARCHAR);
		SqlParameter[] paramArray = {partnerIdParam,partyAssetIdParam,clientIdParam,amcParam,productIdParam,txnTypeParam,startDateParam,endDateParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partnerId",partnerId);
		paranValues.put("partyAssetId",partyAssetId);
		paranValues.put("clientId",clientId);
		paranValues.put("amc",amc);
		paranValues.put("productId",productId);
		paranValues.put("txnType",txnType);
		paranValues.put("startDate",startDate);
		paranValues.put("endDate",endDate);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paranValues);

		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		MFPortfolioData contactData=null;
		for(Map<String, Object> row:l){
			contactData=new MFPortfolioData();
		//	contactData.setClientId((int)row.get("clientId"));
			contactData.setPmTxnId((int)row.get("pmTxnId"));
			contactData.setClientName((String)row.get("clientName"));
			contactData.setPartyAssetId((String)row.get("partyAssetId"));
			contactData.setFolioNumber((String)row.get("folioNumber"));
			contactData.setProductId((String)row.get("productId"));
			contactData.setProductName((String)row.get("productName"));
			contactData.setStartDate((String)row.get("startDate"));
			contactData.setTxnTypeId((int)row.get("txnTypeId"));
			contactData.setTxnType((String)row.get("txnType"));
			contactData.setTxnAmount((String)row.get("txnAmount"));
			contactData.setTxtUnitQty((String)row.get("txtUnitQty"));
			contactData.setAmc((String)row.get("amc"));
			contactData.setClientId((int)row.get("clientId"));
			contactData.setTxtPriceNav((String)row.get("txtPriceNav"));
		
			
			contactList.add(contactData);
		
	}
	
		return contactList;

	}

	@Override
	public void deleteClientMFTransaction(int buId, int createdBy, int pmTxnId) {
		// TODO Auto-generated method stub
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientMFDeleteTransaction");
		
		SqlParameter createdByParam=new  SqlParameter("createdBy",Types.INTEGER);
		SqlParameter pmTxnIdParam=new  SqlParameter("pmTxnId",Types.VARCHAR);
		
		SqlParameter[] paramArray = {createdByParam,pmTxnIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		
		paramValues.put("createdBy",createdBy);
		paramValues.put("pmTxnId",pmTxnId);
		
		//System.out.println("paramValues:--"+paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		
		
		//return "success";
	}

	@Override
	public List<MFPortfolioData> getSelectedCMFTransaction(int buId, int pmTxnId) {
		// TODO Auto-generated method stub
		List<MFPortfolioData> contactList=new ArrayList<MFPortfolioData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		//jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getClientMFTransactionEditDetails");
		SqlParameter pmTxnIdParam=new  SqlParameter("pmTxnId",Types.INTEGER);
	
		SqlParameter[] paramArray = {pmTxnIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("pmTxnId",pmTxnId);
		
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paranValues);

		l=(List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		MFPortfolioData contactData=null;
		for(Map<String, Object> row:l){
			contactData=new MFPortfolioData();
		//	contactData.setClientId((int)row.get("clientId"));
			contactData.setPmTxnId((int)row.get("pmTxnId"));
			contactData.setClientName((String)row.get("clientName"));
			contactData.setPartyAssetId((String)row.get("partyAssetId"));
			contactData.setFolioNumber((String)row.get("folioNumber"));
			contactData.setProductId((String)row.get("productId"));
			contactData.setProductName((String)row.get("productName"));
			contactData.setStartDate((String)row.get("startDate"));
			contactData.setTxnTypeId((int)row.get("txnTypeId"));
			contactData.setTxnType((String)row.get("txnType"));
			contactData.setTxnAmount((String)row.get("txnAmount"));
			contactData.setTxtUnitQty((String)row.get("txtUnitQty"));
			contactData.setAmc((String)row.get("amc"));
			contactData.setClientId((int)row.get("clientId"));
			contactData.setTxtPriceNav((String)row.get("txtPriceNav"));
			contactData.setAmcId((int)row.get("amcid"));
			contactData.setSipStartDate((String)row.get("sipStartDate"));
			contactData.setSipEndDate((String)row.get("sipEndDate"));
			contactData.setSipAmount((String)row.get("sipAmount"));
			contactData.setSipFrequency((String)row.get("sipFrequency"));
			contactData.setSipFrequencyId((int)row.get("sipFrequencyId"));
		
			
			contactList.add(contactData);
			

	}
		return contactList;
	}
}
