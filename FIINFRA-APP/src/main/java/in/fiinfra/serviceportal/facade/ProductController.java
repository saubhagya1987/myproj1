package in.fiinfra.serviceportal.facade;

import in.fiinfra.common.service.vo.PremiumMaster;
import in.fiinfra.common.service.vo.PriceHistory;
import in.fiinfra.common.service.vo.Product;
import in.fiinfra.common.service.vo.ProductCategoryRevenue;
import in.fiinfra.common.service.vo.ProductMfg;
import in.fiinfra.common.service.vo.ProductRevenueBook;
import in.fiinfra.serviceportal.service.ProductService;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/product")
public class ProductController extends MultiActionController {

	Response response;

	@Autowired
	ProductService productService;

	private ObjectMapper objectMapper;

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/assetClassList/{user}/{token}")
	public Response assetClassList(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody String searchTextVal) {

		response = productService.getAssetClassList();
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/assetProductTypeList/{user}/{token}")
	public Response assetProductTypeList(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody int assetId) {

		response = productService.getAssetProductTypeList(assetId);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/productCategoryList/{user}/{token}")
	public Response productCategoryList(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody int productTypeId) {

		response = productService.getProductCategoryList(productTypeId);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/productMasterList/{user}/{token}")
	public Response productMasterList(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody Product product) {

		response = productService.getProductMasterList(product);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateProductMasterList/{username}/{token}")
	public Response updateProductMasterList(
			@PathParam("username") String userName,
			@PathParam("token") String token, @RequestBody Product product) {
		Response response = null;

		response = productService.insertOrUpdateProduct(product);
		return response;
	}

	// master premium
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/premiumMasterList/{user}/{token}")
	public Response premiumMasterList(@PathParam("token") String token,
			@PathParam("user") String name,
			@RequestBody PremiumMaster premiumMaster) {

		response = productService.getPremiumMasterList(premiumMaster);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdatepremiumMaster/{username}/{token}")
	public Response addUpdatepremiumMaster(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody PremiumMaster premiumMaster) {
		Response response = null;

		response = productService.insertOrUpdatePremiumMaster(premiumMaster);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/checkPremiumMasterAgeRange/{username}/{token}")
	public Response checkPremiumMasterAgeRange(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody PremiumMaster premiumMaster) {
		Response response = null;
		response = productService.checkPremiumMasterAgeRange(premiumMaster);
		return response;
	}

	// price history
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPriceHistory/{username}/{token}")
	public Response getPriceHistory(@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody PriceHistory priceHistory) {
		Response response = null;
		response = productService.getProductPriceHistory(priceHistory);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateproductPrice/{username}/{token}")
	public Response addUpdateproductPrice(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody PriceHistory priceHistory) {
		Response response = null;
		response = productService.insertOrUpdatePrice(priceHistory);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/checkPriceValue/{username}/{token}")
	public Response checkPriceValue(@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody PriceHistory priceHistory) {
		Response response = null;
		response = productService.checkPriceValueIsPresent(priceHistory);
		return response;
	}

	// revenue
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRevenueMasterList/{username}/{token}")
	public Response getRevenueMasterList(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductRevenueBook productRevenue) {
		Response response = null;
		response = productService.getProductRevenueMasterList(productRevenue);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateproductRevenue/{username}/{token}")
	public Response addUpdateproductRevenue(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductRevenueBook productRevenue) {
		Response response = null;
		response = productService.insertOrUpdateProductRevenue(productRevenue);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRecordTypeList/{username}/{token}")
	public Response getRecordTypeList(@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductRevenueBook productRevenue) {
		Response response = null;
		response = productService.getRecordTypeList(productRevenue);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getRecordType/{username}/{token}")
	public Response getRecordType(@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductRevenueBook productRevenue) {
		Response response = null;
		response = productService.getRecordType(productRevenue);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/checkProductRevenueRange/{username}/{token}")
	public Response checkProductRevenueRange(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductRevenueBook productRevenue) {
		Response response = null;
		response = productService.checkProductRevenueRange(productRevenue);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/checkProductRevenueYearRange/{username}/{token}")
	public Response checkProductRevenueYearRange(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductRevenueBook productRevenue) {
		Response response = null;
		response = productService.checkProductRevenueYearRange(productRevenue);
		return response;
	}

	// product category revenue
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCategoryRevenueList/{username}/{token}")
	public Response getCategoryRevenueList(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductCategoryRevenue productCategoryRevenue) {
		Response response = null;
		response = productService
				.getProductCategoryRevenueList(productCategoryRevenue);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/checkProductCatRevenue/{username}/{token}")
	public Response checkProductCatRevenue(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductCategoryRevenue productCategoryRevenue) {
		Response response = null;
		response = productService
				.checkProductCategoryRevenue(productCategoryRevenue);
		return response;
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateproductCategoryRevenue/{username}/{token}")
	public Response addUpdateproductCategoryRevenue(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductCategoryRevenue productCategoryRevenue) {
		Response response = null;
		response = productService
				.insertOrUpdateProductCategoryRevenue(productCategoryRevenue);
		return response;
	}

	// product manufacturer
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/productMfgList/{username}/{token}")
	public Response productMfgList(@PathParam("username") String userName,
			@PathParam("token") String token, @RequestBody ProductMfg productMfg) {
		Response response = null;
		response = productService.getProductManufacturerList(productMfg);
		return response;
	}

	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateproductMfg/{username}/{token}")
	public Response addUpdateproductMfg(
			@PathParam("username") String userName,
			@PathParam("token") String token,
			@RequestBody ProductMfg productMfg) {
		Response response = null;
		response = productService
				.insertOrUpdateProductManufacturer(productMfg);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/prodMfgTypeList/{user}/{token}")
	public Response prodMfgTypeList(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody ProductMfg productMfg) {

		response = productService.getProductMfgTypeList(productMfg);
		return response;
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/checkCustodianCode/{user}/{token}")
	public Response checkCustodianCode(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody Product product) {

		response = productService.checkCustodianCode(product);
		return response;
	}
}
