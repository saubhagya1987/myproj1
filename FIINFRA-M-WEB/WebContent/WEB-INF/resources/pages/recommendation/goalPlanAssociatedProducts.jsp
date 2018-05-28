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
<title>Goal Plan- Associated Products</title>
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
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

<script>
$(document).ready(function(){
 // Calls the selectBoxIt method on your HTML select box
  	
	$("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});
		
    <c:if test="${not empty success}">
	  $("#successDialog").html("<spring:message code="${success}" />");
	  $( "#successDialog").dialog( "open" );
	</c:if>
	
	<c:if test="${not empty error}">
		$("#successDialog").html("<spring:message code="${error}" />");
		$( "#successDialog").dialog( "open" );
	</c:if>
	
	$("#confirmDialog .close").click(function(){
	    $(".overlay").fadeOut("slow");
		$("#confirmDialog").fadeOut("slow");
		 });
 
	
 $(".companyName").selectBoxIt({
	 populate: {"data": ${companyNameDropDownData}},
 });
 
 $(".productName").selectBoxIt({
	 populate: {"data":[
	                     {"value":"-1","text":"---Select---"}
	                   ]}
 });
 
 var productCount="${productCount}";
 if(productCount==""){
	 productCount=0;
 }
 for(var i=0;i<=parseInt(productCount);i++){
	 $( "body" ).on( "change", "#companyName_"+i , function(){
		if(this.value!=""){
			 $("#manufactureId").val(this.value);
				var nextDropDown = this.id.split('_');
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				var productNameValue = "#productNameValue_"+ nextDropDown[1];
				$("#upFrontCommission_"+ nextDropDown[1]).val("");
				$("#trailCommission_"+ nextDropDown[1]).val("");
				$("#goalPlanAssociatedform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getProductDropDownvalues",
					type : "GET",
					data : {'categoryId' : $("#categoryId").val(), 'manufactureId' : $("#manufactureId").val()},
					 success: function(msg){
						 $(productNameDropDown).empty();
							$.each(msg, function(index, item) {					
								$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
							});
							var selectBox = $(productNameDropDown).selectBoxIt().data('selectBox-selectBoxIt');
							selectBox.selectOption($(productNameValue).val());
					 }
				}); 
				
			}else{
				$('#page_loader').fadeOut();
			}	
		});
	 
	  $( "body" ).on( "change", "#productName_"+i , function(){
			$("#productId").val(this.value);
			//alert(this.value);
			if(this.value!=""){
				var nextDropDown = this.id.split('_');
				var upFrontCommission = "#upFrontCommission_"+ nextDropDown[1];
				var trailCommission = "#trailCommission_"+ nextDropDown[1];
				$("#goalPlanAssociatedform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getCommissionvalues",
					type : "GET",
					data : {'categoryId' : $("#categoryId").val(), 'assetClassId' : $("#assetClassId").val(), 'productId' : $("#productId").val(), 'productTypeId' : $("#productTypeId").val()},
					 success: function(msg){
						 var pieces=msg.split(",");
						 $(upFrontCommission).val(pieces[0]);
							$(trailCommission).val(pieces[1]);
					}
				}); 
			}else{
				$('#page_loader').fadeOut();
			}
		});  
 }
 
//	custom scroll 
//$('#goal_asso_prod').slimScroll();
$('#goal_asso_prod').slimScroll();
// Preferred Product Starts
// Preferred Product Count Intlalized	
	var pref_prod_count="${productCount}"+1;
	
	//Add Button Starts
  $("#goal_asso_prod").on("click", ".add", function() {
	   $(this).fadeOut("slow");
	  pref_prod_count++;
	  productCount++;
	  $("#productCount").val(productCount);
	$(this).prev(".close").fadeIn("slow");
	//<li class='first'>Alternate Product <span class='count'></span></li>
	$(this).parent().closest("ul").after("<ul class='reset clearfix dynamic_ul row'><li class='first'><select class='companyName' id='companyName_"+ productCount +"'></select></li><li class='second'><select class='productName' id='productName_"+ productCount +"'></select></li><li class='third'><input type='text' class='common_input' id='upFrontCommission_"+ productCount +"' readonly='readonly'></li><li class='fourth'><input type='text' class='common_input' id='trailCommission_"+ productCount +"' readonly='readonly'><div class='close'>x</div><div class='add' id='add_"+ productCount +"'>+</div></li></ul>");
	   //Preferred Product Count Written
	  $(this).parent().closest(".row").next(".dynamic_ul").find(".count").text(pref_prod_count); 
	  $("#companyName_"+productCount).selectBoxIt({
			 populate: {"data": ${companyNameDropDownData}},
		 });
		 
	  $("#productName_"+productCount).selectBoxIt({
			 populate: {"data":[
			                     {"value":"-1","text":"---Select---"}
			                   ]}
		 });
	  
	  $( "body" ).on( "change", "#companyName_"+productCount , function(){
			$("#manufactureId").val(this.value);
			if(this.value!=""){
				var nextDropDown = this.id.split('_');
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				var productNameValue = "#productNameValue_"+ nextDropDown[1];
				$("#upFrontCommission_"+ nextDropDown[1]).val("");
				$("#trailCommission_"+ nextDropDown[1]).val("");
				$("#goalPlanAssociatedform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getProductDropDownvalues",
					type : "GET",
					data : {'categoryId' : $("#categoryId").val(), 'manufactureId' : $("#manufactureId").val()},
					 success: function(msg){
						 $(productNameDropDown).empty();
							$.each(msg, function(index, item) {					
								$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
							});				
							var selectBox = $(productNameDropDown).selectBoxIt().data('selectBox-selectBoxIt');
							selectBox.selectOption($(productNameValue).val());
					 }
				});	
			}else{
				$('#page_loader').fadeOut();
			}			
			
		});
	 
	  $( "body" ).on( "change", "#productName_"+productCount , function(){
			$("#productId").val(this.value);
			//alert(this.value);
			if(this.value!=""){
				var nextDropDown = this.id.split('_');
				var upFrontCommission = "#upFrontCommission_"+ nextDropDown[1];
				var trailCommission = "#trailCommission_"+ nextDropDown[1];
				$("#goalPlanAssociatedform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getCommissionvalues",
					type : "GET",
					data : {'categoryId' : $("#categoryId").val(), 'assetClassId' : $("#assetClassId").val(), 'productId' : $("#productId").val(), 'productTypeId' : $("#productTypeId").val()},
					 success: function(msg){
						 var pieces=msg.split(",");
						 $(upFrontCommission).val(pieces[0]);
							$(trailCommission).val(pieces[1]);
					}
				});	
			}else{
				$('#page_loader').fadeOut();
			}
			 
		});
	  
	  $('#goal_asso_prod').perfectScrollbar('update');
	 
	  
	});

// Close Button 
$("#goal_asso_prod").on("click", ".close", function() {
	
	
	//var count_section = $(this).parent().closest("section").find(".selectboxit").length;
	
	/* if(count_section==10)
	  {
	
		$(".dynamic_ul .fifth").find(".close").addClass("first_close");
	   
	  }
	  
	  else if(count_section==8)
	  {
	
		$(".second_ul .fifth").find(".add").fadeIn("slow");
	   
	  } */
	 
	if($(this).parent().closest("ul").is(':last-child'))
	{
		
		$(this).parent().closest("ul").prev("ul").children(".add").fadeIn("slow");
	}
	// Adjusting Preferred Product Count 
	$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
	$(this).parent().closest("ul").prev("ul").addClass("moved_down");
	// Adjusting Preferred product count 
	// removing record
	 pref_prod_count--;
	$(this).parent().closest("ul").remove();
	// removing record
	// Adjusting Preferred product count 
	$(".moved_down").nextAll(".row").find(".count").each(function() {
     $(this).text($(this).text()-1);
  });
// Adjusting Preferred product count 
// Preferred Product Ends

	
	});	

});

function performReset(){
	window.location.href="${pageContext.request.contextPath}/partner/goalPlanSetDefault/goalPlanAssociatedProducts?sectionTypeId=${sectionTypeId}";
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
function displayMsg(msg){
	$("#successDialog").html(msg);
	$( "#successDialog").dialog( "open" );
}

</script>
</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper" id="goal_associated_products_wapper"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Header Starts-->
    <header class="common_header inner_header">
      <section class="top_header clearfix"> <a href="#" class="setting fr ${inactiveLinkFlag}"></a>
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
        <h1 class="heading clearfix">
          <button class="header_btn" id="default" onclick="setDefaultValues();">Set Default</button>
          <span class="head_txt">Goal Plan :  
          <span style="font-size:12px !important;color:#fff;opacity: 1.0;" class="${inactiveLinkFlag}">
	          <a href="${pageContext.request.contextPath}/partner/goalPlanning?riskProfileId=${riskProfileId}" style="text-decoration:underline;"><span class="sub_head_txt allCaps">${riskType}</span></a> >
	          <a href="${pageContext.request.contextPath}/partner/goalPlanning?riskProfileId=${riskProfileId}" style="text-decoration:underline;"><span class="sub_head_txt allCaps">${goalYearRange}</span></a> > 
	          <a href="${pageContext.request.contextPath}/partner/goalPlanning?riskProfileId=${riskProfileId}" style="text-decoration:underline;"><span class="sub_head_txt allCaps">${assetType} (<span class="dynamic_percntage">${allocationPercentAsset}</span>%)</span></a> > 
	          <a href="${pageContext.request.contextPath}/partner/goalPlanAssetTypes" style="text-decoration:underline;"><span class="sub_head_txt allCaps"> ${productTypeName} (<span class="dynamic_percntage"><fmt:formatNumber type="number" maxFractionDigits="0" value="${allocationPercentProductType}" /></span>%)</span></a> > 
	          <a href="${pageContext.request.contextPath}/partner/goalPlanAssetTypes" style="text-decoration:underline;"><span class="sub_head_txt allCaps">${productType} (<span class="dynamic_percntage">${allocationPercentCategory}</span>%)</span></a> > 
	          <span class="sub_head_txt allCaps" style="font-size:12px !important;">Products</span> 
          </span>
          </span><span class="heading_icon"><span class="head_icon"><img src="${pageContext.request.contextPath}/resources/images/goal_plan.png" alt="" width="31" height="32" class="rp-margin"/></span></span></h1>
      </div>
    </header>
    <!-- Header Ends--> 
    <!-- Common_content Starts--><section class="content common_content">
     <!-- Common_in_contnet starts-->
      <form method="post" id="goalPlanAssociatedform" name="goalPlanAssociatedform">
      	<input type="hidden" id="manufactureId" name="manufactureId" value="0"/>
      	<input type="hidden" id="productId" name="productId" value="0"/>
      	
      	<input type="hidden" id="productCount" name="productCount" value="${productCount}"/>
      	<input type="hidden" id="actionFlag" name="actionFlag" value="0"/>
      	<input type="hidden" id="initialProductData" name="initialProductData" value="0"/>
      	<input type="hidden" id="initialCompanyData" name="initialCompanyData" value="0"/>
      	<input type="hidden" id="finalProductData" name="finalProductData" value="0"/>
      	<input type="hidden" id="finalCompanyData" name="finalCompanyData" value="0"/>
      	
      	<input name="goalYearRangeId" id="goalYearRangeId" type="hidden" value="${goalYearRangeId}"/>
        <input name="riskProfileId" id="riskProfileId" type="hidden" value="${riskProfileId}"/>
        <input name="assetClassId" id="assetClassId" type="hidden" value="${assetClassId}"/>
        <input name="recordTypeId" id="recordTypeId" type="hidden" value="${recordTypeId}" />
        <input name="categoryId" id="categoryId" type="hidden" value="${categoryId}" />
        <input name="productTypeId" id="productTypeId" type="hidden" value="${productTypeId}" />
        <input name="recordId" id="recordId" type="hidden" value="${recordId}" />
        <input type="hidden" if="sectionTypeId" name="sectionTypeId" value="${sectionTypeId}"/>
      <section class="in_content common_in_content clearfix" id="goal_associated_products">
	  <div id="page_loader"></div>		
        <div class="header_strip">
          <ul class="reset clearfix">
            <!-- <li class="first">&nbsp;</li> -->
            <li class="first">Company</li>
            <li class="second">Product</li>
            <li class="third">Upfront Commission</li>
            <li class="fourth">Trail Commission</li>
          </ul>
        </div>
       <!--         -->  
        <section id="goal_asso_prod" class="clearfix">
        <c:choose>
        	<c:when test="${not empty goalPlanAssociatedProductsList}">
				<c:forEach items="${goalPlanAssociatedProductsList}" var="goalProductList" varStatus="counter">
			        <input type="hidden" name="companyNameValue_${counter.index}" id="companyNameValue_${counter.index}" value="${goalProductList.manufacturerId}"/>
			        <input type="hidden" name="productNameValue_${counter.index}" id="productNameValue_${counter.index}" value="${goalProductList.productId}"/>
			        <input type="hidden" name="isPreferredProduct_${counter.index}" id="isPreferredProduct_${counter.index}" value="${goalProductList.ispreferredProduct}"/>
			        	<%-- <c:choose>
			        		<c:when test="${goalProductList.ispreferredProduct eq 1}">
					        	<ul class="reset clearfix preferred_ul">
						            <li class="first">Preferred Product ${counter.count}</li>
						            <li class="second">
						              <select id="companyName_${counter.index}" class="companyName">
						              </select>
						              <input type="hidden" id="recordId_${counter.index}" name="recordId_${counter.index}" value="${goalProductList.id}"/>
						            </li>
						            <li class="third">
						              <select id="productName_${counter.index}" class="productName">
						              </select>
						            </li>
						            <li class="fourth">
						              <input type="text" id="upFrontCommission_${counter.index}" class="common_input" readonly="readonly"/>
						            </li>
						            <li class="fifth">
						              <input type="text" id="trailCommission_${counter.index}" class="common_input" readonly="readonly"/>
						              <c:if test="${fn:length(goalPlanAssociatedProductsList) eq counter.count}">
						              	<div class="add">+</div>
						              </c:if>
								    </li>
								</ul>		
			        		</c:when>
			        		<c:otherwise>         --%>		
			        			<ul class="reset clearfix second_ul row">
						            <%-- <li class="first">Alternate Product ${counter.count}</li> --%>
						            <li class="first">
						              <select id="companyName_${counter.index}" class="companyName">
						              </select>
						              <input type="hidden" id="recordId_${counter.index}" name="recordId_${counter.index}" value="${goalProductList.id}"/>
						            </li>
						            <li class="second">
						              <select id="productName_${counter.index}" class="productName">
						              </select>
						            </li>
						            <li class="third">
						              <input type="text" id="upFrontCommission_${counter.index}" class="common_input" readonly="readonly"/>
						            </li>
						            <li class="fourth">
						              <input type="text" id="trailCommission_${counter.index}" class="common_input" readonly="readonly"/>
						              <c:if test="${fn:length(goalPlanAssociatedProductsList) eq counter.count}">
						              	<div class="add">+</div>
						              </c:if>
						            </li>
						          </ul>			        		
			        		<%-- </c:otherwise>
			        	</c:choose>	 --%>		        
			        </c:forEach>        	
        	</c:when>
        	<c:otherwise>
        		<ul class="reset clearfix second_ul row">
	            <!-- <li class="first">Alternate Product 1</li> -->
	            <li class="first">
	              <select id="companyName_0" class="companyName">
	              </select>
	            </li>
	            <li class="second">
	              <select id="productName_0" class="productName">
	              </select>
	            </li>
	            <li class="third">
	              <input type="text" id="upFrontCommission_0" class="common_input" readonly="readonly"/>
	            </li>
	            <li class="fourth">
	              <input type="text" id="trailCommission_0" class="common_input" readonly="readonly"/>
	              <div class="add">+</div>
	            </li>
			</ul>
        </c:otherwise>
     </c:choose>

          
        </section>
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      
      <section id="Footer_Type_Two" class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup">
            </li>
            <li class="fl list"><a class="anch save" onclick="submitData();" style="cursor:pointer"><span class="txt">Save</span></a></li>
            <li class="fl list"><a class="anch cancel ${inactiveLinkFlag}" onclick="cancel();" style="cursor:pointer"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
      </section>
      </form>
       <!--<section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            </li>
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation"><span class="txt">Back</span></a> <a href="#" class="next navgation"><span class="txt">Next</span></a> </section>-->
      
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
        Do you really want to delete this data?</div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div>
<script>
$(document).ready(function(){
		
	var productData = [];
   	var companyData = [];
   	
	var productCountTemp="${productCount}";
	for(var i=0;i<=productCountTemp;i++){
		var companySelect="#companyNameValue_"+i;
		var selectBox = $("#companyName_"+i).selectBoxIt().data('selectBox-selectBoxIt');			    
	    selectBox.selectOption($(companySelect).val());			
	}
	    	  
   	//var productTypeCount="${productCount}";
    for(var i=0;i<=productCountTemp;i++){	    		
    	companyData.push($("#companyName_"+i).val());
    	var productDropDownId = "#productNameValue_"+i;
    	var recordId="#recordId_"+i;
  	  if(($("#isPreferredProduct_"+i).val()) && ($(recordId).val())){
    			productData.push($(recordId).val()+"_"+$(productDropDownId).val()+"_"+$("#isPreferredProduct_"+i).val());	
  	  }else if($(recordId).val()){
  	  		productData.push($(recordId).val()+"_"+$(productDropDownId).val()+"_0");
  	  }else{
  		productData.push("0_"+$(productDropDownId).val()+"_0");
  	  }
    		 
    }
    $("#initialCompanyData").val(companyData);
    $("#initialProductData").val(productData);

    $(function() {

		$(document).ajaxStop(function() {
			 $('#page_loader').fadeOut();
		});
		
		$(document).ajaxComplete(function() {
			 $('#page_loader').fadeOut();
		});

		$(document).ajaxStart(function() {
			 $('#page_loader').fadeIn();
		});

	});

});

var finalProductCountFlag=0;
var validationFlag=1;

function submitData(){
	checkData();
	if(finalProductCountFlag==1){
		if(validationFlag==1){
			compareData();
			if($("#actionFlag").val()==0){
				$('#goalPlanAssociatedform').attr('action', '${pageContext.request.contextPath}/partner/goalPlanAssociatedProducts');
			}else{
				$('#goalPlanAssociatedform').attr('action', '${pageContext.request.contextPath}/partner/saveGoalPlanAssociatedProducts');
			} 
			$("#goalPlanAssociatedform").submit();	
		}else{
			displayMsg("<spring:message code='fillDataCorrectly' />");
		}				
	}else{
		displayMsg("<spring:message code='deleteDataGT0' />");
	}

}
function cancel(){
	checkData();
	compareData();
	if($("#actionFlag").val()==0){
		$('#goalPlanAssociatedform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#goalPlanAssociatedform").submit();
	}else{
		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").click(function(){cancelPage()});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}
}
function cancelPage(){
	$('#goalPlanAssociatedform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
	$("#goalPlanAssociatedform").submit();
}

function compareData(){
  		
   	if(($("#initialProductData").val()!=$("#finalProductData").val()) || 
	    		 ($("#initialCompanyData").val()!=$("#finalCompanyData").val())){
   		$("#actionFlag").val("1");
   	}
	    			 
}

function checkData(){
	
	productData = [];
   	companyData = [];
   	finalProductCountFlag=0;
   	validationFlag=1;
   	var companyDropDownId="";
   	var totalRows=$("#productCount").val();
	for(var i=0;i<=totalRows;i++){
	  var productDropDownId = "#productName_"+i;
	  var recordId="#recordId_"+i;
	  companyDropDownId = "#companyName_"+i;
	  
	  if($(productDropDownId).val() && $(productDropDownId).val()!="" && $(productDropDownId).val()!="-1" && $(productDropDownId).val()!="Select"){
		  finalProductCountFlag=1;
	  }
	  
	  if(($(recordId).val()) || (($(productDropDownId).val()!=null) && ($(productDropDownId).val()!=-1))){
		  if(($("#isPreferredProduct_"+i).val()) && ($(recordId).val())){
		  		productData.push($(recordId).val()+"_"+$(productDropDownId).val()+"_"+$("#isPreferredProduct_"+i).val());	
			  }else if($(recordId).val()){
			  	productData.push($(recordId).val()+"_"+$(productDropDownId).val()+"_0");
			  }else{
			  	productData.push("0_"+$(productDropDownId).val()+"_0");
			    }			  
			  companyData.push($(companyDropDownId).val());				  
	  }	  
	  if($(companyDropDownId).val()!=-1 && $(companyDropDownId).val()!=null){
		  if($(productDropDownId).val()==-1 || $(productDropDownId).val()==null || $(productDropDownId).val()=="Select"){
			  validationFlag=0;
		  }
	  } 
	 
	}
	$("#finalProductData").val(productData);
	$("#finalCompanyData").val(companyData);
}
</script>
</body>
</html>
