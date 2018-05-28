<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>
.view_back {
	background-repeat: no-repeat;
	color: #FFFFFF;
	font-family: "allerregular";
	font-size: 14px;
	font-weight: normal;
	padding-left: 25px;
	padding-bottom: 3px;
}

.backButton {
	background: none repeat scroll 0 0 #3A3A3A;
	border: 1px solid #952754;
	border-radius: 13px;
	box-shadow: 1px 1px 4px #000000;
	display: inline-block;
	height: 23px;
	line-height: 10px;
	margin: 4px 41px 0px 190px;
	padding: 8px 0 0 11px;
	width: 90px;
	float: right;
}
</style>
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<%-- <%
	UserSession user = (UserSession) request.getSession().getAttribute(
			"userSession");
	String theme = PartnerProfileController.getThemePath(user);
%> --%>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon" href="${_cdn}/assets/images/common-images/favicon.ico" />

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/basic.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/jquery-ui.css" /> 
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/custom.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/main.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/responsive.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/custom.css" />

<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" /> 
<link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />  --%>
 
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" /> --%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" /> --%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" /> --%>

<%-- <link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/custom.css" />
<link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" /> --%>

<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-filestyle.css" /> --%>
<%-- <link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" /> --%>
<%-- <link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/listbox.css" /> --%>



<%-- <%
	if (theme != null) {
%>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%
	}
%> --%>

<script src="${_cdn}/assets/js/common-js/plugin/jquery-1.11.0.min.js"></script> 
<script src="${_cdn}/assets/js/common-js/plugin/jquery-ui.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/toggles.js"></script>
<script src="${_cdn}/assets/js/common-js/my_account_submenu.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.slimscroll.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/selectboxit.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/perfect-scrollbar.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.mousewheel.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.autosize.input.js"></script>
<script src="${_cdn}/assets/js/common-js/common/common.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.validate.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/additional-methods.js"></script>
<script src="${_cdn}/assets/js/common-js/common_modal.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.form.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.placeholder.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.mousewheel.js"></script>
<script src="${_cdn}/assets/js/common-js/jquery_ui_range_slider.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/listbox.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.slimscroll.js"></script>


<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/common/common.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.placeholder.js"></script> --%>

<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/listbox.js"></script> --%>
<%-- <script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script> --%>


<%-- <script src="${pageContext.request.contextPath}/resources/js/sorting/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sorting/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script> --%>


<style>
#confirmDialog {
	display: block;
	height: 130px;
	display: none;
	width: 355px;
	box-shadow: 0 0 15px 1px #757575;
}
#confirmDialogForAutoPlan{
	display: block;
	height: 130px;
	display: none;
	width: 355px;
	box-shadow: 0 0 15px 1px #757575;
}
</style>
<script type="text/javascript">
var panCardCnt=0;
$(document).ready(function() {
	
	$("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});
	
	
    $("#invalidAgeDialog").dialog();
    $(document).on("dialogopen", "#invalidAgeDialog", function(event, ui) {
		setTimeout("$('#invalidAgeDialog').dialog('close')",3000);
	});
    
    $("#invalidDateDialog").dialog();
    $(document).on("dialogopen", "#invalidDateDialog", function(event, ui) {
		setTimeout("$('#invalidDateDialog').dialog('close')",3000);
	});
    
    $("#invalidAction").dialog();
    $(document).on("dialogopen", "#invalidAction", function(event, ui) {
		setTimeout("$('#invalidAction').dialog('close')",3000);
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
	
	// allow only alfa key typping
	$('.Alfa').on('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if ((charCode >= 65 && charCode <= 90) || (charCode >= 95 && charCode <= 122) || charCode==32)
	    	return true;
	    return false;
	});
	
	// allow only numeric key and . typping
	$('.Number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
	$('.Number1').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) 
	        return false;
	    return true;
	});
	
});

function uploadDocument(partyId,url){
	var finalUrl = "?partyId="+partyId+"&url="+url;
	window.location.replace('${pageContext.request.contextPath}/partner/addDocument'+finalUrl);
}

function uploadNote(partyId,url){
	var finalUrl = "?partyId="+partyId+"&url="+url;
	window.location.replace('${pageContext.request.contextPath}/partner/getPlanIdForNotes'+finalUrl);
}

function invalidAgeMessage()
{
	$("#invalidAgeDialog").html("Please Enter Valid Birth Date");
	$( "#invalidAgeDialog").dialog( "open" );
}

function invalidDateMessage()
{
	$("#invalidDateDialog").html("Please Enter End Date Greater Than Start Date");
	$( "#invalidDateDialog").dialog( "open" );
}

function invalidActionMessage(message)
{
	$("#invalidAgeDialog").html(message);
	$( "#invalidAgeDialog").dialog( "open" );
}

function lessDateMessage()
{
	$("#invalidDateDialog").html("Please Enter Maturity Date Greater Than Commencement Date");
	$( "#invalidDateDialog").dialog( "open" );
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

function calculateDate(){
	var eDate=document.getElementById("endDate");
	var sDate=document.getElementById("startDate");
	var dp1=eDate.value.split("/").reverse().join("/");
	var dp2=sDate.value.split("/").reverse().join("/");
	var d1=new Date(dp1);
	var d2=new Date(dp2);
	
	var msDateA = Date.UTC(d1.getFullYear(), d1.getMonth()+1, d1.getDate());
    var msDateB = Date.UTC(d2.getFullYear(), d2.getMonth()+1, d2.getDate());
	
    if (parseFloat(msDateA) < parseFloat(msDateB)){
    	invalidDateMessage();
    	$("#endDate").val("");
    }else if (parseFloat(msDateA) == parseFloat(msDateB)){
    	  invalidDateMessage();
  		  $("#endDate").val("");
    }
    return false;
}

function compareDate(){
	var eDate=document.getElementById("maturityDate");
	var sDate=document.getElementById("investmentDate");
	var dp1=eDate.value.split("/").reverse().join("/");
	var dp2=sDate.value.split("/").reverse().join("/");
	var d1=new Date(dp1);
	var d2=new Date(dp2);
	
	var msDateA = Date.UTC(d1.getFullYear(), d1.getMonth()+1, d1.getDate());
    var msDateB = Date.UTC(d2.getFullYear(), d2.getMonth()+1, d2.getDate());
	
    if (parseFloat(msDateA) < parseFloat(msDateB)){
    	lessDateMessage();
    	$("#maturityDate").val("");
    }else if (parseFloat(msDateA) == parseFloat(msDateB)){
    	lessDateMessage();
  		  $("#maturityDate").val("");
    }
    return false;
}

function compareDate1(){
	var eDate=document.getElementById("maturityDateRD");
	var sDate=document.getElementById("investmentDateRD");
	var dp1=eDate.value.split("/").reverse().join("/");
	var dp2=sDate.value.split("/").reverse().join("/");
	var d1=new Date(dp1);
	var d2=new Date(dp2);
	
	var msDateA = Date.UTC(d1.getFullYear(), d1.getMonth()+1, d1.getDate());
    var msDateB = Date.UTC(d2.getFullYear(), d2.getMonth()+1, d2.getDate());
	
    if (parseFloat(msDateA) < parseFloat(msDateB)){
    	lessDateMessage();
    	$("#maturityDateRD").val("");
    }else if (parseFloat(msDateA) == parseFloat(msDateB)){
    	lessDateMessage();
  		  $("#investmentDateRD").val("");
    }
    return false;
}

function calculateAge1(){
	var bDate=document.getElementById("dob"); 
	var dp1=bDate.value.split("/").reverse().join("/");
	var d1=new Date(dp1);
	var d2=new Date();
    var t1 = d1.getTime();
    var t2=d2.getTime();
	var age=parseInt((t2-t1)/(24*3600*1000));
	age=age/365;
	if(age<18 || age>100){
		invalidAgeMessage();
		$("#dob").val("");
		return false;
	}
	return true;
}
	function validatePAN(id){
		var value = $('#'+id).val();
		if( value !="" ){
			if(!(/^[A-Za-z]{5}\d{4}[A-Za-z]{1}$/.test(value)))
			{
				$('#'+id).val("");
				$("#successDialog").html("Please enter valid PAN.");
				$( "#successDialog").dialog( "open" );
			}else {
				$("#frmParterProfile").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getValidPanNo",
					type : "GET",
					data : {'panNo' : $("#"+id).val()},
					 success: function(msg){
						 if( msg == 'error' ){
							 $("#successDialog").html("Pan Number Already Exists.");
							 $( "#successDialog").dialog( "open" );
							 $('#'+id).val("");
						 }
					 }
				});
			}
		}
		panCardCnt++;
	}
	
	function doConfirm(url){
		$(".overlay").fadeIn("slow");
		$("#confirmDialog").fadeIn("slow");	
		$("#returnUrl").val(url);
	}	
	function doAction(){
		var url = $("#returnUrl").val();
		window.location.href = url;
		$("#confirmDialog").fadeOut("slow");
		$(".overlay").fadeOut("slow");
		
	}
	function closeDialog(){
		$("#urlLink").val("");
		$("#confirmDialog").fadeOut("slow");
		$(".overlay").fadeOut("slow");
	}
	
	$(function() {
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();
      });
	
	function doSubmitOnNext() {
		$("#nextPageUrl").val('${nextPageUrl}');
		getData();
		$("#inputData").val(inputData);
		$("#frmEmergencyReadiness").submit();
	}
	
	function doActionForAutoPlanDialog(actionFlag)
	{
		if(actionFlag == 'yes')
		{
			$("#confirmDialogForAutoPlan").fadeOut("slow");
			$("#successDialog").html("Please mearge clients and then generate report.");
			$( "#successDialog").dialog( "open" );
			$(".overlay").fadeOut("slow");
			generateActionPlan(false);
		}else if(actionFlag == 'no')
		{
			$("#confirmDialogForAutoPlan").fadeOut("slow");
			$(".overlay").fadeOut("slow");
			generateActionPlan(true);
		}
	}
	function closeDialogForAutoPlan()
	{
		$("#confirmDialogForAutoPlan").fadeOut("slow");
		$(".overlay").fadeOut("slow");
		generateActionPlan(false);
	}
	
</script>
<!--[if gte IE 9]>
  <style type="text/css">
.partner_dashboard_submenu,.combined_submenu,.common_btn,.common_dialog_box .ui-state-default,.common_btn:active,.common_dialog_box .ui-state-default:active,.logout_pop_up .myaccount_btn,.logout_pop_up .myaccount_btn:active,.logout_pop_up .logout_btn,.logout_pop_up .logout_btn:active,.common_header .submenu {filter: none;}
  </style>
<![endif]-->
</head>
<body>

	
	
			
			
 		<div class="wrapper">
		<section class="main">
		
		
		<header class="common_header inner_header">
				<tiles:insertAttribute name="header" />
				
				
				
				
				<div class="page_header clearfix">
				
				
				<div class="col-md-9 col-xs-9">
					<div class="heading clearfix">
						

						
<div class="heading_icon">
						<div class="head_icon">
								<c:choose>
									<c:when test="${fn:containsIgnoreCase(iconId, 'RC')}">
										<!--Risk Cover -->
										<img
											src="${pageContext.request.contextPath}/resources/images/risk-cover-icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, 'SR')}">
										<!--Succession Readiness -->
										<img
											src="${pageContext.request.contextPath}/resources/images/succession_planning_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, 'FR')}">
										<!--Financial Readiness -->
										<img
											src="${pageContext.request.contextPath}/resources/images/financial_readiness.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, 'CF')}">
										<!--Cash Flow -->
										<img
											src="${pageContext.request.contextPath}/resources/images/cash-flow-header-icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, 'LS')}">
										<!--Loan Status -->
										<img
											src="${pageContext.request.contextPath}/resources/images/loans_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35001')}">
										<!--Education goal -->
										<%-- <img src="${pageContext.request.contextPath}/resources/images/education-goal-icon.png"
											width="35" height="37" alt="" /> --%>
											
											<i class="ace-icon fa fa-mortar-board bigger-150"></i>
									</c:when>

									<c:when test="${fn:containsIgnoreCase(iconId, '35012')}">
										<!-- business goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/business_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35003')}">
										<!--property goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/property_goal.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35004')}">
										<!--marriage goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/wedding_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35005')}">
										<!--travel goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/travel_n_vacation_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35006')}">
										<!--car goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/car_thumb.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35015')}">
										<!--retirement goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/retirement_planning_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35008')}">
										<!--special goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/special_goals_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:when test="${fn:containsIgnoreCase(iconId, '35013')}">
										<!--other goal -->
										<img
											src="${pageContext.request.contextPath}/resources/images/other_goal_icon.png"
											width="35" height="37" alt="" />
									</c:when>
									<c:otherwise>
										<%-- <img src="${pageContext.request.contextPath}/resources/images/<tiles:insertAttribute name="headerImage" ignore="true" />"
											width="35" height="37" alt="" /> --%>
										<i class="ace-icon fa <tiles:insertAttribute name="headerImage" ignore="true" /> bigger-150"></i>	
									</c:otherwise>
								</c:choose>

						</div></div>
						
						<div class="head_txt">	<tiles:insertAttribute name="pageHeader" ignore="true" />
							
							${headerName}</div>
							
							 <c:if
								test="${not empty riskProfile}">
								<div class="title" style="margin-left: 0px;">(${riskProfile})</div>
							</c:if>
						
						
						

					
					</div>
					
						</div>
					
					
					<div class="col-md-3 col-xs-3">
					
					<c:if test="${fn:containsIgnoreCase(flag, '1')}">
							<a
								href="${pageContext.request.contextPath}/common/gotoPartnalPortal"
								class="partner_profileLink"><span class="first">Switch
									To </span><span class="second"> Partner Portal</span></a>
							<%-- <a class="alert_bx" href="${pageContext.request.contextPath}/alert/showAlerts"><div class="alert_img queryLink">
									<div class="alert_not">${alerts}</div>
									<img src="${pageContext.request.contextPath}/resources/images/alert.gif" width="22" height="22" alt="">
								</div>
								<div class="alert_txt">Alerts</div></a>
							<a class="query_bx" href="${pageContext.request.contextPath}/query"><div class="query_img  queryLink">
									<img src="${pageContext.request.contextPath}/resources/images/query.png" width="" height="" alt=""> 
								</div>
								<div class="query-txt">Query</div></a>		--%>
						</c:if>
						<c:if test="${hierarchy eq 1 && userSession.headOfNode}">
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
						<span class="backButtonId"></span>
						
						 <%-- <span class="head_txt">
						
							<c:if test="${fn:containsIgnoreCase(flag, '2')}">
							<a href="#" class="add_docs_btn_back"><span	class="add_docs_btn_back_txt">Back</span></a>
						</c:if>
						</span> --%>
<!-- 						<a href="#" class="drop_menu"></a> -->
						</div>
					
				</div>
				
				
				
				
				<input type=hidden id="hitCount" value="0">
			</header>
		
		
				<div class="main-content">
				<div class="main-content-inner">
		
				
			
			
			
			
		
			<tiles:insertAttribute name="body" />
			<tiles:insertAttribute name="footer" />
			
			
			
			<%-- 	<div class="page-content">
			<tiles:insertAttribute name="body" />
			<tiles:insertAttribute name="footer" />
			
			</div> --%>
			
			
			</div>
			</div>
		</section>
		</div>
		
	<div id="invalidAgeDialog" class="common_dialog"
		style="text-align: center;"></div>
	<div id="invalidDateDialog" class="common_dialog"
		style="text-align: center;"></div>
	<div id="successDialog" class="common_dialog"
		style="text-align: center;"></div>
	<div id="invalidAction" class="common_dialog"
		style="text-align: center;"></div>
	<div id="confirmDialog" class="common_custom_modal_aa">
		<span class="close" onclick="closeDialog();">X</span>
		<div class="modal_content">
			<div class="aa_up" style="text-align: center;">Are you sure you
				want to delete record ?</div>
			<div class="aa_down" id="yes">
				<a style="cursor: pointer;" onclick="doAction();" class="aa_yes">Yes
				</a> <a style="cursor: pointer;" onclick="closeDialog();" class="aa_no">No</a>
			</div>
		</div>
	</div>
	<div id="confirmDialogForAutoPlan" class="common_custom_modal_aa">
		<span class="close" onclick="closeDialogForAutoPlan();">X</span>
		<div class="modal_content">
			<div class="aa_up" style="text-align: center;">Will you want to merge these Clients ?</div>
			<div class="aa_down" id="yes">
				<a style="cursor: pointer;" onclick="doActionForAutoPlanDialog('yes');" class="aa_yes">Yes
				</a> <a style="cursor: pointer;" onclick="doActionForAutoPlanDialog('no');" class="aa_no">No</a>
			</div>
		</div>
	</div>

	<input name="returnUrl" id="returnUrl" type="hidden" value="" />
</body>
</html>