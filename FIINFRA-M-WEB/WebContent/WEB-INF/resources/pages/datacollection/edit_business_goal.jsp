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
        <div class="priority_bx_icon fl"><i class="ace-icon fa fa-adjust bigger-200"></i></div>
        <div class="priority_bx_txt_bx fl">
          <div class="priority_no">${goalsByOther}</div>
          <div class="priority_no_txt">people having similar goal.</div>
        </div>
      </div>
      
       </div>
      
      <div class="col-md-6">
      <section class="common_unit_selector">
        <ul class="clearfix reset">
          <li class="k"><i class="ace-icon fa fa-rupee bigger-100"></i> <span class="unit">K</span></li>
          <li class="lacs unit_selected"> <i class="ace-icon fa fa-rupee bigger-100"></i><span class="unit">Lacs</span></li>
          <li class="cr"><i class="ace-icon fa fa-rupee bigger-100"></i>
          <span class="unit">Cr</span></li>
        </ul>
        <p>All figures are in :</p>
      </section>
       </div>                
    </div>
     <form class="form-horizontal" id="buisnessGoalForm" name=buisnessGoalForm action="<c:url value="/futureFinancialDc/save-business-goal" />" method="POST">
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
					   		if(dropDownName=='#brand_1')
						   	{
					   			 
					   			jsonPopulateDropdownNew("${pageContext.request.contextPath}/common/codevalues?codeTypeId=BusinessType", '', "#brand_"+${count.index}, "#brand_"+${count.index}, '${goalMap[attributeCodeId]}');
					   			
						   	}
					   		else if(dropDownName=='#brand_2')
						   	{
					   			 
					   			jsonPopulateDropdownNew("${pageContext.request.contextPath}/common/codevalues?codeTypeId=Ownership", '', "#brand_"+${count.index}, "#brand_"+${count.index}, '${goalMap[attributeCodeId]}');
					   			
						   	}
					   		else if(dropDownName=='#brand_4')
						   	{
					   			 
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
							   	
						   	} 
					   		else if(dropDownName=='#brand_5')
						   	{
					   			 
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
							   	
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
			    				
			    				if(sliderVar=="#slider_7" || sliderVar=="#slider_8")
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
									id="text__${count.index}" name="text__${count.index}" value="${goalMap[attributeCodeId]}" />
							</x:if>
							<x:if select="$item/IsReadOnly = '0'">
								<input type="text"
									class="col-sm-12 col-xs-11 answers <c:if test='${count.index == 16 }'>Number1</c:if>"
									id="text__${count.index}" name="text__${count.index}" value="${goalMap[attributeCodeId]}"/>
							</x:if>
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
      <!-- Xml code ends  here -->
     <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
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
					class="btn btn-app btn-transparent btn-xs analysis " onclick="doValidate('buisnessGoalForm','${pageContext.request.contextPath}/analysis/business/${partyId}/${goalId}')">
					<i class="ace-icon fa fa-search bigger-200"></i> Analysis
				</button>
				<button
					class="btn btn-app btn-transparent btn-xs suggeset " onclick="doValidate('buisnessGoalForm','${pageContext.request.contextPath}/analysis/suggestion/business/${partyId}/${goalId}')">
					<i class="ace-icon fa fa-lightbulb-o bigger-200"></i> Suggestion
				</button>
				<button
					class="btn btn-app btn-transparent btn-xs action_plan " onclick="doValidate('buisnessGoalForm','${pageContext.request.contextPath}/actionplan/goal/business/${partyId}/${goalId}')">
					<i class="ace-icon fa fa-hand-o-up bigger-200"></i> Action Plan
				</button>
			</div>
			<div class="col-sm-3 col-xs-4">
				<button class="btn btn-app btn-transparent btn-xs " onclick="uploadNote(${goalId},${partyId},'/futureFinancialDc/edit-business-goal/${goalId}/${partyId}');">
					 <c:set var="docUrl" value="?partyId=${partyId}&url=/futureFinancialDc/edit-business-goal/${goalId}/${partyId}"/>
					<i class="ace-icon fa fa-file-code-o bigger-200"></i> Notes
				</button>
				<button
					class="btn btn-app btn-transparent btn-xs dcAddNewDocumentLink"
					onclick="doValidate('buisnessGoalForm','${pageContext.request.contextPath}/partner/addDocument${docUrl}');">
					<i class="ace-icon fa fa-newspaper-o bigger-200"></i> Doc
				</button>
			</div>
			<div class="col-sm-4 col-xs-4">
				<button
					class="btn btn-app btn-transparent btn-xs saveEditBusinessGoalLink save">
					<i class="ace-icon fa fa-save bigger-200"></i> Save
				</button>
				<button class="btn btn-app btn-transparent btn-xs"
					onclick="doValidate('buisnessGoalForm','${cancel}')">
					<i class="ace-icon fa fa-close bigger-200"></i> Cancel
				</button>
				<a
					href=""><button
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
</div>
</div>
</div>
<div class="overlay"></div>

<script>

$(".save").click(function() {
	var flag=false;
	createNewValueArray("buisnessGoalForm");
	
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
	$("#buisnessGoalForm").find(".answers").each(function (index) {			
		
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
	else if($('#buisnessGoalForm').validate().form()){
		
		$(".save").addClass("inactiveLink");
		$("#buisnessGoalForm").submit();
	}
	}
	else
	{
		dynamicMsg("You haven't changed any data yet.Please make some changes and then save.");
	}
});

$(document).ready(function(){
	
	$("#buisnessGoalForm").validate({
		ignore:'', //i.e. do not ignore hidden elements	
		rules:{text__6:{min:0.01,max:1000},sliderValue_9:{min:5,max:18},sliderValue_10:{min:1,max:10}}
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
	
	 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	 
    $('.common_in_content').slimScroll();	 

    $(".common_unit_selector li").click(function(){
		$(".common_unit_selector li").removeClass("unit_selected");
    	$(this).addClass("unit_selected");
  	});
    
    $("#text__6").change(function(ele){ 
    	var amt=$("#text__6").val();
    	var min= 0;
    	    	
    	$("#text__6").val(amt);
    	if(!isNaN(amt))
         {
    		$("#slider_7").slider("option", "max", parseFloat($("#text__6").val()));
    	    $("#slider_8").slider("option", "max", parseFloat($("#text__6").val()));
    	    $("#sliderMaxValue_7").html($("#text__6").val());
    	    $("#sliderMaxValue_8").html($("#text__6").val());
    	    
    	    $("#sliderValue_7").rules("add",{max:parseFloat($("#text__6").val()),min:0});
         }
    	$('#sliderValue_7').val(amt); 
	    $("#slider_7").slider("value", amt);
	    $('#sliderValue_8').val(min); 
	    $("#slider_8").slider("value", min);
    });
    
    // auto slider     
     $("#sliderValue_7").change(function(ele){
    	var amt=$("#text__6").val();
     	$("#text__6").val(amt);
     	var dp=$("#sliderValue_7").val();
     	$("#sliderValue_7").val(dp);
     	var loanReq = parseFloat(amt) - parseFloat(dp); 
     	loanReq = loanReq.toFixed(2);     	 
     	if(loanReq > 0){
     		$('#sliderValue_8').val(loanReq);    		
     	} else {
     		$('#sliderValue_8').val(0);
     	}
     });
     
     $( "#sliderValue_7" ).change(function() {
     	 $("#slider_7").slider("value", $( "#sliderValue_7" ).val());
    	 $("#slider_8").slider("value", $( "#sliderValue_8" ).val());
    	 
    	 if(parseFloat($("#sliderValue_7").val())==parseFloat($("#text__6").val()))
    	 {
    		 $("#slider_9").slider('disable'); 
   		  	 $("#sliderValue_9").attr('readonly', 'true');
   		     $("#sliderValue_9").val(0);
		     $("#sliderValue_9").rules("remove");
   		  	 
   			 $("#slider_10").slider('disable'); 
		  	 $("#sliderValue_10").attr('readonly', 'true');
		  	 $("#sliderValue_10").val(0);
		     $("#sliderValue_10").rules("remove");
   		 }
    	 else
    	 {
    		 $("#slider_9").slider('enable'); 
			 $("#sliderValue_9").removeAttr('readonly');
			 $("#sliderValue_9").val($("#slider_9").slider('value'));
		  	 $("#sliderValue_9").rules("add",{min:5,max:18});
   		  	 
   			 $("#slider_10").slider('enable'); 
			 $("#sliderValue_10").removeAttr('readonly');
			 $("#sliderValue_10").val($("#slider_10").slider('value'));
		  	 $("#sliderValue_10").rules("add",{min:1,max:10});
    	 }
    	 
    	 	 
     });
     
  // make loan amount slide and text fiels read only 
     $("#slider_8").slider('disable');
     $("#sliderValue_8").attr('readonly', 'true');
     
     // when dp slider changes loan amount will gets change
     $("#slider_7").slider({
 	change: function(event, ui) {
 		var amt=$("#text__6").val();
    	var dp=$("#sliderValue_7").val();
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = loanReq.toFixed(2);
    	if(loanReq > 0){
     		$('#sliderValue_8').val(loanReq);    	
     		 $("#slider_8").slider("value", $( "#sliderValue_8" ).val());
     	} else {
     		$('#sliderValue_8').val(0);
     		 $("#slider_8").slider("value", $( "#sliderValue_8" ).val());
     	}
     	
     	if(parseFloat($("#sliderValue_7").val())==parseFloat($("#text__6").val()))
   	    {
   		     $("#slider_9").slider('disable'); 
  		  	 $("#sliderValue_9").attr('readonly', 'true');
  		     $("#sliderValue_9").val(0);
		     $("#sliderValue_9").rules("remove");
  		  	 
  			 $("#slider_10").slider('disable'); 
		  	 $("#sliderValue_10").attr('readonly', 'true');
		  	 $("#sliderValue_10").val(0);
		     $("#sliderValue_10").rules("remove");
  		 }
	   	 else
	   	 {
	   		     $("#slider_9").slider('enable'); 
				 $("#sliderValue_9").removeAttr('readonly');
				 $("#sliderValue_9").val($("#slider_9").slider('value'));
			  	 $("#sliderValue_9").rules("add",{min:5,max:18});
	  		  	 
	  			 $("#slider_10").slider('enable'); 
				 $("#sliderValue_10").removeAttr('readonly');
				 $("#sliderValue_10").val($("#slider_10").slider('value'));
				 $("#sliderValue_10").rules("add",{min:1,max:10});
	   	 }
     	
 	} });
     
     // end of auto slider     
       // on load change value 
     var text6 = parseFloat( $("#sliderValue_7").val()) +  parseFloat($("#sliderValue_8").val());
   			$("#slider_7").slider("option", "max", parseFloat($("#text__6").val()));
    	     $("#slider_8").slider("option", "max", parseFloat($("#text__6").val()));
    	     $("#sliderMaxValue_7").html($("#text__6").val());
    	     $("#sliderMaxValue_8").html($("#text__6").val());
    	     
    	     $("#sliderValue_7").rules("add", {max:parseFloat($("#text__6").val()),min:0});
    	     
    	     if(parseFloat($("#sliderValue_7").val())==parseFloat($("#text__6").val()))
        	 {
        		 $("#slider_9").slider('disable'); 
       		  	 $("#sliderValue_9").attr('readonly', 'true');
       		     $("#sliderValue_9").val(0);
    		     $("#sliderValue_9").rules("remove");
       		  	 
       			 $("#slider_10").slider('disable'); 
    		  	 $("#sliderValue_10").attr('readonly', 'true');
    		  	 $("#sliderValue_10").val(0);
    		     $("#sliderValue_10").rules("remove");
       		 }
        	 else
        	 {
        		 $("#slider_9").slider('enable'); 
    			 $("#sliderValue_9").removeAttr('readonly');
    			 $("#sliderValue_9").val($("#slider_9").slider('value'));
    		  	 $("#sliderValue_9").rules("add",{min:5,max:18});
       		  	 
       			 $("#slider_10").slider('enable'); 
    			 $("#sliderValue_10").removeAttr('readonly');
    			 $("#sliderValue_10").val($("#slider_10").slider('value'));
    			 $("#sliderValue_10").rules("add",{min:1,max:10});
        	 }
     // end of auto slider
     
     $(window).bind("load", function() {
      	$( document ).ajaxComplete(function() {
      		createOldValueArray('buisnessGoalForm');
  	    	});
      }).trigger('load');
    
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