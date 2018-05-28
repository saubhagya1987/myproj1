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
		<h1 class="pull-left">Goal Reports</h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row">
  		<jsp:include page="GoalReportSideBar.jsp" /> 
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
                    
         <div class="list-group">
        		<a class="list-group-item active" href="#">Biz Unit Goal MIS</a>
           <div class="list-group-item">
				<div class="modal-body">
			  <form onsubmit="return false" class="form-horizontal">
				
							<div class="searchboxreport" id="hidesumRpt">  
							
							<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Goal Type :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="opportunityStatusId"	id="opportunityStatusId"  ></select>
							   
								</div>
							</div>     
						</div>
						<div class="space-2"></div>
						
												
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Goal Year :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select  name="goalyearId"	id="goalyearId" > </select> 
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
					
						 <div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<a href="#" style="color: #fff;"
								>
								<input type="button" class="btn btn-xs btn-primary" value="Show" title="Show" alt="Show" onClick= "getBizUnitGoalMIS(${sessionScope.userSession.buId},${sessionScope.userSession.partyId});resetVal();">
								</a> 
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
		</div>
		<br /> <br />
 
<!-- Search start-->

  <footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>    
<!-- Center part End -->          


<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> 
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->
  

	<script type="text/javascript">
	 $(document).ready(function(){
		 $('#SPbizUnitGoalMISReportLink').css('font-weight','bold');
		  $('#menu-wplook-sub-menu5').addClass('active');	
		   $('#SPReportGoalLink').addClass('active');
		   $('#menu-wplook-sub-menu5 ul').css('display', 'block'); 
   	});
	
	function getBizUnitGoalMIS(buid,partyid){
		 //alert("000000000000000");
		 // e.preventDefault();
	   
	  var buId=buid;
	  var OppStatusId=$("#opportunityStatusId").val();
	  var goalyearId=$("#goalyearId").val(); 
	

	  var url="Rpt_SP_BizUnitGoalMIS&rs:Command=Render&rc:Parameters=false&buId="+buId+"&GoalType="+OppStatusId+"&GoalYear="+goalyearId+"&loggedpartyId="+partyid+"";
	 callReport(url);
	  var actionByUserID = ${sessionScope.userSession.userId};
	  var sourceModule='Rpt_SP_BizUnitGoalMIS.rdl';
	  var sourceScreen='Rpt_SP_BizUnitGoalMIS.rdl';
	  var objectName = buId+','+OppStatusId+','+OppStatusId+','+partyid;
	  $.ajax({
			 type :'POST',
	      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31003+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
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
	         url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=35',
	          dataType: 'json',
	          contentType: 'application/json',
	             success:function(result)
	          { 
	            //result = JSON.parse(result);
	            //alert('result='+result);
	            $('#opportunityStatusId').empty();
	         /*    $('#opportunityStatusId').append('<option value="0">--Select--</option>'); */
	            $('#opportunityStatusId').append('<option value="0">All</option>');
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


  

  
	  function  reportnote()
	    {
	    	//alert(('#opportunityStatus').val());
	    	$("#reportnote").show();
	    	$("#popUpAlertaddnote").css ('height','1000px');
	    	$("#popUpAlertaddnote").css ('width','1100px');
	    }
	  
	  $('#quickSearch').keyup(function() {
		     $(this).val(function(i, value) {
		        return value.replace(/\s/, '');
		     }); 
		 });
	  
		
	   var  maxOffset = 100; // Change to whatever you want
	   var thisYear = (new Date()).getFullYear();
	    var select = $("#goalyearId"); 

	   for (var i = 0; i <= maxOffset; i++) {
	       var year = thisYear + i;
	        $('<option>', {value: year, text: year}).appendTo(select); 
		 
	   }
	
	   
	   
	   /* function showSelectFrom(){
		     var selO = document.getElementsByName('opportunityStatusId')[0];
		     var selValuesFrom = [];
		     for(i=0; i < selO.length; i++){
		         if(selO.options[i].selected){ 
		             selValuesFrom.push(selO.options[i].value);
		          } 
		     }     
		     alert(selValuesFrom);         
			 $('#hdnFrom').val(selValuesFrom);  
		     
		 } */
	   
	    
	   function resetVal()
	  {
	    
	    $('#opportunityStatusId').val('0');
	    $('#goalyearId').val('2015');
	   
	   
	  }
	  
</script> 
</body>
</html>