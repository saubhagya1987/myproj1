package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.NotifyTemplate;

import javax.ws.rs.core.Response;

public interface NotifyTemplateServices {
	
	Response getNotifyTemplateList(NotifyTemplate notifyTemplate);
	
	Response deleteNotifyTemplate(String deletelist,int userID); 
	 
	Response showBizUnit();
	
	Response showSystem(); 
	
	Response showRecepient(); 
	
	Response showChannel();  
	
	Response showSignature();
	
	Response showEvent();
	
	Response showName();
   
	Response showEmail(); 
	  
	Response showEmailPhone(String toDoList);    
	
	public int addNotifyTemplate(int partyid,int notifytypeid,String name,String desc,int notifyeventid,int notifytargetid,int deliverychannelid,int usesugnid,Boolean isactive,Boolean isdnd,Boolean isdesc ,String templateXML,
			String fileName,String fileStoragePathURI, int fileSizeKB,
			String fileName1,String fileStoragePathURI1, int fileSizeKB1,
			String fileName2,String fileStoragePathURI2, int fileSizeKB2 , int userID); 
	
	Response getXmlValues(String id); 
	   
	public int  editNotifyTemplate(int notifytemplateid,String name,String description,String templateXML, int editBizUnitID, int editSystemID, int editRecepientID, int editChannelID, int editEventID, int editSignatureID,Boolean isdnd,Boolean isdesc,int userID);
	
	public int  importNotifyTemplate(int notifytemplateid,String templateXML);
}

