package in.fiinfra.common.service.vo;

import java.util.Date;

//import java.math.BigDecimal;

public class PriceHistory {

	private int productPriceId;

	private int productId;

	private String priceDate;
	
	private String priceValue;
	
	private int priceSourceId;
	
	private String priceSource;
	
	private String searchText;
	
	private Date showDate;

	public int getProductPriceId() {
		return productPriceId;
	}

	public void setProductPriceId(int productPriceId) {
		this.productPriceId = productPriceId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getPriceDate() {
		return priceDate;
	}

	public void setPriceDate(String priceDate) {
		this.priceDate = priceDate;
	}

	public String getPriceValue() {
		return priceValue;
	}

	public void setPriceValue(String priceValue) {
		this.priceValue = priceValue;
	}

	public int getPriceSourceId() {
		return priceSourceId;
	}

	public void setPriceSourceId(int priceSourceId) {
		this.priceSourceId = priceSourceId;
	}

	public String getPriceSource() {
		return priceSource;
	}

	public void setPriceSource(String priceSource) {
		this.priceSource = priceSource;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Date getShowDate() {
		return showDate;
	}

	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}

	
}
