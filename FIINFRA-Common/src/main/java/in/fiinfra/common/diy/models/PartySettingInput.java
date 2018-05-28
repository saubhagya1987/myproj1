package in.fiinfra.common.diy.models;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PartySettingInput {
	
	@JsonProperty
	private Integer clientPartyId;
	
	@JsonProperty
	private Integer partnerPartyId;
	
	@JsonProperty
	private Integer buPartyId;
	
	@JsonProperty
	private String assumptionCodeIds;
	
	public Integer getClientPartyId() {
		return clientPartyId;
	}
	
	public void setClientPartyId(Integer clientPartyId) {
		this.clientPartyId = clientPartyId;
	}
	
	public Integer getPartnerPartyId() {
		return partnerPartyId;
	}
	
	public void setPartnerPartyId(Integer partnerPartyId) {
		this.partnerPartyId = partnerPartyId;
	}
	
	public Integer getBuPartyId() {
		return buPartyId;
	}
	
	public void setBuPartyId(Integer buPartyId) {
		this.buPartyId = buPartyId;
	}
	
	public String getAssumptionCodeIds() {
		return assumptionCodeIds;
	}
	
	public void setAssumptionCodeIds(String assumptionCodeIds) {
		this.assumptionCodeIds = assumptionCodeIds;
	}

//	@Override
//	public String toString() {
//		return new ReflectionToStringBuilder(this).toString();
//	}
}
