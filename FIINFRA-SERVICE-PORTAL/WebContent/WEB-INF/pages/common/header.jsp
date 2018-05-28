<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
 //request.setAttribute("_cdn", cdn);
   request.setAttribute("_cdn", request.getContextPath().subSequence(0, request.getContextPath().lastIndexOf("/"))+"/FIINFRA-Welcome/resources");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="1230">
<style>body .white{color:inherit !important;}</style>
<script src="${_cdn}/assets/js/jquery.js"></script>


<script type="text/javascript">
 
 


$(function() {
	

	activateSecurity();
	
	
});  

function activateSecurity(){
	 // alert('hi...'); 
	var controllIds=$('#idList').val().split(',');
	//alert('in role access :'+controllIds);   
	$(controllIds).each(function(i,obj){
		if(this.replace("[", "").replace("]", "")!='')
			$('[id="'+this.replace("[", "").replace("]", "")+'"]').remove();
	});
}  
  



function viewContacts(){
	
	
	
	$.ajax({
		type : 'GET',	
 		url : $('#contextPath').val()+"/common/getContactUsRecord.htm",
		
		success : function(result){
			
			var CallUs='';
			var WriteUs='';
			var BUName='';
			var BUAddr='';
			var BUAddr2='';
			var BUAddr3='';
			var BUCity='';
			var BUPostalCode='';
			var twitter='';
			$(result).each(
					function(i, obj) {		
			CallUs=obj.callUs; 
			WriteUs=obj.writeUs;
			twitter=obj.twitter;
			$('#writeUs').html($("<a>").attr("href", "mailto:" + WriteUs).text(WriteUs));
			$('#twitter').html($("<a>").attr("href", "twitter.com/" + twitter).text(twitter));
			BUName=obj.buname;
  			BUAddr=obj.buaddr;
			BUAddr2=obj.buaddr2;
  			BUAddr3=obj.buaddr3;
  			BUCity=obj.bucity;  			
  			BUPostalCode=obj.bupostalCode;  			
  			
  			
		});
			$('#callUs').html(CallUs);
			$('#writeUs').html(WriteUs);			
			$('#writeUs').html($("<a>").attr("href", "mailto:" + WriteUs).text(WriteUs));
			$('#twitter').html(twitter);			
		//	$('#twitter').html($("<a>").attr("target", "_blank"));
			$('#twitter').html($("<a target='_blank'>").attr("href", "https://twitter.com/" + twitter).text(twitter));
			//$('#twitter').html($("<a>").attr("target", "_blank"));
			
			
			//<a target="_blank" href="http://your_url_here.html">Link</a>
			
				  //var win = (url, '_blank');
				 
			
			
			
			$('#buName').html(BUName);
			$('#buAddress').html(BUAddr);
			$('#buAddress').append(BUAddr2);
			$('#buAddress').append(BUAddr3);
			$('#buAddress').append('<br>');
			$('#buAddress').append(BUCity);
			$('#buAddress').append(' ');
			$('#buAddress').append(BUPostalCode);
			
		}
	});
}


</script>
 
 <script type="text/javascript">
var $jq_1_9_1 = $;
var $jq_1_9_2 = $;
var $j = $;
</script>  
<title>header</title>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${_cdn}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/chosen.css" />

<link rel="stylesheet" href="${_cdn}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/ui.jqgrid.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fullcalendar.css" />

<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css" />

<link rel="stylesheet" href="${_cdn}/assets/css/ace-fonts.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="${_cdn}/assets/css/ui-custom.css"/>
<link rel="stylesheet" href="${_cdn}/assets/css/custom.css"/>
<link rel="stylesheet" href="${_cdn}/assets/css/custom_responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jstree/themes/default/style.min.css">
            <script src="js/jstree/jstree.min.js"></script>

<script src=" ${_cdn}/assets/js/ace-extra.min.js"></script> 
 
 <style>
.jstree .icn { width: 20px; height: 20px; display: inline-block; background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat 0 0 transparent !important }
.jstree .icn.plus { background-position: -15px -20px !important }
.jstree .icn.area1 { background-position: -2px -3px !important }
.jstree .icn.user1 { background-position: -25px -3px !important }
.jstree .icn.star { background-position: -50px -3px !important }
.jstree-default .jstree-open > .jstree-ocl { background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat -3px -25px transparent !important}
.jstree-default .jstree-closed > .jstree-ocl { background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat -28px -25px transparent !important}
.jstree-default .jstree-clicked { background: none; border-radius: 0; box-shadow: none; color: #AE2760 }
ul.jstree-container-ul { /* background: #8F8F8F; overflow: hidden*/ }
li.jstree-open > ul { /*  background: #DADADA;*/ display: block; }
li.jstree-open > ul li.jstree-open > ul { /*background: #F2F2F2;*/ position: relative; left: -24px; padding-left: 24px; width: 100%; }
</style>

 <style type="text/css">
 #menu-wplook-main-menu li a.active {
     color:#3B84E5;
    /*  background: #585858;    */  
 }
   
   
   
#shadow_div_web_app {
	background-color: #000000;
	display: none;
	height: 100%;
	left: 0;
	opacity: 0.1;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 999999;
}
 </style>
         
</head>
<body class="no-skin" >
<input type="hidden" id="idList" value="${sessionScope.idList}"/>
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
		
		<div id="hierarchyDiv" class="hierarchy-submenu-main-bx modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Hierarchy</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body">
        <c:choose >
          <c:when test="${sessionScope.userSession.headOfNode==true}">
            <div class="" id="">
              <div  id="submenu5" class="hierarchy-submenu-bx" style="display:none;">
                <div class="hierarchy-submenu-bx-in">
                  <div id="jstree1" class="thumbnail"> </div>
                </div>
              </div>
            </div>
          </c:when>
        </c:choose>
      </div>
    </div>
  </div>
</div>
		
		
		
<!-- #section:basics/navbar.layout --> 
<div id="navbar" class="navbar navbar-default navbar-fixed-top"> 
      <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
      <div class="navbar-container" id="navbar-container"> 
    <!-- #section:basics/sidebar.mobile.toggle -->
    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar"> <span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    
    <!-- /section:basics/sidebar.mobile.toggle -->
    <div class="navbar-header pull-left"> 
          <!-- #section:basics/navbar.layout.brand -->
          <ul class="nav ace-nav">
      </ul>
           
     </div> 
    
    <!-- #section:basics/navbar.dropdown -->
    <div class="navbar-buttons navbar-header pull-right" role="navigation">
          <ul class="nav ace-nav">
          
          <li class="dark"> 
      	<strong id="headerLocateName" class="label label-sm arrowed arrowed-right">
        	<c:choose >
                        <c:when test="${sessionScope.locationName==''}"> ${sessionScope.name} </c:when>
                        <c:when test="${sessionScope.name==''}"> ${sessionScope.locationName} </c:when>
                        <c:otherwise> ${sessionScope.userSession.name} </c:otherwise>
                      </c:choose>
         </strong>
      	</li>
        	   	<!--Hierarchy Starts-->
          	
            <li class="dark-opague">
           <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <i class="ace-icon fa fa-sitemap"></i>
            <span class="txt">Hierarchy</span>
            </a>
            
            <!--     <li class="yellow">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="ace-icon fa fa-bolt" title="Quick links" alt="Quick links"></i> </a> -->
          <ul  id ="baji" class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
<!--             <li class="dropdown-header"> <i class="ace-icon fa fa-sitemap"></i>Hierarchy</li> -->
            <li class="dropdown-content">
              <ul  class="dropdown-menu dropdown-navbar">
                <li> <a  href="#" id="mainbutton" class="hierarchy-submenu-btn clearfix"> <i class="ace-icon fa fa-sitemap"></i> Hierarchy
                  <c:choose >
                    <c:when test="${sessionScope.userSession.headOfNode==true}"> <strong id="headerLocateName" class="label label-sm label-primary arrowed arrowed-right">
                      <c:choose >
                        <c:when test="${sessionScope.locationName==''}"> ${sessionScope.name} </c:when>
                        <c:when test="${sessionScope.name==''}"> ${sessionScope.locationName} </c:when>
                        <c:otherwise> ${sessionScope.userSession.name} </c:otherwise>
                      </c:choose>
                      </strong> </c:when>
                  </c:choose>
                  </a> 
                  </li>
                  
                     </ul>
            </li>
          </ul>
        </li>
         
         	   	<!--Hierarchy Ends-->
          	
           <li class="dark-opague" id="SPHomeChangeBizUnitLink">
           <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <i class="ace-icon fa fa-retweet"></i>
            <span class="txt">Change BU</span>
            </a>
	         <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
	          <li class="dropdown-header">
	          <i class="ace-icon fa fa-retweet"></i>
	           Allocated BizUnits
	          </li>
	          
	          <li class="dropdown-content" >
									<ul class="dropdown-menu dropdown-navbar navbar-grey" id="bizunitname">
								

									</ul>
								</li>
	          
	           <!-- <li class="dropdown-content">   <ul class="dropdown-menu dropdown-navbar navbar-pink" id="bizunitname">rrt</ul></li> -->
	           </ul>
         </li>
        <!--Quick Links Ends-->
        <li class="dark-opague" id="SPHomeContactLink">
           <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <i class="ace-icon fa fa-phone"></i>
            <span class="txt">Contact Us</span>
            </a>
            
            
       <!--  <li class="purple"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="ace-icon fa fa-phone icon-animated-vertical"></i> </a> -->
         
              <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
            <li class="dropdown-header"> <i class="ace-icon fa fa-phone"></i> Get in touch with us </li>
            <li class="dropdown-content">
                 <ul class="dropdown-menu dropdown-navbar navbar-grey">
                  
           
         <li>
			<a href="#" class="clearfix">
											<i class="btn btn-sm no-hover btn-info fa fa-phone msg-photo"></i>
												<!-- <i class="ace-icon fa fa-clock-o msg-photo"></i> -->
												<!-- <img src="../assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" /> -->
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Call Us</span>
														<!-- Call Us -->
													</span>

													<span class="msg-time">
														<!-- <i class="ace-icon fa fa-clock-o"></i> -->
														<span id="callUs"></span>
													</span>
												</span>
											</a>
										</li>
										
										
		 <li>
											<a href="#" class="clearfix">
											<i class="btn btn-sm no-hover btn-info fa fa-pencil msg-photo"></i>
												<!-- <i class="ace-icon fa fa-clock-o msg-photo"></i> -->
												<!-- <img src="../assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" /> -->
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Write to Us</span>
														<!-- Call Us -->
													</span>

													<span class="msg-time">
														<!-- <i class="ace-icon fa fa-clock-o"></i> -->
														 <span id="writeUs"></span>
														<!-- <span>dummyemail123456@gmailmmm.com</span> -->
													</span>
												</span>
											</a>
										</li>

											  <li> 
											<a href="#" class="clearfix">
											<i class="btn btn-sm no-hover btn-info fa fa-institution msg-photo"></i>
												<!-- <i class="ace-icon fa fa-clock-o msg-photo"></i> -->
												<!-- <img src="../assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" /> -->
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Shubhachintak</span>
														<!-- Call Us -->
													</span>         
 
													<span class="msg-time">
														<!-- <i class="ace-icon fa fa-clock-o"></i> -->
														 <span id="buAddress">Address:</span>
													</span> 
												</span>
											</a> 
											         
											                       
										</li>            
		 
							<li>
											<a href="#" class="clearfix">
											<i class="btn btn-sm no-hover btn-info fa fa-ticket msg-photo"></i>
												<!-- <i class="ace-icon fa fa-clock-o msg-photo"></i> -->
												<!-- <img src="../assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" /> -->
												<span class="msg-body">
													<span class="msg-title pull-left">
														<span class="blue">Log Trouble Ticket</span>
														<!-- Call Us -->
													</span>

													<span class="msg-time pull-right">
														<!-- <i class="ace-icon fa fa-clock-o"></i> -->
														 <span class="badge badge-info" >12</span>
													</span>
												</span>
											</a>
											
											                 
										</li>
										
										
										
				
											  <li>
											<a href="#" class="clearfix">
											<i class="btn btn-sm no-hover btn-info fa fa-twitter msg-photo"></i>
												<!-- <i class="ace-icon fa fa-clock-o msg-photo"></i> -->
												<!-- <img src="../assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" /> -->
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Twitter</span>
														<!-- Call Us -->
													</span>

													<span class="msg-time">
														<!-- <i class="ace-icon fa fa-clock-o"></i> -->
														 <span id="twitter"></span>
													</span>
												</span>
											</a>
											
											                 
										</li>										

              </ul>
                </li>
          
          </ul>
            </li>
            
            
              <li class="dark-opague">
           <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <i class="ace-icon fa fa-bolt"></i>
            <span class="txt">Quick Links</span>
            </a>
            
            <!--     <li class="yellow">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="ace-icon fa fa-bolt" title="Quick links" alt="Quick links"></i> </a> -->
          <ul  id ="baji" class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
            <li class="dropdown-header"> <i class="ace-icon fa fa-bolt"></i> Quick Links </li>
            <li class="dropdown-content">
              <ul  class="dropdown-menu dropdown-navbar">
               
                  
                <%--   <li id="SPHomeEmailClientLink"> <a href="<%=request.getContextPath()%>/common/getContactUsRecord.htm"  class="clearfix"> <i class="ace-icon fa fa-mail-forward"></i> <span class="txt">Email Client</span> </a> </li> --%>
                  <li id="SPHomeDownloadLink"><a href="<%=request.getContextPath()%>/downloads.htm"  class="clearfix"><i class="ace-icon fa fa-download"></i><span class="txt">Downloads</span> </a> </li>
                  <li id="SPHomeFAQLink"><a href="<%=request.getContextPath()%>/faq/loadFaqListsAdmin.htm" class="clearfix" ><i class="ace-icon fa fa-question"></i> <span class="txt">FAQ's</span> </a> </li>
        	<!-- <li> <a href="#" class="clearfix"> <i class="ace-icon fa fa-cloud-download"></i> <span class="txt">Downloads</span> </a> </li> -->
    		<!-- <li> <a href="#" class="clearfix"> <i class="ace-icon fa fa-question"></i> <span class="txt">FAQ's</span> </a> </li> -->
                  
               
              </ul>
            </li>
          </ul>
        </li>
            
        
        <!-- #section:basics/navbar.user_menu -->
        <li class="light-blue"> <a data-toggle="dropdown" href="#" class="dropdown-toggle"> <img class="nav-user-photo" src="${_cdn}/assets/avatars/user.jpg" alt="Jason's Photo" /> <span class="user-info"> <small>Welcome,</small> ${userSession.name} </span> <i class="ace-icon fa fa-caret-down"></i> </a>
              <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
           <!-- <li> <a href="#"> <i class="ace-icon fa fa-cog"></i> Settings </a> </li>-->
            <li id="SPProfileLink"> <a href="<%=request.getContextPath()%>/common/loaduserProlife.htm"> <i class="ace-icon fa fa-user"></i> Profile </a> </li>
            <li class="divider"></li>
            <li> <a href="<%=request.getContextPath()%>/common/logout.htm"> <i class="ace-icon fa fa-power-off"></i> Logout </a> </li>
          </ul>
            </li>
        
        <!-- /section:basics/navbar.user_menu -->
      </ul>
        </div>
    
    <!-- /section:basics/navbar.dropdown --> 
  </div>
      <!-- /.navbar-container --> 
    </div>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container"> 
<div id="shadow_div_web_app" style="display: block;z-index:9999999999;"></div>

		<div id="loading"  style="display: block;position: absolute;z-index:999999999999;left: 47%;top: 30%;"><i class="ace-icon fa fa-spinner fa-spin black" style="font-size: 500% !important;"></i>
<%-- <img src="<%=request.getContextPath()%>/images/loading15.gif" /> --%>

</div>
      <script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script> 
      
      <!-- #section:basics/sidebar -->
      <div id="sidebar" class="sidebar responsive compact sidebar-fixed sidebar-scroll"> 
    <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script> 
    
    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
                
    <!--<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse"> <i class="menu-icon" data-icon1="menu-icon" data-icon2="menu-icon"></i> </div>-->
    
    <!--fa-angle-double-left--> 
    <!-- /section:basics/sidebar.layout.minimize --> 
    
    <!-- /.sidebar-shortcuts -->
    
    <ul class="nav nav-list"  id="menu-wplook-main-menu" >     
					<li class="" id="menu-wplook-sub-menu1">          
						<a id="SPhomeLink" href="<%=request.getContextPath()%>/welcome/redirect.htm?task=no">
							<i class="menu-icon fa fa-home"></i>
							<span class="menu-text"> Home </span>
						</a>
     
						<b class="arrow"></b> 
					</li>
                     
                    <li class="" id="menu-wplook-sub-menu2">
						<a id="SPPartnerLink" href="<%=request.getContextPath()%>/partnersp/loadPartner.htm?buId=${sessionScope.userSession.buId}&userId=${sessionScope.userSession.userId}" onclick="submenu();">
							<i class="menu-icon fa fa-user"></i>
							<span class="menu-text"> Partner </span>
						</a>    

						<b class="arrow"></b>
					</li>
                      
                      <li id="SPRMLink">
						<a href="<%=request.getContextPath()%>/partnersp1/loadRMlist.htm?buId=${sessionScope.userSession.buId}" onclick="">
							<i class="menu-icon fa fa-user"></i>
							<span class="menu-text"> RM </span>
						</a>

						<b class="arrow"></b>
					</li>
                    
                <li class="" id="menu-wplook-sub-menu3">  
						<a id="SPOperationsLink"href="<%=request.getContextPath()%>/seret/getUploadHistory.htm" onclick="submenu();" class="dropdown-toggle">
						<i class="menu-icon fa fa-gear"></i>
							<span class="menu-text"> Operation </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
  
						<b class="arrow"></b>
 
						<ul class="submenu"  >
							<li id="SPRTAFileUploadLink" class="">
								<a href="<%=request.getContextPath()%>/seret/getUploadHistory.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									RTA File Upload
								</a>

								<b class="arrow"></b>
							</li>
 
							<!-- <li id="SPOpeMoniterPrePrintedFormLink" class=""> -->
							   	<li id="SPOpePrintFormMontLink" class="">    
								<a href="<%=request.getContextPath()%>/preprintedform/loadPrePrintedForm.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Moniter PrePrinted Form
								</a>

								<b class="arrow"></b>
							</li>


							
							<li id="SPOpeEmailSmsNotMontLink" class="" >
								<a href="<%=request.getContextPath()%>/loggedinuser/loadEmailSmslist.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Email/SMS Monitor
								</a>

								<b class="arrow"></b>
							</li>
							
							<li id="SPOpeMontLoggInUserLink" class="">
								<a href="<%=request.getContextPath()%>/loggedinuser/loadLoggedInUserList.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Monitor Logged In Users
								</a>

								<b class="arrow"></b>
							</li>

							
						</ul>
					</li>
				
					
                    
                    
                    
             <!--        <li class="">
						<a href="index.html">
							<i class="menu-icon fa fa-wechat"></i>
							<span class="menu-text"> Chat </span>
						</a>

						<b class="arrow"></b>
					</li> -->
               
					
                    <li class="" id="menu-wplook-sub-menu4">
						<a id="SPTasksLink" href="<%=request.getContextPath()%>/partnersp/getTaskList.htm">
							<i class="menu-icon fa fa-tasks"></i>
							<span class="menu-text"> Tasks </span>
						</a>

						<b class="arrow"></b>
					</li>
                    
                   <%--  <li class="">
						<a href="<%=request.getContextPath()%>/query/getQueryList.htm">
							<i class="menu-icon fa fa-question-circle"></i>
							<span class="menu-text"> Query </span>
						</a>

						<b class="arrow"></b>
					</li> --%>
					
					

					

					<li class="" id="menu-wplook-sub-menu5">
						<a id="SPReportsLink" href="<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm" onclick="submenu();" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> Report </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="">
								<a id="SPReportPortfolioLink" href="<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Portfolio
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a id="SPReportGoalLink" href="<%=request.getContextPath()%>/loadreportClientGoalSummary.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Goal
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a id="SPReportExecutionLink" href="<%=request.getContextPath()%>/loadreportExecutionTrackerList.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Execution
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a id="SPReportOpportunityLink" href="<%=request.getContextPath()%>/loadreportOpportunityTrakerList.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Opportunity
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a id="SPReportDataCollnLink"  href="<%=request.getContextPath()%>/loadreportDCTrackerList.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Data Collection
								</a>

								<b class="arrow"></b>
							</li>
                            
                            <li class="">
								<a id="SPReportPingLink" href="<%=request.getContextPath()%>/loadreportPingDelivery.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Ping
								</a>

								<b class="arrow"></b>
							</li>
                            
                            <li class="">
								 <a id="SPReportPartnerMISMenuLink" href="<%=request.getContextPath()%>/loadreportServiceTeamPartnerActivityDetails.htm"> 
									
									<i class="menu-icon fa fa-caret-right"></i>
									Partner MIS
								</a>

								<b class="arrow"></b>
							</li>
                            
                            <li class="">
								<a id="SPReportSecurityLink" href="<%=request.getContextPath()%>/loadreportSystemAccessHistory.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Security
								</a>

								<b class="arrow"></b>
							</li>
                            
                            <li class="">
								<a id="SPReportCRMLink" href="<%=request.getContextPath()%>/loadreportPartnerMIS.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									CRM
								</a>
  
								<b class="arrow"></b>
							</li>
                            
                            <li class="">
								<a id="SPReportMFBOSLink" href="<%=request.getContextPath()%>/loadreportFileUploadErrorSum.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									MFBOS
								</a>

								<b class="arrow"></b>
							</li>
                            
                            <li class="">
								<a id="SPReportViewSLink" href="<%=request.getContextPath()%>/loadPartnersInTrailPeriodReport.htm" >
									<i class="menu-icon fa fa-caret-right"></i>
									Subscription
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>

				
				
                    <li class="" id="menu-wplook-sub-menu6">
						<a id="SPCRMToolsLink"  href="<%=request.getContextPath()%>/broadcast/loadbroadcast.htm" onclick="submenu();" class="dropdown-toggle">
							<i class="menu-icon fa fa-paw"></i>
							<span class="menu-text"> CRMTools </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="" id="SPBroadcastLink">
								<a href="<%=request.getContextPath()%>/broadcast/loadbroadcast.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Broadcast
								</a>

								<b class="arrow"></b>
							</li>

							<li class="" id="SPDownloadLink">
								<a href="<%=request.getContextPath()%>/download/loaddownloadlist.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Download
								</a>

								<b class="arrow"></b>
							</li>

							<li class="" id="SPFaqLink">
								<a href="<%=request.getContextPath()%>/faq/loadFaqLists.htm" >
									<i class="menu-icon fa fa-caret-right"></i>
									FAQ
								</a>

								<b class="arrow"></b>
							</li>
								<li class="" id="SPTestimonialLink">
								<a href="<%=request.getContextPath()%>/testimonial/loadtestimonialsList.htm" >
									<i class="menu-icon fa fa-caret-right"></i>
									Testimonial
								</a>

								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>
				
					<!-- Header link for Biz Unit tab and sub menu start  -->
                    <li  id="SPBizUnitLink">
						<a href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm" onclick="submenu();" class="dropdown-toggle">
								<i class="menu-icon fa fa-dot-circle-o"></i>
							<span class="menu-text"> Biz Unit </span> 

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>  

						<ul class="submenu">
							<!-- <li class="" id="SPBizUnitLink1"> -->
							 <li class="" id="SPBizUnitLink"> 
								<a href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Biz Unit
								</a>

								<b class="arrow"></b>
							</li>

							<li class="" id="SPDepartmentLink">
								<a href="<%=request.getContextPath()%>/departmentlist/getDepartmentlist.htm?buId=${sessionScope.userSession.buId}">
									<i class="menu-icon fa fa-caret-right"></i>
									Department
								</a>

								<b class="arrow"></b>
							</li>

							<li class="" id="SPServiceTeamLink">
								<a href="<%=request.getContextPath()%>/teammember/loadteammember.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Service Team
								</a>

								<b class="arrow"></b>
							</li>

							
						</ul>
					</li>
					<!-- Header link for Biz Unit tab and sub menu end  -->
				

					<!-- Header link for Security tab and sub menu start  -->
					<li class="" id="menu-wplook-sub-menu8">
						<a id ="SPSecurityLink" href="<%=request.getContextPath()%>/user/loaduser.htm" onclick="submenu();" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> Security </span> 
							
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu" >
							<li class="" id="SPUserLink">
								<a href="<%=request.getContextPath()%>/user/loaduser.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									User
								</a>

								<b class="arrow"></b>
							</li>

							<li class="" id="SPRoleLink">
								<a href="<%=request.getContextPath()%>/rolelist/loadrole.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Role
								</a>

								<b class="arrow"></b>
							</li>
 
							<!-- <li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Security Reports
								</a>

								<b class="arrow"></b>
							</li> -->
						</ul>
					</li>
					<!-- Header link for Security tab and sub menu end  -->
					
					
					<li class="" id="menu-wplook-sub-menu9" > 
						<a id="SPMastersLink" href="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm" onclick="submenu();" class="dropdown-toggle">
							<i class="menu-icon fa fa-list-alt"></i>
							<span class="menu-text"> Masters </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu" >
							<%-- <li class="">
								<a href="<%=request.getContextPath()%>>/user/loaduser.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									User
								</a>

								<b class="arrow"></b>
							</li> --%>
							<li class="" id="SPNotifyTemplateLink"> 
								<a href="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Notify Template  
								</a>

								<b class="arrow"></b>
							</li>
							
							<li  class="" id="SPNotifyEventLink">   
								<a href="<%=request.getContextPath()%>/notifyevent/getEventlist.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Notify Event  
								</a>  

								<b class="arrow"></b>
							</li> 
							
							<li class=""  id="SPProductLink">
								<a href="<%=request.getContextPath()%>/product/loadproductlist.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Product  
								</a>

								<b class="arrow"></b>
							</li>
							
							<li class="" id="SPProductCategoryRevenueLink">
								<a href="<%=request.getContextPath()%>/product/category_revenue.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Product Category Revenue  
								</a>

								<b class="arrow"></b>
							</li>
							
							<li class="" id="SPProductManufacturerLink">
								<a href="<%=request.getContextPath()%>/product/product_manufacturer.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Product Mfgr  
								</a>
 
								<b class="arrow"></b>
							</li>
							
							<li class="" id="SPDCColletaralLink">
								<a href="<%=request.getContextPath()%>/dccolletral/loaddccolletralist.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									DC Colletaral 
								</a> 
 
								<b class="arrow"></b>
							</li>

							<%-- <li class="">
								<a href="<%=request.getContextPath()%>/rolelist/loadrole.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Role
								</a>

								<b class="arrow"></b>
							</li> --%>

							<!-- <li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Security Reports
								</a>  

								<b class="arrow"></b>
							</li> -->

							
						</ul>
					</li>
							

                     
                    <li class="" id="menu-wplook-sub-menu10">
						<a href="#" onclick="submenu();" class="dropdown-toggle">
							<i class="menu-icon fa fa-quote-right"></i>
							<span class="menu-text"> Pings </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="" id="SPPingsLink">
								<a href="<%=request.getContextPath()%>/ping/getPings.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									Pings
								</a>

								<b class="arrow"></b>
							</li>

							<li class="" id="SPAutoPingsLink">
								<a href="<%=request.getContextPath()%>/autoping/getAutoPings.htm">
									<i class="menu-icon fa fa-caret-right"></i>
									AutoPings
								</a>

								<b class="arrow"></b>
							</li>

						

							
						</ul>
					</li>   
                      
                   <%--  <li class="">
						<a href="<%=request.getContextPath()%>/quartzjob/getQuartzList.htm">
							<i class="menu-icon fa fa-clock-o"></i>
							<span class="menu-text"> Scheduler </span>
						</a>  

						<b class="arrow"></b>
					</li> --%> 
				</ul>
    <!-- /.nav-list -->   
    
    <script type="text/javascript">	try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}</script> 
  </div>
      
      <!-- /section:basics/sidebar -->
      <div class="main-content">
    <div class="main-content-inner"> 
         
					<div class="page-content">






	

 

<!--<script src="<%=request.getContextPath()%>/js/security.js"></script>-->

<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />



</body>
  <script>
  function createTree1(){
	  <%-- 	var nodeList=<%=locationData%>; --%>
	  <%-- 	var userList=<%=partnerHeirarchyData%>; --%>

	  	var nodeList='${sessionScope.lstLocationData}';
	  	var userList='${sessionScope.lstPartnerHeirarchyData}';
	  	try{
	  	nodeList=JSON.parse(nodeList);
	  	userList=JSON.parse(userList);
	  	}catch(e){
	  		return;
	  	}
	  	
	  	childrenArray= new Array();
	  	myObj = new Object();
	  	var cntr=0;
	  	$(nodeList).each(function(i,obj) {
	  		
	  		var locationId=obj.locationId;
	  		var locationName=obj.locationName;
	  		var locationDescription=obj.locationDescription;
	  		var parentNodeId=obj.parentNodeId;
	  		var level=obj.level;
	  		var displaySeqNo=obj.displaySeqNo;
	  		var typeName='area';
	  		if(cntr==0){
	  			typeName='root';
	  			if('${sessionScope.nodeId}'==locationId)
	  				myObj.text='<b  onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
	  			else
	  				myObj.text='<b class="normal-fonts-location" onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
	  			myObj.state='{opened": "true","selected":"true"}';
	  			myObj.type=typeName;
	  			myObj.nodeId=locationId;
	  			myObj.level=level;
	  			myObj.children=childrenArray;
	  			currentArryToIterate=childrenArray;
	  			createChildNodes1(locationId,level,nodeList);
	  			createChildUsers1(locationId,level,userList);
	  			cntr+=1;
	  		}else{
	  			createChildNodes1(locationId,level,nodeList);
	  			createChildUsers1(locationId,level,userList);
	  		}
	  	});
	  	$.getScript('<%=request.getContextPath()%>/js/jstree/jstree.min.js', function () {
	         
	      try{
	  	
	  	$('#jstree1,#jstree2').jstree({

	          "types": {
	              "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
	              "root": {"icon": "", "valid_children": ["area"]},
	              "default": {"valid_children": ["default", "file"]},
	              "user": {"icon": "icn user1", "valid_children": []},
	              "area": {"icon": "icn area1", "valid_children": []}
	          },
	          "plugins": ["contextmenu", "types"],
	          'core': {
	              'data': [
	  				myObj
	              ]
	          }

	      });
	      }catch(e){
	      	try{
	      		$('#jstree1,#jstree2').jstree({
	      	        "types": {
	      	            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
	      	            "root": {"icon": "", "valid_children": ["area"]},
	      	            "default": {"valid_children": ["default", "file"]},
	      	            "user": {"icon": "icn user1", "valid_children": []},
	      	            "area": {"icon": "icn area1", "valid_children": []}
	      	        },
	      	        "plugins": ["contextmenu", "types"],
	      	        'core': {
	      	            'data': [
	      					myObj
	      	            ]
	      	        }

	      	    });
	      	}catch(e){
	      		$jq_1_9_2('#jstree1').jstree({
	      	        "types": {
	      	            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
	      	            "root": {"icon": "", "valid_children": ["area"]},
	      	            "default": {"valid_children": ["default", "file"]},
	      	            "user": {"icon": "icn user1", "valid_children": []},
	      	            "area": {"icon": "icn area1", "valid_children": []}
	      	        },
	      	        "plugins": ["contextmenu", "types"],
	      	        'core': {
	      	            'data': [
	      					myObj
	      	            ]
	      	        }

	      	    });
	      	}
	      }
	      $("#jstree1").on('open_node.jstree', function(e, data) {
	          $('li.jstree-open > ul li.jstree-open > ul').css({
	              'width': ($(this).width() + 0) + 'px'
	          });
	      });
	      
	  	});
	  }

  
  
  function locationClick1(nodeId,level,locationName,locDescription){
		$("#headerLocateName").empty();
		$('#headerLocateName').append(locationName);
		
		updateNodeUserInSession(nodeId,0,locationName,'');
		
	}
	function userClick1(nodeId,partyId,name){

		$("#headerLocateName").empty();
		$('#headerLocateName').append(name);
		updateNodeUserInSession(0,partyId,'',name);
	}

	function checkSelectedUserInHierarchy(){
		if('${sessionScope.partyId}'==0){
			showAlertMessage("Error","Please select one User from Hierarchy.","error",doNothing);
			return false;
		}else{
			return true;
		}
	}

	function updateNodeUserInSession(nodeId,partyId,locationName,name){
		
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/heirarchy/updateNodeUserInSession.htm?nodeId='+nodeId+'&partyId='+partyId+'&locationName='+locationName+'&name='+name,
			success : function(result) {
				
				$("#hierarchyDiv").modal('hide');
				if(nodeId==0){
					
		           	  bootbox.dialog({
							message: "<span class='bigger-110'>User selected.</span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										 location.reload();
										 
									}
								}
							}
						});
					//showAlertMessage("Success", "<br/>User selected.", "confirmation",reloadPage);
					
				}else{		
		           	  bootbox.dialog({
							message: "<span class='bigger-110'>Node selected.</span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										 location.reload();
										 
									}
								}
							}
						});
					//showAlertMessage("Success", "<br/>Node selected.", "confirmation",reloadPage);
					
				}
			}
		});
	}
	function createChildNodes1(nodeId,nodeLevel,nodeList){
		$(nodeList).each(function(i,obj) {
			var locationId=obj.locationId;
			var locationName=obj.locationName;
			var locationDescription=obj.locationDescription;
			var parentNodeId=obj.parentNodeId;
			var level=obj.level;
			var displaySeqNo=obj.displaySeqNo;
			var typeName='area';
			var childArray=new Array();
			getChildArray3(nodeId,nodeLevel);
			childArray=currentArryToIterate;
			currentArryToIterate==new Array();
			if(childArray==undefined)
				childArray=myObj['children'];
			if(parentNodeId==nodeId){
				var obj=new Object();
				if('${sessionScope.nodeId}'==locationId)
					obj.text='<b  onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
				else
					obj.text='<b class="normal-fonts-location" onmousedown="locationClick1(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
				obj.state='{opened": "true","selected":"true"}';
				obj.type=typeName;
				obj.nodeId=locationId;
				obj.level=level;
				obj.children=new Array();
				childArray.push(obj);
			}
			
			setTimeout(function() {
				setChildArray1(nodeId,nodeLevel,childArray)
			}, 10000);
		});
	}
	function createChildUsers1(nodeId,nodeLevel,userList){
		$(userList).each(function(i,obj) {
			var locationId=obj.locationId;
			var locationName=obj.locationName;
			var locationDescription=obj.locationDescription;

			var parentNodeId=locationId;
			var level=obj.level;
			var displaySeqNo=obj.displaySeqNo;
			var name=obj.userName;
			var partyId=obj.partyId;
			var headOfNode=obj.headOfNode;
			var typeName='user';
			var childArray=new Array();
			getChildArray3(nodeId,nodeLevel);
			childArray=currentArryToIterate;
			currentArryToIterate==new Array();
			if(childArray==undefined)
				childArray=myObj['children'];
			if(parentNodeId==nodeId){
				var obj=new Object();

				if('${sessionScope.partyId}'==''+partyId+'' && headOfNode==true)
					obj.text='<span class="icn star"></span><b  onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\',\''+name+'\')">'+name+'</b>';
				else if('${sessionScope.partyId}'==''+partyId+'' && headOfNode==false)

					obj.text='<b  onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\',\''+name+'\')">'+name+'</b>';
				else if(headOfNode==true)

					obj.text='<span class="icn star"></span><b class="normal-fonts-location" onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\',\''+name+'\')">'+name+'</b>';
				else

					obj.text='<span class="icn"></span><b class="normal-fonts-location" onmousedown="userClick1(\''+locationId+'\',\''+partyId+'\',\''+name+'\')">'+name+'</b>';

				obj.type=typeName;
				obj.nodeId=locationId;
				obj.level=level;
				obj.children=new Array();
				childArray.push(obj);
			}
			setTimeout(function() {
				setChildArray1(nodeId,nodeLevel,childArray)
			}, 10000);
		});
	}

	function getChildArray3(nodeId,nodeLevel){
		currentArryToIterate=myObj['children'];
		if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
			currentObj=myObj;
				return;
			}
			var i=0;
			while(i<currentArryToIterate.length){
				var obj=currentArryToIterate[i];
				var level=obj['level'];
				var nodeId1=obj['nodeId'];
				if(level==nodeLevel && nodeId1==nodeId){
					currentArryToIterate=obj['children'];
		 			currentObj=obj;
					return;
				}else{
					var isToReturn=getChildArray32(nodeId,nodeLevel,obj);
					if(isToReturn==true){
						return;
					}
				}
				i+=1;
			}
	}

	function getChildArray32(nodeId,nodeLevel,newObj){
		var currentArryToIterate1=new Array();
		currentArryToIterate1=newObj['children'];
		if(currentArryToIterate1.length==0 || (newObj['level']==nodeLevel && newObj['nodeId']==nodeId)){
			//currentObj=newObj;
				return false;
			}
			var i=0;
			while(i<currentArryToIterate1.length){
				var obj=currentArryToIterate1[i];
				var level=obj['level'];
				var nodeId1=obj['nodeId'];
				if(level==nodeLevel && nodeId1==nodeId){
					currentArryToIterate=obj['children'];
		 			currentObj=obj;
					return true;
				}else{
					var isToReturn=getChildArray32(nodeId,nodeLevel,obj);
					if(isToReturn==true){
						return;
					}
				}
				i+=1;
			}
	}
	function setChildArray1(nodeId,nodeLevel,childArray){
		currentArryToIterate=myObj['children'];
		if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
			myObj.children=childArray;
			return;
			}
		

		var i=0;
		while(i<currentArryToIterate.length){
		var obj=currentArryToIterate[i];
		
		var level=obj['level'];
		var nodeId1=obj['nodeId'];
		var level2=currentObj['level'];
		var nodeId2=currentObj['nodeId'];
		
		if(level==level2 && nodeId1==nodeId2){
			obj.children=childArray;
			currentArryToIterate[i]=obj;
			
			myObj.children=currentArryToIterate;
			return;
		}else{
		}
		i+=1;
		}
		}

  
  
  
var $jq_1_9_1=$;
$(function () {
	
	
	createTree1();
	$("#mainbutton").on("click",function(){
		$("#hierarchyDiv").modal({      
     "show" : true  ,
    });
	 $("#submenu5").fadeIn("slow");
	 //$('#hierarchyDiv').css('z-index','9999');
	});
	
	
	
// page loading of service portal for every ajax 
// var loading = $("#loading");
// $(document).ajaxStart(function () {
//     loading.show();
// });

// $(document).ajaxStop(function () {
//     loading.hide();
// });


//Generic Search
$('#searchText').keypress(function(event){
	var keycode = (event.keyCode ? event.keyCode : event.which);
	if(keycode == '13'){
	searchObjects();
	event.preventDefault();
}
	 
}); 
	
function searchObjects(){
	var searchText=$('#searchText').val().trim(); 
	
	if(searchText==''){  
		alert('Please enter some text to search.'); 
	}else{ 
		window.location.href='<%=request.getContextPath()%>/common/getSearchList.htm?serachText='+searchText;
	} 
	 
} 

//contacts
$.ajax({
	type : 'GET',	
		url : $('#contextPath').val()+"/common/getContactUsRecord.htm",
	success : function(result){
	//	alert(result);
		var CallUs='';
		var WriteUs='';
		var BUName='';
		var BUAddr='';
		var BUAddr2='';
		var BUAddr3='';
		var BUCity='';
		var BUPostalCode='';
		var twitter='';
		$(result).each(
				function(i, obj) {		
		CallUs=obj.callUs; 
		WriteUs=obj.writeUs;
		twitter=obj.twitter;
		$('#writeUs').html($("<a>").attr("href", "mailto:" + WriteUs).text(WriteUs));
		$('#twitter').html($("<a>").attr("href", "twitter.com/" + twitter).text(twitter));
		BUName=obj.buname;
			BUAddr=obj.buaddr;
		BUAddr2=obj.buaddr2;
			BUAddr3=obj.buaddr3;
			BUCity=obj.bucity;  			
			BUPostalCode=obj.bupostalCode;  			
		});
		$('#callUs').html(CallUs);
		$('#writeUs').html(WriteUs);			
		$('#writeUs').html($("<a>").attr("href", "mailto:" + WriteUs).text(WriteUs));
		$('#twitter').html(twitter);			
	//	$('#twitter').html($("<a>").attr("target", "_blank"));
		$('#twitter').html($("<a target='_blank'>").attr("href", "https://twitter.com/" + twitter).text(twitter));
		$('#buName').html(BUName);
		$('#buAddress').html(BUAddr);
		$('#buAddress').append(BUAddr2);
		$('#buAddress').append(BUAddr3);
		$('#buAddress').append('<br>');
		$('#buAddress').append(BUCity);
		$('#buAddress').append(' ');
		$('#buAddress').append(BUPostalCode);
		
	}
});

//Quick links
var currentBu = ${sessionScope.userSession.buId};
$.ajax(
  		{
  		  type: "POST",
  		  url: $('#contextPath').val()+'/faq/getBupartyname.htm?data=changebu',
  		  dataType: 'json',
	  contentType: 'application/json',
	  success:function(result)
	  {
		$('#bizunitname').empty();
		$(result).each(function(i, obj) {
		var bupartyid=obj.buId;
		var bupartyname=obj.lastName; 
		  if(bupartyid != currentBu)
			
			  {
			  $('#bizunitname').append('<li><div class="clearfix" ><span class="pull-left">'+bupartyname+'<a onClick="Switch('+bupartyid+');"></span><span class="pull-right blue">Switch</span></a></div></li>');
			  }
		  else{
			/*   $('#bizunitname').append('<li><div class="clearfix"><span class="pull-left"><i class="btn btn-xs no-hover btn-primary fa fa-comment"></i>'+bupartyname+'<a onClick="Switch('+bupartyid+');"></span><span class="pull-right badge badge-success">Current</span></a></div></li>'); */
			  $('#bizunitname').append('<li><div class="clearfix" ><span class="pull-left blue"><h4>'+bupartyname+'</h4><a onClick="Switch('+bupartyid+');"></span><span class="pull-right blue">Current</span></a></div></li>');
			  /* $('#bizunitname').append('<li class="dropdown-content">'+bupartyname+' <span class="label label-success">Current</span></li>'); */
		  }
	
		});
  	}
});
	 


});



//End document ready

//switch bu 
function Switch(buid) {
	var currentBu = ${sessionScope.userSession.buId};
	var buid = buid;
		$.ajax({
			type : "POST",
			url: $('#contextPath').val()+'/welcome/changebuid.htm?buid='+buid,
			dataType: 'json',
			contentType : 'application/json',
			success : function(result) {

		}
		
});
		bootbox.dialog({
			message: "<span class='bigger-110'>BU Changed</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						//Example.show("Primary button");
						location.reload();
					}
				}
			}
		});
	
}
//end swith bu

</script>

    
<script> 


 /* $(document).ready(function () {
    $('#menu-wplook-main-menu').find('li a').click(function(e) {
		alert('1..'); 
        $('.nav li').removeClass('active'); 

        var $parent = $(this).parent();
        if (!$parent.hasClass('active')) {
            $parent.addClass('active');
        }
        e.preventDefault();
    });      
});  commented by suvarna*/      
    
 
//$(document).ready(function () {
	$(function () {        
    $('#menu-wplook-main-menu').find('li a').click(function () {
    	
    	$('.nav li').removeClass('active'); 
		  
        var $parent = $(this).parent();
        if (!$parent.hasClass('active')) {
            $parent.addClass('active');
        } 
               
    	$('#menu-wplook-main-menu').find('li a').removeClass('active');
    	$(this).addClass('active');    
        $($(this).closest('li.menu-wplook-sub-menu').children()[0]).addClass('active');
       // alert('1..');  
        $($(this).closest('li.menu-wplook-sub-menu').closest('ul.li').children()[0]).addClass('active');  
        //$($(this).closest('li.menu-wplook-sub1-menu').children()[0]).addClass('active');  
        //$('#menu-wplook-sub-menu').parents('ul').parents('li').find('a').addclass('active');     
       
    });          
});         

  </script> 
<script>
  $(function () {
	// page loading of service portal for every ajax 
      var loading = $("#loading");
      $(document).ajaxStart(function () {
          loading.show();
         
      });

      $(document).ajaxStop(function () {
          loading.hide();
          $('#shadow_div_web_app').hide();
      });

  });
  </script>  
   
  
  

  <script>
  /**  
   * @Naval 
   *       callReport method from show report in new tab      
   * @param : Url of report
   *         
   */
  function callReport(url){
  	 
  	 var url2 = encodeURIComponent(url); 
  	  window.open(encodeURI($('#contextPath').val()+'/birtreport/loadreport.htm?url='+url2),'_blank');
  	  
  		 
  	  }
  </script>

</html>
 