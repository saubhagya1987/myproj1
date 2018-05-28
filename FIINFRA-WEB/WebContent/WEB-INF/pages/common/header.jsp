<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="in.fiinfra.common.partner.LocationData"%>
<%@page import="in.fiinfra.common.partner.PartnerHeirarchyData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8">
<title>FIINFRA</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
//request.setAttribute("_cdn", cdn);
request.setAttribute("_cdn", request.getContextPath().subSequence(0, request.getContextPath().lastIndexOf("/"))+"/FIINFRA-Welcome/resources");
%>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<head>

<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${_cdn}/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${_cdn}/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script src='<%=request.getContextPath()%>/js/common.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/zebra_dialog.css" type="text/css"/>
<script src="<%=request.getContextPath()%>/js/my_account_submenu.js"></script>
<style>
/*Hierarchy box*/

.normal-fonts-location {
	font-weight: normal;
}
.hierarchy-submenu-bx {
	z-index: 10000 !important;
}
.thumbnail {
	border: none !important;
}
</style>
<script type="text/javascript">
$(function() {
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	
	$("#searchText").keydown(function(event) {
		console.log('here:----'+event.keyCode);
		//alert('here:----'+event.keyCode);
		if (event.keyCode == 13) {
			event.preventDefault();
			searchObjects();
		}
		
	});
	$('.ZebraDialog_Button1').click(function() {
		$('#commonpopup-header').modal('hide');
	});
	$('.ZebraDialog_Button0').click(function() {
		$('#commonpopup-header').modal('hide');
	});
	
	
blinkeffect('#subxDiv');
});
function blinkeffect(selector) {
$(selector).fadeOut('slow', function() {
$(this).fadeIn('slow', function() {
blinkeffect(this);
});
});

}function blinkeffect1(selector) {
	$(selector).fadeOut('slow', function() {
		$(this).fadeIn('slow', function() {
		blinkeffect1(this);
		});
		});

		}
</script>
<style type="text/css">
/**
Added by nikhil thakkar
**/

#data th {
	vertical-align: top;
	background: rgb(250, 250, 250); /* Old browsers */
	background: -moz-linear-gradient(top, rgba(250, 250, 250, 1) 3%, rgba(198, 198, 198, 1) 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(3%, rgba(250, 250, 250, 1)), color-stop(100%, rgba(198, 198, 198, 1))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, rgba(250, 250, 250, 1) 3%, rgba(( 198, 198, 198, 1) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, rgba(250, 250, 250, 1) 3%, rgba(198, 198, 198, 1)) 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, rgba(250, 250, 250, 1) 3%, rgba(198, 198, 198, 1) 100%); /* IE10+ */
	background: linear-gradient(to bottom, rgba(250, 250, 250, 1) 3%, rgba(198, 198, 198, 1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fafafa', endColorstr='#dbdbdb', GradientType=0); /* IE6-9 */
	margin: 0;
}
#data a {
	vertical-align: top;
	font-weight: normal;
	color: #777777;
	text-shadow: 0 1px 0 #FFFFFF;
	font-size: 11px;
	font-weight: bold;
}
.readmail {
	font-weight: normal;
}
a {
	cursor: pointer;
}
.selficon {
	background: url(../images/allCommon-Icons.png) no-repeat -35px -399px;
	padding-right: 18px;
	padding-top: 0px;
}
</style>
<script type="text/javascript">
var $jq_1_9_1 = $;
var $jq_1_9_2 = $;
var $j = $;
</script>
<title>Insert title here</title>
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${_cdn}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fontcustom.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fullcalendar.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/ui.jqgrid.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jstree/themes/default/style.min.css">
<!-- style for js tree do not delete -->
<style>
.jstree .icn {
	width: 20px;
	height: 20px;
	display: inline-block;
	background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat 0 0 transparent
}
.jstree .icn.plus {
	background-position: -15px -20px
}
.jstree .icn.area1 {
	background-position: -2px -3px
}
.jstree .icn.user1 {
	background-position: -25px -3px
}
.jstree .icn.star {
	background-position: -50px -3px
}
.jstree-default .jstree-open > .jstree-ocl {
	background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat -3px -25px transparent
}
.jstree-default .jstree-closed > .jstree-ocl {
	background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat -28px -25px transparent
}
.jstree-default .jstree-clicked {
	background: none;
	border-radius: 0;
	box-shadow: none;
	color: #AE2760
}
ul.jstree-container-ul { /* background: #8F8F8F; overflow: hidden*/
}
li.jstree-open > ul { /*  background: #DADADA;*/
	display: block;
}
li.jstree-open > ul li.jstree-open > ul { /*background: #F2F2F2;*/
	position: relative;
	left: -24px;
	padding-left: 24px;
	width: 100%;
}
</style>

<!-- ace styles -->
<link rel="stylesheet" href="${_cdn}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${_cdn}/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${_cdn}/assets/css/ace-ie.css" />
		<![endif]-->
<link rel="stylesheet" href="${_cdn}/assets/css/custom.css"/>
<link rel="stylesheet" href="${_cdn}/assets/css/theme.css"/>
<link rel="stylesheet" href="${_cdn}/assets/css/custom_responsive.css">

<!-- ace settings handler -->
<script src=" ${_cdn}/assets/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src=" ${_cdn}/assets/js/html5shiv.js"></script>
		<script src=" ${_cdn}/assets/js/respond.js"></script>
		<![endif]-->
</head>
<body class="no-skin ${sessionScope.userSession.themeName}_${sessionScope.userSession.themeId}" id="mainheaderBody">
<div id="navbar" class="navbar navbar-default navbar-fixed-top"> 
  <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
  <div class="navbar-container" id="navbar-container"> 
    <!-- #section:basics/sidebar.mobile.toggle -->
    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar"> <span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    
    <!-- /section:basics/sidebar.mobile.toggle -->
    <div class="navbar-header pull-left" style="margin-left:10px!important"> 
      <!-- #section:basics/navbar.layout.brand --> 
      <a href="<%=request.getContextPath()%>/index.htm?task=no" title="Home" onClick="Home" class="navbar-brand logo nopadding" id="logoSpanHeader"><img
						src="<%=request.getContextPath()%>/app/images${sessionScope.userSession.logo}" style="width:${sessionScope.userSession.logoWidth}px; height:${sessionScope.userSession.logoHeight}px;max-width:150px;max-height:50px" onerror="$(this).hide()" alt=""  id="headerLogoImage" onclick=""> </a> 
      
      <!-- /section:basics/navbar.layout.brand --> 
      
      <!-- #section:basics/navbar.toggle --> 
      
      <!-- /section:basics/navbar.toggle --> 
    </div>
    
    <!-- #section:basics/navbar.dropdown -->
    <div class="navbar-buttons navbar-header pull-right" role="navigation">
      <ul class="nav ace-nav">
        <!--<li class="dark cust_top_menu"> <strong id="headerLocateName" >
          <c:choose >
            <c:when test="${sessionScope.locationName==''}"> ${sessionScope.name} </c:when>
            <c:when test="${sessionScope.name==''}"> ${sessionScope.locationName} </c:when>
            <c:otherwise> ${sessionScope.userSession.name} </c:otherwise>
          </c:choose>
          </strong> </li>-->
       	<c:choose >
                    <c:when test="${sessionScope.userSession.headOfNode==true}"> 
                       <li id="hierarchyDiv" class="blue cust_top_menu hidden-xs"> <a class="hierarchy-submenu-btn"> <i class="ace-icon fa fa-sitemap" title="Hierarchy" alt="Hierarchy"></i><span class="menu-text" class="headerLocateName">
        				<c:choose >
                        <c:when test="${sessionScope.locationName==''}"> ${sessionScope.name} </c:when>
<%--                         <c:when test="${sessionScope.name=='' or sessionScope.locationName!=''}"> ${sessionScope.locationName} </c:when> --%>
                        <c:when test="${sessionScope.name==''}"> ${sessionScope.locationName} </c:when>
                        <c:otherwise> ${sessionScope.userSession.name} </c:otherwise>
                      </c:choose>
                      </span> <!--<span class="badge badge-grey">4</span>--> </a> </li>
                     </c:when>                     
        </c:choose>
        <li class="blue cust_top_menu hidden-xs" id="taskLink"> <a href="<%=request.getContextPath()%>/task/getTaskList.htm"> <i class="ace-icon fa fa-tasks" title="Tasks" alt="Tasks"></i><span class="menu-text">Tasks</span> <!--<span class="badge badge-grey">4</span>--> </a> </li>
        <li id="mailBoxLink" class="blue cust_top_menu hidden-xs"> <a href="<%=request.getContextPath()%>/mailbox.htm" target="_blank"> <i class="ace-icon fa fa-envelope icon-animated-vertical" title="Email" alt="Email"></i><span class="menu-text" style="
">Email</span> <!--<span class="badge badge-important">5</span>--> </a> </li>
        <li class="blue cust_top_menu hidden-xs"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="ace-icon fa fa-bolt" title="Quick links" alt="Quick links"></i><span class="menu-text">Quick links</span> </a>
          <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
            <li class="dropdown-header"> <i class="ace-icon fa fa-bolt"></i> Quick Links </li>
            <li class="dropdown-content">
              <ul class="dropdown-menu dropdown-navbar" id="QuickLinkMenu">
                <li class="visible-xs-block"> <a id="transactions" class="clearfix" onClick='showPwdDialog()'> <i class="ace-icon fa fa-upload"></i>&nbsp;<span class="txt">Auto-upload transactions data</span></a></li>
                <!--<li> <a class="hierarchy-submenu-btn clearfix"> <i class="ace-icon fa fa-sitemap"></i> Hierarchy
                  <c:choose >
                    <c:when test="${sessionScope.userSession.headOfNode==true}"> <strong id="headerLocateName" class="label label-sm label-primary arrowed arrowed-right">
                      <c:choose >
                        <c:when test="${sessionScope.locationName==''}"> ${sessionScope.name} </c:when>
                        <c:when test="${sessionScope.name==''}"> ${sessionScope.locationName} </c:when>
                        <c:otherwise> ${sessionScope.userSession.name} </c:otherwise>
                      </c:choose>
                      </strong> </c:when>
                  </c:choose>
                  </a> </li>-->
                <li id="interactivePlanningToolHomeLink"> <a href="<%=request.getContextPath()%>/common/goTOInteractivePlanningTool.htm" class="clearfix"> <i class="ace-icon fa fa-calendar"></i> Interactive Planner </a> </li>
                <li id="websiteLink"> <a href="http://websites.fiinfra.in/" target="_blank" class="clearfix"> <i class="ace-icon fa fa-desktop"></i> Website </a> </li>
                <li id=""> <a href="<%=request.getContextPath()%>/whatsnew.htm" target="_blank" class="clearfix"> &nbsp;<i class="ace-icon fa fa-exclamation"></i>&nbsp;&nbsp;
                  What's New? </a> </li>
                <li> <a href="<%=request.getContextPath()%>/downloads.htm" target="_blank" class="clearfix"> <i class="ace-icon fa fa-download"></i> Downloads </a> </li>
                
                <li> <a href="<%=request.getContextPath()%>/faqs.htm" target="_blank" class="clearfix"> &nbsp;<i class="ace-icon fa fa-question"></i>&nbsp;
                  FAQ's </a> </li>
                  
                <li> <a class="contact_details clearfix"> &nbsp;<i class="ace-icon fa fa-phone"></i> Contact </a> </li>
                
                <li> <a class="clearfix trouble_ticket" onclick="clearFields();"> &nbsp;<i class="ace-icon fa fa-ticket"></i> Log Trouble Ticket </a> </li>
              </ul>
            </li>
          </ul>
        </li>
        <!-- #section:basics/navbar.user_menu -->
        <li class="light-blue greet_user"> <a data-toggle="dropdown" href="#" class="dropdown-toggle"> <i class="ace-icon fa fa-user"></i> <span class="user-info hidden-xs"> <small>Welcome,</small> ${sessionScope.userSession.name} </span> <i class="ace-icon fa fa-caret-down"></i> </a>
          <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
<%--             <li> <a href="<%=request.getContextPath()%>/setup.htm"> <i class="ace-icon fa fa-cogs"></i> Setup </a> </li> --%>
              <li class="hidden-sm hidden-md hidden-lg"><a><span class="user-info"> <small>Welcome,</small> ${sessionScope.userSession.name} </span> </a></li>
             <li class="divider hidden-sm hidden-md hidden-lg"></li> 
            <li><a alt="Setup" title="Setup" onclick="setup();"><i class="ace-icon fa fa-cogs"></i>Setup</a></li>
            <li><a alt="Profile" title="Profile" onclick="partnerprofile();"> <i class="ace-icon fa fa-user"></i> Profile </a> </li>
<%--             <li> <a href="<%=request.getContextPath()%>/partnerprofile.htm"> <i class="ace-icon fa fa-user"></i> Profile </a> </li> --%>
            <li class="divider"></li>
            <li> <a href="<%=request.getContextPath()%>/common/logout.htm"> <i class="ace-icon fa fa-power-off"></i> Logout </a> </li>
          </ul>
        </li>
        
        <!-- /section:basics/navbar.user_menu -->
      </ul>
    </div>
    
     <button type="button" class="navbar-toggle menu-toggler pull-right visible-xs-block" id="links-toggler" data-target="#linkbar"> <span class="sr-only">Toggle linkbar</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    <!-- /section:basics/navbar.dropdown --> 
  </div>
  <!-- /.navbar-container --> 
</div>
<div class="main-container" id="main-container">
<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
<div id="sidebar" class="sidebar responsive menu-min sidebar-fixed sidebar-scroll compact" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true"> 
  <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script> 
  <!--<div class="sidebar-shortcuts" id="sidebar-shortcuts">
  <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
    <button class="btn btn-success"> <i class="ace-icon fa fa-signal"></i> </button>
    <button class="btn btn-info"> <i class="ace-icon fa fa-pencil"></i> </button>
    
  
    <button class="btn btn-warning"> <i class="ace-icon fa fa-users"></i> </button>
    <button class="btn btn-danger"> <i class="ace-icon fa fa-cogs"></i> </button>
    
  
  </div>
  <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini"> <span class="btn btn-success"></span> <span class="btn btn-info"></span> <span class="btn btn-warning"></span> <span class="btn btn-danger"></span> </div>
</div>--> 
  
  <!-- #section:basics/sidebar.layout.minimize -->
  <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse"> <i class="ace-icon fa fa-angle-double-right" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i> </div>
  
  <!-- /section:basics/sidebar.layout.minimize --> 
  <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script> 
  
  <!-- /.sidebar-shortcuts -->
  <ul class="nav nav-list" style="top: 0px;">
    <li class="" id="homeLink"> <a href="<%=request.getContextPath()%>/index.htm?task=no"> <i class="menu-icon fa fa-home"></i> <span class="menu-text"> Home</span> </a> <b class="arrow"></b> </li>
    <li class="" id="opportunityLink"> <a href="<%=request.getContextPath()%>/opportunity/getOpportunitiesList.htm"> <i class="menu-icon fa icon-opportunity size-21"></i> <span class="menu-text"> Opportunities </span> </a> <b class="arrow"></b> </li>
    <li class="" id="clientLink"> <a href="<%=request.getContextPath()%>/client/getClientList.htm"> <i class="menu-icon fa fa-users"></i> <span class="menu-text"> Clients </span> </a> <b class="arrow"></b> </li>
    <li class="" id="pingLink"> <a href="<%=request.getContextPath()%>/ping/getPings.htm"> <i class="menu-icon fa fa-comment"></i> <span class="menu-text"> Pings</span> </a> <b class="arrow"></b> </li>
    <li class="" id="goalsLink"> <a href="<%=request.getContextPath()%>/goals.htm"> <i class="menu-icon fa icon-my-goals size-24"></i> <span class="menu-text"> Goals </span> </a> <b class="arrow"></b> </li>
    <li class="" id="executionLink"> <a href="<%=request.getContextPath()%>/et/getApDetails.htm"> <i class="menu-icon fa fa-gear"></i> <span class="menu-text"> Execution </span> </a> <b class="arrow"></b> </li>
    <li class="" id="PortFolio"> <a href="<%=request.getContextPath()%>/folio/foliopage.htm"> <i class="menu-icon fa fa-picture-o"></i> <span class="menu-text"> PortFolio </span> </a> <b class="arrow"></b> </li>
    <li class="" id="top-menu"> <a href="#" class="dropdown-toggle"> <i class="menu-icon fa fa-file-text"></i> <span class="menu-text"> Reports </span> <b class="arrow fa fa-angle-down"></b> </a> <b class="arrow"></b>
      <ul class="submenu ace-scroll scroll-disabled can-scroll" style="">
      
        <li class=""> <a href="<%=request.getContextPath()%>/loadreportAUMReconDetailReport.htm"> <i class="menu-icon fa fa-caret-right"></i> Portfolio </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<%=request.getContextPath()%>/loadreportClientGoalSummary.htm"> <i class="menu-icon fa fa-caret-right"></i> Goal </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<%=request.getContextPath()%>/loadreportExecutionTrackerList.htm"> <i class="menu-icon fa fa-caret-right"></i> Execution </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<%=request.getContextPath()%>/loadreportOpportunityTrakerList.htm"> <i class="menu-icon fa fa-caret-right"></i> Contact </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<%=request.getContextPath()%>/loadreportDCTrackerList.htm"> <i class="menu-icon fa fa-caret-right"></i> Data Collection </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<%=request.getContextPath()%>/loadreportPingDelivery.htm"> <i class="menu-icon fa fa-caret-right"></i> Ping </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<%=request.getContextPath()%>/loadreportPartnerOpenTaskList.htm"> <i class="menu-icon fa fa-caret-right"></i> CRM </a> <b class="arrow"></b> </li>
      </ul>
      <div class="scroll-track scroll-detached no-track scroll-thin scroll-margin scroll-visible" style="display: none; height: 199px; top: 40px; left: 212px;">
        <div class="scroll-bar" style="height: 157px; top: 0px;"></div>
      </div>
    </li>
    <li class="" id="chatLink"> <a href="<%=request.getContextPath()%>/chat.htm"> <i class="menu-icon fa fa-comments"></i> <span class="menu-text"> Chat 
    
      
      <!-- #section:basics/sidebar.layout.badge --> 
      <!--<span class="badge badge-primary">5</span> --> 
      
      <!-- /section:basics/sidebar.layout.badge --> 
      </span> </a> <b class="arrow"></b> </li>
    <li class="" id="mffileuploadlink"> <a href="<%=request.getContextPath()%>/et/getTxnSource.htm"> <i class="menu-icon fa fa-upload"></i> <span class="menu-text"> RTA File Upload </span> </a> <b class="arrow"></b> </li>
    <li class="" id="queryLink"> <a href="<%=request.getContextPath()%>/query/getQueryList.htm"> <i class="menu-icon fa fa-question-circle"></i> <span class="menu-text"> Query </span> </a> <b class="arrow"></b> </li>
  </ul>
  <!-- /.nav-list --> 
  
  
</div>


<div class="main-content">
<div class="main-content-inner">
<!-- #section:basics/content.breadcrumbs -->
<div class="breadcrumbs hide" id="breadcrumbs"> 
  <script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script> 
  
  <!-- #section:basics/content.searchbox -->
  
  <div class="nav-search hide" id="nav-search">
    <form class="form-search">
      <span class="input-icon">
      <input type="text" placeholder="Search ..." class="nav-search-input" id="searchText" autocomplete="off"  />
      <i class="ace-icon fa fa-search nav-search-icon"></i> </span>
    </form>
  </div>
  <div id="blink" class="pull-left label label-lg arrowed-in-right arrowed-in hidden-xs" style="display: none; margin:8px 0 0 15px"> Click Here </div>
  
  <!-- /.nav-search --> 
  
  <!-- /section:basics/content.searchbox --> 
</div>
<!-- /section:basics/content.breadcrumbs -->

<div class="page-content clearfix">
<!-- #section:settings.box -->
<!--<div class="ace-settings-container" id="ace-settings-container">
  <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn"> <i class="ace-icon fa fa-cog bigger-130"></i> </div>
  <div class="ace-settings-box clearfix" id="ace-settings-box">
    <div class="pull-left width-50"> 
   
      <div class="ace-settings-item">
        <div class="pull-left">
          <select id="skin-colorpicker" class="hide">
            <option data-skin="no-skin" value="#438EB9">#438EB9</option>
            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
          </select>
        </div>
        <span>&nbsp; Choose Skin</span> </div> 
      
       
      <div class="ace-settings-item">
        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
        <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
      </div>
      
    
      <div class="ace-settings-item">
        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
        <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
      </div>
      
      
      <div class="ace-settings-item">
        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
        <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
      </div>
      
    
      
    </div>
   
    
    <div class="pull-left width-50"> 
    
      <div class="ace-settings-item">
        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
        <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
      </div>
      <div class="ace-settings-item">
        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
        <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
      </div>
      <div class="ace-settings-item">
        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
        <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
      </div>
      
     
    </div>
   
  </div>
  
</div>-->


<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
<input id="userPhoto" type="hidden" name="userPhoto"
		value="${sessionScope.userSession.photo}" />
<input type="hidden" id="partyName" value="${sessionScope.userSession.name}"/>
<input type="hidden" id="communicationId" value="${sessionScope.userSession.emailCommunicationID}"/>
<input type="hidden" id="partyIdHidden" value="${sessionScope.userSession.partyId}"/>
<input type="hidden" id="buId" value="${sessionScope.userSession.buId}"/>
<input type="hidden" id="communicationName" value="${sessionScope.userSession.emailCommunicationName}"/>
<input type="hidden" id="contactMobileSession" value="${sessionScope.userSession.contactMobile}"/>
<input type="hidden" id="idList" value="${sessionScope.idList}"/>
<div id="popUpDiv" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Log Trouble Ticket</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body">
        <div id="popupwrapper_contactform">
          <div id="poptable_contactform">
            <div class="full">
              <input id="subjectHeader" type="text" class="form-control" placeholder="Subject">
            </div>
            <div class="space-4"></div>
            <div class="full">
              <textarea id="qsBody" class="form-control" placeholder="Your Question"
						style="height: 100px; width:100%"></textarea>
            </div>
            <div class="col-md-2 searchpadding padding_top">Add Attachments</div>
            <form id="logTicketForm" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/ping/sendNotificationHeader.htm">
              <input type="hidden" id="notifyTemplateXMLHeader" name="notifyTemplateXML">
              <input type="hidden" id="notifyTemplateXMLHeader2" name="notifyTemplateXML2">
              <input type="hidden" id="deliveryChannelHeader" name="deliveryChannelID" value="32001">
              <input type="hidden" id="useSignatureIDHeader" name="useSignature" value="29001">
              <input type="hidden" id="partyId" name="partyID" value="${sessionScope.userSession.partyId}">
              <input type="hidden" id="partyIdToSendString" name="partyIDString" value="${sessionScope.userSession.partyId}">
              <div class="space-4"></div>
              <div class="col-md-5 searchpadding padding_top" style="margin-top:"> <span id="templateAttachment1SpanHeader">
                <input type="file" name="templateAttachment" id="templateAttachment1Header" style="margin-bottom: 5px;">
                </span><span id="templateAttachment1NameHeader"></span> <span id="templateAttachment2SpanHeader">
                <input type="file" name="templateAttachment" id="templateAttachment2Header" style="margin-bottom: 5px;">
                </span><span id="templateAttachment2NameHeader"></span> <span id="templateAttachment3SpanHeader">
                <input type="file" name="templateAttachment" id="templateAttachment3Header" style="margin-bottom: 5px;">
                </span><span id="templateAttachment3NameHeader"></span> </div>
            </form>
          </div>
        </div>
        <div class="modal-footer">
          <div class="topbuttonholder">
            
              <button class="btn btn-primary btn-xs" id="loginButton" onclick="sendLogTicket()"><i class="fa fa-envelope-o"></i>&nbsp; Send Email</button>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="commonpopup-header1" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id=""></h4>
      </div>
      <div class="modal-body">
         <div class="row">
      	<div class="form-group col-md-6 clearfix">
      	<h4>Configure CAMS, Karvy and Sundaram Passwords</h4>
      	</div>
       </div>
      <div class="row">
      	<div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="CAMS">CAMS </label>
        	<div class="col-sm-9">
            	<input type="password" id="CAMS" name="CAMS" validate="1" emsg="CAMS"
									class="input-large" placeholder="CAMS Password">
            </div>
       </div>
       </div>
       <div class="row">
       <div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="Karvy">Karvy  </label>
        	<div class="col-sm-9">
            	<input type="password" id="Karvy" name="Karvy" validate="1" emsg="Karvy"
									class="input-large" placeholder="Karvy Password">
            </div>
       </div>
       </div>
       <div class="row">
       <div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="Sundaram">Sundaram </label>
        	<div class="col-sm-9">
            	<input type="password" id="Sundaram" name="Sundaram" validate="1" emsg="Sundaram"
									class="input-large" placeholder="Sundaram Password">
            </div>
       </div>
    </div>
       <div class="row">
       <div class="form-group col-md-6 clearfix">
        	<label class="col-sm-3 control-label no-padding-right" for="Sundaram">Alternate Email </label>
        	<div class="col-sm-9">
            	<input type="text" id="alternateContactEmail" name="alternateContactEmail" validate="1" emsg="contactEmail"
									class="input-large" placeholder="Contact Email" value="${sessionScope.userSession.contactEmail}">
            </div>
       </div>      
        <label class="col-sm-3 control-label no-padding-right" for="Sundaram">/same as registered with Registrars </label>    
    </div>
    
      </div>
      <div class="modal-footer hide" id="commonpopup-header-footer1">
        <button type="button" class="btn btn-primary btn-xs" id="commonpopup-header-button-ok11" onClick="saveRtaFilePasswords();">Save</button>
        <button type="button" class="btn btn-primary btn-xs" data-dismiss="modal" id="commonpopup-header-button-ok12">Close</button>
      </div>
    </div>
  </div>
</div>

<div id="ContactMenu" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Contact</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body">
        <ul class="reset pad-nesw2" id="ContactMenu">
          <li><span alt="FINFRA" title="FINFRA"><i class="fa fa-map-marker"></i> <span class="user strong" id="buName">BUNAME</span></span> <br>
            <span class="" id="buAddress">Address<br />
            </span></li>
          <li><span alt="Call Us" title="Call Us"><i class="fa fa-phone"></i> <span class="user strong"> Call Us</span>:</span><br>
            <span class="" id="callUs"></span></li>
          <li><span alt="Write to us at" title="Write to us at"><i class="fa fa-envelope"></i> <span class="user strong"> Write to us at</span>:</span><br>
            <span class="" id="writeUs"><a href="mailto:shubhchintak@fi-i.comn" id="awriteUs"></a></span></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div id="" class="hierarchy-submenu-main-bx modal fade">
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
              <div class="hierarchy-submenu-bx" style="display:none;">
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
<div id="commonpopup-header" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="commonpopup-header-title"></h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" id="commonpopup-header-body"> </div>
      <div class="modal-footer hide" id="commonpopup-header-footer"> <a  class="btn btn-primary ZebraDialog_Button1" id="commonpopup-header-button-ok">Yes</a> <a  class="btn btn-primary ZebraDialog_Button0" id="commonpopup-header-button-ok2">No</a> </div>
    </div>
  </div>
</div>

<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 
<!--</div>
</div>-->
<jsp:include page="common_popup.jsp" />
<script type="text/javascript">
$(function() {

	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
	
});
</script>
<% 
String logTicketResult=""; 
logTicketResult=session.getAttribute("LogTicketResult")==null?"":session.getAttribute("LogTicketResult").toString();
if(logTicketResult.equals("success")){
	session.setAttribute("LogTicketResult","");
	%>
<input type="hidden" id="logTicketMessage" value="success"/>
<%
}else{
	session.setAttribute("LogTicketResult","");
	%>
<input type="hidden" id="logTicketMessage" value="<%=logTicketResult%>"/>
<%
}
%>
<script type="text/javascript">

var isAttachmentSeleted=0;
var option="";
var childrenArray = new Array();
var treeArray = new Array();
var myObj = new Object();
var currentArryToIterate = new Array();
var currentObj=new Object();
var locationId=0;
function customMenu1(node) {



    if (node.type == 'root') {
        var items = {
            addLocationItem: {
                label: "Add Location",
                action: function(obj) {
                    $('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
					});
					
                },
                icon: "fa fa-trash-o"

            },
            editItem: {
                label: "Edit Location",
                action: function(obj) {
                  $('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Edit Location');
					 	$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						
					});
                },
                icon: "fa fa-trash-o"

            },
			
            addUserItem: {
                label: "Add User",
                action: function(obj) {
                   
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Add User');
						$('#manageHeirarchySavePartnerForm #partyId').val(0);
					});
                },
                icon: "fa fa-trash-o"

            }
			
        };
    } else if (node.type == 'area') {
        var items = {
			addLocationItem: {
                label: "Add Location",
                action: function(obj) {
                
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
					});
                },
                icon: "fa fa-trash-o"

            },

            editItem: {
                label: "Edit Location",
                action: function(obj) {
                  
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#nodeLabel').html('Edit Location');
						$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						
					});
                },
                icon: "fa fa-trash-o"

            },
              deleteItem: {
                label: "Delete Location",
                action: function(obj) {
                 
			    },
                icon: "fa fa-trash-o"

            },
            addUserItem: {
                label: "Add User",
                action: function(obj) {
                 
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Add User');
						$('#manageHeirarchySavePartnerForm #partyId').val(0);
					});
                },
                icon: "fa fa-trash-o"

            }
        };
    } else if (node.type == 'user') {
        var items = {
            editUserItem: {
                label: "Edit User",
                action: function(obj) {
                
					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#userLabel').html('Edit User');
						getEditPartner($('#manageHeirarchySavePartnerForm #partyId').val());
					});
                },
                icon: "fa fa-trash-o"

            },                        deleteItem: {
                label: "Delete User",
                action: function(obj) {
                   
                },
                icon: "fa fa-trash-o"

            }

        };
    }

    return items;
}




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
	
	$('#jstree1').jstree({

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
    		$('#jstree1').jstree({
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
	//$("#headerLocateName").empty();
	//$('#headerLocateName').append(locationName);
	$(".headerLocateName").empty();
	$('.headerLocateName').append(locationName);
	
	updateNodeUserInSession(nodeId,0,locationName,'');
	
}
function userClick1(nodeId,partyId,name){

	//$("#headerLocateName").empty();
	//$('#headerLocateName').append(name);
	$(".headerLocateName").empty();
	$('.headerLocateName').append(name);
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
		url : $('#contextPath').val()+'/partner/updateNodeUserInSession.htm?nodeId='+nodeId+'&partyId='+partyId+'&locationName='+locationName+'&name='+name,
		success : function(result) {
			
			$(".hierarchy-submenu-main-bx").modal('hide');
			if(nodeId==0){
				showAlertMessage("Success", "<br/>User selected.", "confirmation",reloadPage);
				
			}else{								
				showAlertMessage("Success", "<br/>Node selected.", "confirmation",reloadPage);
				
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


$(function() {
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});

	/* $( "#headerLogoImage" ).load(function() {
		//alert($( this ).height());
		//alert($( this ).width());
		  if ( $( this ).height() > 60) {
		    $('#logoSpanHeader').css('height',$( this ).height());
		  }else{
			  $('#logoSpanHeader').css('height','60px');
		  }
		  if ( $( this ).width() > 150) {
			    $('#logoSpanHeader').css('width',$( this ).width());
			  }else{
				  $('#logoSpanHeader').css('width','150px');
			  }
		}); */
	activateSecurity();
	
	createTree1();
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	$(".hierarchy-submenu-btn").on("click",function(){
		$(".hierarchy-submenu-main-bx").modal({      
     "show" : true  ,
    });
	 $(".hierarchy-submenu-bx").fadeIn("slow");
	});
	
	$( "#templateAttachment1Header,#templateAttachment2Header,#templateAttachment3Header" ).change(function() {		
		isAttachmentSeleted=1;
		
	});

	
	if($('#logTicketMessage').val()=='success'){
		localStorage.setItem('actionName', $('#contextPath').val()+'/index.htm');
		showAlertMessage("Success", "Mail sent successfully.", "confirmation",redirectFunction);	
		$('.ZebraDialog').css('z-index','9999999999999999');
	}else if($('#logTicketMessage').val()=='fail'){
		showAlertMessage("Error",
				"The connection to the server has been lost. Please try again later.",
				"error");
		$('.ZebraDialog').css('z-index','9999999999999999');
	}
	$('#logTicketMessage').val('');
});

$(document).ready(function(){
	  $("#user").click(function(){
		  $("#usermenu").slideToggle();
			});
			
		 $("#Help").click(function(){
		  $("#HelpMenu").slideToggle();
			});
			
		  $("#Contact").click(function(){
		  $("#ContactMenu").slideToggle();
			});
			
		  $("#moreAction").click(function(){
		  $("#moreActionMenu").slideToggle();
		  });
		  
	
	
});

function setup(){
				if(checkSelectedUserInHierarchy()==true){
					if('${sessionScope.userSession.buId}'=='27829')
					{
						window.location.href= $('#contextPath').val()+'/masterassumption.htm';
					}
					else{
						window.location.href= $('#contextPath').val()+'/setup.htm';
					}
				}

}

function partnerprofile(){
				if(checkSelectedUserInHierarchy()==true){
					window.location.href= $('#contextPath').val()+'/partnerprofile.htm';
				}
}

function clearFields(){
	$('#subjectHeader').removeAttr('disabled');
	$('#qsBody').removeAttr('disabled');
	$('#templateAttachment1Header').removeAttr('disabled');
	$('#templateAttachment2Header').removeAttr('disabled');
	$('#templateAttachment3Header').removeAttr('disabled');
}

function sendLogTicket(){	
	var isValidated=true;
	var isAlertOpen=false;
	var subject=$('#subjectHeader').val();
	var qsBody = $('#qsBody').val();
	isValidated=validateInputForm('logTicketForm');
	
	if(isValidated==false){
		isAlertOpen=true;
	}
	
	if(subject==''){
		addCssStyles('subjectHeader','Please enter Subject');	
		isValidated=false;
	}else{
		removeCssStyles('subjectHeader');
	}
	if(qsBody==''){		
		$('#qsBody').css('border','1px solid red');
		$('#qsBody').attr('title','Please enter Body');
		
		isValidated=false;
	}else{

		$('#qsBody').css('border','none');
		$('#qsBody').removeAttr('title');
	}
	
	
	var ams=${sessionScope.userSession.partyId};
	if(isValidated==true){		
		var notifyTemplateXML='<root>';
		notifyTemplateXML+='<from>'+$('#communicationName').val()+'</from>';
		notifyTemplateXML+='<fromId>'+$('#communicationId').val()+'</fromId>';
		notifyTemplateXML+='<to>'+'techsupport@fiinfra.in'+'</to>';
		notifyTemplateXML+='<cc></cc>';
		notifyTemplateXML+='<bcc></bcc>';
		notifyTemplateXML+='<phone></phone>';
		notifyTemplateXML+='<subject><![CDATA['+$('#subjectHeader').val()+']]></subject>';
		notifyTemplateXML+='<body><![CDATA['+$('#qsBody').val()+']]></body>';
		notifyTemplateXML+='<replyTo></replyTo>';
		notifyTemplateXML+='<disclaimerText></disclaimerText>';
		notifyTemplateXML+='<dndText></dndText>';

		notifyTemplateXML+='</root>';
		
		
		var notifyTemplateXML2='<root>';
		notifyTemplateXML2+='<from>'+'TechSupport Team '+'</from>';
		notifyTemplateXML2+='<fromId>'+'techsupport@fiinfra.in'+'</fromId>';
		notifyTemplateXML2+='<to>'+$('#communicationId').val()+'</to>';
		notifyTemplateXML2+='<cc></cc>';
		notifyTemplateXML2+='<bcc></bcc>';
		notifyTemplateXML2+='<phone></phone>';
		notifyTemplateXML2+='<subject><![CDATA[Your Ticket is Logged]]></subject>';
		notifyTemplateXML2+='<body><![CDATA[<div>Dear <b>'+$('#communicationName').val()+'</b>, </div><div><br></div><div>&nbsp;</div><div><br></div><div>Thank You. &nbsp;</div> <div><br>Your Ticket is Logged Successfully, Ticket No. is <b>Fiinfra : {!ticketno} <b>,</div><div>&nbsp;</div><div><br>TechSupport Team will get back to you </div><br><br>Warm Regards,&nbsp;<div></div><div></div><div>TechSupport Team .</div>]]></body>';
		notifyTemplateXML2+='<replyTo></replyTo>';
		notifyTemplateXML2+='<disclaimerText></disclaimerText>';
		notifyTemplateXML2+='<dndText></dndText>';
		notifyTemplateXML2+='</root>';


	}
	$('#notifyTemplateXMLHeader').val(notifyTemplateXML);
	$('#notifyTemplateXMLHeader2').val(notifyTemplateXML2);

	
	if(isAttachmentSeleted==1 && isValidated==true){

		$('#logTicketForm').submit();
// 		alert('aaaaaaaams');
// 		$jq_1_9_1('#logTicketForm').ajaxForm({
// 	            success: function(msg) {
// 	            	var recordCount=msg[0];
// 	            	alert('RecordCount------'+recordCount);
// 	            		if(recordCount!='0'){
// 	            				localStorage.setItem('actionName', $('#contextPath').val()+'/index.htm');
// 	            				showAlertMessage("Success", "Mail sent successfully.", "confirmation", redirectFunction);
// 	            				$('.ZebraDialog').css('z-index','9999999999999999');
// 	            			}
	            		
// 	            },
// 	            error: function(msg) {
// 	            }, onComplete: function (data) {
// 	            }
// 	        }).submit();
		
		}else if(isValidated==true){			
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/ping/sendNotification.htm',
				data: $('#logTicketForm').serialize(),
				success : function(result) {
					var recordCount=result[0];
					
	            	if(recordCount!='0'){
	            		$('#popUpDiv').modal('hide');
	            		localStorage.setItem('actionName', $('#contextPath').val()+'/index.htm');
	            		showAlertMessage1("Message", "<br/> Mail sent successfully.", "confirmation", redirectFunction);
	            		$('.ZebraDialog').css('z-index','9999999999999999');	            			            	
       			}
				}
			});
		}else{
			showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error');
			$('.ZebraDialog').css('z-index','9999999999999999');
		}
}



function viewContacts(){

	$.ajax({
		type : 'GET',
		url : $('#contextPath').val()+"/contactus/getContactUsRecord.htm",
		success : function(result){

			var CallUs='';
			var WriteUs='';
			var BUName='';
			var BUAddr='';
			var BUAddr2='';
			var BUAddr3='';
			var BUCity='';
			var BUPostalCode='';
			
			$(result).each(
					function(i, obj) {		
			CallUs=obj.callUs; 
			WriteUs=obj.writeUs;
			
			$('#writeUs').html($("<a>").attr("href", "mailto:" + WriteUs).text(WriteUs));
			BUName=obj.buname;
  			BUAddr=obj.buaddr;
			BUAddr2=obj.buaddr2;
  			BUAddr3=obj.buaddr3;
  			BUCity=obj.bucity;  			
  			BUPostalCode=obj.bupostalCode;  			
  			
		});
			$('#callUs').html(CallUs);

			$('#writeUs').html($("<a>").attr("href", "mailto:" + WriteUs).text(WriteUs));
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

function activateSecurity(){

	var controllIds=$('#idList').val().split(',');
	$(controllIds).each(function(i,obj){
		if(this.replace("[", "").replace("]", "").replace(" ", "")!='')
			$('[id="'+this.replace("[", "").replace("]", "").replace(" ", "")+'"]').remove();
	});
}

</script> 
<script>
$(document).ready(function() {
	
	$(".trouble_ticket").on("click",function(){
		$("#popUpDiv").modal({      
     "show" : true  ,
    });
	});
	
	$("#test").on("click",function(){
		alert("test");
	});
	
	
	
	 $(".contact_details").on("click", function() {
       $("#ContactMenu").modal({      
     "show" : true  ,
    });
	viewContacts();
	});
	
	
	$('input[type="file"]').ace_file_input({
					no_file:'No File ...',
					btn_choose:'Choose',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false 
				});
   

	
	
	$.ajax({
	
		type : "GET",
		url : '${pageContext.request.contextPath}/pg/getHeaderSubxData.htm',
	
		success : function(result) {
			
			bindSubxDiv1(result);
		}
	});
});
function bindSubxDiv1(data){
	
	if(data&&data['activeSubx']!=null){
	$('#subxDiv').html('<span style="color:#B03060">'+data['activeSubx']+' &nbsp;</span><br> '+'<a href="${pageContext.request.contextPath}/partnerprofile.htm?view=subx">'+data['recharge']+'</a>');
	}
}
</script> 
<script type="text/javascript">

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

<c:choose>
<c:when test="${sessionScope.userSession.successfulLoginCount lt 1 and sessionScope.userSession.recordtypeId eq 14003}">
 <script>
 $('#navbar').remove();
 //$('#main-container').remove();
 $('#linkbar').remove();
 $('#sidebar').remove();
 </script>
</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>
