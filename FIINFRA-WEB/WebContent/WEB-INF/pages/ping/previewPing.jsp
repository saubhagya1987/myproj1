<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="in.fiinfra.common.partner.LocationData"%>
<%@page import="in.fiinfra.common.partner.PartnerHeirarchyData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Preview</title>
<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
request.setAttribute("_cdn", cdn);
%>
<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${_cdn}/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${_cdn}/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->

<%
		int partyId = 0;
		int deliveryChannelID=0;
		String notifyTemplateXML="";
		int useSignatureID=0;
		try {
			partyId = Integer.parseInt(request.getParameter("partyId")
					.toString());
			deliveryChannelID = Integer.parseInt(request.getParameter("deliveryChannelID")
					.toString());
			useSignatureID = Integer.parseInt(request.getParameter("useSignatureID")
					.toString());
			notifyTemplateXML = request.getParameter("notifyTemplateXML")
					.toString();
			System.out.print("notifyTemplateXML:------"+notifyTemplateXML);
			if (partyId != 0) {
	%>
<form id="previewForm" target="_blank" name="previewForm" method="post" action="<%=request.getContextPath()%>/previewPing.htm">
  <input type="hidden" id="partyIdForPreview" name="partyID" value="<%=partyId%>">
  <input type="hidden" id="deliveryChannelIDForPreview" name="deliveryChannelID" value="<%=deliveryChannelID%>">
  <input type="hidden" id="notifyTemplateXMLForPreview" name="notifyTemplateXML" value="0">
  <input type="hidden" id="useSignatureIDForPreview" name="useSignatureID" value="<%=useSignatureID%>">
</form>
<%
		}
		} catch (Exception e) {
	%>
<form id="previewForm" target="_blank" name="previewForm" method="post" action="<%=request.getContextPath()%>/previewPing.htm">
  <input type="hidden" id="partyIdForPreview" name="partyID" value="0">
  <input type="hidden" id="deliveryChannelIDForPreview" name="deliveryChannelID" value="0">
  <input type="hidden" id="notifyTemplateXMLForPreview" name="notifyTemplateXML" value="0">
  <input type="hidden" id="useSignatureIDForPreview" name="useSignatureID" value="0">
</form>
<%
		}
	%>



<script>

$(function() {
	$('#termsofuse').css('font-weight','bold');
	$('#notifyTemplateXMLForPreview').val('<%=notifyTemplateXML%>');
	if($('#partyIdForPreview').val()==0){
		$('#partyIdForPreview').val(localStorage.getItem('partyIdForPreview'));
		$('#deliveryChannelIDForPreview').val(localStorage.getItem('deliveryChannelIDForPreview'));
		$('#notifyTemplateXMLForPreview').val(localStorage.getItem('notifyTemplateXMLForPreview'));
		$('#useSignatureIDForPreview').val(localStorage.getItem('useSignatureIDForPreview'));
	}else{
		localStorage.setItem('partyIdForPreview',$('#partyIdForPreview').val());
		localStorage.setItem('deliveryChannelIDForPreview',$('#deliveryChannelIDForPreview').val());
		localStorage.setItem('notifyTemplateXMLForPreview',$('#notifyTemplateXMLForPreview').val());
		localStorage.setItem('useSignatureIDForPreview',$('#useSignatureIDForPreview').val());
	}
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/ping/getResolvedTagsTemplateXML.htm',
		data: $('#previewForm').serialize(),
		success : function(obj) {
			var notifyTemplateXML=obj.notifyTemplateXML;
			var signature=obj.signature;
			var logo=obj.logo;
			console.log('notifyTemplateXML:----'+notifyTemplateXML)
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
			if($('#deliveryChannelIDForPreview').val()==32001){
			$('#from').html('&nbsp;'+from+'&lt;'+fromId+'&gt;');
			$('#to').html('&nbsp;'+to);
			$('#cc').html('&nbsp;'+cc);
			$('#bcc').html('&nbsp;'+bcc);
			$('#subject').html('&nbsp;'+subject);
			body+='<br/><br/>'+signature;
			body+='<br/><img src="${pageContext.request.contextPath}/app/images'+logo+'" onerror="$(this).remove()" width="200px;">';
			body+='<br/><br/>'+disclaimerText;
			body+='<br/><br/>'+dndText;
			
			$('#body').html('&nbsp;'+body);
			$('#sms').hide();
			}else{
				$('#phoneNo').html(phone);
				$('#sms').show();
				$('#email').hide();
				body+='<br/><br/>'+signature;
				$('#body').html('&nbsp;'+body);
			}

			$('body').show();
		}
	
	});
	
	
})
</script>
<style>
.greyborder {
	border-top: 1px solid #ddd;
	border-left: 1px solid #ddd;
}
.greyborderright {
	border-right: 1px solid #ddd;
}
.greyborderbottom {
	border-bottom: 1px solid #ddd;
}
</style>
<link rel="stylesheet" href="${_cdn}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fontcustom.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/ui.jqgrid.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${_cdn}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${_cdn}/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${_cdn}/assets/css/ace-ie.css" />
		<![endif]-->
<link rel="stylesheet" href="${_cdn}/assets/css/custom.css"/>
<link rel="stylesheet" href="${_cdn}/assets/css/custom_responsive.css">

<!-- ace settings handler -->
<script src=" ${_cdn}/assets/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src=" ${_cdn}/assets/js/html5shiv.js"></script>
		<script src=" ${_cdn}/assets/js/respond.js"></script>
		<![endif]-->

<!-- Center part start -->
</head>
<body class="no-skin" style="display:none;background:#fff">
<section>
<div class="container">
<div class="page-header  clearfix">
            <h1 class="pull-left">Ping Preview</h1>
          </div>
    
    <div class="container-body " style="padding:5px;"> </div>
    <div class="container-body page-content">
      <div id="email"> 
        <!-- center -->
       <div class="row"> <div class="col-md-1 searchpadding padding_top greyborder strong padnorth1 padsouth1">From :</div>
        <div class="col-md-11 searchpadding padding_top greyborder greyborderright padnorth1 padsouth1" > <span   style="border:none;width:100%" id="from"></span> </div></div>
        <!--row 1 end -->
       <div class="row"> <div class="col-md-1 searchpadding padding_top greyborder strong padnorth1 padsouth1">To :</div>
        <div class="col-md-11 searchpadding padding_top greyborder greyborderright padnorth1 padsouth1"> <span  style="border:none;width:100%" id="to"></span> </div></div>
        <!--row 2 end -->
       <div class="row"> <div class="col-md-1 searchpadding padding_top greyborder strong padnorth1 padsouth1">CC :</div>
        <div class="col-md-11 searchpadding padding_top greyborder greyborderright padnorth1 padsouth1"> <span  style="border:none;width:100%" id="cc"></span> </div></div>
       <div class="row"> <div class="col-md-1 searchpadding padding_top greyborder strong padnorth1 padsouth1">BCC :</div>
        <div class="col-md-11 searchpadding padding_top greyborder greyborderright padnorth1 padsouth1"> <span  style="border:none;width:100%" id="bcc"></span> </div></div>
        <div class="row"><div class="col-md-1 searchpadding padding_top greyborder strong padnorth1 padsouth1">Subject :</div>
        <div class="col-md-11 searchpadding padding_top greyborder greyborderright padnorth1 padsouth1"> <span  style="border:none;width:100%" id="subject"></span> </div>
</div>      </div>
      <div id="sms" class="row" style="display: none">
        <div class="col-md-1 searchpadding padding_top greyborder strong padnorth1 padsouth1">Phone Number :</div>
        <div class="col-md-11 searchpadding padding_top greyborder greyborderright padnorth1 padsouth1"> <span  style="border:none;width:100%" id="phoneNo"></span> </div>
      </div>
      <!--row 3 end -->
      <div class="row"><div class="col-md-1 searchpadding padding_top greyborder greyborderbottom strong padnorth1 padsouth1" id="bodyLable" style="height: 350px;">Body :</div>
      <div class="col-md-11 searchpadding padding_top greyborder greyborderright greyborderbottom padnorth1 padsouth1" id="bodyDiv" style="height: 350px;overflow: auto;margin-bottom: 10px;"> <span style="border:none;width:100%" id="body"></span> </div></div>
      <div class="row"><div class="col-md-1 searchpadding padding_top padnorth1 padsouth1"></div>
      <div class="col-md-11s searchpadding padding_top padnorth1 padsouth1">
        <input type="button" value="Close" class="btn btn-xs btn-primary" onclick="window.close()" style="float: right">
      </div></div>
      <!-- center --> 
    </div>
  </div>
</section>

<!-- Center part End -->

<jsp:include page="../common/footer.jsp" />

</body>
</html>