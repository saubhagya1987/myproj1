package in.fiinfra.notes.dao;

import in.fiinfra.common.note.Note;

import java.util.List;

public interface NotesDao
{
	public Note insertOrUpdateNote(int buId,Note note);
	
	public List<Note> getListOfNotes(int buId,Integer refType,Integer refId);

	public String deleteNote(String noteIds, int buId);

}
