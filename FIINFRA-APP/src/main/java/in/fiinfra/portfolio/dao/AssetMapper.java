package in.fiinfra.portfolio.dao;


import in.fiinfra.common.utility.GoalData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.financial.dao.BasicDbMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 public class AssetMapper extends BasicDbMapper<List<AssetData>>{
	 

	@Override
	protected List<AssetData> doMap(ResultSet rs) throws SQLException {
		Map<Integer,AssetData> map = new HashMap<Integer,AssetData>();
		List<AssetData> assests = new ArrayList<AssetData>();
		while(rs.next()){
			int partyAssestId = rs.getInt("PartyAssetId");
			int key = partyAssestId ;
			 AssetData asset=map.get(key);
			 if(asset ==null ){
				 asset = new AssetData();
				 asset.setPartyAssetId(rs.getInt("PartyAssetID"));
				 asset.setPartyPortfolioId(rs.getInt("PartyPortfolioID"));
				 asset.setAssetName(rs.getString("AssetName"));
				 asset.setAccountId(rs.getInt("PartyFinancialAccountID"));
				 asset.setSipDate(rs.getInt("SIPDate"));
				 asset.setRetirementYear(rs.getInt("retirementYear"));
				 asset.setAssetType(rs.getString("AssetType"));
				 asset.setAssetTypeId(rs.getInt("AssetTypeId"));
				 asset.setProductTypeId(rs.getInt("ProductTypeId"));
				 asset.setInvestmentValue(rs.getLong("InvestmentValue"));
				 asset.setMaturityAmount(rs.getLong("MaturityAmount"));
				 asset.setCurrentValue(rs.getLong("CurrentValue"));
				 asset.setPerformanceCAGR(rs.getLong("PerformanceCAGR"));
				 asset.setProductName(rs.getString("ProductName"));
				 asset.setProductId(rs.getInt("ProductID"));
				 asset.setOwnerParty(rs.getString("OwnerParty"));
				 asset.setAssetType(rs.getString("AssetType"));
				 asset.setAccountPolicyNo(rs.getString("AccountPolicyno"));
				 asset.setInterestRate(rs.getLong("InterestRate"));
				 asset.setSipAmount(rs.getLong("SIPAmount"));
				 asset.setSipStartDate(rs.getDate("SIPStartDate"));
				 asset.setSipEndDate(rs.getDate("SIPEndDate"));
				 asset.setSipDurationInMonths(rs.getInt("SIPDurationInMonths"));
				 asset.setSipFreqId(rs.getInt("SIPFrequencyID"));
				 asset.setPartyId(rs.getInt("PartyId"));
				 asset.setInvestmentDate(rs.getDate("InvestmentDate"));
				 asset.setDescription(rs.getString("Description"));
				 asset.setAccountFolioNo(rs.getString("AccountFolioNo"));
				 asset.setMaturityDate(rs.getDate("MaturityDate"));
				 asset.setInvestmentDate(rs.getDate("InvestmentDate"));
				 asset.setCurrentValueDate(rs.getTimestamp("currentValueDate"));
				 asset.setOwnerPartyId(rs.getInt("OwnerPartyId"));
				 asset.setTotalUnitsQty(rs.getInt("TotalUnitsQty"));
				 
				 asset.setAccountNo(rs.getString("AccountNumber"));
				 
				 asset.setAccountName(rs.getString("AccountName"));
				 asset.setAccountNumber(rs.getString("AccountNumber"));
				 asset.setAccountTypeId(rs.getInt("AccountTypeID"));
				 asset.setBankName(rs.getString("BankName"));
				 asset.setBranchDetail(rs.getString("BranchDetail"));
				 

				 assests.add(asset);
				 if(partyAssestId >0){
					 map.put(key, asset);	 
				 }
			 }
			 int goalId = rs.getInt("FpGoalId");
			 if(goalId >0){
				 GoalData goal = new GoalData();
				 goal.setFpGoalId(goalId);
				 goal.setGoalAmountFv(rs.getString("GoalAmountFV"));
				 goal.setGoalAmountPv(rs.getString("GoalAmountPV"));
				 goal.setGoalTypeId(rs.getInt("GoalTypeID"));
				 goal.setGoalDescription(rs.getString("GoalDescription"));
				 goal.setGoalStartYear(rs.getInt("GoalStartYear"));
				 goal.setGoalName(rs.getString("GoalName"));
				 goal.setGoalTypeName(rs.getString("GoalType"));
				 
				 asset.addGoal(goal);
			 }
		}
		return assests;
	}

}
