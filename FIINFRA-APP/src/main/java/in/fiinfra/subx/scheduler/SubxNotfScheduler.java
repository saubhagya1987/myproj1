package in.fiinfra.subx.scheduler;

import in.fiinfra.common.dao.CommonDao;
import in.fiinfra.pg.SubxNotfData;
import in.fiinfra.subx.service.SubxService;
import in.fiinfra.subx.service.SubxServiceImpl;

import java.util.List;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class SubxNotfScheduler extends CommonScheduler {

	private boolean working = false;

	@Autowired
	CommonDao commonDao;

	@Override
	public void doExecute() {
		if (working) {
			LogFactory.getLog(getClass()).info("skiping current cycle");
			return;
		}
		int userId = 1;
		try {
			working = true;

			batchUpdateSubxStatusAndRole(userId);

			batchSendNotification(userId);

		} finally {

			working = false;
		}

	}

	@Override
	protected String getJobName() {
		return "SubxNotificationScheduler";
	}

	private void batchUpdateSubxStatusAndRole(int userId) {
		SubxService subxService = getBean(SubxServiceImpl.class);
		subxService.batchUpdateSubscriptionStatus(userId);
	}

	private void batchSendNotification(int userId) {
		SubxService subxService = getBean(SubxServiceImpl.class);
		List<SubxNotfData> notfList = subxService.getSubxForNotf();
		for (SubxNotfData bean : notfList) {
			if(bean.getNotifyEventID() >0 && bean.getSourceSystemID() >0 && bean.getNotifyPartyID() >0 &&
					bean.getSessionID() != null && bean.getDeliveryChannelID() >0
					){
				createSubxNotification(commonDao, bean);
			}
			else{
				LogFactory.getLog(getClass().getName()).error("Invalid Notification Object "+bean);
			}
		}
		System.out.println("Found " + notfList.size());

	}

	private void createSubxNotification(CommonDao commonDao, SubxNotfData notification) {

		commonDao.insertNotification(notification);

	}
}
