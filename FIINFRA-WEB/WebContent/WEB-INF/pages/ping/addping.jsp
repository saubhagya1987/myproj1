<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Add/Edit ping</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ZeroClipboard.js"></script>
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>-->
</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.caret.js"></script> 
        <script src="<%=request.getContextPath()%>/js/jquery.form.js"></script> 
        <!-- Center part start -->
        <section>
          <div class="page-header  clearfix">
            <h1 class="pull-left">Add/Edit ping</h1>
          </div>
          <div class="btn-group pull-right">
            <button data-toggle="dropdown" class="btn btn-primary btn-xs dropdown-toggle" aria-expanded="false" id="moreActiontest"> More Action <span class="ace-icon fa fa-caret-down icon-on-right"></span> </button>
            <ul class="dropdown-menu dropdown-primary" id="moreActionMenutest">
              <li> <a onclick="previewPing()"><i class="fa fa-eye"></i> <span
								class="user">Preview </span></a> </li>
              <li id="sendemail"> <a onclick="sendTestNotification()"><span class="fa fa-envelope"></span> Send Test Email</a> </li>
              <li class="none" id="sendsms"> <a onclick="sendTestNotification()"><i class="callicon"></i><span
								class="user">Send Test SMS</span></a> </li>
            </ul>
          </div>
          <div class="clr"></div>
          <form id="pingForm" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/ping/savePing.htm">
            <div class="">
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-2 control-label no-padding-right"
								for="pingName">Ping Name <span class="red">*</span></label>
                  <div class="col-sm-5">
                    <input type="text" class="input-xxlarge" title="Ping Name"
									id="pingName" name="name" validate="1" emsg="Ping Name">
                    <div id="pingName_error" class="help-block hide">Please
                      provide a valid ping name.</div>
                  </div>
                  <label class="col-sm-1 col-xs-3 control-label no-padding-right"
								for="createdOn">Created on</label>
                  <div class="col-sm-2 col-xs-5"> <span id="createdOn" class="input-xxlarge" style="border: none;">&nbsp;</span> </div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-2 control-label no-padding-right"
								for="purpose">Purpose of this ping <span class="red">*</span></label>
                  <div class="col-sm-8">
                    <textarea class="input-xxlarge" rows="2" id="purpose" name="description" validate="1" emsg="Purpose of this ping"  style="width:100%"></textarea>
                    <div id="purpose_error" class="help-block hide">Please
                      provide a valid purpose of this ping.</div>
                  </div>
                  <div class="col-sm-3"></div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-2 control-label no-padding-right"
								for="deliveryChannel">Delivery Channel<span class="red">*</span></label>
                  <div class="col-sm-8">
                    <select name="deliveryChannelID" id="deliveryChannel" class="input-xxlarge" validate="select" emsg="Delivery Channel" onchange="enableTf1();">
                    </select>
                    <div id="deliveryChannel_error" class="help-block hide">Please
                      provide a valid delivery channel.</div>
                  </div>
                  <div class="col-sm-3"></div>
                </div>
              </div>
              <div id="email">
                <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right" for="subject">Subject <span class="red">*</span></label>
                    <div class="col-sm-8">
                      <input type="text" class="input-xxlarge" title="Subject" id="subject" name="subject"  style="width:100%">
                      <div id="subject_error" class="help-block hide">Please provide a valid subject.</div>
                    </div>
                    <div class="col-sm-3"></div>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right" for="emailBody">Body <span class="red">*</span></label>
                    <div class="col-sm-8 southspace2" id="emailBodyDiv">
                      <div class="wysiwyg-editor" name="emailBody" id="emailBody" rows="10"></div>
                      <div id="emailBody_error" class="help-block hide">Please provide a valid body.</div>
                    </div>
                    <div class="col-sm-2 widget-box" id="tagList">
                      <div class="widget-header">
                        <h4 class="widget-title">Tag List</h4>
                      </div>
                      <div class="widget-body">
                        <div class="neswspace1 pull-right">
                          <div type="button" class="btn btn-primary btn-xs  createNewBtn"
										onclick="appendTag('email')" title="Append to Body"
										alt="Append to Body">Append</div>
                          <div type="button" class="btn btn-primary btn-xs  createNewBtn"
										id="copy" name="Copy" onclick="closeTagDetailList('email')"
										title="Copy to clipboard" alt="Copy to clipboard">Copy</div>
                        </div>
                        <div class="clearfix"></div>
                      </div>
                      <div class="modal fade" id="popUpAlertEmailpopup" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal"
													aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                              <h4 class="modal-title" id="myModalLabel">Opportunity or Client</h4>
                            </div>
                            <div class="modal-body">
                              <div class="none" onClick="closeTagDetailList('email')">
                                <ul id="tagDetailList" class="list-unstyled padwest1">
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right"
								for="subject">CC</label>
                    <div class="col-sm-8">
                      <input type="text" class="input-xxlarge" title="CC" id="cc"
									name="cc">
                    </div>
                  </div>
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right"
								for="subject">BCC</label>
                    <div class="col-sm-8">
                      <input type="text" class="input-xxlarge" title="BCC" id="bcc" name="bcc">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right"
								for="attachmentDivToClone">Add Attachments</label>
                    <div class="col-sm-4" id="attachmentDivToClone"> <span id="templateAttachment1Span">
                      <input type="file"
									name="templateAttachment" id="templateAttachment1" 
									style="margin-bottom: 5px;">
                      </span><span
									id="templateAttachment1Name"></span> <span
									id="templateAttachment2Span">
                      <input type="file"
									name="templateAttachment" id="templateAttachment2"
									style="margin-bottom: 5px;">
                      </span><span
									id="templateAttachment2Name"></span> <span
									id="templateAttachment3Span">
                      <input type="file"
									name="templateAttachment" id="templateAttachment3"
									style="margin-bottom: 5px;">
                      </span><span
									id="templateAttachment3Name"></span> </div>
                  </div>
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right"
								for="useSignature">Use Signature</label>
                    <div class="col-sm-8">
                      <select name="useSignatureID" id="useSignature" class="input-xxlarge">
                      </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right"
								for="disclaimerDiv">Disclaimer</label>
                    <div class="col-sm-8" id="disclaimerDiv">
                      <div class="wysiwyg-editor" name="disclaimer" id="disclaimer" rows="10">
                        <c:choose>
                          <c:when test="${sessionScope.userSession.disclaimerText=='' || sessionScope.userSession.disclaimerText=='<br>'}">If you want to unsubscribe then please email to {!Partner.Email}</c:when>
                          <c:otherwise>${sessionScope.userSession.disclaimerText}</c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                    <div class="col-sm-3"></div>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-2 control-label no-padding-right"
								for="dndTemplateDiv">DND Template</label>
                    <div class="col-sm-8" id="dndTemplateDiv">
                      <div class="wysiwyg-editor" name="dndTemplate"   id="dndTemplate" rows="10" >${sessionScope.userSession.dndText}</div>
                    </div>
                    <div class="col-sm-2"></div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- SMS Start-->
            <div id="sms" class="none">
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-2 control-label no-padding-right"
								for="useSignatureSMS">Use Signature</label>
                  <div class="col-sm-8">
                    <select id="useSignatureSMS" class="input-xxlarge">
                    </select>
                  </div>
                   <div class="col-sm-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-2 control-label no-padding-right"
								for="smsBody">Body<span class="red">*</span></label>
                  <div class="col-sm-8">
                    <textarea class="input-xxlarge" rows="11" id="smsBody"
									name="smsBody" style="width:100%"></textarea>
                    <div id="smsBody_error" class="help-block hide">Please provide a valid body.</div>
                  </div>
     
                       <div class="col-sm-2 widget-box" id="tagListSMS">
                      <div class="widget-header">
                        <h4 class="widget-title">Tag List</h4>
                      </div>
                      <div class="widget-body">
                        <div class="neswspace1 pull-right">
                          <div type="button" class="btn btn-primary btn-xs  createNewBtn"
										onclick="appendTag('sms')" title="Append to Body"
										alt="Append to Body">Append</div>
                          <div type="button" class="btn btn-primary btn-xs  createNewBtn"
										id="copy" name="Copy" onclick="closeTagDetailList('sms')"
										title="Copy to clipboard" alt="Copy to clipboard">Copy</div>
                        </div>
                        <div class="clearfix"></div>
                      </div>
                      <div class="modal fade" id="popUpAlertSMSpopup" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal"
													aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                              <h4 class="modal-title" id="myModalLabel">Opportunity or Client</h4>
                            </div>
                            <div class="modal-body">
                              <div class="none" onClick="closeTagDetailList('sms')">
                                <ul id="tagDetailListSMS" class="list-unstyled padwest1">
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
             
              </div>
            </div>
            <!-- SMS End-->
            
            <div class="row">
              <div class="col-md-2"></div>
              <div class="widget-box col-md-8">
                <div class="widget-header">
                  <h4 class="widget-title"><span id="selectedTagListMessage">Select the tags to identify  Potential Recipients (target audience for this ping) <span class="red">*</span></span></h4>
                </div>
                <div class="widget-body">
                  
                    <div class="form-group col-md-8 clearfix">
                     
                      <div class="col-sm-12">
                        <div id="selectedTagList" style="overflow:auto;height:150px"></div>
                      </div>
                    </div>
                    <div class="form-group col-md-4 clearfix">
                     
                      <div class="col-sm-12">
                        <div class="panel-body">
                          
                            <select class="input-xxlarge southspace3" id="availableTags"
											onchange="populateTagValue()">
                            </select>
                            
                            <select
											class="input-xxlarge" id="tagValue">
                              <option value="0">--Select--</option>
                            </select>
                         
                          <div class="col-md-12 northspace2">
                            <div type="button"
											class="btn btn-primary btn-xs  createNewBtn" id="AddToList"
											onclick="addSelectedTag()" title="Add to List"
											alt="Add to List"> <i class="fa fa-plus"></i> Add to List </div>
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
                      <div class="col-sm-9">
                        <div class="col-md-4"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-2"></div>
              <div class="col-md-8 rightAlign northspace2">
                <div type="button" class="btn btn-primary btn-xs  createNewBtn westspace1"
									id="save" name="Save" onclick="savePing(1)" title="Save & New"
									alt="Save & New">Save & New </div>
                <div type="button" class="btn btn-primary btn-xs  createNewBtn westspace1"
									name="Save" onclick="savePing(0)" title="Save & Close"
									alt="Save & Close" id="save1">Save & Close </div>
                <a class="westspace1" href="<%=request.getContextPath()%>/ping/getPings.htm">
                <div type="button" class="btn btn-primary btn-xs  createNewBtn"
										name="Cancel" id="cancel" title="Cancel" alt="Cancel">Cancel</div>
                </a></div>
              <div class="clearfix"></div>
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
<script>
var isAttachmentSeleted=0;
$('input[type="file"]').bind('change', function(){isAttachmentSeleted=1;});

$("#sms, #sendsms").hide();	
$("#email, #sendemail").show();
function enableTf1(){

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
$(function() {
	
	
	
	
	
 	var name = getParameterByName('name');
	if(name =='BU')
		{
		$('#save').hide();
		$('#save1').hide();
		}
		
	else
		{
		$('#save').show();
		$('#save1').show();
		} 
	
	
	
	
	
	showSelectedTab('pingLink');
	$( "#templateAttachment1" ).change(function() {
		isAttachmentSeleted=1;
		});
	$( "#templateAttachment2" ).change(function() {
		isAttachmentSeleted=1;
		});
	$( "#templateAttachment3" ).change(function() {
		isAttachmentSeleted=1;
		});
	$('#ZeroClipboardMovie_1').attr('title','Copy to clipboard');
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=28,29,32',
		success : function(result) {
			$('#notificationTarget,#useSignature,#useSignatureSMS,#deliveryChannel').empty();
			$('#notificationTarget,#useSignature,#useSignatureSMS,#deliveryChannel').append('<option value="0">--Select--</option>');
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
						 if(codevalueId==29002){
							 $('#useSignature').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
							 $('#useSignatureSMS').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
						 }
					 }
				}else if(codeTypeId==32){
					$('#deliveryChannel').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
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
			else {
				makeEditor('emailBody');
				makeEditor('disclaimer');
				makeEditor('dndTemplate');
			}
				
		}
	});
});

function showTagDetailsList(notifyTarget,section,codevalue){
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/getStandardTags.htm?notifyTarget='+notifyTarget,
		success : function(result) {
			if(section=='email'){
				tagListEmailpopup();
				$('#tagDetailList').empty();
				$('#tagDetailList').append('<li class="strong">'+codevalue+'</li>');
			}else{
				tagListSMSpopup();
				$('#tagDetailListSMS').empty();
				$('#tagDetailListSMS').append('<li class="strong">'+codevalue+'</li>')
			}
			
			$(result).each(function(i,obj) {
				var mappedValue3=obj.mappedValue3;
				var codeValue=obj.codeValue;
				if(section=='email'){
					$('#tagDetailList').append('<li><div class="radio"><label><input type="radio" name="tagradio" class="ace"><span class="lbl" id="'+codeValue+'" onmousedown="copyText(id)"> '+mappedValue3+'</span></label></div></li>');
				}else{
					$('#tagDetailListSMS').append('<li><div class="radio"><label><input type="radio" name="tagradio" class="ace"><span class="lbl" id="'+codeValue+'" onmousedown="copyText(id)"> '+mappedValue3+' </span></label></div></li> ');
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
	var isValidated=true;
	
	if($('#availableTags').val()=='0'){
		addCssStyles('availableTags','Please select Tag');
		isValidated=false;
	}else{
		removeCssStyles('availableTags');
	}
	
	if($('#tagValue').val()=='0'){
		addCssStyles('tagValue','Please select Value for Tag');
		isValidated=false;
	}else{
		removeCssStyles('tagValue');
	}
	
	if(isValidated==true){
		if(!tagList.contains($('#availableTags').val())){
			tagList.push($('#availableTags').val());
			$('#selectedTagList').append('<div class="alertn pull-left label label-success arrowed arrowed-right neswspace1" onclick="removeTag('+$('#availableTags').val()+',this)">'+$('#availableTags option:selected').text()+'='+$('#tagValue option:selected').text()+' <input type="hidden" class="fa fa-close" id="'+$('#availableTags').val()+'-'+$('#tagValue').val()+'" data-dismiss="alert"></input></div>');
		}
		
	}
}

function savePing(isNewPing){
	try{	
	var isValidated=true;
	var isAlertOpen=false;
	var subject=$('#subject').val();
	var emailBody = $('#emailBodyDiv').find('.wysiwyg-editor').text();
	var diclaimer = $('#disclaimerDiv').find('.wysiwyg-editor').text();
	var dnd = $('#dndTemplateDiv').find('.wysiwyg-editor').text();
	var smsBody=$('#smsBody').val();
	console.log('1111111111111111');
	isValidated=validateInputForm('pingForm');
	console.log('2222222222');
	if(isValidated==false){
		isAlertOpen=true;
	}
	
	if($('#deliveryChannel').val()!=32002){
		if(subject==''){
			addCssStyles('subject','Please enter Subject');
			$('#subject').css('border','1px solid red');
			$('#subject').attr('title','Please enter Subject');
			isValidated=false;
			$('#subject_error').removeClass('hide');;
			$('#subject_error').parent().parent().parent().addClass('has-error');
		}else{
			removeCssStyles('subject');
			$('#subject_error').addClass('hide');
			$('#subject_error').parent().parent().parent().removeClass('has-error');
		}
		if($.trim(emailBody)==''){
			$('#emailBodyDiv').css('border','1px solid red');
			$('#emailBodyDiv').attr('title','Please enter Body');
			isValidated=false;
			$('#emailBody_error').removeClass('hide');;
			$('#emailBody_error').parent().parent().parent().addClass('has-error');
		}else{
			$('#emailBodyDiv').css('border','none');
			$('#emailBodyDiv').removeAttr('title');
			$('#emailBody_error').addClass('hide');
			$('#emailBody_error').parent().parent().parent().removeClass('has-error');
		}
	}else{
		if(smsBody==''){
			addCssStyles('smsBody','Please enter Body');
			isValidated=false;
			$('#smsBody_error').removeClass('hide');;
			$('#smsBody_error').parent().parent().parent().addClass('has-error');
		}else{
			removeCssStyles('smsBody');
			$('#smsBody_error').addClass('hide');
			$('#smsBody_error').parent().parent().parent().removeClass('has-error');
		}
	}
	
	if($.trim($('#selectedTagList').html())==''){
		addCssStyles('selectedTagListMessage','Please add at least one tag for this ping');
		$('#selectedTagListMessage').css('color','red');
		isValidated=false;
	}else{
		removeCssStyles('selectedTagListMessage');
		$('#selectedTagListMessage').css('color','#333333');
	}
	
	if(isAlertOpen==false && isValidated==false){
		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	}
	console.log('----2----');
	
	var res=checkSelectedUserInHierarchy();
	if(res==true)
	{
		if(isValidated==true){
		
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
			var regex = new RegExp("(.*?)\.(exe|jar|dll|apk|bat|bin|cmd|com|cpl|gadget|ins|inx|isu|job|jse|lnk|msc|msi|msp|mst|paf|pif|ps1|reg|rgs|sct|shb|shs|u3p|vb|vbe|vbs|vbscript|ws|wsf)$");
			var documentName1 = $('#templateAttachment1').val();
			var documentName2 = $('#templateAttachment2').val();
			var documentName3 = $('#templateAttachment3').val();
			
			if(!(regex.test(documentName1)) && !(regex.test(documentName2)) && !(regex.test(documentName3))) {
				isAttachmentSeleted=1;
				
				$('#pingForm').ajaxForm({
					 success: function(msg) {
			            	var recordCount=msg[0];
			            	var isPingNameExist=msg[1];
			            	if(recordCount!='0'){
			            			if(isNewPing!=1){
			            				localStorage.setItem('actionName', $('#contextPath').val()+'/ping/getPings.htm');
			            				showAlertMessage("Success", "<br/>Ping saved successfully.", "confirmation", redirectFunction);
			            			}else{
			            				localStorage.setItem('actionName', $('#contextPath').val()+'/addPing.htm');
			            				showAlertMessage("Success", "<br/>Ping saved successfully.", "confirmation", redirectFunction);
			            			}
				            		
			            	}else if(isPingNameExist=='1'){
			            		showAlertMessage("Error","This Ping name is already exist in system. Please enter different ping name.", 'error', doNothing);
			            	}
			            },
			            error: function(msg) {
			            }, onComplete: function (data) {
			            }
			        }).submit();
				
	    	}else{
	    		showAlertMessage("Error",
						"Executable Files not allowed. ",
						"error", doNothing);
				$('.ZebraDialog').css('z-index','9999999999999999');
				isAttachmentSeleted=0;
	    	}
			
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
            				localStorage.setItem('actionName', $('#contextPath').val()+'/ping/getPings.htm');
            				showAlertMessage("Success", "<br/>Ping saved successfully.", "confirmation", redirectFunction);
            			}else{
            				localStorage.setItem('actionName', $('#contextPath').val()+'/addPing.htm');
            				showAlertMessage("Success", "<br/>Ping saved successfully.", "confirmation", redirectFunction);
            			}
	            	}else if(isPingNameExist=='1'){
	            		showAlertMessage("Error","This Ping name is already exist in system. Please enter different ping name.", 'error', doNothing);
	            	}
				}
			});
		}
	}
	}
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
				$('#selectedTagList').append('<div class="alertn pull-left label label-success arrowed arrowed-right neswspace1" onclick="removeTag('+notifyTagId+',this)">'+notifyTagName+'='+notifyTagValue+' <input type="hidden" class="fa fa-plus" id="'+notifyTagId+'-'+notifyTagValueId+'" data-dismiss="alert"></input></div>');
				tagList.push(notifyTagId);

			})
			$('#deliveryChannel').change();
			
			makeEditor('emailBody');
			makeEditor('disclaimer');
			makeEditor('dndTemplate');
			
		}
	});
}

function appendTag(section){
	if(section=='email'){
		
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
  <div id="attachmentDivForTest" style="display: none"></div>
</form>
<form id="previewForm" target="_blank" name="previewForm" method="post" action="<%=request.getContextPath()%>/previewPing.htm">
  <input type="hidden" id="partyIdForPreview" name="partyId" value="${sessionScope.userSession.partyId}">
  <input type="hidden" id="deliveryChannelIDForPreview" name="deliveryChannelID">
  <input type="hidden" id="notifyTemplateXMLForPreview" name="notifyTemplateXML">
  <input type="hidden" id="useSignatureIDForPreview" name="useSignatureID">
</form>

</body>
</html>