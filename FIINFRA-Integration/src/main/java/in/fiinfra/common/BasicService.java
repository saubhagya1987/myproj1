package in.fiinfra.common;


import in.fiinfra.common.common.CodeValueData;
import in.fiinfra.common.common.GetRequest;
import in.fiinfra.common.diy.models.UserAccessLog;
import in.fiinfra.common.diy.models.UserSession;

import java.util.Collections;
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

	public List<CodeValueData> getCodeValue(String type) {
		
		List<CodeValueData> lst =getService().getForObjectCollection(
				Services.getPicklistValueList,
				new GetRequest().param("codeTypeIds", type),
				CodeValueData.class, appendPathParam());
		
		Collections.sort(lst);
		
		return lst;
	}

	public Boolean saveUserAccessLog(UserAccessLog log, UserSession userSession) {
		
		return getService().saveAccessLog(
				Services.userAccessLog,
				log,
				new String[]{userSession.getUserName(),userSession.getToken()});

	}

	public List<CodeValueData> getCodeValueByName(String name) {
		UserSession user = AuthHandler.getCurrentUser();
		List<CodeValueData> lst =  getService().getForObjectCollection(
				Services.COMMON_CODE_VALUES,
				new GetRequest(),
				CodeValueData.class, new String[]{name,""+user.getBuId()});
		
		Collections.sort(lst);
		
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
		UserSession user =  AuthHandler.getCurrentUser();
		String[] pathParams = new String[(params != null ? params.length : 0) + 2];
		pathParams[0] = user.getUserName();
		pathParams[1] = user.getToken();
		if (params != null) {
			for (int i = 0; i < params.length; i++) {
				pathParams[i + 2] = params[i];
			}
		}

		return pathParams;
	}

}
