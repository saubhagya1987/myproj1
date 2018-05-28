package in.fiinfra.common.service.vo;

public class PartnerRating {

	private String reason;
	private int reasonId;
	private String reasonIdString;
	private int ratingId;
	private int buId;
	private int partnerspartyid;
	private int userId;
	private String otherReason;
	private String lastMonthDate;
	private String extraNote;
	
	public String getExtraNote() {
		return extraNote;
	}
	public void setExtraNote(String extraNote) {
		this.extraNote = extraNote;
	}
	private String lastModifiedby;
	private String lastmodifiedDate;
	private String ratingvalue;
	private String historyReasons;
	
	public String getHistoryReasons() {
		return historyReasons;
	}
	public void setHistoryReasons(String historyReasons) {
		this.historyReasons = historyReasons;
	}
	public String getRatingvalue() {
		return ratingvalue;
	}
	public void setRatingvalue(String ratingvalue) {
		this.ratingvalue = ratingvalue;
	}
	public String getLastModifiedby() {
		return lastModifiedby;
	}
	public void setLastModifiedby(String lastModifiedby) {
		this.lastModifiedby = lastModifiedby;
	}
	public String getLastmodifiedDate() {
		return lastmodifiedDate;
	}
	public void setLastmodifiedDate(String lastmodifiedDate) {
		this.lastmodifiedDate = lastmodifiedDate;
	}
	public String getLastMonthDate() {
		return lastMonthDate;
	}
	public void setLastMonthDate(String lastMonthDate) {
		this.lastMonthDate = lastMonthDate;
	}
	public String getOtherReason() {
		return otherReason;
	}
	public void setOtherReason(String otherReason) {
		this.otherReason = otherReason;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPartnerspartyid() {
		return partnerspartyid;
	}
	public void setPartnerspartyid(int partnerspartyid) {
		this.partnerspartyid = partnerspartyid;
	}
	public int getReasonId() {
		return reasonId;
	}
	public void setReasonId(int reasonId) {
		this.reasonId = reasonId;
	}
	public String getReasonIdString() {
		return reasonIdString;
	}
	public void setReasonIdString(String reasonIdString) {
		this.reasonIdString = reasonIdString;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getRatingId() {
		return ratingId;
	}
	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}
	
	public int getBuId() {
		return buId;
	}
	public void setBuId(int ratingId) {
		this.buId = buId;
	}
	
}
