<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Forgot Password</title>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<link href="<%=request.getContextPath()%>/css/forgot_password.css" rel="stylesheet">
</head>

<body>
<div class="">
<div class="container-head">
  <div class="col-md-12" style="text-align: left;"> Forgot Password </div >
</div>
<div class="container-body" style="margin-top:0px;margin-top:10px;">
<div class="goaldashoard" style="padding:10px;text-align:center;width:100%;margin-bottom:20px;">
<span>If you still can't log in, you have two options to Reset your Password. </span> <br>
<input name="restPasswordOption" value="" id="selectedOption" type="hidden">
<br>
<div class="col-md-12" style="margin-bottom:20px;">
<div class="col-md-3"> &nbsp;</div>
<div class="col-md-6" id="forgotPasswordOptions" style="text-align: left;">
<div style="text-align:left;margin-left:20%;">
  <input checked="checked" name="restPasswordOption" id="email" value="Email" onClick="displayOptions1()" type="radio">
  Reset Password
  using Email. <br>
  <input name="restPasswordOption" id="seq" value="Security Question" onClick="displayOptions2()" type="radio">
  Reset Password using Security
  Question.<br>
</div>
<div class="forgotpassword" style="margin-top:20px;">
<div class="RetrivePassword" id="Email">
  <form  class="login" name="emailIdForm" id="emailIdForm" method="post">
    <center >
      <h3>Reset Password</h3>
    </center>
    <center style="padding-left: 150px; font-size: 11px !important;">
      <span class="serversideMessage" id="serversideMessage"></span>
    </center>
    <div class="col-md-12">
      <label for="" class="col-md-3 searchpadding padding_top">Username <span class="red">*</span></label>
      <span class="col-md-9 searchpadding padding_top">
      <input name="userName" id="userName" validate="1" emsg="Username" class="form-control" maxlength="100" autocomplete="off" type="text">
      </span> </div>
    <div  class="col-md-12">
      <label for="" class="col-md-3 searchpadding padding_top">Email <span class="red">*</span></label>
      <span  class="col-md-9 searchpadding padding_top">
      <input name="email" id="email1" class="form-control" autocomplete="off" type="text" validate="email" emsg="Email">
      </span> </div>
    <div align="center" class="col-md-12">
      <div class="col-md-3"> &nbsp;</div>
      <div class="col-md-9" style="text-align: left;">
        <input value="Reset Password" onClick="validateEmail()" class="btn dbtn" title="Reset Password" style="cursor: pointer;" type="button">
        <input value="Cancel" class="btn dbtn" onClick="GoToLogin()" title="Cancel" style="cursor: pointer;" type="button">
      </div>
    </div>
  </form>
</div>
<div style="display: none;" class="reset-password" id="resetpassword">
<form  class="login" name="securityQuestionForm" id="securityQuestionForm" method="post">
<center >
  <h3>Reset Password</h3>
  <br>
</center>
<center style="padding-left: 150px; font-size: 11px !important;">
  <span class="serversideMessage" id="serversideMessage2"> </span>
</center>
<div class="col-md-12">
  <label for="" class="col-md-3">Username <span class="red">*</span></label>
  <span class="col-md-9">
  <input name="userName" id="userName1" class="form-control" validate="1" emsg="Username" autocomplete="off" type="text">
  </span> </div>
<div id="question" style="display:none;">
  <div class="col-md-12" style="margin-top:10px;">
    <label  class="col-md-3">Security Question <span class="red">*</span></label>
    <span class="col-md-9">
    <select name="questionId" class="form-control" style="height:30px;margin-lrft:5px;" id="questionId" validate="select" emsg="Security Question">
    </select>
    </span> </div>
  <div id="Answer" class="col-md-12" style="margin-top:10px;">
    <label for="" class="col-md-3">Answer <span class="red">*</span></label>
    <span class="col-md-9">
    <input name="answer" id="answer" class="form-control" maxlength="255" autocomplete="off" type="text" validate="1" emsg="Answer">
    </span> </div>
  <br>
  <div align="center" class="col-md-12">
    <div class="col-md-3"> &nbsp;</div>
    <div class="col-md-9" style="text-align: left; margin-top:10px;">
      <input value="Reset Password" onClick="validateForSecurityQuestion();" class="btn dbtn" style="cursor: pointer;" title="Reset Password" type="button">
      <input value="Cancel" class="btn dbtn" onClick="GoToLogin()" title="Cancel" style="cursor: pointer;" type="button">
    </div>
  </div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-3" > &nbsp;</div>
</div>
</div>
</div>
<script>
   function displayOptions1(){
		$("#Email").show();
		$("#resetpassword, #question, #Answer").hide();
		$("#Email input[type='text']").val('');
		$("#Email input[type='text']").each(function() {
			removeCssStyles($(this).attr('id'))
		})
   }
   function displayOptions2(){
   $("#resetpassword, #question, #Answer").show();
   $("#resetpassword input[type='text']").val('');
   $("#resetpassword select").val(0);
	$("#Email").hide();
	$("#resetpassword input[type='text']").each(function() {
		removeCssStyles($(this).attr('id'))
	})
	$("#resetpassword select").each(function() {
			removeCssStyles($(this).attr('id'))
		})
   }
   
   $(function() {
	   $('#questionId').append('<option value="0">--Select--</option>');
	   $.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/common/getPicklistValues.htm?codeTypeIds=52',
			success : function(result) {
				$(result).each(function(i,obj) {
					var codeTypeId=obj.codeTypeId;
					var codeValue=obj.codeValue;
					var codevalueId=obj.codeValueId;
				$('#questionId')	.append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				});
			}
		});
	   (function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
});
   
   function validateEmail(){
	   var isValidated=validateInputForm('emailIdForm');	
	   if(isValidated==true){
		   $.ajax({
			   url: "${pageContext.request.contextPath}/forgotpassword/submitForEmailId.htm",
				type : "GET",
				dataType : "json",
				data:  $("#emailIdForm").serialize(),
				success: function(data){
					var result=data[0];
					var emsg=data[1];
					if(result=='success'){
						showAlertMessage("Message", "An email with temporary password is sent to your email id. You can use that password for login. We recommend you to change your password immediately after login.", 'confirmation', GoToLogin);	
					}else{
						showAlertMessage("Error", '<br><span style="top:-5px;position:relative">'+emsg, 'error', doNothing)
					}
					
				 }
			});
		   
	   }
}

function validateForSecurityQuestion(){
	var isValidated=validateInputForm('securityQuestionForm');
	if(isValidated==true){
		$.ajax({
			   url: "${pageContext.request.contextPath}/forgotpassword/submitForSecurityQuestion.htm",
				type : "GET",
				dataType : "json",
				data:  $("#securityQuestionForm").serialize(),
				success: function(data){
					var result=data[0];
					var emsg=data[1];
					if(result=='success'){
						showAlertMessage("Message", "An email with temporary password is sent to your email id. You can use that password for login. We recommend you to change your password immediately after login.", 'confirmation', GoToLogin);	
					}else{
						showAlertMessage("Error", '<br><span style="top:-5px;position:relative">'+emsg, 'error', doNothing)
					}
				 }
			});
	
	}
}
function GoToLogin(){
	window.location.href='${pageContext.request.contextPath}/login.htm';
}
   
   </script>
<jsp:include page="common_popup.jsp" />
<script type="text/javascript">
$(function() {

	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
});
</script>
</body>
</html>
