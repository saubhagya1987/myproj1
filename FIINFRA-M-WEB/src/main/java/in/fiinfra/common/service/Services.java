package in.fiinfra.common.service;

public enum Services {

	deleteQuery("deleteQuery"),
	getQueryRecord("getQueryRecord"),
	getQueryList("getQueryList"),
	
	getPicklistValueList("getPicklistValueList"),
	insertQuery("insertQuery"),
	insertQueryComment("insertQueryComment"),
	getUnreadQueryCountList("getUnreadQueryCountList"),
	getDocumentRecord("getDocumentRecord"),
	getAllocatedTeamMemberList("getAllocatedTeamMemberList"),
	getProfileRecord("getProfileRecord"),
	updatePartnerProfile("updatePartnerProfile"),
	getUserForTaggingList("getUserForTaggingList"),
	getPartyName("getPartyName"),
	getCityList("getCityList"),
	getCodeValues("getCodeValues"),  
	addUpdateNote("addUpdateNote"), 
	deleteNote("deleteNote"),
	getListOfNotes("getListOfNotes"),
	updateQueryStatus("updateQueryStatus"),
	addDocument("addDocument"),
	getDocuments("getDocuments"),
	getDocument("getDocument"),
	getFileStoragePath("getFileStoragePath")
	
	;
	
	

	private Services(String value) {
		this.value = value;
	}
	
	private final String value;
	
	@Override
	public String toString() {
		return this.value;
	}
	
	public String getValue(){
		return this.value;
	}
}
