package in.fiinfra.nach.service;

import in.fiinfra.common.common.NachRequest;
import in.fiinfra.pg.AutoPaymentData;
import in.fiinfra.pg.NachData;

import java.util.List;

public interface NachService {


	NachData insertUpdateNach(int userId, NachData nach);

	NachData getNachById(int userId, int nachId);

	NachData getNachByPartyId(int userId, int partyId);

	List<NachData> getNachList(NachRequest request);

	List<AutoPaymentData> getAutoPaymentData(NachRequest request);
	
	Boolean sendAutoPayment(NachRequest request);

}
