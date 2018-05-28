package in.fiinfra.notes.dao;

import in.fiinfra.common.note.Note;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class NoteMapper implements RowMapper<Note>{

	@Override
	public Note mapRow(ResultSet rs, int rowNum) throws SQLException {
		Note bean = new Note();
		bean.setNoteId(rs.getInt("noteId"));
		bean.setTitle(rs.getString("noteTitle"));
		bean.setDescription(rs.getString("noteText"));
		bean.setPartyId(rs.getInt("partyId"));
		bean.setCreatedBy(rs.getInt("createdById"));
		bean.setCreatedByName(rs.getString("createdBy"));
		bean.setLastModifiedDate(rs.getString("LastUpdatedDate"));
		bean.setLastModifiedByName(rs.getString("LastUpdatedBy"));
		bean.setModifiedBy(rs.getInt("LastUpdatedById"));
		bean.setRefId(rs.getInt("refId"));
		bean.setRefTypeId(rs.getInt("refTypeId"));
		bean.setRefTypeName(rs.getString("refTypeName"));
		bean.setPartyName(rs.getString("party"));
		bean.setSectionId(rs.getInt("sectionId"));
		
		return bean;
	}

}
