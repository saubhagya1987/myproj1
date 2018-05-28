<div id="wrapper" class="clearfix">
  <!-- end of "header" id -->
  
  <!-- end of "nav-menu" id -->
  
 
  <!-- end of "header-strip" id -->
  
  
  <!-- end of "inner-shadow-strip" id -->
  
  <div id="contents">
    <section class="in_content clearfix" id="my_reports_main">
      <div class="">
   <%--      <div class="top">
          <div class="top_left">
            <div class="top_left_in">
              <ul>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=GS">Goal Summary</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=GD">Goal Details</a></li>
              </ul>
              <div class="goal_icon"></div>
            </div>
            <label>Goals</label>
          </div>
          <div class="top_right">
            <div class="top_right_in">
              <ul>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=PS">Portfolio Summary</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=PD">Portfolio Details</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=TD">Transaction Details</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=CGD">Capital Gain Details</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=CGS">Capital Gain Summary</a></li>
              </ul>
              <div class="portfolio_icon"></div>
            </div>
            <label>Portfolio</label>
          </div>
        </div> --%>
        
        
        <div class="row">
									 <div class="col-md-6">
										<div class="widget-box widget-color-orange ui-sortable-handle">
											<div class="widget-header">
												<h5 class="widget-title smaller"><i class="menu-icon fa fa icon-my-goals"></i> Goals</h5>

												<div class="widget-toolbar">
													
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-6" style="height: 120px;">
												
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=GS">Goal Summary</a></div>
												
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="widget-box widget-color-pink ui-sortable-handle">
											<div class="widget-header">
												<h5 class="widget-title smaller"><i class="menu-icon fa icon-my-portfolio"></i> Portfolio</h5>

												<div class="widget-toolbar">
													
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-6" style="height: 120px;">
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=PS">Portfolio Summary - Unrealized Gain</a></div><br/>
													<%-- <div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=PD">Portfolio Details</a></div><br/> --%>
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=TD">Transaction Statement </a></div><br/>
												</div>
											</div>
										</div>
									</div>

								</div>
 <%--        <div class="bottom">
          <div class="bottom_left">
            <label>Finance</label>
            <div class="bottom_left_in">
              <ul>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=UH">My Holdings</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=SIP">SIP</a></li>
                <li><a href="${pageContext.request.contextPath}/financial/myIncome?graph=true">Income</a></li>
                <li><a href="${pageContext.request.contextPath}/financial/myExpenses?graph=true">Expenses</a></li>
              </ul>
              <div class="finance_icon"></div>
            </div>
          </div>
          <div class="bottom_right">
            <label>Action Plan</label>
            <div class="bottom_right_in">
              <ul>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=AP">Action Plan</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=APQ">Quick Analysis</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=APS">Summary Analysis</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=APD">Detailed Analysis</a></li>
                <li><a href="${pageContext.request.contextPath}/report/reports?name=LP">Last Generated Plan</a></li>
              </ul>
              <div class="action_icon"></div>
            </div>
          </div>
        </div> --%>
        <div class="hr hr-double hr-dotted hr18"></div>
        <div class="row">
									<div class="col-md-6">
										<div class="widget-box widget-color-blue ui-sortable-handle">
											<div class="widget-header">
												<h5 class="widget-title smaller"><i class="ace-icon glyphicon glyphicon-euro"></i> Finance</h5>

												<div class="widget-toolbar">
													
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-6" style="height: 170px;">
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=UH">My Holdings</a></div><br/>
													<div align="center"><a href="${pageContext.request.contextPath}/financial/myIncome?graph=true">Income</a></div><br/>
													<div align="center"><a href="${pageContext.request.contextPath}/financial/myExpenses?graph=true">Expenses</a></div><br/>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-6">
										<div class="widget-box widget-color-dark ui-sortable-handle">
											<div class="widget-header">
												<h5 class="widget-title smaller"><i class="ace-icon fa fa-table"></i> Action Plan</h5>

												<div class="widget-toolbar">
													
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-6" style="height: 170px;">
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=AP">Action Plan</a></div><br/>
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=APQ">Quick Analysis</a></div><br/>
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=APS">Summary Analysis</a></div><br/>
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=APD">Detailed Analysis</a></div><br/>
													<div align="center"><a href="${pageContext.request.contextPath}/report/reports?name=LP" class="grey_txt">Last Generated Plan</a></div>
												</div>
											</div>
										</div>
									</div>

        </div>
      </div>
      <!-- DC submenu Ends--> 
      
    </section>
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
</div>
<!-- End of "wrapper" id -->
