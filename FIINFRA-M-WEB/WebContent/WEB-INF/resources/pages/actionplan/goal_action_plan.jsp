<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.purchase_car_action_plan_bx_ul li.input_title_one_of_one {
font-size: 13px !important;
}
.purchase_car_action_plan_bx_ul li .title_thr {
font-size: 13px;
}
.purchase_car_action_plan_bx_ul li.input_title_five {
font-size: 13px;
}
.purchase_car_action_plan_bx_ul li.input_title_four{
font-size: 13px;
}
.purchase_car_action_plan_bx_ul li .title_one{
font-size: 13px;
}
.purchase_car_action_plan_bx_ul li .title_two{
font-size: 13px;
}
.purchase_car_action_plan_bx_ul li .title_three{
font-size: 13px;
}
.purchase_car_action_plan_bx_ul li.input_title_one{
font-size: 13px !important;
}
.Goal_Completion_bx .Goal_Completion_bx_left .label {
left: -3px;
}
.purchase_car_action_plan_bx_ul li.input_four {
min-height: 140px;
}
.Goal_Completion_bx .Goal_Completion_bx_left .txt {
width: 70px;
left: 109px;
}
</style>

<!-- Common_content Starts-->
<section class="content common_content">
	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>  
	<div class="clr"></div>        
  <!-- Common_in_contnet starts--> 
<%--   <c:out value="${actionPlanData}"></c:out> --%>
  
  <!-- Common_content Starts-->
  <form name="actionPlanForm" id="actionPlanForm" action="${pageContext.request.contextPath}/actionplan/saveActionPlan" method="post">
      <input type="hidden" name="goalId" value="${goalId}"/>
      <input type="hidden" name="goalTypeId" value="${goalTypeId}"/>
      <input type="hidden" name="partyId" value="${partyId}"/>
      <input type="hidden" name="redirectURL" value="${redirectURL}"/>
      <input type="hidden" name="goalTypeName" value="${headerData.goalTypeName}"/>
      <input type="hidden" name="goalName" value="${headerData.goalName}"/>
      <input type="hidden" name="goalFrequencyName" value="${headerData.goalFrequencyName}"/>
      <input type="hidden" name="investmentType" value="${investmentType}"/>
      
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
  
      <div class="purchase_car_action_plan_bx">
		<ul class="reset clearfix purchase_car_action_plan_bx_ul">
			<li class="input_title_one fl"> Goal Target Amount </li>
          	<li class="input_title_one_of_one fl">Recommended Investment </li>
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
        <div class="purchase_car_action_plan_bx_in">       
        <c:forEach items="${actionPlanDataMap}" var="allocationData" varStatus="counterMain">    
        <c:set var="fpAdviseIds"></c:set>    	
        	<%-- <c:choose> --%>
        		<%-- <c:when test="${fn:toUpperCase(allocationData.key.name) eq fn:toUpperCase('EQUITY')}"> --%>
        			<ul class="reset clearfix purchase_car_action_plan_bx_ul">
		          		<li class="input_one fl">
		            		<c:if test="${counterMain.count eq 1}">
			            		<div class="input_counter_parent rupee">
			              		<input type="text" class="input_range_counter" id="targetAmount" name="targetAmount" value="${allocationData.key.targetAmount}" readonly="readonly"><!-- <fmt:formatNumber type="number" maxFractionDigits="2" value=" -->
			              		<span class="unit dynamic">lacs</span> </div>		            		
		            		</c:if>
		          		</li>
		          		<li class="input_one_of_one fl">
				            <ul>
				            	<li>
				            	<c:if test="${counterMain.count eq 1}">
				                	<div>
				                		<c:choose>
				                			<c:when test="${allocationData.key.investmentType eq '96002'}">
				                				<input name="investmentType" id="lumpSumRadio" class="investmentType" type="radio" value="96002" style="float:left;" checked="checked">
				                			</c:when>
				                			<c:otherwise>
				                				<input name="investmentType" id="lumpSumRadio" class="investmentType" type="radio" value="96002" style="float:left;">
				                			</c:otherwise>
				                		</c:choose>				                  		
				                  		<label>Lumpsum</label>
				                	</div>
				                	<div>
				                		<img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
				                  		<input name="lumpSum" id="lumpSum" type="text" class="input" value="${allocationData.key.lumpSum}" readonly="readonly">
				                  		<%-- <input id="initiallumpSumAmount" type="hidden" value="${allocationData.key.lumpSum}"> --%>
				                	</div>
				                </c:if>
				              	</li>
				              	<li>
				              	<c:if test="${counterMain.count eq 1}">
				                	<div>
				                		<c:choose>
				                			<c:when test="${allocationData.key.investmentType eq '96001'}">
				                				<input name="investmentType" id="sipRadio" class="investmentType" type="radio" value="96001" style="float:left;" checked="checked">
				                			</c:when>
				                			<c:otherwise>
				                				<input name="investmentType" id="sipRadio" class="investmentType" type="radio" value="96001" style="float:left;">
				                			</c:otherwise>
				                		</c:choose>				                  		
				                  		<label>SIP</label>
				                	</div>
				                	<div>
				                		<img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
				                  		<input name="sip" id="sip" type="text" class="input" value="${allocationData.key.sip}" readonly="readonly">
				                  		<%-- <input id="initialSipAmount" type="hidden" value="${allocationData.key.sip}"> --%>
				                	</div>
				                </c:if>
				              	</li>
				            </ul>
		          		</li>		          	
			          	<li class="input_two fl">
			            	<div class="title_input_one"> ${allocationData.key.name} </div>
			            	<div class="title_input_two_bx">
			              	<div class="title_input_two"> ${allocationData.key.recommendPercent} </div>
			              	<span class="unit dynamic">%</span></div>
			          	</li>
			          	<li class="input_three fl">
			            	<div class="title_input_three_bx">
			              	<div class="title_input_three" id="allocationPercentDiv_${allocationData.key.assetClassId}"> ${allocationData.key.allocationPercent} 			              	
			              	</div>
			              	<span class="unit dynamic">%</span></div>
			          	</li>
			          	<input type="hidden" name="allocationPercent_${allocationData.key.productTypeId}" id="allocationPercent_${allocationData.key.assetClassId}" 
			              	value="${allocationData.key.allocationPercent}"/>
			          	<li class="input_four fl">
			            	<ul>
			              	<c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
<%-- 				              	<c:choose>
				              		<c:when test="${counter.count eq 1}">
				              		
				              		</c:when>
				              		<c:otherwise> --%>
				              			<li><div class="mandatory"></div> ${productData.productName}
				              			<input type="hidden" name="productId_${productData.fpAdviseId}" id="productId_${productData.fpAdviseId}" value="${productData.productId}"/>
				              			<input type="hidden" name="productName_${productData.fpAdviseId}" id="productName_${productData.fpAdviseId}" value="${productData.productName}"/>
				              			<input type="hidden" name="apporvalFlag_${productData.fpAdviseId}" id="apporvalFlag_${productData.fpAdviseId}" value="${productData.apporvalFlag}"/>
				              			<input type="hidden" name="categoryId_${productData.fpAdviseId}" id="categoryId_${productData.fpAdviseId}" value="${productData.categoryId}"/>
				              			 </li>
				              			<c:set var="fpAdviseIds">${productData.fpAdviseId},${fpAdviseIds}</c:set>
<%-- 				              		</c:otherwise>
				              	</c:choose> --%>			              		
				              </c:forEach>
			              	  <li><!-- <div class="add">+</div><div class="clr"></div> --> </li>
<%-- 			              	  <c:forEach begin="${fn:length(allocationData.value)}" end="3">
		         				<li>&nbsp;</li>
		         			</c:forEach> --%>
			            	</ul>
						</li>
			        	<li class="input_five fl">
			         		<ul>
		         			<c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
		         				<li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
			                	<input name="investAmount_${productData.fpAdviseId}" id="investAmount_${allocationData.key.assetClassId}_${productData.fpAdviseId}" 
			                	type="text" class="input" 
			                	value="${productData.productAmount}" onchange="calculatePercentagePerProductCategory('${allocationData.key.assetClassId}','${productData.minSipAmount}','investAmount_${allocationData.key.assetClassId}_${productData.fpAdviseId}');"></li>
		         			</c:forEach>
		         			<%-- <c:forEach begin="${fn:length(allocationData.value)}" end="5">
		         				<li>&nbsp;</li>
		         			</c:forEach> --%>
			          		</ul>
						</li>
						<li class="input_six fl">
				        	<ul>
				        	<c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
				        			<c:choose>
				                		<c:when test="${productData.clientApproval eq '95002'}">
				                			<li> <span class="app_txt02" id="msgSpan_${allocationData.key.assetClassId}_${productData.fpAdviseId}"> Sent for Approval</span></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li> <span class="app_txt" id="msgSpan_${allocationData.key.assetClassId}_${productData.fpAdviseId}"> Not Approved</span></li>	
				                		</c:otherwise>
				                	</c:choose>					        		
				        	</c:forEach>
				        	<%-- <c:forEach begin="${fn:length(allocationData.value)}" end="5">
		         				<li>&nbsp;</li>
		         			</c:forEach> --%>
				            </ul>
						</li>
			          	<li class="input_seven fl">
			            	<ul>
			         		<c:forEach items="${allocationData.value}" var="productData" varStatus="counter">
			         			<c:choose>				                  					                  	
					                  	<c:when test="${productData.clientApproval eq '95002'}">
       					                  <li> <span class="common_custom_checkbox white_checkbox_checkbox_checked not_clickable" id="clientApprovalSpan_${allocationData.key.assetClassId}_${productData.fpAdviseId}"></span>
						                  <input type="checkbox" id="clientApprovalChkbx_${allocationData.key.assetClassId}_${productData.fpAdviseId}"
						                  name="clientApprovalChkbx_${productData.fpAdviseId}" class="default_checkbox not_clickable" value="${productData.clientApproval}" checked="checked"/></li>															                  
					                  	</c:when>
					                  	<c:otherwise>
					                  		<li> <span class="common_custom_checkbox" id="clientApprovalSpan_${allocationData.key.assetClassId}_${productData.fpAdviseId}"></span>
						                  <input type="checkbox" id="clientApprovalChkbx_${allocationData.key.assetClassId}_${productData.fpAdviseId}"
						                  name="clientApprovalChkbx_${productData.fpAdviseId}" class="default_checkbox" value="95002"/></li>
					                  	</c:otherwise>		
				                  	</c:choose>	
			         		</c:forEach>
			         		<%-- <c:forEach begin="${fn:length(allocationData.value)}" end="5">
		         				<li>&nbsp;</li>
		         			</c:forEach> --%>
			            	</ul>
			            	<div class="clr"></div>
			          	</li>
		        	</ul>        		
        			<c:set var="assetClassIds">${allocationData.key.assetClassId},${assetClassIds}</c:set>
        		<c:set var="productTypeIds">${allocationData.key.productTypeId},${productTypeIds}</c:set>
        		<input type="hidden" name="fpAdviseIds_${allocationData.key.productTypeId}" id="fpAdviseIds_${allocationData.key.assetClassId}" value="${fpAdviseIds}"/>    
	    </c:forEach>
	    <input type="hidden" name="assetClassIds" id="assetClassIds" value="${assetClassIds}"/>
        <input type="hidden" name="productTypeIds" value="${productTypeIds}"/>
	    <div class="clr"></div>
	   	</div>
      </div>
      <div class="clr"></div>
    </section>
    <!-- Common_in_contnet ends --> 
    <!-- Common footer starts -->
    <section class="common_footer_actions">
      <div id="main_actions" class="clearfix">
        <ul class="reset clearfix fr btn_grup3">
	    <c:if test="${fn:contains(parentPageUrl, 'redirect:')}">
	    	<c:set var="parentPageUrl" value="${fn:replace(parentPageUrl, 'redirect:', '')}" />
	    </c:if>
          <li class="fl list"><a href="#" onclick="submitData();" class="anch save ${goalActionPlanControlId}"><span class="txt">Save</span></a></li>
          <li class="fl list"><a href="${pageContext.request.contextPath}${parentPageUrl}" class="anch cancel"><span class="txt">Cancel</span></a></li>
          <li class="fl list inactiveLink"><a href="financial-readiness.html" class="anch skip"><span class="txt">Skip</span></a></li>
        </ul>
        <ul class="reset clearfix fr btn_grup2">
          <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
          <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
        </ul>
        <ul class="reset clearfix fl btn_grup1">
          <li class="fl list"><a href="${analysisLink}" class="anch analysis"><span class="txt">Analysis</span></a></li>
          <li class="fl list"><a href="${suggestionLink}" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
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
	$(".wrapper").addClass("goal_action_plan_wrapper");
	$("select").selectBoxIt();
	
	$("body").on("click",".common_custom_checkbox",function(){
	    $(this).toggleClass("white_checkbox_checkbox_checked");		
	 	if ($(this).next( ".default_checkbox" ).is(":checked")) {			
       		$(this).next( ".default_checkbox" ).prop("checked", false);
    	} else {
       		$(this).next( ".default_checkbox" ).prop("checked", true);		
    	}	
	});

	$('.purchase_car_action_plan_bx_in').slimScroll();
	
	$('.investmentType').on("click",function(){
		var investmentType=$(this).val();
		//alert(investmentType);
		window.location.href="${pageContext.request.contextPath}/actionplan/goal/${goalName}/${partyId}/${goalId}?goalTypeId=${goalTypeId}&investmentType="+investmentType;
	});
	
	var partnerSetupLinks = "${goalActionPlanLink}";
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

equalHeightEightCol($('.input_one'), $('.input_one_of_one'), $('.input_two'), $('.input_three'), $('.input_four'), $('.input_five'), $('.input_six'), $('.input_seven'));

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

function submitData(){
	var assetClassIds=$("#assetClassIds").val();
	var assetClassIdArray=assetClassIds.split(",");
	/*var fpAdviseIds="";
	var fpAdviseIdsArray=[]; */
	//var targetAmount=parseFloat($("#sip").val());
	/* var initialtargetAmount=$("#initialSipAmount").val(); */
	/* if(targetAmount < initialtargetAmount){
		displayMsg("SIP amount cannot be less than "+initialtargetAmount);
		return false;
	}else{ */
		
	//}
	
	var investmentType="";
	if($("#sipRadio").is(":checked")){
		investmentType="SIP";
	}else{
		investmentType="Lumpsum";
	}
	
	var totalPercent=0;
	for(var i=0;i<assetClassIdArray.length;i++){
		if($("#allocationPercent_"+assetClassIdArray[i]).val()){
			totalPercent=totalPercent + parseFloat($("#allocationPercent_"+assetClassIdArray[i]).val());
		}
		
	}
	totalPercent = totalPercent.toFixed(2);
	if((totalPercent>="100.00") && (totalPercent<="101.00")){
		$('#actionPlanForm').submit();
	}else{
		displayMsg("Total investment amount must match "+ investmentType +" amount.");		
	}
	
	/*amount=amount.toFixed(2);
	targetAmount=targetAmount.toFixed(2);
	if(amount>=targetAmount){
		$('#actionPlanForm').submit();
	}else{
		displayMsg("Total investment amount must match SIP amount.");
	} */
}

function calculatePercentagePerProductCategory(assetClassId,minSipAmount,txtBxId){
	var assetClassIds=$("#assetClassIds").val();
	var assetClassIdArray=assetClassIds.split(",");
	var fpAdviseIds="";
	var fpAdviseIdsArray=[];	
	var amount=0.0;
	//var roundAmount = 0;
	var netPercentage=0.0;
	var tempAmount = 0.0;
	var tempAssetClassId=0;
	/* var assetWiseTotal = []; */
	
	var targetAmount=0;
	if($("#sipRadio").is(":checked")){
		targetAmount=$("#sip").val();
	}else{
		targetAmount=$("#lumpSum").val();
	}
	
	for(var i=0;i<assetClassIdArray.length;i++){
		if($("#fpAdviseIds_"+assetClassIdArray[i]).val()){
			if(assetClassIdArray[i] != tempAssetClassId){
				if(i != 0){
					tempAmount = tempAmount.toFixed(2); 
					netPercentage=(tempAmount/targetAmount)*100;
					netPercentage=netPercentage.toFixed(2);
					$("#allocationPercent_"+tempAssetClassId).val(netPercentage);
					$("#allocationPercentDiv_"+tempAssetClassId).html(netPercentage);	
					tempAmount = 0.0;
				}
				tempAssetClassId = assetClassIdArray[i];			
			}
			fpAdviseIds=$("#fpAdviseIds_"+assetClassIdArray[i]).val();			
			fpAdviseIdsArray=fpAdviseIds.split(",");	
			for(var j=0;j<fpAdviseIdsArray.length;j++){
				if($("#investAmount_"+ assetClassIdArray[i] +"_"+fpAdviseIdsArray[j]).val()){
					roundAmount = ($("#investAmount_"+ assetClassIdArray[i] +"_"+fpAdviseIdsArray[j]).val()) % 100;
					if(roundAmount == 0){ 
						amount=parseFloat(amount) + parseFloat($("#investAmount_"+ assetClassIdArray[i] +"_"+fpAdviseIdsArray[j]).val());
						tempAmount = parseFloat(tempAmount) + parseFloat($("#investAmount_"+ assetClassIdArray[i] +"_"+fpAdviseIdsArray[j]).val());	
					}else{
						$("#investAmount_"+ assetClassIdArray[i] +"_"+fpAdviseIdsArray[j]).val("0");
						displayMsg("Investment amount should be multiple of 100.");
						calculatePercentagePerProductCategory(assetClassId,minSipAmount,txtBxId);
						return false;	
					} 					
				}
			}
		}
	}
	
	tempAmount = tempAmount.toFixed(2); 
	netPercentage=(tempAmount/targetAmount)*100;
	netPercentage=netPercentage.toFixed(2);
	$("#allocationPercent_"+tempAssetClassId).val(netPercentage);
	$("#allocationPercentDiv_"+tempAssetClassId).html(netPercentage);
	
	//assetWiseTotal[tempAssetClassId] = tempAmount;
	
	/* var investAmount=0;
	
	if($("#sipRadio").is(":checked")){
		investAmount=parseFloat($("#sip").val()).toFixed(2);
	}else{
		investAmount=parseFloat($("#lumpSum").val()).toFixed(2);
	} */
				
	//investAmount = investAmount.toFixed(2);
	
	/* if(amount > investAmount){
		displayMsg("Total amount cannot be greater than "+investAmount);
		$("#"+txtBxId).val("0.00");
		//calculatePercentagePerProductCategory(assetClassId,minSipAmount,txtBxId);
	} */
	
 	//if(amount >= initialtargetAmount){
	//$("#sip").val(amount.toFixed(2));
		/*}else{
		displayMsg("SIP amount cannot be less than "+initialtargetAmount);
		$("#sip").val(initialtargetAmount);
		$("#"+txtBxId).val("0.00");
		return false;
	} */
	
	/* var targetAmount=investAmount;
	
	for(var i=0;i<assetClassIdArray.length;i++){
		if(assetClassIdArray[i]){
			amount=assetWiseTotal[assetClassIdArray[i]];
			amount = amount.toFixed(2); 
			netPercentage=(amount/targetAmount)*100;
			netPercentage=netPercentage.toFixed(2);
			$("#allocationPercent_"+assetClassIdArray[i]).val(netPercentage);
			$("#allocationPercentDiv_"+assetClassIdArray[i]).html(netPercentage);	
		}
		
	} */
	
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