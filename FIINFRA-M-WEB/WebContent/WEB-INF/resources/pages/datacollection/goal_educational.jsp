<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
#page_loader {
	background: #fff
		url(${pageContext.request.contextPath}/resources/images/loader.gif)
		no-repeat center center;
}
</style>
<!-- Wrapper starts-->
<div id="">
<!-- <input type="hidden" id="countryIdHidden" value="0">
<input type="hidden" id="stateIdHidden" value="0">
<input type="hidden" id="universityIdHidden" value="0">
<input type="hidden" id="courseIdHidden" value="0">
<input type="hidden" id="subjectIdHidden" value="0">

 -->
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
			<!-- Xml code starts here -->
				
			<form class="form-horizontal" id="frmEductionGoal"
				name="frmEductionGoal"
				action="<c:url value="/futureFinancialDc/saveEductionGoal" />"
				method="POST" onsubmit="return validateGoalName()">
				<div class="page-content"> 
				<input type="hidden" name="hiddenGoalName" id="hiddenGoalName"
					value="" class="required" /> <input type="hidden" name="partyId"
					id="partyId" value="${partyId}" /> <input type="hidden"
					name="redirectUrl" id="redirectUrl" value="${redirectUrl}" /> <input
					type="hidden" name="inputData" id="inputData" value="" />

				<c:set var="attributeCount" value="${0}"></c:set>

					<input id="contactPartyId" name="contactPartyId" type="hidden" value="${partyId}">
					<x:parse xml="${sectionData}" var="output" />
					<c:set var="currentColumnCount" value="${1}"></c:set>
				
					<x:forEach select="$output/Section/Question" var="item" varStatus="count">
						<c:set var="questionType">
							<x:out select="$item/@QuestionType" escapeXml="false" />
						</c:set>
						<%-- 	<c:set var="attributeCodeId"><x:out select="$item/@AttributeCodeId" escapeXml="false"/></c:set> --%>

						<c:if test="${questionType != '85012' && questionType != '85013'}">
							<input type="hidden"
								name="attributeCodeId_<c:out value="${attributeCount}"/>"
								id="attributeCodeId_<c:out value="${attributeCount}"/>"
								value="<x:out select="$item/@AttributeCodeId" />" />
							<c:set var="attributeCount" value="${attributeCount+1}"></c:set>
						</c:if>
						<x:choose>



							<x:when select="$item/@QuestionType = '85012'">
							<div class="title-bg">
										<div class="title">
											<x:out select="QuestionText" />
										</div>
									</div>
								<div class="row">
									
									<div class="col-sm-6">
										<form class="form-horizontal" role="form">
											
											
											<c:set var="column1RowCount">
												<x:out select="$item/RowsForColumn1" escapeXml="false" />
											</c:set>
											<c:set var="column2RowCount">
												<x:out select="$item/RowsForColumn2" escapeXml="false" />
											</c:set>
											<c:set var="currentRowCount" value="${-1}"></c:set>
							</x:when>

							<x:when select="$item/@QuestionType = '85004'">
								 <div class="form-group"><input type="hidden"
									name="parentId" id="parentId" value="0" /> <label
									class="col-sm-3 no-padding-right" for="brand_${count.index}"><x:out select="QuestionText" /></label>									
									<div class="col-sm-7">      
									<select
									id="brand_${count.index}" name="brand_${count.index}" class="chosen-select form-control">
								</select></div>
								</div>

								<script type="text/javascript">			           
					   		var dropDownName = "#brand_"+${count.index};
					   		var partyIdVar = "#contactPartyId";
					   		var partyIdVarValue = $(partyIdVar).val();
					   		var attrId = <x:out select="$item/@AttributeCodeId" />;
					   		$(dropDownName).addClass("answers");
					   		if(dropDownName == '#brand_1' || dropDownName == '#brand_4'||dropDownName == '#brand_5') {
					   			$(dropDownName).addClass("required");						 
						   	}	
						  // brand_1 for education_for
					   		if(attrId == 100054)
						   	{
					   			//$("select").selectBoxIt();
					   			jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=" + partyIdVarValue, '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');
						   	}					   							   				
					   		/* else if(attrId == 100005)// brand_2  for Countries, brand_3 for States 
						   	{
					   			$("select").selectBoxIt();					   			
					   			jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CountryForGoal", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');					   			
						   	} */
					   		else if(attrId == 100050)// for expected year of joining
					   		{
					   			//$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   			
					   		}
					   		else if(attrId == 100051)// for expected month of joining
					   		{
					   			//$("select").selectBoxIt();
							   	jsonPopulateDropdownForGoalsNew("${pageContext.request.contextPath}/futureFinancialDc/getGoalMonth", '{}', "#brand_"+${count.index}, "brand_"+${count.index}, '${goalMap[attributeCodeId]}');	
					   			
					   		}

			           </script>
							</x:when>

							<x:when select="$item/@QuestionType = '85005'">
								<div class="form-group"><label class="col-sm-3 no-padding-right"
									id="" for="text__${count.index}"><x:out select="QuestionText" /> </label>
									<div class="col-sm-9 col-xs-10">
									<div class="input_counter_parent">
										<input type="text" name="text__${count.index}"
											class="input_counter answers required Number1" value="00"
											id="text__${count.index}"> <span
											class="unit dynamic">lacs</span>
									</div></div></div>
							</x:when>
							<x:when select="$item/@QuestionType = '85999'">
								<div class="form-group">
								<label class="col-sm-3 no-padding-right" for="auto__${count.index}"><x:out select="QuestionText" /></label>
									<div class="col-sm-7 col-xs-12">										
										<input type="text" class="col-sm-12 col-xs-11 answers"
											id="auto__${count.index}" name="auto__${count.index}" />
									</div>
								</div>
							</x:when>

							<x:when select="$item/@QuestionType = '85009'">
								<div class="form-group"> <label class="col-sm-3 no-padding-right" for="sliderValue_${count.index}"><x:out
											select="QuestionText" /></label>
											<div class="col-sm-9 col-xs-12">
									<div class="range_parent">
										<div class="scale clearfix">
											<div class="col-sm-7 col-xs-6">
											<div class="scale_range">
												<span id="sliderMinValue_${count.index}" class="low extrem"><x:out
														select="$item/Scale/Min_Value" /></span> <span
													id="sliderMaxValue_${count.index}" class="high extrem"><x:out
														select="$item/Scale/Max_Value" /></span>
											</div>											
											<div class="help-block" id="slider_${count.index}"></div>
											</div>
											<div class="space-10" ></div>
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
			    				if(sliderVar == '#slider_9') {
			    					createSliderNew(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />,sliderValueVar,"12");
			    				}
			    				else {
			    					createSliderNew(sliderVar, <x:out select="$item/Scale/Min_Value" />, <x:out select="$item/Scale/Max_Value" />, <x:out select="$item/Scale/Increment" />,sliderValueVar,"0");
			    				}
			    			</script>
									</div>
									</div>
</div>
</div>
</x:when>


<x:when select="$item/@QuestionType = '85013'">

	<li class="clearfix rel"><label class="form_label"><x:out
				select="QuestionText" /></label> <img
		src="${pageContext.request.contextPath}/resources/images/star-rating.png"
		alt="" width="96" height="27" hspace="10" align="absmiddle"></li>
</x:when>

<x:when select="$item/@QuestionType = '85014'">
	<div class="form-group"><label class="col-sm-3 no-padding-right" for="text__${count.index}"><x:out
				select="QuestionText" /><%-- &nbsp; &nbsp;<img
			src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" /> --%></label>
		<div class="col-sm-7 col-xs-12">
			<x:if select="$item/IsReadOnly = '1'">
				<input type="text" disabled class="col-sm-12 col-xs-11 answers required"
					id="text__${count.index}" name="text__${count.index}" value="" />
			</x:if>
			<x:if select="$item/IsReadOnly = '0'">
				<input type="text" class="col-sm-12 col-xs-11 answers <c:if test='${count.index == 16 }'>Number1</c:if>"
					id="text__${count.index}" name="text__${count.index}" />
			</x:if>
		</div></div>
</x:when>

</x:choose>

<c:set var="currentRowCount" value="${currentRowCount+1}"></c:set>

<script>

</script>
<c:if test="${currentColumnCount == 1}">
	<c:if test="${column1RowCount == currentRowCount}">
		<c:set var="currentColumnCount" value="${2}"></c:set>
		<c:set var="currentRowCount" value="${0}"></c:set>
		</div>
		</form>	
		<div class="col-sm-6">
		<form class="form-horizontal" role="form">
	</c:if>
</c:if>

<c:if test="${currentColumnCount == 2}">
<form class="form-horizontal" role="form">
<%-- <c:if test="${currentRowCount == 0}">
<div class="form-group">
              <div class="col-sm-6">                
              </div>
              <div class="col-sm-6">                
              </div>
</div>
</c:if> --%>
	<c:if test="${column2RowCount == currentRowCount}">
		<c:set var="currentColumnCount" value="${1}"></c:set>
		</form>
		
		</div>
		</div>
	</c:if>
</c:if>

</x:forEach>
</div>
<div class="row">
<!-- <div class="row">
<div class="col-md-1">
</div>
<div class="col-md-11">
<h6><b>*Education master available in the system may not be correct since it is based on the inputs given by other users of the system.</b></h6>
</div>
</div> -->
<!-- Xml code ends  here -->
<!-- Common_in_contnet ends-->
<!-- Common footer starts -->
<section class="common_footer_actions">
      <div class="row">
        <div class="col-sm-1 col-xs-3">
          <button class="btn btn-app btn-transparent btn-xs" onclick="doValidate('frmEductionGoal','${pageContext.request.contextPath}/partner/datacollection/${partyId}/${headerName}/2')"> <i class="ace-icon fa fa-long-arrow-left bigger-240"></i> Back </button>
        </div>
        
        
        <div class="col-sm-10 col-xs-6">
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-4 col-xs-4 test">
            <button class="btn btn-app btn-transparent btn-xs analysis inactiveLink"> <i class="ace-icon fa fa-search bigger-200"></i> Analysis </button>
            <button class="btn btn-app btn-transparent btn-xs suggeset inactiveLink"> <i class="ace-icon fa fa-lightbulb-o bigger-200"></i> Suggestion </button>
            <button class="btn btn-app btn-transparent btn-xs action_plan inactiveLink"> <i class="ace-icon fa fa-hand-o-up bigger-200"></i> Action Plan </button>
          </div>
          <div class="col-sm-3 col-xs-4">
            <button class="btn btn-app btn-transparent btn-xs inactiveLink"> 
            <c:set var="docUrl" value="?partyId=${partyId}&url=/futureFinancialDc/educational-goal/${goalId}/${partyId}"/>
            <i class="ace-icon fa fa-file-code-o bigger-200"></i> Notes </button>
            
            <button class="btn btn-app btn-transparent btn-xs dcAddNewDocumentLink" onclick="doValidate('frmEductionGoal','${pageContext.request.contextPath}/partner/addDocument${docUrl}');">
            <c:set var="docUrl" value="?partyId=${partyId}&url=/futureFinancialDc/educational-goal/${goalId}/${partyId}"/>
             <i class="ace-icon fa fa-newspaper-o bigger-200"></i> Doc </button>
          </div>
          <div class="col-sm-4 col-xs-4">
            <button class="btn btn-app btn-transparent btn-xs saveAddEducationGoalLink save" > <i class="ace-icon fa fa-save bigger-200"></i> Save </button>
            <button class="btn btn-app btn-transparent btn-xs" onclick="doValidate('frmEductionGoal','${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2')"> <i class="ace-icon fa fa-close bigger-200"></i> Cancel </button>
            <a href="${pageContext.request.contextPath}/futureFinancialDc/property-goal/${partyId}"><button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa fa-forward bigger-200"></i> Skip </button></a>
          </div>
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-1 col-xs-0"></div>
        </div>
        <div class="col-sm-1 col-xs-3">
          <button class="btn btn-app btn-transparent btn-xs" onclick="doValidate('frmEductionGoal','${pageContext.request.contextPath}/futureFinancialDc/property-goal/${partyId}')"> <i class="ace-icon fa fa-long-arrow-right bigger-240"></i> Next </button>
        </div>
      </div>
    </section>
</form>
</div>
</div>
</div>
<div class="overlay"></div>
<!-- Wrapper ends-->

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
			jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CountryForGoal", '{}', "#auto__2", "auto__2", '');
			jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevalues?codeTypeId=StateForGoal", '{}', "#auto__3", "auto__3", '');
			jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevalues?codeTypeId=UniversityPreference", '{}', "#auto__13", "auto__13", '');
			jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CourseLevel", '{}', "#auto__14", "auto__14", '');
			jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CourseSubject", '{}', "#auto__15", "auto__15", ''); 
		});			

	  
function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

function validateGoalName() {
	var goalName = $('#hiddenGoalName').val();
	if(goalName == "" || goalName == null) {
		displayMsg("<spring:message code='alert.Goal.enterName' />");
		return false;
	}
}
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
			dynamicMsg("Please enter Goal Name");
			//$("#goalName").focus();
		}
		else  if($('#frmEductionGoal').validate().form()) {
			$(".save").addClass("inactiveLink");
 			$("#frmEductionGoal").submit(); 			
 			}
	
	  }else
	  {
		  dynamicMsg("You haven't changed any data yet.Please make some changes and then save.");
		  //alertMessage();
	  }
			
	});

$(document).ready(function(){
	
	$("#goalName").val("Education Goal");
	$("#hiddenGoalName").val("Education Goal");
	
	$("#sliderValue_11").val(${inflationrate});
	$("#slider_11").slider("value",$("#sliderValue_11").val());
	
	
	 $("#frmEductionGoal").validate({
			
			ignore:'', //i.e. do not ignore hidden elements
			rules:{	text__6:{min:0.01,max:1000},sliderValue_9:{min:5,max:18},sliderValue_10:{min:1,max:40}}
		}); 
	
/* $('.wrapper').attr('id', 'Global_Goal');	
$('.wrapper').addClass('eduacation_wrapper');
 $('.toggle').toggles();

$("#car_type").on('toggle', function (e, active) {
    if (active) {
	  $(".car_type").prop("checked", true);
    } else {
	   $(".car_type").prop("checked", false);
    }
});*/

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
    
    
    
    // down payment and loan slider setting  changes depending on expenses amount change
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
    	    
    	    //$("#sliderValue_7").rules("add",{max:parseFloat($("#text__6").val()),min:0});
         }
    	$('#sliderValue_7').val(amt); 
	    $("#slider_7").slider("value", amt);
	    $('#sliderValue_8').val(min); 
	    $("#slider_8").slider("value", min);
    });
    // end //
    // auto slider
   /* $("#text__6").change(function(ele){    	
    	
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
    	loanReq = loanReq.toFixed(2);
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
     }); */
    
    // make loan amount slide and text fiels read only 
    $("#slider_8").slider('disable');
    $("#sliderValue_8").attr('readonly', 'true');
    
    // down payment and loan slider setting  changes depending on expenses amount change
   /*  $("#text__6").change(function(ele){ 
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
    	loanReq = loanReq.toFixed(2);
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
    //$("#sliderMaxValue_6").html($("#text__6").val());
    //$("#sliderMaxValue_7").html($("#text__6").val());
    
    // end of auto slider
    
    $(window).bind("load", function() {
      	$( document ).ajaxComplete(function() {
      		createOldValueArray('frmEductionGoal');
  	    	});
      }).trigger('load');
});
    

// Populating state on change of country drop down
/* $("#auto__2").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#countryIdHidden").val(), '{}', "#auto__3", "auto__3", '');	
	},
}).trigger('change');	

//Populating University on change of state drop down
$("#auto__3").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#stateIdHidden").val(), '{}', "#auto__13", "auto__13", '');	
	},
});

//Populating Course Level on change of University drop down
$("#auto__13").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#universityIdHidden").val(), '{}', "#auto__14", "auto__14", '');	
	},
});

//Populating Course Subject on change of Course Leve drop down
$("#auto__14").bind({
	"change": function(){
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#courseIdHidden").val(), '{}', "#auto__15", "auto__15", '');	
	},
});

//Populating Annual Fees on change of Course Leve drop down
$("#auto__15").bind({
	"change": function(){
		//setTextDataED("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#subjectIdHidden").val(),"#auto__14");
		jsonPopulateAutoComplete("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#subjectIdHidden").val(), '{}', "#text__16", "text__16", '');
	},
});
 */

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
</script>

<!-- <script type="text/javascript">
			jQuery(function($) {
					$( "#input-size-slider" ).css('width','200px').slider({
					value:1,
					range: "min",
					min: 1,
					max: 8,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-4" ).val( ui.value );
						 }
					
					/* slide: function( event, ui ) {
						var sizing = ['', 'input-mini'];
						var val = parseInt(ui.value);
						$('#form-field-4').attr('class', sizing[val]).val('.'+sizing[val]);
					} */
				});
			
				$( "#form-field-4" ).val( $( "#slider-range-min" ).slider( "value" ) );
					
			/* 	$( "#input-span-slider" ).slider({
					value:1,
					range: "min",
					min: 1,
					max: 12,
					step: 1,
					slide: function( event, ui ) {
						var val = parseInt(ui.value);
						$('#form-field-5').attr('class', 'col-xs-'+val).val('.col-xs-'+val);
					}
				}); */
			
			
				
			});
		</script> --> 




   <script>
function addnote() {
   // document.getElementById("popUpOpenClient").innerHTML = "Hello World";
	
	$('#SampleModal').modal('show');
	
}
</script>

<!-- <script type="text/javascript">


	
			jQuery(function($) {
				
				
				
				$( "#input-size-slider11" ).slider({
					value:37,
					range: "min",
					min: 0,
					max: 100,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-11" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-11" ).val(  $( "#input-size-slider11" ).slider( "value" ) );
			
			
				
				
				
					$( "#input-size-slider12" ).slider({
					value:1,
					range: "min",
					min: 0,
					max: 100,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-12" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-12" ).val( $( "#input-size-slider12" ).slider( "value" ) );
				
				
				
				$( "#input-size-slider13" ).slider({
					value:1,
					range: "min",
					min: 5,
					max: 18,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-13" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-13" ).val( $( "#input-size-slider13" ).slider( "value" ) );
				
				
				
				
				$( "#input-size-slider14" ).slider({
					value:1,
					range: "min",
					min: 1,
					max: 10,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-14" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-14" ).val( $( "#input-size-slider14" ).slider( "value" ) );
					
		
				
				$( "#input-size-slider15" ).slider({
					value:1,
					range: "min",
					min: 0,
					max: 15,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-15" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-15" ).val( $( "#input-size-slider15" ).slider( "value" ) );
			
			
				
			});
		</script> 
>>>>>>> .r508
 -->