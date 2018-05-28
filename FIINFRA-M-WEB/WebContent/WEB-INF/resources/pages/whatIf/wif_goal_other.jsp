<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
#page_loader {
	background: #fff
		url(${pageContext.request.contextPath}/resources/images/loader.gif)
		no-repeat center center;
}
</style>
<div id="">
	<!-- Main starts-->
	<div class="main-content">
		<div class="main-content-inner">
			<!-- Common_content Starts-->
			<div class="row">

				<div class="col-md-6">


					<div class="priority_bx pull-left">
						<div class="priority_bx_icon fl">
							<i class="ace-icon fa fa-adjust bigger-200"></i>
						</div>
						<div class="priority_bx_txt_bx fl">
							<div class="priority_no">${goalsByOther}</div>
							<div class="priority_no_txt">people having similar goal.</div>
						</div>
					</div>

				</div>
				<div class="col-md-6">
					<section class="common_unit_selector">
						<ul class="clearfix reset">
							<li class="k"><i class="ace-icon fa fa-rupee bigger-100"></i>
								<span class="unit">K</span></li>
							<li class="lacs unit_selected"><i
								class="ace-icon fa fa-rupee bigger-100"></i><span class="unit">Lacs</span></li>
							<li class="cr"><i class="ace-icon fa fa-rupee bigger-100"></i>
								<span class="unit">Cr</span></li>
						</ul>
						<p>All figures are in :</p>
					</section>
				</div>
			</div>
   
   <form class="form-horizontal" id="otherGoalForm" name="otherGoalForm" action="<c:url value="/whatIf/saveOtherGoal" />" method="POST">
      <div class="page-content">
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="${goalName}" />
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="goalId" id="goalId" value="${goalId}" />
      
      <c:set var="attributeCount" value="${0}"></c:set>	
      
      <input id="contactPartyId" name="contactPartyId" type="hidden" value="${partyId}">
      <x:parse xml="${sectionData}" var="output" />
      <c:set var="currentColumnCount" value="${1}"></c:set>	
      

        <x:forEach select="$output/Section/Question" var="item" varStatus="count">
        			<c:set var="questionType"><x:out select="$item/@QuestionType" escapeXml="false"/></c:set>
        			<c:set var="attributeCodeId"><x:out select="$item/@AttributeCodeId" escapeXml="false"/></c:set>
        			
        			<c:if test="${questionType != '85012' && questionType != '85013'}">
		      			 <input type="hidden" name="attributeCodeId_<c:out value="${attributeCount}"/>" id="attributeCodeId_<c:out value="${attributeCount}"/>" value="<x:out select="$item/@AttributeCodeId" />" />
		      			 <c:set var="attributeCount" value="${attributeCount+1}"></c:set>        			
        			</c:if>
      			<x:choose>
      				      		
	      			<x:when select="$item/@QuestionType = '85012'">
	      			 <div class="title-bg"> <div class="title"><x:out select="QuestionText" /></div></div> 	      				
	      					
				         <div class="row">
								<div class="col-sm-3">
								</div>
									<div class="col-sm-6">
										<form class="form-horizontal" role="form">				        				       			         
				         
				         <c:set var="column1RowCount"><x:out select="$item/RowsForColumn1" escapeXml="false"/></c:set>
				         <c:set var="column2RowCount"><x:out select="$item/RowsForColumn2" escapeXml="false"/></c:set>  
						 <c:set var="currentRowCount" value="${-1}"></c:set>							 						   				      					      			
	      			</x:when>
        
        		<x:when select="$item/@QuestionType = '85017'">	
			           	<div class="form-group">
			              <label class="form_label"><x:out select="QuestionText" /> </label>
			              <textarea id="Other_Goal_txt_editor" class="answers required" name="text__${count.index}" cols="45" rows="5"></textarea>		              	
			            
			            </div>	
			        </x:when>
       			<x:when select="$item/@QuestionType = '85004'">
								<div class="form-group">
									
									<label class="col-sm-3 no-padding-right"
										for="brand_${count.index}"><x:out
											select="QuestionText" /></label>
									<div class="col-sm-7">
										<select id="brand_${count.index}" name="brand_${count.index}"
											class="chosen-select form-control">
										</select>
									</div>
								</div>
								
			           <script type="text/javascript">			           
					   		var dropDownName = "#brand_"+${count.index};
					   		var partyIdVar = "#contactPartyId";
					   		var partyIdVarValue = $(partyIdVar).val();
					   		var attrId = <x:out select="$item/@AttributeCodeId" />;
					   		$(dropDownName).addClass("answers");
					   		$(dropDownName).addClass("required");
				   		
					   		if(attrId == 100051)
						   	{
					   			 
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	}else if( attrId == 100050)
						   	{
						   		 
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	}
					   						   							   
			           </script>
			        </x:when>
       
       			 <x:when select="$item/@QuestionType = '85009'">
								<div class="form-group">
									<label class="col-sm-3 no-padding-right"
										for="sliderValue_${count.index}"><x:out
											select="QuestionText" /></label>
									<div class="col-sm-9 col-xs-12">
										<div class="range_parent">
											<div class="scale clearfix">
												<div class="col-sm-7 col-xs-6">
													<div class="scale_range">
														<span id="sliderMinValue_${count.index}"
															class="low extrem"><x:out
																select="$item/Scale/Min_Value" /></span> <span
															id="sliderMaxValue_${count.index}" class="high extrem"><x:out
																select="$item/Scale/Max_Value" /></span>
													</div>
													<div class="help-block" id="slider_${count.index}"></div>
												</div>
												<div class="space-10"></div>
												<div class="col-sm-5 col-xs-6">
													<x:if select="$item/Scale/IsCurrency != '0'">
														<div class="counter_parent rupee">
													</x:if>
													<x:if select="$item/Scale/IsCurrency = '0'">
														<div class="counter_parent">
													</x:if>

													<input type="text" id="sliderValue_${count.index}"
														name="sliderValue_${count.index}" placeholder="0"
														class="col-xs-9 range_counter answers required 
							<c:choose> <c:when test='${count.index == 6 }'>Number1</c:when><c:when test='${count.index != 6 }'>Number1</c:when></c:choose>" />

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
											</div>
						
			       			<script type="text/javascript">
			    				var sliderVar = "#slider_"+${count.index};
			    				var sliderValueVar = "#sliderValue_"+${count.index};
			    				var sliderValue =  ${goalMap[attributeCodeId]};
			    				/*sliderValue = sliderValue/1000;
			    				if(sliderValue<=100)
			    				{
			    					// K
			    					amountUnit="k";
			    					$(".dynamic").html("k");
			    					$(".cr").removeClass("unit_selected");
			    					$(".lacs").removeClass("unit_selected");
			    					$(".k").addClass("unit_selected");
			    					
			    				}else 
			    				{
			    					sliderValue = sliderValue/100;
			    					if(sliderValue<=100)
			    					{
			    						// lacs
			    						amountUnit="lacs";
			    						$(".dynamic").html("lacs");
			    						$(".cr").removeClass("unit_selected");
				    					$(".k").removeClass("unit_selected");
				    					$(".lacs").addClass("unit_selected");
				    			
			    					}
			    					else
			    					{
			    						sliderValue = sliderValue/100;
			    						// cr
			    						amountUnit="cr";
			    						$(".dynamic").html("cr");
			    						$(".lacs").removeClass("unit_selected");
				    					$(".k").removeClass("unit_selected");
				    					$(".cr").addClass("unit_selected");
			    					}
			    				}
			    				
			    				*/
			    				createSliderNew(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" /> , sliderValueVar, sliderValue);
			    			</script>
										</div>
									</div>
								</div>
				</div>
				</x:when>
			    </x:choose>
			    
			    
			        			
	      		
				<c:set var="currentRowCount" value="${currentRowCount+1}"></c:set>
				
				<c:if test="${currentColumnCount == 1}">
					<c:if test="${column1RowCount == currentRowCount}">
						<c:set var="currentColumnCount" value="${2}"></c:set>	
						<c:set var="currentRowCount" value="${0}"></c:set>
						</div>
						
						</div>
	</c:if>
	</c:if>

	</x:forEach>


</div>
     <%--  <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="javascript:void(0);" onclick="doValidate('otherGoalForm','${pageContext.request.contextPath}/whatIf/graph/${partyId}')" class="anch cancel" style="margin-right: 260px;"><span class="txt">Cancel</span></a></li>
          </ul>
        </section>  --%>     
 
 <section class="common_footer_actions">
	<div class="row">
	<div class="col-sm-1 col-xs-3"></div>
	<div class="col-sm-4 col-xs-4 "></div>
		<div class="col-sm-3 col-xs-4">
			<button class="btn btn-app btn-transparent btn-xs save ">
				<i class="ace-icon fa fa-save bigger-200"></i> Save
			</button>
		
		
			<button class="btn btn-app btn-transparent btn-xs cancel"
				onclick="doValidate('otherGoalForm','${pageContext.request.contextPath}/whatIf/graph/${partyId}')">
				<i class="ace-icon fa fa-close bigger-200"></i> Cancel
			</button>
		
		</div>
		</div>
</section>
</form>

<div class="overlay"></div>
<script>

function doValidate(url)
{
	 var x = document.getElementById("otherGoalForm");
	 var newValues = [];
	 var flag = false;
     for (var i=0; i<x.length; i++) 
     {
    	if(typeof(x.elements[i]) != "undefined")
    	{
    		newValues[i] = x.elements[i].value;
    	}
     }
     for(var i=0; i<newValues.length; i++)
     {
    	 if(newValues[i]!=oldValues[i])
    	 {
    		 flag = true;
    		 break;
    	 }
    	 if($("#hiddenGoalName").val()!=$("#goalName").val())
    	 {
    		 flag = true;
    		 break;
    	 }
     }
     if(flag)
     {
    	 doConfirm(url); 
    	 flag = false;
     }else
     {
      document.location = url;
      flag = false;
     }
}

$(".save").click(function() {
	var flag=false;
	createNewValueArray("otherGoalForm");
	
	for(var i=0; i<newValues.length; i++)
    {
   	 if(newValues[i]!=oldValues[i])
   	 {
   		 flag = true;
   		 break;
   	 }
   	 if($("#hiddenGoalName").val()!=$("#goalName").val())
   	 {
   		 flag = true;
   		 break;
   	 }
    }
	
	if(flag)
	{
	var cnt=0;
	var inputData="[";
	$("#otherGoalForm").find(".answers").each(function (index) {			
		
		if($(this).val() != ''){
			var attributeCodeIdVar = '#attributeCodeId_'+ cnt;
			var attributeCodeIdValue = $(attributeCodeIdVar).val();
			inputData = inputData + attributeCodeIdValue + ":"; // clear no change require
			inputData = inputData + $(this).val() + ",";				
			cnt++;
			/*if(attributeCodeIdValue == 100052)
			{
				inputData = inputData + attributeCodeIdValue + ":"; // clear no change require
				 
				var amount =  parseFloat($(this).val());
				
				if(amountUnit=='k')
				{
					amount = amount*1000.00;
				}
				else if(amountUnit=='lacs')
				{
					amount = amount*100000.00;
				}
				else if(amountUnit=='cr')
				{
					amount = amount*10000000.00;
				}
				
				inputData = inputData + amount + ",";				
				cnt++;	
			}
			else
			{
				inputData = inputData + attributeCodeIdValue + ":"; // clear no change require
				inputData = inputData + $(this).val() + ",";				
				cnt++;	
			}*/
			
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
	else if($('#otherGoalForm').validate().form()) {
		$(".save").addClass("inactiveLink");
		$("#otherGoalForm").submit();
	}
	}
	else
	{
		dynamicMsg("You haven't changed any data yet.Please make some changes and then save.");
	}
});



$(document).ready(function(){
	
	
	$("#otherGoalForm").validate({
		ignore:'', //i.e. do not ignore hidden elements	
	});
	
	$('#goalName').val($('#hiddenGoalName').val());
	//$('.wrapper').attr('id', 'Global_Goal');
	
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
  
    // 
	 // Calls the selectBoxIt method on your HTML select box
    $('.common_in_content').slimScroll();

    $(".common_unit_selector li").click(function(){
    	$(".common_unit_selector li").removeClass("unit_selected");
        $(this).addClass("unit_selected");

	});
    
    if($("#hiddenGoalName").val()=="" || $("#hiddenGoalName").val()==null)
 	{
    	$("#goalName").val("Other Goal");
    	$("#hiddenGoalName").val("Other Goal");
    	
    	$("#sliderValue_5").val(${inflationrate});
    	$("#slider_5").slider("value",$("#sliderValue_5").val());
    	
 	}
    
    $(window).bind("load", function() {
    	$( document ).ajaxComplete(function() {
    		createOldValueArray('otherGoalForm');
	    	});
    }).trigger('load');
    
    
	
    
});
  
	//Your Budget value Slider
	createSliderNew('#down_payment',0,100,1,"#d_payment");
	

</script>