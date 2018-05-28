package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.TeamMember;
import in.fiinfra.common.service.vo.TeamMemberAllocation;
import in.fiinfra.serviceportal.dao.TeamMemberDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;



public class TeamMemberServicesImpl implements TeamMemberServices
{

	@Autowired     
	private TeamMemberDao teamMemberDao;
	
	public TeamMemberDao getTeamMemberDao() 
	{
		return teamMemberDao;
	}
	public void setTeamMemberDao(TeamMemberDao teamMemberDao) 
	{
		this.teamMemberDao = teamMemberDao;
	}
	
	
	@Override
	public Response getAllTeamMember(TeamMember teamMember) {
		Response teamMemberList = teamMemberDao.getAllTeamMember(teamMember);
		return teamMemberList;
	}
	
	@Override
	public Response getUniqueMemberName(TeamMember teamMember) {
		Response unqMember = teamMemberDao.getUniqueMemberName(teamMember);
		return unqMember;
	}
	
	@Override
	public Response addTeamMember(TeamMember teamMember) {
		Response result = teamMemberDao.addTeamMember(teamMember);
		return result;
	}
	@Override
	public Response updateTeamMember(TeamMember teamMember) {
		Response result = teamMemberDao.updateTeamMember(teamMember);
		return result;
	}
	@Override
	public Response deleteTeamMember(TeamMember teamMember) {
		Response delResult = teamMemberDao.deleteTeamMember(teamMember);
		return delResult;
		
	}
	
	
	
	@Override
	public Response getAllocationList(int partyID) {
		Response alloRes = teamMemberDao.getAllocationList(partyID);
		return alloRes;
	}
	@Override
	public Response getDepartmentName(int buid) {
		Response result = teamMemberDao.getDepartmentName(buid);
		return result;
	}
	@Override
	public Response getUnqAllocation(int partyID, int buid, int departmentId) {
		Response result = teamMemberDao.getUnqAllocation(partyID, buid, departmentId);
		return result;
	}
	@Override
	public Response addNewAllocation(TeamMemberAllocation teamMemberAllocation) {
		Response result = teamMemberDao.addNewAllocation(teamMemberAllocation);
		return result;
	}
	@Override
	public Response updateAllocation(TeamMemberAllocation teamMemberAllocation) {
		Response result = teamMemberDao.updateAllocation(teamMemberAllocation);
		return result;
	}
	@Override
	public Response deleteAllocation(TeamMemberAllocation teamMemberAllocation) {
		Response result = teamMemberDao.deleteAllocation(teamMemberAllocation);
		return result;
	}
	@Override
	public Response getAvailableBizUnitDeptList() {
		Response result = teamMemberDao.getAvailableBizUnitDeptList();
		return result;
	}
	@Override
	public Response addBulkAllocation(TeamMember teamMember) {
		Response result = teamMemberDao.addBulkAllocation(teamMember);
		return result;
	}

	
	
	
	
	
	
	/*@Autowired     
	private TeamMemberDao teamMemberDao;


	public TeamMemberDao getTeamMemberDao() 
	{
		return teamMemberDao;
	}
	public void setTeamMemberDao(TeamMemberDao teamMemberDao) 
	{
		this.teamMemberDao = teamMemberDao;
	}
	
	
	@Override
	public List<TeamMember> getAllTeamMember() 
	{
		List<TeamMember> updateteamMember=teamMemberDao.getAllTeamMember();
		return updateteamMember;
	}
	@Override
	public List<TeamMember> getUnqMemberName(String userName) 
	{
		 List<TeamMember>user=teamMemberDao.getUnqMemberName(userName);
		 return user;
	}
	@Override
	public List<TeamMember> addTeamMember(String firstName,String middleName, String lastName, String userName, String contactemail, String contactMobile, String passwordId) 
	{
		System.out.println("Hi in service........................!");
		List<TeamMember>teamMemberList=teamMemberDao.addTeamMember( firstName, middleName,  lastName,  userName,  contactemail,  contactMobile, passwordId);
		return teamMemberList;
		
	}
	@Override
	public List<TeamMember> updateTeamMember(int partyID, String contactemail, String contactMobile) 
	{
		System.out.println("Hi in service.........................!");
		List<TeamMember>updateTeamMemberList=teamMemberDao.updateTeamMember( partyID, contactemail,  contactMobile);
		return updateTeamMemberList;
		
	}
	@Override
	public List<TeamMember> deleteTeamMember(String deletelist) 
	{
		System.out.println("Hi in service"+deletelist);
		List<TeamMember>updateTeamMember=teamMemberDao.deleteTeamMember(deletelist);
		return updateTeamMember;
		
	}
	
	// Allocation Department
	
	@Override
	public List<TeamMemberAllocation> getDepartmentAllocationListForPartyId(int partyID) 
	{
		
		List<TeamMemberAllocation>  allocationList=teamMemberDao.getDepartmentAllocationListForPartyId(partyID);
		return allocationList;
	}
	@Override
	public List<TeamMemberAllocation> getAllBizUnit()
	{
		List<TeamMemberAllocation> bizunitname=teamMemberDao.getAllBizUnit();
	    return bizunitname;
	}

	@Override
	public List<MemberAllocation> getDrpartmentName(int buid)
	{
		List<MemberAllocation> departmentname=teamMemberDao.getDrpartmentName(buid);
	    return departmentname;

	}
	
	@Override
	public List<UniqueAllocation> getUnqAllocation(int partyID, int buid, int departmentId) 
	{
		 List<UniqueAllocation>allocation=teamMemberDao.getUnqAllocation( partyID, buid, departmentId);
		 return allocation;
	}
	
	@Override						
	public List<TeamMemberAllocation> addNweAllocation(int partyID, int bizunit, int departmentId, Date allocationStartDate, Date allocationEndDate, boolean status) 
	{
		List<TeamMemberAllocation>addNweAllocation=teamMemberDao.addNweAllocation(partyID, bizunit, departmentId, allocationStartDate, allocationEndDate, status);
		return addNweAllocation;
	}
	
	@Override
	public List<TeamMemberAllocation> deleteAllocation(String deletelist) 
	{
		System.out.println("Hi in service"+deletelist);
		List<TeamMemberAllocation>updateAllocation=teamMemberDao.deleteAllocation(deletelist);
		return updateAllocation;
		
	}
	
	@Override
	public List<TeamMemberAllocation> updateTeamMember(int teammemberId, int buid, int departmentId, Date allocationStartDate, Date allocationEndDate, boolean status) 
	{
		List<TeamMemberAllocation>updateTeamMemberList=teamMemberDao.updateTeamMember(teammemberId, buid, departmentId, allocationStartDate, allocationEndDate, status);
		return updateTeamMemberList;
	}*/

	


}
