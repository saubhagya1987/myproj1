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
	
	
	
	<!-- <div style="display: none; width: 450px; height: 380px;" id="popUpDiv">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpDiv')" href="#"><img alt=""
				src="images/btn_close.gif" /></a>
		</div>
	</div> -->
	
	

	<!-- <div class="container"> -->
	<!-- 	<div class="container-head">
			<div class="col-md-12">
				accordion start

				<div class="page-header">
					<h1>Reports</h1>
				</div>
				accordion  END
			</div>
		</div>
 -->
		<!-- center  part -->
		<span class="list-group"></span>
		 <div class="page-header">
		<h1 class="pull-left">Data Collection Reports</h1>
           
           <div class="clearfix"></div>
	</div>
		<div class=" col-md-3 sidebar-offcanvas" role="navigation"
			style="margin-top: 10px; padding-left: 10px;">
			<div class="list-group">
				<a class="list-group-item active" href="#">Data Collection
					Reports</a> <a href="loadreportDCTrackerList.htm"
					class="list-group-item" id="dcToolTrackerListLink">DC Tracker
					List</a> <a href="loadreportProductRecommendationReport.htm"
					class="list-group-item" href="#"
					id="ProductRecommendationReportLink"><strong> Product
						Recommendation Report</strong></a>
			</div>
		</div>
		
		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
				<!-- center -->

				
		<!-- <div class="col-md-9" style="margin-top: 10px; padding-left: 10px;">
 -->
			<div class="list-group">
				<a class="list-group-item active" href="#"> Product
					Recommendation Report </a>
				<div class="list-group-item">

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<form class="form-horizontal" role="form" onsubmit="return false">
								<input type="hidden" id="abc" placeholder="Quick Search"style="width: 300px;">
									
									
								<div class="form-group">
									<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Query Type: </label>
									<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
											<select name="sectionTypeID" id="sectionTypeID" ></select>
											
										</div>
									</div>
								</div>
								
								
								<div class="space-2"></div>
							
						 <div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="button" class="btn btn-xs btn-primary" value="Show" title="Show"alt="Show" onClick="getProductRecomReport(${sessionScope.userSession.partyId});resetVal();">
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>
						<!-- 	</div> -->
							<div class="searchboxreport" id="showErrDiv" style="display:none;">
								<span style="text-align:center;display: inline-block; width:100%;margin-top:150px;font-weight:bold;font-size:15px;color:green;margin-bottom: 150px;">You are not authorized to view this page, please contact admin.</span>
							</div>	
								

							<%-- 	<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<a
											onClick="getProductRecomReport(${sessionScope.userSession.partyId})">
											<button class="btn btn-info" type="button"
												onClick="popup('popUpAlertaddnote');">
												<i class="ace-icon fa fa-check bigger-110"></i>Show
											</button>
										</a>&nbsp; &nbsp; &nbsp;
									</div>
								</div>
								<div class="hr hr-24"></div> --%>
							</form>
						</div>
					</div>
				</div>
			</div>
	 	</div> 
	<br />
	<br />
	<!-- Center part End -->

	<jsp:include page="../common/footer.jsp" />

	<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script> --%>

	<script type="text/javascript">
 
	 function getProductRecomReport(partyid)
	 {
			var PartnerPartyId=partyid;
			var SectionTypeId= $('#sectionTypeID').val();
			var partnerId= partyid;
		   
	 /*  var reportLink= $('#abc').val(); */
  	  url ="ProductRecommendationReport&rs:Command=Render&rc:Parameters=false&PartnerPartyId="+PartnerPartyId+"&SectionTypeId="+SectionTypeId+"&partnerId="+partnerId+"&loggedpartyId="+partyid+"";
  	 callReport(url);
	 /*  var reportview2 = "<iframe src="+url+" width='1010' height='840'></iframe>"; */
	  //alert(url);
	/*   $("#gen2").html(reportview2); */ 
	  var actionByUserID = ${sessionScope.userSession.userId};
	  var sourceModule='Advisorlevel';
	  var sourceScreen='AUM Recon Detail Report';
	  var objectName ='PartnerPartyId::'+PartnerPartyId+',SectionTypeId::'+SectionTypeId+',partnerId::'+partnerId+',loggedpartyId:: '+partyid;
	  $.ajax({
			 type :'POST',
	      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
			 success : function(result) 
			 {	 
		}
		});
		  
	  }
	    function addSectionTypeID()
	    {
	    	$.ajax
	      	({type: "POST",
	          url:$('#contextPath').val()+'/birtreport/getSectionTypeID.htm',
	          dataType: 'json',
	          contentType: 'application/json',
	          success:function(result)
	          { 
	            $('#sectionTypeID').empty();
	            $(result).each(function(i, obj) 
	            {
	            	var module=obj.codeValue;
					var moduleid=obj.codeValueID;
					
	              $('#sectionTypeID').append('<option value="'+moduleid+'">'+ module + '</option>');
	            	});
	            }
	       });
	     }
	         
	    $(document).ready(function(){
	    	addSectionTypeID();
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
    
    $(function() {
  	  
  	    $( "#datepicker" ).datepicker({
  	    	dateFormat: "dd-mm-yy",
  		      defaultDate: "+1w",
  		      changeMonth: true,
  		      changeYear: true,
  		      yearRange:"1980:2025"
  	    });
  	  }); 
  		    function getCurrentDate(){
  		  	  today_date = new Date();
  		  	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +today_date.getFullYear();
  		  	  var last_Date_Str;	
  		  	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear()-1);
  		  	  return today_Date_Str;
  		  	}	
   
  		    $(function() {
  		        var date = new Date(); // replace with your date
  		        $("#datepicker").val(getCurrentDate());
  		   });
         $('#quickSearch').keyup(function() {
	     $(this).val(function(i, value) {
	        return value.replace(/\s/, '');
	     }); 
	 });
  
   $(document).ready(function(){
     /*   $.ajax({
              type :'GET',
           url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
              success : function(result)
              {
                     $('#abc').val(result);
         }
         }); */
     });
   
   function resetVal()
  {
    $('#quickSearch').val('');
    $('#quickSearchHidden').val('');
    $('#datepicker').val(getCurrentDate()); 
  }
</script>
</body>
</html>