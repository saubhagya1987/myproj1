<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page language="java" import="java.util.*" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>View General Password </title>
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<!--  <script>
 (function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":9999999,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(99999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);});	
 
 
 $(function() {
		var availableTags = [
			"ActionScript",
			"AppleScript",
			"Asp",
			"BASIC",
			"C",
			"C++",
			"Clojure",
			"COBOL",
			"ColdFusion",
			"Erlang",
			"Fortran",
			"Groovy",
			"Haskell",
			"Java",
			"JavaScript",
			"Lisp",
			"Perl",
			"PHP",
			"Python",
			"Ruby",
			"Scala",
			"Scheme"
		];
		$( "#tags" ).autocomplete({
			source: availableTags
		});
		
	});
	</script> -->
<script type="text/javascript">
function f2(el) 
{
    el.value = el.value.toLowerCase();
}


function editValidation()
{
	var myLength = $("#disZip").val().length;
	var abc=$("#disZip").val();
	var mob=$("#contactno").val();
//	var moblile=$("#contactno").val().length;
	//emailid 
	//alert(abc);
	  if ( $('#disBizName').val().trim()=="") 
	  {
			 alert("Please Enter BizUnit Name");
			 $('#disBizName').val('');
			 $('#disBizName').focus();
	         return false;
	     } 
	  if ( $('#disShortName').val().trim()=="") 
	  {
			 alert("Please Enter Short Name");
			 $('#disShortName').val('');
			 $('#disShortName').focus();
	         return false;
	     } 
	  if ( $('#disCompanyName').val().trim()=="") 
	  {
			 alert("Please Enter Company Name");
			 $('#disCompanyName').val('');
			 $('#disCompanyName').focus();
	         return false;
	     } 
	  if ( $('#disAdd1').val().trim()=="") 
	  {
			 alert("Please Enter Address ");
			 $('#disAdd1').val('');
			 $('#disAdd1').focus();
	         return false;
	     } 
	
	  if ( $('#disZip').val().trim()=="") 
	  {
			 alert("Please Enter Zipcode ");
			 $('#disZip').val('');
			 $('#disZip').focus();
	         return false;
	     } 
  
	  if (isNaN(abc)) 
	  {
		 
			 alert("Please Enter Numeric Value in zipcode.");
			 $('#disZip').val('');
			 $('#disZip').focus();
	         return false;
	     } 
	  
	  if (myLength!=6) 
	  {
		//  alert(myLength);
			 alert("Please Enter Valid  ZipCode");
			 $('#disZip').val('');
			 $('#disZip').focus();
	         return false;
	     } 
	  
	  if(10>mob.length||mob.length>13)
		  {
			 alert("Please Enter Valid Contact Number.");
			 $('#contactno').val('');
			 $('#contactno').focus();
	         return false;
		  }
	  
	if(isNaN(mob))
		{
		 alert("Please Enter Numeric Value in Contact Number.");
		 $('#contactno').val('');
		 $('#contactno').focus();
         return false;
		}

	if($('#contactno').val().trim()=="")
		{
		alert("Please Enter Contact Number.");
		 $('#contactno').val('');
		 $('#contactno').focus();
       return false;
		}
	
	
	
	if($('#emailid').val().trim()=="")
		{
		alert("Please Enter Email-Id.");
		 $('#emailid').val('');
		 $('#emailid').focus();
       return false;
		}
	if(editvalidEmail()==false)
		{
		alert("Please Enter Valid Email.");
		 $('#emailid').val('');
		 $('#emailid').focus();
        return false;
		}
	  
	
return true;
}






function getconfirmpassword(){
	
	var m=$('#confirmPassword').val();
	var m1=$('#newPassword').val();
	var m2 =$('#newPassword').val().length;
	
	if(m!=m1)
		{
		  bootbox.dialog({
			  	message: "<span class='bigger-110'>New and Confirm Password should be same.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
					
						}
					}
				}
			});				
	$('#confirmPassword').val('');
	$('#newPassword').val('');
	$('#newPassword').focus();
	return false;
		}else if (!m1.match(/^(?=.*?[a-z])(?=.*[A-Z])(?=.*?\d)(?=.*[!@$#])/i))
				 
			{
			 bootbox.dialog({
				  	message: "<span class='bigger-110'>At least one letter, one digit and one special character from (@,$,#) required in password.</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
						
							}
						}
					}
				});					
									
					$('#confirmPassword').val('');
					$('#newPassword').val('');
					$('#newPassword').focus();
					return false;
			
		}if(m2<8 || m2 >15)
		{
			 bootbox.dialog({
				  	message: "<span class='bigger-110'>Password should be grether than 8  and less than 15 characters.</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
						
							}
						}
					}
				});					
			$('#newPassword').focus();
			return false;
					
		}
}
function getPasswordMap()
{
  
	// alert('Pleas hiiiiiii '+$('#oldpassword').val());
	
if($('#oldpassword').val()=='')
	{
	  
	}
else
	{	
	
	$.ajax({
	type :'POST',  
	data:$('#pingForm').serialize(),
	 url: $('#contextPath').val()+'/common/getCheckPassword.htm?',//password='+$('#oldpassword').val(),
   		success : function(result)
			{
             if(result==0)
            	 {
            	  bootbox.dialog({
          		  	message: "<span class='bigger-110'>Please enter correct old password.</span>",
          			buttons: 			
          			{
          				"click" :
          				{
          					"label" : "OK!",
          					"className" : "btn-sm btn-primary",
          					"callback": function() {
          					
          					}
          				}
          			}
          		});
            	 /* showAlertMessage("Message", "<br/>Please enter correct old password ", "information"); */
            	 $('#oldpassword').val('');
            	 $('#oldpassword').focus();
            	 }
        
            
	}
});


	}
	
}




</script>

<!-- <script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script> -->
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->


</head>
<body>
<%HttpSession hes=request.getSession();%>
<input type="hidden" name="abc" id="abc" value="<%=hes.getAttribute("partyId")%>">
<input type="hidden" name="partyIds" id="partyIds" value="<%=hes.getAttribute("partyId")%>">
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
<!--css popup window start 1-->
<!-- <div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   		
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
        
	</div>
</div> -->
<!--css popup window 1 close-->
<!--css popup window start 2-->
<!-- <div style="display: none;" id="blanket"></div>
<div style="display: none; width:650px; height:620px; top:100px; overflow: auto;" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlertaddnote')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>
Edit
    <div id="editnote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Edit BU </h3></div>
      <div id="poptable_contactform" style="padding:10px; height:450px;">
        	<span  class="searchpadding padding_top" style="float:left; width:150px;">Biz Unit    <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;">
<input type="text" class="form-control" placeholder="Biz Unit  "></span>
</span>
        <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Short Name  <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="Short Name"></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Company Name  <span class="red">*</span>  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="Company Name
"></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Address  <span class="red">*</span></span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="Address">
</span>
<div class="clearfix"></div>
<span class="searchpadding padding_top" style="float:left; width:150px;">  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" ">
</span>
<div class="clearfix"></div>
<span class="searchpadding padding_top" style="float:left; width:150px;">  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" ">
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
<input type="text" class="form-control" placeholder=" ">
</span>




<div class="clearfix"></div>
     
         
 
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save" id="Save" type="button">	
           
            <input class="dbtn " onClick="popup('popUpAlertaddnote')" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
</div>

      
 <div class="navbar-inverse" >
	<div class="container ">
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
 <!-- Center part start -->

        
          <div class="page-header" >
          <h1 class="pull-left">User Profile for ${userSession.name}</h1> 
<div class="clearfix"></div>
         </div >
        
        
        <div class="row">
      <div class="col-md-2" >
		<div class="list-group">
         	   <a class="list-group-item active" href="#">Sections</a>
                <a id="SPGeneralProfileLink" href="<%=request.getContextPath()%>/common/loaduserProlife.htm" class="list-group-item">Profile</a>

				<a id="SPchangepwdLink" class="list-group-item" href="#"><strong>Change Password</strong></a>
				
				<a id="SPManageHierachyLink" href="<%=request.getContextPath()%>/manageheirachy.htm" class="list-group-item">Manage Hierarchy</a>
				
				
				
				
				
	   </div>
		</div>
		
		<div class="col-md-9">
		
		 
		      <div class="list-group">
		      <a class="list-group-item active" href="#">Change Password </a>
		      	<div class="list-group-item">
		<div class="clearfix"></div>
		<form class="form-horizontal" id="pingForm" method="POST">
		
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="OldPassword">Old Password<span class="red">*</span></label>
						<div class="col-xs-12 col-md-8">
							<div class="clearfix"></div>
							<input type="password" class="form-control" name="oldPassword" id="oldpassword" value="" placeholder="Old Password" onblur="getPasswordMap()">
						</div>
					</div>
					<div class="space-2"></div>
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="newPassword">New Password<span class="red">*</span></label>
						<div class="col-xs-12 col-md-8">
							<div class="clearfix"></div>
							<input type="password" class="form-control" name="newPassword" id="newPassword"  value="" placeholder="New Password">
						</div>
					</div>
					<div class="space-2"></div>	
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 no-padding-right" for="newPassword1">Confirm Password<span class="red">*</span></label>
						<div class="col-xs-12 col-md-8">
							<div class="clearfix"></div>
							<input type="password" class="form-control" name="newPassword1" id="confirmPassword" value="" placeholder="Confirm Password" onblur="getconfirmpassword()">
						</div>
					</div>
					<div class="space-2"></div>	
									
					<div class="modal-footer">	
						
							<div class="clearfix">
								<button id="SPAddNewServiceTeamLink" class="btn btn-sm btn-primary"  onclick="updatepwd();" ><i class='ace-icon fa fa-plus'></i>Save</button>
								<a href="<%=request.getContextPath()%>/welcome/redirect.htm" class="pagerLink">
    							<input  type="button" class="btn btn-sm btn-danger" value="  Cancel"  title="Cancel" alt="Cancel" ></a>
							</div>
					</div>
					
					</form></div>
					
					</div></div></div>
		
		
				<!-- <form  id="addform" class="form-horizontal" method="POST">
 				 <div class="clearfix"></div>
 	
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="OldPassword">Old Password<span class="red">*</span></label>
						<div class="col-xs-12 col-md-8">
							<div class="clearfix"></div>
							<input type="password" class="form-control" name="oldPassword" id="oldpassword" value="" placeholder="Old Password" onblur="getPasswordMap()">
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 padding-right" for="newPassword">New Password<span class="red">*</span></label>
						<div class="col-xs-12 col-md-8">
							<div class="clearfix"></div>
							<input type="password" class="form-control" name="newPassword" id="newPassword"  value="" placeholder="New Password">
						</div>
					</div>
					<div class="space-2"></div>	
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-md-2 no-padding-right" for="newPassword1">Confirm Password<span class="red">*</span></label>
						<div class="col-xs-12 col-md-8">
							<div class="clearfix"></div>
							<input type="password" class="form-control" name="newPassword1" id="confirmPassword" value="" placeholder="Confirm Password">
						</div>
					</div>
					<div class="space-2"></div>	
				<%-- 	</form> -->
					 <div class="modal-footer">
    					
    					<input  type="button" class="btn btn-sm btn-primary" value="  Save" onclick="updatepwd()"  title="Save" alt="Save">
    					<a href="<%=request.getContextPath()%>/welcome/redirect.htm" class="pagerLink">
    					<input  type="button" class="btn btn-sm btn-danger" value="  Cancel"  title="Cancel" alt="Cancel" ></a>
    </div> --%>
					</div>
		
		</div>
		</div>
		</div>
<!-- </div>  -->          	
<!-- Center part End -->          
<footer>
<jsp:include page="../common/footer.jsp" />
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
</footer>
<script>
function addNote(){

$("#addnote").show();	
$("#deletenote, #editnote").hide();	

$("#popUpAlertaddnote").css ('height','620px');
$("#popUpAlertaddnote").css ('width','650px');

}

function deleteNote(){

$("#deletenote").show();	
$("#addnote, #editnote").hide();	
$("#popUpAlertaddnote").css ('height','400px')
$("#popUpAlertaddnote").css ('width','400px')

}
function editNote(){

$("#editnote").show();	
$("#addnote, #deletenote").hide();	
$("#popUpAlertaddnote").css ('height','620px')
$("#popUpAlertaddnote").css ('width','650px')

}

function updatepwd(){
	
	//alert('HIIEE')
	var validator=$('#pingForm').validate({
	errorElement: 'div',
	errorClass: 'help-block',
	focusInvalid: false,
	ignore: "",
	 icon: {
	valid: 'glyphicon glyphicon-ok',
	invalid: 'glyphicon glyphicon-remove',
	validating: 'glyphicon glyphicon-refresh'
	},
	rules: {
		
		oldPassword: {
			required: true
		},
		newPassword:{
			required: true		
		},
		newPassword1: {
			required: true
		}
	
	},

	messages: {
		oldPassword: "Old Password is required.",
		newPassword: "New Password is required.",
		newPassword1:"Confirm Password is required."
	
	},


	highlight: function (e) {
		$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
	},

	success: function (e) {
		$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
		$(e).remove();
	},

	errorPlacement: function (error, element) {
		if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
			var controls = element.closest('div[class*="col-"]');
			if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
			else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
		}
		else if(element.is('.select2')) {
			error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
		}
		else if(element.is('.chosen-select')) {
			error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
		}
		else error.insertAfter(element.parent());
	},

	submitHandler: function (form) {
		
		if(validator.form()){
			// validation perform
			
			updatePassword();
					
		}
	},
	invalidHandler: function (form) {
		
	}
});
}

/* function validates()
{


	var m=$('#confirmPassword').val();
	var m1=$('#newPassword').val();
	//alert(m1+" hemlo" +m);
	var m2 =$('#newPassword').val().length;
	
	
	if(m!=m1)
		{
		  bootbox.dialog({
			  	message: "<span class='bigger-110'>New and Confirm Password should be same.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
					
						}
					}
				}
			});				
	$('#confirmPassword').val('');
	$('#newPassword').val('');
	$('#newPassword').focus();
	return false;
		}
	else if($('#oldpassword').val()=='')
	{
		alert("Message", "<br/>Please enter old Password", "information");
		$('#oldpassword').focus();
		return false;
	}
	else if($('#newPassword').val()=='')
	{
		alert("Message", "<br/>Please enter New Password", "information");
		$('#newPassword').focus();
		return false;
	}
	else if($('#confirmPassword').val()=='')
		{
		alert("Message", "<br/>Please Confirm Password", "information");
		$('#confirmPassword').focus();
		return false;
		}
	else if (!m1.match(/^(?=.*?[a-z])(?=.*[A-Z])(?=.*?\d)(?=.*[!@$#])/i))
			 
{
				
		alert("Message", "<br/>At least one letter, one digit and one special character from (@,$,#) required in password", "information");
		
		$('#confirmPassword').val('');
		$('#newPassword').val('');
		$('#newPassword').focus();
		return false;
		
		
	}
	else if(m2<8 || m2 >15)
		{
		alert("Message", "<br/>Password should be grether than 8  and less than 15 characters", "information");
		$('#newPassword').focus();
		return false;
		} 
	 
	return true;
}
 */

function updatePassword()
{
	$.ajax({
			type :'POST',
			data:$('#pingForm').serialize(),
			url : $('#contextPath').val() +'/common/updatePassword.htm?',//newpassword='+baji,
			 success : function(result) 
			 {
		          
	         // alert('Record Added successfully');
	       
	          $('#common_popup_div,#shadow_div_web_app').remove();
	         
	        /*   if(action==1){
	        	  showAlertMessage("Success", "<br/>Passsword Updated successfully", "confirmation", reload);
	        	 
	          }else{ */
	        	  bootbox.dialog({
	      		  	message: "<span class='bigger-110'>Passsword Updated successfully.</span>",
	      			buttons: 			
	      			{
	      				"click" :
	      				{
	      					"label" : "OK!",
	      					"className" : "btn-sm btn-primary",
	      					"callback": function() {
	       					}
	      				}
	      			}
	      		});
	      		
	        	  
	        	  resetval();
	   	    	  /* addNote().show();
	              popup('popUpAlertaddnote').show();*/
	             
	          
	         
	  }
	  
		}); 
	
	
	
	
	}
		


	
function resetval()
{
	
	$('#oldpassword').val('');
	$('#newPassword').val('');
	$('#confirmPassword').val('');
	
}


</script>
</body>
</html>