package in.fiinfra.common.admin;

import java.util.Date;
import java.util.List;

public class TestData {

	private String firstName;
	private String lastName;
	private Date dob;
	private Double salary;
	
	private FirstCustomObject firstCustomObject;
	private List<SecondCustomObject> list;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public FirstCustomObject getFirstCustomObject() {
		return firstCustomObject;
	}
	public void setFirstCustomObject(FirstCustomObject firstCustomObject) {
		this.firstCustomObject = firstCustomObject;
	}
	public List<SecondCustomObject> getList() {
		return list;
	}
	public void setList(List<SecondCustomObject> list) {
		this.list = list;
	}
}
