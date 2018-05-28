package in.fiinfra.frmk;

public class ServiceException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public ServiceException(String message, Throwable ex) {
		super(message, ex);
	}

	public ServiceException(String message) {
		super(message);
	}

}
