package in.fiinfra.common.diy.models;

import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.question.QuestionData;

import java.util.Date;
import java.util.List;

public class UserToken {

	private Integer userTokenId;
	private Integer userId;
	private Integer sourceSystemId;
	private Integer otp;
	private Integer createdBy;
	private String token;
	private String description;
	private Date createdDate;
	private boolean isOtpConfirmed;
	private boolean active;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getSourceSystemId() {
		return sourceSystemId;
	}
	public void setSourceSystemId(Integer sourceSystemId) {
		this.sourceSystemId = sourceSystemId;
	}
	public Integer getOtp() {
		return otp;
	}
	public void setOtp(Integer otp) {
		this.otp = otp;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Integer getUserTokenId() {
		return userTokenId;
	}
	public void setUserTokenId(Integer userTokenId) {
		this.userTokenId = userTokenId;
	}
	public boolean isOtpConfirmed() {
		return isOtpConfirmed;
	}
	public void setOtpConfirmed(boolean isOtpConfirmed) {
		this.isOtpConfirmed = isOtpConfirmed;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	
	
}
