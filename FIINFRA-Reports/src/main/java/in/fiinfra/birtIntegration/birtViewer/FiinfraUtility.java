package in.fiinfra.birtIntegration.birtViewer;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.poi.openxml4j.opc.internal.FileHelper;

public class FiinfraUtility {
public static String getProperyValue(String key){
		
		Properties properties = new Properties();
		InputStream stream = FileHelper.class.getClassLoader()
				.getResourceAsStream("Birt.properties");
		try {
			properties.load(stream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return properties.getProperty(key);
		
		
}
}
