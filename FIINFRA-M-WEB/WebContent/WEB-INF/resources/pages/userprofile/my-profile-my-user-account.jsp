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
	initialData.push($("#securityQuestion").val());
	initialData.push($("#securityAnswer").val());
}
function checkDataFinal(){
	finalData = [];
	finalData.push($("#securityQuestion").val());
	finalData.push($("#securityAnswer").val());
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
				if ($("#my_user_account").is(":visible")) {
					$(".my_profile_links li.sixth").addClass("active");
				}
				// Calls the selectBoxIt method on your HTML select box	
				$("select").selectBoxIt();
				// Calls the selectBoxIt method on your HTML select box	
				$(".my_profile_links .arrow").click(function() {

					slide();
				});
				$('#profile-form').validate();
				 $('.wrapper').addClass("my_profile_wrapper");
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
				checkDataInitial();
			});
</script>
<script>
	function saveProfile(action) {
		checkDataFinal();
		if($("#securityQuestionId").val()!=0 )
		{
			$("#securityAnswer").addClass("required");
		}
		else
		{
			$("#securityAnswer").removeClass("required");
		}
		$('#action').val(action);
		
		if(initialData.toString() == finalData.toString()){ 
    		alertMessage("You haven't changed any data yet. Please make some changes then save.");
    	}
    	else {
			$('#profile-form').submit();
    	}
	}
</script>

<section class="in_content common_in_content clearfix my_profile_parent"
	id="my_user_account">
	<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
	<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
	<div class="header_strip">My User Account</div>
	<section id="user_account" class="clearfix">
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

		<form:form
			action="${pageContext.request.contextPath}/partner/profile/save"
			commandName="profileData" method="POST" id="profile-form">
			<input name="viewId" type="hidden" value = "${viewId}"/>
			<form:input path ="partyId" type ="hidden"/>

			<ul class="reset clearfix secrect_qa">

				<li class="clearfix"><label class="form_label">Security
						Question</label> <form:select path="securityQuestionId"
						id="securityQuestionId" items="${securityQuestions}" itemLabel="name"
						itemValue="id">
					</form:select></li>

				<li class="clearfix rel"><label class="form_label">Security
						Answer</label> <form:input path="securityAnswer" class="common_input " id="securityAnswer"/></li>

			</ul>

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
		</ul>
	</div>
	<a href="#" onClick="cancel('${pageContext.request.contextPath}/partner/personal/info?viewId=4');" class="back navgation"><span
		class="txt">Back</span></a> <a
		href="#" onClick="cancel('${pageContext.request.contextPath}/partner/personal/info?viewId=7');" class="next navgation"><span
		class="txt">Next</span></a>
</section>