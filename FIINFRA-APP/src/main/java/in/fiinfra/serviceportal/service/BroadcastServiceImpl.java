package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.Broadcast;
import in.fiinfra.serviceportal.dao.BroadcastDao;

import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;

public class BroadcastServiceImpl implements BroadcastService {

	@Autowired
	private BroadcastDao broadcastDao;

	public BroadcastDao getBroadcastDao() {
		return broadcastDao;
	}

	public void setBroadcastDao(BroadcastDao broadcastDao) {
		this.broadcastDao = broadcastDao;
	}

	@Override
	public Response showBroadcastList(Broadcast broadcast) {
		Response broadcastList = broadcastDao.showBroadcastList(broadcast);
		return broadcastList;
	}

	@Override
	public Response getUserTypeList(Broadcast broadcast) {
		Response userTypeList = broadcastDao.getUserTypeList(broadcast);
		return userTypeList;
	}

	@Override
	public Response getAllRoleList(Broadcast broadcast) {
		Response roleList = broadcastDao.getAllRoleList(broadcast);
		return roleList;
	}

	
	@Override
	public Response deleteBroadCastList(Broadcast broadcast) {
		Response delBrodcast = broadcastDao.deleteBroadCastList(broadcast);
		return delBrodcast;
	}

	@Override
	public Response insertOrUpdateBroadcast(Broadcast broadcast) {
		Response result = broadcastDao.insertOrUpdateBroadcast(broadcast);
		return result;
	}

}
