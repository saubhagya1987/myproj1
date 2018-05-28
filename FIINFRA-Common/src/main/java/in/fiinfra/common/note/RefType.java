package in.fiinfra.common.note;

public enum RefType {
	Query;

	public static RefType getByName(String str) {
		for (RefType t : RefType.values()) {
			if (t.name().equalsIgnoreCase(str)) {
				return t;
			}
		}
		return null;
	}
}
