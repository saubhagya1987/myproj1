package in.fiinfra.serviceportal.dao;

import in.fiinfra.common.service.vo.FaqList;

import javax.ws.rs.core.Response;
public interface AddFaqDao 
{
	
	Response allSearchFaq(FaqList faqlist) ;
	Response addFaqQuery(FaqList faqList);	
	Response getbupartyNames(FaqList faqList);
	Response updateFaqs(FaqList faqList);
	Response deleteFaqs(FaqList faqList);
	Response getFaqDetail(int deletelist);
	Response getPickListValue(String list);
	Response allSearchFaqAdmin(FaqList faqlist);

	


	
	
}
