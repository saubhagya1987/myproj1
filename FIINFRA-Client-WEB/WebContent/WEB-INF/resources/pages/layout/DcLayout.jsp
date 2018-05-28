<%@page import="in.fiinfra.profile.ctrl.ProfileController"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<% 
UserSession user = AuthHandler.getCurrentUser();
%>
<title>
<tiles:insertAttribute name="title" ignore="true" />
</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/selectboxlt.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/perfect-scrollbar.css" />

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/custom.css" />

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/responsive.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main-style.css"  type="text/css" />
<%-- <link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/reset.css"	type="text/css" /> --%>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/custom.css"	type="text/css" />

<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/diy/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
</style>
<%

String theme = ProfileController.getThemePath(user);

if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<script type="text/javascript">
$(document).ready(function() {
	
	// allow only numeric key and . typping
	$('.Number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
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
	    <spring:message code="${success}" var="success"/>
	    <c:if test="${fn:contains(success, '_')}">
	    <c:set var="success" value="${fn:replace(success, '_', goalName)}" />
	    <c:set var="success" value="${fn:toUpperCase(fn:substring(success, 0, 1))}${fn:substring(success, 1,fn:length(success))}" />
	    </c:if>
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {
				$("#successDialog").html("${success}");
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
	    <c:if test="${fn:contains(error, '_')}">
	    <c:set var="error" value="${fn:replace(error, '_', goalName)}" />
	    <c:set var="error" value="${fn:toUpperCase(fn:substring(error, 0, 1))}${fn:substring(error, 1,fn:length(error))}" />
	    </c:if>
	    <spring:message code="${error}" var="error"/>
	    <c:set var="error" value="${fn:replace(error, '_', goalName)}" />
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {
				$("#successDialog").html("${error}");
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

function uploadDocument(partyId,url){
	var finalUrl = "?partyId="+partyId+"&url="+url;
	window.location.replace('${pageContext.request.contextPath}/partner/addDocument'+finalUrl);
}

function invalidAgeMessage()
{
	$("#invalidAgeDialog").html("Please Enter Valid Birth Date");
	$( "#invalidAgeDialog").dialog( "open" );
}
function calculateAge(){
	var bDate=document.getElementById("birth_date3"); 
	var dp1=bDate.value.split("/").reverse().join("/");
	var d1=new Date(dp1);
	var d2=new Date();
    var t1 = d1.getTime();
    var t2=d2.getTime();
	var age=parseInt((t2-t1)/(24*3600*1000));
	age=age/365;
	if(age<18 || age>100){
		invalidAgeMessage();
		$("#birth_date3").val("");
		return false;
	}

}
	function validatePAN(){
		var value = $('#panNumber').val();
		if(!(/^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value)))
		{
			$("#successDialog").html("Please enter valid PAN.");
			$( "#successDialog").dialog( "open" );
		}
	}
</script>
<% String msg = (String) request.getAttribute("error");
   boolean error = false;
   if(StringUtils.isEmpty(msg)){
	   msg = (String) request.getAttribute("message");
   }else{
	   error = true;
   }
   if(StringUtils.isEmpty(msg)){
	   msg = (String) request.getAttribute("success");
   }
   String redirect =(String) request.getAttribute("redirect");
   if(!StringUtils.isEmpty(redirect)){
	   redirect = request.getContextPath()+redirect;
   }
   
   
%>
<script type="text/javascript">
function showConfirm(msg, callBack){
	
	$( "#confirmDialog1" ).html(msg);
	 $( "#confirmDialog1" ).dialog({
		 resizable: false,
		 height:'auto',
		 width:'auto',
		 dialogClass:'confirmDialog',
		 title:'Confirmation',
		 modal: true,
		 buttons: [ 
			 { 
				 text: "Yes", 
				 class: 'submit_btn',
			   	 click:	 function() {
		 			$( this ).dialog( "close" );
		 			callBack();
		 		}},
		 	 {
		 		text: "No",
		 		'class': "cancel_btn",
		 		click: function() {
		   				 $( this ).dialog( "close" );
		 			  }
		 	}
	  ]});
	 $( "#confirmDialog1" ).dialog('open');
$(".confirmDialog.ui-dialog .ui-widget-header .ui-icon").text("X");	
}


function showMessage(msg, error){
	
	$( "#msgDialog" ).html(msg);
	if(error){
		$("#msgDialog").addClass('error');
	}
	$( "#msgDialog" ).dialog('open');
	
}

var msg = "<%=msg%>";
$(document).ready(function() {

	$('#msgDialog').dialog({
	    autoOpen: false,
	   // show: "blind",
	    dialogClass:'default_dialog',
		width:'auto',
		height:'auto',
		minHeight: 80,
		title:" ",
	   // hide: "explode",
	  open: function(event, ui) {
	        setTimeout(function(){
	            $('#msgDialog').dialog('close');                
	        }, 2000);
	        $('.ui-widget-overlay').bind('click',function(){
                jQuery('#msgDialog').dialog('close');
            });
	    }
	 
	});
	 $(".default_dialog.ui-dialog .ui-widget-header .ui-icon").text("X");	
	
	     

	
	<%if (!StringUtils.isEmpty(msg)) {%>	
	   	showMessage(msg,<%=error%>);
	<%}%>
	
	
	
	<%if (!StringUtils.isEmpty(redirect)) {%>
	 $('#msgDialog').bind('dialogclose', function(event) {
		 window.location.href = "<%=redirect%>";
					});
	<%}%>
		});
		
		
	function doSubmitOnNext() {
		$("#nextPageUrl").val('${nextPageUrl}');
		getData();
		$("#inputData").val(inputData);
		$("#frmEmergencyReadiness").submit();
	}
		
		
	</script>


<!--[if gte IE 9]>
  <style type="text/css">
.partner_dashboard_submenu,.combined_submenu,.common_btn,.common_dialog_box .ui-state-default,.common_btn:active,.common_dialog_box .ui-state-default:active,.logout_pop_up .myaccount_btn,.logout_pop_up .myaccount_btn:active,.logout_pop_up .logout_btn,.logout_pop_up .logout_btn:active,.common_header .submenu {filter: none;}
  </style>
<![endif]-->
</head>
<div id="wrapper">
 <div id="msgDialog" class="common_dialog" style="text-align: center; display:none;"> </div>

 <div id="confirmDialog1" class="common_custom_modal_logout" > </div>
<header class="common_header inner_header">
<tiles:insertAttribute name="header"/>
</header>
 
	<div id="trapezoid-two" class="clearfix fr">
		
			<p>
				Welcome&nbsp;<span><%=user.getName()%></span>
			</p>
		</div>
			<% if(request.getAttribute("doNotShowHome") ==null){ %>
	<div id="home_diy" class="clearfix fr"><a href="${pageContext.request.contextPath}/profile/dashboard"><div class="home_icon_nav"></div><span>Home</span></a></div>
	<%}%>
		
	
	<%-- <div id="home" class="clearfix fr"><a href="${pageContext.request.contextPath}/profile/dashboard"><div class="home_icon_nav"></div><span>Home</span></a></div> --%>
			

   <div class="clr"></div>
   <div id="header-strip_parent">
      <div id="header-strip" class="fl">
  <%-- <jsp:include page="../menu.jsp"></jsp:include> --%>
     
  <h3 class="heading clearfix" ><a href="#" class="drop_menu"></a>
        	<span class="heading_icon"><span class="head_icon">
        	<img src="${pageContext.request.contextPath}/resources/images/<tiles:insertAttribute name="headerImage" ignore="true" />" width="35" height="37" alt="">
        	</span></span>
        	<span class="head_txt" style="margin-top:-4px;"><tiles:insertAttribute name="pageHeader" ignore="true" />&nbsp;&nbsp;</span>
        	
        </h3>
  </div>
  <div class="clr"></div>
</div>

  <!-- end of "header-strip" id -->
  
<!--   <div id="inner-shadow-strip"></div> -->
    
   
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
   
<div id="invalidAgeDialog" class="common_dialog" style="text-align: center;"> </div>
<div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
 </div>
</body>
</html>