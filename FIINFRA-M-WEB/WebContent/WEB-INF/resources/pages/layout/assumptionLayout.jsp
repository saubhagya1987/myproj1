<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
request.setAttribute("_cdn", cdn);
%>

<!-- Start Google Analytics -->
<script>
 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
 (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
 })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

 ga('create', 'UA-48212643-3', 'auto');
 ga('send', 'pageview');

</script>

<!-- End Google Analytics -->


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link rel="shortcut icon" href="${_cdn}/assets/images/common-images/favicon.ico" />

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/basic.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/jquery-ui.css" /> 
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/custom.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/main.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/responsive.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/responsive.css" />

<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" /> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />--%>

<%-- <%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %> --%>

<script src="${_cdn}/assets/js/common-js/plugin/jquery-1.11.0.min.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/jquery-ui.js"></script> 
<script	src="${_cdn}/assets/js/common-js/plugin/toggles.js"></script>
<script	src="${_cdn}/assets/js/common-js/my_account_submenu.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/selectboxit.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.slimscroll.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/perfect-scrollbar.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/jquery.mousewheel.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.autosize.input.js"></script>
<script src="${_cdn}/assets/js/common-js/common/common.js"></script>
<script src="${_cdn}/assets/js/common-js/common_modal.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.validate.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/additional-methods.js"></script>


<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script>  --%>

<script>
$(document).ready(function() {
	
	$("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});
	
    var hitCnt = $("#hitCount").val();
    <c:if test="${not empty success}">
	    if(hitCnt == '0') {
	    	$("#successDialog").html("<spring:message code="${success}" />");
		  	$( "#successDialog").dialog( "open" );
		  	$("#hitCount").val("1");
	    }
	</c:if>
	
	<c:if test="${not empty error}">
		$("#successDialog").html("<spring:message code="${error}" />");
		$( "#successDialog").dialog( "open" );
	</c:if>
    
    
});
</script>
<!--[if gte IE 9]>
  <style type="text/css">
.partner_dashboard_submenu,.combined_submenu,.common_btn,.common_dialog_box .ui-state-default,.common_btn:active,.common_dialog_box .ui-state-default:active,.logout_pop_up .myaccount_btn,.logout_pop_up .myaccount_btn:active,.logout_pop_up .logout_btn,.logout_pop_up .logout_btn:active {filter: none;}
  </style>
<![endif]-->

</head>
<body>
<div class="wrapper">
<section class="main">
<header class="common_header inner_header">
<tiles:insertAttribute name="header"/>
	<div class="page_header">
					<h1 class="heading clearfix">
						<!--  <a href="#" class="help"><span class="help_txt">Help</span> </a> -->
						<a href="#" class="set_default" ><span
							class="set_default_txt">Set Default </span> </a> <span class="head_txt">${heading}
							<div class="title">${headerName}</div></span><span class="heading_icon">
							<span class="head_icon"> <i class="ace-icon fa fa-phone bigger-150"></i></span></span>
					</h1>
				</div>
				<div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
				<input type = hidden id="hitCount" value="0">
</header>
  

<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>

</section>
</div>
</body> 
</html>