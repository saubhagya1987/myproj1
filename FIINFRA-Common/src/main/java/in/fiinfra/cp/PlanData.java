package in.fiinfra.cp;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class PlanData implements Comparable<PlanData> {
	private Integer partyId;
	private Integer planId;
	private Integer fpActionPlanID;
	private Integer fpSectionTypeID;
	private String sectionType;
	private Integer fpSectionSubTypeID;
	private String fpSectionSubType;
	private String adviceTranscriptText;
	private double investmentAmount;
	private double lumpsumAmount;
	private double sipAmount;
	private String purposeText;
	private Integer sipFrequencyID;
	private String sipFrequency;
	private String sipDurationInMonths;
	private double insuranceCoverAmount;
	private String insuranceCoverTerm;
	private String insurancePaymentTerm;
	private double insurancePremiumAmount;
	private double estimatedRevenueAmount;
	private Integer fpExecutionStatusId;
	private String status;
	private Integer apStatusID;
	private String opportunityText;
	private Integer sequence;
	private Integer	noteCount;
	
	

	public Integer getNoteCount() {
		return noteCount;
	}

	public void setNoteCount(Integer noteCount) {
		this.noteCount = noteCount;
	}

	private final List<AllocationData> allocation = new ArrayList<AllocationData>();

	public String getSectionType() {
		return sectionType;
	}

	public void setSectionType(String sectionType) {
		this.sectionType = sectionType;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public Integer getPartyId() {
		return partyId;
	}

	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	public List<AllocationData> getAllocation() {
		return allocation;
	}

	public void addAllocation(AllocationData allocation) {
		this.allocation.add(allocation);
	}

	@Override
	public int compareTo(PlanData o) {

		return this.sequence.compareTo(o.getSequence());
	}

	public Integer getPlanId() {
		return planId;
	}

	public void setPlanId(Integer planId) {
		this.planId = planId;
	}

	public Integer getFpActionPlanID() {
		return fpActionPlanID;
	}

	public void setFpActionPlanID(Integer fpActionPlanID) {
		this.fpActionPlanID = fpActionPlanID;
	}

	public Integer getFpSectionTypeID() {
		return fpSectionTypeID;
	}

	public void setFpSectionTypeID(Integer fpSectionTypeID) {
		this.fpSectionTypeID = fpSectionTypeID;
	}

	public Integer getFpSectionSubTypeID() {
		return fpSectionSubTypeID;
	}

	public void setFpSectionSubTypeID(Integer fpSectionSubTypeID) {
		this.fpSectionSubTypeID = fpSectionSubTypeID;
	}

	public String getAdviceTranscriptText() {
		return adviceTranscriptText;
	}

	public void setAdviceTranscriptText(String adviceTranscriptText) {
		this.adviceTranscriptText = adviceTranscriptText;
	}

	public double getInvestmentAmount() {
		return investmentAmount;
	}

	public void setInvestmentAmount(double investmentAmount) {
		this.investmentAmount = investmentAmount;
	}

	public double getLumpsumAmount() {
		return lumpsumAmount;
	}

	public void setLumpsumAmount(double lumpsumAmount) {
		this.lumpsumAmount = lumpsumAmount;
	}

	public double getSipAmount() {
		return sipAmount;
	}

	public void setSipAmount(double sipAmount) {
		this.sipAmount = sipAmount;
	}

	public String getPurposeText() {
		return purposeText;
	}

	public void setPurposeText(String purposeText) {
		this.purposeText = purposeText;
	}

	public Integer getSipFrequencyID() {
		return sipFrequencyID;
	}

	public void setSipFrequencyID(Integer sipFrequencyID) {
		this.sipFrequencyID = sipFrequencyID;
	}

	public String getSipDurationInMonths() {
		return sipDurationInMonths;
	}

	public void setSipDurationInMonths(String sipDurationInMonths) {
		this.sipDurationInMonths = sipDurationInMonths;
	}

	public double getInsuranceCoverAmount() {
		return insuranceCoverAmount;
	}

	public void setInsuranceCoverAmount(double insuranceCoverAmount) {
		this.insuranceCoverAmount = insuranceCoverAmount;
	}

	public String getInsuranceCoverTerm() {
		return insuranceCoverTerm;
	}

	public void setInsuranceCoverTerm(String insuranceCoverTerm) {
		this.insuranceCoverTerm = insuranceCoverTerm;
	}

	public String getInsurancePaymentTerm() {
		return insurancePaymentTerm;
	}

	public void setInsurancePaymentTerm(String insurancePaymentTerm) {
		this.insurancePaymentTerm = insurancePaymentTerm;
	}

	public double getInsurancePremiumAmount() {
		return insurancePremiumAmount;
	}

	public void setInsurancePremiumAmount(double insurancePremiumAmount) {
		this.insurancePremiumAmount = insurancePremiumAmount;
	}

	public double getEstimatedRevenueAmount() {
		return estimatedRevenueAmount;
	}

	public void setEstimatedRevenueAmount(double estimatedRevenueAmount) {
		this.estimatedRevenueAmount = estimatedRevenueAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

	public Integer getFpExecutionStatusId() {
		return fpExecutionStatusId;
	}

	public void setFpExecutionStatusId(Integer fpExecutionStatusId) {
		this.fpExecutionStatusId = fpExecutionStatusId;
	}

	public Integer getApStatusID() {
		return apStatusID;
	}

	public void setApStatusID(Integer apStatusID) {
		this.apStatusID = apStatusID;
	}

	public String getOpportunityText() {
		return opportunityText;
	}

	public void setOpportunityText(String opportunityText) {
		this.opportunityText = opportunityText;
	}

	public String getFpSectionSubType() {
		return fpSectionSubType;
	}

	public void setFpSectionSubType(String fpSectionSubType) {
		this.fpSectionSubType = fpSectionSubType;
	}

	public String getSipFrequency() {
		return sipFrequency;
	}

	public void setSipFrequency(String sipFrequency) {
		this.sipFrequency = sipFrequency;
	}

}
