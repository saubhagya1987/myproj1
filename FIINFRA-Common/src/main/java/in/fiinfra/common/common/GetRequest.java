package in.fiinfra.common.common;

import in.fiinfra.common.common.BaseRequest;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class GetRequest extends BaseRequest{
	private final Map<String,String> params = new HashMap<String,String>();
	
	public GetRequest param(String key, String value){
		if(!StringUtils.isEmpty(value)){
			params.put(key, value);	
		}
		return this;
	}
	public GetRequest param(String key, int value){
		params.put(key, ""+value);	
		return this;
	}


	@Override
	protected void appendAll(StringBuilder sb) {
		super.appendAll(sb);
		for(Map.Entry<String, String> entry:params.entrySet()){
			append(sb, entry.getKey(), entry.getValue());
		}
	}
}
