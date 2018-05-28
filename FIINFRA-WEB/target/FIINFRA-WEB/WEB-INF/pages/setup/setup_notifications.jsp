<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en"><head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Partner Setup -Notification</title>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>

    


<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">






<style>
a{
cursor:pointer;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<script type="text/javascript">
// 	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
<section>
<!--css popup window start 2-->
<div style="display: none;" id="blanket"></div>

   <div class="modal fade" id="templateDiv" class="popUpQuery" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">View Template</h4>
      </div>
      <div class="modal-body" id="view">
       <div class="list-group-item" id="popupwrapper_contactform" >
        	<span  class="searchpadding strong padding_top" style="float:left; width:150px;" >Notification Target  </span>
			<span  class="searchpadding padding_top" style="float:left;" id="notifyTarget"></span>
			        <div class="clearfix"></div>
			<span class="searchpadding strong padding_top" style="float:left; width:150px;" >Type  </span>
			<span  class="searchpadding padding_top" style="float:left; width:300px;" id="notifyType"></span>
			        <div class="clearfix"></div>
			
			<span class="searchpadding strong padding_top" style="float:left; width:150px;">From </span>
			<span  class="searchpadding padding_top" style="float:left; width:300px;" id="notifyFrom"></span>
			        <div class="clearfix"></div>       
			        
			<span class="searchpadding strong padding_top" style="float:left; width:150px;">To </span>
			<span  class="searchpadding padding_top" style="float:left; width:300px;" id="notifyTo"></span>
			        <div class="clearfix"></div> 
			        
			<span class="searchpadding strong padding_top" style="float:left; width:150px;">CC </span>
			<span  class="searchpadding padding_top" style="float:left; width:300px;" id="notifyCc"></span>
			        <div class="clearfix"></div>         
			
			<span class="searchpadding strong padding_top" style="float:left; width:150px;">BCC </span>
			<span  class="searchpadding padding_top" style="float:left; width:300px;" id="notifyBcc"></span>
			        <div class="clearfix"></div>  

			<span class="searchpadding strong padding_top" style="float:left; width:150px;">Use Signature </span>
			<span  class="searchpadding padding_top" style="float:left; width:300px;" id="notifyUseSignature"></span>
			        <div class="clearfix"></div>  
			        
			 <span class="searchpadding strong padding_top" style="float:left; width:150px;">Subject </span>
			<span  class="searchpadding padding_top" style="float:left; width:300px;" id="notifySubject"></span>
			        <div class="clearfix"></div> 
			                                       
			 <span class="searchpadding strong padding_top" style="float:left; width:150px;" id="notifyBodySpan">Body  </span>
			<div  class="searchpadding padding_top" style="width:100%;max-height:190px;overflow:auto;" id="notifyBody"></div>
									
									
          						   
			
			 <div class="clearfix"></div>
        
  
 </div>
      </div>
      
    </div>
  </div>
</div>
    <!-- delete-->
<!--css popup window 2 close-->

  

   


 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="">
    	<div class="page-header clearfix">
                    <h1>Partner Setup</h1>
                    
                  </div>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      
        <!-- center -->
      
      <jsp:include page="sidebar_setup.jsp"></jsp:include>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Notification </a>
               
<div class="list-group-item">
<div class="row">
	<div class="col-md-12 ">
          	 <div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
			                        
    <table id="notificationTable" class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="55%" class="thead"> Name</td>
                      <td width="15%" class="thead"> Type</td>
                      <td width="20%" class="thead">Notifications Target</td>
                      <td width="10%" class="thead">View Template</td>
                    </tr>
                  </table>
              <c:choose>
		      		<c:when test="${sessionScope.userSession.successfulLoginCount eq 0}">
		      		 <table class="table" cellpadding="0" cellspacing="0">
			           <tr>
			             <td colspan="3" align="right" style="border: none !important">
			             <a onclick="redirectToPanel('productrecommendations')"><input id="cancel" class="btn btn-primary btn-xs dbtn" title="Back" type="button" value="Back"/></a> <a onclick="finish()"><input id="cancel" class="btn btn-primary btn-xs dbtn" title="Finish" type="button" value="Finish"/></a>
			             </td>
			           </tr>
			         </table>
		      		</c:when>
	      		<c:otherwise>
	      		<table class="table" cellpadding="0" cellspacing="0">
			           <tr>
			             <td colspan="3" align="right" style="border: none !important">
			             <a onclick="redirectToPanel('productrecommendations')"><input id="cancel" class="btn btn-primary btn-xs dbtn" title="Back" type="button" value="Back"/></a> 
			             </td>
			           </tr>
			         </table>
      		</c:otherwise>
      		</c:choose>
         
		  </div></div>
			<span style="float:right;"><br>
                  </span></div>
        	
     </div>
    </div>
</div>
</div></div>      	<br/><br/>
       	</div>
</section>      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
 <script>
 function ViewTemplate(){
 $("#view").show()
 $("#popUpAlertaddnote").css ('height','500px')
$("#popUpAlertaddnote").css ('width','700px')
 }
 $(function() {
	 $(document).ajaxStop(function() {
			closePopupWebApp('');
		});

		$(document).ajaxStart(function() {
			openPopupWebApp('centerLoadingImage', 25, 35);
		});
	 $('#notifications').css('font-weight','bold');
// 	 nicEditors.allTextAreas();
	 $.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/partner/getNotificationListForPartner.htm",
			success : function(result) {
				$(result).each(function(i,obj) {
					var name=obj.name;
					var notifyTemplateId=obj.notifyTemplateId;
					var notifyTarget=obj.notifyTarget;
					var deliveryChannel=obj.deliveryChannel;
					var notifyTemplateXML=obj.notifyTemplateXML;
					var useSignature=obj.useSignature;
					notifyTemplateXML=notifyTemplateXML.replace("<![CDATA[", "");
					notifyTemplateXML=notifyTemplateXML.replace("]]>", "");
					$('#notificationTable').append('<tr><td width="33%"><span style="display:none" id="useSignature'+notifyTemplateId+'" >'+useSignature+'</span> <span style="display:none"  id="notifyTemplateXML'+notifyTemplateId+'">'+notifyTemplateXML+'</span>'+name+'</td><td width="33%" id="channel'+notifyTemplateId+'">'+deliveryChannel+'</td><td width="33%" id="target'+notifyTemplateId+'">'+notifyTarget+'</td><td width="33%"><a><i class="fa fa-eye size-14" title="View Template" onClick="openTemplate('+notifyTemplateId+')"></i></td></tr>');
                   
				});
			}
		});
})

function openTemplate(templateId){
	 	//$('#templateDiv').show();
		$('#templateDiv').modal('show')
	/*	$('#blanket').show();
		var height = ($(window).height() / 2) - (parseInt($('#templateDiv').css('height'))/2);
		$('#templateDiv').css('top',height);
		var width = ($(window).width() / 2) - (parseInt($('#templateDiv').css('width'))/2);
		$('#templateDiv').css('margin-left', width);
		$('#templateDiv').css('position','fixed');*/
		$('#notifyType').html($('#channel'+templateId).html());
		$('#notifyTarget').html($('#target'+templateId).html());
		$('#notifyUseSignature').html($('#useSignature'+templateId).html());
		var xml = $('#notifyTemplateXML'+templateId).html();
		if($(xml).find('from').text()==''){
			$('#notifyTo').html($(xml).find('phone').text());
		}else{
			$('#notifyTo').html($(xml).find('to').text());
		}
		$('#notifyFrom').html($(xml).find('from').text());
		
		$('#notifyCc').html($(xml).find('cc').text());
		$('#notifyBcc').html($(xml).find('bcc').text());
		$('#notifySubject').html($(xml).find('subject').text());
		
// 		xml=xml.replace("<![CDATA[", "");
// 		xml=xml.replace("]]>", "");
// 		$('#notifyBody').val('');
// 		$('#notifyBody').html('');
// 		$('. nicEdit-main   ').html('');
// 		$('#notifyBodySpan').after('<textarea  id="notifyBody" style="width: 100%; height: 120px;" rows="10" class="editor" placeholder="Notes"> </textarea>');
// 		nicEditors.allTextAreas();
		
// 		alert($(xml).find('body').text())
// 		$('. nicEdit-main   ').html('');
		$('#notifyBody').html(xml.substring(xml.indexOf('</subject>')+10,xml.indexOf('<replyto>')));
// 		nicEditors.findEditor("notifyBody").setContent(xml.substring(xml.indexOf('</subject>')+10,xml.indexOf('<replyto>')));
// 		$('#notifyBody').allTextAreas();
// 		nicEditors.findEditor('notifyBody').attr("contentEditable","false");
		
 }
 function closeTemplateDiv(){
	 $('#templateDiv').hide();
		$('#blanket').hide();
 }
 
 function finish(){
	 localStorage.setItem('isAgreed','false');
	 window.location.href="${pageContext.request.contextPath}//partner/agree.htm";
 }
  </script>
  
</body>
</html>