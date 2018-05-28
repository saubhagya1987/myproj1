package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class ProductCommension {
	
	
	@JsonProperty
	private Float upfront;
	@JsonProperty
	private Float trial;
	@JsonProperty
	private String preimum;
	@JsonProperty
	private String sumAssured;
	
	public Float getUpfront() {
		return upfront;
	}
	public void setUpfront(Float upfront) {
		this.upfront = upfront;
	}
	public Float getTrial() {
		return trial;
	}
	public void setTrial(Float trial) {
		this.trial = trial;
	}
	public String getPreimum() {
		return preimum;
	}
	public void setPreimum(String preimum) {
		this.preimum = preimum;
	}
	public String getSumAssured() {
		return sumAssured;
	}
	public void setSumAssured(String sumAssured) {
		if(null!=sumAssured){
			Double sum = Double.parseDouble(sumAssured);
			this.sumAssured = sum.toString();	
		}
	}
}
