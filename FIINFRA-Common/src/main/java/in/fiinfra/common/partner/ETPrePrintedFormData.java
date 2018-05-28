package in.fiinfra.common.partner;

import java.util.List;
import java.util.Map;

public class ETPrePrintedFormData {

	private int fpExecutionId;
	private Map<String,String> products;
	private String arnCode;
	private String subBrokerCode;
	
	
	/*First investor details*/
	private String folioNo;
	private String title1;
	private String name1;
	private String gender1;
	private String dob1;
	private String panNo1;
	private String emailId1;
	private String mobileNo1;
	private String contactNoRes1;
	private String contactNoOff1;
	private String guardianName1;
	private String guardianRelation1;
	private String address1;
	private String city1;
	private String state1;	
	private String country1;
	private String zipCode1;
	private String applicationStatus1;
	private String modeOfHolding1;
	private String occupation1;
	private List<String> folioNos;
	
	/*2nd Investor details*/
	private String title2;
	private String name2;
	private String panNo2;
	
	/* 3rd Investor details*/
	private String title3;
	private String name3;
	private String panNo3;
	
	
	/*bank details*/
	private String bankName;
	private String branchName;
	private String bankAddress;
	private String bankCity;
	private String bankAcType;
	private String bankAcNo;
	private String bankMicrCode;
	private String bankIfscCode;
	
	private String bankState;
	
	
	
	
	
	/*Investment Details*/
	private String productId;
	private String productName;
	private String schemeName;
	private String schemeOption;
	private String schemeType;
	private String investmentAmount;
	private String investmentTypeId;
	private String transactionTypeId;
	
	/* Nominee details*/
	private String nomineeName1;
	private String nomineeName2;
	private String nomineeName3;
	private String nomineeAddress1;
	
	private String nomineeAddress2;
	private String nomineeAddress3;
	private String nomineeDob1;
	private String nomineeDob2;
	private String nomineeDob3;
	private String nomineeRelation1;
	private String nomineeRelation2;
	private String nomineeRelation3;
	private String nomineeGuardianName1;
	private String nomineeGuardianName2;
	private String nomineeGuardianName3;
	private String nomineeGuardianAddress1;
	private String nomineeGuardianAddress2;
	
	private String nomineeGuardianAddress3;
	
	private String nomineeAllocationPercent1;
	private String nomineeAllocationPercent2;
	private String nomineeAllocationPercent3;
	
	private String formName;
	private String generatedOn;
	private String formPath;
	private String docId;
	private String euin;
	private String cityCategory;
	
	private int buId;
	private int salutionId;
	private int relationshipId;
	private int partyId;
	
	public String getCityCategory() {
		return cityCategory;
	}
	public void setCityCategory(String cityCategory) {
		this.cityCategory = cityCategory;
	}
	public String getEuin() {
		return euin;
	}
	public void setEuin(String euin) {
		this.euin = euin;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getGeneratedOn() {
		return generatedOn;
	}
	public void setGeneratedOn(String generatedOn) {
		this.generatedOn = generatedOn;
	}
	public String getFormPath() {
		return formPath;
	}
	public void setFormPath(String formPath) {
		this.formPath = formPath;
	}
	public String getInvestmentTypeId() {
		return investmentTypeId;
	}
	public void setInvestmentTypeId(String investmentTypeId) {
		this.investmentTypeId = investmentTypeId;
	}
	public String getTransactionTypeId() {
		return transactionTypeId;
	}
	public void setTransactionTypeId(String transactionTypeId) {
		this.transactionTypeId = transactionTypeId;
	}
	public String getNomineeAllocationPercent1() {
		return nomineeAllocationPercent1;
	}
	public void setNomineeAllocationPercent1(String nomineeAllocationPercent1) {
		this.nomineeAllocationPercent1 = nomineeAllocationPercent1;
	}
	public String getNomineeAllocationPercent2() {
		return nomineeAllocationPercent2;
	}
	public void setNomineeAllocationPercent2(String nomineeAllocationPercent2) {
		this.nomineeAllocationPercent2 = nomineeAllocationPercent2;
	}
	public String getNomineeAllocationPercent3() {
		return nomineeAllocationPercent3;
	}
	public void setNomineeAllocationPercent3(String nomineeAllocationPercent3) {
		this.nomineeAllocationPercent3 = nomineeAllocationPercent3;
	}
	public int getFpExecutionId() {
		return fpExecutionId;
	}
	public void setFpExecutionId(int fpExecutionId) {
		this.fpExecutionId = fpExecutionId;
	}	
	public String getArnCode() {
		return arnCode;
	}
	public void setArnCode(String arnCode) {
		this.arnCode = arnCode;
	}
	public String getSubBrokerCode() {
		return subBrokerCode;
	}
	public void setSubBrokerCode(String subBrokerCode) {
		this.subBrokerCode = subBrokerCode;
	}
	public String getFolioNo() {
		return folioNo;
	}
	public void setFolioNo(String folioNo) {
		this.folioNo = folioNo;
	}
	public String getTitle1() {
		return title1;
	}
	public void setTitle1(String title1) {
		this.title1 = title1;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getGender1() {
		return gender1;
	}
	public void setGender1(String gender1) {
		this.gender1 = gender1;
	}
	public String getDob1() {
		return dob1;
	}
	public void setDob1(String dob1) {
		this.dob1 = dob1;
	}
	public String getPanNo1() {
		return panNo1;
	}
	public void setPanNo1(String panNo1) {
		this.panNo1 = panNo1;
	}
	public String getEmailId1() {
		return emailId1;
	}
	public void setEmailId1(String emailId1) {
		this.emailId1 = emailId1;
	}
	public String getMobileNo1() {
		return mobileNo1;
	}
	public void setMobileNo1(String mobileNo1) {
		this.mobileNo1 = mobileNo1;
	}
	public String getContactNoRes1() {
		return contactNoRes1;
	}
	public void setContactNoRes1(String contactNoRes1) {
		this.contactNoRes1 = contactNoRes1;
	}
	public String getContactNoOff1() {
		return contactNoOff1;
	}
	public void setContactNoOff1(String contactNoOff1) {
		this.contactNoOff1 = contactNoOff1;
	}
	public String getGuardianName1() {
		return guardianName1;
	}
	public void setGuardianName1(String guardianName1) {
		this.guardianName1 = guardianName1;
	}
	public String getGuardianRelation1() {
		return guardianRelation1;
	}
	public void setGuardianRelation1(String guardianRelation1) {
		this.guardianRelation1 = guardianRelation1;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getCity1() {
		return city1;
	}
	public void setCity1(String city1) {
		this.city1 = city1;
	}
	public String getState1() {
		return state1;
	}
	public void setState1(String state1) {
		this.state1 = state1;
	}
	public String getCountry1() {
		return country1;
	}
	public void setCountry1(String country1) {
		this.country1 = country1;
	}
	public String getZipCode1() {
		return zipCode1;
	}
	public void setZipCode1(String zipCode1) {
		this.zipCode1 = zipCode1;
	}
	public String getApplicationStatus1() {
		return applicationStatus1;
	}
	public void setApplicationStatus1(String applicationStatus1) {
		this.applicationStatus1 = applicationStatus1;
	}
	public String getModeOfHolding1() {
		return modeOfHolding1;
	}
	public void setModeOfHolding1(String modeOfHolding1) {
		this.modeOfHolding1 = modeOfHolding1;
	}
	public String getOccupation1() {
		return occupation1;
	}
	public void setOccupation1(String occupation1) {
		this.occupation1 = occupation1;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getPanNo2() {
		return panNo2;
	}
	public void setPanNo2(String panNo2) {
		this.panNo2 = panNo2;
	}
	public String getTitle3() {
		return title3;
	}
	public void setTitle3(String title3) {
		this.title3 = title3;
	}
	public String getName3() {
		return name3;
	}
	public void setName3(String name3) {
		this.name3 = name3;
	}
	public String getPanNo3() {
		return panNo3;
	}
	public void setPanNo3(String panNo3) {
		this.panNo3 = panNo3;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getBankAddress() {
		return bankAddress;
	}
	public void setBankAddress(String bankAddress) {
		this.bankAddress = bankAddress;
	}
	public String getBankCity() {
		return bankCity;
	}
	public void setBankCity(String bankCity) {
		this.bankCity = bankCity;
	}
	public String getBankAcType() {
		return bankAcType;
	}
	public void setBankAcType(String bankAcType) {
		this.bankAcType = bankAcType;
	}
	public String getBankAcNo() {
		return bankAcNo;
	}
	public void setBankAcNo(String bankAcNo) {
		this.bankAcNo = bankAcNo;
	}
	public String getBankMicrCode() {
		return bankMicrCode;
	}
	public void setBankMicrCode(String bankMicrCode) {
		this.bankMicrCode = bankMicrCode;
	}
	public String getBankIfscCode() {
		return bankIfscCode;
	}
	public void setBankIfscCode(String bankIfscCode) {
		this.bankIfscCode = bankIfscCode;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getSchemeName() {
		return schemeName;
	}
	public void setSchemeName(String schemeName) {
		this.schemeName = schemeName;
	}
	public String getSchemeOption() {
		return schemeOption;
	}
	public void setSchemeOption(String schemeOption) {
		this.schemeOption = schemeOption;
	}
	public String getSchemeType() {
		return schemeType;
	}
	public void setSchemeType(String schemeType) {
		this.schemeType = schemeType;
	}
	public String getInvestmentAmount() {
		return investmentAmount;
	}
	public void setInvestmentAmount(String investmentAmount) {
		this.investmentAmount = investmentAmount;
	}
	public String getNomineeName1() {
		return nomineeName1;
	}
	public void setNomineeName1(String nomineeName1) {
		this.nomineeName1 = nomineeName1;
	}
	public String getNomineeName2() {
		return nomineeName2;
	}
	public void setNomineeName2(String nomineeName2) {
		this.nomineeName2 = nomineeName2;
	}
	public String getNomineeName3() {
		return nomineeName3;
	}
	public void setNomineeName3(String nomineeName3) {
		this.nomineeName3 = nomineeName3;
	}
	public String getNomineeAddress1() {
		return nomineeAddress1;
	}
	public void setNomineeAddress1(String nomineeAddress1) {
		this.nomineeAddress1 = nomineeAddress1;
	}
	public String getNomineeAddress2() {
		return nomineeAddress2;
	}
	public void setNomineeAddress2(String nomineeAddress2) {
		this.nomineeAddress2 = nomineeAddress2;
	}
	public String getNomineeAddress3() {
		return nomineeAddress3;
	}
	public void setNomineeAddress3(String nomineeAddress3) {
		this.nomineeAddress3 = nomineeAddress3;
	}
	public String getNomineeDob1() {
		return nomineeDob1;
	}
	public void setNomineeDob1(String nomineeDob1) {
		this.nomineeDob1 = nomineeDob1;
	}
	public String getNomineeDob2() {
		return nomineeDob2;
	}
	public void setNomineeDob2(String nomineeDob2) {
		this.nomineeDob2 = nomineeDob2;
	}
	public String getNomineeDob3() {
		return nomineeDob3;
	}
	public void setNomineeDob3(String nomineeDob3) {
		this.nomineeDob3 = nomineeDob3;
	}
	public String getNomineeRelation1() {
		return nomineeRelation1;
	}
	public void setNomineeRelation1(String nomineeRelation1) {
		this.nomineeRelation1 = nomineeRelation1;
	}
	public String getNomineeRelation2() {
		return nomineeRelation2;
	}
	public void setNomineeRelation2(String nomineeRelation2) {
		this.nomineeRelation2 = nomineeRelation2;
	}
	public String getNomineeRelation3() {
		return nomineeRelation3;
	}
	public void setNomineeRelation3(String nomineeRelation3) {
		this.nomineeRelation3 = nomineeRelation3;
	}
	public String getNomineeGuardianName1() {
		return nomineeGuardianName1;
	}
	public void setNomineeGuardianName1(String nomineeGuardianName1) {
		this.nomineeGuardianName1 = nomineeGuardianName1;
	}
	public String getNomineeGuardianName2() {
		return nomineeGuardianName2;
	}
	public void setNomineeGuardianName2(String nomineeGuardianName2) {
		this.nomineeGuardianName2 = nomineeGuardianName2;
	}
	public String getNomineeGuardianName3() {
		return nomineeGuardianName3;
	}
	public void setNomineeGuardianName3(String nomineeGuardianName3) {
		this.nomineeGuardianName3 = nomineeGuardianName3;
	}
	public String getNomineeGuardianAddress1() {
		return nomineeGuardianAddress1;
	}
	public void setNomineeGuardianAddress1(String nomineeGuardianAddress1) {
		this.nomineeGuardianAddress1 = nomineeGuardianAddress1;
	}
	public String getNomineeGuardianAddress3() {
		return nomineeGuardianAddress3;
	}
	public void setNomineeGuardianAddress3(String nomineeGuardianAddress3) {
		this.nomineeGuardianAddress3 = nomineeGuardianAddress3;
	}
	
	public String getNomineeGuardianAddress2() {
		return nomineeGuardianAddress2;
	}
	public void setNomineeGuardianAddress2(String nomineeGuardianAddress2) {
		this.nomineeGuardianAddress2 = nomineeGuardianAddress2;
	}
	public String getBankState() {
		return bankState;
	}
	public void setBankState(String bankState) {
		this.bankState = bankState;
	}
	public List<String> getFolioNos() {
		return folioNos;
	}
	public void setFolioNos(List<String> folioNos) {
		this.folioNos = folioNos;
	}
	public Map<String, String> getProducts() {
		return products;
	}
	public void setProducts(Map<String, String> products) {
		this.products = products;
	}
	
	
	
	
	
	private String product;
	private String searchText;
	
	
	

	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}

	private Integer partnerId;
	private Integer clientId;

	public Integer getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}
	public Integer getClientId() {
		return clientId;
	}
	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	public int getSalutionId() {
		return salutionId;
	}
	public void setSalutionId(int salutionId) {
		this.salutionId = salutionId;
	}
	public int getRelationshipId() {
		return relationshipId;
	}
	public void setRelationshipId(int relationshipId) {
		this.relationshipId = relationshipId;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
	
	
}



