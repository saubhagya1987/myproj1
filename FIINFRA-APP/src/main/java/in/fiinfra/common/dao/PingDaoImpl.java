package in.fiinfra.common.dao;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DndData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.RecipientListData;


import in.fiinfra.common.common.ScheduledPindData;
import in.fiinfra.common.common.SelectedRecipientForSchedulePing;
import in.fiinfra.common.common.TagData;
import in.fiinfra.common.opportunity.OpportunityData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.util.DataSourceProvider;

import java.nio.channels.SelectableChannel;
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

@Component
public class PingDaoImpl implements PingDao{

	private static final Logger logger = Logger.getLogger(CommonDaoImpl.class);
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	private static final String SP_RETRIVE_TAG_LIST_PING ="{CALL usp_cp_getTagListPing()}";
	private static final String SP_RETRIVE_STANDARDTAGS_NOTIFICATIONTARGET ="{CALL usp_cp_getStandardTagsForNotificationTarget(?)}";

	private static final String SP_RETRIVE_PING_RECORD ="{CALL usp_cp_getPingDetails(?)}";
	private static final String SP_RETRIVE_TAG_VALUE_LIST ="{CALL usp_cp_getTagValueList(?)}";

	static final String SP_RETRIVE_TAGS_LIST="{CALL usp_cp_getTagsList()}";
	private static final String SP_RETRIVE_TEMPLATE_MAPPED_TAG="{CALL usp_cp_getTemplateMappedTagList(?)}";
	private static final String SP_RETRIVE_STANDARD_PING_LIST="{CALL usp_cp_getStandardPingList(?,?)}";
	private static final String SP_UPDATE_PING_ACTIVE_FLAG="{CALL usp_cp_updatePingActiveFlag(?,?,?)}";
	private static final String SP_CLONE_PING="{CALL usp_cp_clonePing(?,?)}";
	private static final String SP_MARK_FAVOURITE_PING="{CALL usp_cp_markPingAsFavourite(?,?,?)}";
	private static final String SP_DELETE_PING="{CALL usp_cp_deletePings(?)}";
	

	private static final String SP_RETRIVE_RECIPIENT_LIST="{CALL usp_cp_getRecipientListForSchedulePing(?,?,?,?)}";
	private static final String SP_RETRIVE_TAGS_By_ID="{CALL usp_cp_getTagsByTagId(?)}"		;
	
	private static final String SP_RESOLVE_TAGS_TEMPLATE_XML="{CALL usp_cp_resolveTemplateXMLForContacts(?,?,?,?)}";
	

	private static final String SP_RETRIVE_SCHEDULED_PINGS ="{CALL usp_cp_getScheduledPings(?)}";
	
	private static final String SP_RETRIVE_SCHEDULED_PINGS_BY_NOTIFYTEMPLETID = "{CALL usp_cp_getScheduledPingByNotifuTempletId(?)}";
	private static final String SP_RETRIVE_TAG_DETAILS_FORSCHEDULED_PING = "{CALL usp_cp_retriveTagDetailsForScheduledPing(?)}";
			
	private static final String SP_RETRIVE_RECIPIENTDETAILS_FOR_SCHEDULE_PING = "{CALL usp_cp_retriveRecipientDetailsForScheduledPing(?)}";
	private static final String SP_RETRIVE_SELECTED_RECIPIENT_FOR_SCHEDULED_PING = "{CALL usp_cp_getSelectedPartyIdForScheduledPing(?)}";
	private static final String SP_RETRIVE_MATTCHING_TAGS_AND_POTENTIALPINGS = "{CALL usp_cp_getMatchingTagsAndPotentialPings(?,?)}";
	private static final String SP_RETRIVE_DELIVARY_HISTORY_PING = "{CALL usp_cp_getDelivaryHistory(?,?)}";
	private static final  String SP_RETRIVE_CONTACT_DETAILSOF_CONTACTFORPING = "{CALL usp_cp_getContactContactAndMailDetailsForPing(?)}";
	private static final String SP_RETRIVE_DNDS = "{CALL usp_cp_getDnds(?)}";
	private static final String SP_RETRIVE_DND_DETAILSBY_DNDID = "{CALL usp_cp_getDndDetailsByDndId(?)}";
	
	@Override
	public List<TagData> getTagList(int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_TAG_LIST_PING,new Object[] {},
				new BeanPropertyRowMapper<TagData>(TagData.class) );
	}
	
	@Override
	public List<CodeValueData> getStandardTagsForNotificationTarget(int notifyTargetId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_STANDARDTAGS_NOTIFICATIONTARGET,new Object[] {notifyTargetId},
				new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class) );
	}
	
	@Override
	public List<TagData> getTagsList(int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_TAGS_LIST,new Object[] {},
				new BeanPropertyRowMapper<TagData>(TagData.class) );
	}
	
	@Override
	public String deleteTags(String tagIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteTags");
		SqlParameter queryIdsParam = new SqlParameter("tagIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { queryIdsParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("tagIds", tagIds);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}
	@Override 
	public TagData insertTags(TagData tagData)
	{
		//TagData tagData = new TagData();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(tagData.getBuId()));
		
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveTags");
		SqlParameter tagNameParam = new SqlParameter("tagName", Types.VARCHAR);
		SqlParameter descriptionParam = new SqlParameter("description",
				Types.VARCHAR);
		SqlParameter mappedCodeTypeParam = new SqlParameter("mappedCodeType",
				Types.INTEGER);
		
		SqlParameter isActiveParam = new SqlParameter("isActive",
				Types.BOOLEAN);
		
		SqlParameter createdByParam = new SqlParameter("createdBy",
				Types.INTEGER);
		
		SqlOutParameter tagIdDbParam = new SqlOutParameter("tagIdDb",
				Types.INTEGER);
		
		SqlParameter tagIdByParam = new SqlParameter("tagId",
				Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { tagNameParam,descriptionParam,mappedCodeTypeParam, isActiveParam,
				createdByParam, tagIdDbParam,tagIdByParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("tagName", tagData.getNotifyTagName());
		paranValues.put("description", tagData.getNotifyTagDescription());
		paranValues.put("mappedCodeType", tagData.getMappedCodeTypeId());
		
		
			paranValues.put("isActive", tagData.isActive());
		
	
		paranValues.put("createdBy", tagData.getCreatedBy());
		paranValues.put("tagId", tagData.getNotifyTagId());
		logger.debug("paramValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		tagData.setNotifyTagId((Integer) storedProcResult.get("tagIdDb"));
		
		
		return tagData;
	}

	@Override
	public List<String> insertOrUpdatePing(NotifyTemplateData notifyTemplateData) {
		List<String> resultList=new ArrayList<>();
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_savePing");
		
		SqlParameter NotifyTemplateIDParam = new SqlParameter("NotifyTemplateID", Types.INTEGER);
		SqlParameter PartyIDParam = new SqlParameter("PartyID", Types.INTEGER);
		SqlParameter NotifyTypeIDParam = new SqlParameter("NotifyTypeID", Types.INTEGER);
		SqlParameter NameParam = new SqlParameter("Name", Types.VARCHAR);
		SqlParameter DescriptionParam = new SqlParameter("Description", Types.VARCHAR);
		SqlParameter NotifyTargetIDParam = new SqlParameter("NotifyTargetID", Types.INTEGER);
		SqlParameter DeliveryChannelIDParam = new SqlParameter("DeliveryChannelID", Types.INTEGER);
		SqlParameter UseSignatureIDParam = new SqlParameter("UseSignatureID", Types.INTEGER);
		SqlParameter NotifyTemplateXMLParam = new SqlParameter("NotifyTemplateXML", Types.VARCHAR);
		SqlParameter IsAttachmentParam = new SqlParameter("IsAttachment", Types.BOOLEAN);
		SqlParameter AttachmentCountParam = new SqlParameter("AttachmentCount", Types.INTEGER);
		SqlParameter Attachment1DocumentIDParam = new SqlParameter("Attachment1DocumentID", Types.INTEGER);
		SqlParameter Attachment2DocumentIDParam = new SqlParameter("Attachment2DocumentID", Types.INTEGER);
		SqlParameter Attachment3DocumentIDParam = new SqlParameter("Attachment3DocumentID", Types.INTEGER);
		SqlParameter IsPublicParam = new SqlParameter("IsPublic", Types.BOOLEAN);
		SqlParameter LastModifiedByParam = new SqlParameter("LastModifiedBy", Types.INTEGER);
		SqlParameter IsAddDisclaimerTextParam = new SqlParameter("IsAddDisclaimerText", Types.BOOLEAN);
		SqlParameter IsAddDNDTextParam = new SqlParameter("IsAddDNDText", Types.BOOLEAN);
		SqlParameter SourceSystemIDParam = new SqlParameter("SourceSystemID", Types.INTEGER);
		SqlParameter TagListParam = new SqlParameter("TagList", Types.VARCHAR);
		SqlParameter documentXMLParam = new SqlParameter("documentXML", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlOutParameter isPingNameExistParam = new SqlOutParameter("isPingNameExist", Types.INTEGER);
		SqlOutParameter basePathParam = new SqlOutParameter("basePath", Types.VARCHAR);
		SqlOutParameter fileNamesToRetainPathParam = new SqlOutParameter("fileNamesToRetain", Types.VARCHAR);
		SqlParameter[] paramArray = {NotifyTemplateIDParam,PartyIDParam,NotifyTypeIDParam,NameParam,DescriptionParam,NotifyTargetIDParam,DeliveryChannelIDParam,UseSignatureIDParam,NotifyTemplateXMLParam,IsAttachmentParam,AttachmentCountParam,Attachment1DocumentIDParam,Attachment2DocumentIDParam,Attachment3DocumentIDParam,IsPublicParam,LastModifiedByParam,IsAddDisclaimerTextParam,IsAddDNDTextParam,SourceSystemIDParam,TagListParam,documentXMLParam,recordCountParam,isPingNameExistParam,basePathParam,fileNamesToRetainPathParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("NotifyTemplateID", notifyTemplateData.getNotifyTemplateID());
		paranValues.put("PartyID", notifyTemplateData.getPartyID());
		paranValues.put("NotifyTypeID", notifyTemplateData.getNotifyTypeID());
		paranValues.put("Name", notifyTemplateData.getName());
		paranValues.put("Description", notifyTemplateData.getDescription());
		paranValues.put("NotifyTargetID", notifyTemplateData.getNotifyTargetID());
		paranValues.put("DeliveryChannelID", notifyTemplateData.getDeliveryChannelID());
		paranValues.put("UseSignatureID", notifyTemplateData.getUseSignatureID());
		paranValues.put("NotifyTemplateXML", notifyTemplateData.getNotifyTemplateXML());
		paranValues.put("IsAttachment", notifyTemplateData.isAttachment());
		paranValues.put("AttachmentCount", notifyTemplateData.getAttachmentCount());
		paranValues.put("Attachment1DocumentID", notifyTemplateData.getAttachment1DocumentID());
		paranValues.put("Attachment2DocumentID", notifyTemplateData.getAttachment2DocumentID());
		paranValues.put("Attachment3DocumentID", notifyTemplateData.getAttachment3DocumentID());
		paranValues.put("IsPublic", notifyTemplateData.isPublic());
		paranValues.put("LastModifiedBy", notifyTemplateData.getLastModifiedBy());
		paranValues.put("IsAddDisclaimerText", notifyTemplateData.isAddDisclaimerText());
		paranValues.put("IsAddDNDText", notifyTemplateData.isAddDNDText());
		paranValues.put("SourceSystemID", notifyTemplateData.getSourceSystemID());
		paranValues.put("TagList",notifyTemplateData.getTagList());
		paranValues.put("documentXML", FiinfraUtility.getDocumentXML(notifyTemplateData.getDocumentDatas()));
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		int isPingNameExist=(int) storedProcResult.get("isPingNameExist");
		String basePath=(String) storedProcResult.get("basePath");
		String fileNamesToRetain=(String) storedProcResult.get("fileNamesToRetain");
		resultList.add(String.valueOf(recordCount));
		resultList.add(String.valueOf(isPingNameExist));
		resultList.add(basePath);
		resultList.add(fileNamesToRetain);
		return resultList;
	}
	public TagData getTagDetailsByTagId(int tagId ,  int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.queryForObject(SP_RETRIVE_TAGS_By_ID,new Object[] {tagId},
				new BeanPropertyRowMapper<TagData>(TagData.class) );
	}
	

	/*logic to get Tags*/
	@Override
	public NotifyTemplateData getPingRecord(int notifyTemplateId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		NotifyTemplateData notifyTemplateData= jdbcTemplate.queryForObject(SP_RETRIVE_PING_RECORD,new Object[] {notifyTemplateId},
				new BeanPropertyRowMapper<NotifyTemplateData>(NotifyTemplateData.class) );
		notifyTemplateData.setTagDatas(jdbcTemplate.query(SP_RETRIVE_TEMPLATE_MAPPED_TAG,new Object[] {notifyTemplateId},
				new BeanPropertyRowMapper<TagData>(TagData.class)));
		return notifyTemplateData;
	}

	@Override
	public List<CodeValueData> getTagValueList(int notifyTagId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_TAG_VALUE_LIST,new Object[] {notifyTagId},
				new BeanPropertyRowMapper<CodeValueData>(CodeValueData.class) );
	}

	@Override
	public List<NotifyTemplateData> getStandardPingList(int partyId, int buId,int nodeId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_STANDARD_PING_LIST,new Object[] {partyId,nodeId},
				new BeanPropertyRowMapper<NotifyTemplateData>(NotifyTemplateData.class) );
	}
	
	@Override
	public List<RecipientListData>  getRecipientList(String notifyTagId, int buId,String recipientType,int notifyTempletId,int partyId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_RECIPIENT_LIST,new Object[] {notifyTagId,recipientType,notifyTempletId,partyId},
				new BeanPropertyRowMapper<RecipientListData>(RecipientListData.class) );
	}
	
	@Override
	public RecipientListData insertSchedulePings(RecipientListData recipientListData)
	{
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(recipientListData.getBuId()));
		
		//System.out.println("notify template id="+ recipientListData.getPing());
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_schedulePing");
		SqlParameter notifyTempletIdParam = new SqlParameter("notifyTempletId", Types.INTEGER);
		SqlParameter scheduleDateParam = new SqlParameter("scheduleDate",
				Types.VARCHAR);
		SqlParameter scheduleHrParam = new SqlParameter("scheduleHr",
				Types.VARCHAR);
		
		SqlParameter scheduleTimeParam = new SqlParameter("scheduleTime",
				Types.VARCHAR);
		
		SqlParameter hrTypeParam = new SqlParameter("hrType",
				Types.VARCHAR);
		
		SqlParameter createdByParam = new SqlParameter("createdBy",
				Types.INTEGER);
		
		SqlParameter lastModifiedByParam = new SqlParameter("lastModifiedBy",
				Types.INTEGER);
		
		SqlParameter notifyScheduleXMLParam = new SqlParameter("notifyScheduleXML",
				Types.VARCHAR);
		
		SqlParameter xmlTagListParam = new SqlParameter("xmlTagList",
				Types.VARCHAR);
		SqlParameter notifyScheduleIdAdd_EditParam = new SqlParameter("notifyScheduleIdAdd_Edit",
				Types.INTEGER);
		
		SqlOutParameter notifyScheduleIdParam = new SqlOutParameter("notifyScheduleId",
				Types.INTEGER);
		
		
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { notifyTempletIdParam,scheduleDateParam,scheduleHrParam, scheduleTimeParam,
				hrTypeParam,createdByParam,lastModifiedByParam ,notifyScheduleXMLParam,xmlTagListParam,notifyScheduleIdAdd_EditParam,notifyScheduleIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("notifyTempletId", recipientListData.getPing());
		paranValues.put("scheduleDate", recipientListData.getScheduleDate());
		paranValues.put("scheduleHr", recipientListData.getScheduleHours());
		
		
			paranValues.put("scheduleTime", recipientListData.getScheduleMinute());
		
			paranValues.put("hrType", recipientListData.getHrType());
		paranValues.put("createdBy", recipientListData.getCreatedBy());
		paranValues.put("lastModifiedBy", recipientListData.getCreatedBy());
		paranValues.put("notifyScheduleXML", recipientListData.getXmlStringNotifyParty());
		paranValues.put("xmlTagList", recipientListData.getXmlTagList());
		paranValues.put("notifyScheduleIdAdd_Edit",recipientListData.getNotifyScheduleId());
		logger.debug("paramValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		recipientListData.setNotifyScheduleId((Integer) storedProcResult.get("notifyScheduleId"));
		
		return recipientListData;
	}

	@Override
	public int updatePingActiveFlag(int notifyTemplateId, Boolean isActive,int lastModifiedBy,
			int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		int recordCount=jdbcTemplate.queryForInt(SP_UPDATE_PING_ACTIVE_FLAG,new Object[] {notifyTemplateId,isActive,lastModifiedBy});
		//System.out.println("recordCount:-----"+recordCount);
		return recordCount;
	}

	@Override
	public int clonePing(int notifyTemplateId, int lastModifiedBy, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		int recordCount=jdbcTemplate.queryForInt(SP_CLONE_PING,new Object[] {notifyTemplateId,lastModifiedBy});
		//System.out.println("recordCount:-----"+recordCount);
		return recordCount;
	}

	@Override
	public int markPingAsFavourite(int notifyTemplateId, int lastModifiedBy,
			int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		int recordCount=jdbcTemplate.queryForInt(SP_MARK_FAVOURITE_PING,new Object[] {notifyTemplateId,partyId,lastModifiedBy});
		//System.out.println("recordCount:-----"+recordCount);
		return recordCount;
	}

	@Override
	public int deletePing(String notifyTemplateIds, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		int recordCount=jdbcTemplate.queryForInt(SP_DELETE_PING,new Object[] {notifyTemplateIds});
		//System.out.println("recordCount:-----"+recordCount);
		return recordCount;
	}
	@Override
	public List<TagData> getTagsFroNotifyTempletId(int notifyTempletId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_TEMPLATE_MAPPED_TAG,new Object[] {notifyTempletId},
				new BeanPropertyRowMapper<TagData>(TagData.class));
		
		
	}
	@Override
	public List<ScheduledPindData> getScheduledPings(int partyId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_SCHEDULED_PINGS,new Object[] {partyId},
				new BeanPropertyRowMapper<ScheduledPindData>(ScheduledPindData.class));
	}
	@Override
	public RecipientListData getSchedulePingDatilsByScheduleId(int notifyScheduleID,int buId)
	{
		RecipientListData notifyTemplateData= jdbcTemplate.queryForObject(SP_RETRIVE_SCHEDULED_PINGS_BY_NOTIFYTEMPLETID,new Object[] {notifyScheduleID},
				new BeanPropertyRowMapper<RecipientListData>(RecipientListData.class) );
		//SelectedRecipientForSchedulePing obj =  new SelectedRecipientForSchedulePing();
		
		notifyTemplateData.setLstTagDatas(jdbcTemplate.query(SP_RETRIVE_TAG_DETAILS_FORSCHEDULED_PING,new Object[] {notifyScheduleID},
				new BeanPropertyRowMapper<TagData>(TagData.class)));
//		notifyTemplateData.setLstRecipientListData(jdbcTemplate.query(SP_RETRIVE_RECIPIENTDETAILS_FOR_SCHEDULE_PING,new Object[] {notifyScheduleID},
//				new BeanPropertyRowMapper<RecipientListData>(RecipientListData.class)));
//	
		
		
		//System.out.println("tag list in dao impl="+notifyTemplateData.getLstTagDatas());
		//System.out.println("recipientList in dao impl="+notifyTemplateData.getLstRecipientListData());
//		System.out.println("recipientList in dao impl="+notifyTemplateData.getObjselectedRecipientForSchedulePing());
		return notifyTemplateData;
	}
	public List<RecipientListData> getScheduleRecipientDatilsByScheduleId(int notifyScheduleID,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_RECIPIENTDETAILS_FOR_SCHEDULE_PING,new Object[] {notifyScheduleID},
				new BeanPropertyRowMapper<RecipientListData>(RecipientListData.class));
	}
	
	@Override
	public String deleteSchedulePings(String schedulePingIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteScheduledPings");
		SqlParameter queryIdsParam = new SqlParameter("schedulePingIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { queryIdsParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("schedulePingIds", schedulePingIds);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}
	
	@Override
	public List<String> sendCustomPing(NotifyTemplateData notifyTemplateData) {
		List<String> resultList=new ArrayList<>();
		List<DocumentData> documentDatas = notifyTemplateData.getDocumentDatas();
		String documentXML = FiinfraUtility.getDocumentXML(documentDatas);
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_sendCustomPing");
		
		SqlParameter PartyIDParam = new SqlParameter("PartyID", Types.INTEGER);
		SqlParameter DeliveryChannelIDParam = new SqlParameter("DeliveryChannelID", Types.INTEGER);
		SqlParameter UseSignatureIDParam = new SqlParameter("UseSignatureID", Types.INTEGER);
		SqlParameter NotifyTemplateXMLParam = new SqlParameter("NotifyTemplateXML", Types.VARCHAR);
		SqlParameter IsAttachmentParam = new SqlParameter("IsAttachment", Types.BOOLEAN);
		SqlParameter AttachmentCountParam = new SqlParameter("AttachmentCount", Types.INTEGER);
		SqlParameter sessionIdParam = new SqlParameter("sessionId", Types.VARCHAR);
		SqlParameter documentXMLParam = new SqlParameter("documentXML", Types.VARCHAR);
		SqlParameter partyIdStringParam = new SqlParameter("partyIdString", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlOutParameter basePathParam = new SqlOutParameter("basePath", Types.VARCHAR);
		SqlParameter[] paramArray = {PartyIDParam,DeliveryChannelIDParam,UseSignatureIDParam,NotifyTemplateXMLParam,IsAttachmentParam,AttachmentCountParam,sessionIdParam,documentXMLParam,partyIdStringParam,recordCountParam,basePathParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("PartyID", notifyTemplateData.getPartyID());
		paranValues.put("DeliveryChannelID", notifyTemplateData.getDeliveryChannelID());
		paranValues.put("UseSignatureID", notifyTemplateData.getUseSignatureID());
		paranValues.put("NotifyTemplateXML", notifyTemplateData.getNotifyTemplateXML());
		paranValues.put("IsAttachment", notifyTemplateData.isAttachment());
		paranValues.put("AttachmentCount", notifyTemplateData.getAttachmentCount());
		paranValues.put("sessionId", notifyTemplateData.getSessionId());
		paranValues.put("documentXML", FiinfraUtility.getDocumentXML(notifyTemplateData.getDocumentDatas()));
		paranValues.put("partyIdString", notifyTemplateData.getPartyIDString());
		logger.debug("paranValues:--" + paranValues);
		//System.out.println("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
	
		
		int recordCount1 =  (int) storedProcResult.get("recordCount");
	String recordCount2 = ""+recordCount1;
		logger.debug("recordCount1:---" + recordCount2);
		
		if(notifyTemplateData.getNotifyTemplateXML2() != "" && notifyTemplateData.getNotifyTemplateXML2() != null){

		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		 l = new ArrayList<Map<String, Object>>();
		 myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_sendCustomPing");
		
		 PartyIDParam = new SqlParameter("PartyID", Types.INTEGER);
		 DeliveryChannelIDParam = new SqlParameter("DeliveryChannelID", Types.INTEGER);
		 UseSignatureIDParam = new SqlParameter("UseSignatureID", Types.INTEGER);
		 NotifyTemplateXMLParam = new SqlParameter("NotifyTemplateXML", Types.VARCHAR);
		 IsAttachmentParam = new SqlParameter("IsAttachment", Types.BOOLEAN);
		 AttachmentCountParam = new SqlParameter("AttachmentCount", Types.INTEGER);
		 sessionIdParam = new SqlParameter("sessionId", Types.VARCHAR);
		 documentXMLParam = new SqlParameter("documentXML", Types.VARCHAR);
		 partyIdStringParam = new SqlParameter("partyIdString", Types.VARCHAR);
		 recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		  basePathParam = new SqlOutParameter("basePath", Types.VARCHAR);
		  SqlParameter[] paramArray2  = {PartyIDParam,DeliveryChannelIDParam,UseSignatureIDParam,NotifyTemplateXMLParam,IsAttachmentParam,AttachmentCountParam,sessionIdParam,documentXMLParam,partyIdStringParam,recordCountParam,basePathParam};
		myStoredProcedure.setParameters(paramArray2);
		myStoredProcedure.compile();
		paranValues = new HashMap<String, Object>();
		paranValues.put("PartyID", notifyTemplateData.getPartyID());
		paranValues.put("DeliveryChannelID", notifyTemplateData.getDeliveryChannelID());
		paranValues.put("UseSignatureID", 0);
		String notifyxml = notifyTemplateData.getNotifyTemplateXML2().replace("{!ticketno}", recordCount2);
		 logger.debug("notifyTemplateData.getNotifyTemplateXML2():---" + notifyxml);
		paranValues.put("NotifyTemplateXML", notifyxml);
		paranValues.put("IsAttachment", notifyTemplateData.isAttachment());
		paranValues.put("AttachmentCount", notifyTemplateData.getAttachmentCount());
		paranValues.put("sessionId", notifyTemplateData.getSessionId());
		paranValues.put("documentXML", FiinfraUtility.getDocumentXML(notifyTemplateData.getDocumentDatas()));
		paranValues.put("partyIdString", notifyTemplateData.getPartyIDString());
		logger.debug("paranValues:--" + paranValues);
		//System.out.println("paranValues:--" + paranValues);
		 storedProcResult = myStoredProcedure
				.execute(paranValues);
		}
		
		
		int recordCount=(int) storedProcResult.get("recordCount");
		String basePath=(String) storedProcResult.get("basePath");
		resultList.add(String.valueOf(recordCount));
		resultList.add(basePath);
		return resultList;
	}


	@Override
	public NotifyTemplateData resolveTagsTemplateXML(
			NotifyTemplateData notifyTemplateData) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.AXISMFBUID));
		return jdbcTemplate.queryForObject(SP_RESOLVE_TAGS_TEMPLATE_XML,new Object[] {notifyTemplateData.getNotifyTemplateXML(),notifyTemplateData.getPartyID(),notifyTemplateData.getDeliveryChannelID(),notifyTemplateData.getUseSignatureID()},
				new BeanPropertyRowMapper<NotifyTemplateData>(NotifyTemplateData.class) );
	}
	
	public List<NotifyTemplateData> getMatchingTagsAndPotentialPings(int ownerpartyId,int partyId, int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_MATTCHING_TAGS_AND_POTENTIALPINGS,new Object[] {ownerpartyId,partyId},
				new BeanPropertyRowMapper<NotifyTemplateData>(NotifyTemplateData.class));
	}
	
	public List<RecipientListData> getDelivaryHistory(int partyId,int buId,int notifyTemplateId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_DELIVARY_HISTORY_PING,new Object[] {partyId,notifyTemplateId},
				new BeanPropertyRowMapper<RecipientListData>(RecipientListData.class));
	}
	public OpportunityData getEmailAndContactOfContact(int contactId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		OpportunityData objOppData = jdbcTemplate.queryForObject(SP_RETRIVE_CONTACT_DETAILSOF_CONTACTFORPING,new Object[] {contactId},
				new BeanPropertyRowMapper<OpportunityData>(OpportunityData.class) );
		return objOppData;
		
	}
	
	public DndData insertDnd(DndData dndData)
	{
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(dndData.getBuId()));
		
		
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_saveDnds");
		SqlParameter notifyPartyIdParam = new SqlParameter("notifyPartyId", Types.INTEGER);
		SqlParameter delivaryChannelParam = new SqlParameter("delivaryChannel",
				Types.INTEGER);
		
		SqlParameter isActiveParam = new SqlParameter("isActive",
				Types.BOOLEAN);
		
		SqlParameter createdByParam = new SqlParameter("createdBy",
				Types.INTEGER);
		SqlParameter dndReasonParam = new SqlParameter("dndReason",
				Types.VARCHAR);
		
		SqlOutParameter dndIdDbParam = new SqlOutParameter("dndIdDb",
				Types.INTEGER);
		
		SqlParameter dndIdByParam = new SqlParameter("dndId",
				Types.INTEGER);
		// SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { notifyPartyIdParam,delivaryChannelParam, isActiveParam,
				createdByParam, dndReasonParam ,dndIdDbParam,dndIdByParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("notifyPartyId", dndData.getContactPartyId());
		paranValues.put("delivaryChannel", dndData.getDelivaryChannel());
		paranValues.put("isActive", dndData.isActive());
		paranValues.put("createdBy", dndData.getCreatedBy());
		paranValues.put("dndReason", dndData.getDndReason());
		paranValues.put("dndId", dndData.getDndId_Add_Edit());
		logger.debug("paramValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		dndData.setNotifyDndId((Integer) storedProcResult.get("dndIdDb"));
		return dndData;
	}
	public List<DndData> getDelivaryHistory(int partyId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_DNDS,new Object[] {partyId},
				new BeanPropertyRowMapper<DndData>(DndData.class));
	}
	
	public DndData getDNDDetails(int dndId,int buId)
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.queryForObject(SP_RETRIVE_DND_DETAILSBY_DNDID,new Object[] {dndId},
				new BeanPropertyRowMapper<DndData>(DndData.class));
	}
	
	@Override
	public String deleteDNDs(String dndIds,int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteDnds");
		SqlParameter queryIdsParam = new SqlParameter("dndIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER); 
		SqlParameter[] paramArray = { queryIdsParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("dndIds", dndIds);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}

	@Override
	public Integer updatePingRecipient(int partyId, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		Integer recordCount = 0;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_batch_matchPartyAgainstTag");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter[] paramArray = {partyIdParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		recordCount=1;
		return recordCount;
	}

}
