package in.fiinfra.common.diy.models;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class BusinessHealthIndex implements Serializable {
	
	private static final long serialVersionUID = 7335292490868488760L;

	@JsonIgnore
	@JsonProperty
	private Integer questionId;
	@JsonIgnore
	@JsonProperty
	private String questionText;
	@JsonIgnore
	@JsonProperty
	private Integer questionOptionID;
	@JsonIgnore
	@JsonProperty
	private String questionOptionText;
	@JsonIgnore
	@JsonProperty
	private Integer optionChecked;
	@JsonIgnore
	@JsonProperty
	private Integer qBankId;
	@JsonIgnore
	@JsonProperty
	private Integer partyId;
	
	
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	
	public Integer getQuestionOptionID() {
		return questionOptionID;
	}
	public void setQuestionOptionID(Integer questionOptionID) {
		this.questionOptionID = questionOptionID;
	}
	
	public String getQuestionOptionText() {
		return questionOptionText;
	}
	public void setQuestionOptionText(String questionOptionText) {
		this.questionOptionText = questionOptionText;
	}
	public Integer getOptionChecked() {
		return optionChecked;
	}
	public void setOptionChecked(Integer optionChecked) {
		this.optionChecked = optionChecked;
	}
	public Integer getQBankId() {
		return qBankId;
	}
	public void setQBankId(Integer qBankId) {
		this.qBankId = qBankId;
	}
	public Integer getPartyId() {
		return partyId;
	}
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}
	
}
