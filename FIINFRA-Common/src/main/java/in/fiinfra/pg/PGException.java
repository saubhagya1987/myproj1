package in.fiinfra.pg;

public class PGException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8401394156907252527L;
	public PGException(String msg){
		super(msg);
	}
	
	public PGException(String msg, Throwable ex){
		super(msg,ex);
	}

}
