<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.thumb_select_ul .categoery .newthumb { height:100%; width:100%; text-align:center; line-height: 97px; }
#confirmDialog {
	display: block;
	height: 130px;
	display: none;
	width: 355px;
	box-shadow: 0 0 15px 1px #757575;
}
</style>
<script>
function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
	 }	
</script>
<div id="emergency_readiness">
  <!-- Main starts-->
  <section class="main"> 
	<section class="content common_content"> 
	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
  <!-- Advice Assumptions Submenu Starts -->
    <form class="form-horizontal" id="frmAssumption" name="frmAssumption" >
    	<input type="hidden" name="initialData" id="initialData" value=""/>
    	<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
	    <div class="common_ad_ass_selector selector_noline">
	      <ul class="clearfix reset">
	        <li>
	          <p>Advice Assumptions</p>
	        </li>
	      </ul>
	      <div class="Advice_Assump_Menu">
	  		<ul class="clearfix reset Advice_Assump_Menu_In" >
	              <li class="clearfix">
	              <label class="form_label">Estimated Life Expectancy</label>
	              <div class="range_parent">
	                <div class="scale clearfix">
	                  <div class="scale_range"><span class="low extrem">70</span><span class="high extrem">100</span></div>
	                  <div id="98021"></div>
	                  <div class="counter_parent">
	                    <input type="text" readonly id="98021_payment" class="range_counter" />
	                    <span class="unit">yrs</span> </div>
	                </div>
	              </div>
	            </li>
	            <li class="clearfix">
	              <label class="form_label">Emergency Funds Required -  XX times monthly expense</label>
	              <div class="range_parent">
	                <div class="scale clearfix">
	                  <div class="scale_range"><span class="low extrem">3</span><span class="high extrem">36</span></div>
	                  <div id="98027"></div>
	                  <div class="counter_parent">
	                    <input type="text" readonly id="98027_payment" class="range_counter" />
	                    <span class="unit">months</span> </div>
	                </div>
	              </div>
	            </li>
	            <li class="clearfix"> <a class="cancel">CANCEL</a><a class="save">SAVE</a></li>
	        </ul>
	       </div>
	    </div>
	    <div class="clr"></div>	    
	    <c:forEach items="${adviceAssumptions}" var="assumption">		
			<c:choose>
				<c:when test="${assumption.assumptionCodeId eq '98021' or assumption.assumptionCodeId eq '98027'}">				
					<script>
						createSlider('#${assumption.assumptionCodeId}', ${assumption.valueStartRange}, ${assumption.valueEndRange}, 1, '#${assumption.assumptionCodeId}_payment');
						$('#${assumption.assumptionCodeId}').slider( "option", "value", ${assumption.assumptionValue});
						$('#${assumption.assumptionCodeId}_payment').val(${assumption.assumptionValue});
					</script>
				</c:when>
			</c:choose>
		</c:forEach>

    </form>
    <!-- Advice Assumptions Submenu Ends -->
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmEmergencyReadiness" name="frmEmergencyReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />
      
		<x:parse xml="${sectionData}" var="output"/>
	
		<c:set var="questionTypeMap" value=""/>
      	<section class="in_content common_in_content clearfix">
        	<ul class="reset clearfix" id="emergency_readiness_ul">
    
    		<c:set var="displayOnSameLine" value="FALSE"/>
    		   
        	<x:forEach select="$output/Section/Question" var="item">
        	
			<c:set var="questionTypeMapTemp"><x:out select="$item/@AttributeCodeId" escapeXml="false"/>:<x:out select="$item/@QuestionType" escapeXml="false"/> </c:set>
			<c:set var="questionTypeMap" value="${questionTypeMap};${questionTypeMapTemp}" />        	
        	
        	<c:set var="isHidden" value=""/>
        	<x:if select="$item/@ParentQuestionId != '0'">
        		<c:set var="isHidden" value="style=display:none"/>
        	</x:if>
   	        	
               	<x:choose>           		
             		<x:when select="$item/@QuestionType = '85009'">
               			<li id="confidence_scale" class="clearfix" <c:out value="${isHidden}" /> >
		               		<div class="<x:out select="$item/@cssClass" />">
			              		<p>
			              		<x:if select="$item/@AttributeCodeId = '94009'">
			              		<span class="required_star">*</span>
			              		</x:if>
			              		<x:out select="QuestionText" /></p>
			            	</div>
				            <div class="ques_action clearfix">
				              <div class="range_parent emer_confidence">
				                <div class="fl scale clearfix">
		               		
			                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
			                    		<div class="mark"><br /></div>
			                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
			                  		</div>
			                  		<div class="counter_parent">
			                    		<input type="text" readonly id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter answer">
			                  		</div>
			                  		<script>
			                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
			                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
			                  		</script>
			                  		
			                  		<c:set var="sliderOptionRange" value=""/>
			                  		<x:forEach select="$item/Options/Option" var="optionElement">
			                  			<c:set var="sliderOptionTemp"> <x:out select="$optionElement/@AttributeCodeID" escapeXml="false"/>:<x:out select="$optionElement" escapeXml="false"/> </c:set>
			                  			<c:set var="sliderOptionRange" value="${sliderOptionRange};${sliderOptionTemp}"/>
			                  		</x:forEach>
			                  	
			                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value="<c:out value="${sliderOptionRange}" />"  />                    
		                  		</div>
			              	</div>
			              	<div class="clr"></div>
			            	</div>
	            		</li>
               		</x:when>
               			 
               		<x:when select="$item/@QuestionType = '85010'">
               			<li id="confidence_scale" class="clearfix" <c:out value="${isHidden}" /> >
		               		<div class="<x:out select="$item/@cssClass" />">
			              		<p><x:out select="QuestionText" /></p>
			            	</div>
			            	<div class="ques_action clearfix">
				              <div class="range_parent emer_confidence">
				                <div class="fl scale clearfix">
		               		
		                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
		                    		<div class="mark"><br /></div>
		                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
		                  		</div>
		                  		<div class="counter_parent">
		                    		<input type="text" id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter freeform answer">
		                  		</div>
		                  		<script>
		                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
		                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
		                  		</script>
		                  		
		                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />                    
		                  		</div>
		              		</div>
		              		<div class="clr"></div>
		            		</div>
	            		</li>
               		</x:when>
               		              	
               		<x:when select="$item/@QuestionType = '85002'">
               			<li id="confidence_scale" class="clearfix" <c:out value="${isHidden}" /> >
	               			<div class="<x:out select="$item/@cssClass" />">
			              		<p><x:out select="QuestionText" /></p>
			            	</div>
			            	<div class="ques_action clearfix">
				              	<div class="range_parent emer_confidence">
					                <div class="fl scale clearfix">
				               			<div id="emergency_situation">
							                <div class="toggle" id="div_<x:out select="$item/@AttributeCodeId" />"></div>
							                <input type="hidden" id="<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  class="toggelCtrl answer" />					                
							             </div>
							             <script>
							             $('.toggle').toggles();
							             	$("#div_<x:out select="$item/@AttributeCodeId" />").on('toggle', function (e, active) {
							          	    	if (active) {					          	    		
								          		  	$("#<x:out select="$item/@AttributeCodeId" />").val('<x:out select="$item/Options/Option[1]/@AttributeCodeId" />' + '_' + '<x:out select="$item/Options/Option[1]/@Value" />');
								          	    } else { 	    
								          		   	$("#<x:out select="$item/@AttributeCodeId" />").val('<x:out select="$item/Options/Option[2]/@AttributeCodeId" />' + '_' + '<x:out select="$item/Options/Option[2]/@Value" />');
								          	    }					          	    
							          		});
							             </script>
					             	</div>
		              			</div>
		              		
		              		<x:choose>	              		
		              			<x:when select="$item/ShowNextQuestionInFront = 'TRUE' ">
		              				<c:set var="displayOnSameLine" value="TRUE"/>
		              			</x:when>
		              			<x:otherwise>
		              				</div>
              					</li>
		              			</x:otherwise>	              		
		              		</x:choose>

               		</x:when>
               		
               		<x:when select="$item/@QuestionType = '85005'">
               			<div class="box">
             			 <label class="form_label" style="margin-top: 138px; margin-right: -30px; float: right;"><x:out select="QuestionText" /></label>
			            <li class="clearfix">
						
			               <textarea id="<x:out select="$item/@AttributeCodeId" />" value="" name="<x:out select="$item/@AttributeCodeId" />"  rows="5" cols="40" style="margin-top: 12px; margin-left: 587px;" class="answer"></textarea>
			               <!-- </div> -->
			             </li></div>
			       </x:when>
               			                	
               		<x:when select="$item/@QuestionType = '85006'">
               		<%-- <input type="hidden" id="attr" name="attr" value="<x:out select="$item/@AttributeCodeId" />"/> --%>
               		<x:set var="attr" select="string($item/@AttributeCodeId)"/>               		
		                  				<script>
               							//alert('${attr}');
					               		</script>             			
            			<c:if test="${attr==94513}">
		                 	<div class="<x:out select="$item/@cssClass" />">
			              		<p><x:out select="QuestionText" /></p>
			            	</div>
			            	    
			            </c:if>       		
               			<ul class="reset clearfix thumb_select_ul <c:if test="${attr==94137}">thumb_select_ul1</c:if> emergency_categoery_ul fr" >
              			<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
	                		<li class="fl">
		                		<a href="#">
		                  			<div id="div_<x:out select="$optionElement/@AttributeCodeID" />" class="categoery <c:if test="${attr==94513}">single_select</c:if>">
		                  				<input type="hidden" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="" class="answer"/>
		                    			<div class="newthumb" style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"></div>
		                  				<label class="label" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$optionElement/@AttributeCodeID" />"><x:out select="$optionElement" /></label>
		                  			</div>
		                  			<label class="label"><x:out select="$optionElement" /></label>
		                  		</a>
		                  	</li>
	                  	</x:forEach>
	                  	</ul>		
			
              			<c:if test="${displayOnSameLine == TRUE }">
              				<div class="clr"></div>
              				</div>
              				</li>
              				<c:set var="displayOnSameLine" value="FALSE"/>
              			</c:if>
              			
               		</x:when>
               		
               		

               	
               	</x:choose>	               
       	</x:forEach>       	
        </ul>
        
        <script>
        // Reset controllers on page load        
		$(".thumb_select_ul1").fadeOut();
		$("#div_94008").closest('li').fadeOut();
        $(".thumb_select_ul .categoery").find(".answer").val("");
		$(".thumb_select_ul .categoery").removeClass("not_applicable");
		$('#div_94008').toggles({on:false});
        
        </script>
		<input type="hidden" name="questionBankId" id="questionBankId" value="${questionBankId}"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="${sectionTypeId}" />
        <input type="hidden" name="inputData" id="inputData" value="" />
        <input type="hidden" name="nextPageUrl" id="nextPageUrl"/>
      </section>
      
      <c:set var="isDataSaved" value="inactiveLink"></c:set>
      <c:if test="${fn:length(questionDetails) gt 0}">
      	<c:set var="isDataSaved" value=""></c:set>
      </c:if>
      	<!-- Common_in_contnet ends --> 
      	<!-- Common footer starts -->
			<section class="common_footer_actions">
				<div id="main_actions" class="clearfix">
					<ul class="reset clearfix fr btn_grup3">
						<li class="fl list"><a href="#" class="anch save" ><span class="txt">Save</span></a></li>
						<li class="fl list"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection');" class="anch cancel"><span class="txt">Cancel</span></a></li>
						
					</ul>
					
				</div>
				<a href="#" onclick="checkData('${pageContext.request.contextPath}${previousPageUrl}');" class="back navgation"><span class="txt">Back</span></a>
				<a href="#" onclick="doSubmitOnNext()" class="next navgation" ><span class="txt">Next</span></a>
			</section>
		
		 	<c:set var="questionTypeMapArr" value="${fn:split(questionTypeMap, ';')}"/>

			<!-- Iterate Already Set Data from questionDetails Map -->		 							
			<c:forEach items="${questionTypeMapArr}" var="questionTypeMapArrVals" begin="0">
				<c:set var="questionTypeEle" value="${fn:split(questionTypeMapArrVals, ':')}"/>				
				<c:forEach items="${questionDetails}" var="questDetail">				
					<c:if test="${questDetail.questionId eq questionTypeEle[0]}">
						<c:choose>
							<c:when test="${questionTypeEle[1] eq '85009'}">
								<script>
									$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeRefferenceValue});
									$('#${questDetail.questionId}').val(${questDetail.attributeRefferenceValue});
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85010'}">
								<script>
									$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeRefferenceValue});
									$('#${questDetail.questionId}').val(${questDetail.attributeRefferenceValue});
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85002'}">
								<script>
 									$('#${questDetail.questionId}').val(${questDetail.attributeValue} + "_" + ${questDetail.attributeRefferenceValue});
 									if(${questDetail.questionId} == '94002'){
 										if(${questDetail.attributeRefferenceValue} == 1){
 											$('#div_${questDetail.questionId}').toggles({on:true});
											$(".thumb_select_ul1").fadeIn();
								 		 	$("#div_94008").closest('li').fadeIn();	
 										} else {	
 											$('#div_${questDetail.questionId}').toggles({on:false});
											$(".thumb_select_ul1").fadeOut();
								 		  	$("#div_94008").closest('li').fadeOut();
								 		  	$(".thumb_select_ul .categoery").find(".answer").val("");
								 		  	$(".thumb_select_ul .categoery").removeClass("not_applicable");
								 		  	$('#div_94008').toggles({on:false});
 										}
 									}
 									else if(${questDetail.questionId} == '94008'){
 										if(${questDetail.attributeRefferenceValue} == 1){
 											$('#div_${questDetail.questionId}').toggles({on:true});										
 										} else {										
 											$('#div_${questDetail.questionId}').toggles({on:false});											
 										}
 									}
 									
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85006'}">							
								<script>
									$('#div_${questDetail.attributeValue}').addClass("not_applicable");
		 							$('#${questDetail.attributeValue}').val(${questDetail.attributeRefferenceValue});
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85005'}">							
							<script>						
								$("#94516").val('${questDetail.attributeRefferenceValue}');
							</script>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>			
			</c:forEach>		
		</form>	
		
    	</section>
	</section>
  <!-- Main ends--> 
</div>
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        <spring:message code="deleteRecord" /></div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div>
<!-- Wrapper ends--> 
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>

<script>
$(".Advice_Assump_Menu .save").click(function(){
	
	var url = '${pageContext.request.contextPath}/partner/datacollection/assumption/save';
	var updatedAssumptionData = "98021:" + $("#98021_payment").val() + "," + "98027:" + $("#98027_payment").val(); 
	$.ajax({
		type : "POST",
		url : url,
		data : {
			updatedAssumptions : updatedAssumptionData,
			clientId : ${partyId}
		},
		dataType : "HTML",
		success : function(msg) {
			if(msg != ''){
				$("#successDialog").html(msg);
				$( "#successDialog").dialog( "open" );
			}
		},
		error : function(msg) {
			$('.result').html(msg);
		}
	});
	
});

var inputData = "";
function getData(){
	inputData = "<Root>";
	$("#frmEmergencyReadiness").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var questAttId = $( this ).attr("id");
			
			if($(this).hasClass("range_counter")){
				if($(this).hasClass("freeform")){
					
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + $(this).val() +  "</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + $(this).val() + "</Value>";			
					inputData = inputData + "</Question>";
					
				} else {
					var rangeValues = $('#sld_' + questAttId).val().split(';');
					var optAttId;
					var temp=1;
					while(temp < rangeValues.length){
						if(rangeValues[temp].split(':')[1] == $(this).val()){
							var optAttId = rangeValues[temp].split(':')[0];
							break;
						}
						temp++;
					}
					
					if(optAttId != undefined){
						inputData = inputData + "<Question>";
						inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
						inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
						inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
						inputData = inputData + "<Value>" + $(this).val() + "</Value>";			
						inputData = inputData + "</Question>";	
					}
				}
			} else if($(this).hasClass("toggelCtrl")){
				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + $(this).val().split('_')[0] +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + $(this).val().split('_')[1] + "</Value>";			
				inputData = inputData + "</Question>";
				
			} else {
				var optAttId = $( this ).attr("id");
				var questAttId = $( this ).attr("name");				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + $(this).val() + "</Value>";			
				inputData = inputData + "</Question>";
			}			
		}
	});	
	
	inputData = inputData + "</Root>";
}

$("#main_actions .save").click(function() {
	if($("#94009").val() == 0) {
		$("#successDialog").html("Please enter No of months you can manage without income","");
		$( "#successDialog").dialog( "open" );
	} else {
		getData();	
		var initialData=$("#initialData").val();
		if(initialData==inputData){
			alertMessage("You haven't changed any data yet.Please make some changes and then save.");
			return false;
		}else{
			$("#inputData").val(inputData);
			$("#frmEmergencyReadiness").submit();	
		}
	}
});

function checkData(url){
	getData();
	var initialData=$("#initialData").val();
	if(initialData==inputData){
		window.location.href=url;
	}else{
		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").click(function(){cancelPage(url)});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}
}

function cancelPage(url){
	window.location.href=url;
}

/* $(".cancel").click(function() {	
	$(".thumb_select_ul").find(".categoery").removeClass("not_applicable");
	$(".thumb_select_ul").find(".answer").val("");
}); */

$(document).ready(function(){
	$('.common_in_content').slimScroll();
	$(".box").hide();
    if($("#div_94520").hasClass( "not_applicable" ))
    {    	
    	$(".box").show();    
    }
    $('.wrapper').attr('id', 'dc_screens'); 
	$('.wrapper').addClass('emergency_readiness_parnet'); 	
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

 	$("#div_94002").on('toggle', function (e, active) {
 	    if (active) { 		 	
 		 	$(".thumb_select_ul1").fadeIn("slow");
 		 	$("#div_94008").closest('li').fadeIn("slow");
 	    } else { 		  	
 		  	$(".thumb_select_ul1").fadeOut("slow");
 		  	$("#div_94008").closest('li').fadeOut("slow");
 		  	$(".thumb_select_ul1 .categoery").find(".answer").val("");
 		  	$(".thumb_select_ul1 .categoery").removeClass("not_applicable");
 		  	$('#div_94008').toggles({on:false});
 			$("#94008").val('94136_0');
 	    }
 	}); 	
 	
 	$(".thumb_select_ul1 a").click(function(){
 	   $(this).children(".categoery").toggleClass("not_applicable");
 	   if($(this).children(".categoery").find(".answer").val() == ""){
 		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("name")); 		   
 	   } else {
 		  $(this).children(".categoery").find(".answer").val("");
 	   }
 	   
 	}); 
 	   
 	
 			$(".single_select").click(function(){
 	 		

			$(".single_select").removeClass("not_applicable");
 		   $(this).addClass("not_applicable");
 		   $(".display").removeClass("box");
 		   
 		   var labelName =$(this).find(".label").attr('name');
 		   $("#94517").val("");
 		   $("#94518").val("");
 		   $("#94519").val("");
 		   $("#94520").val("");
 		   
 		   
 		   $("#"+labelName).val(labelName); 
 		    if(labelName==94520)
 		    {
 		    	//alert(labelName);
 		    	$(".box").show();
 		    	
 		    
 		    }
 		    else
 		    	{
 		    	$("#94516").val('');
 		    	$(".box").hide();
 		    	
 		    	}
 	   
 	   
 	});
 	
 	getData();
 	$("#initialData").val(inputData);
 	$("#confirmDialog .close").click(function(){
 	    $(".overlay").fadeOut("slow");
 	 $("#confirmDialog").fadeOut("slow");
 	  });
 	
 	$("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});
 	 	
});
function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}
</script> 
<div class="overlay"></div>
</body>
		