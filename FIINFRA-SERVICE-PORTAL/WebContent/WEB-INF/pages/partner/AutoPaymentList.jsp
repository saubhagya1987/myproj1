<%@page import="in.fiinfra.pg.SubxProductData"%>
<%@page import="in.fiinfra.pg.AutoPaymentData"%>
<%@page import="in.fiinfra.common.common.NachRequest"%>
<%@page import="in.fiinfra.common.service.vo.Partner"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.pg.NachData"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="java.util.Date"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
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
<title>NACH</title>
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
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
<script>
</script>
<% 
UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
 List<CodeValueData> lstStatus = (List<CodeValueData>) request.getAttribute("statusLst");
 List<AutoPaymentData> autoPayment = (List<AutoPaymentData>) request.getAttribute("autoPayment");
%>


<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">

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
	</div>
	<!--css popup window 1 close-->
	<!--css popup window start 2-->




	<div class="container white">
		<div class="container-head">
			<div class="col-md-12" style="text-align: right;">
			
			</div>
		</div>

		<div class="container-body">

			<!-- center  part -->
				<div class="list-group">
					
					<div class="list-group-item">
					<form id="search-form" action="${pageContext.request.contextPath}/nach/autoPayment" >
					<% NachRequest req = (NachRequest)request.getAttribute("req");%>
					<table>
							<tr>
								<td class="searchpadding padding_top"><span class="style1"><b>Partner Name </b></span></td>
								<td class="searchpadding padding_top">
								<input name="partnerId" id="partnerId" type="hidden" value="<%=req.getPartnerId()!=null?req.getPartnerId():"" %>"/>
								<input value="<%=CommonUtils.emptyIfNull(req.getPartnerName()) %>" name="partnerName" id="partnerName" type="text" class="form-control"  />					
								
								</td>
							
								<td class="searchpadding padding_top"><span class="style1"><b>Product Name</b></span></td>
								<td>
						
							<span class="searchpadding padding_top"
							style="float: left; width: 200px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="productId" name="productId" class="required form-control" 	>
												<option value='0'>--Select--</option>								
						<%
						List<KeyValue> lst1=(List<KeyValue>)request.getAttribute("productList");
						for (KeyValue p:lst1){
						
								%>
								<option value='<%=p.getId()%>'><%=p.getName()%></option>
								<%
									}
								%>
						</select>
						</span>
							</td>	
							<td class="searchpadding padding_top"><span class="style1"><b>Frequency</b></span></td>
								<td>
						
							<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="frequencyId" name="frequencyId" class="required form-control" 	>
												<option value='0'>--Select--</option>								
						<%
						List<CodeValueData> lst=(List<CodeValueData>)request.getAttribute("frequencyLst");
						for (CodeValueData p:lst){
						
								%>
								<option value='<%=p.getCodeValueId()%>'><%=p.getCodeValue() %></option>
								<%
									}
								%>
						</select>
						</span>
							</td>	
								<!-- <input  type="hidden" id="quickSearchHiddenpart"   placeholder="Quick Search" style="width: 300px;"></td> -->
								
								<td class="searchpadding padding_top"><span class="style1"><b>Due In Next</b></span></td>
								<td>
						
							<span class="searchpadding padding_top"
							style="float: left; width: 100px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="dueInNext" name="dueInNext" class="required form-control" 	>
												<option value='0'>--Select--</option>								
						
								<option value="1">30 days</option>
								<option value="2">60 days</option>
								<option value="3">90 days</option>
								
						</select>
						</span>
							</td>	
							
							
								<td class="searchpadding padding_top">
								<input type="button" class="dbtn" id="SPNACHSearch" value="Show" title="Show"alt="Show" onClick="searchAutoPayment()">
								</a></td>
							</tr>	
							</table>
					</form>
						<div class="topmenu">
							<a  href="${pageContext.request.contextPath}/nach/autoPayment?format=xls" ><input
								data-params="{}" type="button" class="dbtn createNewBtn"
								value=" Download"
								title="  Download" alt=" autoPayment"/></a>

						</div>
						<div class="topmenu">
							<a  href="${pageContext.request.contextPath}/nach/sendToBillDesk" ><input
								type="button" class="dbtn createNewBtn"
								value=" Send to BillDesk" /></a>

						</div>
						
						<div class="table-responsive" id="display_table_lead"
							style="border: none;">
							<div id="toreload">


								<display:table id="data" name="autoPayment" requestURI="#"
									sort="list"
									class="table table-hover table-bordered table-striped"
									cellpadding="0" cellspacing="0" pagesize="${size}" style="min-height:180px;">
									
									<display:column sortable="true" title="Partner Name" >
										<span>${data.partnerName}</span>
									</display:column>

									<display:column sortable="true" title="Due Date" property="dueDate" format="{0,date,dd-MMM-yyyy}">
									<span>${data.dueDate}</span>
                                     </display:column>
                                    <%-- <display:column sortable="true" title="Frequency" property="frequency">
										<span>${data.frequency}</span>
									</display:column> --%>
									<display:column sortable="true" title="Product Name" property="productName">
										<span>${data.productName} </span>
										
									</display:column>
									<%-- <display:column sortable="true" title="Frequency" property="frequency">
										<span>${data.frequency}</span>
									</display:column> --%>
									<display:column sortable="true" title="Order Date" property="orderDate">
										<span>${data.orderDate}</span>
									</display:column>
									
									<display:column sortable="true" title="Amount" property="paymentAmount">
                                         <span>${data.paymentAmount}</span>
									</display:column>
									<display:column sortable="true" title="UMRN" property="umrn">
										 <span>${data.umrn}</span>
										<!-- subscription type to be added -->
									</display:column>
									<%-- <display:column  sortable="true" title="Action" style="width:80px;">
									<span class="dropdown"> <a id="Action6"   class="dropdown-toggle" href="#" data-toggle="dropdown" style="text-decoration: none;">Action<span class="caret"></span></a>
									<ul class="dropdown-menu" id="ActionMenu6" style="left:-120px !important;">
									<li ><a onClick="showAddNote(${data.partyId});popup('popUpAlertaddnote');" id="SPAutoPaymentLink" ><span class="user">Edit</span></a></li> 
									</ul></span>
									</display:column> --%>
								</display:table>

								<!-- Center-->
							</div>
						</div>
						
       
           
     </div> 
					</div>


				</div>
			</div>
			<!-- </div> -->
	<div style="display: none; z-index:95 !important ;" id="blanket"></div>
	<div style="display: none; width: 600px; height: 480px ! important; top: 100px ! important; overflow: auto;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		
		
<!-- edit start -->
 </div>	



		<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->

<script>
var selectedScript = null;

$(document).ready(function(){
	var cache = {};
	
	$("#partnerName").autocomplete({ 
		source: function (request, response) {
			var term = request.term;
	        if ( term in cache ) {
	          response( cache[ term ] );
	          return;
	        }
	        $.getJSON("${pageContext.request.contextPath}/subx/partnerList.json?searchText=" + request.term+"&searchType=NACH", function (data) {
	        	
	        	var output  = $.map(data, function (data) {
	        		//alert(data);
	                return {
	                	value: data.name,
	                    label: data.name,
	                  	id:data.id

	                };
	            }) ;
	        	cache[ term ] = output;
	            response(output);
	        });
	    },
	    autoFocus: true,
	    minLength: 2,
	    select: function (event, ui) {
	        event.preventDefault();
	        $("#partnerId").val(ui.item.id);
	        $("#partnerName").val(ui.item.label);
	        selectedScript = ui.item.label;
	    }
	});
	
	$( "#partnerName" )
	  .focusout(function() {
	        if($("#partnerName").val().length <=0 ){
	        	$("#partnerId").val("");
	        }
	        else if(selectedScript != $("#partnerName").val()){
	        	if($("#partnerName").val().length >0 && selectedScript.length ==0){
	        		//showMessage('Partner not found.',true);
	        		$("#partnerName").focus();
	        	}
	        	$("#partnerName").val(selectedScript);
	        	
	        }
	  })
	  ;
	selectedScript = $("#partnerName").val();
    });
    
</script>
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
	
	</script>
	<script>
	function saveNach(action) {
	
		    if(nachValidation()){
	 		$('#nach-form').submit();	
		    }
	}
	
	function searchAutoPayment(action) {
	//	alert($('#search-form').serialize())
 		$('#search-form').submit();	
	    
}
	
</script>
</body>
</html>
