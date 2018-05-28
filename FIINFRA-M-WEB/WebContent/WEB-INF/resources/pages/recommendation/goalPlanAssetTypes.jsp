<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<title>Goal Plan Asset Types</title>
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css">
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<!--<script src="resources/js/jquery.ddslick.js"></script>-->
<script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script> --%>

<style>
.common_header .page_header .heading .sub_head_txt {
font-size: 15px;
}
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>

<script>
var flag=0;
var sliderId="";
var pieces=[];

function createSliderAndSetValue1(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,value) {

    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        value: value,
        slide: function (event, ui) {
        	if(flag==0){
        		var pieces=ctrlName.split("_");
            		sliderId=""+pieces[1]+"_"+pieces[2];
            	flag=1;
        	} 
           
        	$(ctrlTextBox).val(ui.value);
			
        },
        change: function(event,ui){
        	if(flag==1){        		
        		flag=0;
        		var unallocatedPercent=100;
        		pieces=ctrlName.split("_");
        		var totalRows=$("#dynamicId_"+pieces[1]).val();
        		var totalValue=0;
        		for(var i=1;i<=totalRows;i++){        			
        			if($("#allocationPercent_"+pieces[1]+"_"+i).val()){
        				totalValue=parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val())+totalValue;
            			if(sliderId!=(pieces[1]+"_"+i)){
            				unallocatedPercent=unallocatedPercent-parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val());
            			}	
        			}        			
        		}
            	if(totalValue>100){
            		$("#slider_"+sliderId).slider('value',unallocatedPercent);
            		$("#allocationPercent_"+sliderId).val(unallocatedPercent);
            		displayMsg("<spring:message code='percentLT100' />");
            		return false;
            	}
        	}
        }
        
    });
    $(ctrlTextBox).val($(ctrlName).slider("value"));

    $(ctrlTextBox).keyup(function () { 
        $(ctrlName).slider('value', $(ctrlTextBox).val());
    });
    
	
}

$(function() {
    $( "#Emergency_Planning_Tab" ).accordion({ animate: 200 });
  });
  
</script>

<!-- Custom Selectbox starts -->

<c:if test="${productTypeCount eq 1}">
<style>
#Emergency_Planning_in.goal_plan_asset_types #Emergency_Planning_Tab.product_types_accordian .EP_cnt{
	height: 324px !important;
}
#confirmDialog {
	display: block;
	height: 130px;
	display: none;
	width: 355px;
	box-shadow: 0 0 15px 1px #757575;
}
</style>
</c:if>

<script>

$(document).ready(function(){
	
	
	$("#successDialog").dialog();	
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});       
	
	$("#confirmDialog .close").click(function(){
    $(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
	 });
	
	<c:if test="${not empty success}">
	  $("#successDialog").html("<spring:message code="${success}" />");
	  $( "#successDialog").dialog( "open" );
	</c:if>
	
	<c:if test="${not empty error}">
		$("#successDialog").html("<spring:message code="${error}" />");
		$( "#successDialog").dialog( "open" );
	</c:if>
  
	<c:forEach items="${productCategoryMap}" var="productCategory" varStatus="counter">
	     
		$(".Select_${productCategory.key}").selectBoxIt({
	     	populate: {"data": ${productCategory.value}},
	     }); 	
		
		$( "body" ).on( "change", ".Select_${productCategory.key}" , function(){
			if(this.value=="-1" || this.value==null){
				var nextDropDown = this.id.split('_');
				$("#slider_"+nextDropDown[1]).slider("value", "0");
				$("#allocationPercent_"+nextDropDown[1]).val("0");
			}
		});
	     
		var index = $("#dynamicId_${productCategory.key}").val();
		
		//Add Button Starts for equity
	  $(".EP_cnt").on("click", "#add_${productCategory.key}", function() {
		   $(this).fadeOut();
		   
		   index++;
		  //count++;
		  $("#dynamicId_${productCategory.key}").val(index);
		  var productTypeId=$("#finalproductTypeIds").val();
		  var pieces=productTypeId.split(",");
		  
		$(this).prev(".close").fadeIn();
		
		$(this).parent().closest("ul").after("<ul class='reset clearfix dynamic_ul row'><li class='first ep_one'><div class='ep_left_label'><span class='common_custom_checkbox'></span><input type='checkbox' class='default_checkbox' id='chkbox_${productCategory.key}_" + index + "' value='0'></div></li><li class='second ep_two'><select class='Select_"+index+"' id='product_type_${productCategory.key}_"+ index +"'></select></li><li class='third ep_three'><div class='ep_slider_bx'><div class='EP'><div class='range_parent'><div class='scale clearfix'><div class='scale_range'><span class='low extrem'>0%</span><span class='high extrem'>100%</span></div><div id='slider_${productCategory.key}_"+ index +"'></div></div><div class='counter_parent'><input type='text' id='allocationPercent_${productCategory.key}_"+ index +"' class='range_counter' readonly='readonly'><span class='unit'>%</span></div></div></div><div class='clr'></div></div></li><li class='fourth ep_four'><div id='AssetType' class='icon_box'><div class='icon clearfix'><a id='${productCategory.key}_product_"+ index +"' href='#' onclick='submitForm(0,0,0,0);'><div class='category'></div></a></div></div></li><li class='fifth ep_five'><span class='common_input at-comment'>(<span class='value'>0</span>)</span><div class='close'>x</div></li></ul>");//<div class='add' id='add_${productCategory.key}'>+</div>
		   //Preferred Product Count Written
		  $(".Select_"+index).selectBoxIt({
			  populate: {"data": ${productCategory.value}},
		  });
		   
		  $( "body" ).on( "change", ".Select_"+index , function(){
			 	 if(this.value=="-1" || this.value==null){
					var nextDropDown = this.id.split('_');
					$("#slider_"+nextDropDown[2]+"_"+nextDropDown[3]).slider("value", "0");
					$("#allocationPercent_"+nextDropDown[2]+"_"+nextDropDown[3]).val("0");
				}else{
					checkAvailability(""+this.id);
				}
			});
		   
		  createSliderAndSetValue1("#slider_${productCategory.key}_"+index,0,100,1,"#allocationPercent_${productCategory.key}_"+index,0);
		 		  
		  $('.EP_cnt').perfectScrollbar('update');
		 
		  
		});
		
	</c:forEach>
     
	 // Calls the selectBoxIt method on your HTML select box
	 

// Close Button 
$(".EP_cnt").on("click", ".close", function() {
	
	$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
	$(this).parent().closest("ul").prev("ul").addClass("moved_down");
	var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
	
	
	$(this).parent().closest("ul").remove();
    $("ul:last-of-type").find(".add").fadeIn(); 
	// removing record

// Preferred Product Ends

	
	});	
	
	var element="";
	 
	function performDelete(){
		var deleteFlag=1;
		closeDialog();
			var productTypeCount="${productTypeCount}";
			var fpRecommendIds=[];
			for(var i=1;i<=productTypeCount;i++){			 
				var totalRows=$("#categoryCountInitial_"+i).val();
				var tempFlag=0;
				for(var j=1;j<=totalRows;j++){
					if($("#chkbox_"+ i +"_"+ j).is(":checked")){
						tempFlag=1+tempFlag;
						fpRecommendIds.push($("#chkbox_"+ i +"_"+ j).val());
					} 
				}
				if(tempFlag>=totalRows){
					deleteFlag=0;
				}
			}
			
			$("#fpRecommendId").val(fpRecommendIds);			
			if(deleteFlag==1){
				$("#goalPlanAssetTypeform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/deleteRecommendationForProductCategory",
					type : "GET",
					data : {'fpRecommendId' : $("#fpRecommendId").val()},
					 success: function(msg){
						 if(msg=="success"){
							 element.remove();		
							 $('.EP_cnt ul:last-of-type').find(".ep_five .at-comment").after("<div class='add'>+</div>");
							 $(".EP_cnt ul:last-of-type").find(".add").fadeIn("slow");
							 $("#successDialog").html("Records deleted successfully");
							 $( "#successDialog").dialog( "open" );
						 }else{
							 $("#successDialog").html("<spring:message code='error.deleteRecord' />");
							 $( "#successDialog").dialog( "open" );							
							 return false;
						 }
					 }
				});	 
			}else{
				displayMsg("<spring:message code='deleteDataGT0' />");
				return false;
			} 												
			
	}
	
	$(".EP_cnt").on("click", ".delete", function() {
			
		element=$(this).closest(".AT_cnt_title").nextAll("ul").find(".white_checkbox_checkbox_checked").closest("ul");
		$(".aa_up").html("<spring:message code='deleteRecord' />");
		$(".aa_yes").click(function(){performDelete()});
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
		
	});
 
});

function displayMsg(msg){
	$("#successDialog").html(msg);
	$( "#successDialog").dialog( "open" );
}
</script>
<!-- Custom Selectbox Ends -->

<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
  
    $('.common_in_content').slimScroll();
     $('.EP_cnt').perfectScrollbar();
    $('.Goal_Plan_Asset_Menu_In').perfectScrollbar();

	  // Expected Returns on all existing Investment value Slider
  });

</script>
<!-- custom scroll to "common_in_content" -->

<!--Common Custom checkbox -->
<script>
$(document).ready(function(){
  $("body").on("click",".common_custom_checkbox",function(){
    $(this).toggleClass("white_checkbox_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
});
</script>
<!--Common Custom checkbox ends-->

<!-- Type of emergency faced select starts -->
<script>
$(document).ready(function(){
  $(".icon a").click(function(){
   // $(this).children("#AssetType.icon_box .category").toggleClass("at_applicable");
//	$(this).find(".cross_circle").toggle();
  });
});

 function performReset(){
	 window.location.href="${pageContext.request.contextPath}/partner/goalPlanSetDefault/goalPlanAssetTypes?sectionTypeId=${sectionTypeId}";
 }

	function closeDialog(){
		$(".overlay").fadeOut("slow");
    	$("#confirmDialog").fadeOut("slow");
	}

function setDefaultValues(){	
	if("${recordTypeId}"==14003){
		$(".aa_up").html("<spring:message code='goalPlanning.dataReset' />");
		$(".aa_yes").click(function(){performReset()});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}else{
		displayMsg("<spring:message code='dataAlreadyRestored' />");
	}
}
</script>
<!-- Type of emergency faced select ends -->

</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  
  <section class="main"> 
    <!-- Header Starts-->
    <header class="common_header inner_header">
      <section class="top_header clearfix"> <a href="#" class="setting fr"></a>
		  <div class="logout_pop_up"><a href="#" class="myaccount_btn"><span class="my_acc_icon"> </span> <span class="my_acc_txt"> MY ACCOUNT</span></a> <a href="${pageContext.request.contextPath}/common/logout" class="logout_btn"><span class="my_logout_icon"> </span> <span class="my_logout_txt"> LOGOUT</span></a> </div>
		  <section class="submenu"><!--<img class="submenu_arrow" src="${pageContext.request.contextPath}/resources/images/submenu_arrow.png" height="33" width="46" alt="">-->
		    <div class="menu_section">
		      <ul class="clearfix reset">
		        <li class="fl menu chng_prof"><a href="${pageContext.request.contextPath}/partner/personal/info" class="anch"><span class="icon"></span><span class="txt">Change Profile</span></a></li>
		        <li class="fl menu adv_assum"><a href="${pageContext.request.contextPath}/partner/assumption" class="anch"><span class="icon"></span><span class="txt">Advice Assumptions</span></a></li>
		        <li class="fl menu chang_pass"><a href="${pageContext.request.contextPath}/password/changePassword" class="anch"><span class="icon"></span><span class="txt">Change Password</span></a>
		        </li>
		        <li class="fl menu adv_recomm"><a href="${pageContext.request.contextPath}/partner/recommendation" class="anch"><span class="icon"></span><span class="txt">Advice Recommendations</span></a></li>
                 <li class="fl menu interested_fp"><a href="" class="anch"><span class="icon"></span><span class="txt">Interested FP</span></a></li>
                 <li class="fl menu personalizationLink"><a href="${pageContext.request.contextPath}/partner/personal/info?viewId=8" class="anch personalizationLink"><span class="icon"></span><span class="txt">Personalization</span></a></li>
		      </ul>
		    </div>
		    
<a href="#" class="anchor report_issue"><span class="icon fl"></span><span class="label fr">Report Issue</span></a>
		  </section>
		  <a href="#" class="header_add add2"><img src="${pageContext.request.contextPath}/resources/images/add2.png" /></a> <a href="#" class="header_add add1"><img src="${pageContext.request.contextPath}/resources/images/add1.png" /></a>
		  <div class="fl" id="logo" style="max-height:61px; max-width:140px"><a href="${pageContext.request.contextPath}/partner/dashboard">
		  	<%
		  	String photoPath = null;
		  	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
		  	if(userSession != null){
		  		photoPath = userSession.getLogo();
		  	}
		  	%>
		  	<img src="<%=FiinfraUtility.getImagePath(request, photoPath, "resources/images/temp_logo.png") %>" style="-webkit-transform: scale(0.8,0.5); margin-top: -30px;" alt=""/></a>
		  </div>
		</section>
      <div class="page_header">
        <h1 class="heading clearfix">
          <button class="header_btn" id="default" onclick="setDefaultValues();">Set Default</button> <a href="#" class="allocation"><span class="allocation_txt">PT Alloc.</span> </a>
          <span class="head_txt">Goal Plan : 
          <a href="${pageContext.request.contextPath}/partner/goalPlanning?riskProfileId=${riskProfileId}" style="text-decoration:underline;"><span class="sub_head_txt allCaps"> ${riskType} </span></a> >  
          <a href="${pageContext.request.contextPath}/partner/goalPlanning?riskProfileId=${riskProfileId}" style="text-decoration:underline;"><span class="sub_head_txt allCaps"> ${goalYearRange} </span></a> > 
          <a href="${pageContext.request.contextPath}/partner/goalPlanning?riskProfileId=${riskProfileId}" style="text-decoration:underline;"><span class="sub_head_txt allCaps"> ${assetType} (<span class="dynamic_percntage">${allocationPercent}</span>%) </span></a> > 
          <span class="sub_head_txt allCaps">Product Types</span> </span><span class="heading_icon"><span class="head_icon"><img src="${pageContext.request.contextPath}/resources/images/goal_plan.png" alt="" width="31" height="32" class="rp-margin"/></span></span></h1>
      </div>
    </header>
    <!-- Header Ends--> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
    <script>
$(document).ready(function(){
  $('.wrapper').attr('id', 'Emergency_Planning');
});
</script>
      
      
  <!-- advive adssumption starts--> 
  <c:set var="productTypeId">0</c:set>
  <c:if test="${not empty goalDataList}">
  <div class="Goal_Plan_Asset_Menu">
	  <ul class="clearfix reset Goal_Plan_Asset_Menu_In" >
	  <c:forEach items="${goalDataList}" var="goalData" varStatus="counter">
	  <c:set var="pieces" value="${fn:split(goalData.productTypeName, '_')}"/>
	  <c:choose>
         <c:when test="${not (productTypeId eq goalData.productTypeId)}">
         	<c:set var="productTypeId">${goalData.productTypeId}</c:set>
         	<li class="clearfix">
		      <label class="form_label">${pieces[0]}</label>
		      <div class="range_parent">
		        <div class="scale clearfix">
		          <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span></div>
		          <div id="popup_slider_${counter.count}"></div>
		          <div class="counter_parent_new">
		            <input type="text" id="popupAllocationPercent_${counter.count}" class="range_counter" readonly="readonly"/>
		            <input type="hidden" id="${counter.count}_sliderValue" value="${pieces[1]}"/>
		            <span class="unit">%</span></div>
		        </div>
		      </div>
	    </li>
         </c:when>
      </c:choose>
	  </c:forEach>	
	    <li class="clearfix"> <a class="cancel" >CANCEL</a><a class="save" onclick="submitProductTypeData();">SAVE</a></li>
	  </ul>
	</div>
    <div class="clr"></div>  	
  </c:if>

    <!-- advive adssumption ends--> 			
              
           <c:set var="productTypeId">0</c:set>
           <c:set var="productTypeCountTemp">0</c:set>
           <c:set var="categoryCount">0</c:set>
           <c:set var="adviceIds"></c:set>

	<form method="post" name="goalPlanAssetTypeform" id="goalPlanAssetTypeform" action="<c:url value="/partner/saveGoalPlanAssetTypes"/>">
		
		<input type="hidden" id="finalData" name="finalData" value="0"/>
		<input type="hidden" name="finalproductTypeIds" id="finalproductTypeIds" value="${productTypeIds}"/>
		<input type="hidden" name="productTypeId" id="productTypeId" />
		<input type="hidden" name="recordId" id="recordId" />
		<input type="hidden" name="fpRecommendId" id="fpRecommendId" value="0"/>
		
		<input type="hidden" id="productTypeCount" name="productTypeCount" value="${productTypeCount}"/>
        <input name="passCategoryId" id="passCategoryId" type="hidden" value="0"/>
        <input name="passCategory" id="passCategory" type="hidden" value="0"/>
        
        <input type="hidden" id="allocationPercentAsset" name="allocationPercentAsset" value="${allocationPercent}"/>
        <input type="hidden" id="allocationPercentProductType" name="allocationPercentProductType" value="0"/>
        <input type="hidden" id="allocationPercentCategory" name="allocationPercentCategory" value="0"/>
        
        <input name="goalYearRangeId" id="goalYearRangeId" type="hidden" value="${goalYearRangeId}"/>
        <input name="riskProfileId" id="riskProfileId" type="hidden" value="${riskProfileId}"/>
        <input name="assetClassId" id="assetClassId" type="hidden" value="${assetClassId}"/>
        <input name="recordTypeId" id="recordTypeId" type="hidden" value="${recordTypeId}" />  
        <input type="hidden" id="sectionTypeId" name="sectionTypeId" value="${sectionTypeId}"/>      
        <input type="hidden" value="0" name="actionFlag" id="actionFlag"/>      	
      <section class="in_content clearfix goal_plan_asset_types" id="Emergency_Planning_in">
      <div id="page_loader" style="display:none;"></div>
        <div style="margin:0 20px;">
          <div id="Emergency_Planning_Tab" class="product_types_accordian">           
           <c:forEach items="${goalDataList}" var="goalData" varStatus="counter">
           	<c:choose>
           		<c:when test="${not (productTypeId eq goalData.productTypeId)}">
           			
           			<c:set var="productTypeId">${goalData.productTypeId}</c:set>
           			<c:set var="productTypeCountTemp">${productTypeCountTemp + 1}</c:set>
           			<c:set var="categoryCount">${categoryCount + 1}</c:set>           			
           			
           			<%-- <c:if test="${not (counter.index eq 0)}">
           				<input type="hidden" id="categoryCount_${productTypeCountTemp}" value="${categoryCount}"/>
           				<c:set var="categoryCount">0</c:set>
           			</c:if> --%>
           			<c:set var="pieces" value="${fn:split(goalData.productTypeName, '_')}"/>
           			<h3>${pieces[0]} (${pieces[1]} %)
           			<input type="hidden" name="allocationPercentProductType_${productTypeCountTemp}" value="${goalData.productTypeName}"/>
           			</h3>		            
		            <div class="EP_cnt" id="equity">
		              <div class="AT_cnt_title">
		                <ul class="reset clearfix">
		                  <li class="GP_one"><img class="delete" src="${pageContext.request.contextPath}/resources/images/delete_icon_two.png" alt="" width="22" height="22" align="absbottom"></li>
		                  <li class="GP_two">Product Category</li>
		                  <li class="GP_three">Range</li>
		                  <li class="GP_four">Allocated %</li>
		                  <li class="GP_five">Associated Products</li>
		                </ul>
		              </div>
		            <input type="hidden" id="initialDataDropDown_${productTypeCountTemp}" name="initialDataDropDown_${productTypeCountTemp}" value="0"/>
		      		<input type="hidden" id="finalDataDropDown_${productTypeCountTemp}" name="finalDataDropDown_${productTypeCountTemp}" value="0"/>		      		
		      		<input type="hidden" id="initialDataSlidern_${productTypeCountTemp}" name="initialDataSlidern_${productTypeCountTemp}" value="0"/>
		      		<input type="hidden" id="finalDataSlidern_${productTypeCountTemp}" name="finalDataSlidern_${productTypeCountTemp}" value="0"/>      		      		
		      		<ul class="reset clearfix">
										<li class="ep_one first">
											<div class="ep_left_label">												
												<span class="dummy_custom_checkbox" id="chkboxSpan_${productTypeCountTemp}_${counter.count}"></span><!-- onclick="displayMsg('Record cannot be deleted');" -->
												<input type="checkbox" class="default_checkbox"
													id="chkbox_${productTypeCountTemp}_${counter.count}" value="${goalData.id}"/>
											</div>
										</li>
										<li class="ep_two"><select class="Select_${productTypeCountTemp}"
											id="product_type_${productTypeCountTemp}_${counter.count}" disabled="true">
										</select></li>
										<input type="hidden" id="product_type_${productTypeCountTemp}_Value_${counter.count}" value="${goalData.categoryId}"/>
										<li class="ep_three">
											<div class="ep_slider_bx">
												<div class="EP">
													<div class="range_parent">
														<div class="scale clearfix">
															<div class="scale_range">
																<span class="low extrem">0%</span><span
																	class="high extrem">100%</span>
															</div>
															<div id="slider_${productTypeCountTemp}_${counter.count}"></div>
														</div>
														<div class="counter_parent">
															<input type="text" id="allocationPercent_${productTypeCountTemp}_${counter.count}" 
															class="range_counter" value="100" readonly="readonly"> <span class="unit" style="color:black;">%</span>
														</div>
													</div>
												</div>
												<div class="clr"></div>
											</div>
										</li>
										<li class="ep_four">
											<div id="AssetType" class="icon_box">
												<div class="icon clearfix" id="${productTypeCountTemp}_Div_${counter.count}">
													<a href="#" id="${productTypeCountTemp}_product_${counter.count}" onclick="submitForm('${productTypeCountTemp}_${counter.count}','${goalData.productTypeId}','${goalData.id}','${goalData.productTypeName}');">
														<div class="category">
															<img
																src="${pageContext.request.contextPath}/resources/images/asset_type_icon.png"
																class="cross_circle" height="33" width="33" alt="" />
														</div>
													</a>
												</div>
											</div>
										</li>
										<li class="ep_five"><input name="input" type="text"
											disabled class="common_input at-comment"
											value="(${goalData.countOfProductCategory})"> 
											<c:choose>
												<c:when test="${fn:length(goalDataList) eq counter.count}">												
													<div class="add" id="add_${productTypeCountTemp}">+</div>
												</c:when>
												<c:otherwise>
													<div class="add" id="add_${productTypeCountTemp}" style="display:none;">+</div>
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
						<c:if test="${not (productTypeId eq goalDataList[counter.count].productTypeId)}">
							<div class="clr"></div>
							</div>
							<input type="hidden" id="dynamicId_${productTypeCountTemp}" name="dynamicId_${productTypeCountTemp}" value="${categoryCount}"/>
							<input type="hidden" id="categoryCountInitial_${productTypeCountTemp}" name="categoryCountInitial_${productTypeCountTemp}" value="${categoryCount}"/>
							<c:set var="categoryCount">0</c:set>
						</c:if>
           		</c:when>
           		<c:otherwise>
           			<ul class="reset clearfix">
										<li class="ep_one first">
											<div class="ep_left_label">
											<c:choose>
												<c:when test="${deleteFlag eq 0}">
													<span class="dummy_custom_checkbox" id="chkboxSpan_${productTypeCountTemp}_${counter.count}"></span><!-- onclick="displayMsg('Record cannot be deleted');" --> 
													<input type="checkbox" class="default_checkbox"
													id="chkbox_${productTypeCountTemp}_${counter.count}"
													 value="${goalData.id}"/>
												</c:when>
												<c:otherwise>
													<span class="common_custom_checkbox" id="chkboxSpan_${productTypeCountTemp}_${counter.count}"></span>
													<input type="checkbox" class="default_checkbox"
													id="chkbox_${productTypeCountTemp}_${counter.count}" value="${goalData.id}"/>
												</c:otherwise>
											</c:choose>
												
											</div>
										</li>
										<li class="ep_two"><select class="Select_${productTypeCountTemp}"
											id="product_type_${productTypeCountTemp}_${counter.count}" disabled="true">
										</select></li>
										<input type="hidden" id="product_type_${productTypeCountTemp}_Value_${counter.count}" value="${goalData.categoryId}"/>
										<li class="ep_three">
											<div class="ep_slider_bx">
												<div class="EP">
													<div class="range_parent">
														<div class="scale clearfix">
															<div class="scale_range">
																<span class="low extrem">0%</span><span
																	class="high extrem">100%</span>
															</div>
															<div id="slider_${productTypeCountTemp}_${counter.count}"></div>
														</div>
														<div class="counter_parent">
															<input type="text"
																id="allocationPercent_${productTypeCountTemp}_${counter.count}"
																class="range_counter" readonly="readonly"> <span class="unit">%</span>
														</div>
													</div>
												</div>
												<div class="clr"></div>
											</div>
										</li>
										<li class="ep_four">
											<div id="AssetType" class="icon_box">
												<div class="icon clearfix" id="${productTypeCountTemp}_Div_${counter.count}">
													<a href="#" id="${productTypeCountTemp}_product_${counter.count}" onclick="submitForm('${productTypeCountTemp}_${counter.count}','${goalData.productTypeId}','${goalData.id}','${goalData.productTypeName}');">
														<div class="category">
															<img
																src="${pageContext.request.contextPath}/resources/images/asset_type_icon.png"
																class="cross_circle" height="33" width="33" alt="" />
														</div>
													</a>
												</div>
											</div>
										</li>
										<li class="ep_five"><input name="input" type="text"
											disabled class="common_input at-comment"
											value="(${goalData.countOfProductCategory})"> 
											<c:choose>
												<c:when test="${fn:length(goalDataList) eq counter.count}">												
													<div class="add" id="add_${productTypeCountTemp}">+</div>
												</c:when>
												<c:otherwise>
													<div class="add" id="add_${productTypeCountTemp}" style="display:none;">+</div>
												</c:otherwise>
											</c:choose>
										</li>
									</ul>
									<c:set var="categoryCount">${categoryCount + 1}</c:set>
							<c:if test="${not (productTypeId eq goalDataList[counter.count].productTypeId)}">
							<div class="clr"></div>
							</div>
							<input type="hidden" id="dynamicId_${productTypeCountTemp}" name="dynamicId_${productTypeCountTemp}" value="${categoryCount}"/>
							<input type="hidden" id="categoryCountInitial_${productTypeCountTemp}" name="categoryCountInitial_${productTypeCountTemp}" value="${categoryCount}"/>
							<c:set var="categoryCount">0</c:set>
						</c:if>						
           		</c:otherwise>
           	</c:choose>
			<input name="${productTypeCountTemp}_SliderValue_${counter.count}" id="${productTypeCountTemp}_SliderValue_${counter.count}" type="hidden" value="${goalData.allocationPercent}"/>					
           <c:set var="adviceIds">${adviceIds},${goalData.id}</c:set>
           </c:forEach>            
			<input type="hidden" name="adviceIds" value="${adviceIds}"/>
          </div>
        </div>
      </section>
      </form>
      <!--Aditya Forget Password Pop Up ends here--> 
      
      <!-- Common_in_contnet starts--> 
      
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section id="Footer_Type_Two" class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup">
            </li>
            <li class="fl list"><a href="#" onclick="submitData();" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" onclick="cancel();" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
      </section>
      
     
      <div class="overlay"></div>
    </section>
  </section>
  <!-- Common_content Ends-->
  
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        Do you really want to delete this data?</div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div>
<!-- Datepicker --> 
<script>
$(function() {
    $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
	  showOn: "button",
	  buttonText: '',
     });
  });
  
  
$(document).ready(function(){
  var equityCategoryData = [];
  var equityAllocationPercentage = []; 
  var equityCategoryDataFinal = [];
  var equityAllocationPercentageFinal = [];
  var recordTypeId="${recordTypeId}";

 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
  
 var productTypeCount="${productTypeCount}";
 for(var i=1;i<=productTypeCount;i++){
	 
	 var categoryCount=$("#dynamicId_"+i).val();
	 equityCategoryData = [];
	 equityAllocationPercentage = [];
	 var popupSliderVar="#popup_slider_"+i;
	 var allocationVar = "#popupAllocationPercent_"+ i;
	 var equitySliderValue="#"+i+"_sliderValue";	
	 createSliderAndSetValue(popupSliderVar, 0, 100, 1, allocationVar, $(equitySliderValue).val());
	 
	 for(var j=1;j<=categoryCount;j++){		 
		 
		 //create sliders
		 var sliderVar = "#slider_"+ i +"_"+j;		 
		 var allocationVar = "#allocationPercent_"+ i +"_"+j;
		 var equitySliderValue = "#"+ i +"_SliderValue_"+j;
		 var recordId="#chkbox_"+ i +"_"+j; 
		 createSliderAndSetValue1(sliderVar, 0, 100, 1, allocationVar, $(equitySliderValue).val());		 
		 equityAllocationPercentage.push($(equitySliderValue).val());
		//apply on change to drop downs to activate links
		 var equityDropDownId = "#product_type_"+ i +"_"+j;
		 //var divId = "#"+ i +"_Div_"+j;
		 //var anchorId = "#"+ i +"_product_"+j;
		 
		 var selectBox = $(equityDropDownId).selectBoxIt().data('selectBox-selectBoxIt');		 
		 selectBox.selectOption($("#product_type_"+ i +"_Value_"+j).val());
		   equityCategoryData.push($(equityDropDownId).val()+"_"+$(recordId).val());
			//$( "body" ).on( "change", equityDropDownId , function(){
				//var newAction = "${pageContext.request.contextPath}/partner/goalPlanAssociatedProducts/"+this.value;
				//$('#goalPlanAssetTypeform').attr('action', newAction);
				/* $(anchorId).prop("href",newAction); 
				$(".icon clearfix").on("click", divId, function() {alert('div clicked')}); */
			//});
		
	 }
	 if(categoryCount>=2 && recordTypeId==14003){
		 $("#chkboxSpan_1_1").removeClass("dummy_custom_checkbox");
		 //document.getElementById("chkboxSpan_1_1").onClick=null;
		 //$("#chkboxSpan_1_1").on("click","");
		 $("#chkboxSpan_1_1").addClass("common_custom_checkbox");
	 }
	 $("#initialDataDropDown_"+i).val(equityCategoryData);
	 $("#initialDataSlidern_"+i).val(equityAllocationPercentage);
 }	 
 
 $(function() {

		$(document).ajaxStop(function() {
			 $('#page_loader').fadeOut();
		});

		$(document).ajaxStart(function() {
			 $('#page_loader').fadeIn();
		});

	});

});

var errorMsg="";

function submitForm(rowId,productTypeId,recordId,productTypeName){
	checkData(0);
	compareData();
	if($("#actionFlag").val()==0){
		if($("#product_type_"+rowId).val()!=-1){ 
			var newAction = "${pageContext.request.contextPath}/partner/goalPlanAssociatedProducts";
			$("#passCategoryId").val($("#product_type_"+rowId).val());
			$("#productTypeId").val(productTypeId);
			$("#recordId").val(recordId);
			$("#passCategory").val($("#product_type_"+ rowId +" option:selected").text());
			$("#allocationPercentProductType").val(productTypeName);
			$("#allocationPercentCategory").val($("#allocationPercent_"+rowId).val());
			$('#goalPlanAssetTypeform').attr('action', newAction);
			$("#goalPlanAssetTypeform").submit();
 		}else{
			return false;
		}		
	}else{
		displayMsg("Save Data First");
		return false;
	} 

}

function submitProductTypeData(){
	var productTypeCount="${productTypeCount}";
	var netAllocationPercent=0;
	 for(var i=1;i<=productTypeCount;i++){		 
		 var allocationVar = "#popupAllocationPercent_"+ i;
		 $("#finalDataSlidern_"+i).val($(allocationVar).val());
		 netAllocationPercent = netAllocationPercent + parseInt($(allocationVar).val());
	 }
	 if(netAllocationPercent==100){
		$('#goalPlanAssetTypeform').attr('action', '${pageContext.request.contextPath}/partner/saveGoalPlanProductType');
		$("#goalPlanAssetTypeform").submit();
	 }else{
		 displayMsg("<spring:message code='productTypeAllocation' />")
	 }
	
}

function submitData(){
	checkData(1);
	if(errorMsg==""){
		compareData();
		if($("#actionFlag").val()==0){
			$('#goalPlanAssetTypeform').attr('action', '${pageContext.request.contextPath}/partner/goalPlanAssetTypes');
		}else{
			$('#goalPlanAssetTypeform').attr('action', '${pageContext.request.contextPath}/partner/saveGoalPlanAssetTypes');
		}
		
		$("#goalPlanAssetTypeform").submit();	
	}else{
		displayMsg(errorMsg);	
	}	
}

function cancel(){
	checkData(0);
	compareData();
	if($("#actionFlag").val()==0){
		$('#goalPlanAssetTypeform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#goalPlanAssetTypeform").submit();
	}else{
		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").click(function(){cancelPage()});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}
}
function cancelPage(){
	$('#goalPlanAssetTypeform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
	$("#goalPlanAssetTypeform").submit();
}
function compareData(){
	
	var flag=0;
	var productTypeCount="${productTypeCount}";
	 for(var i=1;i<=productTypeCount;i++){
		 var totalRows=$("#dynamicId_"+i).val();
		 for(var j=1;j<=totalRows;j++){
			 if(($("#initialDataSlidern_"+i).val()!=$("#finalDataSlidern_"+i).val()) || 
				 ($("#initialDataDropDown_"+i).val()!=$("#finalDataDropDown_"+i).val())){
			 flag=1;
			 }
		 }			 
	 }
	 if(flag==1){
		 $("#actionFlag").val("1");
	 }else{
		 $("#actionFlag").val("0");
	 }
		 
}

function checkData(validationFlag){
	
	var productTypeCount="${productTypeCount}";
	var equityData="";
	var allocationPercentTotal=0;
	errorMsg="";
	for(var i=1;i<=productTypeCount;i++){
		 
		 var totalRows=$("#dynamicId_"+i).val();
		 equityCategoryDataFinal = [];
		 equityAllocationPercentageFinal = [];
		 allocationPercentTotal=0;
		 for(var j=1;j<=totalRows;j++){
			
			 //create sliders
			  var equityDropDownId = "#product_type_"+ i +"_"+j;
			  var equitySliderId = "#allocationPercent_"+ i +"_"+j;
			  var recordId="#chkbox_"+ i +"_"+j;
			  equityData=$(equityDropDownId).val();
			  if((equityData) && (equityData!=-1)){
				  equityCategoryDataFinal.push($(equityDropDownId).val()+"_"+$(recordId).val());
				  equityAllocationPercentageFinal.push($(equitySliderId).val());
					allocationPercentTotal=parseInt($(equitySliderId).val())+allocationPercentTotal;
					if($(equitySliderId).val()<=0 && validationFlag==1){
						errorMsg="<spring:message code='percentGT0' />";
						return false;
					}
			  }else if($(equitySliderId).val()>0 && validationFlag==1){
				  errorMsg="<spring:message code='fillDataCorrectly' />";
				  return false;
			  }				
				
		 }
		 
		 if(allocationPercentTotal<100 && validationFlag==1){
			 errorMsg="<spring:message code='catgoryAllocation' />";
			 return false;
		 }
		 
		 $("#passCategory").val($("#product_type_"+i+"_"+(j-1)+" option:selected").text());
		 
		 $("#finalDataSlidern_"+i).val(equityAllocationPercentageFinal);
		$("#finalDataDropDown_"+i).val(equityCategoryDataFinal);
	 }
	
	
}
function checkAvailability(categoryDropDownId){
	
	var idPeices=categoryDropDownId.split("_");
	var totalRows=$("#dynamicId_"+idPeices[2]).val();
	var equityData="";
	var equityDropDownId="";
	var selectedCategory=$("#"+categoryDropDownId+" option:selected").text();
	
	for(var j=1;j<=totalRows-1;j++){
		
		equityDropDownId = "#product_type_"+ idPeices[2] +"_"+j;
		equityData=$(equityDropDownId).val();
		
		if((equityData) && (equityData!=-1)){
			  if($("#"+categoryDropDownId).val()==equityData){				  	
					$("#slider_"+idPeices[2]+"_"+idPeices[3]).slider("value", "0");
					$("#allocationPercent_"+idPeices[2]+"_"+idPeices[3]).val("0");
					$("#"+categoryDropDownId).val("-1");
					var selectBox = $("#"+categoryDropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
					selectBox.selectOption("-1");
					displayMsg("You have already selected "+selectedCategory+" category.");
			}
		}
	}
}
</script> 
<!-- Datepicker Ends -->

</body>
</html>
