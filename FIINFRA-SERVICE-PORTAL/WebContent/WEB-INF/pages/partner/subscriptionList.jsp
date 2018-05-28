<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.pg.SubscriptionData"%>
<%@page import="in.fiinfra.pg.PaymentData" %>
<%@page import="java.util.Date"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.pg.SubxAttribute"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.pg.SubxProductData"%>
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
<title>Manage Subscription</title>
<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script> --%>
<%-- <script
	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/holder.js"></script> --%>

<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/style_serviceportal_partner.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />
<!-- -responsive css-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
<style>
.tracker1{
	left: -73% !important;
	}
	</style>
<script type="text/javascript">
var hidePopupTimeoutId;
$(".choose1").live("click",function () {
    clearTimeout( hidePopupTimeoutId );
    
    var id=$(this).attr('id');
    id="#tracker_"+id;
    $(id).show();
});


		$(".choose1").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
    	 var id=$(this).attr('id')
    	    id="#tracker_"+id;
    	    $(id).show();
    },500);
});

$(".tracker1").live("mouseenter", function() {
	
    clearTimeout( hidePopupTimeoutId );
    
});


$(".tracker 1").live("mouseleave", function() {
    $(".tracker1").hide();
});


</script>
<script>

<% List<SubxProductData> lstProducts = (List<SubxProductData>) request.getAttribute("products");
   List<SubxProductData> lstAllProducts = (List<SubxProductData>) request.getAttribute("allProducts");
   SubscriptionData activeSubx = (SubscriptionData) 	request.getAttribute("activeSubx");
   List<SubscriptionData> lstSubx = (List<SubscriptionData>) request.getAttribute("subxData");
   List<CodeValueData> lstFreq= (List<CodeValueData>) request.getAttribute("paymentFreq");
	List<CodeValueData> paymentMethods=(List<CodeValueData>) request.getAttribute("paymentMethods");
  /*  String partyName = (String) request.getAttribute("partyName"); */

%>

var lastActiveSubxEndDate = <%=activeSubx%>;
var subxMap = [];
var freqMap = [];
<%  
for (int i=0; i<lstAllProducts.size(); i++) { 
 SubxProductData p = lstAllProducts.get(i);
%>
subxMap[<%= i %>] = [];
subxMap[<%= i %>]['Id'] = "<%=p.getProductID() %>";
subxMap[<%= i %>]['FreqId'] = "<%=p.getPaymentFrequencyId() %>";
subxMap[<%= i %>]['Freq'] = "<%=p.getPaymentFrequency() %>";
subxMap[<%= i %>]['Price'] = "<%=p.getPriceValue() %>";
subxMap[<%= i %>]['Category'] = "<%=p.getCategoryId() %>";
<% } %>

function addDays(theDate, days) {
    return new Date(theDate.getTime() + days*24*60*60*1000);
}

function updateSubxFreq(){
	var pId = $('#productID').val();
//	console.log(pId);
	var freqId = $('#paymentFrequencyId').val();
	var freqList = [];
	var j = 0;
	for(var i=0;i<subxMap.length;i++){
		if(subxMap[i]['Id'] == pId){
		  freqList[j] = [];
		  freqList[j]['Id'] = subxMap[i]['FreqId'];
		  freqList[j]['Value'] = subxMap[i]['Freq'];
		  j++;
		}
		if(subxMap[i]['Id'] == pId && subxMap[i]['FreqId'] == freqId ){
			price =  	subxMap[i]['Price'];
		}
	}
	$('#paymentFrequencyId').empty();
	for(var i=0;i<freqList.length;i++){
		$('#paymentFrequencyId').append('<option value='+freqList[i]['Id']+'>'+freqList[i]['Value']+'</option>');
	}
	
	updateSubxAmount();
}
function updateSubxAmount(){
	var pId = $('#productID').val();
	var freqId = $('#paymentFrequencyId').val();
	var price = 0;
	var freqList = [];
	var j = 0;
	for(var i=0;i<subxMap.length;i++){
		if(subxMap[i]['Id'] == pId && subxMap[i]['FreqId'] == freqId ){
			price =  	subxMap[i]['Price'];
	}
	}
	$('#subscriptionCostAmount').val(price);
}

$(document).ready(function(){
	updateSubxFreq();
	$('#productID').change(function() {
		updateSubxFreq();
	 });
	$('#paymentFrequencyId').change(function() {
		updateSubxAmount();
	 });

});


function  reportnote()
{
	//alert(('#opportunityStatus').val());
	$("#reportnote").show();
	$("#popUpAlertaddPayment").css ('margin-top','50px');
	$("#popUpAlertaddPayment").css ('height','1000px');
	$("#popUpAlertaddPayment").css ('width','1100px');
	
}

</script>
<% 
UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");

%>

<script>
function getPaymentReceipt(reportName,partyId,paymentId) {
	// alert("paymentId : "+paymentId+" partyId : "+partyId+" reportName: "+reportName);
	 var ReportFormat="pdf";
	 var buId=<%=userSession.getBuId()%>
	var reporturl ="${pageContext.request.contextPath}/subx/report?ReportName="+reportName+"&ReportFormat=html&paymentId="+paymentId+"&partyId="+partyId+"&buId="+buId;
	//alert("Report Name:" +reportName+" BiId : "+buId+"contextPath :"+contextPath);
	
	
	 $("#reportview").html("Loading...");
	 
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	   
	      if (status == "error") {
	     var msg = "Sorry but there was an error getting details ! ";
	     
	  $("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	   }else{
	   // $('#downloadOptions').show();    
	    $('.div_dragger').trigger("click");
	   }
	    });
	    
	    currentReportName=reportName;  
	}


function downloadPaymentReceipt(reportName,partyId,paymentId){
	
	 var ReportFormat="pdf";
	 var buId=<%=userSession.getBuId()%>
	 <%-- var reporturl ="<%=request.getContextPath()%>/pg/printReceipt.htm?ReportName="+reportName+"&ReportFormat=html&paymentId="+paymentId+"&partyId="+partyId+"&buId="+buId; --%>
	
	var reporturl ="report.htm?ReportName="+reportName+"&ReportFormat="+ReportFormat+"&paymentId="+paymentId+"&partyId="+partyId+"&buId="+buId;
	
	window.location.href = reporturl;
	
	}

function  paymentReceiptDisplay()
{
	//alert("Report Called");
	$("#addnote").hide();
	$("#extendnote").hide();
	$("#reportnote").show();
	$("#popUpAlertaddnote").css ('margin-top','50px');
	$("#popUpAlertaddnote").css ('height','650px');
	$("#popUpAlertaddnote").css ('width','875px');
}
function showAddNote()
{
	//alert("Report Called");
	$("#reportnote").hide();
	$("#extendnote").hide();
	$("#addnote").show();
	
	$("#popUpAlertaddnote").css ('margin-top','50px');
	$("#popUpAlertaddnote").css ('height','1000px');
	$("#popUpAlertaddnote").css ('width','1100px');
}

function showExtend(){
	
	//alert("Report Called");
	$("#reportnote").hide();
	$("#addnote").hide();
	$("#extendnote").show();
	extend();
	$("#popUpAlertaddnote").css ('margin-top','50px');
	$("#popUpAlertaddnote").css ('height','1000px');
	$("#popUpAlertaddnote").css ('width','1100px');
}

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}
</script>

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
	<!--  -->
	
	
	
	
	<!--  -->
	
	
	
	
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
							<span style="float: left;">Subscriptions for ${partyName}</span>
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
				<!-- center -->

				<div class="list-group">
					
					<div class="list-group-item">
					
						<div class="topmenu">
							<a id="SPAddNewSubxLink" href="#" onclick="sendToEditSubx(${data.partySubscriptionID});"><input
								data-params="{}" type="button" class="dbtn createNewBtn"
								value="  Renew" onClick="showAddNote();popup('popUpAlertaddnote');"
								title="  Renew" alt="  New  Subscription"></a>

						</div>
						<div class="topmenu">
							<a id="SPExtendSubxLink" href="#" onclick="sendToExtendSubx(${data.partySubscriptionID});"><input
								data-params="{}" type="button" class="dbtn createNewBtn"
								value="  Extend" onClick="showExtend();popup('popUpAlertaddnote');"
								title="  Extend" alt="  New  Subscription"></a>
						</div>
						<h5> Current  Package  </h5>
						<div class="table-responsive" id="display_table_lead"
							style="border: none;">
							<div id="toreload">


								<display:table id="data" name="subxData" requestURI="#"
									sort="list"
									class="table table-hover table-bordered table-striped"
									cellpadding="0" cellspacing="0" pagesize="${size}">
									
									<display:column sortable="true" title="Package Name">
										<span>${data.productName}</span> - <span>${data.paymentFrequency}</span>
									</display:column>

									<display:column sortable="true" title="Start Date" property="subscriptionStartDate" format="{0,date,dd-MMM-yyyy}">
									<span>${data.subscriptionStartDate}</span>
                                     </display:column>
									<display:column sortable="true" title="End Date" property="subscriptionExpiryDate" format="{0,date,dd-MMM-yyyy}"  >
									<span>${data.subscriptionExpiryDate}</span>
                                      </display:column>
									<display:column sortable="true" title="Renewal Notice Date" property="renewalNoticeDate" format="{0,date,dd-MMM-yyyy}" >
									<span>${data.renewalNoticeDate}</span>
									</display:column>
									<%-- <display:column sortable="true" title="Cumulative Amount Due">
										<span>${data.cumulativeAmountDue}</span>
									</display:column>
									<display:column sortable="true" title="Cumulative Amount Paid">
										<span>${data.cumulativeAmountPaid}</span>
									</display:column>
									<display:column sortable="true" title="Balance Amount">

									</display:column> --%>
									<display:column sortable="true" title="Subscription Status">
										 <span>${data.currentSubscriptionType}</span> - <span>${data.subscriptionStatus}</span>
										<!-- subscription type to be added -->
									</display:column>
									
								</display:table>

								<!-- Center-->
							</div>
						</div>
						<h5> Subscription History</h5>
								<div class="table-responsive" id="display_table_lead" style="border:none; min-height :250px;  ">
		  <div id="toreload">

	
						<display:table id="data" name="paymentData" requestURI="#"
							sort="list" class="table table-hover table-bordered table-striped"
							cellpadding="0" cellspacing="0" pagesize="${size}" style="margin-top : 20px ! important;" >
							
							<display:column sortable="true" title="Payment Date Time"  property="pGRequestDttm"  format="{0,date,dd-MMM-yyyy HH:mm}">
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
							
							<display:column  title="Action" class="dropdown " style="width:120px;">
							<c:if test="${data.paymentStatusId ==148003}">
							<a class="choose1" id="${data.paymentID}" >Action </a>
							
								<div class="tracker1" style="display: none;" id="tracker_${data.paymentID}">
       							<div class="close"><a onclick="$('.tracker1').hide()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif"></a></div>
							       <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
							          <tbody>
								          <tr>
										<td><li id="SPPaymentReceiptDownloadLink"><a onClick="downloadPaymentReceipt('PaymentReceipt.rptdesign',${data.partyID},${data.paymentID})"><span class="user">Download Receipt</span></a></li></td>
										</tr>
										<tr>
										<td><li id="SPPaymentReceiptLink"> <a onClick="paymentReceiptDisplay();popup('popUpAlertaddnote'); getPaymentReceipt('PaymentReceipt.rptdesign',${data.partyID},${data.paymentID})"><span class="user"> Print Receipt</span></a></li></td>	</tr>
								           
							        	</tbody>
							        </table>
   								</div>
							</c:if></display:column>							 
								
						</display:table>
       
           
     </div> 
					</div>


				</div>
			</div>
			<!-- </div> -->
		</div>
		<br /> <br />
	</div>

	<!--css popup window start 2-->






	<div style="display: none; z-index:95 !important ;" id="blanket"></div>
	<div style="display: none; width: 600px; height: 480px ! important; top: 100px; overflow: auto;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		<%
			List<CodeValueData> subxStatus=(List<CodeValueData>) request.getAttribute("subxStatus");
		%>
		<div id="addnote">
			<form id="subx-form">
				<input name="partyID" type="hidden" value="${partyId}" />
				<input id="partySubscriptionID" name="partySubscriptionID" type="hidden"  />
				
				<div id="popupwrapper_contactform">
					<div class="heading_contactform">
						<h3 id="popUpTitle">Add Subscription</h3>
					</div>
					<div id="poptable_contactform"
						style="padding: 10px; height: 335px;">
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left;">Current Package - <label id="productName" ></label>valid till <label id="subscriptionExpiryDate" ></label>
						</span> 
						<div class="clearfix"></div>

						<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="lblSubscriptionPackage"> <span>Subscription Package
								</span><span
							class="red">*</span>
						</span>
						 
						<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="productID" name="productID" class="required form-control">
												<option value='0'>--Select--</option>								
						<%
						for (SubxProductData p:lstProducts){
								%>
								<option value='<%=p.getProductID()%>'><%=p.getProductName()%></option>
								<%
									}
								%>
						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="lblSubscriptionDuration"> <span>Subscription Duration
								</span><span
							class="red">*</span>
						</span>
						 
						<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="paymentFrequencyId" name="paymentFrequencyId" class="required form-control">
												<option value='0'>--Select--</option>								
						<%
						for (CodeValueData p:lstFreq){
							if(!(p.getCodeValueId() == 63003 ||p.getCodeValueId() == 63005 ||p.getCodeValueId() == 63006)){
								continue;
							}
								%>
								<option value='<%=p.getCodeValueId()%>'><%=p.getCodeValue() %></option>
								<%
									}
								%>
						</select>
						</span>
								<div class="clearfix"></div>

						<span class="searchpadding padding_top"
							style="float: left; width: 200px;"> <span>Free Extended Duration</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> 
						<select id="extraMonth" name="extraMonth" class="required form-control">
												<option value='0'>--Select--</option>								
						<%
						for (int i=1;i<=3;i++){
								%>
								<option value='<%= i %>'><%="+ " + i + " Month"%></option>
								<%
									}
								%>
						</select>
						</span>
						<div class="clearfix"></div>
						<span id="lblNetPayableAmount" class="searchpadding padding_top"
							style="float: left; width: 200px;">Net Payable Amount
							</span> 
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							id="subscriptionCostAmount" name="subscriptionCostAmount" 
							class="form-control" maxlength="50" disabled>
						</span>
						<div class="clearfix"></div>
							<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="lblPaymentMethod">Payment Method <span
							class="red">*</span>
							
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> 							
							<select id="paymentMethodID" name="paymentMethodID" class="required form-control" >
								<%
									for (CodeValueData idv:paymentMethods){
								%>
								<% if (idv.getCodeValueId() != 154003 ) {%>
								<option value='<%=idv.getCodeValueId()%>'><%=idv.getCodeValue()%></option>
								<%
								}}
								%>
						</select>
                        </span>
						<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="lblAmountPaid"> Amount Paid <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="paymentAmount" id="paymentAmount"
							class="form-control " maxlength="20"></span>
						<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="lblPaymentNote" >Payment Note
						  <span
							class="red">*</span></span><span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <textarea
							 class="form-control " id="paymentNote" name="paymentNote" 
							maxlength="50"></textarea></span>
						<div class="clearfix"></div>	
                    
						<br />
						 <input
       class="dbtn" value="Cancel" id="Cancel" style="float:right;" type="button"
       onclick="popup('popUpAlertaddnote');">
       <input class="dbtn" value="Renew" style="float:right;"
       id="Save" type="button" onclick="addSubx(0);">
					</div>

				</div>
			</form>
		</div>
<!-- edit start -->


<div style="display: none;" id="blanket"></div>			
			
		<div id="extendnote">
						<form id="subx-extend-form">
				<input name="partyID" type="hidden" value="${partyId}" />
				<input id="partySubscriptionID" name="partySubscriptionID" type="hidden"  />
				
				<div id="popupwrapper_contactform">
					<div class="heading_contactform">
						<h3 id="epopUpTitle">Extend Subscription</h3>
					</div>
					<div id="poptable_contactform"
						style="padding: 10px; height: 235px;">
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left;">Current Package - <label id="eproductName" ></label> valid till <label id="esubscriptionExpiryDate" ></label>
						</span> 
						<div class="clearfix"></div>

						<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="elblSubscriptionPackage"> <span>Subscription Package
								</span><span
							class="red">*</span>
						</span>
						 
						<span class="searchpadding padding_top"
							style="float: left; width: 300px;" > <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select  name="productID" id="eproductID" class="required form-control">
												<option value='0'>--Select--</option>								
						<%
						for (SubxProductData p:lstProducts){
								%>
								<option value='<%=p.getProductID()%>'><%=p.getProductName()%></option>
								<%
									}
								%>
						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="elblSubscriptionDuration"> <span>Subscription Duration
								</span><span
							class="red">*</span>
						</span>
						 
						<span class="searchpadding padding_top"
							style="float: left; width: 300px;" id="epaymentFrequencyId"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select  name="paymentFrequencyId" class="required form-control">
												<option value='0'>--Select--</option>								
						<%
						for (CodeValueData p:lstFreq){
							if(!(p.getCodeValueId() == 63003 ||p.getCodeValueId() == 63005 ||p.getCodeValueId() == 63006)){
								continue;
							}
								%>
								<option value='<%=p.getCodeValueId()%>'><%=p.getCodeValue() %></option>
								<%
									}
								%>
						</select>
						</span>
								<div class="clearfix"></div>

						<span class="searchpadding padding_top"
							style="float: left; width: 200px;"> <span>Free Extended Duration</span> <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"  > 
						<select name="extraMonth" id="eextraMonth" class="required form-control">
												<option value='0'>--Select--</option>								
						<%
						for (int i=1;i<=3;i++){
								%>
								<option value='<%= i %>'><%="+ " + i + " Month"%></option>
								<%
									}
								%>
						</select>
						</span>
						<div class="clearfix"></div>
						<span id="elblNetPayableAmount" class="searchpadding padding_top"
							style="float: left; width: 200px;">Net Payable Amount
							</span> 
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;" id="esubscriptionCostAmount"> <input type="text"
							 name="subscriptionCostAmount" 
							class="form-control" maxlength="50" disabled>
						</span>
						<div class="clearfix"></div>
							<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="elblPaymentMethod">Payment Method <span
							class="red">*</span>
							
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;" id="epaymentMethodID" > 							
							<select  name="paymentMethodID" class="required form-control" >
								<%
									for (CodeValueData idv:paymentMethods){
								%>
								<% if (idv.getCodeValueId() != 154003 ) {%>
								<option value='<%=idv.getCodeValueId()%>'><%=idv.getCodeValue()%></option>
								<%
								}}
								%>
						</select>
                        </span>
						<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="elblAmountPaid"> Amount Paid <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="paymentAmount" id="epaymentAmount"
							class="form-control " maxlength="20"></span>
							<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 200px;" id="elblPaymentNote" >Payment Note
						  <span
							class="red">*</span></span><span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <textarea
							 class="form-control " id="epaymentNote" name="paymentNote" 
							maxlength="50"></textarea></span>
						<div class="clearfix"></div>	
                    
						<br />
						 <input
       class="dbtn" value="Cancel" id="Cancel" style="float:right;" type="button"
       onclick="popup('popUpAlertaddnote');">
       <input class="dbtn" value="Extend" style="float:right;"
       id="Save" type="button" onclick="extendSubx(0);">
					</div>

				</div>
			</form>
		</div> 
		
	<div style="display: none;" id="blanket"></div>	
		
<div id="reportnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Payment Receipt</h3>
					 <a onClick="printDiv('reportview')" style="float: right;margin-top: 5px;margin-right: 20px;padding: 5px;background-color: #ae2760;border-radius: 5px;width: 80px;text-align: center;font-size: 13px;color: #fff;">Print</a>
				</div>
				<div id="downloadOptions" align="right">
			
					<br><br>
					
					<%-- <a class="pdficon" title="Download in Pdf" alt="Download in Pdf"href="#" onclick="downloadPartnersInTrialPeriod('pdf',${sessionScope.userSession.buId})"></a>
					 <a class="excelicon" title="Download in Excel" alt="Download in Excel"href="#" onclick="downloadclientsummary('xls',${sessionScope.userSession.buId})"></a>
					 <a class="docicon" title="Download in Doc" alt="Download in Doc" href="#" onclick="downloadclientsummary('doc',${sessionScope.userSession.buId})"></a> --%>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 100%;width: 100%;">

					<!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

					<div id="reportview"></div>
				</div>
			</div>
		</div>
   		
		
<!-- 		
		
<div id="confirmDialog" style="font: 10pt verdana;font-weight: bold; z-index:10001;">
Are you sure you want to save? There's no going back after this!
</div> -->
 </div>	



		<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>

<script >


	
	
	
	function close(){
		$("#addnote").hide();
		$("#editnote").hide();
		clearData();
	}
	function eresetval(){
		
	}
	function resetval(){
		
	}
	
	function addNote(){
		clearData();
		$("#addnote").show();
		$('#popUpTitle').text("Add New Subscription");
		$("#deletenote, #editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
		$("#popUpAlertaddnote").css ('height','750px');
		$("#popUpAlertaddnote").css ('width','650px');
		$("#popUpAlertaddnote").css ('left','350px');
		$("#popUpAlertaddnote").css ('left','445px');
		$("#popUpAlertaddnote").css ('top','20px');
		$('#ActionMenu6').hide();
		}
	function extendNote(){
		
		clearData();
		$("#extendnote").show();
		$('#epopUpTitle').text("Extend Subscription");
		$("#deletenote, #editnote,#addnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
		$("#popUpAlertextendnote").css ('height','750px');
		$("#popUpAlertextendnote").css ('width','650px');
		$("#popUpAlertextendnote").css ('left','350px');
		$("#popUpAlertextendnote").css ('left','445px');
		$("#popUpAlertextendnote").css ('top','20px');
		$('#ActionMenu6').hide();
		}
	
	
	function sendToEditSubx(subxId){
		//alert(subxId);
		$('#popUpTitle').text("Renew Subscription");
		$("#deletenote, #editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
		$("#popUpAlertaddnote").css ('height','750px');
		$("#popUpAlertaddnote").css ('width','650px');
		$("#popUpAlertaddnote").css ('left','350px');
		$("#popUpAlertaddnote").css ('left','445px');
		$("#popUpAlertaddnote").css ('top','20px');
		$('#ActionMenu6').hide();
		 $.ajax(
				    {
				        url : "${pageContext.request.contextPath}/subx/getCurrentSubx?partyId=${partyId}",
				        type: "GET",
				        dataType: 'json',
				        success:function(data, textStatus, jqXHR)
				        
				        {
				        	$('#ProductID').val(data['ProductID']);
				        	$('#productName').html(data['productName']);
							$('#renewalNoticeDate').val(data.renewalNoticeDate);
							//$('#trialStartDate').val(data[0].trialstartDate);
							//$('#trialEndDate').val(data[0].trialendDate);
							$('#paymentFrequencyId').val(data.paymentFrequencyId);
							$('#paymentFrequency').val(data.paymentFrequency);
							$('#partySubscriptionID').val(data.partySubscriptionID);
							$('#subscriptionCostAmount').val(data.subscriptionCost);
							$('#subscriptionStartDate').val(data.subscriptionStartDate);
							$('#subscriptionExpiryDate').html(data.subscriptionExpiryDate);
							$('#productID').val(data.productID);
							$('#subscriptionStatusId').val(data.subscriptionStatusId);
							
							updateSubxFreq();
							
				        },
				        error: function(jqXHR, textStatus, errorThrown)
				        {
				        	alert('Error getting Data');
				        }
				    
				    });


		}
	function sendToExtendSubx(subxId){
	      // alert(subxId);
			$('#epopUpTitle').text("Extend Subscription");
			$("#deletenote,#editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
			$("#popUpAlertaddnote").css ('height','750px');
			$("#popUpAlertaddnote").css ('width','650px');
			$("#popUpAlertaddnote").css ('left','350px');
			$("#popUpAlertaddnote").css ('left','445px');
			$("#popUpAlertaddnote").css ('top','20px');
			$('#ActionMenu6').hide();
			$("#addnote").hide();
			 $.ajax(
					    {
					        url : "${pageContext.request.contextPath}/subx/getCurrentSubx?partyId=${partyId}",
					        type: "GET",
					        dataType: 'json',
					        success:function(data, textStatus, jqXHR)
					        
					        {
					        	
					        	$('#eProductID').val(data['ProductID']);
					        	$('#eproductName').html(data['productName']);
								$('#erenewalNoticeDate').val(data.renewalNoticeDate);
								//$('#trialStartDate').val(data[0].trialstartDate);
								//$('#trialEndDate').val(data[0].trialendDate);
								$('#epaymentFrequencyId').val(data.paymentFrequencyId);
								$('#epaymentFrequency').val(data.paymentFrequency);
								$('#epartySubscriptionID').val(data.partySubscriptionID);
								$('#esubscriptionCostAmount').val(data.subscriptionCost);
								$('#esubscriptionStartDate').val(data.subscriptionStartDate);
								$('#esubscriptionExpiryDate').html(data.subscriptionExpiryDate);
								$('#eproductID').val(data.productID);
								$('#esubscriptionStatusId').val(data.subscriptionStatusId);
								
								updateSubxFreq();
								
					        },
					        error: function(jqXHR, textStatus, errorThrown)
					        {
					        	alert('Error getting Data');
					        }
					    
					    });


			}

	
	function editNote(){
		
		$("#editnote").show();	
		$("#addnote, #deletenote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
		$("#popUpAlertaddnote").css ('height','750px');
		$("#popUpAlertaddnote").css ('width' ,'650px');
		$("#popUpAlertaddnote").css ('left','350px');
		$("#popUpAlertaddnote").css ('left','445px');
		$("#popUpAlertaddnote").css ('top','20px');
		$('#ActionMenu6').hide();

		}

	 function addPayment(){
		 
		 
		 clearData();
			$("#addPayment").show();
			$('#popUpTitle').text("Add New Payment");
			$("#deletenote, #addnote, #editnote,#uploadUser,#BulkServiceTeam,#sendMail,#newMail,#ServiceTeamAllocation,#assignEmailAccount,#Onboarding").hide();	
			$("#popUpAlertaddpayment").css ('height','750px');
			$("#popUpAlertaddpayment").css ('width','650px');
			$("#popUpAlertaddpayment").css ('left','445px');
			$("#popUpAlertaddpayment").css ('top','20px');
			$('#ActionMenu6').hide();
			
		 } 
	
	
	function addSubx(savendclose)
	{
		
		
	     var data = $('#subx-form').serialize(); 
	     
	     var valid = paymentValidation();
	     if(valid == true)
	               {
	    			  $.ajax({
					 type :'POST',
					 dataType: 'json',
					 data : data,
			         url : "${pageContext.request.contextPath}/subx/savePayment?action=Renew",
					 success : function(result)
					 {
						 if(result['result']=='OK'){
							 alert('Subscription renewed.');
							 window.href="${pageContext.request.contextPath}/subx/list?partyId=${partyId}"
						 }else{
							 //alert(result);
						 } 
				}
				});
	           }
	          resetval();
			  popup('popUpAlertaddnote');
			  clearData();
			  $( "body" ).load( "${pageContext.request.contextPath}/subx/list?partyId=${partyId}" );
	    
			 
	}
	function extendSubx(savendclose)
	{
		
		 $('#epaymentFrequencyId').val(0);
	     console.log($('#subx-extend-form').html());
	     var data = $('#subx-extend-form').serialize();
	     var valid = extendValidation();
	     if(valid == true)
	    	 {
	    			  $.ajax({
					 type :'POST',
					 dataType: 'json',
					 data : data,
			         url : "${pageContext.request.contextPath}/subx/savePayment?action=Extend",
					 success : function(result)
					 {
						  
						  alert(result.msg);
	          resetval();
			  popup('popUpAlertaddnote');
			  clearData();
			  $( "body" ).load( "${pageContext.request.contextPath}/subx/list?partyId=${partyId}" );
				    },
				    error:function(xhr, textStatus) {
				    	console.log(xhr);
				    	alert('Error While Extending. Please Try Again.');
				        resetval();
						popup('popUpAlertaddnote');
						clearData();
	    	 } 			 
			         
			         
				});
	    	 } 			 
	    
			 
	}
function paymentValidation(){
	
	
	if($('#productID').val() == 0){
		alert(" Please select a package ");
		$('#productID').focus();
		return false ;
	}
	if($('#paymentFrequencyId').val() == 0){
		alert(" Please select a subscription duration ");
		$('#paymentFrequencyId').focus();
		return false ;	
	}
	if($('#paymentMethodID').val() == 0){
		alert(" Please select a payment method ");
		$('#paymentMethodID').focus();
		return false ;	
	}
	if($('#paymentAmount').val() <= 0){
		alert(" Please add Amount paid ");
		$('#paymentAmount').focus();
		return false ;	
	}
    if($('#paymentNote').val() == ""){
		alert(" Please add a payment note ");
		$('#paymentNote').focus();
		return false ;	
	}
    
	 return true ;
}
function extendValidation(){
	
	
	if($('#eproductID').val() == 0){
		alert(" Please select a package ");
		$('#eproductID').focus();
		return false ;
	}
	if($('#eextraMonth').val() == 0){
		alert(" Please select extra duration ");
		$('#eextraMonth').focus();
		return false ;	
	}
	if($('#epaymentAmount').val() < 0){
		alert(" Please add a payment amount ");
		$('#epaymentAmount').focus();
		return false ;	
	}
    if($('#epaymentNote').val() == ""){
		alert(" Please add a payment note ");
		$('#epaymentNote').focus();
		return false ;	
	}
    
	 return true ;
}


	
function clearData()
{
	$('#productID').val('0');
	$('#startDate').datepicker('setDate',null);
	$('#endDate').datepicker('setDate',null);
	$('#trialStartDate').datepicker('setDate',null);
	$('#trialEndDate').datepicker('setDate',null);
	$('#renewalNoticeDate').datepicker('setDate',null);
	$('#subscriptionCostAmount').val("");
	}
	
function resetval(){
	 $('#productID').val('');
	 $('#paymentFrequencyId').val('');
	 $('#paymentMethodID').val('');
	 $('#subscriptionCostAmount').val('');
	 $('#paymentAmount').val('');
	 $('#paymentNote').val('');
	
}
	

</script>
<script>

function renew(){

	popup('popUpAlertaddnote');
	$('#lblSubscriptionPackage').prop('disabled', false);
	$('#productID').prop('disabled', false);
	$('#lblSubscriptionDuration').prop('disabled', false);
	$('#paymentFrequencyId').prop('disabled', false);
	$('#lblPaymentMethod').prop('disabled', false);
	$('#paymentMethodID').prop('disabled', false);
	$('#lblNetPayableAmount').prop('disabled', false);
	$('#subscriptionCostAmount').prop('disabled', false);
	$('#lblAmountPaid').prop('disabled', false);
	$('#paymentAmount').prop('disabled', false);
	$('#paymentNote').prop('disabled', false);
	$('#lblPaymentNote').prop('disabled', false);
	$('#lblSubscriptionPackage').show();
	$('#productID').show();
	$('#lblSubscriptionDuration').show();
	$('#paymentFrequencyId').show();
	$('#lblPaymentMethod').show();
	$('#paymentMethodID').show();
	$('#lblNetPayableAmount').show();
	$('#subscriptionCostAmount').show();
	$('#lblAmountPaid').show();
	$('#paymentAmount').show();
	$('#paymentNote').show();
	$('#lblPaymentNote').show();
}
function extend(){

	
	$('#elblSubscriptionPackage').hide();
	$('#eproductID').hide();
	$('#elblSubscriptionDuration').hide();
	$('#epaymentFrequencyId').hide();
	$('#elblPaymentMethod').hide();
	$('#epaymentMethodID').hide();
	$('#elblNetPayableAmount').hide();
	$('#esubscriptionCostAmount').hide();
	$('#elblAmountPaid').hide();
	$('#epaymentAmount').hide();
	
}


$(document).ready(function(){
		$("#Cancel").click(function(){
			clearData();
		});	
		 $(".date").datepicker({dateFormat: "dd-M-yy",
		   	yearRange: "0:+100",
		   	  changeMonth: true,
		         changeYear: true,
		         minDate:'0',
		         
		         });
	});

</script>

</body>
</html>
