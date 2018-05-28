package in.fiinfra.assetdetails.service;

import in.fiinfra.assetdetails.dao.AssetSummaryDao;
import in.fiinfra.common.diy.models.AssetData;
import in.fiinfra.common.diy.models.AssetSummary;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartyGoals;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AssetAvailableValue;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.JsonData;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("assetSummaryService")
public class AssetSummaryServiceImpl implements AssetSummaryService {
	
	@Autowired
	AssetSummaryDao assetSummaryDao;

	@Override
	public List<AssetAllocatedToGoal> getAssetSummaryForPartyId(String partyId) {
		
		return assetSummaryDao.getAssetSummaryForPartyId(partyId);
	}

	@Override
	public List<AssetSummary> getAssetDetailsForPartyId(String partyId, String assetId) {
		
		return assetSummaryDao.getAssetDetailsForPartyId(partyId,assetId);
	}
	
	@Override
	public List<KeyValue> getAssetTypeList(){
		
		return assetSummaryDao.getAssetTypeList();
	}
	
	@Override
	public List<KeyValue> getAssetNameList(Integer partyId, Integer assetTypeId, Integer goalId){
		
		return assetSummaryDao.getAssetNameList(partyId,assetTypeId, goalId);
	}
	
	@Override
	public AssetAvailableValue getAssetAvailableValue(Integer partyAssetId, Integer goalId, Integer partyId){
		
		return assetSummaryDao.getAssetAvailableValue(partyAssetId, goalId, partyId);
	}
	
	@Override
	public boolean saveAssetAllocatedToGoal(List<AssetAllocatedToGoal> assetAllocatedToGoalList) {
		
		if(CollectionUtils.isNotEmpty(assetAllocatedToGoalList))
		{
			String partyId = assetAllocatedToGoalList.get(0).getPartyId();
			String goalId = assetAllocatedToGoalList.get(0).getGoalId();
			String userId = assetAllocatedToGoalList.get(0).getUserId();
			String assetsAllocationXml = FiinfraUtility.getAssetAllocationXML(assetAllocatedToGoalList);			
			return assetSummaryDao.saveAssetAllocatedToGoal(partyId,goalId,userId,assetsAllocationXml);
		}
		return true;
	}

	@Override
	public List<AssetAllocatedToGoal> getAssetAllocatedToGoalList(Integer partyId, Integer goalId) {
		return assetSummaryDao.getAssetAllocatedToGoalList(partyId, goalId);
	}
	
	@Override
	public List<PartyGoals> getAssetAllocatedToGoalsList(Integer partyId) {
		return assetSummaryDao.getAssetAllocatedToGoalsList(partyId);
	}

	@Override
	public List<KeyValue> getProductAssetList(String productData,Integer assetTypeId) {
		
		return assetSummaryDao.getProductAssetList(productData, assetTypeId);
	}
	
	@Override
	public Boolean insertUpdateAsset(int buId, AssetData assetData) {
		return assetSummaryDao.insertUpdateAsset(buId, assetData);
	}
	
	@Override
	public Boolean deleteAsset(Integer partyAssetId, String partyId) {
		
		assetSummaryDao.deleteAsset(partyAssetId, partyId);
		return true; 
	}

	@Override
	public KeyValue getManufacturer(Integer ProductId) {
		
		return assetSummaryDao.getManufacturer(ProductId);
	}

	@Override
	public List<JsonData> getFrequency( Integer codeTypeId ) {
		
		return assetSummaryDao.getFrequency(codeTypeId);
	}

	@Override
	public List<AssetSummary> getTotalAssetAllocation(String partyId) {
		
		return assetSummaryDao.getTotalAssetAllocation(partyId);
	}
	
	@Override
	public List<PartyGoals> getGoalsAllocatedToAsset(String assetTypeId, String partyId) {
		
		return assetSummaryDao.getGoalsAllocatedToAsset(assetTypeId,partyId);
	}

	@Override
	public List<KeyValue> getFamilyMembers(Integer partyId, Integer buId) {
		
		return assetSummaryDao.getFamilyMembers(partyId, buId);
	}

	@Override
	public List<AssetSummary> getPieChartForGoal(Integer partyId) {
		
		return assetSummaryDao.getPieChartForGoal(partyId);
	}

	@Override
	public List<PartyGoals> getGoalsForAssets(String partyId, Integer assetTypeId) {
		
		return assetSummaryDao.getGoalsForAssets(partyId, assetTypeId);
	}
}
