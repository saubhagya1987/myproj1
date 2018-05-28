<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
<style>
#assetGold label[for="currentValue"]{top: -44px;}
#assetGold label[for="investmentValue"]{top: -44px;}
</style>	
<script>
$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true
     });
  });
  
jQuery.validator.addMethod("mynumber", function (value, element) {
    return this.optional(element) || /^(\d+|\d+,\d{1,2})$/.test(value);
}, "Please enter only digits"); 
  </script>

<script>

var oldValues = [];
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
		var x = document.getElementById("assetGold");
	    for (var i=0; i<x.length; i++) 
	    {
		   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
		   	{
		   		oldValues[i] = x.elements[i].value;
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

	function closeDialog(){
		 $(".overlay").fadeOut("slow");
		    $("#confirmDialog").fadeOut("slow");
		 }	
	
 $('.wrapper').addClass("add_assets_gold_wrapper add_assets");
 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
  $('.common_in_content').slimScroll();
     $("select").selectBoxIt();
     
     $("body").on("click", "#saveAdd", function() {
    	 if($('#assetGold').validate().form()){
    		 if(checkChangeData()){
	 			if(cntrSave==1){
	 				$("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	    			$('#assetGold').submit();
	    			cntrSave++;
	 			}
    		 }
	 	   	}
     });
     
     $("body").on("click", "#saveClose", function() {
    	 if($('#assetGold').validate().form()){
    		 if(checkChangeData()){
    			 if(cntrSave==1){
 	 				$("#saveAdd").addClass("inactiveLink");
 	    			$("#saveClose").addClass("inactiveLink");
 	    			$('#assetGold').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
 		  			$('#assetGold').submit();
 	    			cntrSave++;
 	 			}
    		 }
  	   	}
     });
     
    /*  $("body").on("click", "#cancel", function() {
 		$('#assetCancel').submit();
 }); */
$("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
$("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
var selectBox1 = $("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt');			    
selectBox1.selectOption('${assetGold.ownerPartyId}');

$("li").addClass("rel");

$("#assetGold").validate({ignore:'', rules:{investmentValue:{min:1}, currentValue:{min:1}}});

});

function doAction(url){
	checkData(url);
}

function cancelPage(url){
	window.location.href=url;
}

function checkData(url){
	var x = document.getElementById("assetGold");
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

function checkChangeData(){
	var x = document.getElementById("assetGold");
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
        <%-- <form:form id="assetCancel" method="POST" action="${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0">
        </form:form> --%>
          <form:form id="assetGold" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
          <input name="assetTypeId" type="hidden" value="48022"/>
          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
          <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
          <input type="hidden" id="assetPage" name="assetPage" value="4"/>
          <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
          <div id="page_loader"></div>
        <section id="add_assets_gold" class="in_content common_in_content clearfix">
          
          <div class="continer_parent">
            <div class="fd_box dynamic_box northspace6">
              <ul class="clearfix head_title first_level_heading reset">
                <li class="title_one label fl">Owner</li>
                <li class="title_two label fl">Item Description</li>
                <li class="title_three label fl">Amount Investment</li>
                <!-- <li class="title_five label fl">Growth Rate(%)</li> -->
                
                
               
              </ul>
             
              <ul class="clearfix data_inputs first_level_inputs reset">
                <li class="input_one label fl">
                  <select id="ownerPartyId" class="required" name="ownerPartyId">
                  </select>
                </li>
                <li class="input_two label fl">
                  <input type="text" class="common_input required" name="description" value="${assetGold.description}"/>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input required mynumber" id="investmentValue" name="investmentValue" value="${assetGold.monthlyDeposited}"/>
                </li>
                <%-- <li class="input_four label fl">
                  <input type="text" class="common_input required number" name="interestRate" value="${assetGold.interestRate}"/>
                </li> --%>
                
                
              </ul>
               <ul class="clearfix head_title second_level_heading reset">
              	<li class="title_four label fl">Current Value</li>
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
              	<li class="input_five label fl">
                  <input type="text" class="common_input required mynumber" id="currentValue" name="currentValue" value="${assetGold.currentBalance}"/>
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
         	<p>No Linked Goals To Gold</p>
         </c:otherwise>
         </c:choose>
                  <div class="clr"></div>
                </li>
              </ul>
              </c:when>
              </c:choose>
            </div>
          </div>
        </section>
        <!-- Common_in_contnet ends-->
        </form:form>
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
           <li class="fl list"><a href="#" class="anch cancel" id="cancel" onclick="doAction('${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0?assetPage=4');"><span class="txt">Cancel</span></a></li>
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
 
<!-- For Common Custom File Input Ends-->
</body>
</html>
