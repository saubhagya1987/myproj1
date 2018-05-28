package in.fiinfra.common.service.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class ProductCategoryRevenue implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer productTypeShapeID;

	private Integer productTypeID;
	
	private String productType;

	private Integer revenueTypeID;
	
	private String revenueType;

	private int isOneTimeRevenue;

	private int isUpfrontRevenue;

	private int isTrailRevenue;

	private int isSIP;

	private int isLumpsum;

	private int isPremium;

	private int isInterestOnPrincipal;

	private int isActive;

	private int createOrModifiedBy;

	private BigDecimal onetimeRevenue;

	private BigDecimal upfrontRevenue;

	private BigDecimal trailRevenue;

	private int assetClassID;
	
	private String assetClass;

	private int categoryID;
	
	private String category;

	/*private String trailRevenue2ndYear;

	private String trailRevenue3rdYear;

	private String trailRevenueOtherYears;

	private Integer trailRevenueYears;*/

	private String searchText;
	private String searchText1;
	private String searchText2;
	

	public String getSearchText1() {
		return searchText1;
	}

	public void setSearchText1(String searchText1) {
		this.searchText1 = searchText1;
	}

	public String getSearchText2() {
		return searchText2;
	}

	public void setSearchText2(String searchText2) {
		this.searchText2 = searchText2;
	}

	public Integer getProductTypeShapeID() {
		return productTypeShapeID;
	}

	public void setProductTypeShapeID(Integer productTypeShapeID) {
		this.productTypeShapeID = productTypeShapeID;
	}

	

	public Integer getProductTypeID() {
		return productTypeID;
	}

	public void setProductTypeID(Integer productTypeID) {
		this.productTypeID = productTypeID;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public Integer getRevenueTypeID() {
		return revenueTypeID;
	}

	public void setRevenueTypeID(Integer revenueTypeID) {
		this.revenueTypeID = revenueTypeID;
	}

	public String getRevenueType() {
		return revenueType;
	}

	public void setRevenueType(String revenueType) {
		this.revenueType = revenueType;
	}

	public int getIsOneTimeRevenue() {
		return isOneTimeRevenue;
	}

	public void setIsOneTimeRevenue(int isOneTimeRevenue) {
		this.isOneTimeRevenue = isOneTimeRevenue;
	}

	public int getIsUpfrontRevenue() {
		return isUpfrontRevenue;
	}

	public void setIsUpfrontRevenue(int isUpfrontRevenue) {
		this.isUpfrontRevenue = isUpfrontRevenue;
	}

	public int getIsTrailRevenue() {
		return isTrailRevenue;
	}

	public void setIsTrailRevenue(int isTrailRevenue) {
		this.isTrailRevenue = isTrailRevenue;
	}

	public int getIsSIP() {
		return isSIP;
	}

	public void setIsSIP(int isSIP) {
		this.isSIP = isSIP;
	}

	public int getIsLumpsum() {
		return isLumpsum;
	}

	public void setIsLumpsum(int isLumpsum) {
		this.isLumpsum = isLumpsum;
	}

	public int getIsPremium() {
		return isPremium;
	}

	public void setIsPremium(int isPremium) {
		this.isPremium = isPremium;
	}

	public int getIsInterestOnPrincipal() {
		return isInterestOnPrincipal;
	}

	public void setIsInterestOnPrincipal(int isInterestOnPrincipal) {
		this.isInterestOnPrincipal = isInterestOnPrincipal;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public int getCreateOrModifiedBy() {
		return createOrModifiedBy;
	}

	public void setCreateOrModifiedBy(int createOrModifiedBy) {
		this.createOrModifiedBy = createOrModifiedBy;
	}

	public BigDecimal getOnetimeRevenue() {
		return onetimeRevenue;
	}

	public void setOnetimeRevenue(BigDecimal onetimeRevenue) {
		this.onetimeRevenue = onetimeRevenue;
	}

	public BigDecimal getUpfrontRevenue() {
		return upfrontRevenue;
	}

	public void setUpfrontRevenue(BigDecimal upfrontRevenue) {
		this.upfrontRevenue = upfrontRevenue;
	}

	public BigDecimal getTrailRevenue() {
		return trailRevenue;
	}

	public void setTrailRevenue(BigDecimal trailRevenue) {
		this.trailRevenue = trailRevenue;
	}

	public int getAssetClassID() {
		return assetClassID;
	}

	public void setAssetClassID(int assetClassID) {
		this.assetClassID = assetClassID;
	}

	public String getAssetClass() {
		return assetClass;
	}

	public void setAssetClass(String assetClass) {
		this.assetClass = assetClass;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	/*public String getTrailRevenue2ndYear() {
		return trailRevenue2ndYear;
	}

	public void setTrailRevenue2ndYear(String trailRevenue2ndYear) {
		this.trailRevenue2ndYear = trailRevenue2ndYear;
	}

	public String getTrailRevenue3rdYear() {
		return trailRevenue3rdYear;
	}

	public void setTrailRevenue3rdYear(String trailRevenue3rdYear) {
		this.trailRevenue3rdYear = trailRevenue3rdYear;
	}

	public String getTrailRevenueOtherYears() {
		return trailRevenueOtherYears;
	}

	public void setTrailRevenueOtherYears(String trailRevenueOtherYears) {
		this.trailRevenueOtherYears = trailRevenueOtherYears;
	}

	public Integer getTrailRevenueYears() {
		return trailRevenueYears;
	}

	public void setTrailRevenueYears(Integer trailRevenueYears) {
		this.trailRevenueYears = trailRevenueYears;
	}*/

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}
