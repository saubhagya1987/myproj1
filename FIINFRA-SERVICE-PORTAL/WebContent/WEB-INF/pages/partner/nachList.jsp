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

<% 
UserSession userSession = (UserSession) request.getSession().getAttribute("userSession");
List<NachData> nachData  = (List<NachData>) request.getAttribute("nachData");
 List<CodeValueData> lstStatus = (List<CodeValueData>) request.getAttribute("statusLst");
/*List<CodeValueData> lstFreq= (List<CodeValueData>) request.getAttribute("frequencyLst");
List<CodeValueData> accountTypeLst = (List<CodeValueData>) request.getAttribute("accountType"); */
List<Partner> lstPartner = (List<Partner>) request.getAttribute("lstPartner");

%>

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


	<script>
 $(document).ready(function(){	

		try{
			$('#startDate').datepicker({
				changeMonth : true,
				changeYear : true,
				minDate : '0',
				yearRange : "2000:2100",
				dateFormat : "d-M-yy"

			});
			}catch(e){
				try{
				$jq_1_9_1('#startDate').datepicker({
					changeMonth : true,
					changeYear : true,
					minDate : '0',
					yearRange : "2000:2200",
					dateFormat : "d-M-yy"

				});
				}catch(e){
					$jq_1_9_2('#startDate').datepicker({
						changeMonth : true,
						changeYear : true,
						minDate : '0',
						yearRange : "2000:2200",
						dateFormat : "d-M-yy"

					});
				}
			}
			try{
				$('#endDate').datepicker({
					changeMonth : true,
					changeYear : true,
					minDate : '0',
					yearRange : "2000:2200",
					dateFormat : "d-M-yy"

				});
				}catch(e){
					try{
					$jq_1_9_1('#endDate').datepicker({
						changeMonth : true,
						changeYear : true,
						minDate : '0',
						yearRange : "2000:2200",
						dateFormat : "d-M-yy"

					});
					}catch(e){
						$jq_1_9_2('#endDate').datepicker({
							changeMonth : true,
							changeYear : true,
							minDate : '0',
							yearRange : "2000:2200",
							dateFormat : "d-M-yy"

						});
					}
				}
				try{
					$('#registrationDate').datepicker({
						changeMonth : true,
						changeYear : true,
						minDate : '0',
						yearRange : "2000:2200",
						dateFormat : "d-M-yy"

					});
					}catch(e){
						try{
						$jq_1_9_1('#registrationDate').datepicker({
							changeMonth : true,
							changeYear : true,
							minDate : '0',
							yearRange : "2000:2200",
							dateFormat : "d-M-yy"

						});
						}catch(e){
							$jq_1_9_2('#registrationDate').datepicker({
								changeMonth : true,
								changeYear : true,
								minDate : '0',
								yearRange : "2000:2200",
								dateFormat : "d-M-yy"

							});
						}
					}
 });</script>
<script>
function showAddNote(nachId)
{
	
	$("#reportnote").hide();
	$("#extendnote").hide();
	resetval();
	$("#addNach").show();
	$("#popUpAlertaddnote").css ('height','750px');
	$("#popUpAlertaddnote").css ('width','650px');
	$("#popUpAlertaddnote").css ('left','550px');
	$("#popUpAlertaddnote").css ('top','445px');
	 $.ajax(
			    {
			        url : "${pageContext.request.contextPath}/nach/getCurrentNach?nachId="+nachId,
			        type: "GET",
			        dataType: 'json',
			        success:function(data, textStatus, jqXHR)
			        {
			        	
			        	if(data.nachFormId > 0  ){ 
			        	   $("#documentDownload").empty();
			 			     var moduleList='';
			                    moduleList+='<div>'
			                   +'<span class="searchpadding padding_top" style="float: left; width: 200px;" > Document Uploaded ' 
			                   +'</span>'
			                   +'<span class="searchpadding padding_top" style="float: left; ">'
			                   +'<a href="${pageContext.request.contextPath}/nach/files/'+data.nachFormId+'" name="nachFormId" id="nachFormId" value="Download" class="form-control" > '+data.docName
			                   +'</a>'		   
			                   +'</span>'
			                   
			                   $("#documentDownload").html(moduleList);
			                 }
			                 
			         
			               
			        	$('#partyId').val(data.partyId);
			        	$('#nachId').val(data.nachId);
						$('#party').val(data.partyName);
						$('#startDate').val(data.startDate);
						$('#endDate').val(data.endDate);
						$('#limitAmount').val(data.limitAmount);
						$('#registrationDate').val(data.registrationDate);
						$('#bankName').val(data.bankName);
						$('#phoneNo').val(data.phoneNo);
						$('#remark').val(data.remark);
						$('#errorDetail').val(data.errorDetail);
						$('#frequencyId').val(data.frequencyId);
						$('#statusId').val(data.statusId);
						$('#nachForm').val(data.nachForm);
						$('#emailId').val(data.email);
						$('#umrn').val(data.umrn);
						$('#accountNumber').val(data.accountNumber);
						$('#ifsc').val(data.ifsc);
						$('#micr').val(data.micr);
						$('#ref1').val(data.ref1);
						$('#ref2').val(data.ref2);
						$('#nachStatus').val(data.nachStatus);
						$('#accountId').empty();
						$('#nachStatus').empty();
						$('#frequencyId').empty();
						 for(var i=0;i<data['accountType'].length;i++){
							
							  var selected='';
							  if(data['accountId']==data['accountType'][i]['id']){
							   selected='selected';
							  }
							  $('#accountId').append('<option value="'+data['accountType'][i]['id']+'"'+selected+'>'+data['accountType'][i]['value']+'</option>');
							  //console.log(JSON.stringify(data['frequencies'][i]['value']));
							 }
							 
							 for(var i=0;i<data['status'].length;i++){
							  
							  var selected='';
							  if(data['statusId']==data['status'][i]['id']){
							   selected='selected';
							  }
							  
							  $('#nachStatus').append('<option value="'+data['status'][i]['id']+'"'+selected+'>'+data['status'][i]['value']+'</option>');
							  //console.log(JSON.stringify(data['frequencies'][i]['value']));
							  
							 }
							 for(var i=0;i<data['freq'].length;i++){
								
							  var selected='';
							  if(data['frequencyId']==data['freq'][i]['id']){
							   selected='selected';
							  }
							  $('#frequencyId').append('<option value="'+data['freq'][i]['id']+'"'+selected+'>'+data['freq'][i]['value']+'</option>');
							  //console.log(JSON.stringify(data['frequencies'][i]['value']));
							 }
						
			        },
			        error: function(jqXHR, textStatus, errorThrown)
			        {
			        	alert('Error getting Data');
			        }
			    
			    });
	 

}
function resetval(){
	 $('#nachId').val('');
	 $('#party').val('');
	 $('#startDate').val('');
	 $('#endDate').val('');
	 $('#limitAmount').val('');
	 $('#registrationDate').val('');
	 $('#bankName').val('');
	 $('#phoneNo').val('');
	 $('#remark').val('');
	 $('#frequencyId').val('');
	 $('#nachForm').val('');
	
}
</script>
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
				<!-- accordion start-->

				<div class="accordion pull-left col-md-12" id="accordFundSel">
					<div class="accordion-group">
						<div class="pull-left fundtool_left_col_head ">
							<span style="float: left;">Auto Payment List</span>
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
				<div class="list-group">
					
					<div class="list-group-item">
					<form id="search-form" action="${pageContext.request.contextPath}/nach/list" >
					<table>
							<% NachRequest req = (NachRequest)request.getAttribute("req");%>
							<tr>
								<td class="searchpadding padding_top"><span class="style1"><b>Partner Name </b></span></td>
								<td class="searchpadding padding_top">
								<input name="partnerId" id="partnerId" type="hidden" value="<%=req.getPartnerId()!=null?req.getPartnerId():"" %>"/>
								<input value="<%=CommonUtils.emptyIfNull(req.getPartnerName()) %>" name="partnerName" id="partnerName" type="text" class="form-control"  />					
								
								</td>
							<!-- </tr>
							
							<tr> -->
								<td class="searchpadding padding_top"><span class="style1"><b>NACH status</b></span></td>
								<td>
						
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="statusId" name="statusId" class="required form-control" 	>
												<option value='0'>--Select--</option>								
						<%
						for (CodeValueData p:lstStatus){
						
								%>
								<option value='<%=p.getCodeValueId()%>'><%=p.getCodeValue() %></option>
								<%
									}
								%>
						</select>
						</span>
						</td>		
								<!-- <input  type="hidden" id="quickSearchHiddenpart"   placeholder="Quick Search" style="width: 300px;"></td> -->
								
								
							
							
								<td class="searchpadding padding_top"><a href="#" style="color: #fff;">
								<input type="button" class="dbtn" id="SPNACHSearch" value="Show" title="Show"alt="Show" onClick="searchNACHDetail()">
								</a></td>
							</tr>	
							</table>
							</form>
						<div class="topmenu">
							<a  href="${pageContext.request.contextPath}/nach/list?format=xls" ><input
								data-params="{}" type="button" class="dbtn createNewBtn"
								value=" Download" id="SPNACHDownload"
								title="  Download" alt=" NACH"/></a>

						</div>
						<div class="topmenu">
							<a  href="${pageContext.request.contextPath}/nach/autoPayment" ><input
								data-params="{}" type="button" class="dbtn createNewBtn"
								value=" Auto Payment Due" 
								title="  Auto Payment Due" /></a>

						</div>
						
						<div class="table-responsive" id="display_table_lead"
							style="border: none;">
							<div id="toreload">


								<display:table id="data" name="nachData" requestURI="#"
									sort="list"
									class="table table-hover table-bordered table-striped"
									cellpadding="0" cellspacing="0" pagesize="${size}" style="min-height:180px;">
									
									<display:column sortable="true" title="Partner Name" >
										<span>${data.partyName}</span>
									</display:column>

									<display:column sortable="true" title="Start Date" property="startDate" format="{0,date,dd-MMM-yyyy}">
									<span>${data.startDate}</span>
                                     </display:column>
									<display:column sortable="true" title="End Date" property="endDate" format="{0,date,dd-MMM-yyyy}"  >
									<span>${data.endDate}</span>
                                      </display:column>
									<display:column sortable="true" title="Error Detail" property="errorDetail"  >
									<span>${data.errorDetail}</span>
									</display:column>
									<display:column sortable="true" title="Remark" property="remark">
										<span>${data.remark}</span>
									</display:column>
									<display:column sortable="true" title="Frequency" property="frequency">
										<span>${data.frequency}</span>
									</display:column>
									<display:column sortable="true" title="NACH Status" property="nachStatusCode">
										<span>${data.nachStatusCode}</span>
									</display:column>
									<display:column sortable="true" title="Amount" property="limitAmount">
                                         <span>${data.limitAmount}</span>
									</display:column>
									<display:column sortable="true" title="UMRN" property="umrn">
										 <span>${data.umrn}</span>
										<!-- subscription type to be added -->
									</display:column>
									<display:column  sortable="true" title="Action" style="width:80px;">
							<span class="dropdown"> <a id="Action6"   class="dropdown-toggle" href="#" data-toggle="dropdown" style="text-decoration: none;">Action<span class="caret"></span></a>
							<ul class="dropdown-menu" id="ActionMenu6" style="left:-120px !important;">
							<li ><a onClick="showAddNote(${data.nachId});popup('popUpAlertaddnote');" id="SPAutoPaymentLink" ><span class="user">Edit</span></a></li> 
							</ul></span>
							</display:column>
								</display:table>

								<!-- Center-->
							</div>
						</div>
						
       
           
     </div> 
					</div>


				</div>
			</div>
			<!-- </div> -->
		
	<!--css popup window start 2-->






	<div style="display: none; z-index:95 !important ;" id="blanket"></div>
	<div style="display: none; width: 600px; height: 480px ! important; top: 100px ! important; overflow: auto;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		
		<div id="addNach">
			<form id="nach-form" action="${pageContext.request.contextPath}/nach/save" 
			 method="POST" enctype="multipart/form-data">
			    <input id="partyId" name="partyID" type="hidden"  />
				<input id="nachId" name="nachId" type="hidden"  />
				<div id="popupwrapper_contactform">
					<div class="heading_contactform">
						<h3 id="popUpTitle">NACH</h3>
					</div>
					<div id="poptable_contactform"
						style="padding: 10px; height: 840px ! important; left: 350px !important;">
						<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" >Partner Name (As In Bank Account)<span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="PartyName" id="party"
							class="form-control " maxlength="20"></span>
							<div class="clearfix"></div>
						<span  class="searchpadding padding_top"
							style="float: left; width: 200px;">E-mail<span
							class="red">*</span>
							</span> 
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text" 
							name="email" id="emailId"
							class="form-control" maxlength="50" >
						</span>
						<div class="clearfix"></div>
						<span  class="searchpadding padding_top"
							style="float: left; width: 200px;">Phone No
							</span> 
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text" 
							name="mobile" id="phoneNo"
							class="form-control" maxlength="50" >
						</span>
						<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Bank Name <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="bankName" id="bankName"
							class="form-control " maxlength="20"></span>
							<div class="clearfix"></div>
							<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Account Type  <span
							class="red">*</span>
						</span> 
						
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="accountId" name="accountId" class="required form-control" 	>
														
								
						</select>
						</span>
						<div class="clearfix"></div>
						<span  class="searchpadding padding_top"
							style="float: left; width: 200px;">Account Number<span
							class="red">*</span>
							</span> 
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text" id="accountNumber"
							name="accountNumber" 
							class="form-control" maxlength="50" >
						</span>
						<div class="clearfix"></div>
								<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > MICR <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="micr" id="micr"
							class="form-control " maxlength="20"></span>
							<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > IFSC <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="ifsc" id="ifsc"
							class="form-control " maxlength="20"></span>
							<div class="clearfix"></div>
	
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Registration Date <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="registrationDate" id="registrationDate" onfocus="this.blur()"
							class="form-control " maxlength="20"></span>
							<div class="clearfix"></div>
						<span  class="searchpadding padding_top"
							style="float: left; width: 200px;">Start Date<span
							class="red">*</span>
							</span> 
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							 name="startDate" id="startDate" onfocus="this.blur()"
							class="form-control" maxlength="50" >
						</span>
						<div class="clearfix"></div>
						<span  class="searchpadding padding_top"
							style="float: left; width: 200px;">End Date<span
							class="red">*</span>
							</span> 
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="endDate" id="endDate" onfocus="this.blur()"
							class="form-control" maxlength="50" >
						</span>
							
						<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > UMRN 
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="umrn" id="umrn"
							class="form-control " maxlength="20"></span>
								<div class="clearfix"></div>
							<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Status <span
							class="red">*</span>
						</span> 
						
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="nachStatus" name="statusId" class="required form-control" 	>
					
						</select>
						</span>
						<div class="clearfix"></div>
						
							<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" >Remark
						  </span><span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <textarea
							 class="form-control"  name="remark" id="remark" 
							maxlength="50"></textarea></span>
							<div class="clearfix"></div>
						
							<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" >Error Detail
						  </span><span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <textarea
							 class="form-control"  name="errorDetail" id="errorDetail" 
							maxlength="50"></textarea></span>
						
							<div class="clearfix"></div>
                            
							<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Frequency <span
							class="red">*</span>
						</span> 
						
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <!-- <input type="text" id="pktSn" name="pktSn" class="form-control"> -->
						
						<select id="frequencyId" name="frequencyId" class="required form-control" 	maxlength="20">
															
						</select>
						</span>
								<div class="clearfix"></div>
					   	
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Limit Amount <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="limitAmount" id="limitAmount"
							class="form-control " maxlength="20"></span>
								<div class="clearfix"></div>
						
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Reference1 
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="referece1" id="ref1"
							class="form-control " maxlength="20"></span>
							
							<div class="clearfix"></div>
					   	<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Reference2 
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							name="refernce2" id="ref2"
							class="form-control " maxlength="20"></span>
							
						<div id="documentDownload">	
					   	<%-- <span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Document Download 
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="button" src="${pageContext.request.contextPath}/nach/files" 
							name="documentId" id="documentId" value="Download"
							class="form-control" /></span> --%>
							</div>
							<div class="clearfix"></div>
							<span class="searchpadding padding_top"
							style="float: left; width: 200px;" > Document Upload
						  </span>
							<div class="browse_file clearfix fl" id="browse_file" class="clearfix fl">
							<span class="searchpadding padding_top"
							style="float: left; width: 300px;">
	          		<input type="file"  value="Browse" name="nachForm" />
	                </span>
	          </div>
	          <div class="clearfix"></div>
						
						<br />
						</div>
						 <input
       class="dbtn" value="Cancel" id="Cancel" style="float:right;" type="button"
       onclick="popup('popUpAlertaddnote'); ">
       <input class="dbtn" value="Save" style="float:right;"
       id="Save" type="button" onclick="saveNach(0);">
					

				</div>
			</form>
		</div>
<!-- edit start -->
 </div>	



		<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->

<script >


	
	
	
	function close(){
		$("#addnote").hide();
		$("#editnote").hide();
		clearData();
	}
	function eresetval(){
		
	}
	
	</script>
	<script>
	function saveNach(action) {
	
		    if(nachValidation()){
	 		$('#nach-form').submit();	
		    }
	}
	
	function searchNACHDetail(action) {

 		$('#search-form').submit();	
			
}
	function nachValidation(){
		
		if($("#startDate").datepicker('getDate') == null){
			alert(" Please enter start date ");
			$("#startDate").focus();
			return false ;
		}
		if($("#endDate").datepicker('getDate') == null){
			alert(" Please Enter End Date ");
			$("#endDate").focus();
			return false ;	
		}
		if($("#startDate").datepicker('getDate') >  $("#endDate").datepicker('getDate')  ){
			alert("Start date cannot be greater than end date ");
			$("#endDate").focus();
			return false ;
		}
		if($("#limitAmount").val() < 500){
			alert(" Please add a limit amount ")
			$('#limitAmount').focus();
			return false ;	
		}
		if($("#accountNumber").val() == ""){
			alert(" Please enter a account number ");
			$("#accountNumber").focus();
			return false ;	
		}
		if($("#emailId").val() == ""){
			
			alert(" Please enter a mail Id ");
			$('#emailId').focus();
			return false ;	
		}
		if($("#micr").val().trim() == ""){
			alert(" Please enter a MICR code");
			$("#micr").focus();
			return false ;	
		}
		if($("#ifsc").val().trim() == ""){
			alert(" Please enter a IFSC code");
			$("#ifsc").focus();
			return false ;	
		}
		if(  $("#umrn").val() == "" && ($('#statusId').val()=='155005')){
			alert(" Please Enter Valid UMRN Number");
			$("#umrn").focus();
			return false ;	
		}
		if($("#emailId").val() != ""){
			var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			
            if (reg.test($("#emailId").val()) == false) 
            {
                alert('Invalid Email Address');
                $('#emailId').focus();
                return (false);
            }
		}
	if($("#phoneNo").val() != ""){
		 var regExp = /^(\([0-9]{3}\) |[0-9]{3})[0-9]{3}[0-9]{4}/;
			
            if (regExp.test($("#phoneNo").val()) == false) 
            {
                alert('Invalid phone number');
                $('#phoneNo').focus();
                return (false);
            }
            if ($("#phoneNo").val().length > 10 || $("#phoneNo").val().length < 10) 
            {
                alert('Invalid phone number');
                $('#phoneNo').focus();
                return (false);
            }
		}
	if($("#ifsc").val() != ""){
		 var regExp = /^([0-9]|[a-z])+([0-9a-z]+)$/i;
			
           if (regExp.test($("#ifsc").val()) == false) 
           {
               alert('Enter proper IFSC code');
               $('#ifsc').focus();
               return (false);
           }
		}
	if($("#micr").val() != ""){
		var regExp = /^([0-9])+([0-9]+)$/i;
			
          if (regExp.test($("#micr").val()) == false) 
          {
              alert('Enter proper MICR code');
              $('#micr').focus();
              return (false);
          }
		}
	if($("#umrn").val() != ""){
		 var regExp = /^([0-9]|[a-z])+([0-9a-z]+)$/i;
			
         if (regExp.test($("#umrn").val()) == false) 
         {
             alert('Enter proper UMRN code');
             $('#umrn').focus();
             return (false);
         }
		}
	if($("#startDate").val() != null){
		 var reg =/^([0-9]{1,2})-([A-Z]{1}[a-z]{2})-([0-9]{4})$/;	
		 if(reg.test($("#startDate").val()) == false){
			 alert(" Please enter proper date format ");
				$("#startDate").focus();
				return false ;
		 } 
		}
	if($("#endDate").val() != null){
		 var reg =/^([0-9]{1,2})-([A-Z]{1}[a-z]{2})-([0-9]{4})$/;
		 if(reg.test($("#endDate").val()) == false){
			 alert(" Please enter proper date format ");
				$("#endDate").focus();
				return false ;
		 }
		}
	if($("#accountNumber").val() != ""){
		if( $("#accountNumber").val().length > 15 )
			{
			  alert('Enter proper account number');
              $('#accountNumber').focus();
              return (false);
			}
		 var regExp = /^([0-9])+([0-9]+)$/i;
			
          if (regExp.test($("#accountNumber").val()) == false  ) 
          {
              alert('Enter proper account number');
              $('#accountNumber').focus();
              return (false);
          }
		}
	
	
		
		 return true ;
		 
	}

</script>
</body>
</html>
