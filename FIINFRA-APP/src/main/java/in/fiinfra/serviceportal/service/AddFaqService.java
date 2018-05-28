package in.fiinfra.serviceportal.service;

import javax.ws.rs.core.Response;

import  in.fiinfra.common.service.vo.FaqList;
public interface AddFaqService 
{
	Response allSearchFaq(FaqList faqlist);
	Response addFaqQuery(FaqList faqList);
	Response getbupartyNames(FaqList faqlist);
	Response updateFaqs(FaqList faqList);
	Response deleteFaqs(FaqList faq);
	Response getFaqDetail(int deletelist);
	Response getPickListValue(String list);
	Response allSearchFaqAdmin(FaqList faqlist);
}

