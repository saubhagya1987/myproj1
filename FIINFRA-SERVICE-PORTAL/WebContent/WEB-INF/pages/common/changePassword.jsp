<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
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
<script
	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>
--><script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>

 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/checkbox-radio-switch.css" />

<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>-->
<script src='<%=request.getContextPath()%>/js/common.js'></script>
<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>-->
	
	


<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/zebra_dialog.css"
	type="text/css">
<script type="text/javascript">
// var $ = $.noConflict();
</script>
<script type="text/javascript">
var $jq_1_9_1 = $.noConflict();
</script>
</head>
<body>
<%-- <jsp:include page="../common/header.jsp" /> --%>
<jsp:include page="../common/common_popup.jsp" />
<div style="display: none;opacity:0.10" id="blanket"></div>
<div style="display: none; width:644px; height:300px; overflow:auto;" id="popUpChangePassword" class="popUpQuery" >
<div class="close" style="margin-right:10px; margin-bottom:30px;"><a onClick="closeChangePasswordPopup()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
<!-- -->
<div class="row"><br><br>
 <div class="list-group" id="changePasswordDetailsDiv" >
 <a class="list-group-item active">Change Password</a>
 <form id="changePasswordForm">
			 <table class="table table-striped" cellpadding="5" cellspacing="5" id="change_password_div" style="width: 98%;margin-left: 10px;margin-top: 10px;">
                	<tr>
                    	<td width="22%" style="border-top: none !important;">Current Password <span class="red">*</span></td>
               	      <td width="78%" style="border-top: none !important;"><input  type="password" id="oldPassword" name="oldPassword" maxlength="15" style="width: 100%" validate="1" emsg="Current Password"/></td>
                </tr>
                <tr>
                    	<td width="22%" style="border-top: none !important;">New Password <span class="red">*</span></td>
               	  		<td width="78%" style="border-top: none !important;"><input  type="password" id="newPassword" name="newPassword" maxlength="15" style="width: 100%" validate="1" emsg="New Password"/></td>
                </tr>
                <tr>
                    <td width="25%" style="border-top: none !important;">Confirm Password <span class="red">*</span></td>
               	  	<td width="78%" style="border-top: none !important;"><input  type="password" id="confirmPassword" name="confirmPassword" maxlength="15" style="width: 100%" validate="1" emsg="Confirm Password"/></td>
                </tr>
                 <tr>
                      <td colspan="2" align="right" style="border-top: none !important;"> <input id="cancel" class="btn dbtn" type="button" value="Save" name="change_password_div" onclick="changePassword()">  <input id="save" class="btn dbtn" type="button" value="Cancel" name="change_password_div" onclick="closeChangePasswordPopup()"></td>
                    </tr>
              </table>
   </form>
	</div>
       </div>
</div>
<script>
$(function() {
	openChangePasswordPopup();
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
	$('body').keydown(function (e){
	    if(e.keyCode == 13){
	       changePassword();
	    }
	});
})
function openChangePasswordPopup(){
	$('#oldPassword').val('');
	$('#newPassword').val('');
	$('#confirmPassword').val('');
	$('#popUpChangePassword').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpChangePassword').css('height'))/2);
	$('#popUpChangePassword').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpChangePassword').css('width'))/2);
	$('#popUpChangePassword').css('margin-left', width);
	$('#popUpChangePassword').css('position','fixed');
}
function closeChangePasswordPopup(){
// 	$('#popUpChangePassword').hide();
// 	$('#blanket').hide();
	window.location.href="<%=request.getContextPath()%>/common/logout.htm";
}
function changePassword(){
	var isValidated=validateInputForm('changePasswordForm');
	var isPopupOpen=false;
	if(isValidated==false){
		isPopupOpen=true;
	}
	if(isValidated==true){
	var oldPassword=$('#oldPassword').val();
	var newPassword=$('#newPassword').val();
	var confirmPassword=$('#confirmPassword').val();
	if ((newPassword.length<8 || newPassword.length>15) && newPassword.length > 0) {
		$('#newPassword').css('border-color','red');
		$('#newPassword').attr('title', 'New Password must be 8-15 characters long.');
		isValidate = false;
	}else if (newPassword.contains(' ')) {
		$('#newPassword').css('border-color','red');
		$('#newPassword').attr('title', 'Space are not allow in password field.');
		isValidate = false;
	} else if (!newPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*[!@#$%^&*])/i)) {
		$('#newPassword').css('border-color','red');
		$('#newPassword').attr('title', 'At least one letter, one digit and one special character required in password.');
		isValidate = false;
	}else{
		$('#newPassword').css('border-color','grey');
		$('#newPassword').removeAttr('title');
	}
	if(newPassword!=confirmPassword){
		$('#confirmPassword').css('border-color','red');
		$('#confirmPassword').attr('title', 'Confirm Password must be same as New Password.');
		isValidated = false;
	}else{
		$('#confirmPassword').css('border-color','grey');
		$('#confirmPassword').removeAttr('title');
	}
	
	if(isValidated==true){
		$.ajax({
			type : "POST",
			url : '<%=request.getContextPath()%>/common/changePassword.htm',
			data:$('#changePasswordForm').serialize(),
			success : function(result) {
				if(result>0){
					showAlertMessage("Success", "<br/>Password changed successfully.", "confirmation", redirectToHome);
					$('.ZebraDialog').css('z-index','9999999999');
					
				}else{
					showAlertMessage("Error","<br/>Current password does not match.", 'error', doNothing);
					$('.ZebraDialog').css('z-index','9999999999');
				}
				
			}
		});
	}else if(isPopupOpen==false){
		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
		$('.ZebraDialog').css('z-index','9999999999');
	}
	}
}
function redirectToHome(){
	window.location.href="<%=request.getContextPath()%>/welcome/loadHome.htm"
}

</script>
</body>
</html>