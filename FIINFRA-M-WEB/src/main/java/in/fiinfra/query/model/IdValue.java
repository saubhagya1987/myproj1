package in.fiinfra.query.model;

public class IdValue implements Comparable<IdValue>{
	private int id;
	private String value;
	
	public IdValue(int id, String value){
		this.id = id;
		this.value = value;
	}
	
	public IdValue(){
		
	}

	public IdValue(int id){
		this.id = id;
		this.value = null;
	}

	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return value;
	}
	
	@Override
	public int hashCode() {
		return Long.valueOf(id).hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof IdValue){
			return ((IdValue)obj).getId() == getId();
		}
		return false;
	}

	@Override
	public int compareTo(IdValue other) {
		return this.value.compareTo(other.getValue());
	}

}
