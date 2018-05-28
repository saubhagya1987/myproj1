package in.fiinfra.admin.dao;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import in.fiinfra.common.admin.FirstCustomObject;
import in.fiinfra.common.admin.SecondCustomObject;
import in.fiinfra.common.admin.TestData;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.util.DataSourceProvider;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;

public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Map<String, Object>> getData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TestData getTestData() {
		// TODO Auto-generated method stub
		return null;
	}
/*
	@Override
	public List<Map<String, Object>> getData() {
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();

		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				DataSourceProvider.getDataSource(null));

		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_test_insert");
		SqlParameter fNameParam = new SqlParameter("fName", Types.VARCHAR);
		SqlParameter lNameParam = new SqlParameter("lName", Types.VARCHAR);
		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { fNameParam, lNameParam, msgParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("lName", "Chaudhari");
		paranValues.put("fName", "Jidnyasa");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		System.out.println("storedProcResult:---" + storedProcResult);
		// System.out.println("storedProcResult:---"+storedProcResult.get("#result-set-1"));
		// l=(List<Map<String,Object>>) storedProcResult.get("#result-set-1");
		// for(Map<String,Object> m:l){
		// System.out.println("m is:---"+m);
		// System.out.println("m.faqid:---"+m.get("FAQID"));
		// }
		return l;
	}

	@Override
	public TestData getTestData() {
		
		TestData testData = new TestData();
		
		testData.setFirstName("Abhishek");
		testData.setLastName("Bacchan");
		testData.setDob(new Date());
		testData.setSalary(6000000.0);
		
		FirstCustomObject firstCustomObject = new FirstCustomObject();
		
		firstCustomObject.setAddress("Jalasa");
		firstCustomObject.setCity("Mumbai");
		testData.setFirstCustomObject(firstCustomObject);
		
		SecondCustomObject secondCustomObject = new SecondCustomObject();
		secondCustomObject.setSpouseName("Aishwarya");
		secondCustomObject.setChildName1("Aaradhya");
		
		List<SecondCustomObject> list = new ArrayList<SecondCustomObject>();
		list.add(secondCustomObject);
		
		testData.setList(list);
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		System.out.println("DS:---"+DataSourceProvider.getDataSource(null));
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				DataSourceProvider.getDataSource(null));

		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_test_getFaqs");
		SqlParameter fNameParam = new SqlParameter("fName", Types.VARCHAR);
		SqlParameter lNameParam = new SqlParameter("lName", Types.VARCHAR);
		SqlOutParameter msgParam = new SqlOutParameter("msg", Types.VARCHAR);
		SqlParameter[] paramArray = { fNameParam, lNameParam, msgParam };
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("lName", "Chaudhari");
		paranValues.put("fName", "Jidnyasa");
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		System.out.println("storedProcResult:---" + storedProcResult);
		List<Map<String,Object>> l1=(List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		Map<String, Object> firstRow=l1.get(0);
		System.out.println("firstRow.get(codevalue):---" +firstRow.get(0));
		
		return testData;
	}
*/
	
}
