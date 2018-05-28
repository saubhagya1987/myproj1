package in.fiinfra.utility.service;

import java.util.List;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.common.SectionSpecificDcData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.utility.DCOutputData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.SectionData;


public interface DCService {

	OpportunityData getDCPersonalInformationDetails(int partyId, int buId);

	List updateDCPersonalInformationRecord(String dataXml, int buId,
			int partyId, int lastModifiedBy);
	int insertDcFinancialStatusRecord(int partyId,int buId,String XMlString,int questionBankId,int sectionTypeId);
	 List<QuestionDetails> getFinancialStatusList(int partyId,int buId,int sectionTypeId);
	List<GoalData> getDCFutureFinancialExpectationsList(int partyId, int buId);
	int updateDCFutureFinancialExpectationsList(String dataXml, int buId,
			int partyId, int lastModifiedBy);
	List<UserData> getFamilyMemberList(int partyId,int buId);
	int submitDcInput(int partyId,int buId, int lastModifiedBy,boolean isAnalysisReportGenration,boolean isActionPlanGeneration,int analysisReportType);
	 String [] displayCashFlowBar(int partyId,int buId);
	 DCOutputData showAnalysisReportPDF(int partyId,int buId,int createdBy);
	 SectionData checkMinimumDataForAnalysisReport(int partyId,int buId,int createdBy);
	 List<Integer> getSectionsToShowInDC(int partyId,int buId);
	List<String> getLIForAllMethods(int partyId, int buId);
	Integer updateLIMethod(int partyId, int buId, int liMethodSelect,
			int lastModifiedBy);
	DCOutputData getComprehensiveReportPDF(int partyId,int buId,int createdBy);
}
