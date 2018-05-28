<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Scheduled New AutoPing</title>
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
   <%--   <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
 --%>
<!-- cron start js -->    

       

<!-- -responsive css-->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/zebra_dialog.css" type="text/css">
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" /> --%>
<!-- -responsive css-->
<%-- <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script> --%>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<%-- <script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script> --%>

<%-- <link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-cron.js"></script>
	<link type="text/css" href="<%=request.getContextPath()%>/css/jquery-cron.css" rel="stylesheet" /> --%>
<script type="text/javascript">
(function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":9999999,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(99999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);});
</script>
<style type="text/css">
  .box1{
       display: none;
    }
    
</style>

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->


<script type="text/javascript">
    $(document).ready(function(){
	    $('input[type="radio"]').click(function(){
	             if($(this).attr("value")=="eventBased"){
	                 $(".box1").hide();
	                 $(".event").show();
	             }
	             if($(this).attr("value")=="recuring"){
	                 $(".box1").hide();
	                 $(".recuring").show();
	             }
	             if($(this).attr("value")=="ex"){
	                 $(".box1").hide();
	                 $(".ex1").show();
	             }
	         });
    });
</script>
</head>
<body>
<!--css popup window start 1-->

<jsp:include page="../common/header.jsp" />


<div class="page-header">
		<h1 class="pull-left">Scheduled AutoPing</h1>
           <form class="form-search pull-right">
				<span class="input-icon">
				<input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
				<i class="ace-icon fa fa-search nav-search-icon"></i></span>
					</form>
           <div class="clearfix"></div>
	</div>


 <!-- Center part start -->
 <section>
     <form id="autopingScheduled">
    <!--  <div class="list-group"> -->
    <div class="container white">
    	<%-- <div class="container-head">
			  <div class="col-md-12" style="text-align: left;"> Scheduled AutoPing
     			<input type="hidden" name="pingId" value="${pingId}"/>
            </div >
          </div > --%>
  	  <div class="container-body">
        <!--center -->
        <div class="col-md-12" style="margin-top:20px;" >
        <div class="panel panel-default">
        
        <div class="list-group">
        			<a class="list-group-item active" href="#">AutoPing Details </a>
           				<div class="list-group-item">
           				<div class="topmenu pull-right margin_5px">
       				   </div>
                    <div class="clearfix"></div>
        
  <!-- <div class="panel-heading">AutoPing Details</div> -->
  <div class="panel-body">
	  	<div class="col-md-2 searchpadding padding_top"><strong>AutoPing Name:</strong></div>
	    <div class="col-md-2 searchpadding padding_top">${pingName}</div>
	    
	     <div class="col-md-1 searchpadding padding_top"><strong>Source:</strong></div>
	    <div class="col-md-2 1searchpadding padding_top" >${source}</div>
	    
	    <div class="col-md-1 searchpadding padding_top"><strong>Event:</strong></div>
	    <div class="col-md-4 searchpadding padding_top" >${event}
			
			
	    
	    </div>
	    
	    
	     <div class="col-md-2 searchpadding padding_top"><!-- <strong>Target:</strong><span class="red">*</span> --></div>
	    <!-- <div class="col-md-4 searchpadding padding_top"> 
	    		<select name="Minute" class="form-control">
                        <option>--Select--</option>
                        <option>Client</option>
                        <option>Partner</option>
                 </select>
	    </div> -->
	      <div class="col-md-2 searchpadding padding_top"></div>
	    <div class="col-md-4 searchpadding padding_top"> </div>
	   
  </div>
        </div>
  </div>
  </div>
  </div>
     <div class="col-md-12 paddinglr">
          <div class="panel panel-default">
         <!--  <div class="panel-heading" style="text-align:left;" >
          <span class="badge"></span>Scheduled</div> -->
          
           <div class="list-group">
        			<a class="list-group-item active" href="#">Scheduled </a>
           				<div class="list-group-item">
           				<div class="topmenu pull-right margin_5px">
       				   </div>
                    <div class="clearfix"></div>
          
          <div class="panel-body">   
          Select Schedule Options <span class="red">*</span><br>
          			 <label><input type="radio" id="selectEvent" name="selectEvent" value="eventBased"> Event Based</label><br>
        			 <label><input type="radio" id="selectEvent" name="selectEvent" value="recuring"> Recuring</label>
        			<br>
                     
              		 <div class="event box1">
              		 	
              		 		<!-- <div class="row">
								  <div class="col-md-4"></div>
								   <div class="col-md-1">Event Date:</div>
								   <div class="col-md-3"><input type="text" class="form-control" id="datepicker"  name="eventDate" placeholder ="DD/MM/YYYY" ></div>
								  <div class="col-md-4"></div>
								  
							</div>
							
							<br> -->
							
							<div class="row">
								  <div class="col-md-2"><input type="number" class="form-control" value="0"  maxlength="2" id="frequencyValue" name="frequencyValue" min="1" max="15"></div>
								  <div class="col-md-2">Days <span class="red">*</span></div> 
								   <div class="col-md-2">
								    <select name="selectType" id="selectType" class="form-control" >
					                        <option value="">--Select--</option>
					                        <option value="1">Before</option>
					                        <option value="2">After</option>
                    					</select>
								  </div> 
								   <div class="col-md-2"> Event <span class="red">*</span></div>
								  <div class="col-md-4"></div>
								  
							</div>
							
						
							
							<!-- <div class="row">
								  <div class="col-md-4"></div>
								   <div class="col-md-1"></div>
								   <div class="col-md-3"><input class="btn dbtn" type="button" value="Press here to See Result" onclick="getdate()" id="resultDate"  /> </div>
								  <div class="col-md-4"></div>
								 
							</div>
								<br>
							<div class="row">
								  <div class="col-md-4"></div>
								   <div class="col-md-1">schedule Date:</div>
								   <div class="col-md-3"><input type="text" class="form-control" val="" id="eventDate" name="scheduleDttm" placeholder ="MM/DD/YYYY" readonly ></div>
								  <div class="col-md-4"></div>
								 
							</div> -->
          			 </div>     
               			
                <div class="recuring box1">
                		<div class="row">
								  <div class="col-md-4"></div>
								   <div class="col-md-1">Period:<span class="red">*</span></div>
								   <div class="col-md-3">
								   <select name="frequencyId" id="frequencyId"  onchange="frqDate(this.value)" class="form-control" validate="select" emsg="Delivery Channel"">		 
					    		   </select>
					    		   </div>
								  <div class="col-md-4"></div>
								  
						</div>
						<br>
                		<div class="row">
								  <div class="col-md-4"></div>
								   <div class="col-md-1"></div>
								   <div class="col-md-3"> <input type="text" class="form-control" title="description" id="recuringDate"  readonly ></div>
								  <div class="col-md-4"></div>
								  
						</div>
                 </div>
                  </div>
               </div>
           </div>
           </div>
     </div>
	 <div class="clearfix"></div>
     <div class="form-group">
	
						<label class="control-label col-xs-12 col-sm-5 no-padding-right" for="platform"></label>
     	                   <div class="col-xs-12 col-sm-3">
							<!-- <div class="clearfix"> -->
							
								<button id="SPAddNewServiceTeamLink" class="btn btn-sm btn-primary"  value="Save" onclick="saveAutoPing();" >Save</button>
								<a href="<%=request.getContextPath()%>/autoping/getAutoPings.htm" value="Close" class="btn btn-sm btn-danger" >Close</a>
							<!-- </div> -->
						</div>
     </div>
     
    <%--  <div class="topmenuleft" style="margin-left:25px;">
  <input data-params="{}" type="button" class="dbtn importNewBtn" value="Save" onclick="saveAutoPing();" title="Import Opportunities" alt="Import Opportunities">
 <a href="<%=request.getContextPath()%>/autoping/getAutoPings.htm"><input class="btn dbtn" type="button" value="Cancel" name="Save" ></a>
</div> --%>
     
     </div>
     </div>
     </form>

    
            	
</section>           	
<!-- Center part End -->          
<jsp:include page="../common/footer.jsp" />
<%-- <footer>
	<div class="row">
    <div class="bottomstrip">
                	<div class="container">
                     <div id="powerby"><img src="<%=request.getContextPath()%>/images/finfra_logo.png" ></div>
                   	 <div class="copyright">©2013 Freedom Wealth Solutions Pvt. Ltd. All Rights Reserved.  | <a href="#"  onClick=>Terms Of Use </a>|  <a href="#">Privacy Policy</a></div>
                </div>
              
   	  </div></div>
		  <!-- END login-form -->
	
</footer>
 --%>
</body>
<script type="text/javascript">
function recuring(){
	
	if($('#frequencyId').val()==''){
	     alert('Please select period');
			return false;
	}
	return true;	
}
function eventbasedVal(){
	if($('#frequencyValue').val()==''){
	     alert('Please enter days');
			return false;
	}
	if($('#selectType').val()==''){
	     alert('Please select before/after event');
			return false;
	}
	return true;	
}

function validation() {
	if($('input[name="selectEvent"]:checked').length==0) {
	     alert('Please select one option of event  ');
		return false
	}
	return true;
}

function saveAutoPing() {
	if(validation()== true)
		{
		var selectEventId=$("input[name=selectEvent]:checked").val();
    	if(selectEventId == "eventBased" && eventbasedVal() ==true){
			$("#frequencyId").val(63008);
			
		}else
		if(selectEventId == "recuring" && recuring() ==true)
		{
			$("#frequencyValue").val(0);
			$("#selectType").val(0);
			
		}
		$.ajax({
	           type: "POST",
	           url :$('#contextPath').val()+"/autoping/saveAutoPingScheduled.htm",
	           data: $('#autopingScheduled').serialize(),
	           success: function(result) {
	         	  	 showAlertMessage("Success", "<br/>AutoPing Scheduled successfully", "confirmation");
	   	           	 document.getElementById("autopingScheduled").reset();
	   	             window.location=$('#contextPath').val()+"/autoping/getAutoPingScheduled.htm";
					}
	         
	         });
		}
	}
</script>
<script type="text/javascript">
$(document).ready(function() {
	getPicklistValues(); //get all CFG_CodeValue List 
		
	//start here getPicklist Values
	function getPicklistValues(){
		$.ajax({
			type : "GET",
			url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=63',
			success : function(result) {
				$('#frequencyId').append('<option value="" >---select---</option>');
				$(result).each(function(i,obj) {
					var codeTypeId=obj.codeTypeId;
					var codeValue=obj.codeValue;
					var codeValueId=obj.codeValueId;
					if(codeValueId != 63005 && codeValueId != 63007 && codeValueId != 63008 && codeValueId != 63009)	
					$('#frequencyId').append('<option value="'+codeValueId+'">'+codeValue+'</option>');	
					
				});
			}
		});	
	}
	//end getPicklist values
	
	//start getAutoPing Event Value
	
});
</script>
<script type="text/javascript">
function frqDate(value){
	var codeValueId=value;
	//alert(codeValueId);
	if(codeValueId == 63001)
	{
		$('#recuringDate').val('At 10 Am');
	}else
		
	if(codeValueId == 63002)
	{
		$('#recuringDate').val('On Sunday At 10 Am');
	}else
	if(codeValueId == 63003)
	{
		$('#recuringDate').val('1st Day Of Month At 10 Am');
	}else
	if(codeValueId == 63004)
	{
		$('#recuringDate').val('1st Day of Quater At 10 Am');
	}
	else
	if(codeValueId == 63005)
	{
		$('#recuringDate').val('1st Day of Half Year At 10 Am');
	}else
	if(codeValueId == 63006)
	{
		$('#recuringDate').val('1st Day of year At 10 Am');
	}
}
</script>
 <script src="CronGen.min.js"></script>
 <script src="bootstrap/js/bootstrap.min.js"></script>
 
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
	  
	 
     $("#frequencyValue").keypress(function (e) {
	     //if the letter is not digit then display error and don't type anything
	    
	               return false;
	   
	   });

  });
  </script>

</html>