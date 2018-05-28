<%@page import="in.fiinfra.cp.common.util.BreadCrumbLink"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.profile.ctrl.ProfileController"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
request.setAttribute("_cdn", cdn);
%>
<meta name="mobile-web-app-capable" content="yes">


<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>


<!-- <style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
#msgDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }

</style> -->

<%

UserSession user = (UserSession) AuthHandler.getCurrentUser();
  String theme = ProfileController.getThemePath(user);

if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>

<!-- Start Google Analytics -->
<script> 
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ 
   (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), 
   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) 
   })(window,document,'script','//www.google-analytics.com/analytics.js','ga'); 

   ga('create', 'UA-48212643-2','auto');
   ga('send', 'pageview'); 
</script>
<!-- End Google Analytics -->


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<script>
google.load("visualization", "1", {packages:["corechart"]});
</script>




</head>
<body>
	<%
		String msg = (String) request.getAttribute("error");
		boolean error = false;
		if (StringUtils.isEmpty(msg)) {
			msg = (String) request.getAttribute("message");
		} else {
			error = true;
		}
		if (StringUtils.isEmpty(msg)) {
			msg = (String) request.getAttribute("success");
		}
		String redirect = (String) request.getAttribute("redirect");
		if (!StringUtils.isEmpty(redirect) && redirect.contains("sign-out")) {
			redirect = "/profile/dashboard/";
		}
		if (!StringUtils.isEmpty(redirect)) {
			redirect = request.getContextPath() + redirect;
		}
	%>


		



	<div id="msgDialog" class="common_dialog"
		style="text-align: center; display: none;"></div>

	<div id="confirmDialog" class="common_dialog" style="display: none;">
	</div>
				<tiles:insertAttribute name="header" />
			<div class="main-container" id="main-container">
             <tiles:useAttribute name="currentPage" scope="request" ignore ="true"/>  
		<script type="text/javascript">
    try{ace.settings.check('main-container' , 'fixed')}catch(e){}
   </script>
				<% 
				 List<BreadCrumbLink> links = (List<BreadCrumbLink>) session.getAttribute("currentBreadCrumb");
				 if(links != null && !links.isEmpty() ){
					 request.setAttribute("currentPage", links.iterator().next().getLabel());
				 }
					 
				%>
			<tiles:insertAttribute name="navigation_bar" ignore="true" />
		<div class="main-content">
			<div class="main-content-inner">
			 <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
        <ul class="breadcrumb">
              <li>
							<i class="fa fa-home home-icon"></i>
				<a href="${pageContext.request.contextPath}/profile/home">Home</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
              				<%for(BreadCrumbLink link:links){
					if(link.getLabel().equalsIgnoreCase("home")){
						continue;
					}
					if(link.isCurrentPage()){
				%>
				<li class="active"><%=link.getLabel()%></li>
				<%} else { %>
					<li>
							<a href="<%=link.getUrl()%>"><%=link.getLabel() %></a>
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
				<%} %>
			<%} %>
            </ul>
        <!-- /.breadcrumb --> 
				</div>
			<%-- <tiles:insertAttribute name="slide" ignore="true" /> --%>
			<div class="page-content">
			<tiles:insertAttribute name="body" />
			</div>
		</div>
     </div>
			<tiles:insertAttribute name="footer" />
</div>
		


			<script src="http://platform.twitter.com/widgets.js"></script>
	
	<script type="text/javascript">
function showConfirm(msg, callBack){
	
	$( "#confirmDialog" ).html(msg);
	 $( "#confirmDialog" ).dialog({
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
	 $( "#confirmDialog" ).dialog('open');
$(".confirmDialog.ui-dialog .ui-widget-header .ui-icon").text("X");	
}
var msg = "<%=msg%>";
var timeout;

function showMessage(msg, error){
	
	bootbox.dialog({
		title: 'Success',
	    message: msg, 
	    className:"fa fa-info  bigger-130 eastspace2",
	    buttons: {
	     "success" : {
	      "label" : "OK",
	      "className" : "btn-sm btn-primary"
	     }
	    }
	   });
	/* $( "#msgDialog" ).html(msg); */
	if(error){
		$("#msgDialog").addClass('error');
	}
	$( "#msgDialog" ).dialog('open');
	
}



$(document).ready(function() {

	jQuery("#msgDialog").dialog({
	    autoOpen: false,
	   // show: "blind",
	    dialogClass:'default_dialog',
		width:'auto',
		height:'auto',
		minHeight: 80,
		title:" ",
	   // hide: "explode",
	  open: function(event, ui) {
		  timeout =   setTimeout(function(){
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
	</script>		
	
	<script>	
function myConfirm(url){
    bootbox.confirm("Are you sure you want delete?", function(okay) {
        if(okay)
             location.href = url;
});	
    return false;
}
	 </script>	
</body>
</html>
