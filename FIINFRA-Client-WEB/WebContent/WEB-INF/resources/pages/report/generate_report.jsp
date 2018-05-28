<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<style>
	#page_loader{
		background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
	}
</style>
<!-- custom scroll to "common_in_content" -->
<!-- Wrapper starts-->
<div class="" id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
    
    <!-- Header Ends--> 
    <!-- Common_content Starts-->
    <c:set var="pieces" value="${fn:split(headerName, '(')}"/>
    <section class="content common_content">
     	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix">
      <div id="page_loader" style="display:none;"></div>
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
                <div class="fl"><span class="txt_one">Generate Action Plan for</span> <span class="txt_two">${advisorName}</span> <span class="txt_three">(Advisor)</span></div>
                <div class="fr">
                <c:choose>
                	<c:when test="${party.flag eq 1}">
	                  <input type="submit" class="submit_btn" value="Generate">
	                 </c:when>
	                 <c:otherwise>
	                 	<input type="submit" class="submit_btn inactiveLink" value="Generate">
	                 </c:otherwise>
                </c:choose>             
                </div>
                <div class="clr"></div>
              </li>
            </ul>
          </div>
          <h2 class="heading clearfix">
            <div class="title_one fl">For ${pieces[0]} (${pieces[1]}</div>
            <div class="fl">For ${advisorName} (Advisor)</div>
          </h2>
          <div class="description_down">
            <div class="left fl">
             <c:if test="${not empty (party.reserved1DocumentDateTime)}">
             	<span class="genrated_lbl">Generated On :</span>
             </c:if>             
              <div class="list_bx clearfix">
                <div class="title clearfix">Quick</div>
                <c:choose>
                   		<c:when test="${not empty party.reserved1DocumentDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                <a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisA/${partyId}');">
                 <div class="img clearfix"> </div>
                </a>
                 <div class="icon_bx">${party.reserved1DocumentDateTime}</div>
                   <div class="icon_bx">                   
                  <div class="preview"><a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisA/${partyId}');"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  <div class="tp clearfix"> <a href="#" class="${inactiveFlag}"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>
              </div>
              <div class="list_bx clearfix">
                <div class="title clearfix">Summarized</div>
                <c:choose>
                   		<c:when test="${not empty party.reserved2DocumentDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                  <a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisB/${partyId}');">
                 <div class="img clearfix"> </div>
                </a>
                <div class="icon_bx">${party.reserved2DocumentDateTime}</div>
                <div class="icon_bx">
                  <div class="preview"><a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisB/${partyId}');"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  <div class="tp clearfix"> <a href="#" class="${inactiveFlag}"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>
                <div class="clr"></div>
              </div>
              <div class="list_bx clearfix">
                <div class="title clearfix">Detailed</div>
                <c:choose>
                   		<c:when test="${not empty party.reserved3DocumentDateTime}">
                   			<c:set var="inactiveFlag" value=""/>
                   		</c:when>
                   		<c:otherwise>
                   			<c:set var="inactiveFlag" value="inactiveLink"/>
                   		</c:otherwise>
                   </c:choose>
                  <a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisC/${partyId}');">
                 <div class="img clearfix"> </div>
                </a>
                 <div class="icon_bx">${party.reserved3DocumentDateTime}</div>
                 <div class="icon_bx">
                  <div class="preview"><a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisC/${partyId}');"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  <div class="tp clearfix"> <a href="#" class="${inactiveFlag}"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
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
                  <a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisClient/${partyId}');">
                  <div class="action_plan_img clearfix"> </div>
                 </a>
                   <div class="icon_bx">${party.clientActionPlanDateTime}</div>
                   <div class="icon_bx">
                  <div class="preview"><a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisClient/${partyId}');"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  <div class="tp clearfix"> <a href="#" class="${inactiveFlag}"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div>
                <div class="clr"></div>
              </div>
              <div class="clr"></div>
            </div>
            <div class="right fl">
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
                  <a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisAdvisor/${partyId}');">
                  <div class="action_plan_img clearfix"> </div>
                 </a>
                 <div class="icon_bx">${party.advisorActionPlanDateTime}</div>
                  <div class="icon_bx">
                  <div class="preview"><a href="#" class="${inactiveFlag}" onclick="showReport('${pageContext.request.contextPath}/partner/report/checkReport/analysisAdvisor/${partyId}');"><img src="${pageContext.request.contextPath}/resources/images/view_grey.png" width="30" height="17" alt=""><span>View</span></a></div>
                  <div class="tp clearfix"> <a href="#" class="${inactiveFlag}"><img src="${pageContext.request.contextPath}/resources/images/mail_grey.png" alt=""> <br/>
                    <span class="tp_txt">Mail</span></a></div>
                  <div class="clr"></div>
                </div> 
                <div class="clr"></div>
              </div>
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
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
  	<c:set value="${sessionScope.userSession}" var="sessionObject"></c:set>
  	<c:set value="${sessionScope.headerName}" var="headerName"></c:set>
  <div id="video_first_dialogA" class="common_custom_modal video_first_dialog">
  <h3 class="modal_heading">Analysis Report - Quick<span class="close">X</span></h3>
        <div class="viewReports">
		<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisA/${partyId}" allowfullscreen></iframe>
		</div>
   </div>
   <div id="video_first_dialogB" class="common_custom_modal video_first_dialog">
  <h3 class="modal_heading">Analysis Report - Summarized<span class="close">X</span></h3>
        <div class="viewReports">
		<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisB/${partyId}" allowfullscreen></iframe>
		</div>
   </div>
   <div id="video_first_dialogC" class="common_custom_modal video_first_dialog">
  <h3 class="modal_heading">Analysis Report - Detailed<span class="close">X</span></h3>
        <div class="viewReports">
		<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisC/${partyId}" allowfullscreen></iframe>
		</div>
   </div>
   <div id="video_first_dialog4" class="common_custom_modal video_first_dialog">
  <h3 class="modal_heading">Action Plan<span class="close">X</span></h3>
        <div class="viewReports">
		<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisClient/${partyId}" allowfullscreen></iframe>
		</div>
   </div>
   <div id="video_first_dialog5" class="common_custom_modal video_first_dialog">
  <h3 class="modal_heading">Action Plan<span class="close">X</span></h3>
        <div class="viewReports">
		<iframe height="100%" width="100%"  src="${pageContext.request.contextPath}/partner/report/generatePDFReport/analysisAdvisor/${partyId}" allowfullscreen></iframe>
		</div>
   </div>
</div>
<!-- Wrapper ends-->
<script>

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

$(document).ready(function(){
    $('.wrapper').addClass("genrate_report_wrapper"); 
    $('.generate_report_in').slimScroll();
	$("select").selectBoxIt();	
	
	$(".common_custom_modal .close").click(function(){
		$(".overlay").fadeOut("slow");
		$ (".common_custom_modal iframe").animate("slow").css("display","none");
		$(".common_custom_modal").animate("slow").css("visibility","hidden");
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
  
var contextPath="${baseUrl}";
var createUrl =	contextPath+'/FIINFRA-WEB/dc/submitDcInput1.htm?';	
createUrl = createUrl + 'userName=${sessionObject.name}&dcInputPartyId=${partyId}&buId=${sessionObject.buId}&partyId=${sessionObject.partyId}&createdBy=${sessionObject.userId}&roleId=${sessionObject.roleId}&opportunityName=${headerName}&TOKEN=abc&USER_NAME=shubhchintak',

	$(".submit_btn").click(function() {
		
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/A",	        
	        success : function(result) {
				createDetailedReport();
	        },
			error : function(err){
 				createDetailedReport();
			}
        });
		
		/* $.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/B",	        
	        success : function(result) {
// 	        	alert(result);
	        },
			error : function(err){
// 				alert(err);
			}
        }); */
				
        //alert('at end');
        
	});
	
function createDetailedReport(){
	var contextPath="${baseUrl}";
	$.ajax({
        type : "POST",
        url : createUrl,
        data :  $('form').serialize(), 
        success : function(result) {
        	var new_window = window.open(contextPath+'/FIINFRA-WEB/dc/showAnalysisReportPDF1.htm?dcInputPartyId=${partyId}&TOKEN=abc&USER_NAME=shubhchintak');
        	new_window.onbeforeunload = function(){ 
        		window.location.reload(true);
        	};        	
        },
		error : function(err){
			//alert(err);
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
//				alert(err);
		}
    });
	

	$(".video_first_dialog .close").click(function(){
		$(".overlay").fadeOut("slow");
		$ (".video_first_dialog iframe").animate("slow").css("display","none");
		$(".video_first_dialog").animate("slow").css("visibility","hidden");
		});
});
function showReport(url){
	$.ajax({
        type : "GET",
        url : url,	        
        success : function(result) {
	        	if(result == 'file found'){
	        		if(url.indexOf("analysisAdvisor") >= 0){
	        			 $(".overlay").fadeIn();
		        		 $("#video_first_dialog5").animate("slow").css("visibility","visible");
		        		 $("#video_first_dialog5").animate("slow").css("display","block");
		        		 $("#video_first_dialog5 iframe").animate("slow").css("display","block");
	        	}else if (url.indexOf("analysisA") >= 0){
	        			//alert('clicked');
	        		 $(".overlay").fadeIn();
	        		 $("#video_first_dialogA").animate("slow").css("visibility","visible");
	        		 $("#video_first_dialogA").animate("slow").css("display","block");
	        		 $("#video_first_dialogA iframe").animate("slow").css("display","block");
	        		}else if(url.indexOf("analysisB") >= 0){
	        			 $(".overlay").fadeIn();
		        		 $("#video_first_dialogB").animate("slow").css("visibility","visible");
		        		 $("#video_first_dialogB").animate("slow").css("display","block");
		        		 $("#video_first_dialogB iframe").animate("slow").css("display","block");
	        		}else if(url.indexOf("analysisClient") >= 0){
	        			 $(".overlay").fadeIn();
		        		 $("#video_first_dialog4").animate("slow").css("visibility","visible");
		        		 $("#video_first_dialog4").animate("slow").css("display","block");
		        		 $("#video_first_dialog4 iframe").animate("slow").css("display","block");
	        		}else if(url.indexOf("analysisC") >= 0){
	        			 $(".overlay").fadeIn();
		        		 $("#video_first_dialogC").animate("slow").css("visibility","visible");
		        		 $("#video_first_dialogC").animate("slow").css("display","block");
		        		 $("#video_first_dialogC iframe").animate("slow").css("display","block");
	        		}else{
	        		displayMsg('Report not generated');
	        	}
        }
        }    	,
		error : function(err){
//				alert(err);
		}
    });
}

</script>