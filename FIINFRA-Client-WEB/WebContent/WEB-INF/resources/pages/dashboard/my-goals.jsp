
<%@page import="java.util.Calendar"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.utility.GoalData"%>
<%@page import="java.util.List"%>
<%List<GoalData> goalData=(List<GoalData>) request.getAttribute("goalData"); %>

     
     <%-- <div id="header-strip" class="fl"> 
     	<jsp:include page="../menu.jsp"></jsp:include>
        	<h3 class="clearfix fl">MY GOALS</h3>
     </div> --%><!-- end of "header-strip" id --> 
     
     <!-- <div id="inner-shadow-strip"></div> --><!-- end of "inner-shadow-strip" id -->
      
    
        	<%
        	int flag=0;
      	  	Calendar today = Calendar.getInstance();
      	  	int currentYear= today.get(Calendar.YEAR);
            if(goalData.isEmpty()){%>
               <div class="clr"></div>
            	<div class="no_data_message northspace5">There is No Goal Defined by you.</div>  
            	
            	<% }
            else{
        	for (GoalData g:goalData) {
        	  double pv = CommonUtils.toDouble(g.getGoalAmountPv());
        	  double fv = CommonUtils.toDouble(g.getGoalAmountFv());
        	  double completedPercentage = CommonUtils.toDouble(g.getGoalCompletedPercent());
        	  double completedValue = CommonUtils.divide(CommonUtils.multiply(fv, completedPercentage),100);
        	  
        	  int createdYear = g.getGoalStartYear();
        	  int endYear = g.getGoalEndYear();
        	  fv  = fv ==0 ? 1:fv;
        	  int percentCompleted = (int) completedPercentage;
        	  //if(fv >0){
        		  //percentCompleted =(int) CommonUtils.multiply(CommonUtils.divide(pv, fv), 100);
        	  //}
        	  percentCompleted = Math.min(percentCompleted, 100);
        	  int yearCompleted =(int)( 7+ CommonUtils.multiply(CommonUtils.divide(currentYear-createdYear, endYear-createdYear),73));
        		
        	  double currentYear1=currentYear;
        	  double createdYear1=createdYear;
        	  double endYear1=endYear;
        	  double showYear=((currentYear1-createdYear1)/(endYear1-createdYear1))*100;
        	  String iconName="";
        	   /* if((CommonUtils.getCssGoalClassFromCodeValue(g.getGoalTypeName(),'car')).toString()) */ 
        	   
        	   if(g.getGoalTypeId()==35001)
        	  {
        		   iconName="fa fa-graduation-cap";
        	  }
        	    if(g.getGoalTypeId()==35003)
         	  {
         		   iconName="fa fa-home";
         	  }
        	   if(g.getGoalTypeId()==35004)
         	  {
         		   iconName="icon-wedding";
         	  }
        	   if(g.getGoalTypeId()==35005)
         	  {
         		   iconName="icon-vacation-planning";
         	  }
        	   if(g.getGoalTypeId()==35006)
         	  {
         		   iconName="fa fa-car";
         	  }
        	   if(g.getGoalTypeId()==35007)
         	  {
         		   iconName="icon-money-access";
         	  }
        	   if(g.getGoalTypeId()==35008)
         	  {
         		   iconName="icon-parental-goal";
         	  }
        	   if(g.getGoalTypeId()==35012)
         	  {
         		   iconName="icon-business";
         	  }
        	   if(g.getGoalTypeId()==35013)
         	  {
         		   iconName="icon-others";
         	  }
        	   if(g.getGoalTypeId()==35014)
         	  {
         		   iconName="icon-emergency-planning";
         	  }
        	   if(g.getGoalTypeId()==35015)
         	  {
         		   iconName="icon-retirement";
         	  }
        	   if(g.getGoalTypeId()==35016)
         	  {
         		   iconName="fa fa-sun-o";
         	  } 
        	%>
             
             <%-- <div class="goals">            	
                <span><%= CommonUtils.emptyIfNull(g.getGoalName()) %></span>                
                <div class="goal-icon  <%=CommonUtils.getCssGoalClassFromCodeValue(g.getGoalTypeName(), "car")%>">
                	<img src="${pageContext.request.contextPath}/resources/images/transparent.png" />
                </div><!-- end of "goal-icon" id -->               
                <div class="goals-bg">
                	 <div class="status ">
                    	<img src="${pageContext.request.contextPath}/resources/images/transparent.png" />
                    </div><!-- end of "status status-comfortable" class --> 
                	<div class="goal-year">
                    	<h2>Goal Years </h2>
                        <div class="start-year"><%=createdYear %></div><!-- end of "start-year" class--> 
                        <div class="end-year"><%=endYear %></div><!--
                         end of "end-year" class--> 
                        <div id="goalYear" class="slider-bg"></div>
                        <div class="current-year" style="left:<%=yearCompleted %>%"><span class="year"><%=currentYear %></span></div>
                         <div class="inner-shadow-strip2"></div><!-- end of "inner-shadow-strip2" id -->
                    </div><!-- end of "goal-year" class -->
                    <div class="goal-budget">
                    	<h2>GOAL BUDGET</h2>
                        <div class="min-budget">0 </div><!-- end of "start-year" class--> 
                        <div class="max-budget"><%=	CommonUtils.formatAmountINR(fv) %></div><!-- end of "end-year" class--> 
                        <div class="slider-bg"></div>
                        <div class="inner-shadow-strip2"></div><!-- end of "inner-shadow-strip2" id -->
                    </div><!-- end of "goal-budget" class -->
                    <div class="achieved-budget">
                    	<h2>ACHIEVED BUDGET</h2>
                        <div class="min-budget">0 </div><!-- end of "start-year" class--> 
                        <div class="max-budget"><%=CommonUtils.formatAmountINR(completedValue)%></div><!-- end of "end-year" class--> 
                        <div class="slider-bg" style="width:<%=percentCompleted%>%"></div>
                    </div><!-- end of "achieved-budget" class --> 
                    
                    	<!-- <button><span class="btn-txt">What Is</span></button> -->
                        <button class="ia-btn" onclick="initiateGoal(<%=g.getId()%>)"><span class="txt">Inform Advisor</span></button>
                       
                   
                    
                </div><!-- end of "goals-bg" class -->                 
                <div class="inner-shadow-strip"></div><!-- end of "inner-shadow-strip" id -->                          
            </div> --%><!-- end of "goals" class -->
            
            
            <div class="col-xs-12 col-sm-4 widget-container-col ui-sortable">
	<div
		class="widget-box  light-border ui-sortable-handle widget-color-grey">
		<div class="widget-header">
			<h5 class="widget-title smaller"><%= CommonUtils.emptyIfNull(g.getGoalName()) %></h5>

			<div class="widget-toolbar">
				<span class="badge"><i class="<%=iconName%> fa-2x"></i></span>
			</div>
		</div>



		<div class="widget-body">
			<div class="widget-main padding-6">
				
                    	<div align="center">Goal Years </div>
                    	<!-- <span >Goal Years</span> -->
                        <%-- <div class="min-budget"><%=createdYear %></div>
                        <div class="max-budget"><%=endYear %></div>
                        <div id="goalYear" class="slider-bg"></div>
                        <div class="current-year" style="left:<%=yearCompleted %>%"><span class="year"><%=currentYear %></span></div> --%>
                        
                        
            			<div class="fl"><%=createdYear %></div> <div class="fr"><%=endYear %></div>
            			<br>
            			<div class="progress pos-rel" data-percent="Current Year<%=currentYear %>">
            			
													<div class="progress-bar"   style="width:<%=showYear%>%"></div>
						</div>
            			
            			<!-- <div id="sliderDiv">
    						<input id="mySlider" type="text" data-slider-tooltip="show"/> 
						</div> -->
            
            
              
                    	<div align="center">Goal Budget</div>
                        <%-- <div class="min-budget">0 </div>
                        <div class="max-budget"><%=	CommonUtils.formatAmountINR(fv) %></div>
                        <div class="slider-bg"></div> --%>
                       
                       	<div class="fl">0</div> <div class="fr"><%=	CommonUtils.formatAmountINR(fv) %></div>
                       	<br>
            			<div class="progress pos-rel">
													<div class="progress-bar" style="width:100%;"></div>
						</div>
                       
                       
                       	
                       	<div align="center">Achieved Budget</div>
                        <%-- <div class="min-budget">0 </div><!-- end of "start-year" class--> 
                        <div class="max-budget"><%=CommonUtils.formatAmountINR(completedValue)%></div>
                        <div class="slider-bg" style="width:<%=percentCompleted%>%"></div> --%>
                        
                        <div class="fl">0</div> <div class="fr"><%=CommonUtils.formatAmountINR(completedValue)%></div>
                        <br>
            			<div class="progress pos-rel" data-percent="<%=percentCompleted%>%">
													<div class="progress-bar"  style="width:<%=percentCompleted%>%"></div>
						</div>
                        
                        
                        
                       <div class="pull right">
                       <button class="btn-primary btn-xs btn" onclick="initiateGoal(<%=g.getId()%>)">Inform Advisor</button>
                       </div>
                       <br>
                    </div>
          </div>
          
			</div>
			<%
			flag++;
            if(flag%3==0)
            {
            	%><br><% 
            }%>
		</div>
		
		           
            
            <%
            
            } }%>
       
<script>
function initiateGoal(goalId){
	
	/* showConfirm("Are you sure you want to inform to advisor?", function() {
		window.location.href='${pageContext.request.contextPath}/portfolio/myGoals/initiate?id='+goalId;
		var url = '${pageContext.request.contextPath}/portfolio/myGoals/initiate?id='+goalId;
		$(location).attr('href', url);
	}); */
	
	bootbox.confirm("Are you sure you want to inform to advisor?", function(result) {
		if(result==true)
			{
		window.location.href='${pageContext.request.contextPath}/portfolio/myGoals/initiate?id='+goalId;
		var url = '${pageContext.request.contextPath}/portfolio/myGoals/initiate?id='+goalId;
		$(location).attr('href', url);
			}
		else
			{
			
			}
		  /* Example.show("Confirm result: "+result); */
		}); 
	
	
	}

</script>

