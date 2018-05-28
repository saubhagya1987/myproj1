package in.fiinfra.cp;

import in.fiinfra.common.common.GupShupCommentData;

import java.util.Date;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class TestimonialData {
	private int partyId;
	private int buPartyId;
	private Integer id;
	private int recordTypeId;
	private int statusRefId;
	private Integer likeCount;/* to be removed */
	private Integer commentCount;/* to be removed */
	/* to be add status and recordTypeId */
	private String url;
	private Boolean isActive;
	private String text;
	private Date createdDateTime;
	private Integer createdById;
	private int page;
	private int rows;
	private String userName;
	private String clientName;
	private String partnerName;
	private String city;
	private String photo;
	private String designation;
	private int genderId;
	private String clientId;
	private String partnerId;
	private Integer userID;
	private String searchtext;
	
	
	
	
	



	public String getSearchtext() {
		return searchtext;
	}

	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}

	public Integer getUserID() {
		return userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	private List<GupShupCommentData> testimonialCommentData;

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public int getBuPartyId() {
		return buPartyId;
	}

	public void setBuPartyId(int buPartyId) {
		this.buPartyId = buPartyId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getCreatedById() {
		return createdById;
	}

	public void setCreatedById(Integer createdById) {
		this.createdById = createdById;
	}

	public List<GupShupCommentData> getTestimonialCommentData() {
		return testimonialCommentData;
	}

	public void setTestimonialCommentData(
			List<GupShupCommentData> testimonialCommentData) {
		this.testimonialCommentData = testimonialCommentData;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getRecordTypeId() {
		return recordTypeId;
	}

	public void setRecordTypeId(int recordTypeId) {
		this.recordTypeId = recordTypeId;
	}

	public int getStatusRefId() {
		return statusRefId;
	}

	public void setStatusRefId(int statusRefId) {
		this.statusRefId = statusRefId;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public Date getCreatedDateTime() {
		return createdDateTime;
	}

	public void setCreatedDateTime(Date createdDateTime) {
		this.createdDateTime = createdDateTime;
	}

	public int getGenderId() {
		return genderId;
	}

	public void setGenderId(int genderId) {
		this.genderId = genderId;
	}

}
