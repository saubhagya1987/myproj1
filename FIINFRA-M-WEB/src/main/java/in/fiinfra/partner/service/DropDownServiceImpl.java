/**
 * 
 */
package in.fiinfra.partner.service;

import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductCommension;
import in.fiinfra.common.partner.AssetAvailableValue;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.JsonData;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * @author Kunal
 * 
 */
@Component
public class DropDownServiceImpl implements DropDownService {

	private static final Logger LOGGER = Logger.getLogger(DropDownServiceImpl.class);
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Value("${GET_COMPANY_NAME}")
	private String GET_COMPANY_NAME;
	
	@Value("${GET_ASSETTYPES_URL}")
	private String GET_ASSETTYPES_URL;
	
	@Value("${GET_ASSETNAMES_URL}")
	private String GET_ASSETNAMES_URL;
	
	@Value("${GET_ASSET_AVAILABLE_VALUE_URL}")
	private String GET_ASSET_AVAILABLE_VALUE_URL;
	
	@Value("${GET_PRODUCTS_NAME}")
	private String GET_PRODUCTS_NAME;
	
	@Value("${GET_PRODUCT_CATEGORY}")
	private String GET_PRODUCT_CATEGORY;
	
	@Value("${GET_PRODUCT_CATEGORY_RISKCOVER_URL}")
	private String GET_PRODUCT_CATEGORY_RISKCOVER;
	
	@Value("${GET_COMPANYNAME_RISKCOVER_URL}")
	private String GET_COMPANYNAME_RISKCOVER;
	
	@Value("${GET_PRODUCTS_NAME_RISKCOVER_URL}")
	private String GET_PRODUCTS_NAME_RISKCOVER;
	
	@Value("${GET_PRODUCT_COMMISSION}")
	private String GET_PRODUCT_COMMISSION;
	
	@Value("${DELETE_RECOMMENDATION_FOR_PRODUCT_CATEGORY}")
	private String DELETE_RECOMMENDATION_FOR_PRODUCT_CATEGORY;
	
	@Value("${GET_PRODUCT_FOR_RISK_COVER}")
	private String GET_PRODUCT_FOR_RISK_COVER;
	
	@Value("${GET_PRODUCTS_FOR_GOAL_BUCKET}")
	private String GET_PRODUCTS_FOR_GOAL_BUCKET;
	
	@Value("${GET_FAMILY_MEMBERS_URL}")
	private String GET_FAMILY_MEMBERS;
	
	@Value("${GET_ALL_PRODUCTS_NAME}")
	private String GET_ALL_PRODUCTS_NAME;
	
	String token = "153443";
	Integer buId = 153;
	
	public synchronized List<JsonData> getProductCategoryList(HttpServletRequest request,Integer vacationId){
		UriComponentsBuilder uriCBForProdCategory;
		//Integer vacationId = 47007;//tax chaNGE THIS
		
		List<JsonData> productCategoryList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		productCategoryList.add(jsonDataDefault);
		uriCBForProdCategory = UriComponentsBuilder.fromHttpUrl(GET_PRODUCT_CATEGORY+ "/" + vacationId+ "/"+ token +"?buId="+buId);
		BaseResponse<KeyValue> baseResponseForProdCategory = new BaseResponse<KeyValue>();
		
		//call service to get Product Category drop down data 
		baseResponseForProdCategory = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCBForProdCategory), BaseResponse.class).getBody();
		
		List<KeyValue> prodCategoryAsJson = new ArrayList<KeyValue>();
		
		if (baseResponseForProdCategory.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				prodCategoryAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponseForProdCategory.getResponseListObject()), List.class);
				
				for(int i = 0; i<prodCategoryAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(prodCategoryAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productCategoryList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return productCategoryList;
	}
	
	public List<JsonData> getProductCategoryList(Integer productTypeId){
		UriComponentsBuilder uriCBForProdCategory;
		//Integer vacationId = 47007;//tax chaNGE THIS
		
		List<JsonData> productCategoryList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		productCategoryList.add(jsonDataDefault);
		uriCBForProdCategory = UriComponentsBuilder.fromHttpUrl(GET_PRODUCT_CATEGORY+ "/" + productTypeId+ "/"+ token +"?buId="+buId);
		BaseResponse<KeyValue> baseResponseForProdCategory = new BaseResponse<KeyValue>();
		
		//call service to get Product Category drop down data 
		baseResponseForProdCategory = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCBForProdCategory), BaseResponse.class).getBody();
		
		List<KeyValue> prodCategoryAsJson = new ArrayList<KeyValue>();
		
		if (baseResponseForProdCategory.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				prodCategoryAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponseForProdCategory.getResponseListObject()), List.class);
				
				for(int i = 0; i<prodCategoryAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(prodCategoryAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productCategoryList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return productCategoryList;
	}
	
	/* (non-Javadoc)
	 * @see in.fiinfra.partner.service.DropDownService#getProductNamesList(javax.servlet.http.HttpServletRequest)
	 */
	
	@Override
	public synchronized List<JsonData> getProductNamesList(HttpServletRequest request,String productData,String assetClassId,
			String productTypeId,String categoryId,String userName) {
		
		UriComponentsBuilder uriCB;
		/*String manufactureId = request.getParameter("manufactureId");
		String categoryId = request.getParameter("categoryId");*/
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCTS_FOR_GOAL_BUCKET+"/" + productData + "/" + assetClassId + "/" + productTypeId + "/"+ categoryId+ "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> productnamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> productnamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		/*jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");*/
		productnamesList.add(jsonDataDefault);
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				productnamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<productnamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(productnamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productnamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return productnamesList;
	}
	
	@Override
	public synchronized List<JsonData> getAllProductNamesList(HttpServletRequest request,String productData,String assetClassId,
			String productTypeId,String categoryId,String userName) {
		 
		UriComponentsBuilder uriCB;
		/*String manufactureId = request.getParameter("manufactureId");
		String categoryId = request.getParameter("categoryId");*/
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ALL_PRODUCTS_NAME+"/" + productData + "/" + assetClassId + "/" + productTypeId + "/"+ categoryId+ "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> productnamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> productnamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		/*jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");*/ 
		productnamesList.add(jsonDataDefault);
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				productnamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<productnamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(productnamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productnamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return productnamesList;
	}
	
	
	@Override
	public synchronized List<JsonData> getProductNamesList(HttpServletRequest request) {
		
		UriComponentsBuilder uriCB;
		String manufactureId = request.getParameter("manufactureId");
		String categoryId = request.getParameter("categoryId");
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCTS_NAME+ "/" +manufactureId + "/"+ categoryId+ "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> productnamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> productnamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		productnamesList.add(jsonDataDefault);
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				productnamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<productnamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(productnamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productnamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return productnamesList;
	}
	
	@Override
	public String getCommisssionValues(HttpServletRequest request,String userName) {
		
		String token="12345";
		Integer buPartyId = 27827;
		UriComponentsBuilder uriCB;
		String categoryId = request.getParameter("categoryId");
		String productId = request.getParameter("productId");
		String productTypeId=request.getParameter("productTypeId");
		String assetClassId=request.getParameter("assetClassId");
		if(null!=productId && !productId.isEmpty()){
			GoalPlanInput goalPlanInput=new GoalPlanInput();
			goalPlanInput.setAssetClassId(assetClassId);
			goalPlanInput.setProductId(Integer.parseInt(productId));
			goalPlanInput.setProductTypeId(Integer.parseInt(productTypeId));
			goalPlanInput.setCategoryId(Integer.parseInt(categoryId));
			goalPlanInput.setBuPartyId(buPartyId);
			
			uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCT_COMMISSION+ "/" + userName +"/"+ token +"?buId="+buId);
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			List<ProductCommension> productCommissionList = new ArrayList<ProductCommension>();
			String commission="";
			
			//call service for all parties associated 
			baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB),goalPlanInput,BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				try {
					List<ProductCommension> goalJsonDataList = null;
					goalJsonDataList = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
					
					for(int i=0;i<goalJsonDataList.size();i++){
						ProductCommension productCommension = objectMapper.readValue(objectMapper.writeValueAsString(goalJsonDataList.get(i)), ProductCommension.class);
						productCommissionList.add(productCommension);
					}
				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonGenerationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(!productCommissionList.isEmpty() && (null!=productCommissionList.get(0).getUpfront()) && (null!=productCommissionList.get(0).getTrial())){
				commission=""+productCommissionList.get(0).getUpfront()+","+productCommissionList.get(0).getTrial();
			}
			return commission;
		}
		return null;
	}
	
	/* (non-Javadoc)
	 * @see in.fiinfra.partner.service.DropDownService#getCompanynameList(javax.servlet.http.HttpServletRequest)
	 */
	@Override
	public List<JsonData> getCompanynameList(HttpServletRequest request,Integer categoryId) {
		String token = "153443";
		UriComponentsBuilder uriCB;
		//String categoryId = request.getParameter("categoryId");//48016;
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_COMPANY_NAME+ "/" + categoryId+ "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> comapanynamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> comapanynamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		comapanynamesList.add(jsonDataDefault);
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				comapanynamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<comapanynamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(comapanynamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					comapanynamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return comapanynamesList;
	}
	@Override
	public List<JsonData> getProductCategoryListForRiskCover(HttpServletRequest request,Integer ProductTypeId,String username){
		UriComponentsBuilder uriCBForProdCategory;
		//Integer vacationId = 47007;//tax chaNGE THIS
		
		List<JsonData> productCategoryList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		productCategoryList.add(jsonDataDefault);
		uriCBForProdCategory = UriComponentsBuilder.fromHttpUrl(GET_PRODUCT_CATEGORY_RISKCOVER + "/" + username + "/" + ProductTypeId+ "/"+ token +"?buId="+buId);
		BaseResponse<KeyValue> baseResponseForProdCategory = new BaseResponse<KeyValue>();
		
		//call service to get Product Category drop down data 
		baseResponseForProdCategory = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCBForProdCategory), BaseResponse.class).getBody();
		
		List<KeyValue> prodCategoryAsJson = new ArrayList<KeyValue>();
		
		if (baseResponseForProdCategory.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				prodCategoryAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponseForProdCategory.getResponseListObject()), List.class);
				
				for(int i = 0; i<prodCategoryAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(prodCategoryAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productCategoryList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return productCategoryList;
	}
	@Override
	public List<JsonData> getCompanynameListForRiskCover(HttpServletRequest request,Integer categoryId,String username) {
		String token = "153443";
		UriComponentsBuilder uriCB;
		//String categoryId = request.getParameter("categoryId");//48016;
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_COMPANYNAME_RISKCOVER + "/" + username +"/" + categoryId+ "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> comapanynamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> comapanynamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		comapanynamesList.add(jsonDataDefault);
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				comapanynamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<comapanynamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(comapanynamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					comapanynamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return comapanynamesList;
	}
	
	@Override
	public List<JsonData> getProductNamesListForRiskCover(HttpServletRequest request,String username) {
		
		UriComponentsBuilder uriCB;
		String manufactureId = request.getParameter("manufactureId");
		String categoryId = request.getParameter("categoryId");
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCTS_NAME+ "/" +manufactureId + "/"+ categoryId+ "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> productnamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> productnamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		productnamesList.add(jsonDataDefault);
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				productnamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<productnamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(productnamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productnamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return productnamesList;
	}
	
	@Override
	public List<JsonData> getProductNamesListForRiskCover(Integer riskId,String dataFor,String userName) {
		
		UriComponentsBuilder uriCB;
		
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_PRODUCT_FOR_RISK_COVER+ "/" +riskId + "/"+ dataFor+ "/"+ userName+ "/"+ token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		List<KeyValue> productnamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> productnamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		productnamesList.add(jsonDataDefault);
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				productnamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<productnamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(productnamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					productnamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return productnamesList;
	}

	@Override
	public String deleteRecommendationForProductCategory(
			HttpServletRequest request, String username) {
		String token="12345";
		UriComponentsBuilder uriCB;
		String fpRecommendId = request.getParameter("fpRecommendId");
		String result="failure";
		if(!fpRecommendId.isEmpty()){
			uriCB = UriComponentsBuilder.fromHttpUrl(DELETE_RECOMMENDATION_FOR_PRODUCT_CATEGORY+ "/" + fpRecommendId + "/" + username +"/"+ token +"?buId="+buId);
			BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
			
			
			//call service for all parties associated 
			baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
			if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
					result="success";
			}
		}else{
			result="success";
		}		
		
		return result;
	}
	
	@Override
	public List<JsonData> getAssetTypeList(String userName) {
		String token = "153443";
		UriComponentsBuilder uriCB;
		//String categoryId = request.getParameter("categoryId");//48016;
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSETTYPES_URL+ "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		List<KeyValue> assetTypeListAsJson = new ArrayList<KeyValue>();
		List<JsonData> assetTypeList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		assetTypeList.add(jsonDataDefault);
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetTypeListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<assetTypeListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(assetTypeListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					assetTypeList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return assetTypeList;
	}
	
	@Override
	public List<JsonData> getAssetNameList(String userName,Integer assetTypeId,Integer partyId, Integer goalId){
		String token = "153443";
		UriComponentsBuilder uriCB;
		//String categoryId = request.getParameter("categoryId");//48016;
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSETNAMES_URL+ "/" + partyId+ "/" + assetTypeId + "/" + goalId + "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		List<KeyValue> assetNamesListAsJson = new ArrayList<KeyValue>();
		List<JsonData> assetNamesList = new ArrayList<JsonData>();
		JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		assetNamesList.add(jsonDataDefault);
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetNamesListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<assetNamesListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(assetNamesListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					assetNamesList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return assetNamesList;
	}
	
	@Override
	public AssetAvailableValue getAssetAvailableValue(String userName,Integer partyAssetId, Integer goalId, Integer partyId){
		String token = "153443";
		UriComponentsBuilder uriCB;
		//String categoryId = request.getParameter("categoryId");//48016;
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_ASSET_AVAILABLE_VALUE_URL+ "/" + partyAssetId + "/" + goalId + "/" + partyId + "/" + userName + "/"+ token +"?buId="+buId);
		BaseResponse<AssetAvailableValue> baseResponse = new BaseResponse<AssetAvailableValue>();
		AssetAvailableValue assetavailableValue = new AssetAvailableValue();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				assetavailableValue = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseObject()), AssetAvailableValue.class);
								
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return assetavailableValue;
	}
	


	@Override
	public List<JsonData> getFamilyMembersList(String partyId, String userName) {
		String token = "153443";
		UriComponentsBuilder uriCB;
		//String categoryId = request.getParameter("categoryId");//48016;
		Integer buId = 153;
		uriCB = UriComponentsBuilder.fromHttpUrl(GET_FAMILY_MEMBERS+ "/" + userName + "/"+ token +"?buId="+buId +"&partyId="+partyId);
		BaseResponse<KeyValue> baseResponse = new BaseResponse<KeyValue>();
		List<KeyValue> familyMembersListAsJson = new ArrayList<KeyValue>();
		List<JsonData> familyMembersList = new ArrayList<JsonData>();
		/*JsonData jsonDataDefault = new JsonData();
		jsonDataDefault.setValue(-1);
		jsonDataDefault.setText("---Select---");
		familyMembersList.add(jsonDataDefault);*/
		//call service for all parties associated 
		baseResponse = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			try {
				familyMembersListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				for(int i = 0; i<familyMembersListAsJson.size(); i++){
					//get the actual party object from its LinkedHashMap representation
					KeyValue keyValue = new KeyValue();
					JsonData jsonData = new JsonData();
					keyValue = objectMapper.readValue(objectMapper.writeValueAsString(familyMembersListAsJson.get(i)), KeyValue.class);
					jsonData.setValue(keyValue.getId());
					jsonData.setText(keyValue.getName());
					familyMembersList.add(jsonData);
				}
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return familyMembersList;
	}
	
}
