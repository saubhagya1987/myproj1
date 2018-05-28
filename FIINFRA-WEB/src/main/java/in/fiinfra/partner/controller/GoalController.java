package in.fiinfra.partner.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.AssetAllocationOfGoal;
import in.fiinfra.common.partner.GoalDetail;
import in.fiinfra.common.partner.GoalListData;
import in.fiinfra.common.partner.GoalSummeryData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.utility.CurrentFinancialStatusData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.cp.CommonUtils;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.GOLD;
import org.apache.poi.ss.usermodel.CellStyle;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class GoalController extends MultiActionController implements ServletConfigAware{
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	final String SOURCE_MODEULE = "Goals";
	private ServletConfig config;
	@Value("${URL_GET_GOAL_SUMMARY}")
	private String URL_GET_GOAL_SUMMARY;
	@Value("${URL_GET_GOAL_LIST}")
	private String URL_GET_GOAL_LIST;
	@Value("${URL_GET_GOAL_DETAIL}")
	private String URL_GET_GOAL_DETAIL;
	@Value("${URL_GET_Asset_Allocation_Goal}")
	private String URL_GET_Asset_Allocation_Goal;
	
	
	
	
	
	
	 String url;
	 public void getGoalSummaryDetails(HttpServletRequest request,
				HttpServletResponse response,CurrentFinancialStatusData currentFinancialStatusData) throws Exception {
		 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
			int partyId = userSession.getPartyId();
			int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
			
			url = URL_GET_GOAL_SUMMARY+userSession.getName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId",partyId);
			uriCB.queryParam("buId",buId);
			uriCB.queryParam("nodeId",nodeId);
			
		
			
			BaseResponse<GoalSummeryData> br = new BaseResponse<GoalSummeryData>();
			br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<GoalSummeryData> goalSummeryDatas  =new ArrayList<GoalSummeryData>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				goalSummeryDatas=br.getResponseListObject();
			logger.info("goalSummeryDatas========"+goalSummeryDatas);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, goalSummeryDatas);
		 
	 }
	 
	/// incomplete method done in once api is done
	 public void getGoalDetails(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
		 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
			int partyId = userSession.getPartyId();
			String type = request.getParameter("type");
			String goalid = request.getParameter("goalid");
             
			url = URL_GET_GOAL_DETAIL+userSession.getName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId",goalid);
			uriCB.queryParam("buId",buId);
			uriCB.queryParam("type",type);
			
			BaseResponse<GoalDetail> br = new BaseResponse<GoalDetail>();
			br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<GoalDetail> goalSummeryDatas  =new ArrayList<GoalDetail>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				goalSummeryDatas=br.getResponseListObject();
			logger.info("goalSummeryDatas========"+goalSummeryDatas);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, goalSummeryDatas);	
			
	 }
	 
	 
	 public ModelAndView getAssetAllocationForGoal(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
		 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
			int partyId = userSession.getPartyId();
			String type = request.getParameter("type");
			String goalid = request.getParameter("goalId"); 
          
			url = URL_GET_Asset_Allocation_Goal+userSession.getName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId",goalid);
			uriCB.queryParam("buId",buId);
			uriCB.queryParam("type",type);
			
			BaseResponse<AssetAllocationOfGoal> br = new BaseResponse<AssetAllocationOfGoal>();
			br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<AssetAllocationOfGoal> goalAssetAllocationList  =new ArrayList<AssetAllocationOfGoal>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				goalAssetAllocationList=br.getResponseListObject();
			logger.info("goalAssetAllocationList========"+goalAssetAllocationList);
			ModelAndView mav = new ModelAndView("partner/goaldetail");
			mav.addObject("goalAssetAllocationList", objectMapper.writeValueAsString(goalAssetAllocationList));
			return mav;
	 }
	 
	 public ModelAndView getGoalList(HttpServletRequest request,
				HttpServletResponse response,CurrentFinancialStatusData currentFinancialStatusData) throws Exception {
		 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
//			int partyId = userSession.getPartyId();
			int partyId= Integer.parseInt(request.getSession().getAttribute("partyId").toString());
			int nodeId= Integer.parseInt(request.getSession().getAttribute("nodeId").toString());
			String condition = request.getParameter("condition");
			String parameterValue = request.getParameter("parameterValue");
			String firstElement = "";
			String lastElement = "";
			if(condition.equals("GoalByAmount"))
			{
				firstElement = request.getParameter("firstElement");
				lastElement = request.getParameter("lastElement");
			}
			url = URL_GET_GOAL_LIST+userSession.getName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId",partyId);
			uriCB.queryParam("buId",buId);
			uriCB.queryParam("condition",condition);
			uriCB.queryParam("parameterValue",parameterValue);
			uriCB.queryParam("firstElement",firstElement);
			uriCB.queryParam("lastElement",lastElement);
			uriCB.queryParam("nodeId", nodeId);
			
			BaseResponse<GoalListData> br = new BaseResponse<GoalListData>();
			br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<GoalListData> goalDataList  =new ArrayList<GoalListData>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				goalDataList=br.getResponseListObject();
			ModelAndView mav = new ModelAndView("partner/goalList");
			mav.addObject("goalDataList", objectMapper.writeValueAsString(goalDataList));
			return mav;// 
	 }
	 
	 public void getGoalListXLS(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			int buId=userSession.getBuId();
			int partyId = userSession.getPartyId();
			String condition = request.getParameter("condition");
			String parameterValue = request.getParameter("parameterValue");
			String firstElement = "";
			String lastElement = "";
			if(condition.equals("GoalByAmount"))
			{
				firstElement = request.getParameter("firstElement");
				lastElement = request.getParameter("lastElement");
			}
			url = URL_GET_GOAL_LIST+userSession.getName()+"/1234";
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyId",partyId);
			uriCB.queryParam("buId",buId);
			uriCB.queryParam("condition",condition);
			uriCB.queryParam("parameterValue",parameterValue);
			uriCB.queryParam("firstElement",firstElement);
			uriCB.queryParam("lastElement",lastElement);
			BaseResponse<GoalListData> br = new BaseResponse<GoalListData>();
			br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			List<GoalListData> goalDataList  =new ArrayList<GoalListData>();
			List<GoalListData> goalDataList1  =new ArrayList<GoalListData>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				goalDataList=br.getResponseListObject();
					for(int i = 0; i<goalDataList.size(); i++){
						//get the actual party object from its LinkedHashMap representation
						GoalListData goalListData;
						goalListData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataList.get(i)), GoalListData.class);
						goalDataList1.add(goalListData);
					}

			response.addHeader("Content-type", "application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment;filename=GoalList.xls");
			
			HSSFWorkbook workbook = new HSSFWorkbook();
			CellStyle style = workbook.createCellStyle();
			HSSFFont font=workbook.createFont();
	        /* set the weight of the font */
			font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        /* attach the font to the style created earlier */
			style.setFont(font);
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);

			HSSFSheet sheet = workbook.createSheet("Goal List");
			int rowNum = 0;
			int column = 0;
			HSSFRow excelRow =  sheet.createRow(rowNum++);
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Contact Name");
			}
			/*{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Goal Type");
			}*/
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Goal Name");
			}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Goal Year");
			}

			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Current Cost");
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Future Cost");
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Allocated Asset Value");
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Status");
		}
			{	HSSFCell cell =  excelRow.createCell(column++);
			cell.setCellStyle(style);
			cell.setCellValue("Achievement Scale (%)");
		}


			for(GoalListData goalListData:goalDataList1){
				column = 0;
				excelRow =  sheet.createRow(rowNum++);
				{	HSSFCell cell =  excelRow.createCell(column++);
					cell.setCellStyle(style);
					cell.setCellValue(goalListData.getContactName());
				}
				/*{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getGoalType());
			    }*/
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getGoalName());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getGoalEndYear());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getCurrentCost());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getFutureCost());
			}
				
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getInvestmentAmount());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getGoalStatus());
			}
				{	HSSFCell cell =  excelRow.createCell(column++);
				cell.setCellStyle(style);
				cell.setCellValue(goalListData.getAchievementScale());
			}
			}
			workbook.write(response.getOutputStream());
		}
		
		public void getGoalListCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {
			 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
				int buId=userSession.getBuId();
				int partyId = userSession.getPartyId();
				String condition = request.getParameter("condition");
				String parameterValue = request.getParameter("parameterValue");
				String firstElement = "";
				String lastElement = "";
				if(condition.equals("GoalByAmount"))
				{
					firstElement = request.getParameter("firstElement");
					lastElement = request.getParameter("lastElement");
				}
				url = URL_GET_GOAL_LIST+userSession.getName()+"/1234";
				UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
				uriCB.queryParam("partyId",partyId);
				uriCB.queryParam("buId",buId);
				uriCB.queryParam("condition",condition);
				uriCB.queryParam("parameterValue",parameterValue);
				uriCB.queryParam("firstElement",firstElement);
				uriCB.queryParam("lastElement",lastElement);
				BaseResponse<GoalListData> br = new BaseResponse<GoalListData>();
				br= restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
				List<GoalListData> goalDataList  =new ArrayList<GoalListData>();
				List<GoalListData> goalDataList1  =new ArrayList<GoalListData>();
				if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
					goalDataList=br.getResponseListObject();
						for(int i = 0; i<goalDataList.size(); i++){
							//get the actual party object from its LinkedHashMap representation
							GoalListData goalListData;
							goalListData = objectMapper.readValue(objectMapper.writeValueAsString(goalDataList.get(i)), GoalListData.class);
							goalDataList1.add(goalListData);
						}
				response.addHeader("Content-Disposition", "attachment;filename=GoalList.csv");
				PrintWriter writer = response.getWriter();
				writer.print(CommonUtils.escape("Contact Name"));
				writer.print(",");
				/*writer.print(CommonUtils.escape("Goal Type"));
				writer.print(",");*/
				writer.print(CommonUtils.escape("Goal Name"));
				writer.print(",");
				writer.print(CommonUtils.escape("Goal Year"));
				writer.print(",");
				writer.print(CommonUtils.escape("Current Cost"));
				writer.print(",");
				writer.print(CommonUtils.escape("Future Cost"));
				writer.print(",");
				writer.print(CommonUtils.escape("Allocated Asset Value"));
				writer.print(",");
				writer.print(CommonUtils.escape("Status"));
				writer.print(",");
				writer.print(CommonUtils.escape("Achievement Scale (%)"));
				writer.println();
				for(GoalListData goalListData:goalDataList1){
					writer.print(CommonUtils.escape(goalListData.getContactName()));
					writer.print(",");
					/*writer.print(CommonUtils.escape(goalListData.getGoalType()));
					writer.print(",");*/
					writer.print(CommonUtils.escape(goalListData.getGoalName()));
					writer.print(",");
					writer.print(CommonUtils.escape(goalListData.getGoalEndYear()));
					writer.print(",");
					writer.print(CommonUtils.escape(goalListData.getCurrentCost()));
					writer.print(",");
					writer.print(CommonUtils.escape(goalListData.getFutureCost()));
					writer.print(",");
					writer.print(CommonUtils.escape(goalListData.getInvestmentAmount()));
					writer.print(",");
					writer.print(CommonUtils.escape(goalListData.getGoalStatus()));
					writer.print(",");
					writer.print(CommonUtils.escape(goalListData.getAchievementScale()));
					writer.println();
				}
		}
	 public RestTemplate getRestTemplate() {
			return restTemplate;
		}
		public void setRestTemplate(RestTemplate restTemplate) {
			this.restTemplate = restTemplate;
		}
		public ObjectMapper getObjectMapper() {
			return objectMapper;
		}
		public void setObjectMapper(ObjectMapper objectMapper) {
			this.objectMapper = objectMapper;
		}
		public ServletConfig getConfig() {
			return config;
		}
		public void setConfig(ServletConfig config) {
			this.config = config;
		}
		 public void setServletConfig(ServletConfig servletConfig) {
		        this.config = servletConfig;
		}
}
