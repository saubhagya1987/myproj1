package in.fiinfra.serviceportal.dao;


import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.partner.PartnerHeirarchyData;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.CommonStoredProcedure;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.common.util.FiinfraResponseBuilder;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.util.DataSourceProvider;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;
@Repository("testimonialDao")
public class TestimonialDaoImpl implements TestimonialDao {
	
	private static final Logger logger = Logger.getLogger(TestimonialDaoImpl.class);
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
	
	
	/*@Override
	public List<Download> showDownloadedList() {
		//jdbcTemplate.setDataSource(dataSource);
		    List<Download> downloadList=jdbcTemplate.query(FiinfraConstants.SP_GET_DOWNLOAD_DETAILS_LIST, new Object[] {},new BeanPropertyRowMapper(Download.class));
			//.queryForList(FiinfraConstants.SP_GET_CODETYPE_DETAILS_LIST,new Object[] {},CodeTypeData.class);
			logger.info("Connection Successful");
			return downloadList;
	}


	
*/

/*	@Override
	public List<TestimonialData> getTestimonials(int partyId) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(
				dataSourceProvider.getDataSource(buId));
		return jdbcTemplate.query(SP_GET_TESTIMONIALS, new Object[] { partyId }, new TestimonialMapper());

	}*/


	@SuppressWarnings("finally")
	@Override
	public Response getTestimonials(TestimonialData testimonialData) {

		
		//System.out.println(searchtext+"String");
		BaseResponse<TestimonialData> br = new BaseResponse<TestimonialData>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<TestimonialData> testimonial = jdbcTemplate.query( FiinfraConstants.SP_GET_TESTIMONIALS,new Object[] {testimonialData.getPartyId(),testimonialData.getPartnerId(),testimonialData.getClientId(),testimonialData.getSearchtext()}, new BeanPropertyRowMapper(TestimonialData.class));
			//System.out.println("String   nnnnnn   "+testimonial);
			/*		@partyId nvarchar(max)=null ,
					@partnerId nvarchar(max)=null,
					@clientId nvarchar(max)=null,
					@searchText  nvarchar(max)=null
					*/
			br.setResponseListObject(testimonial);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
			
			
			
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
			logger.info(response);
		} finally {
			return response;
		}

	}



	@Override
	public Response addTestimonial(TestimonialData testimonialData) {

		BaseResponse<TestimonialData> br = new BaseResponse<TestimonialData>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<TestimonialData> testimonial = jdbcTemplate.query( FiinfraConstants.SP_ADD_TESTIMONIALS,new Object[] {testimonialData.getId(),testimonialData.getUrl(),testimonialData.getText(),testimonialData.getPartyId(),testimonialData.getPartnerId(),testimonialData.getClientId(),testimonialData.getStatusRefId(),testimonialData.getUserID(),testimonialData.getBuPartyId()}, new BeanPropertyRowMapper(TestimonialData.class));
			/*  @url nVARCHAR(MAX),
				@testimonialText nVARCHAR(MAX),
				@partyId int,
				@partnerId int,
				@clientId int,
				@statusRefID int,
				@userId int,
				@buId int*/
			
			
			br.setResponseListObject(testimonial);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
			logger.info(response);
		} finally {
			return response;
		}
	}



	@Override
	public Response editTestimonial(TestimonialData testimonialData) {
		
		BaseResponse<TestimonialData> br = new BaseResponse<TestimonialData>();
		try {
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			@SuppressWarnings({ "unchecked", "rawtypes" })
			List<TestimonialData> testimonial = jdbcTemplate.query( FiinfraConstants.SP_ADD_TESTIMONIALS,new Object[] {testimonialData.getId(),testimonialData.getUrl(),testimonialData.getText(),testimonialData.getPartyId(),testimonialData.getPartnerId(),testimonialData.getClientId(),testimonialData.getStatusRefId(),testimonialData.getUserID(),testimonialData.getBuPartyId()}, new BeanPropertyRowMapper(TestimonialData.class));
			/*  @url nVARCHAR(MAX),
				@testimonialText nVARCHAR(MAX),
				@partyId int,
				@partnerId int,
				@clientId int,
				@statusRefID int,
				@userId int,
				@buId int*/
			
			
			br.setResponseListObject(testimonial);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			response = FiinfraResponseBuilder.getErrorResponse(e.getMessage()
					.toString());
			logger.info(response);
		} finally {
			return response;
		}
	
	}



	@Override
	public Response deleteTestimonial(String selectedlvalz,int id) {
		BaseResponse<TestimonialData> br = new BaseResponse<TestimonialData>();
		try {
			List<TestimonialData> count;
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(FiinfraConstants.BU_DEFAULT));
			count = jdbcTemplate.query(FiinfraConstants.SP_USP_DELETE_TESTIMONIAL,
					new Object[] { selectedlvalz,id },
					new BeanPropertyRowMapper<TestimonialData>(TestimonialData.class));
			br.setResponseListObject(count);
			response = FiinfraResponseBuilder.getSuccessResponse(br, null);
		} catch (DataAccessException e) {
			FiinfraResponseBuilder.getErrorResponse(e.getMessage().toString());
		} finally {
			return response;
		}

	}

	@Override
	public HeirarchyData getHeirarchyDataForSP(int partyId, int currentNodeId,int level,int rootId) {
		
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(currentNodeId));
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(level));
		
		
		HeirarchyData heirarchyData=new HeirarchyData();
		List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
		CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
				jdbcTemplate, "usp_srp_getHeirarchyDetailsForSP");
		SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
		SqlParameter currentNodeIdParam = new SqlParameter("currentNodeId", Types.INTEGER);
		SqlParameter levelParam = new SqlParameter("level", Types.INTEGER);
		SqlParameter rootName = new SqlParameter("rootID", Types.INTEGER);
		
		SqlParameter[] paramArray = { partyIdParam, currentNodeIdParam, levelParam ,rootName};
		myStoredProcedure.setParameters(paramArray);
		myStoredProcedure.compile();
		Map<String, Object> paranValues = new HashMap<String, Object>();
		paranValues.put("partyId", partyId);
		paranValues.put("currentNodeId", currentNodeId);
		paranValues.put("level", level);
		paranValues.put("rootID", rootId);
	
		/*System.out.println(partyId+"partyId");
		System.out.println(currentNodeId+"currentNodeId");
		System.out.println(level+"level");
		System.out.println(rootId+"rootname");
		*/
		Map<String, Object> storedProcResult = myStoredProcedure
				.execute(paranValues);
//		System.out.println("storedProcResult:---" + storedProcResult);
		//Location details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
		//System.out.println("l:--" + l);
		List<LocationData> locationDatas=new ArrayList<>();
		LocationData locationData=null;
		if (l != null) {
			for (Map<String, Object> row : l) {
				locationData= new LocationData();
				locationData.setLocationId((int) row.get("LocationId"));
				locationData.setLocationName((String) row.get("LocationName"));
				locationData.setLocationDescription((String) row.get("LocationDesc"));
				locationData.setParentNodeId((int) row.get("LocationParentNode"));
				locationData.setLevel((int) row.get("LocationLevel"));
				locationData.setDisplaySeqNo((int) row.get("LocationDisplaySeq"));
				locationDatas.add(locationData);
			}
		}
		
		
		//Partner LOcation details
		l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
		//System.out.println("l:--" + l);
		List<PartnerHeirarchyData> partnerHeirarchyDatas = new ArrayList<>();
		PartnerHeirarchyData partnerHeirarchyData = null;
		if(l !=null) {
			for(Map<String, Object> row : l){
					partnerHeirarchyData=new PartnerHeirarchyData();
					partnerHeirarchyData.setUserName((String) row.get("UserName"));
					partnerHeirarchyData.setPartyId((int) row.get("PartyId"));
					partnerHeirarchyData.setCurrentNodeId((int) row.get("CurrentNode"));
					partnerHeirarchyData.setLocationId((int) row.get("NodeId"));
					partnerHeirarchyData.setLocationName((String) row.get("NodeName"));
					partnerHeirarchyData.setLocationDescription((String) row.get("NodeDesc"));
					partnerHeirarchyData.setParentNodeId((int) row.get("ParentNode"));
					partnerHeirarchyData.setLevel((int) row.get("Level"));
					partnerHeirarchyData.setDisplaySeqNo((int) row.get("DisplaySeq"));
					partnerHeirarchyData.setHeadOfNode((boolean) row.get("headOfNode"));
					partnerHeirarchyDatas.add(partnerHeirarchyData);
			}
		}
		heirarchyData.setLstLocationData(locationDatas);
		heirarchyData.setLstPartnerHeirarchyData(partnerHeirarchyDatas);

		return heirarchyData;
	}



	@Override
	public Response getHeirarchyUserName(Partner partner) {

		
	       BaseResponse<Partner> br = new BaseResponse<Partner>();
		try
		{
		List<Partner> bupartyName;
		jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
		bupartyName=jdbcTemplate.query(FiinfraConstants.SP_GET_HEIRARCHY_USER,new Object[]{partner.getBuPartyId(),partner.getCurrentNode()} ,new BeanPropertyRowMapper<Partner>(Partner.class));
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


	
		@SuppressWarnings("unchecked")
		@Override
		public Response addHeirarchyUser(Partner partner) {

		/*
			System.out.println(partner.getPartyID()+"partner.getPartyID()");
			System.out.println( partner.getCurrentNode()+", partner.getCurrentNode()");
			System.out.println( partner.getHeadNode()+" partner.getHeadNode()");
			*/
			 BaseResponse<Integer> br = new BaseResponse();
				try
				{
					Integer bupartyName;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_HEIRARCHY_USER,new Object[] {partner.getPartyID(), partner.getNodeId(), partner.getHeadNode() },Integer.class);
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
		
		@Override
		public HeirarchyData getHeirarchyData(int partyId, int buId) {
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
			
			HeirarchyData heirarchyData=new HeirarchyData();
			List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
			CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
					jdbcTemplate, "usp_srp_getHeirarchyDetails");
			SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);

			SqlParameter[] paramArray = { partyIdParam };
			myStoredProcedure.setParameters(paramArray);
			myStoredProcedure.compile();
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("partyId", buId);
		
			Map<String, Object> storedProcResult = myStoredProcedure
					.execute(buId);
			//System.out.println("storedProcResult:---" + storedProcResult);
			//Location details
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			//System.out.println("l:--" + l);
			List<LocationData> locationDatas=new ArrayList<>();
			LocationData locationData=null;
			if (l != null) {
				for (Map<String, Object> row : l) {
					locationData= new LocationData();
					locationData.setLocationId((int) row.get("LocationId"));
					locationData.setLocationName((String) row.get("LocationName"));
					locationData.setLocationDescription((String) row.get("LocationDesc"));
					locationData.setParentNodeId((int) row.get("LocationParentNode"));
					locationData.setLevel((int) row.get("LocationLevel"));
					locationData.setDisplaySeqNo((int) row.get("LocationDisplaySeq"));
					locationDatas.add(locationData);
				}
			}
			
			
			//Partner LOcation details
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
			//System.out.println("l:--" + l);
			List<PartnerHeirarchyData> partnerHeirarchyDatas = new ArrayList<>();
			PartnerHeirarchyData partnerHeirarchyData = null;
			if(l !=null) {
				for(Map<String, Object> row : l){
						partnerHeirarchyData=new PartnerHeirarchyData();
						partnerHeirarchyData.setUserName((String) row.get("UserName"));
						partnerHeirarchyData.setPartyId((int) row.get("PartyId"));
						partnerHeirarchyData.setCurrentNodeId((int) row.get("CurrentNode"));
						partnerHeirarchyData.setLocationId((int) row.get("NodeId"));
						partnerHeirarchyData.setLocationName((String) row.get("NodeName"));
						partnerHeirarchyData.setLocationDescription((String) row.get("NodeDesc"));
						partnerHeirarchyData.setParentNodeId((int) row.get("ParentNode"));
						partnerHeirarchyData.setLevel((int) row.get("Level"));
						partnerHeirarchyData.setDisplaySeqNo((int) row.get("DisplaySeq"));
						partnerHeirarchyData.setHeadOfNode((boolean) row.get("headOfNode"));
						partnerHeirarchyDatas.add(partnerHeirarchyData);
				}
			}
			heirarchyData.setLstLocationData(locationDatas);
			heirarchyData.setLstPartnerHeirarchyData(partnerHeirarchyDatas);

			return heirarchyData;
		}



	
		@Override
		public HeirarchyData getHeirarchyDataForVP(int partyId, int currentNodeId,int level) {
			
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(partyId));
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(currentNodeId));
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(level));
			
			HeirarchyData heirarchyData=new HeirarchyData();
			List<Map<String, Object>> l = new ArrayList<Map<String, Object>>();
			CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
					jdbcTemplate, "usp_srp_getHeirarchyDetailsForSPTress");
			SqlParameter partyIdParam = new SqlParameter("partyId", Types.INTEGER);
			SqlParameter currentNodeIdParam = new SqlParameter("currentNodeId", Types.INTEGER);
			SqlParameter levelParam = new SqlParameter("level", Types.INTEGER);
			
			SqlParameter[] paramArray = { partyIdParam, currentNodeIdParam, levelParam };
			myStoredProcedure.setParameters(paramArray);
			myStoredProcedure.compile();
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("partyId", partyId);
			paranValues.put("currentNodeId", currentNodeId);
			paranValues.put("level", level);
		
			Map<String, Object> storedProcResult = myStoredProcedure
					.execute(paranValues);
			//System.out.println("storedProcResult:---" + storedProcResult);
			//Location details
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-1");
			//System.out.println("l:--" + l);
			List<LocationData> locationDatas=new ArrayList<>();
			LocationData locationData=null;
			if (l != null) {
				for (Map<String, Object> row : l) {
					locationData= new LocationData();
					locationData.setLocationId((int) row.get("LocationId"));
					locationData.setLocationName((String) row.get("LocationName"));
					locationData.setLocationDescription((String) row.get("LocationDesc"));
					locationData.setParentNodeId((int) row.get("LocationParentNode"));
					locationData.setLevel((int) row.get("LocationLevel"));
					locationData.setDisplaySeqNo((int) row.get("LocationDisplaySeq"));
					locationDatas.add(locationData);
				}
			}
			
			
			//Partner LOcation details
			l = (List<Map<String, Object>>) storedProcResult.get("#result-set-2");
			//System.out.println("l:--" + l);
			List<PartnerHeirarchyData> partnerHeirarchyDatas = new ArrayList<>();
			PartnerHeirarchyData partnerHeirarchyData = null;
			if(l !=null) {
				for(Map<String, Object> row : l){
						partnerHeirarchyData=new PartnerHeirarchyData();
						partnerHeirarchyData.setUserName((String) row.get("UserName"));
						partnerHeirarchyData.setPartyId((int) row.get("PartyId"));
						partnerHeirarchyData.setCurrentNodeId((int) row.get("CurrentNode"));
						partnerHeirarchyData.setLocationId((int) row.get("NodeId"));
						partnerHeirarchyData.setLocationName((String) row.get("NodeName"));
						partnerHeirarchyData.setLocationDescription((String) row.get("NodeDesc"));
						partnerHeirarchyData.setParentNodeId((int) row.get("ParentNode"));
						partnerHeirarchyData.setLevel((int) row.get("Level"));
						partnerHeirarchyData.setDisplaySeqNo((int) row.get("DisplaySeq"));
						partnerHeirarchyData.setHeadOfNode((boolean) row.get("headOfNode"));
						partnerHeirarchyDatas.add(partnerHeirarchyData);
				}
			}
			heirarchyData.setLstLocationData(locationDatas);
			heirarchyData.setLstPartnerHeirarchyData(partnerHeirarchyDatas);

			return heirarchyData;
		}



		@Override
		public Partner getUserDetails(int partyId, int buId) {
		
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(buId));
			//System.out.println(partyId+"partyId");
			Partner p= jdbcTemplate.queryForObject(FiinfraConstants.SP_RETRIVE_USER_DETAILS, new Object[]{partyId,buId}, 
					new BeanPropertyRowMapper<Partner>(Partner.class));
			//System.out.println("In APP="+p.getUserName());
			//System.out.println("In APP="+p.getLastName());
			return p;
			
			
			
			
		}



		@Override
		public Response getUserSession(Partner partner) {
			 BaseResponse<Partner> br = new BaseResponse<Partner>();
				try
				{
					Partner bupartyName;
				jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
				bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_SET_USER_SESSION,new Object[]{partner.getPartyID(),partner.getBuPartyId()} ,new BeanPropertyRowMapper<Partner>(Partner.class));
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



	/*	@Override
		public Boolean updateCurrentNodeIdForPartyId(int partyId, int nodeId) {
			// TODO Auto-generated method stub
			return null;
		}
		*/
		@Override
		public Boolean updateCurrentNodeIdForPartyId(int partyId,int nodeId,int buPartyID)
		{
		
			
		
			Integer bupartyName;
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(FiinfraConstants.BU_DEFAULT));
			bupartyName=jdbcTemplate.queryForObject(FiinfraConstants.SP_UPDATE_CURRENT_NODEID_FORPARTYID,new Object[] {partyId,nodeId,buPartyID },Integer.class);
		
			
			
		
			
		//	int result=jdbcTemplate.update(FiinfraConstants.SP_UPDATE_CURRENT_NODEID_FORPARTYID, new Object[] {partyId,nodeId,buPartyID});
		//	System.out.println(result);
			if(bupartyName>0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		

		@Override
		public List<Integer> deletePartnerLocationData(LocationData locationData) {
			int recordCount=0;
			int isChildNodeExist=0;
			List<Integer> resultList=new ArrayList<>();
			System.out.println("In Dao deletePartnerLocationData Impl ");
			jdbcTemplate.setDataSource(dataSourceProvider.getDataSource(123));
			CommonStoredProcedure myStoredProcedure = new CommonStoredProcedure(
					jdbcTemplate, "usp_srp_deleteLocation");
			SqlParameter locationIdParam = new SqlParameter("locationId", Types.INTEGER);
			SqlOutParameter recordCountParam = new SqlOutParameter("recordCount",Types.INTEGER);
			SqlOutParameter isChildNodeExistParam = new SqlOutParameter("isChildNodeExist", Types.VARCHAR);
			
			SqlParameter[] paramArray = { locationIdParam, recordCountParam, isChildNodeExistParam};
			
			myStoredProcedure.setParameters(paramArray);
			myStoredProcedure.compile();
			Map<String, Object> paranValues = new HashMap<String, Object>();
			paranValues.put("locationId", locationData.getLocationId());
		
			logger.debug("paranValues:--" + paranValues);
			Map<String, Object> storedProcResult = myStoredProcedure
					.execute(paranValues);
			logger.debug("storedProcResult:------" + storedProcResult);
//			recordCount=(int) storedProcResult.get("recordCount");
			recordCount=Integer.parseInt(storedProcResult.get("recordCount").toString());
			isChildNodeExist=Integer.parseInt(storedProcResult.get("isChildNodeExist").toString());
//			isChildNodeExist=(int) storedProcResult.get("isChildNodeExist");
			//System.out.println("Record Count......."+recordCount);
			//System.out.println("isChildNodeExist ......."+isChildNodeExist);
			resultList.add(recordCount);		
			resultList.add(isChildNodeExist);
			return resultList;
		}
/*
		@Override
		public List<Integer> deletePartnerLocationData(LocationData locationData) {
			// TODO Auto-generated method stub
			return null;
		}*/



		@Override
		public Integer deleteUser(int partyId, int buId) {
		Integer rcnt=0;
		
			
			jdbcTemplate.setDataSource(dataSourceProvider
					.getDataSource(buId));
			rcnt = jdbcTemplate.queryForInt(
					FiinfraConstants.SP_DELETE_USER_HIERARCHY, new Object[] {partyId,buId});
			//System.out.println("Record Count============="+rcnt);
			
			
		
			return rcnt;
		}

/*

	@Override
	public void addNewDownload(
			boolean documentBinary, String documentName,
			String fileName,
			String fileStoragePathURI,  int fileSizeKB,
			int partyId, boolean isDownloadModule, int downloadModuleID,
			String downloadDescription, int createdBy, int lastModifiedBy,
			 boolean isShareEmail,
			boolean isShareView, boolean isShareDownload,Date downloadExpiryDate) {
		    
		    int rowcnt=jdbcTemplate.queryForObject(FiinfraConstants.SP_ADD_NEW_DOC_TO_DOWNLOAD,new Object[] { 
				
				documentBinary,documentName,
				fileName,
				fileStoragePathURI,fileSizeKB,
				partyId,isDownloadModule,downloadModuleID,
				downloadDescription,createdBy,lastModifiedBy,
				isShareEmail,
				isShareView,isShareDownload,downloadExpiryDate }, Integer.class);
		    System.out.println(rowcnt);
		   
		    
	}
*/
	

	

}
