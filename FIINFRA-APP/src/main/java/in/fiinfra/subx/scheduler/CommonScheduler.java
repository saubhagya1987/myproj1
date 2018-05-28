package in.fiinfra.subx.scheduler;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;

public abstract class CommonScheduler implements BeanFactoryAware{
	private BeanFactory beanFactory;
	
	private boolean active; 

	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		this.beanFactory = beanFactory;
	}

	public <T> T getBean(Class<T> requiredType) {
		return this.beanFactory.getBean(requiredType);
	}
	
	
	
	protected abstract void doExecute();
	

	public final void execute() {
		if(!isActive()){
			LogFactory.getLog(getClass()).info("Skipping job as it's not Active "+getJobName());
			return;
		}
		LogFactory.getLog(getClass()).info("Starting job "+getJobName());
		try{
			doExecute();	
		}catch(Throwable ex){
			LogFactory.getLog(getClass()).info("Error while executing  Job"+getJobName(),ex);
		}
		LogFactory.getLog(getClass()).info("Finished job "+getJobName());
	}
	
	protected abstract String getJobName();

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}

 