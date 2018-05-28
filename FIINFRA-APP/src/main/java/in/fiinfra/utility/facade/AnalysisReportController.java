package in.fiinfra.utility.facade;

import in.fiinfra.advice.service.GoalPlanService;
import in.fiinfra.analysis.service.AnalysisService;
import in.fiinfra.common.admin.UserData;
import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.diy.models.AdviceRecommendation;
import in.fiinfra.common.diy.models.AdviserGoals;
import in.fiinfra.common.diy.models.CashFlowData;
import in.fiinfra.common.diy.models.ClientActionPlan;
import in.fiinfra.common.diy.models.ComprehensiveData;
import in.fiinfra.common.diy.models.Document;
import in.fiinfra.common.diy.models.GoalAttribute;
import in.fiinfra.common.diy.models.GoalPlanInput;
import in.fiinfra.common.diy.models.GoalwiseProductMap;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.ProductData;
import in.fiinfra.common.diy.models.ProductwiseGoalMap;
import in.fiinfra.common.diy.models.RiskPlanningMap;
import in.fiinfra.common.diy.models.Suggestion;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.partner.APDetails;
import in.fiinfra.common.service.CommonService;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.util.JsonData;
import in.fiinfra.common.utility.DCOutputData;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.common.utility.QuestionDetails;
import in.fiinfra.common.utility.ReportSchedularData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.dc.service.DataCollectionService;
import in.fiinfra.doc.service.DocumentService;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.partner.service.PartnerService;
import in.fiinfra.party.service.PartyService;
import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.question.service.QuestionService;
import in.fiinfra.report.service.ReportService;
import in.fiinfra.utility.service.DCService;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;



@Controller
@RequestMapping("/utility")
public class AnalysisReportController {
	@Autowired
	private DCService dcService;
	@Autowired
	private AnalysisService analysisService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private PartnerService partnerService;
	@Autowired
	GoalPlanService goalPlanService;
	@Autowired
	DataCollectionService dataCollectionService;
	@Autowired
	 QuestionService questionService;
	@Autowired
	 DocumentService documentService;
	@Autowired
	 PartyService partyService;
	@Autowired
	 private CommonService commonService;
	@Autowired
	private ObjectMapper objectMapper;
	Response response;
	private static final Logger logger = Logger.getLogger(AnalysisReportController.class);

	@RequestMapping(value = "/generateAnalysisReportComprihenciveNew", method = RequestMethod.GET)
	public ModelAndView generateAnalysisReportComprihenciveNew(HttpServletRequest request,
			HttpServletResponse response,ReportSchedularData reportSchedularData)throws IOException
	{
		  	int dcInputPartyId=reportSchedularData.getPartyId();
			String userName=reportSchedularData.getUser();
			String theme = reportSchedularData.getTheme();
			int	buId=reportSchedularData.getBuId();
			int createdBy = reportSchedularData.getCretaedBy();
			logger.info("partyId==================="+dcInputPartyId);
			DCOutputData output;
			output = dcService.showAnalysisReportPDF(dcInputPartyId,buId,createdBy);
			System.out.println("Output in APP="+output); 
			List<Integer> objSectionSpecificDcData = dcService.getSectionsToShowInDC(dcInputPartyId,buId);
			System.out.println("Sections to show in Dc="+objSectionSpecificDcData);
			String fpsection1= new String();
			for(int i=0;i<objSectionSpecificDcData.size();i++)
			{
				fpsection1=fpsection1+" "+objSectionSpecificDcData.get(i);
				
			}
			List<UserData> userDetails = dcService.getFamilyMemberList(dcInputPartyId,buId);
			List<QuestionDetails> questionDetails = dcService.getFinancialStatusList(dcInputPartyId,buId,0);
			String [] cash; 
			cash = dcService.displayCashFlowBar(dcInputPartyId,buId);
			System.out.println("fpsection1="+fpsection1);
			ModelAndView model=null;
			model = new ModelAndView("pages/utility/ShubhchintakDC/AnalysisReportDIY");
			model.addObject("themeName",theme);
			model.addObject("output",output);
			model.addObject("fpsection1",fpsection1);
			model.addObject("buId",buId);
			model.addObject("userDetails",objectMapper.writeValueAsString(userDetails));
			model.addObject("questionDetails",objectMapper.writeValueAsString(questionDetails));
			model.addObject("displayCashFlowBarData",objectMapper.writeValueAsString(cash));
			
			//return "utility/ShubhchintakDC/AnalysisReportDIY";
			return model;
	      
	}
	@RequestMapping(value = "/uploadGraphImage", method = RequestMethod.POST)
	public void uploadGraphImage(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		int dcInputPartyId= Integer.parseInt(request.getParameter("dcInputPartyId"));
		 String barChartImageData=request.getParameter("barChartImageData");
		 String content="";
		 if(barChartImageData !=null){
			 content = barChartImageData.substring(barChartImageData
					.indexOf(",") + 1);	
			 
		 BASE64Decoder decoder = new BASE64Decoder();
			byte[] decodedBytes = decoder.decodeBuffer(content);
			logger.info("Decoded upload data : " + decodedBytes.length);
		 UserSession userSession=(UserSession) request.getSession().getAttribute("userSession");
		int buId=userSession.getBuId();
		int createdBy=userSession.getUserId();
		
		String uploadFile = dcInputPartyId+".png";
		
		String realPath = request.getSession().getServletContext()
				.getRealPath("/");
		logger.info("Path is:----" + realPath);
		File file = new File(realPath + "/PathFinder/pdf", ""
				+ dcInputPartyId);
		
		
		logger.info(">>>>>>>>>>>>>>>>>>file name is>>>>>>>"
				+ uploadFile);
		File fileToCreate = new File(realPath + "/PathFinder/pdf/"
				+ dcInputPartyId);

		if (file.exists()) {
			logger.info(">>>>>>>>>>>>>>>>>>in if>>>>>>>");
			FileUtils.deleteDirectory(file);
			file = new File(realPath + "/PathFinder/pdf", ""
					+ dcInputPartyId);
			file.mkdirs();
		} else {
			logger.info(">>>>>>>>>>>>>>>>>>in else>>>>>>>");
		}
		
		BufferedImage image = ImageIO.read(new ByteArrayInputStream(
				decodedBytes));
		if (image == null) {
		}
		File temp=new File("D:\\"+dcInputPartyId);
		if (temp.exists()) {
			logger.info(">>>>>>>>>>>>>>>>>>in if>>>>>>>");
			FileUtils.deleteDirectory(file);
			temp=new File("D:\\"+dcInputPartyId);
			temp.mkdirs();
		} else {
			temp.mkdirs();
			logger.info(">>>>>>>>>>>>>>>>>>in else>>>>>>>");
		}
		File f = new File("D:\\"+dcInputPartyId+"\\cashFlowBar.png");
		ImageIO.write(image, "png", f);
		
		try{
			fileToCreate=new File(realPath + "/PathFinder/pdf/"
					+ dcInputPartyId+"/"+uploadFile);
			FileUtils.copyFile(f, fileToCreate);}
			catch(Exception e){
				
			}
		FileUtils.deleteDirectory(temp);
		 }
	}

	/* FPT REPORTS */
	@RequestMapping(value = "/view-report-analysis", method = RequestMethod.GET)
	public ModelAndView getReportForAnalysisA(HttpServletRequest request,ReportSchedularData reportSchedularData) {
		
		int partyId=reportSchedularData.getPartyId();
		int partnerId=reportSchedularData.getPartnerId();
		int buId=reportSchedularData.getBuId();
		int createdBy=reportSchedularData.getCretaedBy();
		String theme=reportSchedularData.getTheme();
		String user=reportSchedularData.getUser();
		String token=reportSchedularData.getToken();
		String reportFor = reportSchedularData.getReportFor();
		//String pdfFilePathA = reportSchedularData.getFilePath();
		ModelAndView model=null;
		Suggestion suggestion=null;
		Suggestion suggestion1=null;
		//model = new ModelAndView("pages/utility/ShubhchintakDC/generate-report-analysis-a");
		Document documentA = new Document();
		documentA.setDocumentType(10001);
		if(reportFor.equals("A")){
			documentA.setDocumentName(partyId + "_Analysis_A.pdf");
			documentA.setFileName(partyId + "_Analysis_A.pdf");
			documentA.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_A.pdf");
			documentA.setFlag("ReportA");
		}else if(reportFor.equals("B")){
			documentA.setDocumentName(partyId + "_Analysis_B.pdf");
			documentA.setFileName(partyId + "_Analysis_B.pdf");
			documentA.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_B.pdf");
			documentA.setFlag("ReportB");
		}else{
			documentA.setDocumentName(partyId + "_Analysis_C.pdf");
			documentA.setFileName(partyId + "_Analysis_C.pdf");
			documentA.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "_Analysis_C.pdf");
			documentA.setFlag("ReportC");
		}
		documentA.setDocumentStorageLocation(82001);
		documentA.setFileTypeId(11004);
		documentA.setPartyId(partyId);
		
		try{
			if( buId <= 0 ) {
				buId = FiinfraConstants.AXISMFBUID;
			}
			AdviserGoals adviserGoals = reportService.getGoalsDetailsForPartyId(partyId,reportFor);
			List<GoalData> goalDataList = reportService.getGoalsForPartyId(partyId);
			
			GoalPlanInput goalPlanInput = new GoalPlanInput();
			
			goalPlanInput.setBuPartyId(buId);
			goalPlanInput.setPartnerPartyId(partnerId);
			goalPlanInput.setSectionTypeId(39005); // 47010  - goal planning (need constant )
			String assetClassId = "46001,46002,46003"; //code valued id for Equity (93002), Debt (93001)  and Gold (93003)
			goalPlanInput.setAssetClassId(assetClassId);
			 
			goalPlanInput.setRiskProfileId(adviserGoals.getRiskProfileId());
			Integer recordTypeId= 50001;
			goalPlanInput.setRecommendationRecordTypeId(recordTypeId);
			
			List<AdviceRecommendation> recommendations = goalPlanService.getRecommendationForAsset(goalPlanInput);
			
			Map<String, List<AdviceRecommendation>> riskProfileMap=buildYearWiseMap(recommendations);
			List<KeyValue> interestdFp = new ArrayList<KeyValue>(); 
			interestdFp =  partnerService.getInterstedFpSection(partnerId, partyId);

			if(reportFor.equalsIgnoreCase("A")){	
				model = new ModelAndView("pages/utility/ShubhchintakDC/analysis_a");
			} else if(reportFor.equalsIgnoreCase("B")) {				
				suggestion  = reportService.getPlanningForPartyId(partyId,"B");
				model = new ModelAndView("pages/utility/ShubhchintakDC/analysis_b");
			}else if(reportFor.equalsIgnoreCase("C")){
				suggestion1  = reportService.getPlanningForPartyId(partyId,"C");
				model = new ModelAndView("pages/utility/ShubhchintakDC/analysis_c");
			}else if(reportFor.equalsIgnoreCase("CLIENT")){ 
				
			}
			
			/*path save logic*/
			
			List<Document> documentList = new ArrayList<Document>();
			documentList.add(documentA);
			//reportService.insertOrUpdateDocumentIdsForPartyId(documentList);
			dataCollectionService.updateFpPlanActivityTracker(7003, partyId);
			
			
			model.addObject("fpSection", interestdFp.get(0).getName());
			model.addObject("riskProfileMap",riskProfileMap);
			model.addObject("theme","94002");
			model.addObject("buPartyId", buId);
			model.addObject("adviserGoals", adviserGoals);
			model.addObject("goalDetails", goalDataList);
			if(reportSchedularData.getReportFor().equals("B"))
			{
				model.addObject("suggestionData", suggestion);	
			}
			else{
				model.addObject("suggestionData", suggestion1);	
			}
			
		} catch(Exception e){
			logger.error("Error Generating Report : ", e);
		}		
		
		//model = new ModelAndView("pages/utility/ShubhchintakDC/generate-report-analysis");
		return model;
	}

	/*FOR ACTION PLAN*/
	
	@RequestMapping(value = "/detailedReport", method = RequestMethod.GET)
	public ModelAndView getDetailedReport(HttpServletRequest request,ReportSchedularData reportSchedularData) {
		
		int partyId=reportSchedularData.getPartyId();
		int partnerId=reportSchedularData.getPartnerId();
		int buId=reportSchedularData.getBuId();
		String user=reportSchedularData.getUser();
		String token=reportSchedularData.getToken();
		String reportFor = reportSchedularData.getReportFor();
		List<KeyValue> interestdFp = new ArrayList<KeyValue>();
		String inflationRate="0.0", equityFund="0.0", debtFund="0.0", goldFund="0.0";
		List<Document> documentList = new ArrayList<Document>();
		ModelAndView model=null;
		token = "1234";
		
		Document documentB = new Document();
		documentB.setDocumentType(10001);			
		documentB.setFileTypeId(11004);
		documentB.setPartyId(partyId);
		documentB.setDocumentStorageLocation(82001);
		
		if(reportFor.equalsIgnoreCase("client")){
			documentB.setFlag("client");
			documentB.setDocumentName(partyId + "_Action_Plan_Client.pdf");
			 documentB.setFileName(partyId + "__Action_Plan_Client.pdf");
			 documentB.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "__Action_Plan_Client.pdf");
		}else{
			documentB.setFlag("advisor");
			 documentB.setDocumentName(partyId + "_Action_Plan_Advisor.pdf");
			 documentB.setFileName(partyId + "__Action_Plan_Advisor.pdf");
			 documentB.setFileStoragePathURI("D://AnalysisReports//"+ partyId + "__Action_Plan_Advisor.pdf");
		}
		
		try{
		//call service for all parties associated 
				
				AdviserGoals adviserGoals = new AdviserGoals();
				adviserGoals = reportService.getGoalsDetailsForPartyId(partyId,"Flag");
				List<ClientActionPlan> clientActionPlanListJson = null;
				clientActionPlanListJson  = reportService.getAnalysisReportForPartyId(partyId);
				//List<ClientActionPlan> clientActionPlanList = new ArrayList<ClientActionPlan>();
				List<ClientActionPlan> emergencyPlanningDataList = new ArrayList<ClientActionPlan>();
				Map<Integer,ProductwiseGoalMap>  mapOfProductwiseGoalMap = new HashMap<Integer,ProductwiseGoalMap>();
				Map<Integer,GoalwiseProductMap>  mapOfGoalwiseProductMap = new HashMap<Integer,GoalwiseProductMap>();
				Map<String,RiskPlanningMap>  mapOfRiskPlanningMap = new HashMap<String,RiskPlanningMap>();
				List<ClientActionPlan> successionPlanningDetails = new ArrayList<ClientActionPlan>();
				List<ClientActionPlan> goalNoteList = new ArrayList<ClientActionPlan>();
				List<ClientActionPlan> taxPlanningList = new ArrayList<ClientActionPlan>();
				List<ClientActionPlan> vacationPlanningList = new ArrayList<ClientActionPlan>();
				List<ClientActionPlan> loanRecommendationList = new ArrayList<ClientActionPlan>();
				ClientActionPlan clientActionPlan =null;
				
				//	clientActionPlanListJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponseForAnalysisReport.getResponseListObject()), List.class);
					
					if(clientActionPlanListJson != null){
						
						//fpSectionTypeId - 390051 goal wise -  39005 product wise emergency - 39001 risk cover - 39003
						
					for(int i = 0; i<clientActionPlanListJson.size(); i++){
						//get the actual party object from its LinkedHashMap representation
						
						clientActionPlan = clientActionPlanListJson.get(i);
						//clientActionPlanList.add(clientActionPlan);
						
						if(i==0)
						{
							inflationRate = clientActionPlan.getInflationRate();
							inflationRate = clientActionPlan.getInflationRate();
							equityFund = clientActionPlan.getEquityFund();
							debtFund = clientActionPlan.getDebtFund();
							goldFund = clientActionPlan.getGoldFund();
						}
						
						if(clientActionPlan.getFpSectionTypeId() == 39005){
							
						if(mapOfProductwiseGoalMap.containsKey(clientActionPlan.getProductId())){
							ProductwiseGoalMap temp = mapOfProductwiseGoalMap.get(clientActionPlan.getProductId());
							temp.getClientActionPlanList().add(clientActionPlan);
							mapOfProductwiseGoalMap.put(clientActionPlan.getProductId(), temp);
						}else{
							ProductwiseGoalMap productWiseGoalMap = new ProductwiseGoalMap();
							productWiseGoalMap.setProductId(clientActionPlan.getProductId());
							productWiseGoalMap.setProductName(clientActionPlan.getProductName());
							productWiseGoalMap.setTotalLumpSumAmt(clientActionPlan.getTotalLumpSumAmt());
							productWiseGoalMap.setTotalSipAmt(clientActionPlan.getTotalSipAmt());
							productWiseGoalMap.setPurchaseUrl(clientActionPlan.getPurchaseUrl());
							List<ClientActionPlan> tempClientActionPlanList = new ArrayList<ClientActionPlan>();
							tempClientActionPlanList.add(clientActionPlan);
							productWiseGoalMap.setClientActionPlanList(tempClientActionPlanList);
							//tempClientActionPlanList.clear();
							mapOfProductwiseGoalMap.put(clientActionPlan.getProductId(), productWiseGoalMap);
							
						}
						}else if(clientActionPlan.getFpSectionTypeId() == 390051){
							
							if(mapOfGoalwiseProductMap.containsKey(clientActionPlan.getGoalId())){
								GoalwiseProductMap temp = mapOfGoalwiseProductMap.get(clientActionPlan.getGoalId());
								temp.getClientActionPlanList().add(clientActionPlan);
								mapOfGoalwiseProductMap.put(clientActionPlan.getGoalId(), temp);
							}else{
								GoalwiseProductMap goalwiseProductMap = new GoalwiseProductMap();
								goalwiseProductMap.setGoalId(clientActionPlan.getGoalId());
								List<ClientActionPlan> tempClientActionPlanList = new ArrayList<ClientActionPlan>();
								tempClientActionPlanList.add(clientActionPlan);
								goalwiseProductMap.setClientActionPlanList(tempClientActionPlanList);
								//tempClientActionPlanList.clear();
								mapOfGoalwiseProductMap.put(clientActionPlan.getGoalId(), goalwiseProductMap);
								
								goalNoteList.add(clientActionPlan);
						}
					
				}else if(clientActionPlan.getFpSectionTypeId() == 39001){
					emergencyPlanningDataList.add(clientActionPlan);
				}else if(clientActionPlan.getFpSectionTypeId() == 39003){
					if(mapOfRiskPlanningMap.containsKey(clientActionPlan.getGoalName())){
						RiskPlanningMap temp = mapOfRiskPlanningMap.get(clientActionPlan.getGoalName());
						temp.getClientActionPlanList().add(clientActionPlan);
						mapOfRiskPlanningMap.put(clientActionPlan.getGoalName(), temp);
					}else{
						RiskPlanningMap riskPlanningMap = new RiskPlanningMap();
						riskPlanningMap.setRequiredCover(clientActionPlan.getRequiredCover());
						riskPlanningMap.setExistingCover(clientActionPlan.getExistingCover());
						riskPlanningMap.setDecimalNumber(clientActionPlan.getDecimalNumber());
						riskPlanningMap.setMoneyFormatted(clientActionPlan.getMoneyFormatted());
						List<ClientActionPlan> tempClientActionPlanList = new ArrayList<ClientActionPlan>();
						tempClientActionPlanList.add(clientActionPlan);
						riskPlanningMap.setClientActionPlanList(tempClientActionPlanList);
						//tempClientActionPlanList.clear();
						mapOfRiskPlanningMap.put(clientActionPlan.getGoalName(), riskPlanningMap);
					}
				}else if(clientActionPlan.getFpSectionTypeId() == 39007)
				{
					successionPlanningDetails.add(clientActionPlan);
				}
				// for tax planning  
				else if(clientActionPlan.getFpSectionTypeId() == 39019)
				{
					taxPlanningList.add(clientActionPlan);
				}
				// for vacation planning
				else if(clientActionPlan.getFpSectionTypeId() == 39014)
				{
					vacationPlanningList.add(clientActionPlan);
				}
				// for 	loan Recommendation	
				else if(clientActionPlan.getFpSectionTypeId() == 39008)
				{
					loanRecommendationList.add(clientActionPlan);
				}
				}
					
				//String assumptionsMade = "<b>Assumptions Made :-</b> Inflation: "+inflationRate+ "%, Returns From Equity: "+equityFund+"%, Returns From Debt: "+debtFund+"%, Returns From Gold: "+goldFund+"%";
				String assumptionsMade = "<b>Assumptions Made :-</b> Returns From Equity: "+equityFund+"%, Returns From Debt: "+debtFund+"%, Returns From Gold: "+goldFund+"%";
				if(reportFor.equalsIgnoreCase("client")){
					
					 model= new ModelAndView("pages/utility/ShubhchintakDC/actionPlanNew") ;
					 model.addObject("reportFor","client");	
				}else{
					
					 model= new ModelAndView("pages/utility/ShubhchintakDC/actionPlanNew") ;
					 model.addObject("reportFor", "advisor");
				  }
				model.addObject("assumptionsMade",assumptionsMade);	
					
				interestdFp =  partnerService.getInterstedFpSection(partnerId, partyId);
				model.addObject("fpSection",interestdFp.get(0).getName());
				model.addObject("ContactDetails", adviserGoals);
				model.addObject("productWiseGoalDetails", mapOfProductwiseGoalMap);
				model.addObject("GoalWiseProductDetails", mapOfGoalwiseProductMap);
				model.addObject("emergencyPlanningDataList", emergencyPlanningDataList);
				
				if(emergencyPlanningDataList.size()>0){
				model.addObject("emergencyPlanningOneTimeAmt", emergencyPlanningDataList.get(0).getTotalLumpSumAmt());
				model.addObject("emergencyPlanningSIPMonthlyAmt", emergencyPlanningDataList.get(0).getRequiredCover());
				}
				model.addObject("riskPlanningProductDetails", mapOfRiskPlanningMap);
				model.addObject("successionPlanningDetails",successionPlanningDetails);
				model.addObject("pageNumber",1);
				model.addObject("goalNoteList",goalNoteList);
				model.addObject("goalNoteTextFlag",1);
				
				model.addObject("taxPlanningList",taxPlanningList);
				model.addObject("vacationPlanningList",vacationPlanningList);
				model.addObject("loanRecommendationList",loanRecommendationList);
				
				model.addObject("goalNoteTextFlag",0);
				model.addObject("buPartyId", buId);
				for(int i=0;i<goalNoteList.size();i++)
				{
					ClientActionPlan actionPlan = goalNoteList.get(i);
					if(actionPlan.getGoalNoteText()!="")
					{
					  model.addObject("goalNoteTextFlag",1);
					  break;
					}
				}
				
				//LOGGER.debug("#==============================assumptionsMade============================"+assumptionsMade);
				
				
				
				/*logic to save the path document*/
					
				
				//documentList.add(documentB);
				//reportService.insertOrUpdateDocumentIdsForPartyId(documentList);
				dataCollectionService.updateFpPlanActivityTracker(7003, partyId);
				
	 			  }
	} catch(Exception e){
		logger.error("Error Generating Report : ", e);
	}		
		//to set current stage id to DCT Submitted
	
	return model;
}
	
	/* Action Plan-Client-Sponsored*/
	@RequestMapping(value = "/generateActionPlan", method = RequestMethod.GET)
	public void generateActionPlan(HttpServletRequest request,HttpServletRequest response, ReportSchedularData reportSchedularData) throws JsonParseException, JsonMappingException, JsonGenerationException, IOException{
		
		BaseResponse<Object> br = new BaseResponse<Object>();
		List<Object> allDataList=new ArrayList<>();
		int partyId=reportSchedularData.getPartyId();
		int partnerId=reportSchedularData.getPartnerId();
		int buId=reportSchedularData.getBuId();
		String theme = reportSchedularData.getTheme();
		String user=reportSchedularData.getUser();
		String token=reportSchedularData.getToken();
		String reportFor = reportSchedularData.getReportFor();
		String context = request.getSession(true).getServletContext()
				.getRealPath("/");
		boolean isBiased =true ;
		//String basePath=
		allDataList = partnerService.getActionPlanDetailsList(partyId,buId,isBiased);
		
		List<APDetails> apDetailsList=new ArrayList<>();
		List<APDetails> goalList=new ArrayList<>();
		List<APDetails> investmentsList=new ArrayList<>();
		List<APDetails> riskPlanningList=new ArrayList<>();
		
		
			apDetailsList=(List<APDetails>)allDataList.get(0);
			goalList = (List<APDetails>)allDataList.get(2);
			investmentsList = (List<APDetails>)allDataList.get(3);
			riskPlanningList = (List<APDetails>)allDataList.get(4);
		
//		for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(2)), List.class)){
//			goalList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
//		}
//		for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(3)), List.class)){
//			investmentsList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
//		}
//		for(HashMap<String,Object> apDetails:(List<HashMap<String,Object>>)objectMapper.readValue(objectMapper.writeValueAsString(allDataList.get(4)), List.class)){
//			riskPlanningList.add((APDetails) objectMapper.readValue(objectMapper.writeValueAsString(apDetails), APDetails.class));
//		}
		
			GenerateClientActionPlan.apDetailsList=apDetailsList;
			GenerateClientActionPlan.apDetails=(APDetails) allDataList.get(1);
			GenerateClientActionPlan.goalList=goalList;
			GenerateClientActionPlan.investmentsList=investmentsList;
			GenerateClientActionPlan.riskPlanningList=riskPlanningList;
			GenerateClientActionPlan.contextPath=context;
			GenerateClientActionPlan.basePath=GenerateClientActionPlan.apDetails.getBasePath();
			GenerateClientActionPlan.partyId=partyId;
			if(theme.equals("Green")){
				GenerateClientActionPlan.r=100;
				GenerateClientActionPlan.g=147;
				GenerateClientActionPlan.b=53;
				GenerateClientActionPlan.actionPlanImageName="ActionPlan_dfda.png";
			}else if(theme.equals("Red")){
				GenerateClientActionPlan.r=202;
				GenerateClientActionPlan.g=81;
				GenerateClientActionPlan.b=78;
				GenerateClientActionPlan.actionPlanImageName="ActionPlan_Red.png";
			}else if(theme.equals("Blue")){
				GenerateClientActionPlan.r=29;
				GenerateClientActionPlan.g=135;
				GenerateClientActionPlan.b=189;
				GenerateClientActionPlan.actionPlanImageName="ActionPlan_Blue.png";
			}else if(theme.equals("Magento")){
				GenerateClientActionPlan.r=152;
				GenerateClientActionPlan.g=36;
				GenerateClientActionPlan.b=85;
				GenerateClientActionPlan.actionPlanImageName="ActionPlan.png";
			}else{
				GenerateClientActionPlan.r=152;
				GenerateClientActionPlan.g=36;
				GenerateClientActionPlan.b=85;
				GenerateClientActionPlan.actionPlanImageName="ActionPlan.png";
			}
			GenerateClientActionPlan.generateAp("_All_Axis");
		
	}
	
	private Map<String, List<AdviceRecommendation>> buildYearWiseMap(List<AdviceRecommendation> goalDataList) {
		Map<String, List<AdviceRecommendation>> recommendationMap;
		List<AdviceRecommendation> goalWiseRecommedation = null;
		recommendationMap = new LinkedHashMap<String, List<AdviceRecommendation>>();
		
		for(AdviceRecommendation recommendation : goalDataList){			
			if (recommendationMap.containsKey(recommendation.getGoalYearRange())){
				goalWiseRecommedation = recommendationMap.get(recommendation.getGoalYearRange());
				goalWiseRecommedation.add(recommendation);				
			}else{
				goalWiseRecommedation = new ArrayList<AdviceRecommendation>();
				goalWiseRecommedation.add(recommendation);
				recommendationMap.put(recommendation.getGoalYearRange(), goalWiseRecommedation);
			}
		}
		return recommendationMap;				
	}
	
	
	@RequestMapping(value = "/generateXrayReport", method = RequestMethod.GET)
	public ModelAndView generateXrayReport(HttpServletRequest request,
			HttpServletResponse response,ReportSchedularData reportSchedularData)throws IOException
	{
		  	int dcInputPartyId=reportSchedularData.getPartyId();
			String userName=reportSchedularData.getUser();
			String theme = reportSchedularData.getTheme();
			int	buId=reportSchedularData.getBuId();
			int createdBy = reportSchedularData.getCretaedBy();
			int partnerId = reportSchedularData.getPartnerId();
			int themeId = reportSchedularData.getThemeId();
			List<CodeValueData> codeValueDatas=commonService.getQueryPicklistValues("92", buId);
			for (CodeValueData codeValueData:codeValueDatas){
				String codevalue=codeValueData.getCodeValue();
				if(codeValueData.getCodeValue().trim().equals(theme)){
					themeId=codeValueData.getCodeValueId();
				}
			}
			
			String partnerLogoPath = reportSchedularData.getPartnerLogo();
			logger.info("partyId generateXrayReport==================="+dcInputPartyId);
			
			ModelAndView model=null;
			model = new ModelAndView("pages/utility/ShubhchintakDC/X-rayReport");
			
			
			
			List<QuestionData> lstQuestions = getQuestionsForXray(userName, dcInputPartyId, buId);
			int total = 0;
			boolean answered = false;
			for (QuestionData q : lstQuestions) {
				List<Integer> selectedOptions = new ArrayList<Integer>();
				for (OptionData op : q.getOptions()) {
					if (op.isSelected()) {
						answered = true;
						selectedOptions.add(op.getSeq());
						total += op.getScore();
					}
				}
			}
			//model.addAttribute("totalScore", total);
			model.addObject("totalScore",total);
			
			if(answered){
				
			try {
				
				DocumentRequest req = new DocumentRequest();
				req.setBuId(buId);
				req.setPartyId(dcInputPartyId);
				req.setRefTypeId(111020);
				req.setRefId(dcInputPartyId);
				List<DocumentData> docs=null;
				docs = documentService.getDocuments(req);
				final DocumentData  doc;
				File pdfFile = null ;
				if(!docs.isEmpty()){
					doc = docs.iterator().next();
					pdfFile = new File(doc.getFileStoragePathURI());
				}
				else{
					doc = new DocumentData();
				}
				
				if(pdfFile ==null || !pdfFile.exists()){
					doc.setDocumentStorageLocation(FiinfraUtility.getStorageCodeIdFromDocumentRefType(111020));
					
					String storagePath="";
					storagePath = documentService.getStoragePath(buId,dcInputPartyId,FiinfraUtility.getStorageCodeIdFromDocumentRefType(111020));
					doc.setFileStoragePathURI(storagePath);
					File basePath = new File(storagePath);
					File f = FiinfraUtility.ensureFolder(FiinfraUtility.ensureFolder(basePath, "FPT"),"" + dcInputPartyId);
					pdfFile = new File(f,dcInputPartyId + "_xray" + ".pdf");
				}
				
				
				{
//					QuestionService service = getBean(QuestionService.class);

					{
						//ProfileService profileService = getBean(ProfileService.class);
						//get information for party
						BaseResponse<Party> partyResponce = new BaseResponse<Party>();
						
						Party party = partyService.getParty(dcInputPartyId);
						
						party.setDobAsString(CommonUtils.format(party.getDob(), "dd-MMM-YYYY"));
						if(party.getAssociatedParties() != null){
							for(Party p:party.getAssociatedParties()){
								p.setDobAsString(CommonUtils.format(p.getDob(), "dd-MMM-YYYY"));
							}
						}
						
						
						String salutation = "";
						{
							
							List<CodeValueData> salutations ;
							salutations = commonService
								    .getQueryPicklistValues("81", buId);
									
							for (CodeValueData cd : salutations) {
								if (party.getSalutationId() != null
										&& cd.getCodeValueId() == party.getSalutationId()
												.intValue()) {
									salutation = cd.getCodeValue();
								}
							}
							request.setAttribute(
									"name",
									salutation + " . "
											+ CommonUtils.emptyIfNull(party.getFirstName())
											+ " "
											+ CommonUtils.emptyIfNull(party.getLastName()));
						}
						
						{
							//get information for owner party
							
							
							
							
							
							Party ownerParty = partyService.getParty(partnerId);
							
							
							if(ownerParty != null && !StringUtils.isEmpty(ownerParty.getFirstName())){
								//request.setAttribute("companyName", ownerParty.getCompanyName());
								request.setAttribute("companyName", ownerParty.getFirstName()+" "+ownerParty.getLastName());
							}
							else if(ownerParty != null){
								request.setAttribute("companyName", CommonUtils.emptyIfNull(ownerParty.getFirstName())
										+ " "
										+ CommonUtils.emptyIfNull(ownerParty.getLastName()));
								request.setAttribute("partnerLogo", partnerLogoPath);
							}
						}
					}

					Map<Integer, List<Integer>> answersMap = new HashMap<Integer, List<Integer>>();
					int counter = 0;
					 total = 0;
					for (QuestionData q : lstQuestions) {
						List<Integer> selectedOptions = new ArrayList<Integer>();
						StringBuilder sb = new StringBuilder();
						sb.append(" "+q.getQuestionId());
						for (OptionData op : q.getOptions()) {
							if (op.isSelected()) {
								sb.append("  ").append(op.getOptionId()).append("  ").append(" Score = ").append(op.getScore());
								selectedOptions.add(op.getSeq());
								total += op.getScore();
							}
						}
//						System.out.println(sb.toString());
						answersMap.put(q.getSeqNo(), selectedOptions);
						counter++;
					}
					for (int i = 1; i < 25; i++) {
						if (answersMap.containsKey(i)) {
							continue;
						}
						List<Integer> selectedOptions = new ArrayList<Integer>();
						answersMap.put(i, selectedOptions);

					}
					request.setAttribute("answersMap", answersMap);
					request.setAttribute("totalScore", total);
				}
				
				model.addObject("themeId",themeId);	
				model.addObject("ownerLogo",partnerLogoPath);
				request.setAttribute("baseUrl", getCurrentBaseURL(request));
				//convertToPDF("report/X-rayReport.jsp" ,request, response , pdfFile.getAbsolutePath());

//				doc.setFileName(pdfFile.getName());
//				doc.setFileStoragePathURI(pdfFile.getAbsolutePath());
//				doc.setPartyId(user.getPartyId());
//				doc.setRefTypeId(111020);
//				doc.setRefId(user.getPartyId());
//				doc.setBuId(user.getBuId());
//				doc.setDocumentName("Xray Report ");
//				doc.setCreatedBy(user.getUserId());
//				doc.setDocumentType(10001);
//				doc.setSectionId(24001);
//				doc.setDocumentStorageLocation(FiinfraUtility.getStorageCodeIdFromDocumentRefType(doc.getRefTypeId()));

				//doc.setDocumentId(docService.saveDocumentData(doc));
				
//				String saveDocURL = SAVE_DOCUMENT+user.getUserName()+"/2343";
//				UriComponentsBuilder uriCBDoc = UriComponentsBuilder.fromHttpUrl(saveDocURL);
//				uriCBDoc.queryParam("buId", user.getBuId());
//				BaseResponse<Integer> saveDcoResponse = new BaseResponse<Integer>();
//				saveDcoResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), doc, BaseResponse.class);
				
				
				
			} catch (Exception ex) {
			//	LOGGER.error("Error while generating Report", ex);
				ex.printStackTrace();
			}
			}
			//return "redirect:/xray/ThankYou";
	      return model;
	}
	@RequestMapping(value = "/doNotificationForXray", method = RequestMethod.GET)
	public void doNotificationForXray(HttpServletRequest request,HttpServletResponse response,ReportSchedularData reportSchedularData)throws IOException
	{
		logger.info("In doNotificationForXray APP");
		try{
		int dcInputPartyId=reportSchedularData.getPartyId();
		String userName=reportSchedularData.getUser();
		int	buId=reportSchedularData.getBuId();
		int documentId = reportSchedularData.getDocumentId();
		
		Notification notification=new Notification();
        Map<String,String> payloadMap=new HashMap<String, String>();
        payloadMap.put("user", userName);
//        payloadMap.put("Password",map.getValue());
        
        notification.setSourceSystemID(31006);
        notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
        notification.setNotifyPartyID(dcInputPartyId);
        notification.setNotifyEventID(FiinfraConstants.EVENT_CP_XRAY_REPORT);
        notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
        notification.setBuId(buId);
        notification.setPayloadMap(payloadMap);
        notification.setAttachmentCount(1);
        notification.setAttachmentPresent(true);
        notification.setAttachment1DocumentID(documentId);
        //notification.setSessionID(request.getSession().getId());
        notification.setSessionID("XYZ");
        
        FrameworkUtil.notify(notification);
		}catch(Exception e)
		{
			e.printStackTrace();
			logger.debug("IN Catch doNotificationForXray APP"+e.getMessage());
			logger.info("IN Catch doNotificationForXray APP"+e.getMessage());
		}
	}
	private String getCurrentBaseURL(HttpServletRequest request){
		  String baseUrl = "";
		  if ( ( request.getServerPort() == 80 ) ||
		           ( request.getServerPort() == 443 ) ){
		   baseUrl = request.getScheme() + "://" + request.getServerName() ;    
		  }
		  else{
		   baseUrl = request.getScheme() + "://" +
		           request.getServerName() + ":" + request.getServerPort();    
		  }
		  
		  return baseUrl;
		 }
	private List<QuestionData> getQuestionsForXray(String username,Integer partyID, Integer buID)
	 {

	  try {
	   List<QuestionData> questionList;
	   
	   
	   List<QuestionData> questionListjson = new ArrayList<QuestionData>(); // response.getResponseListObject(); 
	   questionList = new ArrayList<QuestionData>();
	   questionList =questionService.getQuestions(buID,31006,58001,partyID); // need to be removed hard coded value
	   
	   return questionList;
	  }catch (Exception e) {
	   // TODO Auto-generated catch block
	   
	  }
	  return null;
	 }
	//@RequestMapping(value = "/generate-report-analysis", method = RequestMethod.GET)
	//@RequestMapping(value = "/generate-report-analysis/{partyId}/{partnerPartyId}/{userName}/{buId}/{reportFor}", method = RequestMethod.POST)

	
	
//	@RequestMapping(value = "/generateAnalysisReportComprihencive1", method = RequestMethod.GET)
//	public String getGenerateReport1( HttpServletRequest request,ReportSchedularData reportSchedularData) {
//		System.out.println("partyId:-----"+reportSchedularData.getPartyId());
//		DCOutputData output;
//		output = dcService.showAnalysisReportPDF(reportSchedularData.getPartyId(),reportSchedularData.getBuId(),reportSchedularData.getCretaedBy());
//		System.out.println("Output in APP="+output); 
//		List<Integer> objSectionSpecificDcData = dcService.getSectionsToShowInDC(reportSchedularData.getPartyId(),reportSchedularData.getBuId());
//		System.out.println("Sections to show in Dc="+objSectionSpecificDcData);
//		String fpsection1= new String();
//		for(int i=0;i<objSectionSpecificDcData.size();i++)
//		{
//			fpsection1=fpsection1+" "+objSectionSpecificDcData.get(i);
//			
//		}
//		System.out.println("fpsection1="+fpsection1);
//		ModelAndView model=null;
//		model = new ModelAndView("utility/ShubhchintakDC/AnalysisReportDIY");
//		model.addObject("theme",reportSchedularData.getTheme());
//		model.addObject("output",output);
//		model.addObject("fpsection1",fpsection1);
//		
//		return "utility/ShubhchintakDC/AnalysisReportDIY";
//		//return model;
//		
//	}
	
	/*@RequestMapping(value = "/generateAnalysisReportComprihencive/{user}/{token}/{partyId}/{buId}/{ceratedBy}/{theme}")
	public String generateAnalysisReportComprihencive(Model model, HttpServletRequest request,@PathVariable String reportFor,
			@PathVariable String user,
			@PathVariable String token,
			@PathVariable int partyId,
			@PathVariable int buId,
			@PathVariable int createdBy,
			@PathVariable String theme) {
					
			//logger.debug("partyId:generateAnalysisReportComprihencive: APP---" + partyId+" "+"user name="+name);
			//Integer recordCount = dcService.updateLIMethod(partyId,buId,liMethodSelect,lastModifiedBy);
			
			DCOutputData output;
			output = dcService.showAnalysisReportPDF(partyId,buId,createdBy);
			System.out.println("Output in APP="+output); 
			List<Integer> objSectionSpecificDcData = dcService.getSectionsToShowInDC(partyId,buId);
			System.out.println("Sections to show in Dc="+objSectionSpecificDcData);
			String fpsection1= new String();
			for(int i=0;i<objSectionSpecificDcData.size();i++)
			{
				fpsection1=fpsection1+" "+objSectionSpecificDcData.get(i);
				
			}
			System.out.println("fpsection1="+fpsection1);
			
			model.addObject("theme",theme);
			model.addObject("output",output);
			model.addObject("fpsection1",fpsection1);
			
			return "utility/ShubhchintakDC/AnalysisReportDIY";
		}*/
//		@GET
//		@Produces(MediaType.APPLICATION_JSON)
//		@Path("/generateAnalysisReportComprihencive/{user}/{token}")
////		@RequestMapping(value = "/generateAnalysisReportComprihencive/{userName}/{token}", method = RequestMethod.GET)
//		public  Response generateAnalysisReportComprihencive(@QueryParam("partyId") int partyId,@QueryParam("buId") int buId,
//				@QueryParam("createdBy") int createdBy,@QueryParam("theme") String theme, 
//				@PathParam("token") String token, @PathParam("user") String name)throws JsonGenerationException, JsonMappingException, IOException {
//			//logger.debug("partyId:generateAnalysisReportComprihencive: APP---" + partyId+" "+"user name="+name);
//			//Integer recordCount = dcService.updateLIMethod(partyId,buId,liMethodSelect,lastModifiedBy);
//			
//			DCOutputData output;
//			output = dcService.showAnalysisReportPDF(partyId,buId,createdBy);
//			System.out.println("Output in APP="+output); 
//			List<Integer> objSectionSpecificDcData = dcService.getSectionsToShowInDC(partyId,buId);
//			System.out.println("Sections to show in Dc="+objSectionSpecificDcData);
//			String fpsection1= new String();
//			for(int i=0;i<objSectionSpecificDcData.size();i++)
//			{
//				fpsection1=fpsection1+" "+objSectionSpecificDcData.get(i);
//				
//			}
//			System.out.println("fpsection1="+fpsection1);
//			/*ModelAndView mav=null;
//			mav = new ModelAndView("utility/ShubhchintakDC/AnalysisReportDIY");
//			mav.addObject("themeName", theme);
//			mav.addObject("output", output);
//			mav.addObject("fpsection1", fpsection1);*/
////			model.addObject("theme",theme);
////			model.addObject("output",output);
////			model.addObject("fpsection1",fpsection1);
//			
//			//return mav;// new ModelAndView("common/query", "queryDatas",
//			//return "utility/ShubhchintakDC/AnalysisReportDIY";
//			return response;
//		}
	
	
		@RequestMapping(value = "/generateAnalysisReportComprihencive", method = RequestMethod.GET)
		public ModelAndView generateAnalysisReportComprihencive(HttpServletRequest request,
				HttpServletResponse response,ReportSchedularData reportSchedularData)throws IOException
		{
			  	int dcInputPartyId=reportSchedularData.getPartyId();
				String userName=reportSchedularData.getUser();
				String theme = reportSchedularData.getTheme();
				int	buId=reportSchedularData.getBuId();
				int createdBy = reportSchedularData.getCretaedBy();
				int partnerId = reportSchedularData.getPartnerId();
				logger.info("partyId==================="+dcInputPartyId);
				DCOutputData output;
				output = dcService.getComprehensiveReportPDF(dcInputPartyId,buId,createdBy);
				System.out.println("Output in APP="+output); 
				
				
				GoalPlanInput goalPlanInput = new GoalPlanInput();
				
				goalPlanInput.setBuPartyId(buId);
				goalPlanInput.setPartnerPartyId(output.getOwnerPartyId());
				goalPlanInput.setSectionTypeId(39005); // 47010  - goal planning (need constant )
				String assetClassId = "46001,46002,46003"; //code valued id for Equity (93002), Debt (93001)  and Gold (93003)
				goalPlanInput.setAssetClassId(assetClassId);
				 
				goalPlanInput.setRiskProfileId(output.getRiskProfileid());
				Integer recordTypeId= 50001;
				goalPlanInput.setRecommendationRecordTypeId(recordTypeId);
				List<KeyValue> interestdFp = new ArrayList<KeyValue>();
				List<AdviceRecommendation> recommendations = goalPlanService.getRecommendationForAsset(goalPlanInput);
				
				Map<String, List<AdviceRecommendation>> riskProfileMap=buildYearWiseMap(recommendations);
				interestdFp =  partnerService.getInterstedFpSection(output.getOwnerPartyId(), dcInputPartyId);
				
				
				List<UserData> userDetails = dcService.getFamilyMemberList(dcInputPartyId,buId);
				List<QuestionDetails> questionDetails = dcService.getFinancialStatusList(dcInputPartyId,buId,0);
				List<QuestionDetails> riskCoverDetails = new ArrayList<>();
				List<QuestionDetails> emergencyDetails = new ArrayList<>();
				List<QuestionDetails> retirementDetails = new ArrayList<>();
				for (QuestionDetails questionDetails2 : questionDetails) {
					switch (questionDetails2.getSectionType()) {
					case 39003:
						riskCoverDetails.add(questionDetails2);
						break;
					case 39001:
						emergencyDetails.add(questionDetails2);
						break;
					case 39006:
						retirementDetails.add(questionDetails2);
						break;
					default :
						break;
					}
				}
				
				ComprehensiveData comprehensiveData = new ComprehensiveData();
				String whatkindRisk="";
				String familyRisk="";
				String ratingRisk="";
				String liAmt="";
				String healthAmt="";
				String criticalAmt="";
				String accidentAmt="";
				String doLi="";
				String dohealth="";
				String docritical="";
				String doAccident="";
				String doAsset="";
				String codeId="";
				String assetAmt="";
				Integer code;
				for (QuestionDetails questionRisk : riskCoverDetails) {
					if(questionRisk.getAttributeCodeId() == 94012 && !codeId.contains("94012")){
						ratingRisk=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94013 && !codeId.contains("94013")){
						doLi = questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94143){
						if(whatkindRisk.equals("")){
							whatkindRisk = questionRisk.getAttributeValue();
						}else{
							whatkindRisk = whatkindRisk+","+questionRisk.getAttributeValue();
						}
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94018 && !codeId.contains("94018")){
						liAmt=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94020 && !codeId.contains("94020")){
						dohealth=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94019 && !codeId.contains("94019")){
						healthAmt = questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94025 && !codeId.contains("94025")){
						docritical=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94024 && !codeId.contains("94024")){
						criticalAmt=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94106 && !codeId.contains("94106")){
						doAccident=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94107 && !codeId.contains("94107")){
						accidentAmt = questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94108 && !codeId.contains("94108")){
						doAsset=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94226 && !codeId.contains("94226")){
						assetAmt=questionRisk.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRisk.getAttributeCodeId() == 94021 && !codeId.contains("94021")){
						if(codeId.equals("")){
							code = questionRisk.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRisk.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
						for (UserData userData:userDetails){
							Integer partyId=userData.getPartyId();
							String name = userData.getName();
							if(questionRisk.getAttributeValue().equals(partyId.toString())){
								if(familyRisk.equals("")){
									familyRisk = name;
								}else{
									familyRisk = familyRisk+","+name;
								}
							}
						}
					}
				}
				comprehensiveData.setLifeKind(whatkindRisk);
				comprehensiveData.setFamilyCover(familyRisk);
				comprehensiveData.setRatingRisk(ratingRisk==""?"0":ratingRisk);
				comprehensiveData.setLifeAmount(liAmt==""?"0":liAmt);
				comprehensiveData.setHealthAmt(healthAmt==""?"0":healthAmt);
				comprehensiveData.setCriticalAmt(criticalAmt==""?"0":criticalAmt);
				comprehensiveData.setAccidentAmt(accidentAmt==""?"0":accidentAmt);
				comprehensiveData.setDoLife(doLi==""?"0":doLi);
				comprehensiveData.setDoHealth(dohealth==""?"0":dohealth);
				comprehensiveData.setDoCritical(docritical==""?"0":docritical);
				comprehensiveData.setDoAccident(doAccident==""?"0":doAccident);
				comprehensiveData.setDoAsset(doAsset==""?"0":doAsset);
				comprehensiveData.setAssetAmt(assetAmt==""?"0":assetAmt);
				Integer lifeCount = 0;
				Integer healthCount = 0;
				Integer criticalCount = 0;
				Integer accidentCount = 0;
				List<Document> documentList;
				if(output.getDocumentList() != null){
					documentList = output.getDocumentList();
					for (Document document : documentList) {
						if(document.getDocumentId() == 47007){
							lifeCount++;
						}
						if(document.getDocumentId() == 48026){
							healthCount++;
						}
						if(document.getDocumentId() == 48027){
							criticalCount++;
						}
						if(document.getDocumentId() == 48025){
							accidentCount++;
						}
					}
				}
				
				String emerRating="";//AttrCode94001
				String emerSituation="";//AttrCode94002
				String emerFaced="";//AttriCode94137-AttriValue94003,94004,94004,94005,94006,94007
				String emerAsset="";//AttrCode94008
				String emerMonths="";//AttrCode94009
				String emerFallBack="";//AttrCode94513AttrVal94517,94518,94519,94520,if 94520 attriRefValue
				String emerFallBackOther="";
				codeId="";
				for (QuestionDetails questionEmer : emergencyDetails) {
					if(questionEmer.getAttributeCodeId() == 94001 && !codeId.contains("94001")){
						emerRating = questionEmer.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionEmer.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionEmer.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionEmer.getAttributeCodeId() == 94002 && !codeId.contains("94002")){
						emerSituation = questionEmer.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionEmer.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionEmer.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionEmer.getAttributeCodeId() == 94137){
						if(emerFaced.equals("")){
							emerFaced = questionEmer.getAttributeValue();
						}else{
							emerFaced = emerFaced+","+questionEmer.getAttributeValue();
						}
					}else if(questionEmer.getAttributeCodeId() == 94008 && !codeId.contains("94008")){
						emerAsset = questionEmer.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionEmer.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionEmer.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionEmer.getAttributeCodeId() == 94009 && !codeId.contains("94009")){
						emerMonths = questionEmer.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionEmer.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionEmer.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionEmer.getAttributeCodeId() == 94513 && !codeId.contains("94513")){
						emerFallBack = questionEmer.getAttributeValue();
						if( emerFallBack.equals("94520") ){
							emerFallBackOther = questionEmer.getAttributeRefferenceValue();
						}
						if(codeId.equals("")){
							code = questionEmer.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionEmer.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}
				}
				
				comprehensiveData.setEmerRating(emerRating==""?"0":emerRating);
				comprehensiveData.setEmerSituation(emerSituation==""?"2":emerSituation);
				comprehensiveData.setEmerFaced(emerFaced==""?"0":emerFaced);
				comprehensiveData.setEmerAsset(emerAsset==""?"2":emerAsset);
				comprehensiveData.setEmerMonths(emerMonths==""?"6":emerMonths);
				comprehensiveData.setEmerFallBack(emerFallBack==""?"0":emerFallBack);
				comprehensiveData.setEmerFallBackOther(emerFallBackOther==""?"":emerFallBackOther);
				
				String retRating = "";
				String retAge = "";
				String retAccessMoney = "";
				String retBenefits = "";
				String retInvestment1 = "";
				String retInvestment2 = "";
				String retInvestment3 = "";
				String retInvestment4 = "";
				String retInvestment = "";
				String retRegular1 = "";
				String retRegular2 = "";
				String retRegular3 = "";
				String retRegular4 = "";
				String retRegular = "";
				String retExpense = "";
				codeId="";
				for (QuestionDetails questionRet  : retirementDetails) {
					if(questionRet.getAttributeCodeId() == 94043 && !codeId.contains("94043")){
						retRating = questionRet.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRet.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRet.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRet.getAttributeCodeId() == 94044 && !codeId.contains("94044")){
						retAge = questionRet.getAttributeValue();
						if(codeId.equals("")){
							code = questionRet.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRet.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRet.getAttributeCodeId() == 94045 && !codeId.contains("94045")){
						retAccessMoney = questionRet.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRet.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRet.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRet.getAttributeCodeId() == 94147){
						if(retBenefits.equals("")){
							retBenefits = questionRet.getAttributeValue();
						}else{
							retBenefits = retBenefits+","+questionRet.getAttributeValue();
						}
						if(codeId.equals("")){
							code = questionRet.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRet.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}else if(questionRet.getAttributeCodeId() == 94148){
						if(questionRet.getAttributeValue().equals("94051") && !codeId.contains("94051")){
							retInvestment1 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
						if(questionRet.getAttributeValue().equals("94052") && !codeId.contains("94052")){
							retInvestment2 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
						if(questionRet.getAttributeValue().equals("94053") && !codeId.contains("94053")){
							retInvestment3 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
						if(questionRet.getAttributeValue().equals("94054") && !codeId.contains("94054")){
							retInvestment4 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
					}else if(questionRet.getAttributeCodeId() == 94165){
						if(questionRet.getAttributeValue().equals("94055") && !codeId.contains("94055")){
							retRegular1 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
						if(questionRet.getAttributeValue().equals("94056") && !codeId.contains("94056")){
							retRegular2 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
						if(questionRet.getAttributeValue().equals("94057") && !codeId.contains("94057")){
							retRegular3 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
						if(questionRet.getAttributeValue().equals("94058") && !codeId.contains("94058")){
							retRegular4 = questionRet.getAttributeRefferenceValue();
							if(codeId.equals("")){
								codeId = questionRet.getAttributeValue();
							}else{
								codeId = codeId+","+questionRet.getAttributeValue();
							}
						}
					}else if(questionRet.getAttributeCodeId() == 94511 && !codeId.contains("94511")){
						retExpense = questionRet.getAttributeRefferenceValue();
						if(codeId.equals("")){
							code = questionRet.getAttributeCodeId();
							codeId = code.toString();
						}else{
							code = questionRet.getAttributeCodeId();
							codeId = codeId+","+code.toString();
						}
					}
				}
				
				retRating = retRating==""?"0":retRating;
				retAge = retAge==""?"0":retAge;
				retInvestment1 = retInvestment1==""?"0":retInvestment1;
				retInvestment2 = retInvestment2==""?"0":retInvestment2;
				retInvestment3 = retInvestment3==""?"0":retInvestment3;
				retInvestment4 = retInvestment4==""?"0":retInvestment4;
				retInvestment = retInvestment1+","+retInvestment2+","+retInvestment3+","+retInvestment4;
				retRegular1 = retRegular1==""?"0":retRegular1;
				retRegular2 = retRegular2==""?"0":retRegular2;
				retRegular3 = retRegular3==""?"0":retRegular3;
				retRegular4 = retRegular4==""?"0":retRegular4;
				retRegular = retRegular1+","+retRegular2+","+retRegular3+","+retRegular4;
				retExpense = retExpense==""?"100":retExpense;
				
				comprehensiveData.setRetRating(retRating);
				comprehensiveData.setRetAge(retAge);
				comprehensiveData.setRetAccessMoney(retAccessMoney);
				comprehensiveData.setRetBenefits(retBenefits);
				comprehensiveData.setRetInvestment(retInvestment);
				comprehensiveData.setRetRegular(retRegular);
				comprehensiveData.setRetExpense(retExpense);
				
				Double totalAssetAdv = 0.0;
				Double totalLoanAdv = 0.0;
				Double netWorthAdv = 0.0;
				
				if(output.getFpplanTypeId() == 522002){
					List<JsonData> jsonDataList = output.getJsonDataList();
					for (JsonData jsonData : jsonDataList) {
						totalAssetAdv = totalAssetAdv + Double.parseDouble(jsonData.getText());
					}
					List<GoalAttribute> goalAttributeList = output.getGoalAttributeList();
					for (GoalAttribute goalAttribute : goalAttributeList) {
						totalLoanAdv = totalLoanAdv + Double.parseDouble(goalAttribute.getAttributeValue());
					}
				}else{
					List<ProductData> dataList = output.getRetirementList();
					for (ProductData productData : dataList) {
						totalAssetAdv = totalAssetAdv + Double.parseDouble(productData.getMinLumpSumAmount());
					}
					totalLoanAdv = Double.parseDouble(output.getInvestmentValue()==null?"0.0":output.getInvestmentValue());
				}
				
				netWorthAdv = totalAssetAdv - totalLoanAdv;
				
				ModelAndView model=null;
				model = new ModelAndView("pages/utility/ShubhchintakDC/analysis_comprehensive");
				model.addObject("theme",theme);
				model.addObject("output",output);
				model.addObject("fpSection",interestdFp.get(0).getName());
				model.addObject("riskProfileMap",riskProfileMap);
				model.addObject("buId",buId);
				model.addObject("totalLoanAdv",totalLoanAdv);
				model.addObject("totalAssetAdv",totalAssetAdv);
				model.addObject("netWorthAdv",netWorthAdv);
				model.addObject("lifeCount",lifeCount);
				model.addObject("healthCount",healthCount);
				model.addObject("criticalCount",criticalCount);
				model.addObject("accidentCount",accidentCount);
				model.addObject("userDetails",objectMapper.writeValueAsString(userDetails));
				model.addObject("comprehensiveDetails",comprehensiveData);
				
				CashFlowData cashFlowData = new CashFlowData();
				cashFlowData = analysisService.getAnalysisForCashFlowData(dcInputPartyId);
				
				model.addObject("cashFlowData",cashFlowData);
				
				//return "utility/ShubhchintakDC/AnalysisReportDIY";
				return model;
		      
		}
	
	}
	
		

