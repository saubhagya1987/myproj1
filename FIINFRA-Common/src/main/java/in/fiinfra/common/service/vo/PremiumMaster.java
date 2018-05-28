package in.fiinfra.common.service.vo;

import java.math.BigDecimal;

public class PremiumMaster {

	private int productPremiumId;

	private int masterProductId;

	private Integer startAgeRange;

	private Integer endAgeRange;

	private BigDecimal sumAssuredAmount;

	private Integer policyPaymentTerm;

	private BigDecimal premiumAmount;

	private Integer spouse;
	private String spouseName;
	

	public String getSpouseName() {
		return spouseName;
	}

	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}

	private Integer child;
	private String childCover;
	
	private String searchText;
	
	private int createOrModifiedBy;
	
	private Boolean isDefault;
	private String defaultValue;
	

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	

	public String getChildCover() {
		return childCover;
	}

	public void setChildCover(String childCover) {
		this.childCover = childCover;
	}

	public int getProductPremiumId() {
		return productPremiumId;
	}

	public void setProductPremiumId(int productPremiumId) {
		this.productPremiumId = productPremiumId;
	}

	public int getMasterProductId() {
		return masterProductId;
	}

	public void setMasterProductId(int masterProductId) {
		this.masterProductId = masterProductId;
	}

	public Integer getStartAgeRange() {
		return startAgeRange;
	}

	public void setStartAgeRange(Integer startAgeRange) {
		this.startAgeRange = startAgeRange;
	}

	public Integer getEndAgeRange() {
		return endAgeRange;
	}

	public void setEndAgeRange(Integer endAgeRange) {
		this.endAgeRange = endAgeRange;
	}

	public BigDecimal getSumAssuredAmount() {
		return sumAssuredAmount;
	}

	public void setSumAssuredAmount(BigDecimal sumAssuredAmount) {
		this.sumAssuredAmount = sumAssuredAmount;
	}

	public Integer getPolicyPaymentTerm() {
		return policyPaymentTerm;
	}

	public void setPolicyPaymentTerm(Integer policyPaymentTerm) {
		this.policyPaymentTerm = policyPaymentTerm;
	}

	public BigDecimal getPremiumAmount() {
		return premiumAmount;
	}

	public void setPremiumAmount(BigDecimal premiumAmount) {
		this.premiumAmount = premiumAmount;
	}

	public Integer getSpouse() {
		return spouse;
	}

	public void setSpouse(Integer spouse) {
		this.spouse = spouse;
	}

	public Integer getChild() {
		return child;
	}

	public void setChild(Integer child) {
		this.child = child;
	}
	
	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getCreateOrModifiedBy() {
		return createOrModifiedBy;
	}

	public void setCreateOrModifiedBy(int createOrModifiedBy) {
		this.createOrModifiedBy = createOrModifiedBy;
	}

	public Boolean getisDefault() {
		return isDefault;
	}

	public void setisDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
}
