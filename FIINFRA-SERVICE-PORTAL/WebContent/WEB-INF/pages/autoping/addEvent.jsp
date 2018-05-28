<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>AutoPing Event </title>
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
    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>

	<!-- -responsive css-->
	<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
	<!-- -responsive css-->
	<%-- <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script> --%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<!-- Css validation popup -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/zebra_dialog.css"
	type="text/css">

		<!-- cron lib -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-cron.js"></script>
	<link type="text/css" href="<%=request.getContextPath()%>/css/jquery-cron.css" rel="stylesheet" />
	
	<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
	<style>
		.mostusedNewicon{
		                background:url(../images/allCommon-Icons.png) no-repeat -89px -2928px; 
		                padding-right:20px;
		                width:20px;
		                height:20px; 
		                padding-bottom: 15px;
		                }
		.popularicon{
		                background:url(../images/allCommon-Icons.png) no-repeat -89px -2955px; 
		                padding-right:20px;
		                width:20px;
		                height:20px; 
		                padding-bottom: 15px;}
		.favoriteicon{
		                background:url(../images/allCommon-Icons.png) no-repeat -89px -2982px; 
		                padding-right:20px;
		                width:20px;
		                height:20px; 
		                padding-bottom: 15px;}
	
	</style>
	<style type="text/css">
  .box2{
       display: none;
    }
    
</style>
<!-- <script type="text/javascript">
bkLib.onDomLoaded(function() { 
	new nicEditor({maxWidth : 100}).panelInstance('emailBody');
    new nicEditor({maxHeight : 50}).panelInstance('emailBody');
}); 

</script> -->
	<script type="text/javascript">
	
	
	(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
    $(document).ready(function(){
        $("#deliveryChannel").change(function(){
            $( "select option:selected").each(function(){
            	 if($(this).attr("value")=="sel"){
                     $(".box2").hide();
                 }
                if($(this).attr("value")=="32001"){
                    $(".box2").hide();
                    $(".email").show();
                }
                if($(this).attr("value")=="32002"){
                    $(".box2").hide();
                    $(".sms").show();
                }
            });
        }).change();
    });
</script>

</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" /> 
 <section>
	<div class="container white">
    	<div class="container-head">
        	<div class="col-md-12" style="text-align: right;">
        		<span style="float:left;">Add Event</span>
           	</div>
        </div >
	  	<div class="container-body">
      	<!--  include ping side bar -->
      	<jsp:include page="autopingsidebar.jsp" />
        	<div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
         		<div class="list-group">
        			<a class="list-group-item active" href="#">ADD/EDIT Event</a>
           	  		<div class="accordion pull-left col-md-12" id="accordFundSel" style="margin-left:-5px;">
         				
              		</div>
           			<div class="list-group-item">
      					<div class="topmenu">
						<%-- 	<a href="<%=request.getContextPath()%>/autoping/addAutoPingEvent.htm" id="SPAddNewAutoPingLink"><input data-params="{}" onClick="" type="button" class="dbtn createNewBtn" value="Add New Event" title="Add New Event" alt="Add New Event"></a>
						
						< --%></div>
						<div class="table-responsive" id="display_table_lead" style="border:none;">
							<form id="addEvent" method="post">
							<div class="row">
								<!-- Auto Ping name -->	
									 <!--Source -->	 	 
									 <input type="text" id="eventId" name="eventId" value="0"/>	 
								  <div class="col-md-12">
								  <div class="col-md-2 searchpadding padding_top">Source <span class="red">*</span></div>
					          		<div class="col-md-6 searchpadding padding_top">
					           			<select name="source" id="source"  class="form-control" validate="select" emsg="source"">
					            			 
					            		</select>
					          		</div>
					          	 </div>	
								
								  <div class="col-md-12">
								  	<div class="col-md-2 searchpadding padding_top">Event Name <span class="red">*</span></div>
					          		<div class="col-md-6 searchpadding padding_top">
					           			<input type="text" class="form-control" title="Event" id="event" name="event" >
					          		</div>
								  </div>
					
						          <!--Purpose of this AutoPing  -->	 
					          	  <div class="col-md-12">
								  	<div class="col-md-2 searchpadding padding_top">Event Description<span class="red">*</span></div>
					          		<div class="col-md-6 searchpadding padding_top">
					           			<input type="text" class="form-control" title="EventDescription" id="eventDescription" name="eventDescription" >
					          		</div>
								  </div>
								
								
						          		
						         
						          	 
						          	 <div class="col-md-12">
									  <div class="col-md-4 searchpadding padding_top"></div>
						          	  <div class="col-md-6 searchpadding padding_top">
						           			<input class="btn dbtn" type="button" value="Save & New" id="saveEvent"  /> 
						     				<input class="btn dbtn" type="button" value="Save & Close" id="saveEventClose" />
						     				<a href="#"><input class="btn dbtn" type="button" value="Cancel" id="cancel" name="Save" ></a> 
						          		</div>
						          	 </div>	
									</div>
									
									</form>
								</div>
							
								<!-- End row -->
								
								
     							</div> 
    						</div> 
    				</div>
				</div>
			</div>
	
</section>
      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
<script type="text/javascript">

$('#cancel').click(function() {
	window.location=$('#contextPath').val()+"/autoping/getAutoPingEvent.htm";
});

  $('#saveEvent').click(function() {
	  if(validation() == true){
		  $.ajax({
	             type: "POST",
	             url :$('#contextPath').val()+"/autoping/saveEvent.htm",
	             data: $('#addEvent').serialize(),
	             success: function(result) {
	            	 showAlertMessage("Success", "<br/>Event save successfully", "confirmation");
	            	 document.getElementById("addEvent").reset();
	             }
	           });
		  }
   });

  $('#saveEventClose').click(function() {
	  if(validation() == true){
		  $.ajax({
	             type: "POST",
	             url :$('#contextPath').val()+"/autoping/saveEvent.htm",
	             data: $('#addEvent').serialize(),
	             success: function(result) {
	            	 
	            	 showAlertMessage("Success", "<br/>Event save successfully", "confirmation");
	            	 document.getElementById("addEvent").reset();
	            	// var url = $('#contextPath').val()+"/autoping/saveEvent.htm",
	            	 window.location=$('#contextPath').val()+"/autoping/getAutoPingEvent.htm";
	            	 
	            	 
	             }
	           });
		  }
   });

  
  
function validation() {
	  
if($('#source').val()==''){
     	 showAlertMessage1("Message", "<br/>Please enter source.",
				"information");
     	 return false;
}		
if($('#event').val()==''){
        	 showAlertMessage1("Message", "<br/>Please enter event.",
			"information");
        	 return false;
}
if($('#eventDescription').val()==''){
         	 showAlertMessage1("Message", "<br/>Please enter event description.",
				"information");
         	 return false;
}
return true;
}
			


  
</script>
<script type="text/javascript">
$(document).ready(function() {
		
		
	getPicklistValues(); //get all CFG_CodeValue List 
	getAutoPingEditList();	
	
	
	function getAutoPingEditList(){
		var eventId=$("#eventId").val();
		//alert("EVNTT__"+eventId);
		 $.ajax({
				
				type : "POST", 
				//data:$('#addactivity').serialize(),
				url :$('#contextPath').val()+"/autoping/getAutoPingEditList.htm?eventId="+eventId,
				dataType: 'json',
				contentType : 'application/json',
				success : function(result) {
					
					$(result).each(function(i,obj) {
						var sourceId=obj.sourceId;
						var source=obj.source;
						var event=obj.event;
						var eventDescription=obj.eventDescription;
						
						$('#source').val(sourceId);
						$('#event').val(event);
						$('#eventDescription').val(eventDescription);
						
						$('#source').append('<option value="'+sourceId+'">'+source+'</option>');
						
					});
				}
		 });
	}
	//start here getPicklist Values
	
	function getPicklistValues(){
		$.ajax({
			type : "GET",
			url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=201',
			success : function(result) {
			//	$('#source').append('<option value="" >---select---</option>');
				$(result).each(function(i,obj) {
					var codeTypeId=obj.codeTypeId;
					var codeValue=obj.codeValue;
					var codeValueId=obj.codeValueId;
							
							$('#source').append('<option value="'+codeValueId+'">'+codeValue+'</option>');
						
				});
			}
		});	
	}
	//end getPicklist values
	
	//start getAutoPing Event Value
	
});
</script>

<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
</body>
</html>