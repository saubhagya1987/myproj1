<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px; padding-left:10px;" >
            <div class="list-group">

        		<a class="list-group-item active" >Pings</a>
                <a href="<%=request.getContextPath()%>/ping/getPings.htm" class="list-group-item" id="pingLibraryManagerLink">Ping Library Manager </a>
              	<a href="<%=request.getContextPath()%>/ping/getTagsList.htm" class="list-group-item" id="pingTagListLink">Tags List</a>  	
                <a class="list-group-item" href="<%=request.getContextPath()%>/ping/getScheduledPings.htm" id="pingViewScheduledPingLink">View Scheduled Pings</a>
                <a class="list-group-item" href="<%=request.getContextPath()%>/ping/getDNDList.htm" id="pingDNDListLink">DND List</a>
				 <a class="list-group-item" href="<%=request.getContextPath()%>/loadreportPingDelivery.htm" id="pingDeliveryReportLink">Ping Delivery Report </a> 
				 <a class="list-group-item" href="<%=request.getContextPath()%>/loadPingMISReport.htm" id="pingMISReportLink">Ping MIS Report </a>  
                <a class="list-group-item" href="<%=request.getContextPath()%>/loadPingDNDList.htm" id="pingDNDReportLink">DND List Report</a>
                 <a class="list-group-item" href="<%=request.getContextPath()%>/ping/getAutoPingEvent.htm" id="PPAutoPingEventListLink">Auto Ping Events</a>
                
            </div>
           
        </div>
   <script>
   	$(function() {
   		showSelectedTab('pingLink');
	})
   </script>
</body>
</html>