package in.fiinfra.common.service.vo;
public class FaqList {
	private String faqId;
	private String faqQuestionText;
	private String faqAnswerText;
	private String lastModifiedDate;
	private String userName;
	private String lastName;
	private String codeValue;
	private String faqModuleID;
	private String buPartyID;
	private int deleteFaq;
	private int createdBy;
	private String searchText;
	private String deleteList; 
	private String sourceID;
	private Integer partyID;
	
	
	
	
	
		public Integer getPartyID() {
		return partyID;
	}
	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}
		public String getSourceID() {
		return sourceID;
	}
	public void setSourceID(String sourceID) {
		this.sourceID = sourceID;
	}
		public String getDeleteList() {
		return deleteList;
	}
	public void setDeleteList(String deleteList) {
		this.deleteList = deleteList;
	}
		public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
		public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
		private int buId;
	
	
	public int getBuId() {
			return buId;
		}
		public void setBuId(int buId) {
			this.buId = buId;
		}
	public int getDeleteFaq() {
		return deleteFaq;
	}
	public void setDeleteFaq(int deleteFaq) {
		this.deleteFaq = deleteFaq;
	}
	public String getFaqModuleID() {
		return faqModuleID;
	}
	public void setFaqModuleID(String faqModuleID) {
		this.faqModuleID = faqModuleID;
	}
	public String getBuPartyID() {
		return buPartyID;
	}
	public void setBuPartyID(String buPartyID) {
		this.buPartyID = buPartyID;
	}
	public String getFaqId() {
		return faqId;
	}
	public void setFaqId(String faqId) {
		this.faqId = faqId;
	}
	public String getFaqQuestionText() {
		return faqQuestionText;
	}
	public void setFaqQuestionText(String faqQuestionText) {
		this.faqQuestionText = faqQuestionText;
	}
	public String getFaqAnswerText() {
		return faqAnswerText;
	}
	public void setFaqAnswerText(String faqAnswerText) {
		this.faqAnswerText = faqAnswerText;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}
	
	
	
}
