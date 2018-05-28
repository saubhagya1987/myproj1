<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
$(document).ready(function(){
  $("body").on("click",".common_custom_checkbox",function(){
    $(this).toggleClass("white_checkbox_checkbox_checked");
 
  if ($(this).next( ".default_checkbox" ).is(":checked")) {
  
       $(this).next( ".default_checkbox" ).prop("checked", false);
       $("#isAllocateAsset").val(0);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
       $("#isAllocateAsset").val(1);

 
    }
 
  });
});

</script>
<div id="Global_Goal"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Common_content Starts-->
    <div class="priority_bx">
      <div class="priority_bx_icon fl"></div>
      <div class="priority_bx_txt_bx fl">
        <div class="priority_no">${goalsByOther}</div>
        <div class="priority_no_txt">Similar Goal by other people</div>
      </div>
    </div>
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> 
     <section class="common_unit_selector"><ul class="clearfix reset"><li class="k"><span class="unit">K</span></li><li class="lacs unit_selected"><span class="unit">Lac</span></li><li class="cr"><span class="unit">Cr</span></li></ul><p>All figures are in :</p></section>
      <div class="clr"></div>
      <!-- Common_in_contnet starts-->
      <!-- Xml code starts here -->
      
     <form class="form-horizontal" id="targetCorpusGoalForm" name="targetCorpusGoalForm" action="<c:url value="/futureFinancialDc/saveTargetCorpusGoal" />" method="POST">
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="${goalName}" /> 
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="goalId" id="goalId" value="${goalId}" />
      <input type="hidden" name="isAllocateAsset" id="isAllocateAsset" value="0" />
      
      <c:set var="attributeCount" value="${0}"></c:set>	
      
      <input id="contactPartyId" name="contactPartyId" type="hidden" value="${partyId}">
      <x:parse xml="${sectionData}" var="output" />
      <c:set var="currentColumnCount" value="${1}"></c:set>	
      
         
      <section id="education_goal" class="in_content common_in_content clearfix education_goal" >
        <x:forEach select="$output/Section/Question" var="item" varStatus="count">
        			<c:set var="questionType"><x:out select="$item/@QuestionType" escapeXml="false"/></c:set>
        			<c:set var="attributeCodeId"><x:out select="$item/@AttributeCodeId" escapeXml="false"/></c:set>
        			
        			<c:if test="${questionType != '85012' && questionType != '85013'}">
		      			 <input type="hidden" name="attributeCodeId_<c:out value="${attributeCount}"/>" id="attributeCodeId_<c:out value="${attributeCount}"/>" value="<x:out select="$item/@AttributeCodeId" />" />
		      			 <c:set var="attributeCount" value="${attributeCount+1}"></c:set>        			
        			</c:if>
      			<x:choose>


	      				      		
	      			<x:when select="$item/@QuestionType = '85012'">
	      				<div class="row_one">  <div class="title-bg"> <div class="title"><x:out select="QuestionText" /></div></div> 	      				
	  					<div id="Special_Goal">
    				      <div class="special_goal_in">
    				         <ul class="reset clearfix first_col_ul">
    				         
    	
				                  
				         
				         <c:set var="column1RowCount"><x:out select="$item/RowsForColumn1" escapeXml="false"/></c:set>
				         <c:set var="currentRowCount" value="${-1}"></c:set>							 						   				      					      			
	      			</x:when>
        
        			
					<x:when select="$item/@QuestionType = '85004'">
			            <li class="clearfix rel">
			              <label class="form_label"><x:out select="QuestionText" /></label>
			               <select id="brand_${count.index}" name="brand_${count.index}">			                
			              </select> 
			            </li>
			            
			          <script type="text/javascript">			           
					   		var dropDownName = "#brand_"+${count.index};
					   		var partyIdVar = "#contactPartyId";
					   		var partyIdVarValue = $(partyIdVar).val();
					   		var attrId = <x:out select="$item/@AttributeCodeId" />;
					   		$(dropDownName).addClass("answers");
					   		if(dropDownName=='#brand_1')
						   	{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=" + partyIdVarValue, '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
							   	$(dropDownName).addClass("required");
						   	}
					   		else if(dropDownName=='#brand_2')
						   	{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth",'{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
							   	$(dropDownName).addClass("required");
						   	}
					   		else if(dropDownName=='#brand_3')
						   	{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
							   	$(dropDownName).addClass("required");
						   	} 
					   						   							   
			           </script>
			         </x:when>
       
       			  <x:when select="$item/@QuestionType = '85009'">
			            <li class="clearfix rel">
			              <label class="form_label"><p style="margin-top:15px;"><x:out select="QuestionText" /></p></label>
			              <div class="range_parent">
			                 <div class="scale clearfix"><div class="scale_range">
			                 	<span class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> 
			                 	<span class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
			                 </div> 
			                 <div id="slider_${count.index}"></div>
			                 
			                 <x:if select="$item/Scale/IsCurrency != '0'">
			                 	<div class="counter_parent rupee">
			                 </x:if>
			                 <x:if select="$item/Scale/IsCurrency = '0'">
			                 	<div class="counter_parent">
			                 </x:if>			                 			                 
			                 
			                 	<input type="text" id="sliderValue_${count.index}" name="sliderValue_${count.index}" class="range_counter answers required number" readonly="readonly" />
			                	
			                	<x:if select="$item/Scale/IsCurrency != '0'">
			                		<span class="unit dynamic">lacs</span>
			                	</x:if> 	
			                	<x:if select="$item/Scale/IsPercentage != '0'">
			                		<span class="unit">%</span>
			                	</x:if> 	
			                	<x:if select="$item/Scale/IsDuration != '0'">
			                		<span class="unit">Yrs</span> 
			                	</x:if> 				                				                        
			    			</div>
			    			
			    			<script type="text/javascript">
			    				var sliderVar = "#slider_"+${count.index};
			    				var sliderValueVar = "#sliderValue_"+${count.index};
			    				var sliderValue =  ${goalMap[attributeCodeId]};
			    				createSliderAndSetValue(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" /> , sliderValueVar, sliderValue);
			    			</script>
			    			</div></div>
			            </li>
			       </x:when>	
			    </x:choose>
	      		
				<c:set var="currentRowCount" value="${currentRowCount+1}"></c:set>
				
				<c:if test="${currentColumnCount == 1}">
					<c:if test="${column1RowCount == currentRowCount}">
						<c:set var="currentColumnCount" value="${2}"></c:set>	
						<c:set var="currentRowCount" value="${0}"></c:set>
											
						</ul>
					</div>      
					
												
					</c:if>
				</c:if>
				
								
      		</x:forEach>   
      	<li class="clearfix rel">
        <label class="form_label"><div class="scale clearfix">Allocate asset for this goal?</div>	</label>
        <div style="margin: -28px 0px 0 222px; clear: both;float: left;width: 100px;height: 50px;"><span class="common_custom_checkbox <c:if test="${isAllocateAsset eq 1}"> white_checkbox_checkbox_checked </c:if>"></span><input type="checkbox" name="isAllocateAssetChk" id="isAllocateAssetChk" class="default_checkbox <c:if test="${isAllocateAsset eq 1}"> selected </c:if>" />        
        </div>
        <div class="clearfix"> </div>
        </li> 
        <div class="clearfix"> </div>
        </div>
      </section>
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            </li>
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="javascript:void(0);" class="anch cancel" onclick="doValidate('targetCorpusGoalForm','${cancel}')"><span class="txt">Cancel</span></a></li>
            
          </ul>
         
        </div>
        <a href="${pageContext.request.contextPath}${back}" class="back navgation "><span class="txt">Back</span></a> 
        <a href="${pageContext.request.contextPath}${next}" class="next navgation "><span class="txt">Next</span></a> 
        </section>
      
      <!-- Common footer ends --> 
    </section>
    <!-- Common_content Ends-->
    </form>
  </section>
  <!-- Main ends-->
  <div class="overlay"></div>  
</div>

<script>

$(".save").click(function() {		
	
	var cnt=0;
	var inputData="[";
	$("#targetCorpusGoalForm").find(".answers").each(function (index) {			
		
		if($(this).val() != ''){
			var attributeCodeIdVar = '#attributeCodeId_'+ cnt;
			var attributeCodeIdValue = $(attributeCodeIdVar).val();										
			inputData = inputData + attributeCodeIdValue + ":"; // clear no change require
			inputData = inputData + $(this).val() + ",";				
			cnt++;
		}
	});	
	
	inputData = inputData + "]";		
	
	$("#inputData").val(inputData);	
	$('#hiddenGoalName').val($('#goalName').val());
	
	if($('#hiddenGoalName').val()=="" || $('#hiddenGoalName').val()== null)
	{
		alertMessage();
		$("#goalName").focus();
	}
	else if($("#targetCorpusGoalForm").validate().form()){
		
		$(".save").addClass("inactiveLink");
		
		$("#targetCorpusGoalForm").submit();
	}	
	
});



$(document).ready(function(){
	
	$("#targetCorpusGoalForm").validate({
		
		ignore:'' //i.e. do not ignore hidden elements	
	});
	
	$('#goalName').val($('#hiddenGoalName').val());
	$('.wrapper').attr('id', 'Global_Goal');
	$('.wrapper').addClass('special_goal_edit');
	
	$('.toggle').toggles();

	$("#car_type").on('toggle', function (e, active) {
    	if (active) {
	  		$(".car_type").prop("checked", true);
    	} else {
	   		$(".car_type").prop("checked", false);
    	}
	});

	$(".thumb_select_ul a").click(function(){
    	$(this).children(".categoery").toggleClass("not_applicable");
  	});
	
	$("#purchase_car .car_description").keypress(function(){
  		var sum=50;
		$('.desc_container input,.desc_container a').each( function(){ sum += $(this).width(); });
		$('.desc_container').width( sum );
	});

	$('#purchase_car .car_description').bind("keypress keydown", function(e) {
		var sum=50;
        if (e.which == 46){         
			  $('.desc_container input,.desc_container a').each( function(){ sum += $(this).width(); });
              $('.desc_container').width( sum );
        }
        if (e.which == 8) {
			  $('.desc_container input,.desc_container a').each( function(){ sum += $(this).width(); });
              $('.desc_container').width( sum );
		}
    });
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
    $('.common_in_content').slimScroll();

    $(".common_unit_selector li").click(function(){
    	$(".common_unit_selector li").removeClass("unit_selected");
        $(this).addClass("unit_selected");

	});
    
    $(window).bind("load", function() {
    	$( document ).ajaxComplete(function() {
    		createOldValueArray('targetCorpusGoalForm');
	    	});
    }).trigger('load');
    
});
  
	//Your Budget value Slider
	createSlider('#down_payment',0,100,1,"#d_payment");
	
	

</script>