package in.fiinfra.serviceportal.service;


import in.fiinfra.common.diy.models.Task;
import in.fiinfra.common.service.vo.Partner;
import in.fiinfra.common.service.vo.User;

import java.util.List;

import javax.ws.rs.core.Response;

public interface PartnerSPService {

	//Response showPartnerList(String buId,String userId,String searchText);
	Response showPartnerList(Partner partner);
	Response addPartner(String firstName,String lastName, String companyName, String contactEmail, Long contactMobile,String ARN, String pst, String pkt, String pot, String rm, String rmHead,String buId,String userId,String euin,String state,String location,String loginName, String hdnpassword, String communicationEmailId);
	Response editPartner(String firstName,String lastName, String companyName, String contactEmail, Long contactMobile,String ARN, String pst, String pkt, String pot, String rm, String rmHead,String buId, String userId, String partyId,String euin,String state,String location, String communicationEmailId);
	Response getPSTPKTPOTNames(String buId);
	Response searchPSTPKTPOT(String buId,String deptTypeId);
	Response addSTAforPartner(String pst, String pkt, String pot, String rm, String rmHead,String partnerspartyid);
	Response addBulkSTAforPartner(String pst, String pkt, String pot, String rm, String rmHead,String partnerspartyidz);
	Response deletePartner(String deletelist,int lastmodifyby);
	Response getLocation();
	Response getUniqueArn(String arn);
	Response getUniqueCommunicationEmail(Partner partner);
	Response getLoginName(String partyId);
	Response showTopPartnerList(int buId,int userId);
	List<List<Partner>> insertBulkPartner(String bulkPartnerXML);
	Response showLoginHistory(String searchText,String userId);
	Response assignCommunicationEmail(String communname,String contactEmail,String buId, String userId, String partyId);
	Response sendWelcomeMail(String userDataXML);
	Response getTaskListAssign(User user);
	Response getParnerListforTask(Task task);
	Response getTaskDetail(Task task);
	Response movePartner(Partner partner);
	Response getPartnerListForChange(Partner partner);
	Response moveClientOrOpportunity(Partner partner);
	Response getListOfTask(Integer partyID, String subject, Integer integer);
	Response getOnboardChecklist(Partner partner);
	Response getlegendsChecklist(Partner partner);
	
	
		Response getTaskAlert(Task task);
		Response saveChecklist(Partner partner);
		Response savelegends(Partner partner);
				Response getRMlist(Partner partner);
}
