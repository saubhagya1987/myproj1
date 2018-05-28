package in.fiinfra.common.service.vo;

public class NotifyEvent {

	private int notifyeventid ;
	private int codevalueId; 
	private int eventcategoryid;
	private int sourcesystemid;
	private int systemID;  
	     
	private byte isActive; 
	
	private String category;   
	private String event_System;
	private String name;
	private String description; 
	private String codetype;            
	private String codevalue; 
	private String searchText;
	private int userid;     
   
	public int getUserID() {
		return userid;
	}
	public void setUserID(int userid) {
		this.userid = userid;
	}
	public int getSystemID() {
		return systemID;
	}
	public void setSystemID(int systemID) {
		this.systemID = systemID;
	}
	public int getEventcategoryid() {
		return eventcategoryid;
	}
	public void setEventcategoryid(int eventcategoryid) {
		this.eventcategoryid = eventcategoryid;
	}
	public int getSourcesystemid() {  
		return sourcesystemid;
	}
	public void setSourcesystemid(int sourcesystemid) {
		this.sourcesystemid = sourcesystemid;
	}
	public int getCodevalueId() {
		return codevalueId;
	}
	public void setCodevalueId(int codevalueId) {
		this.codevalueId = codevalueId;
	}
	public String getCodetype() {
		return codetype;
	} 
	public void setCodetype(String codetype) {
		this.codetype = codetype;
	}
	public String getCodevalue() {
		return codevalue;
	}
	public void setCodevalue(String codevalue) {
		this.codevalue = codevalue;
	}
	      
	public int getNotifyeventid() {
		return notifyeventid;  
	}
	public void setNotifyeventid(int notifyeventid) {
		this.notifyeventid = notifyeventid;
	}
	public byte getIsActive() {
		return isActive;    
	}
	public void setIsActive(byte isActive) {
		this.isActive = isActive;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;      
	}
	public String getEvent_System() {
		return event_System;
	}
	public void setEvent_System(String event_System) {
		this.event_System = event_System;
	}
	public String getName() {
		return name;    
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {    
		return description;  
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText; 
	} 
	 
}
