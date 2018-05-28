package in.fiinfra.serviceportal.service;


import in.fiinfra.common.service.vo.Download;

import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

public interface DownloadServices {
   
	
	Response showDownloadedList(String searchText);
	Response getDCcolletral(String searchText);
	void addNewDownload(Download download);
	Response getPartyByPartyId();
	Response ShowDownloadSection();
	void editDocument(Download download);

	Response deleteDownloadList(String deletelist,int userid);

	public boolean addDCcolletral(Download download);
	/*Response fileName(int documentId);*/
	List<Download> fileName(int documentId);
}
