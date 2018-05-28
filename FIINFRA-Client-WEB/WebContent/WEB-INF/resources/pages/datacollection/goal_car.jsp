<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style> 
<!-- Wrapper starts-->
<div id="purchase_car"> 
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
     <div id="page_loader"></div>
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> 
    <section class="common_unit_selector"><ul class="clearfix reset"><li class="k"><span class="unit">K</span></li><li class="lacs unit_selected"><span class="unit">Lacs</span></li><li class="cr"><span class="unit">Cr</span></li></ul><p>All figures are in :</p></section>
      <div class="clr"></div>
      
      <!-- Xml code starts here -->
      
     <form class="form-horizontal" id="frmCarGoal" name="frmEductionGoal" action="<c:url value="/futureFinancialDc/saveCarGoal" />" method="POST" >
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="" />
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      
      <input type="hidden" id="brandIdHidden" value="0">
	  <input type="hidden" id="categoryIdHidden" value="0">
	  <input type="hidden" id="modelIdHidden" value="0">
	  <input type="hidden" id="variantIdHidden" value="0">	  
      
      
      <c:set var="attributeCount" value="${0}"></c:set>	
      
      <section id="education_goal" class="in_content common_in_content clearfix education_goal" >
      
      	<input id="contactPartyId" name="contactPartyId" type="hidden" value="${partyId}">
      	<x:parse xml="${sectionData}" var="output" />
      		<c:set var="currentColumnCount" value="${1}"></c:set>	
      		
      		
      		<x:forEach select="$output/Section/Question" var="item" varStatus="count">
        			<c:set var="questionType"><x:out select="$item/@QuestionType" escapeXml="false"/></c:set>
        			
        			<c:if test="${questionType != '85012'}">
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
			            <li class="clearfix">
			            <input type="hidden" name="parentId" id="parentId" value="0" />
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
					   		
					   		//  for car_brand
					   		/* if(attrId == 100039)
						   	{
					   			$("select").selectBoxIt();
					   			jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CarBrand", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
					 	   	}	 */				   							   				
					   		 if(attrId == 100050)// for expected_year_of_purchase
					   		{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   		}
					   		else if(attrId == 100051)// for expected_year_of_purchase
					   		{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   		}
			           </script>
			            
					</x:when>	
					
					<x:when select="$item/@QuestionType = '85005'">
			            <li class="clearfix">
			              <label class="form_label" id="edu_exp"><x:out select="QuestionText" /> </label>			                
			              <div class="input_counter_parent">
			                <input type="text" name="text__${count.index}" class="input_counter answers required Number1" value="00" id="text__${count.index}" >
			                <span class="unit dynamic">lacs</span> </div>
			            </li>	
			       </x:when>	
			       	
			       <x:when select="$item/@QuestionType = '85999'">
								<li class="clearfix rel">
									<div>
										<label class="form_label"><x:out select="QuestionText" /></label>
										<input type="text" class="common_input2 answers"
											id="auto__${count.index}" name="auto__${count.index}" />
									</div>
								</li>
					</x:when>
					
			       <x:when select="$item/@QuestionType = '85009'">
			            <li class="clearfix">
			              <label class="form_label"><x:out select="QuestionText" /></label>
			              
			              <x:if select="$item/@AttributeCodeId = '100032'">
			              	<div class="range_parent_left">
			              </x:if>
			              <x:if select="$item/@AttributeCodeId != '100032'">
			              	<div class="range_parent">
			              </x:if>		
			              	              
			                 <div class="scale clearfix"><div class="scale_range">
			                 	<span  id="sliderMinValue_${count.index}" class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> 
			                 	<span id="sliderMaxValue_${count.index}" class="high extrem"><x:out select="$item/Scale/Max_Value" /></span>
			                 </div> 
			                 <div id="slider_${count.index}"></div>
			                 
			                 <x:if select="$item/Scale/IsCurrency != '0'">
			                 	<div class="counter_parent rupee">
			                 </x:if>
			                 <x:if select="$item/Scale/IsCurrency = '0'">
			                 	<div class="counter_parent">
			                 </x:if>			                 			                 
			                 
			                <input type="text" id="sliderValue_${count.index}" name="sliderValue_${count.index}" class="range_counter answers required 
							<c:choose> <c:when test='${count.index == 10 }'>Number1</c:when><c:when test='${count.index != 10 }'>Number</c:when></c:choose>"/>
			               	
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
			    					
			    				if(sliderVar == '#slider_13') {
			    					createSliderAndSetValue(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />,sliderValueVar,"12");			    
			    				}
			    				else if(sliderVar == '#slider_14') {
			    					createSliderAndSetValue(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />,sliderValueVar,"5");
			    				}
			    				else {
			    				createSlider(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />,sliderValueVar);
			    				}
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
			                	<input type="text" disabled class="fixed_txt_box answers required" id="text__${count.index}" name="text__${count.index}" value="Sydney University" />
			                </x:if>
			                <x:if select="$item/IsReadOnly = '0'">
			                	<input type="text" class="common_input2 answers required" id="text__${count.index}" name="text__${count.index}" />
			                </x:if>
			              </div>                 
			            </li>	
			        </x:when>	
     			
					<x:when select="$item/@QuestionType = '85002'">
						<li class="clearfix">
							<label class="form_label"><x:out select="QuestionText" /> </label>
							<div class="toggle" id="car_type"></div>
							<input type="checkbox" id="car_type" name="car_type" value="checked" class="car_type orignal_checkbox"/>
							<div class="clearfix"></div>
							<input type="hidden" id="textForToggle" class="answers" value="New" />
						</li>
						
						<script>
						$('.toggle').toggles({text:{on:'NEW',off:'OLD'}});
						$("#car_type").trigger('click');
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
						</script>
					
					</x:when>  
					
					<x:when select="$item/@QuestionType = '85015'">
						<input type="hidden" class="answers" id="fuelTypeSelected" name="fuelTypeSelected" value="-1" />				
			            <li class="clearfix">
			              <label class="form_label"><x:out select="QuestionText" /></label>
			              <ul class="reset clearfix fuel_type_ul thumb_select_ul">
			              <x:forEach select="$item/Options/Option" var="optionElement">
			              	
			              	<li class="fl"><a href="#">
			              	<div class="categoery <x:out select="$optionElement/@Css"/>">
			              		<div class="thumb"></div>
			              	</div>
			              		<label class="label" id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$optionElement/@AttributeCodeID" />"><x:out select="$optionElement" /></label>			              					              								  
			              		</a>
			              	</li>
			              			              
			              </x:forEach>
			              </ul>			              
			            </li>					
					
						<script>
							$(".thumb_select_ul a").click(function(){
								$(".thumb_select_ul a").children(".categoery").removeClass("not_applicable");
							    $(this).children(".categoery").addClass("not_applicable");								    	
							    var labelName =$(this).find(".label").attr('name');
							    var fuelTypeSelectedVar = "#fuelTypeSelected";
							    $(fuelTypeSelectedVar).val(labelName);
						  	});
						  
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
            <li class="fl list"><a href="javascript:void()" class="anch cancel" onclick="doValidate('frmCarGoal','${pageContext.request.contextPath}/partner/datacollection')"><span class="txt">Cancel</span></a></li>
          
          </ul>
          
        </div>
        <a href="javascript:void(0);" class="back navgation" onclick="doValidate('frmCarGoal','${pageContext.request.contextPath}/futureFinancialDc/wedding-goal')"><span class="txt">Back</span></a>
		<a href="javascript:void(0);" class="next navgation" onclick="doValidate('frmCarGoal','${pageContext.request.contextPath}/futureFinancialDc/travel-vacation-goal')"><span class="txt">Next</span></a> 
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
			jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CarBrand", '{}', "#auto__4", "auto__4", '${goalMap[attributeCodeId]}');
		});	
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
		
		/*var cnt=0;
		var inputData="[";
		var firstEntryType = "";
		$("#frmCarGoal").find(".answers").each(function (index) {
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
	
	$("#goalName").val("Car Goal");
	$("#hiddenGoalName").val("Car Goal");
	$("#brand_4").removeClass('required');
	$("#brand_5").removeClass('required');
	$("#brand_6").removeClass('required');
	$("#brand_7").removeClass('required');
	
	$("#sliderValue_15").val(${inflationrate});
	$("#slider_15").slider("value",$("#sliderValue_15").val());
	

$("#frmCarGoal").validate({
		
		ignore:'', //i.e. do not ignore hidden elements	
		rules:{	text__10:{min:0.01,max:1000},sliderValue_13:{min:5,max:18},sliderValue_14:{min:1,max:40}}
	});
	
$('.wrapper').attr('id', 'Global_Goal');
$('.wrapper').addClass('purchase_car_wrapper');	

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
    
    $("#text__10").change(function(ele) {

    	//var amt = Math.round($("#text__10").val() * 10) / 10;
    	var amt=$("#text__10").val();
    	//var amt =$("#text__10").val();
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
    
    // auto slider
   /*  $("#text__10").change(function(ele){ 
    	var amt = Math.round($("#text__10").val() * 10) / 10;
    	$("#text__10").val(amt);
    	var dp =  Math.round($("#sliderValue_11").val() * 10) / 10;
    	$("#sliderValue_11").val(dp);
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = Math.round(loanReq * 10) / 10;
    	
     	//var loanReq = parseInt($("#text__10").val()) - parseInt($("#sliderValue_10").val()); 
     	
     	if(loanReq > 0){
     		$('#sliderValue_12').val(loanReq); 
     		
     	} else {
     		$('#sliderValue_12').val(0);
     	}
     }); */
     
     $("#sliderValue_11").change(function(ele){
    	//var amt = Math.round($("#text__10").val() * 10) / 10;
    	var amt=$("#text__10").val();
     	$("#text__10").val(amt);
     	//var dp =  Math.round($("#sliderValue_11").val() * 10) / 10;
     	var dp=$("#sliderValue_11").val();
     	$("#sliderValue_11").val(dp);
     	var loanReq = parseFloat(amt) - parseFloat(dp); 
     	loanReq = loanReq.toFixed(2);
     	//loanReq = Math.round(loanReq * 10) / 10;
    	//var loanReq = parseInt($("#text__10").val()) - parseInt($("#sliderValue_10").val()); 
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
    /* $( "#text__10" ).change(function() {
    	if(! isNaN($("#text__10").val()) && $("#text__10").val()!="")
    	{
	    	 var dp = parseFloat((parseFloat($("#text__10").val())*10)/100);
	    	 dp = Math.round(dp * 10) / 10;
	    	 $("#sliderValue_11").val(dp);
	         $("#slider_11").slider("value", $( "#sliderValue_11" ).val());
	       	 $("#slider_12").slider("value", $( "#sliderValue_12" ).val());
	   	}
      }); */
     
     // make loan amount slide and text fiels read only 
     $("#slider_12").slider('disable');
     $("#sliderValue_12").attr('readonly', 'true');
     
     // down payment and loan slider setting  changes depending on expenses amount change
     /* $("#text__10").change(function(ele){ 
      if(!isNaN($("#text__10").val()))
       {
	     $("#slider_11").slider("option", "max", parseFloat($("#text__10").val()));
	     $("#slider_12").slider("option", "max", parseFloat($("#text__10").val()));
	     $("#sliderMaxValue_11").html($("#text__10").val());
	     $("#sliderMaxValue_12").html($("#text__10").val());
	     
	     $("#sliderValue_11").rules("add", {max:parseFloat($("#text__10").val()),min:0});
       }
     }); */
     // end //
     
     // when dp slider changes loan amount will gets change
     $("#slider_11").slider({
 	change: function(event, ui) {
 		//var amt = Math.round($("#text__10").val() * 10) / 10;
 		var amt=$("#text__10").val();
    	//$("#text__10").val(amt);
    	//var dp =  Math.round($("#sliderValue_11").val() * 10) / 10;
    	var dp=$("#sliderValue_11").val();
    	//$("#sliderValue_10").val(dp);
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = loanReq.toFixed(2);
    	//loanReq = Math.round(loanReq * 10) / 10;
 		//var loanReq = parseInt($("#text__10").val()) - parseInt($("#sliderValue_10").val()); 
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
	},
}).trigger('change');

//Populating Model on change of Category drop down
$("#auto__5").bind({
	"change": function(){
		jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#categoryIdHidden").val(), '{}', "#auto__6", "auto__6", '');	
	},
});

//Populating Variant on change of Model drop down
$("#auto__6").bind({
	"change": function(){
		jsonPopulateAutoCompleteForCarGoal("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#modelIdHidden").val(), '{}', "#auto__7", "auto__7", '');	
	},
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