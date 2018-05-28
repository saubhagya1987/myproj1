<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>


<title>Goal Plan Recommendation</title>

<style>
#gp_view_bucket_alloc .top_box #allocation_type .ui-slider-handle {
/*     margin-left: 0.2em !important; */
    top: 0.1em !important; border-style: none !important;
    border-width: none !important;
    
}

.ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after.ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after
{margin-left: 0.2em !important;
    top: 0.1em !important; border-style: none !important;
    border-width: none !important;}
/* #gp_view_bucket_alloc .top_box #allocation_type .ui-slider .ui-slider-handle:before,#gp_view_bucket_alloc .top_box #allocation_type .ui-slider .ui-slider-handle:after{
    margin-left: 0.2em !important;
    top: 0.1em !important; border-style: none !important;
    border-width: none !important;
    
} */


#gp_view_bucket_alloc .top_box #allocation_type .ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after{border-width:none !important;}
</style>
<%-- <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/selectboxlt.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/custom.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" />
<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/responsive.css" /> --%>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/toggles.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/my_account_submenu.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.slimscroll.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/selectboxit.js"></script> --%>
<%--  <script src="${pageContext.request.contextPath}/js/diy/plugin/perfect-scrollbar.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.mousewheel.js"></script> --%>
<%--  <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.ui.touch-punch.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.autosize.input.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/diy/common/common.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.validate.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/additional-methods.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/common_modal.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.form.js"></script>   --%>
<%--  <link href="<%=request.getContextPath()%>/css/${sessionScope.userSession.themeName}/${sessionScope.userSession.themeName}.css" rel="stylesheet"> --%>

<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/jquery-ui.css" /> --%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" /> --%>

<%HttpSession hes=request.getSession();%>
<input type="text" name="partyId" id="partyId" value="<%=hes.getAttribute("partyId")%>">

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
/* .common_sliding_radio .ui-slider-handle{top: 2px!important;} */
</style>
</c:if>
<style>
/* #confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; } */
</style>
<script type="text/javascript">
function activateSecurity(){
// 	alert('hiiii----${sessionScope.idList}')
// alert($('#idList').val())
	var controllIds=$('#idList').val().split(',');
	$(controllIds).each(function(){
		//alert(this.replace("[", "").replace("]", ""))
		if(this.replace("[", "").replace("]", "").replace(" ", "")!='')
		$('.'+this.replace("[", "").replace("]", "").replace(" ", "")).remove();	
	});
}
$(document).ready(function() {
	activateSecurity();
	/* $("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	}); */
	
	
    /* $("#invalidAgeDialog").dialog();
    $(document).on("dialogopen", "#invalidAgeDialog", function(event, ui) {
		setTimeout("$('#invalidAgeDialog').dialog('close')",3000);
	}); */
    
    <c:if test="${not empty success}">
    <c:choose>
	    <c:when test="${fn:contains(success, 'success.')}">
	    <spring:message code="${success}" var="success"/>
	    <c:if test="${fn:contains(success, '_')}">
	    <c:set var="success" value="${fn:replace(success, '_', goalName)}" />
	    <c:set var="success" value="${fn:toUpperCase(fn:substring(success, 0, 1))}${fn:substring(success, 1,fn:length(success))}" />
	    </c:if>
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {				
				$(".modal-body").html("<spring:message code="${success}" />");
				$(".btn-success1").html("OK");
				$(".btn-success1").on('click',function(){
					closeDialog();
				});		
				$(".btn-danger1").hide();
				$('#confirmDialog').modal('show');
				
				$("#hitCount").val("1");
			}
		</c:when>
		<c:otherwise>
		var hitCnt = $("#hitCount").val();
		if(hitCnt == '0') {
			$(".modal-body").html("<spring:message code="${success}" />");
			$(".btn-success1").html("OK");
			$(".btn-success1").on('click',function(){
				closeDialog();
			});		
			$(".btn-danger1").hide();
			$('#confirmDialog').modal('show');
			$("#hitCount").val("1");
		}
		</c:otherwise>
	</c:choose>
	</c:if>
	 	
	<c:if test="${not empty error}">
    <c:choose>
	    <c:when test="${fn:contains(error, 'error.')}">
	    <c:if test="${fn:contains(error, '_')}">
	    <c:set var="error" value="${fn:replace(error, '_', goalName)}" />
	    <c:set var="error" value="${fn:toUpperCase(fn:substring(error, 0, 1))}${fn:substring(error, 1,fn:length(error))}" />
	    </c:if>
	    <spring:message code="${error}" var="error"/>
	    <c:set var="error" value="${fn:replace(error, '_', goalName)}" />
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {
				$(".modal-body").html("<spring:message code="${error}" />");
				$(".btn-success1").html("OK");
				$(".btn-success1").on('click',function(){
					closeDialog();
				});		
				$(".btn-danger1").hide();
				$('#confirmDialog').modal('show');
				$("#hitCount").val("1");
			}
		</c:when>
		<c:otherwise>
		var hitCnt = $("#hitCount").val();
		if(hitCnt == '0') {
			$(".modal-body").html("<spring:message code="${error}" />");
			$(".btn-success1").html("OK");
			$(".btn-success1").on('click',function(){
				closeDialog();
			});		
			$(".btn-danger1").hide();
			$('#confirmDialog').modal('show');
			$("#hitCount").val("1");
		}
		</c:otherwise>
	</c:choose>
	</c:if>
	
	// allow only alfa key typping
	$('.Alfa').on('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if ((charCode >= 65 && charCode <= 90) || (charCode >= 95 && charCode <= 122) )
	    	return true;
	    return false;
	});
	
	// allow only numeric key and . typping
	$('.Number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
});

function uploadDocument(partyId,url){
	var finalUrl = "?partyId="+partyId+"&url="+url;
	window.location.replace('${pageContext.request.contextPath}/partner/addDocument'+finalUrl);
}

function invalidAgeMessage()
{
	/* $("#invalidAgeDialog").html("Please Enter Valid Birth Date");
	$( "#invalidAgeDialog").dialog( "open" ); */
	
	$(".modal-body").html("Please Enter Valid Birth Date");
	$(".btn-success1").html("OK");
	$(".btn-success1").on('click',function(){
		closeDialog();
	});		
	$(".btn-danger1").hide();
	$('#confirmDialog').modal('show');
}
function calculateAge(){
	var bDate=document.getElementById("birth_date3"); 
	var dp1=bDate.value.split("/").reverse().join("/");
	var d1=new Date(dp1);
	var d2=new Date();
    var t1 = d1.getTime();
    var t2=d2.getTime();
	var age=parseInt((t2-t1)/(24*3600*1000));
	age=age/365;
	if(age<18 || age>100){
		invalidAgeMessage();
		$("#birth_date3").val("");
		return false;
	}

}
	function validatePAN(id){
		var value = $('#'+id).val();
		if(!(/^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value)))
		{
			/* $("#successDialog").html("Please enter valid PAN.");
			$( "#successDialog").dialog( "open" ); */
			$(".modal-body").html("Please enter valid PAN.");
			$(".btn-success1").html("OK");
			$(".btn-success1").on('click',function(){
				closeDialog();
			});		
			$(".btn-danger1").hide();
			$('#confirmDialog').modal('show');
		}else {
			$("#frmParterProfile").ajaxSubmit({
				url: "${pageContext.request.contextPath}/partner/getValidPanNo",
				type : "GET",
				data : {'panNo' : $("#"+id).val()},
				 success: function(msg){
					 if( msg == 'error' ){
						 /* $("#successDialog").html("Pan Number Already Exists.");
						 $( "#successDialog").dialog( "open" ); */
						 $(".modal-body").html("Pan Number Already Exists.");
							$(".btn-success1").html("OK");
							$(".btn-success1").on('click',function(){
								closeDialog();
							});		
							$(".btn-danger1").hide();
							$('#confirmDialog').modal('show');
						 $("#panNumber").val("");
					 }
				 }
			});
		}
	}
</script>
<script>
$(document).ready(function(){
     
	//$("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
      $('.scrollable_data').slimScroll();

	   createSlider('#allocation_type',1,2,1,'#type_count');
	   <c:choose>
		<c:when test="${sliderSelectBx eq 'products'}">
		   	$( "#allocation_type" ).slider( "value", 1 );
	        $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
		    $("#allocation_type .ui-slider-handle").css({'width':'113px','line-height':'13px','margin-left': '3px','top': '-3px'});
		    //$(".year_to_goal").fadeIn("slow"); 
		    $(".year_to_goal").removeClass("hide"); 
			$("#sliding_selectBX").val("products");
	   	</c:when>
	   	<c:otherwise>
		   	$( "#allocation_type" ).slider( "value", 2 );
		   	$(".year_to_goal").addClass("hide"); 
		   	$("#allocation_type .ui-slider-handle").text("Allocation %");
		    $("#allocation_type .ui-slider-handle").css({'width':'81px','line-height':'25px'});
		    $("#allocation_type .ui-slider-handle").css("margin-left", "-87px");
		    $("#sliding_selectBX").val("allocation");
	   	</c:otherwise>
	   </c:choose>

}); 
</script>
<jsp:include page="header.jsp"></jsp:include>

<!-- <div class="container-head">
		<div class="col-md-12" style="text-align: right;" ><span style="float:left;">Partner Setup </span></div >
    </div> -->
    
<div class="container">
<input type="hidden" id="idList" value="${sessionScope.idList}"/>
	
    <div class="container-body " style="padding:5px;">
	   
	   
    </div>
	<div class="container-body">
<c:set var="tempAssetClassId" value="0"/>
<c:set var="tempPorductTypeId" value="0"/>
<c:set var="tempCategoryId" value="0"/>
<section class="main">     
    <!-- Common_content Starts-->
    <section class="content common_content">
      <%-- <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
      <!-- Common_in_contnet starts-->
      <div class="clr"></div>	
      <section class="in_content common_in_content clearfix" id="gp_view_bucket_alloc">
      
      <div class="space-32 .visible-xs-* hidden-md hidden-sm hidden-lg"></div>    <div class="space-12 .visible-xs-* hidden-md hidden-sm hidden-lg"></div>    
      
        <div class="top_box clearfix">
          <div class="fl alloc_partnet"><div id="allocation_type" class="common_sliding_radio">
          <span class="lbl_first lbl">Product Recommendations</span> <span class="lbl_second lbl">Allocation %</span>  
		 </div>
		  <input type="text" id="sliding_selectBX" class="range_counter hide-elem" value="allocation"> 
		   </div>
          <div class="fl"><h2 class="fl heading">Risk Profile</h2>
          
          <select class="col-sm-6 col-xs-12" id="riskProfileType" data-placeholder="">
            <option value="40001">Conservative</option>
           	<option value="40002">Balanced</option>
           	<option value="40003">Aggressive</option>
           	<c:if test="${not (sliderSelectBx eq 'products')}">
           	<option value="-1">All</option>
           	</c:if>           	
          </select>
                
          <%-- <select class="fl" id="riskProfileType">
           	<option value="40001">Conservative</option>
           	<option value="40002">Balanced</option>
           	<option value="40003">Aggressive</option>
           	<c:if test="${not (sliderSelectBx eq 'products')}">
           		<option value="-1">All</option>
           	</c:if>           	
          </select> --%>
          
          </div>
          <div class="fl year_to_goal "><h2 class="fl heading">Year to Goal</h2>
          <!-- <select class="fl" id="goalYearRangeId">
            <option value="62009">0-3 Years</option>
            <option value="62010">3-5 Years</option>
            <option value="62011">5-7 Years</option>
            <option value="62012">7-9 Years</option>
            <option value="62013">More than 9 Years</option>
          </select> -->
          
           <select class="col-sm-6 col-xs-12" id="goalYearRangeId" data-placeholder="">
            <option value="62009">0-3 Years</option>
            <option value="62010">3-5 Years</option>
            <option value="62011">5-7 Years</option>
            <option value="62012">7-9 Years</option>
            <option value="62013">More than 9 Years</option>
          </select>
          
          </div>
          
          <%-- <a class="back fr" href="${pageContext.request.contextPath}/partner/recommendation">BACK</a> --%>
          
          <a href="${pageContext.request.contextPath}/partner/recommendation"><button class="btn btn-sm btn-warning pull-right set_default">
												<i class="ace-icon fa icon-back bigger-110"></i>
												<span class="bigger-110 no-text-shadow">Back</span>
											</button></a>
											
          <c:if test="${sliderSelectBx eq 'products'}">
<!--           <a class="edit fr saveGoalPlanLink" style="cursor:pointer;">Edit</a> -->
          
          <button class="btn btn-sm btn-warning pull-right set_default edit1">
												<i class="ace-icon fa icon-back bigger-110"></i>
												<span class="bigger-110 no-text-shadow ">Edit</span>
											</button>
          </c:if>
          <a class="set_default_btn fr hide dyanmic_buttons" href="#">Set Default</a>
          <a class="cancel fr hide dyanmic_buttons" href="#">Cancel</a>
          <a class="save fr hide dyanmic_buttons" href="#">Save</a>
           </div>
      <!-- advive adssumption ends-->
      <c:choose>
      	<c:when test="${sliderSelectBx eq 'products'}">
      		<div class="tabular_data product_allocaton">
		           <table width="100%" class="sec_col pull-left clearfix">
  <tbody>
  <tr>
    <td class="second theme_background">Asset Class</td>
    <td class="third theme_background">Product Type</td>
    <td class="fourth theme_background">Product Category</td>
    <td class="fifth theme_background">Product</td>
  </tr>
</tbody></table>
		          <c:forEach items="${adviceRecommendationsList}" var="adviceRecommendation">
		          	<table width="100%" class="table_content pull-left clearfix">
  					<tbody><tr>	            
			            <c:choose>
			            	<c:when test="${not (adviceRecommendation.assetClassId eq tempAssetClassId)}">
			            		<c:set var="tempAssetClassId" value="${adviceRecommendation.assetClassId}"/>
			            		 <td class="second">${adviceRecommendation.assetName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentAssetClass}" />%</span>)</td>
			            	</c:when>
			            	<c:otherwise>
			            		 <td class="second">&nbsp;</td>
			            	</c:otherwise>
			            </c:choose>
			            <c:choose>
			            	<c:when test="${not (adviceRecommendation.productTypeId eq tempPorductTypeId)}">
			            		<c:set var="tempPorductTypeId" value="${adviceRecommendation.productTypeId}"/>
			            		 <td class="third">${adviceRecommendation.productTypeName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentProductType}" />%</span>)</td>
			            	</c:when>
			            	<c:otherwise>
			            		 <td class="third">&nbsp;</td>
			            	</c:otherwise>
			            </c:choose>
			            <c:choose>
			            	<c:when test="${not (adviceRecommendation.categoryId eq tempCategoryId)}">
			            		<c:set var="tempCategoryId" value="${adviceRecommendation.categoryId}"/>
			            		 <td class="fourth">${adviceRecommendation.categoryName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentCategoryId}" />%</span>)</td>	
			            	</c:when>
			            	<c:otherwise>
			            		 <td class="fourth">&nbsp;</td>
			            	</c:otherwise>
			            </c:choose>			            
			             <td class="fifth">
			            	<c:choose>
	            				<c:when test="${not empty adviceRecommendation.productName}">			            
				            		${adviceRecommendation.productName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentProductId}" />%</span>)
				            	</c:when>
				            	<c:otherwise>
				            		&nbsp;
				            	</c:otherwise>
			            	</c:choose>
			            </td>			        
			        </tr>
			        </tbody>
			        </table>
		          </c:forEach>		          		    
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
		       		
			          
			          <table width="100%" class="tg pull-left clearfix">
  <tbody><tr>
    <td rowspan="2" class="primary_head first theme_background goal_years">Years To Goal</td>
    <td colspan="3" class="primary_head asset_c_allocat theme_background">Asset Class Allocation</td>
  </tr>
  <tr>
    <td class="second theme_background">
	<div class="title">Equity</div>
		<div class="pull-left conserative first_sub">C</div>
	    <div class="pull-left balance second_sub">B</div>
		<div class="pull-left aggressive third_sub">A</div></td>
    <td class="third theme_background">
	<div class="title">Debts</div>
		<div class="pull-left conserative first_sub">C</div>
	    <div class="pull-left balance second_sub">B</div>
		<div class="pull-left aggressive third_sub">A</div>
		</td>
    <td class="fourth theme_background">
	<div class="title">Gold</div>
		<div class="pull-left conserative first_sub">C</div>
	    <div class="pull-left balance second_sub">B</div>
		<div class="pull-left aggressive third_sub">A</div>
	</td>
    </tr>
</tbody></table>
			          
			          
			          <table width="100%" class="table_content pull-left clearfix">
  <tbody><tr>
    <td class="first"><div class="value">0-3 Years</div></td>
    
     <td class="second">
     <div class="fl first_sub">${zeroToThreeEQConst}%</div>
			            	<div class="fl second_sub">${zeroToThreeEQBal}%</div>
			            	<div class="fl third_sub">${zeroToThreeEQAgg}%</div>
			            	<div class="clr"></div></td>
    <td class="third">
    <div class="fl first_sub">${zeroToThreeDBTConst}%</div>
							<div class="fl second_sub">${zeroToThreeDBTBal}%</div>
							<div class="fl third_sub">${zeroToThreeDBTAgg}%</div></td>
    <td class="fourth">
    <div class="fl first_sub">${zeroToThreeGLDConst}%</div>
							<div class="fl second_sub">${zeroToThreeGLDBal}%</div>
							<div class="fl third_sub">${zeroToThreeGLDAgg }%</div></td>

  </tr>
</tbody></table>




<table width="100%" class="table_content pull-left clearfix">
  <tbody><tr>
    <td class="first"> <div class="value">3-5 years</div></td>
    
     <td class="second">
	<div class="fl first_sub">${threeToFiveEQConst}%</div>
	<div class="fl second_sub">${threeToFiveEQBal}%</div>
	<div class="fl third_sub">${threeToFiveEQAgg }%</div>
							
							
			            	</td>
    <td class="third">
   <div class="fl first_sub">${threeToFiveDBTConst}%</div>
							<div class="fl second_sub">${threeToFiveDBTBal}%</div>
							<div class="fl third_sub">${threeToFiveDBTAgg}%</div>
				</td>
				
    <td class="fourth">
   <div class="fl first_sub">${threeToFiveGLDConst}%</div>
							<div class="fl second_sub">${threeToFiveGLDBal }%</div>
							<div class="fl third_sub">${threeToFiveGLDAgg }%</div>
							</td>

  </tr>
</tbody></table>



<table width="100%" class="table_content pull-left clearfix">
  <tbody><tr>
    <td class="first"> <div class="value">5-7 years</div></td>
    
     <td class="second">
	<div class="fl first_sub">${fiveToSevenEQConst}%</div>
							<div class="fl second_sub">${fiveToSevenEQBal }%</div>
							<div class="fl third_sub">${fiveToSevenEQAgg }%</div>
							
							
			            	</td>
    <td class="third">
  <div class="fl first_sub">${fiveToSevenDBTConst}%</div>
							<div class="fl second_sub">${fiveToSevenDBTBal }%</div>
							<div class="fl third_sub">${fiveToSevenDBTAgg }%</div>
				</td>
				
    <td class="fourth">
   <div class="fl first_sub">${fiveToSevenGLDConst}%</div>
							<div class="fl second_sub">${fiveToSevenGLDBal }%</div>
							<div class="fl third_sub">${fiveToSevenGLDAgg }%</div>
							</td>

  </tr>
</tbody></table>



<table width="100%" class="table_content pull-left clearfix">
  <tbody><tr>
    <td class="first"> <div class="value">7-9 years</div></td>
    
     <td class="second">
	<div class="fl first_sub">${sevenToNineEQConst}%</div>
							<div class="fl second_sub">${sevenToNineEQBal }%</div>
							<div class="fl third_sub">${sevenToNineEQAgg }%</div>
							
							
			            	</td>
    <td class="third">
  <div class="fl first_sub">${sevenToNineDBTConst}%</div>
							<div class="fl second_sub">${sevenToNineDBTBal}%</div>
							<div class="fl third_sub">${sevenToNineDBTAgg }%</div>
				</td>
				
    <td class="fourth">
  <div class="fl first_sub">${sevenToNineGLDConst }%</div>
							<div class="fl second_sub">${sevenToNineGLDBal }%</div>
							<div class="fl third_sub">${sevenToNineGLDAgg }%</div>
							</td>

  </tr>
</tbody></table>


<table width="100%" class="table_content pull-left clearfix">
  <tbody><tr>
    <td class="first"> <div class="value">More than 9 years</div></td>
    
     <td class="second">
	<div class="fl first_sub">${nineAndMoreEQConst }%</div>
							<div class="fl second_sub">${nineAndMoreEQBal }%</div>
							<div class="fl third_sub">${nineAndMoreEQAgg }%</div>
							
							
			            	</td>
    <td class="third">
  <div class="fl first_sub">${nineAndMoreDBTConst }%</div>
							<div class="fl second_sub">${nineAndMoreDBTBal}%</div>
							<div class="fl third_sub">${nineAndMoreDBTAgg }%</div>
				</td>
				
    <td class="fourth">
 <div class="fl first_sub">${nineAndMoreGLDConst }%</div>
							<div class="fl second_sub">${nineAndMoreGLDBal }%</div>
							<div class="fl third_sub">${nineAndMoreGLDAgg }%</div>
							</td>

  </tr>
</tbody></table>


			       
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
		       
		       <table class="tg pull-left clearfix" width="100%">
  <tr>
    <td class="primary_head first theme_background goal_years" rowspan="2">Years To Goal</td>
    <td class="primary_head asset_c_allocat theme_background" colspan="4">Asset Class Allocation</td>
  </tr>
  <tr>
    <td class="second theme_background">Equity</td>
    <td class="third theme_background">Debts</td>
    <td class="fourth theme_background">Gold</td>
    <td class="fifth theme_background">Return(%)</td>
  </tr>
</table>
		       

		          	
		          	<table class="table_content pull-left clearfix" width="100%">
  <tr>
    <td class="first"><div class="value">0-3 Years</div></td>
    
     <td class="second"><c:out value="${zeroToThreeEQ}"></c:out>%</td>
    <td class="third"><c:out value="${zeroToThreeDBT}"></c:out>%</td>
    <td class="fourth"><c:out value="${zeroToThreeGLD}"></c:out>%</td>
    <td class="fifth"><c:set var="returns" value="${(((zeroToThreeEQ * equityReturns) + (zeroToThreeDBT * debtReturns) + (zeroToThreeGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              	<c:when test="${returns eq 0}">
			              		<div class="value">0.00%</div>
			              	</c:when>
			              	<c:otherwise>
			              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              	</c:otherwise>
			              </c:choose></td>
  </tr>
</table>

<table class="table_content pull-left clearfix" width="100%">
  <tr>
    <td class="first"><div class="value">3-5 Years</div></td>
    
     <td class="second"><c:out value="${threeToFiveEQ}"></c:out>%</td>
    <td class="third"><c:out value="${threeToFiveBT}"></c:out>%</td>
    <td class="fourth"><c:out value="${threeToFiveGLD}"></c:out>%</td>
    <td class="fifth"><c:set var="returns" value="${(((threeToFiveEQ * equityReturns) + (threeToFiveBT * debtReturns) + (threeToFiveGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              	<c:when test="${returns eq 0}">
			              		<div class="value">0.00%</div>
			              	</c:when>
			              	<c:otherwise>
			              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              	</c:otherwise>
			              </c:choose></td>
  </tr>
</table>

<table class="table_content pull-left clearfix" width="100%">
  <tr>
    <td class="first"><div class="value">5-7 Years</div></td>
    
     <td class="second"><c:out value="${fiveToSevenEQ}"></c:out>%</td>
    <td class="third"><c:out value="${fiveToSevenDBT}"></c:out>%</td>
    <td class="fourth"><c:out value="${fiveToSevenGLD}"></c:out>%</td>
    <td class="fifth"><c:set var="returns" value="${(((fiveToSevenEQ * equityReturns) + (fiveToSevenDBT * debtReturns) + (fiveToSevenGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              	<c:when test="${returns eq 0}">
			              		<div class="value">0.00%</div>	
			              	</c:when>
			              	<c:otherwise>
			              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              	</c:otherwise>
			              </c:choose></td>
  </tr>
</table>

<table class="table_content pull-left clearfix" width="100%">
  <tr>
    <td class="first"><div class="value">7-9 Years</div></td>
    
     <td class="second"><c:out value="${sevenToNineEQ}"></c:out>%</td>
    <td class="third"><c:out value="${sevenToNineDBT}"></c:out>%</td>
    <td class="fourth"><c:out value="${sevenToNineGLD}"></c:out>%</td>
    <td class="fifth"><c:set var="returns" value="${(((sevenToNineEQ * equityReturns) + (sevenToNineDBT * debtReturns) + (sevenToNineGLD * goldReturns)) / (100 * 100) ) * 100 }" />
			              <c:choose>
			              <c:when test="${returns eq 0}">
			              	<div class="value">0.00%</div>
			              </c:when>
			              <c:otherwise>
			              	<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
			              </c:otherwise>
			              </c:choose></td>
  </tr>
</table>

<table class="table_content pull-left clearfix" width="100%">
  <tr>
    <td class="first"><div class="value">More than 9 Years</div></td>
    
     <td class="second"><c:out value="${nineAndMoreEQ}"></c:out>%</td>
    <td class="third"><c:out value="${nineAndMoreDBT}"></c:out>%</td>
    <td class="fourth"><c:out value="${nineAndMoreGLD}"></c:out>%</td>
    <td class="fifth"> <c:set var="returns" value="${(((nineAndMoreEQ * equityReturns) + (nineAndMoreDBT * debtReturns) + (nineAndMoreGLD * goldReturns)) / (100 * 100) ) * 100 }"/>
		              <c:choose>
		              	<c:when test="${returns eq 0}">
			             	<div class="value">0.00%</div>
			          	</c:when>
			          	<c:otherwise>
		              		<div class="value"><fmt:formatNumber type="number" pattern="#.00" maxFractionDigits="2" value="${returns}" />%</div>
		              	</c:otherwise>
		              </c:choose></td>
  </tr>
</table>
</div>
		       
	      </c:otherwise>
	      </c:choose>
      	</c:otherwise>
      </c:choose>
      
      </section>
      <!-- Common_in_contnet ends --> 
      
    </section>
    <!-- Common_content Ends--> 
    <div class="modal fade" id="confirmDialog" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    		<div class="modal-dialog">
       		<div class="modal-content">
            <div class="modal-body">
                <label> You already have ${foundGoal} ${goalTypeString}/s defined. Do you want to modify existing goal ?</label>
             </div>
            <div class="modal-footer">
             <button  class="btn btn-sm btn-success1 btn-primary"><i class="ace-icon fa fa-check bigger-110"></i>Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-sm btn-danger1 btn-primary"><i class="ace-icon fa fa-close bigger-110"></i>No</button>
		             </div>
    </div>
  </div>
</div>
  </section>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
  <!-- Main ends--> 
<script>
$(document).ready(function(){     
	//$("select").selectBoxIt();
	
	$(".edit1").click(function(){
		window.location.href="${pageContext.request.contextPath}/partner/editGoalBucketAllocation/"+$("#goalYearRangeId").val()+"/"+$("#riskProfileType").val();
		//alert("edit called");
	});
	
	$( "#allocation_type" ).on("slide", function( event, ui ) {
		$("#allocation_type .ui-slider-handle").empty();
	        if (ui.value == 2) {
	            $("#allocation_type .ui-slider-handle").css("margin-left", "-87px");
	            $("#allocation_type .ui-slider-handle").css({'width':'81px','line-height':'25px'});
				//$(".year_to_goal").fadeOut("fast");
				$(".edit").fadeOut("fast");
	            $("#allocation_type .ui-slider-handle").text("Allocation %");
	            $("#sliding_selectBX").val("allocation"); 
	            window.location.href="${pageContext.request.contextPath}/partner/goal/view-bucket-allocation/${partyId}" + "/" + $("#riskProfileType").val();
	        } else if (ui.value == 1) {
	            $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
			    $("#allocation_type .ui-slider-handle").css({'width':'113px','line-height':'13px','margin-left': '3px','top': '-3px'});
				//$(".year_to_goal").fadeIn("fast");
				$("#sliding_selectBX").val("products"); 
				if($("#riskProfileType").val()!="-1"){
					window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/" + $("#riskProfileType").val() + "/" + $("#goalYearRangeId").val() + "/46001,46002,46003";
				}else{
					window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/40001/" + $("#goalYearRangeId").val() + "/46001,46002,46003";
				}
			}
		
		});
	
	//var selectBox = $("#riskProfileType").selectBoxIt().data('selectBox-selectBoxIt');			    
    <c:choose>
    	<c:when test="${not empty riskProfileId}">
    		//selectBox.selectOption('${riskProfileId}');
    		$("#riskProfileType").val('${riskProfileId}');
    	</c:when>
    	<c:otherwise>
    	$("#riskProfileType").val('40001');
    	</c:otherwise>
    </c:choose>	
    
	$("#riskProfileType").bind({
		"change": function(){			
			if($("#sliding_selectBX").val()=="allocation"){
				window.location = window.location.origin + "${pageContext.request.contextPath}/partner/goal/view-bucket-allocation/${partyId}" + "/" + $("#riskProfileType").val();	
			}else{
				window.location.href="${pageContext.request.contextPath}/partner/getProductRecommendationList/${partyId}" + "/" + $("#riskProfileType").val() + "/" + $("#goalYearRangeId").val() + "/" + "/46001,46002,46003";
			}			
		}
	});
	
	<c:if test="${sliderSelectBx eq 'products'}">
	
		//var selectBox1 = $("#goalYearRangeId").selectBoxIt().data('selectBox-selectBoxIt');			    
	    //selectBox1.selectOption('${goalYearRangeId}');
	    $("#goalYearRangeId").val('${goalYearRangeId}');
	    /* var selectBox2 = $("#asset_class_list").selectBoxIt().data('selectBox-selectBoxIt');			    
	    selectBox2.selectOption('${assetClassId}'); */
		
		$("#goalYearRangeId").bind({
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