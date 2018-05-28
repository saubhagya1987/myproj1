package in.fiinfra.common.service.vo;

import java.util.Date;

public class CodeTypeData 
{
	private int codeTypeId;
	private int createdBy;
	private int modifiedBy;
	private String  codeType;
	private String codeTypeDescription;
	
	private Date createdDate;
	private Date lastModifiedDate;
	private int codeValuesCount;
	private int inActiveCount;
	private String temp; 
	private String searchText;
	private Integer maxCodetypeId;
	private String deleteList;
	private String codeValueIDs;
	
	
	public int getCodeTypeId() 
	{
		return codeTypeId;
	}

	public void setCodeTypeId(int codeTypeId) {
		this.codeTypeId = codeTypeId;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getCodeTypeDescription() {
		return codeTypeDescription;
	}

	public void setCodeTypeDescription(String codeTypeDescription) {
		this.codeTypeDescription = codeTypeDescription;
	}
	
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public int getCodeValuesCount() {
		return codeValuesCount;
	}

	public void setCodeValuesCount(int codeValuesCount) {
		this.codeValuesCount = codeValuesCount;
	}

	public int getInActiveCount() {
		return inActiveCount;
	}

	public void setInActiveCount(int inActiveCount) 
	{
		this.inActiveCount = inActiveCount;
		this.temp=String.valueOf(this.codeValuesCount)+"["+String.valueOf(this.inActiveCount)+"]";
	}

	public String getTemp() {
		return temp;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Integer getMaxCodetypeId() {
		return maxCodetypeId;
	}

	public void setMaxCodetypeId(Integer maxCodetypeId) {
		this.maxCodetypeId = maxCodetypeId;
	}

	public String getDeleteList() {
		return deleteList;
	}

	public void setDeleteList(String deleteList) {
		this.deleteList = deleteList;
	}

	public String getCodeValueIDs() {
		return codeValueIDs;
	}

	public void setCodeValueIDs(String codeValueIDs) {
		this.codeValueIDs = codeValueIDs;
	}
	
}
