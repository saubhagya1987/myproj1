package in.fiinfra.admin.dao;

import java.util.List;
import java.util.Map;

import in.fiinfra.common.admin.TestData;

public interface AdminDao {
	
	public List<Map<String,Object>> getData();
	
	public TestData getTestData();
	

}
