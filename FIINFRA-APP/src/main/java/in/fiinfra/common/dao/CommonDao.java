package in.fiinfra.common.dao;


import in.fiinfra.common.admin.AddChat;
import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.BroadCastData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.ContactUsData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentValueData;
import in.fiinfra.common.common.FaqsQuestionsData;
import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.QueryRequest;
import in.fiinfra.common.common.RecommandedProdForGoal;
import in.fiinfra.common.common.SearchResultData;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.util.List;

import javax.ws.rs.core.Response;

public interface CommonDao {

	List<SearchResultData> getSearchList(int partyId, int buId,String searchText);
	List<CodeValueData> getQueryPicklistValues(String codeTypeIds,int buId);
	public List<CodeValueData> getContatcDetails(int roleId,int loggedInUserPartyId,int buId);
	public List<UserData> getUserList(int recordType,int loggedInUserPartyId,int buId);
	public List<Object> getChatAndComments(int loggedInUserPartyId,int startValue,int buId,int nodeId);
	List<DocumentValueData> getDownloadsList(int buId,String sourceSysId);
	List<FaqsQuestionsData> getFaqsQuestionsList(int buId,int sourceSystemId);
	List<ContactUsData> getContactUsRecord(int buId);
	QueryData saveQuery(QueryData queryData);
	String deleteQuery(String queryIds,int buId);
	String getAttachmentForRequestQ(String docId, String partyId, String reportTypeId);
	List<QueryData> getQueryList(int partyId, int buId,String queryPanel,String querySearchValue,int nodeId);
	List<BroadCastData> getBroadCastList(int buId,int sourceSystemId);
	List<QueryData> getQueries(int buId, QueryRequest queryRequest);
	
	List<Integer> getUnreadQueryCountWithSearch(int buId, QueryRequest queryRequest);
	
	
	List<QueryData> getQueriesForClient(int buId, QueryRequest queryRequest);
	

	public AddChat saveChat(AddChat addChat);
	
//	NotesData saveNote(NotesData noteData);
//	String deleteNote(String noteIds,int buId);
//	List<NotesData> getNoteList(int partyId, int buId);

	List<Integer> getUnreadQueryCount(int partyId, int buId, String queryPanel,String searchValue,int nodeId);
	QueryData getQueryDetails(int queryId,int partyId,int buId);
	DocumentData getDocumentDetails(int docId,int buId);
	QueryCommentData saveComment(QueryCommentData queryCommentData);

	public List getUserForTagging(int partyId,String searchText ,int buId);

	PartyData getAllocatedTeamMembers(int partyId, int buId);
	List<CodeValueData> getCityList(int parentId, int buId);

	Integer updateQueryStatus(int queryId, int status, int buId,
			int lastUpdatedBy);

	List<CodeValueData> getCodeValues(String codeType, int buId);
	void doAudit(Audit audit);
	void insertNotification(Notification notification);
	List<CodeValueData> getCodeValuesForParentId(Integer parentId, Integer buId);

	Integer updatePassword(in.fiinfra.common.common.UserData userData);

	List<CodeValueData> getCountries(Integer codeValueId, Integer buId);
	Integer getCodeValuIdsForCodeValue(Integer parentId, String codeValue,
			Integer buId);
	String insertDocuments(String documentXML,int partyId,int buId);
	Integer deleteObject(String ids, String object, int buId);
	List<String> getNonAccessibleControlIds(int partyId, int buId,int sourceSystemId);
	Response getPassword(User user);
	Response updateUserPassword(User user);
	Response getUserProfile(User user);
	Response updateProfile(User user);
	public Response getReloadNotesList(int partyId, int buId);
	public Response getReloadDocumentsList(int partyId, int buId);
	
	//to get product for goal
	public List<String> getRecommandedProductForGoal(int buId,int partyId,RecommandedProdForGoal RecommandedProdForGoal);
}
