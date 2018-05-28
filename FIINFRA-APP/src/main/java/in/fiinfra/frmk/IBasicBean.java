package in.fiinfra.frmk;

import java.util.Map;


public interface IBasicBean {

	public Long getId();
	
	public void setId(Long id);

	public abstract String getInsertQryName();

	public abstract String getUpdateQryName();
	
	public void dbBinding(Map<String,Object> params);

}
