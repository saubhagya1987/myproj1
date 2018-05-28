<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   String theme = PartnerProfileController.getThemePath(user);
%>
<!DOCTYPE html>
<html>
<head>



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
	
	/* var assetSave = "${assetSave}";
	var pieces = assetSave.split(",");
	for(var i=0;i<pieces.length;i++){
	 $("."+pieces[i]).attr("href","#");
	 $("."+pieces[i]).removeAttr('onclick');
	 $("."+pieces[i]).addClass("inactiveLink");
	} */
	/* if( partnerSetupLinks != "" ){
	  $("#whatIfAnalysisfrm").attr("action","#");
	} */
  });

</script>


</head>
<body>
	<!-- Wrapper starts-->
	<div>
		<div id="dialog1" class="common_dialog" style="text-align: center;">
		</div>
		<div id="confirmDialog" class="common_custom_modal_aa">
			<span class="close">X</span>
			<div class="modal_content">
				<div class="aa_up">
					<spring:message code="dataChanged" />
				</div>
				<div class="aa_down">
					<a style="cursor: pointer;" class="aa_yes">Yes </a> <a
						style="cursor: pointer;" onclick="closeDialog();" class="aa_no">No</a>
				</div>
			</div>
		</div>
		<!-- Main starts-->
		<!-- <section class="main">  -->
				<!-- Common_in_contnet starts-->
				<!-- Common_content Starts-->
			<section class="content common_content">
				<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>

				<div class="clr"></div>
				

		<section class="in_content common_in_content clearfix" id="what_if">
			<c:if test="${jspType eq 'whatIf'}">
				<div class="top">
					<div class="show clearfix">
						<p>
							<span>What If</span> Analysis
						</p>
						<div class="arrow"></div>
					</div>
					<div id="initial_asset" class="display_box clearfix">
						<div class="icon"></div>
						<p class="txt">Intial asset value</p>
						<fmt:formatNumber var="toatalInitialAsset_format" type="number"
							maxFractionDigits="2" value="${toatalInitialAsset}" />
						<div class="value">${toatalInitialAsset_format}</div>
						<div class="action">+</div>
					</div>
					<div id="monthly_saving" class="display_box clearfix">
						<fmt:formatNumber var="toatalMonthlyInvestment_format"
							type="number" maxFractionDigits="2"
							value="${toatalMonthlyInvestment}" />
						<p class="txt">Monthly Investment</p>
						<div class="value">${toatalMonthlyInvestment_format}</div>
					</div>
					<a class="back"
						href="${pageContext.request.contextPath}/whatIf/graph/${partyId}">Back</a>
					<%-- <c:if test="${jspType eq 'whatIf'}"> --%>
					<div
						style="text-align: center; margin-bottom: 10px; margin-top: 10px; font-size: 18px;">${headerName}</div>
					<%-- </c:if> --%>
				</div>
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
					<div id="bucket_allocation_bx">
						<ul class="reset clearfix bucket_allocation_bx_ul">
							<li class="input_title_one fl">Asset</li>
							<li class="input_title_two fl">Total Current Value in <img
								src="${pageContext.request.contextPath}/resources/images/rupee_thumb_white_allo.png"
								width="9" height="15" alt=""></li>
							<li class="input_title_three fl">Additional Monthly
								Investment in <img
								src="${pageContext.request.contextPath}/resources/images/rupee_thumb_white_allo.png"
								width="9" height="15" alt="">
							</li>
							<li class="input_title_four fl">% Available to Goals</li>
							<li class="input_title_five fl">Available Funds in <img
								src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png"
								width="7" height="12" alt=""></li>
						</ul>
						<form name="whatIfAnalysisfrm" id="whatIfAnalysisfrm"
							method="post"
							action="${pageContext.request.contextPath}/whatIf/saveAnalysis">
							<input type="hidden" name="redirectURL"
								value="${redirectUrl}<% if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>/?fromWhatIf=yes<%}%>" />
							<div class="middle_bx">
								<c:set var="total_initial_asset" value="0" />
								<c:set var="ctr" value="1"></c:set>
								<core:forEach items="${whatIfDataList}" varStatus="counter"
									var="whatIfData">
									<ul class="reset clearfix bucket_allocation_bx_ul">
										<li class="input_one fl">${whatIfData.assetName}</li>
										<li class="input_two fl"><input type="text" disabled
											class="input_dis" value="${whatIfData.currentValue}">
										</li>
										<li class="input_three fl"><input type="text" disabled
											class="input_dis" value="${whatIfData.monthlyInvest}">
										</li>
										<li class="input_four fl"><input type="text"
											class="input number required Number counter_${ctr}"
											name="${whatIfData.id}" id="${whatIfData.id}"
											value="${whatIfData.availableToGoals}"
											onchange="doCalculation(${whatIfData.id},${whatIfData.currentValue},value,${(whatIfData.currentValue*whatIfData.availableToGoals)/100},${toatalInitialAsset})" />
											%</li>
										<li class="input_five fl"><fmt:formatNumber
												var="available_funds" type="number" maxFractionDigits="2"
												value="${(whatIfData.currentValue*whatIfData.availableToGoals)/100}" />

											<input type="text" id="available_funds_${whatIfData.id}"
											disabled class="input_dis" value="${available_funds}">
										</li>
									</ul>
									<c:set var="total_initial_asset"
										value="${total_initial_asset+(whatIfData.currentValue*whatIfData.availableToGoals)/100}" />
									<c:set var="ctr" value="${ctr+1}" />
								</core:forEach>
							</div>
						</form>
						<%-- <c:if test="${toatalInitialAsset > 0}"> --%>
						<div class="total_bx fr">
							<label>Initial Asset Value <img
								src="${pageContext.request.contextPath}/resources/images/rupee_thumb_white_allo.png"
								width="9" height="15" alt=""></label>
							<fmt:formatNumber var="total_initial_asset_format" type="number"
								maxFractionDigits="2" value="${total_initial_asset}" />
							<input type="hidden" id="totalInitialAssetValueHidden"
								name="totalInitialAssetValueHidden"
								value="${total_initial_asset}" /> <input type="text"
								class="input_dis" id="totalInitialAssetValue"
								value="${total_initial_asset_format}" readonly="readonly">
						</div>

						<div class="btn_bx fl">

							<input type="button"
								class="cancel_btn saveCFSAssetAllocationLink whatifAssetAllocationSaveLink"
								value="SUBMIT" onclick="javascript:doSubmit()"> <input
								type="button" class="cancel_btn" value="CANCEL"
								onclick="javascript:doCancel()">
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
		<!-- </section> -->
		<!-- Main ends-->
	</div>
	<div id="datapos"
		style="width: 100%; height: 100px; background-color: #ccc; float: right; display: none"></div>
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
	/* $("#whatIfAnalysisfrm").validate({
		ignore:'.ignore', //i.e. do not ignore hidden elements	
		rules:{
		<core:forEach items="${whatIfDataList}" varStatus="counter" var="whatIfData">
			${whatIfData.id}:{ min:0, max:100},
		</core:forEach>
		}
		
	});
	 */
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

/* <core:forEach items="${whatIfDataList}" varStatus="counter" var="whatIfData">
	$("#${whatIfData.id}").rules("add",{ min:0, max:100});
</core:forEach> */
	

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
		cancel('${pageContext.request.contextPath}${redirectUrl}<% if(request.getParameter("fromWhatIf")!=null && request.getParameter("fromWhatIf").equals("yes")){%>/?fromWhatIf=yes<%}%>');
	</c:when>
	<c:otherwise>
		cancel('${pageContext.request.contextPath}/whatIf/graph/${partyId}');
	</c:otherwise>		
</c:choose>
	
}

</script>
