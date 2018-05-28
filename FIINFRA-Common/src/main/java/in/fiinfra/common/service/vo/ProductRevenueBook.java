package in.fiinfra.common.service.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class ProductRevenueBook implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer productRevBookId;

	private int recordTypeId;
	
	private int partyId;
	
	private String partyName;

	private String recordType;

	private int productId;

	private String startDate;

	private String endDate;

	private BigDecimal startAmount;

	private BigDecimal endAmount;

	private Integer startYear;

	private Integer endYear;

	private BigDecimal oneTimeRevenue;

	private BigDecimal upFrontRevenue;

	private BigDecimal trialRevenue;

	private int createOrModifiedBy;

	private int revenueTypeId;

	private String revenueType;

	private String searchText;

	private int buPartyId;
	
	public Integer getProductRevBookId() {
		return productRevBookId;
	}

	public void setProductRevBookId(Integer productRevBookId) {
		this.productRevBookId = productRevBookId;
	}

	public int getRecordTypeId() {
		return recordTypeId;
	}

	public void setRecordTypeId(int recordTypeId) {
		this.recordTypeId = recordTypeId;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public BigDecimal getStartAmount() {
		return startAmount;
	}

	public void setStartAmount(BigDecimal startAmount) {
		this.startAmount = startAmount;
	}

	public BigDecimal getEndAmount() {
		return endAmount;
	}

	public void setEndAmount(BigDecimal endAmount) {
		this.endAmount = endAmount;
	}

	public Integer getStartYear() {
		return startYear;
	}

	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}

	public Integer getEndYear() {
		return endYear;
	}

	public void setEndYear(Integer endYear) {
		this.endYear = endYear;
	}

	public BigDecimal getOneTimeRevenue() {
		return oneTimeRevenue;
	}

	public void setOneTimeRevenue(BigDecimal oneTimeRevenue) {
		this.oneTimeRevenue = oneTimeRevenue;
	}

	public BigDecimal getUpFrontRevenue() {
		return upFrontRevenue;
	}

	public void setUpFrontRevenue(BigDecimal upFrontRevenue) {
		this.upFrontRevenue = upFrontRevenue;
	}

	public BigDecimal getTrialRevenue() {
		return trialRevenue;
	}

	public void setTrialRevenue(BigDecimal trialRevenue) {
		this.trialRevenue = trialRevenue;
	}

	public int getCreateOrModifiedBy() {
		return createOrModifiedBy;
	}

	public void setCreateOrModifiedBy(int createOrModifiedBy) {
		this.createOrModifiedBy = createOrModifiedBy;
	}

	public String getRecordType() {
		return recordType;
	}

	public void setRecordType(String recordType) {
		this.recordType = recordType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getRevenueTypeId() {
		return revenueTypeId;
	}

	public void setRevenueTypeId(int revenueTypeId) {
		this.revenueTypeId = revenueTypeId;
	}

	public String getRevenueType() {
		return revenueType;
	}

	public void setRevenueType(String revenueType) {
		this.revenueType = revenueType;
	}

	public int getBuPartyId() {
		return buPartyId;
	}

	public void setBuPartyId(int buPartyId) {
		this.buPartyId = buPartyId;
	}

}
