package in.fiinfra.partner.service;

import java.util.List;

import javax.ws.rs.core.Response;

import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.common.PartyEmailCommunicationData;
import in.fiinfra.common.common.ProfileData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.TaskData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.partner.APDetails;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.partner.BusinessValuationData;
import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.partner.NotificationDetails;
import in.fiinfra.common.partner.PerformanceMatrixData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.partner.dao.PartnerDao;
import in.fiinfra.common.diy.models.ConfigurationProductsList;
import in.fiinfra.common.diy.models.ProductPurchaseURLs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class PartnerServiceImpl implements PartnerService{
	@Autowired
	private PartnerDao partnerDao;
	
	@Override
	public ProfileData getProfileDetails(int partyId, int buId) {
		ProfileData profileData=partnerDao.getProfileDetails(partyId,buId);
		return profileData;
	}
	public PartnerDao getPartnerDao() {
		return partnerDao;
	}

	public void setPartnerDao(PartnerDao partnerDao) {
		this.partnerDao = partnerDao;
	}
	@Override
	public int updatePartnerProfile(String sectionName, String dataXml,
			int buId, int partyId,int lastModifiedBy) {
		int recordCount=partnerDao.updatePartnerProfile(sectionName,dataXml,buId,partyId,lastModifiedBy);
		return recordCount;
	}
	
	@Override
	public int savePartnerLocationData(LocationData locationData) {
		int recordCount=partnerDao.savePartnerLocationData(locationData);
		return recordCount;
	}
	
	
	@Override
	public List<Integer> deletePartnerLocationData(LocationData locationData) {
		List<Integer> recordCount=partnerDao.deletePartnerLocationData(locationData);
		return recordCount;
	}
	
	
	@Override
	public List<ChartData> getChartDataList(int partyId, int buid,
			String charttype,int nodeId) {
		List<ChartData> chartData = partnerDao.getChartDataList(partyId, buid, charttype,nodeId);
		return chartData;
	}
	@Override
	public List<Object> getActionPlanDetailsList(int partyId, int buId,
			boolean isBiased) {
		List<Object> apDetailsList=partnerDao.getActionPlanDetailsList(partyId,buId,isBiased);
		return apDetailsList;
	}
	@Override
	public List<Integer> convertContact(int buId, int lastModifiedBy, String userDataXML) {
		List<Integer> recordCount=partnerDao.convertContact(buId,lastModifiedBy,userDataXML);
		return recordCount;
	}
	
	
	@Override
	public List<NotificationDetails> getNotificationListForPartner(int partyId,
			int buId) {
		return partnerDao.getNotificationListForPartner(partyId,buId);
	}
	@Override
	public int insertOrUpdateBisunessValuation(String dataXml, int partyId,
			Integer createdBy) {
		
		return partnerDao.insertOrUpdateBisunessValuation(dataXml, partyId,createdBy);
	}
	@Override
	public BusinessValuationData getBusinessValuationDetails(int partyId,
			int buId) {
		return partnerDao.getBusinessValuationDetails(partyId,buId);
	}
	@Override
	public List<KeyValue> getInterstedFpSection(Integer partnerPartyId,
			Integer clientPartyId) {
		return partnerDao.getInterstedFpSection(partnerPartyId, clientPartyId);
	}
	@Override
	public Integer saveInterstedFpSection(Integer partyId,
			Integer lastModifiedBy, KeyValue keyValue) {
		return partnerDao.saveInterstedFpSection(partyId, lastModifiedBy, keyValue);
	}
	@Override
	public AutoPlanData getAutoPlanClinetDetailsRecord(int partyId,
			int buId) {
		return partnerDao.getAutoPlanClinetDetailsRecord(partyId,buId);
	}
	@Override
	public Integer updateClientAutoPlanDetails(AutoPlanData autoPlanData) {
		return partnerDao.updateClientAutoPlanDetails(autoPlanData);
	}
	@Override
	public List<PerformanceMatrixData> getperformanceMatrixReport(int partyId,
			int buId, int benchMark, int banchMarkCategory, int dataTagId) {
		// 
		return partnerDao.getperformanceMatrixReport(partyId,buId, benchMark, banchMarkCategory,dataTagId);
	}
	@Override
	public Integer updatePartnerAutoPlanConfiguration(int partyId,
			int lastModifiedBy, int isAutoPlanEnabled) {
		return partnerDao.updatePartnerAutoPlanConfiguration(partyId,lastModifiedBy,isAutoPlanEnabled);
	}
	@Override
	public Integer addPartner(Partner partner){
		return partnerDao.addPartner(partner);
	}
	
	@Override
	public HeirarchyData getHeirarchyData(int partyId, int buId) {
		
		HeirarchyData heirarchyData=partnerDao.getHeirarchyData(partyId,buId);
		return heirarchyData ;
	}
	
	@Override
	public HeirarchyData getHeirarchyDataForVP(int partyId, int currentNodeId,int level) {
		
		HeirarchyData heirarchyData=partnerDao.getHeirarchyDataForVP(partyId,currentNodeId,level);
		return heirarchyData ;
	}
	public Partner getPartnerDetails(int partyId,int buId)
	{
		Partner partner=partnerDao.getPartnerDetails(partyId,buId);
		return partner;
	}
	public Integer deletePartner(int partyId,int buId)
	{
		return  partnerDao.deletePartner(partyId,buId);
	}	
	@Override
	public Integer getPlanType(int partyId, int buId) {
		return partnerDao.getPlanType(partyId, buId);
	}
	@Override
	public Boolean updatePlanType(int partyId, int planTypeId, int buId) {
		partnerDao.updatePlanType(partyId, planTypeId, buId);
		return true;
	}
	@Override
	public String getNameOfPartnerOrNode(Integer partyId, Integer nodeId) {
		return partnerDao.getNameOfPartnerOrNode(partyId, nodeId);
	}
	@Override
	public Integer deleteLogoOrPhoto(int partyId,int buId,int attributeCodeId)
	{
		return  partnerDao.deleteLogoOrPhoto(partyId,buId,attributeCodeId);
	}
	
	public Integer getPartnerAutoPlanCongiguration(int partyId)
	{
		return  partnerDao.getPartnerAutoPlanCongiguration(partyId);
	}
	@Override
	public Integer updateQuickDCDetails(AutoPlanData autoPlanData) {
		return partnerDao.updateQuickDCDetails(autoPlanData);
	}
	@Override
	public ProfileData getRtaFilePasswords(int partyId, int buId) {
		return partnerDao.getRtaFilePasswords(partyId,buId);
	}
	
	public Boolean updateCurrentNodeIdForPartyId(int partyId,int nodeId)
	{
		return  partnerDao.updateCurrentNodeIdForPartyId(partyId,nodeId);
	}
	@Override
	public Boolean saveRtaFilePasswords(Integer partyId, List<String> passwords,Integer userId) {
		return partnerDao.saveRtaFilePasswords(partyId,createPasswordXML(passwords),userId);
	}
	private String createPasswordXML(List<String> passwords) {
		String xml = "<Root>";
		if(passwords != null) {
			if(passwords.get(0)!=null || !(passwords.get(0).equals(""))) {
				xml += "<CAMSPassword>"+passwords.get(0)+"</CAMSPassword>";
			}
			if(passwords.get(1)!=null || !(passwords.get(1).equals(""))) {
				xml += "<KarvyPassword>"+passwords.get(1)+"</KarvyPassword>";
			}
			if(passwords.get(2)!=null || !(passwords.get(2).equals(""))) {
				xml += "<SundaramPassword>"+passwords.get(2)+"</SundaramPassword>";
			}
			if(passwords.get(3)!=null || !(passwords.get(3).equals(""))) {
				xml += "<contactEmail>"+passwords.get(3)+"</contactEmail>";
			}
		}
		xml += "</Root>";
		return xml;
	}
	@Override
	public PartyEmailCommunicationData getEmailCommunicationDetails(
			int partyId, int buId) {
		return  partnerDao.PartyEmailCommunicationData(partyId,buId);
	}
	@Override
	public Response getAllRoleAccessList(RoleAccess roleAccess) {
		Response result = partnerDao.getAllRoleAccessList(roleAccess);
		return result;
	}
	@Override
	public Response updateRoleAccessList(String objectIdList,int partyId,int createdby, int sourceId) {
		Response result = partnerDao.updateRoleAccessList(objectIdList,partyId,createdby,sourceId);
		return result;
	}
	
	@Override
	public ConfigurationProductsList getConfigurationProductsList(
			Integer partyId, Integer attrCodeId, String attrCodeList,
			Integer buId) {
		return partnerDao.getConfigurationProductsList(partyId, attrCodeId, attrCodeList, buId);
	}

	@Override
	public List<ProductPurchaseURLs> getProductPurchaseURLs(
			Integer partnerPartyId, Integer executionId, Integer settingTypeID,
			String productsId) {
		return partnerDao.getProductPurchaseURLs(partnerPartyId, executionId, settingTypeID, productsId);
	}
}
