<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.ProfileData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<script>
initialData = [];
finalData = [];
function checkDataInitial(){
	initialData = [];
	initialData.push($("#upload").val());
	initialData.push($("#salutation").val());
	initialData.push($("#firstName").val());
	initialData.push($("#lastName").val());
	initialData.push($("#companyName").val());
	initialData.push($("#panNumber").val());
	initialData.push($("#dob").val());
	initialData.push($("#contactHome").val());
	initialData.push($("#contactMobile").val());
	initialData.push($("#contactEmail").val());
	initialData.push($("#websiteUrl").val());
	initialData.push($("#fbLink").val());
	initialData.push($("#twitterLink").val());
	
}
function checkDataFinal(){
	finalData = [];
	finalData.push($("#upload").val());
	finalData.push($("#salutation").val());
	finalData.push($("#firstName").val());
	finalData.push($("#lastName").val());
	finalData.push($("#companyName").val());
	finalData.push($("#panNumber").val());
	finalData.push($("#dob").val());
	finalData.push($("#contactHome").val());
	finalData.push($("#contactMobile").val());
	finalData.push($("#contactEmail").val());
	finalData.push($("#websiteUrl").val());
	finalData.push($("#fbLink").val());
	finalData.push($("#twitterLink").val());
	
}
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$("#my_pro_per_info .photo_frame p")
					.animate("slow").css("display",
							"none");
			$('#preview').attr('src',
					e.target.result);
			$("#my_pro_per_info .photo_frame img")
					.animate("slow").css("display",
							"block");
		}

		reader.readAsDataURL(input.files[0]);
	}
}
	$(document).ready(
			function() {
				
				var rbsLinks = "${rbsLinks}";
				var pieces = rbsLinks.split(",");
				if(pieces != ""){
					for(var i=0;i<pieces.length;i++){
						if(pieces[i]=="saveMyProfileLink"){
							$("#profile-form").attr("action","#");
						}
						$("."+pieces[i]).attr("href","#");
						$("."+pieces[i]).addClass("inactiveLink");
					}
				}
				
				// my profile active link
				if ($("#my_pro_per_info").is(":visible")) {
					$(".my_profile_links li.first").addClass("active");
				}
				//Datepicker Satrs
				$(function() {
					$( ".datepicker" ).datepicker({
					  	dateFormat: "dd-M-yy",
					  	changeMonth: true,
				  		changeYear: true,
				   		yearRange: "-100:+0", 
					   	showOn: "button",
					  	buttonText: '',
					  	maxDate: '0',
					 });
					$(".ui-datepicker-trigger").wrap(
							"<div class='datepicker-trigger-parent'></div>");
				});

				var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
				// setter
				$("#dialog1").dialog("option", "buttons", [{
				   text: "Ok",
				   click: function () {
					   $(this).dialog('close');
				   }
				}]);
				$(document).on("dialogopen", "#dialog1", function(event, ui) {
					setTimeout("$('#dialog1').dialog('close')",3000);
				});
				
				$("#confirmDialog .close").click(function(){
			 	    $(".overlay").fadeOut("slow");
			 	 $("#confirmDialog").fadeOut("slow");
			 	  }); 
				
				//Datepicker Ends
				 $('.wrapper').addClass("my_profile_wrapper");
				//	custom scroll to "common_in_content" 
				$('#personal_info').slimScroll();
				// Calls the selectBoxIt method on your HTML select box	
				$("select").selectBoxIt();
				// Calls the selectBoxIt method on your HTML select box	
				// my_profile_links starts
				$(".my_profile_links .arrow").click(function() {

					slide();
				});
				//validate form
				$("#profile-form").validate({
		  			ignore:'', //i.e. do not ignore hidden elements 
		 		});
					
				function slide() {
					if ($(".my_profile_links .arrow").hasClass("push_in")) {
						$(".my_profile_links").animate({
							left : '-123px'
						});
						$(".my_profile_links .arrow").animate("slow")
								.removeClass("push_in");
					} else {
						$(".my_profile_links").animate({
							left : '0'
						});
						$(".my_profile_links .arrow").animate("slow").addClass(
								"push_in");
					}
				}
				// image uplaod starts
				$("#upload").change(function() {
								readURL(this);
				});
				// image uplaod ends
								
			$("#arn").attr("disabled",true);
			$("#euin").attr("disabled",true);
			$("#location").attr("disabled",true);
			checkDataInitial();
			});
	function calculateAge(){
		var bDate=document.getElementById("dob"); 
		var dp1=bDate.value.split("/").reverse().join("/");
		var d1=new Date(dp1);
		var d2=new Date();
	    var t1 = d1.getTime();
	    var t2=d2.getTime();
		var age=parseInt((t2-t1)/(24*3600*1000));
		age=age/365;
		if(age<18 || age>100){
			$("#successDialog").html("Select valid 'Date of Birth'");
	 		$( "#successDialog").dialog( "open" );
		
			$("#dob").val("");
			return false;
		}
	}
	
	function cancel(url){
		 checkDataFinal();
			if(initialData.toString() == finalData.toString()){ 
				javascript:location.href=url;
			 }else{
				 
				 $(".aa_up").html("<spring:message code='dataChanged' />");
					$(".aa_yes").click(function(){
					cancelPage(url);
					});	
					$(".overlay").fadeIn();
					$("#confirmDialog").fadeIn();
			} 
		}
		function back(url){
			javascript:location.href=url;
		}

		function cancelPage(url){
			javascript:location.href=url;
		}
		
</script>
<script>
	function saveProfile(action) {
	
		$('#action').val(action);
		
    	var f = $("#upload").val();
    	if(f.length >0){
    	var extension = f.split('.').pop().toUpperCase();
    	if (extension!="PNG" && extension!="JPG" && extension!="GIF" && extension!="JPEG" && extension!="BMP"){
    		$("#successDialog").html("Not A Valid Image File.");
	 		$( "#successDialog").dialog( "open" );
    		$( "#upload" ).focus();
    		return ;
    	   
    	}
    	}
    	checkDataFinal();
    	if(initialData.toString() == finalData.toString()){ 
    		alertMessage("You haven't changed any data yet. Please make some changes then save.");
    	}
    	else {
    			$('#profile-form').submit();
    	}
	}
	
	function alertMessage(msg)
	{
		$("#dialog1").html(msg);
		$( "#dialog1").dialog( "open" );
	}
	
	function closeDialog(){
		  $(".overlay").fadeOut("slow");
		     $("#confirmDialog").fadeOut("slow");
	}	
	
</script>

<!-- Common_in_contnet starts-->

<section class="in_content common_in_content clearfix my_profile_parent"
	id="my_pro_per_info">
	<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
	<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
  <div class="header_strip">Personal Info</div>
  <section id="personal_info" class="clearfix">
    <div class="my_profile_links">
      <div class="arrow"></div>
      <ul class="reset clearfix">
				<li class="first"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=1" class="changeProfilePersonalInfoLink">Personal
						Info</a></li>
				<li class="second"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=2" class="changeProfileAddressLink">Address</a></li>
				<li class="third"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=3" class="changeProfileBankDetailsLink">Bank
						Details</a></li>
				<li class="fourth"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=4" class="changeProfileServicesLink">Services</a></li>
				<li class="fifth"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=5" class="changeProfileMyFinancialProductLink">My
						Financial Product</a></li>
				<li class="sixth"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=6" class="changeProfileMyUserAccountLink">My
						User Account</a></li>
				<li class="seventh"><a
					href="${pageContext.request.contextPath}/partner/personal/info?viewId=7" class="changeProfileMyTeamLink">My
						Team</a></li>
			</ul>
    </div>
    <script>
</script>
    <form:form
			action="${pageContext.request.contextPath}/partner/profile/save"
			commandName="profileData" method="POST" id="profile-form" enctype="multipart/form-data">
      <%
		ProfileData profileData=(ProfileData)request.getAttribute("profileData");
		%>
      <input name="viewId" type="hidden" value = "${viewId}"/>
      <form:input path ="partyId" type ="hidden"/>
      <div class="first_col fl">
        <div class="photo_frame">
          <% if(StringUtils.isEmpty(profileData.getPhoto())){ %>
          <p>Your Photo Here</p>
          <% }%>
          <img id="preview" src="<%=FiinfraUtility.getImagePath(request, profileData.getPhoto(), null) %>"  alt="" /> </div>
        <div class="upload_btn">
          <form:input class="northspace4 common_btn" type="file" path="image" capture="camera" accept="image/*" id="upload"/>
          <!--	<input type ="button" id="photo_upload" class="common_btn" value ="Browse"/>--> 
        </div>
        <div style="margin:20px 0px 0px 0px; font-size:12px; color:#3a3a3a; font-family:allerregular;">
        <p>File with extension .jpeg, .jpg, .png </p>
        <p>or .bmp are allowed</p>
        <p>&nbsp</p>
          <p>Please upload the image of following</p>
          <p>dimensions for best results</p>
          <p style="margin:5px 0px 0px 0px;"> <span style="font-weight:bold">width:</span> 99 px -<span style="font-weight:bold"> height:</span> 128 px</p>
          <p style="margin:5px 0px 0px 0px;"> <span style="font-weight:bold">width:</span> 35 mm -<span style="font-weight:bold"> height:</span> 45 mm</p>
        </div>
      </div>
      <div class="second_col fl">
        <ul class="reset clearfix info">
          <li class="clearfix rel">
            <label class="form_label">Salutation</label>
            <form:select path="salutationId" id="salutation"
							items="${salutations}" itemLabel="name" itemValue="id"> </form:select>
          </li>
          <li class="clearfix first_name">
            <label class="form_label">First
              Name</label>
            <form:input path="firstName" class="common_input Alfa" />
          </li>
          <li class="clearfix last_name">
            <label class="form_label">Last
              Name</label>
            <form:input path="lastName" class="common_input Alfa" />
          </li>
          <li class="clearfix company">
            <label class="form_label">Company</label>
            <form:input path="companyName" class="common_input" />
          </li>
          <li class="clearfix">
            <label class="form_label">PAN</label>
            <form:input path="panNo" id="panNumber" name="panNumber" onchange="validatePAN();" class="common_input" />
          </li>
          <li class="clearfix">
            <label class="form_label">Birth
              Date</label>
            <form:input path="dob" class="common_input datepicker" placeholder="dd-mmm-yyyy" readonly="true" onChange="calculateAge();"  />
          </li>
          <li class="clearfix">
            <ul class="contact reset clearfix">
              <li class="clearfix rel">
                <label class="form_label">Ph.No.</label>
                <form:input path="contactHome" class="common_input mobileNL" maxlength="15"/>
              </li>
              <li class="clearfix mobile rel">
                <label class="form_label">Mobile</label>
                <form:input path="contactMobile" class="common_input mobileNL" maxlength="15"/>
              </li>
            </ul>
          </li>
          <li class="clearfix rel">
            <ul class="web reset clearfix soc_network">
              <li class="clearfix rel fb_lable">
                <label class="form_label">Facebook Link</label>
                <form:input path="fbLink" id="fbLink" class="common_input " />
              </li>
              <li class="clearfix website rel twitt_link">
                <label class="form_label">Twitter Link</label>
                <form:input path="twitterLink"  id="twitterLink" class="common_input " />
              </li>
            </ul>
          </li>
          <li class="clearfix rel">
            <ul class="web reset clearfix">
              <li class="clearfix rel">
                <label class="form_label">Email</label>
                <form:input path="contactEmail" id="contactEmail" class="common_input email" />
              </li>
              <li class="clearfix website rel">
                <label class="form_label">Website</label>
                <form:input path="websiteUrl" class="common_input url" />
              </li>
            </ul>
          </li>
          <li class="">
            <ul class="clearfix reset web">
              <li class="fl arn_code">
                <label class="form_label">ARN
                  Code</label>
                <form:input path="arn" class="common_input" id="arn" />
              </li>
              <li class="fl euin">
              <label class="form_label">EUIN</label>
              <form:input path="euin" class="common_input readonly" id="euin" />
              </li>
            </ul>
          </li>
          <li class="clearfix">
          <label class="form_label">Location</label>
          <form:input path="location" class="common_input readonly" id="location"  />
          </li>
        </ul>
      </div>
    </form:form>
  </section>
</section>
<!-- Common_in_contnet ends --> 
<!-- Common footer starts -->
<section class="common_footer_actions">
  <div id="main_actions" class="clearfix">
    <ul class="reset clearfix fr btn_grup3">
      <li class="fl list"><a onClick="saveProfile('new')"
				class="anch save saveMyProfileLink"><span class="txt">Save</span></a></li>
      <li class="fl list"><a href="#" onClick="cancel('${pageContext.request.contextPath}/partner/dashboard?flag=0');" class="anch cancel"><span
					class="txt">Cancel</span></a></li>
      <!--   <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>-->
    </ul>
  </div>
  <a href="#" onClick="cancel('${pageContext.request.contextPath}/partner/dashboard?flag=0');" class="back navgation"><span class="txt">Back</span></a> <a href="#" onClick="cancel('${pageContext.request.contextPath}/partner/personal/info?viewId=2');" class="next navgation"><span
		class="txt">Next</span></a> </section>
		