package in.fiinfra.common.util;

import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.PropertyConfigurator;
import org.apache.poi.openxml4j.opc.internal.FileHelper;

public class Logger {
	@SuppressWarnings("unused")
	private static org.apache.log4j.Logger logger = null;
	public static final int ALL = 1;
	public static final int DEBUG = 2;
	public static final int INFO = 3;
	public static final int WARNING = 4;
	public static final int ERROR = 5;
	public static final int FATAL = 6;

	@SuppressWarnings("rawtypes")
	public static void logEntry(Class class1, Object message, int logType,
			String methodSignature) {
		try {
			InputStream inputStream = FileHelper.class.getClassLoader()
					.getResourceAsStream("ApplicationResources.properties");
			Properties prop = new Properties();
			prop.load(inputStream);
			String propertyFilePath = prop
					.getProperty("log4jPropertiesFilePath");
			String log4jDefaultPropertiesFilePath = prop
					.getProperty("log4jDefaultPropertiesFilePath");

			// System.out.println("File Path is:---"+propertyFilePath);
			PropertyConfigurator.configure(propertyFilePath);

			if (message != null) {
				logger = org.apache.log4j.Logger.getLogger(class1);
				switch (logType) {
				case ALL:
					logger.debug(methodSignature + ":" + message);
					break;
				case DEBUG:
					logger.debug(methodSignature + ":" + message);
					break;
				case INFO:
					logger.info(methodSignature + ":" + message);
					break;
				case WARNING:
					logger.warn(methodSignature + ":" + message);
					break;
				case ERROR:
					logger.error(methodSignature + ":",
							new Throwable(message.toString()));
					break;
				case FATAL:
					logger.fatal(methodSignature + ":" + message);
					break;
				default:
					logger.info(methodSignature + ":" + message);
					break;
				}
			}
			// System.out.println("File Path is:---"+log4jDefaultPropertiesFilePath);
			PropertyConfigurator.configure(log4jDefaultPropertiesFilePath);
		} catch (Exception e) {
			try{
			logger.error("Error in logger:", e);
			}catch (Exception ex) {
				// TODO: handle exception
			}
		}

	}

	// public static void main(String a[]){
	// List list=new ArrayList();
	// list.add("1st element");
	// list.add("2nd element");
	// logEntry(LoginAction.class,list, DEBUG,"checkLogin()");
	// logEntry(LoginAction.class,list, INFO,"checkLogin()");
	// try{
	// int i=5/0;
	// }catch (Exception e) {
	// logEntry(LoginAction.class,e, ERROR,"checkLogin()");
	// }
	// }

}
