package in.fiinfra.cp.common.model;

import in.fiinfra.common.common.BaseRequest;

public class PortfolioRequest extends BaseRequest {

	int goalTypeId;
	private String productsId;
	private Integer productId;
	private Integer prodAllocationId;
	private Integer fpActionPlanId;
	private Integer loanId;
	private Integer assetId;
	private String ifa;
	private Integer settingTypeID;
	private Integer  executionId;
	public Integer getPartnerPartyId() {
		return partnerPartyId;
	}

	public void setPartnerPartyId(Integer partnerPartyId) {
		this.partnerPartyId = partnerPartyId;
	}

	private Integer partnerPartyId;
	public Integer getExecutionId() {
		return executionId;
	}

	public void setExecutionId(Integer executionId) {
		this.executionId = executionId;
	}

	public Integer getPartyLoanId() {
		return partyLoanId;
	}

	public Integer getSettingTypeID() {
		return settingTypeID;
	}

	public void setSettingTypeID(Integer settingTypeID) {
		this.settingTypeID = settingTypeID;
	}

	public void setPartyLoanId(Integer partyLoanId) {
		this.partyLoanId = partyLoanId;
	}

	private Integer partyLoanId;
	

	public Integer getLoanId() {
		return loanId;
	}

	public void setLoanId(Integer loanId) {
		this.loanId = loanId;
	}

	public Integer getFpActionPlanId() {
		return fpActionPlanId;
	}

	public void setFpActionPlanId(Integer fpActionPlanId) {
		this.fpActionPlanId = fpActionPlanId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getProdAllocationId() {
		return prodAllocationId;
	}

	public void setProdAllocationId(Integer prodAllocationId) {
		this.prodAllocationId = prodAllocationId;
	}

	public int getGoalTypeId() {
		return goalTypeId;
	}

	public void setGoalTypeId(int goalTypeId) {
		this.goalTypeId = goalTypeId;
	}

	public Integer getAssetId() {
		return assetId;
	}

	public void setAssetId(Integer assetId) {
		this.assetId = assetId;
	}

	public String getIfa() {
		return ifa;
	}

	public void setIfa(String ifa) {
		this.ifa = ifa;
	}
	public String getProductsId() {
		return productsId;
	}

	public void setProductsId(String productsId) {
		this.productsId = productsId;
	}


	@Override
	protected void appendAll(StringBuilder sb) {

		super.appendAll(sb);
		append(sb, "goalTypeId", this.goalTypeId);
		append(sb, "prodAllocationId", this.prodAllocationId);
		append(sb, "productId", this.productId);
		append(sb, "fpActionPlanId", this.fpActionPlanId);
		append(sb, "loanId", this.loanId);
		append(sb, "ifa", this.ifa);
		append(sb, "assetId", this.assetId);
		append(sb, "partyLoanId", this.partyLoanId);
		append(sb,"settingTypeID",this.settingTypeID);
		append(sb,"executionId",this.executionId);
		append(sb,"partnerPartyId",this.partnerPartyId);
		append(sb,"productsId",this.productsId);
	}

	
}
