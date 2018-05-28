package in.fiinfra.common.diy.models;

import org.codehaus.jackson.annotate.JsonProperty;

public class FamilyDetail {
	
	@JsonProperty
	private Integer isSpouse;
	@JsonProperty
	private Integer age;
	@JsonProperty
	private Integer childcount;
	
	public Integer getIsSpouse() {
		return isSpouse;
	}
	public void setIsSpouse(Integer isSpouse) {
		this.isSpouse = isSpouse;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getChildcount() {
		return childcount;
	}
	public void setChildcount(Integer childcount) {
		this.childcount = childcount;
	}
}
