package in.fiinfra.cp.misc.dao;

import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.financial.dao.IntMapper;
import in.fiinfra.question.dao.BroadcastMapper;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("cpMiscDao")
public class CPMiscDaoImpl implements CPMiscDao {

	@Autowired
	DataSourceProvider dataSourceProvider;

	private static final String SP_GET_TESTIMONIALS = "{CALL usp_cp_getTestimonial(?,?,?)}";
	private static final String SP_GET_TESTIMONIALS_BY_ID = "{CALL usp_cp_getTestimonialById(?,?)}";
	private static final String SP_GET_POST = "{CALL usp_cp_getPost(?,?,?)}";
	private static final String SP_GET_POST_BY_ID = "{CALL usp_cp_getPostById(?,?)}";
	private static final String SP_GET_TESTIMONIALS_IDs = "{CALL usp_cp_getTestimonialIds(?)}";
	private static final String SP_GET_POST_IDs = "{CALL usp_cp_getPostIds(?)}";
	private static final String SP_GET_BROADCAST = "{CALL usp_cp_getBroadcastList(?,?)}";
	private static final String SP_GET_COMMENT = "{CALL usp_cp_getPostComment(?)}";
	private static final String SP_GET_ALERTS = "{CALL usp_CP_getAlerts(?)}";
	private static final String SP_GET_ALERT_COUNT = "{CALL usp_cp_getAlertsCount(?)}";
	private static final String SP_GET_CALENDAR_EVENTS = "{CALL usp_CP_getCalendarEvents(?)}";
	

	@Override
	public List<TestimonialData> getTestimonials(int buId, int partyId,
			int page, int rows) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_TESTIMONIALS, new Object[] { partyId,
				page, rows }, new TestimonialMapper());

	}

	@Override
	public List<GupShupData> getGupShup(int partyId, int buId, int page,
			int rows) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		List<GupShupData> lst = jdbcTemplate.query(SP_GET_POST, new Object[] {
				partyId, page, rows }, new GupShupMapper());
		return lst;

	}

	@Override
	public List<BroadcastData> getBroadcast(int sourceSystemId, int buId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_BROADCAST, new Object[] { buId,sourceSystemId },
				new BroadcastMapper());
	}

	@Override
	public GupShupCommentData saveGupShupComment(int buId,
			GupShupCommentData gupShupCommentData) {

		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveComment");
		SqlParameter postOwnerParam = new SqlParameter("postOwner",
				Types.INTEGER);
		SqlParameter postTextParam = new SqlParameter("commentText",
				Types.VARCHAR);
		SqlParameter[] paramArray = { postOwnerParam, postTextParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		/* paranValues.put("postId", gupShupCommentData.getPostId()); */
		paranValues.put("commentOwner", gupShupCommentData.getCommentOwner());
		paranValues.put("commentText", gupShupCommentData.getCommentText());
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		return gupShupCommentData;
	}

	@Override
	public GupShupCommentData insertComment(int buId,
			GupShupCommentData gupShupCommentData) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_insertPostComment");
		SqlParameter postIdParam = new SqlParameter("PostId", Types.INTEGER);
		SqlParameter commentPartyIdParam = new SqlParameter("CommentPartyId",
				Types.INTEGER);
		SqlParameter postCommentTextParam = new SqlParameter("CommentText",
				Types.VARCHAR);
		SqlParameter statusRefIdParam = new SqlParameter("StatusRefID",
				Types.INTEGER);

		SqlParameter userIdParam = new SqlParameter("userId",
				Types.INTEGER);

		SqlParameter[] paramArray = { postIdParam, commentPartyIdParam,
				postCommentTextParam, statusRefIdParam ,userIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("PostId", gupShupCommentData.getPostId());
		paranValues.put("CommentPartyId", gupShupCommentData.getPartyId());
		paranValues.put("CommentText", gupShupCommentData.getCommentText());
		paranValues.put("StatusRefID", gupShupCommentData.getStatusRefId());
		paranValues.put("userId", gupShupCommentData.getUserId());

		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);

		// gupShupCommentData.setScore((Integer)
		// storedProcResult.get("questionScore"));
		return gupShupCommentData;
	}

	@Override
	public LikeData addLike(int buId, LikeData likeData) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_insertLike");
		SqlParameter refIdParam = new SqlParameter("refId", Types.INTEGER);
		SqlParameter refTypeIdParam = new SqlParameter("refTypeId",
				Types.INTEGER);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter userIdParam = new SqlParameter("userId", Types.INTEGER);
		SqlParameter[] paramArray = { refIdParam, refTypeIdParam, partyIdParam,
				userIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("refId", likeData.getLikeRefId());
		paramValues.put("refTypeId", likeData.getLikeRefTypeId());
		paramValues.put("partyId", likeData.getPartyId());
		paramValues.put("userId", likeData.getUserId());
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);

		return likeData;
	}

	@Override
	public TestimonialData insertTestimonail(int buId,
			TestimonialData testimonialData) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_insertTestimonial");
		SqlParameter urlParam = new SqlParameter("url", Types.VARCHAR);
		SqlParameter testimonialTextParam = new SqlParameter("testimonialText",
				Types.VARCHAR);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter userIdParam = new SqlParameter("userId", Types.INTEGER);
		SqlParameter[] paramArray = { urlParam, testimonialTextParam,
				partyIdParam, userIdParam, new SqlOutParameter("TestimonialId", Types.INTEGER) };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("url", testimonialData.getUrl());
		paramValues.put("testimonialText", testimonialData.getText());
		paramValues.put("partyId", testimonialData.getPartyId());
		paramValues.put("userId", testimonialData.getCreatedById());
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		testimonialData.setId((Integer)storedProcResult.get("TestimonialId"));

		return testimonialData;
	}

	@Override
	public List<AlertData> getAlerts(int buId, Integer partyId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		List<AlertData> lstAlerts = jdbcTemplate.query(SP_GET_ALERTS,
				new Object[] { partyId }, new AlertMapper());
		return lstAlerts;
	}

	@Override
	public int getAlertCount(int buId, Integer partyId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		return jdbcTemplate
				.query(SP_GET_ALERT_COUNT, new Object[] { partyId },
						new IntMapper()).iterator().next();
	}

	@Override
	public List<Integer> getTestimonialIds(int buId, int partyId, int page,
			int rows) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_TESTIMONIALS_IDs, new Object[] { partyId}, new IntMapper());
	}

	@Override
	public List<Integer> getGupShupIds(int buId, int partyId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_POST_IDs, new Object[] { partyId },
				new IntMapper());

	}

	@Override
	public GupShupData getGupShupById(int buId, int postId, int partyId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		List<GupShupData> lst = jdbcTemplate.query(SP_GET_POST_BY_ID,
				new Object[] { postId, partyId }, new GupShupMapper());
		if (lst.size() > 0) {
			GupShupData ob = lst.iterator().next();
			List<GupShupCommentData> comment = jdbcTemplate.query(
					SP_GET_COMMENT, new Object[] { ob.getId() },
					new GupShupCommentMapper());
			ob.setComments(comment);

			return ob;
		}
		return null;

	}

	@Override
	public TestimonialData getTestimonialById(int buId, int testimonialId, int partyId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		List<TestimonialData> lst = jdbcTemplate.query(SP_GET_TESTIMONIALS_BY_ID,
				new Object[] { testimonialId, partyId },
				new TestimonialMapper());
		if (lst.size() > 0) {
			TestimonialData ob = lst.iterator().next();
			return ob;
		}
		return null;
	}

	@Override
	public List<CalenderData> getCalenderEvents(int buId, int partyId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		
		 List<CalenderData> lstEvents = jdbcTemplate.query(SP_GET_CALENDAR_EVENTS, new
		  Object[] { partyId }, new CalenderMapper());
		 
		return lstEvents;

	}
}
