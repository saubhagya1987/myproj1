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
		<h1 class="pull-left">MF Portfolio Reports</h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row">
  		<jsp:include page="MFPortfolioSidebar.jsp" /> 
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
  		<div class="list-group">
        		<a class="list-group-item active" href="#">AUM Recon Detail Report</a>
           <div class="list-group-item">
<!-- Search start--><div class="modal-body">
			 <form onsubmit="return false" class="form-horizontal">
							<div class="searchboxreport" id="reportview"> 
							
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >RTA Type :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="rtatypeID" id="rtatypeID" ></select>
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Unit Recon Filter :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="URFilter" id="URFilter" ></select>
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >As On Date :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="Startdatename" id="datepicker" class=" " readonly='true' value=" ">
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						
						
						 <div class="form-group">
							 <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label> 
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<a href="#" style="color: #fff;" >
								<input type="submit" class="btn btn-xs btn-primary " value="Show" title="Show" alt="Show" onClick="getAUMREconDetailReport(${sessionScope.userSession.partyId});resetVal();">
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
       	



	<!-- Center part End -->

	
<jsp:include page="../common/footer.jsp" />


	<script type="text/javascript">
 
	 function getAUMREconDetailReport(partyid){
			
		    var AsOnDate1 = $('#datepicker').val();
		
			var RTATypeId = $('#rtatypeID').val();
			var URFilter = $('#URFilter').val();
	 		var partnerId = partyid;
	 	
			
			
			var dt = AsOnDate1.split("-");
			var day = dt[0];
			var mn = dt[1];
			var yr = dt[2];
			AsOnDate = mn+"-"+day+"-"+yr;
			
	
  	  url ="AUMReconDetailReport&rs:Command=Render&rc:Parameters=false&partnerId="+partnerId+"&RTATypeID="+RTATypeId+"&UnitReconFilter="+URFilter+"&AsAtDate="+AsOnDate+"&loggedpartyId="+partnerId+"";
	
  	  callReport(url);
	 
	  var actionByUserID = ${sessionScope.userSession.userId};
	  var sourceModule='Advisorlevel';
	  var sourceScreen='AUM Recon Detail Report';
	  var objectName ='PartnerId::'+Partner_id+',RTATypeID::'+RTATypeId+',UnitReconFilter::'+URFilter+',AsOnDate::'+AsOnDate1+',loggedpartyId::'+partnerId;
	  $.ajax({
			 type :'POST',
	      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
			 success : function(result) 
			 {
			

				 
				 
		}
		});
		  
	  }
	  
	 function addcodevalueDescription()
	    {
	    
	    	
	       $.ajax
	      ({
	                  
	          type: "POST",
	         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
	         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=501',
	          dataType: 'json',
	          contentType: 'application/json',
	             success:function(result)
	          { 
	            //result = JSON.parse(result);
	            //alert('result='+result);
	            $('#rtatypeID').empty();
	           // $('#txntypeId').append('<option value="0">All</option>');
	            $(result).each(function(i, obj) 
	            		{
	            	var module=obj.codeValue;
					var moduleid=obj.codeValueId;
	          
	   
	              $('#rtatypeID').append('<option value="'+ moduleid+'">'+ module + '</option>');
	            	
	            		});
	          }
	       
	       });
	     
	      
	     }
	         
	    
	    $(document).ready(function(){
	    	addcodevalueDescription();
	    });

	    
	    
	    function addcodevalueDescription1()
	    {
	    
	    	
	       $.ajax
	      ({
	                  
	          type: "POST",
	         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
	         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=523',
	          dataType: 'json',
	          contentType: 'application/json',
	             success:function(result)
	          { 
	            //result = JSON.parse(result);
	            //alert('result='+result);
	            $('#URFilter').empty();
	          //  $('#txntypeId').append('<option value="0">All</option>');
	            $(result).each(function(i, obj) 
	            		{
	            	var module=obj.codeValue;
					var moduleid=obj.codeValueId;
	          
	   
	              $('#URFilter').append('<option value="'+ moduleid+'">'+ module + '</option>');
	            	
	            		});
	          }
	       
	       });
	     
	      
	     }
	         
	    
	    $(document).ready(function(){
	    	addcodevalueDescription1();
	    });

	
    function  reportnote()
    {
    	//alert(('#opportunityStatus').val());
		/*$(".popUpAlertaddnote").removeClass('hide').dialog({
						resizable: false,
						modal: true,
						width: "auto",
                        
					});*/
		bootbox.dialog({
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
		
    	$(".popUpAlertaddnote .modal-dialog").css('height','100%');
    	$(".popUpAlertaddnote .modal-dialog").css('width','86%');
        $("#reportnote").css({'width':'100%','overflow':'auto'});
		$("#reportnote").show();
    	//alert(('#opportunityStatus').val());
    	/* $("#reportnote").show();
    	$("#popUpAlertaddnote").css ('height','1000px');
    	$("#popUpAlertaddnote").css ('width','1100px'); */
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
  		  	 // alert(today_date)

  		  	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +today_date.getFullYear();
  		  	  var last_Date_Str;	
  		  	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear()-1);
  		  		
  		  	 // alert("Last year"+last_Date_Str)

  		  		
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
	   $('#AUMReconDetailReportLink').css('font-weight','bold');
       
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