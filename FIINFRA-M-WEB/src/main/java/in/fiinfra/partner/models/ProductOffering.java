package in.fiinfra.partner.models;

public class ProductOffering {
	private int assetClass;
	private String assetName;
	private boolean active;
	private int seq;
	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	private String serviceCode;
	String[] mfgParties;

	public String[] getMfgParties() {
		return mfgParties;
	}

	public void setMfgParties(String[] mfgParties) {
		this.mfgParties = mfgParties;
	}

	public int getAssetClass() {
		return assetClass;
	}

	public void setAssetClass(int assetClass) {
		this.assetClass = assetClass;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(assetName).append(" ").append("( ").append(assetClass).append(")").append(", Active=").append(active).append(" Service=").append(serviceCode).
		append("Mfg=");
		if(mfgParties != null){
		for(String str:mfgParties){
		  sb.append(str).append("  ");
		}
		}
		return sb.toString();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
}
