package in.fiinfra.serviceportal.dao;

import java.util.List;

import in.fiinfra.common.partner.ETPrePrintedFormData;
import in.fiinfra.common.service.vo.BizUnit;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.util.DataSourceProvider;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("spExecutionDao")
public class SPExecutionDaoImpl implements SPExecutionDao 
{
	
	@Autowired
	DataSourceProvider dataSourceProvider;
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
   Response response;
   

	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}


	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}

	@Override
	public Response getTrcakerDetail(ETPrePrintedFormData data)
	{
		BaseResponse<ETPrePrintedFormData> br = new BaseResponse<ETPrePrintedFormData>();
		try
		{
		List<ETPrePrintedFormData> data1;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		data1 = jdbcTemplate.query(FiinfraConstants.SP_GET_EXECUTION_TRACK_DETAIL,new Object[] {7537,data.getSearchText()},new BeanPropertyRowMapper(ETPrePrintedFormData.class));
		br.setResponseListObject(data1);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
				}
	}

}
