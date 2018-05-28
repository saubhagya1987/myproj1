<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Login</title>
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
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
    


<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<!-- -responsive css-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<link href="https://myffreedom.in/FFreedom_Portal/images/favicon.ico" rel="shortcut icon">




<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

<style>
.reset li{
margin-bottom: 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
$.ajax({			   				
  		type: "GET",
  		url: $('#contextPath').val()+'/FIINFRA-WEB/common/logout.htm',
		 dataType: 'json',
		 contentType: 'application/json',
		 success:function(result)
	   	{ 
			
														
	    }
	   	
	   	});
});
</script>


</head>
<body>

 <div class="row">
      <div class="headstrip"></div>
      <div class="container">
      	<div class="starter"> 
        	<h2>Sign in to your account</h2>
        </div>
        <div align="col-xs-6 col-md-4" >
         <div class="login-form">
         		<h3>Sign In</h3>
    	<form id="login_form" class="fr" method="post"  action="<core:url value="/j_spring_security_check"/>">
        <ul class="reset" style="list-style-type: none;padding-left: 2px;">
         <p>
           <core:if test="${not empty param.error}">
				<font color="red">
					Login error. <br />
					Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				</font>
			</core:if>
       	</p> 
          <li class="user_li">
            USERNAME<br/>
            <input type="text" class="fr" name="j_username"  autofocus required/>
            <div class="clr"></div>
          </li>
          <li class="pass_li">
            PASSWORD<br/>
            <input type="password" name="j_password" required/>
            <div class="clr"></div>
          </li>
          <li class="clearfix login_li">
<!--             <div class="fl"> -->
<!--               <input type="checkbox" class="remember" id="remember"  name="_spring_security_remember_me" checked/> -->
<!--               <span id="custom_check" class="custom_check"></span> <span class="remember_txt">Remember me</span> </div> -->
            <div class="fr">
<!--             <br/> -->
              <input type="submit" value="LOGIN" class="login_btn"/>
               
            </div>
           
          </li>
          <li class="clearfix"><a href="<%=request.getContextPath()%>/forgotPassword.htm??page=Fiinfra" class="forgot fr"> <br/>Forgot your password?</a></li>
        </ul>
      </form>
         </div>
      </div>
</div>
</div>
	  <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li class="" data-target="#myCarousel" data-slide-to="1"></li>
        <li class="active" data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item">
        <img src="<%=request.getContextPath()%>/images/banner1.jpg"  >
         <!-- <img src="" data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">-->
          <div class="container">
          <!--  <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code>
 URL, the "next" and "previous" Glyphicon buttons on the left and right 
might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>-->
          </div>
        </div>
        <div class="item">
        <img src="<%=request.getContextPath()%>/images/banner2.jpg" >
         <!-- <img src="" data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide">-->
          <div class="container">
           <!-- <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget 
quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor 
id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>-->
          </div>
        </div>
        <div class="item active">
        <img src="<%=request.getContextPath()%>/images/banner3.jpg" >
         <!-- <img src="" data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">--.
          <div class="container">
          <!--  <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget 
quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor 
id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>-->
          </div>
        </div>
      </div>
     <!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>-->
    </div><!-- /.carousel -->

	
            

       
       
            

	<div class="row">
    <div class="container">
    	<div class="col-xs-12 col-md-8 ">
		<div class="leftside margintop">
                	<h2>Videos</h2>
                    <ul>
                    	<li><iframe width="242" height="137" src="https://youtube.com/embed/kk_eU_Sirvc"></iframe></li>
                        <li> <iframe width="242" height="137" src="https://youtube.com/embed/ZEYxRG9Ai90"> </iframe></li>
						<li><iframe width="242" height="137" src="https://youtube.com/embed/GVHq-HlCOxI"></iframe></li>
                    </ul>
                    	
                     
                    	
                   
                 
      </div>        
        </div>
	  	<div class="col-md-4 col-sm-12">
        
        <div class="rightside margintop">
                	<h2>News</h2>
                    <div id="list">
               
                    <ul>
                    	<li><a href="#">Banks to get ranked in terms of customer service</a></li>
						<li><a href="#">Iran asks India to open banking channel</a></li>
						<li><a href="#">Rupee gains 31 paise to one-month high</a></li>
						<li><a href="#">India refuses to budge on subsidies at WTO talks</a></li>
                    </ul>
              
                    	<a href=""> More... </a>    <br>
                        By <img src="<%=request.getContextPath()%>/images/moneycontrol_logo.png">             
                     </div>    
                     </div>
                </div>
            </div>
        </div>
	</div>
            	
            	
      <aside>
                <div id="skew"></div><!-- #skew -->
                <h3 id="refer">Refer Your Friends</h3>
</aside>     

<footer>
	<div class="row">
    <div class="bottomstrip">
                	<div class="container">
                     <div id="powerby"><img src="<%=request.getContextPath()%>/images/finfra_logo.png" > </div>
                   	 <div class="copyright">©2013 Freedom Wealth Solutions Pvt. Ltd. All Rights Reserved.  | <a href="#">Terms Of Use </a>|  <a href="#">Privacy Policy</a></div>
                </div>
              
          	 </div></div>
		  <!-- END login-form -->
		</div>
</div>
</footer>

</body>
</html>