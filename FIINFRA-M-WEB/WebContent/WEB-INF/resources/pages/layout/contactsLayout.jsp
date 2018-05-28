<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<link rel="shortcut icon" href="${_cdn}/assets/images/common-images/favicon.ico" />

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/basic.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/jquery-ui.css" /> 
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/custom.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/main.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/responsive.css" />



<%-- <link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
 <link type="text/css" rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" /> --%>



<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>

<script src="${_cdn}/assets/js/common-js/plugin/jquery-1.11.0.min.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/jquery-ui.js"></script> 
<script	src="${_cdn}/assets/js/common-js/plugin/toggles.js"></script>
<script	src="${_cdn}/assets/js/common-js/my_account_submenu.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/selectboxit.js"></script>
<%-- <script src="${_cdn}/assets/js/common-js/plugin/jquery.slimscroll.js"></script> --%>
<script	src="${_cdn}/assets/js/common-js/plugin/perfect-scrollbar.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/jquery.mousewheel.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.ui.touch-punch.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/jquery.form.js"></script>
<script src="${_cdn}/assets/js/common-js/common_modal.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.placeholder.js"></script>
<!-- <style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
</style> -->
<script type="text/javascript">
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
	    <spring:message code="${success}" var="success"/>
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
	    <spring:message code="${error}" var="error"/>
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

	var hitCnt = $("#hitCount").val();
	if(hitCnt == '0') 
	{
	var resultList = '${result}';
	if(resultList != null && resultList != ""){
	 var resultArray = resultList.split("[");
	 var resultArray1 = resultArray[1].split("]");
	 var resultArray2 = resultArray1[0].split(",");
		if(resultArray2[0]>0){
			$("#successDialog").html("Client Portal activated successfully.");
			$( "#successDialog").dialog( "open" );
			
		}else if(resultArray2[1]==1){
			$("#successDialog").html("Client Portal already activated for one or more contact from the list.");
			$( "#successDialog").dialog( "open" );
			
		}else if(resultArray2[2]==1){
			$("#successDialog").html("Client Portal already activated for one or more contact from the list.");
			$( "#successDialog").dialog( "open" );
			
		}
		$("#hitCount").val("1");
	}
	}
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

function addContact(){
	var nodeID = '${nodeId}';
	if(nodeID>0)
	{
		$("#successDialog").html("Please select partner first from Hierarchy to add contact");
		$( "#successDialog").dialog( "open" );
	}
	else{
	window.location.href = "${pageContext.request.contextPath}/partner/contact/add";
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
<div class="wrapper" id="contact_list_wrapper">
  <section class="main">
    <header class="common_header inner_header">
      <tiles:insertAttribute name="header"/>
      <!--div class="main-content"-->
      	<div class="page_header clearfix">
						<!-- #section:settings.box -->
						
						<!-- /section:settings.box -->
						<div class="heading"><!-- page-header -->
							<!--h1><i class="ace-icon fa fa-list bigger-50"></i-->
								<!--List Of Contacts
								small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small-->
                                
                                
                                <!--a href="#" class="drop_menu"></a--> 
                                <span class="head_txt"><tiles:insertAttribute name="pageHeader" ignore="true" /><div class="title">${headerName}</div></span> 
                                <span class="heading_icon"><span class="head_icon"> <i class="ace-icon fa fa-phone bigger-150"></i></span></span>
                                  <c:if test="${userSession.headOfNode}">
                                  <div class="hierarchy-submenu-main-bx"> <img class="hierarchy-submenu-btn" src="${_cdn}/assets/images/common-images/hie-dropdown.png" width="37" height="29" alt="">
                                    <div class="hierarchy-submenu-bx" style="display:none;">
                                     <div class="hierarchy-submenu-bx-in">
                                     <div id="jstree1" > </div>
                                      </div>
                                    </div>
                                    </div> 
                           
                                    
                                    
                                   </c:if>
							<c:if test="true">
								<!-- ***********************************************************************************************************************-->

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
								<!-- small SUB-MENU -->
								<!-- /.ace-settings-container -->
								<!-- ***********************************************************************************************************************-->

							</c:if>
							
							
							<c:if test="false">
								<!-- ***********************************************************************************************************************-->

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
								<!-- small SUB-MENU -->
								<!-- /.ace-settings-container -->
								<!-- ***********************************************************************************************************************-->

							</c:if>
							
							
							

							<button class="header_btn btn btn-sm btn-inverse listOfContactsBulkDeleteLink" id="bulk_delete"  onClick="ConfirmDeletion()" style="<c:if test="${totalContacts<=0}">display:none;
                                  </c:if>
                                  "> <i class="ace-icon fa fa-list bigger-50"></i> Bulk Delete
                                  </button>
                                  <button class="header_btn btn btn-sm btn-inverse listOfContactsAddContactLink" id="add_contact" onclick="return addContact();"> <i class="ace-icon fa fa-list bigger-50"></i> Add Contact</button>
                                  <button class="header_btn btn btn-sm btn-inverse listOfContactsActivateDCLink" id="activate_dc" onclick="activateDCT();" style="width: 190px;<c:if test="${totalContacts<=0}">display:none;
                                  </c:if>
                                  " > <i class="ace-icon fa fa-list bigger-50"></i> Activate Client Portal
                                  </button>
                                  <button class="header_btn btn btn-sm btn-inverse" id="xray_activate" onclick="XrayActivation();"  style="<c:if test="${totalContacts<=0}">display:none;
                                  
                                  </c:if>
                                  "> <i class="ace-icon fa fa-list bigger-50"></i>Activate X-Ray
                                  </button>
                                
							<!--/h1-->
						</div><!-- /.page-header -->
	   </div><!--/div-->
       
       
       
                    

    </header>
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
  </section>
</div>
<div id="invalidAgeDialog" class="common_dialog" style="text-align: center;"> </div>
<div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
</body>
</html>