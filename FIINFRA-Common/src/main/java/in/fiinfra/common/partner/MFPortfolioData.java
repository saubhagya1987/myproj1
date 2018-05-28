package in.fiinfra.common.partner;
/**
 * 
 * @author Raj Mahindra
 * pojo to store data for Add/Edit mutual fund form detials
 * @see PortfolioData
 */
public class MFPortfolioData extends PortfolioData {

	private String folioNumber;
	
	private String sipStartDate;
	
	private String sipEndDate;
	
	private String sipAmount;
	
	private String sipFrequency;
	
	private int sipFrequencyId;
	
	private int clientId;
	
	private String amc;
	
	private String txnType;
	
	private String startDate;
	
	private String endDate;
	
	
	private String productName;
	
	private int txnTypeId;
		
	private String clientName;
	
	private int pmTxnId;
	
	private String txnAmount;
	
	private String txtUnitQty;
	
	
	private String txtPriceNav;
	
	private int amcId;
	public String getFolioNumber() {
		return folioNumber;
	}

	public void setFolioNumber(String folioNumber) {
		this.folioNumber = folioNumber;
	}

	public String getSipStartDate() {
		return sipStartDate;
	}

	public void setSipStartDate(String sipStartDate) {
		this.sipStartDate = sipStartDate;
	}

	public String getSipEndDate() {
		return sipEndDate;
	}

	public void setSipEndDate(String sipEndDate) {
		this.sipEndDate = sipEndDate;
	}

	public String getSipAmount() {
		return sipAmount;
	}

	public void setSipAmount(String sipAmount) {
		this.sipAmount = sipAmount;
	}

	public String getSipFrequency() {
		return sipFrequency;
	}

	public void setSipFrequency(String sipFrequency) {
		this.sipFrequency = sipFrequency;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	
	

	public String getAmc() {
		return amc;
	}

	public void setAmc(String amc) {
		this.amc = amc;
	}



	public String getTxnType() {
		return txnType;
	}

	public void setTxnType(String txnType) {
		this.txnType = txnType;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getTxnTypeId() {
		return txnTypeId;
	}

	public void setTxnTypeId(int txnTypeId) {
		this.txnTypeId = txnTypeId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public int getPmTxnId() {
		return pmTxnId;
	}

	public void setPmTxnId(int pmTxnId) {
		this.pmTxnId = pmTxnId;
	}

	public String getTxnAmount() {
		return txnAmount;
	}

	public void setTxnAmount(String txnAmount) {
		this.txnAmount = txnAmount;
	}

	public String getTxtUnitQty() {
		return txtUnitQty;
	}

	public void setTxtUnitQty(String txtUnitQty) {
		this.txtUnitQty = txtUnitQty;
	}

	public String getTxtPriceNav() {
		return txtPriceNav;
	}

	public void setTxtPriceNav(String txtPriceNav) {
		this.txtPriceNav = txtPriceNav;
	}

	public int getAmcId() {
		return amcId;
	}

	public void setAmcId(int amcId) {
		this.amcId = amcId;
	}

	public int getSipFrequencyId() {
		return sipFrequencyId;
	}

	public void setSipFrequencyId(int sipFrequencyId) {
		this.sipFrequencyId = sipFrequencyId;
	}
}
