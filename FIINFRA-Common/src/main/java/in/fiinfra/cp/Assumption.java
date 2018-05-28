package in.fiinfra.cp;

public class Assumption implements Comparable<Assumption> {

	private String value;
	private String label;
	private String startRange;
	private String endRange;
	private int priority;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getStartRange() {
		return startRange;
	}

	public void setStartRange(String startRange) {
		this.startRange = startRange;
	}

	public String getEndRange() {
		return endRange;
	}

	public void setEndRange(String endRange) {
		this.endRange = endRange;
	}


	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}
	
	@Override
	public int compareTo(Assumption o) {
		return  Integer.valueOf(this.priority).compareTo(o.getPriority());
	}
	
	public int getAsInt(int defaultValue){
		try{
			return Integer.parseInt(getValue());
		}catch(Exception ex){
			return defaultValue;
		}
	}

}
