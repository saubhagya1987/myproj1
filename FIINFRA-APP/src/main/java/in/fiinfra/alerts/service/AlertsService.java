package in.fiinfra.alerts.service;

import in.fiinfra.common.diy.models.Alerts;

public interface AlertsService 
{
	public Alerts getAlertsForPartyId(Integer partyId,Integer nodeId);
	
	public Integer getNumberOfAlertsForPartyId(Integer partyId, Integer nodeId);
}
