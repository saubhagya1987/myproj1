<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Wrapper starts-->
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
    <section class="common_unit_selector"><ul class="clearfix reset"><!-- <li class="k"><span class="unit">K</span></li> --><li class="lacs unit_selected"><span class="unit">Lacs</span></li><!-- <li class="cr"><span class="unit">Cr</span></li> --></ul><p>All figures are in :</p></section>
      <div class="clr"></div>
      
      <!-- Xml code starts here -->
      
     <form class="form-horizontal" id="frmWeddingGoal" name="frmEductionGoal" action="<c:url value="/futureFinancialDc/saveWeddingGoal" />" method="POST" >
      <input type="hidden" name="hiddenGoalName" id="hiddenGoalName" value="" /> 
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="goalPriority" id="goalPriority" value="0" />
      
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
			               <select id="brand_${count.index}" name="brand_${count.index}" >			                
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
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=" + partyIdVarValue, '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');							   	
						   	}
					   		else if(dropDownName=='#brand_2')
						   	{
					   			$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
							   
						   	} 
					   		else if(dropDownName=='#brand_3')
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
							<c:choose> <c:when test='${count.index == 4 }'>Number1</c:when><c:when test='${count.index != 4 }'>Number</c:when></c:choose>"/>

			                	
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
			                	<input type="text" disabled class="fixed_txt_box answers required" id="text__${count.index}" name="text__${count.index}" value="Sydney University" />
			                </x:if>
			                <x:if select="$item/IsReadOnly = '0'">
			                	<input type="text" class="common_input2 answers required" id="text__${count.index}" name="text__${count.index}" />
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
           	<li class="fl list"><a href="javascript:void()" class="anch cancel" onclick="doValidate('frmWeddingGoal','${pageContext.request.contextPath}/partner/datacollection')"><span class="txt">Cancel</span></a></li>
           
          </ul>
          
        </div>
        <a href="javascript:void(0);" class="back navgation" onclick="doValidate('frmWeddingGoal','${pageContext.request.contextPath}/futureFinancialDc/property-goal/')"><span class="txt">Back</span></a>
		<a href="javascript:void(0);" class="next navgation" onclick="doValidate('frmWeddingGoal','${pageContext.request.contextPath}/futureFinancialDc/car-goal/')"><span class="txt">Next</span></a> 
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

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

function validateGoalName() {
	var goalName = $('#hiddenGoalName').val();
	if(goalName == "" || goalName == null) {
		displayMsg("Enter Goal Name");
		return false;
	}
}
	
	$(".save").click(function() {		
		
		var cnt=0;
		var inputData="[";
		$("#frmWeddingGoal").find(".answers").each(function (index) {			
			
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
		else if($('#frmWeddingGoal').validate().form()){
			$(".save").addClass("inactiveLink");
			$("#frmWeddingGoal").submit();
		}	
		
 		
	});

$(document).ready(function(){
	
	$("#goalName").val("Wedding Goal");
	$("#hiddenGoalName").val("Wedding Goal");
	
	$("#sliderValue_9").val(${inflationrate});
	$("#slider_9").slider("value",$("#sliderValue_9").val());
	
$("#frmWeddingGoal").validate({
		
		ignore:'', //i.e. do not ignore hidden elements	
		rules:{	text__4:{min:0.01,max:1000},sliderValue_7:{min:5,max:18},sliderValue_8:{min:1,max:40}}
	});
	
	
	
$('.wrapper').attr('id', 'Global_Goal');
$('.wrapper').addClass("wedding_goal_wrapper");	
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
    
    
    $("#text__4").change(function(ele){ 
    	//var amt = Math.round($("#text__4").val() * 10) / 10;
    	var amt=$("#text__4").val();
    	var min= 0;
    	$("#text__4").val(amt);
    	if(!isNaN(amt))
         {
    		$("#slider_5").slider("option", "max", parseFloat($("#text__4").val()));
    	    $("#slider_6").slider("option", "max", parseFloat($("#text__4").val()));
    	    $("#sliderMaxValue_5").html($("#text__4").val());
    	    $("#sliderMaxValue_6").html($("#text__4").val());
    	    
    	    $("#sliderValue_5").rules("add",{max:parseFloat($("#text__4").val()),min:0});
         }
    	$('#sliderValue_5').val(amt); 
	    $("#slider_5").slider("value", amt);
	    $('#sliderValue_6').val(min); 
	    $("#slider_6").slider("value", min);
    });
    
    // for slider auto change value 
    
     /*  $("#text__4").change(function(ele){    	
    	
    	var amt = Math.round($("#text__4").val() * 10) / 10;
    	$("#text__4").val(amt);
    	var dp =  Math.round($("#sliderValue_5").val() * 10) / 10;
    	$("#sliderValue_5").val(dp);
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = Math.round(loanReq * 10) / 10;
    	//var loanReq = parseInt($("#text__4").val()) - parseInt($("#sliderValue_4").val()); 
    	
    	if(loanReq > 0){
    		$('#sliderValue_6').val(loanReq); 
    		
    	} else {
    		$('#sliderValue_6').val(0);
    	}
    }); */
    
    $("#sliderValue_5").change(function(ele){
    	
    	//var amt = Math.round($("#text__4").val() * 10) / 10;
    	var amt=$("#text__4").val();
    	$("#text__4").val(amt);
    	//var dp =  Math.round($("#sliderValue_5").val() * 10) / 10;
    	var dp=$("#sliderValue_5").val();
    	$("#sliderValue_5").val(dp);
    	var loanReq = parseFloat(amt) - parseFloat(dp); 
    	loanReq = loanReq.toFixed(2);
    	//loanReq = Math.round(loanReq * 10) / 10;
    	//var loanReq = parseInt($("#text__4").val()) - parseInt($("#sliderValue_4").val()); 
    	if(loanReq > 0){
    		$('#sliderValue_6').val(loanReq);    		
    	} else {
    		$('#sliderValue_6').val(0);
    	}
    });
      
       $( "#sliderValue_5" ).change(function() {
	    	 $("#slider_5").slider("value", $( "#sliderValue_5" ).val());
	   	 	 $("#slider_6").slider("value", $( "#sliderValue_6" ).val());
	   	 	 
	   	  if(parseFloat($("#sliderValue_5").val())==parseFloat($("#text__4").val()))
	    	 {
	    		 $("#slider_7").slider('disable'); 
	   		  	 $("#sliderValue_7").attr('readonly', 'true');
	   		     $("#sliderValue_7").val(0);
	   		 	 $("#sliderValue_7").rules("remove");
	   		  	 
	   			 $("#slider_8").slider('disable'); 
			  	 $("#sliderValue_8").attr('readonly', 'true');
			  	 $("#sliderValue_8").val(0);
			  	 $("#sliderValue_8").rules("remove");
	   		 }
	    	 else
	    	 {
	    		 $("#slider_7").slider('enable'); 
	    		 $("#sliderValue_7").removeAttr('readonly');
			  	 $("#sliderValue_7").val($("#slider_7").slider('value'));
		  		 $("#sliderValue_7").rules("add",{min:5,max:18});
	   		  	 
	   			 $("#slider_8").slider('enable'); 
	   			 $("#sliderValue_8").removeAttr('readonly');
			  	 $("#sliderValue_8").val($("#slider_8").slider('value'));
			  	 $("#sliderValue_8").rules("add",{min:1,max:10});

	    	 }	   	 	 
	    });
	    /* $( "#text__4" ).change(function() {
	        $("#slider_5").slider("value", $( "#sliderValue_5" ).val());
	      	 $("#slider_6").slider("value", $( "#sliderValue_6" ).val());
	     });
     */
	    // make loan amount slide and text fiels read only 
	    $("#slider_6").slider('disable');
	    $("#sliderValue_6").attr('readonly', 'true');
	    
	    // down payment and loan slider setting  changes depending on expenses amount change
	    /* $("#text__4").change(function(ele){ 
	    	if(!isNaN($("#text__4").val()))
	         {
	    		$("#slider_5").slider("option", "max", parseFloat($("#text__4").val()));
	    	    $("#slider_6").slider("option", "max", parseFloat($("#text__4").val()));
	    	    $("#sliderMaxValue_5").html($("#text__4").val());
	    	    $("#sliderMaxValue_6").html($("#text__4").val());
	    	    
	    	    $("#sliderValue_5").rules("add",{max:parseFloat($("#text__4").val()),min:0});
	         }
	    }); */
	    // end //
	    
	    // when dp slider changes loan amount will gets change
	    $("#slider_5").slider({
    	change: function(event, ui) {
    		
    		//var amt = Math.round($("#text__4").val() * 10) / 10;
    		var amt=$("#text__4").val();
        	//$("#text__4").val(amt);
        	//var dp =  Math.round($("#sliderValue_5").val() * 10) / 10;
        	var dp=$("#sliderValue_5").val();
        	//$("#sliderValue_4").val(dp);
        	var loanReq = parseFloat(amt) - parseFloat(dp); 
        	loanReq = loanReq.toFixed(2);
        	//loanReq = Math.round(loanReq * 10) / 10;
    		//var loanReq = parseInt($("#text__4").val()) - parseInt($("#sliderValue_4").val()); 
        	if(loanReq > 0){
        		$('#sliderValue_6').val(loanReq); 
        		 $("#slider_6").slider("value", $( "#sliderValue_6" ).val());
        	} else {
        		$('#sliderValue_6').val(0);
        		 $("#slider_6").slider("value", $( "#sliderValue_6" ).val());
        	}
        	
        	 if(parseFloat($("#sliderValue_5").val())==parseFloat($("#text__4").val()))
	    	 {
	    		 $("#slider_7").slider('disable'); 
	   		  	 $("#sliderValue_7").attr('readonly', 'true');
	   		     $("#sliderValue_7").val(0);
	   		 	 $("#sliderValue_7").rules("remove");
	   		  	 
	   			 $("#slider_8").slider('disable'); 
			  	 $("#sliderValue_8").attr('readonly', 'true');
			  	 $("#sliderValue_8").val(0);
			  	 $("#sliderValue_8").rules("remove");
	   		 }
	    	 else
	    	 {
	    		 $("#slider_7").slider('enable'); 
	    		 $("#sliderValue_7").removeAttr('readonly');
			  	 $("#sliderValue_7").val($("#slider_7").slider('value'));
		  		 $("#sliderValue_7").rules("add",{min:5,max:18});
	   		  	 
	   			 $("#slider_8").slider('enable'); 
	   			 $("#sliderValue_8").removeAttr('readonly');
			  	 $("#sliderValue_8").val($("#slider_8").slider('value'));
			  	 $("#sliderValue_8").rules("add",{min:1,max:10});

	    	 }        	
    	} });
	    
	    // on load of doc
	    //$("#sliderMaxValue_4").html($("#text__4").val());
	   // $("#sliderMaxValue_5").html($("#text__4").val());
	    
    // end of auto change slider
    
    	 $(window).bind("load", function() {
         	$( document ).ajaxComplete(function() {
         		createOldValueArray('frmWeddingGoal');
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