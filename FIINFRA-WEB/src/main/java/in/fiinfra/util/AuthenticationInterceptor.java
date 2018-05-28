package in.fiinfra.util;


import java.io.InputStream;
import java.util.Properties;

import in.fiinfra.common.diy.models.UserSession;
import in.fiinfra.common.util.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.LogFactory;
import org.apache.poi.openxml4j.opc.internal.FileHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter
{
 @Override
 public boolean preHandle(HttpServletRequest request,
   HttpServletResponse response, Object handler) throws Exception
 {
  String uri = request.getRequestURI();
  String redirectUrl="login.htm";
	String serverPath=request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath());
	
	Logger.logEntry(this.getClass(),"server path:---"+request.getRequestURL().toString().replace(request.getRequestURI().substring(0), request.getContextPath()),Logger.DEBUG,
			Thread.currentThread().getStackTrace()[1].getMethodName());
	
   if(!uri.endsWith("login.htm") && !uri.endsWith("logout.htm") && !uri.endsWith("buildSession.htm") && !uri.endsWith("forgotPassword.htm") 
		  && !uri.endsWith("getPicklistValues.htm") && !uri.endsWith("submitForEmailId.htm") && !uri.endsWith("submitForSecurityQuestion.htm") &&  !uri.contains("submitDcInput1.htm") &&  !uri.contains("showAnalysisReportPDF1.htm") && !uri.endsWith("redirectDcInputFPT.htm") )
  {
   UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
   try{
   if(userSession == null)
   {
	   Logger.logEntry(this.getClass(),"request.getRequestURI():--------------"+serverPath,Logger.DEBUG,
				Thread.currentThread().getStackTrace()[1].getMethodName());
		Properties properties = new Properties();
		InputStream stream = FileHelper.class.getClassLoader()
				.getResourceAsStream("ApplicationResources.properties");
		properties.load(stream);
		if(serverPath.contains(properties.getProperty("SHUBHCHINTAK_URL_PREFIX"))){
			redirectUrl = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
		}else if(serverPath.contains(properties.getProperty("FIINFRA_URL_PREFIX"))){
			redirectUrl = properties.getProperty("LOGOUT_URL_FIINFRA");
		}if(serverPath.contains(properties.getProperty("DFDA_URL_PREFIX"))){
			redirectUrl = properties.getProperty("LOGOUT_URL_DFDA");
		}if(serverPath.contains(properties.getProperty("SPA_URL_PREFIX"))){
			redirectUrl = properties.getProperty("LOGOUT_URL_SPA");
		}else{
			redirectUrl = properties.getProperty("LOGOUT_URL_SHUBHCHINTAK");
		}
		response.sendRedirect(redirectUrl);
    return false;
   }else if(userSession.getSuccessfulLoginCount()<1 && !uri.contains("getAdviceAssumptions.htm") && !uri.contains("saveAdviceAssumption.htm") && !uri.contains("getNotificationListForPartner.htm")  && !uri.contains("setup.htm") && !uri.contains("masterassumption.htm") && !uri.contains("notifications.htm") && !uri.contains("productrecommendations.htm") && !uri.contains("redirect.htm") && !uri.contains("agree.htm") && !uri.contains("disagree.htm") && !uri.contains("businessPlan.htm") && !uri.contains("saveBusinessValuationData.htm") && !uri.contains("getBusinessValuationDetails.htm") && !uri.contains("getContactUsRecord.htm")){
	   redirectUrl=serverPath+"/common/redirect.htm";
	   response.sendRedirect(redirectUrl);
	   return false;
   }else if(userSession.getIsForceChangePasswordOnLogin()==true && !uri.contains("changePassword.htm") && !uri.contains("chnagePassword.htm")  && !uri.contains("redirect.htm") && userSession.getSuccessfulLoginCount()>0){
	   redirectUrl=serverPath+"/common/redirect.htm";
	   response.sendRedirect(redirectUrl);
	   return false;
   }
   }catch(Exception e){
	   
   }
   
  }
  return true;
 }
}
