<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>


<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Reports</title>


</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />

	<div style="display: none;" id="blanket"></div>
	<div
		style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto; z-index: 10000000000000 !important"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');resetVal();" href="#"><img
				alt="" src="images/btn_close.gif" /></a>
		</div>

		<div id="reportnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Report</h3>
				</div>
				<div id="downloadOptions" align="right" style="display: none;">

					<br> <br> Download Report as: <a class="pdficon"
						title="Download in Pdf" alt="Download in Pdf" href="#"
						onclick="downPingDelivery('pdf',${sessionScope.userSession.buId},${sessionScope.userSession.partyId})"></a>
					<a class="excelicon" title="Download in Excel"
						alt="Download in Excel" href="#"
						onclick="downPingDelivery('xls',${sessionScope.userSession.buId},${sessionScope.userSession.partyId})"></a>
					<a class="docicon" title="Download in Doc" alt="Download in Doc"
						href="#"
						onclick="downPingDelivery('doc',${sessionScope.userSession.buId},${sessionScope.userSession.partyId})"></a>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 850px;">

					<!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

					<div id="reportview"></div>
					<div id="gen2"></div>
				</div>
			</div>
		</div>
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

   <!-- center  part -->
        <span class="list-group"></span>
      
       
     <div class="page-header">
		<h1 class="pull-left">Pings </h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row"> 
        
        <!-- center  part -->
        <span class="list-group"></span>
      <div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px; padding-left:10px;" >
            <div class="list-group">
        		<a href="loadreportPingDelivery.htm" class="list-group-item active" href="#">Ping Reports</a>
                 <a href="loadreportPingDelivery.htm" class="list-group-item" id="pingDeliveryReportLink"> Ping Delivery Report </a>
              	<a href="loadPingMISReport.htm" class="list-group-item" href="#" id="pingMISReportLink">Ping MIS Report</a>  	
               
                <a href="loadPingDNDList.htm" class="list-group-item" href="#" id="pingDNDReportLink"><strong>Ping DND List</strong></a>
                
                       </div>
        </div>
      <div class="col-md-9"> 
            				
                    <div class="clearfix"></div>
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Ping DND List</a>
           <div class="list-group-item">
           
						 
            					<!-- PAGE CONTENT BEGINS -->
            					<div class="modal-body">		 
              					<form class="form-horizontal" role="form" onsubmit="return false">
              					<input  type="hidden" id="abc"   placeholder="Quick Search" style="width: 300px;">
              					<div class="searchboxreport" id="reportview">
							 
              					
              				<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Client Name :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input name="text" type="text" id="quickSearch" name="searchString" onKeyUp="quickSearchContacts(this);" placeholder="Quick Search" style="width: 300px;">
									<input name="text" type="hidden" id="quickSearchHidden" name="searchString"  placeholder="Quick Search" style="width: 300px;">
									(Optional)
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
                				
				              <div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Start Date :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="Startdatename" id="from" class=" " readonly='true'>
								</div>
							</div>     
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >End Date :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="Enddatename" id="to" class=" " readonly='true'>
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						 <div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="submit" class="btn btn-xs btn-primary" value="Show" title="Show" alt="Show" onClick="getPingDNDList(${sessionScope.userSession.partyId},${sessionScope.userSession.buId},${sessionScope.nodeId});resetVal();">
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>	
							</div>
							
							<!-- div added by shrinivas -->
							<div class="searchboxreport" id="showErrDiv" style="display:none;">
								<span style="text-align:center;display: inline-block; width:100%;margin-top:150px;font-weight:bold;font-size:15px;color:green;margin-bottom: 150px;">You are not authorized to view this page, please contact admin.</span>
							</div>
				                </form>
            					</div>
            					</div>
</div></div>      	<br/><br/>
       	</div>

      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />


	<script type="text/javascript">
	
	function getPingDNDList(partyid,buid,nodeId)
	{
		  var buId = buid;
		  var PartnerId = partyid;
		  var ClientId=$("#quickSearchHidden").val();
		  
		  var StartDate=$("#from").val();
		  var EndDate=$("#to").val();
		  
		  var StartDate1=$("#from").val();
		  var EndDate1=$("#to").val();
		  
		  var dt = StartDate.split("-");
		  var day = dt[0];
		  var month = dt[1];
		  var year = dt[2];
		  StartDate = month+"-"+day+"-"+year;
		   		  
		  var dt = EndDate.split("-");
		  var day = dt[0];
		  var month = dt[1];
		  var year = dt[2];
		  EndDate = month+"-"+day+"-"+year;
		  
		  var loggedpartyId=partyid; 
		  

		 /*  var reportLink= $('#abc').val(); */
		  url="PingDNDList&rs:Command=Render&rc:Parameters=false&buID="+buId+"&partnerId="+PartnerId+"&partyId="+ClientId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&loggedpartyId="+loggedpartyId+"&nodeId="+nodeId+"";
		  callReport(url);
		  
		 /*  var reportview2 = "<iframe src="+url+" width='1010' height='840'></iframe>";
		  $("#gen2").html(reportview2); */
		 
		  
		  var actionByUserID = ${sessionScope.userSession.userId};
		  var sourceModule='Ping Reports';
		  var sourceScreen='Ping DND List';
		  var objectName = 'BussinessUnitID::'+buId+',PartnerPartyID::'+PartnerId+',ClientPartyID::'+ClientId+',StartDate::'+StartDate1+',EndDate::'+EndDate1+',LoggedInPartyID::'+loggedinpartyId+',NodeId'+nodeId;
		  $.ajax({
				 type :'POST',
		      	 url : $('#contextPath').val() +"/birtreport/doauditforreport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
				 success : function(result) 
				 {
					 
				 }
			}); 
	}
	
	function search(){
		$('#partyId').val(map[$('#quickSearch').val()]);
		document.getApDataForm.action=$('#contextPath').val()+"/et/getApDetails.htm";
		document.getApDataForm.submit();
	}
	$(document).ready(function(){
		
		$('#quickSearch').keypress(function(event){

			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				search();
			}
			event.stopPropagation();
		});
	}); 
  
	 function quickSearchContacts(e){
	  		var event = window.event ? window.event : e;
	  		
	  		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
	  			return;
	  		if(event.keyCode==13){
	  			search();
	  			return;
	  		}
	  		$('#common_popup_div,#shadow_div_web_app').remove();
	  	    $.ajax({
	  		url: $('#contextPath').val()+"/et/quickSearchContacts.htm?searchString="+$('#quickSearch').val(),
	  		  method:"post",
	  		  success:function(result){
	  						  var userLabelValueList = new Array();
	  							 $(result).each(function(i,obj){
	  									var object = {};
	  									object.value = obj.partyId;
	  									object.label = obj.fName+' '+obj.lName;
	  						
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
	  								        	$('#quickSearchHidden').val(ui.item.value)
	  									
	  								        terms.push( "" );
	  								        this.value = terms.join( ";" );
	  								        
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
	  				
	 // --------Code for Quick serarch validation---------  

    $('#quickSearch').blur(function(){
		 var arr = extractLast($('#quickSearch').val());
		 this.value = this.value.replace(arr, '');
		 this.value = this.value.replace(/;/, '');
	  }); 

	$('#quickSearch').click(function(){
		$('#quickSearch').val('');
		$('#quickSearchHidden').val('');
	  }); 
	
	  function resetVal()
		 {
		   $('#quickSearch').val('');
		   $('#from').val(getLastDate());
		   $('#to').val(getCurrentDate());

		 }
	    function  reportnote()
	    {
			/* bootbox.dialog({
	            title: "Report",
	            message: '<div id="reportnote">'+
			'<div id="popupwrapper_contactform">'+
			  '<div id="downloadOptions" align="right" style="display:none;">'+
			   '<br>'+
			    '<br>'+
			  '</div>'+
			  '<div id="poptable_contactform" style="padding: 10px; height: 850px;">'+
			    '<div id="reportview"></div>'+
			    '<div id="gen2"></div>'+
			  '</div>'+
			'</div>'+
			'</div>',
	           className: "popUpAlertaddnote",
	        }
	    );			 */
		
		$(".popUpAlertaddnote .modal-dialog").css('height','100%');
		$(".popUpAlertaddnote .modal-dialog").css('width','86%');
	    $("#reportnote").css({'width':'100%','overflow':'auto'});
		$("#reportnote").show();
	    }
    
    $('#quickSearch').keyup(function() {
	     $(this).val(function(i, value) {
	        return value.replace(/\s/, '');
	     }); 
	 });
  $(function() {
	    $( "#from" ).datepicker({
	      dateFormat: "dd-mm-yy",
	      defaultDate: "+1w",
	      //changeMonth: true,
	      changeMonth: true,
	      changeYear: true,
	      numberOfMonths: 1,
	      yearRange:"1980:2025",
	      onClose: function( selectedDate ) {
	        $( "#to" ).datepicker( "option", "minDate", selectedDate );
	      }
	    });
	    $( "#to" ).datepicker({
	      dateFormat: "dd-mm-yy",
	      defaultDate: "+1w",
	      changeMonth: true,
	      changeYear: true,
	      changeMonth: true,
	      yearRange:"1980:2025",
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
	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +today_date.getFullYear();
	  var last_Date_Str;	
	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear()-1);
	  return today_Date_Str;
	}

	function getLastDate(){
		 today_date = new Date();
		 var last_Date_Str;	
		 last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear()-1);
		 return last_Date_Str;
	}
	
	  function resetVal()
		 {
		   $('#from').val(getLastDate());
		   $('#to').val(getCurrentDate());
		   $('#quickSearchHidden').val('');
		 }
	  
	/*   $(document).ready(function(){
          $.ajax({
                 type :'GET',
              url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
                 success : function(result)
                 {
                        $('#abc').val(result);
            }
            });
        });
	 */
    </script>
</body>
</html>