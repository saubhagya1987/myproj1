package in.fiinfra.service;

import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.pg.AutoPaymentData;
import in.fiinfra.pg.NachData;
import in.fiinfra.pg.OrderData;
import in.fiinfra.pg.PaymentData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxProductData;

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
		genericMapping
				.put(SubscriptionData.class,
						new ParameterizedTypeReference<BaseResponse<SubscriptionData>>() {
						});
		genericMapping.put(PaymentData.class,
				new ParameterizedTypeReference<BaseResponse<PaymentData>>() {
				});
		genericMapping.put(OrderData.class,
				new ParameterizedTypeReference<BaseResponse<OrderData>>() {
				});

		genericMapping.put(CodeValueData.class,
				new ParameterizedTypeReference<BaseResponse<CodeValueData>>() {
				});

		genericMapping.put(Response.class,
				new ParameterizedTypeReference<BaseResponse<Response>>() {
				});

		genericMapping.put(KeyValue.class,
				new ParameterizedTypeReference<BaseResponse<KeyValue>>() {
				});
		genericMapping.put(Integer.class,
				new ParameterizedTypeReference<BaseResponse<Integer>>() {
				});

		genericMapping.put(Boolean.class,
				new ParameterizedTypeReference<BaseResponse<Boolean>>() {
				});
		genericMapping
				.put(SubxProductData.class,
						new ParameterizedTypeReference<BaseResponse<SubxProductData>>() {
						});
		genericMapping.put(ReportData.class,
				new ParameterizedTypeReference<BaseResponse<ReportData>>() {
				});
		genericMapping.put(NachData.class,
				new ParameterizedTypeReference<BaseResponse<NachData>>() {
				});
		genericMapping.put(DocumentData.class,
				new ParameterizedTypeReference<BaseResponse<DocumentData>>() {
				});
		genericMapping.put(AutoPaymentData.class,
				new ParameterizedTypeReference<BaseResponse<AutoPaymentData>>() {
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
		// UserSession currentUser = AuthHandler.getCurrentUser();

		// .append("&sourceSystemId=")
		// .append(currentUser.getSourceSystemId());
		if (HttpMethod.GET.equals(method) && param != null
				&& param instanceof BaseRequest) {
			// BaseRequest req = (BaseRequest) param;
			// httpUrl.append("?").append("buId=").append(req.getBuId());
			httpUrl.append("?")
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
