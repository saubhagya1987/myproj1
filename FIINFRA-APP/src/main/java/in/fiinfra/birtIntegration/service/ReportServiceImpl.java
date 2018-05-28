package in.fiinfra.birtIntegration.service;


import in.fiinfra.birtIntegration.dao.ReportDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReportServiceImpl implements ReportService{
	@Autowired
	ReportDao reportDao;
	

	public ReportDao getReportDao() {
		return reportDao;
	}

	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}

	@Override
	public Response getCompanyId(int buId,int partyId) 
	{
		 
		return reportDao.getCompanyId(buId, partyId);
	}

	@Override

	public Response getProductId(int buId,int compartyid,int partyId) 
	{
		 
		return reportDao.getProductId( buId, compartyid, partyId);
	}
	
	@Override
	public Response getInvestorStartDate(int buId,int productId,int partyId) 
	{
		 
		return reportDao.getInvestorStartDate( buId, productId, partyId);
	}
	
	@Override
	public Response getCompanyID(int buId,int partyID) 

	{
		 
		return reportDao.getCompanyID(buId,partyID);
	}

	@Override
	public Response getPartnerList(int buId,String searchString,int partyId) 
	{
		return reportDao.getPartnerList(buId,searchString,partyId);
	}
	@Override
	public Response getClientList(String searchString,int partnerId) 
	{
		return reportDao.getClientList(searchString,partnerId);
	}
	@Override
	public Response getClientListOnly(String searchString,int partnerId,int nodeId) 
	{
		return reportDao.getClientListOnly(searchString,partnerId,nodeId);
	}
	
	@Override
	public Response getSectionTypeID(int buId) 
	{
		 
		return reportDao.getSectionTypeID(buId);
	}
	
	@Override
	public Response getServiceTeamMember(int buId) 
	{
		 
		return reportDao.getServiceTeamMember(buId);
	}

	@Override
	public Response getIssuerID(int buId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
