package in.fiinfra.pg;

import in.fiinfra.common.common.StringUtils;
import in.fiinfra.cp.CommonUtils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Calendar;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class BillDeskAPI {
	
	public final String BILLDESK_QUERY_URL ;
	public final  String BILLDESK_MERCHANT_ID ;
	public final  String BILLDESK_ChecksumKey;
	
	public BillDeskAPI(){
		BILLDESK_ChecksumKey = "Sib8tU95LaYb";
		BILLDESK_MERCHANT_ID = "FINFRA";
		BILLDESK_QUERY_URL="https://www.billdesk.com/pgidsk/PGIQueryController";
	}

	
	private static Log logger = LogFactory.getLog(BillDeskAPI.class);
	
	public String buildPgOptionForm(Object... formData) throws Exception {
		StringBuilder str = new StringBuilder();
		for(Object ob:formData){
			if(str.length()>0){
				str.append("|");
			}
			str.append(ob.toString());
		}
		String checksum = HmacSHA256(str.toString(),BILLDESK_ChecksumKey);
		str.append("|").append(checksum);
		return str.toString();
	}
	
	public String[] retrivePgOptionForm(String param) throws PGException {
		if(StringUtils.isEmpty(param)){
			throw new PGException("Invalid Form Data");
		}
		String msg = StringUtils.substringBeforeLast(param, "|");
		if(StringUtils.isEmpty(msg)){
			throw new PGException("Invalid Form Data");
		}
		
		String generatedCheckSum;
		generatedCheckSum = HmacSHA256(msg,BILLDESK_ChecksumKey);
		String[] tokens = StringUtils.splitPreserveAllTokens(param,"|");
		String checksum = tokens[tokens.length-1];

		
		if(!generatedCheckSum.equalsIgnoreCase(checksum)){
			throw new PGException("Invalid Form Data");
		}

		return tokens;
	}
	


	public String buildForm(String merchantId, String secret,
			String returnUrl, PaymentData orderData) throws Exception {

		// Check the merchant ID
		if (merchantId == null || merchantId.length() == 0) {
			throw new Exception("Merchant ID not set");
		}

		// Check the amount
		if (orderData.getPaymentAmount() <= 0) {
			throw new Exception("Amount not set");
		}

		StringBuilder request = new StringBuilder();
		
		request.append(merchantId).append("|");
		request.append(orderData.getTrxReference()).append("|");
		request.append("NA").append("|");
		request.append(new BigDecimal(orderData.getPaymentAmount())
				.setScale(2, BigDecimal.ROUND_HALF_DOWN).doubleValue()).append("|");
		request.append("NA").append("|"); //Bank ID
		request.append("NA").append("|"); 
		request.append("NA").append("|");
		request.append("INR").append("|");
		request.append("DIRECT").append("|");
		request.append("R").append("|");
		request.append(merchantId.toLowerCase()).append("|");
		request.append("NA").append("|");
		request.append("NA").append("|");
		request.append("F").append("|");
		request.append("NA").append("|");
		request.append("NA").append("|");
		request.append(replaceSpecialChar(orderData.getPartyName())).append("|");
		request.append("NA").append("|");
		request.append("NA").append("|");
		request.append("NA").append("|");
		request.append(CommonUtils.format(Calendar.getInstance().getTime(),"YYYYMMDD")).append("|");
		request.append(returnUrl);
		String checksum = HmacSHA256(request.toString(),secret);
		request.append("|").append(checksum);
		
		return request.toString();

	}

	private String replaceSpecialChar(String str){
		if(!StringUtils.isEmpty(str)){
			return str.replaceAll("[^a-zA-Z0-9]", "");	
		}
		return str;
	}

	public String buildQueryRequest(PaymentData orderData) throws Exception {


		// Check the amount
		if (StringUtils.isEmpty(orderData.getTrxReference()) ) {
			throw new Exception("Trx Reference not set");
		}

		StringBuilder request = new StringBuilder();
		
		request.append("0121").append("|");
		request.append(BILLDESK_MERCHANT_ID).append("|");
		request.append(orderData.getTrxReference()).append("|");
		request.append(Calendar.getInstance().getTimeInMillis());
		String checksum = HmacSHA256(request.toString(),BILLDESK_ChecksumKey);
		request.append("|").append(checksum);
		
		return request.toString();

	}

	public static String HmacSHA256(String message, String secret)
			throws PGException {
		MessageDigest md = null;
		try{
		Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
		SecretKeySpec secret_key = new SecretKeySpec(secret.getBytes(),
				"HmacSHA256");
		sha256_HMAC.init(secret_key);
		byte raw[] = sha256_HMAC.doFinal(message.getBytes());

		StringBuffer ls_sb = new StringBuffer();
		for (int i = 0; i < raw.length; i++)
			ls_sb.append(char2hex(raw[i]));
		return ls_sb.toString(); // step 6

		}catch(Exception ex){
			throw new PGException("Error while generating checksum", ex);
		}

	}

	public static String char2hex(byte x)

	{
		char arr[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F' };

		char c[] = { arr[(x & 0xF0) >> 4], arr[x & 0x0F] };
		return (new String(c));
	}

	private boolean postForm(String billdeskUrl, String formData)
			throws Exception {
		String line;
		String resString = "";

		// Create the request
		URL reqUrl = new URL(billdeskUrl);
		HttpURLConnection reqConn = (HttpURLConnection) reqUrl.openConnection();
		reqConn.setDoInput(true);
		reqConn.setDoOutput(true);
		reqConn.setUseCaches(false);
		reqConn.setRequestMethod("POST");
		reqConn.setRequestProperty("Content-Type",
				"application/x-www-form-urlencoded");
		reqConn.setRequestProperty("Connection", "Close");
		reqConn.setRequestProperty("charset", "utf-8");
		reqConn.setRequestProperty("Content-Length",
				"" + Integer.toString(formData.getBytes().length));
		try (DataOutputStream reqStream = new DataOutputStream(
				reqConn.getOutputStream())) {
			reqStream.writeBytes(formData);
			reqStream.flush();
		}
		try (BufferedReader resBuf = new BufferedReader(new InputStreamReader(
				reqConn.getInputStream()))) {
			while (true) {
				line = resBuf.readLine();

				if (line == null) {
					break;
				}

				resString += line;
			}
		}

		return true;
	}
	
	public BilldeskResponseData parseResponse(String msg, String secret) {
		String[] tokens = StringUtils.splitPreserveAllTokens(msg, "|");
		BilldeskResponseData response = new BilldeskResponseData();
		
		if(tokens.length != 26){
			response.setErrorDesc("Invalid Message Response from Billdesk, Size = "+tokens.length+" Msg="+msg);
			return response;
		}
		
		String responseMsg = StringUtils.substringBeforeLast(msg, "|");
		
		String generatedCheckSum;
		try {
			generatedCheckSum = HmacSHA256(responseMsg,secret);
		} catch (PGException e) {
			response.setErrorDesc(e.getMessage());
			return response;
		}
		
		
		int index = 0;
		/*
		 * MerchantID|CustomerID|TxnReferenceNo|BankReferenceNo|TxnAmount|
		 * BankID|BankMerchantID|TxnType|CurrencyName|ItemCode|SecurityType|SecurityID|
		 * SecurityPassword|TxnDate|AuthStatus|SettlementType|
		 * AdditionalInfo1|AdditionalInfo2|AdditionalInfo3|AdditionalInfo4|AdditionalInfo5|AdditionalInfo6|
		 * AdditionalInfo7|ErrorStatus|ErrorDescription|CheckSum
		 * */
		
		response.setMerchantId(tokens[index++]);
		response.setCustomerId(tokens[index++]);
		response.setTxnReferenceNo(tokens[index++]);
		response.setBankRef(tokens[index++]);
		response.setAmount(tokens[index++]);
		response.setBankId(tokens[index++]);
		response.setBankMerchantId(tokens[index++]);
		response.setTxnType(tokens[index++]);
		response.setCurrencyName(tokens[index++]);
		response.setItemCode(tokens[index++]);
		response.setSettlementType(tokens[index++]);
		response.setSecurityId(tokens[index++]);
		response.setSecurityPassword(tokens[index++]);
		response.setTxnDate(tokens[index++]);
		response.setAuthStatus(tokens[index++]);
		response.setSettlementType(tokens[index++]);
		response.setAddInfo1(tokens[index++]);
		response.setAddInfo2(tokens[index++]);
		response.setAddInfo3(tokens[index++]);
		response.setAddInfo4(tokens[index++]);
		response.setAddInfo5(tokens[index++]);
		response.setAddInfo6(tokens[index++]);
		response.setAddInfo7(tokens[index++]);
		response.setErrorStatus(tokens[index++]);
		response.setErrorDesc(tokens[index++]);
		response.setChecksum(tokens[index++]);
		response.setResponseMsg(msg);
		
		if(!generatedCheckSum.equalsIgnoreCase(response.getChecksum())){
			response.setErrorDesc("Invalid checksum Found="+response.getChecksum()+", Expected= "+generatedCheckSum+ "  :Msg="+msg);
		}

		return response;
	}
}
