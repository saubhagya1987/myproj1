<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Partner Setup -Assumptions</title>
<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">

<!-- custom scroll to "common_in_content" -->
</head>
<body >
<jsp:include page="../common/header.jsp" />
<c:choose>
<c:when test="${sessionScope.userSession.successfulLoginCount lt 1 and sessionScope.userSession.recordtypeId eq 14003}">
 <script>
 $('#navbar').remove();
 //$('#main-container').remove();
 $('#linkbar').remove();
 $('#sidebar').remove();
 </script>
</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>
<script type="text/javascript">
$(function() {
// 	setTimeout(function(){$('body').show();}, 5000);
	 
	$('#masterasuumption').css('font-weight','bold');
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
	var restored=localStorage.getItem('dataRestored');
	if(restored=='true'){
		localStorage.setItem('dataRestored','')
		showAlertMessage("Success", "<br/>Data restored successfully.", "confirmation", doNothing);
	}
});
</script>
<script>
var $jq_1_9_1 = $//.noConflict();
var assumptionList;
$(document).ready(function(){
	var controllIds=$('#idList').val().split(',');
	$(controllIds).each(function(){
		if(this.replace("[", "").replace("]", "").replace(" ", "")=='saveAdviceAssumptionsLink'){
			$('.'+this.replace("[", "").replace("]", "").replace(" ", "")).remove();
			//isToredirect=true;
		}
	});
	
	
// 	$('#data').append('<tr><td width="33%">Estimated Life Expectancy</td><td width="47%" style="padding:10px;"><div class="scale clearfix"><div class="scale_range"><span class="low extrem">70</span><span class="high extrem">90</span></div><div aria-disabled="false" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="ele1"><a style="left: 70%;" class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div><div class="counter_parent"><input value="85" id="ele_input1" class="range_counter" type="text" style="height:35px;"></div></div></td></tr>');
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/common/getAdviceAssumptions.htm?partyId=${sessionScope.userSession.partyId}",
		success : function(result) {
		assumptionList=result;
// 		 $jq_1_9_1('.common_in_content').perfectScrollbar();
//			$('#assumptionsDetails').empty();
		$(result).each(function(i,obj) {
//				$('#lastRow').before('<tr><td width="24%">'+obj.displayLabel+'</td><td width="21%"><input name="text" type="text" id="assumption'+obj.assumptionCodeId+'" style="border:none;background:none;box-shadow:none;" value="'+obj.assumptionValue+'"/></td><td width="55%"><div class="range"> <b id="assumption'+obj.assumptionCodeId+'left" style="font-weight:normal">'+obj.valueStartRange+'</b><input type="range" onchange="changeAssumption('+obj.assumptionCodeId+')" class="vHorizon" id="assumption'+obj.assumptionCodeId+'range"/><b id="assumption'+obj.assumptionCodeId+'right" style="font-weight:normal">'+obj.valueEndRange+'</b></div></td></tr>');
			$('#lastRow').before('<tr><td width="30%">'+obj.displayLabel+'</td><td width="70%" style="padding:10px;"><div class="scale clearfix" ><div class="col-md-8 southspace3"><div class="scale_range"><span class="low extrem" id="assumption'+obj.assumptionCodeId+'left">'+obj.valueStartRange+'</span><span class="high extrem" id="assumption'+obj.assumptionCodeId+'right">'+obj.valueEndRange+'</span></div><div aria-disabled="false" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="assumption'+obj.assumptionCodeId+'range"><a  class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div></div><div class="col-md-4"><div class="counter_parent"><input class="range_counter" type="text" style="height:35px;width:115px;" value="'+obj.assumptionValue+'" id="assumption'+obj.assumptionCodeId+'"/></div></div></div></td></tr>');
			if(obj.valueDataTypeId==37004){
				createSlider('#assumption'+obj.assumptionCodeId+'range',parseInt(obj.valueStartRange),parseInt(obj.valueEndRange),0.25,'#assumption'+obj.assumptionCodeId);
			}else if(obj.valueDataTypeId==37003){
				createSlider('#assumption'+obj.assumptionCodeId+'range',parseInt(obj.valueStartRange),parseInt(obj.valueEndRange),1000,'#assumption'+obj.assumptionCodeId);
			}
			else{
				createSlider('#assumption'+obj.assumptionCodeId+'range',parseInt(obj.valueStartRange),parseInt(obj.valueEndRange),1,'#assumption'+obj.assumptionCodeId);
			}
			$('#assumption'+obj.assumptionCodeId).val(obj.assumptionValue);
		});		
		$('#assumptionsDetails input[type="text"]').change(function() {
			var id=$(this).attr('id');
			var left=parseFloat($('#'+id+'left').html());
			var right=parseFloat($('#'+id+'right').html());
			var value=$('#'+id).val();
			value=value<parseFloat($('#'+id+'left').html())?0:(value>parseFloat($('#'+id+'right').html())?parseFloat($('#'+id+'right').html()):(((value-left)/(right-left))*100))
			$('#'+id+'range a.ui-slider-handle').css('left',value+'%');							
		});	
		$('#assumptionsDetails input[type="text"]').each(function() {
			$(this).change();			
		});
		$('#assumptionsDetails input[type="text"]').each(function() {
			$(this).attr('onkeydown','validateAssumption(id,event)');
		});
            
  }
	});
});
  
  
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox) {

    $jq_1_9_1(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        slide: function (event, ui) {
            $jq_1_9_1(ctrlTextBox).val(ui.value);
			
        }
    });
    $jq_1_9_1(ctrlTextBox).val($jq_1_9_1(ctrlName).slider("value"));

    $jq_1_9_1(ctrlTextBox).keyup(function () {
        $jq_1_9_1(ctrlTextBox).val();
        $jq_1_9_1(ctrlName).slider('value', $jq_1_9_1(ctrlTextBox).val());
    });
    
	
}



function saveAdviseAssumption(id){
	
	var isToredirect=false;
	var controllIds=$('#idList').val().split(',');
	$(controllIds).each(function(){
		if(this.replace("[", "").replace("]", "").replace(" ", "")=='saveAdviceAssumptionsLink'){
			//$('.'+this.replace("[", "").replace("]", "").replace(" ", "")).remove();
			isToredirect=true;
		}
			
			
	});
	 if(('${sessionScope.userSession.buId}'=='27829' && '${sessionScope.userSession.roleId}'!='212') || isToredirect==true){
		 localStorage.setItem('redirectId',id);
		 redirectToPanel1();
		}else{	
	var isValidated=true;
	$('#assumptionsDetails input[type="text"]').each(function() {
		var id=$(this).attr('id');
		var left=parseFloat($('#'+id+'left').html());
		var right=parseFloat($('#'+id+'right').html());
		var value=parseFloat($('#'+id).val());
		if(value<left ||value>right  || isNaN(value)){
			isValidated=false;
			addCssStyles(id, "Please enter value in range.");
		}else{
			removeCssStyles(id);
		}
	});
if(isValidated==true){
	var dataXML='<Root>';
	$(assumptionList).each(function(i,obj) {
		var assumptionCodeId=obj.assumptionCodeId;
		var assumptionValue=$('#assumption'+assumptionCodeId).val();
		var valueDataTypeId=obj.valueDataTypeId;
		var displayLabel=obj.displayLabel;
		var valueEndRange=obj.valueEndRange;
		var valueStartRange=obj.valueStartRange;
		var id=obj.id;
		dataXML+='<Assumption>';
			dataXML+='<AssumptionCodeId>'+assumptionCodeId+'</AssumptionCodeId>';
			dataXML+='<AssumptionValue>'+assumptionValue+'</AssumptionValue>';
			dataXML+='<ValueDataTypeId>'+valueDataTypeId+'</ValueDataTypeId>';
			dataXML+='<DisplayLabel>'+displayLabel+'</DisplayLabel>';
			dataXML+='<ValueEndRange>'+valueEndRange+'</ValueEndRange>';
			dataXML+='<ValueStartRange>'+valueStartRange+'</ValueStartRange>';
			if(obj.recordTypeId==14003){
				dataXML+='<Id>'+id+'</Id>';
			}else{
				dataXML+='<Id>0</Id>';
			}
			
		dataXML+='</Assumption>';
	});
	dataXML+='</Root>';
	console.log('dataXML:---'+dataXML)
	$('#assumptionDataXML').val(dataXML);
	$('#assumptionDataXML').removeAttr('disabled');
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/saveAdviceAssumption.htm?partyId=${sessionScope.userSession.partyId}&recordTypeId=14003',
		data:$('#assumptionXMLFORM').serialize(),
		success : function(result) {
			if(result==true){
				localStorage.setItem('redirectId',id);
				showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", redirectToPanel1);
			}					
		}
	});
}else{
	showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
}
		}
}

function confirmSetDefault(){
  	var innerHTML="All Advice Assumptions values will be set to";
  	innerHTML=innerHTML+" default.";
  	innerHTML=innerHTML+" Are you sure you want to continue ?";
	showAlertMessage("Message", "<br/>" + innerHTML, "question",
			doNothing1);
	$('.ZebraDialog_Button1').attr('href','javascript:setDefault()');
	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}

function setDefault(){
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/partner/setDefault?partyId=${sessionScope.userSession.partyId}',
		success : function(result) {
			if(result=="success"){
				localStorage.setItem('dataRestored','true');
				reloadPage();
				
			}					
		}
	});
}

</script>
<style type="text/css">
.range_counter {
	font-family: "Aller Bold";
	font-size: 26px!important;
	text-shadow: 1px 1px 0px #FFF;
	width: 64px;
	text-align: center;
	color: #9F2443;
	text-shadow: 0px 0px 0px #000;
	border: none;
	background: none;
}
.scale .counter_parent:after {
	border-bottom: none !important;
}
</style>
<!-- Center part start -->
<section>
<input type="hidden" id="idList" value="${sessionScope.idList}"/>
<div class="">
<div class="page-header clearfix">
                    <h1>Partner Setup</h1>
                    
                  </div><div class="container-body " style="padding:5px;"> </div>
<div class="container-body">

<!-- center -->

<jsp:include page="sidebar_setup.jsp"></jsp:include>
<div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
  
  <!-- center -->
  
  <div class="list-group"><a class="list-group-item active" href="#">Master Assumptions</a>
    <div class="list-group-item">
      <div class="row">
        <div class="col-md-12 ">
          <div class="table-responsive" id="display_table_lead" style="border:none;">
            <div id="toreload">
              <table  class="table table-hover  table-striped" cellpadding="0" cellspacing="0">
                <tr id="firstRow">
                  <td colspan="3" align="right" style="border: none !important"><c:choose>
                      <c:when test="${sessionScope.userSession.buId!='27829'}">
                        <input id="cancel" class="btn btn-primary btn-xs dbtn" type="button" title="Back" value="Back" onclick="saveAdviseAssumption('termsofuse')" >
                        <input id="cancel" class="btn btn-primary btn-xs dbtn" type="button" title="Next" value="Next" onclick="saveAdviseAssumption('productrecommendations')" >
                        <input id="cancel" class="btn btn-primary btn-xs dbtn saveAdviceAssumptionsLink" type="button" title="Set Default" value="Set Default" onclick="confirmSetDefault()" >
                      </c:when>
                      <c:otherwise>
                        <input id="cancel" class="btn dbtn" type="button" title="Next" value="Next" onclick="saveAdviseAssumption('productrecommendations')" >
                      </c:otherwise>
                    </c:choose></td>
                </tr>
              </table>
              <table id="assumptionsDetails"  class="table table-hover table-bordered  table-striped" cellpadding="0" cellspacing="0">
                <tr id="lastRow">
                  <td colspan="3" align="right"><c:choose>
                      <c:when test="${sessionScope.userSession.buId!='27829'}">
                        <input id="cancel" class="btn btn-primary btn-xs dbtn" type="button" title="Back" value="Back" onclick="saveAdviseAssumption('termsofuse')" >
                        <input id="cancel" class="btn btn-primary btn-xs dbtn" type="button" title="Next" value="Next" onclick="saveAdviseAssumption('productrecommendations')" >
                        <input id="cancel" class="btn btn-primary btn-xs dbtn saveAdviceAssumptionsLink" type="button" title="Set Default" value="Set Default" onclick="confirmSetDefault()" >
                      </c:when>
                      <c:otherwise>
                        <input id="cancel" class="btn dbtn btn-primary btn-xs" type="button" title="Next" value="Next" onclick="saveAdviseAssumption('productrecommendations')" >
                      </c:otherwise>
                    </c:choose></td>
                </tr>
              </table>
            </div>
          </div>
          <span style="float:right;"><br>
          </span></div>
      </div>
    </div>
  </div>
</div>
</div>
<br/>
<br/>
</div>
</div>

<!-- Center part End -->

<jsp:include page="../common/footer.jsp" />
<form id="assumptionXMLFORM">
  <input type="hidden" name="dataXML" id="assumptionDataXML">
</form>


<script>
  $("[data-slider]")
    .each(function () {
      var input = $(this);
      $("<span>")
        .addClass("output")
        .insertAfter($(this));
    })
    .bind("slider:ready slider:changed", function (event, data) {
      $(this)
        .nextAll(".output:first")
          .html(data.value.toFixed(3));
    });
  </script>
</body>
</html>