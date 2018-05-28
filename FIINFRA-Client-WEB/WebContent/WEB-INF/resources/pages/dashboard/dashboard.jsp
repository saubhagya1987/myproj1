<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<% 
UserSession user = AuthHandler.getCurrentUser();
boolean dcLocked = !user.isDcActivated();
boolean xrayLocked = !user.isXrayActivated();

%>


<div class="row">
              <div class="col-md-3">
            <div class="infobox infobox-blue">
                  <div class="infobox-icon"> <i class="ace-icon fa icon-cashflow"></i> </div>
                  <div class="infobox-data"> <span class="infobox-data-number">My Cashflow</span> 
                <!--<div class="infobox-content">comments + 2 reviews</div>--> 
              </div>
                  
                  <!-- #section:pages/dashboard.infobox.stat --> 
                  <!--<div class="surplus-border"></div>-->
                  <div class="surplus blue">
                <div class="p">
                      <div class="title">Surplus</div>
                      <!-- <i class="fa fa-inr fa-lg"></i> -->
                      <div class="amt" id="savings"></div>
                    </div>
              </div>
                  <!--<div class="stat stat-success">8%</div>--> 
                  
                  <!-- /section:pages/dashboard.infobox.stat -->
                  <div style="margin-top:10px; clear: both; overflow: hidden;">
                <div class="income">
                      <div class="title"> Income </div>
                      <i class="fa fa-inr fa-lg"></i><span class="amt" id="incomeAmount"></span>  </div>
                <div class="expense">
                      <div class="title"> Expense </div>
                      <i class="fa fa-inr fa-lg"></i><span class="amt" id="expenseAmount"></span> </div>
              </div>
                  <a href="${pageContext.request.contextPath}/financial/myIncome"> <i class="manage"></i> <span class="txt">Manage</span> </a> </div>
          </div>
              <div class="col-md-3">
            <div class="infobox infobox-blue">
                  <div class="infobox-icon"> <i class="ace-icon fa icon-my-portfolio"></i> </div>
                  <div class="infobox-data"> <span class="infobox-data-number">My Assets</span> 
                <!--<div class="infobox-content">comments + 2 reviews</div>--> 
              </div>
                  
                  <!-- #section:pages/dashboard.infobox.stat --> 
                  <!--<div class="surplus-border"></div>-->
                  <div class="surplus">
                <div class="p">
                      <div class="title">Networth</div>
                     <!-- <i class="fa fa-inr fa-lg"></i> -->
                      <div class="amt" id="networth"></div>
                     
                    </div>
              </div>
                  <!--<div class="stat stat-success">8%</div>--> 
                  
                  <!-- /section:pages/dashboard.infobox.stat -->
                  <div style="margin-top:10px; clear: both; overflow: hidden;">
                <div class="income">
                      <div class="title"> Assets </div>
                      <i class="fa fa-inr fa-lg"></i> <span class="assets-amt" id="assets"></span> </div>
                <div class="expense">
                      <div class="title"> Liabilities </div>
                     <i class="fa fa-inr fa-lg"></i><span class="assets-amt" id="loan"></span>  </div>
              </div>
                  <a href="${pageContext.request.contextPath}/portfolio/myAssets"> <i class="manage"></i> <span class="txt">Manage</span> </a> </div>
          </div>
              <div class="col-md-3">
            <div class="infobox infobox-blue">
                  <div class="infobox-icon"> <i class="ace-icon fa icon-my-goals"></i> </div>
                  <div class="infobox-data"> <span class="infobox-data-number">My Goals</span> 
                <!--<div class="infobox-content">comments + 2 reviews</div>--> 
              </div>
                  
                  <!-- #section:pages/dashboard.infobox.stat --> 
                  <!--<div class="surplus-border"></div>--> 
                  
                  <!--<div class="stat stat-success">8%</div>--> 
                  
                  <!-- /section:pages/dashboard.infobox.stat -->
                  <div style="margin-top:10px; clear: both; overflow: hidden;">
                <div class="income">
                      <div class="title"> No of Goals </div>
                      <span class="mygoal-amt" id="NumberOfGoals"></span></div>
                <div class="expense">
                      <div class="title"> AUM </div>
                     <i class="fa fa-inr fa-lg"></i><span class="mygoal-amt" id="amount"></span>  </div>
              </div>
                  <a href="${pageContext.request.contextPath}/portfolio/myGoals"> <i class="manage"></i> <span class="txt">Manage</span> </a> </div>
          </div>

             <div class="col-md-3">
            <div class="infobox infobox-blue">
                  <div class="infobox-icon"> <i class="ace-icon fa fa-umbrella"></i> </div>
                  <div class="infobox-data"> <span class="infobox-data-number">My Insurance</span> 
                <!--<div class="infobox-content">comments + 2 reviews</div>--> 
              </div>

                  <!-- #section:pages/dashboard.infobox.stat --> 
                  <!--<div class="surplus-border"></div>--> 
				
                  <!--<div class="stat stat-success">8%</div>--> 

                  <!-- /section:pages/dashboard.infobox.stat -->
                  <div style="margin-top:10px; clear: both; overflow: hidden;">
                <div class="income">
                      <div class="title"> Personal </div>
                     <i class="fa fa-inr fa-lg"></i> <span class="ins-amt">6</span> <span class="lac">lacs</span> </div>
                <div class="expense">
                      <div class="title"> Family </div>
                      <i class="fa fa-inr fa-lg"></i> <span class="ins-amt">4</span> <span class="lac">lacs</span> </div>
              </div>
                  <a href="#"> <i class="manage"></i> <span class="txt">Manage</span> </a> </div>
          </div>
            </div>


	<div id="shadow1" class="clearfix fl"></div>
	<!-- end of "shadow1" id -->
     <div class="row">
         <div class="col-xs-12 col-md-4" >
                                <div class="space"></div> 
          <div class="widget-box" >
           <!-- #section:custom/widget-box.header.options -->
         

           <!-- /section:custom/widget-box.header.options -->
           <div class="widget-body">
            <a href="${pageContext.request.contextPath}/partner/datacollection">
            <div class="widget-main big-tools">
             <p class="alert alert-info"><i class="ace-icon fa fa-database bigger-200" >  </i><span style='margin-left:30px;'><%if(!dcLocked){%> <span data-tooltip aria-haspopup="true" class="has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to input FPT ">Financial Planning Tool</span> <%}else { %>Financial Planning Tool<%} %></span> </p>
             </a><br/>
             <div class="col-xs-12">
                    <div class="col-xs-9">
                          <p class="">Your advisor has given you access to the Financial Planning tool.</p>
     </div>
     <div class="col-xs-3">
                                <%if(!dcLocked){%>
                                <button  class="btn btn-app btn-inverse btn-xs" style="width: 40px ;"> <i class="ace-icon fa fa-unlock bigger-160"></i> </button>
                                 <%}else { %>
                                 <button  class="btn btn-app btn-inverse btn-xs" style="width: 40px ;"><i class="ace-icon fa fa-lock bigger-160"></i></button> 
         <%} %>
     </div>
    </div>
            
                                              
                                     
                                     
            </div><br/><br/>
            
           <div class="widget-main big-tools">
					<p class="alert alert-info">
						<i class="ace-icon fa icon-x-ray bigger-200"> </i><span
							style='margin-left: 30px;'>
							<%
								if (xrayLocked) {
							%> <a
							href="${pageContext.request.contextPath}/question/xray"><span
								data-tooltip aria-haspopup="true"
								class="has-tip [tip-top tip-bottom tip-left tip-right] [radius round]"
								data-options="show_on:large" title="Click here to Add XRAY "><b>X-
										Ray Tool</b></span></a>
							<%}else{ %>X- Ray Tool<%} %>
						</span>
					</p>
					<div class="col-xs-12">
                    <div class="col-xs-9">
                          <p class="">Your advisor has given you access to the X-Ray tool.  This tool will help you analyse your financial.... </p>
     </div>
     <div class="col-xs-3">
                                             <%if(xrayLocked){%>
                                              <button  class="btn btn-app btn-inverse btn-xs" style="width: 40px ;"> <i class="ace-icon fa fa-unlock bigger-160"></i> </button>
                                             <%}else{%>
                                                <button  class="btn btn-app btn-inverse btn-xs" style="width: 40px ;"><i class="ace-icon fa fa-lock bigger-160"></i></button> <%} %>                                             
                             </div>
    </div>      
            </div><br/><br/><br/>
           </div>
          </div>
         </div>
              <%-- <div class="col-md-8">
            <div class="space"></div>
            <div id="parentVerticalTab">
                  <ul class="resp-tabs-list hor_1">
                <li> <a data-toggle="tab" href="#home3"> <i class="ace-icon fa  fa-area-chart bigger-150"></i> Earning / Expense </a> </li>
                <li> <a data-toggle="tab" href="#profile3"> <i class="ace-icon fa fa-money bigger-150"></i> Total Networth </a> </li>
                <li> <a data-toggle="tab" href="#dropdown13"> <i class="ace-icon fa fa-pie-chart bigger-150"></i> Goals </a> </li>
                <li> <a data-toggle="tab" href="#dropdown13"> <i class="ace-icon fa fa-angellist bigger-150"></i> Achievement Scale </a> </li>
              </ul>
                  <div class="resp-tabs-container hor_1">
                <div> 
                      <div class="col-md-5 col-xs-12">
						<div id="earning-expense-big"></div>
						<div id="earning-expense-small"></div>
					</div>
					<!-- Earning/Expenses data start -->
					<div class="image clearfix fl" id="earning_expenses1">
						<div id="savingGraph"
							class="earning_expenses_piechart clearfix fl"
							style="margin-top: -10px; margin-left: -80px">
                  </div>
                      
						<!-- <!-- <div class="my_earnings clearfix fl">
							<div class="my_earnings_icon align_icon clearfix"></div>
							<div class="my_earnings_txt clearfix">My Saving</div>
							<div class="my_earnings_rs clearfix">
								<span class="my_earnings_rs_cost"><label
									id="incomeAmount"></label> </span><span id="my_earnings_rs_unit"
									class="my_earnings_rs_unit">yr</span>
							</div>
						</div> -->
						-->
						
						<div class="color-legends clearfix fl">
							<div class="earning-legend clearfix fl"></div>
							<span>My Earnings</span> <br>
							<div class="expense-legend clearfix fl"></div>
							<span>My Expenses</span>
						</div>

						<!-- <div class="separator clearfix fl"></div> -->

						<!-- <div  class="goal_piechart clearfix fl" style="width: 560px"></div> -->
						<div id="earningExpensesGraph"
							class="earning_expenses_linechart clearfix fl"
							style="margin-top: -50px; margin-left: -170px">
							
						</div>
						<p class="details fr">
							<a href="${pageContext.request.contextPath}/financial/savings">Details...</a>
						</p>
					</div>
					<!-- Earning/Expenses data End -->
                      <div class="col-md-12 col-xs-12">
						<div id="earning-expense-age-big"></div>
						<div id="earning-expense-age-small"></div>
                  </div>

                    </div>
                
                

				<div>
				<div class="row">
                      <div class="col-md-6 col-xs-12">
                    <div id="networth-asset-big" ></div>
                    <div id="networth-asset-small" ></div>
                  </div>
                  <!-- chart -->
						<div class="image clearfix fl" id="networth1">
							<div class="tn_own clearfix fl" id="assetData">
								<div id="assetGraph" class="goal_piechart clearfix fl"
									style="margin-top: -10px; margin-left: -40px; width: 100%;">
								</div>
								<!-- <div class="i_owe clearfix fr">
									<p class="title">I OWN</p>
									<p class="amount" id="networth_asset_amount"></p>
								</div> -->
							</div>
							<!-- end of tn_own -->

							<!-- <div class="separator clearfix fl"></div> -->

							<!-- <div class="tn_owe clearfix fl" id="loanData"> -->
								<!-- <div class="i_own clearfix fl">
									<p class="title">I OWE</p>
									<p class="amount" id="networth_loan_amount"></p>
								</div> -->
								<div id="loanGraph" class="goal_piechart clearfix fl"
									style="margin-top: -250px; margin-left: 250px"></div>
							<!-- </div> -->
							<!-- end of tn_owe -->
							<p class="pull-right">
								<a href="${pageContext.request.contextPath}/portfolio/myAssets">Details...</a>
							</p>

							<!-- div id = "loanGraph" class="goal_piechart clearfix fl"></div-->
						</div>
						<!-- chart -->
                      <div class="col-md-6 col-xs-12">
                    <div id="networth-loan-big" ></div>
                    <div id="networth-loan-small" ></div>
                  </div>
                     
                    </div>
                </div>
                
                
                <div>
                <div class="row">
                      <div class="col-md-7 col-xs-12 text-center">
                    <div id="piechart" ></div>
                    <div id="piechart02" ></div>
                    <div id="piechart-placeholder"></div> 
                  </div>
                  <div id = "goalGraph" class="goal_piechart clearfix fl" style="margin-top:-40px ;margin-left:-30px">
                  </div>
                    <div class="col-md-5 fr">
                    <div class="tab-bx-cnt">
                          <div class="title">Goal Achived</div>
                          <!-- <span class="rs"><span class="WebRupee">RS</span></span> <span id="goalAchivedAmount" class="amt"></span> <span class="lac">lacs</span> -->
								<span class="amt" id="achievedGoals">0</span>
								<span class="amt">/</span> 
								<span class="amt" id="totalGoals">0</span>
							</div>
                    <div class="tab-bx-cnt">
                          <div class="title">Upcoming Goals</div>
                          <div class="goal-title" id="upcomingGoalTitle"></div>
                          <!-- <div class="goal-yr" id="upcomingGoalYear"></div> -->
								
                        </div>
                    <!-- <div class="tab-bx-cnt">
                          <div class="title">Assets Under Management</div>
                          <span class="rs"><span class="WebRupee">RS</span></span> <span class="amt">32</span> <span class="lac">lacs</span> 
                     </div>  -->
                    <div class="tab-bx-cnt">
                          <div class="title">Assets Under Management</div>
									<span id="goalPercentage" class="goal-title"> You are<span
										class="amt" id="closerPercentage"> X </span><span>%</span>
										close to <label id="achievableGoals"></label> more goals
									</span>
								</div>   
                   <!--  <div class="tab-bx-cnt-two">
                          <div class="title">Last Goal Completion</div>
                          <div class="goal-title" id="lastGoalComplition"></div>
                          <div class="goal-yr">2014</div>
                        </div> -->
                    <a href="${pageContext.request.contextPath}/portfolio/myGoals" class="pull-right">Details...</a>
                     </div>
                    <div class="image clearfix fl azaxslides" id="goals1" >
	    
            
            <!-- <div class="goal_txt clearfix fr" style="width: 50%;margin-top: 20px ;margin-right: 0px ;">
                <p style="margin-right: 20px "><span class="title_txt_width clearfix fl">Goal Achieved :- </span> <span class="achived_goals" id="achivedGoals1">&nbsp; <label id="achievedGoals"></label></span><span class="slash"> /</span><span class="total_goals" id="totalGoals"> </span></p>
                <p style="margin-right: 20px "><span id="goalPercentage" class="title_txt_width clearfix fl">You are  <span class="closer_percentage" id="closerPercentage"> X </span><span> % </span> close to <label id="achievableGoals"></label> more goals </span></p>
     			<p style="margin-right: 20px "><span class="title_txt_width clearfix fl">In discussions <span>invest </span><span class="invest" ><label id="invest"></label></span>additional <span>per month</span></span></p>
            </div> --><!-- end of "goal_txt" -->
            <p class="details clearfix fr"><a href="${pageContext.request.contextPath}/portfolio/myGoals">Details...</a></p>
                        </div>
                    </div>
  </div>                
                
                <div>
                      <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                          <h5> Overall Scale</h5>
                          <!-- <div id="overAllScall" class="progress progress-striped pos-rel" data-percent="66%">
                        <div class="progress-bar progress-bar-purple" style="width: 66%"></div>
                      </div> -->
                      <div id="overAllScale1" class="progress pos-rel" data-percent="">
                        <div id="overAllScallWidth" class="progress-bar">
                        </div>
                      </div>
                        </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 text-center">


                    <div class="row">
								<div class="col-md-6">
									<h3>Goals</h3>
									<!-- <h5 class="smaller red">Go for it !</h5>
									<span>You are 70% closer to your dream goal</span> -->
									<div id="goal_condition75" class="condition75"><p class="smaller red">Congratulations !</p><p>You are almost there. You are <span class="completion"> </span> closer to your dream goal</p></div>
                    				<div id="goal_condition50" class="condition50"><p class="smaller red">Go for it !</p><p>You are <span class="completion"> </span>&nbsp;closer to your dream goal</p></div>
                    				<div id="goal_condition25" class="condition25"><p>You have taken first step.</p></div>
								</div>
								<div class="col-md-6">
									<h3>Risk</h3>
									<!-- <h5 class="smaller red">Go for it !</h5>
									<span>You are in control of all possible adversities</span> -->
									<div id="risk_condition75" class="condition75"><p class="smaller red">Congratulations !</p><p>You are fully protected against all risks</p></div>
                    				<div id="risk_condition50" class="condition50"><p class="smaller red">Go for it !</p><p>You are in control of all possible adversities</p></div>
                    				<div id="risk_condition25" class="condition25"><p class="smaller red">Watchout !</p><p>A bit more precaution can help you to manage unforeseen risk</p></div>
                          </div>
                          </div>
                          
                          </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                       <div class="row">
                          <div class="col-md-4">
                              <div class="family_invest_yes"></div>
									<div class="fam_inv align"><div class="family_invest_no" id="family_invest"></div><p id = "family_invest_text" >Your family don't know where you have invested your money.</p></div>
                      </div>
                          <div class="col-md-4">
                              <div class="family_access_money_yes"></div>
									<div class="fam_inv align"><div class="family_access_money_no" id="family_access_money"></div><p id="family_access_text" >Your family don't have access to your money.</p></div>
                      </div>
                          <div class="col-md-4">
                              <div class="family_will_no"></div>
									<div class="fam_inv align"><div class="family_will_no" id="family_will"></div><p id="family_will_text">You have not written will. You must!</p></div>
                      </div>
								
                				
               					
                        </div>
                        <a href="" class="pull-right">Goal Details</a>
                  </div>
                    </div></div>
              </div>
                </div>
            
                      
                    </div> --%>
                    <div class="space"></div>
                   
                    <!-- NEW GRAPH START -->
                    
<div class="col-md-8">
	<!-- #section:elements.tab.option -->
	<div class="tabbable">
		<ul class="nav nav-tabs padding-12 tab-color-blue background-blue"
			id="myTab4">
			<li class="active"><a data-toggle="tab" href="#home4"><i
					class="ace-icon fa  fa-area-chart bigger-150"></i> Earning /
					Expense </a></li>

			<li><a data-toggle="tab" href="#profile4"><i
					class="ace-icon fa fa-money bigger-150"></i> Total Networth </a></li>

			<li><a data-toggle="tab" href="#dropdown14"><i
					class="ace-icon fa fa-pie-chart bigger-150"></i> Goals </a></li>

			<li><a data-toggle="tab" href="#dropdown15"><i
					class="ace-icon fa fa-angellist bigger-150"></i> Achievement Scale
			</a></li>
		</ul>

		<div class="tab-content" >
			<div id="home4" class="tab-pane in active">
				
					<!-- Earning/Expenses data start -->
					<div class="col-md-12" id="earning_expenses1">
	
		<div class="row">
			<div class="col-md-5">
				<div id="savingGraph" class="earning_expenses_piechart fl" style="margin-top: -40px;"></div>
				<div class="color-legends clearfix fl">
					<div class="earning-legend clearfix fl"></div>
					<span>My Earnings</span> <br>
					<div class="expense-legend clearfix fl"></div>
					<span>My Expenses</span>
				</div>
			</div>
							<div class="col-md-1">
								<div class="center">
									<span class="label label-xlg label-primary">My Saving<br>
										<span id="incomeAmount1" class="badge"></span>
									</span>
								</div>
							</div>
							<div class="col-md-6">
				<div id="earningExpensesGraph" class="earning_expenses_linechart fl" style="margin-left: -25px;"></div>
			</div>
			<a href="${pageContext.request.contextPath}/financial/savings" class="fr">Details...</a>
		</div>
	
	
		
	
</div>
					<!-- Earning/Expenses data End -->
				</div>

			<div id="profile4" class="tab-pane">
				
				<div class="col-md-12" id="networth1">
	
	<div class="row">
		<div class="col-md-5">
		<div class="fl" id="assetData">
			<div id="assetGraph" class="goal_piechart fl" style="margin-top: -40px;"></div>
			 <!-- <div class="i_owe clearfix fr">
									<p class="title">I OWN</p>
									<p class="amount" id="networth_asset_amount"></p>
			</div> -->
			
		</div>
		</div>
		<!-- end of tn_own -->

		<!-- <div class="separator clearfix fl"></div> -->

		<!-- <div class="tn_owe clearfix fl" id="loanData"> -->
		<!-- <div class="i_own clearfix fl">
									<p class="title">I OWE</p>
									<p class="amount" id="networth_loan_amount"></p>
								</div> -->
	<div class="col-md-2">
								<div class="center">
									<span class="label label-xlg label-primary arrowed arrowed-right">I OWN | I OWE<br>
									<span id="networth_asset_amount" class="badge"></span><span id="networth_loan_amount" class="badge"></span></span>
								</div>
	</div>							
	<div class="col-md-5">							
		<div id="loanGraph" class="goal_piechart fl" style="margin-top: -40px;"></div>
		
	</div>
	<!-- </div> -->
	<!-- end of tn_owe -->
	<a href="${pageContext.request.contextPath}/portfolio/myAssets" class="fr">Details...</a>
</div>
	
		
	

	<!-- div id = "loanGraph" class="goal_piechart clearfix fl"></div-->
</div>
				
				<!-- chart -->
			</div>

			<div id="dropdown14" class="tab-pane">
				<!--  -->
				<div class="col-md-12">
	<div class="row">

<div class="col-md-6">
<div id="goalGraph" class="goal_piechart fl"
					style="margin-top: -40px;"></div>
</div>					
					
					
				<div class="col-md-6 fl">
					<div class="tab-bx-cnt">
						<span class="title">Goal Achived</span><br>
						<span class="amt" id="achievedGoals">0</span> <span class="amt">/</span>
						<span class="amt" id="totalGoals">0</span>
					</div>
					<div class="tab-bx-cnt">
						<div class="title">Upcoming Goals</div>
						<div class="goal-title" id="upcomingGoalTitle"></div>
						<!-- <div class="goal-yr" id="upcomingGoalYear"></div> -->

					</div>
					<!-- <div class="tab-bx-cnt">
                          <div class="title">Assets Under Management</div>
                          <span class="rs"><span class="WebRupee">RS</span></span> <span class="amt">32</span> <span class="lac">lacs</span> 
                     </div>  -->
					<div class="tab-bx-cnt">
						<div class="title">Assets Under Management</div>
						<span id="goalPercentage" class="goal-title"> You are<span
							class="amt" id="closerPercentage"> X </span><span>%</span> close
							to <label id="achievableGoals"></label> more goals
						</span>
					</div>
					<!--  <div class="tab-bx-cnt-two">
                          <div class="title">Last Goal Completion</div>
                          <div class="goal-title" id="lastGoalComplition"></div>
                          <div class="goal-yr">2014</div>
                       </div> -->
					
				</div>
				<a href="${pageContext.request.contextPath}/portfolio/myGoals"
						class="fr">Details...</a>
				
		</div>		
</div>				

			</div>

			<div id="dropdown15" class="tab-pane">
				<!--  -->
				<div>
				
					<div class="col-md-12 clearfix" style="top: -20px">
					
					<h5>Overall Scale</h5>
					<div id="overAllScale1" class="progress pos-rel" data-percent="">
						<div id="overAllScallWidth" class="progress-bar"></div>
					</div>
					
					</div>
					<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12 text-center clearfix">
					<div class="row">
					
						<div class="col-md-6 clearfix" style="top: -50px">
							<h3>Goals</h3>
							<!-- <h5 class="smaller red">Go for it !</h5>
									<span>You are 70% closer to your dream goal</span> -->
							<div id="goal_condition75" class="condition75">
								<p class="smaller red">Congratulations !</p>
								<p>
									You are almost there. You are closer to your dream goal
								</p>
							</div>
							<div id="goal_condition50" class="condition50">
								<p class="smaller red">Go for it !</p>
								<p>
									You are closer to your dream goal
								</p>
							</div>
							<div id="goal_condition25" class="condition25">
								<p>You have taken first step.</p>
							</div>
						</div>
						
						
						
						<div class="col-md-6 clearfix" style="top: -50px">
							<h3>Risk</h3>
							<!-- <h5 class="smaller red">Go for it !</h5>
									<span>You are in control of all possible adversities</span> -->
							<div id="risk_condition75" class="condition75">
								<p class="smaller red">Congratulations !</p>
								<p>You are fully protected against all risks</p>
							</div>
							<div id="risk_condition50" class="condition50">
								<p class="smaller red">Go for it !</p>
								<p>You are in control of all possible adversities</p>
							</div>
							<div id="risk_condition25" class="condition25">
								<p class="smaller red">Watchout !</p>
								<p>A bit more precaution can help you to manage unforeseen risk</p>
							</div>
						</div>
						
						
						
						<div class="col-md-12 col-sm-12 col-xs-12 text-center" style="top: -50px;">
				
						<div class="col-md-4 clearfix">
							
							<div class="fam_inv align">
								<div class="family_invest_no" id="family_invest"></div>
								<p id="family_invest_text">Your family don't know where you	have invested your money.</p>
							</div>
						</div>
						
						<div class="col-md-4 clearfix">
							
							<div class="fam_inv align">
								<div class="family_access_money_no" id="family_access_money"></div>
								<p id="family_access_text">Your family don't have access to
									your money.</p>
							</div>
						</div>
						
						<div class="col-md-4 clearfix">
							
							<div class="fam_inv align">
								<div class="family_will_no" id="family_will"></div>
								<p id="family_will_text">You have not written will. You
									must!</p>
							</div>
						</div>
						<a href="" class="fr">Goal Details</a>	
					</div>
				
					</div>
					</div>	
						
				</div>
				</div>
				<!--  -->
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- /section:elements.tab.option -->
</div>
                    
                    <!-- NEW GRAPH END -->
   
								 </div>
                          
                          
                      
      
	  <div class="row">
	  	<div id='gupshup'></div>
		<div id="testimonial"></div>
		 <div class="col-md-4">
            <div class="space"></div>
            
            <!-- #section:plugins/data-time.calendar -->
            <div id="calendar"></div>
            
            <!-- /section:plugins/data-time.calendar -->
            </div>
		    </div> 
		    <div class="row">
            <div id="videos"></div>
            </div>

		<!-- end of "bottom-box" class -->
	<!-- end of "bottom" id -->
 



<script type="text/javascript">
			jQuery(function($) {

/* initialize the external events
	-----------------------------------------------------------------*/

	$('#external-events div.external-event').each(function() {

		// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		// it doesn't need to have a start or end
		var eventObject = {
			title: $.trim($(this).text()) // use the element's text as the event title
		};

		// store the Event Object in the DOM element so we can get to it later
		$(this).data('eventObject', eventObject);

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});
		
	});




	/* initialize the calendar
	-----------------------------------------------------------------*/

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();


	var calendar = $('#calendar').fullCalendar({
		//isRTL: true,
		 buttonHtml: {
			prev: '<i class="ace-icon fa fa-chevron-left"></i>',
			next: '<i class="ace-icon fa fa-chevron-right"></i>'
		},
	
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		events: [
		  {
			title: 'Car EMI',
			start: new Date(y, m, 1),
			allDay: true,
			className: 'label-important'
		  },
		  {
			title: 'Meeting with IFA',
			start: moment().subtract(5, 'days').format('YYYY-MM-DD'),
			end: moment().subtract(1, 'days').format('YYYY-MM-DD'),
			className: 'label-success'
		  },
		  {
			title: 'Housing EMI',
			start: new Date(y, m, d-3, 16, 0),
			allDay: true,
			className: 'label-info'
		  }
		]
		,
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar !!!
		drop: function(date, allDay) { // this function is called when something is dropped
		
			// retrieve the dropped element's stored Event Object
			var originalEventObject = $(this).data('eventObject');
			var $extraEventClass = $(this).attr('data-class');
			
			
			// we need to copy it, so that multiple events don't have a reference to the same object
			var copiedEventObject = $.extend({}, originalEventObject);
			
			// assign it the date that was reported
			copiedEventObject.start = date;
			copiedEventObject.allDay = allDay;
			if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
			
			// render the event on the calendar
			// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
			$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
			
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
			
		}
		,
		selectable: true,
		selectHelper: true,
		select: function(start, end, allDay) {
			
			bootbox.prompt("New Event Title:", function(title) {
				if (title !== null) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay,
							className: 'label-info'
						},
						true // make the event "stick"
					);
				}
			});
			

			calendar.fullCalendar('unselect');
		}
		,
		eventClick: function(calEvent, jsEvent, view) {

			//display a modal
			/* var modal = 
			'<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				   <form class="no-margin">\
					  <label>Change event name &nbsp;</label>\
					  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
				   </form>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>'; */
		
		
			var modal = $(modal).appendTo('body');
			modal.find('form').on('submit', function(ev){
				ev.preventDefault();

				calEvent.title = $(this).find("input[type=text]").val();
				calendar.fullCalendar('updateEvent', calEvent);
				modal.modal("hide");
			});
			modal.find('button[data-action=delete]').on('click', function() {
				calendar.fullCalendar('removeEvents' , function(ev){
					return (ev._id == calEvent._id);
				})
				modal.modal("hide");
			});
			
			modal.modal('show').on('hidden', function(){
				modal.remove();
			});


			//console.log(calEvent.id);
			//console.log(jsEvent);
			//console.log(view);

			// change the border color just for fun
			//$(this).css('border-color', 'red');

		}
		
	});


})
		</script> 
<script>


	

$('#gupshup').load("${pageContext.request.contextPath}/profile/gupshup",
			function(response, status, xhr) {
				if (status == "error") {
					var msg = "Sorry but there was an error: ";
					$("#gupshup").html(msg + xhr.status + " " + xhr.statusText);
				}
});

$('#testimonial').load("${pageContext.request.contextPath}/profile/testimonial",
		function(response, status, xhr) {
			if (status == "error") {
				var msg = "Sorry but there was an error: ";
				$("#gupshup").html(msg + xhr.status + " " + xhr.statusText);
			}
});

$('#videos').load("${pageContext.request.contextPath}/profile/videos",
		function(response, status, xhr) {
			if (status == "error") {
				var msg = "Sorry but there was an error: ";
				$("#videos").html(msg + xhr.status + " " + xhr.statusText);
			}
});


 </script>
 <script type="text/javascript">
    $(document).ready(function() {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });

        // Child Tab
        $('#ChildVerticalTab_1').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true,
            tabidentify: 'ver_1', // The tab groups identifier
            activetab_bg: '#fff', // background color for active tabs in this group
            inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
            active_border_color: '#c1c1c1', // border color for active tabs heads in this group
            active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
        });

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script> 
 
<!-- End of "wrapper" id -->

	
	<!-- NEW SCRIPT ASJ -->
			<!-- circle start -->
<script>
	/* sc start */
	function showGoalChart(elementId, data) {
     var graphData = data[0];
     var goalData = data[1];
     var totalGoalAmount=data[2];
     var upComingGoals =data[3];
     var lastGoalComplited=data[4];
     var achievedGoalsCount=data[5];
     var achievableGoals=data[6];
     var regularInvestAmount=data[7];
     var closedPer = data[8];
     var totalGoal = data[9];
     $("#NumberOfGoals").html(data[9]);
     $("#amount").html(data[2]);
     if(graphData.length>1){
    	 
     $('#no-goal-data').hide();
     $("#achievedGoals").text(achievedGoalsCount);
     $("#totalGoals").text(totalGoal);
     $("#totalGoals").text(totalGoal);
     
     $("#achievableGoals").text(achievableGoals);
     $("#goalAchivedAmount").text(totalGoalAmount);
     $("#upcomingGoalTitle").text(upComingGoals);
     $("#lastGoalComplition").text(lastGoalComplited);
     if(closedPer>0){
     $("#closerPercentage").text(closedPer);
     }
     else{
    	$('#goalPercentage').text("No assets have been allocated for remaining goals.") ;
     }
     $("#invest").text(regularInvestAmount);
     var options = {
   	      
   	      backgroundColor: { fill:'transparent' },
   	   	  pieSliceText: 'none',
   	  		 height: 275,
	      width :350,
	      pieSliceText: 'percentage',
	      colors:GRAPH_COLORS
	      
   	    };
    showGooglePieChart('Goals',graphData,options,elementId);
	
     }
     else{
    	 
    	 $('#goals1').empty();
    	 $('#goals1').html('<div class="no_data_message">NO Goal Data</div>');
    	 
     }
 	
     }
	function showGoalChartGoogleAPI(elementId, data) {
		 
    var graphData = data[0];
    var goalData = data[1];
    
    
	  var chartData=[];
	  chartData[0] = [];
	  chartData[0][0] = 'Goal';
	  chartData[0][1] = 'Value';
		for(var i=1;i<graphData.length;i++){
			 chartData[i] = [];
			 chartData[i][0] = graphData[i].label;
			 chartData[i][1] = graphData[i].data;
			
			 
		 }
	  
 var graph = google.visualization.arrayToDataTable(chartData);

 var options = {
   title: '',
   backgroundColor: { fill:'transparent' },
   is3D: false,
   'legend':'left',
   /*legend:{position: 'top', textStyle: {color: 'blue', fontSize: 16},alignment:'start'},*/
   //chartArea:{top:0},
   colors:['red','#004411','blue','	black','#004211','#002411'],
   
	 
 };
				
 var chart = new google.visualization.PieChart(document.getElementById('goalGraph'));
 chart.draw(graph, options);
			}
	function showGoogleEarningLineChart(elementId, dataList){
	
	var data = google.visualization.arrayToDataTable(dataList);
	var options = {
	          title: 'Earning/Expenses',
	          height:250,
	          width:350,
	          
	          backgroundColor: { fill:'transparent' }
	 
	        };
	
	var chart = new google.visualization.LineChart(document.getElementById(elementId));
	chart.draw(data, options);
}
function showEarningExpensesChart(elementId, data,elementId2) {
	var savings = data[2];
	var income=data[3];
	var expense = data[4];
	$("#savings").html(savings);
	$("#incomeAmount").html(income);
	$("#expenseAmount").html(expense);	
	var color=['#3399FF','#FF4747']
	var savingsGraphData=data[1];
	var income=data[2];
	$("#incomeAmount1").text(income+' '+'yr');

	if(savingsGraphData[0].data >0 || savingsGraphData[1].data >0){
		
	//renderPieChart(elementId2, savingsGraphData, "Saving Graph");
	var options = {
    	      
    	      height: 275,
    	      width :300,
    	      backgroundColor: { fill:'transparent' },
    	      
    	     
    	      colors : color,
    	      legend: 'none',
    	        pieSliceText: 'percentage',

    	    };
     showGooglePieChart('Saving',savingsGraphData,options,elementId2);


     showGoogleEarningLineChart(elementId, data[0]);
	}
	else{
		$('#earning_expenses1').empty();
		$('#earning_expenses1').html('<div class="no_data_message">No income/expenses data</div>')

// 		$("#incomeAmount").text("");

		/* $("#incomeAmount").text(""); */

		$("#my_earnings_rs_unit").text("");
	}
	
 }
	function showGoalChartGoogleAPI(elementId, data) {
		 
	    var graphData = data[0];
	    var goalData = data[1];
	    
	    
		  var chartData=[];
		  chartData[0] = [];
		  chartData[0][0] = 'Goal';
		  chartData[0][1] = 'Value';
			for(var i=1;i<graphData.length;i++){
				 chartData[i] = [];
				 chartData[i][0] = graphData[i].label;
				 chartData[i][1] = graphData[i].data;
				
				 
			 }
		  
	 var graph = google.visualization.arrayToDataTable(chartData);

	 var options = {
	   title: '',
	   backgroundColor: { fill:'transparent' },
	   is3D: false,
	   'legend':'left',
	   /*legend:{position: 'top', textStyle: {color: 'blue', fontSize: 16},alignment:'start'},*/
	   //chartArea:{top:0},
	   colors:['red','#004411','blue','	black','#004211','#002411'],
	   
	   
	 };

	 var chart = new google.visualization.PieChart(document.getElementById('goalGraph'));
	 chart.draw(graph, options);
 }
	var totalLoan=0;
function showNetWorth(data){
   	 var assets=data[0];
   	 var loan=data[1];
   	$("#networth").html(data[4]);
   	$("#assets").html(data[3]);
   	$("#loan").html(data[2]);
   	 if(assets.length>0){
   		 var options = {
       	   	     
      	   	      backgroundColor: { fill:'transparent' },
      	   	   height: 300,
       	      width :360,
       	     pieSliceText: 'percentage',
      	   	colors:GRAPH_COLORS
      	   	    };
   		
   		 showGooglePieChart('Asset',data[0],options,'assetGraph');
   		 $("#networth_asset_amount").html(data[3]);
   	 }
   	 else{
   		 $('#assetGraph').empty();
   		 $('#assetData').append('<div class="no_data_message" style="margin-top:100px">No Asset data found</div>')
   		 /* $('#assetData').empty();
   		 $('#assetData').html('<div class="no_data_message">No Asset Data found</div>'); */
   		 
   	 }
		if(loan.length>0){
			var options2 = {
		   	   	      
		   	   	      backgroundColor: { fill:'transparent' },
		   	   	height: 300,
			      width :360,
			      pieSliceText: 'percentage',
	 
		    			 colors:GRAPH_COLORS
		   	   	    };
		    	 
		    	 showGooglePieChart('Loan',data[1],options2,'loanGraph');
		    	// renderPieChart('assetGraph', data[0], 'Asset');
		   // 	 renderPieChart('loanGraph', data[1], 'Loan');
		    	 $("#networth_loan_amount").html(data[2]);
   	 }
   	 else{
   		 $('#loanGraph').empty();
   		 $('#loanData').append('<div class="no_data_message" style="margin-top:100px">No Loan data found</div>')
   	 }
   	  
   	
   	 
   	 
    }
	
	function showAchievementScale(data){
   	 var riskScale = data[1];
   	 var goalScale = data[0];
   	 
   	 //$(".completion").text(goalScale+'%');
   	 //$("#riskScale").text(riskScale+'%');
   	 //$("#successionScale").text(data[2]+'%');
   	 
   	 /* $("#overAllScale1").text(data[3]+'%'); */
   	 
   	 if(riskScale>=75){
   		 $("#risk_condition75").show();
   		$("#risk_condition50").hide();
   		$("#risk_condition25").hide();
   		
   	 }
   	 else if(riskScale >=50){
   		 $("#risk_condition50").show();
   		$("#risk_condition75").hide();
   		$("#risk_condition25").hide();
   	 }
   	 else{
   		 $("#risk_condition25").show();
   		$("#risk_condition75").hide();
   		$("#risk_condition50").hide();
   		
   	 }

   	 if(goalScale>=75){
   		 $("#goal_condition75").show();
   		$("#goal_condition50").hide();
   		$("#goal_condition25").hide();
   	 }
   	 else if(goalScale >=50){
   		 $("#goal_condition50").show();
   		$("#goal_condition75").hide();
   		$("#goal_condition25").hide();
   	 }
   	 else{
   		 $("#goal_condition25").show();
   		$("#goal_condition75").hide();
   		$("#goal_condition25").hide();
   	 }
   	 //percentageGraph=["one","two","three","four","five","six","seven","eight","nine","ten"];
   	 //var perVal=Math.round(data[3]/10);
   	 var progressValue=data[3];
   	 var d=data[3]/10;
   	 var crop=Math.round(d*18.2);
   	 /* var top=220-crop; */
   	 $('#overAllScale1').attr('data-percent', progressValue+'%');
     $('#overAllScallWidth').css('width', progressValue+'%'); 
   	 $("#family_invest").removeClass('family_invest_no');
	    var isInvestmentKnown=data[4];
	    var isMoneyKnown=data[5];
	    var isWillPrepared=data[6];//alert(isInvestmentKnown+"  "+isMoneyKnown+"  "+isWillPrepared);
	    
	    
	    if(isInvestmentKnown){
	    	//$("#family_invest").toggleClass('family_invest_yes');
	    	$("#family_invest").removeClass('family_invest_no').addClass('family_invest_yes');
	    	$("#family_invest_text").text('Your family know where you have invested your money.');
	    	
	    }
	    else{
	    	$("#family_invest").addClass('family_invest_no');
	    }
	    //alert(isMoneyKnown);
		
		if(isMoneyKnown){
			//$("#family_access_money").toggleClass('family_access_money_yes');
			$("#family_access_money").removeClass('family_access_money_no').addClass('family_access_money_yes');
			$("#family_access_text").text('Your Family have access to your money.');
		}
	    else{
	    	$("#family_access_money").addClass('family_access_money_no');
	    	
	    	
	    }
       	 
		if(isWillPrepared){
			//$("#family_will").toggleClass('family_will_yes');
			$("#family_will").removeClass('family_will_no').addClass('family_will_yes');
			$("#family_will_text").text('You have written will.');
		}
	    else{
	    	$("#family_will").addClass('family_will_no');
	    } 
   	 
    }
	/* SC end */
	
	 var goalData;
	 var achivementScale;
	 var netWorth;
	 var earningExpenses;
	 $('.azaxslides').addClass('loading');
	
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/portfolio/dashboard/ajax",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				$('.azaxslides').removeClass('loading');
				//$(".azaxslides").show();
				showNetWorth(data['netWorth']);
				showEarningExpensesChart('earningExpensesGraph',data['earningExpenses'],'savingGraph');
				showGoalChart('goalGraph',data['goalData']);
				showAchievementScale(data['achivementScale']);
				
			},
			error : function(msg) {
				$('.azaxslides').removeClass('loading');
				//showMessage('An error occured while loading',true);
			}
		});
	</script>
	<!-- circle end -->
	
	
		
		
