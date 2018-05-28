package in.fiinfra.frmk;

public interface RsIterator {
	public boolean next();

	public String getString(int index);

	public String getString(String column);

	public String[] getColumnNames();

	public int getColumnCount();

	public String getColumnName(int index);

	public Integer getInt(int index);

	public Integer getInt(String columnName);

	public int getRowCount();
}
