<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>


<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Reports</title>
<style type="text/css">
   html, body, div, iframe { margin:0; padding:0; height:100%; }
   iframe { position:fixed; display:block; width:100%; border:none; }
</style>


</head>
<body>
<div id="gen2"></div>
<input type="hidden" id="urlreport" value="${url}">


<%-- <jsp:include page="../common/header.jsp" /> --%>
<input id="contextPath" type="hidden" name="contextPath"
  value="<%=request.getContextPath()%>" />
  
  
  <input  type="hidden" id="contextReportUrl"  >
<div class="container">

</div>

<!-- <footer> -->
<%--   <jsp:include page="../common/footer.jsp" /> --%>
<!--  </footer> -->
	<!-- Center part End -->

	

	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> 
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>

	<script type="text/javascript">
	  $(document).ready(function(){
          $.ajax({
                 type :'GET',
              url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
                 success : function(result){
                        $('#contextReportUrl').val(result);
                        var urlReport= $('#urlreport').val();
              		    urlReport=decodeURIComponent(urlReport); 
                        var reportLink= $('#contextReportUrl').val(); 
              		    var url = reportLink + urlReport;
              					  var reportview2 = "<iframe src="+url+"></iframe>";
              					 $("#gen2").html(reportview2);
            }
            });
          change_my_url();
    	});
	 
     
    	 
       
</script>  

<script type="text/javascript">

var stateObj = { foo: "bar" };
function change_my_url()
{
   history.pushState(stateObj, "page 2", "report.html");
}


</script>
</body>
</html>