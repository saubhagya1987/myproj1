package in.fiinfra.serviceportal.service;

import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import in.fiinfra.common.service.vo.NotifyTemplate;
import in.fiinfra.serviceportal.dao.NotifyTemplateDao;


public class NotifyTemplateServicesImpl implements NotifyTemplateServices {
	
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	@Autowired
	private NotifyTemplateDao notifyTemplateDao;
		
	public NotifyTemplateDao getNotifyTemplateDao() {
		return notifyTemplateDao;  
	}

	public void setNotifyTemplateDao(NotifyTemplateDao notifyTemplateDao) {
		this.notifyTemplateDao = notifyTemplateDao;
	}
	
	@Override 
	public Response getNotifyTemplateList(NotifyTemplate notifyTemplate) {
		// TODO Auto-generated method stub
		Response templateList = notifyTemplateDao.getNotifyTemplateList(notifyTemplate); 
		return templateList;   
	} 
	 
	@Override
	public Response deleteNotifyTemplate(String deletelist,int userID) {
		// TODO Auto-generated method stub
		Response deleteNotifyTemplate = notifyTemplateDao.deleteNotifyTemplate(deletelist,userID);
		return deleteNotifyTemplate;         
	}
	
	@Override 
	public Response showBizUnit() {
		// TODO Auto-generated method stub
		Response bizUnitList =  notifyTemplateDao.showbizUnit(); 
		return bizUnitList;
	}
	
	@Override 
	public Response showSystem() {
		// TODO Auto-generated method stub
		Response systemList =  notifyTemplateDao.showSystem();
		return systemList;
	}
	
	@Override 
	public Response showRecepient() {
		// TODO Auto-generated method stub
		Response recepientList =notifyTemplateDao.showRecepient();
		return recepientList;
	}
	
	@Override 
	public Response showChannel() {
		// TODO Auto-generated method stub
		Response channelList = notifyTemplateDao.showChannel();
		return channelList;
	}
	
	@Override 
	public Response showSignature() {
		// TODO Auto-generated method stub
		Response signatureList = notifyTemplateDao.showSignature(); 
		return signatureList;
	}
	
	@Override 
	public Response showEvent() {
		// TODO Auto-generated method stub
		Response eventList = notifyTemplateDao.showEvent(); 
		return eventList;
	}
	
	@Override 
	public Response showName() {
		// TODO Auto-generated method stub
		Response nameList =  notifyTemplateDao.showName();
		return nameList;
	}
 
	/*@Override 
	public Response showEmail(String searchEmailString) {
		// TODO Auto-generated method stub
		Response emailList =  notifyTemplateDao.showEmail(searchEmailString);
		return emailList; 
	} */
	
	@Override 
	public Response showEmail() {
		// TODO Auto-generated method stub
		Response emailList =  notifyTemplateDao.showEmail();
		return emailList; 
	} 
	
	@Override
	public Response showEmailPhone(String toDoList) {
		// TODO Auto-generated method stub
		Response emailList1 =  notifyTemplateDao.showEmailPhone(toDoList); 
		return emailList1;  
	}
	
   
	@Override 
	public Response getXmlValues(String id) {
		// TODO Auto-generated method stub
		Response xmlValues =  notifyTemplateDao.getXmlValues(id);
		return xmlValues;
	}
	
	@Override
	public int addNotifyTemplate(int partyid,int notifytypeid,String name,String desc,int notifyeventid,int notifytargetid,int deliverychannelid,int usesugnid,Boolean isactive,Boolean isdnd,Boolean isdesc ,String templateXML,
			String fileName,String fileStoragePathURI, int fileSizeKB,
			String fileName1,String fileStoragePathURI1, int fileSizeKB1,
			String fileName2,String fileStoragePathURI2, int fileSizeKB2,int userID) {
		// TODO Auto-generated method stub 
		int result = 0;
		result = notifyTemplateDao.addNotifyTemplate(partyid, notifytypeid, name, desc, notifyeventid, notifytargetid, deliverychannelid, usesugnid, isactive, isdnd, 
				isdesc,templateXML, fileName,fileStoragePathURI,  fileSizeKB,fileName1,fileStoragePathURI1,  fileSizeKB1,fileName2,fileStoragePathURI2,  fileSizeKB2 ,userID);
		return result;
	}     
  
	@Override
	public int editNotifyTemplate(int notifytemplateid,String name,String description,String templateXML, int editBizUnitID, int editSystemID, int editRecepientID, int editChannelID, int editEventID, int editSignatureID,Boolean isdnd,Boolean isdesc,int userID) {
		// TODO Auto-generated method stub
		int result=0;  
		result = notifyTemplateDao.editNotifyTemplate(notifytemplateid,name,description,templateXML,editBizUnitID,editSystemID,editRecepientID,editChannelID,editEventID,editSignatureID, isdnd, isdesc, userID);
		return result;   
	}

	@Override
	public int importNotifyTemplate(int notifytemplateid, String templateXML) {
		// TODO Auto-generated method stub
		int result = 0;
		result = notifyTemplateDao.importNotifyTemplate(notifytemplateid, templateXML);
		return result; 
	}

	
}
