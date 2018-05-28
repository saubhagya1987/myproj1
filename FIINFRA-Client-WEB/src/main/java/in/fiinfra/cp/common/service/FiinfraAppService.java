package in.fiinfra.cp.common.service;

import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FaqsQuestionsData;
import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.note.Note;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.cp.AchievementScaleData;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.Assumption;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.CommentData;
import in.fiinfra.cp.ExpenseData;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.FinancialData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.IncomeData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.LoanData;
import in.fiinfra.cp.PlanData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.QuestionData;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.ws.rs.core.Response;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

public class FiinfraAppService extends RestTemplate {

	private final Properties urls;

	private final Map<Class<?>, ParameterizedTypeReference<?>> genericMapping = new HashMap<Class<?>, ParameterizedTypeReference<?>>();

	public FiinfraAppService(Properties urls) {
		this.urls = urls;
		registerTypeRef();

		// List<HttpMessageConverter<?>> converters = getMessageConverters();
		//
		// for (HttpMessageConverter<?> converter : converters) {
		// if (converter instanceof MappingJacksonHttpMessageConverter) {
		// MappingJacksonHttpMessageConverter jsonConverter =
		// (MappingJacksonHttpMessageConverter) converter;
		// jsonConverter.setObjectMapper(new FiinInfraObjectMapper());
		// }
		// }
	}

	private void registerTypeRef() {
		genericMapping.put(QueryData.class,
				new ParameterizedTypeReference<BaseResponse<QueryData>>() {
				});
		genericMapping.put(CommentData.class,
				new ParameterizedTypeReference<BaseResponse<CommentData>>() {
				});
		genericMapping.put(CodeValueData.class,
				new ParameterizedTypeReference<BaseResponse<CodeValueData>>() {
				});
		genericMapping.put(PartyData.class,
				new ParameterizedTypeReference<BaseResponse<PartyData>>() {
				});

		genericMapping
				.put(QueryCommentData.class,
						new ParameterizedTypeReference<BaseResponse<QueryCommentData>>() {
						});

		genericMapping.put(Response.class,
				new ParameterizedTypeReference<BaseResponse<Response>>() {
				});

		genericMapping.put(ProfileData.class,
				new ParameterizedTypeReference<BaseResponse<ProfileData>>() {
				});

		genericMapping.put(KeyValue.class,
				new ParameterizedTypeReference<BaseResponse<KeyValue>>() {
				});
		genericMapping.put(Integer.class,
				new ParameterizedTypeReference<BaseResponse<Integer>>() {
				});
		genericMapping.put(Note.class,
				new ParameterizedTypeReference<BaseResponse<Note>>() {
				});

		genericMapping.put(DocumentData.class,
				new ParameterizedTypeReference<BaseResponse<DocumentData>>() {
				});

		genericMapping.put(UserSession.class,
				new ParameterizedTypeReference<BaseResponse<UserSession>>() {
				});

		genericMapping.put(IncomeData.class,
				new ParameterizedTypeReference<BaseResponse<IncomeData>>() {
				});

		genericMapping.put(ExpenseData.class,
				new ParameterizedTypeReference<BaseResponse<ExpenseData>>() {
				});
		genericMapping.put(GoalData.class,
				new ParameterizedTypeReference<BaseResponse<GoalData>>() {
				});
		genericMapping
				.put(FaqsQuestionsData.class,
						new ParameterizedTypeReference<BaseResponse<FaqsQuestionsData>>() {
						});

		genericMapping.put(FinancialData.class,
				new ParameterizedTypeReference<BaseResponse<FinancialData>>() {
				});
		genericMapping.put(AssetData.class,
				new ParameterizedTypeReference<BaseResponse<AssetData>>() {
				});

		genericMapping.put(PlanData.class,
				new ParameterizedTypeReference<BaseResponse<PlanData>>() {
				});
		genericMapping.put(QuestionData.class,
				new ParameterizedTypeReference<BaseResponse<QuestionData>>() {
				});
		genericMapping.put(BroadcastData.class,
				new ParameterizedTypeReference<BaseResponse<BroadcastData>>() {
				});

		genericMapping.put(Assumption.class,
				new ParameterizedTypeReference<BaseResponse<Assumption>>() {
				});
		genericMapping
				.put(TestimonialData.class,
						new ParameterizedTypeReference<BaseResponse<TestimonialData>>() {
						});
		genericMapping.put(GupShupData.class,
				new ParameterizedTypeReference<BaseResponse<GupShupData>>() {
				});
		genericMapping
				.put(GupShupCommentData.class,
						new ParameterizedTypeReference<BaseResponse<GupShupCommentData>>() {
						});
		genericMapping.put(LikeData.class,
				new ParameterizedTypeReference<BaseResponse<LikeData>>() {
				});

		genericMapping.put(AnswerData.class,
				new ParameterizedTypeReference<BaseResponse<AnswerData>>() {
				});
		genericMapping.put(Party.class,
				new ParameterizedTypeReference<BaseResponse<Party>>() {
				});
		genericMapping.put(LoanData.class,
				new ParameterizedTypeReference<BaseResponse<LoanData>>() {
				});
		genericMapping.put(CalenderData.class,
				new ParameterizedTypeReference<BaseResponse<CalenderData>>() {
				});

		genericMapping
				.put(UserDetailsJson.class,
						new ParameterizedTypeReference<BaseResponse<UserDetailsJson>>() {
						});
		genericMapping
				.put(AchievementScaleData.class,
						new ParameterizedTypeReference<BaseResponse<AchievementScaleData>>() {
						});

		genericMapping.put(AlertData.class,
				new ParameterizedTypeReference<BaseResponse<AlertData>>() {
				});
		
		genericMapping.put(Boolean.class,
				new ParameterizedTypeReference<BaseResponse<Boolean>>() {
				});
		genericMapping.put(FinancialAccountData.class,
				new ParameterizedTypeReference<BaseResponse<FinancialAccountData>>() {
				});

		genericMapping.put(QuestionDetails.class,
				new ParameterizedTypeReference<BaseResponse<QuestionDetails>>() {
				});
		genericMapping.put(IssuerId.class,
				new ParameterizedTypeReference<BaseResponse<IssuerId>>() {
				});

		


	}

	public <T> BaseResponse<T> internalPostObject(Services service,
			Object param, Class<T> typeClass, String[] pathParams) {
		return internalRequest(service, HttpMethod.POST, param, typeClass,
				pathParams);
	}

	public <T> T postForObject(Services service, Object param,
			Class<T> typeClass, String[] pathParams) {
		BaseResponse<T> response = internalPostObject(service, param,
				typeClass, pathParams);

		// check for correct response
		// response.getReasonCode()
		return response != null ? response.getResponseObject() : null;
	}

	public <T> List<T> postForObjectCollection(Services service, Object param,
			Class<T> typeClass, String[] pathParams) {
		BaseResponse<T> response = internalPostObject(service, param,
				typeClass, pathParams);
		return response != null ? response.getResponseListObject()
				: new ArrayList<T>();
	}

	private URI toUri(String url, Object[] pathParams) {
		return UriComponentsBuilder.fromUriString(url)
				.buildAndExpand(pathParams).encode().toUri();

	}

	public <T> List<T> getForObjectCollection(Services service,
			BaseRequest request, Class<T> typeClass, String[] pathParams) {
		BaseResponse<T> response = internalGetRequest(service, request,
				typeClass, pathParams);

		return response != null ? response.getResponseListObject()
				: new ArrayList<T>();
	}

	public <T> T getForObject(Services service, BaseRequest request,
			Class<T> typeClass, String[] pathParams) {
		BaseResponse<T> response = internalGetRequest(service, request,
				typeClass, pathParams);
		return response != null ? response.getResponseObject() : null;
	}

	@SuppressWarnings("unchecked")
	private <T> BaseResponse<T> internalGetRequest(Services service,
			BaseRequest request, Class<T> typeClass, String[] pathParams) {
		return internalRequest(service, HttpMethod.GET, request, typeClass,
				pathParams);
	}

	@SuppressWarnings("unchecked")
	private <T> BaseResponse<T> internalRequest(Services service,
			HttpMethod method, Object param, Class<T> typeClass,
			String[] pathParams) {
		// T response = (T)
		// FiinfraUtility.postRequest(UriComponentsBuilder.fromHttpUrl(url),
		// typeClass,this);
		String url = urls.getProperty(service.getValue());

		ParameterizedTypeReference<BaseResponse<T>> typeRef = (ParameterizedTypeReference<BaseResponse<T>>) genericMapping
				.get(typeClass);
		if (typeRef == null) {
			typeRef = new ParameterizedTypeReference<BaseResponse<T>>() {
			};
		}

		HttpEntity<Object> requestEntity = null;

		StringBuilder httpUrl = new StringBuilder(url);
		UserSession currentUser = AuthHandler.getCurrentUser();

		httpUrl.append("?").append("buId=").append(currentUser.getBuId()).append("&userId=").append(currentUser.getUserId())
				.append("&sourceSystemId=")
				.append(currentUser.getSourceSystemId());
		if (HttpMethod.GET.equals(method) && param != null
				&& param instanceof BaseRequest) {
			httpUrl.append("&")
					.append(((BaseRequest) param).buildQueryString());
		} else {
			requestEntity = new HttpEntity<Object>(param);
		}

		BaseResponse<T> response = exchange(
				toUri(httpUrl.toString(), pathParams), method, requestEntity,
				typeRef).getBody();

		// CustomBaseResponse<T> response =
		// getForObject(toUri(httpUrl.toString(), pathParams), typeRef);
		// check for correct response
		// response.getReasonCode()
		return response;
	}

	public UserSession getUserByToken(Services service, BaseRequest param,
			String[] pathParams) {
		// T response = (T)
		// FiinfraUtility.postRequest(UriComponentsBuilder.fromHttpUrl(url),
		// typeClass,this);
		String url = urls.getProperty(service.getValue());

		ParameterizedTypeReference<UserSession> typeRef = new ParameterizedTypeReference<UserSession>() {
		};

		HttpEntity<Object> requestEntity = null;

		
		StringBuilder httpUrl = new StringBuilder(url);
		httpUrl.append("?").append(param.buildQueryString());

		UserSession response = exchange(toUri(httpUrl.toString(), pathParams),
				HttpMethod.GET, requestEntity, typeRef).getBody();

		return response;
	}

	
	public Boolean saveAccessLog(Services service, UserAccessLog accessLog,
			String[] pathParams) {
		// T response = (T)
		// FiinfraUtility.postRequest(UriComponentsBuilder.fromHttpUrl(url),
		// typeClass,this);
		String url = urls.getProperty(service.getValue());

		ParameterizedTypeReference<BaseResponse<Boolean>> typeRef = new ParameterizedTypeReference<BaseResponse<Boolean>>() {
		};

		HttpEntity<Object> requestEntity = null;

		requestEntity = new HttpEntity<Object>(accessLog);
		
		StringBuilder httpUrl = new StringBuilder(url);

		BaseResponse<Boolean> response =  exchange(toUri(httpUrl.toString(), pathParams),
				HttpMethod.POST, requestEntity, typeRef).getBody();

		return response != null ? response.getResponseObject():false;
	}


	public <T> T getWithoutResponseObject(Services service, BaseRequest param,
			Class<T> typeClass, String[] pathParams) {
		// T response = (T)
		// FiinfraUtility.postRequest(UriComponentsBuilder.fromHttpUrl(url),
		// typeClass,this);
		String url = urls.getProperty(service.getValue());

		ParameterizedTypeReference<T> typeRef = new ParameterizedTypeReference<T>() {
		};

		HttpEntity<Object> requestEntity = null;

		StringBuilder httpUrl = new StringBuilder(url);
		httpUrl.append("?").append(param.buildQueryString());

		T response = exchange(toUri(httpUrl.toString(), pathParams),
				HttpMethod.GET, requestEntity, typeClass).getBody();

		return response;
	}

}
