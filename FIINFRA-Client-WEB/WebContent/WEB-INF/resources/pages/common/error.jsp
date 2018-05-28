<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>   
<html>
	<head>
		<title>Page not found</title>
		
		
	<style type="text/css">
.pagecontainer { display:none; }
 
.bottomstrip {
background-color: #7d7d7d;
height: 100%;
width: 100%;
margin: 0px 0 0 0;
color: #FFFFFF;
}

.container {
width: 1170px;
}

.copyright {
float: right;
font-size: 12px;
margin: 10px 0;
}

table.empty{
    width:350px;
    box-shadow: 10px 10px 40px #888888;
	border-radius: 25px;
}
td.empty{
    padding:5px;
    border-style:solid;
    border-width:1px;
    border-color:#999999;
}
th.empty{
	background-color: #999999;
	height:20px;
}
.RightResult { 
	/*padding:5px;
    border-style:solid;
    border-width:1px;
    border-color:#999999; */
	background-image:url(RightTick-32.png); 
	background-repeat: no-repeat; 
	width:32px; 
}
.WrongResult { 
	/*padding:5px;
    border-style:solid;
    border-width:1px;
    border-color:#999999;*/
	background-image:url(WrongTick-32.png); 
	background-repeat: no-repeat; 
	width:32px; 
}
</style>
	</head>
	
	<body>
	
		<!--  <div class="hero-unit center">
          <h1>Page Not Found <small><font face="Tahoma" color="red">Error 404</font></small></h1>
          <br />
          <p>The page you requested could not be found, either contact your support team or try again. Use your browsers <b>Back</b> button to navigate to the page you have prevously come from</p>
          
          <a href="../welcome/redirect.htm" class="btn btn-large btn-info"><i class="icon-home icon-white"></i> Take Me Home</a>
        </div> -->
        
        
        <div style="height:20px"></div>
			<table align="center" class="empty" style="width:80%; height:500px; font-family:arial; font-size:12px; padding:15px 100px 0px 100px;">
			   <tr>
			    <td align="right" ><img alt="" src="${pageContext.request.contextPath}/resources/images/finfra_logo.png" /></td>
			  </tr>
			  <tr>
			    <td align="center"><img alt="" src="${pageContext.request.contextPath}/resources/images/error-404.jpg" /></td>
			  </tr>
			  <tr>
			    <td align="center" style="font-size: 20px; color: green; font-weight: bold; padding-bottom: 15px;">
			    	The page you requested could not be found, Please contact your support team or try again.
			    	<br/><br/>
			    	<a href="${pageContext.request.contextPath}/profile/dashboard">Click Here</a> to go to Home page.
			    </td>
			    <td>
			    	
			    </td>
			  </tr>
			  <tr>
			    <td></td>
			  </tr>
			</table>


<div class="bottomstrip" style="margin-top: 50px !important">
  <div class="container">
    <div id="powerby"><a target="_blank"><img src="${pageContext.request.contextPath}/resources/images/finfra_logo.png"> </a>
      <div class="copyright">©2014 Ffreedom Intermediary Infrastructure Pvt. Ltd. All Rights Reserved. </div>
    </div>
  </div>
</div>
	
	</body>
</html>