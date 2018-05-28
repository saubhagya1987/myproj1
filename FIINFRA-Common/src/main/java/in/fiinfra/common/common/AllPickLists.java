package in.fiinfra.common.common;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class AllPickLists {
	
List<Product> products = new ArrayList<Product>();
	
 public static class Product{
	 int ptoductId;
	 int productName;
	public int getPtoductId() {
		return ptoductId;
	}
	public void setPtoductId(int ptoductId) {
		this.ptoductId = ptoductId;
	}
	public int getProductName() {
		return productName;
	}
	public void setProductName(int productName) {
		this.productName = productName;
	}
	
}
 public static  class InvestmentType{
	 int investmentTypeId;
	 int investmentType;
	public int getInvestmentTypeId() {
		return investmentTypeId;
	}
	public void setInvestmentTypeId(int investmentTypeId) {
		this.investmentTypeId = investmentTypeId;
	}
	public int getInvestmentType() {
		return investmentType;
	}
	public void setInvestmentType(int investmentType) {
		this.investmentType = investmentType;
	}
	
}
 public static class Frequency{
	 int frequencyId;
	 int frequency;
	public int getFrequencyId() {
		return frequencyId;
	}
	public void setFrequencyId(int frequencyId) {
		this.frequencyId = frequencyId;
	}
	public int getFrequency() {
		return frequency;
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency;
	}
	
}
 public static class ClientApprovalStatus{
	 int statusId;
	 int status;
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
}
