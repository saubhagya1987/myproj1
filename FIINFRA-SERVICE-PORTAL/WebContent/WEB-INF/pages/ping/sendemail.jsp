<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Send Notification</title> 
 

<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript">

var hidePopupTimeoutId;
</script>
</head>

<body>

<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
 <!-- Center part start -->
 <div class="page-header" >
          <h1 class="pull-left">Send Mass Email</h1> 
<div class="clearfix"></div>
         </div >
 <section>
     <form class="form-horizontal" id="pingForm" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/ping/sendNotification.htm">
     <input type="hidden" id="hdnbuId" name="hdnbuId" value="${sessionScope.userSession.buId}" />
     <input type="hidden" id="hdnuserId" name="hdnuserId" value="${sessionScope.userSession.userId}" /> 
     <input type="hidden" id="hdnLoggedInContactEmail" name="hdnLoggedInContactEmail" value="${sessionScope.userSession.contactEmail}" />
	 <input type="hidden" id="hdnemailCommunicationName" name="hdnemailCommunicationName" value="${sessionScope.userSession.emailCommunicationName}" />  
			  
       
    <div class="modal-body">
    <!-- Mass Email Start -->
	
    <div class="form-group"  id="notificationTitle">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="Notification" >Notification Target</label>
						<div class="col-xs-12 col-md-4">
							<div class="clearfix">
							<span id="notificationTarget"></span>
							</div>
						</div>
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="Notification">Type</label>
						<div class="col-xs-12 col-md-4">
							<div class="clearfix"></div>
							<span id="type"></span>
						</div>
	</div>
	<div class="space-2"></div>
	
	<div class="form-group" id="emailDetails">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="From">From</label>
						<div class="col-xs-12 col-md-4">
							<div class="clearfix">
								<span id="from"></span>
								<!-- <span id="fromLoggedInContactEmail"></span> -->
							</div>
						</div>
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="Notification">To</label>
						<div class="col-xs-12 col-md-4">
							<div class="clearfix"></div>
							<span id="to"></span>
						</div>
	</div>
	<div class="space-2"></div>
	<div id="email" class="none">
	<div class="form-group" id="email">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="Subject">Subject<span class="red">*</span></label>
						<div class="col-xs-12 col-md-10">
							<div class="clearfix"></div>
							<input type="text" class="form-control" title="Subject" id="subject" name="subject" >
						</div>
	</div>
	<div class="space-2"></div>	
      
      
	<div class="form-group" id="email">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="Body">Body<span class="red">*</span></label>
						<div class="col-xs-12 col-md-10">
							<div class="clearfix"></div>
							<div name="emailBody" id="emailBodyDiv" class="wysiwyg-editor"></div>
						</div>
	</div>
	<div class="space-2"></div>
	
	<div class="row">
	<div class="form-group col-xs-12 col-md-3" style="min-height: 180px;display: none">
                <div class="list-group" id="tagList">
                  	<a class="list-group-item grey">Tag List 
                  	<input class="btn" type="button" id="copy" value="Copy" onclick="closeTagDetailList('email')">
                  	<input class="btn" type="button"  value="Append" onclick="appendTag('email')">
                  	</a>                	
                 </div>
                   <div class="popupnewtag1 none" >
                   <a onClick="closeTagDetailList('email')" style="float: right">
                   <img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
                   <ul id="tagDetailList" style="width: 200px;margin-top: 26px;"></ul> 
                   </div> 
     </div>
     <div class="space-2"></div> 
     </div>
	  
	<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="CC">CC</label>
						<div class="col-xs-12 col-md-4">
							<div class="clearfix"></div>
							 <input type="text" class="form-control" title="CC" id="cc" name="cc" >
						</div>
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="BCC">BCC</label>
						<div class="col-xs-12 col-md-4">
							<div class="clearfix"></div>
						 <input type="text" class="form-control" title="BCC" id="bcc" name="bcc"> 
						</div>
	</div>
	<div class="space-2"></div>
	
	<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="AddAttachments">Add Attachments</label>
						<div class="col-xs-12 col-md-4">
							<div class="clearfix"></div>
							<span id="templateAttachment1Span"> <input type="file" name="templateAttachment" id="templateAttachment1" style="margin-bottom: 5px;"></span><span id="templateAttachment1Name"></span>
			  				<span id="templateAttachment2Span"> <input type="file" name="templateAttachment" id="templateAttachment2" style="margin-bottom: 5px;"></span><span id="templateAttachment2Name"></span>
			   				<span id="templateAttachment3Span"><input type="file" name="templateAttachment" id="templateAttachment3" style="margin-bottom: 5px;"></span><span id="templateAttachment3Name"></span>
						</div>
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="UseSignature">Use Signature</label>
						<div class="col-xs-12 col-md-4">
						<div class="clearfix">
					    <select name="useSignatureID" id="useSignature" class="form-control">
           				</select> 
           				</div>
						</div>
	</div>
	<div class="space-2"></div>
	
	
	<div class="form-group" >
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="Disclaimer">Disclaimer</label>
						<div class="col-xs-12 col-md-10">
						<div class="clearfix"></div>
			    		<div class="wysiwyg-editor" name="disclaimer" id="disclaimerDiv" >	
			    		${sessionScope.userSession.disclaimerText}
						</div>
						</div>
	</div>
	<div class="space-2"></div>
	

	<div class="form-group" >
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="DNDTemplate">DND Template</label>
						<div class="col-xs-12 col-md-10">
						<div class="clearfix"></div>
			    		<div class="wysiwyg-editor" name="dndTemplate" id="dndTemplateDiv" >	
			    		${sessionScope.userSession.disclaimerText}
						</div>
						</div>
	</div>
	<div class="space-2"></div>
	</div>
	<!-- Email END-->    
	
	<!-- SMS Start-->    
	<div id="sms" class="none">
	<div class="form-group" id="phoneNumDiv">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="PhoneNumber">Phone Number</label>
						<div class="col-xs-12 col-md-4">
						<div class="clearfix"></div>
			    		 <input type="text" class="form-control" title="Phone Number" onkeydown="allowIntegersOnly(id,event)" id="phoneNo" name="phoneNo">
						</div>
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="UseSignature">Use Signature</label>
						<div class="col-xs-12 col-md-4">
						<div class="clearfix"></div>
			    		 <select  id="useSignatureSMS" class="form-control">
   						 </select>
						</div>
						</div>
	
	<div class="space-2"></div>
	           
            <div class="col-md-2 searchpadding padding_top none" id="blankdiv">&nbsp;</div>
          	<div class="col-md-4 searchpadding padding_top" style="width: 100%">
           	<span> &nbsp;</span>
          	</div>
          	
      <div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="Body">Body<span class="red">*</span></label>
						<div class="col-xs-12 col-md-10">
							<div class="clearfix"></div>							
							<div name="smsBody" id="smsBody" class="wysiwyg-editor"></div>
						</div>
	</div>
	<div class="space-2"></div>	
   
          	
	<div class="col-md-3 searchpadding padding_top" style="display: none">
                <div class="list-group" id="tagListSMS">
                  	<a class="list-group-item grey">Tag List <input class="btn" type="button" id="copy" value="Copy" onclick="closeTagDetailList('sms')">
                  	<input class="btn" type="button"  value="Append" onclick="appendTag('sms')">
                  	</a>
                </div>
                   <div class="popupnewtag1 none" >
                   <a onClick="closeTagDetailList('sms')" style="float: right"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
                   	<ul id="tagDetailListSMS">
                    	<li> <input id="15Large"  value="15Large" type="checkbox"> Name</li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Email</li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Contact</li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Address</li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Send to </li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Mail to</li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Address</li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Send to </li>
                        <li><input id="15Large"  value="15Large" type="checkbox" > Mail to</li>
                    </ul>
                   </div>
   </div>
   <div class="space-2"></div>
   
   </div>
   <!-- SMS End-->    
   
   <div class="modal-footer">
<!--          <input class="btn dbtn none" type="button" value="Save & New" id="copy" name="Save" >  -->
           	<input class="btn dbtn" type="button" value="Send" id="save" name="Save" onclick="sendEmail()"> 
     		<a onclick="goBack()"><input class="btn dbtn" type="button" value="Cancel" name="Save" ></a> 
     		      
   </div>             
          <!-- center end -->    
 </div>	 
	<input type="hidden" id="notifyTemplateXML" name="notifyTemplateXML">
	<input type="hidden" id="deliveryChannel" name="deliveryChannelID">
	<input type="hidden" id="partyIdToSend" name="partyID" >
	<input type="hidden" id="partyIdToSendString" name="partyIDString" >
</form>            	
</section>           	
<!-- Center part End -->          
<footer>
<jsp:include page="../common/footer.jsp" />
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>	
</footer>


<script>
var isAttachmentSeleted=0;
function enableTf1(){
$('#street1').css('background-color','rgb(255, 255, 255)');
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

$(function() {
	
	makeEditor('emailBodyDiv,#disclaimerDiv,#dndTemplateDiv,#smsBody');
	fileUpload('templateAttachment1,#templateAttachment2,#templateAttachment3');
	var partyIdForNotification=$('#partyIdForNotification').val();

	if(partyIdForNotification=='0'){   
		
		$('#partyIdForNotification').val(localStorage.getItem('partyIdForNotification'));
		$('#nameForNotification').val(localStorage.getItem('nameForNotification'));
		$('#notifyTargetForNotification').val(localStorage.getItem('notifyTargetForNotification'));
		$('#notifyToForNotification').val(localStorage.getItem('notifyToForNotification'));
		$('#notifyType').val(localStorage.getItem('notifyType'));
		$('#isBulk').val(localStorage.getItem('isBulk'));
	}else{ 
		 
		localStorage.setItem('partyIdForNotification',$('#partyIdForNotification').val()); 
		localStorage.setItem('nameForNotification',$('#nameForNotification').val()); 
		localStorage.setItem('notifyTargetForNotification',$('#notifyTargetForNotification').val()); 
		localStorage.setItem('notifyToForNotification',$('#notifyToForNotification').val());
		localStorage.setItem('notifyType',$('#notifyType').val()); 
		localStorage.setItem('isBulk',$('#isBulk').val()); 
	}    
// 	alert(partyIdForNotification)  
	   
		$( "#templateAttachment1,#templateAttachment2,#templateAttachment3" ).change(function() {
		isAttachmentSeleted=1;
		}); 
	$.ajax({    		
		type : "POST",   
		url : $('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=28,29',
		success : function(result) {
			$('#useSignature,#useSignatureSMS').empty();
			$('#useSignature,#useSignatureSMS').append('<option value="0">--Select--</option>');
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
					 
				 if(codevalueId!=29002){
					$('#useSignature').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#useSignatureSMS').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				 }
				 }else if(codeTypeId==32){
					$('#deliveryChannel').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}	 	
			}); 
			
			
			$('#notificationTarget').html($('#notifyTargetForNotification').val());
			//$('#from').html($('#communicationId').val());
			$('#from').html($('#hdnLoggedInContactEmail').val());
			//alert($('#hdnLoggedInContactEmail').val());
			//$('#from').html($('#nameForNotification').val());
			/* alert('from.....'+$('#nameForNotification').val()); */
			$('#toName').html($('#nameForNotification').val());
// 			alert($('#notifyType').val())
			if($('#notifyType').val()=='email'){
				$('#deliveryChannel').val(32001);
				$('#sms').hide();
				$('#email').show();
				if($('#isBulk').val()=='1'){
					$('#to').html($('#notifyToForNotification').val()+'&nbsp;');
				}else{
					$('#to').html($('#notifyToForNotification').val());
				}
				
				$('#emailDetails').show();
				$('#notificationTitle').show();
				$('#type').html('Email');
			}else{
				$('#deliveryChannel').val(32002);  
				$('#sms').show();
				$('#email').hide();
				if($('#isBulk').val()!='1')
				$('#phoneNo').val($('#notifyToForNotification').val());
				else{
					$('#phoneNumDiv').hide();
					$('#blankdiv').hide();
				}
				$('#emailDetails').hide();
				$('#notificationTitle').show();
				$('#type').html('SMS');
				/* $('#emailDetails').hide();
				$('#type,#notificationTitle').html('SMS'); */
			}
			$('#partyIdToSend').val($('#partyIdForNotification').val());
				/* nicEditors.allTextAreas(); */
		}
	});
}); 
  
function showTagDetailsList(notifyTarget,section,codevalue){
	
	alert(notifyTarget);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/getStandardTags.htm?notifyTarget='+notifyTarget,
		success : function(result) {
			if(section=='email'){
				$('#tagDetailList').empty();
				$('#tagDetailList').append('<li>'+codevalue+'</li>');
			}else{
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
				
// 				if(section=='email'){
// 					$('#tagDetailList').append('<li style="height: 34px;"> '+codeValue+' </li>');
// 				}else{
// 					$('#tagDetailListSMS').append('<li style="height: 34px;">'+codeValue+'');
// 				}
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
	}else{
		$('#tagDetailListSMS').parent().hide();
	}
}



function sendEmail(){
	//alert('2..');
	var isValidated=true;
	var isAlertOpen=false;
	var subject=$('#subject').val();
	var emailBody = $('#emailBodyDiv').text();
	var diclaimer = $('#disclaimerDiv').html();//alert('diclaimer......'+diclaimer);
	var dnd = $('#dndTemplateDiv').html();
	var phoneNo=$('#phoneNo').val();
	var smsBody=$('#smsBody').text();
	
	/* isValidated=validateInputForm('pingForm');
	if(isValidated==false){
		isAlertOpen=true; 
	} */
	
	if($('#deliveryChannel').val()!=32002)
	{
		 if(subject=='')
		 { 
			 bootbox.dialog({
					message: "<span class='bigger-110'>Please Enter Subject.</span>",
					buttons: 			
						{
							"click" :
									{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {}
									}
						}
								});
			isValidated=false;
		} 
			if($.trim(emailBody)=='')
			{
					bootbox.dialog({
					message: "<span class='bigger-110'>Please Enter Body.</span>",
					buttons: 			
						{
							"click" :
									{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {}
									}
						}
								});
			isValidated=false;
			}
	}else{
		
		if($('#isBulk').val()!='1')
		{
				if(phoneNo=='')
				{
					bootbox.dialog({
						message: "<span class='bigger-110'>Please Enter Phone number.</span>",
						buttons: 			
							{
								"click" :
										{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {}
										}
							}
									});
				isValidated=false;
				}
		isValidated=false;
		}		
				if(smsBody=='')
				{
					bootbox.dialog({				
					message: "<span class='bigger-110'>Please Enter Body.</span>",
					buttons: 			
						{
							"click" :
									{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {}
									}
						}
								});
					isValidated=false;
				}
		} 
	
	/* if(isAlertOpen==false && isValidated==false){
		alert("There are some validation errors,please check to proceed further.");
	} */
// 	isValidated=false; 
	if(isValidated==true){
		 emailBody = $('#emailBodyDiv').html();
		 diclaimer = $('#disclaimerDiv').html();
		 var sms_body=$('#smsBody').html();
		 dnd = $('#dndTemplateDiv').html();	 
		 fromId =  $('#from').html($('#hdnLoggedInContactEmail').val());
		 /* alert('communication email......'+$('#communicationName').val()); */
		 /* alert('fromId'+fromId+$('#hdnLoggedInContactEmail').val()); */
		 if($('#deliveryChannel').val()==32002){
			$('#useSignature').val($('#useSignatureSMS').val())
		}
		var isBulk=$('#isBulk').val(); 
		if(isBulk=='0'){ 
		var notifyTemplateXML='<root>';
		if($('#deliveryChannel').val()!=32002){
			//alert('in if....');	
			
			notifyTemplateXML+='<from>'+$('#hdnemailCommunicationName').val()+'</from>'; 
			//alert('hdnemailCommunicationName.....'+$('#hdnemailCommunicationName').val());
			notifyTemplateXML+='<from>'+$('#communicationName').val()+'</from>';   
			notifyTemplateXML+='<from>'+fromId+'</from>';  
			 notifyTemplateXML+='<fromId>'+$('#from').html()+'</fromId>'; 
			notifyTemplateXML+='<fromId>'+ fromId +'</fromId>';     
			notifyTemplateXML+='<to>'+$('#to').html()+'</to>';
			notifyTemplateXML+='<cc><![CDATA['+$('#cc').val()+']]></cc>';
			notifyTemplateXML+='<bcc><![CDATA['+$('#bcc').val()+']]></bcc>';
			notifyTemplateXML+='<phone></phone>';
			notifyTemplateXML+='<subject><![CDATA['+$('#subject').val()+']]></subject>';
			notifyTemplateXML+='<body><![CDATA['+$.trim(emailBody)+']]></body>';
			notifyTemplateXML+='<replyTo>'+$('#from').html()+'</replyTo>';
			notifyTemplateXML+='<disclaimerText><![CDATA['+$.trim(diclaimer)+']]></disclaimerText>';
			notifyTemplateXML+='<dndText><![CDATA['+$.trim(dnd)+']]></dndText>';
		}else{
			notifyTemplateXML+='<from></from>'; 
			notifyTemplateXML+='<fromId></fromId>';
			notifyTemplateXML+='<to></to>'; 
			notifyTemplateXML+='<cc></cc>';
			notifyTemplateXML+='<bcc></bcc>';
			notifyTemplateXML+='<phone><![CDATA['+$('#phoneNo').val()+']]></phone>';
			notifyTemplateXML+='<subject></subject>';
			notifyTemplateXML+='<body><![CDATA['+sms_body+']]></body>';
			notifyTemplateXML+='<replyTo></replyTo>'; 
			notifyTemplateXML+='<disclaimerText></disclaimerText>';
			notifyTemplateXML+='<dndText></dndText>';
		} 
		 
		notifyTemplateXML+='</root>';
		}else{
			//alert('in if else....');	
				
			var partyIds=$('#partyIdToSend').val();
			fromId =  $('#from').html($('#hdnLoggedInContactEmail').val());
			//alert($('#hdnLoggedInContactEmail').val());
			$('#partyIdToSend').val(0);
			$('#partyIdToSendString').val(partyIds);
// 			alert(partyIds);
			partyIds=partyIds.split(',');
			var notifyTemplateXML='<root>';
			$(partyIds).each(function(i,obj) {
				 
				notifyTemplateXML+='<queue>';
				if($('#deliveryChannel').val()!=32002){
					/* notifyTemplateXML+='<from>'+$('#communicationName').val()+'</from>'; 
					 notifyTemplateXML+='<from>'+$('#hdnemailCommunicationName').val()+'</from>'; 
					alert('hdnemailCommunicationName.....'+notifyTemplateXML); 
					notifyTemplateXML+='<fromId>'+ fromId +'</fromId>';   
					notifyTemplateXML+='<fromId>'+$('#from').html()+'</fromId>';*/  
					
					notifyTemplateXML+='<from>'+$('#hdnemailCommunicationName').val()+'</from>';  
					//alert('hdnemailCommunicationName.....'+$('#hdnemailCommunicationName').val());   
					notifyTemplateXML+='<fromId>'+ $('#hdnLoggedInContactEmail').val() +'</fromId>';   
					notifyTemplateXML+='<to></to>';
					notifyTemplateXML+='<cc><![CDATA['+$('#cc').val()+']]></cc>';
					notifyTemplateXML+='<bcc><![CDATA['+$('#bcc').val()+']]></bcc>';
					notifyTemplateXML+='<phone></phone>';
					notifyTemplateXML+='<subject><![CDATA['+$('#subject').val()+']]></subject>';
					notifyTemplateXML+='<body><![CDATA['+$.trim(emailBody)+']]></body>';
					notifyTemplateXML+='<replyTo>'+$('#from').html()+'</replyTo>';
					notifyTemplateXML+='<disclaimerText><![CDATA['+$.trim(diclaimer)+']]></disclaimerText>';
					notifyTemplateXML+='<dndText><![CDATA['+$.trim(dnd)+']]></dndText>';
					notifyTemplateXML+='<partyId>'+$.trim(partyIds)+'</partyId>';
				}else{
					notifyTemplateXML+='<from></from>';
					notifyTemplateXML+='<fromId></fromId>';
					notifyTemplateXML+='<to></to>';
					notifyTemplateXML+='<cc></cc>';
					notifyTemplateXML+='<bcc></bcc>';
					notifyTemplateXML+='<phone></phone>';
					notifyTemplateXML+='<subject></subject>';
					notifyTemplateXML+='<body><![CDATA['+$.trim($('#smsBody').html())+']]></body>';
					notifyTemplateXML+='<replyTo></replyTo>';
					notifyTemplateXML+='<disclaimerText></disclaimerText>';
					notifyTemplateXML+='<dndText></dndText>';
					notifyTemplateXML+='<partyId>'+$.trim(partyIds)+'</partyId>';
				}
				notifyTemplateXML+='</queue>';
				
// 				alert(obj);
			});
			notifyTemplateXML+='</root>';
// 			return;
		}
		$('#notifyTemplateXML').val(notifyTemplateXML);
		var action='';
		if($('#notifyTargetForNotification').val()=='Opportunity')
			action='opportunity/getOpportunitiesList.htm';
		else
			/* action='client/getClientList.htm'; */
			action = 'partnersp/loadPartner.htm?buId='+hdnbuId+"&userId="+hdnuserId; 
			 
		 
		var msg1='';
		if($('#notifyType').val()=='email'){
			msg1='Email';
		}else{
			msg1='SMS';
		}
// 		alert(tagList)
// 		return
		if(isAttachmentSeleted==1){			
	
		  $('#pingForm').ajaxForm({	 
			            success: function(msg) {
	            	var recordCount=msg[0];
	            		if(recordCount!='0'){
	            				localStorage.setItem('actionName', $('#contextPath').val()+'/'+action);
	            				bootbox.dialog({				
	            					message: "<span class='bigger-110'>Sent successfully..</span>",
	            					buttons: 			
	            						{
	            							"click" :
	            									{
	            									"label" : "OK!",
	            									"className" : "btn-sm btn-primary",
	            									"callback": function() {
	            										 window.location="<%=request.getContextPath()%>/partnersp/loadPartner.htm";
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
				url : $('#contextPath').val()+'/ping/sendNotification.htm',
				data: $('#pingForm').serialize(),
				success : function(result) {
					var recordCount=result[0];
	            	if(recordCount!='0'){
	            		localStorage.setItem('actionName', $('#contextPath').val()+'/'+action);bootbox.dialog({				
        					message: "<span class='bigger-110'>Sent successfully..</span>",
        					buttons: 			
        						{
        							"click" :
        									{
        									"label" : "OK!",
        									"className" : "btn-sm btn-primary",
        									"callback": function() {
        										 window.location="<%=request.getContextPath()%>/partnersp/loadPartner.htm";
        									}
        									}
        						}
        								});	            			
        			}
				}
			});
		}
	}
	
}



function appendTag(section){
	if(section=='email'){
		$('#emailBodyDiv').html($('#emailBodyDiv').html()+$('#stdtag').val());		
	}else{
		$('#smsBody').html($('#smsBody').val()+$('#stdtag').val());		
		
	}
// 	$('#stdtag').val('')
}
 
 function goBack(){
	 
	 var hdnbuId = $('#hdnbuId').val();
	 var hdnuserId = $('#hdnuserId').val();
	 
	//alert($('#notifyTargetForNotification').val());
	if($('#notifyTargetForNotification').val()=='Opportunity')
		window.location.href=$('#contextPath').val()+'/opportunity/getOpportunitiesList.htm'; 
	else
		/* window.location.href=$('#contextPath').val()+'/client/getClientList.htm'; */
		window.location.href=$('#contextPath').val()+'/partnersp/loadPartner.htm?buId='+hdnbuId+"&userId="+hdnuserId;
}

</script>

	<%
		String partyId = "0";
		String name="";
		String notifyTargetForNotification="";
		String notifyToForNotification="";
		String notifyType="";
		String isBulk="0";
		try {
			partyId = request.getParameter("partyId").toString();
						name =request.getParameter("name")
					.toString();
			notifyTargetForNotification =request.getParameter("notifyTarget")
					.toString();
			notifyToForNotification =request.getParameter("notifyTo")
					.toString();
			notifyType =request.getParameter("notifyType")
					.toString();
			isBulk=request.getParameter("isBulk")
					.toString();
	%>
		<input type="hidden" id="partyIdForNotification" value="<%=partyId%>">	
		<input type="hidden" id="nameForNotification" 	value="<%=name%>">        
		<input type="hidden" id="notifyTargetForNotification" value="<%=notifyTargetForNotification%>">
		<input type="hidden" id="notifyToForNotification" value="<%=notifyToForNotification%>">
		<input type="hidden" id="notifyType" value="<%=notifyType%>"> 
		<input type="hidden" id="isBulk" value="<%=isBulk%>">
	<%
		} catch (Exception e) {
			
		e.printStackTrace();
	%> 
<!-- 	<script>alert('error')</script> -->
		<input type="hidden" id="partyIdForNotification" value="0">
		<input type="hidden" id="nameForNotification" value="">
		<input type="hidden" id="notifyTargetForNotification" value="">
		<input type="hidden" id="notifyToForNotification" value="">
		<input type="hidden" id="notifyType" value="">
		<input type="hidden" id="isBulk" value="0">
	<%
		}
	%>
	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
	<input type="hidden" id="stdtag" value="qqqqqqq">
</body>
</html>