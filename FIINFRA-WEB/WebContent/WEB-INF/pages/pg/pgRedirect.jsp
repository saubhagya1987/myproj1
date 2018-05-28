<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.pg.SubxProductData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.pg.OrderDetailData"%>
<%@page import="in.fiinfra.pg.OrderData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
	<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Payment</title>
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script
	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>


<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
--></head>
<body>
        		
 	<form method="post" id="payOnlineFrm" action="https://pgi.billdesk.com/pgidsk/PGIMerchantPayment" >
                 <input type="hidden" id="msg" name="msg" value="${msg}"/>
    </form>
<script>

$(function() {
	   $('#payOnlineFrm').submit();
});
	
</script>
</body>
</html>