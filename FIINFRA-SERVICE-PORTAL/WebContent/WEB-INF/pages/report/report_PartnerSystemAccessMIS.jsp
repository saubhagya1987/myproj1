

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
		style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto; z-index: 10000000000000 !important"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');resetVal();" href="#"><img
				alt="" src="images/btn_close.gif" /></a>
		</div>

		<div id="reportnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Report</h3>
				</div>
				<div id="downloadOptions" align="right" style="display: none;">

					<br>
					<br>
					
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 850px;">

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
      
     
     <div class="page-header">
		<h1 class="pull-left">Partner MIS </h1>
           
           <div class="clearfix"></div> 
	</div>  
   <!--div starts  -->      
     <div class="row">
  		<jsp:include page="PartnerMISReportSideBar.jsp" /> 
  		<div class="col-md-9">
            				 
                    <div class="clearfix"></div>
  		<div class="list-group">
        		<a class="list-group-item active" href="#">Partner System Access MIS</a>
           <div class="list-group-item">
<!-- Search start-->
          		<div class="modal-body">			 
			  <form onsubmit="return false" class="form-horizontal">
					<input  type="hidden" id="abc"   placeholder="Quick Search" style="width: 300px;">
							<div class="searchboxreport" id="hidesumRpt">  
							
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >User Type :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="recordtypeId" id="recordtypeId" ></select>
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
				
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<a href="#" style="color: #fff;" >
										<input type="button" class="btn btn-xs btn-primary" value="Show" title="Show" alt="Show" onClick="getPartnerSystemAccessMIS(${sessionScope.userSession.buId},${sessionScope.userSession.partyId});resetVal();">
										</a>
								</div>
							</div> 
						</div> 
						<div class="space-2"></div>
							</div>
							<!-- div added by shrinivas -->
							<div class="searchboxreport" id="showErrDiv"
								style="display: none;">
								<span
									style="text-align: center; display: inline-block; width: 100%; margin-top: 150px; font-weight: bold; font-size: 15px; color: green; margin-bottom: 150px;">You
									are not authorized to view this page, please contact admin.</span>
							</div>
						</form> </div>

</div></div>    
  		
  		
   	  </div> 	
   	</div>  

      
         	<br/><br/>


	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>


	<!-- Center part End -->

	<script type="text/javascript">
	$(document).ready(function(){
		$('#SPPartnerSystemAccessMISReportLink').css('font-weight','bold');
	    
		 addcodevalueDescription();
		});


	 function addcodevalueDescription()
		  {
		  	$.ajax(
		   			{ 				
		   		  type: "POST",
		   		  url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=14',
		   		  dataType: 'json',
				  contentType: 'application/json',
					   		  success:function(result)
		   		  { 
					   			
							      $(result).each(function(i, obj) {
							          var module=obj.codeValue;
								      var modulename=obj.codeValueId;
									
									  if(modulename==14003||modulename==14006)
										  { 
											$('#recordtypeId').append('<option value="'+ modulename+'">'+ module + '</option>');	
																					  
										  }
								      		
									   });
		   		 				 }
		   					});
	  				}
	         
	
	</script>
	<script type="text/javascript">

	function getPartnerSystemAccessMIS(buid,partyid)
	{	
	  var UserId=$("#recordtypeId").val();

	  var buId = buid;
	  var loggedpartyId=partyid;
	 
	 
	  var url="Rpt_SP_PartnerSystemAccessMIS&rs:Command=Render&rc:Parameters=Collapsed&usertype="+UserId+"&buId="+buId+"&loggedpartyId="+loggedpartyId+"";
	 
	  callReport(url);
	  var actionByUserID = ${sessionScope.userSession.userId};
	  var sourceModule='Rpt_SP_PartnerSystemAccessMIS.rdl';
	  var sourceScreen='Rpt_SP_PartnerSystemAccessMIS.rdl';
	  var objectName = UserId','+buId+','+loggedpartyId;
	  $.ajax({
			 type :'POST',
	      	 url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31003+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
			 success : function(result) 
			 {
				 
			 }
		});

	}
  
	 $(document).ready(function(){
		 $('#SPbizUnitGoalMISReportLink').css('font-weight','bold');
		  $.ajax({
				 type :'GET',
		      url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
				 success : function(result) 
				 {
					 $('#abc').val(result);
				  }
			});
   	});
	
	function quickSearchPartner(e){

		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			search();
			return;
		}
		$('#common_popup_div,#shadow_div_web_app').remove();
		//alert($('#quickSearch').val());
	$.ajax({
		  url: $('#contextPath').val()+"/birtreport/getPartnerList.htm?searchString="+$('#quickSearchpart').val(),
		  method:"post",
		  success:function(result){
 
			 
			  var userLabelValueList = new Array();
				 $(result).each(function(i,obj){
						var object = {};
						object.value = obj.partyID;

						object.label = obj.partnerName;
						userLabelValueList.push(object);
					/* 	alert("Hello:::::"+ obj.partyID);
						alert("Hi:::::::::"+obj.partnerName); */
						
				 }); 
// 				 alert("object.label:::"+  object.label);
				 $("#quickSearchpart")
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
// 					        	partyId=ui.item.value;
					        	$('#quickSearchHiddenpart').val(ui.item.value)
						
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
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
	
	
function quickSearchContacts(e){
		
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			search();
			return;
		}
		$('#common_popup_div,#shadow_div_web_app').remove();
		//alert($('#quickSearch').val());
	$.ajax({
		  url: $('#contextPath').val()+"/birtreport/getClientList.htm?searchString="+$('#quickSearch').val()+"&partnerId="+$('#quickSearchHiddenpart').val(),
				  
		  method:"post",
		  success:function(result){
 
			 
			  var userLabelValueList = new Array();
				 $(result).each(function(i,obj){
						var object = {};
						object.value = obj.partyID;
						object.label = obj.clientName;
					/* alert("obj.partyID :::::"+obj.partyID);
					alert("obj.clientName :::::"+obj.clientName); */
					
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
// 					        	partyId=ui.item.value;
					        	$('#quickSearchHidden').val(ui.item.value)
						
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
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
	 function split( val ) 
	 	{
		    return val.split( /;\s*/ );
		} 
		function extractLast( term ) 
		{
		    return split( term ).pop();
		} 
	
	
    function  reportnote()
    {
    	//alert(('#opportunityStatus').val());
    	$("#reportnote").show();
    	$("#popUpAlertaddnote").css ('height','1000px');
    	$("#popUpAlertaddnote").css ('width','1100px');
    }
    

        
</script>
</body>
</html>