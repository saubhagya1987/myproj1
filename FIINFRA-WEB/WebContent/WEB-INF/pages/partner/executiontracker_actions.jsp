<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actions</title>
</head>
<body>
 <!-- center -->
  	<div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:0px;  padding-left:10px;">
            <div class="list-group">
        		<a class="list-group-item active" href="#">Action</a>
                <a id="proposedInvestment" href="<%=request.getContextPath() %>/et/executionDetails.htm?fpActionPlanId=${param.fpActionPlanId}" class="list-group-item">
                Proposed Investment for execution </a>  	
       			<a id="prePrintedForm" class="list-group-item" href="<%=request.getContextPath() %>/et/openEtForm.htm?fpActionPlanId=${param.fpActionPlanId}">Preprinted Form</a> 
                <a id="cancelExecution" class="list-group-item" href="<%=request.getContextPath() %>/et/getExecutionStatus.htm?fpActionPlanId=${param.fpActionPlanId}">Cancel Execution </a> 
<!--                 <a href="executiontracker_updatetransaction.html" class="disabled list-group-item">Update Transaction</a> -->
                <a id="documents" class="list-group-item "  href="<%=request.getContextPath() %>/et/etDocs.htm?fpActionPlanId=${param.fpActionPlanId}" > Documents </a>  
                <a id="notes" class="list-group-item"  href="<%=request.getContextPath() %>/et/etNotes.htm?fpActionPlanId=${param.fpActionPlanId}">Notes</a>
                <a id="trackingHistory" class="list-group-item" href="<%=request.getContextPath() %>/et/etTrackingHistory.htm?fpActionPlanId=${param.fpActionPlanId}" >Tracking History</a>
            </div>
         </div>
			
 <!-- center -->
</body>
</html>