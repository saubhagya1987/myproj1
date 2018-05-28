package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.PremiumMaster;
import in.fiinfra.common.service.vo.PriceHistory;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.service.vo.ProductCategoryRevenue;
import in.fiinfra.common.service.vo.ProductMfg;
import in.fiinfra.common.service.vo.ProductRevenueBook;

import javax.ws.rs.core.Response;

public interface ProductService {

	public Response getAssetClassList();

	public Response getAssetProductTypeList(int assetId);

	public Response getProductCategoryList(int productTypeId);

	public Response getProductMasterList(Product product);

	public Response insertOrUpdateProduct(Product product);

	// master premium
	public Response getPremiumMasterList(PremiumMaster premiumMaster);

	public Response insertOrUpdatePremiumMaster(PremiumMaster premiumMaster);

	public Response checkPremiumMasterAgeRange(PremiumMaster premiumMaster);

	// price history
	public Response getProductPriceHistory(PriceHistory priceHistory);

	public Response insertOrUpdatePrice(PriceHistory priceHistory);

	public Response checkPriceValueIsPresent(PriceHistory priceHistory);

	// revenue
	public Response getProductRevenueMasterList(
			ProductRevenueBook productRevenueBook);

	public Response insertOrUpdateProductRevenue(
			ProductRevenueBook productRevenueBook);

	public Response getRecordTypeList(ProductRevenueBook productRevenueBook);

	public Response getRecordType(ProductRevenueBook productRevenueBook);

	public Response checkProductRevenueRange(
			ProductRevenueBook productRevenueBook);

	public Response checkProductRevenueYearRange(
			ProductRevenueBook productRevenueBook);

	// product category revenue
	public Response getProductCategoryRevenueList(
			ProductCategoryRevenue productCategoryRevenue);

	public Response checkProductCategoryRevenue(
			ProductCategoryRevenue productCategoryRevenue);

	public Response insertOrUpdateProductCategoryRevenue(
			ProductCategoryRevenue productCategoryRevenue);

	// product manufacturer
	public Response getProductManufacturerList(ProductMfg productMfg);
	
	public Response insertOrUpdateProductManufacturer(ProductMfg productMfg);
	
	public Response getProductMfgTypeList(ProductMfg productMfg);
	
	public Response checkCustodianCode(Product product);
}
