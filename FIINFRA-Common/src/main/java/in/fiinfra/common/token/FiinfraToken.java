package in.fiinfra.common.token;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;


public class FiinfraToken {

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ");
	
	
	public String generateWebIntegrationToken(String userName, String applicationId, String ipAddress) throws FiinfraTokenException {
		try {
			FiinfraCipher cipher = new FiinfraCipher();
			String token = "userName~"+userName+
					"|applicationId~"+applicationId+
					"|ipAddress~"+ipAddress+
					"|tokenTime~"+sdf.format(new Date());
			
			String encryptedToken = cipher.encrypt(token);
			String encodedToken = URLEncoder.encode(encryptedToken, "UTF-8");
			return encodedToken;
		} catch (Exception ex) {
			throw new FiinfraTokenException(ex);
		}
	}

	public static String generateLocalToken(String userName, String applicationId,String ipAddress) throws FiinfraTokenException {
		try {
			FiinfraCipher cipher = new FiinfraCipher();
			String token = "userName~"+userName+
					"|applicationId~"+applicationId+
					"|ipAddress~"+ipAddress+
					"|tokenTime~"+sdf.format(new Date());
					
			String encryptedToken = cipher.encrypt(token);
			String encodedToken = URLEncoder.encode(encryptedToken, "UTF-8");
			
			return encodedToken;
		} catch (Exception ex) {
			throw new FiinfraTokenException(ex);
		}
	}
	
	public static String generateRestToken(String serviceName, String applicationId, String ipAddress) throws FiinfraTokenException {
		try {
			FiinfraCipher cipher = new FiinfraCipher();
			String token = "serviceName~"+serviceName+
					"|applicationId~"+applicationId+
					"|ipAddress~"+ipAddress+
					"|tokenTime~"+sdf.format(new Date());
						
			String encryptedToken = cipher.encrypt(token);
			String encodedToken = URLEncoder.encode(encryptedToken, "UTF-8");
			return encodedToken;
		} catch (Exception ex) {
			throw new FiinfraTokenException(ex);
		}
	}

	public String generateWSToken(String serviceName, String applicationId, String ipAddress) throws FiinfraTokenException {
		return generateRestToken(serviceName, applicationId, ipAddress);
	}
}
