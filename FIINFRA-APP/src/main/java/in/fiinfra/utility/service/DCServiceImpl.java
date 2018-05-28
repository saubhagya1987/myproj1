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
import in.fiinfra.partner.dao.PartnerDao;
import in.fiinfra.utility.dao.DCDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DCServiceImpl implements DCService{
	@Autowired
	private DCDao dcDao;

	public DCDao getDcDao() {
		return dcDao;
	}

	public void setDcDao(DCDao dcDao) {
		this.dcDao = dcDao;
	}

	@Override
	public OpportunityData getDCPersonalInformationDetails(int partyId, int buId) {
		OpportunityData opportunityData=dcDao.getDCPersonalInformationDetails(partyId,buId);
		return opportunityData;
	}

	@Override
	public List updateDCPersonalInformationRecord(String dataXml, int buId,
			int partyId, int lastModifiedBy) {
		List recordCountList=dcDao.updateDCPersonalInformationRecord(dataXml,buId,partyId,lastModifiedBy);
		return recordCountList;
	}

	@Override
	public List<GoalData> getDCFutureFinancialExpectationsList(int partyId, int buId) {
		List<GoalData> goalDataList=dcDao.getDCFutureFinancialExpectationsList(partyId,buId);
		return goalDataList;
	}

	@Override
	public int updateDCFutureFinancialExpectationsList(String dataXml,
			int buId, int partyId, int lastModifiedBy) {
		Integer recordCount=dcDao.updateDCFutureFinancialExpectationsList(dataXml,buId,partyId,lastModifiedBy);
		return recordCount;
	}
	
	@Override
	public int insertDcFinancialStatusRecord(int partyId,int buId,String XMlString,int questionBankId,int sectionTypeId)
	{
		Integer recordCount=dcDao.insertDcFinancialStatusRecord(partyId,buId,XMlString,questionBankId,sectionTypeId);
		return recordCount;
	}
	@Override
	public  List<QuestionDetails> getFinancialStatusList(int partyId,int buId,int sectionTypeId)
	{
		 List<QuestionDetails> lstQuestionDetails = dcDao.getFinancialStatusList(partyId,buId,sectionTypeId);
		return lstQuestionDetails;
	}

	public  List<UserData> getFamilyMemberList(int partyId,int buId)
	{
		 List<UserData> lstQuestionDetails = dcDao.getFamilyMemberList(partyId,buId);
		return lstQuestionDetails;
	}
	@Override
	public int submitDcInput(int partyId,int buId, int lastModifiedBy,boolean isAnalysisReportGenration,boolean isActionPlanGeneration,int analysisReportType)
	{
		Integer recordCount=dcDao.submitDcInput(partyId,buId,lastModifiedBy,isAnalysisReportGenration,isActionPlanGeneration,analysisReportType);
		return recordCount;
	}
	 public String[] displayCashFlowBar(int partyId,int buId)
	 {
		String[] cash= dcDao.displayCashFlowBar(partyId,buId);
		return cash;
	 }
	 
	 public  DCOutputData showAnalysisReportPDF(int partyId,int buId,int createdBy)
	 {
		 DCOutputData output = dcDao.showAnalysisReportPDF(partyId, buId, createdBy);
		 return output;
	 }
	 public SectionData checkMinimumDataForAnalysisReport(int partyId,int buId,int createdBy)
	 {
		 SectionData sectionData = dcDao.checkMinimumDataForAnalysisReport(partyId, buId, createdBy);
		 return sectionData;
	 }
	 public List<Integer> getSectionsToShowInDC(int partyId,int buId)
	 {
		 List<Integer> lstPartyAttributeData = dcDao.getSectionsToShowInDC(partyId, buId);
		 return lstPartyAttributeData;
	 }

	@Override
	public List<String> getLIForAllMethods(int partyId, int buId) {
		return dcDao.getLIForAllMethods(partyId, buId);
	}

	@Override
	public Integer updateLIMethod(int partyId, int buId, int liMethodSelect,
			int lastModifiedBy) {
		return dcDao.updateLIMethod(partyId, buId,liMethodSelect,lastModifiedBy);
	}

	@Override
	public DCOutputData getComprehensiveReportPDF(int partyId, int buId,int createdBy)
	{
		DCOutputData output = dcDao.getComprehensiveReportPDF(partyId, buId, createdBy);
		return output;
	}
}
