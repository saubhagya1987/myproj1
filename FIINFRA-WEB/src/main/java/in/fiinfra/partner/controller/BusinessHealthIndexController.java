package in.fiinfra.partner.controller;

import in.fiinfra.common.common.ChartData;
import in.fiinfra.common.diy.models.BusinessHealthIndex;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/businessHealthIndex")
public class BusinessHealthIndexController {

	private static final Logger LOGGER = Logger.getLogger(BusinessHealthIndexController.class);
	
	@Autowired
	RestTemplate restTemplate;
	
	@Autowired
	private ObjectMapper objectMapper;
	
	@Value("${URL_GET_BUSINESS_HEALTH_INDEX}")
	private String URL_GET_BUSINESS_HEALTH_INDEX;
	
	@Value("${URL_SAVE_BUSINESS_HEALTH_INDEX}")
	private String URL_SAVE_BUSINESS_HEALTH_INDEX;
	
	@Value("${GET_CHART_DATA_LIST}")
	private String GET_CHART_DATA_LIST;
	
	@Value("${GET_IFA_CLASSIFICATION}")
	private String GET_IFA_CLASSIFICATION;
	
	@RequestMapping(value = "/zimmedariMeter", method = RequestMethod.GET)
	public String loadZimmedariMeter(Model model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}

		Integer buId = userSession.getBuId();
		Integer partyId = userSession.getPartyId();
		String chartType = "ZimmedariScore";
		
		Integer chartCount = getDataForChart(buId, partyId, chartType,userSession.getUserName());
		
		model.addAttribute("chartCount",chartCount);
		
		String url = GET_IFA_CLASSIFICATION +"/"+ partyId + "/" + userSession.getUserName() + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		BaseResponse<String> br = new BaseResponse<String>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		String IFAClass = "";
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			IFAClass = br.getResponseObject().toString();
		}
			
		model.addAttribute("IFAClass",IFAClass);
		
		return "setup/zimmedariMeter";
	}
	
	@RequestMapping(value = "/zimmedariMeterQuestionnaire", method = RequestMethod.GET)
	public String loadZimmedariMeterQuestionnaire(Model model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "redirect:/login";
		}
		
		String userName = userSession.getUserName();
		String token = "12345";
		Integer buId = userSession.getBuId();
		Integer partyId = userSession.getPartyId();

		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(URL_GET_BUSINESS_HEALTH_INDEX+ "/" + userName + "/" + token + "/" + partyId +"?buId="+buId);
		BaseResponse<BusinessHealthIndex> baseResponse = new BaseResponse<BusinessHealthIndex>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.getForObject(FiinfraUtility.getURLWithParams(uriCB), BaseResponse.class);
		
		List<BusinessHealthIndex> businessHealthIndexListAsJson = new ArrayList<BusinessHealthIndex>();
		List<BusinessHealthIndex> businessHealthIndexList = new ArrayList<BusinessHealthIndex>();
		BusinessHealthIndex businessHealthIndex = new BusinessHealthIndex();
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			
			try {
				businessHealthIndexListAsJson = objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()), List.class);
				
				for(int i = 0; i<businessHealthIndexListAsJson.size(); i++){
					
					businessHealthIndex = new BusinessHealthIndex();
					businessHealthIndex = objectMapper.readValue(objectMapper.writeValueAsString(businessHealthIndexListAsJson.get(i)), BusinessHealthIndex.class);					
					businessHealthIndexList.add(businessHealthIndex);
					
					if(i==0){
						model.addAttribute("qBankId",businessHealthIndex.getQBankId());
					}
					
				}
			}catch (JsonParseException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (JsonGenerationException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				LOGGER.error(e);
			}
		}
		
		model.addAttribute("businessHealthIndexList",businessHealthIndexList);
		
		return "setup/zimmedariMeterQuestionnaire";
	}
	
	@RequestMapping(value = "/saveZimmedariMeterQuestionnaire", method = RequestMethod.GET)
	public @ResponseBody String saveZimmedariMeterQuestionnaire(Model model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return "error";
		}
		
		String answerList = request.getParameter("answerList");
		String qBankId = request.getParameter("qBankId");
		
		String[] answerArray = answerList.split(",");
		
		String[] pieces = null;
		
		Integer partyId = userSession.getPartyId();
		
		BusinessHealthIndex businessHealthIndex = new BusinessHealthIndex();
		List<BusinessHealthIndex> businessHealthIndexList = new ArrayList<BusinessHealthIndex>();
		
		for(int i=0;i<answerArray.length;i++){
			
			businessHealthIndex = new BusinessHealthIndex();
			pieces = answerArray[i].split("_");
			businessHealthIndex.setQuestionId(Integer.parseInt(pieces[0]));
			businessHealthIndex.setQuestionOptionID(Integer.parseInt(pieces[1]));
			businessHealthIndex.setPartyId(partyId);
			businessHealthIndex.setQBankId(Integer.parseInt(qBankId));
			businessHealthIndexList.add(businessHealthIndex);
			
		}
		
		String userName = userSession.getUserName();
		String token = "12345";
		Integer buId = userSession.getBuId();		
		
		UriComponentsBuilder uriCB;
		uriCB = UriComponentsBuilder.fromHttpUrl(URL_SAVE_BUSINESS_HEALTH_INDEX+ "/" + userName + "/" + token +"?buId="+buId);
		BaseResponse<Boolean> baseResponse = new BaseResponse<Boolean>();
		
		//call service for all parties associated 
		baseResponse = restTemplate.postForObject(FiinfraUtility.getURLWithParams(uriCB), businessHealthIndexList  ,BaseResponse.class);
		
		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)){
			return "success";
		}else{
			return "failure";
		}
	
		//return "redirect:/businessHealthIndex/zimmedariMeter";
	}	
	
	public Integer getDataForChart(Integer buId, Integer partyId, String chartType, String userName) throws IOException {
		String url = GET_CHART_DATA_LIST + userName + "/1234";
		UriComponentsBuilder uriCB = UriComponentsBuilder.fromHttpUrl(url);
		uriCB.queryParam("buId", buId);
		uriCB.queryParam("partyId", partyId);
		uriCB.queryParam("chartType", chartType);
		BaseResponse<ChartData> br = new BaseResponse<ChartData>();
		br = restTemplate.getForEntity(FiinfraUtility.getURLWithParams(uriCB),
				BaseResponse.class).getBody();
		List<ChartData> chartDataList = null;
		if (br.getStatus().equalsIgnoreCase(FiinfraConstants.success))
			chartDataList = br.getResponseListObject();
		int d= chartDataList.size();
		List<ChartData> charDataValues = new ArrayList<ChartData>();
		for(int i = 0; i<chartDataList.size(); i++){
			ChartData chartData = objectMapper.readValue(objectMapper.writeValueAsString(chartDataList.get(i)), ChartData.class);
			charDataValues.add(chartData);
		}
		if(!charDataValues.isEmpty()){
			ChartData data = charDataValues.get(0);
			return data.getCount();
		}else{
			return 0;
		}
		
		
	}
	
}
