package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.TeamMember;
import in.fiinfra.common.service.vo.TeamMemberAllocation;

import javax.ws.rs.core.Response;


public interface TeamMemberServices 
{
	public Response getAllTeamMember(TeamMember teamMember) ;
	
	public Response getUniqueMemberName(TeamMember teamMember);
	
	public Response addTeamMember(TeamMember teamMember);
	
	public Response updateTeamMember(TeamMember teamMember);
	
	public Response deleteTeamMember(TeamMember teamMember);
	
	public Response getAllocationList(int partyID);
	
	public Response getDepartmentName(int buid);
	
	public Response getUnqAllocation(int partyID, int buid,int departmentId);
	
	public Response addNewAllocation(TeamMemberAllocation teamMemberAllocation);
	
	public Response updateAllocation(TeamMemberAllocation teamMemberAllocation);
	
	public Response deleteAllocation(TeamMemberAllocation teamMemberAllocation);
	
	public Response getAvailableBizUnitDeptList();
	
	public Response addBulkAllocation(TeamMember teamMember);
	/*List<TeamMember> getUnqMemberName(String userName);
	
	List<TeamMember>addTeamMember(String firstName,String middleName, String lastName, String userName, String contactemail, String contactMobile, String passwordId);
	List<TeamMember>updateTeamMember(int partyID, String contactemail, String contactMobile);
	List<TeamMember>deleteTeamMember(String deletelist);
	
	//Allocation List
	List<TeamMemberAllocation> getDepartmentAllocationListForPartyId(int partyID);
	List<TeamMemberAllocation>getAllBizUnit() ;
	List<MemberAllocation>getDrpartmentName(int buid);
	List<UniqueAllocation> getUnqAllocation(int partyID, int buid,int departmentId);
	List<TeamMemberAllocation> addNweAllocation(int partyID, int bizunit, int departmentId, Date allocationStartDate, Date allocationEndDate,boolean status);
	List<TeamMemberAllocation> updateTeamMember(int teammemberId, int buid, int departmentId, Date allocationStartDate, Date allocationEndDate, boolean status);
	List<TeamMemberAllocation> deleteAllocation(String deletelist );*/
	
	
	
	
	
}
