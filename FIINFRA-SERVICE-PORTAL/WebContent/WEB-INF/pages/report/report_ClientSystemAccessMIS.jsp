<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>


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
<title>Reports</title>

<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>-->
<script src="<%=request.getContextPath()%>/js/holder.js"></script>
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/report.js"> </script>
<script src='<%=request.getContextPath()%>/js/common.js'></script>




<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/report.css" />
<!-- -responsive css-->
<!--<script	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>-->
<script type="text/javascript">


$jq_1_9_1=$.noConflict();

</script>
<link href="<%=request.getContextPath()%>/images/favicon.ico"rel="shortcut icon">


<style>
a.list-group-item.active {
 z-index: 0;
  color: #ffffff;
  background-color: #ae2760;
  border-color: #ae2760;
}
</style>


</head>
<body>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
  value="<%=request.getContextPath()%>" />

	<div style="display: none;" id="blanket"></div>
	<div
		style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto;z-index: 10000000000000 !important"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');resetVal();" href="#"><img alt=""
				src="images/btn_close.gif" /></a>
		</div>

		<div id="reportnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Report</h3>
				</div>
				<div id="downloadOptions" align="right" style="display:none;">
			
					<br><br>
					Download Report as:
					 <a class="pdficon" title="Download in Pdf" alt="Download in Pdf"href="#" onclick="downLoginExcpReport('pdf',${sessionScope.userSession.buId})"></a>
					 <a class="excelicon" title="Download in Excel" alt="Download in Excel"href="#" onclick="downLoginExcpReport('xls',${sessionScope.userSession.buId})"></a>
					 <a class="docicon" title="Download in Doc" alt="Download in Doc" href="#" onclick="downLoginExcpReport('doc',${sessionScope.userSession.buId})"></a>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 850px;">

					<!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

					<div id="reportview"></div>
				</div>
			</div>
		</div>
	</div>		</div>
	</div>


	<!--css popup window start 1-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 450px; height: 380px;" id="popUpDiv">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpDiv')" href="#"><img alt=""
				src="images/btn_close.gif" /></a>
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




	<div class="container white">
		<div class="container-head">
			<div class="col-md-12" style="text-align: right;">
				<!-- accordion start-->

				<div class="accordion pull-left col-md-12" id="accordFundSel">
					<div class="accordion-group">
						<div class="pull-left fundtool_left_col_head ">
							<span style="float: left;">Reports</span>
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
					<a class="list-group-item active" href="#">Partner MIS Reports</a>

					 	 <a id="" href="loadreportPartnerPre-printedFormsMIS.htm"  class="list-group-item">Partner Pre-printed Forms MIS</a>
							<a id="" href="loadreportServiceTeamPartnerActivityMIS.htm" class="list-group-item" href="#">Service Team Partner Activity MIS</a>  	
              				<a id="" href="loadreportServiceTeamPartnerActivityDetails.htm" class="list-group-item" href="#">Service Team Partner Activity Details</a>
              				<a id="" href="loadreportPartnerOperationsMIS.htm" class="list-group-item" href="#">Partner Operations MIS</a>
              				<a id="" href="loadreportPartnerActivityMIS.htm" class="list-group-item" href="#">Partner Activity MIS</a>
              				<a id="" href="loadreportPartnerSystemAccessMIS.htm" class="list-group-item" href="#">Partner System Access MIS</a>
              				<!-- <a id="" href="loadreportClientSystemAccessMIS.htm" class="list-group-item" href="#"><strong>Client System Access MIS</strong></a> -->
				</div>
				<!-- <div class="list-group">
					<a class="list-group-item active" href="#">Schedule Report</a>
				</div> -->
			</div>
			<div class="col-md-9" style="margin-top: 10px; padding-left: 10px;">

				<!-- center -->

					<a class="list-group-item active" href="#">Client System Access MIS</a>
				<div class="list-group">
					<div class="list-group-item">
						<!-- Search start-->
						
							
						<form onsubmit="return false">
							<div class="searchboxreport" id="hidesumRpt">
							<table>
							
							<tr>
								<td><span class="style1"><b>Start Date </b></span></td>
								<td><input type="text" name="Startdatename" id="datepicker" class=" " readonly='true' value=" "></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr>
								<td><span class="style1"><b>End Date </b></span></td>
								<td><input type="text" name="Enddatename" id="datepicker1" class=" " readonly='true' value=" "></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr>
								<td><a href="#" style="color: #fff;" onClick="reportnote();getLoginExcpReport('SP_SystemAccessHistory.rptdesign',${sessionScope.userSession.buId})"> 
								<input type="submit" class="dbtn " value="Show" title="Show" alt="Show" onClick="popup('popUpAlertaddnote')">
								</a> </td>
							</tr>								
							 </table>
							</div>
							<!-- div added by shrinivas -->
							<div class="searchboxreport" id="showErrDiv" style="display:none;">
								<span style="text-align:center;display: inline-block; width:100%;margin-top:150px;font-weight:bold;font-size:15px;color:green;margin-bottom: 150px;">You are not authorized to view this page, please contact admin.</span>
							</div>
								 </form>
					
					</div>

						
						<!-- Search start-->
						<div class="row" style="display: none;" id="showreport">
							<ul class="pagination pagination-sm">
								<li class="disabled"><a href="#">&laquo;</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>


							<div class="topmenuleft">
								<ul>
									<li>Export Options:</li>
									<li><a href="#" title="Export in CVS" alt="Export in CVS"><i
											class="cvsicon"></i></a></li>
									<li><a href="#" title="Export in Excel"
										alt="Export in Excel"> <i class="excelicon"></i></a></li>
									<li><a href="#" title="Export in XML" alt="Export in XML"><i
											class="xmlcon"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br /> <br />
	<footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>


	<!-- Center part End -->

	


	<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> 
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->
	<script type="text/javascript">

  
	function quickSearchPartner(e){

		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			search();
			return;
		}
		$('#common_popup_div,#shadow_div_web_app').remove();
		//alert($('#quickSearch').val());
	$.ajax({
		  url: $('#contextPath').val()+"/birtreport/getPartnerList.htm?searchString="+$('#quickSearchpart').val(),
		  method:"post",
		  success:function(result){
 
			 
			  var userLabelValueList = new Array();
				 $(result).each(function(i,obj){
						var object = {};
						object.value = obj.partyID;

						object.label = obj.partnerName;
						userLabelValueList.push(object);
					/* 	alert("Hello:::::"+ obj.partyID);
						alert("Hi:::::::::"+obj.partnerName); */
						
				 }); 
// 				 alert("object.label:::"+  object.label);
				 $("#quickSearchpart")
				    // don't navigate away from the field on tab when selecting an item
				    .bind( "keydown", function( event ) {
				      if ( event.keyCode === $.ui.keyCode.TAB &&
				    	$( this ).data( "ui-autocomplete" ).menu.active ) {
				        event.preventDefault();
				      }
				    })
				   
				    
				    .autocomplete({
				      minLength: 0,
				      source: function( request, response ) {
				       last=extractLast(request.term);
				       if(last==null || last=='' || last==' ')
						{
							return false;
						}
				       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
				      },
				      focus: function() {
				        // prevent value inserted on focus
				        return false;
				      },
				     
				      select: function( event, ui ) {
				    	  var terms = split( this.value );
					        
					        console.log('terms='+terms);
					        
					        // remove the current input
					        terms.pop();
					        // add the selected item 
					        terms.push(ui.item.label);
// 					        	partyId=ui.item.value;
					        	$('#quickSearchHiddenpart').val(ui.item.value)
						
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
					        var labelArr = $(this).data('label') || new Array();
					        labelArr.push(ui.item);
					        $(this).data('label',labelArr);
					        console.log($(this).data());
					        
					        return false;
				      }
				    });
			  
				
		  }
		});

	}
	
	
function quickSearchContacts(e){
		
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			search();
			return;
		}
		$('#common_popup_div,#shadow_div_web_app').remove();
		//alert($('#quickSearch').val());
	$.ajax({
		  url: $('#contextPath').val()+"/birtreport/getClientList.htm?searchString="+$('#quickSearch').val()+"&partnerId="+$('#quickSearchHiddenpart').val(),
				  
		  method:"post",
		  success:function(result){
 
			 
			  var userLabelValueList = new Array();
				 $(result).each(function(i,obj){
						var object = {};
						object.value = obj.partyID;
						object.label = obj.clientName;
					/* alert("obj.partyID :::::"+obj.partyID);
					alert("obj.clientName :::::"+obj.clientName); */
					
						userLabelValueList.push(object);
					
				 }); 
				 
				 $("#quickSearch")
				    // don't navigate away from the field on tab when selecting an item
				    .bind( "keydown", function( event ) {
				      if ( event.keyCode === $.ui.keyCode.TAB &&
				    	$( this ).data( "ui-autocomplete" ).menu.active ) {
				        event.preventDefault();
				      }
				    })
				   
				    
				    .autocomplete({
				      minLength: 0,
				      source: function( request, response ) {
				       last=extractLast(request.term);
				       if(last==null || last=='' || last==' ')
						{
							return false;
						}
				       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
				      },
				      focus: function() {
				        // prevent value inserted on focus
				        return false;
				      },
				     
				      select: function( event, ui ) {
				    	  var terms = split( this.value );
					        
					        console.log('terms='+terms);
					        
					        // remove the current input
					        terms.pop();
					        // add the selected item 
					        terms.push(ui.item.label);
// 					        	partyId=ui.item.value;
					        	$('#quickSearchHidden').val(ui.item.value)
						
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
					        var labelArr = $(this).data('label') || new Array();
					        labelArr.push(ui.item);
					        $(this).data('label',labelArr);
					        console.log($(this).data());
					        
					        return false;
				      }
				    });
			  
			
		  }
		});

	}
	 function split( val ) {
		    return val.split( /;\s*/ );
		} 
		function extractLast( term ) {
		    return split( term ).pop();
		} 
	
	
    function  reportnote()
    {
    	//alert(('#opportunityStatus').val());
    	$("#reportnote").show();
    	$("#popUpAlertaddnote").css ('height','1000px');
    	$("#popUpAlertaddnote").css ('width','1100px');
    }
    

    
    
    </script>
  <script>
 /*  $(function() {
	    $( "#from" ).datepicker({
	    	  dateFormat: "dd/mm/yy",
	      defaultDate: "+1w",
	     // changeMonth: true,
	      changeMonth: true,
	      changeYear: true,
	      numberOfMonths: 1,
		 // minDate:"-1Y",
	      onClose: function( selectedDate ) {
	        $( "#to" ).datepicker( "option", "minDate", selectedDate );
	      }
	    });
	    $( "#to" ).datepicker({
	    	  dateFormat: "dd/mm/yy",
	      defaultDate: "+1w",
	      changeMonth: true,
	      changeYear: true,
	      changeMonth: true,
	      //numberOfMonths: 1,
	      onClose: function( selectedDate ) {
	        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
	      }
	    });
	    
	    $(function() {
	        var date = new Date(); // replace with your date
	        $("#to").val(getCurrentDate());
	   });
	    
	    
	    $(function() {
	        var date = new Date(); // replace with your date
	        $("#from").val(getLastDate());
	   });
	  });
	  
	  
	  
function getCurrentDate(){
	  today_date = new Date();
	 // alert(today_date)

	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +today_date.getFullYear();
	  var last_Date_Str;	
	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +String(today_date.getFullYear()-1);
		
	 // alert("Last year"+last_Date_Str)

		
	  return today_Date_Str;
	}

	function getLastDate(){
		 today_date = new Date();
		 var last_Date_Str;	
		 last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +String(today_date.getFullYear()-1);
		 // alert("Lasttt year"+last_Date_Str)

		 return last_Date_Str;
	}

  
   $('#quickSearch').keyup(function() {
	     $(this).val(function(i, value) {
	        return value.replace(/\s/, '');
	     }); 
	 });
  
   */
   
   $(function() {
	  	  
	    $( "#datepicker" ).datepicker({
	    	dateFormat: "dd/mm/yy",
		      defaultDate: "+1w",
		      changeMonth: true,
		      changeYear: true,
	    });
	  }); 
		    function getCurrentDate(){
		  	  today_date = new Date();
		  	 // alert(today_date)

		  	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +today_date.getFullYear();
		  	  var last_Date_Str;	
		  	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +String(today_date.getFullYear()-1);
		  		
		  	 // alert("Last year"+last_Date_Str)

		  		
		  	  return today_Date_Str;
		  	}	

		    $(function() {
		        var date = new Date(); // replace with your date
		        $("#datepicker").val(getCurrentDate());
		   });
		    
		    
		    $(function() {
		    	  
			    $( "#datepicker1" ).datepicker({
			    	dateFormat: "dd/mm/yy",
				      defaultDate: "+1w",
				      changeMonth: true,
				      changeYear: true,
			    });
			  }); 
				    function getCurrentDate(){
				  	  today_date = new Date();
				  	 // alert(today_date)

				  	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +today_date.getFullYear();
				  	  var last_Date_Str;	
				  	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +String(today_date.getFullYear()-1);
				  		
				  	 // alert("Last year"+last_Date_Str)

				  		
				  	  return today_Date_Str;
				  	}	
		 
				    $(function() {
				        var date = new Date(); // replace with your date
				        $("#datepicker1").val(getCurrentDate());
				   });
				    
   function resetVal()
  {
	 
    $('#datepicker1').val(getCurrentDate());
    $('#datepicker').val(getCurrentDate());
    
  }
  

        
</script>  
</body>
</html>