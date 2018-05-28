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
        		<a class="list-group-item active" href="#">Goal Based Contact MIS </a>
           <div class="list-group-item">
<!-- Search start-->
        
			<div class="modal-body">					 
			<form onsubmit="return false" class="form-horizontal">
				
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
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Contact Type :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select  name="opportunityStatusId"	id="opportunityStatusId">
								<option value="200001">Opportunity</option>
								<option value="200002">Goal Based Opportunity</option>
								<option value="200003">Goal Based Clients</option>
								<option value="200004">Client</option>
								<option value="200005">Goal Based Contacts</option></select>
								</div>
							</div>     
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Start Date :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="Startdatename" id="from" class=" " readonly='true' >
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >End Date :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="Enddatename" id="to" class=" " readonly='true' >
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						 <div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<a href="#" style="color: #fff;" > 
								<input type="submit" class="btn btn-xs btn-primary" value="Show" title="Show" alt="Show" onClick="getClientMIS();resetVal();">
								</a>
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>			 
							</div>
								 </form>
</div>
</div></div>    
  		
  		
   	  </div> 	
   	</div>  

      
         	<br/><br/>
     
    
   <footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>   
<!-- Center part End -->  
        
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> 
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
  <script>
  $('#menu-wplook-sub-menu5').addClass('active');	
  $('#SPReportCRMLink').addClass('active');
  $('#menu-wplook-sub-menu5 ul').css('display', 'block'); 
  
  function getClientMIS(){
	var buId=$("#bupartyname").val();
	var StartDate1=$("#from").val();
	var EndDate1=$("#to").val();
	var ContactType=$("#opportunityStatusId").val(); 

	var dt = StartDate1.split("-");
	var day = dt[0];
	var mn = dt[1];
	var yr = dt[2];
	StartDate = mn+"-"+day+"-"+yr;
	var dt = EndDate1.split("-");
	var day = dt[0];
	var mn = dt[1];
	var yr = dt[2];
	EndDate = mn+"-"+day+"-"+yr;

	
	if(ContactType==200001){
	var url="Rpt_SP_ClientMIS_Opp&rs:Command=Render&rc:Parameters=false&buId="+buId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&ContactType=200001+&loggedpartyId="+ContactType+"";
    }else  
	if(ContactType==200002){
	var url="Rpt_SP_ClientMIS_GBOpp&rs:Command=Render&rc:Parameters=false&buId="+buId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&ContactType=200002+&loggedpartyId="+ContactType+"";
	}else  
	if(ContactType==200003){
	var url="Rpt_SP_ClientMIS_GBClient&rs:Command=Render&rc:Parameters=false&buId="+buId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&ContactType=200003+&loggedpartyId="+ContactType+"";
	}else  
	if(ContactType==200004){
	var url="Rpt_SP_ClientMIS_Client&rs:Command=Render&rc:Parameters=false&buId="+buId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&ContactType=200004+&loggedpartyId="+ContactType+"";
	}else  
	if(ContactType==200005){
	var url="Rpt_SP_ClientMIS_GBContacts&rs:Command=Render&rc:Parameters=false&buId="+buId+"&StartDate="+StartDate+"&EndDate="+EndDate+"&ContactType=200005+&loggedpartyId="+ContactType+"";
	}
	
	  callReport(url);
	var actionByUserID = ${sessionScope.userSession.userId};
	var sourceModule='CRM Reports';
	var sourceScreen='Client wise MIS';
	var objectName = 'BusinessUnit::'+buId+', StartDate::'+StartDate1+', EndDate::'+EndDate1+', ContactType::'+ContactType+', loggedpartyId:: '+ContactType;
	$.ajax({
			 type :'POST',
	    url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31003+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
			 success : function(result) {}
		});
	}
  
  $(document).ready(function(){
		 
	});
  
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
	  $('#SPClientwiseMISReportLink').css('font-weight','bold');
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
	      yearRange:"1990:2025",
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
	      yearRange:"1990:2025",
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

	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +today_date.getFullYear();
	  var last_Date_Str;	
	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear());
		
	 // alert("Last year"+last_Date_Str)

		
	  return today_Date_Str;
	}

	function getLastDate(){
		 today_date = new Date();
		 var last_Date_Str;	
		 last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear());
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
	  function addcodevalueDescription()
	    {
	    
	    	
	       $.ajax
	      ({
	                  
	          type: "POST",
	         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
	         url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=200',
	          dataType: 'json',
	          contentType: 'application/json',
	             success:function(result)
	          { 
	            //result = JSON.parse(result);
	            //alert('result='+result);
	            $('#opportunityStatusId').empty();
	         /*    $('#opportunityStatusId').append('<option value="0">--Select--</option>'); */
	          //  $('#opportunityStatusId').append('<option value="0">Select</option>');
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
	  
</script> 
</body>
</html>