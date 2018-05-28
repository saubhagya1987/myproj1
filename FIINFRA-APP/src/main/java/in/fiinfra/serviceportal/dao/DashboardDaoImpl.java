package in.fiinfra.serviceportal.dao;

import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.service.vo.ActivityTarcker;
import in.fiinfra.common.service.vo.BroadCastNews;
import in.fiinfra.common.service.vo.Chat;
import in.fiinfra.common.service.vo.DataCollection;
import in.fiinfra.common.service.vo.Entities;
import in.fiinfra.common.service.vo.Execution;
import in.fiinfra.common.service.vo.ExecutionEnabler;
import in.fiinfra.common.service.vo.GupShup;
import in.fiinfra.common.service.vo.Like;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.PartnerRating;
import in.fiinfra.common.service.vo.PostComment;
import in.fiinfra.common.service.vo.Query;
import in.fiinfra.common.service.vo.Task;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;

public class DashboardDaoImpl implements DashboardDao{

	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
   Response response;
   
   private static final Logger logger = Logger.getLogger(DashboardDaoImpl.class);

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}


	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	 @Override
	public Response getTopPartnerList(int buId,int userId,int selectBased) {
		// TODO Auto-generated method stub
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try{
			List<Partner> partner;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			partner= jdbcTemplate.query(FiinfraConstants.SP_TOP_PARTNER_LIST,new Object[]{buId,userId,selectBased},new BeanPropertyRowMapper(Partner.class));
			br.setResponseListObject(partner);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTaskAlertCountList(int buId,int userId) {
		// TODO Auto-generated method stub
		BaseResponse<Task> br = new BaseResponse<Task>();
		
		try{
			List<Task> task;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			task= jdbcTemplate.query(FiinfraConstants.SP_USER_COUNT_TASK,new Object[]{buId,userId},new BeanPropertyRowMapper(Task.class));
			br.setResponseListObject(task);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getQueryAlertList(int buId,int userId) {
		// TODO Auto-generated method stub
		BaseResponse<Query> br = new BaseResponse<Query>();
		try{
			List<Query> query;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			query= jdbcTemplate.query(FiinfraConstants.SP_QUERY_ALERT_LIST,new Object[]{buId,userId},new BeanPropertyRowMapper(Query.class));
			br.setResponseListObject(query);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
		
	}


	@Override
	public Response getAdvTaskCalenderAlert(int partyId) {
		// TODO Auto-generated method stub
		BaseResponse<Task> br = new BaseResponse<Task>();
		
		
		try{
			List<Task> task;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			task= jdbcTemplate.query(FiinfraConstants.SP_ADV_CAL_ALERT,new Object[]{partyId},new BeanPropertyRowMapper(Task.class));
			br.setResponseListObject(task);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getPartnerTopQueryAlert(int partyId) {
		// TODO Auto-generated method stub
		BaseResponse<Query> br = new BaseResponse<Query>();
		try{
			List<Query> query;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			query= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_QUERY_ALERT,new Object[]{partyId},new BeanPropertyRowMapper(Query.class));
			br.setResponseListObject(query);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
		
	}


	@Override
	public Response getPartnerTopRecentChat(int pstPartyId,int partnerPartyId) {
		// TODO Auto-generated method stub
		BaseResponse<Chat> br = new BaseResponse<Chat>();
		try{
			List<Chat> chat;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			chat= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_RECENT_CHAT,new Object[]{pstPartyId,partnerPartyId},new BeanPropertyRowMapper(Chat.class));
			br.setResponseListObject(chat);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getPartnerTopLastlogin(int partyId) {
		// TODO Auto-generated method stub
		BaseResponse<User> br = new BaseResponse<User>();
		try{
			List<User> user;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			user= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_LAST_LOGIN,new Object[]{partyId},new BeanPropertyRowMapper(User.class));
			br.setResponseListObject(user);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getPartnerTopExeTarcker(int partyId) {
		// TODO Auto-generated method stub
		BaseResponse<Execution> br = new BaseResponse<Execution>();
		try{
			List<Execution> execution;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			execution= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_EXE_TRACKER,new Object[]{partyId},new BeanPropertyRowMapper(Execution.class));
			br.setResponseListObject(execution);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getPartnerTopEntAccnts(int partyId) {
		// TODO Auto-generated method stub
		BaseResponse<Entities> br = new BaseResponse<Entities>();
		try{
			List<Entities> entities;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			entities= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_ENTITY,new Object[]{partyId},new BeanPropertyRowMapper(Entities.class));
			br.setResponseListObject(entities);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getPartnerTopExecution(int partyId) {
		// TODO Auto-generated method stub
		BaseResponse<Execution> br = new BaseResponse<Execution>();
		try{
			List<Execution> exe;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			exe= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_EXECUTION,new Object[]{partyId},new BeanPropertyRowMapper(Execution.class));
			br.setResponseListObject(exe);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getPartnerTopDataCollection(int partyId) {
		// TODO Auto-generated method stub
		BaseResponse<DataCollection> br = new BaseResponse<DataCollection>();
		try{
			List<DataCollection> dataCollection;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			dataCollection= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_DATA_COLLECTION,new Object[]{partyId},new BeanPropertyRowMapper(DataCollection.class));
			br.setResponseListObject(dataCollection);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopTaskDetails(int buId, int userId) {
		// TODO Auto-generated method stub
BaseResponse<Task> br = new BaseResponse<Task>();
		
		try{
			List<Task> task;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			task= jdbcTemplate.query(FiinfraConstants.SP_TASK_DETAIL,new Object[]{buId,userId},new BeanPropertyRowMapper(Task.class));
			br.setResponseListObject(task);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopBroadcastNews(int buId,int sourceSystemId) {
		// TODO Auto-generated method stub
		BaseResponse<BroadCastNews> br = new BaseResponse<BroadCastNews>();
		
		try{
			List<BroadCastNews> broadcast;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			broadcast= jdbcTemplate.query(FiinfraConstants.SP_BROAD_NEWS,new Object[]{buId, sourceSystemId},new BeanPropertyRowMapper(BroadCastNews.class));
			br.setResponseListObject(broadcast);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopActivityTracker(int partyId) {
		// TODO Auto-generated method stub
BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
		
		try{
			List<ActivityTarcker> activity;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			activity= jdbcTemplate.query(FiinfraConstants.SP_ACTIVITY_TRACKER,new Object[]{partyId},new BeanPropertyRowMapper(ActivityTarcker.class));
			br.setResponseListObject(activity);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopActivityType() {
		// TODO Auto-generated method stub
		BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
		
		try{
			List<ActivityTarcker> activity;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			activity= jdbcTemplate.query(FiinfraConstants.SP_ACTIVITY_TYPE,new Object[]{},new BeanPropertyRowMapper(ActivityTarcker.class));
			br.setResponseListObject(activity);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopActivityContext() {
		// TODO Auto-generated method stub
BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
		
		try{
			List<ActivityTarcker> activity;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			activity= jdbcTemplate.query(FiinfraConstants.SP_ACTIVITY_CONTEXT,new Object[]{},new BeanPropertyRowMapper(ActivityTarcker.class));
			br.setResponseListObject(activity);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response addActivityTracker(ActivityTarcker activitytracker) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer activity;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			//activity=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_ACTIVITY,new Object[]{activitytracker.getActivityId(),activitytracker.getActivityOriginatedByPartyID(),activitytracker.getActivityTypeId(),activitytracker.getActivityContextId(),activitytracker.getActivityNote(),activitytracker.getCreatedBy(),activitytracker.getLastModifiedBy(),activitytracker.getActivitySpend()},new BeanPropertyRowMapper<Integer>(Integer.class));
			
			activity=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_ACTIVITY,new Object[]{activitytracker.getActivityId(),activitytracker.getActivityOriginatedByPartyID(),activitytracker.getActivityTypeId(),activitytracker.getActivityContextId(),activitytracker.getActivityNote(),activitytracker.getCreatedBy(),activitytracker.getLastModifiedBy(),activitytracker.getActivitySpend(),activitytracker.getActivitySubContextId()},new BeanPropertyRowMapper<Integer>(Integer.class));
			
			br.setResponseObject(activity);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}

	}


	@Override
	public Response addRecentChatReply(Chat chat) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer activity;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
																									
			activity=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_CHAT,new Object[]{chat.getRecordTypeID(),chat.getChatPartyID(),chat.getChatContactTypeID(),chat.getChatOnRelatedPartyID(),chat.getChatTypeId(),chat.getChatText(),chat.getParentChatID(),chat.getCreatedBy(),chat.getLastModifiedBy(),chat.getChatContentTypeID()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(activity);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getActivity(int activityId) {
		// TODO Auto-generated method stub
		BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
		
		try{
			List<ActivityTarcker> activity;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			activity= jdbcTemplate.query(FiinfraConstants.SP_GET_ACTIVITY,new Object[]{activityId},new BeanPropertyRowMapper(ActivityTarcker.class));
			br.setResponseListObject(activity);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getPartnerTypeBased() {
		// TODO Auto-generated method stub
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		
		try{
			List<Partner> partnerBased;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			partnerBased= jdbcTemplate.query(FiinfraConstants.SP_PARTNER_BASED,new Object[]{},new BeanPropertyRowMapper(Partner.class));
			br.setResponseListObject(partnerBased);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response addTopGupShup(GupShup gupshup) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer gs;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
																									
			gs=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_GUPSHUP,new Object[]{gupshup.getPostId(),gupshup.getPostUrl(),gupshup.getPostText(),gupshup.getPostPartyId(),gupshup.getRecordTypeId(),gupshup.getStatusRefID(),gupshup.getCreatedBy(),gupshup.getLastModifiedBy()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(gs);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopGupShup() {
		// TODO Auto-generated method stub
		BaseResponse<GupShup> br = new BaseResponse<GupShup>();
		
		try{
			List<GupShup> gupshup;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			gupshup= jdbcTemplate.query(FiinfraConstants.SP_GUPSHUP_LIST,new Object[]{},new BeanPropertyRowMapper(GupShup.class));
			br.setResponseListObject(gupshup);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response addTopGupShupLike(Like like) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer gs;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
																									
			gs=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_GUPSHUP_LIKE,new Object[]{like.getLikeRefID(),like.getLikeRefID(),like.getLikePartyID(),like.getCreatedBy(),like.getLastModifiedBy()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(gs);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response addTopGupShupComment(PostComment postcomment) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<>();
		try
		{
			Integer gs;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
																									
			gs=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_GUPSHUP_COMMENT,new Object[]{postcomment.getPostCommentText(),postcomment.getCommentPartyId(),postcomment.getCreatedBy(),postcomment.getLastModifiedBy(),postcomment.getPostId()},new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(gs);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopGupShupLikeCount(int postId) {
		// TODO Auto-generated method stub
			BaseResponse<GupShup> br = new BaseResponse<GupShup>();
		
		try{
			List<GupShup> gs;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			gs= jdbcTemplate.query(FiinfraConstants.SP_GET_GS_LIKE_COUNT,new Object[]{postId},new BeanPropertyRowMapper(GupShup.class));
			br.setResponseListObject(gs);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopGupShupCommentCount(int postId) {
		// TODO Auto-generated method stub
		BaseResponse<GupShup> br = new BaseResponse<GupShup>();
		
		try{
			List<GupShup> gs;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			gs= jdbcTemplate.query(FiinfraConstants.SP_GET_GS_COMMENT_COUNT,new Object[]{postId},new BeanPropertyRowMapper(GupShup.class));
			br.setResponseListObject(gs);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopGupShupIsLike(int likeRefId, int likePartyID) {
		// TODO Auto-generated method stub
			BaseResponse<Like> br = new BaseResponse<Like>();
		
		try{
			List<Like> gs;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			gs= jdbcTemplate.query(FiinfraConstants.SP_GET_GS_IS_LIKE,new Object[]{likeRefId,likePartyID},new BeanPropertyRowMapper(Like.class));
			br.setResponseListObject(gs);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopGsEdit(int postId) {
		// TODO Auto-generated method stub
	BaseResponse<GupShup> br = new BaseResponse<GupShup>();
		
		try{
			List<GupShup> gs;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			gs= jdbcTemplate.query(FiinfraConstants.SP_GET_GS_EDIT,new Object[]{postId},new BeanPropertyRowMapper(GupShup.class));
			br.setResponseListObject(gs);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopGupComments(int postId) {
		// TODO Auto-generated method stub
		BaseResponse<PostComment> br = new BaseResponse<PostComment>();
		
		try{
			List<PostComment> pc;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			pc= jdbcTemplate.query(FiinfraConstants.SP_GET_GS_COMMENTS_LIST,new Object[]{postId},new BeanPropertyRowMapper(PostComment.class));
			br.setResponseListObject(pc);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getTopGupLikeList(int likeRefID) {
		// TODO Auto-generated method stub
		BaseResponse<Like> br = new BaseResponse<Like>();
		
		try{
			List<Like> lk;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			lk= jdbcTemplate.query(FiinfraConstants.SP_GET_GS_LIKE_LIST,new Object[]{likeRefID},new BeanPropertyRowMapper(Like.class));
			br.setResponseListObject(lk);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}
	
	/*@Override
	public Response getSearchList(int partyId, int buId,String searchText) {
		// TODO Auto-generated method stub
		BaseResponse<SearchResultData> br = new BaseResponse<SearchResultData>();
		try{ 
			List<SearchResultData> searchResultDatas;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			searchResultDatas= jdbcTemplate.query(FiinfraConstants.SP_GET_GENERAL_SEARCH,new Object[]{partyId,buId,searchText},new BeanPropertyRowMapper(SearchResultData.class));
			br.setResponseListObject(searchResultDatas); 
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}  
		finally
		{
			return response;
		}
	}*/


	@Override
	public List<SearchResultData> getSearchList(int partyId, int buId,String searchText) {
		// TODO Auto-generated method stub
		List<SearchResultData> searchResultDatas=new ArrayList<SearchResultData>();
		try{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_srp_generalSearchForSRP");  
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER); 
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter searchValueParam = new SqlParameter("searchStr", Types.VARCHAR);
		
		 
		SqlParameter[] paramArray = { partyIdParam,buIdParam,searchValueParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		/*paranValues.put("partyId", partyId);
		paranValues.put("buId", buId);
		paranValues.put("searchStr", searchText); */
		
		paranValues.put("partyId", buId);  
		paranValues.put("buId", partyId);
		paranValues.put("searchStr", searchText); 
	     
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) { 
			 
			SearchResultData searchResultData = null;
			for (Map<String, Object> row : l) {
				searchResultData=new SearchResultData();
				searchResultData.setType((String) row.get("type"));
				searchResultData.setName((String) row.get("name"));				
				searchResultData.setDetails((String) row.get("details"));
				searchResultData.setId((Integer) row.get("id"));

				searchResultData.setUsername((String) row.get("username"));

				searchResultDatas.add(searchResultData); 

			}
		}
		
		}catch(Exception e){
			logger.debug(""+e.getStackTrace());
		} 
		return searchResultDatas;
	}
	
	  
	@Override
	public Response showPartnerRating(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		BaseResponse<PartnerRating> br = new BaseResponse<PartnerRating>();
		try
		{
			List<PartnerRating> rating;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			rating=jdbcTemplate.query(FiinfraConstants.SP_GET_RATING_VALUES,new Object[]{partnerRating.getRatingId(),partnerRating.getBuId()},new BeanPropertyRowMapper(PartnerRating.class));
			br.setResponseListObject(rating);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}

	}
	
	
	@Override
	public Response saveReasonsForRating(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		try
		{ 
			Integer rating;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			rating=(Integer)jdbcTemplate.queryForObject(FiinfraConstants.SP_SAVE_RATING_VALUES,new Object[]{partnerRating.getPartnerspartyid(),partnerRating.getUserId(),partnerRating.getReasonIdString(),partnerRating.getRatingId(),partnerRating.getBuId(), partnerRating.getOtherReason(),partnerRating.getLastMonthDate(),partnerRating.getExtraNote()},new BeanPropertyRowMapper(Integer.class));
			br.setResponseObject(rating);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} 
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}

	}  
	
	
	@Override
	public Response getCurruntRatingnReason(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		BaseResponse<PartnerRating> br = new BaseResponse<PartnerRating>();
		try
		{
			List<PartnerRating> rating;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			rating=jdbcTemplate.query(FiinfraConstants.SP_GET_CURRUNT_RATING_REASON,new Object[]{partnerRating.getPartnerspartyid()},new BeanPropertyRowMapper(PartnerRating.class));
			br.setResponseListObject(rating);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}

	}
	

	public Response showRatingHistory(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		BaseResponse<PartnerRating> br = new BaseResponse<PartnerRating>();
		try
		{
			List<PartnerRating> rating;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			rating=jdbcTemplate.query(FiinfraConstants.SP_GET_RATING_HISTORY,new Object[]{partnerRating.getPartnerspartyid()},new BeanPropertyRowMapper(PartnerRating.class));
			br.setResponseListObject(rating);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) 
		{
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}

	}

	
	
	@Override
	public Response getMutiselectValue(String context) {
		// TODO Auto-generated method stub
		BaseResponse<ActivityTarcker> br = new BaseResponse<ActivityTarcker>();
		
		try{
			List<ActivityTarcker> pc;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			pc= jdbcTemplate.query(FiinfraConstants.SP_GET_MULTISELECT,new Object[]{context},new BeanPropertyRowMapper(ActivityTarcker.class));
			br.setResponseListObject(pc);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
		}
	}


	@Override
	public Response getExecutionEnabler(int partyId) {
		BaseResponse<ExecutionEnabler> br = new BaseResponse<ExecutionEnabler>();
			
			try{
				List<ExecutionEnabler> activity;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				activity= jdbcTemplate.query(FiinfraConstants.SP_EXECTION_ENABLER,new Object[]{partyId},new BeanPropertyRowMapper(ExecutionEnabler.class));
				br.setResponseListObject(activity);
				response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			}
			catch (DataAccessException e) {
				response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			}
			finally
			{
				return response;
			}
		}

	
	
	
}
