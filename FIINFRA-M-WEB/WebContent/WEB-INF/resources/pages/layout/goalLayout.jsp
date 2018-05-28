<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.util.FiinfraConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
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
   Integer planTypeId = user.getPlanTypeId();
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
<script src="${_cdn}/assets/js/common-js/plugin/jquery.validate.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/additional-methods.js"></script>
<script src="${_cdn}/assets/js/common-js/common_modal.js"></script>



<script type="text/javascript">
var oldValues = [];
var newValues = [];
</script>
<script type="text/javascript">
$(document).ready(function() {
	
    var $field = $("#goalName");
    var old_val = $field.val();
    $field.focus().val('').val(old_val);
    
   /*  var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]); */
	/* $(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	}); */

    $("li").addClass("rel");
    
    $("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});

    var hitCnt = $("#hitCount").val();
    if(hitCnt == '0') {
		<c:if test="${not empty success}">
		  $("#successDialog").html("<spring:message code="${success}" />");
		  $( "#successDialog").dialog( "open" );
	  </c:if>
    }
    $("#hitCount").val('1');
	if('${foundGoal}' != '' && '${foundGoal}' != '0' ) {
    	showConfirm('${pageContext.request.contextPath}/futureFinancialDc/getMyGoals/${partyId}');
    }
    <c:if test="${not empty error}">
  	$("#successDialog").html("<spring:message code="${error}" />");
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
	
	/* // Start This Code is for rolebase security 
    var partnerSetupLinks = "${partnerSetupLinks}";
    var pieces = partnerSetupLinks.split(",");
    for(var i=0;i<pieces.length;i++){
     $("."+pieces[i]).attr("href","#");
     $("."+pieces[i]).addClass("inactiveLink");
    }
   // End This Code is for rolebase security */ 
	
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

function uploadNote(goalId,partyId,url){	
	window.location.replace('${pageContext.request.contextPath}/notes/note?refTypeId=111012&returnUrl='+url+'&refId='+goalId+'&partyId='+partyId);
}

function alertMessage()
{	$('#dialog1').modal('show');
	$("#goalName").focus();	
}
/* function analysisAlert()
{
	$("#dialog1").html("Please save data before proceeding to Analysis");
	$( "#dialog1").dialog( "open" );
} */
 function dynamicMsg(msg)
{
	$("#dialogLabel1").text(msg);
	$('#dialog1').modal('show');
	$("#goalName").focus();	
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
<div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
<div class="wrapper">
<section class="main">
<header class="common_header inner_header">
<tiles:insertAttribute name="header"/>
	<div class="page_header clearfix">
	<div class="">
	<div class="col-md-9 col-xs-9">
        <div class="heading clearfix"><!-- <a href="#" class="drop_menu"></a> -->
        
        <div class="heading_icon"><div class="head_icon">
        	<%-- <img src="${pageContext.request.contextPath}/resources/images/<tiles:insertAttribute name="headerImage" ignore="true" />" width="35" height="37" alt=""> --%>
        	<i class="ace-icon fa <tiles:insertAttribute name="headerImage" ignore="true" /> bigger-150"></i>
        	<!-- <i class="ace-icon fa fa-mortar-board bigger-150"></i> -->
        	</div>
        	
        	</div>
        	
        	<div class="head_txt"><tiles:insertAttribute name="pageHeader" ignore="true" /></div>
        	
        	 	<input id="goalName" name="goalName" type="text" class="car_description pull-left" value="" data-autosize-input='{ "space":0 }'/>
        	
        	 	
         <div class="title pull-left">${headerName}</div>
          
           </div>  </div>
          
          <div class="col-md-3 col-xs-3">
          
          <c:if test="${goalTypeId eq '35012' or goalTypeId eq '35006' or goalTypeId eq '35005' or goalTypeId eq '35004'
          		or goalTypeId eq '35003' or goalTypeId eq '35001' }">
	          <div id="life_insurance_methods">
	          	<span class="partner_profileLink">
	          		<div class="help_btn" style="font-size: 12px;cursor:pointer;">Goal Hint</div>
	          	</span>
	          </div>
          </c:if>
         
        <% if(planTypeId == 522002) { %>        
       <c:choose>
        <c:when test="${goalId ne '' and goalId ne null and goalId ne '0'}">           
        <a href="${pageContext.request.contextPath}/assets/assetAllocatedToGoal/${partyId}" class="partner_profileLink"><span class="first">Allocate asset</span><span class="second"> to Goal</span></a>             
        </c:when>
        <c:otherwise>          
        <div href="#" class="partner_profileLink"><span class="first inactiveLink">Allocate asset</span><span class="second inactiveLink"> to Goal</span></div>       
        </c:otherwise>
       </c:choose>
       <%} %>	     	
        	
       
       
      
      <!--  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#test" aria-expanded="false" aria-controls="test">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button> -->
            
         				
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#testaditya">
					<!-- <span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span> -->
					<i class="ace-icon fa fa-navicon bigger-240"></i>
				</button>
            
            
            
             <div class="ace-settings-container" id="ace-settings-container">
									<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
										id="ace-settings-btn">
										<i class="ace-icon fa fa-cog bigger-130"></i>
									</div>
									<div class="ace-settings-box clearfix" id="ace-settings-box">
										<div class="pull-left width-50">
											<jsp:include page="dc_submenu.jsp"></jsp:include>	
										</div>
										<!-- /.pull-left -->
									</div>
									<!-- /.ace-settings-box -->
								</div>
         
            
            
           <!--   <div id="test" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>
              <li><a href="../navbar-static-top/">Static top</a></li>
              <li><a href="../navbar-fixed-top/">Fixed top</a></li>
            </ul>
          </div> -->
          
          
          
              </div>
              </div>
                </div>
        
       
            
              <div id="testaditya" class="sample responsive" > <ul class="sam sam-list" style="top: 0px;">
              
              <li class=""><a href="index.html"><span class="menu-text"> Allocate Asset to Goal</span></a></li>
              <li class=""><a href="index.html"><span class="menu-text"> Goal Hint</span></a></li>

</ul> </div>
            
           
            
              <!--  <div id="testaditya" class="sidebar responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<ul class="nav nav-list">
					<li class="active">
						<a href="index.html">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Allocate Asset to Goal </span>
						</a>

						<b class="arrow"></b>
					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								Goal Hint
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						
					</li>


				</ul>


	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				
			
			

			
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div> -->
	
</header>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>
</section>
</div>
<div id="life_insurance_help" class="common_custom_modal" style="width: 418px;height: 268px;margin-top: 189px;">
<h3 class="modal_heading clearfix">Goal Hint <span class="close">X</span></h3>
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

<!-- <style>
 #confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
#confirmDialog1 { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; } 
 </style> -->
 

  <div class="modal fade" id="confirmDialog" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
       <div class="modal-content">
            <div class="modal-body">
                <label>Data has changed, are you sure you want to exit?</label>
             </div>
            <div class="modal-footer">
             <button onclick="doCancel();" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check bigger-110"></i>Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-sm btn-danger"><i class="ace-icon fa fa-close bigger-110"></i>No</button>
		             </div>
    </div>
  </div>
</div> 

 <div class="modal fade" id="dialog1" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
       <div class="modal-content">
            <div class="modal-body" id="dialogLabel1">
                <label >You haven't changed any data yet.Please make some changes and then save.</label>
             </div>
            <div class="modal-footer">             
  		       <button onclick="closeDialog();" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check bigger-110"></i>OK</button>
		             </div>
    </div>
  </div>
</div> 

  
  
<div class="modal fade" id="confirmDialog1" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
       <div class="modal-content">
            <div class="modal-body">
                <label> You already have ${foundGoal} ${goalTypeString}/s defined. Do you want to modify existing goal ?</label>
             </div>
            <div class="modal-footer">
             <button onclick="doCancel();" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check bigger-110"></i>Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-sm btn-danger"><i class="ace-icon fa fa-close bigger-110"></i>No</button>
		             </div>
    </div>
  </div>
</div>

<!-- <div aria-hidden="true" aria-labelledby="basicModal" role="dialog" tabindex="-1" id="basicModal" class="modal fade" style="display: none;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
            <h4 id="myModalLabel" class="modal-title">Basic Modal</h4>
          </div>
          <div class="modal-body">
            <h3>Modal Body</h3>
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
            <button class="btn btn-primary" type="button">Save changes</button>
          </div>
        </div>
      </div>
    </div>
   -->
  
  
  <input name="returnUrl" id="returnUrl" type="hidden"  value=""/>
 <script type="text/javascript">
 function doConfirm(url){
		//$(".overlay").fadeIn("slow");
		$('#confirmDialog').modal('show');
		//$("#confirmDialog").fadeIn("slow");	
		$("#returnUrl").val(url);
	}	
	function showConfirm(url){
	//	$(".overlay").fadeIn("slow");
		$('#confirmDialog1').modal('show');
		//$("#confirmDialog1").fadeIn("slow");	
		$("#returnUrl").val(url);
	}
	function doCancel(){
		var url = $("#returnUrl").val();
		window.location.href = url;
		$('#confirmDialog').modal('hide');
		//$("#confirmDialog").fadeOut("slow");
		
		$('#confirmDialog1').modal('hide');
		//$("#confirmDialog1").fadeOut("slow");
	//	$(".overlay").fadeOut("slow");
		
	}
	function closeDialog(){
		$("#urlLink").val("");
		$("#confirmDialog").fadeOut("slow");
		$("#confirmDialog1").fadeOut("slow");
		$("#dialog1").fadeOut("slow");
	//	$(".overlay").fadeOut("slow");
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
    	   			oldValues[i] = x.elements[i].checked;
    	   		}
    	   		else if(x.elements[i].type=="textarea")
    	   		{
    	   			oldValues[i] = x.elements[i].value;
    	   		}
    	    }
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
    	   			newValues[i] = x.elements[i].checked;
    	   		}
    	   		else if(x.elements[i].type=="textarea")
    	   		{
    	   			newValues[i] = x.elements[i].value;
    	   		}
    	    }
        }
	}
	
	var amountUnit="lacs";
	function doAction(unit)
	{
		amountUnit = unit;
		$(".dynamic").html(unit);
	}
 </script>
 
<!--  <script type="text/javascript">
 function doConfirm(url){
		$(".overlay").fadeIn("slow");
		$("#confirmDialog").fadeIn("slow");	
		$("#returnUrl").val(url);
	}	
	function showConfirm(url){
		$(".overlay").fadeIn("slow");
		$("#confirmDialog1").fadeIn("slow");	
		$("#returnUrl").val(url);
	}
	function doCancel(){
		var url = $("#returnUrl").val();
		window.location.href = url;
		$("#confirmDialog").fadeOut("slow");
		$("#confirmDialog1").fadeOut("slow");
		$(".overlay").fadeOut("slow");
		
	}
	function closeDialog(){
		$("#urlLink").val("");
		$("#confirmDialog").fadeOut("slow");
		$("#confirmDialog1").fadeOut("slow");
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
	
	var amountUnit="lacs";
	function doAction(unit)
	{
		amountUnit = unit;
		$(".dynamic").html(unit);
	}
 </script> -->
</body> 
</html>