<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!--<link type="text/css" rel="stylesheet" href="$	{pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" />-->

<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script>
$(document).ready(function(){
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
    $('.toggle').toggles();
    $("#frmCreateContact").validate();
    $("#pincode").rules("add", {regex:"^([0-9]{6})$",messages: {regex: "Pin Code must be numeric" }});
   
    var partnerSetupLinks = "${editContactLink}";
	var pieces = partnerSetupLinks.split(",");
	for(var i=0;i<pieces.length;i++){
	 $("."+pieces[i]).attr("href","#");
	 $("."+pieces[i]).removeAttr('onclick');
	 $("."+pieces[i]).addClass("inactiveLink");
	}
});

</script>
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  <section class="main">
    <!-- Common_content Starts-->
    
    <section class="content common_content">
    <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
    <section id="add_contact" class="in_content common_in_content">
       <!--Aditya Forget Password Pop Up starts here-->
      <form:form class="form-horizontal" id="frmCreateContact" name="frmCreateContact" action="${pageContext.request.contextPath}/partner/contact/update" commandName="party" method="POST">
     <fmt:formatDate pattern="dd-MMM-yyyy" value="${party.dob}" var="dob"/>
     <form:hidden path="id" id="partyId" name="party.id" />
     <c:set var="addressList" value="${party.addressList[0]}" > </c:set>
     <c:set var="associatedParties" value="${party.associatedParties}" > </c:set>
     <div class="accordian_parent"><div id="Profile_Info_Tab">
		<h3>Personal Details</h3>
	  	<div id="personal_details_accordian">
	    	<p class="rel personal_detail_name" style="margin-left:20px; margin-bottom:20px;"><label class="form_label"><span class="required_star">*</span>Name</label>
	        	<form:select path="salutationId" class="required" id="salutationId" items="${salutationList}" itemLabel="codeValue" itemValue="codeValueId"  />
	     		<input name="firstName" id="firstName" type="text" maxlength="50" class="common_input" value="${party.firstName}">
	     		<input name="lastName" id="lastName" type="text" maxlength="50" class="common_input required" value="${party.lastName}">
	     	</p>	              
		  	<div id="personal_details" class="fl first_col">
	          <ul class="reset clearfix first_col_ul">
	            <li class="clearfix rel"><label class="form_label">Date of Birth</label>
	            <input id="birth_date3" name="dobAsString" type="text" readonly="readonly" class="birth_date common_input5 datepicker" value="${dob}" onChange="calculateAge();">&nbsp;</li>
	              <li class="clearfix"><label class="form_label">Gender</label>
	              <ul class="reset clearfix thumb_select_ul emergency_categoery_ul gender">
	                <li class="fl"><a href="#"><div class="categoery job" id="12001"><div class="thumb male"></div></div><label class="label">Male</label></a></li>
	                <li class="fl"><a href="#"><div class="categoery other not_applicable" id="12002"><div class="thumb female"></div></div><label class="label">Female</label></a></li>
	              	<input name="genderId" id="genderId" value=""  type="hidden" ></input>
	              </ul>
	             </li>
	            <li class="clearfix"><label class="form_label">Marital Status</label>
	            	<form:select path="maritalStatusID" id="maritalStatusID" items="${maritalStatusList}" itemLabel="codeValue" itemValue="codeValueId"  />
	            </li>
	          </ul>
	        </div>	        
	          <div class="fr second_col">
	          <ul class="reset clearfix second_col_ul">
	            <li class="clearfix"><label class="form_label">Occupation</label>
	            	<form:select path="workProfession" id="workProfession" items="${occupationList}" itemLabel="codeValue" itemValue="codeValueId"  />
	            </li>      
	            <li class="clearfix"><label class="form_label">Company Name</label><input class="common_input" name="companyName" type="text" value="${party.companyName}"></li>
	            <li class="clearfix"><label class="form_label">Designation</label><input class="common_input" name="workDesignation" type="text" value="${party.workDesignation}"></li>
	            <li class="clearfix"><label class="form_label">PAN</label><input class="common_input" id="panNumber" name="panNumber" type="text" onchange="validatePAN();" value="${party.panNumber}"></li>
	          </ul>
	        </div>    
	  	</div>
	      
	        
		<h3>Contact Details</h3>
		<div>
         <div class="Cont_Details_first_col">
           <ul class="reset clearfix Cont_Details_first_col_ul">
           		<input type="hidden" name="addressList[0].id" value="${addressList.id}" />
           		<input type="hidden" name="addressList[0].partyId" value="${party.id}" />
           		
             <li class="clearfix"><label class="form_label">Address 1</label><input name="addressList[0].street1" type="text" class="common_input" value="${addressList.street1}"></li>
             <li class="clearfix"><label class="form_label">Address 2</label><input name="addressList[0].street2" type="text" class="common_input" value="${addressList.street2}"></li>
             <li class="clearfix"><label class="form_label">Address 3</label><input name="addressList[0].street3" type="text" class="common_input" value="${addressList.street3}"></li>
           </ul>
         </div>
         <div class="Cont_Details_second_col">
           <ul class="reset clearfix Cont_Details_second_col_ul">
             <li class="clearfix"><label class="form_label">Country</label>
               	<form:select path="addressList[0].countryId" id="countryId" items="${countryList}" itemLabel="codeValue" itemValue="codeValueId"  />
             </li>
             <li class="clearfix"><label class="form_label">State</label>
               	<select id="stateId" name="addressList[0].stateId" >
               		<option value="-1">-- Select --</option>  
               	</select>
             </li>
             <li class="clearfix"><label class="form_label">City</label>
               	<select id="cityId" name="addressList[0].cityId">
               		<option value="-1">-- Select --</option>                    
               	</select>
             </li>
             <li class="clearfix rel"><label class="form_label">Pin Code</label><input type="text" name="addressList[0].postalCode" id="pincode" class="common_input" value="${addressList.postalCode}"></li>
             
           </ul>
         </div>
         <div class="Cont_Details_third_col">
           <ul class="reset clearfix Cont_Details_third_col_ul">
             <li class="clearfix rel"><label class="form_label"><span class="required_star">*</span> Email</label><input name="contactEmail1" type="text" class="common_input required email" value="${party.contactEmail1}" maxlength="75" ></li>
             <li class="clearfix rel"><label class="form_label">Mobile</label><input name="contactMobile1" type="text" class="common_input mobileNL" value="${party.contactMobile1}" placeholder="+91 9999999999"></li>
             <li class="clearfix"><label class="form_label">Alternate No.</label><input name="contactMobile2" type="text" class="common_input" value="${party.contactMobile2}"></li>
           </ul>
         </div>
       </div>
       
       <h3>Origination Details</h3>
       <div id="origination-details">
       	<ul class="reset">
          <li style=" margin-bottom:20px;"><label class="form_label">Campaign Name</label><input name="campaignName" id="campaignName" type="text" class="common_input" value="${party.campaignName}"></li>
          <li style=" margin-bottom:20px;"><label class="form_label">Opportunity Source</label>
           <form:select path="contactSourceTypeID" id="contactSourceTypeID" items="${contactSourceList}" itemLabel="codeValue" itemValue="codeValueId"  />
          </li>
          <li style=" margin-bottom:20px;"><label class="form_label">Referred By</label><input name="contactReferalName" id="contactReferalName" type="text" class="common_input" value="${party.contactReferalName}"></li>
         </ul>
        </div>
        
     </div></div>
     </form:form>
     
      <!--Aditya Forget Password Pop Up ends here--> 
      <!-- Common footer starts -->
      
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">          
           <li class="fl list"><a href="#" class="anch save editContactSaveLink" onclick="saveInfo()"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${cancel}" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
      </section>
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->

<script>
$(function() {
    $( "#Profile_Info_Tab" ).accordion({
	heightStyle: "content",
    autoHeight: false,
    clearStyle: true,	
});
});

$(function() {
    $( ".datepicker" ).datepicker({
    	changeMonth: true,
    	changeYear: true,
    	yearRange: "-100:+0", 
	  	dateFormat: "dd-M-yy",
	  	showOn: "button",
	  	buttonText: '',
		maxDate: '0', 
     });
  });

function  formSubmit(){	
	
	if($("#frmCreateContact").validate().form())
    {
	$("#frmCreateContact").submit();
	successMessage();
    }
}

$(document).ready(function(){	
	  $('.wrapper').attr('id', 'Profile_Info');   
	$(".thumb_select_ul a").click(function(){		
		$(".thumb_select_ul a").children(".categoery").removeClass("not_applicable");
		$(this).children(".categoery").addClass("not_applicable");
		$("#genderId").val($(this).children(".categoery").attr("id"));
	});
	 
	 $('.in_content common_in_content').slimScroll();
	 $('.accordian_parent').slimScroll();
	$('.ui-accordion-content').perfectScrollbar();
		
	$( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	
	// populate state from country
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId="+$("#countryId").val(), '{}', "#stateId", "stateId", '${addressList.stateId}');
	
	
});

// populate state from country
$("select#countryId").bind({
		"change": function(){
			jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId="+$("#countryId").val(), '{}', "#stateId", "stateId", '${addressList.stateId}');	
		},
	});

//populate city from state 
$("select#stateId").bind({
	"change": function(){
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId=" + $("#stateId").val(), '{}', "#cityId", "cityId", '${addressList.cityId}');	
	},
});


// code for toggling gender
$(".gender a").click(function(){
	$(".gender a").children(".categoery").removeClass("not_applicable");
	$(this).children(".categoery").addClass("not_applicable");
	$("#genderId").val($(this).children(".categoery").attr("id"));		
});

$(".gender a").children(".categoery").removeClass("not_applicable");
$("#" + '${party.genderId}').addClass("not_applicable");
$("#genderId").val('${party.genderId}');



function saveInfo(){
	
	if($("#frmCreateContact").validate().form()){
	$("#frmCreateContact").submit();
	successMessage();
	}
}
	
</script>

</html>