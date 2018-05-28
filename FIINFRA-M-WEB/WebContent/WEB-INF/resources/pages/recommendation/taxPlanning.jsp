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
<title>Tax Planning</title>
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />
<%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script> --%>
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

<style>
#vaccation_planning + .common_footer_actions .btn_grup3 {
	width: 221px;
}
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>
<style>
#confirmDialog {
display: block;
height: 130px;
display: none;
width: 355px;
box-shadow: 0 0 15px 1px #757575;
}
</style>
<script>
var index=0;

$(document).ready(function(){
//	custom scroll 
$('#vaccation').slimScroll();
//$("select").selectBoxIt();	

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

index = ${noOfDropDownsAtBeginning};
$("#noOfDropDownRowsHidden").val(index);
	//Tax planning input Starts
$("#vaccation").on("click", ".add", function() {
	index = index + 1;
	
	  $(this).prev(".close").fadeIn("slow");
	
	  $(this).parent().closest("ul").after("<ul class='reset clearfix first_ul dynamic_ul'><li class='first'><select id='productCategory_"+index+"' name='productCategory_"+index+"'></select></li><li class='second'> <select id='companyName_"+index+"' name='companyName_"+index+"'></select></li><li class='third default_parent'> <select id='productName_"+index+"' name='productName_"+index+"'></select><div class='close'>X</div><div class='add'>+</div></li></ul>");
	     	var productcategoryDropDownId = "#productCategory_"+ index;
		    var companyNameDropDownId = "#companyName_"+ index;
		    var productNameDropDown = "#productName_"+ index;
	  //$("select").selectBoxIt();
	  		$(productcategoryDropDownId).selectBoxIt({
	    		populate: {"data":${productCategoryDropDownData}}
	    	});
	     	$(companyNameDropDownId).selectBoxIt({
	    		populate: {"data":[
	    		                     {"value":"-1","text":"---Select---"}
	    		                   ]}
	    	});
	    	$(productNameDropDown).selectBoxIt({
	    		populate: {"data":[
	    		                     {"value":"-1","text":"---Select---"}
	    		                   ]}
	    	});
	    	$( "body" ).on( "change", productcategoryDropDownId , function(){
				$("#categoryidHidden").val(this.value);
			//	alert(this.id);
				var nextDropDown = this.id.split('_');
				var companyNameDropDown = "#companyName_"+ nextDropDown[1];
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				$(productNameDropDown).empty();
				$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: "---Select---"});
				$("#vacationPlanningform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getComapnyNames",
					type : "GET",
					data : {'categoryId' : $("#categoryidHidden").val()},
					 success: function(msg){
						 $(companyNameDropDown).empty();
							//$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
							$.each(msg, function(index, item) {					
								$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
							});

							/*  var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
						    selectBox.selectOption(selectedValue); */ 
					 }
				});
			});
	    	$( "body" ).on( "change", companyNameDropDownId , function(){
				$("#manufactureIdHidden").val(this.value);
			//	alert(this.id);
				var nextDropDown = this.id.split('_');
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				$("#vacationPlanningform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getProductNames",
					type : "GET",
					data : {'categoryId' : $("#categoryidHidden").val(), 'manufactureId' : $("#manufactureIdHidden").val()},
					 success: function(msg){
						 $(productNameDropDown).empty();
							//$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
							$.each(msg, function(index, item) {					
								$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
							});

							/*  var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
						    selectBox.selectOption(selectedValue); */ 
					 }
				});
			});
	    	validateProduct(productNameDropDown);
	  $(this).fadeOut("fast");
	  
	 //close button for first Tax planning input start
	var count_section_add = $(this).parent().closest("section").find("ul").length;
	if(count_section_add==2)
	  {
		
		$(this).parent().find(".close").removeClass("last_close");
	   
	  }
	  //close button for Tax planning input end
	
	$("#noOfDropDownRowsHidden").val(index);	  
	});

// Close Button of default Tax planning input 
$("#vaccation").on("click", ".close", function() {
	//index = index - 1;
   //  var manuf_parent=$(this).parent();
	//close button for first Tax planning input start
	var count_section = $(this).parent().closest("section").find("ul").length;
	if(count_section==2)
	  {
		$(this).parent().closest("ul").siblings("ul").find(".close").addClass("last_close");
	   
	  }
	  else
	  {
		$(this).parent().closest("ul").siblings("ul").find(".close").removeClass("last_close");  
	  }
	//close button for first Tax planning input end
	$(this).parent().closest("ul").remove();
	
	 //$("#noOfDropDownRowsHidden").val(index);
	 $('#vaccation').perfectScrollbar('update');
	$("#vaccation").find("ul.first_ul").last().find(".add").fadeIn("slow");
});	
//Manufacturer Ends



});

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}
function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}
function performReset(){
	window.location.href="${pageContext.request.contextPath}/partner/goalPlanSetDefault/taxPlanning?sectionTypeId=${sectionTypeId}";
}
function setDefaultValues(){
	if("${recordTypeId}"==14003){
		$(".aa_up").html("<spring:message code='taxPlanning.dataReset' />");
		$(".aa_yes").on('click',function(){performReset();});	
		var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="performReset();">Yes </a> ';
		innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
		$(".aa_down").html(innerHTML);
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();			
	}else{
		displayMsg("Data already restored!!!");
	}

}

</script>
</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper" id="tax_planning_parent"> 
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
        <h1 class="heading clearfix">
        <a href="#" class="drop_menu"></a>
        <a href="#" onclick="setDefaultValues();" class="set_default saveTaxPlanningPlanningLink"><span class="set_default_txt">Set Default </span></a>
        <span class="head_txt">Tax Planning</span><span class="heading_icon"><span class="head_icon"><img src="${pageContext.request.contextPath}/resources/images/tax_planning_advice.png" alt="" vspace="9" class="rp-margin"/></span></span></h1>
      </div>
    </header>
    <!-- Header Ends--> 
    <!-- Common_content Starts--><section class="content common_content">
    <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
     <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix my_profile_parent" id="vaccation_planning">
      <div id="page_loader"></div>
      <form method="post" name="vacationPlanningform" id="vacationPlanningform" action="<c:url value="/partner/saveTaxPlanings"/>">
     <div class="header_strip">
            <ul class="reset clearfix">
              <li class="first">Product Category</li>
              <li class="second">Company Name</li>
              <li class="third">Product Name</li>
            </ul>
          </div>
						<section id="vaccation" class="clearfix">
						<c:forEach items="${taxPlanningList}"  varStatus="loopCounter" var="vacation">
							<ul class="reset clearfix first_ul">
								<li class="first"><select id="productCategory_${loopCounter.count}" name="productCategory_${loopCounter.count}"></select></li>
								<li class="second"><select id="companyName_${loopCounter.count}" name="companyName_${loopCounter.count}"></select></li>
								<li class="third default_parent"><select id="productName_${loopCounter.count}" name="productName_${loopCounter.count}"></select>
									<div class="close" id="close_${loopCounter.count}">X</div>
									<div class="add" id="add_${loopCounter.count}">+</div></li>
							</ul>
							<input name="categoryidIncoming_${loopCounter.count}" id="categoryidIncoming_${loopCounter.count}" type="hidden" value="${vacation.categoryId}"/>
							 <input name="companyNameIncoming_${loopCounter.count}" id="companyNameIncoming_${loopCounter.count}" type="hidden" value="${vacation.manufacturerId}"/>
							 <input name="productNameIncoming_${loopCounter.count}" id="productNameIncoming_${loopCounter.count}" type="hidden" value="${vacation.productId}"/>
							 <%-- <input name="companyNameDD_${loopCounter.count}" id="companyNameDD_${loopCounter.count}" type="hidden" value="${companynameDropDownData0}"/> --%>
							 <input name="companyNameDD_${loopCounter.count}" id="companyNameDD_${loopCounter.count}" type="hidden" />
							 <input type="hidden" name="id${loopCounter.count}" id="id${loopCounter.count}" value="${vacation.id}"  />
						</c:forEach>	
						</section>
		<input name="categoryidHidden" id="categoryidHidden" type="hidden" value="0"/>
        <input name="manufactureIdHidden" id="manufactureIdHidden" type="hidden" value="0"/>
        <input name="noOfDropDownRowsHidden" id="noOfDropDownRowsHidden" type="hidden" value="0"/>
       <!--  <input name="productCategoryValuesFinal" id="productCategoryValuesFinal" type="hidden" value="0"/>
        <input name="companyNameValuesFinal" id="companyNameValuesFinal" type="hidden" value="0"/>
        <input name="productNameValuesFinal" id="productNameValuesFinal" type="hidden" value="0"/>
        <input name="productCategoryValuesInitial" id="productCategoryValuesInitial" type="hidden" value="0"/>
        <input name="companyNameValuesInitial" id="companyNameValuesInitial" type="hidden" value="0"/>
        <input name="productNameValuesInitial" id="productNameValuesInitial" type="hidden" value="0"/> -->
        <input type="hidden" name="id" id="id" value="${id}"  />
        <input type="hidden" name="recordTypeId" id="recordTypeId" value="${recordTypeId}"  />
        </form>
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <c:if test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
            	<li class="fl list"><a href="#" class="anch save saveTaxPlanningPlanningLink" onclick="formSubmit();"><span class="txt">Save</span></a></li>
            </c:if>
            <li class="fl list"><a href="#" class="anch cancel" onclick="formCancel();"><span class="txt">Cancel</span></a></li>
              <!-- <li class="fl list"><a href="vacation-planning.html" class="anch skip"><span class="txt">Skip</span></a></li> -->
          </ul>
        </div>
        <!-- <a href="#" class="back navgation" onclick="back();"><span class="txt">Back</span></a> <a href="#" class="next navgation" onclick="next();"><span class="txt">Next</span></a>--></section> 
      
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
</body>
<script type="text/javascript">
$(document).ready(function(){
	var idTemp2 = "#id2";
	var idTemp1 = "#id1";
	var i=0;
	//alert($(idTemp1).val());
	//alert($(idTemp2).val());
	var noOfDropDowns = ${noOfDropDownsAtBeginning};
	if(noOfDropDowns != 0){
		for(i =0;i<noOfDropDowns; i++){
			var companynameDropDownDataVar = "companynameDropDownData"+i;
			//does not work
			//var data = $("#companyNameDD_1").val();
			//alert('calling checkDropDown'+data);
			//checkDropDown(companynameDropDownDataVar);
			//alert(companynameDropDownDataVar);
			var companynameDropDownDataVarJson = "";//${companynameDropDownDatavar};
			//alert('${companynameDropDownDatavar}');
			var productcategoryDropDownId = "#productCategory_"+(i+1);
			var companyNameDropDownId = "#companyName_"+(i+1);
			$(productcategoryDropDownId).selectBoxIt({
				populate: {"data": ${productCategoryDropDownData}},
			});
			var categorySelect = "#categoryidIncoming_"+(i+1);
			var companyNameSelect = "#companyNameIncoming_"+(i+1);
			var productNameSelect = "#productNameIncoming_"+(i+1);
			var selectBox = $(productcategoryDropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
		    selectBox.selectOption($(categorySelect).val());
		    $("#categoryidHidden").val($(categorySelect).val());
			var companyNameDropDown = "#companyName_"+(i+1);
			var productNameDropDown = "#productName_"+(i+1);
			//var showDropDown = $("#companyNameDD_1").val();
			var categoryIdPassed = $(categorySelect).val();
			var companyNameIdPassed = $(companyNameSelect).val();
			/* $(companyNameDropDown).selectBoxIt({
					populate: function() {
						var deferred = $.Deferred(),
			            arr = [],
			            x = -1;
						$.ajax({
							type : "GET",
							url : "${pageContext.request.contextPath}/partner/getComapnyNames",
							data : {'categoryId' : categoryIdPassed},
							contentType : "application/json; charset=utf-8",
							dataType : "json",
						}).done(function(data) {
				            while(++x < data.length) {
				                arr.push(data[x]);
				            }
				            deferred.resolve(arr);
				        });
				        return deferred;
					}
			});
			var selectBox = $(companyNameDropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
		    selectBox.selectOption($(companyNameSelect).val()); */
		    $(companyNameDropDown).selectBoxIt();
			$(productNameDropDown).selectBoxIt();
			jsonPopulateCompanyName("${pageContext.request.contextPath}/partner/getComapnyNames", $(categorySelect).val(), companyNameDropDown, companyNameDropDown, $(companyNameSelect).val());
			//checkDropDown($(categorySelect).val());
			jsonPopulateProductName("${pageContext.request.contextPath}/partner/getProductNames", $(categorySelect).val(), $(companyNameSelect).val(), productNameDropDown, productNameDropDown, $(productNameSelect).val());
			
			validateProduct(productNameDropDown);
			
			if(i == (noOfDropDowns-1)){
				$("#add_"+(i+1)).fadeIn("slow");	
				$("#close_"+(i+1)).fadeIn("slow");				
			} else{
				$("#add_"+(i+1)).fadeOut("slow");	
				$("#close_"+(i+1)).fadeIn("slow");				
			}

		}		
	}else{
		var productcategoryDropDownId = "#productCategory_"+(i+1);
		var companyNameDropDownId = "#companyName_"+(i+1);
		$(productcategoryDropDownId).selectBoxIt({
			populate: {"data": ${productCategoryDropDownData}},
		});
		var companyNameDropDown = "#companyName_"+(i+1);
		var productNameDropDown = "#productName_"+(i+1);
		$(companyNameDropDown).selectBoxIt({
			populate: {"data":[
  		                     {"value":"-1","text":"---Select---"}
  		                   ]}
		});
		$(productNameDropDown).selectBoxIt({
			populate: {"data":[
  		                     {"value":"-1","text":"---Select---"}
  		                   ]}
		});
		$( "body" ).on( "change", productcategoryDropDownId , function(){
			$("#categoryidHidden").val(this.value);
			//alert(this.id);
			var nextDropDown = this.id.split('_');
			var companyNameDropDown = "#companyName_"+ nextDropDown[1];
			$("#vacationPlanningform").ajaxSubmit({
				url: "${pageContext.request.contextPath}/partner/getComapnyNames",
				type : "GET",
				data : {'categoryId' : $("#categoryidHidden").val()},
				 success: function(msg){
					 $(companyNameDropDown).empty();
						//$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
						$.each(msg, function(index, item) {					
							$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
						});

						/*  var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
					    selectBox.selectOption(selectedValue); */ 
				 }
			});
		});
		 $( "body" ).on( "change", companyNameDropDownId , function(){
			$("#manufactureIdHidden").val(this.value);
			//alert(this.id);
			var nextDropDown = this.id.split('_');
			var productNameDropDown = "#productName_"+ nextDropDown[1];
			$("#vacationPlanningform").ajaxSubmit({
				url: "${pageContext.request.contextPath}/partner/getProductNames",
				type : "GET",
				data : {'categoryId' : $("#categoryidHidden").val(), 'manufactureId' : $("#manufactureIdHidden").val()},
				 success: function(msg){
					 $(productNameDropDown).empty();
						//$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
						$.each(msg, function(index, item) {					
							$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
						});

						  var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
					    selectBox.selectOption(selectedValue);  
				 }
			});
		}); 
		 validateProduct(productNameDropDown);
	}
	checkDataAtStart();
	$("select").each(function(){
		
		//alert(this.id);
		//var productcategoryDropDownId = this.id;
		var productcategoryDropDownId = "#"+this.id;
		if(productcategoryDropDownId.indexOf("productCategory")>-1){
			//alert('applying on change for productCategory');
			$( "body" ).on( "change", productcategoryDropDownId , function(){
				$("#categoryidHidden").val(this.value);
				//alert(this.id);
				var nextDropDown = this.id.split('_');
				var companyNameDropDown = "#companyName_"+ nextDropDown[1];
				var productNameDropDown = "#productName_"+ nextDropDown[1];
				$("#vacationPlanningform").ajaxSubmit({
					url: "${pageContext.request.contextPath}/partner/getComapnyNames",
					type : "GET",
					data : {'categoryId' : $("#categoryidHidden").val()},
					 success: function(msg){
						 $(companyNameDropDown).empty();
							//$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --SelectCompany--"});
							$.each(msg, function(index, item) {					
								$(companyNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
							});
							$(productNameDropDown).empty();
							$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " ---Select---"});
					 }
				});
			});
		}
		
		});
	
    $(function() {

		$(document).ajaxStop(function() {
			 $('#page_loader').fadeOut();
		});

		$(document).ajaxStart(function() {
			 $('#page_loader').fadeIn();
		});

	});
	
});

	var validationFlag=1;

	 function companyNameUpdate(){
		//alert('companyNameUpdate');
		$("#categoryidHidden").val(this.value);
		 $("#vacationPlanningform").ajaxSubmit({
				url: "${pageContext.request.contextPath}/partner/getComapnyNames",
				type : "GET",
				data : {'categoryId' : $("#categoryidHidden").val()},
				 success: function(msg){
					 $("#companyName").empty();
						//$("#companyName").data("selectBox-selectBoxIt").add({ value: "-1", text: " --Select--"});
						$.each(msg, function(index, item) {					
							$("#companyName").data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
						});

						 var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
					    selectBox.selectOption(selectedValue); 
				 }
		 });
		 return false;
	}; 
	function formSubmit(){
		checkDataAtSubmit();
		if(validationFlag==1){
			$("#vacationPlanningform").submit();	
		}else if(validationFlag==0){
			displayMsg("<spring:message code='fillDataCorrectly' />");
		}else if(validationFlag==-1){
			displayMsg("<spring:message code='deleteDataGT0' />");
		}		
	}
	function formCancel(){
		checkDataAtSubmit();
		//alert($("#productCategoryValuesInitial").val() != $("#productCategoryValuesFinal").val());
		//alert($("#companyNameValuesInitial").val() != $("#productCategoryValuesFinal").val());
		//alert($("#productCategoryValuesInitial").val() != $("#productCategoryValuesFinal").val());
		if(($("#productCategoryValuesInitial").val() != $("#productCategoryValuesFinal").val()) || ($("#companyNameValuesInitial").val() != $("#companyNameValuesFinal").val()) ||
			($("#productNameValuesInitial").val() != $("#productNameValuesFinal").val())){
			var r = confirm("The data has changed. Are you sure you want to exit.");
			if (r == true) {
				$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
				$("#vacationPlanningform").submit();
			}
		} else {
			$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
			$("#vacationPlanningform").submit();
		}
	}
	function back(){
		$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/recommendation');
		$("#vacationPlanningform").submit();
	}
	function next(){
		$('#vacationPlanningform').attr('action', '${pageContext.request.contextPath}/partner/vacationPlanning');
		$("#vacationPlanningform").submit();
	}
	function checkDataAtStart(){
		var productCategoryValues = [];
		var companyNameValues = [];
		var productNameValues = [];
		var noOfDropDowns = $("#noOfDropDownRowsHidden").val();
		for(var i =1; i <= noOfDropDowns; i++){
			var productCategoryDropDown = "#productCategory_"+i;
			var companyNameDropDown = "#companyName_"+i;
			var productNameDropDown = "#productName_"+i;
			productCategoryValues.push($(productCategoryDropDown).val());
			companyNameValues.push($(companyNameDropDown).val());
			productNameValues.push($(productNameDropDown).val());
		}
/* 		$("#productCategoryValuesInitial").val(productCategoryValues);
		$("#companyNameValuesInitial").val(companyNameValues);
		$("#productNameValuesInitial").val(productNameValues); */
		
	}
	function checkDataAtSubmit(){
		var productCategoryValues = [];
		var companyNameValues = [];
		var productNameValues = [];
		validationFlag=1;
		var productCount=0;
		var noOfDropDowns = $("#noOfDropDownRowsHidden").val();
		for(var i =1; i <= noOfDropDowns; i++){
			var productCategoryDropDown = "#productCategory_"+i;
			var companyNameDropDown = "#companyName_"+i;
			var productNameDropDown = "#productName_"+i;
			if($(productCategoryDropDown).val() && $(productCategoryDropDown).val()!=-1){
				if($(productCategoryDropDown).val() == null){
					productCategoryValues.push(-1);
					validationFlag=0;
				}else{
				productCategoryValues.push($(productCategoryDropDown).val());
				}
				if($(companyNameDropDown).val() == null){
					companyNameValues.push(-1);
					validationFlag=0;
				}else{
					companyNameValues.push($(companyNameDropDown).val());
				}
				if($(productNameDropDown).val() == null){
					productNameValues.push(-1);
				}else{
					productNameValues.push($(productNameDropDown).val());
				}
				if($(companyNameDropDown).val()==-1 || $(productNameDropDown).val()==-1){
					validationFlag=0;
				}
				productCount=productCount+1;
			}						
		}
		if(productCount==0){
			validationFlag=-1;
		}
/* 		$("#productCategoryValuesFinal").val(productCategoryValues);
		$("#companyNameValuesFinal").val(companyNameValues);
		$("#productNameValuesFinal").val(productNameValues); */
		
	}
	function jsonPopulateCompanyName(url, data, dropdown, fieldName, selectedValue) {
		$(dropdown).empty();
		//$(dropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: " -- Select --"});
		
		$.ajax({
				type : "GET",
				url : url,
				data : {'categoryId' : data},
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(msg) {
					$.each(msg, function(index, item) {					
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
					});

					var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
				    selectBox.selectOption(selectedValue);
				    //------apply on change
						//alert('applying on change for company name');			
						$( "body" ).on( "change", dropdown , function(){
							$("#manufactureIdHidden").val(this.value);
							//alert($(productcategoryDropDownId).val());
							var nextDropDown = this.id.split('_');
							var productNameDropDown = "#productName_"+ nextDropDown[1];
							var productcategoryDropDown = "#productCategory_"+ nextDropDown[1];
					//		alert($(productcategoryDropDown).val());
							$("#vacationPlanningform").ajaxSubmit({
								url: "${pageContext.request.contextPath}/partner/getProductNames",
								type : "GET",
								data : {'categoryId' : $(productcategoryDropDown).val(), 'manufactureId' : $("#manufactureIdHidden").val()},
								 success: function(msg){
									 $(productNameDropDown).empty();
										//$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: "-1", text: " --SelectProduct--"});
										$.each(msg, function(index, item) {					
											$(productNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
										});

										    //var selectBox = $("#companyName").selectBoxIt().data('selectBox-selectBoxIt');			    
									    //selectBox.selectOption(selectedValue);    
								 }
							});
						});
				    //-----apply on change end
				},
				error : function(msg) {
					$('.result').html(msg.d);
				}
			});
		return false;
	}
	function jsonPopulateProductName(url, categoryId, manufactureId, dropdown, fieldName, selectedValue) {
		$(dropdown).empty();
		//$(dropdown).data("selectBox-selectBoxIt").add({ value: "-1", text: " -- Select --"});
		
		$.ajax({
				type : "GET",
				url : url,
				data : {'categoryId' : categoryId, 'manufactureId' : manufactureId},
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(msg) {
					$.each(msg, function(index, item) {					
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
					});

					var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
				    selectBox.selectOption(selectedValue);
				},
				error : function(msg) {
					$('.result').html(msg.d);
				}
			});
		return false;
	}
	function validateProduct(productNameDropDown){
		$( "body" ).on( "change", productNameDropDown , function(){
			 var pieces=this.id.split("_");
			 var dropDownId="#productName_"+pieces[1];
			 var selectedProduct=$(dropDownId+" option:selected").text();
			 var noOfDropDowns = $("#noOfDropDownRowsHidden").val();
				for(var i =1; i <= noOfDropDowns; i++){
					var productNameDropDown = "#productName_"+i;
					if($(dropDownId).val()!="-1" && dropDownId!=productNameDropDown){
						if($(dropDownId).val()==$(productNameDropDown).val()){
							$(dropDownId).val("-1");
							var selectBox = $(dropDownId).selectBoxIt().data('selectBox-selectBoxIt');			    
							selectBox.selectOption("-1");
							displayMsg("You have already selected "+selectedProduct+" product.");
						}
					}
				}
		 });
	}
	function checkDropDown(categoryId){
	//	alert('in checkDropDown'+categoryId);
		//var data = ${companyNameDD_0};
		$.ajax({
			type : "GET",
			url : "/partner/getComapnyNames",
			data : {'categoryId' : categoryId},
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				//populate: {"data": [{"value":-1,"text":"---select---"},{"value":48012,"text":"File Tax Returns"},{"value":48013,"text":"Advanced Tax"}]},
				//var jsonString = "data"+":[{"+"value"+":"+item.value+","text":"---Selects---"}
			    		                  // ]
				$.each(msg, function(index, item) {	
				//alert('in success'+item.text);
				});
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	}
</script>
</html>
