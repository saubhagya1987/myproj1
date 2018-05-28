package in.fiinfra.service;


import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.GetRequest;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;

public class BasicService implements BeanFactoryAware {

	private BeanFactory beanFactory;

	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		this.beanFactory = beanFactory;
	}

	public <T> T getBean(Class<T> requiredType) {
		return this.beanFactory.getBean(requiredType);
	}

	public List<CodeValueData> getCodeValue(int buId, String type) {
		
		List<CodeValueData> lst =getService().getForObjectCollection(
				Services.getPicklistValueList,
				new GetRequest().param("codeTypeIds", type).param("buId", buId),
				CodeValueData.class, appendPathParam());
		        Collections.sort(lst, new Comparator<CodeValueData>() {
			   @Override
			   public int compare(CodeValueData o1, CodeValueData o2) {
			    return Integer.valueOf(o1.getDisplaySeqNo()).compareTo(o2.getDisplaySeqNo());
			   }
			   
			  });
		
		return lst;
	}
	
	//
	// public List<CodeValueData> getCityList(int parent){
	// return getService().getForObjectCollection(Services.getCityList, new
	// GetRequest().param("parentId", parent), CodeValueData.class,
	// appendPathParam());
	// }
	//
	protected FiinfraAppService getService() {
		return getBean(FiinfraAppService.class);
	}

	protected String[] appendPathParam(String... params) {
		//UserSession user =  AuthHandler.getCurrentUser();
		String[] pathParams = new String[(params != null ? params.length : 0) + 2];
		pathParams[0] = "ramu";
		pathParams[1] = "1234";
		if (params != null) {
			for (int i = 0; i < params.length; i++) {
				pathParams[i + 2] = params[i];
			}
		}

		return pathParams;
	}

}
