<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  

<style>
	#q8 #risk_profile_pop_box {
		width: 575px;
	}
	
	#Global_Goal .first_col {		
		padding: 20px 0 0;
	}
</style>

<script>
var inputData="";
  $(function() {
    $( "#Profile_Info_Tab" ).accordion();
  });
  </script>
<script>

  $(function() {
    $( ".Profile_Info_Tab" ).accordion();
  });
  </script>
  <script>
function getData() {
	var count = 0;
	inputData = "<Root>";
	var validateFlag = $('#validateFlag').val();
	$("#frmRiskProfile").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			count = count+1;
			validateFlag = '1';
			var optAttId = $( this ).attr("id");
			var questAttId = $( this ).attr("name");						
			inputData = inputData + "<Question>";
			inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
			if( $(this).val().split(':')[0] == "94198" ){
				inputData = inputData + "<QuestionOptionId>" + 94122 +"</QuestionOptionId>";
			}else {
				inputData = inputData + "<QuestionOptionId>" + $(this).val().split(':')[0] +"</QuestionOptionId>";
			}
			inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
			inputData = inputData + "<Value>" + $(this).val().split(':')[1] + "</Value>";			
			inputData = inputData + "</Question>";
		}
	});	
	
	inputData = inputData + "</Root>";
	return count;
	
	//$("#inputData").val(inputData);
	/* if(count <8) {	
		$("#successDialog").html("Please select answer for all the questions");
		$( "#successDialog").dialog( "open" );
	}
	else {
 		$("#frmRiskProfile").submit();
	} */
}

function checkData(url){
 	getData();
 	var initialData=$("#initialData").val();
 	if(initialData==inputData){
 		 window.location.href=url;
 	}else{
 		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").click(function(){cancelPage(url)});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
 	}
}

function cancelPage(url)
{
	window.location.href=url;
}

function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}


function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

<!-- Toggle real checkbox as per custom checkbox strats -->

$(document).ready(function(){

	var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});
	
$("#car_type").on('toggle', function (e, active) {
    if (active) {
	  $(".car_type").prop("checked", true);
    } else {
	   $(".car_type").prop("checked", false);
    }
    
    $( document ).tooltip();
	
});
getData();
$('#initialData').val(inputData);

$("#confirmDialog .close").click(function(){
    $(".overlay").fadeOut("slow");
 $("#confirmDialog").fadeOut("slow");
  });
 

}); 
</script>

<script>
$(document).ready(function(){
	$("#purchase_car .car_description").keypress(function(){
  var sum=50;
$('.desc_container input,.desc_container a').each( function(){ sum += $(this).width(); });
$('.desc_container').width( sum );
});
});
</script>
<script>
$(document).ready(function(){
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

});
</script>
<script>
$(document).ready(function(){
  
    $('.common_in_content').slimScroll();
  });

</script>
<script>
$(document).ready(function(){
 
  $(".box_pen,.box_pen2").click(function(){
    $(".overlay").fadeIn("slow");
   	$(this).next( "#risk_profile_pop_box" ).fadeIn("slow");
  });
  $('.col_box').click(function(){
	  if($(this).find( "#risk_profile_pop_box" ).css('display')=='none'){
	    $(".overlay").fadeIn("slow");
	   	$(this).find( "#risk_profile_pop_box" ).fadeIn("slow");
	    }
	});
  
  $("#risk_profile_pop_box .close").click(function(){
    $(".overlay").fadeOut("slow");
   	$(this).parent( "#risk_profile_pop_box" ).fadeOut("slow");
  });
  
  $("#risk_profile_pop_box ul li").click(function(){
    var x = $(this).text();    
    $("#" + $(this).attr('name')).val($(this).attr('id') + ":" + $(this).attr('value'));    
	$(this).closest("#risk_profile_pop_box" ).fadeOut("slow");
	$(".overlay").fadeOut("slow");
   	$(this).closest( "#risk_profile_pop_box" ).parent(".box").next(".risk_profile_answer").text(x).fadeIn("slow");
  });
  
});
</script>
<!-- custom scroll to "common_in_content" -->

<!-- Wrapper starts-->
<div class="" id="Global_Goal"> 
  <!-- Main starts-->
  <br>
  <span>Note: Please click or tap on Questions to post your Answers.</span>
  <section class="main"> 

    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> 
      <!-- Xml code starts here -->
      
     <form class="form-horizontal" id="frmRiskProfile" name="frmRiskProfile" action="<c:url value="/partner/datacollection/save" />" method="POST">
     <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="initialData" id="initialData" value="" />
      <input type="hidden" name="questionBankId" id="questionBankId" value="${questionBankId}"  />
      <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="${sectionTypeId}" />
      <input type="hidden" name="validateFlag" id="validateFlag" value="0" />
      <input type="hidden" name="nextPageUrl" id="nextPageUrl"/>
            <c:set var="attributeCount" value="${0}"></c:set>	
      
      <section id="Risk_Profile_In" class="in_content common_in_content clearfix education_goal">
      
      	<input id="contactPartyId" name="contactPartyId" type="hidden" value="${partyId}">
      	<x:parse xml="${sectionData}" var="output" />      	
      	<c:set var="column1RowCount"><x:out select="$output/Section/Question/RowsForColumn1" escapeXml="false"/></c:set>
      		
      	<div class="row_one">
          <div class="fl first_col">
            <ul class="reset clearfix first_col_ul">
            <x:forEach select="$output/Section/Question" var="item" varStatus="count" end="${column1RowCount - 1}">         
              <li class="clearfix">
                <div class="Question">
                  <div class="mandatory"></div>
                  Q ${count.index + 1}. </div>
                  <input type="hidden" id="<x:out select="$item/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeID" />" class="answer"/>
                <div class="col_box" title="Click here to edit">
                  <x:choose>
                  	<x:when select="$item/@AttributeCodeID = '94122'">
                  		<div class="box" id="q5">
                  	</x:when>
                  	<x:otherwise>
                  		<div class="box">
                  	</x:otherwise>
                  </x:choose>
                  <x:out select="QuestionText" /><span class="box_pen"><a><!--<img src="${pageContext.request.contextPath}/resources/images/pen.png" width="50" height="50" alt="pen">--></a></span><div id="risk_profile_pop_box"><span class="close">X</span><span>Choose Your Answer</span>
					  <ul>
					    <x:forEach select="$item/Options/Option" var="optionElement">
			              	
			              	<li id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeID" />" value="<x:out select="$optionElement/@Value" />" ><x:out select="$optionElement" /></li>
			              			              
			              </x:forEach>
					   </ul>
					</div>
				 </div>
                 <div class="risk_profile_answer"></div>
                </div>
              </li>
            </x:forEach>
      		</ul>
      	 </div>
        
        
        <div class="fr second_col">
         <ul class="reset clearfix second_col_ul">
         
         	<x:forEach select="$output/Section/Question" var="item" varStatus="count" begin="${column1RowCount}" end="${fn:length(sectionData)}">  
              <li class="clearfix">
                <div class="Question">
                  <div class="mandatory"></div>
                  Q ${count.index + 1}. </div>
                  <input type="hidden" id="<x:out select="$item/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeID" />" class="answer"/>
                <div class="col_box" title="Click here to edit">
                  <x:choose>
                  	<x:when select="$item/@AttributeCodeID = '94123'">
                  		<div class="box" id="q8">
                  	</x:when>
                  	<x:otherwise>
                  		<div class="box">	 
                  	</x:otherwise>
                  </x:choose>
                  
                  <x:out select="QuestionText" /><span class="box_pen2"></span><div id="risk_profile_pop_box"><span class="close">X</span><span>Choose Your Answer</span>
					  <ul>
					    <x:forEach select="$item/Options/Option" var="optionElement">
			              	
			              	<li id="<x:out select="$optionElement/@AttributeCodeID" />" name="<x:out select="$item/@AttributeCodeID" />" value="<x:out select="$optionElement/@Value" />" ><x:out select="$optionElement" /></li>
			              			              
			              </x:forEach>
					   </ul>
					</div></div>
                  <div class="risk_profile_answer"></div>
                </div>
              </li>
            </x:forEach>
         
         </ul>
        </div>
        <div class="clearfix"> </div>
      	</div>
      	</section>
      	</form>
      	
     <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            </li>
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2');" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="#" class="anch skip inactiveLink"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <li class="fl list"><a href="#" class="anch add_note" onclick="uploadNote(${partyId},'/riskProfile/datacollection/risk-profile/${partyId}');"><span class="txt">Notes</span></a></li>
     <li class="fl list"><a href="#" class="anch add_doc" onclick="uploadDocument(${partyId},'/riskProfile/datacollection/risk-profile/${partyId}');"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            </li>
            <c:set var="analysisLink" value="#"/> 
            <c:if test="${flag == true}">
            <c:set var="analysisLink" value="${pageContext.request.contextPath}/riskProfile/riskProfileAnalysis/${partyId}"/>
            </c:if> 
            <li class="fl list"><a href="${analysisLink}" class="anch analysis <c:if test='${ flag == false}'>inactiveLink</c:if>"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset inactiveLink"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan inactiveLink"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" onClick="checkData('${pageContext.request.contextPath}/partner/profile/${partyId}/<%=request.getSession().getAttribute("headerName")%>');" class="back navgation"><span class="txt">Back</span></a>
        <a href="#" onClick="doSaveOnNextRiskProfile('/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2');" class="next navgation"><span class="txt">Next</span></a> </section>
      
     <!--  Common footer ends -->
     
    </section>
    <!-- Common_content Ends --> 
    
  </section>
  <!-- Main ends--> 
</div>
<div id="confirmDialog" class="common_custom_modal_aa">
  				<span class="close">X</span>
  				<div class="modal_content"> 
    				<div class="aa_up">
        				<spring:message code="deleteRecord" /></div>
         			<div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         			<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  				</div>
			</div>
 <div class="overlay"></div>
<!-- Wrapper ends-->

<script>
$(".save").click(function() {
	var cnt = getData();
	if(cnt <8) {	
		$("#successDialog").html("Please select answer for all the questions");
		$( "#successDialog").dialog( "open" );
	}
	else {
		var initialData = $('#initialData').val();
		if(inputData == initialData) {
			alertMessage("You haven't changed any data yet.Please make some changes and then save.");
			return false;
		} else {
			$("#inputData").val(inputData);
			$("#frmRiskProfile").submit();	
			}
		}
	
	
});

function doSaveOnNextRiskProfile(url)
{
	var cnt = getData();
	if(cnt <8) {	
		$("#successDialog").html("Please select answer for all the questions");
		$( "#successDialog").dialog( "open" );
	}else{
		$("#nextPageUrl").val(url);
		$("#inputData").val(inputData);
		$("#frmRiskProfile").submit();
	}	
}

<c:forEach items="${questionDetailsList}" var="questionDetails">
	var x = '';
	if(${questionDetails.attributeValue eq '94122'}){
		x=$("#94198").text();
		$("#${questionDetails.attributeCodeId}").val("94198:${questionDetails.attributeRefferenceValue}");
		$("#94198").closest( "#risk_profile_pop_box" ).parent(".box").next(".risk_profile_answer").text(x).fadeIn("slow");
	} else {
		x=$("#${questionDetails.attributeValue}").text();
		$("#${questionDetails.attributeCodeId}").val("${questionDetails.attributeValue}:${questionDetails.attributeRefferenceValue}");
		$("#${questionDetails.attributeValue}").closest( "#risk_profile_pop_box" ).parent(".box").next(".risk_profile_answer").text(x).fadeIn("slow");
	}
</c:forEach>

</script>

