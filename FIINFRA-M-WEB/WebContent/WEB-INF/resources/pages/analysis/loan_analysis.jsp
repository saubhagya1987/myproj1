<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="" id="loan_status_analysis_wrapper">  
  	<!--section class="main"--> 
    <!-- Common_content Starts-->
    <section class="content common_content">
     	<!-- Common_in_contnet starts-->
     	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
     	<div class="clr"></div>
    	<!-- Common_content Starts-->
	    <section class="content common_content">
	      <!-- Common_in_contnet starts-->
	      <section class="in_content common_in_content clearfix analysis_page loan-staus-analysis" id="risk-cover-analysis">
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
	            <h2 class="heading">your loans</h2>
	            <div class="insurance_meter">
		            <div class="i_meter">
		            	<span class="range first">Low</span>           
		              	<span class="range third">Medium</span>             
		                <span class="range fifth">High</span>            
		            	<span class="arrow"></span><span class="arrow_base"></span>
		            </div>
	         	</div>
	          </div>
	          <div class="clr"></div>
	          <div class="first_row">
	          <div class="analysis_description">
	          <h4 class="head">Leverage - take you UP or DOWN</h4>
	         <p>Are loans good or bad? Loans help us acquire assets that can make us wealthy. If managed well it can catapult us to the next level - that is why is it called leverage.
	But when not managed properly it can leave us in deep trouble. As long as the loan is helping you improve your wealth or income and as long as repaying the loan is not a big stress on your pocket or head -loans are good.</p>          
	          </div>
	          </div>
	        </div>
	      </section>
	      <!-- Common_in_contnet ends --> 
	      <!-- Common footer starts -->
	      <section class="common_footer_actions">
	        <div id="main_actions" class="clearfix">
	          <ul class="reset clearfix fr btn_grup3">
	            <li class="fl list inactiveLink"><a href="data-collection.html" class="anch save"><span class="txt">Save</span></a></li>
	            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/loan-status/${partyId}" class="anch cancel"><span class="txt">Cancel</span></a></li>
	            <li class="fl list inactiveLink"><a href="financial-readiness.html" class="anch skip"><span class="txt">Skip</span></a></li>
	          </ul>
	          <ul class="reset clearfix fr btn_grup2">
	            <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
	  <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
	          </ul>
	          <ul class="reset clearfix fl btn_grup1">
	            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
	            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/suggestion/loan-status/${partyId}" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
	            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
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

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

$(document).ready(function(){
 $('.analysis_parent .analysis_description').slimScroll();
 
 $(function() {
	 	var analysisData = '${analysisDetails.analysis}';	 		 
	 	var angleToRotate = 0;
	 	if(analysisData != 'null'){
	 		var number = 100;
	 		var angle = analysisData / number;
	 		var angle = angle * 180;	 		
	 		angleToRotate = angle - 90;
	 	} else {
	 		displayMsg("<spring:message code='error.analysis.dataNotDefined' />");
	 	}
		var $elie = $(".arrow");
		
	    rotate(angleToRotate);
	  	function rotate(degree) {
	     	$elie.css({
	                  '-webkit-transform': 'rotate(' + degree + 'deg)',
	                  '-moz-transform': 'rotate(' + degree + 'deg)',
	                  '-ms-transform': 'rotate(' + degree + 'deg)',
	                  '-o-transform': 'rotate(' + degree + 'deg)',
	                  'transform': 'rotate(' + degree + 'deg)',
	                  
	      	});
	  	}
 	});
}); 
</script>
