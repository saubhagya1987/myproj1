package in.fiinfra.client.service;

import in.fiinfra.common.client.ClientData;



import in.fiinfra.common.client.ClientProfileData;




import in.fiinfra.common.opportunity.OpportunityStageData;

import java.util.List;

import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

public interface ClientService{
//	List<ClientData> getClientList(int partyId, int buId,String clientValueSearch, boolean isAutoPlan,int nodeId,int pageNo,int pageSize,String orderBy);
	public Response getClientList(int partyId, int buId,String clientValueSearch, boolean isAutoPlan,int nodeId,int pageNo,int pageSize,String orderBy,String sord);
	List<Integer> saveClient(int partyId, String clientXMLString, int createdBy,int buId);
	String deleteClient(String partyIds,int buId,int createdBy);
	//Client Profile
	ClientProfileData getClientProfileRecord(int partyId, int buId);

	List<Integer> updateClientProfile(String sectionName, String dataXml,
			int buId, int partyId,int lastModifiedBy);
	
	
	List<OpportunityStageData> getClientStageList(int partyId, int buId, int nodeId);
	List<ClientData> getClientListToMerge(int partyId,int buId,int contactpartyId,boolean isAllClients,boolean isFromProfile,int nodeId,String searchString);
	String mergeClients(int partyId,String mergeClientIds,int buId,int contactPartyId);
}
