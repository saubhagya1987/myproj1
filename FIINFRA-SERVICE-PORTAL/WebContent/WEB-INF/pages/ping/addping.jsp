<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Add/Edit ping</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ZeroClipboard.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">

 <script>
	 </script>
</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
 <!-- Center part start -->
 <section>
		<div class="page-header">
			<h1>Add/Edit ping</h1>
		</div>
		
		<form id="pingForm" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/ping/savePing.htm">
		<div class="widget-box" style="margin-top:10px;">
			<div class="widget-body">
				<div class="widget-main clearfix">

               <div class="row">
				<div class="form-group col-md-12 clearfix">
				 <label class="col-sm-1 control-label no-padding-right" for="email">Ping Name<span class="red">*</span></label>
						<div class="col-sm-8">
							<!-- <div class="clearfix"> -->
				           		<input type="text" class="col-xs-12 col-sm-6" placeholder="Ping name"  id="pingName" name="name"  >
												<!-- <label class="col-sm-3 control-label no-padding-right"
												for="createdOn">Created on</label><span id="createdOn" class="input-xxlarge" style="border: none;">&nbsp;</span> -->
							<!-- </div> -->
						</div>
				</div>
				</div>
				
				<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-sm-1 control-label no-padding-right"
								for="purpose">Purpose of this ping <span class="red">*</span></label>
							<div class="col-sm-8">
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Purpose of this ping"  id="purpose" name="description"  >
									
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
				
				
					<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-sm-1 control-label no-padding-right"
								for="deliveryChannel">Delivery Channel<span class="red">*</span></label>
							<div class="col-sm-8">
								<select name="deliveryChannelID" id="deliveryChannel" class="input-xxlarge"  onchange="enableTf1();">
								</select>
								<!-- <div id="deliveryChannel_error" class="help-block hide">Please
									provide a valid delivery channel.</div> -->
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
					
					 <div id="email">
						<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-sm-1 control-label no-padding-right" for="subject">Subject <span class="red">*</span></label>
							<div class="col-sm-8">
						<input type="text" class="col-xs-12 col-sm-6" placeholder="Subject"  id="subject" name="subject"  >
							
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
					
						<div class="row">
						
						<div class="form-group col-md-12 clearfix">
							<label class="col-sm-1 control-label no-padding-right" for="emailBody">Body <span class="red">*</span></label>
							<div class="col-sm-8" id="emailBodyDiv">
							<!--  <textarea name="emailBody" id="emailBody" style="width: 100%; height: 120px;" rows="10" class="editor">
				            </textarea> -->
				            <div class="widget-box">
				             <div class="clearfix">
				            <div class="wysiwyg-editor" name="emailBody" id="emailBody" style="width: 100%; height: 120px;" rows="10"></div>
				            </div>
						  </div>
							</div>
							<div class="col-xs-8 col-sm-3" id="tagList">
							<div class="widget-box">
							<div class="clearfix" >
							<label>Tag List</label>
								<a class="pull-right">
									<div type="button" class="btn btn-primary btn-xs  createNewBtn"
										onclick="appendTag('email')" title="Append to Body"
										alt="Append to Body">
										<i class="fa fa-plus"></i>Append
									</div>

									<div type="button" class="btn btn-primary btn-xs  createNewBtn"
										id="copy" name="Copy" onclick="closeTagDetailList('email')"
										title="Copy to clipboard" alt="Copy to clipboard">
										<i class="fa fa-plus"></i>Copy
									</div>
								</a>
								</div>
								</div>
							   </div>
						</div>
                        
								<div class="modal fade" id="popUpAlertEmailpopup" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">Opportunity or Client</h4>
											</div>
											<div class="modal-body">

												<div class="none" onClick="closeTagDetailList('email')">
													<ul id="tagDetailList"
														style="width: 200px; margin-top: 26px;">

													</ul>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>

					<div class="row">
						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-2 control-label no-padding-right"
								for="subject">CC</label>
							<div class="col-sm-9">
								<!-- <input type="text" class="input-xxlarge" title="CC" id="cc"
									name="cc"> -->
									<input type="text" class="col-xs-12 col-sm-12" title="CC" id="cc" name="cc">
									
							</div>
						</div>
						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-3 control-label no-padding-right"
								for="subject">BCC</label>
							<div class="col-sm-9">
								<!--  <input type="text" class="input-xxlarge" title="BCC" id="bcc" name="bcc"> -->
								 <input type="text" class="col-xs-12 col-sm-12" title="BCC" id="bcc" name="bcc">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-2 control-label no-padding-right"
								for="attachmentDivToClone">Add Attachments</label>
							<div class="col-sm-9" id="attachmentDivToClone">
								<span id="templateAttachment1Span"> <input type="file"
									name="templateAttachment" id="templateAttachment1"
									style="margin-bottom: 5px;"></span><span
									id="templateAttachment1Name"></span> <span
									id="templateAttachment2Span"> <input type="file"
									name="templateAttachment" id="templateAttachment2"
									style="margin-bottom: 5px;"></span><span
									id="templateAttachment2Name"></span> <span
									id="templateAttachment3Span"><input type="file"
									name="templateAttachment" id="templateAttachment3"
									style="margin-bottom: 5px;"></span><span
									id="templateAttachment3Name"></span>
							</div>
						</div>
						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-3 control-label no-padding-right"
								for="useSignature">Use Signature</label>
							<div class="col-sm-9">
								 <select name="useSignatureID" id="useSignature" class="input-xxlarge"></select>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-sm-1 control-label no-padding-right"
								for="disclaimerDiv">Disclaimer</label>
							<div class="col-sm-8" id="disclaimerDiv">
							<div class="widget-box">
                              <div class="wysiwyg-editor" name="disclaimer" id="disclaimer" style="width: 100%;" rows="10">
                                   <c:choose>
										<c:when test="${sessionScope.userSession.disclaimerText=='' || sessionScope.userSession.disclaimerText=='<br>'}">If you want to unsubscribe then please email to {!Partner.Email}</c:when>
										<c:otherwise>${sessionScope.userSession.disclaimerText}</c:otherwise>
									</c:choose>
                              </div>
							</div>
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
				
					<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-sm-1 control-label no-padding-right"
								for="dndTemplateDiv">DND Template</label>
							<div class="col-sm-8" id="dndTemplateDiv">
							<div class="widget-box">
                                 <div class="wysiwyg-editor" name="dndTemplate"   id="dndTemplate" style="width: 100%;" rows="10" >${sessionScope.userSession.dndText}</div>
							</div>
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
                 </div>
<!-- SMS Start-->
               <div id="sms" class="none">
					<div class="row">
						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-2 control-label no-padding-right"
								for="useSignatureSMS">User Signature</label>
							<div class="col-sm-9">
								<select id="useSignatureSMS" class="input-xxlarge"></select>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-sm-1 control-label no-padding-right"
								for="smsBody">Body<span class="red">*</span></label>
							<div class="col-sm-8">
								<textarea class="input-xxlarge" rows="11" id="smsBody"
									name="smsBody" style="width:100%"></textarea>
									<!-- <div id="smsBody_error" class="help-block hide">Please provide a valid body.</div> -->
							</div>
							
							<div class="col-sm-3" id="tagListSMS">
							<label>Tag List</label>
								<a class="pull-right">
									<div type="button" class="btn btn-primary btn-xs  createNewBtn"
										onclick="appendTag('sms')" title="Append to Body"
										alt="Append to Body">
										<i class="fa fa-plus"></i>Append
									</div>

									<div type="button" class="btn btn-primary btn-xs  createNewBtn"
										id="copy" name="Copy" onclick="closeTagDetailList('sms')"
										title="Copy to clipboard" alt="Copy to clipboard">
										<i class="fa fa-plus"></i>Copy
									</div>
								</a>
							</div>
						</div>
						
				            <div class="modal fade" id="popUpAlertSMSpopup" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Opportunity or Client</h4>
										</div>
										<div class="modal-body">

											<div  onClick="closeTagDetailList('sms')" >
												<ul id="tagDetailListSMS"
													style="width: 200px; margin-top: 26px;">
													<li><input id="15Large" value="15Large"
														type="checkbox"> Name</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Email</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Contact</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Address</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Send to</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Mail to</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Address</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Send to</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Mail to</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
					   </div>
			    	</div>
					<!-- SMS End-->
					<div>
						<h5 class="widget-title"><span id="selectedTagListMessage">Select the tags to identify  Potential Recipients (target audience for this ping) <span class="red">*</span></span></h5>
					</div>

					<div class="row">
						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-3 control-label no-padding-right">&nbsp;</label>
							<div class="col-sm-9">
							<div id="selectedTagList"></div>
							</div>
						</div>

						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-3 control-label no-padding-right">&nbsp;</label>
							<div class="col-sm-9">
								<div class="panel-body">
									
									<div class="col-md-6">
										<select class="input-xxlarge pull-left" id="availableTags"
											onchange="populateTagValue()">
										</select> <br> <br> <br> <select
											class="input-xxlarge pull-left" id="tagValue">
											<option value="0">--Select--</option>
										</select>
									</div>
									<div class="col-md-6" style="margin-top: -2px;">
										<div type="button"
											class="btn btn-primary btn-xs  createNewBtn" id="AddToList"
											onclick="addSelectedTag()" title="Add to List"
											alt="Add to List">
											<i class="fa fa-plus"></i>Add to List
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6 clearfix">
							<label class="col-sm-3 control-label no-padding-right">&nbsp;</label>
							<div class="col-sm-9" id="dndTemplateDiv"></div>
						</div>

						<div class="form-group col-md-6 clearfix">
							 <label class="col-sm-3 control-label no-padding-right"></label> 
					<!-- 	<div class="col-sm-6">  -->
								<div class="clearfix">
								<button  class="btn btn-sm btn-primary" onclick="savePing(1)"><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button  class="btn btn-sm btn-primary" onclick="savePing(0)"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								<a href="<%=request.getContextPath()%>/ping/getPings.htm"><input class="btn btn-sm btn-danger" type="button" value="Cancel" name="Save" ></a> 
								</div>
                   			 </div> 
						</div>
						
					</div>
				</div>
			</div>
	<input type="hidden" id="notifyTemplateXML" name="notifyTemplateXML">
	<input type="hidden" id="notifyTemplateID" name="notifyTemplateID" value="0">
	<input type="hidden" id="tagListToSend" name="tagList">
	<input type="hidden" id="isAddDisclaimerText" name="AddDisclaimerText" value="false">
	<input type="hidden" id="isAddDNDText" name="AddDNDText" value="false">
  	
  	<input type="hidden" id="attachment1DocumentID" name="attachment1DocumentID" value="0">
  	<input type="hidden" id="attachment2DocumentID" name="attachment2DocumentID" value="0">
  	<input type="hidden" id="attachment3DocumentID" name="attachment3DocumentID" value="0">
    </form>
       	
</section>           	
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />

<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
<script>
var isAttachmentSeleted=0;
$('input[type="file"]').bind('change', function(){isAttachmentSeleted=1;});

$("#sms, #sendsms").hide();	
$("#email, #sendemail").show();

var standardTag='';
var tagList = new Array();
ZeroClipboard.setMoviePath('<%=request.getContextPath()%>/js/ZeroClipboard.swf');
//create client
var clip = new ZeroClipboard.Client();
clip.addEventListener('mousedown',function() {
	
				clip.setText($('#stdtag').val());
});
clip.glue('copy');
Array.prototype.contains = function(obj) {
	var i = this.length;
	while (i--) {
		if (this[i] == obj) {
			return true;
		}
	}
	return false;
}


$(document).ready(function() {
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/getPicklistValues.htm?codeTypeIds=28,29,32,201',
		success : function(result) {
			$('#notificationTarget,#useSignature,#useSignatureSMS,#deliveryChannel,#source').empty();
			$('#notificationTarget,#useSignature,#useSignatureSMS,#deliveryChannel,#source').append('<option value="">--Select--</option>');
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				 if(codeTypeId==28){
					 if(codevalueId<28003){
						$('#notificationTarget').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
						$('#tagList').append('<a class="list-group-item" onclick="showTagDetailsList('+codevalueId+',\'email\',\''+codeValue+'\')">'+codeValue+'</a>');
						$('#tagListSMS').append('<a class="list-group-item" onclick="showTagDetailsList('+codevalueId+',\'sms\',\''+codeValue+'\')">'+codeValue+'</a>');
					}
				 } else if(codeTypeId==29){
					 
					 if(codevalueId!=29001){
					 $('#useSignature').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#useSignatureSMS').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					 }
				}else if(codeTypeId==32){
					$('#deliveryChannel').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					
				}else if(codeTypeId==201){
					$('#source').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}		
				 
			});
			
	$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/ping/getTagListAddPing.htm',
			success : function(result) {
				$('#availableTags').empty();
				$('#availableTags').append('<option value="0">--Select--</option>');
				$(result).each(function(i,obj) {
					var notifyTagId=obj.notifyTagId;
					var notifyTagName=obj.notifyTagName;
					var notifyTagDescription=obj.notifyTagDescription;
					var mappedCodeTypeId=obj.mappedCodeTypeId;
					$('#availableTags').append('<option value="'+notifyTagId+'">'+notifyTagName+'</option>');
					});
				}
			});
			
		var notifyTemplateIdHidden=$('#notifyTemplateIdHidden').val();
	      if(notifyTemplateIdHidden!=0)
			getPingDetails(notifyTemplateIdHidden);
		else 
			{
			makeEditor('emailBody');
			makeEditor('disclaimer');
			makeEditor('dndTemplate');
			 fileUpload('templateAttachment1,#templateAttachment2,#templateAttachment3');
			}
		//	nicEditors.allTextAreas(); 
		}
	});



	});





function enableTf1(){
/* $('#street1').css('background-color','rgb(255, 255, 255)'); */
 if($('#deliveryChannel').val()==32001){
	$("#sms, #sendsms").hide();	
	$("#email, #sendemail").show();
}else{
	$("#sms,  #sendsms").show();	
	$("#email,  #sendemail").hide();
 } 
}


function showTagDetailsList(notifyTarget,section,codevalue){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/getStandardTags.htm?notifyTarget='+notifyTarget,
		success : function(result) {
			if(section=='email'){
				tagListEmailpopup();
				$('#tagDetailList').empty();
				$('#tagDetailList').append('<li>'+codevalue+'</li>');
			}else{
				tagListSMSpopup();
				$('#tagDetailListSMS').empty();
				$('#tagDetailListSMS').append('<li>'+codevalue+'</li>')
			}
			
			$(result).each(function(i,obj) {
				var mappedValue3=obj.mappedValue3;
				var codeValue=obj.codeValue;
				if(section=='email'){
					$('#tagDetailList').append('<li style="height: 34px;"><input type="radio" name="tagradio" id="'+codeValue+'" onmousedown="copyText(id)"> '+mappedValue3+'  </li>');
				}else{
					$('#tagDetailListSMS').append('<li style="height: 34px;"><input type="radio" name="tagradio" id="'+codeValue+'" onmousedown="copyText(id)"> '+mappedValue3+' </li> ');
				}
				
			});
			if(section=='email'){
				$('#tagDetailList').parent().show();
			}else{
				$('#tagDetailListSMS').parent().show();
			}
		}
	});
}


function copyText(id){
	standardTag=id;
	$('#stdtag').val(id);
}
function closeTagDetailList(section){
	if(section=='email'){
		 $('#tagDetailList').parent().hide(); 
		$('#popUpAlertEmailpopup').modal('hide') ;
	}else{
		$('#tagDetailListSMS').parent().hide();
		$('#popUpAlertSMSpopup').modal('hide') ;
	}
}

function addSelectedTag(){
	tagList.push($('#availableTags').val());
	
	$('#selectedTagList').append('<div class="alertn pull-left" onclick="removeTag('+$('#availableTags').val()+',this)">'+$('#availableTags option:selected').text()+'='+$('#tagValue option:selected').text()+'<input class="btn btn-primary btn-xs" id="'+$('#availableTags').val()+'-'+$('#tagValue').val()+'" data-dismiss="alert" value="-" type="button"></input></div>');
	
}


function savePing(isNewPing){
	//alert('HIIEEEEEEEEEEE');
	var deliveryCh=$('#deliveryChannel').val();	
	if(deliveryCh!=32001){
		var validator1=$('#pingForm').validate({			
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			 icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
			},
			rules: {
				name: {
					required: true
				},
				description: {
					required: true
				},			
				smsBody:{
					required:true
					
				},
				deliveryChannelID:{
					required:true
				}
				
			},
			messages: {
				
			},
			   
			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},

			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},

			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},

	 

			submitHandler: function (form) {
				//alert('Hello');
				if(validator1.form()){ // validation perform
				//	alert('innnnnnnnnnnn');
					
					savePing2(isNewPing);
					
				}
			},
			invalidHandler: function (form) {
				
			}
		});
		}else{
			
			var validator2=$('#pingForm').validate({
				
				errorElement: 'div',
				errorClass: 'help-block',
				focusInvalid: false,
				ignore: "",
				 icon: {
				valid: 'glyphicon glyphicon-ok',
				invalid: 'glyphicon glyphicon-remove',
				validating: 'glyphicon glyphicon-refresh'
				},
							
				rules: {
					name: {
						required: true
					},
					description: {
						required: true
					},
					subject: {
						required: true
					},
					emailBody:{
						required:true
					},
					deliveryChannelID:{
						required:true
					}
					/* cc:{
						required: true,
						email:true
					},
					bcc:{
						required: true,
						email:true
					} */
										
				},

				messages: {
					email: {
						required: "Please provide a valid email.",
						email: "Please provide a valid email."
					},									
				},
				   
				highlight: function (e) {
					$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
				},

				success: function (e) {
					$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
					$(e).remove();
				},

				errorPlacement: function (error, element) {
					if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
						var controls = element.closest('div[class*="col-"]');
						if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
						else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
					}
					else if(element.is('.select2')) {
						error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
					}
					else if(element.is('.chosen-select')) {
						error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
					}
					else error.insertAfter(element.parent());
				},

		 

				submitHandler: function (form) {
					//alert('Hello');
					if(validator2.form()){ // validation perform
					//	alert('innnnnnnnnnnn');
						
						savePing2(isNewPing);
						
					}
				},
				invalidHandler: function (form) {
					
				}
			});
			
			
		}
	
}


function savePing2(isNewPing){
	try{	

	
	var subject=$('#subject').val();
	var emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').text();
	var diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').text();
	var dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').text();
	var smsBody=$('#smsBody').val();
	console.log('1111111111111111');
	
	console.log('2222222222');
		console.log('----2----');
	
		
		 emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').html();
		 console.log('----3----');
		 diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').html();
		 dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').html();		
		if($('#deliveryChannel').val()==32002){
			$('#useSignature').val($('#useSignatureSMS').val())
		}
		
		var notifyTemplateXML='<root>';
		if($('#deliveryChannel').val()!=32002){
			notifyTemplateXML+='<from>{!Partner.Name}</from>';
			notifyTemplateXML+='<fromId>{!Partner.Email}</fromId>';
			notifyTemplateXML+='<to>{!Contact.Email}</to>';
			notifyTemplateXML+='<cc><![CDATA['+$('#cc').val()+']]></cc>';
			notifyTemplateXML+='<bcc><![CDATA['+$('#bcc').val()+']]></bcc>';
			notifyTemplateXML+='<phone></phone>';
			notifyTemplateXML+='<subject><![CDATA['+$('#subject').val()+']]></subject>';
			notifyTemplateXML+='<body><![CDATA['+$.trim(emailBody)+']]></body>';
			notifyTemplateXML+='<replyTo>{!Partner.Email}</replyTo>';
			notifyTemplateXML+='<disclaimerText><![CDATA['+$.trim(diclaimer)+']]></disclaimerText>';
			notifyTemplateXML+='<dndText><![CDATA['+$.trim(dnd)+']]></dndText>';
		}else{
			notifyTemplateXML+='<from></from>';
			notifyTemplateXML+='<fromId></fromId>';
			notifyTemplateXML+='<to></to>';
			notifyTemplateXML+='<cc></cc>';
			notifyTemplateXML+='<bcc></bcc>';
			notifyTemplateXML+='<phone>{!Client.Phone}</phone>';
			notifyTemplateXML+='<subject></subject>';
			notifyTemplateXML+='<body><![CDATA['+$.trim($('#smsBody').val())+']]></body>';
			notifyTemplateXML+='<replyTo></replyTo>';
			notifyTemplateXML+='<disclaimerText></disclaimerText>';
			notifyTemplateXML+='<dndText></dndText>';
		}
		
		notifyTemplateXML+='</root>';
		
		if($.trim(diclaimer)!='')
		$('#isAddDisclaimerText').val(true);
		else
		$('#isAddDisclaimerText').val(false);
		if($.trim(dnd)!='')
		$('#isAddDNDText').val(true);
		else
		$('#isAddDNDText').val(false);
		
		console.log('notifyTemplateXML:---'+notifyTemplateXML);
		var tagList='<Root>';
		$('#selectedTagList input').each(function(i,obj) {
			var id=$(obj).attr('id');
			tagList+='<Tag>';
			tagList+='<TagId>'+id.substring(0,id.indexOf('-'))+'</TagId>';
			tagList+='<ValueId>'+id.substring(id.indexOf('-')+1)+'</ValueId>';
			tagList+='</Tag>';
		});
		tagList+='</Root>'
		$('#notifyTemplateXML').val(notifyTemplateXML);
		$('#tagListToSend').val(tagList);
		if(isAttachmentSeleted==1){
		 $jq_1_9_2('#pingForm').ajaxForm({
	            success: function(msg) {
	            	var recordCount=msg[0];
	            	var isPingNameExist=msg[1];
	            	if(recordCount!='0'){
	            			if(isNewPing!=1){
	            				 bootbox.dialog({
										message: "<span class='bigger-110'>Ping saved successfully</span>",
										buttons: 			
										{
											"click" :
											{
												"label" : "OK!",
												"className" : "btn-sm btn-primary",
												"callback": function() {
													window.location=$('#contextPath').val()+"/ping/getPings.htm";
													
													 document.getElementById("pingForm").reset();	
												}
											}
										}
								});
	            			}else{
	            				
	            				 bootbox.dialog({
										message: "<span class='bigger-110'>Ping saved successfully</span>",
										buttons: 			
										{
											"click" :
											{
												"label" : "OK!",
												"className" : "btn-sm btn-primary",
												"callback": function() {
													window.location=$('#contextPath').val()+"/ping/addPing.htm";
													
													 document.getElementById("pingForm").reset();	
												}
											}
										}
								});
	            			}
		            		
	            	}else if(isPingNameExist=='1'){
	            		
	            		 bootbox.dialog({
								message: "<span class='bigger-110'>This Ping name is already exist in system. Please enter different ping name.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											window.location=$('#contextPath').val()+"/ping/getPings.htm";
												
										}
									}
								}
						});
	            	}
	            },
	            error: function(msg) {
	            }, onComplete: function (data) {
	            } 
	        }).submit();
		}else{
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/ping/savePing.htm',
				data: $('#pingForm').serialize(),
				success : function(result) {
					var recordCount=result[0];
	            	var isPingNameExist=result[1];
	            	if(recordCount!='0'){
	            		if(isNewPing!=1){
            				
            				bootbox.dialog({
								message: "<span class='bigger-110'>Ping saved successfully.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											window.location=$('#contextPath').val()+"/ping/getPings.htm";
												
										}
									}
								}
						});
            			}else{
            				
            				bootbox.dialog({
								message: "<span class='bigger-110'>Ping saved successfully..</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											window.location=$('#contextPath').val()+"/ping/addPing.htm";
												
										}
									}
								}
						});
            			}
	            	}else if(isPingNameExist=='1'){
	            		
	            		 bootbox.dialog({
								message: "<span class='bigger-110'>This Ping name is already exist in system. Please enter different ping name.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											window.location=$('#contextPath').val()+"/ping/getPings.htm";
												
										}
									}
								}
						});
	            	}
				}
			});
		}
	/* } */
/* 	} */
	}catch(e){
		alert(e)
	}
}

function populateTagValue(){
	if($('#availableTags').val()!='0'){
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/ping/getTagValueList.htm?notifyTagId='+$('#availableTags').val(),
			success : function(result) {
				$('#tagValue').empty();
				$('#tagValue').append('<option value="0">--Select--</option>');
				$(result).each(function(i,obj) {
					var codeValue=obj.codeValue;
					var codevalueId=obj.codeValueId;
					$('#tagValue').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				});
			}
		});
	}
}

function getPingDetails(notifyTemplateIdHidden){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/getPingDetails.htm?notifyTemplateId='+notifyTemplateIdHidden,
		success : function(result) {
			var notifyTemplateID=result.notifyTemplateID;
			var partyID=result.partyID;
			var notifyTypeID=result.notifyTypeID;
			var name=result.name;
			var description=result.description;
			var notifyTargetID=result.notifyTargetID;
			var deliveryChannelID=result.deliveryChannelID;
			var useSignatureID=result.useSignatureID;
			var notifyTemplateXML=result.notifyTemplateXML;
			var isAttachment=result.isAttachment;
			var attachmentCount=result.attachmentCount;
			var createdDate=result.createdDate;
			var isAddDisclaimerText=result.isAddDisclaimerText;
			var isAddDNDText=result.isAddDNDText;
			var sourceSystemID=result.sourceSystemID;
			var attachment1DocumentID=result.attachment1DocumentID;
			var attachment2DocumentID=result.attachment2DocumentID;
			var attachment3DocumentID=result.attachment3DocumentID;
			var attachment1DocumentName=result.attachment1DocumentName;
			var attachment2DocumentName=result.attachment2DocumentName;
			var attachment3DocumentName=result.attachment3DocumentName;
			var tagValueList=result.tagDatas;
			var xmlDoc = $.parseXML(notifyTemplateXML),
			$xml = $(xmlDoc);
			$title = $xml.find("from");
			var from=$title.text();
			$title = $xml.find("fromId");
			var fromId=$title.text();
			$title = $xml.find("to");
			var to=$title.text();
			$title = $xml.find("cc");
			var cc=$title.text();
			$title = $xml.find("bcc");
			var bcc=$title.text();
			$title = $xml.find("phone");
			var phone=$title.text();
			$title = $xml.find("subject");
			var subject=$title.text();
			$title = $xml.find("body");
			var body=$title.text();
			$title = $xml.find("replyTo");
			var replyTo=$title.text();
			$title = $xml.find("disclaimerText");
			var disclaimerText=$title.text();
			$title = $xml.find("dndText");
			var dndText=$title.text();
			
			$('#notifyTemplateID').val(notifyTemplateIdHidden);
			$('#pingName').val(name);
			$('#purpose').val(description);
			$('#notificationTarget').val(notifyTargetID);
			$('#deliveryChannel').val(deliveryChannelID);
			if(deliveryChannelID!=32002){
				$('#useSignature').val(useSignatureID);
				$('#subject').val(subject);
				$('#cc').val(cc);
				$('#bcc').val(bcc);
				$('#emailBody').html(body);
				$('#disclaimer').html(disclaimerText);
				$('#dndTemplate').html(dndText);
			}else{
				$('#useSignatureSMS').val(useSignatureID);	
// 				$('#phoneNo').val(phone);
				$('#smsBody').val(body);
			}
			$('#createdOn').html(createdDate);
			
			if(attachment1DocumentID!=0){
				$('#attachment1DocumentID').val(attachment1DocumentID);
				$('#templateAttachment1Span').hide();
				$('#templateAttachment1Name').append('<a onclick="downloadAttachment('+attachment1DocumentID+')">'+attachment1DocumentName+'</a>&nbsp;&nbsp;&nbsp;<a onclick="$(\'#templateAttachment1Span\').show();$(\'#templateAttachment1Name\').empty();$(\'#attachment1DocumentID\').val(0)">Remove</a><br/>');
			}
			if(attachment2DocumentID!=0){
				$('#attachment2DocumentID').val(attachment2DocumentID);
				$('#templateAttachment2Span').hide();
				$('#templateAttachment2Name').append('<a onclick="downloadAttachment('+attachment2DocumentID+')">'+attachment2DocumentName+'</a>&nbsp;&nbsp;&nbsp;<a onclick="$(\'#templateAttachment2Span\').show();$(\'#templateAttachment2Name\').empty();$(\'#attachment2DocumentID\').val(0)">Remove</a><br/>');
			}
			if(attachment3DocumentID!=0){
				$('#attachment3DocumentID').val(attachment3DocumentID);
				$('#templateAttachment3Span').hide();
				$('#templateAttachment3Name').append('<a onclick="downloadAttachment('+attachment3DocumentID+')">'+attachment3DocumentName+'</a>&nbsp;&nbsp;&nbsp;<a onclick="$(\'#templateAttachment3Span\').show();$(\'#templateAttachment3Name\').empty();$(\'#attachment3DocumentID\').val(0)">Remove</a><br/>');
			}
			
			
			$(tagValueList).each(function(i,obj) {
				var notifyTagId=obj.notifyTagId;
				var notifyTagValueId=obj.notifyTagValueId;
				var notifyTagName=obj.notifyTagName;
				var notifyTagValue=obj.notifyTagValue;
				$('#selectedTagList').html('<div class="alertn pull-left" onclick="removeTag('+notifyTagId+',this)">'+notifyTagName+'='+notifyTagValue+'<div class="btn btn-primary btn-xs" id="'+notifyTagId+'-'+notifyTagValueId+'" data-dismiss="alert" value="-" type="button"><i class="fa fa-minus"></i></div></div>');
				tagList.push(notifyTagId);

			})
			$('#deliveryChannel').change();
			
			makeEditor('emailBody');
			makeEditor('disclaimer');
			makeEditor('dndTemplate');
			//nicEditors.allTextAreas();
		}
	});
}

function appendTag(section){
	if(section=='email'){
		//$('#emailBodyDiv').find('.nicEdit-main').html($('#emailBodyDiv').find('.nicEdit-main').html()+$('#stdtag').val());	
		$('#emailBodyDiv').find('.wysiwyg-editor').html($('#emailBodyDiv').find('.wysiwyg-editor').html()+$('#stdtag').val());	
	}else{
		$('#smsBody').val($('#smsBody').val()+$('#stdtag').val());		
		
	}
}

function removeTag(tagId,obj){
	tagList = jQuery.grep(tagList, function(value) {
		  return value != tagId;
		});
	
	$(obj).remove();
}

function sendTestNotification(){
	
	var isValidated=true;
	var isAlertOpen=false;
	var subject=$('#subject').val();
	var emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').text();
	var diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').text();
	var dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').text();
	var smsBody=$('#smsBody').val();
	
	isValidated=validateInputForm('pingForm');
	if(isValidated==false){
		isAlertOpen=true;
	}
	
	if($('#deliveryChannel').val()!=32002){
		if(subject==''){
			addCssStyles('subject','Please enter Subject');
			isValidated=false;
		}else{
			removeCssStyles('subject');
		}
		if($.trim(emailBody)==''){
			$('#emailBodyDiv').css('border','1px solid red');
			$('#emailBodyDiv').attr('title','Please enter Body');
			isValidated=false;
		}else{
			$('#emailBodyDiv').css('border','none');
			$('#emailBodyDiv').removeAttr('title');
		}
	}else{
		if(smsBody==''){
			addCssStyles('smsBody','Please enter Body');
			isValidated=false;
		}else{
			removeCssStyles('smsBody');
		}
	}
	
	if(isAlertOpen==false && isValidated==false){
		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	}
	
	if(isValidated==true){
		
		 emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').html();
		 diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').html();
		 dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').html();		
		if($('#deliveryChannel').val()==32002){
			$('#useSignature').val($('#useSignatureSMS').val())
		}
		
		var notifyTemplateXML='<root>';
		if($('#deliveryChannel').val()!=32002){
			notifyTemplateXML+='<from>'+$('#communicationName').val()+'</from>';
			notifyTemplateXML+='<fromId>'+$('#communicationId').val()+'</fromId>';
			notifyTemplateXML+='<to>'+$('#communicationId').val()+'</to>';
			notifyTemplateXML+='<cc><![CDATA['+$('#cc').val()+']]></cc>';
			notifyTemplateXML+='<bcc><![CDATA['+$('#bcc').val()+']]></bcc>';
			notifyTemplateXML+='<phone></phone>';
			notifyTemplateXML+='<subject><![CDATA['+$('#subject').val()+']]></subject>';
			notifyTemplateXML+='<body><![CDATA['+$.trim(emailBody)+']]></body>';
			notifyTemplateXML+='<replyTo>'+$('#communicationId').val()+'</replyTo>';
			notifyTemplateXML+='<disclaimerText><![CDATA['+$.trim(diclaimer)+']]></disclaimerText>';
			notifyTemplateXML+='<dndText><![CDATA['+$.trim(dnd)+']]></dndText>';
		}else{
			notifyTemplateXML+='<from></from>';
			notifyTemplateXML+='<fromId></fromId>';
			notifyTemplateXML+='<to></to>';
			notifyTemplateXML+='<cc></cc>';
			notifyTemplateXML+='<bcc></bcc>';
			notifyTemplateXML+='<phone>{!Client.Phone}</phone>';
			notifyTemplateXML+='<subject></subject>';
			notifyTemplateXML+='<body><![CDATA['+$.trim($('#smsBody').val())+']]></body>';
			notifyTemplateXML+='<replyTo></replyTo>';
			notifyTemplateXML+='<disclaimerText></disclaimerText>';
			notifyTemplateXML+='<dndText></dndText>';
		}
		
		notifyTemplateXML+='</root>';
		
		if($.trim(diclaimer)!='')
		$('#isAddDisclaimerText').val(true);
		else
		$('#isAddDisclaimerText').val(false);
		if($.trim(dnd)!='')
		$('#isAddDNDText').val(true);
		else
		$('#isAddDNDText').val(false);
		
		console.log('notifyTemplateXML:---'+notifyTemplateXML);
		var tagList='<Root>';
		$('#selectedTagList input').each(function(i,obj) {
			var id=$(obj).attr('id');
			tagList+='<Tag>';
			tagList+='<TagId>'+id.substring(0,id.indexOf('-'))+'</TagId>';
			tagList+='<ValueId>'+id.substring(id.indexOf('-')+1)+'</ValueId>';
			tagList+='</Tag>';
		});
		tagList+='</Root>'
		$('#notifyTemplateXML').val(notifyTemplateXML);
		$('#tagListToSend').val(tagList);
		var msg1='';
		if($('#deliveryChannel').val()!=32002){
			msg1='Test Email'
		}else{
			msg1='Test SMS'
		}
		$('#deliveryChannelTest').val($('#deliveryChannel').val());
		$('#notifyTemplateXMLTest').val($('#notifyTemplateXML').val());
		$('#useSignatureIDTest').val($('#useSignature').val());
		$('#attachmentDivForTest').empty();
		$('#attachmentDivForTest').append($('#attachmentDivToClone').clone(true));
		
		$('#deliveryChannelIDForPreview').val($('#deliveryChannel').val());
		$('#notifyTemplateXMLForPreview').val($('#notifyTemplateXML').val());
		$('#useSignatureIDForPreview').val($('#useSignature').val());
		
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/ping/getResolvedTagsTemplateXML.htm?partyID=${sessionScope.userSession.partyId}',
			data: $('#previewForm').serialize(),
			success : function(obj) {
				var notifyTemplateXML=obj.notifyTemplateXML;
				console.log('notifyTemplateXML for test  email is:---'+notifyTemplateXML)
				$('#notifyTemplateXMLTest').val(notifyTemplateXML);
		if(isAttachmentSeleted==1){
			 $jq_1_9_2('#testNotificationForm').ajaxForm({
		            success: function(msg) {
		            	var recordCount=msg[0];
		            		if(recordCount!='0'){
		            				showAlertMessage("Success", "<br/>"+msg1+" sent successfully.", "confirmation", doNothing);
		            			}
		            		$('#attachmentDivForTest').empty();
			            		
		            },
		            error: function(msg) {
		            }, onComplete: function (data) {
		            }
		        }).submit();
			}else{
				$.ajax({
					type : "POST",
					url : $('#contextPath').val()+'/ping/sendNotification.htm',
					data: $('#testNotificationForm').serialize(),
					success : function(result) {
						var recordCount=result[0];
		            	if(recordCount!='0'){
	        				showAlertMessage("Success", "<br/>"+msg1+" sent successfully.", "confirmation", doNothing);
	        			}
		            	$('#attachmentDivForTest').empty();
					}
				});
			}
}
		
		});
	}
}

function previewPing(){
	var isValidated=true;
	var isAlertOpen=false;
	var subject=$('#subject').val();
	var emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').text();
	var diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').text();
	var dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').text();
	var smsBody=$('#smsBody').val();
	
	isValidated=validateInputForm('pingForm');
	if(isValidated==false){
		isAlertOpen=true;
	}
	
	if($('#deliveryChannel').val()!=32002){
		if(subject==''){
			addCssStyles('subject','Please enter Subject');
			isValidated=false;
		}else{
			removeCssStyles('subject');
		}
		if($.trim(emailBody)==''){
			$('#emailBodyDiv').css('border','1px solid red');
			$('#emailBodyDiv').attr('title','Please enter Body');
			isValidated=false;
		}else{
			$('#emailBodyDiv').css('border','none');
			$('#emailBodyDiv').removeAttr('title');
		}
	}else{
		if(smsBody==''){
			addCssStyles('smsBody','Please enter Body');
			isValidated=false;
		}else{
			removeCssStyles('smsBody');
		}
	}
	
	if(isAlertOpen==false && isValidated==false){
		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	}
	
	if(isValidated==true){
		
		 emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').html();
		 diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').html();
		 dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').html();		
		if($('#deliveryChannel').val()==32002){
			$('#useSignature').val($('#useSignatureSMS').val())
		}
		
		var notifyTemplateXML='<root>';
		if($('#deliveryChannel').val()!=32002){
			notifyTemplateXML+='<from>'+$('#communicationName').val()+'</from>';
			notifyTemplateXML+='<fromId>'+$('#communicationId').val()+'</fromId>';
			notifyTemplateXML+='<to>{!Contact.Email}</to>';
			notifyTemplateXML+='<cc><![CDATA['+$('#cc').val()+']]></cc>';
			notifyTemplateXML+='<bcc><![CDATA['+$('#bcc').val()+']]></bcc>';
			notifyTemplateXML+='<phone></phone>';
			notifyTemplateXML+='<subject><![CDATA['+$('#subject').val()+']]></subject>';
			notifyTemplateXML+='<body><![CDATA['+$.trim(emailBody)+']]></body>';
			notifyTemplateXML+='<replyTo>'+$('#communicationId').val()+'</replyTo>';
			notifyTemplateXML+='<disclaimerText><![CDATA['+$.trim(diclaimer)+']]></disclaimerText>';
			notifyTemplateXML+='<dndText><![CDATA['+$.trim(dnd)+']]></dndText>';
		}else{
			notifyTemplateXML+='<from></from>';
			notifyTemplateXML+='<fromId></fromId>';
			notifyTemplateXML+='<to></to>';
			notifyTemplateXML+='<cc></cc>';
			notifyTemplateXML+='<bcc></bcc>';
			notifyTemplateXML+='<phone>{!Client.Phone}</phone>';
			notifyTemplateXML+='<subject></subject>';
			notifyTemplateXML+='<body><![CDATA['+$.trim($('#smsBody').val())+']]></body>';
			notifyTemplateXML+='<replyTo></replyTo>';
			notifyTemplateXML+='<disclaimerText></disclaimerText>';
			notifyTemplateXML+='<dndText></dndText>';
		}
		
		notifyTemplateXML+='</root>';
		console.log('notifyTemplateXML:----in add ping::'+notifyTemplateXML)
		if($.trim(diclaimer)!='')
		$('#isAddDisclaimerText').val(true);
		else
		$('#isAddDisclaimerText').val(false);
		if($.trim(dnd)!='')
		$('#isAddDNDText').val(true);
		else
		$('#isAddDNDText').val(false);
		
		var tagList='<Root>';
		$('#selectedTagList input').each(function(i,obj) {
			var id=$(obj).attr('id');
			tagList+='<Tag>';
			tagList+='<TagId>'+id.substring(0,id.indexOf('-'))+'</TagId>';
			tagList+='<ValueId>'+id.substring(id.indexOf('-')+1)+'</ValueId>';
			tagList+='</Tag>';
		});
		tagList+='</Root>'
		$('#notifyTemplateXML').val(notifyTemplateXML);
		$('#tagListToSend').val(tagList);
		var msg1='';
		if($('#deliveryChannel').val()!=32002){
			msg1='Test Email'
		}else{
			msg1='Test SMS'
		}
		$('#deliveryChannelIDForPreview').val($('#deliveryChannel').val());
		$('#notifyTemplateXMLForPreview').val($('#notifyTemplateXML').val());
		$('#useSignatureIDForPreview').val($('#useSignature').val());
		$('#previewForm').submit();
	}
}

function  tagListEmailpopup()
{
	$('#popUpAlertEmailpopup').modal('show') ;
}


function  tagListSMSpopup()
{
	$('#popUpAlertSMSpopup').modal('show') ;
}
</script>

	<%
		int notifyTemplateId = 0;
		try {
			notifyTemplateId = Integer.parseInt(request.getParameter("notifyTemplateId")
					.toString());
			if (notifyTemplateId != 0) {
	%>
	<input type="hidden" id="notifyTemplateIdHidden" 
		value="<%=notifyTemplateId%>">
	<%
		}
		} catch (Exception e) {
	%>
	<input type="hidden" id="notifyTemplateIdHidden" value="0">
	<%
		}
	%>
	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
	<input type="hidden" id="stdtag" value="">
	
	<form id="testNotificationForm" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/ping/sendNotification.htm">
		<input type="hidden" id="notifyTemplateXMLTest" name="notifyTemplateXML">
		<input type="hidden" id="deliveryChannelTest" name="deliveryChannelID">
		<input type="hidden" id="useSignatureIDTest" name="useSignatureID">
		<input type="hidden" id="partyIdToSendTest" name="partyID" value="${sessionScope.userSession.partyId}">
		<div id="attachmentDivForTest" style="display: none">
		</div>
	</form>
	
	<form id="previewForm" target="_blank" name="previewForm" method="post" action="<%=request.getContextPath()%>/previewPing.htm"> 
		<input type="hidden" id="partyIdForPreview" name="partyId" value="${sessionScope.userSession.partyId}">	
		<input type="hidden" id="deliveryChannelIDForPreview" name="deliveryChannelID">		
		<input type="hidden" id="notifyTemplateXMLForPreview" name="notifyTemplateXML">	
		<input type="hidden" id="useSignatureIDForPreview" name="useSignatureID">
	</form>
	
</body>
</html>