package in.fiinfra.frmk;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;


public  abstract class BasicService implements BeanFactoryAware,InitializingBean {
	private BeanFactory beanFactory;
	
	
	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		this.beanFactory = beanFactory;
	}
	
	public BeanFactory getBeanFactory(){
		return this.beanFactory;
	}
	
	
	protected void init() throws Exception{
		
	}
	
	public DataBaseService getDataBaseService(){
		return (DataBaseService)beanFactory.getBean(DataBaseService.class);
	}


	public <T> T getBean(Class<T> c){
		return beanFactory.getBean(c);
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		init();
		
	}
}
