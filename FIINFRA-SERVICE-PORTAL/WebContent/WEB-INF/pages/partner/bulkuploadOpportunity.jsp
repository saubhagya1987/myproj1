<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Bulk Upload Opportunity</title>

<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>-->

<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
<%-- <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" /> --%>
<!-- -responsive css-->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>-->
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script> --%>
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>-->
<%-- <script src="<%=request.getContextPath()%>/js/common.js"></script> --%>

<%-- <link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/zebra_dialog.css" type="text/css"> --%>

<!-- <style>
.panel {
margin-top: 20px !important;
}

#ui-id-1{
	width:168px!important;
	padding-left:20px!important;}
#ui-id-2{
	width:168px!important;
	padding-left:24px!important;}
.ui-menu-item{
list-style:none !important;}
.ui-corner-all{
margin-left:-10px!important;}
.ui-helper-hidden-accessible{color:#000;}

table#investmentAssetSummary tr:hover {
	background: #F2F2F2;
}

table.old-school th {
	padding: 5px 3px !important;
	border-left: 0px solid #ccc;
}

table.old-school tr:nth-child(2n) {
	background: none !important;
}
.old-school th {
	border-right: 1px solid !important;
	border-bottom: 1px solid !important;
	border-top: 1px solid !important;
	border-color: #D7D7D7 !important;
}

.old-school td {
	border-right: 1px solid;
	border-bottom: 1px solid;
	border-color: #D7D7D7 !important;
	text-align: right;
}

.investment_links {
	text-align: left !important;
	border-left: 1px solid;
	border-color: #D7D7D7;
}

.last_row {
	border-right-color: rgb(199, 199, 199) !important;
	border-left-color: rgb(199, 199, 199) !important;
}

.leftCell {
	border-left: 1px solid !important;
	border-color: #D7D7D7 !important;
}






</style>  -->
<!-- <script>
// 	$(document).ready(function() {
// 		logicForBackbutton();
// 		$("#10").attr('class', 'active');
		
// 		$( "#target" ).submit(function( event ) {
			 
// 		});
// 	});
</script> -->
<script type="text/javascript">
// 	var isValidSearch = true;
	/* $(document).ready(function() {
// 		alert('Hi');
// 		 $("#container").removeAttr('style');
// 		 $("#container").attr("style", "");
// 	});
// 		(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
// 		$(document).ajaxStop(function() {
// 			closePopupWebApp('');
		}); */

// 		$(document).ajaxStart(function() {
// 			openPopupWebApp('centerLoadingImage', 25, 35);
// 		});
// 		$.ajax({
// 			type : "POST",
// 			url : $('#contextPath').val()+'/emtypObjectsLeadBulkupload',
// 			success : function(result) {
				
// 			}
		
		
		//alert($('#statusMessage').val())
		
		/* if($('#statusMessage').val()=='success')
		{
			
//				alert('${statusMessage}');
			
			showAlertMessage('Message', 'Bulk Upload process has completed. Please scroll down to view processing details.', 'information',
						doNothing);
			$('.ZebraDialog').css('height','196px');
			var height = ($(window).height() / 2) - (parseInt($('.ZebraDialog').css('height')) / 2);
			var width = ($(window).width() / 2)- (parseInt($('.ZebraDialog').css('width')) / 2);
			
//	 		alert($(window).height() / 2+'---------'+(parseInt($('.ZebraDialog').css('height')) / 2));
			$('.ZebraDialog').css('top', height);
//				var message='${statusMessage}';
//				alert('message='+message);
//				if(message=='Lead Created Successfully !!!'){
//					showAlertMessage('Message', 'Lead Created Successfully !!!', 'information',
//							doNothing);
//				}
		} */
 		

// 		$("#2").attr('class', 'active');

// 		$(".even").css({
// 			"background-color" : "#EFEFEF !important"
// 		});
// 		$('#photograph_browse').on('change', function() {
// 			//  document.getElementById('fileUploadMessage').innerHTML='';
// 			bulkUplod();
// 		});
// 		$('#success_lead_table a').each(function(i,obj) {
// 			temp = $(obj).attr("href");
// 			var start = temp.indexOf("?");
// 			temp = temp.substring(start);
// 			url = '${pageContext.request.contextPath}/successleads';
// 			$(obj).attr("href",url+temp);
// 			//$(obj).attr("onclick","refreshDiv('"+url+temp+"')");	
// 		});
		
// 		$('#existing_lead_table a').each(function(i,obj) {
// 			temp = $(obj).attr("href");
// 			var start = temp.indexOf("?");
// 			temp = temp.substring(start);
// 			url = '${pageContext.request.contextPath}/successleads';
// 			$(obj).attr("href",url+temp);
// 			//$(obj).attr("onclick","refreshDiv('"+url+temp+"')");	
// 		});


 	function validateData(){
// 		if($('#userType').val()==95006){
// 			if($('#partnerList').val()==0){
// 				showAlertMessage("Error", "Please select Partner.", "error", doNothing);
// 			}
// 			else{
				
	
 			if($('#leadUploadFileName_browse').val()=='')
 			 {
 			        alert("Please Select File");
 					//doNothing);
 			         $("#statusMessage").empty();
 		     }
 			else
 			{
					var uploadFile=$('#leadUploadFileName_browse').val();
					/*   var filename = uploadFile.replace(/^.*\\/, "");
					  uploadFile=$('#leadUploadFileName_browse').val(); */
					 /*  var url = document.getElementById("leadUploadFileName_browse").value;
				         var filename = url.replace(/^.*\\/, "");
				         $('#leadUploadFileName_browse').val(filename); */
  					alert('File Name----'+$('#leadUploadFileName_browse').val());
 					var sFileExtension = uploadFile.split('.')[uploadFile.split('.').length - 1].toLowerCase();
//  					alert('sFileExtension--***-'+sFileExtension);
 					
 					if (!(sFileExtension === "xls" || sFileExtension === "xlsx")) { 				           
//  				            txt += "Please make sure your file is in xls or xlsx format";
//  				            alert('Please make sure your file is in xls or xlsx format');
 				          
 				          alert("Message", "Please make sure your file is in xls or xlsx format.");
 					}else{
//  						alert('Else');	
 						$('#success_lead_table').empty();
 						$('#bulkUploadForm').submit();
 					} 			
				
// 					alert("Hi");
// 					$.ajax({
// 						type : 'POST',
// 						url : $('#contextPath').val()+"/opportunity/importBulkOpportunities.htm?partyId="+partyId+"&buId="+buId,
								
// 						success : function(result) {
// 							//alert(result);
// 							alert('Below URl');
// 							if(result==1){
// 								localStorage.setItem('actionName',
// 										window.location.pathname);
// 								showAlertMessage1("Success",
// 										"<br/>"+" Imported. ",
// 										"confirmation", redirectFunction1);
								
// 							}else{
// 								showAlertMessage1("Error",
// 										"<br/>"+" Failed ",
// 										"error", doNothing);
// 							}
							
// 						}
// 					});
				//	$('#success_lead_table').empty();
				//	$('#bulkUploadForm').submit();
				 
// 					document.getElementById('contaniner').style.display = "block"; 
 				     //  $("#target").submit();
 			}
 		
 			
}

			
// 		}else{
// 			if($('#leadUploadFileName_browse').val()=='')
// 			 {
// 		         showAlertMessage('Message', 'Please Select File ', 'information',
// 					doNothing);
// 		         $('#statusMessage').empty();
// 	         }
// 			else
// 				{
			
// 			       $('#target').submit();
// 				}
// 		}
		
		
// 	}
	
function downloadAttachmentDownload() {
	window.location.href= $('#contextPath').val()+'/common/downloadAttachmentDownload.htm';
}	
	
</script>
</head>

<body>


	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<%-- <jsp:include page="../common/common_popup.jsp" /> --%>

	<div class="bread-crumb" style="margin-left: 10px">
<!-- 		<span class="youAre">You are here:</span> <span class="place"> -->
<!-- 			Opportunities in Bulk</span> -->
		<div class="lightSep"></div>
	</div>
	<!-- END bread-crumb -->

	<div class="center">
		<div class="container white" style="min-height: 600px">
    		<div class="container-head">
<!-- 		<div class="container"> -->
<!-- 			<div class="container-head"> -->
				Add Opportunities in Bulk
			</div>
			<div class="container-body group" style="width: 100% !important">
			<div class="action-buttons" style="margin-left:  95% !important">
<%-- 			<a href="javascript:back();"><img alt="" src="<%=request.getContextPath()%>/images/back.png">Back</a> --%>
			</div>
				<div class="heading1" style="margin-bottom: 25px;">
<!-- 					<div class="horizontal-sep" style="border-bottom: 1px solid #e1e1e1; height: 1px; padding-top: 10px;"></div> -->
<!-- 					<h2>Add	Opportunities in Bulk</h2> -->
				</div>
				
	
						<form id="bulkUploadForm" method="post"  action="<%=request.getContextPath() %>/partnersp1/importBulkOpportunities.htm"
							enctype="multipart/form-data" name="bulk_upload_form" >
							
<!-- 							<s:if test="%{#session.userType == 95006}"> -->
<!-- 							<div class="group"> -->
<!-- 									<label for="" class="desc" style="text-align: left;width: 70px;">Partner :</label> <select  -->
<!-- 									id="partnerList" name="partyId"></select> -->
<!-- 								</div> -->
<!-- 							</s:if> -->


							<div class="group" style="position: relative;">
								<label for="" class="desc" 	style="text-align: left !important; float: left; width: 165px;">
								Browse File From here :  </label> 
								<span id="browse_span" style="float: left;">
										<input type="file" name="leadUpload" id="leadUploadFileName_browse"  readonly="readonly">
										<b style="position: relative; top: -24px"></b>
											<!-- <div class="clearfix"></div>
												<div class="clearfix"></div>
													<div class="clearfix"></div> -->
										<input type="button" onclick="validateData()" class="submit" style=" margin-top: 8px !important" value="Upload" title="Upload Records in Bulk from Selected File"/>		
										  <a href="<%=request.getContextPath()%>/partnersp/getOpportunitiesList.htm"> <input class="submit" type="button" value="Cancel" name="Cancel"></a>  
										<!-- <input type="button" 
											href="<%=request.getContextPath()%>/partnersp/getOpportunitiesList.htm?partyId=" class="submit" style=" margin-top: 8px !important" value="Cancel"/> -->		
								</span>	
										</div>
							
</form>
		<span style="margin-left: 300px; margin-top: 18px;">
			<b>Download file -</b> 
				<a onclick="downloadAttachmentDownload()" title="Download Sample Template to upload Opportunities in Bulk">OpportunityBulkUploadTemplate.xls</a></span>				</div>

			
	
						
<!-- <s:if test="%{lstSuccessOpportunity.size() = 0}"> -->
<!-- <div class="container" style="display: none;">	 -->
<!-- </s:if>						 -->

<!-- <s:if test="%{lstFailedOpportunity.size() = 0}"> -->
<!-- <div class="container" style="display: none;"> -->
<!-- </s:if> -->

<!-- <s:if test="%{lstExistingOpportunity.size() = 0}"> -->
<!-- <div class="container" style="display: none;"> -->
<!-- </s:if>	 -->

					
 <s:if test="%{lstSuccessOpportunity.size() > 0}">
<div class="container">	
<div class="row">
<div class="col-md-12">	
<div id="no_record_hide">
<input type="hidden" id="statusMessage" value="success">
	<div id="validRecordList" >
	<div class="panel panel-default" style="width: 96%">
		<div class="panel-heading">Successful Records</div></div>
<!-- 		<h2>Successful Records</h2> -->
	<div class="panel-body">
	
	<div class="table-responsive" style="overflow-x: auto; overflow-y: hidden; width: 95% " id="success_lead_table">
			<table id="grid-table1"></table>
			<div id="grid-pager1"></div>
			
			
			
			
			
		<%-- <display:table name="lstSuccessOpportunity" uid="objPortalUser" class="table table-hover table-bordered table-striped"  sort="list" id="data">
			<display:column sortable="true" property="firstName" title="	First Name	  "/>
			<display:column sortable="true" property="lastName" title="	Last Name	  "/>		
			<display:column sortable="true" property="contactEmail" title="	Email	  "/>
			<display:column sortable="true" property="contactMobile" title="	Mobile	  "/>
		</display:table> --%>
		</div>
	</div>
	</div>
</div>
</div>
</div>
</div>
 </s:if> 
<!-- <!-- End Successful records Container Div --> 
	
 <s:if test="%{lstFailedOpportunity.size() > 0}"> 

<div class="container">	
<div class="row">
<div class="col-md-12">
<input type="hidden" id="statusMessage" value="success">
<div id="lstInvalidLeads">

	<div class="panel panel-default" style="width: 96%">
		<div class="panel-heading">Failed Records</div></div>

	<div class="panel-body">
	<div class="table-responsive" style="overflow-x: auto; overflow-y: hidden; width: 95%" id="failed_lead_table">
		 		
		<span style="color:grey">One or more mandatory details are missing in the Failed Records list given below. Please fix and upload again</span>
		<br/>
						<table id="grid-table2"></table>
						<div id="grid-pager2"></div>
		

		<%-- <display:table name="lstFailedOpportunity" uid="objPortalUser" class="table table-hover table-bordered table-striped"  sort="list" id="data">
			<display:column sortable="true" property="firstName" title="	First Name	  "/>
			<display:column sortable="true" property="lastName" title="	Last Name	  "/>		
			<display:column sortable="true" property="contactEmail" title="	Email	  "/>
			<display:column sortable="true" property="contactMobile" title="	Mobile	  "/>		
		</display:table> --%>
	</div>
	</div>
 	</div> 
</div>
</div>
</div>
</s:if> 

<!-- End Of mandatoray miss div Records -->

	
				</div>
				
				
				
				<br /> <br /> 
	</div>
	

<!-- 	</div> -->





<script type="text/javascript"> 
	var grid_data1 = ${lstSuccessOpportunity};
	//var data1size=grid_data1.length();
	alert('In-----Data1--'+grid_data1);
	var grid_data2 = '${lstFailedOpportunity}';
	//var data2size=grid_data2.length();
	alert('In-----Data2--'+grid_data2);
// var grid_data = 
// 	[ 
// 		{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action'  onclick=''>Action </a>",comments:""},
// 		{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action' href='' onclick=''>Action </a>",comments:""},
// 		{name:"Ajit Godbharle",rm:"Harshvardhan Chaudhari",city:"Pune",date:"2007-12-03",email:"11hkachoria@gmail.com", contact:"7865366768",dc_status:"Yes",stage:"<div class='progress pos-rel' data-percent='66%'><div class='progress-bar' style='width:66%;'></div></div>",action:"<a class='action' href='' onclick=''>Action </a>",comments:""},
		
// 	];
	//grid_data='${opportunityDatas}';
	//console.log('grid_data:---'+grid_data);
	var subgrid_data = 
	[
	 {id:"1", name:"sub grid item 1", qty: 11},
	 {id:"2", name:"sub grid item 2", qty: 3},
	 {id:"3", name:"sub grid item 3", qty: 12},
	 {id:"4", name:"sub grid item 4", qty: 5},
	 {id:"5", name:"sub grid item 5", qty: 2},
	 {id:"6", name:"sub grid item 6", qty: 9},
	 {id:"7", name:"sub grid item 7", qty: 3},
	 {id:"8", name:"sub grid item 8", qty: 8}
	];
	
	jQuery(function($) {
		var grid_selector1 = "#grid-table1";
		var grid_selector2 = "#grid-table2";
		var pager_selector1 = "#grid-pager1";
		var pager_selector2 = "#grid-pager2";
		
		//resize to fit page size
		$(window).on('resize.jqGrid', function () {
		//	$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
	    })
		//resize on sidebar collapse/expand
		var parent_column = $(grid_selector1).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    })
		
		//if your grid is inside another element, for example a tab pane, you should use its parent's width:
		/**
		$(window).on('resize.jqGrid', function () {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		})
		//and also set width when tab pane becomes visible
		$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  if($(e.target).attr('href') == '#mygrid') {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		  }
		})
		*/
		
		
	
	
		jQuery(grid_selector1).jqGrid({
			//direction: "rtl",
// 			url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}',
			//subgrid options
			subGrid : false,
			//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
			//datatype: "xml",
			subGridOptions : {
				//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
				minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
				openicon : "ace-icon fa fa-chevron-right center orange"
			},
			//for this example we are using local data
			subGridRowExpanded: function (subgridDivId, rowId) {
				var subgridTableId = subgridDivId + "_t";
				$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
				$("#" + subgridTableId).jqGrid({
					datatype: 'local',
					data: subgrid_data,
					colNames: ['No','Item Name','Qty'],
					colModel: [
						{ name: 'id', width: 50 },
						{ name: 'name', width: 150 },
						{ name: 'qty', width: 50 }
					]
				});
			},
			
				data : grid_data1,
				datatype: "local",
				height: 250,
				colNames:['First Name','Last Name', 'Email','Mobile'],
				colModel:[
					
					{name:'firstName',index:'firstName',width:120,},
					{name:'lastName',index:'lastName',width:120,},
					{name:'contactEmail',index:'contactEmail', width:100,},
					{name:'contactMobile',index:'contactMobile', width:120,},
					

				], 
				
				
				
				
				
				
			
	
	
			//data: grid_data,
			
			jsonReader : {
				root : "rows",
				repeatitems : false,
				page : "page",
				total: "total",
				records : "records",
				id : "partyId",
				cell : "cell",
				},

	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100,1000],
			pager : pager_selector1,
			altRows: true,
			//toppager: true,
			
			//multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
				
			editurl: "/dummy.html",//nothing is saved
			caption: ""
	
			,autowidth: true,
            shrinkToFit:false,	
	
			/**
			,
			grouping:true, 
			groupingView : { 
				 groupField : ['name'],
				 groupDataSorted : true,
				 plusicon : 'fa fa-chevron-down bigger-110',
				 minusicon : 'fa fa-chevron-up bigger-110'
			},
			caption: "Grouping"
			*/
	
		});
		
		
		var parent_column1 = $(grid_selector2).closest('[class*="col-"]');
		$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
			if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
				//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
				setTimeout(function() {
				//	$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
				}, 0);
			}
	    })
		
		//if your grid is inside another element, for example a tab pane, you should use its parent's width:
		/**
		$(window).on('resize.jqGrid', function () {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		})
		//and also set width when tab pane becomes visible
		$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  if($(e.target).attr('href') == '#mygrid') {
			var parent_width = $(grid_selector).closest('.tab-pane').width();
			$(grid_selector).jqGrid( 'setGridWidth', parent_width );
		  }
		})
		*/
		
		
	
	
		jQuery(grid_selector2).jqGrid({
			//direction: "rtl",
// 			url:$('#contextPath').val()+'/opportunity/getOpportunitiesGrid.htm?value=${value}',
			//subgrid options
			subGrid : false,
			//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
			//datatype: "xml",
			subGridOptions : {
				//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
				minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
				openicon : "ace-icon fa fa-chevron-right center orange"
			},
			//for this example we are using local data
			subGridRowExpanded: function (subgridDivId, rowId) {
				var subgridTableId = subgridDivId + "_t";
				$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
				$("#" + subgridTableId).jqGrid({
					datatype: 'local',
					data: subgrid_data,
					colNames: ['No','Item Name','Qty'],
					colModel: [
						{ name: 'id', width: 50 },
						{ name: 'name', width: 150 },
						{ name: 'qty', width: 50 }
					]
				});
			},
			
				data : grid_data2,
				datatype: "local",
				height: 250,
				colNames:['First Name','Last Name', 'Email','Mobile'],
				colModel:[
					
					{name:'firstName',index:'firstName',width:120,},
					{name:'lastName',index:'lastName',width:120,},
					{name:'contactEmail',index:'contactEmail', width:100,},
					{name:'contactMobile',index:'contactMobile', width:120,},
					

				], 
				
				
				
				
				
				
			
	
	
			//data: grid_data,
			
			jsonReader : {
				root : "rows",
				repeatitems : false,
				page : "page",
				total: "total",
				records : "records",
				id : "partyId",
				cell : "cell",
				},

	
			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100,1000],
			pager : pager_selector2,
			altRows: true,
			//toppager: true,
			
			//multiselect: true,
			//multikey: "ctrlKey",
	        multiboxonly: true,
	
				
			editurl: "/dummy.html",//nothing is saved
			caption: ""
	
			,autowidth: true,
            shrinkToFit:false,	
	
			/**
			,
			grouping:true, 
			groupingView : { 
				 groupField : ['name'],
				 groupDataSorted : true,
				 plusicon : 'fa fa-chevron-down bigger-110',
				 minusicon : 'fa fa-chevron-up bigger-110'
			},
			caption: "Grouping"
			*/
	
		});
		
		
		
//			jQuery(grid_selector).jqGrid('filterToolbar', { stringResult: true, searchOnEnter: true});
		$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
		
		
	
		//enable search/filter toolbar
		//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
		//jQuery(grid_selector).filterToolbar({});
	
	
		//switch element when editing inline
		function aceSwitch( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell) .find('input[type=checkbox]')
					.addClass('ace ace-switch ace-switch-5')
					.after('<span class="lbl"></span>');
			}, 0);
		}
		//enable datepicker
		function pickDate( cellvalue, options, cell ) {
			setTimeout(function(){
				$(cell) .find('input[type=text]')
						.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
			}, 0);
		}
		
		
	
	
		//navButtons
		jQuery(grid_selector1).jqGrid('navGrid',pager_selector1,
			{ 	//navbar options
				edit: false,
				editicon : 'ace-icon fa fa-pencil blue',
				add: false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del: false,
				delicon : 'ace-icon fa fa-trash-o red',
				search: false,
				searchicon : 'ace-icon fa fa-search orange',
				refresh: false,
				refreshicon : 'ace-icon fa fa-refresh green',
				view: false,
				viewicon : 'ace-icon fa fa-search-plus grey',
			},
			{
				//edit record form
				//closeAfterEdit: true,
				//width: 700,
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//new record form
				//width: 700,
				closeAfterAdd: true,
				recreateForm: true,
				viewPagerButtons: false,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//delete record form
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				},
				onClick : function(e) {
					//alert(1);
				}
			},
			{
				//search form
				recreateForm: true,
				afterShowSearch: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					style_search_form(form);
				},
				afterRedraw: function(){
					style_search_filters($(this));
				}
				,
				multipleSearch: true,
				/**
				multipleGroup:true,
				showQuery: true
				*/
			},
			{
				//view record form
				recreateForm: true,
				beforeShowForm: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				}
			}
		)
	
	
		
		jQuery(grid_selector2).jqGrid('navGrid',pager_selector2,
			{ 	//navbar options
				edit: false,
				editicon : 'ace-icon fa fa-pencil blue',
				add: false,
				addicon : 'ace-icon fa fa-plus-circle purple',
				del: false,
				delicon : 'ace-icon fa fa-trash-o red',
				search: false,
				searchicon : 'ace-icon fa fa-search orange',
				refresh: false,
				refreshicon : 'ace-icon fa fa-refresh green',
				view: false,
				viewicon : 'ace-icon fa fa-search-plus grey',
			},
			{
				//edit record form
				//closeAfterEdit: true,
				//width: 700,
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//new record form
				//width: 700,
				closeAfterAdd: true,
				recreateForm: true,
				viewPagerButtons: false,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			},
			{
				//delete record form
				recreateForm: true,
				beforeShowForm : function(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				},
				onClick : function(e) {
					//alert(1);
				}
			},
			{
				//search form
				recreateForm: true,
				afterShowSearch: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
					style_search_form(form);
				},
				afterRedraw: function(){
					style_search_filters($(this));
				}
				,
				multipleSearch: true,
				/**
				multipleGroup:true,
				showQuery: true
				*/
			},
			{
				//view record form
				recreateForm: true,
				beforeShowForm: function(e){
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				}
			}
		)

		
		
		
		
		
		
		
		
		
		function style_edit_form(form) {
			/*//enable datepicker on "sdate" field and switches for "stock" field
			form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
			
			form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
					   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
					  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
	
					
			//update buttons classes
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
			buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
			
			buttons = form.next().find('.navButton a');
			buttons.find('.ui-icon').hide();
			buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
			buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');	*/	
		}
	
		function style_delete_form(form) {
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
			buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
			buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
		}
		
		function style_search_filters(form) {
			form.find('.delete-rule').val('X');
			form.find('.add-rule').addClass('btn btn-xs btn-primary');
			form.find('.add-group').addClass('btn btn-xs btn-success');
			form.find('.delete-group').addClass('btn btn-xs btn-danger');
		}
		function style_search_form(form) {
			var dialog = form.closest('.ui-jqdialog');
			var buttons = dialog.find('.EditTable')
			buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
			buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
			buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
		}
		
		function beforeDeleteCallback(e) {
			var form = $(e[0]);
			if(form.data('styled')) return false;
			
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_delete_form(form);
			
			form.data('styled', true);
		}
		
		function beforeEditCallback(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}
	
	
	
		//it causes some flicker when reloading or navigating grid
		//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
		//or go back to default browser checkbox styles for the grid
		function styleCheckbox(table) {
		/**
			$(table).find('input:checkbox').addClass('ace')
			.wrap('<label />')
			.after('<span class="lbl align-top" />')
	
	
			$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
			.find('input.cbox[type=checkbox]').addClass('ace')
			.wrap('<label />').after('<span class="lbl align-top" />');
		*/
		}
		
	
		//unlike navButtons icons, action icons in rows seem to be hard-coded
		//you can change them like this in here if you want
		function updateActionIcons(table) {
			/**
			var replacement = 
			{
				'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
				'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
				'ui-icon-disk' : 'ace-icon fa fa-check green',
				'ui-icon-cancel' : 'ace-icon fa fa-times red'
			};
			$(table).find('.ui-pg-div span.ui-icon').each(function(){
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
				if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
			})
			*/
		}
		
		//replace icons with FontAwesome icons like above
		function updatePagerIcons(table) {
			var replacement = 
			{
				'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
				'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
				'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
				'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
			};
			$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
				var icon = $(this);
				var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
				
				if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
			})
		}
	
		function enableTooltips(table) {
			$('.navtable .ui-pg-button').tooltip({container:'body'});
			$(table).find('.ui-pg-div').tooltip({container:'body'});
		}
	
		//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
	
		$(document).one('ajaxloadstart.page', function(e) {
			$(grid_selector).jqGrid('GridUnload');
			$('.ui-jqdialog').remove();
			
		});
		
		
	});



</script> 


<%--  <%  --%>
<!-- //  		try {  -->
<!-- //  			int totalLeadCount =  (Integer) -->
<!-- //  					session.getAttribute("TotalLeadsCount");  -->
<!-- //  			String isblankexcel=""; -->
<!-- //  			try{ -->
<!-- //  				isblankexcel=session.getAttribute("isblankexcel").toString(); -->
<!-- //  			}catch(Exception e){ -->
<!-- //  				isblankexcel=""; -->
<!-- //  			} -->
<!-- //  			System.out.println(">>>>>>>>>>in bulkupload page" + totalLeadCount);  -->
<!-- //  			if (totalLeadCount > 0 || isblankexcel.equals("true")) {  -->
<%--  	%>  --%>
	
<!-- <div class="container">	 -->
<!-- <div class="container-body group">	 -->
<!-- <div id="no_record_hide"> -->
<!-- 	<div id="validRecordList" > -->
<!-- 	<div class="heading1"> -->
<!-- 		<div class="horizontal-sep"></div> -->
<!-- 		<h2>Upload Summary</h2> -->
<!-- 	</div> -->
<!-- 	<table id="investmentAssetSummary" class="old-school" style="width: 50%"> -->
<!-- 	<div class="table users-table" style="overflow-x: auto; overflow-y: hidden;" id="success_lead_table"> -->
<!-- 	<tr> -->
<!-- 	<th class="investment_links"><label style="font-weight: bold;">Label</label></th> -->
<!-- 	<th ><label style="font-weight: bold; ">Value</label></th> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	<td class="investment_links"><label style="font-weight: bold;">Upload Count</label></td> -->
<%-- 	<td class="investment_links"><label style="font-weight: bold; ">${sessionScope.TotalLeadsCount}</label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	<td class="investment_links"><label style="font-weight: bold;">Insert Count</label></td> -->
<%-- 	<td class="investment_links"><label style="font-weight: bold; ">${sessionScope.SucessLeadsCount}</label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	<td class="investment_links"><label style="font-weight: bold;">Failed Count</label></td> -->
<%-- 	<td class="investment_links"><label style="font-weight: bold; ">${sessionScope.FailedLeadsCount}</label></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 	<td class="investment_links"><label style="font-weight: bold;">Skipped Duplicate Count</label></td> -->
<%-- 	<td class="investment_links"><label style="font-weight: bold;">${sessionScope.Toalexistingleads}</label></td> --%>
<!-- 	</tr> -->
<!--  	</div>  -->
<!-- 	</table> -->
	
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->


<%-- <%--  <%  --%>
<!-- //   		}   -->
<!-- //   			session.setAttribute("TotalLeadsCount",0);  -->


<!-- 		session.setAttribute("SucessLeadsCount",0);  -->
<!-- 		session.setAttribute("FailedLeadsCount",0);  -->
<!-- //   			session.setAttribute("Toalexistingleads",0);  -->
<!-- //   			session.setAttribute("isblankexcel", "false");  -->
 			
<!-- //   		}  -->
<!-- //   catch (Exception e) { -->
<!-- //  	 e.printStackTrace();  -->
<!-- //  	}  -->
<%--  	%>  --%>



<!-- End Successful records Container Div -->

<%

// 		try {
// 			List<OpportunityData> lstInvalidLeadsList = (List<OpportunityData>) session
// 					.getAttribute("lstInvalidLeadsList");
// 			System.out.println(">>>>>>>>>>" + lstInvalidLeadsList.size());
// 			request.setAttribute("lstInvalidLeadsList",lstInvalidLeadsList);
// 			if (lstInvalidLeadsList.isEmpty()) {
	
// 		} else {
			
%>	

<jsp:include page="../common/footer.jsp" />
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
</form>
</body>
<script>
/* $(function() {
	showSelectedTab('opportunityLink');
}); */
</script>
</html>