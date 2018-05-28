<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#page_loader{
		background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
	}
	#page_loader1 {
		position: absolute;
		height: 100%;
		width: 100%;
		left: 0;
		z-index: 1000;
		background: white;
		opacity: 0.92;
		padding: 148px 0px 0px 0px;
	}
	<c:if test="${(isMobile eq 'true') and (empty isIpad)}">
	.downloadimg{
		margin-left:15px;
	}
</c:if>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
.generate_report_in .description_down .left .preview{margin: 0 auto;width: 41px;float: none;}
.generate_report_in .description_down .left .tp{display:none;}
.generate_report_in .description_down .right .tp {display:none;}
.generate_report_in .description_down .right .preview{margin-left: 30px;}
.generate_report_in .description_down .left .dwnld{width: 64px;}
.generate_report_in .description_down .right .dwnld{width: 64px;}
</style>
<% 
UserSession user = (UserSession) request.getSession().getAttribute("userSession");
   Integer themeId = user.getThemeId();
   String themeName1="";
   if(themeId==92001){
	   themeName1="Magento";
   }else if(themeId==92002){
	   themeName1="Red";
   }else if(themeId==92003){
	   themeName1="Blue";
   }else if(themeId==92004){
	   themeName1="Green";
   }else{
	   themeName1="Magento";
   }
%>
<c:set var="themeName" value="<%=themeName1%>"/>
<!-- custom scroll to "common_in_content" -->
<!-- Wrapper starts-->
<div class="" id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
    
    <!-- Header Ends--> 
    <!-- Common_content Starts-->
		<div id="life_insurance_help1" class="common_custom_modal"
			style="width: 838px; height: 535px; margin-top: 180px;">
			<h3 class="modal_heading clearfix">
				Action Plan Help<span class="close">X</span>
			</h3>
			<div class="modal_content">

				<h3 class="northspace4">The action plan is a list of
					recommended actions you need to take to bridge the gaps:</h3>
				<br>

				<ul type="disc">
					<li>In meeting your goals</li>
					<li>In your emergency and succession plan</li>
					<li>In the various risk coverage</li>
				</ul>

				<ul type="circle">
					<li>First few pages show recommended products (mostly Mutual
						Funds) for each goal and corresponding investments needed for both
						SIP and lumpsum options. A product wise summary view is provided
						for your convenience which lists a product and how much you need
						to invest in that product for each of the goals. It allows you to
						choose a particular option.</li><br>
			
					<li>These recommendations are based on the goal duration, your risk appetite and the advisors research and analysis of various products in the market.
					</li><br>
					<li>Next page shows the gaps and actions for bridging the gap in emergency products.The recommendations are based on your monthly expenses and keeping in mind the liquidity of the investments.
					</li><br>
					<li>They are typically deposits and liquid funds.
					</li><br>
					<li>Following page shows the gaps in the required coverage and the available coverage.  We recommend two options to choose from. The premiums mentioned are approximate. Please approach your advisor to get specific quote/proposals.
					</li><br>
					<li>Finally, the succession planning related actions are outlined on the last page.  Will preparation is facilitated through the backend service team of your advisor.
					</li>
				</ul>
		</div>
	</div>

    <c:set var="pieces"
							value="${fn:split(headerName, '(')}" />
						<section class="content common_content">
     	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix">
      <div id="page_loader" style="display:none;"></div>
      <div id="page_loader1" style="display:none;">
      	<div style="width:100%;text-align:center;">
      	<img src="${pageContext.request.contextPath}/resources/images/loader.gif" alt="loader"/><br/>
      	<span style="width:100%;text-align:center;" id="currentReportName">Processing Quick Report</span>
      	</div>
      </div>
        <div class="generate_report_in">
          <h2 class="heading">Generate Reports</h2>
          <div class="description_up">
            <ul class="clearfix">
              <li>
                <div class="fl"><span class="txt_one">Generate Analysis Report And Action Plan for</span> 
                <span class="txt_two">${pieces[0]}</span> <span class="txt_three">(${pieces[1]}</span> </div>
                <div class="fr">
<!--                   <input type="submit" class="submit_btn" value="Generate"> -->
                </div>
                <div class="comment fr">
<!--                   <select name=""> -->
<!--                     <option>Quick</option> -->
<!--                     <option>Summarized</option> -->
<!--                     <option>Details</option> -->
<!--                   </select> -->
                </div>
                <div class="clr"></div>
              </li>
            </ul>
            <%-- <ul class="clearfix">
              <li>
                <div class="fl"><span class="txt_one">Generate Action Plan for</span> <span class="txt_two">${pieces[0]}</span> <span class="txt_three">(${pieces[1]}</span></div>
                <div class="fr">
<!--                   <input type="submit" class="submit_btn" value="Generate"> -->
                </div>
                <div class="clr"></div>
              </li>
            </ul> --%>
            <ul class="clearfix">
              <li>
                <div class="fl">
													<span class="txt_one">Generate Action Plan for</span> <span
														class="txt_two">${advisorName}</span> <span
														class="txt_three">(Advisor)</span>&nbsp;&nbsp;<span
														class="txt_two" onclick="popUpHelp()"
														style="cursor: pointer;">Help</span> </div>
               <div class="fr">
                <c:choose>
                	<c:when test="${party.flag eq 1}">
	                  <input type="submit" class="submit_btn generateReportLink" value="Generate">
	                 </c:when>
	                 <c:otherwise>
	                 	<input type="submit" class="submit_btn inactiveLink generateReportLink" value="Generate">
	                 </c:otherwise>
                </c:choose>             
                </div>
                <!-- <div class="fr" id="report_multiselect_parent">
                <select id="report_multiselect" multiple class="">
				   <option id="quickOption">Goals</option>
                   <option id="summarizedOption">Goals & Risk</option>
                   <option id="detailedOption">Goals, Risk & Succession</option>
                   <option id="comprehensiveOption" selected="selected">Comprehensive</option>
                   <option id="actionPlanOption" selected="selected">Action Plans</option>
		       </select>
               </div> -->
               <div class="clr"></div>
              </li>
              <br/>
              <li>
              	<div class="fl">
               		<input type="radio" id="quickOption" name="reportType" value="Goals" /><span class="txt_one">Goals</span>&nbsp;&nbsp;
               		<input type="radio" id="summarizedOption" name="reportType" value="Goals & Risk" /><span class="txt_one">Goals & Risk</span>&nbsp;&nbsp;
               		<input type="radio" id="detailedOption" name="reportType" value="Goals, Risk & Succession" /><span class="txt_one">Goals, Risk & Succession</span>&nbsp;&nbsp;
               		<input type="radio" id="comprehensiveOption" name="reportType" value="Comprehensive" /><span class="txt_one">Comprehensive</span>&nbsp;&nbsp;
               		<!-- <input type="radio" hidden="actionPlanOption" id="actionPlanOption" value="Action Plans" name="Action Plans" /><span class="txt_one" hidden>Action Plans</span> -->
               </div>
              </li>
            </ul>
          </div>
          <h2 class="heading clearfix">
            <div class="title_one fl">For ${pieces[0]} (${pieces[1]}</div>
            <div class="fr eastspace5">For ${advisorName} (Advisor)</div>
          </h2>
          <div class="description_down clearfix">
            <div class="left fl">
             <c:if test="${not empty (party.reserved2DocumentDateTime)}">
             	<span class="genrated_lbl">Generated On :</span>
             </c:if>             
              <div class="list_bx clearfix first">
                <div class="title clearfix">Goals</div>
                <c:choose>
                   		<c:when test="${not empty party.reserved2DocumentDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                   <div class="clearfix ${inactiveFlag}">
                <c:choose>
                  	<c:when test="${isMobile eq 'true'}">
                  		<a href="#" class="${inactiveFlag} quickReportLink" onclick="checkFilePresense('analysisA','${partyId}',1,event);generateReports('analysisA','${partyId}',1);"><div class="img clearfix"> </div>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="#" class="${inactiveFlag} quickReportLink" onclick="checkFilePresense('analysisA','${partyId}',0,event);generateReports('analysisA','${partyId}',0);"><div class="img clearfix"> </div>	
                  	</c:otherwise>
                  </c:choose>
                </a>
                </div>
                 <div class="icon_bx">${party.reserved2DocumentDateTime}</div>
                   <div class="icon_bx">                    
                  <c:choose>
                  	<c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                    	<div class="preview"><a href="#" class="${inactiveFlag} quickReportLink" onclick="checkFilePresense('analysisA','${partyId}',1,event);generateReports('analysisA','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>View</span></a></div>
                   </c:when>
                   <c:when test="${isMobile eq 'true'}">
                    <div class="preview dwnld"><a href="#" class="${inactiveFlag} quickReportLink" onclick="checkFilePresense('analysisA','${partyId}',1,event);generateReports('analysisA','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>Download</span></a></div>
                   </c:when>
                  	<c:otherwise>
                  		<div class="preview"><a href="#" class="${inactiveFlag} quickReportLink" onclick="checkFilePresense('analysisA','${partyId}',0,event);generateReports('analysisA','${partyId}',0);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  	</c:otherwise>
                  	</c:choose>
                  <div class="tp clearfix"> <a href="#" onclick="mailSend('Quick','${party.flag}');" class="${inactiveFlag} inactiveLink quickReportLink"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>
              </div>
              <div class="list_bx clearfix">
                <div class="title clearfix">Goals & Risk</div>
                <c:choose>
                   		<c:when test="${not empty party.reserved3DocumentDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                   <div class="clearfix ${inactiveFlag}">
                   <c:choose> 
                  	<c:when test="${isMobile eq 'true'}">
                  		<a href="#" class="${inactiveFlag} summarizedReportLink" onclick="checkFilePresense('analysisB','${partyId}',1,event);generateReports('analysisB','${partyId}',1);"><div class="img clearfix"> </div>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="#" class="${inactiveFlag} summarizedReportLink" onclick="checkFilePresense('analysisB','${partyId}',0,event);generateReports('analysisB','${partyId}',0);"><div class="img clearfix"> </div>
                  	</c:otherwise>
                  	</c:choose>
                </a>
                </div>
                <div class="icon_bx">${party.reserved3DocumentDateTime}</div>
                <div class="icon_bx">
                  <c:choose>
                  <c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                  	<div class="preview"><a href="#" class="${inactiveFlag} summarizedReportLink" onclick="checkFilePresense('analysisB','${partyId}',1,event);generateReports('analysisB','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>View</span></a></div>
                  </c:when>
                  	<c:when test="${isMobile eq 'true'}">
                  		<div class="preview dwnld"><a href="#" class="${inactiveFlag} summarizedReportLink" onclick="checkFilePresense('analysisB','${partyId}',1,event);generateReports('analysisB','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>Download</span></a></div>
                  	</c:when>
                  	<c:otherwise>
                  		<div class="preview"><a href="#" class="${inactiveFlag} summarizedReportLink" onclick="checkFilePresense('analysisB','${partyId}',0,event);generateReports('analysisB','${partyId}',0);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  	</c:otherwise>
                  	</c:choose>
                  <div class="tp clearfix"> <a href="#" onclick="mailSend('Summarized','${party.flag}');" class="${inactiveFlag} inactiveLink summarizedReportLink"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>
                <div class="clr"></div>
              </div>
              <div class="list_bx clearfix">
                <div class="title clearfix">Goals, Risk & <br/> Succession</div>
                <c:choose>
                   		<c:when test="${not empty party.reserved4DocumentDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                   <div class="clearfix ${inactiveFlag}">
                   <c:choose>
                  	<c:when test="${isMobile eq 'true'}">
                  		<a href="#" class="${inactiveFlag} detailedReportLink" onclick="checkFilePresense('analysisC','${partyId}',1,event);generateReports('analysisC','${partyId}',1);"><div class="img clearfix"> </div>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="#" class="${inactiveFlag} detailedReportLink" onclick="checkFilePresense('analysisC','${partyId}',0,event);generateReports('analysisC','${partyId}',0);"><div class="img clearfix"> </div>
                  	</c:otherwise>
                  	</c:choose>
                </a>
                </div>
                 <div class="icon_bx">${party.reserved4DocumentDateTime}</div>
                 <div class="icon_bx">
                 <c:choose>
                 <c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                 	<div class="preview"><a href="#" class="${inactiveFlag} detailedReportLink" onclick="checkFilePresense('analysisC','${partyId}',1,event);generateReports('analysisC','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>View</span></a></div>
                 </c:when>
                 	<c:when test="${isMobile eq 'true'}">
                 		<div class="preview dwnld"><a href="#" class="${inactiveFlag} detailedReportLink" onclick="checkFilePresense('analysisC','${partyId}',1,event);generateReports('analysisC','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>Download</span></a></div>
                 	</c:when>
                 	<c:otherwise>
                 		<div class="preview"><a href="#" class="${inactiveFlag} detailedReportLink" onclick="checkFilePresense('analysisC','${partyId}',0,event);generateReports('analysisC','${partyId}',0);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                 	</c:otherwise>
                 </c:choose> 
                  
                  <div class="tp clearfix"> <a href="#" onclick="mailSend('Detailed','${party.flag}');" class="${inactiveFlag} inactiveLink detailedReportLink"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>  
                <div class="clr"></div>
              </div>
              <div class="list_bx clearfix">
                <div class="title clearfix">Comprehensive</div>
                <c:choose>
                   		<c:when test="${not empty party.analysisReportDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                   <div class="clearfix ${inactiveFlag}">
                   <c:choose>
                  	<c:when test="${isMobile eq 'true'}">
                  		<a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisD','${partyId}',1,event);generateReports('analysisD','${partyId}',1);"><div class="img clearfix"> </div>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisD','${partyId}',0,event);generateReports('analysisD','${partyId}',0);"><div class="img clearfix"> </div>
                  	</c:otherwise>
                  	</c:choose>
                 </a>
                 </div>
                   <div class="icon_bx">${party.analysisReportDateTime}</div>
                   <div class="icon_bx">
                  <c:choose>
                  <c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                  	<div class="preview"><a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisD','${partyId}',1,event);generateReports('analysisD','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>View</span></a></div>
                  </c:when>
                  	<c:when test="${isMobile eq 'true'}">
                  		<div class="preview dwnld"><a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisD','${partyId}',1,event);generateReports('analysisD','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>Download</span></a></div>
                  	</c:when>
                  	<c:otherwise>
                  		<div class="preview"><a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisD','${partyId}',0,event);generateReports('analysisD','${partyId}',0);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  	</c:otherwise>
                  	</c:choose>
                  <div class="tp clearfix"> <a href="#" onclick="mailSend('Client','${party.flag}');" class="${inactiveFlag} inactiveLink clientActionPlanLink"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>
                <div class="clr"></div>
              </div>
              <div class="list_bx clearfix">
                <div class="title clearfix">Action Plan</div>
                <c:choose>
                   		<c:when test="${not empty party.clientActionPlanDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                   <div class="clearfix ${inactiveFlag}">
                   <c:choose>
                  	<c:when test="${isMobile eq 'true'}">
                  		<a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisClient','${partyId}',1,event);generateReports('analysisClient','${partyId}',1);"><div class="action_plan_img clearfix"> </div>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisClient','${partyId}',0,event);generateReports('analysisClient','${partyId}',0);"><div class="action_plan_img clearfix"> </div>
                  	</c:otherwise>
                  	</c:choose>
                 </a>
                 </div>
                   <div class="icon_bx">${party.clientActionPlanDateTime}</div>
                   <div class="icon_bx">
                  <c:choose>
                  <c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                  	<div class="preview"><a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisClient','${partyId}',1,event);generateReports('analysisClient','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>View</span></a></div>
                  </c:when>
                  	<c:when test="${isMobile eq 'true'}">
                  		<div class="preview dwnld"><a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisClient','${partyId}',1,event);generateReports('analysisClient','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>Download</span></a></div>
                  	</c:when>
                  	<c:otherwise>
                  		<div class="preview"><a href="#" class="${inactiveFlag} clientActionPlanLink" onclick="checkFilePresense('analysisClient','${partyId}',0,event);generateReports('analysisClient','${partyId}',0);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  	</c:otherwise>
                  	</c:choose>
                  <div class="tp clearfix"> <a href="#" onclick="mailSend('Client','${party.flag}');" class="${inactiveFlag} inactiveLink clientActionPlanLink"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>
                <div class="clr"></div>
              </div>
              
              <div class="clr"></div>
            </div>
            <div class="right fl">
              <div class="report_disbale_enable">
              <div class="custom_checkbox"></div>
              <input type="checkbox" class="default_checkbox"/>
              </div>
              <div class="list_bx clearfix">
                <div class="title clearfix">Action Plan</div>
                <c:choose>
                   		<c:when test="${not empty party.advisorActionPlanDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                   <div class="clearfix ${inactiveFlag}">
                   <c:choose>
                  	<c:when test="${isMobile eq 'true'}">
                  		<a href="#" class="${inactiveFlag} advisorActionPlanLink" onclick="checkFilePresense('analysisAdvisor','${partyId}',1,event);generateReports('analysisAdvisor','${partyId}',1);"><div class="action_plan_img clearfix"> </div>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="#" class="${inactiveFlag} advisorActionPlanLink inlineBlock rpt_type_bg inactiveLink" onclick="checkFilePresense('analysisAdvisor','${partyId}',0,event);generateReports('analysisAdvisor','${partyId}',0);"><div class="action_plan_img clearfix"> </div>
                  	</c:otherwise>
                  	</c:choose>
                 </a>
                 </div>
                 <div class="inactiveLink icon_bx">${party.advisorActionPlanDateTime}</div>
                  <div class="icon_bx inactiveLink">
                  <c:choose>
                  <c:when test="${(isMobile eq 'true') and (isIpad eq 'true')}">
                  	<div class="preview"><a href="#" class="${inactiveFlag} advisorActionPlanLink" onclick="checkFilePresense('analysisAdvisor','${partyId}',1,event);generateReports('analysisAdvisor','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>View</span></a></div>
                  </c:when>
                  	<c:when test="${isMobile eq 'true'}">
                  		<div class="preview dwnld"><a href="#" class="${inactiveFlag} advisorActionPlanLink" onclick="checkFilePresense('analysisAdvisor','${partyId}',1,event);generateReports('analysisAdvisor','${partyId}',1);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" class="downloadimg" width="30" height="17" alt=""><span>Download</span></a></div>
                  	</c:when>
                  	<c:otherwise>
                  		<div class="preview"><a href="#" class="${inactiveFlag} advisorActionPlanLink" onclick="checkFilePresense('analysisAdvisor','${partyId}',0,event);generateReports('analysisAdvisor','${partyId}',0);"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  	</c:otherwise>
                  </c:choose>                  
                  <div class="tp clearfix"> <a href="#" onclick="mailSend('Advisor','${party.flag}');" class="${inactiveFlag} inactiveLink advisorActionPlanLink"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div> 
                <div class="clr"></div>
              </div>
          <div class="clr"></div>
            </div>
          </div>
          <div class="clr"></div>
        </div>
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list inactiveLink"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/${partyId}/${headerName}/2" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
      <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list inactiveLink"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation inactiveLink"><span class="txt">Back</span></a> <a href="#" class="next navgation inactiveLink"><span class="txt">Next</span></a></section>
      
      <!-- Common footer ends -->
      <div id="life_insurance_methods" class="common_custom_modal">
  <h3 class="modal_heading clearfix">Life Insurance Methods <div class="help_btn">Help</div><span class="close">X</span></h3>
  <div class="modal_content"> 
 
   <table>
   <tr class="theme_background"><th class="theme_border">Calculation Method</th><th class="theme_border">Insurance Amount</th></tr>
    <tr><td class="theme_border">HLV</td><td class="theme_border">
    <c:choose>
    	<c:when test="${fn:contains(resultList[1], 'E')}">
    		<fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="0" value="0"/></td></tr>
    	</c:when>
    	<c:otherwise>
    		<fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="0" value="${resultList[1]}"/></td></tr>
    	</c:otherwise>
    </c:choose>
    <tr><td class="theme_border">Expense Replacement</td><td class="theme_border">
    <c:choose>
    	<c:when test="${fn:contains(resultList[2], 'E')}">
    		<fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="0" value="0"/></td></tr>
    	</c:when>
    	<c:otherwise>
    		<fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="0" value="${resultList[2]}"/></td></tr>
    	</c:otherwise>
    </c:choose>
    <tr><td class="theme_border">Income Replacement</td><td class="theme_border">
    <c:choose>
    	<c:when test="${fn:contains(resultList[3], 'E')}">
    		<fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="0" value="0"/></td></tr>
    	</c:when>
    	<c:otherwise>
    		<fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="0" value="${resultList[3]}"/></td></tr>
    	</c:otherwise>
    </c:choose>
   </table>
 <div class="calc_section clearfix">  <p class="sel_txt fl">Select calculation method for this contact &nbsp;:</p> 
   <select class="calc_method" id="calc_method">
   <option value="0">HLV</option>
   <option value="1">Expense Replacement</option>
   <option value="2">Income Replacement</option>
   </select></div>
   <input type="button" value="Submit" class="common_btn" onclick="saveCalaculationMethod();"/>
   <div class="clr"></div>
  
  </div>
</div>
<div id="life_insurance_help" class="common_custom_modal">
  <h3 class="modal_heading clearfix">Life Insurance Calculation Help <span class="close">X</span></h3>
  <div class="modal_content"> 
 <h3>Income Replacement:</h3>
          <h6>Objective:</h6>
          <p> In case of death of primary earning member, financial loss to family is equivalent to the income that person would have earned till his / her retirement. Life insurance can be a way this loss is replaced to the family. Income replacement method uses the formula :</p>
          <!-- <p>Insurance cover = (Current  Annual Income ∗	 number of years to retirement) </p> -->
          <p>Insurance cover = (Current  Annual Income &lowast; number of years to retirement) </p>
          <h3 class="northspace4">Expense Replacement:</h3>
          <h6>Objective:</h6>
          <p> In case of death of the primary earning member, the expenses of the dependents have to be handled till they are alive. To ensure that in the absence of the breadwinner , all the inevitable expenses are  planned for and helps the family to be financially sound.</p>
          <p> Insurance cover = Present value ( expenses for expected life remaining) while accounting for Effective rate of return.  Effective rate of return
            <!-- is based on the growth rate and inflation rate − available cover </p> -->
            is based on the growth rate and inflation rate &minus; available cover </p>
          <h3 class="northspace4">HLV Replacement:</h3>
          <h6>Objective:</h6>
          <p> To ensure that in the absence of the breadwinner , all the inevitable expenses and life goals (goals such as education, marriage) are  planned for. The
            method also takes into account the outstanding loans and current assets. </p>
          <!-- <p> <strong>Calculation</strong>: Insurance cover = Cover as per Expense replacement method without considering EMIs + Value of life goals  + Loans outstanding − Available assets − available cover </p> -->
          <p> <strong>Calculation</strong>:
Insurance cover = Cover as per Expense replacement method without considering EMIs + Value of life goals + Loans outstanding &minus; Available assets &minus; Available cover </p>
          <p class="strong">Example:</p>
          <p>Let's see how it works for Mr. A.B. Joshi. Let's make following assumptions:</p>
          <table class="exmple_table">
            <tbody><tr>
              <th class="col1">Age</th>
              <td class="col2">35</td>
              <th class="col3">Inflation rate</th>
              <td class="col4">6%</td>
            </tr>
            <tr>
              <th>Income</th>
              <td>INR 5 Lac p.a.</td>
              <th>Return on Existing investment</th>
              <td>7%</td>
            </tr>
            <tr>
              <th>Expenses</th>
              <td>INR 30,000/-  p.m.</td>
              <th>Life expectancy</th>
              <td>85</td>
            </tr>
            <tr>
              <th>EMIs</th>
              <td>INR 15,000/- p.m.</td>
              <th>Retirement Age</th>
              <td>60</td>
            </tr>
            <tr>
              <th>Existing cover</th>
              <td>INR 15 Lac</td>
              <th>Existing Loans</th>
              <td>INR 60 Lac</td>              
            </tr>
          </tbody></table>
          <div class="example2_div clearfix">
            <table class="fl">
              <caption class="strong">
              Goals
              </caption>
              <tbody><tr>
                <th class="col1">Education</th>
                <td class="col2">INR 10 Lac</td>
              </tr>
              <tr>
                <th>Child Marriage</th>
                <td>INR 5.5 Lac</td>
              </tr>
            </tbody></table>
            <table class="fr">
              <caption class="strong">
              Current Investments
              </caption>
              <tbody><tr>
                <th class="col1">Equity</th>
                <td class="col2">INR 5 Lacs</td>
              </tr>
              <tr>
                <th>Debt</th>
                <td>INR 85,000</td>
              </tr>
            </tbody></table>
            </div>
            <div class="northspace3"><h6>Income Replacement</h6>
            <p>Insurance cover = (5 Lac &lowast; (60-35)) &minus; 15 Lac = 1.11 Cr</p>
<h6>Expense Replacement</h6>
<p> ROR = (1+Growth rate)/(1+Inflation Rate) &minus; 1 = (1.07/1.06 &minus; 1) = 0.94%</p>
<p> Insurance cover = PV(ROR/12,(Life Expectancy &minus; Current Age) &lowast; 12, &minus; Monthly expenses,0,0) </p>
<p> = PV (0.94%, (85-35) &lowast; 12, &minus; 45000,0,0) </p>
<p> = 2.15 Cr</p>
<h6> HLV</h6>
<p>Insurance cover as per expense replacement without EMI = 1.43 CR</p>
<p>Insurance cover = 1.43 Cr + 15.5 Lac + 60 Lac &minus; 6 lacs &minus; 15 lacs = 1.97 Cr</p></div>
   
 
   
   
  
  </div>
</div>
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
  	<c:set value="${sessionScope.userSession}" var="sessionObject"></c:set>
  	<c:set value="${sessionScope.headerName}" var="headerName"></c:set>
  <c:choose>
  	<c:when test="${not(empty (isMobile))}">
		<iframe height="100%" width="100%" id="reportframe" style="display:none;"  src=""></iframe>
  	</c:when>
  </c:choose>
  
</div>
<form id="downloadAttachmentForm" target="_new">
  <input type="hidden" name="partyId" id="partyId">
  <input type="hidden" name="reportFor" id="reportFor">
 </form>
<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up"> You have modified the data but you have not generated the report again. Do you want to view/email the earlier version?</div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
<!-- Wrapper ends-->
<script>

var reportUrl = "";
var name = "";
var reportCount = 0;

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

 function popUpHelp()
{
	$(".overlay").fadeIn("slow")
	$("#life_insurance_help1").fadeIn("slow")
	$("#life_insurance_help1").animate("slow").css("visibility","visible");
}

$(document).ready(function(){
	
	$("#comprehensiveOption").attr("checked","checked");
	
    $(".calc_method").selectBoxIt();
	var selectBox1 = $("#calc_method").selectBoxIt().data('selectBox-selectBoxIt');			    
    selectBox1.selectOption('${resultList[4]}');
	
	<c:if test="${(not (empty party.reserved2DocumentDateTime)) or (not (empty party.reserved3DocumentDateTime)) or (not (empty party.reserved4DocumentDateTime)) or (not (empty party.analysisReportDateTime)) or (not (empty party.clientActionPlanDateTime)) or (not (empty party.advisorActionPlanDateTime))}">
		<c:if test="${party.flag eq 1}">
			//displayMsg("Please click on Generate Report if you would like to see the revised Analysis Report.");
		</c:if>
	</c:if>
	
    $('.wrapper').addClass("genrate_report_wrapper"); 
    $('.common_in_content').slimScroll();
		
	$('#report_multiselect').listbox();	
	
	$("#life_insurance_methods .close").click(function(){
		$(".overlay").fadeOut("slow");
		$ ("#life_insurance_methods iframe").animate("slow").css("display","none");
		$("#life_insurance_methods").animate("slow").css("visibility","hidden");
	});
	
	$("#life_insurance_help1 .close").click(function(){
		$(".overlay").fadeOut("slow");
		$ ("#life_insurance_help1 iframe").animate("slow").css("display","none");
		$("#life_insurance_help1").animate("slow").css("visibility","hidden");
	});
	
	
	$("#life_insurance_help .close").click(function(){
		/* $(".overlay").fadeOut("slow"); */
		$ ("#life_insurance_help iframe").animate("slow").css("display","none");
		$("#life_insurance_help").animate("slow").css("visibility","hidden");
	});
	
	$(".description_down .right .custom_checkbox").click(function(){
	 $(this).toggleClass("custom_checkbox_checked");
    $(".rpt_type_bg,.description_down .right .icon_bx").toggleClass("inactiveLink");
	 if ($(this).next(".default_checkbox" ).is(":checked")) {
		
       $(this).next(".default_checkbox").prop("checked",false);
    } else {
       $(this).next(".default_checkbox").prop("checked", true);
	
    }
	

	});
	
	$(function() {

		$(document).ajaxStop(function() {
			 $('#page_loader1').fadeOut();
		});

		$(document).ajaxStart(function() {
			 $('#page_loader1').fadeIn();
		});

	});
	
	$("#confirmDialog .close").click(function(){
	    $(".overlay").fadeOut("slow");
		$("#confirmDialog").fadeOut("slow");
		 });
	
	$('#life_insurance_help .modal_content').slimScroll();
	 $("#life_insurance_methods .help_btn").click(function(){
			$(".overlay").fadeIn("slow")
			$("#life_insurance_help").fadeIn("slow")
			$("#life_insurance_help").animate("slow").css("visibility","visible");
	  });
	
	var partnerSetupLinks = "${reportLink}";
	  var pieces = partnerSetupLinks.split(",");
	  if(partnerSetupLinks!=""){
		  for(var i=0;i<pieces.length;i++){
			   $("."+pieces[i]).attr("href","#");
			   $("."+pieces[i]).removeAttr('onclick');
			   $("."+pieces[i]).unbind();
			  $("."+pieces[i]).addClass("inactiveLink");
			  }  
	  }	  
  });

var analysisURL = "";
if("${userName}"==""){
	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/A";
}else{
	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/A";	
}

	$(".submit_btn").click(function() {				
		if(document.getElementById("quickOption").checked || document.getElementById("summarizedOption").checked || document.getElementById("detailedOption").checked 	|| document.getElementById("comprehensiveOption").checked){			
			$(".overlay").fadeIn("fast");
		    $("#life_insurance_methods").fadeIn("slow");
			$("#life_insurance_methods").animate("slow").css("visibility","visible");
			$(":selectBox-selectBoxIt").each(function(){
            $(this).data('selectBox-selectBoxIt').refresh();
            });
		}else{
			displayMsg("Select atleast one report type.");
		}
		//alert($("#report_multiselect").val());
		
	});

	function createQuickReport(){
		if(document.getElementById("quickOption").checked){
			$("#currentReportName").html("Processing Goals Report");
			reportCount = reportCount + 1;
			$.ajax({
		        type : "POST",
		        url : analysisURL,	        
		        success : function(result) {
		        	createSummarizedReport();
		        },
				error : function(err){
					createSummarizedReport();
				}
	        });
		}else{
			createSummarizedReport();
		}
	}
	
	$("#life_insurance_methods .common_btn").click(function(){	
	  $(".overlay").fadeOut("fast");
	  $("#life_insurance_methods").fadeOut("slow");
	});

function saveCalaculationMethod(){
		var selectedVal = $("#calc_method").val();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/partner/report/saveLifeInsuranceMethod",
			data:{'clientPartyId':'${partyId}','liMethod':selectedVal},
			success: function(data){
				//createQuickReport();
				saveReportsDetails();
			},
			error : function(err){
				displayMsg("Error saving insurance details.Please try again later.");
			}
			});
	
	}

function saveReportsDetails(){
	
	var isAnalysisGeneration;
	var isActionPlanGeneration=1;
	var analysisReportType;
	
	if(document.getElementById("quickOption").checked){
		isAnalysisGeneration = 1;
		analysisReportType = 384;
	}
	if(document.getElementById("summarizedOption").checked){
		isAnalysisGeneration = 1;
		analysisReportType = 385;
	}
	if(document.getElementById("detailedOption").checked){
		isAnalysisGeneration = 1;
		analysisReportType = 386;
	}
	if(document.getElementById("comprehensiveOption").checked){
		isAnalysisGeneration = 1;
		analysisReportType = 383;
	}
	
	$("#currentReportName").html("Processing Reports");
	$.ajax({
        type : "POST",
        url : "${pageContext.request.contextPath}/partner/report/saveAnalysisReportsForBatch",
        data : {'partyId': '${partyId}','isAnalysisGeneration': isAnalysisGeneration,'isActionPlanGeneration': isActionPlanGeneration,'analysisReportType': analysisReportType},
        success : function(result) {
			//createDetailedReport();
			displayMsg("Reports will generate in 5 mins.");
        	window.location.reload(true);
        },
		error : function(err){
				//createDetailedReport();
			window.location.reload(true);
		}
    });
	
}
	
function createSummarizedReport(){
	
	if(document.getElementById("summarizedOption").checked){
		$("#currentReportName").html("Processing Goals & Risk Report");
		reportCount = reportCount + 1;
		var analysisURL = "";
		if("${userName}"==""){
			analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/B";
		}else{
			analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/B";	
		}
		
		$.ajax({
	        type : "POST",
	        url : analysisURL,	        
	        success : function(result) {
				createDetailedReport();
	        },
			error : function(err){
				createDetailedReport();
			}
	    });
	}else{
		createDetailedReport();
	}
	
}

function createDetailedReport(){
	
	if(document.getElementById("detailedOption").checked){
		$("#currentReportName").html("Processing Goals, Risk & Succession Report");
		reportCount = reportCount + 1;
		var analysisURL = "";
		if("${userName}"==""){
			analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/C";
		}else{
			analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/C";	
		}
		
		$.ajax({
	        type : "POST",
	        url : analysisURL,	        
	        success : function(result) {
	        	//createActionPlan();
	        	createDetailedReportClient();
	        },
			error : function(err){
				//createActionPlan();
				createDetailedReportClient();
			}
	    });
	}else{
		//createActionPlan();
		createDetailedReportClient();
	}
	
}
	
function createDetailedReportClient(){
	/* if(document.getElementById("actionPlanOption").checked){
		 */
		var actionPlanURL = "";
		if("${userName}"==""){
			actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/null/${buId}/client";
		}else{
			actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/${userName}/${buId}/client";	
		}
		
		reportCount = reportCount + 1;
		$("#currentReportName").html("Processing Client Action Plan");
		$.ajax({
	        type : "POST",
	        url : actionPlanURL,	
	        //partner/report/detailedReport/115040/client/ChetanHendre/153
	        success : function(result) {
	        	createDetailedReportAdvisor();
	        },
			error : function(err){
				createDetailedReportAdvisor();
			}
	    });
	/* }else{
		createActionPlan();
	} */
}

function createDetailedReportAdvisor(){
	
	var actionPlanURL = "";
	if("${userName}"==""){
		actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/null/${buId}/advisor";
	}else{
		actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/${userName}/${buId}/advisor";	
	}
	
	$("#currentReportName").html("Processing Advisor Action Plan");
	$.ajax({
        type : "POST",
        url : actionPlanURL,	
        success : function(result) {
			//createDetailedReport();
        	//window.location.reload(true);
        	createActionPlan();
        },
		error : function(err){
				//createDetailedReport();
			//window.location.reload(true);
			createActionPlan();
		}
    });
}

function createActionPlan(){
	
	var contextPath="${baseUrl}";
	var createUrl =	contextPath+'/FIINFRA-WEB/dc/submitDcInput1.htm?';	
	createUrl = createUrl + 'userName=${USER_NAME}&dcInputPartyId=${partyId}&buId=${sessionObject.buId}&partyId=${sessionObject.partyId}&createdBy=${sessionObject.userId}&roleId=${sessionObject.roleId}&opportunityName=${headerName}&TOKEN=abc&USER_NAME=shubhchintak&theme=${themeName}';
	
	/* if(document.getElementById("actionPlanOption").selected){
		reportCount = reportCount + 1;
		createUrl = createUrl + "&isActionPlanGeneration=true";
		if(document.getElementById("comprehensiveOption").selected){
			createUrl = createUrl + "&isAnalysisReportGenration=true";
		}
		$("#currentReportName").html("Processing Action Plans");
		$.ajax({
	        type : "POST",
	        url : createUrl,
	        data :  $('form').serialize(), 
	        success : function(result) {        	
	        	/* var new_window = window.open(contextPath+'/partner/generate-analysis-c-report/${USER_NAME}/${partyId}/${sessionObject.buId}/${sessionObject.partyId}/${sessionObject.userId}/${sessionObject.roleId}/${headerName}/${themeName}');
	        	new_window.onbeforeunload = function(){ 
	        		window.location.reload(true);
	        	}; */ 
	        /*	createComprehensiveReport();
	        },
			error : function(err){
				createComprehensiveReport();
			}
	    });
	}else{  */
		if(document.getElementById("comprehensiveOption").checked){
			reportCount = reportCount + 1;
			createUrl = createUrl + "&isAnalysisReportGenration=true";
			$("#currentReportName").html("Processing Comprehensive Report");
			$.ajax({
		        type : "POST",
		        url : createUrl,
		        data :  $('form').serialize(), 
		        success : function(result) {        	
		        	/* var new_window = window.open(contextPath+'/partner/generate-analysis-c-report/${USER_NAME}/${partyId}/${sessionObject.buId}/${sessionObject.partyId}/${sessionObject.userId}/${sessionObject.roleId}/${headerName}/${themeName}');
		        	new_window.onbeforeunload = function(){ 
		        		window.location.reload(true);
		        	}; */ 
		        	createComprehensiveReport();
		        },
				error : function(err){
					createComprehensiveReport();
				}
		    });
		}else{
			if(reportCount > 0){
				window.location.reload(true);
			}else{
				displayMsg("Select atleast one report type.");
			}
			
		}
	//}
	
}

function createComprehensiveReport(){
	
	$("#currentReportName").html("Processing Comprehensive Report");
	$.ajax({
        type : "POST",
        url : "${pageContext.request.contextPath}/partner/report/generate-analysis-c-report/${partyId}",
        data : {'themeName': '${themeName}','headerName': '${headerName}'},
        success : function(result) {
			//createDetailedReport();
        	window.location.reload(true);
        },
		error : function(err){
				//createDetailedReport();
			window.location.reload(true);
		}
    });
	
}

function generatePDF(){
	//alert('generatePDF()');
	window.open('http://localhost:8080/${pageContext.request.contextPath}/partner/report/generatePDFReport/${partyId}','_blank');
	/* $.ajax({
        type : "GET",
        contentType: "application/octet-stream",
        url : "${pageContext.request.contextPath}/partner/report/generatePDFReport/${partyId}",
        success : function(result) {
        	alert('success');
        }
	}); */
}
$("#analysisCD").click(function(){
	$("#currentReportName").html("");
	$.ajax({
        type : "GET",
        url : "${pageContext.request.contextPath}/partner/report/checkReport/analysisC/${partyId}",	        
        success : function(result) {
	        	if(result == 'file found'){
	        		 $(".overlay").fadeIn();
	        		 $("#video_first_dialog").animate("slow").css("visibility","visible");
	        		$("#video_first_dialog iframe").animate("slow").css("display","block");
	        	}else{
	        		displayMsg('Report not generated');
	        	}
        },
		error : function(err){
			displayMsg('Report not generated');
		}
    });
	

	$(".video_first_dialog .close").click(function(){
		$(".overlay").fadeOut("slow");
		$ (".video_first_dialog iframe").animate("slow").css("display","none");
		$(".video_first_dialog").animate("slow").css("visibility","hidden");
		});
});

function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}

function viewReports(url, flag){
	reportUrl = url;
	/* if(flag == 1){
		$(".aa_yes").unbind();
		$(".aa_yes").click(function(){showReport();});		
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}else{ */
		showReport();
	//}
}


function showReport(){
	closeDialog();
	/* alert("1"); */
	$("#currentReportName").html("");
	$.ajax({
        type : "GET",
        url : reportUrl,     
        success : function(result) {
	        if(result == 'file found'){
	        		
        	}else{
    			displayMsg('Report not generated');
    		}
        },
		error : function(err){
			displayMsg('Report not generated');
		}
    });
}

function mailSend(reportName, flag){
	name = reportName;
	/* if(flag == 1){
		$(".aa_yes").unbind();
		$(".aa_yes").click(function(){sendReport();});		
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
	}else{ */
		sendReport();
	//}
}

function checkFilePresense(reportFor,partyId,flag,e){
	
 $("#currentReportName").html("");
	$.ajax({
        type : "GET",
        url : "${pageContext.request.contextPath}/partner/report/checkReport/"+reportFor+"/"+partyId,     
        success : function(result) {
	        if(result == 'file found'){ 
	        	$("#partyId").val(partyId);
	        	$("#reportFor").val(reportFor);			        	
        	 }else{
    			displayMsg('Report not generated');
    			e.preventDefault();
    		} 
         },
		error : function(err){
			displayMsg('Report not generated');
			e.preventDefault();
		}
    });	

}

function generateReports(reportFor,partyId,flag){
	
	/* $("#currentReportName").html("");
	$.ajax({
        type : "GET",
        url : "${pageContext.request.contextPath}/partner/report/checkReport/"+reportFor+"/"+partyId,     
        success : function(result) {
	        if(result == 'file found'){ */
	        	$("#partyId").val(partyId);
	        	$("#reportFor").val(reportFor);
	        	if(flag==0){//view report on laptop
	        		$("#downloadAttachmentForm").attr("method","post");
	        		$("#downloadAttachmentForm").attr("action","${pageContext.request.contextPath}/partner/report/generatePDFReport");	
	        	}else{
	        		$("#downloadAttachmentForm").attr("method","post");
	        		$("#downloadAttachmentForm").attr("action","${pageContext.request.contextPath}/partner/report/generatePDFReport1");
	        	}
	        	
	        	$('#downloadAttachmentForm').submit();	
        	/* }else{
    			displayMsg('Report not generated');
    		} */
        /* },
		error : function(err){
			displayMsg('Report not generated');
		} */
    //});	

}

function  sendReport(){
	closeDialog();
	if( name.contains("Quick") ){
		report = "Quick Analysis";
	}else if( name.contains("Summarized") ){
		report = "Summarized Analysis";
	}else if( name.contains("Detailed") ){
		report = "Detailed Analysis";
	}else if( name.contains("Client") ){
		report = "Client Action Plan";
	}else{
		report = "Advisor Action Plan";
	}
	
	$("#currentReportName").html("Processing "+name+" Report");
	
	$.ajax({
        type : "POST",
        url : "${pageContext.request.contextPath}/partner/report/sendNotification/${partyId}",
        data : {'reportName' : name},
        success : function(result) {
        	if( result = "success" ){
        		displayMsg(report+' Report send successfully.');
        	}else {
        		displayMsg(report+' Report not send successfully.');
        	}
        },
        error: function(err) {
        	displayMsg(report+' Report not send successfully.');
        }
	});
}

</script>
