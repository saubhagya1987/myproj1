<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Login</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="resources/css/jquery-ui.css"/>
<link href="resources/css/custom.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="resources/css/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="resources/css/responsive.css" />
<script src="resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="resources/js/plugin/jquery-ui.js"></script>
<script src="resources/js/plugin/jquery.bxslider.js"></script>
<script src="resources/js/plugin/jquery.validate.js"></script>
<script src="resources/js/plugin/additional-methods.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>

<!-- <script src="resources/js/jquery_ui_popups.js"></script> -->
<!-- Page loader -->

<script>


$(window).load(function(){
  $('#page_loader').fadeOut("5000");
  
  var loginerror = '${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}';
	if(loginerror != null && loginerror != ""){
		var hitCnt = $("#hitCount").val();

		if(hitCnt == '0') {
			$("#successDialog").html(loginerror);
			$( "#successDialog").dialog( "open" );
		}
		$("#hitCount").val("1");
	}
});

</script>

<!-- Page loader Ends -->

<!--For Custom checkbox starts-->

<script>
$(document).ready(function() {
    $('.wrapper').attr('id', 'login');
	 $('#news_dialog .news_li .new_desc').perfectScrollbar();
    $("#custom_check").click(function() {
         check_toggle();
	});     

    $("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});
	
    var error = '${error}';
	if(error != null && error != ""){
		$("#successDialog").html(error);
		$( "#successDialog").dialog( "open" );
	}
	
	
	
	
    function check_toggle() {
	    if ($("#remember").is(":checked")) {
	       $("#remember").prop("checked", false);
	    } else {
	       $("#remember").prop("checked", true);
	    }
	}            

    $("#custom_check").click(function(){
    	$("#custom_check").toggleClass("no_remember");
  	});
    
	$('#news_dialog .news_li:odd .new_desc').css("border-right","none");

	$( "#video_first_dialog .bxslider" ).addClass("clearfix");
   
	$("#login #media .video").click(function(){
		 $(".overlay").fadeIn();
		 $("#video_first_dialog").animate("slow").css("visibility","visible");
		$("#video_first_dialog iframe").animate("slow").css("display","block");
	 
		$("#video_first_dialog .close").click(function(){
     		$(".overlay").fadeOut("slow");
			$ ("#video_first_dialog iframe").animate("slow").css("display","none");
			$("#video_first_dialog").animate("slow").css("visibility","hidden");
  		});
   });

	$("#login #media .news").click(function(){
		$('#news_dialog .news_li .new_desc').perfectScrollbar("update");
	    $(".overlay").fadeIn();
		$("#news_dialog").css("visibility","visible");
		$("#news_dialog").fadeIn();	
	});
	
	$("#news_dialog .close").click(function(){
    	$(".overlay").fadeOut("slow");
		$("#news_dialog").animate("fast").css("visibility","hidden");
		//$("#news_dialog").fadeOut("slow");
	 });

	$('.bxslider').bxSlider();  
  
	$("#video_first_dialog .video_parent").click(function(){
		var x=$(this).find('iframe').attr("src");
		var y=x.replace("&controls=0&showinfo=0&modestbranding=1","");
		$("#video_dialog iframe").attr("src",y);
		$("#video_dialog").show();
	});
	
	$("#video_dialog .close").click(function(){
     	$("#video_dialog").hide();
	  	$("#video_dialog iframe").attr("src","");
	});
	
	$('#video_first_dialog').find('iframe').each(function(){
		var url = $(this).attr("src");
      	$(this).attr("src",url+"?wmode=transparent&controls=0&showinfo=0&modestbranding=1");
		$(this).attr("wmode","Opaque");
		});   
		
		
		$('#login_form').validate({ // initialize the plugin
        onfocusout: function (element) {
        $(element).valid(); },
		});
		
	 $('.required').each(function() {
        $(this).rules('add', {
        required:true,
     });
	 });
	 $('.email').each(function() {
        $(this).rules('add', {
       email: true,
     });
	 });
	 
	 


	  
});
</script>

<!--Video slider ends-->
<!--[if gte IE 9]>
  <style type="text/css">
#login #login_form .login_btn,#login #login_form .login_btn:active{filter: none;}
  </style>
<![endif]-->
</head>
<body>

<div class="wrapper">
  <section class="main">
    <section class="in_content fr"> 
      <!--Logo Strats-->
      <header class="logo fr"><!--<img src="resources/images/subh_logo.png" height="44" width="250" alt="Shubchintak"/>--></header>
      <div class="clr"></div>
      <!--Logo Ends-->      
      <div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
      <!--Login Form Strats-->
      <form id="login_form" class="fr" method="post" action="<core:url value="/j_spring_security_check"/>">
        <ul class="reset">
        <input type = hidden id="hitCount" value="0">
         <p>
           <%-- <core:if test="${not empty param.error}">
				<font color="red">
					Login error. <br />
					Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				</font>
			</core:if> --%>
       	</p> 
          <li class="user_li">
            <label class="label">USERNAME</label>
            <input type="text" class="fr j_username required" name="j_username"  autofocus tabindex="1" maxlength="100" />
            <div class="clr"></div>
          </li>
          <li class="pass_li">
            <label class="label">PASSWORD</label>
            <input type="password" name="j_password" tabindex="2" maxlength="100" class="nowhitespace required"/>
            <div class="clr"></div>
          </li>
          <li class="clearfix login_li">
            <div class="fl">
              <input type="checkbox" class="remember" id="remember"  name="_spring_security_remember_me" checked/>
              <span id="custom_check" class="custom_check no_remember"></span> <span class="remember_txt">Remember me</span> </div>
            <div class="fr">
              <input type="submit" value="LOGIN" class="login_btn"  tabindex="3"/>
            </div>
          </li>
          <li class="clearfix"><a href="password/forgotpassword" class="forgot fr">Forgot your password?</a></li>
        </ul>
      </form>
      <div class="clr"></div>
      <!--Login Form Ends--> 
      
       <!--Media video and News Starts-->
      <section id="media" class="clearfix"> <a class="fr news box" href="#"><img class="box_shadow" src="resources/images/box_shadow.png" height="10" width="150"/> <span class="category">News</span> <img class="thumb" src="resources/images/news.png" height="56" width="59" alt="News"/>
        <p class="description">Read latest news &amp; current affairs </p>
        </a> <a class="fr video box" href="#"><img class="box_shadow" src="resources/images/box_shadow.png" height="10" width="150"/> <span class="category">Videos</span> <img class="thumb" src="resources/images/video-icon.png" height="50" width="50" alt="videos"/>
        <p class="description">Watch latest videos  &amp; events</p>
        </a> </section>
      <!--Media video and News Ends--> 
    </section>
    <div class="clr"></div>
  </section>
  <!--Footer video and News starts-->
  <footer class="footer clearfix"><a href="#" class="fl ft_logo"><img src="resources/images/foot_logo.png" height="18" width="74" alt="finnfra"/></a>
    <ul class="reset fr ft_text clearfix">
      <li class="fl">Copyright &copy; 2014</li>
      <li class="fl"><a href="#">Privacy Policy</a></li>
    </ul>
  </footer>
  <!--Footer video and News ends--> 
</div>
<div id="page_loader"></div>
<!--News pop-up--> 
<!--Aditya Forget Password Pop Up ends here--> 
<!--Custom Video Modal first-->
<div id="video_dialog" class="common_custom_modal"> <span class="close">X</span>
  <div class="modal_content">
    <iframe width="662" height="431" src="" frameborder="0" allowfullscreen></iframe>
  </div>
</div>
<!--Custom Video Modal first Ends--> 
<!--Custom Video Modal second-->
<div id="video_first_dialog" class="common_custom_modal">
  <h3 class="modal_heading">Videos<span class="close">X</span></h3>
  <div class="modal_content">
    <ul class="bxslider">
   <li> <div class="thumb_slide clearfix">
      <a href="#" class="video_parent">
        <div class="video">
		<iframe width="197" height="98" src="//www.youtube.com/embed/eogk7bYdfG4" frameborder="0" allowfullscreen></iframe></div>
        <div class="desc">Building wealth - Have you hit your peak saving phase? Investor Education Video by Moneykraft</div>
      </a>
    
      <a href="#" class="video_parent">
        <div class="video"><iframe width="197" height="98" src="//www.youtube.com/embed/hiPKU6k0u0Q" frameborder="0" allowfullscreen></iframe></div>
        <div class="desc">Mutual Fund Constituents: Investor Education Video by Moneykraft</div>
      </a>
     
      <a href="#" class="video_parent">
        <div class="video"><iframe width="197" height="98" src="//www.youtube.com/embed/J9nT9t7tXx8" frameborder="0" allowfullscreen></iframe></div>
        <div class="desc">What is an Equity Fund? : Investor Education Video by Moneykraft</div>
      </a>
      <div class="btm">
        <div class="inner"> </div>
      </div>
    </div></li>
   
    </ul>
  </div>
</div>
<!--Custom Video Modal second Ends--> 
<!--Custom News Modal-->
<div id="news_dialog" class="common_custom_modal">
  <h3 class="modal_heading">News<span class="close">X</span></h3>
  <div class="modal_content"> 
    <!-- <div class="news_slider clearfix">-->
    <ul class="bxslider">
    <c:set var="counter" value="1"/>
    
    <x:parse xml="${newsData}" var="output" />
     <x:forEach select="$output/channel/item" var="item" varStatus="count">
     <c:if test="${counter == 1}">
	     <li>
	     <div class="multiple">
	     <ul class="clearfix reset">
     </c:if>
     <c:if test="${counter<=8}">
          	 <li class="news_li clearfix ">
	         <span class="new_desc">
	         <a target="_blank" href="<x:out select="$item/link"/>"><h2><x:out select="$item/title" escapeXml="false"/></h2></a>           				
	         <x:out select="$item/description" escapeXml="false"/>
	         </span>
	         </li>
	  </c:if>
	  <c:if test="${counter>=8}">
	   <c:set var="counter" value="0"/>
	  </c:if>  
	   <c:if test="${counter==0}">     
	      </ul>
       	  </div>
          </li>
       </c:if>  
       <c:set var="counter" value="${counter + 1}"/>
     </x:forEach>
     </ul>
</div>
</div>
</div>
<!--Custom News Modal Ends--> 
<!--Custom Forgot Passowrd Modal-->

<!--Custom Forgot Passowrd Modal Ends-->

<div class="overlay"></div>
<!--<script src="js/slick.js"></script>-->
</body>
</html>