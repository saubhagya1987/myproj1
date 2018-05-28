<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Biz Unit Assumptions</title>

<style type="text/css">

.ui-slider .ui-slider-handle {
background: url(${pageContext.request.contextPath}/images/slider_button.png) no-repeat !important;
height: 25px !important;
width: 25px  !important;
-moz-border-radius: 14px !important;
-webkit-border-radius: 14px !important;
border-radius: 14px !important;
border: none !important;
-moz-box-shadow: 2px 2px 5px 0px #7E8892 !important;
-webkit-box-shadow: 2px 2px 5px 0px #7E8892 !important;
box-shadow: 2px 2px 5px 0px #7E8892 !important;
top: -.5em !important;
cursor: pointer !important;
}

.ui-slider {
width: 189px;
background: #FFF;
border: 1px solid #939EAA;
height: 8px;
-moz-box-shadow: 1px 1px 3px 0px #BEBEBE inset;
-webkit-box-shadow: 1px 1px 3px 0px #BEBEBE inset;
box-shadow: 1px 1px 3px 0px #BEBEBE inset;
-webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
margin-top: 20px;
}
.range_counter {
font-family: "Aller Bold";
font-size: 26px!important;
text-shadow: 1px 1px 0px #FFF;
width: 113px!important;
text-align: center;
color: #9F2443;
text-shadow: 0px 0px 0px #000;
border: none;
background: none;
}
.scale_range {
width: 193px;
position: relative;
float: left;
}
.scale_range .extrem {
position: absolute;
color: #3e3e3a;
font-size: 14px;
font-family: "Verdana, Arial, Helvetica, sans-serif;";
top: -4px;
}
.scale_range .low {
left: -5px;
}
.scale_range .high {
right: -5px;
}
.scale .counter_parent {
position: relative;
float: right;
margin-top: -21px;
}
.scale .counter_parent:after {
content: "";
height: 0px;
width: 51px;
position: absolute;
display: block;
bottom: -5px;
/* border-bottom: 1px dashed #656561; */
left: 19%;
}
</style>


<style type="text/css">

.ui-slider .ui-slider-handle {
background: url(${pageContext.request.contextPath}/images/slider_button.png) no-repeat;
height: 25px;
width: 25px;
-moz-border-radius: 14px;
-webkit-border-radius: 14px;
border-radius: 14px;
border: none;
-moz-box-shadow: 2px 2px 5px 0px #7E8892;
-webkit-box-shadow: 2px 2px 5px 0px #7E8892;
box-shadow: 2px 2px 5px 0px #7E8892;
top: -.5em;
cursor: pointer;
}

.ui-slider {
width: 189px;
background: #FFF;
border: 1px solid #939EAA;
height: 8px;
-moz-box-shadow: 1px 1px 3px 0px #BEBEBE inset;
-webkit-box-shadow: 1px 1px 3px 0px #BEBEBE inset;
box-shadow: 1px 1px 3px 0px #BEBEBE inset;
-webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
margin-top: 20px;
}
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
</style>
<!-- custom scroll to "common_in_content" -->
</head>
<body>
<%HttpSession hes=request.getSession();%>
<input type="hidden" name="abc" id="abc" value="<%=hes.getAttribute("partyId")%>">
<%-- <jsp:include page="../common/common_popup.jsp" /> --%>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
		<div class="page-header clearfix">
                <h1 class="pull-left"><B>Biz Unit Profile for <%=hes.getAttribute("nameBizUnit")%></B></h1>
                <div class="nav-search pull-right" id="">
                  
                </div>
               </div>
		
<!--css popup window start 1-->
<%-- <div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

    <!-- <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3>Log Trouble Ticket</h3></div>
        <div id="poptable_contactform">
        	
             <div class="full">
              <input type="text" class="form-control" placeholder="Subject">
               </div>
                <div class="full" >
               <textarea class="form-control" rows="3" placeholder="Your Question" style="height: 100px;"></textarea>
			</div>
             <div class="full">
              <input type="text" class="form-control" placeholder="Attach File" >
              
               </div>
 </div>
   <div class="topbuttonholder">
        	<form><input class="dbtn" value="Send Email"   id="loginButton" type="button">	
            <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>  
        
	</div> -->
</div> --%>
<!--css popup window 1 close-->
<!--css popup window start 2-->
<%-- <div style="display: none;" id="blanket"></div>
<div style="display: none; width:650px; height:620px; top:100px; overflow: auto;" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlertaddnote')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
<!-- Edit-->
    <div id="editnote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Edit BU </h3></div>
      <div id="poptable_contactform" style="padding:10px; height:450px;">
        	<span  class="searchpadding padding_top" style="float:left; width:150px;">Biz Unit    <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;">
<input type="text" class="form-control" placeholder="Shubhchintak "></span>
</span>
        <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Short Name  <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="SHUBH"></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Company Name  <span class="red">*</span>  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="Axis AMC
"></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Address  <span class="red">*</span></span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="password" class="form-control" placeholder="Lower Parel Mills">
</span>
<div class="clearfix"></div>
<span class="searchpadding padding_top" style="float:left; width:150px;">  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="password" class="form-control" placeholder=" ">
</span>
<div class="clearfix"></div>
<span class="searchpadding padding_top" style="float:left; width:150px;">  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="password" class="form-control" placeholder=" ">
</span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Country  <span class="red">*</span></span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<select name="Saving" class="form-control" style="width:300px; float:left;">
                                <option>India</option>	
                                 <option>India</option>
                                
                               
        </select>
</span>
        <div class="clearfix"></div>
         <span  class="searchpadding padding_top" style="float:left; width:150px;">State 
 <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;">
<select name="Saving" class="form-control" style="width:300px; float:left;">
                                <option>Maharashtra</option>	
                                <option>Manipur</option>
                                <option>Meghalaya</option>
                               
        </select></span>
         <div class="clearfix"></div>
         <span  class="searchpadding padding_top" style="float:left; width:150px;">City  <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;width:300px; ">
<select name="Saving" class="form-control" style="width:300px; float:left;">
                                <option>Mumbai</option>	
                                <option>Pune</option>
                              
                               
        </select></span>
        <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;"> Zip Code <span class="red">*</span>   </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="password" class="form-control" placeholder="400091 ">
</span>
<div class="clearfix"></div>
     
         
 
 </div>
  <div class="topbuttonholder">
        	<input id="SPBUProfAssumEditLink" class="dbtn" value="Save" type="button">	
           
            <input class="dbtn" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
</div> --%>
<!-- popup end-->
<!-- <div class="row headerstrip">
  <div class="headstrip"></div>
   <div class="container">
        <div class="col-md-6 topbanner" >
     <img src="images/banner.png" class="img-responsive">
     </div>
    <div class="col-md-6 " style="padding-top:10px;">
          <div class="nav-no-collapse header-nav">
         	<ul class="nav pull-right" style="margin-top:10px;">
               			<li class="dropdown dropdown-box" >
                    <a class="btn dropdown-toggle" href="#" data-toggle="dropdown">
                     <i class="icon-white"><img src="images/user.png"></i><span class="user">Priyanka </span>  <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-menu-title">
                            <span class="user">Account Settings</span></li>
                            <li><a href="partner_profile.html" alt="Profile" title="Profile"><i class="halflings-icon "><img src="images/user.png"></i>
                            <span class="user">Profile</span></a></li>
                            <li><a href="login.html" alt="Logout" title="Logout"><i class="halflings-icon off">
                            <img src="images/logout-menu-button.png"></i><span class="user"  style="margin-left: 10px;">Logout</span></a></li>
                         </ul>
                    </li>
                   </ul>
                   
                          <div class="topLink">
                 <span class="buname"> <a href="#">Harish Barke</a> </span>[Shubhchintak]
                          
            </div>
        </div>
            </div>
            
	  </div>
    </div> --> 
    
      <!--Nav Menu Start--> 
<!--  <div class="navbar-inverse">
	<div class="container">
    <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    <a class="navbar-brand" href="#"> </a>
	</div>

    </div>
 </div> -->
<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 

<%-- <div class="container">
	<div class="portfoliostrip collapse navbar-collapse">
    	<ul class="navbar-sub">
     <!--     <li class="active"><a href="#.html">Biz Unit</a></li>
            <li><a href="scheduledreports.html">Department</a></li>
            <li><a href="reportdownloads.html"> Service Team</a></li> -->
            	<li id="SPBizUnitLink" class="active"><a  href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm?buId=${sessionScope.userSession.buId}">Biz Unit</a></li> 
            <li id="SPDepartmentLink"><a href="<%=request.getContextPath()%>/departmentlist/getDepartmentlist.htm?buId=${sessionScope.userSession.buId}">Department</a></li>
            <li id="SPServiceTeamLink"><a href="<%=request.getContextPath()%>/teammember/loadteammember.htm"> Service Team</a></li>
        </ul>
	</div>        
  </div>   --%>

 
   


 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container white">
    <%-- 	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;"><span style="float:left;">BizUnit Assumption  for <%=hes.getAttribute("nameBizUnit")%> </span>
           </div >
          </div > --%>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      
        <!-- center -->
      
      <%-- <jsp:include page="sidebar_setup.jsp"></jsp:include> --%>
                 <div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px;padding-left:10px;">
            <div class="list-group">
        		<a class="list-group-item active" href="#">Sections</a>
                <a id="SPBUProfileGeneralLink" href="<%=request.getContextPath()%>/bizunit/loadviewprofile.htm?partyId=<%=hes.getAttribute("partyId")%>" class="list-group-item">General</a>
              	<a id="SPBUProfileWhiteLabelLink" href="<%=request.getContextPath()%>/bizunit/loadwhitelabel.htm?partyId=<%=hes.getAttribute("partyId") %>" class="list-group-item">White Label</a>  	
                <a id="SPBUProfileSettingsLink" class="list-group-item" href="<%=request.getContextPath()%>/setting/loadprofile_setting.htm?partyId=<%=hes.getAttribute("partyId")%>">Settings</a>
                <a id="SPBUProfileAssumptionsLink" href="#" class="list-group-item "><strong>Assumptions</strong> </a> 
                <%-- <a id="SPProductRecommendationsLink"  href="<%=request.getContextPath()%>/partner/recommendation/getProductRecommendations.htm?partyId=<%=hes.getAttribute("partyId")%>"  class="list-group-item">Product Recommendation</a> --%>
                </div> </div>
           
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">BizUnit Assumptions </a>
              
<div class="list-group-item">
<div class="row">
	<div class="col-md-12 ">
          	 <div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
	<table  class="table table-hover  table-striped" cellpadding="0" cellspacing="0">
                   <tr id="firstRow">
		              <td colspan="3" align="right" style="border: none !important">
		              	<!-- <input id="cancel" class="btn dbtn" type="button" title="Back" value="Back" onclick="saveAdviseAssumption('termsofuse')" >
		              	<input id="cancel" class="btn dbtn" type="button" title="Next" value="Next" onclick="saveAdviseAssumption('productrecommendations')" >
		              	 -->
		              	 
		              	 <button  class="btn btn-sm btn-primary" onClick="saveAdviseAssumption('productrecommendations');"><i class='ace-icon fa fa-plus'></i>Save </button>
		              	      <!-- <input id="SPBUProfAssumEditLink" class="btn dbtn" type="button" value="Save" onclick="saveAdviseAssumption('productrecommendations')" > -->
		               </td>
		            </tr> 
	</table>		                        
    <table id="assumptionsDetails" class="table table-hover table-bordered  table-striped" cellpadding="0" cellspacing="0">
                   
                    <tr id="lastRow">
		              <td colspan="3" align="right">
		              <!-- <input id="SPBUProfAssumEditLink" class="btn dbtn" type="button" value="Save" onclick="saveAdviseAssumption('productrecommendations')" > -->
		              
		              <button  class="btn btn-sm btn-primary" onClick="saveAdviseAssumption('productrecommendations');"><i class='ace-icon fa fa-plus'></i>Save </button>
<!-- 		              	<input id="cancel" class="btn dbtn" type="button" value="Back" onclick="saveAdviseAssumption('termsofuse')" > -->
<!-- 		              	<input id="cancel" class="btn dbtn" type="button" value="Next" onclick="saveAdviseAssumption('productrecommendations')" > -->
		              	
		              	
		               </td>
		            </tr> 
                  </table>
		  </div></div>
<span style="float:right;"><br>
                  </span></div>
        	
     </div>
    </div>
</div>
</div></div>      	<br/><br/>
       	</div>
</div>
      
<!-- Center part End -->          

 	<footer>
	  <jsp:include page="../common/footer.jsp" />

	</footer>

 <form id="assumptionXMLFORM">
                
                <input type="hidden" name="dataXML" id="assumptionDataXML">
                </form>
<!--                 <script type="text/javascript">
<!-- $(function() {
// 	setTimeout(function(){$('body').show();}, 5000);
	 
/* 	$('#masterasuumption').css('font-weight','bold');
	$(document).ajaxStop(function() {
		closePopupWebApp('');
	}); */

	$(document).ajaxStart(function() {
		openPopupWebApp('centerLoadingImage', 25, 35);
	});
	
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);});
</script>  -->
<script>
//var $ = $.noConflict();
var assumptionList;
$(document).ready(function(){
  
	
// 	$('#data').append('<tr><td width="33%">Estimated Life Expectancy</td><td width="47%" style="padding:10px;"><div class="scale clearfix"><div class="scale_range"><span class="low extrem">70</span><span class="high extrem">90</span></div><div aria-disabled="false" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="ele1"><a style="left: 70%;" class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div><div class="counter_parent"><input value="85" id="ele_input1" class="range_counter" type="text" style="height:35px;"></div></div></td></tr>');
	$(document).ajaxStop(function() {
// 		closePopupWebApp('');
	});

	$(document).ajaxStart(function() {
// 		openPopupWebApp('centerLoadingImage', 25, 35);
	});
var slvals=document.getElementById("abc").value;
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/setting/getAdviceAssumptions.htm?partyId="+slvals,//abc
		success : function(result) {
		assumptionList=result;
// 		 $('.common_in_content').perfectScrollbar();
//			$('#assumptionsDetails').empty();
		$(result).each(function(i,obj) {
//				$('#lastRow').before('<tr><td width="24%">'+obj.displayLabel+'</td><td width="21%"><input name="text" type="text" id="assumption'+obj.assumptionCodeId+'" style="border:none;background:none;box-shadow:none;" value="'+obj.assumptionValue+'"/></td><td width="55%"><div class="range"> <b id="assumption'+obj.assumptionCodeId+'left" style="font-weight:normal">'+obj.valueStartRange+'</b><input type="range" onchange="changeAssumption('+obj.assumptionCodeId+')" class="vHorizon" id="assumption'+obj.assumptionCodeId+'range"/><b id="assumption'+obj.assumptionCodeId+'right" style="font-weight:normal">'+obj.valueEndRange+'</b></div></td></tr>');
			$('#lastRow').before('<tr><td width="30%">'+obj.displayLabel+'</td><td width="70%" style="padding:10px;"><div class="scale clearfix"><div class="scale_range" style="width:50%"><span class="low extrem" id="assumption'+obj.assumptionCodeId+'left">'+obj.valueStartRange+'</span><span class="high extrem" id="assumption'+obj.assumptionCodeId+'right">'+obj.valueEndRange+'</span></div><div aria-disabled="false" style="width:50%" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="assumption'+obj.assumptionCodeId+'range"><a  class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div><div class="counter_parent"><input class="range_counter" type="text" style="height:40px;width:115px;" value="'+obj.assumptionValue+'" id="assumption'+obj.assumptionCodeId+'"/></div></div></td></tr>');
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
                    
		} }); 
  }); 
  

  
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox) {

    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        slide: function (event, ui) {
            $(ctrlTextBox).val(ui.value);
			
        }
    });
    $(ctrlTextBox).val($(ctrlName).slider("value"));

    $(ctrlTextBox).keyup(function () {
        $(ctrlTextBox).val();
        $(ctrlName).slider('value', $(ctrlTextBox).val());
    });
    
	
}

function saveAdviseAssumption(id){
	//alert("Hi in save");
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
			//removeCssStyles(id);
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
			if(obj.recordTypeId==14002){
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
	var slvals=document.getElementById("abc").value;
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/setting/saveAdviceAssumption.htm?partyId='+slvals+'&recordTypeId=14002',
		data:$('#assumptionXMLFORM').serialize(),
		success : function(result) {
			if(result==true){
// 				localStorage.setItem('redirectId',id);
				
				   bootbox.dialog({
											message: "<span class='bigger-110'>Data saved successfully.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
														 location.reload();
														 resetval();
													}
												}
											}
										});
				
				//showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
			}					
		}
	});
}else{
	//showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	
	   bootbox.dialog({
			message: "<span class='bigger-110'>There are some validation errors,please check to proceed further.</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						// location.reload();
						 resetval();
					}
				}
			}
		});
	
}
}
</script>
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
  <script type="text/javascript">
  function validateAssumption(id,e){
		id=id.substring(id.indexOf('assumption')+10)
		if(id==98021 || id==98022 || id==98027 || id==98046 || id==98019 || id==98001){
		
		if ( $.inArray(e.keyCode,[46,8,9,27,13]) !== -1 ||
	            // Allow: Ctrl+A
	           (e.keyCode == 65 && e.ctrlKey === true) || 
	            // Allow: home, end, left, right
	           (e.keyCode >= 35 && e.keyCode <= 39)) {
	                // let it happen, don't do anything
	                return;
	       }
	       else {
	           // Ensure that it is a number and stop the keypress
	           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) 
	           {
	               event.preventDefault(); 
	           }   
	       }
	//	
			
	}else{
//		alert(e.keyCode)
		if ( $.inArray(e.keyCode,[46,8,9,27,13,190,110]) !== -1 ||
	            // Allow: Ctrl+A
	           (e.keyCode == 65 && e.ctrlKey === true) || 
	            // Allow: home, end, left, right
	           (e.keyCode >= 35 && e.keyCode <= 39)) {
			if($('#assumption'+id).val().indexOf('.')>-1){
	 		   if(e.keyCode==190 || e.keyCode==110){
	 			   event.preventDefault(); 
	 		   }
	 	   } 
	       }
	       else {
	           // Ensure that it is a number and stop the keypress
	           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) 
	           {
	               event.preventDefault(); 
	           }else{
//	        	   alert($('#'+id).val()+String.fromCharCode(e.keyCode));
//	        	   alert(ValidateDecimal($('#'+id).val()+String.fromCharCode(e.keyCode), 18, 2));
	               // let it happen, don't do anything
	        	   var val='0';
//	        	   alert(e.keyCode);
	        	   if(e.keyCode==96)
	        		   val='0';
	        	   else if(e.keyCode==97)
	        		   val='1';
	        	   else if(e.keyCode==98)
	        		   val='2';
	        	   else if(e.keyCode==99)
	        		   val='3';
	        	   else if(e.keyCode==100)
	        		   val='4';
	        	   else if(e.keyCode==101)
	        		   val='5';
	        	   else if(e.keyCode==102)
	        		   val='6';
	        	   else if(e.keyCode==103)
	        		   val='7';
	        	   else if(e.keyCode==104)
	        		   val='8';
	        	   else if(e.keyCode==105)
	        		   val='9';
	               if(!ValidateDecimal($('#assumption'+id).val()+val, 18, 2)){
	               	event.preventDefault();
	               }
	           }   
	       }
	}
	}  
  
  
  </script>
  
  
  
</body>
</html>