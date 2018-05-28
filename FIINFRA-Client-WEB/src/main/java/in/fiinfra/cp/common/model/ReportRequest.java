package in.fiinfra.cp.common.model;

import javax.ws.rs.QueryParam;

import in.fiinfra.common.common.BaseRequest;

public class ReportRequest extends BaseRequest{
	
	private String name;
	@QueryParam("PartyId")
	private Integer partyId;
	@QueryParam("Compartyid")
	private Integer Compartyid;

	
	public Integer getPartyId() {
		return partyId;
	}

	public void setPartyId(Integer partyId) {
		this.partyId = partyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getCompartyid() {
		return Compartyid;
	}

	public void setCompartyid(Integer compartyid) {
		Compartyid = compartyid;
	}
	
	@Override
	protected void appendAll(StringBuilder sb) {

		super.appendAll(sb);
		append(sb,"PartyId",this.partyId);
		append(sb,"Compartyid",this.Compartyid);
	}

}
