<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.emergency_readiness_action_plan_bx_ul li .app_txt02 {
	font-size: 12px;
}
.emergency_readiness_action_plan_bx_ul li .app_txt {
	color: #FF2F50;
	font-size: 12px;
}
.emergency_readiness_action_plan_bx_ul li.input_four {
	min-height: 136px;
}
.emergency_readiness_action_plan_bx_ul li.input_one .input_range_counter {
	font-size: 28px;
	padding-top: 4px;
}
</style>

<!-- Common_content Starts-->
    <section class="content common_content">
 		<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>  
		<div class="clr"></div>      
      <!-- Common_in_contnet starts--> 
      
      <!-- Common_content Starts-->
      <form name="actionPlanForm" id="actionPlanForm" action="${pageContext.request.contextPath}/actionplan/saveActionPlan" method="post">
      <input type="hidden" name="goalTypeId" value="${goalTypeId}"/>
      <input type="hidden" name="partyId" value="${partyId}"/>
      <input type="hidden" name="redirectURL" value="${redirectURL}"/>
      <input type="hidden" name="goalTypeName" value="${headerData.goalTypeName}"/>
      <input type="hidden" name="goalName" value="${headerData.goalName}"/>
      <section class="content common_content"> 
        <!-- Common_in_contnet starts-->
        <section class="in_content common_in_content action_plan_page clearfix">
        <div class="Asset_Allocation_bx">
	        <div class="Asset_Allocation_bx_left">
	          <div class="label">Goal Year:</div>
	          <div class="txt">${headerData.goalYear}
	          <input type="hidden" name="goalYear" id="goalYear" value="${headerData.goalYear}"/>
	          </div>
	        </div>
	        <div class="Asset_Allocation_bx_right">
	          <div class="label">Asset Allocation:</div>
	     		<ul>
	     			<li><div class="shares"></div><!--<img src="${pageContext.request.contextPath}/resources/images/asset_allocation_shares.png" width="41" height="40" alt="">--><span>Shares</span></li>
	          		<li><div class="property"></div><!--<img src="${pageContext.request.contextPath}/resources/images/asset_allocation_property.png" width="41" height="40" alt="">--><span>Property</span></li>
	          	</ul>
	        </div>
      	</div>
      
      <div class="Goal_Completion_bx">
        <div class="Goal_Completion_bx_left">
          <div class="label">Goal Completion: </div>
          <div class="txt">${headerData.goalCompletion} %</div>
        </div>
      </div>
          <div class="emergency_readiness_action_plan_bx">
         
           <ul class="reset clearfix emergency_readiness_action_plan_bx_ul">
              <li class="input_title_one fl"> Goal Target Amount </li>
              <li class="input_title_two fl">
                <div class="title_one">Allocation</div>
                <div class="title_two"> Recommended</div>
              </li>
              <li class="input_title_three fl">
                <div class="title_three">Actual</div>
              </li>
              <li class="input_title_four fl"> Recommended Product </li>
              <li class="input_title_five fl">Investment Amount</li>
              <li class="input_title_six fl">
                <div class="title_thr">Client Approval</div>
                <div class="title_two"> Status</div>
              </li>
              <li class="input_title_seven fl">
                <div class="title_three">Action</div>
              </li>
            </ul>
            
           	<c:set var="fpAdviseIds"></c:set>
           	<c:set var="assetClassIds"></c:set>
           	<c:set var="productTypeIds"></c:set>
           	<div class="emergency_readiness_action_plan_bx_in">
           		<c:forEach items="${actionPlanDataMap}" var="allocationData" varStatus="mapCounter"> 
           		<c:set var="fpAdviseIds"></c:set>
         			<%-- <c:choose>
       					<c:when test="${fn:toUpperCase(allocationData.key.name) eq fn:toUpperCase('DEBT')}"> --%>        	
				           <ul class="reset clearfix emergency_readiness_action_plan_bx_ul">
				              <c:choose>
				              	<c:when test="${mapCounter.count eq 1}">
				              		<li class="input_one fl">
						                <div class="input_counter_parent rupee">
						                  <input type="text" class="input_range_counter" id="targetAmount" name="targetAmount" value="${allocationData.key.targetAmount}" readonly="readonly"/>
						                  <input type="hidden" id="initialTargetAmount" value="${allocationData.key.targetAmount}"/>
						                  <span class="unit dynamic">lacs</span> </div>
						              </li>						              
						              <li class="input_two fl">
						                <div class="title_input_one"> ${allocationData.key.productTypeName} 
						                </div><div class="title_input_two_bx"><div class="title_input_two"> ${allocationData.key.recommendPercent}</div><span class="unit dynamic">%</span></div>
						              </li>
						              <li class="input_three fl"><div class="title_input_three_bx"><div class="title_input_three" id="allocationPercentDiv_${allocationData.key.productTypeId}"> ${allocationData.key.allocationPercent} 
						              <%-- <input type="hidden" name="allocationPercent_${allocationData.key.productTypeId}" id="allocationPercent_${allocationData.key.productTypeId}" value="${allocationData.key.allocationPercent}"/> --%>
				              		  </div><span class="unit dynamic">%</span></div></li>
				              	</c:when>
				              	<c:otherwise>
				              		<li class="input_one fl"></li>
				              		<li class="input_two fl">
						                <div class="title_input_one"> ${allocationData.key.productTypeName} 
						                </div><div class="title_input_two_bx"><div class="title_input_two"> ${allocationData.key.recommendPercent}</div><span class="unit dynamic">%</span></div>
						              </li>
						              <li class="input_three fl"><div class="title_input_three_bx"><div class="title_input_three" id="allocationPercentDiv_${allocationData.key.productTypeId}"> ${allocationData.key.allocationPercent} 						              						             
				              		  </div><span class="unit dynamic">%</span></div></li>
				              	</c:otherwise>
				              </c:choose>				              
				              <input type="hidden" name="allocationPercent_${allocationData.key.productTypeId}" id="allocationPercent_${allocationData.key.productTypeId}" value="${allocationData.key.allocationPercent}"/>
				              <li class="input_four fl">
				              	<ul>
				              	<c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
<%-- 				              		<c:choose>
				              			<c:when test="${counter.count eq 1}"> --%>
				              				<li><div class="mandatory"> </div> ${productData.productName}
				              				<input type="hidden" name="productId_${productData.fpAdviseId}" id="productId_${productData.fpAdviseId}" value="${productData.productId}"/>
				              				<input type="hidden" name="productName_${productData.fpAdviseId}" id="productName_${productData.fpAdviseId}" value="${productData.productName}"/>
				              				<input type="hidden" name="apporvalFlag_${productData.fpAdviseId}" id="apporvalFlag_${productData.fpAdviseId}" value="${productData.apporvalFlag}"/>
				              				<input type="hidden" name="categoryId_${productData.fpAdviseId}" id="categoryId_${productData.fpAdviseId}" value="${productData.categoryId}"/>
				              				</li>	
<%-- 				              			</c:when>
				              			<c:otherwise>
				              				<li><div class="no_mandatory"> </div> ${productData.productName}</li>	
				              			</c:otherwise>
				              		</c:choose> --%>
				              	</c:forEach>				              		
					                <li> <!-- <div class="add">+</div> <div class="clr"></div> --></li>
				                </ul>
				              </li>
				              <li class="input_five fl">
				                <ul>
				                <c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
				              		<li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
				                    <input name="investAmount_${productData.fpAdviseId}" 
				                    id="investAmount_${allocationData.key.productTypeId}_${productData.fpAdviseId}" type="text" 
				                    class="input" placeholder="0" 
				                    value="${productData.productAmount}" onchange="calculatePercentagePerProductType('${allocationData.key.productTypeId}','investAmount_${allocationData.key.productTypeId}_${productData.fpAdviseId}');">
				                  </li>
				                  <c:set var="fpAdviseIds">${productData.fpAdviseId},${fpAdviseIds}</c:set>
				              	</c:forEach>				              		
				                </ul>
				              </li>
				              <li class="input_six fl">
				                <ul>
				                <c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
				                	<c:choose>
				                		<c:when test="${productData.clientApproval eq '95002'}">
				                			<li> <span class="app_txt02" id="msgSpan_${allocationData.key.productTypeId}_${productData.fpAdviseId}"> Sent for Approval</span></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li> <span class="app_txt" id="msgSpan_${allocationData.key.productTypeId}_${productData.fpAdviseId}"> Not Approved</span></li>	
				                		</c:otherwise>
				                	</c:choose>				                	
				                </c:forEach>
				                </ul>
				              </li>
				              <li class="input_seven fl">
				                <ul>
   				                <c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
				                  	<c:choose>				                  					                  	
					                  	<c:when test="${productData.clientApproval eq '95002'}">
       					                  <li> <span class="common_custom_checkbox white_checkbox_checkbox_checked not_clickable" id="clientApprovalSpan_${allocationData.key.productTypeId}_${productData.fpAdviseId}"></span>
						                  <input type="checkbox" id="clientApprovalChkbx_${allocationData.key.productTypeId}_${productData.fpAdviseId}"
						                  name="clientApprovalChkbx_${productData.fpAdviseId}" class="default_checkbox not_clickable" value="${productData.clientApproval}" checked="checked"/></li>
					                  	</c:when>
					                  	<c:otherwise>
					                  		<li> <span class="common_custom_checkbox" id="clientApprovalSpan_${allocationData.key.productTypeId}_${productData.fpAdviseId}"></span>
						                  <input type="checkbox" id="clientApprovalChkbx_${allocationData.key.productTypeId}_${productData.fpAdviseId}"
						                  name="clientApprovalChkbx_${productData.fpAdviseId}" class="default_checkbox" value="95002"/></li>
					                  	</c:otherwise>		
				                  	</c:choose>		                  
				                </c:forEach>
				                </ul>
				                <div class="clr"></div>
				              </li>
				            </ul>           
	           			<%-- </c:when>
        			<c:otherwise></c:otherwise>
        		</c:choose>			          --%>
        		<c:set var="assetClassIds">${allocationData.key.assetClassId},${assetClassIds}</c:set>
        		<c:set var="productTypeIds">${allocationData.key.productTypeId},${productTypeIds}</c:set>
        		<input type="hidden" name="fpAdviseIds_${allocationData.key.productTypeId}" id="fpAdviseIds_${allocationData.key.productTypeId}" value="${fpAdviseIds}"/>
          	</c:forEach>
          	<input type="hidden" name="productTypeIds" id="productTypeIds" value="${productTypeIds}"/>
          	 <input type="hidden" name="assetClassIds" value="${assetClassIds}"/>
          	
          </div>		
		</div>
        <div class="clr"></div>
        </section>
        <!-- Common_in_contnet ends --> 
        <!-- Common footer starts -->
        <section class="common_footer_actions">
          <div id="main_actions" class="clearfix">
            <ul class="reset clearfix fr btn_grup3">
              <li class="fl list"><a href="#" class="anch save saveEmergencyReadinessActionPlanLink" onclick="submitData();"><span class="txt">Save</span></a></li>
              <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness/${partyId}" class="anch cancel"><span class="txt">Cancel</span></a></li>
              <li class="fl list inactiveLink"><a href="financial-readiness.html" class="anch skip"><span class="txt">Skip</span></a></li>
            </ul>
            <ul class="reset clearfix fr btn_grup2">
              <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
      <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
            </ul>
            <ul class="reset clearfix fl btn_grup1">
              <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness-analysis/${partyId}" class="anch analysis"><span class="txt">Analysis</span></a></li>
              <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/suggestion/emergency-readiness/${partyId}" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
              <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
            </ul>
          </div>
          <a href="#" class="back navgation inactiveLink"><span class="txt">Back</span></a> 
          <a href="#" class="next navgation inactiveLink"><span class="txt">Next</span></a></section>
        
        <!-- Common footer ends -->
        <div class="overlay"></div>
      </section>
      </form>
      <!-- Common_content Ends--> 
    </section>
    <!-- Common_content Ends--> 
  
<!-- Wrapper ends--> 

<script type="text/javascript">	
$(document).ready(function(){
	equalHeightSevenCol($('.input_one'), $('.input_two'), $('.input_three'), $('.input_four'), $('.input_five'), $('.input_six'), $('.input_seven'));
});
</script>
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

	$('.emergency_readiness_action_plan_bx_in').slimScroll();
	
	var partnerSetupLinks = "${saveEmergencyPlan}";
	var pieces = partnerSetupLinks.split(",");
	for(var i=0;i<pieces.length;i++){
	 $("."+pieces[i]).attr("href","#");
	 $("."+pieces[i]).removeAttr('onclick');
	 $("."+pieces[i]).addClass("inactiveLink");
	}
	/* if( partnerSetupLinks != "" ){
		$("#actionPlanForm").attr("action","#");
	} */
  });
  
function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

function submitData(){
	/* var productTypeIds=$("#productTypeIds").val();
	var productTypeIdArray=productTypeIds.split(",");
	var fpAdviseIds="";
	var fpAdviseIdsArray=[];*/
	/* var targetAmount=parseFloat($("#targetAmount").val());
	targetAmount=targetAmount*100000;
	var initialtargetAmount=$("#initialTargetAmount").val();
	initialtargetAmount = initialtargetAmount * 100000;
	if(targetAmount < initialtargetAmount){
		displayMsg("Total investment amount cannot be less than "+initialtargetAmount+".");
		return false;
	}else{
		$('#actionPlanForm').submit();
	} */
	var productTypeIds=$("#productTypeIds").val();
	var productTypeIdArray=productTypeIds.split(",");
	var totalPercent=0;
	for(var i=0;i<productTypeIdArray.length;i++){
		if($("#allocationPercent_"+productTypeIdArray[i]).val()){
			totalPercent=totalPercent + parseFloat($("#allocationPercent_"+productTypeIdArray[i]).val());
		}
		
	}
	totalPercent = totalPercent.toFixed(2);
	if((totalPercent>="100.00") && (totalPercent<="101.00")){
		$('#actionPlanForm').submit();
	}else{
		displayMsg("Total investment amount must match target amount.");		
	}
	/* var amount=0;
	for(var i=0;i<productTypeIdArray.length;i++){
		if($("#fpAdviseIds_"+productTypeIdArray[i]).val()){
			fpAdviseIds=$("#fpAdviseIds_"+productTypeIdArray[i]).val();			
			fpAdviseIdsArray=fpAdviseIds.split(",");	
			for(var j=0;j<fpAdviseIdsArray.length;j++){
				if($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val()){
					amount=amount + parseFloat($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val());	
				}
			}
		}
		
	} 
	if(amount>=targetAmount){
		$('#actionPlanForm').submit();
	}else{
		displayMsg("Total investment amount must match target amount.");
	}*/
}

function calculatePercentagePerProductType(productTypeId,txtBxId){
	var productTypeIds=$("#productTypeIds").val();
	var productTypeIdArray=productTypeIds.split(",");
	var fpAdviseIds="";
	var fpAdviseIdsArray=[];	
	var amount=0.0;
	//var roundAmount = 0;
	var netPercentage=0.0;
	var tempAmount = 0.0;
	var tempProductTypeId=0;
	/* var productTypeWiseTotal = [];
	var minSipAmount=500.00;		
	
	for(var i=0;i<productTypeIdArray.length;i++){
		if($("#fpAdviseIds_"+productTypeIdArray[i]).val()){
			if(productTypeIdArray[i] != tempProductTypeId){
				if(i != 0){
					productTypeWiseTotal[tempProductTypeId] = tempAmount;	
					tempAmount = 0.0;
				}
				tempProductTypeId = productTypeIdArray[i];			
			}
			fpAdviseIds=$("#fpAdviseIds_"+productTypeIdArray[i]).val();			
			fpAdviseIdsArray=fpAdviseIds.split(",");	
			for(var j=0;j<fpAdviseIdsArray.length;j++){
				if($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val()){
					roundAmount = parseFloat($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val()) % parseFloat(minSipAmount);
					if(roundAmount == 0){
						amount=parseFloat(amount) + parseFloat($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val());
						tempAmount = parseFloat(tempAmount) + parseFloat($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val());;	
					}else{
						$("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val("0");
						displayMsg("Investment amount should be multiple of "+minSipAmount+".");
						return false;	
					}					
				}
			}
		}
	}
	
	productTypeWiseTotal[tempProductTypeId] = tempAmount;
	
	//if(amount >= initialtargetAmount){
	amount = parseFloat(amount) / 100000.00;
	$("#targetAmount").val(amount.toFixed(2));
	/*}else{
		initialtargetAmount = initialtargetAmount / 100000;
		displayMsg("Goal Target amount cannot be less than "+initialtargetAmount);
		$("#targetAmount").val(initialtargetAmount);
		$("#"+txtBxId).val("0.00");
		return false;
	} */
	
	/*var targetAmount=parseFloat($("#targetAmount").val());
	targetAmount=targetAmount * 100000;
	
	for(var i=0;i<productTypeIdArray.length;i++){
		if(productTypeIdArray[i]){
			amount=productTypeWiseTotal[productTypeIdArray[i]];
			amount = amount.toFixed(2); 
			netPercentage=(amount/targetAmount)*100;
			netPercentage=netPercentage.toFixed(2);
			$("#allocationPercent_"+productTypeIdArray[i]).val(netPercentage);
			$("#allocationPercentDiv_"+productTypeIdArray[i]).html(netPercentage);	
		}
		
	} */
	
	
	/* var assetWiseTotal = []; */
	
	var targetAmount=(parseFloat($("#targetAmount").val()) * 100000).toFixed(2);
	
	for(var i=0;i<productTypeIdArray.length;i++){
		if($("#fpAdviseIds_"+productTypeIdArray[i]).val()){
			if(productTypeIdArray[i] != tempProductTypeId){
				if(i != 0){
					tempAmount = tempAmount.toFixed(2); 
					netPercentage=(tempAmount/targetAmount)*100;
					netPercentage=netPercentage.toFixed(2);
					$("#allocationPercent_"+tempProductTypeId).val(netPercentage);
					$("#allocationPercentDiv_"+tempProductTypeId).html(netPercentage);	
					tempAmount = 0.0;
				}
				tempProductTypeId = productTypeIdArray[i];			
			}
			fpAdviseIds=$("#fpAdviseIds_"+productTypeIdArray[i]).val();			
			fpAdviseIdsArray=fpAdviseIds.split(",");	
			for(var j=0;j<fpAdviseIdsArray.length;j++){
				if($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val()){
					roundAmount = ($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val()) % 100;
					if(roundAmount == 0){ 
						amount=parseFloat(amount) + parseFloat($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val());
						tempAmount = parseFloat(tempAmount) + parseFloat($("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val());	
					}else{
						$("#investAmount_"+ productTypeIdArray[i] +"_"+fpAdviseIdsArray[j]).val("0");
						displayMsg("Investment amount should be multiple of 100.");
						calculatePercentagePerProductType(productTypeId,txtBxId);
						return false;	
					} 					
				}
			}
		}
	}
	
	tempAmount = tempAmount.toFixed(2); 
	netPercentage=(tempAmount/targetAmount)*100;
	netPercentage=netPercentage.toFixed(2);
	$("#allocationPercent_"+tempProductTypeId).val(netPercentage);
	$("#allocationPercentDiv_"+tempProductTypeId).html(netPercentage);
	
	//change approval Status
	var pieces=txtBxId.split("_");
	$("#msgSpan_"+pieces[1]+"_"+pieces[2]).html("Not Approved");
	$("#msgSpan_"+pieces[1]+"_"+pieces[2]).removeClass("app_txt02");
	$("#msgSpan_"+pieces[1]+"_"+pieces[2]).addClass("app_txt");
	$("#clientApprovalSpan_"+pieces[1]+"_"+pieces[2]).removeClass("white_checkbox_checkbox_checked");
	$("#clientApprovalSpan_"+pieces[1]+"_"+pieces[2]).removeClass("not_clickable");
	$("#clientApprovalChkbx_"+pieces[1]+"_"+pieces[2]).prop("checked", false);
}
</script>