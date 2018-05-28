package in.fiinfra.common.common;

public class FaqsQuestionsData{
	private int faqID;
	private int faqModuleID;
	private String faqQuestion;
	private String faqAnswer;
	private int buPartyId;
	private String faqQuestionModuleName;
	
	
	public String getFaqQuestionModuleName() {
		return faqQuestionModuleName;
	}
	public void setFaqQuestionModuleName(String faqsQuestionModuleName) {
		faqQuestionModuleName = faqsQuestionModuleName;
	}
	public int getFaqID() {
		return faqID;
	}
	public void setFaqID(int faqID) {
		this.faqID = faqID;
	}
	public int getFaqModuleID() {
		return faqModuleID;
	}
	public void setFaqModuleID(int faqModuleID) {
		this.faqModuleID = faqModuleID;
	}
	public String getFaqQuestion() {
		return faqQuestion;
	}
	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}
	public int getBuPartyId() {
		return buPartyId;
	}
	public void setBuPartyId(int buPartyId) {
		this.buPartyId = buPartyId;
	}
}