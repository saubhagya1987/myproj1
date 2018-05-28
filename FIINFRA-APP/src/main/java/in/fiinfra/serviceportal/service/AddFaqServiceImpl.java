package in.fiinfra.serviceportal.service;
import  in.fiinfra.common.service.vo.FaqList;
import in.fiinfra.serviceportal.dao.AddFaqDao;


import org.springframework.beans.factory.annotation.Autowired;

import javax.ws.rs.core.Response;
public class AddFaqServiceImpl implements AddFaqService
{
	@Autowired
	private AddFaqDao addfaqDao;
	
	
	@Override
	public Response allSearchFaq(FaqList faqlist) 
	{
		Response faqList=addfaqDao.allSearchFaq(faqlist);
	   return faqList;
	}
	@Override
	public Response addFaqQuery(FaqList faqList) 
			{
		Response result=null;
		result=addfaqDao.addFaqQuery(faqList);
		return result;
	        }

	@Override
	public Response getbupartyNames(FaqList faqList) {
		Response bupartyName=addfaqDao.getbupartyNames(faqList);
		   return bupartyName;
	}
	@Override
	public Response updateFaqs(FaqList faqList) {
		Response updateFaq=addfaqDao.updateFaqs(faqList);
		return updateFaq;
	}
	@Override
	public Response deleteFaqs(FaqList faqlist) 
	{
		Response updateFaq=addfaqDao.deleteFaqs(faqlist);
		return updateFaq;
	}
	
	@Override
	public Response getPickListValue(String list) {
		Response list1=addfaqDao.getPickListValue(list);
		return list1;
	}
	
	
	public AddFaqDao getAddfaqDao() {
		return addfaqDao;
	}
	public void setAddfaqDao(AddFaqDao addfaqDao) {
		this.addfaqDao = addfaqDao;
	}
	@Override
	public Response getFaqDetail(int deletelist) {
		Response updateFaq=addfaqDao.getFaqDetail(deletelist);
		return updateFaq;
	}
	@Override
	public Response allSearchFaqAdmin(FaqList faqlist) {
		Response faqList=addfaqDao.allSearchFaqAdmin(faqlist);
		   return faqList;
	}	

}
