<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>RM Dashboard</title>
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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-multiselect.css" />
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/nicEdit.js"></script>

<style>
img {
	vertical-align: bottom  !important;
}

#ui-id-1 {
	width: 168px !important;
	padding-left: 20px !important;
}

#ui-id-2 {
	width: 168px !important;
	padding-left: 24px !important;
}

.ui-menu-item {
	list-style: none !important;
}

.ui-corner-all {
	margin-left: -10px !important;
}

.ui-helper-hidden-accessible {
	color: #000;
}

.ui-datepicker {

padding-left: 15px !important;
}

</style>
<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/fullcalendar.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/style_serviceportal_partner.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />
<!-- -responsive css-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/slider.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/nanoscroller.css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/pop.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>
<script src='<%=request.getContextPath()%>/js/jquery-ui.custom.min.js'></script>
<script src='<%=request.getContextPath()%>/js/moment.min.js'></script>
<script src="<%=request.getContextPath()%>/js/fullcalendar.js"></script>
<script src="<%=request.getContextPath()%>/js/fullcalendar.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.custom.min.js"></script>


<script src="<%=request.getContextPath()%>/js/angular.js"></script>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css">

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script>
$(document).ready(function(){
	
	 $.ajax({ 				
		   	type: "POST",
		   	url:$('#contextPath').val()+'/ping/getPicklistValues.htm?codeTypeIds=188,189,207',
		   	dataType: 'json',
			contentType: 'application/json',
			success:function(result){ 
				$('#activityContextId,#activityTypeId').empty();
				$('#activityTypeId').append('<option value="">--Select--</option>');
				 $.each( result, function( index, value ) {
					var codeTypeId=value.codeTypeId;
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;
				
					if(codeTypeId == 189 && codeValueId==189030 || codeValueId==189031 || codeValueId==189032 || codeValueId==189010 || codeValueId==189002){
						$("#activityContextId1").append('<input type="checkbox" id="activityContextId" name="activityContextId" onclick="showselection();" value="'+codeValueId+'">'+codeValue+'<br>');		
						
						
					}else if(codeTypeId == 188){
						if(codeValueId == 188007){
							$("#activityTypeId").append('<option value="'+codeValueId+'" selected="selected" >'+codeValue+'</option>');		
						}else{
						
							$("#activityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');		
						}
						
					}
				 else if(codeTypeId == 207){
						$("#activityStatusId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');		
					}
				 });
				}  	
		   	});
	 
	 $.ajax({ 				
		   	type: "POST",
		   	url:$('#contextPath').val()+'/ping/getPicklistValues.htm?codeTypeIds=189,188,207',
		   	dataType: 'json',
			contentType: 'application/json',
			success:function(result){ 
				$('#editactivityContextId,#editactivityTypeId').empty();
				
				 $.each( result, function( index, value ) {
					var codeTypeId=value.codeTypeId;
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;
					if(codeTypeId == 189 && codeValueId==189030 || codeValueId==189031 || codeValueId==189032 || codeValueId==189010 || codeValueId==189002){
						$("#editactivityContextId").append('<option value="'+codeValueId+'">'+codeValue+'</option>');	
					}else if(codeTypeId == 188){
						$("#editactivityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');
					}else if(codeTypeId == 207){
						$("#editactivityStatusId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');	
					}
					
				 });
				}  	
		   	});

 });
 </script>	
<script type="text/javascript">
var app = angular.module("MyApp", []);

app.filter('offset', function() {
  return function(input, start) {
    start = parseInt(start, 10);
    return input.slice(start);
  };
});

app.controller("PaginationCtrl", function($scope,$http) {

  $scope.itemsPerPage = 5;
  $scope.currentPage = 0;
//  $scope.items = [];

 var partyID =jQuery('#partyID').val();
	
  $scope.items=$http.get($('#contextPath').val()+"/dashboard/showPartnerActivityTracker.htm?partyID="+partyID)
	  .success(function(response) { 
		 
		  $scope.items = response;
	
  $scope.range = function() {
    var rangeSize = 2;
    var ret = [];
    var start;

    start = $scope.currentPage;
    if ( start > $scope.pageCount()-rangeSize ) {
      start = $scope.pageCount()-rangeSize+1;
    }

    for (var i=start; i<start+rangeSize; i++) {
      ret.push(i);
    }
    return ret;
  };

  $scope.prevPage = function() {
    if ($scope.currentPage > 0) {
      $scope.currentPage--;
    }
  };

  $scope.prevPageDisabled = function() {
    return $scope.currentPage === 0 ? "disabled" : "";
  };

  $scope.pageCount = function() {
    return Math.ceil($scope.items.length/$scope.itemsPerPage)-1;
  };

  $scope.nextPage = function() {
    if ($scope.currentPage < $scope.pageCount()) {
      $scope.currentPage++;
    }
  };

  $scope.nextPageDisabled = function() {
    return $scope.currentPage === $scope.pageCount() ? "disabled" : "";
  };

  $scope.setPage = function(n) {
    $scope.currentPage = n;
  };
	  });
});
 </script>
<script type="text/javascript">
(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":9999999,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(99999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);});
</script>

</head>
<body ng-app="MyApp">

		 <input type="hidden" id="otherReasonID" name="otherReason" />
					 <input type="hidden" id="lastCallDateID" name="lastCallDate" />
<input	type="hidden" id="rollId" name="rollId"	value="${sessionScope.userSession.roleId}"> 
	<jsp:include page="../common/header.jsp" />
	<!--css popup window start 1-->
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />

	<!--css popup window start 1-->
	<div style="display: none;" id="blanket"></div>


	<!-- Center part start -->
	<section>

		<div class="container">
			<div class="col-md-12 box_dashboard"
				style="margin-bottom: 0px; display: inline-block;">
				<div class="header-title col-md-12">
					<c:set var="roleId" value="${sessionScope.userSession.roleId}" />

					<input type="hidden" id="partyID" name="partyID" value="${partyID}" />
					<span class="col-md-10" style="float: left;">RM
						Dashboard for ${lastname}</span> <span class="col-md-2"
						style="float: right; margin-top: 0px;"> <!-- <input name="text"  type="text" id="tags"  placeholder="Quick Search"> -->
						&nbsp;
					</span>
				</div>

				</div>

		

			<div class="col-md-12" style="margin: 0px;">
				<div class="col-md-5" style="margin: 0px;">
					       		<div class="panel panel-success widget-support-tickets" id="dashboard-support-tickets" style="margin-top:20px;">
					<div class="box-header">
						<h3>Call Tracker
                        <span id="SPAddActivityTrackerLink" class="label label-success" style="font-size:11px; text-align:right;margin-left: 58%;">
                            <a href="#" style="color:#fff;" onClick="addNote();" ><span  >Add</span></a></span></h3>
						
					</div> <!-- / .panel-heading -->
					<div class="panel-body tab-content-padding">

<!-- add activity tracker  -->
	
		<div id="success-msg"></div>
		<div id="addnote" style=" display:none;"> 
		<form  id="addactivity">
			<input type="hidden" id="activityOriginatedByPartyID" name="activityOriginatedByPartyID" value="${partyID}"/>
			<input type="hidden" id="activityId" name="activityId" value="0"/>
			
			<span  class="searchpadding padding_top" style="float:left; width:150px;">Call Type <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:250px;">
				<select  id="activityTypeId" name="activityTypeId" class="form-control" style="width:250px; float:left;">
				</select>
			</span>
		<div class="clearfix"></div>
		
		<span  class="searchpadding padding_top" style="float:left; width:150px;">Call Status<span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:250px;">
				<select  id="activityStatusId" name="activityStatusId" class="form-control" style="width:250px; float:left;">
				</select>
			</span>
		<div class="clearfix"></div>
		
			        <span class="searchpadding padding_top" style="float:left; width:150px;">Call Context <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			<div class="test"  id="activityContextId1"></div>
			        </span>
		 <div class="clearfix"></div>
		 <span class="searchpadding padding_top" style="float:left; width:150px;">Call SubContext <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			<select  id="activitySubContextId" name="activitySubContextId" multiple="multiple"  class="form-control" style="width:250px; float:left;">
			
		</select></span>
		<div class="clearfix"></div>		        
			        
		<div class="clearfix"></div>
			        <span class="searchpadding padding_top" style="float:left; width:150px;">Call Duration <span class="red">*</span>   </span>
					<span  class="searchpadding padding_top" style="float:left; width:100px;">
			 <input type="number" min="1" max="60" step="1" value="1" id="activitySpend" name="activitySpend">Mins </span>
			<div class="clearfix"></div>
			        <span class="searchpadding padding_top" style="float:left; width:150px;">Call Note<span class="red">*</span>
					 </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			<textarea class="form-control" name="activityNote" id="activityNote" rows="5"></textarea>
			</span>
			
			<div class="clearfix"></div>
			 <div class="check">       <span class="searchpadding padding_top" id="test" style="float:left; width:150px;">Send Email </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			 
				<input type="radio" name="sendEmail" class="radiocheck"  id="send" value="1">Partner<br>
				<c:if test="${roleId == 203}">
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="4">PST</br>
				</c:if>
				<c:if test="${roleId == 5}">
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="2">RM</br>
				</c:if>
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="3">Both
			
			</span>
			</div>	
			<div class="clearfix"></div>
			  <div class="topbuttonholder" style="margin-top:10px;">
			        	<!-- <input class="dbtn" name="savenew" value="Save & New" id="savenew"  type="button">	 -->
			            <input class="dbtn" name="saveclose" value="Save & Close" id="saveclose"  type="button">	
			            <input class="dbtn"  onClick="List();" value="Cancel" id="Cancel" type="button">	<br/>
			   </div>
			</form>
		</div>
		
		<!-- Edit activity tarcker -->
		<div id="editnote" style=" display:none;"> 
		<form  id="editactivity">
			<input type="hidden" id="activityOriginatedByPartyID" name="activityOriginatedByPartyID" value="${partyID}"/>
			<input type="hidden" id="editactivityId" name="activityId" value=""/>
			
			<span  class="searchpadding padding_top" style="float:left; width:150px;">Call Type     <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:250px;">
				<select  id="editactivityTypeId" name="activityTypeId" class="form-control" style="width:250px; float:left;">
				</select>
			</span>
		<div class="clearfix"></div>
		
		<span  class="searchpadding padding_top" style="float:left; width:150px;">Call Status<span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:250px;">
				<select  id="editactivityStatusId" name="editactivityStatusId" class="form-control" style="width:250px; float:left;">
				</select>
			</span>
		<div class="clearfix"></div>
		 <span class="searchpadding padding_top" style="float:left; width:150px;">Call Context </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			<div id="editactivityContextId"></div>
			
		</span>
			
			      
		 <span class="searchpadding padding_top" style="float:left; width:150px;">Call SubContext </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			<select  id="editactivitySubContextId" name="activitySubContextId" multiple=""  class="form-control" style="width:250px; float:left;">
			
		</select></span>
		<div class="clearfix"></div>	
			        <span class="searchpadding padding_top" style="float:left; width:150px;">Call Duration <span class="red">*</span>   </span>
					<span  class="searchpadding padding_top" style="float:left; width:100px;">
			 <input type="number" min="1" max="60" step="1" value="1" id="editactivitySpend" name="activitySpend">Mins </span>
			<div class="clearfix"></div>
			        <span class="searchpadding padding_top" style="float:left; width:150px;">Call Note<span class="red">*</span>
					 </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			<textarea class="form-control" name="activityNote" id="editactivityNote" rows="5" ></textarea>
			</span>
			
			<div class="clearfix"></div>
			<div class="check">        <span class="searchpadding padding_top" style="float:left; width:150px;">Send Email </span>
			<span  class="searchpadding padding_top" style="float:left; width:250px;">
			
				<input type="radio" name="sendEmail"  class="radiocheck" id="send11" value="1">Partner<br>
				<c:if test="${roleId == 203}">
				<input type="radio" name="sendEmail"  class="radiocheck" id="send" value="4">PST</br>
				</c:if>
					<c:if test="${roleId == 5}">
				<input type="radio" name="sendEmail"  class="radiocheck" id="send" value="2">RM</br>
				</c:if>
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="3">Both
			</span>
			</div>
			<div class="clearfix"></div>
			  <div class="topbuttonholder" style="margin-top:10px;">
			        	<!-- <input class="dbtn" name="savenew" value="Save & New" id="editsavenew"  type="button">	 -->
			            <input class="dbtn" name="saveclose" value="Save & Close" id="editsaveclose"  type="button">	
			            <input class="dbtn"  onClick="List();" value="Cancel" id="Cancel" type="button">	<br/>
			   </div>
			</form>
		</div>
	
		<div id="list" ng-app="" ng-controller="PaginationCtrl">
                  <div class="ticket" ng-repeat="item in items | offset: currentPage*itemsPerPage | limitTo: itemsPerPage"> 
                 	 <input type="hidden" id="callactivityId" name="activityId" value="{{item.activityId}}">
                 	 <span class="label ticket-label"><a href="#" id="SPEditActivityTrackerLink"><img src="<%=request.getContextPath()%>/images/edit.png" onClick="editNote();getActivity({{item.activityId}});"></a></span>
                  <strong> {{ item.activityType }} /  {{ item.activityContext }} </strong><br/>
                   <span style="display:inline-block;width:280px; white-space: nowrap;overflow:hidden !important;text-overflow: ellipsis;">
                    {{ item.activityNote }}
 					</span><br/> <span class="ticket-info"> By <a href="#" >{{item.activityFor}} </a> {{item.activityDate}}, Duration: {{item.activitySpend}} mins  </span> 
				 </div>
      
          <!-- / .ticket -->
              <div class="" style="margin-top:15px;">
                 <nav>
				  <ul class="pager">
				    <li ng-class="prevPageDisabled()">
                 		 <a href ng-click="prevPage()">« Previous</a>
                	</li>
				     <li ng-class="nextPageDisabled()">
                		  <a href ng-click="nextPage()">Next »</a>
               		 </li>
				  </ul>
				</nav>
         	</div>
         </div>
		
        <div id="error-msg3"></div>
			                <!-- / .ticket -->
       
        
         	 </div>
	</div>


				</div>


					
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>

	<script>



function addNote(){

$("#addnote").show();
$("#editnote").hide();
$("#list").hide();	
$("#error-msg3").hide();
}
function editNote(){

	$("#editnote").show();	
	$("#addnote").hide();
	$("#list").hide();	
	$("#error-msg3").hide();
	}
function List(){

$("#list").show();	
$("#addnote").hide();	
$("#editnote").hide();	
location.reload();
}
function reload()
{
	location.reload();
	}

function getActivity(value){
	var activityId=value;
	 $.ajax({
			
			type : "POST", 
			//data:$('#addactivity').serialize(),
			url :$('#contextPath').val()+"/dashboard/getActivityId.htm?activityId="+activityId,
			dataType: 'json',
			contentType : 'application/json',
			success : function(result) {
				$('#editactivityContextId,#editactivityTypeId,editactivityId').empty();
			 $.each( result, function( index, value ) {
		
				var activitySpend=value.activitySpend;
				var activityNote=value.activityNote;
				var codeValue=value.codeValue;
				var activityTypeId=value.activityTypeId;
				var activityContextId =value.activityContextId;
				var activitySubContextId =value.activitySubContextId;
				var activityId=value.activityId;
				var activityStatusId=value.activityStatusId;

// 				if(activityTypeId == 188007){
// 				$("#activityTypeId").prop('<option value="'+activityTypeId+'" selected="selected" ></option>');	
// 				}	
				var activityStatusid =activitySubContextId.split(',')[0];
				
				
				//$("#editactivityTypeId option[value='"+activityTypeId+"']").prop("selected", "selected");
				 var i=0;
				if(activityStatusid == 20701){i=0;}else{i=1;}
				var select = document.getElementById("editactivityStatusId");
				select.options[i].selected = true;
				
// 				 var j=0;
// 					if(activityTypeId == 188001){j=0;}else{j=1;}
// 					var select1 = document.getElementById("editactivityTypeId");
// 					select1.options[j].selected = true;
					
				$("#editactivityId").val(activityId);
				$("#editactivitySpend").val(activitySpend);
				$("#editactivityNote").val(activityNote); 
				 getList(activityTypeId);
				 sourceid1(activityContextId);
				 sourceid2(activitySubContextId);
				}); 
			}
	 });
	
}

function sourceid1(data)
{

var str = data;
var arr = str.split(",");
var i;
var a=new Array();
for(i=0;i<arr.length;i++)
{
   a[i]=arr[i];
}
  	$.ajax({ 				
	   		  type: "POST",
	   		 url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=189',
	   		 dataType: 'json',
			  contentType: 'application/json',
			success:function(result)
			{ 
				//alert(result);
				var m=arr.length;
			 	var ab=0;
   			 $.each(result, function( index, value ){
		
				   var module=value.codeValue;
			       var modulename=value.codeValueId;
						
				ab++;
				if(modulename==189030 || modulename==189031 || modulename==189032 || modulename==189010 || modulename==189002){
			       for(i=0;i<arr.length;i++)
			       {
			    	   if(a[i]==modulename)
			    		   {
			       	 $('#editactivityContextId').append('<input type="checkbox"  checked="true" id="editactivityContextId1" onclick="showselection1('+modulename+');" class="pinToggles1" name="activityContextId" value="'+modulename+'"/>'+module+'<br>');
			       	 
			       	a.splice(i, 1);
			       	i=arr.length;
			       	 
			       	
			       }
			    	   else
			    		   {
			    		   $('#editactivityContextId').append('<input type="checkbox" id="editactivityContextId1" onclick="showselection1('+modulename+');" class="pinToggles1" name="activityContextId" value="'+modulename+'"/>'+module+'<br>');
			    		 	i=arr.length;
			    		   }
			       }
			       
				}
			});
					
						
	   		  }
	   	
	   	});
	  
	   
}
/* $('.pinToggles1').click(function(event) {  //on click 
	   alert("fgf");
	   	 
	    }
	}); */

function sourceid2(data)
{

var str = data;
var arr = str.split(",");
var i;
var a=new Array();
for(i=0;i<arr.length;i++)
{
   a[i]=arr[i];
}

$.ajax({ 				
		  type: "POST",
		 url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=191',
		 dataType: 'json',
	  contentType: 'application/json',
	success:function(result)
	{ 
		
		var m=arr.length;
	 	var ab=0;
		 $.each(result, function( index, value ){

		   var module=value.codeValue;
	       var modulename=value.codeValueId;
		
		ab++;
	       for(i=0;i<arr.length;i++)
	       {
	    	   if(a[i]==modulename)
	    		   {
	    	$('#editactivitySubContextId').append('<option  value="'+modulename+'"  selected="selected" >'+module+'</option>');
	       
	       	a.splice(i, 1);
	       	i=arr.length;
	       	 
	       	
	       }
	       }
	});
			
				
		
		
	}
	
	}); 

	  
	   
}

function getList(activityTypeId){
	 $.ajax({ 				
		   	type: "POST",
		   	url:$('#contextPath').val()+'/ping/getPicklistValues.htm?codeTypeIds=188',
		   	dataType: 'json',
			contentType: 'application/json',
			success:function(result){ 
				 $.each( result, function( index, value ) {
					var codeTypeId=value.codeTypeId;
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;
					 if(activityTypeId == codeValueId){
						$("#editactivityTypeId").append('<option value="'+codeValueId+'" selected="selected" >'+codeValue+'</option>');	
						}
					 else {
						 $("#editactivityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');
					 }
				 });
				}  	
		   	});
}




$(document).ready(function() {
	 openPopupWebApp('centerLoadingImage', 25, 35);
		
		 
		 
		 
		 
	 });
</script>
 <script> 
 
  function showselection1(value)  
 { 
	var context=value;
	//var chk= "#chk"+value;
   // if($(chk).is(':checked')){
// 	var countries = [];
//     $.each($("input[name='editactivityContextId1']:checked"), function(){            
//         countries.push($(this).val());
//     });
   var countries = [];
    $('.pinToggles1:checked').each(function ()
    		{
        var e = $(this);
        countries.push(e.val());
    });
    //pinToggles1
    
    context=countries.join(",");
  //  alert("context"+context);
        $.ajax({
         type: "POST",
         url :$('#contextPath').val()+"/dashboard/getMultiselect.htm?context="+context,
         success: function(result) {
        	 
       	$('#editactivitySubContextId').empty();
 			$.each( result, function( index, value ) {
 				var codeValue=value.codeValue;
 				var codeValueId=value.codeValueId;
 				$("#editactivitySubContextId").append('<option value="'+codeValueId+'">'+codeValue+'</option>');
 			 });
         }
   }); 
    }
// }  
  function showselection()  
  {  
	var countries = [];
      $.each($("input[name='activityContextId']:checked"), function(){            
          countries.push($(this).val());
      });
      
    var context=countries.join(",");
      
         $.ajax({
          type: "POST",
          url :$('#contextPath').val()+"/dashboard/getMultiselect.htm?context="+context,
          success: function(result) {
        	$('#activitySubContextId').empty();
  			$.each( result, function( index, value ) {
  				var codeValue=value.codeValue;
  				var codeValueId=value.codeValueId;
  				$("#activitySubContextId").append('<option value="'+codeValueId+'">'+codeValue+'</option>');
  			 });
          }
    }); 
  }  
</script> 

	<script src="<%=request.getContextPath()%>/js/bootstrap-slider.js"
		type="text/javascript"></script>

	<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/script.js"></script>

<script src="<%=request.getContextPath()%>/js/bootstrap-multiselect.js"></script>
</body>
</html>