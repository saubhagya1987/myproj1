package in.fiinfra.note.service;

import in.fiinfra.common.note.Note;
import in.fiinfra.cp.common.model.NoteRequest;
import in.fiinfra.cp.common.service.BasicService;
import in.fiinfra.cp.common.service.Services;

import java.util.List;

public class NoteService extends BasicService {

	public Integer addUpdateNote(Note note) {
		return getService().postForObject(Services.addUpdateNote, note,
				Integer.class, appendPathParam());
	}

	public List<Note> listNote(NoteRequest request) {
		return getService().getForObjectCollection(Services.getListOfNotes,
				request, Note.class, appendPathParam());
	}

}
