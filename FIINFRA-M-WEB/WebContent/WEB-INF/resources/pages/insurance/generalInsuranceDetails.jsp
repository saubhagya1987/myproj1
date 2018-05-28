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
<title>Insert title here</title>
<script>
$(document).ready(function(){
  	$( ".wrapper" ).addClass("life_insurance_details genral_insurance_details");
	 $('.common_in_content').slimScroll();
     $( "#tabs" ).tabs({active:${generalInsuranceType}});
     $('.record_container').slimScroll();
	 $('.life_insurance_details #tabs .ui-tabs-panel .value').perfectScrollbar();
     $('body').on("click","#tabs .ui-widget-header .ui-state-default",function(){
	 $('.life_insurance_details #tabs .ui-tabs-panel .value').perfectScrollbar("update");	 
		});     
   });
</script>
</head>
<body>
<!-- Wrapper starts-->

  <!-- Main starts-->
  
  <section class="main"> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <section class="in_content common_in_content"> 
        <!-- Common_in_contnet starts-->
        
        <section id="genral_insurance_details" class="in_content common_in_content clearfix"> <a class="fr common_back_btn" href="${pageContext.request.contextPath}/insurance/showInsuranceSummary/generalInsurance/${partyId}">Back</a>
          <div class="clr"></div>
          <div id="tabs">
            <ul>
              <li><a href="#Critical_Illness">Critical Illness</a></li>
              <li><a href="#Health">Health</a></li>
              <li><a href="#Personal_Accident">Personal Accident</a></li>
              <li><a href="#Asset">Property</a></li>
            </ul>
            <div id="Critical_Illness">
            <c:if test="${fn:length(criticalIllnessList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty CriticalInsuranceAmount}">
            <c:set var="amt" value="${CriticalInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100}">
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
            You have declared <b class="theme_color">${amt} ${unit}</b> of Critical Insurance Cover in Financial Plan.
            </c:if> 
             <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/critical-illness-insurance-details-add/${partyId}">Add More</a>
              <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Family
                  Member</li>
                <li class="title_two label fl">Product</li>
                <li class="title_three label fl">Insured Amount</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_four_one label fl">Commencement Date</li>
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(criticalIllnessList)>0}">
              <c:forEach var="criticalIllness" items="${criticalIllnessList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${criticalIllness.familyMembersName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value">${criticalIllness.productName}</div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${criticalIllness.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${criticalIllness.insurancePremiumAmount}"/></div>
                    </li>
                    <c:set  value="${criticalIllness.commencementDate}" var="commencementDate"/>
               	<%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
				%>
                
                    <li class="output_four_one label fl">
                      <div class="value"><%=connDate %></div>
                    </li>
                    <li class="output_ten label fl"> <a class="edit" href="${pageContext.request.contextPath}/insurance/critical-illness-insurance-details-edit/${partyId}/${criticalIllness.partyInsuranceId}"></a> </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/general-insurance-details/criticalIllness/${partyId}/${criticalIllness.partyInsuranceId}')"><div class="delete"></div></a>
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
            <div id="Health"> 
            <c:if test="${fn:length(healthList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty HealthInsuranceAmount}">
            <c:set var="amt" value="${HealthInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100}">
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
            You have declared <b class="theme_color">${amt} ${unit}</b> of Health Insurance Cover in Financial Plan.
            </c:if> 
            <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/health-insurance-details-add/${partyId}">Add More</a>
              <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Family
                  Member</li>
                <li class="title_two label fl">Product</li>
                <li class="title_two label fl">Provider Type</li>
                <li class="title_three label fl">Type</li>
                <li class="title_four label fl">Total Sum<br/>
                  Assured </li>
                <li class="title_five label fl">Premium Amount</li>
                <li class="title_four_one label fl">Commencement Date</li>
                <li class="title_eight label fl">Individual Sum Insured</li>                
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(healthList)>0}">
              <c:forEach var="health" items="${healthList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${health.familyMembersName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value">${health.productName}</div>
                    </li>
                    <li class="output_two_one label fl">
                      <div class="value">
                      <c:choose>
                      <c:when test="${health.insurenceOwnerTypeId == 23018001}">Self Owned</c:when>
                      <c:otherwise>Employer Provided</c:otherwise>
                      </c:choose>
                      </div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value">
                      <c:choose>
                      <c:when test="${health.familyType == 1}">Personal</c:when>
                      <c:otherwise>Family Floater</c:otherwise>
                      </c:choose>
                      </div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${health.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_five label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${health.insurancePremiumAmount}"/></div>
                    </li>
                    <c:set  value="${health.commencementDate}" var="commencementDate"/>
                    <%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
					%>
                    <li class="output_four_one label fl">
                      <div class="value"><%=connDate %></div>
                    </li>
                    <li class="output_eight label fl">
                      <div class="value">${health.individualSumAssured}</div>
                    </li>
                    <li class="output_ten label fl"> <a class="edit" href="${pageContext.request.contextPath}/insurance/health-insurance-details-edit/${partyId}/${health.partyInsuranceId}"></a> </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/general-insurance-details/health/${partyId}/${health.partyInsuranceId}')"><div class="delete"></div></a>
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
            <div id="Personal_Accident"> 
            <c:if test="${fn:length(personalAccidentList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty AccidentalInsuranceAmount}">
            <c:set var="amt" value="${AccidentalInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100}">
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
            You have declared <b class="theme_color">${amt} ${unit}</b> of Personal Accidental Insurance Cover in Financial Plan.
            </c:if>
            <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/personal-accident-insurance-details-add/${partyId}">Add More</a>
              <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Family
                  Member</li>
                <li class="title_two label fl">Product</li>
                <li class="title_three label fl">Insured Amount</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_four_one label fl">Commencement Date</li>
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(personalAccidentList)>0}">
              <c:forEach var="personalAccident" items="${personalAccidentList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${personalAccident.familyMembersName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value">${personalAccident.productName}</div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${personalAccident.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${personalAccident.insurancePremiumAmount}"/></div>
                    </li>
                    <li class="output_four_one label fl">
                    <c:set  value="${personalAccident.commencementDate}" var="commencementDate"/>
                    <%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
					%>
                
                      <div class="value"><%=connDate %></div>
                    </li>
                    <li class="output_ten label fl"> <a class="edit" href="${pageContext.request.contextPath}/insurance/personal-accident-insurance-details-edit/${partyId}/${personalAccident.partyInsuranceId}"></a> </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/general-insurance-details/personalAccident/${partyId}/${personalAccident.partyInsuranceId}')"><div class="delete"></div></a>
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
            <div id="Asset"> 
            <c:if test="${fn:length(assetList)==0}">
            <c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty AssetInsuranceAmount}">
            <c:set var="amt" value="${AssetInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100}">
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
            You have declared <b class="theme_color">${amt} ${unit}</b> of Property Insurance Cover in Financial Plan.
            </c:if>
            
            <a class="common_btn fr add_more" href="${pageContext.request.contextPath}/insurance/asset-insurance-details-add/${partyId}">Add More</a>
              <div class="clr"></div>
              <ul class="clearfix head_title reset">
                <li class="title_one label fl">Property Name</li>
                <li class="title_two label fl">Product</li>
                <li class="title_three label fl"> Insured Amount</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_four_one label fl">Commencement Date</li>
                <li class="title_ten label fl">Edit</li>
                <li class="title_eleven label fl">Delete</li>
              </ul>
              <div class="record_container">
              <c:choose>
              <c:when test="${fn:length(assetList)>0}">
              <c:forEach var="asset" items="${assetList}">
                <div class="record_row rel">
                  <ul class="clearfix data_outputs reset">
                    <li class="output_one label fl">
                      <div class="value">${asset.assetName}</div>
                    </li>
                    <li class="output_two label fl">
                      <div class="value">${asset.productName}</div>
                    </li>
                    <li class="output_three label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${asset.insuranceCoverAmount}"/></div>
                    </li>
                    <li class="output_four label fl">
                      <div class="value"><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${asset.insurancePremiumAmount}"/></div>
                    </li>
                    <c:set  value="${asset.commencementDate}" var="commencementDate"/>
                    <%
					String connDate = "";
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
					%>
                
                    <li class="output_four_one label fl">
                      <div class="value"><%=connDate %></div>
                    </li>
                    <li class="output_ten label fl"> <a class="edit" href="${pageContext.request.contextPath}/insurance/asset-insurance-details-edit/${partyId}/${asset.partyInsuranceId}"></a> </li>
                    <li class="output_eleven label fl">
                      <a href="javascript:void(0)" onclick="javascript:doConfirm('${pageContext.request.contextPath}/insurance/deleteInsuranceDetails/general-insurance-details/asset/${partyId}/${asset.partyInsuranceId}')"><div class="delete"></div></a>
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
            
            <!--<li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>--> 
            
            <!-- <li class="fl list"><a href="#" class="anch save_new"><span class="txt">Save &amp; Add</span></a></li>
            <li class="fl list"><a href="#" class="anch save_close"><span class="txt">Save &amp; Close</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>-->
          </ul>
        </div>
        <!-- <a href="list-of-tasks.html" class="back navgation"><span class="txt">Back</span></a> <a href="list-of-tasks.html" class="next navgation"><span class="txt">Next</span></a>--> </section>
      
      <!-- Common footer ends --> 
    </section>
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 

<!-- Wrapper ends-->
</body>
</html>