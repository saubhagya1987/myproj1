<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Send Notification</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ZeroClipboard.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<style type="text/css">
.popupnewtag1 {
	top: 5% !important;
	left: -95% !important;
}
</style>
</head>
<body>
	<!--css popup window start 1-->
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/common_popup.jsp" />
	<!-- Center part start -->
	<section>
		<div class="container">
			 <div class="page-header">
				<h1>Send <b id="notificationTitle"></b> to <span id="toName"></span></h1>
			</div>
			<div class="widget-box" style="margin-top:10px;">
		<form id="pingForm" method="POST" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/ping/sendNotification.htm">
		<div class="widget-body">
          <div class="widget-main clearfix">
            <div class="row">
                <div class="form-group col-md-9 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="contactType">Notification Target</label>
							<div class="col-sm-9">
								<div class="col-md-4 searchpadding padding_top">
									<span id="notificationTarget"></span>
								</div>
								<div class="col-md-2 searchpadding padding_top">Type</div>
								<div class="col-md-4 searchpadding padding_top">
									<span id="type"></span>
								</div>
								<div id="emailDetails" class="none">
									<div class="col-md-2 searchpadding padding_top">From</div>
									<div class="col-md-4 searchpadding padding_top">
										<span id="from"></span>
									</div>
									<div class="col-md-2 searchpadding padding_top">To</div>
									<div class="col-md-4 searchpadding padding_top">
										<span id="to"></span>
									</div>
								</div>
							</div>
						</div>
                </div>
            <div id="email" class="none">
            <div class="row">
              <div class="form-group col-md-12 clearfix">
                <label class="col-sm-1 control-label no-padding-right" for="subject">Subject <span class="red">*</span></label>
                <div class="col-sm-8">
                  <input type="text" class="input-xxlarge" title="Subject" id="subject" name="subject">
					 <div id="subject_error" class="help-block hide">Please provide a valid subject.</div>
                  
                </div>
                <div class="col-sm-3"></div>
              </div>
            </div>
            
             <div class="row">
              <div class="form-group col-md-12 clearfix">
                <label class="col-sm-1 control-label no-padding-right" for="emailBody">Body <span class="red">*</span></label>
                <div class="col-sm-8">
           		<div  id="emailBodyDiv">
				<!--  <textarea name="emailBody" id="emailBody" style="width: 100%; height: 120px;" rows="10" class="editor"> </textarea> -->
				     <div class="wysiwyg-editor" name="emailBody" id="emailBody" style="width: 100%; height: 120px;" rows="10"></div>
					 <div id="emailBody_error" class="help-block hide">Please provide a valid body.</div>
				 </div>
                </div>
                     <div class="form-group col-md-3 clearfix" id="tagList" 
                          style="min-height: 180px; display: none">
							<label>Tag List</label>
							<div class="col-sm-9 pull-right">
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
								
							</div>
						</div>
              </div>
                                 
             </div>
						<div class="row">
							<div class="form-group col-md-6 clearfix">
								<label class="col-sm-3 control-label no-padding-right" for="cc">CC
								</label>
								<div class="col-sm-9">
									<input type="text" class="input-xxlarge" title="CC" id="cc" name="cc">

								</div>
							</div>
							<div class="form-group col-md-6 clearfix">
								<label class="col-sm-3 control-label no-padding-right" for="bcc">BCC
								</label>
								<div class="col-sm-9">
									<input type="text" class="input-xxlarge" title="BCC" id="bcc" name="bcc">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-md-6 clearfix">
								<label class="col-sm-3 control-label no-padding-right" >Add
							     Attachments
								</label>
								<div class="col-sm-9">
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
								<label class="col-sm-3 control-label no-padding-right" for="bcc">Use Signature
								</label>
								<div class="col-sm-9">
									<select name="useSignatureID" id="useSignature" class="input-xxlarge"> </select>
								</div>
							</div>
						</div>


						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-1 control-label no-padding-right"
									for="disclaimer">Disclaimer</label>
								<div class="col-sm-8">
									<div id="disclaimerDiv">
										<%-- <textarea name="disclaimer" id="disclaimer" style="width: 100%; height: 120px;" rows="10" class="editor">
								         ${sessionScope.userSession.disclaimerText}
							           </textarea> --%>
							              <div class="wysiwyg-editor" name="disclaimer" id="disclaimer" style="width: 100%; height: 120px;" rows="10"> 
							                ${sessionScope.userSession.disclaimerText}
							              </div>
									</div>
								</div>
								<div class="col-sm-3"></div>
							</div>
						</div>
						</div>
							<div id="sms" class="none"> 
							<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-1 control-label no-padding-right"
									for="phoneNo">Phone Number <span class="red">*</span></label>
								<div class="col-sm-8">
									<input type="text" class="input-xxlarge" title="Phone Number" onkeydown="allowIntegersOnly(id,event)" id="phoneNo" name="phoneNo">
									<div id="phoneNo_error" class="help-block hide">Please provide a valid phone number.</div>
								</div>
								<div class="col-sm-3"></div>
							</div>
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-1 control-label no-padding-right"
									for="useSignatureSMS">Use Signature</label>
								<div class="col-sm-8">
										<select id="useSignatureSMS" class="input-xxlarge"> </select>
								</div>
								<div class="col-sm-3"></div>
							</div>
						</div>
						
						
							<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-1 control-label no-padding-right"
									for="smsBody">Body <span class="red">*</span></label>
								<div class="col-sm-8">
									<textarea class="input-xxlarge" class="editor" style="width: 100%; height: 120px;" rows="11" id="smsBody" name="smsBody"></textarea>
									<div id="smsBody_error" class="help-block hide">Please provide a valid body.</div>
								</div>
								<div class="col-sm-3"></div>
							</div>
						  </div>
						
						
						 <div class="col-md-3 searchpadding padding_top"
							style="min-height: 180px; display: none">
							<div class="list-group" id="tagListSMS">
								<a class="list-group-item grey">Tag List <input class="btn"
									style="float: right; position: relative; top: -5px;"
									type="button" id="copy" value="Copy"
									onclick="closeTagDetailList('sms')"><input class="btn"
									style="float: right; position: relative; top: -5px; margin-right: 5px;"
									type="button" value="Append" onclick="appendTag('sms')"></a>
							</div>
							<div class="popupnewtag1 none">
								<a onClick="closeTagDetailList('sms')" style="float: right"><img
									alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
								<ul id="tagDetailListSMS"
									style="width: 200px; margin-top: 26px;">
									<li><input id="15Large" value="15Large" type="checkbox">
										Name</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Email</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Contact</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Address</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Send to</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Mail to</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Address</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Send to</li>
									<li><input id="15Large" value="15Large" type="checkbox">
										Mail to</li>
								</ul>
							</div>
						</div>
						</div>
						
						<div id="dndTemplateDiv">
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-1 control-label no-padding-right"
										for="dndTemplate">DND Template</label>
									<div class="col-sm-8">
										<div id="disclaimerDiv">
											<%-- <textarea name="dndTemplate" id="dndTemplate" style="width: 100%; height: 120px;" rows="10" class="editor">
								             ${sessionScope.userSession.dndText}
							                </textarea> --%>
							                   <div class="wysiwyg-editor" name="dndTemplate" id="dndTemplate" style="width: 100%; height: 120px;" rows="10">
							                    	${sessionScope.userSession.dndText}
							                   </div>
										</div>
									</div>
									<div class="col-sm-3"></div>
								</div>
							</div>
                         </div>
							<div class="row  pull-right margin_5px">
								<div class="space-8"></div>
								<div class="topmenu margin_5px">
									<div class="btn btn-primary btn-xs dbtn" type="button"
										name="Save" id="save" onclick="sendEmail()">
										<i class="fa fa-plus"></i>Send
									</div>
									<a onclick="goBack()">
										<div class="btn btn-primary btn-xs dbtn" type="button"
											name="Cancel" id="Cancel">
											<i class="fa fa-plus"></i>Cancel
										</div>
								</div>
							</div>
						
					</div>
		        </div>

			<input type="hidden" id="notifyTemplateXML" name="notifyTemplateXML">
			<input type="hidden" id="deliveryChannel" name="deliveryChannelID">
			<input type="hidden" id="partyIdToSend" name="partyID"> <input
				type="hidden" id="partyIdToSendString" name="partyIDString">
		</form>
</div>
</div>
	</section>
	<!-- Center part End -->

	<jsp:include page="../common/footer.jsp" />
	<script>
var isAttachmentSeleted=0;
	makeEditor('emailBody');
	makeEditor('disclaimer');
	makeEditor('dndTemplate');

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
var standardTag='';
var tagList = new Array();
ZeroClipboard.setMoviePath('<%=request.getContextPath()%>/js/ZeroClipboard.swf');
		//create client
		var clip = new ZeroClipboard.Client();
		clip.addEventListener('mousedown', function() {
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
		$(function() {
			var partyIdForNotification = $('#partyIdForNotification').val();
			if (partyIdForNotification == '0') {
				$('#partyIdForNotification').val(
						localStorage.getItem('partyIdForNotification'));
				$('#nameForNotification').val(
						localStorage.getItem('nameForNotification'));
				$('#notifyTargetForNotification').val(
						localStorage.getItem('notifyTargetForNotification'));
				$('#notifyToForNotification').val(
						localStorage.getItem('notifyToForNotification'));
				$('#notifyType').val(localStorage.getItem('notifyType'));
				$('#isBulk').val(localStorage.getItem('isBulk'));
			} else {
				localStorage.setItem('partyIdForNotification', $(
						'#partyIdForNotification').val());
				localStorage.setItem('nameForNotification', $(
						'#nameForNotification').val());
				localStorage.setItem('notifyTargetForNotification', $(
						'#notifyTargetForNotification').val());
				localStorage.setItem('notifyToForNotification', $(
						'#notifyToForNotification').val());
				localStorage.setItem('notifyType', $('#notifyType').val());
				localStorage.setItem('isBulk', $('#isBulk').val());
			}
			$("#templateAttachment1,#templateAttachment2,#templateAttachment3")
					.change(function() {
						isAttachmentSeleted = 1;
					});
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()
						+ '/common/getPicklistValues.htm?codeTypeIds=28,29',
				success : function(result) {
					$('#useSignature,#useSignatureSMS').empty();
					$('#useSignature,#useSignatureSMS').append(
							'<option value="0">--Select--</option>');
					$(result).each(
							function(i, obj) {
								var codeTypeId = obj.codeTypeId;
								var codeValue = obj.codeValue;
								var codevalueId = obj.codeValueId;
								if (codeTypeId == 28) {
									if (codevalueId < 28003) {
										$('#notificationTarget').append(
												'<option value="'+codevalueId+'">'
														+ codeValue
														+ '</option>');
										$('#tagList').append(
												'<a class="list-group-item" onclick="showTagDetailsList('
														+ codevalueId
														+ ',\'email\',\''
														+ codeValue + '\')">'
														+ codeValue + '</a>');
										$('#tagListSMS').append(
												'<a class="list-group-item" onclick="showTagDetailsList('
														+ codevalueId
														+ ',\'sms\',\''
														+ codeValue + '\')">'
														+ codeValue + '</a>');
									}
								} else if (codeTypeId == 29) {

									if (codevalueId != 29001) {
										$('#useSignature').append(
												'<option value="'+codevalueId+'">'
														+ codeValue
														+ '</option>');
										$('#useSignatureSMS').append(
												'<option value="'+codevalueId+'">'
														+ codeValue
														+ '</option>');
									}
								} else if (codeTypeId == 32) {
									$('#deliveryChannel').append(
											'<option value="'+codevalueId+'">'
													+ codeValue + '</option>');
								}
							});
					$('#notificationTarget').html(
							$('#notifyTargetForNotification').val());
					$('#from').html($('#communicationId').val());
					$('#toName').html($('#nameForNotification').val());
					if ($('#notifyType').val() == 'email') {
						$('#deliveryChannel').val(32001);
						$('#sms').hide();
						$('#email').show();
						if ($('#isBulk').val() == '1') {
							$('#to').html(
									$('#notifyToForNotification').val()
											+ '&nbsp;');
						} else {
							$('#to').html($('#notifyToForNotification').val());
						}

						$('#emailDetails').show();
						$('#type,#notificationTitle').html('Email');
					} else {
						$('#deliveryChannel').val(32002);
						$('#sms').show();
						$('#email').hide();
						$('#dndTemplateDiv').hide();
						
						if ($('#isBulk').val() != '1')
							$('#phoneNo').val(
									$('#notifyToForNotification').val());
						else {
							$('#phoneNumDiv').hide();
							$('#blankdiv').show();
						}
						$('#emailDetails').hide();
						$('#type,#notificationTitle').html('SMS');
					}
					$('#partyIdToSend').val($('#partyIdForNotification').val())
					nicEditors.allTextAreas();
				}
			});
		});

		function showTagDetailsList(notifyTarget, section, codevalue) {
			$
					.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/ping/getStandardTags.htm?notifyTarget='
								+ notifyTarget,
						success : function(result) {
							if (section == 'email') {
								$('#tagDetailList').empty();
								$('#tagDetailList').append(
										'<li>' + codevalue + '</li>');
							} else {
								$('#tagDetailListSMS').empty();
								$('#tagDetailListSMS').append(
										'<li>' + codevalue + '</li>')
							}

							$(result)
									.each(
											function(i, obj) {
												var mappedValue3 = obj.mappedValue3;
												var codeValue = obj.codeValue;
												if (section == 'email') {
													$('#tagDetailList')
															.append(
																	'<li style="height: 34px;"><input type="radio" name="tagradio" id="'
																			+ codeValue
																			+ '" onmousedown="copyText(id)"> '
																			+ mappedValue3
																			+ '  </li>');
												} else {
													$('#tagDetailListSMS')
															.append(
																	'<li style="height: 34px;"><input type="radio" name="tagradio" id="'
																			+ codeValue
																			+ '" onmousedown="copyText(id)"> '
																			+ mappedValue3
																			+ ' </li> ');
												}
											});
							if (section == 'email') {
								$('#tagDetailList').parent().show();
							} else {
								$('#tagDetailListSMS').parent().show();
							}
						}
					});
		}

		function copyText(id) {
			standardTag = id;
			$('#stdtag').val(id);
		}
		function closeTagDetailList(section) {
			if (section == 'email') {
				$('#tagDetailList').parent().hide();
			} else {
				$('#tagDetailListSMS').parent().hide();
			}
		}

		function sendEmail() {
			var isValidated = true;
			var isAlertOpen = false;
			var subject = $('#subject').val();
			var emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').text();
			var diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').text();
			var dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').text();
			var phoneNo = $('#phoneNo').val();
			var smsBody = $('#smsBody').val();

			isValidated = validateInputForm('pingForm');
			if (isValidated == false) {
				isAlertOpen = true;
			}

			if ($('#deliveryChannel').val() != 32002) {
				if (subject == '') {
					addCssStyles('subject', 'Please enter Subject');
					isValidated = false;
					$('#subject_error').removeClass('hide');;
					$('#subject_error').parent().parent().parent().addClass('has-error');
				} else {
					removeCssStyles('subject');
					$('#subject_error').addClass('hide');
					$('#subject_error').parent().parent().parent().removeClass('has-error');
				}
				if ($.trim(emailBody) == '') {
					$('#emailBodyDiv').css('border', '1px solid red');
					$('#emailBodyDiv').attr('title', 'Please enter Body');
					$('#emailBody_error').removeClass('hide');;
					$('#emailBody_error').parent().parent().parent().addClass('has-error');
					isValidated = false;
				} else {
					$('#emailBodyDiv').css('border', 'none');
					$('#emailBodyDiv').removeAttr('title');
					$('#emailBody_error').addClass('hide');
					$('#emailBody_error').parent().parent().parent().removeClass('has-error');
				}
			} else {

				if ($('#isBulk').val() != '1') {
					if (phoneNo == '') {
						addCssStyles('phoneNo', 'Please enter Phone Number');
						isValidated = false;
						$('#phoneNo_error').removeClass('hide');;
						$('#phoneNo_error').parent().parent().addClass('has-error');
					} else {
						removeCssStyles('phoneNo');
						$('#phoneNo_error').addClass('hide');
						$('#phoneNo_error').parent().parent().removeClass('has-error');
					}
				}
				if (smsBody == '') {
					addCssStyles('smsBody', 'Please enter Body');
					isValidated = false;
					$('#smsBody_error').removeClass('hide');;
					$('#smsBody_error').parent().parent().parent().addClass('has-error');
				} else {
					removeCssStyles('smsBody');
					$('#smsBody_error').addClass('hide');
					$('#smsBody_error').parent().parent().parent().removeClass('has-error');
				}
			}

			if (isAlertOpen == false && isValidated == false) {
				showAlertMessage(
						"Error",
						"There are some validation errors,please check to proceed further.",
						'error', doNothing);
			}
			// 	isValidated=false;
			if (isValidated == true) {
				emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').html();
				diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').html();
				dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').html();
				if ($('#deliveryChannel').val() == 32002) {
					$('#useSignature').val($('#useSignatureSMS').val())
				}
				var isBulk = $('#isBulk').val();
				if (isBulk == '0') {
					var notifyTemplateXML = '<root>';
					if ($('#deliveryChannel').val() != 32002) {
						notifyTemplateXML += '<from>'
								+ $('#communicationName').val() + '</from>';
						notifyTemplateXML += '<fromId>' + $('#from').html()
								+ '</fromId>';
						notifyTemplateXML += '<to>' + $('#to').html() + '</to>';
						notifyTemplateXML += '<cc><![CDATA[' + $('#cc').val()
								+ ']]></cc>';
						notifyTemplateXML += '<bcc><![CDATA[' + $('#bcc').val()
								+ ']]></bcc>';
						notifyTemplateXML += '<phone></phone>';
						notifyTemplateXML += '<subject><![CDATA['
								+ $('#subject').val() + ']]></subject>';
						notifyTemplateXML += '<body><![CDATA['
								+ $.trim(emailBody) + ']]></body>';
						notifyTemplateXML += '<replyTo>' + $('#from').html()
								+ '</replyTo>';
						notifyTemplateXML += '<disclaimerText><![CDATA['
								+ $.trim(diclaimer) + ']]></disclaimerText>';
						notifyTemplateXML += '<dndText><![CDATA[' + $.trim(dnd)
								+ ']]></dndText>';
					} else {
						notifyTemplateXML += '<from></from>';
						notifyTemplateXML += '<fromId></fromId>';
						notifyTemplateXML += '<to></to>';
						notifyTemplateXML += '<cc></cc>';
						notifyTemplateXML += '<bcc></bcc>';
						notifyTemplateXML += '<phone><![CDATA['
								+ $('#phoneNo').val() + ']]></phone>';
						notifyTemplateXML += '<subject></subject>';
						notifyTemplateXML += '<body><![CDATA['
								+ $.trim($('#smsBody').val()) + ']]></body>';
						notifyTemplateXML += '<replyTo></replyTo>';
						notifyTemplateXML += '<disclaimerText></disclaimerText>';
						notifyTemplateXML += '<dndText></dndText>';
					}

					notifyTemplateXML += '</root>';
				} else {
					var partyIds = $('#partyIdToSend').val();
					$('#partyIdToSend').val(0);
					$('#partyIdToSendString').val(partyIds);
					partyIds = partyIds.split(',');
					var notifyTemplateXML = '<root>';
					$(partyIds)
							.each(
									function(i, obj) {

										notifyTemplateXML += '<queue>';
										if ($('#deliveryChannel').val() != 32002) {
											notifyTemplateXML += '<from>'
													+ $('#communicationName')
															.val() + '</from>';
											notifyTemplateXML += '<fromId>'
													+ $('#from').html()
													+ '</fromId>';
											notifyTemplateXML += '<to></to>';
											notifyTemplateXML += '<cc><![CDATA['
													+ $('#cc').val()
													+ ']]></cc>';
											notifyTemplateXML += '<bcc><![CDATA['
													+ $('#bcc').val()
													+ ']]></bcc>';
											notifyTemplateXML += '<phone></phone>';
											notifyTemplateXML += '<subject><![CDATA['
													+ $('#subject').val()
													+ ']]></subject>';
											notifyTemplateXML += '<body><![CDATA['
													+ $.trim(emailBody)
													+ ']]></body>';
											notifyTemplateXML += '<replyTo>'
													+ $('#from').html()
													+ '</replyTo>';
											notifyTemplateXML += '<disclaimerText><![CDATA['
													+ $.trim(diclaimer)
													+ ']]></disclaimerText>';
											notifyTemplateXML += '<dndText><![CDATA['
													+ $.trim(dnd)
													+ ']]></dndText>';
											notifyTemplateXML += '<partyId>'
													+ obj + '</partyId>';
										} else {
											notifyTemplateXML += '<from></from>';
											notifyTemplateXML += '<fromId></fromId>';
											notifyTemplateXML += '<to></to>';
											notifyTemplateXML += '<cc></cc>';
											notifyTemplateXML += '<bcc></bcc>';
											notifyTemplateXML += '<phone></phone>';
											notifyTemplateXML += '<subject></subject>';
											notifyTemplateXML += '<body><![CDATA['
													+ $.trim($('#smsBody')
															.val())
													+ ']]></body>';
											notifyTemplateXML += '<replyTo></replyTo>';
											notifyTemplateXML += '<disclaimerText></disclaimerText>';
											notifyTemplateXML += '<dndText></dndText>';
											notifyTemplateXML += '<partyId>'
													+ obj + '</partyId>';
										}
										notifyTemplateXML += '</queue>';

									});
					notifyTemplateXML += '</root>';
				}
				$('#notifyTemplateXML').val(notifyTemplateXML);
					
				var action = '';
				if ($('#notifyTargetForNotification').val() == 'Opportunity')
					action = 'opportunity/getOpportunitiesList.htm';
				else
					action = 'client/getClientList.htm';

				var msg1 = '';
				if ($('#notifyType').val() == 'email') {
					msg1 = 'Email';
				} else {
					msg1 = 'SMS';
				}
				if (isAttachmentSeleted == 1) {
					$jq_1_9_2('#pingForm').ajaxForm(
							{
								success : function(msg) {
									var recordCount = msg[0];
									if (recordCount != '0') {
										localStorage.setItem('actionName', $(
												'#contextPath').val()
												+ '/' + action);
										showAlertMessage("Success", "<br/>"
												+ msg1 + " sent successfully.",
												"confirmation",
												redirectFunction);
									}

								},
								error : function(msg) {
								},
								onComplete : function(data) {
								}
							}).submit();
				} else {
					$.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/ping/sendNotification.htm',
						data : $('#pingForm').serialize(),
						success : function(result) {
							var recordCount = result[0];
							if (recordCount != '0') {
								localStorage.setItem('actionName', $(
										'#contextPath').val()
										+ '/' + action);
								showAlertMessage("Success", "<br/>" + msg1
										+ " sent successfully.",
										"confirmation", redirectFunction);
							}
						}
					});
				}
			}

		}

		function appendTag(section) {
			if (section == 'email') {
				$('#emailBodyDiv').find('.wysiwyg-editor').html(
						$('#emailBodyDiv').find('.wysiwyg-editor').html()
								+ $('#stdtag').val());
			} else {
				$('#smsBody').html($('#smsBody').val() + $('#stdtag').val());

			}
		}

		function goBack() {
			if ($('#notifyTargetForNotification').val() == 'Opportunity')
				window.location.href = $('#contextPath').val()
						+ '/opportunity/getOpportunitiesList.htm';
			else
				window.location.href = $('#contextPath').val()
						+ '/client/getClientList.htm';
		}
	</script>

	<%
		String partyId = "0";
		String name = "";
		String notifyTargetForNotification = "";
		String notifyToForNotification = "";
		String notifyType = "";
		String isBulk = "0";
		try {
			partyId = request.getParameter("partyId").toString();
			name = request.getParameter("name").toString();
			notifyTargetForNotification = request.getParameter(
					"notifyTarget").toString();
			notifyToForNotification = request.getParameter("notifyTo")
					.toString();
			notifyType = request.getParameter("notifyType").toString();
			isBulk = request.getParameter("isBulk").toString();
	%>
	<input type="hidden" id="partyIdForNotification" value="<%=partyId%>">
	<input type="hidden" id="nameForNotification" value="<%=name%>">
	<input type="hidden" id="notifyTargetForNotification"
		value="<%=notifyTargetForNotification%>">
	<input type="hidden" id="notifyToForNotification"
		value="<%=notifyToForNotification%>">
	<input type="hidden" id="notifyType" value="<%=notifyType%>">
	<input type="hidden" id="isBulk" value="<%=isBulk%>">
	<%
		} catch (Exception e) {

			e.printStackTrace();
	%>
	<input type="hidden" id="partyIdForNotification" value="0">
	<input type="hidden" id="nameForNotification" value="">
	<input type="hidden" id="notifyTargetForNotification" value="">
	<input type="hidden" id="notifyToForNotification" value="">
	<input type="hidden" id="notifyType" value="">
	<input type="hidden" id="isBulk" value="0">
	<%
		}
	%>
	<form id="downloadAttachmentForm" method="post"
		action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
	<input type="hidden" id="stdtag" value="qqqqqqq">
</body>
</html>