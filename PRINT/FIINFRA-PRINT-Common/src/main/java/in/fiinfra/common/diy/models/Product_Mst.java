package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class Product_Mst {

	@JsonProperty
	private String ManufacturerID ;
	@JsonProperty
	private String ProductID ;
	@JsonProperty
	private String ProductName ;
	public String getManufacturerID() {
		return ManufacturerID;
	}
	public void setManufacturerID(String manufacturerID) {
		ManufacturerID = manufacturerID;
	}
	public String getProductID() {
		return ProductID;
	}
	public void setProductID(String productID) {
		ProductID = productID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	
	
	
}
