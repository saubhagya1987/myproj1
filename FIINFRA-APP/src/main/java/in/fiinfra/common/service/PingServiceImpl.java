package in.fiinfra.common.service;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DndData;
import in.fiinfra.common.common.NotifyTemplateData;
import in.fiinfra.common.common.RecipientListData;
import in.fiinfra.common.common.ScheduledPindData;
import in.fiinfra.common.common.TagData;
import in.fiinfra.common.dao.PingDao;
import in.fiinfra.common.opportunity.OpportunityData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class PingServiceImpl implements PingService{

	@Autowired
	private PingDao pingDao;
	
	@Override
	public List<TagData> getTagList(int buId) {
		return pingDao.getTagList(buId);
	}

	@Override
	public List<CodeValueData> getStandardTagsForNotificationTarget(int notifyTargetId, int buId) {
		return pingDao.getStandardTagsForNotificationTarget(notifyTargetId,buId);
	}
	
	@Override
	public List<TagData> getTagsList(int buId) {
		return pingDao.getTagsList(buId);
	}
	 
	@Override
	public String deleteTags(String tagIds,int buId)
	{
		return pingDao.deleteTags( tagIds, buId);
	}
	
	@Override
	public TagData insertTags(TagData tagData)
	{
		return pingDao.insertTags( tagData);
	}

	@Override
	public List<String> insertOrUpdatePing(NotifyTemplateData notifyTemplateData) {
		return pingDao.insertOrUpdatePing(notifyTemplateData);
	}
	@Override
	public TagData getTagDetailsByTagId(int tagId ,  int buId)
	{
		return pingDao.getTagDetailsByTagId(tagId, buId);
	}

	@Override
	public NotifyTemplateData getPingRecord(int notifyTemplateId, int buId) {
		return pingDao.getPingRecord(notifyTemplateId,buId);
	}

	@Override
	public List<CodeValueData> getTagValueList(int notifyTagId, int buId) {
		return pingDao.getTagValueList(notifyTagId,buId);
	}

	@Override
	public List<NotifyTemplateData> getStandardPingList(int partyId, int buId,int nodeId) {
		return pingDao.getStandardPingList(partyId,buId,nodeId);
	}

	public List<RecipientListData> getRecipientList(String notifyTagId, int buId , String recipientType , int notifyTempletId,int partyId) {
		return pingDao.getRecipientList(notifyTagId,buId,recipientType,notifyTempletId,partyId);
	}
	
	@Override
	public RecipientListData insertSchedulePings(RecipientListData recipientListData)
	{
		return pingDao.insertSchedulePings(recipientListData);
	}
	
	@Override
	public int updatePingActiveFlag(int notifyTemplateId, Boolean isActive,int lastModifiedBy,
			int buId) {
		return pingDao.updatePingActiveFlag(notifyTemplateId,isActive,lastModifiedBy,buId);
	}

	@Override
	public int clonePing(int notifyTemplateId, int lastModifiedBy, int buId) {
		return pingDao.clonePing(notifyTemplateId,lastModifiedBy,buId);
	}

	@Override
	public int markPingAsFavourite(int notifyTemplateId, int lastModifiedBy,
			int partyId, int buId) {
		return pingDao.markPingAsFavourite(notifyTemplateId,lastModifiedBy,partyId,buId);
	}

	@Override
	public int deletePing(String notifyTemplateIds, int buId) {
		return pingDao.deletePing(notifyTemplateIds,buId);
	}
	
	@Override
	public List<TagData> getTagsFroNotifyTempletId(int notifyTempletId,int buId)
	{
		return pingDao.getTagsFroNotifyTempletId(notifyTempletId,buId);
	}
	@Override
	public List<ScheduledPindData> getScheduledPings(int partyId,int buId)
	{
		return pingDao.getScheduledPings(partyId,buId);
	}
	@Override
	public RecipientListData getSchedulePingDatilsByScheduleId(int notifyScheduleID,int buId)
	{
		return pingDao.getSchedulePingDatilsByScheduleId(notifyScheduleID,buId);
	}
	@Override
	public List<RecipientListData> getScheduleRecipientDatilsByScheduleId(int notifyScheduleID,int buId)
	{
		return pingDao.getScheduleRecipientDatilsByScheduleId(notifyScheduleID,buId);
	}
	public String  deleteSchedulePings(String schedulePingIds,int buId)
	{
		return pingDao.deleteSchedulePings(schedulePingIds,buId);
	}
	@Override
	public List<String> sendCustomPing(NotifyTemplateData notifyTemplateData) {
		return pingDao.sendCustomPing(notifyTemplateData);
	}

	@Override
	public NotifyTemplateData resolveTagsTemplateXML(
			NotifyTemplateData notifyTemplateData) {
		return pingDao.resolveTagsTemplateXML(notifyTemplateData);
	}
	@Override
	public List<NotifyTemplateData> getMatchingTagsAndPotentialPings(int ownerpartyId,int partyId, int buId)
	{
		return pingDao.getMatchingTagsAndPotentialPings(ownerpartyId,partyId,buId);
	}
	
	@Override
	public List<RecipientListData> getDelivaryHistory(int partyId,int buId,int notifyTemplateId)
	{
		return pingDao.getDelivaryHistory(partyId,buId,notifyTemplateId);
	}
	
	public OpportunityData getEmailAndContactOfContact(int contactId,int buId)
	{
		return pingDao.getEmailAndContactOfContact(contactId,buId);
	}
	
	public DndData insertDnd(DndData dndData)
	{
		return pingDao.insertDnd(dndData);
	}
	
	public List<DndData> getDelivaryHistory(int partyId,int buId)
	{
		return pingDao.getDelivaryHistory(partyId,buId);
	}
	public DndData getDNDDetails(int dndId,int buId)
	{
		return pingDao.getDNDDetails(dndId,buId);
	}
	public String deleteDNDs(String dndIds,int buId) {
		return pingDao.deleteDNDs(dndIds,buId);
	}

	@Override
	public Integer updatePingRecipient(int partyId, int buId) {
		return pingDao.updatePingRecipient(partyId,buId);
	}
}
