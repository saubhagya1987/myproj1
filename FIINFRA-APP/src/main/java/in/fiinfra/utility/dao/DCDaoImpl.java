package in.fiinfra.utility.dao;

import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.common.SectionSpecificDcData;
import in.fiinfra.common.common.TagData;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.GoalAttribute;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.common.utility.DCOutputData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.common.utility.SectionData;
import in.fiinfra.util.DataSourceProvider;

import java.math.BigDecimal;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Component;

import com.thoughtworks.xstream.alias.ClassMapper.Null;

@Component
public class DCDaoImpl implements DCDao {
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	private static final Logger logger = Logger.getLogger(DCDaoImpl.class);
	private static final String SP_RETRIVE_SECTIONS_TO_SHOW_IN_DC = "{CALL usp_pp_DC_getSectionsToShowInDC(?)}";

	@Override
	public OpportunityData getDCPersonalInformationDetails(int partyId, int buId) {
		OpportunityData opportunityData = new OpportunityData();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData = new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_INP_getPersonalInformation");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		// personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				opportunityData.setSalutationID((int) row.get("salutationid"));
				opportunityData.setName((String) row.get("Name"));
				opportunityData.setPanNo((String) row.get("panno"));
				opportunityData.setContactMobile((String) row
						.get("contactmobile"));
				opportunityData.setContactEmail((String) row
						.get("contactemail"));
				opportunityData.setDob((String) row.get("DOB"));
				opportunityData.setOccupation((String) row.get("occupation"));
				opportunityData.setOrganization((String) row
						.get("organization"));
				opportunityData.setExperience((int) row.get("experience"));
				opportunityData.setPhoto((String) row.get("photo"));
				opportunityData.setSpouseName((String) row.get("SpouseName"));
				opportunityData.setSpouseDob((String) row.get("SpouseDOB"));
				opportunityData.setSpouseAge((int) row.get("SpouseAge"));
				opportunityData.setMotherName((String) row.get("MotherName"));
				opportunityData.setMotherDob((String) row.get("MotherDOB"));
				opportunityData.setMotherAge((int) row.get("MotherAge"));
				opportunityData.setFatherName((String) row.get("FatherName"));
				opportunityData.setFatherDob((String) row.get("FatherDOB"));
				opportunityData.setFatherAge((int) row.get("FatherAge"));
				opportunityData.setMotherInLawName((String) row
						.get("MotherInLawName"));
				opportunityData.setMotherInLawDob((String) row
						.get("MotherInLawDOB"));
				opportunityData.setMotherInLawAge((int) row
						.get("MotherInLawAge"));
				opportunityData.setFatherInLawName((String) row
						.get("FatherInLawName"));
				opportunityData.setFatherInLawDob((String) row
						.get("FatherInLawDOB"));
				opportunityData.setFatherInLawAge((int) row
						.get("FatherInLawAge"));

				opportunityData.setHuf((String) row.get("hufName"));
				opportunityData.setHufDob((String) row.get("hufDOB"));
				opportunityData.setHufAge((int) row.get("hufAge"));

				//System.out.println("HUF=" + opportunityData.getHuf());

			}
		}
		List<FamilyMemberData> familyMemberDataList = new ArrayList<>();
		FamilyMemberData familyMemberData;
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				familyMemberData = new FamilyMemberData();
				familyMemberData.setFirstName((String) row.get("firstName"));
				familyMemberData.setLastName((String) row.get("lastName"));
				familyMemberData.setAge((int) row.get("Age"));
				familyMemberData.setPanNo((String) row.get("panNo"));
				familyMemberData.setDob((String) row.get("DOB"));
				familyMemberData.setRelationshipId((int) row
						.get("relationshipid"));
				familyMemberData.setFamilyType((String) row.get("FamilyType"));
				familyMemberData.setPartyId((int) row.get("partyId"));
				familyMemberData.setWorkProfession((String) row.get("workProfession"));
				familyMemberDataList.add(familyMemberData);
			}
		}
		List<CodeValueData> OccupationList = new ArrayList<CodeValueData>();
		CodeValueData codeValueData;
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				codeValueData = new CodeValueData();
				codeValueData.setCodeValue((String) row.get("codevalue"));
				codeValueData.setCodeValueId((int) row.get("codevalueid"));
				OccupationList.add(codeValueData);
			}
		}
		opportunityData.setFamilyMemberDataList(familyMemberDataList);
		opportunityData.setOccupationList(OccupationList);
		return opportunityData;
	}

	@Override
	public List updateDCPersonalInformationRecord(String dataXml, int buId,
			int partyId, int lastModifiedBy) {
		int recordCount = 0;
		int isPanExist = 0;
		int isFamilyMemberPresent=0;
		List returnResultList = new ArrayList<Integer>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData = new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_INP_savePersonalInformation");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter dataXmlParam = new SqlParameter("dataXml", Types.VARCHAR);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy",
				Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",
				Types.VARCHAR);
		SqlOutParameter isPanExistParam = new SqlOutParameter("isPanExist",
				Types.INTEGER);
		SqlOutParameter isFamilyMemberPresentParam = new SqlOutParameter("isFamilyMemberPresent",
				Types.INTEGER);
		logger.debug("dataXml:--" + dataXml);
		SqlParameter[] paramArray = { partyIdParam, dataXmlParam,
				lastModifiedByParam, recordCountParam, isPanExistParam  , isFamilyMemberPresentParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("dataXml", dataXml);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount = Integer.parseInt(storedProcResult.get("recordCount")
				.toString());
		isPanExist = Integer.parseInt(storedProcResult.get("isPanExist")
				.toString());
		isFamilyMemberPresent=Integer.parseInt(storedProcResult.get("isFamilyMemberPresent")
				.toString());
		logger.info("recordCount:---" + recordCount);
		//System.out.println("isPanExist:---" + isPanExist);
		//System.out.println("isFamilyMemberPresent-------"+isFamilyMemberPresent);
		
		logger.info("isPanExist:---" + isPanExist);
		logger.info("isFamilyMemberPresent:---" + isFamilyMemberPresent);
		returnResultList.add(recordCount);
		returnResultList.add(isPanExist);
		returnResultList.add(isFamilyMemberPresent);
		return returnResultList;
	}

	public Integer insertDcFinancialStatusRecord(int partyId, int buId,
			String XMlString, int questionBankId, int sectionTypeId) {
		//System.out.println("XMlString in App Dao Impl===" + XMlString);
		int recordCount = 0;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData = new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_INP_saveCurrentFinancialStatus");
		SqlParameter partyIdParam = new SqlParameter("partyid", Types.INTEGER);
		SqlParameter userIdParam = new SqlParameter("userId", Types.INTEGER);
		SqlParameter questionBankIdParam = new SqlParameter("questionBankId",
				Types.INTEGER);
		SqlParameter sectionTypeIdParam = new SqlParameter("sectionTypeId",
				Types.INTEGER);
		SqlParameter xmlStringParam = new SqlParameter("xmlString",
				Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",
				Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam, userIdParam,
				questionBankIdParam, sectionTypeIdParam, xmlStringParam,
				recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyid", partyId);
		paranValues.put("userId", 1);
		paranValues.put("questionBankId", questionBankId);
		paranValues.put("sectionTypeId", sectionTypeId);
		paranValues.put("xmlString", XMlString);
		logger.info("-----------Before Calling SP In APP(insertDcFinancialStatusRecord)-----------");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		logger.info("-----------Before Calling SP In APP(insertDcFinancialStatusRecord)-----------");
		recordCount = Integer.parseInt(storedProcResult.get("recordCount")
				.toString());
		logger.info("recordCount:---" + recordCount);
		return recordCount;

	}

	public List<QuestionDetails> getFinancialStatusList(int partyId, int buId,
			int sectionTypeId) {
		QuestionDetails questionDetails;
		List<QuestionDetails> questionList = new ArrayList<QuestionDetails>();
		List<QuestionDetails> dependantList = new ArrayList<QuestionDetails>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_INP_getCurrentFinancialStatus");
		SqlParameter partyIdParam = new SqlParameter("partyid", Types.INTEGER);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter sectionTypeIdParam = new SqlParameter("sectionTypeId",
				Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam, buIdParam,
				sectionTypeIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyid", partyId);
		paranValues.put("buId", buId);
		paranValues.put("sectionTypeId", sectionTypeId);
		//System.out.println("paranValues:--" + paranValues);
		logger.info("-----------Before Calling SP In APP(getFinancialStatusList)-----------");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		// personal details
		logger.info("-----------After Calling SP In APP(getFinancialStatusList)-----------");
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.info("-----------Before Mapping In APP(getFinancialStatusList)-----------");
		if (l != null) {
			for (Map<String, Object> row : l) {
				questionDetails = new QuestionDetails();
				// opportunityData.setSalutationID((int)
				// row.get("salutationid"));
				questionDetails.setQuestionId((String) row.get("questionId"));
				questionDetails.setAttributeValue((String) row
						.get("AttributeValue"));
				questionDetails
						.setQuestionType((int) row.get("QuestionTypeID"));
				questionDetails.setSectionType((int) row.get("sectiontypeid"));
				questionDetails.setAttributeCodeId((int) row
						.get("AttributeCodeID"));
				questionDetails
						.setIsMandatory((String) row.get("IsMandatory"));
				questionDetails.setAttributeRefferenceValue((String) row
						.get("AttributeReferenceValue"));
				// questionDetails.setDob((int) row.get("DOB"));
				questionDetails.setProfile((String) row.get("profile"));
				questionList.add(questionDetails);
			}

		}
		logger.info("-----------After Mapping In APP(getFinancialStatusList)-----------");
		// questionDetails.setDependatantList(dependantList);
		return questionList;
	}

	@Override
	public List<GoalData> getDCFutureFinancialExpectationsList(int partyId,
			int buId) {
		List<GoalData> goalDataList = new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData = new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_INP_getFutureFinancialExpectation");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		// personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		GoalData goalData;
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalData = new GoalData();
				goalData.setGoalTypeId((int) row.get("goaltypeid"));
				goalData.setGoalDescription((String) row.get("goaldescription"));
				goalData.setGoalEndYear((int) row.get("goalendyear"));
				goalData.setGoalAmountPv(((BigDecimal) row.get("goalamountpv"))
						.toString());
				goalData.setGoalFamilyPartyId((int) row
						.get("goalfamilypartyid"));
				goalData.setGoalInflationRate((String) row.get("inflationRate"));
				goalData.setGoalMonth((int) row.get("goalMonth"));
				goalData.setIsAllocateAsset((int) row.get("isAllocateAsset"));
				goalDataList.add(goalData);
			}
		}
		return goalDataList;
	}

	@Override
	public Integer updateDCFutureFinancialExpectationsList(String dataXml,
			int buId, int partyId, int lastModifiedBy) {
		int recordCount = 0;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData = new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_INP_saveFutureFinancialExpectation");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter dataXmlParam = new SqlParameter("dataXml", Types.VARCHAR);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy",
				Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",
				Types.VARCHAR);
		logger.debug("dataXml:--" + dataXml);
		SqlParameter[] paramArray = { partyIdParam, dataXmlParam,
				lastModifiedByParam, recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("dataXml", dataXml);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount = Integer.parseInt(storedProcResult.get("recordCount")
				.toString());
		logger.info("recordCount:---" + recordCount);
		return recordCount;
	}

	public List<UserData> getFamilyMemberList(int partyId, int buId) {
		UserData userData;
		List<UserData> userList = new ArrayList<UserData>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_INP_getFamilyMemberList");
		SqlParameter partyIdParam = new SqlParameter("PartyId", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("PartyId", partyId);

		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		if (l != null) {
			for (Map<String, Object> row : l) {
				userData = new UserData();
				// opportunityData.setSalutationID((int)
				// row.get("salutationid"));
				userData.setPartyId((int) row.get("partyid"));
				userData.setName((String) row.get("Name"));
				userList.add(userData);
			}

		}
		return userList;
	}

	public Integer submitDcInput(int partyId, int buId, int lastModifiedBy,
			boolean isAnalysisReportGenration, boolean isActionPlanGeneration,int analysisReportType) {
		int recordCount = 0;

		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_SubmitDCTool");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy",
				Types.INTEGER);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter isAnalysisReportGenrationParam = new SqlParameter(
				"isAnalysisReportGenration", Types.BOOLEAN);
		SqlParameter isActionPlanGenerationParam = new SqlParameter(
				"isActionPlanGeneration", Types.BOOLEAN);
		SqlParameter analysisReportTypeParam = new SqlParameter(
				"analysisReportType", Types.INTEGER);

		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",
				Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam, lastModifiedByParam,
				buIdParam, isAnalysisReportGenrationParam,
				isActionPlanGenerationParam,analysisReportTypeParam, recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		paranValues.put("buId", buId);
		paranValues.put("isAnalysisReportGenration", isAnalysisReportGenration);
		paranValues.put("isActionPlanGeneration", isActionPlanGeneration);
		paranValues.put("analysisReportType", analysisReportType);

		System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount = Integer.parseInt(storedProcResult.get("recordCount")
				.toString());
		logger.info("recordCount:---" + recordCount);
		return recordCount;
	}

	public String[] displayCashFlowBar(int partyId, int buId) {
		String[] cashArray = null;
		String cash = null;

		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		// List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_displayCashFlowBar");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlOutParameter futurePotentialCorpusParam = new SqlOutParameter(
				"futurePotentialCorpus", Types.VARCHAR);

		SqlParameter[] paramArray = { partyIdParam, futurePotentialCorpusParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);

		//System.out.println("==========="+ storedProcResult.get("futurePotentialCorpus"));
		if (storedProcResult.get("futurePotentialCorpus") != null) {
			cash = storedProcResult.get("futurePotentialCorpus").toString();
			cashArray = cash.split(":");
		}

		return cashArray;
	}

	public DCOutputData showAnalysisReportPDF(int partyId, int buId,
			int createdBy) {
		DCOutputData output = new DCOutputData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		Map<String, String> rating = null;
		Map<String, String> succession = null;
		List<String> emergenciesFaced = new ArrayList<String>();
		List<GoalData> goalDataList = new ArrayList<>();
		List<ProductData> productDataList = new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		// List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_GetDCOutput");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:showAnalysisReportPDF---"
				+ storedProcResult);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		if (l != null) {
			for (Map<String, Object> row : l) {

				// opportunityData.setSalutationID((int)
				// row.get("salutationid"));
				output.setSaving((String) row.get("Saving"));
				output.setPotentialSaving((String) row.get("PotentialSaving"));
				output.setFuturePotentialCorpus((String) row
						.get("FuturePotentialCorpus"));
				output.setCurrentEmergencyFund((String) row
						.get("CurrentEmergencyFund"));
				output.setCurrentInsurance((String) row.get("CurrentInsurance"));
				if ((String) row.get("CurrentHealthInsurance") == null) {
					output.setCurrentHealthInsurance("0");
				} else {
					output.setCurrentHealthInsurance((String) row
							.get("CurrentHealthInsurance"));
				}
				output.setCurrentCriticalIllnesCoverAmout((String) row
						.get("currentCriticalIllnesCoverAmout"));

				if ((String) row.get("CurrentHealthInsurance") == null) {
					output.setCurrentpersonalInsuranceCoverAmt("0");
				} else {
					output.setCurrentpersonalInsuranceCoverAmt((String) row
							.get("currentpersonalInsurance"));
				}

				output.setIdealInsurance((String) row.get("IdealInsurance"));
				output.setNecessaryInsurance((String) row
						.get("necessaryInsurance"));
				output.setRetirementNeed((String) row
						.get("RetirementCorpusNeeded"));
				output.setRetirementCorpusAccumulation((String) row
						.get("RetirementCorpusAccumulation"));
				output.setMinimumEmergencyFund((String) row
						.get("MinimumEmergencyFund"));
				output.setIdealEmergencyFund((String) row
						.get("IdealEmergencyFund"));
				output.setSpouseName((String) row.get("SpouseName"));
				output.setCriticalIllnessInsurance((String) row
						.get("MinimumCriticalIllnessInsurance"));
				output.setAccidentInsurance((String) row
						.get("MinimumAccidentInsurance"));
				output.setPercentGoalReachable((int) row
						.get("PercentGoalReachable"));
				output.setRegularInvestmentRetirement((String) row
						.get("RegularInvestmentRetirement"));
				output.setRetirementLumpsum((String) row
						.get("RetirementLumpsum"));
				output.setLoanEmiPercentage((Integer) row
						.get("loanEmiPercentage"));
				output.setIncome((String) row.get("income"));
				output.setCurrentRegularInvestmentRetirement((String) row
						.get("CurrentRegularInvestmentRetirement"));
				output.setOpportunityName((String) row.get("LeadName"));
				//System.out.println("opportunity Name in Dao impl==="+ output.getOpportunityName());
				output.setSalutation((String) row.get("Salutation"));
				output.setSavingPlusExpensePercentage((String) row
						.get("SavingPlusExpensePercentage"));
				output.setFutureMonthlyExpenses((String) row
						.get("FutureMonthlyExpenses"));
				output.setMonthlyExpenses((String) row.get("MonthlyExpenses"));
				output.setPartyId((String) row.get("partyId"));
				output.setHealthInsuranceCoverAmount((String) row
						.get("Health_Insurance_Cover_Amount"));
				output.setInflationRate((String) row.get("Inflation_Rate"));
				output.setExpectedReturnOnExistingInvestment((String) row
						.get("Expected_Return_on_Existing_Investment"));
				output.setExpectedReturnOnNewInvestment((String) row
						.get("Expected_Return_on_New_Investment"));
				output.setEmergencyFundsRequiredMonths((String) row
						.get("Emergency_Funds_Required_Months"));
				output.setExpectedGrowthRateForRetirementGoalInvestments((String) row
						.get("Expected_Growth_Rate_For_Retirement_Goal_Investments"));
				output.setExpectedGrowthRateForGoalsLessOrEqualThree((String) row
						.get("Expected_Growth_Rate_For_Goals_Less_Or_Equal_Three"));
				output.setExpectedGrowthRateForGoalsGreaterThanThree((String) row
						.get("Expected_Growth_Rate_For_Goals_Greater_Than_Three"));
				// userData.setName((String) row.get("Name"));
				// userList.add(userData);
			}
		}
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		//System.out.println("l:--" + l);
		if (l != null) {
			rating = new HashMap<String, String>();
			for (Map<String, Object> row : l) {
				rating.put((String) row.get("SectiontypeId"),
						(String) row.get("Rating"));
			}
		}
		//System.out.println("rating:::" + rating.get("Cashflow"));
		output.setRatings(rating);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		//System.out.println("l:--" + l);
		if (l != null) {

			for (Map<String, Object> row : l) {
				output.setCurrentYear((int) row.get("CurrentYear"));
				output.setRetirementYear((String) row.get("RetiremntYear"));
			}
		}
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		GoalData goalData;
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalData = new GoalData();
				goalData.setGoalFamilyPartyId((int) row
						.get("goalfamilypartyid"));
				goalData.setFpGoalId((int) row.get("goleType"));
				goalData.setGoalDescription((String) row.get("goalDescription"));
				goalData.setDescription((String) row.get("TodaysCost"));
				goalData.setGoalAmountPv((String) row.get("GoalAmountPV"));
				goalData.setStartYear((String) row.get("CurrentYear"));
				goalData.setGoalEndYear((int) row.get("GoalYear"));
				goalData.setPercentGoalReachable((int) row
						.get("PercentOfGoalReachable"));
				goalData.setRegularInvestment((String) row
						.get("RegularInvestment"));
				goalData.setFutureValueOfAssets((String) row
						.get("FutureValueOfAssets"));
				goalData.setFutureValueOfGoal((String) row.get("FutureValue"));
				goalData.setCurrentValue((String) row.get("CurrentValue"));
				goalData.setGoalTypeId((int) row.get("goleType"));
				goalData.setGoalPV((String) row.get("goalLumpsum"));
				goalData.setLoanTakenOrNot((String) row.get("isLoan"));

				goalDataList.add(goalData);
			}
		}
		// output.setGoalList(goalDataList);
		output.setGoalList(goalDataList);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		succession = new HashMap<String, String>();
		if (l != null) {
			for (Map<String, Object> row : l) {
				succession.put((String) row.get("Succession"),
						(String) row.get("Name"));
			}
		}
		output.setSuccession(succession);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-6");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setPartnerName((String) row.get("PartnerName"));
				output.setPartnerPhone((String) row.get("contactmobile"));
				output.setPartnerEmail((String) row.get("contactemail"));
				output.setPartnerLogo((String) row.get("logo"));
				output.setLogoWidth((Integer) row.get("logoWidth"));
				output.setLogoHeight((Integer) row.get("logoHeight"));
				output.setBuLogo((String) row.get("BUPFLogo"));
				output.setPartnerAddress((String) row.get("street"));
				output.setPartnerCity((String) row.get("City"));
				output.setPostalCode((String) row.get("PostalCode"));
				output.setSaving(String.valueOf((Integer)row.get("InsuranceMethod")));

			}
		}
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-7");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setScore((int) row.get("Score"));
				output.setProfile((String) row.get("Profile"));

			}
		}

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-8");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setEmergencyRselectedQuestion((String) row
						.get("emergencymonth"));
				output.setHealthInsurance((String) row.get("healthInsurance_"));
				output.setHealthInsuranceAdqueteAmat((String) row
						.get("healthInsuranceAdqueteAmat"));
				output.setCurrentHealthInsuranceCoveAmtisGreater((String) row
						.get("isCurrentHealthInsuranceCoveAmtisGreater"));
				output.setCurrentLIInsuranceCoveAmtisGreater((String) row
						.get("isCurrentLIInsuranceCoveAmtisGreater"));
				output.setCurrentCriticalInsuranceCoveAmtisGreater((String) row
						.get("isCurrentCriticalInsuranceCoveAmtisGreater"));
				output.setCriticalIllNessInsuranceAdqueteAmat((String) row
						.get("CriticalIllNessInsuranceAdqueteAmat"));
				output.setPersonalAcdntInsuranceCoveAmtisGreater((String) row
						.get("ispersonalAcdntInsuranceCoveAmtisGreater"));
				output.setPersonalAcdntInsuranceAdqueteAmat((String) row
						.get("personalAcdntInsuranceAdqueteAmat"));
				output.setAssetHouseholdInsuranceCoveredorNot((String) row
						.get("assetHouseholdInsuranceCoveredorNot"));
				output.setRiskFlagColor((String) row.get("isFlag"));
				output.setAge((int) row.get("opportunityage"));
				output.setIsplanToTakeLoan((int) row.get("isPlanToTakeLoan"));
				output.setIsLoanTaken((int) row.get("isLoanTaken"));
				output.setMonthlyEmi((String) row.get("monthlyEmi"));
				output.setSalaryIncome((String) row.get("salaryIncome").toString());
				output.setSurplus((String) row.get("surplus"));

			}
		}

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-9");
		if (l != null) {
			for (Map<String, Object> row : l) {
				// output.setem((int) row.get("Score"));
				output.setIsGoalAchivementOrInvestmentIsZero((String) row
						.get("isGoalAchivementOrInvestmentIsZero"));
				output.setTotalRegularInvestmentFromGoals((String) row
						.get("totalRegularInvestmentFromGoals"));
				output.setSumOfCurrentRegInvAndRetirment((String) row
						.get("sumOfCurrentRegInvAndRetirment"));
				output.setRetirmenrShortfallAmt((String) row
						.get("retirmenrShortfallAmt"));
				output.setIsWillPrepared((String) row.get("isWillPrepared"));
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-10");
		ProductData productData;
		if (l != null) {
			for (Map<String, Object> row : l) {
				productData = new ProductData();
				productData.setProductName((String) row.get("productName"));
				productData.setMinLumpSumAmount((String) row.get("minLumpSumAmount"));
				productData.setMinSipAmount((String) row.get("minSipAmount"));
				productDataList.add(productData);
			}
		}
		output.setRetirementList(productDataList);
		
		myStoredProcedure = new CommonStoredProcedure(jdbcTemplate,
				"usp_pp_DC_displayMeterGuage");
		SqlParameter partyIdParam1 = new SqlParameter("partyId", Types.INTEGER);
		SqlOutParameter slabsStr = new SqlOutParameter("slabsStr",
				Types.VARCHAR);
		SqlOutParameter arrowStr = new SqlOutParameter("arrowStr",
				Types.VARCHAR);
		SqlParameter[] paramArray1 = { partyIdParam, slabsStr, arrowStr };

		myStoredProcedure.setParameters(paramArray1);
		myStoredProcedure.compile();
		Map<String, Object> paranValues1 = new HashMap<String, Object>();
		paranValues1.put("partyId", partyId);
		Map<String, Object> storedProcResult1 = myStoredProcedure
				.execute(paranValues1);

		// if(storedProcResult1.get("slabsStr")!=null){
		// cash=storedProcResult.get("futurePotentialCorpus").toString();
		output.setMeterGaugeStr1(storedProcResult1.get("slabsStr").toString());
		output.setMeterGaugeStr2(storedProcResult1.get("arrowStr").toString());

		/*System.out.println("  slabs str::" + output.getMeterGaugeStr1()
				+ " arrow str :" + output.getMeterGaugeStr2());*/
		return output;
	}

	public SectionData checkMinimumDataForAnalysisReport(int partyId, int buId,
			int createdBy) {
		SectionData sectionData = new SectionData();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_checkMinimumDataPF");
		SqlParameter partyIdParam = new SqlParameter("PartyId", Types.INTEGER);
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam, buIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("PartyId", partyId);
		paranValues.put("buId", buId);

		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		if (l != null) {
			for (Map<String, Object> row : l) {

				// opportunityData.setSalutationID((int)
				// row.get("salutationid"));
				sectionData.setGoalCount((int) row.get("goalCount"));
				sectionData.setRetirmentAge((String) row.get("retirmentAge"));
				sectionData.setCashflowIncomeValue((String) row
						.get("cashflow_income_Value"));
				sectionData.setCashflowExpenditureValue((String) row
						.get("cashflow_expenditure_Value"));
				sectionData.setEmergencyIncomeOption((String) row
						.get("emergency_income_option"));
				sectionData.setCount((int) row.get("Riskcount"));
				sectionData.setIsPersonalInfoFilled((int) row
						.get("isPersonalInfoFilled"));
			}

		}
		return sectionData;
	}

	public List<Integer> getSectionsToShowInDC(int partyId, int buId) {
		// PartyAttributeData partyAttributeData = new PartyAttributeData();
		// PartyAttributeData objPartyAttributeData=
		// jdbcTemplate.queryForObject(SP_RETRIVE_SECTIONS_TO_SHOW_IN_DC,new
		// Object[] {partyId},
		// new
		// BeanPropertyRowMapper<PartyAttributeData>(PartyAttributeData.class)
		// );
		List<Integer> objSectionToShowInDc = new ArrayList<Integer>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));

		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_getSectionsToShowInDC");
		SqlParameter partyIdParam = new SqlParameter("PartyId", Types.INTEGER);

		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("PartyId", partyId);

		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		if (l != null) {
			for (Map<String, Object> row : l) {

				objSectionToShowInDc.add((Integer) row.get("codeValueId"));

			}

		}
		return objSectionToShowInDc;

	}

	@Override
	public List<String> getLIForAllMethods(int partyId, int buId) {
		List<String> resultList = new ArrayList<String>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getLifeInsurance");
		SqlParameter partyIdParam = new SqlParameter("PartyId", Types.INTEGER);
		SqlOutParameter currentMethodAmountParam=new SqlOutParameter("currentMethodAmount", java.sql.Types.DECIMAL);
		SqlOutParameter hlvAmountParam=new SqlOutParameter("hlvAmount", java.sql.Types.DECIMAL);
		SqlOutParameter expenseAmountParam=new SqlOutParameter("expenseAmount", java.sql.Types.DECIMAL);
		SqlOutParameter incomeAmountParam=new SqlOutParameter("incomeAmount", java.sql.Types.DECIMAL);
		SqlOutParameter selectedMethodParam=new SqlOutParameter("selectedMethod", java.sql.Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam,currentMethodAmountParam,hlvAmountParam,expenseAmountParam,incomeAmountParam,selectedMethodParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("PartyId", partyId);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		resultList.add(String.valueOf((BigDecimal) storedProcResult.get("currentMethodAmount")));
		resultList.add(String.valueOf((BigDecimal) storedProcResult.get("hlvAmount")));
		resultList.add(String.valueOf((BigDecimal) storedProcResult.get("expenseAmount")));
		resultList.add(String.valueOf((BigDecimal) storedProcResult.get("incomeAmount")));
		resultList.add(String.valueOf((Integer) storedProcResult.get("selectedMethod")));
		return resultList;
	}

	@Override
	public Integer updateLIMethod(int partyId, int buId, int liMethodSelect,
			int lastModifiedBy) {
		List<String> resultList = new ArrayList<String>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_saveLifeInsuranceMethod");
		SqlParameter partyIdParam = new SqlParameter("PartyId", Types.INTEGER);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy", Types.INTEGER);
		SqlParameter liMethodSelectParam = new SqlParameter("liMethodSelect", Types.INTEGER);
		SqlOutParameter recordCountParam=new SqlOutParameter("recordCount", java.sql.Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam,lastModifiedByParam,liMethodSelectParam,recordCountParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("PartyId", partyId);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		paranValues.put("liMethodSelect", liMethodSelect);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		return  (Integer) storedProcResult.get("recordCount");
	}

	@Override
	public DCOutputData getComprehensiveReportPDF(int partyId, int buId,int createdBy)
	{
		DCOutputData output = new DCOutputData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		Map<String, String> rating = null;
		Map<String, String> succession = null;
		List<GoalData> goalDataList = new ArrayList<>();
		List<KeyValue> keyValueList = new ArrayList<>();
		List<JsonData> jsonDataList = new ArrayList<>();
		List<GoalAttribute> goalAttributeList = new ArrayList<>();
		List<ProductData> productDataList = new ArrayList<>();
		List<Document> documentList = new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		// List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_DIY_getComprehensiveReport");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:showAnalysisReportPDF---"
				+ storedProcResult);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		if (l != null) {
			for (Map<String, Object> row : l) {

				// opportunityData.setSalutationID((int)
				// row.get("salutationid"));
				output.setSaving((String) row.get("Saving").toString());
				output.setPotentialSaving((String) row.get("PotentialSaving").toString());
				output.setFuturePotentialCorpus((String) row
						.get("FuturePotentialCorpus").toString());
				output.setCurrentEmergencyFund((String) row
						.get("CurrentEmergencyFund").toString());
				output.setCurrentInsurance((String) row.get("CurrentInsurance").toString());
				if ((String) row.get("CurrentHealthInsurance") == null) {
					output.setCurrentHealthInsurance("0");
				} else {
					output.setCurrentHealthInsurance((String) row
							.get("CurrentHealthInsurance").toString());
				}
				output.setCurrentCriticalIllnesCoverAmout((String) row
						.get("currentCriticalIllnesCoverAmout").toString());

				if ((String) row.get("CurrentHealthInsurance") == null) {
					output.setCurrentpersonalInsuranceCoverAmt("0");
				} else {
					output.setCurrentpersonalInsuranceCoverAmt((String) row
							.get("currentpersonalInsurance").toString());
				}

				output.setIdealInsurance((String) row.get("IdealInsurance").toString());
				output.setNecessaryInsurance((String) row
						.get("necessaryInsurance").toString());
				output.setRetirementNeed((String) row
						.get("RetirementCorpusNeeded").toString());
				output.setRetirementCorpusAccumulation((String) row
						.get("RetirementCorpusAccumulation").toString());
				output.setMinimumEmergencyFund((String) row
						.get("MinimumEmergencyFund").toString());
				output.setIdealEmergencyFund((String) row
						.get("IdealEmergencyFund").toString());
				output.setSpouseName((String) row.get("SpouseName"));
				output.setCriticalIllnessInsurance((String) row
						.get("MinimumCriticalIllnessInsurance").toString());
				output.setAccidentInsurance((String) row
						.get("MinimumAccidentInsurance").toString());
				output.setPercentGoalReachable((int) row
						.get("PercentGoalReachable"));
				output.setRegularInvestmentRetirement((String) row
						.get("RegularInvestmentRetirement").toString());
				output.setRetirementLumpsum((String) row
						.get("RetirementLumpsum").toString());
				output.setLoanEmiPercentage((Integer) row
						.get("loanEmiPercentage"));
				output.setIncome((String) row.get("income").toString());
				output.setCurrentRegularInvestmentRetirement((String) row
						.get("CurrentRegularInvestmentRetirement").toString());
				output.setOpportunityName((String) row.get("LeadName"));
				//System.out.println("opportunity Name in Dao impl==="+ output.getOpportunityName());
				output.setSalutation((String) row.get("Salutation"));
				output.setSavingPlusExpensePercentage((String) row
						.get("SavingPlusExpensePercentage").toString());
				output.setFutureMonthlyExpenses((String) row
						.get("FutureMonthlyExpenses").toString());
				output.setMonthlyExpenses((String) row.get("MonthlyExpenses").toString());
				output.setPartyId((String) row.get("partyId"));
				output.setHealthInsuranceCoverAmount((String) row
						.get("Health_Insurance_Cover_Amount").toString());
				output.setInflationRate((String) row.get("Inflation_Rate").toString());
				output.setExpectedReturnOnExistingInvestment((String) row
						.get("Expected_Return_on_Existing_Investment").toString());
				output.setExpectedReturnOnNewInvestment((String) row
						.get("Expected_Return_on_New_Investment").toString());
				output.setEmergencyFundsRequiredMonths((String) row
						.get("Emergency_Funds_Required_Months").toString());
				output.setExpectedGrowthRateForRetirementGoalInvestments((String) row
						.get("Expected_Growth_Rate_For_Retirement_Goal_Investments").toString());
				output.setExpectedGrowthRateForGoalsLessOrEqualThree((String) row
						.get("Expected_Growth_Rate_For_Goals_Less_Or_Equal_Three").toString());
				output.setExpectedGrowthRateForGoalsGreaterThanThree((String) row
						.get("Expected_Growth_Rate_For_Goals_Greater_Than_Three").toString());
				output.setFpplanTypeId((Integer) row
						.get("fpplanTypeId"));
				output.setThemeId((Integer) row
						.get("themeId"));
				output.setAccidentMonths((String) row
						.get("Accidental_Months_Assumption"));
				output.setCriticalMonths((String) row
						.get("Critical_Months_Assumption"));
				output.setInsruanceMethod((Integer) row
						.get("insuranceMethod"));
				output.setClientPhoto((String) row
						.get("ClientPhoto"));
				// userData.setName((String) row.get("Name"));
				// userList.add(userData);
			}
		}

		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		succession = new HashMap<String, String>();
		if (l != null) {
			for (Map<String, Object> row : l) {
				succession.put((String) row.get("Succession"),
						(String) row.get("Name"));
			}
		}
		output.setSuccession(succession);

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setScore((int) row.get("Score"));
				output.setProfile((String) row.get("Profile"));
				output.setRiskProfileid((int) row.get("ProfileId"));
				output.setCurrentYear((int) row.get("CurrentYear"));
				output.setRetirementYear((String) row.get("RetirementYear").toString());
			}
		}

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setEmergencyRselectedQuestion((String) row
						.get("emergencymonth").toString());
				output.setHealthInsurance((String) row.get("healthInsurance_").toString());
				output.setHealthInsuranceAdqueteAmat((String) row
						.get("healthInsuranceAdqueteAmat").toString());
				output.setCurrentHealthInsuranceCoveAmtisGreater((String) row
						.get("isCurrentHealthInsuranceCoveAmtisGreater").toString());
				output.setCurrentLIInsuranceCoveAmtisGreater((String) row
						.get("isCurrentLIInsuranceCoveAmtisGreater").toString());
				output.setCurrentCriticalInsuranceCoveAmtisGreater((String) row
						.get("isCurrentCriticalInsuranceCoveAmtisGreater").toString());
				output.setCriticalIllNessInsuranceAdqueteAmat((String) row
						.get("CriticalIllNessInsuranceAdqueteAmat").toString());
				output.setPersonalAcdntInsuranceCoveAmtisGreater((String) row
						.get("ispersonalAcdntInsuranceCoveAmtisGreater").toString());
				output.setPersonalAcdntInsuranceAdqueteAmat((String) row
						.get("personalAcdntInsuranceAdqueteAmat").toString());
				output.setAssetHouseholdInsuranceCoveredorNot((String) row
						.get("assetHouseholdInsuranceCoveredorNot").toString());
				output.setRiskFlagColor((String) row.get("isFlag").toString());
				output.setAge((int) row.get("opportunityage"));
				output.setIsplanToTakeLoan((int) row.get("isPlanToTakeLoan"));
				output.setIsLoanTaken((int) row.get("isLoanTaken"));
				output.setMonthlyEmi((String) row.get("monthlyEmi").toString());
				output.setPremiums((String) row.get("premiums").toString());
				output.setSurplus((String) row.get("surplus").toString());

			}
		}

		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		if (l != null) {
			for (Map<String, Object> row : l) {
				// output.setem((int) row.get("Score"));
				output.setIsGoalAchivementOrInvestmentIsZero((String) row
						.get("isGoalAchivementOrInvestmentIsZero").toString());
				output.setTotalRegularInvestmentFromGoals((String) row
						.get("totalRegularInvestmentFromGoals").toString());
				output.setSumOfCurrentRegInvAndRetirment((String) row
						.get("sumOfCurrentRegInvAndRetirment").toString());
				output.setRetirmenrShortfallAmt((String) row
						.get("retirmenrShortfallAmt").toString());
				output.setIsWillPrepared((String) row.get("isWillPrepared").toString());
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-6");
		ProductData productData;
		if (l != null) {
			for (Map<String, Object> row : l) {
				productData = new ProductData();
				productData.setProductId((int) row.get("assetName"));
				productData.setMinLumpSumAmount((String) row.get("investmentValue").toString());
				productDataList.add(productData);
			}
		}
		output.setRetirementList(productDataList);
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-7");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setLoanNameId((int) row
						.get("loanNameId"));
				output.setLoanName((String) row
						.get("loanName"));
				output.setInvestmentValue((String) row
						.get("investmentValue").toString());
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-8");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setSalaryIncome((String) row
						.get("salaryIncome").toString());
				output.setOtherIncome((String) row
						.get("otherIncome").toString());
				output.setExpenses((String) row
						.get("expenses").toString());
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-9");
		JsonData jsonData;
		if (l != null) {
			for (Map<String, Object> row : l) {
				jsonData = new JsonData();
				jsonData.setValue((int) row
						.get("assetName"));
				jsonData.setText((String) row
						.get("investmentValue").toString());
				jsonDataList.add(jsonData);
			}
		}
		output.setJsonDataList(jsonDataList);
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-10");
		GoalAttribute goalAttribute;
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalAttribute = new GoalAttribute();
				goalAttribute.setGoalID((int) row
						.get("loanNameId"));
				goalAttribute.setAttributeName((String) row
						.get("loanName"));
				goalAttribute.setAttributeValue((String) row
						.get("investmentValue").toString());
				goalAttributeList.add(goalAttribute);
			}
		}
		output.setGoalAttributeList(goalAttributeList);
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-11");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setSalaryIncomeAdvanced((String) row
						.get("salaryIncome").toString());
				output.setOtherIncomeAdvanced((String) row
						.get("otherIncome").toString());
				output.setExpensesAdvanced((String) row
						.get("expenses").toString());
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-12");
		Document document;
		if (l != null) {
			for (Map<String, Object> row : l) {
				document = new Document();
				document.setDocumentName((String) row
						.get("documentName"));
				document.setFileName((String) row
						.get("fileName"));
				document.setFlag((String) row
						.get("flag"));
				document.setDocumentId((int) row
						.get("documentId"));
				documentList.add(document);
			}
		}
		output.setDocumentList(documentList);
		
		myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_DIY_getComprehensiveGoalsAndPartnerInfo");
		SqlParameter partyIdParam2 = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter[] paramArray2 = { partyIdParam2 };
		myStoredProcedure.setParameters(paramArray2);
		myStoredProcedure.compile();
		Map<String, Object> paranValues2 = new HashMap<String, Object>();
		paranValues2.put("partyId", partyId);
		Map<String, Object> storedProcResult2 = myStoredProcedure
				.execute(paranValues2);
		
		l = (List<Map<String, Object>>) storedProcResult2.get("#result-set-1");
		GoalData goalData;
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalData = new GoalData();
				goalData.setGoalFamilyPartyId((int) row
						.get("goalfamilypartyid"));
				goalData.setFpGoalId((int) row.get("fpgoalid"));
				goalData.setGoalDescription((String) row.get("goalDescription"));
				goalData.setDescription((String) row.get("TodaysCost"));
				goalData.setFutureAssetPercent((String) row.get("FutureAssetPercent"));
				goalData.setLoanTakenOrNot((String) row.get("isLoan"));
				goalData.setGoalAmountPv((String) row.get("GoalAmountPV").toString());
				goalData.setStartYear((String) row.get("CurrentYear"));
				goalData.setGoalMonth((int) row.get("GoalMonth"));
				goalData.setGoalEndYear((int) row.get("GoalYear"));
				goalData.setPercentGoalReachable((int) row
						.get("PercentOfGoalReachable"));
				goalData.setRegularInvestment((String) row
						.get("RegularInvestment").toString());
				goalData.setFutureValueOfAssets((String) row
						.get("FutureValueOfAssets").toString());
				goalData.setFutureValueOfGoal((String) row.get("FutureValue").toString());
				goalData.setCurrentValue((String) row.get("CurrentValue").toString());
				goalData.setGoalTypeId((int) row.get("goleType"));
				goalData.setGoalPV((String) row.get("goalLumpsum").toString());
				goalData.setGoalPriorityId((int) row.get("goalPriority"));
				goalData.setGoalFrequency((String) row.get("goalFrequency"));
				goalData.setGoalNote((String) row.get("NoteText"));
				goalData.setAssetName((String) row.get("assetname"));
				goalData.setPresentValue((String) row.get("presentvalue").toString());
				goalData.setPercentAllocated((String) row.get("percentallocated").toString());
				goalData.setGoalName((String) row.get("goalName").toString());
				goalData.setGoalTypeName((String) row.get("goalTypeName").toString());
				goalDataList.add(goalData);
			}
		}
		// output.setGoalList(goalDataList);
		output.setGoalList(goalDataList);
		
		l = (List<Map<String, Object>>) storedProcResult2.get("#result-set-2");
		if (l != null) {
			for (Map<String, Object> row : l) {
				output.setPartnerName((String) row.get("PartnerName"));
				output.setOwnerPartyId((Integer) row.get("ownerPartyId"));
				output.setPartnerSalutation((String) row.get("partnerSalutation"));
				output.setPartnerPhone((String) row.get("contactmobile"));
				output.setPartnerEmail((String) row.get("contactemail"));
				output.setPartnerAddress((String) row.get("street"));
				output.setPartnerCity((String) row.get("City"));
				output.setPostalCode((String) row.get("PostalCode"));
				output.setSaving(String.valueOf((Integer)row.get("InsuranceMethod")));
				output.setLogoHeight((Integer) row.get("logoHeight"));
				output.setLogoWidth((Integer) row.get("logoWidth"));
				output.setPartnerLogo((String) row.get("logo"));
				output.setCPLogo((String) row.get("CPlogo"));

			}
		}
		
		myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_DIY_getComprehensiveIndex");
		SqlParameter partyIdParam3 = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter[] paramArray3 = { partyIdParam3 };
		myStoredProcedure.setParameters(paramArray3);
		myStoredProcedure.compile();
		Map<String, Object> paranValues3 = new HashMap<String, Object>();
		paranValues3.put("partyId", partyId);
		Map<String, Object> storedProcResult3 = myStoredProcedure
				.execute(paranValues3);
		
		l = (List<Map<String, Object>>) storedProcResult3.get("#result-set-1");
		KeyValue keyValue;
		if (l != null) {
			for (Map<String, Object> row : l) {
				keyValue = new KeyValue();
				keyValue.setId((int) row
						.get("pageNumber"));
				keyValue.setName((String) row.get("title"));
				keyValueList.add(keyValue);
			}
		}
		output.setKeyValueList(keyValueList);
		
		/*myStoredProcedure = new CommonStoredProcedure(jdbcTemplate,
				"usp_pp_DC_displayMeterGuage");
		SqlParameter partyIdParam1 = new SqlParameter("partyId", Types.INTEGER);
		SqlOutParameter slabsStr = new SqlOutParameter("slabsStr",
				Types.VARCHAR);
		SqlOutParameter arrowStr = new SqlOutParameter("arrowStr",
				Types.VARCHAR);
		SqlParameter[] paramArray1 = { partyIdParam, slabsStr, arrowStr };

		myStoredProcedure.setParameters(paramArray1);
		myStoredProcedure.compile();
		Map<String, Object> paranValues1 = new HashMap<String, Object>();
		paranValues1.put("partyId", partyId);
		Map<String, Object> storedProcResult1 = myStoredProcedure
				.execute(paranValues1);

		// if(storedProcResult1.get("slabsStr")!=null){
		// cash=storedProcResult.get("futurePotentialCorpus").toString();
		output.setMeterGaugeStr1(storedProcResult1.get("slabsStr").toString());
		output.setMeterGaugeStr2(storedProcResult1.get("arrowStr").toString());*/

		/*System.out.println("  slabs str::" + output.getMeterGaugeStr1()
				+ " arrow str :" + output.getMeterGaugeStr2());*/
		return output;
	}
}
