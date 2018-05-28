package in.fiinfra.diy.aspect;

import javax.ws.rs.core.Response;

import in.fiinfra.common.util.BaseResponse;
import in.fiinfra.common.util.FiinfraResponseBuilder;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class FacadeAroundAspect {

	private static final Logger LOGGER = Logger.getLogger(FacadeAroundAspect.class);
	
	@Around("execution(* in.fiinfra.*.facade.*.*(..))")
	public Response facadeAroundAdvice(ProceedingJoinPoint proceedingJoinPoint){
		LOGGER.debug("***************************AOP called *************************************");
		Object value = null;
		Response response = null;
		try {
			System.out.println("invoking getPartyProfileForPartyId() method");
			value = proceedingJoinPoint.proceed();
			BaseResponse<Object> baseResponse = new BaseResponse<Object>();
  	  		baseResponse.setResponseObject(value);
  	  		response = FiinfraResponseBuilder.getSuccessResponse(baseResponse, null);
		} catch (Throwable e) {
			LOGGER.error("Returning error Responce");
			response = FiinfraResponseBuilder.getErrorResponse("Error in processing request");
		}
      return response;
  }
}