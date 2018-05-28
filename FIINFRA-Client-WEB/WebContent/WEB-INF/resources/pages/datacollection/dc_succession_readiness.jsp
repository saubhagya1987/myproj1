<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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
	
	<c:if test="${sectionTypeId eq 39002}" >	
	  	<!-- advive adssumption starts--> 
	    <a href="#">
	    <div class="common_ad_ass_selector">
	      <ul class="clearfix reset">
	        <li>
	          <p>Advice Assumptions</p>
	        </li>
	      </ul>
	      <div class="Advice_Assump_Menu">
			  <ul class="clearfix reset">
			    <li class="clearfix">
			      <label class="form_label">Annual Earnings  Growth Rate(%)</label>
			      <div class="range_parent">
			        <div class="scale clearfix">
			          <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span></div>
			          <div id="advice_assump_cf"></div>
			          <div class="counter_parent">
			            <input type="text" id="advice_assump_cf_payment" class="range_counter" />
			            <span class="unit">%</span> </div>
			        </div>
			      </div>
			    </li>
			    
			    <li class="clearfix">
			      <label class="form_label">Inflation Rate(%)</label>
			      <div class="range_parent">
			        <div class="scale clearfix">
			          <div class="scale_range"><span class="low extrem">4%</span><span class="high extrem">15%</span></div>
			          <div id="advice_assump_cf_in"></div>
			          <div class="counter_parent">
			            <input type="text" id="advice_assump_cf_in_payment" class="range_counter" />
			            <span class="unit">%</span> </div>
			        </div>
			      </div>
			    </li>
			    
			    <li class="clearfix"> <a class="cancel">CANCEL</a><a class="save">SAVE</a></li>
			  </ul>
			</div>
	    </div>
	    </a>
	    <div class="clr"></div>
	    <!-- advive adssumption ends-->
	  </c:if>
	    
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmEmergencyReadiness" name="frmEmergencyReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />
      <input type="hidden" name="initialData" id="initialData" value=""/>      
       <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
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
   	
			<li id="confidence_scale" class="clearfix" <c:out value="${isHidden}" /> >
	            <div class="<x:out select="$item/@cssClass" />">
	              <p><x:out select="QuestionText" /></p>
	            </div>
	            <div class="ques_action clearfix">
	              <div class="range_parent emer_confidence">
	                <div class="fl scale clearfix">
	                	<x:choose>           		
	                		<x:when select="$item/@QuestionType = '85009'">
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
		                  			
	                		</x:when>
	                			 
	                		<x:when select="$item/@QuestionType = '85010'">
		                		<div class="scale_range"> <span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> <span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
		                    		<div class="mark"><br /></div>
		                    		<div id="div_<x:out select="$item/@AttributeCodeId" />"></div>		                    		
		                  		</div>
		                  		<div class="counter_parent">
		                    		<input type="text" readonly id="<x:out select="$item/@AttributeCodeId" />" name="name_<x:out select="$item/@AttributeCodeId" />" value="" class="range_counter freeform answer">
		                  		</div>
		                  		<script>
		                  			var temp = '<x:out select="$item/@AttributeCodeId" />';
		                  			createSlider("#div_" + temp, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />, "#" + temp);
		                  		</script>
		                  		
		                  		<input type="hidden" id="sld_<x:out select="$item/@AttributeCodeId" />" name="<x:out select="$item/@AttributeCodeId" />" value=""  />                    
		                  	
		                  		<select id="select_<x:out select="$item/@AttributeCodeId" />" class="miniselect">
					            	<option>K</option>
					              	<option>Lac</option>
					              	<option>Cr</option>				              
				            	</select>
	                		</x:when>
	                		              	
	                		<x:when select="$item/@QuestionType = '85002'">
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
	                		</x:when>
	                			                	
	                		<x:when select="$item/@QuestionType = '85006'">
	                			<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
	                				<x:forEach select="$item/Options/Option" var="optionElement">	                						                			
				                		<li class="fl">
					                		<a href="#">
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
	                	</x:choose>
	                </div>
	              </div>
	              <div class="clr"></div>
	            </div>
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
						<li class="fl list"><a style="cursor:pointer;" href="#" class="anch save" ><span class="txt">Save</span></a></li>
						<li class="fl list"><a onclick="checkData('${pageContext.request.contextPath}/partner/datacollection');" class="anch cancel"><span class="txt">Cancel</span></a></li>
						
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
									$('#div_${questDetail.questionId}').slider( "option", "value", ${questDetail.attributeValue});
									$('#${questDetail.questionId}').val(${questDetail.attributeValue});
									
									var amountIn = ${questDetail.attributeRefferenceValue} / ${questDetail.attributeValue};
									if(amountIn == 10000000){
										$('#select_${questDetail.questionId}').val("Cr");
									} else if(amountIn == 100000){
										$('#select_${questDetail.questionId}').val("Lac");
									} else {
										$('#select_${questDetail.questionId}').val("K");
									}
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
							<c:when test="${questionTypeEle[1] eq '85006'}">							
								<script>
									$('#div_${questDetail.attributeValue}').addClass("not_applicable");
		 							$('#${questDetail.attributeValue}').val(${questDetail.attributeRefferenceValue});
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

<c:if test="${sectionTypeId eq 39002}" >
	<script>
	 //advice assumption Slider
	  createSlider('#advice_assump_cf',0,100,0,'#advice_assump_cf_payment');
	  createSlider('#advice_assump_cf_in',4,15,1,'#advice_assump_cf_in_payment');
	</script>
</c:if>
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
					if($("#select_" + questAttId).val() == "Cr"){
						amount = amount * 10000000;
					} else if($("#select_" + questAttId).val() == "Lac"){
						amount = amount * 100000;
					} else {
						amount = amount * 1000;
					}
					
					inputData = inputData + "<Question>";
					inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
					inputData = inputData + "<QuestionOptionId>" + $(this).val() +  "</QuestionOptionId>";
					inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
					inputData = inputData + "<Value>" + amount + "</Value>";			
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

$(".save").click(function() {

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

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

$(document).ready(function(){
	
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
		
	
	$("#confirmDialog .close").click(function(){
        $(".overlay").fadeOut("slow");
    	$("#confirmDialog").fadeOut("slow");
    	 });
	
	$('.common_in_content').slimScroll();
    $('.wrapper').attr('id', 'dc_screens');
    $("select").selectBoxIt();

 	$(".thumb_select_ul a").click(function(){
 	   $(this).children(".categoery").toggleClass("not_applicable");
 	   if($(this).children(".categoery").find(".answer").val() == ""){
 		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("name")); 		   
 	   } else {
 		  $(this).children(".categoery").find(".answer").val("");
 	   }
 	});
 	
 	getData();
 	$("#initialData").val(inputData);
 	$("#confirmDialog .close").click(function(){
 	    $(".overlay").fadeOut("slow");
 	 $("#confirmDialog").fadeOut("slow");
 	  });
 	 	
});

</script> 
<div class="overlay"></div>
</body>
		 	