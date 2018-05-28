package in.fiinfra.cp;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class AllocationData implements Comparable<AllocationData> {
	private Integer prodAllocationId;
	private Integer fpActionPlanId;
	private Integer productSeq;
	private Integer productId;
	private String productName;
	private long allocationAmount;
	private Integer allocationPercent;
	private Integer sipFreqID;
	private Integer sipDurationInMonths;
	private long sipAmount;
	private Integer insurancePremiumFreqId;
	private Integer fpActionPlanTypeId;
	private String fpActionPlanType;
	private String insurancePremiumFreq;
	private String sipFrequency;
	private long investedAmount;
	private int clientApproval;
	private String status;
	private Integer assetClassId;
	private Integer productCategoryId;
	private Integer productTypeId;
	private String productCategory;
	private Integer executionStatusId;
	private double targetAmount;
	private String frequency;
	private Integer frequencyId;
	
	private Integer noteCount;
	
	
	
	

	public Integer getExecutionStatusId() {
		return executionStatusId;
	}

	public void setExecutionStatusId(Integer executionStatusId) {
		this.executionStatusId = executionStatusId;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	@Override
	public int compareTo(AllocationData o) {
		return this.productSeq.compareTo(o.getProductSeq());
	}

	public Integer getProductSeq() {
		return productSeq;
	}

	public void setProductSeq(Integer productSeq) {
		this.productSeq = productSeq;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public long getAllocationAmount() {
		return allocationAmount;
	}

	public void setAllocationAmount(long allocationAmount) {
		this.allocationAmount = allocationAmount;
	}

	public Integer getAllocationPercent() {
		return allocationPercent;
	}

	public void setAllocationPercent(Integer allocationPercent) {
		this.allocationPercent = allocationPercent;
	}

	public long getSipAmount() {
		return sipAmount;
	}

	public void setSipAmount(long sipAmount) {
		this.sipAmount = sipAmount;
	}

	public Integer getInsurancePremiumFreqId() {
		return insurancePremiumFreqId;
	}

	public void setInsurancePremiumFreqId(Integer insurancePremiumFreqId) {
		this.insurancePremiumFreqId = insurancePremiumFreqId;
	}

	public Integer getFpActionPlanTypeId() {
		return fpActionPlanTypeId;
	}

	public void setFpActionPlanTypeId(Integer fpActionPlanTypeId) {
		this.fpActionPlanTypeId = fpActionPlanTypeId;
	}

	public String getFpActionPlanType() {
		return fpActionPlanType;
	}

	public void setFpActionPlanType(String fpActionPlanType) {
		this.fpActionPlanType = fpActionPlanType;
	}

	public String getInsurancePremiumFreq() {
		return insurancePremiumFreq;
	}

	public void setInsurancePremiumFreq(String insurancePremiumFreq) {
		this.insurancePremiumFreq = insurancePremiumFreq;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getSipFreqID() {
		return sipFreqID;
	}

	public void setSipFreqID(Integer sipFreqID) {
		this.sipFreqID = sipFreqID;
	}

	public Integer getSipDurationInMonths() {
		return sipDurationInMonths;
	}

	public void setSipDurationInMonths(Integer sipDurationInMonths) {
		this.sipDurationInMonths = sipDurationInMonths;
	}

	public long getInvestedAmount() {
		return investedAmount;
	}

	public void setInvestedAmount(long investedAmount) {
		this.investedAmount = investedAmount;
	}

	public int getClientApproval() {
		return clientApproval;
	}

	public void setClientApproval(int clientApproval) {
		this.clientApproval = clientApproval;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSipFrequency() {
		return sipFrequency;
	}

	public void setSipFrequency(String sipFrequency) {
		this.sipFrequency = sipFrequency;
	}

	public Integer getAssetClassId() {
		return assetClassId;
	}

	public void setAssetClassId(Integer assetClassId) {
		this.assetClassId = assetClassId;
	}

	public Integer getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Integer productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public Integer getProductTypeId() {
		return productTypeId;
	}

	public void setProductTypeId(Integer productTypeId) {
		this.productTypeId = productTypeId;
	}

	public Integer getProdAllocationId() {
		return prodAllocationId;
	}

	public void setProdAllocationId(Integer prodAllocationId) {
		this.prodAllocationId = prodAllocationId;
	}

	public Integer getFpActionPlanId() {
		return fpActionPlanId;
	}

	public void setFpActionPlanId(Integer fpActionPlanId) {
		this.fpActionPlanId = fpActionPlanId;
	}

	public double getTargetAmount() {
		return targetAmount;
	}

	public void setTargetAmount(double targetAmount) {
		this.targetAmount = targetAmount;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public Integer getFrequencyId() {
		return frequencyId;
	}

	public void setFrequencyId(Integer frequencyId) {
		this.frequencyId = frequencyId;
	}

	public Integer getNoteCount() {
		return noteCount;
	}

	public void setNoteCount(Integer noteCount) {
		this.noteCount = noteCount;
	}

	
}
