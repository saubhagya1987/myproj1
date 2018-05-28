<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<title>${assetHeader}</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
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
<style>
.EP_cnt_title {
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
}
</style>
<script>
$(document).ready(function(){
	/* code to read add from xml 
	*/
	
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
        url : '${pageContext.request.contextPath}/resources/xml/BuConfuguration.xml',
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
        min: minVal,
        max: maxVal,
        step: stepBy,
        value: value,
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
				  		var selectBox = $(dropdownId).selectBoxIt().data('selectBox-selectBoxIt');
						selectBox.selectOption("-1");
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
  
  var productCategoryClass="";
  <c:forEach items="${adviceRecommendationMap}" var="adviceRecommendationLst" varStatus="mapCounter">
  	productCategoryClass=".productCategory_${mapCounter.count}";
  	$(productCategoryClass).selectBoxIt({
 		 populate: {"data": ${adviceRecommendationLst.value[0].productCategoryList}}
 	});  
  </c:forEach>
  
  var productCount="${productTypeCount}";
  for(var i=1;i<=productCount;i++){
	  
	  $(".companySelect_"+i).selectBoxIt({
	  		 populate: {"data":[
	  		                     {"value":"-1","text":"---Select---"}
	  		                   ]}
	  });
	  	
	  $(".productSelect_"+i).selectBoxIt({
	  		 populate: {"data":[
	  		                     {"value":"-1","text":"---Select---"}
	  		                   ]}
	  });	  	  	
	  
  }    
  	
	 // Calls the selectBoxIt method on your HTML select box
 
//<!-- Custom Selectbox Ends -->

//<!-- custom scroll to "common_in_content" -->
  
    $('.common_in_content').slimScroll();
    $('.EP_cnt').perfectScrollbar();

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
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}
function setDefaultValues(){
	if("${recordTypeId}"==14003){
		if("${assetHeader}" == "Emergency Planning"){
			$(".aa_up").html("<spring:message code='emergencyPlanning.dataReset' />");
		}else if("${assetHeader}" == "Loans"){
			$(".aa_up").html("<spring:message code='loans.dataReset' />");
		}		
		$(".aa_yes").on('click',function(){performReset();});		
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
<div class="wrapper" id="Emergency_Planning"> 
  <!-- Main starts-->
  
  <section class="main"> 
    <!-- Header Starts-->
    <header class="common_header inner_header">
      <section class="top_header clearfix"> <a href="#" class="setting fr"></a>
  <div class="logout_pop_up"><a href="#" class="myaccount_btn myAccountLink"><span class="my_acc_icon"> </span> <span class="my_acc_txt"> MY ACCOUNT</span></a> <a href="${pageContext.request.contextPath}/common/logout" class="logout_btn"><span class="my_logout_icon"> </span> <span class="my_logout_txt"> LOGOUT</span></a> </div>
  <section class="submenu"><!--<img class="submenu_arrow" src="${pageContext.request.contextPath}/resources/images/submenu_arrow.png" height="33" width="46" alt="">-->
    <div class="menu_section">
      <ul class="clearfix reset">
        <li class="fl menu chng_prof"><a href="${pageContext.request.contextPath}/partner/personal/info" class="anch changeProfileLink"><span class="icon"></span><span class="txt">Change Profile</span></a></li>
        <li class="fl menu adv_assum"><a href="${pageContext.request.contextPath}/partner/assumption" class="anch adviceAssumptionLink"><span class="icon"></span><span class="txt">Advice Assumptions</span></a></li>
        <li class="fl menu chang_pass"><a href="${pageContext.request.contextPath}/password/changePassword" class="anch changePasswordLink"><span class="icon"></span><span class="txt">Change Password</span></a>
        </li>
        <li class="fl menu adv_recomm"><a href="${pageContext.request.contextPath}/partner/recommendation" class="anch adviceRecommendationLink"><span class="icon"></span><span class="txt">Advice Recommendations</span></a></li>
        <li class="fl menu interested_fp"><a href="${pageContext.request.contextPath}/partner/getInterstedFpSection" class="anch fpSectionLink"><span class="icon"></span><span class="txt">FP Section </span></a></li>
        <li class="fl menu personalizationLink"><a href="${pageContext.request.contextPath}/partner/personal/info?viewId=8" class="anch personalizationLink"><span class="icon"></span><span class="txt">Personalization</span></a></li>
      </ul>
    </div>
   
<a href="#" class="anchor report_issue"><span class="icon fl"></span><span class="label fr">Report Issue</span></a>
  </section>
  <a href="#" class="header_add add2"><img src="" /></a> <a href="#" class="header_add add1"><img src="" /></a>
  <div class="fl" id="logo" style="max-height:61px; max-width:140px"><a href="${pageContext.request.contextPath}/partner/dashboard?flag=0">
  	<%
  	String photoPath = null;
  	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
  	if(userSession != null){
  		photoPath = userSession.getLogo();
  	}
  	%>
  	<%-- <img src="<%=FiinfraUtility.getImagePath(request, photoPath, "/resources/images/temp_logo.png") %>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a> --%>
    <%-- <c:choose>
	   <c:when test="${not empty photoPath}">
	   		<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
	   </c:when>
	   <c:otherwise>
	   		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>	
	   </c:otherwise>
    </c:choose> --%>
    
    <%-- <% if (photoPath==null || photoPath.isEmpty()) { %> 
		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>
   <% } else { %>
   		<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
    <% } %> --%>
    <%
		String x = "D:/Ffreedom-DI/images/"+photoPath;
		File file = new File(x);
	%>
	<%-- <c:out value="<%=x %>"></c:out> --%>
	<% if (file.exists() && !file.isDirectory()) { %> 
		<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath%>" style="-webkit-transform: scale(0.8,0.5);-ms-transform:scale(0.8,0.5);transform:scale(0.8,0.5); margin-top: -36px;" alt=""/></a>
   <% } else { %>
   		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" alt="" /></a>
    <% } %>
    
  </div>
<div class="clr"></div>
<div class="patner_name fr">Welcome<a href="${pageContext.request.contextPath}/partner/personal/info"> <span class="name">${userSession.name}</span></a></div>
<div class="clr"></div>
</section>
      <div class="page_header">
        <h1 class="heading clearfix"><a href="#" class="drop_menu"></a><a href="#" onclick="setDefaultValues();" class="set_default saveRecommendation${sectionTypeId}"><span class="set_default_txt">Set Default </span> </a><a href="#" class="email_btn" style="display:none;"><span class="email_txt">E mail</span> </a>  <span class="head_txt">${assetHeader}</span>
        <span class="heading_icon">
        <span class="head_icon">
        	<c:choose>
        		<c:when test="${assetHeader eq 'Risk Cover'}">
        			<img class="rp-margin" src="${pageContext.request.contextPath}/resources/images/risk-cover-icon.png" alt=""/></span>
        		</c:when>
        		<c:when test="${assetHeader eq 'Loans'}">
					<img class="rp-margin" src="${pageContext.request.contextPath}/resources/images/loans_advice.png" alt=""/></span>        		
        		</c:when>
        		<c:otherwise>
        			<img class="rp-margin" src="${pageContext.request.contextPath}/resources/images/emergency_advice.png" alt=""/></span>
        		</c:otherwise>
        	</c:choose>        	
        </span> </h1>
      </div>
    </header>
    <!-- Header Ends--> 
    
    <!-- Common_content Starts--><section class="content common_content">
     
     <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
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
     <div id="page_loader"></div>     
      <c:set var="productTypeId">0</c:set>
      <c:set var="productTypeCountTemp">0</c:set>
      <c:set var="preferredFlag">0</c:set>
      <c:set var="alternativeFlag">0</c:set>
      <c:set var="categoryCount">0</c:set>
      <div style="margin:0 20px;">
        <div id="Emergency_Planning_Tab">
        <c:forEach items="${adviceRecommendationMap}" var="adviceRecommendationLst" varStatus="mapCounter">        
        <c:set var="pieces" value="${fn:split(adviceRecommendationLst.key, '_')}"/>
        	<c:if test="${not(mapCounter.index eq 0)}">
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
        	    		<ul>
			              <li class="ep_one">
			                <div class="ep_left_label">${i}.</div>
			              </li>
			              <li class="ep_two">
			                <select class="ep productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${categoryCount}">			
			                </select>
			              </li>
			              <li class="ep_three">
			                <div class="ep_slider_bx">
			                  <div class="EP">
			                    <div class="range_parent">
			                      <div class="scale clearfix">
			                        <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
			                        <div id="slider_${productTypeCountTemp}_${categoryCount}"></div>
			                      </div>
			                      <div class="counter_parent">
			                        <input type="text" id="allocationPercent_${productTypeCountTemp}_${categoryCount}" class="range_counter" readonly="readonly">
			                        <span class="unit">%</span> </div>
			                    </div>
			                  </div>
			                  <div class="clr"></div>
			                </div>
			              </li>
			              <li class="ep_four">
			                <select class="ep companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${categoryCount}">			
			                </select>
			              </li>
			              <li class="ep_five">
			                <select class="ep productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${categoryCount}">			
			                </select>
			              </li>
			              <div class="clr"></div>
			            </ul>
			            <input name="${productTypeCountTemp}_SliderValue_${categoryCount}" id="${productTypeCountTemp}_SliderValue_${categoryCount}" type="hidden" value="0"/>
			            <c:set var="categoryCount">${categoryCount + 1}</c:set>
        	    	</c:forEach>
        	    	<input type="hidden" name="noOfDropdowns_${productTypeCountTemp}" id="noOfDropdowns_${productTypeCountTemp}" value="${categoryCount}"/>
        	    	<div class="clr"></div>
        			</div>
        		</c:if>        	
        	<h3>
        		<span class="slider_lbl">
        		${pieces[1]} <%-- <span>(${pieces[2]} %)</span> --%>
        		</span>
        		<div class="ep_slider_bx" style="margin: -24px 0px 8px 60px;color: white;">
                  <div class="EP">
                    <div class="range_parent">
                      <div class="scale clearfix">
                        <div class="scale_range"><span class="low extrem" style="color:white;">0%</span><span class="high extrem" style="color:white;">100%</span> </div>
                        <div id="slider_${productTypeCountTemp}"></div>
                      </div>
                      <div class="counter_parent">
                        <input type="text" name="allocationPercent_${pieces[0]}" id="allocationPercent_${productTypeCountTemp}" class="range_counter" readonly="readonly" style="color:white;">
                        <span class="unit" style="color:white;">%</span> </div>
                    </div>
                  </div>
                  <div class="clr"></div>
                </div>
                <input name="${productTypeCountTemp}_SliderValue" id="${productTypeCountTemp}_SliderValue" type="hidden" value="${pieces[2]}"/>
                <input type="hidden" id="initialProductTypeAllocationPercent" value="0"/>
                <input type="hidden" id="finalProductTypeAllocationPercent" value="0"/>
        	</h3>
        	<c:set var="productTypeId">${adviceRecommendation.productTypeId}</c:set>
        	<c:set var="productTypeCountTemp">${productTypeCountTemp + 1}</c:set>         		
        	<c:set var="preferredFlag">0</c:set>
      		<c:set var="alternativeFlag">0</c:set>      			
      		<c:set var="categoryCount">1</c:set>
        	<div class="EP_cnt">
      		<input type="hidden" name="initialProductCategory_${productTypeCountTemp}" id="initialProductCategory_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="initialAllocationPercent_${productTypeCountTemp}" id="initialAllocationPercent_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="initialProductIds_${productTypeCountTemp}" id="initialProductIds_${productTypeCountTemp}" value="0"/>
      		
      		<input type="hidden" name="finalProductCategory_${productTypeCountTemp}" id="finalProductCategory_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="finalAllocationPercent_${productTypeCountTemp}" id="finalAllocationPercent_${productTypeCountTemp}" value="0"/>
      		<input type="hidden" name="finalProductIds_${productTypeCountTemp}" id="finalProductIds_${productTypeCountTemp}" value="0"/>        	
        	<c:forEach items="${adviceRecommendationLst.value}" var="adviceRecommendation" varStatus="counter">        		
        		<%-- <c:choose>
        			<c:when test="${adviceRecommendation.ispreferredProduct eq 1}">
        				<c:if test="${preferredFlag eq 0}">
        					<div class="EP_cnt_title">Preferred</div>
        					<div class="AT_cnt_title">              
					            <ul>
					            	<li class="AR_two_two">Product Category</li>
					            	<li class="AR_three_one">Range</li>
					            	<li class="AR_four">% Shares</li>
					            	<li class="AR_five">Company</li>
					            	<li class="AR_six">Product</li>
					           </ul>             
 					       	</div>
        					<c:set var="preferredFlag">1</c:set>
        				</c:if>        				
        			</c:when>
        			<c:otherwise>--%>
        				<c:if test="${alternativeFlag eq 0}"> 
	        				<!-- <div class="EP_cnt_title">Alternative</div> -->
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
        				</c:if>             				   			
        			<%--</c:otherwise>
        		</c:choose> --%>
        	<ul>
              <li class="ep_one">
                <div class="ep_left_label">${categoryCount}.</div>
              </li>
              <li class="ep_two">
                <select class="ep productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="productCategoryValue_${productTypeCountTemp}_${categoryCount}" id="productCategoryValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.categoryId}"/>
                <input type="hidden" name="productCategoryRecordId_${productTypeCountTemp}_${categoryCount}" id="productCategoryRecordId_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.id}"/>
              </li>
              <li class="ep_three">
                <div class="ep_slider_bx">
                  <div class="EP">
                    <div class="range_parent">
                      <div class="scale clearfix">
                        <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
                        <div id="slider_${productTypeCountTemp}_${categoryCount}"></div>
                      </div>
                      <div class="counter_parent">
                        <input type="text" id="allocationPercent_${productTypeCountTemp}_${categoryCount}" class="range_counter" readonly="readonly">
                        <span class="unit">%</span> </div>
                    </div>
                  </div>
                  <div class="clr"></div>
                </div>
              </li>
              <li class="ep_four">
                <select class="ep companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="companySelectValue_${productTypeCountTemp}_${categoryCount}" id="companySelectValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.manufacturerId}"/>
              </li>
              <li class="ep_five">
                <select class="ep productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${categoryCount}">
                </select>
                <input type="hidden" name="productSelectValue_${productTypeCountTemp}_${categoryCount}" id="productSelectValue_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.productId}"/>
                <input type="hidden" name="isPreferredProduct_${productTypeCountTemp}_${categoryCount}" id="isPreferredProduct_${productTypeCountTemp}_${categoryCount}" value="${adviceRecommendation.ispreferredProduct}"/>
              </li>
              <div class="clr"></div>
            </ul>
            <input name="${productTypeCountTemp}_SliderValue_${categoryCount}" id="${productTypeCountTemp}_SliderValue_${categoryCount}" type="hidden" value="${adviceRecommendation.allocationPercentCategoryId}"/>
            <c:set var="categoryCount">${categoryCount + 1}</c:set>
        	</c:forEach>
        </c:forEach>
		<c:forEach begin="${categoryCount}" end="4" var="i">
        	   <c:if test="${alternativeFlag eq 0}">
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
        		</c:if>
        	   <ul>
			      <li class="ep_one">
			         <div class="ep_left_label">${i}.</div>
			      </li>
			      <li class="ep_two">
			         <select class="ep productCategory_${productTypeCountTemp}" id="productCategory_${productTypeCountTemp}_${categoryCount}">			
			         </select>
			      </li>
			      <li class="ep_three">
			        <div class="ep_slider_bx">
			           <div class="EP">
			              <div class="range_parent">
		                      <div class="scale clearfix">
		                        <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
		                        <div id="slider_${productTypeCountTemp}_${categoryCount}"></div>
		                      </div>
		                      <div class="counter_parent">
		                        <input type="text" id="allocationPercent_${productTypeCountTemp}_${categoryCount}" class="range_counter" readonly="readonly">
		                        <span class="unit">%</span> </div>
		                    </div>
			                </div>
			              <div class="clr"></div>
			          </div>
			     </li>
			     <li class="ep_four">
			       <select class="ep companySelect_${productTypeCountTemp}" id="companySelect_${productTypeCountTemp}_${categoryCount}">			
			       </select>
			     </li>
			     <li class="ep_five">
			       <select class="ep productSelect_${productTypeCountTemp}" id="productSelect_${productTypeCountTemp}_${categoryCount}">
			       </select>
			     </li>
			     <div class="clr"></div>
			   </ul>
			   <input name="${productTypeCountTemp}_SliderValue_${categoryCount}" id="${productTypeCountTemp}_SliderValue_${categoryCount}" type="hidden" value="0"/>
			   <c:set var="categoryCount">${categoryCount + 1}</c:set>
        	</c:forEach>
        	<input type="hidden" name="noOfDropdowns_${productTypeCountTemp}" id="noOfDropdowns_${productTypeCountTemp}" value="${categoryCount}"/>
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
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <c:if test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
        	    <li class="fl list"><a href="#" onclick="submitData();" class="anch save saveRecommendation${sectionTypeId}"><span class="txt">Save</span></a></li>
      	    </c:if>
            <li class="fl list"><a href="#" onclick="cancel();" class="anch cancel"><span class="txt">Cancel</span></a></li>
         <!-- <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li> --> </ul>
        </div>
        <!-- <a href="#" class="back navgation"><span class="txt">Back</span></a> <a href="risk-cover-advice-recommendation.html" class="next navgation"><span class="txt">Next</span></a> --> 
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
			 $( "body" ).on( "change", dropdownId , function(){
					$("#productCategoryId").val(this.value);
					var dropdownIdArray=this.id.split("_");
					var companyDropdown="#companySelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var companyDropdownValueId="#companySelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var productDropdown="#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					$(companyDropdown).empty();
					$(companyDropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: "---Select---"});
					$(productDropdown).empty();
					$(productDropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: "---Select---"});
					if(this.value=="-1"){
						$("#slider_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).slider("value", "0");
						$("#allocationPercent_"+dropdownIdArray[1]+"_"+dropdownIdArray[2]).val("0");	
						return false;
					}					
					$("#recommendationForm").ajaxSubmit({
						url: "${pageContext.request.contextPath}/partner/loadCompanyNameList",
						type : "GET",
						data : {'categoryId' : $("#productCategoryId").val()},
						 success: function(msg){
							$(companyDropdown).empty();	
							$.each(msg, function(index, item) {	
								$(companyDropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
							}); 
							var selectBox = $(companyDropdown).selectBoxIt().data('selectBox-selectBoxIt');
							selectBox.selectOption($(companyDropdownValueId).val());
						}
					}); 
				});
			 var selectBox = $(dropdownId).selectBoxIt().data('selectBox-selectBoxIt');			    
			 selectBox.selectOption($(dropdownValueId).val());
			 $( "body" ).on( "change", companyDropdownId , function(){
					$("#manufacturerId").val(this.value);
					var dropdownIdArray=this.id.split("_");
					var productDropdown="#productSelect_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var productCategory="#productCategory_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];
					var productDropdownValueId="#productSelectValue_"+dropdownIdArray[1]+"_"+dropdownIdArray[2];										
					if($("#manufacturerId").val()!=""){
						$("#recommendationForm").ajaxSubmit({
							url: "${pageContext.request.contextPath}/partner/getProductDropDownvalues",
							type : "GET",
							data : {'categoryId' : $(productCategory).val(), 'manufactureId' : $("#manufacturerId").val()},
							 success: function(msg){
								 $(productDropdown).empty();
									$.each(msg, function(index, item) {	
										$(productDropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
									});
								 var selectBox = $(productDropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
								 selectBox.selectOption($(productDropdownValueId).val());
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
								var selectBox = $(dropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
								selectBox.selectOption("-1");
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
			$(".aa_up").html("<spring:message code='dataChanged' />");
			$(".aa_yes").click(function(){cancelPage()});	
			$(".overlay").fadeIn();
			$("#confirmDialog").fadeIn();
		}
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
