package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.Role;
import in.fiinfra.common.service.vo.RoleAccess;

import javax.ws.rs.core.Response;

public interface RoleListDao {

	public Response getRoleList(Role role);

	public Response uiqueRoleName(Role role);

	public Response deleteRole(Role role);

	public Response addNewRole(Role roleData);

	public Response roleUpdate(Role roleData);

	// role access
	public Response getAllRoleAccessList(RoleAccess roleAccess);

	public Response getSourceSystemList();
	
	public Response updateRoleAccessList(String objectIdList,int roleId,int createdby, int sourceId);

}
