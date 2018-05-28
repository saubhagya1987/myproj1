package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class ProductPurchaseURLs {
	
	@JsonProperty
	public String url;
	
	@JsonProperty
	public Integer isURLPresent;
	
	@JsonProperty
	public Integer manufacturerID;

	@JsonProperty
	public Integer productId;
	@JsonProperty
	public Integer settingTypeId;
	
	

	public Integer getSettingTypeId() {
		return settingTypeId;
	}

	public void setSettingTypeId(Integer settingTypeId) {
		this.settingTypeId = settingTypeId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getIsURLPresent() {
		return isURLPresent;
	}

	public void setIsURLPresent(Integer isURLPresent) {
		this.isURLPresent = isURLPresent;
	}

	public Integer getManufacturerID() {
		return manufacturerID;
	}

	public void setManufacturerID(Integer manufacturerID) {
		this.manufacturerID = manufacturerID;
	}

	@Override
	public String toString() {
		return "ProductPurchaseURLs [url=" + url + ", isURLPresent="
				+ isURLPresent + ", manufacturerID=" + manufacturerID + "]";
	}
	
	
	
	

}
