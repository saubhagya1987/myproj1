package in.fiinfra.common.service.vo;

public class ProductMfg {

	private Integer partyId;
	
	private String manufacturerName;
	
	private String mfgType;
	
	private Integer mfgTypeId;
	
	private String shortName;

	private int createOrModifiedBy;

	private String searchText;

	/**
	 * @return the partyId
	 */
	public Integer getPartyId() {
		return partyId;
	}

	/**
	 * @param partyId the partyId to set
	 */
	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	public String getManufacturerName() {
		return manufacturerName;
	}

	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}

	public String getMfgType() {
		return mfgType;
	}

	public void setMfgType(String mfgType) {
		this.mfgType = mfgType;
	}

	/**
	 * @return the mfgTypeId
	 */
	public Integer getMfgTypeId() {
		return mfgTypeId;
	}

	/**
	 * @param mfgTypeId the mfgTypeId to set
	 */
	public void setMfgTypeId(Integer mfgTypeId) {
		this.mfgTypeId = mfgTypeId;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public int getCreateOrModifiedBy() {
		return createOrModifiedBy;
	}

	public void setCreateOrModifiedBy(int createOrModifiedBy) {
		this.createOrModifiedBy = createOrModifiedBy;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

}
