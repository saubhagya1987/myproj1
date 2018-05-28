package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.TeamMember;
import in.fiinfra.common.service.vo.TeamMemberAllocation;

import javax.ws.rs.core.Response;

public interface TeamMemberDao {
	public Response getAllTeamMember(TeamMember teamMember);

	public Response getUniqueMemberName(TeamMember teamMember);

	public Response addTeamMember(TeamMember teamMember);

	public Response updateTeamMember(TeamMember teamMember);

	public Response deleteTeamMember(TeamMember teamMember);

	public Response getAllocationList(int partyID);

	public Response getDepartmentName(int buid);

	public Response getUnqAllocation(int partyID, int buid, int departmentId);

	public Response addNewAllocation(TeamMemberAllocation teamMemberAllocation);

	public Response updateAllocation(TeamMemberAllocation teamMemberAllocation);

	public Response deleteAllocation(TeamMemberAllocation teamMemberAllocation);

	public Response getAvailableBizUnitDeptList();

	public Response addBulkAllocation(TeamMember teamMember);

}
