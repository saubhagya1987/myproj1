<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.Calendar"%>

<!-- rupali -->


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
<style type="text/css">
/* .dropdown-menu{
left:-76px !important;   
} */
  
.page-title{margin: 13px 0 0px 8px !important; font-weight: bolder; }  

.  h1{font-family: Arial !important;}
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
				
				<div id="poptable_contactform" style="padding: 10px; height: 850px;">

					<!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

					<div id="reportview"></div>
					
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
      
       
    <div class="page-title page-header clearfix">
		<h1 class="pull-left">Partner MIS</h1>
           
           <div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>
	<div class="space-8"></div>
   <!--div starts  -->      
     <div class="row">
  		<jsp:include page="PartnerMISReportSideBar.jsp" /> 
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
                    
  		<div class="list-group">
        		<a class="list-group-item active" href="#">Service Team Partner Activity Details </a>
           <div class="list-group-item">
<!-- Search start-->
          
					<div class="modal-body">		 
				<form onsubmit="return false" class="form-horizontal">
					<input  type="hidden" id="abc"   placeholder="Quick Search" style="width: 300px;">
							<div class="searchboxreport" id="reportview">
							 
							 <div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Business Unit :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select  name="bupartyname"	id="bupartyname" ></select>
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
								<a href="#" style="color: #fff;" > 
								<input type="submit" class="btn btn-xs btn-primary" value="Show" title="Show" alt="Show" onClick="getServiceTeamPartActDetails(${sessionScope.userSession.partyId});resetVal();">
								</a>
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>	
							</div>
							
							<!-- div added by shrinivas     -->
							<div class="searchboxreport" id="showErrDiv" style="display:none;">
								<span style="text-align:center;display: inline-block; width:100%;margin-top:150px;font-weight:bold;font-size:15px;color:green;margin-bottom: 150px;">You are not authorized to view this page, please contact admin.</span>
							</div>
						</form></div>
				</div></div>
   	  </div> 	
   	</div> 
  	<br/><br/>


  <footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>    
<!-- Center part End -->          


 
  <script>

 
  
  function getServiceTeamPartActDetails(partyid){
	  //alert("000000000000000");
	 // e.preventDefault();
  
  var buId=$("#bupartyname").val();
  
  var StartDate=$("#from").val();
  var EndDate=$("#to").val();
  
  var StartDate1=$("#from").val();
  var EndDate1=$("#to").val();
  
  var dt = StartDate.split("-");
  var day = dt[0];
  var mn = dt[1];
  var yr = dt[2];
  StartDate = mn+"-"+day+"-"+yr;
  
  var dt = EndDate.split("-");
  var day = dt[0];
  var mn = dt[1];
  var yr = dt[2];
  EndDate = mn+"-"+day+"-"+yr;
  
 
var url ="Rpt_SP_ServiceTeamPartnerActivityDetails&rs:Command=Render&rc:Parameters=false&buID="+buId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&loggedpartyId="+partyid+"";
 callReport(url);
  var actionByUserID = ${sessionScope.userSession.userId};
  var sourceModule='Partner MIS Details';
  var sourceScreen='Service Team Partner Activity Details';
  var objectName ='BussinessUnitID::'+buId+',StartDate::'+StartDate1+', EndDate::'+EndDate1+', loggedpartyId:: '+partyid;
  
  $.ajax({
		 type :'POST',
      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31003+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
		 success : function(result) 
		 {
			 //alert("Audit AjexHiiii");

	}
	});
	  
  }
  
  
  function bupartyName()
  {
	  var sessionid = ${sessionScope.userSession.buId};
	
	  $('#common_popup_div,#shadow_div_web_app').remove();	 			/* 	  $('#partyname').empty(); */
	   	$.ajax(
	   			{
	   					   				
	   		  type: "POST",
	   		  url: $('#contextPath').val()+'/faq/getBupartyname.htm?data=yes',	
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			 // alert("hi");
				   			$('#bupartyname').empty();
				   			
				   			
										$(result).each(
										function(i, obj) {
								
											var bupartyid=obj.buId;
									
											var bupartyname=obj.lastName; 
											
											if(bupartyid == sessionid){
												$('#bupartyname').append('<option value="'+bupartyid+'" selected="selected">'+ bupartyname + '</option>');
											} else{
												$('#bupartyname').append('<option value="'+bupartyid+'">'+ bupartyname + '</option>');
											}
											
											
											/* $('#partyname').append('<option value="'+bupartyid+'">'+ bupartyname + '</option>'); */
									
											});
	   		  }
	   	
	   	});
	   
}
  $(document).ready(function(){
	  
	 
	  bupartyName();
  });
  


		 
		 $(function() {
		 	    $( "#from" ).datepicker({
		 	    	  dateFormat: "dd-mm-yy",
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
		 	    	  dateFormat: "dd-mm-yy",
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

		 	  today_Date_Str = (((today_date.getDate() < 10) ? "0" : "") +  String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +today_date.getFullYear());

		 		
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
					
				 //last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()-7) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1 )+ "/" +String(today_date.getFullYear());
				 // alert("Lasttt year"+last_Date_Str)
				 return last_Date_Str;
			}
		 
	  function  reportnote()
	    {
	    	//alert(('#opportunityStatus').val());
	    	$("#reportnote").show();
	    	$("#popUpAlertaddnote").css ('height','1000px');
	    	$("#popUpAlertaddnote").css ('width','1100px');
	    }
	
	  function resetVal()
	  {
		 
		  bupartyName();
	    $('#from').val(getLastDate());
	    $('#to').val(getCurrentDate());
	    
	  }
	  
	 /*   function showSelectFrom(){
		     var selO = document.getElementsByName('bupartyname')[0];
		     var selValuesFrom = [];
		     for(i=0; i < selO.length; i++){
		         if(selO.options[i].selected){ 
		             selValuesFrom.push(selO.options[i].value);
		          } 
		     }     
		     alert(selValuesFrom);         
			 $('#hdnFrom').val(selValuesFrom);  
		     
		 } */
	  
		 $(document).ready(function(){
			
			  $('#SPSerTeamPartnerActDetailsRptLink').css('font-weight','bold');
			 
			  
		  });
		 
		    $('#menu-wplook-sub-menu5').addClass('active');	
		  	$('#SPReportPartnerMISMenuLink').addClass('active');
		  	$('#menu-wplook-sub-menu5 ul').css('display', 'block');
</script> 
</body>
</html>