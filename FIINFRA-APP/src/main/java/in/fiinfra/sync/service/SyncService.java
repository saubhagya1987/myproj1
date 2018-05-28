package in.fiinfra.sync.service;

import in.fiinfra.common.common.SyncRequest;
import in.fiinfra.common.common.UserTokenRequest;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.diy.models.UserToken;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.ContactSyncResponse;

import java.util.List;

public interface SyncService {

	List<ContactSyncResponse> saveSyncData(int buId, SyncData sync);

	SyncData getMasterData(SyncRequest req);

	BaseResponse<Boolean> register(UserTokenRequest request);
	
	BaseResponse<String> activateUserToken(UserTokenRequest req);
	
	List<UserToken> getUserToken(UserTokenRequest req);

	BaseResponse<SyncData> confirmToken(UserTokenRequest request);

}
