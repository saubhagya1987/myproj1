package in.fiinfra.cp.common.service;

import in.fiinfra.auth.model.GetRequest;
import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.FaqsQuestionsData;
import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.TaskData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.common.model.CommonRequest;
import in.fiinfra.cp.common.util.AuthHandler;

import java.util.List;

public class CommonService extends BasicService {

	public List<FaqsQuestionsData> getListOfFaqs(BaseRequest request) {

		return getService().getForObjectCollection(Services.getListOfFaqs,
				request, FaqsQuestionsData.class, appendPathParam());
	}

	public List<TaskData> getListOfTasks(BaseRequest request) {

		return getService().getForObjectCollection(Services.getListOfTask,
				request, TaskData.class,
				appendPathParam("" + request.getPartyId()));
	}

	public List<QueryData> getListOfQueries(BaseRequest request) {

		return getService().getForObjectCollection(Services.getQueryList,
				request, QueryData.class, appendPathParam());
	}

	public List<CodeValueData> getListOfCities(BaseRequest request) {

		return getService().getForObjectCollection(Services.getCityList,
				request, CodeValueData.class, appendPathParam());
	}

	public List<BroadcastData> getListOfBroadcast(BaseRequest request) {
		return getService().getForObjectCollection(Services.getListOfBroadcast,
				request, BroadcastData.class, appendPathParam());

	}

	public List<TestimonialData> getListOfTestimonials(BaseRequest request) {
		return getService().getForObjectCollection(
				Services.getListOfTestimonials, request, TestimonialData.class,
				appendPathParam());
	}
	
	public List<Integer> getListOfTestimonialIds(BaseRequest request) {
		return getService().getForObjectCollection(
				Services.getListOfTestimonialIds, request, Integer.class,
				appendPathParam());
	}

	public List<GupShupData> getListOfGupShup(BaseRequest request) {
		return getService().getForObjectCollection(Services.getListOfGupshup,
				request, GupShupData.class, appendPathParam());
	}

	public List<Integer> getGupShupIds(BaseRequest request) {
		return getService().getForObjectCollection(
				Services.getListOfGupshupIds, request, Integer.class,
				appendPathParam());
	}

	public GupShupCommentData saveGupShupComment(GupShupCommentData comment) {

		return getService().postForObject(Services.addGupShupComment, comment,
				GupShupCommentData.class, appendPathParam());
	}

	public LikeData addLike(LikeData likeData) {
		return getService().postForObject(Services.addLike, likeData,
				LikeData.class, appendPathParam());
	}

	public List<AlertData> getAlerts(CommonRequest request) {
		return getService().getForObjectCollection(Services.getAlerts, request,
				AlertData.class, appendPathParam());
	}

	public int getAlertCount(int partyId) {
		return getService().getForObject(Services.getAlertCount,
				new GetRequest().param("partyId", partyId), Integer.class,
				appendPathParam());
	}

	public TestimonialData addTestimonial(TestimonialData testimonialData) {
		return getService().postForObject(Services.addTestimonial,
				testimonialData, TestimonialData.class, appendPathParam());
	}

	public GupShupData getGupShupById(CommonRequest request) {
		return getService().getForObject(Services.getGupshupById, request,
				GupShupData.class, appendPathParam());
	}
	public TestimonialData getTestimonialById(CommonRequest request) {
		return getService().getForObject(Services.getTestimonialById,
				request, TestimonialData.class, appendPathParam());
	}
	

	public List<CalenderData> getListOfCalenderEvents(BaseRequest request) {
		return getService().getForObjectCollection(Services.getCalenderEvents,
				request, CalenderData.class, appendPathParam());
	}
	
	public List<CodeValueData> getCodeValuesForParentId(CommonRequest request){
		UserSession user = AuthHandler.getCurrentUser();
		return getService().getForObjectCollection(Services.GET_CODE_VALUES_FOR_PARENTID,
				request, CodeValueData.class, new String[]{request.getParentId().toString(),user.getToken()});
		
	}

	public List<KeyValue> getProducts(CommonRequest request){
		return getService().getForObjectCollection(Services.getProducts,
				request, KeyValue.class, appendPathParam());
		
	}

	public List<FinancialAccountData> getAccounts(CommonRequest request){
		return getService().getForObjectCollection(Services.getFinancialAccounts,
				request, FinancialAccountData.class, appendPathParam());
		
	}

}
