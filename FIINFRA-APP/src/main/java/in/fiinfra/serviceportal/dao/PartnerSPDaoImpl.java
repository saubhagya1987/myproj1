package in.fiinfra.serviceportal.dao;




import in.fiinfra.birt.models.PartnerList;
import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.common.service.vo.LoginHistory;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.ProductMfg;
import in.fiinfra.common.service.vo.ProductRevenueBook;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.common.util.FiinfraUtility;
import in.fiinfra.util.DataSourceProvider;

import java.io.PrintWriter;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;
public class PartnerSPDaoImpl implements PartnerSPDao{
	
	private static final Logger logger = Logger.getLogger(PartnerSPDaoImpl.class);
	@Autowired
	JdbcTemplate jdbcTemplate = new JdbcTemplate();
	Response response=null;
	
	//DataSource dataSource;
	@Autowired
	DataSourceProvider dataSourceProvider;
	



	public DataSourceProvider getDataSourceProvider() {
		return dataSourceProvider;
	}



	public void setDataSourceProvider(DataSourceProvider dataSourceProvider) {
		this.dataSourceProvider = dataSourceProvider;
	}



	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}



	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}




	@SuppressWarnings({ "finally", "unchecked" })
	@Override
	public Response showPartnerList(Partner partner) {

		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try
		{
		List<Partner> partnerList; 
		

		
		
		logger.info("Party ID"+partner.getUserId());
		logger.info("Node ID"+partner.getNodeId());
		
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		partnerList = jdbcTemplate.query(FiinfraConstants.SP_GET_PARTNER_LIST, new Object[] {partner.getBuId(),partner.getUserId(),partner.getSearchText(),partner.getNodeId()},new BeanPropertyRowMapper(Partner.class));
		br.setResponseListObject(partnerList); 
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			logger.info(response);
		}
		finally
		{
			return response;
				}
	}


	

	@SuppressWarnings({ "finally", "unchecked" })
	@Override
	public Response getRMlist(Partner partner) {

		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try
		{
		List<Partner> partnerList; 
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		partnerList = jdbcTemplate.query(FiinfraConstants.SP_GET_RM_LIST, new Object[] {partner.getBuId(),partner.getPartyID(),partner.getSearchText()},new BeanPropertyRowMapper(Partner.class));
		br.setResponseListObject(partnerList); 
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			logger.info(response);
		}
		finally
		{
			return response;
				}
	}



	@SuppressWarnings({ "finally", "rawtypes", "unchecked" })
	@Override
	public Response addPartner(String firstName, String lastName,
			String companyName, String contactEmail, Long contactMobile,
			String ARN, String pst, String pkt, String pot, String rm, String rmHead, String buId,
			String userId, String euin,String state, String location, String loginName,
			String hdnpassword,String communicationEmailId) {

		BaseResponse<Integer> br = new BaseResponse();
		try {
			Integer rcnt;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			rcnt = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_ADD_PARTNER, new Object[] { firstName,
							lastName, companyName, contactEmail, contactMobile,
							ARN, pst, pkt, pot,rm,rmHead, buId, userId, euin, state, location,
							loginName, hdnpassword,communicationEmailId }, Integer.class);
			br.setResponseObject(rcnt);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response editPartner(String firstName, String lastName,
			String companyName, String contactEmail, Long contactMobile,
			String ARN, String pst, String pkt, String pot, String rm, String rmHead, String buId,
			String userId, String partyId, String euin,String state, String location,String communicationEmailId) {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		BaseResponse<Integer> br = new BaseResponse();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_EDIT_PARTNER, new Object[] { firstName,
							lastName, companyName, contactEmail, contactMobile,
							ARN, pst, pkt, pot,rm,rmHead, buId, userId, partyId, euin,
							state, location, communicationEmailId }, Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response getPSTPKTPOTNames(String buId) {

		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> partner;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			partner = jdbcTemplate.query(
					FiinfraConstants.SP_GET_PSTPKTPOT_NAMES,
					new Object[] {buId},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(partner);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}

	}



	@SuppressWarnings("finally")
	@Override
	public Response searchPSTPKTPOT(String buId, String deptTypeId) {
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> partner;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			partner = jdbcTemplate.query(
					FiinfraConstants.SP_SEARCH_PSTPKTPOT,
					new Object[] {buId,deptTypeId},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(partner);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}

	}



	@SuppressWarnings({ "finally", "unchecked", "rawtypes" })
	@Override
	public Response addSTAforPartner(String pst, String pkt, String pot, String rm, String rmHead,
			String partnerspartyid) {
		BaseResponse<Integer> br = new BaseResponse();
		try {
			Integer bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			bupartyName = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_STA_FOR_PARTNER, new Object[] {pst,pkt,pot,rm,rmHead,partnerspartyid}, Integer.class);
			br.setResponseObject(bupartyName);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response getLocation() {
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> partner;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			partner = jdbcTemplate.query(
					FiinfraConstants.SP_GET_LOCATION,
					new Object[] {},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(partner);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response getLoginName(String partyId) {
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> partner;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			partner = jdbcTemplate.query(
					FiinfraConstants.SP_GET_LOGINNAME,
					new Object[] {partyId},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(partner);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response showTopPartnerList(int buId, int userId) {
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> partner;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			partner = jdbcTemplate.query(
					FiinfraConstants.SP_GET_TOP_PARTNER_LIST,
					new Object[] {buId,userId},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(partner);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response deletePartner(String deletelist, int lastmodifyby) {
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> count;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			count = jdbcTemplate.query(FiinfraConstants.SP_DELETE_PARTNER,
					new Object[] { deletelist,lastmodifyby},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(count);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}

	}



		@SuppressWarnings("unchecked")
	@Override
	public List<List<Partner>> insertBulkPartner(String bulkPartnerXML) {

		logger.info("In insertBulkPartner Dao Impl ");
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(111));
		Partner partner=new Partner();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, FiinfraConstants.SP_BULK_UPLOAD_FOR_PARTNER);

		SqlParameter partnerXMLStringParam = new SqlParameter("xmlString", Types.VARCHAR);
		logger.debug("bulkPartnerXML:------------"+bulkPartnerXML);

		SqlParameter[] paramArray = {partnerXMLStringParam};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("xmlString", bulkPartnerXML);		

		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
		logger.info("storedProcResult:---" + storedProcResult);
		List<List<Partner>> partnerList = new ArrayList<>();
		List<Partner> successList=new ArrayList<>();
		List<Partner> existingList=new ArrayList<>();
		List<Partner> failedList=new ArrayList<>();
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		logger.info("Success Full List" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				partner=new Partner();
				partner.setFirstName((String) row.get("firstName"));
				partner.setLastName((String) row.get("lastName"));		
				partner.setLoginName((String) row.get("loginName"));	
				partner.setContactEmail((String) row.get("contactEmail"));
				partner.setCommunicationEmailId((String) row.get("communicationEmailId"));
				partner.setContactMobile((String) row.get("contactMobile"));
				partner.setArn((String) row.get("ARN"));
				partner.setPstName((String) row.get("PST"));
				partner.setOwnerPartyId((String) row.get("ownerPartyId")+"");
				partner.setBuId((String) row.get("buId")+"");
				if(row.get("PartyId")!=null){
					partner.setPartyID((int)row.get("PartyId"));
				}
				
				  if((partner.getLastName().trim().equals("")) || (partner.getLoginName().trim().equals("")) || (partner.getContactEmail().trim().equals(""))||(partner.getArn().trim().equals(""))){failedList.add(partner);}else{successList.add(partner);}
				
				}
		}	
		
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		logger.info("Duplicate List:--" + l);
		if (l != null) {
			for (Map<String, Object> row : l) {
				partner=new Partner();
				partner.setFirstName((String) row.get("firstName"));
				partner.setLastName((String) row.get("lastName"));	
				partner.setLoginName((String) row.get("loginName"));	
				partner.setContactEmail((String) row.get("contactEmail"));
				partner.setCommunicationEmailId((String) row.get("communicationEmailId"));
				partner.setContactMobile((String) row.get("contactMobile"));
				partner.setArn((String) row.get("ARN"));
				partner.setPstName((String) row.get("PST"));
				partner.setOwnerPartyId((String) row.get("ownerPartyId")+"");
				partner.setBuId((String) row.get("buId")+"");
				if(row.get("PartyId")!=null){
					partner.setPartyID((int)row.get("PartyId"));
				}
								
                if((partner.getLastName().trim().equals("")) || (partner.getLoginName().trim().equals("")) || (partner.getContactEmail().trim().equals(""))||(partner.getArn().trim().equals(""))){failedList.add(partner);}else{existingList.add(partner);}
				
				}
			}
	
		partnerList.add(successList);
		partnerList.add(existingList);
		partnerList.add(failedList);
		return partnerList;
	
	}

	@SuppressWarnings("finally")
	@Override
	public Response getUniqueArn(String arn) {
		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> partner;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			partner = jdbcTemplate.query(
					FiinfraConstants.SP_GET_UNIQUE_ARN,
					new Object[] {arn},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(partner);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings({ "finally", "rawtypes", "unchecked" })
	@Override
	public Response addBulkSTAforPartner(String pst, String pkt, String pot, String rm, String rmHead,
			String partnerspartyidz) {
		BaseResponse<Integer> br = new BaseResponse();
		try {
			Integer bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			bupartyName = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_BULK_STA_FOR_PARTNER, new Object[] {pst,pkt,pot,rm,rmHead,partnerspartyidz}, Integer.class);
			br.setResponseObject(bupartyName);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}
	
	@SuppressWarnings("finally")
	@Override
	public Response showLoginHistory(String searchText,String userId) {
		BaseResponse<LoginHistory> br = new BaseResponse<LoginHistory>();
		try {
			List<LoginHistory> loginHistory;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			loginHistory = jdbcTemplate.query(
					FiinfraConstants.SP_VIEW_LOGIN_HISTORY,
					new Object[] {searchText,userId},
					new BeanPropertyRowMapper<LoginHistory>(LoginHistory.class));
			br.setResponseListObject(loginHistory);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response assignCommunicationEmail(String communname,
			String contactEmail, String buId, String userId, String partyId) {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		BaseResponse<Integer> br = new BaseResponse();
		try {
			int rateing = 0;
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_ASSIGN_COMMUNICATION_EMAIL_PARTNER, new Object[] { communname,
							contactEmail, buId, userId, partyId,rateing},
					Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}

	
	@SuppressWarnings("finally")
	@Override
	public Response saveChecklist(Partner partner) {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		BaseResponse<Integer> br = new BaseResponse();
		try {
			String communname = null;
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_SAVE_ONBOARD_CHECK_LIST, new Object[] {  partner.getBuId(),partner.getUserId(),partner.getPartyID(),partner.getProgramSponsor(),partner.getWelcomeContacted(),partner.getAgreementCheckD(),partner.getOnboardingCheck(),partner.getRagion(), partner.getExecution_tracker(),partner.getGoal_tracking_achievement(),partner.getTrack_your_practice(),partner.getSelf_Financial_Plan() },	Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}


	@SuppressWarnings("finally")
	@Override
	public Response savelegends(Partner partner) {
		@SuppressWarnings({ "unchecked", "rawtypes" })
		BaseResponse<Integer> br = new BaseResponse();
		try {
			String communname = null;
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_SAVE_LEGENTS_CHECK_LIST, new Object[] {  partner.getBuId(),partner.getUserId(),partner.getPartyID(),partner.getProgramSponsor(),partner.getOnboardingCheck()},	Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings({ "rawtypes", "finally" })
	@Override
	public Response sendWelcomeMail(String userDataXML) {
		@SuppressWarnings({ "unchecked"})
		BaseResponse<Integer> br = new BaseResponse();
		try {
			Integer result;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_SEND_WELCOME_MAIL, new Object[] {userDataXML},
					Integer.class);
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	}


	@SuppressWarnings({ "finally" })
	@Override
	public Response getUniqueCommunicationEmail(Partner partner) {

		BaseResponse<Partner> br = new BaseResponse<Partner>();
		try {
			List<Partner> partnervoz;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			partnervoz = jdbcTemplate.query(
					FiinfraConstants.SP_GET_UNIQUE_COMMUNICATION_EMAIL,
					new Object[] {partner.getCommunicationEmailId(),partner.getBuId(),partner.getContactEmail(),partner.getEdit()},
					new BeanPropertyRowMapper<Partner>(Partner.class));
			br.setResponseListObject(partnervoz);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	
	}



	@Override
	public Response getTaskListAssign(User user) 
	{
	       BaseResponse<User> br = new BaseResponse<User>();
			try
			{
			List<User> bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			bupartyName=jdbcTemplate.query(FiinfraConstants.SP_GET_TASK_ASSIGN,new Object[]{user.getUserID(),user.getBuPartyId()} ,new BeanPropertyRowMapper<User>(User.class));
			br.setResponseListObject(bupartyName);
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			}
			catch (DataAccessException e) {
				response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			}
			finally
			{
				
				return response;
					}
	       
	
	}



	@Override
	public Response getParnerListforTask(Task task) {
	       BaseResponse<Task> br = new BaseResponse<Task>();
			try
			{
			List<Task> bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			

			
			bupartyName=jdbcTemplate.query(FiinfraConstants.SP_GET_PARNTER_FOR_TASK,new Object[]{task.getId(),task.getAssignTo(),task.getBuPartyId(),task.getUserId(),task.getPartyName()} ,new BeanPropertyRowMapper<Task>(Task.class));
			br.setResponseListObject(bupartyName);
			//System.out.println(bupartyName+"bupartyname");
			response=FiinfraResponseBuilder.getSuccessResponse(br, null);
			}
			catch (DataAccessException e) {
				response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
			}
			finally
			{
				
				return response;
					}
	}



	@Override
	public Response getTaskDetail(Task task) {

	
			 BaseResponse<Task> br = new BaseResponse<Task>();
				try
				{
					Task bupartyName;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_GET_TASK_DETAIL,new Object[]{task.getId()} ,new BeanPropertyRowMapper<Task>(Task.class));
				br.setResponseObject(bupartyName);
				response=FiinfraResponseBuilder.getSuccessResponse(br, null);
				}
				catch (DataAccessException e) {
					response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
				}
				finally
				{
					return response;
				}
	
	
	
	
	
	}


	@SuppressWarnings("finally")
	@Override
	public Response movePartner(Partner partner) {
		try {
			BaseResponse<Integer> br = new BaseResponse<>();
			Integer result;

			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_SWITCH_PARTNER,
					new Object[] { partner.getPartyID(),
							partner.getBuPartyId(),
							partner.getPstTeamMemberId(),
							partner.getPktTeamMemberId(),
							partner.getPotTeamMemberId(),
							partner.getRmTeamMemberId(),
							partner.getRmHeadTeamMemberId() },
					new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}

	}



	@SuppressWarnings("finally")
	@Override
	public Response getPartnerListForChange(Partner partner) {
		try {
			List<Partner> list;
			BaseResponse<Partner> br1 = new BaseResponse<Partner>();

			list = jdbcTemplate.query(FiinfraConstants.SP_GET_LIST_FOR_CHANGE,
					new Object[] { partner.getBuId(),partner.getUserId(),partner.getSearchText()},
					new BeanPropertyRowMapper<Partner>(
							Partner.class));
			br1.setResponseListObject(list);

			response = FiinfraResponseBuilder.getSuccessResponse(br1, null);

		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}



	@SuppressWarnings("finally")
	@Override
	public Response moveClientOrOpportunity(Partner partner) {
		try {
			BaseResponse<Integer> br = new BaseResponse<>();
			Integer result;

			result = jdbcTemplate.queryForObject(
					FiinfraConstants.SP_SWITCH_PARTNER_FOR_CLIENT_OPPORTUNITY,
					new Object[] { partner.getPartyID(),partner.getSearchText() },
					new BeanPropertyRowMapper<Integer>(Integer.class));
			br.setResponseObject(result);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
		} finally {
			return response;
		}
	}



	@Override
	public Response getListOfTask(Integer partyID, String subject,Integer nodeid) {
	
		
		BaseResponse<Task> br = new BaseResponse<Task>();
		try
		{
		List<Task> task;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		task = jdbcTemplate.query(FiinfraConstants.SP_GET_TASK_LIST,new Object[]{partyID, subject,null,null,null,null,null,nodeid},new BeanPropertyRowMapper(Task.class));	
		br.setResponseListObject(task);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
				}
		
		
	}



	@Override
	public Response getOnboardChecklist(Partner partner) {
		
			
			BaseResponse<Partner> br = new BaseResponse<Partner>();
		try
		{
			List<Partner> partnerList; 
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			partnerList = jdbcTemplate.query(FiinfraConstants.SP_GET_ONBOARD_CHECKLIST, new Object[] {partner.getPartyID()},new BeanPropertyRowMapper(Partner.class));
			br.setResponseListObject(partnerList); 
			
							
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
			
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	
	}

	@Override
	public Response getlegendsChecklist(Partner partner) {
		
			
			BaseResponse<Partner> br = new BaseResponse<Partner>();
		try
		{
			List<Partner> partnerList; 
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			partnerList = jdbcTemplate.query(FiinfraConstants.SP_GET_LEGENTS_CHECK_LIST, new Object[] {partner.getPartyID()},new BeanPropertyRowMapper(Partner.class));
			br.setResponseListObject(partnerList); 
			
							
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
			
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}
	
	}

	
	@Override
	public Response getTaskAlert(Task t) {

		BaseResponse<Task> br = new BaseResponse<Task>();
		try
		{
		List<Task> task;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		task = jdbcTemplate.query(FiinfraConstants.SP_GET_TASK_ALERT,new Object[]{t.getPartyID()},new BeanPropertyRowMapper(Task.class));	
		br.setResponseListObject(task);
		response=FiinfraResponseBuilder.getSuccessResponse(br, null);
		}
		catch (DataAccessException e) {
			response=FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		}
		finally
		{
			return response;
				}
		
	}
	
	

}
