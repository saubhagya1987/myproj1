package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.CodeTypeData;
import in.fiinfra.common.service.vo.CodeValueData;

import javax.ws.rs.core.Response;

public interface CodeTypeDao 
{
	//CODETYPE
	public Response getCodetypeList(CodeTypeData codetypedata);
	public Response getMaxCodeTypeId(CodeTypeData codetypedata);
	public Response addNewCodetype(CodeTypeData codetypedata);
	//public void addNewCodeType(int codeTypeId,String codetype,String codeDesc,int createdBy,int modifiedBy);
	public Response updateCodeType(CodeTypeData codetypedata);
	//public void updateCodeType(int codeTypeId,String codetype,String codeDesc,int createdBy,int modifiedBy);
	public Response deleteCodetype(CodeTypeData codetypedata);
	public Response viewValesfunction(CodeTypeData codetypedata);
	public Response saveReorderedCodeValues(CodeTypeData codetypedata);
	public Response saveDefaultValueforCodeValues(CodeValueData codevaluedata);
	
	//CODEVALUE
	public Response  getAllCodeValueDetails(CodeValueData codevaluedata);
	public Response deleteCodeValues(CodeTypeData codetypedata);
	public Response getCodeTypeListforCombobox();
	public Response getParentCodeValues(CodeValueData codevaluedata);
	public Response getMaxCodeValueId(CodeValueData codevaluedata);
	public Response getMaxDisplaySeqNo(CodeValueData codevaluedata);
	public Response addNewCodeValue(CodeValueData codevaluedata);
	//public int addNewCodeValue(int codeValueId,int codeTypeId,String codeValue,String codeValueDesc,int displaySeq,int parentCodeValueId,String mappedValue1,String mappedValue2,String mappedValue3,int isDefault,int isDisplay,int isActive,int createdBy,int lastModifiedBy);
	public Response getCodeValueDetalisToUpdate(CodeValueData codevaluedata);
	public Response updateCodeValue(CodeValueData codevaluedata);
	//public int updateCodeValue(int codeValueId,String codeValue,String codeValueDesc,int displaySeqNo,String mappedValue1,String mappedValue2,String mappedValue3,int isDefault,int isDisplay,int isActive);
	
	
	
	 
}
