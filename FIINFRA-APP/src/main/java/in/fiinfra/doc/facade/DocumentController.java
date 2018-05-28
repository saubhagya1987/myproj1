package in.fiinfra.doc.facade;

import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.doc.service.DocumentService;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sun.jersey.api.core.InjectParam;

@Component
@Path("/document")
public class DocumentController {
	
	@Autowired
	DocumentService documentService;

	
//	@POST
//	@Consumes(MediaType.MULTIPART_FORM_DATA)
//	@Path("/addDocument/{user}/{token}")
//	public Response addDocument( @FormDataParam("document") DocumentData document,
//			@FormDataParam("file") InputStream fileInputStream,
//			@FormDataParam("file") FormDataContentDisposition contentDispositionHeader,
//			@PathParam("token") String token, @PathParam("user") String name,@QueryParam("buId") int buId){
//		
//		if (buId <= 0) {
//			buId = FiinfraConstants.AXISMFBUID;
//		}
//		
//		if(document.getRefId() ==null || document.getRefId() <=0 || document.getRefTypeId() ==null || document.getRefTypeId() <=0){
//			return FiinfraResponseBuilder.getErrorResponse("Invalid RefId/RefType");
//		}
//		document.setFileSize((int)contentDispositionHeader.getSize());
//
//
//		BaseResponse<DocumentData> baseResponse = new BaseResponse<DocumentData>();
//		try {
//			document =  documentService.saveDocument(buId, document, fileInputStream);
//		} catch (Exception e) {
//			LogFactory.getLog(getClass()).error("Error saving Document",e);
//			return FiinfraResponseBuilder.getErrorResponse("Error saving Document "+e.getMessage());
//		}
//		if(document.getDocumentId() >0){
//			baseResponse.setResponseObject(document);
//			return  FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
//		}
//		else{
//			return FiinfraResponseBuilder.getErrorResponse("Unable to Save Document");
//		}
//	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addDocument/{user}/{token}")
	public Response addDocument( DocumentData document,
			@PathParam("token") String token, @PathParam("user") String name,@QueryParam("buId") int buId){
		
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		
//		if(document.getRefId() ==null || document.getRefId() <=0 || document.getRefTypeId() ==null || document.getRefTypeId() <=0){
//			return FiinfraResponseBuilder.getErrorResponse("Invalid RefId/RefType");
//		}


		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		try {
			document =  documentService.saveDocument(buId, document);
		} catch (Exception e) {
			LogFactory.getLog(getClass()).error("Error saving Document",e);
			return FiinfraResponseBuilder.getErrorResponse("Error saving Document "+e.getMessage());
		}
		if(document.getDocumentId() >0){
			baseResponse.setResponseObject(document.getDocumentId());
			return  FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		}
		else{
			return FiinfraResponseBuilder.getErrorResponse("Unable to Save Document");
		}
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteDocument/{user}/{token}")
	public Response deleteDocument( @QueryParam("documentId") int docId, @QueryParam("userId") int userId,
			@PathParam("token") String token, @PathParam("user") String name,@QueryParam("buId") int buId){
		
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		
		BaseResponse<String> baseResponse = new BaseResponse<String>();
		try {
			baseResponse.setResponseObject(documentService.deleteDocument(buId, userId,docId)?"Sucess":"Error");
			return FiinfraResponseBuilder.getSuccessResponse(baseResponse, null)  ;
		} catch (Exception e) {
			LogFactory.getLog(getClass()).error("Error saving Document",e);
			return FiinfraResponseBuilder.getErrorResponse("Error saving Document "+e.getMessage());
		}
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDocuments/{user}/{token}")
	public Response getDocuments(@PathParam("token") String token, @PathParam("user") String name, @InjectParam DocumentRequest req
			) 
	{
		Response response = null;
		if (BaseRequest.isEmpty(req.getBuId())) {
			req.setBuId(FiinfraConstants.AXISMFBUID);
		}

		BaseResponse<DocumentData> baseResponse = new BaseResponse<DocumentData>();
		if(BaseRequest.isEmpty(req.getPartyId())  ){
			response = FiinfraResponseBuilder.getErrorResponse("Invalid Party");	
		}
		else{
			baseResponse.setResponseListObject(documentService.getDocuments(req));
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		}
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getDocument/{user}/{token}")
	public Response getDocumentDetail(@PathParam("token") String token, @PathParam("user") String name,@QueryParam("buId") int buId, @QueryParam("documentId") Integer documentId
			) 
	{
		Response response = null;
		if (buId <=0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<DocumentData> baseResponse = new BaseResponse<DocumentData>();
		baseResponse.setResponseObject(documentService.getDocument(buId,documentId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}


	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFileStoragePath/{user}/{token}")
	public Response getFileStoragePath(@PathParam("token") String token, @PathParam("user") String name,@QueryParam("buId") int buId, @QueryParam("storageId") Integer storageId,
			@QueryParam("partyId") Integer partyId
			) 
	{
		Response response = null;
		if (buId <=0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<String> baseResponse = new BaseResponse<String>();
		baseResponse.setResponseObject(documentService.getStoragePath(buId,partyId,storageId));
		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		return response;
	}

	
}
