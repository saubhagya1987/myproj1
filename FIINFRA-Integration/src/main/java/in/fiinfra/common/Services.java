package in.fiinfra.common;

public enum Services {

	deleteQuery("deleteQuery"), getQueryRecord("getQueryRecord"), getQueryList(
			"getQueryList"),

	getPicklistValueList("getPicklistValueList"), insertQuery("insertQuery"), insertQueryComment(
			"insertQueryComment"), getUnreadQueryCountList(
			"getUnreadQueryCountList"), getDocumentRecord("getDocumentRecord"), getAllocatedTeamMemberList(
			"getAllocatedTeamMemberList"), getProfileRecord("getProfileRecord"), updatePartnerProfile(
			"updatePartnerProfile"), getUserForTaggingList(
			"getUserForTaggingList"), getPartyName("getPartyName"), getCityList(
			"GET_CITY_LIST"), getCodeValues("getCodeValues"), addUpdateNote(
			"addUpdateNote"), getListOfNotes("getListOfNotes"), updateQueryStatus(
			"updateQueryStatus"), addDocument("addDocument"), getDocuments(
			"getDocuments"), getDocument("getDocument"), getFileStoragePath(
			"getFileStoragePath"), getUserByToken("getUserByToken"), getListOfExpense(
			"getListOfExpense"), addUpdateExpense("addUpdateExpense"), getListOfIncome(
			"getListOfIncome"), addUpdateIncome("addUpdateIncome"), deleteIncome(
			"deleteIncome"), deleteExpense("deleteExpense"), addUpdateGoal(
			"addUpdateGoal"), getListOfGoal("getListOfGoal"), getListOfFaqs(
			"getListOfFaqs"), addUpdatePlans("addUpdatePlans"), getListOfInvestments(
			"getListOfInvestments"), getPlans("getPlans"), getMyFinancials(
			"getMyFinancials"), getAssumption("getAssumption"), getListOfPortfolios(
			"getListOfPortfolios"), getListOfQuestions("getListOfQuestions"), getListOfLoan(
			"getListOfLoan"), getListOfTask("getListOfTask"), saveAnswer(
			"saveAnswer"), getPartyProfile("getPartyProfile"), UPDATE_PARTY_INFO(
			"UPDATE_PARTY_INFO"), getListOfPolls("getListOfPolls"), ADD_PARTY_INFO(
			"ADD_PARTY_INFO"), savePolls("savePolls"), getListOfBroadcast(
			"getListOfBroadcast"), getListOfTestimonials(
			"getListOfTestimonials"), getListOfGupshup("getListOfGupshup"), addGupShupComment(
			"addGupShupComment"), changePassword("changePassword"), get_user_details(

	"get_user_details"), addLike("addLike"), getAchievementScale(
			"getAchievementScale"), getAlerts("getAlerts"), addTestimonial(
			"addTestimonial"), getAlertCount("getAlertCount"), getGupshupById(
			"getGupshupById"), getListOfGupshupIds("getListOfGupshupIds"), getListOfTestimonialIds(
			"getListOfTestimonialIds"), getTestimonialById("getTestimonialById"), getCalenderEvents(
			"getCalenderEvents"), approvePlan("approvePlan"),addUpdateLoan("addUpdateLoan"),deleteLoan("deleteLoan"),
			addUpdateAsset("addUpdateAsset"),deleteAsset("deleteAsset"), deleteDocument("deleteDocument"),
			COMMON_CODE_VALUES("COMMON_CODE_VALUES"),
			GET_CODE_VALUES_FOR_PARENTID("GET_CODE_VALUES_FOR_PARENTID"), getFamilymembers("getFamilymembers"),
			getProducts("getProducts"),getFinancialAccounts("getFinancialAccounts"),saveAccount("saveAccount"),getAsset(
					"getAsset"),ADD_TASK_URL("ADD_TASK_URL"),
					getFinancialStatusList("getFinancialStatusList"),
					URL_GET_ISSUERID("URL_GET_ISSUERID"),
					userAccessLog("userAccessLog"), deleteFamilyMembers("deleteFamilyMembers"),GET_GET_SYNC_DATA("GET_GET_SYNC_DATA"),
					Register_By_Username("Register_By_Username"),activate("activate"),confirmToken("confirmToken"),
					getSessionUserByToken("getSessionUserByToken"),saveSync("saveSync")
					;
			

	private Services(String value) {
		this.value = value;
	}

	private final String value;

	@Override
	public String toString() {
		return this.value;
	}

	public String getValue() {
		return this.value;
	}
}
