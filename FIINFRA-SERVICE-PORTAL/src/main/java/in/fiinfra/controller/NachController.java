package in.fiinfra.controller;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.common.NachRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.pg.AutoPaymentData;
import in.fiinfra.pg.NachData;
import in.fiinfra.pg.SubxProductData;
import in.fiinfra.service.NachService;
import in.fiinfra.service.SubxRequest;
import in.fiinfra.service.SubxService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
@RequestMapping("/nach")
public class NachController extends MultiActionController {

	@Autowired
	private NachService service;
	@Autowired
	private SubxService subxService;
	@RequestMapping(value = "/list", method = { RequestMethod.GET })
	public ModelAndView nachList(HttpServletRequest request, Model m,
			HttpServletResponse response, NachRequest req) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
         
		req.setUserId(userSession.getUserId());
		req.setBuId(userSession.getBuId());
		ModelAndView mav = new ModelAndView("partner/nachList");
		List<NachData> nach = service.getNachList(req);
		mav.addObject("req", req);
		mav.addObject("statusLst",
				service.getCodeValue(userSession.getBuId(), "155"));
		/*mav.addObject("frequencyLst",
				service.getCodeValue(userSession.getBuId(), "63"));
		mav.addObject("accountType",
				service.getCodeValue(userSession.getBuId(), "68"));*/
		mav.addObject("nachData", nach);
		String format = request.getParameter("format");

		if ("xls".equalsIgnoreCase(format)) {
			xlsRegistrationExport(request, response, nach);
			return null;
		}

		return mav;
	}

	private void xlsRegistrationExport(HttpServletRequest request,
			HttpServletResponse response, List<NachData> details) {

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition",
				"attachment;filename=NachList.xls");
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
		/* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		/* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("NACH List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow = sheet.createRow(rowNum++);
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("S.no");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Ffreedom Unique Id");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Investor Name");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Upper Limit Amount");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Bank Account Number");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Bank Account Holder's Name (as In Bank records)");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("MICR");
		}

		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("IFSC Code");
		}

		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Bank Account Type");
		}

		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Start Date  ( DDMMYYYY)");
		}
		{
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("End Date  ( DDMMYYYY)");
		}
		int i = 1;
		for (NachData cal : details) {
			column = 0;
			excelRow = sheet.createRow(rowNum++);
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(i++);
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getPartyID());
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getPartyName());
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getLimitAmount());
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getAccountNumber());
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getPartyName());
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getMicr());
			}

			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getIfsc());
			}

			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getAccountType());
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.format(cal.getStartDate(),
						"ddMMyyyy"));
			}
			{
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.format(cal.getEndDate(),
						"ddMMyyyy"));
			}
		}

		try {
			workbook.write(response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void xlsAutoPaymentExport(HttpServletRequest request,
			HttpServletResponse response, List<AutoPaymentData> details) {

		response.addHeader("Content-type", "application/vnd.ms-excel");
		response.addHeader("Content-Disposition",
				"attachment;filename=AutoPayment.xls");
		HSSFWorkbook workbook = new HSSFWorkbook();
		CellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
		/* set the weight of the font */
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		/* attach the font to the style created earlier */
		style.setFont(font);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

		HSSFSheet sheet = workbook.createSheet("Auto Payment List");
		int rowNum = 0;
		int column = 0;
		HSSFRow excelRow = sheet.createRow(rowNum++);
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Sr. No");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Ffreedom Unique ID");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Investor Name");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Bank Account Holder's Name (as In Bank records)");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Bank Account Number");
		}
		
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Due date");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Frequency");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Product Name");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Order Date");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Amount");
		}
		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("UMRN");
		}

		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("MICR");
		}

		{
			sheet.autoSizeColumn(column);
			HSSFCell cell = excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("IFSC Code");
		}

		
		int i = 1;
		for (AutoPaymentData cal : details) {
			column = 0;
			excelRow = sheet.createRow(rowNum++);
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(i++);
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getPartyId());
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getInvestorName());
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getPartnerName());
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getAccountNumber());
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.emptyIfNull(CommonUtils.format(cal.getDueDate(), "dd-MMM-yyyy")));
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getFrequency());
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(cal.getProductName());
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.emptyIfNull(CommonUtils.format(cal.getOrderDate(), "dd-MMM-yyyy")));
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue("NA");
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.emptyIfNull(cal.getUmrn()));
			}
			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.emptyIfNull(cal.getMicr()));
			}

			{
				sheet.autoSizeColumn(column);
				HSSFCell cell = excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(CommonUtils.emptyIfNull(cal.getIfsc()));
			}

			
			
		}

		try {
			workbook.write(response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveNachRegistrationForm(HttpServletRequest request,
			NachData nach, Model m, BindingResult bindingResult,
			HttpServletResponse response) {

		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		nach.setUserId(userSession.getUserId());
		if (!bindingResult.hasErrors()) {

			try {

				if (nach != null && !nach.getNachForm().isEmpty()) {
					int success = service.saveNachDocument(userSession, nach);
				}
				Integer nachId = service.saveNach(nach);

				/*
				 * if (success <= 0) {
				 * 
				 * m.addAttribute("error", "Error while Saving Document");
				 * return "nach/list"; }
				 */
			} catch (Exception e) {
				bindingResult.addError(new FieldError("document", "files", e
						.getMessage()));
				m.addAttribute("error", e.getMessage());
				// return "nach/list";
			}
		}
		return "redirect:/nach/list";

	}

	@RequestMapping(value = "/getCurrentNach", method = { RequestMethod.GET })
	public @ResponseBody
	ObjectNode getCurrentNach(HttpServletRequest request, NachRequest req,
			HttpServletResponse response, NachData nach) throws IOException {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
		DocumentRequest req1 = new DocumentRequest();
	
		req1.setBuId(userSession .getBuId());
		req1.setPartyId(userSession .getPartyId());
		
		req.setUserId(userSession.getUserId());
		req.setBuId(userSession.getBuId());
		
		ObjectMapper mapper = new ObjectMapper();
		NachData n = service.getCurrentNach(req);
		req1.setDocumentId(n.getNachFormId());
		req1.setCurrentPartyId(userSession.getBuId());
		ObjectNode map = mapper.createObjectNode();
		if(n.getNachFormId()!=null){
		DocumentData doc = service.getDocument(req1);
		if(doc!=null){
			addValue(mapper, map, "docName", doc.getFileName());
		}
		}
		
		
		if (n != null) {
			addValue(mapper, map, "nachId", n.getNachId());
			addValue(mapper, map, "partyName", n.getPartyName());
			addValue(mapper, map, "startDate",
					CommonUtils.formatDate(n.getStartDate()));
			addValue(mapper, map, "endDate",
					CommonUtils.formatDate(n.getEndDate()));
			addValue(mapper, map, "registrationDate",
					CommonUtils.formatDate(n.getRegistrationDate()));
			addValue(mapper, map, "limitAmount", n.getLimitAmount().intValue());
			addValue(mapper, map, "bankName",
					CommonUtils.emptyIfNull(n.getBankName()));
			addValue(mapper, map, "accountId", n.getAccountId());
			addValue(mapper, map, "ifsc", CommonUtils.emptyIfNull(n.getIfsc()));
			addValue(mapper, map, "micr", CommonUtils.emptyIfNull(n.getMicr()));
			addValue(mapper, map, "remark",
					CommonUtils.emptyIfNull(CommonUtils.emptyIfNull(n.getRemark())));
			addValue(mapper, map, "errorDetail",
					CommonUtils.emptyIfNull(n.getErrorDetail()));
			addValue(mapper, map, "email",
					CommonUtils.emptyIfNull(n.getEmail()));
			addValue(mapper, map, "phoneNo",
					CommonUtils.emptyIfNull(CommonUtils.emptyIfNull(n.getPhoneNo())));
			addValue(mapper, map, "accountNumber",
					CommonUtils.emptyIfNull(n.getAccountNumber()));
			addValue(mapper, map, "frequencyId", n.getFrequencyId());
			addValue(mapper, map, "partyId", n.getPartyID());
			addValue(mapper, map, "statusId", n.getStatusId());
			addValue(mapper, map, "umrn", n.getUmrn());
			addValue(mapper, map, "ref1", n.getReferece1());
			addValue(mapper, map, "ref2", n.getRefernce2());
			addValue(mapper, map, "nachStatus", n.getNachStatusCode());
			addValue(mapper, map, "nachFormId", n.getNachFormId());
		}
		ArrayNode freq = mapper.createArrayNode();
		   for (CodeValueData c : service.getCodeValue(userSession.getBuId(), "63")) {
			   if (c.getCodeValueId() == 63003 || c.getCodeValueId() == 63005
					      || c.getCodeValueId() == 63006) {
		     ObjectNode node = mapper.createObjectNode();
		     addValue(mapper, node, "id", c.getCodeValueId());
		     addValue(mapper, node, "value", c.getCodeValue());
		     freq.add(node);
			   }
		   }
		   ArrayNode status = mapper.createArrayNode();
		   for (CodeValueData c : service.getCodeValue(userSession.getBuId(), "155")) {
			   
			     ObjectNode node = mapper.createObjectNode();
			     addValue(mapper, node, "id", c.getCodeValueId());
			     addValue(mapper, node, "value", c.getCodeValue());
			     status.add(node);
			   
			   }
		   ArrayNode accountType = mapper.createArrayNode();
		   for (CodeValueData c : service.getCodeValue(userSession.getBuId(), "68")) {
			    ObjectNode node = mapper.createObjectNode();
			     addValue(mapper, node, "id", c.getCodeValueId());
			     addValue(mapper, node, "value", c.getCodeValue());
			     accountType.add(node);
			   }
		   addValue(mapper, map, "accountType", accountType);
		   addValue(mapper, map, "status", status);
		   addValue(mapper, map, "freq", freq);
		   
		return map;
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			ArrayNode arrayNode) {
		map.put(key, arrayNode);
		
	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			String value) {
		map.put(key, value);

	}

	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			Integer value) {
		map.put(key, value);

	}
	@RequestMapping(value = "/files/{id}", method = RequestMethod.GET)
	@ResponseBody
	public void downloadFile(@PathVariable("id") Integer docId, HttpServletRequest request, HttpServletResponse response) {

		DocumentRequest req = new DocumentRequest();
		UserSession user = (UserSession) request.getSession()
				.getAttribute("userSession");
		req.setBuId(user.getBuId());
		req.setPartyId(user.getPartyId());
		req.setDocumentId(docId);
		DocumentData doc = service.getDocument(req);
		

		try {
			File f = new File(doc.getFileStoragePathURI());
			if(f.exists()){
				String fileType = doc.getFileName().substring(doc.getFileName().lastIndexOf(".")+1);
		response.setContentType(getContentType(fileType));
				response.setHeader("Content-Disposition", "inline; filename=\"" + doc.getFileName() + "\"");
				FileCopyUtils.copy(new FileInputStream(doc.getFileStoragePathURI()), response.getOutputStream());
			response.flushBuffer();
			}
			else{
				PrintWriter writer;
				try {
					writer = response.getWriter();
				} catch (IOException e1) {
					try {
						response.sendRedirect("/document/view");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					};
					return ;
				}
				writer.write("<div id='errorMsg'>Error downloading File. File Not Found. </div>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

       // response.setHeader("Content-Disposition", "attachment; filename="+doc.getFileName());

		// return new FileSystemResource(doc.getFileStoragePathURI());
	}
	public static String getContentType(String fileType) {
		if ("pdf".equalsIgnoreCase(fileType)) {
			return "application/pdf";
		}
		if ("doc".equalsIgnoreCase(fileType)
				|| "docx".equalsIgnoreCase(fileType)) {
			return "application/msword";
		}
		if ("xls".equalsIgnoreCase(fileType)) {
			return "application/vnd.ms-excel";
		}
		if (FiinfraUtility.isImageType(fileType)) {
			return "application/image";
		}

		return "application/octet-stream";

	}
	@RequestMapping(value = "/autoPayment", method = { RequestMethod.GET })
	public ModelAndView autoPayment(HttpServletRequest request, Model m,
			HttpServletResponse response, NachRequest req) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
         SubxRequest sreq=new SubxRequest();
         sreq.setBuId(userSession.getBuId());
 		sreq.setPartyId(userSession.getPartyId());
		req.setUserId(userSession.getUserId());
		req.setBuId(userSession.getBuId());
		int due=CommonUtils.toInt(request.getParameter("dueInNext"));
		
		ModelAndView mav = new ModelAndView("partner/AutoPaymentList");
        List<AutoPaymentData> autoPayment = new ArrayList<AutoPaymentData>();
        List<AutoPaymentData> autoPayment1 = service.getAutoPaymentList(req);
      
        for(AutoPaymentData a:autoPayment1){
        	a.setProductName(a.getProductName()+"("+a.getFrequency()+")");
        	autoPayment.add(a);
        	
        }
        List<SubxProductData> product=(List<SubxProductData>)subxService.getSubxProducts(sreq);
        
        
        
        List<KeyValue> subxProducts = new ArrayList<KeyValue>();
        Set<Integer> pIds = new HashSet<Integer>();
        for (SubxProductData s : product) {
         if (pIds.add(s.getProductID())) {
          KeyValue k = new KeyValue();
          k.setId(s.getProductID());
          k.setName(s.getProductName());
          subxProducts.add(k);
         }
        }
        mav.addObject("req",req);
        mav.addObject("autoPayment", autoPayment);
        List<CodeValueData> frq= new ArrayList();
        for (CodeValueData c : service.getCodeValue(userSession.getBuId(), "63")) {
			   if (c.getCodeValueId() == 63003 || c.getCodeValueId() == 63005
					      || c.getCodeValueId() == 63006) {
				frq.add(c);  
			   }
			   }
        mav.addObject("frequencyLst",
				frq);
        mav.addObject("productList", subxProducts);
        String format = request.getParameter("format");

		if ("xls".equalsIgnoreCase(format)) {
			xlsAutoPaymentExport(request, response, autoPayment);
			return null;
		}
		return mav;
	}
	
	@RequestMapping(value = "/sendToBillDesk", method = { RequestMethod.GET })
	public ModelAndView sendToBillDesk(HttpServletRequest request, Model m,
			HttpServletResponse response, NachRequest req) {
		UserSession userSession = (UserSession) request.getSession()
				.getAttribute("userSession");
         
		req.setUserId(userSession.getUserId());
		req.setBuId(userSession.getBuId());
		ModelAndView mav = new ModelAndView("partner/AutoPaymentList");
        Boolean success = service.sendAutoPayment(req);
        mav.addObject("autoPayment", success);
        return mav;
	}
}
