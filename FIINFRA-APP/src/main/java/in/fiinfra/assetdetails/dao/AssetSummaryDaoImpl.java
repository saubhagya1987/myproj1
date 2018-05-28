package in.fiinfra.assetdetails.dao;

import in.fiinfra.common.diy.models.AssetData;
import in.fiinfra.common.diy.models.AssetSummary;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.PartyGoals;
import in.fiinfra.common.partner.AssetAllocatedToGoal;
import in.fiinfra.common.partner.AssetAvailableValue;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.util.DataSourceProvider;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("assetSummaryDao")
public class AssetSummaryDaoImpl implements AssetSummaryDao {

	@Autowired
	DataSourceProvider dataSourceProvider;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_ASSET_SUMMARY_FOR_PARTYID = "{CALL usp_DIY_getAssetSummary(?)}"; //usp_DIY_getGoalCountForAssetsForPartyId
	private static final String SP_GET_ASSET_DETAILS_FOR_PARTYID = "{CALL usp_DIY_getAssetDetailsForPartyID(?,?)}";
	private static final String SP_GET_ASSET_TYPES = "{CALL usp_DIY_getAssetTypes()}";
	private static final String SP_GET_ASSET_NAMES = "{CALL usp_DIY_getAssetNames(?,?,?)}";
	private static final String SP_GET_ASSET_AVAILABLE_VALUE = "{CALL usp_DIY_getAssetAvailableValue(?,?,?)}";
	private static final String SP_SAVE_ASSET_ALLOCATION_TO_GOAL = "{CALL usp_DIY_insertOrUpdateAssetAllocationToGoal(?,?,?,?)}";
	private static final String SP_GET_ASSET_ALLOCATED_TO_GOAL = "{CALL usp_DIY_getAssetAllocatedToGoal(?,?)}";
	private static final String SP_GET_ASSET_ALLOCATED_TO_GOALS = "{CALL usp_DIY_getAssetAllocatedToGoals(?)}";
	private static final String SP_GET_PRODUCT_LIST_FOR_ASSET = "{CALL usp_DIY_getProductsForAsset(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_ASSET = "{CALL usp_DIY_insertOrUpdateAsset(?,?,?,?)}";
	private static final String SP_DELETE_ASSET = "{CALL usp_DIY_deleteInsuranceDetails(?,?,?)}";
	private static final String SP_GET_MANUFACTURER_FOR_ASSET = "{CALL usp_DIY_getManufacturerForAsset(?)}";
	private static final String SP_GET_FREQUENCY = "{CALL usp_DIY_getFrequencyForAsset(?)}";
	private static final String SP_GET_TOTAL_ALLOCATION_FOR_PARTYID = "{CALL usp_DIY_getTotalAssetAllocation(?)}"; 
	private static final String SP_GET_GOALS_ALLOCATED_TO_ASSET = "{CALL usp_DIY_getGoalsAllocatedToAsset(?,?)}";
	private static final String SP_GET_FAMILY_MEMBERSFOR_ASSET = "{CALL usp_DIY_getFamilyMembersForAsset(?)}";
	private static final String SP_GET_PIE_CHART_FOR_GOALS = "{CALL usp_DIY_getPieChartForAssetGoal(?)}";
	private static final String SP_GET_GOALS_FOR_ASSETS = "{CALL usp_DIY_getGoalsForAssets(?,?)}";
	
	@Override
	public List<AssetAllocatedToGoal> getAssetSummaryForPartyId(String partyId) {
		
		List<AssetAllocatedToGoal> assetSummaryList = jdbcTemplate.query(SP_GET_ASSET_SUMMARY_FOR_PARTYID, new Object[] {partyId}, new BeanPropertyRowMapper<AssetAllocatedToGoal>(AssetAllocatedToGoal.class));
		return assetSummaryList;
	}

	@Override
	public List<AssetSummary> getAssetDetailsForPartyId(String partyId, String assetId) {
		
		List<AssetSummary> assetDetailsList = jdbcTemplate.query(SP_GET_ASSET_DETAILS_FOR_PARTYID, new Object[] {partyId, assetId}, new BeanPropertyRowMapper<AssetSummary>(AssetSummary.class));
		return assetDetailsList;
	}
	
	@Override
	public List<KeyValue> getAssetTypeList() {
		
		List<KeyValue> assetTypeList = jdbcTemplate.query(SP_GET_ASSET_TYPES,new Object[0], new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
		return assetTypeList;
	}
	
	@Override
	public List<KeyValue> getAssetNameList(Integer partyId, Integer assetTypeId, Integer goalId) {
		
		List<KeyValue> assetNameList = jdbcTemplate.query(SP_GET_ASSET_NAMES, new Object[] {partyId, assetTypeId, goalId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
		return assetNameList;
	}
	
	@Override
	public AssetAvailableValue getAssetAvailableValue(Integer partyAssetId, Integer goalId, Integer partyId) {
		
		AssetAvailableValue assetAvailableValueList = jdbcTemplate.queryForObject(SP_GET_ASSET_AVAILABLE_VALUE, new Object[] {partyAssetId, goalId, partyId}, new BeanPropertyRowMapper<AssetAvailableValue>(AssetAvailableValue.class));
		return assetAvailableValueList;	
	}

	@Override
	public Boolean saveAssetAllocatedToGoal(String partyId, String goalId, String userId, String assetsAllocationXml) {
		jdbcTemplate.update(SP_SAVE_ASSET_ALLOCATION_TO_GOAL, new Object[] {partyId,goalId,userId,assetsAllocationXml});
		return true;
	}
	
	@Override
	public List<AssetAllocatedToGoal> getAssetAllocatedToGoalList(Integer partyId, Integer goalId) {
		
		List<AssetAllocatedToGoal> assetAllocatedToGoalList = jdbcTemplate.query(SP_GET_ASSET_ALLOCATED_TO_GOAL, new Object[] {partyId, goalId}, new BeanPropertyRowMapper<AssetAllocatedToGoal>(AssetAllocatedToGoal.class));
		return assetAllocatedToGoalList;
	}
	
	@Override
	public List<PartyGoals> getAssetAllocatedToGoalsList(Integer partyId) {
		
		List<PartyGoals> assetAllocatedToGoalsList = jdbcTemplate.query(SP_GET_ASSET_ALLOCATED_TO_GOALS, new Object[] {partyId}, new BeanPropertyRowMapper<PartyGoals>(PartyGoals.class));
		return assetAllocatedToGoalsList;
	}

	@Override
	public List<KeyValue> getProductAssetList(String productData,Integer assetTypeId) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_LIST_FOR_ASSET, new Object[] {productData, assetTypeId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}
	
	@Override
	public Boolean insertUpdateAsset(int buId, AssetData assetData) {
		
		Integer userId=assetData.getPartyAssetId() !=null &&assetData.getPartyAssetId()>0 ? assetData.getLastModifiedBy(): assetData.getCreatedBy();
		
		String assetXMl = getAssetXMLData(assetData);
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_ASSET, new Object[] {assetData.getPartyId(), assetData.getOwnerPartyId(), assetXMl, userId});
		
		return true;

	}
	
	
	
	private static String getAssetXMLData(AssetData asset){
		  StringBuilder sb = new StringBuilder();
		  
		  sb.append("<Root>");
		  sb.append("<AssetId>").append(asset.getPartyAssetId()!=null?asset.getPartyAssetId():0).append("</AssetId>");
		  sb.append("<AssetTypeId>").append(asset.getAssetTypeId()!=null?asset.getAssetTypeId():0).append("</AssetTypeId>");
		  sb.append("<AssetName>").append(CommonUtils.emptyIfNull(asset.getAssetName())).append("</AssetName>");
		  sb.append("<ProductId>").append(asset.getProductId()!=null?asset.getProductId():0).append("</ProductId>");
		  sb.append("<CurrentValue>").append(asset.getCurrentValue()!=null?asset.getCurrentValue():0).append("</CurrentValue>");
		  sb.append("<Description>").append(CommonUtils.emptyIfNull(asset.getDescription())).append("</Description>");
		  sb.append("<InvestmentDate>").append(CommonUtils.emptyIfNull(CommonUtils.format(asset.getInvestmentDate(), "MM/dd/yyyy") )).append("</InvestmentDate>");
		  sb.append("<InvestmentValue>").append(asset.getInvestmentValue()!=null?asset.getInvestmentValue():0).append("</InvestmentValue>");
		  sb.append("<SipAmount>").append(asset.getSipAmount()!=null?asset.getSipAmount():0).append("</SipAmount>");
		  sb.append("<SipStartDate>").append(asset.getSipStartDate()!=null?asset.getSipStartDate():"").append("</SipStartDate>");
		  /*sb.append("<SipStartDate>").append(asset.getSipStartDate()).append("</SipStartDate>");*/
		  sb.append("<SIPFreqId>").append( asset.getSipFreqId()!=null? asset.getSipFreqId():0).append("</SIPFreqId>");
		  sb.append("<SipEndDate>").append(asset.getSipEndDate()!=null?asset.getSipEndDate():"").append("</SipEndDate>");
		  /*sb.append("<SipEndDate>").append(asset.getSipEndDate()).append("</SipEndDate>");*/
		  sb.append("<OwnerPartyId>").append(asset.getOwnerPartyId()).append("</OwnerPartyId>");
		  sb.append("<AccountPolicyNo>").append(CommonUtils.emptyIfNull(asset.getAccountPolicyNo())).append("</AccountPolicyNo>");
		  sb.append("<AccountFolioNo>").append(CommonUtils.emptyIfNull(asset.getAccountFolioNo())).append("</AccountFolioNo>");
		  sb.append("<BankName>").append(CommonUtils.emptyIfNull(asset.getBankName())).append("</BankName>");
		  sb.append("<InterestRate>").append(asset.getInterestRate()!=null?asset.getInterestRate():0).append("</InterestRate>");
		  sb.append("<AccountNo>").append(CommonUtils.emptyIfNull(asset.getAccountNo())).append("</AccountNo>");
		  sb.append("<MaturityDate>").append(CommonUtils.emptyIfNull(CommonUtils.format(asset.getMaturityDate(), "MM/dd/yyyy")) ).append("</MaturityDate>");
		  sb.append("<MaturityAmount>").append(asset.getMaturityAmount()!=null?asset.getMaturityAmount():0).append("</MaturityAmount>");
		  sb.append("<Qty>").append(asset.getTotalUnitsQty()!=null?asset.getTotalUnitsQty():0).append("</Qty>");
		  sb.append("<AccountId>").append(asset.getAccountId()!=null?asset.getAccountId():0).append("</AccountId>");
		  sb.append("</Root>");
		  return sb.toString();
		    
		 }

	@Override
	public Boolean deleteAsset(Integer partyAssetId, String partyId) {
		
		Integer isAsset = 1;
		Integer party = Integer.parseInt(partyId);
		jdbcTemplate.update(SP_DELETE_ASSET, new Object[] {party,partyAssetId,isAsset});
		return true;
	}

	@Override
	public KeyValue getManufacturer(Integer ProductId) {
		
		List<KeyValue> keyList = jdbcTemplate.query(SP_GET_MANUFACTURER_FOR_ASSET, new Object[] {ProductId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
		if( !keyList.isEmpty() ){
			return keyList.get(0);
		}else {
			return null;
		}
	}

	@Override
	public List<JsonData> getFrequency( Integer codeTypeId ) {
		
		List<JsonData> keyValueList = jdbcTemplate.query(SP_GET_FREQUENCY, new Object[] {codeTypeId}, new BeanPropertyRowMapper<JsonData>(JsonData.class));
		if( codeTypeId == 63 ){
			for (Iterator<JsonData> iter = keyValueList.iterator(); iter.hasNext();) {
				JsonData cv = iter.next();
				if (!(cv.getValue() == 63003 || cv.getValue() == 63006 || cv.getValue() == 63001 || cv.getValue() == 63002 || cv.getValue() == 63004 || cv.getValue() == 63005 || cv.getValue() == 63008)) {
					iter.remove();
				}
			}
			return keyValueList;
		}else {
			return keyValueList;
		}
	}

	@Override
	public List<AssetSummary> getTotalAssetAllocation(String partyId) {
		
		return jdbcTemplate.query(SP_GET_TOTAL_ALLOCATION_FOR_PARTYID, new Object[] {partyId}, new BeanPropertyRowMapper<AssetSummary>(AssetSummary.class));
	}
	
	@Override
	public List<PartyGoals> getGoalsAllocatedToAsset(String assetTypeId, String partyId) {
		
		return jdbcTemplate.query(SP_GET_GOALS_ALLOCATED_TO_ASSET, new Object[] {assetTypeId,partyId}, new BeanPropertyRowMapper<PartyGoals>(PartyGoals.class));
	}

	@Override
	public List<KeyValue> getFamilyMembers(Integer partyId, Integer buId) {
		
		return jdbcTemplate.query(SP_GET_FAMILY_MEMBERSFOR_ASSET, new Object[] {partyId}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}

	@Override
	public List<AssetSummary> getPieChartForGoal(Integer partyId) {
		
		return jdbcTemplate.query(SP_GET_PIE_CHART_FOR_GOALS, new Object[] {partyId}, new BeanPropertyRowMapper<AssetSummary>(AssetSummary.class));
	}

	@Override
	public List<PartyGoals> getGoalsForAssets(String partyId, Integer assetTypeId) {
		
		return jdbcTemplate.query(SP_GET_GOALS_FOR_ASSETS, new Object[] {partyId,assetTypeId}, new BeanPropertyRowMapper<PartyGoals>(PartyGoals.class));
	}
	
}
