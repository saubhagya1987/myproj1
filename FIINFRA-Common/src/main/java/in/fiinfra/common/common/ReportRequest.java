package in.fiinfra.common.common;

import java.util.Date;

import javax.ws.rs.QueryParam;

public class ReportRequest extends BaseRequest{
	
	
	@QueryParam("name")
	private String name;
	
	@QueryParam("userId")
	private int userId;
	
	@QueryParam("dateFrom")
	private Date dateFrom;
	
	@QueryParam("dateTo")
	private Date dateTo;
	
	@QueryParam("PartnerId")
	private Integer partnerId;
	
	@QueryParam("partnerName")
	private String partnerName;
	
	@QueryParam("reportType")
	private String reportType;
	
	@QueryParam("orderStatus")
	private Integer orderStatus;
	
	@QueryParam("format")
	private String format;
	
	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public Integer getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}
	
	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	

}
