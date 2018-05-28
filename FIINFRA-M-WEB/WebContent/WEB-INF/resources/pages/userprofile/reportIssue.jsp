<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script>
$(document).ready(function(){
  
    $('.common_in_content').slimScroll();

    $('#reportIssue').validate();
	
  });

</script>
</head>

<body>
<!-- Wrapper starts-->
<div id="report_issue_bx"> 
  <!-- Main starts-->
   <section class="content common_content">
     	 <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
  <section class="main"> 
      <section id="report_issue" class="in_content common_in_content clearfix">
        <div class="clr"></div>
        <form action="${pageContext.request.contextPath}/alert/notifyIssue" id="reportIssue" enctype="multipart/form-data" method="POST">
        <input type="hidden" id="partyName" value="${sessionScope.userSession.name}"/>
		<input type="hidden" id="partyIdHidden" value="${sessionScope.userSession.partyId}"/>
		<input type="hidden" id="buId" value="${sessionScope.userSession.buId}"/>
		<input type="hidden" id="communicationId" value="${sessionScope.userSession.emailCommunicationID}"/>
		<input type="hidden" id="communicationName" value="${sessionScope.userSession.emailCommunicationName}"/>
		<input type="hidden" id="contactMobileSession" value="${sessionScope.userSession.contactMobile}"/>
		<input type="hidden" id="idList" value="${sessionScope.idList}"/>
        <input type="hidden" id="notifyTemplateXMLHeader" name="notifyTemplateXML">
		<input type="hidden" id="deliveryChannelHeader" name="deliveryChannelID" value="32001">
		<input type="hidden" id="useSignatureIDHeader" name="useSignature" value="29001">
		<input type="hidden" id="partyId" name="partyID" value="${userSession.partyId}">
		<input type="hidden" id="partyIdToSendString" name="partyIDString" value="${userSession.partyId}">
        <ul class="third_sec reset clearfix">
          <li class="clearfix rel">
            <label class="common_form_label">Subject</label>
            <input type="text" class="common_input required" id="task_subject" name="task_subject">
          </li>
          <li class="clearfix rel">
            <label class="common_form_label">Your Question</label>
            <textarea name="subject_desc" cols="" rows="" class="common_textarea required" id="subject_desc"></textarea>
          </li>
          <li>
            <label class="common_form_label">Add Attachments</label>
            <ul class="reset clearfix attachment">
              <li class="clearfix">
                <p class="filename" id="first_file_name"><span class="txt"></span><span class="reomve"></span></p>
                <div class="clr"></div>
                <p class="filename" id="second_file_name"><span class="txt"></span><span class="reomve"></span></p>
                <div class="clr"></div>
                <p class="filename" id="third_file_name"><span class="txt"></span><span class="reomve"></span></p>
                <div class="clr"></div>
              </li>
              <li class="clearfix">
                <input type="file" name="templateAttachment" class="jfilestyle" data-icon="false" data-buttonText="Browse"  id="first_file"/>
                <input type="file" name="templateAttachment" class="jfilestyle" data-icon="false" data-buttonText="Browse"  id="second_file"/>
                <input type="file" name="templateAttachment" class="jfilestyle" data-icon="false" data-buttonText="Browse"  id="third_file"/>                
              </li>
            </ul>
          </li>
        </ul>
        
      </section>
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="#" class="anch new_query" onclick="sendLogTicket();"><span class="txt">Send Email</span></a></li>
            <li class="fl list"><a href="#" class="anch delete_query" onclick="back();"><span class="txt">Cancel</span></a></li>
          </ul>
          
        </div>
     <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    </form>
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<!-- For Common Custom File Input--> 
 
<!-- For Common Custom File Input Ends-->
</body>
</html>
<script>

function back(){
	javascript:location.href=document.referrer;
	}

function sendLogTicket(){
	var subject=$('#task_subject').val();
	var qsBody = $('#subject_desc').val();
	var ams=${userSession.partyId};
		
		var notifyTemplateXML='<root>';
		notifyTemplateXML+='<from>'+$('#communicationName').val()+'</from>';
		notifyTemplateXML+='<fromId>'+$('#communicationId').val()+'</fromId>';
		notifyTemplateXML+='<to>'+'techsupport@fiinfra.in'+'</to>';
		notifyTemplateXML+='<cc></cc>';
		notifyTemplateXML+='<bcc></bcc>';
		notifyTemplateXML+='<phone></phone>';
		notifyTemplateXML+='<subject><![CDATA['+subject+']]></subject>';
		notifyTemplateXML+='<body><![CDATA['+qsBody+']]></body>';
		notifyTemplateXML+='<replyTo></replyTo>';
		notifyTemplateXML+='<disclaimerText></disclaimerText>';
		notifyTemplateXML+='<dndText></dndText>';
		notifyTemplateXML+='</root>';
	
	$('#notifyTemplateXMLHeader').val(notifyTemplateXML);
	 $("#reportIssue").submit();				
}

</script>
