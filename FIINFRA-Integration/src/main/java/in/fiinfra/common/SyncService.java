package in.fiinfra.common;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.common.DocumentRequest;
import in.fiinfra.common.common.SyncRequest;
import in.fiinfra.common.common.UserTokenRequest;
import in.fiinfra.common.diy.models.SyncData;
import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.ContactSyncResponse;


import org.springframework.stereotype.Service;

@Service("SyncService")
public class SyncService extends BasicService {

	public BaseResponse<SyncData> getSyncData(SyncRequest req) {
		return getService().getBaseResponseForObject(Services.GET_GET_SYNC_DATA, req,
				SyncData.class, appendPathParam());
	}

	public BaseResponse<Boolean> register(UserTokenRequest req){
		return getService().getBaseResponseForObject(Services.Register_By_Username, req,
				Boolean.class, new String[0]);
	}
	
	public BaseResponse<String> activate(UserTokenRequest req){
		return getService().getBaseResponseForObject(Services.activate, req,
				String.class, new String[0]);
	}
	
	public BaseResponse<SyncData> confirmToken(UserTokenRequest req){
		return getService().getBaseResponseForObject(Services.confirmToken, req,
				SyncData.class, new String[0]);
	}

	public BaseResponse<ContactSyncResponse> saveSync(SyncData data){
		return getService().postForObject(Services.saveSync, data,
				ContactSyncResponse.class, new String[0]);
	}

	public DocumentData getDocument(DocumentRequest req){
		
		return getService().getForObject(Services.getDocument, req, DocumentData.class, appendPathParam());
		
	}
}
