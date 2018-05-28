package in.fiinfra.alerts.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.fiinfra.alerts.dao.AlertsDao;
import in.fiinfra.common.diy.models.Alerts;

@Service("alertsService")
public class AlertsServiceImpl implements AlertsService
{
	@Autowired
	AlertsDao alertsDao;
	
	@Override
	public Alerts getAlertsForPartyId(Integer partyId,Integer nodeId) 
	{
		return alertsDao.getAlertsForPartyId(partyId,nodeId);
	}

	@Override
	public Integer getNumberOfAlertsForPartyId(Integer partyId,Integer nodeId)
	{
		return alertsDao.getNumberOfAlertsForPartyId(partyId,nodeId);
	}

}
