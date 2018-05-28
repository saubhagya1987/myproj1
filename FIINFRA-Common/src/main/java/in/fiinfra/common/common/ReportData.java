package in.fiinfra.common.common;


import java.util.List;





public class ReportData {

	private String[] fields;
	
	private List<Object> data;

	private Object headerData;

	public String[] getFields() {
		return fields;
	}

	public void setFields(String[] fields) {
		this.fields = fields;
	}

	public List<Object> getData() {
		return data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}

	public Object getHeaderData() {
		return headerData;
	}

	public void setHeaderData(Object headerData) {
		this.headerData = headerData;
	}

}
