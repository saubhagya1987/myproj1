package in.fiinfra.serviceportal.service;

import in.fiinfra.common.service.vo.Broadcast;

import javax.ws.rs.core.Response;

public interface BroadcastService {

	Response showBroadcastList(Broadcast broadcast);

	Response getUserTypeList(Broadcast broadcast);

	Response getAllRoleList(Broadcast broadcast);

	Response deleteBroadCastList(Broadcast broadcast);

	Response insertOrUpdateBroadcast(Broadcast broadcast);
}
