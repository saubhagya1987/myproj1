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
        		<a id="loadAvailablePrePrintedForms" class="list-group-item" href="<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}">Preprinted Form List</a> 
        		<a id="loadPrePrintedFormToGenerate" class="list-group-item" href="<%=request.getContextPath()%>/et/loadPrePrintedFormToGenerate.htm?fpActionPlanId=0">Generate Preprinted Form</a>

            </div>
         </div>
			
 <!-- center -->
</body>
</html>