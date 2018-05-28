package in.fiinfra.common.token;

import in.fiinfra.common.util.FiinfraConstants;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.lang.time.DateUtils;
import org.apache.log4j.Logger;

public class FiinfraTokenDecrypter {
	
	private static final Logger LOGGER = Logger.getLogger(FiinfraTokenDecrypter.class);
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ");

	public FiinfraTokenDecrypter() {
	}

	public static Map<String, String> decryptToken(String token)
			throws FiinfraTokenException {

		try {
			Map<String, String> map = new HashMap<String, String>();

			String decodedToken = token;
			decodedToken = URLDecoder.decode(token, "UTF-8");
			
			String decryptedToken = (new FiinfraCipher()).decrypt(decodedToken);
			StringTokenizer sz = new StringTokenizer(decryptedToken, "|");

			while (sz.hasMoreTokens()) {
				String s = sz.nextToken();
				//LOGGER.info("s " + s);
				String[] keyVal = s.split("~");
				map.put(keyVal[0], keyVal[1]);
			}
			
			map.put("isTokenValid", "true");
			
			
			
			return map;

		} catch (Exception ex) {
			throw new FiinfraTokenException(ex);
		}
	}
	
	public static Boolean isTokenValidated(String ipaddress,String deceptedString)
	{
		try
		{
			Map<String, String> tokenMap = decryptToken(deceptedString);
			String ipAddress = tokenMap.get("ipAddress");
			Integer sourceSystemId =Integer.valueOf(tokenMap.get("applicationId"));
			if(ipaddress.equalsIgnoreCase(ipAddress) && sourceSystemId == FiinfraConstants.PARTNER_PORTAL
				|| sourceSystemId == FiinfraConstants.SERVICE_PORTAL
				|| sourceSystemId == FiinfraConstants.CLIENT_PORTAL
				|| sourceSystemId == FiinfraConstants.DIY
				|| sourceSystemId == FiinfraConstants.INTEGRATION_PORTAL){
				return true;
			}
			else
				return false;
		} 
		catch (FiinfraTokenException e) 
		{
			e.printStackTrace();
		}
		return true;
	
	}
	
	@SuppressWarnings("deprecation")
	public static Boolean validateLocalToken(String ipAddress,String token){
		try
		{
			Map<String, String> tokenMap = decryptToken(token);
			String IPAddress = tokenMap.get("ipAddress");
			Date requestDate = new Date(sdf.format(tokenMap.get("tokenTime")));
			Date currentDate = DateUtils.addMilliseconds(new Date(), 5);//added time spam of 5 minute
			Integer sourceSystemId =Integer.valueOf(tokenMap.get("applicationId"));
			if(IPAddress.equalsIgnoreCase(ipAddress) && sourceSystemId == FiinfraConstants.PARTNER_PORTAL
				|| sourceSystemId == FiinfraConstants.SERVICE_PORTAL
				|| sourceSystemId == FiinfraConstants.CLIENT_PORTAL
				|| sourceSystemId == FiinfraConstants.DIY
				|| sourceSystemId == FiinfraConstants.INTEGRATION_PORTAL &&
				requestDate.before(currentDate)
				){
				return true;
			}
			else
				return false;
		} 
		catch (FiinfraTokenException e) 
		{
			e.printStackTrace();
		}
		return true;
	}
}
