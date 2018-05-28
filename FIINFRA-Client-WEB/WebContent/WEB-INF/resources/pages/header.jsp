<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main-style.css"	 />
<link rel="stylesheet"
	href="${_cdn}/assets/css/datepicker.css"	 />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dummy.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css"
	type="text/css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/chat.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main-style.css"
	type="text/css" />
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css"
	type="text/css" /> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css"
	type="text/css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rangeslider.css"
	type="text/css" />	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css"
	type="text/css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/selectboxit.css"
	type="text/css" />
<link rel="stylesheet" href="${_cdn}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fontcustom.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/ui.jqgrid.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fullcalendar.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fullcalendar.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/ui-custom.css"/>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive-calendar.css" /> --%>
<!-- text fonts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/Easy-Responsive-Tabs-to-Accordion-master/css/easy-responsive-tabs.css" />

<%-- <link rel="stylesheet" type="text/css" href="${_cdn}/assets/css/easy-responsive-tabs.css" /> --%>

<!-- ace styles -->
<link rel="stylesheet" href="${_cdn}/assets/css/ace.css"
	class="ace-main-stylesheet" id="main-ace-style" />
	<link rel="stylesheet" href="${_cdn}/assets/css/ace.min.css"/>

<!--[if lte IE 9]>
   <link rel="stylesheet" href="${_cdn}/assets/css/ace-part2.css" class="ace-main-stylesheet" />
  <![endif]-->

<!--[if lte IE 9]>
    <link rel="stylesheet" href="${_cdn}/assets/css/ace-ie.css" />
  <![endif]-->
<link rel="stylesheet" href="${_cdn}/assets/css/ui-custom.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/custom.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/custom_responsive.css">
<link rel="stylesheet" href="${_cdn}/assets/css/theme.css"/>
<%
	UserSession _USER = AuthHandler.getCurrentUser();
%>
<Script>
  function onLogout(){
		showConfirm(" Are you sure you want to logout from client portal?", function() {
			window.location.href="${pageContext.request.contextPath}/sign-out?buId=<%=_USER.getBuId()%>";
		});
  }
</Script>


<%
	String defaultOwnerLogo = request.getContextPath() + "/"
			+ "resources/images/temp_logo.png";
	String defaultBuLogo = request.getContextPath()+"/"+"resources/images/add2.png";
	String defaultOwnerImage = request.getContextPath() + "/"
			+ "resources/images/photo.jpg";

	String ownerLogo = FiinfraUtility.getImagePath(request,
			_USER.getOwnerLogo(), defaultOwnerImage);
	String ownerImage = FiinfraUtility.getImagePath(request,
			_USER.getOwnerPhoto(), defaultOwnerImage);
	String userImage = FiinfraUtility.getImagePath(request,
			_USER.getPhoto(), defaultOwnerImage);
	
	String theme =_USER.getThemeName()+"_"+_USER.getThemeId(); 
%>

<%-- 
	  <div >
	<header>
      <div id="top">
        <a class="logo" href="${pageContext.request.contextPath}/profile/dashboard">
            <span id="logo"> <img id = "ownerLogo"  /></span><!-- end of "logo" id -->
        </a>
        
        <div id="advt2">
          <% if(!StringUtils.isEmpty(_USER.getBuLogo())){ %>
        	  <img id="buLogo" src = "<%=FiinfraUtility.getImagePath(request, _USER.getBuLogo(), null)%>" /> 
        	<%} %>
        </div><!-- end of "advt1" id -->
	        <a href="${pageContext.request.contextPath}/sign-out">
	        <div id="log-out" onClick="onLogout()" class="fr">
	            <img class="logout" src="${pageContext.request.contextPath}/resources/images/transparent.png" />	           
	            <p>Logout</p>            
	        </div>
	       <!--  </a> --> 
             <div id="ifa-image" class="clearfix fr">
        	<img id = "ownerImage"   class="clearfix fl"/>
          <div style="display: inline-block;">  <span class="ifa-name clearfix"><%=_USER.getOwnerName()%></span>
            <span class="ifa-advisor clearfix">(Your Advisor)</span></div>
            <div class="advisor_submenu">
      			<div class="menu_section">
        			<ul class="clearfix reset">
          			<li class="menu alert clearfix">
          			<div class="anch clearfix">
            		<div class="title">Your Advisor</div>
            		</div></li>
          		<li class="menu"><div class="bg"><span class="label">Name:</span> <span class="txt"><%=_USER.getOwnerName()%></span></div></li>
          		<li class="menu"><div class="bg"><span class="label">Contact no:</span> <span class="txt"><%=CommonUtils.emptyIfNull( _USER.getOwnerMobile())%></span></div></li>
          		<li class="menu"><div class="bg"><span class="label">Email:</span> <span class="txt"><%=CommonUtils.emptyIfNull(_USER.getOwnerEmail())%></span></div></li>
        </ul>
      </div>
    </div>
        </div>
     </div> 
     </header>
     </div>
     --%>
<!-- header new starts -->
<%
	String cdn = AppConstant.cdn;
	if (StringUtils.isEmpty(cdn)) {
		cdn = request.getContextPath();
	}
	//request.setAttribute("_cdn", cdn);
	request.setAttribute("_cdn", request.getContextPath().substring(0, request.getContextPath().lastIndexOf("/"))+"/FIINFRA-Welcome/resources");
%>
</head>
<!-- page specific plugin styles -->
<!-- ace settings handler -->
<body class="no-skin <%=theme%>">
	<!-- #section:basics/navbar.layout -->
	<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
		<div class="navbar-container" id="navbar-container">
			<!-- #section:basics/sidebar.mobile.toggle -->
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler" data-target="#sidebar">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

            <div class="navbar-header pull-left"> 
          <!-- #section:basics/navbar.layout.brand -->
          <ul class="nav ace-nav">
        
        <!-- #section:basics/navbar.user_menu -->
       <li class="light-blue"> <a data-toggle="dropdown" href="#" class="dropdown-toggle"> <img class="nav-user-photo" src="" id="ownerImage" alt="Jason's Photo" />
        <span class="user-info"><%=CommonUtils.emptyIfNull(_USER.getOwnerName())%><small><em>(Your Advisor)</em></small> </span>
         <i class="ace-icon fa fa-caret-down"></i> </a>
              <ul class="user-menu dropdown-menu-left dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
            <li> <a href="#"> <i class="ace-icon fa fa-phone"></i><%=CommonUtils.emptyIfNull(_USER.getOwnerMobile())%></a> </li>
            <li class="divider"></li>
            <li> <a href="#"> <i class="ace-icon fa fa-user"></i><%=CommonUtils.emptyIfNull(_USER.getOwnerEmail())%></a> </li>
            
          
          </ul>
            </li>
        
        <!-- /section:basics/navbar.user_menu -->
      </ul>
          
          <!-- /section:basics/navbar.layout.brand --> 
          
          <!-- #section:basics/navbar.toggle --> 
          
          <!-- /section:basics/navbar.toggle --> 
        </div>

		
			<!-- #section:basics/navbar.dropdown -->
			<div class="navbar-buttons navbar-header pull-right"
				role="navigation">
				<ul class="nav ace-nav">
				<li class="dark-opague"> <a href="${pageContext.request.contextPath}/query/list"> <i class="ace-icon fa fa-question icon-animated-vertical" title="Query" alt="Query"></i> <span class="txt"> Query</span><!--<span class="badge badge-grey">4</span>--> </a> </li>
               <li class="dark-opague"> <a href="${pageContext.request.contextPath}/common/alerts"> <i
							class="ace-icon fa fa-bell icon-animated-bell"></i> 
                <span class="txt"> Alerts <span class="badge badge-important">${alertCount}</span></span></a> </li>
               <li class="dark-opague">   <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <i class="ace-icon fa fa-bolt"></i>
            <span class="txt">Quick Links</span>
            </a>
          <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
            <li class="dropdown-header"> <i class="fa fa-bolt"></i> Quick Links </li>
            <li class="dropdown-content">
              <ul class="dropdown-menu dropdown-navbar">
                <li> <a href="${pageContext.request.contextPath}/common/announcement"> <i class="fa fa-bullhorn"></i>Announcements  </a> </li>
                <li> <a href="#" > <i class="ace-icon fa fa-headphones"></i> Soft Advice </a> </li>
                <li> <a href="${pageContext.request.contextPath}/question/feedback" > <i class="fa fa-folder-open"></i> Feed Back </a> </li>
                <li> <a href="<%=request.getContextPath()%>/common/FAQs" > &nbsp;<i class="ace-icon fa fa-question"></i>&nbsp;
                  FAQ's </a> </li>
              </ul>
            </li>
          </ul>
        </li>

					<!-- #section:basics/navbar.user_menu -->
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							id="userImage" alt="Jason's Photo" />
							<span class="user-info"> <small>Welcome,</small> <%=_USER.getName()%></span>
							<i class="ace-icon fa fa-caret-down"></i>
					</a>
						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<!-- <li> <a href="#"> <i class="ace-icon fa fa-cog"></i> Settings </a> </li>-->
							<li><a href="${pageContext.request.contextPath}/profile/">
									<i class="ace-icon fa fa-user"></i> Profile
							</a></li>
							<li class="divider"></li>
							<li><a  href="${pageContext.request.contextPath}/sign-out" > <i
									class="ace-icon fa fa-power-off"></i> Logout
							</a></li>
						</ul></li>
					<!-- /section:basics/navbar.user_menu -->
				</ul>
			</div>
			<!-- /section:basics/navbar.dropdown -->
		</div>
		<!-- /.navbar-container -->
	</div>
	<!-- /section:basics/navbar.layout -->
        <script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.min.js"></script>
	<script src="${_cdn}/assets/js/jquery.min.js"></script> 
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.bxslider.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/selectboxit.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.ui.touch-punch.js"></script>
<script>
		  $(function() {
			  $("#ownerLogo").attr("src", "<%=ownerLogo%>").error(function(e) {
				  $( "#ownerLogo").unbind();
				  $("#ownerLogo").attr("src", "<%=defaultOwnerLogo%>");
				});
			 <%--  $("#buLogo").attr("src", "<%=buLogo%>").error(function(e) {
				  $( "#buLogo").unbind();
				  $("#buLogo").attr("src", "<%=defaultBuLogo%>");
				}); --%>
			  $("#ownerImage").attr("src", "<%=ownerImage%>").error(function(e) {
				  $( "#ownerImage").unbind();
				  $("#ownerImage").attr("src", "<%=defaultOwnerImage%>");
				});	 		  
			  $("#userImage").attr("src", "<%=userImage%>").error(function(e) {
				  $( "#userImage").unbind();
				  $("#userImage").attr("src", "<%=defaultOwnerImage%>");
				});	
		  });
	  </script>
</body>
</html>
<!-- header ends -->
