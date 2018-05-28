package in.fiinfra.question;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class QuestionData {
	private Integer questionId;
	private int seqNo;
	private String question;
	private boolean mandatory;
	private Integer attrbCodeId;
	private Integer questionTypeId;
	private String questionType;
	private Date startDate;
	private Date endDate;
	private int questionnaireId;
	private int parentQuestionId;
	private int parentQuestionOpId;
	private int sectionId;
	private int totalScore;
	
	private final List<OptionData> options = new ArrayList<OptionData>();
	
	//incase question had been answered by client Usefull in polls
	
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	private boolean answered;
	
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	public int getOrder() {
		return seqNo;
	}
	public void setOrder(int order) {
		this.seqNo = order;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public boolean isMandatory() {
		return mandatory;
	}
	public void setMandatory(boolean mandatory) {
		this.mandatory = mandatory;
	}
	public Integer getAttrbCodeId() {
		return attrbCodeId;
	}
	public void setAttrbCodeId(Integer attrbCodeId) {
		this.attrbCodeId = attrbCodeId;
	}
	public Integer getQuestionTypeId() {
		return questionTypeId;
	}
	public void setQuestionTypeId(Integer questionTypeId) {
		this.questionTypeId = questionTypeId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public List<OptionData> getOptions() {
		return options;
	}
	
	public void addOption(OptionData option){
		this.options.add(option);
	}

	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}
	public int getQuestionnaireId() {
		return questionnaireId;
	}
	public void setQuestionnaireId(int questionnaireId) {
		this.questionnaireId = questionnaireId;
	}
	public boolean isAnswered() {
		return answered;
	}
	public void setAnswered(boolean answered) {
		this.answered = answered;
	}
	public int getParentQuestionId() {
		return parentQuestionId;
	}
	public void setParentQuestionId(int parentQuestionId) {
		this.parentQuestionId = parentQuestionId;
	}
	public int getParentQuestionOpId() {
		return parentQuestionOpId;
	}
	public void setParentQuestionOpId(int parentQuestionOpId) {
		this.parentQuestionOpId = parentQuestionOpId;
	}
	public int getSectionId() {
		return sectionId;
	}
	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}
}
