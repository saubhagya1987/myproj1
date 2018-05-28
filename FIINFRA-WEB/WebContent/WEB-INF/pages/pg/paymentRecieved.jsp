<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.pg.PaymentData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
	<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Partner Profile</title>
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
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/nicEdit.js"></script>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkbox-radio-switch.css" />-->

<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
--><!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src='<%=request.getContextPath()%>/js/common.js'></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
	
	

f
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
--></head>
<body>
<jsp:include page="../common/header.jsp" />
</section>

<% String errorMsg = (String) request.getAttribute("errorMsg"); 
UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
  PaymentData paymentData=(PaymentData) request.getAttribute("paymentData");
  if(paymentData ==null){
	  errorMsg = "Sorry! Your payment could not be processed this time.Please check again later. ";
  }
%>

<% if(StringUtils.isEmpty(errorMsg)){
%>

<div class="container">
<div class="container-head" >Payment Receipt</div>
<div>
                			<%          	
                	%>

<div class="searchpadding padding_top"><strong>Dear ${partnerName}, </strong><br/><br/>
	Thank you for the Subscribing for <%=paymentData.getProductName() %>. Your transaction details are mentioned below.<br/><br/>  
</div>
<div class="list-group profiledivs" id="transactionHistoryDiv" >
        		
                <div class="list-group-item">
                	<div class="topmenu" style="margin-top:0px">       
 					</div> 
                <div class="row">    
                 <div class="table-responsive" id="display_table_lead" style="border:none;">
		  			<div id="toreload">    		
                		<form method="post" id="payOnlineFrm" action="https://pgi.billdesk.com/pgidsk/PGIMerchantPayment" >
                			<%-- <table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="documentsDetails">
                			<thead>
				             <tr>
				               
				               <th class="thead"> <a href="#">Order No</a></th>
				               <th class="thead"> <a href="#"> Subscription Package</a></th>
				               <th class="thead"><a href="#">Amount</a></th>
				               <th class="thead"> <a href="#">Transaction Ref No.</a></th>
				               <th class="thead"><a href="#">Result</a></th>
				              
				                </tr>
							</thead>
                	<%PaymentData paymentData=(PaymentData) request.getAttribute("paymentData");
                	
                	%>
                		<tbody>
                		<tr>
                		<td><%=paymentData.getOrderNo() %></td>
                		<td><%=paymentData.getProductName() %></td>
                		<td><%=paymentData.getPaymentAmount() %></td>
                		<td><%=paymentData.getpGTxnRefNo() %></td>
                		<td><%=paymentData.getPaymentStatus() %> </td>
                		</tr>
                		
                		</tbody>
<!-- 							 <tr> -->
<!-- 							<td colspan="2" align="right">   -->
<!-- 		                       	<input id="cancel" class="btn dbtn none" type="button" value="Save" name="documentsDetails" onclick="saveOpportunityProfile(name)"/>   -->
<!-- 		                       	<input id="save" class="btn dbtn none" type="button" value="Cancel" name="documentsDetails" onclick="disableOpportunityDiv(name)"/></td>  -->
<!-- 		                     </tr>     -->

                			</table> --%>
                			<table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="documentsDetails">
							<tr>
     								<th class="thead" colspan="2">Transaction Details</th>     
    								     
							</tr>     
							<tr>         
    									<td style="width: 25%">Order No</td> 
   										 <td style="width: 75%"><%=paymentData.getOrderNo() %></td>     
							</tr>    
							<tr>         
    									<td> Subscription Package</td> 
   										 <td><%=paymentData.getProductName() %></td>     
							</tr>  
							<tr>         
    									<td>Amount</td> 
   										 <td><%=paymentData.getPaymentAmount() %></td>     
							</tr>    
							<tr>         
    									<td>Transaction Ref No.</td> 
   										 <td><%=paymentData.getTrxReference() %></td>     
							</tr>    
							<tr>         
    									<td>Payment Status</td> 
   										 <td><%=paymentData.getPaymentStatus() %></td>     
							</tr>      

                			</table>
                 <center>
             <%--     <input type="button" value="Print Receipt" id="btnPrint" onclick="printReceipt(<%=paymentData.getPaymentID() %>)"/> --%>
              <input type="button" value="Print Receipt" id="btnPrint" onclick="popup('popUpAlertaddnote');reportnote();getPaymentReceipt('paymentReceipt.rptdesign',<%=userSession.getPartyId()%>,<%=paymentData.getPaymentID()%>)"/>
                 <input type="hidden" id="ReportFormat" name="ReportFormat" value="pdf">
                 <input type="hidden" id="paymentId" name="paymentId" value="${paymentId} ">
                 <input type="hidden" id="partyId" name="partyId" value="${partyId} ">
                 <input type="button" value="Back" id="btnCancel" onclick="cancel()" />   </center>           

               			 </form>
                	</div>
                </div>
                 </div>   
                </div>
	    </div>
	    <%}else{ %>
	    
	    <div class="searchpadding padding_top" style="width: 50%;margin-left: 25%;margin-top: 30px;padding: 10px;text-align: center;">
	   	<img alt="ERROR" src="${pageContext.request.contextPath}/images/error.png">
	    <strong style="">Your Last Transaction  Failed. </strong><br/><br/>
			<%=errorMsg%><br/><br/>  
			<a href='${pageContext.request.contextPath}/partnerprofile.htm'><input type="button" value="Back"></a> 
</div>
	    
	    
	    <div class="searchpadding padding_top"><strong></strong><br/><br/>
	 <br/><br/>
	  
</div>
	    
	    <%} %>
	</div>
</div>
</section>

<div
  style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto;"
  id="popUpAlertaddnote" class="alert">
  <div class="close" style="margin-right: 10px;">
   <a onClick="popup('popUpAlertaddnote');resetVal();" href="#"><img alt="Close"
    src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
    
  </div>

  <div id="reportnote">
   <div id="popupwrapper_contactform">

    <div class="heading_contactform">
     <h3>Report</h3>
     <!-- <input type="button" onclick="printDiv('reportnote')" value="print a div!"  style="float: right;z-index: 999;"/> -->
     <a onClick="printDiv('reportview')" style="float: right;margin-top: 5px;margin-right: 20px;padding: 5px;background-color: #ae2760;border-radius: 5px;width: 80px;text-align: center;font-size: 13px;color: #fff;">Print</a>
    </div>
    <div id="downloadOptions" align="right">
   
     <!-- <br><br> -->
    
     <%-- <a class="pdficon" title="Download in Pdf" alt="Download in Pdf"href="#" onclick="downloadPartnersInTrialPeriod('pdf',${sessionScope.userSession.buId})"></a>
      <a class="excelicon" title="Download in Excel" alt="Download in Excel"href="#" onclick="downloadclientsummary('xls',${sessionScope.userSession.buId})"></a>
      <a class="docicon" title="Download in Doc" alt="Download in Doc" href="#" onclick="downloadclientsummary('doc',${sessionScope.userSession.buId})"></a> --%>
    </div>
    <div id="poptable_contactform" style="padding: 10px; height: 850px;width:800px;">

     <!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

     <div id="reportview"></div>
    </div>
   </div>
  </div>
 </div>
<jsp:include page="../common/footer.jsp" />
<script>

function getPaymentReceipt(reportName,partyId,paymentId) {
	 //alert("paymentId : "+paymentId+" partyId : "+partyId);
	 var ReportFormat="pdf";
	 var buId=<%=userSession.getBuId()%>
	var reporturl ="<%=request.getContextPath()%>/pg/printReceipt.htm?ReportName="+reportName+"&ReportFormat=html&paymentId="+paymentId+"&partyId="+partyId+"&buId="+buId;
	//alert("Report Name:" +reportName+" BiId : "+buId+"contextPath :"+contextPath);
	$("#reportview").html("Loading...");
	 
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	     
	      if (status == "error") {
	     var msg = "Sorry but there was an error getting details ! ";
	  $("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	   }else{
	    $('#downloadOptions').show();    
	    $('.div_dragger').trigger("click");
	   }
	    });
	    
	    currentReportName=reportName; 
}

function  reportnote()
{
	//alert("Report Called");
	$("#reportnote").show();
	$("#popUpAlertaddnote").css ('margin-top','50px');
	$("#popUpAlertaddnote").css ('height','1000px');
	$("#popUpAlertaddnote").css ('width','860px');
}	

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}


var paymentStatusId=${paymentData.paymentStatusId};
$( document ).ready(function() {
    if(paymentStatusId!=148003){
    	$('#btnPrint').attr('disabled',true);
    }
});

function printReceipt(paymentId){
	location.href='${pageContext.request.contextPath}/pg/printReceipt?ReportName=paymentReceipt.rptdesign&ReportFormat=pdf&paymentId='+paymentId;
	
}

function cancel(){
	location.href='${pageContext.request.contextPath}/partnerprofile.htm';
	
}
</script>
</body>
</html>