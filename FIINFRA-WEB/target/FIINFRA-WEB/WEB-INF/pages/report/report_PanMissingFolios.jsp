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
     
		<h1 class="pull-left">MF Portfolio Reports</h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->  
      
     <div class="row">
  		<jsp:include page="MFPortfolioSidebar.jsp" /> 
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">PAN Missing Folios Report</a>
           <div class="list-group-item">
						<!-- Search start-->
					<div class="modal-body">
					<form onsubmit="return false">
					<input  type="hidden" id="abc"   placeholder="Quick Search" style="width: 300px;">
						<div class="searchboxreport" id="reportview"> 
						
							
						 <div class="form-group">
							 <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label> 
							<div class="col-xs-12 col-sm-12">
								<div class="clearfix">
								<a href="#" style="color: #fff;" >
								<input type="submit" class="btn btn-xs btn-primary " value="Show" title="Show" alt="Show" onClick="getPanMissingFolios(${sessionScope.userSession.partyId});resetVal();">
								</a>
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>
						<div class="space-2"></div>
						<div class="space-2"></div>
						<div class="space-2"></div>
						<div class="space-2"></div>
						<div class="space-2"></div>
						
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


	
	<script type="text/javascript">
 
	 function getPanMissingFolios(partyid)
	 {
	 	var partnerId = partyid;
	 
		/*   var reportLink= $('#abc').val(); */
	  	  url ="Rpt_PP_PanMissingFoliosReport&rs:Command=Render&rc:Parameters=false&partnerId="+partnerId+"&loggedpartyId="+partnerId+"";
	  	 callReport(url);
		 /*  var reportview2 = "<iframe src="+url+" width='1010' height='840'></iframe>"; */
	   
		 /*  $("#gen2").html(reportview2); */ 
		  var actionByUserID = ${sessionScope.userSession.userId};
		  var sourceModule='Advisorlevel';
		  var sourceScreen='Pan Missing Folios Report';
		  var objectName ='PartnerId::'+Partner_id;
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
    	$("#reportnote").show();
    	$("#popUpAlertaddnote").css ('height','1000px');
    	$("#popUpAlertaddnote").css ('width','1100px');
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
	   $('#PanMissingFolioslReportLink').css('font-weight','bold');
   
     }); 
   
  

       
</script>  


</body>
</html>