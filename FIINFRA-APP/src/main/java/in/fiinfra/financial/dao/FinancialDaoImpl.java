package in.fiinfra.financial.dao;

import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.portfolio.dao.LoanMapper;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("financialDao")
public class FinancialDaoImpl implements FinancialDao 
{
	private static final Logger logger = Logger.getLogger(FinancialDaoImpl.class);

	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	
	private static final String SP_RETRIVE_INCOME_BY_SEARCH_CRITERIA = "{CALL usp_cp_fin_getIncome(?,?)}";
	private static final String SP_RETRIVE_EXPENSE_BY_SEARCH_CRITERIA = "{CALL usp_cp_fin_getExpense(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_INCOME = "usp_cp_fin_saveIncome";
	private static final String SP_INSERT_OR_UPDATE_EXPENSE = "usp_cp_fin_saveExpense";
	private static final String SP_DELETE_INCOME = "usp_cp_fin_deleteIncome";
	private static final String SP_DELETE_EXPENSE = "usp_cp_fin_deleteExpense";
	private static final String SP_GET_INFLATION_RATE = "{CALL usp_cp_fin_getInflationRate(?)}";
	private static final String SP_GET_ASSUMPTION = "{CALL usp_cp_getAssumption(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_INCOME_AND_SAVE_DC = "usp_DIY_saveIncomeAndUpdateDC";
	private static final String SP_INSERT_OR_UPDATE_EXPENSE_AND_SAVE_DC = "usp_DIY_saveExpenseAndUpdateDC";
	private static final String SP_DELETE_INCOME_AND_SAVE_DC = "usp_DIY_deleteIncomeAndSaveDC";
	private static final String SP_DELETE_EXPENSE_AND_SAVE_DC = "usp_DIY_deleteExpenseAndSaveDC";
	
	@Override
	public IncomeData insertOrUpdateIncome(int buId, IncomeData incomeData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_INSERT_OR_UPDATE_INCOME);
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("incomeTypeId", Types.INTEGER),
				new SqlParameter("incomeSubTypeId", Types.INTEGER),
				new SqlParameter("incomeName", Types.VARCHAR),
				new SqlParameter("incomeAmount", Types.INTEGER),
				new SqlParameter("annualIncomeAmount", Types.DECIMAL),
				new SqlParameter("incomeFrequencyId", Types.INTEGER),
				new SqlParameter("batchRunId", Types.INTEGER),
				new SqlParameter("oldIncomeId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("annualGrowth", Types.DOUBLE),
				new SqlParameter("incomeId", Types.INTEGER),
				new SqlParameter("currencyDenominationId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)
		} );
		
		sp.compile();
		
		Integer userId=incomeData.getPartyIncomeId() !=null && incomeData.getPartyIncomeId()>0 ? incomeData.getLastModifiedBy(): incomeData.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("incomeId", incomeData.getPartyIncomeId()!=null?incomeData.getPartyIncomeId():0);
		paranValues.put("incomeTypeId", incomeData.getIncomeTypeId());
		paranValues.put("incomeSubTypeId", incomeData.getIncomeSubTypeId() != null?incomeData.getIncomeSubTypeId():0);
		paranValues.put("incomeName", incomeData.getIncomeName());
		paranValues.put("incomeAmount", incomeData.getIncomeAmount() );
		paranValues.put("incomeFrequencyId", incomeData.getIncomeFrequencyId());
		paranValues.put("annualIncomeAmount", incomeData.getAnnualIncomeAmount() );
		paranValues.put("annualGrowth", incomeData.getAnnualGrowth());
		paranValues.put("partyId", incomeData.getPartyId());
		paranValues.put("batchRunId", incomeData.getBatchRunId() != null?incomeData.getBatchRunId():0);
		paranValues.put("oldIncomeId",	 0);
		paranValues.put("currencyDenominationId", incomeData.getCurrencyDenominationId());
		
		paranValues.put("userId",userId);

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		incomeData.setPartyIncomeId((Integer) storedProcResult.get("result"));
		
		return incomeData;
	}

	
	@Override
	public List<IncomeData> getListOfIncomeData(int buId,int partyId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
		return jdbcTemplate.query(SP_RETRIVE_INCOME_BY_SEARCH_CRITERIA, new Object[]{partyId,0}, 
			    new IncomeMapper());
	}


	@Override
	public ExpenseData insertUpdateExpense(int buId, ExpenseData expenseData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate, SP_INSERT_OR_UPDATE_EXPENSE);
		
		sp.setParameters(new SqlParameter[]{
				
				new SqlParameter("expenseTypeId", Types.INTEGER),
				new SqlParameter("expenseSubTypeId", Types.INTEGER),
				new SqlParameter("expenseName", Types.VARCHAR),
				new SqlParameter("expenseAmount", Types.DECIMAL),
				new SqlParameter("annualExpenseAmount", Types.DECIMAL),
				new SqlParameter("expenseFrequencyId", Types.INTEGER),
				new SqlParameter("batchRunId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("expenseId", Types.INTEGER),
				new SqlParameter("currencyDenominationId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)	
		} );
		
		sp.compile();
		
		Integer userId=expenseData.getPartyExpenseID()!=null && expenseData.getPartyExpenseID() > 0 ? expenseData.getLastModifiedBy(): expenseData.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("expenseId", expenseData.getPartyExpenseID() !=null?expenseData.getPartyExpenseID():0);
		paranValues.put("expenseSubTypeId", expenseData.getExpenseSubType() != null?expenseData.getExpenseSubType():0);
		paranValues.put("expenseTypeId", expenseData.getExpenseTypeID());
		paranValues.put("expenseName", expenseData.getExpenseName());
		paranValues.put("expenseAmount", expenseData.getExpenseAmount());
		paranValues.put("expenseFrequencyId", expenseData.getExpenseFrequencyID());
		paranValues.put("annualExpenseAmount", expenseData.getAnnualExpenseAmount());
		paranValues.put("batchRunId", expenseData.getExpenseFrequencyID());
		paranValues.put("userId",userId);
		paranValues.put("partyId",expenseData.getPartyID());
		paranValues.put("currencyDenominationId", expenseData.getCurrencyDenominationId());
		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		expenseData.setPartyExpenseID((Integer) storedProcResult.get("result"));
		
		return expenseData;
	}


	@Override
	public List<ExpenseData> getListOfExpenseData(int buId,int partyId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_EXPENSE_BY_SEARCH_CRITERIA, new Object[]{partyId,0}, 
			    new ExpenseMapper());
	}


	@Override
	public String deleteIncome(int buId, int partyId, int incomeId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		return (Response) jdbcTemplate.query(SP_DELETE_INCOME, new Object[]{partyId}, 
//			    new IncomeMapper());
		String result = FiinfraConstants.fail;
		//List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_DELETE_INCOME);
		SqlParameter incomeIdParam = new SqlParameter("incomeId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { incomeIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("incomeId", incomeId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}


	@Override
	public String deleteExpense(int buId, int partyId, int expenseId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		
		String result = FiinfraConstants.fail;
		//List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_DELETE_EXPENSE);
		SqlParameter incomeIdParam = new SqlParameter("expenseId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { incomeIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("expenseId", expenseId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}


	@Override
	public int getInflationRate(int buId, int partyId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_INFLATION_RATE, new Object[]{partyId}, 
			    new IntMapper()).iterator().next();
	}
	
	@Override
	public Assumption getAssumption(int buId, int partyId, int assumptionId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Assumption> lst = jdbcTemplate.query(SP_GET_ASSUMPTION, new Object[]{partyId,assumptionId}, 
			    new AssumptionMapper());
		if(!lst.isEmpty()){
			Collections.sort(lst);
			return lst.iterator().next();
		}
		return null;
		
		
	}
	@Override
	public IncomeData insertOrUpdateIncomeAndUpdateDC(int buId, IncomeData incomeData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_INSERT_OR_UPDATE_INCOME_AND_SAVE_DC);
		
		sp.setParameters(new SqlParameter[]{
				new SqlParameter("incomeTypeId", Types.INTEGER),
				new SqlParameter("incomeSubTypeId", Types.INTEGER),
				new SqlParameter("incomeName", Types.VARCHAR),
				new SqlParameter("incomeAmount", Types.INTEGER),
				new SqlParameter("annualIncomeAmount", Types.DECIMAL),
				new SqlParameter("incomeFrequencyId", Types.INTEGER),
				new SqlParameter("batchRunId", Types.INTEGER),
				new SqlParameter("oldIncomeId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("annualGrowth", Types.DOUBLE),
				new SqlParameter("incomeId", Types.INTEGER),
				new SqlParameter("currencyDenominationId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)
		} );
		
		sp.compile();
		
		Integer userId=incomeData.getPartyIncomeId() !=null && incomeData.getPartyIncomeId()>0 ? incomeData.getLastModifiedBy(): incomeData.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("incomeId", incomeData.getPartyIncomeId()!=null?incomeData.getPartyIncomeId():0);
		paranValues.put("incomeTypeId", incomeData.getIncomeTypeId());
		paranValues.put("incomeSubTypeId", incomeData.getIncomeSubTypeId() != null?incomeData.getIncomeSubTypeId():0);
		paranValues.put("incomeName", incomeData.getIncomeName());
		paranValues.put("incomeAmount", incomeData.getIncomeAmount() );
		paranValues.put("incomeFrequencyId", incomeData.getIncomeFrequencyId());
		paranValues.put("annualIncomeAmount", incomeData.getAnnualIncomeAmount() );
		paranValues.put("annualGrowth", incomeData.getAnnualGrowth());
		paranValues.put("partyId", incomeData.getPartyId());
		paranValues.put("batchRunId", incomeData.getBatchRunId() != null?incomeData.getBatchRunId():0);
		paranValues.put("oldIncomeId",	 0);
		paranValues.put("currencyDenominationId", incomeData.getCurrencyDenominationId());
		
		paranValues.put("userId",userId);

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		incomeData.setPartyIncomeId((Integer) storedProcResult.get("result"));
		
		return incomeData;
	}


	@Override
	public String deleteIncomeAndUpdateDC(int buId, int partyId, int incomeId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		return (Response) jdbcTemplate.query(SP_DELETE_INCOME, new Object[]{partyId}, 
//			    new IncomeMapper());
		String result = FiinfraConstants.fail;
		//List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_DELETE_INCOME);
		SqlParameter incomeIdParam = new SqlParameter("incomeId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { incomeIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("incomeId", incomeId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}

	@Override
	public String deleteExpenseAndUpdateDC(int buId, int partyId, int expenseId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		
		String result = FiinfraConstants.fail;
		//List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_DELETE_EXPENSE);
		SqlParameter incomeIdParam = new SqlParameter("expenseId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { incomeIdParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("expenseId", expenseId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}

	@Override
	public ExpenseData insertUpdateExpenseAndUpdateDC(int buId, ExpenseData expenseData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate, SP_INSERT_OR_UPDATE_EXPENSE_AND_SAVE_DC);
		
		sp.setParameters(new SqlParameter[]{
				
				new SqlParameter("expenseTypeId", Types.INTEGER),
				new SqlParameter("expenseSubTypeId", Types.INTEGER),
				new SqlParameter("expenseName", Types.VARCHAR),
				new SqlParameter("expenseAmount", Types.DECIMAL),
				new SqlParameter("annualExpenseAmount", Types.DECIMAL),
				new SqlParameter("expenseFrequencyId", Types.INTEGER),
				new SqlParameter("batchRunId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("expenseId", Types.INTEGER),
				new SqlParameter("currencyDenominationId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER)	
		} );
		
		sp.compile();
		
		Integer userId=expenseData.getPartyExpenseID()!=null && expenseData.getPartyExpenseID() > 0 ? expenseData.getLastModifiedBy(): expenseData.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("expenseId", expenseData.getPartyExpenseID() !=null?expenseData.getPartyExpenseID():0);
		paranValues.put("expenseSubTypeId", expenseData.getExpenseSubType() != null?expenseData.getExpenseSubType():0);
		paranValues.put("expenseTypeId", expenseData.getExpenseTypeID());
		paranValues.put("expenseName", expenseData.getExpenseName());
		paranValues.put("expenseAmount", expenseData.getExpenseAmount());
		paranValues.put("expenseFrequencyId", expenseData.getExpenseFrequencyID());
		paranValues.put("annualExpenseAmount", expenseData.getAnnualExpenseAmount());
		paranValues.put("batchRunId", expenseData.getExpenseFrequencyID());
		paranValues.put("userId",userId);
		paranValues.put("partyId",expenseData.getPartyID());
		paranValues.put("currencyDenominationId", expenseData.getCurrencyDenominationId());
		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		expenseData.setPartyExpenseID((Integer) storedProcResult.get("result"));
		
		return expenseData;
	}


	@Override
	public IncomeData getIncomeForId(Integer incomeId, Integer partyId,
			Integer buId) {
		List<IncomeData> income =  jdbcTemplate.query(SP_RETRIVE_INCOME_BY_SEARCH_CRITERIA,new Object[] {partyId, incomeId}, new IncomeMapper());
		if(!income.isEmpty()){
			return income.iterator().next();
		}
		return null;
		
	}


	@Override
	public ExpenseData getExpenseForId(Integer expenseId, Integer partyId,
			Integer buId) {
		List<ExpenseData> expense =  jdbcTemplate.query(SP_RETRIVE_EXPENSE_BY_SEARCH_CRITERIA,new Object[] {partyId, expenseId}, new ExpenseMapper());
		if(!expense.isEmpty()){
			return expense.iterator().next();
		}
		return null;
		
	}
	}


