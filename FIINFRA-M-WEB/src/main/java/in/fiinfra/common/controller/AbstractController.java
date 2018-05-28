/*
 * I am ready for conflict
 * *

make a conflict
*/

package in.fiinfra.common.controller;


import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.query.service.BasicService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class AbstractController implements BeanFactoryAware{
	
	private BeanFactory beanFactory;
	
	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		this.beanFactory = beanFactory;
	}

	public <T> T getBean(Class<T> requiredType) {
		return this.beanFactory.getBean(requiredType);
	}

	public <T extends BasicService> T getRestService(Class<T> requiredType) {
		return this.beanFactory.getBean(requiredType);
	}

	
	public static UserSession getSessionUser() {
	    ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
	    UserSession sessionUser = null;
	    if(attr != null){
	    	HttpSession session = attr.getRequest().getSession(false);
	    	if(session != null){
	    		sessionUser = (UserSession)session.getAttribute("userSession");
	    	}
	    	
	    }
//		if(sessionUser ==null){
//			sessionUser = new UserSession();
//			sessionUser.setPartyId(6375);
//			sessionUser.setBuId(153);
//		}
		return sessionUser;

	}
	
	protected boolean validSession(HttpServletRequest request){

		UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
		if(userSession == null) {
			return false;
		}
		return true;

	}
	
	protected String redirectToLogin(){
		return "redirect:/login";
	}

	
	public static List<KeyValue> toKeyValue(List<CodeValueData> lst){
		List<KeyValue> lstKeyValue = new ArrayList<KeyValue>();
		for(CodeValueData d:lst){
			KeyValue ob = new KeyValue();
			ob.setId(d.getCodeValueId());
			ob.setName(d.getCodeValue());
			lstKeyValue.add(ob);
		}
		return lstKeyValue;
	}
	
	public static Date convertToDate(String str){
		if(StringUtils.isEmpty(str)){
			return null;
		}
		List<SimpleDateFormat> knownPatterns = new ArrayList<SimpleDateFormat>();
		knownPatterns.add(new SimpleDateFormat("dd-MMM-YYYY"));
		knownPatterns.add(new SimpleDateFormat("dd-MM-yyyy"));
		knownPatterns.add(new SimpleDateFormat("dd/MM/yyyy"));
		knownPatterns.add(new SimpleDateFormat("dd/MM/yy"));
		knownPatterns.add(new SimpleDateFormat("dd-MM-yy"));
		knownPatterns.add(new SimpleDateFormat("yyyyMMdd"));
//		knownPatterns.add(new SimpleDateFormat("MMM d"));
//		knownPatterns.add(new SimpleDateFormat("d MMM"));
//		knownPatterns.add(new SimpleDateFormat("d-MMM"));
//		knownPatterns.add(new SimpleDateFormat("MMM-d"));

		for (SimpleDateFormat pattern : knownPatterns) {
		    try {
		    	return pattern.parse(str);
		    } catch (ParseException pe) {
		        // Loop on
		    }
		}
		return null;
	}
	
	public static String reFormatDate(String dt){
		return formatDate(convertToDate(dt));
	}
	
	public static String formatDate(Date dt){
		if(dt ==null){
			return null;
		}
		return  new SimpleDateFormat("dd-MMM-yyyy").format(dt);
	}

}
