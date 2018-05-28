package in.fiinfra.common.partner;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.ldap.core.SearchExecutor;
import org.springframework.web.multipart.MultipartFile;
//@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
/**
 * 
 * @author 
 *
 */
public class ETData implements Serializable{
	
	//list of uploaded files
	List<MultipartFile> files = new ArrayList<MultipartFile>();
	
	//the  transaction source
	String txnSource;
	
	//type of file uploaded
	String fileType;
	
	
	private String goalName;
	private String goalType;
	private String executionStatus;
	private String targetAmount;
	private String targetYear;
	private String totalLumpsumAmount;
	private String totalSIPAmont;
	private String productName;
	private String allocationPercent;
	private String investmentType;
	private String investmentAmount;
	private String frequency;
	private String clientApprovalStatus;
	private String executionStartDate;
	private String recommendedInvestment;
	private String cancelNoteText;
	private int partyId;
	private int fpExecutionId;
	private int buId;
	
	
	public int getFpExecutionId() {
		return fpExecutionId;
	}

	public void setFpExecutionId(int fpExecutionId) {
		this.fpExecutionId = fpExecutionId;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public String getCancelNoteText() {
		return cancelNoteText;
	}

	public void setCancelNoteText(String cancelNoteText) {
		this.cancelNoteText = cancelNoteText;
	}

	public ETData(){
		
	}

	public String getRecommendedInvestment() {
		return recommendedInvestment;
	}

	public void setRecommendedInvestment(String recommendedInvestment) {
		this.recommendedInvestment = recommendedInvestment;
	}

	public String getExecutionStartDate() {
		return executionStartDate;
	}

	public void setExecutionStartDate(String executionStartDate) {
		this.executionStartDate = executionStartDate;
	}

	public String getGoalName() {
		return goalName;
	}

	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}

	public String getGoalType() {
		return goalType;
	}

	public void setGoalType(String goalType) {
		this.goalType = goalType;
	}

	public String getExecutionStatus() {
		return executionStatus;
	}

	public void setExecutionStatus(String executionStatus) {
		this.executionStatus = executionStatus;
	}

	public String getTargetAmount() {
		return targetAmount;
	}

	public void setTargetAmount(String targetAmount) {
		this.targetAmount = targetAmount;
	}

	public String getTargetYear() {
		return targetYear;
	}

	public void setTargetYear(String targetYear) {
		this.targetYear = targetYear;
	}

	public String getTotalLumpsumAmount() {
		return totalLumpsumAmount;
	}

	public void setTotalLumpsumAmount(String totalLumpsumAmount) {
		this.totalLumpsumAmount = totalLumpsumAmount;
	}

	public String getTotalSIPAmont() {
		return totalSIPAmont;
	}

	public void setTotalSIPAmont(String totalSIPAmont) {
		this.totalSIPAmont = totalSIPAmont;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getAllocationPercent() {
		return allocationPercent;
	}

	public void setAllocationPercent(String allocationPercent) {
		this.allocationPercent = allocationPercent;
	}

	public String getInvestmentType() {
		return investmentType;
	}

	public void setInvestmentType(String investmentType) {
		this.investmentType = investmentType;
	}

	public String getInvestmentAmount() {
		return investmentAmount;
	}

	public void setInvestmentAmount(String investmentAmount) {
		this.investmentAmount = investmentAmount;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public String getClientApprovalStatus() {
		return clientApprovalStatus;
	}

	public void setClientApprovalStatus(String clientApprovalStatus) {
		this.clientApprovalStatus = clientApprovalStatus;
	}

	/**
	 * @return the files
	 */
	public List<MultipartFile> getFiles() {
		return files;
	}

	/**
	 * @param files the files to set
	 */
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	/**
	 * @return the txnSource
	 */
	public String getTxnSource() {
		return txnSource;
	}

	/**
	 * @param txnSource the txnSource to set
	 */
	public void setTxnSource(String txnSource) {
		this.txnSource = txnSource;
	}

	/**
	 * @return the fileType
	 */
	public String getFileType() {
		return fileType;
	}

	/**
	 * @param fileType the fileType to set
	 */
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	
	
}
