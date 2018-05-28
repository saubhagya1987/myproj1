<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>
<style>
#assetPPF label[for="currentValue"]{top: -44px;}
#assetPPF label[for="sipAmount"]{top: -44px;}

#assetEPF label[for="currentValue"]{top: -44px;}
#assetEPF label[for="sipAmount"]{top: -44px;}

#assetPP label[for="currentValue"]{top: -44px;}
#assetPP label[for="sipAmount"]{top: -44px;}

#assetNPS label[for="currentValue"]{top: -44px;}
#assetNPS label[for="sipAmount"]{top: -44px;}

#assetOthers label[for="currentValue"]{top: -44px;}
#assetOthers label[for="sipAmount"]{top: -44px;}	
</style>	
<!-- Datepicker -->
<script>
$(function() {
	  $( ".datepicker" ).datepicker({
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

var oldValuesppf = [];
var oldValuesepf = [];
var oldValuespp = [];
var oldValuesnps = [];
var oldValuesothers = [];
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
		var x = document.getElementById("assetPPF");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuesppf[i] = x.elements[i].value;
	    }
    }
	});
	
	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetEPF");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuesepf[i] = x.elements[i].value;
	    }
    }
	});
	
	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetPP");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuespp[i] = x.elements[i].value;
	    }
    }
	});
	
	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetNPS");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuesnps[i] = x.elements[i].value;
	    }
    }
	});
	
	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetOthers");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValuesothers[i] = x.elements[i].value;
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
if( saveAddFlag == "epf" ){
	$("#epf").attr("checked",true);
	$.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".rd_box").fadeIn("slow");
		   });
}else if( saveAddFlag == "pp" ){
	$("#pp").attr("checked",true);
	$.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".pp_box").fadeIn("slow");
		   });
}else if( saveAddFlag == "nps" ){
	$("#nps").attr("checked",true);
	$.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".nps_box").fadeIn("slow");
		   });
}else if( saveAddFlag == "others" ){
	$("#others").attr("checked",true);
	$.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".others_box").fadeIn("slow");
		   });
}else if( saveAddFlag == "ppf" ){
	$("#ppf").attr("checked",true);
	$.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".fd_box").fadeIn("slow");
		   });
}

 $('.wrapper').addClass("add_assets_retirement_funds_wrapper add_assets");
 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
  $('.common_in_content').slimScroll();
     $("select").selectBoxIt();
	 $("#ppf").click(function(){
	if(!($(".fd_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".fd_box").fadeIn("slow");
	   });
   }
}); 
 $("#epf").click(function(){
    if(!($(".rd_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".rd_box").fadeIn("slow");
	   });
   }

});
 $("#pp").click(function(){
	    if(!($(".pp_box").is(":visible")))
	   {
	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".pp_box").fadeIn("slow");
		   });
	   }

	});
 $("#nps").click(function(){
	    if(!($(".nps_box").is(":visible")))
	   {
	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".nps_box").fadeIn("slow");
		   });
	   }

	});
 $("#others").click(function(){
	    if(!($(".others_box").is(":visible")))
	   {
	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".others_box").fadeIn("slow");
		   });
	   }

	});
 

$("body").on("click", "#saveAdd", function() {
	
	 	if($('#ppf').is(':checked')){
	 	    
	 		if($('#assetPPF').validate().form()){
	 	    	 if(checkChangeDataPPF()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
    	    			$('#assetPPF').submit();
    	    			cntrSave++;
		 			}
	 	    	 }
	 	   	}
	 	  }
	 	  else if($('#epf').is(':checked')){
	 		 if($('#assetEPF').validate().form()){
	 	    	 if(checkChangeDataEPF()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
    	    			$('#assetEPF').submit();
    	    			cntrSave++;
		 			}	  
	 	    	 }
	 	  }
	 	  }
	 	 else if($('#pp').is(':checked')){
	 		 if($('#assetPP').validate().form()){
	 	    	 if(checkChangeDataPP()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
    	    			$('#assetPP').submit();
    	    			cntrSave++;
		 			}	  
	 	    	 }
	 	  }
	 	  }
	 	else if($('#nps').is(':checked')){
	 		 if($('#assetNPS').validate().form()){
	 	    	 if(checkChangeDataNPS()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
   	    			$("#saveClose").addClass("inactiveLink");
   	    			$('#assetNPS').submit();
   	    			cntrSave++;
		 			}	  
	 	    	 }
	 	  }
	 	  }
	 	else{
	 		 if($('#assetOthers').validate().form()){
	 	    	 if(checkChangeDataOthers()){
	 	    		if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
   	    			$("#saveClose").addClass("inactiveLink");
   	    			$('#assetOthers').submit();
   	    			cntrSave++;
		 			}	  
	 	    	 }
	 	  }
	 	  }
	  	  
	    });
	    
$("body").on("click", "#saveClose", function() {
	
 	if($('#ppf').is(':checked')){
 	    
 		if($('#assetPPF').validate().form()){
	    	 if(checkChangeDataPPF()){
	    		 if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
 	    			$("#saveClose").addClass("inactiveLink");
 	    			$('#assetPPF').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
 	 				$('#assetPPF').submit();
 	    			cntrSave++;
		 			}
	    	 }
 	   	}
 	  }
 	  else if($('#epf').is(':checked')){
 		 if($('#assetEPF').validate().form()){
 	    	 if(checkChangeDataEPF()){
 	    		if(cntrSave==1){
	 				$("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	    			$('#assetEPF').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
	  	 		  $('#assetEPF').submit();
	    			cntrSave++;
	 			}
 	    	 }
 	  }
 	  }
 	 else if($('#pp').is(':checked')){
 		 if($('#assetPP').validate().form()){
 	    	 if(checkChangeDataPP()){
 	    		if(cntrSave==1){
	 				$("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	    			$('#assetPP').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
	  	 		  $('#assetPP').submit();
	    			cntrSave++;
	 			}
 	    	 }
 	  }
 	  }
 	else if($('#nps').is(':checked')){
		 if($('#assetNPS').validate().form()){
	    	 if(checkChangeDataNPS()){
	    		if(cntrSave==1){
	 				$("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	    			$('#assetNPS').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
	  	 		  $('#assetNPS').submit();
	    			cntrSave++;
	 			}
	    	 }
	  }
	  }
 	else {
		 if($('#assetOthers').validate().form()){
	    	 if(checkChangeDataOthers()){
	    		if(cntrSave==1){
	 				$("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	    			$('#assetOthers').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
	  	 		  $('#assetOthers').submit();
	    			cntrSave++;
	 			}
	    	 }
	  }
	  }
  	  
    });
    
/* $("body").on("click", "#cancel", function() {
	$('#assetCancel').submit();
}); */
$("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
$("#epf_owner").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#epf_owner").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
$("#pp_owner").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#pp_owner").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
$("#nps_owner").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#nps_owner").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
$("#others_owner").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#others_owner").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});

<c:choose>
<c:when test="${not(empty addPPF)}">
	if(!($(".fd_box").is(":visible")))
	   {
	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".fd_box").fadeIn("slow");
		   });
	   }
	$("#epf").addClass("inactiveLink");
	$("#epf").attr("disabled", true);
	$("#pp").addClass("inactiveLink");
	$("#pp").attr("disabled", true);
	$("#nps").addClass("inactiveLink");
	$("#nps").attr("disabled", true);
	$("#others").addClass("inactiveLink");
	$("#others").attr("disabled", true);
	var selectBox1 = $("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt');			    
	selectBox1.selectOption('${addPPF.ownerPartyId}');
</c:when>
<c:when test="${not(empty addEPF)}">
	$("#ppf").removeAttr("checked");
	$("#epf").attr("checked",true);
	if(!($(".rd_box").is(":visible")))
	   {
	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".rd_box").fadeIn("slow");
		   });
	   }
	$("#ppf").addClass("inactiveLink");
	$("#ppf").attr("disabled", true);
	$("#pp").addClass("inactiveLink");
	$("#pp").attr("disabled", true);
	$("#nps").addClass("inactiveLink");
	$("#nps").attr("disabled", true);
	$("#others").addClass("inactiveLink");
	$("#others").attr("disabled", true);
	var selectBox1 = $("#epf_owner").selectBoxIt().data('selectBox-selectBoxIt');			    
	selectBox1.selectOption('${addEPF.ownerPartyId}');
</c:when>
<c:when test="${not(empty addPP)}">
$("#ppf").removeAttr("checked");
$("#pp").attr("checked",true);
if(!($(".pp_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".pp_box").fadeIn("slow");
	   });
   }
$("#ppf").addClass("inactiveLink");
$("#ppf").attr("disabled", true);
$("#epf").addClass("inactiveLink");
$("#epf").attr("disabled", true);
$("#nps").addClass("inactiveLink");
$("#nps").attr("disabled", true);
$("#others").addClass("inactiveLink");
$("#others").attr("disabled", true);
var selectBox1 = $("#pp_owner").selectBoxIt().data('selectBox-selectBoxIt');			    
selectBox1.selectOption('${addPP.ownerPartyId}');
</c:when>
<c:when test="${not(empty addNPS)}">
$("#ppf").removeAttr("checked");
$("#nps").attr("checked",true);
if(!($(".nps_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".nps_box").fadeIn("slow");
	   });
   }
$("#ppf").addClass("inactiveLink");
$("#ppf").attr("disabled", true);
$("#epf").addClass("inactiveLink");
$("#epf").attr("disabled", true);
$("#pp").addClass("inactiveLink");
$("#pp").attr("disabled", true);
$("#others").addClass("inactiveLink");
$("#others").attr("disabled", true);
var selectBox1 = $("#nps_owner").selectBoxIt().data('selectBox-selectBoxIt');			    
selectBox1.selectOption('${addNPS.ownerPartyId}');
</c:when>
<c:when test="${not(empty addOthers)}">
$("#ppf").removeAttr("checked");
$("#others").attr("checked",true);
if(!($(".others_box").is(":visible")))
   {
   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
       $(".others_box").fadeIn("slow");
	   });
   }
$("#ppf").addClass("inactiveLink");
$("#ppf").attr("disabled", true);
$("#epf").addClass("inactiveLink");
$("#epf").attr("disabled", true);
$("#pp").addClass("inactiveLink");
$("#pp").attr("disabled", true);
$("#nps").addClass("inactiveLink");
$("#nps").attr("disabled", true);
var selectBox1 = $("#others_owner").selectBoxIt().data('selectBox-selectBoxIt');			    
selectBox1.selectOption('${addOthers.ownerPartyId}');
</c:when>
</c:choose>

$("li").addClass("rel");

$("#assetPPF").validate({ignore:'', rules:{sipAmount:{min:1}, currentValue:{min:1}}});

$("#assetEPF").validate({ignore:'', rules:{sipAmount:{min:1}, currentValue:{min:1}}});

$("#assetPP").validate({ignore:'', rules:{sipAmount:{min:1}, currentValue:{min:1}}});

$("#assetNPS").validate({ignore:'', rules:{sipAmount:{min:1}, currentValue:{min:1}}});

$("#assetOthers").validate({ignore:'', rules:{sipAmount:{min:1}, currentValue:{min:1}}});

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
	if($('#ppf').is(':checked')){
		x = document.getElementById("assetPPF");
		oldValues = oldValuesppf;
	}else if($('#epf').is(':checked')){
		x = document.getElementById("assetEPF");
		oldValues = oldValuesepf;
	}else if($('#pp').is(':checked')){
		x = document.getElementById("assetPP");
		oldValues = oldValuespp;
	}else if($('#nps').is(':checked')){
		x = document.getElementById("assetNPS");
		oldValues = oldValuesnps;
	}else{
		x = document.getElementById("assetOthers");
		oldValues = oldValuesothers;
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

function checkChangeDataPPF(){
	var x = document.getElementById("assetPPF");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuesppf[i] != x.elements[i].value && x.elements[i].id!="refer"){
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

function checkChangeDataEPF(){
	var x = document.getElementById("assetEPF");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuesepf[i] != x.elements[i].value && x.elements[i].id!="refer"){
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

function checkChangeDataPP(){
	var x = document.getElementById("assetPP");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuespp[i] != x.elements[i].value && x.elements[i].id!="refer"){
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

function checkChangeDataNPS(){
	var x = document.getElementById("assetNPS");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuesnps[i] != x.elements[i].value && x.elements[i].id!="refer"){
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

function checkChangeDataOthers(){
	var x = document.getElementById("assetOthers");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuesothers[i] != x.elements[i].value && x.elements[i].id!="refer"){
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
			<!-- Common_content Starts-->
			<section class="content common_content">
			<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
				<section class="in_content common_in_content">
					<!-- Common_in_contnet starts-->
					<section id="add_assets_retirement_funds"
						class="in_content common_in_content clearfix">
						<div class="clearfix top_btn">
							<div class="add_fd_btn btn fl">
								<input name="pf" type="radio" value="" id="ppf" checked="">
								<label for="ppf">Public Provident Fund (PPF)</label>
							</div>
							<div class="add_rd_btn btn fl westspace2">
								<input name="pf" type="radio" value="" id="epf"> <label
									for="epf">Employee Provident Fund (EPF)</label>
							</div>
							<div class="add_pp_btn btn fl westspace2">
								<input name="pf" type="radio" value="" id="pp"> <label
									for="pp">Pension Plans(PP)</label>
							</div>
							<div class="add_nps_btn btn fl westspace2">
								<input name="pf" type="radio" value="" id="nps"> <label
									for="nps">National Pension Schemes(NPS)</label>
							</div>
							<div class="add_others_btn btn fl westspace2">
								<input name="pf" type="radio" value="" id="others"> <label
									for="others">Others</label>
							</div>

						</div>
						<div class="continer_parent">
						<%-- <form:form id="assetCancel" method="POST" action="${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0">
        			</form:form> --%>
        			<form:form id="assetPPF" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
			          <input name="assetTypeId" type="hidden" value="48008"/>
			          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
			          <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
			          <input type="hidden" id="assetPage" name="assetPage" value="2"/>
			          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="ppf"/>
			          <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
        				<div id="page_loader"></div>			          
							<div class="fd_box dynamic_box">
								<ul class="clearfix head_title first_level_heading reset">
									<li class="title_one label fl">Owner</li>
									<li class="title_two label fl">Description</li>
									<li class="title_three label fl">Maturity Date</li>
									<li class="title_five label fl">Annual contribution</li>

								</ul>

								<ul class="clearfix data_inputs first_level_inputs reset">
									<li class="input_one label fl">
										<select id="ownerPartyId" class="required" name="ownerPartyId">
										</select>
									</li>
									<li class="input_two label fl">
										<input type="text" class="common_input required" name="assetName" value="${addPPF.assetName}" />
									</li>
									<li class="input_three label fl">
										<input type="text" class="common_input datepicker fl required date" readonly="readonly" name="maturityDate" value="${addPPF.maturityDate}" />
									</li>
									<li class="input_six label fl"><input type="text"
										class="common_input required mynumber" id="sipAmount" name="sipAmount" value="${addPPF.sipAmount}" /></li>

								</ul>

								<ul class="clearfix head_title second_level_heading reset">
									<!-- <li class="title_six label fl">Growth Rate(%)</li> -->
									<li class="title_seven label fl">Current Balance</li>




								</ul>


								<ul class="clearfix data_inputs second_level_inputs reset">


									<%-- <li class="input_eight label fl"><input type="text"
										class="common_input required number" name="interestRate" value="${addPPF.interestRate}" /></li> --%>

									<li class="input_nine label fl"><input type="text"
										class="common_input required mynumber" id="currentValue" name="currentValue" value="${addPPF.currentBalance}" /></li>




								</ul>

<c:choose>
             <c:when test="${partyAssetId gt 0 }">
								<ul class="clearfix head_title third_level_heading reset">
									<li class="title_eleven label fl linked_goal_header">No.
										of Linked Goals</li>
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
         	<p>No Linked Goals To Retirement Funds</p>
         </c:otherwise>
         </c:choose>
										<div class="clr"></div>
									</li>
								</ul>
								</c:when>
								</c:choose>
							</div>
							</form:form>
							<form:form id="assetEPF" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
					          <input name="assetTypeId" type="hidden" value="48012"/>
					          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
					          <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
					          <input type="hidden" id="assetPage" name="assetPage" value="2"/>
					          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="epf"/>
							<div class="rd_box dynamic_box hide">
								<ul class="clearfix head_title first_level_heading reset">
									<li class="title_one label fl">Owner</li>
									<li class="title_two label fl">Description</li>
									<li class="title_three label fl">Maturity Date</li>
									<li class="title_five label fl">Annual contribution</li>


								</ul>

								<ul class="clearfix data_inputs first_level_inputs reset">
									<li class="input_one label fl"><select id="epf_owner" class="required"
										name="ownerPartyId">
									</select></li>
									<li class="input_two label fl"><input type="text"
										class="common_input required" name="assetName" value="${addEPF.assetName}" /></li>
									<li class="input_three label fl"><input type="text"
										class="common_input datepicker fl required date" readonly="readonly" name="maturityDate" value="${addEPF.maturityDate}" /></li>
									<li class="input_six label fl"><input type="text"
										class="common_input required mynumber" id="sipAmount" name="sipAmount" value="${addEPF.sipAmount}" /></li>


								</ul>

								<ul class="clearfix head_title second_level_heading reset">
									<!-- <li class="title_six label fl">Growth Rate(%)</li> -->
									<li class="title_seven label fl">Current Balance</li>




								</ul>

								<ul class="clearfix data_inputs second_level_inputs reset">
									

									<%-- <li class="input_eight label fl"><input type="text"
										class="common_input required number" name="interestRate" value="${addEPF.interestRate}" /></li> --%>

									<li class="input_nine label fl"><input type="text"
										class="common_input required mynumber" id="currentValue" name="currentValue" value="${addEPF.currentBalance}" /></li>




								</ul>
<c:choose>
             <c:when test="${partyAssetId gt 0 }">

								<ul class="clearfix head_title third_level_heading reset">
									<li class="title_eleven label fl linked_goal_header">No.
										of Linked Goals</li>
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
         	<p>No Linked Goals To Retirement Funds</p>
         </c:otherwise>
         </c:choose>
										<div class="clr"></div>
									</li>
								</ul>
								</c:when>
								</c:choose>
							</div>
							</form:form>
							<form:form id="assetPP" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
			          <input name="assetTypeId" type="hidden" value="48061"/>
			          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
			          <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
			          <input type="hidden" id="assetPage" name="assetPage" value="2"/>
			          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="pp"/>
			          <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>			          
							<div class="pp_box dynamic_box hide">
								<ul class="clearfix head_title first_level_heading reset">
									<li class="title_one label fl">Owner</li>
									<li class="title_two label fl">Description</li>
									<li class="title_three label fl">Maturity Date</li>
									<li class="title_five label fl">Annual contribution</li>

								</ul>

								<ul class="clearfix data_inputs first_level_inputs reset">
									<li class="input_one label fl">
										<select id="pp_owner" class="required" name="ownerPartyId">
										</select>
									</li>
									<li class="input_two label fl">
										<input type="text" class="common_input required" name="assetName" value="${addPP.assetName}" />
									</li>
									<li class="input_three label fl">
										<input type="text" class="common_input datepicker fl required date" readonly="readonly" name="maturityDate" value="${addPP.maturityDate}" />
									</li>
									<li class="input_six label fl"><input type="text"
										class="common_input required mynumber" id="sipAmount" name="sipAmount" value="${addPP.sipAmount}" /></li>

								</ul>

								<ul class="clearfix head_title second_level_heading reset">
									<!-- <li class="title_six label fl">Growth Rate(%)</li> -->
									<li class="title_seven label fl">Current Balance</li>




								</ul>


								<ul class="clearfix data_inputs second_level_inputs reset">


									<%-- <li class="input_eight label fl"><input type="text"
										class="common_input required number" name="interestRate" value="${addPPF.interestRate}" /></li> --%>

									<li class="input_nine label fl"><input type="text"
										class="common_input required mynumber" id="currentValue" name="currentValue" value="${addPP.currentBalance}" /></li>




								</ul>

<c:choose>
             <c:when test="${partyAssetId gt 0 }">
								<ul class="clearfix head_title third_level_heading reset">
									<li class="title_eleven label fl linked_goal_header">No.
										of Linked Goals</li>
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
         	<p>No Linked Goals To Retirement Funds</p>
         </c:otherwise>
         </c:choose>
										<div class="clr"></div>
									</li>
								</ul>
								</c:when>
								</c:choose>
							</div>
							</form:form>
							<form:form id="assetNPS" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
			          <input name="assetTypeId" type="hidden" value="48062"/>
			          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
			          <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
			          <input type="hidden" id="assetPage" name="assetPage" value="2"/>
			          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="nps"/>
			          <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>          
							<div class="nps_box dynamic_box hide">
								<ul class="clearfix head_title first_level_heading reset">
									<li class="title_one label fl">Owner</li>
									<li class="title_two label fl">Description</li>
									<li class="title_three label fl">Maturity Date</li>
									<li class="title_five label fl">Investment Amount</li>

								</ul>

								<ul class="clearfix data_inputs first_level_inputs reset">
									<li class="input_one label fl">
										<select id="nps_owner" class="required" name="ownerPartyId">
										</select>
									</li>
									<li class="input_two label fl">
										<input type="text" class="common_input required" name="assetName" value="${addNPS.assetName}" />
									</li>
									<li class="input_three label fl">
										<input type="text" class="common_input datepicker fl required date" readonly="readonly" name="maturityDate" value="${addNPS.maturityDate}" />
									</li>
									<li class="input_six label fl"><input type="text"
										class="common_input required mynumber" id="sipAmount" name="sipAmount" value="${addNPS.sipAmount}" /></li>

								</ul>

								<ul class="clearfix head_title second_level_heading reset">
									<!-- <li class="title_six label fl">Growth Rate(%)</li> -->
									<li class="title_seven label fl">Current Balance</li>




								</ul>


								<ul class="clearfix data_inputs second_level_inputs reset">


									<%-- <li class="input_eight label fl"><input type="text"
										class="common_input required number" name="interestRate" value="${addPPF.interestRate}" /></li> --%>

									<li class="input_nine label fl"><input type="text"
										class="common_input required mynumber" id="currentValue" name="currentValue" value="${addNPS.currentBalance}" /></li>




								</ul>

<c:choose>
             <c:when test="${partyAssetId gt 0 }">
								<ul class="clearfix head_title third_level_heading reset">
									<li class="title_eleven label fl linked_goal_header">No.
										of Linked Goals</li>
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
         	<p>No Linked Goals To Retirement Funds</p>
         </c:otherwise>
         </c:choose>
										<div class="clr"></div>
									</li>
								</ul>
								</c:when>
								</c:choose>
							</div>
							</form:form>
							<form:form id="assetOthers" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
			          <input name="assetTypeId" type="hidden" value="48063"/>
			          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
			          <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
			          <input type="hidden" id="assetPage" name="assetPage" value="2"/>
			          <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="others"/>
			          <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>			          
							<div class="others_box dynamic_box hide">
								<ul class="clearfix head_title first_level_heading reset">
									<li class="title_one label fl">Owner</li>
									<li class="title_two label fl">Description</li>
									<li class="title_three label fl">Maturity Date</li>
									<li class="title_five label fl">Annual contribution</li>

								</ul>

								<ul class="clearfix data_inputs first_level_inputs reset">
									<li class="input_one label fl">
										<select id="others_owner" class="required" name="ownerPartyId">
										</select>
									</li>
									<li class="input_two label fl">
										<input type="text" class="common_input required" name="assetName" value="${addOthers.assetName}" />
									</li>
									<li class="input_three label fl">
										<input type="text" class="common_input datepicker fl required date" readonly="readonly" name="maturityDate" value="${addOthers.maturityDate}" />
									</li>
									<li class="input_six label fl"><input type="text"
										class="common_input required mynumber" id="sipAmount" name="sipAmount" value="${addOthers.sipAmount}" /></li>

								</ul>

								<ul class="clearfix head_title second_level_heading reset">
									<!-- <li class="title_six label fl">Growth Rate(%)</li> -->
									<li class="title_seven label fl">Current Balance</li>




								</ul>


								<ul class="clearfix data_inputs second_level_inputs reset">


									<%-- <li class="input_eight label fl"><input type="text"
										class="common_input required number" name="interestRate" value="${addPPF.interestRate}" /></li> --%>

									<li class="input_nine label fl"><input type="text"
										class="common_input required mynumber" id="currentValue" name="currentValue" value="${addOthers.currentBalance}" /></li>




								</ul>

<c:choose>
             <c:when test="${partyAssetId gt 0 }">
								<ul class="clearfix head_title third_level_heading reset">
									<li class="title_eleven label fl linked_goal_header">No.
										of Linked Goals</li>
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
         	<p>No Linked Goals To Retirement Funds</p>
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

							<li class="fl list"><a href="#" class="anch save_new" id="saveAdd"><span
									class="txt">Save &amp; Add</span></a></li>
							<li class="fl list"><a href="#" class="anch save_close" id="saveClose"><span
									class="txt">Save &amp; Close</span></a></li>
							<li class="fl list"><a href="#" class="anch cancel" id="cancel" onclick="doAction('${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0?assetPage=2');"><span
									class="txt">Cancel</span></a></li>
						</ul>
					</div>
					<!-- <a href="list-of-tasks.html" class="back navgation"><span class="txt">Back</span></a> <a href="list-of-tasks.html" class="next navgation"><span class="txt">Next</span></a>-->
				</section>

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
	<script
		src="${pageContext.request.contextPath}/resources/js/plugin/jquery-filestyle.js"></script>
	<!-- For Common Custom File Input Ends-->
</body>
</html>
