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
		style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto;"
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
				
				<div id="poptable_contactform" style="padding: 10px; height: 850px;">
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
		<h1 class="pull-left">CRM Reports </h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row">
  				<!-- center  part -->
			<span class="list-group"></span>
			<div class=" col-md-3 sidebar-offcanvas" role="navigation"
				style="margin-top: 10px; padding-left: 10px;">
				<div class="list-group">
					<a class="list-group-item active" href="#">CRM Reports</a> <a
						href="loadreportPartnerOpenTaskList.htm" class="list-group-item"
						id="partnerOpenTaskListLink">Partner Open Task List</a> <a
						href="loadreportPartnerOpenQueryList.htm" class="list-group-item"
						href="#" id="partnerOpenQueryListLink"><strong>
							Partner Open Query List</strong></a> <a
						href="loadreportPartnerContactList.htm" class="list-group-item"
						href="#">Partner Contact List</a>
				</div>
			</div>
			<div class="col-md-9"> 
            				
                    <div class="clearfix"></div>

				<!-- center -->

				<div class="list-group">
					<a class="list-group-item active" href="#">Partner Open Query
						List</a>
					<div class="list-group-item">

						<!-- Search start-->
         
				<div class="modal-body">		 
				<form class="form-horizontal" role="form"
									onsubmit="return false">
									
				
							<div class="searchboxreport" id="hidesumRpt">  
							
								<input type="hidden" id="abc" placeholder="Quick Search"
										style="width: 300px;">
										
									
										<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Query Type :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="querytypeId"	id="querytypeId" ></select>
								</div>
							</div>     
						</div>
						<div class="space-2"></div>

									<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Query Contact Type :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="queryconId"	id="queryconId" ></select>
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
								<input type="button" class="btn btn-xs btn-primary" value="Show" title="Show"alt="Show" onClick="getPartOpenQueryList(${sessionScope.userSession.partyId},${sessionScope.userSession.buId},${sessionScope.nodeId});resetVal();">
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>
						
									
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>
	</div>

	<!-- Center part End -->

	<jsp:include page="../common/footer.jsp" />


	
	<script type="text/javascript">
	
	/* $(document).ready(function(){
		  $.ajax({
				 type :'GET',
		      url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
				 success : function(result) 
				 {
					 $('#abc').val(result);
					 }
			});
	}); */

	function getPartOpenQueryList(partyid,buId,nodeId){
		  
		StartDate = $('#from').val();
		EndDate = $('#to').val();
		
		var QueryCategory = $('#querytypeId').val(); 
	    var QueryContactParty = $('#queryconId').val(); 

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
			  
			/*   var reportLink= $('#abc').val(); */
		  var url="PartnerOpenQueryList&rs:Command=Render&rc:Parameters=false&buID="+buId+"&StartDate="+StartDate1+"&EndDate="+EndDate1+"&QueryCategory="+QueryCategory+"&QueryOwnerParty="+partyid+"&QueryContactParty="+QueryContactParty+"&loggedpartyId="+partyid+"&partnerId="+partyid+"&nodeId="+nodeId+"";
		  callReport(url);
		 /*  var reportview2 = "<iframe src="+url+" width='1010' height='840'></iframe>";
		  $("#gen2").html(reportview2); */
		  var actionByUserID = ${sessionScope.userSession.userId};
		  var sourceModule='Rpt_PP_PartnerOpenQueryList';
		  var sourceScreen='Rpt_PP_PartnerOpenQueryList';
		  var objectName = 'BussinessUnitID::'+buId+',StartDate::'+StartDate+' EndDate::'+EndDate+'QueryCategoryID::'+QueryCategory+',QueryOwnerPartyID::'+partyid+',QueryContactPartyID::'+QueryContactParty+',LoggedInPartyID::'+partyid+',PartnerPartyID::'+partyid+',NodeId'+nodeId;
		  $.ajax({
				 type :'POST',
		      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
				 success : function(result) 
				 {
					}
			});
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
    
    function addQueryTypeId()
    {
       $.ajax
      ({
                  
          type: "POST",
         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=20',
          dataType: 'json',
          contentType: 'application/json',
             success:function(result)
          { 
            $('#querytypeId').empty();
            $('#querytypeId').append('<option value="0">All</option>');
            $(result).each(function(i, obj) 
            		{
            	var module=obj.codeValue;
				var moduleid=obj.codeValueId;
          
			  
              $('#querytypeId').append('<option value="'+ moduleid+'">'+ module + '</option>');
            	
            		});
            
          }
       
       });
     
      
     }
    $(document).ready(function(){
    	addQueryTypeId();
    }); 
    
   
    function addQueryContactTypeId()
    {
       $.ajax
      ({
                  
          type: "POST",
         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=15',
          dataType: 'json',
          contentType: 'application/json',
             success:function(result)
          { 
            $('#queryconId').empty();
     	    $('#queryconId').append('<option value="0">All</option>');
       
            $(result).each(function(i, obj) 
            		{
            	var module=obj.codeValue;
				var moduleid=obj.codeValueId;
          
			  
              $('#queryconId').append('<option value="'+ moduleid+'">'+ module + '</option>');
            	
            		});
            }
       
       });
      
     }
     $(document).ready(function(){
    	addQueryContactTypeId();
    });

    $('#quickSearch').keyup(function() {
	     $(this).val(function(i, value) {
	        return value.replace(/\s/, '');
	     }); 
	 });
 
  $(function() {
	    $( "#from" ).datepicker({
	    	  dateFormat: "dd-mm-yy",
	      defaultDate: "+1w",
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
	   
	   $('#quickSearch').val('');
	   $('#from').val(getLastDate());
	   $('#to').val(getCurrentDate());
	   $('#quickSearchHidden').val('');
	 } 
	 
	 
	 
    </script>
</body>
</html>