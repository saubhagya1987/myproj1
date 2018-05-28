package in.fiinfra.serviceportal.service;



import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.service.vo.Download;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.cp.TestimonialData;
import in.fiinfra.serviceportal.dao.DownloadDao;
import in.fiinfra.serviceportal.dao.TestimonialDao;

import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class TestimonialServicesImpl implements  TestimonialServices
{
	@Autowired
	private TestimonialDao testimonialDao;
	
	
	public TestimonialDao getTestimonialDao() {
		return testimonialDao;
	}


	public void setTestimonialDao(TestimonialDao testimonialDao) {
		this.testimonialDao = testimonialDao;
	}


	@Override
	public Response getTestimonials(TestimonialData testimonialData) {
		Response resp=testimonialDao.getTestimonials(testimonialData);
		return resp;
	}


	@Override
	public Response addTestimonial(TestimonialData testimonialData) {
		Response resp=testimonialDao.addTestimonial(testimonialData);
		return resp;
	}


	@Override
	public Response editTestimonial(TestimonialData testimonialData) {
		Response resp=testimonialDao.editTestimonial(testimonialData);
		return resp;
	}


	@Override
	public Response deleteTestimonial(String selectedlvalz,int userid) {
		Response resp=testimonialDao.deleteTestimonial(selectedlvalz,userid);
		return resp;
	}

	@Override
	public HeirarchyData getHeirarchyDataForSP(int partyId, int currentNodeId,int level,int rootId) {
		
		HeirarchyData heirarchyData=testimonialDao.getHeirarchyDataForSP(partyId,currentNodeId,level,rootId);
		return heirarchyData ;
	}


	@Override
	public Response getHeirarchyUserName(Partner partner) {
		
		
		Response resp=testimonialDao.getHeirarchyUserName(partner);
		return resp;
	}


	@Override
	public Response addHeirarchyUser(Partner partner) {
		
		Response resp=testimonialDao.addHeirarchyUser(partner);
		return resp;
	}


	@Override
	public HeirarchyData getHeirarchyData(int partyId, int buId) {
		
		HeirarchyData heirarchyData=testimonialDao.getHeirarchyData(partyId,buId);
		return heirarchyData ;
	}


	@Override
	public HeirarchyData getHeirarchyDataForVP(int partyId, int currentNodeId,
			int level) {
		HeirarchyData heirarchyData=testimonialDao.getHeirarchyDataForVP(partyId,currentNodeId,level);
		return heirarchyData ;
	}


	@Override
	public Partner getUserDetails(int partyId, int buId) {
		Partner partner=testimonialDao.getUserDetails(partyId,buId);
		return partner;
	}


	@Override
	public Response getUserSession(Partner partner) {
		Response resp=testimonialDao.getUserSession(partner);
		return resp;
	}


	/*@Override
	public Boolean updateCurrentNodeIdForPartyId(int partyId, int nodeId) {
		// TODO Auto-generated method stub
		return null;
	}
	*/
	public Boolean updateCurrentNodeIdForPartyId(int partyId,int nodeId,int buPartyID)
	{
		return  testimonialDao.updateCurrentNodeIdForPartyId(partyId,nodeId,buPartyID);
	}


	/*@Override
	public List<Integer> deletePartnerLocationData(LocationData locationData) {
		// TODO Auto-generated method stub
		return null;
	}*/
	
	
	@Override
	public List<Integer> deletePartnerLocationData(LocationData locationData) {
		List<Integer> recordCount=testimonialDao.deletePartnerLocationData(locationData);
		return recordCount;
	}


	@Override
	public Integer deleteUser(int partyId, int buId) {

		return  testimonialDao.deleteUser(partyId,buId);
	}
	
/*
	@Override
	public void addNewDownload( 
			boolean documentBinary, String documentName,
			String fileName,
			String fileStoragePathURI, int fileSizeKB,
			int partyId, boolean isDownloadModule, int downloadModuleID,
			String downloadDescription, int createdBy, int lastModifiedBy,
			 boolean isShareEmail,
			boolean isShareView, boolean isShareDownload,Date downloadExpiryDate) {
		System.out.println("gone");
		downloadDao.addNewDownload(documentBinary, documentName,  fileName, fileStoragePathURI, fileSizeKB, partyId, isDownloadModule, downloadModuleID, downloadDescription, createdBy, lastModifiedBy, isShareEmail, isShareView, isShareDownload,downloadExpiryDate);

		
	}*/


}
