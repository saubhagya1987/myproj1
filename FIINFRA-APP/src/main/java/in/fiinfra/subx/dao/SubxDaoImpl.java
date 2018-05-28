package in.fiinfra.subx.dao;

import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.common.ReportRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.order.dao.AutoSubxExtendMapper;
import in.fiinfra.pg.AutoSubxExtendData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxAttribute;
import in.fiinfra.pg.SubxNotfData;
import in.fiinfra.pg.SubxProductData;
import in.fiinfra.portfolio.dao.KeyValueMapper;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("SubxDao")
public class SubxDaoImpl implements SubxDao {

	private static final Logger logger = Logger.getLogger(SubxDaoImpl.class);
	@Autowired
	DataSourceProvider dataSourceProvider;
	private static final String SP_GET_SUBSCRIPTION = "{CALL usp_pg_getSubscription(?,?)}";

	private static final String SP_GET_SUBX_PRODUCTS = "{CALL usp_pg_getSubxProducts(?,?)}";
	private static final String SP_GET_PARTY_PRODUCTS = "{CALL usp_pg_getPartyProducts(?,?)}";

	private static final String SP_INSERT_OR_UPDATE_SUBX = "usp_pg_saveSubscription";

	private static final String SP_ASSIGN_DEFAULT_SUBX = "usp_pg_createDefaultSubscription";

	private static final String SP_GET_SUBX_ATTRB = "{CALL usp_pg_getSubxAttributes(?,?)}";

	private static final String SP_BATCH_CREATE_SUBX = "usp_pg_batch_createSubscription";

	private static final String SP_GET_PARTNER_LIST = "{CALL usp_pgGetPartnerList(?,?,?)}";

	private static final String SP_GET_SUBX_NOTF_LIST = "{CALL usp_pg_batch_getNotf()}";

	private static final String SP_UPDATE_SUBX_STATUS_ROLE = "usp_pg_batch_UpdateSubxStatusAndRole";

	private static final String SP_GET_SUBX_AUTO_EXTEND_LIST = "{CALL usp_pg_getPartyForSubxExtend(?)}";

	private static final String SP_RPT_SUBX_MIS = "{CALL usp_pg_rpt_SubscriptionMIS(?,?,?)}";

	private static final String SP_RPT_TransactionReport = "{CALL usp_pg_rpt_TransactionReport(?,?,?,?,?)}";

	private static final String SP_RPT_PartnerInTrial = "{CALL usp_pg_rpt_PartnersInTrialPeriod(?)}";

	private static final String SP_RPT_PaymentMis = "{CALL usp_pg_rpt_PaymentMis(?,?,?)}";

	private static final String SP_RPT_PaymentDue = "{CALL usp_pg_rpt_PartnersPaymentDue(?)}";

	private static final String SP_RPT_SUBX_MIS_Header = "{CALL usp_pg_rpt_SubscriptionMISHeader(?,?,?)}";

	private static final String SP_GET_PRODUCTS = "{CALL usp_pg_getProducts(?)}";

	private static final String SP_RPT_RESOURCE_UTIL = "{CALL usp_pg_getPartyResourceUtilization(?,?,?)}";

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<SubscriptionData> getSubscriptionList(int buId, int partyId) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<SubscriptionData> lst = jdbcTemplate.query(SP_GET_SUBSCRIPTION,
				new Object[] { partyId, 0 }, new SubscriptionMapper());
		return lst;
	}

	@Override
	public SubscriptionData getSubscriptionById(int buId, int partyId,
			int subxId) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<SubscriptionData> lst = jdbcTemplate.query(SP_GET_SUBSCRIPTION,
				new Object[] { partyId, subxId }, new SubscriptionMapper());
		if (lst != null && lst.size() > 0) {
			return lst.iterator().next();
		}
		return null;
	}

	@Override
	public List<SubxProductData> getSubXProducts(int buId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<SubxProductData> products = jdbcTemplate.query(
				SP_GET_SUBX_PRODUCTS, new Object[] { buId, 0 },
				new SubxProductMapper());
		loadSubxAttributes(buId, 0, products);
		return products;
	}

	private void loadSubxAttributes(int buId, int partyProductId,
			List<SubxProductData> products) {
		Map<Integer, SubxProductData> map = new HashMap<Integer, SubxProductData>();
		for (SubxProductData p : products) {
			map.put(p.getPartyProductID(), p);
		}

		List<SubxAttribute> lstSubxAttrb = jdbcTemplate.query(
				SP_GET_SUBX_ATTRB, new Object[] { buId, partyProductId },
				new SubxAttributeMapper());

		for (SubxAttribute attrb : lstSubxAttrb) {
			SubxProductData p = map.get(attrb.getPartyProductId());
			p.getAttributes().add(attrb);
		}

	}

	@Override
	public void assignDefaultSubx(int buId, int userId, int partyId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_ASSIGN_DEFAULT_SUBX);

		sp.setParameters(new SqlParameter[] {
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER) });

		sp.compile();

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("userId", userId);

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);

	}

	@Override
	public SubscriptionData insertUpdateSubscription(int buId,
			SubscriptionData subscription) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_INSERT_OR_UPDATE_SUBX);

		sp.setParameters(new SqlParameter[] {
				new SqlParameter("partyId", Types.INTEGER),
				new SqlParameter("subxId", Types.INTEGER),
				new SqlParameter("userId", Types.INTEGER),
				new SqlParameter("subxXml", Types.VARCHAR),
				new SqlOutParameter("result", Types.INTEGER) });

		sp.compile();

		Integer userId = subscription.getUserId();

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId",
				subscription.getPartyID() != null ? subscription.getPartyID()
						: 0);
		paranValues.put(
				"subxId",
				subscription.getPartySubscriptionID() != null ? subscription
						.getPartySubscriptionID() : 0);
		paranValues.put("userId", userId);
		paranValues.put("subxXml", getSubscriptionXMLData(subscription));

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);

		subscription.setPartySubscriptionID((Integer) storedProcResult
				.get("result"));

		return subscription;
	}

	@Override
	public SubxProductData getSubxProductById(int buId, int partyProductId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		List<SubxProductData> lstProducts = jdbcTemplate.query(
				SP_GET_SUBX_PRODUCTS, new Object[] { buId, partyProductId },
				new SubxProductMapper());

		loadSubxAttributes(buId, partyProductId, lstProducts);

		if (!lstProducts.isEmpty()) {
			lstProducts.iterator().next();
		}
		return null;
	}

	private static String getSubscriptionXMLData(SubscriptionData subscription) {
		StringBuilder sb = new StringBuilder();

		sb.append("<Root>");
		sb.append("<ProductId>")
				.append(subscription.getProductID() != null ? subscription
						.getProductID() : 0).append("</ProductId>");

		if (subscription.getPaymentFrequencyId() != null) {
			sb.append("<PaymentFrequencyId>")
					.append(subscription.getPaymentFrequencyId())
					.append("</PaymentFrequencyId>");
		}

		sb.append("<SubscriptionStartDate>")
				.append(CommonUtils.format(
						subscription.getSubscriptionStartDate(), "MM/dd/yyyy"))
				.append("</SubscriptionStartDate>");
		sb.append("<SubscriptionExpiryDate>")
				.append(CommonUtils.format(
						subscription.getSubscriptionExpiryDate(), "MM/dd/yyyy"))
				.append("</SubscriptionExpiryDate>");
		sb.append("<RenewalNoticeDate>")
				.append(CommonUtils.format(subscription.getRenewalNoticeDate(),
						"MM/dd/yyyy")).append("</RenewalNoticeDate>");
		sb.append("<TrialStartDate>")
				.append(CommonUtils.format(subscription.getTrialStartDate(),
						"MM/dd/yyyy")).append("</TrialStartDate>");
		sb.append("<TrialEndDate>")
				.append(CommonUtils.format(subscription.getTrialEndDate(),
						"MM/dd/yyyy")).append("</TrialEndDate>");
		sb.append("<PaymentStatusID>")
				.append(subscription.getPaymentStatusID() != null ? subscription
						.getPaymentStatusID() : "")
				.append("</PaymentStatusID>");
		sb.append("<SubscriptionStatusID>")
				.append(subscription.getSubscriptionStatusID() != null ? subscription
						.getSubscriptionStatusID() : "")
				.append("</SubscriptionStatusID>");
		sb.append("<CurrentSubscriptionTypeID>")
				.append(subscription.getCurrentSubscriptionTypeID() != null ? subscription
						.getCurrentSubscriptionTypeID() : "")
				.append("</CurrentSubscriptionTypeID>");
		sb.append("<CurrentSubscriptionCategoryID>")
				.append(subscription.getCurrentSubscriptionCategoryID() != null ? subscription
						.getCurrentSubscriptionCategoryID() : "")
				.append("</CurrentSubscriptionCategoryID>");
		sb.append("<SubscriptionCostAmount>")
				.append(subscription.getSubscriptionCostAmount())
				.append("</SubscriptionCostAmount>");
		sb.append("</Root>");
		return sb.toString();

	}

	@Override
	public Map<String, Object> executeSubxCreateBatch(int userId) {
		jdbcTemplate.setDataSource(dataSourceProvider
				.getDataSource(FiinfraConstants.AXISMFBUID));

		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_BATCH_CREATE_SUBX);

		sp.setParameters(new SqlParameter[] { new SqlParameter("userId",
				Types.INTEGER), });

		sp.compile();

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("userId", userId);

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);

		return storedProcResult;

	}

	@Override
	public List<KeyValue> showPartnerList(int buId, int userId, String searchStr, String searchType) {

		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		List<KeyValue> lst = jdbcTemplate.query(SP_GET_PARTNER_LIST,
				new Object[] { buId, searchStr , searchType }, new KeyValueMapper());
		return lst;
	}

	@Override
	public List<SubxNotfData> getSubxForNotfications() {
		jdbcTemplate.setDataSource(dataSourceProvider
				.getDataSource(FiinfraConstants.AXISMFBUID));
		List<SubxNotfData> lst = jdbcTemplate.query(SP_GET_SUBX_NOTF_LIST,
				new Object[0], new SubxNotfMapper());
		return lst;

	}

	@Override
	public List<AutoSubxExtendData> getAutoSubxExtendData(int userId) {
		jdbcTemplate.setDataSource(dataSourceProvider
				.getDataSource(FiinfraConstants.AXISMFBUID));
		List<AutoSubxExtendData> lst = jdbcTemplate.query(
				SP_GET_SUBX_AUTO_EXTEND_LIST, new Object[] { userId },
				new AutoSubxExtendMapper());
		return lst;
	}

	@Override
	public Map<String, Object> batchUpdateSubxStatusAndRole(int userId) {
		jdbcTemplate.setDataSource(dataSourceProvider
				.getDataSource(FiinfraConstants.AXISMFBUID));

		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_UPDATE_SUBX_STATUS_ROLE);

		sp.setParameters(new SqlParameter[] { new SqlParameter("userId",
				Types.INTEGER), });

		sp.compile();

		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("userId", userId);

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);

		return storedProcResult;

	}

	@Override
	public List<SubxProductData> getPartyProducts(int buId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<SubxProductData> products = jdbcTemplate.query(
				SP_GET_PARTY_PRODUCTS, new Object[] { buId, 0 },
				new SubxProductMapper());
		loadSubxAttributes(buId, 0, products);
		return products;
	}

	/* Report Requests */
	@Override
	public ReportData getPGReports(ReportRequest req) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(req
				.getBuId()));

		if ("SubxMis".equalsIgnoreCase(req.getReportType())) {
			ReportData data =

			jdbcTemplate.query(SP_RPT_SUBX_MIS, new Object[] { req.getUserId(),
					req.getDateFrom(), req.getDateTo() }, new JSONMapper());

			List<Object> header = jdbcTemplate.query(
					SP_RPT_SUBX_MIS_Header,
					new Object[] { req.getUserId(), req.getDateFrom(),
							req.getDateTo() }, new JSONRowMapper());
			if (header != null && !header.isEmpty() && data != null) {
				data.setHeaderData(header.iterator().next());
			}
			return data;
		}

		if ("PaymentMis".equalsIgnoreCase(req.getReportType())) {
			return jdbcTemplate.query(
					SP_RPT_PaymentMis,
					new Object[] { req.getUserId(), req.getDateFrom(),
							req.getDateTo() }, new JSONMapper());
		}

		if ("PartnerInTrial".equalsIgnoreCase(req.getReportType())) {
			return jdbcTemplate.query(SP_RPT_PartnerInTrial,
					new Object[] { req.getUserId() }, new JSONMapper());
		}
		if ("PaymentDue".equalsIgnoreCase(req.getReportType())) {
			return jdbcTemplate.query(SP_RPT_PaymentDue,
					new Object[] { req.getUserId() }, new JSONMapper());
		}
		if ("TransactionReport".equalsIgnoreCase(req.getReportType())) {
			return jdbcTemplate
					.query(SP_RPT_TransactionReport,
							new Object[] {
									req.getUserId(),
									req.getPartnerId() != null ? req
											.getPartnerId() : 0,
									req.getOrderStatus() == null ? 0 : req
											.getOrderStatus(),
									req.getDateFrom(), req.getDateTo() },
							new JSONMapper());
		}

		return null;

	}

	@Override
	public List<KeyValue> getProducts(int buId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<KeyValue> products = jdbcTemplate.query(SP_GET_PRODUCTS,
				new Object[] { buId }, new KeyValueMapper());
		return products;
	}

	@Override
	public SubxProductData saveProduct(int buId, SubxProductData subxProduct) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		CommonStoredProcedure sp = new CommonStoredProcedure(jdbcTemplate,
				SP_INSERT_OR_UPDATE_SUBX);

		sp.setParameters(new SqlParameter[] {
				new SqlParameter("partyId", Types.INTEGER),
				new SqlOutParameter("result", Types.INTEGER) });

		sp.compile();

		Map<String, Object> paranValues = new HashMap<String, Object>();

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);

		return subxProduct;
	}

	@Override
	public ReportData getResourceUtiReports(ReportRequest req) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(req
				.getBuId()));
		return jdbcTemplate.query(
				SP_RPT_RESOURCE_UTIL,
				new Object[] { req.getPartyId(), req.getDateFrom(),
						req.getDateTo() }, new JSONMapper());
	}

}
