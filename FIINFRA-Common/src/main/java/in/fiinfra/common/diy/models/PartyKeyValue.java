package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

import in.fiinfra.common.util.PartySearchCriteriaEnum;

@JsonIgnoreProperties(ignoreUnknown=true)
public class PartyKeyValue 
{
	@JsonProperty
	private Integer id;
	@JsonProperty
	private PartySearchCriteriaEnum partySearch;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public PartySearchCriteriaEnum getPartySearch() {
		return partySearch;
	}
	public void setPartySearch(PartySearchCriteriaEnum partySearch) {
		this.partySearch = partySearch;
	}
	
	
	

}
