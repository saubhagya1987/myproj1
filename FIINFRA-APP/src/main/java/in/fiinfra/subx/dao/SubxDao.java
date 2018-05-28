package in.fiinfra.subx.dao;

import in.fiinfra.common.common.ReportData;
import in.fiinfra.common.common.ReportRequest;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.pg.AutoSubxExtendData;
import in.fiinfra.pg.SubscriptionData;
import in.fiinfra.pg.SubxNotfData;
import in.fiinfra.pg.SubxProductData;

import java.util.List;
import java.util.Map;

public interface SubxDao {

	List<SubscriptionData> getSubscriptionList(int buId, int partyId);

	List<SubxProductData> getSubXProducts(int buId);

	SubscriptionData insertUpdateSubscription(int buId,
			SubscriptionData subxData);

	void assignDefaultSubx(int buId, int userId, int partyId);

	SubxProductData getSubxProductById(int buId, int partyProductId);

	SubscriptionData getSubscriptionById(int buId, int partyId, int subxId);

	Map<String, Object> executeSubxCreateBatch(int userId);

	List<KeyValue> showPartnerList(int buId, int userId, String searchText, String searchType);

	List<SubxNotfData> getSubxForNotfications();

	List<AutoSubxExtendData> getAutoSubxExtendData(int userId);

	Map<String, Object> batchUpdateSubxStatusAndRole(int userId);

	List<SubxProductData> getPartyProducts(int buId);

	ReportData getPGReports(ReportRequest req);

	List<KeyValue> getProducts(int buId);

	SubxProductData saveProduct(int buId, SubxProductData subxProduct);

	ReportData getResourceUtiReports(ReportRequest req);
}
