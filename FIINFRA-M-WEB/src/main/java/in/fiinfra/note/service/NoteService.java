package in.fiinfra.note.service;

import in.fiinfra.common.note.Note;
import in.fiinfra.common.service.Services;
import in.fiinfra.query.model.NoteRequest;
import in.fiinfra.query.service.BasicService;

import java.util.List;

public class NoteService extends BasicService {
	
	public Integer addUpdateNote(Note note){
		return getService().postForObject(Services.addUpdateNote, note, Integer.class, appendPathParam());
	}
	
	
	
	public List<Note> listNote(NoteRequest request){
		return getService().getForObjectCollection(Services.getListOfNotes, request, Note.class,appendPathParam() );
	}
	
	public String deleteNote(NoteRequest request){
		return getService().getForObject(Services.deleteNote, request, String.class,appendPathParam() );
	}

}
