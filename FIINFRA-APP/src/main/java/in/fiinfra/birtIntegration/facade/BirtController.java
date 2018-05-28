package in.fiinfra.birtIntegration.facade;


import java.sql.SQLException;
import java.util.List;

import in.fiinfra.birt.models.ClientList;
import in.fiinfra.birt.models.ClientListOnly;
import in.fiinfra.birt.models.IssuerId;
import in.fiinfra.birt.models.SectionTypeID;
import in.fiinfra.birt.models.PartnerList;
import in.fiinfra.birt.models.ServiceTeamMemberID;
import in.fiinfra.birtIntegration.service.ReportService;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
@Path("/birt")
public class BirtController {
	@Autowired
	private ReportService reportService;
	Response response;
	
	
	//Response response;
	private static final Logger logger = Logger.getLogger(BirtController.class);
	
	
	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCompanyId/{user}/{token}")
	public Response getCompanyId(@QueryParam("buId") int buId,
								 @QueryParam("PartyId") int partyId,
								 @PathParam("token") String token, 
								 @PathParam("user") String name) throws SQLException
	{
	
			logger.debug("in:----getPartnerList");
			BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
			response= reportService.getCompanyId(buId,partyId);
			return response;
	}
	
	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)

	@Path("/getProductId/{user}/{token}")
	public Response getProductId(@QueryParam("BuId") int buId,
								 @QueryParam("Compartyid") int compartyid,
								 @QueryParam("PartyId") int partyId,
								 @PathParam("token") String token, 
								 @PathParam("user") String name) throws SQLException
	{
	
			logger.debug("in:----getPartnerList");
			BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
			response= reportService.getProductId(buId,compartyid,partyId);
			return response;
	}
	
	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getInvestorStartDate/{user}/{token}")
	public Response getInvestorStartDate(@QueryParam("BuId") int buId,
								 		 @QueryParam("ProductId") int productId,
								 		 @QueryParam("PartyId") int partyId,
								 		 @PathParam("token") String token, 
								 		 @PathParam("user") String name) throws SQLException
	{
	
			logger.debug("in:----getPartnerList");
			BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
			response= reportService.getInvestorStartDate(buId,productId,partyId);
			return response;
	}
	
	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCompanyID/{user}/{token}")
	public Response getCompanyID(@QueryParam("buId") int buId,
								 @QueryParam("partyID") int partyID,
								 @PathParam("token") String token, 
								 @PathParam("user") String name) throws SQLException{

	
			logger.debug("in:----getIssuerID");
			BaseResponse<IssuerId> br = new BaseResponse<IssuerId>();
			response= reportService.getCompanyID(buId,partyID);
			return response;
	}

	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSectionTypeID/{user}/{token}")
	public Response getSectionTypeID(@QueryParam("buId") int buId,
											@PathParam("token") String token, @PathParam("user") String name) throws SQLException{
	
			logger.debug("in:----getSectionTypeID");
			BaseResponse<SectionTypeID> br = new BaseResponse<SectionTypeID>();
			response= reportService.getSectionTypeID(buId);
			return response;
	}


	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerList/{user}/{token}")
	public Response getPartnerList(@QueryParam("buId") int buId,@QueryParam("searchString") String searchString,@QueryParam("partyId") int partyId,
											@PathParam("token") String token, @PathParam("user") String name) throws SQLException{
	
			logger.debug("in:----getPartnerList");
			BaseResponse<PartnerList> br = new BaseResponse<PartnerList>();
			response= reportService.getPartnerList(buId,searchString,partyId);
//			br.setResponseListObject(clientDatas);
		
			return response;
	}

	
	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientList/{user}/{token}")
	public Response getClientList(@QueryParam("searchString") String searchString,@QueryParam("partnerId") int partnerId,
											@PathParam("token") String token, @PathParam("user") String name) throws SQLException{
	
			logger.debug("in:----getClientList");
		
			
			
			BaseResponse<ClientList> br = new BaseResponse<ClientList>();
			response= reportService.getClientList(searchString,partnerId);
//			br.setResponseListObject(clientDatas);
			
			return response;
	}
	
	
	
	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientListOnly/{user}/{token}")
	public Response getClientListOnly(@QueryParam("searchString") String searchString,@QueryParam("partnerId") int partnerId,@QueryParam("nodeId") int nodeId,
											@PathParam("token") String token, @PathParam("user") String name) throws SQLException{
	
			logger.debug("in:----getClientList");
		
			
			
			BaseResponse<ClientList> br = new BaseResponse<ClientList>();
			response= reportService.getClientListOnly(searchString,partnerId,nodeId);
//			br.setResponseListObject(clientDatas);
			
			return response;
	}
	
	
	@GET
	//@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getServiceTeamMember/{user}/{token}")
	public Response getServiceTeamMember(@QueryParam("buId") int buId,
											@PathParam("token") String token, @PathParam("user") String name) throws SQLException{
	
			logger.debug("in:----getServiceTeamMember");
			BaseResponse<ServiceTeamMemberID> br = new BaseResponse<ServiceTeamMemberID>();
			response= reportService.getServiceTeamMember(buId);
			return response;
	}

	public ReportService getReportService() {
		return reportService;
	}


	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}
	
	
	
	


	
	
}
