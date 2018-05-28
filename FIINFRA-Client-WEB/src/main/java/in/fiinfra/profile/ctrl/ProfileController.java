package in.fiinfra.profile.ctrl;

import in.fiinfra.auth.service.UserService;
import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.common.BaseRequest;
import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.PartyAttribute;
import in.fiinfra.common.diy.models.PasswordPolicy;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.common.util.FrameworkUtil;
import in.fiinfra.common.utility.GoalData;
import in.fiinfra.cp.AssetData;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.cp.GupShupData;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.cp.common.ctrl.AbstractController;
import in.fiinfra.cp.common.model.PortfolioRequest;
import in.fiinfra.cp.common.model.ProfileRequest;
import in.fiinfra.cp.common.service.CommonService;
import in.fiinfra.cp.common.util.AuthHandler;
import in.fiinfra.cp.common.util.Link;
import in.fiinfra.document.service.DocumentService;
import in.fiinfra.framework.models.Audit;
import in.fiinfra.portfolio.service.PortfolioService;
import in.fiinfra.profile.service.PasswordService;
import in.fiinfra.profile.service.ProfileService;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/profile")
public class ProfileController extends AbstractController {

	@Value("${app.image.path}")
	private String APP_IMAGE_PATH;

	@Autowired
	RestTemplate restTemplate;

	@Autowired
	Md5PasswordEncoder passwordEncoder;

	private static String CHANGE_PASSWORD_SOUECE = "Change Password";

	@Value("${RESET_PASSWORD}")
	private String resetPasswordUrl;

	@Value("${PASSWORD_POLICY}")
	private String passwordPolicyurl;

	@Autowired
	private ObjectMapper objectMapper;


	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showDashboard(Model m) {
		return "redirect:/profile/home";
	}

	@Link(label="Home", family="Dashboard", parent = "" )
	@RequestMapping(value = "/home", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String showHome(Model m) {
		CommonService service = getBean(CommonService.class);
		UserSession user = AuthHandler.getCurrentUser();
		if (user.isFirstLogin()) {
			return "cp/terms";
		}
		if(user.getIsForceChangePasswordOnLogin()){
			return "redirect:/profile/password";
		}
		m.addAttribute("doNotShowHome", true);
		m.addAttribute("alertCount", service.getAlertCount(user.getPartyId()));
		return "cp/dashboard";
	}

	@RequestMapping(value = "/terms/agree", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String agreeTerms(Model m, HttpServletRequest request) {
		UserSession user = AuthHandler.getCurrentUser();
		UserAccessLog accessLog = new UserAccessLog();
		accessLog.setUserId(user.getUserId());
		accessLog.setLoginAccessModeId(FiinfraConstants.LOGIN_ACCESS_MODE_STANDARD);
		accessLog.setEnteredPassword("");
		accessLog.setLoginSuccessful(1);
		accessLog.setRedirectUrl(request.getRequestURL().toString());
		accessLog.setSessionId(request.getRequestedSessionId());
		accessLog.setSourceIPAddress(request.getRemoteAddr());
		//accessLog.setSourceSystemId(31006);
		UserService service = getBean(UserService.class);
		service.saveUserAccessLog(accessLog,user);
		UserSession userLatest = service.getUserByToken(user.getUserName(), request.getRemoteAddr());
		
		user.setFirstLogin(userLatest.isFirstLogin());
		
		return "redirect:/profile/home";
	}
	
	 @RequestMapping(value = "/terms/disagree", method = { RequestMethod.GET,
			   RequestMethod.POST })
	public String disAgreeTerms(Model m) {
			  return "redirect:/sign-out";
	}

	@RequestMapping(value = "/gupshup", method = { RequestMethod.GET })
	public String getGupshup(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		CommonService common = getBean(CommonService.class);
		request.setPage(1);
		request.setRows(2);
		List<GupShupData> lst = common.getListOfGupShup(request);
		m.addAttribute("lst", lst);

		return "widget/gupshup";
	}

	@RequestMapping(value = "/testimonial", method = { RequestMethod.GET })
	public String getTestimonial(BaseRequest request, Model m) {
		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		request.setRows(2);
		request.setPage(1);
		CommonService common = getBean(CommonService.class);
		List<TestimonialData> lst = common.getListOfTestimonials(request);
		m.addAttribute("lst", lst);
		return "widget/testimonial";
	}

	@RequestMapping(value = "/videos", method = { RequestMethod.GET })
	public String getVideos(HttpServletRequest request) {
		return "widget/videos";
	}

	@Link(label="My Profile", family="My Profile", parent = "" ) 
	@RequestMapping(value = "/", method = { RequestMethod.GET })
	public String showProfile(ProfileRequest request, Model m) {

		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());

		ProfileService service = getBean(ProfileService.class);

		Party party = service.getProfile(request);
		populateProfileFormData(m, request, party);
		m.addAttribute("party", party);

		return "cp/profile";

	}

	@RequestMapping(value = "/image", method = { RequestMethod.GET })
	public String profileImage(Model m) {

		m.addAttribute("documentData", new DocumentData());

		return "prof/image";

	}

	@RequestMapping(value = "/image/save", method = { RequestMethod.POST })
	public String saveProfileImage(HttpServletRequest servletRequest,
			DocumentData doc, Model m) {

		int x = CommonUtils.toInt(servletRequest.getParameter("x"));
		int y = CommonUtils.toInt(servletRequest.getParameter("y"));
		int w = CommonUtils.toInt(servletRequest.getParameter("w"));
		int h = CommonUtils.toInt(servletRequest.getParameter("h"));

		UserSession user = AuthHandler.getCurrentUser();
		long currentTime = Calendar.getInstance().getTimeInMillis();

		ProfileService service = getBean(ProfileService.class);
		DocumentService documentService = getBean(DocumentService.class);

		if (doc != null && doc.getDocumentAttachment() != null) {
			String storagePathLocation = APP_IMAGE_PATH;
			// File storagePath= FiinfraUtility.saveImage(new
			// File(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/resources/images"),
			// "user-images/"+profileData.getPartyId(), image, 180,180);
			File storagePath = FiinfraUtility.saveImage(new File(
					storagePathLocation),
					"images/user-images/" + user.getPartyId(), doc
							.getDocumentAttachment(), 900, 300, x, y, w, h);

			if (storagePath != null) {

				String imagePath = "images/user-images/" + user.getPartyId()
						+ "/" + storagePath.getName();
				doc.setPartyId(user.getPartyId());
				doc.setDocumentType(10002);
				doc.setSectionId(10002);
				doc.setFileTypeId(11003);
				doc.setCreatedBy(user.getUserId());
				doc.setFileStoragePathURI(storagePath.getAbsolutePath());
				doc.setFileName(storagePath.getName());
				doc.setDocumentStorageLocation(98083);
				doc.setFileStoragePathURI(imagePath);
				
				Integer docId;
				try {
					ProfileRequest req = new ProfileRequest();
					req.setPartyId(user.getPartyId());
					Party party = service.getProfile(req);

					doc.setDocumentAttachment(null);
					// Send RefType RefId
					doc.setRefId(party.getId());
					doc.setRefTypeId(111001);
					docId = documentService.saveDocumentData(doc);
					if (docId != null) {

						PartyAttribute attrb = new PartyAttribute();
						attrb.setAttributeCodeID(91112);
						attrb.setAttributeValue(docId.toString());
						attrb.setPartyId(user.getPartyId());
						attrb.setAttributeSeqNo(1);
						attrb.setValueDataTypeID(37002);
						attrb.setCreatedBy(user.getUserId());
						party.getPartyAttributes().add(attrb);

						party.getAssociatedParties().clear();

						party.getAddressList().clear();
						boolean saved = service.saveProfile(party);
						if (saved) {
							user.setDashboardPhoto(doc.getFileStoragePathURI());
						}
					}

				} catch (Exception e) {

					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}
		// Party party = service.getProfile(request);
		// party.getPartyAttributes().add(e)
		// populateProfileFormData(m, request, party);

		return "redirect:/profile/dashboard";

	}

	@RequestMapping(value = "/password", method = { RequestMethod.GET })
	public String showPassword(ProfileRequest request, Model m) {

		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		return "redirect:/profile/";
	}

	@RequestMapping(value = "/document", method = { RequestMethod.GET })
	public String showDocument(ProfileRequest request, Model m) {

		UserSession user = AuthHandler.getCurrentUser();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		return "cp/document";
	}

	public void populateProfileFormData(Model m, ProfileRequest request,
			Party party) {

		ProfileService service = getBean(ProfileService.class);
		List<KeyValue> countires = toKeyValue(service.getCodeValue("3"));
		Collections.sort(countires);

		List<KeyValue> occupations = toKeyValue(service.getCodeValue("65"));
		occupations.add(0, new KeyValue(0, "--Select--"));
		m.addAttribute("occupations", occupations);
		m.addAttribute("maritalStatus", service.getCodeValue("13"));
		List<KeyValue> relations = toKeyValue(service.getCodeValue("26"));
		relations.add(0, new KeyValue(-1, "--Relation--"));
		m.addAttribute("relations", relations);
		m.addAttribute("salutations", service.getCodeValue("81"));
		List<KeyValue> states = toKeyValue(service.getCodeValue("2"));
		Collections.sort(states);
		if (!party.getAddressList().isEmpty()) {
			Integer selectedState1 = party.getAddressList().get(0).getStateId();
			if (selectedState1 == null || selectedState1 <= 0) {
				selectedState1 = states.get(0).getId();
			}
			request.setParentId(Integer.toString(selectedState1));
			List<KeyValue> cities = toKeyValue(service.getCityList(request));
			cities.add(0,new KeyValue(0,"--Select--") );
			m.addAttribute("cities", cities);
		}
		countires.add(0,new KeyValue(0,"--Select--") );
		m.addAttribute("countries", countires);
		states.add(0,new KeyValue(0,"--Select--") );
		m.addAttribute("states", states);

	}

	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public String saveProfile(Model m, Party party,
			HttpServletRequest servletRequest,
			final RedirectAttributes redirectAttributes) throws ParseException {
		ProfileService service = getBean(ProfileService.class);
		UserSession user = AuthHandler.getCurrentUser();
		// Enumeration<String> enu = servletRequest.getParameterNames();
		// while(enu.hasMoreElements()){
		// String key = enu.nextElement();
		// System.out.println(key +" =  "+servletRequest.getParameter(key));
		// }

		ProfileRequest request = new ProfileRequest();
		request.setPartyId(party.getId());
        
		Party partyOld = service.getProfile(request);

		partyOld.setCompanyName(party.getCompanyName());
		partyOld.setWorkDesignation(party.getWorkDesignation());
		partyOld.setWorkProfession(party.getWorkProfession());
		partyOld.setContactEmail1(party.getContactEmail1());
		partyOld.setContactMobile1(party.getContactMobile1());
		partyOld.setContactMobile2(party.getContactMobile2());
		partyOld.setFirstName(party.getFirstName());
		partyOld.setLastName(party.getLastName());
		partyOld.setSalutationId(party.getSalutationId());
		partyOld.setPanNumber(party.getPanNumber());
		partyOld.setMaritalStatusID(party.getMaritalStatusID());
		partyOld.setGenderId(party.getGenderId());
		partyOld.setCreatedBy(party.getId());
		partyOld.setDobAsString(party.getDobAsString());
		Date bdt = new SimpleDateFormat("dd-MMM-yyyy").parse(party
				.getDobAsString());
		if (bdt != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(bdt);
			partyOld.setDob(new Timestamp(cal.getTimeInMillis()));
			partyOld.setAge(CommonUtils.getAge(partyOld.getDob()));
		}

		
		DocumentData doc = null;
		if(party.getImage() != null && !party.getImage().isEmpty()){
			DocumentService documentService = getBean(DocumentService.class);
			String storagePathLocation = APP_IMAGE_PATH;
			
			int x = CommonUtils.toInt(servletRequest.getParameter("x"));
			int y = CommonUtils.toInt(servletRequest.getParameter("y"));
			int w = CommonUtils.toInt(servletRequest.getParameter("w"));
			int h = CommonUtils.toInt(servletRequest.getParameter("h"));

				File storagePath = FiinfraUtility.saveImage(new File(
						storagePathLocation),
						"images/user-images/" + user.getPartyId(), party.getImage(), 150, 150,x, y, w, h);

				if (storagePath != null) {
					doc  = new DocumentData();

					String imagePath = "images/user-images/" + user.getPartyId()
							+ "/" + storagePath.getName();
					doc.setPartyId(user.getPartyId());
					doc.setDocumentType(10002);
					doc.setSectionId(10002);
					doc.setFileTypeId(11003);
					doc.setCreatedBy(user.getUserId());
					doc.setFileStoragePathURI(storagePath.getAbsolutePath());
					doc.setFileName(storagePath.getName());
					doc.setDocumentStorageLocation(98083);
					doc.setFileStoragePathURI(imagePath);
					Integer docId;
					try {
						ProfileRequest req = new ProfileRequest();
						req.setPartyId(user.getPartyId());

						doc.setDocumentAttachment(null);
						// Send RefType RefId
						doc.setRefId(party.getId());
						doc.setRefTypeId(111001);
						docId = documentService.saveDocumentData(doc);
						doc.setDocumentId(docId);


					} catch (Exception e) {

						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}

			
		}
		
		
		for (Address a : party.getAddressList()) {
			a.setAddressTypeId(9001);
			a.setPartyId(party.getId());
		}
		partyOld.setAddressList(party.getAddressList());
		List<Party> associatedParties = new ArrayList<Party>();

		for (Party p : party.getAssociatedParties()) {
			
			if (StringUtils.isEmpty(p.getLastName())) {
				continue;
			}
			
			
			
			
			Party partyToUpdate = null;

			
			if(p.getRelatedPartyId() != null && p.getRelatedPartyId() >0){
				for(Party p1:partyOld.getAssociatedParties()){
					if(p1.getRelatedPartyId().equals(p.getRelatedPartyId())){
						partyToUpdate = p1;
						break;
					}
				}
			}
			
			
			if(partyToUpdate ==null){
				partyToUpdate = p;
				
				partyToUpdate.setCreatedBy(user.getUserId());
				
			}
			else{
				partyToUpdate.setDobAsString(p.getDobAsString());
				partyToUpdate.setFirstName(p.getFirstName());
				partyToUpdate.setLastName(p.getLastName());
				partyToUpdate.setRelationshipId(p.getRelationshipId());
				partyToUpdate.setPanNumber(p.getPanNumber());
				partyToUpdate.setWorkProfession(p.getWorkProfession());
			}
			
			partyToUpdate.setRecordTypeId(14010);
			partyToUpdate.setPartyUserMapTypeId(41003);	
			
			if (!StringUtils.isEmpty(p.getDobAsString())) {
				Date dt = new SimpleDateFormat("dd-MMM-yyyy").parse(p
						.getDobAsString());
				if (dt != null) {
					Calendar cal = Calendar.getInstance();
					cal.setTime(dt);
					partyToUpdate.setDob(new Timestamp(cal.getTimeInMillis()));
					partyToUpdate.setAge(CommonUtils.getAge(partyToUpdate.getDob()));
				}
			}

			partyToUpdate.setId(partyOld.getId());
			associatedParties.add(partyToUpdate);
		}
		
		
		partyOld.setAssociatedParties(associatedParties);
		partyOld.setAddressList(party.getAddressList());
		
		if (doc != null && doc.getDocumentId() >0) {

			PartyAttribute attrb = new PartyAttribute();
			attrb.setAttributeCodeID(91035);
			attrb.setAttributeValue(""+doc.getDocumentId());
			attrb.setPartyId(user.getPartyId());
			attrb.setAttributeSeqNo(1);
			attrb.setValueDataTypeID(37002);
			attrb.setCreatedBy(user.getUserId());
			partyOld.getPartyAttributes().add(attrb);
		}

		boolean saved = service.saveProfile(partyOld);
		
		if (saved && doc != null) {
			user.setPhoto(doc.getFileStoragePathURI());
		}

		redirectAttributes.addFlashAttribute("success",
				getMessage("profile.save.sucess"));

		return "redirect:/profile/";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public void resetPassword(HttpServletRequest request,
			final RedirectAttributes redirectAttributes, Model m,HttpServletResponse httpResponse) throws Exception {
		UserSession user = AuthHandler.getCurrentUser();
		ProfileRequest req = new ProfileRequest();
		req.setUsername(user.getUserName());
		PasswordService service = getBean(PasswordService.class);
		BaseResponse<PasswordPolicy> baseResponse = new BaseResponse<PasswordPolicy>();
		List<PasswordPolicy> passwordPolicy = new ArrayList<PasswordPolicy>();
		List<PasswordPolicy> policies = new ArrayList<PasswordPolicy>();

		UserDetailsJson userDetailsJson = service.getUserDetailJson(req);
		passwordPolicy = service.passwordPolicy(req);

		baseResponse = restTemplate.getForObject(passwordPolicyurl,
				BaseResponse.class, user.getUserName());
		String error = null;
		String sucess = null;

		if (baseResponse.getStatus().equalsIgnoreCase(FiinfraConstants.success)) {
			try { // to extract password policy from responce object
					// passwordPolicy =
					// objectMapper.readValue(objectMapper.writeValueAsString(baseResponse.getResponseListObject()),
					// List.class);
				for (int i = 0; i < passwordPolicy.size(); ++i) {
					PasswordPolicy policy = objectMapper.readValue(objectMapper
							.writeValueAsString(passwordPolicy.get(i)),
							PasswordPolicy.class);
					policies.add(policy);
				}
				String oldencreptedPassword = userDetailsJson.getPassword();
				String existingPassword = request
						.getParameter("existingPassword");
				String newPassword = request.getParameter("newPassword");
				String reEnterPassword = request
						.getParameter("reEnterPassword");
				Integer minSpecialCharactrs = null;
				Integer minCapitalLetters = null;
				String specialCharacters = "[";
				Integer passwordMinSize = null;
				Integer passwordMaxSize = null;

				for (PasswordPolicy Policy : policies) {
					// Retrieve special characters set
					if (Policy.getAttributCodeId() == 98072) {
						specialCharacters = specialCharacters
								+ Policy.getAttributeValue() + "]";
					}
					// Retrieve number of min capital letter allowed
					if (Policy.getAttributCodeId() == 98073) {
						minCapitalLetters = Integer.parseInt(Policy
								.getAttributeValue());
					}
					// Retrieve number of min Special characters allowed
					if (Policy.getAttributCodeId() == 98074) {
						minSpecialCharactrs = Integer.parseInt(Policy
								.getAttributeValue());
					}
					// Retrieve password minimum size
					if (Policy.getAttributCodeId() == 98069) {
						passwordMinSize = Integer.parseInt(Policy
								.getAttributeValue());
					}
					// Retrieve password maximum size
					if (Policy.getAttributCodeId() == 98070) {
						passwordMaxSize = Integer.parseInt(Policy
								.getAttributeValue());
					}

				}

				Pattern specialCharacterPattern = Pattern
						.compile(specialCharacters);
				Matcher specialCharactermatcher = specialCharacterPattern
						.matcher(newPassword);
				Pattern capitalLettersPattern = Pattern.compile("[A-Z]");
				Matcher capitalLettersMatcher = capitalLettersPattern
						.matcher(newPassword);

				if (!(passwordEncoder.isPasswordValid(oldencreptedPassword,
						existingPassword, null))) {
					error = getMessage("user.changepassword.valid");
				} else if (newPassword.length() < passwordMinSize) {
					error = getMessage("user.changepassword.minsize",
							passwordMinSize);
				} else if (newPassword.length() > passwordMaxSize) {
					error = getMessage("user.changepassword.maxsize",
							passwordMaxSize);
				}
				/*
				 * else if (!(specialCharactermatcher.find())) { return
				 * "Please use atleast "
				 * +minSpecialCharactrs+" special character from "
				 * +specialCharacters+"."; }
				 */
				/*
				 * else if(!(capitalLettersMatcher.find())) { return
				 * "Please use atleast "+minCapitalLetters+"capital letter."; }
				 */
				else if (!(newPassword.equals(reEnterPassword))) {
					error = getMessage("user.changepassword.notmatched");
				} else {
					// calling service to update
					BaseResponse<Boolean> response = new BaseResponse<>();
					KeyValue keyValue = new KeyValue();
					// Encrepting new password
					String password = passwordEncoder.encodePassword(
							newPassword, null);
					keyValue.setName(password);
					keyValue.setId(0);
					response = restTemplate.postForObject(resetPasswordUrl,
							keyValue, BaseResponse.class, user.getUserName());
					UserSession userSession = AuthHandler.getCurrentUser();

					if (response.getStatus().equalsIgnoreCase(
							FiinfraConstants.success)) {
						audit(userSession.getPartyId(),
								userSession.getUserId(),
								FiinfraConstants.DIY_CHANGE_PASSWORD_SUCCESSFUL,
								CHANGE_PASSWORD_SOUECE,
								FiinfraConstants.DIY_SOURCE_MODULE_CHANGE_PASSWORD);

						sucess = getMessage("user.changepassword.success");

					} else {
						audit(userSession.getPartyId(),
								userSession.getUserId(),
								FiinfraConstants.DIY_CHANGE_PASSWORD_SUCCESSFUL,
								CHANGE_PASSWORD_SOUECE,
								FiinfraConstants.DIY_SOURCE_MODULE_CHANGE_PASSWORD);

						error = getMessage("user.changepassword.error",
								"Internal Error");

					}

				}
			} catch (Exception exception) {
				error = getMessage("user.changepassword.error",
						exception.getMessage());
			}

		}
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode map = mapper.createObjectNode();
		if (!StringUtils.isEmpty(error)) {
			//redirectAttributes.addFlashAttribute("error", error);
			//m.addAttribute("error", error);
			addValue(mapper, map, "error",error);
			addValue(mapper, map, "result", "error");
			//return "redirect:/profile/password";

		}
		if (!StringUtils.isEmpty(sucess)) {
			user.setFirstLogin(false);
			user.setIsForceChangePasswordOnLogin(false);
			redirectAttributes.addFlashAttribute("redirect", "/profile/dashboard/");
			redirectAttributes.addFlashAttribute("success", sucess);
			addValue(mapper, map, "result", "success");
			addValue(mapper, map, "success", sucess);
			//return "redirect:/profile/";
		}
		
		PrintWriter out = null;
		out = httpResponse.getWriter();
		httpResponse.setContentType("application/json");
		
		//return "redirect:/profile/password";
		objectMapper.writeValue(out, map);
		}
	
	private void addValue(ObjectMapper mapper, ObjectNode map, String key,
			String value) {
		map.put(key, value);
	}
	
	@RequestMapping(value = "/profile/delete", method = RequestMethod.GET)
	public void deleteFamilyMember(HttpServletRequest servletRequest, HttpServletResponse response)throws IOException {

		UserSession user = AuthHandler.getCurrentUser();
		user.getPartyId();
		ProfileService service = getBean(ProfileService.class);
		PortfolioService portfolioService = getBean(PortfolioService.class);		
		int partyToDelete = CommonUtils.toInt( servletRequest.getParameter("RelatedPartyId") );
		PortfolioRequest request= new  PortfolioRequest();
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		ObjectMapper mapper = new ObjectMapper();

		ObjectNode result = mapper.createObjectNode();

		if(partyToDelete <=0){
			result.put("error", "Invalid Party");
		}
		else{
		
		List<AssetData> assets =  portfolioService.getListOfPortfolio(request);
		boolean foundAsset = false;
		boolean foundGoal = false;
		for(AssetData asset:assets){
			if(asset.getOwnerPartyId().equals(partyToDelete )){
				foundAsset = true;
				break;
			}
		}
		List<GoalData> goals =  portfolioService.getListOfGoals(request);
		for(GoalData goal:goals){
			if(goal.getGoalFamilyPartyId() != null && goal.getGoalFamilyPartyId().equals(partyToDelete )){
				foundGoal = true;
				break;
			}
		}
		
		if(foundAsset){
			//Found Assets for family member, Please first deallocate asset.
			result.put("error", "Found Assets for  this family member.\n Please first deallocate asset." );
		}
		else if(foundGoal){
			result.put("error", "Found Goals for  this family member.\n Please first deallocate Goal." );
		}
		else if(partyToDelete >0){
		service.deleteFamilyMember(partyToDelete);	
		result.put("success", "Family Member removed.");
		}
		}
		PrintWriter out = null;
		out = response.getWriter();
		response.setContentType("application/json");

		objectMapper.writeValue(out, result);

	}
	 @InitBinder
	    public void initBinder(WebDataBinder binder) {
	       binder.registerCustomEditor(Date.class,new CustomDateEditor(new SimpleDateFormat("dd/MMM/yyyy"),true));
	      /* binder.registerCustomEditor(String.class,new CustomDateEditor(new SimpleDateFormat("mm/dd/yy"),true));*/
	       
	    }
	private void audit(int actionByPartyId, int actionByUserId, int eventId,
			String sourceModule, String sourceScreen) {
		try {
			Audit audit = new Audit();
			audit.setActionByPartyId(actionByPartyId);
			audit.setActionByUserID(actionByUserId);
			audit.setEventID(eventId);
			audit.setSourceSystemID(FiinfraConstants.PARTNER_MOBILE_PORTAL);
			audit.setSourceModule(sourceModule);
			audit.setSourceScreen(sourceScreen);
			FrameworkUtil.audit(audit);
		} catch (Exception exception) {
			// LOGGER.error("Error occured while doing Audit", exception);
		}
	}
	
	public static String getThemePath(UserSession user){
		if(user ==null){
			return null;
		}
		int theme = user.getThemeId();
		switch(theme){
		case 92001 :{
			return null;
		}
		//Red
		case 92002:{
			return "theme_red/theme_red.css";
		}
		//Blue
		case 92003:{
			return "theme_blue/theme_blue.css";
		}
		//Green
		case 92004:{
			return "theme_green/theme_green.css";
		}
		default:{
			
			return null;
		}
		
		
		}
	}
	
}
