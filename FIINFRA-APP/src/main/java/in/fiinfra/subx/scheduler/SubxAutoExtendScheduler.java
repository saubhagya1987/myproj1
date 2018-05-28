package in.fiinfra.subx.scheduler;

import in.fiinfra.common.dao.CommonDao;
import in.fiinfra.common.util.FiinfraConstants;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.framework.models.Notification;
import in.fiinfra.order.service.OrderService;
import in.fiinfra.order.service.OrderServiceImpl;
import in.fiinfra.pg.AutoSubxExtendData;
import in.fiinfra.pg.PaymentData;
import in.fiinfra.pg.SubxNotfData;
import in.fiinfra.subx.service.SubxService;
import in.fiinfra.subx.service.SubxServiceImpl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class SubxAutoExtendScheduler extends CommonScheduler {

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
			batchExtendSubx(userId);

			batchUpdateSubxStatusAndRole(userId);

		} finally {

			working = false;
		}

	}

	@Override
	protected String getJobName() {
		return "SubxAutoExtendScheduler";
	}

	private void batchExtendSubx(int userId) {
		SubxService subxService = getBean(SubxServiceImpl.class);
		OrderService orderService = getBean(OrderServiceImpl.class);
		List<AutoSubxExtendData> partnerList = subxService
				.getAutoSubxExtendData(userId);

		for (AutoSubxExtendData bean : partnerList) {
			if (bean.getPlanCount() <= 0) {
				continue;
			}
			PaymentData paymentData = new PaymentData();
			paymentData.setAction("AutoExtend");
			paymentData.setBuId(bean.getBuId());
			paymentData.setPartyID(bean.getPartyID());
			paymentData.setPlanCount(bean.getPlanCount());
			paymentData.setProductID(bean.getProductID());
			paymentData.setUserId(1);

			Calendar c1 = Calendar.getInstance();
			c1.setTime(bean.getEndDate());
			c1.add(Calendar.DAY_OF_MONTH, 1);

			Date[] dates = paymentData.calculateStartEndDate(bean.getEndDate(),
					1);
			paymentData.setStartDate(dates[0]);
			paymentData.setEndDate(dates[1]);
			paymentData.setPaymentAmount(0);
			paymentData.setPaymentStatusId(148003);
			paymentData.setPaymentMethodID(154003);
			paymentData
					.setPaymentNote("Free One Month Extension for creating plan "
							+ bean.getPlanCount()
							+ " In Month of "
							+ CommonUtils.format(bean.getRefDate(), "MMM yy"));
			paymentData.setPlanCount(bean.getPlanCount());

			orderService.savePayment(bean.getBuId(), paymentData);

		}

	}

	private void batchUpdateSubxStatusAndRole(int userId) {
		SubxService subxService = getBean(SubxServiceImpl.class);
		subxService.batchUpdateSubscriptionStatus(userId);
	}

	private void batchSendNotification(int userId) {
		SubxService subxService = getBean(SubxServiceImpl.class);
		List<SubxNotfData> notfList = subxService.getSubxForNotf();
		for (SubxNotfData bean : notfList) {
			if (bean.getSubxType() == 149002 && bean.getTrialDaysLeft() == 0) {
				// Trial end Notification
				createSubxNotification(commonDao, bean, 406);
			} else if (bean.getSubxType() == 149002
					&& bean.getRenewalDue() >= 0) {
				createSubxNotification(commonDao, bean, 404);
			} else if (bean.getSubxType() == 149002
					&& bean.getPaymentDue() <= 0) {
				createSubxNotification(commonDao, bean, 405);
			}
			// payment Reminder
			else if (bean.getPaymentDue() <= 0) {
				createSubxNotification(commonDao, bean, 404);
			}

		}

		System.out.println("Found " + notfList.size());

	}

	private void createSubxNotification(CommonDao commonDao, SubxNotfData bean,
			int eventId) {
		Notification notification = new Notification();
		Map<String, String> payloadMap = new HashMap<String, String>();
		payloadMap.put("user", bean.getPartyName());
		// payloadMap.put("Password",map.getValue());

		notification.setSourceSystemID(FiinfraConstants.PARTNER_PORTAL);
		notification.setNotifyTypeId(FiinfraConstants.SYSTEM);
		notification.setNotifyPartyID(bean.getPartyId());
		notification.setNotifyEventID(eventId);
		notification.setDeliveryChannelID(FiinfraConstants.EMAIL);
		notification.setBuId(bean.getBuId());
		notification.setPayloadMap(payloadMap);

		commonDao.insertNotification(notification);

	}
}
