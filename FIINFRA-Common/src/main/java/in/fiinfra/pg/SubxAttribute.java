package in.fiinfra.pg;

import in.fiinfra.cp.CommonUtils;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class SubxAttribute {
	
	public static final int TrialPeriodDays = 153001;
	public static final int GracePeriodDays = 153002;
	public static final int SubscriptionPeriod = 153003;
	public static final int RenewalNoticePeriod = 153004;
	public static final int TrialPeriodRoleID = 153005;
	public static final int SubcriptionPeriodRoleID = 153006;
	public static final int GracePeriodRoleID = 153007;
	public static final int ExpiredSubscriptionRoleID = 153008;
	public static final int TrialExpiryFirstNotifyDays = 153009;
	public static final int TrialExpiryReminderNotifyDays = 153010;
	public static final int SubscriptionRenewalNotifyDays = 153011;
	public static final int TrialExpiryReminderNotifyStartDays = 153012;
	public static final int PaymentDueNotifyDays = 153013;
	public static final int PaymentDueNotifyReminderStartDays = 153014;
	public static final int AccessRestrictedNotifyDays = 153015;
	public static final int PartnerCientUsers = 153016;
	public static final int SMSperContact = 153017;
	public static final int EmailperContact = 153018;
	public static final int Clients = 153019;
	public static final int Opportunities = 153020;
	public static final int Folios = 1530021;
	public static final int PreprintedForms = 1530023;
	public static final int ContactDocuments = 1530024;
	
	
	
	
	@JsonProperty
	private Integer partyProductId;
	@JsonProperty
	private Integer attributeId;
	@JsonProperty
	private Integer attributeTypeId;
	@JsonProperty
	private String value;
	
	@JsonProperty
	private Integer frequencyId;


	public Integer getPartyProductId() {
		return partyProductId;
	}

	public void setPartyProductId(Integer partyProductId) {
		this.partyProductId = partyProductId;
	}

	public Integer getAttributeId() {
		return attributeId;
	}

	public void setAttributeId(Integer attributeId) {
		this.attributeId = attributeId;
	}

	public Integer getAttributeTypeId() {
		return attributeTypeId;
	}

	public void setAttributeTypeId(Integer attributeTypeId) {
		this.attributeTypeId = attributeTypeId;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getFrequencyId() {
		return frequencyId;
	}

	public void setFrequencyId(Integer frequencyId) {
		this.frequencyId = frequencyId;
	}
	

}
