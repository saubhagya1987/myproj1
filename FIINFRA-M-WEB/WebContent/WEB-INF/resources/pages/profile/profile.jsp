<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
#Footer_Type .common_footer_actions #main_actions .btn_grup { width: 231px; }
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
#Add_Profile_Info .family_details .li_four {
	width: 14%;
	margin-right: 2px;
}
/*#Add_Profile_Info .family_details .li_six {
	width: 1%;
	margin-left: 30px;
}*/
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>
<script>
function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
	  }	 
</script>


<script>
	$(document).ready(function() {
       $('input').placeholder();
		$("#frmParterProfile").validate({
			 ignore: []
		});
		$("#pincode").rules("add", {regex:"^([0-9]{6})$",messages: {regex: "Enter valid pin code" }});
		
		$('li').addClass('rel');
		// $("#salutationId").rules("add", {min:81001,messages: {min: "Please Select Salutation" }});
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

	});
</script>
<div class="" id="Add_Profile_Info">
  <section class="main">
    <section class="content common_content personalization_in">
      <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <form:form class="form-horizontal" id="frmParterProfile" name="frmParterProfile" action="${pageContext.request.contextPath}/partner/profile/update" method="POST" commandName="party">
      <input type="hidden" name="nextPageUrl" id="nextPageUrl"/>
      <input type="hidden" id="recordTypeId" name="recordTypeId" value="${party.recordTypeId}">
      <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
        <fmt:formatDate pattern="dd-MMM-yyyy" value="${party.dob}" var="dob"/>
        <form:hidden path="id" id="partyId" name="party.id" />
        <input type="hidden" name="message" id="message" value="${success}" />
        <input type="hidden" name="refer" id="refer" value="0" />
        <c:set var="addressList" value="${party.addressList[0]}" > </c:set>
        <c:set var="associatedParties" value="${party.associatedParties}" > </c:set>
        <%-- <c:out value="${error }"></c:out> --%>
        <section class="in_content clearfix" id="personalization">
        <div id="page_loader"></div>
        <div style="padding: 10px 10px 0;">
          <div id="tabs">
            <ul>
              <li><a href="#tabs-1" id="tabs1" class="pProfilePersonalDetailsLink">Personal Details</a></li>
              <li><a href="#tabs-2" id="tabs2" class="pProfileContactDetailsLink">Contact Details</a></li>
              <li><a href="#tabs-3" id="tabs3" class="pProfileFamilyDetailsLink">Family Details</a></li>
              <li><a href="#tabs-4" id="tabs4" class="pProfileOriginzationDetailsLink">Origination Details</a></li>
              <li><a href="#tabs-5" id="tabs5" class="pProfileTrackerDetailsLink">Tracker Details</a></li>
            </ul>
            <div id="tabs-1" class="tab_border">
              <div id="personal_details">
                <div class="first_top_col rel style="margin-left:20px; margin-bottom:20px;"> <span class="mandatory"> </span>
                  <label class="form_label">Name</label>
                  <form:select path="salutationId" class="required" id="salutationId" items="${salutationList}" itemLabel="codeValue" itemValue="codeValueId"  />
                  <input name="firstName" id="firstName" maxlength="50" type="text" class="common_input Alfa" value="${party.firstName}">
                  <input name="lastName" id="lastName" type="text" maxlength="50" class="common_input required Alfa" value="${party.lastName}">
                </div>
                <div id="personal_details" class="fl first_col">
                  <ul class="reset clearfix first_col_ul">
                    <li class="clearfix">
                      <label class="form_label"><span class="required_star">*</span>Date of Birth</label>
                      <input id="birth_date3" name="dobAsString" type="text" class="birth_date common_input5 datepicker required" value="${dob}" readonly="readonly" onChange="calculateAge();">
                      &nbsp;</li>
                    <li class="clearfix">
                      <label class="form_label">Gender</label>
                      <ul class="reset clearfix thumb_select_ul emergency_categoery_ul gender">
                        <li class="fl"><a href="#">
                          <div class="categoery job" id="12001">
                            <div class="thumb male"></div>
                          </div>
                          <label class="label">Male</label>
                          </a></li>
                        <li class="fl"><a href="#">
                          <div class="categoery other" id="12002">
                            <div class="thumb female"></div>
                          </div>
                          <label class="label">Female</label>
                          </a></li>
                        <input name="genderId" id="genderId" value=""  type="hidden" >
                        </input>
                      </ul>
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Marital Status</label>
                      <form:select path="maritalStatusID" id="maritalStatusID" items="${maritalStatusList}" itemLabel="codeValue" itemValue="codeValueId"  />
                    </li>
                  </ul>
                </div>
                <div class="fr second_col">
                  <ul class="reset clearfix second_col_ul">
                    <li class="clearfix">
                      <label class="form_label">Occupation</label>
                      <form:select path="workProfession" id="workProfession" items="${occupationList}" itemLabel="codeValue" itemValue="codeValueId"  />
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Company Name</label>
                      <input class="common_input" name="companyName" type="text" value="${party.companyName}">
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Designation</label>
                      <input class="common_input" name="workDesignation" type="text" value="${party.workDesignation}">
                    </li>
                    <li class="clearfix">
                      <label class="form_label">PAN</label>
                      <input class="common_input" id="panNumber" name="panNumber" type="text" onchange="validatePAN('panNumber');" value="${party.panNumber}">
                    </li>
                  </ul>
                </div>
              </div>
              <div class="clr"></div>
            </div>
            <div id="tabs-2" class="tab_border">
              <div id="contact_details">
                <div class="Cont_Details_first_col">
                  <ul class="reset clearfix Cont_Details_first_col_ul">
                    <input type="hidden" name="addressList[0].id" value="${addressList.id}" />
                    <input type="hidden" name="addressList[0].partyId" value="${party.id}" />
                    <li class="clearfix">
                      <label class="form_label">Address 1</label>
                      <input name="addressList[0].street1" id="street1" type="text" class="common_input" />
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Address 2</label>
                      <input name="addressList[0].street2" id="street2" type="text" class="common_input" />
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Address 3</label>
                      <input name="addressList[0].street3" id="street3" type="text" class="common_input" />
                    </li>
                  </ul>
                </div>
                <div class="Cont_Details_second_col">
                  <ul class="reset clearfix Cont_Details_second_col_ul">
                    <li class="clearfix">
                      <label class="form_label">Country</label>
                      <form:select path="addressList[0].countryId" id="countryId" items="${countryList}" itemLabel="codeValue" itemValue="codeValueId"  />
                    </li>
                    <li class="clearfix">
                      <label class="form_label">State</label>
                      <select id="stateId" name="addressList[0].stateId" >
                        <option value="-1">-- Select --</option>
                      </select>
                    </li>
                    <li class="clearfix">
                      <label class="form_label">City</label>
                      <select id="cityId" name="addressList[0].cityId">
                        <option value="-1">-- Select --</option>
                      </select>
                    </li>
                    <li class="clearfix rel">
                      <label class="form_label">Pin Code</label>
                      <input type="text" name="addressList[0].postalCode" id="pincode" class="common_input" value="${addressList.postalCode}">
                    </li>
                  </ul>
                </div>
                <div class="Cont_Details_third_col">
                  <ul class="reset clearfix Cont_Details_third_col_ul">
                    <li class="clearfix rel">
                      <label class="form_label"><span class="required_star">*</span>Email</label>
                      <input name="contactEmail1" id="contactEmail1" type="text" class="common_input required email" value="${fn:trim(party.contactEmail1)}" maxlength="75">
                    </li>
                    <li class="clearfix rel">
                      <label class="form_label">Mobile</label>
                      <input name="contactMobile1" type="text" class="common_input mobileNL" value="${fn:trim(party.contactMobile1)}" placeholder="+91 9999999999">
                    </li>
                    <li class="clearfix rel">
                      <label class="form_label">Alternate No.</label>
                      <input name="contactMobile2" type="text" class="common_input mobileNL" value="${fn:trim(party.contactMobile2)}">
                    </li>
                  </ul>
                </div>
              </div>
              <div class="clr"></div>
            </div>
            <div id="tabs-3" class="tab_border">
              <div class="family_details">
                <input type="hidden" id="familyDetailsSize" name="familyDetailsSize" value="${familyDetailsSize}"/>
                <c:forEach items="${party.associatedParties}" var="family" varStatus="count" >
                  <ul class="reset clearfix Family_Details_col clearfix default_ul" id="ul${count.index}" >
                    <input type="hidden" name="partyId${count.index}" value="${party.id}" />
                    <input type="hidden" name="relatedPartyId${count.index}" value="${family.relatedPartyId}" />
                    <li class="clearfix li_one rel">
                      <input name="firstName${count.index}" id="firstName${count.index}" type="text" class="common_input Alfa" value="${family.firstName}" placeholder="First Name" maxlength="50">
                    </li>
                    <li class="clearfix li_two rel">
                      <input name="lastName${count.index}" id="lastName${count.index}" type="text" class="common_input Alfa" value="${family.lastName}" placeholder="Last Name" maxlength="50">
                    </li>
                    <li class="clearfix li_three">
                      <fmt:formatDate pattern="dd-MMM-yyyy" value="${family.dob}" var="associatedPartiesDOB1"/>
                      <input name="dob${count.index}" type="text" id="dob${count.index}" readonly="readonly" class="birth_date common_input4 datepicker" value="${associatedPartiesDOB1}" placeholder="dd-mmm-yyyy">
                    </li>
                    <li class="clearfix li_four">
                     <input type="hidden" id="relationshipId${count.index}" value="${family.relationshipId}" />
                      
                      <select name="relation${count.index}" id="relation${count.index}">
                      
                        <option value="-1">-- Select---</option>
                      </select>
                    </li>
                    <li class="clearfix li_five">
                      <input type="hidden" id="workProfessionId${count.index}" value="${family.workProfession}" />
                      
                      <select name="workProfession${count.index}" id="workProfession${count.index}">
                        <option value="-1">-- Select---</option>
                      </select>	
                    </li>
                    <li class="clearfix li_five_one">
                      	<input name="panNo${count.index}" type="text" id="panNo${count.index}" class="common_input" value="${family.panNumber}" placeholder="Pan No" onchange="validatePAN('panNo${count.index}');">
                    </li>
                   <%-- <c:if test="${count.index==familyDetailsSize-1}">--%>
                      <li class="clearfix li_six">
                        <div class="add hide">+</div>
                      <div class="close" onclick="deleteFamilyMember('${party.id}','${family.relatedPartyId}','${familyDetailsSize}','${count.index}',this);" >x</div>
                     
                      </li>
                   <%--</c:if>--%>
                    <c:if test="${count.index==familyDetailsSize-1}">
                      <li class="clearfix li_six">
                      <div class="close" onclick="deleteFamilyMember('${party.id}','${family.relatedPartyId}','${familyDetailsSize}','ul${count.index}',this);">x</div>
                        <div class="add">+</div>
                      </li>
                   </c:if>
                  </ul>
                </c:forEach>
              </div>
              <div class="clr"></div>
            </div>
            <div id="tabs-4" class="tab_border">
              <div id="origination-details">
                <ul>
                  <li style=" margin-bottom:20px;">
                    <label class="form_label">Campaign Name</label>
                    <input name="campaignName" id="campaignName" type="text" class="common_input" value="${party.campaignName}">
                  </li>
                  <li style=" margin-bottom:20px;">
                    <label class="form_label">Opportunity Source</label>
                    <form:select path="contactSourceTypeID" id="contactSourceTypeID" items="${contactSourceList}" itemLabel="codeValue" itemValue="codeValueId"  />
                  </li>
                  <li style=" margin-bottom:20px;">
                    <label class="form_label">Referred By</label>
                    <input name="contactReferalName" id="contactReferalName" type="text" class="common_input" value="${party.contactReferalName}">
                  </li>
                  <li class="clearfix">
                    <label class="form_label">Interested
                      in Offerings</label>
                    <ul
											class="reset clearfix thumb_select_ul emergency_categoery_ul interestedInOffering">
                      <c:forEach items="${party.partyAttributes}" var="offering" varStatus="count">
                        <c:choose>
                          <c:when test="${offering.attributeValue==1}">
                            <li class="fl"> <a href="#">
                              <div class="categoery not_applicable" id="${offering.attributeCodeID}" >
                                <div class="thumb ${offeringClass[count.index]}" ></div>
                                <input type="hidden" name="${offering.attributeCodeID}_value" value="1" id="${offering.attributeCodeID}_value" class="answers"/>
                              </div>
                              <label class="label">${offeringNames[count.index]}</label>
                              </a> </li>
                          </c:when>
                          <c:otherwise>
                            <li class="fl"> <a href="#">
                              <div class="categoery" id="${offering.attributeCodeID}" >
                                <div class="thumb ${offeringClass[count.index]}" ></div>
                                <input type="hidden" name="${offering.attributeCodeID}_value" value="" id="${offering.attributeCodeID}_value" class="answers"/>
                              </div>
                              <label class="label">${offeringNames[count.index]}</label>
                              </a> </li>
                          </c:otherwise>
                        </c:choose>
                      </c:forEach>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="clr"></div>
            </div>
            <div id="tabs-5" class="tab_border">
              <div id="Tracker_Details">
                <p>
                <div class="fl first_col">
                  <ul class="reset clearfix first_col_ul">
                    <li class="clearfix">
                      <label class="form_label">Opportunity Status</label>
                      <form:select path="oppotunityStatusId" id="oppotunityStatusId" items="${OpportunityStatusList}" itemLabel="codeValue" itemValue="codeValueId"  />
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Next Action</label>
                      <form:select path="nextActionId" id="nextActionId" items="${nextActionList}" itemLabel="codeValue" itemValue="codeValueId"  />
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
                          <div class="counter_parent">
                            <input type="text" id="C_P_Value" name="convertProbablity" class="range_counter" value="0" readonly="readonly"/>
                            <span class="unit">%</span></div>
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
                </p>
              </div>
              <div class="clr"></div>
            </div>
          </div>
        </div>
      </form:form>
      </section>
      
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <div id="Footer_Type">
        <section class="common_footer_actions">
          <div class="clearfix" id="main_actions">
            <ul class="reset clearfix fr btn_grup">
              <li class="fl list"><a href="#" class="anch save pProfileSaveLink" onclick="saveInfo()"><span class="txt">Save</span></a></li>
              <li class="fl list"><a href="#" onClick="checkData('${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2');" class="anch cancel"><span class="txt">Cancel</span></a></li>
            </ul>
          </div>
          <a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2');" class="back navgation"><span class="txt">Back</span></a> <a href="#" onclick="doSaveProfileOnNext('/riskProfile/datacollection/risk-profile/${partyId}');" class="next navgation"><span class="txt">Next</span></a> </section>
      </div>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 
  <!--pop up box-->
  <div id="Per_Con" class="common_custom_modal_edu_con"> <span class="close">X</span> <img src="" alt=""> </div>
</div>
<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
<div id="deleteConfirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      Are you sure to delete this family member?
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
<script>
	$(document).ready(
			function() {
				
				var rbsLinks = "${rbsLinks}";
				var pieces = rbsLinks.split(",");
				if(pieces != ""){
					for(var i=0;i<pieces.length;i++){
						$("."+pieces[i]).attr("href","#");
						$("."+pieces[i]).addClass("inactiveLink");
					}
					$("frmParterProfile").attr("action","#");
				}
				
				$("#tabs").tabs();
				$(function() {
					$(".datepicker").datepicker({
						dateFormat : "dd-M-yy",
						showOn : "button",
						buttonText : '',
						changeMonth : true,
						changeYear : true
					});
					$(".ui-datepicker-trigger").wrap(
							"<div class='datepicker-trigger-parent'></div>");
				});
				
				$( "#tabs" ).tabs();
			  	$( "#tabs a" ).click(function(e){
                       $(":selectBox-selectBoxIt").each(function(){
                       $(this).data('selectBox-selectBoxIt').refresh();
                       });
			  		var curTab = $('.ui-tabs-active');
			        curTabIndex = curTab.index();
			        $("#refer").val(curTabIndex);      
			  	});
				
				$("select").selectBoxIt();
				// Calls the selectBoxIt method on your HTML select box
				
				$("#street1").val('${addressList.street1}');
				$("#street2").val('${addressList.street2}');
				$("#street3").val('${addressList.street3}');
				
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
	
	createSlider("#Conversion_Probability", 0, 100, 25, "#C_P_Value");
	createSlider("#opportunity_rating", 5001, 5003, 1, "#oppotunityRatingId");
	
	$(function() {
		 $( ".datepicker" ).datepicker({
		  	dateFormat: "dd-M-yy",
		  	changeMonth: true,
	  		changeYear: true,
	   		yearRange: "-100:+0", 
		   	dateFormat: "dd-M-yy",
		  	showOn: "button",
		  	buttonText: '',
		  	maxDate: '0', 
		 });
	});	
</script> 
<script>
	$(document).ready(function() {
		
		
		$("#confirmDialog .close").click(function(){
	 	    $(".overlay").fadeOut("slow");
	 	 $("#confirmDialog").fadeOut("slow");
	 	  });
		
		if( "${activeTab}" == "1" ) {
			$("#tabs2").click();		
		} else if( "${activeTab}" == "2" ) {
			$("#tabs3").click();
		} else if( "${activeTab}" == "3" ) {
			$("#tabs4").click();
		} else if( "${activeTab}" == "4" ) {
			$("#tabs5").click();
		}
		
		$(".selectboxit-container ").click(function(){
		    //$('#personal_details_accordian').perfectScrollbar("update");
			//$('#contact_details_accordian').perfectScrollbar("update");
		 	$('.family_details').perfectScrollbar("update");
			});
		
		$('.wrapper').attr('id', 'Add_Profile_Info');
		
		$("select").selectBoxIt();
		
		$('.toggle').toggles();
		$('#personal_details_accordian').perfectScrollbar();
		$('#contact_details_accordian').perfectScrollbar();
		$('#contact_details_accordian').perfectScrollbar();
		$('.family_details').perfectScrollbar();	
		$('#origination-details').perfectScrollbar();
		$('#Tracker_Details').perfectScrollbar();
		$('.Family_Details_col.default_ul:first').addClass("first_default_ul");
		
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
		 
		  	 $(".gender a").click(function(){
		 		$(".gender a").children(".categoery").removeClass("not_applicable");
		 		$(this).children(".categoery").addClass("not_applicable");
		 		$("#genderId").val($(this).children(".categoery").attr("id"));		
		 	});
		 	
		 	$(".gender a").children(".categoery").removeClass("not_applicable");
		 	$("#" + '${party.genderId}').addClass("not_applicable");
		 	$("#genderId").val('${party.genderId}');
		 	
		 	if("${party.convertProbablity}"!="" && "${party.convertProbablity}"!=null){
		 		if("${party.convertProbablity}" == "130001"){
		 			$('#Conversion_Probability').slider( "option", "value", '25');
					$('#C_P_Value').val('25');
		 		}else if("${party.convertProbablity}" == "130002"){
		 			$('#Conversion_Probability').slider( "option", "value", '50');
					$('#C_P_Value').val('50');
		 		}else if("${party.convertProbablity}" == "130003"){
		 			$('#Conversion_Probability').slider( "option", "value", '75');
					$('#C_P_Value').val('75');
		 		}
		 		else if("${party.convertProbablity}" == "130004"){
		 			$('#Conversion_Probability').slider( "option", "value", '100');
					$('#C_P_Value').val('100');
		 		}else{
		 			$('#Conversion_Probability').slider( "option", "value", '0');
					$('#C_P_Value').val('0');
		 		}
		 		
			}
		 	else {
		 		$('#Conversion_Probability').slider( "option", "value", '0');
				$('#C_P_Value').val('0');
		 	}
				
			$('#opportunity_rating').slider( "option", "value", '${party.oppotunityRatingId}');
			$('#oppotunityRatingId').val('${party.oppotunityRatingId}');
			
				
			jsonPopulateDropdownOthers("${pageContext.request.contextPath}/common/countries?codeValueId=3001", '{}', "#countryId", "countryId", '3001');	
			$("select#countryId").bind({
				"change": function(){
					jsonPopulateDropdownOthers("${pageContext.request.contextPath}/common/getCities?parentId="+$("#countryId").val(), '{}', "#stateId", "stateId", '${addressList.stateId}');	
				},
			});
			
			
			var familyDetailsSize = $("#familyDetailsSize").val();	

			//Add Button Starts
			
				
			// Code to populate relationship drop down under family details
			for(var i=0;i<familyDetailsSize;i++){
				var relationshipIdVar = "#relationshipId"+i; 
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation"+i, "relation"+i, $(relationshipIdVar).val(),1);
				var workProfessionVar = "#workProfessionId"+i; 
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=OccupationID", '{}', "#workProfession"+i, "workProfession"+i, $(workProfessionVar).val(),2);
			}

			

						
			$(".family_details").on("click", ".add", function() {
				
			  	$(this).fadeOut("fast");
			  
			$(this).prev(".close").fadeIn("slow");

			$(this).parent().closest("ul").after("<ul class='reset clearfix Family_Details_col clearfix'><li class='clearfix li_one rel'><input id='firstName"+familyDetailsSize+"' name='firstName"+familyDetailsSize+"' type='text' class='common_input Alfa' placeholder='First Name'/></li><li class='clearfix li_two rel'><input id='lastName"+familyDetailsSize+"' name='lastName"+familyDetailsSize+"' type='text' class='common_input Alfa' placeholder='Last Name'/></li><li class='clearfix li_three'><input id='dob"+familyDetailsSize+"' name='dob"+familyDetailsSize+"' type='text' placeholder='dd-mmm-yyyy' class='birth_date common_input4 datepicker' readonly='readonly' /></li><li class='clearfix li_four'><select name='relation"+familyDetailsSize+"' id='relation"+familyDetailsSize+"'><option>Select</option></select></li><li class='clearfix li_five'><select name='workProfession"+familyDetailsSize+"' id='workProfession"+familyDetailsSize+"'><option>Select</option></select></li><li class='clearfix li_five_one rel'> <input id='panNo"+familyDetailsSize+"' name='panNo"+familyDetailsSize+"' type='text' class='common_input' placeholder='Pan No' value=''  onchange='validatePAN(\"panNo"+familyDetailsSize+"\");'/></li><li class='clearfix li_six'><div class='close'>x</div><div class='add'>+</div></li></ul> ");
			
			$(function() {
				  	
					 $( ".datepicker" ).datepicker({
					  dateFormat: "dd-M-yy",
					  changeMonth: true,
				    	changeYear: true,
				    	yearRange: "-100:+0", 
					  	dateFormat: "dd-M-yy",
					  	showOn: "button",
					  	buttonText: '',
					  	maxdate : 0
					 });
			  });

			  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );

			  $('input').placeholder();
			  $("select").selectBoxIt();


			  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation"+familyDetailsSize, "relation"+familyDetailsSize, "",1);	  
			  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=OccupationID", '{}', "#workProfession"+familyDetailsSize, "workProfession"+familyDetailsSize, "",2);	
			  $("#familyDetailsSize").val(++familyDetailsSize);
			});
			  // Close Button 
			/* $(".family_details").on("click", ".close", function() {
				if($(this).closest("ul.default_ul").hasClass("first_default_ul"))
				{
					
					$(this).closest("ul").find("input[type='text']").each(function(){
                    $(this).val("");
					$(this).attr("value","");
                });
				
                  
				}
				else
				{
				$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
				$(this).parent().closest("ul").prev("ul").addClass("moved_down");
				var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
				
			    $(this).parent().closest("ul").remove();
			    $("ul:last-of-type").find(".add").fadeIn("slow"); 
			    // removing record
				}
				}); */
			// Family details code ends	 
			$("select#stateId").bind({
				"change": function(){
					if($("#stateId").val() != ""){
						jsonPopulateDropdownOthers("${pageContext.request.contextPath}/common/getCities?parentId=" + $("#stateId").val(), '{}', "#cityId", "cityId", '${addressList.cityId}');	
					}
				}
			});
			$( document ).ajaxComplete(function() {
				var x = document.getElementById("frmParterProfile");
			    for (var i=0; i<x.length; i++) 
			    {
				   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
				   	{
				   		oldValues[i] = x.elements[i].value;
				   		if(x.elements[i].id=="panNumber" || x.elements[i].id.substring(0,5)=="panNo"){
				   			
				   			if(panCardCnt>0)
				   			{
				   				oldValues[i]="";
				   			}
				   			
				   		}
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
			 
			
	});
</script> 

<!-- custom scroll to "common_in_content" --> 
<!-- <script>
	$(document).ready(function() {
		//Tracker Details Rating value Slider
		createSlider('#Conversion_Probability', 0, 100, 1, "#C_P_Value")
		createSlider('#opportunity_rating', 5001, 5003, 1, "#oppotunityRatingId")

	});
</script> --> 
<!-- custom scroll to "common_in_content" --> 

<script>
	
function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}
	
	var oldValues = [];
	
	function saveInfo(){
		
		//$(".save").addClass("inactiveLink");
		
	 	if($("#lastName").val() == "" || $("#lastName").val() == " " || $("#lastName").val() == null )
		{
			var index = $('#tabs a[href="#tabs-1"]').parent().index();
            $("#tabs").tabs("option", "active", index);
            $(".save").removeClass("inactiveLink");
		} 
		if($("#contactEmail1").val() == "" || $("#contactEmail1").val() == " " || $("#contactEmail1").val() == null || $(".email").hasClass("error") || $(".mobileNL").hasClass("error"))
		{
			var index = $('#tabs a[href="#tabs-2"]').parent().index();
            $("#tabs").tabs("option", "active", index);
            $(".save").removeClass("inactiveLink");
		}
		if($("#birth_date3").val() == "" || $("#birth_date3").val() == " " || $("#birth_date3").val() == null )
		{
			var index = $('#tabs a[href="#tabs-1"]').parent().index();
			$("#tabs").tabs("option", "active", index);
			$(".save").removeClass("inactiveLink");
		}
		
		var familyDetailsSize=$("#familyDetailsSize").val();
		
		for( var i=0; i <familyDetailsSize; i++  )
		{
			
			if($("#firstName"+i).val()!="" || $("#relation"+i).val()!=null ||  $("#dob"+i).val()!="" || $("#panNo"+i).val() != "" || $("#workProfession"+i).val()!=null ){
				if($("#lastName"+i).val()=="" || $("#lastName"+i).val()==" " || $("#lastName"+i).val()==null){
					$("#lastName"+i).addClass("required");
					var index = $('#tabs a[href="#tabs-3"]').parent().index();
		            $("#tabs").tabs("option", "active", index);
		            $(".save").removeClass("inactiveLink");
		           
				}
			}	
			/* else if( $("#lastName"+i).val()!="" && $("#lastName"+i).val()!=" " && $("#lastName"+i).val()!=null )
			{
				if($("#relation"+i).val()=="" || $("#relation"+i).val()==" " || $("#relation"+i).val()==null){
					$("#relation"+i).addClass("required");
					var index = $('#tabs a[href="#tabs-3"]').parent().index();
		            $("#tabs").tabs("option", "active", index);
		            $(".save").removeClass("inactiveLink");
				}
				else if( $("#dob"+i).val()=="" || $("#dob"+i).val()==" " || $("#dob"+i).val()==null )
				{
					$("#dob"+i).addClass("required");
					var index = $('#tabs a[href="#tabs-3"]').parent().index();
		            $("#tabs").tabs("option", "active", index);
		            $(".save").removeClass("inactiveLink");
				}
				else {
					$("#lastName"+i).removeClass("required");
					$("#relation"+i).removeClass("required");
					$("#dob"+i).removeClass("required");					
				}
			}
		 */	else{
				$("#firstName"+i).removeClass("required");
				$("#lastName"+i).removeClass("required");
				$("#relation"+i).removeClass("required");
				$("#dob"+i).removeClass("required");
			}
		}
		
		var panSize = $("#familyDetailsSize").val();
		var panArray = new Array();
		for( var p = 0; p < panSize; p++ ){
			
			panArray[p] = $("#panNo"+p).val();
		}
		
		var panNum = $("#panNumber").val();		
		
		if( panNum !="" && panNum !=" " && panNum != null ){
			var index = $('#tabs a[href="#tabs-3"]').parent().index();
			for( var k = 0; k < panArray.length; k++ ){
				if( panNum == panArray[k] || panNum == panArray[k] ){
					displayMsg("Please enter unique Pan Number.");
		        	$("#panNo"+k).val("");
		        	$("#tabs").tabs("option", "active", index);
		        	return false;
				}
			}
		}
		
		for(var m = 0; m < panArray.length; m++) {
		    for(var n = m + 1; n < panArray.length; n++) {
		        if (m != n) {
		        	if( panArray[m] != null && panArray[m] != "" && panArray[m] != " " ){
		        		if( panArray[m] == panArray[n] ){
			        		alertMessage("Please enter unique Pan Number.");
				        	$("#panNo"+n).val("");
				        	return false;
			        	}
		        	}
		        }
		    }
		}
		
		if($("#frmParterProfile").validate().form()){
			if(checkChangeData())
				$("#frmParterProfile").submit();
			
		}
		panCardCnt=0;

		
	}
	
	
	function doSaveProfileOnNext(url)
	{
		
		$("#nextPageUrl").val(url);
		
		if($("#lastName").val() == "" || $("#lastName").val() == " " || $("#lastName").val() == null )
		{
			var index = $('#tabs a[href="#tabs-1"]').parent().index();
            $("#tabs").tabs("option", "active", index);
            $(".save").removeClass("inactiveLink");
		} 
		if($("#contactEmail1").val() == "" || $("#contactEmail1").val() == " " || $("#contactEmail1").val() == null )
		{
			var index = $('#tabs a[href="#tabs-2"]').parent().index();
            $("#tabs").tabs("option", "active", index);
            $(".save").removeClass("inactiveLink");
		}
		if($("#birth_date3").val() == "" || $("#birth_date3").val() == " " || $("#birth_date3").val() == null )
		{
			var index = $('#tabs a[href="#tabs-1"]').parent().index();
			$("#tabs").tabs("option", "active", index);
			$(".save").removeClass("inactiveLink");
		}
		
		var familyDetailsSize=$("#familyDetailsSize").val();
		
		for( var i=0; i <familyDetailsSize; i++  )
		{
			
			if($("#firstName"+i).val()!="" || $("#relation"+i).val()!=null ||  $("#dob"+i).val()!="" || $("#panNo"+i).val() != "" || $("#workProfession"+i).val()!=null ){
				if($("#lastName"+i).val()=="" || $("#lastName"+i).val()==" " || $("#lastName"+i).val()==null){
					$("#lastName"+i).addClass("required");
					var index = $('#tabs a[href="#tabs-3"]').parent().index();
		            $("#tabs").tabs("option", "active", index);
		            $(".save").removeClass("inactiveLink");
		           
				}
			}	
		else{
				$("#firstName"+i).removeClass("required");
				$("#lastName"+i).removeClass("required");
				$("#relation"+i).removeClass("required");
				$("#dob"+i).removeClass("required");
			}
		}
		
		var panSize = $("#familyDetailsSize").val();
		var panArray = new Array();
		for( var p = 0; p < panSize; p++ ){
			
			panArray[p] = $("#panNo"+p).val();
		}
		
		var panNum = $("#panNumber").val();		
		
		if( panNum !="" && panNum !=" " && panNum != null ){
			var index = $('#tabs a[href="#tabs-3"]').parent().index();
			for( var k = 0; k < panArray.length; k++ ){
				if( panNum == panArray[k] || panNum == panArray[k] ){
					displayMsg("Please enter unique Pan Number.");
		        	$("#panNo"+k).val("");
		        	$("#tabs").tabs("option", "active", index);
		        	return false;
				}
			}
		}
		
		for(var m = 0; m < panArray.length; m++) {
		    for(var n = m + 1; n < panArray.length; n++) {
		        if (m != n) {
		        	if( panArray[m] != null && panArray[m] != "" && panArray[m] != " " ){
		        		if( panArray[m] == panArray[n] ){
			        		alertMessage("Please enter unique Pan Number.");
				        	$("#panNo"+n).val("");
				        	return false;
			        	}
		        	}
		        }
		    }
		}
		
		if($("#frmParterProfile").validate().form()){
				$("#frmParterProfile").submit();
		}
		panCardCnt=0;

	}
	
	
	function jsonPopulateDropdown(url, data, dropdown, fieldName, selectedValue,flag) {
		$(dropdown).empty();
		if(flag==1)
			$(dropdown).data("selectBox-selectBoxIt").add({ value: "1", text: " Relation "});
		else if(flag=2)
			$(dropdown).data("selectBox-selectBoxIt").add({ value: "1", text: " Profession "});
		$.ajax({
				type : "GET",
				url : url,
				data : data,
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(msg) {
					$.each(msg, function(index, item) {					
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });					
					});

					var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
				    selectBox.selectOption(selectedValue);
				},
				error : function(msg) {
					$('.result').html(msg.d);
				}
			});
		return false;
	}
	function jsonPopulateDropdownOthers(url, data, dropdown, fieldName, selectedValue) {
		$(dropdown).empty();
		$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
		
		$.ajax({
				type : "GET",
				url : url,
				data : data,
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(msg) {
					$.each(msg, function(index, item) {					
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });					
					});

					var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
				    selectBox.selectOption(selectedValue);
				},
				error : function(msg) {
					$('.result').html(msg.d);
				}
			});
		return false;
	}
	
	function checkData(url){
		var x = document.getElementById("frmParterProfile");
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
		var x = document.getElementById("frmParterProfile");
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
	
	
	
	function cancelPage(url){
		window.location.href=url;
	}
	
	function alertMessage(msg)
	{
		$("#dialog1").html(msg);
		$( "#dialog1").dialog( "open" );
	}

	function deleteFamilyMember(partyid, familyPartyId, size,id,thisObj)
	{	
		
		if(partyid=='' || familyPartyId=='')
		{
			if($(thisObj).closest("ul.default_ul").hasClass("first_default_ul"))
			{
				$(thisObj).closest("ul").find("input[type='text']").each(function(){
                $(this).val("");
				$(this).attr("value","");
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation0", "relation0", "",1);
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=OccupationID", '{}', "#workProfession0", "workProfession0", "",2);
            });
		}  
		else
			{
				
			$(thisObj).parent().closest("ul").siblings("ul").removeClass("moved_down");
			$(thisObj).parent().closest("ul").prev("ul").addClass("moved_down");
			var count_section = $(thisObj).parent().closest(".EP_cnt ").find(".selectboxit").length;
			
		    $(thisObj).parent().closest("ul").remove();
		    $("ul:last-of-type").find(".add").fadeIn("slow"); 
		    // removing record
			}
			return false;
		}

		$(".aa_up").html("Are you sure you want to delete this family member?");
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();

		$(".aa_yes").click(function(){deletem()});
		
				
		function deletem(){
			closeDialog();
			var url = '${pageContext.request.contextPath}/partner/deleteFamilyMember'	
				$.ajax({
					type : "POST",
					url : url,
					data : {'familyPartyId':familyPartyId,'partyId':partyid},
					success : function(msg) {
						if(msg==1)
						{  
							if($(thisObj).closest("ul.default_ul").hasClass("first_default_ul"))
								{
									$(thisObj).closest("ul").find("input[type='text']").each(function(){
				                    $(this).val("");
									$(this).attr("value","");
									jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation0", "relation0", "",1);
									jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=OccupationID", '{}', "#workProfession0", "workProfession0", "",2);
				                });
							}  
							else
								{
									
								$(thisObj).parent().closest("ul").siblings("ul").removeClass("moved_down");
								$(thisObj).parent().closest("ul").prev("ul").addClass("moved_down");
								var count_section = $(thisObj).parent().closest(".EP_cnt ").find(".selectboxit").length;
								
							    $(thisObj).parent().closest("ul").remove();
							    $("ul:last-of-type").find(".add").fadeIn("slow"); 
							    // removing record
								}
							alertMessage("Family member deleted successfully");
						}
						else
						{
							alertMessage("You can't delete this family member");
						}	
					},
					/* error : function(msg) {
						alert("error1234"+msg);
					} */
				});
			}
			}
	
</script>
