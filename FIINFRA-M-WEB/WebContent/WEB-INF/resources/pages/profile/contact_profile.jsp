<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" /> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script> --%>

<script>

$(document).ready(function(){
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
    $('.toggle').toggles();
			$('#frmCreateContact').validate({ // initialize the plugin
		ignore:'', //i.e. do not ignore hidden elements	
        onfocusout: function (element) {
        $(element).valid();
		},


		/*rules: {
            salutationId: {
            required: true,
             },
			 firstName: {
            required: true,
             },
			 lastName: {
            required: true,
             },
			 dobAsString: {
            required: true,
             },
             workProfession: {
                required: true,
              },
			   companyName: {
                required: true,
              },
			   workDesignation: {
                required: true,
              },
			   panNumber: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			   maritalStatusID: {
                required: true,
              },
			}*/
		});
			
		$("#pincode").rules("add", { regex: "^([0-9]{6})$" ,required: false,});
		
		//$("#salutationId").rules("add", {min:81001,messages: {min: "Please Select Salutation" }});

					
		$("li").addClass("rel");	
		$("a.save_new").click(function(e) { e.preventDefault();
		$("#frmCreateContact").validate();

		
});
		
});


</script>
<!-- Wrapper starts-->
<div class=""> 
  <!-- Main starts-->
  <section class="main">
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
    <section id="add_contact" class="in_content common_in_content">
       <!--Aditya Forget Password Pop Up starts here-->
        <form:form class="form-horizontal" id="frmCreateContact" name="frmCreateContact" action="${pageContext.request.contextPath}/partner/contact/create" method="POST" commandName="party">
     <fmt:formatDate pattern="dd-MMM-yyyy" value="${party.dob}" var="dob"/>
     <c:set var="addressList" value="${party.addressList[0]}" > </c:set>
     
     <div class="accordian_parent"><div id="Profile_Info_Tab">     	 
		<h3>Personal Details</h3>
	  	<div id="personal_details_accordion_content">
	    	<p class="rel personal_detail_name" style="margin-left:20px; margin-bottom:20px;"><label class="form_label"><span class="required_star">*</span>Name</label>
	        	<form:select path="salutationId" class="required" id="salutationId" items="${salutationList}" itemLabel="codeValue" itemValue="codeValueId"  />
	     		<input name="firstName" id="firstName" maxlength="50" type="text" class="common_input" value="${party.firstName}" placeholder="First name">
	     		<input name="lastName" id="lastName" maxlength="50" type="text" class="common_input required" value="${party.middleName}" placeholder="Last name">
	     		
	     	</p>	              
		  	<div id="personal_details" class="fl first_col">
	          <ul class="reset clearfix first_col_ul">
	            <li class="clearfix rel"><label class="form_label">Date of Birth</label>
	            <input id="birth_date3" name="dobAsString" readonly="readonly" type="text" class="birth_date common_input5 datepicker" value="${dob}"  onChange="calculateAge();">&nbsp;</li>
	            <li class="clearfix"><label class="form_label">Gender</label>
	              <ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
	                <li class="fl"><a href="#"><div class="categoery job" id="12001"><div class="thumb male"></div></div><label class="label">Male</label></a></li>
	                <li class="fl"><a href="#"><div class="categoery other" id="12002"><div class="thumb female"></div></div><label class="label">Female</label></a></li>	              	
	              	<input name="genderId" id="genderId" value="" type="hidden" ></input>
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
             <li class="clearfix"><label class="form_label">Pin Code</label><input type="text" id="pincode" name="addressList[0].postalCode" class="common_input" value="${addressList.postalCode}"></li>
           </ul>
         </div>
         <div class="Cont_Details_third_col">
           <ul class="reset clearfix Cont_Details_third_col_ul">
             <li class="clearfix"><label class="form_label"><span class="required_star">*</span>Email</label><input name="contactEmail1" type="text" class="common_input required email" value="${party.contactEmail1}" maxlength="75"></li>
             <li class="clearfix"><label class="form_label">Mobile</label><input name="contactMobile1" type="text" class="common_input mobileNL" value="${party.contactMobile1}" placeholder="+91 9999999999" ></li>
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
<!--           <li class="clearfix"> -->
<!--             <label class="form_label">Interested in Offerings</label> -->
<!--             <ul class="reset clearfix thumb_select_ul emergency_categoery_ul"> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb financial_planning"></div></div><label class="label">Financial Planning</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb retirement_planning"></div></div><label class="label">Retirement Planning</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb succession_planning"></div></div><label class="label">Succession Planning</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb tax_planning"></div></div><label class="label">Tax Planning</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb mutual_funds"></div></div><label class="label">Mutual Funds</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb life_insurance"></div></div><label class="label">Life Insurance</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb general_insurance"></div></div><label class="label">General Insurance</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb loans"></div></div><label class="label">Loans</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb other_value-added"></div></div><label class="label">Other Value-Added Services</label></a></li> -->
<!--               <li class="fl"><a href="#"><div class="categoery"><div class="thumb other_investment"></div></div><label class="label">Other Investment Products</label></a></li> -->
<!--             </ul> -->
<!--           </li> -->
         </ul>
        </div>
        
     </div></div>
     </form:form>
     
      <!--Aditya Forget Password Pop Up ends here--> 
      <!-- Common footer starts -->
      
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">          
            <li class="fl list"><a href="#" class="anch save" onclick="formSubmit();"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/contacts" class="anch cancel"><span class="txt">Cancel</span></a></li>
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
	
	
	$("select#countryId").bind({
		"change": function(){
			jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId="+$("#countryId").val(), '{}', "#stateId", "stateId", '${addressList.stateId}');	
		},
	});

		
	$("select#stateId").bind({
		"change": function(){
			jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId=" + $("#stateId").val(), '{}', "#cityId", "cityId", '${addressList.cityId}');	
		},
	});
});


	
	

</script>

</html>