package in.fiinfra.common.diy.models;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class FamilyMember {
	
	@JsonProperty
	private Integer partyId;
	@JsonProperty
	private Integer recordTypeId;
	
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	public Integer getRecordTypeId() {
		return recordTypeId;
	}
	public void setRecordTypeId(Integer recordTypeId) {
		this.recordTypeId = recordTypeId;
	}
//	@Override
//	public String toString() {
//		
//		return new ReflectionToStringBuilder(this).toString();
//	}
}
