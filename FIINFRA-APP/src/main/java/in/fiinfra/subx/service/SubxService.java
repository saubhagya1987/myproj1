package in.fiinfra.subx.service;

import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.common.ReportRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.pg.AutoSubxExtendData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxNotfData;
import in.fiinfra.pg.SubxProductData;

import java.util.List;
import java.util.Map;

public interface SubxService {

	List<SubscriptionData> showSubscriptionList(int partyId, int userId);

	SubscriptionData getCurrentSubx(int partyId, int userId);

	List<SubxProductData> getSubXProducts(int buId);

	SubscriptionData insertUpdateSubx(int buId, SubscriptionData subscription);

	SubxProductData getSubxProductById(int buId, int partyProductId);

	SubscriptionData getSubxById(int buId, int partyId, int subxId);

	Integer activateSubscription(int buId, int userId, int partyId);

	Integer createSubscription(int buId, int userId, int partyId, int productId);

	public Map<String, Object> batchCreateSubscription(int userId);

	public Map<String, Object> batchUpdateSubscriptionStatus(int userId);

	public Map<String, Object> batchSendNotification(int userId);

	List<KeyValue> showPartnerList(int buId, int userId, String searchText, String searchType);

	List<SubxNotfData> getSubxForNotf();

	List<AutoSubxExtendData> getAutoSubxExtendData(int userId);

	Map<String, Object> batchUpdateSubxStatusAndRole(int userId);

	List<SubxProductData> getPartyProducts(int buId);

	ReportData getPGReports(ReportRequest req);

	List<KeyValue> getProducts(int buId);

	SubxProductData saveProduct(int buId, SubxProductData subxProduct);

	ReportData getResourceUtiReports(ReportRequest req);
}
