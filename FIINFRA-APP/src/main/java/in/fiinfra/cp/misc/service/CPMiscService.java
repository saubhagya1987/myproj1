package in.fiinfra.cp.misc.service;

import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.TestimonialData;

import java.util.List;

public interface CPMiscService {

	List<TestimonialData> getTestimonials(int buId, int partyId, int page,
			int rows);

	List<GupShupData> getGupShup(int buId, int partyId, int page, int rows);

	List<BroadcastData> getBroadcastlist(int buId, int partyId);

	GupShupCommentData saveGupshupComment(int buId,
			GupShupCommentData gupShupCommentData);

	GupShupCommentData insertComment(int buId,
			GupShupCommentData gupShupCommentData);

	LikeData addLike(int buId, LikeData likeData);

	TestimonialData insertTestimonial(int buId, TestimonialData testimonialData);

	List<AlertData> getAlerts(int buId, Integer partyId);

	public int getAlertCount(int buId, Integer partyId);

	List<Integer> getTestimonialIds(int buId, int partyId, int page, int row);

	List<Integer> getGupShupIds(int buId,int partyId);

	GupShupData getGupShupById(int buId,int postId, int partyId);

	TestimonialData getTestimonialById(int buId,int testimonialId, int partyId);

	List<CalenderData> getCalenderEvents(int buId, int partyId);

}
