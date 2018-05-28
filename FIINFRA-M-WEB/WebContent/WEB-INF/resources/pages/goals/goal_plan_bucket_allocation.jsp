<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
/*	#gp_view_bucket_alloc .tabular_data .sec_col .fifth {
	width: 191px;
}*/
	#gp_view_bucket_alloc.gp_view_bucket_alloc_all .tabular_data .sec_col .fourth {
	width: 256px;
}
#gp_view_bucket_alloc.gp_view_bucket_alloc_all .table_content .third_sub {
width: 84px;
}
</style>
<c:if test="${sliderSelectBx eq 'products'}">
<style>
#gp_view_bucket_alloc .table_content .second,
#gp_view_bucket_alloc .table_content .third,
#gp_view_bucket_alloc .table_content .fourth,
#gp_view_bucket_alloc .table_content .fifth {
 font-size:12px;
 text-align:left;
}
#gp_view_bucket_alloc .table_content .fifth .value {
 font-size:12px;
}
</style>
</c:if>
<script>
$(document).ready(function(){
     
	$("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
      $('.scrollable_data').slimScroll();
	
      var roleBaseLinks = "${roleBaseLinks}";
  	var links = roleBaseLinks.split(",");
  	if(links != ""){
  		for(var i=0;i<links.length;i++){
  			$("."+links[i]).attr("href","#");
  			$("."+links[i]).addClass("inactiveLink");
  			if(links[i].indexOf("save")>-1)
  			{
  				if(document.forms[0] != undefined){
  				document.forms[0].action = "";
  				}
  			}
  		}
  	}
	 
	   createSlider('#allocation_type',1,2,1,'#type_count');
	   <c:choose>
		<c:when test="${sliderSelectBx eq 'products'}">
		   	$( "#allocation_type" ).slider( "value", 1 );
	        $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
		    $("#allocation_type .ui-slider-handle").css({'width':'107px','line-height':'13px','margin-left': '3px'});
		    $(".year_to_goal").fadeIn("slow"); 
			$("#sliding_selectBX").val("products");
	   	</c:when>
	   	<c:otherwise>
		   	$( "#allocation_type" ).slider( "value", 2 );
		   	$("#allocation_type .ui-slider-handle").text("Allocation %");
		    $("#allocation_type .ui-slider-handle").css({'width':'74px','line-height':'25px'});
		    $("#allocation_type .ui-slider-handle").css("margin-left", "-87px");
		    $("#sliding_selectBX").val("allocation");
	   	</c:otherwise>
	   </c:choose>

}); 
</script>
<c:set var="tempAssetClassId" value="0"/>
<c:set var="tempPorductTypeId" value="0"/>
<c:set var="tempCategoryId" value="0"/>
<section class="main">     
    <!-- Common_content Starts-->
    <section class="content common_content">
      <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
      <div class="clr"></div>
      <section class="in_content common_in_content clearfix" id="gp_view_bucket_alloc">
        <div class="top_box clearfix">
          <div class="fl alloc_partnet"><div id="allocation_type" class="common_sliding_radio">
          <span class="lbl_first lbl">Product Recommendations </span> <span class="lbl_second lbl">Allocation %</span>  
		 </div>
		  <input type="text" id="sliding_selectBX" class="range_counter hide-elem" value="allocation"> 
		   </div>
          <div class="fl"><h2 class="fl heading">Risk Profile</h2>
          <select class="fl" id="riskProfileType">
           	<option value="40001">Conservative</option>
           	<option value="40002">Balanced</option>
           	<option value="40003">Aggressive</option>
           	<c:if test="${not (sliderSelectBx eq 'products')}">
           		<option value="-1">All</option>
           	</c:if>           	
          </select></div>
          <div class="fl year_to_goal hide"><h2 class="fl heading">Year to Goal</h2>
          <select class="fl" id="goalYearRangeId">
            <option value="62009">0-3 Years</option>
            <option value="62010">3-5 Years</option>
            <option value="62011">5-7 Years</option>
            <option value="62012">7-9 Years</option>
            <option value="62013">More than 9 Years</option>
          </select></div>
          <a class="back fr" href="${pageContext.request.contextPath}/partner/recommendation">BACK</a>
          <c:if test="${sliderSelectBx eq 'products'}">
          <a class="edit fr saveGoalPlanLink" style="cursor:pointer;">Edit</a>
          </c:if>
          <a class="set_default_btn fr hide dyanmic_buttons" href="#">Set Default</a>
          <a class="cancel fr hide dyanmic_buttons" href="#">Cancel</a>
          <a class="save fr hide dyanmic_buttons" href="#">Save</a>
           </div>
      <!-- advive adssumption ends-->
      <c:choose>
      	<c:when test="${sliderSelectBx eq 'products'}">
      		<div class="tabular_data product_allocaton">
		          <ul class="table_head reset clearfix">
		            <li class="fl sec_col">
		              <div class="second theme_background"><!-- <select class="" id="asset_class_list">
		            <option value="46001">Equity</option>
		            <option value="46002">Debt</option>
		            <option value="46003">Gold</option>
		            <option value="46001,46002,46003">All</option>
		          </select> -->Asset Class </div>
		              <div class="third">Product Type</div>
		              <div class="fourth">Product Category</div>
		              <div class="fifth theme_background">Product</div>
		              <div class="clr"></div>
		            </li>
		          </ul>
		          
		          <div class="scrollable_data">
		          <c:forEach items="${adviceRecommendationsList}" var="adviceRecommendation">
		          	<ul class="table_content clearfix reset">		            
			            <c:choose>
			            	<c:when test="${not (adviceRecommendation.assetClassId eq tempAssetClassId)}">
			            		<c:set var="tempAssetClassId" value="${adviceRecommendation.assetClassId}"/>
			            		<li class="second fl">${adviceRecommendation.assetName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentAssetClass}" />%</span>)</li>
			            	</c:when>
			            	<c:otherwise>
			            		<li class="second fl">&nbsp;</li>
			            	</c:otherwise>
			            </c:choose>
			            <c:choose>
			            	<c:when test="${not (adviceRecommendation.productTypeId eq tempPorductTypeId)}">
			            		<c:set var="tempPorductTypeId" value="${adviceRecommendation.productTypeId}"/>
			            		<li class="third fl">${adviceRecommendation.productTypeName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentProductType}" />%</span>)</li>
			            	</c:when>
			            	<c:otherwise>
			            		<li class="third fl">&nbsp;</li>
			            	</c:otherwise>
			            </c:choose>
			            <c:choose>
			            	<c:when test="${not (adviceRecommendation.categoryId eq tempCategoryId)}">
			            		<c:set var="tempCategoryId" value="${adviceRecommendation.categoryId}"/>
			            		<li class="fourth fl">${adviceRecommendation.categoryName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentCategoryId}" />%</span>)</li>	
			            	</c:when>
			            	<c:otherwise>
			            		<li class="fourth fl">&nbsp;</li>
			            	</c:otherwise>
			            </c:choose>			            
			            <li class="fifth fl">
			            	<c:choose>
	            				<c:when test="${not empty adviceRecommendation.productName}">			            
				            		${adviceRecommendation.productName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentProductId}" />%</span>)
				            	</c:when>
				            	<c:otherwise>
				            		&nbsp;
				            	</c:otherwise>
			            	</c:choose>
			            </li>
			        </ul>
		          </c:forEach>
		          
		          <!-- <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul>
		          <ul class="table_content clearfix reset">
		            
		            <li class="second fl">Equity (<span class="value">100</span>)</li>
		            <li class="third fl">Pt (<span class="value">abc</span>)</li>
		            <li class="fourth fl">Pc (<span class="value">xyz</span>)</li>
		            <li class="fifth fl">Name (<span class="value">pqr</span>)</li>
		          </ul> -->
		          </div>
		        </div>
      	</c:when>
      	<c:otherwise>
      		<c:choose>
	        	<c:when test="${riskProfileId eq '-1'}">
	        		<c:set var="zeroToThreeEQConst" value="0" />
			       	<c:set var="zeroToThreeDBTConst" value="0" />
			       	<c:set var="zeroToThreeGLDConst" value="0" />
			       
			       	<c:set var="zeroToThreeEQBal" value="0" />
			       	<c:set var="zeroToThreeDBTBal" value="0" />
			       	<c:set var="zeroToThreeGLDBal" value="0" />
			       	
			       	<c:set var="zeroToThreeEQAgg" value="0" />
			       	<c:set var="zeroToThreeDBTAgg" value="0" />
			       	<c:set var="zeroToThreeGLDAgg" value="0" />
			       	
			       	
			       	<c:set var="threeToFiveEQConst" value="0" />
			       	<c:set var="threeToFiveDBTConst" value="0" />
			       	<c:set var="threeToFiveGLDConst" value="0" />
			       
			       	<c:set var="threeToFiveEQBal" value="0" />
			       	<c:set var="threeToFiveDBTBal" value="0" />
			       	<c:set var="threeToFiveGLDBal" value="0" />
			       	
			       	<c:set var="threeToFiveEQAgg" value="0" />
			       	<c:set var="threeToFiveDBTAgg" value="0" />
			       	<c:set var="threeToFiveGLDAgg" value="0" />
			       	
			       	
			       	<c:set var="fiveToSevenEQConst" value="0" />
			       	<c:set var="fiveToSevenDBTConst" value="0" />
			       	<c:set var="fiveToSevenGLDConst" value="0" />
			       
			       	<c:set var="fiveToSevenEQBal" value="0" />
			       	<c:set var="fiveToSevenDBTBal" value="0" />
			       	<c:set var="fiveToSevenGLDBal" value="0" />
			       	
			       	<c:set var="fiveToSevenEQAgg" value="0" />
			       	<c:set var="fiveToSevenDBTAgg" value="0" />
			       	<c:set var="fiveToSevenGLDAgg" value="0" />
			       	
			       	
			       	<c:set var="sevenToNineEQConst" value="0" />
			       	<c:set var="sevenToNineDBTConst" value="0" />
			       	<c:set var="sevenToNineGLDConst" value="0" />
			       
			       	<c:set var="sevenToNineEQBal" value="0" />
			       	<c:set var="sevenToNineDBTBal" value="0" />
			       	<c:set var="sevenToNineGLDBal" value="0" />
			       	
			       	<c:set var="sevenToNineEQAgg" value="0" />
			       	<c:set var="sevenToNineDBTAgg" value="0" />
			       	<c:set var="sevenToNineGLDAgg" value="0" />
			       	
			       	
			       	<c:set var="nineAndMoreEQConst" value="0" />
			       	<c:set var="nineAndMoreDBTConst" value="0" />
			       	<c:set var="nineAndMoreGLDConst" value="0" />
			             
			        <c:set var="nineAndMoreEQBal" value="0" />
			       	<c:set var="nineAndMoreDBTBal" value="0" />
			       	<c:set var="nineAndMoreGLDBal" value="0" />
			       	
			       	<c:set var="nineAndMoreEQAgg" value="0" />
			       	<c:set var="nineAndMoreDBTAgg" value="0" />
			       	<c:set var="nineAndMoreGLDAgg" value="0" />
			       	
					<c:forEach items="${recommendationsCONS}" var="recommendation"> 
				       	<c:choose>
				       		<c:when test="${recommendation.goalYearRange eq '0-3 Years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="zeroToThreeEQConst" value="${zeroToThreeEQConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="zeroToThreeDBTConst" value="${zeroToThreeDBTConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="zeroToThreeGLDConst" value="${zeroToThreeGLDConst + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>          			
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '3-5 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="threeToFiveEQConst" value="${threeToFiveEQConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="threeToFiveDBTConst" value="${threeToFiveDBTConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="threeToFiveGLDConst" value="${threeToFiveGLDConst + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '5-7 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="fiveToSevenEQConst" value="${fiveToSevenEQConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="fiveToSevenDBTConst" value="${fiveToSevenDBTConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="fiveToSevenGLDConst" value="${fiveToSevenGLDConst + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '7-9 Years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="sevenToNineEQConst" value="${sevenToNineEQConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="sevenToNineDBTConst" value="${sevenToNineDBTConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="sevenToNineGLDConst" value="${sevenToNineGLDConst + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq 'More than 9 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="nineAndMoreEQConst" value="${nineAndMoreEQConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="nineAndMoreDBTConst" value="${nineAndMoreDBTConst + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="nineAndMoreGLDConst" value="${nineAndMoreGLDConst + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:otherwise></c:otherwise>
				       	</c:choose>			       	
					</c:forEach>
					
					<c:forEach items="${recommendationsBAL}" var="recommendation"> 
				       	<c:choose>
				       		<c:when test="${recommendation.goalYearRange eq '0-3 Years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="zeroToThreeEQBal" value="${zeroToThreeEQBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="zeroToThreeDBTBal" value="${zeroToThreeDBTBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="zeroToThreeGLDBal" value="${zeroToThreeGLDBal + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>          			
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '3-5 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="threeToFiveEQBal" value="${threeToFiveEQBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="threeToFiveDBTBal" value="${threeToFiveDBTBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="threeToFiveGLDBal" value="${threeToFiveGLDBal + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '5-7 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="fiveToSevenEQBal" value="${fiveToSevenEQBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="fiveToSevenDBTBal" value="${fiveToSevenDBTBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="fiveToSevenGLDBal" value="${fiveToSevenGLDBal + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '7-9 Years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="sevenToNineEQBal" value="${sevenToNineEQBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="sevenToNineDBTBal" value="${sevenToNineDBTBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="sevenToNineGLDBal" value="${sevenToNineGLDBal + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq 'More than 9 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="nineAndMoreEQBal" value="${nineAndMoreEQBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="nineAndMoreDBTBal" value="${nineAndMoreDBTBal + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="nineAndMoreGLDBal" value="${nineAndMoreGLDBal + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:otherwise></c:otherwise>
				       	</c:choose>			       	
					</c:forEach>
					
					<c:forEach items="${recommendationsAggr}" var="recommendation"> 
				       	<c:choose>
				       		<c:when test="${recommendation.goalYearRange eq '0-3 Years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="zeroToThreeEQAgg" value="${zeroToThreeEQAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="zeroToThreeDBTAgg" value="${zeroToThreeDBTAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="zeroToThreeGLDAgg" value="${zeroToThreeGLDAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>          			
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '3-5 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="threeToFiveEQAgg" value="${threeToFiveEQAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="threeToFiveDBTAgg" value="${threeToFiveDBTAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="threeToFiveGLDAgg" value="${threeToFiveGLDAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '5-7 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="fiveToSevenEQAgg" value="${fiveToSevenEQAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="fiveToSevenDBTAgg" value="${fiveToSevenDBTAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="fiveToSevenGLDAgg" value="${fiveToSevenGLDAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq '7-9 Years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="sevenToNineEQAgg" value="${sevenToNineEQAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="sevenToNineDBTAgg" value="${sevenToNineDBTAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="sevenToNineGLDAgg" value="${sevenToNineGLDAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:when test="${recommendation.goalYearRange eq 'More than 9 years'}">
				       			<c:choose>
				       				<c:when test="${recommendation.assetClassId eq '46001' }">
				       					<c:set var="nineAndMoreEQAgg" value="${nineAndMoreEQAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46002' }">
				       					<c:set var="nineAndMoreDBTAgg" value="${nineAndMoreDBTAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       				<c:when test="${recommendation.assetClassId eq '46003' }">
				       					<c:set var="nineAndMoreGLDAgg" value="${nineAndMoreGLDAgg + recommendation.allocationPercent}" />
				       				</c:when>
				       			</c:choose>
				       		</c:when>
				       		
				       		<c:otherwise></c:otherwise>
				       	</c:choose>			       	
					</c:forEach>							      
		       		<div class="tabular_data gp_view_bucket_alloc_all">
			          <ul class="table_head reset clearfix">
			            <li class="fl primary_head first theme_background goal_years">Years To Goal</li>
			            <li class="fl sec_col">
			              <div class="primary_head asset_c_allocat">Asset Class Allocation</div>
			              <div class="second"><div class="title">Equity</div>
			              <div class="fl conserative first_sub">C</div><div class="fl balance second_sub">B</div>
			              <div class="fl aggressive third_sub">A</div>
			              <div class="clr"></div>
			              </div>
			              <div class="third"><div class="title">Debt</div>
			              <div class="fl conserative first_sub">C</div><div class="fl balance second_sub">B</div>
			              <div class="fl aggressive third_sub">A</div>
			              <div class="clr"></div>
			              </div>
			              <div class="fourth"><div class="title">Gold</div>
			              <div class="fl conserative first_sub">C</div><div class="fl balance second_sub">B</div>
			              <div class="fl aggressive third_sub">A</div>
			              <div class="clr"></div>
			              </div>
			              
			              <div class="clr"></div>
			            </li>
			          </ul>
			          
			          <ul class="table_content clearfix reset">
			            <li class="first fl">
			              <div class="value">0-3 Years</div>
			            </li>
			            <li class="second fl">
			            	<div class="fl first_sub">${zeroToThreeEQConst}%</div>
			            	<div class="fl second_sub">${zeroToThreeEQBal}%</div>
			            	<div class="fl third_sub">${zeroToThreeEQAgg}%</div>
			            	<div class="clr"></div>
			            </li>
						<li class="third fl">
							<div class="fl first_sub">${zeroToThreeDBTConst}%</div>
							<div class="fl second_sub">${zeroToThreeDBTBal}%</div>
							<div class="fl third_sub">${zeroToThreeDBTAgg}%</div>
						</li>
						<li class="fourth fl">
							<div class="fl first_sub">${zeroToThreeGLDConst}%</div>
							<div class="fl second_sub">${zeroToThreeGLDBal}%</div>
							<div class="fl third_sub">${zeroToThreeGLDAgg }%</div>
						</li>			            
			         	</ul>
			         	<ul class="table_content clearfix reset">
			            <li class="first fl">
			              <div class="value">3-5 years</div>
			            </li>
						<li class="second fl">
							<div class="fl first_sub">${threeToFiveEQConst}%</div>
							<div class="fl second_sub">${threeToFiveEQBal}%</div>
							<div class="fl third_sub">${threeToFiveEQAgg }%</div>
						</li>
						<li class="third fl">
							<div class="fl first_sub">${threeToFiveDBTConst}%</div>
							<div class="fl second_sub">${threeToFiveDBTBal}%</div>
							<div class="fl third_sub">${threeToFiveDBTAgg}%</div>
						</li>
						<li class="fourth fl">
							<div class="fl first_sub">${threeToFiveGLDConst}%</div>
							<div class="fl second_sub">${threeToFiveGLDBal }%</div>
							<div class="fl third_sub">${threeToFiveGLDAgg }%</div>
						</li>
					</ul>
			         	<ul class="table_content clearfix reset">
			            <li class="first fl">
			              <div class="value">5-7 years</div>
			            </li>
						<li class="second fl">
							<div class="fl first_sub">${fiveToSevenEQConst}%</div>
							<div class="fl second_sub">${fiveToSevenEQBal }%</div>
							<div class="fl third_sub">${fiveToSevenEQAgg }%</div>
						</li>
						<li class="third fl">
							<div class="fl first_sub">${fiveToSevenDBTConst}%</div>
							<div class="fl second_sub">${fiveToSevenDBTBal }%</div>
							<div class="fl third_sub">${fiveToSevenDBTAgg }%</div>
						</li>
						<li class="fourth fl">
							<div class="fl first_sub">${fiveToSevenGLDConst}%</div>
							<div class="fl second_sub">${fiveToSevenGLDBal }%</div>
							<div class="fl third_sub">${fiveToSevenGLDAgg }%</div>
						</li>
					</ul>				          
			         	<ul class="table_content clearfix reset">
			            <li class="first fl">
			              <div class="value">7-9 Years</div>
			            </li>
						<li class="second fl">
							<div class="fl first_sub">${sevenToNineEQConst}%</div>
							<div class="fl second_sub">${sevenToNineEQBal }%</div>
							<div class="fl third_sub">${sevenToNineEQAgg }%</div>
						</li>
						<li class="third fl">
							<div class="fl first_sub">${sevenToNineDBTConst}%</div>
							<div class="fl second_sub">${sevenToNineDBTBal}%</div>
							<div class="fl third_sub">${sevenToNineDBTAgg }%</div>
						</li>
						<li class="fourth fl">
							<div class="fl first_sub">${sevenToNineGLDConst }%</div>
							<div class="fl second_sub">${sevenToNineGLDBal }%</div>
							<div class="fl third_sub">${sevenToNineGLDAgg }%</div>
						</li>
					</ul>			          
					<ul class="table_content clearfix reset last_row">
			            <li class="first fl">
			              <div class="value">More than 9 years</div>
			            </li>
						<li class="second fl">
							<div class="fl first_sub">${nineAndMoreEQConst }%</div>
							<div class="fl second_sub">${nineAndMoreEQBal }%</div>
							<div class="fl third_sub">${nineAndMoreEQAgg }%</div>
						</li>
						<li class="third fl">
							<div class="fl first_sub">${nineAndMoreDBTConst }%</div>
							<div class="fl second_sub">${nineAndMoreDBTBal}%</div>
							<div class="fl third_sub">${nineAndMoreDBTAgg }%</div>
						</li>
						<li class="fourth fl">
							<div class="fl first_sub">${nineAndMoreGLDConst }%</div>
							<div class="fl second_sub">${nineAndMoreGLDBal }%</div>
							<div class="fl third_sub">${nineAndMoreGLDAgg }%</div>
						</li>
					</ul>
			        </div>        
	      </c:when>
	      <c:otherwise>
	      	<c:set var="zeroToThreeEQ" value="0" />
	       	<c:set var="zeroToThreeDBT" value="0" />
	       	<c:set var="zeroToThreeGLD" value="0" />
	       
	       	<c:set var="threeToFiveEQ" value="0" />
	       	<c:set var="threeToFiveBT" value="0" />
	       	<c:set var="threeToFiveGLD" value="0" />
	       
	       	<c:set var="fiveToSevenEQ" value="0" />
	       	<c:set var="fiveToSevenDBT" value="0" />
	       	<c:set var="fiveToSevenGLD" value="0" />
	       
	       	<c:set var="sevenToNineEQ" value="0" />
	       	<c:set var="sevenToNineDBT" value="0" />
	       	<c:set var="sevenToNineGLD" value="0" />
	       
	       	<c:set var="nineAndMoreEQ" value="0" />
	       	<c:set var="nineAndMoreDBT" value="0" />
	       	<c:set var="nineAndMoreGLD" value="0" />
	             
			<c:forEach items="${recommendations}" var="recommendation"> 
		       	<c:choose>
		       		<c:when test="${recommendation.goalYearRange eq '0-3 Years'}">
		       			<c:choose>
		       				<c:when test="${recommendation.assetClassId eq '46001' }">
		       					<c:set var="zeroToThreeEQ" value="${zeroToThreeEQ + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46002' }">
		       					<c:set var="zeroToThreeDBT" value="${zeroToThreeDBT + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46003' }">
		       					<c:set var="zeroToThreeGLD" value="${zeroToThreeGLD + recommendation.allocationPercent}" />
		       				</c:when>
		       			</c:choose>          			
		       		</c:when>
		       		
		       		<c:when test="${recommendation.goalYearRange eq '3-5 years'}">
		       			<c:choose>
		       				<c:when test="${recommendation.assetClassId eq '46001' }">
		       					<c:set var="threeToFiveEQ" value="${threeToFiveEQ + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46002' }">
		       					<c:set var="threeToFiveBT" value="${threeToFiveBT + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46003' }">
		       					<c:set var="threeToFiveGLD" value="${threeToFiveGLD + recommendation.allocationPercent}" />
		       				</c:when>
		       			</c:choose>
		       		</c:when>
		       		
		       		<c:when test="${recommendation.goalYearRange eq '5-7 years'}">
		       			<c:choose>
		       				<c:when test="${recommendation.assetClassId eq '46001' }">
		       					<c:set var="fiveToSevenEQ" value="${fiveToSevenEQ + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46002' }">
		       					<c:set var="fiveToSevenDBT" value="${fiveToSevenDBT + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46003' }">
		       					<c:set var="fiveToSevenGLD" value="${fiveToSevenGLD + recommendation.allocationPercent}" />
		       				</c:when>
		       			</c:choose>
		       		</c:when>
		       		
		       		<c:when test="${recommendation.goalYearRange eq '7-9 Years'}">
		       			<c:choose>
		       				<c:when test="${recommendation.assetClassId eq '46001' }">
		       					<c:set var="sevenToNineEQ" value="${sevenToNineEQ + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46002' }">
		       					<c:set var="sevenToNineDBT" value="${sevenToNineDBT + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46003' }">
		       					<c:set var="sevenToNineGLD" value="${sevenToNineGLD + recommendation.allocationPercent}" />
		       				</c:when>
		       			</c:choose>
		       		</c:when>
		       		
		       		<c:when test="${recommendation.goalYearRange eq 'More than 9 years'}">
		       			<c:choose>
		       				<c:when test="${recommendation.assetClassId eq '46001' }">
		       					<c:set var="nineAndMoreEQ" value="${nineAndMoreEQ + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46002' }">
		       					<c:set var="nineAndMoreDBT" value="${nineAndMoreDBT + recommendation.allocationPercent}" />
		       				</c:when>
		       				<c:when test="${recommendation.assetClassId eq '46003' }">
		       					<c:set var="nineAndMoreGLD" value="${nineAndMoreGLD + recommendation.allocationPercent}" />
		       				</c:when>
		       			</c:choose>
		       		</c:when>
		       		
		       		<c:otherwise></c:otherwise>
		       	</c:choose>			       	
			</c:forEach>
		       <div class="tabular_data allocation_percentage">
		        	<ul class="table_head reset clearfix">
		            	<li class="fl primary_head first theme_background goal_years">Years To Goal</li>
		           		<li class="fl sec_col">
		             		<div class="primary_head asset_c_allocat">Asset Class Allocation</div>
		             		<div class="second">Equity</div>
			              	<div class="third">Debt</div>
			              	<div class="fourth">Gold</div>
			              	<div class="fifth theme_background">Return(%)</div>
			              	<div class="clr"></div>
		           		</li>
		          	</ul>
			        <ul class="table_content clearfix reset">
						<li class="first fl">
			              <div class="value">0-3 Years</div>
			            </li>
			            <li class="second fl"><c:out value="${zeroToThreeEQ}"></c:out>%</li>
			            <li class="third fl"><c:out value="${zeroToThreeDBT}"></c:out>%</li>
			            <li class="fourth fl"><c:out value="${zeroToThreeGLD}"></c:out>%</li>            
			            <li class="fifth fl">
			              <c:set var="returns" value="${(((zeroToThreeEQ * equityReturns) + (zeroToThreeDBT * debtReturns) + (zeroToThreeGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              	<c:when test="${returns eq 0}">
			              		<div class="value">0.00%</div>
			              	</c:when>
			              	<c:otherwise>
			              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              	</c:otherwise>
			              </c:choose>
			            </li>
			        </ul>
			        <ul class="table_content clearfix reset">
			            <li class="first fl">
			              <div class="value">3-5 years</div>
			            </li>
			            <li class="second fl"><c:out value="${threeToFiveEQ}"></c:out>%</li>
			            <li class="third fl"><c:out value="${threeToFiveBT}"></c:out>%</li>
			            <li class="fourth fl"><c:out value="${threeToFiveGLD}"></c:out>%</li>
			            <li class="fifth fl">
			              <c:set var="returns" value="${(((threeToFiveEQ * equityReturns) + (threeToFiveBT * debtReturns) + (threeToFiveGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              	<c:when test="${returns eq 0}">
			              		<div class="value">0.00%</div>
			              	</c:when>
			              	<c:otherwise>
			              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              	</c:otherwise>
			              </c:choose>
			            </li>
					</ul>
			        <ul class="table_content clearfix reset">
			            <li class="first fl">
			              <div class="value">5-7 years</div>
			        	</li>
			            <li class="second fl"><c:out value="${fiveToSevenEQ}"></c:out>%</li>
			            <li class="third fl"><c:out value="${fiveToSevenDBT}"></c:out>%</li>
			            <li class="fourth fl"><c:out value="${fiveToSevenGLD}"></c:out>%</li>
			            <li class="fifth fl">
			              <c:set var="returns" value="${(((fiveToSevenEQ * equityReturns) + (fiveToSevenDBT * debtReturns) + (fiveToSevenGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              	<c:when test="${returns eq 0}">
			              		<div class="value">0.00%</div>	
			              	</c:when>
			              	<c:otherwise>
			              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              	</c:otherwise>
			              </c:choose>
			        	</li>
			        </ul>
					<ul class="table_content clearfix reset">
			            <li class="first fl">
			              <div class="value">7-9 Years</div>
			            </li>
			            <li class="second fl"><c:out value="${sevenToNineEQ}"></c:out>%</li>
			            <li class="third fl"><c:out value="${sevenToNineDBT}"></c:out>%</li>
			            <li class="fourth fl"><c:out value="${sevenToNineGLD}"></c:out>%</li>
			            <li class="fifth fl">
			              <c:set var="returns" value="${(((sevenToNineEQ * equityReturns) + (sevenToNineDBT * debtReturns) + (sevenToNineGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              <c:when test="${returns eq 0}">
			              	<div class="value">0.00%</div>
			              </c:when>
			              <c:otherwise>
			              	<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              </c:otherwise>
			              </c:choose>
			            </li>
			        </ul>
			        <ul class="table_content clearfix reset last_row">
		            <li class="first fl">
		              <div class="value">More than 9 years</div>
		            </li>
		            <li class="second fl"><c:out value="${nineAndMoreEQ}"></c:out>%</li>
		            <li class="third fl"><c:out value="${nineAndMoreDBT}"></c:out>%</li>
		            <li class="fourth fl"><c:out value="${nineAndMoreGLD}"></c:out>%</li>
		            <li class="fifth fl">
		              <c:set var="returns" value="${(((nineAndMoreEQ * equityReturns) + (nineAndMoreDBT * debtReturns) + (nineAndMoreGLD * goldReturns)) / (100 * 100) ) * 100 }"/>
		              <c:choose>
		              	<c:when test="${returns eq 0}">
			             	<div class="value">0.00%</div>
			          	</c:when>
			          	<c:otherwise>
		              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
		              	</c:otherwise>
		              </c:choose>
		            </li>
		        </ul>
		       </div>
	      </c:otherwise>
	      </c:choose>
      	</c:otherwise>
      </c:choose>
      
      </section>
      <!-- Common_in_contnet ends --> 
      
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
<script>
$(document).ready(function(){     
	$("select").selectBoxIt();
	
	$(".edit").click(function(){
		window.location.href="${pageContext.request.contextPath}/partner/editGoalBucketAllocation/"+$("#goalYearRangeId").val()+"/"+$("#riskProfileType").val();
		//alert("edit called");
	});
	 $(":selectBox-selectBoxIt").each(function(){
    $(this).data('selectBox-selectBoxIt').refresh();
     });
	
	$( "#allocation_type" ).on("slide", function( event, ui ) {
		
		$("#allocation_type .ui-slider-handle").empty();
	        if (ui.value == 2) {
	            $("#allocation_type .ui-slider-handle").css("margin-left", "-87px");
	            $("#allocation_type .ui-slider-handle").css({'width':'74px','line-height':'25px'});
				$(".year_to_goal").fadeOut("fast");
				$(".edit").fadeOut("fast");
	            $("#allocation_type .ui-slider-handle").text("Allocation %");
	            $("#sliding_selectBX").val("allocation"); 
	            window.location.href="${pageContext.request.contextPath}/partner/goal/view-bucket-allocation/${partyId}" + "/" + $("#riskProfileType").val();
	        } else if (ui.value == 1) {
	            $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
			    $("#allocation_type .ui-slider-handle").css({'width':'107px','line-height':'13px','margin-left': '3px'});
				$(".year_to_goal").fadeIn("fast");
				$("#sliding_selectBX").val("products"); 
				if($("#riskProfileType").val()!="-1"){
					window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/" + $("#riskProfileType").val() + "/" + $("#goalYearRangeId").val() + "/46001,46002,46003";
				}else{
					window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/40001/" + $("#goalYearRangeId").val() + "/46001,46002,46003";
				}
				 $(":selectBox-selectBoxIt").each(function(){
    $(this).data('selectBox-selectBoxIt').refresh();
     });
	        	
			}
		
		});
	
	var selectBox = $("#riskProfileType").selectBoxIt().data('selectBox-selectBoxIt');			    
    <c:choose>
    	<c:when test="${not empty riskProfileId}">
    		selectBox.selectOption('${riskProfileId}');
    	</c:when>
    	<c:otherwise>
    	selectBox.selectOption('40001');
    	</c:otherwise>
    </c:choose>	
    
	$("select#riskProfileType").bind({
		"change": function(){			
			if($("#sliding_selectBX").val()=="allocation"){
				window.location = window.location.origin + "${pageContext.request.contextPath}/partner/goal/view-bucket-allocation/${partyId}" + "/" + $("#riskProfileType").val();	
			}else{
				window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/" + $("#riskProfileType").val() + "/" + $("#goalYearRangeId").val() + "/" + "/46001,46002,46003";
			}
			 $(":selectBox-selectBoxIt").each(function(){
    $(this).data('selectBox-selectBoxIt').refresh();
     });			
		}
	});
	
	<c:if test="${sliderSelectBx eq 'products'}">
	    
		
	
		var selectBox1 = $("#goalYearRangeId").selectBoxIt().data('selectBox-selectBoxIt');			    
	    selectBox1.selectOption('${goalYearRangeId}');
		 $(":selectBox-selectBoxIt").each(function(){
    $(this).data('selectBox-selectBoxIt').refresh();
     });
	    
	    /* var selectBox2 = $("#asset_class_list").selectBoxIt().data('selectBox-selectBoxIt');			    
	    selectBox2.selectOption('${assetClassId}'); */
		
		$("select#goalYearRangeId").bind({
			"change": function(){			
				window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/" + $("#riskProfileType").val() + "/" + $("#goalYearRangeId").val() + "/" + "/46001,46002,46003";
			}
		});
		
		/* $("select#asset_class_list").bind({
			"change": function(){			
				window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/" + $("#riskProfileType").val() + "/" + $("#goalYearRangeId").val() + "/" + "/46001,46002,46003";
			}
		}); */
	
	</c:if>
	
}); 
</script>