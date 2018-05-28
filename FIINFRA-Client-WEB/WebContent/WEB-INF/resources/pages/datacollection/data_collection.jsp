
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="pieces" value="${fn:split(numberOfGoals, '_')}"/> 



<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>

<style>
#data_collection .column_left .first_col {
background: url(images/dc_horizontal_seprator.png) no-repeat bottom center;
position: relative;
height: 50%;
}
</style>
  
  <!-- end of "inner-shadow-strip" id -->
  <div class="clearfix"></div>
  <div id="contents" class="clearfix">
  
    <section class="dc_in_content_new clearfix" id="data_collection">
    	<input type="hidden" name="partyId" id="partyId" value="${partyId}" />
    	<c:set var="link" value="#"/>
    	<c:set var="link" value="#"/>
    	<c:if test="${pieces[0] > 0 }">
    	<c:set var="link" value="${pageContext.request.contextPath}/futureFinancialDc/getMyGoals"/>
    	</c:if>
		
      <section class="dc_in_content_new clearfix" id="data_collection">
        
        <!-- DC submenu Ends-->
        <%-- <div class="column_left">
          <div class="first_col">
            <div id="personal_info" class="circular_bg"><a class="hit_area" href="${pageContext.request.contextPath}/partner/profile/${partyId}/${headerName}"><span>Personal Information</span></a></div>
          </div>
          <div class="sec_col">
            <div id="risk_profile" class="circular_bg"><a class="hit_area" href="${pageContext.request.contextPath}/riskProfile/datacollection/risk-profile/${partyId}"><span>Risk Profile</span></a></div>
          </div>
        </div> --%>
        <div class="column_left">
          <div class="first_col">
            <div id="risk_profile" class="circular_bg"><c:if test='${risk == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area dcRiskProfileLink" href="${pageContext.request.contextPath}/riskProfile/dc/risk-profile/?dc=1"><span>Risk Profile</span>
	          <span style="width: 133%;height: 1px;">
	          <c:choose>
          		<c:when test="${pieces[8] eq 40001}">
          			(Conservative)
          		</c:when>
          		<c:when test="${pieces[8] eq 40002}">
          			(Balanced)
          		</c:when>
          		<c:when test="${pieces[8] eq 40003}">
          			(Aggressive)
          		</c:when>
          		<c:when test="${pieces[8] eq 0}">
          			(To Be Determined)
          		</c:when>
          	</c:choose></span></a></div>      </div>
          
        </div>
        <div class="column_right clearfix">
         <a href="${link}" class="my_goal_redirect" onclick="<c:if test="${pieces[0] <= 0 }">javascript:alertMessage()</c:if>">
      		<h4 class="head">My Goals</h4><span class="count">${pieces[0]}</span>
      	</a> 
      	
          <div class="current_finacial">
            <div class="heading fr clearfix">
              <div class="head_thumb fr"><span></span></div>
              <p class="fr">Current Financial Status</p>
            </div>
            <div class="clr"></div>
            <div class="category" id="cash_flow"><c:if test='${cashflow == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area" href="${pageContext.request.contextPath}/partner/datacollection/cash-flow"><span>Cash Flow</span></a></div>
            <div class="category inactiveLink" id="risk_cover"><a class="hit_area" href="${pageContext.request.contextPath}/partner/datacollection/risk-cover"><span>Risk Cover</span></a></div>
            <div class="category" id="goal_readiness"><a class="hit_area" href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness"><span>Goal Readiness</span></a></div>
            <div class="category" id="retirement_readiness"><c:if test='${retirement == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area" href="${pageContext.request.contextPath}/partner/datacollection/retirement-planning"><span>Retirement Readiness</span></a></div>
            <div class="category inactiveLink" id="emergency"><c:if test='${emergency == 1 }'><div class="dc_status_comp"></div></c:if><a class="hit_area" href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness"><span>Emergency</span></a></div>            
            <div class="category inactiveLink" id="loan_status"><a class="hit_area" href="${pageContext.request.contextPath}/partner/datacollection/loan-status"><span>Loan Status</span></a></div>
            <div class="category inactiveLink" id="succession_readiness"><a class="hit_area" href="${pageContext.request.contextPath}/partner/datacollection/succession-readiness"><span>Succession Readiness</span></a></div>
          </div>
          <div class="future_finacial">
            <div class="heading fl clearfix">
              <div class="head_thumb fl"><span></span></div>
              <p class="fr">Future Financial Expectations</p>
            </div>
            <div class="clr"></div>
            <div class="category" id="wedding"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/wedding-goal"><span>Wedding</span></a></div>
            <div class="category" id="education"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/educational-goal"><span>Education</span></a></div>
            <div class="category" id="buisness"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/business-goal"><span>Business</span></a></div>
            <div class="category" id="car"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/car-goal"><span>Car</span></a></div>
            <div class="category" id="travel"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/travel-vacation-goal"><span>Travel</span></a></div>
            <div class="category" id="others"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/other-goal"><span>Others</span></a></div>
            <div class="category" id="corpus"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/target-corpus-goal"><span>Target Corpus</span></a></div>
            <div class="category" id="spcial_goal"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/special-goal"><span>Parental</span></a></div>
            <div class="category" id="property"><a class="hit_area" href="${pageContext.request.contextPath}/futureFinancialDc/property-goal"><span>Property</span></a></div>
          </div>
          <div class="clr"></div>
                     
          <div class="actions">
            <div class="action_parent">
              <ul>
                <li><a id="submitPlanning" href="#" class="what_if foot_links"><span class="txt">Submit for<br/>Financial Advice</span></a></li>
              </ul>
            </div>
          </div>
          
          
        </div>
      </section>
      <div class="overlay"></div>
  </section>
    </div>
    <div class="clr"></div>
    <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
   
<script>
$(document).ready(function(){
    $('.wrapper').attr('id', 'data_collection_parent');
    var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});
	
	$("body").on("click", "#submitPlanning", function() {
		window.location = '${pageContext.request.contextPath}/partner/submit';	
	});
	
	
	var attrValue = '${fpSection}';
	var result = attrValue.split(",");
	for(var i=0; i<result.length;++i)
	{
		var value = result[i];
		if(value == 39001){
			$("#emergency").removeClass('inactiveLink');
		}
		else if(value == 39003){
			$("#risk_cover").removeClass('inactiveLink');
		}
		else if(value == 39007){
			$("#succession_readiness").removeClass('inactiveLink');
		}
		else if(value == 39008){
			$("#loan_status").removeClass('inactiveLink');
		}
	}

    
	});
	
function alertMessage()
{
	$("#dialog1").html("No goals found");
	$( "#dialog1").dialog( "open" );
}
</script>
