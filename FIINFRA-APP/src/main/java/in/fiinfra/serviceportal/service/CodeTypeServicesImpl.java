package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.CodeTypeData;
import in.fiinfra.common.service.vo.CodeValueData;
import in.fiinfra.serviceportal.dao.CodeTypeDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;


public class CodeTypeServicesImpl implements CodeTypeServices 
{
	@Autowired
	private CodeTypeDao codeTypeDao;

	public CodeTypeDao getCodeTypeDao() 
	{
		return codeTypeDao;
	}

	public void setCodeTypeDao(CodeTypeDao codeTypeDao) 
	{
		this.codeTypeDao = codeTypeDao;
	}

	//CODETYPE
	@Override
	public Response getCodetypeList(CodeTypeData codetypedata) 
	{
		return codeTypeDao.getCodetypeList(codetypedata);
	}

	@Override
	public Response getMaxCodeTypeID(CodeTypeData codetypedata) 
	{
		
		return codeTypeDao.getMaxCodeTypeId(codetypedata);
	}
	
	
	@Override
	public Response addNewCodetype(CodeTypeData codetypedata) 
	{
		Response result = codeTypeDao.addNewCodetype(codetypedata);
		return result;
	}
	
	@Override
	public Response updateCodeType(CodeTypeData codetypedata) 
	{
		Response result = codeTypeDao.updateCodeType(codetypedata);
		return result;
	}

	
	@Override
	public Response deleteCodetype(CodeTypeData codetypedata) 
	{
		//Response deleteCodetype = null;
		Response deleteCodetype = codeTypeDao.deleteCodetype(codetypedata);
		return deleteCodetype;
	}

	@Override
	public Response viewValesfunction(CodeTypeData codetypedata) 
	{
		//Response codetypeValue = null;
		Response codetypeValue=codeTypeDao.viewValesfunction(codetypedata);
		return codetypeValue;
	}

	@Override
	public Response saveReorderedCodeValues(CodeTypeData codetypedata) 
	{
		//Response count = null;
		Response count=codeTypeDao.saveReorderedCodeValues(codetypedata);
		return count;
	}
	
	@Override
	public Response saveDefaultValueforCodeValues(CodeValueData codevaluedata) 
	{
		Response result = codeTypeDao.saveDefaultValueforCodeValues(codevaluedata);
		return result;
		
	}

	//CODEVALUE
	@Override
	public Response getAllCodeValueDetails(CodeValueData codevaluedata) 
	{
		Response codevalulist = codeTypeDao.getAllCodeValueDetails(codevaluedata);
		return codevalulist;
	}

	@Override
	public Response deleteCodeValues(CodeTypeData codetypedata) 
	{
		Response result = codeTypeDao.deleteCodeValues(codetypedata);
		return result;
	}

	@Override
	public Response getCodeTypeListforCombobox() 
	{
		Response List = codeTypeDao.getCodeTypeListforCombobox();
		return List;
	}

	@Override
	public Response getParentCodeValues(CodeValueData codevaluedata)
	{
		Response List = codeTypeDao.getParentCodeValues(codevaluedata);
		return List;
	}

	@Override
	public Response getMaxCodeValueId(CodeValueData codevaluedata) 
	{
		Response maxcodevalue = codeTypeDao.getMaxCodeValueId(codevaluedata);
		return maxcodevalue;
	}

	@Override
	public Response getMaxDisplaySeqNo(CodeValueData codevaluedata) 
	{
		Response maxdespeqeno = codeTypeDao.getMaxDisplaySeqNo(codevaluedata);
		return maxdespeqeno;
	}

	@Override
	public Response addNewCodeValue(CodeValueData codevaluedata) 
	{
		Response result = codeTypeDao.addNewCodeValue(codevaluedata);
		return result;
	}

	@Override
	public Response getCodeValueDetalisToUpdate(CodeValueData codevaluedata) 
	{
		Response List = codeTypeDao.getCodeValueDetalisToUpdate(codevaluedata);
		return List;
	}

	@Override
	public Response updateCodeValue(CodeValueData codevaluedata) 
	{
		Response result = codeTypeDao.updateCodeValue(codevaluedata);
		return result;
	}
	
	

}
