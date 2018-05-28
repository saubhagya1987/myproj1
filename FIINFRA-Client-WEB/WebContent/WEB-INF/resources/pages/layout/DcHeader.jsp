<%@page import="java.io.File"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="top_header clearfix"> <a href="#" class="setting fr"></a>
  <div class="logout_pop_up"><a href="#" class="myaccount_btn"><span class="my_acc_icon"> </span> <span class="my_acc_txt"> MY ACCOUNT</span></a> <a href="<c:url value="/j_spring_security_logout" />" class="logout_btn"><span class="my_logout_icon"> </span> <span class="my_logout_txt"> LOGOUT</span></a> </div>
  <section class="submenu"><!--<img class="submenu_arrow" src="${pageContext.request.contextPath}/resources/images/submenu_arrow.png" height="33" width="46" alt="">-->
    <div class="menu_section">
      <ul class="clearfix reset">
        <li class="fl menu chng_prof"><a href="${pageContext.request.contextPath}/partner/personal/info" class="anch"><span class="icon"></span><span class="txt">Change Profile</span></a></li>
        <li class="fl menu adv_assum"><a href="${pageContext.request.contextPath}/partner/assumption" class="anch"><span class="icon"></span><span class="txt">Advice Assumptions</span></a></li>
        <li class="fl menu chang_pass"><a href="${pageContext.request.contextPath}/password/changePassword" class="anch"><span class="icon"></span><span class="txt">Change Password</span></a>
        </li>
        <li class="fl menu adv_recomm"><a href="${pageContext.request.contextPath}/partner/recommendation" class="anch"><span class="icon"></span><span class="txt">Advice Recommendations</span></a></li>
      </ul>
    </div>
    <a href="${pageContext.request.contextPath}/partner/personal/info?viewId=8" class="anchor personal">Personalization</a>
  </section>
  <a href="#" class="header_add add2"><img src="${pageContext.request.contextPath}/resources/images/add2.png" /></a> <a href="#" class="header_add add1"><img src="${pageContext.request.contextPath}/resources/images/add1.png" /></a>
  <div class="fl" id="logo" style="max-height:61px; max-width:140px"><a href="${pageContext.request.contextPath}/partner/dashboard">
  	<%
  	String photoPath = null;
  	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
  	if(userSession != null){
  		photoPath = userSession.getLogo();
  	}
  	%>
  	<%-- <img src="<%=FiinfraUtility.getImagePath(request, photoPath, "/resources/images/temp_logo.png") %>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a> --%>
    <%-- <c:choose>
	   <c:when test="${not empty photoPath}">
	   		<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
	   </c:when>
	   <c:otherwise>
	   		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>	
	   </c:otherwise>
    </c:choose> --%>
    
    <%-- <% if (photoPath==null || photoPath.isEmpty()) { %> 
		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>
   <% } else { %>
   		<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
    <% } %> --%>
    <%
		String x = "D:/Ffreedom-DI/images/"+photoPath;
		File file = new File(x);
	%>
	<%-- <c:out value="<%=x %>"></c:out> --%>
	<% if (file.exists() && !file.isDirectory()) { %> 
		<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
   <% } else { %>
   		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>
    <% } %>
    
  </div>
</section>