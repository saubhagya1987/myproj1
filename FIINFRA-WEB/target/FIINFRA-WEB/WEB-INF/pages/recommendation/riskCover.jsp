<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>${assetHeader}</title>
<%-- <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> --%>

<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/perfect-scrollbar.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/responsive.css" />
<link href="${pageContext.request.contextPath}/css/diy/custom.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/my_account_submenu.js"></script> --%>
<!--<script src="resources/js/jquery.ddslick.js"></script>-->
<%-- <script src="${pageContext.request.contextPath}/js/diy/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/common/common.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/common_modal.js"></script>
 <link href="<%=request.getContextPath()%>/css/${sessionScope.userSession.themeName}/${sessionScope.userSession.themeName}.css" rel="stylesheet"> --%>
 
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/common/common.js"></script>

<style>
#Emergency_Planning h3 {
    background-color: #952754; border: medium none; border-radius: 0; box-shadow: 2px 1px 2px 1px #888888; color: #ffffff; font-family: "allerregular"; font-size: 15px;
    margin-bottom: 0px; z-index: 3;  padding:6px 12px 6px 15px;}

.EP_cnt_title {padding: 4px 12px 18px 15px;}
.EP_cnt ul { padding-top: 8px;list-style: none !important; }
.EP_cnt ul { margin-bottom: 8px; }
/* #Emergency_Planning_in + .common_footer_actions .btn_grup3 { width: 221px; } */
/* .common_footer_actions #main_actions { width: 250px; } */
/* #confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; } */
/* #page_loader { background: #fff url(${pageContext.request.contextPath}/images/diy/loader.gif) no-repeat center center; } */
#Emergency_Planning .EP_cnt { height: 325px !important; }

.heading_icon{line-height: 95px !important;}

.risk_cover_wrapper #accordian_selctor {
	width: 375px;
	float: right;
	margin: 5px 0 0 0px;
	font-size: 8px;
	font-weight: normal;
}
.AR_two_two {
margin-left: 35px !important;
}
.AR_three_one {
margin-left: 60px !important;
}

/* #Emergency_Planning #accordian_selctor {width: 384px;margin:8px 0 0 25px; } */
/* #Emergency_Planning #accordian_selctor .lbl { color: #FFF; font-size: 12px; display: inline-block; width: 73px; text-align: center; line-height: 12px; margin: 4px 0 0;font-family: "allerregular"; } */
/* #Emergency_Planning #accordian_selctor .lbl_fifth { width:60px } */
/* #Emergency_Planning #accordian_selctor .ui-slider-handle{-moz-border-radius:6px;-webkit-border-radius: 6px;border-radius:6px;line-height: 12px!important;} */
/* #Emergency_Planning #accordian_selctor .ui-slider-handle.ui-state-active{-webkit-box-shadow:none!important;-webkit-box-shadow: none!important;-webkit-box-shadow:none!important;font-size:12px!important;} */

/* .selectboxit-container .selectboxit-options {
overflow-x: auto;
max-width: 100%;
max-height: 160px !important;
} */



.accordion-style1.panel-group .panel-heading .accordion-toggle{min-height: 60px !important; padding: 9px !important;}


#Emergency_Planning_in .accordion-style1 .panel-heading .slider_lbl{font-family: "allerregular"; font-size:15px;}
.accordion-style1.panel-group .panel-heading .accordion-toggle{font-weight: normal !important;}


/* .accordion-style1.panel-group .panel-heading .accordion-toggle{background-color: rgba(149, 39, 84, 0.3) !important; color:#fff !important;}
.accordion-style1.panel-group .panel-heading .accordion-toggle.collapsed{background-color: grey !important; color:#fff !important;}
.accordion-style1.panel-group .panel-heading .accordion-toggle.hover{background-color: pink !important;} */

#Emergency_Planning_in .EP_cnt .col-sm-1,#Emergency_Planning_in .AT_cnt_title .col-md-1 {width: 3% !important;}
#Emergency_Planning_in .EP_cnt .col-sm-2 {width: 21% !important;}
#Emergency_Planning_in .EP_cnt .col-md-3{width: 20% !important;}  
</style>
<script>
var flag=0;
var sliderId="";
var pieces=[];

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

function createSliderAndSetValue1(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,value) {

    $(ctrlName).slider({
    	value: value,
		range: "min",
		min: minVal,
        max: maxVal,
        step: stepBy,
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
        		var totalRows=$("#noOfDropdowns_"+pieces[1]).val();
        		var totalValue=0;
        		if(pieces[2]>=5){
        			for(var i=5;i<=totalRows;i++){        			
            			if($("#allocationPercent_"+pieces[1]+"_"+i).val()){
            				totalValue=parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val())+totalValue;
                			if(sliderId!=(pieces[1]+"_"+i)){
                				unallocatedPercent=unallocatedPercent-parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val());
                			}	
            			}        			
            		}	
        		}else{
        			for(var i=1;i<=4;i++){        			
            			if($("#allocationPercent_"+pieces[1]+"_"+i).val()){
            				totalValue=parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val())+totalValue;
                			if(sliderId!=(pieces[1]+"_"+i)){
                				unallocatedPercent=unallocatedPercent-parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val());
                			}	
            			}        			
            		}
        		}
            	if(totalValue>100){
            		if(unallocatedPercent<0){
            			unallocatedPercent=0;
            		}
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
    //$( "#Emergency_Planning_Tab" ).accordion({ animate: 200 });
  });

</script>

<!-- Fuel type starts -->
<script>
$(document).ready(function(){
	activateSecurity();
  $(".thumb_select_ul a").click(function(){
	
    $(this).children(".categoery").toggleClass("not_applicable");

  });
//<!-- Fuel type ends -->
   $(".wrapper").addClass("risk_cover_wrapper");
   createSlider('#accordian_selctor',1,5,1,'');
   <c:choose>
   	<c:when test="${categoryId eq 48026}">
   		$( "#accordian_selctor" ).slider( "value", 2 );
   		$("#accordian_selctor .ui-slider-handle").css({'width':'70px','margin-left':'-18px'});
 	    $("#accordian_selctor .ui-slider-handle").text("Health Insurance");
 		$("#Emergency_Planning_Tab").addClass("health");
   	</c:when>
   	<c:when test="${categoryId eq 48025}">
 		$( "#accordian_selctor" ).slider( "value", 3 );
 		$("# .ui-slider-handle").css({'width':'70px','margin-left':'-35px'});
         $("#accordian_selctor .ui-slider-handle").text("Accidental Insurance");
 		$("#Emergency_Planning_Tab").addClass("accidental");
 	</c:when>
 	<c:when test="${categoryId eq 48027}">
 		$( "#accordian_selctor" ).slider( "value", 4 );
 		 $("#accordian_selctor .ui-slider-handle").css({'width':'70px','margin-left':'-54px'});
          $("#accordian_selctor .ui-slider-handle").text("Critical Insurance");
 		    $("#Emergency_Planning_Tab").addClass("critical");    
 	</c:when>
 	<c:when test="${categoryId eq 48024}">
 		$( "#accordian_selctor" ).slider( "value", 5 );
 		$("#accordian_selctor .ui-slider-handle").css({'width':'75px','margin-left':'-78px'});
         $("#accordian_selctor .ui-slider-handle").text("Property Insurance");
 	 $("#Emergency_Planning_Tab").addClass("property");
 	</c:when>
   </c:choose>
  /* $("#accordian_selctor .ui-slider-handle").text("Life Insurance");
	   $("#accordian_selctor .ui-slider-handle").css({'width':'70px','margin-left':'5px'}); */
	$( "#accordian_selctor" ).on("slide", function( event, ui ) {
		$("#accordian_selctor .ui-slider-handle").empty();
            if (ui.value == 1) {
               $("#accordian_selctor .ui-slider-handle").css({'width':'51px','margin-left':'5px'});
              //  $(".product_allocaton").fadeOut("fast");
				// $(".year_to_goal").fadeOut("fast");
				// $(".allocation_percentage").fadeIn("slow");
                $("#accordian_selctor .ui-slider-handle").text("Life Insurance");
                window.location.href="${pageContext.request.contextPath}/partner/recommendation/riskCover?productTypeId=47007";
            } else if (ui.value == 2) {
                $("#accordian_selctor .ui-slider-handle").css({'width':'70px','margin-left':'-18px'});
               $("#accordian_selctor .ui-slider-handle").text("Health Insurance");
               window.location.href="${pageContext.request.contextPath}/partner/recommendation/riskCover?productTypeId=47006&categoryId=48026";
               }
		else if (ui.value == 3) {
               $("#accordian_selctor .ui-slider-handle").css({'width':'70px','margin-left':'-35px'});
               $("#accordian_selctor .ui-slider-handle").text("Accidental Insurance");
               window.location.href="${pageContext.request.contextPath}/partner/recommendation/riskCover?productTypeId=47006&categoryId=48025";
               }
			   else if (ui.value == 4) {
                $("#accordian_selctor .ui-slider-handle").css({'width':'70px','margin-left':'-54px'});
               $("#accordian_selctor .ui-slider-handle").text("Critical Insurance");
               window.location.href="${pageContext.request.contextPath}/partner/recommendation/riskCover?productTypeId=47006&categoryId=48027";
               }
		     else if (ui.value == 5) {
             $("#accordian_selctor .ui-slider-handle").css({'width':'75px','margin-left':'-67px'});
               $("#accordian_selctor .ui-slider-handle").text("Property Insurance");
               window.location.href="${pageContext.request.contextPath}/partner/recommendation/riskCover?productTypeId=47006&categoryId=48024";
               }
		
		});

 
//<!-- Custom Selectbox starts -->     
  
  $("#successDialog").dialog();
  $(document).on("dialogopen", "#successDialog", function(event, ui) {
  	setTimeout("$('#successDialog').dialog('close')",3000);
  });
  		
 /*  $("#confirmDialog .close").click(function(){
	    $(".overlay").fadeOut("slow");
		$("#confirmDialog").fadeOut("slow");
		 });
   */
  <c:if test="${not empty success}">
	  /* $("#successDialog").html("<spring:message code="${success}" />");
	  $( "#successDialog").dialog( "open" ); */
	  $(".modal-body").html("<spring:message code="${success}" />");
	  $(".btn-success1").html("OK");
	  $(".btn-success1").on('click',function(){
	  	closeDialog();
	  });		
	  $(".btn-danger1").hide();
	  $('#confirmDialog').modal('show');
  </c:if>

  <c:if test="${not empty error}">
  	/* $("#successDialog").html("<spring:message code="${error}" />");
  	$( "#successDialog").dialog( "open" ); */
  	 $(".modal-body").html("<spring:message code="${error}" />");
    $(".btn-success1").html("OK");
    $(".btn-success1").on('click',function(){
    	closeDialog();
    });		
    $(".btn-danger1").hide();
    $('#confirmDialog').modal('show');
  </c:if>
  
  var productCategoryClass="";
  <c:forEach items="${adviceRecommendationMap}" var="adviceRecommendationLst" varStatus="mapCounter">
  	productCategoryClass=".productCategory_${mapCounter.count}";
  	/* $(productCategoryClass).selectBoxIt({
 		 populate: {"data": ${adviceRecommendationLst.value[0].productCategoryList}}
 	}); */  
 	var list = ${adviceRecommendationLst.value[0].productCategoryList};
 	 $.each(list, function( index, value ) {
 	  //alert( index + ": " + value );
 	  var obj=value;
 	  $(productCategoryClass)
 	     .append($("<option></option>")
 	    .attr("value",obj.value)
 	    .text(obj.text));
 	    
 	 });
  </c:forEach>
  
  var productCount="${productTypeCount}";
  for(var i=1;i<=productCount;i++){
	  
	  /* $(".companySelect_"+i).selectBoxIt({
	  		 populate: {"data":[
	  		                     {"value":"-1","text":"---Select---"}
	  		                   ]}
	  });
	  	
	  $(".productSelect_"+i).selectBoxIt({
	  		 populate: {"data":[
	  		                     {"value":"-1","text":"---Select---"}
	  		                   ]}
	  });	   */	  	
	  
	  $(".companySelect_"+i)
	    .append($("<option></option>")
	    .attr("value","-1")
	    .text('-- Select --'));
	   
	   $(".productSelect_"+i)
	    .append($("<option></option>")
	    .attr("value","-1")
	    .text('-- Select --'));
  }    
  	
	 // Calls the selectBoxIt method on your HTML select box
 
//<!-- Custom Selectbox Ends -->

//<!-- custom scroll to "common_in_content" -->
  
    //$('.common_in_content').slimScroll();
    //$('.EP_cnt').perfectScrollbar();

	  // Expected Returns on all existing Investment value Slider
//<!-- custom scroll to "common_in_content" -->

//<!-- Type of emergency faced select starts -->
  $(".icon a").click(function(){
    $(this).children(".category").toggleClass("gp_applicable");
//	$(this).find(".cross_circle").toggle();
  });
});

function performReset(){
	window.location.href="${pageContext.request.contextPath}/partner/setDefaultRiskCover/${sectionTypeId}/${productTypeIds}/null";
}

function displayMsg(msg){
	$(".modal-body").html(msg);
		$(".btn-success1").html("Ok");
		$(".btn-success1").on('click',function(){closeDialog();});
		$(".btn-danger1").hide();
		$('#confirmDialog').modal('show');
}

function closeDialog(){
	$("#confirmDialog").modal('hide');
}

function setDefaultValues(){
	if("${recordTypeId}"==14003){
		if("${assetHeader}" == "Risk Cover"){
			if("${productTypeId}" == "47007"){
				$(".modal-body").html("<spring:message code='emergencyPlanning.dataReset' />");
			}
		}		
		$(".btn-success1").on('click',function(){performReset();});			
		$('#confirmDialog').modal('show');
	}else{
		displayMsg("<spring:message code='dataAlreadyRestored' />");		
	}
}
</script>
<!-- Type of emergency faced select ends -->

</head>

<body>
<!-- this is Advice Recomendations header -->
<jsp:include page="header.jsp"></jsp:include>

<input type="hidden" id="idList" value="${sessionScope.idList}"/>
<!-- Wrapper starts-->
<div class="container">
	<!-- <div class="container-head">
		<div class="col-md-12" style="text-align: right;"><span style="float:left;">Partner Setup </span></div >
    </div>
    <div class="container-body " style="padding:5px;">    </div> -->
    
	<div class="container-body">
<div class="wrapper" id="Emergency_Planning"> 
  <!-- Main starts-->
  
  <section class="main"> 

    
<!--       <div class="space-32 .visible-xs-* hidden-md hidden-sm hidden-lg"></div>   -->
      <div class="space-12 .visible-xs-* hidden-md hidden-sm hidden-lg"></div>
      
        <!-- Header Starts-->
              
    <header class="common_header inner_header">
     
      <div class="page_header clearfix">
							
      <div class="row">
      <div class="col-md-12 col-xs-12">
        <div class="heading clearfix">

<div class="row">
<div class="col-md-5 col-xs-12">
          <span class="heading_icon"><i class="ace-icon fa icon-risk-cover bigger-300"></i></span>
          <span class="head_txt">Risk Cover</span>
          </div>
                
         <div class="col-md-7 col-xs-12">
         
          <button class="btn btn-sm btn-warning pull-right set_default" onclick="setDefaultValues();">
												<i class="ace-icon fa fa-fire bigger-110"></i>
												<span class="bigger-110 no-text-shadow">Set Default</span>
											</button>
											
											
         <div id="accordian_selctor" class="common_sliding_radio pull-right">
	   <span class="lbl_first lbl">Life Insurance</span>
	   <span class="lbl_second lbl">Health Insurance</span>
	   <span class="lbl_third lbl">Accidental Insurance</span>
	   <span class="lbl_fourth lbl">Critical Insurance</span>
	   <span class="lbl_fifth lbl">Property Insurance</span>
	   </div>
	   
        
					</div>	
					
				</div>							
											
		  </div>
          </div> </div>
      </div>
    </header>
    <!-- Header Ends--> 
    
    	<div class="space-10 visible-xs hidden-md "></div>
    	
    
    <!-- Common_content Starts-->
    <section class="content common_content">
      <form method="post" id="recommendationForm" name="recommendationForm">
        <input type="hidden" name="productCategoryId" id="productCategoryId" value="0"/>
        <input type="hidden" name="manufacturerId" id="manufacturerId" value="0"/>
        <input type="hidden" name="actionFlag" id="actionFlag" value="0"/>
        <input type="hidden" name="productTypeCount" id="productTypeCount" value="${productTypeCount}"/>
        <input type="hidden" name="assetHeader" id="assetHeader" value="${assetHeader}"/>
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="${sectionTypeId}"/>
        <input type="hidden" name="assetClassId" id="assetClassId" value="${assetClassId}"/>
        <input type="hidden" name="recordTypeId" id="recordTypeId" value="${recordTypeId}"/>
        <input type="hidden" name="finalProductTypeIds" id="finalProductTypeIds" value="${productTypeIds}"/>
        <section class="in_content clearfix" id="Emergency_Planning_in">
         <!--  <div id="page_loader"></div> -->
          <c:set var="productTypeId">0</c:set>
          <c:set var="preferredFlag">0</c:set>
          <c:set var="alternativeFlag">0</c:set>
          <c:set var="categoryCount">0</c:set>
   
          <div style="margin:0 20px;">
            <div id="Emergency_Planning_Tab">
              <c:forEach items="${adviceRecommendationMap}" var="adviceRecommendationLst" varStatus="mapCounter" end="0">
              <c:set var="pieces" value="${fn:split(adviceRecommendationLst.key, '_')}"/>
              <h3>${pieces[1]} <span>(<fmt:formatNumber type="number" maxFractionDigits="0" value="${pieces[2]}" /> %)</span></h3>
              <c:set var="productTypeId">${adviceRecommendation.productTypeId}</c:set>
              <c:set var="productTypeCountTemp">${productTypeCountTemp + 1}</c:set>
              <c:set var="preferredFlag">0</c:set>
              <c:set var="alternativeFlag">0</c:set>
              <c:set var="categoryCount">1</c:set>
              <c:set var="productCount">1</c:set>
              <div class="EP_cnt">
              <div class="pb-risk-cover">
                <input type="hidden" name="initialProductCategory_${productTypeCountTemp}" id="initialProductCategory_${productTypeCountTemp}" value="0"/>
                <input type="hidden" name="initialAllocationPercent_${productTypeCountTemp}" id="initialAllocationPercent_${productTypeCountTemp}" value="0"/>
                <input type="hidden" name="initialProductIds_${productTypeCountTemp}" id="initialProductIds_${productTypeCountTemp}" value="0"/>
                <input type="hidden" name="finalProductCategory_${productTypeCountTemp}" id="finalProductCategory_${productTypeCountTemp}" value="0"/>
                <input type="hidden" name="finalAllocationPercent_${productTypeCountTemp}" id="finalAllocationPercent_${productTypeCountTemp}" value="0"/>
                <input type="hidden" name="finalProductIds_${productTypeCountTemp}" id="finalProductIds_${productTypeCountTemp}" value="0"/>                
                <c:forEach items="${adviceRecommendationLst.value}" var="adviceRecommendation" varStatus="counter">
                  <c:choose>
                    <c:when test="${adviceRecommendation.ispreferredProduct eq 1}">
                      <c:if test="${preferredFlag eq 0}">
                        <div class="EP_cnt_title">Preferred</div>
                        
                        <div class="AT_cnt_title hidden-xs">     
				            	<div class="row">
					            	<div class="col-md-1"></div>
					            	<div class="col-md-3">Product Category</div>
					            	<div class="col-md-4">Range (% Shares)</div>
					            	<div class="col-md-3">Company</div>
					            	<div class="col-md-3">Product</div>
				            	</div>            
          					</div>
                        <c:set var="preferredFlag">1</c:set>
                      </c:if>
                    </c:when>
                    <c:when test="${adviceRecommendation.ispreferredProduct eq 0}">
                    	<c:if test="${alternativeFlag eq 0}">
                    	<c:if test="${preferredFlag eq 0}">
                        	<div class="EP_cnt_title">Preferred</div>
                        
                        <div class="AT_cnt_title hidden-xs">     
				            	<div class="row">
					            	<div class="col-md-1"></div>
					            	<div class="col-md-3">Product Category</div>
					            	<div class="col-md-4">Range (% Shares)</div>
					            	<div class="col-md-3">Company</div>
					            	<div class="col-md-3">Product</div>
				            	</div>            
          					</div>
                        </c:if>
                         
                        <c:forEach begin="${categoryCount}" end="4" var="i">  
                             
                        <c:if test="${categoryCount eq 1}">
                			<div class="panel-body">
                		</c:if>                	
			                 <div class="form-group">            
             				<div class="row">
			                     <div class="col-sm-1 col-xs-12 hidden-xs">${categoryCount}.</div>
                    <div class="col-sm-2 col-xs-12">         
             			<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Product Category</div></div>
          			</div>         
                      <select class="ep productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productCategoryValue_${productTypeCountTemp}_${productCount}" id="productCategoryValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.categoryId}"/>
                      <input type="hidden" name="productCategoryRecordId_${productTypeCountTemp}_${productCount}" id="productCategoryRecordId_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.id}"/>
                     <div class="hr14"></div></div>
                     
                   <div class="col-sm-4 col-xs-12">
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Range (% Shares)</div>
              </div>
          			</div>
                        <div class="col-sm-12 col-xs-12">
                        <div class="">
                          <div class="range_parent">                          
                            <div class="scale clearfix">
                            <div class="col-sm-7 col-xs-6">
                              <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
                              <div id="slider_${productTypeCountTemp}_${productCount}"></div>
                            </div>
                             <div class="space-8" ></div>
                             <div class="col-sm-5 col-xs-6">
                            <div class="counter_parent">
                              <input type="text" id="allocationPercent_${productTypeCountTemp}_${productCount}" class="range_counter" readonly="readonly">
                              <span class="unit">%</span> </div></div>
                          
                          </div>
                        </div>
                         <div class="space hidden-md visible-xs"> </div>                     
                      </div>
                    
                     <div class="hr14"></div></div>
                     
                     <div class="col-sm-2 col-xs-12">                
                  		<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Company</div></div>
          			</div>
                      <select class="form-control companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="companySelectValue_${productTypeCountTemp}_${productCount}" id="companySelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.manufacturerId}"/>
                    <div class="hr14"></div></div>
                    
                    <div class="col-sm-2 col-xs-12">
                
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Product</div></div>
          </div>
                      <select class="form-control productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productSelectValue_${productTypeCountTemp}_${productCount}" id="productSelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.productId}"/>
                      <input type="hidden" name="isPreferredProduct_${productTypeCountTemp}_${productCount}" id="isPreferredProduct_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.ispreferredProduct}"/>
                    <div class="hr14"></div></div>
                   
                  </div>
                  </div>
                  <div class="hr hr-dotted hr-16"></div> 
                  <input name="${productTypeCountTemp}_SliderValue_${productCount}" id="${productTypeCountTemp}_SliderValue_${productCount}" type="hidden" value="${adviceRecommendation.allocationPercentCategoryId}"/>
                  <c:set var="categoryCount">${categoryCount + 1}</c:set>
                  <c:set var="productCount">${productCount + 1}</c:set>
                
			                    </div>
			                    
			                
			                  <input name="${productTypeCountTemp}_SliderValue_${productCount}" id="${productTypeCountTemp}_SliderValue_${productCount}" type="hidden" value="0"/>
                  			  <c:set var="categoryCount">${categoryCount + 1}</c:set>
                  			  <c:set var="productCount">${productCount + 1}</c:set>
                  			  <c:if test="${categoryCount eq 4}">
                				</div>
                			</c:if>
                			</div>
                			</div> 
                        </c:forEach>
                        
                        
                        <c:set var="categoryCount">1</c:set>                      
                       <div class="EP_cnt_title">Alternative</div>
                        
                        <div class="AT_cnt_title hidden-xs">     
				            	<div class="row">
					            	<div class="col-md-1"></div>
					            	<div class="col-md-3">Product Category</div>
					            	<div class="col-md-4">Range (% Shares)</div>
					            	<div class="col-md-3">Company</div>
					            	<div class="col-md-3">Product</div>
				            	</div>            
          					</div>
          					
                        <c:set var="alternativeFlag">1</c:set>
                      </c:if>
                    </c:when>
                  </c:choose>
                  <div class="panel-body">                  
                  <div class="form-group">            
             <div class="row">
             
                    <div class="col-sm-1 col-xs-12 hidden-xs">${categoryCount}.</div>
                    <div class="col-sm-2 col-xs-12">         
             			<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Product Category</div></div>
          			</div>         
                      <select class="ep productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productCategoryValue_${productTypeCountTemp}_${productCount}" id="productCategoryValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.categoryId}"/>
                      <input type="hidden" name="productCategoryRecordId_${productTypeCountTemp}_${productCount}" id="productCategoryRecordId_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.id}"/>
                     <div class="hr14"></div></div>
                     
                   <div class="col-sm-4 col-xs-12">
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Range (% Shares)</div>
              </div>
          			</div>
                        <div class="col-sm-12 col-xs-12">
                        <div class="">
                          <div class="range_parent">                          
                            <div class="scale clearfix">
                            <div class="col-sm-7 col-xs-6">
                              <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
                              <div id="slider_${productTypeCountTemp}_${productCount}"></div>
                            </div>
                             <div class="space-8" ></div>
                             <div class="col-sm-5 col-xs-6">
                            <div class="counter_parent">
                              <input type="text" id="allocationPercent_${productTypeCountTemp}_${productCount}" class="range_counter" readonly="readonly">
                              <span class="unit">%</span> </div></div>
                          </div>
                          </div>
                        </div>
                         <div class="space hidden-md visible-xs"> </div>                     
                      </div>
                    
                     <div class="hr14"></div></div>
                     
                     <div class="col-sm-2 col-xs-12">                
                  		<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Company</div></div>
          			</div>
                      <select class="form-control companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="companySelectValue_${productTypeCountTemp}_${productCount}" id="companySelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.manufacturerId}"/>
                    <div class="hr14"></div></div>
                    
                    <div class="col-sm-2 col-xs-12">
                
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Product</div></div>
          </div>
                      <select class="form-control productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productSelectValue_${productTypeCountTemp}_${productCount}" id="productSelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.productId}"/>
                      <input type="hidden" name="isPreferredProduct_${productTypeCountTemp}_${productCount}" id="isPreferredProduct_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.ispreferredProduct}"/>
                    <div class="hr14"></div></div>
                   
                  </div>
                  </div>
                  <div class="hr hr-dotted hr-16"></div> 
                  <input name="${productTypeCountTemp}_SliderValue_${productCount}" id="${productTypeCountTemp}_SliderValue_${productCount}" type="hidden" value="${adviceRecommendation.allocationPercentCategoryId}"/>
                  <c:set var="categoryCount">${categoryCount + 1}</c:set>
                  <c:set var="productCount">${productCount + 1}</c:set>
                </c:forEach>
                <c:if test="${categoryCount eq 4}">
                </div>
                </c:if>
                </c:forEach>
                <c:if test="${alternativeFlag eq 0}">
                    	<c:if test="${preferredFlag eq 0}">
                        	<div class="EP_cnt_title">Preferred</div>
			                    <div class="AT_cnt_title">
			                      <ul>
			                      	<li class="AR_two_two">Product Category</li>
			                        <li class="AR_three_one">Range</li>
		                            <li class="AR_four">% Share</li>
		                            <li class="AR_five">Company</li>
		                            <li class="AR_six">Product</li>
			                      </ul>
			                    </div>
                        </c:if>
                        <c:forEach begin="${categoryCount}" end="4" var="i"> 
                         <c:if test="${categoryCount eq 1}">
               				 <div class="panel-body">
                		</c:if>                       	
			                  <div class="form-group">            
             				<div class="row">
			                     <div class="col-sm-1 col-xs-12 hidden-xs">${categoryCount}.</div>
                    <div class="col-sm-2 col-xs-12">         
             			<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Product Category</div></div>
          			</div>         
                      <select class="ep productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productCategoryValue_${productTypeCountTemp}_${productCount}" id="productCategoryValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.categoryId}"/>
                      <input type="hidden" name="productCategoryRecordId_${productTypeCountTemp}_${productCount}" id="productCategoryRecordId_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.id}"/>
                     <div class="hr14"></div></div>
                     
                   <div class="col-sm-4 col-xs-12">
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Range (% Shares)</div>
              </div>
          			</div>
                        <div class="col-sm-12 col-xs-12">
                        <div class="">
                          <div class="range_parent">                          
                            <div class="scale clearfix">
                            <div class="col-sm-7 col-xs-6">
                              <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
                              <div id="slider_${productTypeCountTemp}_${productCount}"></div>
                            </div>
                             <div class="space-8" ></div>
                             <div class="col-sm-5 col-xs-6">
                            <div class="counter_parent">
                              <input type="text" id="allocationPercent_${productTypeCountTemp}_${productCount}" class="range_counter" readonly="readonly">
                              <span class="unit">%</span> </div></div>
                          </div>
                          </div>
                        </div>
                         <div class="space hidden-md visible-xs"> </div>                     
                      </div>
                    
                     <div class="hr14"></div></div>
                     
                     <div class="col-sm-2 col-xs-12">                
                  		<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Company</div></div>
          			</div>
                      <select class="form-control companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="companySelectValue_${productTypeCountTemp}_${productCount}" id="companySelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.manufacturerId}"/>
                    <div class="hr14"></div></div>
                    
                    <div class="col-sm-2 col-xs-12">
                
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Product</div></div>
          </div>
                      <select class="form-control productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productSelectValue_${productTypeCountTemp}_${productCount}" id="productSelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.productId}"/>
                      <input type="hidden" name="isPreferredProduct_${productTypeCountTemp}_${productCount}" id="isPreferredProduct_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.ispreferredProduct}"/>
                    <div class="hr14"></div></div>
                   
                  </div>
                  </div>
                   <div class="hr hr-dotted hr-16"></div> 
                  			  <c:set var="categoryCount">${categoryCount + 1}</c:set>
                  			  <c:set var="productCount">${productCount + 1}</c:set>
                        </c:forEach>
                        </div>
                        <div class="EP_cnt_title">Alternative</div>
                        
                        <div class="AT_cnt_title hidden-xs">     
				            	<div class="row">
					            	<div class="col-md-1"></div>
					            	<div class="col-md-3">Product Category</div>
					            	<div class="col-md-4">Range (% Shares)</div>
					            	<div class="col-md-3">Company</div>
					            	<div class="col-md-3">Product</div>
				            	</div>            
          					</div>
                    <c:set var="alternativeFlag">1</c:set>
                    <c:set var="categoryCount">1</c:set>
                  </c:if>
                  <c:forEach begin="${categoryCount}" end="4" var="i">
                  <c:if test="${categoryCount eq 1}">
                  <div class="panel-body">
                  </c:if>                  
                  <div class="form-group">            
             <div class="row">
             
                    <div class="col-sm-1 col-xs-12 hidden-xs">${categoryCount}.</div>
                    <div class="col-sm-2 col-xs-12">         
             			<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Product Category</div></div>
          			</div>         
                      <select class="ep productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productCategoryValue_${productTypeCountTemp}_${productCount}" id="productCategoryValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.categoryId}"/>
                      <input type="hidden" name="productCategoryRecordId_${productTypeCountTemp}_${productCount}" id="productCategoryRecordId_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.id}"/>
                     <div class="hr14"></div></div>
                     
                   <div class="col-sm-4 col-xs-12">
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Range (% Shares)</div>
              </div>
          			</div>
                        <div class="col-sm-12 col-xs-12">
                        <div class="">
                          <div class="range_parent">                          
                            <div class="scale clearfix">
                            <div class="col-sm-7 col-xs-6">
                              <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
                              <div id="slider_${productTypeCountTemp}_${productCount}"></div>
                            </div>
                             <div class="space-8" ></div>
                             <div class="col-sm-5 col-xs-6">
                            <div class="counter_parent">
                              <input type="text" id="allocationPercent_${productTypeCountTemp}_${productCount}" class="range_counter" readonly="readonly">
                              <span class="unit">%</span> </div></div>
                          </div>
                          </div>
                        </div>
                         <div class="space hidden-md visible-xs"> </div>                     
                      </div>
                    
                     <div class="hr14"></div></div>
                     
                     <div class="col-sm-2 col-xs-12">                
                  		<div class="AT_cnt_title hidden-md visible-xs">
              			<div class="row"><div class="col-md-3 col-xs-12">Company</div></div>
          			</div>
                      <select class="form-control companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="companySelectValue_${productTypeCountTemp}_${productCount}" id="companySelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.manufacturerId}"/>
                    <div class="hr14"></div></div>
                    
                    <div class="col-sm-2 col-xs-12">
                
                  <div class="AT_cnt_title hidden-md visible-xs">
              <div class="row"><div class="col-md-3 col-xs-12">Product</div></div>
          </div>
                      <select class="form-control productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${productCount}">
                      </select>
                      <input type="hidden" name="productSelectValue_${productTypeCountTemp}_${productCount}" id="productSelectValue_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.productId}"/>
                      <input type="hidden" name="isPreferredProduct_${productTypeCountTemp}_${productCount}" id="isPreferredProduct_${productTypeCountTemp}_${productCount}" value="${adviceRecommendation.ispreferredProduct}"/>
                    <div class="hr14"></div></div>
                   
                  </div>
                  </div>
                   <div class="hr hr-dotted hr-16"></div> 
                  <c:set var="categoryCount">${categoryCount + 1}</c:set>
                  <c:set var="productCount">${productCount + 1}</c:set>
                </c:forEach>
                <input type="hidden" name="noOfDropdowns_${productTypeCountTemp}" id="noOfDropdowns_${productTypeCountTemp}" value="${productCount}"/>
                <div class="clr"></div>
              </div>
            </div>
          </div>
        </section>
      </form>
      <!--Aditya Forget Password Pop Up ends here--> 
      
      <!-- Common_in_contnet starts--> 
      
      <!-- Common_in_contnet ends--> 
             <!-- Common footer starts -->
       <section class="common_footer_actions">
      <div class="row">
        <div class="col-sm-1 col-xs-3">
         <a href="${pageContext.request.contextPath}/partner/recommendation/emergencyPlanning.htm"><button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-back bigger-240"></i> Back </button></a>
        </div>
        
        
        <div class="col-sm-10 col-xs-6">
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-4 col-xs-0">
           
          </div>
          <div class="col-sm-3 col-xs-12">
           <c:choose>
          <c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
            <button class="btn btn-app btn-transparent btn-xs " onclick="submitData();"> <i class="ace-icon fa icon-save bigger-200"></i> Save </button>
           </c:when>
           </c:choose>
            <button class="btn btn-app btn-transparent btn-xs" onclick="cancel();"> <i class="ace-icon fa icon-cancel bigger-200"></i> Cancel </button>
          </div>
          <div class="col-sm-4 col-xs-0">
           
          </div>
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-1 col-xs-0"></div>
        </div>
        <div class="col-sm-1 col-xs-3">
          <a href="${pageContext.request.contextPath}/partner/taxPlanning.htm" ><button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-next bigger-240"></i> Next </button></a>
        </div>
      </div>
    </section>      
      <!-- Common footer ends -->
  

    </section>
  </section>
  <!-- Common_content Ends-->
  
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->

<div class="modal fade" id="confirmDialog" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    		<div class="modal-dialog">
       		<div class="modal-content">
            <div class="modal-body">
                <label> You already have ${foundGoal} ${goalTypeString}/s defined. Do you want to modify existing goal ?</label>
             </div>
            <div class="modal-footer">
             <button  class="btn btn-sm btn-success1 btn-primary"><i class="ace-icon fa fa-check bigger-110"></i>Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-sm btn-danger1 "><i class="ace-icon fa fa-close bigger-110 btn-primary"></i>No</button>
		             </div>
    </div>
  </div>
</div>
</div>
</div>
  <!--     this is Advice Recomendations Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Datepicker --> 
<script>

var productCategoryDropdown=[];
var allocationPercent=[];
var productDropdown=[];

$(function() {
    $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
	  showOn: "button",
	  buttonText: '',
     });
  });
  
$(document).ready(function(){		
		
	 var productCount="${productTypeCount}";
	 for(var i=1;i<=productCount;i++){
		 var categoryCount=$("#noOfDropdowns_"+i).val();
		 productCategoryDropdown=[];
		 allocationPercent=[];
		 productDropdown=[];
		 for(var j=1;j<categoryCount;j++){
			 
			var sliderVar = "#slider_"+ i +"_"+j;		 
			var allocationVar = "#allocationPercent_"+ i +"_"+j;
			var equitySliderValue = "#"+ i +"_SliderValue_"+j;
			createSliderAndSetValue1(sliderVar, 0, 100, 1, allocationVar, $(equitySliderValue).val());
			 
	  		var dropdownId="#productCategory_"+ i +"_"+j;	
	  		var dropdownValueId="#productCategoryValue_"+ i +"_"+j;
	  		var companyDropdownId="#companySelect_"+ i +"_"+j;	
	  		var productDropdownId="#productSelect_"+ i +"_"+j;
	  		
	  		
	  		$("#productCategoryId").val($(dropdownValueId).val());
	  		var id= "#productCategory_"+ i +"_"+j;
			var dropdownIdArray=id.split("_");
			var companyDropdown="#companySelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
			var companyDropdownValueId="#companySelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
			var productDropdown1="#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
			$(companyDropdownId).empty();
			//$(companyDropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: "---Select---"});
			$(companyDropdownId)
				.append($("<option></option>")
				.attr("value","-1")
				.text('-- Select --'));

			$(productDropdown1).empty();
			$(productDropdown1)
			.append($("<option></option>")
			.attr("value","-1")
			.text('-- Select --'));
			
			if($(dropdownValueId).val()=="-1"){
				$("#slider_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).slider("value", "0");
				$("#allocationPercent_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("0");	
				return false;
			}				
			$("#productCategoryId").val($(dropdownValueId).val());			
			var prod= $("#productCategoryId").val();
			if(prod != 0 && prod!='')
				jsonPopulateCompanyNames(companyDropdownId, prod, $(companyDropdownValueId).val());
			else {
				$(companyDropdownId)
				.append($("<option></option>")
				.attr("value",-1)
				.text("--Select--"));	
				$(companyDropdownId).val(-1);
			}
			if($(dropdownValueId).val() != '' && $(dropdownValueId).val() != 0 && $(dropdownValueId).val() != 'undefined' && $(dropdownValueId).val() != undefined) {
			 	$(dropdownId).val($(dropdownValueId).val());
			 }
			var id = "#companySelectValue_"+i+"_"+j;
			$("#manufacturerId").val($(id).val());			
			var dropdownIdArray=id.split("_");
			var productDropdown2="#productSelect_"+i+"_"+j;
			var productCategory="#productCategory_"+i+"_"+j;
			
			var productDropdownValueId="#productSelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];										
				 if($(companyDropdownValueId).val() != '' && $(companyDropdownValueId).val()!=0 && $(productCategory).val()!='' && $(productCategory).val()!=0 && $(companyDropdownValueId).val()!=undefined && $(companyDropdownValueId).val()!='undefined' && $(productDropdownValueId).val()!= undefined && $(productDropdownValueId).val() !='undefined')
				 jsonPopulateProductNames(productDropdown2, $(productCategory).val(),$(companyDropdownValueId).val(), $(productDropdownValueId).val());
	  		
	  		
	  		
			 $( "body" ).on( "change", dropdownId , function(){
					$("#productCategoryId").val(this.value);
					var dropdownIdArray=this.id.split("_");
					/* var noOfDropDowns=$("#noOfDropdowns_"+dropdownIdArray[1]).val();
					var selectedCategory=$("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]+" option:selected").text();
					if(dropdownIdArray[2]<=4){
						for(k=1;k<=4;k++){
							if(this.value!="-1" && dropdownIdArray[2]!=k){
								 if(this.value==$("#productCategory_"+dropdownIdArray[1]+"_"+k).val()){
									 $("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("-1");
									 var selectBox = $("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).selectBoxIt().data('selectBox-selectBoxIt');			    
									 selectBox.selectOption("-1");
									 displayMsg("You have already selected "+selectedCategory+" category.");
									 return false;
								 } 
							 }	
						}	
					}else{
						for(k=5;k<=noOfDropDowns;k++){
							if(this.value!="-1" && dropdownIdArray[2]!=k){
								 if(this.value==$("#productCategory_"+dropdownIdArray[1]+"_"+k).val()){
									 $("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("-1");
									 var selectBox = $("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).selectBoxIt().data('selectBox-selectBoxIt');			    
									 selectBox.selectOption("-1");
									 displayMsg("You have already selected "+selectedCategory+" category.");
									 return false;
								 } 
							 }	
						}
					} */
					var companyDropdown="#companySelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var companyDropdownValueId="#companySelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var productDropdown="#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					$(productDropdown).empty();
					//$(productDropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: "---Select---"});
					$(productDropdown)
    				.append($("<option></option>")
    				.attr("value","-1")
    				.text('-- Select --'));
					if(this.value=="-1"){
						$("#slider_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).slider("value", "0");
						$("#allocationPercent_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("0");	
					}					
					 $.ajax({
						url: "${pageContext.request.contextPath}/partner/loadCompanyNameList",
						type : "GET",
						data : {'categoryId' : $("#productCategoryId").val()},
						 success: function(msg){
							$(companyDropdown).empty();	
							$.each(msg, function(index, item) {	
								//$(companyDropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });		
								$(companyDropdown)
							    .append($("<option></option>")
							    .attr("value",item.value)
							    .text(item.text));
							}); 
							/* var selectBox = $(companyDropdown).selectBoxIt().data('selectBox-selectBoxIt');
							selectBox.selectOption($(companyDropdownValueId).val()); */							
							$(companyDropdown).val(-1);
						}
					}); 
				});
			 /* var selectBox = $(dropdownId).selectBoxIt().data('selectBox-selectBoxIt');			    
			 selectBox.selectOption($(dropdownValueId).val()); */
			 
			 $( "body" ).on( "change", companyDropdownId , function(){
					$("#manufacturerId").val(this.value);
					var dropdownIdArray=this.id.split("_");
					var productDropdown="#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var productCategory="#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var productDropdownValueId="#productSelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];										
					if($("#manufacturerId").val()!=""){
						 $.ajax({
							url: "${pageContext.request.contextPath}/partner/getProductDropDownvalues",
							type : "GET",
							data : {'categoryId' : $(productCategory).val(), 'manufactureId' : $("#manufacturerId").val()},
							 success: function(msg){
								 $(productDropdown).empty();
									$.each(msg, function(index, item) {	
										//$(productDropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });
										$(productDropdown)
									    .append($("<option></option>")
									    .attr("value",item.value)
									    .text(item.text));
										
									});
								/*  var selectBox = $(productDropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
								 selectBox.selectOption($(productDropdownValueId).val()); */
								 $(productDropdown).val(-1);
							}
						});	
					}
					
				});
			 $( "body" ).on( "change", productDropdownId , function(){
					var dropdownIdArray=this.id.split("_");
					var noOfDropDowns=$("#noOfDropdowns_"+dropdownIdArray[1]).val();
					var selectedProduct=$("#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]+" option:selected").text();
					//if(dropdownIdArray[2]<=4){
						for(k=1;k<=noOfDropDowns;k++){
							if(this.value!="-1" && dropdownIdArray[2]!=k){
								 if(this.value==$("#productSelect_"+dropdownIdArray[1]+"_"+k).val()){
									 //$("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("-1");
									 /* var selectBox = $("#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).selectBoxIt().data('selectBox-selectBoxIt');			    
									 selectBox.selectOption("-1"); */
									 $("#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val(-1);
									 displayMsg("You have already selected "+selectedProduct+" product.");
									 return false;
								 } 
							 }	
						}	
					/*}else{
						for(k=5;k<=noOfDropDowns;k++){
							if(this.value!="-1" && dropdownIdArray[2]!=k){
								 if(this.value==$("#productCategory_"+dropdownIdArray[1]+"_"+k).val()){
									 $("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("-1");
									 var selectBox = $("#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).selectBoxIt().data('selectBox-selectBoxIt');			    
									 selectBox.selectOption("-1");
									 displayMsg("You have already selected "+selectedCategory+" category.");
									 return false;
								 } 
							 }	
						}
					}*/					
				});
		    
			 if($("#productCategory_"+ i +"_"+j).val()!="-1"){
				 if($("#productCategoryRecordId_"+ i +"_"+j).val()){
					 productCategoryDropdown.push($("#productCategory_"+ i +"_"+j).val()+"_"+$("#productCategoryRecordId_"+ i +"_"+j).val());	 
				 }else{
					 productCategoryDropdown.push($("#productCategory_"+ i +"_"+j).val());
				 }
				 
				 allocationPercent.push($("#allocationPercent_"+ i +"_"+j).val());
				 if($("#isPreferredProduct_"+ i +"_"+j).val()){
					 productDropdown.push($("#productSelectValue_"+ i +"_"+j).val()+"_"+$("#isPreferredProduct_"+ i +"_"+j).val());	 
				 }else{
					 productDropdown.push($("#productSelectValue_"+ i +"_"+j).val());
				 }				 
			 }
		 }
		 $("#initialProductCategory_"+i).val(productCategoryDropdown);
		 $("#initialAllocationPercent_"+i).val(allocationPercent);
		 $("#initialProductIds_"+i).val(productDropdown);
	 }	 	 
	 
	 //$('#page_loader').fadeOut("1000");
	 
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
function jsonPopulateCompanyNames(dropdown, data, selectedVal) {
	$.ajax({
		
		url: "${pageContext.request.contextPath}/partner/loadCompanyNameList",
		type : "GET",
		data : {'categoryId' : data},
		 success: function(msg){
			 $(dropdown).empty();	
			$.each(msg, function(index, item) {	
				//$(companyDropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });
				$(dropdown)
				.append($("<option></option>")
				.attr("value",item.value)
				.text(item.text));						
			}); 					
			$(dropdown).val(selectedVal);
			//document.getElementById(dropdown).selected = true;
		}
	 });  
}

function jsonPopulateProductNames(dropdown, category, company, selectedVal) {
	$.ajax({			
		url: "${pageContext.request.contextPath}/partner/getProductDropDownvalues",
		type : "GET",
		data : {'categoryId' : category, 'manufactureId' : company},
		 success: function(msg){
			 $(dropdown).empty();	
			$.each(msg, function(index, item) {	
				//$(companyDropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });
				$(dropdown)
				.append($("<option></option>")
				.attr("value",item.value)
				.text(item.text));						
			}); 					
			$(dropdown).val(selectedVal);					
		}
	 });  
}
 function submitData(){
		checkData();
		if(errorMsg==""){
			/* compareData();
			if($("#actionFlag").val()==0){ 
				$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation/${assetHeader}');*/
			 //}else{
				$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/saveEmergencyPlanning');
			//} 			
			$("#recommendationForm").submit();	
		}else{
			displayMsg(errorMsg);
		}
	}

	function cancel(){
		//checkData();
		/* compareData();
		if($("#actionFlag").val()==0){ */
			$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
			$("#recommendationForm").submit();
		/* }else{
			$(".aa_up").html("<spring:message code='dataChanged' />");
			$(".aa_yes").click(function(){cancelPage()});	
			$(".overlay").fadeIn();
			$("#confirmDialog").fadeIn();
		} */
	}
	function cancelPage(){
		$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#recommendationForm").submit();
	}

	function compareData(){
		
		var flag=0;
		var productTypeCount="${productTypeCount}";
		 for(var i=1;i<=productTypeCount;i++){
			 var totalRows=$("#noOfDropdowns_"+i).val();
			 for(var j=1;j<totalRows;j++){
				 if(($("#initialProductCategory_"+i).val()!=$("#finalProductCategory_"+i).val()) || 
					 ($("#initialAllocationPercent_"+i).val()!=$("#finalAllocationPercent_"+i).val()) ||
					 ($("#initialProductIds_"+i).val()!=$("#finalProductIds_"+i).val())){
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

	function checkData(){
		 var productTypeCount="${productTypeCount}";
		 var allocationPercentTotal=0;
		 var categoryFlag=0;
		 var productCount=0;
		 errorMsg="";
		 for(var i=1;i<=productTypeCount;i++){
		 var totalRows=$("#noOfDropdowns_"+i).val();
		 allocationPercentTotal=0;
		 productCategoryDropdown=[];
		 allocationPercent=[];
		 productDropdown=[];
		 for(var j=1;j<totalRows;j++){
		 var categorySliderId = "#allocationPercent_"+ i +"_"+j;
		 if($("#productCategory_"+ i +"_"+j).val()!="-1"){
		 if($("#productCategoryRecordId_"+ i +"_"+j).val()){
		 productCategoryDropdown.push($("#productCategory_"+ i +"_"+j).val()+"_"+$("#productCategoryRecordId_"+ i +"_"+j).val());
		 }else{
		 productCategoryDropdown.push($("#productCategory_"+ i +"_"+j).val());
		 }
		 allocationPercent.push($(categorySliderId).val());
		 allocationPercentTotal=parseInt($(categorySliderId).val())+allocationPercentTotal;
		 if($(categorySliderId).val()<=0){
		 errorMsg="<spring:message code='percentGT0' />";
		 return false;
		 }
		 if($("#productSelect_"+ i +"_"+j).val()==-1){
		 errorMsg="<spring:message code='fillDataCorrectly' />";
		 return false;
		 }
		 if("undefined"!=$("#isPreferredProduct_"+ i +"_"+j).val() && null!=$("#isPreferredProduct_"+ i +"_"+j).val()){
		 productCount++;
		 productDropdown.push($("#productSelect_"+ i +"_"+j).val()+"_"+$("#isPreferredProduct_"+ i +"_"+j).val());
		 }else{
		 productCount++;
		 productDropdown.push($("#productSelect_"+ i +"_"+j).val());
		 }
		 categoryFlag = 1;
		 }else if($("#productCategoryRecordId_"+ i +"_"+j).val()){
		 productCategoryDropdown.push("0_"+$("#productCategoryRecordId_"+ i +"_"+j).val());
		 productDropdown.push("0_0");
		 }
		 if($(categorySliderId).val()>0 && $("#productCategory_"+ i +"_"+j).val()==-1){
		 errorMsg="<spring:message code='fillDataCorrectly' />";
		 return false;
		 }
		 if((j==4) && (categoryFlag==1)){//preferred products
		 if(allocationPercentTotal<100){
		 errorMsg="<spring:message code='preferredProductAllocation' />";
		 return false;
		 }else if(allocationPercentTotal>100){
		 errorMsg="<spring:message code='percentLT100' />";
		 return false;
		 }
		 allocationPercentTotal=0;
		 categoryFlag=0;
		 }
		 }
		 if(categoryFlag==1){
		 if(allocationPercentTotal<100){
		 errorMsg="<spring:message code='alternativeProductAllocation' />";
		 return false;
		 }else if(allocationPercentTotal>100){
		 errorMsg="<spring:message code='percentLT100' />";
		 return false;
		 }
		 }
		 $("#finalProductCategory_"+i).val(productCategoryDropdown);
		 $("#finalAllocationPercent_"+i).val(allocationPercent);
		 $("#finalProductIds_"+i).val(productDropdown);
		 }
		 if(productCount<=0){
		  errorMsg="<spring:message code='deleteDataGT0' />";
		  return false;
		 }
		 }
  
</script> 
<!-- Datepicker Ends -->

</body>
</html>
