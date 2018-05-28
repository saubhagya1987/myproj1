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
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>-->

<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/style_serviceportal_partner.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->


</head>
<body>
<script>
$(document).ready(function(){
  	$( "#tabs" ).tabs();
   
	  
 
});

</script>

<script>
function addProduct(){
	 var str = $( "subx-product-form" ).serialize();
	  alert( str);
	  $( "#subx-product-form" ).submit();
		 
		}
</script>
<jsp:include page="../common/header.jsp" />
<div class="container white" id="pageLoad">
<form method="POST" action="${pageContext.request.contextPath}/subx/saveProduct" id="subx-product-form">
		<div class="container-head">
		<div class="pull-left fundtool_left_col_head ">
							<span style="float: left;">Subscriptions and Services</span>
						</div>
		</div>
		<div class="container-body">
          
		<c:choose>
		<c:when test="${sessionScope.userSession.buId==27827}">      
       <span  class="searchpadding padding_top" style="float:left; width:150px;">BU </span>
<span  class="searchpadding padding_top" style="float:left;">
<input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="Shubhchintak" readonly="true"></span>
 <div class="clearfix"></div>
</c:when>  
     	</c:choose>
     	
     	       <c:choose>
		<c:when test="${sessionScope.userSession.buId==27828}">      
       <span  class="searchpadding padding_top" style="float:left; width:150px;">BU </span>
<span  class="searchpadding padding_top" style="float:left;">
<input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="FIINFRA" readonly="true"></span>
 <div class="clearfix"></div>
</c:when>  
     	</c:choose>
     	
     	       <c:choose>
		<c:when test="${sessionScope.userSession.buId==27829}">      
       <span  class="searchpadding padding_top" style="float:left; width:150px;">BU </span>
<span  class="searchpadding padding_top" style="float:left;">
<input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="SPA" readonly="true"></span>
 <div class="clearfix"></div>
</c:when>  
     	</c:choose>
     	
     	       <c:choose>
		<c:when test="${sessionScope.userSession.buId==27830 || sessionScope.userSession.buId==109612}">      
       <span  class="searchpadding padding_top" style="float:left; width:150px;">BU </span>
<span  class="searchpadding padding_top" style="float:left;">
<input type="text" name="BU" id="BU" class="form-control" maxlength="20" value="DFDA" readonly="true"></span>
 <div class="clearfix"></div>
</c:when>  
     	</c:choose>
 <br/>    							
<span > 
 <% List<KeyValue> products = (List<KeyValue>) request.getAttribute("products"); %>
      <% for(KeyValue n:products) { %>
		<span  style="float: left;">Product</span>
						
<select name="productName" class="required " style="width: 200px; height: 25px; margin-left:105px;">
	<option value='<%= n.getId()%>'><%= n.getName() %></option></select>						
       <% } %>
</span>
 <div class="clearfix"></div>						

<br/>
<span  > 
		<span  style="float: left;">Price</span>
						
<input type="text" name="priceValue" class="form-control" style="float: left; width: 300px ; margin-left:120px; ">					

</span>
<br/>
<br/>
    <div id="tabs">
            <ul>
              <li><a href="#tabs-1">Subscription Details</a></li>
              <li><a href="#tabs-2">System Limits</a></li>
              <li><a href="#tabs-3">Notifications</a></li>
              
            
            </ul>
            <div id="tabs-1" class="tab_border">
            
            
 <span style="width: 300px" > 
		<span  style="float: left;">Trial Period Days</span>
						
<input  type="text" name="TrialPeriodDays" class="form-control" style="width: 200px; height: 25px; margin-left:235px; " >
					

</span>
<br/>

<span  style="width: 300px"> 
		<span  style="float: left;">Subscription Period</span>
						
<input type="text" name="SubscriptionPeriod" class="form-control" style="width: 200px; height: 25px; margin-left:235px; ">
							

</span>
<br/>

<span> 
		<span  style="float: left;">Renewal Notice Period</span>
						
<input type="text" class="form-control"  name="RenewalNoticePeriod" style="float: left; width: 300px; margin-left:85px; ">					

</span>
<br/>
<br/>
<span > 
		<span  style="float: left;">Duration</span>
						
<input type="text" class="form-control" name="paymentFrequency" style="float: left; width: 300px; margin-left:175px; ">					

</span>

<br/>
<br/>
            </div>
            <div id="tabs-2" class="tab_border">
          <span style="width: 300px" > 
		<span  style="float: left;">Trial Expiry First Notify Days </span>
						
<input  type="text" name="TrialExpiryFirstNotifyDays" class="form-control" style="width: 300px; height: 25px; margin-left:310px; " >
							

</span>
<br/>
<span  style="width: 300px"> 
		<span  style="float: left;">Trial Expiry Reminder Notify Start Days</span>
						
<input type="text" name="TrialExpiryReminderNotifyDays" class="required dropdown" style="width: 300px; height: 25px; margin-left:48px; ">						

</span>
<br/>
<br/>
<span  > 
		<span  style="float: left;">Subscription Renewal Notify Days</span>
						
<input type="text" class="form-control" name="SubscriptionRenewalNotifyDays" style="float: left; width: 300px; margin-left:85px; ">					

</span>
<br/>
<br/>
<span  > 
		<span  style="float: left;">Payment Due Notify Days</span>
						
<input type="text" class="form-control" name="PaymentDueNotifyDays" style="float: left; width: 300px; margin-left:138px; ">		

</span>

<br/>
<br/>
<span  > 
		<span  style="float: left;">Payment Due Notify Reminder Start Days</span>
						
<input type="text" class="form-control" name="PaymentDueNotifyReminderStartDays" style="float: left; width: 300px; margin-left:32px; ">		

</span>

<br/>
<br/>
<span  > 
		<span  style="float: left;">Access Restricted Notify Days</span>
						
<input type="text" class="form-control" name="AccessRestrictedNotifyDays" style="float: left; width: 300px; margin-left:110px; ">		

</span>

<br/>
<br/>
            </div>
            <div id="tabs-3" class="tab_border">
                <span style="width: 300px" > 
		<span  style="float: left;">Partner Client Users </span>
						
<input  type="text"  name="PartnerCientUsers" class="form-control" style="width: 300px; height: 25px; margin-left:250px; " >
	
</span>
<br/>
<span  style="width: 300px"> 
		<span  style="float: left;">SMS per Contact</span>
						
<input type="text"  name="SMSperContact" class="form-control" style="width: 300px; height: 25px; margin-left:250px; ">
					
</span>
<br/>
<span > 
		<span  style="float: left;">Email per Contact</span>
						
<input type="text" name="EmailperContact" class="form-control" style="float: left; width: 300px; margin-left:132px; ">					

</span>
<br/>
<br/>
<span  > 
		<span  style="float: left;">Clients</span>
						
<input type="text" name="Clients" class="form-control" style="float: left; width: 300px; margin-left:205px; ">		

</span>

<br/>
<br/>
<span  > 
		<span  style="float: left;">Opportunities</span>
						
<input type="text" class="form-control" name="Opportunities" style="float: left; width: 300px; margin-left:160px; ">		

</span>

<br/>
<br/>
<span  > 
		<span  style="float: left;">Folios</span>
						
<input type="text" class="form-control" name="Folios" style="float: left; width: 300px; margin-left:210px; ">		

</span>

<br/>
<br/>
<span  > 
		<span  style="float: left;">Preprinted Forms</span>
						
<input type="text" class="form-control" name="PreprintedForms" style="float: left; width: 300px; margin-left:137px; ">		

</span>

<br/>
<br/>
<span  > 
		<span  style="float: left;">Contact Documents</span>
						
<input type="text" class="form-control" name="ContactDocuments" style="float: left; width: 300px; margin-left:120px; ">		
</span>
<br/>
<br/>
<br/>
<br/>
             	 <div class="clr" ></div>
            </div>
           </div>
             </div>
             <input
       class="dbtn" value="Cancel" id="Cancel"  style="margin-left:600px;" type="button">
       <input class="dbtn" value="Save" 
       id="Save" type="button" onclick="addProduct(0);">
             </form>             
          </div>
</body>
</html>
