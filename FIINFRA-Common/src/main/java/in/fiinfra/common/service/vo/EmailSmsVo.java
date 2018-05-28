package in.fiinfra.common.service.vo;

public class EmailSmsVo {
	//Email/SMS	From	Name	To Subject Status	Description   
	
	private String emailSms;
	private String from;
	private String name;
	private String to;
	private String subject;
	private String status;
	private String desc;
	private Integer buId;
	private String searchtext;
	
	private String time;
	private int email_ct;
	private int sms_ct;
	private String lastemailOn;
	
	
	
	
	
	public String getLastemailOn() {
		return lastemailOn;
	}
	public void setLastemailOn(String lastemailOn) {
		this.lastemailOn = lastemailOn;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getEmail_ct() {
		return email_ct;
	}
	public void setEmail_ct(int email_ct) {
		this.email_ct = email_ct;
	}
	public int getSms_ct() {
		return sms_ct;
	}
	public void setSms_ct(int sms_ct) {
		this.sms_ct = sms_ct;
	}
	public Integer getBuId() {
		return buId;
	}
	public void setBuId(Integer buId) {
		this.buId = buId;
	}
	public String getSearchtext() {
		return searchtext;
	}
	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}
	public String getEmailSms() {
		return emailSms;
	}
	public void setEmailSms(String emailSms) {
		this.emailSms = emailSms;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
