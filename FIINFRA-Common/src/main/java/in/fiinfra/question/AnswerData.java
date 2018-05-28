package in.fiinfra.question;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class AnswerData {
	private int questionId;
	private int questionnaireId;
	private OptionData[] selectedOptions;
	private int partyId; 
	//for result
	private int score;
	
	


	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public OptionData[] getSelectedOptions() {
		return selectedOptions;
	}

	public void setSelectedOptions(OptionData[] selectedOptions) {
		this.selectedOptions = selectedOptions;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getQuestionnaireId() {
		return questionnaireId;
	}

	public void setQuestionnaireId(int questionnaireId) {
		this.questionnaireId = questionnaireId;
	}

}
