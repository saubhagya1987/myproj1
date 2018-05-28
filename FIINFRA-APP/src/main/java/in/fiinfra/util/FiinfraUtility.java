package in.fiinfra.util;

import in.fiinfra.common.common.DocumentData;
import in.fiinfra.common.diy.models.AdviceAssumption;
import in.fiinfra.common.diy.models.WhatIfData;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Properties;

import org.apache.poi.openxml4j.opc.internal.FileHelper;

public class FiinfraUtility {
	/*public static String postRequest(String actionName,List<NameValuePair> urlParameters){
		String response="";
		String prefix="";
		try{
			prefix=FiinfraUtility.getRestDBURL();
			System.out.println("prefix+actionName:---------"+prefix+actionName);
			HttpClient client = new DefaultHttpClient();
			Logger.logEntry(FiinfraUtility.class,"URL:--"+prefix+actionName,Logger.INFO, Thread.currentThread().getStackTrace()[1].getMethodName());
			HttpPost post = new HttpPost(prefix+actionName);
			post.setEntity(new UrlEncodedFormEntity(
					urlParameters));
			HttpResponse response1 = client.execute(post);
			System.out.println("Post parameters : "
			+ post.getEntity());
			System.out.println("Response Code : "
			+ response1.getStatusLine().getStatusCode());
			BufferedReader rd = new BufferedReader(
			new InputStreamReader(response1.getEntity()
					.getContent()));
			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) != null) {
			result.append(line);
			}
			Logger.logEntry(FiinfraUtility.class, result.toString(), Logger.INFO,  Thread.currentThread().getStackTrace()[1].getMethodName());
			response=result.toString();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}*/

 public static String getRestDBURL(){
	 String url="";
	 try{
		 Properties properties = new Properties();
			InputStream stream = FileHelper.class.getClassLoader()
					.getResourceAsStream("ApplicationResources.properties");
			properties.load(stream);
			url = properties
					.getProperty("restdburl");
			Logger.logEntry(FiinfraUtility.class, url, Logger.DEBUG,  Thread.currentThread().getStackTrace()[1].getMethodName());
	 }catch (Exception e) {
		//e.printStackTrace();
		 Logger.logEntry(FiinfraUtility.class, url, Logger.DEBUG,  Thread.currentThread().getStackTrace()[1].getMethodName());
	}
	 return url;
 }
 public static String getDocumentXML(List<DocumentData> documentDatas){
	 String documentXML=null;
	 if(documentDatas!=null){
		 documentXML="<Root>";
	 for(DocumentData d:documentDatas){
			documentXML+="<Document>";
			documentXML+="<DocumentName>"+d.getDocumentName()+"</DocumentName>";
			documentXML+="<DocumentStorageLocation>"+d.getDocumentStorageLocation()+"</DocumentStorageLocation>";
			documentXML+="<DocumentType>"+d.getDocumentType()+"</DocumentType>";
			documentXML+="<CreatedBy>"+d.getCreatedBy()+"</CreatedBy>";
			documentXML+="<FileName>"+d.getFileName()+"</FileName>";
			documentXML+="<FileSize>"+d.getFileSize()+"</FileSize>";
			documentXML+="<FileStoragePathURI>"+d.getFileStoragePathURI()+"</FileStoragePathURI>";
			documentXML+="<FileTypeId>"+d.getFileTypeId()+"</FileTypeId>";
			documentXML+="</Document>";
		}
	 documentXML+="</Root>";
	 } 
	 return documentXML;
 }
 
 public static String getAssumptionsXml(List<AdviceAssumption> adviceAssumptions) 
 {
	String assumptionsXml=null;
	
	if(adviceAssumptions != null)
	{
		assumptionsXml ="<Root>";
		for (AdviceAssumption adviceAssumption:adviceAssumptions) 
		{
			assumptionsXml+="<Assumption>";
			assumptionsXml+="<AssumptionValue><![CDATA["+adviceAssumption.getAssumptionValue()+"]]></AssumptionValue>";
			assumptionsXml+="<AssumptionCodeId><![CDATA["+adviceAssumption.getAssumptionCodeId()+"]]></AssumptionCodeId>";
			assumptionsXml+="</Assumption>";
		}
		assumptionsXml+="</Root>";
	}
	  return assumptionsXml;
 }
}