package in.fiinfra.admin.service;

import java.util.List;
import java.util.Map;

import in.fiinfra.common.admin.TestData;

public interface AdminService {

	public List<Map<String,Object>> getData();
	
	public TestData getTestData();
	
}
