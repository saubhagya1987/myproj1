<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="" id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">
    	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>  
      <!-- Common_in_contnet starts-->
      <section class="in_content analysis_page common_in_content clearfix" id="succession-readiness-analysis">
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
          
        <c:set var="titleCssSafe" value="ana_title" ></c:set>
        <c:set var="divCssSafe" value="blur" ></c:set>
        
        <c:set var="titleCssDanger" value="ana_title" ></c:set>
        <c:set var="divCssDanger" value="blur" ></c:set>
        
        <c:set var="titleCssConf" value="ana_title" ></c:set>
        <c:set var="divCssConf" value="blur" ></c:set>                
        <c:choose>
          	<c:when test="${analysisDetails.analysis eq 'SAFE'}">
          		<c:set var="titleCssSafe" value="ana_title_active" ></c:set>
        		<c:set var="divCssSafe" value="" ></c:set>
          	</c:when>
          	<c:when test="${analysisDetails.analysis eq 'DANGER'}">
          		<c:set var="titleCssDanger" value="ana_title_active" ></c:set>
        		<c:set var="divCssDanger" value="" ></c:set>
          	</c:when>
          	<c:when test="${analysisDetails.analysis eq 'COMFORTABLE'}">
          		<c:set var="titleCssConf" value="ana_title_active" ></c:set>
        		<c:set var="divCssConf" value="" ></c:set>
          	</c:when>
          	<c:otherwise></c:otherwise>          	
         </c:choose>
          
        <div class="analysis_parent">
          <div class="first_column">
            <h2 class="heading">first take</h2>
            <div class="thumb ${thumbCss }"></div>
          </div>
                  
          <div class="second_column">
            <h2 class="heading">Analysis</h2>
            <div class="analysis_danger ${divCssDanger}">
            	<div class=" ${titleCssDanger}">DANGER</div>
           		<div class="analysis_danger_img"><img src="${pageContext.request.contextPath}/resources/images/ana_danger.png" width="67" height="96" alt=""></div>
           	</div>
            <div class="analysis_safe ${divCssSafe}">
            	<div class="${titleCssSafe}">SAFE</div>
         		<div class="analysis_safe_img"><img src="${pageContext.request.contextPath}/resources/images/ana_safe.png" width="103" height="96" alt=""></div>
         	</div>
            <div class="analysis_com ${divCssConf}">
            	<div class="${titleCssConf}">COMFORTABLE</div>
             	<div class="analysis_com_img"><img src="${pageContext.request.contextPath}/resources/images/ana_com.png" width="123" height="152" alt=""></div>
             </div>
             <div class="clr"></div>
          </div>
          <div class="clr"></div>
          <div class="first_row">
          <div class="analysis_description">
          <h4 class="head">The need for Emergency Fund</h4>
         	<p> Emergency situations may arise due to natural calamities, accidents, changes in economic environment or more.</p>
			<p>Though we can't control it, we can respond better with some planning.</p>
			<p>If not prepared, an emergency might leave you poorer, debt ridden or helpless.</p>
			<p>You may fall down, but will you be able to get back on your feet again?</p>          
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
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness/${partyId}" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
         <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/suggestion/emergency-readiness/${partyId}" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/actionplan/emergency-readiness-action-plan/${partyId}" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation inactiveLink"><span class="txt">Back</span></a> 
        <a href="#" class="next navgation inactiveLink"><span class="txt">Next</span></a>
       </section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<!-- Emergency Confidence range value calculator starts --> 
<script>
  	$("input[name='confidence_input']").each(function () {      
		$("<span>").addClass("output hide-elem").attr('id', 'confidence_input').insertAfter($(this));
    }).bind("slider:ready slider:changed", function (event, data) {
		$(this).nextAll(".output:first").html(data.value.toFixed(0));
	});

$(document).ready(function(){
    $('.analysis_parent .legacy').slimScroll();
	$('.analysis_parent .analysis_description').slimScroll();
	$('.toggle').toggles();
 	//assets accessible AND distributed value Slider
	createSlider('#succession_rating',1,5,1,"#S_R_Value");
});
</script>