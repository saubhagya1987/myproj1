<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<!DOCTYPE html>
<html>
<style>
#page_loader { background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center; }
.page-content{width:100%}
.chosen-container { width:100% !important }
</style>

<head>
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>My Alerts</title>
<script>
$(document).ready(function(){
  /*  $('#my_alerts').slimScroll();
	$('#my_alerts #education .container').slimScroll();
    $('#my_alerts #traval_vacations .container_two').slimScroll();*/

  });
</script>
</head>

<body>

<div class="" id="my_alerts_parent">
  <section class="main"> 
     <section class="content common_content">
    	<%-- <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
     	<section class="in_content clearfix" id="my_alerts">
         <div id="education">
          <div class="header_strip">Pending / Today's Task</div>
          <c:choose>
          <c:when test="${not empty taskList}">
          
          <div class="container contact_par">          
            <ul class="reset clearfix heading">
              <li class="first">Owner</li>
              <li class="second">Test Action Plan</li>
              <li class="third">Category</li>
              <li class="fourth">Task For</li>
              <li class="fifth">Date</li>
              <li class="sixth">Status</li>
            </ul>
            <c:forEach items="${taskList}" var="task" varStatus="count">
            <ul class="reset clearfix record">
            <c:choose>
            	<c:when test="${empty task.ownerPartyName}">
            		<li class="first"><a href="${pageContext.request.contextPath}/partner/editTask/${task.id}?retUrl=/alert/showAlerts">-</a></li>
            	</c:when>
            	<c:otherwise>
            	<li class="first"><a href="${pageContext.request.contextPath}/partner/editTask/${task.id}?retUrl=/alert/showAlerts">${task.ownerPartyName}</a></li>
           		 </c:otherwise>
            </c:choose>
            <c:choose>
            	<c:when test="${empty task.subject}">
            		<li class="second">-</li>
            	</c:when>
            	<c:otherwise>
            	<li class="second">${task.subject}</li>
           		 </c:otherwise>
            </c:choose>
            <c:choose>
            	<c:when test="${empty task.categoryName}">
            		<li class="third">-</li>
            	</c:when>
            	<c:otherwise>
            	<li class="third">${task.categoryName}</li>
           		 </c:otherwise>
            </c:choose>
            <c:choose>
            	<c:when test="${empty task.targetContactType}">
            		 <li class="fourth">-</li>
            	</c:when>
            	<c:otherwise>
            		 <li class="fourth">${task.targetContactType}</li>
           		 </c:otherwise>
            </c:choose>
              <li class="fifth"><fmt:formatDate value="${task.dueDateTime}" pattern="dd-MMM-yyyy"/></li>
              <c:choose>
              	<c:when test="${fn:containsIgnoreCase(task.statusName, 'In Progress')}">
              		<li class="sixth"><span class="progress status">${task.statusName}</span></li>
              	</c:when>
              	<c:when test="${fn:containsIgnoreCase(task.statusName, 'Scheduled')}">
              		<li class="sixth"><span class="responded status">${task.statusName}</span></li>
              	</c:when>
              </c:choose>
              
            </ul>
            </c:forEach>
          </div>
        </div>
        </c:when>
        <c:otherwise>
        <div style="font-size: 18px;line-height: 34px;color: #3a3a3a;font-family: "allerregular";">
			No tasks found.
		</div>
        </c:otherwise>
        </c:choose>
        <div id="traval_vacations">
          <div class="header_strip">Pending Query</div>
          <c:choose>
          <c:when test="${not empty queryList}">
          <div class="container_two contact_par">
            <ul class="reset clearfix heading">
              <li class="first">Owner</li>
              <li class="second">Subject</li>
              <li class="third">Query Type</li>
              <li class="fourth">Last Updated</li>
              <li class="fifth">Status</li>
            </ul>
            <c:forEach items="${queryList}" var="query" varStatus="count">
            <ul class="reset clearfix record">
              <li class="first"><a href="${pageContext.request.contextPath}/query/messages?queryId=${query.queryId}&link=/alert/showAlerts">${query.queryOwnerName}</a></li>
              <c:choose>
            	<c:when test="${empty query.subject}">
            		 <li class="second">-</li>
            	</c:when>
            	<c:otherwise>
            		 <li class="second">${query.subject}</li>
           		 </c:otherwise>
              </c:choose>
              <c:choose>
            	<c:when test="${empty query.queryTypeName}">
            		 <li class="third">-</li>
            	</c:when>
            	<c:otherwise>
            		 <li class="third">${query.queryTypeName}</li>
           		 </c:otherwise>
              </c:choose>
              <c:choose>
            	<c:when test="${empty query.lastUpdatedDate}">
            		 <li class="fourth">-</li>
            	</c:when>
            	<c:otherwise>
            		 <li class="fourth">${query.lastUpdatedDate}</li>
           		 </c:otherwise>
              </c:choose>
              <c:choose>
              	<c:when test="${fn:containsIgnoreCase(query.status, 'New')}">
              		 <li class="fifth"><span class="new status">${query.status}</span></li>
              	</c:when>
              	<c:when test="${fn:containsIgnoreCase(query.status, 'In Progress')}">
              		 <li class="fifth"><span class="progress status">${query.status}</span></li>
              	</c:when>
              	<c:otherwise>
              		 <li class="fifth"><span class="responded status">${query.status}</span></li>
              	</c:otherwise>
              </c:choose>
              
             
            </ul>
        	</c:forEach>   
            
          </div>
        </div>
        
       </c:when>
       <c:otherwise>
       		<div style="font-size: 18px;line-height: 34px;color: #3a3a3a;font-family: "allerregular";">
				No queries found.
			</div>
       </c:otherwise>
       </c:choose>
        <!-- DC submenu Ends--> 
        
      </section>
      <div class="overlay"></div>
    </section>
    <div class="clr"></div>
  </section>
</div>
</body>
</html>
