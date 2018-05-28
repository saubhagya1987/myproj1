package in.fiinfra.common;

import in.fiinfra.common.common.BaseRequest;

import java.util.Date;

public class CommonRequest extends BaseRequest {

	private String username;
	private String taskSearchValue;
	private Integer postId;
	private Integer testimonialId;
	private String filter;
	private Date dateFrom;
	private Date dateTo;
	private Integer parentId;
	private String searchStr;
	private String type;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTaskSearchValue() {
		return taskSearchValue;
	}

	public Integer getTestimonialId() {
		return testimonialId;
	}

	public void setTestimonialId(Integer testimonialId) {
		this.testimonialId = testimonialId;
	}

	public void setTaskSearchValue(String taskSearchValue) {
		this.taskSearchValue = taskSearchValue;
	}

	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		append(sb, "username", this.username);
		append(sb, "taskSearchValue", this.taskSearchValue);
		append(sb, "postId", this.postId);
		append(sb, "testimonialId", this.testimonialId);
		append(sb, "searchStr", this.searchStr);
		append(sb, "type", this.type);
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getSearchStr() {
		return searchStr;
	}

	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
