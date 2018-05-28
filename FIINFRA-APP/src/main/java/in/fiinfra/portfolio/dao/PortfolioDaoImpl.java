package in.fiinfra.portfolio.dao;

import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.cp.AchievementScaleData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.PlanData;
import in.fiinfra.financial.dao.FinancialDao;
import in.fiinfra.party.dao.PartyDao;
import in.fiinfra.plan.PlanMapper;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("portfolioDao")
public class PortfolioDaoImpl implements PortfolioDao {
	private static final Logger logger = Logger
			.getLogger(PortfolioDaoImpl.class);

	@Autowired
	DataSourceProvider dataSourceProvider;
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	private PartyDao partyDao;
	
	@Autowired
	private FinancialDao financialDAO;


	private static final String SP_GET_ASSET = "{CALL usp_cp_fin_getAsset(?)}";
	private static final String SP_GET_PORTFOLIO = "{CALL usp_cp_getPortfolio(?,?)}";
	private static final String SP_GET_PLANS = "{CALL usp_cp_fin_getPlans(?)}";
	private static final String SP_GET_LOANS = "{CALL usp_cp_getLoan(?,?)}";
	private static final String SP_GET_GOAL_FOR_CLIENTS = "{CALL usp_CP_getGoals(?)}";
	private static final String SP_INSERT_OR_UPDATE_LOAN = "usp_cp_saveLoan";
	private static final String SP_INSERT_OR_UPDATE_ACCOUNT = "usp_cp_save_financialAccount";
	private static final String SP_DELETE_LOAN = "usp_cp_deleteLoan";
	private static final String SP_INSERT_OR_UPDATE_ASSET = "usp_cp_saveAsset";
	private static final String SP_DELETE_ASSET = "usp_cp_deleteAsset";
	private static final String SP_GET_FAMILY_MEMBERS = "{CALL usp_CP_getFamilyMembers(?)}";
	private static final String SP_GET_PRODUCTS = "{CALL usp_cp_getProducts(?,?)}";
	private static final String SP_GET_FINANCIAL_ACCOUNTS = "{CALL usp_cp_getFinancialAccounts(?)}";
	private static final String SP_DELETE_LOAN_AND_UPDATE_DC = "usp_DIY_deleteLoanAndUpdateDC";
	private static final String SP_SAVE_LOAN_AND_UPDATE_DC = "usp_DIY_saveLoanAndUpdateDC";
	
		
	

	@Override
	public List<AssetData> getListOfPortfolio(int buId, int partyId) {
		Party party = partyDao.getParty(partyId);
		
		Date dobDate = party.getDob();
		int retirementYear = 0;
		
		Assumption assumptionRetirement = financialDAO.getAssumption(buId, partyId, 98022);
		
		int retirementAge = assumptionRetirement != null ? assumptionRetirement.getAsInt(60):60;
		
		Calendar dob = Calendar.getInstance();
		if(dobDate != null){
			dob.setTime(dobDate);
		}
		Calendar today = Calendar.getInstance();
			
			int age =  today.get(Calendar.YEAR) - dob.get(Calendar.YEAR);
			age = Math.abs(age);
			if(retirementAge >age){
				today.add(Calendar.YEAR, retirementAge-age);
				retirementYear = today.get(Calendar.YEAR);
			}
		

		List<AssetData> lstPortfolioData = jdbcTemplate.query(SP_GET_PORTFOLIO,
				new Object[] { partyId,0 }, new AssetMapper());
		for(AssetData asset:lstPortfolioData){
			asset.setRetirementYear(retirementYear);
		}
		return lstPortfolioData;
	}

	@Override
	public List<PlanData> getPlans(int buId, int partyId) {
		List<PlanData> lstPlanData = jdbcTemplate.query(SP_GET_PLANS,
				new Object[] { partyId }, new PlanMapper());
		return lstPlanData;
	}

	@Override
	public List<LoanData> getLoanData(int buId, int partyId) {
		List<LoanData> lstLoanData = jdbcTemplate.query(SP_GET_LOANS,
				new Object[] { partyId,0 }, new LoanMapper());
		return lstLoanData;
	}
	@Override
	public List<GoalData> getGoalsForClient(Integer partyId) {
		List<GoalData> lstGoalData = jdbcTemplate.query(SP_GET_GOAL_FOR_CLIENTS, new Object[] {partyId}, new GoalMapper());
		return lstGoalData;

	}

	@Override
	public AchievementScaleData getAchievementScale(Integer partyId) {
		AchievementScaleData a=new AchievementScaleData();
		a.setGoalScale(70);
		a.setRiskScale(50);
		a.setSuccessionScale(60);
		
		return a;
	}

	@Override
	public Boolean approvePlan(Integer partyId, Integer prodAllocationId,
			Integer fpActionPlanId, Integer buId) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_approveProductAllocation");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter allocationId = new SqlParameter("allocationId",
				Types.INTEGER);
		SqlParameter actionPlanId = new SqlParameter("actionPlanId",
				Types.INTEGER);

		SqlParameter executionId = new SqlOutParameter("executionId",
				Types.INTEGER);

		SqlParameter[] paramArray = { partyIdParam, allocationId,
						actionPlanId,executionId};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("allocationId",prodAllocationId);
		paranValues.put("actionPlanId", fpActionPlanId);
		

		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);

		 
		Integer executionID = (Integer) storedProcResult.get("executionId");
		return executionID >0;
	}

	@Override
	public LoanData insertUpdateLoan(int buId, LoanData loanData) {
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_INSERT_OR_UPDATE_LOAN);
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("loanId", Types.INTEGER),
				new SqlParameter("loanTypeId", Types.INTEGER),
				new SqlParameter("loanName", Types.VARCHAR),
				new SqlParameter("loanAmount", Types.DECIMAL),
				new SqlParameter("tenure", Types.INTEGER),
				new SqlParameter("emi", Types.INTEGER),
				new SqlParameter("emiFrequencyId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)
		} );
		
		sp.compile();
		
		Integer userId=loanData.getPartyLoanId() !=null && loanData.getPartyLoanId()>0 ? loanData.getLastModifiedBy(): loanData.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", loanData.getPartyId()!=null?loanData.getPartyId():0);
		paranValues.put("loanId", loanData.getPartyLoanId()!=null?loanData.getPartyLoanId():0);
		paranValues.put("loanTypeId", loanData.getLoanTypeId() != null?loanData.getLoanTypeId():0);
		paranValues.put("loanName", loanData.getLoanName());
		paranValues.put("loanAmount", loanData.getLoanAmount() );
		paranValues.put("tenure", loanData.getLoanTenureMonths());
		paranValues.put("emi", loanData.getEmiAmount() );
		paranValues.put("emiFrequencyId", loanData.getEmiFreqId());
		paranValues.put("userId", userId);
		

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		loanData.setPartyLoanId((Integer) storedProcResult.get("result"));
			
		return loanData;
	}

	@Override
	public String deleteLoan(int buId, int partyId, int partyLoanId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_DELETE_LOAN);
		SqlParameter loanIdParam = new SqlParameter("partyLoanId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { loanIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyLoanId", partyLoanId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;

	
		return result;
	}

	@Override
	public AssetData insertUpdateAsset(int buId, AssetData assetData) {
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_INSERT_OR_UPDATE_ASSET);
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("ownerPartyId", Types.INTEGER),
				new SqlParameter("assetXml", Types.VARCHAR),
				new SqlParameter("userId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)
		} );
		
		sp.compile();
		
		Integer userId=assetData.getPartyAssetId() !=null &&assetData.getPartyAssetId()>0 ? assetData.getLastModifiedBy(): assetData.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", assetData.getPartyId()!=null?assetData.getPartyId():0);
		paranValues.put("ownerPartyId", assetData.getOwnerPartyId()!=null?assetData.getOwnerPartyId():0);
		paranValues.put("assetXml",getAssetXMLData(assetData));
		paranValues.put("userId", userId);
		

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		assetData.setPartyAssetId((Integer) storedProcResult.get("result"));
			
		return assetData;
	}

	@Override
	public String deleteAsset(int buId, int partyId, int assetId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_DELETE_ASSET);
		SqlParameter loanIdParam = new SqlParameter("loanId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { loanIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("assetId", assetId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;

	
		return result;
	}

	@Override
	public List<KeyValue> getFamilyMembers(int partyId,int buId) {

		List<KeyValue> lstPortfolioData = jdbcTemplate.query(SP_GET_FAMILY_MEMBERS,
				new Object[] { partyId }, new KeyValueMapper());
		return lstPortfolioData;
	}

	
	private static String getAssetXMLData(AssetData asset){
		  StringBuilder sb = new StringBuilder();
		  
		  sb.append("<Root>");
		  sb.append("<AssetId>").append(asset.getPartyAssetId()!=null?asset.getPartyAssetId():0).append("</AssetId>");
		  sb.append("<AssetTypeId>").append(asset.getAssetTypeId()!=null?asset.getAssetTypeId():0).append("</AssetTypeId>");
		  sb.append("<AssetName>").append(CommonUtils.emptyIfNull(asset.getAssetName())).append("</AssetName>");
		  //sb.append("<ProductId>").append(asset.getProductId()!=null?asset.getProductId():0).append("</ProductId>");
		  sb.append("<CurrentValue>").append(asset.getCurrentValue()).append("</CurrentValue>");
		  sb.append("<Description>").append(CommonUtils.emptyIfNull(asset.getDescription())).append("</Description>");
		  sb.append("<InvestmentDate>").append(CommonUtils.emptyIfNull(CommonUtils.format(asset.getInvestmentDate(), "MM/dd/yyyy") )).append("</InvestmentDate>");
		  sb.append("<InvestmentValue>").append(asset.getInvestmentValue()).append("</InvestmentValue>");
		  sb.append("<SipAmount>").append(asset.getSipAmount()).append("</SipAmount>");
		  sb.append("<SipStartDate>").append(CommonUtils.emptyIfNull(CommonUtils.format( asset.getSipStartDate(), "MM/dd/yyyy"))).append("</SipStartDate>");
		  sb.append("<SIPFreqId>").append( asset.getSipFreqId()!=null? asset.getSipFreqId():0).append("</SIPFreqId>");
		  sb.append("<SipEndDate>").append(CommonUtils.emptyIfNull(CommonUtils.format( asset.getSipEndDate(), "MM/dd/yyyy"))).append("</SipEndDate>");
		  sb.append("<OwnerPartyId>").append(asset.getOwnerPartyId()).append("</OwnerPartyId>");
		  sb.append("<AccountPolicyNo>").append(CommonUtils.emptyIfNull(asset.getAccountPolicyNo())).append("</AccountPolicyNo>");
		  sb.append("<AccountFolioNo>").append(CommonUtils.emptyIfNull(asset.getAccountFolioNo())).append("</AccountFolioNo>");
		  sb.append("<BankName>").append(CommonUtils.emptyIfNull(asset.getBankName())).append("</BankName>");
		  sb.append("<InterestRate>").append(asset.getInterestRate()).append("</InterestRate>");
		  sb.append("<AccountNo>").append(CommonUtils.emptyIfNull(asset.getAccountNo())).append("</AccountNo>");
		  sb.append("<MaturityDate>").append(CommonUtils.emptyIfNull(CommonUtils.format(asset.getMaturityDate(), "MM/dd/yyyy")) ).append("</MaturityDate>");
		  sb.append("<MaturityAmount>").append(asset.getMaturityAmount()).append("</MaturityAmount>");
		  sb.append("<Qty>").append(asset.getTotalUnitsQty()).append("</Qty>");
		  sb.append("<AccountId>").append(asset.getAccountId()!=null?asset.getAccountId():0).append("</AccountId>");
		  sb.append("</Root>");
		  return sb.toString();
		    
		 }

	@Override
	public List<KeyValue> getProducts(int buId, int partyId,String type,String searchStr) {
		List<KeyValue> lstProducts = jdbcTemplate.query(SP_GET_PRODUCTS,
				new Object[] { type,searchStr }, new KeyValueMapper());
		return lstProducts;
	}
	

	@Override
	public List<FinancialAccountData> getFinancialAccounts(int buId, int partyId) {
		List<FinancialAccountData> lstPortfolioData = jdbcTemplate.query(SP_GET_FINANCIAL_ACCOUNTS,
				new Object[] { partyId }, new FinancialAccountMapper());
		return lstPortfolioData;

	}


	@Override
	public FinancialAccountData saveFinancialAccount(int buId,
			FinancialAccountData data) {
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_INSERT_OR_UPDATE_ACCOUNT);
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("AccountNumber", Types.VARCHAR),
				new SqlParameter("BankName", Types.VARCHAR),
				new SqlParameter("BranchName", Types.VARCHAR),
				//new SqlParameter("IFSCNo", Types.VARCHAR),
				new SqlParameter("userId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)
		} );
		
		sp.compile();
		
		Integer userId=data.getPartyFinancialAccountID() !=null && data.getPartyFinancialAccountID()>0 ? data.getLastModifiedBy(): data.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", data.getPartyId()!=null?data.getPartyId():0);
		paranValues.put("AccountNumber", data.getAccountNumber() );
		//paranValues.put("AccountName", data.getAccountName());
		paranValues.put("BankName", data.getBankName());
		paranValues.put("BranchName", data.getBranchCode() );
		//paranValues.put("IFSCNo", data.getIFSCNo());
		paranValues.put("userId", userId);
		

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		data.setPartyFinancialAccountID((Integer) storedProcResult.get("result"));
			
		return data;
	}

	@Override
	public AssetData getAsset(int buId, int partyId, int assetId) {
		//AssetData asset =  jdbcTemplate.queryForObject(SP_GET_PORTFOLIO,new Object[] { partyId,assetId }, new AssetMapper());
		List<AssetData> asset =  jdbcTemplate.query(SP_GET_PORTFOLIO,new Object[] { partyId,assetId }, new AssetMapper());
		if(!asset.isEmpty()){
			return asset.iterator().next();
		}
		return null;
		
	}
	
	@Override
	public String deleteLoanAndUpdateDC(int buId, int partyId, int loanId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_DELETE_LOAN_AND_UPDATE_DC);
		SqlParameter loanIdParam = new SqlParameter("loanId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { loanIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("loanId", loanId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;

	
		return result;
	}


	@Override
	public LoanData insertUpdateLoanAndUpdateDC(int buId, LoanData loanData) {
jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_SAVE_LOAN_AND_UPDATE_DC);
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("loanId", Types.INTEGER),
				new SqlParameter("loanTypeId", Types.INTEGER),
				new SqlParameter("loanName", Types.VARCHAR),
				new SqlParameter("loanAmount", Types.DECIMAL),
				new SqlParameter("tenure", Types.INTEGER),
				new SqlParameter("emi", Types.INTEGER),
				new SqlParameter("emiFrequencyId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)
		} );
		
		sp.compile();
		
		Integer userId=loanData.getPartyLoanId() !=null && loanData.getPartyLoanId()>0 ? loanData.getLastModifiedBy(): loanData.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", loanData.getPartyId()!=null?loanData.getPartyId():0);
		paranValues.put("loanId", loanData.getPartyLoanId()!=null?loanData.getPartyLoanId():0);
		paranValues.put("loanTypeId", loanData.getLoanTypeId() != null?loanData.getLoanTypeId():0);
		paranValues.put("loanName", loanData.getLoanName());
		paranValues.put("loanAmount", loanData.getLoanAmount() );
		paranValues.put("tenure", loanData.getLoanTenureMonths());
		paranValues.put("emi", loanData.getEmiAmount() );
		paranValues.put("emiFrequencyId", loanData.getEmiFreqId());
		paranValues.put("userId", userId);
		

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		loanData.setPartyLoanId((Integer) storedProcResult.get("result"));
			
		return loanData;
	}

	@Override
	public LoanData getLoanForId(int partyLoanId, int partyId, int buId) {
		List<LoanData> loan =  jdbcTemplate.query(SP_GET_LOANS,new Object[] {partyId, partyLoanId}, new LoanMapper());
		if(!loan.isEmpty()){
			return loan.iterator().next();
		}
		return null;
		
	}



}
