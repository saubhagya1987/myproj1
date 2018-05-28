<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<title>Goal Plan</title>
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css" />

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_unit_selector.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script> --%>
<style>
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
<!-- intilazie custom checkbox starts-->
<script>

var flag=0;
var equitySlider=0;
var debtSlider=0;
var goldSlider=0;
var sliderId="";
var pieces=[];
var unallocatedPercent=0;

function createSliderAndSetValue1(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,value) {
	
	flag=0;
	
    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        value: value,
        slide: function (event, ui) {
        	if(flag==0){
        		var pieces=ctrlName.split("_");

            	if(pieces[2]==0){
            		sliderId=""+pieces[1]+"_"+0;
            		unallocatedPercent=100-(parseInt($("#allocationPercent_input_"+pieces[1]+"_"+1).val())+
            				parseInt($("#allocationPercent_input_"+pieces[1]+"_"+2).val()));
            	}else if(pieces[2]==1){
            		sliderId=""+pieces[1]+"_"+1;
            		unallocatedPercent=100-(parseInt($("#allocationPercent_input_"+pieces[1]+"_"+0).val())+
            				parseInt($("#allocationPercent_input_"+pieces[1]+"_"+2).val()));
            	}else if(pieces[2]==2){
            		sliderId=""+pieces[1]+"_"+2;
            		unallocatedPercent=100-(parseInt($("#allocationPercent_input_"+pieces[1]+"_"+0).val())+
            				parseInt($("#allocationPercent_input_"+pieces[1]+"_"+1).val()));
            	}

            	flag=1;
        	} 
           
        	$(ctrlTextBox).val(ui.value);
			
        },
        change: function(event,ui){
        	if(flag==1){
        		flag=0;        		
        		pieces=ctrlName.split("_");
        		equitySlider=$("#allocationPercent_input_"+pieces[1]+"_"+0).val();
            	debtSlider=$("#allocationPercent_input_"+pieces[1]+"_"+1).val();
            	goldSlider=$("#allocationPercent_input_"+pieces[1]+"_"+2).val();
        		var totalValue=parseInt(equitySlider)+parseInt(debtSlider)+parseInt(goldSlider);        		
        		if(totalValue>100){
            		$("#allocationPercent_input_"+sliderId).val(unallocatedPercent);
            		$("#slider_"+sliderId).slider('value',unallocatedPercent);
            		displayMsg("<spring:message code='percentLT100' />");
            		return false;
            	}
        	}
        	if(ui.value=="0"){
        		$("#goalAssetTypesDiv_"+sliderId).addClass("inactiveLink");
        	}else{
        		$("#goalAssetTypesDiv_"+sliderId).removeClass("inactiveLink");
        	}
        	//flag=1;
        }
        
    });
    $(ctrlTextBox).val($(ctrlName).slider("value"));

    $(ctrlTextBox).keyup(function () { 
        $(ctrlName).slider('value', $(ctrlTextBox).val());
    });
    
	
}

	$(document).ready(function() {
			
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

				//<!-- custom scroll to "common_in_content" -->

				$('.common_in_content').slimScroll();
				//<!-- custom scroll to "common_in_content" -->
				
			});

	function closeDialog(){
		$(".overlay").fadeOut("slow");
    	$("#confirmDialog").fadeOut("slow");
	}
	function performReset(){
		window.location.href="${pageContext.request.contextPath}/partner/goalPlanSetDefault/goalPlanning?sectionTypeId=${sectionTypeId}";
	}
	function setDefaultValues(){
		if("${recordTypeId}"==14003){
			$(".aa_up").html("<spring:message code='goalPlanning.dataReset' />");
			$(".aa_yes").on('click',function(){performReset();});	
			var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="performReset();">Yes </a> ';
			innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
			$(".aa_down").html(innerHTML);
			$(".overlay").fadeIn();
			$("#confirmDialog").fadeIn();			
		}else{
			displayMsg("<spring:message code='dataAlreadyRestored' />");
		}

	}
	function displayMsg(msg){
		$("#successDialog").html(msg);
		 $( "#successDialog").dialog( "open" );
	}
	function cancelPage(){
		$('#goalRecommendaionForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#goalRecommendaionForm").submit();
	}

</script>
<!-- Type of emergency faced select ends -->

</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper" id="advice_assumption"> 
  <!-- Main starts-->
  
  <form id="goalRecommendaionForm" method="post" action="<c:url value="/partner/saveGoalPlanning" />" name="goalRecommendaionForm">
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
                 <li class="fl menu interested_fp"><a href="${pageContext.request.contextPath}/partner/getInterstedFpSection" class="anch"><span class="icon"></span><span class="txt">FP Section</span></a></li>
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
        <h1 class="heading clearfix"> <a href="#" onclick="setDefaultValues();" class="set_default"><span class="set_default_txt">Set Default </span> </a><a href="#" class="goal_plan_email" style="display:none;"><span class="email_txt">E mail</span> </a> 
        <a href="${pageContext.request.contextPath}/partner/goal/view-bucket-allocation/-1/40003" class="view"><span class="view_txt">View</span> </a> <span class="head_txt">Goal Plan</span><span class="heading_icon"><span class="head_icon"><img src="${pageContext.request.contextPath}/resources/images/goal_plan.png" alt="" width="31" height="32" class="rp-margin"/></span></span> <span class="inst_type">
          <ul>
            <c:choose>
            	<c:when test="${riskProfileId eq 40001}">
					<li>           		
		  				<a class="con_act" id="conservative" href="#" onClick="searchRecommendationData(40001);"><span>Conservative</span></a>
		            </li>
		            <li class="head_mar"></li>
		            <li>
		            	<a class="bal" href="#" id="balanced" onClick="searchRecommendationData(40002);"><span>Balanced</span></a>
		            </li>
		            <li class="head_mar"></li>
		            <li>
		              <a class="agg" href="#" id="aggressive" onClick="searchRecommendationData(40003);"> <span>Aggressive</span></a>
		            </li>
            	</c:when>
            	<c:when test="${riskProfileId eq 40002}">
            		<li>           		
		  				<a class="con" id="conservative" href="#" onClick="searchRecommendationData(40001);"><span>Conservative</span></a>
		            </li>
		            <li class="head_mar"></li>
		            <li>
		            	<a class="bal_act" href="#" id="balanced" onClick="searchRecommendationData(40002);"><span>Balanced</span></a>
		            </li>
		            <li class="head_mar"></li>
		            <li>
		              <a class="agg" href="#" id="aggressive" onClick="searchRecommendationData(40003);"> <span>Aggressive</span></a>
		            </li>
            	</c:when>
            	<c:otherwise>
            		<li>           		
		  				<a class="con" id="conservative" href="#" onClick="searchRecommendationData(40001);"><span>Conservative</span></a>
		            </li>
		            <li class="head_mar"></li>
		            <li>
		            	<a class="bal" href="#" id="balanced" onClick="searchRecommendationData(40002);"><span>Balanced</span></a>
		            </li>
		            <li class="head_mar"></li>
		            <li>
		              <a class="agg_act" href="#" id="aggressive" onClick="searchRecommendationData(40003);"> <span>Aggressive</span></a>
		            </li>
            	</c:otherwise>
            </c:choose>
          </ul>
          </span> </h1>
      </div>
    </header>
    <!-- Header Ends--> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
      <!-- Common_in_contnet starts-->
      <div class="GP_title">
      <!-- Map iteration -->     
        <div style="float: left; font-family: allerregular; font-size: 15px; height: 30px; line-height: 29px; margin-left: 50px;">Years To Goal</div>
        <div style="float: left; font-family: allerregular; font-size: 15px; height: 30px; line-height: 29px; margin-left: 170px;"> Asset Class</div>
        
         <div style="float: left; font-family: allerregular; font-size: 15px; height: 30px; line-height: 29px; margin-left: 250px;"> Allocated %</div>
         
          <div style="float: left; font-family: allerregular; font-size: 15px; height: 30px; line-height: 29px; margin-left: 60px;"> Associated Product Types</div>
      </div>
      	<input type="hidden" id="goalDataMapSize" name="goalDataMapSize" value="${goalDataMapSize}"/>
      	<input type="hidden" id="goalYearRange" name="goalYearRangeId" value="0"/>
      	<input type="hidden" id="assetClassId" name="assetClassId" value="0"/>
      	<input type="hidden" id="allocationPercent" name="allocationPercent" value="0"/>
      	<input type="hidden" id="recommendationId" name="recommendationId" value="0"/>      	
      	<input type="hidden" id="finalData" name="finalData" value="0"/>
      	<input type="hidden" id="finalGoalRangeData" name="finalGoalRangeData" value="0"/>
      	<input type="hidden" id="finalAdviceRecommendId" name="finalAdviceRecommendId" value="0"/>
      	<input type="hidden" id="recordTypeId" name="recordTypeId" value="${recordTypeId}"/>
      	<input type="hidden" if="sectionTypeId" name="sectionTypeId" value="${sectionTypeId}"/>
      <section id="Goal_Plan" class="in_content common_in_content clearfix">  
      <div id="page_loader" style="display:none;"></div>    	 
      	<input type="hidden" id="riskProfileId" name="riskProfileId" value="${riskProfileId}"/>      	
		<c:forEach var="goalEntry" items="${goalDataMap}" varStatus="parentCount">
	        <div class="GP_title_cnt" >
	          <ul>
	            <li class="gp_one">
	              <div class="left_label"><c:out value="${goalEntry.key}"></c:out></div>
	            </li>
	    	<li class="gp_two">
	    	<c:forEach var="recommendation" items="${goalEntry.value}" varStatus="count">
	    		
			 
           
              <div class="gp_slider_bx">
             <c:choose>
             	<c:when test="${recommendation.assetClassId==46001}">
              		<label class="form_label">Equity</label>
              	</c:when>
             	<c:when test="${recommendation.assetClassId==46002}">
              		<label class="form_label">Debt</label>
              	</c:when>     
             	<c:when test="${recommendation.assetClassId==46003}">
              		<label class="form_label">Gold</label>
              	</c:when>              	         	
              </c:choose>
                <div class="GP">
                  <div class="range_parent">
                    <div class="scale clearfix">
                      <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>
                      <div id="slider_${parentCount.index}_${count.index}"></div>
                    </div>
                    <div class="counter_parent">
                      <input type="text" id="allocationPercent_input_${parentCount.index}_${count.index}" class="range_counter" value="${recommendation.allocationPercent}" readonly="readonly">
                      <input type="hidden" id="goalRange_input_${parentCount.index}_${count.index}" value="${recommendation.goalYearRangeId}"/>
                      <input type="hidden" id="adviceRecommendId_input_${parentCount.index}_${count.index}" value="${recommendation.id}"/>
                      <span class="unit">%</span> </div>
                  </div>                 
                </div>
                <div class="clr"></div>
              </div>

            <div class="clr"></div>
             
            
	    	</c:forEach>
	    	</li>
	    	
	    	<li class="gp_three">
			<c:forEach var="recommendation" items="${goalEntry.value}" varStatus="count">             
              <div class="icon_box">
                <%-- <div class="icon clearfix"><a href="${pageContext.request.contextPath}/partner/goalPlanAssetTypes"> --%>                
                  <c:choose>
                  	<c:when test="${(recommendation.countOfProductTypes gt 0) and (recommendation.allocationPercent gt 0)}">
                  		<div class="icon clearfix" id="goalAssetTypesDiv_${parentCount.index}_${count.index}">
	                  		<a href="#" onclick="loadGoalPlanAssetTypes(${recommendation.goalYearRangeId},${recommendation.assetClassId},'${parentCount.index}','${count.index}');">
		                  		<div class="category"> <img src="${pageContext.request.contextPath}/resources/images/asset_icon.png" class="cross_circle" height="33" width="33" alt=""/></div>
		                  	</a>
		                </div>	
                  	</c:when>
                  	<c:otherwise>
                  		<div class="icon clearfix inactiveLink" id="goalAssetTypesDiv_${parentCount.index}_${count.index}">
		                  	<a href="#" onclick="loadGoalPlanAssetTypes(${recommendation.goalYearRangeId},${recommendation.assetClassId},'${parentCount.index}','${count.index}');">
		                  		<div class="category"> <img src="${pageContext.request.contextPath}/resources/images/asset_icon.png" class="cross_circle" height="33" width="33" alt=""/></div>
		                  	</a>
		                </div>
                  	</c:otherwise>
                  </c:choose>                
              </div>
            			
			</c:forEach>	 
			</li>
			
			<li class="gp_four">
			<c:forEach var="recommendation" items="${goalEntry.value}" varStatus="count">
            
              <input name="input" type="text" disabled class="common_input gp-comment" value="(${recommendation.countOfProductTypes})">
            
			</c:forEach>
	    	</li>	
	    	 <div class="clr"></div>	
          </ul>
        </div>	   	 	    		   	 
		</c:forEach>          
        
      </section>
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      <section id="Footer_Type_Two" class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup">
            </li>
            <li class="fl list"><a href="#" class="anch save" onclick="submitData();"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel" onclick="cancel();"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
      </section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
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
        <spring:message code="deleteRecord" /></div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div>

<script type="text/javascript">
var saveData = [];
var goalRangeData = [];
var adviceRecommendIdData = [];
var initialData = [];
var flag = 1;
function searchRecommendationData(riskProfileId){

	if(riskProfileId==40001){
		$("#conservative").addClass("con_act");
		$("#conservative").removeClass("con");
		$("#balanced").addClass("bal");
		$("#balanced").removeClass("bal_act");
		$("#aggressive").addClass("agg");
		$("#aggressive").removeClass("agg_act");
	}else if(riskProfileId==40002){
		$("#conservative").removeClass("con_act");
		$("#conservative").addClass("con");
		$("#balanced").removeClass("bal");
		$("#balanced").addClass("bal_act");
		$("#aggressive").addClass("agg");
		$("#aggressive").removeClass("agg_act");
	}else if(riskProfileId==40003){
		$("#aggressive").addClass("agg_act");
		$("#conservative").removeClass("con_act");
		$("#conservative").addClass("con");
		$("#balanced").addClass("bal");
		$("#balanced").removeClass("bal_act");
		$("#aggressive").removeClass("agg");
	}	  
	
	$("#riskProfileId").val(riskProfileId);
	var recordTypeId=0;
	$("#goalRecommendaionForm").ajaxSubmit({
		url: "${pageContext.request.contextPath}/partner/getRecommendationDataForRiskProfile",
		type : "GET",
		dataType : "json",		
		data : {'riskProfileId': riskProfileId},
		success: function(goalMap){
			
			$('#Goal_Plan').html("");
			var newHtmlCode = "";		
			
			var counter = 0;			
			$.each( goalMap, function( parentCount, goalList ) {
				
				newHtmlCode = newHtmlCode +'<input type="hidden" id="riskProfileId" name="riskProfileId" value="'+riskProfileId +'"/>' +
			        '<div class="GP_title_cnt" >' +
			          '<ul>' +
			            '<li class="gp_one">' +
			              '<div class="left_label">'+ goalList[0].goalYearRange +'</div>' +
			            '</li>' +
			            '<li class="gp_two">';
				$.each(goalList, function(index, goal){
							    									 				          
							  newHtmlCode = newHtmlCode 
							  +'<div class="gp_slider_bx">';
				              if(goal.assetClassId==46001){
				            	  newHtmlCode = newHtmlCode + '<label class="form_label">Equity</label>';
				              }
				              else if(goal.assetClassId==46002){
				            	  newHtmlCode = newHtmlCode + '<label class="form_label">Debt</label>';
				              }
				              else if(goal.assetClassId==46003){
				            	  newHtmlCode = newHtmlCode + '<label class="form_label">Gold</label>';
				              }

				              newHtmlCode = newHtmlCode + '<div class="GP">'
				               + '<div class="range_parent">'
				                +    '<div class="scale clearfix">'
				                 +     '<div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span> </div>'
				                  +    '<div id="slider_'+counter+'_'+index+'"></div>'
				                  +  '</div>'
				                   + ' <div class="counter_parent">'
				                    + ' <input type="text" id="allocationPercent_input_'+counter+'_'+index+'" class="range_counter" value="'+goal.allocationPercent+'" readonly="readonly">'
				                    +' <input type="hidden" id="goalRange_input_'+counter+'_'+index+'" value="'+goal.goalYearRangeId+'"/> '
				                    +' <input type="hidden" id="adviceRecommendId_input_'+counter+'_'+index+'" value="'+goal.id+'"/> '
				                    +  '<span class="unit">%</span> </div>'
				                  +'</div>'                 
				                +'</div>'
				                +'<div class="clr"></div>'
				              +'</div>'

				            +'<div class="clr"></div>';	
				            
				              recordTypeId=goal.recordTypeId;
						});	
			            
			            newHtmlCode = newHtmlCode + '</li>'					    	
					    	+'<li class="gp_three">';
					    	
					    	$.each(goalList, function(index, goal){            
					    		newHtmlCode = newHtmlCode +'<div class="icon_box">'
					    		if((goal.allocationPercent > 0) && (goal.countOfProductTypes > 0)){
					    			newHtmlCode = newHtmlCode +'<div class="icon clearfix" id="goalAssetTypesDiv_'+counter+'_'+index+'"><a href="#" onclick="loadGoalPlanAssetTypes('+ goal.goalYearRangeId +','+ goal.assetClassId +','+ counter +','+ index +')" >'
					                  +'<div class="category"> <img src="${pageContext.request.contextPath}/resources/images/asset_icon.png" class="cross_circle" height="33" width="33" alt=""/></div>'
					                  +'</a> </div>'	
					    		}else{
					    			newHtmlCode = newHtmlCode +'<div class="icon clearfix inactiveLink" id="goalAssetTypesDiv_'+counter+'_'+index+'"><a href="#" onclick="loadGoalPlanAssetTypes('+ goal.goalYearRangeId +','+ goal.assetClassId +','+ counter +','+ index +')" >'
					                  +'<div class="category"> <img src="${pageContext.request.contextPath}/resources/images/asset_icon.png" class="cross_circle" height="33" width="33" alt=""/></div>'
					                  +'</a> </div>'
					    		}
					    		
				                newHtmlCode = newHtmlCode +'</div>';		 
					    		
							});	 
					    	
							newHtmlCode = newHtmlCode + '</li>'
							+'<li class="gp_four">';
							
							$.each(goalList, function(index, goal){
								if(goal.countOfProductTypes == null)
								{
									newHtmlCode = newHtmlCode +
				              			'<input name="input" type="text" disabled class="common_input gp-comment" value="(0)">';
								}
								else{
									newHtmlCode = newHtmlCode +
			              			'<input name="input" type="text" disabled class="common_input gp-comment" value="('+ goal.countOfProductTypes+')">';
								}
								newHtmlCode = newHtmlCode +'<br/>';
								
							});
							newHtmlCode = newHtmlCode + '</li>'	
					    	 +'<div class="clr"></div>'	
				          +'</ul>'
				        +'</div>';   	
						counter++;
			});
			
			$('#Goal_Plan').html(newHtmlCode);
			
			
			var goalDataMapSize = $("#goalDataMapSize").val();	
			//alert('goalDataMapSize ' + goalDataMapSize);
			for(var i=0;i<goalDataMapSize;i++){
				for(var j=0;j<3;j++){
					var sliderVar = "#slider_"+i+"_"+j;
					var allocationVar = "#allocationPercent_input_"+i+"_"+j; 
					createSliderAndSetValue1(sliderVar, 0, 100, 1, allocationVar, $(allocationVar).val());
				}
			}
			
			$("#recordTypeId").val(recordTypeId);
		},
		error: function(data){
			displayMsg('Error : ' + data);
			
		},
		
	})	
	saveInitialData();
}

$(document).ready(function(){	
	var goalDataMapSize = $("#goalDataMapSize").val();	
	for(var i=0;i<goalDataMapSize;i++){
		for(var j=0;j<3;j++){
			var sliderVar = "#slider_"+i+"_"+j;
			var allocationVar = "#allocationPercent_input_"+i+"_"+j; 
			createSliderAndSetValue1(sliderVar, 0, 100, 1, allocationVar, $(allocationVar).val());
			//initialData.push($(allocationVar).val());
		}
	}	
		
	var x = document.getElementById("goalRecommendaionForm");
	for (var i=0; i<x.length; i=i+2) 
	{
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!='finalGoalRangeData'
		   	 && x.elements[i].id!='finalData' && x.elements[i].id!='finalAdviceRecommendId')
	   	{
	   		initialData[i] = x.elements[i].value;
	    }
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
	
function saveInitialData(){
	
	initialData=[];
	var goalDataMapSize = $("#goalDataMapSize").val();	
	for(var i=0;i<goalDataMapSize;i++){
		for(var j=0;j<3;j++){
			var sliderVar = "#slider_"+i+"_"+j;
			var allocationVar = "#allocationPercent_input_"+i+"_"+j; 
			createSliderAndSetValue1(sliderVar, 0, 100, 1, allocationVar, $(allocationVar).val());
			//initialData.push($(allocationVar).val());
		}
	}
	
	 $( document ).ajaxComplete(function() {
		var x = document.getElementById("goalRecommendaionForm");
	    for (var i=0; i<x.length; i=i+2) 
	    {
		   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!='finalGoalRangeData'
			   	 && x.elements[i].id!='finalData' && x.elements[i].id!='finalAdviceRecommendId')
		   	{
		   		initialData[i] = x.elements[i].value;
		    }
	    }
		}); 
	
}
	
var percentTotalFlag=1;
function submitData(){
	percentTotalFlag=1;
	checkData();
	compareData();
	if(percentTotalFlag==0){
		displayMsg("<spring:message code='assetAllocation' />");
		return false;
	}
	
	if(flag == 1){
		$('#goalRecommendaionForm').attr('action', '${pageContext.request.contextPath}/partner/goalPlanning');
	}
	$("#goalRecommendaionForm").submit();
}
function cancel(){
	checkData();
	compareData();
	if(flag == 1){
		$('#goalRecommendaionForm').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#goalRecommendaionForm").submit();
	}else{
		$(".aa_up").html("<spring:message code='dataChanged' />");
		var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="cancelPage();">Yes </a> ';
		innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
		$(".aa_down").html(innerHTML);
		/* $(".aa_yes").on('click',function(){cancelPage();}); */
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}
}

function compareData(){
	flag=1;
	for(var i=0;i<saveData.length;i++){
		if(saveData[i]!=initialData[i]){
			flag=0;
		}
	}
}

function checkData(){
	saveData=[];
	var goalDataMapSize = $("#goalDataMapSize").val();
	var percentTotal=0;	
	for(var i = 0; i< goalDataMapSize; i++){
		percentTotal=0;
		for(var j = 0; j < 3; j++){
			var allocationVar = "#allocationPercent_input_"+i+"_"+j;
			var goalRangeVar="#goalRange_input_"+i+"_"+j;
			var adviceRecommendIdVar="#adviceRecommendId_input_"+i+"_"+j;
			percentTotal=percentTotal+parseInt($(allocationVar).val());
			saveData.push($(allocationVar).val());
			goalRangeData.push($(goalRangeVar).val());
			adviceRecommendIdData.push($(adviceRecommendIdVar).val());
		}
		if(percentTotal<100){
			percentTotalFlag=0;
		}
	}
	
	$("#finalGoalRangeData").val(goalRangeData);
	$("#finalData").val(saveData);
	$("#finalAdviceRecommendId").val(adviceRecommendIdData);
	
	saveData = [];
	
	var x = document.getElementById("goalRecommendaionForm");
    for (var i=0; i<x.length; i=i+2) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!='finalGoalRangeData'
		   	 && x.elements[i].id!='finalData' && x.elements[i].id!='finalAdviceRecommendId')
	   	{
	   		saveData[i] = x.elements[i].value;
	    }
    }
	
}
function loadGoalPlanAssetTypes(goalYearRange,assetClassId,counter,index){
	checkData();
	compareData();
	var allocationPercent=$("#allocationPercent_input_"+ counter +"_"+ index).val();
	//alert($("#initialData").val());
	if(flag == 0){
		displayMsg("<spring:message code='saveDataFirst' />");
		return false;
	}else{  
		$("#goalYearRange").val(goalYearRange);
		$("#assetClassId").val(assetClassId);		
		$("#allocationPercent").val(allocationPercent);
		$('#goalRecommendaionForm').attr('action', '${pageContext.request.contextPath}/partner/goalPlanAssetTypes');
		$("#goalRecommendaionForm").submit();				
	}

}
</script>
</body>
</html>
