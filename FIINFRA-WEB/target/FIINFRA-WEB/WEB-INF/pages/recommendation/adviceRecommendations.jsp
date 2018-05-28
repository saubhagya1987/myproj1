<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script>
/*   $(document).ready(function(){
  
	
	
	var roleBaseLinks = "${roleBaseLinks}";
  	var links = roleBaseLinks.split(",");
  	if(links != ""){
  		for(var i=0;i<links.length;i++){
  			$("."+links[i]).attr("href","#");
  			$("."+links[i]).addClass("inactiveLink");
  			if(links[i].indexOf("save")>-1)
  			{
  				if(document.forms[0] != undefined){
  				document.forms[0].action = "";
  				}
  			}
  		}
  	} */
	
	/* $(function() {
    	$( "#tabs" ).tabs();
    	$('.ui-tabs-panel').perfectScrollbar();
  	}); */
   

  </script>
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<%-- <title>Advice Recommendations</title>
<link rel="shortcut icon" href="../images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<!-- Filter section toggle starts --> 
<script>
$(document).ready(function(){
  $(".arrow-up").click(function(){
    $("#help_tips_middle").slideToggle("slow");
	$(".arrow-up").animate("slow").toggleClass("arrow-down ","slow");
  });
});
</script><!-- Filter section toggle ends --> 
--%>

<style>
.heading_icon{line-height: 87px !important;}
</style>
</head>

<body>



    
<!-- this is Advice Recomendations header -->
<jsp:include page="header.jsp"></jsp:include>

    <!-- Header Ends-->
    
  
      <div class="wrapper">
      
      <div class="common_header inner_header">
      <div class="page_header">
        <h1 class="heading clearfix">


          <span class="head_txt">Advice Recommendation</span><span class="heading_icon"><i class="ace-icon fa icon-recommendation bigger-2140"></i></span>
                   
         <button class="btn btn-sm btn-warning pull-right set_default" onclick="setDefaultValues();">
												<i class="ace-icon fa fa-fire bigger-110"></i>
												<span class="bigger-110 no-text-shadow">Set Default</span>
											</button>
		  </h1>
          
      </div>
      </div>		
				
     <section id="advice_recommendation_in" class="page-content"> 
      
        <!-- DC submenu Ends-->
        
        <div class="row">
        <div class="col-sm-8 advice_recommendation_dc" ><!-- advice_recommendation_dc -->
         
            <div class="category" id="risk_cover"><a class="hit_area adviceRecommendationRiskCoverLink" href="${pageContext.request.contextPath}/partner/recommendation/riskCover">
              <i class="ace-icon fa icon-risk-cover size-48 dark"></i>
              <h4 class="head">Risk Cover</h4>
              <div class="span">It doesn't matter how hard you hit if you cannot take a punch...</div></a></div>
              
            <div class="category" id="loan_planning"><a class="hit_area adviceRecommendationLoansLink" href="${pageContext.request.contextPath}/partner/recommendation/loans">
               <i class="ace-icon fa icon-cashflow bigger-250 dark"></i>
               <h4 class="head">Loans</h4>
              <div class="span">Loans are both good and bad...</div></a></div>
              
           <div class="category" id="goal_plan"><a class="hit_area adviceRecommendationGoalPlanLink" href="${pageContext.request.contextPath}/partner/goalPlanning">
              <i class="ace-icon fa icon-my-goals bigger-250 dark"></i>
              <h4 class="head">Goal Plan</h4>
              <div class="span">Setting goals and investing for goals in-stills discipline and focus...</div></a></div>
              
             <div class="category" id="tax_planning"><a class="hit_area adviceRecommendationTaxPlanningLink" href="${pageContext.request.contextPath}/partner/taxPlanning">
              <i class="ace-icon fa icon-tax-planning bigger-250 dark"></i>
              <h4 class="head">Tax Planning</h4>
              <div class="span">Paying tax is a responsibility, saving tax is a right...</div></a></div>
              
            <div class="category" id="emergency_planning"><a class="hit_area adviceRecommendationEmergencyPlanningLink" href="${pageContext.request.contextPath}/partner/recommendation/emergencyPlanning">
              <i class="ace-icon fa icon-emergency-planning size-48 dark"></i>
              <h4 class="head">Emergency Planning</h4>
             <div class="span">Accidents or health setbacks can happen to anyone and the need for large...</div></a></div>
             
            <div class="category" id="vacation_planning"><a class="hit_area adviceRecommendationVacationPlanningLink" href="${pageContext.request.contextPath}/partner/vacationPlanning">
              <i class="ace-icon fa icon-vacation-planning bigger-250 dark"></i>
              <h4 class="head">Vacation Planning</h4>
              <div class="span"> Plan your vaction and spend quality time with your near & dear ones</div></a></div>
              
            <div class="category" id="succession_planning"><a class="hit_area adviceRecommendationSuccessionPlanningLink" href="${pageContext.request.contextPath}/partner/successionPlanning">
              <i class="ace-icon fa icon-succession-planning bigger-250 dark"></i>
              <h4 class="head">Succession Planning</h4>
              <div class="span">Planning to smoothly pass on your assets is as important as life insurance itself...</div></a></div>
       
       <div class="clr"></div>
         
        </div>
        <div class="col-sm-4">
          <div id="help_tips_top" class="clearfix">
            <div class="help_tips_top_in">HELP TIPS</div>
          </div>
          
          <div class="space-4"></div>
          
          <!-- #section:elements.tab -->
										<div class="tabbable">
											<ul class="nav nav-tabs" id="myTab">
												<li class="active">
													<a data-toggle="tab" href="#risk_cover_tab">
														<i class="dark ace-icon fa icon-risk-cover bigger-160"></i>														
													</a>
												</li> 

												<li>
													<a data-toggle="tab" href="#loans_tab">
														
														<i class="dark ace-icon fa icon-cashflow bigger-160"></i>
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#emergency_planning_tab">
														
														<i class="dark ace-icon fa icon-emergency-planning bigger-160"></i>
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#goal_plan_tab">
														
														<i class="dark ace-icon fa icon-my-goals bigger-160"></i>
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#tax_planning_tab">
														
														<i class="dark ace-icon fa icon-tax-planning bigger-160"></i>
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#succession_planning_tab">
														
														<i class="dark ace-icon fa icon-succession-planning bigger-160"></i>
													</a>
												</li>
												<li>
													<a data-toggle="tab" href="#vacation_planning_tab">
														
														<i class="dark ace-icon fa icon-vacation-planning bigger-160"></i>
													</a>
												</li>
											</ul>
							<div class="tab-content">
											
												<div id="risk_cover_tab" class="tab-pane fade in active">
												
												
													<h3 class="heading">Risk Cover</h3>
   <p class="strong"> "It doesn't matter how hard you hit if you cannot take a punch"</p>  

<p>Assets are built with a lot of hard work. But it takes just one unfortunate event like a health crisis or a freak accident to wipe it all away.</p>

<p>Protecting your key assets from common risks is as important if not more important, than building more assets.</p>

<p class="strong northspace1">Key assets are </p>
<ul>
<li>Earning capacity of an individual</li>
<li>Physical or other assets that generate income  / save costs</li>
</ul>

<p class="strong">Common risks </p>
<p class="strong">That impact earning capacity of an individual are</p>
<ul>
<li>Early death</li>   <li> Critical illnesses</li>     <li>Accidents</li>    <li>Health setbacks</li>
<p class="strong">That can destroy assets that generate income are</p>
<li>Natural calamities</li>    <li>Man made mischief</li>    <li>Law suits</li>
</ul>

<p>Insurance is the most economical way of protecting most risks. </p>
												
												</div>

												<div id="loans_tab" class="tab-pane fade">
													 <h3 class="heading">Loans</h3>
   <p>Loans are both good and bad.</p> 
<p>Good because they help you purchase big assets without having all the money and yet enjoying most of the wealth the asset creates.</p>
<p>Bad because, you have to bear the interest cost and there is constant pressure on cash flows.</p>
<p>Managing loans better can substantially improve your financial situation. </p>
<p class="strong northspace1">A few ways to managing loans responsibly are :</p>
 <ul>
<li>Borrow only when it will improve your net worth</li>
 <li>Borrow at competitive costs</li>
 <li>Repay on time avoiding penalties</li>
 <li>Pay off loans earlier if you can </li>
 <li>Maintain all paperwork diligently</li>
 <li>Check your credit rating scores on a periodic basis </li>

</ul>
												</div>

												<div id="emergency_planning_tab" class="tab-pane fade">
													  <h3 class="heading">Emergency Planning</h3>
    <p>Emergencies can happen. We have in our lifetime witnessed earthquakes, tsunamis, cyclones, deluge and a few other natural calamities which have thrown many peoples' life in disarray. Accidents or health setbacks can happen to anyone and the need for large amounts of money in short notice may arise, followed by long periods of income loss.</p>

<p class="strong northspace1">Creating an emergency fund will help to</p>
<ul>
<li>Avoid borrowing</li>
<li>Avoid distress selling of assets</li>
<li>Avoid use of assets meant for some other goals</li>
</ul>

<p class="strong">How much Emergency funds a person needs to be decided on the following basis</p>
<ul>
<li>More the number of sources of income lesser is the amount required</li>
<li>More stable income with better employment benefits lesser is the amount required</li>
</ul>

<p>However an amount equivalent to atleast <strong>6 times household expenses</strong> is strongly recommended. And it is best to maintain that amount in safe and accessible investments like</p>
<ul>
<li>Liquid funds</li>
<li>Bank fixed deposits</li>
<li>Savings bank account</li>
</ul>
												</div>

												<div id="goal_plan_tab" class="tab-pane fade">
													 <h3 class="heading">Goal Plan</h3>
   <p> Setting goals and investing for goals instills discipline and focus to the whole exercise of investment planning.</p>
<p>Once investments are aligned to goals, the need for action is triggered not by market movements not in our control but on life events, more in our control.
</p>
<p class="strong northspace1">The Steps to Goal based planning are :</p>
<ul>
<li>Identify and name the Goal</li>
<li>Specify when you would like the goal achieved</li>
<li>Specify how much if might cost if the goal is to be achieved today</li>
<li>Check if existing assets can be used for this goal and calculate if that is going to be enough</li>
<li>If yes, provide for regular rebalancing of assets and ensure that asset can be converted to cash and used at the time of goal</li>
<li>If not, depending on time to goal and risk profile, arrive at additional investments to be made to meet the goal</li>
<li>Choose the right investment options and begin investing. </li>
<li>Stick to the plan till goal is reached.</li>
</ul>
												</div>
												
												
												<div id="goal_plan_tab" class="tab-pane fade">
													 <h3 class="heading">Goal Plan</h3>
   <p> Setting goals and investing for goals instills discipline and focus to the whole exercise of investment planning.</p>
<p>Once investments are aligned to goals, the need for action is triggered not by market movements not in our control but on life events, more in our control.
</p>
<p class="strong northspace1">The Steps to Goal based planning are :</p>
<ul>
<li>Identify and name the Goal</li>
<li>Specify when you would like the goal achieved</li>
<li>Specify how much if might cost if the goal is to be achieved today</li>
<li>Check if existing assets can be used for this goal and calculate if that is going to be enough</li>
<li>If yes, provide for regular rebalancing of assets and ensure that asset can be converted to cash and used at the time of goal</li>
<li>If not, depending on time to goal and risk profile, arrive at additional investments to be made to meet the goal</li>
<li>Choose the right investment options and begin investing. </li>
<li>Stick to the plan till goal is reached.</li>
</ul>
												</div>
												
												
												<div id="tax_planning_tab" class="tab-pane fade">
    <h3 class="heading">Tax Planning</h3>
    <p>"Paying tax is a responsibility, saving tax is a right"</p>
<p>All income whether salary or business income or rent or interest or lottery are all subject to income tax.</p>
<p>Tax laws undergo regular change. With some expert help and advance planning you could save some money from the taxman and invest it for your own future use.</p>


  </div>
  
  
   <div id="succession_planning_tab" class="tab-pane fade">
    <h3 class="heading">Succession Planning</h3>
  <p> Planning to smoothly pass on your assets is as important as life insurance itself.</p> 
<p class="strong">A well designed succession plan provides for</p>
<ul>
<li>Giving enough knowledge to the family on details of assets available</li>
<li>Making certain assets easily available to family when you can't operate it yourself (emergency situations)</li>
<li>In the unfortunate event of death, all dependents get easy access to the wealth you would like them to have.</li>
</ul>
<p>Succession Planning is a specialized and complex area and seeking expert help is recommended.</p>

  </div>
  
  <div id="vacation_planning_tab" class="tab-pane fade">
   <h3 class="heading">Vacation Planning</h3>
   <p>Planning your vacation along with your finance makes sense.</p>
   <p>Planning your vacation is also very vital part of your financial planning.</p>
   <p>Very well planned vacations will always bring smile to your loved ones.</p>
  </div>
											</div>
										</div>

										<!-- /section:elements.tab -->
										
        
   <div id="help_tips_bottom" class="clearfix"> 
<div class="clr"> </div>
</div>      
          
        </div>
        </div>
        
<!--  row ends here -->


 
      </section>      
      </div>
  
  <!--     this is Advice Recomendations Footer -->
<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
