<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="pieces" value="${fn:split(numberOfGoals, '_')}"/>

    <section class="content common_content">
    	<input type="hidden" name="partyId" id="partyId" value="${partyId}" />
    	<c:set var="link" value="#"/>
    	<c:if test="${pieces[0] > 0 }">
    	<c:set var="link" value="${pageContext.request.contextPath}/futureFinancialDc/getMyGoals/${partyId}"/>
    	</c:if>
		<a href="${link}" class="my_goal_redirect dcMyGoalsLink" onclick="<c:if test="${pieces[0] <= 0 }">javascript:alertMessage('No goals found')</c:if>">
        <h4 class="head">My Goals</h4><span class="count">${pieces[0]}</span>
       </a>
      <section class="in_content clearfix" id="data_collection">
        <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
        <!-- DC submenu Ends-->
        <div class="column_left">
          <div class="first_col">
            <div id="personal_info" class="circular_bg"><c:if test='${personalInfo == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area dcPersonalInformationLink" href="${pageContext.request.contextPath}/partner/profile/${partyId}/${headerName}"><span>Personal Information</span></a></div>
          </div>
          <div class="sec_col">
            <div id="risk_profile" class="circular_bg"><c:if test='${risk == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area dcRiskProfileLink" href="${pageContext.request.contextPath}/riskProfile/datacollection/risk-profile/${partyId}"><span>Risk Profile</span>
	          <span style="width: 133%;height: 1px;">
	          <c:choose>
          		<c:when test="${pieces[8] eq 40001}">
          			(Conservative)
          		</c:when>
          		<c:when test="${pieces[8] eq 40002}">
          			(Balanced)
          		</c:when>
          		<c:when test="${pieces[8] eq 40003}">
          			(Aggressive)
          		</c:when>
          		<c:when test="${pieces[8] eq 0}">
          			(Please complete risk profiler questionnaire)
          		</c:when>
          	</c:choose></span></a></div>
          </div>
        </div>
        <div class="column_right clearfix">
          <div class="current_finacial">
            <div class="heading fr clearfix">
              <div class="head_thumb fr"><span></span></div>
              <p class="fr">Current Financial Status</p>
            </div>
              <div class="clr"></div>
            <div class="category" id="cash_flow"><c:if test='${cashflow == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area dcCashFlowLink" href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}"><span>Cash Flow</span></a></div>
            <div class="category inactiveLink" id="risk_cover"><a class="hit_area dcRiskCoverLink" href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/generalInsurance/${partyId}"><span>Risk<br/>Management</span></a></div>
            <div class="category" id="goal_readiness"><a class="hit_area dcGoalReadinessLink" href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness/${partyId}"><span>Asset<br/>Management</span></a></div>
            <div class="category"  id="retirement_readiness"><c:if test='${retirement == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area dcRetirementPlanningLink" href="${pageContext.request.contextPath}/partner/datacollection/retirement-planning/${partyId}"><span>Retirement<br/>Readiness</span></a></div>
            <div class="category inactiveLink" id="emergency"><c:if test='${emergency == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area dcEmergencyReadinessLink" href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness/${partyId}"><span>Emergency</span></a></div>            
            <div class="category inactiveLink" id="loan_status"><a class="hit_area dcLoanStatusLink" href="${pageContext.request.contextPath}/partner/datacollection/loan-status/${partyId}"><span>Loan Status</span></a></div>
            <div class="category inactiveLink" id="succession_readiness"><a class="hit_area dcSuccessionReadinessLink" href="${pageContext.request.contextPath}/partner/datacollection/succession-readiness/${partyId}"><span>Succession Readiness</span></a></div>
          </div>
          <div class="future_finacial">
            <div class="heading fl clearfix">
              <div class="head_thumb fl"><span></span></div>
              <p class="fr">Future Financial Expectations</p>
            </div>
            <div class="clr"></div>
            <div class="category" id="wedding"><a class="hit_area dcWeddingGoalLink" href="${pageContext.request.contextPath}/futureFinancialDc/wedding-goal/${partyId}"><span>Wedding</span></a></div>
            <div class="category" id="education"><a class="hit_area dcEducationGoalLink" href="${pageContext.request.contextPath}/futureFinancialDc/educational-goal/${partyId}"><span>Education</span></a></div>
            <div class="category" id="buisness"><a class="hit_area dcBusinessGoalLink" href="${pageContext.request.contextPath}/futureFinancialDc/business-goal/${partyId}"><span>Business</span></a></div>
            <div class="category" id="car"><a class="hit_area dcPurchaseACarLink" href="${pageContext.request.contextPath}/futureFinancialDc/car-goal/${partyId}"><span>Car</span></a></div>
            <div class="category" id="travel"><a class="hit_area dcTravelAndVacationsLink" href="${pageContext.request.contextPath}/futureFinancialDc/travel-vacation-goal/${partyId}"><span>Travel</span></a></div>
            <div class="category" id="others"><a class="hit_area dcOtherGoalLink" href="${pageContext.request.contextPath}/futureFinancialDc/other-goal/${partyId}"><span>Others</span></a></div>
            <div class="category" id="corpus"><a class="hit_area dcTargetCorpusGoalLink" href="${pageContext.request.contextPath}/futureFinancialDc/target-corpus-goal/${partyId}"><span>Target Corpus</span></a></div>
            <div class="category" id="spcial_goal"><a class="hit_area dcSpecialGoalLink" href="${pageContext.request.contextPath}/futureFinancialDc/special-goal/${partyId}"><span>Parental</span></a></div>
            <div class="category" id="property"><a class="hit_area dcPurchaseAPropertyGoalLink" href="${pageContext.request.contextPath}/futureFinancialDc/property-goal/${partyId}"><span>Property</span></a></div>
          </div>
          <div class="clr"></div>
          <div class="actions">
            <div class="action_parent">
              <ul class="reset clearfix">
                <li><a href="${pageContext.request.contextPath}/whatIf/graph/${partyId}" class="what_if foot_links dcWhatIfLink"><span class="txt">What If</span></a></li>
                <li><a href="${pageContext.request.contextPath}/partner/report/generate-report/${partyId}" class="report foot_links dcGenerateReportLink"><span class="txt">Generate Report</span></a></li>
              </ul>
            </div>
          </div>
          <span style="margin-top: 10px;">Note:- Do not add a retirement planning goal, as it has been taken up as by default goal.</span>
        </div>
      </section>
      <div class="overlay"></div>
    </section>
    <div class="clr"></div>
    <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
<script>
$(document).ready(function(){
	
	var rbsLinks = "${rbsLinks}";
	var pieces = rbsLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
		}
	}
	
    $('.wrapper').attr('id', 'data_collection_parent');
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

	var attrValue = '${fpSection}';
	var result = attrValue.split(",");
	for(var i=0; i<result.length;++i)
	{
		var value = result[i];
		if(value == 39001){
			$("#emergency").removeClass('inactiveLink');
		}
		else if(value == 39003){
			$("#risk_cover").removeClass('inactiveLink');
		}
		else if(value == 39007){
			$("#succession_readiness").removeClass('inactiveLink');
		}
		else if(value == 39008){
			$("#loan_status").removeClass('inactiveLink');
		}
			
	}
    
	});
	
function alertMessage(msg)
{
 $("#dialog1").html(msg);
 $( "#dialog1").dialog( "open" );
}

</script>
