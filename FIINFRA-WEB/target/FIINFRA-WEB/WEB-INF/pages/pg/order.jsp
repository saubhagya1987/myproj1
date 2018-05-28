<%@page import="in.fiinfra.pg.NachData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.pg.SubxProductData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.pg.OrderDetailData"%>
<%@page import="in.fiinfra.pg.OrderData"%>
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
<title>Order</title>
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

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkbox-radio-switch.css" />
-->
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
	
	


<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">-->
</head>
<body>
<jsp:include page="../common/header.jsp" />
</section>

<div class="container">
<div class="container-head" >Order Confirmation</div>
<div>
<div class="list-group profiledivs" id="transactionHistoryDiv" >
        		
                <div class="list-group-item"> <table>
                <%
                List<KeyValue> products=(List<KeyValue>) request.getAttribute("products");
                %>
             <tr> <td> Subscription Package &nbsp; </td><td>  <select id="productName" name="productName" style="width: 200px; " class="required form-control">
                  <%  
                  for (KeyValue idv:products){
                  %>
                  
                  <option value='<%=idv.getId()%>'><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select></td></tr></table>
                  <br>
                	<div class="topmenu" style="margin-top:0px">       
 					</div> 
                <div class="row">    
                 <div class="table-responsive" id="display_table_lead" style="border:none; min-height: 100px;">
		  			<div id="toreload">    		
                		<form method="post" id="payOnlineFrm" action="${pageContext.request.contextPath}/pg/msgToPg.htm" >
                			<table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="orderTable">
                			<thead>
				             <tr>
				               <th class="thead"> <a href="#"> </a></th>
				               <th class="thead"> <a href="#"> Subscription Package</a></th>
				               <th class="thead"> <a href="#">Start Date</a></th>
				               <th class="thead"> <a href="#">End Date</a></th>
				               <th class="thead"> <a href="#">Amount</a></th> 
				               
				               <!-- <th class="thead"><a href="#">Amount</a></th> -->
				               
				              
				                </tr>
							</thead>
                	
                		<tbody>
                		<!-- <tr>
                		
                		<td></td>
                		 <td></td>
                		<td></td> 
                		 <td></td> 
                		</tr> -->
                		
                		
                		
                		</tbody>
<!-- 							 <tr> -->
<!-- 							<td colspan="2" align="right">   -->
<!-- 		                       	<input id="cancel" class="btn dbtn none" type="button" value="Save" name="documentsDetails" onclick="saveOpportunityProfile(name)"/>   -->
<!-- 		                       	<input id="save" class="btn dbtn none" type="button" value="Cancel" name="documentsDetails" onclick="disableOpportunityDiv(name)"/></td>  -->
<!-- 		                     </tr>     -->

                			</table>
                		<div>
                		<!-- <input type="radio" name="product" style="opacity:1;" value="" >&nbsp;&nbsp;&nbsp;&nbsp; Monthly<br><br> 
                		<input type="radio" name="product" style="opacity:1;" value="">&nbsp;&nbsp;&nbsp;&nbsp;Half Yearly<br><br> 
                		<input type="radio" name="product" style="opacity:1;" value="">&nbsp;&nbsp;&nbsp;&nbsp;Yearly<br><br>  -->
                		<br><br>  
                		</div>	
                 <input type="hidden" id="msg" name="msg"/>
                 
                 <input type="button" value="Pay Online" id="btnPayment" onclick="payOnline()"/>
                 <input type="button" value="Back" id="btnCancel" onclick="cancel()"/>             
					<%NachData nach=(NachData) request.getAttribute("nach"); 
					if(nach==null ){
					%>
					<a href="#" onClick="openNachDialog()">Do you want to register for Auto Payment? </a>	
					<%} %>
               			 </form>
                	</div>
                </div>
                 </div>   
                </div>
	    </div>
	</div>
	
	<div id="nachDialog" title="Initiate Auto Payment">Are you sure you want to initiate Auto Payment?</div>
</div>
</section>
<jsp:include page="../common/footer.jsp" />
<script>

$( document ).ready(function() {
	var productId=$("#productName option:selected" ).val();
	
	$.ajax({
		type : "GET",
		url : '${pageContext.request.contextPath}/pg/getProductData?productId='+productId,
		
				success : function(result) {
					
				populateOrderTable(result);
		}
		
	}); 
	
	
	});

$( "#productName" ).change(function() {
	
	var productId=$("#productName option:selected" ).val();
	
	$.ajax({
		type : "GET",
		url : '${pageContext.request.contextPath}/pg/getProductData?productId='+productId,
		
				success : function(result) {
					
				populateOrderTable(result);
		}
		
	}); 
	
	});


function populateOrderTable(data){
	
	var orderRows='';
	
	if(data.length>0){
	for(var i=0;i<data.length;i++){
		orderRows+='<tr><td><input id="productOption" type="radio" style="opacity:1; margin-top:0px" name="productOption" value="'+ data[i]['option'] +'"></td><td>'+data[i]['productName']+'</td><td>'+data[i]['startDate']+'</td><td>'+data[i]['endDate']+'</td><td>'+data[i]['amount']+'/-</td></tr>';
	}
	}
	$('#orderTable tbody').empty();
	$('#orderTable tbody').html(orderRows);
	
}

function payOnline(){
	
	var selectedOption = $("input[name='productOption']:checked").val()
	
	if(!selectedOption){
		alert('Please Select a option');
		return ;
	}
	
	$('#payOnlineFrm').submit();
	 /*location.href='${pageContext.request.contextPath}/pg/confirmFinalOrder?productId='+productId;
	 */
/* 	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/pg/msgToPg',
		data : {'option':selectedOption},
				success : function(result) {
			$('#msg').val(result['msg']);
			console.log(result['msg']);
			$('#payOnlineFrm').submit();		
		}
		
	});
 */	
}
function cancel(){
	location.href='${pageContext.request.contextPath}/partnerprofile.htm?view=subx';
	
}
$(function() {
	 

	 $("#nachDialog").dialog(
	     {
	      autoOpen : false,
	      width:800,
	      show : {
	       effect : "blind",
	       duration : 200
	      },
	      hide : {
	       effect : "explode",
	       duration : 200
	      },
	      buttons : {
	       "Ok" : function() {
	        initiateNach();
	       },
	       "Cancel" : function() {
	    	   $(this).dialog("close");
		       }
	      }
	     }); 
	});
function openNachDialog(){
	$("#nachDialog").dialog("open");
	
}
function initiateNach(){
	location.href="${pageContext.request.contextPath}/nach/initiateNACH.htm"
}

</script>
</body>
</html>