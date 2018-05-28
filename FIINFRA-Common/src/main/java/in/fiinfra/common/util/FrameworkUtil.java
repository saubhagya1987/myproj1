package in.fiinfra.common.util;

import in.fiinfra.framework.models.Audit;
import in.fiinfra.framework.models.Notification;

import java.io.InputStream;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.poi.openxml4j.opc.internal.FileHelper;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.scheduling.concurrent.ThreadPoolExecutorFactoryBean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

@Component
public class FrameworkUtil  implements BeanFactoryAware,ApplicationListener<ApplicationEvent>
{
	private BeanFactory beanFactory;
	private static ThreadPoolTaskExecutor taskExecutor;

	public static void audit(Audit audit) {
		taskExecutor.execute(new AuditWorker(audit));
	}
	
	public static void notify(Notification notification) {
		taskExecutor.execute(new NotificationWorker(notification));
	}

	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		this.beanFactory= beanFactory;
	}

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextRefreshedEvent) {
			taskExecutor = new ThreadPoolTaskExecutor();
			taskExecutor.setMaxPoolSize(100);
			taskExecutor.initialize();
		}else if(event instanceof ContextClosedEvent){
			taskExecutor.shutdown();
		}
		
	}
}
