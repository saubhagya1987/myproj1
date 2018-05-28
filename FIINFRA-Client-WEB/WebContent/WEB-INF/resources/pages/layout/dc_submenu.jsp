

<div class="combined_submenu clearfix">
	<div class="partner_dashboard_submenu">		
		<jsp:include page="submenu_small.jsp"></jsp:include>		
	</div>
	<div class="dc_dashboard_submenu">
		<h4 class="heading">
			<a href="${pageContext.request.contextPath}/partner/datacollection/${partyId}/${headerName}/2">Data Collection Dashboard</a>
		</h4>
		<ul class="clearfix reset first_col_menu">
			<li class="menu cash_flow">
				<a href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Cash Flow</span></a>
			</li>
			<li class="menu financial">
				<a href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Financial</span></a>
			</li>
			<li class="menu risk_cover">
				<a href="${pageContext.request.contextPath}/partner/datacollection/risk-cover/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Risk Cover</span></a>
			</li>
			<li class="menu loan_status">
				<a href="${pageContext.request.contextPath}/partner/datacollection/loan-status/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Loan Status</span></a>
			</li>
			<li class="menu emergency">
				<a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Emergency</span></a>				
			</li>	
			<li class="menu retirement">
				<a href="${pageContext.request.contextPath}/partner/datacollection/retirement-planning/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Retirement</span></a>
			</li>
			<li class="menu succession">
				<a href="${pageContext.request.contextPath}/partner/datacollection/succession-readiness/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Succession</span></a>
			</li>						
			<li class="menu last clearfix">
				<a href="${pageContext.request.contextPath}/partner/profile/${partyId}/${headerName}" class="anch personal_info"><span class="thumb"></span><span class="txt">Personal Info.</span></a> 
				<a href="${pageContext.request.contextPath}/riskProfile/datacollection/risk-profile/${partyId}" class="anch risk_profile"><span class="thumb"></span><span class="txt">Risk Profile</span></a> 
				<a href="${pageContext.request.contextPath}/futureFinancialDc/getMyGoals/${partyId}" class="anch my_goals"><span class="thumb"></span><span class="txt">My Goals</span></a>
			</li>
		</ul>

		<ul class="clearfix reset sec_col_menu">
			<li class="menu education">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/educational-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Education</span></a>
			</li>
			<li class="menu property">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/property-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Property</span></a>
			</li>
			<li class="menu wedding">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/wedding-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Wedding</span></a>
			</li>
			<li class="menu car">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/car-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Car</span></a>
			</li>
			<li class="menu travel">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/travel-vacation-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Travel</span></a>
			</li>
			<li class="menu business">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/business-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Business</span></a>
			</li>
			<li class="menu special_goal">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/special-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Special Goal</span></a>
			</li>
			<li class="menu other">
				<a href="${pageContext.request.contextPath}/futureFinancialDc/other-goal/${partyId}" class="anch"><span class="thumb"></span><span class="txt">Other Goal</span></a>
			</li>
            <li class="menu last clearfix">
				<a href="${pageContext.request.contextPath}/whatIf/graph/${partyId}" class="anch what_if"><span class="thumb"></span><span class="txt">What If</span></a> 
				<a href="${pageContext.request.contextPath}/partner/report/generate-report/${partyId}" class="anch genrate_report"><span class="thumb"></span><span class="txt">Generate Report</span></a> 
				
			</li>
		</ul>
		<div class="clr"></div>
	</div>
	<div class="contact_configuration_submenu">
		<h4 class="heading">
			<a>Contact Configuration</a>
		</h4>
		<div class="menu_section">
			<ul class="clearfix reset ">
				<li class="menu coantact_setting">
					<a href="${pageContext.request.contextPath}/partner/assumption?partyId=${partyId}" class="anch"><span class="thumb"></span><span class="txt">Contact Assumptions</span></a>
				</li>
				<!-- <li class="menu contact_rec"><a href="#" class="anch">
					<span class="thumb"></span><span class="txt"> Contact Recommendations</span></a>
				</li> -->

			</ul>
		</div>
	</div>
</div>