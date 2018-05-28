<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
request.setAttribute("_cdn", cdn);
%>

<style>
.my_profile_links li.fifth { display:none ; }
</style>
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
<% UserSession user = (UserSession) request.getSession().getAttribute("userSession"); 
   String theme = PartnerProfileController.getThemePath(user);
%>

<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon" href="${_cdn}/assets/images/common-images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/basic.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/selectboxlt.css"/>
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/custom.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/main.css" />

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/responsive.css" />
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<script src="${_cdn}/assets/js/common-js/plugin/jquery-1.11.0.min.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery-ui.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/toggles.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/my_account_submenu.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.slimscroll.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/selectboxit.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/perfect-scrollbar.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.mousewheel.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.autosize.input.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/common.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.validate.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/additional-methods.js"></script> 
<script src="${_cdn}/assets/js/common-js/plugin/common_modal.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.placeholder.js"></script>
<style>
/* #confirmDialog {
display: block;
height: 130px;
display: none;
width: 355px;
box-shadow: 0 0 15px 1px #757575;
} */ 
</style>


<script>

var success = '${success}';
var error = '${error}';

$(document).ready(function() {
	
	$("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});
	
	
    $("#invalidAgeDialog").dialog();
    $(document).on("dialogopen", "#invalidAgeDialog", function(event, ui) {
		setTimeout("$('#invalidAgeDialog').dialog('close')",3000);
	});

    <c:if test="${not empty success}">
    <c:choose>
	    <c:when test="${fn:contains(success, 'success.')}">
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {
				$("#successDialog").html("<spring:message code="${success}" />");
				$( "#successDialog").dialog( "open" );
				$("#hitCount").val("1");
			}
		</c:when>
		<c:otherwise>
		var hitCnt = $("#hitCount").val();
		if(hitCnt == '0') {
			$("#successDialog").html("${success}");
			$( "#successDialog").dialog( "open" );
			$("#hitCount").val("1");
		}
		</c:otherwise>
	</c:choose>
	</c:if>
	 
	
	<c:if test="${not empty error}">
    <c:choose>
	    <c:when test="${fn:contains(error, 'error.')}">
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {
				$("#successDialog").html("<spring:message code="${error}" />");
				$( "#successDialog").dialog( "open" );
				$("#hitCount").val("1");
			}
		</c:when>
		<c:otherwise>
		var hitCnt = $("#hitCount").val();
		if(hitCnt == '0') {
			$("#successDialog").html("${error}");
			$( "#successDialog").dialog( "open" );
			$("#hitCount").val("1");
		}
		</c:otherwise>
	</c:choose>
	</c:if>
    
});

function validatePAN(){
	var value = $('#panNumber').val();
	if( value !="" ){
		if(!(/^[A-Za-z]{5}\d{4}[A-Za-z]{1}$/.test(value)))
		{
			$('#panNumber').val("");
			$("#successDialog").html("Please enter valid PAN.");
			$( "#successDialog").dialog( "open" );
		}
	}
}
</script>
<!--[if gte IE 9]>
  <style type="text/css">
.partner_dashboard_submenu,.combined_submenu,.common_btn,.common_dialog_box .ui-state-default,.common_btn:active,.common_dialog_box .ui-state-default:active,.logout_pop_up .myaccount_btn,.logout_pop_up .myaccount_btn:active,.logout_pop_up .logout_btn,.logout_pop_up .logout_btn:active {filter: none;}
  </style>
<![endif]-->
</head>
<body>
<input type = hidden id="hitCount" value="0">

<div class="wrapper">
<section class="main">
<header class="common_header inner_header">
<tiles:insertAttribute name="header"/>
				<div class="page_header">
					<h1 class="heading clearfix">
						<!-- <a href="#" class="drop_menu"></a> --><span class="head_txt"> <tiles:insertAttribute
								name="title" /></span> <span class="heading_icon"><span
							class="head_icon"> <img
								src="${pageContext.request.contextPath}/resources/images/<tiles:insertAttribute name="headerImage" ignore="true" />"
								width="35" height="37" alt="">
						</span></span>

						<c:if test="${hierarchy eq 1 && userSession.headOfNode }">
							<div class="hierarchy-submenu-main-bx">
								<img class="hierarchy-submenu-btn"
									src="${_cdn}/assets/images/common-images/hie-dropdown.png"
									width="37" height="29" alt="">
								<div class="hierarchy-submenu-bx" style="display: none;">
									<div class="hierarchy-submenu-bx-in">
										<div id="jstree1"></div>
									</div>
								</div>
							</div>
						</c:if>
						<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
						id="ace-settings-btn">
						<i class="ace-icon fa fa-cog bigger-130"></i>
					</div>
					<div class="ace-settings-box clearfix" id="ace-settings-box">
						<div class="pull-left width-50">
					<jsp:include page="submenu_small.jsp"></jsp:include> 
						</div>
						<!-- /.pull-left -->
					</div>
					<!-- /.ace-settings-box -->
				</div>		
				
					</h1>

		</div>
			


			</header>
<!-- Header Ends-->
</section>
    <section class="content common_content">

<%-- <tiles:insertAttribute name="pageHeader"/> --%>

<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>
</section>
</div>
<!-- <div id="invalidAgeDialog" class="common_dialog" style="text-align: center;"> </div>
 <div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
 --> <div class="overlay"></div>
</body> 
</html>