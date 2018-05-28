package in.fiinfra.birtIntegration.dao;

import javax.ws.rs.core.Response;

public interface ReportDao 
{
Response getCompanyId(int buId,int partyId);
Response getProductId(int buId,int compartyid,int partyId);
Response getInvestorStartDate(int buId,int productId,int partyId);
Response getCompanyID(int buId,int partyID);
Response getPartnerList(int buId,String searchString,int partyId);	
Response getClientList(String searchString,int partnerId);	
Response getClientListOnly(String searchString,int partnerId,int nodeId);	
Response getSectionTypeID(int buId);
Response getServiceTeamMember(int buId);

	//List<OpportunityStatus> getCodeValueDescription();

}
