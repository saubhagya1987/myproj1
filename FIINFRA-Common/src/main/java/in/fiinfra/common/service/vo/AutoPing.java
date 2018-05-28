package in.fiinfra.common.service.vo;

public class AutoPing {
	
	private int pingId;
	private String pingName;
	private String pingDescription;
	private int deliveryChannelId;
	private String subject;
	private String emailBody;
	private String smsBody;
	private String cc;
	private String bcc;
	private String fileName;
	private String fileName1;
	private String fileName2;
	private String FileStoragePathURI;
	private String FileStoragePathURI1;
	private String FileStoragePathURI2;
	private int FileSizeKB;
	private int FileSizeKB1;
	private int FileSizeKB2;
	private int useSignature;
	private String disclaimer;
	private String DNDtemplate;
	private int partyId;
	private String source;
	private int eventId;
	private String event;
	private int notifyTypeId;
	private int notifyTargetId;
	private String templateXML;
	private int createdby;
	private int lastModifiedBy;
	private String eventDescription;
	private String lastModifiedDate;
	private String createdDate;
	private String deliveryChannel;
	private int frequencyValue;
	private String eventCreatedBy;
	private int frequencyId;
	private String nextFiretime;
	private int selectType;
	
	//
	private int recuringDate;
	private int week;
	
	
	//
	
	
	private int templateId;
	private int isRecuring;
	private String scheduleDttm;
	
	
	private int sourceId;
	
	
	
	
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public int getRecuringDate() {
		return recuringDate;
	}
	public void setRecuringDate(int recuringDate) {
		this.recuringDate = recuringDate;
	}
	public int getSelectType() {
		return selectType;
	}
	public void setSelectType(int selectType) {
		this.selectType = selectType;
	}
	public int getTemplateId() {
		return templateId;
	}
	public void setTemplateId(int templateId) {
		this.templateId = templateId;
	}
	public String getSmsBody() {
		return smsBody;
	}
	public void setSmsBody(String smsBody) {
		this.smsBody = smsBody;
	}
	public int getSourceId() {
		return sourceId;
	}
	public void setSourceId(int sourceId) {
		this.sourceId = sourceId;
	}
	public int getIsRecuring() {
		return isRecuring;
	}
	public void setIsRecuring(int isRecuring) {
		this.isRecuring = isRecuring;
	}
	public int getFrequencyId() {
		return frequencyId;
	}
	public void setFrequencyId(int frequencyId) {
		this.frequencyId = frequencyId;
	}
	public String getNextFiretime() {
		return nextFiretime;
	}
	public void setNextFiretime(String nextFiretime) {
		this.nextFiretime = nextFiretime;
	}
	public String getEventCreatedBy() {
		return eventCreatedBy;
	}
	public void setEventCreatedBy(String eventCreatedBy) {
		this.eventCreatedBy = eventCreatedBy;
	}
	public int getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(int lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	
	public int getFrequencyValue() {
		return frequencyValue;
	}
	public void setFrequencyValue(int frequencyValue) {
		this.frequencyValue = frequencyValue;
	}
	public String getScheduleDttm() {
		return scheduleDttm;
	}
	public void setScheduleDttm(String scheduleDttm) {
		this.scheduleDttm = scheduleDttm;
	}
	public String getDeliveryChannel() {
		return deliveryChannel;
	}
	public void setDeliveryChannel(String deliveryChannel) {
		this.deliveryChannel = deliveryChannel;
	}
	
	
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getTemplateXML() {
		return templateXML;
	}
	public void setTemplateXML(String templateXML) {
		this.templateXML = templateXML;
	}
	public int getCreatedby() {
		return createdby;
	}
	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}
	public int getUseSignature() {
		return useSignature;
	}
	public void setUseSignature(int useSignature) {
		this.useSignature = useSignature;
	}
	public int getNotifyTargetId() {
		return notifyTargetId;
	}
	public void setNotifyTargetId(int notifyTargetId) {
		this.notifyTargetId = notifyTargetId;
	}
	public int getNotifyTypeId() {
		return notifyTypeId;
	}
	public void setNotifyTypeId(int notifyTypeId) {
		this.notifyTypeId = notifyTypeId;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public int getPingId() {
		return pingId;
	}
	public void setPingId(int pingId) {
		this.pingId = pingId;
	}
	public String getPingName() {
		return pingName;
	}
	public void setPingName(String pingName) {
		this.pingName = pingName;
	}
	public String getPingDescription() {
		return pingDescription;
	}
	public void setPingDescription(String pingDescription) {
		this.pingDescription = pingDescription;
	}
	public int getDeliveryChannelId() {
		return deliveryChannelId;
	}
	public void setDeliveryChannelId(int deliveryChannelId) {
		this.deliveryChannelId = deliveryChannelId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmailBody() {
		return emailBody;
	}
	public void setEmailBody(String emailBody) {
		this.emailBody = emailBody;
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
	
	public String getDisclaimer() {
		return disclaimer;
	}
	public void setDisclaimer(String disclaimer) {
		this.disclaimer = disclaimer;
	}
	public String getDNDtemplate() {
		return DNDtemplate;
	}
	public void setDNDtemplate(String dNDtemplate) {
		DNDtemplate = dNDtemplate;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	
	
}
