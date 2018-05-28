<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Add/Edit AutoPing</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/ZeroClipboard.js"></script>
	<style type="text/css">
/* .dropdown-menu{
left:-76px !important;   
} */
  
.page-title{margin: 13px 0 0px 8px !important; font-weight: bolder; }  

.  h1{font-family: Arial !important;}
</style>
	
	</head>
	<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<body>
<jsp:include page="../common/header.jsp" />
<!-- Center part start -->
 <section>
<div class="page-title page-header clearfix">
		<h1 class="pull-left">Add/Edit autoping</h1>
		<div class="pull-right">
    					<button id="SPloginhistorybackLink" class="btn btn-sm btn-primary" onClick="goback();">Back</button>    
        				</div>    
        				<div class="space-2"></div>
        				<div class="space-2"></div>
           	<form class="form-search pull-right">
             </form>
          <div class="clearfix"></div>
	</div>
	<div class="widget-box" style="margin-top:10px;">
	  <div class="clearfix"></div>
	   <div class="clearfix"></div>
   <!--   <div class="row"></div> -->
     <div class="row">
		<div class="col-xs-12">
				<form class="form-horizontal" id="autopingForm" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/autoping/saveAutoPing.htm">
				<div class="widget-body">
				<div class="widget-main clearfix">
					<div class="form-group">
						<label class=" col-xs-12 col-sm-2" for="email">AutoPing Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-8">
							<div class="clearfix">
								<input type="text" placeholder="ping name" title="Ping Name" id="pingName" name="name" class="col-xs-12 col-sm-6" />
								
							</div>
						</div>
					</div>

					<div class="space-2"></div>

					<div class="form-group">
						<label class="col-xs-12 col-sm-2" for="password">Purpose of this ping:<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-8">
							<div class="clearfix">
								<input type="text" placeholder="Purpose of this ping" id="purpose" name="description" class="col-xs-12 col-sm-6" />
							</div>
						</div>
					</div>

					<div class="space-2"></div>

					 <div class="form-group">
						<label class="col-xs-12 col-sm-2" for="platform"> Delivery Channel<span class="red">*</span> </label>

						<div class="col-xs-12 col-sm-8">
							<div class="clearfix">
								<select class="col-xs-12 col-sm-6 " name="deliveryChannelID" id="deliveryChannel" class="col-xs-12 col-sm-9"  onchange="enableTf1();" >
								</select>
								
							</div>
						</div>
					</div>

					<div class="space-2"></div>

					<div id="email">

					<div class="form-group">
						<label class="col-xs-12 col-sm-2" for="name">Subject:</label>

						<div class="col-xs-12 col-sm-8">
							<div class="clearfix">
								<input type="text" placeholder="Subject" id="subject" name="subject" class="col-xs-12 col-sm-6" />
							</div>
						</div>
					</div>

					<div class="space-2"></div>

							<div class="row">
									<div class="form-group col-md-12 clearfix">
										<!-- <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="url">Body:<span class="red">*</span></label> -->
				                       <label class="col-xs-12 col-sm-2" for="emailBody" rows="6">Body <span class="red">*</span></label>
										<div class="col-xs-6 col-sm-7" id="emailBodyDiv">
										<div class="widget-box">
											 <div class="clearfix">
										 	<div  class="wysiwyg-editor"  name="emailBody" id="emailBody" style="height: 120px;" ></div> 
											<!--  <div class="wysiwyg-editor" name="emailBody" id="emailBody" style="height: 120px;"></div> -->
											 </div> 
											 </div>
										</div>
										<div class="col-xs-8 col-sm-3" id="tagList">
										
											<div class="widget-box">
												<div class="clearfix" >
												<!-- <div class="widget-header widget-header-flat"> -->
														<h4 class="widget-title smaller">Tag List</h4>
														
														<!--  <div class="widget-toolbar">  -->
														<a class="pull-right">
															<div type="button" class="btn btn-primary btn-xs  createNewBtn"
																onclick="appendTag('email')" title="Append to Body"
																alt="Append to Body">
																<!-- <i class="fa fa-plus"></i> -->Append
															</div>
						
															<div type="button" class="btn btn-primary btn-xs  createNewBtn"
																id="copy" name="Copy" onclick="closeTagDetailList('sms')"
																title="Copy to clipboard" alt="Copy to clipboard">
																<!-- <i class="fa fa-plus"></i> -->Copy
															</div>
														</a>
													<!-- 	</div> -->
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
											
										<!-- </div> -->
					

					<div class="space-2"></div>


					<div class="form-group">
						<label class="col-xs-12 col-sm-2" for="name">CC:</label>

						<div class="col-xs-12 col-sm-8">
							<div class="clearfix">
								<input type="text" placeholder="CC" id="cc" name="cc" class="col-xs-12 col-sm-6" />
							</div>
						</div>
					</div>

					<div class="space-2"></div>

					

					<div class="form-group">
						<label class="col-xs-12 col-sm-2" for="name">BCC:</label>

						<div class="col-xs-12 col-sm-8">
							<div class="clearfix">
								<input type="text" placeholder="BCC" id="bcc" name="bcc" class="col-xs-12 col-sm-6" />
							</div>
						</div>
					</div>

					<div class="space-2"></div>
					
					<div class="form-group">
						<label class="col-xs-12 col-sm-2" for="platform">Use Signature</label>

						<div class="col-md-6">
							<div class="clearfix">
								<select class="input-medium" id="useSignature" class="col-xs-12 col-sm-6" name="useSignatureID">
								
								</select>
							</div>
						</div>
					</div>
					
					<div class="space-2"></div>
					
					
					<!-- <div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Disclaimer:</label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" placeholder="Disclaimer" id="disclaimer" name="disclaimer" class="col-xs-12" />
						
							</div>
						</div>
					</div> -->
					
					<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-xs-12 col-sm-2"
								for="disclaimerDiv">Disclaimer </label>
							<div class="col-xs-6 col-sm-7" id="disclaimerDiv">
							<div class="widget-box">
							<div class="clearfix">
							  <div class="wysiwyg-editor" name="disclaimer" id="disclaimer" style="height: 120px;">
                                   <c:choose>
										<c:when test="${sessionScope.userSession.disclaimerText=='' || sessionScope.userSession.disclaimerText=='<br>'}">If you want to unsubscribe then please email to {!Partner.Email}</c:when>
										<c:otherwise>${sessionScope.userSession.disclaimerText}</c:otherwise>
									</c:choose>
							  </div>
                              </div>
							</div>
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
					

					<div class="space-2"></div>
					
					
					<!-- <div class="form-group">
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">DND Template:</label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<input type="text" placeholder="DND Template" id="dndTemplate" name="dndTemplate" class="col-xs-12 col-sm-6" />
							</div>
						</div>
					</div> -->
					
					
						<div class="row">
						<div class="form-group col-md-12 clearfix">
							<label class="col-xs-12 col-sm-2"
								for="dndTemplateDiv">DND Template</label>
							<div class="col-xs-6 col-sm-7"  id="dndTemplateDiv">
							<div class="widget-box">
                                 <div class="wysiwyg-editor" name="dndTemplate"   id="dndTemplate" style="height: 120px;" >${sessionScope.userSession.dndText}</div>
							</div>
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
					
					
					
					
                 </div>
                 
                 
                 <!-- SMS Start-->
               <div id="sms" style="display:none">
               		<div class="form-group">
						<label class="col-xs-12 col-sm-2" for="subject">User Signature</label>

						<div class="col-xs-12 col-sm-8">
							<div class="clearfix">
							<select id="useSignatureSMS" class="col-xs-12 col-sm-6"></select>
						</div>
					</div>
					</div>
					<div class="space-2"></div>
					
				  
                  					<div class="form-group">
										<label class="col-xs-12 col-sm-2" for="url">Body:<span class="red">*</span></label>
				
										<div class="col-xs-8 col-sm-6">
											<div class="clearfix">
											<textarea class="input-xxlarge col-sm-6"  name="smsBody" id="smsBody" rows="7"></textarea>
											
											</div>
										</div>
									<!-- </div>	
									<div class="form-group"> -->
										<div class="col-xs-8 col-sm-3" id="tagListSMS">
											
											<div class="widget-box">
											<div class="clearfix">
												<!-- <div class="widget-header widget-header-flat"> -->
														<h4 class="widget-title smaller">Tag List</h4>
															<div class="widget-toolbar">
														<a class="pull-right">
																<div type="button" class="btn btn-primary btn-xs  createNewBtn"
																	onclick="appendTag('sms')" title="Append to Body"
																	alt="Append to Body">
																	<!-- <i class="fa fa-plus"></i> -->Append
																</div>
							
																<div type="button" class="btn btn-primary btn-xs  createNewBtn"
																	id="copy" name="Copy" onclick="closeTagDetailList('sms')"
																	title="Copy to clipboard" alt="Copy to clipboard">
																	<!-- <i class="fa fa-plus"></i> -->Copy
																</div>
															</a>
														</div>
													<!-- </div> -->
												</div>		
											</div>
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
						<div class="space-2"></div>
                   </div>
                    <!-- SMS End-->
                  
					<div class="form-group">
						<label class="col-xs-12 col-sm-2" for="name"></label>
						<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<div class="panel panel-default">
										<div class="panel-heading" >
											<span id="selectedTagListMessage">Select the tags to identify  Potential Recipients (target audience for this ping) <span class="red">*</span></span>
										</div>
					  					<div class="panel-body">
					     								 <div class="row">
					  								
												     <div class="col-md-2" >
												     Source <span class="red">*</span>
												     </div>
												      <div class="col-md-6">
												          <select name="source" id="source"  class="form-control" onchange="loadEventTypes(this.value);">
									            			 
									            		  </select>
												      </div>
												      <div class="col-md-6">
												      </div>
												 </div>
												 	<div class="space-2"></div>

											 <div class="row">
					  						         
												     <div class="col-md-2">
												     Event <span class="red">*</span>
												     </div>
												     
												      <div class="col-md-6">
												     	<div  id="selector_cat">
												         <select name="notifyEventID" id="event"  class="form-control"  emsg="event" >
									            			 
								            			  </select>
								            			 </div> 
												      </div>
												     <div class="col-md-6">
												     </div>
												 </div>
					     					
					  					</div>
				  					</div>
			  					</div>
						</div>
						
					</div>

					<div class="space-2"></div> 
												
					<div class="form-group">
	
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="platform"></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<button id="SPAddNewServiceTeamLink" class="btn btn-sm btn-primary"  onclick="savePing(1);" ><!-- <i class='ace-icon fa fa-plus'></i> -->Save & New</button>
								<button id="SPAddNewServiceTeamLink" class="btn btn-sm btn-primary" onclick="savePing(0)" ><!-- <i class='ace-icon fa fa-plus'></i> -->Save & Close</button>
								<a href="<%=request.getContextPath()%>/autoping/getAutoPings.htm" class="btn btn-sm btn-danger" >Close</a>
							</div>
						</div>
					</div>
					</div>
					</div>
					<div class="space-2"></div>
					   <input type="hidden" id="notifyTemplateXML" name="notifyTemplateXML">
						<input type="hidden" id="notifyTemplateID" name="notifyTemplateID" value="0">
						<input type="hidden" id="isAddDisclaimerText" name="AddDisclaimerText" value="false">
						<input type="hidden" id="isAddDNDText" name="AddDNDText" value="false">
				</form>
			</div>
		</div>

  </div>      	
</section>           	
<!-- Center part End -->   

<jsp:include page="../common/footer.jsp" />
<!-- </body> -->
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>


<script type="text/javascript">
function goback() {
	//location.href="loadrole.htm";
	history.back();
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
		  
		}
	//	nicEditors.allTextAreas(); 
	}
});



});



function getPingDetails(notifyTemplateIdHidden){ 
	//alert(notifyTemplateIdHidden);
	$.ajax({
		type : "POST",
	//	url : $('#contextPath').val()+'/ping/getPingDetails.htm?notifyTemplateId='+notifyTemplateIdHidden,
		url : $('#contextPath').val()+'/autoping/getAutoPingEditDetails.htm?notifyTemplateId='+notifyTemplateIdHidden,
		success : function(result) {
			//alert(result);
			$(result).each(function(i,obj) {
				var notifyTemplateID=obj.notifyTemplateID;
				var name=obj.name;
				var description=obj.description;
				var deliveryChannelID=obj.deliveryChannelID;
				var notifyTargetID=obj.notifyTargetID;
				var deliveryChannelID=obj.deliveryChannelID;
				var useSignatureID=obj.useSignatureID;
				var notifyTemplateXML=obj.notifyTemplateXML;
				var eventSourceId=obj.eventSourceId;
				var event=obj.event;
				var notifyEventID=obj.notifyEventID;
				var createdDate=obj.createdDate;
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
				$('#notifyTemplateID').val(notifyTemplateID);
				$("#pingName").val(name);
				$("#purpose").val(description);
				$('#createdOn').html(createdDate);
				$('#deliveryChannel').val(deliveryChannelID);
				if(deliveryChannelID!=32002){
					$('#useSignature').val(useSignatureID);
					$('#subject').val(subject);
					$('#cc').val(cc);
					$('#bcc').val(bcc);
					$('#emailBody').val(body);
					$('#disclaimer').val(disclaimerText);
					$('#dndTemplate').val(dndText);
				}
				else{
					$('#useSignatureSMS').val(useSignatureID);	
//	 				$('#phoneNo').val(phone);
					$('#smsBody').val(body);
				}
				$("#source").val(eventSourceId);
				//alert(notifyEventID);
				
				$('#event').append('<option value="'+notifyEventID+'">'+event+'</option>');
				$('#deliveryChannel').change();
				nicEditors.allTextAreas();
			});
		}
	});
}


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


function appendTag(section){
	if(section=='email'){
		//$('#emailBodyDiv').find('.nicEdit-main').html($('#emailBodyDiv').find('.nicEdit-main').html()+$('#stdtag').val());	
		$('#emailBodyDiv').find('.wysiwyg-editor').html($('#emailBodyDiv').find('.wysiwyg-editor').html()+$('#stdtag').val());	
	}else{
		$('#smsBody').val($('#smsBody').val()+$('#stdtag').val());		
		
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

			$('#selectedTagList').append('<div class="alertn pull-left" onclick="removeTag('+$('#availableTags').val()+',this)">'+$('#availableTags option:selected').text()+'='+$('#tagValue option:selected').text()+'<div class="btn btn-primary btn-xs" id="'+$('#availableTags').val()+'-'+$('#tagValue').val()+'" data-dismiss="alert" value="-" type="button"><i class="fa fa-minus"></i></div></div>');

}


function loadEventTypes(value){
	selectSourceId=value;
	$.ajax({
		type : "GET",
		url:$('#contextPath').val()+'/autoping/selectEventTypes.htm?selectSourceId='+selectSourceId,
		success : function(result) {
			
			$('#event').empty();
			$('#event').append('<option value="" >---select---</option>');
			$(result).each(function(i,obj) {
				var event=obj.event;
				var eventId=obj.eventId;
				$('#event').append('<option value="'+eventId+'">'+event+'</option>');
			});
		}
	});
}
//save autoping
function savePing(isNewPing){
	//	alert('HIIEE');
		
		var deliveryCh=$('#deliveryChannel').val();	
	if(deliveryCh!=32001){
		
		var validator1=$('#autopingForm').validate({
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
			deliveryChannelID:{
				required: true
			},
			
			source:{
				required: true
			},
			notifyEventID:{
				required: true
			} 
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
		//	alert('Hello');
			
			if(validator1.form()){ // validation perform
			//	alert('Hello hi');
				savePing2(isNewPing);
				
			}
		},
		invalidHandler: function (form) {
			
		}
	});
	}else{
		
		var validator2=$('#autopingForm').validate({
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
				deliveryChannelID:{
					required: true
				},
				subject: {
					required: true
				},
				emailBody:{
					required: true
				},
				cc:{
					email:true
				},
				bcc:{
					email:true
				},
				source:{
					required: true
				},
				notifyEventID:{
					required: true
				} 
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
				
				if(validator2.form()){ // validation perform
				//	alert('innnnnnnnnn');
					savePing2(isNewPing);
					
				}
			},
			invalidHandler: function (form) {
				
			}
		});
		
	}
}

function savePing2(isNewPing){
	//	alert('save');
		 diclaimer = $('#disclaimerDiv').val();
		 dnd = $('#dndTemplateDiv').val();		
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
		$('#notifyTemplateXML').val(notifyTemplateXML);
		
		
	 $.ajax({
              type: "POST",
              url :$('#contextPath').val()+"/autoping/saveAutoPing.htm",
              data: $('#autopingForm').serialize(),
              success: function(result) {
            	  var recordCount=result[0];
	            	var isPingNameExist=result[1];
	            	if(recordCount!='0'){
	            		if(isNewPing==0){
            				/* localStorage.setItem('actionName', $('#contextPath').val()+'/autoping/getAutoPings.htm');
            				bootbox.confirm("AutoPing saved successfully ", function(result) {	
            					if(result) {
            						
            						document.getElementById("autopingForm").reset();
        						}
        					});
            				 */
            				bootbox.dialog({
								message: "<span class='bigger-110'>AutoPing saved successfully.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 window.location=$('#contextPath').val()+"/autoping/getAutoPings.htm";
											 document.getElementById("autopingForm").reset();
											//localStorage.setItem('actionName', $('#contextPath').val()+'/ping/getPings.htm');
										}
									}
								}
						});
            				
            				
            			}else if(isNewPing==1){
            				/* localStorage.setItem('actionName', $('#contextPath').val()+'/autoping/addAutoPing.htm');
            				bootbox.confirm("AutoPing saved successfully ", function(result) {
            					if(result) {
            						document.getElementById("autopingForm").reset();
        						}
        					}); */
            				
            				bootbox.dialog({
								message: "<span class='bigger-110'>AutoPing saved successfully.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 window.location=$('#contextPath').val()+"/autoping/addAutoPing.htm";
											// document.getElementById("autopingForm").reset();
											//localStorage.setItem('actionName', $('#contextPath').val()+'/ping/getPings.htm');
										}
									}
								}
						});
            				
            				
            			}
	            	}else if(isPingNameExist=='1'){
	            		/* showAlertMessage("Error","This Ping name is already exist in system. Please enter different ping name.", 'error', doNothing); */
	            		 bootbox.dialog({
								message: "<span class='bigger-110'>This Ping name is already exist in system. Please enter different ping name</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 window.location=$('#contextPath').val()+"/autoping/getAutoPings.htm";
											//localStorage.setItem('actionName', $('#contextPath').val()+'/ping/getPings.htm');
										}
									}
								}
						});
	            	}
              }
		}); 
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

$('#menu-wplook-sub-menu10').addClass('active');
$('#SPAutoPingsLink').addClass('active');
$('#menu-wplook-sub-menu10 ul').css('display', 'block');
</script>
<%
int notifyTemplateId = 0;
try {
	notifyTemplateId = Integer.parseInt(request.getParameter("notifyTemplateId")
			.toString());
	if (notifyTemplateId != 0) {
%>
<input type="text" id="notifyTemplateIdHidden" 
value="<%=notifyTemplateId%>">
<%
}
} catch (Exception e) {
%>
<input type="text" id="notifyTemplateIdHidden" value="0">
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