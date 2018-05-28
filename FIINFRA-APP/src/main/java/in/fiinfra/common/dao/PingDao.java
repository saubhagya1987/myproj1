package in.fiinfra.common.dao;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DndData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.RecipientListData;
import in.fiinfra.common.common.ScheduledPindData;
import in.fiinfra.common.common.TagData;
import in.fiinfra.common.opportunity.OpportunityData;

import java.util.List;

public interface PingDao{ 

	List<TagData> getTagList(int buId);

	List<CodeValueData> getStandardTagsForNotificationTarget(int notifyTargetId, int buId);
	List<TagData> getTagsList(int buId);
	
	String deleteTags(String tagIds,int buId); 
	TagData insertTags(TagData tagData);
	List<String> insertOrUpdatePing(NotifyTemplateData notifyTemplateData);
	TagData getTagDetailsByTagId(int tagId ,  int buId);
	NotifyTemplateData getPingRecord(int notifyTemplateId, int buId);

	List<CodeValueData> getTagValueList(int notifyTagId, int buId);

	List<NotifyTemplateData> getStandardPingList(int partyId, int buId,int nodeId);
	List<RecipientListData>  getRecipientList(String notifyTagId, int buId,String recipientType,int notifyTempletId,int partyId);
	RecipientListData insertSchedulePings(RecipientListData recipientListData);
	int updatePingActiveFlag(int notifyTemplateId, Boolean isActive,int lastModifiedBy, int buId);

	int clonePing(int notifyTemplateId, int lastModifiedBy, int buId);

	int markPingAsFavourite(int notifyTemplateId, int lastModifiedBy,
			int partyId, int buId);

	int deletePing(String notifyTemplateIds, int buId);
	List<TagData> getTagsFroNotifyTempletId(int notifyTempletId,int buId);
	List<ScheduledPindData> getScheduledPings(int partyId,int buId);
	RecipientListData getSchedulePingDatilsByScheduleId(int notifyScheduleID,int buId);
	List<RecipientListData> getScheduleRecipientDatilsByScheduleId(int notifyScheduleID,int buId);
	String  deleteSchedulePings(String schedulePingIds,int buId);
	
	List<String> sendCustomPing(NotifyTemplateData notifyTemplateData);

	NotifyTemplateData resolveTagsTemplateXML(
			NotifyTemplateData notifyTemplateData);
	
	List<NotifyTemplateData> getMatchingTagsAndPotentialPings(int ownerpartyId,int partyId, int buId);
	
	List<RecipientListData> getDelivaryHistory(int partyId,int buId ,int notifyTemplateId);
	OpportunityData getEmailAndContactOfContact(int contactId,int buId);
	
	DndData insertDnd(DndData dndData);
	List<DndData> getDelivaryHistory(int partyId,int buId);
	
	DndData getDNDDetails(int dndId,int buId);
	String deleteDNDs(String dndIds, int buId);

	Integer updatePingRecipient(int partyId, int buId);
}
