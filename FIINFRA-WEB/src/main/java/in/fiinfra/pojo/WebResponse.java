package in.fiinfra.pojo;
/**
 * 
 * The class will be used by finfra-webapp to return the json response
 *
 */
public class WebResponse {

	private String statusCode;//response status code
	
	private String message;// message to be shown to user
	
	private Object data;// actual data

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
	
	
}
