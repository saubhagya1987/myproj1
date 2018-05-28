package in.fiinfra.common.common;

import java.util.Date;

import javax.ws.rs.QueryParam;


public class SyncRequest extends BaseRequest {
	@QueryParam("lastSyncTime")
	private long lastSyncTime;
	
	@QueryParam("sourceSystemId")
	private Integer sourceSystemId;
	
	@Override
	protected void appendAll(StringBuilder sb) {
		
		super.appendAll(sb);
		append(sb, "sourceSystemId", this.sourceSystemId);
		append(sb, "lastSyncTime", this.lastSyncTime);
	}

	public Integer getSourceSystemId() {
		return sourceSystemId;
	}

	public void setSourceSystemId(Integer sourceSystemId) {
		this.sourceSystemId = sourceSystemId;
	}

	public long getLastSyncTime() {
		return lastSyncTime;
	}

	public void setLastSyncTime(long lastSyncTime) {
		this.lastSyncTime = lastSyncTime;
	}

	
}
