package in.fiinfra.common.partner;

public class TransactionData {
	
	private String createdDate;
	
	private Integer batchId;
	
	private String transactionType;
	
	private String status;
	
	private Integer errorCount;
	
	private Integer recordCount;
	
	private String fileName;
	
	private String searchText;  
	
	private int buId;
	 
	private int partyid;
	
	private String partnername;  
	
	private String arn; 
	
	private int recordNo; 
	
	private int failureType;
	   
		 
	private String errorDetails;
	 
	private String failureDataType;
	
	private String basepath;
	 
	private String filepath;  
	
	private Integer successCount;  
	
    private String UploadSourceType;	

	 
  
	public Integer getSuccessCount() {
		return successCount;
	}

	public void setSuccessCount(Integer successCount) {
		this.successCount = successCount;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getBasepath() {
		return basepath;
	}

	public void setBasepath(String basepath) {
		this.basepath = basepath;
	}

	public String getFailureDataType() {
		return failureDataType;
	}

	public void setFailureDataType(String failureDataType) {
		this.failureDataType = failureDataType;
	}

	public int getFailureType() {
		return failureType;
	}

	public void setFailureType(int failureType) {
		this.failureType = failureType;
	}
  
	public String getErrorDetails() {
		return errorDetails;
	}  

	public void setErrorDetails(String errorDetails) {
		this.errorDetails = errorDetails;
	}

	public int getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}
	
	public String getArn() {  
		return arn;
	}
 
	public void setArn(String arn) {
		this.arn = arn;
	}

	public int getBuId() {
		return buId;
	} 

	public void setBuId(int buId) {
		this.buId = buId;
	}

	 

	public int getPartyid() {
		return partyid;
	}

	public void setPartyid(int partyid) {
		this.partyid = partyid;
	}

	public String getPartnername() {
		return partnername;
	}

	public void setPartnername(String partnername) {
		this.partnername = partnername;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getBatchId() {
		return batchId;
	}

	public void setBatchId(Integer batchId) {
		this.batchId = batchId;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getErrorCount() {
		return errorCount;
	}

	public void setErrorCount(Integer errorCount) {
		this.errorCount = errorCount;
	}

	public Integer getRecordCount() {
		return recordCount;
	} 

	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}

	public String getUploadSourceType() {
		return UploadSourceType;
	}

	public void setUploadSourceType(String uploadSourceType) {
		UploadSourceType = uploadSourceType;
	}
	
	
	

}
