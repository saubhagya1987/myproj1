<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<style>
.a_to_g_edit{
	cursor: pointer;
}
</style>

<script>
$(document).ready(function(){
  	$('.goal_bx .bottom .bottom_in').slimScroll();
//	$('.asset_to_goal_slider_bx_out').bxSlider();
  });
</script>

<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      
     	
      	   
    	   
      function drawChart() {

    	  var pieChartGoalsList='${pieChartGoalsList}';
    	 // alert(pieChartGoalsList)
  	  	try{
  	  		pieChartGoalsList=JSON.parse(pieChartGoalsList);
  	  	}catch(e){
  	  		
  	  		pieChartGoalsList=[];
  	  	}
  	  	var goalIdToCompare=0;
  	  	var sumOfAllocation=0;
  	  	var lastGoalId=0;
  		var outerArray = new Array();
  		var options = {
  	          //title: '',
  			   legend: 'none'
  			   //colors: ['#910f34', '#c11342', '#d92771', '#ff4682', '#b91f5f', 'd92771', '#ff76ae', '#910f34'],
  	        };
  	  	$(pieChartGoalsList).each(function(i,obj) {
  	  		var assetName=obj.assetName;
  	  		var allocatedValue=obj.allocatedValue;
  	  		var goalId=obj.goalId;
  	  		lastGoalId=goalId;
  	  		if(goalIdToCompare!=goalId){
	  	  		if(goalIdToCompare!=0){
	  	  			if(sumOfAllocation<100){
	  	  			innerArray = new Array();
					innerArray.push('No Allocation');
					innerArray.push(100-parseFloat(sumOfAllocation));
					outerArray.push(innerArray);
	  	  			}
					var data = google.visualization.arrayToDataTable(outerArray);
					var formatter1 = new google.visualization.NumberFormat(
			          	      {pattern: '#.##'});
			            formatter1.format(data, 1);
			            
					var chart = new google.visualization.PieChart(document.getElementById('piechart_'+goalIdToCompare));
		        	chart.draw(data, options);
	  	  			
	  	  		}
  	  			sumOfAllocation=0;
  	  			var firstRow = new Array();
	  			firstRow.push('Goal');
	  			firstRow.push('Goal Asset Allocation');
	  			var innerArray = new Array();
	  			outerArray = new Array();
	  			innerArray.push(firstRow[0]);
	  			innerArray.push(firstRow[1]);
	  			outerArray.push(innerArray);
	  			innerArray = new Array();
				innerArray.push(assetName);
				innerArray.push(parseFloat(allocatedValue));
				outerArray.push(innerArray);
	  			goalIdToCompare=goalId;
	  			sumOfAllocation+=parseFloat(allocatedValue);
  	  		}else{
	  	  		innerArray = new Array();
				innerArray.push(assetName);
				innerArray.push(parseFloat(allocatedValue));
				outerArray.push(innerArray);
				sumOfAllocation+=parseFloat(allocatedValue)
  	  		}
  	  	
  	  		//alert(goalId+'assetName:--'+assetName+':---allocatedValue:--'+allocatedValue);
  	  	});
  	  	if(sumOfAllocation<100){
  			innerArray = new Array();
			innerArray.push('No Allocation');
			innerArray.push(100-parseFloat(sumOfAllocation));
			outerArray.push(innerArray);
  	  	}
			var data = google.visualization.arrayToDataTable(outerArray);
			var formatter = new google.visualization.NumberFormat(
	          	      {pattern: '#.##'});
	            formatter.format(data, 1);
	            
			var chart = new google.visualization.PieChart(document.getElementById('piechart_'+lastGoalId));
			
	         	  
			chart.draw(data, options);
  		
//         var data = google.visualization.arrayToDataTable([
//           ['Task', 'Hours per Day'],
//           ['Mutual Funds',     3],
//           ['Shares',      2],
//           ['Deposits',  2],
//           ['Retirement Funds', 2],
//           ['Gold',    1],
//           ['Property',    2],
//           ['Insurance',    1],
//           ['Others',    2]
//         ]);

//         var options = {
//           title: '',
// 		   legend: 'none',
// 		   colors: ['#910f34', '#c11342', '#d92771', '#ff4682', '#b91f5f', 'd92771', '#ff76ae', '#910f34'],
//         };

//         <c:forEach items="${assetAllocatedToGoalsList}" var="assetAllocatedToGoals" varStatus="counter">
//         	var chart = new google.visualization.PieChart(document.getElementById('piechart_${counter.index}'));
//         	chart.draw(data, options);
//         </c:forEach>
        
        //var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));
        //var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));
        //var chart3 = new google.visualization.PieChart(document.getElementById('piechart3'));

        //chart.draw(data, options);
        //chart1.draw(data, options);
        //chart2.draw(data, options);
        //chart3.draw(data, options);
      		
      }
		
    </script>



<script>
$(document).ready(function(){
   // $('.asset_summary_scroll').slimScroll();

  $('.view1  .icon-bg').click(function(){
 	 if ( $('.view-options-g-to-a').css('visibility') == 'hidden' )
    $('.view-options-g-to-a').css('visibility','visible');
  else
    $('.view-options-g-to-a').css('visibility','hidden');
});
});
</script>

<div class="wrapper" id="asset_to_goal"> 
  <!-- Main starts-->
  <section class="main"> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
      <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
      <section class="asset_to_goal_bx_in"> <a class="goals_back_btn" href="${pageContext.request.contextPath}/assets/assetSummary/${partyId}">Back</a>
        <!-- <div class="asset_to_goal_slider_bx_out"> -->
          <ul class="asset_to_goal_slider_bx clearfix">
          <c:set var="cntr" value="1" />
          <c:choose>
          	<c:when test="${fn:length(assetAllocatedToGoalsList) > 0}">
          		<c:forEach items="${assetAllocatedToGoalsList}" var="assetAllocatedToGoals" varStatus="counter">
            <c:set var="goalLogo" value="spe_g_icon" />
            <c:choose>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Car'}">
             		<c:set var="goalLogo" value="car_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Higher Education'}">
             		<c:set var="goalLogo" value="edu_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Start Business'}">
             		<c:set var="goalLogo" value="bis_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Property or House'}">
             		<c:set var="goalLogo" value="pro_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Travel or Vacation'}">
             		<c:set var="goalLogo" value="tra_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Others'}">
             		<c:set var="goalLogo" value="othe_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Marriage'}">
             		<c:set var="goalLogo" value="wed_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Retirement'}">
             		<c:set var="goalLogo" value="retri_g_icon" />             		
             	</c:when>
             	<c:when test="${assetAllocatedToGoals.goalName eq 'Emergency'}">
             		<c:set var="goalLogo" value="emer_g_icon" />             		
             	</c:when>
				<c:otherwise></c:otherwise>
            </c:choose>
            	<c:if test="${cntr eq 1 }">
            		<li class="fl"> <!--First Goal-->
            	</c:if>
	              <div class="goal_bx">
	                <div class="title">${assetAllocatedToGoals.goalDesc}</div>
	                <div class="top clearfix">
	                  <div class="top_left fl">
	                    <div class="top">
	                      <div class="label">Present Value</div>
	                      <div class="label_two">Goal:</div>
	                      <div class="label_three"> <span class="WebRupee">Rs.</span> <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${((assetAllocatedToGoals.goalPv)/100000)}"/> lacs</div>
	                    </div>
	                    <div class="bottom">
	                      <div class="label">Asset</div>
	                      <div class="label_two"> <span class="WebRupee">Rs.</span> <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${((assetAllocatedToGoals.assetPv)/100000)}"/> lacs</div>
	                    </div>
	                  </div>
	                  <div class="top_right fr">
	                    <div class="top">
	                      <div class="label">Goal Year Value</div>
	                      <div class="label_two">Goal:</div>
	                      <div class="label_three"> <span class="WebRupee">Rs.</span> <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${((assetAllocatedToGoals.goalFv)/100000)}"/> lacs</div>
	                    </div>
	                    <div class="bottom">
	                      <div class="label">Asset</div>
	                      <div class="label_two"> <span class="WebRupee">Rs.</span> <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${((assetAllocatedToGoals.assetFv)/100000)}"/> lacs</div>
	                    </div>
	                  </div>
	                  <div class="icon_bg">
	                    <div class="${goalLogo}"></div>
	                    <div class="yr">${assetAllocatedToGoals.goalYear}</div>
	                  </div>
	                </div>
	                <div class="middle clearfix">
	                  <div id="piechart_${assetAllocatedToGoals.goalId}" style="width: 250px; height: 178px; margin-left: -25px; "></div>
	                </div>
	                <c:choose>
	                	<c:when test="${assetAllocatedToGoals.goalPercent gt 99}">
	                		<div class="g_to_a_achieved">This goal can be achieved with exsting asset</div>
	                	</c:when>
	                	<c:when test="${assetAllocatedToGoals.goalPercent gt 81}">
	                		<div class="g_to_a_partially">You are almost there.Invest a little more</div>
	                	</c:when>
	                	<c:otherwise>
	                		<div class="g_to_a_difficult">Place the first step,Invest now</div>
	                	</c:otherwise>
	                </c:choose>	                
	                <input type="button" onclick="editAssetAllocatedToGoal('${assetAllocatedToGoals.goalId}','${assetAllocatedToGoals.goalDesc}','${assetAllocatedToGoals.goalPv}','${assetAllocatedToGoals.goalFv}','${assetAllocatedToGoals.goalDescription}');" class="a_to_g_edit" value="Edit">
	                <!--  <a class="a_to_g_edit" href="">Edit</a>--> 
	              </div>
	            <c:if test="${cntr eq 4 }">
	            	<c:set var="cntr" value="0" />
            		</li>
            	</c:if>
	            <c:set var="cntr" value="${cntr + 1}" />
            </c:forEach> 
          	</c:when>
          	<c:otherwise>
          		<div class="bx-wrapper2" style="max-width: 100%; margin: 0px auto; height: 393px;">
          			<span style="font-family: allerregular; font-size: 16px; color: #3a3a3a; text-align: center;">You Have No Goal Defined Yet</span>
          			<p style="font-family: allerregular; font-size: 16px; color: #3a3a3a; text-align: left;">To define a goal kindly<a href="${pageContext.request.contextPath}/partner/datacollection/${partyId}/${contactName}/${contactRecordTypeId}"> Click Here</a></p>
          		</div>
          	</c:otherwise>
          </c:choose>
          </ul>
        <!-- </div> -->
        <div class="asset-summary-footer fl">
    
    	<a href="${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0" class="asset-management fl">
        	<div class="title">Asset Details</div>
            <div class="icon-bg"><div class="icon fl"></div></div>  
            <div class="icon-reflection"></div>       
        </a><!-- asset-management Ends-->
        
        <a href="#" class="goal-allocation fl" style="display: none;">
        	<div class="title">Asset Allocation to Goal</div>
            <div class="icon-bg"><div class="icon fl"></div></div>  
            <div class="icon-reflection"></div>       
        </a><!-- goal-allocation Ends-->

        <div class="view1 fl" style="display: none;">
        	<div class="title">View</div>
            <div class="icon-bg"><div class="icon fl"></div></div>  
            <div class="icon-reflection"></div>       
        </div><!-- view Ends-->
        
        <div class="view-options-g-to-a fl">
        	<div class="view-bg">
            	<ul>
                	<li>Goals</li>
                    <li>Unused Assets</li>
                    <!--<li>Future Cashflow</li>-->
                </ul>
            </div>
        </div><!-- view-options Ends-->
        
        <div class="total02 fl" style="display:none;">
                </div><!-- tota Ends-->
        <div class="footer-platform"></div>
          	
    </div>
      </section>
      <!-- Common_in_contnet ends-->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>

<form action="${pageContext.request.contextPath}/assets/editAssetAllocatedToGoal" id="assetAllocationForm" method="post">
	<input type="hidden" name="partyId" id="partyId" value="${partyId}"/>
	<input type="hidden" name="goalId" id="goalId"/>
	<input type="hidden" name="goalDesc" id="goalDesc"/>
	<input type="hidden" name="currentValue" id="currentValue"/>
	<input type="hidden" name="futureValue" id="futureValue"/>
	<input type="hidden" name="goalDescription" id="goalDescription"/>
</form>

<!-- Wrapper ends-->

<script>
$(window).load(function(){
	$('.asset_to_goal_slider_bx').bxSlider({infiniteLoop: false});
	<c:if test="${fn:length(assetAllocatedToGoalsList) lt 5}">
		$(".bx-controls").addClass("hide");
	</c:if>

  });

function editAssetAllocatedToGoal(goalId,goalDesc,presentValue,futureValue,goalDescription){
	$("#goalId").val(goalId);
	$("#goalDesc").val(goalDesc);
	$("#currentValue").val(presentValue);
	$("#futureValue").val(futureValue);
	$("#goalDescription").val(goalDescription);
	$("#assetAllocationForm").submit();
}

</script>
