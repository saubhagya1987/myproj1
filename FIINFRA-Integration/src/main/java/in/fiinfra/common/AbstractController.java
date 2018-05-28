package in.fiinfra.common;


import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.diy.models.KeyValue;
import in.fiinfra.common.diy.models.UserSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;

public class AbstractController implements BeanFactoryAware{
	
	private BeanFactory beanFactory;
	
	@Autowired
	ResourceBundleMessageSource messageSource;
	
	
	
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
		return AuthHandler.getCurrentUser();

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

	protected String getMessage(String key, Object... args){
		return messageSource.getMessage(key, args, Locale.getDefault());
	}
	
	protected String getHtmlOutput(String jspPath,  HttpServletRequest request, HttpServletResponse response){
		try{
		HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(response) {
		    private final StringWriter sw = new StringWriter();

		    @Override
		    public PrintWriter getWriter() throws IOException {
		        return new PrintWriter(sw);
		    }

		    @Override
		    public String toString() {
		       return sw.toString();
		    }
		};
		request.getRequestDispatcher("/WEB-INF/resources/pages/"+jspPath).include(request, responseWrapper);
		
		
		return responseWrapper.toString();
		}catch(Exception ex){
			ex.printStackTrace();
			return "";
		}
		
	}
}
