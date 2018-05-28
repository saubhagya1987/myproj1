package in.fiinfra.serviceportal.facade;

import java.util.List;

import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.service.vo.ActivityTarcker;
import in.fiinfra.common.service.vo.BroadCastNews;
import in.fiinfra.common.service.vo.Chat;
import in.fiinfra.common.service.vo.DataCollection;
import in.fiinfra.common.service.vo.Entities;
import in.fiinfra.common.service.vo.Execution;
import in.fiinfra.common.service.vo.GupShup;
import in.fiinfra.common.service.vo.Like;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.PartnerRating;
import in.fiinfra.common.service.vo.PostComment;
import in.fiinfra.common.service.vo.Query;
import in.fiinfra.common.service.vo.Task;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.serviceportal.service.DashboardService;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/dashboard")
public class DashboardController extends MultiActionController {

//	getTopPartnerList
	 
	Response response;
	private static final Logger logger = Logger.getLogger(DashboardController.class);
	
	@Autowired
	DashboardService dashboardService;
	private ObjectMapper objectMapper;

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	public DashboardService getDashboardService() {
		return dashboardService;
	}

	public void setDashboardService(DashboardService dashboardService) {
		this.dashboardService = dashboardService;
	}
	
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTopPartnerList/{user}/{token}")
	 public Response getTopPartnerList(@QueryParam("buId") int buId,@QueryParam("userId") int userId,@QueryParam("selectBased") int selectBased,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<Partner> br = new BaseResponse<>();
		   response=dashboardService.getTopPartnerList(buId,userId,selectBased);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getTaskAlertCount/{user}/{token}")
	 public Response getTaskAlertCount(@QueryParam("buId") int buId,@QueryParam("userId") int userId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<Task> br = new BaseResponse<>();
		   response=dashboardService.getTaskAlertCountList(buId,userId);
			return response;
	   }
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getQueryAlert/{user}/{token}")
	 public Response getQueryAlert(@QueryParam("buId") int buId,@QueryParam("userId") int userId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Query> br = new BaseResponse<>();
		   response=dashboardService.getQueryAlertList(buId,userId);
			return response;
	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAdvTaskAlert/{user}/{token}")
	 public Response getAdvTaskAlert(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Task> br = new BaseResponse<>();
		   response=dashboardService.getAdvTaskCalenderAlert(partyId);
			return response;
	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerPendingQuery/{user}/{token}")
	 public Response getPartnerPendingQuery(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Query> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTopQueryAlert(partyId);
			return response;
	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerRecentChat/{user}/{token}")
	 public Response getPartnerRecentChat(@QueryParam("pstPartyId") int pstPartyId,@QueryParam("partnerPartyId") int partnerPartyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Chat> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTopRecentChat(pstPartyId,partnerPartyId);
			return response;
	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerLastlogin/{user}/{token}")
	 public Response getPartnerLastlogin(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Chat> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTopLastlogin(partyId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerExeTracker/{user}/{token}")
	 public Response getPartnerExeTracker(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Execution> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTopExeTarcker(partyId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerEntitiesAccnts/{user}/{token}")
	 public Response getPartnerEntitiesAccnts(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		//	System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Entities> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTopEntAccnts(partyId);
			return response;
	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerExecution/{user}/{token}")
	 public Response getPartnerExecution(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<Entities> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTopExecution(partyId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerDataCollection/{user}/{token}")
	 public Response getPartnerDataCollection(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("QQQQQQQQQQQQQQ");
		   BaseResponse<DataCollection> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTopDataCollection(partyId);
			return response;
	   }
	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAdvTaskDetails/{user}/{token}")
	 public Response getAdvTaskDetails(@QueryParam("buId") int buId,@QueryParam("userId") int userId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<Task> br = new BaseResponse<>();
		   response=dashboardService.getTopTaskDetails(buId,userId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getBroadCastNews/{user}/{token}")
	 public Response getBroadCastNews(@QueryParam("buId") int buId,@QueryParam("sourceSystemId") int sourceSystemId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<BroadCastNews> br = new BaseResponse<>();
		   response=dashboardService.getTopBroadcastNews(buId,sourceSystemId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getActivityTracker/{user}/{token}")
	 public Response getActivityTracker(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<ActivityTarcker> br = new BaseResponse<>();
		   response=dashboardService.getTopActivityTracker(partyId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getActivityType/{user}/{token}")
	 public Response getActivityType(@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<ActivityTarcker> br = new BaseResponse<>();
		   response=dashboardService.getTopActivityType();
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getActivityContext/{user}/{token}")
	 public Response getActivityContext(@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<ActivityTarcker> br = new BaseResponse<>();
		   response=dashboardService.getTopActivityContext();
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerBased/{user}/{token}")
	 public Response getPartnerBased(@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<Partner> br = new BaseResponse<>();
		   response=dashboardService.getPartnerTypeBased();
			return response;
	   }
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addActivity/{user}/{token}")
	 public Response addActivity(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody ActivityTarcker activitytracker)
	   {
		 response=dashboardService.addActivityTracker(activitytracker);
			return response;

	   }
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addRecentChat/{user}/{token}")
	 public Response addRecentChat(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody Chat chat)
	   {
		 response=dashboardService.addRecentChatReply(chat);
			return response;

	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getActivity/{user}/{token}")
	 public Response getActivity(@QueryParam("activityId") int activityId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		  BaseResponse<ActivityTarcker> br = new BaseResponse<>();
		   response=dashboardService.getActivity(activityId);
			return response;
	   }
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addGupshup/{user}/{token}")
	 public Response addGupshup(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody GupShup gupshup)
	   {
		 response=dashboardService.addTopGupShup(gupshup);
			return response;

	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGupshup/{user}/{token}")
	 public Response getGupshup(@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<GupShup> br = new BaseResponse<>();
		   response=dashboardService.getTopGupShup();
			return response;
	   }
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addGSLike/{user}/{token}")
	 public Response addGSLike(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody Like like)
	   {
		 response=dashboardService.addTopGupShupLike(like);
			return response;

	   }
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addGSComment/{user}/{token}")
	 public Response addGSComment(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody PostComment postcomment)
	   {
		 response=dashboardService.addTopGupShupComment(postcomment);
			return response;

	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGSLikeCount/{user}/{token}")
	 public Response getGSLikeCount(@QueryParam("postId") int postId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		  BaseResponse<GupShup> br = new BaseResponse<>();
		   response=dashboardService.getTopGupShupLikeCount(postId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGSCommentCount/{user}/{token}")
	 public Response getGSCommentCount(@QueryParam("postId") int postId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		  BaseResponse<GupShup> br = new BaseResponse<>();
		   response=dashboardService.getTopGupShupCommentCount(postId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGSisLike/{user}/{token}")
	 public Response getGSisLike(@QueryParam("likeRefId") int likeRefId,@QueryParam("likePartyID") int likePartyID,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		  BaseResponse<Like> br = new BaseResponse<>();
		   response=dashboardService.getTopGupShupIsLike(likeRefId,likePartyID);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGSEdit/{user}/{token}")
	 public Response getGSEdit(@QueryParam("postId") int postId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		  BaseResponse<GupShup> br = new BaseResponse<>();
		   response=dashboardService.getTopGsEdit(postId);
			return response;
	   }
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGSCommentList/{user}/{token}")
	 public Response getGSCommentList(@QueryParam("postId") int postId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		  BaseResponse<PostComment> br = new BaseResponse<>();
		   response=dashboardService.getTopGupComments(postId);
			return response;
	   }
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGSLikeList/{user}/{token}")
	 public Response getGSLikeList(@QueryParam("likeRefID") int likeRefID,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
		  BaseResponse<Like> br = new BaseResponse<>();
		   response=dashboardService.getTopGupLikeList(likeRefID);
			return response;
	   }
	
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSearchList/{user}/{token}")
	public Response getSearchList(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("searchText") String searchText,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
	   {
		   BaseResponse<SearchResultData> br = new BaseResponse<>();
		   response=dashboardService.getSearchList(partyId, buId,searchText);  
			return response;
	   } 
	   
	}*/
	
	@GET  
	@Produces(MediaType.APPLICATION_JSON)  
	@Path("/getSearchList/{user}/{token}")
	public Response getSearchList(@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("searchText") String searchText,@PathParam("token") String token,
			@PathParam("user") String name) throws Exception {
		//System.out.println("In App Controller..Search..............................");
		logger.debug("GeneralSearchDatas:---" + partyId);
		logger.debug("buId:---" + buId); 
		List<SearchResultData> searchResultDatas =  dashboardService.getSearchList(partyId, buId,searchText);  		
		BaseResponse<SearchResultData> br=new BaseResponse<>();
		//System.out.println("A........................"+searchResultDatas);
		br.setResponseListObject(searchResultDatas);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;  
 
	} 
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/showPartnerRating/{user}/{token}")
	 public Response showPartnerRating(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody PartnerRating partnerRating)
	   {
		 response=dashboardService.showPartnerRating(partnerRating);
			return response;

	   }
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCurruntRatingnReason/{user}/{token}")
	 public Response getCurruntRatingnReason(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody PartnerRating partnerRating)
	   {
		 response=dashboardService.getCurruntRatingnReason(partnerRating);
			return response;

	   }
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveReasonsForRating/{user}/{token}")
	 public Response saveReasonsForRating(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody PartnerRating partnerRating)
	   {
		 response=dashboardService.saveReasonsForRating(partnerRating);
			return response;

	   }
	
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/showRatingHistory/{user}/{token}")
	 public Response showRatingHistory(@PathParam("token") String token,
				@PathParam("user") String name,@RequestBody PartnerRating partnerRating)
	   {
		 response=dashboardService.showRatingHistory(partnerRating);
			return response;

	   }
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMutliselect/{user}/{token}")
	 public Response getMutliselect(@QueryParam("context") String context,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<ActivityTarcker> br = new BaseResponse<>();
		   response=dashboardService.getMutiselectValue(context);
			return response;
	   }
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getExecutionEnabler/{user}/{token}")
	 public Response getExecutionEnabler(@QueryParam("partyId") int partyId,@PathParam("token") String token,
				@PathParam("user") String name)
	   {
			//System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFED");
		   BaseResponse<ActivityTarcker> br = new BaseResponse<>();
		   response=dashboardService.getExecutionEnabler(partyId);
			return response;
	   }
}
