package in.fiinfra.pg;

import in.fiinfra.cp.CommonUtils;

import java.util.ArrayList;
import java.util.List;


//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class SubxProductData implements Comparable<SubxProductData> {

	@JsonProperty
	private Integer partyProductID;
	
	@JsonProperty
	private Integer productID;
	@JsonProperty
	private String productName;
	@JsonProperty
	private Integer partyID;
	@JsonProperty
	private Integer paymentFrequencyId;
	@JsonProperty
	private String paymentFrequency;
	@JsonProperty
	private boolean defaulted;
	@JsonProperty
	private double priceValue;
	@JsonProperty
	private String productDesc;
	@JsonProperty
	private int categoryId;
	
	private List<SubxAttribute> attributes = new ArrayList<SubxAttribute>();

	@Override
	public int compareTo(SubxProductData o) {
		return this.productName.compareTo(o.getProductName());
	}

	
	public Integer getPartyProductID() {
		return partyProductID;
	}


	public void setPartyProductID(Integer partyProductID) {
		this.partyProductID = partyProductID;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public Integer getPaymentFrequencyId() {
		return paymentFrequencyId;
	}

	public void setPaymentFrequencyId(Integer paymentFrequencyId) {
		this.paymentFrequencyId = paymentFrequencyId;
	}

	public boolean isDefaulted() {
		return defaulted;
	}

	public void setDefaulted(boolean defaulted) {
		this.defaulted = defaulted;
	}

	public double getPriceValue() {
		return priceValue;
	}

	public void setPriceValue(double priceValue) {
		this.priceValue = priceValue;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public List<SubxAttribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(List<SubxAttribute> attributes) {
		this.attributes = attributes;
	}
	
	public  int findIntValue(int attributeId){
		for(SubxAttribute attrb:getAttributes()){
			if(attrb.getAttributeId().equals(attributeId)){
				return CommonUtils.toInt(attrb.getValue());
			}
		}
		return 0;
	}

	public  int findIntValue( int attributeId, int freqId){
		for(SubxAttribute attrb:getAttributes()){
			if(attrb.getAttributeId().equals(attributeId) && attrb.getFrequencyId().equals(freqId)){
				return CommonUtils.toInt(attrb.getValue());
			}
		}
		return 0;
	}

	public  String findValue(int attributeId, int freqId){
		for(SubxAttribute attrb:getAttributes()){
			if(attrb.getAttributeId().equals(attributeId) && attrb.getFrequencyId().equals(freqId)){
				return attrb.getValue();
			}
		}
		return null;
	}

	public String getPaymentFrequency() {
		return paymentFrequency;
	}

	public void setPaymentFrequency(String paymentFrequency) {
		this.paymentFrequency = paymentFrequency;
	}

	public void addAttribute(int attrbId, String value){
		
		for(SubxAttribute attrb:getAttributes()){
			if(attrb.getAttributeId().equals(attrbId)){
				attrb.setValue(value);
				return;
			}
		}
		if(value != null){
			SubxAttribute a   = new SubxAttribute();
			a.setAttributeId(attrbId);
			a.setValue(value);
			getAttributes().add(a); 
		}
		
		
	}

}
