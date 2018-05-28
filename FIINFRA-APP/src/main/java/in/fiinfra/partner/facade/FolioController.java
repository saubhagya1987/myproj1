package in.fiinfra.partner.facade;

import in.fiinfra.common.partner.FixedIncomePortfolioData;
import in.fiinfra.common.partner.MFPortfolioData;
import in.fiinfra.common.partner.NomineeData;
import in.fiinfra.common.partner.PortfolioData;
import in.fiinfra.common.partner.StockPortfolioData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.partner.service.FolioService;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Path("/folio")
public class FolioController {
	@Autowired
	private FolioService folioService;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/mffoliosummary")
	public Response getMfFolioSummary(@QueryParam("buId") int buId,
			@QueryParam("partnerId") int partnerId, @QueryParam("nodeId") int nodeId) throws Exception {
		return Response.status(200)
				.entity(folioService.getFolioSummary(partnerId, buId, nodeId))
				.build();

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/portfolioproductinfo")
	public Response getPortFolioProductInfo(@QueryParam("buId") int buId,
			@QueryParam("partnerId") int partnerId, @QueryParam("nodeId") int nodeId) throws Exception {
		return Response.status(200)
				.entity(folioService.getPortFolioProductInfo(partnerId, buId, nodeId))
				.build();

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/partneraummonthwise")
	public Response getPartnerAUMMonthWise(@QueryParam("buId") int buId,
			@QueryParam("partnerId") int partnerId,@QueryParam("chartType" )String chartType,@QueryParam("nodeId") int nodeId) throws Exception {
		return Response.status(200)
				.entity(folioService.getPartnerAUMMonthWise(partnerId, buId,chartType,nodeId))
				.build();

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/displayfoliopiechart")
	public Response displayFolioPieChart(@QueryParam("buId") int buId,
			@QueryParam("partnerId") int partnerId,@QueryParam("nodeId") int nodeId) throws Exception {
		return Response.status(200)
				.entity(folioService.displayFolioPieChart(partnerId, buId,nodeId))
				.build();

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientPortfolioSummary")
	public Response getClientPortfolioSummary(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId,@QueryParam("partnerId")int partnerId,@QueryParam("nodeId")int nodeId) throws Exception {
		return Response.status(200)
				.entity(folioService.getClientPortfolioSummary(partyId, buId,partnerId,nodeId))
				.build();

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/viewTransactions")
	public Response getClientPortFolioTransactoions(@QueryParam("buId") int buId,
			@QueryParam("partyAssetId") int partyAssetId){
		
		return Response.status(200)
				.entity(folioService.getClientPortFolioTransactions(buId, partyAssetId))
				.build();
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/goalMapping")
	public Response getClientPortFolioGoalMapping(@QueryParam("buId") int buId,
			@QueryParam("partyAssetId") int partyAssetId){
		
		return Response.status(200)
				.entity(folioService.getClientPortFolioGoalMapping(buId, partyAssetId))
				.build();
	}
	@POST
	@Path("/updateGoalMapping")
	public Response updateGoalMapping(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("partyAssetId") int partyAssetId ,GoalData[] goaldData) throws Exception {
		
		folioService.updateGoalMapping(buId,goaldData,createdBy,partyAssetId );
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/folioNominations")
	public Response getClientPortFolioNominations(@QueryParam("buId") int buId,
			@QueryParam("partyAssetId") int partyAssetId){
		
		return Response.status(200)
				.entity(folioService.getClientPortFolioNominations(buId, partyAssetId))
				.build();
	}
	@POST
	@Path("/updateFolioNominations")
	public Response updateFolioNominations(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("folioNo") String folioNo ,@QueryParam("partyId") int partyId ,NomineeData nominee,
		@QueryParam("partnerId")int partnerId,@QueryParam("clientId")int clientId,@QueryParam("partyAssetId")int partyAssetId) throws Exception {
		
		folioService.updateFolioNominations(buId,nominee,createdBy,folioNo, partyId,partnerId,clientId,partyAssetId);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	@POST
	@Path("/deleteFolioNominations")
	public Response deleteFolioNominations(@QueryParam("noteIds") String noteIds,@QueryParam("createdBy") int createdBy,@QueryParam("buId") int buId){
		folioService.deleteFolioNominations(buId, createdBy, noteIds);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNomineeDataByPartyId")
	public Response getNomineeDataByPartyId(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId){
		
		return Response.status(200)
				.entity(folioService.getNomineeDataByPartyId(buId, partyId))
				.build();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientStockDetailsForAddEditForm")
	public Response getClientStockDetailsForAddEditForm(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId){
		
		return Response.status(200)
				.entity(folioService.getClientStockDetailsForAddEditForm(buId, partyId))
				.build();
	}
	
	
	@POST
	@Path("/addEntryForStock")
	public Response addEntryForStock(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("clientId") int clientId,StockPortfolioData stockPortfolioData) throws Exception {
		
		folioService.addEntryForStock(buId,createdBy,clientId,stockPortfolioData);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAssetForAddEditForm")
	public Response getAssetForAddEditForm(@QueryParam("buId") int buId, @QueryParam("searchType") String searchType,
			@QueryParam("searchString") String searchString, @QueryParam("mfAMCId") int mfAMCId, @QueryParam("clientPartyId") int clientPartyId){
		
		return Response.status(200)
				.entity(folioService.getAssetForAddEditForm(buId, searchType, searchString, mfAMCId,clientPartyId))
				.build();
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientMFDetailsForAddEditForm")
	public Response getClientMFDetailsForAddEditForm(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId){
		
		return Response.status(200)
				.entity(folioService.getClientMFDetailsForAddEditForm(buId, partyId))
				.build();
	}
	
	@POST
	@Path("/addEntryForMF")
	public Response addEntryForMF(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("clientId") int clientId, @QueryParam("pmTxnID") int pmTxnID,MFPortfolioData mfPortfolioData) throws Exception {
		
		folioService.addEntryForMF(buId,createdBy,clientId,pmTxnID,mfPortfolioData);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientULIPDetailsForAddEditForm")
	public Response getClientULIPDetailsForAddEditForm(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId){
		
		return Response.status(200)
				.entity(folioService.getClientULIPDetailsForAddEditForm(buId, partyId))
				.build();
	}
	@POST
	@Path("/addEntryForULIP")
	public Response addEntryForULIP(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("clientId") int clientId, PortfolioData ulipPortfolioData) throws Exception {
		
		folioService.addEntryForULIP(buId,createdBy,clientId,ulipPortfolioData);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientFIDetailsForAddEditForm")
	public Response getClientFIDetailsForAddEditForm(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId){
		
		return Response.status(200)
				.entity(folioService.getClientFIDetailsForAddEditForm(buId, partyId))
				.build();
	}
	@POST
	@Path("/addEntryForFI")
	public Response addEntryForFI(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("clientId") int clientId, FixedIncomePortfolioData fiPortfolioData) throws Exception {
		
		folioService.addEntryForFI(buId,createdBy,clientId,fiPortfolioData);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getAMCList")
	public Response getAMCList(@QueryParam("buId") int buId,@QueryParam("clientPartyId") int clientPartyId){
		
		return Response.status(200)
				.entity(folioService.getAMCList(buId,clientPartyId))
				.build();
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPortfolioClientList")
	public Response getPortfolioClientList(@QueryParam("buId") int buId,
			@QueryParam("partnerId") int partnerId,
			@QueryParam("nodeId") int nodeId) {

		return Response.status(200)
				.entity(folioService.getPortfolioClientList(buId, partnerId,nodeId)).build();
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientPropertyDetailsForAddEditForm")
	public Response getClientPropertyDetailsForAddEditForm(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId){
		
		return Response.status(200)
				.entity(folioService.getClientPropertyDetailsForAddEditForm(buId, partyId))
				.build();
	}
	
	@POST
	@Path("/addEntryForProperty")
	public Response addEntryForProperty(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("clientId") int clientId, PortfolioData propertyPortfolioData) throws Exception {
		
		folioService.addEntryForProperty(buId,createdBy,clientId,propertyPortfolioData);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientGoldDetailsForAddEditForm")
	public Response getClientGoldDetailsForAddEditForm(@QueryParam("buId") int buId,
			@QueryParam("partyId") int partyId){
		
		return Response.status(200)
				.entity(folioService.getClientGoldDetailsForAddEditForm(buId, partyId))
				.build();
	}
	
	@POST
	@Path("/addEntryForGold")
	public Response addEntryForGold(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("clientId") int clientId, PortfolioData goldPortfolioData) throws Exception {
		
		folioService.addEntryForGold(buId,createdBy,clientId,goldPortfolioData);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	@POST
	@Path("/deleteClientTransaction")
	public Response deleteClientTransaction(
		@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy,@QueryParam("clientId") int clientId,StockPortfolioData stockPortfolioData) throws Exception {
		
		folioService.deleteClientTransaction(buId,createdBy,clientId,stockPortfolioData);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientMFTransactionDetailst")
	public Response getClientMFTransactionDetailst(@QueryParam("partnerId") int partnerId,@QueryParam("partyAssetId") int partyAssetId,@QueryParam("clientId") int clientId,@QueryParam("amc") String amc,@QueryParam("productId") String productId,@QueryParam("txnType") int txnType,@QueryParam("startDate") String startDate,@QueryParam("endDate") String endDate){
		
		return Response.status(200)
				.entity(folioService.getClientMFTransactionDetailst(partnerId,partyAssetId,clientId,amc,productId,txnType,startDate,endDate))
				.build();
	}
	
	@POST
	@Path("/deleteClientMFTransaction")
	public Response deleteClientMFTransaction(@QueryParam("pmTxnId") int pmTxnId,@QueryParam("createdBy") int createdBy,@QueryParam("buId") int buId){
		folioService.deleteClientMFTransaction(buId, createdBy, pmTxnId);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSelectedCMFTransaction")
	public Response getSelectedCMFTransaction(@QueryParam("buId") int buId,@QueryParam("pmTxnId") int pmTxnId){
		
		return Response.status(200)
				.entity(folioService.getSelectedCMFTransaction(buId,pmTxnId))
				.build();
	}
}
