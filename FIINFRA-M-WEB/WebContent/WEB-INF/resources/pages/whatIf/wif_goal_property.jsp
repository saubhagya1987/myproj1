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
 
     <form class="form-horizontal" id="propertyGoalFormId" name="propertyGoalForm" action="<c:url value="/whatIf/savePropertyGoal" />" method="POST">
      <div class="page-content">
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="${goalName}" /> 
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="goalId" id="goalId" value="${goalId}" />
      <input type="hidden" id="stateIdHidden" value="2001">	  
      <input type="hidden" id="flag1" value="1">
      
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
					   							   		
					   		// for property type
					   		if(attrId==100014)
						   	{
					   			
					   			jsonPopulateDropdownNew("${pageContext.request.contextPath}/common/codevalues?codeTypeId=PropertyType", '', "#brand_"+${count.index}, "#brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	}
					   		else if(attrId==100019) // for state
						   	{
					   			
					   			jsonPopulateDropdownNew("${pageContext.request.contextPath}/common/codevalues?codeTypeId=StateID", '', "#brand_"+${count.index}, "#brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	} 
					   		else if(attrId == 100050)// for goal yesr
						   	{
					   			
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	}
					   		else if(attrId == 100051)// for goal month
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
				    				var sliderValue = 0;
				    				</c:when>
				    				<c:otherwise>
				    				var sliderValue =  ${goalMap[attributeCodeId]};
				    				</c:otherwise>
    							</c:choose>

			    							    				
			    				if(sliderVar=="#slider_8" || sliderVar=="#slider_9")
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
					
     		<x:when select="$item/@QuestionType = '85999'">
								<div class="form-group">
								<label class="col-sm-3 no-padding-right" for="auto__${count.index}"><x:out select="QuestionText" /></label>
									<div class="col-sm-7 col-xs-12">										
										<input type="text" class="col-sm-12 col-xs-11 answers"
											id="auto__${count.index}" name="auto__${count.index}" value="${goalMap[attributeCodeId]}" />
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

      <%-- <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="javascript:void(0);" onclick="doValidate('propertyGoalFormId','${pageContext.request.contextPath}/whatIf/graph/${partyId}')" class="anch cancel" style="margin-right: 260px;"><span class="txt">Cancel</span></a></li>
          </ul>
        </section> --%>

<section class="common_footer_actions">
	<div class="row">
	<div class="col-sm-1 col-xs-3"></div>
	<div class="col-sm-4 col-xs-4 "></div>
		<div class="col-sm-3 col-xs-4">
			<button class="btn btn-app btn-transparent btn-xs save ">
				<i class="ace-icon fa fa-save bigger-200"></i> Save
			</button>
		
		
			<button class="btn btn-app btn-transparent btn-xs cancel"
				onclick="doValidate('propertyGoalFormId','${pageContext.request.contextPath}/whatIf/graph/${partyId}')">
				<i class="ace-icon fa fa-close bigger-200"></i> Cancel
			</button>
		
		</div>
		</div>
</section>
</form>

<div class="overlay"></div>

<script>
$(".save").click(function() {		
	
	var flag=false;
	createNewValueArray("propertyGoalFormId");
	
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
		inputData = inputData + "100014:"+$("#brand_1").val()+ ",";
		inputData = inputData + "100015:"+$("#text__2").val()+ ",";
		inputData = inputData + "100016:"+$("#sliderValue_3").val()+ ",";
		inputData = inputData + "100051:"+$("#brand_4").val()+ ",";
		inputData = inputData + "100050:"+$("#brand_5").val()+ ",";
		if($("#text__6").val()!="")
		{
			inputData = inputData + "100017:"+$("#text__6").val()+ ",";
		}
		inputData = inputData + "100052:"+$("#text__7").val()+ ",";
		inputData = inputData + "100057:"+$("#sliderValue_8").val()+ ",";
		inputData = inputData + "100056:"+$("#sliderValue_9").val()+ ",";
		inputData = inputData + "100058:"+$("#sliderValue_10").val()+ ",";
		inputData = inputData + "100059:"+$("#sliderValue_11").val()+ ",";
		inputData = inputData + "100053:"+$("#sliderValue_12").val()+ ",";
		if($("#auto__14").val()!="")
		{
			inputData = inputData + "100019:"+$("#auto__14").val()+ ",";
		}
		if($("#auto__15").val()!="")
		{
			inputData = inputData + "100020:"+$("#auto__15").val()+ ",";
		}
		if($("#text__16").val()!="")
		{
			inputData = inputData + "100021:"+$("#text__16").val()+ ",";
		}
		
		inputData = inputData + "]";		
				
		$("#inputData").val(inputData);		
		$('#hiddenGoalName').val($('#goalName').val());
		if($('#hiddenGoalName').val()=="" || $('#hiddenGoalName').val()== null)
		{
			alertMessage();
			$("#goalName").focus();
		}
		else if($('#propertyGoalFormId').validate().form()){
			$(".save").addClass("inactiveLink");
			$("#propertyGoalFormId").submit();
			successMessage();
		}
	}else
	{
		dynamicMsg("You haven't changed any data yet.Please make some changes and then save.");
	}
		
	});

$(document).ready(function(){
	
	$("#text__6").removeClass("required");
	$("#text__16").removeClass("required");
	$("#brand_14").removeClass("required");
	$("#brand_15").removeClass("required");
	$("#text__2").addClass("area");
	
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
		  
		  jsonPopulateAutoCompleteForCarGoalNew("${pageContext.request.contextPath}/common/codevalues?codeTypeId=StateID", '', "#auto__14", "auto__14", '');
		  jsonPopulateAutoCompleteForCarGoalNew("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#stateIdHidden").val(), '{}', "#auto__15", "auto__15", '');
		 
		  $("#propertyGoalFormId").validate({
				
				ignore:'', //i.e. do not ignore hidden elements	
				rules:{text__7:{min:0.01,max:1000},sliderValue_10:{min:5,max:18},sliderValue_11:{min:1,max:20}}
			});
	
$('#goalName').val($('#hiddenGoalName').val());
$(//'.wrapper').attr('id', 'Global_Goal');	
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
  
    //$("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	
	 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	 
    $('.common_in_content').slimScroll();	 

    $(".common_unit_selector li").click(function(){
		$(".common_unit_selector li").removeClass("unit_selected");
    	$(this).addClass("unit_selected");
  	});
    
    $( ".answers" ).change(function() {
    	  
    	var propertyType = $("#brand_1").val();
    	if(propertyType>=106010)
    		{
    		  $("#slider_3").slider('disable'); 
    		  $("#sliderValue_3").attr('readonly', 'true');
    		  $("#sliderValue_3").val(0);
     		}
    	else
    		{
    		  $("#slider_3").slider('enable'); 
    		  $("#sliderValue_3").attr('readonly', 'false');
    		}
  	});
    
	$("#text__7").change(function(ele){     	    	
    	var amt=$("#text__7").val();
    	var min = 0;
    	$("#text__7").val(amt);
   	 if(!isNaN($("#text__7").val()))
        {
    $("#slider_8").slider("option", "max", parseFloat($("#text__7").val()));
    $("#slider_9").slider("option", "max", parseFloat($("#text__7").val()));
    $("#sliderMaxValue_8").html($("#text__7").val());
    $("#sliderMaxValue_9").html($("#text__7").val());
    
    $("#sliderValue_8").rules("add",{max:parseFloat($("#text__7").val()),min:0});
        }
   	 
     $('#sliderValue_8').val(amt); 
 	$("#slider_8").slider("value", amt);
 	  $('#sliderValue_9').val(min); 
 	 	$("#slider_9").slider("value", min);
    });
    
 // auto slider    
     $("#sliderValue_8").change(function(ele){
   	 var amt=$("#text__7").val();
     	$("#text__7").val(amt);
     	var dp=$("#sliderValue_8").val();
     	$("#sliderValue_8").val(dp);
     	var loanReq = parseFloat(amt) - parseFloat(dp);      
     	if(loanReq > 0){
     		$('#sliderValue_9').val(loanReq);
     		$("#slider_9").slider("value", $("#sliderValue_9").val());
     		
     	} else {
     		$('#sliderValue_9').val(0);
     		$("#slider_9").slider("value", $("#sliderValue_9").val());
     	}
     });
     
     $( "#sliderValue_8" ).change(function() {
     	 $("#slider_8").slider("value", $("#sliderValue_8").val());
    	 $("#slider_9").slider("value", $("#sliderValue_9").val());
    	 
    	 if(parseFloat($("#sliderValue_8").val())==parseFloat($("#text__7").val()))
    	 {
    		 $("#slider_10").slider('disable'); 
   		  	 $("#sliderValue_10").attr('readonly', 'true');
   		  	 $("#sliderValue_10").val(0);
   		     $("#sliderValue_10").rules("remove");
   		  
   			 $("#slider_11").slider('disable'); 
		  	 $("#sliderValue_11").attr('readonly', 'true');
		  	 $("#sliderValue_11").val(0);
		  	 $("#sliderValue_11").rules("remove");
   		 }
    	 else
    	 {
    		 $("#slider_10").slider('enable'); 
   		  	 $("#sliderValue_10").removeAttr('readonly');
   		  	 $("#sliderValue_10").val($("#slider_10").slider('value'));
		  	 $("#sliderValue_10").rules("add",{min:5,max:18});
   		  	 
   			 $("#slider_11").slider('enable'); 
		  	 $("#sliderValue_11").removeAttr('readonly');
		  	 $("#sliderValue_11").val($("#slider_11").slider('value'));
		  	 $("#sliderValue_11").rules("add",{min:1,max:20});
    	 }

    	 
     });     
     
     // make loan amount slide and text fiels read only 
     $("#slider_9").slider('disable');
     $("#sliderValue_9").attr('readonly', 'true');
     
     // down payment and loan slider setting  changes depending on expenses amount change     
    
     // when dp slider changes loan amount will gets change
     $("#slider_8").slider({
 	change: function(event, ui) {
 		
 		var amt=$("#text__7").val();    	
    	var dp=$("#sliderValue_8").val();    	
    	var loanReq = parseFloat(amt) - parseFloat(dp);     	
     	if(loanReq > 0){
     		$('#sliderValue_9').val(loanReq);  
     		$("#slider_9").slider("value", $( "#sliderValue_9" ).val());
     	} else {
     		$('#sliderValue_9').val(0);
     		$("#slider_9").slider("value", $( "#sliderValue_9" ).val());
     	}
     	
   	 if(parseFloat($("#sliderValue_8").val())==parseFloat($("#text__7").val()))
	 {
		 	 $("#slider_10").slider('disable'); 
		  	 $("#sliderValue_10").attr('readonly', 'true');
		  	 $("#sliderValue_10").val(0);
		     $("#sliderValue_10").rules("remove");
		  
			 $("#slider_11").slider('disable'); 
		  	 $("#sliderValue_11").attr('readonly', 'true');
		  	 $("#sliderValue_11").val(0);
		  	 $("#sliderValue_11").rules("remove");
		 }
	 else
	 {
			 $("#slider_10").slider('enable'); 
			 $("#sliderValue_10").removeAttr('readonly');
			 $("#sliderValue_10").val($("#slider_10").slider('value'));
		  	 $("#sliderValue_10").rules("add",{min:5,max:18});
			  	 
			 $("#slider_11").slider('enable'); 
		  	 $("#sliderValue_11").removeAttr('readonly');
		  	 $("#sliderValue_11").val($("#slider_11").slider('value'));
			 $("#sliderValue_11").rules("add",{min:1,max:20});
	 }
     	
 	} });
     
     
     // on load change html
     		 $("#slider_8").slider("option", "max", parseFloat($("#text__7").val()));
    	     $("#slider_9").slider("option", "max", parseFloat($("#text__7").val()));
    	     $("#sliderMaxValue_8").html($("#text__7").val());
    	     $("#sliderMaxValue_9").html($("#text__7").val());
    	     $("#sliderValue_8").rules("add",{max:parseFloat($("#text__7").val()),min:0});
    	     
        	 if(parseFloat($("#sliderValue_8").val())==parseFloat($("#text__7").val()))
        	 {
        		 $("#slider_10").slider('disable'); 
       		  	 $("#sliderValue_10").attr('readonly', 'true');
       		  	 $("#sliderValue_10").val(0);
       		     $("#sliderValue_10").rules("remove");
       		  
       			 $("#slider_11").slider('disable'); 
    		  	 $("#sliderValue_11").attr('readonly', 'true');
    		  	 $("#sliderValue_11").val(0);
    		  	 $("#sliderValue_11").rules("remove");
       		 }
        	 else
        	 {
        		 $("#slider_10").slider('enable'); 
       		  	 $("#sliderValue_10").removeAttr('readonly');
       		  	 $("#sliderValue_10").val($("#slider_10").slider('value'));
    		  	 $("#sliderValue_10").rules("add",{min:5,max:18});
       		  	 
       			 $("#slider_11").slider('enable'); 
    		  	 $("#sliderValue_11").removeAttr('readonly');
    		  	 $("#sliderValue_11").val($("#slider_11").slider('value'));
    		  	$("#sliderValue_11").rules("add",{min:1,max:20});
        	 }

        	 if($("#hiddenGoalName").val()=="" || $("#hiddenGoalName").val()==null){
        	    	
        	    	$("#goalName").val("Property Goal");
        	    	$("#hiddenGoalName").val("Property Goal");
        	    	
        	    	$("#slider_10").slider("value",10);
        	        $("#sliderValue_10").val(10);
        	        
        	        $("#slider_11").slider("value",5);
        	        $("#sliderValue_11").val(5);
        	        
        	        $("#sliderValue_12").val(${inflationrate});
        	    	$("#slider_12").slider("value",$("#sliderValue_12").val());
        	    	
        	    	var amt=$("#text__7").val();
        	    	$("#text__7").val(amt);        	    	
        	    	var dp=$("#sliderValue_8").val();
        	    	$("#sliderValue_8").val(dp);
        	    	var loanReq = parseFloat(amt) - parseFloat(dp);         	    	
        	 	if(loanReq > 0){
        	 		$('#sliderValue_8').val(loanReq); 
        	 		$("#slider_8").slider("value",$('#sliderValue_8').val());
        	 		
        	 	} else {
        	 		$('#sliderValue_8').val(0);
        	 		$("#slider_8").slider("value",$('#sliderValue_8').val());
        	 	}
        	 	$("#slider_9").slider("value", $( "#sliderValue_9" ).val());
        	 } 
     // end of auto slider
     
      $(window).bind("load", function() {
        	       	$( document ).ajaxComplete(function() {
        	       		createOldValueArray('propertyGoalFormId');
        	   	    	});
        	       }).trigger('load');
        	    
       	});


//Populating City on change of Course State drop down
$("#auto__14").bind({
	"change": function(){
		jsonPopulateAutoCompleteForCarGoalNew("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#stateIdHidden").val(), '{}', "#auto__15", "auto__15", '');
		if($("#flag1").val() != 0) {			
			 $("#flag1").val(0);
		}
	    else {
	    	$("#auto__15").val('');			
	    }		
	},
}).trigger('change');


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