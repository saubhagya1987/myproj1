package in.fiinfra.notes.facade;

import in.fiinfra.common.note.Note;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.notes.service.NotesService;

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

@Component
@Path("/note")
public class NotesController 
{
	@Autowired
	NotesService noteService;

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpdateNote/{user}/{token}")
	public Response saveNote(Note note,
			@PathParam("token") String token, @PathParam("user") String name,@QueryParam("buId") int buId){
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}
		
		if(note.getRefId() ==null || note.getRefId() <=0 || note.getRefTypeId() ==null || note.getRefTypeId() <=0){
			response = FiinfraResponseBuilder.getErrorResponse("Invalid RefId/RefType");
			return response;
		}


		BaseResponse<Integer> baseResponse = new BaseResponse<Integer>();
		note =  noteService.insertUpdateNote(buId, note);
		if(note.getNoteId() != null && note.getNoteId() >0){
			baseResponse.setResponseObject(note.getNoteId());
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		}
		else{
			response = FiinfraResponseBuilder.getErrorResponse("Unable to Save Note");
		}
		return response;
	}

		
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getListOfNotes/{user}/{token}")
	public Response getListOfNotes(@PathParam("token") String token, @PathParam("user") String name, @QueryParam("buId") int buId,
			@QueryParam("refId") Integer refId,@QueryParam("refTypeId") Integer refTypeId
			) 
	{
		Response response = null;
		if (buId <= 0) {
			buId = FiinfraConstants.AXISMFBUID;
		}

		BaseResponse<Note> baseResponse = new BaseResponse<Note>();
		if(refTypeId ==null || refId ==null || refId <=0 || refTypeId<=0){
			response = FiinfraResponseBuilder.getErrorResponse("Invalid RefId/RefType");	
		}
		else{
			baseResponse.setResponseListObject(noteService.getListOfNotes(buId, refTypeId,refId));
			response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		}
		return response;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteNote/{user}/{token}")
	public Response deleteNote(@QueryParam("noteIds") String noteIds,@QueryParam("buId") int buId,
			@PathParam("token") String token, @PathParam("user") String name)
			throws Exception {
		String result = noteService.deleteNote(noteIds,buId);
		Response response = null;
		BaseResponse<String> br = new BaseResponse<String>();
		if(result.equalsIgnoreCase(FiinfraConstants.success)){
			br.setStatus(FiinfraConstants.success);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}else if(result.equalsIgnoreCase(FiinfraConstants.EMPTY_RESULT_SET)){
			br.setStatus(FiinfraConstants.EMPTY_RESULT_SET);
			response=FiinfraResponseBuilder.getEmptyResultResponse("No Matching Records Found");
		}
		return response;

	}
	
	
}
