<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="in.fiinfra.common.partner.LocationData"%>
<%@page import="in.fiinfra.common.partner.PartnerHeirarchyData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
//request.setAttribute("_cdn", cdn);
request.setAttribute("_cdn", request.getContextPath().subSequence(0, request.getContextPath().lastIndexOf("/"))+"/FIINFRA-Welcome/resources");
%>
<title>Change Password</title>
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
<link rel="stylesheet" href="${_cdn}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/fontcustom.css" />
<link rel="stylesheet" href="${_cdn}/assets/css/ui.jqgrid.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/jstree/themes/default/style.min.css">
<style>
.jstree .icn { width: 20px; height: 20px; display: inline-block; background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat 0 0 transparent }
.jstree .icn.plus { background-position: -15px -20px }
.jstree .icn.area1 { background-position: -2px -3px }
.jstree .icn.user1 { background-position: -25px -3px }
.jstree .icn.star { background-position: -50px -3px }
.jstree-default .jstree-open > .jstree-ocl { background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat -3px -25px transparent }
.jstree-default .jstree-closed > .jstree-ocl { background: url(${pageContext.request.contextPath}/images/jstree.png) no-repeat -28px -25px transparent }
.jstree-default .jstree-clicked { background: none; border-radius: 0; box-shadow: none; color: #AE2760 }
ul.jstree-container-ul { /* background: #8F8F8F; overflow: hidden*/ }
li.jstree-open > ul { /*  background: #DADADA;*/ display: block; }
li.jstree-open > ul li.jstree-open > ul { /*background: #F2F2F2;*/ position: relative; left: -24px; padding-left: 24px; width: 100%; }
</style>

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
<script src='<%=request.getContextPath()%>/js/common.js'></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src=" ${_cdn}/assets/js/html5shiv.js"></script>
		<script src=" ${_cdn}/assets/js/respond.js"></script>
		<![endif]-->

</head>
<body>
<%-- <jsp:include page="../common/header.jsp" /> --%>
<jsp:include page="../common/common_popup.jsp" />
<!--<div style="display: none;opacity:0.10" id="blanket"></div>-->

 <!--<div style="display: none; width:644px; height:300px; overflow:auto;" id="popUpChangePassword" class="popUpQuery" >
<div class="close" style="margin-right:10px; margin-bottom:30px;"><a onClick="closeChangePasswordPopup()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

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
                      <td colspan="2" align="right" style="border-top: none !important;"> <input id="changePasswordButton" class="btn dbtn" type="button" value="Save" name="change_password_div" onclick="changePassword()">  <input id="save" class="btn dbtn" type="button" value="Cancel" name="change_password_div" onclick="closeChangePasswordPopup()"></td>
                    </tr>
              </table>
   </form>
	</div>
    
    
       </div>
       
      
       
</div>-->
<div id="commonpopup-header" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="commonpopup-header-title"></h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" id="commonpopup-header-body"> </div>
      <div class="modal-footer hide" id="commonpopup-header-footer"> <a  class="btn btn-xs btn-primary ZebraDialog_Button1" id="commonpopup-header-button-ok">Yes</a> <a  class="btn btn-xs btn-primary ZebraDialog_Button0" id="commonpopup-header-button-ok2">No</a> </div>
    </div>
  </div>
</div>
 <div class="modal fade" id="popUpChangePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeChangePasswordPopup()"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Change Password</h4>
      </div>
      <div class="modal-body">
     
 
 <div id="changePasswordDetailsDiv"><form id="changePasswordForm">
			 
              
              <div class="row">
              <div class="form-group col-md-12 clearfix">
              <label class="col-sm-3 control-label no-padding-right" for="oldPassword">Current Password<span class="red">*</span></label>
              
              <div class="col-sm-9"><input  type="password" id="oldPassword" name="oldPassword" maxlength="15"  emsg="Current Password"/>
               <div id="oldPassword_error" class="help-block hide">Please provide a valid current password.</div>
              </div>
             
              </div>
              
              </div>
              
              
              <div class="row">
              <div class="form-group col-md-12 clearfix">
              <label class="col-sm-3 control-label no-padding-right" for="newPassword">New Password<span class="red">*</span></label>
              
              <div class="col-sm-9">
              
              <input  type="password" id="newPassword" name="newPassword" maxlength="15"   emsg="New Password"/>
              <div id="newPassword_error" class="help-block hide">Please provide a valid new password.</div>
              </div>
              
              </div>
              
              </div>
              
              <div class="row">
              <div class="form-group col-md-12 clearfix">
              <label class="col-sm-3 control-label no-padding-right" for="confirmPassword">Confirm Password<span class="red">*</span></label>
              
              <div class="col-sm-9">
              
              <input  type="password" id="confirmPassword" name="confirmPassword" maxlength="15"  emsg="Confirm Password"/>
              
               <div id="confirmPassword_error" class="help-block hide">Please provide a valid confirm password.</div>
              
              </div>
              
              </div>
              
              </div>
              
              
              
              
   </form></div>
	
      
      </div>
      <div class="modal-footer rightAlign">
        <input id="changePasswordButton" class="btn btn-primary btn-xs" type="button" value="Save" name="change_password_div" onclick="changePassword()">  <input id="save" class="btn btn-primary btn-xs" type="button" value="Cancel" name="change_password_div" onclick="closeChangePasswordPopup()">
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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
	/*$('#popUpChangePassword').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpChangePassword').css('height'))/2);
	$('#popUpChangePassword').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpChangePassword').css('width'))/2);
	$('#popUpChangePassword').css('margin-left', width);
	$('#popUpChangePassword').css('position','fixed');*/
	$('#popUpChangePassword').modal({backdrop: 'static',
		    keyboard: false,show:true});
	/* $('#popUpChangePassword').on('hidden.bs.modal', function (e) {
		closeChangePasswordPopup();
		}); */
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
	 if (oldPassword.length == 0 || !(oldPassword.length > 0)) {
			$('#oldPassword_error').html('Please provide a valid current password.');
			addCssStyles('oldPassword','Please provide a valid current password.');
			$('#oldPassword').css('border','1px solid red');
			$('#oldPassword').attr('title','Please provide a valid current password.');
			isValidated=false;
			$('#oldPassword_error').removeClass('hide');;
			$('#oldPassword_error').parent().parent().parent().addClass('has-error');
		}
	
	if ((newPassword.length<8 || newPassword.length>15) && newPassword.length > 0) {
		/* $('#newPassword').css('border-color','red');
		$('#newPassword').attr('title', 'New Password must be 8-15 characters long.');
		isValidated = false; */
		$('#newPassword_error').html('New Password must be 8-15 characters long.');
		addCssStyles('newPassword','New Password must be 8-15 characters long.');
		$('#newPassword').css('border','1px solid red');
		$('#newPassword').attr('title','New Password must be 8-15 characters long.');
		isValidated=false;
		$('#newPassword_error').removeClass('hide');;
		$('#newPassword_error').parent().parent().parent().addClass('has-error');
	}else if (newPassword.contains(' ')) {
		/* $('#newPassword').css('border-color','red');
		$('#newPassword').attr('title', 'Space are not allow in password field.');
		isValidated = false; */
		$('#newPassword_error').html('Space are not allow in password field.');
		addCssStyles('newPassword','Space are not allow in password field.');
		$('#newPassword').css('border','1px solid red');
		$('#newPassword').attr('title','Space are not allow in password field.');
		isValidated=false;
		$('#newPassword_error').removeClass('hide');;
		$('#newPassword_error').parent().parent().parent().addClass('has-error');
	} else if (!newPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*[!@.#$%^&*])/i)) {
		/* $('#newPassword').css('border-color','red');
		$('#newPassword').attr('title', 'At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
		isValidated = false; */
		$('#newPassword_error').html('At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
		addCssStyles('newPassword','At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
		$('#newPassword').css('border','1px solid red');
		$('#newPassword').attr('title','At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
		isValidated=false;
		$('#newPassword_error').removeClass('hide');;
		$('#newPassword_error').parent().parent().parent().addClass('has-error');
	}else{
		$('#newPassword').css('border-color','grey');
		$('#newPassword').removeAttr('title');
	}
	if(newPassword!=confirmPassword){
		/* $('#confirmPassword').css('border-color','red');
		$('#confirmPassword').attr('title', 'Confirm Password must be same as New Password.');
		isValidated = false; */
		$('#confirmPassword_error').html('Confirm Password must be same as New Password.');
		addCssStyles('confirmPassword','Confirm Password must be same as New Password.');
		$('#confirmPassword').css('border','1px solid red');
		$('#confirmPassword').attr('title','Confirm Password must be same as New Password.');
		isValidated=false;
		$('#confirmPassword_error').removeClass('hide');;
		$('#confirmPassword_error').parent().parent().parent().addClass('has-error');
	}else{
		$('#confirmPassword').css('border-color','grey');
		$('#confirmPassword').removeAttr('title');
	}
	 if (confirmPassword.length == 0) {
			$('#confirmPassword_error').html('Please provide a valid confirm password.');
			addCssStyles('confirmPassword','Please provide a valid confirm password.');
			$('#confirmPassword').css('border','1px solid red');
			$('#confirmPassword').attr('title','Please provide a valid confirm password.');
			isValidated=false;
			$('#confirmPassword_error').removeClass('hide');;
			$('#confirmPassword_error').parent().parent().parent().addClass('has-error');
		}
	 
	if(isValidated==true){
		$('#changePasswordButton').attr('disabled','disabled');
		$.ajax({
			type : "POST",
			url : '<%=request.getContextPath()%>/common/chnagePassword.htm',
			data:$('#changePasswordForm').serialize(),
			success : function(result) {
				if(result>0){
					$('#popUpChangePassword').modal('hide');
					showAlertMessage("Success", "<br/>Password changed successfully.", "confirmation", redirectToHome);
					$('.ZebraDialog').css('z-index','9999999999');
					
				}else{
					/* $('#popUpChangePassword').modal('hide');
					showAlertMessage("Error","<br/>Current password does not match.", 'error', doNothing);
					$('.ZebraDialog').css('z-index','9999999999'); */
					$('#oldPassword_error').html('Current password does not match.');
					addCssStyles('oldPassword','Current password does not match.');
					$('#oldPassword').css('border','1px solid red');
					$('#oldPassword').attr('title','Current password does not match.');
					isValidated=false;
					$('#oldPassword_error').removeClass('hide');;
					$('#oldPassword_error').parent().parent().parent().addClass('has-error');
				}
				$('#changePasswordButton').removeAttr('disabled');
			}
		});
	}else if(isPopupOpen==false){
		//showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
		$('.ZebraDialog').css('z-index','9999999999');
	}
	}
}
function redirectToHome(){
	window.location.href="<%=request.getContextPath()%>/common/buildSession.htm"
}

</script>


<!-- basic scripts --> 
<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${_cdn}/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script> 
	
<!-- page specific plugin scripts --> 

<!--[if lte IE 8]>
		  <script src="../assets/js/excanvas.js"></script>
		<![endif]--> 
<script src="${_cdn}/assets/js/bootstrap.min.js"></script> 
<script src="${_cdn}/assets/js/jquery-ui.min.js"></script> 
<script src="${_cdn}/assets/js/jquery.ui.touch-punch.js"></script> 
<script src="${_cdn}/assets/js/markdown/markdown.js"></script>
<script src="${_cdn}/assets/js/markdown/bootstrap-markdown.js"></script>
<script src="${_cdn}/assets/js/jquery.hotkeys.js"></script>
<script src="${_cdn}/assets/js/bootstrap-wysiwyg.js"></script>
<script src="${_cdn}/assets/js/bootbox.js"></script> 
<script src="${_cdn}/assets/js/jqGrid/jquery.jqGrid.src.js"></script> 
<script src="${_cdn}/assets/js/jqGrid/i18n/grid.locale-en.js"></script> 
<script src="${_cdn}/assets/js/jquery.easypiechart.js"></script> 
<script src="${_cdn}/assets/js/jquery.sparkline.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.pie.min.js"></script> 
<script src="${_cdn}/assets/js/flot/jquery.flot.resize.min.js"></script> 
<script src="${_cdn}/assets/js/date-time/moment.min.js"></script>
<script src="${_cdn}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.colorpicker.js"></script>
<script src="${_cdn}/assets/js/jquery.inputlimiter.1.3.1.js"></script>
<script src="${_cdn}/assets/js/jquery.maskedinput.js"></script>
<script src="${_cdn}/assets/js/ace/elements.wysiwyg.js"></script>
<script src="${_cdn}/assets/js/ace/elements.wizard.js"></script>
<script src="${_cdn}/assets/js/jsapi.js"></script>

<!-- ace scripts --> 
<script src="${_cdn}/assets/js/ace/elements.scroller.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.colorpicker.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.fileinput.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.typeahead.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.wysiwyg.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.spinner.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.treeview.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.wizard.js"></script> 
<script src="${_cdn}/assets/js/ace/elements.aside.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.ajax-content.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.touch-drag.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.sidebar.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.sidebar-scroll-1.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.submenu-hover.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.widget-box.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.settings.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.settings-rtl.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.settings-skin.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.widget-on-reload.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.searchbox-autocomplete.js"></script> 
<script src="${_cdn}/assets/js/ace/ace.searchbox-autocomplete.js"></script>

</body>
</html>