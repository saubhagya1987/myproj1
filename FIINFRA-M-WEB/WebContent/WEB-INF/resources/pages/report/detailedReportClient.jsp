<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.io.File"%>
<c:set var="themeIdTemp" value="${ContactDetails.theme}"/>
<% 
 Integer themeId = (Integer) pageContext.getAttribute("themeIdTemp");
 String colorCode=null;
 String colorCodeLeft=null;
 String imagePath=null;
 if(themeId==92001)
 {     // default magento	
	   colorCode = "#952754";
	   colorCodeLeft = "#a8a8a8";	
	   imagePath="header_pattern_magento.png";
      
 }
 else if(themeId==92002)
 {     // red
	   colorCode = "#ca514e";
	   colorCodeLeft = "#6e6262";
	   imagePath="header_pattern_red.png";
 }else if(themeId==92003)
 {     // blue
	   colorCode = "#1d87bd";
	   colorCodeLeft = "#9cbc01";
	   imagePath="header_pattern_blue.png";
 }
 else if(themeId==92004)
 {     // green
	   colorCode = "#649335";
	   colorCodeLeft = "#368ebc";
	   imagePath="header_pattern_green.png";
 }
 
 Date currentDate = new Date();
 String strDate = new SimpleDateFormat("dd MMM yyyy").format(currentDate);
 
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Action Plan</title>

<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
<style>
/***Custom Fonts Strats***/
@font-face {
 font-family: 'open_sanslight';
 src: url('${pageContext.request.contextPath}/resources/fonts/opensans-light-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/fonts/opensans-light-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/fonts/opensans-light-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/fonts/opensans-light-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/fonts/opensans-light-webfont.svg#open_sanslight') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
font-family:"Aller Bold";
src:url("${pageContext.request.contextPath}/resources/fonts/Aller_Bd.eot?") format("eot"), url("${pageContext.request.contextPath}/resources/fonts/Aller_Bd.woff") format("woff"), url("${pageContext.request.contextPath}/resources/fonts/Aller_Bd.ttf") format("truetype"), url("${pageContext.request.contextPath}/resources/fonts/Aller_Bd.svg#Aller-Bold") format("svg");
font-weight:normal;
font-style:normal;
}
 @font-face {
 font-family: 'allerregular';
 src: url('${pageContext.request.contextPath}/resources/fonts/aller_rg-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/fonts/aller_rg-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/fonts/aller_rg-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/fonts/aller_rg-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/fonts/aller_rg-webfont.svg#allerregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'alleritalic';
 src: url('${pageContext.request.contextPath}/resources/fonts/aller_it-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/fonts/aller_it-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/fonts/aller_it-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/fonts/aller_it-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/fonts/aller_it-webfont.svg#alleritalic') format('svg');
 font-weight: normal;
 font-style: normal;
}
 @font-face {
 font-family: 'open_sansregular';
 src: url('${pageContext.request.contextPath}/resources/fonts/opensans-regular-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/fonts/opensans-regular-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/fonts/opensans-regular-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/fonts/opensans-regular-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/fonts/opensans-regular-webfont.svg#open_sansregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'open_sansbold';
 src: url('${pageContext.request.contextPath}/resources/fonts/opensans-bold-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/fonts/opensans-bold-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/fonts/opensans-bold-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/fonts/opensans-bold-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/fonts/opensans-bold-webfont.svg#open_sansbold') format('svg');
 font-weight: normal;
 font-style: normal;
}
/***Custom Fonts Ends***/
/***Common Css Starts***/
/* Basic Css Strats*/
/****************************************************************************************************

* Filename: basic.css

****************************************************************************************************/

/* GLOBAL RESET 

**********************************************************/

body, h1, h2, h3, h4, h5, h6, p { margin:0; line-height:1 }
input[type="radio"], input[type="checkbox"] { margin:0; vertical-align:-2px }
a:link, a:active, a:visited { text-decoration:none }
a:active, a:focus, textarea:focus, input:focus { outline: none }
textarea { overflow:auto; resize:none }
img { border:none }
table { border-collapse:collapse; border-spacing:0; table-layout:fixed }
/* INDIVIDUAL RESETs

**********************************************************/

.reset { list-style:none; padding:0; margin:0 }
.nomargin { margin:0 }
.nopadding { padding:0!important }
/* ALIGN CENTER

**********************************************************/

.equalgap { margin:0 auto }
/* FLOATS

**********************************************************/

.fl { float:left }
.fr { float:right }
.fn { float:none }
/* CLEAR FLOAT

**********************************************************/

.clearfix:after { content:"\0020"; display:block; height:0; clear:both; visibility:hidden; overflow:hidden }
.clr { clear:both; overflow:hidden; height:0 }
/* WIDTH 100% 

**********************************************************/

.fullwid { width:100% }
/* DISPLAYs, POSITIONs & OVERFLOWs 

**********************************************************/

.inline { display:inline }
.ovfl-hidden { overflow:hidden }
.rel { position:relative }
.absolute { position:absolute }
.absoluted > * { position:absolute }
.inlineBlock { display:inline-block }
.hide-elem { display:none !important }
/* ALL TEXT CSS

**********************************************************/

/* font SIZES */

.vsmlTxt { font-size:10px }
.smlTxt { font-size:11px }
.paraTxt { font-size:12px }
.bigTxt { font-size:14px }
/*font WEIGHTS */

.strong { font-weight:bold }
.normTxt { font-weight:normal }
/* text TRANSFORMS */

.allCaps { text-transform:capitalize }
.upperCase { text-transform:uppercase }
.underlined { text-decoration:underline }
/* text ALIGN & content ALIGN for inline level ELEMENTS */

.centerAll { text-align:center }
.leftAlign { text-align:left }
.rightAlign { text-align:right }
.justified { text-align:justify }
/* Basic Css Ends */
.wrapper1{ width:792px; margin:0 auto;  color:#3a3a3a; font-family:'allerregular';height:1124px; }
.wrapper1 .verticle_side{height:60px; width:1124px; background-color:#3a3a3a; position:absolute; top:482px; margin: 0px 0px 0px -533px;z-index:5; -webkit-transform: rotate(270deg);-moz-transform: rotate(270deg); -o-transform: rotate(270deg);}
.wrapper1 .verticle_side p.verticle{ font-family: "Aller Bold"; font-size:24px; color:#fff; text-align: center;line-height: 60px; /*-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg); -o-transform: rotate(270deg);*/}
.header1 { height:65px; background:<%=colorCode %> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size:754px auto;}
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0 38px; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
 .content_dr { /* height:1041px */ }
.footer { height:18px; background:#c0c0c0;margin-top: 100px; }
.page_heading { color:#FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 388px; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode %>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center;line-height: 50px; }
/*.theme_color { color: <%=colorCode %>; }*/
/***Common Css Ends***/
/***Financial Planning Summary Starts***/
.head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 47px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;color:<%=colorCode%>;margin-left: 60px; }
#financial_planning_summary_content .ifa_details { height:310px; padding:0 35px; }
#financial_planning_summary_content .ifa_details .add_details { margin:44px 0 0 50px;; width:38% }
#financial_planning_summary_content .ifa_details .name { font-family: "Aller Bold"; font-size: 23px; margin: 0 0 3px 0; }
#financial_planning_summary_content .ifa_details .address { width:300px; font-size: 17px; line-height: 21px; }
#financial_planning_summary_content .ifa_details .logo { margin:24px 0 0; width:48%; text-align: right }
#financial_planning_summary_content .client_details { height:320px;}
#financial_planning_summary_content .client_details .name { color: <%=colorCode %>; font-family: "Aller Bold"; font-size: 32px; margin: 0 0 0 90px; padding: 15px 0 0; }
#financial_planning_summary_content .client_details .category { height:74px; width:74px; border:2px solid <%=colorCode %>; -moz-border-radius: 69px; -webkit-border-radius: 69px; border-radius: 69px;-moz-box-shadow: 0px 0px 4px 2px #9F9F9F;-webkit-box-shadow: 0px 0px 4px 2px #9F9F9F;box-shadow: 0px 0px 4px 2px #9F9F9F; }
#financial_planning_summary_content .client_details .grid_adjuster { margin-left:-30px }
#financial_planning_summary_content .client_details .category_ul { margin:50px 0 0 35px; }
#financial_planning_summary_content .client_details .category_ul li { margin-left:79px }
#financial_planning_summary_content .client_details .category_ul .cat_name { font-family: "Aller Bold"; font-size: 12px; width: 100%; text-align: center; margin: 20px 0 0;height: 19px; }
#financial_planning_summary_content .client_details .category_ul .value{margin: 20px 0 0;}
#financial_planning_summary_content .client_details .category_ul .value span{border-bottom: 1px dashed <%=colorCode %>;padding: 0 10px;font-family: "Aller Bold"; font-size: 22px;}
#financial_planning_summary_content .client_details .category_ul .first .category{ background:url(${pageContext.request.contextPath}/resources/images/Goals.png) no-repeat center center #fff}
#financial_planning_summary_content .client_details .category_ul .second .category{ background:url(${pageContext.request.contextPath}/resources/images/emergency.png) no-repeat center center #fff}
#financial_planning_summary_content .client_details .category_ul .third .category{ background: url(${pageContext.request.contextPath}/resources/images/risk.png) no-repeat center center #fff}
#financial_planning_summary_content .client_details .category_ul .fourth .category{ background: url(${pageContext.request.contextPath}/resources/images/succession.png) no-repeat center center #fff}
#financial_planning_summary_content .client_details .category_ul .five .category{ background: url(${pageContext.request.contextPath}/resources/images/retirement.png) no-repeat center center #fff}
#financial_planning_summary_content .disclaimer{height: 351px; margin:0 0 0 90px}
#financial_planning_summary_content .disclaimer .heading{ color:<%=colorCode %>;font-family: "Aller Bold"; font-size: 15px; margin:0 0 24px}
#financial_planning_summary_content .disclaimer .txt{font-size: 15px;height: 325px; line-height:19px;text-align: justify;}
#financial_planning_summary_content .disclaimer .btm_logo{ background:url(${pageContext.request.contextPath}/resources/images/btm_logo.png) no-repeat center center;width:194px;height:35px}

#financial_planning_summary_content .disclaimer .btm_logo1{ background:url(${pageContext.request.contextPath}/resources/images/fiinfra-logo.png) no-repeat center center;width:140px;height:35px}

/***Financial Planning Summary Ends***/
</style>
<!-- ProductWiseGoals.jsp -->

</head>

<body>
<div class="wrapper1 clearfix">
	<div class="verticle_side">
    	<p class="verticle">Action Plan For ${ContactDetails.name} made on <%=strDate%></p>
    </div>
  <div class="header1 clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt1">Steps to financial freedom</h2>
    </div>
    <h1 class="page_heading fr">Financial Planning Summary</h1>
  </div>
  <div class="content_dr" id="financial_planning_summary_content">
    <div class="box1 ifa_details clearfix">
      <div class="add_details fl">
     
        <h4 class="name"> ${ContactDetails.ownerName}</h4>
        <c:set var="addressList" value="${fn:split(ContactDetails.address, '_')}" />
        <p class="address"> ${addressList[0]}<br>${addressList[1]}<br>${addressList[2]}</p>
      </div>
       <c:set var="photoPath" value="${ContactDetails.logoPath}"/>
      <%-- PhotoPath <c:out value="${photoPath}"/> --%>
      <div class="fr logo">
      	<%-- <img src="${pageContext.request.contextPath}/resources/images/ifa_logo.png"/> --%> 
      	<%
      	String photoPath1=(String) pageContext.getAttribute("photoPath");
		String x = "D:/Ffreedom-DI/images/"+photoPath1;
		File file = new File(x);
		%>
		<%-- <c:out value="<%=x %>"></c:out> --%>
		<% if (file.exists() && !file.isDirectory()) { %> 
			<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath1%>" style="-webkit-transform: scale(0.8,0.5);-ms-transform:scale(0.8,0.5);transform:scale(0.8,0.5);margin-top: -42px;height: 216px;width: 224px;" alt="Advisor Logo"/></a>
	   <% } else { %>
	   		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" style="-webkit-transform: scale(0.8,0.5);-ms-transform:scale(0.8,0.5);transform:scale(0.8,0.5);margin-top: -42px;height: 216px;width: 224px;;" alt="Advisor Logo" /></a>
	    <% } %>
	  </div>
    </div>
    <div class="box2 client_details">
      <h4 class="name"><span class="c_name">${ContactDetails.name}</span> :</h4>
      <div class="grid_adjuster">
        <ul class="reset clearfix category_ul">
          <li class="first fl">
            <div class="category"></div>
            <div class="cat_name">Goals</div>
            <!--div class="theme_color value centerAll"><span>7</span></div-->
          </li>
          <li class="second fl">
            <div class="category"></div>
            <div class="cat_name">Emergency</div>
             <!--div class="theme_color value centerAll"><span>35</span>lacs</div-->
          </li>
          <li class="third fl">
            <div class="category"></div>
            <div class="cat_name">Risk</div>
             <!--div class="theme_color value centerAll"><span>10</span>lacs</div-->
          </li>
          <li class="fourth fl">
            <div class="category"></div>
            <div class="cat_name">Succession</div>
             <!--div class="theme_color value centerAll"><span>5</span></div-->
          </li>
          <li class="five fl">
            <div class="category"></div>
            <div class="cat_name">Retirement</div>
             <!--div class="theme_color value centerAll"><span>5</span></div-->
          </li>
        </ul>
      </div>
    </div>
    <div class="box3 disclaimer">
    <h4 class="heading">Disclaimer</h4>
    

<p class="txt">This document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FIINFRA. This document is based entirely on the information provided by you or your Distributor. Despite our best efforts, due care and precautions, there may be some variables used in generation of this document which have not been unaccounted for, or miscalculated, by the Platform. FIINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, your Distributor or any third party if the contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or incorrectly. The contents of this document do not qualify as investment advice and/or financial planning, or any variant thereof, under India's applicable regulatory framework, including the Securities and Exchange Board of India (Investment Adviser) Regulations, 2013, as amended from time to time, and FIINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be avoided, whether directly, indirectly, incidentally or consequentially, by you or your Distributor or any third party, by relying upon this document, or any content therein. Investments are subject to a variety of risks, uncertainties and other factors that could cause actual results to differ materially from expectations as expressed or implied under this document.</p>
<!--<div class="btm_logo fr"></div> -->
  <div class="btm_logo1 fl"></div>
  
  <div class="clr"></div>
    </div>
  </div>
  <c:set var="pageCnt" value="1"/>
  <div class="footer clearfix" style="margin-top: 80px;">
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  </div>
</div>
<br/>
<div style="page-break-before:always"></div>
<c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
<br>
 <jsp:include page="../report/ProductWiseGoalsReport.jsp"></jsp:include>
 <br> 
 <jsp:include page="../report/goalwiseSummaryChartReport.jsp"></jsp:include>
 <br>
 <jsp:include page="../report/emergencyAndRiskPlanningReport.jsp"></jsp:include>
 <br>
 <jsp:include page="../report/successionPlanningReport.jsp"></jsp:include>
</body>
</html>
