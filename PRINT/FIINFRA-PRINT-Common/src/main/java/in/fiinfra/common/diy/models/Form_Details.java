package in.fiinfra.common.diy.models;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Form_Details {

	@JsonProperty
	private Integer FPExecutionID;
	@JsonProperty
	private String AccountFolioNo;
	@JsonProperty
	private String AccountPolicyNo;
	@JsonProperty
	private String AccountClientID;
	@JsonProperty
	private String FirstHolderTitle;
	@JsonProperty
	private String FirstHolderName;
	@JsonProperty
	private String FirstHolderPAN;
	@JsonProperty
	private String FirstHolderDOB;
	@JsonProperty
	private String SecondHolderName;
	@JsonProperty
	private String SecondHolderPAN;
	@JsonProperty
	private String SecondHolderDOB;
	@JsonProperty
	private String ThirdHolderName;
	@JsonProperty
	private String ThirdHolderPAN;
	@JsonProperty
	private String ThirdHolderDOB;
	@JsonProperty
	private String Nominee1Name;
	@JsonProperty
	private String Nominee1Address;
	@JsonProperty
	private String Nominee1DOB;
	@JsonProperty
	private Integer Nominee1Allocation;
	@JsonProperty
	private String Nominee2Name;
	@JsonProperty
	private String Nominee2Address;
	@JsonProperty
	private String Nominee2DOB;
	@JsonProperty
	private Integer Nominee2Allocation;
	@JsonProperty
	private String Nominee3Name;
	@JsonProperty
	private String Nominee3Address;
	@JsonProperty
	private String Nominee3DOB;
	@JsonProperty
	private Integer Nominee3Allocation;
	@JsonProperty
	private String GuardianName;
	@JsonProperty
	private String GuardianAddress;
	@JsonProperty
	private String GuardianDOB;
	@JsonProperty
	private Integer InvestorStatusID;
	@JsonProperty
	private Integer OccupationID;
	@JsonProperty
	private Integer ModeOfHoldingID;
	@JsonProperty
	private String Scheme_Name;
	@JsonProperty
	private String Scheme_Type;
	@JsonProperty
	private String Scheme_Option;
	@JsonProperty
	private String EmailID;
	@JsonProperty
	private String MobileNo;
	@JsonProperty
	private Integer PreprintedFormDocumentID;
	@JsonProperty
	private Integer PreprintedFormDocumentID2;
	@JsonProperty
	private Integer PreprintedFormDocumentID3;
	@JsonProperty
	private Integer CreatedBy;
	@JsonProperty
	private String CreatedDate;
	@JsonProperty
	private Integer LastModifiedBy;
	@JsonProperty
	private String LastModifiedDate;
	@JsonProperty
	private String FirstHolderContactNoRes;
	@JsonProperty
	private String FirstHolderContactNoOff;
	@JsonProperty
	private String Nominee1GuardianName;
	@JsonProperty
	private String Nominee1GuardianAddress;
	@JsonProperty
	private String Nominee2GuardianName;
	@JsonProperty
	private String Nominee2GuardianAddress;
	@JsonProperty
	private String Nominee3GuardianName;
	@JsonProperty
	private String Nominee3GuardianAddress;
	@JsonProperty
	private String GuardianRelationship;
	@JsonProperty
	private String BrokerCode;
	@JsonProperty
	private String SubBrokerCode;
	@JsonProperty
	private String SecondHolderTitle;
	@JsonProperty
	private String Nominee1Relationship;
	@JsonProperty
	private String Nominee2Relationship;
	@JsonProperty
	private String Nominee3Relationship;
	@JsonProperty
	private Integer ProductId;
	@JsonProperty
	private Double InvestmentAmount;
	@JsonProperty
	private String ThirdHolderTitle;
	@JsonProperty
	private String FirstHolderGender;
	@JsonProperty
	private Integer TransactionTypeId;
	@JsonProperty
	private Integer InvestmentTypeId;
	@JsonProperty
	private String BankAccountName;
	@JsonProperty
	private String BankAccountNumber;
	@JsonProperty
	private Integer BankAccountTypeId;
	@JsonProperty
	private String BankName;
	@JsonProperty
	private String BankIFSCNo;
	@JsonProperty
	private String BankMICRNo;
	@JsonProperty
	private String BankBranchName;
	@JsonProperty
	private String BankBranchAddress;
	@JsonProperty
	private String BankBranchState;
	@JsonProperty
	private String BankBranchCity;
	@JsonProperty
	private String Address;
	@JsonProperty
	private String State;
	@JsonProperty
	private String City;

	public String GetValue(String FieldName) {

		

		if (FieldName.equalsIgnoreCase("FPExecutionID")) {
			
			
			
			return getFPExecutionID().toString();
		} else if (FieldName.equalsIgnoreCase("AccountFolioNo")) {
			return getAccountFolioNo().toString();
		} else if (FieldName.equalsIgnoreCase("AccountPolicyNo")) {
			return getAccountPolicyNo().toString();
		} else if (FieldName.equalsIgnoreCase("AccountClientID")) {
			return getAccountClientID().toString();
		} else if (FieldName.equalsIgnoreCase("FirstHolderTitle")) {
			return getFirstHolderTitle().toString();
		} else if (FieldName.equalsIgnoreCase("FirstHolderName")) {
			return getFirstHolderName().toString();
		} else if (FieldName.equalsIgnoreCase("FirstHolderPAN")) {
			return getFirstHolderPAN().toString();
		} else if (FieldName.equalsIgnoreCase("FirstHolderDOB")) {
			return getFirstHolderDOB().toString();
		} else if (FieldName.equalsIgnoreCase("SecondHolderName")) {
			return getSecondHolderName().toString();
		} else if (FieldName.equalsIgnoreCase("SecondHolderPAN")) {
			return getSecondHolderPAN().toString();
		} else if (FieldName.equalsIgnoreCase("SecondHolderDOB")) {
			return getSecondHolderDOB().toString();
		} else if (FieldName.equalsIgnoreCase("ThirdHolderName")) {
			return getThirdHolderName().toString();
		} else if (FieldName.equalsIgnoreCase("ThirdHolderPAN")) {
			return getThirdHolderPAN().toString();
		} else if (FieldName.equalsIgnoreCase("ThirdHolderDOB")) {
			return getThirdHolderDOB().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee1Name")) {
			return getNominee1Name().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee1Address")) {
			return getNominee1Address().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee1DOB")) {
			return getNominee1DOB().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee1Allocation")) {
			return getNominee1Allocation().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee2Name")) {
			return getNominee2Name().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee2Address")) {
			return getNominee2Address().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee2DOB")) {
			return getNominee2DOB().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee2Allocation")) {
			return getNominee2Allocation().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee3Name")) {
			return getNominee3Name().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee3Address")) {
			return getNominee3Address().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee3DOB")) {
			return getNominee3DOB().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee3Allocation")) {
			return getNominee3Allocation().toString();
		} else if (FieldName.equalsIgnoreCase("GuardianName")) {
			return getGuardianName().toString();
		} else if (FieldName.equalsIgnoreCase("GuardianAddress")) {
			return getGuardianAddress().toString();
		} else if (FieldName.equalsIgnoreCase("GuardianDOB")) {
			return getGuardianDOB().toString();
		} else if (FieldName.equalsIgnoreCase("InvestorStatusID")) {
			return getInvestorStatusID().toString();
		} else if (FieldName.equalsIgnoreCase("OccupationID")) {
			return getOccupationID().toString();
		} else if (FieldName.equalsIgnoreCase("ModeOfHoldingID")) {
			return getModeOfHoldingID().toString();
		} else if (FieldName.equalsIgnoreCase("Scheme Name")) {
			return getScheme_Name().toString();
		} else if (FieldName.equalsIgnoreCase("Scheme Type")) {
			return getScheme_Type().toString();
		} else if (FieldName.equalsIgnoreCase("Scheme Option")) {
			return getScheme_Option().toString();
		} else if (FieldName.equalsIgnoreCase("EmailID")) {
			return getEmailID().toString();
		} else if (FieldName.equalsIgnoreCase("MobileNo")) {
			return getMobileNo().toString();
		} else if (FieldName.equalsIgnoreCase("PreprintedFormDocumentID")) {
			return getPreprintedFormDocumentID().toString();
		} else if (FieldName.equalsIgnoreCase("PreprintedFormDocumentID2")) {
			return getPreprintedFormDocumentID2().toString();
		} else if (FieldName.equalsIgnoreCase("PreprintedFormDocumentID3")) {
			return getPreprintedFormDocumentID3().toString();
		} else if (FieldName.equalsIgnoreCase("CreatedBy")) {
			return getCreatedBy().toString();
		} else if (FieldName.equalsIgnoreCase("CreatedDate")) {
			return getCreatedDate().toString();
		} else if (FieldName.equalsIgnoreCase("LastModifiedBy")) {
			return getLastModifiedBy().toString();
		} else if (FieldName.equalsIgnoreCase("LastModifiedDate")) {
			return getLastModifiedDate().toString();
		} else if (FieldName.equalsIgnoreCase("FirstHolderContactNoRes")) {
			return getFirstHolderContactNoRes().toString();
		} else if (FieldName.equalsIgnoreCase("FirstHolderContactNoOff")) {
			return getFirstHolderContactNoOff().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee1GuardianName")) {
			return getNominee1GuardianName().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee1GuardianAddress")) {
			return getNominee1GuardianAddress().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee2GuardianName")) {
			return getNominee2GuardianName().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee2GuardianAddress")) {
			return getNominee2GuardianAddress().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee3GuardianName")) {
			return getNominee3GuardianName().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee3GuardianAddress")) {
			return getNominee3GuardianAddress().toString();
		} else if (FieldName.equalsIgnoreCase("GuardianRelationship")) {
			return getGuardianRelationship().toString();
		} else if (FieldName.equalsIgnoreCase("BrokerCode")) {
			return getBrokerCode().toString();
		} else if (FieldName.equalsIgnoreCase("SubBrokerCode")) {
			return getSubBrokerCode().toString();
		} else if (FieldName.equalsIgnoreCase("SecondHolderTitle")) {
			return getSecondHolderTitle().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee1Relationship")) {
			return getNominee1Relationship().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee2Relationship")) {
			return getNominee2Relationship().toString();
		} else if (FieldName.equalsIgnoreCase("Nominee3Relationship")) {
			return getNominee3Relationship().toString();
		} else if (FieldName.equalsIgnoreCase("ProductId")) {
			return getProductId().toString();
		} else if (FieldName.equalsIgnoreCase("InvestmentAmount")) {
			return getInvestmentAmount().toString();
		} else if (FieldName.equalsIgnoreCase("ThirdHolderTitle")) {
			return getThirdHolderTitle().toString();
		} else if (FieldName.equalsIgnoreCase("FirstHolderGender")) {
			return getFirstHolderGender().toString();
		} else if (FieldName.equalsIgnoreCase("TransactionTypeId")) {
			return getTransactionTypeId().toString();
		} else if (FieldName.equalsIgnoreCase("InvestmentTypeId")) {
			return getInvestmentTypeId().toString();
		} else if (FieldName.equalsIgnoreCase("BankAccountName")) {
			return getBankAccountName().toString();
		} else if (FieldName.equalsIgnoreCase("BankAccountNumber")) {
			return getBankAccountNumber().toString();
		} else if (FieldName.equalsIgnoreCase("BankAccountTypeId")) {
			return getBankAccountTypeId().toString();
		} else if (FieldName.equalsIgnoreCase("BankName")) {
			return getBankName().toString();
		} else if (FieldName.equalsIgnoreCase("BankIFSCNo")) {
			return getBankIFSCNo().toString();
		} else if (FieldName.equalsIgnoreCase("BankMICRNo")) {
			return getBankMICRNo().toString();
		} else if (FieldName.equalsIgnoreCase("BankBranchName")) {
			return getBankBranchName().toString();
		} else if (FieldName.equalsIgnoreCase("BankBranchAddress")) {
			return getBankBranchAddress().toString();
		} else if (FieldName.equalsIgnoreCase("BankBranchState")) {
			return getBankBranchState().toString();
		} else if (FieldName.equalsIgnoreCase("BankBranchCity")) {
			return getBankBranchCity().toString();
		} else if (FieldName.equalsIgnoreCase("Address")) {
			return getAddress().toString();
		} else if (FieldName.equalsIgnoreCase("State")) {
			return getState().toString();
		} else if (FieldName.equalsIgnoreCase("City")) {
			return getCity().toString();
		}

		return "";

	}

	@JsonProperty
	private String Country;
	@JsonProperty
	private String PostalCode;

	public Integer getFPExecutionID() {
		return FPExecutionID;
	}

	public void setFPExecutionID(Integer fPExecutionID) {
		FPExecutionID = fPExecutionID;
	}

	public String getAccountFolioNo() {
		return AccountFolioNo;
	}

	public void setAccountFolioNo(String accountFolioNo) {
		AccountFolioNo = accountFolioNo;
	}

	public String getAccountPolicyNo() {
		return AccountPolicyNo;
	}

	public void setAccountPolicyNo(String accountPolicyNo) {
		AccountPolicyNo = accountPolicyNo;
	}

	public String getAccountClientID() {
		return AccountClientID;
	}

	public void setAccountClientID(String accountClientID) {
		AccountClientID = accountClientID;
	}

	public String getFirstHolderTitle() {
		return FirstHolderTitle;
	}

	public void setFirstHolderTitle(String firstHolderTitle) {
		FirstHolderTitle = firstHolderTitle;
	}

	public String getFirstHolderName() {
		return FirstHolderName;
	}

	public void setFirstHolderName(String firstHolderName) {
		FirstHolderName = firstHolderName;
	}

	public String getFirstHolderPAN() {
		return FirstHolderPAN;
	}

	public void setFirstHolderPAN(String firstHolderPAN) {
		FirstHolderPAN = firstHolderPAN;
	}

	public String getFirstHolderDOB() {
		return FirstHolderDOB;
	}

	public void setFirstHolderDOB(String firstHolderDOB) {
		FirstHolderDOB = firstHolderDOB;
	}

	public String getSecondHolderName() {
		return SecondHolderName;
	}

	public void setSecondHolderName(String secondHolderName) {
		SecondHolderName = secondHolderName;
	}

	public String getSecondHolderPAN() {
		return SecondHolderPAN;
	}

	public void setSecondHolderPAN(String secondHolderPAN) {
		SecondHolderPAN = secondHolderPAN;
	}

	public String getSecondHolderDOB() {
		return SecondHolderDOB;
	}

	public void setSecondHolderDOB(String secondHolderDOB) {
		SecondHolderDOB = secondHolderDOB;
	}

	public String getThirdHolderName() {
		return ThirdHolderName;
	}

	public void setThirdHolderName(String thirdHolderName) {
		ThirdHolderName = thirdHolderName;
	}

	public String getThirdHolderPAN() {
		return ThirdHolderPAN;
	}

	public void setThirdHolderPAN(String thirdHolderPAN) {
		ThirdHolderPAN = thirdHolderPAN;
	}

	public String getThirdHolderDOB() {
		return ThirdHolderDOB;
	}

	public void setThirdHolderDOB(String thirdHolderDOB) {
		ThirdHolderDOB = thirdHolderDOB;
	}

	public String getNominee1Name() {
		return Nominee1Name;
	}

	public void setNominee1Name(String nominee1Name) {
		Nominee1Name = nominee1Name;
	}

	public String getNominee1Address() {
		return Nominee1Address;
	}

	public void setNominee1Address(String nominee1Address) {
		Nominee1Address = nominee1Address;
	}

	public String getNominee1DOB() {
		return Nominee1DOB;
	}

	public void setNominee1DOB(String nominee1dob) {
		Nominee1DOB = nominee1dob;
	}

	public Integer getNominee1Allocation() {
		return Nominee1Allocation;
	}

	public void setNominee1Allocation(Integer nominee1Allocation) {
		Nominee1Allocation = nominee1Allocation;
	}

	public String getNominee2Name() {
		return Nominee2Name;
	}

	public void setNominee2Name(String nominee2Name) {
		Nominee2Name = nominee2Name;
	}

	public String getNominee2Address() {
		return Nominee2Address;
	}

	public void setNominee2Address(String nominee2Address) {
		Nominee2Address = nominee2Address;
	}

	public String getNominee2DOB() {
		return Nominee2DOB;
	}

	public void setNominee2DOB(String nominee2dob) {
		Nominee2DOB = nominee2dob;
	}

	public Integer getNominee2Allocation() {
		return Nominee2Allocation;
	}

	public void setNominee2Allocation(Integer nominee2Allocation) {
		Nominee2Allocation = nominee2Allocation;
	}

	public String getNominee3Name() {
		return Nominee3Name;
	}

	public void setNominee3Name(String nominee3Name) {
		Nominee3Name = nominee3Name;
	}

	public String getNominee3Address() {
		return Nominee3Address;
	}

	public void setNominee3Address(String nominee3Address) {
		Nominee3Address = nominee3Address;
	}

	public String getNominee3DOB() {
		return Nominee3DOB;
	}

	public void setNominee3DOB(String nominee3dob) {
		Nominee3DOB = nominee3dob;
	}

	public Integer getNominee3Allocation() {
		return Nominee3Allocation;
	}

	public void setNominee3Allocation(Integer nominee3Allocation) {
		Nominee3Allocation = nominee3Allocation;
	}

	public String getGuardianName() {
		return GuardianName;
	}

	public void setGuardianName(String guardianName) {
		GuardianName = guardianName;
	}

	public String getGuardianAddress() {
		return GuardianAddress;
	}

	public void setGuardianAddress(String guardianAddress) {
		GuardianAddress = guardianAddress;
	}

	public String getGuardianDOB() {
		return GuardianDOB;
	}

	public void setGuardianDOB(String guardianDOB) {
		GuardianDOB = guardianDOB;
	}

	public Integer getInvestorStatusID() {
		return InvestorStatusID;
	}

	public void setInvestorStatusID(Integer investorStatusID) {
		InvestorStatusID = investorStatusID;
	}

	public Integer getOccupationID() {
		return OccupationID;
	}

	public void setOccupationID(Integer occupationID) {
		OccupationID = occupationID;
	}

	public Integer getModeOfHoldingID() {
		return ModeOfHoldingID;
	}

	public void setModeOfHoldingID(Integer modeOfHoldingID) {
		ModeOfHoldingID = modeOfHoldingID;
	}

	public String getScheme_Name() {
		return Scheme_Name;
	}

	public void setScheme_Name(String scheme_Name) {
		Scheme_Name = scheme_Name;
	}

	public String getScheme_Type() {
		return Scheme_Type;
	}

	public void setScheme_Type(String scheme_Type) {
		Scheme_Type = scheme_Type;
	}

	public String getScheme_Option() {
		return Scheme_Option;
	}

	public void setScheme_Option(String scheme_Option) {
		Scheme_Option = scheme_Option;
	}

	public String getEmailID() {
		return EmailID;
	}

	public void setEmailID(String emailID) {
		EmailID = emailID;
	}

	public String getMobileNo() {
		return MobileNo;
	}

	public void setMobileNo(String mobileNo) {
		MobileNo = mobileNo;
	}

	public Integer getPreprintedFormDocumentID() {
		return PreprintedFormDocumentID;
	}

	public void setPreprintedFormDocumentID(Integer preprintedFormDocumentID) {
		PreprintedFormDocumentID = preprintedFormDocumentID;
	}

	public Integer getPreprintedFormDocumentID2() {
		return PreprintedFormDocumentID2;
	}

	public void setPreprintedFormDocumentID2(Integer preprintedFormDocumentID2) {
		PreprintedFormDocumentID2 = preprintedFormDocumentID2;
	}

	public Integer getPreprintedFormDocumentID3() {
		return PreprintedFormDocumentID3;
	}

	public void setPreprintedFormDocumentID3(Integer preprintedFormDocumentID3) {
		PreprintedFormDocumentID3 = preprintedFormDocumentID3;
	}

	public Integer getCreatedBy() {
		return CreatedBy;
	}

	public void setCreatedBy(Integer createdBy) {
		CreatedBy = createdBy;
	}

	public String getCreatedDate() {
		return CreatedDate;
	}

	public void setCreatedDate(String createdDate) {
		CreatedDate = createdDate;
	}

	public Integer getLastModifiedBy() {
		return LastModifiedBy;
	}

	public void setLastModifiedBy(Integer lastModifiedBy) {
		LastModifiedBy = lastModifiedBy;
	}

	public String getLastModifiedDate() {
		return LastModifiedDate;
	}

	public void setLastModifiedDate(String lastModifiedDate) {
		LastModifiedDate = lastModifiedDate;
	}

	public String getFirstHolderContactNoRes() {
		return FirstHolderContactNoRes;
	}

	public void setFirstHolderContactNoRes(String firstHolderContactNoRes) {
		FirstHolderContactNoRes = firstHolderContactNoRes;
	}

	public String getFirstHolderContactNoOff() {
		return FirstHolderContactNoOff;
	}

	public void setFirstHolderContactNoOff(String firstHolderContactNoOff) {
		FirstHolderContactNoOff = firstHolderContactNoOff;
	}

	public String getNominee1GuardianName() {
		return Nominee1GuardianName;
	}

	public void setNominee1GuardianName(String nominee1GuardianName) {
		Nominee1GuardianName = nominee1GuardianName;
	}

	public String getNominee1GuardianAddress() {
		return Nominee1GuardianAddress;
	}

	public void setNominee1GuardianAddress(String nominee1GuardianAddress) {
		Nominee1GuardianAddress = nominee1GuardianAddress;
	}

	public String getNominee2GuardianName() {
		return Nominee2GuardianName;
	}

	public void setNominee2GuardianName(String nominee2GuardianName) {
		Nominee2GuardianName = nominee2GuardianName;
	}

	public String getNominee2GuardianAddress() {
		return Nominee2GuardianAddress;
	}

	public void setNominee2GuardianAddress(String nominee2GuardianAddress) {
		Nominee2GuardianAddress = nominee2GuardianAddress;
	}

	public String getNominee3GuardianName() {
		return Nominee3GuardianName;
	}

	public void setNominee3GuardianName(String nominee3GuardianName) {
		Nominee3GuardianName = nominee3GuardianName;
	}

	public String getNominee3GuardianAddress() {
		return Nominee3GuardianAddress;
	}

	public void setNominee3GuardianAddress(String nominee3GuardianAddress) {
		Nominee3GuardianAddress = nominee3GuardianAddress;
	}

	public String getGuardianRelationship() {
		return GuardianRelationship;
	}

	public void setGuardianRelationship(String guardianRelationship) {
		GuardianRelationship = guardianRelationship;
	}

	public String getBrokerCode() {
		return BrokerCode;
	}

	public void setBrokerCode(String brokerCode) {
		BrokerCode = brokerCode;
	}

	public String getSubBrokerCode() {
		return SubBrokerCode;
	}

	public void setSubBrokerCode(String subBrokerCode) {
		SubBrokerCode = subBrokerCode;
	}

	public String getSecondHolderTitle() {
		return SecondHolderTitle;
	}

	public void setSecondHolderTitle(String secondHolderTitle) {
		SecondHolderTitle = secondHolderTitle;
	}

	public String getNominee1Relationship() {
		return Nominee1Relationship;
	}

	public void setNominee1Relationship(String nominee1Relationship) {
		Nominee1Relationship = nominee1Relationship;
	}

	public String getNominee2Relationship() {
		return Nominee2Relationship;
	}

	public void setNominee2Relationship(String nominee2Relationship) {
		Nominee2Relationship = nominee2Relationship;
	}

	public String getNominee3Relationship() {
		return Nominee3Relationship;
	}

	public void setNominee3Relationship(String nominee3Relationship) {
		Nominee3Relationship = nominee3Relationship;
	}

	public Integer getProductId() {
		return ProductId;
	}

	public void setProductId(Integer productId) {
		ProductId = productId;
	}

	public Double getInvestmentAmount() {
		return InvestmentAmount;
	}

	public void setInvestmentAmount(Double investmentAmount) {
		InvestmentAmount = investmentAmount;
	}

	public String getThirdHolderTitle() {
		return ThirdHolderTitle;
	}

	public void setThirdHolderTitle(String thirdHolderTitle) {
		ThirdHolderTitle = thirdHolderTitle;
	}

	public String getFirstHolderGender() {
		return FirstHolderGender;
	}

	public void setFirstHolderGender(String firstHolderGender) {
		FirstHolderGender = firstHolderGender;
	}

	public Integer getTransactionTypeId() {
		return TransactionTypeId;
	}

	public void setTransactionTypeId(Integer transactionTypeId) {
		TransactionTypeId = transactionTypeId;
	}

	public Integer getInvestmentTypeId() {
		return InvestmentTypeId;
	}

	public void setInvestmentTypeId(Integer investmentTypeId) {
		InvestmentTypeId = investmentTypeId;
	}

	public String getBankAccountName() {
		return BankAccountName;
	}

	public void setBankAccountName(String bankAccountName) {
		BankAccountName = bankAccountName;
	}

	public String getBankAccountNumber() {
		return BankAccountNumber;
	}

	public void setBankAccountNumber(String bankAccountNumber) {
		BankAccountNumber = bankAccountNumber;
	}

	public Integer getBankAccountTypeId() {
		return BankAccountTypeId;
	}

	public void setBankAccountTypeId(Integer bankAccountTypeId) {
		BankAccountTypeId = bankAccountTypeId;
	}

	public String getBankName() {
		return BankName;
	}

	public void setBankName(String bankName) {
		BankName = bankName;
	}

	public String getBankIFSCNo() {
		return BankIFSCNo;
	}

	public void setBankIFSCNo(String bankIFSCNo) {
		BankIFSCNo = bankIFSCNo;
	}

	public String getBankMICRNo() {
		return BankMICRNo;
	}

	public void setBankMICRNo(String bankMICRNo) {
		BankMICRNo = bankMICRNo;
	}

	public String getBankBranchName() {
		return BankBranchName;
	}

	public void setBankBranchName(String bankBranchName) {
		BankBranchName = bankBranchName;
	}

	public String getBankBranchAddress() {
		return BankBranchAddress;
	}

	public void setBankBranchAddress(String bankBranchAddress) {
		BankBranchAddress = bankBranchAddress;
	}

	public String getBankBranchState() {
		return BankBranchState;
	}

	public void setBankBranchState(String bankBranchState) {
		BankBranchState = bankBranchState;
	}

	public String getBankBranchCity() {
		return BankBranchCity;
	}

	public void setBankBranchCity(String bankBranchCity) {
		BankBranchCity = bankBranchCity;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getPostalCode() {
		return PostalCode;
	}

	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	
	
	@SuppressWarnings("deprecation")
	public static String getStrDate(String date) {
		  
		String lasmod="";
		
		if (date.contains("-")) {
			
			Date lms = new Date(date);
		 lasmod = new SimpleDateFormat("dd-MM-yyyy ").format(lms);
			
		}
		
		if (date.contains("/")) {
			
			Date lms = new Date(date);
		 lasmod = new SimpleDateFormat("dd/MM/yyyy ").format(lms);
			
			
		}
		
		return lasmod;
		
		}
	

}
