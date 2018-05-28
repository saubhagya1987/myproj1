package in.fiinfra.pg;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonProperty;

public class AutoSubxExtendData {

	@JsonProperty
	private Integer partyID;
	@JsonProperty
	private Integer buId;

	@JsonProperty
	private Integer productID;

	@JsonProperty
	private String partyName;

	@JsonProperty
	private Date endDate;
	
	@JsonProperty
	private Date refDate;
	
	@JsonProperty
	private int planCount;

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public Integer getBuId() {
		return buId;
	}

	public void setBuId(Integer buId) {
		this.buId = buId;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getRefDate() {
		return refDate;
	}

	public void setRefDate(Date refDate) {
		this.refDate = refDate;
	}

	public int getPlanCount() {
		return planCount;
	}

	public void setPlanCount(int planCount) {
		this.planCount = planCount;
	}

}
