package in.fiinfra.common.service.vo;

import java.math.BigDecimal;

import org.codehaus.jackson.annotate.JsonProperty;

public class Product {

	private int assetId;

	private String assetName;

	private int prodTypeId;

	private String prodTypeName;

	private int prodCatId;

	private String prodCatName;
	
	
	

	private int masterProductId;

	private int assetClassId;

	private String manufacturer;

	private String productName;
	
	private String productDescription;

	private String assetClassName;

	private String assetProductTypesName;

	private String productCategoryName;

	private String custodianCode;

	private String industryCode;

	private String ISINCode;

	private boolean isActive;

	private Boolean isClosedEnd;

	private Boolean isInstitutional;
	
	
	private String custodianCodeAlias;
	
	private BigDecimal minSIPValue;
	
	private BigDecimal minPurchaseValue;
	
	private BigDecimal minAddnPurchaseValue;
	
	private int createdBy;

	private int lastModifiedBy;
	
	private String searchText;

	//private int prodCategoryId;

	public int getAssetId() {
		return assetId;
	}

	public void setAssetId(int assetId) {
		this.assetId = assetId;
	}

	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public int getProdTypeId() {
		return prodTypeId;
	}

	public void setProdTypeId(int prodTypeId) {
		this.prodTypeId = prodTypeId;
	}

	public String getProdTypeName() {
		return prodTypeName;
	}

	public void setProdTypeName(String prodTypeName) {
		this.prodTypeName = prodTypeName;
	}

	public int getProdCatId() {
		return prodCatId;
	}

	public void setProdCatId(int prodCatId) {
		this.prodCatId = prodCatId;
	}

	public String getProdCatName() {
		return prodCatName;
	}

	public void setProdCatName(String prodCatName) {
		this.prodCatName = prodCatName;
	}

	public int getMasterProductId() {
		return masterProductId;
	}

	public void setMasterProductId(int masterProductId) {
		this.masterProductId = masterProductId;
	}

	public int getAssetClassId() {
		return assetClassId;
	}

	public void setAssetClassId(int assetClassId) {
		this.assetClassId = assetClassId;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getAssetClassName() {
		return assetClassName;
	}

	public void setAssetClassName(String assetClassName) {
		this.assetClassName = assetClassName;
	}

	public String getAssetProductTypesName() {
		return assetProductTypesName;
	}

	public void setAssetProductTypesName(String assetProductTypesName) {
		this.assetProductTypesName = assetProductTypesName;
	}

	public String getProductCategoryName() {
		return productCategoryName;
	}

	public void setProductCategoryName(String productCategoryName) {
		this.productCategoryName = productCategoryName;
	}

	public String getCustodianCode() {
		return custodianCode;
	}

	public void setCustodianCode(String custodianCode) {
		this.custodianCode = custodianCode;
	}

	public String getIndustryCode() {
		return industryCode;
	}

	public void setIndustryCode(String industryCode) {
		this.industryCode = industryCode;
	}

	public String getISINCode() {
		return ISINCode;
	}

	public void setISINCode(String iSINCode) {
		ISINCode = iSINCode;
	}

	
	/*public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}*/

	public boolean getisActive() 
	{
		return isActive;
	}
	public void setisActive(boolean isActive) 
	{
		this.isActive = isActive;
	}

	

	public Boolean getisClosedEnd() {
		return isClosedEnd;
	}

	public void setisClosedEnd(Boolean isClosedEnd) {
		this.isClosedEnd = isClosedEnd;
	}

	public Boolean getisInstitutional() {
		return isInstitutional;
	}

	public void setisInstitutional(Boolean isInstitutional) {
		this.isInstitutional = isInstitutional;
	}

	public String getCustodianCodeAlias() {
		return custodianCodeAlias;
	}

	public void setCustodianCodeAlias(String custodianCodeAlias) {
		this.custodianCodeAlias = custodianCodeAlias;
	}

	public BigDecimal getMinSIPValue() {
		return minSIPValue;
	}

	public void setMinSIPValue(BigDecimal minSIPValue) {
		this.minSIPValue = minSIPValue;
	}

	
	
	public BigDecimal getMinPurchaseValue() {
		return minPurchaseValue;
	}

	public void setMinPurchaseValue(BigDecimal minPurchaseValue) {
		this.minPurchaseValue = minPurchaseValue;
	}

	public BigDecimal getMinAddnPurchaseValue() {
		return minAddnPurchaseValue;
	}

	public void setMinAddnPurchaseValue(BigDecimal minAddnPurchaseValue) {
		this.minAddnPurchaseValue = minAddnPurchaseValue;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	/*public int getProdCategoryId() {
		return prodCategoryId;
	}

	public void setProdCategoryId(int prodCategoryId) {
		this.prodCategoryId = prodCategoryId;
	}*/

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}
