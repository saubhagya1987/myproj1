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

	
      
      
     <div class="page-header"> 
		<h1 class="pull-left"> Contact </h1>
           
           <div class="clearfix"></div>  
	</div>  
   <!--div starts  -->      
     <div class="row" >    
  		 <div  class="col-md-3">  
        	   <a class="list-group-item active" href="#"> Contact Reports</a>
               <a id="SPOpportunityTrackerListReportLink" href="loadreportOpportunityTrakerList.htm" class="list-group-item"><strong> Contact Tracker List</strong></a>  
			   <a id="SPOpportunityByStatusReportLink" href="loadOppoByStatusReport.htm" class="list-group-item" href="#">Contact by Status</a>
               <!-- <a href="loadOppTrackerMIS.htm" class="list-group-item" href="#Data">  Opportunity Tracker MIS</a> --><!--suvarna need to hide  --> 
        </div>  
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
  		<div class="list-group">
        		<a class="list-group-item active" href="#">Contact Tracker List </a>
           <div class="list-group-item">
<!-- Search start-->         
          		
					<div class="modal-body">		 
					 <form onsubmit="return false" class="form-horizontal">
							<div class="searchboxreport" id="hidesumRpt">
							
									<input type="hidden" id="abc" placeholder="Quick Search"
										style="width: 300px;">
										
							
									
									<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Contact Name :</label>
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
									<input type="text" name="Startdatename" id="from" class=" " readonly='true' value=" ">
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
			
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >End Date :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="Enddatename" id="to" class=" " readonly='true' value=" ">
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="button" class="btn btn-xs btn-primary" value="Show" title="Show"alt="Show" onClick="getOpportunityTrackerList(${sessionScope.userSession.partyId},${sessionScope.userSession.buId},${sessionScope.nodeId});resetVal();">
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
					</div>
				</div>
			</div>
		
		<br /> <br />
	



	<!-- Center part End -->

	<jsp:include page="../common/footer.jsp" />

	<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script> --%>

	<script type="text/javascript">
   
   function getOpportunityTrackerList(partyid,buId,nodeId){
		
	    var StartDate = $('#from').val();
	    var EndDate = $('#to').val();
		var ClientpartyId = $('#quickSearchHidden').val();
		
		if ((ClientpartyId == '')||(ClientpartyId == 'NULL'))
	    {
			ClientpartyId=0;
	    } 
		var dt = StartDate.split("-");
		var day = dt[0];
		var mn = dt[1];
		var yr = dt[2];
		StartDate1 = mn+"-"+day+"-"+yr;
		
		var dt = EndDate.split("-");
		var day = dt[0];
		var mn = dt[1];
		var yr = dt[2];
		EndDate1 = mn+"-"+day+"-"+yr;
	
		
/*  var reportLink= $('#abc').val(); */
 url ="OpportunityTrackerList&rs:Command=Render&rc:Parameters=false&buId="+buId+"&partnerId="+partyid+"&partyId="+ClientpartyId+"&StartDate="+StartDate1+"&EndDate="+EndDate1+"&loggedpartyId="+partyid+"&nodeId="+nodeId+"";
 callReport(url);
 /* var reportview2 = "<iframe src="+url+" width='1010' height='840'></iframe>";

 $("#gen2").html(reportview2);  */
 var actionByUserID = ${sessionScope.userSession.userId};
 var sourceModule='Rpt_PP_OpportunityTrackerList';
 var sourceScreen='Rpt_PP_OpportunityTrackerList';
 var objectName = 'BussinessUnitID::'+buId+', PartnerPartyID::'+partyid+', ClientPartyID::'+ClientpartyId+', StartDate::'+StartDate+',  EndDate::'+EndDate+', LoggedInPartyID::'+partyid+',NodeId'+nodeId;
 $.ajax({
		 type :'POST',
     url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
		 success : function(result) 
		 {;
	   }
	});
	  
 }

   
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
		
	
	
		
		$('#quickSearch').blur(function(){
			 var arr = extractLast($('#quickSearch').val());
			 this.value = this.value.replace(arr, '');
			 this.value = this.value.replace(/;/, '');
			
		  }); 

		$('#quickSearch').click(function(){
			$('#quickSearch').val('');
			$('#quickSearchHidden').val('');
		  }); 
	
		
	
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
	     // changeMonth: true,
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
		 var today_date = new Date();
		 var last_Date_Str;	
		 last_Date_Str = new Date(today_date.getTime() + (86400000*-7));
		 
		 var dd = last_Date_Str.getDate();
		 var mm = last_Date_Str.getMonth()+1; //January is 0!
		 var yyyy = last_Date_Str.getFullYear();
		 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	    last_Date_Str = dd+'-'+mm+'-'+yyyy;
		 return last_Date_Str;
	}
	 function resetVal()
	  {
	    
	    $('#quickSearch').val('');
	    $('#from').val(getLastDate());
	    $('#to').val(getCurrentDate()); 
	    $('#quickSearchHidden').val('');
	  } 
	 
	/*
	$(document).ready(function(){
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