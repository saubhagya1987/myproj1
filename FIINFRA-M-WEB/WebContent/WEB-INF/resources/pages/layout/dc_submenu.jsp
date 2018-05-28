<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
$(document).ready(function(){
	var attrValue = '${fpSection}';
	var result = attrValue.split(",");
	for(var i=0; i<result.length;++i)
	{
		var value = result[i];
		if(value == 39001){
			$("#emer").removeClass('inactiveLink');
			}
		else if(value == 39003){
			$("#risk").removeClass('inactiveLink');
		}
		else if(value == 39007){
			$("#succession").removeClass('inactiveLink');
		}
		else if(value == 39008){
			$("#loan").removeClass('inactiveLink');
		} 
			
	} 
});

</script>

		
<%-- 		<jsp:include page="submenu_small.jsp"></jsp:include>		 --%>
	
	
		<h4 class="heading">
			<a href="${pageContext.request.contextPath}/partner/datacollection/${partyId}/${headerName}/2">Financial Plan Dashboard</a>
		</h4>
		<ul class="clearfix reset first_col_menu">
			<li class="menu cash_flow">
				<a href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}" class="anch dcCashFlowLink"><span class="thumb"></span><span class="txt">Cash Flow</span></a>
			</li>
			<li class="menu financial">
				<c:choose>
					<c:when test="${userSession.planTypeId eq '522001'}">
						<a href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness/${partyId}" class="anch dcGoalReadinessLink"><span class="thumb"></span><span class="txt">Goal Readiness</span></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness/${partyId}" class="anch dcGoalReadinessLink"><span class="thumb"></span><span class="txt" style="font-size:11px !important;">Asset Management</span></a>
					</c:otherwise>
				</c:choose>
			</li>
			<li class="menu risk_cover inactiveLink" id="risk">
				<c:choose>
					<c:when test="${userSession.planTypeId eq '522001'}">
						<a href="${pageContext.request.contextPath}/partner/datacollection/risk-cover/${partyId}" class="anch dcRiskCoverLink"><span class="thumb"></span><span class="txt">Risk Cover</span></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/generalInsurance/${partyId}" class="anch dcRiskCoverLink"><span class="thumb"></span><span class="txt" style="font-size: 12px !important;">Risk Management</span></a>
					</c:otherwise>
				</c:choose>
			</li>
			<li class="menu loan_status inactiveLink" id="loan">
				<a href="${pageContext.request.contextPath}/partner/datacollection/loan-status/${partyId}" class="anch dcLoanStatusLink"><span class="thumb"></span><span class="txt">Loan Status</span></a>
			</li>
			<li class="menu emergency inactiveLink" id="emer">
				<a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness/${partyId}" class="anch dcEmergencyReadinessLink"><span class="thumb"></span><span class="txt">Emergency</span></a>				
			</li>	
			<li class="menu retirement">
				<a href="${pageContext.request.contextPath}/partner/datacollection/retirement-planning/${partyId}" class="anch dcRetirementPlanningLink"><span class="thumb"></span><span class="txt">Retirement</span></a>
			</li>
			<li class="menu succession inactiveLink" id="succession">
				<a href="${pageContext.request.contextPath}/partner/datacollection/succession-readiness/${partyId}" class="anch dcSuccessionReadinessLink"><span class="thumb"></span><span class="txt">Succession</span></a>
			</li>
            <li class="menu empty_menu"></li>
            <li class="menu empty_menu_two"></li>						
			<li class="menu last clearfix">
				<a href="${pageContext.request.contextPath}/partner/profile/${partyId}/${headerName}" class="anch personal_info dcPersonalInformationLink"><span class="thumb"></span><span class="txt">Personal Info.</span></a> 
				<a href="${pageContext.request.contextPath}/riskProfile/datacollection/risk-profile/${partyId}" class="anch risk_profile dcRiskProfileLink"><span class="thumb"></span><span class="txt">Risk Profile</span></a> 
				<a href="${pageContext.request.contextPath}/futureFinancialDc/getMyGoals/${partyId}" class="anch my_goals dcMyGoalsLink"><span class="thumb"></span><span class="txt">My Goals</span></a>
			</li>
		</ul>

		<ul class="clearfix reset sec_col_menu">
			<li class="menu education">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/educational-goal/${partyId}" class="anch dcEducationGoalLink"><span class="thumb"></span><span class="txt">Education</span></a>
			</li>
			<li class="menu property">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/property-goal/${partyId}" class="anch dcPurchaseAPropertyGoalLink"><span class="thumb"></span><span class="txt">Property</span></a>
			</li>
			<li class="menu wedding">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/wedding-goal/${partyId}" class="anch dcWeddingGoalLink"><span class="thumb"></span><span class="txt">Wedding</span></a>
			</li>
			<li class="menu car">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/car-goal/${partyId}" class="anch dcPurchaseACarLink"><span class="thumb"></span><span class="txt">Car</span></a>
			</li>
			<li class="menu travel">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/travel-vacation-goal/${partyId}" class="anch dcTravelAndVacationsLink"><span class="thumb"></span><span class="txt">Travel</span></a>
			</li>
			<li class="menu business">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/business-goal/${partyId}" class="anch dcBusinessGoalLink"><span class="thumb"></span><span class="txt">Business</span></a>
			</li>
			<li class="menu special_goal">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/special-goal/${partyId}" class="anch dcSpecialGoalLink"><span class="thumb"></span><span class="txt">Parental</span></a>
			</li>
			<li class="menu corpus">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/target-corpus-goal/${partyId}" class="anch dcOtherGoalLink"><span class="thumb"></span><span class="txt">Target Corpus</span></a>
			</li>
			<li class="menu other">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/other-goal/${partyId}" class="anch dcOtherGoalLink"><span class="thumb"></span><span class="txt">Other Goal</span></a>
			</li>
         			
            <li class="menu last clearfix">
				<a href="${pageContext.request.contextPath}/whatIf/graph/${partyId}" class="anch what_if dcWhatIfLink"><span class="thumb"></span><span class="txt">What If</span></a>
				<a href="${pageContext.request.contextPath}/partner/report/generate-report/${partyId}" class="anch genrate_report dcGenerateReportLink"><span class="thumb"></span><span class="txt">Generate Report</span></a>
			</li>
		</ul>
		
	
	
		<h4 class="heading">
			<a>Contact Configuration</a>
		</h4>
	
			<ul class="clearfix reset ">
				<li class="menu coantact_setting">
					<a href="${pageContext.request.contextPath}/partner/assumption?partyId=${partyId}" class="anch dcContactAssumptionsLink"><span class="thumb"></span><span class="txt">Contact Assumptions</span></a>
				</li>
                <li class="menu interested_fp_config">
					<a href="${pageContext.request.contextPath}/partner/getInterstedFpSection?clientPartyId=${partyId}" class="anch dcContactFpSectionLink"><span class="thumb"></span><span class="txt">Client FP Section</span></a>
				</li>
				<!-- <li class="menu contact_rec"><a href="#" class="anch">
					<span class="thumb"></span><span class="txt"> Contact Recommendations</span></a>
				</li> -->

			</ul>
		
	

<script>
$(document).ready(function(){
	
	var rbsLinks = "${dcMenuLinks}";
	var pieces = rbsLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
		}
	}
});
</script>