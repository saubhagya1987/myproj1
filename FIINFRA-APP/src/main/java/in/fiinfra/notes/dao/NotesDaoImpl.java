package in.fiinfra.notes.dao;

import in.fiinfra.common.note.Note;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("noteDao")
public class NotesDaoImpl implements NotesDao 
{
	private static final Logger logger = Logger.getLogger(NotesDaoImpl.class);

	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	
	private static final String SP_RETRIVE_NOTE_BY_SEARCH_CRITERIA = "{CALL usp_cp_getNoteList(?,?)}";
	private static final String SP_INSERT_OR_UPDATE_NOTE_FOR_NOTEID = "usp_cp_saveNote";


	@Override
	public Note insertOrUpdateNote(int buId, Note note) 
	{
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_INSERT_OR_UPDATE_NOTE_FOR_NOTEID);
		
		sp.setParameters(new SqlParameter[]{
				new SqlOutParameter("noteId", Types.INTEGER),
				new SqlOutParameter("recordCount", Types.INTEGER),
				new SqlParameter("sectionId", Types.INTEGER),
				new SqlParameter("noteTitle", Types.VARCHAR),
				new SqlParameter("noteText", Types.VARCHAR),
				new SqlParameter("PartyId", Types.INTEGER),
				new SqlParameter("updatedBy", Types.INTEGER),
				new SqlParameter("noteId1", Types.INTEGER),
				new SqlParameter("refId", Types.INTEGER),
				new SqlParameter("refTypeId", Types.INTEGER)

		} );
		
		sp.compile();
		
		Integer userId=note.getNoteId() !=null && note.getNoteId()>0 ? note.getModifiedBy(): note.getCreatedBy();
		
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("noteId", note.getNoteId());
		paranValues.put("refTypeId", note.getRefTypeId());
		paranValues.put("refId", note.getRefId());
		paranValues.put("sectionId", note.getSectionId());
		paranValues.put("noteId1", note.getNoteId());
		paranValues.put("noteTitle", note.getTitle());
		paranValues.put("noteText", note.getDescription());
		paranValues.put("PartyId", note.getPartyId());
		paranValues.put("updatedBy",userId);

		Map<String, Object> storedProcResult = sp.execute(paranValues);
		logger.debug("storedProcResult:------" + storedProcResult);
		
		note.setNoteId((Integer) storedProcResult.get("noteId"));
		
		return note;
	}
	
	

	@Override
	public List<Note> getListOfNotes(int buId,Integer refTypeId,Integer refId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_RETRIVE_NOTE_BY_SEARCH_CRITERIA, new Object[]{refTypeId,refId}, 
			    new NoteMapper());
		
	}



	@Override
	public String deleteNote(String noteIds, int buId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		String result = FiinfraConstants.fail;
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_cp_deleteNotes");
		SqlParameter noteIdsParam = new SqlParameter("noteIds", Types.VARCHAR);
		SqlOutParameter recordCountParam = new SqlOutParameter("recordCount", Types.INTEGER);
		SqlParameter[] paramArray = { noteIdsParam,recordCountParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("noteIds", noteIds);
		logger.debug("paranValues:--" + paranValues);
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.debug("storedProcResult:---" + storedProcResult);
		int recordCount=(int) storedProcResult.get("recordCount");
		if(recordCount>0)
		result = FiinfraConstants.success;
		//result = FiinfraConstants.EMPTY_RESULT_SET;
		
		return result;
	}

	

}
