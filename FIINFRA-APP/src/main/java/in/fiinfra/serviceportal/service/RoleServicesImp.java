package in.fiinfra.serviceportal.service;

import org.springframework.beans.factory.annotation.Autowired;

import in.fiinfra.common.service.vo.Role;
import in.fiinfra.common.service.vo.RoleAccess;
import in.fiinfra.serviceportal.dao.RoleListDao;

import javax.ws.rs.core.Response;

public class RoleServicesImp implements RoleServices {

	@Autowired
	private RoleListDao roleListDao;

	public RoleListDao getRoleListDao() {
		return roleListDao;
	}

	public void setRoleListDao(RoleListDao roleListDao) {
		this.roleListDao = roleListDao;
	}

	@Override
	public Response getRoleList(Role role) {
		Response updateRole = null;
		updateRole = roleListDao.getRoleList(role);
		return updateRole;
	}

	@Override
	public Response deleteRole(Role role) {
		Response updateRole = null;
		updateRole = roleListDao.deleteRole(role);
		return updateRole;
	}

	@Override
	public Response uiqueRoleName(Role role) {
		Response name = null;
		name = roleListDao.uiqueRoleName(role);
		return name;

	}

	@Override
	public Response addNewRole(Role roleData)
	{
		Response addRole = null;
		addRole = roleListDao.addNewRole(roleData);
		return addRole;
	}

	@Override
	public Response roleUpdate(Role roleData) {
		Response result = roleListDao.roleUpdate(roleData);
		return result;
	}

	@Override
	public Response getAllRoleAccessList(RoleAccess roleAccess) {
		Response result = roleListDao.getAllRoleAccessList(roleAccess);
		return result;
	}

	@Override
	public Response getSourceSystemList() {
		Response result = roleListDao.getSourceSystemList();
		return result;
	}

	@Override
	public Response updateRoleAccessList(String objectIdList,int roleId,int createdby, int sourceId) {
		Response result = roleListDao.updateRoleAccessList(objectIdList,roleId,createdby,sourceId);
		return result;
	}

}
