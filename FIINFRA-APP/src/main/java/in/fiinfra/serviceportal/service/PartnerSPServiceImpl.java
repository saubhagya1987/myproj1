package in.fiinfra.serviceportal.service;





import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.User;
import in.fiinfra.serviceportal.dao.PartnerSPDao;

import java.util.List;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class PartnerSPServiceImpl implements PartnerSPService{

	@Autowired
	private PartnerSPDao partnerSPDao;
	

	public PartnerSPDao getPartnerSPDao() {
		return partnerSPDao;
	}


	public void setPartnerSPDao(PartnerSPDao partnerSPDao) {
		this.partnerSPDao = partnerSPDao;
	}
 

	@Override
	public Response showPartnerList(Partner partner ) {
		Response rs= partnerSPDao.showPartnerList(partner);
		return rs;
	}


	@Override
	public Response getRMlist(Partner partner ) {
		Response rs= partnerSPDao.getRMlist(partner);
		return rs;
	}



	@Override
	public Response addPartner(String firstName, String lastName,
			String companyName, String contactEmail, Long contactMobile,
			String ARN, String pst, String pkt, String pot, String rm, String rmHead, String buId,
			String userId, String euin,String state, String location, String loginName,
			String hdnpassword,String communicationEmailId) {
		Response result = null;
		result = partnerSPDao.addPartner(firstName, lastName, companyName,
				contactEmail, contactMobile, ARN, pst, pkt, pot,rm,rmHead, buId, userId,
				euin, state, location, loginName, hdnpassword,communicationEmailId);
		return result;
	}
	
	

	@Override
	public Response editPartner(String firstName, String lastName,
			String companyName, String contactEmail, Long contactMobile,
			String ARN, String pst, String pkt, String pot, String rm, String rmHead, String buId,
			String userId, String partyId, String euin, String state, String location,String communicationEmailId) {
		Response result = partnerSPDao.editPartner(firstName, lastName,
				companyName, contactEmail, contactMobile, ARN, pst, pkt, pot,rm,rmHead,
				buId, userId, partyId, euin, state, location,communicationEmailId);
		return result;
	}


	@Override
	public Response getPSTPKTPOTNames(String buId) {
		Response names=partnerSPDao.getPSTPKTPOTNames(buId);
		return names;
	}


	@Override
	public Response searchPSTPKTPOT(String buId, String deptTypeId) {
		Response names=partnerSPDao.searchPSTPKTPOT(buId, deptTypeId);
		return names;
	}


	@Override
	public Response addSTAforPartner(String pst, String pkt, String pot, String rm, String rmHead,
			String partnerspartyid) {
		Response result = null;
		result = partnerSPDao.addSTAforPartner(pst, pkt, pot,rm,rmHead, partnerspartyid);
		return result;
	}


	@Override
	public Response getLocation() {
		Response names=partnerSPDao.getLocation();
		return names;
	}


	@Override
	public Response getLoginName(String partyId) {
		Response names=partnerSPDao.getLoginName(partyId);
		return names;
	}


	@Override
	public Response showTopPartnerList(int buId, int userId) {
		Response names=partnerSPDao.showTopPartnerList(buId, userId);
		return names;
	}


	@Override
	public Response deletePartner(String deletelist,int lastmodifyby) {
		Response delPartner=partnerSPDao.deletePartner(deletelist,lastmodifyby);
		return delPartner;
	}


	@Override
	public List<List<Partner>> insertBulkPartner(String bulkPartnerXML) {
		List<List<Partner>> recordCount=partnerSPDao.insertBulkPartner(bulkPartnerXML);
		return recordCount;
	}


	@Override
	public Response getUniqueArn(String arn) {
		Response names=partnerSPDao.getUniqueArn(arn);
		return names;
	}


	@Override
	public Response addBulkSTAforPartner(String pst, String pkt, String pot, String rm, String rmHead,
			String partnerspartyidz) {
		Response result = null;
		result = partnerSPDao.addBulkSTAforPartner(pst, pkt, pot,rm,rmHead, partnerspartyidz);
		return result;
	}
	
	@Override
	public Response showLoginHistory(String searchText,String userId) {
		Response names=partnerSPDao.showLoginHistory(searchText,userId);
		return names;
	}


	@Override
	public Response assignCommunicationEmail(String communname,
			String contactEmail, String buId, String userId, String partyId) {
		Response result = partnerSPDao.assignCommunicationEmail(communname,
				contactEmail, buId, userId, partyId);
		return result;
	}


	@Override
	public Response sendWelcomeMail(String userDataXML) {
		Response result = null;
		result = partnerSPDao.sendWelcomeMail(userDataXML);
		return result;
	}


	@Override
	public Response getUniqueCommunicationEmail(Partner partner) {
		Response names=partnerSPDao.getUniqueCommunicationEmail(partner);
		return names;
	}


	@Override
	public Response getTaskListAssign(User user) {
		
		Response names=partnerSPDao.getTaskListAssign(user);
		return names;
		
		
	}


	@Override
	public Response getParnerListforTask(Task task) {
		Response names=partnerSPDao.getParnerListforTask(task);
		return names;
	}


	@Override
	public Response getTaskDetail(Task task) {
		Response names=partnerSPDao.getTaskDetail(task);
		return names;
	}


	@Override
	public Response movePartner(Partner partner) {
		// TODO Auto-generated method stub
		Response move=partnerSPDao.movePartner(partner);
		return move;
	}


	@Override
	public Response getPartnerListForChange(Partner partner) {
		Response move=partnerSPDao.getPartnerListForChange(partner);
		return move;
	}


	@Override
	public Response moveClientOrOpportunity(Partner partner) {
		Response move=partnerSPDao.moveClientOrOpportunity(partner);
		return move;
	}


	@Override
	public Response getListOfTask(Integer partyID, String subject,Integer nodeid) {
		Response response=partnerSPDao.getListOfTask(partyID, subject, nodeid);
		return response;
	}


	@Override
	public Response getOnboardChecklist(Partner partner) {
		
		
		Response move=partnerSPDao.getOnboardChecklist(partner);
		return move;
	}
	
	@Override
	public Response getlegendsChecklist(Partner partner) {
		
		
		Response move=partnerSPDao.getlegendsChecklist(partner);
		return move;
	}
	@Override
	public Response getTaskAlert(Task task) {
		Response response=partnerSPDao.getTaskAlert(task);
		return response;
	}


	@Override
	public Response saveChecklist(Partner partner) {
		Response response=partnerSPDao.saveChecklist(partner);
		return response;
	}

	@Override
	public Response savelegends(Partner partner) {
			Response response=partnerSPDao.savelegends(partner);
			return response;
	}
}
