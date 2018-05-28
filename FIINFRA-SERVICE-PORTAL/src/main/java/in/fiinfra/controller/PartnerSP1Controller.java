package in.fiinfra.controller;

import in.fiinfra.common.common.AddressData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.NotesData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.opportunity.OpportunityProfileData;
import in.fiinfra.common.service.vo.BulkUploadOpportunityData;
import in.fiinfra.common.service.vo.OpportunityData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.web.CustomJacksonObjectMapper;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.common.util.Logger;



















import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.util.UriComponentsBuilder;

public class PartnerSP1Controller extends MultiActionController {
	private RestTemplate restTemplate;
	private ObjectMapper objectMapper;
	
	public ObjectMapper getObjectMapper() 
	{
		logger.info(objectMapper);
		return objectMapper;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}
	public RestTemplate getRestTemplate() {
		return restTemplate;
	}
	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}
	
	@Value("${URL_INSERT_BULK_OPPORTUNITY}")
	private String URL_INSERT_BULK_OPPORTUNITY;
	
	@Value("${URL_INSERT_OPPORTUNITY_RECORD}")
	private String URL_INSERT_OPPORTUNITY_RECORD;
	
	@Value("${URL_GET_OPPORTUNITY_PROFILE_RECORD}")
	private String URL_GET_OPPORTUNITY_PROFILE_RECORD;
	
	@Value("${URL_UPDATE_OPPORTUNITY_PROFILE}")
	private String URL_UPDATE_OPPORTUNITY_PROFILE;

	@Value("${URL_DELETE_OPPORTUNITY}")
	private String URL_DELETE_OPPORTUNITY;

	@Value("${URL_DELETE_NOTE}")
	private String URL_DELETE_NOTE;
	
	@Value("${URL_GET_RM_LIST}")
	private String URL_GET_RM_LIST;
	
	@Value("${URL_GET_OPPORTUNITY_RECORD}")
	private String URL_GET_OPPORTUNITY_RECORD;
	
	private List<OpportunityData> lstSuccessOpportunity;
	private List<OpportunityData> lstFailedOpportunity;
	private List<OpportunityData> lstExistingOpportunity;
	OpportunityData opportunityData=new OpportunityData();
	BulkUploadOpportunityData bulkUploadOpportunityData =null;
	
	private String sectionName;
	final String SOURCE_MODULE = "Opportunity Profile SRP";
	final String SOURCE_MODULE_OPPORTUNITY = "Opportunity";
	final String Delete_OPPORTUNITY = "Delete Opportunity";
	String url;
	
	
	@SuppressWarnings("unchecked")
	public ModelAndView importBulkOpportunities(HttpServletRequest request,
				HttpServletResponse response,OpportunityData opportunityDatas) throws IOException {
		UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		logger.info("Hello in import..."+opportunityDatas.getLeadUpload());
		bulkUploadOpportunityData = new BulkUploadOpportunityData();
//		logger.info("File is:----"+opportunityDatas.getLeadUpload());
//		logger.info("File name is:----"+opportunityDatas.getLeadUpload().getOriginalFilename());
		
		String opportunityUploadFileName;
		opportunityUploadFileName=opportunityDatas.getLeadUpload()[0].getOriginalFilename();
		MultipartFile opportunityUploadFile;
		opportunityUploadFile=opportunityDatas.getLeadUpload()[0];
		
		logger.info("File name is:----"+opportunityUploadFileName);
		logger.info("File  is:----"+opportunityUploadFile);
		
		
		
		int buId = userSession.getBuId();
		
	///	Integer partyId = Integer.parseInt(request.getAttribute("bulkPartyid"));
		HttpSession hes = request.getSession();

		Integer partyId=(Integer) hes.getAttribute("bulkPartyid");
		logger.info("bulkPartyid------" + partyId);
		
		//int partyId = 122023;
		int createdBy = userSession.getUserId();
		
		opportunityData.setLeadUpload(opportunityDatas.getLeadUpload());
		opportunityData.setOwnerPartyID(partyId);
		opportunityData.setBuId(buId);
		opportunityData.setCreatedBy(createdBy);
		bulkUploadOpportunityData.setCreatedBy(createdBy);
		String xmlString;
		int TotalOps = 0;
		
		lstSuccessOpportunity=new ArrayList<>();
		lstFailedOpportunity=new ArrayList<>();
		lstExistingOpportunity=new ArrayList<>();
		logger.info("To bulk Upload Opportunities.......");
		List<OpportunityData> lstToCreateOpportunity=null;
		
		try{
			if (opportunityUploadFileName.substring(
					opportunityUploadFileName.lastIndexOf('.') + 1).equals("xls")) {				
					lstToCreateOpportunity = readXls();
					logger.info("Amruta Create Oppo-----------"+lstToCreateOpportunity);
					
			} else if (opportunityUploadFileName.substring(
					opportunityUploadFileName.lastIndexOf('.') + 1).equals("xlsx")) {
					lstToCreateOpportunity = readXlsx();
			}
			logger.info("lstFailedOpportunity size:----------"+ lstFailedOpportunity.size());
			this.lstFailedOpportunity=lstFailedOpportunity;
			request.getSession().setAttribute("lstFailedOpportunity",lstFailedOpportunity);
			TotalOps = lstFailedOpportunity.size();
			TotalOps = TotalOps + lstToCreateOpportunity.size();
			request.getSession().setAttribute("TotalOpportunityCount",TotalOps);	
			request.getSession().setAttribute("TotalFailedOpportunityCount", lstFailedOpportunity.size());

			logger.info("**To Create Opportunity By SP**" + lstToCreateOpportunity);
			if(lstToCreateOpportunity!=null){
				if(lstToCreateOpportunity.size()>0){
					xmlString=getOpportunityToInsertXmlString(lstToCreateOpportunity);
					
					bulkUploadOpportunityData.setBulkopportunityXml(xmlString);
					logger.info("XML String"+xmlString);
					
				}
				
			}
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 
		url=URL_INSERT_BULK_OPPORTUNITY + userSession.getUserName() + "/1234";
		logger.info("URL-------8888---"+url);
		logger.info("URL------------>"+url);
		
		ObjectMapper om = new CustomJacksonObjectMapper();
		String jsonString=om.writeValueAsString(bulkUploadOpportunityData);
		logger.info("jsonString:---"+jsonString);
		/*Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
				.currentThread().getStackTrace()[1].getMethodName());*/
		List<List<OpportunityData>> oppList=new ArrayList<>();
		BaseResponse<List<OpportunityData>> br = new BaseResponse<List<OpportunityData>>();
		br = restTemplate.postForObject(url, bulkUploadOpportunityData, BaseResponse.class);
		logger.info("Base Response"+br);
		String result = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
//			logger.info("Amruta Test 1..........");
		oppList = objectMapper.readValue(
					objectMapper.writeValueAsString(br.getResponseListObject()),
					List.class);
	//	logger.info("lstFailedOpportunity@@@@@@---"+oppList);
		
		List<OpportunityData> lstSuccessOpportunity=new ArrayList<OpportunityData>(); 
		lstSuccessOpportunity=oppList.get(0);
		
//		List<OpportunityData> lstExistingOpportunity=new ArrayList<OpportunityData>();	
//		lstExistingOpportunity=oppList.get(1);
	//	
	logger.info("lstSuccessOpportunity....."+lstSuccessOpportunity);
//		logger.info("lstExistingOpportunity----"+lstExistingOpportunity);
	logger.info("lstFailedOpportunity@@@@@@---"+lstFailedOpportunity);
		
		
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");
		
		Audit audit = new Audit();
		audit.setActionByPartyId(partyId);
		audit.setActionByUserID(createdBy);
		audit.setEventID(FiinfraConstants.USER_PROFILE_CREATE);
		audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		audit.setSourceModule(SOURCE_MODULE);		
		FrameworkUtil.audit(audit);
		
		ModelAndView mav = new ModelAndView("partner/bulkuploadOpportunity");
		
		//mav.addObject("lstSuccessOpportunity", lstSuccessOpportunity);
		mav.addObject("lstSuccessOpportunity", objectMapper.writeValueAsString( lstSuccessOpportunity));
		//mav.addObject("lstExistingOpportunity", lstExistingOpportunity);
		//mav.addObject("lstFailedOpportunity", lstFailedOpportunity);
		mav.addObject("lstFailedOpportunity", objectMapper.writeValueAsString( lstFailedOpportunity));
		return mav;

	}


		public List<OpportunityData> readXls() throws IOException, BiffException{
			List<OpportunityData> lstToCreateOpportunity = new ArrayList<OpportunityData>();
		
			MultipartFile bulkUploadFile= opportunityData.getLeadUpload()[0];		
			int ownerPartyId=opportunityData.getOwnerPartyID();
			int buId=opportunityData.getBuId();


			Workbook workbook = Workbook
					.getWorkbook(bulkUploadFile.getInputStream());
					
			int numOfSheets = 0;
			int numOfRows = 1;
			
			Sheet sheet=workbook.getSheet(numOfSheets);
			

			while(numOfRows < sheet.getRows())
			{
				try{		
					opportunityData=new OpportunityData();
				Cell cell1 = sheet.getCell(0, numOfRows);
				Cell cell2 = sheet.getCell(1, numOfRows);
				Cell cell3 = sheet.getCell(2, numOfRows);
				Cell cell4 = sheet.getCell(3, numOfRows);
				Cell cell5 = sheet.getCell(4, numOfRows);
				Cell cell6 = sheet.getCell(5, numOfRows);
				Cell cell7 = sheet.getCell(6, numOfRows);
				Cell cell8 = sheet.getCell(7, numOfRows);
				Cell cell9 = sheet.getCell(8, numOfRows);
				Cell cell10 = sheet.getCell(9, numOfRows);
				Cell cell11 = sheet.getCell(10, numOfRows);
				Cell cell12 = sheet.getCell(11, numOfRows);
				Cell cell13 = sheet.getCell(12, numOfRows);
				Cell cell14 = sheet.getCell(13, numOfRows);
										
				String cell1Content = cell1.getContents();
				String cell2Content = cell2.getContents();
				String cell3Content = cell3.getContents();
				String cell4Content = cell4.getContents();
				String cell5Content = cell5.getContents();
				String cell6Content = cell6.getContents();
				String cell7Content = cell7.getContents();
				String cell8Content = cell8.getContents();
				String cell9Content = cell9.getContents();
				String cell10Content = cell10.getContents();
				String cell11Content = cell11.getContents();
				String cell12Content = cell12.getContents();
				String cell13Content = cell13.getContents();
				String cell14Content = cell14.getContents();
				
				cell1Content=cell1Content.replaceAll("^\\s+|\\s+$","");
				cell2Content=cell2Content.replaceAll("^\\s+|\\s+$","");
				cell3Content=cell3Content.replaceAll("^\\s+|\\s+$","");
				cell4Content=cell4Content.replaceAll("^\\s+|\\s+$","");
			//	cell5Content=cell5Content.replaceAll("^\\s+|\\s+$","");
				cell6Content=cell6Content.replaceAll("^\\s+|\\s+$","");
				cell7Content=cell7Content.replaceAll("^\\s+|\\s+$","");
				cell8Content=cell8Content.replaceAll("^\\s+|\\s+$","");
				cell9Content=cell9Content.replaceAll("^\\s+|\\s+$","");
				cell10Content=cell10Content.replaceAll("^\\s+|\\s+$","");
				cell11Content=cell11Content.replaceAll("^\\s+|\\s+$","");
				cell12Content=cell12Content.replaceAll("^\\s+|\\s+$","");
				cell13Content=cell13Content.replaceAll("^\\s+|\\s+$","");
				cell14Content=cell14Content.replaceAll("^\\s+|\\s+$","");
				
				logger.info(" FirstName	LastName	Company	Designation	Age	Contact Email	Contact Mobile	Contact Mobile 2	Address	City	Pin Code	Campaign Name	Referral Name      Enable DC Tool");
				logger.info(cell1Content + "  " + cell2Content + "  "
								 + cell3Content + "  " + cell4Content + "  "
								 + cell5Content + "  " + cell6Content + "  "
								 + cell7Content + "  " + cell8Content + "  "
								 + cell9Content + "  " + cell10Content + "  "
								 + cell11Content + "  " + cell12Content + "  "
								 + cell13Content + "  " + cell14Content + "  ");
				
				
				
//				OpportunityData opportunityData = new OpportunityData();
				try{
				opportunityData.setFirstName(cell1Content);
				opportunityData.setLastName(cell2Content);
				opportunityData.setCompanyName(cell3Content);
				opportunityData.setDesignation(cell4Content);
				opportunityData.setAge(cell5Content);
				opportunityData.setContactEmail(cell6Content);
				opportunityData.setContactMobile(cell7Content);
				opportunityData.setContactMobile2(cell8Content);
				opportunityData.setAddress(cell9Content);
				opportunityData.setCity(cell10Content);
				opportunityData.setPinCode(cell11Content);
				opportunityData.setCampaignName(cell12Content);
				opportunityData.setContactReferalName(cell13Content);
				opportunityData.setEnableDCTool(cell14Content);
				opportunityData.setOwnerPartyID(ownerPartyId);
				opportunityData.setBuId(buId);
				
				logger.info("cell14Content:--------------"
						+ cell14Content);

//				cell6Content=cell6Content.replaceAll("\\s","");
				String email=cell6Content;
				logger.info("With Out Space----Cell-----"+cell6Content);
//				logger.info("With Out Space---------"+email);
				Validator validator = new Validator();			
				int resultMail=validator.emailvalid(email);
				
				
//				cell7Content=cell7Content.replaceAll("\\s","");
				String mob=cell7Content;
				logger.info("With Out Space----Cell-----"+cell7Content);
//				logger.info("With Out Space---------"+mob);
				int resultMob=validator.largeval(mob, 10);

				
				
				if (cell2Content.trim() != "" && cell6Content.trim() != "") {
					if(resultMail==0 || resultMob==0)
					{
						lstToCreateOpportunity.add(opportunityData);
					}else{
						lstFailedOpportunity.add(opportunityData);
					}
				} 
				else {
					lstFailedOpportunity.add(opportunityData);
				}
				
				}catch(Exception e){
					e.printStackTrace();
				}
				}catch(Exception e){
					e.printStackTrace();
				}
				numOfRows++;
			}
			logger.info("lstFailedOpportunity Size is:-------"+lstFailedOpportunity.size());
			logger.info("lstToCreateOpportunity Size is "+lstToCreateOpportunity.size());
			
			return lstToCreateOpportunity;
		}


		public List<OpportunityData> getLstSuccessOpportunity() {
			return lstSuccessOpportunity;
		}


		public void setLstSuccessOpportunity(List<OpportunityData> lstSuccessOpportunity) {
			this.lstSuccessOpportunity = lstSuccessOpportunity;
		}


		public List<OpportunityData> getLstFailedOpportunity() {
			return lstFailedOpportunity;
		}


		public void setLstFailedOpportunity(List<OpportunityData> lstFailedOpportunity) {
			this.lstFailedOpportunity = lstFailedOpportunity;
		}


		public List<OpportunityData> readXlsx() throws FileNotFoundException, IOException {
			List<OpportunityData> lstToCreateOpportunity = new ArrayList<OpportunityData>();
			logger.info("In Read XLSX Method");
			
			MultipartFile bulkUploadFile= opportunityData.getLeadUpload()[0];
			logger.info("File IN ReadXLs------------"+bulkUploadFile);
			int ownerPartyId=opportunityData.getOwnerPartyID();
			logger.info("ownerPartyId------------"+ownerPartyId);
			int buId=opportunityData.getBuId();
			logger.info("Buid---------"+buId);
			
//			XSSFWorkbook workbook = new XSSFWorkbook(
//					new FileInputStream(bulkUploadFile));
			
			XSSFWorkbook workbook = new XSSFWorkbook(bulkUploadFile.getInputStream());
			
			int numOfSheets = 0;
			List<OpportunityData> lstFailedOpportunity = new ArrayList<OpportunityData>();
			
			XSSFSheet sheet;
			sheet = workbook.getSheetAt(numOfSheets);
			int numRow = 1;

			XSSFRow rowIndex;
			
			while (numRow <= sheet.getLastRowNum()) {

				rowIndex = sheet.getRow(numRow);
				int numCol = 0;
				try {
					// while (numCol < 3) {
					XSSFCell cellIndex1 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex2 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex3 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex4 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex5 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex6 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex7 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex8 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex9 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex10 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex11 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex12 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex13 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex14 = rowIndex.getCell(numCol);
					numCol++;
					XSSFCell cellIndex15 = rowIndex.getCell(numCol);
					numCol++;
									
					String cell1Content = null;
					String cell2Content = null;
					String cell3Content = null;
					String cell4Content = null;
					String cell5Content = null;
					String cell6Content = null;
					String cell7Content =null;
					String cell8Content = null;
					String cell9Content = null;
					String cell10Content = null;
					String cell11Content = null;
					String cell12Content = null;
					String cell13Content = null;
					String cell14Content = null;
					String cell15Content = null;
					
					
					try{
						cell1Content = cellIndex1.toString();
					}catch(Exception e){}
					try{
						cell2Content = cellIndex2.toString();
					}catch(Exception e){
						cell2Content="";
					}
					try{
						cell3Content = cellIndex3.toString();
					}catch(Exception e){}
					try{
						cell4Content = cellIndex4.toString();
					}catch(Exception e){}
					try{
						cell5Content = cellIndex5.toString();
					}catch(Exception e){}
					try{
						cell6Content = cellIndex6.toString();
					}catch(Exception e){
						cell6Content="";
					}
					try{
						cell7Content = cellIndex7.toString();
					}catch(Exception e){}
					try{
						cell8Content = cellIndex8.toString();
					}catch(Exception e){}
					try{
						cell9Content = cellIndex9.toString();
					}catch(Exception e){}
					try{
						cell10Content = cellIndex10.toString();
					}catch(Exception e){}
					try{
						cell11Content = cellIndex11.toString();
					}catch(Exception e){}
					try{
						cell12Content = cellIndex12.toString();
					}catch(Exception e){}
					try{
						cell13Content = cellIndex13.toString();
					}catch(Exception e){}
					try{
						cell14Content = cellIndex14.toString();
					}catch(Exception e){}				
					try{
						cell15Content = cellIndex15.toString();
					}catch(Exception e){}
					
					logger.info(" FirstName	LastName	Company	Designation	Occupation	Age	Contact Email	Contact Mobile	Contact Mobile 2	Address	City	Pin Code	Campaign Name	Referral Name    Enable DC Tool");
					logger.info(cell1Content + "  " + cell2Content + "  "
							+ cell3Content + "  " + cell4Content + "  "
							+ cell5Content + "  " + cell6Content + "  "
							+ cell7Content + "  " + cell8Content + "  "
							+ cell9Content + "  " + cell10Content + "  "
							+ cell11Content + "  " + cell12Content + "  "
							+ cell13Content + "  " + cell14Content + "  ");
					
					
					OpportunityData opportunityData = new OpportunityData();
					try{
					opportunityData.setFirstName(cell1Content);
					opportunityData.setLastName(cell2Content);
					opportunityData.setCompanyName(cell3Content);
					opportunityData.setDesignation(cell4Content);
					opportunityData.setAge(cell5Content);
					opportunityData.setContactEmail(cell6Content);
					opportunityData.setContactMobile(cell7Content);
					opportunityData.setContactMobile2(cell8Content);
					opportunityData.setAddress(cell9Content);
					opportunityData.setCity(cell10Content);
					opportunityData.setPinCode(cell11Content);
					opportunityData.setCampaignName(cell12Content);
					opportunityData.setContactReferalName(cell13Content);
					opportunityData.setEnableDCTool(cell14Content);
					opportunityData.setOwnerPartyID(ownerPartyId);
					opportunityData.setBuId(buId);
					
					logger.info("cell2Content.trim():--------------"
							+ cell2Content.trim());
					
					if (cell2Content.trim() != "" && cell6Content.trim() != "") {
						lstToCreateOpportunity.add(opportunityData);
					} else {
						lstFailedOpportunity.add(opportunityData);
					}
					
					}catch(Exception e){
						e.printStackTrace();
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}
				numRow++;
			}
			logger.info("lstFailedOpportunity Size is:-------"+lstFailedOpportunity.size());
			
			return lstToCreateOpportunity;
		}
		
		private String getOpportunityToInsertXmlString(List<OpportunityData> lstToCreateOpportunity) {
			logger.info("lstToCreateOpportunity--------s"+lstToCreateOpportunity);
			int opportunityOwner = opportunityData.getOwnerPartyID();
			int buId=opportunityData.getBuId();
			logger.info("**opportunityOwner================" +opportunityOwner);
			logger.info("**Buid================" +buId);
			if (lstToCreateOpportunity.size() > 0) {
				StringBuilder sb = new StringBuilder("<root>");
				Iterator<OpportunityData> it = lstToCreateOpportunity.iterator();
				while (it.hasNext()) {
					OpportunityData opportunityData = it.next();	
					
					
					
//					int opportunityOwner = opportunityData.getOwnerPartyID();
//					int buId=opportunityData.getBuId();
//					logger.info("**opportunityOwner================" +opportunityOwner);
//					logger.info("**Buid================" +buId);
					
					sb.append("<Opportunity>");
					sb.append("<FirstName><![CDATA[" + opportunityData.getFirstName() + "]]></FirstName>");
					sb.append("<LastName><![CDATA[" + opportunityData.getLastName() + "]]></LastName>");
					sb.append("<CompanyName><![CDATA[" + opportunityData.getCompanyName() + "]]></CompanyName>");
					sb.append("<Designation><![CDATA[" + opportunityData.getDesignation() + "]]></Designation>");
					try {
						sb.append("<Age>" + opportunityData.getAge()
								+ "</Age>");
					} catch (Exception e) {
						sb.append("<Age>0</Age>");
					}
					
					sb.append("<ContactEmail><![CDATA[" + opportunityData.getContactEmail() + "]]></ContactEmail>");
					sb.append("<ContactMobile><![CDATA[" + opportunityData.getContactMobile() + "]]></ContactMobile>");
					sb.append("<ContactMobile2><![CDATA[" + opportunityData.getContactMobile2() + "]]></ContactMobile2>");// used Alternate Mobile 
					sb.append("<Address><![CDATA[" + opportunityData.getAddress() + "]]></Address>");
					sb.append("<City><![CDATA[" + opportunityData.getCity() + "]]></City>");				
					sb.append("<PinCode>" + opportunityData.getPinCode() + "</PinCode>");
					sb.append("<CampaignName><![CDATA[" + opportunityData.getCampaignName() + "]]></CampaignName>");
					sb.append("<ReferredBy><![CDATA[" + opportunityData.getContactReferalName() + "]]></ReferredBy>");				
					sb.append("<EnableDCTool><![CDATA[" + opportunityData.getEnableDCTool() + "]]></EnableDCTool>");				
					sb.append("<ownerPartyId>" + opportunityData.getOwnerPartyID() + "</ownerPartyId>");
					sb.append("<buId>" + opportunityData.getBuId() + "</buId>");
					
					sb.append("</Opportunity>");
				}
				sb.append("</root>");
				logger.info("SB---------"+sb);
				logger.info("SB.toString()---------"+sb.toString());
				return sb.toString();
			}
			return null;
		}

		
		
		
		@SuppressWarnings("unchecked")
		public void saveOpportunity(HttpServletRequest request,
				HttpServletResponse response, OpportunityData opportunityData) throws Exception {
			logger.info("content type:--" + request.getContentType());
			final String OBJECT_STRING;
			String result="fail";
			request.getSession().setAttribute("OpportunityResult", result);
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");

			String partyId=request.getParameter("partyId");
			String opartyId=request.getParameter("opartyId");		
			
			logger.info("Request .........PartyID-------"+partyId);
			logger.info("Request ...OOOOOOOOOOOO......PartyID-------"+opartyId);

			HttpSession hes = request.getSession();
			int createdBy = userSession.getUserId();
			//Integer opportunityOwner = userSession.getPartyId();
			//if(opportunityOwner == null)
			//{
				Integer opportunityOwner = (Integer) hes.getAttribute("bulkPartyid");
			//}
			int buId=userSession.getBuId();
			opportunityData.setBuId(buId);
			opportunityData.setCreatedBy(createdBy);
			opportunityData.setOwnerPartyID(opportunityOwner);
			OBJECT_STRING = buId+","+createdBy+","+opportunityOwner;
			String url = FiinfraUtility.getRestDBURL();

			url=URL_INSERT_OPPORTUNITY_RECORD + userSession.getUserName() + "/1234";
			ObjectMapper om = new CustomJacksonObjectMapper();
			String jsonString=om.writeValueAsString(opportunityData);
			logger.info("jsonString:---"+jsonString);
			Logger.logEntry(this.getClass(), "URL --> " + url, Logger.DEBUG, Thread
					.currentThread().getStackTrace()[1].getMethodName());
			
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			
			logger.info("Opportunity In save WEvb...1");
			br = restTemplate.postForObject(url, opportunityData, BaseResponse.class);
			int recordCount=0;
			List<Integer> resultList=new ArrayList<>();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				resultList=br.getResponseListObject();
			recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
			int opPartyId=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)), Integer.class);		
			int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),Integer.class);
			logger.info("Opportunity In save WEvb...1 ******************--------"+isPanExist );
			
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
		/*	Audit audit = new Audit();
			audit.setActionByPartyId(userSession.getPartyId());
			audit.setObjectName(String.valueOf(opPartyId));
			audit.setActionByUserID(createdBy);
			audit.setEventID(FiinfraConstants.SAVE_OPPORTUNITY);
			audit.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
			audit.setSourceModule(SOURCE_MODULE_OPPORTUNITY);
			audit.setSourceScreen("Add/Edit Opportunity");
			FrameworkUtil.audit(audit);
			*/
			
			/*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(), FiinfraConstants.SAVE_OPPORTUNITY, FiinfraConstants.SERVICE_PORTAL, SOURCE_MODULE_OPPORTUNITY , FiinfraConstants.SRP_ADD_EDIT_OPPORTUNITY,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	/*	--------------------------------------------------------------------------------------------------------- */
	
			
			
			objectMapper.writeValue(out, resultList);
		}
		
		
		
		@SuppressWarnings("unchecked")
		public void getOpportunityProfileDetails(HttpServletRequest request,
				HttpServletResponse response) throws IOException{
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			
			String partyId=request.getParameter("partyId");
			int buId=userSession.getBuId();		
			
			
			url=URL_GET_OPPORTUNITY_PROFILE_RECORD + userSession.getUserName() + "/1234";
			logger.info("URL------------>"+url);
			
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("buId",buId);
			uriCB.queryParam("partyId",partyId);
			
			BaseResponse<OpportunityProfileData> br = new BaseResponse<OpportunityProfileData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			
			OpportunityProfileData opportunityProfileData=new OpportunityProfileData();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				opportunityProfileData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), OpportunityProfileData.class);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, opportunityProfileData);
		}
		
		
		@SuppressWarnings("unchecked")
		public void saveOpportunityProfileData(HttpServletRequest request,
				HttpServletResponse response, OpportunityProfileData opportunityProfileData)
				throws Exception {
			//redirectDcActivation
			
			sectionName = request.getParameter("sectionName");
			logger.info("Ams XML-----"+opportunityProfileData.getInterestedFpXML());
			logger.info("In the COntriolller.................For Profile.................."+sectionName);
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
			logger.info("URL --> " + url);
			int buId = userSession.getBuId();
			String partyId=request.getParameter("partyId");
			logger.info("partyId=======WEB ======"+partyId);
			int lastModifiedBy = userSession.getUserId();
			opportunityProfileData.setPartyId(partyId);
			opportunityProfileData.setBuId(buId);
			opportunityProfileData.setSectionName(sectionName);
			opportunityProfileData.setLastModifiedBy(lastModifiedBy);
			String OBJECT_STRING = partyId+","+buId+","+sectionName+","+lastModifiedBy;
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
			int recordCount = 0;
			List<Integer> resultList=new ArrayList<>();
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				resultList=br.getResponseListObject();
				recordCount = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)),Integer.class);
				int isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
			
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			/*Audit audit = new Audit();
			audit.setActionByPartyId(Integer.parseInt(partyId));
			audit.setActionByUserID(lastModifiedBy);
			audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
			audit.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			FrameworkUtil.audit(audit);*/
			
			/*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(userSession.getPartyId(),lastModifiedBy, FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE, FiinfraConstants.SERVICE_PORTAL, SOURCE_MODULE , sectionName,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	/*	--------------------------------------------------------------------------------------------------------- */
	
			
			
			
			objectMapper.writeValue(out, resultList);
			
			
		}
		
		@SuppressWarnings("unchecked")
		public void saveOpportunityProfileAddressData(HttpServletRequest request,
				HttpServletResponse response, AddressData addressData)
				throws Exception {

			
			sectionName = request.getParameter("sectionName");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
			logger.info("URL --> " + url);
			int buId = userSession.getBuId();
			String partyId=request.getParameter("partyId");
			logger.info("In saveOpportunityProfileAddressData partyId="+partyId);
			int lastModifiedBy = userSession.getUserId();
			OpportunityProfileData opportunityProfileData = new OpportunityProfileData();
			opportunityProfileData.setPartyId(partyId);
			opportunityProfileData.setBuId(buId);
			opportunityProfileData.setSectionName(sectionName);
			opportunityProfileData.setLastModifiedBy(lastModifiedBy);
			opportunityProfileData.setContactEmail(request.getParameter("contactEmail"));
			opportunityProfileData.setContactMobile(request.getParameter("contactMobile"));
			opportunityProfileData.setContactMobile2(request.getParameter("contactMobile2"));
			
			String OBJECT_STRING = partyId+","+buId+","+sectionName+","+lastModifiedBy;
			List<AddressData> addressDatas = new ArrayList<>();
			addressDatas.add(addressData);
			opportunityProfileData.setAddressDataList(addressDatas);
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
			int recordCount = 0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				recordCount = objectMapper.readValue(
						objectMapper.writeValueAsString(br.getResponseObject()),
						Integer.class);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
		/*	Audit audit = new Audit();
			//audit.setActionByPartyId(partyId);
			audit.setActionByUserID(lastModifiedBy);
			audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
			audit.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			FrameworkUtil.audit(audit);*/
			
			/*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(userSession.getPartyId(),lastModifiedBy, FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE, FiinfraConstants.SERVICE_PORTAL, SOURCE_MODULE , sectionName,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	/*	--------------------------------------------------------------------------------------------------------- */
	
			
			
			objectMapper.writeValue(out, recordCount);
		}

		/*@SuppressWarnings("unchecked")
		public void saveOpportunityProfileFamilyMemberData(HttpServletRequest request,
				HttpServletResponse response)
				throws Exception {
			int isFamilyMemberPresent=0;
			sectionName = request.getParameter("sectionName");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			int partyId=Integer.parseInt(request.getParameter("partyId"));
			url = URL_UPDATE_DC_PERSONALINFORMATION_RECORD+userSession.getName()+"/1234";
			List<Integer> resultList=new ArrayList<>();
			int isPanExist=0;
			int lastModifiedBy = userSession.getUserId();
			String result="success";		
			logger.info("familyMemberXml-----"+request.getParameter("familyMemberXML"));
			int recordCount=0;
			OpportunityData opportunityData=new OpportunityData();
			opportunityData.setPartyId(partyId);
			opportunityData.setBuId(buId);
			opportunityData.setLastModifiedBy(lastModifiedBy);
			opportunityData.setFamilyMemberXml(request.getParameter("familyMemberXML"));
			opportunityData.setFromProfile(true);
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			opportunityData.setContactPhoto(null);
			br = restTemplate.postForObject(url, opportunityData, BaseResponse.class);
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				resultList=br.getResponseListObject();//NOw Added
				recordCount=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(0)), Integer.class);	
				isPanExist=objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(1)),Integer.class);
				isFamilyMemberPresent = objectMapper.readValue(objectMapper.writeValueAsString(resultList.get(2)),Integer.class);
				logger.info("isFamilyMemberPresent in WEB====="+isFamilyMemberPresent);
//				recordCount=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), Integer.class);
				logger.info("Record Count Ams2----------------"+recordCount);
				
				List<String> responseList=new ArrayList<>();
				responseList.add(String.valueOf(recordCount));
				responseList.add(String.valueOf(isPanExist));
				responseList.add(String.valueOf(isFamilyMemberPresent));
				
				
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			Audit audit = new Audit();
			audit.setActionByPartyId(partyId);
			audit.setActionByUserID(lastModifiedBy);
			audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			FrameworkUtil.audit(audit);
			
			objectMapper.writeValue(out, responseList);
//			objectMapper.writeValue(out, recordCount);
		}*/

		@SuppressWarnings("unchecked")
		public void saveOpportunityProfileNotesData(HttpServletRequest request,
				HttpServletResponse response, NotesData notesData)
				throws Exception {
			sectionName = request.getParameter("sectionName");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
			logger.info("URL --> " + url);
			int buId = userSession.getBuId();
			String partyId=request.getParameter("partyId");
			int lastModifiedBy = userSession.getUserId();
			OpportunityProfileData opportunityProfileData = new OpportunityProfileData();
			opportunityProfileData.setPartyId(partyId);
			opportunityProfileData.setBuId(buId);
			opportunityProfileData.setSectionName(sectionName);
			opportunityProfileData.setLastModifiedBy(lastModifiedBy);
			String OBJECT_STRING = partyId+","+buId+","+sectionName+","+lastModifiedBy;
			List<NotesData> notesDatas = new ArrayList<>();
			notesDatas.add(notesData);
			opportunityProfileData.setNotesDataList(notesDatas);
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
			int recordCount = 0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				recordCount = objectMapper.readValue(
						objectMapper.writeValueAsString(br.getResponseObject()),
						Integer.class);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			/*Audit audit = new Audit();
			//audit.setActionByPartyId(partyId);
			audit.setActionByUserID(lastModifiedBy);
			audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
			audit.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			FrameworkUtil.audit(audit);*/
			
			
			/*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(userSession.getPartyId(),lastModifiedBy, FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE, FiinfraConstants.SERVICE_PORTAL, SOURCE_MODULE , sectionName,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	/*	--------------------------------------------------------------------------------------------------------- */
	
			
			
			objectMapper.writeValue(out, recordCount);
		}
		
		@SuppressWarnings("unchecked")
		public void saveOpportunityProfileDocumentData(HttpServletRequest request,
				HttpServletResponse response, DocumentData documentData)
				throws Exception {
			sectionName = request.getParameter("sectionName");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			url = URL_UPDATE_OPPORTUNITY_PROFILE + userSession.getUserName() + "/1234";
			logger.info("URL --> " + url);
			int buId = userSession.getBuId();
			String partyId=request.getParameter("partyId");
			int lastModifiedBy = userSession.getUserId();
			OpportunityProfileData opportunityProfileData = new OpportunityProfileData();
			opportunityProfileData.setPartyId(partyId);
			opportunityProfileData.setBuId(buId);
			opportunityProfileData.setSectionName(sectionName);
			opportunityProfileData.setLastModifiedBy(lastModifiedBy);
			String OBJECT_STRING = partyId+","+buId+","+sectionName+","+lastModifiedBy;
			List<DocumentData> documentDatas = new ArrayList<>();
			documentDatas.add(documentData);
			opportunityProfileData.setDocumentDataList(documentDatas);
			BaseResponse<Integer> br = new BaseResponse<Integer>();
			br = restTemplate.postForObject(url, opportunityProfileData, BaseResponse.class);
			int recordCount = 0;
			if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
				recordCount = objectMapper.readValue(
						objectMapper.writeValueAsString(br.getResponseObject()),
						Integer.class);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
	/*		Audit audit = new Audit();
//			audit.setActionByPartyId(partyId);
			audit.setActionByUserID(lastModifiedBy);
			audit.setEventID(FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE);
			audit.setSourceSystemID(FiinfraConstants.SERVICE_PORTAL);
			audit.setSourceModule(SOURCE_MODULE);
			audit.setSourceScreen(sectionName);
			FrameworkUtil.audit(audit);
			*/
			
			/*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(userSession.getPartyId(),lastModifiedBy, FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE, FiinfraConstants.SERVICE_PORTAL, SOURCE_MODULE , sectionName,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	/*	--------------------------------------------------------------------------------------------------------- */
	
			
			objectMapper.writeValue(out, recordCount);
		}
		
	
		
		/**
		 * deletes the Opportunity and related details
		 * 
		 * @param request
		 * @param response
		 * @throws IOException
		 */
		@SuppressWarnings("unchecked")
		public void deleteNote(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			String noteIds = request.getParameter("noteIds");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			
			url = URL_DELETE_NOTE + userSession.getUserName() + "/1234";
			logger.info("url:-"+url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("noteIds", noteIds);
			uriCB.queryParam("buId", buId);
			BaseResponse<String> br = new BaseResponse<String>();
			try {
				br = restTemplate.getForEntity(
						FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
						.getBody();
			} catch (Exception e) {
				logger.error(e);
			}
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
															// be SUCCESS or
															// .EMPTY_RESULT_SET.
															// Accordingly handle
															// this in View.
		}
		
		
		/**
		 * deletes the Opportunity and related details
		 * 
		 * @param request
		 * @param response
		 * @throws IOException
		 */
		@SuppressWarnings("unchecked")
		public void deleteOpportunities(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			String partyIds = request.getParameter("partyIds");
			UserSession userSession = (UserSession) request.getSession()
					.getAttribute("userSession");
			int buId = userSession.getBuId();
			int createdBy=userSession.getUserId();
			opportunityData.setCreatedBy(createdBy);
			
			url = URL_DELETE_OPPORTUNITY + userSession.getUserName() + "/1234";
			logger.info("url:-" + url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			uriCB.queryParam("partyIds", partyIds);
			uriCB.queryParam("buId", buId);
			uriCB.queryParam("createdBy", createdBy);
			String OBJECT_STRING = partyIds+","+buId+","+createdBy;
			logger.info("PPPPPPPPPPPPPPPPPP-------------" + partyIds);
			BaseResponse<String> br = new BaseResponse<String>();
			try {
				br = restTemplate.getForEntity(
						FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class)
						.getBody();
			} catch (Exception e) {
				logger.error(e);
			}

			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			
			/*	--------------------------------------------------------------------------------------------------------- */
			try {
				FiinfraUtility.doAudit(userSession.getPartyId(),userSession.getUserId(), FiinfraConstants.OPPORTUNITY_PROFILE_UPDATE, FiinfraConstants.SERVICE_PORTAL, Delete_OPPORTUNITY , sectionName,OBJECT_STRING);
			} catch (Exception e) {
				e.printStackTrace();
			}
	/*	--------------------------------------------------------------------------------------------------------- */
	
			
			
			objectMapper.writeValue(out, br.getStatus());// TO Do: here status can
															// be SUCCESS or
															// .EMPTY_RESULT_SET.
															// Accordingly handle
															// this in View.
		}
		
		@SuppressWarnings("unchecked")
		public void getOpportunityDetails(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			
			String partyId=request.getParameter("partyId");
			logger.info("opartyId=-======partyId========="+partyId);
			
			int buId=userSession.getBuId();		
		
			url=URL_GET_OPPORTUNITY_RECORD + userSession.getUserName() + "/1234";
			logger.info("URL------------>"+url);
			UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
			//uriCB.queryParam("buId",buId);
			uriCB.queryParam("partyId",partyId);
			
			BaseResponse<OpportunityData> br = new BaseResponse<OpportunityData>();
			br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class).getBody();
			OpportunityData opportunityData=new OpportunityData();
			if(br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
				opportunityData=objectMapper.readValue(objectMapper.writeValueAsString(br.getResponseObject()), OpportunityData.class);			
			}
			
			logger.info("Opportunity Data----------"+objectMapper.writeValueAsString(opportunityData) );
			
			//opportunityData.setPartyId(partyId);
			PrintWriter out = null;
			out = response.getWriter();
			response.setContentType("application/json");
			objectMapper.writeValue(out, opportunityData);
		}
		
		
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/loadRMlist", method = RequestMethod.GET)
		public ModelAndView loadRMlist(HttpServletRequest request,HttpServletResponse response) {
			logger.info("in loadRM list PartnerSP1Controller");
		
			    UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
			    ModelAndView mav = new ModelAndView("partner/RMList");
			    logger.info(userSession.getUserName());
				
				String userToken = null;
				if(userSession.getUserName()!=null){
					userToken = userSession.getUserName();
				}
				else{
					userToken = "abc";
				}
				
				String pagesize = request.getParameter("pageSize");
				if (pagesize == null) {
					pagesize = "100";
				}
				
				String searchTextVal = null;
				if (request.getParameterMap().containsKey("searchtext")) {
					searchTextVal = request.getParameter("searchtext").trim();
				} else {
					searchTextVal = "";
				}
			    
			    
				try {
					int buid = userSession.getBuId();
					int userid = userSession.getUserId();
					int partyid = userSession.getPartyId();
					BaseResponse<Partner> br = new BaseResponse<Partner>();
					Partner partnerVo = new Partner();
					partnerVo.setBuId(buid+"");   
					partnerVo.setPartyID(partyid); 
					partnerVo.setSearchText(searchTextVal);
					
					url = URL_GET_RM_LIST + userToken + "/1234";
					br = restTemplate.postForObject(url, partnerVo, BaseResponse.class);
					//List<Partner> partnerList = new ArrayList<Partner>();
					Partner[] partnerList = null;
					if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
						partnerList = objectMapper.readValue(
								objectMapper.writeValueAsString(br.getResponseListObject()),
								Partner[].class);

					}
					/*if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
						partnerList = br.getResponseListObject();*/
					mav.addObject("rmData", Arrays.asList(partnerList));
					mav.addObject("size", pagesize); 
					PrintWriter out = null; 
					  
					try {    
						out = response.getWriter();
					} catch (Exception e) {
						e.printStackTrace();
					} 
				} catch (Exception e) {
					e.printStackTrace();
				}
					
					return mav;
		}
		
		
		
}
