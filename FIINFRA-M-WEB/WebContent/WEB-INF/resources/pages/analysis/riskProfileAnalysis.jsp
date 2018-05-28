<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- intilazie custom checkbox starts-->
<script>
$(document).ready(function(){
 $('.analysis_parent .analysis_description').slimScroll();
 $('.asset_allocation_parent').slimScroll();
 }) 
</script>

<!-- Wrapper starts-->
<div class="" id="risk_proflie_analysis"> 
  <!-- Main starts-->
  
  <section class="main"> 

    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
    
          <section class="in_content common_in_content clearfix analysis_page" id="">
      <div class="analysis_parent">
          <div class="first_column">
            
            <c:choose>
            <c:when test="${analysisResult == 40001}">
            <h2 class="heading"> Your Risk Profile is </h2>
            <p class="centerAll risk_pro_type theme_color">Conservative</p>
            <ul class="reset clearfix type_indicator">
            <li class="fl conservative_type selected"></li>
            <li class="fl balance_type"></li>
            <li class="fl aggressive_type"></li>
            </ul>
            </c:when>
            <c:when test="${analysisResult == 40002}">
            <h2 class="heading">Your Risk Profile is </h2>
            <p class="centerAll risk_pro_type theme_color">Balanced</p>
            <ul class="reset clearfix type_indicator">
            <li class="fl conservative_type"></li>
            <li class="fl balance_type selected"></li>
            <li class="fl aggressive_type"></li>
            </ul>
            </c:when>
            <c:when test="${analysisResult == 40003}">
            <h2 class="heading">Your Risk Profile is </h2>
            <p class="centerAll risk_pro_type theme_color">Aggressive</p>
            <ul class="reset clearfix type_indicator">
            <li class="fl conservative_type"></li>
            <li class="fl balance_type"></li>
            <li class="fl aggressive_type selected"></li>
            </ul>
            </c:when>
            </c:choose>
            <!--<div class="thumb thumb_up"></div>-->
          </div>
          <div class="second_column">
            <h2 class="heading">Recommended Asset allocation</h2>
            <div class="asset_allocation_parent"><table class="asset_allocation">            
            <tr><th>Year to Goal</th><th class="col_width">Equity</th><th class="col_width">Debt</th><th class="col_width">Gold</th></tr>
            <c:forEach items="${riskProfileMap}" var="riskProfileList">
            	<tr>
            		<td>${riskProfileList.key}</td>
            		<td style="text-align:center;" id="lbl_${riskProfileList.key}_46001"><span>0 %</span></td>
            		<td style="text-align:center;" id="lbl_${riskProfileList.key}_46002"><span>0 %</span></td>
            		<td style="text-align:center;" id="lbl_${riskProfileList.key}_46003"><span>0 %</span></td>            		
            	</tr>
            </c:forEach>
            </table></div>
            
          </div>
          <div class="clr"></div>
          <div class="first_row">
          <div class="analysis_description">
          <h4 class="head">Analysis Report Risk Profile</h4>
          <c:choose>
          	<c:when test="${analysisResult eq 40001}">
          	
          		<p>You may not like taking too much risk with your investments.   You may find it more comfortable to pay off your loans (if you have any) over investing any surplus money for growth.
					If you choose investments that are more stable and give steady returns, you are likely to stick to your decisions and hence will be in a better position to reach your goals.
					However, there could be some risks that you may not be seeing now - like risk of capital erosion due to inflation. <br/>
					Recommended course of action:<br/>
					Take a decision after carefully considering all types of risks - especially the <strong>risk of loss of capital</strong> and the <strong>risk of loss of purchasing power</strong>. 
				</p>
          	
          	</c:when>
          	<c:when test="${analysisResult eq 40002}">
          	
          		<p>You are more likely to take moderate risk with your investments. You probably understand different kinds of risks - risks that can result in loss to capital in the short term and risks that can result in loss to purchasing power in the long term.
					If you have a loan and some surplus money, you are likely to weigh the costs and benefits of repaying loans vs investing the money and then taking a decision.<br/>
					Recommended course of action:<br/>
 					Having a clear understanding of what you are getting into and studying all elements of the products you buy could be critical to ensure you stick to your plan.           		          		
          		</p>
          	
          	</c:when>
          	<c:when test="${analysisResult eq 40003}">
				<p>You probably have a high appetite for risk and are willing to try new things and give second chances. Steady investments where there is not much action may make you restless.  You are likely to forget the losses of the past and expect a repeat of the good times.<br/>
					Recommended course of action:<br/>
					Stick to a well thought out plan. Before acting or taking any critical decision consider the pros and cons rationally. 									
				</p>          	
          	</c:when>
          </c:choose>
          
          </div>
          </div>
        </div>
        
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list"><a href="data-collection.html" class="anch save inactiveLink"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/riskProfile/datacollection/risk-profile/${partyId}" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="financial-readiness.html" class="anch skip inactiveLink"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="#" class="anch add_note inactiveLink"><span class="txt">Notes</span></a></li>
  <li class="fl list"><a href="#" class="anch add_doc inactiveLink"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset inactiveLink"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan inactiveLink"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="emergency-readiness.html" class="back navgation inactiveLink"><span class="txt">Back</span></a> <a href="retirement-readiness.html" class="next navgation inactiveLink"><span class="txt">Next</span></a></section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
  </section>
</div> 
<script>
$(document).ready(function(){
	var pieces=[];
	var pieces1=[];
	<c:forEach items="${riskProfileMap}" var="riskProfileList">		
		var goalYear="${riskProfileList.key}";
		var assetId="${riskProfileList.value}";
		pieces=assetId.split("/");		
		for(var i=0;i<pieces.length;i++){
			if(pieces[i]!=""){
				pieces1=pieces[i].split("_");
				document.getElementById("lbl_"+goalYear+"_"+pieces1[0]).innerHTML=pieces1[1]+" %";	
			}			
		}
	</c:forEach>
});
</script>