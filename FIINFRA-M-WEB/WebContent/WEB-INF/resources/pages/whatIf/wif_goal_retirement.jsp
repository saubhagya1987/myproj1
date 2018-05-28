<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
.overlay{z-index: 300}
</style> 

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
$(window).load(function(){
	  $('#page_loader').fadeOut("5000");
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
	
	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>	
  	<!-- advive adssumption starts--> 
  	<form class="form-horizontal" id="frmAssumption" name="frmAssumption" >
   
    <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
    <div id="page_loader"></div> 
    <div class="common_ad_ass_selector">
      <ul class="clearfix reset">
        <li>
          <p>Advice Assumptions</p>
        </li>
      </ul>
      <div class="Advice_Assump_Menu">
		  <ul class="clearfix reset Advice_Assump_Menu_In">
		    <li class="clearfix rel">
		      <label class="form_label">Estimated Life Expectancy</label>
		      <div class="range_parent">
		        <div class="scale clearfix">
		          <div class="scale_range"><span class="low extrem">70</span><span class="high extrem">100</span></div>
		          <div id="98021"></div>
		          <div class="counter_parent_new">
		            <input type="text" id="98021_payment" name="98021_payment" class="range_counter Number required" />
		            <span class="unit">yrs</span> </div>
		        </div>
		      </div>
		    </li>
		    <li class="clearfix rel">
		      <label class="form_label">Set your default retirement age</label>
		      <div class="range_parent">
		        <div class="scale clearfix">
		          <div class="scale_range"><span class="low extrem">40</span><span class="high extrem">70</span></div>
		          <div id="98022"></div>
		          <div class="counter_parent_new">
		            <input type="text" id="98022_payment" name="98022_payment" class="range_counter Number required" />
		            <span class="unit">yrs</span> </div>
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
				<c:when test="${assumption.assumptionCodeId eq '98021' or assumption.assumptionCodeId eq '98022'}">				
					<script>
						createSlider('#${assumption.assumptionCodeId}', ${assumption.valueStartRange}, ${assumption.valueEndRange}, 1, '#${assumption.assumptionCodeId}_payment');
						$('#${assumption.assumptionCodeId}').slider( "option", "value", ${assumption.assumptionValue});
						$('#${assumption.assumptionCodeId}_payment').val(${assumption.assumptionValue});
					</script>
				</c:when>
			</c:choose>
		</c:forEach>

    </form>
    <!-- advive adssumption ends--> 
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmEmergencyReadiness" name="frmEmergencyReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />
      <input type="hidden" name="initialData" id="initialData" value=""/>
      <input type="hidden" name="fromWhatIf" id="fromWhatIf" value="yes"/>
      
      
		<x:parse xml="${sectionData}" var="output"/>
	
		<c:set var="questionTypeMap" value=""/>
      	<section class="in_content common_in_content clearfix">
        	<ul class="reset clearfix" id="emergency_readiness_ul">
        	<x:forEach select="$output/Section/Question" var="item">
        	
			<c:set var="questionTypeMapTemp"><x:out select="$item/@AttributeCodeId" escapeXml="false"/>:<x:out select="$item/@QuestionType" escapeXml="false"/> </c:set>
			<c:set var="questionTypeMap" value="${questionTypeMap};${questionTypeMapTemp}" />        	
        	
        	<c:set var="isHidden" value=""/>
        	<x:if select="$item/@ParentQuestionId != '0'">
        		<c:set var="isHidden" value="style=display:none"/>
        	</x:if>
        	        	        	
			<li id="confidence_scale" class="clearfix rel" <c:out value="${isHidden}" /> >
	            <div class="<x:out select="$item/@cssClass" />">
	             <p>
	             <x:choose>
	             <x:when select="$item/@QuestionType = '85016'">
	              <span class="required_star">*</span>
	              </x:when>
	              </x:choose>
	              <x:out select="QuestionText" /></p>
	            </div>
               	<x:choose>
               		<x:when select="$item/@QuestionType = '85009'">
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
		                </div>
		                <div class="clr"></div>		
               		</x:when>
                			 
               		<x:when select="$item/@QuestionType = '85010'">
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
			                  		
			                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />                    
	                  			</div>
		                  </div>
	                	</div>
	                	<div class="clr"></div>	
               		</x:when>
                		              	
               		<x:when select="$item/@QuestionType = '85002'">
               			<div class="ques_action clearfix northspace4">
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
                			                	
               		<x:when select="$item/@QuestionType = '85004'">	                			
               			<div class="ques_action-checkbox">
               				<ul>
                				<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
			                			<c:set var="benfitTypeCss" value="benfit_type"/>
			                			<x:if select="$optionElement/@AttributeCodeID = 94110">
			                				<c:set var="benfitTypeCss" value="benfit_none"/>
			                			</x:if>
			                		
			                		<li class="${benfitTypeCss}">				                		
			                			<div id="div_<x:out select="$optionElement/@AttributeCodeID" />" class="chekbox_parent"><span class="white_checkbox"></span>					                  			
			                    			<div class="newthumb" style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"></div>
			                  				<input type="checkbox" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="" class="default_checkbox answer"/>
			                  			</div>					                  			
			                  			<span class="r-p-chkboxes1"><x:out select="$optionElement" /></span>				                  		
				                  	</li>
			                  	</x:forEach>
			                  </ul>
						</div>
						<div class="clr"></div>
						<div style="margin-bottom:90px"></div>
               		</x:when>
               		<x:when select="$item/@QuestionType = '85016'">
               			<div class="value-spinner northspace5 westspace3" id="test02">
            				<input id="<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value="${defaultage}"  class="spinner freeform answer" />
       					</div>
						<script>
						 	$("#<x:out select="$item/@AttributeCodeId" />" ).spinner({ min:40 , max:70});
						/* 	$("#<x:out select="$item/@AttributeCodeId" />" ).spinner({ min:'${defaultage}' , max: <x:out select="$item/Max_Value" />});	 */	 
						 	$("#<x:out select="$item/@AttributeCodeId" />").spinner().spinner("enable"); 	
						</script>
						<div class="clr"></div>
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
				                                	<div class="categoery job not_applicable">
				                                    	<div class="newthumb"style="background: url(${pageContext.request.contextPath}/resources/images/<x:out select='$optionElement/@ImgDefault' />) no-repeat center center;"/></div>
				                                    </div>
				                                    <label class="label"><x:out select="$optionElement" /></label>
													</a>
												</li>
				                             </ul>                    	
				                        </div><!-- end of "icon" -->
			                        </x:if>
			                        <div class="value-spinner">
			                			<input id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeId" />" value="0" class="spinner spinner85005 answer Number">
			                			<script>
										 	$("#<x:out select="$optionElement/@AttributeCodeID" />").spinner({ min: <x:out select="$item/Min_Value" />, max: <x:out select="$item/Max_Value" />});
										 	$("#<x:out select="$optionElement/@AttributeCodeID" />").spinner().spinner("enable"); 	
										</script>
			            			</div>			                                         
			                    </li>
		                  	</x:forEach>
		                  </ul>
		                 </div>
		                 <select id="select_<x:out select="$item/@AttributeCodeId" />" class="miniselect">
					         <option>K</option>
					         <option>Lac</option>
					         <option>Cr</option>				              
				         </select>
               		</x:when>
                </x:choose>	             
          </li>
       	</x:forEach> 
       	<div id="bottom">
          	<div class="total-asset-value">
            	<span>Total Assets Value</span><div id="sum_94148" class="total-value">0</div><span class="unit dynamic1">lacs</span>
            </div><!-- End of "total-asset-value" -->
            <div class="total-asset-value">
            	<span>Total Monthly Investment</span><div id="sum_94165" class="total-value">0</div><span class="unit dynamic2">k</span>
            </div><!-- End of "total-asset-value" -->
          </div><!-- End of "Bottom" -->     	
        </ul>
        
		<input type="hidden" name="questionBankId" id="questionBankId" value="${questionBankId}"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="${sectionTypeId}" />
        <input type="hidden" name="inputData" id="inputData" value="" />
        <input type="hidden" name="defaultRetAge" id="defaultRetAge" value="${defaultage}" />
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
						<li class="fl list" style="margin-left: -420px"><a href="#" class="anch save saveCfsRetirementPlanningLink" ><span class="txt">Save</span></a></li>
						<li class="fl list" style="margin-left: -347px"><a href="#" onclick="checkData('${pageContext.request.contextPath}/whatIf/graph/${partyId}');" class="anch cancel"><span class="txt">Cancel</span></a></li>
					</ul>
				</div>
			</section>
			<script>
			$('#select_94148').val('Lac');
			$(".dynamic1").html("lacs");
			</script>
		 	<c:set var="questionTypeMapArr" value="${fn:split(questionTypeMap, ';')}"/>

			<!-- Iterate Already Set Data from questionDetails Map -->		 							
			<c:forEach items="${questionTypeMapArr}" var="questionTypeMapArrVals" begin="0">				
				<c:set var="questionTypeEle" value="${fn:split(questionTypeMapArrVals, ':')}"/>				
				<c:forEach items="${questionDetails}" var="questDetail">
					<c:set var="tempQuestionId" value="${fn:split(questDetail.questionId, '_')}"/>
					<c:if test="${tempQuestionId[0] eq questionTypeEle[0]}">						
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
									if(${questDetail.attributeRefferenceValue} == 1){
										$('#div_${questDetail.questionId}').toggles({on:true});
									} else {
										$('#div_${questDetail.questionId}').toggles({on:false});
									}
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85005'}">									
								<script>
									var amount = 0;
									var amountIn = 0;
									
									/* $(".dynamic1").html("lacs");
									$(".dynamic2").html("lacs");
									$('#select_94148').val('Lac');
									$('#select_94165').val('Lac'); */
									if(${questDetail.attributeRefferenceValue} != 0){
										/* $(".common_unit_selector li").removeClass("unit_selected");
			 							$(".dynamic").removeClass("cr_selected");
			 							
			 							$(".dynamic").text("lacs");
			 							$(".lacs").addClass("unit_selected");
										amountIn = ${questDetail.attributeRefferenceValue} / 100000;

										$('#${questDetail.attributeValue}').spinner().val(amountIn);
										*/

										var attCodeID = ${questDetail.attributeCodeId};
										var amountScale=0;		
										var tempVar = '${questDetail.questionId}';
										tempVar = tempVar.toString();

										if(tempVar.indexOf("_")!=-1) {
											 amountIn =  '${tempQuestionId[1]}';
									 		 amountIn  = parseFloat(amountIn);
											 amountScale ='${questDetail.attributeRefferenceValue}'/amountIn;
											 attCodeID = '${questDetail.attributeCodeId}';
										}
										else {
											if(attCodeID == 94148) {
												amountIn = '${questDetail.attributeRefferenceValue}'/100000;
												amountScale = 100000;
											}
											else if(attCodeID == 94165) {
												amountIn = '${questDetail.attributeRefferenceValue}'/1000;
												amountScale = 1000;
											}
										}

										
										if(attCodeID == 94148) {											
											if(amountScale == 1000){
												$('#select_94148').val('K');
												$('#${questDetail.attributeValue}').spinner().val(amountIn);
												$(".dynamic1").html("ks");
											} else {								
												if(amountScale == 100000){
													$('#select_94148').val('Lac');
													$('#${questDetail.attributeValue}').spinner().val(amountIn);
													$(".dynamic1").html("lacs");
												} else {										
													$('#select_94148').val('Cr');		
													$('#${questDetail.attributeValue}').spinner().val(amountIn);
													$(".dynamic1").html("crs");
												}
											}
										}
										else {
											if(amountScale == 1000){
												$('#select_94165').val('K');
												$('#${questDetail.attributeValue}').spinner().val(amountIn);
												$(".dynamic2").html("ks");
											} else {								
												if(amountScale == 100000){
													$('#select_94165').val('Lac');
													$('#${questDetail.attributeValue}').spinner().val(amountIn);
													$(".dynamic2").html("lacs");
												} else {										
													$('#select_94165').val('Cr');		
													$('#${questDetail.attributeValue}').spinner().val(amountIn);
													$(".dynamic2").html("crs");
												}
											}
										}
										
									} else {
										$('#${questDetail.attributeValue}').spinner().val(0);
									}		
		 						</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85016'}">							
								<script>		 							
		 							$('#${questDetail.questionId}').spinner().val(${questDetail.attributeValue});
								</script>
							</c:when>
							<c:when test="${questionTypeEle[1] eq '85004'}">							
								<script>
									$('#div_${questDetail.attributeValue}').children("span").addClass("red_custom_checkbox_checked");
		 							$('#${questDetail.attributeValue}').val(${questDetail.attributeValue});
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

<script>
 //assumption pop
// createSlider('#advice_retire_assump',70,100,1,'#advice_retire_assump_payment');
// createSlider('#advice_retire_assump_age',40,70,1,'#advice_retire_assump_age_payment');

$(".Advice_Assump_Menu .save").click(function(event){
	if($("#frmAssumption").validate().form()!=false){
 	//$("#94044").spinner().spinner("enable"); 	
	var url = '${pageContext.request.contextPath}/partner/datacollection/assumption/save';
	var updatedAssumptionData = "98021:" + $("#98021_payment").val() + "," + "98022:" + $("#98022_payment").val(); 
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
				$('#defaultRetAge').val($("#98022_payment").val());
			}
			$("#94044" ).spinner({ min: $("#98022_payment").val(), max: 75});
		},
		error : function(msg) {
			$('.result').html(msg);
		}
	});
  }
	else{
		//alertMessage("Enter Valid Data");
		$("$Advice_Assump_Menu").fadeIn();
	}
});

var inputData = "";

function getData(){
	inputData = "<Root>";
	$("#frmEmergencyReadiness").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var questAttId = $( this ).attr("id");
			
			if($(this).hasClass("range_counter")){
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
				
			} else if($(this).hasClass("freeform")){
				var optAttId = $( this ).attr("id");
				var questAttId = $( this ).attr("name");
				
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + $(this).val() +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + $(this).val() + "</Value>";			
				inputData = inputData + "</Question>";
			} else {
				var optAttId = $( this ).attr("id");
				var questAttId = $( this ).attr("name");
				
				var amount = $(this).val();
				
				/* if($(".k").hasClass("unit_selected")) {
					amount = amount * 1000;
				} else if($(".lacs").hasClass("unit_selected")) {
			    	amount = amount * 100000;
				} else if($(".cr").hasClass("unit_selected")) {
					amount = amount * 10000000;
				} */
				
				if(questAttId == 94148) {
					if($('#select_94148').val() == 'K') {
						amount = amount * 1000;
					}
					else if($('#select_94148').val() == 'Lac') {
						amount = amount * 100000;
					}
					else if($('#select_94148').val() == 'Cr') {
						amount = amount * 10000000;
					}
				}
				else if(questAttId == 94165) {
					if($('#select_94165').val() == 'K') {
						amount = amount * 1000;
					}
					else if($('#select_94165').val() == 'Lac') {
						amount = amount * 100000;
					}
					else if($('#select_94165').val() == 'Cr') {
						amount = amount * 10000000;
					}
				}
				inputData = inputData + "<Question>";
				inputData = inputData + "<QuestionId>" + questAttId + "_" +  $(this).val() + "</QuestionId>";
				inputData = inputData + "<QuestionOptionId>" + optAttId +"</QuestionOptionId>";
				inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
				inputData = inputData + "<Value>" + amount + "</Value>";			
				inputData = inputData + "</Question>";
			}			
			
		}
	});	
	
	inputData = inputData + "</Root>";
}

$("#main_actions .save").click(function() {
	getData();
	var currDefaultage = $('#defaultRetAge').val();
	var initialData=$("#initialData").val();
	if(initialData==inputData){
		alertMessage("You haven't changed any data yet.Please make some changes and then save.");
		return false;
	}
	/* else if($('#94044').val()< currDefaultage || $('#94044').val()>75) {
		alertMessage("Please enter age between " + currDefaultage + " to 75");
	}
	 */else{
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

function cancelPage(url){
	window.location.href=url;
}

$(document).ready(function(){
	
	var rbsLinks = "${rbsLinks}";
	var pieces = rbsLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			if(pieces[i]=="saveCfsRetirementPlanningLink"){
				$("frmEmergencyReadiness").attr("action","#");
			}
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
			$("."+pieces[i]).removeAttr("onclick");
		}		
	}
	
	$("#frmAssumption").validate({
		//ignore:'', //i.e. do not ignore hidden elements	
		//rules:{	98022_payment:{min:70,max:100},98022_payment:{min:5,max:18}}
	});

    $("#98021_payment").rules("add", {min:70,max:100});
    $("#98022_payment").rules("add", {min:40,max:70});
    
    $("#frmEmergencyReadiness").validate({
		//ignore:'', //i.e. do not ignore hidden elements	
		rules:{	94044:{min:40,max:70,required:true}}
	});
    
	
	$('#94044').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) 
	        return false;
	    return true;
	});

	
	$(".wrapper").addClass("retirement_planning");
	 $("select").selectBoxIt();
	getData();
 	$("#initialData").val(inputData);
 	
 	$("#confirmDialog .close").click(function(){
 	    $(".overlay").fadeOut("slow");
 	 $("#confirmDialog").fadeOut("slow");
 	  });
	  	
 	$("#frmEmergencyReadiness").validate({
		
		ignore:'', //i.e. do not ignore hidden elements	
	}); 
	$('.common_in_content').slimScroll();
    $('.wrapper').attr('id', 'dc_screens');
 	
//  	$(".thumb_select_ul a").click(function(){
//  	   $(this).children(".categoery").toggleClass("not_applicable");
//  	   if($(this).children(".categoery").find(".answer").val() == ""){
//  		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("name")); 		   
//  	   } else {
//  		  $(this).children(".categoery").find(".answer").val("");
//  	   }
//  	});
 	 	
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
	
 	$(".ui-spinner-button").click(function(){
		var currentVal = 0;
		var selectedEle = $(this).siblings("input").attr("name");
		$(".right-side").find("input[name='"+selectedEle+"']").each(function (index, ele){
			currentVal = currentVal + parseFloat(ele.value);			
		});
		$("#sum_" + selectedEle).html(currentVal.toFixed(2));
		
	});		
	
 	$(".spinner85005").change(function(ele1){
		var currentVal = 0;
		var changedEleId = ele1.target.name;
		$(".spinner85005").each(function (index, ele){
			if(changedEleId == ele.name){
				if(!isNaN(parseFloat(ele.value))) {
					currentVal = currentVal + parseFloat(ele.value);
				}				
			}						
		});
		$("#sum_" + $(this).attr('name')).html(currentVal.toFixed(2));
		
	});
 	
	$(".white_checkbox").click(function(){
		
	 	if($(this).siblings(".default_checkbox").val() == ""){
	 		$(this).siblings(".default_checkbox").val($(this).siblings(".default_checkbox").attr("name")); 		   
		} else {
	 		$(this).siblings(".default_checkbox").val("");
		}
	 	
	 	
	 	if($(this).closest(".benfit_type").length > 0) {			
			$(".benfit_none").find(".white_checkbox").removeClass("red_custom_checkbox_checked");
			$(".benfit_none").find(".chekbox_parent .default_checkbox").prop("checked", false);
			$(".benfit_none").find(".chekbox_parent .default_checkbox").val("");
		    $(this).toggleClass("red_custom_checkbox_checked");

	      	if ($(this).next(".default_checkbox").is(":checked")) {
				$(this).next(".default_checkbox").prop("checked", false);				
	    	} else{
	        	$(this).next(".default_checkbox").prop("checked", true);
	        	$(this).next(".default_checkbox").val($(this).siblings(".default_checkbox").attr("name")); 	
	    	}				
		}		
		else {   			
			$(".benfit_type").find(".white_checkbox").removeClass("red_custom_checkbox_checked");
			$(".benfit_type").find(".chekbox_parent .default_checkbox").prop("checked", false);
			$(".benfit_type").find(".chekbox_parent .default_checkbox").val("");
			$(".benfit_none").find(".white_checkbox").toggleClass("red_custom_checkbox_checked");
			
			if ($(this).next(".default_checkbox").is(":checked")) {
	        	$(this).next(".default_checkbox").prop("checked", false);	        	
	    	} else{
	        	$(this).next(".default_checkbox").prop("checked", true);
	        	$(this).next(".default_checkbox").val($(this).siblings(".default_checkbox").attr("name")); 	
	    	}
		}
	});
	
	$('.Number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
	var currentVal = 0;
	$('[name="94148"]').each(function (index, ele){			
		currentVal = currentVal + parseFloat(ele.value);				
	});		
	$("#sum_94148").html(currentVal.toFixed(2));
	
	var currentVal = 0;
	$('[name="94165"]').each(function (index, ele){			
		currentVal = currentVal + parseFloat(ele.value);				
	});		
	$("#sum_94165").html(currentVal.toFixed(2));
	
//	$("#94051").addClass("integer");
	//$("#frmEmergencyReadiness").validate();
	
	$("#select_94148").change(function(ele1){
		if($("#select_94148").val() == 'K') {
			$(".dynamic1").html("ks");
		} else if($("#select_94148").val() == 'Lac') {
			$(".dynamic1").html("lacs");
		} else if($("#select_94148").val() == 'Cr') {
			$(".dynamic1").html("crs");
		}
	});
	
	$("#select_94165").change(function(ele1){
		if($("#select_94165").val() == 'K') {
			$(".dynamic2").html("ks");
		} else if($("#select_94165").val() == 'Lac') {
			$(".dynamic2").html("lacs");
		} else if($("#select_94165").val() == 'Cr') {
			$(".dynamic2").html("crs");
		}
	});
	
	$("#div_94114").click(function() {
		var tempVal =  $("#94114").val();
		if(tempVal != "")
		{
			$(".white_checkbox").removeClass("red_custom_checkbox_checked");
			$("#94046").val("");
			$("#94047").val("");
			$("#94048").val("");
			$("#94049").val("");
			$("#94050").val("");
			$("#div_94114 span").addClass("red_custom_checkbox_checked");
		}
		
	});
	
	$("#div_94046").click(function() {
		$("#div_94114 span").removeClass("red_custom_checkbox_checked");
		$("#94114").val("");
	});
	$("#div_94047").click(function() {
		$("#div_94114 span").removeClass("red_custom_checkbox_checked");
		$("#94114").val("");	
	});
	$("#div_94048").click(function() {
		$("#div_94114 span").removeClass("red_custom_checkbox_checked");
		$("#94114").val("");	
	});
	$("#div_94049").click(function() {
		$("#div_94114 span").removeClass("red_custom_checkbox_checked");
		$("#94114").val("");
	});
	$("#div_94050").click(function() {
		$("#div_94114 span").removeClass("red_custom_checkbox_checked");
		$("#94114").val("");	
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