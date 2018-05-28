<!DOCTYPE html>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.cp.common.model.ReportRequest"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.DocumentData"%>

<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/diy/basic.css"	type="text/css" />
<script>
<% ReportRequest req = (ReportRequest) request.getAttribute("q"); 
  String name = req.getName();
  UserSession user = AuthHandler.getCurrentUser();
%>
$(document).ready(function(){

    
    $("body").addClass("loading");
	  $("#reportview").attr("src", "${ssrsUrl}&${paramUrl}");
	  $('#reportview').load(function(){
		  $('body').removeClass('loading');
	    });
});


function generateReport(reportName,partyId) {
	
	
	StartDate = $('#from').val();
	opportStatus = $('#opportunityStatusId').val(); 
	EndDate = $('#to').val();

	var reporturl ="${ssrsUrl}&${paramUrl}";
	
	$("#reportview").html("Loading...<br><img src='images/loading.gif' align='middle' >");
	
    $('#reportview').load(reporturl ,function(response, status, xhr) {
    	
      if (status == "error") {
	    var msg = "Sorry but there was an error getting details ! ";
		$("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	  }
    });
    
    currentReportName=reportName;	
}
function setFrameLoaded()
{
   $('body').removeClass('loading');

   if($("#reportview").contents().find(".nodata")>0){
	   alert('Class not found');
   }
}

</script>

<!-- Wrapper starts-->

<%-- <div id="header-strip" class="fl">
    <h3 class="clearfix fl">REPORT: <span class="title_it">${reportTitle}</span></h3>
    <a class="add_docs_back_btn" href="${pageContext.request.contextPath}/report/myReports">Back</a>
    <jsp:include page="../menu.jsp"></jsp:include>
    </div> --%>
    
  <!-- end of "header-strip" id -->
 <!--  <div id="inner-shadow-strip"></div> -->
  <!-- Main starts-->
    <!-- Common_content Starts-->

       
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix" >
              <div class="report_view clearfix">
<%--                      <div id="reportdownloadOptions">
                     <span style="height: 50px;">
				Download Report as:&nbsp;<a class="pdficon" title="Download in Pdf" style="display: inline-block;"   href="${pageContext.request.contextPath}/report/birtreport?ReportFormat=pdf&${paramUrl}"></a>
					 <% String type = (String)request.getAttribute("type"); 
					 	if(type.equalsIgnoreCase("birt")){
					 %><a class="excelicon" title="Download in Excel" style="display: inline-block;" href="${pageContext.request.contextPath}/report/birtreport?ReportFormat=xls&${paramUrl}"></a>
					 <a class="docicon" title="Download in Doc" style="display: inline-block;" href="${pageContext.request.contextPath}/report/birtreport?ReportFormat=doc&${paramUrl}"></a>
					<%} %>	</span>				 
				</div>
 --%>                    <div class="img img2"> 
                    <iframe id="reportview" onload='setFrameLoaded();' height="800px" width="100%"></iframe>  
                    </div>
                    <div class="clr"></div>
        </div>
      </section>
    <div class="clr"></div>
    <!-- Common_content Ends--> 
    
    <div class="modal"><!-- Place at bottom of page --></div>

  <!-- Main ends--> 
