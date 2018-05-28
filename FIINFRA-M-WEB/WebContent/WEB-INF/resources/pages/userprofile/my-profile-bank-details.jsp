<%@page import="in.fiinfra.query.model.CommonUtils"%>
<%@page import="java.util.Map"%>
<%@page import="in.fiinfra.common.common.ProfileData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	initialData.push($("#bankName").val());
	initialData.push($("#branchname").val());
	initialData.push($("#city").val());
	initialData.push($("#accountNo").val());
	initialData.push($("#micrCode").val());
	initialData.push($("#ifscCode").val());
	initialData.push(($("input[type='radio'][name='accounttype']:checked").val()));
}
function checkDataFinal(){
	finalData = [];
	finalData.push($("#bankName").val());
	finalData.push($("#branchname").val());
	finalData.push($("#city").val());
	finalData.push($("#accountNo").val());
	finalData.push($("#micrCode").val());
	finalData.push($("#ifscCode").val());
	finalData.push(($("input[type='radio'][name='accounttype']:checked").val()));	
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

$(document).ready(function(){
	
 $("#profile-form").validate();
 
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
 
 $("#ifscCode").rules("add", {regex:"^[a-zA-Z]{4}[0][0-9]{6}$",messages: {regex: "Enter Valid IFSC Code" }});
 $("#micrCode").rules("add", {regex:"^([1-9]{1})([0-9]{8})$",messages: {regex: "Enter Valid MICR Code" }});
 $("#accountNo").rules("add", {regex:"[1-9](\.[0-9]+)? |[0-9]*[1-9]{4}",messages: {regex: "Enter Valid Account No" }});
 
 $("li").addClass("rel");
  
// my profile active link
 if ( $("#my_pro_bank_details").is(":visible") ) {
    $(".my_profile_links li.third").addClass("active");
}  
    $('.wrapper').addClass("my_profile_wrapper");
	//	custom scroll to "common_in_content" 
$('#personal_info').slimScroll();
   // Calls the selectBoxIt method on your HTML select box	
 $("select").selectBoxIt();

 // Calls the selectBoxIt method on your HTML select box	
// my_profile_links starts
$(".my_profile_links .arrow").click(function(){

 slide();
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

function slide()
  {
  if($(".my_profile_links .arrow").hasClass("push_in"))
  {
  $(".my_profile_links").animate({left:'-123px'});
  $(".my_profile_links .arrow").animate("slow").removeClass("push_in");	  
  }
  else
  {
  $(".my_profile_links").animate({left:'0'});
  $(".my_profile_links .arrow").animate("slow").addClass("push_in");
  }
  }
<!-- my_profile_links ends-->
checkDataInitial();
});

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

function slide(step){
    $("#acct_type .ui-slider-handle").empty();
    if (step == 1) {
     //   $("#acct_type .ui-slider-handle").css("margin-left", "2px");

        $("#acct_type .frist").click();
        var x = $(".frist").val();
        $("#acct_type .ui-slider-handle").append(x);
    } else if (ui.value == 2) {
     //   $("#acct_type .ui-slider-handle").css("margin-left", "-52px");
        $("#acct_type .second").click();
        var x = $("#acct_type .second").val();
        $("#acct_type .ui-slider-handle").append(x);
    }
}

$(function () {
    $("#acct_type").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            $("#acct_type .ui-slider-handle").empty();
            if (ui.value == 1) {
                $("#acct_type .ui-slider-handle").css("margin-left", "2px");

                $("#acct_type .frist").click();
                var x = $(".frist").val();
                $("#acct_type .ui-slider-handle").append(x);
            } else if (ui.value == 2) {
                $("#acct_type .ui-slider-handle").css("margin-left", "-52px");
                $("#acct_type .second").click();
                var x = $("#acct_type .second").val();
                $("#acct_type .ui-slider-handle").append(x);
            }
        }
    });
   
    $("#acct_type").each(function () {
        $(this).find(":radio").hide();
    });
    
    var saving= $('#acct_type .frist').is(':checked');
    if(saving){
    	$("#acct_type").slider('value',1);
		 $("#acct_type .ui-slider-handle").css("margin-left", "2px");
		  var x = $(".frist").val();
          $("#acct_type .ui-slider-handle").append(x);
    }
    else{
    	$("#acct_type").slider('value',2);
		 $("#acct_type .ui-slider-handle").css("margin-left", "-50px");
		 var x = $("#acct_type .second").val();
          $("#acct_type .ui-slider-handle").append(x);
    }

});

var oppTypes = {  
        <c:forEach items="${map}" var="item" varStatus="loop">  
          '${item.key}': '${item.value}' ${not loop.last ? ',' : ''}  
        </c:forEach>  
      }; 
      
	function saveProfile(action) {
		$(".save").addClass("inactiveLink");
		checkDataFinal();
		$('#action').val(action);
		var selected = $("input[type='radio'][name='accounttype']:checked");
		var cId = oppTypes[selected.val()];
		if(initialData.toString() == finalData.toString()){ 
    		alertMessage("You haven't changed any data yet. Please make some changes then save.");
    		$(".save").removeClass("inactiveLink");
    	}
    	else {
    		selected.val(cId);
			$('#profile-form').submit();
    	}
	}
</script>
<%
	int savingId = (Integer) request.getAttribute("savingId");
 	int currentId = (Integer) request.getAttribute("currentId");
 	ProfileData profile = (ProfileData) request.getAttribute("profileData");
 	Map<String,Integer> map = (Map<String,Integer>) request.getAttribute("map");
%>

<section class="in_content common_in_content clearfix my_profile_parent"
	id="my_pro_bank_details">
	<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
	<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
	<div class="header_strip">Bank Details</div>
	<section id="bank_details" class="clearfix">

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
			<input name="viewId" type="hidden" value="${viewId}" />
			<form:input path="partyId" type="hidden" />
			<div class="first_col fl">
				<ul class="reset clearfix first_ul">
					<li class="clearfix"><label class="form_label">Bank
							Name</label> <form:input path="bankName" class="common_input"/></li>
					<li class="clearfix"><label class="form_label">Branch
							Name</label> <form:input path="branchname" class="common_input"/></li>
					<li class="clearfix"><label class="form_label">City</label> <form:input path="city" class="common_input"/></li>
				</ul>
			</div>
			<div class="second_col fl">

				<ul class="reset clearfix second_ul">
					<li class="clearfix"><label class="form_label">Account
							Type</label>
							
						<div  id="acct_type" class="common_sliding_radio fl">

							<span class="lbl_first lbl">Saving</span> <span
								class="lbl_second lbl">Current</span> <input type="radio" id="target_type" 
								name="accounttype" value="Saving" class="frist" 
								<%=profile.getAccounttype()==map.get("Saving")?"checked":""%> />
							<input type="radio" id="target_type" name="accounttype" value="Current" 
								class="second"
								<%=profile.getAccounttype()==map.get("Current")?"checked":""%> />
						</div></li>
					<li class="clearfix"><label class="form_label">Account
							No.</label> <form:input path="accountNo" id="accountNo" name="accountNo" class="common_input"
							value="<%=CommonUtils.emptyIfNull(profile.getAccountNo())%>" maxlength="15" /></li>
					<li class="clearfix"><label class="form_label">MICR
							Code</label> <form:input path="micrCode" id="micrCode" name="micrCode" class="common_input" maxlength="9" /></li>
					<li class="clearfix"><label class="form_label">IFSC
							Code</label> <form:input path="ifscCode" class="common_input" name="ifscCode" id="ifscCode"/></li>

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
			<li class="fl list"><a
				href="#" onClick="cancel('${pageContext.request.contextPath}/partner/dashboard?flag=0');"
				class="anch cancel"><span class="txt">Cancel</span></a></li>
			<!--   <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>-->
		</ul>
	</div>
	<a
		href="#"
		onClick="cancel('${pageContext.request.contextPath}/partner/personal/info?viewId=2');"
		class="back navgation"><span class="txt">Back</span></a> <a
		href="#"
		onClick="cancel('${pageContext.request.contextPath}/partner/personal/info?viewId=4');"
		class="next navgation"><span class="txt">Next</span></a>
</section>

<!-- Common footer ends -->
<div class="overlay"></div>
