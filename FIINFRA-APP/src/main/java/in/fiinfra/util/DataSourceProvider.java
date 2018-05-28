package in.fiinfra.util;

import javax.sql.DataSource;

import in.fiinfra.common.util.FiinfraConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class DataSourceProvider {
	@Autowired
	DataSource FF_dataSource;
	@Autowired
	DataSource SC_dataSource;

	


	public DataSource getDataSource(int buDetails) {

		if (buDetails == FiinfraConstants.AXISMFBUID)
			return SC_dataSource;
		else
			return FF_dataSource;

	}


	public DataSource getFF_dataSource() {
		return FF_dataSource;
	}


	public void setFF_dataSource(DataSource fF_dataSource) {
		FF_dataSource = fF_dataSource;
	}


	public DataSource getSC_dataSource() {
		return SC_dataSource;
	}


	public void setSC_dataSource(DataSource sC_dataSource) {
		SC_dataSource = sC_dataSource;
	}

	
	

}
