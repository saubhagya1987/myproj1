package in.fiinfra.admin.facade;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import in.fiinfra.admin.service.AdminService;
import in.fiinfra.common.admin.TestData;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class CustomerController{ //extends MultiActionController {

	private AdminService adminService;
	private ObjectMapper objectMapper;
	
	/*public void welcome(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<Map<String, Object>> l = adminService.getData();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", l);

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		objectMapper.writeValue(out, map);
	}

	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR, reason="Runtime Exception")
	 @ExceptionHandler(RuntimeException.class)
	 public void exceptionHandling() {
		 System.out.println("I am in exceptionHandling");
	 }
	public void testData(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//TestData testData = adminService.getTestData();

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		
		//System.out.println("At Server DATE " + testData.getDob());
		
		//objectMapper.writeValue(out, testData);
	}

	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("HelloWorldPage", "msg", "delete() method");

	}

	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return new ModelAndView("HelloWorldPage", "msg", "update() method");

	}

	public ModelAndView list(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		testData(request, response);
		
		return new ModelAndView("HelloWorldPage", "msg", "list() method");

	}*/

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
}