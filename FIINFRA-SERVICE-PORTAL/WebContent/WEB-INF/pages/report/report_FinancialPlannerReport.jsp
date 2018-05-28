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
			<a onClick="popup('popUpAlertaddnote');resetVal();checkdatepic();" href="#"><img alt=""
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
  		<jsp:include page="CRMReportSidebar.jsp" />  
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
                    
  		<div class="list-group">
        		<a class="list-group-item active" href="#">Financial Planner Report</a>
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
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<a href="#" style="color: #fff;" > 
								<input type="submit" class="btn btn-xs btn-primary" value="Show" title="Show" alt="Show" onClick="getfinancialplanner(${sessionScope.userSession.partyId});resetVal();">
								</a> 
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>	
							</div>
							<!-- div added by shrinivas -->
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
  $('#menu-wplook-sub-menu5').addClass('active');	
  $('#SPReportCRMLink').addClass('active');
  $('#menu-wplook-sub-menu5 ul').css('display', 'block'); 
  function getfinancialplanner(partyid){
	var buId=$("#bupartyname").val();
	
	var loggedpartyId=partyid;

	
	var url="FinancialPlannerReport&rs:Command=Render&rc:Parameters=false&buId="+buId+"&loggedpartyId="+loggedpartyId+"";
	callReport(url);

	var actionByUserID = ${sessionScope.userSession.userId};
	var sourceModule='CRM Reports';
	var sourceScreen='Partner MIS';
	var objectName = 'BusinessUnit::'+buId+',loggedpartyId::'+loggedpartyId;
	$.ajax({
			 type :'POST',
	    url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31003+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
			 success : function(result) {}
		});
	}
  
  function bupartyName()
  {
	  var sessionid = ${sessionScope.userSession.buId};
	  
	  $('#common_popup_div,#shadow_div_web_app').remove();	 			/* 	  $('#partyname').empty(); */
	   	$.ajax(
	   			{
	   					   				
	   		  type: "POST",
	   		  url: $('#contextPath').val()+'/faq/getBupartyname.htm',	
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			
				   			$('#bupartyname').empty();
				   		  $('#bupartyname').append('<option value="0">All</option>');
				   			
				   			
										$(result).each(
										function(i, obj) {
								
											var bupartyid=obj.buId;
									
											var bupartyname=obj.lastName; 
											
										/* 	if(bupartyid == sessionid){
												$('#bupartyname').append('<option value="'+bupartyid+'" selected="selected">'+ bupartyname + '</option>');
											} else{
												$('#bupartyname').append('<option value="'+bupartyid+'">'+ bupartyname + '</option>');
											} */
											
											
								 $('#bupartyname').append('<option value="'+bupartyid+'">'+ bupartyname + '</option>'); 
									
											});
	   		  }
	   	
	   	});
	   
}
  $(document).ready(function(){
	  $('#SPfinancialPlannerReportLink').css('font-weight','bold');
	  bupartyName();
  });
  
 
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
	  
	 
	  
	  function checkdatepic()
	   {
		  
			  if(document.getElementById('datepickerenable').checked=true) 
			  
			  {
				  	document.getElementById("from").disabled=false;
				    document.getElementById("to").disabled=false;
			  }
		  
	  }
	  
	  
</script> 
</body>
</html>