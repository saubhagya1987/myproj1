package in.fiinfra.notes.service;

import in.fiinfra.common.note.Note;

import java.util.List;

public interface NotesService 
{
	public List<Note> getListOfNotes(int buId,Integer refType,Integer refId);
	
	public Note insertUpdateNote(int buId,Note note);

	public String deleteNote(String noteIds, int buId);
}
