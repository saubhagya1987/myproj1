
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.utility.GoalData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.profile.ctrl.ProfileController"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">

<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main-style.css"  type="text/css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/selectboxit.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" />

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/custom.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/responsive.css" />

<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
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
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script> 

<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>
<script type="text/javascript">
var oldValues = [];
var newValues = [];
</script>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
#goalConfirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
</style>
<%

UserSession user = (UserSession) AuthHandler.getCurrentUser();
  String theme = ProfileController.getThemePath(user);

if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<script type="text/javascript">

function showConfirm(msg, callBack){
	
	$( "#goalConfirmDialog" ).html(msg);
	 $( "#goalConfirmDialog" ).dialog({
		 resizable: false,
		 height:'auto',
		 width:'auto',
		 dialogClass:'confirmDialog1',
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
	 $( "#goalConfirmDialog" ).dialog('open'); 
	 
	
}

$(document).ready(function() {
    var $field = $("#goalName");
    var old_val = $field.val();
    $field.focus().val('').val(old_val);
    
    var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});

    $("li").addClass("rel");
    
    $("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});

    var hitCnt = $("#hitCount").val();
    if(hitCnt == '0') {
		<c:if test="${not empty success}">
		  $("#successDialog").html("${success}");
		  $( "#successDialog").dialog( "open" );
	  </c:if>
    }
    $("#hitCount").val('1');

    <c:if test="${not empty error}">
  	$("#successDialog").html("${error}");
  	$( "#successDialog").dialog( "open" );
  </c:if>
  
    
	// to make in active
	$(".k").addClass("inactiveLink");
	$(".cr").addClass("inactiveLink");
	
	// allow only numeric key typping
	$('.Number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode<48 || charCode>57))
	        return false;
	    return true;
	});
	
	// allow only numeric key and . typping
	$('.Number1').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
	
	$("#life_insurance_methods .help_btn").click(function(){
		$(".overlay").fadeIn("slow")
		$("#life_insurance_help").fadeIn("slow")
		$("#life_insurance_help").animate("slow").css("visibility","visible");
  });
   
   
	$("#life_insurance_help .close").click(function(){
		$(".overlay").fadeOut("slow");
		$ ("#life_insurance_help iframe").animate("slow").css("display","none");
		$("#life_insurance_help").animate("slow").css("visibility","hidden");
	});
	
});

function uploadDocument(partyId,url){
	var finalUrl = "?partyId="+partyId+"&url="+url;
	window.location.replace('${pageContext.request.contextPath}/partner/addDocument'+finalUrl);
}

function alertMessage()
{
	$("#dialog1").html("Enter Goal name");
	$( "#dialog1").dialog( "open" );
	$("#goalName").focus();	
}
function analysisAlert()
{
	$("#dialog1").html("Please save data before proceeding to Analysis");
	$( "#dialog1").dialog( "open" );
}
function dynamicMsg(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
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
<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
<div id="goalConfirmDialog" class="common_custom_modal_logout" style="display: none;"></div> 
<div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
<div class="wrapper">
<section class="main">
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
		
		<div class="clr"></div>
<div id="header-strip_parent">
<div id="header-strip" class="fl">
   <ul style="list-style-type: none;"><li class="input_txt_one fl">
   	<h3 class="heading clearfix" ><a href="#" class="drop_menu"></a>
        	<span class="heading_icon"><span class="head_icon">
        	<img src="${pageContext.request.contextPath}/resources/images/<tiles:insertAttribute name="headerImage" ignore="true" />" width="35" height="37" alt="">
        	</span></span>
        	<span class="head_txt" style="margin-top:-4px;"><tiles:insertAttribute name="pageHeader" ignore="true" />&nbsp;&nbsp;</span>
        	
        </h3></li><li class="input_txt_two fl" style="margin-top:-4px;">
        <div class="title desc_container">          
				<input id="goalName" name="goalName" type="text" class="car_description" value="" data-autosize-input='{ "space":0 }' />       
          </div></li></ul>
          
      <c:if test="${goalTypeId eq '35012' or goalTypeId eq '35006' or goalTypeId eq '35005' or goalTypeId eq '35004'
          		or goalTypeId eq '35003' or goalTypeId eq '35001' }">
	          <div id="life_insurance_methods">
	          	<span class="partner_profileLink">
	          		<div class="help_btn" style="font-size:16px;cursor:pointer; margin-top:9px;">Goal Hint</div>
	          	</span>
	          </div>
          </c:if>    
  </div>
  <div class="clr"></div>
  </div>
  
<!--   <div id="inner-shadow-strip"></div> -->
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>
</section>
</div>

<div id="life_insurance_help" class="common_custom_modal" style="width: 418px;height: 268px;margin-top: 189px;">
<h3 class="modal_heading clearfix">Goal Hint<span class="close">X</span></h3>
 <div class="modal_content"> 
<h3>${goalTypeString}</h3>
<c:choose>
	<c:when test="${goalTypeId eq '35012'}">
		<p>Include seed capital necessary. Also include running expenses of business till the time business becomes self-sustainable. If your regular income will be impacted because of this transition, include living expenses also for the time you think business will replace your current income.</p>
	</c:when>
	<c:when test="${goalTypeId eq '35006'}">
		<p>Consider cost of running, cost of maintenance etc. based on your usage, before choosing the right model. In the cost include 'on road' price including registration, insurance, accessories etc.</p>
	</c:when>
	<c:when test="${goalTypeId eq '35005'}">
		<p>Mention any big vacation which you plan that may involve costs more than you can normally handle. Include regular annual vacation as part of your regular annual expenditure in the cash flow sheet. Include travel, stay, food, activities, shopping and also cost of tipping service providers</p>
	</c:when>
	<c:when test="${goalTypeId eq '35004'}">
		<p>Apart from Venue, Food there are different family functions, purchase of cloths, Jewellery, Gifts for friends and relatives, accommodation for  guest/self, photograph, video etc.</p>
		<p>Please include all such expenses.</p>
	</c:when>
	<c:when test="${goalTypeId eq '35003'}">
		<p>Apart from purchase cost (land + construction / cost of apartment) include the cost of registration, brokerage, improvements, furnishing and also the cost of moving in</p>
	</c:when>
	<c:when test="${goalTypeId eq '35001'}">
		<p>Consider preparation cost, cost of tuition fees, travel costs, boarding and lodging costs, supplementary / internship costs and provide a bit for pocket money as well</p>
	</c:when>
</c:choose>
</div>
</div>

<% String goalId = (String) request.getAttribute("goalId"); 
   List<GoalData> goals = (List<GoalData>) request.getAttribute("foundGoal");
   StringBuilder goalStr = new StringBuilder();
   if(StringUtils.isEmpty(goalId) && goals != null && goals.size()>0){
	   String redirect = (String) request.getAttribute("existingGoalRedirect");
/* 	   for(GoalData g:goals){
		   if(goalStr.length()>0){
			   goalStr.append(" , ");
		   }
		   goalStr.append(g.getGoalName() + " - "+g.getGoalAmountPv());
	   }
 */	   
%>
<script type="text/javascript">
$(document).ready(function() {
	showConfirm('You have already defined Goal for this section. </br> ' +' Do you want to modify existing goal ?', function() {
			window.location.href="${pageContext.request.contextPath}/<%=redirect%>";
	});
});
</script>
<%} %>

<div id="confirmDialog" class="common_custom_modal_aa">
		  <span class="close" onclick="closeDialog();">X</span>
		  <div class="modal_content"> 
		    <div class="aa_up" style="text-align: center;">Data has changed, are you sure you want to exit?</div>
		    <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="doCancel();" class="aa_yes">Yes </a> 
		         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
		  </div>
  </div>
  <input name="returnUrl" id="returnUrl" type="hidden"  value=""/>
 <script type="text/javascript">
 var cntVal = 1;
 function doConfirm(url){
		$(".overlay").fadeIn("slow");
		$("#confirmDialog").fadeIn("slow");	
		$("#returnUrl").val(url);
	}	
	function doCancel(){
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
	
	function doValidate(formName,url)
	{
		 var x = document.getElementById(formName);
		 var flag = false;
		 createNewValueArray(formName);
	     for(var i=0; i<newValues.length; i++)
	     {
	    	 if(newValues[i]!=oldValues[i])
	    	 {
	    		 flag = true;
	    		 break;
	    	 }
	    	 if($("#hiddenGoalName").val()!=$("#goalName").val())
	    	 {
	    		 flag = true;
	    		 break;
	    	 }
	     }
	     if(flag)
	     {
	    	 doConfirm(url); 
	    	 flag = false;
	     }else
	     {
	      document.location = url;
	      flag = false;
	     }
	}
	
	function createOldValueArray(formName)
	{
		if(cntVal==1){
		var x = document.getElementById(formName);
        for (var i=0; i<x.length; i++) 
        {
           	if(typeof(x.elements[i]) != "undefined")
    	   	{
    	   		if(x.elements[i].type=="hidden")
    	   		{
    	   			oldValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="text")
    	   		{
    	   		oldValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="select-one")
    	   		{
    	   			oldValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="radio")
    	   		{
    	   			oldValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="checkbox")
    	   		{
    	   			oldValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="textarea")
    	   		{
    	   			oldValues[i] = x.elements[i].value;
    	   		}
    	    }
         }
        cntVal++;
		}
	}
	
	function createNewValueArray(formName)
	{
		var x = document.getElementById(formName);
        for (var i=0; i<x.length; i++) 
        {
           	if(typeof(x.elements[i]) != "undefined")
    	   	{
    	   		if(x.elements[i].type=="hidden")
    	   		{
    	   			newValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="text")
    	   		{
    	   		newValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="select-one")
    	   		{
    	   			newValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="radio")
    	   		{
    	   			newValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="checkbox")
    	   		{
    	   			newValues[i] = x.elements[i].value;
    	   		}
    	   		else if(x.elements[i].type=="textarea")
    	   		{
    	   			newValues[i] = x.elements[i].value;
    	   		}
    	    }
        }
	}
	
 </script>
 
</body> 
</html>