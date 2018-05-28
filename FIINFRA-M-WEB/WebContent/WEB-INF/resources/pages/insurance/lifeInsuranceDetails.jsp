<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>

$(document).ready(function(){
  	$( ".wrapper" ).addClass("life_insurance_details");
	 $('.common_in_content').slimScroll();
     $( "#tabs" ).tabs({active:${lifeInsuranceType}});
     $('.record_container').slimScroll();
	 $('.life_insurance_details #tabs .ui-tabs-panel .value').perfectScrollbar();
     $('body').on("click","#tabs .ui-widget-header .ui-state-default",function(){
	 $('.life_insurance_details #tabs .ui-tabs-panel .value').perfectScrollbar("update");	 
		});
   });
</script>
</head>
<body>
<div class="wrapper"> 
  <!-- Main starts-->
  <section class="main"> 
    
    
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <section class="in_content common_in_content"> 
        <!-- Common_in_contnet starts-->
        
        <section id="life_insurance_details" class="in_content common_in_content clearfix">
        <a class="fr common_back_btn" href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/lifeInsurance/${partyId}">Back</a>
        <div class="clr"></div>
          <div id="tabs">
            <ul>
              <li><a href="#term">Term</a></li>
              <li><a href="#endowment">Endowment</a></li>
              <li><a href="#money_back">Money Back</a></li>
              <li><a href="#ulip">ULIP</a></li>
            </ul>
            <div class="clr"></div>
            <div id="term">
            
            <c:if test="${fn:length(termList)==0 and fn:length(endowmentList)==0 and fn:length(moneyBackList)==0 and fn:length(ulipList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty LifeInsuranceAmount}">
            <c:set var="amt" value="${LifeInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100 }">
	                    		<c:set var="amt" value="${amt/100}"/>
	                    		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="Lac"/>
	                    		</c:if>
	                    		<c:if test="${amt gt 100 or amt eq 100}">
	                    			<c:set var="amt" value="${amt/100}"/>
	                    			<c:set var="unit" value="Cr"/>
	                    		</c:if>
                    		</c:when> 
                    	
            	</c:choose> 
            </c:if>
            You have declared <b class="theme_color">${amt} ${unit}</b> of Life Insurance Cover in Financial Plan.
            </c:if>
            
            <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/term-life-insurance-add/${partyId}">Add More</a>
             <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Family Member</li>
                <li class="title_two label fl">Product</li>
                <li class="title_three label fl">Sum  Assured</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_five label fl">Commencement Date</li>
                <li class="title_six label fl">Tenure (in years)</li>
                <li class="title_seven label fl">Payment Term</li>
                <!-- <li class="title_eight label fl">Tenure (in years)</li> -->
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(termList)>0}">
              <c:forEach var="term" items="${termList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${term.familyMembersName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value"> ${term.productName}</div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${term.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${term.insurancePremiumAmount}"/></div>
                    </li>
                    <li class="output_five label fl">
                    <c:set  value="${term.commencementDate}" var="commencementDate"/>
                   <%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
				%>

                      <div class="value"><%=connDate %></div>
                    </li>
                    <li class="output_six label fl">
                      <div class="value"> ${term.tenure}</div>
                    </li>
                    <li class="output_seven label fl">
                      <div class="value"> ${term.insurancePaymentTerm}</div>
                    </li>
                    <%-- <li class="output_eight label fl">
                      <div class="value"> ${term.tenure}</div>
                    </li> --%>
                    <li class="output_ten label fl">
                     <a class="edit" href="${pageContext.request.contextPath}/insurance/term-life-insurance-edit/${partyId}/${term.partyInsuranceId}"></a>
                    </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/life-insurance-details/term/${partyId}/${term.partyInsuranceId}')"><div class="delete"></div></a>
                    </li>
                  </ul>
                 </div>
                </c:forEach>
                </c:when>
                <c:otherwise>
                <div style="text-align: center;">No Record Found</div>
                </c:otherwise>
                </c:choose>
              </div>
            </div>
            
            <div id="endowment">
            <c:if test="${fn:length(termList)==0 and fn:length(endowmentList)==0 and fn:length(moneyBackList)==0 and fn:length(ulipList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty LifeInsuranceAmount}">
            <c:set var="amt" value="${LifeInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100 }">
	                    		<c:set var="amt" value="${amt/100}"/>
	                    		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="Lac"/>
	                    		</c:if>
	                    		<c:if test="${amt gt 100 or amt eq 100}">
	                    			<c:set var="amt" value="${amt/100}"/>
	                    			<c:set var="unit" value="Cr"/>
	                    		</c:if>
                    		</c:when> 
                    	
            	</c:choose> 
            </c:if>
            You have declared <b class="theme_color">${amt} ${unit}</b> of Life Insurance Cover in Financial Plan.
            </c:if>
             <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/endowment-life-insurance-add/${partyId}">Add More</a>
             <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Family Member</li>
                <li class="title_two label fl">Product</li>
                <li class="title_three label fl">Sum Assured</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_five label fl">Commencement Date</li>
                <li class="title_six label fl">Cover Term</li>
                <li class="title_seven label fl">Payment Term</li>
                <li class="title_eight label fl">Surrender Value</li>
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(endowmentList)>0}">
              <c:forEach var="endowment" items="${endowmentList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${endowment.familyMembersName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value"> ${endowment.productName}</div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${endowment.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${endowment.insurancePremiumAmount}"/></div>
                    </li>
                    <li class="output_five label fl">
                    <c:set  value="${endowment.commencementDate}" var="commencementDate"/>
                    <%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
				%>
                      <div class="value"><%=connDate %></div>
                    </li>
                    <li class="output_six label fl">
                      <div class="value"> ${endowment.tenure}</div>
                    </li>
                    <li class="output_seven label fl">
                      <div class="value"> ${endowment.insurancePaymentTerm}</div>
                    </li>
                    <li class="output_eight label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${endowment.currentValue}"/></div>
                    </li>
                    <li class="output_ten label fl">
                       <a class="edit" href="${pageContext.request.contextPath}/insurance/endowment-life-insurance-edit/${partyId}/${endowment.partyInsuranceId}"></a>
                    </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/life-insurance-details/endowment/${partyId}/${endowment.partyInsuranceId}')"><div class="delete"></div></a>
                    </li>
                  </ul>
                </div>
                </c:forEach>
                </c:when>
                <c:otherwise>
                <div style="text-align: center;">No Record Found</div>
                </c:otherwise>
                </c:choose>
              </div>
            </div>
            
            <div id="money_back">
            <c:if test="${fn:length(termList)==0 and fn:length(endowmentList)==0 and fn:length(moneyBackList)==0 and fn:length(ulipList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty LifeInsuranceAmount}">
            <c:set var="amt" value="${LifeInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100 }">
	                    		<c:set var="amt" value="${amt/100}"/>
	                    		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="Lac"/>
	                    		</c:if>
	                    		<c:if test="${amt gt 100 or amt eq 100}">
	                    			<c:set var="amt" value="${amt/100}"/>
	                    			<c:set var="unit" value="Cr"/>
	                    		</c:if>
                    		</c:when> 
                    	
            	</c:choose> 
            </c:if>
            You have declared <b class="theme_color">${amt} ${unit}</b> of Life Insurance Cover in Financial Plan.
            </c:if>
             <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/money-back-life-insurance-add/${partyId}">Add More</a>
             <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Family Member</li>
                <li class="title_two label fl">Product</li>
                <li class="title_three label fl">Sum Assured</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_five label fl">Commencement Date</li>
                <li class="title_six label fl">Cover Term</li>
                <li class="title_seven label fl">Payment Term</li>
                <li class="title_eight label fl">Surrender Value</li>
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(moneyBackList)>0}">
              <c:forEach var="moneyBack" items="${moneyBackList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${moneyBack.familyMembersName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value"> ${moneyBack.productName}</div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${moneyBack.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${moneyBack.insurancePremiumAmount}"/></div>
                    </li>
                    <li class="output_five label fl">
                    <c:set  value="${moneyBack.commencementDate}" var="commencementDate"/>
                    <%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
				%>
                      <div class="value"><%=connDate %></div>
                    
                    </li>
                    <li class="output_six label fl">
                      <div class="value"> ${moneyBack.tenure}</div>
                    </li>
                    <li class="output_seven label fl">
                      <div class="value"> ${moneyBack.insurancePaymentTerm}</div>
                    </li>
                    <li class="output_eight label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${moneyBack.currentValue}"/></div>
                    </li>
                    <li class="output_ten label fl">
                    <a class="edit" href="${pageContext.request.contextPath}/insurance/money-back-life-insurance-edit/${partyId}/${moneyBack.partyInsuranceId}"></a>
                    </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/life-insurance-details/moneyBack/${partyId}/${moneyBack.partyInsuranceId}')"><div class="delete"></div></a>
                    </li>
                  </ul>
                 </div>
                </c:forEach>
                </c:when>
                <c:otherwise>
                <div style="text-align: center;">No Record Found</div>
                </c:otherwise>
                </c:choose>
              </div>
            </div>
            
            <div id="ulip">
            <c:if test="${fn:length(termList)==0 and fn:length(endowmentList)==0 and fn:length(moneyBackList)==0 and fn:length(ulipList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty LifeInsuranceAmount}">
            <c:set var="amt" value="${LifeInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100 }">
	                    		<c:set var="amt" value="${amt/100}"/>
	                    		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="Lac"/>
	                    		</c:if>
	                    		<c:if test="${amt gt 100 or amt eq 100}">
	                    			<c:set var="amt" value="${amt/100}"/>
	                    			<c:set var="unit" value="Cr"/>
	                    		</c:if>
                    		</c:when> 
                    	
            	</c:choose> 
            </c:if>
            You have declared <b class="theme_color">${amt} ${unit}</b> of Life Insurance Cover in Financial Plan.
            </c:if>
             <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/ulip-life-insurance-add/${partyId}">Add More</a>
             <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Family Member</li>
                <li class="title_two label fl">Product</li>
                <li class="title_three label fl">Sum Assured</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_five label fl">Commencement Date</li>
                <li class="title_six label fl">Cover Term</li>
                <li class="title_seven label fl">Payment Term</li>
                <li class="title_eight label fl">Surrender Value</li>
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(ulipList)>0}">
              <c:forEach var="ulip" items="${ulipList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${ulip.familyMembersName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value"> ${ulip.productName}</div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${ulip.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${ulip.insurancePremiumAmount}"/></div>
                    </li>
                    <li class="output_five label fl">
                     <c:set  value="${ulip.commencementDate}" var="commencementDate"/>
                    <%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
				%>
                      <div class="value"><%=connDate %></div>
                    
                    </li>
                    <li class="output_six label fl">
                      <div class="value"> ${ulip.tenure}</div>
                    </li>
                    <li class="output_seven label fl">
                      <div class="value"> ${ulip.insurancePaymentTerm}</div>
                    </li>
                    <li class="output_eight label fl">
                      <div class="value"> <fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${ulip.currentValue}"/></div>
                    </li>
                    <li class="output_ten label fl">
                     <a class="edit" href="${pageContext.request.contextPath}/insurance/ulip-life-insurance-edit/${partyId}/${ulip.partyInsuranceId}"></a>
                    </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/life-insurance-details/ulip/${partyId}/${ulip.partyInsuranceId}')"><div class="delete"></div></a>
                    </li>
                  </ul>
                </div>
                </c:forEach>
                </c:when>
                <c:otherwise>
                <div style="text-align: center;">No Record Found</div>
                </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </section>
        <!-- Common_in_contnet ends-->
        
        <div class="overlay"></div>
      </section>
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            </li>
          
          </ul>
        </div>
      </section>
      <!-- Common footer ends --> 
    </section>
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 
</div>
</body>
</html>