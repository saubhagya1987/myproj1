package in.fiinfra.common.common;

import javax.ws.rs.QueryParam;


public class DocumentRequest extends BaseRequest {
	@QueryParam("refTypeId")
	private Integer refTypeId;
	@QueryParam("refId")
	private Integer refId;

	@QueryParam("refId")
	private String returnUrl;
	
	@QueryParam("documentId")
	private Integer documentId;
	
	@QueryParam("sectionId")
	private Integer sectionId;
	
	@QueryParam("documentTypeId")
	private Integer documentTypeId;
	
	@QueryParam("dropdownFlag")
	private Integer dropdownFlag;
	
	@QueryParam("currentRefTypeId")
	private Integer currentRefTypeId;
	
	@QueryParam("currentRefId")
	private Integer currentRefId;
	
	@QueryParam("currentPartyId")
	private Integer currentPartyId;
	
	@QueryParam("fromClient")
	private boolean fromClient;
	
	@QueryParam("reportType")
	private String reportType;
	

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public boolean isFromClient() {
		return fromClient;
	}

	public void setFromClient(boolean fromClient) {
		this.fromClient = fromClient;
	}

	public Integer getCurrentPartyId() {
		return currentPartyId;
	}

	public void setCurrentPartyId(Integer currentPartyId) {
		this.currentPartyId = currentPartyId;
	}

	public Integer getCurrentRefTypeId() {
		return currentRefTypeId;
	}

	public void setCurrentRefTypeId(Integer currentRefTypeId) {
		this.currentRefTypeId = currentRefTypeId;
	}

	public Integer getCurrentRefId() {
		return currentRefId;
	}

	public void setCurrentRefId(Integer currentRefId) {
		this.currentRefId = currentRefId;
	}

	public Integer getDocumentId() {
		return documentId;
	}

	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
	}

	public String getReturnUrl() {
		return returnUrl;
	}

	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}

	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		append(sb, "refTypeId", this.refTypeId);
		append(sb, "refId", this.refId);
		append(sb, "sectionId", this.sectionId);
		append(sb, "documentTypeId", this.documentTypeId);
		append(sb, "documentId", this.documentId);
		append(sb, "fromClient", this.fromClient);
		append(sb, "reportType", this.reportType);
	}

	public Integer getRefTypeId() {
		return refTypeId;
	}

	public void setRefTypeId(Integer refType) {
		this.refTypeId = refType;
	}

	public Integer getRefId() {
		return refId;
	}

	public void setRefId(Integer refId) {
		this.refId = refId;
	}

	public Integer getSectionId() {
		return sectionId;
	}

	public void setSectionId(Integer sectionId) {
		this.sectionId = sectionId;
	}

	public Integer getDocumentTypeId() {
		return documentTypeId;
	}

	public void setDocumentTypeId(Integer documentTypeId) {
		this.documentTypeId = documentTypeId;
	}

	public Integer getDropdownFlag() {
		return dropdownFlag;
	}

	public void setDropdownFlag(Integer dropdownFlag) {
		this.dropdownFlag = dropdownFlag;
	}

}
