package in.fiinfra.frmk;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class LocalResultSet implements RsIterator {

	private final Iterator<String[]> iterator;
	private final Map<String, Integer> header = new HashMap<String, Integer>();
	private String[] currentRecord = null;
	int len = -1;
	private final String[] headers;
	private final List<String[]> data;

	public LocalResultSet(String[] headers, List<String[]> data) {
		this.headers = headers;
		this.data = data;
		if (headers != null) {
			for (int i = 0; i < headers.length; i++) {
				header.put(headers[i].toUpperCase(), i);
			}
			this.len = headers.length;
		}
		iterator = data.iterator();
	}

	public boolean next() {
		if (iterator != null && iterator.hasNext()) {
			currentRecord = iterator.next();
			return true;
		}
		return false;
	}

	public String getString(int index) {
		check(index);
		return currentRecord[index];
	}

	public String getString(String column) {
		int index = header.get(column.toUpperCase());
		return getString(index);
	}

	private int getIndex(String column) {

		Integer index = header.get(column.toUpperCase());
		check(index);
		return index;

	}

	public String[] getColumnNames() {
		Set<String> keys = header.keySet();
		return keys.toArray(new String[keys.size()]);
	}

	public int getColumnCount() {
		return len;
	}

	public String getColumnName(int index) {
		check(index);
		return headers[index];
	}

	private void check(Integer index) {
		check();
		if (index == null || index > headers.length || index < 0) {
			throw new IllegalArgumentException("Invalid state");
		}
	}

	private void check() {
		if (headers == null || currentRecord == null) {
			throw new IllegalArgumentException("Invalid state");
		}
	}

	@Override
	public Integer getInt(int index) {
		String value = getString(index);

		return value != null ? Integer.parseInt(value) : null;
	}

	@Override
	public Integer getInt(String column) {
		return getInt(getIndex(column));
	}

	@Override
	public int getRowCount() {
		return data.size();
	}

	public RsIterator me(){
		return this;
	}
}
