package in.fiinfra.admin.service;

import java.util.List;
import java.util.Map;

import in.fiinfra.admin.dao.AdminDao;
import in.fiinfra.common.admin.TestData;

public class AdminServiceImpl implements AdminService {

	private AdminDao adminDao;
	
	@Override
	public List<Map<String, Object>> getData() {
		return adminDao.getData();
	}

	@Override
	public TestData getTestData() {
		return adminDao.getTestData();
	}
	

	
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

}
