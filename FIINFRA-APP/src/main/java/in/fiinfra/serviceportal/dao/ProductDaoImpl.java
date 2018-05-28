package in.fiinfra.serviceportal.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import in.fiinfra.common.service.vo.PremiumMaster;
import in.fiinfra.common.service.vo.PriceHistory;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.service.vo.ProductCategoryRevenue;
import in.fiinfra.common.service.vo.ProductMfg;
import in.fiinfra.common.service.vo.ProductRevenueBook;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao {

	@Autowired
	DataSourceProvider dataSourceProvider;

	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	Response response;
	
	private static final Logger logger = Logger.getLogger(ProductDaoImpl.class);

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}

	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@SuppressWarnings("finally")
	@Override
	public Response getAssetClassList() {
		try {
			List<Product> assetDatalist;
			BaseResponse<Product> br = new BaseResponse<Product>();

			assetDatalist = jdbcTemplate.query(
					FiinfraConstants.SP_GET_ASSET_CLASS_LIST, new Object[] {},
					new BeanPropertyRowMapper<Product>(Product.class));
			br.setResponseListObject(assetDatalist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getAssetProductTypeList(int assetId) {
		try {
			List<Product> assetDatalist;
			BaseResponse<Product> br = new BaseResponse<Product>();

			assetDatalist = jdbcTemplate.query(
					FiinfraConstants.SP_GET_ASSET_PRODUCT_TYPE_LIST,
					new Object[] { assetId },
					new BeanPropertyRowMapper<Product>(Product.class));
			br.setResponseListObject(assetDatalist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getProductCategoryList(int productTypeId) {
		try {
			List<Product> assetDatalist;
			BaseResponse<Product> br = new BaseResponse<Product>();

			assetDatalist = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PRODUCT_CATEGORY_LIST,
					new Object[] { productTypeId },
					new BeanPropertyRowMapper<Product>(Product.class));
			br.setResponseListObject(assetDatalist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getProductMasterList(Product product) {
		try {
			List<Product> prodMasterlist;
			BaseResponse<Product> br = new BaseResponse<Product>();

			prodMasterlist = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PRODUCT_MASTER_LIST, new Object[] {
							product.getAssetClassId(), product.getProdTypeId(),
							product.getProdCatId(), product.getSearchText() },
					new BeanPropertyRowMapper<Product>(Product.class));
			br.setResponseListObject(prodMasterlist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response insertOrUpdateProduct(Product product) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer updateProd;

			updateProd = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_INSERT_OR_UPDATE_PRODUCT,
					new Object[] { product.getMasterProductId(),
							product.getProductName(),
							product.getProductDescription(),
							product.getCustodianCode(),
							product.getIndustryCode(), product.getISINCode(),
							product.getCustodianCodeAlias(),
							product.getisActive(), product.getisClosedEnd(),
							product.getisInstitutional(),
							product.getMinSIPValue(),
							product.getMinPurchaseValue(),
							product.getMinAddnPurchaseValue(),
							product.getLastModifiedBy() },
					new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(updateProd);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	// premium master
	@SuppressWarnings("finally")
	@Override
	public Response getPremiumMasterList(PremiumMaster premiumMaster) {
		try {
			List<PremiumMaster> list;
			BaseResponse<PremiumMaster> br1 = new BaseResponse<PremiumMaster>();

			list = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PREMIUM_MASTER_LIST,
					new Object[] { premiumMaster.getMasterProductId(),
							premiumMaster.getSearchText() },
					new BeanPropertyRowMapper<PremiumMaster>(
							PremiumMaster.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response insertOrUpdatePremiumMaster(PremiumMaster premiumMaster) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;

			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_INSERT_OR_UPDATE_PREMIUM_MASTER,
					new Object[] { premiumMaster.getProductPremiumId(),
							premiumMaster.getMasterProductId(),
							premiumMaster.getStartAgeRange(),
							premiumMaster.getEndAgeRange(),
							premiumMaster.getSumAssuredAmount(),
							premiumMaster.getPolicyPaymentTerm(),
							premiumMaster.getPremiumAmount(),
							premiumMaster.getSpouse(),
							premiumMaster.getChild(),
							premiumMaster.getisDefault(),
							premiumMaster.getCreateOrModifiedBy() },
					new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response checkPremiumMasterAgeRange(PremiumMaster premiumMaster) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_CHECK_PREMIUM_MASTER_AGE_RANGE,
					new Object[] { premiumMaster.getMasterProductId(),
							premiumMaster.getStartAgeRange() }, Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getProductPriceHistory(PriceHistory priceHistory) {
		try {
			List<PriceHistory> list;
			BaseResponse<PriceHistory> br1 = new BaseResponse<PriceHistory>();

			list = jdbcTemplate
					.query(FiinfraConstants.SP_GET_PRODUCT_PRICE_HISTORY_LIST,
							new Object[] { priceHistory.getProductId(),
									priceHistory.getSearchText() },
							new BeanPropertyRowMapper<PriceHistory>(
									PriceHistory.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response insertOrUpdatePrice(PriceHistory priceHistory) {

		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date priceDate = null;

		if (priceHistory.getPriceDate() != null
				&& !priceHistory.getPriceDate().equals("")) {
			String stDate = priceHistory.getPriceDate();
			try {
				priceDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}

		}

		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;

			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_INSERT_OR_UPDATE_PRODUCT_PRICE,
					new Object[] { priceHistory.getProductPriceId(),
							priceHistory.getProductId(), priceDate,
							priceHistory.getPriceValue(),
							priceHistory.getPriceSourceId() },
					new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response checkPriceValueIsPresent(PriceHistory priceHistory) {
		// SimpleDateFormat formatter = null;
		// formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// Date priceDate = null;

		/*
		 * if (priceHistory.getPriceDate() != null &&
		 * !priceHistory.getPriceDate().equals("")) { String stDate =
		 * priceHistory.getPriceDate(); try { priceDate = (Date)
		 * formatter.parse(stDate); } catch (ParseException e) {
		 * e.printStackTrace(); }
		 * 
		 * }
		 */
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_CHECK_PRICE_VALUE_FOR_DATE,
					new Object[] { priceHistory.getProductId(),
							priceHistory.getPriceDate() }, Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getProductRevenueMasterList(
			ProductRevenueBook productRevenueBook) {
		try {
			List<ProductRevenueBook> list;
			BaseResponse<ProductRevenueBook> br1 = new BaseResponse<ProductRevenueBook>();

			list = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PRODUCT_REVENUE_LIST, new Object[] {
							productRevenueBook.getProductId(),
							productRevenueBook.getSearchText() },
					new BeanPropertyRowMapper<ProductRevenueBook>(
							ProductRevenueBook.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response insertOrUpdateProductRevenue(
			ProductRevenueBook productRevenueBook) {

		SimpleDateFormat formatter = null;
		formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date startDate = null;
		Date endDate = null;

		if (productRevenueBook.getStartDate() != null
				&& !productRevenueBook.getStartDate().equals("")) {
			String stDate = productRevenueBook.getStartDate();
			try {
				startDate = (Date) formatter.parse(stDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}

		}
		if (productRevenueBook.getEndDate() != null
				&& !productRevenueBook.getEndDate().equals("")) {
			String enDate = productRevenueBook.getEndDate();
			try {
				endDate = (Date) formatter.parse(enDate);
			} catch (ParseException e) {
				logger.debug(""+e.getStackTrace());
			}

		}

		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;

			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_INSERT_OR_UPDATE_PRODUCT_REVENUE,
					new Object[] { productRevenueBook.getProductRevBookId(),
							productRevenueBook.getRecordTypeId(),
							productRevenueBook.getPartyId(),
							productRevenueBook.getProductId(), startDate,
							endDate, productRevenueBook.getStartAmount(),
							productRevenueBook.getEndAmount(),
							productRevenueBook.getStartYear(),
							productRevenueBook.getEndYear(),
							productRevenueBook.getRevenueTypeId(),
							productRevenueBook.getOneTimeRevenue(),
							productRevenueBook.getUpFrontRevenue(),
							productRevenueBook.getTrialRevenue(),
							productRevenueBook.getCreateOrModifiedBy() },
					new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getRecordTypeList(ProductRevenueBook productRevenueBook) {
		try {
			List<ProductRevenueBook> list;
			BaseResponse<ProductRevenueBook> br1 = new BaseResponse<ProductRevenueBook>();

			list = jdbcTemplate.query(FiinfraConstants.SP_GET_RECORD_TYPE_LIST,
					new Object[] { productRevenueBook.getRecordTypeId(),
							productRevenueBook.getBuPartyId() },
					new BeanPropertyRowMapper<ProductRevenueBook>(
							ProductRevenueBook.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getRecordType(ProductRevenueBook productRevenueBook) {
		try {
			List<ProductRevenueBook> list;
			BaseResponse<ProductRevenueBook> br1 = new BaseResponse<ProductRevenueBook>();

			list = jdbcTemplate.query(FiinfraConstants.SP_GET_RECORD_LIST,
					new Object[] {},
					new BeanPropertyRowMapper<ProductRevenueBook>(
							ProductRevenueBook.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response checkProductRevenueRange(
			ProductRevenueBook productRevenueBook) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_CHECK_PRODUCT_REVENUE_AMOUNT_RANGE,
					new Object[] { productRevenueBook.getProductId(),
							productRevenueBook.getStartAmount(),
							productRevenueBook.getEndAmount() }, Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response checkProductRevenueYearRange(
			ProductRevenueBook productRevenueBook) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_CHECK_PRODUCT_REVENUE_YEAR_RANGE,
					new Object[] { productRevenueBook.getProductId(),
							productRevenueBook.getStartYear(),
							productRevenueBook.getEndYear() }, Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getProductCategoryRevenueList(
			ProductCategoryRevenue productCategoryRevenue) {

		try {
			List<ProductCategoryRevenue> list;
			BaseResponse<ProductCategoryRevenue> br1 = new BaseResponse<ProductCategoryRevenue>();

			list = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PRODUCT_CATEGORY_REVENUE_LIST,
					new Object[] { productCategoryRevenue.getSearchText() },
					new BeanPropertyRowMapper<ProductCategoryRevenue>(
							ProductCategoryRevenue.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response checkProductCategoryRevenue(
			ProductCategoryRevenue productCategoryRevenue) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_CHECK_PRODUCT_CATEGORY_REVENUE,
					new Object[] { productCategoryRevenue.getAssetClassID(),
							productCategoryRevenue.getProductTypeID(),
							productCategoryRevenue.getCategoryID() },
					Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response insertOrUpdateProductCategoryRevenue(
			ProductCategoryRevenue productCategoryRevenue) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer result;

			result = jdbcTemplate
					.queryForObject(
							FiinfraConstants.SP_INSERT_OR_UPDATE_PRODUCT_CATEGORY_REVENUE,
							new Object[] {
									productCategoryRevenue
											.getProductTypeShapeID(),
									productCategoryRevenue.getProductTypeID(),
									productCategoryRevenue.getRevenueTypeID(),
									productCategoryRevenue
											.getIsOneTimeRevenue(),
									productCategoryRevenue
											.getIsUpfrontRevenue(),
									productCategoryRevenue.getIsTrailRevenue(),
									productCategoryRevenue
											.getCreateOrModifiedBy(),
									productCategoryRevenue.getOnetimeRevenue(),
									productCategoryRevenue.getUpfrontRevenue(),
									productCategoryRevenue.getTrailRevenue(),
									productCategoryRevenue.getAssetClassID(),
									productCategoryRevenue.getCategoryID() },
							new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getProductManufacturerList(ProductMfg productMfg) {
		try {
			List<ProductMfg> list;
			BaseResponse<ProductMfg> br1 = new BaseResponse<ProductMfg>();

			list = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PRODUCT_MFG_LIST,
					new Object[] { productMfg.getMfgTypeId(), productMfg.getSearchText() },
					new BeanPropertyRowMapper<ProductMfg>(
							ProductMfg.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response insertOrUpdateProductManufacturer(ProductMfg productMfg) {
		try {
			BaseResponse<Integer> br = new BaseResponse<>();
			Integer result;

			result = jdbcTemplate
					.queryForObject(
							FiinfraConstants.SP_INSERT_OR_UPDATE_PRODUCT_MFG,
							new Object[] {productMfg.getPartyId(),productMfg.getManufacturerName(),productMfg.getCreateOrModifiedBy(),productMfg.getMfgTypeId(),productMfg.getShortName()},
							new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public Response getProductMfgTypeList(ProductMfg productMfg) {
		try {
			List<ProductMfg> mfgTypelist;
			BaseResponse<ProductMfg> br = new BaseResponse<ProductMfg>();

			mfgTypelist = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PRODUCT_MFG_TYPE_LIST, new Object[] {},
					new BeanPropertyRowMapper<ProductMfg>(ProductMfg.class));
			br.setResponseListObject(mfgTypelist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}

	@Override
	public Response checkCustodianCode(Product product) {
		try {
			Integer status;
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			status = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_GET_UNIQUE_CUSTODIAN_CODE,
					new Object[] { product.getMasterProductId(),product.getCustodianCode() }, Integer.class);
			br.setResponseObject(status);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}
}
