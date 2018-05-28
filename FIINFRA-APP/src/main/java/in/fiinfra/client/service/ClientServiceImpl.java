package in.fiinfra.client.service;

import java.util.List;

import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

import in.fiinfra.client.dao.ClientDao;


import in.fiinfra.common.client.ClientData;
import in.fiinfra.common.client.ClientProfileData;





import in.fiinfra.common.opportunity.OpportunityStageData;

import org.springframework.beans.factory.annotation.Autowired;

public class ClientServiceImpl implements ClientService{
	@Autowired
	private ClientDao clientDao;

	public ClientDao getClientDao() {
		return clientDao;
	}

	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}

	@Override
	public Response getClientList(int partyId, int buId,String clientValueSearch,boolean IsAutoPlan,int nodeId,int pageNo,int pageSize,String orderBy,String sord) {
		Response result = clientDao.getClientList(partyId,buId,clientValueSearch,IsAutoPlan,nodeId,pageNo,pageSize,orderBy,sord);
		return result;
	}
//	public Response getClientList(int partyId, int buId,String clientValueSearch,boolean IsAutoPlan,int nodeId,int pageNo,int pageSize,String orderBy) {
//		Response result=clientDao.getClientList(partyId,buId,clientValueSearch,IsAutoPlan,nodeId,pageNo,pageSize,orderBy);
//		return result;
//	}
//	
	@Override
	public List<OpportunityStageData> getClientStageList(int partyId,
			int buId,int nodeId) {
		List<OpportunityStageData> clientStageDatas=clientDao.getClientStageList(partyId, buId, nodeId);
		return clientStageDatas;
	}
	
	@Override
	public List<Integer> saveClient(int partyId, String clientXMLString, int createdBy,int buId) {
		List<Integer> recordCount=clientDao.saveClient(partyId,clientXMLString,createdBy,buId);
		return recordCount;
	}
	
	@Override
	public String deleteClient(String partyIds,int buId,int createdBy) {
		String result=clientDao.deleteClient(partyIds,buId,createdBy);
		return result;
	}
	
	@Override
	public ClientProfileData getClientProfileRecord(int partyId, int buId) {
		ClientProfileData clientProfileData=clientDao.getClientProfileRecord(partyId,buId);
		return clientProfileData;
	}
	
	@Override
	public List<Integer> updateClientProfile(String sectionName, String dataXml,
			int buId, int partyId,int lastModifiedBy) {
		List<Integer> recordCount=clientDao.updateClientProfile(sectionName,dataXml,buId,partyId,lastModifiedBy);
		return recordCount;
	}
	@Override
	public List<ClientData> getClientListToMerge(int partyId,int buId,int contactpartyId,boolean isAllClients,boolean isFromProfile,int nodeId,String searchString)
	{
		List<ClientData> clientDatas=clientDao.getClientListToMerge(partyId,buId,contactpartyId,isAllClients,isFromProfile,nodeId,searchString);
		return clientDatas;
	}
	@Override
	public String mergeClients(int partyId,String mergeClientIds,int buId,int contactPartyId)
	{
		String result=clientDao.mergeClients(partyId,mergeClientIds,buId,contactPartyId);
		return result;
	}
}
