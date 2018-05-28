<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css">
#Global_Goal .scale_range .extrem{
top: 29px;
font-size: 12px;
}

#Global_Goal .scale .unit {
right: -76px;
bottom: 9px;
}


#Global_Goal .second_col .scale .counter_parent {
top: 33px;
right: 64px;
}

#Global_Goal .scale_range .extrem {
top: -27px;
font-size: 12px;
}

#Global_Goal .first_col .first_col_ul > li, #Global_Goal .second_col .second_col_ul > li {
margin: 0 0 19px 0;
}

#Global_Goal .range_counter {
font-size: 30px;
margin: -22px 9px 0px 0px;
float: right;
}

#Global_Goal .first_col .first_col_ul > li, #Global_Goal .second_col .second_col_ul > li {
margin: 0 0 26px 0;
min-height: 40px;
}

.spinner_T_V {
float: left;
height: 20px !important; 
width: 105px;
}

</style>


<!-- Wrapper starts-->
<div id="Global_Goal"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Common_content Starts-->
    <div class="priority_bx">
      <div class="priority_bx_icon fl"></div>
      <div class="priority_bx_txt_bx fl">
        <div class="priority_no">${goalsByOther}</div>
        <div class="priority_no_txt">people having similar goal.</div>
      </div>
    </div>
    <section class="content common_content"> 
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> 
    <section class="common_unit_selector"><ul class="clearfix reset"><li class="k"><span class="unit">K</span></li><li class="lacs unit_selected"><span class="unit">Lacs</span></li><li class="cr"><span class="unit">Cr</span></li></ul><p>All figures are in :</p></section>
      <div class="clr"></div>
      
      <!-- Xml code starts here -->
      
     <form class="form-horizontal" id="travelVacationPlanId" name="travelVacationPlan" action="<c:url value="/futureFinancialDc/save-travel-vacation-goal" />" method="POST" onsubmit="return validateGoalName()">
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="" /> 
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="hiddenStateId" id="hiddenStateId" value="0" />
      
      <c:set var="attributeCount" value="${0}"></c:set>	
      
      <section id="education_goal" class="in_content common_in_content clearfix education_goal" >
      
      	<input id="contactPartyId" name="contactPartyId" type="hidden" value="${partyId}">
      	<x:parse xml="${sectionData}" var="output" />
      		<c:set var="currentColumnCount" value="${1}"></c:set>	
      		
      		
      		<x:forEach select="$output/Section/Question" var="item" varStatus="count">
        			<c:set var="questionType"><x:out select="$item/@QuestionType" escapeXml="false"/></c:set>
        			
        			<c:if test="${questionType != '85012' && questionType != '85013'}">
		      			 <input type="hidden" name="attributeCodeId_<c:out value="${attributeCount}"/>" id="attributeCodeId_<c:out value="${attributeCount}"/>" value="<x:out select="$item/@AttributeCodeId" />" />
		      			 <c:set var="attributeCount" value="${attributeCount+1}"></c:set>        			
        			</c:if>
      			<x:choose>


	      				      		
	      			<x:when select="$item/@QuestionType = '85012'">
	      				<div class="row_one">  <div class="title-bg"> <div class="title"><x:out select="QuestionText" /></div></div> 	      				
	      					
				        <div class="fl first_col">
				         <ul class="reset clearfix first_col_ul">					        				       			         
				         
				         <c:set var="column1RowCount"><x:out select="$item/RowsForColumn1" escapeXml="false"/></c:set>
				         <c:set var="column2RowCount"><x:out select="$item/RowsForColumn2" escapeXml="false"/></c:set>  
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
					   		$(dropDownName).addClass("required");					   		
					   		 if(dropDownName=='#brand_1')
						   	{
					   			$("select").selectBoxIt();
					   			jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=TourType", '', "#brand_"+${count.index}, "#brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	}
					   		else if(dropDownName=='#brand_5')
						   	{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	} 
					   		else if(dropDownName=='#brand_6')
						   	{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	} 
					   						   							   
			           </script>
					
					</x:when>	
					
					<x:when select="$item/@QuestionType = '85005'">
			            <li class="clearfix rel">
			              <label class="form_label" id="edu_exp"><x:out select="QuestionText" /> </label>			                
			              <div class="input_counter_parent">
			                <input type="text" name="text__${count.index}" class="input_counter answers required Number1" value="00" id="text__${count.index}" >
			                <span class="unit dynamic">lacs</span> </div>
			            </li>	
			       </x:when>		
			       
			       <x:when select="$item/@QuestionType = '85009'">
			            <li class="clearfix rel">
			              <label class="form_label"><x:out select="QuestionText" /></label>
			              <div class="range_parent">
			                 <div class="scale clearfix"><div class="scale_range">
			                 	<span id="sliderMINValue_${count.index}" class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> 
			                 	<span id="sliderMaxValue_${count.index}" class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
			                 </div> 
			                 <div id="slider_${count.index}">     	
			                 </div>
			                
			                
			                 <x:if select="$item/Scale/IsCurrency != '0'">
			                 	<div class="counter_parent rupee">
			                 </x:if>
			                 <x:if select="$item/Scale/IsCurrency = '0'">
			                 	<div class="counter_parent">
			                 </x:if>			                 			                 
			                 
			                 	              	
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
			    			<input type="text" id="sliderValue_${count.index}" name="sliderValue_${count.index}" class="range_counter answers required 
							<c:choose> <c:when test='${count.index == 8 }'>Number1</c:when><c:when test='${count.index != 8 }'>Number</c:when></c:choose>"/>
			    			<script type="text/javascript">
			    				var sliderVar = "#slider_"+${count.index};
			    				var sliderValueVar = "#sliderValue_"+${count.index};
			    				createSlider(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />,sliderValueVar);
			    			</script>
			    			
			    			</div></div>
			            </li>
			       </x:when>	
			       
			       
			       <x:when select="$item/@QuestionType = '85013'">		
			       
		            <li class="clearfix">
		              <label class="form_label"><x:out select="QuestionText" /></label>
		              
		              <img src="${pageContext.request.contextPath}/resources/images/star-rating.png" alt="" width="96" height="27" hspace="10" align="absmiddle"> 
            		</li>			       
			       </x:when>       	
			       
			        <x:when select="$item/@QuestionType = '85014'">	
			            <li class="clearfix">
			              <label class="form_label"><x:out select="QuestionText" /> </label>
			              <div>
			              			              	
			              	<x:if select="$item/IsReadOnly = '1'">
			                	<input type="text" disabled class="fixed_txt_box answers required digits" id="text__${count.index}" name="text__${count.index}" value="Sydney University" />
			                </x:if>
			                <x:if select="$item/IsReadOnly = '0'">
			                	<input type="text" class="common_input2 answers required digits" id="text__${count.index}" name="text__${count.index}" />
			                </x:if>
			              </div>                 
			            </li>	
			        </x:when>	
			        
					<x:when select="$item/@QuestionType = '85016'">
		              <li class="list_space clearfix">
		                <label class="form_label"><x:out select="QuestionText" /></label>
		                <div class="spinner_T_V">
		                  <div class="value-spinner">
		                    <input id="spinner_${count.index}" name="spinner_${count.index}" value="0" class="spinner answers required Number">
		                  </div>
		                 </div>
		               </li>
					   <script type="text/javascript">
					  	 var sliderVar = "#spinner_"+${count.index};
					  	 $( sliderVar ).spinner({ min: <x:out select="$item/Min_Value" />,max: <x:out select="$item/Max_Value" />});
					   </script>
					</x:when>  			        
     				<x:when select="$item/@QuestionType = '85999'">
								<li class="clearfix rel">
									<div>
										<label class="form_label"><x:out select="QuestionText" /></label>
										<input type="text" class="common_input2 answers"
											id="autoCity__${count.index}" name="autoCity__${count.index}"  value=""/>
									</div>
								</li>
						<script type="text/javascript">			           
					   		var dropDownName = "#autoCity_"+${count.index};
					   		$(dropDownName).addClass("answers");					   							   						   	
						</script>
					</x:when>
	      		
	      		</x:choose>
	      		
				<c:set var="currentRowCount" value="${currentRowCount+1}"></c:set>
				
				<c:if test="${currentColumnCount == 1}">
					<c:if test="${column1RowCount == currentRowCount}">
						<c:set var="currentColumnCount" value="${2}"></c:set>	
						<c:set var="currentRowCount" value="${0}"></c:set>
											
						</ul>
					</div>      
					
					<div class="fr second_col">
          				<ul class="reset clearfix second_col_ul">							
					</c:if>
				</c:if>
				
				<c:if test="${currentColumnCount == 2}">
					<c:if test="${column2RowCount == currentRowCount}">		
						<c:set var="currentColumnCount" value="${1}"></c:set>
						
								</ul>
								</div>
							<div class="clearfix"> </div>					
						</div>					      							
					</c:if>
				</c:if>				
      		</x:forEach>   
      	   	
      </section>
      <!-- Xml code ends  here -->
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
          	<li class="fl list"><a href="javascript:void()" class="anch cancel" onclick="doValidate('travelVacationPlanId','${pageContext.request.contextPath}/partner/datacollection')"><span class="txt">Cancel</span></a></li>
        	
          </ul>
       
        </div>
        <a href="javascript:void(0);" class="back navgation" onclick="doValidate('travelVacationPlanId','${pageContext.request.contextPath}/futureFinancialDc/car-goal')"><span class="txt">Back</span></a>
		<a href="javascript:void(0);" class="next navgation" onclick="doValidate('travelVacationPlanId','${pageContext.request.contextPath}/futureFinancialDc/business-goal')"><span class="txt">Next</span></a> 
       </section>
</form>      
      <!-- Common footer ends --> 
    
        </section>
    <!-- Common_content Ends-->
     
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<div class="overlay"></div>
<script>


function validateGoalName() {
	var goalName = $('#hiddenGoalName').val();
	if(goalName == "" || goalName == null) {
		alert("<spring:message code='alert.Goal.enterName' />");
		return false;
	}
}
	$(".save").click(function() {	
		
		var flag=false;
		createNewValueArray("travelVacationPlanId");
		
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
		
		/*var cnt=0;
		var inputData="[";
		$("#travelVacationPlanId").find(".answers").each(function (index) {			
			
			if($(this).val() != ''){
				var attributeCodeIdVar = '#attributeCodeId_'+ cnt;
				var attributeCodeIdValue = $(attributeCodeIdVar).val();										
				inputData = inputData + attributeCodeIdValue + ":"; // clear no change require
				inputData = inputData + $(this).val() + ",";				
				cnt++;
			}
		});	
		
		inputData = inputData + "]";*/
		
		/*var cnt=0;
		var inputData="[";
		var firstEntryType = "";
		$("#travelVacationPlanId").find(".answers").each(function (index) {
			var controller = $(this).attr('name');
			
			if(typeof controller != 'undefined')
			{
				if(controller.slice(0,5)=='brand')
				{
					if(firstEntryType=='N')
					{
						cnt++;
						firstEntryType="";
					}
					else if(firstEntryType=='V')
					{
						firstEntryType="";
					}
					else
					{
					if($(this).val() != '' && $(this).val() != null )
						{ firstEntryType='V';}
						else { firstEntryType='N';}
					}
				
			 	}
				else { firstEntryType=""; }
			}	
			if($(this).val() != '' && $(this).val() != null ){
				
				var attributeCodeIdVar = '#attributeCodeId_'+ cnt;
				var attributeCodeIdValue = $(attributeCodeIdVar).val();										
				inputData = inputData + attributeCodeIdValue + ":"; // clear no change require
				inputData = inputData + $(this).val() + ",";				
				cnt++;
			}
			else
				{
				if(controller.slice(0,5)=='brand'){
					  
				 }else{
					    var attributeCodeIdVar = '#attributeCodeId_'+ cnt;
						var attributeCodeIdValue = $(attributeCodeIdVar).val();										
						inputData = inputData + attributeCodeIdValue + ":"; // clear no change require
						$(this).val('NA');
						inputData = inputData + $(this).val() + ",";				
						cnt++; 
				  }				  
				}
		});	
		
		inputData = inputData + "]";
		*/
		
		var inputData="[";
		inputData = inputData + "100024:"+$("#brand_1").val()+ ",";
		inputData = inputData + "100026:"+$("#spinner_2").val()+ ",";
		inputData = inputData + "100027:"+$("#spinner_3").val()+ ",";
		if($("#autoCity__4").val()!="")
		{
			inputData = inputData + "100028:"+$("#autoCity__4").val()+ ",";
		}
		inputData = inputData + "100051:"+$("#brand_5").val()+ ",";
		inputData = inputData + "100050:"+$("#brand_6").val()+ ",";
		inputData = inputData + "100029:"+$("#spinner_7").val()+ ",";
		inputData = inputData + "100052:"+$("#text__8").val()+ ",";
		inputData = inputData + "100057:"+$("#sliderValue_9").val()+ ",";
		inputData = inputData + "100056:"+$("#sliderValue_10").val()+ ",";
		inputData = inputData + "100058:"+$("#sliderValue_11").val()+ ",";
		inputData = inputData + "100059:"+$("#sliderValue_12").val()+ ",";
		inputData = inputData + "100053:"+$("#sliderValue_13").val();
		
		inputData = inputData + "]";
		
		$("#inputData").val(inputData);		
		$('#hiddenGoalName').val($('#goalName').val());
		
		if($('#hiddenGoalName').val()=="" || $('#hiddenGoalName').val()== null)
		{
			alertMessage();
			$("#goalName").focus();
		}
		else if($('#travelVacationPlanId').validate().form()){
			
			$(".save").addClass("inactiveLink");
			$("#travelVacationPlanId").submit();
			}	
		}else
		{
			dynamicMsg("You haven't changed any data yet.Please make some changes and then save.");
		}	
	});

$(document).ready(function(){
	
	$("#goalName").val("Travel Goal");
	$("#hiddenGoalName").val("Travel Goal");
	
	$("#sliderValue_13").val(${inflationrate});
	$("#slider_13").slider("value",$("#sliderValue_13").val());
	
	jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CountryForGoal", '', "#autoCity__4", "autoCity__4", '');

	$("#autoCity__4").removeClass("required");		
	$("#travelVacationPlanId").validate({
			ignore:'', //i.e. do not ignore hidden elements	
			rules:{	text__8:{min:0.01,max:1000},sliderValue_11:{min:5,max:18},sliderValue_12:{min:1,max:40},spinner_7:{min:0,max:60}}
			 
		});
	
$('.wrapper').attr('id', 'Global_Goal');
$('.wrapper').addClass('traval_vacation_wrapper');	
$('.scale.clearfix').addClass('rel');	
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
	
	 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	 
    $('.common_in_content').slimScroll();	 

    $(".common_unit_selector li").click(function(){
		$(".common_unit_selector li").removeClass("unit_selected");
    	$(this).addClass("unit_selected");
  	});
    
    
    $("#text__8").change(function(ele){ 
    	//var amt = Math.round($("#text__8").val() * 10) / 10;
    	var amt=$("#text__8").val();
    	var min= 0;
    	$("#text__8").val(amt);
    	if(!isNaN(amt))
         {
    		$("#slider_9").slider("option", "max", parseFloat($("#text__8").val()));
    	    $("#slider_10").slider("option", "max", parseFloat($("#text__8").val()));
    	    $("#sliderMaxValue_9").html($("#text__8").val());
    	    $("#sliderMaxValue_10").html($("#text__8").val());
    	    
    	    $("#sliderValue_9").rules("add",{max:parseFloat($("#text__8").val()),min:0});
         }
    	$('#sliderValue_9').val(amt); 
	    $("#slider_9").slider("value", amt);
	    $('#sliderValue_10').val(min); 
	    $("#slider_10").slider("value", min);
    });
    
 // auto slider
   /*  $("#text__8").change(function(ele){   
    	
    	var amt = Math.round($("#text__8").val() * 10) / 10;
    	$("#text__8").val(amt);
    	var dp =  Math.round($("#sliderValue_9").val() * 10) / 10;
    	$("#sliderValue_9").val(dp);
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = Math.round(loanReq * 10) / 10;
    	
     	//var loanReq = parseInt($("#text__8").val()) - parseInt($("#sliderValue_8").val()); 
     	
     	if(loanReq > 0){
     		$('#sliderValue_10').val(loanReq); 
     		
     	} else {
     		$('#sliderValue_10').val(0);
     	}
     }); */
     
     $("#sliderValue_9").change(function(ele){
    	 
    	//var amt = Math.round($("#text__8").val() * 10) / 10;
    	var amt=$("#text__8").val();
     	$("#text__8").val(amt);
     	//var dp =  Math.round($("#sliderValue_9").val() * 10) / 10;
     	var dp=$("#sliderValue_9").val();
     	$("#sliderValue_9").val(dp);
     	var loanReq = parseFloat(amt) - parseFloat(dp); 
     	loanReq = loanReq.toFixed(2);
     	//loanReq = Math.round(loanReq * 10) / 10; 
     	//var loanReq = parseInt($("#text__8").val()) - parseInt($("#sliderValue_8").val()); 
     	if(loanReq > 0){
     		$('#sliderValue_10').val(loanReq);    		
     	} else {
     		$('#sliderValue_10').val(0);
     	}
     });
     
     $( "#sliderValue_9" ).change(function() {
     	 $("#slider_9").slider("value", $( "#sliderValue_9" ).val());
    	 $("#slider_10").slider("value", $( "#sliderValue_10" ).val());
    	 
    	 if(parseFloat($("#sliderValue_9").val())==parseFloat($("#text__8").val()))
    	 {
    		 $("#slider_11").slider('disable'); 
   		  	 $("#sliderValue_11").attr('readonly', 'true');
   		  	 $("#sliderValue_11").val(0);
		     $("#sliderValue_11").rules("remove");
		     
   			 $("#slider_12").slider('disable'); 
		  	 $("#sliderValue_12").attr('readonly', 'true');
		  	 $("#sliderValue_12").val(0);
		     $("#sliderValue_12").rules("remove");
   		 }
    	 else
    	 {
    		 $("#slider_11").slider('enable'); 
    		 $("#sliderValue_11").removeAttr('readonly');
			 $("#sliderValue_11").val($("#slider_11").slider('value'));
		  	 $("#sliderValue_11").rules("add",{min:5,max:18});
   		  	 
   			 $("#slider_12").slider('enable'); 
   			 $("#sliderValue_12").removeAttr('readonly');
			 $("#sliderValue_12").val($("#slider_12").slider('value'));
		  	 $("#sliderValue_12").rules("add",{min:1,max:10});
    	 }
    	 
     });
     /* $( "#text__8" ).change(function() {
         $("#slider_9").slider("value", $( "#sliderValue_9" ).val());
       	 $("#slider_10").slider("value", $( "#sliderValue_10" ).val());
      }); */
     
     // make loan amount slide and text fiels read only 
     $("#slider_10").slider('disable');
     $("#sliderValue_10").attr('readonly', 'true');
     
     // down payment and loan slider setting  changes depending on expenses amount change
    /*  $("#text__8").change(function(ele){ 
     if(!isNaN($("#text__8").val()))
      {
	     $("#slider_9").slider("option", "max", parseFloat($("#text__8").val()));
	     $("#slider_10").slider("option", "max", parseFloat($("#text__8").val()));
	     $("#sliderMaxValue_9").html($("#text__8").val());
	     $("#sliderMaxValue_10").html($("#text__8").val());
	     
	     $("#sliderValue_9").rules("add", {max:parseFloat($("#text__8").val()),min:0});
      }
     }); */
     // end //
     
     // when dp slider changes loan amount will gets change
     $("#slider_9").slider({
 		change: function(event, ui) {
 			//var amt = Math.round($("#text__8").val() * 10) / 10;
 			var amt=$("#text__8").val();
 	     	//$("#text__8").val(amt);
 	     	//var dp =  Math.round($("#sliderValue_9").val() * 10) / 10;
 	     	var dp=$("#sliderValue_9").val();
 	     	//$("#sliderValue_8").val(dp);
 	     	var loanReq = parseFloat(amt) - parseFloat(dp); 
 	     	loanReq = loanReq.toFixed(2);
 	     	//loanReq = Math.round(loanReq * 10) / 10; 		
 		//var loanReq = parseInt($("#text__8").val()) - parseInt($("#sliderValue_8").val()); 
     	if(loanReq > 0){
     		$('#sliderValue_10').val(loanReq); 
     		 $("#slider_10").slider("value", $( "#sliderValue_10" ).val());
     	} else {
     		$('#sliderValue_10').val(0);
     		 $("#slider_10").slider("value", $( "#sliderValue_10" ).val());
     	}
     	
      	 if(parseFloat($("#sliderValue_9").val())==parseFloat($("#text__8").val()))
    	 {
    		 $("#slider_11").slider('disable'); 
   		  	 $("#sliderValue_11").attr('readonly', 'true');
   		  	 $("#sliderValue_11").val(0);
		     $("#sliderValue_11").rules("remove");
		     
   			 $("#slider_12").slider('disable'); 
		  	 $("#sliderValue_12").attr('readonly', 'true');
		  	 $("#sliderValue_12").val(0);
		     $("#sliderValue_12").rules("remove");
   		 }
    	 else
    	 {
    		 $("#slider_11").slider('enable'); 
    		 $("#sliderValue_11").removeAttr('readonly');
			 $("#sliderValue_11").val($("#slider_11").slider('value'));
		  	 $("#sliderValue_11").rules("add",{min:5,max:18});
   		  	 
   			 $("#slider_12").slider('enable'); 
   			 $("#sliderValue_12").removeAttr('readonly');
			 $("#sliderValue_12").val($("#slider_12").slider('value'));
		  	 $("#sliderValue_12").rules("add",{min:1,max:10});
    	 }

     	
 	} });
 
     
     // end of auto slider
     
    $(window).bind("load", function() {
     	$( document ).ajaxComplete(function() {
     		createOldValueArray('travelVacationPlanId');
 	    	});
     }).trigger('load');
    
});

//Down Payment value Slider
createSlider('#down_payment',0,100,1,"#d_payment");
//Loan Amount value Slider
createSlider('#loan_amount',0,100,1,"#l_amount");
//Loan Interest value Slider
createSlider('#loan_interset',5,18,1,"#l_interset");
//Loan Duration value Slider
createSlider('#other_loan_duration',1,12,1,"#other_l_duration");

$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-mm-yy",
      showOn: "button",
	  buttonText: '',
     });
  });
  
</script>