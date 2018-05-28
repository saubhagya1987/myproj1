

      <!-- #section:basics/sidebar -->
      <!-- <div class="no-skin"> -->
      <div id="sidebar" class="sidebar  responsive" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true"> 
    <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script> 

    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
                
    <!--<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse"> <i class="menu-icon" data-icon1="menu-icon" data-icon2="menu-icon"></i> </div>-->
    
    <!--fa-angle-double-left--> 
    <!-- /section:basics/sidebar.layout.minimize --> 
    
    <!-- /.sidebar-shortcuts -->
    
    <ul class="nav nav-list">
					<li class="<%="home".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
						<a href="<%=request.getContextPath()%>/profile/home">
							<i class="menu-icon fa fa-home"></i>
							<span class="menu-text"> Home </span>
						</a>

						<b class="arrow"></b>
					</li>
                    
                    <li class="<%="My Goals".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
						<a href="${pageContext.request.contextPath}/portfolio/myGoals" >
							<i class="menu-icon fa fa icon-my-goals"></i>
							<span class="menu-text"> My Goals </span>
						</a>

						<b class="arrow"></b>
					</li>
                    
                    
              
                   <% if((request.getAttribute("currentPage").equals("My Income") || (request.getAttribute("currentPage").equals("My Expenses")) || (request.getAttribute("currentPage").equals("My Savings")))) { %> 
                    <li class="open">
                    <%}else{ %>
                    <li class="">
                    <%} %>
						<a href=""  class="dropdown-toggle">
						<i class="menu-icon fa icon-cashflow"></i>
							<span class="menu-text"> My Cash Flow </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li  class="<%="My Income".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
								<a href="<%=request.getContextPath()%>/financial/myIncome">
									<i class="menu-icon fa fa-caret-right"></i>
									My Income
								</a>

								<b class="arrow"></b>
							</li>

							<li  class="<%="My Expenses".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
								<a href="<%=request.getContextPath()%>/financial/myExpenses">
									<i class="menu-icon fa fa-caret-right"></i>
									My Expenses
								</a>

								<b class="arrow"></b>
							</li>
							
							<li class="<%="My Savings".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
								<a href="<%=request.getContextPath()%>/financial/savings">
									<i class="menu-icon fa fa-caret-right"></i>
									My Savings
								</a>

								<b class="arrow"></b>
							</li>
							
						</ul>
					</li>

				
				
				

                    <li class="<%="My Plans".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":"" %>">
						<a href="${pageContext.request.contextPath}/portfolio/myPlans">
							<i class="menu-icon fa icon-my-plans"></i>
							<span class="menu-text"> My Plans </span>
						</a>

						<b class="arrow"></b>
					</li>
                    <!-- My Port -->
                    <% if((request.getAttribute("currentPage").equals("My Assets") || (request.getAttribute("currentPage").equals("My Loan")))) { %>
                    	<li class="open">
                    	<%} else { %>
                    	<li class="">
                    	<%} %>
						<a href=""  class="dropdown-toggle">
						<i class="menu-icon fa icon-my-portfolio"></i>
							<span class="menu-text"> My Portfolio </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li  class="<%="My Assets".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":"" %>">
								<a href="<%=request.getContextPath()%>/portfolio/myAssets">
									<i class="menu-icon fa fa-caret-right"></i>
									My Assets 
								</a>

								<b class="arrow"></b>
							</li>

							<li  class="<%="My Loan".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":"" %>">
								<a href="<%=request.getContextPath()%>/portfolio/myLoan">
									<i class="menu-icon fa fa-caret-right"></i>
									My Loan
								</a>

								<b class="arrow"></b>
							</li>
							
														
	</ul>
					</li>
                    <!-- end -->
                    <li class="<%="My Reports".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":"" %>">
						<a href="${pageContext.request.contextPath}/report/myReports">
							<i class="menu-icon fa icon-my-reports"></i>
							<span class="menu-text"> My Reports </span>
						</a>

						<b class="arrow"></b>
					</li>
                    
                    <li class="<%="My Documents".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
						<a href="${pageContext.request.contextPath}/document/view">
							<i class="menu-icon fa fa-file-archive-o"></i>
							<span class="menu-text"> My Documents </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="<%="calculator".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
						<a href="${pageContext.request.contextPath}/common/calculator">
							<i class="menu-icon fa icon-calculator"></i>
							<span class="menu-text">Calculator </span>
						</a>

						<b class="arrow"></b>
					</li>
					<li class="<%="riskprofile".equalsIgnoreCase((String)request.getAttribute("currentPage"))?"active":""%>">
						<a href="${pageContext.request.contextPath}/riskProfile/dc/risk-profile/">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> Risk Profile Tool </span>
						</a>

						<b class="arrow"></b>
					</li>
					
				</ul>
    <!-- /.nav-list --> 
    
    <script type="text/javascript">	try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}</script> 
		
		</div>
      <!-- </div> -->
      <!-- /section:basics/sidebar -->
    
     
          <!-- #section:basics/content.breadcrumbs -->
         
          <!-- /section:basics/content.breadcrumbs -->
			
