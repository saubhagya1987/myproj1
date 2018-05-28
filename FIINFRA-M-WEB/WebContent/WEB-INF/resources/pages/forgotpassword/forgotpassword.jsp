<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Forgot Password</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" />
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.bxslider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script> --%>
<script>
$(document).ready(function(){
 $(".wrapper").addClass("forgot_password_page");
  	 $('.wrapper').attr('id', 'login');
	$( "#accordion" ).accordion();
     // Calls the selectBoxIt method on your HTML select box	
	$("#questionId").selectBoxIt();
	//Common dialog
	 // getter
var buttons = $( "#dialog" ).dialog( "option", "buttons" );
 // setter
$("#dialog").dialog("option", "buttons", [{
    text: "Ok",
    click: function () {
        $(this).dialog("close");
    }
}]);


	$('#submitForEmailId').validate({ // initialize the plugin
        onfocusout: function (element) {
        $(element).valid();
		},
	});
		
		$('#submitForSecurityQuestion').validate({ // initialize the plugin
        ignore:'', //i.e. do not ignore hidden elements	
		onfocusout: function (element) {
		$(element).valid();
		},
	
	});
	
	/* 
   $('.required').each(function() {
        $(this).rules('add', {
        required:true,
     }); 
  });*/
   $('.email').each(function() {
        $(this).rules('add', {
       nowhitespace: true,
      });
   });
		

	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=SecurityQuestionID", '', "#questionId", "questionId", '${forgotPasswordBean.questionId}');  
});

function funCancel(){
	window.location.href = "${pageContext.request.contextPath}/login";
}

function validateEmail(){
	
       $("#submitForEmailId").ajaxSubmit({
		 beforeSubmit: function() {
            return $('#submitForEmailId').validate().form();
		 },
		url: "${pageContext.request.contextPath}/password/submitForEmailId",
		type : "GET",
		dataType : "json",
		success: function(data){
		 },error : function(xhr, status, error) {

			 var result=(xhr.responseText);
				if(result.indexOf('successfully') > -1)
		 		{
					$('#dialog').html("");	 
					$('#dialog').html(result);
				 	$( "#dialog" ).dialog( "open" );
	 				setTimeout("window.location.replace('${pageContext.request.contextPath}/login')",4000);
		 		}
			 else{
				 $('#dialog').html("");	 
				$('#dialog').html(result);
			 	$( "#dialog" ).dialog( "open" );
			 }  
		 }
		 });
}

function validateForSecurityQuestion(){
	$("#submitForSecurityQuestion").ajaxSubmit({
		 beforeSubmit: function() {
            return $('#submitForSecurityQuestion').validate().form();
		 },
		url: "${pageContext.request.contextPath}/password/submitForSecurityQuestion",
		type : "GET",
		dataType : "json",
		success: function(data){
		 },error : function(xhr, status, error) {
			var result=(xhr.responseText);
			if(result.indexOf('successfully') > -1)
	 		{
				$('#dialog').html("");	 
				$('#dialog').html(result);
			 	$( "#dialog" ).dialog( "open" );
 				setTimeout("window.location.replace('${pageContext.request.contextPath}/login')",4000);
	 		}
			else{
				 $('#dialog').html("");	 
					$('#dialog').html(result);
				 	$( "#dialog" ).dialog( "open" );
				 }    
		 }
		});
}

</script>

</head>
<div class="wrapper">
  <section class="main">
    <div id="forgot_password_dialog" class="common_custom_modal">	
		<h3 class="modal_heading">Forgot Password</h3>
		<div class="modal_content">
			<div id="accordion">
				<h3><img src="${pageContext.request.contextPath}/resources/images/email-icon.png" alt="">Reset Using Email </h3>
				<!-- form for forgot password using username -->

				<div class="forpass_bx">
					<form:form method="GET" id="submitForEmailId"  commandName="forgotPasswordBean" >					
						<div class="forpass_bx-in clearfix">
							<div class="forpass_label">User Name</div>
							<form:input path="userName" class="forpass_input_username required" autofocus="required" tabindex="1"/>
						</div>
						<div class="forpass_bx-in clearfix">
							<div class="forpass_label">Email</div>
							<form:input path="email" class="forpass_input_email required email" autofocus="required" tabindex="2"/>
						</div>
						<input type="button" value="Submit" class="submit_btn common_btn" onclick="validateEmail();"  tabindex="3"/> 
						<input type="button" value="Cancel" class="cancel_btn common_btn" onclick="return funCancel();" tabindex="4"/>
					</form:form>
				</div>
				<!-- form for forgot password using Security Question -->
				<h3><img src="${pageContext.request.contextPath}/resources/images/reset-icon.png" alt="" align="absbottom">Reset Using Security Question </h3>
				<div class="forpass_bx">
					<form:form method="GET" id="submitForSecurityQuestion" commandName="forgotPasswordBean">
						<div class="forpass_bx-in clearfix">
							<div class="forpass_label">User Name</div>
							<form:input path="userName" class="forpass_input_username required" autofocus="required" tabindex="1"/>
						</div>
						<div class="forpass_bx-in clearfix">
							<div class="forpass_label">Security Question</div>
							<select id="questionId" name="questionId" class="required">
	            				<option value="">-- Select --</option>
	     					</select>															
						</div>
						<div class="forpass_bx-in clearfix">
							<div class="forpass_label">Answer</div>
							<form:input path="answer" class="forpass_input_answer required" autofocus="required" tabindex="4"/>
						</div>
						<input type="button" value="Submit" class="submit_btn common_btn"  onclick="validateForSecurityQuestion();" tabindex="5"/> 
						<input type="button" value="Cancel" class="cancel_btn common_btn" onclick="return funCancel();" tabindex="6"/>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	</section>
 <footer class="footer clearfix"><a href="#" class="fl ft_logo"><img src="${pageContext.request.contextPath}/resources/images/foot_logo.png" height="18" width="74" alt="finnfra"/></a>
    <ul class="reset fr ft_text clearfix">
      <li class="fl">Copyright &copy; 2014</li>
      <li class="fl"><a href="#">Privacy Policy</a></li>
    </ul>
  </footer>
  <div id="dialog" class="common_dialog"> </div>
</div>
<div class="overlay"></div>
</body>
</html>
