package in.fiinfra.partner.dao;

import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.PartyEmailCommunicationData;
import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.FamilyMemberData;
import in.fiinfra.common.common.PartyAttributeData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.common.TeamMemberData;
import in.fiinfra.common.diy.models.ConfigurationProductsList;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.diy.models.ProductPurchaseURLs;
import in.fiinfra.common.partner.APDetails;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.partner.BusinessValuationData;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.partner.NotificationDetails;
import in.fiinfra.common.partner.PartnerHeirarchyData;
import in.fiinfra.common.partner.PerformanceMatrixData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.diy.models.PartySetting;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Component;
@Component
public class PartnerDaoImpl implements PartnerDao{
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	private static final Logger logger = Logger.getLogger(PartnerDaoImpl.class);
	Response response=null;
	private static final String SP_RETRIVE_BUSINESS_VALUATION ="{CALL usp_pp_getBusinessValuationDetails(?)}";
	private static final String SP_GET_INTERESTED_FP_SECTION ="{CALL usp_DIY_getInterestedFpSection(?,?)}";
	private static final String SP_SAVE_OR_UPDATE_INTERESTED_FP_SECTION ="{CALL usp_DIY_insertOrUpdateFPSection(?,?,?,?)}";
	private static final String SP_UPDATE_CLIENT_AUTOPLAN_DETAILS ="{CALL usp_cp_saveClientAutoPlanDetails(?,?,?,?,?,?)}";
	private static final String SP_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION ="{CALL usp_pp_updatePartnerAutoPlanConfiguration(?,?,?)}";
	private static final String SP_ADD_PARTNER ="{CALL usp_pp_addPartnerForHierachy(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
	private static final String SP_RETRIVE_PARTNER_DETAILS = "{CALL usp_pp_getPartnerDetailsForHierachy(?)}";
	private static final String SP_DELETE_PARTNER_DETAILS = "{CALL usp_pp_deletepartner(?)}";
	private static final String SP_GET_PLAN_TYPE_ID = "{CALL usp_DIY_getPlanTypeId(?)}";
	private static final String UPDATE_PLAN_TYPE_ID = "{CALL usp_DIY_savePlanTypeId(?,?)}";
	private static final String GET_NAME_OF_PARTNER_OR_NODE = "{CALL usp_DIY_getNameOfPartnerOrNode(?,?)}";
	private static final String SP_DELETE_PARTNER_LOGO_PHOTO = "{CALL usp_pp_deletepartnerLogoorPhoto(?,?)}";
	private static final String SP_GET_PARTNER_AUTOPLANCONFIGURATION = "{CALL usp_DIY_getPartnerAutoPlanConfiguration(?)}";
	private static final String SP_UPDATE_QUICK_DC = "{CALL usp_cp_saveQuickDC(?,?,?,?,?,?)}";
	private static final String SP_GET_RTA_FILE_PASSWORDS = "usp_cp_getRTAFilePAsswords";
	private static final String SP_UPDATE_CURRENT_NODEID_FORPARTYID = "{CALL usp_DIY_updateCurrentNodeIdForPartyId(?,?)}";
	private static final String SP_SAVE_RTA_FILE_PASSWORDS = "{CALL usp_cp_saveRTAFilePasswords(?,?,?)}";
	private static final String SP_GET_PURCHASE_PRODUCTS_URL = "{CALL usp_DIY_getProductsPurchaseLinks(?,?,?,?)}";
	
	
	@SuppressWarnings("unchecked")
	
	@Override
	public ProfileData getProfileDetails(int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData=new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getPartnerProfileDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		//System.out.println("paranValues:--" + paranValues);
		logger.info("-----------Before Calling SP In APP(getProfileDetails)-----------");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		//personal details
		logger.info("-----------After Calling SP In APP(getProfileDetails)-----------");
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		logger.info("-----------Before Mapping In APP(getProfileDetails)-----------");
		if (l != null) {
			for (Map<String, Object> row : l) {
				profileData.setFirstName((String) row.get("firstname"));
				profileData.setLastName((String) row.get("lastname"));
				profileData.setUserName((String) row.get("username"));
				profileData.setSecurityQuestionId((Integer) row.get("SecurityQuestionId"));
				profileData.setSecurityAnswer((String) row.get("SecurityAnswer"));
				profileData.setSalutationId((Integer) row.get("SalutationId"));
				profileData.setCompanyName((String) row.get("CompanyName"));
				profileData.setPanNo((String) row.get("PanNo"));
				profileData.setContactEmail((String) row.get("ContactEmail"));
				profileData.setContactMobile((String) row.get("ContactMobile"));
				profileData.setAlternetcontact((String) row.get("alternetcontact"));
				profileData.setContactHome((String) row.get("ContactHome"));
				profileData.setDob((String) row.get("DOB"));
				profileData.setWebsiteUrl((String) row.get("websiteurl"));
				profileData.setArn((String) row.get("ARN"));
				profileData.setEmailCommunicationName((String) row.get("EmailCommunicationName"));
				profileData.setEmailCommunicationId((String) row.get("EmailCommunicationID"));
				profileData.setLocation((String) row.get("Location"));
				profileData.setEuin((String) row.get("EUIN"));
				profileData.setAutoPlanEnabled((String) row.get("autoPlanEnabled"));
				profileData.setCamsPassword((String) row.get("CAMSPassword"));
				profileData.setKarvyPassword((String) row.get("KarvyPassword"));
				profileData.setSundaramPassword((String) row.get("SundaramPassword"));
				profileData.setFbLink((String) row.get("FBLink"));
				profileData.setTwitterLink((String) row.get("TwitterLink"));
			}
		}
		//address details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		//System.out.println("l:--" + l);
		List<AddressData> addressDatas=new ArrayList<>();
		AddressData addressData=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				addressData=new AddressData();
				addressData.setStreet1((String) row.get("street1"));
				addressData.setStreet2((String) row.get("street2"));
				addressData.setStreet3((String) row.get("street3"));
				addressData.setAddressType((String) row.get("AddressType"));
				addressData.setCity((String) row.get("city"));
				addressData.setCityId((int) row.get("cityid"));
				addressData.setState((Integer) row.get("state"));
				addressData.setCountry((Integer) row.get("country"));
				addressData.setPostalCode((String) row.get("postalcode"));
				addressDatas.add(addressData);
			}
		}
		//bank details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
	//	System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				profileData.setBankName((String) row.get("bankname"));
				profileData.setBranchname((String) row.get("branchname"));
				profileData.setCity((String) row.get("city"));
				profileData.setAccounttype((Integer) row.get("accounttype"));
				profileData.setAccountNo((String) row.get("accountno"));
				profileData.setMicrCode((String) row.get("micrcode"));
				profileData.setIfscCode((String) row.get("ifsccode"));
			}
		}
		//service details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				profileData.setIsEmailActivated((Integer) row.get("IsEmailActivated"));
				profileData.setEmailActivationDate((String) row.get("EmailActivationDate"));
				profileData.setServiceEmailId((String) row.get("ServiceEmailId"));
				profileData.setServiceEmailIdLastAccessedDate((String) row.get("ServiceEmailIdLastAccessedDate"));
				profileData.setIsSmsActivated((Integer) row.get("IsSmsActivated"));
				profileData.setSmsActivationDate((String) row.get("SmsActivationDate"));
				profileData.setIsWebsiteActivated((Integer) row.get("IsWebsiteActivated"));
				profileData.setWebsiteActivationDate((String) row.get("WebsiteActivationDate"));
				profileData.setWebsiteLastAccessedDate((String) row.get("WebsiteLastAccessedDate"));
				profileData.setIsBackOfficeActivated((Integer) row.get("IsBackofficeActivated"));
				profileData.setBackOfficeActivationDate((String) row.get("BackofficeActivationDate"));
				profileData.setBackOfficeLastAccessedDate((String) row.get("BackofficeLastAccessedDate"));
			}
		}
		
		//asset class details
		List<CodeValueData> assetClassList=new ArrayList<>();
		CodeValueData codeValueData=null;
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-5");
			//	System.out.println("l:--" + l);
				if (l != null) {
					for (Map<String, Object> row : l) {
						codeValueData=new CodeValueData();
						codeValueData.setCodeValueId((Integer) row.get("AssetClassId"));
						codeValueData.setCodeValue((String) row.get("AssetClassName"));
						codeValueData.setDisplaySeqNo((Integer) row.get("SeqNo"));
						assetClassList.add(codeValueData);
					}
				}
		//productOfferingList details
		List<PartyAttributeData> productOfferingList=new ArrayList<>();
		PartyAttributeData partyAttributeData=null;
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-6");
				//System.out.println("l:--" + l);
				if (l != null) {
					for (Map<String, Object> row : l) {
						partyAttributeData=new PartyAttributeData();
						partyAttributeData.setAttributeCodeId((Integer) row.get("AttributeCodeId"));
						partyAttributeData.setAttributeValue((String) row.get("AttributeValue"));
						partyAttributeData.setSeqNo((Integer) row.get("SeqNo"));
						productOfferingList.add(partyAttributeData);
					}
				}
				
		//personalization details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-7");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				profileData.setEmailSignature((String) row.get("emailsignature"));
				profileData.setDisclaimer((String) row.get("disclaimer"));
				profileData.setDnd((String) row.get("dnd"));
				profileData.setSmsSignature((String) row.get("smssignature"));
				profileData.setTheme((Integer) row.get("theme"));
				profileData.setPhoto((String) row.get("photo"));
				profileData.setLogo((String) row.get("logo"));
			}
		}
		//team memberList details
		List<TeamMemberData> teamMemberDataList=new ArrayList<>();
		TeamMemberData teamMemberData=null;
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-8");
				//System.out.println("l:--" + l);
				if (l != null) {
					for (Map<String, Object> row : l) {
						teamMemberData=new TeamMemberData();
						teamMemberData.setEmail((String) row.get("email"));
						teamMemberData.setLabel((String) row.get("label"));
						teamMemberData.setMobileNo((String) row.get("mobileno"));
						teamMemberData.setName((String) row.get("name"));
						teamMemberDataList.add(teamMemberData);
					}
				}
		//manufacturer details
		List<PartyAttributeData> manufacturerList=new ArrayList<>();
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-9");
				//System.out.println("l:--" + l);
				if (l != null) {
					for (Map<String, Object> row : l) {
						partyAttributeData=new PartyAttributeData();
						partyAttributeData.setPartyId((Integer) row.get("ManufacturerPartyId"));
						partyAttributeData.setAttributeValue((String) row.get("ManufacturerName"));
						partyAttributeData.setAttributeCodeId((Integer) row.get("AssetClass"));
						manufacturerList.add(partyAttributeData);
					}
				}
				l = (List<Map<String, Object>>) storedProcResult.get("#result-set-10");
				//System.out.println("l:--" + l);
				List<DocumentData> documentDatas = new ArrayList<>();
				DocumentData documentData = null;
				if(l !=null) {
					for(Map<String, Object> row : l){
						documentData=new DocumentData();
						documentData.setFileName((String) row.get("fileName"));
						documentData.setDocumentName((String) row.get("documentName"));
						documentData.setCreatedByName((String) row.get("createdBy"));
						documentData.setCreatedDate((String) row.get("createdDate"));
						documentData.setDocumentId((int) row.get("documentId"));
						documentDatas.add(documentData);
					}
			}
			
				
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-11");
				List<PartyAttributeData> partyAttributeDatasFp=new ArrayList<>();
				PartyAttributeData partyAttributeDataFp=null;
				if (l != null) {
					for (Map<String, Object> row : l) {
						partyAttributeData=new PartyAttributeData();
						partyAttributeData.setAttributeCodeId((int) row.get("attributecodeid"));
						partyAttributeData.setAttributeValue((String) row.get("attributevalue"));
						partyAttributeDatasFp.add(partyAttributeData);
					}
				}	
		profileData.setAddressDataList(addressDatas);
		profileData.setAssetClassList(assetClassList);
		profileData.setProductOfferingList(productOfferingList);
		profileData.setTeamMemberDataList(teamMemberDataList);
		profileData.setManufacturerList(manufacturerList);
		profileData.setDocumentDataList(documentDatas);
		profileData.setInterestedFpList(partyAttributeDatasFp);
		logger.info("-----------After Mapping In APP(getProfileDetails)-----------");
		return profileData;
	}
	
	@Override
	public HeirarchyData getHeirarchyData(int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
		
		HeirarchyData heirarchyData=new HeirarchyData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getHeirarchyDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);

		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
	
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(partyId);
		//System.out.println("storedProcResult:---" + storedProcResult);
		//Location details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		List<LocationData> locationDatas=new ArrayList<>();
		LocationData locationData=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				locationData= new LocationData();
				locationData.setLocationId((int) row.get("LocationId"));
				locationData.setLocationName((String) row.get("LocationName"));
				locationData.setLocationDescription((String) row.get("LocationDesc"));
				locationData.setParentNodeId((int) row.get("LocationParentNode"));
				locationData.setLevel((int) row.get("LocationLevel"));
				locationData.setDisplaySeqNo((int) row.get("LocationDisplaySeq"));
				locationDatas.add(locationData);
			}
		}
		
		
		//Partner LOcation details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		//System.out.println("l:--" + l);
		List<PartnerHeirarchyData> partnerHeirarchyDatas = new ArrayList<>();
		PartnerHeirarchyData partnerHeirarchyData = null;
		if(l !=null) {
			for(Map<String, Object> row : l){
					partnerHeirarchyData=new PartnerHeirarchyData();
					partnerHeirarchyData.setUserName((String) row.get("UserName"));
					partnerHeirarchyData.setPartyId((int) row.get("PartyId"));
					partnerHeirarchyData.setCurrentNodeId((int) row.get("CurrentNode"));
					partnerHeirarchyData.setLocationId((int) row.get("NodeId"));
					partnerHeirarchyData.setLocationName((String) row.get("NodeName"));
					partnerHeirarchyData.setLocationDescription((String) row.get("NodeDesc"));
					partnerHeirarchyData.setParentNodeId((int) row.get("ParentNode"));
					partnerHeirarchyData.setLevel((int) row.get("Level"));
					partnerHeirarchyData.setDisplaySeqNo((int) row.get("DisplaySeq"));
					partnerHeirarchyData.setHeadOfNode((boolean) row.get("headOfNode"));
					partnerHeirarchyDatas.add(partnerHeirarchyData);
			}
		}
		heirarchyData.setLstLocationData(locationDatas);
		heirarchyData.setLstPartnerHeirarchyData(partnerHeirarchyDatas);

		return heirarchyData;
	}
	
	
	
	//Get  hierarchy Details for Virtual Partner
	@Override
	public HeirarchyData getHeirarchyDataForVP(int partyId, int currentNodeId,int level) {
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(currentNodeId));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(level));
		
		HeirarchyData heirarchyData=new HeirarchyData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getHeirarchyDetailsForVP");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter currentNodeIdParam = new SqlParameter("currentNodeId", Types.INTEGER);
		SqlParameter levelParam = new SqlParameter("level", Types.INTEGER);
		
		SqlParameter[] paramArray = { partyIdParam, currentNodeIdParam, levelParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("currentNodeId", currentNodeId);
		paranValues.put("level", level);
	
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		System.out.println("storedProcResult:---" + storedProcResult);
		//Location details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		List<LocationData> locationDatas=new ArrayList<>();
		LocationData locationData=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				locationData= new LocationData();
				locationData.setLocationId((int) row.get("LocationId"));
				locationData.setLocationName((String) row.get("LocationName"));
				locationData.setLocationDescription((String) row.get("LocationDesc"));
				locationData.setParentNodeId((int) row.get("LocationParentNode"));
				locationData.setLevel((int) row.get("LocationLevel"));
				locationData.setDisplaySeqNo((int) row.get("LocationDisplaySeq"));
				locationDatas.add(locationData);
			}
		}
		
		
		//Partner LOcation details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		//System.out.println("l:--" + l);
		List<PartnerHeirarchyData> partnerHeirarchyDatas = new ArrayList<>();
		PartnerHeirarchyData partnerHeirarchyData = null;
		if(l !=null) {
			for(Map<String, Object> row : l){
					partnerHeirarchyData=new PartnerHeirarchyData();
					partnerHeirarchyData.setUserName((String) row.get("UserName"));
					partnerHeirarchyData.setPartyId((int) row.get("PartyId"));
					partnerHeirarchyData.setCurrentNodeId((int) row.get("CurrentNode"));
					partnerHeirarchyData.setLocationId((int) row.get("NodeId"));
					partnerHeirarchyData.setLocationName((String) row.get("NodeName"));
					partnerHeirarchyData.setLocationDescription((String) row.get("NodeDesc"));
					partnerHeirarchyData.setParentNodeId((int) row.get("ParentNode"));
					partnerHeirarchyData.setLevel((int) row.get("Level"));
					partnerHeirarchyData.setDisplaySeqNo((int) row.get("DisplaySeq"));
					partnerHeirarchyData.setHeadOfNode((boolean) row.get("headOfNode"));
					partnerHeirarchyDatas.add(partnerHeirarchyData);
			}
		}
		heirarchyData.setLstLocationData(locationDatas);
		heirarchyData.setLstPartnerHeirarchyData(partnerHeirarchyDatas);

		return heirarchyData;
	}
	
	
	@Override
	public int updatePartnerProfile(String sectionName, String dataXml,
			int buId, int partyId,int lastModifiedBy) {
		int recordCount=0;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData=new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_savePartnerProfileDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter sectionNameParam = new SqlParameter("sectionName", Types.VARCHAR);
		SqlParameter dataXmlParam = new SqlParameter("dataXml", Types.VARCHAR);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.VARCHAR);
		logger.debug("dataXml:--"+dataXml);
		SqlParameter[] paramArray = { partyIdParam,sectionNameParam,dataXmlParam,lastModifiedByParam ,recordCountParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("sectionName", sectionName);
		paranValues.put("dataXml", dataXml);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		logger.info("recordCount:---" + recordCount);
		return recordCount;
	}
	
	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}

	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@Override
	public List<ChartData> getChartDataList(int partyId, int buid,
			String charttype,int nodeId) {
		//System.out.println("partnerdaoimpl "+String.valueOf(buid));
		//System.out.println("partnerdaoimpl  "+charttype);
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buid));
		List<ChartData> chartDatas = new ArrayList<ChartData>();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_chart_AllPieCharts");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter ChattypeParam = new SqlParameter("charttype", Types.VARCHAR);
		SqlParameter nodeIdParam = new SqlParameter("nodeId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam,ChattypeParam,nodeIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paramValues = new HashMap<String, Object>();
		paramValues.put("partyId", partyId);
		paramValues.put("charttype", charttype);
		paramValues.put("nodeId", nodeId);
		
		logger.debug("paramValues:--" + paramValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paramValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.debug("l:--" + l);
		ChartData chartData = null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				chartData = new ChartData();
				chartData.setCount(Integer.parseInt(row.get("count").toString()));
				chartData.setTitle((String) row.get("title"));
			
				chartDatas.add(chartData);
			}
		}
		return chartDatas;
	}

	@Override
	public List<Object> getActionPlanDetailsList(int partyId, int buId,
			boolean isBiased) {
		List<Object> allDataList=new ArrayList<>(); 
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData=new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_DC_GetPFActionPlan");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter isBiasedParam = new SqlParameter("isBiased", Types.BOOLEAN);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam ,isBiasedParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("isBiased", isBiased);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		APDetails apDetails=null;
		List<APDetails> apDetailsList=new ArrayList<>();
		List<APDetails> goalList=new ArrayList<APDetails>(); 
		List<APDetails> investmentList=new ArrayList<APDetails>(); 
		List<APDetails> riskPlanningList=new ArrayList<APDetails>();
		APDetails goals=new APDetails();
		APDetails insurance =new APDetails();
		APDetails investment=new APDetails();
		APDetails risk=new APDetails();
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				apDetails=new APDetails();						
				apDetails.setPartyId((int) row.get("PartyId"));						
				apDetails.setPartyName((String) row.get("PartyName"));
				apDetails.setPurpose((String) row.get("Purpose"));
				apDetails.setOpportunity((String) row.get("Opportunity"));
				apDetails.setAmountInvolved((String) row.get("InvestmentAmount"));
				//apDetails.setPremium(row.get("PremiumAmount"));										
				apDetails.setRevenuePossible((String) row.get("EstimatedRevenue"));
				apDetailsList.add(apDetails);	
			}
		}
		//address details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				goals=new APDetails();
				goals.setCoverTerm((String) row.get("CoverTerm"));
				goals.setName((String) row.get("GoalName"));
				goals.setInvestmentType((String) row.get("GoalInvestments"));
				goals.setAmountInvolved((String) row.get("GoalAmount"));
				goals.setChildrenNames((String) row.get("GoalProducts"));
				goals.setPartyId((int) row.get("PartyId"));
				goalList.add(goals);
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				investment=new APDetails();
				investment.setProductName1((String) row.get("ProductName"));
				investment.setProduct1Amount((String) row.get("InvestmentAmount"));
				investmentList.add(investment);
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				risk=new APDetails();
				risk.setProductName1((String) row.get("Risk"));
				risk.setProductName2((String) row.get("CoverRequired"));
				risk.setProductName3((String) row.get("WhatisAvailable"));
				risk.setProductName4((String) row.get("ToDo"));
				
				riskPlanningList.add(risk);
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-5");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				apDetails=new APDetails();
				apDetails.setPartyId((int) row.get("PartyId"));
				apDetails.setEmrgencyScore((String) row.get("EmergencyScore"));
				apDetails.setSourcesOfIncome((String) row.get("SourcesOfIncome"));
				apDetails.setHasFacedEmergency((String) row.get("HasFacedEmergency"));
				apDetails.setEmergencies((String) row.get("Emergencies"));
				apDetails.setFacedEmergencyDetails((String) row.get("FacedEmergencyDetails"));
				apDetails.setManagebleMonths((String) row.get("ManagebleMonths"));
				apDetails.setAdvisableMonths((String) row.get("advisableMonths"));
				apDetails.setMinimumEmergencyFund((String) row.get("MinimumEmergencyFund"));
				apDetails.setRiskScore((String) row.get("RiskScore"));
				apDetails.setAge((String) row.get("Age"));
				apDetails.setTotalDependent((String) row.get("TotalDependent"));
				apDetails.setMinors((String) row.get("Minors"));
				apDetails.setServingLoans((String) row.get("ServingLoans"));
				apDetails.setHasLi((String) row.get("HasLI"));
				apDetails.setLiPolicies((String) row.get("LIPolicies"));
				apDetails.setLi((String) row.get("LI"));
				apDetails.setHasHi((String) row.get("HasHI"));
				apDetails.setHiPolicies((String) row.get("HIPolicies"));
				apDetails.setHi((String) row.get("HI"));
				apDetails.setHasCi((String) row.get("HasCI"));
				apDetails.setCi((String) row.get("CI"));
				apDetails.setHasAi((String) row.get("HasAI"));
				apDetails.setAi((String) row.get("AI"));
				apDetails.setAreAssetsCovered((String) row.get("AreAssetsCovered"));
				apDetails.setLoanCount((String) row.get("LoanCount"));
				apDetails.setGoalInvestment((String) row.get("GoalInvestment"));
				apDetails.setLoanPayOffs((String) row.get("LoanPayOffs"));
				apDetails.setIsPlaningToTakeLoans((String) row.get("IsPlaningToTakeLoans"));
				apDetails.setSuccessionScore((String) row.get("SuccessionScore"));
				apDetails.setTotalAssets((String) row.get("TotalAssets"));
				apDetails.setRecommendedInsurance((String) row.get("RecommendedInsurance"));
				apDetails.setHasWill((String) row.get("HasWill"));
				apDetails.setInvestmentJointlyHeld((String) row.get("InvestmentJointlyHeld"));
				apDetails.setPoa((String) row.get("POA"));
				apDetails.setSavingAcAmount((String) row.get("SavingAcAmount"));	
				apDetails.setFdAmount((String) row.get("FDAmount"));	
				apDetails.setMfLumpsum((String) row.get("MFLumpsumAmount"));
				apDetails.setCoupleNames((String) row.get("CoupleNames"));
				apDetails.setChildrenNames((String) row.get("ChildrenNames"));
				apDetails.setName((String) row.get("Name"));
				apDetails.setIncome((String) row.get("Income"));
				apDetails.setFamilyAwareness((String) row.get("FamilyAwareness"));
				apDetails.setTotalRevenuePossible((String) row.get("TotalRevenue"));
				apDetails.setPartnerEmail((String) row.get("partnerEmailId"));
				apDetails.setPartnerName((String) row.get("partnerName"));
				apDetails.setPartnerMobile((String) row.get("partnerMobile"));
				apDetails.setPartnerAddress((String) row.get("partnerAddress"));
				apDetails.setState((String) row.get("state"));
				apDetails.setStreet((String) row.get("street"));
				apDetails.setPartnerLogo((String) row.get("partnerLogo"));
				//System.out.println("total revenue ::"+apDetails.getPartyId()+":::::"+apDetails.getTotalRevenuePossible()+"::saving amount :"+apDetails.getSavingAcAmount());
				apDetails.setTemp((String) row.get("temp"));
				apDetails.setBasePath((String) row.get("basePath"));
				//System.out.println("apDetails:::"+apDetails);
			}
		}
		allDataList.add(apDetailsList);
		allDataList.add(apDetails);
		allDataList.add(goalList);
		allDataList.add(investmentList);
		allDataList.add(riskPlanningList);
		return allDataList;
	}

	@Override
	public List<Integer> convertContact(int buId, int lastModifiedBy, String userDataXML) {
		int recordCount=0;
		int isExistAnyUser=0;
		List<Integer> resutList=new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData=new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_convertContact");
		SqlParameter dataXmlParam = new SqlParameter("dataXml", Types.VARCHAR);
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.VARCHAR);
		SqlOutParameter isExistAnyUserParam = new SqlOutParameter("isExistAnyUser", Types.INTEGER);
		SqlParameter[] paramArray = {dataXmlParam,lastModifiedByParam ,recordCountParam,isExistAnyUserParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("dataXml", userDataXML);
		paranValues.put("lastModifiedBy", lastModifiedBy);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		isExistAnyUser=Integer.parseInt(storedProcResult.get("isExistAnyUser").toString());
		resutList.add(recordCount);
		resutList.add(isExistAnyUser);
		logger.info("recordCount:---" + recordCount);
		return resutList;
	}
	
	@Override
	public int savePartnerLocationData(LocationData locationData) {
		int recordCount=0;
		System.out.println("In Dao savePartnerLocationData Impl ");
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(123));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveLocation");
		SqlParameter locationIdParam = new SqlParameter("locationId", Types.INTEGER);
		SqlParameter locationNameParam = new SqlParameter("locationName",Types.VARCHAR);
		SqlParameter locationDescriptionParam = new SqlParameter("locationDescription",	Types.VARCHAR);
		SqlParameter locationPartyIdParam = new SqlParameter("locationPartyId",Types.INTEGER);
		SqlParameter createdByParam = new SqlParameter("createdBy",Types.INTEGER);
		SqlParameter parentNodeIdParam = new SqlParameter("parentNodeId",Types.INTEGER);
		SqlParameter levelParam = new SqlParameter("level",Types.INTEGER);
		SqlOutParameter locationIdDbParam = new SqlOutParameter("locationIdDb",
				Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",
				Types.INTEGER);
		SqlParameter[] paramArray = { locationIdParam, locationNameParam,locationDescriptionParam,locationPartyIdParam,createdByParam,parentNodeIdParam,levelParam,recordCountParam,locationIdDbParam };
		
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("locationId", locationData.getLocationId());
		paranValues.put("locationName",locationData.getLocationName());
		paranValues.put("locationDescription",locationData.getLocationDescription());
		paranValues.put("locationPartyId",locationData.getPartyId());
		paranValues.put("createdBy",locationData.getCreatedBy());
		paranValues.put("parentNodeId",locationData.getParentNodeId());
		paranValues.put("level",locationData.getLevel());
		
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		locationData.setLocationId((Integer) storedProcResult.get("locationIdDb"));
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		
		logger.info("locationIdDb in Dao---Impl---"+locationData.getLocationId());
		logger.info("Record Count in Dao---Impl---"+recordCount);
		return recordCount;
	}

	@Override
	public List<Integer> deletePartnerLocationData(LocationData locationData) {
		int recordCount=0;
		int isChildNodeExist=0;
		List<Integer> resultList=new ArrayList<>();
		System.out.println("In Dao deletePartnerLocationData Impl ");
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(123));
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteLocation");
		SqlParameter locationIdParam = new SqlParameter("locationId", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",Types.INTEGER);
		SqlOutParameter isChildNodeExistParam = new SqlOutParameter("isChildNodeExist", Types.VARCHAR);
		
		SqlParameter[] paramArray = { locationIdParam, recordCountParam, isChildNodeExistParam};
		
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("locationId", locationData.getLocationId());
	
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
//		recordCount=(int) storedProcResult.get("recordCount");
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		isChildNodeExist=Integer.parseInt(storedProcResult.get("isChildNodeExist").toString());
//		isChildNodeExist=(int) storedProcResult.get("isChildNodeExist");
		//System.out.println("Record Count......."+recordCount);
		//System.out.println("isChildNodeExist ......."+isChildNodeExist);
		resultList.add(recordCount);		
		resultList.add(isChildNodeExist);
		return resultList;
	}

	
	
	@Override
	public List<NotificationDetails> getNotificationListForPartner(int partyId,
			int buId) {
		List<NotificationDetails> notificationDetailsList=new ArrayList<>(); 
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		NotificationDetails notificationDetails=null;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_getNotificationListForPartner");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				notificationDetails=new NotificationDetails();
				notificationDetails.setName((String) row.get("name"));
				notificationDetails.setNotifyTemplateId((int) row.get("notifytemplateid"));
				notificationDetails.setNotifyTarget((String) row.get("NotifyTarget"));
				notificationDetails.setDeliveryChannel((String) row.get("DeliveryChannel"));
				notificationDetails.setNotifyTemplateXML((String) row.get("NotifyTemplateXML"));
				notificationDetails.setUseSignature((String) row.get("UseSignature"));
				notificationDetailsList.add(notificationDetails);
			}
		}
		return notificationDetailsList;
	}

	@Override
	public int insertOrUpdateBisunessValuation(String dataXml, int partyId,
			Integer createdBy) {
	

		int recordCount=0;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		ProfileData profileData=new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_pp_SaveBusinessValuationForPartner");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter dataXmlParam = new SqlParameter("dataXml", Types.VARCHAR);
		SqlParameter createdByParam = new SqlParameter("createdBy", Types.INTEGER);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.VARCHAR);
		logger.debug("dataXml:--"+dataXml);
		SqlParameter[] paramArray = { partyIdParam,dataXmlParam,createdByParam ,recordCountParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("dataXml", dataXml);
		paranValues.put("createdBy", createdBy);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
		logger.info("recordCount:---" + recordCount);
		return recordCount;
	
	}

	@Override
	public BusinessValuationData getBusinessValuationDetails(int partyId,
			int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.queryForObject(SP_RETRIVE_BUSINESS_VALUATION,new Object[] {partyId},
				new BeanPropertyRowMapper<BusinessValuationData>(BusinessValuationData.class) );
	}

	@Override
	public List<KeyValue> getInterstedFpSection(Integer partnerPartyId,
			Integer clientPartyId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		List<KeyValue> fpSection = jdbcTemplate.query(SP_GET_INTERESTED_FP_SECTION,new Object[] {partnerPartyId,clientPartyId} , new BeanPropertyRowMapper<KeyValue>(KeyValue.class));
		if(CollectionUtils.isNotEmpty(fpSection))
		{
			return fpSection;
		}
		return null;
	}

	@Override
	public Integer saveInterstedFpSection(Integer partyId,
			Integer lastModifiedBy, KeyValue keyValue) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		return jdbcTemplate.update(SP_SAVE_OR_UPDATE_INTERESTED_FP_SECTION, new Object[] {partyId,keyValue.getId(),keyValue.getName(),lastModifiedBy});
		
	}

	@Override
	public AutoPlanData getAutoPlanClinetDetailsRecord(int partyId, int buId) {
		AutoPlanData autoPlanData=new AutoPlanData();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getAutoPlanClientData");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		List<GoalData> goalDatas=new ArrayList<>();
		List<FamilyMemberData> familyMemberDatas=new ArrayList<>(); 
		List<PartyAttributeData> partyAttributeDatas=new ArrayList<>(); 
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				autoPlanData.setFirstname((String) row.get("FirstName"));
				autoPlanData.setLastname((String) row.get("LastName"));
				autoPlanData.setDob((String) row.get("dob"));
				autoPlanData.setEmailId((String) row.get("EmailId"));
				autoPlanData.setIncome((String) row.get("Income"));
				autoPlanData.setExpense((String) row.get("Expense"));
				autoPlanData.setRetirementAge((String) row.get("RetirementAge"));
				autoPlanData.setEmergencyMonths((String) row.get("EmergencyMonths"));
				autoPlanData.setRiskProfileId(String.valueOf(row.get("RiskProfileId")));
				autoPlanData.setCity((String)row.get("City"));
				autoPlanData.setPanNo((String)row.get("PanNo"));
				autoPlanData.setLifeExpectancy((String)row.get("LifeExpectancy"));
				autoPlanData.setWill((String)row.get("Will"));
				autoPlanData.setEMI((String)row.get("EMI"));
				autoPlanData.setMaritalStatus((Integer)row.get("maritalStatus"));
				autoPlanData.setMonthlyInvestment((String)row.get("monthlyInvestment"));
				autoPlanData.setContactNo((String)row.get("contactNo"));
				autoPlanData.setTitle((Integer)row.get("title"));
				autoPlanData.setResidentialStatus((Integer)row.get("residentialStatus"));
				autoPlanData.setOccupation((String)row.get("occupation"));
				autoPlanData.setGender((Integer)row.get("gender"));
				
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		GoalData goalData=null;
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				goalData=new GoalData();
				goalData.setGoalName((String) row.get("GoalName"));
				goalData.setGoalEndYear((int) row.get("EndYear"));
				goalData.setGoalAmountPv(String.valueOf(row.get("GoalAmountPv")));
				goalData.setGoalTypeId((int) row.get("GoalTypeId"));
				goalData.setGoalFamilyPartyId((int) row.get("GoalFamilyPartyId"));
				goalData.setFpGoalId((Integer) row.get("FPGoalId"));
				goalDatas.add(goalData);
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-3");
		FamilyMemberData familyMemberData=null;
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				familyMemberData=new FamilyMemberData();
				familyMemberData.setLastName((String) row.get("LastName"));
				familyMemberData.setAge((int) row.get("Age"));
				familyMemberData.setRelationshipId((int) row.get("RelationShipId"));
				familyMemberData.setPartyId((int) row.get("PartyId"));
				familyMemberDatas.add(familyMemberData);
			}
		}
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-4");
		PartyAttributeData partyAattributeData=null;
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				partyAattributeData=new PartyAttributeData();
				partyAattributeData.setAttributeCodeId((int) row.get("AttributeCodeId"));
				partyAattributeData.setAttributeValue((String) row.get("attributeValue"));
				partyAattributeData.setAttributereferenceValue((String) row.get("attributereferenceValue"));
				partyAttributeDatas.add(partyAattributeData);
			}
		}
		
		autoPlanData.setGoalDatas(goalDatas);
		autoPlanData.setFamilyMemberDatas(familyMemberDatas);
		autoPlanData.setPartyAttributeDatas(partyAttributeDatas);
		return autoPlanData;
	}

	@Override
	public Integer updateClientAutoPlanDetails(AutoPlanData autoPlanData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		return jdbcTemplate.queryForInt(SP_UPDATE_CLIENT_AUTOPLAN_DETAILS, new Object[] {autoPlanData.getPartyId(),autoPlanData.getDataXML(),autoPlanData.getGoalXML(),autoPlanData.getFamilyMemberDataXML(),autoPlanData.getPartyAttributeDataXML(),autoPlanData.getLastModifiedBy()});
	}

	@Override
	public List<PerformanceMatrixData> getperformanceMatrixReport(int partyId,
			int buId, int benchMark, int banchMarkCategory, int dataTagId) {


		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_rpt_getIFAPerformanceMatrix");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter benchMarkParam = new SqlParameter("benchMark", Types.INTEGER);
		SqlParameter banchMarkCategoryParam = new SqlParameter("banchMarkCategory", Types.INTEGER);
		SqlParameter dataTagIdParam = new SqlParameter("dataTagId", Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam,benchMarkParam,banchMarkCategoryParam,dataTagIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("benchMark", benchMark);
		paranValues.put("banchMarkCategory", banchMarkCategory);
		paranValues.put("dataTagId", dataTagId);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		//System.out.println("storedProcResult:---" + storedProcResult);
		List<PerformanceMatrixData> performanceMatrixDataList=new ArrayList<PerformanceMatrixData>();
		
		
		//personal details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		
		//System.out.println("l:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				PerformanceMatrixData  performanceMatrixData  = new PerformanceMatrixData();
				performanceMatrixData.setQuarter((String) row.get("quarter"));
				performanceMatrixData.setCount((String) row.get("count"));
				if(benchMark != 0){
					performanceMatrixData.setCount1((String) row.get("count1"));
				}
				performanceMatrixDataList.add(performanceMatrixData);
			}
		}
		
		return performanceMatrixDataList;
	}

	@Override
	public Integer updatePartnerAutoPlanConfiguration(int partyId,
			int lastModifiedBy, int isAutoPlanEnabled) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		return jdbcTemplate.queryForInt(SP_UPDATE_PARTNER_AUTO_PLAN_CONFIGURATION, new Object[] {partyId,lastModifiedBy,isAutoPlanEnabled});
	}
	
	public  Integer addPartner(Partner partner){
		BaseResponse<Integer> br = new BaseResponse();
		Integer rcnt=0;
		try {
			
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(Integer.parseInt(partner.getBuId())));
			rcnt = jdbcTemplate.queryForObject(
					SP_ADD_PARTNER, new Object[] { partner.getFirstName(),
							partner.getLastName(), partner.getCompanyName(), partner.getContactEmail(),
							partner.getArn(), partner.getPstTeamMemberId(),partner.getPktTeamMemberId(),partner.getPotTeamMemberId(),partner.getRmTeamMemberId(),
							partner.getRmHeadTeamMemberId(),partner.getBuId(), partner.getUserId(), partner.getEuin(),
							partner.getLoginName(), partner.geteNCPassword() ,partner.getIsHeadNode(),partner.getCurrentNode(),partner.getPartyID()}, Integer.class);
//			System.out.println("Record Count=== Ams=========="+rcnt);
			br.setResponseObject(rcnt);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return rcnt;
		}
	}
	public Partner getPartnerDetails(int partyId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		Partner p= jdbcTemplate.queryForObject(SP_RETRIVE_PARTNER_DETAILS, new Object[]{partyId}, 
				new BeanPropertyRowMapper<Partner>(Partner.class));
		//System.out.println("In APP="+p.getUserName());
		//System.out.println("In APP="+p.getLastName());
		return p;
	}
	public Integer deletePartner(int partyId,int buId)
	{
//		Integer p=0;
//		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
//		p= jdbcTemplate.queryForObject(SP_DELETE_PARTNER_DETAILS, new Object[]{partyId}, 
//				new BeanPropertyRowMapper<Integer>(Integer.class));
//		System.out.println("In APP="+p);
//		//System.out.println("In APP="+p.getLastName());
//		return p;
		
		
		
		Integer rcnt=0;
		
			
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(buId));
			rcnt = jdbcTemplate.queryForInt(
					SP_DELETE_PARTNER_DETAILS, new Object[] {partyId});
			//System.out.println("Record Count============="+rcnt);
			
			
		
			return rcnt;
		
	}	
	@Override
	public Integer getPlanType(int partyId, int buId) {
		return jdbcTemplate.queryForObject(SP_GET_PLAN_TYPE_ID, new Object[]{partyId}, Integer.class);
	}

	@Override
	public Boolean updatePlanType(int partyId, int planTypeId, int buId) {
		int result = jdbcTemplate.update(UPDATE_PLAN_TYPE_ID, new Object[]{partyId, planTypeId});
		return (result>0)?true:false;
	}

	@Override
	public String getNameOfPartnerOrNode(Integer partyId, Integer nodeId) {
		return jdbcTemplate.queryForObject(GET_NAME_OF_PARTNER_OR_NODE, new Object[] {nodeId,partyId}, String.class);
	}	
	
	@Override
	public Integer deleteLogoOrPhoto(int partyId,int buId,int attributeCodeId)
	{
		Integer rcnt=0;
		
		
		jdbcTemplate.setDataSource(dataSourceProvider
				.getDataSource(buId));
		rcnt = jdbcTemplate.queryForInt(
				SP_DELETE_PARTNER_LOGO_PHOTO, new Object[] {partyId,attributeCodeId});
		//System.out.println("Record Count============="+rcnt);
		
		
	
		return rcnt;
	}
	
	public Integer getPartnerAutoPlanCongiguration(int partyId)
	{
		return jdbcTemplate.queryForObject(SP_GET_PARTNER_AUTOPLANCONFIGURATION,new Object[]{partyId},Integer.class);
	}

	@Override
	public Integer updateQuickDCDetails(AutoPlanData autoPlanData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		return jdbcTemplate.queryForInt(SP_UPDATE_QUICK_DC, new Object[] {autoPlanData.getPartyId(),autoPlanData.getDataXML(),autoPlanData.getGoalXML(),autoPlanData.getFamilyMemberDataXML(),autoPlanData.getPartyAttributeDataXML(),autoPlanData.getLastModifiedBy()});
	}

	@Override
	public ProfileData getRtaFilePasswords(int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		ProfileData profileData=new ProfileData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, SP_GET_RTA_FILE_PASSWORDS);
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);		
		SqlParameter[] paramArray = { partyIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);		
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		if (l != null) {
			for (Map<String, Object> row : l) {				
				profileData.setCamsPassword((String) row.get("CAMSPassword"));
				profileData.setKarvyPassword((String) row.get("KarvyPassword"));
				profileData.setSundaramPassword((String) row.get("SundaramPassword"));				
			}
		}	
		return profileData;
	}

	@Override
	public Boolean updateCurrentNodeIdForPartyId(int partyId,int nodeId)
	{
		int result=jdbcTemplate.update(SP_UPDATE_CURRENT_NODEID_FORPARTYID, new Object[] {partyId,nodeId});
		if(result>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	@Override
	public Boolean saveRtaFilePasswords(Integer partyId, String passwordXML,
			Integer userId) {
		 jdbcTemplate.update(SP_SAVE_RTA_FILE_PASSWORDS, new Object[] {partyId,passwordXML,userId});
		 return true;
	}

	@Override
	public PartyEmailCommunicationData PartyEmailCommunicationData(
			int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		PartyEmailCommunicationData partyEmailCommunicationData=new PartyEmailCommunicationData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_getEmailCommunicationDetails");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);	
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);	
		SqlParameter[] paramArray = { partyIdParam,buIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("buId", buId);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		if (l != null) {
			for (Map<String, Object> row : l) {				
				partyEmailCommunicationData.setPstEmail((String) row.get("pstEmail"));
				partyEmailCommunicationData.setMstEmail((String) row.get("mstEmail"));
				partyEmailCommunicationData.setEmailCommunicatioName((String) row.get("EmailCommunicatioName"));				
				partyEmailCommunicationData.setEmailCommunicationID((String) row.get("EmailCommunicationID"));
			}
		}	
		return partyEmailCommunicationData;
	}
	@SuppressWarnings("finally")
	@Override
	public Response getAllRoleAccessList(RoleAccess roleAccess) {
		try {
			List<RoleAccess> roleAccessDatalist;
			BaseResponse<RoleAccess> br = new BaseResponse<RoleAccess>();
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			roleAccessDatalist = jdbcTemplate.query(
					FiinfraConstants.PP_GET_ALL_ROLE_ACCESS_LIST, new Object[] {
							roleAccess.getPartyId(), roleAccess.getSourceSystemId(),roleAccess.getSearchText() }, new BeanPropertyRowMapper<RoleAccess>(
							RoleAccess.class));
			br.setResponseListObject(roleAccessDatalist);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response updateRoleAccessList(String objectIdList,int partyId,int createdby, int sourceId) {
		BaseResponse<Integer> br = new BaseResponse<>();
		try {
			Integer updtRoleAccList;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			updtRoleAccList = jdbcTemplate.queryForObject(FiinfraConstants.PP_UPDATE_ROLE_ACCESS_LIST,new Object[] {objectIdList,partyId,createdby,sourceId},Integer.class);
			br.setResponseObject(updtRoleAccList);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}
	
	@Override
	public ConfigurationProductsList getConfigurationProductsList(
			Integer partyId, Integer attrCodeId, String attrCodeList,Integer buId) {
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_DIY_getProductsForOLTransactionConfiguration");
		SqlParameter partyIdParam = new SqlParameter("partnerPartyId", Types.INTEGER);	
		SqlParameter buIdParam = new SqlParameter("buId", Types.INTEGER);	
		SqlParameter attrIdParam = new SqlParameter("attributeCodeId",Types.INTEGER);
		SqlParameter attrIdListParam = new SqlParameter("attributeCodeIdList",Types.VARCHAR);
		SqlParameter[] paramArray = { partyIdParam,attrIdParam,attrIdListParam,buIdParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partnerPartyId", partyId);
		paranValues.put("buId", buId);
		paranValues.put("attributeCodeId", attrCodeId);
		paranValues.put("attributeCodeIdList", attrCodeList);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		List<PartySetting> partySettings = new ArrayList<PartySetting>();
		if (l != null) {
			for (Map<String, Object> row : l) {				
				PartySetting setting = new PartySetting();
				setting.setPartyId((Integer) row.get("partyId"));
				setting.setPartyName((String)row.get("lastName"));
				setting.setPartySettingTypeId((Integer) row.get("settingTypeId"));
				partySettings.add(setting);
			}
		}
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		List<KeyValue> partyAttributes = new ArrayList<KeyValue>();
		if (l != null) {
			for (Map<String, Object> row : l) {				
				KeyValue value= new KeyValue();
				value.setId((Integer)row.get("attributeCodeID"));
				value.setName((String)row.get("attributeValue"));
				partyAttributes.add(value);
			}
		}
		ConfigurationProductsList configurationProductsList = new ConfigurationProductsList();
		configurationProductsList.setPartyAttributes(partyAttributes);
		configurationProductsList.setPartySettings(partySettings);
		return configurationProductsList;
	}

	@Override
	public List<ProductPurchaseURLs> getProductPurchaseURLs(
			Integer partnerPartyId, Integer executionId, Integer settingTypeID,String productsId) {
		jdbcTemplate.setDataSource(dataSourceProvider
				.getDataSource(FiinfraConstants.BU_DEFAULT));
		return jdbcTemplate.query(SP_GET_PURCHASE_PRODUCTS_URL, new Object[] {productsId,executionId,partnerPartyId,settingTypeID}, new BeanPropertyRowMapper(ProductPurchaseURLs.class));
	}
}
