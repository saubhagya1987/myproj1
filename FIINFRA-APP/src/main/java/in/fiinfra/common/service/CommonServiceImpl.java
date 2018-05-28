package in.fiinfra.common.service;


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
import in.fiinfra.common.dao.CommonDao;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommonServiceImpl implements CommonService{
	 
	@Autowired
	private CommonDao commonDao;
	@Override
	public List<CodeValueData> getQueryPicklistValues(String codeTypeIds,int buId) {
		List<CodeValueData> codeValueDataList=commonDao.getQueryPicklistValues(codeTypeIds,buId);
		/*CodeValueData c = new CodeValueData();
		CodeValueData d = new CodeValueData();
		c.setCodeTypeId(5555);
		c.setCodeValue("Code Value 55555");

		d.setCodeTypeId(66666);
		d.setCodeValue("Code Value 6666");
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		codeValueDataList.add(c);
		codeValueDataList.add(d);*/
		return codeValueDataList;
	}
	public CommonDao getCommonDao() {
		return commonDao;
	}
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	@Override
	public List<SearchResultData> getSearchList(int partyId, int buId,String searchText) {
		List<SearchResultData> searchResultDatas=commonDao.getSearchList(partyId,buId,searchText);
		return searchResultDatas;
	}
	
	@Override
	public List<CodeValueData> getContatcDetails(int roleId,int loggedInUserPartyId,int buId) {
		List<CodeValueData> codeValueDataList=commonDao.getContatcDetails( roleId, loggedInUserPartyId,buId);
		return  codeValueDataList;
	}
	
	@Override
	public List<UserData> getUserList(int recordType,int loggedInUserPartyId,int buId) {
		List<UserData> userList=commonDao.getUserList( recordType, loggedInUserPartyId,buId);
		return  userList;
	}
	
	@Override
	public List<Object> getChatAndComments(int loggedInUserPartyId,int startValue,int buId,int nodeId) {
		List<Object> chatterList=commonDao.getChatAndComments(loggedInUserPartyId,startValue,buId,nodeId);
		return  chatterList;
	}
	
	@Override
	public List getUserForTagging(int loggedInUserPartyId,String searchText ,int buId) {
		List chatterList=commonDao.getUserForTagging(loggedInUserPartyId,searchText,buId);
		return  chatterList;
	}

	@Override
	public List<DocumentValueData> getDownloadsList(int buId,String sourceSysId) {
		List<DocumentValueData> documentValueData = commonDao.getDownloadsList(buId,sourceSysId);
	return documentValueData;
	}	

	@Override
	public List<FaqsQuestionsData> getFaqsQuestionsList(int buId,int sourceSystemId) {
		List<FaqsQuestionsData> faqsQuestionsData = commonDao.getFaqsQuestionsList(buId,sourceSystemId);
	return faqsQuestionsData;
	}	
	
	@Override
	public List<BroadCastData> getBroadCastList(int buId,int sourceSystemId) {
		List<BroadCastData> broadCastDatas = commonDao.getBroadCastList(buId,sourceSystemId);
	return broadCastDatas;
	}	


	@Override
	public List<ContactUsData> getContactUsRecord(int buId) {
		List<ContactUsData> contactUsData = commonDao.getContactUsRecord(buId);
	return contactUsData;
	}	

	
	@Override
	public QueryData saveQuery(QueryData queryData) {
		queryData=commonDao.saveQuery(queryData);
		return queryData;
	}
	@Override
	public String deleteQuery(String queryIds,int buId) {
		String result=commonDao.deleteQuery(queryIds,buId);
		return result;
	}
	@Override
	public String getAttachmentForRequestQ(String docId, String partyId, String reportTypeId){
		String result=commonDao.getAttachmentForRequestQ(docId,partyId,reportTypeId);
		return result;
	}
	
	@Override
	public List<QueryData> getQueryList(int partyId, int buId,String queryPanel,String querySearchValue,int nodeId) {
		List<QueryData> queryDatas=commonDao.getQueryList(partyId,buId,queryPanel,querySearchValue,nodeId);
		return queryDatas;
	}
	
	@Override
	public List<QueryData> getQueries(int buId, QueryRequest queryRequest){
		if(queryRequest.getSubject() != null) {
			queryRequest.setSubject(queryRequest.getSubject().replace("_", " "));
		}
		List<QueryData> queryDatas=commonDao.getQueries(buId, queryRequest);
		return queryDatas;
	}
	
	@Override
	public List<Integer> getUnreadQueryCountWithSearch(int buId, QueryRequest queryRequest){
		return commonDao.getUnreadQueryCountWithSearch(buId, queryRequest);
	}
	

	@Override
	public List<QueryData> getQueriesForClient(int buId, QueryRequest queryRequest){
		List<QueryData> queryDatas=commonDao.getQueriesForClient(buId, queryRequest);
		return queryDatas;
	}


	
//	@Override
//	public NotesData saveNote(NotesData noteData) {
//		noteData=commonDao.saveNote(noteData);
//		return noteData;
//	}
//	@Override
//	public String deleteNote(String noteIds,int buId) {
//		String result=commonDao.deleteNote(noteIds,buId);
//		return result;
//	}
//	@Override
//	public List<NotesData> getNoteList(int partyId, int buId) {
//		List<NotesData> noteDatas=commonDao.getNoteList(partyId,buId);
//		return noteDatas;
//	}
//	
	@Override
	public AddChat saveChat(AddChat addChat)
	{
		addChat=commonDao.saveChat(addChat);
		return addChat;
	}

	@Override
	public List<Integer> getUnreadQueryCount(int partyId, int buId, String queryPanel,String searchValue,int nodeId) {
		List<Integer> unreadQueryCount=commonDao.getUnreadQueryCount(partyId,buId,queryPanel,searchValue,nodeId);
		return unreadQueryCount;
	}
	@Override
	public QueryData getQueryDetails(int queryId,int partyId,int buId) {
		QueryData queryData=commonDao.getQueryDetails(queryId,partyId,buId);
		return queryData;
	}
	@Override
	public DocumentData getDocumentDetails(int docId,int buId) {
		DocumentData documentData=commonDao.getDocumentDetails(docId,buId);
		return documentData;
	}
	@Override
	public QueryCommentData saveComment(QueryCommentData queryCommentData) {
		queryCommentData=commonDao.saveComment(queryCommentData);
		return queryCommentData;
	}
	@Override
	public PartyData getAllocatedTeamMembers(int partyId, int buId) {
		PartyData partyData=commonDao.getAllocatedTeamMembers(partyId,buId);
		return partyData;
	}
	@Override
	public List<CodeValueData> getCityList(int parentId, int buId) {
		List<CodeValueData> cityList=commonDao.getCityList(parentId,buId);
		return cityList;
	}
	@Override
	public Integer updateQueryStatus(int queryId, int status, int buId,
			int lastUpdatedBy) {
		Integer recordCount=commonDao.updateQueryStatus(queryId,status,buId,lastUpdatedBy);
		return recordCount;
	}
	
	@Override
	public List<CodeValueData> getCodeValues(String codeType, int buId) {
		return commonDao.getCodeValues(codeType, buId);
	}
	@Override
	public void doAudit(Audit audit) {
		commonDao.doAudit(audit);
	}
	@Override
	public void insertNotification(Notification notification) {
		commonDao.insertNotification(notification);
		
	}
	@Override
	public List<CodeValueData> getCodeValuesForParentId(Integer parentId,Integer buId) {
		return commonDao.getCodeValuesForParentId(parentId, buId);
	}

	@Override
	public Integer updatePassword(in.fiinfra.common.common.UserData userData) {
		Integer result=commonDao.updatePassword(userData);
		return result;
	}

	@Override
	public List<CodeValueData> getCountries(Integer codeValueId,Integer buId) {
		return commonDao.getCountries(codeValueId,buId);
	}
	@Override
	public Integer getCodeValuIdsForCodeValue(Integer parentId,
			String codeValue, Integer buId) {
		return commonDao.getCodeValuIdsForCodeValue(parentId, codeValue, buId);
	}
	@Override
	public String insertDocuments(String documentXML,int partyId,int buId) {
		return commonDao.insertDocuments(documentXML,partyId,buId);
	}
	@Override
	public Integer deleteObject(String ids, String object, int buId) {
		return commonDao.deleteObject(ids,object,buId);
	}
	@Override
	public List<String> getNonAccessibleControlIds(int partyId, int buId,int sourceSystemId) {
		return commonDao.getNonAccessibleControlIds(partyId,buId,sourceSystemId);
	}
	@Override
	public Response getPassword(User user) {
		// TODO Auto-generated method stub
		return commonDao.getPassword(user);
		
	}
	@Override
	public Response updateUserPassword(User user) {
		// TODO Auto-generated method stub
		Response r;
		 r=commonDao.updateUserPassword(user);
		 return r;
	}
	@Override
	public Response getUserProfile(User user) {
		// TODO Auto-generated method stub
		return commonDao.getUserProfile(user);
	}
	@Override
	public Response updateProfile(User user) {
		// TODO Auto-generated method stub
		return commonDao.updateProfile(user);
	}

	public Response getReloadNotesList(int partyId,
			int buId) {
		Response result = commonDao.getReloadNotesList(partyId,buId);
		return result;
	}
	
	public Response getReloadDocumentsList(int partyId,
			int buId) {
		Response result = commonDao.getReloadDocumentsList(partyId,buId);
		return result;
	}
	@Override
	public List<String> getRecommandedProductForGoal(int buId, int partyId,
			RecommandedProdForGoal RecommandedProdForGoal) {
		return commonDao.getRecommandedProductForGoal(buId, partyId, RecommandedProdForGoal);
		
	}


}
