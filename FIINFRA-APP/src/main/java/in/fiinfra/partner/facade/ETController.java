package in.fiinfra.partner.facade;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.partner.ETData;
import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.common.partner.TransactionData;
//import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
//import in.fiinfra.common.util.Logger;
import in.fiinfra.partner.service.ETService;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;

@Component
@Path("/et")
public class ETController {
	@Autowired
	private ETService etService;

	public ETService getEtService() {
		return etService;
	}

	public void setEtService(ETService etService) {
		this.etService = etService;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/apdetails")
	public Response getApDetails(
			@QueryParam("partyId") int partyId,
			@QueryParam("buId") int buId,@QueryParam("partnerId") int partnerId) throws Exception {
	
		return Response.status(200).entity(etService.getApDetails(partyId, buId,partnerId)).build();

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/quickSearchContacts")
	public Response quickSearchContacts(
			@QueryParam("searchString") String searchString,
			@QueryParam("buId") int buId,@QueryParam("partnerId") int partnerId,@QueryParam("nodeId") int nodeId) throws Exception {
	
			//System.out.println("searchString:---" + searchString);
			//System.out.println("buId:---" + buId);
			//etService.getApDetails(partnerId,buId,partnerId);
		
		return Response.status(200).entity(etService.quickSearchContacts(searchString,buId,partnerId,nodeId)).build();

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/executionDetails")
	public Response executionDetails(
			@QueryParam("buId") int buId,
			@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
	
			//System.out.println("fpActionPlanId:---" + fpActionPlanId);
			//System.out.println("buId:---" + buId);
			//etService.getApDetails(partnerId, buId);
		
		return Response.status(200).entity(etService.getExecutionDetails( buId,fpActionPlanId)).build();

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/recommendedInvestment")
	public Response recommendedInvestment(
			@QueryParam("buId") int buId,
			@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
	
			//System.out.println("fpActionPlanId:---" + fpActionPlanId);
			//System.out.println("buId:---" + buId);
			//etService.getApDetails(partnerId, buId);
		
		return Response.status(200).entity(etService.getRecommendedInvestment( buId,fpActionPlanId)).build();

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/proposedInvestment")
	public Response proposedInvestment(
			@QueryParam("buId") int buId,
			@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
	
			//System.out.println("fpActionPlanId:---" + fpActionPlanId);
			//System.out.println("buId:---" + buId);
			//etService.getApDetails(partnerId, buId);
		
		return Response.status(200).entity(etService.getProposedInvestment(buId, fpActionPlanId)).build();

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/etPickLists")
	public Response executionDetailsPicklist(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.getExecutionDetailsPickList(buId,fpActionPlanId)).build();
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/saveProposedInvestments")
	public Response saveProposedInvestments(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId,
		@QueryParam("createdBy") int createdBy,List<ETData> etDataList) throws Exception {
		//System.out.println("buId:---" + buId);
		//System.out.println("etDataList:::::"+etDataList.size());
		etService.saveProposedInvestments(buId,fpActionPlanId, createdBy,etDataList);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/bulkUpload")
	public Response bulkUpload(@QueryParam("buId") int buId){
		return Response.status(200).entity(etService.bulkUpload(buId)).build();

	}
	@GET
	@Path("/getExecutionStatus")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getExecutionStatus(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.getExecutionStatus(buId,fpActionPlanId)).build();
	}
	@POST
	@Path("/cancelExecution")
	public Response cancelExecution(
		@QueryParam("buId") int buId,@QueryParam("fpApActionPlan")  int fpApActionPlan,@QueryParam("createdBy") int createdBy,String comment) throws Exception {
		//System.out.println("comment" + comment);
		etService.cancelExecution(buId,fpApActionPlan,comment,createdBy);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	
	@GET
	@Path("/getPrePrintedFormProducts")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getPrePrintedFormProducts(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.getPrePrintedFormProducts(buId,fpActionPlanId)).build();
	}
	@GET
	@Path("/getAllProductManufacturer")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllProductManufacturer(
		@QueryParam("buId") int buId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.getAllProductManufacturer(buId)).build();
	}
	
	@GET
	@Path("/loadProductsForManufacturer")
	@Produces(MediaType.APPLICATION_JSON)
	public Response loadProductsForManufacturer(
		@QueryParam("buId") int buId,@QueryParam("manufacturerCode") String manufacturerCode) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.loadProductsForManufacturer(buId,manufacturerCode)).build();
	}
	@GET
	@Path("/loadEtForm")
	@Produces(MediaType.APPLICATION_JSON)
	public Response loadEtForm(
		@QueryParam("buId") int buId,@QueryParam("fpExecutionId") int fpExecutionId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.loadEtForm(buId,fpExecutionId)).build();
	}
	
	@GET
	@Path("/autoPolpulateEtForm")
	@Produces(MediaType.APPLICATION_JSON)
	public Response autoPolpulateEtForm(@QueryParam("buId") int buId,@QueryParam("fpActionPlanId")  int fpActionPlanId){
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.autoPolpulateEtForm(buId,fpActionPlanId)).build();
	}
	
	
	
	@POST
	@Path("/saveEtForm")
	public Response saveEtForm(
		@QueryParam("buId") int buId,@QueryParam("fpExecutionId")  int fpExecutionId,@QueryParam("createdBy") int createdBy,ETPrePrintedFormData etForm) throws Exception {
		fpExecutionId=etService.saveEtForm(buId,fpExecutionId,etForm,createdBy);
		BaseResponse<Integer> br=new BaseResponse<Integer>();
		br.setResponseObject(fpExecutionId);
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@POST
	@Path("/generateEtForm")
	public Response generateEtForm(
		@QueryParam("buId") int buId,@QueryParam("fpExecutionId")  int fpExecutionId,@QueryParam("createdBy") int createdBy) throws Exception {
		
		etService.generateEtForm(buId,fpExecutionId,createdBy);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@GET
	@Path("/availableEtForms")
	@Produces(MediaType.APPLICATION_JSON)
	public Response availableEtForms(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.getAvailablePrePrintedForm(buId, fpActionPlanId)).build();
	}
	@GET
	@Path("/etDocs")
	@Produces(MediaType.APPLICATION_JSON)
	public Response allEtDocuments(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.getAllEtDocuments(buId, fpActionPlanId)).build();
	}
	@GET
	@Path("/etNotes")
	@Produces(MediaType.APPLICATION_JSON)
	public Response etNotes(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId) throws Exception {
		//System.out.println("buId:---" + buId);
		return Response.status(200).entity(etService.getNotes(buId, fpActionPlanId)).build();
	}
	@POST
	@Path("/saveEtNote")
	public Response saveEtNote(
		@QueryParam("buId") int buId,@QueryParam("fpActionPlanId")  int fpActionPlanId,@QueryParam("noteId") int noteId,@QueryParam("createdBy") int createdBy,String noteText) throws Exception {
		noteText=noteText.replace("\"","");
		//System.out.println("in service .....noteText"+noteText);
		etService.saveEtNote(buId,fpActionPlanId,noteText,noteId,createdBy);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@POST
	@Path("/deleteEtNotes")
	public Response deleteEtNotes(@QueryParam("noteIds") String noteIds,@QueryParam("buId") int buId){
		etService.deleteEtNotes(noteIds, buId);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	@POST
	@Path("/uploadDoc")
	public Response uploadDoc(@QueryParam("fpActionPlanId") int fpActionPlanId,@QueryParam("buId") int buId,
			@QueryParam("createdBy") int createdBy,List<DocumentData> docs){
		
		
		
		BaseResponse<String> br=new BaseResponse<String>();
		br.setResponseObject(etService.uploadDoc(fpActionPlanId, buId,createdBy,docs));
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
		
	}
	@POST
	@Path("/deleteEtDocs")
	public Response deleteEtDocs(@QueryParam("docIds") String noteIds,@QueryParam("buId") int buId){
		
		BaseResponse<String> br=new BaseResponse<String>();
		br.setResponseObject(etService.deleteEtDocs(noteIds, buId));
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		
		return response; 
	}
	
	@POST
	@Path("/bulkUploadTxn")
	public Response bulkUploadTxn(@QueryParam("txnSourceId") int txnSourceId,@QueryParam("buId") int buId,
			@QueryParam("createdBy") int createdBy,List<DocumentData> docs){
		
		
		
		BaseResponse<String> br=new BaseResponse<String>();
		br.setResponseObject(etService.bulkUploadTxn( txnSourceId,buId,createdBy,docs));
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
		
	}
	
	@GET
	@Path("/bulkUploadTxnHistory")
	public Response bulkUploadTxnHistory(@QueryParam("buId") int buId,@QueryParam("createdBy") int createdBy){	
		BaseResponse<List<TransactionData>> br=new BaseResponse<List<TransactionData>>();
		return Response.status(200).entity(etService.getBulkUploadTxnHistory(buId,createdBy)).build();
		
	}
	@POST
	@Path("/updateEtClientApproval")
	public Response updateEtClientApproval(@QueryParam("fpExecutionId") int fpExecutionId,@QueryParam("buId") int buId){
		
		
		
		BaseResponse<String> br=new BaseResponse<String>();
		etService.updateETClientApproval(buId, fpExecutionId);
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
		
	}
	@GET
	@Path("/getEtTrackingHistory")
	public Response getEtTrackingHistory(@QueryParam("buId") int buId,@QueryParam("fpActionPlanId") int fpActionPlanId){	
		BaseResponse<List<TransactionData>> br=new BaseResponse<List<TransactionData>>();
		return Response.status(200).entity(etService.getEtTrackingHistory(buId, fpActionPlanId)).build();
		
	}
	
	@GET
	@Path("/loadfoliodetails")
	public Response getEtTrackingHistory(@QueryParam("buId") int buId,@QueryParam("folioId") String folioId){	
		BaseResponse<List<TransactionData>> br=new BaseResponse<List<TransactionData>>();
		return Response.status(200).entity(etService.loadfolioDetails(buId, folioId)).build();
		
	}
	
	@GET
	@Path("/getbulkuploaderrorcount")
	public Response getBulkUploadTransactionHistoryErrorCount(@QueryParam("buId") int buId,@QueryParam("queueId") int queueId){	
		BaseResponse<List<TransactionData>> br=new BaseResponse<List<TransactionData>>();
		return Response.status(200).entity(etService.getBulkUploadTransactionHistoryErrorCount(buId, queueId)).build();
		
	}
	
	@GET
	@Path("/getbulkuploadtransactiohistorydetails")
	public Response getBulkUploadTransactionHistoryDetails(@QueryParam("buId") int buId,@QueryParam("queueId") int queueId,@QueryParam("partnerId") int partnerId){	
		BaseResponse<List<TransactionData>> br=new BaseResponse<List<TransactionData>>();
		return Response.status(200).entity(etService.getBulkUploadTransactionHistoryDetails(buId, queueId,partnerId)).build();
		
	}
	
	
	@POST
	@Path("/requestforreprocess")
	public Response requestForReporcess(@QueryParam("buId") int buId,@QueryParam("queueId") int queueId,@QueryParam("createdBy") int createdBy){	
		BaseResponse<String> br=new BaseResponse<String>();
		
		etService.requestForReporcess(buId, queueId, createdBy);
	
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
		
	}
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getApplicantDetailsList/{user}/{token}")
	public Response getApplicantDetailsList(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody ETPrePrintedFormData formData) {

		Response response = etService.getApplicantDetailsList(formData);
		return response;
	}
	

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getClientDetailsForApprovel/{user}/{token}")
	public Response getClientDetailsForApprovel(@PathParam("token") String token,
			@PathParam("user") String name, @RequestBody ETData etData) {

		Response response = etService.getClientDetailsForApprovel(etData);
		return response;
	}
	
	@GET
	@Path("/loadMutualFundProduct")
	@Produces(MediaType.APPLICATION_JSON)
	public Response loadMutualFundProduct(
		@QueryParam("buId") int buId,@QueryParam("searchStr") String searchStr) throws Exception {
		
		return Response.status(200).entity(etService.loadMutualFundProduct(buId,searchStr)).build();
	}
	
	@GET
	@Path("/loadPortFolioPrePrintedForm")
	@Produces(MediaType.APPLICATION_JSON)
	public Response loadPortFolioPrePrintedForm(
		@QueryParam("buId") int buId,@QueryParam("productid") int productid,@QueryParam("clientPartyId") int clientPartyId) throws Exception {
		return Response.status(200).entity(etService.loadPortFolioPrePrintedForm(buId,productid,clientPartyId)).build();
	}
	
	@GET
	@Path("/loadAvailablePrePrintedForms")
	@Produces(MediaType.APPLICATION_JSON)
	public Response loadAvailablePrePrintedForms(
		@QueryParam("buId") int buId,@QueryParam("clientPartyId") int clientPartyId,@QueryParam("ownerPartyId") String ownerPartyId) throws Exception {
		return Response.status(200).entity(etService.loadAvailablePrePrintedForms(buId, clientPartyId,ownerPartyId)).build();
	}
	
	@GET
	@Path("/assetAutoAllocation")
	@Produces(MediaType.APPLICATION_JSON)
	public Response assetAutoAllocation(
		@QueryParam("partnerId") int partnerId, @QueryParam("nodeId") int nodeId, @QueryParam("buId") int buId) throws Exception {
		return Response.status(200).entity(etService.assetAutoAllocation(partnerId, nodeId, buId)).build();
	}
	
	@POST
	@Path("/deleteAsset")
	public Response deleteAsset(@QueryParam("goalAssetId") String goalAssetId,@QueryParam("buId") int buId){
		etService.deleteAsset(goalAssetId, buId);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	@POST
	@Path("/confirmAsset")
	public Response confirmAsset(@QueryParam("goalAssetId") String goalAssetId,@QueryParam("buId") int buId,@QueryParam("userId") String userId){
		etService.confirmAsset(goalAssetId, buId, userId);
		BaseResponse<String> br=new BaseResponse<String>();
		Response response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		return response; 
	}
	
	@GET
	@Path("/assetAutoAllocationDetailsWhileEdit")
	@Produces(MediaType.APPLICATION_JSON)
	public Response assetAutoAllocationDetailsWhileEdit(@QueryParam("goalAssetId") String goalAssetId,@QueryParam("buId") int buId){

		return Response.status(200).entity(etService.assetAutoAllocationDetailsWhileEdit(goalAssetId,buId)).build();
	}
	
	
}
