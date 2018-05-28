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
  
     <form class="form-horizontal" id="frmCarGoal" name="frmEductionGoal" action="<c:url value="/futureFinancialDc/saveCarGoal" />" method="POST">
       <div class="page-content">
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="${goalName}" /> 
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="goalId" id="goalId" value="${goalId}" />
      
       <input type="hidden" id="brandIdHidden" value="113016">
	  <input type="hidden" id="categoryIdHidden" value="112055">
	  <input type="hidden" id="modelIdHidden" value="114154">
	  <input type="hidden" id="variantIdHidden" value="115594">	
      
      <input type="hidden" id="flag1" value="1">
	  <input type="hidden" id="flag2" value="1">
	  <input type="hidden" id="flag3" value="1">
	  
      <c:set var="attributeCount" value="${0}"></c:set>	
      
     
      
      	<input id="contactPartyId" name="contactPartyId" type="hidden" value="${partyId}">
      	<x:parse xml="${sectionData}" var="output" />
      		<c:set var="currentColumnCount" value="${1}"></c:set>	
      	      	
      		<x:forEach select="$output/Section/Question" var="item" varStatus="count">
        			<c:set var="questionType"><x:out select="$item/@QuestionType" escapeXml="false"/></c:set>
        			<c:set var="attributeCodeId"><x:out select="$item/@AttributeCodeId" escapeXml="false"/></c:set>
        			
        			<c:if test="${questionType != '85012'}">
		      			 <input type="hidden" name="attributeCodeId_<c:out value="${attributeCount}"/>" id="attributeCodeId_<c:out value="${attributeCount}"/>" value="<x:out select="$item/@AttributeCodeId" />" />
		      			 <c:set var="attributeCount" value="${attributeCount+1}"></c:set>        			
        			</c:if>
      			<x:choose>
	      				      		
	      			<x:when select="$item/@QuestionType = '85012'">
	      				 <div class="title-bg"><div class="title"><x:out select="QuestionText" /></div></div> 	      				
	      					
				          <div class="row">
								
									<div class="col-sm-6">
										<form class="form-horizontal" role="form">				        				       			         
				         					        				       			         
				         
				         <c:set var="column1RowCount"><x:out select="$item/RowsForColumn1" escapeXml="false"/></c:set>
				         <c:set var="column2RowCount"><x:out select="$item/RowsForColumn2" escapeXml="false"/></c:set>  
						 <c:set var="currentRowCount" value="${-1}"></c:set>							 						   				      					      			
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
					   		if(attrId == 100050)// for expected_year_of_purchase
					   		{
					   			
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   			
					   		}
					   		else if(attrId == 100051)// for expected_year_of_purchase
					   		{
					   		
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   			
					   		}
			           </script>
			        
					</x:when>	
					
					<x:when select="$item/@QuestionType = '85005'">
								<div class="form-group">
									<label class="col-sm-3 no-padding-right" id=""
										for="text__${count.index}"><x:out
											select="QuestionText" /> </label>
									<div class="col-sm-9 col-xs-10">
										<div class="input_counter_parent">
											<input type="text" name="text__${count.index}"
												class="input_counter answers required Number1" value="${goalMap[attributeCodeId]}"
												id="text__${count.index}"> <span
												class="unit dynamic">lacs</span>
										</div>
									</div>
								</div>
							</x:when>	
							
							<x:when select="$item/@QuestionType = '85999'">
								<div class="form-group">
								<label class="col-sm-3 no-padding-right" for="auto__${count.index}"><x:out select="QuestionText" /></label>
									<div class="col-sm-7 col-xs-12">										
										<input type="text" class="col-sm-12 col-xs-11 answers"
											id="auto__${count.index}" name="auto__${count.index}" value="${goalMap[attributeCodeId]}"/>
									</div>
								</div>
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
			    				<c:choose>
				    				<c:when test="${empty goalMap[attributeCodeId]}">
				    				var sliderValue = 1;
				    				</c:when>
				    				<c:otherwise>
				    				var sliderValue =  ${goalMap[attributeCodeId]};
				    				</c:otherwise>
		    					</c:choose>
		    					if(sliderVar=="#slider_11" || sliderVar=="#slider_12")
			    				{
			    					createSliderNew(sliderVar, <x:out select="$item/Scale/Min_Value" />,'${goalMap[attributeCodeId]}',<x:out select="$item/Scale/Increment" /> , sliderValueVar, sliderValue);
			    				}
			    				else
			    				{
			    					createSliderNew(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" /> , sliderValueVar, sliderValue);	
			    				}
			    			</script>

										</div>
									</div>
								</div>
				</div>
				</x:when>
			       		
			       		
			  	   <x:when select="$item/@QuestionType = '85013'">

					<div class="form-group"><label class="form_label"><x:out
								select="QuestionText" /></label> <img
						src="${pageContext.request.contextPath}/resources/images/star-rating.png"
						alt="" width="96" height="27" hspace="10" align="absmiddle"></div>
				</x:when>       	
			       
			          <x:when select="$item/@QuestionType = '85014'">
					<div class="form-group">
						<label class="col-sm-3 no-padding-right"
							for="text__${count.index}"><x:out select="QuestionText" />
							<%-- &nbsp; &nbsp;<img
			src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" /> --%></label>
						<div class="col-sm-7 col-xs-12">
							<x:if select="$item/IsReadOnly = '1'">
								<input type="text" disabled
									class="col-sm-12 col-xs-11 answers required"
									id="text__${count.index}" name="text__${count.index}" value=" ${goalMap[attributeCodeId]}" />
							</x:if>
							<x:if select="$item/IsReadOnly = '0'">
								<input type="text"
									class="col-sm-12 col-xs-11 answers <c:if test='${count.index == 16 }'>Number1</c:if>"
									id="text__${count.index}" name="text__${count.index}" value=" ${goalMap[attributeCodeId]}" />
							</x:if>
						</div>
					</div>
				</x:when>	
     			
					<x:when select="$item/@QuestionType = '85002'">
					<div class="form-group">
							<label class="form_label"><x:out select="QuestionText" /> </label>
						<div class="col-sm-7">
							<input type="checkbox" id="car_type" name="car_type" value="checked" class="car_type orignal_checkbox"/>
							<div class="clearfix"></div>
							<input type="hidden" id="textForToggle" class="answers" value="New" />
						</div>
						
						<script type="text/javascript">
						
						$('.toggle').toggles({text:{on:'NEW',off:'OLD'}});
						
						$("#car_type").on('toggle', function (e, active) {
							var textForToggleVar = "#textForToggle";
					    	if (active) {
					    		$(textForToggleVar).val("New");
						    	$(".car_type").prop("checked", true);																   
					    	} else {
					    		$(textForToggleVar).val("Old");
						    	$(".car_type").prop("checked", false);
					    	}
						});
						
						var value = '${goalMap[attributeCodeId]}';
						var textForToggleVar = "#textForToggle";
						
						if(value == 'New')
						{							
							$("#car_type").trigger('click');
// 							$('.toggle').toggles({on:true});
						 	$(textForToggleVar).val("New");	
						 	
						 }
						else{
// 							$('.toggle').toggles({on:false});
						 	$(textForToggleVar).val("Old");			
						 		
						}
						
						</script>
					</div>
					</x:when>  
					
				<x:when select="$item/@QuestionType = '85015'">
						<input type="hidden" class="answers" id="fuelTypeSelected" name="fuelTypeSelected" value="-1" />				
			           <div class="form-group">
			              <label class="col-sm-3 no-padding-right"><x:out select="QuestionText" /></label>
			               <div class="reset clearfix fuel_type_ul thumb_select_ul">
			               <div class="col-sm-7">
			              <x:forEach select="$item/Options/Option" var="optionElement">
			              	
			            <a href="#">
			              	<div class="categoery <x:out select="$optionElement/@Css"/>">
			              		<div class="thumb"></div>
			              	</div>
			              		<label class="col-sm-3 no-padding-right" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$optionElement/@AttributeCodeID" />"><x:out select="$optionElement" /></label>			              					              								  
			              		</a>
			              			              
			              </x:forEach>
			              </div>
			              </div>																
						<script>
							$(".thumb_select_ul a").click(function(){
								$(".thumb_select_ul a").children(".categoery").removeClass("not_applicable");
							    $(this).children(".categoery").addClass("not_applicable");								    	
							    var labelName =$(this).find(".label").attr('name');
							    var fuelTypeSelectedVar = "#fuelTypeSelected";
							    $(fuelTypeSelectedVar).val(labelName);
						  	});

						  	var carType =  '${goalMap[attributeCodeId]}';
						  	
						  	if(carType == '100034')
							{
						  		$(".petrol").addClass("not_applicable");								
							}
						   	if(carType == '100035')
							{
						   		$(".disel").addClass("not_applicable");								
							}
						  	if(carType == '100036')
							{
						  		$(".cng").addClass("not_applicable");								
							}
						  	if(carType == '100037')
							{
						  		$(".lpg").addClass("not_applicable");								
							}
						  	if(carType == '100038')
							{
						  		$(".hybrid").addClass("not_applicable");								
							} 
						</script>
						</div>
					</x:when>	
									   			
					
	      		</x:choose>
	      		
				<c:set var="currentRowCount" value="${currentRowCount+1}"></c:set>
				
				<c:if test="${currentColumnCount == 1}">
					<c:if test="${column1RowCount == currentRowCount}">
						<c:set var="currentColumnCount" value="${2}"></c:set>	
						<c:set var="currentRowCount" value="${0}"></c:set>
				
</div>
	<div class="col-sm-6">
			<form class="form-horizontal" role="form">
				</c:if>
				</c:if>

				<c:if test="${currentColumnCount == 2}">
					<form class="form-horizontal" role="form">
						
						<c:if test="${column2RowCount == currentRowCount}">
							<c:set var="currentColumnCount" value="${1}"></c:set>
					</form>
		</div>
		</div>
	</c:if>
	</c:if>

	</x:forEach>


</div>
       <section class="common_footer_actions">
	<div class="row">
		<div class="col-sm-1 col-xs-3">
			<button class="btn btn-app btn-transparent btn-xs inactiveLink"
				onclick="location.href="${pageContext.request.contextPath}${back}">
				<i class="ace-icon fa fa-long-arrow-left bigger-240"></i> Back
			</button>
		</div>


		<div class="col-sm-10 col-xs-6">
			<div class="col-sm-1 col-xs-0"></div>
			<div class="col-sm-4 col-xs-4 test">
				<button
					class="btn btn-app btn-transparent btn-xs analysis " onclick="doValidate('frmCarGoal','${pageContext.request.contextPath}/analysis/car/${partyId}/${goalId}')" >
					<i class="ace-icon fa fa-search bigger-200"></i> Analysis
				</button>
				<button
					class="btn btn-app btn-transparent btn-xs suggeset " onclick="doValidate('frmCarGoal','${pageContext.request.contextPath}/analysis/suggestion/car/${partyId}/${goalId}')">
					<i class="ace-icon fa fa-lightbulb-o bigger-200"></i> Suggestion
				</button>
				<button
					class="btn btn-app btn-transparent btn-xs action_plan " onclick="doValidate('frmCarGoal','${pageContext.request.contextPath}/actionplan/goal/car/${partyId}/${goalId}')">
					<i class="ace-icon fa fa-hand-o-up bigger-200"></i> Action Plan
				</button>
			</div>
			<div class="col-sm-3 col-xs-4">
				<button class="btn btn-app btn-transparent btn-xs " onclick="uploadNote(${goalId},${partyId},'/futureFinancialDc/edit-car-goal/${goalId}/${partyId}');">
					<c:set var="docUrl" value="?partyId=${partyId}&url=/futureFinancialDc/edit-car-goal/${goalId}/${partyId}"/>
					<i class="ace-icon fa fa-file-code-o bigger-200"></i> Notes
				</button>
				<button
					class="btn btn-app btn-transparent btn-xs dcAddNewDocumentLink"
					onclick="doValidate('frmCarGoal','${pageContext.request.contextPath}/partner/addDocument${docUrl}');">
					<i class="ace-icon fa fa-newspaper-o bigger-200"></i> Doc
				</button>
			</div>
			<div class="col-sm-4 col-xs-4">
				<button
					class="btn btn-app btn-transparent btn-xs saveEditCarGoalLink save">
					<i class="ace-icon fa fa-save bigger-200"></i> Save
				</button>
				<button class="btn btn-app btn-transparent btn-xs"
					onclick="doValidate('frmCarGoal','${cancel}')">
					<i class="ace-icon fa fa-close bigger-200"></i> Cancel
				</button>
				<a
					href="#"><button
						class="btn btn-app btn-transparent btn-xs inactiveLink">
						<i class="ace-icon fa fa-forward bigger-200"></i> Skip
					</button></a>
			</div>
			<div class="col-sm-1 col-xs-0"></div>
			<div class="col-sm-1 col-xs-0"></div>
		</div>
		<div class="col-sm-1 col-xs-3">
			<button class="btn btn-app btn-transparent btn-xs inactiveLink"
				onclick="location.href="${pageContext.request.contextPath}${next}">
				<i class="ace-icon fa fa-long-arrow-right bigger-240"></i> Next
			</button>
		</div>
	</div>
</section>
</form>

<div class="overlay"></div>

<script>

$(".save").click(function() {		

	var fuelTypeSelectedVar = "#fuelTypeSelected";
	
	var flag=false;
	createNewValueArray("frmCarGoal");
	
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
	var inputData="[";
	inputData = inputData + "100030:"+$("#textForToggle").val()+ ",";
	inputData = inputData + "100032:"+$("#sliderValue_2").val()+ ",";
	inputData = inputData + "100033:"+$("#fuelTypeSelected").val()+ ",";
	if($("#auto__4").val()!="")
	{
		inputData = inputData + "100039:"+$("#auto__4").val()+ ",";
	}
	if($("#auto__5").val()!="")
	{
		inputData = inputData + "100031:"+$("#auto__5").val()+ ",";
	}
	if($("#auto__6").val()!="")
	{
		inputData = inputData + "100040:"+$("#auto__6").val()+ ",";
	}
	if($("#auto__7").val()!="")
	{
		inputData = inputData + "100041:"+$("#auto__7").val()+ ",";
	}
	inputData = inputData + "100051:"+$("#brand_8").val()+ ",";
	inputData = inputData + "100050:"+$("#brand_9").val()+ ",";
	inputData = inputData + "100052:"+$("#text__10").val()+ ",";
	inputData = inputData + "100057:"+$("#sliderValue_11").val()+ ",";
	inputData = inputData + "100056:"+$("#sliderValue_12").val()+ ",";
	inputData = inputData + "100058:"+$("#sliderValue_13").val()+ ",";
	inputData = inputData + "100059:"+$("#sliderValue_14").val()+ ",";
	inputData = inputData + "100053:"+$("#sliderValue_15").val();
	
	inputData = inputData + "]";
	
	$("#inputData").val(inputData);		
	$('#hiddenGoalName').val($('#goalName').val());
	if($('#hiddenGoalName').val()=="" || $('#hiddenGoalName').val()== null)
	{
		alertMessage();
		$("#goalName").focus();
	}
	else if($('#frmCarGoal').validate().form()){
		
		$(".save").addClass("inactiveLink");
		$("#frmCarGoal").submit();
		
	}
	}else
	{
		dynamicMsg("You haven't changed any data yet.Please make some changes and then save.");
	}
	});


$(document).ready(function(){
	
	$("#brand_4").removeClass('required');
	$("#brand_5").removeClass('required');
	$("#brand_6").removeClass('required');
	$("#brand_7").removeClass('required');
	
	$(window).load(function(){
		  $('#page_loader').fadeOut("5000");
	});
		  $(function() {

				$(document).ajaxStop(function() {
					 $('#page_loader').fadeOut();
				});

				$(document).ajaxStart(function() {
					 $('#page_loader').fadeIn();
				});

			});	
	
		  jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CarBrand", '{}', "#auto__4", "auto__4", '');
		  
		  jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#brandIdHidden").val(), '{}', "#auto__5", "auto__5", '');
		  
		  jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#categoryIdHidden").val(), '{}', "#auto__6", "auto__6", '');
		  
		  jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#modelIdHidden").val(), '{}', "#auto__7", "auto__7", '');
		  
$("#frmCarGoal").validate({
		
		ignore:'', //i.e. do not ignore hidden elements	
		rules:{	text__10:{min:0.01,max:1000},sliderValue_13:{min:5,max:18},sliderValue_14:{min:1,max:10}}
	});
	
$('#goalName').val($('#hiddenGoalName').val());	
//$('.wrapper').attr('id', 'Global_Goal');	

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
  
    //$("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	
	 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	 
    $('.common_in_content').slimScroll();	 

    $(".common_unit_selector li").click(function(){
		$(".common_unit_selector li").removeClass("unit_selected");
    	$(this).addClass("unit_selected");
  	});
    $("#text__10").change(function(ele) {
    	var amt =$("#text__10").val();
    	var min= 0;
    	
    	if(!isNaN(amt))
         {
    		$("#slider_11").slider("option", "max", parseFloat($("#text__10").val()));
    	    $("#slider_12").slider("option", "max", parseFloat($("#text__10").val()));
    	    $("#sliderMaxValue_11").html($("#text__10").val());
    	    $("#sliderMaxValue_12").html($("#text__10").val());
    	    
    	    $("#sliderValue_11").rules("add",{max:parseFloat($("#text__10").val()),min:0});
         }
    	$('#sliderValue_11').val(amt); 
	    $("#slider_11").slider("value", amt);
	    $('#sliderValue_12').val(min); 
	    $("#slider_12").slider("value", min);
    	
      }); 
    
    
     $("#sliderValue_11").change(function(ele){
    	var amt=$("#text__10").val();    	
     	$("#text__10").val(amt);     	
     	var dp=$("#sliderValue_11").val();
     	$("#sliderValue_11").val(dp);
     	var loanReq = parseFloat(amt) - parseFloat(dp); 
     	loanReq = loanReq.toFixed(2);
     	if(loanReq > 0){
     		$('#sliderValue_12').val(loanReq);    		
     	} else {
     		$('#sliderValue_12').val(0);
     	}
     });
     
     $( "#sliderValue_11" ).change(function() {
     	 $("#slider_11").slider("value", $( "#sliderValue_11" ).val());
    	 $("#slider_12").slider("value", $( "#sliderValue_12" ).val());
    	 
    	 if(parseFloat($("#sliderValue_11").val())==parseFloat($("#text__10").val()))
    	 {
    		 $("#slider_13").slider('disable'); 
   		  	 $("#sliderValue_13").attr('readonly', 'true');
   		     $("#sliderValue_13").val(0);
		     $("#sliderValue_13").rules("remove");
		     
   			 $("#slider_14").slider('disable'); 
		  	 $("#sliderValue_14").attr('readonly', 'true');
		     $("#sliderValue_14").val(0);
		     $("#sliderValue_14").rules("remove");
   		 }
    	 else
    	 {
    		 $("#slider_13").slider('enable'); 
    		 $("#sliderValue_13").removeAttr('readonly');
			 $("#sliderValue_13").val($("#slider_13").slider('value'));
		  	 $("#sliderValue_13").rules("add",{min:5,max:18});
   		  	 
   			 $("#slider_14").slider('enable'); 
   			 $("#sliderValue_14").removeAttr('readonly');
			 $("#sliderValue_14").val($("#slider_14").slider('value'));
		  	 $("#sliderValue_14").rules("add",{min:1,max:10});
    	 }
    	 	 
     });
      // make loan amount slide and text fiels read only 
     $("#slider_12").slider('disable');
     $("#sliderValue_12").attr('readonly', 'true');
     
     // when dp slider changes loan amount will gets change
     $("#slider_11").slider({
 	change: function(event, ui) {
 		var amt=$("#text__10").val();
    	var dp=$("#sliderValue_11").val();    	
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = loanReq.toFixed(2);
    	if(loanReq > 0){
     		$('#sliderValue_12').val(loanReq);  
     		 $("#slider_12").slider("value", $( "#sliderValue_12" ).val());
     	} else {
     		$('#sliderValue_12').val(0);
     		 $("#slider_12").slider("value", $( "#sliderValue_12" ).val());
     	}
     	
     	 if(parseFloat($("#sliderValue_11").val())==parseFloat($("#text__10").val()))
    	 {
    		 $("#slider_13").slider('disable'); 
   		  	 $("#sliderValue_13").attr('readonly', 'true');
   		     $("#sliderValue_13").val(0);
		     $("#sliderValue_13").rules("remove");
		     
   			 $("#slider_14").slider('disable'); 
		  	 $("#sliderValue_14").attr('readonly', 'true');
		     $("#sliderValue_14").val(0);
		     $("#sliderValue_14").rules("remove");
   		 }
    	 else
    	 {
    		 $("#slider_13").slider('enable'); 
    		 $("#sliderValue_13").removeAttr('readonly');
			 $("#sliderValue_13").val($("#slider_13").slider('value'));
		  	 $("#sliderValue_13").rules("add",{min:5,max:18});
   		  	 
   			 $("#slider_14").slider('enable'); 
   			 $("#sliderValue_14").removeAttr('readonly');
			 $("#sliderValue_14").val($("#slider_14").slider('value'));
			 $("#sliderValue_14").rules("add",{min:1,max:10});
    	 }
         	     	
 	} });
 
     
     // on load change html
     	$("#slider_11").slider("option", "max", parseFloat($("#text__10").val()));
	     $("#slider_12").slider("option", "max", parseFloat($("#text__10").val()));
	     $("#sliderMaxValue_11").html($("#text__10").val());
	     $("#sliderMaxValue_12").html($("#text__10").val());
	     
	     $("#sliderValue_11").rules("add", {max:parseFloat($("#text__10").val()),min:0});
	     
	  	 if(parseFloat($("#sliderValue_11").val())==parseFloat($("#text__10").val()))
    	 {
    		 $("#slider_13").slider('disable'); 
   		  	 $("#sliderValue_13").attr('readonly', 'true');
   		     $("#sliderValue_13").val(0);
		     $("#sliderValue_13").rules("remove");
		     
   			 $("#slider_14").slider('disable'); 
		  	 $("#sliderValue_14").attr('readonly', 'true');
		     $("#sliderValue_14").val(0);
		     $("#sliderValue_14").rules("remove");
   		 }
    	 else
    	 {
    		 $("#slider_13").slider('enable'); 
    		 $("#sliderValue_13").removeAttr('readonly');
			 $("#sliderValue_13").val($("#slider_13").slider('value'));
		  	 $("#sliderValue_13").rules("add",{min:5,max:18});
   		  	 
   			 $("#slider_14").slider('enable'); 
   			 $("#sliderValue_14").removeAttr('readonly');
			 $("#sliderValue_14").val($("#slider_14").slider('value'));
			 $("#sliderValue_14").rules("add",{min:1,max:10});
    	 }
    
     
     // end of auto slider
     $(window).bind("load", function() {
        	$( document ).ajaxComplete(function() {
        		createOldValueArray('frmCarGoal');
    	    	});
        }).trigger('load');
     
    });

//Populating Category on change of Brand drop down
$("#auto__4").bind({
	"change": function(){
		jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#brandIdHidden").val(), '{}', "#auto__5", "auto__5", '');
		if($("#flag1").val() != 0) {			
			 $("#flag1").val(0);
		}
	    else {
	    	$("#auto__5").val('');
			$("#auto__6").val('');		
			$("#auto__7").val('');
	    }		 
	},
}).trigger('change');

//Populating Model on change of Category drop down
$("#auto__5").bind({
	"change": function(){	
		jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#categoryIdHidden").val(), '{}', "#auto__6", "auto__6", '');
		if($("#flag2").val() != 0) {			
			 $("#flag2").val(0);
		}
	    else {
	    	$("#auto__6").val('');
			$("#auto__7").val('');
	    } 		 
	},
});

//Populating Variant on change of Model drop down
$("#auto__6").bind({
	"change": function(){
		jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#modelIdHidden").val(), '{}', "#auto__7", "auto__7", '');
		if($("#flag3").val() != 1) {						
			 $("#flag3").val(0);			 
		 }
		else {
			$("#auto__7").val('');
		}
	},
});
	
//Down Payment value Slider
createSliderNew('#down_payment',0,100,1,"#d_payment");
//Loan Amount value Slider
createSliderNew('#loan_amount',0,100,1,"#l_amount");
//Loan Interest value Slider
createSliderNew('#loan_interset',5,18,1,"#l_interset");
//Loan Duration value Slider
createSliderNew('#other_loan_duration',1,12,1,"#other_l_duration");

$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-mm-yy",
      showOn: "button",
	  buttonText: '',
     });
  });
    
</script>