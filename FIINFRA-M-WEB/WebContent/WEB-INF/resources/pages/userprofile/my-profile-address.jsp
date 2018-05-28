<%@page import="in.fiinfra.common.common.ProfileData"%>
<%@page import="in.fiinfra.common.common.AddressData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<style>
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>  
				<%
					ProfileData bean = (ProfileData) request
								.getAttribute("profileData");
						AddressData officeAddress = bean.getAddressDataList().get(1);
						AddressData resAddress = bean.getAddressDataList().get(0);
				%>
<script>
initialData = [];
finalData = [];
function checkDataInitial(){
	initialData = [];
	initialData.push($("#address11").val());
	initialData.push($("#address12").val());
	initialData.push($("#address13").val());
	initialData.push($("#address21").val());
	initialData.push($("#address22").val());
	initialData.push($("#address23").val());
	initialData.push($("#country1").val());
	initialData.push($("#country2").val());
	initialData.push($("#state1").val());
	initialData.push($("#state2").val());
	initialData.push($("#city1").val());
	initialData.push($("#city2").val());
	initialData.push($("#pin1").val());
	initialData.push($("#pin2").val());
}
function checkDataFinal(){
	finalData = [];
	finalData.push($("#address11").val());
	finalData.push($("#address12").val());
	finalData.push($("#address13").val());
	finalData.push($("#address21").val());
	finalData.push($("#address22").val());
	finalData.push($("#address23").val());
	finalData.push($("#country1").val());
	finalData.push($("#country2").val());
	finalData.push($("#state1").val());
	finalData.push($("#state2").val());
	finalData.push($("#city1").val());
	finalData.push($("#city2").val());
	finalData.push($("#pin1").val());
	finalData.push($("#pin2").val());
	
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
	
	
$(document).ready(function(){
	
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
	
	$("#address11").val('<%=resAddress.getStreet1()%>');
	$("#address12").val('<%=resAddress.getStreet2()%>');
	$("#address13").val('<%=resAddress.getStreet3()%>');
	$("#address21").val('<%=officeAddress.getStreet1()%>');
	$("#address22").val('<%=officeAddress.getStreet2()%>');
	$("#address23").val('<%=officeAddress.getStreet3()%>');
	
// my profile active link
 if ( $("#my_pro_address").is(":visible") ) {
    $(".my_profile_links li.second").addClass("active");
} 
 $('.wrapper').addClass("my_profile_wrapper");
//	custom scroll to "common_in_content" 
$('#personal_info').slimScroll();
   // Calls the selectBoxIt method on your HTML select box	
 $("select").selectBoxIt();
	
 // Calls the selectBoxIt method on your HTML select box	
$(".my_profile_links .arrow").click(function(){

 slide();
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
function saveQuery(action){
	$('#action').val(action);
	$('#profile-form').validate();
	checkDataFinal();
	if(initialData.toString() == finalData.toString()){ 
		alertMessage("You haven't changed any data yet. Please make some changes then save.");
	}
	else {
		$('#profile-form').submit();
	}
}
</script>

<section class="in_content common_in_content clearfix my_profile_parent"
	id="my_pro_address">
	<div id="page_loader"></div>
	<div class="header_strip">Address</div>
	<section id="address" class="clearfix">
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
			commandName="profileData" method="POST" id = "profile-form">
			<input name="viewId" type="hidden" value = "${viewId}"/>
			<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
			<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
 			 </div>
			</div>
			<div class="first_col fl" >
				<h4 class="heading">Residence Address</h4>

				
				<form:input path ="partyId" type ="hidden"/>
				<form:input path="addressDataList[0].addressType" type="hidden" />
				<form:input path ="partyId" type ="hidden"/>
				<ul class="reset clearfix residence">
					<li class="clearfix"><label class="form_label">Address
							1</label> <input name="addressDataList[0].street1" id="address11" class="common_input"
						 /></li>
					<li class="clearfix"><label class="form_label">Address
							2</label> <input name="addressDataList[0].street2" id="address12" class="common_input"
						 /></li>

					<li class="clearfix"><label class="form_label">Address
							3</label> <input name="addressDataList[0].street3" id="address13" class="common_input"
						 /></li>

					<li class="clearfix"><label class="form_label">Country</label>
						<form:select path="addressDataList[0].country" id="country1" itemLabel="name" itemValue="id"
							items="${countries}" >
						</form:select></li>
					<li class="clearfix"><label class="form_label">State</label> <form:select id="state1"
							path="addressDataList[0].state" itemLabel="name" itemValue="id" items="${states1}"
							>
						</form:select></li>
					<li class="clearfix"><label class="form_label">City</label> <form:select
							path="addressDataList[0].cityId" id="city1" itemLabel="name" itemValue="id" items="${cities1}"
							>
						</form:select></li>
					<li class="clearfix rel"><label class="form_label">Postal
							Code</label> <input name="addressDataList[0].postalCode" id="pin1"
						class="common_input postal" value="<%=resAddress.getPostalCode()%>" /></li>
				</ul>

			</div>
			<div class="second_col fl">
				<h4 class="heading">Office Address</h4>
				<form:input path="addressDataList[1].addressType" type="hidden" />
				
				<ul class="reset clearfix office">

					<li class="clearfix"><label class="form_label">Address
							1</label> <input name="addressDataList[1].street1" id="address21" class="common_input"
						 /></li>
					<li class="clearfix"><label class="form_label">Address
							2</label> <input name="addressDataList[1].street2" id="address22" class="common_input"
						 /></li>
					<li class="clearfix"><label class="form_label">Address
							3</label> <input name="addressDataList[1].street3" id="address23" class="common_input"
						 /></li>
					<li class="clearfix"><label class="form_label">Country</label>
						<form:select path="addressDataList[1].country" id="country2" itemLabel="name" itemValue="id"
							items="${countries}" >
						</form:select></li>
					<li class="clearfix"><label class="form_label">State</label> <form:select id="state2"
							path="addressDataList[1].state" itemLabel="name" itemValue="id" items="${states2}"
							>
						</form:select></li>
					<li class="clearfix"><label class="form_label">City</label> <form:select id="city2"
							path="addressDataList[1].cityId"  itemLabel="name" itemValue="id" items="${cities2}"
							>
						</form:select></li>
					<li class="clearfix rel"><label class="form_label">Postal
							Code</label> <input name="addressDataList[1].postalCode" id="pin2"
						class="common_input postal" value="<%=officeAddress.getPostalCode()%>" />
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
			<li class="fl list"><a onClick="saveQuery('new')"
				class="anch save saveMyProfileLink"><span class="txt">Save</span></a></li>
			<li class="fl list"><a href="#" onClick="cancel('${pageContext.request.contextPath}/partner/dashboard?flag=0');" class="anch cancel"><span
					class="txt">Cancel</span></a></li>
		</ul>
	</div>
	<a href="#" onClick="cancel('${pageContext.request.contextPath}/partner/personal/info?viewId=1');" class="back navgation"><span
		class="txt">Back</span></a> <a href="#" onClick="cancel('${pageContext.request.contextPath}/partner/personal/info?viewId=3');"
		class="next navgation"><span class="txt">Next</span></a>
</section>


<script>
$(document).ready(function(){
	
	$('#page_loader').fadeOut(500);
	
	$("select#country1").bind({
		"change": function(){
			if($("#country1").val() != ""){
				$('#page_loader').fadeIn();
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#country1").val(), '{}', "#state1");
				$('#page_loader').fadeOut();
			}
		}
	});

	$("select#country2").bind({
		"change": function(){
			if($("#country2").val() != ""){
				$('#page_loader').fadeIn();
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#country2").val(), '{}', "#state2");
				$('#page_loader').fadeOut();
			}
		}
	});

	$("select#state1").bind({
		"change": function(){
			if($("#stateId").val() != ""){
				$('#page_loader').fadeIn();
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId=" + $("#state1").val(), '{}', "#city1");
				$('#page_loader').fadeOut();
			}
		}
	});
	$("select#state2").bind({
		"change": function(){
			
			if($("#stateId").val() != ""){
				$('#page_loader').fadeIn();
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId=" + $("#state2").val(), '{}', "#city2");
				$('#page_loader').fadeOut();
			}
		}
	});
	
});
</script>
</body>
</html>
