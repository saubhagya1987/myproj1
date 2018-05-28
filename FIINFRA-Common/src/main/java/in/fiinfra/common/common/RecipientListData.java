package in.fiinfra.common.common;

import java.util.List;




public class RecipientListData {

	private String recipientName;
	private String emailId;
	private String contactNo;
	private int pingCount;
	private int partyId;
	private int ping;
	private int recipientType;
	private String scheduleDate;
	private String scheduleHours;
	private String hrType;
	private String scheduleMinute;
	private String xmlStringNotifyParty; 
	private int notifyScheduleId;
	private int buId;
	private int createdBy;
	private int pingStatus;
	private String xmlTagList;
	private SelectedRecipientForSchedulePing objselectedRecipientForSchedulePing;
//	private ArrayList<TagData> lstTagDatas = new ArrayList<TagData>();
	private List<TagData> lstTagDatas;
	private List<RecipientListData > lstRecipientListData;
	private int matched;
	private String scheduledBy;
	private String scheduledOn;
	private String DelivededOn;
	
	public String getScheduledBy() {
		return scheduledBy;
	}
	public void setScheduledBy(String scheduledBy) {
		this.scheduledBy = scheduledBy;
	}
	public String getScheduledOn() {
		return scheduledOn;
	}
	public void setScheduledOn(String scheduledOn) {
		this.scheduledOn = scheduledOn;
	}
	public String getDelivededOn() {
		return DelivededOn;
	}
	public void setDelivededOn(String delivededOn) {
		DelivededOn = delivededOn;
	}
	public int getMatched() {
		return matched;
	}
	public void setMatched(int matched) {
		this.matched = matched;
	}
	public List<RecipientListData> getLstRecipientListData() {
		return lstRecipientListData;
	}
	public void setLstRecipientListData(List<RecipientListData> lstRecipientListData) {
		this.lstRecipientListData = lstRecipientListData;
	}
	public String getXmlTagList() {
		return xmlTagList;
	}
	public void setXmlTagList(String xmlTagList) {
		this.xmlTagList = xmlTagList;
	}
	public int getPing() {
		return ping;
	}
	public void setPing(int ping) {
		this.ping = ping;
	}
	public int getRecipientType() {
		return recipientType;
	}
	public void setRecipientType(int recipientType) {
		this.recipientType = recipientType;
	}
	public String getXmlStringNotifyParty() {
		return xmlStringNotifyParty;
	}
	public void setXmlStringNotifyParty(String xmlStringNotifyParty) {
		this.xmlStringNotifyParty = xmlStringNotifyParty;
	}
	public int getNotifyScheduleId() {
		return notifyScheduleId;
	}
	public void setNotifyScheduleId(int notifyScheduleId) {
		this.notifyScheduleId = notifyScheduleId;
	}
	public int getPartyId() {
		return partyId;
	}
	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public int getPingCount() {
		return pingCount;
	}
	public void setPingCount(int pingCount) {
		this.pingCount = pingCount;
	}
	public String getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public String getScheduleHours() {
		return scheduleHours;
	}
	public void setScheduleHours(String scheduleHours) {
		this.scheduleHours = scheduleHours;
	}
	public String getHrType() {
		return hrType;
	}
	public void setHrType(String hrType) {
		this.hrType = hrType;
	}
	public String getScheduleMinute() {
		return scheduleMinute;
	}
	public int getBuId() {
		return buId;
	}
	public void setBuId(int buId) {
		this.buId = buId;
	}
	public void setScheduleMinute(String scheduleMinute) {
		this.scheduleMinute = scheduleMinute;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getPingStatus() {
		return pingStatus;
	}
	public void setPingStatus(int pingStatus) {
		this.pingStatus = pingStatus;
	}
	public List<TagData> getLstTagDatas() {
		return lstTagDatas;
	}
	public void setLstTagDatas(List<TagData> lstTagDatas) {
		this.lstTagDatas = lstTagDatas;
	}
	public SelectedRecipientForSchedulePing getObjselectedRecipientForSchedulePing() {
		return objselectedRecipientForSchedulePing;
	}
	public void setObjselectedRecipientForSchedulePing(
			SelectedRecipientForSchedulePing objselectedRecipientForSchedulePing) {
		this.objselectedRecipientForSchedulePing = objselectedRecipientForSchedulePing;
	}
	
	
	
	
}
