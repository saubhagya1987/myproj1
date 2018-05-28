package in.fiinfra.query.service;

public enum CodeValue {

	QUERY_TYPE(15);

	private CodeValue(int type) {
		this.type = type;
	}
	
	private final int type;
	
	public int getType(){
		return this.type;
	}
}
