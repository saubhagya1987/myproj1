<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>My Goals</title>

</head>

<body><div class="my_goals_back_btn_bx"><a class="my_goals_back_btn" href="${pageContext.request.contextPath}/partner/datacollection">Back</a></div>
<div class="wrapper fl" id="my_goals_parent">
  <section class="content common_content">
 
 
     <section class="dc_in_content clearfix" id="my_goals">
      	
     <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
     <core:forEach items="${goalList}" varStatus="counter" var="goal">
     <!-- for education -->
     <core:set var="goalClass" value="${goal.key}"/>
     	<core:if test="${fn:containsIgnoreCase(goalClass, 'education')}">
     
 
 	<div id="education">
      		<div class="header_strip">${goal.key}</div>
      		
      		
      		
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	  		<core:set var="goalId" value="${goalData.id}"/>
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-educational-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      		<li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
      <!-- for traval_vacations -->
      <core:if test="${fn:containsIgnoreCase(goalClass, 'travel')}">
     	<div id="traval_vacations">
      		<div class="header_strip">${goal.key}</div>
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	  		<core:set var="goalId" value="${goalData.id}"/>
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-travel-vacation-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      		<li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
      <!-- for car goal -->
       <core:if test="${fn:containsIgnoreCase(goalClass, 'car')}">
     	<div id="car">
      		<div class="header_strip">${goal.key}</div>
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	  		<core:set var="goalId" value="${goalData.id}"/>
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-car-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      		<li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
      <!-- for property goal -->
       <core:if test="${fn:containsIgnoreCase(goalClass, 'property')}">
     	<div id="property">
      		<div class="header_strip">${goal.key}</div>
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	  		<core:set var="goalId" value="${goalData.id}"/>
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-property-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      		<li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
      <!-- for special goal -->
       <core:if test="${fn:containsIgnoreCase(goalClass, 'special')}">
     	<div id="special">
      		<div class="header_strip">Parental Goal</div>
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-special-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      	 	<li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
      <!-- for other goal -->
       <core:if test="${fn:containsIgnoreCase(goalClass, 'other')}">
     	<div id="other_goal">
      		<div class="header_strip">${goal.key}</div>
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	  		<core:set var="goalId" value="${goalData.id}"/>
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-other-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      	   <li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
      
      <!-- for business goal -->
       <core:if test="${fn:containsIgnoreCase(goalClass, 'Buisness')}">
     	<div id="business">
      		<div class="header_strip">${goal.key}</div>
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	  		<core:set var="goalId" value="${goalData.id}"/>
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-business-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      		<li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
      
      <!-- for wedding goal -->
       <core:if test="${fn:containsIgnoreCase(goalClass, 'Marriage')}">
     	<div id="wedding">
      		<div class="header_strip">${goal.key}</div>
      		<div class="container">
      		<ul class="reset clearfix heading">
	      		<li class="first">Goal Title</li>
	      		<li class="second">Created Date</li>
	      		<li class="third">Goal Year</li>
	      		<li class="fourth">Goal Cost</li>
	  		</ul>
	  		<core:forEach items="${goal.value}" varStatus="index" var="goalData">
	  		<core:set var="goalId" value="${goalData.id}"/>
	   		<ul class="reset clearfix record">
	      		<li class="first"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-wedding-goal/${goalData.id}">${goalData.goalName}</a></li>
	      		<li class="second"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></li>
	      		<li class="third">${goalData.goalStartYear}</li>
	      		<li class="fourth"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></li>
	      		<li class="fifth"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}')"><div class="delete"></div></a></li>
	   		</ul>
     		</core:forEach>
      </div>
      </div>
      </core:if>
    </core:forEach>
        <!-- DC submenu Ends-->
         
        <script>
	$(document).ready(function(){
    $('#my_goals').slimScroll();
  	});
	
	function doConfirm(url){
		$(".overlay").fadeIn("slow");
		$("#confirmDialog").fadeIn("slow");	
		$("#urlLink").val(url);
	}	
	function deleteContact(){
		var url = $("#urlLink").val();
		window.location.href = url;
		$("#confirmDialog").fadeOut("slow");
		$(".overlay").fadeOut("slow");
		
	}
	function closeDialog(){
		$("#urlLink").val("");
		$("#confirmDialog").fadeOut("slow");
		$(".overlay").fadeOut("slow");
	}
</script>		 
      </section>
      
    </section>
    <div class="clr"></div>
     
          
  <div class="overlay"></div>
</div>
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close" onclick="closeDialog();">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
    <input type="hidden" id="urlLink" name="urlLink" value=""/>
        Do you really want to delete this data?</div>
     
         <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="deleteContact();" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
</body>
</html>