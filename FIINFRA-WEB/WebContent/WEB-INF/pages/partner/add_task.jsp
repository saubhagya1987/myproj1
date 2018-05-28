<!DOCTYPE html>
<html lang="en">
<head>
 <link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Add/Edit Task</title>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/common_popup.jsp" />
	<!-- Center part start -->
	<section>	
		<form id="addTaskForm" name="FileUploadForm"
			action="<%=request.getContextPath()%>/task/saveTask.htm"
			enctype="multipart/form-data" method="post">
			
				<input type="hidden" id="hideattachment1ID" name="attachment1DocumentID">
<input type="hidden" id="hideattachment2ID" name="attachment2DocumentID" >
<input type="hidden" id="hideattachment3ID" name="attachment3DocumentID" >

			
			<div class="container">
			<div class="page-header">
					<h1>Add/Edit Task</h1>
    				</div>
				<div class="container-body">
					<!-- Details Start -->
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
								<select name="ownerPartyId" id="taskTo" onchange="disableAssignto()"
									class="input-xxlarge">
									<option>Self</option>
									<option>Harish Barke [PST]</option>
									<option>Chetan Desai [AKT]</option>
									<option>Kiran Nanda [AOT]</option>

								</select>
							</div>
							</div>
							
							 <div class="form-group col-md-6 clearfix">							
							<label class="col-sm-3 control-label no-padding-right" for="contactType">Target Type</label>
							<div class="col-sm-9">
								<div class="col-md-5 ">
									<select name="targetContactTypeId" id="contactType"
										class="input-xxlarge">
										<option>Opportunity</option>
										<option>Clientsourabh</option>
										<option>Premium Client</option>
									</select>
								</div>
								<div class="col-md-4" >
									<input type="text" name="targetPartyId" id="contactId"
										class="input-xxxlarge contactList" onclick="getContactList()" />												
										<div id="contactId_error" class="help-block hide">Please provide contact name.</div>																											
											<input  type="hidden" id="quickSearchHiddenpart"  placeholder="Quick Search" style="width: 300px;">		
											<input  type="hidden"  name="targetPartyName" id="quickSearchHiddenpart1" >
											<input  type="hidden"  name="statusName"  id="statusNameid">								
								</div>
							</div>
							</div>
							</div>
							
							<div class="row">
							<div class="form-group col-md-6 clearfix">								
							<label class="col-sm-3 control-label no-padding-right" for="TastNotificationType">Task Category</label>
							<div class="col-sm-9">
							 <div class="input-xxlarge">
								<select name="categoryId" id="TastNotificationType"
									class="input-xxlarge">
									<option>Call</option>
									<option>Email</option>
									<option>SMS12</option>
									<option>Meeting</option>
									<option>Next Steps</option>
									<option>Others</option>

								</select>
							</div>
							</div>
							</div>
									<div class="form-group col-md-6 clearfix">	
							<label class="col-sm-3 control-label no-padding-right" for="taskPriority">Priority <span class="red">*</span> </label>
							<div class="col-sm-9">
								<select name="priorityId" id="taskPriority" class="input-xxlarge">
									<option>Medium</option>
									<option>Higher</option>
									<option>Low</option>
								</select>
							</div>
							</div>
		
							</div>
							
							
								<div class="row">
					
					<div class="form-group col-md-6 clearfix">								
							<label class="col-sm-3 control-label no-padding-right" for="duedate">Task Start Date <span class="red">*</span></label>
							<div class="col-sm-9">
									<input type="text" class="input-large" id="duedate" 
															 
									
										name="dueDateTimeString" title="Start Date" validate="date">	
							<div id="duedate_error" class="help-block hide">Please provide task due date.</div>								
							</div>
							</div>
							<div class="form-group col-md-6 clearfix">								
							<label class="col-sm-3 control-label no-padding-right" for="duedate">Task End Date <span class="red">*</span></label>
							<div class="col-sm-9">
									<input type="text" class="input-large" id="enddate"				name="endDateTimeString" title="End Date" validate="date">	
									<div id="enddate_error" class="help-block hide">Please provide task end date.</div>								
							</div>
							</div>
						</div>
							
							
							
							
							
							<div class="row">
							<div class="form-group col-md-6 clearfix">		
							<label class="col-sm-3 control-label no-padding-right" for="taskStatus">
								Task Status <span class="red">*</span>
							</label>
							<div class="col-sm-9">
								<select name="statusId" id="taskStatus" class="input-xxlarge" onchange=" getdates()">
									<option>Scheduled</option>
									<option>Work in Progress</option>
									<option>On Hold</option>
									<option>Cancelled</option>
									<option>Completed</option>

								</select>
							</div>
							</div>
							<div class="form-group col-md-6 clearfix">	
							<label class="col-sm-3 control-label no-padding-right" for="completionDate1">Task
								Completion Date</label>
							<div class="col-sm-9">
								<input type="text" class="input-xxlarge"
									id="completionDate1" name="completionDateTimeString"
									title="Completion Date" readonly>
								<div id="duedate_error" class="help-block hide">Please add Valid target</div>								
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
									class="input-xxlarge" title="Subject">
								<div id="subject_error" class="help-block hide">Please provide task subject.</div>								
							</div>
							</div>
						</div>
						</div>
					</div>
					</div>					
			
					<!-- Details End -->
					
					
					<!--Task Deatils Start -->
						<div class="widget-box widget-header">
							<h5 class="widget-title">Task Details</h5>
						</div>
					<div class="widget-box">
						<div class="widget-body">
          				<div class="widget-main clearfix">
          				 <div class="row">
          				  <div class="form-group col-md-12 clearfix">	
          				  
					 <div class="col-sm-12"  id="taskdescriptionDiv">
                      <div class="wysiwyg-editor" id="taskdescription"></div>
                      <input type="hidden" id="description" name="description">
                    </div>
						</div>
					</div>
					</div>
					</div>
					</div>
					
					<!--Task Deatils Ends -->
					
					<!--Attachments Starts -->
					
						<div class="panel-body">
							<div class="col-md-2 searchpadding padding_top">Add
								Attachments</div>
							<div class="col-md-10 searchpadding padding_top"
								style="margin-top:">
								<span id="taskAttachment1dailog"> 
								<input class="btn btn-primary btn-xs  createNewBtn westspace1" type="button" value="Choose File" name="Choose File" id="AttachButton1"
									onclick="openFileDailog('taskAttachment1')"> 
									<a id ="doc1link" ><lable id = "attache1"> No file	chosen</lable></a>
<!-- 									<lable id = "attache1"> No file	chosen</lable> -->
								</span><span id="taskAttachment1name"></span><div class="space-8"></div> <span
								
									id="taskAttachment2dailog"> <input class="btn btn-primary btn-xs  createNewBtn westspace1"
									type="button" value="Choose File" name="Choose File"  id="AttachButton2"
									onclick="openFileDailog('taskAttachment2')"> 
<!-- 									downloadAttachment('+attachment1DocId+')">'+doc1Name+'</a> -->
									<a  id ="doc2link" ><lable id = "attache2"> No file	chosen</lable></a>
									
									
								</span><span id="taskAttachment2name"></span><div class="space-8"></div> <span
									id="taskAttachment3dailog"> <input class="btn btn-primary btn-xs  createNewBtn westspace1"
									type="button" value="Choose File" name="Choose File" id="AttachButton3"
									onclick="openFileDailog('taskAttachment3')">
									<a id ="doc3link" ><lable id ="attache3"> No file	chosen</lable></a>
								</span><span id="taskAttachment3name"></span><br />
								
								
<!-- 								            <a href="#" onclick="addMoreAttachments()" id="addMoreLink" style="display: none">Add more</a> -->
								<input type="file" name="taskAttachment" id="taskAttachment1"
									style="height: 0px; width: 0px; overflow: hidden;display:none;"> <input type="file"
									name="taskAttachment" id="taskAttachment2"
									style="height: 0px; width: 0px; overflow: hidden;display:none;"> <input type="file"
									name="taskAttachment" id="taskAttachment3"
									style="height: 0px; width: 0px; overflow: hidden;display:none;">
							</div>
						</div>
						<input type="hidden" id="taskIdToSend" name="taskId">
					<div class="space-8"></div>					
					<div class="topmenu pull-right">
						<input class="btn-primary btn btn-xs" type="button" id="saveb"
							value="Save & New" name="Save & New" onclick="saveTask(0)" /> <input
							class="btn-primary btn btn-xs" type="button" id="closeb" value="Save & Close"
							name="Save & Close" onclick="saveTask(1)"> <a
							href="<%=request.getContextPath()%>/task/getTaskList.htm""> <input
							class="btn-primary btn btn-xs" type="button" value="Cancel" name="Cancel">
						</a>
					</div>
				</div>
				<!--Attachments End -->
			<!-- center end -->
			</div>			
		</form>
	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
	</section>
	<!-- Center part End -->

<jsp:include page="../common/footer.jsp" />
	<script>
		makeEditor('taskdescription');
		var userLabelValueList = new Array();
		var contactId = 0;
		var isAttachment = 0;
 $("#contactId").keydown(function() {
			contactId = 0;
		});
		// var fileCount=0;
		$(function() {
			showSelectedTab('taskLink');
			if ($('#taskMessage').val() == 'success') {
				showAlertMessage1("Message", "<br/>Task saved successfully.",
						"information", redirectFurther);
			} else if ($('#taskMessage').val() == 'fail') {
				showAlertMessage1(
						"Error",
						"The connection to the server has been lost. Please try again later.",
						"error", doNothing);
			} else if ($('#taskMessage').val() != '') {
				showAlertMessage1("Error", $('#taskMessage').val(), "error",
						doNothing);
			}

			$.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/common/getPicklistValues.htm?codeTypeIds=18,19,17,15',
						success : function(result) {
							$('#TastNotificationType').empty();
							$('#taskStatus').empty();
							$('#taskPriority').empty();
							$('#contactType').empty();
							$('#description').empty();
							$(result).each(
									function(i, obj) {
										var codeTypeId = obj.codeTypeId;
										var codeValue = obj.codeValue;
										var codevalueId = obj.codeValueId;
										if (codeTypeId == 17) {
											if(codevalueId<17007)
											$('#TastNotificationType').append(
													'<option value="'+codevalueId+'">'
															+ codeValue
															+ '</option>');
										} else if (codeTypeId == 19) {
											$('#taskStatus').append(
													'<option value="'+codevalueId+'">'
															+ codeValue
															+ '</option>');
										} else if (codeTypeId == 18) {
											$('#taskPriority').append(
													'<option value="'+codevalueId+'">'
															+ codeValue
															+ '</option>');
										} else if (codeTypeId == 15) {
											$('#contactType').append(
													'<option value="'+codevalueId+'">'
															+ codeValue
															+ '</option>');
										}
									});
					/* 		$('#duedate').datepicker({
								changeMonth : true,
								changeYear : true,
								minDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"
							});
							$('#enddate').datepicker({
								changeMonth : true,
								changeYear : true,
								minDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"
							});
							 */
							
							$('#completionDate').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"
							});

							$.ajax({
										type : "POST",
										url : $('#contextPath').val()
												+ '/common/getAllocatedTeamMembers.htm',
										success : function(result) {
											$(result)
													.each(
															function(i, obj) {
																var pstName = obj.pstName;
																var mstName = obj.mstName;
																var fpaName = obj.fpaName;
																var mst2Name = obj.mst2Name;
																
																var rmName = obj.rmName;
																var rmHeadName = obj.rmHeadName;
																

																var pstDepartmentName = obj.pstDepartmentName;
																var mstDepartmentName = obj.mstDepartmentName;
																var fpaDepartmentName = obj.fpaDepartmentName;
																var mst2DepartmentName = obj.mst2DepartmentName;
																
																var rmDepartmentName = obj.rmDepartmentName;
																var rmHeadDepartmentName = obj.rmHeadDepartmentName;

																var pstPartyId = obj.pstPartyId;
																var mstPartyId = obj.mstPartyId;
																var fpaPartyId = obj.fpaPartyId;
																var mst2PartyId = obj.mst2PartyId;
																
																var rmPartyId = obj.rmPartyId;
																var rmHeadPartyId = obj.rmHeadPartyId;

																$('#taskTo')
																		.empty();

																$('#taskTo')
																		.append(
																				'<option value="'
																						+ $(
																								'#partyIdHidden')
																								.val()
																						+ '">'
																						+ $(
																								'#partyName')
																								.val()
																						+ ' [Self]</option>');
																if (pstPartyId != 0) {
																	$('#taskTo')
																			.append(
																					'<option value="'+pstPartyId+'">'
																							+ pstName
																							+ ' ['
																							+ pstDepartmentName
																							+ ']</option>');
																}
																if (mstPartyId != 0) {
																	$('#taskTo')
																			.append(
																					'<option value="'+mstPartyId+'">'
																							+ mstName
																							+ ' ['
																							+ mstDepartmentName
																							+ ']</option>');
																}
																if (fpaPartyId != 0) {
																	$('#taskTo')
																			.append(
																					'<option value="'+fpaPartyId+'">'
																							+ fpaName
																							+ ' ['
																							+ fpaDepartmentName
																							+ ']</option>');
																}
																if (mst2PartyId != 0) {
																	$('#taskTo')
																			.append(
																					'<option value="'+mst2PartyId+'">'
																							+ mst2Name
																							+ ' ['
																							+ mst2DepartmentName
																							+ ']</option>');
																}
																if (rmPartyId != 0) {
																	$('#taskTo')
																			.append(
																					'<option value="'+rmPartyId+'">'
																							+ rmName
																							+ ' ['
																							+ rmDepartmentName
																							+ ']</option>');
																}
																if (rmHeadPartyId != 0) {
																	$('#taskTo')
																			.append(
																					'<option value="'+rmHeadPartyId+'">'
																							+ rmHeadName
																							+ ' ['
																							+ rmHeadDepartmentName
																							+ ']</option>');
																}
															});
											
											
											//Code For Home Index Task Allocation
											var dateVal=$('#dateValueRequest').val();
											if (dateVal == "") {
												
											} else {
												var duedateHome = dateVal;
												$('#duedate').val(duedateHome);
											}
											
											var taskId = $('#taskIdHidden')
													.val();
											if (taskId == 0) {

											} else {
												$.ajax({
															type : 'POST',
															url : $(
																	'#contextPath')
																	.val()
																	+ "/task/getTaskDetails.htm?taskId="
																	+ taskId,
															success : function(
																	result) {
																$(result)
																		.each(
																				function(
																						i,
																						obj) {
																					var status = obj.statusId;
																					var subject = obj.subject;
																					var priority = obj.priorityId;
																					var taskto = obj.ownerPartyId;
																					var categoryid = obj.categoryId;
																					var description = obj.description;
																					
																					var data=obj.endDateTime1;
																				
																					var duedate = obj.dueDateTime1;
																					var duedateString = obj.dueDateTimeString;
																					var compdateString = obj.completionDateTimeString
																					var contactType = obj.targetContactTypeId;												
																					var contactId = obj.targetPartyName;
																				
																					var Attchemnt1name = obj.attachment1DocumentName;
																					var Attchemnt2name = obj.attachment2DocumentName;
																					var Attchemnt3name = obj.attachment3DocumentName;
																					var Attchemnt1id = obj.attachment1DocumentID;
																					var Attchemnt2id = obj.attachment2DocumentID;
																					var Attchemnt3id = obj.attachment3DocumentID;
																					
																					var hideid= obj.targetPartyId;
																					$('#enddate').val(data);
																					//alert(duedate+"duedate");
																					$('#quickSearchHiddenpart').val(hideid);
																					var select = document.getElementById("taskTo");
																					        for(var i = 0;i < select.options.length;i++){
																					            if(select.options[i].value ==taskto  )
																					            {
																					                select.options[i].selected = true;
																					            }
																					        }																					
																					var assignto = $('#taskTo :selected').text();			
			
			if(assignto.contains('[RM]')|| assignto.contains('[BU RM]'))
				{
					$('#contactType').attr('disabled',true);
					$('#contactId').attr('disabled',true);
				}	
			else{
				$('#contactType').attr('disabled',false);
				$('#contactId').attr('disabled',false);
			}
																					$(
																							'#subject')
																							.val(
																									subject);
																					$(
																							'#taskStatus')
																							.val(
																									status);
																					$(
																							'#taskPriority')
																							.val(
																									priority);
																					$(
																							'#TastNotificationType')
																							.val(
																									categoryid);
																					$(
																							'#duedate')
																							.val(
																									duedate);
																					$(
																							'#completionDate1')
																							.val(
																									compdateString);
																					$("#taskdescription").html(description);
																					$(
																							'#contactType')
																							.val(
																									contactType);
																					$(
																							'#contactId')
																							.val(
																									contactId);

																		 			if(Attchemnt1name== ' ' || Attchemnt1name==null)
																					{
																		 				$('#attache1').html("No File Chosen");
																		 				$('#hideattachment1ID').val(0);
																					}  
																					 																		 			else
																		 				{
																						$('#attache1').html('');
																						$('#hideattachment1ID').val(Attchemnt1id);
																						$('#taskAttachment1name').html('<a onclick="downloadAttachment('+Attchemnt1id+')" >'+Attchemnt1name+'</a>'	+ ' <a onclick="removeattachment(\'taskAttachment1\')">Remove</a>');
																					
																		 				}
																					if(Attchemnt2name==' ' || Attchemnt2name==null)
																					{
																						$('#attache2').html("No File Chosen");
																						$('#hideattachment2ID').val(0);
																					}
																					else
																						{
																						
																						$('#attache2').html('');
																						$('#hideattachment2ID').val(Attchemnt2id);
																						$('#taskAttachment2name').html('<a onclick="downloadAttachment('+Attchemnt2id+')" >'+Attchemnt2name+'</a>'	+ ' <a onclick="removeattachment(\'taskAttachment2\')">Remove</a>');
																						
																						}
																					if(Attchemnt3name==' ' || Attchemnt3name==null)
																					{
																						$('#attache3').html("No File Chosen");
																						$('#hideattachment3ID').val(0);
																					}
																					else
																						{
																						$('#attache3').html('');
																						$('#hideattachment3ID').val(Attchemnt3id);
																						$('#taskAttachment3name').html('<a onclick="downloadAttachment('+Attchemnt3id+')" >'+Attchemnt3name+'</a>' 	+ ' <a onclick="removeattachment(\'taskAttachment3\')">Remove</a>'); 
																				
																						}
																					var assigntoz = $('#taskTo option:selected').text();
																					if(assigntoz!="" && assigntoz!=null && assigntoz !=undefined && assigntoz!="undefined"){
																					  $('#quickSearchHiddenpart1').val(assigntoz);
																					}
																				});

															}
														});

												document
														.getElementById("closeb").value = "Update";
												$("#saveb").addClass('disabled');
											} //end of else
										}
									});
						}
					});
		});

		$('#taskAttachment1')
				.change(
						function() {
							$('#taskAttachment1dailog').hide();
							$('#taskAttachment1name')
									.html(
											$('#taskAttachment1')
													.val()
													.substring(
															$(
																	'#taskAttachment1')
																	.val()
																	.lastIndexOf(
																			'\\') + 1)
													+ ' <a onclick="removeattachment(\'taskAttachment1\')">Remove</a>');
							$('#taskAttachment1name').show();
						});
		$('#taskAttachment2')
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
						});
		function openFileDailog(id) {
			isAttachment= 1 ;
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
				$('#attache3').html("No File Chosen");
				}
			else if(id == 'taskAttachment2')
				{
				$('#hideattachment2ID').val(0);
				$('#attache2').html("No File Chosen");
				}
			else if(id == 'taskAttachment1')
			{
			$('#hideattachment1ID').val(0);
			$('#attache1').html("No File Chosen");
			}
			
		}

		function data1() {
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()
						+ '/common/getPicklistValues.htm?codeTypeIds=15',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {
					$('#contactType').empty();

					$(result).each(
							function(i, obj) {
								var codeTypeId = obj.codeTypeId;
								var codeValue = obj.codeValue;
								var codevalueId = obj.codeValueId;
								if (codeTypeId == 15) {
									$('#contactType').append(
											'<option value="'+codevalueId+'">'
													+ codeValue + '</option>');
								}
							});

				}

			});

		}

		
		function disableAssignto()
		{
			var assignto = $('#taskTo :selected').text();
			
			data1();
			$('#contactId').val('');
			
			if(assignto.contains('[RM]') || assignto.contains('[BU RM]'))
				{
					//alert('1');
					$('#contactType').attr('disabled',true);
					$('#contactId').attr('disabled',true);
				}	
			else{
				$('#contactType').attr('disabled',false);
				$('#contactId').attr('disabled',false);
			}
		}
		function saveTask(isToClose) {
			localStorage.setItem('isToClose', isToClose);
			var isValidated = true;
			var taskId = $('#taskIdHidden').val();
			var startDt = $('#duedate').val()+' '+hours+':'+ minute +' '+mm1;;
			var endDt = $('#completionDate').val() ;
			var contact = $('#quickSearchHiddenpart').val();
			var description1 = $('textarea#description').val();
			var taskdescription = $('#taskdescriptionDiv').find('.wysiwyg-editor').text();
			$('#description').val(taskdescription);
			if ($.trim($('#subject').val()) == '') 
			{
				$('#subject').css('border-color','#d16e6c');
				$('#subject_error').removeClass('hide');
				isValidated = false;
				
			}
			else{				
				$('#subject_error').addClass('hide');				
				$('#subject').css('border-color','#d5d5d5');
			}
			
			if (startDt == '' || startDt == 'N/A') 
			{				
				$('#duedate').css('border-color','#d16e6c');
				$('#duedate_error').removeClass('hide');			
				isValidated = false;				
			}
			else{				
				$('#duedate_error').addClass('hide');		
				$('#duedate').css('border-color','#d5d5d5');
			}
			
			var assignto = $('#taskTo :selected').text();
			
			if(assignto.contains('[RM]') || assignto.contains('[BU RM]'))
				{
					
				}	
			else{
					
			if(taskId==0)
	        {
			 /* if (contact == '' || $('#quickSearchHiddenpart').val() == '0')   
			 {
					$('#contactId').css('border-color','#d16e6c');
					$('#contactId_error').removeClass('hide');	
					isValidated = false;					
				}
				else{
					$('#contactId_error').addClass('hide');		
					$('#contactId').css('border-color','#d5d5d5');
				}
			 */
			}
			else{
				/* if (contact == '' || $('#quickSearchHiddenpart').val() == '0' || $('#quickSearchHiddenpart').val() == 0) 
				{
					$('#contactId').css('border-color','#d16e6c');
					$('#contactId_error').removeClass('hide');	
					isValidated = false;
				}
				else{
					$('#contactId_error').addClass('hide');		
					$('#contactId').css('border-color','#d5d5d5');
				} */
			}
			if(taskId!=0){
				/* if(((contact == '' || $('#quickSearchHiddenpart').val() == '0') &&  taskId!=0))
				{
					$('#contactId').css('border-color','#d16e6c');
					$('#contactId_error').removeClass('hide');	
					isValidated = false;
				}
				else{
					$('#contactId_error').addClass('hide');		
					$('#contactId').css('border-color','#d5d5d5');
				} */
			}
			}
			if( isValidated==false){
				showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
			}
			
	var res=checkSelectedUserInHierarchy();
			if(res==true)
			{
			if (isValidated == true) {
				$('#contactId').val($('#quickSearchHiddenpart').val());
				
				
             /* ------------------------------  */
				var statusname = $('#taskStatus :selected').text();
			
				$('#statusNameid').val(statusname);
				
				var data11=$('#namepartner').val();
					if(data11 == "" || data11 == null)
						{
						data11 = $('#ownerPartyId :selected').text();
						}
					
				$('#quickSearchHiddenpart').val(data11);
				
				/* 	------------------------------  */
				var assigntoz = $('#taskTo option:selected').text();
				 if(assigntoz!="" && assigntoz!=null && assigntoz !=undefined && assigntoz!="undefined"){
				  $('#quickSearchHiddenpart1').val(assigntoz);
				 }
				if(isAttachment == 0)
					{	
							$.ajax({
							type : "POST",
							url : $('#contextPath').val()+'/task/saveTask.htm?taskId='+taskId,
							data:$('#addTaskForm').serialize(),
							success : function(result) {
								result = JSON.parse(result);
								if(result == "success"){
									showAlertMessage("Success", "<br/> Task saved successfully.", "information", redirectFurther)
								}
							}
						});
					}
				else
					{
				$('#taskIdToSend').val(taskId);
				$('#addTaskForm').ajaxForm(
						{
							success : function(msg) {
								var result = msg;

								result = JSON.parse(result);
								if (result == "success") {
									showAlertMessage("Success",
											"<br/>Data saved successfully.",
											"information", redirectFurther);
								} else if (result == 'success'
										&& isImageSelected == 1) {
									$('#photoImage').attr(
											'src',
											$('#contextPath').val() + '/'
													+ msg[1]);
									showAlertMessage("Success",
											"<br/>Data saved successfully.",
											"confirmation", doNothing);
									$('#photochoose').hide();
									$('#photoFile').val('');
									$('#photoFileName').html('');
								}
							},
							error : function(msg) {
							},
							onComplete : function(data) {
							}
						}).submit();
			}
			}
}
		}
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
			        dd='0'+dd
			    } 
			    if(mm<10){
			        mm='0'+mm
			    } 
			    var today = dd+'/'+mm+'/'+yyyy;
			   $('#completionDate1').val(today);
				}
			else
				{
				$('#completionDate1').val('');

				}
		
		}	
		
		//function to fetch list of users for task
		function getContactList() {
			userLabelValueList = new Array();
			removeCssStyles('contactId');
			recordType = $('#contactType').val();
			loggedInUserPartyId = '${sessionScope.userSession.partyId}';
			$('#contactId').val('');
			contactId = 0;
			$
					.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/common/getUserList.htm?loggedInUserPartyId='+ loggedInUserPartyId + '&recordType='+ recordType,
						success : function(result) {
							result = JSON.parse(result);
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.partyId;
								object.label = obj.name;
								userLabelValueList.push(object);
							});
							$(".contactList")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
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
													response($.ui.autocomplete
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
													$('#quickSearchHiddenpart').val(ui.item.value)
													
													
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

		function redirectFurther() {
			var isToClose = localStorage.getItem('isToClose');
			localStorage.setItem('isToClose', '0');
			if (isToClose == '1') {
				window.location.href = $('#contextPath').val()
						+ '/task/getTaskList.htm';
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

	<%
		int taskId = 0;
		try {
			taskId = Integer.parseInt(request.getParameter("taskId")
					.toString());
			if (taskId != 0) {
	%>
	<input type="hidden" id="taskIdHidden" name="taskId"
		value="<%=taskId%>">
	<%
		}
		} catch (Exception e) {
	%>
	<input type="hidden" id="taskIdHidden" value="0">
	<%
		}
	%>
	
<%
String taskDueDate=""; 
try{ 
	taskDueDate=request.getParameter("datevalue").toString(); 

	%> 
	<input type="hidden" id="dateValueRequest" name="datevalue" value="<%=taskDueDate%>">
	<%
  }catch(Exception e){ 
	%> 	
	<input type="hidden" id="dateValueRequest" value="">
	<%
  } 
 %> 

</body>
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

var today1 =dd+'/'+mm+'/'+yyyy+' '+hours+':'+ minute+ ' '+mm1;

 
$('#duedate').val(today);
$('#enddate').val(today1);  
/* $('#enddate').focus(); */
/* $('#enddate').datetimepicker().next().on(ace.click_event, function()
		{

	$(this).prev().focus();
});
$('#duedate').datetimepicker().next().on(ace.click_event, function()
		{
	
	 	    
	 $(this).prev().focus();
});
 */

/* var checkin = $('#duedate').datetimepicker({
    onRender: function(date) {
      return date.valueOf() < now.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    if (ev.date.valueOf() > checkout.date.valueOf()) {
      var newDate = new Date(ev.date)
      newDate.setDate(newDate.getDate() + 1);
      checkout.setValue(newDate);
    }
    checkin.hide();
    $('#enddate')[0].focus();
  }).data('datepicker');
  var checkout = $('#enddate').datetimepicker({
    onRender: function(date) {
      return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
    }
  }).on('changeDate', function(ev) {
    checkout.hide();
  }).data('datetimepicker');
  
	
   */



		//$('#duedate').datetimepicker({value:today,step:05});
		//$('#enddate').datetimepicker({value:today1,step:05});

		
		/* var currentDate = new Date();  
		$("#enddate").datepicker("setDate",currentDate);
		 */
/* try{
	$('#enddate').datetimepicker
	({
		dayOfWeekStart : 1,
	lang:'en',
	startDate:	today1,
	minDate: 0,
	 
	format:'hh:mm tt',

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
	} */
/* 
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
	}
 */
 $(document).ready(function(){
	    $("#duedate").datetimepicker({
	        minDate : '0',
	        buttonImageOnly: true,
	        dateFormat: 'dd/mm/yy',
	        constrainInput: true
	        
	        /* ,onSelect: function(selected) 
	        {
	        	 $("#enddate").datepicker("option","minDate", selected);
		           var hours=output.getHours();
		           var minute=output.getMinutes();
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
		            
		            var today =  $("#duedate").val()+' '+hours+':'+ minute +' '+mm1;
		             

		            minute=output.getMinutes()+1;

		            if ( minute==0	||minute==1	||minute==2	||minute==3	||minute==4	||minute==5	||minute==6	||minute==7	||minute==8	||minute==9)
		            	{
		            	minute='0'+minute;
		            	}


		            var today1 =$("#enddate	").val()+' '+hours+':'+ minute+' '+mm1;

		            $('#enddate').val(today1);
		            $('#duedate').val(today); 
		            
	         } */
	    });

	    $(".ui-datepicker-trigger").mouseover(function() {
	        $(this).css('cursor', 'pointer');
	    });
	});
 $(document).ready(function(){
	    $("#enddate").datetimepicker({
	        minDate : '0',

	        dateFormat: 'dd/mm/yy',
	        constrainInput: true,
	        onSelect: function(selected) 
	        {
	            $("#enddate").datetimepicker("option","minDate", selected);
	            
	             /*  var hours=output.getHours();
	              var minute=output.getMinutes();
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
	           // var today =  $("#duedate").val()+' '+hours+':'+ minute +' '+mm1;
	             

	            minute=output.getMinutes()+1;

	            if ( minute==0	||minute==1	||minute==2	||minute==3	||minute==4	||minute==5	||minute==6	||minute==7	||minute==8	||minute==9)
	            	{
	            	minute='0'+minute;
	            	}


	            var today1 =$("#enddate").val()+' '+hours+':'+ minute+' '+mm1;

	            $('#enddate').val(today1);
	           // $('#duedate').val(today);  */
	            
	        }
	    });

	    $(".ui-datepicker-trigger").mouseover(function(){
	        $(this).css('cursor', 'pointer');
	    });
	});
 
</script>
 <script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
<style type="text/css">
              .ace-file-input .ace-file-container {
					display: none;
					position: none;
					top: 0;
					left: 0;
					right: 0;
					height: 30px;
					background-color: #fff;
					border: 1px solid #d5d5d5;
					cursor: pointer;
					-webkit-box-shadow: none;
					box-shadow: none;
					-webkit-transition: all .15s;
					-o-transition: all .15s;
					transition: all .15s
  }
  .ace-file-input .ace-file-container.selected+.remove {
	display: none
	}

</style>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
</html>