package in.fiinfra.common.partner;
/**
 * 
 * @author Raj Mahindra
 * pojo to store data for Add/Edit stock form detials
 * @see PortfolioData
 */
public class StockPortfolioData extends PortfolioData {

	private String brokrageAmount;
	
	private String dMatAccount;
	

	public String getdMatAccount() {
		return dMatAccount;
	}

	public void setdMatAccount(String dMatAccount) {
		this.dMatAccount = dMatAccount;
	}

	public String getBrokrageAmount() {
		return brokrageAmount;
	}

	public void setBrokrageAmount(String brokrageAmount) {
		this.brokrageAmount = brokrageAmount;
	}
	
	
}
