<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<style>
	#q8 #risk_profile_pop_box {
		width: 575px;
	}
	
	#Global_Goal .first_col {		
		padding: 20px 0 0;
	}
</style>

<script>
  $(function() {
    $( "#Profile_Info_Tab" ).accordion();
  });
  </script>
<script>

  $(function() {
    $( ".Profile_Info_Tab" ).accordion();
  });
  </script>

<!-- Toggle real checkbox as per custom checkbox strats -->
<script>
$(document).ready(function(){
	
$( document ).tooltip();

$("#car_type").on('toggle', function (e, active) {
    if (active) {
	  $(".car_type").prop("checked", true);
    } else {
	   $(".car_type").prop("checked", false);
    }
	
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
<div id="wrapper" class="clearfix">

  <div id="header-strip" class="fl">
  <%-- <jsp:include page="../menu.jsp"></jsp:include> --%>
    <h3 class="clearfix fl">RISK PROFILE<span class="title_it"></span></h3>
  </div>
   <div id="inner-shadow-strip"></div>
   <div class="clearfix"></div>
    
<div id="Global_Goal" class="clearfix"> 
  <!-- Main starts-->
  <div style="margin-top: -10px !important;margin-bottom: 15px !important;">Note: Please click or tap on Questions to post your Answers.</div>
  <!-- <section class="main"> 

    <section class="content common_content">
     -->
      <!-- Xml code starts here -->
      <% boolean fromDc = request.getParameter("dc") != null; %>
      
     <form class="form-horizontal" id="frmRiskProfile" name="frmRiskProfile" action="<c:url value="/riskProfile/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="${redirectUrl}" />           
      <input type="hidden" name="inputData" id="inputData" value="" />
      <input type="hidden" name="questionBankId" id="questionBankId" value="${questionBankId}"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="${sectionTypeId}" />
        <input type="hidden" name="validateFlag" id="validateFlag" value="0" />
      
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
        <div id="main_actions" class="clearfix btn_bx1">
          <ul class="reset clearfix fr btn_grup3">
            </li>
            <%-- <li class="fl list"><a href="#" class="anch save"><input type="button" class="cancel_btn fl" value="SAVE"></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/profile/dashboard/" class="anch cancel"><input type="button" class="cancel_btn fl" value="CANCEL"></a></li> --%>
            <!-- <li class="fl list"><a href="#" class="anch skip inactiveLink"><span class="txt">Skip</span></a></li> -->
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            </li>
           <%--  <li class="fl list"><a href="#" class="anch add_note inactiveLink"><span class="txt">Add Notes</span></a></li>
            <li class="fl list"><a href="#" class="anch add_doc" onclick="uploadDocument(${partyId},'/riskProfile/datacollection/risk-profile/${partyId}');"><span class="txt">Add Doc</span></a></li> --%>
          </ul>
          <div class="">
          <ul class="reset clearfix fl btn_grup1">
            <!-- </li> -->
            <c:set var="analysisLink" value="#"/> 
            
            <c:if test="${flag == true}">
            <c:set var="analysisLink" value="${pageContext.request.contextPath}/riskProfile/riskProfAnalysis"/>
            </c:if> 
            <li class="fl list"><a href="${analysisLink}" class="anch analysis <c:if test='${ flag == false}'>inactiveLink</c:if>"><input type="button" class="cancel_btn fl" value="ANALYSIS"></a>
            
            </li>
            <li class="fl list"><a href="#" class="anch save"><input type="button" class="cancel_btn fl" value="SAVE"></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/<%=fromDc?"partner/datacollection":"profile/dashboard/" %>" class="anch cancel"><input type="button" class="cancel_btn fl" value="CANCEL"></a></li>
          </ul>
          </div>
        </div>
        
      
     <!--  Common footer ends -->
      <div class="overlay"></div>
   <!--  </section>
    Common_content Ends 
    
  </section> -->
  <!-- Main ends--> 
</div>
</div>

<!-- Wrapper ends-->

<script>
$(".save").click(function() {
	var count = 0;
	var inputData = "<Root>";
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
	
	$("#inputData").val(inputData);
	if(count <8) {
		showMessage("Please select answer for all the questions",true);
		return ;
	}
	else {
 		$("#frmRiskProfile").submit();
	}
});

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

