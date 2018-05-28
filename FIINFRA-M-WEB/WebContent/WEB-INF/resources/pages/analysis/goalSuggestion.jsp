<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
p {font-size: 17px;line-height:1.2;}
li {font-size: 18px;line-height:1.2;}
</style>
<div class="wrapper" style="min-height:360px;"> 
  <!-- Main starts--> 
  <!--section class="main"-->   
  <!-- Common_content Starts-->
  <section class="content common_content">
  <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
    <!-- Common_in_contnet starts-->
        
    <c:if test="${error}">
    	<div class="error">
    		<c:out value="${error}"></c:out>
    	</div>
    </c:if>
    <div class="clr"></div>
    <br><br>
          <!-- Common Goal Sugesstion Starts -->
          <div id="common_goal_suggestion" class="northspace1">
            <p class="strong theme_color">With current assets and investments you can achieve <fmt:formatNumber type="number" maxFractionDigits="0" value="${goalachievement}"/> % of your <span class="theme_color val">${goalName}</span> in the year
              <span class="theme_color val">${goalYear}</span></p>
            <br/>
            <p><span class="strong theme_color">Suggested action </span>:</p>
            <ul>
              <li>Align the investments to the goal and keep in separate investment accounts. </li>
              <li>Reallocate assets to optimize risk and returns</li>
              <li>Regularly rebalance portfolio</li>
              <li>As goals get nearer, move assets to safer avenues like liquid funds / bank accounts</li>
            </ul>
          </div>
          <!-- Common Goal Sugesstion Ends --> 
         
         <!-- Genral Goal Sugesstion Starts -->
         <c:if test="${goalType!='Travel'}">
         <c:if test="${goalachievement <=80 }">
         <!-- Goal Upto 80% Starts --> 
          <div id="goal_upto_80" class="genral_goal_suggestion northspace1 ">
           <p>Your goal of  <span class="theme_color val">${goalName}</span> in the year <span class="theme_color val">${goalYear}</span> cannot be achieved with the assets you have and with the investments you are doing.</p> 
           <c:choose>
				<c:when test="${description eq 'Down payment'}">
					<p><strong> You can do the following to do better</strong> : - For the Down payment please do a regular monthly investment of Rs.<span class="theme_color val"> ${investAmount}</span> amount (or) one time investment of Rs. <span class="theme_color val">${goalLumpSumAmount}</span> amount And rest of the required can be achieved by taking loan.</p>
				</c:when>
				<c:otherwise>
					<p><strong>You can do the following to do better</strong> : - Invest an amount of Rs.<span class="theme_color val">${investAmount}</span> regularly (or) Invest a lumpsum amount of Rs. <span class="theme_color val">${goalLumpSumAmount}</span>  one time - You can consider postponing the goal if possible - If the goal is very important, you may have to borrow to meet the goal.</p>
				</c:otherwise>
			</c:choose>
          </div>
          </c:if>
         <!-- Goal Upto 80% Ends -->
         
         <!-- Goal Upto 100% Starts -->
         <c:if test="${goalachievement >80 and allocationAssets<=99 }" >
          <div id="goal_upto_100" class="genral_goal_suggestion northspace1 ">
         	<p>"Your goal of <span class="theme_color val">${goalName}</span> in the year <span class="theme_color val">${goalYear}</span> can be somewhat achieved with the assets you have and with the investments you are doing.</p>
			<c:choose>
				<c:when test="${description eq 'Down payment'}">
					<p><strong> You can do the following to do better</strong> : - For the Down payment please do a regular monthly investment of Rs.<span class="theme_color val"> ${investAmount}</span> amount (or) one time investment of Rs. <span class="theme_color val">${goalLumpSumAmount}</span> amount And rest of the required can be achieved by taking loan.</p>
				</c:when>
				<c:otherwise>
					<p><strong> You can do the following to do better</strong> : - Invest an amount of Rs.<span class="theme_color val"> ${investAmount}</span> regularly (or) Invest a lumpsum amount of Rs. <span class="theme_color val">${goalLumpSumAmount}</span >one time - Align the investments to the goal and keep in separate a/cs. For eg: Investments for children can be made in their name or in separate folio with the child as the nominee.</p>
				</c:otherwise>
			</c:choose>
			<ul>
				<li>Reallocate assets to reduce risks and improve returns</li>
				<li>Regularly rebalance portfolio</li>
				<li>Improve chances of achieving goals by moving assets to safer and easily en-cashable investments as the goals get closer</li>
			</ul>
			</p>
            
          </div>
          </c:if>
          <!-- Goal Upto 100% Ends -->
         
          <!-- Goal above 100% Starts --> 
          <c:if test="${goalachievement==100}" >
          <div id="goal_above_100" class="genral_goal_suggestion northspace1 ">
         	<p>Your goal of <span class="theme_color val">${goalName}</span> in the year <span class="theme_color val">${goalYear}</span> can be somewhat achieved with the assets you have and with the investments you are doing.</p>
			<p><strong> You can do the following to do better</strong> : - Align the investments to the goal and keep in separate a/cs. For eg: Investments for children can be made in their name or in separate folio with the child as the nominee</p>
			<ul>
				<li>Reallocate assets to reduce risks and improve returns</li>
				<li>Regularly rebalance portfolio</li>
				<li>Improve chances of achieving goals by moving assets to safer and easily en-cashable investments as the goals get closer</li>
			</ul>
			</p>
          </div>
          </c:if>
          <!-- Goal above 100% Ends -->
          </c:if>
          <!-- Genral Goal Sugesstion Ends --> 
        
         <!-- Travel and Vacation Goal Sugesstion Starts -->
         <c:set var="type" value="Travel"/>
         <c:if test="${goalType==type}">
          <!-- Goal Upto 80% Starts --> 
           <c:if test="${goalachievement <=80 }">
          <div id="tv_goal_upto_80" class="travel_vacation_goal northspace1">
        	<p>Your goal of <span class="theme_color val">${goalName}</span> in the year <span class="theme_color val">${goalYear}<span class="theme_color val"> cannot be achieved with the assets you have and with the investments you are doing.</p> <p><strong>You can do the following to do better</strong> : - We can plan your yearly vacation in following ways:</p>
   			<ol>
			   <li>Invest Rs.<span class="theme_color val"> ${investAmount}</span>every month in a bank recurring deposit or liquid fund OR</li>
			   <li>Keep the annual bonus/profit in the bank and spend it when you go on vacation OR</li>
			   <li>A time share property can be bought. This will ensure that lodging facilities when you go on holidays is taken care of and the costs are protected from inflation for the next <span class="theme_color val">25</span> years. The property are usually well maintained and in popular holiday destinations. The costs can be - down payment of approx. Rs.<span class="theme_color val">20,000</span> to Rs.<span class="theme_color val">40,000</span>, a <span class="theme_color val">48</span> month EMI of approx. Rs.<span class="theme_color val">5,000</span> to Rs.<span class="theme_color val">10,000</span>  (depending on size and timing of holidays) and annual maintenance cost of approx. Rs.<span class="theme_color val">10,000</span> to <span class="theme_color val">15,000</span>. There are interesting and economical options here which you can consider.</li>			   
   			</ol>
   	      </div>
          </c:if>
		<!-- Goal Upto 80% Ends -->
         
        <!-- Goal Upto 100% Starts -->
        <c:if test="${goalachievement >80 and allocationAssets<=99 }" >
        	<div id="tv_goal_upto_100" class="travel_vacation_goal northspace1">
        
			<p>Your goal of <span class="theme_color val">${goalName}</span> in the year <span class="theme_color val">${goalYear}</span> can be somewhat achieved with the assets you have and with the investments you are doing.</p>
			<p><strong> You can do the following to do better</strong> : - We can plan your yearly vacation in following ways:</p>
			<ul>
				<li>Invest Rs. <span class="theme_color val"> ${investAmount}</span>every month in a bank recurring deposit or liquid fund OR</li>
				<li>Keep the annual bonus/profit in the bank and spend it when you go on vacation OR</li>
				<li>A time share property can be bought. This will ensure that lodging facilities when you go on holidays is taken care of and the costs are protected from inflation for the next <span class="theme_color val">25</span> years. The property are usually well maintained and in popular holiday destinations. The costs can be - down payment of approx. Rs.<span class="theme_color val">20,000</span> to Rs.<span class="theme_color val">40,000</span>, a <span class="theme_color val">48</span> month EMI of approx. Rs.<span class="theme_color val">5,000</span> to Rs.<span class="theme_color val">10,000</span>  (depending on size and timing of holidays) and annual maintenance cost of approx. Rs.<span class="theme_color val">10,000</span> to <span class="theme_color val">15,000</span>. There are interesting and economical options here which you can consider.</li>
			</ul>
			 
          </div>
          </c:if>
          <!-- Goal Upto 100% Ends -->
         
          <!-- Goal above 100% Starts --> 
          <c:if test="${goalachievement==100}" >
          	<div id="goal_above_100" class="genral_goal_suggestion northspace1">
				<p><span class="strong theme_color">Relevant advice on Analysis Report "Our Suggestion"</span>:</p>
				<p>Your goal of <span class="theme_color val">${goalName}</span> in the year <span class="theme_color val">${goalYear}</span> can be comfortably achieved with the assets you have and with the investments you are doing. </p>
				<p><strong> You can do the following to do better</strong> : - We can plan your yearly vacation in following ways:</p>
				<ul>
					<li>Invest Rs.<span class="theme_color val">${investAmount}</span>every month in a bank recurring deposit or liquid fund OR</li>
					<li>Keep the annual bonus/profit in the bank and spend it when you go on vacation OR</li>
					<li>A time share property can be bought. This will ensure that lodging facilities when you go on holidays is taken care of and the costs are protected from inflation for the next <span class="theme_color val">25</span> years. The property are usually well maintained and in popular holiday destinations. The costs can be - down payment of approx. Rs.<span class="theme_color val">20,000</span> to <span class="theme_color val">Rs.40,000</span>, a <span class="theme_color val">48</span> month EMI of approx. Rs.<span class="theme_color val">5,000</span> to Rs.<span class="theme_color val">10,000</span> (depending on size and timing of holidays) and annual maintenance cost of approx. Rs.<span class="theme_color val">10,000</span> to <span class="theme_color val">15,000</span>. There are interesting and economical options here which you can consider.</li>
					
				</ul>
				
          </div>
          <!-- Goal above 100% Ends -->
          </c:if>
          </c:if>
          <!-- Travel and Vacation Goal Sugesstion Ends --> 
 		</div>
      </section>
      
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list inactiveLink"><a href="data-collection.html" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${cancelLink}" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list inactiveLink"><a href="financial-readiness.html" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
          <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
     	  <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="${analysisLink}" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list "><a href="javascript:void(0);" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
         	<li class="fl list"><a href="${actionPlanLink}" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
            
          </ul>
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
$(document).ready(function(){
 $('#suggestion').slimScroll();
 	if('${screen}' == "education"){
 		$(".head_txt").text("Education Goal Suggestion");
 		$("title").text("Education Goal Suggestion");
 	}
 	else if('${screen}' == "business")
 		{
 		$(".head_txt").text("Business Goal Suggestion");
 		$("title").text("Business Goal Suggestion");
 		}
 	else if('${screen}' == "car")
		{
		$(".head_txt").text("Car Goal Suggestion");
		$("title").text("Car Goal Suggestion");
		}
 	else if('${screen}' == "other")
	{
	$(".head_txt").text("Other Goal Suggestion");
	$("title").text("Other Goal Suggestion");
	}
 	else if('${screen}' == "property")
	{
	$(".head_txt").text("Property Goal Suggestion");
	$("title").text("Property Goal Suggestion");
	}
 	else if('${screen}' == "special")
	{
	$(".head_txt").text("Special Goal Suggestion");
	$("title").text("Special Goal Suggestion");
	}
 	else if('${screen}' == "wedding")
	{
	$(".head_txt").text("Wedding Goal Suggestion");
	$("title").text("Wedding Goal Suggestion");
	}
 	else if('${screen}' == "travel")
	{
	$(".head_txt").text("Travel Goal Suggestion");
	$("title").text("Travel Goal Suggestion");
	}
 	else if('${screen}' == "target-corpus")
	{
	$(".head_txt").text("Target Corpus Goal Suggestion");
	$("title").text("Target Corpus Goal Suggestion");
	}
 		
}); 
</script>
