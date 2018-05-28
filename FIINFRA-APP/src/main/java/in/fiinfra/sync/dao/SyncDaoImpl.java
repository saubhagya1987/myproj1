package in.fiinfra.sync.dao;

import in.fiinfra.common.common.SyncRequest;
import in.fiinfra.common.common.UserTokenRequest;
import in.fiinfra.common.diy.models.Party;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.diy.models.UserToken;
import in.fiinfra.common.partner.BatchJob;
import in.fiinfra.common.partner.SyncContactData;
import in.fiinfra.common.util.ContactSyncResponse;
import in.fiinfra.cp.CommonUtils;

import in.fiinfra.frmk.DbInvoker;
import in.fiinfra.question.QuestionData;
import in.fiinfra.util.DataSourceProvider;
import in.fiinfra.util.SQLs;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("syncDao")
public class SyncDaoImpl extends DbInvoker implements SyncDao {

	@Autowired
	DataSourceProvider dataSourceProvider;

	// JdbcTemplate jdbcTemplate = new JdbcTemplate();

	@Override
	public List<SyncContactData> getContactData(SyncRequest req) {

		Map<String, Object> params = new HashMap<String, Object>();
		addIdParameter(params, "ownerPartyId", req.getPartyId());
		addDateParameter(params, "lastSyncTime", new Date(req.getLastSyncTime()));
		
		return executeSelect(SQLs.sel_contact, params, new ContactMapper());
	}

	@Override
	public List<QuestionData> getQuestionData(SyncRequest req, int sectionId) {
		Map<String, Object> params = new HashMap<String, Object>();
		addIdParameter(params, "partyId", req.getPartyId());
		addIdParameter(params, "sectionId", sectionId);
		addIdParameter(params, "buId", req.getBuId());
		addIdParameter(params, "sourceSystemId", req.getSourceSystemId());

		addIdParameter(params, "timestamp", sectionId);
		return executeSelect(SQLs.sel_questions, params, new QuestionMapper());
	}



	@Override
	public UserToken saveUserToken(UserToken userToken) {
		Map<String, Object> params = new HashMap<String, Object>();
		addStringParameter(params, "token",CommonUtils.emptyIfNull(userToken.getToken()));
		addStringParameter(params, "description",CommonUtils.emptyIfNull(userToken.getDescription()));
		addNumberParameter(params, "sourceSystemId", userToken.getSourceSystemId()!=null?userToken.getSourceSystemId():0);
		addNumberParameter(params, "otp", userToken.getOtp()!=null?userToken.getOtp():0);
		addBooleanParameter(params, "isOtpConfirmed", userToken.isOtpConfirmed());
		addNumberParameter(params, "userId", userToken.getUserId());
		addNumberParameter(params, "createdBy", userToken.getCreatedBy());
		addNumberParameter(params, "lastModifiedBy", userToken.getCreatedBy());
		addBooleanParameter(params, "active", userToken.isActive());
		
		Integer id=0;
		if(userToken.getUserTokenId()!=null&&userToken.getUserTokenId()>0){
		id= executeUpdate(SQLs.upd_user_token, params);
		
		}
		else{
			id= executeInsert(SQLs.ins_user_token, params);
		}
		return null;
	}

	@Override
	public List<UserToken> getUserToken(UserTokenRequest req) {
		Map<String, Object> params = new HashMap<String, Object>();
		addIdParameter(params, "sourceSystemId", req.getSourceSystemId());
		addIdParameter(params, "userId", req.getUserId());
		return executeSelect(SQLs.sel_user_token,params,new UserTokenMapper());
		
	}

	@Override
	public SyncData getSyncData(SyncRequest req) {
		Map<String, Object> params = new HashMap<String, Object>();
		addNumberParameter(params, "partyId", req.getPartyId());
		return executeSelectOne(SQLs.sel_party_by_partyId, params, new SyncMapper());
	}

	@Override
	public Integer saveBatchJob(BatchJob batch) {
		  Map<String, Object> params = new HashMap<String, Object>();
			addIdParameter(params, "userId", batch.getLastModifiedBy());
			addIdParameter(params, "partyId", batch.getPartyId());
			addIdParameter(params, "Param2NameValue", batch.getParam2NameValue());
			addIdParameter(params, "BatchJobRequestQTypeID", batch.getBatchJobRequestQTypeID());
			addIdParameter(params, "BatchRequestStatusID", batch.getBatchRequestStatusID());
			
			
	return executeInsert(SQLs.ins_batch_job_request_q, params);
			

	}

	@Override
	public Integer getPartyId(Integer ownerPartyId, SyncContactData party){
	
	 Map<String, Object> params = new HashMap<String, Object>();
		addIdParameter(params, "ownerPartyId", ownerPartyId);
		addStringParameter(params, "email", party.getEmailId());
		addStringParameter(params, "fname", party.getfName());
		addStringParameter(params, "lname", party.getlName());
		addStringParameter(params, "mobileNo", party.getMobile());
	

		return executeSelectOne(SQLs.sel_partyId, params,new IntMapper());
}
	
	
	

}
