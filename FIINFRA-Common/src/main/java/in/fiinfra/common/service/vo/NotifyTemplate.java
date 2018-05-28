package in.fiinfra.common.service.vo; 

public class NotifyTemplate {
	
	private int notifyTemplateID;
	private int partyID ;
	private int codeValueID;
	private int buid;
	private int eventCategoryID;
	private int sourceSystemID;
	private int eventid; 
	private int notifyTargetID;
	private int deliveryChannelID; //DeliveryChannelID
	private int useSignatureID;
	private int notifyTypeID;
	private int notifyEventID;
	private int userID;
	
	private Boolean isActive; 
	private Boolean isAddDND;  
	private Boolean isAddDiscl;
	       
	private String bizunit;
	private String system;
	private String recepient;
	private String channel;
	private String event; 
	private String template;
	private String name;
	private String description; 
	private String lastname ;
	private String codeValue;
	private String eventname;
	private String useSignature;
	private String searchText;  

	
	private String fromm;
	private String fromid;
	private String too;
	private String cc;
	private String bcc; 
	private String phone;
	private String subjectt;
	private String body;
	private String replyto;
	
	private String fileName;
	private String fileName1;
	private String fileName2;
	private String FileStoragePathURI;
	private String FileStoragePathURI1;
	private String FileStoragePathURI2;
	private int FileSizeKB;
	private int FileSizeKB1;
	private int FileSizeKB2;
	 
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getFromm() {
		return fromm;
	}
	public void setFromm(String fromm) {
		this.fromm = fromm;
	}
	public String getFromid() {
		return fromid;
	}
	public void setFromid(String fromid) {
		this.fromid = fromid;
	}
	public String getToo() {
		return too;
	}
	public void setToo(String too) {
		this.too = too;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getBcc() {
		return bcc;
	}
	public void setBcc(String bcc) {
		this.bcc = bcc;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSubjectt() {
		return subjectt;
	}
	public void setSubjectt(String subjectt) {
		this.subjectt = subjectt;
	}
	public String getBody() {
		return body; 
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getReplyto() {
		return replyto;
	}
	public void setReplyto(String replyto) {
		this.replyto = replyto;
	}
	public String getUseSignature() {
		return useSignature;
	}
	public void setUseSignature(String useSignature) {
		this.useSignature = useSignature;
	}
	public int getDeliveryChannelID() {
		return deliveryChannelID;
	}
	public void setDeliveryChannelID(int deliveryChannelID) {
		this.deliveryChannelID = deliveryChannelID;
	}
	public int getUseSignatureID() {
		return useSignatureID;
	}
	public void setUseSignatureID(int useSignatureID) {
		this.useSignatureID = useSignatureID;
	}
	public int getNotifyTypeID() {
		return notifyTypeID;
	}
	public void setNotifyTypeID(int notifyTypeID) {
		this.notifyTypeID = notifyTypeID;
	}
	public int getNotifyTargetID() {
		return notifyTargetID;
	}
	public void setNotifyTargetID(int notifyTargetID) {
		this.notifyTargetID = notifyTargetID;
	}
	public int getEventid() {
		return eventid;
	}
	public void setEventid(int eventid) {  
		this.eventid = eventid;
	}
	public String getEventname() {
		return eventname;
	}
	public void setEventname(String eventname) {
		this.eventname = eventname;
	}
	public int getEventCategoryID() {    
		return eventCategoryID;
	}
	public void setEventCategoryID(int eventCategoryID) {
		this.eventCategoryID = eventCategoryID;  
	}
	public int getSourceSystemID() {
		return sourceSystemID;
	}
	public void setSourceSystemID(int sourceSystemID) {
		this.sourceSystemID = sourceSystemID;
	}
	public int getBuid() {  
		return buid;
	}
	public void setBuid(int buid) {
		this.buid = buid;
	}
	public int getPartyID() {
		return partyID;
	}
	public void setPartyID(int partyID) {
		this.partyID = partyID;
	}
	public int getCodeValueID() {
		return codeValueID;
	}
	public void setCodeValueID(int codeValueID) {
		this.codeValueID = codeValueID;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}
	public int getNotifyTemplateID() {  
		return notifyTemplateID;
	}
	public void setNotifyTemplateID(int notifyTemplateID) {
		this.notifyTemplateID = notifyTemplateID;
	}
	
	public String getBizunit() {
		return bizunit;
	}
	public void setBizunit(String bizunit) {
		this.bizunit = bizunit;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	public String getRecepient() {
		return recepient;
	}
	public void setRecepient(String recepient) {
		this.recepient = recepient;
	}
	public String getChannel() {  
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {  
		this.event = event;
	}
	public String getTemplate() {
		return template;    
	}
	public void setTemplate(String template) {
		this.template = template;         
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() { 
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getFileStoragePathURI() {
		return FileStoragePathURI;
	}
	public void setFileStoragePathURI(String fileStoragePathURI) {
		FileStoragePathURI = fileStoragePathURI;
	}
	public String getFileStoragePathURI1() {
		return FileStoragePathURI1;
	}
	public void setFileStoragePathURI1(String fileStoragePathURI1) {
		FileStoragePathURI1 = fileStoragePathURI1;
	}
	public String getFileStoragePathURI2() {
		return FileStoragePathURI2;
	}
	public void setFileStoragePathURI2(String fileStoragePathURI2) {
		FileStoragePathURI2 = fileStoragePathURI2;
	}
	public int getFileSizeKB() {
		return FileSizeKB;
	}
	public void setFileSizeKB(int fileSizeKB) { 
		FileSizeKB = fileSizeKB;
	}
	public int getFileSizeKB1() {
		return FileSizeKB1;
	}
	public void setFileSizeKB1(int fileSizeKB1) {
		FileSizeKB1 = fileSizeKB1;
	}
	public int getFileSizeKB2() {
		return FileSizeKB2;
	}
	
	public void setFileSizeKB2(int fileSizeKB2) {
		FileSizeKB2 = fileSizeKB2;
	}
	public Boolean getisActive() { 
		return isActive;
	}
	public void setisActive(Boolean isActive) {
		this.isActive = isActive;
	}
	public Boolean getisAddDND() {
		return isAddDND;
	} 
	public void setisAddDND(Boolean isAddDND) {
		this.isAddDND = isAddDND;
	}
	public Boolean getisAddDiscl() {
		return isAddDiscl; 
	}
	public void setisAddDiscl(Boolean isAddDiscl) {
		this.isAddDiscl = isAddDiscl;
	}
	public int getNotifyEventID() {
		return notifyEventID;
	}  
	public void setNotifyEventID(int notifyEventID) {
		this.notifyEventID = notifyEventID;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	   
 
}
