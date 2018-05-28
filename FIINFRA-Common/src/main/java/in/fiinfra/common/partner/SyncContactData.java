package in.fiinfra.common.partner;

import in.fiinfra.question.AnswerData;
import in.fiinfra.sync.DcAttribute;
import in.fiinfra.sync.DcGoal;

public class SyncContactData {

	private Integer partyId;
	private Integer localId;
	private String fName;
	private String lName;
	private String panNo;
	private String emailId;
	private String mobile;
	private String dob;
	private String age;
	private String name;
	private int recordTypeId;
	private String maritalStatus;
	private Integer maritalStatusId;
	private String occupation;
	private String city;
	private Integer xrayId;
	private Integer analysisReportId;
	private Integer actionPlanId;
	private Integer quickPlanId;
	private Integer summaryPlanId;
	private Integer detailPlanId;
	private AnswerData[] xray;
	

	private DcAttribute[] dcAttribute;
	
	private DcGoal[] dcGoals;
	
	private String dcStatus;


	private Integer dcStatusId;

	public int getRecordTypeId() {
		return recordTypeId;
	}

	public void setRecordTypeId(int recordTypeId) {
		this.recordTypeId = recordTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the partyId
	 */
	public Integer getPartyId() {
		return partyId;
	}

	/**
	 * @param partyId
	 *            the partyId to set
	 */
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	/**
	 * @return the fName
	 */
	public String getfName() {
		return fName;
	}

	/**
	 * @param fName
	 *            the fName to set
	 */
	public void setfName(String fName) {
		this.fName = fName;
	}

	/**
	 * @return the lName
	 */
	public String getlName() {
		return lName;
	}

	/**
	 * @param lName
	 *            the lName to set
	 */
	public void setlName(String lName) {
		this.lName = lName;
	}

	/**
	 * @return the panNo
	 */
	public String getPanNo() {
		return panNo;
	}

	/**
	 * @param panNo
	 *            the panNo to set
	 */
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	/**
	 * @return the emailId
	 */
	public String getEmailId() {
		return emailId;
	}

	/**
	 * @param emailId
	 *            the emailId to set
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public AnswerData[] getXray() {
		return xray;
	}

	public void setXray(AnswerData[] xray) {
		this.xray = xray;
	}

	public String getDcStatus() {
		return dcStatus;
	}

	public void setDcStatus(String dcStatus) {
		this.dcStatus = dcStatus;
	}

	public Integer getDcStatusId() {
		return dcStatusId;
	}

	public void setDcStatusId(Integer dcStatusId) {
		this.dcStatusId = dcStatusId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getXrayId() {
		return xrayId;
	}

	public void setXrayId(Integer xrayId) {
		this.xrayId = xrayId;
	}

	public Integer getAnalysisReportId() {
		return analysisReportId;
	}

	public void setAnalysisReportId(Integer analysisReportId) {
		this.analysisReportId = analysisReportId;
	}

	public Integer getActionPlanId() {
		return actionPlanId;
	}

	public void setActionPlanId(Integer actionPlanId) {
		this.actionPlanId = actionPlanId;
	}

	public Integer getLocalId() {
		return localId;
	}

	public void setLocalId(Integer localId) {
		this.localId = localId;
	}

	public DcAttribute[] getDcAttribute() {
		return dcAttribute;
	}

	public void setDcAttribute(DcAttribute[] dcAttribute) {
		this.dcAttribute = dcAttribute;
	}

	public DcGoal[] getDcGoals() {
		return dcGoals;
	}

	public void setDcGoals(DcGoal[] dcGoals) {
		this.dcGoals = dcGoals;
	}

	public Integer getQuickPlanId() {
		return quickPlanId;
	}

	public void setQuickPlanId(Integer quickPlanId) {
		this.quickPlanId = quickPlanId;
	}

	public Integer getSummaryPlanId() {
		return summaryPlanId;
	}

	public void setSummaryPlanId(Integer summaryPlanId) {
		this.summaryPlanId = summaryPlanId;
	}

	public Integer getDetailPlanId() {
		return detailPlanId;
	}

	public void setDetailPlanId(Integer detailPlanId) {
		this.detailPlanId = detailPlanId;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getMaritalStatusId() {
		return maritalStatusId;
	}

	public void setMaritalStatusId(Integer maritalStatusId) {
		this.maritalStatusId = maritalStatusId;
	}

}
