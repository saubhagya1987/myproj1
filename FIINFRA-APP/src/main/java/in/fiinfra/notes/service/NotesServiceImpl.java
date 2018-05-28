package in.fiinfra.notes.service;

import in.fiinfra.common.note.Note;
import in.fiinfra.notes.dao.NotesDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noteService")
public class NotesServiceImpl implements NotesService 
{
	@Autowired
	NotesDao notesDao;
	
	
	@Override
	public List<Note> getListOfNotes(int buId,Integer refTypeId,Integer refId) {
		return notesDao.getListOfNotes(buId,refTypeId,refId);
		
	}


	@Override
	public Note insertUpdateNote(int buId,Note note) {
		return notesDao.insertOrUpdateNote(buId,note);

	}


	@Override
	public String deleteNote(String noteIds, int buId) {
		return notesDao.deleteNote(noteIds,buId);
	}
	
	
	
}
