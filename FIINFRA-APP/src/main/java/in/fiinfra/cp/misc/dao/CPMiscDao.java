package in.fiinfra.cp.misc.dao;

import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.TestimonialData;

import java.util.List;

public interface CPMiscDao {

	List<TestimonialData> getTestimonials(int buId, int party, int page,
			int rows);

	public List<GupShupData> getGupShup(int partyId, int buId, int page,
			int rows);

	List<BroadcastData> getBroadcast(int buId, int partyId);

	GupShupCommentData saveGupShupComment(int buId,
			GupShupCommentData gupShupCommentData);

	GupShupCommentData insertComment(int buId,
			GupShupCommentData gupShupCommentData);

	LikeData addLike(int buId, LikeData likeData);

	TestimonialData insertTestimonail(int buId, TestimonialData testimonialData);

	List<AlertData> getAlerts(int buId, Integer partyId);

	public int getAlertCount(int buId, Integer partyId);

	List<Integer> getTestimonialIds(int buId, int partyId, int page, int row);

	List<Integer> getGupShupIds(int buId, int partyId);

	GupShupData getGupShupById(int buId, int postId, int partyId);

	TestimonialData getTestimonialById(int buId,int testimonialId, int partyId);

	List<CalenderData> getCalenderEvents(int buId, int partyId);
}
