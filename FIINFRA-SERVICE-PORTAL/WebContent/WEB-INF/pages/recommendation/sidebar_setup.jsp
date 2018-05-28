<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>-->

    <script src="<%=request.getContextPath()%>/js/common.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/zebra_dialog.css" type="text/css">
<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script> 
<!--	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
--> <link href="<%=request.getContextPath()%>/css/${sessionScope.userSession.themeName}.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
</head>
<jsp:include page="../common/common_popup.jsp" />
<div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px;padding-left:10px;">
            <div class="list-group">
        		<a class="list-group-item active" >Partner Setup</a>
                <a href="<%=request.getContextPath()%>/setup.htm" class="list-group-item" id="termsofuse">Terms Of Use</a>
<!--                 <a onclick="redirectToPanel(id)" class="list-group-item" id="zimmedariMeter">Zimmedari Meter</a> -->
<!--                 <a onclick="redirectToPanel(id)" class="list-group-item" id="businessvaluation">Business Valuation</a> -->
              	<a  onclick="redirectToPanel(id)" class="list-group-item" id="masterasuumption">Master Assumptions</a>  	
                <a class="list-group-item"  onclick="redirectToPanel(id)" id="productrecommendations">Product Recommendation</a>
                <a class="list-group-item"  onclick="redirectToPanel(id)" id="notifications">Notifications</a>
                
                 <c:choose>
        		<c:when test="${sessionScope.userSession.successfulLoginCount eq 0}">
<%--         			<a class="list-group-item" href="<%=request.getContextPath()%>/partner/agree.htm" id="notifications">Agree</a> --%>
<%--                 	<a class="list-group-item" href="<%=request.getContextPath()%>/partner/disagree.htm" id="notifications">Don't Agree</a> --%>
        		</c:when>
        		<c:otherwise>
        			 <a class="list-group-item" href="<%=request.getContextPath()%>/index.htm" id="homelink">Home</a>
        		</c:otherwise>
        		</c:choose>
               
                
              
            </div>
           
 </div>
 <script type="text/javascript">
$(function() {
	var isAgreed=localStorage.getItem('isAgreed');
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
	if(isAgreed=='true'){
		$('#isAgreeed').attr('checked','checked');
	}
});
function redirectToPanel(id){
	if(id=='terms'){
		if($('#isAgreeed').is(':checked')==true){
			localStorage.setItem('isAgreed','true');
		}else{
			localStorage.setItem('isAgreed','false');
		}
		id='masterasuumption';	
	}
	
	var isAgreed=localStorage.getItem('isAgreed');
// 	alert('${sessionScope.userSession.successfulLoginCount}')
// 	alert(isAgreed)
	if(isAgreed=='true' || '${sessionScope.userSession.successfulLoginCount}'!=0){
		if(id=="zimmedariMeter"){
			window.location.href='${pageContext.request.contextPath}/businessHealthIndex/zimmedariMeter';
		}else if(id=="businessvaluation"){
			window.location.href='${pageContext.request.contextPath}/businessPlan.htm';
		}else if(id=='masterasuumption'){
			window.location.href='${pageContext.request.contextPath}/masterassumption.htm';
		}else if(id=='productrecommendations'){
			window.location.href='${pageContext.request.contextPath}/productrecommendations.htm';
		}else if(id=='notifications'){
			window.location.href='${pageContext.request.contextPath}/notifications.htm';
		}else if(id=='termsofuse'){
			window.location.href='${pageContext.request.contextPath}/setup.htm'; 
		}
	}else{
		showAlertMessage("Message", "<br/>Please accept Terms Of Use.", "information", doNothing);
	}
}
function redirectToPanel1(){ 
	var id=localStorage.getItem('redirectId');
	if(id=='terms'){
		if($('#isAgreeed').is(':checked')==true){
			localStorage.setItem('isAgreed','true');
		}else{
			localStorage.setItem('isAgreed','false');
		}
		id='masterasuumption';	
	}
	
	var isAgreed=localStorage.getItem('isAgreed');
	
	if(isAgreed=='true' || '${sessionScope.userSession.successfulLoginCount}'!=0){
		if(id=="zimmedariMeter"){
			window.location.href='${pageContext.request.contextPath}/businessHealthIndex/zimmedariMeter';
		}else if(id=="businessvaluation"){
			window.location.href='${pageContext.request.contextPath}/businessPlan.htm';
		}else if(id=='masterasuumption'){
			window.location.href='${pageContext.request.contextPath}/masterassumption.htm';
		}else if(id=='productrecommendations'){
			window.location.href='${pageContext.request.contextPath}/productrecommendations.htm';
		}else if(id=='notifications'){
			window.location.href='${pageContext.request.contextPath}/notifications.htm';
		}else if(id=='termsofuse'){
			window.location.href='${pageContext.request.contextPath}/setup.htm';
		}
	}else{
		showAlertMessage("Message", "<br/>Please accept Terms Of Use.", "information", doNothing);
	}
}

function updateIsAgreed(){
// 	alert($('#isAgreeed').is(':checked'))
	if($('#isAgreeed').is(':checked')==true){
		localStorage.setItem('isAgreed','true');
	}else{
		localStorage.setItem('isAgreed','false');
	}
}
</script>
 
<style>
a{
cursor: pointer;
}
</style>
</html>