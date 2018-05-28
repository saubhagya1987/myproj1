package in.fiinfra.common.service.vo;


public class CodeValueData 
{
	private Integer codeValueId;
	private String codeType;
	private Integer codeTypeId;
	private String codeValue;
	private Integer displaySeqNo;
	private Integer parentCodeValueId;
	private String parentCodeValue;
	private String lastModifiedDate;
	private String mappedValue1;
	private String mappedValue2;
	private String mappedValue3;
	private boolean isActive;
	private boolean isDefault;
	private boolean isDisplay;
	private String codeValueDescription;
	private String searchText;
	
	

	public String getCodeValueDescription() 
	{
		return codeValueDescription;
	}
	public void setCodeValueDescription(String codeValueDescription) 
	{
		this.codeValueDescription = codeValueDescription;
	}
	
	public Integer getCodeValueId() {
		return codeValueId;
	}
	public void setCodeValueId(Integer codeValueId) {
		this.codeValueId = codeValueId;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	public Integer getCodeTypeId() {
		return codeTypeId;
	}
	public void setCodeTypeId(Integer codeTypeId) {
		this.codeTypeId = codeTypeId;
	}
	public String getCodeValue() {
		return codeValue;
	}
	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}
	public Integer getDisplaySeqNo() {
		return displaySeqNo;
	}
	public void setDisplaySeqNo(Integer displaySeqNo) {
		this.displaySeqNo = displaySeqNo;
	}
	public Integer getParentCodeValueId() {
		return parentCodeValueId;
	}
	public void setParentCodeValueId(Integer parentCodeValueId) {
		this.parentCodeValueId = parentCodeValueId;
	}
	public String getParentCodeValue() {
		return parentCodeValue;
	}
	public void setParentCodeValue(String parentCodeValue) {
		this.parentCodeValue = parentCodeValue;
	}
	public String getLastModifiedDate() {
		return lastModifiedDate;
	}
	public void setLastModifiedDate(String lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}
	public String getMappedValue1() {
		return mappedValue1;
	}
	public void setMappedValue1(String mappedValue1) {
		this.mappedValue1 = mappedValue1;
	}
	public String getMappedValue2() {
		return mappedValue2;
	}
	public void setMappedValue2(String mappedValue2) {
		this.mappedValue2 = mappedValue2;
	}
	public String getMappedValue3() {
		return mappedValue3;
	}
	public void setMappedValue3(String mappedValue3) {
		this.mappedValue3 = mappedValue3;
	}
	public boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}
	public boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}
	public boolean getIsDisplay() {
		return isDisplay;
	}
	public void setIsDisplay(boolean isDisplay) {
		this.isDisplay = isDisplay;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
}
