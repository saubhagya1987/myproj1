package in.fiinfra.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.PremiumMaster;
import in.fiinfra.common.service.vo.PriceHistory;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.service.vo.ProductCategoryRevenue;
import in.fiinfra.common.service.vo.ProductMfg;
import in.fiinfra.common.service.vo.ProductRevenueBook;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.CommonUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonParseException;

public class ProductController extends MultiActionController {

	private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(ProductController.class);
	
	private RestTemplate restTemplate;

	private ObjectMapper objectMapper;

	String url;

	@Value("${URL_GET_ASSET_LIST}")
	private String URL_GET_ASSET_LIST;

	@Value("${URL_GET_ASSET_PRODUCT_TYPE}")
	private String URL_GET_ASSET_PRODUCT_TYPE;

	@Value("${URL_GET_PRODUCT_CATEGORY}")
	private String URL_GET_PRODUCT_CATEGORY;

	@Value("${URL_GET_PRODUCT_MASTER_LIST}")
	private String URL_GET_PRODUCT_MASTER_LIST;

	@Value("${URL_UPDATE_PRODUCT_MASTER_LIST}")
	private String URL_UPDATE_PRODUCT_MASTER_LIST;

	// premium master
	@Value("${URL_GET_PREMIUM_MASTER_LIST}")
	private String URL_GET_PREMIUM_MASTER_LIST;

	@Value("${URL_ADD_UPDATE_PREMIUM_MASTER}")
	private String URL_ADD_UPDATE_PREMIUM_MASTER;

	@Value("${URL_CHECK_PREMIUM_MASTER_AGE_RANGE}")
	private String URL_CHECK_PREMIUM_MASTER_AGE_RANGE;

	// price history
	@Value("${URL_GET_PRODUCT_PRICE_HISTORY_LIST}")
	private String URL_GET_PRODUCT_PRICE_HISTORY_LIST;

	@Value("${URL_ADD_UPDATE_PRODUCT_PRICE}")
	private String URL_ADD_UPDATE_PRODUCT_PRICE;

	@Value("${URL_CHECK_PRICE_VALUE_FOR_DATE}")
	private String URL_CHECK_PRICE_VALUE_FOR_DATE;

	// revenue
	@Value("${URL_GET_REVENUE_MASTER_LIST}")
	private String URL_GET_REVENUE_MASTER_LIST;

	@Value("${URL_ADD_UPDATE_PRODUCT_REVENUE}")
	private String URL_ADD_UPDATE_PRODUCT_REVENUE;

	@Value("${URL_GET_RECORD_TYPE_BY_ID}")
	private String URL_GET_RECORD_TYPE_BY_ID;

	@Value("${URL_GET_RECORD_TYPE}")
	private String URL_GET_RECORD_TYPE;

	@Value("${URL_CHECK_PRODUCT_REVENUE_RANGE}")
	private String URL_CHECK_PRODUCT_REVENUE_RANGE;

	@Value("${URL_CHECK_PRODUCT_REVENUE_YEAR_RANGE}")
	private String URL_CHECK_PRODUCT_REVENUE_YEAR_RANGE;

	// product Category Revenue
	@Value("${URL_GET_PRODUCT_CATEGORY_REVENUE_LIST}")
	private String URL_GET_PRODUCT_CATEGORY_REVENUE_LIST;

	@Value("${URL_CHECK_PRODUCT_CATEGORY_REVENUE}")
	private String URL_CHECK_PRODUCT_CATEGORY_REVENUE;

	@Value("${URL_ADD_UPDATE_PRODUCT_CATEGORY_REVENUE}")
	private String URL_ADD_UPDATE_PRODUCT_CATEGORY_REVENUE;

	// product manufacturer
	@Value("${URL_GET_PRODUCT_MFG_LIST}")
	private String URL_GET_PRODUCT_MFG_LIST;
	
	@Value("${URL_ADD_UPDATE_PRODUCT_MFG}")
	private String URL_ADD_UPDATE_PRODUCT_MFG;
	
	@Value("${URL_GET_PRODUCT_MFG_TYPE}")
	private String URL_GET_PRODUCT_MFG_TYPE;
	
	@Value("${URL_CHECK_CUSTODIAN_CODE}")
	private String URL_CHECK_CUSTODIAN_CODE;

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loadproductlist", method = RequestMethod.GET)
	public ModelAndView loadproductlist(HttpServletRequest request,
			HttpServletResponse response) {

		
		int assetClassId = 0;
		int productTypeId = 0;
		int prodCatId = 0;

		if (request.getParameterMap().containsKey("assetClassId")) {
			assetClassId = Integer.parseInt(request
					.getParameter("assetClassId"));
		} else {
			assetClassId = 46001;
		}

		if (request.getParameterMap().containsKey("searchtext")
				&& request.getParameter("searchtext") != null
				&& request.getParameter("searchtext") != "") {
			assetClassId = 0;
		}

		if (request.getParameterMap().containsKey("productTypeId")
				&& (request.getParameter("searchtext") == null || request
						.getParameter("searchtext") == "")) {
			productTypeId = Integer.parseInt(request
					.getParameter("productTypeId"));
		} /*
		 * else { productTypeId = 47001; }
		 */

		if (request.getParameterMap().containsKey("prodCategoryId")
				&& (request.getParameter("searchtext") == null || request
						.getParameter("searchtext") == "")) {
			prodCatId = Integer
					.parseInt(request.getParameter("prodCategoryId"));
		} /*
		 * else { prodCatId = 0; }
		 */

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		ModelAndView mav = new ModelAndView("product/productList");

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}

		if (request.getParameterMap().containsKey("searchtext")
				&& request.getParameter("searchtext") != null
				&& request.getParameter("searchtext") != "") {
			searchTextVal = request.getParameter("searchtext").trim();
		}

		try {

			// get asset list
			url = URL_GET_ASSET_LIST + userToken + "/1234";

			BaseResponse<Product> br = new BaseResponse<Product>();
			br = restTemplate.postForObject(url, searchTextVal,
					BaseResponse.class);
			List<Product> assetList = new ArrayList<Product>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				assetList = br.getResponseListObject();
			mav.addObject("assetList", assetList);
			mav.addObject("size", pagesize);

			// get product type list

			url = URL_GET_ASSET_PRODUCT_TYPE + userSession.getUserName()
					+ "/1234";
			br = restTemplate.postForObject(url, assetClassId,
					BaseResponse.class);
			List<Product> productTypeList = new ArrayList<Product>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				productTypeList = br.getResponseListObject();
			mav.addObject("productTypeList", productTypeList);

			// get product category list
			// int productTypeId = 47001;
			url = URL_GET_PRODUCT_CATEGORY + userSession.getUserName()
					+ "/1234";
			br = restTemplate.postForObject(url, productTypeId,
					BaseResponse.class);
			List<Product> productCatList = new ArrayList<Product>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				productCatList = br.getResponseListObject();
			mav.addObject("productCatList", productCatList);

			// get product master list
			Product product = new Product();

			product.setAssetClassId(assetClassId);
			product.setProdTypeId(productTypeId);
			product.setProdCatId(prodCatId);
			product.setSearchText(searchTextVal); 

			url = URL_GET_PRODUCT_MASTER_LIST + userToken + "/1234";
			br = restTemplate.postForObject(url, product, BaseResponse.class);
			List<Product> productMasterList = new ArrayList<Product>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				productMasterList = br.getResponseListObject();
			
			mav.addObject("productMasterList", objectMapper.writeValueAsString(productMasterList)); 
			
			mav.addObject("assetClassId", objectMapper.writeValueAsString(assetClassId)); 
			mav.addObject("productTypeId", objectMapper.writeValueAsString(productTypeId));
			mav.addObject("prodCatId", objectMapper.writeValueAsString(prodCatId)); 
			/*
			 mav.addObject("productMasterList", productMasterList);   
			 mav.addObject("assetClassId", assetClassId);  
			 mav.addObject("productTypeId", productTypeId);
			 mav.addObject("prodCatId", prodCatId);*/ 
			 mav.addObject("searchTextVal", searchTextVal);  

			PrintWriter out = null;
			try { 
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}
		return mav;

	}

	// get product type from asset id
	@SuppressWarnings("unchecked")
	public void getProductType(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int assetId = Integer.parseInt(request.getParameter("assetId"));

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		url = URL_GET_ASSET_PRODUCT_TYPE + userSession.getUserName() + "/1234";

		BaseResponse<Product> br = new BaseResponse<Product>();
		br = restTemplate.postForObject(url, assetId, BaseResponse.class);
		List<Product> productTypeList = new ArrayList<Product>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			productTypeList = br.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, productTypeList);
	}

	@SuppressWarnings("unchecked")
	public void getProductCategory(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int productTypeId = Integer
				.parseInt(request.getParameter("prodTypeId"));

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		url = URL_GET_PRODUCT_CATEGORY + userSession.getUserName() + "/1234";

		BaseResponse<Product> br = new BaseResponse<Product>();
		br = restTemplate.postForObject(url, productTypeId, BaseResponse.class);
		List<Product> productCatList = new ArrayList<Product>();
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			productCatList = br.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, productCatList);
	}

	// update product
	@SuppressWarnings("unchecked")
	public void updateProduct(HttpServletRequest request,
			HttpServletResponse response, Product productData)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int createdby = userSession.getUserId();
		int lastmodifiedby = userSession.getUserId();

		productData.setCreatedBy(createdby);
		productData.setLastModifiedBy(lastmodifiedby);

		url = URL_UPDATE_PRODUCT_MASTER_LIST + userSession.getUserName()
				+ "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, productData, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), 97177,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_PRODUCT,
									FiinfraConstants.SRP_EDIT_PRODUCT);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void productExport(HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("In export in Teammember excel");
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		try {

			if (userSession == null) {
				response.sendRedirect("/login");
				return;
			}
			// Product teamMember = new Product();

			// TODO change hard coding
			Integer advisorPartyId = userSession.getPartyId(); // 6326
			Integer buId = userSession.getBuId();
			String token = "153443";

			int assetClassId = 0;
			int productTypeId = 0;
			int prodCatId = 0;

			if (request.getParameterMap().containsKey("assetClassId")) {
				assetClassId = Integer.parseInt(request
						.getParameter("assetClassId"));
			} else {
				assetClassId = 46001;
			}

			if (request.getParameterMap().containsKey("searchtext")
					&& request.getParameter("searchtext") != null
					&& request.getParameter("searchtext") != "") {
				assetClassId = 0;
			}

			if (request.getParameterMap().containsKey("productTypeId")
					&& (request.getParameter("searchtext") == null || request
							.getParameter("searchtext") == "")) {
				productTypeId = Integer.parseInt(request
						.getParameter("productTypeId"));
			} /*
			 * else { productTypeId = 47001; }
			 */
			String searchTextVal = null;
			if (request.getParameterMap().containsKey("prodCategoryId")
					&& (request.getParameter("searchtext") == null || request
							.getParameter("searchtext") == "")) {
				prodCatId = Integer.parseInt(request
						.getParameter("prodCategoryId"));
			}
			if (request.getParameterMap().containsKey("searchtext")
					&& request.getParameter("searchtext") != null
					&& request.getParameter("searchtext") != "") {
				searchTextVal = request.getParameter("searchtext").trim();
			}
			url = URL_GET_PRODUCT_MASTER_LIST + "ramu" + "/1234";
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			BaseResponse<Product> baseResponse = new BaseResponse<Product>();

			
			Product product = new Product();

			product.setAssetClassId(assetClassId);
			product.setProdTypeId(productTypeId);
			product.setProdCatId(prodCatId);
			product.setSearchText(searchTextVal);

			baseResponse = restTemplate.postForObject(
					FiinfraUtility.getURLWithParams(uriCB), product,
					BaseResponse.class);
			

			List<Product> teamMemberAsJson = new ArrayList<Product>();
			List<Product> teamMemberList = new ArrayList<Product>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					teamMemberAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < teamMemberAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						Product teamMemberList2;
						teamMemberList2 = objectMapper.readValue(objectMapper
								.writeValueAsString(teamMemberAsJson.get(i)),
								Product.class);

						teamMemberList.add(teamMemberList2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=ProductList.csv");

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Manufacturer"));
				writer.print(",");
				writer.print(CommonUtils.escape("Product Name"));
				writer.print(",");
				writer.print(CommonUtils.escape("Description"));
				writer.print(",");
				writer.print(CommonUtils.escape("Asset Class"));
				writer.print(",");
				writer.print(CommonUtils.escape("Product Type"));
				writer.print(",");
				writer.print(CommonUtils.escape("Product Category"));
				writer.print(",");
				writer.print(CommonUtils.escape("Custodian Code"));
				writer.print(",");
				writer.print(CommonUtils.escape("Custodian Code Alias"));
				writer.print(",");
				writer.print(CommonUtils.escape("Industry Code"));
				writer.print(",");
				writer.print(CommonUtils.escape("ISIN Code"));

				/*
				 * writer.print(",");
				 * writer.print(CommonUtils.escape("STATUS"));
				 */

				writer.println();
				for (Product list : teamMemberList) {

					writer.print(CommonUtils.escape(list.getManufacturer()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getProductName()));
					writer.print(",");
					writer.print(CommonUtils.escape(list
							.getProductDescription()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getAssetClassName()));
					writer.print(",");
					writer.print(CommonUtils.escape(list
							.getAssetProductTypesName()));
					writer.print(",");
					writer.print(CommonUtils.escape(list
							.getProductCategoryName()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getCustodianCode()));
					writer.print(",");
					writer.print(CommonUtils.escape(list
							.getCustodianCodeAlias()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getIndustryCode()));
					writer.print(",");
					writer.print(CommonUtils.escape(list.getISINCode()));
					writer.println();
					/*
					 * writer.print(CommonUtils.escape(task.getStatusName()));
					 * writer.println();
					 */
				}
			}
			type = request.getParameter("type");
			if (type.equals("excel")) {

				response.addHeader("Content-Disposition",
						"attachment;filename=ProductList.xls");

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Manufacturer"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Product Name"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Description"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Asset Class"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Product Type"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Product Category"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Custodian Code"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Custodian Code Alias"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Industry Code"));
				writer.print("\t");
				writer.print(CommonUtils.escape("ISIN Code"));

				/*
				 * writer.print(",");
				 * writer.print(CommonUtils.escape("STATUS"));
				 */

				writer.println();
				for (Product list : teamMemberList) {

					writer.print(CommonUtils.escape(list.getManufacturer()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getProductName()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list
							.getProductDescription()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getAssetClassName()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list
							.getAssetProductTypesName()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list
							.getProductCategoryName()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getCustodianCode()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list
							.getCustodianCodeAlias()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getIndustryCode()));
					writer.print("\t");
					writer.print(CommonUtils.escape(list.getISINCode()));
					writer.println();
					/*
					 * writer.print(CommonUtils.escape(task.getStatusName()));
					 * writer.println();
					 */
				}

			}

		} catch (IOException e) {
			logger.error(""+e);
		}
	}

	// premium master methods
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/premium_master", method = RequestMethod.GET)
	public ModelAndView premium_master(HttpServletRequest request,
			HttpServletResponse response) {

		// get product id
		int productId = Integer.parseInt(request.getParameter("id"));
		String prodName = request.getParameter("productName");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		ModelAndView mav = new ModelAndView("product/premium_master");
		try {

			PremiumMaster premiumMaster = new PremiumMaster();
			premiumMaster.setMasterProductId(productId);
			premiumMaster.setSearchText(searchTextVal);

			BaseResponse<PremiumMaster> br1 = new BaseResponse<PremiumMaster>();
			url = URL_GET_PREMIUM_MASTER_LIST + userToken + "/1234";
			br1 = restTemplate.postForObject(url, premiumMaster,
					BaseResponse.class);
			List<PremiumMaster> premiumMasterList = new ArrayList<PremiumMaster>();
			if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				premiumMasterList = br1.getResponseListObject();  
			
			mav.addObject("premiumMasterList",objectMapper.writeValueAsString(premiumMasterList) );
			mav.addObject("productId", objectMapper.writeValueAsString(productId));
			mav.addObject("prodName", objectMapper.writeValueAsString(prodName));
			  
			mav.addObject("size", pagesize);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}

	// add premium product
	@SuppressWarnings("unchecked")
	public void addOrUpdatePremiumMaster(HttpServletRequest request,
			HttpServletResponse response, PremiumMaster premiumMaster)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		if (premiumMaster.getisDefault() == null) {
			premiumMaster.setisDefault(false);
		}
		
		

		int createdby = userSession.getUserId();
		premiumMaster.setCreateOrModifiedBy(createdby);
		
		// for audit functionality
		String screen = FiinfraConstants.SRP_ADD_PRODUCT_PREMIUM_MASTER;
		int eventId = 97182; 
		if (premiumMaster.getProductPremiumId() != 0) {
			screen = FiinfraConstants.SRP_EDIT_PRODUCT_PREMIUM_MASTER;
			eventId = 97183;
		} 
		 
	 	url = URL_ADD_UPDATE_PREMIUM_MASTER + userSession.getUserName()
				+ "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, premiumMaster, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), eventId,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_PRODUCT,
									screen);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	// export premium master list
	public void getPremiumExport(HttpServletRequest request,
			HttpServletResponse response) {

		// get product id
		int productId = Integer.parseInt(request.getParameter("id"));

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		try {

			PremiumMaster premiumMaster = new PremiumMaster();
			premiumMaster.setMasterProductId(productId);

			BaseResponse<PremiumMaster> baseResponse = new BaseResponse<PremiumMaster>();
			url = URL_GET_PREMIUM_MASTER_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, premiumMaster,BaseResponse.class);

			List<PremiumMaster> premAsJson = new ArrayList<PremiumMaster>();
			List<PremiumMaster> premumList = new ArrayList<PremiumMaster>();

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						PremiumMaster list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								PremiumMaster.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=Premium_MasterList.csv");

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Start Age"));
				writer.print(",");
				writer.print(CommonUtils.escape("End Age"));
				writer.print(",");
				writer.print(CommonUtils.escape("Sum Assured"));
				writer.print(",");
				writer.print(CommonUtils.escape("Policy Payment Term"));
				writer.print(",");
				writer.print(CommonUtils.escape("Spouse"));
				writer.print(",");
				writer.print(CommonUtils.escape("Children Covered"));
				writer.print(",");
				writer.print(CommonUtils.escape("Premium Amount"));
				writer.print(",");
				writer.print(CommonUtils.escape("Default"));

				writer.println();
				for (PremiumMaster list : premumList) {

					writer.print(CommonUtils.escape(""
							+ list.getStartAgeRange()));
					writer.print(",");
					writer.print(CommonUtils.escape("" + list.getEndAgeRange()));
					writer.print(",");
					writer.print(CommonUtils.escape(""
							+ list.getSumAssuredAmount()));
					writer.print(",");
					writer.print(CommonUtils.escape(""
							+ list.getPolicyPaymentTerm()));
					writer.print(",");
					// writer.print(CommonUtils.escape("" + list.getSpouse()));
					String spouse = "No";
					if (list.getSpouse() > 0) {
						spouse = "Yes";
					}
					writer.print(CommonUtils.escape(spouse));
					writer.print(",");
					// writer.print(CommonUtils.escape("" + list.getChild()));
					String child = "No";
					if (list.getChild() > 0) {
						child = "Yes";
					}
					if (list.getChild() > 0) {
						writer.print(CommonUtils.escape(child) + "-"
								+ list.getChild());
					} else {
						writer.print(CommonUtils.escape(child));
					}

					writer.print(",");
					writer.print(CommonUtils.escape(""
							+ list.getPremiumAmount()));
					writer.print(",");
					// writer.print(CommonUtils.escape("" +
					// list.getisDefault()));
					String def = "No";
					if (list.getisDefault()) {
						def = "Yes";
					}
					writer.print(CommonUtils.escape(def));
					writer.println();
				}

			}

			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=Premium_MasterList.xls");

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Start Age"));
				writer.print("\t");
				writer.print(CommonUtils.escape("End Age"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Sum Assured"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Policy Payment Term"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Spouse"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Children Covered"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Premium Amount"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Default"));

				writer.println();
				for (PremiumMaster list : premumList) {

					writer.print(CommonUtils.escape(""
							+ list.getStartAgeRange()));
					writer.print("\t");
					writer.print(CommonUtils.escape("" + list.getEndAgeRange()));
					writer.print("\t");
					writer.print(CommonUtils.escape(""
							+ list.getSumAssuredAmount()));
					writer.print("\t");
					writer.print(CommonUtils.escape(""
							+ list.getPolicyPaymentTerm()));
					writer.print("\t");

					String spouse = "No";
					if (list.getSpouse() > 0) {
						spouse = "Yes";
					}
					writer.print(CommonUtils.escape(spouse));
					writer.print("\t");
					// writer.print(CommonUtils.escape("" + list.getChild()));

					String child = "No";
					if (list.getChild() > 0) {
						child = "Yes";
					}
					if (list.getChild() > 0) {
						writer.print(CommonUtils.escape(child) + "-"
								+ list.getChild());
					} else {
						writer.print(CommonUtils.escape(child));
					}

					writer.print("\t");
					writer.print(CommonUtils.escape(""
							+ list.getPremiumAmount()));
					writer.print("\t");
					String def = "No";
					if (list.getisDefault()) {
						def = "Yes";
					}
					writer.print(CommonUtils.escape(def));
					writer.println();
				}
			}

		} catch (Exception e) {
			logger.error(""+e);
		}

	}

	@SuppressWarnings("unchecked")
	public void checkStartAgeRange(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		int startAgeRange = Integer.parseInt(request.getParameter("startAge"));
		int productid = Integer.parseInt(request.getParameter("prodId"));

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		PremiumMaster data = new PremiumMaster();
		data.setStartAgeRange(startAgeRange);
		data.setMasterProductId(productid);

		url = URL_CHECK_PREMIUM_MASTER_AGE_RANGE + userToken + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, data, BaseResponse.class);
		Integer result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/price_history", method = RequestMethod.GET)
	public ModelAndView price_history(HttpServletRequest request,
			HttpServletResponse response) {

		// get product id
		int productId = Integer.parseInt(request.getParameter("id"));
		String prodName = request.getParameter("productName");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		ModelAndView mav = new ModelAndView("product/price_history");
		try {

			PriceHistory priceHistory = new PriceHistory();
			priceHistory.setProductId(productId);
			priceHistory.setSearchText(searchTextVal);

			BaseResponse<PriceHistory> br1 = new BaseResponse<PriceHistory>();
			url = URL_GET_PRODUCT_PRICE_HISTORY_LIST + userToken + "/1234";
			br1 = restTemplate.postForObject(url, priceHistory,
					BaseResponse.class);
			List<PriceHistory> priceHistoryList = new ArrayList<PriceHistory>();
			if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				priceHistoryList = br1.getResponseListObject();
			mav.addObject("priceHistoryList", objectMapper.writeValueAsString(priceHistoryList));
			mav.addObject("productId", objectMapper.writeValueAsString(productId));
			mav.addObject("prodName", objectMapper.writeValueAsString(prodName)); 
			/*mav.addObject("priceHistoryList", priceHistoryList);
			mav.addObject("productId", productId);
			mav.addObject("prodName", prodName);*/
			mav.addObject("size", pagesize);
			
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}

	// check price value
	@SuppressWarnings("unchecked")
	public void checkPriceValue(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int productid = Integer.parseInt(request.getParameter("prodId"));
		String date = request.getParameter("date");
		date = date + " 00:00:00";

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		PriceHistory data = new PriceHistory();
		data.setProductId(productid);
		data.setPriceDate(date);

		url = URL_CHECK_PRICE_VALUE_FOR_DATE + userToken + "/1234";
		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, data, BaseResponse.class);
		Integer result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);
	}

	// add or update price
	@SuppressWarnings("unchecked")
	public void addOrUpdatePrice(HttpServletRequest request,
			HttpServletResponse response, PriceHistory priceHistory)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		// for audit functionality
		String screen = FiinfraConstants.SRP_ADD_PRODUCT_PRICE;
		int eventId = 97178;
		if (priceHistory.getProductPriceId() != 0) {
			screen = FiinfraConstants.SRP_EDIT_PRODUCT_PRICE;
			eventId = 97179;
		}
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		url = URL_ADD_UPDATE_PRODUCT_PRICE + userSession.getUserName()
				+ "/1234";
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, priceHistory, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), eventId,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_PRODUCT,
									screen);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	// price export
	@SuppressWarnings("unchecked")
	public void getPriceExport(HttpServletRequest request,
			HttpServletResponse response) {

		// get product id
		int productId = Integer.parseInt(request.getParameter("id"));
		String prodName = request.getParameter("productName");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		try {

			PriceHistory priceHistory = new PriceHistory();
			priceHistory.setProductId(productId);
			priceHistory.setSearchText(searchTextVal);

			List<PriceHistory> premAsJson = new ArrayList<PriceHistory>();
			List<PriceHistory> premumList = new ArrayList<PriceHistory>();

			BaseResponse<PriceHistory> baseResponse = new BaseResponse<PriceHistory>();
			url = URL_GET_PRODUCT_PRICE_HISTORY_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, priceHistory,
					BaseResponse.class);

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						PriceHistory list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								PriceHistory.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=Price_HistoryList.csv");

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Price Date"));
				writer.print(",");
				writer.print(CommonUtils.escape("Price"));
				writer.print(",");
				writer.print(CommonUtils.escape("Price Source"));
				writer.println();
				for (PriceHistory list : premumList) {

					writer.print(CommonUtils.escape("" + list.getPriceDate()));
					writer.print(",");
					writer.print(CommonUtils.escape("" + list.getPriceValue()));
					writer.print(",");
					writer.print(CommonUtils.escape("" + list.getPriceSource()));
					writer.println();
				}

			}

			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=Price_HistoryList.xls");

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Price Date"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Price"));
				writer.print("\t");
				writer.print(CommonUtils.escape("Price Source"));
				writer.println();
				for (PriceHistory list : premumList) {

					writer.print(CommonUtils.escape("" + list.getPriceDate()));
					writer.print("\t");
					writer.print(CommonUtils.escape("" + list.getPriceValue()));
					writer.print("\t");
					writer.print(CommonUtils.escape("" + list.getPriceSource()));
					writer.println();
				}
			}

		} catch (Exception e) {
			logger.error(""+e);
		}

	}

	// revenue master
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/revenue_master", method = RequestMethod.GET)
	public ModelAndView revenue_master(HttpServletRequest request,
			HttpServletResponse response) {

		// get product id
		int productId = Integer.parseInt(request.getParameter("id"));
		String prodName = request.getParameter("productName");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		ModelAndView mav = new ModelAndView("product/revenue_master");
		try {

			ProductRevenueBook revBook = new ProductRevenueBook();
			revBook.setProductId(productId);
			revBook.setSearchText(searchTextVal);

			BaseResponse<ProductRevenueBook> br1 = new BaseResponse<ProductRevenueBook>();
			url = URL_GET_REVENUE_MASTER_LIST + userToken + "/1234";
			br1 = restTemplate.postForObject(url, revBook, BaseResponse.class);
			List<ProductRevenueBook> revBookList = new ArrayList<ProductRevenueBook>();
			if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				revBookList = br1.getResponseListObject();
			
			mav.addObject("size", pagesize);
			 
			mav.addObject("revBookList",objectMapper.writeValueAsString(revBookList) );
			mav.addObject("productId",objectMapper.writeValueAsString(productId) );
			mav.addObject("prodName",objectMapper.writeValueAsString(prodName) );
			PrintWriter out = null;
			try { 
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}

	// add or update product revenue
	@SuppressWarnings("unchecked")
	public void addOrUpdateProductRevenue(HttpServletRequest request,
			HttpServletResponse response, ProductRevenueBook revenueBook)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		
		// for audit functionality
		String screen = FiinfraConstants.SRP_ADD_PRODUCT_REVENUE_MASTER;
		int eventId = 97180;
		/*if (revenueBook.getProductRevBookId() != 0) {
			screen = FiinfraConstants.SRP_EDIT_PRODUCT_REVENUE_MASTER;
			eventId = 97181;
		}*/
		if(revenueBook.getProductRevBookId() == null){ 
			screen = FiinfraConstants.SRP_ADD_PRODUCT_REVENUE_MASTER;
			eventId = 97180;
		} 
		else
		{
			screen = FiinfraConstants.SRP_EDIT_PRODUCT_REVENUE_MASTER;
			eventId = 97181;
		}
				
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int createdby = userSession.getUserId();
		revenueBook.setCreateOrModifiedBy(createdby);

		url = URL_ADD_UPDATE_PRODUCT_REVENUE + userSession.getUserName()
				+ "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, revenueBook, BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), eventId,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_PRODUCT,
									screen);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void revenueExport(HttpServletRequest request,
			HttpServletResponse response) {

		// get product id
		int productId = Integer.parseInt(request.getParameter("id"));
		// String prodName = request.getParameter("productName");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		try {

			ProductRevenueBook revBook = new ProductRevenueBook();
			revBook.setProductId(productId);
			revBook.setSearchText(searchTextVal);

			List<ProductRevenueBook> premAsJson = new ArrayList<ProductRevenueBook>();
			List<ProductRevenueBook> premumList = new ArrayList<ProductRevenueBook>();

			BaseResponse<ProductRevenueBook> baseResponse = new BaseResponse<ProductRevenueBook>();
			url = URL_GET_REVENUE_MASTER_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, revBook,
					BaseResponse.class);

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						ProductRevenueBook list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								ProductRevenueBook.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=ProductRevenueBook.csv");

				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Revenue Level"));

				writer.print(",");
				writer.print(CommonUtils.escape("Start Date"));

				writer.print(",");
				writer.print(CommonUtils.escape("End Date"));

				writer.print(",");
				writer.print(CommonUtils.escape("Start Amount"));

				writer.print(",");
				writer.print(CommonUtils.escape("End Amount"));

				writer.print(",");
				writer.print(CommonUtils.escape("Start Year"));

				writer.print(",");
				writer.print(CommonUtils.escape("End Year"));

				writer.print(",");
				writer.print(CommonUtils.escape("One Time Revenue"));

				writer.print(",");
				writer.print(CommonUtils.escape("UpFront Revenue"));

				writer.print(",");
				writer.print(CommonUtils.escape("Trail Revenue"));

				writer.println();
				for (ProductRevenueBook list : premumList) {

					writer.print(CommonUtils.escape("" + list.getRecordType()));
					writer.print(",");

					writer.print(CommonUtils.escape("" + list.getStartDate()));
					writer.print(",");

					if (list.getEndDate() != null) {
						writer.print(CommonUtils.escape("" + list.getEndDate()));
					} else {
						writer.print("NA");
					}

					writer.print(",");

					if (list.getStartAmount() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getStartAmount()));
					} else {
						writer.print("NA");
					}

					writer.print(",");

					if (list.getEndAmount() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getEndAmount()));
					} else {
						writer.print("NA");
					}
					writer.print(",");

					if (list.getStartYear() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getStartYear()));
					} else {
						writer.print("NA");
					}
					writer.print(",");

					if (list.getEndYear() != null) {
						writer.print(CommonUtils.escape("" + list.getEndYear()));
					} else {
						writer.print("NA");
					}
					writer.print(",");

					if (list.getOneTimeRevenue() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getOneTimeRevenue()));
					} else {
						writer.print("NA");
					}
					writer.print(",");

					if (list.getUpFrontRevenue() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getUpFrontRevenue()));
					} else {
						writer.print("NA");
					}

					writer.print(",");

					if (list.getTrialRevenue() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getTrialRevenue()));
					} else {
						writer.print("NA");
					}
					writer.println();
				}

			}

			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=ProductRevenueBook.xls");

				PrintWriter writer = response.getWriter();

				writer.print(CommonUtils.escape("Revenue Level"));

				writer.print(",");
				writer.print(CommonUtils.escape("Start Date"));

				writer.print(",");
				writer.print(CommonUtils.escape("End Date"));

				writer.print(",");
				writer.print(CommonUtils.escape("Start Amount"));

				writer.print(",");
				writer.print(CommonUtils.escape("End Amount"));

				writer.print(",");
				writer.print(CommonUtils.escape("Start Year"));

				writer.print(",");
				writer.print(CommonUtils.escape("End Year"));

				writer.print(",");
				writer.print(CommonUtils.escape("One Time Revenue"));

				writer.print(",");
				writer.print(CommonUtils.escape("UpFront Revenue"));

				writer.print(",");
				writer.print(CommonUtils.escape("Trail Revenue"));

				writer.println();
				for (ProductRevenueBook list : premumList) {

					writer.print(CommonUtils.escape("" + list.getRecordType()));
					writer.print("\t");

					writer.print(CommonUtils.escape("" + list.getStartDate()));
					writer.print("\t");

					if (list.getEndDate() != null) {
						writer.print(CommonUtils.escape("" + list.getEndDate()));
					} else {
						writer.print("NA");
					}
					writer.print("\t");

					if (list.getStartAmount() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getStartAmount()));
					} else {
						writer.print("NA");
					}
					writer.print("\t");

					if (list.getEndAmount() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getEndAmount()));
					} else {
						writer.print("NA");
					}
					writer.print("\t");

					if (list.getStartYear() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getStartYear()));
					} else {
						writer.print("NA");
					}
					writer.print("\t");

					if (list.getEndYear() != null) {
						writer.print(CommonUtils.escape("" + list.getEndYear()));
					} else {
						writer.print("NA");
					}
					writer.print("\t");

					if (list.getOneTimeRevenue() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getOneTimeRevenue()));
					} else {
						writer.print("NA");
					}
					writer.print("\t");

					if (list.getUpFrontRevenue() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getUpFrontRevenue()));
					} else {
						writer.print("NA");
					}
					writer.print("\t");

					if (list.getTrialRevenue() != null) {
						writer.print(CommonUtils.escape(""
								+ list.getTrialRevenue()));
					} else {
						writer.print("NA");
					}
					writer.println();
				}
			}

		} catch (Exception e) {
			logger.error(""+e);
		}

	}

	@SuppressWarnings("unchecked")
	public void getRecordType(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// int recordTypeId = Integer.parseInt(request.getParameter("id"));
		// String searchText = request.getParameter("addquickSearch");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		ProductRevenueBook data = new ProductRevenueBook();
		// data.setRecordTypeId(recordTypeId);
		// data.setSearchText(searchText);

		BaseResponse<ProductRevenueBook> br1 = new BaseResponse<ProductRevenueBook>();
		url = URL_GET_RECORD_TYPE + userToken + "/1234";
		br1 = restTemplate.postForObject(url, data, BaseResponse.class);
		List<ProductRevenueBook> recList = new ArrayList<ProductRevenueBook>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recList = br1.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recList);
	}

	@SuppressWarnings("unchecked")
	public void getRecordTypeById(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int recordTypeId = Integer.parseInt(request.getParameter("id"));
		String searchText = request.getParameter("addquickSearch");

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int buPartyId = userSession.getBuId();
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		ProductRevenueBook data = new ProductRevenueBook();
		data.setRecordTypeId(recordTypeId);
		data.setSearchText(searchText);
		if (recordTypeId != 14002) {
			data.setBuPartyId(buPartyId);
		}

		BaseResponse<ProductRevenueBook> br1 = new BaseResponse<ProductRevenueBook>();
		url = URL_GET_RECORD_TYPE_BY_ID + userToken + "/1234";
		br1 = restTemplate.postForObject(url, data, BaseResponse.class);
		List<ProductRevenueBook> recList = new ArrayList<ProductRevenueBook>();
		if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			recList = br1.getResponseListObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, recList);
	}

	@SuppressWarnings("unchecked")
	public void checkProductRevenueRange(HttpServletRequest request,
			HttpServletResponse response, ProductRevenueBook revenueBook)
			throws IOException {

		// int productid = Integer.parseInt(request.getParameter("productId"));
		// BigDecimal StartAmount = request.getParameter("StartAmount")

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		// PremiumMaster data = new PremiumMaster();
		// data.setStartAgeRange(startAgeRange);
		// data.setMasterProductId(productid);

		url = URL_CHECK_PRODUCT_REVENUE_RANGE + userToken + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, revenueBook, BaseResponse.class);
		Integer result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);

	}

	@SuppressWarnings("unchecked")
	public void checkProductRevenueYearRange(HttpServletRequest request,
			HttpServletResponse response, ProductRevenueBook revenueBook)
			throws IOException {

		// int productid = Integer.parseInt(request.getParameter("productId"));
		// BigDecimal StartAmount = request.getParameter("StartAmount")

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		// PremiumMaster data = new PremiumMaster();
		// data.setStartAgeRange(startAgeRange);
		// data.setMasterProductId(productid);

		url = URL_CHECK_PRODUCT_REVENUE_YEAR_RANGE + userToken + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, revenueBook, BaseResponse.class);
		Integer result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);

	}

	// PRODUCT CATEGORY REVENUE LIST
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/category_revenue", method = RequestMethod.GET)
	public ModelAndView category_revenue(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		ModelAndView mav = new ModelAndView("product/category_revenue");
		try {
			
			ProductCategoryRevenue catRev = new ProductCategoryRevenue();
			catRev.setSearchText(searchTextVal);

			BaseResponse<ProductCategoryRevenue> br1 = new BaseResponse<ProductCategoryRevenue>();
			url = URL_GET_PRODUCT_CATEGORY_REVENUE_LIST + userToken + "/1234";
			br1 = restTemplate.postForObject(url, catRev, BaseResponse.class);
			List<ProductCategoryRevenue> catRevList = new ArrayList<ProductCategoryRevenue>();
			if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				catRevList = br1.getResponseListObject();
			mav.addObject("catRevList", objectMapper.writeValueAsString(catRevList) ); 
			mav.addObject("size", pagesize);
 
			url = URL_GET_ASSET_LIST + userToken + "/1234";

			BaseResponse<ProductCategoryRevenue> br = new BaseResponse<ProductCategoryRevenue>();
			br = restTemplate.postForObject(url, searchTextVal,
					BaseResponse.class);
			List<ProductCategoryRevenue> assetList = new ArrayList<ProductCategoryRevenue>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				assetList = br.getResponseListObject();
			/*mav.addObject("assetList", assetList);*/
			mav.addObject("assetList", objectMapper.writeValueAsString(assetList));   
			PrintWriter out = null; 
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}

	@SuppressWarnings("unchecked")
	public void checkProdCategoryRevenue(HttpServletRequest request,
			HttpServletResponse response,
			ProductCategoryRevenue productCategoryRevenue) throws IOException {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		url = URL_CHECK_PRODUCT_CATEGORY_REVENUE + userToken + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, productCategoryRevenue,
				BaseResponse.class);
		Integer result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			result = br.getResponseObject();

		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, result);

	}

	// add or update product category revenue
	@SuppressWarnings("unchecked")
	public void addOrUpdateProductCategoryRevenue(HttpServletRequest request,
			HttpServletResponse response,
			ProductCategoryRevenue productCategoryRevenue)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int createdby = userSession.getUserId();
		productCategoryRevenue.setCreateOrModifiedBy(createdby);
		
		// for audit functionality
		String screen = FiinfraConstants.SRP_ADD_PRODUCT_CATEGORY;
		int eventId = 97184;
		/*if (productCategoryRevenue.getProductTypeShapeID() != 0) {
			screen = FiinfraConstants.SRP_EDIT_PRODUCT_CATEGORY;
			eventId = 97185;
		}*/

		url = URL_ADD_UPDATE_PRODUCT_CATEGORY_REVENUE
				+ userSession.getUserName() + "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, productCategoryRevenue,
				BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), eventId,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_PRODUCT_CATEGORY,
									screen);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}

	@SuppressWarnings("unchecked")
	public void productCatRevenueExport(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		try {

			ProductCategoryRevenue revBook = new ProductCategoryRevenue();
			revBook.setSearchText(searchTextVal);
			List<ProductCategoryRevenue> premAsJson = new ArrayList<ProductCategoryRevenue>();
			List<ProductCategoryRevenue> premumList = new ArrayList<ProductCategoryRevenue>();

			BaseResponse<ProductCategoryRevenue> baseResponse = new BaseResponse<ProductCategoryRevenue>();
			url = URL_GET_PRODUCT_CATEGORY_REVENUE_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, revBook,
					BaseResponse.class);

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						ProductCategoryRevenue list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								ProductCategoryRevenue.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			String seperator = ",";
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=ProductCategoryRevenue.csv");
				seperator = ",";
			}
			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=ProductCategoryRevenue.xls");
				seperator = "\t";
			}

			/*
			 * if (type.equals("CSV")) {
			 * response.addHeader("Content-Disposition",
			 * "attachment;filename=ProductCategoryRevenue.csv");
			 */

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Asset Class"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Product Type"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Category"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Revenue Type"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("OneTime Revenue"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Upfront Revenue"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Trail Revenue"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("OneTime Revenue %"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Upfront Revenue %"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Trail Revenue %"));

			writer.println();
			for (ProductCategoryRevenue list : premumList) {

				writer.print(CommonUtils.escape("" + list.getAssetClass()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getProductType()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getCategory()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getRevenueType()));
				writer.print(seperator);

				if (list.getIsOneTimeRevenue() == 1) {
					writer.print(CommonUtils.escape("Yes"));
				} else {
					writer.print(CommonUtils.escape("No"));
				}
				writer.print(seperator);

				if (list.getIsUpfrontRevenue() == 1) {
					writer.print(CommonUtils.escape("Yes"));
				} else {
					writer.print(CommonUtils.escape("No"));
				}
				writer.print(seperator);

				if (list.getIsTrailRevenue() == 1) {
					writer.print(CommonUtils.escape("Yes"));
				} else {
					writer.print(CommonUtils.escape("No"));
				}
				writer.print(seperator);

				if (list.getOnetimeRevenue() != null) {
					writer.print(CommonUtils.escape(""
							+ list.getOnetimeRevenue()));
				} else {
					writer.print("NA");
				}
				writer.print(seperator);
				if (list.getUpfrontRevenue() != null) {
					writer.print(CommonUtils.escape(""
							+ list.getUpfrontRevenue()));
				} else {
					writer.print("NA");
				}
				writer.print(seperator);
				if (list.getTrailRevenue() != null) {
					writer.print(CommonUtils.escape("" + list.getTrailRevenue()));
				} else {
					writer.print("NA");
				}

				writer.println();
			}

			// }

		} catch (Exception e) {
			logger.error(""+e);
		}

	}

	// product_manufacturer LIST
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/product_manufacturer", method = RequestMethod.GET)
	public ModelAndView product_manufacturer(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		int typeid = 0;

		if (request.getParameterMap().containsKey("type")) {
			typeid = Integer.parseInt(request.getParameter("type"));
		}

		ModelAndView mav = new ModelAndView("product/product_manufacturer");
		try {

			ProductMfg mfg = new ProductMfg();
			
			// get asset list
			url = URL_GET_PRODUCT_MFG_TYPE + userToken + "/1234";

			BaseResponse<ProductMfg> br = new BaseResponse<ProductMfg>();
			br = restTemplate.postForObject(url, mfg,
					BaseResponse.class);
			List<ProductMfg> mfgTypeList = new ArrayList<ProductMfg>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				mfgTypeList = br.getResponseListObject();
			mav.addObject("mfgTypeList", mfgTypeList);
			
			
			mfg.setSearchText(searchTextVal);
			mfg.setMfgTypeId(typeid);
			BaseResponse<ProductMfg> br1 = new BaseResponse<ProductMfg>();
			url = URL_GET_PRODUCT_MFG_LIST + userToken + "/1234";
			br1 = restTemplate.postForObject(url, mfg, BaseResponse.class);
			List<ProductMfg> mfgList = new ArrayList<ProductMfg>();
			if (br1.getStatus().equalsIgnoreCase(FiinfraConstants.success)) 
				mfgList = br1.getResponseListObject();
			/*mav.addObject("mfgList", mfgList);*/
			mav.addObject("mfgList", objectMapper.writeValueAsString(mfgList));  
			mav.addObject("size", pagesize);
			mav.addObject("searchTextVal", searchTextVal);
			mav.addObject("typeid", typeid);
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception e) {
				logger.error(""+e);
			}
		} catch (Exception e) {
			logger.error(""+e);
		}

		return mav;
	}

	@SuppressWarnings("unchecked")
	public void productMfgExport(HttpServletRequest request,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		String userToken = null;
		if (userSession.getUserName() != null) {
			userToken = userSession.getUserName();
		} else {
			userToken = "abc";
		}

		String searchTextVal = null;
		String pagesize = request.getParameter("pageSize");
		if (pagesize == null) {
			pagesize = "10";
		}
		if (request.getParameterMap().containsKey("searchtext")) {
			searchTextVal = request.getParameter("searchtext").trim();
		} else {
			searchTextVal = "";
		}

		int typeid = 0;

		if (request.getParameterMap().containsKey("id")) {
			typeid = Integer.parseInt(request.getParameter("id"));
		}
		try {

			List<ProductMfg> premAsJson = new ArrayList<ProductMfg>();
			List<ProductMfg> premumList = new ArrayList<ProductMfg>();

			ProductMfg mfg = new ProductMfg();
			mfg.setSearchText(searchTextVal);
			mfg.setMfgTypeId(typeid);
			BaseResponse<ProductMfg> baseResponse = new BaseResponse<ProductMfg>();
			url = URL_GET_PRODUCT_MFG_LIST + userToken + "/1234";
			baseResponse = restTemplate.postForObject(url, mfg,
					BaseResponse.class);

			if (baseResponse.getStatus().equalsIgnoreCase(
					FiinfraConstants.success)) {
				try {
					premAsJson = objectMapper.readValue(objectMapper
							.writeValueAsString(baseResponse
									.getResponseListObject()), ArrayList.class);

					for (int i = 0; i < premAsJson.size(); i++) {
						// get the actual party object from its LinkedHashMap
						// representation
						ProductMfg list2;
						list2 = objectMapper.readValue(objectMapper
								.writeValueAsString(premAsJson.get(i)),
								ProductMfg.class);

						premumList.add(list2);
					}

				} catch (JsonParseException e) {
					logger.error(""+e);
				} catch (JsonMappingException e) {
					logger.error(""+e);
				} catch (JsonGenerationException e) {
					logger.error(""+e);
				} catch (IOException e) {
					logger.error(""+e);
				}
			}

			String type = request.getParameter("type");
			String seperator = ",";
			if (type.equals("CSV")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=ProductManufacturer.csv");
				seperator = ",";
			}
			if (type.equals("excel")) {
				response.addHeader("Content-Disposition",
						"attachment;filename=ProductManufacturer.xls");
				seperator = "\t";
			}

			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("Manufacturer Name"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Type"));

			writer.print(seperator);
			writer.print(CommonUtils.escape("Short Name"));

			writer.println();
			for (ProductMfg list : premumList) {

				writer.print(CommonUtils.escape("" + list.getManufacturerName()));
				writer.print(seperator);

				writer.print(CommonUtils.escape("" + list.getMfgType()));
				writer.print(seperator);

				if (list.getShortName() != null && list.getShortName() != "") {
					writer.print(CommonUtils.escape("" + list.getShortName()));
				} else {
					writer.print("NA");
				}
				writer.println();
			}

		} catch (Exception e) {
			logger.error(""+e);
		}

	}
	
	@SuppressWarnings("unchecked")
	public void addOrUpdateProductManufacturer(HttpServletRequest request,
			HttpServletResponse response,
			ProductMfg productMfg)
			throws JsonGenerationException, JsonMappingException, IOException,
			ParseException {

		String result = FiinfraConstants.FAIL;
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		int createdby = userSession.getUserId();
		productMfg.setCreateOrModifiedBy(createdby);
		
		// for audit functionality
		String screen = FiinfraConstants.SRP_ADD_PRODUCT_MFG;
		int eventId = 97186;
		if (productMfg.getPartyId() != 0) {
			screen = FiinfraConstants.SRP_EDIT_PRODUCT_MFG;
			eventId = 97187;
		}

		url = URL_ADD_UPDATE_PRODUCT_MFG
				+ userSession.getUserName() + "/1234";

		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.postForObject(url, productMfg,
				BaseResponse.class);
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			result = FiinfraConstants.SUCCESS;
			//insert code for audit functionality
			FiinfraUtility.doAudit(userSession.getPartyId(),
									userSession.getUserId(), eventId,
									FiinfraConstants.SERVICE_PORTAL,
									FiinfraConstants.SRP_SOURCE_MODULE_PRODUCT_MFG,
									screen);
		}

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			logger.error(""+e);
		}
		objectMapper.writeValue(out, result);
	}
	
	@SuppressWarnings("unchecked")
	public void checkCustodianCode(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		int productId = 0;
		String custodianCode = null;
		if (request.getParameterMap().containsKey("productId")) {
			productId = Integer.parseInt(request.getParameter("productId"));
			custodianCode = request.getParameter("custodianCode");
		}
		
		
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");

		Product prod = new Product();
		prod.setMasterProductId(productId);
		prod.setCustodianCode(custodianCode);
		
		url = URL_CHECK_CUSTODIAN_CODE + userSession.getUserName() + "/1234";

		BaseResponse<Integer> br = new BaseResponse<Integer>();
		br = restTemplate.postForObject(url, prod, BaseResponse.class);
		Integer status = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			status = br.getResponseObject();
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		objectMapper.writeValue(out, status);
	}
}
