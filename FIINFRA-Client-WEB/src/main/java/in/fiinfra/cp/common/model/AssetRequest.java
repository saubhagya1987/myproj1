package in.fiinfra.cp.common.model;

import in.fiinfra.common.common.BaseRequest;

public class AssetRequest extends BaseRequest {
	
	private Integer assetClassId;
	private Integer assetId;

	
	public Integer getAssetId() {
		return assetId;
	}


	public void setAssetId(Integer assetId) {
		this.assetId = assetId;
	}


	public Integer getAssetClassId() {
		return assetClassId;
	}


	public void setAssetClassId(Integer assetClassId) {
		this.assetClassId = assetClassId;
	}


	@Override
	protected void appendAll(StringBuilder sb) {

		super.appendAll(sb);
		append(sb, "assetClassId", this.assetClassId);
		append(sb, "assetId", this.assetId);
	}
}
