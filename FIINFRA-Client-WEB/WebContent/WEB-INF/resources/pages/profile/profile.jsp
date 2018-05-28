<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" />

<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>

<!-- Wrapper starts-->
<div id="Profile_Info"> 
  <!-- Main starts-->  
  <section class="main">    
    <!-- Common_content Starts-->
    <section class="content common_content"> 
     <section class="in_content common_in_content"> 
      <!--Aditya Forget Password Pop Up starts here-->
     <form class="form-horizontal" id="frmParterProfile" name="frmParterProfile" action="<c:url value="/partner/profile/update" />" method="POST">
     <fmt:formatDate pattern="dd-MMM-yyyy" value="${party.dob}" var="dob"/>
     <form:hidden path="party.id" id="partyId" name="party.id" />
     <c:set var="addressList" value="${party.addressList[0]}" > </c:set>
     <c:set var="associatedParties" value="${party.associatedParties}" > </c:set>
     <c:out value="${success }"></c:out>
     <c:out value="${error }"></c:out>
     <div class="accordian_parent"><div id="Profile_Info_Tab">
		<h3>Personal Details</h3>
	  	<div id="personal_details_accordian">
	    	<p style="margin-left:20px; margin-bottom:20px;"><label class="form_label">Name</label>
	        	<select id="salutation" name="salutationId">
	            	<option value="-1">-- Select --</option>
	     		</select>
	     		<input name="firstName" id="firstName" type="text" class="common_input" value="${party.firstName}">
	     		<input name="lastName" id="lastName" type="text" class="common_input" value="${party.lastName}">
	     	</p>	              
		  	<div id="personal_details" class="fl first_col">
	          <ul class="reset clearfix first_col_ul">
	            <li class="clearfix"><label class="form_label">Date of Birth</label><input id="birth_date3" name="dobAsString" "text" class="birth_date common_input5 datepicker" value="${dob}" readonly="readonly">&nbsp;</li>
	            <li class="clearfix"><label class="form_label">Gender</label>
	              <ul class="reset clearfix thumb_select_ul emergency_categoery_ul gender">
	                <li class="fl"><a href="#"><div class="categoery job" id="12001"><div class="thumb male"></div></div><label class="label">Male</label></a></li>
	                <li class="fl"><a href="#"><div class="categoery other not_applicable" id="12002"><div class="thumb female"></div></div><label class="label">Female</label></a></li>
	              	<input name="genderId" id="genderId" value=""  type="hidden" ></input>
	              </ul>
	             </li>
	            <li class="clearfix"><label class="form_label">Marital Status</label>
	            	<select id="maritalstatus" name="maritalStatusID" >	                	
	              		<option value="-1">-- Select --</option>  
	              	</select>
	            </li>
	          </ul>
	        </div>	        
	        <div class="fr second_col">
	          <ul class="reset clearfix second_col_ul">
	            <li class="clearfix"><label class="form_label">Occupation</label>
	            	<select id="occupation" name="workProfession">
	            		<option value="-1">-- Select --</option>  	                	
	              	</select>
	            </li>      
	            <li class="clearfix"><label class="form_label">Company Name</label><input class="common_input" name="companyName" type="text" value="${party.companyName}"></li>
	            <li class="clearfix"><label class="form_label">Designation</label><input class="common_input" name="workDesignation" type="text" value="${party.workDesignation}"></li>
	            <li class="clearfix"><label class="form_label">PAN no</label><input class="common_input" name="panNumber" type="text" value="${party.panNumber}"></li>
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
               	<select id="countryId" name="countryId">
               		<option value="-1">-- Select --</option>
               	</select>
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
             <li class="clearfix"><label class="form_label">Pin Code</label><input type="text" name="addressList[0].postalCode" class="common_input" value="${addressList.postalCode}"></li>
           </ul>
         </div>
         <div class="Cont_Details_third_col">
           <ul class="reset clearfix Cont_Details_third_col_ul">
             <li class="clearfix"><label class="form_label">Email</label><input name="contactEmail1" type="text" class="common_input" value="${party.contactEmail1}"></li>
             <li class="clearfix"><label class="form_label">Mobile</label><input name="contactMobile1" type="text" class="common_input" value="${party.contactMobile1}"></li>
             <li class="clearfix"><label class="form_label">Alternate No.</label><input name="contactMobile2" type="text" class="common_input" value="${party.contactMobile2}"></li>
           </ul>
         </div>
       </div>
       
		<h3>Family Details</h3>
		<div class="family_details">
    
    	<input type="hidden" id="familyDetailsSize" name="familyDetailsSize" value="${familyDetailsSize}"/>
    	<c:forEach items="${party.associatedParties}" var="family" varStatus="count" >
         <ul class="reset clearfix Family_Details_col">
           		<input type="hidden" name="partyId${count.index}" value="${party.id}" />
           		<input type="hidden" name="relatedPartyId${count.index}" value="${family.relatedPartyId}" />
             <li class="clearfix li_one"><input name="firstName${count.index}" type="text" class="common_input" value="${family.firstName}" placeholder="First Name"></li>
             <li class="clearfix li_two"><input name="lastName${count.index}" type="text" class="common_input" value="${family.lastName}" placeholder="Last Name"></li>
             <li class="clearfix li_three">
             <fmt:formatDate pattern="dd-MMM-yyyy" value="${family.dob}" var="associatedPartiesDOB1"/>
             
             <input name="dob${count.index}" type="text" id="dob${count.index}" readonly="readonly" class="birth_date common_input4 datepicker" value="${associatedPartiesDOB1}" placeholder="dd-mmm-yyyy"></li>

             <li class="clearfix li_five">
             	<input type="hidden" id="relationshipId${count.index}" value="${family.relationshipId}" />
               	<select name="relation${count.index}" id="relation${count.index}">
               		<option value="-1">-- Select1 --</option>                
               	</select>
             </li>
             <li class='clearfix li_six'>
             <span class='common_input3'>
             </span><div class='close'>x</div>
             </li>
             
             <c:if test="${count.index==familyDetailsSize-1}">
				<li class="clearfix li_six">
	                <div class="add">+</div>
             	</li>				             
             </c:if>
           </ul> 
          </c:forEach>
             
         </div>
  
  <%--      <ul class="reset clearfix Family_Details_col">
           		<input type="hidden" name="associatedParties[0].id" value="${party.id}" />
           		<input type="hidden" name="associatedParties[0].relatedPartyId" value="${associatedParties[0].relatedPartyId}" />
             <li class="clearfix li_one"><input name="associatedParties[0].firstName" type="text" class="common_input" value="${associatedParties[0].firstName}" placeholder="First Name"></li>
             <li class="clearfix li_two"><input name="associatedParties[0].lastName" type="text" class="common_input" value="${associatedParties[0].lastName}" placeholder="Last Name"></li>
             <li class="clearfix li_three">
             <fmt:formatDate pattern="dd/MM/yyyy" value="${associatedParties[0].dob}" var="associatedPartiesDOB1"/>
             <input name="associatedParties[0].dobAsString" type="text" id="relationDob1" readonly="readonly" class="birth_date common_input4 datepicker" value="${associatedPartiesDOB1}" placeholder="dd-mmm-yyyy"></li>
             <li class="clearfix li_four"><div class="range_parent">
               <div class="scale clearfix">
                 <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                 <div id="relationDob1_member_age"></div>                
                 <input type="text" id="relationDob1_m_age" class="range_counter" /> <span class="unit">yrs</span>
               </div>
             </div></li>
             <li class="clearfix li_five">
               	<select name="associatedParties[0].relationshipId" id="relation1">
               		<option value="-1">-- Select --</option>                
               	</select>
             </li>
             <li class="clearfix li_six">
              <!--<label class="form_label" id="relationDob1_text"></label>-->
              <span class="common_input3"></span>
             </li>
           </ul>           
         
         
         
         <ul class="reset clearfix Family_Details_col">
           		<input type="hidden" name="associatedParties[1].id" value="${party.id}" />
           		<input type="hidden" name="associatedParties[1].relatedPartyId" value="${associatedParties[1].relatedPartyId}" />
             <li class="clearfix li_one"><input name="associatedParties[1].firstName" type="text" class="common_input" value="${associatedParties[1].firstName}" placeholder="First Name"></li>
             <li class="clearfix li_two"><input name="associatedParties[1].lastName" type="text" class="common_input" value="${associatedParties[1].lastName}" placeholder="Last Name"></li>
             <li class="clearfix li_three">
             <fmt:formatDate pattern="dd/MM/yyyy" value="${associatedParties[1].dob}" var="associatedPartiesDOB2"/>
             <input name="associatedParties[1].dobAsString" type="text" id="relationDob2" readonly="readonly" class="birth_date common_input4 datepicker" value="${associatedPartiesDOB2}" placeholder="dd-mmm-yyyy"></li>
            <li class="clearfix li_four"> <div class="range_parent">
               <div class="scale clearfix">
                 <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                 <div id="relationDob2_member_age"></div>                
                 <input type="text" id="relationDob2_m_age" class="range_counter" /> <span class="unit">yrs</span>
               </div>
             </div></li>
             <li class="clearfix li_five">
               	<select name="associatedParties[1].relationshipId" id="relation2">
               		<option value="-1">-- Select --</option>                 
               	</select>
             </li>
             <li class="clearfix li_six">
               <!--<label class="form_label" id="relationDob2_text"></label>-->
               <span class="common_input3"></span>
             </li>
           </ul>           
        

         
           <ul class="reset clearfix Family_Details_col">
           		<input type="hidden" name="associatedParties[2].id" value="${party.id}" />
           		<input type="hidden" name="associatedParties[2].relatedPartyId" value="${associatedParties[2].relatedPartyId}" />
             <li class="clearfix li_one"><input name="associatedParties[2].firstName" type="text" class="common_input" value="${associatedParties[2].firstName}" placeholder="First Name"></li>
             <li class="clearfix li_two"><input name="associatedParties[2].lastName" type="text" class="common_input" value="${associatedParties[2].lastName}" placeholder="Last Name"></li>
             <li class="clearfix li_three">
             <fmt:formatDate pattern="dd/MM/yyyy" value="${associatedParties[2].dob}" var="associatedPartiesDOB3"/>
             <input name="associatedParties[2].dobAsString" type="text" id="relationDob3" readonly="readonly" class="birth_date common_input4 datepicker" value="${associatedPartiesDOB3}" placeholder="dd-mmm-yyyy"></li>
             <li class="clearfix li_four"><div class="range_parent">
               <div class="scale clearfix">
                 <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                 <div id="relationDob3_member_age"></div>                
                 <input type="text" id="relationDob3_m_age" class="range_counter" /> <span class="unit">yrs</span>
               </div>
             </div></li>
             <li class="clearfix li_five">
               	<select name="associatedParties[2].relationshipId" id="relation3">
               		<option value="-1">-- Select --</option>                 
               	</select>
             </li>
             <li class="clearfix li_six">
               	<!--<label class="form_label" id="relationDob3_text"></label>-->
                <span class="common_input3"></span>
                <div class="add">+</div>
             </li>
           </ul>        
            --%>
                        
        <h3>Origination Details</h3>
       	<div id="origination-details">
          <ul>
           	<li style=" margin-bottom:20px;"><label class="form_label">Campaign Name</label><input name="campaignName" id="campaignName" type="text" class="common_input" value="${party.campaignName}"></li>
          	<li style=" margin-bottom:20px;"><label class="form_label">Opportunity Source</label>
	           	<select id="contactSourceType" name="contactSourceTypeID">
	           		<option value="-1">-- Select --</option>                
	            </select>
          	</li>
          <li style=" margin-bottom:20px;"><label class="form_label">Referred By</label><input name="contactReferalName" id="contactReferalName" type="text" class="common_input" value="${party.contactReferalName}"></li>
          
          <li class="clearfix">
            <label class="form_label">Interested in Offerings</label>
            <ul class="reset clearfix thumb_select_ul emergency_categoery_ul interestedInOffering">

				<c:forEach items="${party.partyAttributes}" var="offering" varStatus="count">
              		<c:choose>
	              		<c:when test="${offering.attributeValue==1}">
			            	
			            	<li class="fl">
			            		<a href="#">
			            			<div class="categoery not_applicable" id="${offering.attributeCodeID}" >
			            				<div class="thumb financial_planning"></div>
			            				<input type="hidden" name="${offering.attributeCodeID}_value" value="1" id="${offering.attributeCodeID}_value" class="answers"/>
			            			</div>
			            			<label class="label">${offeringNames[count.index]}</label>
			            		</a>
			            	</li>
			            </c:when>
			            <c:otherwise>			            	
			            	<li class="fl">
			            		<a href="#">
			            			<div class="categoery" id="${offering.attributeCodeID}" >
			            				<div class="thumb financial_planning"></div>
			            				<input type="hidden" name="${offering.attributeCodeID}_value" value="" id="${offering.attributeCodeID}_value" class="answers"/>
			            			</div>
			            			<label class="label">${offeringNames[count.index]}</label> 
								</a>
							</li>          
			            </c:otherwise>
			        </c:choose>				
				</c:forEach>
			</ul>
		</li>          
      </ul>
    </div>
       
       <h3>Tracker Details</h3>
       <div id="Tracker_Details">
         <p>
         <div class="fl first_col">
           <ul class="reset clearfix first_col_ul">
             <li class="clearfix">
               <label class="form_label">Opportunity Status</label>
               	<select id="opportunityStatus" name="oppotunityStatusId">
               		<option value="-1">-- Select --</option>         
               	</select>
             </li>
             <li class="clearfix">
               <label class="form_label">Next Action</label>
               	<select id="nextAction" name="nextActionId">
               		<option value="-1">-- Select --</option>
               	</select>
             </li>
           </ul>
         </div>
         <div class="fr second_col">
           <ul class="reset clearfix second_col_ul">
             <li class="clearfix">
               <label class="form_label">Conversion Probability</label>
               <div class="range_parent">
                 <div class="scale clearfix">
                   <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span></div>
                   <div id="Conversion_Probability"></div>
                   <div class="counter_parent"><input type="text" id="C_P_Value" name="convertProbablity" class="range_counter" /><span class="unit">%</span></div>
                 </div>
               </div>
             </li>
             <li class="clearfix">
               <label class="form_label">Opportunity Rating</label>
               <div class="range_parent">
                 <div class="scale clearfix">
                   <div class="scale_range"><span class="low extrem">Hot</span><span class="middle extrem">Warm</span><span class="high extrem">Cold</span>
                     <div class="mark"><span class="line"></span><span class="line"></span><span class="line"></span></div>
                   </div>
                   <div id="opportunity_rating"></div>
                   <input type="hidden" id="oppotunityRatingId" name="oppotunityRatingId" class="range_counter" />
                 </div>
               </div>
             </li>
           </ul>
         </div>                 
       </div>     
     </div></div>
     </form>
      <!--Aditya Forget Password Pop Up ends here--> 
      
      <!-- Common_in_contnet starts--> 
      
      <!-- Common_in_contnet ends--> 
     
    </section>
    <!-- Common footer starts -->
     <section class="common_footer_actions">
		<div id="main_actions" class="clearfix">
			<ul class="reset clearfix fr btn_grup3">				
				<li class="fl list"><a href="#" class="anch save" onclick="saveInfo()"><span class="txt">Save</span></a></li>
				<li class="fl list"><a href="#" class="anch cancel" onclick="saveInfo()"><span class="txt">Cancel</span></a></li>
			</ul>
		</div>
		<a href="${pageContext.request.contextPath}/partner/dashboard" class="back navgation"><span class="txt">Back</span></a> 
		<a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness/${partyId}" class="next navgation"><span class="txt">Next</span></a>
	</section>
      <!-- Common footer ends -->
      <div class="overlay"></div>
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
  

function setAgeSlider(dateText, ctrl){
	if(dateText != ""){
		var now = new Date();
	    var from = dateText.split("/");
	    var past = new Date(from[2], from[1] - 1, from[0]);
	    var nowYear = now.getFullYear();		   
	    var pastYear = past.getFullYear();
	    var age = nowYear - pastYear;
	    
	    $("#" + ctrl + '_member_age').slider( "option", "value", age);
		$("#" + ctrl + '_m_age').val(age);
		if(age < 10){
			$("#" + ctrl + "_text").text("Minor");
		} else if(age > 60){
			$("#" + ctrl + "_text").text("Senior Citizen");
		} else {
			$("#" + ctrl + "_text").text("");
		}	
	}	
}


createSlider("#Conversion_Probability", 0, 100, 1, "#C_P_Value");
createSlider("#opportunity_rating", 5001, 5003, 1, "#oppotunityRatingId");

$(function() {
	 $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
	  showOn: "button",
	  buttonText: '',
	  changeMonth: true,
	  changeYear: true
	 });
});

$(document).ready(function(){
	
  
   $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
     
	  $('.EP_cnt').perfectScrollbar('update');
	 
	  
	});
	
	//dynamic addtion and deletion for family tab
		
 	$(".interestedInOffering a").click(function(){
  	   $(this).children(".categoery").toggleClass("not_applicable");
  	 	toggleOfferings($(this));
 	});
	
  	   function toggleOfferings(thisObj){  		  
	  	   if(thisObj.children(".categoery").find(".answers").val() == ''){
	  		 thisObj.children(".categoery").find(".answers").val('1'); 		  		 
	  	   } else {
	  		 thisObj.children(".categoery").find(".answers").val('');	  		 
	  	   }
  	   }  		
 	
	 $('.wrapper').attr('id', 'Profile_Info'); 
		
	$("select").selectBoxIt();

	$('.toggle').toggles();
	$('#personal_details_accordian').perfectScrollbar();
	$('#contact_details_accordian').perfectScrollbar();
	$('#contact_details_accordian').perfectScrollbar();
	$('.family_details').perfectScrollbar();	
	
	// code for toggling gender
	$(".gender a").click(function(){
		$(".gender a").children(".categoery").removeClass("not_applicable");
		$(this).children(".categoery").addClass("not_applicable");
		$("#genderId").val($(this).children(".categoery").attr("id"));		
	});
	
	$(".gender a").children(".categoery").removeClass("not_applicable");
	$("#" + '${party.genderId}').addClass("not_applicable");
	$("#genderId").val('${party.genderId}');
	

	
	$('.common_in_content').slimScroll();
	$('.accordian_parent').slimScroll();
	$('.ui-accordion-content').perfectScrollbar();
		
	$( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	
	$('#Conversion_Probability').slider( "option", "value", '${party.convertProbablity}');
	$('#C_P_Value').val('${party.convertProbablity}');
		
	$('#opportunity_rating').slider( "option", "value", '${party.oppotunityRatingId}');
	$('#oppotunityRatingId').val('${party.oppotunityRatingId}');
	
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=SalutationID", '{}', "#salutation", "salutation", '${party.salutationId}');	
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=countryID", '{}', "#countryId", "countryId", '3001');	
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=StateID", '{}', "#stateId", "stateId", '${addressList.stateId}');
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=MaritalStatusID", '{}', "#maritalstatus", "maritalstatus", '${party.maritalStatusID}');

	// Family details code starts	
	//dynamic addtion and deletion for family tab		
	var familyDetailsSize = $("#familyDetailsSize").val();	

	//Add Button Starts
	
		
	// Code to populate relationship drop down under family details
	for(var i=0;i<familyDetailsSize;i++){
		var relationshipIdVar = "#relationshipId"+i; 
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation"+i, "relation"+i, $(relationshipIdVar).val());
	}
	
	$(".family_details").on("click", ".add", function() {
	  	$(this).fadeOut();
	  
	   
	$(this).prev(".close").fadeIn();

	$(this).parent().closest("ul").after("<ul class='reset clearfix Family_Details_col clearfix'><li class='clearfix li_one'><input name='firstName"+familyDetailsSize+"' type='text' class='common_input' placeholder='First Name'/></li><li class='clearfix li_two'><input name='lastName"+familyDetailsSize+"' type='text' class='common_input' placeholder='Last Name'/></li><li class='clearfix li_three'><input id='dob"+familyDetailsSize+"' name='dob"+familyDetailsSize+"' type='text' placeholder='dd-mmm-yyyy' class='birth_date common_input4 datepicker' readonly='readonly' /></li><li class='clearfix li_four'></li><li class='clearfix li_five'><select name='relation"+familyDetailsSize+"' id='relation"+familyDetailsSize+"'><option>Select</option></select></li><li class='clearfix li_six'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul> ");

	  $(function() {
			 $( ".datepicker" ).datepicker({
			  dateFormat: "dd-M-yy",
			  showOn: "button",
			  buttonText: '',
			  changeMonth: true,
			  changeYear: true
			 });
	  });

	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );

	  $("select").selectBoxIt();


	  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation"+familyDetailsSize, "relation"+familyDetailsSize, "");	  

	  $("#familyDetailsSize").val(++familyDetailsSize);
	});
	  // Close Button 
	$(".family_details").on("click", ".close", function() {
		
		$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
		$(this).parent().closest("ul").prev("ul").addClass("moved_down");
		var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
		
		$(this).parent().closest("ul").remove();
	    $("ul:last-of-type").find(".add").fadeIn(); 
	    // removing record
		});



	// Family details code ends	 
		
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=ContactSourceTypeID", '{}', "#contactSourceType", "contactSourceType", '${party.contactSourceTypeID}');	
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=OpportunityStatusID", '{}', "#opportunityStatus", "opportunityStatus", '${party.oppotunityStatusId}');	
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=NextActionID", '{}', "#nextAction", "nextAction", '${party.nextActionId}');
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=OccupationID", '{}', "#occupation", "occupation", '${party.workProfession}');
	
	$("select#stateId").bind({
		"change": function(){
			if($("#stateId").val() != ""){
			jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId=" + $("#stateId").val(), '{}', "#cityId", "cityId", '${addressList.cityId}');	
			}
		}
	});
	

	
	function saveInfo(){
		$("#frmParterProfile").submit();
	}
</script>

</html>