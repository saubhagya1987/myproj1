package in.fiinfra.query.service;

import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.QueryRequest;
import in.fiinfra.common.service.FiinfraAppService;
import in.fiinfra.common.service.Services;
import in.fiinfra.query.model.GetRequest;

import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;

public class BasicService  implements BeanFactoryAware {
	
	private BeanFactory beanFactory;
	
	
	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		this.beanFactory = beanFactory;
	}

	public <T> T getBean(Class<T> requiredType) {
		return this.beanFactory.getBean(requiredType);
	}


	public List<CodeValueData> getCodeValue(String type){
		QueryRequest q = new QueryRequest();
		q.setCodeTypes(type);
		
		return getService().getForObjectCollection(Services.getPicklistValueList, q, CodeValueData.class, appendPathParam());
	}

	public List<CodeValueData> getCityList(int parent){
		return getService().getForObjectCollection(Services.getCityList, new GetRequest().param("parentId", parent), CodeValueData.class, appendPathParam());
	}

	protected FiinfraAppService getService(){
		return getBean(FiinfraAppService.class);
	}
	
	protected String[] appendPathParam(String...params ){
		String[] pathParams = new String[(params != null ? params.length:0)+2];
		pathParams[0] = "ramu";
		pathParams[1] = "1234";
		if(params != null){
			for(int i=0;i<params.length;i++){
				pathParams[i+2] = params[i];
			}
		}
		
		return pathParams;
	}

}
