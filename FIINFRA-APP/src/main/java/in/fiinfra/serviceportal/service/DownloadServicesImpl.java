package in.fiinfra.serviceportal.service;



import in.fiinfra.common.service.vo.Download;
import in.fiinfra.serviceportal.dao.DownloadDao;

import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class DownloadServicesImpl implements  DownloadServices
{
	@Autowired
	private DownloadDao downloadDao;
	
	
	public DownloadDao getDownloadDao() {
		return downloadDao;
	}


	public void setDownloadDao(DownloadDao downloadDao) {
		this.downloadDao = downloadDao;
	}


	@Override
	public Response showDownloadedList(String searchText) {
		Response resp=downloadDao.showDownloadedList(searchText);
		return resp;
	}


	@Override
	public Response getDCcolletral(String searchText) {
		Response resp=downloadDao.getDCcolletral(searchText);
		return resp;
	}
	
	
	@Override
	public void addNewDownload(Download download) {
		System.out.println("gone");
		downloadDao.addNewDownload(download);

		
	}


	@Override
	public boolean addDCcolletral( Download download) {
		System.out.println("gone");
		downloadDao.addDCcolletral(download);
	
	return true;
	}
	
	
	@Override
	public Response getPartyByPartyId() {
		Response resp=downloadDao.getPartyByPartyId();
		return resp;
	}


	@Override
	public Response ShowDownloadSection() {
		Response resp=downloadDao.ShowDownloadSection();
		return resp;
	}


	@Override
	public void editDocument(Download download) {
		downloadDao.editDocument(download);
	
	}


	@Override
	public Response deleteDownloadList(String deletelist, int userid) {
		Response deldown=downloadDao.deleteDownloadList(deletelist,userid);
		return deldown;
	}


	

	
	@Override
	public List<Download> fileName(int documentId) {
		List<Download>  name=downloadDao.fileName(documentId);
		return name;
	}

	/*@Override
	public List<Download> showDownloadedList() {
		return downloadDao.showDownloadedList();
		
	}


	@Override
	public void addNewDownload( 
			boolean documentBinary, String documentName,
			String fileName,
			String fileStoragePathURI, int fileSizeKB,
			int partyId, boolean isDownloadModule, int downloadModuleID,
			String downloadDescription, int createdBy, int lastModifiedBy,
			 boolean isShareEmail,
			boolean isShareView, boolean isShareDownload,Date downloadExpiryDate) {
		
		downloadDao.addNewDownload(documentBinary, documentName,  fileName, fileStoragePathURI, fileSizeKB, partyId, isDownloadModule, downloadModuleID, downloadDescription, createdBy, lastModifiedBy, isShareEmail, isShareView, isShareDownload,downloadExpiryDate);
		
		
	}


	@Override
	public List<Download> getPartyByPartyId() {
		return downloadDao.getPartyByPartyId();
		
	}


	@Override
	public List<Download> ShowDownloadSection() {		
		return downloadDao.ShowDownloadSection();
	}


	@Override
	public void editDocument(int documentId,String documentName,String fileName,
			String fileStoragePathURI, int fileSizeKB,
			int partyId, int downloadModuleID,
			String downloadDescription, int createdBy,
			 boolean isShareEmail,
			boolean isShareView, boolean isShareDownload,Date downloadExpiryDate) {
	     downloadDao.editDocument(documentId,documentName,  fileName, fileStoragePathURI,  fileSizeKB, partyId,downloadModuleID, downloadDescription, createdBy, isShareEmail, isShareView, isShareDownload,downloadExpiryDate);
		
	}


	@Override
	public List<Download> deleteDownloadList(String deletelist) {
		List<Download> updatedDownloadList=downloadDao.deleteDownloadList(deletelist);
		return updatedDownloadList;
		
		
	}


	@Override
	public List<Download> fileName(int documentId) {
		List<Download>  name=downloadDao.fileName(documentId);
		return name;
	}*/



	

}
