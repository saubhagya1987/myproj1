package in.fiinfra.common.common;

import java.util.Date;

import javax.ws.rs.QueryParam;

public class NachRequest extends BaseRequest {
	@QueryParam("nachId")
	private Integer nachId;
	
	@QueryParam("partnerName")
	private String partnerName;
	@QueryParam("statusId")
	private Integer statusId;
	@QueryParam("userId")
	private Integer userId;
	@QueryParam("partnerId")
	private Integer partnerId;
	@QueryParam("productId")
	private Integer productId;
	@QueryParam("frequencyId")
	private Integer frequencyId;
	@QueryParam("dueInNext")
	private Integer dueInNext;
	@QueryParam("dateTo")
	private Date dateTo;
	
	public Date getDateTo() {
		return dateTo;
	}
	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}
	public Integer getDueInNext() {
		return dueInNext;
	}
	public void setDueInNext(Integer dueInNext) {
		this.dueInNext = dueInNext;
	}
	public Integer getFrequencyId() {
		return frequencyId;
	}
	public void setFrequencyId(Integer frequencyId) {
		this.frequencyId = frequencyId;
	}
	private String searchText;
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getNachId() {
		return nachId;
	}
	public void setNachId(Integer nachId) {
		this.nachId = nachId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	@Override
	protected void appendAll(StringBuilder sb) {
		
		super.appendAll(sb);
		append(sb, "nachId", this.nachId);
		append(sb, "userId", this.userId);
		append(sb, "statusId", this.statusId);
		append(sb, "partnerId", this.partnerId);
		append(sb, "productId", this.productId);
		append(sb, "frequencyId", this.frequencyId);
		append(sb, "dueInNext", this.dueInNext);
		/*append(sb, "dateTo", this.dateTo);*/
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}
	
}
