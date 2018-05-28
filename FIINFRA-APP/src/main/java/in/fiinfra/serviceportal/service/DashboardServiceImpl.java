package in.fiinfra.serviceportal.service;

import java.util.List;

import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.service.vo.ActivityTarcker;
import in.fiinfra.common.service.vo.Chat;
import in.fiinfra.common.service.vo.GupShup;
import in.fiinfra.common.service.vo.Like;
import in.fiinfra.common.service.vo.PartnerRating;
import in.fiinfra.common.service.vo.PostComment;
import in.fiinfra.serviceportal.dao.DashboardDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class DashboardServiceImpl implements DashboardService  {

	@Autowired
	DashboardDao dashboardDao;
	
	
	public DashboardDao getDashboardDao() {
		return dashboardDao;
	}


	public void setDashboardDao(DashboardDao dashboardDao) {
		this.dashboardDao = dashboardDao;
	}


	@Override
	public Response getTopPartnerList(int buId,int userId,int selectBased) {
		// TODO Auto-generated method stub
		Response toppartnerList=dashboardDao.getTopPartnerList(buId,userId,selectBased);
		return toppartnerList;
	}


	@Override
	public Response getTaskAlertCountList(int buId,int userId) {
		// TODO Auto-generated method stub
		Response taskalertCount=dashboardDao.getTaskAlertCountList(buId,userId);
		return taskalertCount;
	}


	@Override
	public Response getQueryAlertList(int buId,int userId) {
		// TODO Auto-generated method stub
		Response queryalertList=dashboardDao.getQueryAlertList(buId,userId);
		return queryalertList;
	}


	@Override
	public Response getAdvTaskCalenderAlert(int partyId) {
		// TODO Auto-generated method stub
		Response advCalList=dashboardDao.getAdvTaskCalenderAlert(partyId);
		return advCalList;
	}


	@Override
	public Response getPartnerTopQueryAlert(int partyId) {
		// TODO Auto-generated method stub
		Response partnerQueryList=dashboardDao.getPartnerTopQueryAlert(partyId);
		return partnerQueryList;
	}


	@Override
	public Response getPartnerTopRecentChat(int pstPartyId,int partnerPartyId) {
		// TODO Auto-generated method stub
		Response partnerRecentChatList=dashboardDao.getPartnerTopRecentChat(pstPartyId,partnerPartyId);
		return partnerRecentChatList;
	}


	@Override
	public Response getPartnerTopLastlogin(int partyId) {
		// TODO Auto-generated method stub
		Response partnerLastLogin=dashboardDao.getPartnerTopLastlogin(partyId);
		return partnerLastLogin;
	}


	@Override
	public Response getPartnerTopExeTarcker(int partyId) {
		// TODO Auto-generated method stub
		Response partnerExeTracker=dashboardDao.getPartnerTopExeTarcker(partyId);
		return partnerExeTracker;
	}


	@Override
	public Response getPartnerTopEntAccnts(int partyId) {
		// TODO Auto-generated method stub
		Response partnerEntAccnts=dashboardDao.getPartnerTopEntAccnts(partyId);
		return partnerEntAccnts;
	}


	@Override
	public Response getPartnerTopExecution(int partyId) {
		// TODO Auto-generated method stub
		Response partnerExecution=dashboardDao.getPartnerTopExecution(partyId);
		return partnerExecution;
	}


	@Override
	public Response getPartnerTopDataCollection(int partyId) {
		// TODO Auto-generated method stub
		Response partnerExecution=dashboardDao.getPartnerTopDataCollection(partyId);
		return partnerExecution;
	}


	@Override
	public Response getTopTaskDetails(int buId, int userId) {
		// TODO Auto-generated method stub
		Response taskDetails=dashboardDao.getTopTaskDetails(buId,userId);
		return taskDetails;
	}


	@Override
	public Response getTopBroadcastNews(int buId,int sourceSystemId) {
		// TODO Auto-generated method stub
		Response broadcastnews=dashboardDao.getTopBroadcastNews(buId,sourceSystemId);
		return broadcastnews;
	}
	
	
	@Override
	public Response getTopActivityTracker(int partyId) {
		// TODO Auto-generated method stub
		Response partnerActivity=dashboardDao.getTopActivityTracker(partyId);
		return partnerActivity;
	}


	@Override
	public Response getTopActivityType() {
		// TODO Auto-generated method stub
		Response partnerActType=dashboardDao.getTopActivityType();
		return partnerActType;
	}


	@Override
	public Response getTopActivityContext() {
		// TODO Auto-generated method stub
		Response partnerActContext=dashboardDao.getTopActivityContext();
		return partnerActContext;
	}


	@Override
	public Response addActivityTracker(ActivityTarcker activitytracker) {
		// TODO Auto-generated method stub
		Response addActivity=dashboardDao.addActivityTracker(activitytracker);
		return addActivity;
	}


	@Override
	public Response addRecentChatReply(Chat chat) {
		// TODO Auto-generated method stub
		Response addChat=dashboardDao.addRecentChatReply(chat);
		return addChat;
	}


	@Override
	public Response getActivity(int activityId) {
		// TODO Auto-generated method stub
		Response act=dashboardDao.getActivity(activityId);
		return act;
	}


	@Override
	public Response getPartnerTypeBased() {
		// TODO Auto-generated method stub
		Response partnerBasedType=dashboardDao.getPartnerTypeBased();
		return partnerBasedType;
	}


	@Override
	public Response addTopGupShup(GupShup gupshup) {
		// TODO Auto-generated method stub
		Response addGp=dashboardDao.addTopGupShup(gupshup);
		return addGp;
	}


	@Override
	public Response getTopGupShup() {
		// TODO Auto-generated method stub
		Response gsList=dashboardDao.getTopGupShup();
		return gsList;
	}


	@Override
	public Response addTopGupShupLike(Like like) {
		// TODO Auto-generated method stub
		Response addGpLike=dashboardDao.addTopGupShupLike(like);
		return addGpLike;
	}


	@Override
	public Response addTopGupShupComment(PostComment postcomment) {
		// TODO Auto-generated method stub
		Response addGpcm=dashboardDao.addTopGupShupComment(postcomment);
		return addGpcm;
	}


	@Override
	public Response getTopGupShupLikeCount(int postId) {
		// TODO Auto-generated method stub
		Response likecount=dashboardDao.getTopGupShupLikeCount(postId);
		return likecount;
	}


	@Override
	public Response getTopGupShupCommentCount(int postId) {
		// TODO Auto-generated method stub
		Response cmcount=dashboardDao.getTopGupShupCommentCount(postId);
		return cmcount;
	}


	@Override
	public Response getTopGupShupIsLike(int likeRefId, int likePartyID) {
		// TODO Auto-generated method stub
		Response islike=dashboardDao.getTopGupShupIsLike(likeRefId,likePartyID);
		return islike;
	}


	@Override
	public Response getTopGsEdit(int postId) {
		// TODO Auto-generated method stub
		Response gsedit=dashboardDao.getTopGsEdit(postId);
		return gsedit;
	}


	@Override
	public Response getTopGupComments(int postId) {
		// TODO Auto-generated method stub
		Response gscomment=dashboardDao.getTopGupComments(postId);
		return gscomment;
	}


	@Override
	public Response getTopGupLikeList(int likeRefID) {
		// TODO Auto-generated method stub
		Response gslike=dashboardDao.getTopGupLikeList(likeRefID);
		return gslike;
	}
	//For General search
	@Override
	public List<SearchResultData> getSearchList(int partyId, int buId,String searchText) {
		List<SearchResultData> searchResultDatas=dashboardDao.getSearchList(partyId,buId,searchText);
		return searchResultDatas;
	}
	
	@Override
	public Response showPartnerRating(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		Response addActivity=dashboardDao.showPartnerRating(partnerRating);
		return addActivity;
	}
	
	@Override
	public Response getCurruntRatingnReason(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		Response addActivity=dashboardDao.getCurruntRatingnReason(partnerRating);
		return addActivity;
	}
	
	
	@Override
	public Response saveReasonsForRating(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		Response addActivity=dashboardDao.saveReasonsForRating(partnerRating);
		return addActivity;
	}


	@Override
	public Response showRatingHistory(PartnerRating partnerRating) {
		// TODO Auto-generated method stub
		Response addActivity=dashboardDao.showRatingHistory(partnerRating);
		return addActivity;
	}

	@Override
	public Response getMutiselectValue(String context) {
		// TODO Auto-generated method stub
		Response addActivity=dashboardDao.getMutiselectValue(context);
		return addActivity;
	}


	@Override
	public Response getExecutionEnabler(int partyId) {
		// TODO Auto-generated method stub
		Response partnerActivity=dashboardDao.getExecutionEnabler(partyId);
		return partnerActivity;
	}

}  
