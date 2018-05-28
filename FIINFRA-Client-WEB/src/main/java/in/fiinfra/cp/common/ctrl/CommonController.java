package in.fiinfra.cp.common.ctrl;

import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.FaqsQuestionsData;
import in.fiinfra.common.common.GupShupCommentData;
import in.fiinfra.common.common.QueryData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.cp.AlertData;
import in.fiinfra.cp.BroadcastData;
import in.fiinfra.cp.CalenderData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.FinancialAccountData;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.LikeData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.common.model.CommonRequest;
import in.fiinfra.cp.common.model.ProfileRequest;
import in.fiinfra.cp.common.service.CommonService;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.cp.common.util.Link;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/common")
public class CommonController extends AbstractController {
	@Link(label="FAQs", family="FAQs", parent = "" )
	@RequestMapping(value = "/FAQs", method = RequestMethod.GET)
	public String showFAqs(BaseRequest request, Model m , HttpServletRequest servletRequest, HttpServletResponse response) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		CommonService service = getBean(CommonService.class);
		List<FaqsQuestionsData> faqs = service.getListOfFaqs(request);
		Map<Integer, List<FaqsQuestionsData>> map = new HashMap<Integer, List<FaqsQuestionsData>>();
		for (FaqsQuestionsData faq : faqs) {
			if (!map.containsKey(faq.getFaqModuleID())) {
				map.put(faq.getFaqModuleID(),
						new ArrayList<FaqsQuestionsData>());
			}
			List<FaqsQuestionsData> lst = map.get(faq.getFaqModuleID());
			lst.add(faq);
		}
		m.addAttribute("faqs", map);
		
		return "cp/FAQs";
	}
	

	@Link(label="Alerts", family="Alerts", parent = "" )
	@RequestMapping(value = "/alerts", method = RequestMethod.GET)
	public String showalerts(CommonRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());

		CommonService service = getBean(CommonService.class);
		List<AlertData> alerts = service.getAlerts(request);
		List<QueryData> queries = new ArrayList<QueryData>();
		List<Task> tasks = new ArrayList<Task>();
		for (AlertData a : alerts) {
			if (StringUtils.equals(a.getRefType(), "QUERY")) {
				QueryData q = new QueryData();
				q.setQueryOwnerName(a.getOwner());
				q.setLastUpdatedDate(CommonUtils.formatDate(a.getLastUpdate()));
				q.setSubject(a.getSubject());
				q.setQueryTypeName(a.getType());
				q.setQueryId(a.getRefId());
				queries.add(q);
			} else {
				Task t = new Task();
				t.setOwnerPartyName(a.getOwner());
				t.setDueDateTimeString(CommonUtils.formatDate(a
						.getTaskDueDate()));
				t.setSubject(a.getSubject());
				t.setStatusName(a.getType());
				tasks.add(t);
			}

		}
		/*
		 * m.addAttribute("alerts", request); QueryRequest req = new
		 * QueryRequest(); req.setQueryPanel("inbox");
		 * req.setPartyId(user.getPartyId()); List<QueryData> queries =
		 * service.getListOfQueries(req); req.setQueryPanel("sentbox");
		 * List<QueryData> sentQueries = service.getListOfQueries(request);
		 * queries.addAll(sentQueries);
		 * 
		 * request.setUsername(user.getName()); List<TaskData> tasks =
		 * service.getListOfTasks(request);
		 */
		/*
		 * m.addAttribute("queryList", queries); m.addAttribute("taskList",
		 * tasks);
		 */
		m.addAttribute("alerts", alerts);
		m.addAttribute("queryList", queries);
		m.addAttribute("taskList", tasks);
		return "cp/alerts";
	}

	/*
	 * @RequestMapping(value = "/polls", method = RequestMethod.GET) public
	 * String showpolls(BaseRequest request, Model m) { UserSession user =
	 * AuthHandler.getCurrentUser(); request.setPartyId(user.getPartyId());
	 * request.setBuId(user.getBuId()); m.addAttribute("polls", request);
	 * 
	 * return "cp/polls"; }
	 */
	@Link(label="Announcements", family="Announcements", parent = "" )
	@RequestMapping(value = "/announcement", method = RequestMethod.GET)
	public String showBroadcast(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		CommonService service = getBean(CommonService.class);
		List<BroadcastData> lst = service.getListOfBroadcast(request);
		m.addAttribute("lst", lst);
		return "cp/announcement";
	}

	/*
	 * @RequestMapping(value = "/enjoymentScale", method = RequestMethod.GET)
	 * public String showenjoymentScale(BaseRequest request, Model m) {
	 * UserSession user = AuthHandler.getCurrentUser();
	 * request.setPartyId(user.getPartyId()); request.setBuId(user.getBuId());
	 * m.addAttribute("enjoyment-scale", request);
	 * 
	 * return "cp/enjoymentScale"; }
	 */
	@RequestMapping(value = "/quickHelp", method = RequestMethod.GET)
	public String showquickHelp(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		m.addAttribute("quick-help", request);

		return "cp/quickHelp";
	}

	@RequestMapping(value = "/softAdvice", method = RequestMethod.GET)
	public String showsoftAdvice(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		m.addAttribute("soft-advice", request);

		return "cp/softAdvice";
	}

	@RequestMapping(value = "/dcTool", method = RequestMethod.GET)
	public String showdcTool(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		m.addAttribute("dcTool", request);

		return "cp/dcTool";
	}

	@Link(label="Calculator", family="Calculator", parent = "" ) 
	@RequestMapping(value = "/calculator", method = RequestMethod.GET)
	public String showcalculator(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		m.addAttribute("dcTool", request);

		return "cp/calculator";
	}
	
	@Link(label="Calendar", family="Calendar", parent = "" )
	@RequestMapping(value = "/calender", method = RequestMethod.GET)
	public String showCalender(CommonRequest request, Model m,HttpServletRequest  r) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());

		Calendar today = Calendar.getInstance();
		if(request.getDateFrom() ==null && request.getDateTo() ==null){
		if ("W".equalsIgnoreCase(request.getFilter())) {
			Calendar f = Calendar.getInstance();
			f.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			request.setDateFrom(f.getTime());
			f.add(Calendar.DAY_OF_YEAR,7);
			request.setDateTo(f.getTime());
			m.addAttribute("noDataMsg", "No calendar events for week.");
		}
		else if ("ALL".equalsIgnoreCase(request.getFilter())) {
			request.setDateFrom(null);
			request.setDateTo(null);
			m.addAttribute("noDataMsg", "No calendar events found.");
		}
		else if ("Today".equalsIgnoreCase(request.getFilter())) {
			request.setDateFrom(today.getTime());
			request.setDateTo(today.getTime());
			m.addAttribute("noDataMsg", "No calendar events for today.");
		}
		// Month's event
		else  {
			Calendar f = Calendar.getInstance();
			request.setFilter("M");

			f.set(Calendar.DAY_OF_MONTH, 1);
			request.setDateFrom(f.getTime());
			f.set(Calendar.DAY_OF_MONTH,f.getActualMaximum(Calendar.DAY_OF_MONTH));
			request.setDateTo(f.getTime());
			m.addAttribute("noDataMsg", "No calendar events for this month.");
		}
		}
		addCalendarData(m,request,r);

		
		return "cp/calender";
	}
	
//	@RequestMapping(value = "/calender.json", method = RequestMethod.GET)
	public void addCalendarData(Model m, CommonRequest q, HttpServletRequest  request) {
		
		UserSession user = AbstractController.getSessionUser();
		q.setPartyId(user.getPartyId());

		CommonService service = getBean(CommonService.class);
		
		List<CalenderData> lstCalenderEvents = service
				.getListOfCalenderEvents(q);
		
		List<CalenderData> filter = new ArrayList<CalenderData>();
		Calendar cFrom = null;
		Calendar cTo = null;
		if(q.getDateFrom() != null ){
			cFrom = Calendar.getInstance();
			cFrom.setTime(q.getDateFrom());
		}
		if(q.getDateTo() != null ){
			cTo = Calendar.getInstance();
			cTo.setTime(q.getDateTo());
		}

		ObjectMapper mapper = new ObjectMapper();
		//List<ObjectNode> nodes  = new ArrayList<ObjectNode>();
		Map<String,Integer> map = new HashMap<String,Integer>();

		for(CalenderData c:lstCalenderEvents){
			Calendar cal = Calendar.getInstance();
			cal.setTime(c.getEventDate());
			if((cFrom == null || CommonUtils.compare(cal, cFrom) >=0) && 
					(cTo == null || CommonUtils.compare(cTo,cal) >=0) 
					){
				filter.add(c);
			}
			String dt = CommonUtils.format(c.getEventDate(), "yyyy-MM-dd");
			if(map.containsKey(dt)){
                	map.put(dt, map.get(dt)+1);		
			}
			else{
				map.put(dt, 1);
			}
		}
		m.addAttribute("calender", filter);
		m.addAttribute("q", q);
		
		ObjectNode nodes = mapper.createObjectNode();
		
		for(Map.Entry<String, Integer> entry:map.entrySet()){
			
			
			
			ObjectNode node = mapper.createObjectNode();
		//node.put("number", entry.getValue());
			node.put("title", entry.getValue());
			node.put("start",entry.getKey());
			
			nodes.put(entry.getKey(), node);
			//nodes.put("title",entry.getValue());
			//nodes.add(n);
			
		}
		try {
			m.addAttribute("calendarData", mapper.writeValueAsString(nodes));
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(Date.class, new DateEditor());
	}

	public static class DateEditor extends PropertyEditorSupport {
		@Override
		public void setAsText(String text) throws IllegalArgumentException {
			if (!StringUtils.isEmpty(text)) {
				setValue(CommonUtils.convertToDate(text,"yyyy-MM-dd"));
			}
		}

		@Override
		public String getAsText() {
			Date dt = (Date) getValue();
			return CommonUtils.format(dt, "dd-MMM-yyyy");
		}

	}

	@RequestMapping(value = "/calender/csv", method = RequestMethod.GET)
	public void calenderCSV(Model m, @ModelAttribute("q") CommonRequest q,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) {

		CommonService service = getRestService(CommonService.class);
		UserSession user = AuthHandler.getCurrentUser();
		q.setPartyId(user.getPartyId());
		List<CalenderData> lstCalenderEvents = service
				.getListOfCalenderEvents(q);
		

		try {
			response.addHeader("Content-Disposition", "attachment;filename=CalendarList.csv");
			
			PrintWriter writer = response.getWriter();
			writer.print(CommonUtils.escape("SUBJECT"));
			writer.print(",");
			writer.print(CommonUtils.escape("START DATE"));
			writer.print(",");
			writer.print(CommonUtils.escape("START TIME"));
			writer.print(",");
			writer.print(CommonUtils.escape("END DATE"));
			writer.print(",");
			writer.print(CommonUtils.escape("END TIME"));
			writer.print(",");
			writer.print(CommonUtils.escape("DESCRIPTION"));
			writer.print(",");
			writer.print(CommonUtils.escape("ALL DAY EVENT"));
			writer.println();
			writer.print(CommonUtils.escape("LOCATION"));
			writer.println();
			writer.print(CommonUtils.escape("PRIORITY"));
			writer.println();
			for(CalenderData cal:lstCalenderEvents){
				writer.print(CommonUtils.escape(""+cal.getEvent()));
				writer.print(",");
				writer.print(CommonUtils.format(cal.getEventDate(),"MM/dd/yyyy"));
				writer.print(",");
				writer.print(CommonUtils.formatTime(cal.getEventDate()));
				writer.print(",");
				writer.print(CommonUtils.format(cal.getEventDate(),"MM/dd/yyyy"));
				writer.print(",");
				writer.print(CommonUtils.formatTime(cal.getEventDate()));
				writer.print(",");
				writer.print(cal.getDescription());
				writer.print(",");
				writer.print("FALSE");
				writer.print("");
				writer.print("FALSE");
				writer.println("Normal");
			}
		     
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}



	@RequestMapping(value = "/calender/xls", method = RequestMethod.GET)
	public void queryXLS(Model m, @ModelAttribute("q") BaseRequest q,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response) {

		CommonService service = getBean(CommonService.class);
		UserSession user = AbstractController.getSessionUser();
		q.setPartyId(user.getPartyId());

		List<CalenderData> lstCalenderEvents = service
				.getListOfCalenderEvents(q);
		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition",
				"attachment;filename=CalendarList.xls");

		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
		/* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		/* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Calendar Event List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow = sheet.createRow(rowNum++);
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Subject");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("StartDate");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("StartTime");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("EndDate");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("EndTime");
		}

		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Description");
		}

		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Alldayevent");
		}

		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Location");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Priority");  
		}

		

		for (CalenderData cal : lstCalenderEvents) {
			column = 0;
			excelRow = sheet.createRow(rowNum++);
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getEvent());
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.format(cal.getEventDate(),"MM/dd/yyyy"));
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.formatTime(cal.getEventDate()));
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.format(cal.getEventDate(),"MM/dd/yyyy"));
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.formatTime(cal.getEventDate()));
			}

			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getDescription());
			}

			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("FALSE");
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("");
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("Normal");
			}
		}

		try {
			workbook.write(response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/xRayTool", method = RequestMethod.GET)
	public String showxRayTool(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		m.addAttribute("calender", request);

		return "cp/xRayTool";
	}

	@RequestMapping(value = "/getCities", method = RequestMethod.GET)
	public @ResponseBody
	List<CodeValueData> getCitites(@RequestParam("parentId") String parentId,
			ProfileRequest request) {

		CommonService service = getBean(CommonService.class);

		BaseResponse<CodeValueData> br = new BaseResponse<CodeValueData>();
		List<CodeValueData> codeValueDataList = new ArrayList<CodeValueData>();
		request.setParentId(parentId);
		codeValueDataList = service.getListOfCities(request);
		Collections.sort(codeValueDataList);

		return codeValueDataList;

	}
	
	@RequestMapping(value="/codevalues", method=RequestMethod.GET)
	public @ResponseBody List<CodeValueData> getCodeValues(@RequestParam("codeTypeId") String codeType) {
		try {
			CommonService service = getBean(CommonService.class);
			
			List<CodeValueData> codeValueList = service.getCodeValueByName(codeType);
			Collections.sort(codeValueList);
			return codeValueList;
		} catch (Exception e) {
			return null;
		}		
	}	

	@Link(label="Testimonials", family="Testimonials", parent = "" )
	@RequestMapping(value = "/testimonials", method = RequestMethod.GET)
	public String showTestimonials(CommonRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		CommonService common = getBean(CommonService.class);
		// List<TestimonialData> lst = common.getListOfTestimonials(request);
		List<Integer> lst = common.getListOfTestimonialIds(request);
		if (lst.size() > 0) {
			if (request.getTestimonialId() == null){
				request.setTestimonialId(lst.get(0));	
			}
			TestimonialData firstPost = common.getTestimonialById(request);
			m.addAttribute("testimonial", firstPost);
		}

		m.addAttribute("lst", lst);

		return "common/testimonials";
	}

	@Link(label="Add Testimonial", family="Testimonials", parent = "Testimonials" )
	@RequestMapping(value = "/add/testimonial", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addTestimonial(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
//		CommonService common = getBean(CommonService.class);
//	     testimonialData = common.addTestimonial(testimonialData);
		m.addAttribute("testimonial", new TestimonialData());
		return "common/add/testimonial";
	}

	@RequestMapping(value = "/save/testimonial", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String saveTestimonial(BaseRequest request, Model m,final RedirectAttributes redirectAttributes,
			TestimonialData testimonialData) {
		UserSession user = AuthHandler.getCurrentUser();
		testimonialData.setPartyId(user.getPartyId());
		testimonialData.setCreatedById(user.getUserId());
		CommonService common = getBean(CommonService.class);
		testimonialData = common.addTestimonial(testimonialData);
		redirectAttributes.addFlashAttribute("success",getMessage("testimonial.create"));
		return "redirect:/common/testimonials";
	}

	@Link(label="Gupshup", family="Gupshup", parent = "" )
	@RequestMapping(value = "/gupshup", method = { RequestMethod.GET })
	public String showGupShup(CommonRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		CommonService common = getBean(CommonService.class);
		List<Integer> lst = common.getGupShupIds(request);
		if (lst.size() > 0) {
			if (request.getPostId() == null || request.getPostId() <= 0) {
				request.setPostId(lst.get(0));	
			}
			GupShupData firstPost = common.getGupShupById(request);
			m.addAttribute("gupshup", firstPost);
		}
		m.addAttribute("lst", lst);

		return "common/gupshup";
	}

	@RequestMapping(value = "/gupshupById", method = { RequestMethod.GET })
	public String getGupShupByGupShupId(CommonRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		CommonService service = getBean(CommonService.class);
		GupShupData gupshup = service.getGupShupById(request);
		m.addAttribute("gupshup", gupshup);

		return "widget/gupsup_ajax";
	}

	@RequestMapping(value = "/testimonialById", method = { RequestMethod.GET })
	public String getTestimonialByTestimonialId(CommonRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		CommonService service = getBean(CommonService.class);
		TestimonialData testimonial = service.getTestimonialById(request);
		m.addAttribute("testimonial", testimonial);
		return "widget/testimonial_ajax";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String createComment(Model m, GupShupCommentData commentData,
			HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		UserSession user = AuthHandler.getCurrentUser();
		commentData.setPartyId(user.getPartyId());
		commentData.setStatusRefId(137001);
		commentData.setUserId(user.getUserId());
		CommonService service = getBean(CommonService.class);
		commentData = service.saveGupShupComment(commentData);
		redirectAttributes.addFlashAttribute("success",
				getMessage("success.comment.save"));
		return "redirect:/common/gupshup?postId=" + commentData.getPostId();
	}

	@RequestMapping(value = "/liked", method = { RequestMethod.GET })
	public @ResponseBody Integer saveLike(Model m, LikeData likeData, GupShupData gupShupData,CommonRequest req) {
		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		req.setBuId(user.getBuId());
		likeData.setLikeRefId(req.getPostId());
		likeData.setLikeRefTypeId(1);
		likeData.setPartyId(user.getPartyId());
		likeData.setUserId(user.getUserId());
		CommonService service = getBean(CommonService.class);
		likeData = service.addLike(likeData);
		GupShupData g= service.getGupShupById(req);
		return g.getLikeCount();
		//return "redirect:/common/gupshup?postId=" + likeData.getLikeRefId();
	}

	@RequestMapping(value = "/codevaluesforparentid", method = { RequestMethod.GET })
	public @ResponseBody List<CodeValueData> getCodevaluesforparentid(Model m, CommonRequest req) {
		if(req.getParentId() ==null || req.getParentId() <=0){
		  return new ArrayList<CodeValueData>();	
		}
		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		CommonService service = getBean(CommonService.class);
		List<CodeValueData> lst = service.getCodeValuesForParentId(req);
		Collections.sort(lst);
		return lst;
	}

	@RequestMapping(value = "/product.json", method = { RequestMethod.GET })
	public @ResponseBody List<KeyValue> getProducts(Model m, CommonRequest req) {
		UserSession user = AuthHandler.getCurrentUser();
		req.setPartyId(user.getPartyId());
		CommonService service = getBean(CommonService.class);
		List<KeyValue> lst = service.getProducts(req);
		Collections.sort(lst);
		return lst;
	}
	
	@RequestMapping(value = "/accounts.json", method = { RequestMethod.GET })
	public @ResponseBody List<KeyValue> getAccounts(Model m, CommonRequest req) {
		UserSession user = AuthHandler.getCurrentUser();
		if(req.getPartyId()==null){
		req.setPartyId(user.getPartyId());
		}
		//req.setPartyId(user.getPartyId());
		CommonService service = getBean(CommonService.class);
		List<FinancialAccountData> lstAccounts = service.getAccounts(req);
		List<KeyValue> lst=new ArrayList<KeyValue>();
		
		for(FinancialAccountData f:lstAccounts){
		KeyValue c=new KeyValue();
		c.setName(f.getAccountNumber()+" - "+f.getBankName());
		c.setId(f.getPartyFinancialAccountID());
		lst.add(c);
		
		}
		return lst;
	}

}
