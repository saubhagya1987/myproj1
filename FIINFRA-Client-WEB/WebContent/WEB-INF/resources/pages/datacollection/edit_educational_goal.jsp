<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>
<!-- Wrapper starts-->
<div id="Global_Goal"> 
<input type="hidden" id="countryIdHidden" value="132004">
<input type="hidden" id="stateIdHidden" value="133024">
<input type="hidden" id="universityIdHidden" value="128039">
<input type="hidden" id="courseIdHidden" value="103206">
<input type="hidden" id="subjectIdHidden" value="104405">
<input type="hidden" id="flag1" value="1">
<input type="hidden" id="flag2" value="1">
<input type="hidden" id="flag3" value="1">
<input type="hidden" id="flag4" value="1">
<input type="hidden" id="flag5" value="1">
<input type="hidden" id="flag6" value="1">

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
    <div id="page_loader"></div>
    <section class="content common_content"> 
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> 
    <section class="common_unit_selector"><ul class="clearfix reset"><li class="k"><span class="unit">K</span></li><li class="lacs unit_selected"><span class="unit">Lacs</span></li><li class="cr"><span class="unit">Cr</span></li></ul><p>All figures are in :</p></section>
      <div class="clr"></div>
      
      <!-- Xml code starts here -->
      
     <form class="form-horizontal" id="frmEductionGoal" name="frmEductionGoal" action="<c:url value="/futureFinancialDc/saveEductionGoal" />" method="POST">
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="${goalName}" /> 
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" /> 
      <input type="hidden" name="goalId" id="goalId" value="${goalId}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      
      <c:set var="attributeCount" value="${0}"></c:set>	
      
      <section id="education_goal" class="in_content common_in_content clearfix education_goal" >
      
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
	      				<div class="row_one">  <div class="title-bg"> <div class="title"><x:out select="QuestionText" /></div></div> 	      				
	      					
				        <div class="fl first_col">
				         <ul class="reset clearfix first_col_ul">					        				       			         
				         
				         <c:set var="column1RowCount"><x:out select="$item/RowsForColumn1" escapeXml="false"/></c:set>
				         <c:set var="column2RowCount"><x:out select="$item/RowsForColumn2" escapeXml="false"/></c:set>  
						 <c:set var="currentRowCount" value="${-1}"></c:set>							 						   				      					      			
	      			</x:when>
	      			
					<x:when select="$item/@QuestionType = '85004'">
			            <li class="clearfix rel">
			            <input type="hidden" name="parentId" id="parentId" value="0" />
			              <label class="form_label"><x:out select="QuestionText" /></label>
			               <select id="brand_${count.index}" name="brand_${count.index}" >			                
			              </select> 
			            </li>
			            
			             <script type="text/javascript">			           
					   		var dropDownName = "#brand_"+${count.index};
					   		var partyIdVar = "#contactPartyId";
					   		var partyIdVarValue = $(partyIdVar).val();
					   		var attrId = <x:out select="$item/@AttributeCodeId" />;
					   		$(dropDownName).addClass("answers");				
					   		if(dropDownName == '#brand_1' || dropDownName == '#brand_4' || dropDownName == '#brand_5') {
					   			$(dropDownName).addClass("required");
						   	}					 					   	
					   		// brand_1 for education_for
					   		if(attrId == 100054)
						   	{
					   			$("select").selectBoxIt();
					   			jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=" + partyIdVarValue, '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	}					   							   				
					   		/* else if(attrId == 100005)// brand_2  for Countries, brand_3 for States 
						   	{
					   			$("select").selectBoxIt();					   			
					   			jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CountryForGoal", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');					   			
						   	} */
					   		else if(attrId == 100050)// for expected year of joining
					   		{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   			
					   		}
					   		else if(attrId == 100051)// for expected year of joining
					   		{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   			
					   		}
			           </script>
					   								   					   							   
			       
			          					
					</x:when>	
					
					<x:when select="$item/@QuestionType = '85005'">
			            <li class="clearfix rel">
			              <label class="form_label" id="edu_exp"><x:out select="QuestionText" /> </label>			                
			              <div class="input_counter_parent">
			                <input type="text" name="text__${count.index}" class="input_counter answers required Number1" value="${goalMap[attributeCodeId]}" id="text__${count.index}" >
			                <span class="unit dynamic">lacs</span> </div>
			            </li>	
			       </x:when>
			       <x:when select="$item/@QuestionType = '85999'">
								<li class="clearfix rel">
									<div>
										<label class="form_label"><x:out select="QuestionText" /></label>
										<input type="text" class="common_input2 answers"
											id="auto__${count.index}" name="auto__${count.index}" value="${goalMap[attributeCodeId]}" />
									</div>
								</li>
				   </x:when>			       	
			       
			       <x:when select="$item/@QuestionType = '85009'">
			            <li class="clearfix rel">
			              <label class="form_label"><x:out select="QuestionText" /></label>
			              <div class="range_parent">
			                 <div class="scale clearfix"><div class="scale_range">
			                 	<span id="sliderMinValue_${count.index}" class="low extrem"><x:out select="$item/Scale/Min_Value" /></span> 
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
							<c:choose> <c:when test='${count.index == 6 }'>Number1</c:when><c:when test='${count.index != 6 }'>Number</c:when></c:choose>"/>
    	
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
			    				
			    				if(sliderVar=="#slider_7" || sliderVar=="#slider_8")
			    				{
			    					createSliderAndSetValue(sliderVar, <x:out select="$item/Scale/Min_Value" />,'${goalMap[attributeCodeId]}',<x:out select="$item/Scale/Increment" /> , sliderValueVar, sliderValue);
			    				}
			    				else
			    				{
			    					createSliderAndSetValue(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" /> , sliderValueVar, sliderValue);	
			    				}
			    				
			    			</script>
			    			</div></div>
			            </li>
			       </x:when>	
			       
			       
			       <x:when select="$item/@QuestionType = '85013'">		
			       
		            <li class="clearfix rel">
		              <label class="form_label"><x:out select="QuestionText" /></label>
		              
		              <img src="${pageContext.request.contextPath}/resources/images/star-rating.png" alt="" width="96" height="27" hspace="10" align="absmiddle"> 
            		</li>			       
			       </x:when>       	
			       
			        <x:when select="$item/@QuestionType = '85014'">	
			            <li class="clearfix rel">
			              <label class="form_label"><x:out select="QuestionText" />&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png"/></label>
			              <div>
			              			              	
			              	<x:if select="$item/IsReadOnly = '1'">
			                	<input type="text" disabled class="fixed_txt_box answers required" id="text__${count.index}" name="text__${count.index}" value="${goalMap[attributeCodeId]}" />
			                </x:if>
			                <x:if select="$item/IsReadOnly = '0'">
			                	<input type="text" class="common_input2 answers" id="text__${count.index}" name="text__${count.index}" value="${goalMap[attributeCodeId]}"/>
			                </x:if>
			              </div>                 
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
            <li class="fl list"><a href="javascript:void(0);" class="anch cancel" onclick="doValidate('frmEductionGoal','${cancel}')"><span class="txt">Cancel</span></a></li>
         
          </ul>
         
        </div>
        <a href="${pageContext.request.contextPath}${back}" class="back navgation "><span class="txt">Back</span></a>
		<a href="${pageContext.request.contextPath}${next}" class="next navgation "><span class="txt">Next</span></a> 
       </section>
</form>      
      <!-- Common footer ends --> 
    <div class="overlay"></div>
    </section>
    <!-- Common_content Ends-->
     
  </section>
  <!-- Main ends--> 
  <div class="overlay"></div> 
</div>
<!-- Wrapper ends--> 
<script>

$(".save").click(function() {		
	
	var flag=false;
	createNewValueArray("frmEductionGoal");
	
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
	$("#frmEductionGoal").find(".answers").each(function (index) {
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
	inputData = inputData + "100054:"+$("#brand_1").val()+ ",";
	
	if($("#auto__2").val()!="")
	{
		inputData = inputData + "100005:"+$("#auto__2").val()+ ",";
	}
	if($("#auto__3").val()!="")
	{
		inputData = inputData + "100006:"+$("#auto__3").val()+ ",";
	}
	inputData = inputData + "100051:"+$("#brand_4").val()+ ",";
	inputData = inputData + "100050:"+$("#brand_5").val()+ ",";
	inputData = inputData + "100052:"+$("#text__6").val()+ ",";
	inputData = inputData + "100057:"+$("#sliderValue_7").val()+ ",";
	inputData = inputData + "100056:"+$("#sliderValue_8").val()+ ",";
	inputData = inputData + "100058:"+$("#sliderValue_9").val()+ ",";
	inputData = inputData + "100059:"+$("#sliderValue_10").val()+ ",";
	inputData = inputData + "100053:"+$("#sliderValue_11").val()+ ",";
	
	if($("#auto__13").val()!="")
	{
		inputData = inputData + "100011:"+$("#auto__13").val()+ ",";
	}
	if($("#auto__14").val()!="")
	{
		inputData = inputData + "100002:"+$("#auto__14").val()+ ",";
	}
	if($("#auto__15").val()!="")
	{
		inputData = inputData + "100003:"+$("#auto__15").val()+ ",";
	}
	if($("#text__16").val()!="")
	{
		inputData = inputData + "100012:"+$("#text__16").val();
	}
	
	inputData = inputData + "]";
	
	$("#inputData").val(inputData);	
	
	$('#hiddenGoalName').val($('#goalName').val());
	if($('#hiddenGoalName').val()=="" || $('#hiddenGoalName').val()== null)
	{
		alertMessage();
		$("#goalName").focus();
	}
	else if($('#frmEductionGoal').validate().form()){
		    
		    $(".save").addClass("inactiveLink");
			$("#frmEductionGoal").submit();
			}

  }else
  {
	  dynamicMsg("You haven't changed any data yet.Please make some changes and then save.");
  }
		
});


$(document).ready(function(){
		
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
		  
	$("#frmEductionGoal").validate({
			
			ignore:'', //i.e. do not ignore hidden elements	
			rules:{	text__6:{min:0.01,max:1000},sliderValue_9:{min:5,max:18},sliderValue_10:{min:1,max:40}}
		});
	
	jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CountryForGoal", '{}', "#auto__2", "auto__2", '');
	
	jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#countryIdHidden").val(), '{}', "#auto__3", "auto__3", '');

	jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#stateIdHidden").val(), '{}', "#auto__13", "auto__13", '');

	jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#universityIdHidden").val(), '{}', "#auto__14", "auto__14", '');

	if($("#auto__15").val()!=""){
	jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#subjectIdHidden").val(), '{}', "#text__16", "text__16", '');
	}
	
$('#goalName').val($('#hiddenGoalName').val());
	
$('.wrapper').attr('id', 'Global_Goal');	
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
    
    
    $("#text__6").change(function(ele){ 
    	//var amt = Math.round($("#text__6").val() * 10) / 10;
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
   /*  $("#text__6").change(function(ele){    	
     	
 	   var amt = Math.round($("#text__6").val() * 10) / 10;
    	$("#text__6").val(amt);
    	var dp =  Math.round($("#sliderValue_7").val() * 10) / 10;
    	$("#sliderValue_7").val(dp);
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = Math.round(loanReq * 10) / 10;
 	   //var loanReq = parseInt($("#text__6").val()) - parseInt($("#sliderValue_6").val()); 
     	
     	if(loanReq > 0){
     		$('#sliderValue_8').val(loanReq); 
     		
     	} else {
     		$('#sliderValue_8').val(0);
     	}
     }); */
     $("#sliderValue_7").change(function(ele){
     	//var amt = Math.round($("#text__6").val() * 10) / 10;
     	var amt=$("#text__6").val();
     	$("#text__6").val(amt);
     	//var dp =  Math.round($("#sliderValue_7").val() * 10) / 10;
     	var dp=$("#sliderValue_7").val();
     	$("#sliderValue_7").val(dp);
     	var loanReq = parseFloat(amt) - parseFloat(dp); 
     	//loanReq = Math.round(loanReq * 10) / 10;
     	//var loanReq = parseInt($("#text__6").val()) - parseInt($("#sliderValue_6").val()); 
     	if(loanReq > 0){
     		$('#sliderValue_8').val(loanReq); 
     		$("#slider_8").slider("value", $( "#sliderValue_8" ).val());
     	} else {
     		$('#sliderValue_8').val(0);
     		 $("#slider_8").slider("value", $( "#sliderValue_8" ).val());
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
     /* $( "#text__6" ).change(function() {
         $("#slider_7").slider("value", $( "#sliderValue_7" ).val());
       	 $("#slider_8").slider("value", $( "#sliderValue_8" ).val());
      });
      */
     // make loan amount slide and text fiels read only 
     $("#slider_8").slider('disable');
     $("#sliderValue_8").attr('readonly', 'true');
     
     // down payment and loan slider setting  changes depending on expenses amount change
     /* $("#text__6").change(function(ele){ 
     if(!isNaN($("#text__6").val()))
       {
     $("#slider_7").slider("option", "max", parseFloat($("#text__6").val()));
     $("#slider_8").slider("option", "max", parseFloat($("#text__6").val()));
     $("#sliderMaxValue_7").html($("#text__6").val());
     $("#sliderMaxValue_8").html($("#text__6").val());
     
     $("#sliderValue_7").rules("add", {max:parseFloat($("#text__6").val()),min:0});
     
        }
     }); */
     // end //
     
     // when dp slider changes loan amount will gets change
     $("#slider_7").slider({
 	change: function(event, ui) {
 		//var amt = Math.round($("#text__6").val() * 10) / 10;
 		var amt=$("#text__6").val();
     	//$("#text__6").val(amt);
     	//var dp =  Math.round($("#sliderValue_7").val() * 10) / 10;
     	var dp=$("#sliderValue_7").val();
     	//$("#sliderValue_6").val(dp);
     	var loanReq = parseFloat(amt) - parseFloat(dp); 
     	//loanReq = Math.round(loanReq * 10) / 10;
 		//var loanReq = parseInt($("#text__6").val()) - parseInt($("#sliderValue_6").val()); 
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
     
  // on load doc
  var text6 = parseFloat( $("#sliderValue_7").val()) +  parseFloat($("#sliderValue_8").val());
  				//$("#text__6").val(text6);
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
       		createOldValueArray('frmEductionGoal');
   	    	});
       }).trigger('load');
    
    
});

//Populating State on change of country drop down

$("#auto__2").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#countryIdHidden").val(), '{}', "#auto__3", "auto__3", '');
		if($("#flag1").val() != 0) {
			$("#auto__3").val('');
			$("#auto__13").val('');
			$("#auto__14").val('');
			$("#auto__15").val('');
			$("#auto__16").val('');
			 $("#flag1").val(0);
		 }
		},
});	


//Populating University on change of state drop down
$("#auto__3").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#stateIdHidden").val(), '{}', "#auto__13", "auto__13", '');
		if($("#flag2").val() != 0) {
			 $("#auto__13").val('');
				$("#auto__14").val('');
				$("#auto__15").val('');
				$("#text__16").val('');

			 $("#flag2").val(0);
		 }
		},
});


//Populating Course Level on change of University drop down
$("#auto__13").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#universityIdHidden").val(), '{}', "#auto__14", "auto__14", '');
		if($("#flag3").val() != 0) {
			 $("#auto__14").val('');
			 $("#auto__15").val('');
			 $("#text__16").val('');
			 $("#flag3").val(0);
		 }
		},
});
	

//Populating Course Subject on change of Course Leve drop down
$("#auto__14").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#courseIdHidden").val(), '{}', "#auto__15", "auto__15", '');
		if($("#flag4").val() != 0) {
			 $("#auto__15").val('');
			 $("#text__16").val('');
			 $("#flag4").val(0);			
		 }
	},
});


//Populating Annual Fees on change of Course Leve drop down

$("#auto__15").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#subjectIdHidden").val(), '{}', "#text__16", "text__16", '');
		if($("#flag5").val() != 0) {
			$("#text__16").val('');
			 $("#flag5").val(0);
			 
		 }
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