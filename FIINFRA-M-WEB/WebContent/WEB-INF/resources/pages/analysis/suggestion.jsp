<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.theme_color{ font-size: 17px;}
</style>
<div class="wrapper"> 
  <!-- Main starts--> 
  <!--section class="main"-->   
  <!-- Common_content Starts-->
  <section class="content common_content">
	<%-- <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> --%>
    <!-- Common_in_contnet starts-->
        
    <c:if test="${error}">
    	<div class="error">
    		<c:out value="${error}"></c:out>
    	</div>
    </c:if>
    
    
    <div class="clr"></div>
    
    <!-- Common_content Starts-->
    <section class="content common_content" id="suggestion_bx"> 
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix" id="suggestion">
        <div class="common_suggestion">
		
		<c:choose>			
			<c:when test="${suggestionDetails.datafor eq 'ER'}">
				<c:choose>
					<c:when test="${suggestionDetails.noOfMonthsWoIncome < 6 }">
						<!-- upto 6 months starts-->
						<div id="emergency_readiness_upto6" class="emergency_readiness_sugesstion northspace1">
						  <p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion" </span>:</p>
						  <div class="reset clearfix">
						    <div>Your current monthly expenses are about <span class="theme_color val">${suggestionDetails.monthlyExpence}</span> and your monthly EMI is  <span class="theme_color val">${suggestionDetails.monthlyEmi}</span></div>
						    <div>You have mentioned that you can manage without an income for <span class="theme_color val">${suggestionDetails.noOfMonthsWoIncome}</span> months.</div>
						    <div>We suggest you to have a Contingency fund for <span class="theme_color val">${suggestionDetails.minEmergencyNoOfMonths}</span> months of your living expenses i.e 
						      <span class="theme_color val">${suggestionDetails.minimumEmergncyFund}</span></div>
						    <div>You can keep this money in following instruments:-
						      <ol>
						        <div>Savings Bank Account.</div>
						        <div>Fixed Deposits.</div>
						        <div>Ultra Short Term Debt Fund.</div>
						      </ol>
						    </div>
						  </div>
						  <p>And importantly hold the investments jointly with someone close and whom you can trust.</p>
						</div>
						<!-- upto 6 months ends--> 
					</c:when>
					<c:otherwise>
						<!-- above 6 months starts-->
						<div id="emergency_readiness_above6" class="emergency_readiness_sugesstion northspace1">
						  <p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion" </span>:</p>
						  <div class="reset clearfix">
						    <div>Your current monthly expenses are about <span class="theme_color val">${suggestionDetails.monthlyExpence}</span> and your monthly EMI is  <span class="theme_color val">${suggestionDetails.monthlyEmi}</span></div>
						    <div>You have mentioned that you can manage without an income for <span class="theme_color val">${suggestionDetails.noOfMonthsWoIncome}</span> months, which makes you adequately prepared for any emergency.</div>
						    <div>We suggest you to have a Contingency fund for  <span class="theme_color val">${suggestionDetails.minEmergencyNoOfMonths}</span> months of your living expenses i.e 
						      <span class="theme_color val">${suggestionDetails.minimumEmergncyFund}</span></div>
						    <div>You can keep this money in following instruments:-
						      <ol>
						        <div>Savings Bank Account.</div>
						        <div>Fixed Deposits.</div>
						        <div>Ultra Short Term Debt Fund.</div>
						      </ol>
						    </div>
						  </div>
						  <p>And importantly hold the investments jointly with someone close and whom you can trust.</p>
						</div>
						<!-- above 6 months ends--> 
					</c:otherwise>
				</c:choose>
			</c:when>
			
			<c:when test="${suggestionDetails.datafor eq 'RC'}">
				<!--Genral Risk Cover Starts -->
	         <div id="risk_cover_sugesstion" class="northspace1">		            		                
		            <p class="spc_heading"><span class="strong theme_color">Our Suggestion </span>: </p><div class="toggle_help"></div>
		            <div class="specifc_help"><div>
		              <div>
		                <p>Life Insurance required (Using <b class="strong">${suggestionDetails.goalName}</b> Method) : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color">${suggestionDetails.lifeIdealCover} lacs</span></p>
		                <p>Life Insurance available : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color">${suggestionDetails.lifeCurrentCover} lacs</span></p>
		                <c:choose>
		                	<c:when test="${suggestionDetails.lifeIdealCover - suggestionDetails.lifeCurrentCover <= 0}">
		                		<p class="strong">ADDITIONAL LIFE INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color">0.00 lacs</span> </p>
		                		(You have adequate life insurance coverage.)<p></p>
		                	</c:when>
		                	<c:otherwise>
		                		<p class="strong">ADDITIONAL LIFE INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${suggestionDetails.lifeIdealCover - suggestionDetails.lifeCurrentCover}"/>lacs</span> </p>
		                	</c:otherwise>
		                </c:choose>
		                <br/>
		              </div>
		              <div>
		                <p>Health insurance required : <span class="strong theme_color">${suggestionDetails.healthIdealCover} lacs</span></p>
		                <p>Health insurance available :<span class="strong theme_color">${suggestionDetails.healthCurrentCover} lacs</span></p>
		                <c:choose>
		                	<c:when test="${suggestionDetails.healthIdealCover - suggestionDetails.healthCurrentCover <= 0}">
		                		<p class="strong">ADDITIONAL LIFE INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color">0.00 lacs</span> </p>
		                		(You have adequate health insurance coverage.)<p></p>
		                	</c:when>
		                	<c:otherwise>
		                		<p class="strong">ADDITIONAL HEALTH INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${suggestionDetails.healthIdealCover - suggestionDetails.healthCurrentCover}"/>lacs</span></p>
		                	</c:otherwise>
		                </c:choose> 
		                <br/>              
		              </div>
		              <div>
		                <p>Critical illness insurance required : <span class="strong theme_color">${suggestionDetails.criticalIdealCover} lacs</span></p>
		                <p>Critical illness insurance available :<span class="strong theme_color">${suggestionDetails.criticalCurrentCover} lacs</span></p>
		                <c:choose>
		                	<c:when test="${suggestionDetails.criticalIdealCover - suggestionDetails.criticalCurrentCover <= 0}">
		                		<p class="strong">ADDITIONAL CRITICAL ILLNESS INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color">0.00 lacs</span></p>
		                		(You have adequate critical illness insurance coverage.)<p></p>
		                	</c:when>
		                	<c:otherwise>
		                		<p class="strong">ADDITIONAL CRITICAL ILLNESS INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${suggestionDetails.criticalIdealCover - suggestionDetails.criticalCurrentCover}"/>lacs</span></p>		                		
		                	</c:otherwise>
		                </c:choose>
		                <br/>                
		              </div>
		              <div>
		                <p>Accident insurance required : <span class="strong theme_color">${suggestionDetails.accidentIdealCover} lacs</span></p>
		                <p>Accident insurance available :<span class="strong theme_color">${suggestionDetails.accidentCurrentCover} lacs</span></p>
		                <c:choose>
		                	<c:when test="${suggestionDetails.accidentIdealCover - suggestionDetails.accidentCurrentCover <= 0}">		                		
		                		<p class="strong">ADDITIONAL ACCIDENT INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color">0.00 lacs</span></p>
		                		(You have adequate accident insurance coverage.)<p></p>
		                	</c:when>
		                	<c:otherwise>
		                		<p class="strong">ADDITIONAL ACCIDENT INSURANCE NEEDED : <img src="${_cdn}/assets/images/common-images/rupee-symbol_small.png" alt="Rs"/> <span class="strong theme_color"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${suggestionDetails.accidentIdealCover - suggestionDetails.accidentCurrentCover}"/>lacs</span></p>		                		
		                	</c:otherwise>
		                </c:choose>		                
		              </div>		              
		            </div></div>
                    <div class="standard_help hide northspace2"><p class="southspace1"> Determination of ideal <span class="theme_color strong">life insurance</span> cover is calculated based on Income Replacement Method which takes into account your annual income, your age and expected year of retirement.</p> 
                <p class="southspace1">Recommended <span class="theme_color strong">Health Insurance</span> is based on dependent individuals in the family</p> 
                
                <p class="southspace1"><span class="theme_color strong">Critical Illness</span> cover is in proportion to your Annual Income and so is the <span class="theme_color strong">Accidental Disability</span> cover.</p></div>
	          </div> 
            <!--Genral Risk Cover Ends -->
            
         	<!-- Risk Cover Sugesstion Ends --> 
			</c:when>
			
			<c:when test="${suggestionDetails.datafor eq 'RP'}">
				<fmt:parseNumber var="retirementPlanningUpTo" type="number" value="${suggestionDetails.retirementPlanningUpTo}" />
	          	<!-- Retirement Goal Sugesstion Starts -->
	          	<c:choose>
	          		<c:when test="${retirementPlanningUpTo <= '99' }">
	          			<!-- Goal Upto 80% Starts --> 
				        <div id="retirement_upto_80" class="retirement_goal northspace1">
							<p>You can bridge this gap by investing <span class="theme_color val">${suggestionDetails.regularInvest}</span> regularly (or) Invest a lumpsum amount of <span class="theme_color val">${suggestionDetails.lumpsum}</span> one time in investments that earn 10 percent returns.</p>
							
							<c:if test="${not empty (suggestionDetails.suggestionList)}">
								<table border="2" align="center">
									<th>Start Year</th>
									<th>Regular Investment Amount Required</th>
									<th>Lumpsum Amount Required</th>
									<c:forEach items="${suggestionDetails.suggestionList}" var="suggestionList">
										<tr>
											<td align="center">${suggestionList.productName}</td>
											<td align="center">${suggestionList.minSipAmount}</td>
											<td align="center">${suggestiondivst.minLumpSumAmount}</td>
										</tr>
									</c:forEach>
								</table>
							</c:if>
							<p class="strong">You can consider :</p>
							<div>
								<div>reducing your expenses after retirement</div>
								<div>liquidating some investments to provide cashflows</div>
								<div>options like reverse mortgage / community living etc</div>
							</div>
							<p>Things to be taken care while investing your retirement corpus are safety, easy accessibility, smooth cashflows, operational ease and tax efficiency.</p>
						</div>
						<!-- Goal Upto 80% Ends -->
	          		</c:when>
	          		
	          		<c:when test="${retirementPlanningUpTo > '99' }">
	          			<!-- Goal above 100% Starts --> 
				        <div id="retirement_above_100" class="retirement_goal northspace1">
							<p>Your goal of Retirement in the year <span class="theme_color val">${suggestionDetails.goalYear}</span> can be achieved comfortably with the assets you have and with the investments you are doing.</p>  
				          	<p><strong>You can do the following to do better</strong> : -</p>  
							<div>
								<div>Reallocate assets to reduce risks and improve returns</div>
								<div>Regularly rebalance portfolio</div>
								<div>Improve chances of achieving goals by moving assets to safer and easily en-cashable investments as the goals get closer.</div>
							</div>                             
							<p>Things to be taken care while investing your retirement corpus are safety, easy accessibility, smooth cashflows, operational ease and tax efficiency.</p>
				         </div>
				         <!-- Goal above 100% Ends -->
	          		</c:when>	          		
	          		<c:otherwise>
		          		<!-- Retirement Planning Suggestion Starts -->
				      	<div id="retirement_planning_suggestion" class="northspace1">
				            <p><span class="strong theme_color">Suggestions: </span>You may fall short the amount you need for retirement by <span class="theme_color val">&lt;&lt;Amount of shortfall&gt;&gt;</span> Invest - Rs.<span class="theme_color val">28344</span>/- every month (or) Rs.<span class="theme_color val">31,41,906</span> one time</p>
				            <br/>
				            <p><span class="strong theme_color"> Consider : </span></p>
				            <div>
				              	<div>Reducing expenses after retirement</div>
				              	<div>Liquidating some investments</div>
				              	<div>Options like reverse mortgage / community living etc</div>
				            </div>
				        </div> 
			          	<!-- Retirement Planning Suggestion Ends --> 
	          		</c:otherwise>
	          	</c:choose>
	          	<!-- Retirement Goal Sugesstion Goal Sugesstion Ends --> 
	          	
			</c:when>
			
			<c:when test="${suggestionDetails.datafor eq 'SR'}">
				<!-- Succession Rediness Suggestion Starts-->
	          	<div id="succession_rediness_suggestion" class="northspace1">
		            <p><span class="strong theme_color">Our Suggestion :</span> Succession Planning is good as Risk planning.Both plan for the well being of your loved ones if things don't go too well.You can legally transfer assets through</p>
		            <div>
		              <div>Appropriate nominations</div>
		              <div>Through property written will</div>
		              <div>By creating trusts</div>
		              <div>By giving away as Gifts</div>
		            </div>
		            <p>Do it today.Do it for those you love. Do it for peace-today and tomorrow.</p>
	          	</div>
	          <!-- Succession Rediness Suggestion Ends -->
          	</c:when>
          	
			<c:when test="${suggestionDetails.datafor eq 'LS'}">
			<fmt:parseNumber var="loanEmiPercent" type="number" value="${suggestionDetails.loanEmiPercent}" />
			<fmt:parseNumber var="loanInFuture" type="number" value="${suggestionDetails.loanInFuture}" />
				
	          	<c:choose>
	          	<c:when test="${suggestionDetails.age < 35 }">
	          		<c:choose>
	          			<c:when test="${loanEmiPercent > 50 }">
	          				<!-- Loan Percentage > 50% Age < 35% Starts -->
					           <div id="lp_gt_50" class="loan_suggestion northspace1">
					            <p><span class="strong theme_color">Our Suggestion</span> :</p>
					            <p>Your loan commitments are higher than normally comfortable.</p> 
					            <p class="strong">You can :</p> 
					             	<div>
										<div>Consider consolidating your loans by taking a larger lower cost loan and repay the higher cost loans </div>
						            	<div>Extend the tenure of loan for a short while, to handle cashflows better </div>
						             	<div>Negotiate good deals and repay some loans if possible </div>
						             	<div>Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management services for customised help.</div>
									</div>
					          </div>
				           <!-- Loan Percentage > 50% Age < 35% Ends -->
	          			</c:when>
	          			<c:otherwise>
	          				<!-- Loan Percentage < 50% Age < 35% Starts -->
				           	<div id="lp_lt_50" class="loan_suggestion northspace1">
					            <p><span class="strong theme_color">Our Suggestion</span> :</p>
					            <p>Your loan commitments seem within normal limits. However getting out of loans sooner can release cashflows that can be used for other beneficial purposes.</p> 
					            <p class="strong">You can :</p> 
					            <div>
									<div>Consider consolidating your loans by taking a larger lower cost loan and repay the higher cost loans</div>
					            	<div>Extend the tenure of loan for a short while, to handle cashflows better</div>
					             	<div>Negotiate good deals and repay some loans if possible</div>
					             	<div>Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management services for customised help</div>
								</div>
				          	</div>				
				          	<!-- Loan Percentage < 50% Age < 35% Ends -->
	          			</c:otherwise>
	          		</c:choose>
	          	</c:when>
	          	<c:otherwise>
	          		<c:choose>
	          			<c:when test="${loanEmiPercent < 35 } ">
				          	<!-- Loan Percentage < 35% Age > 35 Starts -->
				           	<div id="lp_lt_35" class="loan_suggestion northspace1 ">
					            <p><span class="strong theme_color">Our Suggestion</span> :</p>
					            <p>Your loan commitments seem within normal limits. However getting out of loans sooner can release cashflows that can be used for other beneficial purposes.</p> 
					            <p class="strong">You can :</p> 
					             <div>
									<div>Consider consolidating your loans by taking a larger lower cost loan and repay the higher cost loans</div>
					            	<div>Extend the tenure of loan for a short while, to handle cashflows better</div>
					             	<div>Negotiate good deals and repay some loans if possible</div>
					             	<div>Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management services for customised help.</div>
								</div>
				          	</div>				
							<!-- Loan Percentage < 35% Age > 35 Ends -->
	          			</c:when>
	          			<c:otherwise>
	          				<!-- Loan Percentage > 35% Age > 35 Starts -->
				           	<div id="lp_gt_35" class="loan_suggestion northspace1">
					            <p><span class="strong theme_color">Our Suggestion</span> :</p>
					            <p>Your loan commitments are higher than normally comfortable.</p> 
					            <p class="strong">You can :</p> 
				             	<div>
									<div>Consider consolidating your loans by taking a larger lower cost loan and repay the higher cost loans</div>
				            		<div>Extend the tenure of loan for a short while, to handle cashflows better</div>
				             		<div>Negotiate good deals and repay some loans if possible</div>
				             		<div>Follow debt repayment plans like debt snowballing etc to get out of debt. Subscribe to our debt management services for customised help.</div>
								</div>
				          	</div>				
							<!-- Loan Percentage > 35% Age > 35% Ends -->
	          			</c:otherwise>
	          		</c:choose>
	          	</c:otherwise> 
	       	</c:choose>    		
	       			
			<c:choose>
	        	<c:when test="${loanInFuture eq 1}">
	        		<!-- Future Loan Yes Starts -->
			        <div id="f_loan_yes" class="loan_suggestion northspace1 ">
						<p>If you are looking at taking any loans in future, you should get your credit rating checked. A good credit score will ensure you get good deals on new loans. In the future, even post paid telephone connections will need good credit scores. Employers check credit scores before offering jobs to new employees.</p>
					</div>
					<!-- Future Loan Yes Ends -->
          		</c:when>
          		<c:otherwise>
		          	<!-- No Existing And Future Loan Starts -->
			        <div id="no_cf_loan" class="loan_suggestion northspace1 ">
						<p>Even though you are not planning to take new loans, get your credit rating checked. A good credit score will ensure you get good deals on new loans.  In the future, even post paid telephone connections will need good credit scores. Employers check credit scores before offering jobs to new employees.</p>
					</div>
					<!-- No Existing And Future Loan Ends -->	
          		</c:otherwise>          			          		          	
	       </c:choose>
			
			</c:when>
		
			<c:when test="${suggestionDetails.datafor eq 'CF'}">
			<!-- Cash Flow Sugesstion Starts -->
	        <div id="cash_flow_suggestion" class="northspace1">
	            <table class="cf_table">
	              <tr>
	                <th>Details</th>
	                <th>Amount in Rs. (per month)</th>
	              </tr>
	              <tr>
	                <td>Your Income </td>
	                <td class="centerAll theme_color">50000</td>
	              </tr>
	              <tr>
	                <td>Your Expenses </td>
	                <td class="centerAll theme_color">30000</td>
	              </tr>
	              <tr>
	                <td>Your Loan Repayment </td>
	                <td class="centerAll theme_color">5000</td>
	              </tr>
	              <tr>
	                <td>Your current investments </td>
	                <td class="centerAll theme_color">10000 </td>
	              </tr>
	            </table>
	            <br/>
	            <br/>
	            <div class="result_desc">
	              <p>NET SURPLUS AVAILABLE - Rs. <span  class="val theme_color">10000</span></p>
	              <p>TO MEET YOUR GOALS - ADDITIONAL INVESTMENT REQUIRED - Rs.<span  class="val theme_color">10000</span> </p>
	              <br/>
	              <br/>
	            </div>
	            <p><span class="theme_color strong">Our Suggestion</span> :
	              Do a detailed cash flow plan , Invest surplus in a planned manner</p>
	          </div> 
	          <!-- Cash Flow Sugesstion Ends --> 
			</c:when>
		</c:choose>
		
		
 
          <!-- Common Goal Sugesstion Starts -->
          <div id="common_goal_suggestion" class="northspace1 hide">
            <p>With current assets and investments you can achieve   (%) of your <span class="theme_color val">&lt;&lt;Goal&gt;&gt;</span> in the year
              <span class="theme_color val">&lt;&lt;year&gt;&gt;</span></p>
            <br/>
            <p><span class="strong theme_color">Suggested action </span>:</p>
            <div>
              <div>Align the investments to the goal and keep in separate investment accounts. </div>
              <div>Reallocate assets to optimize risk and returns</div>
              <div>Regularly rebalance portfolio</div>
              <div>As goals get nearer, move assets to safer avenues like liquid funds / bank accounts</div>
            </div>
          </div>
          <!-- Common Goal Sugesstion Ends --> 
         
          <!-- Retirement Goal Sugesstion Starts -->
          <div id="retirement_goal_sugesstion" class="northspace1 hide">
            <p>With current assets and investments you can achieve   (%) of your <span class="theme_color val">&lt;&lt;</span><span class="theme_color val">Goal&gt;&gt;</span> in the year <span class="theme_color val">&lt;&lt;</span><span class="theme_color val">year&gt;&gt;</span> </p>
            <br/>
            <p><span class="strong theme_color">Suggested action </span>:</p>
            <div>
	              <div>Invest - Rs.<span class="theme_color val">28344</span>/- every month (or) Rs.<span class="theme_color val">31,41,906</span> one time</div>
	              <div>Also..</div>
	              <div>Align the investments to the goal and keep in separate investment accounts</div>
	              <div>Reallocate assets to optimize risk and returns</div>
	              <div>Regularly rebalance portfolio</div>
	              <div>As goals get nearer, move assets to safer avenues like liquid funds / bank accounts</div>
            </div>
          </div>
          <!-- Retirement Goal Sugesstion Ends --> 
         
         <!-- Genral Goal Sugesstion Starts -->
         <!-- Goal Upto 80% Starts --> 
          <div id="goal_upto_80" class="genral_goal_suggestion northspace1 hide">
            <p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion"</span>:</p>
			<p>Your goal of  <span class="theme_color val">Goal name</span> in the year <span class="theme_color val"> Year of Goal</span> cannot be achieved with the assets you have and with the investments you are doing.</p> <p><strong>You can do the following to do better</strong> : - Invest an amount of <span class="theme_color val">PMT </span> regularly (or) Invest a lumpsum amount of <span class="theme_color val">PV</span>  one time - You can consider postponing the goal if possible - If the goal ils very important, you may have to borrow to meet the goal.</p>
          </div>
         <!-- Goal Upto 80% Ends -->
         
         <!-- Goal Upto 100% Starts -->
          <div id="goal_upto_100" class="genral_goal_suggestion northspace1 hide">
          	<p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion"</span>:</p>
			<p>"Your goal of <span class="theme_color val">Goal name</span> in the year <span class="theme_color val">Year of Goal</span> can be somewhat achieved with the assets you have and with the investments you are doing.</p>
			<p><strong> You can do the following to do better</strong> : - Invest an amount of <span class="theme_color val">PMT</span>regularly (or) Invest a lumpsum amount of <span class="theme_color val">PV </span>one time - Align the investments to the goal and keep in separate a/cs. For eg: Investments for children can be made in their name or in separate folio with the child as the nominee</p>
			<div>
				<div>Reallocate assets to reduce risks and improve returns</div>
				<div>Regularly rebalance portfolio</div>
				<div>Improve chances of achieving goals by moving assets to safer and easily en-cashable investments as the goals get closer</div>
			</div>
			</p>
            
          </div>
          <!-- Goal Upto 100% Ends -->
         
          <!-- Goal above 100% Starts --> 
          <div id="goal_above_100" class="genral_goal_suggestion northspace1 hide">
            <p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion"</span>:</p>
			<p>Your goal of <span class="theme_color val">Goal name</span> in the year <span class="theme_color val">Year of Goal</span> can be somewhat achieved with the assets you have and with the investments you are doing.</p>
			<p><strong> You can do the following to do better</strong> : - Align the investments to the goal and keep in separate a/cs. For eg: Investments for children can be made in their name or in separate folio with the child as the nominee</p>
			<ul>
				<div>Reallocate assets to reduce risks and improve returns</div>
				<div>Regularly rebalance portfolio</div>
				<div>Improve chances of achieving goals by moving assets to safer and easily en-cashable investments as the goals get closer</div>
			</ul>
			</p>
          </div>
          <!-- Goal above 100% Ends -->
          
          <!-- Genral Goal Sugesstion Ends --> 
        
         <!-- Travel and Vacation Goal Sugesstion Starts -->
          <!-- Goal Upto 80% Starts --> 
          <div id="tv_goal_upto_80" class="travel_vacation_goal northspace1 hide">
            <p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion"</span>:</p>
			<p>Your goal of <span class="theme_color val">Goal name</span> in the year <span class="theme_color val">Year of Goal<span class="theme_color val"> cannot be achieved with the assets you have and with the investments you are doing.</p> <p><strong>You can do the following to do better</strong> : - We can plan your yearly vacation in following ways:</p>
   			<ol>
			   <div>Invest Rs.<span class="theme_color val">PMT</span>every month in a bank recurring deposit or liquid fund OR</div>
			   <div>Keep the annual bonus/profit in the bank and spend it when you go on vacation OR</div>
			   <div>A time share property can be bought.</div>			   
   			</ol>
   			<p>This will ensure that lodging facilities when you go on holidays is taken care of and the costs are protected from inflation for the next <span class="theme_color val">25</span> years. The property are usually well maintained and in popular holiday destinations. The costs can be - down payment of approx. Rs.<span class="theme_color val">20,000</span> to Rs.<span class="theme_color val">40,000</span>, a <span class="theme_color val">48</span> month EMI of approx. Rs.<span class="theme_color val">5,000</span> to Rs.<span class="theme_color val">10,000</span>  (depending on size and timing of holidays) and annual maintenance cost of approx. Rs.<span class="theme_color val">10,000</span> to <span class="theme_color val">15,000</span>. There are interesting and economical options here which you can consider.</p>
          </div>
		<!-- Goal Upto 80% Ends -->
         
        <!-- Goal Upto 100% Starts -->
        	<div id="tv_goal_upto_100" class="travel_vacation_goal northspace1 hide">
            <p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion"</span>:</p>
			<p>Your goal of <span class="theme_color val">Goal name</span> in the year <span class="theme_color val">Year of Goal</span> can be somewhat achieved with the assets you have and with the investments you are doing.</p>
			<p><strong> You can do the following to do better</strong> : - We can plan your yearly vacation in following ways:</p>
			<div>
				<div>Invest Rs. <span class="theme_color val">PMT </span>every month in a bank recurring deposit or liquid fund OR</div>
				<div>Keep the annual bonus/profit in the bank and spend it when you go on vacation OR</div>
				<div>A time share property can be bought.</div>
			</div>
			<p>This will ensure that lodging facilities when you go on holidays is taken care of and the costs are protected from inflation for the next <span class="theme_color val">25</span> years. The property are usually well maintained and in popular holiday destinations. The costs can be - down payment of approx. Rs.<span class="theme_color val">20,000</span> to Rs.<span class="theme_color val">40,000</span>, a <span class="theme_color val">48</span> month EMI of approx. Rs.<span class="theme_color val">5,000</span> to Rs.<span class="theme_color val">10,000</span>  (depending on size and timing of holidays) and annual maintenance cost of approx. Rs.<span class="theme_color val">10,000</span> to <span class="theme_color val">15,000</span>. There are interesting and economical options here which you can consider.</p>            
          </div>
          <!-- Goal Upto 100% Ends -->
         
          <!-- Goal above 100% Starts --> 
          	<div id="goal_above_100" class="genral_goal_suggestion northspace1 hide">
				<p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion"</span>:</p>
				<p>Your goal of <span class="theme_color val">Goal name</span> in the year <span class="theme_color val">Year of Goal</span> can be comfortably achieved with the assets you have and with the investments you are doing. </p>
				<p><strong> You can do the following to do better</strong> : - We can plan your yearly vacation in following ways:</p>
				<div>
					<div>Invest Rs.<span class="theme_color val">PMT</span>every month in a bank recurring deposit or liquid fund OR</div>
					<div>Keep the annual bonus/profit in the bank and spend it when you go on vacation OR</div>
					<div>A time share property can be bought.</div>
				</div>
				<p>This will ensure that lodging facilities when you go on holidays is taken care of and the costs are protected from inflation for the next <span class="theme_color val">25</span> years. The property are usually well maintained and in popular holiday destinations. The costs can be - down payment of approx. Rs.<span class="theme_color val">20,000</span> to <span class="theme_color val">Rs.40,000</span>, a <span class="theme_color val">48</span> month EMI of approx. Rs.<span class="theme_color val">5,000</span> to Rs.<span class="theme_color val">10,000</span> (depending on size and timing of holidays) and annual maintenance cost of approx. Rs.<span class="theme_color val">10,000</span> to <span class="theme_color val">15,000</span>. There are interesting and economical options here which you can consider.</p>
          </div>
          <!-- Goal above 100% Ends -->
          
          <!-- Travel and Vacation Goal Sugesstion Ends --> 
                 
          <!-- Risk Cover Sugesstion Starts --> 
          <!--Life Insurance Starts -->
          <div id="rc_life_insurance" class="northspace1 insurance_suggestion hide">
            <p class="centerAll"><span class="strong theme_color"> Life Insurance</span></p>
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Life Insurance</td>
                <td class="centerAll"> 8,000,000 </td>
                <td class="centerAll"> 50,000,000 </td>
                <td class="centerAll negative_result">42,000</td>
              </tr>
            </table>
            
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Life Insurance</td>
                <td class="centerAll"> 8,000,000 </td>
                <td class="centerAll"> 3,000,000 </td>
                <td class="centerAll positive_result">42,000</td>
              </tr>
            </table>
          </div>
           <!-- Life Insurance Ends -->
           
            <!--Health Insurance Starts -->
          <div id="rc_health_insurance" class="northspace1 insurance_suggestion hide">
            <p class="centerAll"><span class="strong theme_color"> Health Insurance</span></p>
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Health Insurance</td>
                <td class="centerAll"> 500,000 </td>
                <td class="centerAll"> 1,000,000 </td>
                <td class="centerAll negative_result"> 500,000</td>
              </tr>
            </table>
            
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Health Insurance</td>
                <td class="centerAll">500,000</td>
                <td class="centerAll">200,000 </td>
                <td class="centerAll positive_result">300,000</td>
              </tr>
            </table>
          </div>
           <!-- Health Insurance Ends -->
           
            <!--Perosnal Accident Starts -->
          <div id="rc_personal_accident" class="northspace1 insurance_suggestion hide">
            <p class="centerAll"><span class="strong theme_color"> Personal Accident</span></p>
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Personal Accident</td>
                <td class="centerAll"> 1,000,000 </td>
                <td class="centerAll"> 800,000 </td>
                <td class="centerAll negative_result"> 200,000</td>
              </tr>
            </table>
            
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Personal Accident</td>
                <td class="centerAll">1,000,000</td>
                <td class="centerAll">1,500,000 </td>
                <td class="centerAll positive_result">500,000</td>
              </tr>
            </table>
          </div>
           <!-- Perosnal Accident Ends -->
           
              <!--Critical illness Starts -->
          <div id="rc_Critical_illness" class="northspace1 insurance_suggestion hide">
            <p class="centerAll"><span class="strong theme_color">Critical illness</span></p>
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Critical illness</td>
                <td class="centerAll"> 2,000,000 </td>
                <td class="centerAll"> 1,000,000 </td>
                <td class="centerAll negative_result"> 1,000,000</td>
              </tr>
            </table>
            
            <table class="insurance_table hide">
              <tr>
                <th></th>
                <th>Required Insurance </th>
                <th>Current Insurance </th>
                <th>Additional Insurance Requirement / Adequate Insurance</th>
              </tr>
              <tr>
                <td class="centerAll">Critical illness</td>
                <td class="centerAll">2,000,000</td>
                <td class="centerAll">2,500,000 </td>
                <td class="centerAll positive_result">500,000</td>
              </tr>
            </table>
          </div>
           <!-- Critical illness Ends -->
            
            
        
             
		<!-- Cash Flow Starts-->  
        <div id="cash_flow_suggestion" class="northspace1 cash_flow_suggestion hide">            
            <table class="cfs_table scene1 hide">
              <tr>
              <th>Particulars</th>
                <th>Amount</th>
              </tr>
              <tr>
                <td>Income</td>
                <td class="centerAll theme_color"><< Income >></td>
              </tr>
              <tr>
                <td>Expense</td>
                <td class="centerAll theme_color"><< Expense >></td>
              </tr>
              <tr>
                <td>Loan EMI</td>
                <td class="centerAll theme_color"><< EMI >></td>
              </tr>
              <tr>
                <td>Cash Surplus/Deficit</td>
                <td class="centerAll"></td>
              </tr>
            </table>
            <p class="centerAll">By reducing expenses or increasing income your surplus will improve</p>
          	<p class="centerAll hide">Your Current Investment will help you achieve all your goals.</p>
            <table class="cfs_table scene2 hide">
              <tr>
              <th>Particulars</th>
                <th>Amount</th>
              </tr>
              <tr>
                <td>Income</td>
                <td class="centerAll theme_color"><< Income >></td>
              </tr>
              <tr>
                <td>Expense</td>
                <td class="centerAll theme_color"><< Expense >></td>
              </tr>
              <tr>
                <td>Loan EMI</td>
                <td class="centerAll theme_color"><< EMI >></td>
              </tr>
              <tr>
                <td>Cash Surplus/Deficit</td>
                <td class="centerAll"></td>
              </tr>
            </table>
           	<p class="centerAll">By reducing expenses or increasing income your surplus will improve</p>
            	<p class="centerAll hide">If you invest your surplus in a planned manner your dreams and goals can become reality!</p>        
		</div>         
		<!-- Cash Flow Ends -->  
          
		
        </div>
      </section>
      
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <div class="reset clearfix fr btn_grup3">
            <li class="fl list inactiveLink"><a href="data-collection.html" class="anch save"><span class="txt">Save</span></a></div>
            <li class="fl list"><a href="#" onClick="cancelPage('${pageContext.request.contextPath}${parentPageUrl}')" class="anch cancel"><span class="txt">Cancel</span></a></div>
            <li class="fl list inactiveLink"><a href="financial-readiness.html" class="anch skip"><span class="txt">Skip</span></a></div>
          </div>
          <div class="reset clearfix fr btn_grup2">
            <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></div>
 <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></div>
          </div>
          <div class="reset clearfix fl btn_grup1">
          	<c:choose>
          		<c:when test="${screen eq 'retirement-planning' }">
          			<li class="fl list"><a href="${pageContext.request.contextPath}/analysis/retirement/${partyId}/39006?returnUrl=${returnUrl}" class="anch analysis"><span class="txt">Analysis</span></a></div>
          		</c:when>
          		<c:otherwise>
          			<li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/${screen}-analysis/${partyId}?returnUrl=${returnUrl}" class="anch analysis"><span class="txt">Analysis</span></a></div>
          		</c:otherwise>
          	</c:choose>            
            <li class="fl list"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></div>
            
            <c:choose>
            	<c:when test="${screen eq 'emergency-readiness' or screen eq 'risk-cover'}">
            		<li class="fl list"><a href="${pageContext.request.contextPath}/actionplan/${screen}-action-plan/${partyId}?returnUrl=${returnUrl}" class="anch action_plan"><span class="txt">Action Plan</span></a></div>
            	</c:when>
            	<c:otherwise>
            		<li class="fl list inactiveLink"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></div>
            	</c:otherwise>
            </c:choose>
            
          </div>
        </div>
        <a href="#" class="back navgation inactiveLink"><span class="txt">Back</span></a> <a href="#" class="next navgation inactiveLink"><span class="txt">Next</span></a></section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>

<script>
function cancelPage(url) {
	var returnUrl = '${returnUrl}';
	if(returnUrl != null && returnUrl!='') {
		window.location.href = returnUrl;
	} else {
		window.location.href = url;
	}
}

$(document).ready(function(){
 $('#suggestion').slimScroll();
   $(".common_suggestion #risk_cover_sugesstion .toggle_help").click(function(){
	$(".common_suggestion #risk_cover_sugesstion .specifc_help").fadeToggle("slow");
	$(".common_suggestion #risk_cover_sugesstion .standard_help").fadeToggle("slow");
	$(".common_suggestion #risk_cover_sugesstion .toggle_help").animate("slow").toggleClass("back");
  });
 
 	if('${screen}' == "emergency-readiness"){
 		$(".head_txt").text("Emergency Readiness Suggestion");
 		$("title").text("Emergency Readiness Suggestion - Profile Data Collection");
 	} else if('${screen}' == "risk-cover"){
 		$(".head_txt").text("Risk Cover Suggestion");
 		$("title").text("Risk Cover Suggestion - Profile Data Collection");
 	} else if('${screen}' == "retirement-planning"){
 		$(".head_txt").text("Retirement Planning Suggestion");
 		$("title").text("Retirement Planning Suggestion - Profile Data Collection");
 	} else if('${screen}' == "succession-readiness"){
 		$(".head_txt").text("Succession Readiness Suggestion");
 		$("title").text("Succession Readiness Suggestion - Profile Data Collection");
 	} else if('${screen}' == "loan-status"){
 		$(".head_txt").text("Loan Status Suggestion");
 		$("title").text("Loan Status Suggestion - Profile Data Collection");
 	} 
}); 
</script>
