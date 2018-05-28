<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Datepicker -->
<head>
<style>
#assetFD label[for="maturityAmount"]{top: -44px;}
#assetFD label[for="currentValue"]{top: -44px;}
#assetFD label[for="investmentValue"]{top: -44px;}

#assetRD label[for="maturityAmount"]{top: -44px;}
#assetRD label[for="currentValue"]{top: -44px;}
#assetRD label[for="sipAmount"]{top: -44px;}

#assetSavings label[for="currentValue"]{top: -44px;}
</style>	
<script>
$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true,
      maxDate: '0',
      yearRange: "-100:+0"
     });
  });
  
$(function() {
	  $( ".datepickerEnd" ).datepicker({
	  dateFormat: "dd-M-yy",
  showOn: "button",
	  buttonText: '',
	  changeMonth: true,
  	  changeYear: true,
  	yearRange: "-100:+100"
 });
});

jQuery.validator.addMethod("mynumber", function (value, element) {
    return this.optional(element) || /^(\d+|\d+,\d{1,2})$/.test(value);
}, "Please enter only digits");
  
  </script>
<script>

var oldValuesFD = [];
var oldValuesRD = [];
var oldValuesSaving = [];
var cntrSave=1;
$(document).ready(function(){
	
	$(".head_txt").html('${title}');
	
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
	
	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetFD");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuesFD[i] = x.elements[i].value;
	    }
    }
	});
	
	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetRD");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuesRD[i] = x.elements[i].value;
	    }
    }
	});
	
	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetSavings");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuesSaving[i] = x.elements[i].value;
	    }
    }
	});

$(function() {

	$(document).ajaxStop(function() {
		 $('#page_loader').fadeOut();
	});

	$(document).ajaxStart(function() {
		 $('#page_loader').fadeIn();
	});

});
	

var saveAddFlag = "${saveAddFlag}";
if( saveAddFlag == "fd" ){
	$("#fd").attr("checked",true);
	 $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".fd_box").fadeIn("slow");
		   });
}else if( saveAddFlag == "rd" ){
	$("#rd").attr("checked",true);
	$.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".rd_box").fadeIn("slow");
		   });
}else if( saveAddFlag == "saving" ){
	$("#savings").attr("checked",true);
	$.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".savings_box").fadeIn("slow");
		   });
}

function closeDialog(){
 $(".overlay").fadeOut("slow");
    $("#confirmDialog").fadeOut("slow");
 }	
	
 $('.wrapper').addClass("add_assets_bank_deposit_wrapper add_assets");
 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
  $('.common_in_content').slimScroll();
     $("select").selectBoxIt();
	 $("#fd").click(function(){
	if(!($(".fd_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".fd_box").fadeIn("slow");
	   });
   }
}); 
 $("#rd").click(function(){
    if(!($(".rd_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".rd_box").fadeIn("slow");
	   });
   }
}); 
 $("#savings").click(function(){
	if(!($(".savings_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".savings_box").fadeIn("slow");
	   });
   }
}); 

$("#ownerPartyId_48011").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#ownerPartyId_48011").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
$("#ownerPartyId_48053").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#ownerPartyId_48053").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
$("#ownerPartyId_48052").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#ownerPartyId_48052").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
$("#assetFD").validate({ignore:'', rules:{maturityAmount:{min:1}, currentValue:{min:1}, investmentValue:{min:1}}});
$("#assetRD").validate({ignore:'', rules:{maturityAmount:{min:1}, currentValue:{min:1}, sipAmount:{min:1}}});
$("#assetSavings").validate({ignore:'', rules:{currentValue:{min:1}}});

<c:choose>
	<c:when test="${not(empty assetFixedDeposit)}">
		var selectBox1 = $("#ownerPartyId_48011").selectBoxIt().data('selectBox-selectBoxIt');			    
		selectBox1.selectOption('${assetFixedDeposit.ownerPartyId}');
		if(!($(".fd_box").is(":visible")))
		   {
		   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
		       $(".fd_box").fadeIn("slow");
			   });
		   }
		$("#rd").addClass("inactiveLink");
		$("#rd").attr("disabled",true);
		$("#savings").addClass("inactiveLink");
		$("#savings").attr("disabled",true);
	</c:when>
	<c:when test="${not(empty assetRecurringDeposit)}">
		var selectBox1 = $("#ownerPartyId_48053").selectBoxIt().data('selectBox-selectBoxIt');			    
		selectBox1.selectOption('${assetRecurringDeposit.ownerPartyId}');
		$("#fd").removeAttr("checked");
		$("#rd").attr("checked",true);
		if(!($(".rd_box").is(":visible")))
		   {
		   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
		       $(".rd_box").fadeIn("slow");
			   });
		   }
		$("#fd").addClass("inactiveLink");
		$("#fd").attr("disabled",true);
		$("#savings").addClass("inactiveLink");
		$("#savings").attr("disabled",true);
	</c:when>
	<c:when test="${not(empty assetSavingDeposit)}">
		var selectBox1 = $("#ownerPartyId_48052").selectBoxIt().data('selectBox-selectBoxIt');			    
		selectBox1.selectOption('${assetSavingDeposit.ownerPartyId}');
		$("#fd").removeAttr("checked");
		$("#savings").attr("checked",true);
		if(!($(".savings_box").is(":visible")))
		   {
		   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
		       $(".savings_box").fadeIn("slow");
			   });
		   }
		$("#fd").addClass("inactiveLink");
		$("#fd").attr("disabled",true);
		$("#rd").addClass("inactiveLink");
		$("#rd").attr("disabled",true);
	</c:when>
</c:choose>

$("li").addClass("rel");

$("body").on("click", "#saveAdd", function() {
	
	 	if($('#fd').is(':checked')){
	 	    
	 		if($('#assetFD').validate().form()){
	 	    	 if(checkChangeDataFD()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
    	    			$('#assetFD').submit();
    	    			cntrSave++;
		 			}
	 	    	 }
	 	   	}
	 	  }
	 	  else if($('#rd').is(':checked')){
	 		  
	 		 if($('#assetRD').validate().form()){
	 	    	 if(checkChangeDataRD()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
    	    			$('#assetRD').submit();
    	    			cntrSave++;
		 			}
	 	    	 }
	 		  }
	 	  }
	 	  else {
	 		 if($('#assetSavings').validate().form()){
	 	    	 if(checkChangeDataSavings()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
    	    			$('#assetSavings').submit();
    	    			cntrSave++;
		 			}
	 	    	 }
	 	  	  }
	 	  }
	  	  
	    });
	    
$("body").on("click", "#saveClose", function() {
	
 	if($('#fd').is(':checked')){ 
 		if($('#assetFD').validate().form()){
	    	 if(checkChangeDataFD()){
	 			if(cntrSave==1){
	 				$("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	 				$('#assetFD').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
		 			$('#assetFD').submit();
		 			cntrSave++;
	 			}
	    		 
	    	 }
 	   	}
 	  }
 	  else if($('#rd').is(':checked')){
 		if($('#assetRD').validate().form()){
	    	 if(checkChangeDataRD()){
	    		 if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
		    			$("#saveClose").addClass("inactiveLink");
		 				$('#assetRD').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
			 			$('#assetRD').submit();
			 			cntrSave++;
		 			}
	    		 
	    	 }
 		}
 	  }
 	  else {
 		 if($('#assetSavings').validate().form()){
 	    	 if(checkChangeDataSavings()){
 	    		if(cntrSave==1){
	 				$("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	    			$('#assetSavings').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
		 		  	$('#assetSavings').submit();
		 			cntrSave++;
	 			}
 	    	 }
 	  	}
 	  }
  	  
    });
    
/* $("body").on("click", "#cancel", function() {
		$('#assetCancel').submit();
}); */


});

function doAction(url){
	checkData(url);
}

function cancelPage(url){
	window.location.href=url;
}

function checkData(url){
	var x;
	var oldValues=[];
	if($('#fd').is(':checked')){
		x = document.getElementById("assetFD");
		oldValues = oldValuesFD;
	}
	else if($('#rd').is(':checked')){
		x = document.getElementById("assetRD");
		oldValues = oldValuesRD;
	}else {
		x = document.getElementById("assetSavings");
		oldValues = oldValuesSaving;
	}
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValues[i] != x.elements[i].value && x.elements[i].id!="refer"){
	   			flag=0;
	   		}
	    }
    }
	if(flag==0){
		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").click(function(){cancelPage(url)});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
		return false;
	}else{
		window.location.href=url;
	}
}

function checkChangeDataFD(){
	var x = document.getElementById("assetFD");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuesFD[i] != x.elements[i].value && x.elements[i].id!="refer"){
	   			flag=0;
	   		}
	    }
    }
	if(flag==1){
		alertMessage("You haven't changed any data yet. Please make some changes then save.")
		return false;
	}else{
		return true;
	}
}

function checkChangeDataRD(){
	var x = document.getElementById("assetRD");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuesRD[i] != x.elements[i].value && x.elements[i].id!="refer"){
	   			flag=0;
	   		}
	    }
    }
	if(flag==1){
		alertMessage("You haven't changed any data yet. Please make some changes then save.")
		return false;
	}else{
		return true;
	}
}

function checkChangeDataSavings(){
	var x = document.getElementById("assetSavings");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuesSaving[i] != x.elements[i].value && x.elements[i].id!="refer"){
	   			flag=0;
	   		}
	    }
    }
	if(flag==1){
		alertMessage("You haven't changed any data yet. Please make some changes then save.")
		return false;
	}else{
		return true;
	}
}


function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

</script>
<!-- Datepicker Ends -->

</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  
  <section class="main"> 
    <!-- Header Starts-->
    <%-- <header class="common_header inner_header">
      <section class="top_header clearfix"> <a href="#" class="setting fr"></a>
        <div class="logout_pop_up"><a href="#" class="myaccount_btn"><span class="my_acc_icon"> </span> <span class="my_acc_txt"> MY ACCOUNT</span></a> <a href="index.html" class="logout_btn"><span class="my_logout_icon"> </span> <span class="my_logout_txt"> LOGOUT</span></a> </div>
        <section class="submenu">
          <div class="menu_section">
            <ul class="clearfix reset">
              <li class="fl menu chng_prof"><a href="my-profile-personal-information.html" class="anch"><span class="icon"></span><span class="txt">Change Profile</span></a></li>
              <li class="fl menu adv_assum"><a href="advice-assumptions.html" class="anch"><span class="icon"></span><span class="txt">Advice Assumptions</span></a></li>
              <li class="fl menu chang_pass"><a href="#" class="anch"><span class="icon"></span><span class="txt">Change Password</span></a>
                <section id="password_change">
                  <form method="post" action="" name="change_password">
                    <ul class="reset">
                      <li>
                        <label>Existing Password (from email)</label>
                        <input type="password" class="pass" id="exist_pass" autofocus required>
                      </li>
                      <li>
                        <label>New Password</label>
                        <input type="password" class="pass" name="new_pass" required>
                      </li>
                      <li>
                        <label>Re-enter Password</label>
                        <input type="password" class="pass re_pass" name="re_pass" required>
                        <span class="error re_enter_error">Password did not match</span> </li>
                      <li class="clearfix">
                        <input type="submit" value="Submit" class="fl magento_btn" onclick="return validateForm()">
                        <input type="reset" value="Cancel" class="fr magento_btn" id="cancel">
                      </li>
                    </ul>
                  </form>
                </section>
              </li>
              <li class="fl menu adv_recomm"><a href="advice-recommendations.html" class="anch"><span class="icon"></span><span class="txt">Advice Recommendations</span></a></li>
            </ul>
          </div>
          <p class="personal"><a href="#" class="anchor">Personalization</a></p>
        </section>
        <a href="#" class="header_add add2"><img src="${pageContext.request.contextPath}/resources/images/add2.png" /></a> <a href="#" class="header_add add1"><img src="${pageContext.request.contextPath}/resources/images/add1.png" /></a>
        <div class="fl" id="logo"><a href="dashboard.html"><img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" height="61" width="140" alt=""/></a></div>
      </section>
      <div class="page_header">
        <h1 class="heading clearfix"><a href="#" class="drop_menu"></a><span class="head_txt">ADD ASSETS : BANK DEPOSIT</span><span class="heading_icon"><span class="head_icon"></span></span>
          <div class="desc_container"> <a href="#" class="edit"></a></div>
        </h1>
      </div>
    </header> --%>
    <!-- Header Ends--> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <section class="in_content common_in_content"> 
        <!-- Common_in_contnet starts-->
        <!-- <div class="partner_dashboard_submenu">
          <h4 class="heading"><a href="dashboard.html">Partner Dashboard</a></h4>
          <div class="menu_section">
            <ul class="clearfix reset">
              <li class="menu my_config"><a href="advice-assumptions.html" class="anch"><span class="thumb"></span><span class="txt">My Configuration</span></a></li>
              <li class="menu goals"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Goals</span></a></li>
              <li class="menu contacts"><a href="list-of-contacts.html" class="anch"><span class="thumb"></span><span class="txt">Contacts</span></a></li>
              <li class="menu report"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Reports</span></a></li>
              <li class="menu task"><a href="list-of-tasks.html" class="anch"><span class="thumb"></span><span class="txt">Tasks</span></a></li>
              <li class="menu query"><a href="query.html" class="anch"><span class="thumb"></span><span class="txt">Raise a Query</span></a></li>
              <li class="menu alert"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Alerts</span></a></li>
              <li class="menu chat"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Chat</span></a></li>
            </ul>
          </div>
        </div> -->
        <section id="add_assets_bank_deposit" class="in_content common_in_content clearfix">
          <div class="clearfix top_btn">
            <div class="add_fd_btn btn fl">
              <input name="bank_ac" type="radio" value="" id="fd" checked="">
              <label for="fd">Fixed Deposits</label>
            </div>
            <div class="add_rd_btn btn fl westspace2">
              <input name="bank_ac" type="radio" value="" id="rd">
              <label for="rd"> Recurring Deposits</label>
            </div>
            <div class="add_savings_btn btn fl westspace2">
              <input name="bank_ac" type="radio" value="" id="savings">
              <label for="savings">Savings Account</label>
            </div>
          </div>
          <div class="continer_parent">
         <%--  <form:form id="assetCancel" method="POST" action="${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0">
          </form:form> --%>
          <form:form id="assetFD" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
          <input name="assetTypeId" type="hidden" value="48011"/>
          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
          <input type="hidden" id="assetPage" name="assetPage" value="1"/>
          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="fd"/>
          <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
        <div id="page_loader"></div>		
          <c:if test="${not(empty assetFixedDeposit) and not(empty assetFixedDeposit.partyAssetId)}">
          	<input type="hidden" id="partyAssetId" name="partyAssetId" value="${assetFixedDeposit.partyAssetId}"/>
          </c:if>
            <div class="fd_box dynamic_box">
              <ul class="clearfix head_title first_level_heading reset">
                <li class="title_one label fl">Owner</li>
                <li class="title_two label fl">Asset Name</li>
                <li class="title_three label fl">Bank Name</li>
                <li class="title_four label fl">A/C No.</li>
                <li class="title_five label fl">Commencement Date</li>
               
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
                <li class="input_one label fl">
                  <select class="required" id="ownerPartyId_48011" name="ownerPartyId">
                  </select>
                </li>
                <li class="input_two label fl">
                  <input type="text" class="common_input required" name="assetName" value="${assetFixedDeposit.assetName}" autocomplete="off"/>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input required" name="bankName" value="${assetFixedDeposit.bankName}" autocomplete="off"/>
                </li>
                <li class="input_four label fl">
                  <input type="text" class="common_input required digits" name="accountNo" value="${assetFixedDeposit.accountNumber}" autocomplete="off"/>
                </li>
                <li class="input_five label fl">
                  <input type="text" class="common_input datepicker fl required date" id="investmentDate" readonly="readonly" name="investmentDate" value="${assetFixedDeposit.commcementDate}"/>
                </li>
                
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
               <li class="title_six label fl">Amount Deposited</li>
                <li class="title_seven label fl">Maturity Date</li>
                <li class="title_eight label fl">Maturity Value</li>
                <li class="title_nine label fl">Interest Rate(%)</li>
                <li class="title_ten label fl">Current Balance</li>
              
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
              <li class="input_six label fl">
                  <input type="text" class="common_input required number" id="investmentValue" name="investmentValue" value="${assetFixedDeposit.monthlyDeposited}"/>
                </li>
                <li class="input_seven label fl"></li>
                <li class="input_eight label fl">
                  <input type="text" class="common_input datepickerEnd fl required date" readonly="readonly" id="maturityDate" name="maturityDate" onchange="compareDate();" value="${assetFixedDeposit.maturityDate}"/>
                </li>
                <li class="input_nine label fl">
                  <input type="text" class="common_input required mynumber" id="maturityAmount" name="maturityAmount" value="${assetFixedDeposit.maturityValue}"/>
                </li>
                <li class="input_ten label fl">
                  <input type="text" class="common_input required number" name="interestRate" value="${assetFixedDeposit.interestRate}"/>
                </li>
                <li class="input_eleven label fl">
                  <input type="text" class="common_input required mynumber" id="currentValue" name="currentValue" value="${assetFixedDeposit.currentBalance}"/>
                </li>
                
              </ul>
              <c:choose>
             <c:when test="${partyAssetId gt 0 }">
              <ul class="clearfix head_title third_level_heading reset">
               <li class="title_eleven label fl linked_goal_header">No. of Linked Goals</li>
              </ul>
              <ul class="clearfix data_inputs third_level_inputs reset">
               
                <li class="input_twelve label fl">
                  <c:choose>
                <c:when test="${fn:length(linkedGoals) > 0}">
                  <c:forEach items="${linkedGoals}" var="linkedGoal" varStatus="counter">
                  <c:choose>
                  <c:when test="${linkedGoal.goalTypeId eq '35001'}">
                  <div class="fl education_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Education</span>
                  </div>
                  </c:when>
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35005'}">
                  <div class="fl travel_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Travel</span>
                  </div>
                  </c:when>
                 
                 <c:when test="${linkedGoal.goalTypeId eq '35004'}"> 
              <div class="fl wedding_goal_icon goal_icon">
              <div class="bg"></div>
              <span class="icon_label">Wedding</span>
             
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35006'}">
                  <div class="fl car_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Car</span>
                  </div>
                 </c:when> 
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35003'}">
              <div class="fl property_goal_icon goal_icon">
                <div class="bg"></div>
              <span class="icon_label">Property</span>
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35012'}">
            <div class="fl business_goal_icon goal_icon">
                <div class="bg"></div>
            <span class="icon_label">Business</span>
            </div>
            </c:when>
            
            <c:when test="${linkedGoal.goalTypeId eq '35008'}">
           <div class="fl special_goal_icon goal_icon">
             <div class="bg"></div>
           <span class="icon_label">Special</span>
           </div>
           </c:when>
           
           <c:when test="${linkedGoal.goalTypeId eq '35013'}">
          <div class="fl other_goal_icon goal_icon">
            <div class="bg"></div>
          <span class="icon_label">Other</span>
          </div>
          </c:when>
          </c:choose>
         </c:forEach>
         </c:when>
         <c:otherwise>
         	<p>No Linked Goals To Deposit</p>
         </c:otherwise>
         </c:choose>
                  <div class="clr"></div>
                </li>
              </ul>
              </c:when>
              </c:choose>
            </div>
            </form:form>
          <form:form id="assetRD" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
          <input name="assetTypeId" type="hidden" value="48053"/>
          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
          <input type="hidden" id="assetPage" name="assetPage" value="1"/>
          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="rd"/>
          <c:if test="${not(empty assetRecurringDeposit) and not(empty assetRecurringDeposit.partyAssetId)}">
          	<input type="hidden" id="partyAssetId" name="partyAssetId" value="${assetRecurringDeposit.partyAssetId}"/>
          </c:if>
            <div class="rd_box dynamic_box hide">
              <ul class="clearfix head_title first_level_heading reset">
                <li class="title_one label fl">Owner</li>
                <li class="title_two label fl">Asset Name</li>
                <li class="title_three label fl">Bank Name</li>
                <li class="title_four label fl">A/C No.</li>
                <li class="title_five label fl">Commencement Date</li>
               
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
                <li class="input_one label fl">
                  <select class="required" id="ownerPartyId_48053" name="ownerPartyId">
                  </select>
                </li>
                <li class="input_two label fl">
                  <input type="text" class="common_input required" name="assetName" value="${assetRecurringDeposit.assetName}" autocomplete="off"/>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input required" name="bankName" value="${assetRecurringDeposit.bankName}" autocomplete="off"/>
                </li>
                <li class="input_four label fl">
                  <input type="text" class="common_input required digits" name="accountNo" value="${assetRecurringDeposit.accountNumber}" autocomplete="off"/>
                </li>
                <li class="input_five label fl">
                  <input type="text" class="common_input datepicker fl required date" readonly="readonly" id="investmentDateRD" name="investmentDate" value="${assetRecurringDeposit.commcementDate}"/>
                </li>
                
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
               <li class="title_six label fl">Monthly Deposited</li>
                <li class="title_seven label fl">Maturity Date</li>
                <li class="title_eight label fl">Maturity Value</li>
                <li class="title_nine label fl">Interest Rate(%)</li>
                <li class="title_ten label fl">Current Balance</li>
              
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
              <li class="input_six label fl">
                  <input type="text" class="common_input required number" id="sipAmount" name="sipAmount" value="${assetRecurringDeposit.sipAmount}"/>
                </li>
                <li class="input_seven label fl"></li>
                <li class="input_eight label fl">
                  <input type="text" class="common_input datepickerEnd fl required date" readonly="readonly" id="maturityDateRD" name="maturityDate" onchange="compareDate1();" value="${assetRecurringDeposit.maturityDate}"/>
                </li>
                <li class="input_nine label fl">
                  <input type="text" class="common_input required mynumber" id="maturityAmount" name="maturityAmount" value="${assetRecurringDeposit.maturityValue}"/>
                </li>
                <li class="input_ten label fl">
                  <input type="text" class="common_input required number" name="interestRate" value="${assetRecurringDeposit.interestRate}"/>
                </li>
                <li class="input_eleven label fl">
                  <input type="text" class="common_input required mynumber" id="currentValue" name="currentValue" value="${assetRecurringDeposit.currentBalance}"/>
                </li>
                
              </ul>
              <c:choose>
             <c:when test="${partyAssetId gt 0 }">
              <ul class="clearfix head_title third_level_heading reset">
               <li class="title_eleven label fl">No. of Linked Goals</li>
              </ul>
              <ul class="clearfix data_inputs third_level_inputs reset">
               
                <li class="input_twelve label fl">
                  <c:choose>
                <c:when test="${fn:length(linkedGoals) > 0}">
                  <c:forEach items="${linkedGoals}" var="linkedGoal" varStatus="counter">
                  <c:choose>
                  <c:when test="${linkedGoal.goalTypeId eq '35001'}">
                  <div class="fl education_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Education</span>
                  </div>
                  </c:when>
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35005'}">
                  <div class="fl travel_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Travel</span>
                  </div>
                  </c:when>
                 
                 <c:when test="${linkedGoal.goalTypeId eq '35004'}"> 
              <div class="fl wedding_goal_icon goal_icon">
              <div class="bg"></div>
              <span class="icon_label">Wedding</span>
             
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35006'}">
                  <div class="fl car_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Car</span>
                  </div>
                 </c:when> 
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35003'}">
              <div class="fl property_goal_icon goal_icon">
                <div class="bg"></div>
              <span class="icon_label">Property</span>
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35012'}">
            <div class="fl business_goal_icon goal_icon">
                <div class="bg"></div>
            <span class="icon_label">Business</span>
            </div>
            </c:when>
            
            <c:when test="${linkedGoal.goalTypeId eq '35008'}">
           <div class="fl special_goal_icon goal_icon">
             <div class="bg"></div>
           <span class="icon_label">Special</span>
           </div>
           </c:when>
           
           <c:when test="${linkedGoal.goalTypeId eq '35013'}">
          <div class="fl other_goal_icon goal_icon">
            <div class="bg"></div>
          <span class="icon_label">Other</span>
          </div>
          </c:when>
          </c:choose>
         </c:forEach>
         </c:when>
         <c:otherwise>
         	<p>No Linked Goals To Deposit</p>
         </c:otherwise>
         </c:choose>
                  <div class="clr"></div>
                </li>
              </ul>
              </c:when>
              </c:choose>
            </div>
            </form:form>
          <form:form id="assetSavings" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
          <input name="assetTypeId" type="hidden" value="48052"/>
          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
          <input type="hidden" id="assetPage" name="assetPage" value="1"/>
          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="saving"/>
          <c:if test="${not(empty assetSavingDeposit) and not(empty assetSavingDeposit.partyAssetId)}">
          	<input type="hidden" id="partyAssetId" name="partyAssetId" value="${assetSavingDeposit.partyAssetId}"/>
          </c:if>
            <div class="savings_box dynamic_box hide">
              <ul class="clearfix head_title first_level_heading reset">
                <li class="title_one label fl">Owner</li>
                <li class="title_two label fl">Asset Name</li>
                <li class="title_three label fl">Bank Name</li>
                <li class="title_four label fl">A/C No.</li>
                <li class="title_five label fl">Interest Rate(%)</li>               
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
                <li class="input_one label fl">
                  <select class="required" id="ownerPartyId_48052" name="ownerPartyId">
                  </select>
                </li>
                <li class="input_two label fl">
                  <input type="text" class="common_input required" name="assetName" value="${assetSavingDeposit.assetName}" autocomplete="off"/>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input required" name="bankName" value="${assetSavingDeposit.bankName}" autocomplete="off"/>
                </li>
                
                <li class="input_four label fl">
                  <input type="text" class="common_input required digits" name="accountNo" value="${assetSavingDeposit.accountNumber}" autocomplete="off"/>
                </li>
                <li class="input_five label fl">
                  <input type="text" class="common_input required number" name="interestRate" value="${assetSavingDeposit.interestRate}"/>
                </li>
              </ul>
             
              <ul class="clearfix head_title second_level_heading reset">
              
              
                <!-- <li class="title_four label fl">A/C No.</li> -->
                <li class="title_six label fl">Current Balance</li>
              
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
             
               
               <%-- <li class="input_four label fl">
                  <input type="text" class="common_input required digits" name="accountNo" value="${assetSavingDeposit.accountNumber}"/>
                </li> --%>
             
                <li class="input_six label fl">
                  <input type="text" class="common_input required mynumber" id="currentValue" name="currentValue" value="${assetSavingDeposit.currentBalance}"/>
                </li>
                
              </ul>
              <c:choose>
             <c:when test="${partyAssetId gt 0 }">
              <ul class="clearfix head_title third_level_heading reset">
               <li class="title_eleven label fl">No. of Linked Goals</li>
              </ul>
              <ul class="clearfix data_inputs third_level_inputs reset">
               
                <li class="input_twelve label fl">
                  <c:choose>
                <c:when test="${fn:length(linkedGoals) > 0}">
                  <c:forEach items="${linkedGoals}" var="linkedGoal" varStatus="counter">
                  <c:choose>
                  <c:when test="${linkedGoal.goalTypeId eq '35001'}">
                  <div class="fl education_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Education</span>
                  </div>
                  </c:when>
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35005'}">
                  <div class="fl travel_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Travel</span>
                  </div>
                  </c:when>
                 
                 <c:when test="${linkedGoal.goalTypeId eq '35004'}"> 
              <div class="fl wedding_goal_icon goal_icon">
              <div class="bg"></div>
              <span class="icon_label">Wedding</span>
             
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35006'}">
                  <div class="fl car_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Car</span>
                  </div>
                 </c:when> 
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35003'}">
              <div class="fl property_goal_icon goal_icon">
                <div class="bg"></div>
              <span class="icon_label">Property</span>
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35012'}">
            <div class="fl business_goal_icon goal_icon">
                <div class="bg"></div>
            <span class="icon_label">Business</span>
            </div>
            </c:when>
            
            <c:when test="${linkedGoal.goalTypeId eq '35008'}">
           <div class="fl special_goal_icon goal_icon">
             <div class="bg"></div>
           <span class="icon_label">Special</span>
           </div>
           </c:when>
           
           <c:when test="${linkedGoal.goalTypeId eq '35013'}">
          <div class="fl other_goal_icon goal_icon">
            <div class="bg"></div>
          <span class="icon_label">Other</span>
          </div>
          </c:when>
          </c:choose>
         </c:forEach>
         </c:when>
         <c:otherwise>
         	<p>No Linked Goals To Deposit</p>
         </c:otherwise>
         </c:choose>
                  <div class="clr"></div>
                </li>
              </ul>
              </c:when>
              </c:choose>
            </div>
         </form:form>   
          </div>
        </section>
        <!-- Common_in_contnet ends-->
        
        <div class="overlay"></div>
      </section>
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <!--<li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>-->
            
            <li class="fl list"><a href="#" class="anch save_new" id="saveAdd"><span class="txt">Save &amp; Add</span></a></li>
           <li class="fl list"><a href="#" class="anch save_close" id="saveClose"><span class="txt">Save &amp; Close</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"  id="cancel" onclick="doAction('${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0?assetPage=1');"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
        <!-- <a href="list-of-tasks.html" class="back navgation"><span class="txt">Back</span></a> <a href="list-of-tasks.html" class="next navgation"><span class="txt">Next</span></a>--> </section>
      
      <!-- Common footer ends --> 
    </section>
    <!-- Common_content Ends--> 
    <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<!-- For Common Custom File Input--> 
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-filestyle.js"></script> 
<!-- For Common Custom File Input Ends-->
</body>
</html>
