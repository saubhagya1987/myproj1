package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.NotifyEvent;

import java.util.List;  

import javax.ws.rs.core.Response;

public interface NotifyEventDao {   
 
			Response getNitifyEventList(NotifyEvent notifyEvent);  
    		
			Response deleteNotifyEvent(String deletelist,int deleteuserId);
    		
			Response showCategoryList();  
    		
			Response showSystemList();
    		
			Response addNotifyEvent(String name,String description,int eventcategoryid,int sourcesystemid,int userId );
    		
		 	Response editNotifyEvent(int notifyeventid,String name,String description,int eventcategoryid,int sourcesystemid,int userId);
    		
    	
}
