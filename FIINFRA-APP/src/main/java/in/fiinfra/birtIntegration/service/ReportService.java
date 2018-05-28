package in.fiinfra.birtIntegration.service;

import javax.ws.rs.core.Response;

public interface ReportService {


	public Response getCompanyId(int buId,int partyId);
	public Response getProductId(int buId,int compartyid,int partyId);
	public Response getInvestorStartDate(int buId,int productId,int partyId);
	public Response getIssuerID(int buId);

	public Response getCompanyID(int buId, int partyID);

	public Response getPartnerList(int buId,String searchString,int partyId);
	public Response getClientList(String searchString,int partnerId);
	public Response getClientListOnly(String searchString,int partnerId,int nodeId);
	public Response getSectionTypeID(int buId);
	public Response getServiceTeamMember(int buId);
	
}
