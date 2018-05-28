package in.fiinfra.common.diy.models;

import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.question.QuestionData;

import java.util.List;

public class SyncData {

	private List<SyncContactData> contacts;
	private String partnerName;
	private Integer partnerId;
	private String logoUrl;
	private List<QuestionData> xrayTempalte;

	private String lastSyncTime;
	private Integer buId;
	private Integer userId;
	private Integer themeId;
	
	
	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public Integer getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public List<SyncContactData> getContacts() {
		return contacts;
	}

	public void setContacts(List<SyncContactData> contacts) {
		this.contacts = contacts;
	}

	public List<QuestionData> getXrayTempalte() {
		return xrayTempalte;
	}

	public void setXrayTempalte(List<QuestionData> xrayTempalte) {
		this.xrayTempalte = xrayTempalte;
	}

	public String getLastSyncTime() {
		return lastSyncTime;
	}

	public void setLastSyncTime(String lastSyncTime) {
		this.lastSyncTime = lastSyncTime;
	}


	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getBuId() {
		return buId;
	}

	public void setBuId(Integer buId) {
		this.buId = buId;
	}

	public Integer getThemeId() {
		return themeId;
	}

	public void setThemeId(Integer themeId) {
		this.themeId = themeId;
	}

	


}
