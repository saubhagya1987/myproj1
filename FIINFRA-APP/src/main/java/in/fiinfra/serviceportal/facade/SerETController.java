package in.fiinfra.serviceportal.facade;

import java.io.IOException;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.partner.TransactionData;
import in.fiinfra.common.partner.TransactionHistoryData;
import in.fiinfra.common.service.vo.DepartmentListData;
import in.fiinfra.common.service.vo.NotifyEvent;
import in.fiinfra.common.service.vo.NotifyTemplate;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.serviceportal.service.SPETServices;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@Path("/rtatracker")
public class SerETController extends MultiActionController{
	private static final Logger logger = Logger.getLogger(NotifyTemplateController.class);
	
	Response response; 
	private ObjectMapper objectMapper ;  

	public ObjectMapper getObjectMapper() {
		return objectMapper;
	}
	
	@Autowired
	SPETServices  SPETServices;


 
	public SPETServices getSPETServices() {
		return SPETServices;
	}

	public void setSPETServices(SPETServices sPETServices) {
		SPETServices = sPETServices;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
     
/*	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUploadHistory/{user}/{token}") 
	 public Response getUploadHistory(@QueryParam("sessionbuId") int sessionbuId, 
				@PathParam("token") String token,
				@PathParam("user") String name	)
	   {
		
		   BaseResponse<TransactionData> br = new BaseResponse<>(); 
		   response =SPETServices.getUploadHistory();
		   return response;
		   
	   }*/
	 
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUploadHistory/{user}/{token}") 
	public Response getUploadHistory( 
			@PathParam("token") String token,
			@PathParam("user") String name,  @RequestBody TransactionData transactionData)
   { 
			BaseResponse<TransactionData> br = new BaseResponse<TransactionData>(); 
			response =SPETServices.getUploadHistory(transactionData);    
		    return response; 
	}
	 
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPartnerPSTSection/{user}/{token}")
	 public Response getPartnerPSTSection(@QueryParam("sessionbuId") int sessionbuId,@QueryParam("sessionuserId") int sessionuserId ) throws IOException 
		{
			BaseResponse<TransactionData> br = new BaseResponse<TransactionData>(); 
			response=SPETServices.showPartnerPSTList(sessionbuId,sessionuserId); 
			return response; 
		}  
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/requestforreprocess/{user}/{token}") 
	public Response requestforreprocess(@QueryParam("batchId") String batchId, 
			@QueryParam("createdBy") String createdBy, 
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
			{
 
			BaseResponse<Integer> br = new BaseResponse<>();
			response = SPETServices.requestforreprocess(batchId, createdBy);  
			return response;  
			  
			} 
	  
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/bulkreprocess/{user}/{token}")
	public Response bulkReprocess(	@QueryParam("Lists") String reprocesslist,
			@QueryParam("batchId") String batchId, 
			@PathParam("token") String token,
			@PathParam("user") String name	) throws IOException 
			{  
  
			BaseResponse<Integer> br = new BaseResponse<>();   
			response=SPETServices.bulkReprocess(batchId,reprocesslist);
			return response;  
			  
			}   
	
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getbulkuploadtransactiohistorydetails/{user}/{token}") 
	public Response getbulkuploadtransactiohistorydetails( 
			@PathParam("token") String token,
			@PathParam("user") String name,  @RequestBody TransactionHistoryData transactionData)
   { 
			BaseResponse<TransactionHistoryData> br = new BaseResponse<TransactionHistoryData>(); 
			response =SPETServices.getbulkuploadtransactiohistorydetails(transactionData);      
		    return response;   
	}
	 
	@POST 
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getbulkuploaderrorcount/{user}/{token}") 
	public Response getbulkuploaderrorcount( 
			@PathParam("token") String token,
			@PathParam("user") String name,  @RequestBody TransactionData transactionData)
   {  
			BaseResponse<TransactionData> br = new BaseResponse<TransactionData>(); 
			response =SPETServices.getbulkuploaderrorcount(transactionData);    
		    return response;  
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getbulkuploadSourceType/{user}/{token}")
	 public Response getbulkuploadSourceType(@QueryParam("codeTypeIds") int codeTypeIds,@QueryParam("buId") int buId ) throws IOException 
		{
			BaseResponse<TransactionData> br = new BaseResponse<TransactionData>(); 
			response=SPETServices.getbulkuploadSourceType(codeTypeIds, buId);   
			return response; 
			
		} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON) 
	@Path("/getbulkuploadFileType/{user}/{token}")
	 public Response getbulkuploadFileType(@QueryParam("parentId") int parentId) throws IOException 
		{
			BaseResponse<TransactionData> br = new BaseResponse<TransactionData>(); 
			response=SPETServices.getbulkuploadFileType(parentId);   
			return response; 
			   
		} 
   
	@POST 
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/bulkUploadTxn/{user}/{token}") 
	public Response bulkUploadTxn(DocumentData documentData,
			@PathParam("token") String token, @PathParam("user") String name){		
		
		Integer recordCount= SPETServices.bulkUploadTxn(documentData.getDocumentId(), documentData.getFileName(), documentData.getCreatedBy());
		BaseResponse<Integer> br=new BaseResponse<>();  
		br.setResponseObject(recordCount);  
		response=FiinfraResponseBuilder.getSuccessResponse(br, null); 
		return response;   
	}
	
	  
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUniqueBasePath/{user}/{token}")
	public Response getUniqueBasePath(@QueryParam("txnSourceID") String txnSourceID,@PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<TransactionData> br = new BaseResponse<>();
		response = SPETServices.getUniqueBasePath(txnSourceID);
		return response;
 
	} 
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFTPBasePath/{user}/{token}")
	public Response getFTPBasePath(@QueryParam("txnSourceID") String txnSourceID,@QueryParam("protocol") String protocol,@PathParam("token") String token,
			@PathParam("user") String name) {
		BaseResponse<TransactionData> br = new BaseResponse<>();
		response = SPETServices.getFTPBasePath(txnSourceID,protocol);
		return response;
 
	}

}  
