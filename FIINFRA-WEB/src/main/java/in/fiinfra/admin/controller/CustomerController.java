package in.fiinfra.admin.controller;

import in.fiinfra.common.admin.TestData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraUtility;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class CustomerController extends MultiActionController {

	private RestTemplate restTemplate;

	private int partyId;

	@SuppressWarnings("unchecked")
	public ModelAndView welcome(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
//			System.out.println("in welcome:---" + partyId);
//			System.out.println("in welcome:---"
//					+ request.getParameter("partyId"));
//			List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
//			urlParameters.add(new BasicNameValuePair("partyId", "25"));
//			String result = FiinfraUtility.postRequest("customer/welcome.htm",
//					urlParameters);
//			System.out.println("result:---" + result);
//			ObjectMapper mapper = new ObjectMapper();
//			Map<String, Object> resultMap = mapper.readValue(result, Map.class);
//			System.out.println("resultMap is:--" + resultMap);
//			List<Object> lst = (List<Object>) resultMap.get("list");
//			System.out.println("list is:--" + lst);
//			Map<String, Object> map = (Map<String, Object>) lst.get(0);
//			for (Map.Entry<String, Object> e : map.entrySet()) {
//				String attribName = (String) e.getKey();
//				Object attribValue = e.getValue();
//				System.out.println("Key is:----" + attribName);
//				System.out.println("Key is:----" + attribValue);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("HelloWorldPage", "msg", "add() method");

	}

	public ModelAndView testData(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String url = FiinfraUtility.getRestDBURL();
		System.out.println("URL --> " + url);
		url = url + "customer/testData.htm";
		TestData testData = null;
		testData = restTemplate.getForObject(url, TestData.class);
		System.out.println("response.getStatus() " + ((BaseResponse<DocumentData>) response).getStatus());
		System.out.println("testData --> " + testData);
		System.out.println("testData " + testData.getFirstName() + " "
				+ testData.getLastName());
		System.out.println("testData " + testData.getDob());
		System.out.println("testData "
				+ testData.getFirstCustomObject().getAddress());
		System.out.println("testData " + testData.getSalary());
		System.out.println("testData "
				+ testData.getList().get(0).getChildName1());
		System.out.println("testData "
				+ testData.getList().get(0).getSpouseName());
		return new ModelAndView("HelloWorldPage", "msg", "testData() method");
	}

	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Runtime Exception")
	@ExceptionHandler(RuntimeException.class)
	public void exceptionHandling() {
		System.out.println("I am in exceptionHandling of WEB");
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

		return new ModelAndView("HelloWorldPage", "msg", "list() method");

	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
}