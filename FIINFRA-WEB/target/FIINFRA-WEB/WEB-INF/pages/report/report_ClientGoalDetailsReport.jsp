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
		<h1 class="pull-left">Goal Reports </h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row">
  				<!-- center  part -->
			<span class="list-group"></span>
			<div class=" col-md-3 sidebar-offcanvas" role="navigation"
				style="margin-top: 10px; padding-left: 10px;">
				<div class="list-group">
					<a class="list-group-item active" href="#">Goal Reports</a>
                <a href="loadreportClientGoalSummary.htm" class="list-group-item" id="clientGoalSummaryReportLink">Client Goal Summary Report </a>
              	<a href="loadreportClientGoalDetails.htm" class="list-group-item" href="#" id="clientGoalDetailsReportLink"><strong>Client Goal Detail Report</strong></a>
				</div>
			</div>
			<div class="col-md-9"> 
            				
                    <div class="clearfix"></div>

				<!-- center -->

				<div class="list-group">
					<a class="list-group-item active" href="#">Client Goal Detail Report</a>
					<div class="list-group-item">

						<!-- Search start-->
         
				<div class="modal-body">		 
				<form class="form-horizontal" role="form" onsubmit="return false">
							<div class="searchboxreport" id="hidesumRpt"> 
								<input type="hidden" id="abc" placeholder="Quick Search" style="width: 300px;">
					<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Client Name :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input name="text" type="text" id="quickSearch" name="searchString" onKeyUp="quickSearchContacts(this);" placeholder="Quick Search" style="width: 300px;">
									<input name="text" type="hidden" id="quickSearchHidden" name="searchString"  placeholder="Quick Search" style="width: 300px;">
									(Optional)
								</div>
							</div> 
						</div>
						<div class="space-2"></div>

						
					
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="button" class="btn btn-xs btn-primary" value="Show" title="Show"alt="Show" onClick="getClientGoalDetailSt(${sessionScope.userSession.buId},${sessionScope.userSession.partyId},${sessionScope.nodeId});resetVal();">
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
	


	function getClientGoalDetailSt(buid,partyid,nodeId){
		  
		  var buId=buid;
			var ClientpartyId = $('#quickSearchHidden').val();
			if ((ClientpartyId == '')||(ClientpartyId == 'NULL'))
			    {
				ClientpartyId=0;
			    }
		
	
			var url="ClientGoalDetailsReport&rs:Command=Render&rc:Parameters=false&buId="+buId+"&partnerId="+partyid+"&partyId="+ClientpartyId+"&loggedpartyId="+partyid+"&nodeId="+nodeId+"";
			 callReport(url);
		 
		  var actionByUserID = ${sessionScope.userSession.userId};
		  var sourceModule='Client Goal Details Report.rdl';
		  var sourceScreen='ClientGoalDetailsReport.rdl';
		  var objectName = buId+','+partyid+','+ClientpartyId+','+partyid+','+nodeId;
		  $.ajax({
				 type :'POST',
		      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
				 success : function(result) 
				 {
					 //alert("Audit AjexHiiii");

			}
			});
			  
		  
		  
	  }
	  
	  
	  $('#quickSearch').blur(function(){
			//alert($('#quickSearch').val());
			 var arr = extractLast($('#quickSearch').val());
			 this.value = this.value.replace(arr, '');
			 this.value = this.value.replace(/;/, '');
			
		  }); 

		$('#quickSearch').click(function(){
			$('#quickSearch').val('');
			$('#quickSearchHidden').val('');
		  }); 
  
	
 
			 
				 
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
			  		url: $('#contextPath').val()+"/et/quickSearchContacts.htm?searchString="+$('#quickSearch').val(),
			  		  method:"post",
			  		  success:function(result){
			   
			  			 
			  						 
			  						  var userLabelValueList = new Array();
			  							 $(result).each(function(i,obj){
			  									var object = {};
			  									object.value = obj.partyId;
			  									object.label = obj.fName+' '+obj.lName;
			  						
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
//			  			 					        	partyId=ui.item.value;
			  								        	$('#quickSearchHidden').val(ui.item.value)
			  									
			  								        terms.push( "" );
			  								        this.value = terms.join( ";" );
			  								        
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
			  				 function split( val ) {
			  					    return val.split( /;\s*/ );
			  					} 
			  					function extractLast( term ) {
			  					    return split( term ).pop();
			  					} 
			  				
	

		  
		  $('#quickSearch').keyup(function() {
			     $(this).val(function(i, value) {
			        return value.replace(/\s/, '');
			     }); 
			 });
		  
		  
		   function resetVal()
		  {
		    
		    $('#quickSearch').val('');
		    $('#quickSearchHidden').val('');
		 
		  }
		   $(document).ready(function(){
				
				var clientId=$('#clientId').val();
				if(clientId!=0)
					{
						$('#quickSearchHidden').val(clientId);
						$('#showButton').click();
					}
				else{
					
				}
			});
	</script> 
	


</body>
</html>