package in.fiinfra.pg;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

public class SubscriptionData implements Comparable<SubscriptionData> {

	@JsonProperty
	private Integer partySubscriptionID;
	@JsonProperty
	private OrderData order;
	@JsonProperty
	private Integer productID;
	@JsonProperty
	private String productName;
	@JsonProperty
	private Integer partyID;
	@JsonProperty
	private Integer paymentFrequencyId;
	@JsonProperty
	private String paymentFrequency;
	@JsonProperty
	private long cumulativeAmountDue;
	@JsonProperty
	private long cumulativeAmountPaid;
	@JsonProperty
	private Date subscriptionStartDate;
	@JsonProperty
	private String subStartDateString;
	@JsonProperty
	private Date subscriptionExpiryDate;
	@JsonProperty
	private String subExpiryDateString;
	@JsonProperty
	private Date renewalNoticeDate;
	@JsonProperty
	private Date trialStartDate;
	@JsonProperty
	private Date trialEndDate;
	@JsonProperty
	private Date lastPaymentDttm;
	@JsonProperty
	private String lastPaymentDttmString;
	@JsonProperty
	private long lastPaymentAmount;
	@JsonProperty
	private Date nextPaymentDttm;
	@JsonProperty
	private Integer paymentStatusID;
	@JsonProperty
	private String paymentStatus;
	@JsonProperty
	private Integer subscriptionStatusID;
	@JsonProperty
	private String subscriptionStatus;
	@JsonProperty
	private Integer currentSubscriptionTypeID;
	@JsonProperty
	private String currentSubscriptionType;
	@JsonProperty
	private Integer currentSubscriptionCategoryID;
	@JsonProperty
	private String currentSubscriptionCategory;
	@JsonProperty
	private long subscriptionCostAmount;
	@JsonProperty
	private Integer userId;
	@JsonProperty
	private Date lastModifiedDate;
	@JsonProperty
	private Integer subxPlanLimit;

	@JsonProperty
	private int planCount;
	@JsonProperty
	private String partyName;

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	@JsonProperty
	private List<SubxAttribute> subxAttributes = new ArrayList<SubxAttribute>();

	/*
	 * @JsonProperty private boolean isActive;
	 */
	public Integer getPartySubscriptionID() {
		return partySubscriptionID;
	}

	public void setPartySubscriptionID(Integer partySubscriptionID) {
		this.partySubscriptionID = partySubscriptionID;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Integer getPartyID() {
		return partyID;
	}

	public void setPartyID(Integer partyID) {
		this.partyID = partyID;
	}

	public Integer getPaymentFrequencyId() {
		return paymentFrequencyId;
	}

	public void setPaymentFrequencyId(Integer paymentFrequencyId) {
		this.paymentFrequencyId = paymentFrequencyId;
	}

	public long getCumulativeAmountDue() {
		return cumulativeAmountDue;
	}

	public void setCumulativeAmountDue(long cumulativeAmountDue) {
		this.cumulativeAmountDue = cumulativeAmountDue;
	}

	public long getCumulativeAmountPaid() {
		return cumulativeAmountPaid;
	}

	public void setCumulativeAmountPaid(long cumulativeAmountPaid) {
		this.cumulativeAmountPaid = cumulativeAmountPaid;
	}

	public Date getSubscriptionStartDate() {
		return subscriptionStartDate;
	}

	public void setSubscriptionStartDate(Date subscriptionStartDate) {
		this.subscriptionStartDate = subscriptionStartDate;
	}

	public Date getSubscriptionExpiryDate() {
		return subscriptionExpiryDate;
	}

	public void setSubscriptionExpiryDate(Date subscriptionExpiryDate) {
		this.subscriptionExpiryDate = subscriptionExpiryDate;
	}

	public Date getRenewalNoticeDate() {
		return renewalNoticeDate;
	}

	public void setRenewalNoticeDate(Date renewalNoticeDate) {
		this.renewalNoticeDate = renewalNoticeDate;
	}

	public Date getTrialStartDate() {
		return trialStartDate;
	}

	public void setTrialStartDate(Date trialStartDate) {
		this.trialStartDate = trialStartDate;
	}

	public Date getTrialEndDate() {
		return trialEndDate;
	}

	public void setTrialEndDate(Date trialEndDate) {
		this.trialEndDate = trialEndDate;
	}

	public Date getLastPaymentDttm() {
		return lastPaymentDttm;
	}

	public void setLastPaymentDttm(Date lastPaymentDttm) {
		this.lastPaymentDttm = lastPaymentDttm;
	}

	public long getLastPaymentAmount() {
		return lastPaymentAmount;
	}

	public void setLastPaymentAmount(long lastPaymentAmount) {
		this.lastPaymentAmount = lastPaymentAmount;
	}

	public Date getNextPaymentDttm() {
		return nextPaymentDttm;
	}

	public void setNextPaymentDttm(Date nextPaymentDttm) {
		this.nextPaymentDttm = nextPaymentDttm;
	}

	public Integer getPaymentStatusID() {
		return paymentStatusID;
	}

	public void setPaymentStatusID(Integer paymentStatusID) {
		this.paymentStatusID = paymentStatusID;
	}

	public Integer getSubscriptionStatusID() {
		return subscriptionStatusID;
	}

	public void setSubscriptionStatusID(Integer subscriptionStatusID) {
		this.subscriptionStatusID = subscriptionStatusID;
	}

	public Integer getCurrentSubscriptionTypeID() {
		return currentSubscriptionTypeID;
	}

	public void setCurrentSubscriptionTypeID(Integer currentSubscriptionTypeID) {
		this.currentSubscriptionTypeID = currentSubscriptionTypeID;
	}

	public Integer getCurrentSubscriptionCategoryID() {
		return currentSubscriptionCategoryID;
	}

	public void setCurrentSubscriptionCategoryID(
			Integer currentSubscriptionCategoryID) {
		this.currentSubscriptionCategoryID = currentSubscriptionCategoryID;
	}

	public long getSubscriptionCostAmount() {
		return subscriptionCostAmount;
	}

	public void setSubscriptionCostAmount(long subscriptionCostAmount) {
		this.subscriptionCostAmount = subscriptionCostAmount;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	/*
	 * public boolean isActive() { return isActive; } public void
	 * setActive(boolean isActive) { this.isActive = isActive; }
	 */
	public String getPaymentFrequency() {
		return paymentFrequency;
	}

	public void setPaymentFrequency(String paymentFrequency) {
		this.paymentFrequency = paymentFrequency;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getSubscriptionStatus() {
		return subscriptionStatus;
	}

	public void setSubscriptionStatus(String subscriptionStatus) {
		this.subscriptionStatus = subscriptionStatus;
	}

	public String getCurrentSubscriptionType() {
		return currentSubscriptionType;
	}

	public void setCurrentSubscriptionType(String currentSubscriptionType) {
		this.currentSubscriptionType = currentSubscriptionType;
	}

	public String getCurrentSubscriptionCategory() {
		return currentSubscriptionCategory;
	}

	public void setCurrentSubscriptionCategory(
			String currentSubscriptionCategory) {
		this.currentSubscriptionCategory = currentSubscriptionCategory;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSubStartDateString() {
		return subStartDateString;
	}

	public void setSubStartDateString(String subStartDateString) {
		this.subStartDateString = subStartDateString;
	}

	public String getSubExpiryDateString() {
		return subExpiryDateString;
	}

	public void setSubExpiryDateString(String subExpiryDateString) {
		this.subExpiryDateString = subExpiryDateString;
	}

	public OrderData getOrder() {
		return order;
	}

	public void setOrder(OrderData order) {
		this.order = order;
	}

	public String getLastPaymentDttmString() {
		return lastPaymentDttmString;
	}

	public void setLastPaymentDttmString(String lastPaymentDttmString) {
		this.lastPaymentDttmString = lastPaymentDttmString;
	}

	public List<SubxAttribute> getSubxAttributes() {
		return subxAttributes;
	}

	public void setSubxAttributes(List<SubxAttribute> subxAttributes) {
		this.subxAttributes = subxAttributes;
	}

	@Override
	public int compareTo(SubscriptionData o) {
		return this.subscriptionExpiryDate.compareTo(o
				.getSubscriptionExpiryDate());
	}

	public int getPlanCount() {
		return planCount;
	}

	public void setPlanCount(int planCount) {
		this.planCount = planCount;
	}

	public Integer getSubxPlanLimit() {
		return subxPlanLimit;
	}

	public void setSubxPlanLimit(Integer subxPlanLimit) {
		this.subxPlanLimit = subxPlanLimit;
	}

	/*
	 * public boolean isNew(){ return getSubscriptionStatusID() != null &&
	 * getSubscriptionStatusID().equals(147001); }
	 * 
	 * public boolean isActive(){ return getSubscriptionStatusID() != null &&
	 * getSubscriptionStatusID().equals(147003); }
	 * 
	 * public boolean isTrial(){ return getCurrentSubscriptionTypeID() != null
	 * && getCurrentSubscriptionTypeID().equals(149002); }
	 */

}
