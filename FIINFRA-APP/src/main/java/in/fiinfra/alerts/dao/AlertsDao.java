package in.fiinfra.alerts.dao;

import in.fiinfra.common.diy.models.Alerts;

public interface AlertsDao 
{
	public Alerts getAlertsForPartyId(Integer partyId,Integer nodeId);
	
	public Integer getNumberOfAlertsForPartyId(Integer partyId,Integer nodeId);
	
}
