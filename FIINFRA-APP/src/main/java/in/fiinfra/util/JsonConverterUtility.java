package in.fiinfra.util;



import in.fiinfra.framework.models.Audit;

import com.google.gson.Gson;

public class JsonConverterUtility {

	public static void main(String[] args) {
		Audit audit = new Audit();
		audit.setActionByPartyId(111);
		audit.setActionByUserID(222);
		audit.setBuId(153);
		audit.setDbProc("usp_pp_someStoreProc");
		audit.setEventID(111);
		audit.setEventTextXML("SomeXML");
		audit.setObjectName("SomeObject");
		audit.setProgamNo("progamNo");
		audit.setSourceModule("sourceModule");
		audit.setSourceScreen("sourceScreen");
		audit.setSourceSystemID(333);
		
		
		//System.out.println(objectToJSON(audit));
		

	}
	
	public static String objectToJSON(Object object){
		Gson gson = new Gson();
		String json="";
		if(object!=null)
		json = gson.toJson(object);
		return json;
		
	}

}
