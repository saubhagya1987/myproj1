package in.fiinfra.assetdetails.service;

import in.fiinfra.common.diy.models.AssetData;
import in.fiinfra.common.diy.models.AssetSummary;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartyGoals;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AssetAvailableValue;
import in.fiinfra.common.util.JsonData;

import java.util.List;

public interface AssetSummaryService {
	
	public List<AssetAllocatedToGoal> getAssetSummaryForPartyId( String partyId );
	
	public List<AssetSummary> getAssetDetailsForPartyId( String partyId, String assetId );
	
	public List<KeyValue> getAssetTypeList();
	
	public List<KeyValue> getAssetNameList(Integer partyId, Integer assetTypeId, Integer goalId);
	
	public AssetAvailableValue getAssetAvailableValue(Integer partyAssetId, Integer goalId, Integer partyId);
	
	public boolean saveAssetAllocatedToGoal(List<AssetAllocatedToGoal> assetAllocatedToGoalList);
	
	public List<AssetAllocatedToGoal> getAssetAllocatedToGoalList(Integer partyId, Integer goalId);
	
	public List<PartyGoals> getAssetAllocatedToGoalsList(Integer partyId);
	
	public List<KeyValue> getProductAssetList( String productData, Integer assetTypeId);
	
	public Boolean insertUpdateAsset(int buId, AssetData assetData);
	
	public Boolean deleteAsset(Integer partyAssetId, String partyId);
	
	public KeyValue getManufacturer( Integer ProductId );
	
	public List<JsonData> getFrequency( Integer codeTypeId );
	
	public List<AssetSummary> getTotalAssetAllocation( String partyId );
	
	public List<PartyGoals> getGoalsAllocatedToAsset(String assetTypeId, String partyId);
	
	public List<KeyValue> getFamilyMembers( Integer partyId, Integer buId );
	
	public List<AssetSummary> getPieChartForGoal( Integer partyId );
	
	public List<PartyGoals> getGoalsForAssets( String partyId, Integer assetTypeId );
	
}
