package in.fiinfra.common.partner;

import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.utility.GoalData;

import java.util.List;

public class AutoPlanData {

	private String firstname;
	private String lastname;
	private String dob;
	private String emailId;
	private String income;
	private String expense;
	private String retirementAge;
	private String emergencyMonths;
	private String riskProfileId;
	private String panNo;
	private String city;
	private String lifeExpectancy;
	private String EMI;
	private Integer title;
	private Integer residentialStatus;
	private Integer	gender;
	private Integer maritalStatus;
	private String	occupation;
	private String contactNo;
	private List<FamilyMemberData> familyMemberDatas;
	private List<GoalData> goalDatas;
	private List<PartyAttributeData> partyAttributeDatas;	
	private int partyId;
	private String dataXML;
	private String goalXML;
	private String familyMemberDataXML;
	private String partyAttributeDataXML;
	private int lastModifiedBy;
	private String will;
	private String monthlyInvestment;
	
	
	public Integer getTitle() {
		return title;
	}
	public void setTitle(Integer title) {
		this.title = title;
	}
	public Integer getResidentialStatus() {
		return residentialStatus;
	}
	public void setResidentialStatus(Integer residentialStatus) {
		this.residentialStatus = residentialStatus;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(Integer maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getMonthlyInvestment() {
		return monthlyInvestment;
	}
	public void setMonthlyInvestment(String monthlyInvestment) {
		this.monthlyInvestment = monthlyInvestment;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}	
	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLifeExpectancy() {
		return lifeExpectancy;
	}
	public void setLifeExpectancy(String lifeExpectancy) {
		this.lifeExpectancy = lifeExpectancy;
	}
	public String getWill() {
		return will;
	}
	public void setWill(String will) {
		this.will = will;
	}
	public String getEMI() {
		return EMI;
	}
	public void setEMI(String eMI) {
		EMI = eMI;
	}	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getExpense() {
		return expense;
	}
	public void setExpense(String expense) {
		this.expense = expense;
	}
	public String getRetirementAge() {
		return retirementAge;
	}
	public void setRetirementAge(String retirementAge) {
		this.retirementAge = retirementAge;
	}
	public String getEmergencyMonths() {
		return emergencyMonths;
	}
	public void setEmergencyMonths(String emergencyMonths) {
		this.emergencyMonths = emergencyMonths;
	}
	public String getRiskProfileId() {
		return riskProfileId;
	}
	public void setRiskProfileId(String riskProfileId) {
		this.riskProfileId = riskProfileId;
	}
	public List<FamilyMemberData> getFamilyMemberDatas() {
		return familyMemberDatas;
	}
	public void setFamilyMemberDatas(List<FamilyMemberData> familyMemberDatas) {
		this.familyMemberDatas = familyMemberDatas;
	}
	public List<GoalData> getGoalDatas() {
		return goalDatas;
	}
	public void setGoalDatas(List<GoalData> goalDatas) {
		this.goalDatas = goalDatas;
	}
	public List<PartyAttributeData> getPartyAttributeDatas() {
		return partyAttributeDatas;
	}
	public void setPartyAttributeDatas(List<PartyAttributeData> partyAttributeDatas) {
		this.partyAttributeDatas = partyAttributeDatas;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getDataXML() {
		return dataXML;
	}
	public void setDataXML(String dataXML) {
		this.dataXML = dataXML;
	}
	public String getGoalXML() {
		return goalXML;
	}
	public void setGoalXML(String goalXML) {
		this.goalXML = goalXML;
	}
	public String getFamilyMemberDataXML() {
		return familyMemberDataXML;
	}
	public void setFamilyMemberDataXML(String familyMemberDataXML) {
		this.familyMemberDataXML = familyMemberDataXML;
	}
	public String getPartyAttributeDataXML() {
		return partyAttributeDataXML;
	}
	public void setPartyAttributeDataXML(String partyAttributeDataXML) {
		this.partyAttributeDataXML = partyAttributeDataXML;
	}
	public int getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}	
	
}
