package in.fiinfra.financial.dao;

import in.fiinfra.common.utility.GoalData;
import in.fiinfra.cp.AssetData;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 public class PortfolioMapper extends BasicDbMapper<List<AssetData>>{
	 

	@Override
	protected List<AssetData> doMap(ResultSet rs) throws SQLException {
		Map<Integer,AssetData> map = new HashMap<Integer,AssetData>();
		List<AssetData> assests = new ArrayList<AssetData>();
		while(rs.next()){
			int partyAssestId = rs.getInt("PartyAssetId");
			int summaryId = rs.getInt("AssetSummaryID");
			int key = partyAssestId > 0 ? partyAssestId:summaryId;
			 AssetData asset=map.get(key);
			 if(asset ==null ){
				 asset = new AssetData();
				 asset.setPartyPortfolioId(rs.getInt("PartyPortfolioID"));
				 asset.setAssetName(rs.getString("AssetName"));
				 asset.setInvestmentValue(rs.getLong("InvestmentValue"));
				 asset.setCurrentValue(rs.getLong("CurrentValue"));
				 asset.setPerformanceCAGR(rs.getLong("PerformanceCAGR"));
				 asset.setProductName(rs.getString("ProductName"));
				 asset.setProductId(rs.getInt("ProductID"));
				 asset.setAssetType(rs.getString("AssetType"));
				 asset.setAccountPolicyNo(rs.getString("AccountPolicyno"));
				 asset.setPartyAssetId(rs.getInt("PartyAssetID"));
				 asset.setSipAmount(rs.getLong("SIPAmount"));
				 asset.setSipStartDate(rs.getTimestamp("SIPStartDate"));
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
				 goal.setGoalDescription(rs.getString("GoalDescription"));
				 goal.setGoalStartYear(rs.getInt("GoalStartYear"));
				 goal.setGoalName("GoalName");
				 asset.addGoal(goal);
			 }
		}
		return assests;
	}

}
