package in.fiinfra.subx.service;

import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.common.ReportRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.pg.AutoSubxExtendData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxAttribute;
import in.fiinfra.pg.SubxNotfData;
import in.fiinfra.pg.SubxProductData;
import in.fiinfra.subx.dao.SubxDao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("SubxService")
public class SubxServiceImpl implements SubxService {
	@Autowired
	private SubxDao subxDao;

	@Override
	public List<SubscriptionData> showSubscriptionList(int buId, int partyId) {
		List<SubscriptionData> lst = subxDao.getSubscriptionList(buId, partyId);
		return lst;
	}

	@Override
	public SubscriptionData getCurrentSubx(int buId, int partyId) {
		List<SubscriptionData> lst = subxDao.getSubscriptionList(buId, partyId);
		if (lst.isEmpty()) {
			return null;
		}
		return lst.iterator().next();
	}

	@Override
	public List<SubxProductData> getSubXProducts(int buId) {
		List<SubxProductData> lst = subxDao.getSubXProducts(buId);
		return lst;
	}

	@Override
	public SubscriptionData insertUpdateSubx(int buId,
			SubscriptionData subscription) {

		return subxDao.insertUpdateSubscription(buId, subscription);
	}

	@Override
	public SubxProductData getSubxProductById(int buId, int partyProductId) {
		return subxDao.getSubxProductById(buId, partyProductId);

	}

	@Override
	public SubscriptionData getSubxById(int buId, int partyId, int subxId) {
		return subxDao.getSubscriptionById(buId, partyId, subxId);
	}

	@Override
	public Integer activateSubscription(int buId, int userId, int partyId) {

		subxDao.assignDefaultSubx(buId, userId, partyId);

		return 1;
	}

	private Date addDays(Date dt, int dur) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);
		cal.add(Calendar.DAY_OF_YEAR, dur);
		return cal.getTime();
	}

	@Override
	public Integer createSubscription(int buId, int userId, int partyId,
			int productId) {
		if (partyId <= 0 || productId <= 0) {
			return -1;
		}

		Calendar today = Calendar.getInstance();

		List<SubscriptionData> subx = subxDao
				.getSubscriptionList(buId, partyId);
		if (!subx.isEmpty()) {
			for (SubscriptionData s : subx) {
				// subscription found no needs to create new
				if (!(s.getSubscriptionStatusID().equals(147005) || s
						.getSubscriptionStatusID().equals(147006))) {
					return -1;
				}
			}

		}

		SubxProductData product = null;
		List<SubxProductData> products = subxDao.getSubXProducts(buId);
		for (SubxProductData p : products) {
			if (productId == p.getProductID().intValue()) {
				product = p;
				break;
			}
		}

		SubscriptionData newSubx = new SubscriptionData();
		newSubx.setProductID(product.getProductID());
		newSubx.setSubscriptionCostAmount((long) product.getPriceValue());
		newSubx.setPartyID(product.getPartyID());
		newSubx.setPaymentStatusID(148001);

		newSubx.setPaymentFrequencyId(product.getPaymentFrequencyId());

		newSubx.setUserId(userId);

		newSubx.setSubscriptionStatusID(147002);
		if (newSubx.getPaymentStatusID().equals(148001)) {
			newSubx.setCurrentSubscriptionTypeID(149003);
		} else {
			newSubx.setCurrentSubscriptionTypeID(149001);
		}

		newSubx.setTrialStartDate(today.getTime());

		newSubx.setTrialEndDate(addDays(today.getTime(),
				product.findIntValue(SubxAttribute.TrialPeriodDays)));

		newSubx.setSubscriptionStartDate(today.getTime());
		newSubx.setSubscriptionExpiryDate(addDays(newSubx.getTrialEndDate(),
				product.findIntValue(SubxAttribute.SubscriptionPeriod)));

		newSubx.setRenewalNoticeDate(addDays(
				newSubx.getSubscriptionExpiryDate(),
				-1 * product.findIntValue(SubxAttribute.RenewalNoticePeriod)));
		newSubx.setRenewalNoticeDate(addDays(
				newSubx.getSubscriptionExpiryDate(),
				-1 * product.findIntValue(SubxAttribute.RenewalNoticePeriod)));

		newSubx = subxDao.insertUpdateSubscription(buId, newSubx);

		return newSubx.getPartySubscriptionID();

	}

	@Override
	public Map<String, Object> batchCreateSubscription(int userId) {
		return subxDao.executeSubxCreateBatch(userId);

	}

	@Override
	public Map<String, Object> batchUpdateSubscriptionStatus(int userId) {
		return null;

	}

	@Override
	public Map<String, Object> batchSendNotification(int userId) {
		return null;

	}

	@Override
	public List<KeyValue> showPartnerList(int buId, int userId,
			String searchText,String searchType) {
		List<KeyValue> lst = subxDao.showPartnerList(buId, userId, searchText,searchType);
		return lst;

	}

	@Override
	public List<SubxNotfData> getSubxForNotf() {
		return subxDao.getSubxForNotfications();
	}

	@Override
	public List<AutoSubxExtendData> getAutoSubxExtendData(int userId) {
		return subxDao.getAutoSubxExtendData(userId);
	}

	@Override
	public Map<String, Object> batchUpdateSubxStatusAndRole(int userId) {
		return subxDao.batchUpdateSubxStatusAndRole(userId);
	}

	@Override
	public List<SubxProductData> getPartyProducts(int buId) {
		List<SubxProductData> lst = subxDao.getPartyProducts(buId);
		return lst;
	}

	@Override
	public ReportData getPGReports(ReportRequest req) {
		return subxDao.getPGReports(req);
	}

	@Override
	public List<KeyValue> getProducts(int buId) {
		List<KeyValue> lst = subxDao.getProducts(buId);
		return lst;
	}

	@Override
	public SubxProductData saveProduct(int buId, SubxProductData subxProduct) {
		return subxDao.saveProduct(buId, subxProduct);
	}

	@Override
	public ReportData getResourceUtiReports(ReportRequest req) {

		return subxDao.getResourceUtiReports(req);
	}
}
