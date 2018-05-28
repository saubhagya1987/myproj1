<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Delivery History</title>
</head>
<script type="text/javascript">


function getXLS()
{
	var notifyTemplateId=$('#notifyTemplateId').val();
	
		window.location.href = $('#contextPath').val()+"/ping/getDelivaryHistoryXLS.htm?notifyTemplateId="+notifyTemplateId;
}
function getCSV()
{
		window.location.href = $('#contextPath').val()+"/ping/getDelivaryHistoryCSV.htm?notifyTemplateId="+$('#notifyTemplateId').val();
}

</script>
<body>
<%
String notifyTemplateId; 
try{ 
	notifyTemplateId=request.getParameter("notifyTemplateId"); 
 if(notifyTemplateId!="" ){ 
	%>
<input type="hidden" id="notifyTemplateId" name="notifyTemplateId" value="<%=notifyTemplateId%>">
<%
 } 
  }catch(Exception e){ 
	%>
<input type="hidden" id="notifyTemplateId" value="0">
<%
  } 
 %>
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        <!--css popup window start 1-->
        <input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />
        <section>
        <div class="">
          <div class="page-header">
            <h1>Delivery History</h1> 
          </div>
          <div class="container-body"> 
            <!--center -->
            
            <div class="table-responsive" id="display_table_lead" style="border:none;">
              <div id="toreload">
                <display:table name="reciepientData" uid="objPortalUser" class="table table-hover table-bordered table-striped"
	requestURI="#" sort="list" pagesize="10" id="data">
                  <display:column property="recipientName"
			style="" title="Recipient Name" sortable="true"></display:column>
                  <display:column property="scheduledBy"
			style="" title="Scheduled By" sortable="true"></display:column>
                  <display:column property="scheduledOn"
			style="" title="Scheduled on" sortable="true"></display:column>
                  <display:column property="scheduleMinute"
			style="" title="Delivered On" sortable="true"></display:column>
                  <display:column property="pingCount"
			style="" title="Ping Count" sortable="true"></display:column>
                </display:table>
              </div>
            </div>
            <div class="col-xs-pull-9">
              <div class="topmenuleft">
                <div  class="customDropdown"> <span >Page Size:</span>&nbsp;
                  <select  type="button" name="pageSize" id="page" value="10">
                    <option selected="selected" value="10">10</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="100">100&nbsp;</option>
                  </select>
                </div>
              </div>
              <div class="topmenuleft">
                <ul class="list-unstyled clearfix">
                  <li class="pull-left eastspace2"> Export options: </li>
                  <li class="pull-left eastspace2"> <a onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa icon-csv bigger-150"></i></a></li>
                  <li class="pull-left eastspace2"><a onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-150"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      </section>
      <!-- Center part End -->
      
      <jsp:include page="../common/footer.jsp" />
</body>
</html>
