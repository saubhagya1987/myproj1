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
<title>Emergency Planning</title>
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" /> --%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css"> --%>
<%-- <%if(theme != null){ %>
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
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script> --%>
 <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-1.11.0.min.js"></script> 
<style>
/* .EP_cnt_title {
	padding: 15px 12px 24px 15px;
}
.EP_cnt ul {
	padding-top: 8px;
}
.EP_cnt ul {
	margin-bottom: 8px;
}
#Emergency_Planning_in + .common_footer_actions .btn_grup3 {
	width: 221px;
}
.common_footer_actions #main_actions {
	width: 250px;
}
#confirmDialog {
display: block;
height: 130px;
display: none;
width: 355px;
box-shadow: 0 0 15px 1px #757575;
}
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
} */


.heading_icon{line-height: 84px !important;}


.accordion-style1.panel-group .panel-heading .accordion-toggle{min-height: 60px !important; padding: 9px !important;}


#Emergency_Planning_in .accordion-style1 .panel-heading .slider_lbl{font-family: "allerregular"; font-size:15px;}
.accordion-style1.panel-group .panel-heading .accordion-toggle{font-weight: normal !important;}


.accordion-style1.panel-group .panel-heading .accordion-toggle{/* background-color: rgba(149, 39, 84, 0.3) !important; */ background-color:#c0c0c0 !important; color:#fff !important;}
.accordion-style1.panel-group .panel-heading .accordion-toggle.collapsed{background-color: grey !important; color:#fff !important;}
.accordion-style1.panel-group .panel-heading .accordion-toggle.hover{background-color: pink !important;}

#Emergency_Planning_in .accordion-style1 .panel-body .col-sm-1,#Emergency_Planning_in .accordion-style1 .AT_cnt_title .col-md-1 {width: 3% !important;}
#Emergency_Planning_in .accordion-style1 .panel-body .col-sm-2 {width: 21% !important;}


#Emergency_Planning_in .accordion-style1 .AT_cnt_title .col-md-3{width: 20% !important;}  


</style>
<script>
$(document).ready(function(){
	/* code to read add from xml */
	
	var partnerSetupLinks = "${partnerSetupLinks}";
	var pieces = partnerSetupLinks.split(",");
	if(pieces != ""){
		for(var i=0;i<pieces.length;i++){
			$("."+pieces[i]).attr("href","#");
			$("."+pieces[i]).addClass("inactiveLink");
		}
	}
	
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
	
	var SectionName;
	var ImagePathForAdInDc1;
	var Url;
	var buIdInSession = ${userSession.buId};
	$.ajax({
        type: "GET",
        url : '${pageContext.request.contextPath}/xml/BuConfuguration.xml',
		dataType: "xml",
        success: function(xml) {
            var flag=0;
        	$(xml).find('Bu').each(function(i,obj){
        		var buId= $(this).attr('Id');
        		  $(obj).find('Section').each(function(i,obj){
        			  SectionName = $(this).attr('Name');
        			  if(buId==buIdInSession){
            			    if(SectionName=='Header_add')
	        				  {
		        				  $(obj).find('Configuration').each(function(i,obj){ 
		        					  ImagePathForAdInDc1 =$(this).attr('ImagePath');
		        					  if(i==0){/* if image not present */
		        						if(ImagePathForAdInDc1==null || ImagePathForAdInDc1==""){
		        							 $(".header_add.add1").css('display','none');	
			        						}
		        						else{
		        						ImagePathForAdInDc1 = '${pageContext.request.contextPath}/'+ImagePathForAdInDc1;	
			        			    	$(".header_add.add1 img").attr("src",ImagePathForAdInDc1);
		        						}
		        					  }
		        					  else if(i==1){/* if image not present */
		        						if(ImagePathForAdInDc1==null || ImagePathForAdInDc1==""){
			        						$(".header_add.add2").css('display','none');	
				        				}
		        						else{
		        						ImagePathForAdInDc1 = '${pageContext.request.contextPath}/'+ImagePathForAdInDc1;
		        						$(".header_add.add2 img").attr("src",ImagePathForAdInDc1);
		        						}
		        					  }
			        				
			        			  });   
		        			     
	        				  }
	        				 flag=1;  
        			  }
        			  if(flag==1)
            		{
                  		return false;
            		}
        			  else
            		 {
                 		  $(".header_add.add2").css('display','none');
        				  $(".header_add.add1").css('display','none');
            		 }   
        						 					       			  
        		  });
        		
        		
        	});
        }	
	 });
});
</script>
<script>
 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
 (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
 })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

 ga('create', 'UA-48212643-3', 'auto');
 ga('send', 'pageview');

</script>
<script>
var flag=0;
var sliderId="";
var pieces=[];

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
        		for(var i=1;i<=totalRows;i++){        			
        			if($("#allocationPercent_"+pieces[1]+"_"+i).val()){
        				totalValue=parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val())+totalValue;
            			if(sliderId!=(pieces[1]+"_"+i)){
            				unallocatedPercent=unallocatedPercent-parseInt($("#allocationPercent_"+pieces[1]+"_"+i).val());
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

flag=0;
sliderId="";
pieces=[];

function createSliderAndSetValue2(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,value) {

    $(ctrlName).slider({
    	value: value,
		range: "min",
		min: minVal,
        max: maxVal,
        step: stepBy,
        slide: function (event, ui) {
        	if(flag==0){
        		var pieces=ctrlName.split("_");            	
            	sliderId=""+pieces[1];
            	flag=1;
        	} 
           
        	$(ctrlTextBox).val(ui.value);
			
        },
        change: function(event,ui){
        	if(flag==1){
        		flag=0;				
        		var unallocatedPercent=100;
        		pieces=ctrlName.split("_");
        		var id=parseInt(pieces[1])+1;
        		var totalRows=$("#noOfDropdowns_"+id).val();
				if($("#allocationPercent_"+sliderId).val()=="0"){						
					for(var i=1;i<totalRows;i++){
						$("#slider_"+id+"_"+i).slider("value", "0");
						$("#allocationPercent_"+id+"_"+i).val("0");
						var dropdownId="#productCategory_"+ id +"_"+i;	
				  		var companyDropdownId="#companySelect_"+ id +"_"+i;	
				  		var productDropDownId="#productSelect_"+ id +"_"+i;
				  		//var selectBox = $(dropdownId).selectBoxIt().data('selectBox-selectBoxIt');
						//selectBox.selectOption("-1");
						$(dropdownId).val(-1);
						$(dropdownId+"SelectBoxItContainer").addClass('inactiveLink');
						$("#slider_"+id+"_"+i).addClass('inactiveLink');
						$(companyDropdownId+"SelectBoxItContainer").addClass('inactiveLink');
						$(productDropDownId+"SelectBoxItContainer").addClass('inactiveLink');
					}
					return false;
        		}else{
        			for(var i=1;i<totalRows;i++){
        				var dropdownId="#productCategory_"+ id +"_"+i;	
    			  		var companyDropdownId="#companySelect_"+ id +"_"+i;	
    			  		var productDropDownId="#productSelect_"+ id +"_"+i;
    					$(dropdownId+"SelectBoxItContainer").removeClass('inactiveLink');
    					$("#slider_"+id+"_"+i).removeClass('inactiveLink');
    					$(companyDropdownId+"SelectBoxItContainer").removeClass('inactiveLink');
    					$(productDropDownId+"SelectBoxItContainer").removeClass('inactiveLink');
        			}        			
        		}        		
        		totalRows="${productTypeCount}";
        		var totalValue=0;
        		for(var i=0;i<totalRows;i++){
        			        			
					if($("#allocationPercent_"+i).val()){
        				totalValue=parseInt($("#allocationPercent_"+i).val())+totalValue;
            			if(sliderId!=(i)){
            				unallocatedPercent=unallocatedPercent-parseInt($("#allocationPercent_"+i).val());
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
    $( "#Emergency_Planning_Tab" ).accordion({ animate: 200 });
  });

</script>



<!-- Fuel type starts -->
<script>
$(document).ready(function(){
  $(".thumb_select_ul a").click(function(){
	
    $(this).children(".categoery").toggleClass("not_applicable");

  });
//<!-- Fuel type ends -->
//<!-- Custom Selectbox starts -->     
  
  /* $("#successDialog").dialog();
  $(document).on("dialogopen", "#successDialog", function(event, ui) {
  	setTimeout("$('#successDialog').dialog('close')",3000);
  });
  		
  $("#confirmDialog .close").click(function(){
	    $(".overlay").fadeOut("slow");
		$("#confirmDialog").fadeOut("slow");
		 }); */
  
  <c:if test="${not empty success}">
  $(".modal-body").html("<spring:message code="${success}" />");
  $(".btn-success1").html("OK");
  $(".btn-success1").on('click',function(){
  	closeDialog();
  });		
  $(".btn-danger1").hide();
  $('#confirmDialog').modal('show');
  </c:if>

  <c:if test="${not empty error}">
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
 	$(productCategoryClass).val(-1);
  </c:forEach>
  //$(productCategoryClass).change();
  var productCount="${productTypeCount}";
  for(var i=1;i<=productCount;i++){
	  
	 /*  $(".companySelect_"+i).selectBoxIt({
	  		 populate: {"data":[
	  		                     {"value":"-1","text":"---Select---"}
	  		                   ]}
	  });
	  	
	  $(".productSelect_"+i).selectBoxIt({
	  		 populate: {"data":[
	  		                     {"value":"-1","text":"---Select---"}
	  		                   ]}
	  });	  	  	
	   */
	   
	  $(".companySelect_"+i)
	    .append($("<option></option>")
	    .attr("value","-1")
	    .text('-- Select --'));
	   $(".companySelect_"+i).val(-1);
	   $(".productSelect_"+i)
	    .append($("<option></option>")
	    .attr("value","-1")
	    .text('-- Select --'));
	   $(".productSelect_"+i).val(-1);
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
	window.location.href="${pageContext.request.contextPath}/partner/goalPlanSetDefault/recommendation?optionalURL=${assetHeader}&sectionTypeId=${sectionTypeId}";
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

/* function confirmCancel(msg){
	$(".modal-body").html(msg);
	$(".btn-success").on('click',function(){
		$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#vacationPlanningform").submit();
	});			
	$('#confirmDialog').modal('show');
	} */
function setDefaultValues(){
	if("${recordTypeId}"==14003){
		if("${assetHeader}" == "Emergency Planning"){			
			$(".modal-body").html("<spring:message code='emergencyPlanning.dataReset' />");
		}else if("${assetHeader}" == "Loans"){			
			$(".modal-body").html("<spring:message code='loans.dataReset' />");
		}		
		$(".btn-success1").on('click',function(){performReset();});			
		$('#confirmDialog').modal('show');	
	}else{
		
		$(".modal-body").html("<spring:message code='dataAlreadyRestored' />");
		$(".btn-success1").html("Ok");
		$(".btn-success1").on('click',function(){closeDialog();});
		$(".btn-danger1").hide();
		$('#confirmDialog').modal('show');	
	}
}
</script>
<!-- Type of emergency faced select ends -->

</head>

<body>

<!-- this is Advice Recomendations header -->
<jsp:include page="header.jsp"></jsp:include>

<!-- Wrapper starts-->
<div class="wrapper" id="Emergency_Planning"> 
  <!-- Main starts-->
  
  <section class="main"> 
        <!-- Header Starts-->
    <header class="common_header inner_header">
     
      <div class="page_header">
        <h1 class="heading clearfix">

          <span class="head_txt">Emergency Planning</span><span class="heading_icon"><i class="ace-icon fa icon-emergency-planning bigger-130"></i></span>
         <button class="btn btn-sm btn-warning pull-right set_default" onclick="setDefaultValues();">
												<i class="ace-icon fa fa-fire bigger-110"></i>
												<span class="bigger-110 no-text-shadow">Set Default</span>
											</button>
		  </h1>
          
      </div>
    </header>
    <!-- Header Ends--> 
    
    <!-- Common_content Starts--><section class="content common_content">
     
     
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
<!--      <div id="page_loader"></div>      -->
      <c:set var="productTypeId">0</c:set>
      <c:set var="productTypeCountTemp">0</c:set>
      <c:set var="preferredFlag">0</c:set>
      <c:set var="alternativeFlag">0</c:set>
      <c:set var="categoryCount">0</c:set>
      <div style="margin:0 20px;">
      
      <div class="space"></div>

										
        <div id="" class="accordion-style1 panel-group">
        <c:forEach items="${adviceRecommendationMap}" var="adviceRecommendationLst" varStatus="mapCounter">        
        <c:set var="pieces" value="${fn:split(adviceRecommendationLst.key, '_')}"/>
        	<c:if test="${not(mapCounter.index eq 0)}">
        			<c:if test="${i eq 1 }">
        			<div class="panel-collapse collapse in" id="collapseOne">
        			<div class="panel-body EM_PL">
        			</c:if>        			
        	    	<c:forEach begin="${categoryCount}" end="4" var="i">        	    	
        	    		<%-- <c:if test="${alternativeFlag eq 0}">
	        				<div class="EP_cnt_title">Alternative</div>
	        				<div class="AT_cnt_title">              
					            <ul>
					            	<li class="AR_two_two">Product Category</li>
					            	<li class="AR_three_one">Range</li>
					            	<li class="AR_four">% Shares</li>
					            	<li class="AR_five">Company</li>
					            	<li class="AR_six">Product</li>
					           </ul>             
 					       </div> 
	        				<c:set var="alternativeFlag">1</c:set>
        				</c:if> --%>        	    		
        	    		<div class="form-group">            
             				<div class="row">
			              
			                <div class="col-sm-1 col-xs-12 hidden-xs">${i}.</div>
			             
			             <div class="col-sm-2 col-xs-12">
			                <select class=" form-control productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${categoryCount}">			
			                </select>
			             </div>
			               <div class="hr14"></div>
			               
			               <div class="col-sm-4 col-xs-12">
			                <div class="col-sm-12 col-xs-12">
			                    <div class="range_parent">
			                      <div class="scale clearfix">
			                      <div class="col-sm-7 col-xs-6">			                        
			                        <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">100</span> </div>
			                        <div id="slider_${productTypeCountTemp}_${categoryCount}" class="help-block"></div>	
			                        </div>	
			                        <div class="space-8" ></div>	
			                        <div class="col-sm-5 col-xs-6">                      
			                      <div class="counter_parent">
			                        <input type="text" id="allocationPercent_${productTypeCountTemp}_${categoryCount}" class="col-xs-9 range_counter answers required  Number1" readonly="readonly">
			                        <span class="unit">%</span> </div>
			                        </div>
			                        </div>
			                    </div>
			                    <div class="space hidden-md visible-xs"> </div>			                
			                </div>
			              </div>
			              <div class="hr14"></div>
			              <div class="col-sm-2 col-xs-12">			              
			                <select class=" form-control companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${categoryCount}">			
			                </select>
			                </div>
			                <div class="hr14"></div>
			                <div class="col-sm-2 col-xs-12">			              			            
			                <select class=" form-control productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${categoryCount}">			
			                </select>			              
			              </div>
			              <div class="hr14"></div>			              
			           </div>
			           </div>
			           <div class="hr hr-dotted hr-16"></div>
			            <input name="${productTypeCountTemp}_SliderValue_${categoryCount}" id="${productTypeCountTemp}_SliderValue_${categoryCount}" type="hidden" value="0"/>
			            <c:set var="categoryCount">${categoryCount + 1}</c:set>
        	    	</c:forEach>
        	    	<input type="hidden" name="noOfDropdowns_${productTypeCountTemp}" id="noOfDropdowns_${productTypeCountTemp}" value="${categoryCount}"/>
        	    	
        	    	</div>
        			</div>        			
        		</c:if>        	
        	<div class="panel panel-default">
        	<div class="panel-heading">
        	    <h4 class="panel-title">	
        	    	<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
        	    		<div class="col-sm-2 col-xs-12 slider_lbl"> ${pieces[1]}</div>
        	    		<div class="col-sm-4 col-xs-11">
                			<div class="range_parent">
                 	    		<div class="scale clearfix">
                 	    			<div class="col-sm-7 col-xs-6">
                      					<div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">100</span> </div>
                      					<div class="help-block" id="slider_${productTypeCountTemp}"></div>
                    				</div>
                    				<div class="space-10" ></div>
                    				<div class="col-sm-5 col-xs-6">
                     					<div class="counter_parent">
                        					<input class="col-xs-9 range_counter answers required  Number1" type="text" name="allocationPercent_${pieces[0]}" id="allocationPercent_${productTypeCountTemp}" placeholder="0" />
                     					</div>
                      					<span class="unit dynamic">%</span>
                      				</div>
                 	    		</div>
                 	    	</div>
                 	    </div>
                 	    	 <i class="ace-icon fa fa fa-toggle-up bigger-140 pull-right" data-icon-hide="ace-icon fa fa-toggle-up" data-icon-show="ace-icon fa fa-toggle-down"></i>        	    			
        	    			<input name="${productTypeCountTemp}_SliderValue" id="${productTypeCountTemp}_SliderValue" type="hidden" value="${pieces[2]}"/>
                			<input type="hidden" id="initialProductTypeAllocationPercent" value="0"/>
                			<input type="hidden" id="finalProductTypeAllocationPercent" value="0"/>        	    		        	    		
        	    	</a>
        	  	</h4>
        	</div>
        	<c:set var="productTypeId">${adviceRecommendation.productTypeId}</c:set>
        	<c:set var="productTypeCountTemp">${productTypeCountTemp + 1}</c:set>         		
        	<c:set var="preferredFlag">0</c:set>
      		<c:set var="alternativeFlag">0</c:set>      			
      		<c:set var="categoryCount">1</c:set>
      		
      		<input type="hidden" name="initialProductCategory_${productTypeCountTemp}" id="initialProductCategory_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="initialAllocationPercent_${productTypeCountTemp}" id="initialAllocationPercent_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="initialProductIds_${productTypeCountTemp}" id="initialProductIds_${productTypeCountTemp}" value="0"/>
      		
      		<input type="hidden" name="finalProductCategory_${productTypeCountTemp}" id="finalProductCategory_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="finalAllocationPercent_${productTypeCountTemp}" id="finalAllocationPercent_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="finalProductIds_${productTypeCountTemp}" id="finalProductIds_${productTypeCountTemp}" value="0"/>

			<div class="panel-collapse collapse in" id="collapseOne">
				        				
			 <div class="AT_cnt_title hidden-xs">     
				            	<div class="row">
					            	<div class="col-md-1"></div>
					            	<div class="col-md-3">Product Category</div>
					            	<div class="col-md-4">Range (% Shares)</div>
					            	<div class="col-md-3">Company</div>
					            	<div class="col-md-3">Product</div>
				            	</div>            
          					</div>
          		<div class="panel-body EM_PL">      		        	
        	<c:forEach items="${adviceRecommendationLst.value}" var="adviceRecommendation" varStatus="counter">        		        		
        	<div class="form-group">            
             <div class="row">
              
                <div class="col-sm-1 col-xs-12 hidden-xs">${categoryCount}.</div>
             
              <div class="col-sm-2 col-xs-12">           
             	<div class="AT_cnt_title hidden-md visible-xs">
              		<div class="row"><div class="col-md-3 col-xs-12">Product Category</div></div>
          		</div>
          		
                <select class=" form-control productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="productCategoryValue_${productTypeCountTemp}_${categoryCount}" id="productCategoryValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.categoryId}"/>
                <input type="hidden" name="productCategoryRecordId_${productTypeCountTemp}_${categoryCount}" id="productCategoryRecordId_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.id}"/>
              </div>
              
              <div class="hr14"></div>             
              			<div class="col-sm-4 col-xs-12">
              			<div class="AT_cnt_title hidden-md visible-xs">
              				<div class="row"><div class="col-md-3 col-xs-12">Range (% Shares)</div></div>
          				</div>
			                <div class="col-sm-12 col-xs-12">
			                    <div class="range_parent">
			                      <div class="scale clearfix">
			                      <div class="col-sm-7 col-xs-6">			                        
			                        <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">100</span> </div>
			                        <div id="slider_${productTypeCountTemp}_${categoryCount}" class="help-block"></div>	
			                        </div>	
			                        <div class="space-8" ></div>	
			                        <div class="col-sm-5 col-xs-6">                      
			                      <div class="counter_parent">
			                        <input type="text" id="allocationPercent_${productTypeCountTemp}_${categoryCount}" class="col-xs-9 range_counter answers required  Number1" readonly="readonly">
			                        <span class="unit">%</span> </div>
			                        </div>
			                        </div>
			                    </div>
			                    <div class="space hidden-md visible-xs"> </div>			                
			                </div>
			              </div>
			      <div class="hr14"></div>
              <div class="col-sm-2 col-xs-12">                
                  <div class="AT_cnt_title hidden-md visible-xs">
              		<div class="row"><div class="col-md-3 col-xs-12">Company</div></div>
          		</div>
                <select class=" form-control companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="companySelectValue_${productTypeCountTemp}_${categoryCount}" id="companySelectValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.manufacturerId}"/>
             </div>
             <div class="hr14"></div>
             
              <div class="col-sm-2 col-xs-12">                
                  <div class="AT_cnt_title hidden-md visible-xs">
              	  <div class="row"><div class="col-md-3 col-xs-12">Product</div></div>
          	 </div>
                <select class="ep productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="productSelectValue_${productTypeCountTemp}_${categoryCount}" id="productSelectValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.productId}"/>
                <input type="hidden" name="isPreferredProduct_${productTypeCountTemp}_${categoryCount}" id="isPreferredProduct_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.ispreferredProduct}"/>
              </div>
              <div class="hr14"></div>
              
            </div>
            </div>
            <div class="hr hr-dotted hr-16"></div>
            <input name="${productTypeCountTemp}_SliderValue_${categoryCount}" id="${productTypeCountTemp}_SliderValue_${categoryCount}" type="hidden" value="${adviceRecommendation.allocationPercentCategoryId}"/>
            <c:set var="categoryCount">${categoryCount + 1}</c:set>
        	</c:forEach>
        	<c:if test="${categoryCount eq 4 }">
        	</div>
        	</div>
        	</c:if>
        	
        </c:forEach>
        
        
		<c:forEach begin="${categoryCount}" end="4" var="i">		
        	   <%-- <c:if test="${alternativeFlag eq 0}">
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
        		</c:if> --%>        		
        		<c:if test="${i eq 1 }">
        			<div class="panel-collapse collapse in" id="collapseOne">
        			<div class="panel-body EM_PL">
        			</c:if> 
        	   <div class="form-group">            
             <div class="row">
              
                <div class="col-sm-1 col-xs-12 hidden-xs">${categoryCount}.</div>
             
              <div class="col-sm-2 col-xs-12">           
             	<div class="AT_cnt_title hidden-md visible-xs">
              		<div class="row"><div class="col-md-3 col-xs-12">Product Category</div></div>
          		</div>
          		
                <select class=" form-control productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="productCategoryValue_${productTypeCountTemp}_${categoryCount}" id="productCategoryValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.categoryId}"/>
                <input type="hidden" name="productCategoryRecordId_${productTypeCountTemp}_${categoryCount}" id="productCategoryRecordId_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.id}"/>
              </div>
              
              <div class="hr14"></div>             
              			<div class="col-sm-4 col-xs-12">
              			<div class="AT_cnt_title hidden-md visible-xs">
              				<div class="row"><div class="col-md-3 col-xs-12">Range (% Shares)</div></div>
          				</div>
			                <div class="col-sm-12 col-xs-12">
			                    <div class="range_parent">
			                      <div class="scale clearfix">
			                      <div class="col-sm-7 col-xs-6">			                        
			                        <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">100</span> </div>
			                        <div id="slider_${productTypeCountTemp}_${categoryCount}" class="help-block"></div>	
			                        </div>	
			                        <div class="space-8" ></div>	
			                        <div class="col-sm-5 col-xs-6">                      
			                      <div class="counter_parent">
			                        <input type="text" id="allocationPercent_${productTypeCountTemp}_${categoryCount}" class="col-xs-9 range_counter answers required  Number1" readonly="readonly">
			                        <span class="unit">%</span> </div>
			                        </div>
			                        </div>
			                    </div>
			                    <div class="space hidden-md visible-xs"> </div>			                
			                </div>
			              </div>
			      <div class="hr14"></div>
              <div class="col-sm-2 col-xs-12">                
                  <div class="AT_cnt_title hidden-md visible-xs">
              		<div class="row"><div class="col-md-3 col-xs-12">Company</div></div>
          		</div>
                <select class=" form-control companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="companySelectValue_${productTypeCountTemp}_${categoryCount}" id="companySelectValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.manufacturerId}"/>
             </div>
             <div class="hr14"></div>
             
              <div class="col-sm-2 col-xs-12">                
                  <div class="AT_cnt_title hidden-md visible-xs">
              	  <div class="row"><div class="col-md-3 col-xs-12">Product</div></div>
          	 </div>
                <select class="ep productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="productSelectValue_${productTypeCountTemp}_${categoryCount}" id="productSelectValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.productId}"/>
                <input type="hidden" name="isPreferredProduct_${productTypeCountTemp}_${categoryCount}" id="isPreferredProduct_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.ispreferredProduct}"/>
              </div>
              <div class="hr14"></div>
              
            </div>
            </div>
            <div class="hr hr-dotted hr-16"></div>
			   <input name="${productTypeCountTemp}_SliderValue_${categoryCount}" id="${productTypeCountTemp}_SliderValue_${categoryCount}" type="hidden" value="0"/>
			   <c:set var="categoryCount">${categoryCount + 1}</c:set>
        	</c:forEach>
        	<input type="hidden" name="noOfDropdowns_${productTypeCountTemp}" id="noOfDropdowns_${productTypeCountTemp}" value="${categoryCount}"/>           
          </div>
          
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
      <!-- <div class="row">
        <div class="col-sm-1 col-xs-3">
          <button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-back bigger-240 red"></i> Back </button>
        </div> -->
        
        <c:choose>
        	<c:when test="${assetHeader eq 'Risk Cover'}">        			  
				<a href="${pageContext.request.contextPath}/partner/recommendation/emergencyPlanning.htm"><div class="col-sm-1 col-xs-3">
           		<button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-back bigger-240"></i> Back </button>
           		</div></a>		
        	</c:when>
        		
        	<c:when test="${assetHeader eq 'Loans'}">					
				<a href="${pageContext.request.contextPath}/partner/goalPlanning.htm"><div class="col-sm-1 col-xs-3">
          		<button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-back bigger-240"></i> Back </button>
        		</div></a>       
        	</c:when>
        	        	
        	<c:otherwise>        			
				<a href="${pageContext.request.contextPath}/productrecommendations.htm"><div class="col-sm-1 col-xs-3">
          		<button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-back bigger-240"></i> Back </button>
        		</div></a>       
        	</c:otherwise>        	
        </c:choose>   
        	
        <div class="col-sm-10 col-xs-6">
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-4 col-xs-0">
           
          </div>
          <div class="col-sm-3 col-xs-12">
          <c:choose>
        		<c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
            <button class="btn btn-app btn-transparent btn-xs saveRecommendation${sectionTypeId}" onclick="submitData();"> <i class="ace-icon fa icon-save bigger-200"></i> Save </button>
            </c:when>
            </c:choose>
            <button class="btn btn-app btn-transparent btn-xs" onclick="cancel();"> <i class="ace-icon fa icon-cancel bigger-200"></i> Cancel </button>
          </div>
          <div class="col-sm-4 col-xs-0">
           
          </div>
          <div class="col-sm-1 col-xs-0"></div>
          <div class="col-sm-1 col-xs-0"></div>
        </div>
        <!-- <div class="col-sm-1 col-xs-3">
          <button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-next bigger-240 red"></i> Next </button>
        </div> -->
        
			<c:choose>
        		<c:when test="${assetHeader eq 'Risk Cover'}">        			          
					<a href="${pageContext.request.contextPath}/partner/goalPlanning.htm">
					<div class="col-sm-1 col-xs-3">
          			<button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-next bigger-240 red"></i> Next </button>
        			</div>
					</a>
        		</c:when>
        		
        		<c:when test="${assetHeader eq 'Loans'}">					             	
					<a href="${pageContext.request.contextPath}/partner/taxPlanning.htm"><div class="col-sm-1 col-xs-3">
          			<button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-next bigger-240 red"></i> Next </button>
        			</div>
        			</a>
        		</c:when>
        		
        		<c:otherwise>        			                 		
				<a href="${pageContext.request.contextPath}/partner/recommendation/riskCover.htm"><div class="col-sm-1 col-xs-3">
          		<button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa icon-next bigger-240 red"></i> Next </button>
        		</div></a>
        		</c:otherwise>
        	</c:choose>   
        
        
      </div>
    </section>      
      <!-- Common footer ends -->
      
      <div class="overlay"></div>
    </section>
 

</section>
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 

  <!--     this is Advice Recomendations Footer -->
<jsp:include page="footer.jsp"></jsp:include>

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
<!-- <div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        Do you really want to delete this data?</div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div> -->
<!-- Datepicker --> 

		
<script>

var productCategoryDropdown=[];
var allocationPercent=[];
var productDropdown=[];
var productTypeAllocationPercent=[];

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
		 
		 var sliderVar = "#slider_"+ (i-1);		 
		 var allocationVar = "#allocationPercent_"+ (i-1);
		 var equitySliderValue = "#"+ (i-1) +"_SliderValue";
		 createSliderAndSetValue2(sliderVar, 0, 100, 1, allocationVar, $(equitySliderValue).val());
		 productTypeAllocationPercent.push($(equitySliderValue).val());		 
		 
		 for(var j=1;j<categoryCount;j++){
			 
			var sliderVar = "#slider_"+ i +"_"+j;		 
			var allocationVar = "#allocationPercent_"+ i +"_"+j;
			var equitySliderValue = "#"+ i +"_SliderValue_"+j;
			createSliderAndSetValue1(sliderVar, 0, 100, 1, allocationVar, $(equitySliderValue).val());
			 
	  		var dropdownId="#productCategory_"+ i +"_"+j;	
	  		var dropdownValueId="#productCategoryValue_"+ i +"_"+j;
	  		var companyDropdownId="#companySelect_"+ i +"_"+j;	
	  		var productDropDownId="#productSelect_"+ i +"_"+j;
	  		
	  		if($(dropdownValueId).val() != '' && $(dropdownValueId).val() != 0 && $(dropdownValueId).val() != 'undefined' && $(dropdownValueId).val() != undefined) {
	  			$(dropdownId).val($(dropdownValueId).val());	  	
	  		}
	  		
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
			var id = "#companySelectValue_"+i+"_"+j;
			$("#manufacturerId").val($(id).val());			
			var dropdownIdArray=id.split("_");
			var productDropdown2="#productSelect_"+i+"_"+j;
			var productCategory="#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
			var productDropdownValueId="#productSelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];										
				 if($(companyDropdownValueId).val() != '' && $(companyDropdownValueId).val()!=0 && $(productCategory).val()!='' && $(productCategory).val()!=0 && $(companyDropdownValueId).val()!=undefined && $(companyDropdownValueId).val()!='undefined' && $(productDropdownValueId).val()!= undefined && $(productDropdownValueId).val() !='undefined')
				 jsonPopulateProductNames(productDropdown2, $(productCategory).val(),$(companyDropdownValueId).val(), $(productDropdownValueId).val());
			
				 $( "body" ).on( "change", dropdownId , function(){
				 $("#productCategoryId").val(this.value);
					var dropdownIdArray=this.id.split("_");
					var companyDropdown="#companySelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var companyDropdownValueId="#companySelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var productDropdown="#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					$(companyDropdown).empty();
					//$(companyDropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: "---Select---"});
					$(companyDropdown)
	    				.append($("<option></option>")
	    				.attr("value","-1")
	    				.text('-- Select --'));
	   
					$(productDropdown).empty();
					$(productDropdown)
    				.append($("<option></option>")
    				.attr("value","-1")
    				.text('-- Select --'));
					
					if(this.value=="-1"){
						$("#slider_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).slider("value", "0");
						$("#allocationPercent_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("0");	
						return false;
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
							//var selectBox = $(companyDropdown).selectBoxIt().data('selectBox-selectBoxIt');
							//selectBox.selectOption($(companyDropdownValueId).val());
							//$(companyDropdown).val($(companyDropdownValueId).val());
						}
					}); 
			 });
			 //var selectBox = $(dropdownId).selectBoxIt().data('selectBox-selectBoxIt');			    
			 //selectBox.selectOption($(dropdownValueId).val());
			 //$(dropdownId).val($(dropdownValueId).val());
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
								 //var selectBox = $(productDropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
								 //selectBox.selectOption($(productDropdownValueId).val());
								 //$(productDropdown).val($(productDropdownValueId).val());
							}
						});	
					}
					
				});			 
			 $( "body" ).on( "change", productDropDownId , function(){
				 var pieces=this.id.split("_");
				 var dropDownId="#productSelect_"+pieces[1]+"_"+pieces[2];
				 var selectedProduct=$(dropDownId+" option:selected").text();
				 for(i=1;i<=4;i++){
					 var productId="#productSelect_"+pieces[1]+"_"+i;
					 if($(dropDownId).val()!=-1 && dropDownId!=productId){
						 if($(dropDownId).val()==$(productId).val()){
								$(dropDownId).val("-1");
								//var selectBox = $(dropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
								//selectBox.selectOption("-1");
								displayMsg("You have already selected "+selectedProduct+" product.");
							 } 
					 }					 
				 }
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
	 $("#initialProductTypeAllocationPercent").val(productTypeAllocationPercent);
	 
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

 function submitData(){
		checkData();
		if(errorMsg==""){
			compareData();
			if($("#actionFlag").val()==0){
				displayMsg("<spring:message code='dataNotChanged' />");
        		return false;
				//$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation/${assetHeader}');
			}else{
				$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/saveEmergencyPlanning');
			}
			
			$("#recommendationForm").submit();	
		}else{
			displayMsg(errorMsg);
		}
	}

	function cancel(){
		checkData();
		compareData();
		if($("#actionFlag").val()==0){
			$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
			$("#recommendationForm").submit();
		}else{
			/* $(".aa_up").html("<spring:message code='dataChanged' />");
			$(".aa_yes").click(function(){cancelPage()});	
			$(".overlay").fadeIn();
			$("#confirmDialog").fadeIn(); */
			confirmCancel("<spring:message code='dataChanged' />");
		}
	}
	
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
	function confirmCancel(msg){
		$(".modal-body").html(msg);
		$(".btn-success1").on('click',function(){
			$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
			$("#recommendationForm").submit();
		});			
		$('#confirmDialog').modal('show');
		}
	
	function cancelPage(){
		$('#recommendationForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#recommendationForm").submit();
	}

	function compareData(){
		
		var flag=0;
		var productTypeCount="${productTypeCount}";
		if($("#initialProductTypeAllocationPercent").val()!=$("#finalProductTypeAllocationPercent").val()){
			 flag=1;
		 }
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
		 var productCount=0;
		 productTypeAllocationPercent=[];
		 var categoryFlag=0;
		 errorMsg="";
		 var totalPTAllocation=0;
		 for(var i=1;i<=productTypeCount;i++){
		 var totalRows=$("#noOfDropdowns_"+i).val();
		 allocationPercentTotal=0;
		 categoryFlag=0;
		 productCategoryDropdown=[];
		 allocationPercent=[];
		 productDropdown=[];
		 var productTypeSliderId = "#allocationPercent_"+ (i-1);
		 var tempPTPercent=parseFloat($(productTypeSliderId).val()).toFixed(1);
		 productTypeAllocationPercent.push(tempPTPercent);
		 totalPTAllocation=(parseFloat(totalPTAllocation)+parseFloat(tempPTPercent)).toFixed(1);
		 for(var j=1;j<totalRows;j++){
		 var categorySliderId = "#allocationPercent_"+ i +"_"+j;
		 if($("#productCategory_"+ i +"_"+j).val()!="-1"){
		 categoryFlag=1;
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
		 if(($("#productSelect_"+ i +"_"+j).val()==-1) || ($("#productSelect_"+ i +"_"+j).val()==null)){
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
		 }else if($("#productCategoryRecordId_"+ i +"_"+j).val()){
		 productCategoryDropdown.push("0_"+$("#productCategoryRecordId_"+ i +"_"+j).val());
		 productDropdown.push("0_0");
		 }
		 if($(categorySliderId).val()>0 && $("#productCategory_"+ i +"_"+j).val()==-1){
		 errorMsg="<spring:message code='fillDataCorrectly' />";
		 return false;
		 }
		 }
		 if(allocationPercentTotal<100 && categoryFlag==1){
		 errorMsg="<spring:message code='catgoryAllocation' />";
		 return false;
		 }
		 $("#finalProductCategory_"+i).val(productCategoryDropdown);
		 $("#finalAllocationPercent_"+i).val(allocationPercent);
		 $("#finalProductIds_"+i).val(productDropdown);
		 }
		 if(totalPTAllocation<100){
		 errorMsg="<spring:message code='productTypeAllocation' />";
		 return false;
		 }
		 $("#finalProductTypeAllocationPercent").val(productTypeAllocationPercent);
		 if(productCount<=0){
			  errorMsg="<spring:message code='deleteDataGT0' />";
			  return false;
			 }
		 }
  
</script> 
<!-- Datepicker Ends -->

</body>
</html>
