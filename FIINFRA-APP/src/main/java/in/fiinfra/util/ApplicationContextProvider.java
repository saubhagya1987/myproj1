/**
 *provides application context object for getting beans from applicationcontext.
 **/
package in.fiinfra.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * this class is used for loading class from application context
 * @author Nikhil Thakkar
 */
public class ApplicationContextProvider implements ApplicationContextAware {

    private static ApplicationContext ctx = null;
/**
 * used for return a class from applicationContext
 * @return ApplicationContext
 * 
 */
    public static ApplicationContext getApplicationContext() {
        return ctx;
    }

    /**
     *
     * @param ctx
     * @throws BeansException
     */
    @Override
    public void setApplicationContext(ApplicationContext ctx) throws BeansException {
        ApplicationContextProvider.ctx = ctx;
    }
}
