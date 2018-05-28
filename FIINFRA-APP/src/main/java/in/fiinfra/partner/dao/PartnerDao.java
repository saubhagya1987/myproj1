package in.fiinfra.partner.dao;

import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.PartyEmailCommunicationData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.diy.models.ConfigurationProductsList;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.ProductPurchaseURLs;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.partner.BusinessValuationData;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.partner.NotificationDetails;
import in.fiinfra.common.partner.PerformanceMatrixData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.RoleAccess;

import java.util.List;

import javax.ws.rs.core.Response;

public interface PartnerDao {
	ProfileData getProfileDetails(int partyId, int buId);

	List<ChartData> getChartDataList(int partyId,int buid,String charttype,int nodeId); 
	
	int updatePartnerProfile(String sectionName, String dataXml,
			int buId, int partyId,int lastModifiedBy);

	List<Object> getActionPlanDetailsList(int partyId, int buId,
			boolean isBiased);

	List<Integer> convertContact(int buId, int lastModifiedBy, String userDataXML);
	int savePartnerLocationData(LocationData locationData);
	List<Integer> deletePartnerLocationData(LocationData locationData);
	List<NotificationDetails> getNotificationListForPartner(int partyId,
			int buId);

	int insertOrUpdateBisunessValuation(String dataXml, int partyId,
			Integer createdBy);

	BusinessValuationData getBusinessValuationDetails(int partyId, int buId);
	
	List<KeyValue> getInterstedFpSection(Integer partnerPartyId, Integer clientPartyId);
	
	Integer saveInterstedFpSection(Integer partyId, Integer lastModifiedBy,KeyValue keyValue);

	AutoPlanData getAutoPlanClinetDetailsRecord(int partyId, int buId);

	Integer updateClientAutoPlanDetails(AutoPlanData autoPlanData);
	
	List<PerformanceMatrixData> getperformanceMatrixReport(int partyId,int  buId,int benchMark,int  banchMarkCategory,int dataTagId);

	Integer updatePartnerAutoPlanConfiguration(int partyId,
			int lastModifiedBy, int isAutoPlanEnabled);
	Integer addPartner(Partner partner);
	HeirarchyData getHeirarchyData(int partyId, int buId);
	HeirarchyData getHeirarchyDataForVP(int partyId, int currentNodeId,int level);
	Partner getPartnerDetails(int partyId,int buId);
	Integer deletePartner(int partyId,int buId);
	Integer getPlanType(int partyId, int buId);

	Boolean updatePlanType(int partyId, int planTypeId, int buId);
	
	String getNameOfPartnerOrNode(Integer partyId, Integer nodeId);
	Integer deleteLogoOrPhoto(int partyId,int buId,int attributeCodeId);
	Integer getPartnerAutoPlanCongiguration(int partyId);

	Integer updateQuickDCDetails(AutoPlanData autoPlanData);

	ProfileData getRtaFilePasswords(int partyId, int buId);
	public Boolean updateCurrentNodeIdForPartyId(int partyId,int nodeId);
	Boolean saveRtaFilePasswords(Integer partyId, String passwordXML,Integer userId);

	PartyEmailCommunicationData PartyEmailCommunicationData(int partyId,
			int buId);

	Response getAllRoleAccessList(RoleAccess roleAccess);
	public Response updateRoleAccessList(String objectIdList,int partyId,int createdby, int sourceId);
	
	public ConfigurationProductsList getConfigurationProductsList(Integer partyId,Integer attrCodeId, String attrCodeList,Integer buId);
	
	public List<ProductPurchaseURLs> getProductPurchaseURLs(Integer partnerPartyId,Integer executionId,Integer settingTypeID,String productsId);
}