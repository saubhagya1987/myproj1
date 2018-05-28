package in.fiinfra.subx.scheduler;

import in.fiinfra.common.common.StringUtils;
import in.fiinfra.cp.CommonUtils;
import in.fiinfra.order.service.OrderService;
import in.fiinfra.pg.BillDeskAPI;
import in.fiinfra.pg.BilldeskResponseData;
import in.fiinfra.pg.PGException;
import in.fiinfra.pg.PaymentData;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

public class BilldeskRecoScheduler extends CommonScheduler {

	private boolean working = false;
	
	

	@Override
	public void doExecute() {
		if (working) {
			LogFactory.getLog(getClass()).info("skiping current cycle");
			return;
		}
		try {
			working = true;

			OrderService orderService = getBean(OrderService.class);

			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");

			//System.out.println("Invoked on " + dateFormat.format(System.currentTimeMillis()));

			List<PaymentData> pendingPayments = orderService.getPendingPayments();
			
			LogFactory.getLog(getClass().getName()).info("Update Payment Status Found = "+pendingPayments.size() +" Pending Records");
			
			if(pendingPayments.isEmpty()){
				return;
			}
			
			BillDeskAPI api = new BillDeskAPI();
			
			for(PaymentData paymentData:pendingPayments){
				try {
					BilldeskResponseData res = checkStatus(paymentData, api);
					if(res != null){
						LogFactory.getLog(getClass().getName()).info("Update Payment Status = "+paymentData.getPaymentID());
						paymentData.setAction("PGResponse");
						
						paymentData.setpGTxnRefNo(res.getTxnReferenceNo());
						paymentData.setTrxReference(res.getCustomerId());
						paymentData.setpGErrorDescription(res.getErrorDesc());
						paymentData.setpGResponseMessage(res.getResponseMsg());
						paymentData.setPaymentStatusId(148002);
						paymentData.setUserId(1);
						
						if("0300".equals(res.getAuthStatus())){
							paymentData.setpGStatusID(151001);
							paymentData.setPaymentStatusId(148003);
							paymentData.setpGPaidAmount(CommonUtils.toLong(res.getAmount()));
							paymentData.setPaymentAmount(CommonUtils.toLong(res.getAmount()));
						}
						else if("0399".equals(res.getAuthStatus())){
							paymentData.setpGStatusID(151002);
						}
						else if("NA".equals(res.getAuthStatus())){
							paymentData.setpGStatusID(151003);
						}
						else if("0002".equals(res.getAuthStatus())){
							paymentData.setPaymentStatusId(148001);
							paymentData.setpGStatusID(151004);
						}
						else {
							paymentData.setPaymentStatusId(148002);
							paymentData.setpGStatusID(151005);
						}
						
						paymentData.setAction("PGResponse");

						orderService.savePayment(paymentData.getBuId(), paymentData);
						
					}
				} catch (Exception e) {
					LogFactory.getLog(getClass().getName()).error("Error invoking Query API = "+paymentData.getPaymentID(),e);
				}
			}

			//System.out.println("Found " + products.size());
		} finally {

			working = false;
		}

	}
	

	@Override
	protected String getJobName() {
		return "ReconcilationScheduler";
	}
	
	private BilldeskResponseData checkStatus(PaymentData bean,BillDeskAPI api) throws Exception{
		try {
			 
			
			DefaultHttpClient client = new DefaultHttpClient();
			HttpPost  post = new HttpPost (api.BILLDESK_QUERY_URL);
			//getRequest.addHeader("accept", "application/json");
			String msg = api.buildQueryRequest(bean);
			
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
		    nameValuePairs.add(new BasicNameValuePair("msg",
		    		  msg));
		    post.setEntity(new UrlEncodedFormEntity(nameValuePairs));
		 
		    HttpResponse response = client.execute(post);
	 
			if (response.getStatusLine().getStatusCode() != 200) {
				throw new PGException("Failed : HTTP error code : "
				   + response.getStatusLine().getStatusCode());
			}
	 
			BufferedReader br = new BufferedReader(
	                         new InputStreamReader((response.getEntity().getContent())));
	 
			String line = "";
			StringBuffer result = new StringBuffer();
			//System.out.println("Output from Server .... \n");
			while ((line = br.readLine()) != null) {
				//System.out.println(line);
				result.append(line);
			}
			
			client.getConnectionManager().shutdown();
			if(StringUtils.isEmpty(result.toString())){
				return null;
			}
			
			return api.parseResponse(result.toString(), api.BILLDESK_ChecksumKey);
			
	 
			
		  } catch (ClientProtocolException e) {
	 
			//e.printStackTrace();
			 LogFactory.getLog(getClass().getName()).error(""+e);
			return null;
	 
		  } catch (IOException e) {
	 
			  LogFactory.getLog(getClass().getName()).error(""+e);
			return null;
		  }
		catch (Exception e) {
			 
			LogFactory.getLog(getClass().getName()).error(""+e);
			return null;
		  }
		
	}
	
}
