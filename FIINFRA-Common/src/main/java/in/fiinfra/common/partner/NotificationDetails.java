package in.fiinfra.common.partner;

public class NotificationDetails {
	private String name;
	private int notifyTemplateId;
	private String notifyTarget;
	private String deliveryChannel;
	private String notifyTemplateXML;
	private String useSignature;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNotifyTemplateId() {
		return notifyTemplateId;
	}
	public void setNotifyTemplateId(int notifyTemplateId) {
		this.notifyTemplateId = notifyTemplateId;
	}
	public String getNotifyTarget() {
		return notifyTarget;
	}
	public void setNotifyTarget(String notifyTarget) {
		this.notifyTarget = notifyTarget;
	}
	public String getDeliveryChannel() {
		return deliveryChannel;
	}
	public void setDeliveryChannel(String deliveryChannel) {
		this.deliveryChannel = deliveryChannel;
	}
	public String getNotifyTemplateXML() {
		return notifyTemplateXML;
	}
	public void setNotifyTemplateXML(String notifyTemplateXML) {
		this.notifyTemplateXML = notifyTemplateXML;
	}
	public String getUseSignature() {
		return useSignature;
	}
	public void setUseSignature(String useSignature) {
		this.useSignature = useSignature;
	}
	
	
	
	
}
