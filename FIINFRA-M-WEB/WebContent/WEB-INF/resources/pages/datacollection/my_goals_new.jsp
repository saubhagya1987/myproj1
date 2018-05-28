<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>My Goals</title>

<script>
var flag=false;
var goalCount = ${goalListNew.size()};
$(document).ready(function(){

	$("#sortable").sortable({
		stop: function( event, ui ) {
			$('#sortable li.ui-state-default').each(function(k, v) {
				$(this).find('input[name="goalPriority_srtidx"]').val($(this).index())
			});
			
			flag = true;
		}
	});
	
});

function doSave()
{
	
	if(flag==true)
	{
		var inputDataString = "";
		for(var i=1;i<=goalCount;i++)
		{
			inputDataString = inputDataString + $("#goalId_"+i).val()+":"+$("#goalPriority_"+i).val()+",";
		}
		
		$("#inputDataString").val(inputDataString);
		$("#priorityFrm").submit();
		
	}else{
		
		invalidActionMessage("You haven't changed priority");
		
	}	
 }
function doCancel()
{
	var url = "${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2";
	if(flag==true)
	{
		$(".aa_up").html("Priority has changed, are you sure you want to exit?");
		doConfirm(url);
	}else
	{
		window.location.href = url;
	}
}

function doDelete1(url)
{
	if(flag==true)
	{
		$(".aa_up").html("Priority has changed, are you sure you want to delete goal?");
		doConfirm(url);
	}
	else
	{	
		doConfirm(url);
	}
}

</script>
</head>

<body>
<div  id="my_goals_parent">
   <section class="main"> 
     <section class="content common_content">
        <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>     
       <section class="in_content clearfix" id="my_goals">
        <form action="${pageContext.request.contextPath}/futureFinancialDc/saveGoalsPriority/${partyId}" method="POST" id="priorityFrm" name="priorityFrm">
        <div class="container">
            <ul class="reset clearfix heading">
                      <li class="title_one fl">Priority</li>
                      <li class="title_two fl">Goal Category</li>
                      <li class="title_three fl">Goal Title</li>
                      <li class="title_three fl">Down Payment</li>
                      <li class="title_four fl">Created Date</li>
                      <li class="title_five fl">Goal Year</li>
                      <li class="title_six fl">Goal Cost</li>
                    </ul>
            <ul id="sortable" class="ui-sortable">
            
              <input type="hidden" name="inputDataString" id="inputDataString" value="" />
              
              <c:set var="cnt" value="1"/>
     		  <c:forEach items="${goalListNew}" varStatus="counter" var="goalData">
     		  
     		  <li class="ui-state-default">
                <input type="text" name="goalPriority_srtidx" id="goalPriority_${cnt}" class="one fl" value="${cnt}" readonly="readonly"/>
                <input type="hidden" name="goalId_${cnt}" id="goalId_${cnt}" value="${goalData.id}" />
                <c:choose>
                	<c:when test="${goalData.goalTypeId eq 35001}">
	       			<div class="two fl">Educational</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-educational-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	             	<c:when test="${goalData.goalTypeId eq 35003}">
	       			<div class="two fl">Property</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-property-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	    			<c:when test="${goalData.goalTypeId eq 35004}">
	       			<div class="two fl">Wedding</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-wedding-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	    			<c:when test="${goalData.goalTypeId eq 35005}">
	       			<div class="two fl">Travel-Vacation</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-travel-vacation-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	    			
	    			<c:when test="${goalData.goalTypeId eq 35006}">
	       			<div class="two fl">Car</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-car-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	    			<c:when test="${goalData.goalTypeId eq 35008}">
	       			<div class="two fl">Parental</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-special-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	    			<c:when test="${goalData.goalTypeId eq 35012}">
	       			<div class="two fl">Business</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-business-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	    			<c:when test="${goalData.goalTypeId eq 35013}">
	       			<div class="two fl">Other</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-other-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
	    			<c:when test="${goalData.goalTypeId eq 35016}">
	       			<div class="two fl">Target Corpus</div>
	       			<div class="first fl"><a href="${pageContext.request.contextPath}/futureFinancialDc/edit-target-corpus-goal/${goalData.id}/${partyId}">${goalData.goalName}</a></div>	
	    			</c:when>
    			</c:choose> 
    			 <div class="fourth fl"><span class="cost">${goalData.loanDownPayment}</span><span class="unit"> lacs</span></div> 
                 <div class="second fl"><fmt:formatDate value="${goalData.createdDate}" pattern="dd-MMM-yyyy"/></div> 
                <div class="third fl">${goalData.goalStartYear}</div>
                <div class="fourth fl"><span class="cost">${goalData.goalAmountPv}</span><span class="unit"> lacs</span></div>
                <div class="fifth fl"><a href="javascript:void(0)" onclick="javascript:doDelete1('${pageContext.request.contextPath}/futureFinancialDc/deleteGoal/${goalData.id}/${partyId}')"><div class="delete"></div></a></div>
              </li>
              
              <c:set var="cnt" value="${cnt+1}"/>
     		  </c:forEach>
     		  
             </ul>
          </div>
        
        <!-- DC submenu Ends--> 
        </form>
      </section>
      
            <!-- Common footer starts -->
    <section id="Footer_Type_Two" class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup">
            </li>
            <li class="fl list"><a href="#" onclick="doSave()" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" onclick="doCancel()" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
      </section>
      
      <!-- Common footer ends -->
      
              <div class="overlay"></div>
            </section>
    <div class="clr"></div>
  </section>
 </div>
</body>
</html>