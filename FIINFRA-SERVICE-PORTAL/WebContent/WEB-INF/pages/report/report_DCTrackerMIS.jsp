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

<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/report.js"> </script>
<script src='<%=request.getContextPath()%>/js/common.js'></script>




<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/report.css" />
<!-- -responsive css-->
<script
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script type="text/javascript">

 
$jq_1_9_1=$.noConflict(); 

</script>
<link href="<%=request.getContextPath()%>/images/favicon.ico"rel="shortcut icon">


<style>
a.list-group-item.active {
 z-index: 0;
  color: #ffffff; 
  background-color: #438eb9;
  border-color: #438eb9; 
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
		<h1 class="pull-left">Data Collection Reports</h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row">
  		<jsp:include page="DataCollectionSidebar.jsp" /> 
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
				<!-- center -->

				<div class="list-group">
					<a class="list-group-item active" href="#"> Analysis Report Generation Tracker</a>
					<div class="list-group-item">
						<!-- Search start-->
						
						<!-- Search start-->
						<form onsubmit="return false">
						<!-- <input type="hidden" name="hdnFrom" id="hdnFrom"> -->
							<div class="searchboxreport">
							<input  type="hidden" id="abc"   placeholder="Quick Search" style="width: 300px;">
							<table>
							<tr>
								<td><span class="style1"><b>Business Unit </b></span></td>
							<!-- 	<td><select multiple=multiple name="bupartyname"	id="bupartyname" multiple="multiple" onclick="showSelectFrom();"></select> </td> -->
								<td>&nbsp&nbsp<select  name="bupartyname"	id="bupartyname" ></select> </td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							
							<tr>
								<td><span class="style1"><b>Start Date </b></span></td>
								<td>&nbsp&nbsp<input type="text" name="Startdatename" id="from" class=" " readonly='true' ></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr>
								<td><span class="style1"><b>End Date </b></span></td>
								<td>&nbsp&nbsp<input type="text" name="Enddatename" id="to" class=" " readonly='true' ></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							
							<tr>
								<td><a href="#" style="color: #fff;" onClick="reportnote();getAnalysisReportGenTracker(${sessionScope.userSession.partyId})"> 
								<input type="submit" class="btn btn-sm btn-primary" value="Show" title="Show" alt="Show" onClick="popup('popUpAlertaddnote')">
								</a> </td>
							</tr>								
							 </table>
							</div>
								 </form>
						
						
						  
						
						<div class="searchboxreport">
							<span style="font-size: 11px; flaot: left; margin-left: 0px;">Current Stage </span>&nbsp; <select name="opportunityStatusId"	id="opportunityStatusId" ></select> 
							<span class="style1">Start Date </span><a>   <input type="text"
							
								onClick="reportnote();generateReport('SP_DC_Tracker_List.rptdesign',${sessionScope.userSession.partyId})">
						<input type="button" class="btn btn-sm btn-primary" value="Show" title="Show"alt="Show" onClick="popup('popUpAlertaddnote')">
							</a>  
						</div>

						<div></div>

						




					
					</div>
				</div>
			</div>
		</div>
		<br /> <br />
	</div>


<footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>
	<!-- Center part End -->


	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> 
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>

	<script type="text/javascript">
     
    function  reportnote()
    {
    	//alert(('#opportunityStatus').val());
    	$("#reportnote").show();
    	$("#popUpAlertaddnote").css ('height','1000px');
    	$("#popUpAlertaddnote").css ('width','1000px');
    }
    
 	$(document).ready(function() {
 		    $("#Startdatename").datepicker({
 		        showOn: 'button',
 		        buttonText: 'Show date',
 		        buttonImageOnly: true,
 		        buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
 		        dateFormat: 'dd/mm/yy',
 		        constrainInput: true,
 		       // minDate: 0
 		    });

 		    $(".ui-datepicker-trigger").mouseover(function() {
 		        $(this).css('cursor', 'pointer');
 		    });
 		});
    
    $(document).ready(function() {
    	 $("#Enddatename").datepicker({
		        showOn: 'button',
		        buttonText: 'Show date',
		        buttonImageOnly: true,
		        buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
		        dateFormat: 'dd/mm/yy',
		        constrainInput: true,
		       // minDate: 0
		    });

		    $(".ui-datepicker-trigger").mouseover(function() {
		        $(this).css('cursor', 'pointer');
		    });
		});
    
    
    function addcodevalueDescription()
    {
    
    	
       $.ajax
      ({
                  
          type: "POST",
         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=7',
          dataType: 'json',
          contentType: 'application/json',
             success:function(result)
          { 
            //result = JSON.parse(result);
            //alert('result='+result);
            $('#opportunityStatusId').empty();
            $(result).each(function(i, obj) 
            		{
            	var module=obj.codeValue;
				var moduleid=obj.codeValueId;
          
   
              $('#opportunityStatusId').append('<option value="'+ moduleid+'">'+ module + '</option>');
            	
            		});
          }
       
       });
     
      
     }
         
    
    $(document).ready(function(){
    	addcodevalueDescription();
    });

    
    
    </script>

</body>
</html>