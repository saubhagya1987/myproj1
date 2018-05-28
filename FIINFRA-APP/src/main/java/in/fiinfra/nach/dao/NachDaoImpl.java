package in.fiinfra.nach.dao;

import in.fiinfra.common.common.NachRequest;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.frmk.DbInvoker;
import in.fiinfra.pg.AutoPaymentData;
import in.fiinfra.pg.NachData;
import in.fiinfra.util.DataSourceProvider;
import in.fiinfra.util.SQLs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("nachDao")
public class NachDaoImpl extends DbInvoker implements NachDao {

	private static final Logger logger = Logger.getLogger(NachDaoImpl.class);

	@Autowired
	DataSourceProvider dataSourceProvider;
	@Autowired
	JdbcTemplate jdbcTemplate;

	private static final String SP_GET_NACH_LIST = "{CALL usp_pg_getPartnerNACHDetails(?,?,?,?)}";
	private static final String SP_INSERT_UPDATE_NACH = "usp_pg_savePartnerNACHDetails";

	@Override
	public List<NachData> getNachList(NachRequest request) {

		Map<String, Object> params = new HashMap<String, Object>();
		
		addIdParameter(params, "partyId", request.getPartnerId());
		addIdParameter(params, "userId", request.getUserId());
		addIdParameter(params, "statusId", request.getStatusId());

		return executeSelect(SQLs.sel_partner_nach_details, params,
				new NachMapper());

		// JdbcTemplate jdbcTemplate = new JdbcTemplate(
		// dataSourceProvider.getDataSource(userId));
		//
		// return jdbcTemplate.query(SP_GET_NACH_LIST, new Object[] { userId, 0,
		// 0, 0 }, new NachMapper());
	}

	@Override
	public NachData insertUpdateNach(int userId, NachData nach) {

               Map<String, Object> params = new HashMap<String, Object>();
		addIdParameter(params, "userId", nach.getUserId());
		addIdParameter(params, "PartyID", nach.getPartyID());
		addIdParameter(params, "NachID", nach.getNachId());
		addStringParameter(params, "PartyName", nach.getPartyName());
		addStringParameter(params, "Email", nach.getEmail());
		addStringParameter(params, "BankName", nach.getBankName());
		addStringParameter(params, "PhoneNo", nach.getMobile());
		addIdParameter(params, "AccountTypeID", nach.getAccountId());
		addStringParameter(params, "AccountNumber", nach.getAccountNumber());
		addStringParameter(params, "IFSCCode", nach.getIfsc());
		addStringParameter(params, "MICRCode", nach.getMicr());
		addDateParameter(params, "RegistrationDate", nach.getRegistrationDate());
		addDateParameter(params, "EndDate", nach.getEndDate());
		addDateParameter(params, "StartDate", nach.getStartDate());
		addIdParameter(params, "NACHStatusCodeID", nach.getStatusId());
		addStringParameter(params, "ErrorDetail", nach.getErrorDetail());
		addStringParameter(params, "Remark", nach.getRemark());
		addStringParameter(params, "UMRNNo", nach.getUmrn());
		addStringParameter(params, "Reference1", nach.getReferece1());
		addStringParameter(params, "Reference2", nach.getRefernce2());
		addNumberParameter(params, "LimitAmount", nach.getLimitAmount());
		addIdParameter(params, "FrequencyID", nach.getFrequencyId());

		if (nach.getNachId() != null && nach.getNachId() > 0) {
			executeUpdate(SQLs.upd_partner_nach_details, params);
		} else {
			int nachId = executeInsert(SQLs.ins_partner_nach_details, params);
			nach.setNachId(nachId);
		}

		// jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(nach
		// .getUserId()));
		//
		// CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
		// SP_INSERT_UPDATE_NACH);
		//
		// sp.setParameters(new SqlParameter[] {
		// new SqlParameter("partyId", Types.INTEGER),
		// new SqlParameter("userId", Types.INTEGER),
		// new SqlParameter("nachXml", Types.VARCHAR),
		//
		// new SqlOutParameter("result", Types.INTEGER) });
		//
		// sp.compile();
		//
		// Map<String, Object> paranValues = new HashMap<String, Object>();
		// paranValues.put("partyId", nach.getPartyID());
		// paranValues.put("nachXml", getNachXMLData(nach));
		// paranValues.put("userId", nach.getUserId());
		//
		// Map<String, Object> storedProcResult = sp.execute(paranValues);
		// logger.debug("storedProcResult:------" + storedProcResult);
		//
		// nach.setNachId((Integer) storedProcResult.get("result"));

		return nach;
	}

	private static String getNachXMLData(NachData nach) {
		StringBuilder sb = new StringBuilder();

		sb.append("<Root>");
		sb.append("<NachID>")
				.append(nach.getNachId() != null ? nach.getNachId() : 0)
				.append("</NachID>");
		sb.append("<PartyName>").append(nach.getPartyName())
				.append("</PartyName>");
		sb.append("<BankName>")
				.append(CommonUtils.emptyIfNull(nach.getBankName()))
				.append("</BankName>");
		sb.append("<Email>").append(CommonUtils.emptyIfNull(nach.getEmail()))
				.append("</Email>");
		sb.append("<PhoneNo>")
				.append(CommonUtils.emptyIfNull(nach.getMobile()))
				.append("</PhoneNo>");
		sb.append("<AccountTypeID>")
				.append(nach.getAccountId() != null ? nach.getAccountId()
						: 68001).append("</AccountTypeID>");
		sb.append("<AccountNumber>")
				.append(CommonUtils.emptyIfNull(nach.getAccountNumber()))
				.append("</AccountNumber>");
		sb.append("<IFSCCode>").append(CommonUtils.emptyIfNull(nach.getIfsc()))
				.append("</IFSCCode>");
		sb.append("<MICRCode>").append(CommonUtils.emptyIfNull(nach.getMicr()))
				.append("</MICRCode>");

		sb.append("<StartDate>")
				.append(CommonUtils.emptyIfNull(CommonUtils.format(
						nach.getStartDate(), "MM/dd/yyyy")))
				.append("</StartDate>");
		sb.append("<EndDate>")
				.append(CommonUtils.emptyIfNull(CommonUtils.format(
						nach.getEndDate(), "MM/dd/yyyy"))).append("</EndDate>");
		sb.append("<RegistrationDate>")
				.append(CommonUtils.emptyIfNull(CommonUtils.format(
						nach.getRegistrationDate(), "MM/dd/yyyy")))
				.append("</RegistrationDate>");
		sb.append("<NACHStatusCodeID>")
				.append(nach.getStatusId() != null ? nach.getStatusId()
						: 155001).append("</NACHStatusCodeID>");
		sb.append("<ErrorDetail>")
				.append(CommonUtils.emptyIfNull(CommonUtils.emptyIfNull(nach
						.getErrorDetail()))).append("</ErrorDetail>");
		sb.append("<Remark>").append(CommonUtils.emptyIfNull(nach.getRemark())).append("</Remark>");
		// sb.append("<UMRNNo>").append(nach.getUMRN()).append("</UMRNNo>");
		sb.append("<Reference1>").append(nach.getReferece1())
				.append("</Reference1>");
		sb.append("<Reference2>")
				.append(CommonUtils.emptyIfNull(nach.getRefernce2()))
				.append("</Reference2>");
		sb.append("<LimitAmount>").append(nach.getLimitAmount())
				.append("</LimitAmount>");
		sb.append("<FrequencyID>")
				.append(nach.getFrequencyId() != null ? nach.getFrequencyId()
						: 63001).append("</FrequencyID>");
		sb.append("</Root>");

		return sb.toString();

	}

	@Override
	public NachData getNachById(int userId, int nachId) {
		Map<String, Object> params = new HashMap<String, Object>();
		addIdParameter(params, "userId", userId);
		addIdParameter(params, "nachId", nachId);
		return executeSelectOne(SQLs.sel_partner_nach_details, params,
				new NachMapper());

		// JdbcTemplate jdbcTemplate = new JdbcTemplate(
		// dataSourceProvider.getDataSource(userId));
		//
		// List<NachData> lst = jdbcTemplate.query(SP_GET_NACH_LIST, new
		// Object[] {
		// userId, 0, nachId, 0 }, new NachMapper());
		// if (lst != null && lst.size() > 0) {
		// return lst.iterator().next();
		// }
		// return null;
	}

	@Override
	public NachData getNachByPartyId(int userId, int partyId) {
		Map<String, Object> params = new HashMap<String, Object>();
		addIdParameter(params, "userId", userId);
		addIdParameter(params, "partyId", partyId);
		return executeSelectOne(SQLs.sel_partner_nach_details, params,
				new NachMapper());

		// JdbcTemplate jdbcTemplate = new JdbcTemplate(
		// dataSourceProvider.getDataSource(userId));
		//
		// List<NachData> lst = jdbcTemplate.query(SP_GET_NACH_LIST, new
		// Object[] {
		// userId, partyId, 0, 0 }, new NachMapper());
		// if (lst != null && lst.size() > 0) {
		// return lst.iterator().next();
		// }
		// return null;
	}

	@Override
	public List<AutoPaymentData> getAutoPaymentData(NachRequest request) {
		Map<String, Object> params = new HashMap<String, Object>();
	
		addIdParameter(params, "userId", request.getUserId() );
		addIdParameter(params, "partyId", request.getPartnerId());
		addIdParameter(params,"productId",request.getProductId());
		addIdParameter(params,"frequencyId",request.getFrequencyId());
		addDateParameter(params,"dateTo",request.getDateTo());
		return executeSelect(SQLs.sel_auto_payment_details, params,
				new AutoPaymentMapper());
	}

}
