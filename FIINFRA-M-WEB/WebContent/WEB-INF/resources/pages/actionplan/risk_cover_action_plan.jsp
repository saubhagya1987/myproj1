<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.risk_cover_action_plan_bx_ul li .txt {
	font-size: 12px;
}
.risk_cover_action_plan_bx_ul li .app_txt {
color: #FF2F2F;
}
.risk_cover_action_plan_bx_ul li .common_custom_checkbox {
top: 12px;
}
</style>
<!-- Common_content Starts-->
  <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>      
    
    <section class="content common_content"> 
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content action_plan_page clearfix">
        <form name="riskCoverForm" id="riskCoverForm" method="post" action="${pageContext.request.contextPath}/actionplan/saveRiskCoverActionPlan">
        <input type="hidden" name="productId" id="productId" value="0"/>
        <input type="hidden" name="riskNameHidden" id="riskNameHidden" value="0"/>
        <input type="hidden" name="partyId" id="partyId" value="${partyId}"/>
        <c:set var="riskIds" value="0"/>        
        <div class="risk_cover_action_plan_bx">
          	<ul class="reset clearfix risk_cover_action_plan_bx_ul">
	            <li class="input_title_one fl">Sr. No </li>
	            <li class="input_title_two fl">Risk</li>
	            <li class="input_title_three fl">Cover Required</li>
	            <li class="input_title_four fl">Cover Available</li>
	            <li class="input_title_five fl">Recommended Products</li>
	            <li class="input_title_six fl">Allocation Percent</li>
	            <li class="input_title_seven fl">Premium Amount</li>
	            <li class="input_title_eight fl"><div class="title_one">Client Approval</div><div class="title_two">Status</div> </li>
	            <li class="input_title_nine fl"><div class="title_three">Action</div> </li>           
          	</ul>
          <div class="risk_cover_action_plan_bx_in">
          	<c:forEach items="${actionPlanData}" var="actionPlan" varStatus="counter">
          		<c:set var="cover" value="${fn:split(actionPlan.coverAvailable, ' ')}" />
          		<c:set var="required" value="${fn:split(actionPlan.coverRequired, ' ')}" />
          		<fmt:parseNumber var="coverNum" type="number" value="${cover[0]}" />
          		<fmt:parseNumber var="requiredNum" type="number" value="${required[0]}" />
          		<c:if test="${coverNum < requiredNum}">
	          		<input type="hidden" name="riskId_${actionPlan.fpAdviseRecommendId}" id="riskId_${actionPlan.fpAdviseRecommendId}" value="${actionPlan.riskId}"/>
	          		<ul class="reset clearfix risk_cover_action_plan_bx_ul">
		            <li class="input_one fl"> <span class="txt">${counter.count} </span> </li>
		            <li class="input_two fl"> <span class="txt">  ${actionPlan.risk} 
		            <input type="hidden" name="risk_${actionPlan.fpAdviseRecommendId}" id="risk_${counter.count}" value="${actionPlan.risk}"/>
		            </span> </li>
		            <li class="input_three fl"> <span class="txt"> ${actionPlan.coverRequired}
		            <input type="hidden" name="coverRequired_${actionPlan.fpAdviseRecommendId}" id="coverRequired_${counter.count}" value="${actionPlan.coverRequired}"/>
		            </span> </li>
		            <li class="input_four fl"> <span class="txt"> ${actionPlan.coverAvailable}
		            <input type="hidden" name="coverAvailable_${actionPlan.fpAdviseRecommendId}" id="coverAvailable_${counter.count}" value="${actionPlan.coverAvailable}"/>
		            </span> </li>
		            <li class="input_five fl">
		              	<%-- <select class="sel_box" name="productId_${actionPlan.riskId}" id="productSelect_${counter.count}">
		              	</select> --%>
		              	<input type="text" name="product_${actionPlan.fpAdviseRecommendId}" class="input" 
		              	id="product_${counter.count}" value="${actionPlan.productName}" readonly="readonly" style="width: 138px;margin-left: 5px;"/>
		              	<input type="hidden" name="productId_${actionPlan.fpAdviseRecommendId}" id="productId_${counter.count}" 
		              	value="${actionPlan.productId}" style="width: 138px;margin-left: 5px;"/>
		            </li>
		            <li class="input_six fl">
						<input type="text" name="allocationPercent_${actionPlan.fpAdviseRecommendId}" class="input" 
						id="allocationPercent_${counter.count}" value="${actionPlan.allocationPercent}" style="margin-left:10px;" readonly="readonly"/>
						<span style="margin-left:5px;">%</span>
		            </li>
		            <li class="input_seven fl">
		             	<img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
						<input type="text" name="premiumAmount_${actionPlan.fpAdviseRecommendId}" class="input" 
						id="premiumAmount_${counter.count}" value="${actionPlan.premiumAmount}" readonly="readonly"/>
		            </li>
		            <c:choose>
		            	<c:when test="${actionPlan.actionApprovalId eq '95002'}">
		            		<li class="input_eight fl"> <span class="app_txt02">Sent for Approval</span> </li>
		            		<li class="input_nine fl">  
		            		<span class="common_custom_checkbox white_checkbox_checkbox_checked not_clickable"></span>
		            		<input type="checkbox"  name="clientApprovalChkbx_${actionPlan.fpAdviseRecommendId}" class="default_checkbox" value="${actionPlan.actionApprovalId}"  checked="checked"/> 
		            		<div class="app_txt_sent">&nbsp;</div> 
		            		<div class="clr"></div></li>
		            	</c:when>
		            	<c:otherwise>
		            		<li class="input_eight fl"> <span class="app_txt">Not Approved</span> </li>	
		            		<li class="input_nine fl">  
		            		<span class="common_custom_checkbox"></span>
		            		<input type="checkbox" name="clientApprovalChkbx_${actionPlan.fpAdviseRecommendId}" class="default_checkbox" value="95002"/> 
		            		<div class="app_txt_sent">&nbsp;</div> 
		            		<div class="clr"></div></li>
		            	</c:otherwise>
		            </c:choose>
		            <input type="hidden" name="apporvalFlag_${actionPlan.fpAdviseRecommendId}" value="${actionPlan.actionFlag}"/>
	          	</ul>
	          	 <c:set var="fpAdviseRecommendIds">${actionPlan.fpAdviseRecommendId},${fpAdviseRecommendIds}</c:set>
          	 </c:if>	
          	</c:forEach>          	
          </div>
        </div>            
        <div class="clr"></div>
        <input type="hidden" name="fpAdviseRecommendIds" value="${fpAdviseRecommendIds}"/>
		</form>
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list"><a href="#" class="anch save saveRiskCoverActionPlanLink" onclick="$('#riskCoverForm').submit();"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" onClick="cancelPage('${pageContext.request.contextPath}/partner/datacollection/risk-cover/${partyId}')" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents </span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/risk-cover-analysis/${partyId}?returnUrl=${returnUrl}" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/suggestion/risk-cover/${partyId}?returnUrl=${returnUrl}" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation inactiveLink"><span class="txt">Back</span></a> 
        <a href="#" class="next navgation inactiveLink"><span class="txt">Next</span></a></section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
<!-- Main ends-->

<script>
$(document).ready(function(){
  
    $("select").selectBoxIt();
	// Calls the selectBoxIt method on your HTML select box
 
  	$("body").on("click",".common_custom_checkbox",function(){
    	$(this).toggleClass("white_checkbox_checkbox_checked");	
	 	if ($(this).next( ".default_checkbox" ).is(":checked")) {		
       		$(this).next( ".default_checkbox" ).prop("checked", false);
    	} else {
       		$(this).next( ".default_checkbox" ).prop("checked", true);	
    	}	
  	});

  $('.risk_cover_action_plan_bx_in').slimScroll();
  
  var partnerSetupLinks = "${saveRiskActionLink}";
  var pieces = partnerSetupLinks.split(",");
  for(var i=0;i<pieces.length;i++){
   $("."+pieces[i]).attr("href","#");
   $("."+pieces[i]).removeAttr('onclick');
   $("."+pieces[i]).addClass("inactiveLink");
  }
  /* if( partnerSetupLinks != "" ){
  	$("#riskCoverForm").attr("action","#");
  } */
});

function cancelPage(url) {
	var returnUrl = '${returnUrl}';
	if(returnUrl != null && returnUrl!='') {
		window.location.href = returnUrl;
	} else {
		window.location.href = url;
	}
}
</script>