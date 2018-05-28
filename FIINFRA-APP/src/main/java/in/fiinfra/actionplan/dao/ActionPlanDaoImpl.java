package in.fiinfra.actionplan.dao;

import in.fiinfra.common.diy.models.ActionPlan;
import in.fiinfra.common.diy.models.ActionPlanRisk;
import in.fiinfra.common.diy.models.FamilyDetail;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;
import in.fiinfra.common.util.CommonStoredProcedure;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("actionPlanDao")
public class ActionPlanDaoImpl implements ActionPlanDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private static final String SP_GET_ACTION_PLAN_DATA = "{CALL usp_DIY_getActionPlan(?,?,?,?)}";
	private static final String SP_GET_ACTION_PLAN_FOR_RISK_COVER = "{CALL usp_DIY_getActionPlanForRiskCover(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_ACTION_PLAN_DATA = "{CALL usp_DIY_insertOrUpdateActionPlanDataForGoals(?,?,?,?,?,?)}";
	private static final String SP_INSERT_OR_UPDATE_ACTION_PLAN_DATA_FOR_RISK = "{CALL usp_DIY_insertOrUpdateActionPlanDataForRisk(?)}";
	private static final String SP_GET_PRODUCT_FOR_RISK_COVER = "{CALL usp_DIY_getProductForRiskCover(?,?)}";
	private static final String SP_GET_PRODUCT_PREIMUM = "{CALL usp_DIY_GetProductPremium(?,?,?,?,?)}";
	
	@Override
	public List<ActionPlan> getActionPlanData(Integer partyId,Integer goalId, Integer goalTypeId, Integer investmentType) {
		
		return jdbcTemplate.query(SP_GET_ACTION_PLAN_DATA, new Object[] {partyId,goalId,goalTypeId,investmentType}, new BeanPropertyRowMapper<ActionPlan>(ActionPlan.class));
	}

	@Override
	public List<ActionPlanRisk> getActionPlanDataForRiskCover(Integer partyId,Integer sectionTypeId) {
		
		return jdbcTemplate.query(SP_GET_ACTION_PLAN_FOR_RISK_COVER, new Object[] {partyId,sectionTypeId}, new BeanPropertyRowMapper<ActionPlanRisk>(ActionPlanRisk.class));
	}
	
	@Override
	public boolean insertOrUpdateActionPlanData(String actionPlanDataXml,
			Integer partyId, String targetAmount, Integer goalId,
			Integer goalTypeId, Integer goalYear) {
		
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_ACTION_PLAN_DATA, new Object[] {actionPlanDataXml,partyId,targetAmount,goalId,goalTypeId,goalYear});
		return true;
	}
	
	@Override
	public boolean insertOrUpdateActionPlanDataForRisk(String actionPlanDataXml)
	{
		jdbcTemplate.update(SP_INSERT_OR_UPDATE_ACTION_PLAN_DATA_FOR_RISK, new Object[]{actionPlanDataXml});
		return true;
	}

	@Override
	public FamilyDetail getFamilyDetail(Integer partyId) {
		
		FamilyDetail familyDetail = new FamilyDetail();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getFamilyDetail");
		SqlParameter PartyId = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter isSpouse = new SqlOutParameter("isSpouse", Types.INTEGER);
		SqlOutParameter age = new SqlOutParameter("age", Types.INTEGER);
		SqlOutParameter childCount = new SqlOutParameter("childCount", Types.INTEGER);
		SqlParameter[] param = {PartyId,isSpouse,age,childCount};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("PartyId", partyId);
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		familyDetail.setIsSpouse(Integer.parseInt(storedProcedureResult.get("isSpouse").toString()));
		familyDetail.setAge(Integer.parseInt(storedProcedureResult.get("age").toString()));
		familyDetail.setChildcount(Integer.parseInt(storedProcedureResult.get("childCount").toString()));
		
		return familyDetail;
		
	}

	@Override
	public ProductCommension getProductPremiumAmount(Integer productId, Integer IsSpouse,
			Integer Age, Integer Childcount, String sum) {
		
		ProductCommension productCommension = jdbcTemplate.queryForObject(SP_GET_PRODUCT_PREIMUM, new Object[] {productId,IsSpouse,Age,Childcount,Double.parseDouble(sum)}, new BeanPropertyRowMapper<ProductCommension>(ProductCommension.class));
		return productCommension;
	}

	@Override
	public List<KeyValue> getProductsForRiskCover(Integer riskId, String dataFor) {
		
		return jdbcTemplate.query(SP_GET_PRODUCT_FOR_RISK_COVER, new Object[] {riskId,dataFor}, new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
	}

	@Override
	public String getSumAssured(ActionPlanRisk actionPlanRisk) {
		
		String sumAssrue = null;
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(jdbcTemplate, "usp_DIY_getSumAssuredForProductId");
		SqlParameter ProductId = new SqlParameter("ProductId", Types.INTEGER);
		SqlParameter PartId = new SqlParameter("PartyId",Types.INTEGER);
		SqlParameter CoverReq = new SqlParameter("CoverReq", Types.DECIMAL);
		SqlParameter CoverAvailable = new SqlParameter("CoverAvailable", Types.DECIMAL);
		SqlOutParameter sumAssured = new SqlOutParameter("sumAssured", Types.DECIMAL);
		SqlParameter[] param = {ProductId,PartId,CoverReq,CoverAvailable,sumAssured};
		myStoredProcedure.setParameters(param);
		myStoredProcedure.compile();
		Map<String, Object> paramValue = new HashMap<String, Object>();
		paramValue.put("ProductId", actionPlanRisk.getProductId());
		paramValue.put("PartyId", actionPlanRisk.getPartyId());
		paramValue.put("CoverReq", actionPlanRisk.getCoverRequired());
		paramValue.put("CoverAvailable", actionPlanRisk.getCoverAvailable());
		
		Map<String, Object> storedProcedureResult = myStoredProcedure.execute(paramValue);
		
		sumAssrue = storedProcedureResult.get("sumAssured").toString();
		
		return sumAssrue;
	}
}
