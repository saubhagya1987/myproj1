<%@page import="java.util.Date"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="org.eclipse.birt.report.model.activity.Command"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
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
<title>Manage Payment</title>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->
<script>
	$(document).ready(function(){
			
		 $("#createdDate").datepicker();
	});
</script>
<style>
	/* Style For Modified Select Dropdown */ 
.s-hidden {visibility:hidden;padding-right:10px;}
.select {cursor:pointer;display:inline-block;position:relative;font:normal 11px/22px Arial, Sans-Serif;color:#666;/* border:1px solid #ccc; */width:100%;
background-color: rgb(255, 255, 255);border: 1px solid rgb(204, 204, 204);box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;transition: border 0.2s linear 0s, box-shadow 0.2s linear 0s;border-radius: 3px; }
.styledSelect {position:absolute;top:0;right:0;bottom:0;left:0;background-color:white;padding:0 10px;font-weight:bold;border-radius:3px;box-shadow: 0 0 5px #DDD inset;}
.styledSelect:after {content:"";width:0;height:0;border:5px solid transparent;border-color:black transparent transparent transparent;position:absolute;top:9px;right:6px;}
.styledSelect:active, .styledSelect.active {background-color:#eee;}
.options {display:none;position:absolute;top:100%;right:0;left:0;z-index:999;margin:0 0;padding:0 0;list-style:none;border:1px solid #ccc;border-radius:5px ;background-color:white;-webkit-box-shadow:0 1px 2px rgba(0, 0, 0, 0.2);-moz-box-shadow:0 1px 2px rgba(0, 0, 0, 0.2);box-shadow:0 1px 2px rgba(0, 0, 0, 0.2);}
.options li {padding:0 6px;margin:0 0;padding:0 10px;}
.options li:hover {background-color:#39f;color:white;border-radius:5px;font-weight: bold; }
	/* End Of Style For Modified Select Dropdown */
</style>

<!-- <style>
.dropdown-menu
{
left:-165px !important;
}
</style> -->

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">



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
						<!-- <div class="accordion-heading" style="float: right;">
							<a class="accordion-toggle " data-toggle="collapse"
								data-parent="#accordFundSel" href="#collapseFundSel"> <span
								style="margin-top: 0px;" class="searchicon" alt="Search"
								title="Search"></span>
							</a>
						</div> -->
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
					<%-- <a href="${pageContext.request.contextPath}/subx/order?partyId=${partyId}" class="list-group-item ">Transactions</a> --%>	 
					<a href="${pageContext.request.contextPath}/subx/paymentList?partyId=${partyId}" class="list-group-item active">Payments</a>
				</div>

			</div>
			<div class="col-md-9" style="margin-top: 10px; padding-left: 10px;">

				<!-- center -->

				<div class="list-group">
				<div class="list-group-item">
					<div class="topmenu">

<!-- <a id="SPDeletePartnerLink" href="#" onClick="deleteNote();" ><input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  onClick="deletePartners();" title="Delete" alt="Delete"></a> -->

</div >
		<div class="table-responsive" id="display_table_lead" style="border:none; min-height :250px;  ">
		  <div id="toreload">

	
						<display:table id="data" name="paymentData" requestURI="#"
							sort="list" class="table table-hover table-bordered table-striped"
							cellpadding="0" cellspacing="0" pagesize="${size}" style="margin-top : 20px ! important;" >
							
							<display:column sortable="true" title="Payment Date Time"  property="pGRequestDttm"  format="{0,date,dd-MMM-yyyy}">
							<%-- 	<span>${data.orderNO}</span>
								<span>${data.orderStatus}</span> --%>
							</display:column>
							<display:column sortable="true" title="Subscription Package" property="productName"></display:column>
								
							<display:column sortable="true" title="Order Number" property="trxReference"></display:column>
							<display:column sortable="true" title="PG Reference No." property="pGTxnRefNo"></display:column>
							
							<display:column sortable="true" title="Payment Amount" property="paymentAmount"></display:column>
							
							<display:column sortable="true" title="Payment Status" property="paymentStatus"></display:column>
							
							<display:column sortable="true" title="Payment Note" property="paymentNote"></display:column>
							
							<display:column sortable="true" title="Payment Details" property="pGStatus"></display:column>
							
							<display:column  sortable="true" title="Action">
							<c:if test="${data.paymentStatusId ==148003}"><span class="dropdown">
							 <a id="Action6"   class="dropdown-toggle" href="#" data-toggle="dropdown" style="text-decoration: none;">Action<span class="caret"></span></a>
							 <ul class="dropdown-menu" id="ActionMenu6" style="left:-120px !important;">
							 <li id="SPPartnerDashboardLink"> <a href=""><span class="user"> Print   Receipt</span></a></li>
							 <li id="SPOpportunityListLink"><a href=""><span class="user">Download</span></a></li>
							 </ul></span>
							 </c:if>
							 </display:column>
							
							 
								
						</display:table>
       
           
     </div> 
    </div> 
     
	 <br /> <br />			 
			
  </div>
	</div>		
</div>
		</div>
		
	

	<!--css popup window start 2-->




	<div style="display: none;" id="blanket"></div>
	<div
		style="display: none; width: 600px; height: 500px; top: 100px; overflow: auto;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>

		<div id="addnote">
		
			<form id="paymentForm">
				<input name="partyID" type="hidden" value="${partyId}" />
				<div id="popupwrapper_contactform">
				<div id="confirmDialog" class="common_dialog" style="display: none;">
	</div>
					<div class="heading_contactform">
						<h3>Add Payment</h3>
					</div>
					<div id="poptable_contactform"
						style="padding: 10px; height: 500px;">
						
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Payment Date <span class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="createdDate" id="createdDate" value=<%=CommonUtils.format(new Date(),"dd-MMM-yyyy") %> class="form-control date " maxlength="20"></span>
						<div class="clearfix"></div>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> Amount Paid <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="paymentAmount" id="paymentAmount"
							class="form-control " maxlength="20"></span>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Payment Method <span
							class="red">*</span>
									<%
					List<CodeValueData> paymentMethods=(List<CodeValueData>) request.getAttribute("paymentMethods");
					%>
							
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> 							
							<select id="paymentMethodID" name="paymentMethodID" class="required form-control" >
								<%
									for (CodeValueData idv:paymentMethods){
								%>
								<option value='<%=idv.getCodeValueId()%>'><%=idv.getCodeValue()%></option>
								<%
									}
								%>
						</select>
</span>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Payment Note<span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <textarea
							name="paymentNote" id="paymentNote" class="form-control "
							maxlength="50"></textarea></span>
						<div class="clearfix"></div>
							
						<br /> <input class="dbtn" value="Save" style="margin-left: 40%"
							id="Save" type="button" onclick="addNewPayment()"> <input
							class="dbtn" value="Cancel" id="Cancel" type="button"
							onclick="popup('popUpAlertaddnote');">
							
							<!-- <input class="dbtn" value="Save" style="margin-left: 40%"
							id="Save" type="button" onclick="showConfirm('Are You sure you want to save Payment?', addNewPayment)"> <input
							class="dbtn" value="Cancel" id="Cancel" type="button"
							onclick="popup('popUpAlertaddnote');"> -->

					</div>

				</div>
			</form>
			
		</div>


		<!-- End-->


		<!-- Center part End -->



		<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->

		<script >
	
	function close(){
		$("#addnote").hide();
	}
	 function addNewPayment()
	 {
       
		 var data = $('#paymentForm').serialize();
	 	// alert(JSON.stringify(data));
	 	  $.ajax({
	 			 type : "POST",
	 			 dataType: 'json',
	 			 data : data,
	 	         url : "${pageContext.request.contextPath}/subx/savePayment",
	 			 success : function(result)
	 			 {
	 				 if(result==1){
	 					 alert('Already exist.');
	 				 }else{
	 					 alert('Payment added.');
	 				 } 
	 		}
	 		});
	 	
	 }
	 
	 function addPayment(){
	//	 $("#addPayment").show();	
		 $("#deletenote, #editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
		 $("#popUpAlertaddnote").css ('height','750px')
		 $("#popUpAlertaddnote").css ('width','650px')
		 $("#popUpAlertaddnote").css ('left','350px');
		 $("#popUpAlertaddnote").css ('left','445px');
		 $("#popUpAlertaddnote").css ('top','20px');
		 $('#ActionMenu6').hide();
		 } 

	 function resetval(){
	 	 $('#pGRequestDttmString').val('');
	 	 $('#productName').val('');
	 	 $('#pGTxnRefNo').val('');
	 	 $('#paymentAmount').val('');
	 	 $('#pGStatus').val('');
	 	 $('#ARN').val('');
	 	 $('#euin').val('');
	 	 $('#location').empty();
	 	 $('#pstSn').empty();
	 	 $('#pktSn').empty();
	 	 $('#potSn').empty();
	 	 $('#orderID').val('');
	 	 $('#hdnarn').val('');
	 }

	 function eresetval(){
	 	 $('#efirstName').val('');
	 	 $('#elastName').val('');
	 	 $('#ecompanyName').val('');
	 	 $('#econtactEmail').val('');
	 	 $('#econtactMobile').val('');
	 	 $('#eARN').val('');
	 	 $('#eeuin').val('');
	 	 $('#elocation').empty();
	 	 $('#epstSn').empty();
	 	 $('#epktSn').empty();
	 	 $('#epotSn').empty();
	 	 //$('#eloginname').attr('readonly', false);
	 	 $('#eloginname').val('');
	 }
</script>

 <script>
//Iterate over each select element
 $('select').each(function () {

     // Cache the number of options
     var $this = $(this),
         numberOfOptions = $(this).children('option').length;

     // Hides the select element
     $this.addClass('s-hidden');

     // Wrap the select element in a div
     $this.wrap('<div class="select"></div>');

     // Insert a styled div to sit over the top of the hidden select element
     $this.after('<div class="styledSelect"></div>');

     // Cache the styled div
     var $styledSelect = $this.next('div.styledSelect');

     // Show the first select option in the styled div
     $styledSelect.text($this.children('option').eq(0).text());

     // Insert an unordered list after the styled div and also cache the list
     var $list = $('<ul />', {
         'class': 'options'
     }).insertAfter($styledSelect);

     // Insert a list item into the unordered list for each select option
     for (var i = 0; i < numberOfOptions; i++) {
         $('<li />', {
             text: $this.children('option').eq(i).text(),
             rel: $this.children('option').eq(i).val()
         }).appendTo($list);
     }

     // Cache the list items
     var $listItems = $list.children('li');

     // Show the unordered list when the styled div is clicked (also hides it if the div is clicked again)
     $styledSelect.click(function (e) {
         e.stopPropagation();
         $('div.styledSelect.active').each(function () {
             $(this).removeClass('active').next('ul.options').hide();
         });
         $(this).toggleClass('active').next('ul.options').toggle();
     });

     // Hides the unordered list when a list item is clicked and updates the styled div to show the selected list item
     // Updates the select element to have the value of the equivalent option
     $listItems.click(function (e) {
         e.stopPropagation();
         $styledSelect.text($(this).text()).removeClass('active');
         $this.val($(this).attr('rel'));
         $list.hide();
         /* alert($this.val()); Uncomment this for demonstration! */
     });

     // Hides the unordered list when clicking outside of it
     $(document).click(function () {
         $styledSelect.removeClass('active');
         $list.hide();
     });

 });
 
 function showConfirm(msg, callBack){
		
		$( "#confirmDialog" ).html(msg);
		 $( "#confirmDialog" ).dialog({
			 resizable: false,
			 modal: false,
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
 </script>
 <!-- End Script For Modified Select Dropdown -->





</body>
</html>