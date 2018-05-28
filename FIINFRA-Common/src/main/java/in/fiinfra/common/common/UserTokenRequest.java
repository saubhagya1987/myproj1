package in.fiinfra.common.common;

import javax.ws.rs.QueryParam;


public class UserTokenRequest extends BaseRequest {
	@QueryParam("sourceSystemId")
	private Integer sourceSystemId;
	@QueryParam("userName")
	private String userName;
	@QueryParam("token")
	private String token;
	@QueryParam("deviceId")
	private Integer deviceId;
	@QueryParam("otp")
	private Integer otp;
	@QueryParam("userId")
	private Integer userId;
	
	
	@Override
	protected void appendAll(StringBuilder sb) {
		
		super.appendAll(sb);
		append(sb, "sourceSystemId", this.sourceSystemId);
		append(sb, "token", this.token);
		append(sb, "userName", this.userName);
		append(sb, "deviceId", this.deviceId);
		append(sb, "otp", this.otp);
		append(sb, "userId", this.userId);
	}

	public Integer getSourceSystemId() {
		return sourceSystemId;
	}

	public void setSourceSystemId(Integer sourceSystemId) {
		this.sourceSystemId = sourceSystemId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Integer getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(Integer deviceId) {
		this.deviceId = deviceId;
	}

	public Integer getOtp() {
		return otp;
	}

	public void setOtp(Integer otp) {
		this.otp = otp;
	}
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
}
