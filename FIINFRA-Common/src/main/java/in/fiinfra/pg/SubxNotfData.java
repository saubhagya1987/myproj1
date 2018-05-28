package in.fiinfra.pg;

import in.fiinfra.framework.models.Notification;

import java.util.Date;
import java.util.HashMap;

public class SubxNotfData extends Notification{
	
	public SubxNotfData(){
		setPayloadMap(new HashMap<String,String>());
	}


	private String productName;
	private int buId;
	private int partyId;
	private String partyName;
	private int subxType;
	private int subxStatus;
	private int paymentDue;
	private int trialDaysLeft;
	private int renewalDue;
	private int periodLeft;
	private int planCount;
	private int month;
	private int year;
	private String packageName;
	private String buParty;
	private int lastLogin;
	private int roleId;
	private String category;
	
	private Date startDate;
	private Date endDate;
	
	private Date lastPaymentDate;
	private long lastPaymentAmout;
	
	private Date suspensionDate;
	
	private int gracePeriod;
	
	private int freeSubxPlanCount;
	

	public int getFreeSubxPlanCount() {
		return freeSubxPlanCount;
	}

	public void setFreeSubxPlanCount(int freeSubxPlanCount) {
		this.freeSubxPlanCount = freeSubxPlanCount;
	}

	public int getGracePeriod() {
		return gracePeriod;
	}

	public void setGracePeriod(int gracePeriod) {
		this.gracePeriod = gracePeriod;
	}

	public Date getSuspensionDate() {
		return suspensionDate;
	}

	public void setSuspensionDate(Date suspensionDate) {
		this.suspensionDate = suspensionDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public int getBuId() {
		return buId;
	}

	@Override
	public void setBuId(int buId) {
		this.buId = buId;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public int getSubxType() {
		return subxType;
	}

	public void setSubxType(int subxType) {
		this.subxType = subxType;
	}

	public int getSubxStatus() {
		return subxStatus;
	}

	public void setSubxStatus(int subxStatus) {
		this.subxStatus = subxStatus;
	}

	public int getPaymentDue() {
		return paymentDue;
	}

	public void setPaymentDue(int paymentDue) {
		this.paymentDue = paymentDue;
	}

	public int getTrialDaysLeft() {
		return trialDaysLeft;
	}

	public void setTrialDaysLeft(int trialDaysLeft) {
		this.trialDaysLeft = trialDaysLeft;
	}

	public int getPeriodLeft() {
		return periodLeft;
	}

	public void setPeriodLeft(int periodLeft) {
		this.periodLeft = periodLeft;
	}

	public int getPlanCount() {
		return planCount;
	}

	public void setPlanCount(int planCount) {
		this.planCount = planCount;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getBuParty() {
		return buParty;
	}

	public void setBuParty(String buParty) {
		this.buParty = buParty;
	}

	public int getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(int lastLogin) {
		this.lastLogin = lastLogin;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getLastPaymentDate() {
		return lastPaymentDate;
	}

	public void setLastPaymentDate(Date lastPaymentDate) {
		this.lastPaymentDate = lastPaymentDate;
	}

	public long getLastPaymentAmout() {
		return lastPaymentAmout;
	}

	public void setLastPaymentAmout(long lastPaymentAmout) {
		this.lastPaymentAmout = lastPaymentAmout;
	}

	public int getRenewalDue() {
		return renewalDue;
	}

	public void setRenewalDue(int renewalDue) {
		this.renewalDue = renewalDue;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void addData(String key,String value){
		getPayloadMap().put(key, value);
	}
	
	@Override
	public String toString() {
		
		return getNotifyEventID() +" "+getSourceSystemID()+" "+getPayloadMap();
	}

}
