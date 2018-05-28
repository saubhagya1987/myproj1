<%-- <%@page import="in.fiinfra.profile.ctrl.ProfileController"%>
 --%><%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%-- <% 
 UserSession user = AuthHandler.getCurrentUser();

String theme = ProfileController.getThemePath(user);

if(theme != null){ %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
<%} %>
 --%><!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />-->
        <c:choose>
        	<c:when test="${jspType eq 'fr'}">
        		<title>Asset Allocation</title>
        	</c:when>
	        <c:otherwise>
	        	<title>What If Asset Allocation</title>
	        </c:otherwise>
        </c:choose>
        <%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/basic.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/jquery-ui.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/perfect-scrollbar.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/custom.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/main.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/diy/responsive.css" />
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/plugin/selectboxit.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.mousewheel.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.autosize.input.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.validate.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/plugin/additional-methods.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
        <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
        <![endif]-->

        <style type="text/css">
#container { width: 1000px; height: auto; z-index: 10 }
#wrap-chart1 { height:315px; width:956px; position: relative; display: block; float: left; padding: 0 34px; background-color: #FFFDF6 }
#chart1 { width:1400px; position: relative; display: block; float: left; z-index: 1 }
.wrap-dragitem { z-index:12; width:auto; min-width: 100px; display: inline-block; border:solid 1px #952754; padding: 10px; margin: 0 auto; }
.dragitem { z-index: 210; float:left; color:#303030;/*border: solid 1px #999999;*/ background: transparent; width:66px; height: 40px; z-index: 100; cursor: move; line-height: 20px; vertical-align: middle; text-align: left; opacity: .8; font-size: 12px; font-family: "Trebuchet MS", ​Arial, ​Helvetica, ​sans-serif; color: #4F4D4E; margin-right: 2px; border-radius: 3px; opacity:.9 }
.dragitem:hover { opacity: 1; background-color: #F2F2F2; color: #000 }
.dragitem-other { z-index: 210; float:left; color:#303030;/*border: solid 1px #999999;*/ background: transparent; width:66px; height: 40px; z-index: 100; cursor: move; line-height: 20px; vertical-align: middle; text-align: left; opacity: .8; font-size: 12px; font-family: "Trebuchet MS", ​Arial, ​Helvetica, ​sans-serif; color: #4F4D4E; margin-right: 2px; border-radius: 3px; opacity:.9; margin-left:20px; }
.dragitem-other:hover { opacity: 1; background-color: #F2F2F2; color: #000 }
.dragitem span.icn-car { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-cars.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center }
.dragitem.dropped { background: url('${pageContext.request.contextPath}/resources/images/icn-goalfocus.png') no-repeat 0 0 transparent; color: transparent; border:0; margin: 0; height: 60px }
/************* EDUCATION ************/			 
		  .dragitem span.icn-edu { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-education.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center }
.dragitem.dropped span.icn-edu { height: 60px; color: transparent }
#dragitem1 span.icn-edu { background-position: 17px -1 }
#dragitem2 span.icn-edu { background-position: -46px 0 }
.dragged1 span.icn-edu { background-position: 2px 16px }
.dragged2 span.icn-edu { background-position: -53px 16px }
/************* TRAVEL ************/			 
		  .dragitem span.icn-travel { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-travel.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center }
.dragitem.dropped span.icn-travel { height: 60px; color: transparent }
#dragitem3 span.icn-travel { background-position: 17px -1 }
#dragitem4 span.icn-travel { background-position: -46px 0 }
.dragged3 span.icn-travel { background-position: -1px 16px }
.dragged4 span.icn-travel { background-position: -52px 16px }
/************* CAR ************/		   
		   .dragitem span.icn-car { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-cars.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center }
.dragitem.dropped span.icn-car { height: 60px; color: transparent }
#dragitem21 span.icn-car { background-position: 17px 0 }
#dragitem22 span.icn-car { background-position: -46px 0 }
#dragitem23 span.icn-car { background-position: -119px 0 }
#dragitem24 span.icn-car { background-position: -190px 0 }
#dragitem25 span.icn-car { background-position: -262px 0 }
#dragitem26 span.icn-car { background-position: -337px 0 }
.dragged21 span.icn-car { background-position: 17px 16px }
.dragged22 span.icn-car { background-position: -46px 16px }
.dragged23 span.icn-car { background-position: -119px 16px }
.dragged24 span.icn-car { background-position: -190px 16px }
.dragged25 span.icn-car { background-position: -262px 16px }
.dragged26 span.icn-car { background-position: -337px 16px }
/************* PROPERTY ************/		   
		   .dragitem span.icn-property { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-property.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center }
.dragitem.dropped span.icn-property { height: 60px; color: transparent }
#dragitem5 span.icn-property { background-position: 19px 0 }
#dragitem6 span.icn-property { background-position: -36px 0 }
#dragitem7 span.icn-property { background-position: -90px 0 }
#dragitem8 span.icn-property { background-position: -143px 0 }
#dragitem9 span.icn-property { background-position: -196px 0 }
.dragged5 span.icn-property { background-position: 15px 16px }
.dragged6 span.icn-property { background-position: -39px 16px }
.dragged7 span.icn-property { background-position: -92px 16px }
.dragged8 span.icn-property { background-position: -146px 16px }
.dragged9 span.icn-property { background-position: -200px 16px }
/************* WEDDING ************/			 
		  .dragitem span.icn-wedding { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-wedding.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center }
.dragitem.dropped span.icn-wedding { height: 60px; color: transparent }
#dragitem10 span.icn-wedding { background-position: 17px -1px }
#dragitem11 span.icn-wedding { background-position: -29px 0 }
.dragged10 span.icn-wedding { background-position: 14px 17px }
.dragged11 span.icn-wedding { background-position: -30px 15px }
/************* BUSINESS ************/	
		   .dragitem span.icn-business { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-business.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center; margin:0 }
.dragitem.dropped span.icn-business { height: 60px; color: transparent }
#dragitem12 span.icn-business { background-position: 4px 0 }
.dragged12 span.icn-business { background-position: 4px 16px }
/************* SPECIAL GOALS ************/			 
		  .dragitem-other span.icn-special { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-special.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center; margin:0px 0px 0px 0px; }
.dragitem-other.dropped span.icn-special { height: 60px; color: transparent }
#dragitem13 span.icn-special { background-position: 4px 0px }
.dragged13 span.icn-special { background-position: 7px 18px }
/************* OTHER GOALS ************/			 
		  .dragitem-other span.icn-other { z-index: 1; background: url('${pageContext.request.contextPath}/resources/images/icns-others.png') no-repeat 0 0 transparent; width: 66px; height: 40px; display: inline-block; line-height: 68px; vertical-align: bottom; text-align: center; margin:5px 0px 0px 2px; }
.dragitem-other.dropped span.icn-otherl { height: 60px; color: transparent }
#dragitem14 span.icn-other { background-position: 4px 0px }
.dragged14 span.icn-other { background-position: 4px 16px }
.jqplot-goal-tooltip { background: none repeat scroll 0 0 #F1F1F1; border: 1px solid #952754; border-radius: 3px; color: #000000; font-size:10px; opacity: .8; width: 60px; height: 30px; line-height:14px; left: -60px; padding: 3px; position: absolute; top: -22px; }
.dragitem:hover .jqplot-goal-tooltip { opacity: 1 }
.jqplot-point-label { font-size: 10px }
.jqplot-point-label:hover { color: #000 }
div.scrollingHotSpotLeft { background: url("${pageContext.request.contextPath}/resources/images/icns-slidenav.png") no-repeat -30px center transparent; /*cursor: none !important;*/ height: 30px; left: 80px; width: 30px; min-width: 30px !important; position: absolute; z-index: 200; padding: 114px 0; }
div.scrollingHotSpotRight { background: url("${pageContext.request.contextPath}/resources/images/icns-slidenav.png") no-repeat left center transparent; /*cursor: none !important;*/ height: 30px; right: 0; width: 30px; min-width: 30px !important; position: absolute; z-index: 200; padding: 114px 0; }
.jqplot-yaxis { position: absolute !important; z-index: 111; background: #fff }
.jqplot-yaxis-tick { right: 2px }
 //.jqplot-xaxis-label {
left: 300px !important
}
.scrollWrapper { z-index:11 }
#nav-goals { position: relative; height: 160px }
#nav-goals #nav-main { background-color: #F2F2F2;/*padding-top: 20px;*/ }
#nav-goals ul { position: relative; display: inline-block; margin: 0; height: 78px; clear: both }
#nav-goals ul li { position: relative; list-style: none; width:60px; height: 78px; line-height: 120px; vertical-align: bottom; text-align: center; float:left; background-color: #F2F2F2; color: #747474; margin: 0 30px 0; cursor: pointer; z-index: 12; border: solid 1px transparent; border-bottom: 0; background: url('${pageContext.request.contextPath}/resources/images/icns-goals.png') no-repeat 0 0 transparent; }
#nav-goals ul li:first-child { margin-left: 10px }
#nav-goals ul li:hover, #nav-goals ul li.active { }
#nav-goals ul li.active { height: 80px; border: solid 1px #962855; color: #962855; border-bottom: 0; background-color: #fff; z-index: 14; }
#nav-goals ul li.edu { background-position: 10px top }
#nav-goals ul li.travel { background-position: -117px top }
#nav-goals ul li.car { background-position: -244px top }
#nav-goals ul li.property { background-position: -368px top }
#nav-goals ul li.wedding { background-position: -495px top }
#nav-goals ul li.business { background-position: -622px top }
#nav-goals ul li.spc_goals { background-position: -745px top }
#nav-goals ul li.others { background-position: -870px top }
#pnl-dragitems { position: relative; }
#wrap-dragitems { z-index: 11; width: 100%; height: 54px; background-color: #FFFFFF; clear:both; position: absolute; top: 100px }
#wrap-dragitems-travel { z-index: 11; width: 100%; height: 54px; background-color: #FFFFFF; clear:both; position: absolute; top: 100px }
#wrap-dragitems .wrap-dragitem { display:none; background-color: #fff; z-index: 10; width:auto; height: 40px; position: absolute; padding: 6px }
#wrap-dragitems .wrap-dragitem.car { width: 420px; left: 100px }
.education-align { margin:-20px 0px 0px 0px; }
.car-align { margin:-20px 0px 0px 0px; }
.travel-align { margin:-20px 0px 0px 122px; }
.property-align { margin:-20px 0px 0px 270px; }
.wedding-align { margin:-20px 0px 0px 495px; }
.business-align { margin:-20px 0px 0px 632px; }
.special-align { margin:-20px 0px 0px 757px; }
.other-align { margin:-20px 0px 0px 876px; }
</style>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style> 
        
 <!-- custom scroll to "common_in_content" --> 
<script>
var initialData = [];
var finalData = [];
function checkDataInitial(){
	initialData = [];
	initialData.push($(".counter_1").val());
	initialData.push($(".counter_2").val());
	initialData.push($(".counter_3").val());
	initialData.push($(".counter_4").val());
	initialData.push($(".counter_5").val());
	initialData.push($(".counter_6").val());
	initialData.push($(".counter_7").val());
	
}
function checkDataFinal(){
	finalData = [];
	finalData.push($(".counter_1").val());
	finalData.push($(".counter_2").val());
	finalData.push($(".counter_3").val());
	finalData.push($(".counter_4").val());
	finalData.push($(".counter_5").val());
	finalData.push($(".counter_6").val());
	finalData.push($(".counter_7").val());
	
}

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
}	

function cancel(url){
	 checkDataFinal();
		if(initialData.toString() == finalData.toString()){ 
			javascript:location.href=url;
		 }else{
			 
			 $(".aa_up").html("<spring:message code='dataChanged' />");
				$(".aa_yes").click(function(){
				cancelPage(url);
				});	
				$(".overlay").fadeIn();
				$("#confirmDialog").fadeIn();
		} 
	}
	function back(url){
		javascript:location.href=url;
	}

	function cancelPage(url){
		javascript:location.href=url;
	}
	
$(document).ready(function(){
   // $('.middle_bx').slimScroll();
   
	var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});

	$("#confirmDialog .close").click(function(){
		    $(".overlay").fadeOut("slow");
		 $("#confirmDialog").fadeOut("slow");
		  }); 

	checkDataInitial();
	
  });

</script>


</head>
        
<!-- Wrapper starts-->

<div class="wrapper"> 
			<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
			<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
 			 </div>
			</div>			
          <!-- Main starts-->
          <section class="main"> 
          <%-- <jsp:include page="../layout/DcLayout.jsp"></jsp:include> --%>
          <!-- Common_content Starts-->
          <!-- Common_in_contnet starts-->
        <section class="in_content common_in_content clearfix" id="what_if">
        <c:if test="${jspType eq 'whatIf'}">
        <div class="top">
                  <div class="show clearfix">
            <p><span>What If</span> Analysis </p>
            <div class="arrow"></div>
          </div>
                  <div id="initial_asset" class="display_box clearfix">
            <div class="icon"></div>
            <p class="txt">Intial asset value</p>
            <fmt:formatNumber var="toatalInitialAsset_format" type="number" maxFractionDigits="2" value="${toatalInitialAsset}"/>
            <div class="value">${toatalInitialAsset_format}</div>
            <div class="action">+</div>
          </div>
          <div id="monthly_saving" class="display_box clearfix">
           <fmt:formatNumber var="toatalMonthlyInvestment_format" type="number" maxFractionDigits="2" value="${toatalMonthlyInvestment}"/>
            <p class="txt">Monthly Investment</p>
            <div class="value">${toatalMonthlyInvestment_format}</div>
          </div>
                  <a class="back" href="${pageContext.request.contextPath}/whatIf/graph/${partyId}">Back</a> </div>
         </c:if>
        <div id="container" class="clearfix">
                  <div id="bucket_allocation">
            <!-- <div style="width:auto; height:50px;">
                      <section class="common_unit_selector">
                <ul class="clearfix reset">
                          <li class="k"><span class="unit">K</span></li>
                          <li class="lacs unit_selected"><span class="unit">Lac</span></li>
                          <li class="cr"><span class="unit">Cr</span></li>
                        </ul>
                <p>All figures are in :</p>
              </section>
                    </div>
             -->
                <c:if test="${jspType eq 'whatIf'}">
                <div style="text-align: center;margin-bottom:10px;margin-top: 10px;font-size: 18px;">${headerName}</div>
                </c:if>
                <div id="bucket_allocation_bx">
                <ul class="reset clearfix bucket_allocation_bx_ul">
                <li class="input_title_one fl">Asset</li>
                <li class="input_title_two fl">Total Current Value in <img src="${pageContext.request.contextPath}/resources/images/rupee_thumb_white_allo.png" width="9" height="15" alt=""></li>
                <li class="input_title_three fl">Additional Monthly Investment in <img src="${pageContext.request.contextPath}/resources/images/rupee_thumb_white_allo.png" width="9" height="15" alt=""></li>
                <li class="input_title_four fl">% Available to Goals</li>
                <li class="input_title_five fl">Available Funds in <img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" width="7" height="12" alt=""></li>
              </ul>
                <form name="whatIfAnalysisfrm" id="whatIfAnalysisfrm" method="post" action="${pageContext.request.contextPath}/partner/saveAssetAllocation">
                      <input type="hidden" name="redirectURL" value="${redirectUrl}"/>
                      <div class="middle_bx">
                      <c:set var="total_initial_asset" value="0"/>
                      <c:set var="ctr" value="1"></c:set>
                       <core:forEach items="${whatIfDataList}" varStatus="counter" var="whatIfData">
                <ul class="reset clearfix bucket_allocation_bx_ul">
                          <li class="input_one fl">${whatIfData.assetName}</li>
                          <li class="input_two fl">
                    <input type="text" disabled class="input_dis" value="${whatIfData.currentValue}">
  </li>
                          <li class="input_three fl">
                    <input type="text" disabled class="input_dis" value="${whatIfData.monthlyInvest}">
</li>
                          <li class="input_four fl">
                    <input type="text" class="input number required Number counter_${ctr}" name="${whatIfData.id}" id="${whatIfData.id}" value="${whatIfData.availableToGoals}" onchange="doCalculation(${whatIfData.id},${whatIfData.currentValue},value,${(whatIfData.currentValue*whatIfData.availableToGoals)/100},${toatalInitialAsset})"/> %
</li>
                          <li class="input_five fl">
                       <fmt:formatNumber var="available_funds" type="number" maxFractionDigits="2" value="${(whatIfData.currentValue*whatIfData.availableToGoals)/100}" />
                         
                    <input type="text"  id="available_funds_${whatIfData.id}" disabled class="input_dis" value="${available_funds}">
</li>
                        </ul>
                         <c:set var="total_initial_asset" value="${total_initial_asset+(whatIfData.currentValue*whatIfData.availableToGoals)/100}"/>
                         <c:set var="ctr" value="${ctr+1}"/>
                        </core:forEach>
              </div>
               </form>
               <%-- <c:if test="${toatalInitialAsset > 0}"> --%>
                <div class="total_bx fr">
                <label>Initial Asset Value <img src="${pageContext.request.contextPath}/resources/images/rupee_thumb_white_allo.png" width="9" height="15" alt=""></label>
                <fmt:formatNumber var="total_initial_asset_format" type="number" maxFractionDigits="2" value="${total_initial_asset}"/>
                <input type="hidden" id="totalInitialAssetValueHidden" name="totalInitialAssetValueHidden" value="${total_initial_asset}"/>
                <input type="text" class="input_dis" id="totalInitialAssetValue" value="${total_initial_asset_format}" readonly="readonly">
        		</div>
        
        <div class="btn_bx fl">
               
                    	<input type="button" class="cancel_btn saveCFSAssetAllocationLink whatifAssetAllocationSaveLink" value="SUBMIT" onclick="javascript:doSubmit()">
                        <input type="button" class="cancel_btn" value="CANCEL" onclick="javascript:doCancel()">
        </div>
        <%-- </c:if> --%>
                      <div class="clr"></div>
                    </div>
          </div>
                </div>
      </section>
          <!-- Common_in_contnet ends --> 
            </section>
    <!-- Common_content Ends--> 
          <!-- Main ends--> 
        </div>
<div id="datapos" style="width:100%;height:100px;background-color: #ccc;float: right;display:none"></div>
<!-- Wrapper ends-->
</body>
</html>
<script type="text/javascript">

$(document).ready(function(){
	
	// To fix color and background of disabled input box in internet explorer
	var ms_ie = false;
    var ua = window.navigator.userAgent;
    var old_ie = ua.indexOf('MSIE ');
    var new_ie = ua.indexOf('Trident/');

    if ((old_ie > -1) || (new_ie > -1)) {
        ms_ie = true;
    }

    if ( ms_ie ) {
        //IE specific code goes here
	$("#bucket_allocation_bx .input_dis").css({"background-color":"#636363","color":"#fff"});
	
    }
	// To fix color and background of disabled input box in internet explorer
	
	$("li").addClass("rel");
	$("#whatIfAnalysisfrm").validate({
		ignore:'.ignore', //i.e. do not ignore hidden elements	
		rules:{
		<core:forEach items="${whatIfDataList}" varStatus="counter" var="whatIfData">
			${whatIfData.id}:{ min:0, max:100},
		</core:forEach>
		}
		
	});
	
	// allow only numeric key typping
	$('.Number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
	
});

function doCalculation(idVar,totalCurrentValue,availabeleToGoals,availableToFundsOld,initialAssetValue)
{
	var initialAssetValue = parseFloat($("#totalInitialAssetValueHidden").val());
	var totalInitialAssetValue = parseFloat(initialAssetValue) - parseFloat(availableToFundsOld);
	var availableToFundsNew = (parseFloat(totalCurrentValue)*parseFloat(availabeleToGoals))/100;
	totalInitialAssetValue = totalInitialAssetValue + availableToFundsNew;
	$("#available_funds_"+idVar).val(availableToFundsNew);
	$("#totalInitialAssetValueHidden").val(totalInitialAssetValue);
	$("#totalInitialAssetValue").val(totalInitialAssetValue);
}

<core:forEach items="${whatIfDataList}" varStatus="counter" var="whatIfData">
	$("#${whatIfData.id}").rules("add",{ min:0, max:100});
</core:forEach>
	

function doSubmit()
{
	checkDataFinal();
	if(initialData.toString() == finalData.toString()){ 
		alertMessage("You haven't changed any data yet. Please make some changes then save.");
	}
	else {
		$("#whatIfAnalysisfrm").submit();
	}
}
function doCancel()
{
	<c:choose>
	<c:when test="${not empty redirectUrl}">
		cancel('${pageContext.request.contextPath}${redirectUrl}');
	</c:when>
	<c:otherwise>
		cancel('${pageContext.request.contextPath}/whatIf/graph/${partyId}');
	</c:otherwise>		
</c:choose>
	
}

</script>
