package in.fiinfra.common.diy.models;

import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class ConfigurationProductsList {
	
	@JsonProperty
	List<KeyValue> partyAttributes;
	@JsonProperty
	List<PartySetting> partySettings;
	
	
	public List<KeyValue> getPartyAttributes() {
		return partyAttributes;
	}
	public void setPartyAttributes(List<KeyValue> partyAttributes) {
		this.partyAttributes = partyAttributes;
	}
	public List<PartySetting> getPartySettings() {
		return partySettings;
	}
	public void setPartySettings(List<PartySetting> partySettings) {
		this.partySettings = partySettings;
	}
	
	
	

}
