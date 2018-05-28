package in.fiinfra.doc.dao;

import in.fiinfra.common.common.DocumentData;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DocumentMapper implements RowMapper<DocumentData> {

	@Override
	public DocumentData mapRow(ResultSet rs, int rowNum) throws SQLException {
		DocumentData bean = new DocumentData();
		bean.setDocumentId(rs.getInt("documentId"));
		bean.setDescription(rs.getString("documentText"));
		bean.setDocumentName(rs.getString("documentName"));
		bean.setFileStoragePathURI(rs.getString("FileStoragePathURI"));
		bean.setDocumentType(rs.getInt("documentType"));
		bean.setFileName(rs.getString("fileName"));
		bean.setFileSize(rs.getInt("fileSize"));
		bean.setFileTypeId(rs.getInt("fileType"));
		bean.setRefTypeId(rs.getInt("DocumentRefTypeId"));
		bean.setCreatedBy(rs.getInt("createdById"));
		bean.setCreatedByName(rs.getString("createdBy"));
		bean.setLastModifiedDate(rs.getDate("LastModifiedDate"));
		bean.setUploadedBy(rs.getString("createdBy"));
		bean.setSectionId(rs.getInt("sectionId"));
		bean.setRefTypeName(rs.getString("RefType"));
		bean.setDocumentTypeValue(rs.getString("DocumentTypeValue"));

		bean.setRefId(rs.getInt("DocumentRefRecordId"));
		bean.setRefTypeId(rs.getInt("DocumentRefTypeId"));
		bean.setPartyId(rs.getInt("PartyId"));
		bean.setThumbnail(rs.getString("thumbnail"));

		// String url = bean.getFileStoragePathURI();
		// String fileName = bean.getFileName();
		// String fileType = StringUtils.substringAfterLast(fileName, ".");
		// if(url != null && (FiinfraUtility.isImageType(fileType) ||
		// "pdf".equalsIgnoreCase(fileType))){
		// String baseUrl = StringUtils.substringBeforeLast(url, "/");
		// String file = StringUtils.substringBeforeLast(fileName, ".");
		// String thumbnailPath = baseUrl+"/thumbnail/"+file+".png";
		// bean.setThumbnailUri(thumbnailPath);
		// }

		return bean;
	}

}
