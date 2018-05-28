package in.fiinfra.common.diy.models;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown=true)
public class AdviserGoalChart {

	private static final long serialVersionUID = -6840455864218425384L;
	@JsonProperty
	private Integer goalTypeId;
	@JsonProperty
	private String title;
	@JsonProperty
	private Integer count;
	@JsonProperty
	private Double amount;
	
	public Integer getGoalTypeId() {
		return goalTypeId;
	}
	public void setGoalTypeId(Integer goalTypeId) {
		this.goalTypeId = goalTypeId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

//	@Override
//	public String toString() 
//	{
//		return new ReflectionToStringBuilder(this).toString();
//	}
}
