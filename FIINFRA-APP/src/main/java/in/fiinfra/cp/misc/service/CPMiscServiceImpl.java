package in.fiinfra.cp.misc.service;

import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.misc.dao.CPMiscDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cpMiscService")
public class CPMiscServiceImpl implements CPMiscService {

	@Autowired
	CPMiscDao dao;

	@Override
	public List<TestimonialData> getTestimonials(int buId, int partyId,
			int page, int rows) {
		return dao.getTestimonials(buId, partyId, page, rows);
	}

	@Override
	public List<GupShupData> getGupShup(int buId, int partyId, int page,
			int rows) {
		return dao.getGupShup(buId, partyId, page, rows);
	}

	@Override
	public GupShupCommentData saveGupshupComment(int buId,
			GupShupCommentData gupShupCommentData) {
		gupShupCommentData = dao.saveGupShupComment(buId, gupShupCommentData);
		return gupShupCommentData;
	}

	@Override
	public List<BroadcastData> getBroadcastlist(int sourceSystemId, int buId) {
		return dao.getBroadcast(sourceSystemId, buId);
	}

	@Override
	public GupShupCommentData insertComment(int buId,
			GupShupCommentData gupShupCommentData) {
		gupShupCommentData = dao.insertComment(buId, gupShupCommentData);
		return gupShupCommentData;
	}

	@Override
	public LikeData addLike(int buId, LikeData likeData) {
		likeData = dao.addLike(buId, likeData);
		return likeData;
	}

	@Override
	public TestimonialData insertTestimonial(int buId,
			TestimonialData testimonialData) {
		testimonialData = dao.insertTestimonail(buId, testimonialData);
		return testimonialData;
	}

	@Override
	public List<AlertData> getAlerts(int buId, Integer partyId) {
		return dao.getAlerts(buId, partyId);
	}

	@Override
	public int getAlertCount(int buId, Integer partyId) {
		return dao.getAlertCount(buId, partyId);
	}

	@Override
	public List<Integer> getTestimonialIds(int buId, int partyId, int page,
			int rows) {
		return dao.getTestimonialIds(buId, partyId, page, rows);
	}

	@Override
	public List<Integer> getGupShupIds(int buId,int partyId ) {
		return dao.getGupShupIds(buId,partyId);
	}

	@Override
	public GupShupData getGupShupById(int buId, int postId, int partyId) {
		return dao.getGupShupById(buId, postId, partyId);
	}

	@Override
	public TestimonialData getTestimonialById(int buId,int testimonialId, int partyId) {
		return dao.getTestimonialById(buId, testimonialId, partyId);
	}

	@Override
	public List<CalenderData> getCalenderEvents(int buId, int partyId) {
		return dao.getCalenderEvents(buId, partyId);
	}

}
