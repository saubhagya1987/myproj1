<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
	   cdn = request.getContextPath();
   }
request.setAttribute("_cdn", cdn);
%>

<!-- Start Google Analytics -->
<script>
 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
 (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
 })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

 ga('create', 'UA-48212643-3', 'auto');
 ga('send', 'pageview');

</script>

<!-- End Google Analytics -->


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link rel="shortcut icon" href="${_cdn}/assets/images/common-images/favicon.ico" />

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/basic.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/jquery-ui.css" /> 
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/custom.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/main.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/responsive.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/responsive.css" />


<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" /> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />--%>

<%-- <%if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %> --%>

<script src="${_cdn}/assets/js/common-js/plugin/jquery-1.11.0.min.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/jquery-ui.js"></script> 
<script	src="${_cdn}/assets/js/common-js/plugin/toggles.js"></script>
<script	src="${_cdn}/assets/js/common-js/my_account_submenu.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/selectboxit.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.slimscroll.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/perfect-scrollbar.js"></script>
<script	src="${_cdn}/assets/js/common-js/plugin/jquery.mousewheel.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.autosize.input.js"></script>
<script src="${_cdn}/assets/js/common-js/common/common.js"></script>
<script src="${_cdn}/assets/js/common-js/common_modal.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/jquery.validate.js"></script>
<script src="${_cdn}/assets/js/common-js/plugin/additional-methods.js"></script>


<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script>  --%>

<script>
<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){

	$('.drop_menu').css("display","none");//removed submenu link	
    $('.wrapper').attr("id","interseted_fp_sections");
	$('.common_in_content').slimScroll();
	$("body").on("click",".fp_ul div .categoery",function(){
	$(this).find(".custom_checkbox").toggleClass("custom_checkbox_checked");
	  check_toggle($(this));
	});	
        function check_toggle(thisObj) {
    if ($(thisObj).find(".default_checkbox").is(":checked")) {
       $(thisObj).find(".default_checkbox").prop("checked", false);
    } else {
       $(thisObj).find(".default_checkbox").prop("checked", true);
    }
		}

	var attrValue = '${sections}';
	var result = attrValue.split(",");
	for(var i=0; i<result.length;++i)
	{
		var idName = '#'+result[i];
		$(idName).prop("checked", true);	
		$(idName).next(".custom_checkbox").addClass('custom_checkbox_checked');	
	}
	
	$(function() {
		$(document).ajaxStop(function() {
			 $('#page_loader1').fadeOut();
		});

		$(document).ajaxStart(function() {
			 $('#page_loader1').fadeIn();
		});

	});			
 });

</script>
<!-- custom scroll to "common_in_content" -->

</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Header Starts-->
    <header class="common_header inner_header"></header>
    <!-- Header Ends-->     
    <!-- Common_content Starts-->
    
    
    <section class="top_header clearfix">
    
    
     	  <%-- <jsp:include page="../layout/submenu_small.jsp"></jsp:include> --%>
      <!-- Common_in_contnet starts-->
      
      
      
      
		<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;">
			<section id="" class="in_content common_in_content clearfix" style="overflow: hidden; width: auto;">
      
      <div id="page_loader" style="display:none;"></div>
        
        
        
          
            
            
           
                     
            
            <div class="fp_div">
            	<div class="row">
            	 
            	<div class="col-md-2"></div>
           		<div class="col-md-3 col-sm-6 col-xs-12">
           		
           		
           		
                <div class="space-10"></div>  
                 <input type="checkbox" id="39001" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Emergency
                  
                   
                     
                  <div class="space-10"></div>   
                    
                             
                <div  >
                  <input type="checkbox" id="39008" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span>  Goal Readiness</div>
             
                   
                    
                    
                   <div class="space-10"></div>    
                    
                <div  >
                  <input type="checkbox" id="39003" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Loan Status</div>
              
                     <div class="space-10"></div>   
                      
                <div class="inactiveLink ">
                  <input type="checkbox" id="39006" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Risk Cover</div>
                  
              
                     </div>
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     <div class="col-md-2"></div>
                     <div class="col-md-3 col-sm-6 col-xs-12 ">
                    
                     <div class="space-10"></div>  
                     <div class="inactiveLink ">
                  <input type="checkbox" id="39006" name="fps" value="" checked/>
                   Retirement Readiness</div>
                 
                  
                  
                  
                     <div class="space-10"></div>  
                     <div class="inactiveLink ">
                  <input type="checkbox" id="39006" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Risk Profile</div>
                  
                  
                  
                
                     <div class="space-10"></div>  
                     <div class="inactiveLink ">
                  <input type="checkbox" id="39006" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Succession Readiness</div>
                  
                  
                  
                     <div class="space-10"></div>  
                     
                     <div class="inactiveLink ">
                  <input type="checkbox" id="39006" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Retirement Readiness</div>
                  </div>
                  
                  
                  <div class="col-md-2"></div>
                  
                  </div>
                     
                   
                    
                     
                     
                     
                
                     
              
              
              </div>
              
         		<!-- <div class="row">
         		<div class="col-lg-12">
         		
         			<div class="col-md-6">
         				<input type="checkbox" id="39001" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Emergency
         			</div>
         			<div class="col-md-6">
         				<input type="checkbox" id="39002" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Cash Flow
         			</div>
         			<div class="col-md-6">
         				<input type="checkbox" id="39008" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Loan Status
         			</div>
         			<div class="col-md-6">
         				<input type="checkbox" id="39008" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Loan Status
         			</div>
         			<div class="col-md-6">
         				<input type="checkbox" id="39003" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Risk Cover
         			</div>
         			<div class="col-md-6">
         				<input type="checkbox" id="39009" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Risk Profile
         			</div>
         			<div class="col-md-6">
         				<input type="checkbox" id="39006" name="fps" value="" checked/>
                  <span class="custom_checkbox"></span> Retirement Readiness
         			</div>
         			<div class="col-md-6">
         				<input type="checkbox" id="39007" name="fps" value="" checked/>
                  <span class="custom_checkbox "></span> Succession Readiness
         			</div>
         		</div>
         	                   
            </div>
 -->


           
         
          
        </section>
        </div> 
       
       
        
         
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
      
    <!-- Common_content Ends--> 
    
  </section>
  </section>
  </div>
 
  <!-- Main ends--> 
  
  
 <!--  <div class="slimScrollRail" style="width: 11px; height:50%; position: absolute; top: 0px; display: block; border-radius: 7px; background: none repeat scroll 0% 0% rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div> -->
   

 <section class="common_footer_actions">
      <div class="row">
        
        
        
        <div class=" col-md-12 col-sm-12 col-xs-12 centerAll">
        
          
          
            <button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa fa-file-code-o bigger-200"></i> Save </button>
            <button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa fa-newspaper-o bigger-200"></i> Cancel </button>
          
         
     
        </div>
        
      </div>
    </section>
<!-- Wrapper ends--> 
<!-- For Common Custom File Input--> 
<script src="../js/plugin/jquery-filestyle.js"></script> 
<!-- For Common Custom File Input Ends-->
<script>
var tempids='';
function saveFpSection(){
	checkedIds='';
 	checkedIds =checkedIds+  $(":checkbox:checked").map(function() {
	       return this.id;
    }).get(); 
  
 	var sessionId = '${sections}';
	if(sessionId == checkedIds || checkedIds=='' || checkedIds== tempids)
		{ 
		$("#successDialog").html("You haven't changed any data yet.Please make some changes and then save.");
		$( "#successDialog").dialog( "open" ); 
		}
	else{
		tempids = checkedIds;
	var clientPartyId = '${clientPartyId}';
	$.ajax({
		url:"${pageContext.request.contextPath}/partner/saveInterstedFpSection",
		type: "GET",
		data: {'sectionId':checkedIds,'clientPartyId':clientPartyId},
		success: function(data){
			$("#successDialog").html("Interested FP section saved successfully. ");
			$( "#successDialog").dialog( "open" ); 
			
			}
	});
	}
	   
}

function redirectOnCancel(){
	var clientPartyId = '${clientPartyId}';
	if(clientPartyId!=null && clientPartyId!='')
		window.location.replace('${pageContext.request.contextPath}/partner/datacollection/'+clientPartyId+'/'+'${headerName}'+'/2');
	else
		window.location.replace('${pageContext.request.contextPath}/partner/dashboard?flag=0');
			
}
</script>
</body>
</html>
