<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
					
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 850px;">

					<!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

					<div id="reportview"></div>
					
				</div>
			</div>
		</div>
	</div>

<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px;" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   	<div class="heading_contactform"><h3>Log Trouble Ticket</h3></div>
        <div id="poptable_contactform">
        	
             <div class="full">
              <input type="text" class="form-control" placeholder="Subject">
               </div>
                <div class="full" >
               <textarea class="form-control" rows="3" placeholder="Your Question" style="height: 100px;"></textarea>
			</div>
             <div class="full">
              <input type="text" class="form-control" placeholder="Attach File" >
              
               </div>
 </div>
   <div class="topbuttonholder">
        	<form><input class="dbtn" value="Send Email"   id="loginButton" type="button">	
            <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>  
        
	</div>
</div>

  <!-- center  part -->
        <span class="list-group"></span>
       
     <div class="page-header">
		<h1 class="pull-left">Execution Reports</h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row">
  		<%-- <jsp:include page="ExecutionReportSidebar.jsp" /> --%> 
  		<span class="list-group"></span>
			<div class=" col-md-3 sidebar-offcanvas" role="navigation"
				style="margin-top: 10px; padding-left: 10px;">
				<div class="list-group">
					<a class="list-group-item active" href="#">Execution Reports</a> <a
						href="loadreportExecutionTrackerList.htm" class="list-group-item"
						id="executionTrackerListLink"> Execution Tracker List </a> <a
						href="loadreportExecTrackClientMIS.htm" class="list-group-item"
						href="#" id="executionTrackerClientMIsLink"><strong>Execution
							Tracker MIS</strong></a>
					<!-- <a href="loadreportExecutedRevenueMIS.htm" class="list-group-item" href="#" id="EstimatedRevenueMISLink">Executed Revenue MIS</a>  -->


				</div>
				<!--  <div class="list-group"><a class="list-group-item active" href="#">Schedule Report</a></div> -->
			</div>
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
                    
  		<div class="list-group">
        		<a class="list-group-item active" href="#">Execution Tracker MIS </a>
           <div class="list-group-item">
<!-- Search start-->
         
					<div class="modal-body">			 
					<form onsubmit="return false" class="form-horizontal">
					
							<div class="searchboxreport" id="reportview">  
							
							 
							<!-- <div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Partner Name :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input name="text" type="text" id="quickSearchpart" name="searchString" onKeyUp="quickSearchPartner(this);"placeholder="Quick Search" style="width: 300px;">
								
								<input name="text" type="hidden" id="quickSearchHiddenpart" name="searchString"  placeholder="Quick Search" style="width: 300px;">
							    <div id="er1"></div>
								</div>
							</div>     
						</div>
						<div class="space-2"></div> -->
						
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
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="button" class="btn btn-xs btn-primary" value="Show" title="Show" alt="Show" onClick="getExecTrackerMIS(${sessionScope.userSession.partyId},${sessionScope.userSession.buId},${sessionScope.nodeId})">
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>
						</div>
					</form>
				</div></div>   
   	       </div> 	
   	  </div>  
<br/><br/>
     
   
	<footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>

      
<!-- Center part End -->          
<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> 
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
 --%>
	
		<script type="text/javascript">
   
   function getExecTrackerMIS(partyid,buid,nodeId)
   {
	   	
	      var buId = buid; 
		  var PartnerId = partyid;			 
		  var ClientId=$('#quickSearchHidden').val(); 		 
		  var loggedinpartyId = partyid;
		 		 
		/*  var reportLink= $('#abc').val(); */
		 url="ExecutionTrackerMIS&rs:Command=Render&rc:Parameters=false&buId="+buId+"&partnerId="+PartnerId+"&partyId="+ClientId+"&loggedpartyId="+loggedinpartyId+"&nodeId="+nodeId+"";
		 callReport(url);
		/*  var reportview2 = "<iframe src="+url+" width='1010' height='840'></iframe>";
		 $("#gen2").html(reportview2);
		 */  
		  var actionByUserID = ${sessionScope.userSession.userId};
		  var sourceModule='Execution Report';
		  var sourceScreen='Execution Tracker MIS';
		  var objectName = 'BussinessUnitID::'+buId+',PartnerPartyID::'+PartnerId+',ClientPartyID::'+ClientId+',LoggedInPartyID::'+loggedinpartyId+',NodeId'+nodeId;
		  $.ajax({
				 type :'POST',
		      	 url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
				 success : function(result) 
				 {
					 //alert("Audit AjexHiiii");
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
// 			 					        	partyId=ui.item.value;
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
    );			
	 */
	$(".popUpAlertaddnote .modal-dialog").css('height','100%');
	$(".popUpAlertaddnote .modal-dialog").css('width','86%');
    $("#reportnote").css({'width':'100%','overflow':'auto'});
	$("#reportnote").show();
	   
	   

    }
    
 // --------Code for Quick serarch validation---------  

    $('#quickSearch').blur(function(){
		//alert($('#quickSearch').val());
		 var arr = extractLast($('#quickSearch').val());
		 this.value = this.value.replace(arr, '');
		 this.value = this.value.replace(/;/, '');
	  }); 

	$('#quickSearch').click(function(){
		$('#quickSearch').val('');
		$('#quickSearchHidden').val('');
	  }); 
	
	
  </script>
	<script>

  
   $('#quickSearch').keyup(function() {
	     $(this).val(function(i, value) {
	        return value.replace(/\s/, '');
	     }); 
	 });
  
  
 /*   function resetVal()
  {
    
    //$('#quickSearch').val('');
    $('#from').val(getLastDate());
    $('#to').val(getCurrentDate()); 
    $('#quickSearchHidden').val('');
  } */
  
 /*   $(document).ready(function(){
       $.ajax({
              type :'GET',
           url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
              success : function(result)
              {
                     $('#abc').val(result);
         }
         });
     }); */
        
</script>
	
	  
</body>
</html>