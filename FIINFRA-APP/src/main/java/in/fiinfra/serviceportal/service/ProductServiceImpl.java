package in.fiinfra.serviceportal.service;

import javax.ws.rs.core.Response;

import in.fiinfra.common.service.vo.PremiumMaster;
import in.fiinfra.common.service.vo.PriceHistory;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.service.vo.ProductCategoryRevenue;
import in.fiinfra.common.service.vo.ProductMfg;
import in.fiinfra.common.service.vo.ProductRevenueBook;
import in.fiinfra.serviceportal.dao.ProductDao;

import org.springframework.beans.factory.annotation.Autowired;

public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public Response getAssetClassList() {
		Response result = productDao.getAssetClassList();
		return result;
	}

	@Override
	public Response getAssetProductTypeList(int assetId) {
		Response result = productDao.getAssetProductTypeList(assetId);
		return result;
	}

	@Override
	public Response getProductCategoryList(int productTypeId) {
		Response result = productDao.getProductCategoryList(productTypeId);
		return result;
	}

	@Override
	public Response getProductMasterList(Product product) {
		Response result = productDao.getProductMasterList(product);
		return result;
	}

	@Override
	public Response insertOrUpdateProduct(Product product) {
		Response result = productDao.insertOrUpdateProduct(product);
		return result;
	}

	// master premium
	@Override
	public Response getPremiumMasterList(PremiumMaster premiumMaster) {
		Response result = productDao.getPremiumMasterList(premiumMaster);
		return result;
	}

	@Override
	public Response insertOrUpdatePremiumMaster(PremiumMaster premiumMaster) {
		Response result = productDao.insertOrUpdatePremiumMaster(premiumMaster);
		return result;
	}

	@Override
	public Response checkPremiumMasterAgeRange(PremiumMaster premiumMaster) {
		Response result = productDao.checkPremiumMasterAgeRange(premiumMaster);
		return result;
	}

	@Override
	public Response getProductPriceHistory(PriceHistory priceHistory) {
		Response result = productDao.getProductPriceHistory(priceHistory);
		return result;
	}

	@Override
	public Response insertOrUpdatePrice(PriceHistory priceHistory) {
		Response result = productDao.insertOrUpdatePrice(priceHistory);
		return result;
	}

	@Override
	public Response checkPriceValueIsPresent(PriceHistory priceHistory) {
		Response result = productDao.checkPriceValueIsPresent(priceHistory);
		return result;
	}

	@Override
	public Response getProductRevenueMasterList(
			ProductRevenueBook productRevenueBook) {
		Response result = productDao
				.getProductRevenueMasterList(productRevenueBook);
		return result;
	}

	@Override
	public Response insertOrUpdateProductRevenue(
			ProductRevenueBook productRevenueBook) {
		Response result = productDao
				.insertOrUpdateProductRevenue(productRevenueBook);
		return result;
	}

	@Override
	public Response getRecordTypeList(ProductRevenueBook productRevenueBook) {
		Response result = productDao.getRecordTypeList(productRevenueBook);
		return result;
	}

	@Override
	public Response getRecordType(ProductRevenueBook productRevenueBook) {
		Response result = productDao.getRecordType(productRevenueBook);
		return result;
	}

	@Override
	public Response checkProductRevenueRange(
			ProductRevenueBook productRevenueBook) {
		Response result = productDao
				.checkProductRevenueRange(productRevenueBook);
		return result;
	}

	@Override
	public Response checkProductRevenueYearRange(
			ProductRevenueBook productRevenueBook) {
		Response result = productDao
				.checkProductRevenueYearRange(productRevenueBook);
		return result;
	}

	@Override
	public Response getProductCategoryRevenueList(
			ProductCategoryRevenue productCategoryRevenue) {
		Response result = productDao
				.getProductCategoryRevenueList(productCategoryRevenue);
		return result;
	}

	@Override
	public Response checkProductCategoryRevenue(
			ProductCategoryRevenue productCategoryRevenue) {
		Response result = productDao
				.checkProductCategoryRevenue(productCategoryRevenue);
		return result;
	}

	@Override
	public Response insertOrUpdateProductCategoryRevenue(
			ProductCategoryRevenue productCategoryRevenue) {
		Response result = productDao
				.insertOrUpdateProductCategoryRevenue(productCategoryRevenue);
		return result;
	}

	@Override
	public Response getProductManufacturerList(ProductMfg productMfg) {
		Response result = productDao.getProductManufacturerList(productMfg);
		return result;
	}

	@Override
	public Response insertOrUpdateProductManufacturer(ProductMfg productMfg) {
		Response result = productDao.insertOrUpdateProductManufacturer(productMfg);
		return result;
	}

	@Override
	public Response getProductMfgTypeList(ProductMfg productMfg) {
		Response result = productDao.getProductMfgTypeList(productMfg);
		return result;
	}

	@Override
	public Response checkCustodianCode(Product product) {
		Response result = productDao.checkCustodianCode(product);
		return result;
	}

}
