package in.fiinfra.common.common;
import org.codehaus.jackson.map.annotate.JsonSerialize;


public class InsuranceData {
	private Integer partyID;
	private Integer partyInsuranceId;
	private String partyInsuranceName;
	private Integer insuranceTypeID;
	private String insuranceName;
	private Integer productID;
	private String productName;
	private Double insuranceCoverAmount;	
	private Integer insurancePaymentTerm;
	private Double insurancePremiumAmount;
	private Integer insurancePremiumPeriodTypeID;
	private Double insurancePremiumPeriodValue; 
	private Integer linkedPartyAssetID;
	private Integer createdBy;
	private String creationDate;
	private Integer lastModifiedBy;
	private String lastModifiedDate;
	private Integer batchRunId;	
	private Integer goalCount;	
	private Double requiredAmount;	
	private String insuranceTypeIds;
	private Double currentValue;
	private Integer insurenceOwnerTypeId;
	private String insurenceOwnerType;
	private String associatedFamilyPartyId;	
	private String individualSumAssured;
	private Integer assetTypeId;
	private Integer userId;
	private String familyMembersName;
	private Integer familyType;
	private String assetName;
	private Integer tenure;
	private String commencementDate;
	private String maturityDate;
	private Double allocatedAmount;
	private Double maturityAmount;
	private String insurancePolicyNumber;
	
	
	
	public String getInsurancePolicyNumber() {
		return insurancePolicyNumber;
	}
	public void setInsurancePolicyNumber(String insurancePolicyNumber) {
		this.insurancePolicyNumber = insurancePolicyNumber;
	}
	public Double getMaturityAmount() {
		return maturityAmount;
	}
	public void setMaturityAmount(Double maturityAmount) {
		this.maturityAmount = maturityAmount;
	}
	public Double getAllocatedAmount() {
		return allocatedAmount;
	}
	public void setAllocatedAmount(Double allocatedAmount) {
		this.allocatedAmount = allocatedAmount;
	}
	public Integer getTenure() {
		return tenure;
	}
	public void setTenure(Integer tenure) {
		this.tenure = tenure;
	}
	public String getCommencementDate() {
		return commencementDate;
	}
	public void setCommencementDate(String commencementDate) {
		this.commencementDate = commencementDate;
	}
	public String getMaturityDate() {
		return maturityDate;
	}
	public void setMaturityDate(String maturityDate) {
		this.maturityDate = maturityDate;
	}
	public Integer getFamilyType() {
		return familyType;
	}
	public void setFamilyType(Integer familyType) {
		this.familyType = familyType;
	}
	public String getInsurenceOwnerType() {
		return insurenceOwnerType;
	}
	public void setInsurenceOwnerType(String insurenceOwnerType) {
		this.insurenceOwnerType = insurenceOwnerType;
	}
	public String getFamilyMembersName() {
		return familyMembersName;
	}
	public void setFamilyMembersName(String familyMembersName) {
		this.familyMembersName = familyMembersName;
	}
	public Double getCurrentValue() {
		return currentValue;
	}
	public void setCurrentValue(Double currentValue) {
		this.currentValue = currentValue;
	}
	public Integer getInsurenceOwnerTypeId() {
		return insurenceOwnerTypeId;
	}
	public void setInsurenceOwnerTypeId(Integer insurenceOwnerTypeId) {
		this.insurenceOwnerTypeId = insurenceOwnerTypeId;
	}
	public String getAssociatedFamilyPartyId() {
		return associatedFamilyPartyId;
	}
	public void setAssociatedFamilyPartyId(String associatedFamilyPartyId) {
		this.associatedFamilyPartyId = associatedFamilyPartyId;
	}	
	public String getIndividualSumAssured() {
		return individualSumAssured;
	}
	public void setIndividualSumAssured(String individualSumAssured) {
		this.individualSumAssured = individualSumAssured;
	}
	public Integer getAssetTypeId() {
		return assetTypeId;
	}
	public void setAssetTypeId(Integer assetTypeId) {
		this.assetTypeId = assetTypeId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}	
	public String getInsuranceTypeIds() {
		return insuranceTypeIds;
	}
	public void setInsuranceTypeIds(String insuranceTypeIds) {
		this.insuranceTypeIds = insuranceTypeIds;
	}
	public Integer getPartyID() {
		return partyID;
	}
	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}
	public Integer getPartyInsuranceId() {
		return partyInsuranceId;
	}
	public void setPartyInsuranceId(Integer partyInsuranceId) {
		this.partyInsuranceId = partyInsuranceId;
	}
	public String getPartyInsuranceName() {
		return partyInsuranceName;
	}
	public void setPartyInsuranceName(String partyInsuranceName) {
		this.partyInsuranceName = partyInsuranceName;
	}
	public Integer getInsuranceTypeID() {
		return insuranceTypeID;
	}
	public void setInsuranceTypeID(Integer insuranceTypeID) {
		this.insuranceTypeID = insuranceTypeID;
	}
	public String getInsuranceName() {
		return insuranceName;
	}
	public void setInsuranceName(String insuranceName) {
		this.insuranceName = insuranceName;
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getInsuranceCoverAmount() {
		return insuranceCoverAmount;
	}
	public void setInsuranceCoverAmount(Double insuranceCoverAmount) {
		this.insuranceCoverAmount = insuranceCoverAmount;
	}	
	public Integer getInsurancePaymentTerm() {
		return insurancePaymentTerm;
	}
	public void setInsurancePaymentTerm(Integer insurancePaymentTerm) {
		this.insurancePaymentTerm = insurancePaymentTerm;
	}
	public Double getInsurancePremiumAmount() {
		return insurancePremiumAmount;
	}
	public void setInsurancePremiumAmount(Double insurancePremiumAmount) {
		this.insurancePremiumAmount = insurancePremiumAmount;
	}
	public Integer getInsurancePremiumPeriodTypeID() {
		return insurancePremiumPeriodTypeID;
	}
	public void setInsurancePremiumPeriodTypeID(Integer insurancePremiumPeriodTypeID) {
		this.insurancePremiumPeriodTypeID = insurancePremiumPeriodTypeID;
	}
	public Double getInsurancePremiumPeriodValue() {
		return insurancePremiumPeriodValue;
	}
	public void setInsurancePremiumPeriodValue(Double insurancePremiumPeriodValue) {
		this.insurancePremiumPeriodValue = insurancePremiumPeriodValue;
	}
	public Integer getLinkedPartyAssetID() {
		return linkedPartyAssetID;
	}
	public void setLinkedPartyAssetID(Integer linkedPartyAssetID) {
		this.linkedPartyAssetID = linkedPartyAssetID;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public Integer getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(Integer lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public Integer getBatchRunId() {
		return batchRunId;
	}
	public void setBatchRunId(Integer batchRunId) {
		this.batchRunId = batchRunId;
	}
	public Integer getGoalCount() {
		return goalCount;
	}
	public void setGoalCount(Integer goalCount) {
		this.goalCount = goalCount;
	}
	public Double getRequiredAmount() {
		return requiredAmount;
	}
	public void setRequiredAmount(Double requiredAmount) {
		this.requiredAmount = requiredAmount;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	
}