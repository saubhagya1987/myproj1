package in.fiinfra.query.ctrl.service;

import in.fiinfra.common.common.PartyData;
import in.fiinfra.common.common.QueryCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.common.QueryRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;

import java.util.List;

import javax.ws.rs.core.Response;

public class QueryService extends BasicService {

	public List<QueryData> searchQuery(QueryRequest request) {
		return getService().getForObjectCollection(Services.getQueryList,
				request, QueryData.class, appendPathParam());
	}

	public QueryData addUpdateQuery(QueryData query) {
		return getService().postForObject(Services.insertQuery, query,
				QueryData.class, appendPathParam());
	}

	public QueryCommentData addUpdateComment(QueryCommentData query) {
		return getService().postForObject(Services.insertQueryComment, query,
				QueryCommentData.class, appendPathParam());
	}

	public QueryData getQuery(int partyId, int queryId ) {
		QueryRequest request = new QueryRequest();
		request.setQueryId(queryId);
		request.setPartyId(partyId);
		return getService().getForObject(Services.getQueryRecord, request,
				QueryData.class, appendPathParam());
	}

	public PartyData getAllocatedTeamMember(QueryRequest request) {
		return getService().getForObject(Services.getAllocatedTeamMemberList,
				request, PartyData.class, appendPathParam());
	}

	public List<Integer> getUnreadCount(QueryRequest q) {
		return getService().getForObjectCollection(
				Services.getUnreadQueryCountList, q, Integer.class,
				appendPathParam());
	}

	public QueryCommentData insertQueryComment(QueryCommentData comment) {
		return getService().postForObject(Services.insertQueryComment, comment,
				QueryCommentData.class, appendPathParam());
	}

	public Response deleteQuery(QueryRequest q) {
		return getService().getForObject(Services.deleteQuery, q,
				Response.class, appendPathParam());
	}

	public Integer updateStatus(QueryRequest q) {
		return getService().getForObject(Services.updateQueryStatus, q,
				Integer.class, appendPathParam());
	}

	public List<KeyValue> getPartyName(QueryRequest q, int recordType) {
		String[] params = { "ramu", "" + q.getPartyId(), "" + recordType,
				"1234" };
		return getService().getForObjectCollection(Services.getPartyName, q,
				KeyValue.class, params);
	}

}
