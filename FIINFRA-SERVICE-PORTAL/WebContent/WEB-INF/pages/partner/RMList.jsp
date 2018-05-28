<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>RM LIST</title>
<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script  type="text/javascript" src="<%=request.getContextPath()%>/js/googleChartApi.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>
<%-- <script type="text/javascript"	src="<%=request.getContextPath()%>/js/nicEdit.js"></script> --%>

<script type="text/javascript">
 var $jq_1_9_1 = $.noConflict();
</script>
<script type="text/javascript">
$jq_1_9_1(".choose1").live("click", function () {
    clearTimeout( hidePopupTimeoutId );
    
    var id=$jq_1_9_1(this).attr('id');
    id="#tracker_"+id;
    $jq_1_9_1(id).show();
});


		$jq_1_9_1(".choose1").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
    	 var id=$jq_1_9_1(this).attr('id')
    	    id="#tracker_"+id;
    	    $jq_1_9_1(id).show();
    },500);
});

$jq_1_9_1(".tracker1").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});
 

$jq_1_9_1(".tracker 1").live("mouseleave", function() {
    $jq_1_9_1(".tracker1").hide();
});


</script>
<style>
#ui-id-1 {
	width: 168px !important;
	/* padding-left: 20px !important; */
}

#ui-id-2 {
	width: 168px !important;
	/* padding-left: 24px !important; */
}

.ui-menu-item {
	list-style: none !important;
}

.ui-corner-all {
	margin-left: -10px !important;
}

.ui-helper-hidden-accessible {
	color: #000;
}
div.ui-datepicker{
font-size:10px;
left: 609px !important;
/*width: auto !important;*/
}
.ui-datepicker .ui-datepicker-prev span, .ui-datepicker .ui-datepicker-next span{
	left:80% !important
}
.ui-datepicker .ui-datepicker-header{
	float:right;
	width:167px !important;
}

#poptable_contactform1{
float: left;
width: 100%;
background-color: #f5f5f5;
margin: 0 10px 10px 0px;
height:320px;
}
/* .pcf{
padding: 10px !important;
height: 325px !important;
}
.newpcf{
padding: 10px !important;
height: 425px !important;
} */
</style>
<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />
<!-- -responsive css-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>-->
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>


<!-- <link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon"> -->



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"> -->

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 650px; height: 450px; top: 100px" id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		

	

	</div>
	<!--css popup window 2 close-->


	<div class="container">
		<div class="portfoliostrip collapse navbar-collapse">
			<ul class="navbar-sub">
				<%-- <li id="SPCodeTypeLink"><a href="<%=request.getContextPath()%>/codetype/loadcodetypedata.html">Code Type</a></li> --%>
<%-- 						<li id="SPRTAFileUploadLink" ><a href="<%=request.getContextPath()%>/seret/getUploadHistory.htm">RTA File Upload</a></li> --%>
<%-- 					<li id="SPPrePrintedFormloadLink" class="active" ><a href="<%=request.getContextPath()%>/preprintedform/loadPrePrintedForm.htm">Moniter PrePrintedForm</a></li>	 --%>
<%-- 					<li id="SPOpeEmailSmsNotMontLink"   ><a href="<%=request.getContextPath()%>/loggedinuser/loadEmailSmslist.htm">Email/SMS Notification Monitor</a></li> --%>
<%-- 				    <li id="SPOpeMontLoggInUserLink"  onclick = "drawChart();"  ><a href="<%=request.getContextPath()%>/loggedinuser/loadLoggedInUserList.htm">Monitor Logged In Users</a></li> --%>
                   
			</ul>
		</div>
	</div>
	<!-- Center part start -->
	<div class="page-header">
				<h1 class="pull-left"><B>RM List</B></h1>
         	    <div class="clearfix"></div>
        </div>
	<section>
		<div class="container">
<!-- 		<div class="container-head" id="abcdefg"> -->
<!-- 				<div class="col-md-12" style="text-align: right;"> -->
<!-- 					accordion start -->

<!-- 					<div class="accordion pull-left col-md-12" id="accordFundSel"> -->
<!-- 						<div class="accordion-group"> -->
<!-- 						<form id="searchs" method="post"> -->
<!-- 							<div class="col-md-11" style="width: 96%;"> -->
<!-- 								<span style="float: left;">RM LIST</span> <span -->
<!-- 									class="col-md-10" style="float: right; margin-top: -3px;"> -->
<!-- 									<input name="searchtext" type="text" id="tags"
<!-- 									placeholder="Quick Search"> --> 
<!-- 								</span> -->
<!-- 							</div></form> -->
	
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="container-body" style="margin-top: 0px;">
				<!-- center -->
     	<div class="ui-id-1" >
     
        </div>  

				
				<div class="topmenu">

				<!-- 	<a id="SPProdRevMasterAddLink" href="#" onClick="getRevenueType(0);getRecordType(0);addNote();resetValues();"><input data-params="{}"
						type="button" class="dbtn createNewBtn"	value="  New Product Revenue  "		onClick="popup('popUpAlertaddnote')" title="New Product Revenue"	alt="New Product Revenue"></a>
				 -->	<!-- <a id="SPProdRevMasterDeleteLink" href="#"	onClick="deleteNote();"><input data-params="{}" type="button"
						class="dbtn deleteBtn" value="  Delete"
						onClick="popup('popUpAlertaddnote')" title="Delete" alt="Delete"></a> -->
				</div>

				<div class="table-responsive" id="display_table_lead"
					style="border: none;">
					<div id="toreload">
						<display:table name="rmData" uid="objPortalUser" class="table table-hover table-bordered table-striped"
								requestURI="#" sort="list" pagesize="${size}" id="data">
							
							<display:column title="First Name" property="firstName" sortable="true"></display:column>
							<display:column title="Last Name" property="lastName" sortable="true"></display:column>
							<display:column title="Email ID" property="emailCommunicationID" sortable="true"></display:column>
							<display:column title="Contact Mobile" property="contactMobile" sortable="true"></display:column>
							<%-- <display:column title="Form Path" property="formPath" sortable="true"></display:column> --%>
<%-- 							<display:column title="Generated On" property="generatedOn" sortable="true"></display:column> --%>
							
							 <display:column title="RM Dashboard"  sortable="true">
							 
							 <a class="choose1" href="<%=request.getContextPath()%>/dashboard/getRmDashboard.htm?rmname=${data.firstName}&lastname=${data.lastName}&partyID=${data.partyID}" id="${data.partyID}">RM Dashboard </a> 
							 </display:column> 
<%-- 								<display:column title="RM Dashboard"  > --%>
								
<%-- <%-- 							<a class="choose1" href="<%=request.getContextPath()%>/dashboard/getRmDashboard.htm?rmname=${data.firstName}&lastname=${data.lastName}&partyID=${data.partyID}" id="${data.partyID}">RM Dashboard </a> --%> 
								
								
<%-- 							</display:column> --%>
							
						</display:table> 
					
					</div>
				</div>

				<div class="col-sm-7">

					



					<div class="topmenuleft">
						<div class="customDropdown">
							<span>Page Size:</span>&nbsp; 
							<select  type="button" name="pageSize" id="page" onchange="pagesizeurl();">
								<option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
								<option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
								<option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
								<option value="100" <c:if test="${size==100}"> selected="selected" </c:if>>100</option>
								<option value="500" <c:if test="${size==500}"> selected="selected" </c:if>>500</option>
								<option value="10000">Show All&nbsp;</option>
							</select>
						</div>
					</div>
					<div class="topmenuleft">

						<ul>
<!-- 							<li>Export options:</li> -->
<%-- 							<li><a href="<%=request.getContextPath()%>/preprintedform/prePrintedExecl?type=excel" title="Export in CVS" alt="Export in CVS"><i --%>
<!-- 									class="cvsicon"></i></a></li> -->
<%-- 							<li><a href="<%=request.getContextPath()%>/preprintedform/prePrintedExecl?type=CSV" title="Export in Excel" --%>
<!-- 								alt="Export in Excel"> <i class="excelicon"></i></a></li> -->
							
						</ul>



					</div>
				</div>
			
			</div>

		</div>
	</section>
	<!-- Center part End -->
<script >
function pagesizeurl(){
	  var pageSize=$('#page').val(); 
	   window.location.href= $('#contextPath').val()+'/partnersp1/loadRMlist.htm?pageSize='+pageSize;
	 }
</script>



	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">


</body>
</html>