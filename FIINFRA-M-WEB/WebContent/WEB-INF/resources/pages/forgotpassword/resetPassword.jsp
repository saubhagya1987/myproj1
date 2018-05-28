<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reset Password</title>
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" />
         <%if(theme != null){ %>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
		<%} %>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>
 --%>
<script>
$(document).ready(function(){


$('#resetPasswordId').validate();
	
var rbsLinks = "${rbsLinks}";
var pieces = rbsLinks.split(",");
if(pieces != ""){
	for(var i=0;i<pieces.length;i++){
		$("."+pieces[i]).attr("href","#");
		$("."+pieces[i]).addClass("inactiveLink");
	}
}
	
var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
// setter
$("#dialog1").dialog("option", "buttons", [{
   text: "Ok",
   /* open: function(event, ui){
	   alert("caleed");
       setTimeout("$('#dialog1').dialog('close')",2000);
    }, */
   click: function () {
	   $(this).dialog('close');
   }
  
      
}]);
$(document).on("dialogopen", "#dialog1", function(event, ui) {
	setTimeout("$('#dialog1').dialog('close')",3000);
});
});
</script>

<script type="text/javascript">
function validatePassword(){

	var result = $('#resetPasswordId').validate().form();

	if(result){	
	
	 $("#resetPasswordId").ajaxSubmit({
		
		url: "${pageContext.request.contextPath}/password/resetPassword",
		type : "GET",
		dataType : "json",
		success: function(data){
			//alert("inside success"+data);
		 },
	 	error:function(xhr, status, error){
		 	var result = xhr.responseText;
	 		$("#dialog1").html("");
	 		$("#dialog1").html(result);
	 		$( "#dialog1").dialog( "open" );
	 		if(result.indexOf('successfully') > -1)
		 		{
	 				setTimeout("window.location.replace('${pageContext.request.contextPath}/login')",4000);
		 		}
	 	 	}
		});
	 }
	}

function back(){
	//alert("document");
	if(document.referrer.indexOf('/common/') > -1)
		window.location.replace('${pageContext.request.contextPath}/common/logout');
	else
		javascript:location.href=document.referrer;
	}
</script>


</head>
<body>
<div class="wrapper reset_password" id="login">
  <section class="main">
    <section class="in_content fr"> 
      <!--Logo Strats-->
      <header class="logo fr"><!--<img src="${pageContext.request.contextPath}/resources/images/subh_logo.png" alt="Shubchintak"/>--></header>
      <div class="clr"></div>
      <!--Logo Ends--> 
     <div id="force_pass_change" class="fr">
 <form id="resetPasswordId" name="resetPassword"> 
<ul class="clearfix reset">
<li class="rel">
<label>Existing Password (from email)</label><input type="password" name="existingPassword" class="common_input required"/>
</li>
<li class="rel">
<label>New Password</label><input type="password" name="newPassword" class="common_input required"/>
</li>
<li class="rel">
<label>Re-enter Password</label><input type="password" name="reEnterPassword" class="common_input required"/>
<label style="font-size:10px;">Password should be combination of letters + special characters + numbers</label>
</li>
<li class="clearfix">
<input type="button" value="Back" class="common_btn fr westspace3" onclick="back();"  id="back_btn" />
<input type="button" class="common_btn fr savChangedPasswordLink" onclick="validatePassword();" value="Submit" id="submit_btn"/>
</li>
</ul>
</form>
</div>
      
    <div class="clr"></div>  
    
   
    </section>
    <div class="clr"></div>
  </section>
  <!--Footer video and News starts-->
  <footer class="footer clearfix"><a href="#" class="fl ft_logo"><img src="${pageContext.request.contextPath}/resources/images/foot_logo.png" height="18" width="74" alt="finnfra"/></a>
    <ul class="reset fr ft_text clearfix">
      <li class="fl">Copyright &copy; 2014</li>
      <li class="fl"><a href="#">Privacy Policy</a></li>
    </ul>
  </footer>
  <!--Footer video and News ends--> 
  <div id="dialog1" class="common_dialog"> </div>
</div>
</body>
</html>



