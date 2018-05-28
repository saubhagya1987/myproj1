<%-- <%@taglib uri="/struts-tags" prefix="s"%> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
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
   

<!-- -responsive css-->
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/spa_style.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.ui.core.js"></script>
	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/forgotpassword/forgotpassword.js?${today}"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js?${today}"></script>
	
<!-- -responsive 

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
	<div style="background-color: #; "> 
<script>   

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
	
	 var screenWidth=screen.width;
	 var screenHeight=screen.height;
	
// 	if((screenWidth < 1280 || screenHeight < 650)) 
//  	{	 
//  		document.write(" Your current screen resolution is "+screen.width +"*"+screen.height +". This website may not work properly with the current resolution. Please change resolution to 1280 X 800 or above.");
 		
//  	}
	function validatelogin() {
		// document.getElementById("loginButton").focus();
		var userName = $('#userName').val();
		var password = $('#password').val();
		var isvalidForm = true;
		if (userName == "") {
			$('#user_name_message_Login').show();
			// document.forgotpassword_form.submit();
			isvalidForm = false;
		} else {
			$('#user_name_message_Login').hide();
		}
		if (password == "") {

			// $('#user_name_message_Login').hide();
			$('#password_message_Login').show();
			isvalidForm = false;
		} else {
			$('#password_message_Login').hide();
		}

		if (isvalidForm == true) {
			document.loginForm.action = "https://fi-i.com/Fiinfra/login";
			document.loginForm.submit();
		}
	}
	$("#password").keyup(function(event) {
		if (event.keyCode == 13) {
			$("#loginButton").click();
		}
	});
	function searchKeyPress(e) {
		// look for window.event in case event isn't passed in
		if (typeof e == 'undefined' && window.event) {
			e = window.event;
		}
		if (e.keyCode == 13) {
			document.getElementById('loginButton').click();
		}
	}

	function windowpop(url, width, height) {
	    var leftPosition, topPosition;
	    //Allow for borders.
	    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
	    //Allow for title and status bars.
	    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
	    //Open the window.
	    window.open(url, "Window", "status=no,height=" + height + ",width=" + width + ",resizable=yes,left=" + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY=" + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
	}
	function windowpop(url, width, height) {
	    var leftPosition, topPosition;
	    //Allow for borders.
	    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
	    //Allow for title and status bars.
	    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
	    //Open the window.
	    window.open(url, "Window", "status=no,height=" + height + ",width=" + width + ",resizable=yes,left=" + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY=" + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
	}

 </script>	  
</div>    




<%
String error="";
try{
	 error =request.getParameter("error");
	 if(error==null){
		 error="";
	 }
}catch(Exception e){
}

%>
</head>
<body>
<input type="hidden" id="contextPath" value="<%=request.getContextPath() %>">
	 <div class="row">
      <div class="headstrip"></div>
     	<div class="container">
            <div class="starter wrapnav"> 
                <h2><img src="<%=request.getContextPath() %>/images/spa/SPA_New.jpg" style="margin-left: 10px;" height="82px" width="190px" >
				<!--<img src="<%=request.getContextPath()%>/images/Shubhchintak-Web banner.jpg" style="margin-left: 95px;" height="62" width="870">-->
				</h2>
<!--                <div style="height: 400 px; width:20px; border-color: red">ji</div> -->
            </div>
           
      </div>
      </div>  
     <div class="subcontainer_login">
        <div class="container">
         	<div class="col-md-3">
          		<div class="login-formnew">
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
            <br/>
              <input type="submit" value="LOGIN" class="login_btn"/>
               
            </div>
           
          </li>
          <li class="clearfix"><a href="<%=request.getContextPath()%>/forgotPassword.htm?page=dfda" class="forgot fr" > <br/>Forgot your password?</a></li>
          <li><br/>
               
        </ul>
<!--         <a href="https://fi-i.com/Fiinfra/Core/Jsp/ForgotPassword.jsp?page=dfda" class="forgot-pw">Forgot Password?</a> -->
			 <input type="hidden" name="SubBu" value="dfda">
			 <input type="hidden" name="buName" value="dfda">
      </form>
			
			
			
   			</div>
        </div>
    
        <!--content start -->
       
        <!--content end -->
         </div>
     <!--End -->
     
     
       
</div>
</hr>
 
   
</div>

</div>  
<footer>
	<div class="row" style="background-color:#252E5F; padding: 10px 0px;border-top: 1px solid #FFF;">
		<div class="container" >
        <div class="copyrightnew"> Copyright 2014 SPA</div>		
        </div>
    </div>
</footer>

</body>
</html>