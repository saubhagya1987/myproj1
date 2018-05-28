package in.fiinfra.common.common;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.web.multipart.MultipartFile;
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class ProfileData {
	private String firstName;
	private String lastName;
	private String userName;
	private int securityQuestionId;
	private String securityAnswer;
	private int salutationId;
	private String companyName;
	private String panNo;
	private String contactEmail;
	private String contactMobile;
	private String alternetcontact;
	private String contactHome;
	private String dob;
	private String websiteUrl;
	private String arn;
	private String emailCommunicationName;
	private String emailCommunicationId;
	private List<AddressData> addressDataList;
	private String bankName;
	private String branchname;
	private String city;
	private int accounttype;
	private String accountNo;
	private String micrCode;
	private String ifscCode;
	private int isEmailActivated;
	private String emailActivationDate;
	private String serviceEmailId;
	private String serviceEmailIdLastAccessedDate;
	private int isSmsActivated;
	private String smsActivationDate;
	private int isWebsiteActivated;
	private String websiteActivationDate;
	private String websiteLastAccessedDate;
	private int isBackOfficeActivated;
	private String backOfficeActivationDate;
	private String backOfficeLastAccessedDate;
	private List<CodeValueData> assetClassList;
	private List<PartyAttributeData> productOfferingList;
	private List<PartyAttributeData> InterestedFpList;
	private String autoPlanEnabled;
	private String fbLink;
	private String twitterLink;
	
	
	
	public String getAlternetcontact() {
		return alternetcontact;
	}
	public void setAlternetcontact(String alternetcontact) {
		this.alternetcontact = alternetcontact;
	}
	public List<PartyAttributeData> getInterestedFpList() {
		return InterestedFpList;
	}
	public void setInterestedFpList(List<PartyAttributeData> interestedFpList) {
		InterestedFpList = interestedFpList;
	}
	private String interestedFpXML;
	
	public String getInterestedFpXML() {
		return interestedFpXML;
	}
	public void setInterestedFpXML(String interestedFpXML) {
		this.interestedFpXML = interestedFpXML;
	}
	private String heirarchyXML;
	public String getHeirarchyXML() {
		return heirarchyXML;
	}
	public void setHeirarchyXML(String heirarchyXML) {
		this.heirarchyXML = heirarchyXML;
	}
	private String emailSignature;
	private String disclaimer;
	private String dnd;
	private String smsSignature;
	private int theme;
	private String photo;
	private String logo;
	private List<TeamMemberData> teamMemberDataList;
	private List<PartyAttributeData> manufacturerList;
	private int partyId;
	private int buId;
	private String sectionName;
	private int lastModifiedBy;
	private String password;
	@JsonIgnore
	private MultipartFile image;
	private DocumentData documentData;
	private boolean isAttachment;
	private int attachmentCount;
	private String productXml;
	private String location;
	private String euin;
	private List<DocumentData> documentDataList;
	
	private String camsPassword;
	private String karvyPassword;
	private String sundaramPassword;
	
	
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getSecurityQuestionId() {
		return securityQuestionId;
	}
	public void setSecurityQuestionId(int securityQuestionId) {
		this.securityQuestionId = securityQuestionId;
	}
	public String getSecurityAnswer() {
		return securityAnswer;
	}
	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}
	public int getSalutationId() {
		return salutationId;
	}
	public void setSalutationId(int salutationId) {
		this.salutationId = salutationId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getContactMobile() {
		return contactMobile;
	}
	public void setContactMobile(String contactMobile) {
		this.contactMobile = contactMobile;
	}
	public String getContactHome() {
		return contactHome;
	}
	public void setContactHome(String contactHome) {
		this.contactHome = contactHome;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getWebsiteUrl() {
		return websiteUrl;
	}
	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}
	public String getArn() {
		return arn;
	}
	public void setArn(String arn) {
		this.arn = arn;
	}
	public String getEmailCommunicationName() {
		return emailCommunicationName;
	}
	public void setEmailCommunicationName(String emailCommunicationName) {
		this.emailCommunicationName = emailCommunicationName;
	}
	public List<AddressData> getAddressDataList() {
		return addressDataList;
	}
	public void setAddressDataList(List<AddressData> addressDataList) {
		this.addressDataList = addressDataList;
	}
	public String getEmailCommunicationId() {
		return emailCommunicationId;
	}
	public void setEmailCommunicationId(String emailCommunicationId) {
		this.emailCommunicationId = emailCommunicationId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getAccounttype() {
		return accounttype;
	}
	public void setAccounttype(int accounttype) {
		this.accounttype = accounttype;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getMicrCode() {
		return micrCode;
	}
	public void setMicrCode(String micrCode) {
		this.micrCode = micrCode;
	}
	public String getIfscCode() {
		return ifscCode;
	}
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	public int getIsEmailActivated() {
		return isEmailActivated;
	}
	public void setIsEmailActivated(int isEmailActivated) {
		this.isEmailActivated = isEmailActivated;
	}
	public String getEmailActivationDate() {
		return emailActivationDate;
	}
	public void setEmailActivationDate(String emailActivationDate) {
		this.emailActivationDate = emailActivationDate;
	}
	public String getServiceEmailId() {
		return serviceEmailId;
	}
	public void setServiceEmailId(String serviceEmailId) {
		this.serviceEmailId = serviceEmailId;
	}
	public String getServiceEmailIdLastAccessedDate() {
		return serviceEmailIdLastAccessedDate;
	}
	public void setServiceEmailIdLastAccessedDate(
			String serviceEmailIdLastAccessedDate) {
		this.serviceEmailIdLastAccessedDate = serviceEmailIdLastAccessedDate;
	}
	public int getIsSmsActivated() {
		return isSmsActivated;
	}
	public void setIsSmsActivated(int isSmsActivated) {
		this.isSmsActivated = isSmsActivated;
	}
	public String getSmsActivationDate() {
		return smsActivationDate;
	}
	public void setSmsActivationDate(String smsActivationDate) {
		this.smsActivationDate = smsActivationDate;
	}
	public int getIsWebsiteActivated() {
		return isWebsiteActivated;
	}
	public void setIsWebsiteActivated(int isWebsiteActivated) {
		this.isWebsiteActivated = isWebsiteActivated;
	}
	public String getWebsiteActivationDate() {
		return websiteActivationDate;
	}
	public void setWebsiteActivationDate(String websiteActivationDate) {
		this.websiteActivationDate = websiteActivationDate;
	}
	public String getWebsiteLastAccessedDate() {
		return websiteLastAccessedDate;
	}
	public void setWebsiteLastAccessedDate(String websiteLastAccessedDate) {
		this.websiteLastAccessedDate = websiteLastAccessedDate;
	}
	public int getIsBackOfficeActivated() {
		return isBackOfficeActivated;
	}
	public void setIsBackOfficeActivated(int isBackOfficeActivated) {
		this.isBackOfficeActivated = isBackOfficeActivated;
	}
	public String getBackOfficeActivationDate() {
		return backOfficeActivationDate;
	}
	public void setBackOfficeActivationDate(String backOfficeActivationDate) {
		this.backOfficeActivationDate = backOfficeActivationDate;
	}
	public String getBackOfficeLastAccessedDate() {
		return backOfficeLastAccessedDate;
	}
	public void setBackOfficeLastAccessedDate(String backOfficeLastAccessedDate) {
		this.backOfficeLastAccessedDate = backOfficeLastAccessedDate;
	}
	public List<CodeValueData> getAssetClassList() {
		return assetClassList;
	}
	public void setAssetClassList(List<CodeValueData> assetClassList) {
		this.assetClassList = assetClassList;
	}
	public List<PartyAttributeData> getProductOfferingList() {
		return productOfferingList;
	}
	public void setProductOfferingList(List<PartyAttributeData> productOfferingList) {
		this.productOfferingList = productOfferingList;
	}
	public String getEmailSignature() {
		return emailSignature;
	}
	public void setEmailSignature(String emailSignature) {
		this.emailSignature = emailSignature;
	}
	public String getDisclaimer() {
		return disclaimer;
	}
	public void setDisclaimer(String disclaimer) {
		this.disclaimer = disclaimer;
	}
	public String getDnd() {
		return dnd;
	}
	public void setDnd(String dnd) {
		this.dnd = dnd;
	}
	public String getSmsSignature() {
		return smsSignature;
	}
	public void setSmsSignature(String smsSignature) {
		this.smsSignature = smsSignature;
	}
	public int getTheme() {
		return theme;
	}
	public void setTheme(int theme) {
		this.theme = theme;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public List<TeamMemberData> getTeamMemberDataList() {
		return teamMemberDataList;
	}
	public void setTeamMemberDataList(List<TeamMemberData> teamMemberDataList) {
		this.teamMemberDataList = teamMemberDataList;
	}
	public List<PartyAttributeData> getManufacturerList() {
		return manufacturerList;
	}
	public void setManufacturerList(List<PartyAttributeData> manufacturerList) {
		this.manufacturerList = manufacturerList;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public int getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@JsonIgnore
	public MultipartFile getImage() {
		return image;
	}
	@JsonIgnore
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public DocumentData getDocumentData() {
		return documentData;
	}
	public void setDocumentData(DocumentData documentData) {
		this.documentData = documentData;
	}
	public boolean isAttachment() {
		return isAttachment;
	}
	public void setAttachment(boolean isAttachment) {
		this.isAttachment = isAttachment;
	}
	public int getAttachmentCount() {
		return attachmentCount;
	}
	public void setAttachmentCount(int attachmentCount) {
		this.attachmentCount = attachmentCount;
	}
	public String getProductXml() {
		return productXml;
	}
	public void setProductXml(String productXml) {
		this.productXml = productXml;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getEuin() {
		return euin;
	}
	public void setEuin(String euin) {
		this.euin = euin;
	}
	public List<DocumentData> getDocumentDataList() {
		return documentDataList;
	}
	public void setDocumentDataList(List<DocumentData> documentDataList) {
		this.documentDataList = documentDataList;
	}
	public String getAutoPlanEnabled() {
		return autoPlanEnabled;
	}
	public void setAutoPlanEnabled(String autoPlanEnabled) {
		this.autoPlanEnabled = autoPlanEnabled;
	}
	public String getCamsPassword() {
		return camsPassword;
	}
	public void setCamsPassword(String camsPassword) {
		this.camsPassword = camsPassword;
	}
	public String getKarvyPassword() {
		return karvyPassword;
	}
	public void setKarvyPassword(String karvyPassword) {
		this.karvyPassword = karvyPassword;
	}
	public String getSundaramPassword() {
		return sundaramPassword;
	}
	public void setSundaramPassword(String sundaramPassword) {
		this.sundaramPassword = sundaramPassword;
	}
	public String getFbLink() {
		return fbLink;
	}
	public void setFbLink(String fbLink) {
		this.fbLink = fbLink;
	}
	public String getTwitterLink() {
		return twitterLink;
	}
	public void setTwitterLink(String twitterLink) {
		this.twitterLink = twitterLink;
	}
	
	
	
}
