<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Add/Edit Query</title>

<script type="text/javascript">
	
	
	

	
	
	
	
function change()
{
	
	$('#subject').val().trim();
	
	var data=$('#taskIsClose').val();
	if(data==1 ||data==0)
		{

		$('#subject_error').addClass('hide');
		$('#subject').css('border-color','#d5d5d5');	
		}
	else
		{
		
		}
	
	
	
}

	
function quickSearchPartner11(val){
	
	var event = window.event ? window.event : e;
	
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
		return;
	if(event.keyCode==13){
		search();
		return;
	}
	$('#common_popup_div,#shadow_div_web_app').remove();
	
$.ajax({ 
	method:"post",
	  url: $('#contextPath').val()+"/partnersp/getPartnerList.htm?searchString="+$('#quickSearchpart').val()+
		 "&taskTo="+val,
	  
			  
		 success:function(result){
			 $("#quickSearchpart").empty();
		  var userLabelValueList = new Array();
			 $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyID;
					object.label = obj.partyName;
				// alert("obj.partyID :::::"+obj.partyID);
				//alert("obj.clientName :::::"+obj.partyName);
				
					userLabelValueList.push(object);
				
			 }); 
			 
			 $("#quickSearchpart")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			    
			      if ( event.keyCode === $.ui.keyCode.TAB && $( this ).data( "ui-autocomplete" ).menu.active ) {
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
//					        	partyId=ui.item.value;
				        	$('#quickSearchHiddenpart').val(ui.item.value);
					
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


function quickSearchClient()
{
	
	 $("#client").val('');
	 $("#clientID").val('');
	
$.ajax({ 
	method:"post",
	  url: $('#contextPath').val()+"/querysp/getClientList.htm",
			  
		 success:function(result){
			 $("#client").empty();
		  var userLabelValueList = new Array();
			 $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyId;
					object.label = obj.partnerName;
			//	 alert("obj.partyID :::::"+obj.partyId);
			//	alert("obj.clientName :::::"+obj.partnerName);
				
					userLabelValueList.push(object);
				
			 }); 
			 
			 $("#client")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			    
			      if ( event.keyCode === $.ui.keyCode.TAB && $( this ).data( "ui-autocomplete" ).menu.active ) {
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
//					        	partyId=ui.item.value;
				        	$('#clientID').val(ui.item.value);
				        	//$('#quickSearchpart_error').addClass('hide');
					
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





function quickSearchPartner()
{
	
	
	
$.ajax({ 
	method:"post",
	  url: $('#contextPath').val()+"/partnersp/getPartnerList.htm?searchString="+$('#quickSearchpart').val()+
		 "&taskTo="+$('#taskTo').val(),
	  
			  
		 success:function(result){
			 $("#quickSearchpart").empty();
		  var userLabelValueList = new Array();
			 $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyID;
					object.label = obj.partyName;
				// alert("obj.partyID :::::"+obj.partyID);
				//alert("obj.clientName :::::"+obj.partyName);
				
					userLabelValueList.push(object);
				
			 }); 
			 
			 $("#quickSearchpart")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			    
			      if ( event.keyCode === $.ui.keyCode.TAB && $( this ).data( "ui-autocomplete" ).menu.active ) {
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
//					        	partyId=ui.item.value;
				        	$('#quickSearchHiddenpart').val(ui.item.value);
				        	$('#quickSearchpart_error').addClass('hide');
					
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

function split( val ) {
    return val.split( /;\s*/ );
} 
function extractLast( term ) {
    return split( term ).pop();
} 
</script>


</head>


<body>








<input type="hidden" id="pagesize1" name="pagesize1">

				
<input type="hidden" id="hidetaskOwnerPartyID" name="hidetaskOwnerPartyID" value="${taskOwnerPartyID}">
<input type="hidden" id="hideownerPartyName" name="hideownerPartyName" value="${ownerPartyName}">
<input type="hidden" id="hidetargetPartyName" name="hidetargetPartyName" value="${targetPartyName}">
<input type="hidden" id="hidetaskOnRelatedPartyID" name="hidetaskOnRelatedPartyID" value="${taskOnRelatedPartyID}">
<input type="hidden" id="hidetaskTypeID" name="hidetaskTypeID" value="${taskTypeID}">
<input type="hidden" id="hidetaskPriorityID" name="hidetaskPriorityID" value="${taskPriorityID}">
<input type="hidden" id="hidetaskStatusID" name="hidetaskStatusID" value="${taskStatusID}">
<input type="hidden" id="hidetaskSubject" name="hidetaskSubject" value="${taskSubject}">
<input type="hidden" id="hidetaskText" name="hidetaskText" value="${taskText}">
<input type="hidden" id="hidetaskContactTypeID" name="hidetaskContactTypeID" value="${taskContactTypeID}">
<input type="hidden" id="hidedueDateTime" name="hidedueDateTime" value="${dueDateTime}">
<input type="hidden" id="hideendDateTime" name="hideendDateTime" value="${endDateTime}">
<input type="hidden" id="hideattachment1" name="hideattachment1" value="${attachment1}">
<input type="hidden" id="hideattachment2" name="hideattachment2" value="${attachment2}">
<input type="hidden" id="hideattachment3" name="hideattachment3" value="${attachment3}">
<input type="hidden" id="hidecompletionDateTime1" name="hidecompletionDateTime1" value="${completionDateTime1}">






	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/common_popup.jsp" />
	<!-- Center part start -->
	<section>
		<%-- <form id="addform" name="FileUploadForm"	action="<%=request.getContextPath()%>/partnersp/saveTask.htm"	enctype="multipart/form-data" method="post"> --%>
		
		<form id="addform" name="addform">
		
		<%-- 	<input type="hidden" id="taskIsClose" name="taskIsClose" >
			<input type="hidden" id="taskIdHidden" name="taskId" value="${taskId}">
			<input type="hidden" id="hideattachment1ID" name="attachment1DocumentID" value="${attachment1ID}">
			<input type="hidden" id="hideattachment2ID" name="attachment2DocumentID" value="${attachment2ID}">
			<input t	ype="hidden" id="hideattachment3ID" name="attachment3DocumentID" value="${attachment3ID}">
		 --%>
					
					
					     <div class="page-header clearfix">
                <h1 class="pull-left"><B>Add/Edit Query</B></h1>
                 <div class="pull-right">
                 <div class="clearfix">
    					<button id="SPloginhistorybackLink" class="btn btn-sm btn-primary" onClick="goback();">Back</button>    
        				</div>    
    			 </div> 
                <div class="nav-search pull-right" id="">
         
                </div>
               </div>
					
			
			
				
				
				
				<div class="widget-box" style="margin-top:10px;">
						<div class="widget-header">
							<h5 class="widget-title">Details</h5>
						</div>
						<div class="widget-body">
          				<div class="widget-main clearfix">
          				 
          				 
          				 <div class="row">
          				  <div class="form-group col-md-6 clearfix">							
							<label class="col-sm-3 control-label no-padding-right" for="taskTo">Assign To <span class="red">*</span></label>
							<div class="col-sm-9">
								<!-- <select name="ownerPartyId" id="taskTo" onchange="disableAssignto()"
									class="input-xxlarge"> -->
									
																	<select name="targetContactTypeId" id="taskTo" onchange="forself()"  class="form-control">
								

								</select>
								
								<input type="hidden" name="ownerPartyId" id="logerinuser" value="${userSession.partyId}">
									<input  type="hidden" id="logerinusername" name="ownerPartyName"  value="${userSession.name}">
					

								
							</div>
							</div>
							
							 <div class="form-group col-md-6 clearfix">							
							<label class="col-sm-3 control-label no-padding-right" for="contactType">Assign Name<span class="red">*</span></label>
							<div class="col-sm-9">

			
				
										<input  type="text" id="quickSearchpart" name="targetPartyName" onfocus="quickSearchPartner();" placeholder="Quick Search" autocomplete="off" >
										<div id="quickSearchpart_error" class="help-block red hide">Please select assign name.</div>
			
			<input  type="hidden" id="quickSearchHiddenpart" name="targetPartyId"  placeholder="Quick Search" style="width: 300px;">
			
			
			<input  type="hidden" id="statusName" name="statusName" >
		
							
																		
								
							</div>
							</div>
							</div>
							
							
							
							
							
							
				<!-- 			<div class="row">
							<div class="form-group col-md-6 clearfix">								
							<label class="col-sm-3 control-label no-padding-right" for="TastNotificationType">Task Category<span class="red">*</span></label>
							<div class="col-sm-9">
							 <div class="input-xxlarge">
							 								<select name="categoryId" id="TastNotificationType"				class="form-control">
							

								</select>
					
							</div>
							</div>
							</div>
									<div class="form-group col-md-6 clearfix">	
							<label class="col-sm-3 control-label no-padding-right" for="taskPriority">Priority<span class="red">*</span></label>
							<div class="col-sm-9">
								<select name="priorityId" id="taskPriority" class="input-xxlarge">
						
								</select>
								<select name="priorityId" id="taskPriority" class="form-control" >
								
								</select>
								
							</div>
							</div>
		
							</div> -->
							
							
					
					
					
					
<!-- 					
					
					<div class="row">
					
					
					
					<div class="container">
    <div class='col-md-5'>
        <div class="form-group">
            <div class='input-group date' id='datetimepicker6'>
                <input type='text' class="form-control" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class='col-md-5'>
        <div class="form-group">
            <div class='input-group date' id='datetimepicker7'>
                <input type='text' class="form-control" />
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
</div>
					</div> -->
					
					
					
					
				<!-- 				<div class="row">
					
					
					<div class="form-group col-md-6 clearfix">								
							<label class="col-sm-3 control-label no-padding-right" for="duedate">Task Due Date <span class="red">*</span></label>
							<div class="col-sm-9">
									<input type="text" class="input-large" id="duedate" 
															 
															 
									
										name="dueDateTimeString" title="Due Date" validate="date">	
							<div id="duedate_error" class="help-block red hide">Please provide task due date.</div>								
							</div>
							</div>
							<div class="form-group col-md-6 clearfix">								
							<label class="col-sm-3 control-label no-padding-right" for="duedate">Task End Date <span class="red">*</span></label>
							<div class="col-sm-9">
									<input type="text" class="input-large" id="enddate"
										name="endDateTimeString" title="End Date" validate="date">	
							<div id="enddate_error" class="help-block red hide">Please provide task end date.</div>								
							</div>
							</div>
						</div>
							 -->
							
							
							
							
							<div class="row">
							<div class="form-group col-md-6 clearfix">		
							<label class="col-sm-3 control-label no-padding-right" for="taskStatus">
								Query Status <span class="red">*</span>
							</label>
							<div class="col-sm-9">
<!-- 								<select name="statusId" id="taskStatus" class="input-xxlarge" onchange=" getdates()">
							

								</select> -->
								<select name="statusId" id="taskStatus" class="form-control" onchange="getdates()">
									</select>
							</div>
							</div>
							<div class="form-group col-md-6 clearfix">	
						
						
						      <label class="col-sm-3 control-label no-padding-right" for="queryFor">Query For <span class="red">*</span></label>
                          <div class="col-sm-9">
                            <div class="radio ">
                              <label>
                                <input name="queryFor"  type="radio" class="ace" value="new" checked>
                                <span class="lbl">New</span> </label>
                              <label>
                                <input name="queryFor" type="radio" class="ace" value="exiting">
                                <span class="lbl">Existing</span> </label>
                            </div>
                          </div>
						
						
				
							</div>
							</div>
							
							
							
							<div class="row" id="oppdata">
							<div class="form-group col-md-6 clearfix">		
							<label class="col-sm-3 control-label no-padding-right" for="taskStatus">
								Last Name <span class="red">*</span>
							</label>
							<div class="col-sm-9">

								<input type="text" name="lastname" id="lastname" class="form-control">
							</div>
							</div>
							<div class="form-group col-md-6 clearfix">	
						
						
						      <label class="col-sm-3 control-label no-padding-right" >Email <span class="red">*</span></label>
                          <div class="col-sm-9">
                         
                         <input type="text" name="lastname" id="lastname" class="form-control">
                          </div>
						
						
				
							</div>
							</div>
							
							
							
							
							
							
							
							
							
						
							<div class="row">
							
									<div class="form-group col-md-6 clearfix">		
							<label class="col-sm-3 control-label no-padding-right" for="taskStatus">
								Query Type <span class="red">*</span>
							</label>
							<div class="col-sm-9">

								<select name="querTypeId" id="querTypeId" class="form-control">
									</select>
							</div>
							</div>
							<div class="form-group col-md-6 clearfix" id="contactdata">	
						
						
						      <label class="col-sm-3 control-label no-padding-right" >Contact Nubmer <span class="red">*</span></label>
                          <div class="col-sm-9">
                         
                         <input type="text" name="contactno" id="contactno" class="form-control">
                          </div>
						
						
				
							</div>
							
								<div class="form-group col-md-6 clearfix" id="clientdata">	
						
						
						      <label class="col-sm-3 control-label no-padding-right" >Client Name <span class="red">*</span></label>
                          <div class="col-sm-9">
                         
                         
                         <input  type="text" id="client" name="client"  placeholder="Quick Search" autocomplete="off" >
                         
                         <input type="hidden" name="clientID" id="clientID" class="form-control">
                          </div>
						
						
				
							</div>
							
					
			
					
						</div>
			<div class="row">
							<div class="form-group col-md-6 clearfix">	
							<label class="col-sm-3 control-label no-padding-right" for="taskPriority">
								Subject <span class="red">*</span>
							</label>
							<div class="col-sm-9">
								<input type="text" id="subject" name="subject" 
									class="form-control" title="Subject">
								<div id="subject_error" class="help-block red hide">Please provide task subject.</div>								
							</div>
							</div>
						</div>			
						
						
						</div>
					</div>
					</div>		
				
				
					<!--Personal Details End -->
					<!--Notes Start -->
					<div class="panel panel-default" style="margin-top: 10px;">

						<div class="panel-heading">Query Details</div>
						<div class="panel-body">

							<div class="col-md-12 searchpadding padding_top table-responsive">
								<textarea name="description" id="description"
									style="width: 100%; height: 120px;" rows="10" class="editor">


</textarea>
							</div>
						</div>




					</div>
				
					
					<!-- <div class="panel panel-default" style="margin-top: 10px;">

						<div class="panel-heading">Attachments</div>

						<div class="panel-body">
							<div class="col-md-2 searchpadding padding_top">Add				Attachments</div>
							
							
							
							<h3 class="header smaller lighter red pull-right">Please select file doc,txt,xls,ods format file</h3>
							
							
							
					
							
							<div class="col-md-10 searchpadding padding_top"
								style="margin-top:">
								
								<span id="taskAttachment1dailog"> 
								<input class="btn dbtn"	type="button" value="Choose File" name="Choose File"		id="AttachButton1" onclick="openFileDailog('taskAttachment1')">
									<a id="doc1link"><lable id="attache1"> No file		chosen</lable></a> 
								</span><span id="taskAttachment1name"></span><br />
								 
								<div class="space"></div> 
								 
								 <span
									id="taskAttachment2dailog"> <input class="btn dbtn"
									type="button" value="Choose File" name="Choose File"
									id="AttachButton2" onclick="openFileDailog('taskAttachment2')">
																		downloadAttachment('+attachment1DocId+')">'+doc1Name+'</a>
									<a id="doc2link"><lable id="attache2"> No file
										chosen</lable></a>


								</span><span id="taskAttachment2name"></span><br /> <span
									id="taskAttachment3dailog"> <input class="btn dbtn"
									type="button" value="Choose File" name="Choose File"
									id="AttachButton3" onclick="openFileDailog('taskAttachment3')">
									<a id="doc3link"><lable id="attache3"> No file
										chosen</lable></a>
										<div class="space"></div>
								</span><span id="taskAttachment3name"></span><br />


																            <a href="#" onclick="addMoreAttachments()" id="addMoreLink" style="display: none">Add more</a>
								<input type="file" name="taskAttachment" id="taskAttachment1"	style="display: none;">
								<div class="space"></div>
								 <input type="file"	name="taskAttachment" id="taskAttachment2"	style="display: none;">
								 <div class="space"></div>
								  <input type="file" name="taskAttachment" id="taskAttachment3"		style="display: none;">
								  <div class="space"></div>
								  
								  
							</div>
						</div>
						<input type="hidden" id="taskIdToSend" name="taskId">

					</div> -->
					

</form>

<% if (request.getAttribute("kkk")!=null) 
{ %>
	<div class="topmenu">
			
							
						
					</div>
	 	<div style="float:right;">
				
								<button  id="btn_update"  class="btn btn-sm btn-primary"  onClick="saveTask(1);"><!-- <i class='ace-icon fa fa-plus'></i> -->Update</button>
                    			<!-- <button  id="btn_update_c" class="btn btn-sm btn-danger" onclick="cancel()" ><i class='fa fa-times'></i>Cancel</button>  -->
					
					
									<a href="<%=request.getContextPath()%>/partnersp/getTaskList.htm"><input  class="btn btn-sm btn-primary" id="btn_update_c" type="button" value="Cancel" name="Cancel" ></a>				
									
					
							</div>


<% } else { %>


<div class="topmenu">
	<input type="hidden" id="onself" value="1">
					
		<div style="float:right;">					
								<button id="btn_save" class="btn btn-sm btn-primary"  onClick="saveQuery(0);"><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button id="btn_save1"  class="btn btn-sm btn-primary"   onClick="saveQuery(1);"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
									
									<!-- <button id="btn_save1" class="btn btn-sm btn-danger" onclick="cancel()"><i class='fa fa-times'></i>Cancel	</button> -->
									
									
									<a href="<%=request.getContextPath()%>/partnersp/getTaskList.htm"><input class="btn btn-sm btn-danger" id="btn_save_c" type="button" value="Cancel" name="Cancel" ></a>
									</div>
						
						
					</div>
	

<% } %>

					
					
					

				<!-- center end -->
			
			
			



		


	</section>
	<!-- Center part End -->

	 <jsp:include page="../common/footer.jsp" /> 


	<script>
		var userLabelValueList = new Array();
		var contactId = 0;
		var isAttachment = 0;
		$("#contactId").change(function() {
			contactId = 0;
		});
		// var fileCount=0;
		
		
		
		$(function() {
			
			$("#clientdata").hide(); 
			$("#oppdata").show();
			 $("#contactdata").show();
			
			var width=window.screen.availWidth;
			if(width >1500)
				{
				$("#quickSearchpart").css("width", 415);	
				document.getElementById("pagesize1").value = 415;
				$(".ui-autocomplete").css("width", 405);
				$(".ui-autocomplete").css("top", 310);
				
			
				}
			else
				{
				document.getElementById("pagesize1").value = 350;
				$("#quickSearchpart").css("width", 350);
				$(".ui-autocomplete").css("width", 345);
				$(".ui-autocomplete").css("top", 250);
				}
			
			
			//showSelectedTab('taskLink');
			if ($('#taskMessage').val() == 'success') {
			/* 	showAlertMessage1("Message", "<br/>Task saved successfully.",
						"information", redirectFurther); */
						
						alert("sucess");
			} else if ($('#taskMessage').val() == 'fail') {
				/* showAlertMessage1(
						"Error",
						"The connection to the server has been lost. Please try again later.",
						"error", doNothing); */
						alert("not done");
			} else if ($('#taskMessage').val() != '') {
				/* showAlertMessage1("Error", $('#taskMessage').val(), "error",
						doNothing); */
						alert("try");
			}
			
			
			
			
			var taskContactTypeID=0;
			var hidetaskTypeID=0;
			var hidetaskStatusID=0;
			var hidetaskPriorityID=0;
			if($('#hidetaskOwnerPartyID').val()=='')
				{
			/* 	document.getElementById("AttachButton1").disabled = false;
				document.getElementById("AttachButton2").disabled = false;
				document.getElementById("AttachButton3").disabled = false; */
				
				}
			else
				{
			/* 	document.getElementById("AttachButton1").disabled = true;
				document.getElementById("AttachButton2").disabled = true;
				document.getElementById("AttachButton3").disabled = true; */
				
				var hidetaskOwnerPartyID=$('#hidetaskOwnerPartyID').val();
				var hideownerPartyName=$('#hideownerPartyName').val();
				hidetaskTypeID=$('#hidetaskTypeID').val();
				 hidetaskPriorityID=$('#hidetaskPriorityID').val();
				 hidetaskStatusID=$('#hidetaskStatusID').val();
				var hidetaskSubject=$('#hidetaskSubject').val();
				var hidetaskText=$('#hidetaskText').val();
				 taskContactTypeID=$('#hidetaskContactTypeID').val();
                  var date=$('#hidedueDateTime').val();
                  var comdate=$('#hidecompletionDateTime1').val();
                  
                  var endDate=$('#hideendDateTime').val();
                  
				
				
				
	document.getElementById("enddate").value = endDate;
				document.getElementById("duedate").value = date;
				document.getElementById("completionDate1").value = comdate;
				
				 document.getElementById("description").value = hidetaskText;
				document.getElementById("subject").value = hidetaskSubject;
				
				document.getElementById("quickSearchpart").value = hideownerPartyName;
				document.getElementById("quickSearchHiddenpart").value = hidetaskOwnerPartyID;
				
			
				document.getElementById("enddate").value = endDate;
				
				
				var man='';			
var i;
for ( i = 0; i <10; i++) {
   man= man +date[i];
	   
}
var output = new Date();
var dd = output.getDate();
var mm = output.getMonth()+1; //January is 0!
var yyyy = output.getFullYear();
if(dd<10) {
    dd='0'+dd
} 
if(mm<10) {
    mm='0'+mm
} 
var today = yyyy +'/'+mm+'/'+dd;



if(today<man)
	{
	
	try
	{
		$('#duedate').datetimepicker
		({
			dayOfWeekStart : 1,
		//	  minDate: moment({y: ,})
		minDate: 0
		});
			
	}
	catch(e)
	{
		$jq_1_9_1('#duedate').datetimepicker
		({
			dayOfWeekStart : 1,
		
		minDate: 0
		});
		
	}
	
	}
else
	{
	try{
		$('#duedate').datetimepicker
		({
			dayOfWeekStart : 1,
		
		minDate: man
		});
	}
	catch(e)
	{
		$jq_1_9_1('#duedate').datetimepicker
		({
			dayOfWeekStart : 1,
		
		minDate: man
		});
	}

	
	}
document.getElementById("duedate").value = date;
				
				}
		
			 
			
			$
					.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/faq/getPicklistValues.htm?codeTypeIds=18,22,17,20',
						success : function(result) {
							$('#TastNotificationType').empty();
							$('#taskStatus').empty();
							$('#taskPriority').empty();
							
							$('#description').empty();
							$(result).each(
									function(i, obj) {
										var codeTypeId = obj.codeTypeId;
										var codeValue = obj.codeValue;
										var codevalueId = obj.codeValueId;
										if (codeTypeId == 17) 
										
										
										{
											if(codevalueId==17001||codevalueId==17002||codevalueId==17003||codevalueId==17004||codevalueId==17006)
												{
												if(hidetaskTypeID==codevalueId)
													{
													$('#TastNotificationType').append('<option value="'+codevalueId+'" selected="selected">'+ codeValue	+ '</option>');
													}
												else
													{
													$('#TastNotificationType').append('<option value="'+codevalueId+'">'+ codeValue	+ '</option>');	
													}
													
												}
											
										}
										
										
										
										else if(codeTypeId == 20)
											{

											$('#querTypeId').append('<option value="'+codevalueId+'">'		+ codeValue
															+ '</option>');		
											}
										
										
										else if (codeTypeId == 22) 
										{
											
											if(hidetaskStatusID==codevalueId)
												{

												$('#taskStatus').append(														'<option value="'+codevalueId+'" selected="selected">'
																+ codeValue
																+ '</option>');
												}
											else
												{

												$('#taskStatus').append(
														'<option value="'+codevalueId+'">'
																+ codeValue
																+ '</option>');
												}
										}
										else if (codeTypeId == 18) {
											
											if(hidetaskPriorityID==codevalueId)
												{
												$('#taskPriority').append(
														'<option value="'+codevalueId+'" selected="selected">'
																+ codeValue
																+ '</option>');
												}
											else
												{
												$('#taskPriority').append(
														'<option value="'+codevalueId+'">'
																+ codeValue
																+ '</option>');	
												}
											
										} 
										
										
						
									});
							$('#completionDate').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"
							});
							
							
							
							
							
							$('#taskTo').empty();
							 
							$
									.ajax({
										type : "POST",
										url : $('#contextPath').val()
												+ '/partnersp/getTaskAssign.htm',
										success : function(result) {
											$(result)
													.each(
															function(i, obj) {
																var module = obj.codeValueID; 
																var modulename = obj.codeValue;
															
																
																if(taskContactTypeID==module)
																{
																	$('#taskTo').append('<option value="'+ module+'" selected="selected">'+ modulename + '</option>');
																}
																else
																	{
																	$('#taskTo').append('<option value="'+ module+'" >'+ modulename + '</option>');	
																	}
																
																
													
															} );
											
											 var av=$('#onself').val();
											if(av==1)
												{
												forself();
												}
											var taskId = $('#taskIdHidden').val();
											if (taskId == 0) 
											{
											
											}
											
											
										}
									});
							var attachment1=$('#hideattachment1').val();
							var attachment2=$('#hideattachment2').val();
							var attachment3=$('#hideattachment3').val();
							
							var attachmentID1=$('#hideattachment1ID').val();
							var attachmentID2=$('#hideattachment2ID').val();
							var attachmentID3=$('#hideattachment3ID').val();
							
	if($('#hidetaskOwnerPartyID').val() == 0 || $('#hidetaskOwnerPartyID').val() ==null )
								{
							/* 	 document.getElementById("AttachButton1").disabled = false;
								 document.getElementById("AttachButton2").disabled = false;
							 document.getElementById("AttachButton3").disabled = false;  
							 
							  */
							 
								}
							else
								{ 
								 
								 
						 			if(attachment1 == ' ' || attachment1==null)
									{
						 				$('#attache1').html('No file chosen');
						 				document.getElementById("AttachButton1").disabled = false;
						 				$('#hideattachment1ID').val(0);
									}  
						 			else
						 				{
						 				
										$('#attache1').html('');
										$('#taskAttachment1name').html('<a onclick="downloadAttachment('+attachmentID1+')" >'+attachment1+'</a>'	+ ' <a onclick="removeattachment(\'taskAttachment1\')">Remove</a>');
									
						 				}
									if(attachment2 == ' ' || attachment2==null)
									{
										
										$('#attache2').html('No file chosen');
										document.getElementById("AttachButton2").disabled = false;
										$('#hideattachment2ID').val(0);
									}
									else
										{
										
										$('#attache2').html('');
										
									 	$('#taskAttachment2name').html('<a onclick="downloadAttachment('+attachmentID2+')" >'+attachment2+'</a>'	+ ' <a onclick="removeattachment(\'taskAttachment2\')">Remove</a>'); 
										
										}
									
									if(attachment3 == ' ' || attachment3==null)
									{
										
										$('#attache3').html('No file chosen');
										document.getElementById("AttachButton3").disabled = false;
										$('#hideattachment3ID').val(0);
									}
									else
										{
										
										$('#attache3').html('');
										
									 	$('#taskAttachment3name').html('<a onclick="downloadAttachment('+attachmentID3+')" >'+attachment3+'</a>'	+ ' <a onclick="removeattachment(\'taskAttachment3\')">Remove</a>'); 
										
										}
									
									
								/* 	if(attachment3 ==' ' || attachment3==null)
									{
										$('#attache3').html('No file chosen');
										document.getElementById("AttachButton3").disabled = false;
										$('#hideattachment3ID').val(0);
									}
									else
										{
										
										$('#attache3').html('');
								
										$('#taskAttachment3name').html('<a onclick="downloadAttachment('+attachmentID3+')" >'+attachment3+'</a>' 	+ ' <a onclick="removeattachment(\'taskAttachment3\')">Remove</a>'); 
										} */
								} 
							
						
							 
						}
					});


		});

		
/* 		
		$('#taskAttachment1').change(function() 
						{
							$('#taskAttachment1dailog').hide();
							$('#taskAttachment1name').html($('#taskAttachment1').val().substring($('#taskAttachment1').val().lastIndexOf('\\') + 1)+' <a onclick="removeattachment(\'taskAttachment1\')">Remove</a>');
							$('#taskAttachment1name').show();
						}); */
		
		
		
		
		$('#taskAttachment1').change(
				function() {
					var extensionToCheck = $('#taskAttachment1').val().substring(($('#taskAttachment1').val().lastIndexOf('.') + 1));
					if (extensionToCheck == 'txt'
							|| extensionToCheck == 'doc' ||  extensionToCheck == 'xls'   ||  extensionToCheck == 'ods'  
							
						)
					{
						$('#taskAttachment1dailog').hide();
						$('#taskAttachment1name').html($('#taskAttachment1').val().substring($('#taskAttachment1').val().lastIndexOf('\\') + 1)+' <a onclick="removeattachment(\'taskAttachment1\')">Remove</a>');
						$('#taskAttachment1name').show();
					/* 	$('#logoFileName').html($('#logoFile').val().substring($('#logoFile').val().lastIndexOf('\\') + 1));
						isLogoSelected = 1; */
					} else {
						
						bootbox.dialog({
						  	message: "<span class='bigger-110'>Please select valid file.</span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
									
										$('#taskAttachment1dailog').show();
										$('#taskAttachment1name').html('');
									$('#taskAttachment1name').hide();
									}
								}
							}
						});
					}
				});
		
		
		
/* 		$('#taskAttachment1').change(function() 
						{
							$('#taskAttachment1dailog').hide();
							$('#taskAttachment1name').html($('#taskAttachment1').val().substring($('#taskAttachment1').val().lastIndexOf('\\') + 1)+' <a onclick="removeattachment(\'taskAttachment1\')">Remove</a>');
							$('#taskAttachment1name').show();
						}); */
						
						
						
						
						$('#taskAttachment2').change(
								function() {
									var extensionToCheck = $('#taskAttachment2').val().substring(($('#taskAttachment2').val().lastIndexOf('.') + 1));
									if (extensionToCheck == 'txt'
											|| extensionToCheck == 'doc' ||  extensionToCheck == 'xls'  ||  extensionToCheck == 'ods'  
											
										)
									{
										$('#taskAttachment2dailog').hide();
										$('#taskAttachment2name').html($('#taskAttachment2').val().substring($('#taskAttachment2').val().lastIndexOf('\\') + 1)+' <a onclick="removeattachment(\'taskAttachment2\')">Remove</a>');
										$('#taskAttachment2name').show();
									/* 	$('#logoFileName').html($('#logoFile').val().substring($('#logoFile').val().lastIndexOf('\\') + 1));
										isLogoSelected = 1; */
									} else {
										
										bootbox.dialog({
										  	message: "<span class='bigger-110'>Please select valid file.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
													
														$('#taskAttachment2dailog').show();
														$('#taskAttachment2name').html('');
													$('#taskAttachment2name').hide();
													}
												}
											}
										});
									}
								});
						
						
						
						$('#taskAttachment3').change(
								function() {
									var extensionToCheck = $('#taskAttachment3').val().substring(($('#taskAttachment3').val().lastIndexOf('.') + 1));
									if (extensionToCheck == 'txt'
											|| extensionToCheck == 'doc' ||  extensionToCheck == 'xls'  ||  extensionToCheck == 'ods'  
											
										)
									{
										$('#taskAttachment3dailog').hide();
										$('#taskAttachment3name').html($('#taskAttachment3').val().substring($('#taskAttachment3').val().lastIndexOf('\\') + 1)+' <a onclick="removeattachment(\'taskAttachment3\')">Remove</a>');
										$('#taskAttachment3name').show();
									/* 	$('#logoFileName').html($('#logoFile').val().substring($('#logoFile').val().lastIndexOf('\\') + 1));
										isLogoSelected = 1; */
									} else {
										
										bootbox.dialog({
										  	message: "<span class='bigger-110'>Please select valid file.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
													
														$('#taskAttachment3dailog').show();
														$('#taskAttachment3name').html('');
													$('#taskAttachment3name').hide();
													}
												}
											}
										});
									}
								});
						
						
/* 		$('#taskAttachment2')
				.change(
						function() {
							$('#taskAttachment2dailog').hide();
							$('#taskAttachment2name')
									.html(
											$('#taskAttachment2')
													.val()
													.substring(
															$(
																	'#taskAttachment2')
																	.val()
																	.lastIndexOf(
																			'\\') + 1)
													+ ' <a onclick="removeattachment(\'taskAttachment2\')">Remove</a>');
							$('#taskAttachment2name').show();
						});
		$('#taskAttachment3')
				.change(
						function() {
							$('#taskAttachment3dailog').hide();
							$('#taskAttachment3name')
									.html(
											$('#taskAttachment3')
													.val()
													.substring(
															$(
																	'#taskAttachment3')
																	.val()
																	.lastIndexOf(
																			'\\') + 1)
													+ ' <a onclick="removeattachment(\'taskAttachment3\')">Remove</a>');
							$('#taskAttachment3name').show();
						}); */
		function openFileDailog(id) {
			isAttachment = 1;
			$('#' + id).click();
		}
		function removeattachment(id) {
			$('#' + id + 'dailog').show();
			$('#' + id + 'name').html('');
			$('#' + id + 'name').hide();
			$('#' + id).val('');
			
			if(id == 'taskAttachment3')
				{
				$('#hideattachment3ID').val(0);
							
				$('#taskAttachment3dailog').show();
				
				document.getElementById("AttachButton3").disabled = false;  
				$('#attache3').html('No file chosen');
				}
			else if(id == 'taskAttachment2')
				{
				$('#hideattachment2ID').val(0);
				document.getElementById("AttachButton2").disabled = false;
				$('#attache2').html('No file chosen');
				}
			else if(id == 'taskAttachment1')
			{
			$('#hideattachment1ID').val(0);
			document.getElementById("AttachButton1").disabled = false;
			$('#attache1').html('No file chosen');
			
			}
		}
		
		function validate()
		{
			var isTrue=true;
			var startDt = $('#duedate').val();
			var endDt = $('#enddate').val();
			
			if ($.trim($('#subject').val()) == '') 
			{
				$('#subject').css('border-color','#d16e6c');
				$('#subject_error').css('border-color','#d16e6c');
				$('#subject_error').removeClass('hide');
				isTrue=false;
				
			}
			else{				
				$('#subject_error').addClass('hide');				
				$('#subject').css('border-color','#d5d5d5');
			}
			
			if (startDt == '' || startDt == 'N/A') 
			{				
				$('#duedate').css('border-color','#d16e6c');
				$('#duedate_error').css('border-color','#d16e6c');
				$('#duedate_error').removeClass('hide');			
				isTrue=false;				
			}
			else
			{				
				$('#duedate_error').addClass('hide');		
				$('#duedate').css('border-color','#d5d5d5');
			}
			if (endDt == '' || endDt == 'N/A') 
			{				
				$('#enddate').css('border-color','#d16e6c');
				$('#enddate_error').css('border-color','#d16e6c');
				$('#enddate_error').removeClass('hide');			
				isTrue=false;				
			}
			else{				
				$('#enddate_error').addClass('hide');		
				$('#enddate').css('border-color','#d5d5d5');
			}
			if($('#quickSearchHiddenpart').val()=="")
			{				
				$('#quickSearchpart').css('border-color','#d16e6c');
				$('#quickSearchpart_error').css('border-color','#d16e6c');
				$('#quickSearchpart_error').removeClass('hide');			
				isTrue=false;				
			}
			else{				
				$('#quickSearchpart_error').addClass('hide');		
				$('#quickSearchpart').css('border-color','#d5d5d5');
			}
			return isTrue;
		}
		 /*  function removeCssStyles(pElementId) {
				$('#'+pElementId).css('border-color','grey');
				$('#'+pElementId).removeAttr('title');
			} */
		
			
			
			
			
			function saveQuery(isToClose)
			{
				
			
			 	$.ajax({
					type :'POST',  
					

					data:$('#addform').serialize(),
					url : $('#contextPath').val() +"/querysp/addQuery.htm",
			    
			    		 
							success : function(result) 
							{
								
								   if(isclose==1){
									   bootbox.dialog({
											message: "<span class='bigger-110'>Biz Unit saved successfully.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
														 location.reload();
														// resetval();
													}
												}
											}
										});
									   
									   
						              }else{
						            	  

						            	  $('#success-msg').empty();	
										  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Biz Unit saved successfully.</p></div>');
										  resetVal();
										  getCountry();
						            	  addNote();
							              //popup('popUpAlertaddnote').show();
							             
						              }
								 
								
					}
				});
			}
			
			
		function saveTask(isToClose) {
				$('#taskIsClose').val(isToClose);
				
				if(validate()==true)
				{
				
				
			
			 
			     
			   var task=$('#taskIdHidden').val();
			 
		 	     if (task == ''|| task ==null)
			    	 {
			    	 $('#taskIdHidden').val(0);
			    	 }
			
			     //alert("task"+task);
			    	 
			    	 
			localStorage.setItem('isToClose', isToClose);
			var isValidated = true;
			var taskId = $('#taskIdHidden').val();
			var startDt = $('#duedate').val();
			var endDt = $('#completionDate').val();
			var contact = $('#contactId').val();
			var taskPriority= $('#taskPriority').val();
			var endDate=$('#enddate').val();
			
			var statusname = $('#taskStatus :selected').text();
			
			$('#statusName').val(statusname);
			
			var startDt1 =new Date(startDt);

			var startDt11=Date.parse(startDt1,'d/m/Y H:i');
			
			
			var endDate1 =new Date(endDate);

			var endDate11=Date.parse(endDate1,'d/m/Y H:i');
		
			
						
			
	
			
				
				
		if (isValidated == true) 
			{ 
				//var data = $('#addTaskForm').find('.nicEdit-main').text();
			/* 
				if (isAttachment == 0) 
				{
					$.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/partnersp/saveTask.htm?taskId=' + taskId,
						data : $('#addTaskForm').serialize(),
						success : function(result) {
							result = JSON.parse(result);
							if (result == "1") {
								
								
								  
								if(isToClose==0)
									{
									  bootbox.dialog({
										  	message: "<span class='bigger-110'>Task saved successfully.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
														
														location.reload();
														//cancel();
														//window.open($('#contextPath').val()+"/partnersp/getTaskList.htm");
													}
												}
											}
										});
									}
								else
									{
									  bootbox.dialog({
										  	message: "<span class='bigger-110'>Task saved successfully.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
														cancel();
														//window.open($('#contextPath').val()+"/partnersp/getTaskList.htm");
													}
												}
											}
										});
									}
						
								
								
								//showAlertMessage("Success",	"<br/> Task saved successfully.","information", redirectFurther)
							}

						}
					});
				} 
				else 
				{

					 */
					  
					if(isToClose==0)
						{
						
						
						bootbox.dialog({
						  	message: "<span class='bigger-110'>Task saved successfully.</span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										$('#addTaskForm').submit();
										//window.location.reload();
										//return true;			
									//	location.reload();
									}
								}
							}
						});
			 
			/* 
						bootbox.dialog({
						  	message: "<span class='bigger-110'>Task saved successfully.</span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										$('#addTaskForm').submit();		
										/* window.location.href = $('#contextPath').val()
										+ '/partnersp/getTaskList.htm';
								
									//	return true;			
										
									}
						  	
								}
							}
						});  */
						
					}
						
						  
					else
						{
						
						
							{
							bootbox.dialog({
							  	message: "<span class='bigger-110'>Task saved successfully.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											$('#addTaskForm').submit();
											//window.location.reload();
											//return true;			
										//	location.reload();
										}
									}
								}
							});
							}
						
					
							
						}
			
			
					
					
					
			
					
					
					
					
				//}
		 	} 
		}
		}
/* 		 function some()
		{
			 alert("here");
				cancel();
		} */
		function split(val) {
			return val.split(/;\s*/);
		}
		function extractLast(term) {
			return split(term).pop();
		}
		function getdates()
		{
			var val=$('#taskStatus').val();
			
			if(val==19004)
				{
				
				
			    var today = new Date();
			    var dd = today.getDate();
			    var mm = today.getMonth()+1; //January is 0!
			    var yyyy = today.getFullYear();
			    if(dd<10){
			        dd='0'+dd;
			    } 
			    if(mm<10){
			        mm='0'+mm;
			    } 
			    var today = dd+'/'+mm+'/'+yyyy;
			   $('#completionDate1').val(today);
				}
			else
				{
				$('#completionDate1').val('');

				}
		
		}	
		
		
		function forself()
		{
		var val=$('#taskTo').val();
   	
		var data=$('#taskIsClose').val();
		
		if(val==521001)
		{
			
   		
   		
   		var logerinuser=$('#logerinuser').val();
   		
   		$('#quickSearchHiddenpart').val(logerinuser);	
   		var logerinusername=$('#logerinusername').val();
   		
   		$('#quickSearchpart').val(logerinusername);	
   		
   		document.getElementById("quickSearchpart").readOnly = true;

   			$('#quickSearchpart_error').addClass('hide');

   		
		}
   	
   	else
   		{
   		
   		
   		
   		$('#quickSearchHiddenpart').val('');
   		$('#quickSearchpart').val('');
   		document.getElementById("quickSearchpart").readOnly = false;
   		//$('#quickSearchpart').val('');
   		
   		
   	    	if(data=='' ||data==null)
   			{
   	    		//$('#quickSearchpart_error').addClass('hide');
   	    	$('#quickSearchpart_error').addClass('hide');
   	    		
   	    		
   			}
   		else
   			{
   			$('#quickSearchpart_error').removeClass('hide');
   			}
   	 $("#quickSearchpart").empty();
   		quickSearchPartner11("000000000000");
   	$(".ui-corner-all").attr("autocomplete", "off");
	     
	    <% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
	    response.setHeader("Pragma","no-cache"); //HTTP 1.0 
	    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
	   %>
		
   		}
		}
		
		
	/* 	
		function getContactList() {
			userLabelValueList = new Array();
			removeCssStyles('contactId');
			recordType = $('#contactType').val();
			loggedInUserPartyId = 6375;
			$('#contactId').val('');
			contactId = 0;
			$
					.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/partnersp/getUserList.htm?loggedInUserPartyId='
								+ loggedInUserPartyId + '&recordType='
								+ recordType,
						success : function(result) {
							result = JSON.parse(result);
				
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.partyId;
								object.label = obj.name;
								userLabelValueList.push(object);
							});
							$jq_1_9_1(".contactList")
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $jq_1_9_1.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})
									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													// delegate back to autocomplete, but extract the last term
													response($jq_1_9_1.ui.autocomplete
															.filter(
																	userLabelValueList,
																	request.term));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},
												select : function(event, ui) {
													var terms = split(this.value);
													terms.pop();
													terms.push(ui.item.label);
													contactId = ui.item.value;
													terms.push("");
													this.value = terms.join("");
													var labelArr = $(this)
															.data('label')
															|| new Array();
													labelArr.push(ui.item);
													$(this).data('label',
															labelArr);
													console.log($(this).data());

													return false;
												}
											});
						}
					});
		}
 */
		function redirectFurther() {
			var isToClose = localStorage.getItem('isToClose');
			localStorage.setItem('isToClose', '0');
			if (isToClose == '1') {
				window.location.href = $('#contextPath').val()
						+ '/partnersp/getTaskList.htm';
			} else {
				window.location.reload();
			}
		}
		function addnote() {
			$('#addNote').attr('rows', '10');
			$("#save, #cancel").show();
		}
	</script>
	<%
		String resultTask = "";
		resultTask = session.getAttribute("resultTask") == null ? ""
				: session.getAttribute("resultTask").toString();
		if (resultTask.equals("success")) {
			session.setAttribute("resultTask", "");
	%>
	<input type="hidden" id="taskMessage" value="success" />

	<%
		} else {
			session.setAttribute("resultTask", "");
	%>
	<input type="hidden" id="taskMessage" value="<%=resultTask%>" />
	<%
		}
	%>


<%-- 
	<%
		int taskId = 0;
		try {
			taskId = Integer.parseInt(request.getParameter("taskId")
					.toString());
			if (taskId != 0) {
	%> --%>
	
<%-- 	<%
		}
		} catch (Exception e) {
	%>
	<input type="text" id="taskIdHidden" value="0">
	<%
		}
	%> --%>


</body>

<script>
function none1()
{
}
	
	
$('#enddate').datetimepicker({ 
	format: 'DD/MM/YYYY hh:mm A' ,
	startDate:	0,
	minDate: 0
	}).next().on(ace.click_event, function()
		{

	$(this).prev().focus();
});

/* function datetime(elem) {
    $(elem).datetimepicker({ format: 'dd.mm.yyyy hh:mm', autoclose: true, weekStart: 1, language: "tr" }).next().on(ace.click_event, function () {
        $(this).prev().focus();
    });
 */
 
 $('#duedate').datetimepicker();
 $('#enddate').datetimepicker();
 
 $("#duedate").on("dp.change", function (e) {
	 
var date= $("#duedate").val();
 
	var startDt1 =new Date(date);

	var startDt11=Date.parse(startDt1,'DD/MM/YYYY hh:mm A');
 
	    try{
	    	$('#enddate').data("DateTimePicker").maxDate(e.date);
	    }
	    	
	    catch(e)
	    {
	    
	    	try
	    	{
	     		
	    		$jq_1_9_1('#enddate').data("DateTimePicker").maxDate(e.date);
	    	}

	    	catch(e1)
	    	{
	    		try 
	    		{
	    			$jq_1_9_2('#enddate').data("DateTimePicker").maxDate(e.date);
	    		}
	    		catch(e2)
	    		{
	    			$j('#enddate').data("DateTimePicker").maxDate(e.date);	
	    		}
	    	}

	    	    	
	    }
	});
 
 $("#enddate").on("dp.change", function (e) {
	    //$('#duedate').data("DateTimePicker").minDate(e.date);
	    
	      try{
	    	$('#duedate').data("DateTimePicker").minDate(e.date);
	    }
	    	
	    catch(e)
	    {
	    
	    	try
	    	{
	     		
	    		$jq_1_9_1('#duedate').data("DateTimePicker").minDate(e.date);
	    	}

	    	catch(e1)
	    	{
	    		try 
	    		{
	    			$jq_1_9_2('#duedate').data("DateTimePicker").minDate(e.date);
	    		}
	    		catch(e2)
	    		{
	    			$j('#duedate').data("DateTimePicker").minDate(e.date);	
	    		}
	    	}

	    	    	
	    }
	    
	    
	});

 
$('#duedate').datetimepicker({ format: 'DD/MM/YYYY hh:mm A'}).next().on(ace.click_event, function()
		{
	 //dateFormat: 'dd/MM/yyyy' 
     //timeFormat: 'HH:mm a'
    
	 $(this).prev().focus();
});

</script>
<!-- <script type="text/javascript">
    $(function () {
        $('#datetimepicker6').datetimepicker();
        $('#datetimepicker7').datetimepicker();
        $("#datetimepicker6").on("dp.change",function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change",function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });
</script> -->


<script>

 
 
 
var output = new Date();
var dd = output.getDate();
var mm = output.getMonth()+1; //January is 0!
var yyyy = output.getFullYear();
var hours=output.getHours();
var minute=output.getMinutes();
if(dd<10) {
    dd='0'+dd
} 
if(mm<10) {
    mm='0'+mm
} 
if ( minute==0	||minute==1	||minute==2	||minute==3	||minute==4	||minute==5	||minute==6	||minute==7	||minute==8	||minute==9)
{
	
minute='0'+minute;
}



var mm1='';
if(hours<12)
	{
	mm1="AM";
	}
else
	{
	mm1="PM";
	hours=hours-12;
	}
var today = dd+'/'+mm+'/'+yyyy+' '+hours+':'+ minute +' '+mm1;
 

minute=output.getMinutes()+1;

if ( minute==0	||minute==1	||minute==2	||minute==3	||minute==4	||minute==5	||minute==6	||minute==7	||minute==8	||minute==9)
	{
	minute='0'+minute;
	}


var today1 =dd+'/'+mm+'/'+yyyy+' '+hours+':'+ minute+' '+mm1;

$('#enddate').val(today1);
$('#duedate').val(today);


/* try{
	$('#enddate').datetimepicker
	({
		dayOfWeekStart : 1,
	lang:'en',
	startDate:	today1,
	minDate: 0,
	 
	format:'d/m/Y H:i',

	});
	$('#enddate').datetimepicker({value:today1,step:05});
	
}
catch(e)
{
	$jq_1_9_1('#enddate').datetimepicker
	({
		dayOfWeekStart : 1,
	lang:'en',
	startDate:	today1,
	minDate: 0,
	 
	format:'d/m/Y H:i',

	});
	$jq_1_9_1('#enddate').datetimepicker({value:today1,step:05});
	}

try
{

	$('#duedate').datetimepicker({
		
		  

		dayOfWeekStart : 1,
		lang:'en',
		startDate:	today,
		minDate: 0,
		format:'d/m/Y H:i',	
		  
		    });
		

		$('#duedate').datetimepicker({value:today,step:05});
	}
	catch(e)
	{
		$jq_1_9_1('#duedate').datetimepicker({
			
			  

			dayOfWeekStart : 1,
			lang:'en',
			startDate:	today,
			minDate: 0,
			format:'d/m/Y H:i',	
			  
			    });
			

			$jq_1_9_1('#duedate').datetimepicker({value:today,step:05});		
	} */

	
</script>

<script type="text/javascript">



$('input[name=queryFor]:radio').change(function (event) {
	if($(this).val()=='new')
	{
		$('#clientdata').hide();	
	$("#contactdata").show();
		 $("#oppdata").show();
	}else{
		$('#clientdata').show();	
	$("#contactdata").hide();
		 $("#oppdata").hide();
		 quickSearchClient();
	}
});
function goback() {
	//location.href="loadrole.htm";
	history.back();
}
		  
		  
		  
function  downloadAttachment(data)
{
	
		  window.location.href= $('#contextPath').val()+'/common/downloadDocument.htm?docId='+data;	   
		  
			
	
}
function cancel()
{
	
	
	/* window.open($('#contextPath').val()+"/partnersp/getTaskList.htm"); */
	 window.location.href = $('#contextPath').val()+"/partnersp/getTaskList.htm"; 
	
//	alert("here");
	}
	

$('#menu-wplook-sub-menu4').addClass('active');	
$('#SPTasksLink').addClass('active');
	
	
</script>

<!-- <script type="text/javascript">
	var $jq_1_9_1 = $.noConflict();
</script>  -->
</html>