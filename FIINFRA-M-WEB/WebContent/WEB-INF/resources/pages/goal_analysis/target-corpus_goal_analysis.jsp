<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.inactiveLink{ pointer-events: none; opacity: 0.4;}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="wrapper" id="loan_status_analysis_wrapper">  
  	<!--section class="main"--> 
    <!-- Common_content Starts-->
    <section class="content common_content">
     	<!-- Common_in_contnet starts-->
     	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
     	<div class="clr"></div>
<!-- Common_in_contnet starts-->
      <section class="in_content analysis_page common_in_content clearfix" id="succession-readiness-analysis">
        <div class="analysis_parent">
          <div class="first_column">
            <h2 class="heading">first take</h2>
                <div class="thumb ${thumb}"></div>
	      </div>
          <div class="second_column">
            <h2 class="heading">Analysis</h2>
            <div class="analysis_one_car_goal">
            <div class="ana_title_year">${startYear}</div>
            <c:set var="startAmount">
            <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${startAmount}"/>
            </c:set>
            <div class="ana_title_amt">[ ${startAmount} lacs ]</div>
            
           <div class="analysis_one_car_goal_img"> </div></div> 
             <c:set var="endAmount">
            <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${endAmount}"/>
            </c:set>
            <div class="analysis_middle_car_goal"><div class="car_ana_title"> in <span class="car_ana_title_active">${endYear}</span> You will need
 an amount of<span class="car_ana_title_active">
${endAmount}  <span style="text-transform: lowercase;">lacs</span></span> 
<c:choose>
	<c:when test="${description eq 'Down payment'}">
		as Down payment for
		achieving your goal</div>
	</c:when>
	<c:otherwise> for
		achieving your goal</div>
	</c:otherwise>
</c:choose>
         </div>
            <div class="analysis_third_car_goal">
                        <div class="ana_title_year">${endYear}</div>
            <div class="ana_title_amt">[ ${endAmount} lacs ]</div>

             <div class="analysis_third_car_goal_img">  </div></div><div class="clr"></div>
          </div>
          <div class="clr"></div>
          <div class="first_row">
          
          <div class="Car_Des"><div class="title">Description</div>
         <p class="txt">Whatever you are doing now will help you accumulate <span class="txt_act">${allocatedAssets} %</span> of the total amount you will need.</p>          </div>
         
         <div class="Car_Scale"><div class="title">Achievement Scale</div>
         <div class="label">Value of Allocated
Assets</div> 

 <div class="range"><div class="range_label_min">${startYear}</div><div class="range_label_max">${endYear}</div>
 <c:set var="width" value="${(362*allocatedAssets)/100}"/>
 <div class="progress_bar" style="width:${width}px;"><div class="range_label">${allocatedAssets} %</div></div></div></div>         </div>
         
         </div> 
     
     </section>
      <!-- Common_in_contnet ends --> 
       <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list	"><a href="javascript: void(0)" class="anch save blur inactiveLink"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${cancel}" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="javascript: void(0)" class="anch skip inactiveLink" ><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="javascript: void(0)" class="anch add_note inactiveLink"><span class="txt">Notes</span></a></li>
            <li class="fl list"><a href="javascript: void(0)" class="anch add_doc inactiveLink" style="pointer-events: none;"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset inactiveLink"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan inactiveLink"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="javascript: void(0)" class="back navgation inactiveLink" ><span class="txt">Back</span></a> <a href="javascript: void(0)" class="next navgation inactiveLink" ><span class="txt">Next</span></a></section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<script>
$(document).ready(function(){
 $('.analysis_parent .analysis_description').slimScroll();
}); 
</script>
