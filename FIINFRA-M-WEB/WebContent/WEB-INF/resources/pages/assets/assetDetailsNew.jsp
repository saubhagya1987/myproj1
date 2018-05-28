<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<!-- Custom Selectbox starts -->
<style>
.no_data_message{ color:#942754; font-family: "aller bold"; font-size: 17px; height:43px; position:relative; text-align: center; padding-top: 14px; background-color:#FFF; }
.no_data_message:after{ position:absolute; content:"";width:100%;background: url(../resources/images/shadow_list.png) no-repeat center bottom; height:10px;left:0; right:0; bottom:0}
.ui-widget-header a {
color: #EDDDDD;
}
.common_btn {
	width: 67px;
	height: 24px;
	line-height: 26px;
	margin: -7px 2px 1px 0px;
	font-family: allerregular;
	font-size: 14px;
	color: rgb(255, 255, 255);
}
.ui-widget-content a {
color: #fff;
}
</style>
<script>
$(document).ready(function(){
  	$( "#tabs" ).tabs();
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 });
</script>
<!-- Custom Selectbox Ends -->
<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
  	
    $('.asset_details_bx').slimScroll();
$('#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_one .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_two .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_three .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_four .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_five .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_six .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_seven .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_eight .txt,#asset-details #tabs-1 .my_fd_li_bx_in .input_txt_nine_one .txt').perfectScrollbar();

	$('#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_one .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_two .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_three .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_four .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_five .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_six .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_seven .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_eight .txt,#asset-details #tabs-1 .my_rd_li_bx_in .input_txt_nine_one .txt').perfectScrollbar();
	
	//$('#asset-details #tabs-3 .my_mf_li_bx_in .input_txt_one .txt').perfectScrollbar();

	 $("#tabs #ui-id-3").click(function(){
  // alert("The paragraph was clicked.");
   $('#asset-details #tabs-3 .my_mf_li_bx_in .input_txt_one .txt,#asset-details #tabs-3 .my_mf_li_bx_in .input_txt_one_one .txt,#asset-details #tabs-3 .my_mf_li_bx_in .input_txt_two .txt,#asset-details #tabs-3 .my_mf_li_bx_in .input_txt_three .txt,#asset-details #tabs-3 .my_mf_li_bx_in .input_txt_eight .txt,#asset-details #tabs-3 .my_mf_li_bx_in .input_txt_eleven .txt,#asset-details #tabs-3 .my_lumpsum_li_bx_in .input_txt_one_one .txt,#asset-details #tabs-3 .my_lumpsum_li_bx_in .input_txt_one .txt,#asset-details #tabs-3 .my_lumpsum_li_bx_in .input_txt_two .txt,#asset-details #tabs-3 .my_lumpsum_li_bx_in .input_txt_three .txt,#asset-details #tabs-3 .my_lumpsum_li_bx_in .input_txt_four .txt,#asset-details #tabs-3 .my_lumpsum_li_bx_in .input_txt_eight .txt').perfectScrollbar();
  });

	 $("#tabs #ui-id-6").click(function(){
  // alert("The paragraph was clicked.");
   $('#asset-details #tabs-6 .my_stock_li_bx_in .input_txt_one .txt,#asset-details #tabs-6 .my_stock_li_bx_in .input_txt_two .txt,#asset-details #tabs-6 .my_stock_li_bx_in .input_txt_three .txt').perfectScrollbar();
  });
	
//	$('').perfectScrollbar();
	
	
	<c:choose>
		<c:when test="${not(empty assetPage)}">
			$("#ui-id-${assetPage}").click();
		</c:when>
		<c:otherwise>
			$("#ui-id-3").click();
		</c:otherwise>
	</c:choose>
	 
  });
  
  
</script>
<!-- custom scroll to "common_in_content" -->
<!-- Wrapper starts-->
<div class="wrapper" id="asset-details"> 
  <!-- Main starts-->
  <section class="main">
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
     <form:form id="assetDetails" method="POST" action="${pageContext.request.contextPath}/assets/assetDetails">
     <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
     <div id="dialog1" class="common_dialog" style="text-align: center;"> </div> 
      <section class="common_in_content auto_plan_in clearfix" id="my_assets">
        <div style="padding:10px 10px 0;">
          <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
            <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
                   <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-3" aria-labelledby="ui-id-3" aria-selected="false"><a href="#tabs-3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">Mutual Fund</a></li>
              <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-6" aria-labelledby="ui-id-6" aria-selected="false"><a href="#tabs-6" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-6">Shares</a></li>
           <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tabs-1" aria-labelledby="ui-id-1" aria-selected="false"><a href="#tabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">Deposits</a></li>
            <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-2" aria-labelledby="ui-id-2" aria-selected="false"><a href="#tabs-2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">Retirement Funds</a></li>
              <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-4" aria-labelledby="ui-id-4" aria-selected="false"><a href="#tabs-4" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-4">Gold</a></li>
              <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-5" aria-labelledby="ui-id-5" aria-selected="false"><a href="#tabs-5" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-5">Property</a></li>
              <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-5" aria-labelledby="ui-id-5" aria-selected="false"><a href="#tabs-7" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-7">Others</a></li>
              <a class="fr common_back_btn eastspace2" href="${pageContext.request.contextPath}/assets/assetSummary/${partyId}">Back</a>
            </ul>
            
            <div id="tabs-1" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-1" role="tabpanel" aria-expanded="true" aria-hidden="false">
               <c:if test="${empty assetFixedDepositsList and empty assetRecurringDepositsList and empty assetBankDepositsList}">
               <c:set var="amt" value="${DepositsAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	            </c:if> 
              You have declared <b class="theme_color">${amt} ${unit}</b> of Deposit in financial plan.
              </c:if>
              <a class="common_btn fr add_more" id = "addMoreBankDeposit">Add More</a>
              
              <div class="asset_details_bx">
                <!--title starts-->
                <div class="my_fd_title_main_title">Fixed Deposits</div>
                <div class="my_fd_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Asset Name</li>
                    <li class="input_title_three fl">Bank Name</li>
                    <li class="input_title_four fl">A/C No.</li>
                    <li class="input_title_five fl">Commencement Date</li>
                    <li class="input_title_six fl">Amount Deposited</li>
                    <li class="input_title_eight_two fl">Maturity Date</li>
                    <li class="input_title_nine fl">Maturity Value</li>
                    <li class="input_title_ten fl">Interest Rate</li>
                    <!-- <li class="input_title_eleven fl">Current Balance</li> -->
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                <!--title ends--> 
                <!--txt starts-->
                <c:choose>
              	<c:when test="${fn:length(assetFixedDepositsList) > 0}">
                <div class="my_fd_li_bx ">
                <c:forEach var="asset" items="${assetFixedDepositsList}">
                  <div class="my_fd_li_bx_in">
                    <ul>
                      <li class="input_txt_one fl">
                        <div class="txt">${asset.ownerName}</div>
                      </li>
                      <li class="input_txt_two fl">
                        <div class="txt">${asset.assetName}</div>
                      </li>
                      <li class="input_txt_three fl">
                        <div class="txt">${asset.bankName}</div>
                      </li>
                      <li class="input_txt_four fl">
                        <div class="txt">${asset.accountNumber}</div>
                      </li>
                      <li class="input_txt_five fl">
                        <div class="txt">${asset.commcementDate}</div>
                      </li>
                      <li class="input_txt_six fl">
                        <div class="txt">${asset.monthlyDeposited}</div>
                      </li>
                      <li class="input_txt_seven fl">
                        <div class="txt">${asset.maturityDate}</div>
                      </li>
                      <li class="input_txt_eight fl">
                        <div class="txt">${asset.maturityValue}</div>
                      </li>
                      <li class="input_txt_nine fl"><span class="value">${asset.interestRate}</span>%</li>
                      <%-- <li class="input_txt_nine_one fl">
                        <div class="txt">${asset.currentBalance}</div>
                      </li> --%>
                      <li class="input_txt_eleven fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=BD" class="my_asset_edit_row" > </a></li>
                      <li class="input_txt_telwe fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/1');" class="my_asset_delete_row"> </a></li>
                      <div class="clr"></div>
                    </ul>
                    <!-- txt ends--> 
                    
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
              </c:choose>
                <!--*----------Recurring Deposits--------------*-->
                <div class="my_fd_title_main_title">Recurring Deposits</div>
                <!--title starts-->
                <div class="my_rd_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Asset Name</li>
                    <li class="input_title_three fl">Bank Name</li>
                    <li class="input_title_four fl">A/C No.</li>
                    <li class="input_title_five fl">Commencement Date</li>
                    <li class="input_title_six fl">Monthly Deposited</li>
                    <li class="input_title_eight_two fl">Maturity Date</li>
                    <li class="input_title_nine fl">Maturity Value</li>
                    <li class="input_title_ten fl">Interest Rate</li>
                    <!-- <li class="input_title_eleven fl">Current Balance</li> -->
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                 <c:choose>
              	<c:when test="${fn:length(assetRecurringDepositsList) > 0}">
                <!--title ends--> 
                <!--txt starts-->
                <div class="my_rd_li_bx first_row">
                <c:forEach var="asset" items="${assetRecurringDepositsList}">
                  <div class="my_rd_li_bx_in">
                    <ul>
                      <li class="input_txt_one fl">
                        <div class="txt">${asset.ownerName}</div>
                      </li>
                      <li class="input_txt_two fl">
                        <div class="txt">${asset.assetName}</div>
                      </li>
                      <li class="input_txt_three fl">
                        <div class="txt">${asset.bankName}</div>
                      </li>
                      <li class="input_txt_four fl">
                        <div class="txt">${asset.accountNumber}</div>
                      </li>
                      <li class="input_txt_five fl">
                        <div class="txt">${asset.commcementDate}</div>
                      </li>
                      <li class="input_txt_six fl">
                        <div class="txt">${asset.sipAmount}</div>
                      </li>
                      <li class="input_txt_seven fl">
                        <div class="txt">${asset.maturityDate}</div>
                      </li>
                      <li class="input_txt_eight fl">
                        <div class="txt">${asset.maturityValue}</div>
                      </li>
                      <li class="input_txt_nine fl"><span class="value">${asset.interestRate}</span>%</li>
                      <%-- <li class="input_txt_nine_one fl">
                        <div class="txt">${asset.currentBalance}</div>
                      </li> --%>
                      <li class="input_txt_eleven fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=BD" class="my_asset_edit_row" > </a></li>
                      <li class="input_txt_telwe fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/1');"  class="my_asset_delete_row"> </a></li>
                      <div class="clr"></div>
                    </ul>
                    <!-- txt ends--> 
                    
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
                <!-- txt ends--> 
                
                <!--*----------Savings Account--------------*-->
                <div class="my_fd_title_main_title">Savings </div>
                <!--title starts-->
                <div class="my_savings_title_bx clearfix">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Asset Name</li>
                    <li class="input_title_three fl">Bank Name</li>
                    <li class="input_title_four fl">A/C No.</li>
                    <li class="input_title_ten fl">Interest Rate</li>
                    <li class="input_title_ten_one fl">Current Balance</li>
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                <!--title ends--> 
                <!--txt starts-->
                <c:choose>
              	<c:when test="${fn:length(assetBankDepositsList) > 0}">
                <div class="my_savings_li_bx first_row">
                <c:forEach var="asset" items="${assetBankDepositsList}">
                  <div class="my_savings_li_bx_in">
                    <ul>
                      <li class="input_txt_one fl"><span class="name">${asset.ownerName}</span></li>
                      <li class="input_txt_two fl">${asset.assetName}</li>
                      <li class="input_txt_three fl">${asset.bankName}</li>
                      <li class="input_txt_four fl">${asset.accountNumber}</li>
                      <li class="input_txt_nine fl"><span class="value">${asset.interestRate}</span>%</li>
                      <li class="input_txt_ten fl">${asset.currentBalance}</li>
                      <li class="input_txt_eleven fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=BD" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_telwe fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/1');" class="my_asset_delete_row"> </a></li>
                      <div class="clr"></div>
                    </ul>
                    <!-- txt ends--> 
                  </div>
                  </c:forEach>
                </div>
                
                <!-- txt ends-->
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
                <div class="clr"></div>
              </div>
              <p>To Edit Insurance Details Kindly<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}" style="color: #000;"> Click Here</a></p>
            </div>
            <!-- Tabs 1 Ends--> 
            
            <!-- Tabs 2 Retirement -->
            <div id="tabs-2" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-2" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
              <c:if test="${empty assetRetirementFundsList and empty assetEPFList}">
               <c:set var="amt" value="${RetirementAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	            </c:if> 
              You have declared <b class="theme_color">${amt} ${unit}</b> of Retirement in financial plan.
              </c:if>
              
              <a class="common_btn fr add_more" id = "addMoreRetirementFund">Add More</a>
              <div class="asset_details_bx"> 
                <!--title starts-->
                <div class="my_ppf_title_main_title">Public Provident Fund (PPF)</div>
                <div class="my_ppf_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Description</li>
                    <li class="input_title_three fl">Maturity Date</li>
                    <li class="input_title_five fl">Annual contribution</li>
                    <!-- <li class="input_title_six fl">Growth Rate(%)</li> -->
                    <li class="input_title_eight_two fl">Current Balance</li>
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                <!--title ends--> 
                <!--txt starts-->
                <c:choose>
                <c:when test="${fn:length(assetRetirementFundsList) > 0}">
                <div class="my_ppf_li_bx first_row">
                <c:forEach var="asset" items="${assetRetirementFundsList}">
                  <div class="my_ppf_li_bx_in">
                    <ul class="clearfix">
                      <li class="input_txt_one fl"><span class="name">${asset.ownerName}</span></li>
                      <li class="input_txt_two fl">${asset.assetName}</li>
                      <li class="input_txt_three fl">${asset.maturityDate}</li>
                      <li class="input_txt_five fl">${asset.sipAmount} </li>
                      <%-- <li class="input_txt_six fl"><span>${asset.interestRate}</span>%</li> --%>
                      <li class="input_txt_seven fl">${asset.currentBalance}</li>
                      <li class="input_txt_ten fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=RE" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_eleven fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/2');" class="my_asset_delete_row"> </a></li>
                    </ul>
                    <!-- txt ends--> 
                    
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
               
                
                <div class="clr"></div>
                
                <div class="my_ppf_title_main_title">Employee Provident Fund (EPF)</div>
                <div class="my_ppf_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Description</li>
                    <li class="input_title_three fl">Maturity Date</li>
                    <li class="input_title_five fl">Annual contribution</li>
                    <!-- <li class="input_title_six fl">Growth Rate(%)</li> -->
                    <li class="input_title_eight_two fl">Current Balance</li>
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                <!--title ends--> 
                <!--txt starts-->
                <c:choose>
                <c:when test="${fn:length(assetEPFList) > 0}">
                <div class="my_ppf_li_bx first_row">
                <c:forEach var="asset" items="${assetEPFList}">
                  <div class="my_ppf_li_bx_in">
                    <ul class="clearfix">
                      <li class="input_txt_one fl"><span class="name">${asset.ownerName}</span></li>
                      <li class="input_txt_two fl">${asset.assetName}</li>
                      <li class="input_txt_three fl">${asset.maturityDate}</li>
                      <li class="input_txt_five fl">${asset.sipAmount} </li>
                      <%-- <li class="input_txt_six fl"><span>${asset.interestRate}</span>%</li> --%>
                      <li class="input_txt_seven fl">${asset.currentBalance}</li>
                      <li class="input_txt_ten fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=RE" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_eleven fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/2');" class="my_asset_delete_row"> </a></li>
                    </ul>
                    <!-- txt ends--> 
                    
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
               
                
                <div class="clr"></div>
                
                <div class="my_ppf_title_main_title">Pension Plans (PP)</div>
                <div class="my_ppf_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Description</li>
                    <li class="input_title_three fl">Maturity Date</li>
                    <li class="input_title_five fl">Annual contribution</li>
                    <!-- <li class="input_title_six fl">Growth Rate(%)</li> -->
                    <li class="input_title_eight_two fl">Current Balance</li>
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                <!--title ends--> 
                <!--txt starts-->
                <c:choose>
                <c:when test="${fn:length(assetPPList) > 0}">
                <div class="my_ppf_li_bx first_row">
                <c:forEach var="asset" items="${assetPPList}">
                  <div class="my_ppf_li_bx_in">
                    <ul class="clearfix">
                      <li class="input_txt_one fl"><span class="name">${asset.ownerName}</span></li>
                      <li class="input_txt_two fl">${asset.assetName}</li>
                      <li class="input_txt_three fl">${asset.maturityDate}</li>
                      <li class="input_txt_five fl">${asset.sipAmount} </li>
                      <%-- <li class="input_txt_six fl"><span>${asset.interestRate}</span>%</li> --%>
                      <li class="input_txt_seven fl">${asset.currentBalance}</li>
                      <li class="input_txt_ten fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=RE" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_eleven fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/2');" class="my_asset_delete_row"> </a></li>
                    </ul>
                    <!-- txt ends--> 
                    
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
               
                
                <div class="clr"></div>
                
                <div class="my_ppf_title_main_title">National Pension Schemes (NPS)</div>
                <div class="my_ppf_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Description</li>
                    <li class="input_title_three fl">Maturity Date</li>
                    <li class="input_title_five fl">Investment Amount</li>
                    <!-- <li class="input_title_six fl">Growth Rate(%)</li> -->
                    <li class="input_title_eight_two fl">Current Balance</li>
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                <!--title ends--> 
                <!--txt starts-->
                <c:choose>
                <c:when test="${fn:length(assetNPSList) > 0}">
                <div class="my_ppf_li_bx first_row">
                <c:forEach var="asset" items="${assetNPSList}">
                  <div class="my_ppf_li_bx_in">
                    <ul class="clearfix">
                      <li class="input_txt_one fl"><span class="name">${asset.ownerName}</span></li>
                      <li class="input_txt_two fl">${asset.assetName}</li>
                      <li class="input_txt_three fl">${asset.maturityDate}</li>
                      <li class="input_txt_five fl">${asset.sipAmount} </li>
                      <%-- <li class="input_txt_six fl"><span>${asset.interestRate}</span>%</li> --%>
                      <li class="input_txt_seven fl">${asset.currentBalance}</li>
                      <li class="input_txt_ten fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=RE" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_eleven fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/2');" class="my_asset_delete_row"> </a></li>
                    </ul>
                    <!-- txt ends--> 
                    
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
               
                
                <div class="clr"></div>
                
                <div class="my_ppf_title_main_title">Others</div>
                <div class="my_ppf_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Description</li>
                    <li class="input_title_three fl">Maturity Date</li>
                    <li class="input_title_five fl">Annual contribution</li>
                    <!-- <li class="input_title_six fl">Growth Rate(%)</li> -->
                    <li class="input_title_eight_two fl">Current Balance</li>
                    <li class="input_title_telwe fl">Edit</li>
                    <li class="input_title_thirteen fl">Delete</li>
                  </ul>
                </div>
                <!--title ends--> 
                <!--txt starts-->
                <c:choose>
                <c:when test="${fn:length(assetOthersList) > 0}">
                <div class="my_ppf_li_bx first_row">
                <c:forEach var="asset" items="${assetOthersList}">
                  <div class="my_ppf_li_bx_in">
                    <ul class="clearfix">
                      <li class="input_txt_one fl"><span class="name">${asset.ownerName}</span></li>
                      <li class="input_txt_two fl">${asset.assetName}</li>
                      <li class="input_txt_three fl">${asset.maturityDate}</li>
                      <li class="input_txt_five fl">${asset.sipAmount} </li>
                      <%-- <li class="input_txt_six fl"><span>${asset.interestRate}</span>%</li> --%>
                      <li class="input_txt_seven fl">${asset.currentBalance}</li>
                      <li class="input_txt_ten fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=RE" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_eleven fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/2');" class="my_asset_delete_row"> </a></li>
                    </ul>
                    <!-- txt ends--> 
                    
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
               
                
                <div class="clr"></div>
                
              </div>
              <p>To Edit Insurance Details Kindly<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}" style="color: #000;"> Click Here</a></p>
            </div>
            <!-- Tabs 2 Ends--> 
            
            <!-- Mutual Fund -->
            <!-- Tabs 3-->
            <div id="tabs-3" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-3" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
             <c:if test="${empty assetMutualFundsList and empty assetMutualFundsLumpSumList}">
               <c:set var="amt" value="${MFAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	            </c:if> 
              You have declared <b class="theme_color">${amt} ${unit}</b> of Mutual Fund in financial plan.
              </c:if>
              <a class="common_btn fr add_more" id = "addMoreMutualFund">Add More</a>
              <!--title starts-->
              <div class="asset_details_bx">
              <div class="my_ppf_title_main_title">Sip</div>
                <div class="my_mf_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one_one fl">Owner Name</li>
                    <li class="input_title_one fl">Fund Scheme</li>
                    <li class="input_title_two fl">Asset Mgnt. Comp.</li>
                    <li class="input_title_three fl">Folio Number</li>
                    <li class="input_title_four fl">SIP Amount</li>
                    <li class="input_title_five fl">Start Date</li>
                    <li class="input_title_six fl">End Date</li>
                    <li class="input_title_six_two fl">Frequency</li>
                    <li class="input_title_seven fl">No. of Units</li>
                    <!-- <li class="input_title_seven_two fl">Growth Rate(%)</li> -->
                      <li class="input_title_eight fl">Current Value</li>
                    <li class="input_title_nine fl">Edit</li>
                    <li class="input_title_ten fl">Delete</li>
                    <div class="clr"></div>
                  </ul>
                </div>
                <!--title ends--> 
                
                <!--*----------Mutual Funds --------------*-->
                <c:choose>
              <c:when test="${fn:length(assetMutualFundsList) > 0}">
                <div class="my_mf_li_bx"> 
                  
                  <!--txt starts-->
                  <c:forEach var="asset" items="${assetMutualFundsList}">
                  <div class="my_mf_li_bx_in">
                    <ul>
                      <li class="input_txt_one_one fl">
                        <div class="txt">${asset.ownerName}</div>
                      </li>
                      <li class="input_txt_one fl">
                        <div class="txt">${asset.fundScheme}</div>
                      </li>
                      <li class="input_txt_two fl">
                        <div class="txt">${asset.assetMgntComp}</div>
                      </li>
                      <li class="input_txt_three fl">
                        <div class="txt">${asset.folioNumber}</div>
                      </li>
                      <li class="input_txt_four fl"> <div class="txt">${asset.sipAmount}</div></li>
                      <li class="input_txt_five fl">${asset.sipStartDate}</li>
                      <li class="input_txt_six fl">${asset.sipEndDate}</li>
                      <li class="input_txt_six_two fl">
                      <c:choose>
                      	<c:when test="${asset.frequency eq '63003' }">
                      		Monthly
                      	</c:when>
                      	<c:otherwise>
                      		Yearly
                      	</c:otherwise>
                      </c:choose>
                      </li>
                      <li class="input_txt_seven fl">${asset.noOfUnits}</li>
                        <%-- <li class="input_txt_seven_two fl">${asset.interestRate}</li> --%>
                      <li class="input_txt_eight fl">
                      	<div class="txt">${asset.currentBalance}</div>
                      </li>
                      <li class="input_txt_nine fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=MF" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_ten fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/3');" class="my_asset_delete_row"> </a></li>
                    </ul>
                    <div class="clr"></div>
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
                <div class="clr"></div>
                
                <div class="my_ppf_title_main_title">Lumpsum</div>
                <div class="my_lumpsum_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one_one fl">Owner Name</li>
                    <li class="input_title_one fl">Fund Scheme</li>
                    <li class="input_title_two fl">Asset Mgnt. Comp.</li>
                    <li class="input_title_three fl">Folio Number</li>
                    <li class="input_title_four fl">Investment Amount</li>
                    <li class="input_title_seven fl">No. of Units</li>
                    <!-- <li class="input_title_seven_two fl">Growth Rate(%)</li> -->
                    <li class="input_title_eight fl">Current Value</li>
                    <li class="input_title_nine fl">Edit</li>
                    <li class="input_title_ten fl">Delete</li>
                    <div class="clr"></div>
                  </ul>
                </div>
                
                <c:choose>
              <c:when test="${fn:length(assetMutualFundsLumpSumList) > 0}">
                <div class="my_lumpsum_li_bx"> 
                  
                  <!--txt starts-->
                  <c:forEach var="asset" items="${assetMutualFundsLumpSumList}">
                  <div class="my_lumpsum_li_bx_in">
                    <ul>
                      <li class="input_txt_one_one fl">
                        <div class="txt">${asset.ownerName}</div>
                      </li>
                      <li class="input_txt_one fl">
                        <div class="txt">${asset.fundScheme}</div>
                      </li>
                      <li class="input_txt_two fl">
                        <div class="txt">${asset.assetMgntComp}</div>
                      </li>
                      <li class="input_txt_three fl">
                        <div class="txt">${asset.folioNumber}</div>
                      </li>
                      <li class="input_txt_four fl">${asset.monthlyDeposited}</li>
                      <li class="input_txt_seven fl">${asset.noOfUnits}</li>
                       <%-- <li class="input_txt_seven_two fl">${asset.interestRate}</li> --%>
                      <li class="input_txt_eight fl"><div class="txt">${asset.currentBalance}</div></li>
                      <li class="input_txt_nine fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=MF" class="my_asset_edit_row"> </a></li>
                      <li class="input_txt_ten fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/3');" class="my_asset_delete_row"> </a></li>
                    </ul>
                    <div class="clr"></div>
                  </div>
                  </c:forEach>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
               
                
                <div class="clr"></div>
                
              </div>
              <p>To Edit Insurance Details Kindly<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}" style="color: #000;"> Click Here</a></p>
            </div>
            <!-- Tabs 3 Ends--> 
            
            <!-- Tabs 4--> 
            <!--*----------Gold --------------*-->
            <div id="tabs-4" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-4" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
              <c:if test="${empty assetGoldsList}">
               <c:set var="amt" value="${GoldAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	            </c:if> 
              You have declared <b class="theme_color">${amt} ${unit}</b> of Gold in financial plan.
              </c:if>
              <a class="common_btn fr add_more" id = "addMoreGold">Add More</a>
              <!--title starts-->
              <div class="asset_details_bx">
                <div class="my_gold_title_bx">
                  <ul>
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Item Description</li>
                    <li class="input_title_three fl">Amount Investment</li>
                    <!-- <li class="input_title_three_one fl">Growth Rate(%)</li> -->
                    <li class="input_title_three_two fl">Current Value</li>
                    <li class="input_title_five fl">Edit</li>
                    <li class="input_title_six fl">Delete</li>
                    <div class="clr"></div>
                  </ul>
                </div>
                <!--title ends-->
                <c:choose>
              <c:when test="${fn:length(assetGoldsList) > 0}">
                <div class="my_gold_li_bx first_row">
                  <div class="white_bg"> 
                    
                    <!--txt starts-->
                    <c:forEach var="asset" items="${assetGoldsList}">
                    <div class="my_gold_li_bx_in">
                      <ul>
                        <li class="input_txt_one fl">${asset.ownerName}</li>
                        <li class="input_txt_two fl">${asset.description}</li>
                        <li class="input_txt_three fl">${asset.monthlyDeposited}</li>
                        <%-- <li class="input_txt_three_one fl">${asset.interestRate}</li> --%>
                        <li class="input_txt_three_two fl">${asset.currentBalance}</li>
                        <li class="input_txt_five fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=Gold" class="my_asset_edit_row"> </a> </li>
                        <li class="input_txt_six fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/4');" class="my_asset_delete_row"> </a> </li>
                      </ul>
                      
                      <!-- txt ends-->
                      <div class="clr"></div>
                    </div>
                    </c:forEach>
                  </div>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
                <div class="clr"></div>
              </div>
              <p>To Edit Insurance Details Kindly<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}" style="color: #000;"> Click Here</a></p>
            </div>
            
            <!--*----------Gold Ends --------------*--> 
            <!-- Tabs 4 Ends--> 
            
            <!-- Tabs 5--> 
            <!--*----------Property --------------*-->
            <div id="tabs-5" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-5" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
              
              <c:if test="${empty assetPropertyList}">
               <c:set var="amt" value="${PropertyAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	            </c:if> 
              You have declared <b class="theme_color">${amt} ${unit}</b> of Property in financial plan.
              </c:if>
              
              <a class="common_btn fr add_more" id = "addMoreProperty">Add More</a>
              <div class="clr"></div>
              <!--title starts-->
              <div class="asset_details_bx">
              <div class="my_property_title_bx">
                <ul>
                  <li class="input_title_one fl">Owner</li>
                  <li class="input_title_two fl">Property Name</li>
                  <li class="input_title_three fl">Year Brought In</li>
                  <!-- <li class="input_title_four fl">Growth Rate(%)</li> -->
                  <li class="input_title_five fl">Property Value</li>
                  <li class="input_title_seven fl">Edit</li>
                  <li class="input_title_eight fl">Delete</li>
                  <div class="clr"></div>
                </ul>
              </div>
              <!--title ends-->
              <c:choose>
              <c:when test="${fn:length(assetPropertyList) > 0}">
              <div class="my_property_li_bx first_row">
                <div class="white_bg"> 
                  
                  <!--txt starts-->
                  <c:forEach var="asset" items="${assetPropertyList}">
                  <div class="my_property_li_bx_in">
                    <ul>
                      <li class="input_txt_one fl">${asset.ownerName}</li>
                      <li class="input_txt_two fl">${asset.assetName}</li>
                      <li class="input_txt_three fl">${asset.commcementDate}</li>
                      <%-- <li class="input_txt_four fl"><span>${asset.interestRate}</span>%</li> --%>
                      <li class="input_txt_five fl">${asset.currentBalance}</li>
                      <li class="input_txt_seven fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=Pro" class="my_asset_edit_row"> </a> </li>
                      <li class="input_txt_eight fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/5');" class="my_asset_delete_row"> </a> </li>
                    </ul>
                    
                    <!-- txt ends-->
                    
                    <div class="clr"></div>
                  </div>
                  </c:forEach>
                </div>
              </div>
              </c:when>
              <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
              </c:choose>
              <div class="clr"></div>
              </div>
              <p>To Edit Insurance Details Kindly<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}" style="color: #000;"> Click Here</a></p>
            </div>
            
            <!--*----------Property Ends --------------*--> 
            <!-- Tabs 5 Ends--> 
            
            <!-- Tabs 6--> 
            <!-- Shares -->
            <div id="tabs-6" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-6" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
			
			<c:if test="${empty assetStocksList}">
               <c:set var="amt" value="${SharesAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	            </c:if> 
              You have declared <b class="theme_color">${amt} ${unit}</b> of Shares in financial plan.
              </c:if>             
 
              <a class="common_btn fr add_more" id = "addMoreStock">Add More</a>
              <div class="clr"></div>
              <!--title starts-->
              <div class="asset_details_bx">
                <div class="my_stock_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <li class="input_title_two fl">Stock Name</li>
                    <li class="input_title_three fl">Institute Name</li>
                    <li class="input_title_four fl">Investment Date</li>
                    <li class="input_title_four_two fl">Investment Amount</li>
                    <li class="input_title_five fl">Quantity</li>
                    <!-- <li class="input_title_five_two fl">Growth Rate(%)</li> -->
                    <li class="input_title_six fl">Current Value</li>
                    <li class="input_title_eight fl">Edit</li>
                    <li class="input_title_nine fl">Delete</li>
                    <div class="clr"></div>
                  </ul>
                </div>
                <!--title ends-->
                <c:choose>
              <c:when test="${fn:length(assetStocksList) > 0}">
                <div class="my_stock_li_bx first_row">
                  <div class="white_bg">
                  <c:forEach var="asset" items="${assetStocksList}"> 
                    <!--txt starts-->
                    <div class="my_stock_li_bx_in">
                      <ul>
                        <li class="input_txt_one fl">
                          <div class="txt">${asset.ownerName}</div>
                        </li>
                        <li class="input_txt_two fl">
                          <div class="txt">${asset.fundScheme}</div>
                        </li>
                        <li class="input_txt_three fl">
                          <div class="txt">${asset.assetMgntComp}</div>
                        </li>
                        <li class="input_txt_four fl">${asset.commcementDate}</li>
                        <li class="input_txt_four_two fl">${asset.monthlyDeposited}</li>
                        <li class="input_txt_five fl">${asset.noOfUnits}</li>
                        <%-- <li class="input_txt_five_two fl">${asset.interestRate}</li> --%>
                        <li class="input_txt_six fl">${asset.currentBalance}</li>
                        <li class="input_txt_nine fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=Stock" class="my_asset_edit_row"> </a> </li>
                        <li class="input_txt_ten fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/6');" class="my_asset_delete_row"> </a></li>
                        <div class="clr"></div>
                      </ul>
                    </div>
                    </c:forEach>
                    <!-- txt ends-->
                    <div class="clr"></div>
                  </div>
                </div>
                </c:when>
                <c:otherwise>
                	<div class="no_data_message">No Data</div>
                </c:otherwise>
                </c:choose>
                <div class="clr"></div>
              </div>
              <p>To Edit Insurance Details Kindly<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}" style="color: #000;"> Click Here</a></p>
            </div>
            
            <!-- Shares Ends --> 
            <!-- Tabs 6 Ends--> 
            
            <!-- Tabs 7--> 
            <!--*----------Others --------------*-->
            <div id="tabs-7" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-6" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
              
              <c:if test="${empty assetOthersList}">
               <c:set var="amt" value="${OtherAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	            </c:if> 
              You have declared <b class="theme_color">${amt} ${unit}</b> of Other in financial plan.
              </c:if>   
              
              <a class="common_btn fr add_more" id="addMoreOther" >Add More</a>
              <div class="clr"></div>
              <!--title starts-->
              <div class="asset_details_bx">
                <div class="others_title_bx">
                  <ul class="clearfix head_title">
                    <li class="input_title_one fl">Owner</li>
                    <!-- <li class="input_title_two fl">Asset Type</li> -->
                    <li class="input_title_three fl">Asset Name</li>
                    <!-- <li class="input_title_four fl">Growth Rate(%)</li> -->
                    <li class="input_title_six fl">Current Value</li>
                    <li class="input_title_seven fl">Edit</li>
                    <li class="input_title_eight fl">Delete</li>
                    <div class="clr"></div>
                  </ul>
                </div>
                <!--title ends-->
                
                <div class="others_li_bx first_row">
                  <div class="white_bg"> 
                    <!--txt starts-->
                    <c:choose>
              		<c:when test="${fn:length(assetOthersList) > 0}">
              		<c:forEach var="asset" items="${assetOthersList}">
                    <div class="others_li_bx_in">
                      <ul>
                        <li class="input_txt_one fl">
                          <div class="txt">${asset.ownerName}</div>
                        </li>
                        <li class="input_txt_two fl">
                          <div class="txt">${asset.assetName}</div>
                        </li>
                        <%-- <li class="input_txt_three fl">
                          <div class="txt">${asset.interestRate}</div>
                        </li> --%>
                        <li class="input_txt_four fl">${asset.currentBalance}</li>
                        <li class="input_txt_six fl"><a href="${pageContext.request.contextPath}/assets/editAssets/${partyId}/${asset.partyAssetId}?assetType=Other" class="my_asset_edit_row"> </a></li>
                        <li class="input_txt_seven fl"><a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/assets/deleteAssetDetail/${asset.partyAssetId}/${partyId}/7');" class="my_asset_delete_row"> </a></li>
                        <div class="clr"></div>
                      </ul>
                    </div>
                    </c:forEach>
                    <!-- txt ends-->
                    </c:when>
		            <c:otherwise>
		            	<div class="no_data_message">No Data</div>
		            </c:otherwise>
		            </c:choose> 
                </div>
                <div class="clr"></div>
              </div>
            </div>
            <!--*----------Others Ends --------------*--> 
            <!-- Tabs 7 Ends-->
            <p>To Edit Insurance Details Kindly<a href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}" style="color: #000;"> Click Here</a></p>
          </div>
          <!-- end of "contents" id --> 
          
        </div>
        <!-- inside goal page class--> 
        
        <!--Assets Starts--> 
        
      </section>
      </form:form>
      <!-- Common_in_contnet ends-->
      <div class="overlay"></div>
    </section>
    
    <!-- Common_content Ends--> 
    
  </section>
  <script type="text/javascript">
    $("#addMoreBankDeposit").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addBankDeposits/${partyId}');
		$("#assetDetails").submit();
    	});
    $("#addMoreRetirementFund").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addRetirementFunds/${partyId}');
		$("#assetDetails").submit();
    	});
    $("#addMoreMutualFund").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addMutualFunds/${partyId}');
		$("#assetDetails").submit();
    	});
    $("#addMoreGold").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addGolds/${partyId}');
		$("#assetDetails").submit();
    	});
    $("#addMoreProperty").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addProperties/${partyId}');
		$("#assetDetails").submit();
    	});
    $("#addMoreStock").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addStocks/${partyId}');
		$("#assetDetails").submit();
    	});
    $("#addMoreOther").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addOther/${partyId}');
		$("#assetDetails").submit();
    	});
  </script>
  <!-- Main ends--> 
  <!--pop up box--> 
</div>