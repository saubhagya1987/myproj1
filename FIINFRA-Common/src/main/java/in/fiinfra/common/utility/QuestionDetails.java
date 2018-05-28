package in.fiinfra.common.utility;

import java.util.List;

public class QuestionDetails {
	private String questionId;
	private String question;
	private Integer questionType;
	private  Integer parentQuestion;
	private Integer masterParent;
	private Integer seqNo;
	private Integer optionId;
	private String option;
	private Double score;
	private Integer event;
	private Integer counter;
	private Integer sectionType;
	private String attributeValue;
	private int attributeCodeId;
	private String IsMandatory;
	private String attributeRefferenceValue;
	private int dob;
	private String profile;
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getAttributeRefferenceValue() {
		return attributeRefferenceValue;
	}
	public void setAttributeRefferenceValue(String attributeRefferenceValue) {
		this.attributeRefferenceValue = attributeRefferenceValue;
	}
	
	
	public String getIsMandatory() {
		return IsMandatory;
	}
	public void setIsMandatory(String isMandatory) {
		IsMandatory = isMandatory;
	}
	public int getAttributeCodeId() {
		return attributeCodeId;
	}
	public void setAttributeCodeId(int attributeCodeId) {
		this.attributeCodeId = attributeCodeId;
	}
	private List<QuestionDetails> dependatantList;
	public String getAttributeValue() {
		return attributeValue;
	}
	public List<QuestionDetails> getDependatantList() {
		return dependatantList;
	}
	public void setDependatantList(List<QuestionDetails> dependatantList) {
		this.dependatantList = dependatantList;
	}
	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}
	public Integer getSectionType() {
		return sectionType;
	}
	public void setSectionType(Integer sectionType) {
		this.sectionType = sectionType;
	}
	public Integer getCounter() {
		return counter;
	}
	public void setCounter(Integer counter) {
		this.counter = counter;
	}
	public Integer getEvent() {
		return event;
	}
	public void setEvent(Integer event) {
		this.event = event;
	}
	private String partyStage;
	private String status;
	private String submitedDate;
	private int entityStage;
	
	public int getEntityStage() {
		return entityStage;
	}
	public void setEntityStage(int entityStage) {
		this.entityStage = entityStage;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Integer getQuestionType() {
		return questionType;
	}
	public void setQuestionType(Integer questionType) {
		this.questionType = questionType;
	}
	public Integer getParentQuestion() {
		return parentQuestion;
	}
	public void setParentQuestion(Integer parentQuestion) {
		this.parentQuestion = parentQuestion;
	}
	public Integer getMasterParent() {
		return masterParent;
	}
	public void setMasterParent(Integer masterParent) {
		this.masterParent = masterParent;
	}
	public Integer getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(Integer seqNo) {
		this.seqNo = seqNo;
	}
	public Integer getOptionId() {
		return optionId;
	}
	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getPartyStage() {
		return partyStage;
	}
	public void setPartyStage(String partyStage) {
		this.partyStage = partyStage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSubmitedDate() {
		return submitedDate;
	}
	public void setSubmitedDate(String submitedDate) {
		this.submitedDate = submitedDate;
	}
	public int getDob() {
		return dob;
	}
	public void setDob(int dob) {
		this.dob = dob;
	}
	
	
}
