<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
.thumb_select_ul {width: auto !important}
.thumb_select_ul .categoery .newthumb { height:100%; width:100%; text-align:center; line-height: 97px; }
#confirmDialog {
	display: block;
	height: 130px;
	display: none;
	width: 355px;
	box-shadow: 0 0 15px 1px #757575;
}
</style>
<style>
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>  
<script>

$(window).load(function(){
	  $('#page_loader').fadeOut("8000");
});

function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
	 }	 
</script>

<div id="emergency_readiness">
  <!-- Main starts-->
  <section class="main">
	<section class="content common_content"> 
    <section class="common_unit_selector"><ul class="clearfix reset"><li class="k inactiveLink"><span class="unit">K</span></li><li class="lac unit_selected"><span class="unit">Lac</span></li><li class="cr"><span class="unit">Cr</span></li></ul><p>All figures are in :</p></section>
  	<!-- Advice Assumptions Submenu Starts -->    
    <div class="clr"></div>
    <!-- Advice Assumptions Submenu Ends -->
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmEmergencyReadiness" name="frmEmergencyReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />
       <input type="hidden" name="initialData" id="initialData" value=""/>
      	<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
		<x:parse xml="${sectionData}" var="output"/>
	
		<c:set var="questionTypeMap" value=""/>
      	<section class="dc_in_content common_in_content clearfix" id="dc_screens">
        	<ul class="reset clearfix" id="emergency_readiness_ul">
        	<x:forEach select="$output/Section/Question" var="item">
        	
			<c:set var="questionTypeMapTemp"><x:out select="$item/@AttributeCodeId" escapeXml="false"/>:<x:out select="$item/@QuestionType" escapeXml="false"/> </c:set>
			<c:set var="questionTypeMap" value="${questionTypeMap};${questionTypeMapTemp}" />        	
        	
        	<c:set var="isHidden" value=""/>
        	<x:if select="$item/@ParentQuestionId != '0'">
        		<c:set var="isHidden" value="style=display:none"/>
        	</x:if>
        	        	        	
			<li id="li_<x:out select="$item/@AttributeCodeId" />" class="clearfix" <c:out value="${isHidden}" /> >
	            <div class="<x:out select="$item/@cssClass" />">
	              <p><x:out select="QuestionText" /></p>
	            </div>
               	<x:choose>
               		<x:when select="$item/@QuestionType = '85009'">
               	  <!--  Applying this class moves slide to right  ques_action_ls_01 -->
                		<div class=" ques_action03 clearfix">
              				<div class="range_parent emer_confidence">
                				<div class="fl scale clearfix">
		                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
		                    		<div class="mark"><br /></div>
		                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
		                  		</div>
		                  		<div class="counter_parent ">
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
		                </div>
		                <div class="clr"></div>		
               		</x:when>
                			 
               		<x:when select="$item/@QuestionType = '85010'">
                		<div class="ques_action3 clearfix">
             				<div class="range_parent emer_confidence">
                				<div class="fl scale clearfix">
			                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
			                    		<div class="mark"><br /></div>
			                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
			                  		</div>
			                  		<div class="counter_parent ">
			                    		<input type="text" readonly id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter freeform answer">
			                    		<x:if select="$item/IsCurrency = 1" >
			                    			<span class="unit dynamic">lac</span>
			                    		</x:if>
										<x:if select="$item/@AttributeCodeId = 94224">
											<span class="unit">yrs</span>
										</x:if>		                    		
			                  		</div>
			                  		<script>
			                  		var temp = '<x:out select="$item/@AttributeCodeId" />';
		                  			if(temp=='94224') {
		                  				createSliderAndSetValue("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp,5);
		                  			}
		                  			else {
		                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
		                  			}
			                  		</script>
			                  		
			                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />                    
	                  			</div>
		                  </div>
	                	</div>
	                	<div class="clr"></div>	
               		</x:when>
                		              	
               		<x:when select="$item/@QuestionType = '85002'">
               			<div class="ques_action3 clearfix northspace4">
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
		                </div>
		                <div class="clr"></div>
                	</x:when>
                			                	
               		<x:when select="$item/@QuestionType = '85006'">
               			<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
               				<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
		                		<li class="fl">
			                		<a href="javascript:void(0);">
			                  			<div id="div_<x:out select="$optionElement/@AttributeCodeID" />" class="categoery">
			                  				<input type="hidden" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="" class="answer"/>
			                    			<div class="newthumb" style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"></div>
			                  			</div>
			                  			<label class="label"><x:out select="$optionElement" /></label>
			                  		</a>	
			                  	</li>
		                  	</x:forEach>
		                  </ul>
               		</x:when>
               		<x:when select="$item/@QuestionType = '85013'">
               			<div class="value-spinner northspace5 westspace3" id="test02">
            				<input id="<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  class="spinner answer" />
       					</div>
						<script>
						 	$("#<x:out select="$item/@AttributeCodeId" />" ).spinner({ min: <x:out select="$item/Min_Value" />, max: <x:out select="$item/Max_Value" />});
						 	$("#<x:out select="$item/@AttributeCodeId" />").spinner().spinner("enable"); 	
						</script>
						<div class="clr"></div>
               		</x:when>
               		
               		<x:when select="$item/@QuestionType = '85019'">
               			<div class="value-spinner northspace5 " id="test02">
							<select id="<x:out select="$item/@AttributeCodeId" />" class="answer select">
								<option value="-1">-- Select --</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
								<option value="2023">2023</option>
								<option value="2024">2024</option>
								<option value="2025">2025</option>
							</select>
       					</div>
               		</x:when>
               		<x:when select="$item/@QuestionType = '85005'">
               			<div class="right-side northspace4">
          					<ul>  
               				<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
		                		<li>
		                			<x:if select="$item/@ShowImage != 'FALSE'">							        									        
				                    	<div class="icon">
				                        	<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
				                            	<li class="fl"><a href="#">
				                                	<div class="categoery job">
				                                    	<div class="newthumb"style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"/></div>
				                                    </div>
				                                    <label class="label"><x:out select="$optionElement" /></label>
													</a>
												</li>
				                             </ul>                    	
				                        </div><!-- end of "icon" -->
			                        </x:if>
			                        <div class="value-spinner">
			                			<input id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="0" class="spinner spinner85005 answer">
			                			<script>
										 	$("#<x:out select="$optionElement/@AttributeCodeID" />").spinner({ min: <x:out select="$item/Min_Value" />, max: <x:out select="$item/Max_Value" />});
										 	$("#<x:out select="$optionElement/@AttributeCodeID" />").spinner().spinner("enable"); 	
										</script>
			            			</div>			                                         
			                    </li>
		                  	</x:forEach>
		                  </ul>
		                 </div>
		                 
               		</x:when>
                </x:choose>	             
          </li>
       	</x:forEach> 
       	
        </ul>
        
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

	<script>
		$("#li_94164").fadeOut();
	 	$("#li_94223").fadeOut();
	 	$("#li_94224").fadeOut();
	 	$("#li_94199").fadeOut();
	 	
	 	$("#li_94164").find('.categoery').removeClass("not_applicable");
	 	$("#li_94164").find(".answer").val("");
	 	
	 	$("#div_94223").slider( "option", "value", 0);
		$("#94223").val(0);
		
	 	$("#div_94224").slider( "option", "value", 5);
		$("#94224").val(5);
		
		$("#94199").val("");
	</script>		
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
// 									$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeValue});
// 									$('#${questDetail.questionId}').val(${questDetail.attributeValue});
// 									if(${questDetail.attributeRefferenceValue} != 0){
// 										var amountIn = ${questDetail.attributeRefferenceValue} / ${questDetail.attributeValue};
// 										$(".common_unit_selector li").removeClass("unit_selected");
// 			 							$(".dynamic").removeClass("cr_selected");
// 		 								if(amountIn == 10000000){
// 											$(".cr").addClass("unit_selected");
// 											$(".dynamic").text("cr");
// 										} else if(amountIn == 100000){
// 											$(".lac").addClass("unit_selected");
// 											$(".dynamic").text("lac");
// 										} else {
// 											$(".k").addClass("unit_selected");
// 											$(".dynamic").text("");
// 										}
// 		 							}
								
								if(${questDetail.questionId eq '94224'}){
									$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeValue});
									$('#${questDetail.questionId}').val(${questDetail.attributeValue});
								} else {
									var amount = 0;
									var amountIn = 0;
									if(${questDetail.attributeRefferenceValue} != 0){
										$(".common_unit_selector li").removeClass("unit_selected");
			 							$(".dynamic").removeClass("cr_selected");
			 							$(".dynamic").text("lac");
			 							$(".lac").addClass("unit_selected");
										amountIn = ${questDetail.attributeRefferenceValue} / 100000;
										
										if(amountIn <= 100)
										{
											$(".dynamic").text("lac");
											$(".lac").addClass("unit_selected");
											$(".cr").removeClass("unit_selected");
											
										}
										else
										{
											amountIn = amountIn/100;
											$(".dynamic").text("cr");
											$(".lac").removeClass("unit_selected");
											$(".cr").addClass("unit_selected");
										}

										
										$('#div_${questDetail.questionId}').slider( "option", "value", amountIn);
										$('#${questDetail.questionId}').val(amountIn);
									} else {
										$('#div_${questDetail.questionId}').slider( "option", "value", 0);
										$('#${questDetail.questionId}').val(0);
									}	
								}
								
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85002'}">
								<script>
 									$('#${questDetail.questionId}').val(${questDetail.attributeValue} + "_" + ${questDetail.attributeRefferenceValue});
									if(${questDetail.attributeRefferenceValue} == 1){
										$('#div_${questDetail.questionId}').toggles({on:true});
							 		 	$("#li_94164").fadeIn();
							 		 	$("#li_94223").fadeIn();
							 		 	$("#li_94224").fadeIn();
							 		 	$("#li_94199").fadeIn();
								 	    
									} else {
										$('#div_${questDetail.questionId}').toggles({on:false});
										
							 	    	$("#li_94164").fadeOut();
							 	    	$("#li_94223").fadeOut();
							 	    	$("#li_94224").fadeOut();
							 	    	$("#li_94199").fadeOut();
							 	    	
							 	    	$("#li_94164").find('.categoery').removeClass("not_applicable");
							 	    	$("#li_94164").find(".answer").val("");
							 	    	
							 	    	$("#div_94223").slider( "option", "value", 0);
								 	   	$("#94223").val(0);
								 	   	
								 	    $("#div_94224").slider( "option", "value", 0);
								 	   	$("#94224").val(0);
								 	   	
								 	   	$("#94199").val("");
							 	   	
									}
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85005'}">							
								<script>		 							
		 							$('#${questDetail.attributeValue}').spinner().val(${questDetail.attributeRefferenceValue});								 	 	
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85013'}">							
								<script>		 							
		 							$('#${questDetail.attributeValue}').spinner().val(${questDetail.attributeRefferenceValue});								 	 	
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85006'}">							
								<script>
									$('#div_${questDetail.attributeValue}').addClass("not_applicable");
	 								$('#${questDetail.attributeValue}').val(${questDetail.attributeRefferenceValue});
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85019'}">							
								<script>									
		 							//$('#${questDetail.attributeValue}').val('${questDetail.attributeRefferenceValue}');		
		 							$('#94199 option[value=${questDetail.attributeValue}]').attr('selected','selected');	
								</script>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>			
			</c:forEach>
		
		</form>
      	<!-- Common footer ends -->
		
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
<script src="${pageContext.request.contextPath}/resources/js/common_unit_selector.js"></script>

<script>

var inputData = "";

function getData(){
	inputData = "<Root>";
	$("#frmEmergencyReadiness").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var questAttId = $( this ).attr("id");
			
			if($(this).hasClass("range_counter")){
				if($(this).hasClass("freeform")){
					
					var amount = $(this).val();					
		 			if($(".k").hasClass("unit_selected")) {
		 				amount = amount * 1000;
		 			} else if($(".lac").hasClass("unit_selected")) {
		 		    	amount = amount * 100000;
		 			} else if($(".cr").hasClass("unit_selected")) {
		 				amount = amount * 10000000;
		 			}
		 			
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + $(this).val() +  "</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + parseFloat(amount).toFixed(0) + "</Value>";			
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
			} else if ($(this).hasClass("default_checkbox")){
				var optAttId = $( this ).attr("id");
				var questAttId = $( this ).attr("name");
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value></Value>";			
				inputData = inputData + "</Question>";
			} else if($(this).hasClass("toggelCtrl")){
				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + $(this).val().split('_')[0] +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + $(this).val().split('_')[1] + "</Value>";			
				inputData = inputData + "</Question>";
				
			} else if($(this).hasClass("select")){				
				$('#94199 :selected').each(function(i, selected){ 					  
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>" + 94199 + "</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + $(selected).val() +"</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>" + 94199 + "</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + $(selected).text() + "</Value>";			
					inputData = inputData + "</Question>";
				});
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

$(".save").click(function() {
	
	
	if($("#94084").val()!="" || $("#94085").val()!="" || $("#94086").val()!="" || $("#94087").val()!="" || $("#94090").val()!="" )
	 {
		 $("#94091").rules("add", {min:1});
	 }
	 if($("#94084").val()=="" && $("#94085").val()=="" && $("#94086").val()=="" && $("#94087").val()=="" && $("#94090").val()=="" )
	 {
		$("#94091").rules("add", {min:0});
	 }
	 
	 if($(".toggle-on").html() == "YES")
	 {
		 if($("#94093").val()!="" || $("#94094").val()!="" || $("#94095").val()!="" || $("#94096").val()!="" || $("#94099").val()!="" )
		 {
			 $("#94223").rules("add", {min:1});
			// $("#94224").rules("add", {min:1});
		 }
		 
		 if($("#94093").val()=="" && $("#94094").val()=="" && $("#94095").val()=="" && $("#94096").val()=="" && $("#94099").val()=="" )
		 {
			 $("#94223").rules("add", {min:0});
			// $("#94224").rules("add", {min:1});
		 }
	 }
	 
	
	getData();
	var initialData=$("#initialData").val();
	if(initialData==inputData){
		alertMessage("You haven't changed any data yet.Please make some changes and then save.");
		return false;
	}else{
		$("#inputData").val(inputData);
		$("#frmEmergencyReadiness").submit();	
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

function errorMsg()
{
	alertMessage("No Data Available.");
}

function cancelPage(url){
	window.location.href=url;
}

$(document).ready(function(){
	
	
	// start code for validation	
	 $("#frmEmergencyReadiness").validate();
	 if($("#94084").val()!="" || $("#94085").val()!="" || $("#94086").val()!="" || $("#94087").val()!="" || $("#94090").val()!="" )
	 {
		 $("#94091").rules("add", {min:1});
	 }
	 $(".newthumb").click(function() {
		  
		 $("label.error").css("display","none");
	 });
	 
	 $(".toggle-on").click(function() {
		 
		 if($(".toggle-on").html() == "NO")
		 {
		 	$("#94223").rules("add", {min:0});
		 }	
		 
	 });

	 if($(".toggle-on").html() == "YES")
	 {
		 if($("#94093").val()!="" || $("#94094").val()!="" || $("#94095").val()!="" || $("#94096").val()!="" || $("#94099").val()!="" )
		 {
			 $("#94223").rules("add", {min:1});
			// $("#94224").rules("add", {min:1});
		 }
		 
	 }
	 // end of validation code

	
	
 	$("#confirmDialog .close").click(function(){
 	    $(".overlay").fadeOut("slow");
 	 $("#confirmDialog").fadeOut("slow");
 	  });
 	
	$("select").selectBoxIt();
	
	$('.common_in_content').slimScroll();
    $('.wrapper').attr('id', 'dc_screens');
 	$('.wrapper').addClass('loan_status_parent');
    $(function() {
		$( ".datepicker" ).datepicker({
	 	  	dateFormat: "dd-M-yy",
	       	showOn: "button",
	 	  	buttonText: '',
	 	  	changeMonth: true,
	       	changeYear: true
      	});
   	 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	});
	
    
 	$(".thumb_select_ul a").click(function(){
 	   $(this).children(".categoery").toggleClass("not_applicable");
 	   if($(this).children(".categoery").find(".answer").val() == ""){
 		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("name")); 		   
 	   } else {
 		  $(this).children(".categoery").find(".answer").val("");
 	   }
 	});
 	 	
 	$(".ui-spinner-button").click(function(){
		var currentVal = 0;
		var selectedEle = $(this).siblings("input").attr("name");
		$(".right-side").find("input[name='"+selectedEle+"']").each(function (index, ele){
			currentVal = currentVal + parseInt(ele.value);			
		});
		$("#sum_" + selectedEle).html(currentVal);		
	});		
	
 	$(".spinner85005").change(function(ele1){
		var currentVal = 0;
		var changedEleId = ele1.target.name;
		$(".spinner85005").each(function (index, ele){
			if(changedEleId == ele.name){
				currentVal = currentVal + parseInt(ele.value);	
			}						
		});
		
		$("#sum_" + $(this).attr('name')).html(currentVal);
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
 	
	$(".white_checkbox").click(function(){
		$(this).toggleClass("red_custom_checkbox_checked");
	 	if($(this).siblings(".default_checkbox").val() == ""){
	 		$(this).siblings(".default_checkbox").val($(this).siblings(".default_checkbox").attr("name")); 		   
		} else {
	 		$(this).siblings(".default_checkbox").val("");
		}
	});
	
	$("#div_94092").on('toggle', function (e, active) {
 	    if (active) { 		 	 		 	
 		 	$("#li_94164").fadeIn();
 		 	$("#li_94223").fadeIn();
 		 	$("#li_94224").fadeIn();
 		 	$("#li_94199").fadeIn();
 	    } else { 		  	
 	    	$("#li_94164").fadeOut();
 	    	$("#li_94223").fadeOut();
 	    	$("#li_94224").fadeOut();
 	    	$("#li_94199").fadeOut();
 	    	
 	    	$("#li_94164").find('.categoery').removeClass("not_applicable");
 	    	$("#li_94164").find(".answer").val("");
 	    	
 	    	$("#div_94223").slider( "option", "value", 0);
			$("#94223").val(0);
			
 	    	$("#div_94224").slider( "option", "value", 0);
			$("#94224").val(0);
			
			$("#94199").val("");
 	    }
 	});
	
	getData();
 	$("#initialData").val(inputData);
	
});
function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}
</script>
<div class="overlay"></div> 
</body>
