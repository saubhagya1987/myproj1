${output.expectedReturnOnNewInvestment}<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8' />
<meta http-equiv="Pragma" content="no-cache">
<title>SHUBHCHINTAK</title>
</head>
<!-- <link rel="stylesheet" -->
<%-- 	href="<%=request.getContextPath()%>/css/zebra_dialog.css" --%>
<!-- 	type="text/css"> -->

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/rgbcolor.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/StackBlur.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/canvg.js"></script>
	<!--<link href="<%=request.getContextPath()%>/images/favicon.ico"
	rel="shortcut icon">

 <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
    -->


<!-- -responsive css-->

<!--<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
<%-- <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" /> --%>
<%-- ${sessionScope.userSession.buId} --%> 
<!-- when dfda bu comes then add condition -->
<c:choose >						
	<c:when test="${sessionScope.userSession.buId}=='27829' ">
		<link href="<%=request.getContextPath()%>/css/SPA.css" rel="stylesheet">
  </c:when>
  <c:when test="${sessionScope.userSession.buId}=='27828' ">
		<link href="<%=request.getContextPath()%>/css/fiinfraoutput.css" rel="stylesheet">
  </c:when>
   <c:when test="${sessionScope.userSession.buId}=='109308' ">
		<link href="<%=request.getContextPath()%>/css/dfdaoutput.css" rel="stylesheet">
  </c:when>
<c:otherwise>
<link href="<%=request.getContextPath()%>/css/Axis_dc_output.css" rel="stylesheet">
</c:otherwise>
</c:choose>
<!--<link type="text/css" rel="stylesheet" href="css/popup.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/zebra_dialog.css"
	type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css" />
--><!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src='<%=request.getContextPath()%>/js/jquery-1.9.1.min.js'></script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
--> <link href="<%=request.getContextPath()%>/css/${sessionScope.userSession.themeName}_output.css" rel="stylesheet">
	


<script src='<%=request.getContextPath()%>/js/example.js'></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/googleChartApi.js"></script>
	<!--<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>


<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>-->
<style>
#centerLoadingImage_image {
	margin-top: 10%;
	margin-left: 42%;
}

.close_img {
	cursor: pointer;
}

#centerLoadingImage {
	display: none;
	/* 	width: 300px; */
	/* 	height: 300px; */
	/* 	position: fixed; */
	/* 	z-index: 2005; */
}

#common_popup_div {
	display: none;
	position: fixed;
	filter: alpha(opacity = 00);
	width: 100%;
	height: 100%;
	z-index: 2000;
	opacity: 12;
	z-index: 10000000;
}

#shadow_div_web_app {
	background-color: #000000;
	display: none;
	height: 100%;
	left: 0;
	opacity: 0.1;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 999999;
}
</style>
<script>
 //var $=$.noConflict();

//var $jq_1_9_1 = $.noConflict();

$(document)
.ready(
		function() {
			$(document).ajaxStop(function() {
				closePopupWebApp('centerLoadingImage');
			});

			$(document).ajaxStart(function() {
				openPopupWebApp('centerLoadingImage', 25, 35);
			});
			var goalCount=$('#goalCount').val();
			(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
		});
		
String.prototype.contains = function(it) {
	return this.indexOf(it) != -1;
};	
Array.prototype.contains = function(obj) {
	var i = this.length;
	while (i--) {
		if (this[i] == obj) {
			return true;
		}
	}
	return false;
}
google.load("visualization", "1", {
	packages : [ "corechart" ]
});
google.setOnLoadCallback(startCharts);
function startCharts(){
	
	displayCashFlowBar();
}
function selectOption(id, name) {
	try{			
	var text=$('#'+id+'[name="'+name+'"]').val();
	if(text=='No' || text=='no'){	
		
		//alert(questionList);
		$(questionList).each(function(i,obj){
			//alert(obj.parentQuestion);
			if(obj.parentQuestion==name){						
//					alert('id is:--'+obj.questionId)
				
				$('input[name="'+obj.questionId+'"]').attr('disabled','disabled');
				$('input[name="'+obj.questionId+'"]').attr('checked',false);
				$('#'+obj.questionId).attr('disabled','disabled');
				$('#'+obj.questionId).val('');
//					if(obj.counter==63010){
//						$('input[name='+obj.questionId+']').each(function(i,obj){
						
//							$(obj).attr('disabled','disabled');
//							$(obj).val('');
//						});
					
//					}
				
			}
		});
	}
	else{
		$(questionList).each(function(i,obj){
			//alert(obj.parentQuestion);
			if(obj.parentQuestion==name){
				$('#'+obj.questionId).removeAttr('disabled');
				$('#'+obj.questionId).val('');
				$('input[name="'+obj.questionId+'"]').removeAttr('disabled');
			}
			
		});
	}
//		alert('id:--'+id+':---name----'+name)
	$('#'+id+'[name="'+name+'"]').attr('checked','checked');
//		event.preventDefault();
	}
	catch(e){
//			alert(e);
		$('#'+id+'[name="'+name+'"]').attr('checked','checked');
	}
	
}
function displayCashFlowBar() {
	
	var questionList = new Array();
	var questionListToIterate = new Array();
	var selectedQuetionOptionList ;
	var familyMemberList = new Array();
	
	var buId=$('#buId').val();
	
	if(buId=='27830')
		{
		$('#output_finfralogoId').hide();
		$('#pfordesclamer').attr('style','font-size: 11px !important;');
		}
	else{
		$('#output_finfralogoId').show();
		$('#pfordesclamer').attr('style','font-size: 16px !important;');
	}
	var sectionarray = $('#section').val().split(',');
	var isContainsRiskCover=sectionarray.contains("39003");
	var isContainsEmergencyR=sectionarray.contains("39001");
	var isContainsCahflow=sectionarray.contains("39002");
	var isContainsRiskProfile=sectionarray.contains("39009");
	var isContainsSuccession=sectionarray.contains("39007");
	var isContainsRetirment=sectionarray.contains("39006");
	var isContainsGoal=sectionarray.contains("39005");
	var isContainsLoan=sectionarray.contains("39008");
	
	if (isContainsEmergencyR==false)
	{
		$('#emergencyPage').show();
		
	}
	else{
		$('#emergencyPage').hide();
	}
	
	if (isContainsLoan==false)
	{
		$('#loanPage').show();
		
	}
	else{
		$('#loanPage').hide();
	}

	if (isContainsRiskCover==false)
	{
		$('#riskPage').show();
		
	}
	else{
		$('#riskPage').hide();
		
	}
	if (isContainsSuccession==false)
	{
		$('#successionPage').show();
		
	}
	else{
		$('#successionPage').hide();
		
	}
	
	
	
	
//	$('body').hide();
	/* display input questions starts*/
	var questionListToIterate = new Array();
	$('body').append('<form id="tempForm"><input type="hidden" name="xmlString" value="'+$('#xmlString').val()+'"></form>');
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/dc/getFamilyMemberList.htm',

	success : function(result) {
		familyMemberList=result;
		//alert('family member list='+familyMemberList);
		
		$.ajax({
	        type: "GET",
	        url : $('#contextPath').val()
			+ '/xml/DCInputFields.xml',
	        
	        dataType: "xml",
	        success: function(xml) {
	        	/* in the success of this ajax call getting details of family members */
	        	
	        	
	        	
	        	$(xml).find('BU').each(function(i,obj){
	        		var buId= $(this).attr('ID');
	        		if(buId==1){
	        			
	            $(obj).find('Section').each(function(i,obj){
	            	var SectionType = $(this).find('SectionType').text();
	            	var SectionName = $(this).attr('Name');
	            	var SectionType = $(this).attr('SectionType');
	            	var Image = $(this).attr('ImagePath');
	            	$("#headimg").attr("src",$('#contextPath').val()+"/images/shubhachintak/"+Image);	
	            	$(obj).find('Question').each(function(j,obj){
	            	var Id = $(this).attr('ID');
	            	questionList.push(Id);
	         		var QuestionType = $(this).attr('QuestionType');
	         		var attributeCodeIdQuestion = $(this).attr('AttributeCodeID');
//		            	alert('QuestionType='+QuestionType)
	            	var ControlType = $(this).find('ControlType').text();
	            	var ParentQuestionId=$(this).attr('ParentQuestionId');
	            	var question=$(this).find('QuestionText').text();
	            	//alert(question)
	            	var IsMandatory = $(this).find('IsMandatory').text();
	            	
	            	var optionList =[];
	            	var optionIdList =[];
	            	var AttributeCodeIDList=[];
	            	var valueList=[]; 
	            	var i=0;
	            	if (questionListToIterate
							.contains(attributeCodeIdQuestion)) {
						// 																	alert("in if")

					} else {
						// 																	alert("in else")
						questionListToIterate
								.push(attributeCodeIdQuestion);
					}
	            	$(this).find('Options').each(function(){
	            		$(this).find('Option').each(function(){
	            			
	            			optionIdList.push($(this).attr('AttributeCodeID'));
	            			AttributeCodeIDList.push($(this).attr('AttributeCodeID'));
	            			valueList.push($(this).attr('Value'));
			            	optionList.push($(this).text());
			            	 });
	            	 });
	 
				if(SectionType==39001)
					{
						if(QuestionType==85003)
		            	{
		           		$(
		           		'#emergencyQuestion')
						.append(
								'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question" >'+question+'</div><div class="col-md-6 searchpadding" id="question'+Id+'tr"> </div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
		           			$('#question'+Id+'tr')
							.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		}
		           		else if(QuestionType==85002)
		           			{
		           		 	$(
		           		 		'#emergencyQuestion')
								.append(
										'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top " >'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           			
			           		 for (var i=0;i<optionList.length;i++)
			           			{
			           			$('#question'+Id+'tr')
			           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
			           			}
		           			}
		           		
		           		else if(QuestionType==85001)
		       			{
		           		 	$(
							'#emergencyQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
			           			.append(' <div class="dcanswer50" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
			           		 
		           			}	
		       			
		       			}
		           		else if(QuestionType==85004)
		       			{
		           			$(
							'#emergencyQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'">'+question+'<span class="red">*</span></div> <div class="col-md-6 searchpadding" id="question'+attributeCodeIdQuestion+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 for (var i=0;i<optionList.length;i++)
		           			{
		           			$('#question'+attributeCodeIdQuestion+'tr')
		           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}	
		       			
		       			}
					}
					else if(SectionType==39002){
	           		if(QuestionType==85003)
	            	{
	           			//alert('in question type 85003');
	           		$(
						'#cashflowQuestions')
						.append(
								'<div class="row answerbg" ><div class="a" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-6 question searchpadding padding_top" >'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap" >&nbsp;</div><div class="clearfix"></div>  ');
	            	
	           		for (var i=0;i<optionList.length;i++)
	           			{
		           			$('#question'+Id+'tr')
							.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
	           			}
	           		}
	           		else if(QuestionType==85004)
	            	{
	           			$(
						'#cashflowQuestions')
						.append(
								'<div class="row answerbg" ><div class="a" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-6 question searchpadding padding_top" >'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap" >&nbsp;</div><div class="clearfix"></div>  ');
	            	
	           		for (var i=0;i<optionList.length;i++)
	           			{
		           			$('#question'+Id+'tr')
							.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
	           			}
	           		}
	           		else if(QuestionType==85008)
	           			{
	           				$(
	           				'#cashflowQuestions')
							.append(
									'<div class="row answerbg" ><div class="a1" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-12 question searchpadding padding_top" >'+question+'<span class="red">*</span></div><div class="col-md-4 searchpadding padding_top "><Div name="input_'+attributeCodeIdQuestion+'" class="form-control question"   id="'+attributeCodeIdQuestion+'" placeholder="" ></Div></div><div class="col-md-1 searchpadding padding_top ">OR</div><div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 for (var i=0;i<optionList.length;i++)
			           			{
			           				 $('#question'+Id+'tr')
										.append(' <div class="dcanswerbig1" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');
			            		}
	           			}
	           		
	           		
	           		else if(QuestionType==85005)
           			{
	           		 	$(
						'#cashflowQuestions')
						.append(
								'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
	           		 
	           		 	for(var i=0;i<optionList.length;i++)
	           		 		{
	           		 		
	           		 		
		           			$('#question'+Id+'tr')
							.append('<Div  class="form-control question" name="input'+attributeCodeIdQuestion+'" id="'+attributeCodeIdQuestion+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></span>');	
//			           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
	           		 		}
           			
           			}
				}
					else if(SectionType==39003){
						//alert(question);
				     	if(QuestionType==85003)
		            	{
		           		$(
		           		'#riskCoverQuestion')
						.append(
								'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
		           			$('#question'+Id+'tr')
							.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		}
		            	else if(QuestionType==85002)
	           			{
	           		 	$(
	           		 		'#riskCoverQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
	           			
		           		 for (var i=0;i<optionList.length;i++)
		           			{
		           			$('#question'+Id+'tr')
		           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
	           			}
		            	else if(QuestionType==85001)
	           			{
		            		$(
							'#riskCoverQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
			           			.append(' <div class="dcanswer1" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
			           		 
		           			}	
	           			}
				     	
		            	else if(QuestionType==85004)
	           			{
		           			$(
							'#riskCoverQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
		           		 for (var i=0;i<optionList.length;i++)
		           			{
		           			$('#question'+Id+'tr')
		           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}	
	           			
	           			}
		            	else if(QuestionType==85005)
	           			{
		           		 	$(
							'#riskCoverQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 
		           		 	for(var i=0;i<optionList.length;i++)
		           		 		{
		           		 		
		           		 		
			           			$('#question'+Id+'tr')
								.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'" id="'+attributeCodeIdQuestion+'" value="" /><span class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></span>');	
//				           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
		           		 		}
	           			
	           			}
		           		else if(QuestionType==85006)
	           			{
		           			$(
							'#riskCoverQuestion')
							.append(
									'<div class="row answerbg" id="question'+Id+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 
		           		 	
		           		 	for(var i=0;i<optionList.length;i++)
		           		 		{
		           		 		
		           		 		
			           			$('#question'+Id+'tr')
								.append(' <select   title="Hold Ctrl key to select multiple" multiple="multiple" style="margin-left: 4px;width:99%;min-width:200px;height: 50px;" name="input'+attributeCodeIdQuestion+'"  id="'+attributeCodeIdQuestion+'"  />');	
//				           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
		           		 		}
		           			$(familyMemberList)
							.each(
									function(i, obj) {
											//alert('name='+obj.name);
										
//			           		 	for(var j=0;j<result.length;j++)
//			           		 		{
		           		 				$("#"+attributeCodeIdQuestion).append('<option value='+obj.partyId+' id='+obj.partyId+'_'+attributeCodeIdQuestion+'>'+obj.name+'</option>');
//			           		 		}
								
							});
		           			
	           			}
					}
					else if(SectionType==39005)
					{
						if(QuestionType==85003)
		            	{
		           		$(
							'#goalReadyQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		
		            	}
		           		else if(QuestionType==85007)
	           			{
// 		           			alert('j='+j+' question='+question);
		           			if(j==1){
		           				$(
								'#goalReadyQuestion')
								.append(
										'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-12 searchpadding padding_top" id="a"> <div class="col-md-4 question"><ul id="question'+Id+'tr"><li>'+question+'</li></ul></div></div></div> <div class="col-md-12 dcnote">*(Don\'t include the property you stay in)</div><div class="col-md-12">&nbsp;</div> ');	
		           				
		           		
		           			}else if(j==2){
		           				$(
								'#a')
								.append(
										' <div class="col-md-4 question"> <ul id="question'+Id+'tr"><li>'+question+'</li></ul></div>');
		           			}
		           			else{
		           				$(
								'#a')
								.append(
										' <div class="col-md-4 question"> <ul id="question'+Id+'tr"><li>'+question+'</li><li>&nbsp;</li></ul></div>');	
		           			}
		           			
		           		 for (var i=0;i<optionList.length;i++)
		           			{
		           			 if(Id==5000){
		           				$('#question'+Id+'tr')
								.append('<li>'+optionList[i]+'<div name="input'+attributeCodeIdQuestion+'" onkeyup="allowIntegersOnlyUpToHundred(id,event)" onblur="allowIntegersOnlyUpToHundred(id,event)" onmouseout="allowIntegersOnlyUpToHundred(id,event)" onkeydown="allowIntegersOnlyForGoal(id,event)" maxlength="3" class="form-control" placeholder="Values (in %)" width="50px !important;"  id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>');
		           			 }else{
		           				$('#question'+Id+'tr')
								.append('<li>'+optionList[i]+'<div name="input'+attributeCodeIdQuestion+'"  onblur="updatePercentageavailToGoal(id,event)" onmouseout="updatePercentageavailToGoal(id,event)" onkeydown="allowIntegersOnly(id,event)" class="form-control" placeholder="Values (in Rs.)" width="50px !important;" onkeyup="test_skill(id);updatePercentageavailToGoal(id,event)" maxlength="9"  id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>'); 
		           			 }
		           			
			           				
		           			}
		           		
	           			}
					}
// 				loan
					else if(SectionType==39008){
						if(QuestionType==85003)
		            	{
		           		$(
							'#loanQuestions')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		
		            	}
		           		else if(QuestionType==85001)
	           			{
		           			$(
							'#loanQuestions')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-12 searchpadding padding_top question">'+question+'</div> <div class="col-md-12 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer" style="width:80px;height:70px;"><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}	
			           }
		           		else if(QuestionType==85005)
	           			{
		           		 	$(
							'#loanQuestions')
							.append(
									'<div class="row answerbg" id="question'+Id+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 
		           		 	for(var i=0;i<optionList.length;i++)
		           		 		{
		           		 		
			           			$('#question'+Id+'tr')
								.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'" onkeyup="test_skill(id)"  id="'+attributeCodeIdQuestion+'" value="" /><span class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></span>');	
//				           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
		           		 		}
	           			}
		           		if(QuestionType==85002)
		            	{
		           		$(
							'#loanQuestions')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer" style="width:80px;"><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		
		            	}
					}
					else if(SectionType==39006){
						if(QuestionType==85003)
		            	{
		           		$(
							'#retirementPlanQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		}
						else if(QuestionType==85007)
	           			{
		           			
		           			if((j)%2==0){
		           				$(
								'#retirementPlanQuestion')
								.append(
										'<div class="row answerbg" style="border: 1px solid !important;" id="question'+attributeCodeIdQuestion+'"><div class="col-md-12 searchpadding padding_top" id="a1" > <div class="col-md-6 question" style="border: 0px solid; border-radius: 25px;"><ul id="question'+Id+'tr"><li>'+question+'</li></ul></div></div></div> <div class="col-md-12">&nbsp;</div> ');	
		           				
		           		
		           			}
		           			else{
		           				$(
								'#a1')
								.append(
										' <div class="col-md-6 question" > <ul id="question'+Id+'tr"><li>'+question+'</li></ul></div>');	
		           			}
		           			
		           		 for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append('<li >'+optionList[i]+'<div name="input'+attributeCodeIdQuestion+'"  class="form-control" placeholder="Values (in Rs.)" width="50px !important;" onkeyup="test_skill(id)"  id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>');	
		           			}
	           			}
		           		else if(QuestionType==85001)
	           			{
		           			$(
							'#retirementPlanQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer50" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}	
			           		
	           			}
		           		else if(QuestionType==85002)
	           			{
	           		 	$(
	           		 		'#retirementPlanQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
	           			
		           		 for (var i=0;i<optionList.length;i++)
		           			{
		           			$('#question'+Id+'tr')
		           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
	           			}
		           		
		           		else if(QuestionType==85005)
	           			{
		           		 	$(
							'#retirementPlanQuestion')
							.append(
									'<div class="row answerbg" id="question'+Id+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		           		 
		           		 	for(var i=0;i<optionList.length;i++)
		           		 		{
		           		 		
			           			$('#question'+Id+'tr')
								.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'" onkeyup="test_skill(id)"  id="'+attributeCodeIdQuestion+'" value="" /><span class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></span>');	
//				           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
		           		 		}
	           			}
				}
// 				succession plam
					else if(SectionType==39007){
						if(QuestionType==85003)
		            	{
		           		$(
							'#successPlanQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		
		            	}
		           		
		            	if(QuestionType==85002)
		            	{
		           		$(
							'#successPlanQuestion')
							.append(
									'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-6 question searchpadding padding_top">'+question+'</div> <div class="col-md-6 searchpadding" id="question'+Id+'tr"></div></div> <div class="col-md-12 gap">&nbsp;</div><div class="clearfix"></div>  ');
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+Id+'tr')
								.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
		           			}
		           		
		            	}
					}
					else if(SectionType==39009){
// 						alert('j='+j+' question='+question);
						if(QuestionType==85004)
		            	{
		            		if((j+1)%2==0){
		            			if(j<=3){
		            				$('#riskProfile .left')
		    								.append(
		    										'<div class="heading" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong> <div id="text"> <ul style="color: #666!important;font-family: Calibri, Arial, Helvetica, Sans-serif;" id="question'+attributeCodeIdQuestion+'tr"></ul></div></div></div>');
		            			}else{
		            				$('#riskProfile .right')
		    								.append(
		    										'<div class="heading" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong> <div id="text"> <ul style="color: #666!important;font-family: Calibri, Arial, Helvetica, Sans-serif;" id="question'+attributeCodeIdQuestion+'tr"></ul></div></div></div>');
		            			}
		            			
		            		}else{
// 		            			alert('J---'+j+'------html:--'+$('#riskProfile .left').html())
		            			if(j<=3){
		            				if($('#riskProfile .left').html()==undefined){
		            					$(
										'#riskProfile')
										.append(
												'<div  id="rowleft'+(j+1)+'" class="left">  <div class="heading" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong><div id="text"> <ul style="color: #666!important;font-family: Calibri, Arial, Helvetica, Sans-serif;" id="question'+attributeCodeIdQuestion+'tr"></ul></div></div></div>');
		            				}else{
		            					$('#riskProfile .left')
			    								.append(
			    										'<div class="heading" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong> <div id="text"> <ul style="color: #666!important;font-family: Calibri, Arial, Helvetica, Sans-serif;" id="question'+attributeCodeIdQuestion+'tr"></ul></div></div></div>');
		            				}
		            				
		            			}else {
		            				if($('#riskProfile .right').html()==undefined){
		            					$(
										'#riskProfile')
										.append(
												'<div  id="rowright'+(j+1)+'" class="right">  <div class="heading" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong><div id="text"> <ul style="color: #666!important;font-family: Calibri, Arial, Helvetica, Sans-serif;" id="question'+attributeCodeIdQuestion+'tr"></ul></div></div></div>');
		            				}else{
		            					$('#riskProfile .right')
			    								.append(
			    										'<div class="heading" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong> <div id="text"> <ul style="color: #666!important;font-family: Calibri, Arial, Helvetica, Sans-serif;" id="question'+attributeCodeIdQuestion+'tr"></ul></div></div></div>');
		            				}
		            				
		            			}
		            			
		            		}
		           		
		            	
		           		for (var i=0;i<optionList.length;i++)
		           			{
			           			$('#question'+attributeCodeIdQuestion+'tr')
								.append(' <li><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" />&nbsp;&nbsp;'+ optionList[i] +'</li>');	
		           			}
		           		
		            	}
					}
		           	
	           	 });
				
	            	
	            	});
	            	
			}/*closing of bu condition*/
		            
	        	});/*close reading Bu tag*/	
	        
	        	/*dfsd*/
	    		$.ajax({
					type : "POST",
					url : $('#context').val()
							+ '/dc/getFinancialStatusList.htm?sectionTypeId='+0+'&questionBankId='+0,
					data:$('#tempForm').serialize(),
					success : function(result) {
						try{

							$(result)
				.each(
						function(i, obj) {
							
							
							 	if (obj.questionType == '85005' ) {
							 		
								try{
										if(obj.sectionType==39003 || obj.sectionType==39008){
											$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
// 										
											$('#'+obj.attributeCodeId).html(obj.attributeRefferenceValue);
										}
										else{
											$('#'+obj.attributeCodeId).val(obj.attributeValue);
// 											$('#'+obj.attributeCodeId).attr('value',obj.attributeValue);
											$('#'+obj.attributeCodeId).html(obj.attributeValue);
										}
								
								//alert(obj.questionId+':'+$('#input'+obj.questionId).val());
								$(
										'#input'
												+ obj.attributeCodeId)
										.val(
												$(
														"#slider")
														.slider(
																"value")
														+ "%");
								$(
										'input[name="'
												+ obj.attributeCodeId
												+ '"]')
										.val(
												obj.attributeValue);
// 								$(
// 										'input[name="'
// 												+ obj.attributeCodeId
// 												+ '"]')
// 										.attr('value'
// 												,obj.attributeValue);
							
								}catch(e){
									$(
											'input[name="'
													+ obj.attributeCodeId
													+ '"]')
											.val(
													obj.attributeValue);
// 									$(
// 											'input[name="'
// 													+ obj.attributeCodeId
// 													+ '"]')
// 											.attr('value'
// 													,obj.attributeValue);
								}	} 
							
							 	else if(obj.questionType=='85006')
								{

								$('#'+obj.attributeCodeId).find('option[value="' + obj.attributeValue + '"]').attr("selected", "selected");
								}
							 	else if(obj.questionType == 85008 || obj.questionType == 85009)
							 		{
							 		selectOption(
											'option'
													+ obj.attributeValue+'_'+obj.attributeCodeId+'_'+obj.attributeRefferenceValue,
											obj.questionId);
									$(
											'#select'
													+ obj.attributeCodeId)
											.val(
													obj.attributeValue);
									
									$('#'+obj.attributeCodeId).html(obj.attributeRefferenceValue);
// 									$('#'+obj.attributeCodeId).val(obj.attributeValue);
									
							 		}
							 	else if(obj.questionType=='85001')
								{
								selectOption(
										'option'
												+ obj.attributeValue+'_'+obj.attributeCodeId+'_',
										obj.questionId);
								$(
										'#select'
												+ obj.attributeCodeId)
										.val(
												obj.attributeValue);
								}
							 	else if(obj.questionType=='85007')
								{
									//alert('in first if='+obj.questionId);
									$('#'+obj.attributeCodeId+'_'+obj.attributeValue).html(obj.attributeRefferenceValue);
								}
							 else {
								 selectOption(
											'option'
													+ obj.attributeValue+'_'+obj.attributeCodeId+'_'+obj.attributeRefferenceValue,
											obj.questionId);
									$(
											'#select'
													+ obj.attributeCodeId)
											.val(
													obj.attributeValue);
							}
					});
						
		
				

		

		$(questionList).each(function(i,obj){
			//alert(obj.parentQuestion);
			if(obj.parentQuestion!=0){
				var  selected=false;	
				$('#question'+obj.parentQuestion + ' a').each(function(j,obj1){
					//alert('---'+$(obj1).attr('class'));	
					if($(obj1).attr('class')!=undefined){
						selected=true;
					}
				});
				//alert('question '+obj.questionId+' selcted???'+selected);
				if(!selected){
					$('#select'+obj.questionId).attr('disabled','disabled');
					//alert('#input'+obj.questionId);
					$('#input'+obj.questionId).attr('disabled','disabled');		
				}
				
			}
		});	

					}catch(e){
//							alert(e)
//							closePopupWebApp('centerLoadingImage');
					}
					
					var dcInputPartyId=$('#dcInputPartyId').val();
					
					$.ajax({
						type : 'POST',
						url : $('#context').val()+'/dc/displayCashFlowBar.htm?dcInputPartyId='+dcInputPartyId,
						success : function(result) {
							try{	
									//result = JSON.parse(result);
									//alert('in success of cash flow bar');
									//alert(result);
									var innerArray = new Array();
									innerArray.push('Years');
									//innerArray.push('Leads');
									innerArray.push('Amount');
									var yearsToRetirement=result[0];
//						 				var periodArray = [ '1', '2', '3',
//						 						'4', '5'];				
									var outerArray = new Array();
									outerArray.push(innerArray);				
									//alert(result.length);
									for ( var i = 1; i < result.length; i++) {
										innerArray = new Array();
										innerArray.push(i);
										innerArray.push(parseFloat(result[i]));
										//alert(innerArray);
										outerArray.push(innerArray);
									}
									
									var data = google.visualization.arrayToDataTable(outerArray);
									var options = {
										title : 'Corpus Accumulation',
										hAxis : {
											title : 'Years',
											titleTextStyle : {
												color : 'black',
												fontName: 'Calibri',
												bold:true,
												italic:false
												
												
											}				
										},
										vAxis : {
//							 						title : 'Cash',
											titleTextStyle : {
												color : 'red'
											}				
										},
										legend:{position:'none'}
									};
									
							

									var chart = new google.visualization.ColumnChart(document
											.getElementById('cashFlowBar'));
									chart.draw(data, options);
									
									//canvg(document.getElementById('drawingArea'), '<svg width="400" height="200" style="overflow: hidden;display: inline-block"><defs id="defs"><clipPath id="_ABSTRACT_RENDERER_ID_0"><rect x="67" y="38" width="267" height="124"></rect></clipPath></defs><rect x="0" y="0" width="400" height="200" stroke="none" stroke-width="0" fill="#ffffff"></rect><g><text text-anchor="start" x="67" y="22.85" font-family="Arial" font-size="11" font-weight="bold" stroke="none" stroke-width="0" fill="#000000">Cash Flow</text></g><g><rect x="345" y="38" width="44" height="11" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g><rect x="345" y="38" width="44" height="11" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g><text text-anchor="start" x="360" y="47.35" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#222222">Amount</text></g><rect x="345" y="38" width="11" height="11" stroke="none" stroke-width="0" fill="#3366cc"></rect></g></g><g><rect x="67" y="38" width="267" height="124" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g clip-path="url(#_ABSTRACT_RENDERER_ID_0)"><g><rect x="67" y="38" width="1" height="124" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="123" y="38" width="1" height="124" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="179" y="38" width="1" height="124" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="235" y="38" width="1" height="124" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="291" y="38" width="1" height="124" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="67" y="161" width="267" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="67" y="130" width="267" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="67" y="100" width="267" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="67" y="69" width="267" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="67" y="38" width="267" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect></g><g><rect x="63" y="160" width="8" height="1" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="77" y="158" width="8" height="3" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="91" y="156" width="8" height="5" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="105" y="154" width="8" height="7" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="119" y="152" width="8" height="9" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="133" y="149" width="8" height="12" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="147" y="146" width="8" height="15" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="161" y="142" width="8" height="19" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="175" y="139" width="8" height="22" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="189" y="134" width="8" height="27" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="203" y="130" width="8" height="31" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="217" y="125" width="8" height="36" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="231" y="119" width="8" height="42" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="245" y="113" width="8" height="48" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="259" y="106" width="8" height="55" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="273" y="99" width="8" height="62" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="287" y="90" width="8" height="71" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="301" y="81" width="8" height="80" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="315" y="71" width="8" height="90" stroke="none" stroke-width="0" fill="#3366cc"></rect><rect x="329" y="60" width="8" height="101" stroke="none" stroke-width="0" fill="#3366cc"></rect></g><g><rect x="67" y="38" width="1" height="124" stroke="none" stroke-width="0" fill="#333333"></rect><rect x="67" y="161" width="267" height="1" stroke="none" stroke-width="0" fill="#333333"></rect></g></g><g></g><g><g><text text-anchor="middle" x="67.5" y="176.68333333333334" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">1</text></g><g><text text-anchor="middle" x="123.5" y="176.68333333333334" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">5</text></g><g><text text-anchor="middle" x="179.5" y="176.68333333333334" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">9</text></g><g><text text-anchor="middle" x="235.5" y="176.68333333333334" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">13</text></g><g><text text-anchor="middle" x="291.5" y="176.68333333333334" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">17</text></g><g><text text-anchor="end" x="56" y="165.35" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">0</text></g><g><text text-anchor="end" x="56" y="134.6" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">10,000,000</text></g><g><text text-anchor="end" x="56" y="103.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">20,000,000</text></g><g><text text-anchor="end" x="56" y="73.1" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">30,000,000</text></g><g><text text-anchor="end" x="56" y="42.34999999999999" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">40,000,000</text></g></g></g><g><g><text text-anchor="middle" x="200.5" y="193.01666666666668" font-family="Arial" font-size="11" font-style="italic" stroke="none" stroke-width="0" fill="#ff0000">Years</text></g><g><text text-anchor="middle" x="31.85" y="100" font-family="Arial" font-size="11" font-style="italic" transform="rotate(-90 31.85 100)" stroke="none" stroke-width="0" fill="#ff0000">Cash</text></g></g><g></g></svg>')
									canvg(document.getElementById('drawingArea'), $('#cashFlowBar div div').html());
									var canvas = document.getElementById("drawingArea");
									var img    = canvas.toDataURL("image/png");
									//alert('img=='+img);
									$('body')
									.append(
											'<form method="post"  name="uploadGraphImage" id="uploadGraphImage"></form>');
									$('#uploadGraphImage').append('<input type="hidden" name="barChartImageData" id="chartBar"/>');
//						 				$('#uploadGraphImage').append('<input type="hidden" id="meterBar"/>');
								
									$('#chartBar').val(img);
//						 				$('#meterBar').val();
							}
							catch(e){
//								alert(e);	
							}
							var barChartImageData=$('#chartBar').val();
						//	alert('barChartImageData='+barChartImageData);
							$.ajax({
								type : 'POST',
								url : $('#context').val()+'/dc/uploadGraphImage.htm?dcInputPartyId='+dcInputPartyId,
								 data : $("#uploadGraphImage").serialize(), 
								success : function(result) {
			 						//alert('in success of upload graph image');
									//alert($('#meterGageImage').attr('src'));
//										$('#cashFlowBarImage').attr('src','https://fi-i.com/'+$('#context').val()+'/PathFinder/pdf/'+$('#leadIdHidden').val()+'/'+$('#leadIdHidden').val()+'.png');
									
									$('#cashFlowBarImage').attr('src','https://fi-i.com/Fiinfra/PathFinder/pdf/'+dcInputPartyId+'/'+dcInputPartyId+'.png');
									$('#cashFlowBarImage').css('width','550px');	
//										$('#cashFlowBarImage').css('margin-top','50px');																		
									$('#drawingArea').hide();
									$('#cashFlowBar').hide();
									
									
					$('input[type="text"]').each(function(i,obj) {
						var span='<div class="col-md-6 question searchpadding padding_top">'+$(obj).val()+'</div>';
						$(obj).before(span);
						$(obj).hide();
					});
					var span='<div class="question">';
					var cntr1=0;
					$('select :selected').each(function(i, selected){
						cntr1=1;
						span=span+$(selected).text()+',';
						});
					if(cntr1==1){
						span=span.substring(0,span.lastIndexOf(','));
					}
					span+='</div>';
					$('select').before(span);
					$('select').hide();
// 					$('body')
// 					.append(
// 							'<form method="post" action="'
// 									+ $('#context').val()
// 									+ '/dc/viewOutputAsPdfFromHtml.htm" name="outputHtmlForm" id="outputHtmlForm"></form>');
// 					$('#outputHtmlForm')
// 					.append(
// 							'<textarea type="hidden" name="htmlString" id="htmlString" style="display:none;"></textarea>');
// 					$('#outputHtmlForm')
// 					.append(
// 					'<input type="hidden" name="dcInputPartyIdVal" id="dcInputPartyIdVal" value="${output.partyId}"></input>');
// 					$('#outputHtmlForm')
// 					.append(
// 					'<input type="hidden" name="opportunityName" id="opportunityName" value="${output.opportunityName}"></input>');
// 					$('#outputHtmlForm')
// 					.append(
// 					'<input type="hidden" id="partnerName" name="partnerName" value="${output.partnerName}"></input>');
// 					$('#outputHtmlForm')
// 					.append(
// 					'<input type="hidden" name="partnerEmail" value="${output.partnerEmail}"></input>');
// 					var html = $('#body').html();
// 					$('#htmlString').val(html);
// 					console.log('>>>'+html);

					var dcInputPartyIdVal=$('#dcInputPartyIdVal').val();
					var opportunityName=$('#opportunityName').val();
					var buId =$('#buId').val();
					//alert('opportunity name='+opportunityName);
// 					$.ajax({
// 					type : 'POST',
// 					url : $('#context').val()+'/dc/viewOutputAsPdfFromHtml.htm?dcInputPartyId='+dcInputPartyIdVal+'&opportunityName='+opportunityName,
// 					data : $("#outputHtmlForm").serialize(), 
// 					success : function(result) {
// 						if(localStorage.getItem('IsAutoPlan')=='true'){
// 							localStorage.setItem('IsAutoPlan','false');
// 							window.close();	
// 						}else{
// 						if(buId==27828)
// 							{
// 							showAlertMessage1("Message",
// 		        					"<br/>Report Generated Successfully.",
// 		        					"confirmation", redirectFurther1);
// 							 $('.ZebraDialog').css('top','250px');
							
// 							}
// 						else{
// 							showAlertMessage1("Message",
// 		        					"<br/>Report Generated Successfully.",
// 		        					"confirmation", redirectFurther);
// 							 $('.ZebraDialog').css('top','250px');
							
// 						}
// 						}
 							
					
					
// 					 return false; 
						
// 						}
 							
					
										
// 				});
										
									}});
				
										}});
				}
					
				});
	        	
	        	
	        }
	        
	    });
	}
	});
	
	
	
	
	function redirectFurther()
	{
		window.location.href= $('#contextPath').val()+"/DCHomeShubhchintak.htm";
	}
	
	
	
	function redirectFurther1()
	{
		window.location.href= $('#contextPath').val()+"/DCHomeFiinfra.htm";
	}								
								

	
	/* display input questions ends*/
	
	
	


	
}


</script>

<div id="shadow_div_web_app" style="display: none"></div>
<div id="common_popup_div" style="display: none">
	<!-- 	<div id="centerLoadingImage"> -->
	<img  id="centerLoadingImage"

		style="display: none"
		src="<%=request.getContextPath()%>/images/loading15.gif"
		name="loadingImage" />
		
		<h4 style="position:absolute;top: 54%; left: 38%; color: #0e0828;">Please wait ..the report is being generated. Do not close or refresh the window.</h4>
	<!-- 	</div> -->
	

</div>

<input type="hidden" id="context"
			value="<%=request.getContextPath()%>" /> 
<input type="hidden" id="htmlContent" value="" name="htmlContent" /> 
			<input type="hidden" id="contextPath"
			value="<%=request.getContextPath()%>" /> 
			<input type="hidden" name="dcInputPartyId" id="dcInputPartyId" value="${sessionScope.dcInputPartyId}">
				
			<input type="hidden" id="leadName" value="${sessionScope.leadName}">
			<input type="hidden" id="isPartner" value="true">
			<input type="hidden" id="userTypePartner"
				value="${sessionScope.users.roleId}">
		
<!-- 		<s:hidden type="hidden" id="futureFinExpectationNotes" value="%{output.futureFinExpectationsNotes}"></s:hidden> -->
<!-- <s:hidden  type="hidden" id="personalNote" value="%{output.personalInfoNotes}" ></s:hidden> -->
<!-- <s:hidden type="hidden" id="currentFinNotes" value="%{output.currentFinStatusNotes}" ></s:hidden> -->
<!-- <s:hidden type="hidden" id="eventNotes" value="%{output.eventsNotes}" ></s:hidden>	 -->
<!-- <s:hidden type="hidden" id="savings" value="%{output.saving}" ></s:hidden> -->
<!-- <s:hidden type="hidden" id="score" value="%{output.score}" ></s:hidden> -->
<!-- <s:hidden type="hidden" id="profile" value="%{output.profile}" ></s:hidden> -->
<!-- 		<s:hidden type="hidden" id="profile" value="%{output.profile}" ></s:hidden> -->
		
		<input type="hidden" id="futureFinExpectationNotes"  value="${output.futureFinExpectationsNotes}">
		<input type="hidden" id="personalNote"  value="${output.personalInfoNotes}">
		<input type="hidden" id="currentFinNotes"  value="${output.personalInfoNotes}">
		<input type="hidden" id="eventNotes"  value="${output.personalInfoNotes}">
		<input type="hidden" id="savings"  value="${output.personalInfoNotes}">
		<input type="hidden" id="score"  value="${output.personalInfoNotes}">
		<input type="hidden" id="profile"  value="${output.personalInfoNotes}">
		<input type="hidden" id="section" value="${sessionScope.Section}"/>
<body >
	<input type="hidden" id="buId" value="${sessionScope.userSession.buId}"/>
<input type="hidden" id="context"
			value="<%=request.getContextPath()%>" /> <input type="hidden"
			id="goalCount" value="${output.goalList.size()}" /> 
		<input type="hidden" id="context"
			value="<%=request.getContextPath()%>" />
<div id="body" style="display: block;">
		
		<form action="" name="viewOutput" method="POST" id="viewOutput">
							</form>
<div class="center">
<div id="mainwrapper" style="margin-right: 100px!important;">

<!-- front page -->
	 <div class="output-body pf-op-body" style="height: 1480px;">
		<div class="pf-op-container group">
         <div class="output_header"></div>
          <div class="mainbg">
  		 	<div class="clientlogo"><img  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div>
		  <div id="clientname">
  				<h4>${output.partnerName}</h4>
       		  <h5> Financial Consultant</h5>
   		 	  <p>${output.partnerPhone}  </br>    
				${output.partnerEmail}<br />${output.partnerAddress}<br />
				${output.partnerCity} - ${output.postalCode}</p>
       		 </div>
  

  <div class="box"> 
  
 					
	
  
 <h1> ${output.salutation} ${output.opportunityName}</h1>
  <h3>Steps to your financial freedom</h3>
  
  </div>   
  <div class="col-md-12" style="margin:20px 0 20px 12px;">
		   <div class="col-md-3">
               <div class="dcbox">
               <center>
                 <a href="dc_personal_info.html"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/dc1op.png"></a>
               </center><br>
                      <h3> <a href="dc_personal_info.html" title="Personal Information" alt="Personal Information" >Personal <br>
                     Information </a></h3></div>
           </div>
          
           <div class="col-md-3"> 
              <div class="dcbox"><br>          
              <center> 
                <a href="risk_profile.html"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/dc4op.png" ></a>
              </center> 
              <h3> <a href="risk_profile.html"  title="Risk Profile"alt="Risk Profile">Risk<br> Profile </a></h3></div>
              </div>
              
              
     		<div class="col-md-3">
               <div class="dcbox">
                <center>
                  <a href="dc_currentfinancial_cash_flow.html"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/dc3op.png"   ></a>
                </center><br>
                <h3><a href="dc_currentfinancial_cash_flow.html" alt="Current Financial Status"  title="Current Financial Status"> 		Current <br>
              Financial Status</a> </h3></div>
          </div>
          
          <div class="col-md-3">
              <div class="dcbox">
               <center> 
                 <a href="dc_futurefinancial.html"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/dc2op.png"></a>
               </center><br>
                 <h3><a href="dc_futurefinancial.html" title="Future Financial Expectations" alt="Future Financial Expectations">
                 Future Financial <br>
             	 Expectations </a></h3></div>
          </div>
          
          
          
            </div>
  <div class="clear"></div>
  
 
  <!-- END launch-icons -->
</div>
   
<div class="outputfooter2" style="margin: 306px 0 0 0px!important;">
  <div class="output_logo" style="margin-top: 16px !important;">
 <img style="width:140px; height:60px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.buLogo}" />
 </div>
</div>	

</div>
                           
 </div> <!-- END pf-op-container -->

<!-- front page end -->
<!--Welcome page start  --->		
 <div class="output-body pf-op-body" style="height: 1480px;">
		<div class="pf-op-container group"   >
         <div class="output_header">
                  <div class="consultant_strip">
<%--         			<div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
       				<div style="font-size: 18px;">${output.partnerName}</div>
                  </div>
                        <div class="output_base"> <strong>Welcome ${output.salutation} ${output.opportunityName}</strong></div>
                          
                       </div>
          <div class="mainbg">
             <div id="center">
          <div class="boxnew">
          	<p class="intro">Dear <span class="red" style="font-size: 17px;">${output.salutation} ${output.opportunityName}</span>              <br />
              <br />
           We are happy to welcome you to the club of people who have taken their first step to financial freedom.
              <br />
              <br />
             This document will provide you with a comprehensive picture of your financial life and a sneak preview to
your future goals.
              <br />
              <br />
              We are sure you will find the suggestions useful and we hope to be of value in your journey.
              <br />
              <br />
              Wish you all the best!
              <br /> <br />
            Warm regards
              <br /> <br />
              <span class="red" style="font-size: 17px;">${output.partnerName}</span></p>
          </div>
          
           <div  class="heading"> ASSUMPTIONS </div>
      <div class="text"> A few assumptions are made in this analysis report.
      	<ul>
      		<li>Inflation is assumed at ${output.inflationRate}%</li>
<%--       		<li>Returns from investments are assumed at ${output.expectedReturnOnExistingInvestment}%.</li> --%>
			<li>Assets are grown as per assumed growth rate of asset class.</li>
            <li>If you have indicated a range value anywhere, the amount used for calculations is the average of the lower value and higher value in the range.</li>
      		<li>Life insurance needs are calculated as the number of productive years left * annual income.</li>
            <li>Your existing assets and regular investments are used to meet the goals that come (chronologically) first.</li>
      		<li>If there is money left after utilizing for the initial goal, then the remaining amount is used for subsequent
goals and retirement.</li>
	    </ul>
                With the available information, we have put together a broad analysis and recommendation report.<br /> </div>
                
                
                 <div  class="heading"> TERMS & CONDITIONS APPLICABLE  </div> 
        </div>  
          
 
  <!-- END launch-icons -->
</div>
   
<div class="outputfooter2" style="margin: 294px  0 0 0px!important;">
  <div class="output_logo" style="margin-top: 16px !important;">
 <img style="width:140px; height:60px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.buLogo}" />
 </div>
</div>	

</div>
                           
			   </div> <!-- END pf-op-container -->        
<!--Welcome  page End ---->	 

<!--1st page start -  Emergency Readiness --->		
  <div class="output-body pf-op-body" id="emergencyPage" style="height: 1495px; ">
			   <div class="output_header">
                  <div class="consultant_strip">
<%--         			<div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
       				<div style="font-size: 18px;">${output.partnerName}</div>
                  </div>
                        <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                   <div class="output_header_head">Page 1 
<%--                    <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                   </div>
                 
               </div>
                 
        <div id="mainleft" >
<!--         following  emergencyQuestion div will daynamicaly load all selected question and options -->
		        <div id="emergencyQuestion">
		             
		        </div>
        </div> 
            	<div id="mainright">       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/emergency.gif" />
        </div>  	 <br />
						<div class="pf-op-container group" >
							
							<div class="first-take">
								<p class="heading">First Take</p>
								
								<c:choose >						
									    <c:when test="${output.emergencyRselectedQuestion=='1-3'}">
									    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" alt="" class="up">
									    </c:when>
									     <c:when test="${output.emergencyRselectedQuestion=='3-6'}">
									    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/mid.png" alt="" class="up">
									    </c:when>
									    <c:otherwise>
      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png" alt="" class="up">
      									</c:otherwise>
						    	</c:choose>
							</div>
							<div class="current-sit">
                            <div id="coin-jars-text">
                            <p>DANGER </p><p class="coin-jars-text1" style="margin-left:60px;">SAFE</p>	<p class="coin-jars-text1" >COMFORTABLE</p></div>
                            	
								<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/coin-jars.png" alt="" class="coin-jars">
								
                                
								
						  </div>
                          <div class="graphical-rep">
								<p class="heading">The need for Emergency Fund</p>
                                <div id="graphic_text">Emergency situations may arise due to natural 
                                  calamities, accidents, changes in economic 
                                  environment or more.<br />
                                  Though we can't control it, we can respond better with 
                                  some planning.<br />
                                  If not prepared, an emergency might leave you poorer, 
                                  debt ridden or helpless.<br />
                                  You may fall down, but will you be able to get back on 
                                your feet again?</div>
						  </div>
                          <c:choose >						
									    <c:when test="${output.emergencyRselectedQuestion=='1-3'}">
										     <div class="suggestion">
													<p class="heading">Our Suggestion</p>
													<p class="suggestion_text"><ul><li>Your current monthly expenses  <span class="red">
														Rs.${output.monthlyExpenses}/- </span> per month.</li>
														
													  <li>You can manage  ${output.emergencyRselectedQuestion} months without income.</li>
					 								
													  <strong>Minimum contingency fund required <span class="red">Rs.${output.minimumEmergencyFund}/-</span></strong></li>
					                                  <br />
					                                  <li>Invest this money in :<ul><li>Savings Bank Account</li>
													<li>Fixed Deposits<br />
													<li>Ultra Short term Debt funds</li></ul></li>
					                                  
														
														<li>Suggested holding pattern :</li>
													<li>Joint (Either or Survivor mode) with close family member</li></p></ul>
							  				</div>	
							
									    </c:when>
									    <c:when test="${output.emergencyRselectedQuestion=='3-6'}">
										     <div class="suggestion">
													<p class="heading">Our Suggestion</p>
													<p class="suggestion_text"><ul><li>Your current monthly expenses  <span class="red">
														Rs.${output.monthlyExpenses}/- </span> per month.</li>
														
													  <li>You can manage  ${output.emergencyRselectedQuestion} months without income.</li>
					 								
													  <strong><li>Minimum contingency fund required <span class="red">Rs.${output.minimumEmergencyFund}</span>                                  </strong>
					                                  </li>
					                                  <li>Invest this money in :<ul><li> Savings Bank Account</li>
													<li>Fixed Deposits</li>
													<li>Ultra Short term Debt funds</li></ul>
					                                  </li>
					                                  
														
														<li>Suggested holding pattern :</li>
													<li>Joint (Either or Survivor mode) with close family member</li></p></ul>
							  				</div>	
							
									    </c:when>
									     <c:otherwise>
      										 <div class="suggestion">
													<p class="heading">Our Suggestion</p>
													<p class="suggestion_text"><ul><li>Your current monthly expenses - <span class="red">
														Rs.${output.monthlyExpenses}/- </span> per month.
														</li>
													  <li>You can manage  ${output.emergencyRselectedQuestion} months without income. This makes you adequately prepared for any emergency.</li>
					 								
													  <strong><li>Minimum contingency fund required <span class="red">Rs.${output.minimumEmergencyFund}</span></strong></li>
					                                  
					                                  <li>Invest this money in :<ul><li> Savings Bank Account</li>
													<li>Fixed Deposits</li>
													<li> Ultra Short term Debt funds</li></ul></li>
					                                  
														
														<li>Suggested holding pattern :</li>
													<li>Joint (Either or Survivor mode) with close family member</p></li></ul>
							  				</div>	
      									</c:otherwise>
						
						</c:choose>
                          
					 
                           
                         <div class="outputdisclaimerfooter" style="margin-top: 256px!important;">
						<div id="disclaimer"><h2>Assumptions/Disclaimer</h2> 
                            <strong>IF YOU HAVE INDICATED A RANGE: </strong>The median of the range you have indicated as your monthly expense has been used as the basis of calculation. If expense is <span class="disclaimer_text">25k</span> -expense assumed is <span class="disclaimer_text">25k</span> and where expense is indicated to be more than <span class="disclaimer_text">100k </span>- expense assumed is <span class="disclaimer_text">100k.</span> 6 months xpense is recommended to be maintained as an emergency backup. But depending on your industry, work profile, other income etc this can vary</div> 
						</div>
			   </div></div><!-- END pf-op-container -->      
<!--1st page End -  Emergency Readiness --->	
<!--2nd page start -  Risk Cover --->		
     <div class="output-body pf-op-body" id="riskPage"  style="height: 1495px; ">
  <!--header Start--> 
						<div class="output_header">
                          <div class="consultant_strip">
<%--                             <div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
                            <div style="font-size: 18px;">${output.partnerName}</div>
                          </div>
                                <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                           <div class="output_header_head">Page 2 
<%--                            <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                           </div>
                </div>
   <!--header Start--> 
        <div id="mainleft">
 		  <div id="riskCoverQuestion">
          
          </div>
       </div>
       <div id="mainright">
       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/risk.gif" />
        </div>  	<br /> <br />
						<div class="pf-op-container group">
							
							<div class="first-take" style="height:150px!important;">
								<p class="heading">First Take</p>
									<c:choose >						
										    <c:when test="${output.riskFlagColor=='red'}">
										    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" style="with:92px; height:100px;"  alt="" class="up">
										    </c:when>
										     <c:when test="${output.riskFlagColor=='amber'}">
										    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/mid.png" style="with:92px; height:100px;" alt="" class="up">
										    </c:when>
										    <c:otherwise>
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png" style="with:92px; height:100px;" alt="" class="up">
	      									</c:otherwise>
							    	</c:choose>
							</div>
							<div class="current-sit" style="height:150px!important;">
                            	<p class="heading">Your Insurance</p>
<!-- 								<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/meter-3.png" alt="" style="with:192px; height:100px;"> -->
                            	<img src="${output.meterGaugeStr1}"
							alt="Insurance Meter Not Available"
							style="with:192px; height:100px; position: relative; bottom: 14px;" />		
				  		  </div>
                          
                          
							<div class="graphical-rep" class="current-sit" style="height:314px!important;">
								<p class="heading">Importance of insurance</p>
                                <div id="graphic_text">You can manage risks in many ways - build a corpus, build a support system, take insurances,  just take better care.<br />
                                  Insurances to some extent soften the blow when  loss of life or loss of health or other financial difficulties happen.<br />
                                  But being under  prepared  or ill  prepared is the same as being not prepared, exposing your family to  undue difficulties<br />
                                Risk Planning is a responsibility, a duty  we cannot shirk away from.</div>
						  </div>
			 		<div class="suggestion" class="current-sit" style="height:314px!important;">
					<p class="heading">Our Suggestion</p>
					<p class="suggestion_text">
	                Life Insurance required <span class="red">Rs.${output.idealInsurance}/-</span><br/>
	               	Life Insurance available <span class="red">Rs.${output.currentInsurance}/-</span><br/>
	                <span class="suggestion_textbig">ADDITIONAL LIFE INSURANCE NEEDED </span><c:choose ><c:when test="${output.necessaryInsurance==''}"><span class="red">0/- </span> <span class="suggestion_textbig">You are adequately insured.</span> </c:when><c:otherwise><span class="red">Rs.${output.necessaryInsurance}/- </span></c:otherwise></c:choose>              
	                </p>  
		              <p  class="suggestion_text">
		              Health insurance required <span class="red">Rs.${output.healthInsuranceCoverAmount}/-</span><br/>
		              Health insurance available <span class="red">Rs.${output.currentHealthInsurance}/-</span><br/>
		                <span class="suggestion_textbig">ADDITIONAL HEALTH INSURANCE NEEDED </span><c:choose ><c:when test="${output.healthInsuranceAdqueteAmat==''}"><span class="red">0/- </span> <span class="suggestion_textbig">You are adequately insured.</span> </c:when><c:otherwise><span class="red">Rs.${output.healthInsuranceAdqueteAmat}/- </span></c:otherwise></c:choose>
		              </p>
		               <p  class="suggestion_text">
		              Critical illness insurance required  <span class="red">Rs.${output.criticalIllnessInsurance}/-</span><br/>
		              Critical illness insurance available <span class="red">Rs.${output.currentCriticalIllnesCoverAmout}/-</span><br/>
		                <span class="suggestion_textbig">ADDITIONAL CRITICAL ILLNESS INSURANCE NEEDED     </span><c:choose ><c:when test="${output.criticalIllNessInsuranceAdqueteAmat==''}"><span class="red">0/- </span><span class="suggestion_textbig"> You are adequately insured.</span> </c:when><c:otherwise><span class="red">Rs.${output.criticalIllNessInsuranceAdqueteAmat}/- </span></c:otherwise></c:choose>
		              </p> 
		              <p  class="suggestion_text">
		              Accident insurance required <span class="red">Rs.${output.accidentInsurance}/-</span><br/>
		              Accident insurance available <span class="red">Rs.${output.currentpersonalInsuranceCoverAmt}/-</span><br/>
		                <span class="suggestion_textbig">ADDITIONAL ACCIDENT INSURANCE NEEDED     </span><c:choose ><c:when test="${output.personalAcdntInsuranceAdqueteAmat==''}"><span class="red">0/- </span> <span class="suggestion_textbig">You are adequately insured.</span> </c:when><c:otherwise><span class="red">Rs.${output.personalAcdntInsuranceAdqueteAmat}/- </span></c:otherwise></c:choose><br/><br/>
		               <span class="suggestion_textbig">Asset insurance required - to cover value of assets owned.</span>
		
		              </p>                          
                                     
               </div>
                        
                            <c:choose >						
										    <c:when test="${output.saving=='0'}">
												  <div class="outputdisclaimerfooter" >
												<div id="disclaimer"><h2>Assumptions/Disclaimer</h2>
												HLV method has been used for suggesting the amount of life insurance you need. However the Human Life Value method is more scientific. How much health insurance your family needs can also vary based on your area of domicile, family health history, lifestyle habits and more.			    	
												</div>
												</div>
										    </c:when>
										    <c:when test="${output.saving=='1'}">
										     <div class="outputdisclaimerfooter" >
												<div id="disclaimer"><h2>Assumptions/Disclaimer</h2>
												Expense Replacement method has been used for suggesting the amount of life insurance you need. However the Human Life Value method is more scientific. How much health insurance your family needs can also vary based on your area of domicile, family health history, lifestyle habits and more.			    	
										    </div>
										    </div>
										    </c:when>
										    <c:otherwise>
										    <div class="outputdisclaimerfooter" >
												<div id="disclaimer"><h2>Assumptions/Disclaimer</h2>
										    	Income Replacement method has been used for suggesting the amount of life insurance you need. However the Human Life Value method is more scientific. How much health insurance your family needs can also vary based on your area of domicile, family health history, lifestyle habits and more.
										   </div>
										   </div>
										    </c:otherwise>
										 </c:choose>
						</div>
			   </div> <!-- END pf-op-container --> 


<!--3rd page start - Goal Readiness --->	
<c:set var="counter" value="1"/>	
    <div class="output-body pf-op-body"  style="height: 1495px;">
 <!--header Start--> 
       <div class="output_header">
                      <div class="consultant_strip">
<%--                         <div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
                        <div style="font-size: 18px;">${output.partnerName}</div>
                      </div>
                      <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                       <div class="output_header_head">Page 3 
<%--                        <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                       </div>
             </div>
  <!--header Start--> 
        <div id="mainleft">
    <div id="goalReadyQuestion">
          
          </div>
                	
        </div>
        <div id="mainright">
       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/goal.gif" />
        </div>  	<br /> <br />
						<div class="pf-op-container group">
						<c:forEach items="${output.goalList}" var="goalList"> 
						<c:if test="${counter==1}">
							<c:set var="pecentGoalReachable1" value="${goalList.percentGoalReachable}" />
							<div class="first-take">
								<p class="heading">First Take</p>
								
<!-- 								<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down1.png" alt="" class="Down"> -->
								<c:choose >						
										    <c:when test="${goalList.percentGoalReachable<80}">
										    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png"   alt="" class="down">
										    </c:when>
										     <c:when test="${goalList.percentGoalReachable>=80 && goalList.percentGoalReachable<100 }">
										    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/mid.png"   alt="" class="mid">
										    </c:when>
										      <c:otherwise>
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png"  alt="" class="up">
	      									</c:otherwise>
								</c:choose>
								
								
								
							
							</div>
							<div class="current-sit">
		                          <p class="heading">Goal of <span class="red">${goalList.goalDescription}</span></p>
		                          <div class="small-pile" style="margin-top:70px"><p class="red">${goalList.startYear}<br />
			                            <span class="red"> (Rs.${goalList.currentValue}/-) </span></p>
			                            <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/money-pile.png" />
		                            </div>
		                            <div class="small-pile"><p>You will need in <span class="red"><br />
			                          ${goalList.goalEndYear}</span> an amount of<br /> 
			                            <span class="red"> (Rs.${goalList.futureValueOfGoal}/-) </span> for achieving your goal</p>
		                            </div>	
									 <div class="small-pile">
										   <p class="red"> ${goalList.goalEndYear}<br />
										     <span class="red"> (Rs.${goalList.futureValueOfGoal}/-) </span></p>
									       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/large-pile.png" />
								      </div>
						    	
						  </div>
						   <div class="graphical-rep">
								<p class="heading">Achieving your Goal</p>
                                  
                                  <p class="red"
									style="position: relative; top: 20px; left: 137px; font-weight: normal; width: 30px;">
									${goalList.startYear}</p>
								<p class="red"
									style="position: relative;width: 27px;top: 133px;font-weight: normal;left:${(((goalList.percentGoalReachable-10)*20)/10)+160}px;">
									${goalList.goalEndYear}</p>
								<p class="red"
									style="position: relative;width: 30px;top:23px;font-weight: bold;left:${(((goalList.percentGoalReachable-10)*20)/10)+160}px;">
									${goalList.percentGoalReachable}%</p>
								<!-- 								<div style="position: relative;left: -5px;top:-41px;"> -->
								<img alt=""
									src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/arowdownyellow.png"
									style="bottom: 41px; width: 20px; position: relative; right: 131px;">

								<!-- 								</div> -->

								<div
									style="width: 200px; height: 20px; position: relative; left: 151px;">
									<div id="green"
										style="width: ${goalList.percentGoalReachable*2}px;background-color: green;height: 100%;float: left;margin-top: -21px;"></div>
									<div id="red"
										style="width: ${200-(goalList.percentGoalReachable*2)}px;background-color: red;  height: 100%;margin-right: 0px;float: right;margin-top: -21px;"></div>
								</div>
								<img alt=""
									src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/arowupwhite.png"
									style="width: 20px;top: -8px;position: relative;right: ${115-(((goalList.percentGoalReachable-10)*20)/10)}px;">
                                  
                                  
                                  <div id="graphic_text">Whatever you are doing now will  
	                                help you accumulate of <span class="red"> ${goalList.percentGoalReachable}% </span><br />
	                              the total amount you will need.
	                              </div>
						  </div>
						  <div class="suggestion">
								<p class="heading">Our Suggestion</p>
								<p class="suggestion_text">
								<ul><li>With current assets and investments you can achieve<span class="red"> ${goalList.percentGoalReachable}(%)</span> of your <span class="red">${goalList.goalDescription}</span>  in the year <span class="red"> ${goalList.goalEndYear}</span></li>
                                  <strong> Suggested action :</strong>
										<li>Invest <span class="red"> Rs.${goalList.regularInvestment}/-</span> every month (or)<span class="red"></span><span class="plusicon"> <span class="red">Rs.${goalList.goalPV}/-</span> one time</span></li>
								
										<li>Also Align the investments to the goal and keep in separate investment accounts.</li>
										<li> Reallocate assets to optimize risk and returns</li>
										<li> Regularly rebalance portfolio</li>
										<li>As goals get nearer, move assets to safer avenues like liquid funds / bank accounts</li></ul>
								</p>
						       
						</div>  
								
						
<%--                          <c:set var="counter" value="${counter+1}" /> --%>
                         <div class="outputdisclaimerfooter" style="margin-top: 165px !important;">
						<div id="disclaimer"><h2>Assumptions/Disclaimer</h2> 
                             Inflation is assumed at <span class="disclaimer_text">${output.inflationRate}%</span>. Investment need is calculated on the basis of <span class="disclaimer_text">${goalList.futureValueOfAssets}%</span> future returns.Assets are grown as per assumed growth rate of asset class. Assets are consumed in the order - Shares, mutual funds, deposits, bonds, gold and real estate in the order of liquidatability.All current investments
have been aligned to the earliest goal and any surpluses have been aligned to subsequent goals.</div> 
						</div>
						</c:if>
						<c:set var="counter" value="${counter+1}" />		
                         </c:forEach>
						</div></div> <!-- END pf-op-container -->    
						 
<!--3rd  page End -  Goal Readiness --->


<!--4th page start - Goal Readiness --->

<c:set var="pgcounter" value="3" />
		<c:set var="counter" value="1" />
		<c:set var="totalGoals" value="${output.goalList.size()}" />
<input type="hidden" value="${totalGoals}" name="totalGoals">
<input type="hidden" value="${output.goalList.size()}" name="goalSize">
		<c:if test="${totalGoals>1}" >
         
				
        <c:forEach items="${output.goalList}" var="goalList"> 
       
       					<c:choose>	
						<c:when test="${counter>1}">
						  <div class="output-body pf-op-body" style="height: 1495px; ">
<%-- 							<c:choose> --%>
							
<%-- 							<c:when test="${counter%2==0}"> --%>
								<input type="hidden" name="countern" value="${counter}">
							<div class="output_header" >
                          <div class="consultant_strip">
<%--                             <div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
                            <div style="font-size: 18px;">${output.partnerName}</div>
                          </div>
                            <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                           <div class="output_header_head">Page ${pgcounter} 
<%-- 	                           		<span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
	                           
               			</div>
						</div>
<%-- 							</c:when> --%>
						
<%-- 							</c:choose>. --%>
					
        
        <div id="mainleft">
        <div style="margin-top:20px;"> </div>
        <div class="first-take">
								<p class="heading">First Take</p>
<!-- 								<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down1.png" alt="" class="up"> -->
								<c:choose >						
										    <c:when test="${goalList.percentGoalReachable<80}">
										    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png"   alt="" class="up">
										    </c:when>
										     <c:when test="${goalList.percentGoalReachable>=80 && goalList.percentGoalReachable<100 }">
										    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/mid.png"   alt="" class="up">
										    </c:when>
										      <c:otherwise>
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png"  alt="" class="up">
	      									</c:otherwise>
								</c:choose>
				
		</div>
        <div class="current-sit" >
                         
		                          <p class="heading">Goal of <span class="red">${goalList.goalDescription}</span></p>
		                          <div class="small-pile" style="width: 130px!important;"><p class="red">${goalList.startYear}<br />
			                            <span class="red">(Rs.${goalList.currentValue}/-) </span></p>
			                            <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/money-pile.png" />
		                            </div>
		                            <div class="small-pile" style="width: 110px!important;"><p>You will need in <span class="red"><br />
			                          ${goalList.goalEndYear}</span> an amount of<br /> 
			                            <span class="red">(Rs.${goalList.futureValueOfGoal}/-) </span> for achieving your goal</p>
		                            </div>	
									 <div class="small-pile">
										   <p class="red"> ${goalList.goalEndYear}<br />
										     <span class="red"> (Rs.${goalList.futureValueOfGoal}/-) </span></p>
									       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/large-pile.png" />
								      </div>
						    	
		</div>
                           
        <div class="graphical-rep" style="height: 335px!important;">
							  <p class="heading">Achieving your Goal</p>
																	<div style="margin-top: 30px">
																	<p class="red question"
										style="position: relative; top: -17px; left: 141px; font-weight: bold; width: 30px;">
										${goalList.startYear}</p>
									<p class="red question"
										style="position: relative;width: 30px;top:  99px;font-weight: bold;left:${(((goalList.percentGoalReachable-10)*20)/10)+132}px;">
										${goalList.goalEndYear}</p>
									<p class="red questionAnalysisR"
										style="position: relative;width: 30px;font-weight: bold;font-size: 16px;left:${(((goalList.percentGoalReachable-10)*20)/10)+158}px;">
										${goalList.percentGoalReachable}%</p>
									<!-- 								<div style="position: relative;left: -5px;top:-41px;"> -->
									<input type="hidden" name="xyzzz" value="${(((goalList.percentGoalReachable-10)*20)/10)+195}">
									<img alt=""
										src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/arowdownyellow.png"
										style="bottom: 18px; width: 20px; margin-left: 141px;margin-top: -43px;">

									<!-- 								</div> -->

									<div
										style="width: 200px; height: 20px; position: relative; left: 151px;">
										<div id="green"
											style="width: ${goalList.percentGoalReachable*2}px;background-color: green;height: 100%;float: left;margin-top: -9px;"></div>
										<div id="red"
											style="width: ${200-(goalList.percentGoalReachable*2)}px;background-color: red;  height: 100%;margin-right: 0px;float: right;margin-top: -9px;"></div>
									</div>
									<img alt=""
										src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/arowupwhite.png"
										style="width: 20px;top: -5px;position: relative;left: ${(((goalList.percentGoalReachable-10)*20)/10)+160}px;">			                             
                             </div>
                              <div id="graphic_text" style="margin-top:  50px;">Whatever you are doing now will  
                              help you accumulate <span class="red"> ${goalList.percentGoalReachable}% </span>of the total amount you will need.</div>
		</div>
		
			  <div class="suggestion" style="height: 335px!important;">
								<p class="heading">Our Suggestion</p>
								<p class="suggestion_text">
								<ul  class="question" style="font-size: 14px !important;"><li>
								With current assets and investments you can achieve<span class="red"> ${goalList.percentGoalReachable}(%)</span> of your <span class="red">${goalList.goalDescription}</span> in the year <span class="red"> ${goalList.goalEndYear} </span></li>
								<li>  <strong> Suggested action :</strong></li>
							 <li>Invest <span class="red"> Rs.${goalList.regularInvestment}/-</span> every month (or)<span class="red"></span><span class="plusicon"> <span class="red">Rs.${goalList.goalPV}/-</span> one time.</span></li>
								
							<li>Also Align the investments to the goal and keep in separate investment accounts.</li> 
							<li> Reallocate assets to optimize risk and returns</li>
							 <li>Regularly rebalance portfolio</li>
							<li> As goals get nearer, move assets to safer avenues like liquid funds / bank accounts.</li>
							</ul>
							 </p>
		  </div>	
         
           </div>
<%--           <c:if test="${counter%2==1}"> --%>
                        <div id="mainright">
       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/goal.gif" />
        </div>  
<%--         </c:if> --%>
        <input type="hidden" name="counterValue" value="${counter}">
<%--                  	<c:if test="${counter%2==1}"> --%>
                         <div class="outputdisclaimerfooter question" style="margin-top:  647px;color: black !important;">
							<div id="disclaimer"><h2>Assumptions/Disclaimer</h2> 
	                             Inflation is assumed at <span class="disclaimer_text">${output.inflationRate}%</span>. Investment need is calculated on the basis of <span class="disclaimer_text">${goalList.futureValueOfAssets}%</span> future returns.Assets are grown as per assumed growth rate of asset class. Assets are consumed in the order - Shares, mutual funds, deposits, bonds, gold and real estate in the order of liquidatability.All current investments
								have been aligned to the earliest goal and any surpluses have been aligned to subsequent goals..
							</div> 
						</div>
<%-- 					</c:if> --%>
						</div>
				</c:when>
				</c:choose>
<%-- 				<c:choose> --%>
<%-- 			<c:when test="${counter!=1 && counter%2==1 && counter!=totalGoals}"> --%>
						<c:set var="pgcounter" value="${pgcounter+1}" />
<%-- 					</c:when> --%>
<%-- 					</c:choose>	 --%>
						 <c:set var="counter" value="${counter+1}" />	
				
				
				</c:forEach>
					
			   
			   </c:if>
			   
			 <c:choose>
			 <c:when test="${pgcounter=='3'}">
										    <c:set var="pgcounter" value="${pgcounter+1}" />	
							 </c:when>
			 </c:choose>
			   
<%-- <c:set var="pgcounter" value="${pgcounter+1}" />	    --%>
			   
<!-- 4th  page End -  Goal Readiness --->
<!--5th page start - Loan Status --->		
    <div class="output-body pf-op-body" id="loanPage" style="height: 1495px!important;">
  <!--header Start--> 
  <div class="output_header">
                          <div class="consultant_strip">
<%--                             <div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
                            <div style="font-size: 18px;">${output.partnerName}</div>
                          </div>
                                <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                           <div class="output_header_head">Page ${pgcounter} 
<%--                            <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                           </div>
                 
               </div>
 <!--header end--> 
        <div id="mainleft">
           <!--1 start --> <div id="loanQuestions">
          
          </div>
       </div>
            	<div id="mainright"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/loan.gif" alt="" /></div>  	
<br /> <br />
						<div class="pf-op-container group">
							
							<div class="first-take">
								<p class="heading">First Take</p>
<!-- 								<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" alt="" class="up"> -->
							<c:choose >						
										    <c:when test="${output.loanEmiPercentage>50 && output.age<35}">
										    	 <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" alt="" class="down">
										    </c:when>
										     <c:when test="${output.loanEmiPercentage<50 && output.age<35 }">
										    	<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png"   alt="" class="up">
										    </c:when>
										      <c:when test="${output.loanEmiPercentage<35 && output.age>35}">
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png"   alt="" class="up">
	      									</c:when>
	      									<c:when test="${output.loanEmiPercentage>35 && output.age>35}">
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png"   alt="" class="down">
	      									</c:when>
	      									<c:when test="${output.isplanToTakeLoan==1}">
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/mid.png"   alt="" class="mid">
	      									</c:when>
	      									<c:when test="${output.isplanToTakeLoan!=1}">
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png"   alt="" class="up">
	      									</c:when>
	      									<c:when test="${output.isplanToTakeLoan==0 && output.isLoanTaken==0}">
	      										<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png"   alt="" class="up">
	      									</c:when>
	      									
								</c:choose>
							</div>
							<div class="current-sit">
								  <p class="heading">Your Loans</p>
<!-- 									<div class="loantext"><ul><li>Your loan commitments seem within -->
<!-- 									  normal limits.</li><li> However getting out of -->
<!-- 									  loans sooner can release cashflows that -->
<!-- 									  can be used for other beneficial -->
<!-- 									  purposes.</li>You can -->
<!-- 									  <li> Consider consolidating your loans by -->
<!-- 									  taking a larger lower cost loan and repay -->
<!-- 									  the higher cost loans</li> -->
<!-- 									  <li>Extend the tenure of loan for a short -->
<!-- 									  while, to handle cashflows better</li> -->
<!-- 									  <li>Negotiate good deals and repay some -->
<!-- 									  loans if possible</li> -->
<!-- 									  <li>Follow debt repayment plans like debt -->
<!-- 								    snowballing etc to get out of debt.</li></ul></div> -->
							<div class="loanimg">
							 <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/loans-bg.png" width="250" height="184" /> </div>
						 </div>
							<div class="graphical-rep">
								<p class="heading">Leverage - take you UP or DOWN</p>
                                <div id="graphic_text">Are loans good or bad?<br />
                                  Loans help us acquire assets that can make us 
                                  wealthy. If managed well it can catapult us to the 
                                  next level - that is why is it called leverage.<br />
                                  But when not managed properly it can leave us in 
                                  deep trouble.<br />
                                  As long as the loan is helping you improve your 
                                  wealth or income and as long as repaying the loan 
                                  is not a big stress on your pocket or head - loans 
                                are good.</div>
						  </div>
							<div class="suggestion">
								<p class="heading">Our Suggestion</p>
								<c:choose >						
										  <c:when test="${output.loanEmiPercentage>50 && output.age<35}">
										    <p class="suggestion_text">Your loan commitments are higher than normally comfortable.<br/>
			                                  <br />
			                               <ul>  <li> You can  Consider consolidating your loans by taking a larger
											      lower cost loan and repay the higher cost loans. </li><li>Extend the tenure
											      of loan for a short while, to handle cashflows better. </li><li> Negotiate
											      good deals and repay some loans if possible. </li><li> Follow debt repayment
											      plans like debt snowballing etc to get out of debt. Subscribe to our
											      debt management services for customised help.</li>
											        </ul>
											</p>	 
										  </c:when>
										   <c:when test="${output.loanEmiPercentage<50 && output.age<35}">
									         <p class="suggestion_text" > 
											    <ul><li>  Your loan commitments seem within normal limits. However getting out of loans sooner can release cashflows that can be used for other 
											    beneficial purposes.</li><li> You can  Consider consolidating your loans by 
											    taking a larger lower cost loan and repay the higher cost loans. </li><li>Extend 
											    the tenure of loan for a short while, to handle cashflows better. </li><li> 
											    Negotiate good deals and repay some loans if possible. </li><li> Follow debt 
											    repayment plans like debt snowballing etc to get out of debt. 
											    Subscribe to our debt management services for customised help.</li>
										    </ul>
										     </p>
										     
										    </c:when>
										    <c:when test="${output.loanEmiPercentage<35 && output.age>35}">
										        <p class="suggestion_text" style="text-align: left;!important"> 
												 <ul> <li> Your loan commitments seem within normal limits. However getting out of loans sooner can 
												   release cashflows that can be used for other beneficial purposes.</li><li> You can  Consider 
												   consolidating your loans by taking a larger lower cost loan and repay the higher cost 
												   loans <br>-Extend the tenure of loan for a short while, to handle cashflows better. </li><li> Negotiate 
												   good deals and repay some loans if possible. </li><li> Follow debt repayment plans like debt snowballing 
												   etc to get out of debt. Subscribe to our debt management services for customised help.</li>
											    </ul>
											     
											     </p>
     									 </c:when>
     									  <c:when test="${output.loanEmiPercentage>35 && output.age>35}">
										        <p class="suggestion_text" style="text-align: left;!important"> 
												 <ul> <li> Your loan commitments are higher than normally comfortable. </li><li>You can  Consider 
												  consolidating your loans by taking a larger lower cost loan and repay the higher
												  cost loans </li><li>Extend the tenure of loan for a short while, to handle cashflows better.
												   </li><li> Negotiate good deals and repay some loans if possible. </li><li> Follow debt repayment
												    plans like debt snowballing etc to get out of debt. Subscribe to our debt 
												    management services for customised help.</li>
											    
											      </ul>
											     </p>
      									</c:when>
      									 <c:when  test="${output.isplanToTakeLoan==1}">
										      <ul> <li>If you are looking at taking any loans in future, you should get your 
										      credit rating checked. A good credit score will ensure you get good 
										      deals on new loans.</li><li> In the future, even post paid telephone connections 
										      will need good credit scores.</li><li> Employers check credit scores before 
										      offering jobs to new employees. </li></ul>
	     								 </c:when>
	     								 <c:when test="%{output.isplanToTakeLoan==0 && output.isLoanTaken==0}">
										      <ul> <li>Even though you are not planning to take new loans, get your credit rating checked. 
										      A good credit score will ensure you get good deals on new loans.</li><li>  In the future, 
										      even post paid telephone connections will need good credit scores.</li><li> Employers check 
										      credit scores before offering jobs to new employees. </li></ul>
	      								</c:when>
      									
										  
							    </c:choose>
								
						  </div>	
                           <!-- <div id="disclaimer"><h2>Assumptions/Disclaimer</h2> 
                            The median of the range you have indicated as your monthly expense has been used as the basis of calculation. If expense is &lt;25k - expense assumed is 25k and where expense is indicated to be more than 100k - expense assumed is 100k. The possible saving is the difference between your monthly expenses and compulsory expenses. The rate of return assumed for demonstrating Power of compounding is 10%.</div> -->
                        
			   </div></div> <!-- END pf-op-container -->  
			   <c:set var="pgcounter" value="${pgcounter+1}" />	   
<!--5th  page End -  Loan Status --->	
 <!--6th page start - Retirement Planning --->		
     <div class="output-body pf-op-body" id="retirmentPage" style="height: 1495px;">
						<div class="output_header">
                  <div class="consultant_strip">
<%--         			<div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
       				<div style="font-size: 18px;">${output.partnerName}</div>
                  </div>
                        <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                   <div class="output_header_head">Page ${pgcounter}
<%--                    <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                   </div>
                 
               </div>
        <div id="mainleft">
        
		 <div id="retirementPlanQuestion">
          
          </div>	
        
        </div> 
            	<div id="mainright">
       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/retirement.gif" />
        </div>  	<br /> <br />
						<div class="pf-op-container group">
							
							<div class="first-take">
								<p class="heading">First Take</p>
<!-- 								<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" alt="" class="up"> -->
								<c:choose >						
										    <c:when test="${output.percentGoalReachable<80}">
										    	 <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" alt="" class="down">
										    </c:when>
										    <c:when test="${output.percentGoalReachable>=80 && output.percentGoalReachable<=99}">
										    	 <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/mid.png" alt="" class="mid">
										    </c:when>
										    <c:otherwise>
										     <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png" alt="" class="up">
										    </c:otherwise>
								</c:choose>
							</div>
							<div class="current-sit">
                          <p class="heading">Your retirement plans</p>
                          <div class="small-pile" style="margin-top:70px"><p class="red">${output.currentYear}<br /> (Rs. ${output.monthlyExpenses}/-)</p><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/small-pile-chair.png" /></div>
                            <div class="small-pile">
                              <p>Today you spend  <br />
                                <span class="red">Rs. ${output.monthlyExpenses}/-</span><br />
                              To maintain the same<br />
                              lifestyle<br />
                              on the year of<br />
                              your retirement<br />
                              you will have to<br />
                              spend<br />
                              <span class="red">Rs.${output.futureMonthlyExpenses}/-</span></p>
                            </div>	
							 <div class="small-pile">
							   <p class="red">${output.retirementYear}<br />(Rs.${output.futureMonthlyExpenses}/-)</p>
							   <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/large-pile-chair.png" /></div>
						      
                             
								
						  </div>
					  <div class="graphical-rep" style="width:48%; height: 340px;">
								<p class="heading">Before retirement, if you can<br />
								  accumulate a corpus of <span class="red">Rs.${output.retirementNeed}/-</span><br />
							    your second innings will be secure and fun</p>
							    <p class="red"
							style="position: relative; top: 28px; left: 137px; font-weight: normal; width: 30px;">${output.currentYear}</p>
						<p class="red"
							style="position: relative;width: 30px;top: 136px;font-weight: normal;left:${(((output.percentGoalReachable-10)*20)/10)+160}px;">${output.retirementYear}</p>
						<p class="red"
							style="position: relative;width: 30px;top:28px;font-weight: bold;left:${(((output.percentGoalReachable-10)*20)/10)+160}px;">
							${output.percentGoalReachable}%</p>
						<img alt=""
							src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/arowdownyellow.png"
							style="bottom: 30px; width: 20px; position: relative; right: 81px;">
						<div
							style="width: 200px; height: 20px; position: relative; left: 151px;">
							<div id="green"
								style="width: ${output.percentGoalReachable*2}px;background-color: green;height: 100%;float: left;margin-top: -16px;"></div>
							<div id="red"
								style="width: ${200-(output.percentGoalReachable*2)}px;background-color: red;  height: 100%;margin-right: 0px;float: right;margin-top: -16px;"></div>
						</div>
						<img alt=""
							src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/arowupwhite.png"
							style="width: 20px;top: -8px;position: relative;right: ${67-(((output.percentGoalReachable-10)*20)/10)}px;">
                                <div id="graphic_text">
                          <p>Whatever you are doing now will  
                                help you accumulate of <span class="red">${output.percentGoalReachable}% </span> the total amount you will need.</p>
                          <p>&nbsp;</p>
                        </div>
						  </div>
				<div class="suggestion"  style="width:49%;height: 340px;">
								<p class="heading">Our Suggestion</p>
								<c:choose >						
										    <c:when test="${output.percentGoalReachable<80}">
										    	<p class="suggestion_text" style="text-align: left;!important">
												<ul><li>You may fall short of the amount you need for retirement by <span class="red">Rs.${output.retirmenrShortfallAmt}/-.</span></li> 
												<li> You can bridge this gap by investing  <span class="red">
												Rs.${output.regularInvestmentRetirement}/- </span>regularly (or)
												 Invest a lumpsum amount of <span class="red"> Rs.${output.retirementLumpsum}/-</span>
												one time in investments that earn ${output.expectedReturnOnNewInvestment} percent returns.</li>
												<li>You can consider
												<ul><li>Reducing your expenses after retirement.</li>
												<li>Liquidating some investments to provide cashflows.</li>
												<li>Options like reverse mortgage / community living etc.</li>
												<li>Things to be taken care while investing your retirement corpus are
												safety, easy accessibility, smooth cashflows, operational ease and tax
												efficiency.</li></ul></li></ul>
												</p>
										    </c:when>
										     <c:when test="${output.percentGoalReachable>=80 && output.percentGoalReachable<=99}">
											     <p class="suggestion_text" style="text-align: left;!important">
											     <ul><li>Your goal of Retirement in the year <span class="red">${output.retirementYear}</span>
												can be somewhat achieved with the assets you have and with the investments
												 you are doing. You can do the following to do better : </li>
												 <li> Invest an amount of
												<span
													class="red">
													Rs.${output.regularInvestmentRetirement}/-</span> regularly</li> 
													 <li>
													 or Invest a lumpsum amount of <span class="red"> Rs.${output.retirementLumpsum}/-</span> one time - Align the
												 investments to the goal and keep in separate a/cs. </li>
												 <li>Reallocate assets to reduce risks and improve returns.</li>
												 <li>Regularly rebalance portfolio.</li>
												 <li>Improve chances of achieving goals by moving assets to safer and easily en-cashable investments as the goals get closer.</li>
												 <li>Things to be taken care while investing your retirement corpus are
												safety, easy accessibility, smooth cashflows, operational ease and tax
												efficiency.
												 </li></ul>
											     </p>
										     </c:when>
										     <c:otherwise>
											     <p class="suggestion_text" style="text-align: left;!important">
												     <ul><li>Your goal of Retirement in the year <span class="red">${output.retirementYear}</span>
													can be comfortably achieved with the assets you have and with the investments
													 you are doing. You can do the following to do better :</li>
													 <li>Reallocate assets to reduce risks and improve returns.</li>
													 <li>Regularly rebalance portfolio.</li>
													 <li>Improve chances of achieving goals by moving assets to safer and easily en-cashable investments as the goals get closer.</li>
													 <li>Things to be taken care while investing your retirement corpus are
													safety, easy accessibility, smooth cashflows, operational ease and tax
													efficiency.</li></ul>
												
												 <br />
										</p>
										     </c:otherwise>
										    </c:choose>
								
			 </div>	
                        
                             <div class="outputdisclaimerfooter" style="margin-top: 36px!important;">
<div id="disclaimer"><h2>Assumptions/Disclaimer</h2> 
                             Inflation is assumed at <span class="disclaimer_text">${output.inflationRate}%.</span>. Investment need is calculated on the basis of <span class="disclaimer_text">${output.expectedReturnOnNewInvestment}%</span> future returns. 
 Assets are grown as per assumed growth rate of asset class. Assets are consumed in the order - Shares, mutual funds, deposits, bonds, gold and real estate in the order of liquidatability.A detailed retirement plan might be able to give you realistic figures.</div> 
						</div> </div></div><!-- END pf-op-container -->    
<!--6th  page End -  Retirement Planning ---> 

<!--7th page start - Cash Flow --->		
     <div class="output-body pf-op-body" id="cashflowpage" style="height: 1495px;">
						<div class="output_header">
                  <div class="consultant_strip">
<%--         			<div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
       				<div style="font-size: 18px;">${output.partnerName}</div>
                  </div>
                        <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                   <div class="output_header_head">Page ${pgcounter+1}
<%--                    <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                   </div>
                 
               </div>
        <div id="mainleft">
        <!--1 start -->
           <div id="cashflowQuestions">
           </div>
                
           
        </div> 
            	
           	   <div id="mainright">
       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/cash_flow.gif" />
        </div>  	<br /> <br />
						<div class="pf-op-container group">
							
							<div class="bigboxtable" style="font-size:15px;">
                           	 	<div class="table-responsive" id="display_table_lead" style="border:none; width:70%; margin:0 auto; margin-top:20px;">
                           	 	 <center><table class="table table-hover table-bordered table-striped" width="70%" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td class="thead"><strong>Details</strong></td>
                                      <td  class="thead"><strong>Amount in Rs. (per month) </strong></td>
                                    </tr>
                                    <tr>
                                      <td >Your Income</td>
                                      <td  ><span class="red">${output.income}</span></td>
                                    </tr>
                                    <tr>
                                      <td>Your Expense</td>
                                      <td ><span class="red">${output.monthlyExpenses}</td>
                                    </tr>
                                    <tr>
                                      <td>Your Loan Repayment</td>
                                      <td ><span class="red">${output.monthlyEmi}</span></td>
                                    </tr>
                                    <tr>
                                      <td>Your current investments</td>
                                      <td ><span class="red">${output.sumOfCurrentRegInvAndRetirment}</span></td>
                                    </tr>
                                  </table></td>
                                        </tr>
                           	 	</table></center>
                             
                                NET SURPLUS AVAILABLE  <span class="red">Rs ${output.surplus}</span><br/>
                                TO MEET YOUR GOALS - ADDITIONAL INVESTMENT REQUIRED <span class="red"> Rs ${output.totalRegularInvestmentFromGoals} </span><br/><br/>
                                <strong> Our Suggestion :</strong><br/>
                                - Do a detailed cash flow plan<br/>
								- Invest surplus in a planned manner
	
 </div>
							 </div>
							
                            
                            <div class="outputdisclaimerfooter" style="margin-top: 466px!important;">
<div id="disclaimer"><h2>Assumptions/Disclaimer</h2> 
                              <strong>IF YOU HAVE INDICATED A RANGE</strong>: IF YOU HAVE INDICATED A RANGE The median of the range you have indicated as your monthly expense has been used as the basis of calculation. If expense is less than <span class="disclaimer_text">25k</span>
                             then expense assumed is <span class="disclaimer_text">25k</span> and where expense is indicated to be more than 100k then expense assumed is <span class="disclaimer_text">100k.</span> The possible saving is the difference between your monthly
                              expenses and compulsory expenses. 
<%--                               The rate of return assumed for demonstrating Power of compounding is <span class="disclaimer_text">${output.expectedReturnOnExistingInvestment}%</span>.. --%>
                              </div> 
							</div>	
						</div></div> <!-- END pf-op-container -->   
<!--7th  page End -  Cash Flow --->
<!--8th page start - Succession Readiness --->	
   <c:set var="pgcounter" value="${pgcounter+1}" />		
         <div class="output-body pf-op-body" id="successionPage" style="height: 1495px!important;">
						<div class="output_header">
                  <div class="consultant_strip">
<%--         			<div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
       				<div style="font-size: 18px;">${output.partnerName}</div>
                  </div>
                        <div class="output_base">Analysis Report for <strong>${output.opportunityName}</strong></div>
                   <div class="output_header_head">Page ${pgcounter+1} 
<%--                    <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                   </div>
                 
               </div>
        <div id="mainleft">
 		<div id="successPlanQuestion">
          
          </div>
        </div> 
            	<div id="mainright">
       <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/${sessionScope.userSession.themeName}/succession.gif" />
        </div>  	<br /> <br />
						<div class="pf-op-container group">
							
							<div class="first-take">
								<p class="heading">First Take</p>
<!-- 								<img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" alt="" class="up"> -->
										<c:choose >						
										    <c:when test="${output.isWillPrepared==1}">
										    	 <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/up.png" alt="" class="up">
										    </c:when>
										    <c:when test="${output.isWillPrepared==0}">
										    	 <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/down.png" alt="" class="down">
										    </c:when>
										    <c:otherwise>
										     <img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/mid.png" alt="" class="mid">
										    </c:otherwise>
										 </c:choose>
							</div>
							<div class="current-sit">
							  <p class="heading">Your Legacy lives on...</p>
								<c:choose >						
										    <c:when test="${output.succession['FamilyAware']=='1'}">
										    	<p class="current-sittext"> Your closest family know where you have invested your money						   </p>
										    </c:when>
										    <c:otherwise>
										    <p class="current-sittext" >Nobody
												knows where your hard earned money is invested.</p>
										    </c:otherwise>
								</c:choose>
                               <c:choose >						
										    <c:when test="${output.succession['Access']=='1' && output.succession['JointInvestment']=='1'}">
										    	<p class="current-sittext" >Your
													family has access to your money.</p>						   </p>
										    </c:when>
										    <c:when test="${output.succession['Access']=='1' || output.succession['JointInvestment']=='1'}">
										    <p class="current-sittext" >Nobody in your
												family has reasonable access to your money.</p>
										    </c:when>
										    <c:otherwise>
										    <p class="current-sittext" >Your
												loved ones do not have access to the money you painstakingly
												accumulated for them.</p>
										    </c:otherwise>
								</c:choose>
								 <c:choose>
									<c:when test="%{output.succession['Will']=='1'}">
									<p class="current-sittext" >You
										have written a Will.</p>
								</c:when>
								<c:otherwise>
									<p class="current-sittext" >You
										haven&#39;t written a will to make it easy for them after your
										time.</p>
								</c:otherwise>
                              </c:choose>
                                
                              
						  </div>
                          
                           	
							<div class="graphical-rep">
								<p class="heading">What after you?<br />
                              <span style="font-size:3em; font-family:Arial, Helvetica, sans-serif; color:#000;">  ?</span></p>
                               
                                	<img class="sign" src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/sign.png" alt="">&nbsp;
									<img class="keys" src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/outputaxis/keys.png" alt="">
						  </div>
					 
                     <div class="suggestion">
								<p class="heading">Our Suggestion</p>
								<p class="suggestion_text"> <ul><li>Succession Planning is as good as Risk planning. Both plan for the wellbeing of your loved ones if things don't go too well.</li>
								 <li>You can legally transfer assets through.
								  	<ul><li>Appropriate nominations.</li>
								 	<li>Through a properly written Will.</li>
								  	<li>By creating trusts.</li>
								  	<li>By giving away as Gift.</li></ul></li>
					    <li>Do it today.  Do it for those you love.</li> 
					    <li>Do it for peace - today and tomorrow.</li></ul></p>
						  </div>
                         
			   </div></div> <!-- END pf-op-container -->
<!--8th  page End -  Succession Readiness --->  
   <c:set var="pgcounter" value="${pgcounter+1}" />	
<!--9th page start - Risk profile --->		
 <div class="output-body pf-op-body" id="riskProfilePage">
			   <div class="output_header">
                  <div class="consultant_strip">
<%--         			<div class="clogo"> <img style="width:40px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" /></div> --%>
       				<div style="font-size: 18px;">${output.partnerName}</div>
                  </div>
                        <div class="output_base"> <strong>Your Risk Profile</strong></div>
                           <div class="output_header_head" style="margin-left:0px;">Page  ${pgcounter+1} 
<%--                            <span style="margin:0px 0px 0 10px;"><img src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.partnerLogo}" width="19" height="19" /></span> --%>
                           </div>
                       </div>
<!-- 			   <div class="left" id="left"> -->
<!-- 				<br /><br /> -->
                 
<!-- 			   </div> -->
<!-- 			  <div class="right" id="right"> -->
				
                 
 
<!-- 			   </div>		 -->
<div id="riskProfile" >
</div>
               <div class="bigbox" style="height: 200px;margin-top: 17px;">
               	<p class="headingnew" style="text-align:left;">${output.profile}</p>
               	 <c:choose>
               	 <c:when test="${output.profile=='Conservative'}">
		               	<p>You will be at peace when you dont take risks with your financial decisions. You probably prefer investments
								that are more stable and give steady returns. If some of your investments do not perform consistently you are more 
								likely to redeem the investments. You see risk as loss of capital. But there are others risks too - like risk of 
								capital erosion due to inflation. Both these risks are real and have an impact on your wealth. You must consider 
								both these risks before making an investment decision.</p>
               	 </c:when>
               	 <c:when test="${output.profile=='Balanced'}">
               	 <p>
               	 			You are more likely to take moderate risk with your investments. You probably understand different kinds 
						of risks - risks that can result in loss to capital in the short term and risks that can result in loss to 
						purchasing power in the long term. Taking a balanced approach to investment, with a clear knowledge of what
						you are getting into and understanding all elements of the products you buy is important to ensure you stick
						to your plan and is important for achieving your goals.
               	 </p>
               	 </c:when>
               	 <c:otherwise>
               	 <p>
               	 		You probably have a high appetite for risk and are willing to try new things and give second chances.
						Steady investments where there is not much action may make you restless. Taking calculated risks, sticking
						to a well thought out plan after covering basic ground might be a good idea and better for your financial health
						in the long run. 
               	 </p>
               	 </c:otherwise>
               	 </c:choose>
                
               
               </div>
               <div class="bigbox_disclaimer">
               	<p class="headingnew" style="text-align:left;">Disclaimer</p>
                <p id="pfordesclamer">This document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FIINFRA. This document
is based entirely on the information provided by you or your Distributor. Despite our best efforts, due care and precautions, there may
be some variables used in generation of this document which have not been unaccounted for, or miscalculated, by the Platform.
FIINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, your Distributor or any third party
if the contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or
incorrectly. The contents of this document do not qualify as investment advice and/or financial planning, or any variant thereof, under
India's applicable regulatory framework, including the Securities and Exchange Board of India (Investment Adviser) Regulations, 2013,
as amended from time to time, and FIINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be
avoided, whether directly, indirectly, incidentally or consequentially, by you or your Distributor or any third party, by relying upon this
document, or any content therein. Investments are subject to a variety of risks, uncertainties and other factors that could cause actual
results to differ materially from expectations as expressed or implied under this document.</p>
               
               </div>
               <div class="pf-op-container group">
             
			   
   <div class="outputfooter2" style="margin: 0px 0 0 0px !important;">
 		 <div class="output_logo" style="margin-top: 16px !important;">
 <img style="width:140px; height:60px;"  src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/app/images${output.buLogo}" />
 </div>
        <div class="output_finfralogo" id="output_finfralogoId">
     
	 			<img style="width:82px;" src="<%=request.getRequestURL().toString().replace(request.getRequestURI().substring(0),request.getContextPath())%>/images/finfra_logo.png" /> 
	 		
        
        </div>
	</div>	
	
                            
			   </div> <!-- END pf-op-container -->       
<!--9th  page End -  Risk --->    
 

	</div> <!--end of mainwrapper -->
	</div> <!--end of center -->
 </div> <!--end of main body -->
 </div>
 
 <%
 try{
 java.util.Map<String,Object> map=new java.util.HashMap<String,Object>();
 String xmlString="<Root>";
  for (java.util.Enumeration e = session.getAttributeNames(); e.hasMoreElements();) {     
    String attribName = (String) e.nextElement();
    Object attribValue = session.getAttribute(attribName);
	map.put(attribName,attribValue);
	if(!attribName.equals("rnd"))
		xmlString+="<Object><Key>"+attribName+"</Key><Value>"+attribValue+"</Value></Object>";
	}
	xmlString+="</Root>";
	request.setAttribute("map", map);
	session.setAttribute("map", map);
	request.setAttribute("string", "hello");
  //ffreedom.util.Logger.logEntry(ffreedom.util.Logger.class,"LeapOutputPdf.jsp:map::"+map, ffreedom.util.Logger.INFO, "LeapOutputPdf.jsp");
//  session.invalidate();
 
%>
<input type="hidden" id="xmlString" value="<%=xmlString%>">
<% 
 }catch(Exception e){
 //ffreedom.util.Logger.logEntry(ffreedom.util.Logger.class,e, ffreedom.util.Logger.ERROR, "LeapOutputPdf.jsp");
 }
 %>
 
 <jsp:include page="../../common/common_popup.jsp" />

</body>
	
</html>
