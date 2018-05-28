<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>




</head>
Testing commit
<body>
    <form:form action="${pageContext.request.contextPath}/profile/dashboard"
			commandName="query" method="POST" 
			id="query-form">
	<label class="form_label">Please Enter User Name/Token</label>			
      <input type="text" name="token" value="" />
      <input type="submit" value ="Submit"/>
</form:form>

</body> 
</html>
