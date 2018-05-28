package in.fiinfra.question;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class OptionData {
	private Integer seq;
	private Integer score;
	private String feedback;
	private Integer optionId;
	private String optionText;
	
	
	private String selectedOptionText;
	private boolean selected;
	private String selectedOptionFeedback;
	
	//required for poll case
	private int selectedTotal;

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public Integer getOptionId() {
		return optionId;
	}

	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}

	public String getOptionText() {
		return optionText;
	}

	public void setOptionText(String optionText) {
		this.optionText = optionText;
	}


	public String getSelectedOptionText() {
		return selectedOptionText;
	}

	public void setSelectedOptionText(String selectedOptionText) {
		this.selectedOptionText = selectedOptionText;
	}

	public String getSelectedOptionFeedback() {
		return selectedOptionFeedback;
	}

	public void setSelectedOptionFeedback(String selectedOptionFeedback) {
		this.selectedOptionFeedback = selectedOptionFeedback;
	}

	public int getSelectedTotal() {
		return selectedTotal;
	}

	public void setSelectedTotal(int selectedTotal) {
		this.selectedTotal = selectedTotal;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}






}
