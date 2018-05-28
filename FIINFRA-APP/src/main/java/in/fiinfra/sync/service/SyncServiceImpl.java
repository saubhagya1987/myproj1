package in.fiinfra.sync.service;

import in.fiinfra.common.authentication.models.UserDetailsJson;
import in.fiinfra.common.common.StringUtils;
import in.fiinfra.common.common.SyncRequest;
import in.fiinfra.common.common.UserTokenRequest;
import in.fiinfra.common.dao.CommonDao;
import in.fiinfra.common.diy.models.Address;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.diy.models.UserToken;
import in.fiinfra.common.partner.AutoPlanData;
import in.fiinfra.common.partner.BatchJob;
import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.ContactSyncResponse;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.login.dao.LoginDao;
import in.fiinfra.partner.service.PartnerService;
import in.fiinfra.party.dao.PartyDao;
import in.fiinfra.question.AnswerData;
import in.fiinfra.question.OptionData;
import in.fiinfra.question.QuestionData;
import in.fiinfra.question.dao.QuestionDao;
import in.fiinfra.sync.DcAttribute;
import in.fiinfra.sync.DcGoal;
import in.fiinfra.sync.dao.SyncDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

@Service("syncService")
public class SyncServiceImpl implements SyncService {

	@Autowired
	SyncDao dao;

	@Autowired
	LoginDao loginDao;

	@Autowired
	PartyDao partyDao;

	@Autowired
	PartnerService partnerService;

	@Autowired
	QuestionDao questionDao;

	@Autowired
	CommonDao commonDao;

	@Autowired
	private Md5PasswordEncoder passwordEncoder;

	@Override
	public SyncData getMasterData(SyncRequest req) {
		// req.setLastSyncTime(new Date(0L));
		SyncData data = dao.getSyncData(req);
		data.setContacts(dao.getContactData(req));
		data.setXrayTempalte(dao.getQuestionData(req, 58001));
		data.setLogoUrl(data.getLogoUrl());
		data.setPartnerName(data.getPartnerName());
		data.setLastSyncTime(System.currentTimeMillis() + "");

		return data;
	}

	@Override
	public List<ContactSyncResponse> saveSyncData(int buId, SyncData sync) {
		List<ContactSyncResponse> lst = new ArrayList<ContactSyncResponse>();
		Map<Integer, QuestionData> qMap = new HashMap<Integer, QuestionData>();
		List<QuestionData> lstQuests = questionDao.getQuestions(buId,
				FiinfraConstants.CLIENT_PORTAL, 58001, 0);
		for (QuestionData q : lstQuests) {
			qMap.put(q.getSeqNo(), q);
		}
		Integer partyId;
		for (SyncContactData s : sync.getContacts()) {
			ContactSyncResponse response = new ContactSyncResponse();

			response.setLocalId(s.getLocalId().toString());
			Party party = null;
			if (s.getPartyId() == null || s.getPartyId() <= 0) {
				party = toPartyData(s);
				party.setRecordTypeId(14005);
				party.setCurrentStageId(7002);
				party.setOwnerPartyId(sync.getPartnerId());
				party.setBuPartyId(sync.getBuId());
				party.setCreatedBy(sync.getUserId());
				party.setOwnerPartyId(sync.getPartnerId());

				partyId = dao.getPartyId(sync.getPartnerId(), s);
				if (partyId == null || partyId <= 0) {
					partyId = partyDao.saveParty(party);
				}
				response.setPartyId(partyId);
				response.setMessage("Contact created");
			} else {
				party = partyDao.getParty(s.getPartyId());
				response.setPartyId(s.getPartyId());
			}
			if (s.getXray() != null) {
				for (AnswerData answer : s.getXray()) {

					answer.setPartyId(response.getPartyId());
					QuestionData question = qMap.get(answer.getQuestionId());
					answer.setQuestionId(question.getQuestionId());
					answer.setQuestionnaireId(question.getQuestionnaireId());
					for (OptionData opClient : answer.getSelectedOptions()) {
						for (OptionData op : question.getOptions()) {
							if (op.getSeq().equals(opClient.getSeq())) {
								opClient.setSelected(true);
								opClient.setOptionId(op.getOptionId());
							}
						}

					}

					questionDao.saveQuestionAnswer(buId, answer);
				}
				response.setMessage("Contact updated");
			}
			AutoPlanData autoPlan = new AutoPlanData();

			autoPlan.setLastname(party.getLastName());
			autoPlan.setEmailId(party.getContactEmail1());
			autoPlan.setLastModifiedBy(sync.getUserId());
			autoPlan.setDataXML(getPartyXML(party));
			if (s.getDcAttribute() != null && s.getDcAttribute().length > 0) {

				for (DcAttribute attrb : s.getDcAttribute()) {
					if (attrb.getAttributeCodeId() == 94228) {
						autoPlan.setRiskProfileId(attrb.getAttributeValue());
						break;
					}
				}

				autoPlan.setPartyAttributeDataXML(getDCAttributeXMLData(s
						.getDcAttribute()));

				if (s.getDcGoals() != null && s.getDcGoals().length > 0) {
					autoPlan.setGoalXML(getDCGoalXMLData(s.getDcGoals()));

				}
				autoPlan.setPartyId(response.getPartyId());
				// autoPlan.setLastModifiedBy(sync.getPartnerId());
				partnerService.updateClientAutoPlanDetails(autoPlan);
				BatchJob batch = new BatchJob();
				batch.setBatchJobRequestQTypeID(504022);
				batch.setPartyId(s.getPartyId());
				batch.setParam2NameValue(386);
				batch.setBatchRequestStatusID(503001);
				batch.setLastModifiedBy(sync.getUserId());
				dao.saveBatchJob(batch);

				BatchJob batch2 = new BatchJob();
				batch2.setBatchJobRequestQTypeID(504024);
				batch2.setPartyId(s.getPartyId());
				batch2.setParam2NameValue(392);
				batch2.setBatchRequestStatusID(503001);
				batch2.setLastModifiedBy(sync.getUserId());
				dao.saveBatchJob(batch2);
			}
			lst.add(response);
		}

		return lst;
	}

	private Party toPartyData(SyncContactData sync) {

		Party party = new Party();
		if (sync.getPartyId() != null && sync.getPartyId() > 0) {
			party = partyDao.getParty(sync.getPartyId());

		}
		List<Address> lstAddress = new ArrayList<Address>();
		Address a = new Address();
		a.setAddressTypeId(9001);
		a.setPostalCode("411020");
		lstAddress.add(a);
		party.setAddressList(lstAddress);
		party.setId(sync.getPartyId());
		party.setFirstName(sync.getfName());
		party.setLastName(sync.getlName());
		party.setContactEmail1(sync.getEmailId());
		party.setPanNumber(sync.getPanNo());

		return party;
	}

	@Override
	public BaseResponse<String> activateUserToken(UserTokenRequest request) {
		BaseResponse<String> response = new BaseResponse<String>();
		response.setResponseObject("");
		response.setStatus(FiinfraConstants.fail);

		UserDetailsJson user = loginDao
				.getUserByUserName(request.getUserName());
		if (user == null) {
			response.setReasonCode("Invalid User");
			return response;
		}
		request.setUserId(user.getUserID());
		List<UserToken> lst = dao.getUserToken(request);
		if (lst == null || lst.size() == 0) {
			response.setReasonCode("Invalid OTP");
			return response;
		}
		UserToken userToken = lst.get(0);
		if (userToken.getOtp() == null  || request.getOtp() == null
				|| !userToken.getOtp().equals(request.getOtp())) {
			response.setReasonCode("Invalid OTP");
			return response;
		}
		if (userToken.isOtpConfirmed()) {
			response.setStatus(FiinfraConstants.success);
			response.setResponseObject(userToken.getToken());
			return response;
		}
		String token = passwordEncoder.encodePassword(FiinfraUtility
				.generateUniqueToken(request.getUserName(), userToken.getOtp(),
						request.getDeviceId()), "");
		userToken.setToken(token);

		String encrypted = token;// passwordEncoder.encodePassword(token, "");

		response.setStatus(FiinfraConstants.success);
		response.setResponseObject(token);

		userToken.setToken(encrypted);
		userToken.setOtpConfirmed(false);
		dao.saveUserToken(userToken);
		return response;

	}

	@Override
	public List<UserToken> getUserToken(UserTokenRequest req) {

		return dao.getUserToken(req);
	}

	@Override
	public BaseResponse<Boolean> register(UserTokenRequest request) {
		BaseResponse<Boolean> response = new BaseResponse<Boolean>();
		response.setResponseObject(false);
		response.setStatus(FiinfraConstants.fail);

		UserDetailsJson user = loginDao
				.getUserByUserName(request.getUserName());
		if (user == null) {
			response.setReasonCode("Invalid User");
			return response;
		}
		request.setUserId(user.getUserID());
		request.setPartyId(user.getPartyId());
		request.setBuId(user.getBuId());
		List<UserToken> lst = dao.getUserToken(request);
		if (lst.size() > 0) {
			UserToken token = lst.get(0);
			createAppRegistrationNotification(request, token.getOtp()
					.toString(), FiinfraConstants.EMAIL);
			createAppRegistrationNotification(request, token.getOtp()
					.toString(), FiinfraConstants.SMS);
			response.setStatus(FiinfraConstants.success);
			response.setResponseObject(true);
			// response.setReasonCode("User Already Registered");
			return response;
		}

		UserToken token = new UserToken();
		token.setOtp(FiinfraUtility.getRandomOTP());
		token.setUserId(user.getUserID());
		token.setCreatedBy(user.getUserID());
		token.setSourceSystemId(request.getSourceSystemId());
		token.setToken(token.getOtp().toString());
		token.setActive(false);
		dao.saveUserToken(token);
		// todo create notification
		createAppRegistrationNotification(request, token.getOtp().toString(),
				FiinfraConstants.EMAIL);
		createAppRegistrationNotification(request, token.getOtp().toString(),
				FiinfraConstants.SMS);
		//
		response.setResponseObject(true);
		response.setStatus(FiinfraConstants.success);
		return response;
	}

	private static String getDCAttributeXMLData(DcAttribute[] dc) {
		StringBuilder sb = new StringBuilder();
		sb.append("<Root>");

		for (DcAttribute data : dc) {
			sb.append("<Data>");
			sb.append("<AttributeCodeId>").append(data.getAttributeCodeId())
					.append("</AttributeCodeId>");
			sb.append("<AttributeValue>").append(data.getAttributeValue())
					.append("</AttributeValue>");
			sb.append("<AttributeReferenceValue>")
					.append(data.getAttributeReferenceValue())
					.append("</AttributeReferenceValue>");
			sb.append("</Data>");
		}
		sb.append("</Root>");
		return sb.toString();
	}

	private static String getDCGoalXMLData(DcGoal[] dc) {
		StringBuilder sb = new StringBuilder();
		sb.append("<Root>");

		for (DcGoal data : dc) {
			sb.append("<Goal>");
			sb.append("<GoalDescription>").append(data.getGoalDescription())
					.append("</GoalDescription>");

			sb.append("<GoalEndYear>").append(data.getEndYear())
					.append("</GoalEndYear>");
			sb.append("<GoalAmountPv>").append(data.getGoalAmountPv())
					.append("</GoalAmountPv>");
			sb.append("<GoalTypeId>").append(data.getGoalTypeId())
					.append("</GoalTypeId>");

			sb.append("</Goal>");
		}
		sb.append("</Root>");
		return sb.toString();
	}

	@Override
	public BaseResponse<SyncData> confirmToken(UserTokenRequest request) {

		BaseResponse<SyncData> response = new BaseResponse<SyncData>();
		SyncData sync = new SyncData();

		response.setStatus(FiinfraConstants.fail);

		UserDetailsJson user = loginDao
				.getUserByUserName(request.getUserName());
		if (user == null) {
			response.setReasonCode("Invalid User");
			return response;
		}
		request.setUserId(user.getUserID());
		List<UserToken> lst = dao.getUserToken(request);
		if (lst == null || lst.size() == 0) {
			response.setReasonCode("Invalid Token");
			return response;
		}
		UserToken userToken = lst.get(0);
		String token = userToken.getToken();
		/*
		 * if(!passwordEncoder.isPasswordValid(token, request.getToken(), "")){
		 * response.setReasonCode("Invalid Token"); return response; }
		 */
		if (!StringUtils.equals(token, request.getToken())) {
			response.setReasonCode("Invalid Token");
			return response;
		}
		userToken.setOtpConfirmed(true);
		dao.saveUserToken(userToken);

		response.setStatus(FiinfraConstants.success);

		UserSession session = loginDao.getSessionUserByToken(
				request.getSourceSystemId(), request.getUserName(), token);
		sync.setThemeId(session.getThemeId());
		response.setResponseObject(sync);
		return response;
	}

	private void createAppRegistrationNotification(UserTokenRequest req,
			String otp, int deliveryChannelId) {
		Notification notification = new Notification();
		Map<String, String> payloadMap = new HashMap<String, String>();
		payloadMap.put("otp", otp);

		// payloadMap.put("Password",map.getValue());
		int eventId = 514;

		notification.setSourceSystemID(FiinfraConstants.INTEGRATION_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(req.getPartyId());
		notification.setNotifyEventID(eventId);
		notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(req.getBuId());
		notification.setPayloadMap(payloadMap);
		notification.setSessionID("1234");

		commonDao.insertNotification(notification);

	}

	private static String getPartyXML(Party party) {
		StringBuilder sb = new StringBuilder();
		sb.append("<Root>");

		sb.append("<FirstName>").append(party.getFirstName())
				.append("</FirstName>");
		sb.append("<LastName>").append(party.getLastName())
				.append("</LastName>");
		sb.append("<DOB>")
				.append(CommonUtils.format(party.getDob(), "dd/MM/yyyy"))
				.append("</DOB>");
		sb.append("<EmailId>").append(party.getContactEmail1())
				.append("</EmailId>");
		sb.append("<CreatedBy>").append(party.getCreatedBy())
				.append("</CreatedBy>");
		// sb.append("<Income>").append(party.getFirstName()).append("</Income>");
		// sb.append("<Expense>").append(party.getFirstName()).append("</Expense>");
		// sb.append("<RetirementAge>").append(party.getFirstName()).append("</RetirementAge>");
		// sb.append("<EmergencyMonth>").append(party.getFirstName()).append("</EmergencyMonth>");
		// sb.append("<RiskProfileId>").append(party.getFirstName()).append("</RiskProfileId>");
		sb.append("<PanNo>").append(party.getPanNumber()).append("</PanNo>");
		sb.append("<City>").append(party.getCityName()).append("</City>");
		// sb.append("<LifeExpectancy>").append(party.getFirstName()).append("</LifeExpectancy>");
		// sb.append("<EMI>").append(party.getFirstName()).append("</EMI>");
		// sb.append("<Will>").append(party.getFirstName()).append("</Will>");

		sb.append("</Root>");
		return sb.toString();

	}
}
