<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">

<title>Add Contact</title>
<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
	
  	$( "#tabs" ).tabs();
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 
	  $( "#site_theme" ).one( "click", function() {});
	 
	  $('#frmCreateContact').validate({
		  ignore: []
	  });
	  
	  var partnerSetupLinks = "${contactLink}";
	  var pieces = partnerSetupLinks.split(",");
	  for(var i=0;i<pieces.length;i++){
	   $("."+pieces[i]).attr("href","#");
	   $("."+pieces[i]).removeAttr('onclick');
	   $("."+pieces[i]).addClass("inactiveLink");
	  }
});

function  formSubmit(){	
	if($("#frmCreateContact").validate().form()){
		
		$('.editContactSaveLink').addClass('inactiveLink');
		$("#frmCreateContact").submit();
		
	 }
	}


</script>
<!-- Custom Selectbox Ends -->
</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper" id="edit-profile-info-tab"> 
  <!-- Main starts-->
  
  <section class="main"> 
   
    
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix goals_bx_in">       
      <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
      <form:form class="form-horizontal" id="frmCreateContact" name="frmCreateContact" action="${pageContext.request.contextPath}/partner/${formAction}" method="POST" commandName="party">
        <form:hidden path="id" value="${partyId}"/>
        <!-- inside goal page class-->
        <div style="padding:10px 10px 0;">
          <div id="tabs">
            <ul>
              <li><a href="#tabs-1">Personal Details</a></li>
            </ul>
            <div id="tabs-1" class="tab_border">
              <div id="personal_details"> 
                <div class="first_top_col rel"> <span class="mandatory"> </span>
                <label class="form_label">Name</label>
                <form:select path="salutationId" id="salutationId" items="${salutationList}" itemLabel="codeValue" itemValue="codeValueId"  />
                <input name="firstName" id="firstName" maxlength="50" type="text" class="common_input Alfa " value="${party.firstName}" placeholder="First name">
	     		<input name="lastName" id="lastName" maxlength="50" type="text" class="common_input Alfa required" value="${party.lastName}" placeholder="Last name">
              </div>
              
                         
                <div class="first_col"> <label class="form_label">Contact</label>
                  <ul class="reset clearfix first_col_ul">
                    <li class="clearfix rel"> <span class="mandatory"> </span>
                     
               Email <input name="contactEmail1" type="text" class="common_input required email" value="${party.contactEmail1}" maxlength="75">
                      </li>
                      
                      <li class="clearfix two rel">
                       Mobile
                <input name="contactMobile1" type="text" class="common_input mobileNL" value="${party.contactMobile1}" placeholder="+91 9999999999" >
                    </li>
                    
                    <li class="clearfix rel">
                      Alternate No
                <input name="contactMobile2" type="text" class="common_input mobileNL" value="${party.contactMobile2}">
                    </li>
                  </ul>
                </div>
                
          <!--      <div class="fr second_col">
                  <ul class="reset clearfix second_col_ul">
                    <li class="clearfix"><span class="mandatory"> </span>
                      <label class="form_label">Mobile</label>
                <input name="" type="text" class="common_input" placeholder="Last Name">
                    </li>
                  </ul>
                </div>
                
                <div class="fr third_col">
                  <ul class="reset clearfix third_col_ul">
                                        <li class="clearfix">
                      <label class="form_label">Alternate no</label>
                <input name="" type="text" class="common_input" placeholder="Last Name">
                    </li>

                  </ul>
                </div>-->
                
                
              </div>
              <div class="clr"> </div>
            </div>
            
            
          </div>
        </div>
      </form:form>  
      </section>
      
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
  <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            </li>
            <li class="fl list"><a id="addEditContactSaveLink" href="#" class="anch save addContactSaveLink editContactSaveLink" onclick="formSubmit();"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/contacts" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
      <!--  <a href="#" class="back navgation"><span class="txt">Back</span></a> <a href="#" class="next navgation"><span class="txt">Next</span></a>--> </section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 
  <!--pop up box-->
    <div id="Per_Con" class="common_custom_modal_edu_con">
      <span class="close">X</span>
       <img src="" alt=""></div>     
    </div>
  <!--pop up box-->
<!-- Wrapper ends-->
</body>
</html>
