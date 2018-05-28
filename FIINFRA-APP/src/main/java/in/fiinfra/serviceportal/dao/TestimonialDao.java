package in.fiinfra.serviceportal.dao;





import in.fiinfra.common.partner.HeirarchyData;
import in.fiinfra.common.partner.LocationData;
import in.fiinfra.common.service.vo.Download;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.cp.TestimonialData;

import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

public interface TestimonialDao {
	
	Response getTestimonials(TestimonialData testimonialData);
	
	Response addTestimonial(TestimonialData testimonialData);

	Response editTestimonial(TestimonialData testimonialData);

	Response deleteTestimonial(String selectedlvalz,int id);

	HeirarchyData getHeirarchyDataForSP(int partyId, int currentNodeId,
			int level, int rootname);

	Response getHeirarchyUserName(Partner partner);

	Response addHeirarchyUser(Partner partner);

	HeirarchyData getHeirarchyData(int partyId, int buId);

	HeirarchyData getHeirarchyDataForVP(int partyId, int currentNodeId,
			int level);

	Partner getUserDetails(int partyId, int buId);

	Response getUserSession(Partner partner);

	Boolean updateCurrentNodeIdForPartyId(int partyId, int nodeId,int buPartyID);

	List<Integer> deletePartnerLocationData(LocationData locationData);

	Integer deleteUser(int partyId, int buId);
	
}


