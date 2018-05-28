package in.fiinfra.serviceportal.dao;

import java.util.List;

import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.service.vo.ActivityTarcker;
import in.fiinfra.common.service.vo.Chat;
import in.fiinfra.common.service.vo.GupShup;
import in.fiinfra.common.service.vo.Like;
import in.fiinfra.common.service.vo.PartnerRating;
import in.fiinfra.common.service.vo.PostComment;

import javax.ws.rs.core.Response;

public interface DashboardDao {
	
	Response getTopPartnerList(int buId,int userId,int selectBased);
	Response getTaskAlertCountList(int buId,int userId);
	Response getQueryAlertList(int buId,int userId);
	Response getAdvTaskCalenderAlert(int partyId);
	Response getPartnerTopQueryAlert(int partyId);
	Response getPartnerTopRecentChat(int pstPartyId,int partnerPartyId);
	Response getPartnerTopLastlogin(int partyId);
	Response getPartnerTopExeTarcker(int partyId);
	Response getPartnerTopEntAccnts(int partyId);
	Response getPartnerTopExecution(int partyId);
	Response getPartnerTopDataCollection(int partyId);
	Response getTopTaskDetails(int buId,int userId);
	Response getTopBroadcastNews(int buId,int sourceSystemId);
	Response getTopActivityTracker(int partyId);
	Response getTopActivityType();
	Response getTopActivityContext();
	Response getPartnerTypeBased();
	Response addActivityTracker(ActivityTarcker activitytracker);
	Response addRecentChatReply(Chat chat);
	Response getActivity(int activityId);
	Response addTopGupShup(GupShup gupshup);
	Response addTopGupShupLike(Like like);
	Response addTopGupShupComment(PostComment postcomment);
	Response getTopGupShup();
	Response getTopGupShupLikeCount(int postId);
	Response getTopGupShupCommentCount(int postId);
	Response getTopGupShupIsLike(int likeRefId,int likePartyID);
	Response getTopGsEdit(int postId);
	Response getTopGupComments(int postId);
	Response getTopGupLikeList(int likeRefID);
	
	List<SearchResultData> getSearchList(int partyId, int buId,String searchText);
	Response showPartnerRating(PartnerRating partnerRating);
	Response saveReasonsForRating(PartnerRating partnerRating);
	Response getCurruntRatingnReason(PartnerRating partnerRating);
	Response showRatingHistory(PartnerRating partnerRating);
	Response getMutiselectValue(String context);
	Response getExecutionEnabler(int partyId);

}
