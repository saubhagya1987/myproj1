<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.util.AppConstant"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% String cdn = AppConstant.cdn;
   if(StringUtils.isEmpty(cdn)){
    cdn = request.getContextPath();
   }
//request.setAttribute("_cdn", cdn);
request.setAttribute("_cdn", request.getContextPath().subSequence(0, request.getContextPath().lastIndexOf("/"))+"/FIINFRA-Welcome/resources");
%>



<!-- $("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	}); -->

<!--[if !IE]> -->
  <script type="text/javascript">
   window.jQuery || document.write("<script src='${_cdn}/assets/js/jquery.js'>"+"<"+"/script>");
  </script>

  <!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${_cdn}/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->

<!-- bootstrap & fontawesome -->
<%-- <link rel="stylesheet" href="${_cdn}/assets/css/bootstrap.min.css" /> --%>
<%-- <link rel="stylesheet" href="${_cdn}/assets/css/jquery-ui.custom.css" /> --%>
<%-- <link rel="stylesheet" href="${_cdn}/assets/css/jquery-ui.min.css" /> --%>
<%-- <link rel="stylesheet" href="${_cdn}/assets/css/font-awesome.min.css" /> --%>
<%-- <link rel="stylesheet" href="${_cdn}/assets/css/ui.jqgrid.css" /> --%>
<%-- <link rel="stylesheet" href="${_cdn}/assets/css/chosen.css" /> --%>

<!-- page specific plugin styles -->

<!-- text fonts -->

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/fpt-custom.css" />


<!--[if lte IE 9]>
   <link rel="stylesheet" href="${_cdn}/assets/css/ace-part2.css" class="ace-main-stylesheet" />
  <![endif]-->

<!--[if lte IE 9]>
    <link rel="stylesheet" href="${_cdn}/assets/css/ace-ie.css" />
  <![endif]-->
<link rel="stylesheet" href="${_cdn}/assets/css/custom.css"/>



<link rel="stylesheet" href="${_cdn}/assets/css/fpt_custom.css"/>
<link rel="stylesheet" href="${_cdn}/assets/css/custom_responsive.css">

<link rel="shortcut icon" href="${_cdn}/assets/images/common-images/favicon.ico" />

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/basic.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/jquery-ui.css" /> 

<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/common-css/main.css" />
<link type="text/css" rel="stylesheet" href="${_cdn}/assets/css/chosen.css" />


<!-- ace settings handler -->
<script src=" ${_cdn}/assets/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
  <script src=" ${_cdn}/assets/js/html5shiv.js"></script>
  <script src=" ${_cdn}/assets/js/respond.js"></script>
  <![endif]-->
  
  
  <script>
  $(function(){
	  //alert('${_cdn}')
  })
  </script>
  <input type="hidden" value="${_cdn}" id="cdnPath">
  
  <jsp:include page="../common/header.jsp" />
  
  