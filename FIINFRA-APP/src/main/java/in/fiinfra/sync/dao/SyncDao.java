package in.fiinfra.sync.dao;

import in.fiinfra.common.common.SyncRequest;
import in.fiinfra.common.common.UserTokenRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.diy.models.UserToken;
import in.fiinfra.common.partner.BatchJob;
import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.sync.DcAttribute;
import in.fiinfra.sync.DcGoal;

import java.util.List;

public interface SyncDao {

	
	List<SyncContactData> getContactData(SyncRequest req);
	List<QuestionData> getQuestionData(SyncRequest req,int sectionId);
	UserToken saveUserToken(UserToken userToken);
	List<UserToken> getUserToken(UserTokenRequest req);
	SyncData getSyncData(SyncRequest req);
	Integer saveBatchJob(BatchJob batch);
	Integer getPartyId(Integer ownerPartyId, SyncContactData party);
	
}
