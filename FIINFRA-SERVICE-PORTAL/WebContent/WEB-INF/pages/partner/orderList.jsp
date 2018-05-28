<%@page import="in.fiinfra.pg.OrderData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.*"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
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
<title>Manage Orders</title>
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>-->

<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/style_serviceportal_partner.css" rel="stylesheet">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/css/popup.css" />
<!--<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->



<!-- <style>
.dropdown-menu
{
left:-165px !important;
}
</style> -->

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->


</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<!--css popup window start 1-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 450px; height: 380px; top: 100px"
		id="popUpDiv">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpDiv');" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>

		<div id="popupwrapper_contactform">

			<div class="heading_contactform">
				<h3>Log Trouble Ticket</h3>
			</div>
			<div id="poptable_contactform">

				<div class="full">
					<input type="text" class="form-control" placeholder="Subject">
				</div>
				<div class="full">
					<textarea class="form-control" rows="3" placeholder="Your Question"
						style="height: 100px;"></textarea>
				</div>
				<div class="full">
					<input type="text" class="form-control" placeholder="Attach File">

				</div>
			</div>
			<div class="topbuttonholder">
				<form>
					<input class="dbtn" value="Send Email" id="loginButton"
						type="button"> <input class="dbtn" value="Cancel"
						onClick="popup('popUpDiv')" id="loginButton" type="button">
				</form>
			</div>

		</div>
	</div>
	<!--css popup window 1 close-->
	<!--css popup window start 2-->




	<div class="container white">
		<div class="container-head">
			<div class="col-md-12" style="text-align: right;">
				<!-- accordion start-->

				<div class="accordion pull-left col-md-12" id="accordFundSel">
					<div class="accordion-group">
						<div class="pull-left fundtool_left_col_head ">
							<span style="float: left;">Subscribed Products for ${partnerName}
							</span>
						</div>
						<div style="height: auto;" id="collapseFundSel"
							class="accordion-body pull-left serchboxnew collapse">
							<div class="accordion-inner">
								<div style="width: 1211px;">
									<!--1 search start -->
									<div class="filterbox searchpadding ">
										<div class="head">Filter</div>
										<div class="drop_box_body">
											<ul class="nav  nav-stacked">

												<li><input id="15Large" value="15Large" type="checkbox"
													checked> Date Range</li>
												<li><input id="15Large" value="15Large" type="checkbox"
													checked> Status</li>

											</ul>
										</div>
									</div>
									<div class="filterbox searchpadding">
										<div class="head">Date Range</div>
										<div class="drop_box_body">
											<span class="searchtext"> Start Date</span> <input
												name="text" type="text" id="fname" class="form-control"
												value="" /> <span class="searchtext"> End Date</span> <input
												name="text" type="text" id="fname" class="form-control"
												value="" /> <br>
										</div>
									</div>
									<div class="filterbox searchpadding">
										<div class="head">Status</div>
										<div class="drop_box_body">
											<ul class="nav  nav-stacked">
												<li><input id="15Large" value="15Large" type="checkbox"
													checked> New</li>
												<li><input id="15Large" value="15Large" type="checkbox">
													Open</li>
												<li><input id="15Large" value="15Large" type="checkbox"
													checked> Cancelled</li>
												<li><input id="15Large" value="15Large" type="checkbox">
													Converted</li>


											</ul>
										</div>
									</div>
								</div>
								<div class="box_button pull-left">
									<button type="button" id="updatefilterlist" class="btn">Show</button>
								</div>
							</div>
							<!-- accordion-inner END -->
						</div>
						<!-- accordion-body END -->
					</div>
					<!-- accordion-group END -->
				</div>
				<!-- accordion  END -->


				<!-- accordion End -->
			</div>
		</div>

		<div class="container-body">

			<!-- center  part -->
			<span class="list-group"></span>
			<div class=" col-md-3 sidebar-offcanvas" role="navigation"
				style="margin-top: 10px; padding-left: 10px;">
				<div class="list-group">
				   
					<a href="${pageContext.request.contextPath}/subx/list?partyId=${partyId}" class="list-group-item "><strong>Subscriptions</strong></a> 
					<%-- <a href="${pageContext.request.contextPath}/subx/order?partyId=${partyId}" class="list-group-item active">Transactions</a> --%>	 
					<a href="${pageContext.request.contextPath}/subx/paymentList?partyId=${partyId}" class="list-group-item">Payments</a>
				</div>

			</div>

 <div class="col-md-9" style="margin-top: 10px; padding-left: 10px;">

				<!-- center -->

				<div class="list-group">
				<div class="list-group-item">
		<div class="table-responsive" id="display_table_lead" style="border:none; min-height: 200px;">
		  <div id="toreload">


						<display:table id="data" name="orderData" requestURI="#"
							sort="list" class="table table-hover table-bordered table-striped"
							cellpadding="0" cellspacing="0" pagesize="${size}" >
							<%-- <display:column sortable="true">
								<a href="#" onclick="editNote();" ><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" 
									title="Edit" onclick="sendToEditPartner('${data.partyID}','${data.firstName}','${data.lastName}','${data.city}','${data.contactEmail}','${data.contactMobile}','${data.pstName}','${data.pstSn}','${data.pktName}','${data.pktSn}','${data.potName}','${data.potSn}','${data.rmName}','${data.rmSn}','${data.rmHeadName}','${data.rmHeadSn}','${data.opp}','${data.client}','${data.pclient}','${data.isActive}','${data.companyName}','${data.arn}','${data.euin}','${data.location}','${data.pstTeamMemberId}','${data.pktTeamMemberId}','${data.potTeamMemberId}','${data.rmTeamMemberId}','${data.rmHeadTeamMemberId}');getPSTPKTPOTwhileEditing();getEditLocation();searchPSTPKTPOTwhileEditing(42001);searchPSTPKTPOTwhileEditing(42002);searchPSTPKTPOTwhileEditing(42003);searchPSTPKTPOTwhileEditing(42004);searchPSTPKTPOTwhileEditing(42007);popup('popUpAlertaddnote');"></a>
							</display:column><!-- popup('popUpAlertaddnote'); --> --%>

							<%-- <display:column sortable="true">
								<span class="thead"> <input id="chkdeleteselect" type="checkbox"
									name="chkdeleteselect" value="${data.partyID}">
								</span>
							</display:column> --%>
							<%-- <display:column
								title="<input type='checkbox' id='selecctall' name='selecctall'/>">
								<span class="thead"> <input type="checkbox"
									id="chkdeleteselect" class="checkbox1" name="chkdeleteselect"
									value="${data.partyID}">
								</span>
							</display:column> --%>
							
								<span class="thead"> <input id="username" type="hidden"
									name="orderNO" value="${data.orderNO}">
								</span>
							
					
								<span class="thead"> <input id="lastLogin" type="hidden"
									name="orderNO" value="${data.orderNO}">
								</span>
						

							<display:column sortable="true" title="Order Number"  property="orderNO">
							<%-- 	<span>${data.orderNO}</span>
								<span>${data.orderStatus}</span> --%>
							</display:column>
							<display:column sortable="true" title="Order Date" property="orderDttm"  format="{0,date,dd-MMM-yy HH:mm }" ></display:column>
								
							<display:column sortable="true" title="Order Amount" property="orderAmount"></display:column>

							<display:column sortable="true" title="Order Status" property="orderStatus"></display:column>
							
							<display:column sortable="true" title="Order Details"  property="orderDetails[0].productName">
							<%-- <span>${data.paymentFrequencyId}</span>  --%>
							</display:column>
						</display:table>
       
        <!-- Center-->    
     </div> 
     </div> 
     
     <div class="col-sm-6" >

        <ul class="pagination pagination-sm"  style="float:left; margin-right:20px;">
  
    </ul>	
  


<div class="topmenuleft" >
 <div  class="customDropdown">
       <span >Page Size:</span>&nbsp;
       <select  type="button" name="pageSize" id="page" onchange="pagesizeurl()">
         
           <option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
           <option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
               <option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
               <option value="100" <c:if test="${size==100}"> selected="selected" </c:if>>100</option>
               <option value="10000">Show All&nbsp;</option>
   </select>
       
     
    		 </div>	
		</div>
	</div>
		<br /> <br />
	</div>
	</div>
</div>
</div> 
	<!--css popup window start 2-->




	<div style="display: none;" id="blanket"></div>
		<!-- End-->


		<!-- Center part End -->



		<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>

		<script type="text/javascript">
	
	function close(){
		$("#addnote").hide();
	}
	function eresetval(){
		
	}
	function resetval(){
		
	}
	
	function addNote(){

		$("#addnote").show();


		$("#deletenote, #editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
		$("#popUpAlertaddnote").css ('height','750px')
		$("#popUpAlertaddnote").css ('width','650px')
		$("#popUpAlertaddnote").css ('left','350px');
		$("#popUpAlertaddnote").css ('left','445px');
		$("#popUpAlertaddnote").css ('top','20px');
		$('#ActionMenu6').hide();
		}

	
	function addSubx(savendclose)
	{
		 
		console.log($('#subx-form').html());
	     var data = $('#subx-form').serialize();
			  $.ajax({
					 type :'POST',
					 dataType: 'json',
					 data : data,
			         url : "${pageContext.request.contextPath}/subx/save",
					 success : function(result)
					 {
						 if(result=='success'){
							 alert('Subscription added.');
							 window.href="${pageContext.request.contextPath}/subx/list?partyId=${partyId}"
						 }else{
							 alert(result);
						 } 
				}
				});
		 
	}
</script>
</body>
</html>