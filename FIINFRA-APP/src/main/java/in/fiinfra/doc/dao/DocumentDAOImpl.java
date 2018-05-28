package in.fiinfra.doc.dao;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

@Repository("documentDao")
public class DocumentDAOImpl implements DocumentDAO{

	private static final Logger logger = Logger.getLogger(DocumentDAOImpl.class);

	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();

	
	private static final String SP_RETRIVE_DOCUMENT_BY_SEARCH_CRITERIA = "{CALL usp_cp_getDocuments(?,?,?,?,?,?,?)}";
	private static final String SP_INSERT_OR_UPDATE_DOCUMENT_FOR_NOTEID = "usp_cp_saveDocument";
	private static final String SP_DELETE_DOCUMENT = "usp_cp_deleteDocumentRecord";
	private static final String SP_GET_DOCUMENT = "{CALL usp_cp_getDocument(?)}";
	private static final String SP_GET_FILE_STORAGE = "{CALL usp_cp_getFileStoragePath(?,?)}";

	@Override
	public List<DocumentData> getDocuments(DocumentRequest req) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(req.getBuId()));
		int refTypeId  = req.getRefTypeId() != null?req.getRefTypeId():0;
		int section = req.getSectionId() ==null ? 0:req.getSectionId();
		int docType = req.getDocumentTypeId() ==null ? 0:req.getDocumentTypeId();
		Integer refId = req.getRefId() ==null ? 0:req.getRefId();
		int fromClient = req.isFromClient()?1:0;
		String reportType = StringUtils.isEmpty(req.getReportType())?null:req.getReportType();
		
		List<DocumentData> data =  jdbcTemplate.query(SP_RETRIVE_DOCUMENT_BY_SEARCH_CRITERIA, new Object[]{req.getPartyId(),section,docType,refTypeId,refId,fromClient,reportType}, 
			    new DocumentMapper());
		return data;
	}

	@Override
	public DocumentData getDocument(int buId, int documentId) {
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		
		List<DocumentData> docs = jdbcTemplate.query(SP_GET_DOCUMENT, new Object[]{documentId}, 
			    new DocumentMapper());
		if(docs.isEmpty()){
			return null;
		}
		return docs.iterator().next();
	}
	
	@Override
	public boolean deleteDocument(int buId, int userId, int docId) {
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
				
			CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_DELETE_DOCUMENT);
			
			sp.setParameters(new SqlParameter[]{
					new SqlParameter("documentId", Types.INTEGER),
					new SqlParameter("userId", Types.INTEGER),
					new SqlOutParameter("result", Types.INTEGER)
			} );	
			
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("documentId", docId);
			paranValues.put("userId", userId);
			
			
			sp.compile();
			
			Map<String, Object> storedProcResult = sp.execute(paranValues);
			logger.debug("storedProcResult:------" + storedProcResult);
			
			return (Integer)storedProcResult.get("result")>0;


	}


	@Override
	public void saveDocument(int buId, DocumentData document) {
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
			
			CommonStoredProcedure sp = new CommonStoredProcedure(	jdbcTemplate, SP_INSERT_OR_UPDATE_DOCUMENT_FOR_NOTEID);
			
			sp.setParameters(new SqlParameter[]{
					new SqlParameter("documentTypeId", Types.INTEGER),
					new SqlParameter("documentName", Types.VARCHAR),
					new SqlParameter("documentText", Types.VARCHAR),
					new SqlParameter("fileName", Types.VARCHAR),
					new SqlParameter("uri", Types.VARCHAR),
					new SqlParameter("storageLocationId", Types.INTEGER),
					new SqlParameter("thumbnail", Types.VARCHAR),
					new SqlParameter("fileSize", Types.INTEGER),
					new SqlParameter("fileType", Types.INTEGER),
					new SqlParameter("currentUser", Types.INTEGER),
					new SqlParameter("refRecordId", Types.INTEGER),
					new SqlParameter("refTypeId", Types.INTEGER),
					new SqlParameter("PartyId", Types.INTEGER),
					new SqlParameter("SectionId", Types.INTEGER),
					new SqlParameter("documentId", Types.INTEGER),
					new SqlOutParameter("result", Types.INTEGER)
			} );
			
			sp.compile();
			
			Integer userId=document.getCreatedBy();
			
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("documentId", document.getDocumentId());
			paranValues.put("documentTypeId", document.getDocumentType());
			paranValues.put("documentName", document.getDocumentName());
			paranValues.put("documentText", document.getDescription());
			paranValues.put("fileName", document.getFileName());
			paranValues.put("uri", document.getFileStoragePathURI());
			paranValues.put("storageLocationId", document.getDocumentStorageLocation());
			paranValues.put("thumbnail", document.getThumbnail());
			paranValues.put("fileSize", document.getFileSize());
			paranValues.put("fileType", document.getFileTypeId());
			paranValues.put("currentUser", userId);
			paranValues.put("refRecordId", document.getRefId());
			paranValues.put("refTypeId", document.getRefTypeId());
			paranValues.put("PartyId", document.getPartyId());
			paranValues.put("SectionId", document.getSectionId());

			Map<String, Object> storedProcResult = sp.execute(paranValues);
			logger.debug("storedProcResult:------" + storedProcResult);
			
			if(document.getDocumentId() <=0){
				document.setDocumentId((Integer) storedProcResult.get("result"));	
			}
	}
	
	@Override
	public String getStoragePath(int buId, int partyId, int storageId){
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
		List<String> lst = jdbcTemplate.query(SP_GET_FILE_STORAGE, new Object[]{partyId,storageId}, 
			    new StringMapper());
		
		return lst.iterator().next();

	}
	
	

	

}
