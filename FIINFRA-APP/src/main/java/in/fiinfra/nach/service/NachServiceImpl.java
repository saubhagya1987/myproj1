package in.fiinfra.nach.service;

import in.fiinfra.common.common.NachRequest;
import in.fiinfra.nach.dao.NachDao;
import in.fiinfra.pg.AutoPaymentData;
import in.fiinfra.pg.NachData;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("nachServiceImpl")
public class NachServiceImpl implements NachService {

	@Autowired
	NachDao dao;


	@Override
	public NachData insertUpdateNach(int userId, NachData nach) {
		nach = dao.insertUpdateNach(userId, nach);
		return nach;
	}

	@Override
	public NachData getNachById(int userId, int nachId) {
		// TODO Auto-generated method stub
		return dao.getNachById(userId, nachId);
	}

	@Override
	public NachData getNachByPartyId(int userId, int partyId) {

		return dao.getNachByPartyId(userId, partyId);
	}

	@Override
	public List<NachData> getNachList(NachRequest request) {
		return dao.getNachList(request);
	}

	@Override
	public List<AutoPaymentData> getAutoPaymentData(NachRequest request) {
		
		if(request.getDueInNext() != null){
			if(request.getDueInNext() ==1){
				Calendar cal=Calendar.getInstance();
				cal.add(Calendar.DAY_OF_YEAR, 30);
				request.setDateTo(cal.getTime());
			}else if(request.getDueInNext()==2){
				Calendar cal=Calendar.getInstance();
				cal.add(Calendar.DAY_OF_YEAR, 60);
				request.setDateTo(cal.getTime());
			}else{
				Calendar cal=Calendar.getInstance();
				cal.add(Calendar.DAY_OF_YEAR, 90);
				request.setDateTo(cal.getTime());
			}
		}
		return dao.getAutoPaymentData(request);
	}

	@Override
	public Boolean sendAutoPayment(NachRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
