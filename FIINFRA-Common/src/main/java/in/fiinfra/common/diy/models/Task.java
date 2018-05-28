package in.fiinfra.common.diy.models;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.springframework.web.multipart.MultipartFile;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Task implements Serializable {

	private static final long serialVersionUID = 1006718361419542191L;

	@JsonProperty
	private Integer id;

	public Integer getTaskContactTypeID() {
		return taskContactTypeID;
	}

	public void setTaskContactTypeID(Integer taskContactTypeID) {
		this.taskContactTypeID = taskContactTypeID;
	}

	@JsonProperty
	private Integer ownerPartyId;

	@JsonProperty
	private String ownerPartyName;

	@JsonProperty
	private Integer categoryId;

	@JsonProperty
	private String categoryName;

	@JsonProperty
	private Integer targetPartyId;
	
	
	@JsonProperty
	private Integer targetPartyId1;
	
	
	
	@JsonProperty
	private Integer taskIsClose;
    
	public Integer getTargetPartyId1() {
		return targetPartyId1;
	}

	public void setTargetPartyId1(Integer targetPartyId1) {
		this.targetPartyId1 = targetPartyId1;
	}

	
	
	
	
	
	
	
	
	
	public Integer getTaskIsClose() {
		return taskIsClose;
	}

	public void setTaskIsClose(Integer taskIsClose) {
		this.taskIsClose = taskIsClose;
	}

	@JsonProperty  
	private String targetPartyName;
	
	@JsonProperty
	private Integer targetContactTypeId;

	@JsonProperty
	private String targetContactType;

	@JsonProperty
	private Integer originatedPartyId;

	@JsonProperty
	private Integer statusId;

	@JsonProperty
	private String statusName;

	@JsonProperty
	private Integer priorityId;

	@JsonProperty
	private String priorityName;
	
	@JsonProperty
	private Timestamp dueDateTime;
	
	
	@JsonProperty
	private String dueDateTime1;	
	
	
	@JsonProperty
	private String filename2;	
	
	@JsonProperty
	private String filename3;	
	
	@JsonProperty
	private String filename1;	
	
	
	@JsonProperty
	private String completionDateTime1;	
	
	
	
	
	
	public String getCompletionDateTime1() {
		return completionDateTime1;
	}

	public void setCompletionDateTime1(String completionDateTime1) {
		this.completionDateTime1 = completionDateTime1;
	}

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public String getFilename3() {
		return filename3;
	}

	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}

	public String getFilename1() {
		return filename1;
	}

	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}

	public String getDueDateTime1() {
		return dueDateTime1;
	}

	public void setDueDateTime1(String dueDateTime1) {
		this.dueDateTime1 = dueDateTime1;
	}

	@JsonProperty
	private String dueDateTimeString;	

	@JsonProperty
	private String endDateTimeString;	
	
	
	@JsonProperty
	private String endDateTime1;	
	
	
	
	
	
	
	

	public String getEndDateTime1() {
		return endDateTime1;
	}

	public void setEndDateTime1(String endDateTime1) {
		this.endDateTime1 = endDateTime1;
	}

	public String getEndDateTimeString() {
		return endDateTimeString;
	}

	public void setEndDateTimeString(String endDateTimeString) {
		this.endDateTimeString = endDateTimeString;
	}

	@JsonProperty
	private Timestamp completionDateTime;


	@JsonProperty
	private Timestamp taskEndDate;

	
	
	
	public Timestamp getTaskEndDate() {
		return taskEndDate;
	}

	public void setTaskEndDate(Timestamp taskEndDate) {
		this.taskEndDate = taskEndDate;
	}

	@JsonProperty
	private String completionDateTimeString;
	
	@JsonProperty
	private String subject;

	@JsonProperty
	private String description;
	
	@JsonProperty
	private Integer createdBy;

	@JsonProperty
	private List<Document> documentList;
	
	@JsonProperty
	private Integer attachment1DocumentID;
	@JsonProperty
	private Integer attachment2DocumentID;
	@JsonProperty
	private Integer attachment3DocumentID;
	
	@JsonProperty
	private String attachment1DocumentName;
	
	@JsonProperty
	private String attachment2DocumentName;
	
	@JsonProperty
	private String attachment3DocumentName;
	
	
	@JsonProperty
	private String partyName;
	
	@JsonProperty
	private Integer partyID;	
	

	@JsonProperty
	private Integer buPartyId;
	
	@JsonProperty
	private Integer userId;
	
	
	@JsonProperty
	private Integer assignTo;
	
	
	@JsonProperty
	private Integer taskOwnerPartyID;
	

	@JsonProperty
	private Integer taskOnRelatedPartyID;
	

	@JsonProperty
	private Integer taskTypeID;
	
	
	@JsonProperty
	private Integer taskPriorityID;
	
	@JsonProperty
	private Integer taskStatusID;
	
	@JsonProperty
	private Integer taskContactTypeID;
	
	
	@JsonProperty
	private String taskSubject;
	
	
	@JsonProperty
	private String taskCreatedBy;
	
	@JsonProperty
	private String taskText;
	
	
	@JsonProperty
	private Integer currentNodeId;
	
	


	public Integer getCurrentNodeId() {
		return currentNodeId;
	}

	public void setCurrentNodeId(Integer currentNodeId) {
		this.currentNodeId = currentNodeId;
	}

	public String getTaskCreatedBy() {
		return taskCreatedBy;
	}

	public void setTaskCreatedBy(String taskCreatedBy) {
		this.taskCreatedBy = taskCreatedBy;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public Integer getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(Integer assignTo) {
		this.assignTo = assignTo;
	}



	public Integer getBuPartyId() {
		return buPartyId;
	}

	public void setBuPartyId(Integer buPartyId) {
		this.buPartyId = buPartyId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public String getAttachment1DocumentName() {
		return attachment1DocumentName;
	}

	public void setAttachment1DocumentName(String attachment1DocumentName) {
		this.attachment1DocumentName = attachment1DocumentName;
	}

	public String getAttachment2DocumentName() {
		return attachment2DocumentName;
	}

	public void setAttachment2DocumentName(String attachment2DocumentName) {
		this.attachment2DocumentName = attachment2DocumentName;
	}

	public String getAttachment3DocumentName() {
		return attachment3DocumentName;
	}

	public void setAttachment3DocumentName(String attachment3DocumentName) {
		this.attachment3DocumentName = attachment3DocumentName;
	}


	
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOwnerPartyId() {
		return ownerPartyId;
	}

	public void setOwnerPartyId(Integer ownerPartyId) {
		this.ownerPartyId = ownerPartyId;
	}

	public String getOwnerPartyName() {
		return ownerPartyName;
	}

	public void setOwnerPartyName(String ownerPartyName) {
		this.ownerPartyName = ownerPartyName;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getTargetPartyName() {
		return targetPartyName;
	}

	public void setTargetPartyName(String targetPartyName) {
		this.targetPartyName = targetPartyName;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getTargetPartyId() {
		return targetPartyId;
	}

	public void setTargetPartyId(Integer targetPartyId) {
		this.targetPartyId = targetPartyId;
	}

	public Integer getTargetContactTypeId() {
		return targetContactTypeId;
	}

	public void setTargetContactTypeId(Integer targetContactTypeId) {
		this.targetContactTypeId = targetContactTypeId;
	}

	public String getTargetContactType() {
		return targetContactType;
	}

	public void setTargetContactType(String targetContactType) {
		this.targetContactType = targetContactType;
	}

	public Integer getOriginatedPartyId() {
		return originatedPartyId;
	}

	public void setOriginatedPartyId(Integer originatedPartyId) {
		this.originatedPartyId = originatedPartyId;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public Integer getPriorityId() {
		return priorityId;
	}

	public void setPriorityId(Integer priorityId) {
		this.priorityId = priorityId;
	}

	public String getPriorityName() {
		return priorityName;
	}

	public void setPriorityName(String priorityName) {
		this.priorityName = priorityName;
	}

	public Timestamp getDueDateTime() {
		return dueDateTime;
	}

	public void setDueDateTime(Timestamp dueDateTime) {
		this.dueDateTime = dueDateTime;
	}

	public Timestamp getCompletionDateTime() {
		return completionDateTime;
	}

	public void setCompletionDateTime(Timestamp completionDateTime) {
		this.completionDateTime = completionDateTime;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Document> getDocumentList() {
		return documentList;
	}

	public void setDocumentList(List<Document> documentList) {
		this.documentList = documentList;
	}

	public String getDueDateTimeString() {
		return dueDateTimeString;
	}

	public void setDueDateTimeString(String dueDateTimeString) {
		this.dueDateTimeString = dueDateTimeString;
	}

	public String getCompletionDateTimeString() {
		return completionDateTimeString;
	}

	public void setCompletionDateTimeString(String completionDateTimeString) {
		this.completionDateTimeString = completionDateTimeString;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getAttachment1DocumentID() {
		return attachment1DocumentID;
	}

	public void setAttachment1DocumentID(Integer attachment1DocumentID) {
		this.attachment1DocumentID = attachment1DocumentID;
	}

	public Integer getAttachment2DocumentID() {
		return attachment2DocumentID;
	}

	public void setAttachment2DocumentID(Integer attachment2DocumentID) {
		this.attachment2DocumentID = attachment2DocumentID;
	}

	public Integer getAttachment3DocumentID() {
		return attachment3DocumentID;
	}

	public void setAttachment3DocumentID(Integer attachment3DocumentID) {
		this.attachment3DocumentID = attachment3DocumentID;
	}

//	@Override
//	public String toString() {
//		return new ReflectionToStringBuilder(this).toString();
//	}
	
	@JsonIgnore
	private transient MultipartFile[] taskAttachment;

	public MultipartFile[] getTaskAttachment() {
		return taskAttachment;
	}

	public void setTaskAttachment(MultipartFile[] taskAttachment) {
		this.taskAttachment = taskAttachment;
	}

	public Integer getTaskOwnerPartyID() {
		return taskOwnerPartyID;
	}

	public void setTaskOwnerPartyID(Integer taskOwnerPartyID) {
		this.taskOwnerPartyID = taskOwnerPartyID;
	}

	public Integer getTaskOnRelatedPartyID() {
		return taskOnRelatedPartyID;
	}

	public void setTaskOnRelatedPartyID(Integer taskOnRelatedPartyID) {
		this.taskOnRelatedPartyID = taskOnRelatedPartyID;
	}

	public Integer getTaskTypeID() {
		return taskTypeID;
	}

	public void setTaskTypeID(Integer taskTypeID) {
		this.taskTypeID = taskTypeID;
	}

	public Integer getTaskPriorityID() {
		return taskPriorityID;
	}

	public void setTaskPriorityID(Integer taskPriorityID) {
		this.taskPriorityID = taskPriorityID;
	}

	public Integer getTaskStatusID() {
		return taskStatusID;
	}

	public void setTaskStatusID(Integer taskStatusID) {
		this.taskStatusID = taskStatusID;
	}

	public String getTaskSubject() {
		return taskSubject;
	}

	public void setTaskSubject(String taskSubject) {
		this.taskSubject = taskSubject;
	}

	public String getTaskText() {
		return taskText;
	}

	public void setTaskText(String taskText) {
		this.taskText = taskText;
	}
	
	
	
	
	
}
