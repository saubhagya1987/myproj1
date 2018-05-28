<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Wrapper starts-->
<div class="" id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">
      <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>  
      <!-- Common_in_contnet starts-->
      <section class="in_content analysis_page common_in_content clearfix " id="succession-readiness-analysis">
      <c:set var="thumbCss" value="thumb_horizontal" ></c:set>       
        <c:choose>
          	<c:when test="${analysisDetails.firstTake eq 'UP'}">
          		<c:set var="thumbCss" value="thumb_up" />
          	</c:when>
          	<c:when test="${analysisDetails.firstTake eq 'DOWN'}">
          		<c:set var="thumbCss" value="thumb_down" />
          	</c:when>
          	<c:otherwise>
          		<c:set var="thumbCss" value="thumb_horizontal" />
          	</c:otherwise>          	
          </c:choose>
        <div class="analysis_parent">
          <div class="first_column">
            <h2 class="heading">first take</h2>
           	<div class="thumb ${thumbCss}"></div>
          </div> 
            <div class="second_column">
            <h2 class="heading">your legacy lives on....</h2>
            <div class="legacy_two">              
          		<c:set var="analysisAns" value="${fn:split(analysisDetails.analysis, ',')}"/>
				<c:choose>
					<c:when test="${analysisAns[0] eq 'YES' }">
						<div class="box">
		                	<div class="top"><div class="happy"></div></div>
		                	<div class="middle"><span>Your family know <br/>where you have invested <br/>your money.</span></div>
		                	<div class="bottom"><div class="family_invest_yes" ></div></div>
		              	</div>
					</c:when>
					<c:otherwise>
						<div class="box">
		                	<div class="top"><div class="unhappy"></div></div>
		                	<div class="middle"><span>Your family don't know <br/>where you have invested <br/>your money.</span></div>
		                	<div class="bottom"><div class="family_invest_no" ></div></div>
		              	</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${analysisAns[1] eq 'YES' }">
						<div class="box">
		                	<div class="top"><div class="happy"></div></div>
			                <div class="middle"><span>Your family has<br/>access to<br/>your money.</span></div>
			                <div class="bottom"><div class="family_access_money_yes" ></div></div>
			            </div>
					</c:when>
					<c:otherwise>
						<div class="box">
		                	<div class="top"><div class="unhappy"></div></div>
		               	 	<div class="middle"><span>Your family don't have<br/>access to<br/>your money.</span></div>
		                	<div class="bottom"><div class="family_access_money_no" ></div></div>
		              	</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${analysisAns[2] eq 'YES' }">
						<div class="box">
			                <div class="top"><div class="happy"></div></div>
			                <div class="middle"><span>You have<br/>written will.<br/></span></div>
			                <div class="bottom"><div class="family_will_yes" ></div></div>
			        	</div>
					</c:when>
					<c:otherwise>
						<div class="box">
			                <div class="top"><div class="unhappy"></div></div>
			                <div class="middle"><span>You have not<br/>written will.<br/>You must !</span></div>
			                <div class="bottom"><div class="family_will_no" ></div></div>
			            </div>              
					</c:otherwise>
				</c:choose>          
              
            </div>
          </div>
          <div class="clr"></div>
          <div class="first_row">
            <div class="analysis_description" style="font-size: 15px;line-height: 1.5">
              <h4 class="head">Description</h4>
              <p>
Succession Planning is as good as Risk planning. Plan for the wellbeing of your loved ones if things don't go too well.
You can legally transfer assets through</p>
<ul>
<li>Appropriate nominations.</li>
<li>Through a properly written Will.</li>
<li>By creating trusts.</li>
<li>By giving away as Gifts.</li>
</ul>
<p>Do it today. Do it for those you love. Do it for peace - today and tomorrow.
			  </p>
            </div>
          </div>
        </div>
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list inactiveLink"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/succession-readiness/${partyId}" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
 <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
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
    $('.analysis_parent .legacy').slimScroll();
	$('.analysis_parent .analysis_description').slimScroll();
});
 
</script>
