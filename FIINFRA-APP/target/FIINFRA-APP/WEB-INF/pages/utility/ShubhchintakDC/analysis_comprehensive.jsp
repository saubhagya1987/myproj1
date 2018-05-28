<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="themeIdTemp" value="${output.themeId}"/>
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
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Analysis Report</title>
<link type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet" />
<!-- ***************** ACE Theme Form Element *********************-->
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace/bootstrap.css" />
        
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace/jquery-ui.custom.css" />
		<!-- text fonts -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace/ace-fonts.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ace/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		
		<style>
			/**UI Slider**/
			.scale_range{width: 100%;position: relative;height: 22px;}
			.scale_range .extrem{position: absolute;}
			.scale_range .low{ left:0}
			.scale_range .high{right:0}
			/**UI Slider**/
		</style>


<!-- ***************** ACE Theme Form Element *********************-->




<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>

<style>


/* GLOBAL RESET 

**********************************************************/

body, h1, h2, h3, h4, h5, h6, p { margin:0; line-height:1 }
body {font-family:sans-serif !important;}
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
.margin_li{margin:0px 10px !important;}
.margin_top{margin-top:-20px !important;}
.margin_lr{margin:0px 2px !important;}
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
/* Basic Css Ends*/
.wrapper { width:792px; margin:0 auto; height:1124px; color:#3a3a3a; font-family:sans-serif !important; }
.header { height:65px; background:#1d87bd url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; margin-top:0px !important;  background-size: 792px auto; background-size: 792px auto; }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { height:1041px }
.footer1 { height:18px; background:#c0c0c0;font-size:12px; font-family: "Aller Bold"; line-height: 19px;margin:-26px 0px 0px 0px;}
.footer1 .footer_tagline { margin:0 0 0 22px; }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }

.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode%>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
.theme_color { color: <%=colorCode%>; }

.ui-slider .ui-slider-handle{border-radius:5px !important;}
.ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after{border:none !important;}


/***Common Css Ends***/
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0px 0px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:10px }
#emergency-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; position:relative;margin-left: 5px;display: inline-block; }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0px;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table2{width:750px; margin:10px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table2 li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .table2 ul{margin-left: 0px; margin-top:5px;padding:0px 0px 0px 41px;}

.wrapper .table2 .table-header2{width:100%; height:30px;background-color: <%=colorCode%>;}

.wrapper .table2 .table-header2 li.one{line-height:20px; font-size:20px;color:#FFF;}
.wrapper .table2 .table-header2 li.two{line-height:15px; width:130px; margin-left:32px;}


.wrapper .table2 .rows{margin-top:10px;margin-left:2.5px; border-bottom:1px solid #ccc;}
.wrapper .table2 .rows ul li.one{width: 560px !important; margin: 0px 0px 0px 0px; color:#646464;}
.wrapper .table2 .rows ul li.two{width: 130px !important; margin: 0px 0px 0px 14px; color:#646464; text-align:center;}


.analysis_report_comp .heading1{margin: 10px 0 0 0;line-height: 24px;text-align: left;font-size: 20px;color: #FFF;font-family: "Aller Bold";width: 393px;text-shadow: 1px 2px 1px #0B2B3C;}
#emergency-planning .disclaimer { height:330px; padding:0 20px }
#emergency-planning .disclaimer .heading {font-family: "Aller Bold"; font-size: 12px; margin:0 0 10px }
#emergency-planning .disclaimer .txt { font-size:9px; height:190px; line-height:19px; text-align: justify; }
#emergency-planning .disclaimer .btm_logo { background:url(${pageContext.request.contextPath}/images/diyimages/finfra-logo-small.png) no-repeat center center; width:76px; height:20px }

#emergency-planning .client_details .category { height:105px; width:105px; border:2px solid <%=colorCode%>; -moz-border-radius: 69px; -webkit-border-radius: 69px; border-radius: 69px; -moz-box-shadow: 0px 0px 4px 2px #9F9F9F; -webkit-box-shadow: 0px 0px 4px 2px #9F9F9F; box-shadow: 0px 0px 4px 2px #9F9F9F;}
#emergency-planning .client_details .grid_adjuster { margin-left:-30px }
#emergency-planning .client_details .category_ul { margin:50px 0 0 }
#emergency-planning .client_details .category_ul li { margin-left:5% }
#emergency-planning .client_details .category_ul .cat_name { font-family: "Aller Bold"; font-size: 15px; width: 100%; text-align: center; margin: 27px 0 0; height: 19px; }
#emergency-planning .client_details .category_ul .third  .cat_name{text-indent: -6px;}
#emergency-planning .client_details .category_ul .value { margin: 20px 0 0; }
#emergency-planning .client_details .category_ul .value span { border-bottom: 1px dashed #1d87bd; padding: 0 10px; font-family: "Aller Bold"; font-size: 22px; }
#emergency-planning .client_details .category_ul .first .category { background:url(${pageContext.request.contextPath}/images/diyimages/goal_icon.png) no-repeat center center #fff }
#emergency-planning .client_details .category_ul .second .category { background:url(${pageContext.request.contextPath}/images/diyimages/risk_profile_report.png) no-repeat center center #fff;background-size: 60%; }
#emergency-planning .client_details .category_ul .third .category { background: url(${pageContext.request.contextPath}/images/diyimages/emergency_report.png) no-repeat center center #fff }
#emergency-planning .client_details .category_ul .fourth .category { background: url(${pageContext.request.contextPath}/images/diyimages/risk_planning_report.png) no-repeat center center #fff }
#emergency-planning .client_details .category_ul .fifth .category { background: url(${pageContext.request.contextPath}/images/diyimages/succsession_report.png) no-repeat center center #fff }

#emergency-planning .ifa_details {height: 120px;padding: 0px 35px 0;}
#emergency-planning .ifa_details .add_details { margin:0px 0px 0px 0px; width:43% }
#emergency-planning .ifa_details .name { font-family: "Aller Bold"; font-size: 23px; margin: 0 0 3px 0; }
#emergency-planning .ifa_details .address { width:300px; font-size: 17px; line-height: 21px; }
#emergency-planning .ifa_details .logo { margin: 0px 0px 0px 0px; width:150px; height:125px; text-align: center;padding:5px }
#emergency-planning .ifa_details .logo img { max-width: 100%; max-height: 100%; }
#emergency-planning .client_details { /*height:380px;*/margin: 0 0 80px 0; }
#emergency-planning .client_details .name {font-family: "Aller Bold"; font-size: 32px; margin: 0; padding: 15px 0 0; text-align:center }

.photo{max-height:302px;max-width:396px; width:396px; background-color:#ccc;margin: 20px auto;}
.theme_faint_border{border: 1px solid <%=colorCode%>}



/*************** Table CSS End ****************/

/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}
	`

</style>

</head>
<body>
<c:set var="pageCount" value="0" />
<a name="INTRODUCTION_1"></a>
<div class="wrapper analysis_report_comp">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Analysis Report - Comprehensive</h1>
  </div><!-- header end -->
  <div class="content" id="emergency-planning">
    <div class="box1 ifa_details clearfix">
      <c:set var="photoPath" value="${output.partnerLogo}"/>
      <div class="fl logo theme_faint_border">
      	<%
      	String photoPath1=(String) pageContext.getAttribute("photoPath");
		String x = "D:/Ffreedom-DI/images/"+photoPath1;
		File file = new File(x);
		%>
			<% if (file.exists() && !file.isDirectory()) { %> 
			<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath1%>" style="height: 216px;width: 224px;" alt="Advisor Logo"/></a>
	   <% } else { %>
	   		<img src="${pageContext.request.contextPath}/images/diyimages/temp_logo.png" style="height: 216px;width: 224px;" alt="Advisor Logo" /></a>
	    <% } %>
      </div>
      
      <div class="add_details fr">
        <h4 class="name">${output.partnerSalutation}${output.partnerName}</h4>
        <p class="address">${output.partnerPhone}</p>
        <p class="address">${output.partnerEmail}</p>
        <p class="address">${output.partnerAddress}</p>
        <p class="address">${output.partnerCity} - ${output.postalCode}</p>
      </div>
      
    </div>
    <div class="box2 client_details">
      <h4 class="name"><span class="c_name theme_color">${output.salutation}${output.opportunityName}</span></h4>
      <%-- <c:set var="clientpieces" value="${fn:split(adviserGoals.clientAddress, '_')}"/>
        <p class="centerAll client_address">${clientpieces[0]}</p>
        <p class="centerAll client_address">${clientpieces[1]}</p> --%>
        <%-- <p class="centerAll client_address">${clientpieces[2]}</p> --%>
        <c:set var="photoPath5" value="${output.CPLogo}"/>
      <div class="photo theme_faint_border">
      	<%
      	String photoPath5=(String) pageContext.getAttribute("photoPath5");
		String x5 = "D:/Ffreedom-DI/images/"+photoPath5;
		File file5 = new File(x5);
		%>
			<% if (file5.exists() && !file5.isDirectory()) { %> 
			<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath5%>" style="max-height: 300px;width: 394px;" alt="Advisor Logo"/></a>
	   <% } else { %>
	   		<img src="${pageContext.request.contextPath}/images/diyimages/family_photo.jpg " style="max-height: 300px;width: 394px;" alt="Advisor Logo"/>
	    <% } %>
      </div>  
        
      <div class="grid_adjuster">
        <ul class="reset clearfix category_ul">
          <li class="first fl">
            <div class="category"></div>
            <div class="cat_name">Goals</div>
          </li>
          <li class="second fl">
            <div class="category"></div>
            <div class="cat_name">Risk Profile</div>
          </li>
          <li class="third fl">
            <div class="category"></div>
            <div class="cat_name">Emergency Planning</div>
          </li>
          <li class="fourth fl">
            <div class="category"></div>
            <div class="cat_name">Risk Planning</div>
          </li>
          <li class="fifth fl">
            <div class="category"></div>
            <div class="cat_name">Succession Planning</div>
          </li>
        </ul>
      </div>
    </div>
    <div class="box3 disclaimer">
    <h4 class="heading theme_color">Disclaimer</h4>
		<c:choose>
	    	<c:when test="${buId eq '27829' }">
	    		<p class="txt">This document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FINFRA. This document is based entirely on the information provided by you . Despite our best efforts, due care and precautions, there may be some variables used in generation of this document which have not been unaccounted for, or miscalculated, by the Platform. FINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, or any third party if the contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or incorrectly. The contents of this document do not qualify as investment advice and/or financial planning, or any variant thereof, under India's applicable regulatory framework, including the Securities and Exchange Board of India (Investment Adviser) Regulations, 2013, as amended from time to time, and FINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be avoided, whether directly, indirectly, incidentally or consequentially, by you or  any third party, by relying upon this document, or any content therein. Investments are subject to a variety of risks, uncertainties and other factors that could cause actual results to differ materially from expectations as expressed or implied under this document.</p>
	    	</c:when>
	    	<c:otherwise>
	    		<p class="txt">This document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FIINFRA. This document is based entirely on the information provided by you or your Distributor. Despite our best efforts, due care and precautions, there may be some variables used in generation of this document which have not been unaccounted for, or miscalculated, by the Platform. FIINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, your Distributor or any third party if the contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or incorrectly. The contents of this document do not qualify as investment advice and/or financial planning, or any variant thereof, under India's applicable regulatory framework, including the Securities and Exchange Board of India (Investment Adviser) Regulations, 2013, as amended from time to time, and FIINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be avoided, whether directly, indirectly, incidentally or consequentially, by you or your Distributor or any third party, by relying upon this document, or any content therein. Investments are subject to a variety of risks, uncertainties and other factors that could cause actual results to differ materially from expectations as expressed or implied under this document.</p>
	    	</c:otherwise>
	    </c:choose>
  <!-- <div class="btm_logo fl"></div> -->
  	<div class="clr"></div>
    </div>
  </div>
  <div class="footer1 clearfix" style="page-break-after:always">
  	<div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>    
  </div>
</div>

<a name="CONTENTS_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Table of Contents</h1>
  </div><!-- header end -->
  <div class="content" id="emergency-planning">
  	 <c:set var="indexCount" value="0" />
  	 <c:set var="indexCount1" value="0" />
  	 <c:forEach items="${output.keyValueList}" var="indexCountList">
  	 	<c:set var="indexCount" value="${indexCount+1}" />	
  	 </c:forEach>
 	 <div class="table2 clearfix">
            <div class="table-header2 fl">
                <ul>
                    <li class="one fl">Contents</li>                    
                </ul>
            </div>
            <c:forEach items="${output.keyValueList}" var="indexList" varStatus="indexCntr">
            	<c:if test="${indexCntr.index <= 24}">
	            	<div class="rows fl">
		                <ul>
		                	<c:set var="url" value="${fn:replace(indexList.name,' ','_')}"/>
		                    <li class="one fl"><a href="#${url}_${indexList.id}" style="color:<%=colorCode%>;">${indexList.name}</a></li>
		                    <li class="two fr"><a href="#${url}_${indexList.id}" style="color:<%=colorCode%>;">${indexList.id}</a></li>
		                </ul>
	                </div>
            	</c:if>
            </c:forEach>   
  		  </div><!-- End "Table" -->
 
    
  </div>
  
  <div class="footer1 clearfix" style="page-break-after:always">
    <div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
  </div>
</div>
<c:choose>
	<c:when test="${indexCount gt 24}">
		<a name="CONTENTS_${pageCount+1}"></a>
		<div class="wrapper">
		  <div class="header clearfix">
		    <div class="desc_heading fl">
		      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
		    </div>
		    <h1 class="page_heading fr">Table of Contents</h1>
		  </div><!-- header end -->
		  <div class="content" id="emergency-planning">
		  	 <c:set var="indexCount1" value="24" />
		 	 <div class="table2 clearfix">
		            <div class="table-header2 fl">
		                <ul>
		                    <li class="one fl">Contents</li>                    
		                </ul>
		            </div>
		            <c:forEach items="${output.keyValueList}" var="indexList" varStatus="indexCntr">
		            	<c:if test="${indexCntr.index > indexCount1}">
			            	<div class="rows fl">
				                <ul>
				                    <li class="one fl"><a href="#indexUrl_${indexList.id}" style="color:<%=colorCode%>;">${indexList.name}</a></li>
				                    <li class="two fr"><a href="#indexUrl_${indexList.id}" style="color:<%=colorCode%>;">${indexList.id}</a></li>
				                </ul>
			                </div>
		            	</c:if>
		            </c:forEach>   
		  		  </div><!-- End "Table" -->
		 
		    
		  </div>
		  
		  <div class="footer1 clearfix" style="page-break-after:always">
		    <div class="fl footer_tagline"></div>
		    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
		  </div>
		</div>
	</c:when>
</c:choose>

<!-- Goal Summary Starts -->
<style>
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0px 0px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:10px }
#emergency-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; position:relative;margin-left: 5px;display: inline-block; }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0px;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .goalSummary-table{width:750px; margin:10px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .goalSummary-table li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .goalSummary-table ul{margin-left: 0px; margin-top:5px;padding: 0px 0px 0px 47px;}

.wrapper .goalSummary-table .goalSummary-table-header{width:100%; height:30px;background-color: <%=colorCode%>;}

.wrapper .goalSummary-table .goalSummary-table-header li.one{line-height:20px; width:35%;font-size:13px;color:#FFF;}
.wrapper .goalSummary-table .goalSummary-table-header li.two{line-height:20px; width:15%;font-size:13px;color:#FFF;/*margin-left:32px;*/}
.wrapper .goalSummary-table .goalSummary-table-header li.thr{line-height:20px; width:25%;font-size:13px;color:#FFF;/*margin-left:32px;*/}
.wrapper .goalSummary-table .goalSummary-table-header li.four{line-height:20px; width:25%;font-size:13px;color:#FFF;/*margin-left:32px;*/}
.wrapper .goalSummary-table .goalSummary-table-header li.fiv{line-height:20px; width:15%;font-size:12px;color:#FFF;/*margin-left:32px;*/}
.wrapper .goalSummary-table .goalSummary-table-header li.six{line-height:20px; width:15%;font-size:12px;color:#FFF;/*margin-left:32px;*/}


.wrapper .goalSummary-table .rows{padding:10px 0px;margin-left:2.5px; border-bottom:1px solid #ccc; width:100%}
.wrapper .goalSummary-table .rows ul li.one{width:35%; color:#646464;}
.wrapper .goalSummary-table .rows ul li.two{width:15%; color:#646464;/* text-align:center;*/}
.wrapper .goalSummary-table .rows ul li.thr{width:25%; color:#646464;/* text-align:center;*/}
.wrapper .goalSummary-table .rows ul li.four{width:25%; color:#646464;/* text-align:center;*/}
.wrapper .goalSummary-table .rows ul li.fiv{width:15%; color:#646464;/* text-align:center;*/}
.wrapper .goalSummary-table .rows ul li.six{width:15%; color:#646464;/* text-align:center;*/}

.goal_summary{margin-top:20px;}
.goal_summary p{font-size:12px; margin-top:10px; line-height:15px;}
.name{color:<%=colorCode%>;}

/***********ace ****************/
input[type=checkbox].ace.ace-switch.ace-switch-4:checked + .lbl::before, input[type=checkbox].ace.ace-switch.ace-switch-5:checked + .lbl::before{ background-color: <%=colorCode%>;border-color: <%=colorCode%>;}
.btn-primary, .btn-primary:focus{  background-color: <%=colorCode%> !important;border-color: <%=colorCode%>;}
.btn-primary.active{  background-color: <%=colorCode%> !important;border-color: <%=colorCode%>;}
.btn.active:after{  border: 2px solid #efe5b5;}
.ui-slider-handle{  border-color: <%=colorCode%> !important;}
.ui-slider-range{background-color: <%=colorCode%>;}
/*************** Table CSS End ****************/

/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}

</style>
<a name="GOAL_SUMMARY_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Goal Summary</h1>
  </div><!-- header end -->
  <div class="content" id="emergency-planning">
  	 <div class="goal_summary">
     	<h3>Goal Summary</h3>
        <p>We have presented below a snapshot of all your major financial goals as shared by you. It is important to note that the financial plan below will largely revolve around helping  you lay a roadmap for achieving your financial goals through various strategies as outlined there in.</p>
     </div>	<!-- end of goal_summery -->
 	 <div class="goalSummary-table clearfix">
            <div class="goalSummary-table-header fl">
                <ul>
                    <li class="one fl">Goal</li> 
                    <li class="two fl">Goal Year</li>
                    <li class="thr fl">Goal Present Value</li>
                    <li class="four fl">Goal Future Value</li>                   
                </ul>
            </div>
            <c:set var="goalIds" value="0" />
            <c:set var="goalCount" value="0" />
            <c:forEach items="${output.goalList}" var="goalList">
            	<c:if test="${not fn:contains(goalIds, goalList.fpGoalId)}">
            		<c:set var="goalIds" value="${goalIds}_${goalList.fpGoalId}" />
            		<c:set var="goalCount" value="${goalCount + 1}" />
            		<c:if test="${goalCount lt 24}">
	            		<div class="rows fl">
			                <ul>
			                    <li class="one fl">${goalList.goalDescription} <span class="name">(${goalList.goalName})</span></li>
			                    <li class="two fl">${goalList.goalEndYear}</li>
			                    <li class="thr fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${goalList.currentValue}" /></li>
			                    <li class="four fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${goalList.futureValueOfGoal}" /></li>
			                </ul>
			            </div>
		            </c:if>
            	</c:if>	
            </c:forEach>
            
  		  </div><!-- End "Table" -->
	 	
  </div>
  
  <div class="footer1 clearfix" style="page-break-after:always">
    <div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
  </div>
</div>

<c:choose>
	<c:when test="${goalCount gt 24}">
	<a name="GOAL_SUMMARY_${pageCount+1}"></a>
	<div class="wrapper">
		  <div class="header clearfix">
		    <div class="desc_heading fl">
		      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
		    </div>
		    <h1 class="page_heading fr">Goal Summary</h1>
		  </div><!-- header end -->
		  <div class="content" id="emergency-planning">
		  	 <div class="goal_summary">
		     	<h3>Goal Summary</h3>
		        <p>We have presented below a snapshot of all your major financial goals as shared by you. It is important to note that the financial plan below will largely revolve around helping  you lay a roadmap for achieving your financial goals through various strategies as outlined there in.</p>
		     </div>	<!-- end of goal_summery -->
		 	 <div class="goalSummary-table clearfix">
		            <div class="goalSummary-table-header fl">
		                <ul>
		                    <li class="one fl">Goal</li> 
		                    <li class="two fl">Priority</li>
		                    <li class="thr fl">Start Year</li>
		                    <li class="four fl">End Year</li>
		                    <li class="fiv fl">Goal Value</li>
		                    <li class="six fl">Frequency</li>                   
		                </ul>
		            </div>
		            <c:set var="goalCount1" value="0" />
		            <c:forEach items="${output.goalList}" var="goalList">
		            	<c:if test="${not fn:contains(goalIds, goalList.fpGoalId)}">
		            		<c:set var="goalIds" value="${goalIds}_${goalList.fpGoalId}" />
		            		<c:set var="goalCount1" value="${goalCount1 + 1}" />
		            		<c:if test="${goalCount gt 24}">
			            		<div class="rows fl">
					                <ul>
					                    <li class="one fl">${goalList.goalDescription} <span class="name">(${goalList.goalName})</span></li> 
					                    <li class="two fl">${goalList.goalPriorityId}</li>
					                    <li class="thr fl">${goalList.goalEndYear}</li>
					                    <li class="four fl">${goalList.goalEndYear}</li>
					                    <li class="fiv fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${goalList.currentValue}" /></li>
					                    <li class="six fl">${goalList.goalFrequency}</li> 
					                </ul>
					            </div>
				            </c:if>
		            	</c:if>	
		            </c:forEach>
		            
		  		  </div><!-- End "Table" -->
			 	
		  </div>
		  
		  <div class="footer1 clearfix" style="page-break-after:always">
		    <div class="fl footer_tagline"></div>
		    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
		  </div>
		</div>
	</c:when>
</c:choose>

<!-- Cash Flow -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	var monthlyEmi = ${output.monthlyEmi};
	var premium = ${output.premiums};
	var surplus = ${output.surplus};
	var fpplanId = ${output.fpplanTypeId};
	if(fpplanId == 522002){
		var expense = '${output.expensesAdvanced}';
		if( expense != '' ){
			expense = expense.split("_");
			if( expense[0] == 0 && expense[1] == 0 && expense[2] == 0 && expense[3] == 0 && expense[4] == 0 && expense[5] == 0 && expense[6] == 0 && expense[7] == 0 && expense[8] == 0 ){
				expense = '${output.expenses}';
				if(expense != ''){
					expense = expense.split("_");
					totalExpense = parseInt(expense[0]);
				}else{
					totalExpense = 0;	
				}
			}else{
				var totalExpense = parseInt(expense[0])+parseInt(expense[1])+parseInt(expense[2])+parseInt(expense[3])+parseInt(expense[4])+parseInt(expense[5])+parseInt(expense[6])+parseInt(expense[7])+parseInt(expense[8]);
				totalExpense = parseInt(totalExpense);
			}	
		}else{
			var totalExpense = 0;
		}
		var otherIncome = '${output.otherIncomeAdvanced}';
		otherIncome = parseInt(otherIncome);
		var income = '${output.salaryIncomeAdvanced}';
		if(income != ''){
			income = income.split("_");
			if( income[0] == 0 && income[1] == 0 && income[2] == 0 ){
				income = '${output.salaryIncome}';
				if(income != ''){
					var Income_one = parseInt(income);
					var Income_two = 0;
					var Income_three = 0;
				}else{
					var Income_one = 0;
					var Income_two = 0;
					var Income_three = 0;	
				}
			}else{
				var Income_one = parseInt(income[0]);
				var Income_two = parseInt(income[1]);
				var Income_three = parseInt(income[2]);	
			}
		}else{
			var Income_one = 0;
			var Income_two = 0;
			var Income_three = 0;
		}
	}else{
		var totalExpense = '${output.expenses}';
		if(totalExpense != ''){
			totalExpense = totalExpense.split("_");
			totalExpense = parseInt(totalExpense[0]);
		}else{
			totalExpense = 0;	
		}
		var otherIncome = 0;
		var Income_one = ${output.salaryIncome};
		var Income_two = 0;
		var Income_three = 0; 
	}
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
	['API Category', 'Salary Income', 'Business', 'Dividend', 'Other', 'Premium', 'EMI', 'Expense', 'Surplus', { role: 'annotation' } ],
		['Income', Income_one, Income_two, Income_three, otherIncome, 0, 0, 0, 0, ''],
		['Expense', 0, 0, 0, 0, premium, monthlyEmi, totalExpense, 0, ''],
		['Surplus', 0, 0, 0, 0, 0, 0, 0, surplus, ''],
	]);
	
		var options = {
		width: 500,
		height: 250,
	 // legend: { position: 'top', maxLines: 3, textStyle: {color: 'black', fontSize: 16 } },
	isStacked: true,
	// Displays tooltip on selection.
	// tooltip: { trigger: 'selection' }, 
	};
	
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	
	// Selects a set point on chart.
	// chart.setSelection([{row:0,column:1}]) 
	
	// Renders chart as PNG image 
	// chart_div.innerHTML = '<img src="' + chart.getImageURI() + '">';
	}
</script>
<style>
	/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0px 0px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:10px }
#emergency-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; position:relative;margin-left: 5px;display: inline-block; }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0px;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table{width:500px; margin:10px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table li{list-style-type:none; display:inline-block; font-size:10px; font-family:sans-serif;font-weight:bold;}
.wrapper .table ul{margin-left: 0px; margin-top:5px;}

.wrapper .table .table-header{width:100%; height:30px;background-color:<%=colorCode%>;}

.wrapper .table .table-header li.one{line-height:20px; width:25%;font-size:12px;}
.wrapper .table .table-header li.two{line-height:20px; width:25%;font-size:12px;/*margin-left:32px;*/}
.wrapper .table .table-header li.thr{line-height:20px; width:25%;font-size:12px;/*margin-left:32px;*/}
.wrapper .table .table-header li.four{line-height:20px; width:25%;font-size:12px;/*margin-left:32px;*/}



.wrapper .table .rows{padding:10px 0px;margin-left:2.5px; border-bottom:1px solid #ccc; width:100%}
.wrapper .table .rows ul li.one{width:25%; color:#646464;}
.wrapper .table .rows ul li.two{width:25%; color:#646464;/* text-align:center;*/}
.wrapper .table .rows ul li.thr{width:25%; color:#646464;/* text-align:center;*/}
.wrapper .table .rows ul li.four{width:25%; color:#646464;/* text-align:center;*/}


.goal_summary{margin-top:20px;}
.goal_summary p{font-size:12px; margin-top:10px; line-height:15px;}
.name{color:<%=colorCode%>; font-size:12px; font-weight:bold;}

/*************** Table CSS End ****************/

/*************** Table_ie CSS End ****************/
.wrapper .table_ie{width:500px; margin:10px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table_ie li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .table_ie ul{margin-left: 0px; margin-top:5px;}

.wrapper .table_ie .table-header{width:100%; height:30px;background-color: <%=colorCode%>;}


.wrapper .table_ie .table-subheader{width:100%; height:30px; background-color:#d2d2d2;}
/*.wrapper .table_ie .table-header li.one{line-height:20px; width:100%;font-size:14px;color:#fff;}*/

.wrapper .table_ie .table-header li.one{line-height:20px; width:33%;font-size:12px;color:#FFF;text-align: center;}
.wrapper .table_ie .table-header li.two{line-height:20px; width:33%;font-size:12px;color:#FFF;text-align: center;/*margin-left:32px;*/}
.wrapper .table_ie .table-header li.thr{line-height:20px; width:33%;font-size:12px;color:#FFF;text-align: center;/*margin-left:32px;*/}
.wrapper .table_ie .table-header li.four{line-height:20px; width:25%;font-size:12px;color:#FFF;text-align: center;/*margin-left:32px;*/}

.wrapper .table_ie .rows{padding:5px 0px;margin-left:0px; border-bottom:1px solid #ccc; width:100%}
.wrapper .table_ie .rows ul li.one{width:33%; color:#646464; padding-left:68px;}
.wrapper .table_ie .rows ul li.two{width:33%; color:#646464;padding-left:68px;/* text-align:center;*/}
.wrapper .table_ie .rows ul li.thr{width:33%; color:#646464;padding-left:68px;/* text-align:center;*/}
.wrapper .table_ie .rows ul li.four{width:25%; color:#646464;padding-left:68px;/* text-align:center;*/}

/*************** Table_ie CSS End ****************/


/*************** Table_in CSS Start ****************/
.wrapper .table_in{width:370px; margin:10px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table_in li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .table_in ul{margin-left: 0px; margin-top:5px;}

.wrapper .table_in .table-header{width:100%; height:30px;background-color: <%=colorCode%>;}

.wrapper .table_in .table-subheader{width:100%; height:30px; background-color:#d2d2d2;}
/*.wrapper .table_in .table-header li.one{line-height:20px; width:100%;font-size:14px;color:#fff;}*/
<!--.wrapper .table .table-header li.two{line-height:20px; width:50%;font-size:12px;color:#fff; text-align:center;}-->

.wrapper .table_in .table-header li.one{line-height:20px; width:33%;font-size:12px;color:#FFF;}
.wrapper .table_in .table-header li.two{line-height:20px; width:33%;font-size:12px; text-align:center;color:#FFF;}
.wrapper .table_in .table-header li.thr{line-height:20px; width:34%;font-size:12px; text-align:center;color:#FFF;}



.wrapper .table_in .rows{padding:5px 0px; border-bottom:1px solid #ccc; width:100%}
.wrapper .table_in .rows ul li.one{width:33%; color:#646464;padding-left:20px;}
.wrapper .table_in .rows ul li.two{width:33%; color:#646464; text-align:center;}
.wrapper .table_in .rows ul li.thr{width:34%; color:#646464; text-align:center;}


.goal_summary{margin-top:20px;}
.goal_summary p{font-size:12px; margin-top:10px; line-height:15px; text-align:justify; padding:0px 10px;}
.name{color:<%=colorCode%>;}

/*************** Table_in CSS End ****************/

.emi_prem{width:300px;height:40px;border:1px solid #d2d2d2;text-align:center;line-height:60px;margin:10px 0px 10px 20px;}
.emi_prem .labell{width:50%;height:auto;border-right:1px solid #d2d2d2;text-align:center;line-height:40px;background-color:<%=colorCode%>;color:#FFF;}
.emi_prem .value{width:50%;height:auto;text-align:center;line-height:40px;  background-color: #E6E6E6;}
.surplus{width:300px; height:75px; border:1px solid <%=colorCode%>;  margin: 10px 0px 10px 20px; padding:5px; text-align:justify;}
.sur_title{width:auto; height:auto; font-weight:bold;margin: 30px 0px 10px 20px;}


/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}
</style>
<c:if test="${fn:contains(fpSection, '39002')}">
<a name="CASH_FLOW_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Cash Flow</h1>
  </div><!-- header end -->
  <div class="content" id="emergency-planning">
  	 <div class="goal_summary">
     	<h3>Cash Flow</h3>
        <p>The cash flow below is a projection over the current year, illustrating what incomes you are expected to receive and what cash outflows you should expect. Cashflow is an essential to achieving your financial goals. Through out this report, your saving recommendation are made based on your expected disposable income or income surplus from now until your goals are met.</p>
     </div>	<!-- end of goal_summery -->
     <div class"graph">
            <div id="chart_div" style="margin-left:120px;"></div>     
     </div><!-- end of graph --> 
     
     <c:choose>
     	<c:when test="${output.fpplanTypeId eq '522002' }">
     		<c:set var="expenseAdv" value="${fn:split(output.expensesAdvanced, '_')}" />
     		
     		<c:set var="expenseBasicIf" value="${fn:split(output.expenses, '_')}" />
     		<c:set var="emiBasicIf" value="${expenseBasicIf[0]}" />
     		
     		<c:set var="incomeAdv" value="${fn:split(output.salaryIncomeAdvanced, '_')}" />
     		<c:set var="income_zero" value="${incomeAdv[0]}" />
     		<c:set var="expnse_zero" value="${expenseAdv[0]}" />
     		<c:set var="totalExpense" value="${expenseAdv[0]+expenseAdv[1]+expenseAdv[2]+expenseAdv[3]+expenseAdv[4]+expenseAdv[5]+expenseAdv[6]+expenseAdv[7]+expenseAdv[8]}" />
     		<c:set var="totalIncome" value="${incomeAdv[0] + incomeAdv[1] + incomeAdv[2] + output.otherIncomeAdvanced}" />
     		<c:if test="${expenseAdv[0] == 0 and expenseAdv[1] == 0 and expenseAdv[2] == 0 and expenseAdv[3] == 0 and expenseAdv[4] == 0 and expenseAdv[5] == 0 and expenseAdv[6] == 0 and expenseAdv[7] == 0 and expenseAdv[8] == 0}">
     			<c:set var="totalExpense" value="${emiBasicIf}" />
     			<c:set var="expnse_zero" value="${emiBasicIf}" />
     		</c:if>
     		<c:if test="${incomeAdv[0] == 0 and incomeAdv[1] == 0 and incomeAdv[2] == 0 and output.otherIncomeAdvanced == 0}">
     			<c:set var="totalIncome" value="${output.salaryIncome}" />
     			<c:set var="income_zero" value="${output.salaryIncome}" />
     		</c:if>
     		<div style="margin-top: 0px;" class="goal_summary">
		     	<h3>Income</h3>
		        <p>Your current income sources are tabulated below:</p>
		    </div>	<!-- end of goal_summery -->
     		<div class="table_ie clearfix">
	            <div class="table-header fl">
	                <ul>
	                    <li class="one fl">Perticular</li> 
	                    <li class="two fl">Amount</li>
	                    <li class="thr fl">%</li>
	                 
	                </ul>
	            </div>
	                       
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Salary Income</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${income_zero}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalIncome gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${income_zero/totalIncome}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div> 
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Business</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${incomeAdv[1]}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalIncome gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${incomeAdv[1]/totalIncome}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
				
				<div class="rows fl">
	                <ul>
	                    <li class="one fl">Dividend</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${incomeAdv[2]}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalIncome gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${incomeAdv[2]/totalIncome}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
				
				<div class="rows fl">
	                <ul>
	                    <li class="one fl">Other</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.otherIncomeAdvanced}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalIncome gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${output.otherIncomeAdvanced/totalIncome}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>	                                        
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Total Income</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalIncome}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalIncome gt '0'}">
	                    		<li class="thr fl">100%</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	        </div>  
	            <div style="margin-top: 0px;" class="goal_summary">
					<h3>Expenses</h3>
					<p>The breakup of your monthly expense with broad categorization is as follows:</p>
				</div>	<!-- end of goal_summery -->
	            
	            <div class="table_in clearfix fl">
           
		            <div class="table-header fl">
		                <ul>
		                    <li class="one fl">Perticulars</li> 
		                    <li class="two fl">Annual Amount</li>
		                    <li class="thr fl">Amount in %</li>                                     
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Housing</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expnse_zero}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expnse_zero / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div> 
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Utilities</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[1]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[1] / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Personal</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[2]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[2] / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Food</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[3]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[3] / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Healthcare</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[4]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[4] / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>		                                        
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Family Care</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[5]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[5] / totalExpense) * 100}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Transportation</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[6]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[6] / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Leisure</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[7]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[7] / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Other</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseAdv[8]}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${(expenseAdv[8] / totalExpense)}" /></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Total Expenses</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalExpense}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl">100%</li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>   
		            
		  	 </div><!-- End "Table" -->
		  	 <div class="emi_prem_sur fl">
		  	 	<div class="emi_prem">
		  	 		<div class="labell fl">EMI</div>
		  	 		<div class="value fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.monthlyEmi}" /></div>
		  	 	</div>
		  	 	<div class="emi_prem">
		  	 		<div class="labell fl">Premium</div>
		  	 		<div class="value fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.premiums}" /></div>
		  	 	</div>
		  	 	<div class="sur_title">Surplus/Deficit</div>
		  	 	<div class="surplus">
		  	 		<fmt:parseNumber var="surplusPos" value="${output.surplus}"/>
		  	 		<c:choose>
		  	 			<c:when test="${surplusPos < 0}">
		  	 				<div>Your Deficit Is <span style="color:red;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.surplus}" /></span></div>
		  	 			</c:when>
		  	 			<c:otherwise>
		  	 				<div>Your Surplus Is <fmt:formatNumber type="number" maxFractionDigits="2" value="${output.surplus}" /></div>
		  	 			</c:otherwise>
		  	 		</c:choose>		  	 		
		  	 	</div>
		  	 </div>
	            
     	</c:when>
     	<c:otherwise>
     		<c:set var="expenseBasic" value="${fn:split(output.expenses, '_')}" />
     		<c:set var="emiBasic" value="${expenseBasic[1]}" />
     		<c:set var="premiumBasic" value="${expenseBasic[2]}" />
     		<c:set var="totalExpense" value="${expenseBasic[0]}" />
     		<c:set var="totalIncome" value="${output.salaryIncome + output.otherIncome}" />
     		<div style="margin-top: 0px;" class="goal_summary">
		     	<h3>Income</h3>
		        <p>Your current income sources are tabulated below:</p>
		    </div>	<!-- end of goal_summery -->
     		<div class="table_ie clearfix">
	            <div class="table-header fl">
	                <ul>
	                    <li class="one fl">Perticular</li> 
	                    <li class="two fl">Amount</li>
	                    <li class="thr fl">%</li>
	                 
	                </ul>
	            </div>
	                       
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Salary Income</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.salaryIncome}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalIncome gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${output.salaryIncome/totalIncome}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>     
	                </ul>
	            </div> 
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Business</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0 %</li>                    
	                </ul>
	            </div>
				
				<div class="rows fl">
	                <ul>
	                    <li class="one fl">Dividend</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0 %</li>                    
	                </ul>
	            </div>
				
				<div class="rows fl">
	                <ul>
	                    <li class="one fl">Other</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0 %</li>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Total Income</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalIncome}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalIncome gt '0'}">
	                    		<li class="thr fl">100%</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>             
	                </ul>
	            </div>
	        </div>  
	            <div style="margin-top: 0px;" class="goal_summary">
					<h3>Expenses</h3>
					<p>The breakup of your monthly expense with broad categorization is as follows:</p>
				</div>	<!-- end of goal_summery -->
	            
	            <div class="table_in clearfix fl">
           
		            <div class="table-header fl">
		                <ul>
		                    <li class="one fl">Perticulars</li> 
		                    <li class="two fl">Annual Amount</li>
		                    <li class="thr fl">Amount in %</li>                                     
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Housing</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${expenseBasic[0]}" /></li>
		                    <c:choose>
		                    	<c:when test="${expenseBasic[0] gt '0'}">
		                    		<li class="thr fl">100%</li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div> 
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Utilities</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Personal</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Food</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Healthcare</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Family Care</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Transportation</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Leisure</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Other</li> 
		                    <li class="two fl">0</li>
		                    <li class="thr fl">0%</li>                    
		                </ul>
		            </div>
		            
		            <div class="rows fl">
		                <ul>
		                    <li class="one fl">Total Expenses</li> 
		                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalExpense}" /></li>
		                    <c:choose>
		                    	<c:when test="${totalExpense gt '0'}">
		                    		<li class="thr fl">100%</li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="thr fl">0%</li>
		                    	</c:otherwise>
		                    </c:choose>                    
		                </ul>
		            </div>   
		            
		  	 </div><!-- End "Table" -->
		  	 <div class="emi_prem_sur fl">
		  	 	<div class="emi_prem">
		  	 		<div class="labell fl">EMI</div>
		  	 		<div class="value fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.monthlyEmi}" /></div>
		  	 	</div>
		  	 	<div class="emi_prem">
		  	 		<div class="labell fl">Premium</div>
		  	 		<div class="value fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.premiums}" /></div>
		  	 	</div>
		  	 	<div class="sur_title">Surplus/Deficit</div>
		  	 	<div class="surplus">
		  	 		<fmt:parseNumber var="surplusPos" value="${output.surplus}"/>
		  	 		<c:choose>
		  	 			<c:when test="${surplusPos < 0}">
		  	 				<div>Your Deficit Is <span style="color:red;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.surplus}" /></span></div>
		  	 			</c:when>
		  	 			<c:otherwise>
		  	 				<div>Your Surplus Is <fmt:formatNumber type="number" maxFractionDigits="2" value="${output.surplus}" /></div>
		  	 			</c:otherwise>
		  	 		</c:choose>		  	 		
		  	 	</div>
		  	 </div>
     	</c:otherwise>
     </c:choose>
    
  </div><!-- end of contents -->
  
  <div class="footer1 clearfix" style="page-break-after:always">
    <div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
  </div>
</div>
</c:if>
<!-- Risk Profile -->

<style>
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0px 0px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:10px }
#emergency-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; position:relative;margin-left: 5px;display: inline-block; }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0px;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table_rp{width:500px; margin:30px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table_rp li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .table_rp ul{margin-left: 0px; margin-top:5px;padding: 0px 0px 0px 40px;}

.wrapper .table_rp .table-header_rp{width:100%; height:30px;background-color: <%=colorCode%>;}

.wrapper .table_rp .table-header_rp li.one{line-height:20px; width:25%;font-size:13px;color:#FFF;}
.wrapper .table_rp .table-header_rp li.two{line-height:20px; width:25%;font-size:13px;/*margin-left:32px;*/color:#FFF;}
.wrapper .table_rp .table-header_rp li.thr{line-height:20px; width:25%;font-size:13px;/*margin-left:32px;*/color:#FFF;}
.wrapper .table_rp .table-header_rp li.four{line-height:20px; width:25%;font-size:13px;/*margin-left:32px;*/color:#FFF;}



.wrapper .table_rp .rows{padding:10px 0px;margin-left:2.5px; border-bottom:1px solid #ccc; width:100%}
.wrapper .table_rp .rows ul li.one{width:25%; color:#646464;}
.wrapper .table_rp .rows ul li.two{width:25%; color:#646464;/* text-align:center;*/}
.wrapper .table_rp .rows ul li.thr{width:25%; color:#646464;/* text-align:center;*/}
.wrapper .table_rp .rows ul li.four{width:25%; color:#646464;/* text-align:center;*/}


.goal_summary{margin-top:20px;}
.goal_summary p{font-size:12px; margin-top:10px; line-height:15px;}
.name{color:<%=colorCode%>; font-size:12px; font-weight:bold;}

/*************** Table CSS End ****************/

/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}
</style>
<c:if test="${fn:contains(fpSection, '39009')}">
<a name="RISK_PROFILE_${pageCount+1}"></a>
<div class="wrapper">
<div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">My Risk Profile</h1>
  </div><!-- header end -->
  
  <style>
  	.td_style{text-align:center;}
  	.td_font{font-size: 12px; color: #FFF;  font-family: sans-serif; font-weight: bold;}
  	.td_width{width: 150px;}
  	.td_col_font{font-size: 11px; font-family: sans-serif; font-weight: bold; color: #646464;padding-left: 10px;}
  	.td_img_style{margin-left: 10px;width: 30px;}
  </style>
    <div class="content" id="emergency-planning">
    <div class="goal_summary">																
				<h3>Cash Flow Analysis Ratio</h3> 
			 <table border="1" rules="rows" frame="HSIDES" style="margin: 28px 22px 0; width:95%;" >
              <tbody padding="5px">
                <tr>
                  <td bgcolor="<%=colorCode%>" height="35px"></td>
                  <td bgcolor="<%=colorCode%>" class="td_style td_font td_width">Healthy</td>
                  <td bgcolor="<%=colorCode%>" class="td_style td_font td_width">Average</td>
                  <td bgcolor="<%=colorCode%>" class="td_style td_font td_width">Unhealthy</td>
                </tr>
                
			    <tr>
                  <td class="td_col_font" height="35px" bgcolor="#E6E6E6">Surplus Ratio (Expenses/Income)</td>
                  <c:choose>
					<c:when test="${cashFlowData.surPlusRatioStatus eq 'H'}">
	                  <td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.surplusRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_happy.png" /></td><td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td>
	               	
	               </c:when>
               	<c:when test="${cashFlowData.surPlusRatioStatus eq 'A'}">
						<td bgcolor="#E6E6E6"></td><td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.surplusRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_average.png" /></td><td bgcolor="#E6E6E6"></td>
					</c:when>
					<c:otherwise>
							<td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td><td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.surplusRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_unhappy.png" /></td>
					</c:otherwise>
                  </c:choose>
                </tr>
                
           <tr>
                  <td class="td_col_font" bgcolor="#E6E6E6">Savings Ratio (Savings/Income)</td>
                  <c:choose>
					<c:when test="${cashFlowData.savingRatioStatus eq 'H'}">
	                  <td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.savingRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_happy.png" /></td><td bgcolor="#F1F1F1"></td><td bgcolor="#F1F1F1"></td>
                	</c:when>
                	<c:when test="${cashFlowData.liquididyRatioStatus eq 'A'}">
						  <td></td><td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.savingRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_average.png" /></td><td bgcolor="#F1F1F1"></td>
					</c:when> 
					<c:otherwise>
						  <td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td><td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.savingRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_unhappy.png" /></td>
					</c:otherwise> 
                </c:choose>
                </tr>
                
           <tr>
                  <td bgcolor="#E6E6E6" class="td_col_font" height="35px">EMI/Income Ratio</td>
                  <c:choose>
					<c:when test="${cashFlowData.emiRatioStatus eq 'H'}">
	                  <td bgcolor="#E6E6E6" class="td_style td_col_font">${cashFlowData.emiRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_happy.png" /></td><td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td>
	              </c:when>
                  	<c:when test="${cashFlowData.emiRatioStatus eq 'A'}">
							  <td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6" class="td_style td_col_font">${cashFlowData.emiRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_average.png" /></td><td bgcolor="#E6E6E6"></td>
					</c:when>
					<c:otherwise>
							<td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6" class="td_style td_col_font">${cashFlowData.emiRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_unhappy.png" /></td>
					</c:otherwise>
                  </c:choose>
                </tr>
                
          <tr>
                  <td bgcolor="#E6E6E6" class="td_col_font">Liquidity Ratio (Liquid Assets/Networth)</td>
                  <c:choose>
					<c:when test="${cashFlowData.liquididyRatioStatus eq 'H'}">
	                  <td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.liquidityRatio}  %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_happy.png" /></td><td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td>
                	</c:when>
                	<c:when test="${cashFlowData.liquididyRatioStatus eq 'A'}">
						   <td bgcolor="#E6E6E6"></td><td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.liquidityRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_average.png" /></td><td bgcolor="#E6E6E6"></td>
					</c:when>
					<c:otherwise>
						 <td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td> <td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.liquidityRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_unhappy.png" /></td>
					</c:otherwise>
                </c:choose>
                </tr>
                
                
                
                 <tr>
                  <td bgcolor="#E6E6E6" class="td_col_font" height="35px">Solvency Ratio(Outstanding Debts/All Assets)</td>
                  <c:choose>
					<c:when test="${cashFlowData.solvencyRatioStatus eq 'H'}">
	                  <td bgcolor="#E6E6E6" class="td_style td_col_font">${cashFlowData.solvencyRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_happy.png" /></td><td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td>
	              </c:when>
                  	<c:when test="${cashFlowData.solvencyRatioStatus eq 'A'}">
							 <td bgcolor="#E6E6E6"></td><td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.solvencyRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_average.png" /></td><td bgcolor="#E6E6E6"></td>
					</c:when>
					<c:otherwise>
							 <td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td> <td bgcolor="#E6E6E6" class="td_style td_col_font">${cashFlowData.solvencyRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_unhappy.png" /></td>
					</c:otherwise>
                  </c:choose>
                </tr>
                
                
                 <tr>
                  <td class="td_col_font" bgcolor="#E6E6E6">Debt Asset Ratio (Outstanding Debt/All Assets)</td>
                  <c:choose>
					<c:when test="${cashFlowData.debtAssetRatioStatus eq 'H'}">
	                  <td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.debtAssetRatio}  %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_happy.png" /></td><td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td>
                	</c:when>
                	<c:when test="${cashFlowData.debtAssetRatioStatus eq 'A'}">
						  <td bgcolor="#E6E6E6"></td><td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.debtAssetRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_average.png" /></td><td bgcolor="#E6E6E6"></td>
					</c:when>
					<c:otherwise>
						   <td bgcolor="#E6E6E6"></td><td bgcolor="#E6E6E6"></td> <td class="td_style td_col_font" bgcolor="#E6E6E6">${cashFlowData.debtAssetRatio} %<img class="td_img_style" alt="Rs " src="${pageContext.request.contextPath}/images/diyimages/legacy_unhappy.png" /></td>
					</c:otherwise>
                </c:choose>
                </tr>
              </tbody>
            </table>
		</div>
             <div class="goal_summary">																
				<h3>My Risk Profile - ${output.profile}</h3>
                	<c:choose>
				      	<c:when test="${output.riskProfileid eq 40001}">
				      		<p>You may not like taking too much risk with your investments. You may find it more comfortable to pay off your loans (if you have any) over investing any surplus money for growth.If you choose investments that are more stable and give steady returns, you are likely to stick to your decisions and hence will be in a better position to reach your goals.However, there could be some risks that you may not be seeing now - like risk of capital erosion due to inflation.</p>
				      	</c:when>
				      	<c:when test="${output.riskProfileid eq 40002}">
				      		<p>You are more likely to take moderate risk with your investments. You probably understand different kinds of risks - risks that can result in loss to capital in the short term and risks that can result in loss to purchasing power in the long term.If you have a loan and some surplus money, you are likely to weigh the costs and benefits of repaying loans vs. investing the money and then taking a decision.</p>
				      	</c:when>
				      	<c:when test="${output.riskProfileid eq 40003}">
				      		<p>You probably have a high appetite for risk and are willing to try new things and give second chances. Steady investments where there is not much action may make you restless.  You are likely to forget the losses of the past and expect a repeat of the good times.</p>
				      	</c:when>
			        </c:choose>
             </div>	<!-- end of goal_summery -->
         
         <div class="table_rp clearfix">
                <div class="table-header_rp fl">
                    <ul>
                        <li class="one fl">Years of Goal</li> 
                        <li class="two fl">Equity</li>
                        <li class="thr fl">Debt</li>
                        <li class="four fl">Gold</li>                                      
                    </ul>
                </div>
                <c:forEach items="${riskProfileMap}" var="riskProfileList">
                	<div class="rows fl">
	                    <ul>
	                        <li class="one fl">${riskProfileList.key}</li>
	                        <c:forEach items="${riskProfileList.value}" var="riskProfile">
	                        	<li class="two fl">${riskProfile.allocationPercent}%</li>
	                        </c:forEach>                   
	                    </ul>
	                </div>
                </c:forEach>
                   
              </div><!-- End "Table" -->
    </div><!-- end of content -->
    <div class="footer1 clearfix" style="page-break-after:always">
    <div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
  </div>
</div><!-- end of wrapper -->
</c:if>

<!-- Net Worth -->

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
var totalAssetAdv = '${totalAssetAdv}';
if( totalAssetAdv != '' ){
	totalAssetAdv = parseInt(totalAssetAdv);
}else{
	totalAssetAdv = 0;
}
var totalLoanAdv = '${totalLoanAdv}';
if( totalLoanAdv != '' ){
	totalLoanAdv = parseInt(totalLoanAdv);
}else{
	totalLoanAdv = 0;
}
var netWorth = '${netWorthAdv}';
if( netWorth != '' ){
	netWorth = parseInt(netWorth);
}else{
	netWorth = 0;
}
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ["Element", "Amount", { role: "style" } ],
      ["Assets", totalAssetAdv, "#b87333"],
      ["Liabilities", totalLoanAdv, "silver"],
      ["Networth", netWorth, "gold"],
     // ["Platinum", 300000, "color: #e5e4e2"]
    ]);

    var view = new google.visualization.DataView(data);
    view.setColumns([0, 1,
                     { calc: "stringify",
                       sourceColumn: 1,
                       type: "string",
                       role: "annotation" },
                     2]);

    var options = {
      title: "",
      width: 600,
      height: 400,
      bar: {groupWidth: "95%"},
      legend: { position: "none" },
      hAxis:{textStyle:{fontSize:'11',fontName:'sans-serif',color:'#646464',bold: true}},
      vAxis:{textStyle:{fontSize:'11',fontName:'sans-serif',color:'#646464',bold: true}},
      annotations: {textStyle: {fontName: 'sans-serif',fontSize: '11',color:'#646464',bold: true}},
    };
    var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values_net"));
    chart.draw(view, options);
}
</script>
<style>
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0px 0px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:10px }
#emergency-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; position:relative;margin-left: 5px;display: inline-block; }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0px;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table_net{width:370px; margin:10px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table_net li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .table_net ul{margin-left: 0px; margin-top:5px;padding: 0px 0px 0px 8px;}

.wrapper .table_net .table-header{width:100%; height:30px; background-color:<%=colorCode%>;}

.wrapper .table_net .table-subheader{width:100%; height:30px; background-color:#d2d2d2;}

.wrapper .table_net .table-header li.one{line-height:20px; width:100%;font-size:14px;color:#fff;}

.wrapper .table_net .table-subheader li.one{line-height:20px; width:33%;font-size:12px;}
.wrapper .table_net .table-subheader li.two{line-height:20px; width:33%;font-size:12px; text-align:center;}
.wrapper .table_net .table-subheader li.thr{line-height:20px; width:34%;font-size:12px; text-align:center;}



.wrapper .table_net .rows{padding:10px 0px; border-bottom:1px solid #ccc; width:100%}
.wrapper .table_net .rows ul li.one{width:33%; color:#646464;}
.wrapper .table_net .rows ul li.two{width:33%; color:#646464; text-align:center;}
.wrapper .table_net .rows ul li.thr{width:34%; color:#646464; text-align:center;}


.goal_summary{margin-top:20px;}
.goal_summary p{font-size:12px; margin-top:10px; line-height:15px; text-align:justify; padding:0px 10px;}
.name{color:<%=colorCode%>;}

/*************** Table CSS End ****************/

/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}

</style>
<c:if test="${fn:contains(fpSection, '39005')}">
<a name="CURRENT_NETWORTH_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Current Networth</h1>
  </div><!-- header end -->
  <div class="content" id="emergency-planning">
  	 <div class="goal_summary">
     	<h3>Current Networth</h3>
        <p>The following section relates to your personal Networth. This is a snapshot of all your assets and your liabilities. Assets are what you own and liabilities are what you owe. The balance between the two is Networth which may either be negative or positive.</p>
     </div>	<!-- end of goal_summery -->
     
     <c:choose>
     	<c:when test="${output.fpplanTypeId eq '522002' }">
     		<c:set var="totalAssetAdv" value="0" />
     		<c:set var="mutualAdv" value="0" />
     		<c:set var="shareAdv" value="0" />
     		<c:set var="propertyAdv" value="0" />
     		<c:set var="depositAdv" value="0" />
     		<c:set var="goldAdv" value="0" />
     		<c:set var="retirementAdv" value="0" />
     		<c:set var="othersAdv" value="0" />
     		
     		<c:set var="totalLoanAdv" value="0" />
     		<c:set var="houseAdv" value="0" />
     		<c:set var="carAdv" value="0" />
     		<c:set var="wheelerAdv" value="0" />
     		<c:set var="personalAdv" value="0" />
     		<c:set var="creditAdv" value="0" />
     		<c:set var="businessAdv" value="0" />
     		
     		<c:set var="netWorthAdv" value="0" />
     		<c:forEach items="${output.jsonDataList}" var="assetListAdv">
     			<c:if test="${assetListAdv.value eq '72004'}">
     				<c:set var="mutualAdv" value="${assetListAdv.text}" />
     			</c:if>
     			<c:if test="${assetListAdv.value eq '72001'}">
     				<c:set var="shareAdv" value="${assetListAdv.text}" />
     			</c:if>
     			<c:if test="${assetListAdv.value eq '72002'}">
     				<c:set var="propertyAdv" value="${assetListAdv.text}" />
     			</c:if>
     			<c:if test="${assetListAdv.value eq '72003'}">
     				<c:set var="depositAdv" value="${assetListAdv.text}" />
     			</c:if>
     			<c:if test="${assetListAdv.value eq '72006'}">
     				<c:set var="goldAdv" value="${assetListAdv.text}" />
     			</c:if>
     			<c:if test="${assetListAdv.value eq '72008'}">
     				<c:set var="retirementAdv" value="${assetListAdv.text}" />
     			</c:if>
     			<c:if test="${assetListAdv.value eq '72007'}">
     				<c:set var="othersAdv" value="${assetListAdv.text}" />
     			</c:if>
     			<c:set var="totalAssetAdv" value="${totalAssetAdv + assetListAdv.text}" />
     		</c:forEach>
     		<c:forEach items="${output.goalAttributeList}" var="loanListAdv">
     			<c:if test="${loanListAdv.goalID eq '76001'}">
     				<c:set var="houseAdv" value="${loanListAdv.attributeValue}" />
     			</c:if>
     			<c:if test="${loanListAdv.goalID eq '76002'}">
     				<c:set var="carAdv" value="${loanListAdv.attributeValue}" />
     			</c:if>
     			<c:if test="${loanListAdv.goalID eq '76003'}">
     				<c:set var="wheelerAdv" value="${loanListAdv.attributeValue}" />
     			</c:if>
     			<c:if test="${loanListAdv.goalID eq '76004' or loanListAdv.goalID eq '76007'}">
     				<c:set var="personalAdv" value="${personalAdv + loanListAdv.attributeValue}" />
     			</c:if>
     			<c:if test="${loanListAdv.goalID eq '76005'}">
     				<c:set var="creditAdv" value="${loanListAdv.attributeValue}" />
     			</c:if>
     			<c:if test="${loanListAdv.goalID eq '76006'}">
     				<c:set var="businessAdv" value="${loanListAdv.attributeValue}" />
     			</c:if>
     			<c:set var="totalLoanAdv" value="${totalLoanAdv + loanListAdv.attributeValue}" />
     		</c:forEach>
     		<c:set var="netWorthAdv" value="${totalAssetAdv - totalLoanAdv}" />
     		<div class="table_net clearfix fl">
     
	     		<div class="table-header fl">
	                <ul>
	                    <li class="one fl">Assets</li>                                                                            
	                </ul>
	            </div>
	           
	            <div class="table-subheader fl">
	                <ul>
	                    <li class="one fl">Perticulars</li> 
	                    <li class="two fl">Annual Amount</li>
	                    <li class="thr fl">Amount in %</li>                                     
	                </ul>
	            </div>
	                        
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Mutual Funds</li>
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${mutualAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${mutualAdv/totalAssetAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>                      
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Shares</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${shareAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${shareAdv/totalAssetAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Deposits</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${depositAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${depositAdv/totalAssetAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Properties</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${propertyAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${propertyAdv/totalAssetAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>   
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Gold</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${goldAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${goldAdv/totalAssetAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Retirement Funds</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retirementAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${retirementAdv/totalAssetAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Others</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${othersAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${othersAdv/totalAssetAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Total Assets</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalAssetAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0'}">
	                    		<li class="thr fl">100%</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>  
	            
	  		  </div><!-- End "Table" -->
	     
	 	 <div class="table_net clearfix fr">
	     
	     		<div class="table-header fl">
	                <ul>
	                    <li class="one fl">Liabilities</li>                                                                            
	                </ul>
	            </div>
	           
	            <div class="table-subheader fl">
	                <ul>
	                    <li class="one fl">Perticulars</li> 
	                    <li class="two fl">Annual Amount</li>
	                    <li class="thr fl">Amount in %</li>                                     
	                </ul>
	            </div>
	                        
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">House Loan</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${houseAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalLoanAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${houseAdv/totalLoanAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>                      
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Car Loan</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${carAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalLoanAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${carAdv/totalLoanAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">2-Wheeler Loan</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${wheelerAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalLoanAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${wheelerAdv/totalLoanAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Personal Loan</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${personalAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalLoanAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${personalAdv/totalLoanAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Credit Card Loan</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${creditAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalLoanAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${creditAdv/totalLoanAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>   
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Business Loan</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${businessAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalLoanAdv gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${businessAdv/totalLoanAdv}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Total Liabilities</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalLoanAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalLoanAdv gt '0'}">
	                    		<li class="thr fl">100%</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Networth</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${netWorthAdv}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetAdv gt '0' or totalLoanAdv gt '0' }">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${netWorthAdv/(totalAssetAdv+totalLoanAdv)}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	             
	  	 </div><!-- End "Table" -->
     	</c:when>
     	<c:otherwise>
     		<c:set var="mutualBas" value="0" />
     		<c:set var="shareBas" value="0" />
     		<c:set var="propertyBas" value="0" />
     		<c:set var="depositBas" value="0" />
     		<c:set var="goldBas" value="0" />
     		<c:set var="retirementBas" value="0" />
     		<c:set var="otherBas" value="0" />
     		<c:set var="totalAssetBas" value="0" />
     		
     		<c:set var="netWorthBas" value="0" />
     		<c:forEach items="${output.retirementList}" var="assetListBas">
     			<c:if test="${assetListBas.productId eq '72004'}">
     				<c:set var="mutualBas" value="${assetListBas.minLumpSumAmount}" />
     			</c:if>
     			<c:if test="${assetListBas.productId eq '72001'}">
     				<c:set var="shareBas" value="${assetListBas.minLumpSumAmount}" />
     			</c:if>
     			<c:if test="${assetListBas.productId eq '72002'}">
     				<c:set var="propertyBas" value="${assetListBas.minLumpSumAmount}" />
     			</c:if>
     			<c:if test="${assetListBas.productId eq '72003'}">
     				<c:set var="depositBas" value="${assetListBas.minLumpSumAmount}" />
     			</c:if>
     			<c:if test="${assetListBas.productId eq '72006'}">
     				<c:set var="goldBas" value="${assetListBas.minLumpSumAmount}" />
     			</c:if>
     			<c:if test="${assetListBas.productId eq '72008'}">
     				<c:set var="retirementBas" value="${assetListBas.minLumpSumAmount}" />
     			</c:if>
     			<c:if test="${assetListBas.productId eq '72007'}">
     				<c:set var="otherBas" value="${assetListBas.minLumpSumAmount}" />
     			</c:if>
     			<c:set var="totalAssetBas" value="${totalAssetBas + assetListBas.minLumpSumAmount}" />
     		</c:forEach>
     		<c:set var="netWorthBas" value="${totalAssetBas - output.investmentValue}" />
     		
     		<div class="table_net clearfix fl">
     
	     		<div class="table-header fl">
	                <ul>
	                    <li class="one fl">Assets</li>                                                                            
	                </ul>
	            </div>
	           
	            <div class="table-subheader fl">
	                <ul>
	                    <li class="one fl">Perticulars</li> 
	                    <li class="two fl">Annual Amount</li>
	                    <li class="thr fl">Amount in %</li>                                     
	                </ul>
	            </div>
	                        
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Mutual Funds</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${mutualBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${mutualBas/totalAssetBas}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>                      
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Shares</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${shareBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${shareBas/totalAssetBas}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Deposits</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${depositBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${depositBas/totalAssetBas}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Properties</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${propertyBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${propertyBas/totalAssetBas}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>   
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Gold</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${goldBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${goldBas/totalAssetBas}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Retirement Funds</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retirementBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${retirementBas/totalAssetBas}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Others</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${otherBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${otherBas/totalAssetBas}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Total Assets</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${totalAssetBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0'}">
	                    		<li class="thr fl">100%</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>  
	            
	  		  </div><!-- End "Table" -->
	     
	 	 <div class="table_net clearfix fr">
	     
	     		<div class="table-header fl">
	                <ul>
	                    <li class="one fl">Liabilities</li>                                                                            
	                </ul>
	            </div>
	           
	            <div class="table-subheader fl">
	                <ul>
	                    <li class="one fl">Perticulars</li> 
	                    <li class="two fl">Annual Amount</li>
	                    <li class="thr fl">Amount in %</li>                                     
	                </ul>
	            </div>
	                        
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">House Loan</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0%</li>                    
	                </ul>
	            </div>                      
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Car Loan</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0%</li>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">2-Wheeler Loan</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0%</li>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Personal Loan</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.investmentValue}" /></li>
	                    <c:choose>
	                    	<c:when test="${output.investmentValue gt '0'}">
	                    		<li class="thr fl">100%</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Credit Card Loan</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0%</li>                    
	                </ul>
	            </div>   
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Business Loan</li> 
	                    <li class="two fl">0</li>
	                    <li class="thr fl">0%</li>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Total Liabilities</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.investmentValue}" /></li>
	                    <c:choose>
	                    	<c:when test="${output.investmentValue gt '0'}">
	                    		<li class="thr fl">100%</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	            
	            <div class="rows fl">
	                <ul>
	                    <li class="one fl">Networth</li> 
	                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${netWorthBas}" /></li>
	                    <c:choose>
	                    	<c:when test="${totalAssetBas gt '0' or output.investmentValue gt '0'}">
	                    		<li class="thr fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${netWorthBas/(totalAssetBas + output.investmentValue)}" /></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="thr fl">0%</li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
	             
	  	 </div><!-- End "Table" -->
     	</c:otherwise>
     </c:choose>
                    
     <div class"graph fl">
			
            <div id="columnchart_values_net" style="width: 600px; height: 400px; margin-left:110px;" class="fl"></div>     
     </div><!-- end of graph --> 
	 	
  </div>
  
 
  
  <div class="footer1 clearfix" style="page-break-after:always">
    <div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
  </div>
</div>
</c:if>

<!-- Retirement Planning -->
<style>
/***Emergency Planning Starts***/
#retire-planning .emergency_desc { width:190px; height:100px; background: #9CBC01; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#retire-planning .emergency_action { width:190px; height:100px; background: #368EBC; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#retire-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#retire-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#retire-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#retire-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#retire-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#retire-planning .emergency_category { margin:0px 0px 0px 195px;width:381px; }
#retire-planning .fixed {height: 310px; }
#retire-planning .fixed ul { padding: 0px 0 0 0; }
#retire-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#retire-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#retire-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#retire-planning .emergency_category .fund_status .heading { height:10px }
#retire-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#retire-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#retire-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#retire-planning .emergency_category .fund_status .additional { width:61%; }
#retire-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#retire-planning .emergency_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 172px; margin: 5px auto 3px; overflow: hidden; position:relative }
#retire-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#retire-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#retire-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#retire-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#retire-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#retire-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#retire-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#retire-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#retire-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#retire-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#retire-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#retire-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#retire-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#retire-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#retire-planning .variable {height:auto; }
#retire-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#retire-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 348px;   background-size: 792px auto;}
#retire-planning .report { height: 140px;}
#retire-planning .report .container { background: #F4F4F4; border: 2px solid #368EBC; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#retire-planning .report > ul { margin: 0 auto; width: 575px; }
#retire-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#retire-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#retire-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#retire-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/theme_color_ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table_retire{width:600px; margin:20px auto 0px 100px; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table_retire li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .table_retire ul{margin-left: 0px; margin-top:0px;}

.wrapper .table_retire .table-header{width:100%; height:20px;background-color: <%=colorCode%>;}

.wrapper .table_retire .table-header li.one{line-height:20px; width:33%; margin-left: 0px !important; text-align:center;color:#FFF;}
.wrapper .table_retire .table-header li.two{line-height:20px; width:33%; margin-left:0px;text-align:center;color:#FFF;}
.wrapper .table_retire .table-header li.three{line-height:20px; width:33%; margin-left: 0px;text-align:center;color:#FFF;}
.wrapper .table-header li.four{line-height:15px; width:100px;width: 27px;margin-left: 46px;}

.wrapper .table_retire .rows{margin-top:10px; width:100%;margin-left: 13%;;}
.wrapper .table_retire .rows ul li.one{width: 33% !important; color:#646464;}
.wrapper .table_retire .rows ul li.two{width: 33% !important; color:#646464;}
.wrapper .table_retire .rows ul li.three{width: 33% !important; color:#646464;}
.wrapper .table_retire .rows ul li.four{width:0px !important; color:#646464;}

/*************** Table CSS End ****************/


/*************** Bottom Table CSS Start ****************/
.wrapper .table1{width:100%; margin:0px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px; height:86px;}
.wrapper .table1 li{list-style-type:none; display:inline-block; font-size:10px; font-family:sans-serif;font-weight:bold;}
.wrapper .table1 ul{margin-left: -20px; margin-top:-31px;}

.wrapper .table1 .table-header1{width:100%; height:20px;background-color:<%=colorCode%> !important; line-height: 20px;text-align: center;font-size: 12px;color:#fff;}

/*************** Bottom Table CSS End ****************/

/****************** JM Meter *************************/
#meter { /* height:40%; position:relative */  margin: 20px 0px 20px 0px;width: 100%; }
.jm_meter { background:url(${pageContext.request.contextPath}/images/diyimages/jim_meter.png) no-repeat left center; width:328px; height:110px; margin:10px 0 0 240px; position:relative; padding: 0 60px 2px 0; border-bottom: 1px solid rgba(255, 255, 255, 0.14); }
/*#dashboard .jm_meter .arrow { background:url(../${pageContext.request.contextPath}/images/diyimages/jm_meter_arrow.png) no-repeat center center; width:33px; height:137px; display:block; position: relative; z-index: 10; top: 13px; left: 45%; }*/
.jm_meter .arrow { width: 9px; height: 103px; display: block; z-index: 10;/* background: #fff;*/ margin: 0px auto 0; transform-origin:bottom; -ms-transform-origin:bottom; /* IE 9 */ -webkit-transform-origin:bottom; /* Chrome, Safari, Opera */ ; position:relative }
.jm_meter .arrow:before { content: ""; border-left: 7px solid rgba(0, 0, 0, 0); border-right: 8px solid rgba(0, 0, 0, 0); border-bottom: 93px solid #FFF; position: absolute; top: 0px; left: -4px; }
.jm_meter .staus { position:absolute; font-size:12px; color:#000; font-family: sans-serif; }
.jm_meter .average { left: 34%; top: -20px; }
.jm_meter .not_rank { left: -48px; bottom: 30%; }
.jm_meter .very_good { bottom: 30%; right:25px; }
.jm_meter .arrow_base { background:url(${pageContext.request.contextPath}/images/diyimages/arrow_base.png) no-repeat center center; width:46px; height:43px; display:block; margin:-19px auto 0; position:relative; z-index:100 }
#meter .head1 { color:#000; font-size:16px; font-family:"Aller Bold"; text-align:center; margin: -4px 58px 0; }
/****************** JM Meter End *************************/


/***Analysis Report Starts***/
.clr {
clear: both;
overflow: hidden;
height: 0;
}
.rel {
position: relative;
}
.centerAll {
text-align: center;
}
.goal_cat_retire {
	font-size: 12px;
	margin: 0 0 10px 0;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	width: 100%;
	height: 13px;
}
.goal_cat_retire .specific {
	color: <%=colorCode%>
}

.goal_asset_desc_retire{margin-left:25px;}
.goal_asset_desc_retire .goal_val_retire {
	width: 210px;
	height: 88px;
	background: <%=colorCodeLeft%>;
	margin: 0 15px 0 0;
	-moz-border-radius: 20px 0 0 20px;
	-webkit-border-radius: 20px 0 0 20px;
	border-radius: 20px 0 0 20px;
	-moz-box-shadow: -1px 2px 2px 0px #6C6C6C;
	-webkit-box-shadow: -1px 2px 2px 0px #6C6C6C;
	box-shadow: -1px 2px 2px 0px #6C6C6C;
}
.goal_asset_desc_retire .asset_val {
	width: 210px;
	height: 88px;
	background: <%=colorCode%>;
	margin: 0 0 0 15px;
	-moz-border-radius: 0 20px 20px 0;
	-webkit-border-radius: 0 20px 20px 0;
	border-radius: 0 20px 20px 0;
	-moz-box-shadow: 1px 2px 2px 0px #6C6C6C;
	-webkit-box-shadow: 1px 2px 2px 0px #6C6C6C;
	box-shadow: 1px 2px 2px 0px #6C6C6C;
}
.goal_asset_desc_retire .goal_val .heading {
	font-size: 11px;
	text-align: center;
	margin: 5px 12px 0 0;
	color: #fff;
	float: none
}
.goal_asset_desc_retire .asset_val .heading {
	color: #fff;
	font-size: 10px;
	text-align: center;
	margin: 5px 0 0;
	float: none
}
.goal_asset_desc_retire .goal_value {
	font-size: 13px;
	width: 48px;
	margin: 0px 0 20px 12px;
	/*text-align: center;
	border-bottom: 1px dashed;*/
	padding: 0 0 1px 0;
	color: #fff
}
.goal_asset_desc_retire .goal_value .lbl, .asset_value .lbl {
	/*position: absolute;
	top: 3px;*/
	font-size: 11px;
	/*left: -38px;*/
	margin-left:-32px;
	margin-right: 12px;
}

.goal_asset_desc_retire .goal_value:after {
	content: "lac";
	position: absolute;
	font-size: 12px;
	top: 18px;
	right: -18px;
}
.goal_asset_desc_retire .goal_value:before {
	content: "";
	background: url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center;
	width: 8px;
	height: 11px;
	top: 18px;
	left: 0px;
	display: block;
	position: absolute;
}

.goal_asset_desc_retire .goal_value2:after {
	content: "lac";
	position: absolute;
	font-size: 12px;
	top: 0px;
	right: 2px;
}
.goal_asset_desc_retire .goal_value2:before {
	content: "";
	background: url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center;
	width: 8px;
	height: 11px;
	top: -2px;
	left: 80px;
	display: block;
	position: absolute;
}

.goal_asset_desc_retire .asset_value {
	font-size: 13px;
	width: 125px;
	margin: 10px 0 20px 90px;
	text-align: center;
	/*border-bottom: 1px dashed;*/
	padding: 0 0 1px 0;
	color: #fff
}
.goal_asset_desc_retire .asset_value:after {
	content: "lac";
	position: absolute;
	font-size: 12px;
	top: 3px;
	right: 17px;
	color: #fff
}
.goal_asset_desc_retire .asset_value:before {
	content: "";
	background: url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center;
	width: 8px;
	height: 11px;
	top: 4px;
	left: 25px;
	display: block;
	position: absolute;
}
.goal_detal_retire .goal_logo_year1 {
	height: 69px;
	width: 69px;
	background: #3A3A3A;
	position: absolute;
	margin: 0;
	top: 9px;
	left: 190px;
	-moz-border-radius: 41px;
	-webkit-border-radius: 41px;
	border-radius: 41px;
	-moz-box-shadow: 0px 0px 0px 4px #FFF;
	-webkit-box-shadow: 0px 0px 0px 4px #FFF;
	box-shadow: 0px 0px 0px 4px #FFF;
}
.goal_detal_retire .goal_logo_year1 .year {
	text-align: center;
	color: #FFF;
	margin: 47px 0 0;
	font-size: 13px;
}
.goal_detal_retire .goal_logo_year1.travel_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/travel_goal.png) no-repeat center 7px
}
.goal_detal_retire .goal_logo_year1.car_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/car_goal.png) no-repeat center 7px
}
.goal_detal_retire .goal_logo_year1.edu_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/education_goal.png) no-repeat center 7px
}
.goal_detal_retire .goal_logo_year1.business_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/business_goal.png) no-repeat center 7px
}
.goal_detal_retire .goal_logo_year1.property_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/retirement_plan_report.png) no-repeat center 7px !important;  
}
.goal_detal_retire .goal_logo_year1.spcial_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/special_goal.png) no-repeat center 7px
}
.goal_detal_retire .goal_logo_year1.retirement_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/retirement_plan_report.png) no-repeat center 7px
}
.goal_detal_retire .goal_logo_year.wedding_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/wedding_goal_report.png) no-repeat center 7px
}
.goal_detal_retire .slider_parent {
	width: 175px;
	margin: 10px auto 10px;
}
.goal_detal_retire .goal_slider {background: url(${pageContext.request.contextPath}/images/diyimages/slider_bg.png) no-repeat center center;
	width: 141px;
	height: 20px;
	border: none;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
	-moz-border-radius: 0;
	-webkit-border-radius: 0;
	border-radius: 0;
	position: relative
}
.goal_detal_retire .goal_slider:after {
	content: "";
	display: block;
	width: 157px;
	height: 20px;
	position: absolute;
	background: url(${pageContext.request.contextPath}/images/diyimages/slider_bg.png) no-repeat center center;
	left: -14px;
}
.goal_detal_retire .ui-slider .ui-slider-handle {
background url(../${pageContext.request.contextPath}/images/diyimages/slider_button_rpt.png) no-repeat;
	height: 8px;
	width: 8px;
	border: none;
	-moz-box-shadow: 0px 1px 2px 0px #000;
	-webkit-box-shadow: 0px 1px 2px 0px #000;
	box-shadow: 0px 1px 2px 0px #000;
	top: 7px !important;
}
.goal_detal_retire .goal_slider_value {
	font-size: 12px;
	border: none;
	font-family: "none";
	width: 22px;
	position: relative;
	margin: -13px 0 0 10px;
}
.goal_detal_retire .goal_slider_value:after {
	content: "%";
	display: block;
	position: absolute;
	color: #3A3A3A;
	top: 0;
	right: -13px;
	font-size: 12px;
}
.goal_detal_retire .result_stat {
	border: 3px solid #3a3a3a;
	-moz-border-radius: 19px;
	-webkit-border-radius: 19px;
	border-radius: 19px;
	width: 98%;
	margin: 0 auto;
	height: 94px
}
.goal_detal_retire .result_stat .achievable_txt {
	text-align: center;
	font-size: 13px;
	line-height: 13px;
	margin: 9px 0 0;
}
.goal_detal_retire .result_stat .paraTxt {
	margin: 2px 0 2px 0;
	font-size: 13px
}
.goal_detal_retire .result_stat .invst_txt {
	font-size: 10px
}
.goal_detal_retire .result_stat .reg_invesment {
	width: 49%;
	border-right: 1px solid #bddcec;
	height: 58px;
}
.goal_detal_retire .result_stat .one_time_invesment {
	width: 50%;
	height: 58px;
}
.goal_detal_retire .result_stat .amount {
	font-size: 14px;
	margin: 15px 0 3px 0;
	position: relative
}
.goal_detal_retire .result_stat .amount .val:before {
	content: "";
	display: block;
	position: absolute;
	background: url(${pageContext.request.contextPath}/images/diyimages/black_rupee.png) no-repeat center center;
	width: 8px;
	height: 11px;
	left: -10px;
	top: 3px;
}
.goal_detal_retire .result_stat .thumb_status {
	width: 56px;
	border-top: 1px solid #3a3a3a;
	-moz-border-radius: 12px 0 0 0;
	-webkit-border-radius: 12px 0 0 0;
	border-radius: 12px 0 0 0;
}
.goal_detal_retire .result_stat .txt_status {
	background: #f0f0f0;
	border-top: 1px solid #3a3a3a;
	border-left: 1px solid #3a3a3a;
	width: 100%;
	font-size: 12px;
	line-height: 18px;
	color: #fff;
	-moz-border-radius: 0 0 16px 17px;
	-webkit-border-radius: 0 0 16px 17px;
	border-radius: 0 0 16px 17px;
}
.goal_detal_retire .result_stat .txt_status.achievable_txt_status {
	width: 100%;
	border-left: 0;
	-moz-border-radius: 0 0 18px 18px;
	-webkit-border-radius: 0 0 18px 18px;
	border-radius: 0 0 18px 18px;
}
.goal_detal_retire .result_stat .achievable_yes_thumb {
	background: url(${pageContext.request.contextPath}/images/diyimages/achivable_yes_thumb.png) no-repeat center center;
	width: 59px;
	height: 49px;
	margin: 12px auto 14px;
}
.goal_detal_retire .result_stat .quick_status .achievable {
	background: #2D951B;
}
.goal_detal_retire .result_stat .quick_status .partially_achievable {
	background: #E69528;
}
.goal_detal_retire .result_stat .quick_status .not_achievable {
	background: #D21C45;
}
.goal_detal_retire{width:510px; margin:30px auto 0px auto;}
/* Slider*/
/* .goal_detal_retire .goal_slider { /*background: url(${pageContext.request.contextPath}/images/diyimages/slider_bg.png) no-repeat center center;*/ width: 192px; height: 20px; border: none; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; position:relative } */
.goal_detal_retire .goal_slider:after { content:""; display:block; width: 157px; height: 20px; position:absolute; background: url(${pageContext.request.contextPath}/images/diyimages/slider_bg.png) no-repeat center center; left: -14px; }
.goal_detal_retire .ui-slider .ui-slider-handle {
background url(../${pageContext.request.contextPath}/images/diyimages/slider_button_rpt.png) no-repeat; height: 8px; width: 8px; border: none; -moz-box-shadow: 0px 1px 2px 0px #000; -webkit-box-shadow: 0px 1px 2px 0px #000; box-shadow: 0px 1px 2px 0px #000; top: 7px !important; }
.goal_detal_retire .goal_slider_value { font-size:12px; border:none; font-family: "none"; width: 22px; position:relative; margin:4px 0 0 10px; }
.goal_detal_retire .goal_slider_value:after { content: "%"; display: block; position: absolute; color: #3A3A3A; top: 0; right:-13px; font-size: 12px; }
.goal_detal_retire .result_stat { border:3px solid #3a3a3a; -moz-border-radius: 19px; -webkit-border-radius: 19px; border-radius: 19px; width:55%; margin: 0 auto; height:94px }

/***Analysis Report Ends***/
/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}
.question{color:#8b8b8b; margin-top:0px; font-size:12px; font-family:sans-serif;line-height:15px; text-align:justify;}
.left{width:100%;margin:15px 0px; display:inline-block;}
.right{width:100%;margin:15px 0px; display:inline-block;}
select[multiple], select.form-control[multiple]{height:60px !important;}
.space-5{max-height: 1px; min-height: 1px; overflow: hidden; margin: 5px 0;}
hr{margin:5px 0px !important;}
.head{height:20px; width:100%; background-color:<%=colorCode%>; text-align:center; line-height:20px; }
.sub_box1{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; padding:5px; line-height:15px;}
.sub_box2{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; color:#fff;margin-top:20px;}
.box3{margin-top:20px;}
.sub_assumptions{padding:0px 5px;}
.sub_assumptions p{margin-top:2px; color:#3a3a3a;}
.bb{border-bottom:1px #ccc solid;}
.br{border-right:1px #ccc solid;}
.table1 p{font-size:12px; margin-top:2px; padding-left:5px;}
.ins_name div{text-align:center; font-size:10px;}
label p{font-size:10px;}
.client_img{width:80px; height:80px; padding: 5px 10px; border:1px solid #ccc;}
.goal_for{font-size:15px; margin:20px 0px 0px 10px; font-weight:bold;}
.client_nm{color:#09F; text-decoration:underline;}


.goal_val_retire h5{  margin: 0px 0px 0px 11px;font-size: 10px;color: #fff;}
.goal_val_retire .leftt{width:42%; float:left;border-right:1px solid #666; height:40px; margin-top:8px;}
.goal_val_retire .leftt .val{margin-left: 12px;margin-top: 5px;border-bottom: 2px dashed #000;text-align: center;padding-bottom: 2px;}
.goal_val_retire .leftt .lbl{font-size: 11px;/* left: -38px; */margin-left: 10px;}

.goal_val_retire .rightt{width:50%;float:left;height: 40px; margin-top: 8px;}
.goal_val_retire .rightt .val{margin-left: 12px;margin-top: 5px;border-bottom: 2px dashed #000;text-align: center;padding-bottom: 2px;}
.goal_val_retire .rightt .lbl{font-size: 11px !important;/* left: -38px; */margin-left: 10px !important;}

.goal_val_retire .bottom{width:80%;height:40px; margin-top:0px; border-top:1px solid #666;margin-left: 8px; float:left}
.goal_val_retire .bottom .val{margin-right: 32px;margin-top: -15px;border-bottom: 2px dashed #000;text-align: center;padding-bottom: 2px;float: right;}
.goal_val_retire .bottom .lbl{font-size: 11px !important;/* left: -38px; */margin-left: 10px !important;}
.goal_asset_desc_retire .goal_value2 {font-size: 13px;width: 150px;margin: 6px 0 20px 12px;padding: 0 0 1px 0;color: #fff;}

.asset_value span.val{border-bottom:1px dashed #fff !important;}

</style>
<script>
$(document).ready(function(){
	var retRating = '${comprehensiveDetails.retRating}';
	if(retRating == '1'){
		$("#94130").addClass("active");
	}else if(retRating == '2'){
		$("#94131").addClass("active");
	}else if(retRating == '3'){
		$("#94132").addClass("active");
	}else if(retRating == '4'){
		$("#94133").addClass("active");
	}else if(retRating == '5'){
		$("#94134").addClass("active");
	}
	
	var retAge = '${comprehensiveDetails.retAge}';
	$("#94044").val(retAge);
	
	var retAccessMoney = '${comprehensiveDetails.retAccessMoney}';
	if(retAccessMoney == '1'){
		$("#94045").attr("checked","checked");
	}else if(retAccessMoney == '0'){
		$("#94045").removeAttr('checked');
	}
	
	var retBenefits = '${comprehensiveDetails.retBenefits}';
	if(retBenefits.indexOf("94046") >= 0){
		$('#94046').addClass("active");
	}
	if(retBenefits.indexOf("94047") >= 0){
		$('#94047').addClass("active");
	}
	if(retBenefits.indexOf("94048") >= 0){
		$('#94048').addClass("active");
	}
	if(retBenefits.indexOf("94049") >= 0){
		$('#94049').addClass("active");
	}
	if(retBenefits.indexOf("94050") >= 0){
		$('#94050').addClass("active");
	}
	if(retBenefits.indexOf("94114") >= 0){
		$('#94046').removeClass("active");
		$('#94047').removeClass("active");
		$('#94048').removeClass("active");
		$('#94049').removeClass("active");
		$('#94050').removeClass("active");
		$('#94003').addClass("active");
	}
	
	var retExpense = '${comprehensiveDetails.retExpense}';
	$("#94511").val(retExpense);

	var retInvestment = '${comprehensiveDetails.retInvestment}';
	retInvestment = retInvestment.split(",");
	$("#94051").val(retInvestment[0]);
	$("#94052").val(retInvestment[1]);
	$("#94053").val(retInvestment[2]);
	$("#94054").val(retInvestment[3]);
	
	var retRegular = '${comprehensiveDetails.retRegular}';
	retRegular = retRegular.split(",");
	$("#94055").val(retRegular[0]);
	$("#94056").val(retRegular[1]);
	$("#94057").val(retRegular[2]);
	$("#94058").val(retRegular[3]);
	
});
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,svalue) {
	  
    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        slide: function (event, ui) {
            $(ctrlTextBox).text(ui.value);
   
        }
    });
    $(ctrlName).slider('value', svalue);
}
</script>
<c:if test="${fn:contains(fpSection, '39006')}">
<a name="RETIREMENT_PLANNING_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Goals - My Dreams</h1>
  </div>
  <div class="content" id="retire-planning">
  
    <div class="box1 fixed">
    <h3>Information Collected</h3>
    <div class="row">
    	<div class="col-md-8 col-xs-8 col-sm-8">
        	<p class="goal_for"> Retirement Goal For :- <span class="client_nm theme_color">${output.opportunityName}</span></p>
        </div><!-- end of col-md-6 -->
        <c:set var="photoPath3" value="${output.clientPhoto}"/>
        <div class="col-md-4 col-xs-4 col-sm-4">
        	<div class="client_img center-block">
        		<%-- <img src="${pageContext.request.contextPath}/images/diyimages/ifa_logo.png"/> --%> 
		      	<%
		      	String photoPath2=(String) pageContext.getAttribute("photoPath3");
				String x2 = "D:/Ffreedom-DI/images/"+photoPath2;
				File file2 = new File(x2);
				%>
				<% if (file2.exists() && !file2.isDirectory()) { %> 
					<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath2%>"/>
			   <% } else { %>
			   		<img src="${pageContext.request.contextPath}/images/diyimages/pdf_personal_info.png">
			   <% } %>
        	</div>
        </div><!-- end of col-md-6 -->
            
    </div><!-- end of row -->
    <hr>
    <div class="space-10"></div>
    
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">   
       	 <div class="fl">  
            <div class="form-group">
                    <div class="controls col-xs-12 col-sm-12 col-md-12"><!-- #section:custom/checkbox.switch -->
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-xs-7">
                            	<div class="question">On a scale of 1 to 5, how would you rate your preparedness to lead a comfortable life of your choice after retirement?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94130" class="btn btn-primary margin_lr">
                                        <input type="radio" value="1">                                        
                                        <p>1</p>
                                    </label>                                    

                                    <label id="94131" class="btn btn-primary margin_lr">
                                        <input type="radio" value="2">
                                        <p>2</p>
                                    </label>

                                    <label id="94132" class="btn btn-primary margin_lr">
                                        <input type="radio" value="3">
                                        <p>3</p>
                                    </label>
                                    
                                    <label id="94133" class="btn btn-primary margin_lr">
                                        <input type="radio" value="4">
                                        <p>4</p>
                                    </label>
                                    
                                    <label id="94134" class="btn btn-primary margin_lr">
                                        <input type="radio" value="5">
                                        <p>5</p>
                                    </label>
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-8 col-sm-8 col-xs-8">
                            	<div class="question">At what age do you want to retire?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-4 col-sm-4 col-xs-4 pl pr">                            	
                                <div class="counter_parent">
                                    <input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="94044" placeholder="0" aria-required="true" aria-invalid="false">
                                  </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-8 col-sm-8 col-xs-8">
                            	<div class="question">Have you assessed how much money you might need to lead a comfortable retired life?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-4 col-sm-4 col-xs-4 pl pr">                            	
                                <label class="pull-right">
                                    <input name="switch-field-1" id="94045" class="ace ace-switch ace-switch-4 btn-flat" type="checkbox" />
                                    <span class="lbl"></span>
                                </label>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-5 col-sm-5 col-xs-5">
                            	<div class="question">What kind of retirement benefits does your employment provides?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-7 col-sm-7 col-xs-7 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94046" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Pension</p>
                                    </label>                                    

                                    <label id="94047" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="2">
                                        <p>Superannuation</p>
                                    </label>
                                    
                                    <label id="94048" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>EPF</p>
                                    </label>                                    

                                    <label id="94049" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="2">
                                        <p>Gratuity</p>
                                    </label>
                                    
                                    <label id="94050" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Other</p>
                                    </label>
                                    
                                    <label id="94114" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>None</p>
                                    </label>
                                    
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-8 col-sm-8 col-xs-8">
                            	<div class="question">How much of your expense % will continue after Retirement?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-4 col-sm-4 col-xs-4 pl pr">                            	
                                <div class="counter_parent">
                                    <input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="94511" placeholder="0" aria-required="true" aria-invalid="false">
                                  </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->                       
                        <hr>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                            	<div class="question">Value of retirement assets</div><!-- end of question -->
                            </div>
                        </div>
                        <div class="space-5"></div>    
                        <div class="row">       
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                	<span class="lbl">Provident Fund</span>
                                    <input name="switch-field-1" id="94051" class="ace ace-switch ace-switch-4 btn-flat" type="text" />                                    
                                </label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                	<span class="lbl">Pension Plans</span>
                                    <input name="switch-field-1" id="94052" class="ace ace-switch ace-switch-4 btn-flat" type="text" />
                                </label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                	<span class="lbl">National Pension Schemes</span>
                                    <input name="switch-field-1" id="94053" class="ace ace-switch ace-switch-4 btn-flat" type="text" />
                                </label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                	<span class="lbl">Others</span>
                                    <input name="switch-field-1" id="94054" class="ace ace-switch ace-switch-4 btn-flat" type="text" />
                                </label>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                            	<div class="question">Regular investments made (Monthly)</div><!-- end of question -->
                            </div>  
                        </div>
                        <div class="space-5"></div>
                        <div class="row">     
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                    <span class="lbl">Provident Fund</span>
                                    <input name="switch-field-1" id="94055" class="ace ace-switch ace-switch-4 btn-flat" type="text" />
                                </label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                    <span class="lbl">Pension Plans</span>
                                    <input name="switch-field-1" id="94056" class="ace ace-switch ace-switch-4 btn-flat" type="text" />
                                </label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                    <span class="lbl">National Pension Schemes</span>
                                    <input name="switch-field-1" id="94057" class="ace ace-switch ace-switch-4 btn-flat" type="text" />
                                </label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3 pl pr">                            	
                                <label class="pull-right" style="margin-left:20px !important;color: #8b8b8b;margin-top: 0px;font-size: 12px;font-family: 'allerregular';">
                                    <span class="lbl">Others</span>
                                    <input name="switch-field-1" id="94058" class="ace ace-switch ace-switch-4 btn-flat" type="text" />
                                </label>
                            </div>                            
                        </div><!-- /section:custom/checkbox.switch -->
                    </div>
            </div>
        </div><!-- end of left -->
       </div><!-- end of col -->
    </div><!-- end of row --> 
    <hr>
    <c:set var="retAssetCount" value="0" />
    <c:if test="${output.fpplanTypeId eq '522002'}">
    	<div class="row">
	      <div class="col-md-12 col-sm-12 col-xs-12">                
	        <div class="fl">            
		      <div class="table_retire clearfix">
	            <div class="table-header fl">
	                <ul style="padding: 0px 0 0 0;">
	                    <li class="one fl">Asset Name</li>
	                    <li class="two fl">Present Value</li>
	                    <li class="three fl">% achieved through assets</li>
	                </ul>
	            </div>
	            <c:forEach items="${output.goalList}" var="retAssetList">
	            	<c:if test="${retAssetList.goalTypeId eq 35015 and retAssetList.goalFamilyPartyId eq output.partyId}">
	            		<c:set var="retAssetCount" value="${retAssetCount+1}" />
				            <div class="rows fl">
				                <ul>
				                    <c:choose>
				                    	<c:when test="${retAssetList.assetName ne ' '}">
				                    		<li class="one fl">${retAssetList.assetName}</li>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<li class="one fl">-</li>
				                    	</c:otherwise>
				                    </c:choose>
				                    <li class="two fl"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retAssetList.presentValue}" /> Lacs</li>
				                    <li class="three fl"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${retAssetList.percentAllocated}" /></li>
				                </ul>
				            </div>
			        </c:if>
	            </c:forEach>
	  		  </div>     
	        </div><!-- end of right --> 
	      </div><!-- end of col -->
	    </div><!-- end of row -->
	    <hr>
    </c:if>        
    </div> <!-- end of box1 -->   
    <hr>
    <c:choose>
    <c:when test="${retAssetCount lt 2}">
        <div class="box2 variable">
	      <!--h2 class="secondary_heading">Risk Planning</h2-->
	      <c:set var="retTotalAssetPv" value="0" />
	      <c:set var="retTotalAssetFv" value="0" />
	      <c:set var="retGoalPercent" value="0" />
	      <c:set var="retGoalYear" value="0" />
	      <c:set var="retGoalMonth" value="0" />
	      <c:set var="retGoalRegular" value="0" />
	      <c:set var="retGoalLumpsSum" value="0" />
	      <c:set var="retInflation" value="0" />
		  <c:set var="retRate" value="0" />
	      <c:forEach items="${output.goalList}" var="retGoal">
	      	<c:if test="${retGoal.goalTypeId eq 35015 and retGoal.goalFamilyPartyId eq output.partyId}">
	      		<c:set var="retTotalAssetPv" value="${retTotalAssetPv+retGoal.presentValue}" />
	      		<c:set var="retTotalAssetFv" value="${retGoal.futureValueOfAssets}" />
	      		<c:set var="retGoalPercent" value="${retGoal.percentGoalReachable}" />
		      	<c:set var="retGoalYear" value="${retGoal.goalEndYear}" />
		      	<c:set var="retGoalMonth" value="${retGoal.goalMonth}" />
		      	<c:set var="retGoalRegular" value="${retGoal.regularInvestment}" />
		      	<c:set var="retGoalLumpsSum" value="${retGoal.goalPV}" />
		      	<c:set var="retInflation" value="${retGoal.description}" />
		      	<c:set var="retRate" value="${retGoal.futureAssetPercent}" />
	      	</c:if>
	      </c:forEach>
	      
	      <fmt:parseNumber var="retGoalCompletedPercent" type="number" value="${retGoalPercent}" />
			<c:choose>
	           	<c:when test="${retGoalCompletedPercent gt 99}">
	           		<c:set var="thumbStatus" value="achievable" />
	           		<c:set var="thumbStatusText" value="This goal can be achieved with existing asset" />
	           	</c:when>
	           	<c:when test="${retGoalCompletedPercent gt 81}">
	           		<c:set var="thumbStatus" value="partially_achievable" />
	           		<c:set var="thumbStatusText" value="You are almost there.Invest a little more" />
	           	</c:when>
	           	<c:when test="${retGoalCompletedPercent lt 80}">
	           		<c:set var="thumbStatus" value="not_achievable" />
	           		<c:set var="thumbStatusText" value="Place the first step,Invest now" />
	           	</c:when>
				<c:otherwise></c:otherwise>
	        </c:choose>
	      
	      <ul class="reset clearfix">      
	        <div class="row">
	        	<div class="col-md-2 col-sm-2 col-xs-2"></div>
	         	 <div class="col-md-8 col-sm-8 col-xs-8">
	             <div class="goal_detal_retire">
	              <h3 class="goal_cat_retire"><span class="main_cat">Retirement</span> - <span class="specific">Retirement</span></h3>
	              <div class="goal_asset_desc_retire rel clearfix">
	                <div class="goal_val_retire fl">
	                  <h5 class="heading">Monthly Expenses(<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.retExpense}" /> % Of Current Expense)</h5>
	                  <div class="clr"></div>
	                  <!---------------------*********************************************----------------------->
	                      <div class="leftt">
	                        <div class="value goal_value rel">
	                            <div class="lbl">Current</div>
	                            <div class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.monthlyExpenses/100000}" /></div>
	                        </div>
	                      </div><!--end of left -->
	                  <!---------------------*********************************************----------------------->
	                      <div class="rightt">
	                      	<div class="value goal_value rel">
	                        	<div class="lbl">Retirement</div>
	                            <div class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.futureMonthlyExpenses/100000}" /></div>
	                        </div>
	                      </div><!--end of right -->
	                      
	                      <div class="bottom">
	                      	<div class="value goal_value2 rel">
	                        	<div class="lbl">PV of Assets</div>
	                            <div class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retTotalAssetPv}" /></div>
	                        </div>                      
	                      </div><!-- end of bottom -->
	                </div>
	                <div class="goal_logo_year1 retirement_logo">
	                  <div class="year">${retGoalMonth}/${retGoalYear}</div>
	                </div>
	                <div class="asset_val fl">
	                  <h5 class="heading fr"> FV </h5>
	                  <div class="clr"></div>
	                  <div class="value asset_value rel"><span class="lbl">Corpus Needed</span><span class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.retirmenrShortfallAmt/100000}" /></span></div>
	                  <div class="value asset_value rel"><span class="lbl">FV of Assets</span><span class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retTotalAssetFv}" /></span></div>
	                </div>
	              </div>
	              <div class="slider_parent clearfix">
	                <div class="goal_slider fl ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="slider_ret" aria-disabled="false"><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%;"></a></div>
	                <div class="fr goal_slider_value" id="sliderVal_ret">0</div>
	                <script>
	                                    createSlider('#slider_ret',0, 100, 1,'#sliderVal_ret','${retGoalPercent}');
	                                    $("#sliderVal_ret").text("${retGoalPercent}");                	
	                                </script> 
	              </div>
	              <div class="result_stat">
	                <p class="centerAll paraTxt">Investment Required to Achieve Goal</p>
	                <div class="fl reg_invesment">
	                  <p class="amount centerAll"><span class="val rel"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retGoalRegular}" /></span></p>
	                  <p class="centerAll invst_txt">Regular Investment</p>
	                </div>
	                <div class="fr one_time_invesment">
	                  <p class="amount centerAll"><span class="val rel"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retGoalLumpsSum}" /></span></p>
	                  <p class="centerAll invst_txt">One time Investment</p>
	                </div>
	                <div class="clr">&nbsp;</div>
	                <div class="quick_status clearfix">
	                  <div class="fr centerAll txt_status not_achievable">Take the first step, Invest now</div>
	                </div>
	              </div>
	            </div>
				 </div>	
				<div class="col-md-2 col-sm-2 col-xs-2"></div>
	        
	        </div><!-- end of row -->
	        
	      </ul>
	    </div> <!-- end of box2 -->
	    <!--<h2 class="secondary_heading">What To Do?</h2>-->
	    <div class="box3 report">
	      <div class="row">
	          
	          <div class="col-md-12 col-sm-12 col-xs-12">
	          	<div class="sub_box2">	          	
	            	<div class="head">Assumptions/Disclaimer</div>
	            	<div class="sub_assumptions">
	                    <p>Inflation is assumed at <fmt:formatNumber type="number" maxFractionDigits="2" value="${retInflation}" />%. Investment need is calculated on the basis of <fmt:formatNumber type="number" maxFractionDigits="2" value="${retRate}" />% future returns. Assets are grown as per assumed growth rate of asset class. Assets are consumed in the order - Shares, mutual funds, deposits, bonds, gold and real estate in the order of liquidatability.A detailed retirement plan might be able to give you realistic figures.</p>
	            	</div><!-- end of sub_assumptions -->
	          	</div>
	          </div>      
	      </div><!-- end of Row -->
	    </div><!-- end of box3 -->
	    </div>
  
		  <div class="footer1 clearfix" style="page-break-after:always">
		    <div class="fl footer_tagline"></div>
		    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount" value="${pageCount+1}"/></div>
		  </div>
		</div>
	   </c:when>
	   <c:otherwise>
				</div>
			  <div class="footer1 clearfix" style="page-break-after:always">
			    <div class="fl footer_tagline"></div>
			    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount" value="${pageCount+1}"/></div>
			  </div>
			</div>
			<a name="RETIREMENT_PLANNING_${pageCount+1}"></a>
			<div class="wrapper">
			  <div class="header clearfix">
			    <div class="desc_heading fl">
			      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
			    </div>
			    <h1 class="page_heading fr">Goals - My Dreams</h1>
			  </div>
			  <div class="content" id="retire-planning">
			  		<div class="box2 variable">
				      <!--h2 class="secondary_heading">Risk Planning</h2-->
				      <c:set var="retTotalAssetPv" value="0" />
				      <c:set var="retTotalAssetFv" value="0" />
				      <c:set var="retGoalPercent" value="0" />
				      <c:set var="retGoalYear" value="0" />
				      <c:set var="retGoalMonth" value="0" />
				      <c:set var="retGoalRegular" value="0" />
				      <c:set var="retGoalLumpsSum" value="0" />
				      <c:set var="retInflation" value="0" />
		  			  <c:set var="retRate" value="0" />
				      <c:forEach items="${output.goalList}" var="retGoal">
				      	<c:if test="${retGoal.goalTypeId eq 35015 and retGoal.goalFamilyPartyId eq output.partyId}">
				      		<c:set var="retTotalAssetPv" value="${retTotalAssetPv+retGoal.presentValue}" />
				      		<c:set var="retTotalAssetFv" value="${retGoal.futureValueOfAssets}" />
				      		<c:set var="retGoalPercent" value="${retGoal.percentGoalReachable}" />
					      	<c:set var="retGoalYear" value="${retGoal.goalEndYear}" />
					      	<c:set var="retGoalMonth" value="${retGoal.goalMonth}" />
					      	<c:set var="retGoalRegular" value="${retGoal.regularInvestment}" />
					      	<c:set var="retGoalLumpsSum" value="${retGoal.goalPV}" />
					      	<c:set var="retInflation" value="${retGoal.description}" />
		      				<c:set var="retRate" value="${retGoal.futureAssetPercent}" />
				      	</c:if>
				      </c:forEach>
				      
				      <fmt:parseNumber var="retGoalCompletedPercent" type="number" value="${retGoalPercent}" />
						<c:choose>
				           	<c:when test="${retGoalCompletedPercent gt 99}">
				           		<c:set var="thumbStatus" value="achievable" />
				           		<c:set var="thumbStatusText" value="This goal can be achieved with existing asset" />
				           	</c:when>
				           	<c:when test="${retGoalCompletedPercent gt 81}">
				           		<c:set var="thumbStatus" value="partially_achievable" />
				           		<c:set var="thumbStatusText" value="You are almost there.Invest a little more" />
				           	</c:when>
				           	<c:when test="${retGoalCompletedPercent lt 80}">
				           		<c:set var="thumbStatus" value="not_achievable" />
				           		<c:set var="thumbStatusText" value="Place the first step,Invest now" />
				           	</c:when>
							<c:otherwise></c:otherwise>
				        </c:choose>
				      
				      <ul class="reset clearfix">      
				        <div class="row">
				        	<div class="col-md-2 col-sm-2 col-xs-2"></div>
				         	 <div class="col-md-8 col-sm-8 col-xs-8">
				             <div class="goal_detal_retire">
				              <h3 class="goal_cat_retire"><span class="main_cat">Retirement</span> - <span class="specific">Retirement</span></h3>
				              <div class="goal_asset_desc_retire rel clearfix">
				                <div class="goal_val_retire fl">
				                  <h5 class="heading">Monthly Expenses(<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.retExpense}" /> % Of Current Expense)</h5>
				                  <div class="clr"></div>
				                  <!---------------------*********************************************----------------------->
				                      <div class="leftt">
				                        <div class="value goal_value rel">
				                            <div class="lbl">Current</div>
				                            <div class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.monthlyExpenses/100000}" /></div>
				                        </div>
				                      </div><!--end of left -->
				                  <!---------------------*********************************************----------------------->
				                      <div class="rightt">
				                      	<div class="value goal_value rel">
				                        	<div class="lbl">Retirement</div>
				                            <div class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.futureMonthlyExpenses/100000}" /></div>
				                        </div>
				                      </div><!--end of right -->
				                      
				                      <div class="bottom">
				                      	<div class="value goal_value2 rel">
				                        	<div class="lbl">PV of Assets</div>
				                            <div class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retTotalAssetPv}" /></div>
				                        </div>                      
				                      </div><!-- end of bottom -->
				                </div>
				                <div class="goal_logo_year1 retirement_logo">
				                  <div class="year">${retGoalMonth}/${retGoalYear}</div>
				                </div>
				                <div class="asset_val fl">
				                  <h5 class="heading fr"> FV </h5>
				                  <div class="clr"></div>
				                  <div class="value asset_value rel"><span class="lbl">Corpus Needed</span><span class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.retirmenrShortfallAmt/100000}" /></span></div>
				                  <div class="value asset_value rel"><span class="lbl">FV of Assets</span><span class="val"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retTotalAssetFv}" /></span></div>
				                </div>
				              </div>
				              <div class="slider_parent clearfix">
				                <div class="goal_slider fl ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="slider_ret" aria-disabled="false"><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%;"></a></div>
				                <div class="fr goal_slider_value" id="sliderVal_ret">0</div>
				                <script>
				                                    createSlider('#slider_ret',0, 100, 1,'#sliderVal_ret','${retGoalPercent}');
				                                    $("#sliderVal_ret").text("${retGoalPercent}");                	
				                                </script> 
				              </div>
				              <div class="result_stat">
				                <p class="centerAll paraTxt">Investment Required to Achieve Goal</p>
				                <div class="fl reg_invesment">
				                  <p class="amount centerAll"><span class="val rel"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retGoalRegular}" /></span></p>
				                  <p class="centerAll invst_txt">Regular Investment</p>
				                </div>
				                <div class="fr one_time_invesment">
				                  <p class="amount centerAll"><span class="val rel"><fmt:formatNumber type="number" maxFractionDigits="2" value="${retGoalLumpsSum}" /></span></p>
				                  <p class="centerAll invst_txt">One time Investment</p>
				                </div>
				                <div class="clr">&nbsp;</div>
				                <div class="quick_status clearfix">
				                  <div class="fr centerAll txt_status not_achievable">Take the first step, Invest now</div>
				                </div>
				              </div>
				            </div>
							 </div>	
							<div class="col-md-2 col-sm-2 col-xs-2"></div>
				        
				        </div><!-- end of row -->
				        
				      </ul>
				    </div> <!-- end of box2 -->
				    <!--<h2 class="secondary_heading">What To Do?</h2>-->
				    <div class="box3 report">
				      <div class="row">
				          
				          <div class="col-md-12 col-sm-12 col-xs-12">
				          	<div class="sub_box2">	          	
				            	<div class="head">Assumptions/Disclaimer</div>
				            	<div class="sub_assumptions">
				                    <p>Inflation is assumed at <fmt:formatNumber type="number" maxFractionDigits="2" value="${retInflation}" />%. Investment need is calculated on the basis of <fmt:formatNumber type="number" maxFractionDigits="2" value="${retRate}" />% future returns. Assets are grown as per assumed growth rate of asset class. Assets are consumed in the order - Shares, mutual funds, deposits, bonds, gold and real estate in the order of liquidatability.A detailed retirement plan might be able to give you realistic figures.</p>
				            	</div><!-- end of sub_assumptions -->
				          	</div>
				          </div>      
				      </div><!-- end of Row -->
				    </div><!-- end of box3 -->
			  </div>
			  <div class="footer1 clearfix" style="page-break-after:always">
			    <div class="fl footer_tagline"></div>
			    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount" value="${pageCount+1}"/></div>
			  </div>
			</div>	
	   </c:otherwise>
    </c:choose>
</c:if>
<!-- Goals -->
<style>
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0px 0px 0px 195px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 0px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:10px }
#emergency-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; position:relative;margin-left: 5px;display: inline-block; }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0px;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table_goal{width:600px; margin:20px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table_goal li{list-style-type:none; display:inline-block; font-size:11px; font-family:sans-serif;font-weight:bold;}
.wrapper .table_goal ul{margin-left: 0px; margin-top:0px;}

.wrapper .table_goal .table-header{width:100%; height:20px;background-color: <%=colorCode%>;}

.wrapper .table_goal .table-header li.one{line-height:20px; width:33%; margin-left: 0px !important; text-align:center;color:#FFF;}
.wrapper .table_goal .table-header li.two{line-height:20px; width:33%; margin-left:0px;text-align:center;color:#FFF;}
.wrapper .table_goal .table-header li.three{line-height:20px; width:33%; margin-left: 0px;text-align:center;color:#FFF;}
.wrapper .table-header li.four{line-height:15px; width:100px;width: 27px;margin-left: 46px;}

.wrapper .table_goal .rows{margin-top:10px; width:100%;margin-left: 13%;;}
.wrapper .table_goal .rows ul li.one{width: 33% !important; color:#646464;}
.wrapper .table_goal .rows ul li.two{width: 33% !important; color:#646464;}
.wrapper .table_goal .rows ul li.three{width: 33% !important; color:#646464;}
.wrapper .table_goal .rows ul li.four{width:0px !important; color:#646464;}

/*************** Table CSS End ****************/

/***Analysis Report Starts***/
.clr {
clear: both;
overflow: hidden;
height: 0;
}
.rel {
position: relative;
}
.centerAll {
text-align: center;
}
.goal_cat {
	font-size: 12px;
	margin: 0 0 10px 0;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	width: 100%;
	height: 13px;
}
.goal_cat .specific {
	color: <%=colorCode%>
}
.goal_asset_desc{width:530px; margin:0px auto;}

.goal_asset_desc .goal_val {
	width: 250px;
	height: 88px;
	background: <%=colorCodeLeft%>;
	margin: 0 15px 0 0;
	-moz-border-radius: 20px 0 0 20px;
	-webkit-border-radius: 20px 0 0 20px;
	border-radius: 20px 0 0 20px;
	-moz-box-shadow: -1px 2px 2px 0px #6C6C6C;
	-webkit-box-shadow: -1px 2px 2px 0px #6C6C6C;
	box-shadow: -1px 2px 2px 0px #6C6C6C;
}
.goal_asset_desc .asset_val {
	width: 250px;
	height: 88px;
	background: <%=colorCode%>;
	margin: 0 0 0 15px;
	-moz-border-radius: 0 20px 20px 0;
	-webkit-border-radius: 0 20px 20px 0;
	border-radius: 0 20px 20px 0;
	-moz-box-shadow: 1px 2px 2px 0px #6C6C6C;
	-webkit-box-shadow: 1px 2px 2px 0px #6C6C6C;
	box-shadow: 1px 2px 2px 0px #6C6C6C;
}
.goal_asset_desc .goal_val .heading {
	font-size: 11px;
	text-align: center;
	margin: 5px 12px 0 0;
	color: #fff;
	float: none
}
.goal_asset_desc .asset_val .heading {
	color: #fff;
	font-size: 11px;
	text-align: center;
	margin: 5px 0 0;
	float: none
}
.goal_asset_desc .goal_value {
	font-size: 13px;
	width: 48px;
	margin: 10px 0 20px 100px;
	text-align: center;
	border-bottom: 1px dashed;
	padding: 0 0 1px 0;
	color: #fff
}
.goal_asset_desc .goal_value .lbl, .asset_value .lbl {
	position: absolute;
	top: 3px;
	font-size: 11px;
	left: -30px;
}
.goal_asset_desc .goal_value:after {
	content: "lac";
	position: absolute;
	font-size: 12px;
	top: 3px;
	right: -18px;
}
.goal_asset_desc .goal_value:before {
	content: "";
	background: url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center;
	width: 8px;
	height: 11px;
	top: 4px;
	left: -10px;
	display: block;
	position: absolute;
}

.goal_asset_desc .asset_value {
	font-size: 13px;
	width: 40px;
	margin: 10px 0 20px 140px;
	text-align: center;
	border-bottom: 1px dashed;
	padding: 0 0 1px 0;
	color: #fff
}
.goal_asset_desc .asset_value:after {
	content: "lac";
	position: absolute;
	font-size: 12px;
	top: 3px;
	right: -16px;
	color: #fff
}
.goal_asset_desc .asset_value:before {
	content: "";
	background: url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center;
	width: 8px;
	height: 11px;
	top: 4px;
	left: -8px;
	display: block;
	position: absolute;
}
.goal_detal2 .goal_logo_year1 {
	height: 82px;
	width: 82px;
	background: #3A3A3A;
	position: absolute;
	margin: -5px 0px 0px 0px;
	top: 9px;
	left: 222px;
	-moz-border-radius: 41px;
	-webkit-border-radius: 41px;
	border-radius: 41px;
	-moz-box-shadow: 0px 0px 0px 4px #FFF;
	-webkit-box-shadow: 0px 0px 0px 4px #FFF;
	box-shadow: 0px 0px 0px 4px #FFF;
}
.goal_detal2 .goal_logo_year1 .year {
	text-align: center;
	color: #FFF;
	margin: 57px 0 0;
	font-size: 13px;
}
.goal_detal2 .goal_logo_year1.travel_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/travel_goal.png) no-repeat center 7px
}
.goal_detal2 .goal_logo_year1.car_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/car_goal.png) no-repeat center 7px
}
.goal_detal2 .goal_logo_year1.edu_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/education_goal.png) no-repeat center 7px
}
.goal_detal2 .goal_logo_year1.business_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/business_goal.png) no-repeat center 7px
}
.goal_detal2 .goal_logo_year1.property_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/property_goal.png) no-repeat center 7px !important;  
}
.goal_detal2 .goal_logo_year1.spcial_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/special_goal.png) no-repeat center 7px
}
.goal_detal2 .goal_logo_year1.retirement_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/retirement_plan_report.png) no-repeat center 7px
}
.goal_detal2 .goal_logo_year1.wedding_logo {
	background: #3A3A3A url(${pageContext.request.contextPath}/images/diyimages/wedding_goal_report.png) no-repeat center 7px
}
.goal_detal2 .slider_parent {
	width: 210px;
	margin: 8px auto 8px 320px;
}
.goal_detal2 .goal_slider {background: url(${pageContext.request.contextPath}/images/diyimages/slider_bg.png) no-repeat center center;
	width: 141px;
	height: 20px;
	border: none;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	box-shadow: none;
	-moz-border-radius: 0;
	-webkit-border-radius: 0;
	border-radius: 0;
	position: relative
}
.goal_detal2 .goal_slider:after {
	content: "";
	display: block;
	width: 157px;
	height: 20px;
	position: absolute;
	background: url(${pageContext.request.contextPath}/images/diyimages/slider_bg.png) no-repeat center center;
	left: -14px;
}
.goal_detal2 .ui-slider .ui-slider-handle {
background url(../${pageContext.request.contextPath}/images/diyimages/slider_button_rpt.png) no-repeat;
	height: 8px;
	width: 8px;
	border: none;
	-moz-box-shadow: 0px 1px 2px 0px #000;
	-webkit-box-shadow: 0px 1px 2px 0px #000;
	box-shadow: 0px 1px 2px 0px #000;
	top: 7px !important;
}
.goal_detal2 .goal_slider_value {
	font-size: 12px;
	border: none;
	font-family: "none";
	width: 22px;
	position: relative;
	margin: 4px 0 0 10px;
}
.goal_detal2 .goal_slider_value:after {
	content: "%";
	display: block;
	position: absolute;
	color: #3A3A3A;
	top: 0;
	right: -13px;
	font-size: 12px;
}
.goal_detal2 .result_stat {
	border: 3px solid #3a3a3a;
	-moz-border-radius: 19px;
	-webkit-border-radius: 19px;
	border-radius: 19px;
	width: 98%;
	margin: 0 auto;
	height: 94px
}
.goal_detal2 .result_stat .achievable_txt {
	text-align: center;
	font-size: 13px;
	line-height: 13px;
	margin: 9px 0 0;
}
.goal_detal2 .result_stat .paraTxt {
	margin: 2px 0 2px 0;
	font-size: 13px
}
.goal_detal2 .result_stat .invst_txt {
	font-size: 10px
}
.goal_detal2 .result_stat .reg_invesment {
	width: 49%;
	border-right: 1px solid #bddcec;
	height: 58px;
}
.goal_detal2 .result_stat .one_time_invesment {
	width: 50%;
	height: 58px;
}
.goal_detal2 .result_stat .amount {
	font-size: 14px;
	margin: 15px 0 3px 0;
	position: relative
}
.goal_detal2 .result_stat .amount .val:before {
	content: "";
	display: block;
	position: absolute;
	background: url(${pageContext.request.contextPath}/images/diyimages/black_rupee.png) no-repeat center center;
	width: 8px;
	height: 11px;
	left: -10px;
	top: 3px;
}
.goal_detal2 .result_stat .thumb_status {
	width: 56px;
	border-top: 1px solid #3a3a3a;
	-moz-border-radius: 12px 0 0 0;
	-webkit-border-radius: 12px 0 0 0;
	border-radius: 12px 0 0 0;
}
.goal_detal2 .result_stat .txt_status {
	background: #f0f0f0;
	border-top: 1px solid #3a3a3a;
	border-left: 1px solid #3a3a3a;
	width: 100%;
	font-size: 12px;
	line-height: 18px;
	color: #fff;
	-moz-border-radius: 0 0 16px 17px;
	-webkit-border-radius: 0 0 16px 17px;
	border-radius: 0 0 16px 17px;
}
.goal_detal2 .result_stat .txt_status.achievable_txt_status {
	width: 100%;
	border-left: 0;
	-moz-border-radius: 0 0 18px 18px;
	-webkit-border-radius: 0 0 18px 18px;
	border-radius: 0 0 18px 18px;
}
.goal_detal2 .result_stat .achievable_yes_thumb {
	background: url(${pageContext.request.contextPath}/images/diyimages/achivable_yes_thumb.png) no-repeat center center;
	width: 59px;
	height: 49px;
	margin: 12px auto 14px;
}
.goal_detal2 .result_stat .quick_status .achievable {
	background: #2D951B;
}
.goal_detal2 .result_stat .quick_status .partially_achievable {
	background: #E69528;
}
.goal_detal2 .result_stat .quick_status .not_achievable {
	background: #D21C45;
}
.goal_detal2 .result_stat2 .paraTxt {
	margin: 2px 0 2px 0;
	font-size: 13px
}

.goal_detal2{width:100%; margin:0px auto 0px auto;}
/* Slider*/
.goal_detal2 .goal_slider { /*background: url(/FIINFRA-APP/images/diyimages/slider_bg.png) no-repeat center center; width: 192px;*/ height: 20px; border: none; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; position:relative }
.goal_detal2 .goal_slider:after { content:""; display:block; width: 157px; height: 20px; position:absolute; background: url(${pageContext.request.contextPath}/images/diyimages/slider_bg.png) no-repeat center center; left: -14px; }
.goal_detal2 .ui-slider .ui-slider-handle {
background url(../${pageContext.request.contextPath}/images/diyimages/slider_button_rpt.png) no-repeat; height: 8px; width: 8px; border: none; -moz-box-shadow: 0px 1px 2px 0px #000; -webkit-box-shadow: 0px 1px 2px 0px #000; box-shadow: 0px 1px 2px 0px #000; top: 7px !important; }
.goal_detal2 .goal_slider_value { font-size:12px; border:none; font-family: "none"; width: 22px; position:relative; margin:5px 40px 0 0px; }
#goals_my_dreams .goal_detal2 .goal_slider_value:after { content: "%"; display: block; position: absolute; color: #3A3A3A; top: 0; right:-13px; font-size: 12px; }
.goal_detal2 .result_stat { border:3px solid #3a3a3a; -moz-border-radius: 19px; -webkit-border-radius: 19px; border-radius: 19px; width:34%; margin: 0 0px 0px 120px; height:94px; float:left;}
.goal_detal2 .result_stat2 { border:3px solid #3a3a3a; -moz-border-radius: 19px; -webkit-border-radius: 19px; border-radius: 19px; width:34%; margin: 0 0px 0px 10px; height:94px; float:left; }

/***Analysis Report Ends***/

/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}
.question{color:#8b8b8b; margin-top:0px; font-size:12px; font-family:sans-serif;line-height:15px; text-align:justify;}
.left{width:100%;margin:15px 0px; display:inline-block;}
.right{width:100%;margin:15px 0px; display:inline-block;}
select[multiple], select.form-control[multiple]{height:60px !important;}
.space-5{max-height: 1px; min-height: 1px; overflow: hidden; margin: 5px 0;}
hr{margin:5px 0px !important;}
.head{height:20px; width:100%; background-color:<%=colorCode%>; text-align:center; line-height:20px; }
.sub_box1{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; padding:5px; line-height:15px;}
.sub_box2{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; color:#fff;margin-top:20px;}
.box3{margin-top:20px;}
.sub_assumptions{padding:0px 5px;}
.sub_assumptions p{margin-top:2px; color:#3a3a3a;}
.bb{border-bottom:1px #ccc solid;}
.br{border-right:1px #ccc solid;}
.table1 p{font-size:12px; margin-top:2px; padding-left:5px;}
.ins_name div{text-align:center; font-size:10px;}
label p{font-size:10px;}
.client_img{width:80px; height:80px; padding: 5px 10px; border:1px solid #ccc;}
.goal_for{font-size:15px; margin:20px 0px 0px 10px; font-weight:bold;}
.client_nm{color:#09F; text-decoration:underline;}
.goal_val .leftt{width:50%;}
.goal_val .rightt{width:50%;}


</style>
<script>
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,svalue) {
		  
	    $(ctrlName).slider({
	        min: minVal,
	        max: maxVal,
	        step: stepBy,
	        slide: function (event, ui) {
	            $(ctrlTextBox).text(ui.value);
	   
	        }
	    });
	    $(ctrlName).slider('value', svalue);
	}
</script>
<c:set var="goalIdss" value="0" />
<c:set var="goalIdAdv" value="0" />

<c:forEach items="${output.goalList}" var="goalListDetails" varStatus="iCounter">
	<c:if test="${(not fn:contains(goalIdss, goalListDetails.fpGoalId)) and (goalListDetails.goalTypeId eq 35006 or goalListDetails.goalTypeId eq 35001 or goalListDetails.goalTypeId eq 35004 or goalListDetails.goalTypeId eq 35013 or goalListDetails.goalTypeId eq 35008 or goalListDetails.goalTypeId eq 35003 or goalListDetails.goalTypeId eq 35012 or goalListDetails.goalTypeId eq 35016 or goalListDetails.goalTypeId eq 35005) }">
    	<c:set var="goalIdss" value="${goalIdss}_${goalListDetails.fpGoalId}" />
    	<c:set var="goalIdAdv" value="${goalListDetails.fpGoalId}" />
    	<c:set var="thumbStatus" value="" />
		<c:set var="thumbStatusText" value="" />
		
		<fmt:parseNumber var="goalCompletedPercent" type="number" value="${goalListDetails.percentGoalReachable}" />
		<c:choose>
           	<c:when test="${goalCompletedPercent gt 99}">
           		<c:set var="thumbStatus" value="achievable" />
           		<c:set var="thumbStatusText" value="This goal can be achieved with existing asset" />
           	</c:when>
           	<c:when test="${goalCompletedPercent gt 81}">
           		<c:set var="thumbStatus" value="partially_achievable" />
           		<c:set var="thumbStatusText" value="You are almost there.Invest a little more" />
           	</c:when>
           	<c:when test="${goalCompletedPercent lt 80}">
           		<c:set var="thumbStatus" value="not_achievable" />
           		<c:set var="thumbStatusText" value="Place the first step,Invest now" />
           	</c:when>
			<c:otherwise></c:otherwise>
        </c:choose>
        
        <c:set var="goalLogo" value="spcial_logo" />
		<c:choose>
           	<c:when test="${goalListDetails.goalTypeName eq 'Car'}">
           		<c:set var="goalLogo" value="car_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Education'}">
           		<c:set var="goalLogo" value="edu_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Start Business'}">
           		<c:set var="goalLogo" value="business_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Property or House'}">
           		<c:set var="goalLogo" value="property_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Travel or Vacation'}">
           		<c:set var="goalLogo" value="travel_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Others'}">
           		<c:set var="goalLogo" value="spcial_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Retirement'}">
           		<c:set var="goalLogo" value="retirement_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Wedding'}">
           		<c:set var="goalLogo" value="wedding_logo" />             		
           	</c:when>
           	<c:when test="${goalListDetails.goalTypeName eq 'Target Corpus'}">
           		<c:set var="goalLogo" value="" />             		
           	</c:when>
			<c:otherwise></c:otherwise>
        </c:choose>
    	<c:set var="goalNameLink1" value="${fn:toUpperCase(goalListDetails.goalName)}" />
    	<c:set var="goalNameLink1" value="${fn:replace(goalNameLink1,' ','_')}" />
    	<c:set var="goalNameLink2" value="${fn:toUpperCase(goalListDetails.goalDescription)}" />
    	<c:set var="goalNameLink2" value="${fn:replace(goalNameLink2,' ','_')}" />
		 <a name="${goalNameLink1}'S_${goalNameLink2}_${pageCount+1}"></a>
    	<div class="wrapper">
    	 <div class="header clearfix">
		    <div class="desc_heading fl">
		      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
		    </div>
		    <h1 class="page_heading fr">Goals - My Dreams</h1>
		  </div>
		  <div class="content" id="emergency-planning">  
		    <div class="goal_summary">																
				<h3>${goalListDetails.goalName}'s ${goalListDetails.goalDescription}</h3>
			</div>
			<hr>
		    <div class="box2 variable" style="margin-top: 20px;">
		      <!--h2 class="secondary_heading">Risk Planning</h2-->
		      
		      <ul class="reset clearfix">      
		        <div class="row">
		        	
		         	 <div class="col-md-12 col-sm-12 col-xs-12">
		             <div class="goal_detal2">
		              <h3 class="goal_cat"><span class="main_cat">${goalListDetails.goalTypeName}</span> - <span class="specific">${goalListDetails.goalDescription}</span></h3>
		              <div class="goal_asset_desc rel clearfix">
		                <c:choose>
		                	<c:when test="${goalListDetails.loanTakenOrNot eq '1'}">
		                		<div class="goal_val fl">
				                  <h5 class="heading">Down Payment PV</h5>
				                  <div class="clr"></div>
				                  	<div class="leftt">
				                        <div class="value goal_value rel">
				                            <span class="lbl" style="margin: 0px 0px 0px -23px;">Goal</span>
				                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.goalAmountPv / 100000}" />
				                        </div>
				                    </div>
				                  <div class="rightt"><div class="value goal_value rel"><span class="lbl" style="margin: 0px 0px 0px -23px;">Asset</span><fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.presentValue}" /></div></div><!--end of right -->
				                </div>
				                <div class="goal_logo_year1 ${goalLogo}">
				                  <div class="year">${goalListDetails.goalMonth}/${goalListDetails.goalEndYear}</div>
				                </div>
				                <div class="asset_val fl">
				                  <h5 class="heading fr">Down Payment FV </h5>
				                  <div class="clr"></div>
				                  <div class="value asset_value rel"><span class="lbl">Goal</span><fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.futureValueOfGoal / 100000}" /></div>
				                  <div class="value asset_value rel"><span class="lbl">Asset</span>
				                  	<c:choose>
				                  		<c:when test="${goalListDetails.presentValue gt '0' or goalListDetails.presentValue gt '0.0' or goalListDetails.presentValue gt '0.00'}">
				                  			<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.futureValueOfAssets}" />
				                  		</c:when>
				                  		<c:otherwise>
				                  			<fmt:formatNumber type="number" maxFractionDigits="2" value="0" />
				                  		</c:otherwise>
				                  	</c:choose>
				                  </div>
				                </div>
		                	</c:when>
		                	<c:otherwise>
		                		<div class="goal_val fl">
				                  <h5 class="heading">PV</h5>
				                  <div class="clr"></div>
				                  	<div class="leftt">
				                        <div class="value goal_value rel">
				                            <span class="lbl" style="margin: 0px 0px 0px -23px;">Goal</span>
				                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.goalAmountPv / 100000}" />
				                        </div>
				                    </div>
				                  <div class="rightt"><div class="value goal_value rel"><span class="lbl" style="margin: 0px 0px 0px -23px;">Asset</span><fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.presentValue}" /></div></div><!--end of right -->
				                </div>
				                <div class="goal_logo_year1 ${goalLogo}">
				                  <div class="year">${goalListDetails.goalMonth}/${goalListDetails.goalEndYear}</div>
				                </div>
				                <div class="asset_val fl">
				                  <h5 class="heading fr">FV </h5>
				                  <div class="clr"></div>
				                  <div class="value asset_value rel"><span class="lbl">Goal</span><fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.futureValueOfGoal / 100000}" /></div>
				                  <div class="value asset_value rel"><span class="lbl">Asset</span>
				                  	<c:choose>
				                  		<c:when test="${goalListDetails.presentValue gt '0' or goalListDetails.presentValue gt '0.0' or goalListDetails.presentValue gt '0.00'}">
				                  			<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalListDetails.futureValueOfAssets}" />
				                  		</c:when>
				                  		<c:otherwise>
				                  			<fmt:formatNumber type="number" maxFractionDigits="2" value="0" />
				                  		</c:otherwise>
				                  	</c:choose>
				                  </div>
				                </div>
		                	</c:otherwise>
		                </c:choose>
		                </div>
		              <div class="slider_parent clearfix">
		                <div class="goal_slider fl ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="slider_${iCounter.index}" aria-disabled="false"><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%;"></a></div>
		                <div class="fr goal_slider_value" id="sliderVal_${iCounter.index}">0</div>
		                <script>
			                createSlider('#slider_${iCounter.index}',0, 100, 1,'#sliderVal_${iCounter.index}','${goalCompletedPercent}');
			                $("#sliderVal_${iCounter.index}").text("${goalCompletedPercent}");                	
		                </script> 
		              </div>
		              <c:choose>
		              	<c:when test="${goalCompletedPercent eq 100}">
		              		<div class="result_stat">
				                <div class="achievable_yes_thumb"></div>
				                <div class="quick_status clearfix">
				                  <div class="centerAll txt_status achievable_txt_status ${thumbStatus}">This goal can be achieved with existing asset</div>
				                </div>
			              	</div>
		              	</c:when>
		              	<c:otherwise>
		              		<div class="result_stat">
			                	<p class="centerAll paraTxt">Investment Required to Achieve Goal</p>
			                <div class="fl reg_invesment">
				                  <p class="amount centerAll"><span class="val rel">${goalListDetails.regularInvestment}</span></p>
				                  <p class="centerAll invst_txt">Regular Investment</p>
			                </div>
			                <div class="fr one_time_invesment">
				                  <p class="amount centerAll"><span class="val rel">${goalListDetails.goalPV}</span></p>
				                  <p class="centerAll invst_txt">One time Investment</p>
			                </div>
			                <div class="clr">&nbsp;</div>
			                <div class="quick_status clearfix">
			                  <div class="fr centerAll txt_status ${thumbStatus}">${thumbStatusText}</div>
			                </div>
			              </div>
		              	</c:otherwise>
		              </c:choose>
		              <div class="result_stat2">
		                <p class="centerAll paraTxt">Advisor's Note</p>
		                <p>${goalListDetails.goalNote}</p>
		              </div>
		              
		            </div>
					 </div>	
					
		        
		        </div><!-- end of row -->
		        
		      </ul>
		    </div> <!-- end of box2 -->
		    <!--<h2 class="secondary_heading">What To Do?</h2>-->
		    <c:choose>
		    	<c:when test="${output.fpplanTypeId eq '522002' }">
		    		<div class="table_goal clearfix">
			            <div class="table-header fl">
			                <ul>
			                    <li class="one fl">Asset Name</li>
			                    <li class="two fl">Present Value</li>
			                    <li class="three fl">% achieved through assets</li>
			                </ul>
			            </div>
			            <c:forEach items="${output.goalList}" var="goalassetList">
			            	<c:if test="${goalIdAdv eq goalassetList.fpGoalId}">
			            		<c:if test="${goalassetList.percentAllocated gt '0'}">
			            			<div class="rows fl">
						                <ul>
						                    <li class="one fl">${goalassetList.assetName}</li>
						                    <li class="two fl">${goalassetList.presentValue} Lacs</li>
						                    <li class="three fl">${goalassetList.percentAllocated}%</li>
						                </ul>
						            </div>
			            		</c:if>
			            	</c:if>
			            </c:forEach>   
			  		</div>
		    	</c:when>
		    	<c:otherwise>
		    		<!-- <div class="table_goal clearfix">
			            <div class="table-header fl">
			                <ul>
			                    <li class="one fl">Asset Name</li>
			                    <li class="two fl">Present Value</li>
			                    <li class="three fl">% achieved through assets</li>
			                </ul>
			            </div>
			            
			            <div class="rows fl">
			                <ul>
			                    <li class="one fl">Home</li>
			                    <li class="two fl">50 Lacs</li>
			                    <li class="three fl">50%</li>
			                </ul>
			            </div>   
			  		</div> -->
		    	</c:otherwise>
		    </c:choose>
		          
		    <c:choose>
		    	<c:when test="${output.fpplanTypeId eq '522001' }">        
				    <div class="box3 report">
				      <div class="row">
				          
				          <div class="col-md-12 col-sm-12 col-xs-12">
				          	<div class="sub_box2">	          	
				            	<div class="head">Assumptions/Disclaimer</div>
				            	<div class="sub_assumptions">
				                    <p>Inflation is assumed at ${goalListDetails.description}%. Investment need is calculated on the basis of ${goalListDetails.futureAssetPercent}% future returns.Assets are grown as per assumed growth rate of asset class. Assets are consumed in the order - Shares, mutual funds, deposits, bonds, gold and real estate in the order of liquidatability.All current investments have been aligned to the earliest goal and any surpluses have been aligned to subsequent goals.</p>
				            	</div><!-- end of sub_assumptions -->
				          	</div>
				          </div>      
				      </div><!-- end of Row -->
				    </div><!-- end of box3 -->
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		  </div>
		  
		  <div class="footer1 clearfix" style="page-break-after:always">
		    <div class="fl footer_tagline"></div>
		    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
		  </div>
		</div>
    </c:if>    		
</c:forEach>

<!-- Emergency Planning -->

<style>
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_planning_category { margin:0px 0px 0px 195px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_planning_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_planning_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_planning_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_planning_category .fund_status .heading { height:10px }
#emergency-planning .emergency_planning_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_planning_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_planning_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_planning_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_planning_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: justify; height: auto; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_planning_category .ui-progressbar { background:#FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; margin-left:5px; position:relative }
#emergency-planning .emergency_planning_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_planning_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_planning_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table{width:381px; margin:-30px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table li{list-style-type:none; display:inline-block; font-size:10px; font-family:sans-serif;font-weight:bold;}
.wrapper .table ul{margin-left: -20px; margin-top:-31px;}

.wrapper .table .table-header{width:100%; height:20px;background-color: <%=colorCode%>;}

.wrapper .table .table-header li.one{line-height:15px; width:120px; margin-left: 30px !important;color:#FFF;}
.wrapper .table .table-header li.two{line-height:15px; width:130px; margin-left:32px;color:#FFF;}
.wrapper .table .table-header li.three{line-height:15px; width:100px; margin-left: 15px;color:#FFF;}
.wrapper .table-header li.four{line-height:15px; width:100px;width: 27px;margin-left: 46px;}

.wrapper .table .first-row{margin-top:10px;}
.wrapper .table .first-row ul li.one{width: 120px !important; margin: 0px 0px 0px 0px; color:#646464; margin-left: 40px !important;}
.wrapper .table .first-row ul li.two{width: 130px !important; margin: 0px 0px 0px 14px; color:#646464;}
.wrapper .table .first-row ul li.three{width: 100px !important; color:#646464;}
.wrapper .table .first-row ul li.four{width:0px !important; color:#646464;}

.wrapper .table .second-row{margin-top:10px;}
.wrapper .table .second-row ul li.one{width: 120px !important; margin: 0px 0px 0px 0px; color:#646464; margin-left: 40px !important; }
.wrapper .table .second-row ul li.two{width: 130px !important; margin: 0px 0px 0px 14px; color:#646464;}
.wrapper .table .second-row ul li.three{width: 100px !important; color:#646464;}
.wrapper .table .second-row ul li.four{width:0px !important; color:#646464;}

.wrapper .table .third-row{margin-top:10px;}
.wrapper .table .third-row ul li.one{width: 120px !important; margin: 0px 0px 0px 0px; color:#646464; margin-left: 40px !important;}
.wrapper .table .third-row ul li.two{width: 130px !important; margin: 0px 0px 0px 14px; color:#646464;}
.wrapper .table .third-row ul li.three{width: 100px !important; color:#646464;}
.wrapper .table .third-row ul li.four{width:0px !important; color:#646464;}
/*************** Table CSS End ****************/


/*************** Bottom Table CSS Start ****************/
.wrapper .table1{width:100%; margin:0px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px; height:86px;}
.wrapper .table1 li{list-style-type:none; display:inline-block; font-size:10px; font-family:sans-serif;font-weight:bold;}
.wrapper .table1 ul{margin-left: -20px; margin-top:-31px;}

.wrapper .table1 .table-header1{width:100%; height:20px;background-color:<%=colorCode%> !important; line-height: 20px;text-align: center;font-size: 12px;color:#fff;}

.jm_meter .first { bottom: 0px; left: -21px; position: absolute; }
.jm_meter .second { left: -19px; top: 44px; -webkit-transform: rotate(25.5deg); -ms-transform: rotate(25.5deg); transform: rotate(25.5deg); position: absolute; }
.jm_meter .third { top: -20px; left: 55px; -webkit-transform: rotate(71deg); -ms-transform: rotate(71deg); transform: rotate(71deg); position: absolute;}
.jm_meter .fourth { right: 113px; top: -19px; -webkit-transform: rotate(-68deg); -ms-transform: rotate(-68deg); transform: rotate(-68deg); position: absolute;}
.jm_meter .fifth { bottom: 69px; right: 44px; -webkit-transform: rotate(-36deg); -ms-transform: rotate(-36deg); transform: rotate(-36deg); position: absolute; }
.jm_meter .sixth { bottom: 0px; right: 20px; position: absolute;}

.emer_progressbar{margin-top: 7px;margin-left: 5px;color: white;font-size: 10px;font-weight: bold;display: inline-block;vertical-align: top;}

/*************** Bottom Table CSS End ****************/

/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}
.question{color:#8b8b8b; margin-top:0px; font-size:12px; font-family:sans-serif;line-height:15px; text-align:justify;}
.left{width:100%;margin:15px 0px; display:inline-block;}
.right{width:100%;margin:15px 0px; display:inline-block;}
select[multiple], select.form-control[multiple]{height:60px !important;}
.space-5{max-height: 1px; min-height: 1px; overflow: hidden; margin: 5px 0;}
hr{margin:5px 0px !important;}
.head{height:20px; width:100%; background-color:<%=colorCode%>; text-align:center; line-height:20px; }
.sub_box1{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; padding:5px; line-height:15px;}
.sub_box2{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; color:#fff;margin-top:20px;}
.box3{margin-top:20px;}
.sub_assumptions{padding:0px 5px;}
.sub_assumptions p{margin-top:2px; color:#3a3a3a;}
.bb{border-bottom:1px #ccc solid;}
.br{border-right:1px #ccc solid;}
.table1 p{font-size:12px; margin-top:2px; padding-left:5px;}
.ins_name div{text-align:center; font-size:10px;}
label p{font-size:10px;}


/ JM Meter *******/
#meter { /* height:40%; position:relative */  margin: 20px 0px 20px 0px;width: 100%;  }
.jm_meter { background:url(${pageContext.request.contextPath}/images/diyimages/jim_meter.png) no-repeat left center; width:328px; height:126px; margin:30px 0 0 240px; position:relative; padding: 0 60px 2px 0; border-bottom: 1px solid rgba(255, 255, 255, 0.14); }
/*#dashboard .jm_meter .arrow { background:url(../images/jm_meter_arrow.png) no-repeat center center; width:33px; height:137px; display:block; position: relative; z-index: 10; top: 13px; left: 45%; }*/
.jm_meter .arrow { width: 9px; height: 103px; display: block; z-index: 10;/ background: #fff;*/ margin: 18px auto 0; transform-origin:bottom; -ms-transform-origin:bottom; / IE 9 / -webkit-transform-origin:bottom; / Chrome, Safari, Opera */ ; position:relative }
.jm_meter .arrow.current{top:20px; left:10px;}
.jm_meter .ideal{top:-80px; left: -1px;}
.jm_meter .arrow.ideal:before { content: ""; border-left: 7px solid rgba(0, 0, 0, 0); border-right: 8px solid rgba(0, 0, 0, 0); border-bottom: 93px solid #000; position: absolute; top: 0px; left: -4px; }
.jm_meter .arrow.current:before { content: ""; border-left: 7px solid rgba(0, 0, 0, 0); border-right: 8px solid rgba(0, 0, 0, 0); border-bottom: 93px solid <%=colorCode%>; position: absolute; top: 0px; left: -4px; }
.jm_meter .staus { position:absolute; font-size:12px; color:#000; font-family: sans-serif; }
.jm_meter .average { left: 34%; top: -20px; }
.jm_meter .not_rank { left: -58px; bottom: 30%; }
.jm_meter .very_good { bottom: 30%; right:5px; }
.jm_meter .arrow_base { background:url(${pageContext.request.contextPath}/images/diyimages/arrow_base.png) no-repeat center center; width:46px; height:43px; display:block; margin:-98px auto 0; position:relative; z-index:100 }
#meter .head1 { color:#000; font-size:16px; font-family:"Aller Bold"; text-align:center; margin: -4px 58px 0; }
.jm_meter .indication{color: #3A3A3A;font-family: "Aller Bold";font-size: 12px;text-transform: uppercase;  position: absolute;right: -98px;top: -26px;}
.jm_meter .indication .current{  margin: 0 0 10px 0;}
.jm_meter .indication .current .background{  background: <%=colorCode%>;float: left;  height: 14px;width: 14px;margin: 0 10px 0 0;border: 1px solid #000;}
.jm_meter .indication .ideal .background{  background: #000;float: left; height: 14px; width: 14px; margin: 0 10px 0 0; border: 1px solid #000;}
/ JM Meter End *******/

</style>
<c:if test="${fn:contains(fpSection, '39001')}">
<a name="EMERGENCY_FUND_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Emergency Planning</h1>
  </div>
  <div class="content" id="emergency-planning">
  
    <div class="box1 fixed">
    <h3 style="margin: 0px 0px 12px 0px;">Information Collected</h3>
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">   
       	 <div class="fl">  
            <div class="form-group">
                    <div class="controls col-xs-12 col-sm-12 col-md-12"><!-- #section:custom/checkbox.switch -->
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-xs-7">
                            	<div class="question">On a scale of 1 to 5 , how would you rate your confidence on being able to handle an emergency - like a health set back or sudden loss of income?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94001_1" class="btn btn-primary margin_lr">
                                        <input type="radio" value="1">                                        
                                        <p>1</p>
                                    </label>                                    

                                    <label id="94001_2" class="btn btn-primary margin_lr">
                                        <input type="radio" value="2">
                                        <p>2</p>
                                    </label>

                                    <label id="94001_3" class="btn btn-primary margin_lr">
                                        <input type="radio" value="3">
                                        <p>3</p>
                                    </label>
                                    
                                    <label id="94001_4" class="btn btn-primary margin_lr">
                                        <input type="radio" value="4">
                                        <p>4</p>
                                    </label>
                                    
                                    <label id="94001_5" class="btn btn-primary margin_lr">
                                        <input type="radio" value="5">
                                        <p>5</p>
                                    </label>
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-xs-7">
                            	<div class="question">Have you faced any emergency situation in the past?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94002_1" class="btn btn-primary margin_lr">
                                        <input type="radio" value="1">                                        
                                        <p>Yes</p>
                                    </label>                                    

                                    <label id="94002_0" class="btn btn-primary margin_lr">
                                        <input type="radio" value="2">
                                        <p>No</p>
                                    </label>
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                            	<div class="question">If yes, what kind of emergency?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-8 col-sm-8 col-xs-8 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94003" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Job Loss</p>
                                    </label>                                    

                                    <label id="94004" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="2">
                                        <p>Natural Calamity</p>
                                    </label>
                                    
                                    <label id="94005" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Accident</p>
                                    </label>                                    

                                    <label id="94006" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="2">
                                        <p>Health Issue</p>
                                    </label>
                                    
                                    <label id="94007" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Other</p>
                                    </label>                                    

                                    
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-xs-7">
                            	<div class="question">Were you able to manage this emergency without having to borrow or sell your assets?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94008_1" class="btn btn-primary margin_lr">
                                        <input type="radio" value="1">                                        
                                        <p>Yes</p>
                                    </label>                                    

                                    <label id="94008_0" class="btn btn-primary margin_lr">
                                        <input type="radio" value="2">
                                        <p>No</p>
                                    </label>
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-xs-7">
                            	<div class="question">No. of months you can manage without an income</div><!-- end of question -->
                            </div>   
                            <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94138" class="btn btn-primary margin_lr">
                                        <input type="radio" value="1">                                        
                                        <p>1-3</p>
                                    </label>                                    

                                    <label id="94139" class="btn btn-primary margin_lr">
                                        <input type="radio" value="2">
                                        <p>3-6</p>
                                    </label>

                                    <label id="94140" class="btn btn-primary margin_lr">
                                        <input type="radio" value="3">
                                        <p>6-9</p>
                                    </label>
                                    
                                    <label id="94141" class="btn btn-primary margin_lr">
                                        <input type="radio" value="4">
                                        <p>9-12</p>
                                    </label>
                                    
                                    <label id="94142" class="btn btn-primary margin_lr">
                                        <input type="radio" value="5">
                                        <p>>12</p>
                                    </label>
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                            	<div class="question">What kind of fall back have you created for emergencies?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-8 col-sm-8 col-xs-8 pl pr">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94517" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Employer provided leave</p>
                                    </label>                                    

                                    <label id="94518" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="2">
                                        <p>Friends and family</p>
                                    </label>
                                    
                                    <label id="94519" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Money set aside separately</p>
                                    </label>   
                                    
                                    <label id="94520" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">                                        
                                        <p>Other</p>
                                    </label>                                    

                                    
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                            	<div class="question">If Other</div><!-- end of question -->
                            </div>   
                            <div class="col-md-8 col-sm-8 col-xs-8 pl pr">                            	
                                <label class="pull-right">
                                    <input id="94520_other" class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" aria-required="true" aria-invalid="false" value="">
                                </label>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        
                    </div>
            </div>
        </div><!-- end of left -->
       </div><!-- end of col -->
    </div><!-- end of row -->
    <br>
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">                
        <!-- <div class="right fl"> -->            
	      <div id="meter" class="clearfix">
            <div class="jm_meter center-block"><div class="indication">
                  <div class="current">
                    <div class="background"></div>
                    current</div>
                  <div class="clr"></div>
                  <div class="ideal">
                    <div class="background"></div>
                    ideal</div>
                  <div class="clr"></div>
                </div><span class="range first" id="first"></span> <span class="range second" id="second"></span> <span class="range third" id="third"></span> <span class="range fourth" id="fourth"></span> <span class="range fifth" id="fifth"></span> <span class="range sixth" id="sixth"></span> <span class="arrow current"></span> <span class="arrow ideal"></span> <span class="arrow_base"></span></span>
              <h4 class="head1 fl">Emergency Planning</h4>
            </div>
          </div>    
        <!-- </div>end of right --> 
      </div><!-- end of col -->
    </div><!-- end of row -->
     <hr>   
    </div> <!-- end of box1 -->   
    <hr>    
    <div class="box2 variable fl">
      <!--h2 class="secondary_heading">Risk Planning</h2-->
      <ul class="reset clearfix">
        <div class="row">
        <li>
          <div class="emergency_planning_category rel clearfix" style="width: 421px !important;">
            <h3 class="category_name">Suggestions</h3>
            <div class="emergency_desc fl" style="width: 210px !important;">
              <p class="txt">Sudden health issues, loss of job can happen to anyone. It is very important to be prepared.</p>
            </div>
            <div class="goal_logo_year health_setback"> </div>
            <div class="emergency_action fr" style="width: 210px !important;">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.currentEmergencyFund}" /></span>/-</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Additional Req</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.minimumEmergencyFund}" /></span>/-</div>
                </div>
              </div>
              <div id="emer_progressbar">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <fmt:parseNumber var="miniEmer" value="${output.minimumEmergencyFund}" />
              <c:choose>
              	<c:when test="${miniEmer gt 0 }">
              		<c:set var="emerPercent" value="${(output.currentEmergencyFund/output.minimumEmergencyFund)*100}" />
              		<c:if test="${emerPercent gt 100}">
              			<c:set var="emerPercent" value="100" />
              		</c:if>
              	</c:when>
              	<c:otherwise>
              		<c:set var="emerPercent" value="0" />
              	</c:otherwise>
              </c:choose>
			  <div class="percentage_slider"><fmt:formatNumber type="number" maxFractionDigits="2" value="${emerPercent}" />%</div>
              <p class="txt">Set aside ${output.emergencyFundsRequiredMonths} months worth of expenses. Build corpus-keep them in bank accounts or liquid mutual funds.Ensure joint holding with someone who you trust.</p>
            </div>
          </div>
        </li>
        </div><!-- end of row -->
        
      </ul>
    </div> <!-- end of box2 -->
    <!--<h2 class="secondary_heading">What To Do?</h2>-->
    <div class="box3 report">
      <div class="row">
          
          <div class="col-md-12 col-sm-12 col-xs-12">
          	<div class="sub_box2">	          	
            	<div class="head">Assumptions/Disclaimer</div>
            	<div class="sub_assumptions">
                    <p>Emergency situations may arise due to natural calamities, accidents, changes in economic environment or more.Though we can't control it, we can respond better with some planning.If not prepared, an emergency might leave you poorer, debt ridden or helpless.You may fall down, but will you be able to get back on your feet again?</p>
            	</div><!-- end of sub_assumptions -->
          	</div>
          </div>      
      </div><!-- end of Row -->
    </div><!-- end of box3 -->
    
  </div>
  
  <div class="footer1 clearfix" style="page-break-after:always">
    <div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
  </div>
</div>
</c:if>

<script>
$(document).ready(function(){
	
	/*** Common Function For Progessbar Starts ***/

	
function createProgressbar(ctrlName,val) {

    $(ctrlName).progressbar({
      value: val
    });    
}

/*** Common Function For Progessbar Ends ***/
   createProgressbar('#emer_progressbar',${output.currentEmergencyFund / output.minimumEmergencyFund * 100});
   createProgressbar('#progressbar1',${output.currentpersonalInsuranceCoverAmt / output.accidentInsurance * 100});
   createProgressbar('#progressbar2',${output.currentInsurance / output.idealInsurance * 100});
   createProgressbar('#progressbar3',${output.currentHealthInsurance / output.healthInsuranceCoverAmount * 100});
   createProgressbar('#progressbar4',${output.currentCriticalIllnesCoverAmout / output.criticalIllnessInsurance * 100});
	
});
</script>

<style>
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
.margin_li{margin:0px 10px !important;}
.margin_top{margin-top:35px !important;}
.margin_lr{margin:0px 2px !important;}
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
/* Basic Css Ends*/
.wrapper { width:792px; margin:0 auto; height:1124px; color:#3a3a3a; font-family: 'allerregular'; }
.header { height:65px; background:#1d87bd url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; margin-top:0px !important; background-size: 792px auto;background-size: 792px auto;}
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { height:1041px }
.footer1 { height:18px; background:#c0c0c0;font-size:12px; font-family: "Aller Bold"; line-height: 19px;margin:-26px 0px 0px 0px;}
.footer1 .footer_tagline { margin:0 0 0 22px; }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }

.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode%>; font-size: 20px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 10px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:348px; text-align:center; line-height: 45px; }
.theme_color { color: <%=colorCode%>; }
/***Common Css Ends***/
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:190px; height:100px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:190px; height:100px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:35px; width:35px; background: #3A3A3A; position: absolute; margin: 0; top:-20px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/images/diyimages/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0px 0px;width:381px; }
#emergency-planning .fixed {height: 310px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 15px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 10px; margin:20px 0 0; padding:0 7px 0 19px; line-height: 12px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align:justify; }
#emergency-planning .emergency_category .fund_status { margin: 4px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:10px }
#emergency-planning .emergency_category .fund_status .value { color:#fff; font-size:10px; }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/images/diyimages/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:30%; margin-left:10px; }
#emergency-planning .emergency_category .fund_status .additional { width:61%; }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 10px; padding: 0 8px; line-height: 12px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background: #FFF; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 118px; margin: 5px auto 3px; overflow: hidden; position:relative;margin-left: 5px;display: inline-block; }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #000; display:inline-block; width:1px; margin:0; position:absolute }
#emergency-planning .emergency_category .ui-progressbar .segments .first { left: -3px; }
#emergency-planning .emergency_category .ui-progressbar .segments .second { left:15px }
#emergency-planning .emergency_category .ui-progressbar .segments .third { left:35px }
#emergency-planning .emergency_category .ui-progressbar .segments .fourth { left: 55px; }
#emergency-planning .emergency_category .ui-progressbar .segments .fifth { left: 75px; }
#emergency-planning .emergency_category .ui-progressbar .segments .six { left: 95px; }
#emergency-planning .emergency_category .ui-progressbar .segments .seven { left: 115px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eight { left: 135px; }
#emergency-planning .emergency_category .ui-progressbar .segments .nine { left: 155px; }
#emergency-planning .emergency_category .ui-progressbar .segments .ten { left: 175px; }
#emergency-planning .emergency_category .ui-progressbar .segments .eleven { left: 192px; }
#emergency-planning .variable {height:auto; }
#emergency-planning .variable > ul li{margin: 34px 0 0; display:inline-block;}
#emergency-planning .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath%>) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 0px;   background-size: 792px auto;}
#emergency-planning .report { height: 140px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid <%=colorCode%>; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

/*************** Table CSS Start ****************/
.wrapper .table{width:381px; margin:-30px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .table li{list-style-type:none; display:inline-block; font-size:10px; font-family:sans-serif;font-weight:bold;}
.wrapper .table ul{margin-left: -20px; margin-top:-31px;}

.wrapper .table .table-header{width:100%; height:20px;background-color: <%=colorCode%>;}

.wrapper .table .table-header li.one{line-height:15px; width:120px; margin-left: 30px !important;color:#FFF;}
.wrapper .table .table-header li.two{line-height:15px; width:130px; margin-left:32px;color:#FFF;}
.wrapper .table .table-header li.three{line-height:15px; width:100px; margin-left: 15px;color:#FFF;}
.wrapper .table-header li.four{line-height:15px; width:100px;width: 27px;margin-left: 46px;}

.wrapper .table .first-row{margin-top:10px;}
.wrapper .table .first-row ul li.one{width: 120px !important; margin: 0px 0px 0px 0px; color:#646464; margin-left: 40px !important;}
.wrapper .table .first-row ul li.two{width: 130px !important; margin: 0px 0px 0px 14px; color:#646464;}
.wrapper .table .first-row ul li.three{width: 100px !important; color:#646464;}
.wrapper .table .first-row ul li.four{width:0px !important; color:#646464;}

.wrapper .table .second-row{margin-top:10px;}
.wrapper .table .second-row ul li.one{width: 120px !important; margin: 0px 0px 0px 0px; color:#646464; margin-left: 40px !important; }
.wrapper .table .second-row ul li.two{width: 130px !important; margin: 0px 0px 0px 14px; color:#646464;}
.wrapper .table .second-row ul li.three{width: 100px !important; color:#646464;}
.wrapper .table .second-row ul li.four{width:0px !important; color:#646464;}

.wrapper .table .third-row{margin-top:10px;}
.wrapper .table .third-row ul li.one{width: 120px !important; margin: 0px 0px 0px 0px; color:#646464; margin-left: 40px !important;}
.wrapper .table .third-row ul li.two{width: 130px !important; margin: 0px 0px 0px 14px; color:#646464;}
.wrapper .table .third-row ul li.three{width: 100px !important; color:#646464;}
.wrapper .table .third-row ul li.four{width:0px !important; color:#646464;}
/*************** Table CSS End ****************/


/*************** Bottom Table CSS Start ****************/
.wrapper .table1{width:100%; margin:0px auto 0px auto; background-color: #E6E6E6;padding-bottom: 15px; height:86px;}
.wrapper .table1 li{list-style-type:none; display:inline-block; font-size:10px; font-family:sans-serif;font-weight:bold;}
.wrapper .table1 ul{margin-left: -20px; margin-top:-31px;}

.wrapper .table1 .table-header1{width:100%; height:20px;background-color:<%=colorCode%> !important; line-height: 20px;text-align: center;font-size: 12px;color:#fff;}

/*************** Bottom Table CSS End ****************/


.progressbar1{margin-top: 7px;margin-left: 5px;color: white;font-size: 10px;font-weight: bold;display: inline-block;vertical-align: top;}
.progressbar2{margin-top: 7px;margin-left: 5px;color: white;font-size: 10px;font-weight: bold;display: inline-block;vertical-align: top;}
.progressbar3{margin-top: 7px;margin-left: 5px;color: white;font-size: 10px;font-weight: bold;display: inline-block;vertical-align: top;}
.progressbar4{margin-top: 7px;margin-left: 5px;color: white;font-size: 10px;font-weight: bold;display: inline-block;vertical-align: top;}

.percentage_slider{font-size: 12px; color: #fff; float: right;margin-right: 20px;margin-top: -18px;}

/*********** OTHER ***********/
.pl{padding-left:0px !important;}
.pr{padding-right:0px !important;}
.question{color:#8b8b8b; margin-top:0px; font-size:12px; font-family:sans-serif;line-height:15px; text-align:justify;}
.left{width:50%;margin:15px 0px; display:inline-block; border-right:1px solid #e5e5e5;}
.right{width:50%;margin:15px 0px; display:inline-block;}
select[multiple], select.form-control[multiple]{height:60px !important;}
.space-5{max-height: 1px; min-height: 1px; overflow: hidden; margin: 5px 0;}
hr{margin:5px 0px !important;}
.head{height:20px; width:100%; background-color:<%=colorCode%>; text-align:center; line-height:20px; }
.sub_box1{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; padding:5px; line-height:15px;}
.sub_box2{text-align:justify; font-size:12px; font-family:sans-serif; border:1px solid <%=colorCode%>; color:#fff;margin-top:20px;}
.box3{margin-top:20px;}
.sub_assumptions{padding:0px 5px;}
.sub_assumptions p{margin-top:2px; color:#3a3a3a;}
.bb{border-bottom:1px #ccc solid;}
.br{border-right:1px #ccc solid;}
.table1 p{font-size:12px; margin-top:2px; padding-left:5px;}
.ins_name div{text-align:center; font-size:10px;}

input[type=checkbox].ace.ace-switch.ace-switch-4 + .lbl::before,
input[type=checkbox].ace.ace-switch.ace-switch-5 + .lbl::before {
 content: "YES\a0\a0\a0\a0\a0\a0\a0\a0\a0\a0\a0NO" !important;
}
input[id="healthAmtRisk"] {font-size:12px;}
input[id="lifeAmtRisk"] {font-size:12px;}
input[id="criticalAmtRisk"] {font-size:12px;}
input[id="accidentAmtRisk"] {font-size:12px;}
input[id="assetAmtRisk"] {font-size:12px;}
</style>
<c:if test="${fn:contains(fpSection, '39003')}">
<a name="RISK_PLANNING_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Risk Planning</h1>
  </div>
  <div class="content" id="emergency-planning">
    <div class="box1 fixed">
    <h3>Information Collected</h3>  
        <div class="left fl">            
	        <div class="form-group clearfix"> 
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="question">In the event of death or disability of the key earning member in your household, how sure are you that your family will be safe and comfortable? Rate on a scale of 1-5 
                        </div><!-- end of question -->
                     </div>                       
                    <!-- Slider Starts Here -->                  
                    <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="range_parent">
                                  <div class="scale clearfix">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">5</span> </div>
                                      <div class="help-block ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="input-size-slider11"><div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min"></div><span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 21%;"></span></div>
                                    </div>
                                    <div class="space-10"></div>
                                    
                                  </div>
                                </div>
                              </div><!-- Slider Ends Here --> 
               </div>   
            <hr>  
            <div class="form-group">
                    <div class="controls col-xs-12 col-sm-12 col-md-12"><!-- #section:custom/checkbox.switch -->
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-9">
                            	<div class="question">Do you have Life Insurance?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-3 col-sm-3 col-xs-3">                            	
                                <label class="pull-right">
                                    <input name="switch-field-1" id="dolifeRisk" class="ace ace-switch ace-switch-4 btn-flat" type="checkbox" />
                                    <span class="lbl"></span>
                                </label>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <div class="space-10"></div>
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">
                            	<div class="question">If Yes, what kind?</div><!-- end of question -->
                            </div>   
                            <div class="col-md-8 col-sm-8 col-xs-8">                            	
                                <div data-toggle="buttons" class="btn-group pull-right">
                                    <label id="94014" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="1">
                                        <img src="${pageContext.request.contextPath}/images/diyimages/term.png">
                                        <!--<p>Term</p>-->
                                    </label>                                    

                                    <label id="94015" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="2">
                                        <img src="${pageContext.request.contextPath}/images/diyimages/endowment.png">
                                        <!--<p>Endowment</p>-->
                                    </label>

                                    <label id="94016" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="3">
                                        <img src="${pageContext.request.contextPath}/images/diyimages/unitLinked_plans.png">
                                        <!--<p>Unit Linked</p>-->
                                    </label>
                                    
                                    <label id="94017" class="btn btn-primary margin_lr">
                                        <input type="checkbox" value="3">
                                        <img src="${pageContext.request.contextPath}/images/diyimages/money-back.png">
                                        <!--<p>Money Back</p>-->
                                    </label>
                                </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4"></div>   
                            <div class="col-md-8 col-sm-8 col-xs-8">                            	
                                <div class="pull-right ins_name">
                                    <div class="col-md-3 col-sm-3 col-xs-3 pr">Term</div>                                    
									<div class="col-md-3 col-sm-3 col-xs-3 pl pr">Endowment</div> 
                                    <div class="col-md-3 col-sm-3 col-xs-3">Unit Linked</div> 
                                    <div class="col-md-3 col-sm-3 col-xs-3">Money Back</div>                                     
                                </div>
                            </div>
                        </div>
                        <div class="space-10"></div>
                        <div class="row">
                            <div class="col-md-8 col-sm-8 col-xs-8">
                            	<div class="question">How much cover does your Life Insurance provide (in Rs)</div><!-- end of question -->
                            </div>   
                            
                            <div class="col-md-4 col-sm-4 col-xs-4 pl">
                                  <div class="counter_parent">
                                  	<c:if test="${output.fpplanTypeId eq '522002' }">
                                  		<c:choose>
	                                  		<c:when test="${comprehensiveDetails.lifeAmount gt '0'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="lifeAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.lifeAmount}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="lifeAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="0">
	                                  		</c:otherwise>
	                                  	</c:choose>
                                  	</c:if>
                                  	<c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003' }">
                                  		<c:choose>
	                                  		<c:when test="${comprehensiveDetails.doLife eq '1'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="lifeAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.lifeAmount}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="lifeAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="0">
	                                  		</c:otherwise>
	                                  	</c:choose>
                                  	</c:if>
                                  </div>                                
                            </div>
                            
                        </div><!-- /section:custom/checkbox.switch -->
                    </div>
                </div>
        </div><!-- end of left -->         
        <div class="right fl">            
	           <div class="form-group">
                    <div class="controls col-xs-12 col-sm-12 col-md-12"><!-- #section:custom/checkbox.switch -->
                        <div class="row">
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-7 col-sm-7 col-xs-7 pl pr">
                            	<div class="question">Do you have Health Insurance?</div><!-- end of question -->
                             </div>   
                           	 <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <label class="pull-right">
                                    <input name="switch-field-1" id="doHealthRisk" class="ace ace-switch ace-switch-4 btn-flat" type="checkbox" />
                                    <span class="lbl"></span>
                                </label>
                             </div>
                            </div>
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-4 col-sm-4 col-xs-4 pl pr">
                            	<div class="question">If Yes, how much?</div><!-- end of question -->
                             </div>   
                           	 <div class="col-md-8 col-sm-8 col-xs-8 pl pr">                            	
                                <div class="counter_parent">
                                    <c:if test="${output.fpplanTypeId eq '522002' }">
                                    	<c:choose>
	                                  		<c:when test="${comprehensiveDetails.healthAmt gt '0'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="healthAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.healthAmt}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="healthAmtRisk" placeholder="0" aria-required="true" aria-invalid="false">
	                                  		</c:otherwise>
	                                  	</c:choose>
                                    </c:if>
                                    <c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003' }">
                                    	<c:choose>
	                                  		<c:when test="${comprehensiveDetails.doHealth eq '1'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="healthAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.healthAmt}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="healthAmtRisk" placeholder="0" aria-required="true" aria-invalid="false">
	                                  		</c:otherwise>
	                                  	</c:choose>
                                    </c:if>
                                  </div>
                             </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <div class="space-5"></div>
                        <div class="row">
                        	<div class="col-md-6 col-sm-6 col-xs-6">
                            	<div class="question">Who all in the family are covered under this Health Insurance? Please name them</div><!-- end of question -->
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                            	<c:choose>
                            		<c:when test="${comprehensiveDetails.doHealth eq '1'}">
                            			<p style="font-size: 11px;">${comprehensiveDetails.familyCover}</p>
                            		</c:when>
                            		<c:otherwise>
                            			<p>-</p>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                        </div><!-- end of row -->
                        <hr>
                        <div class="row">
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-7 col-sm-7 col-xs-7 pl pr">
                            	<div class="question">Are you covered for possible critical illness?</div><!-- end of question -->
                             </div>   
                           	 <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <label class="pull-right">
                                    <input name="switch-field-1" id="doCriticalRisk" class="ace ace-switch ace-switch-4 btn-flat" type="checkbox" />
                                    <span class="lbl"></span>
                                </label>
                             </div>
                            </div>
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-4 col-sm-4 col-xs-4 pl pr">
                            	<div class="question">If Yes, how much?</div><!-- end of question -->
                             </div>   
                           	 <div class="col-md-8 col-sm-8 col-xs-8 pl pr">                            	
                                <div class="counter_parent">
                                    <c:if test="${output.fpplanTypeId eq '522002'}">
                                    	<c:choose>
	                                  		<c:when test="${comprehensiveDetails.criticalAmt gt '0'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="criticalAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.criticalAmt}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="criticalAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="0">
	                                  		</c:otherwise>
	                                  	</c:choose>
                                    </c:if>
                                    <c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003' }">
                                    	<c:choose>
	                                  		<c:when test="${comprehensiveDetails.doCritical eq '1'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="criticalAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.criticalAmt}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="criticalAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="0">
	                                  		</c:otherwise>
                                  		</c:choose>
                                    </c:if>
                                  </div>
                             </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-7 col-sm-7 col-xs-7 pl pr">
                            	<div class="question">Are you covered for possible accidents?</div><!-- end of question -->
                             </div>   
                           	 <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <label class="pull-right">
                                    <input name="switch-field-1" id="doAccidentRisk" class="ace ace-switch ace-switch-4 btn-flat" type="checkbox" />
                                    <span class="lbl"></span>
                                </label>
                             </div>
                            </div>
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-4 col-sm-4 col-xs-4 pl pr">
                            	<div class="question">If Yes, how much?</div><!-- end of question -->
                             </div>   
                           	 <div class="col-md-8 col-sm-8 col-xs-8 pl pr">                            	
                                <div class="counter_parent">
                                    <c:if test="${output.fpplanTypeId eq '522002'}">
                                    	<c:choose>
	                                  		<c:when test="${comprehensiveDetails.accidentAmt gt '0'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="accidentAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.accidentAmt}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="accidentAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="0">
	                                  		</c:otherwise>
	                                  	</c:choose>
                                    </c:if>
                                    <c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003' }">
                                    	<c:choose>
	                                  		<c:when test="${comprehensiveDetails.doAccident eq '1'}">
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="accidentAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.accidentAmt}" />">
	                                  		</c:when>
	                                  		<c:otherwise>
	                                  			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="accidentAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="0">
	                                  		</c:otherwise>
	                                  	</c:choose>
                                    </c:if>
                                  </div>
                             </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                        <hr>
                        <div class="row">
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-7 col-sm-7 col-xs-7 pl pr">
                            	<div class="question">Are your assets like house and contents covered?</div><!-- end of question -->
                             </div>   
                           	 <div class="col-md-5 col-sm-5 col-xs-5 pl pr">                            	
                                <label class="pull-right">
                                    <input name="switch-field-1" id="doAssetRisk" class="ace ace-switch ace-switch-4 btn-flat" type="checkbox" />
                                    <span class="lbl"></span>
                                </label>
                             </div>
                            </div>
                            <div class="col-md-6 com-sm-6 col-xs-6">
                           	 <div class="col-md-4 col-sm-4 col-xs-4 pl pr">
                            	<div class="question">If Yes, how much?</div><!-- end of question -->
                             </div>
                             <div class="col-md-8 col-sm-8 col-xs-8 pl pr">                            	
                                <div class="counter_parent">
                                	<c:choose>
	                                	<c:when test="${comprehensiveDetails.doAsset eq '1'}">
                                			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="assetAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${comprehensiveDetails.assetAmt}" />">
                                		</c:when>
                                		<c:otherwise>
                                			<input class="col-xs-9 range_counter answers required  Number1 valid pull-right" type="text" id="assetAmtRisk" placeholder="0" aria-required="true" aria-invalid="false" value="0">
                                		</c:otherwise>
                                	</c:choose>
                        		</div>
                             </div>
                            </div>
                        </div><!-- /section:custom/checkbox.switch -->
                    </div>
                                             
                    
                </div>
        </div><!-- end of right --> 
    </div> <!-- end of box1 -->   
    <hr>    
    <div class="box2 variable">
      <!--h2 class="secondary_heading">Risk Planning</h2-->
      <ul class="reset clearfix">
        <li class="margin_li">
          <div class="emergency_category rel clearfix">
            <h3 class="category_name">Early Death</h3>
            <div class="emergency_desc fl">
              <p class="txt">Unfortunate death of an earning
                member can leave family's future
                questionable. Financial backing can soften impact and ensure family's safety.</p>
            </div>
            <div class="goal_logo_year early_death"> </div>
            <div class="emergency_action fr">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.currentInsurance}" /></span>/-</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Additional Req</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.idealInsurance}" /></span>/-</div>
                </div>
              </div>
              <div id="progressbar2">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <fmt:parseNumber var="miniLife" value="${output.idealInsurance}" />
              <c:choose>
              	<c:when test="${miniLife gt 0 }">
              		<c:set var="lifePercent" value="${(output.currentInsurance/output.idealInsurance)*100}" />
              		<c:if test="${lifePercent gt 100}">
              			<c:set var="lifePercent" value="100" />
              		</c:if>
              	</c:when>
              	<c:otherwise>
              		<c:set var="lifePercent" value="0" />
              	</c:otherwise>
              </c:choose>
			  <div class="percentage_slider"><fmt:formatNumber type="number" maxFractionDigits="2" value="${lifePercent}" />%</div>
              <p class="txt">
              	<fmt:parseNumber var="diffLife" type="number" value="${output.necessaryInsurance}" />
              	<c:if test="${diffLife > 0 }">
              		Get yourself a term life insurance policy for Rs. <fmt:formatNumber type="number" maxFractionDigits="2" value="${diffLife}" />
                </c:if>
                <c:if test="${diffLife <= 0 }">
                 	Excellent! You have adequate life insurance coverage.
                </c:if>
                <br>
                Your Insurance Is Calculated Using 
                <c:choose>
                	<c:when test="${output.insruanceMethod == 0}"> HLV </c:when>
                	<c:when test="${output.insruanceMethod == 1}"> Expense </c:when>
                	<c:when test="${output.insruanceMethod == 2}"> Income </c:when>
                </c:choose> Method.
              </p>
            </div>
          </div>
        </li>
        <li>
          <div class="emergency_category rel clearfix">
            <h3 class="category_name">Health Setback</h3>
            <div class="emergency_desc fl">
              <p class="txt">Our hurried lifestyle makes us vulnerable to many illnesses. Many families' suffer financially due to hospitalization expenses.Insurance can afeguard your wealth and give peace of mind.</p>
            </div>
            <div class="goal_logo_year health_setback"> </div>
            <div class="emergency_action fr">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.currentHealthInsurance}" /></span>/-</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Additional Req</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.healthInsuranceCoverAmount}" /></span>/-</div>
                </div>
              </div>
              <div id="progressbar3">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <fmt:parseNumber var="miniHealth" value="${output.healthInsuranceCoverAmount}" />
              <c:choose>
              	<c:when test="${miniHealth gt 0 }">
              		<c:set var="healthPercent" value="${(output.currentHealthInsurance/output.healthInsuranceCoverAmount)*100}" />
              		<c:if test="${healthPercent gt 100}">
              			<c:set var="healthPercent" value="100" />
              		</c:if>
              	</c:when>
              	<c:otherwise>
              		<c:set var="healthPercent" value="0" />
              	</c:otherwise>
              </c:choose>
			  <div class="percentage_slider"><fmt:formatNumber type="number" maxFractionDigits="2" value="${healthPercent}" />%</div>
              <p class="txt">
              	<fmt:parseNumber var="currentHealth" type="number" value="${output.currentHealthInsurance}" />
              	<fmt:parseNumber var="idealHealth" type="number" value="${output.healthInsuranceCoverAmount}" />
              	<fmt:parseNumber var="diffHealth" type="number" value="${idealHealth - currentHealth}" />
              	<c:if test="${diffHealth > 0 }">
              		Get Basic health insurance of Rs. <fmt:formatNumber type="number" maxFractionDigits="2" value="${diffHealth}" /> to all family.
                </c:if>
                <c:if test="${diffHealth <= 0 }">
                 	Excellent! You have adequate health insurance coverage.
                </c:if>
              </p>
            </div>
          </div>
        </li>
        <c:if test="${output.fpplanTypeId eq '522002' }">
        <li class="margin_li margin_top fl">
          <div class="table clearfix">
            	
		            <div class="table-header fl">
		                <ul>
		                    <li class="one fl" style="font-size: 11px;">Policy Name</li>
		                    <li class="two fl" style="font-size: 11px;">Insured Name</li>
		                    <li class="three fl" style="font-size: 11px;">Sum Assured</li>
		                </ul>
		            </div>    
		            <c:forEach items="${output.documentList}" var="insuranceList">
		            	<c:if test="${insuranceList.documentId eq '47007'}">
			            	<div class="first-row fl">
				                <ul>
				                    <li class="one fl" style="font-size: 10px;">${insuranceList.documentName}</li>
				                    <li class="two fl" style="font-size: 10px;">${insuranceList.flag}</li>
				                    <li class="three fl" style="font-size: 10px;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${insuranceList.fileName}" /></li>
				                </ul>
				            </div>
			            </c:if>
		            </c:forEach>
  		  </div><!-- End "Table" -->
		</li>
		
 		<li class="fl">
 			<div class="table clearfix">
  				
  					<div class="table-header fl">
		                <ul>
		                    <li class="one fl" style="font-size: 11px;">Policy Name</li>
		                    <li class="two fl" style="font-size: 11px;">Insured Name</li>
		                    <li class="three fl" style="font-size: 11px;">Sum Assured</li>
		                </ul>
		            </div> 
		            <c:forEach items="${output.documentList}" var="insuranceList">
		            	<c:if test="${insuranceList.documentId eq '48026'}">
			            	<div class="first-row fl">
				                <ul>
				                    <li class="one fl" style="font-size: 10px;">${insuranceList.documentName}</li>
				                    <li class="two fl" style="font-size: 10px;">${insuranceList.flag}</li>
				                    <li class="three fl" style="font-size: 10px;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${insuranceList.fileName}" /></li>
				                </ul>
				            </div>
			            </c:if>
		            </c:forEach>
  			</div><!-- End "Table" -->	
  		</li>
  		</c:if>
  		</ul>
  		</div>
  		<c:choose>
  			<c:when test="${output.fpplanTypeId eq '522002' and (lifeCount >= 3 or healthCount >= 3 or criticalCount >= 3 or accidentCount >= 3)}">
  				</div>
  				<div class="footer1 clearfix" style="page-break-after:always">
				    <div class="fl footer_tagline"></div>
				    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
				  </div>
				  </div>
				  <a name="RISK_PLANNING_${pageCount+1}"></a>
				  <div class="wrapper">
					  <div class="header clearfix">
					    <div class="desc_heading fl">
					      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
					    </div>
					    <h1 class="page_heading fr">Risk Planning</h1>
					  </div>
					  <div class="content" id="emergency-planning">
					  	<div class="box2 variable">
					  		<ul class="reset clearfix">
					        <li class="margin_li">
					          <div class="emergency_category rel clearfix">
					            <h3 class="category_name">Disabilities</h3>
					            <div class="emergency_desc fl">
					              <p class="txt">Disability to an earning member will increase expenses and also affect income. Disability can happen because of critical illnesses or accidents.</p>
					            </div>
					            <div class="goal_logo_year disabilities"> </div>
					            <div class="emergency_action fr">
					              <div class="fund_status clearfix">
					                <div class="fl available">
					                  <h6 class="heading">Available</h6>
					                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.currentCriticalIllnesCoverAmout}" /></span>/-</div>
					                </div>
					                <div class="fr additional">
					                  <h6 class="heading">Additional Req</h6>
					                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.criticalIllnessInsurance}" /></span>/-</div>
					                </div>
					              </div>
					              <div id="progressbar4">
					                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
					              </div>
					              <fmt:parseNumber var="miniCri" value="${output.criticalIllnessInsurance}" />
					              <c:choose>
					              	<c:when test="${miniCri gt 0 }">
					              		<c:set var="criPercent" value="${(output.currentCriticalIllnesCoverAmout/output.criticalIllnessInsurance)*100}" />
					              		<c:if test="${criPercent gt 100}">
					              			<c:set var="criPercent" value="100" />
					              		</c:if>
					              	</c:when>
					              	<c:otherwise>
					              		<c:set var="criPercent" value="0" />
					              	</c:otherwise>
					              </c:choose>
								  <div class="percentage_slider"><fmt:formatNumber type="number" maxFractionDigits="2" value="${criPercent}" />%</div>
					              <p class="txt">
					              	<fmt:parseNumber var="currentCritical" type="number" value="${output.currentCriticalIllnesCoverAmout}" />
					              	<fmt:parseNumber var="idealCritical" type="number" value="${output.criticalIllnessInsurance}" />
					              	<fmt:parseNumber var="diffCritical" type="number" value="${idealCritical - currentCritical}" />
					              	<c:if test="${diffCritical > 0 }">
					              		Take Critical illness insurance for Rs. <fmt:formatNumber type="number" maxFractionDigits="2" value="${diffCritical}" /> (${output.criticalMonths} months income).
					                </c:if>
					                <c:if test="${diffCritical <= 0 }">
					                 	Excellent! You have adequate Critical Illness Insurance coverage.
					                </c:if>
					              </p>
					            </div>
					          </div>
					        </li>
					        <li>
					          <div class="emergency_category rel clearfix">
					            <h3 class="category_name">Personal Accident</h3>
					            <div class="emergency_desc fl">
					              <p class="txt">Disability to an earning member will increase expenses and also affect income. Disability can happen because of Critical Illnesses or Accidents.</p>
					            </div>
					            <div class="goal_logo_year health_setback"> </div>
					            <div class="emergency_action fr">
					              <div class="fund_status clearfix">
					                <div class="fl available">
					                  <h6 class="heading">Available</h6>
					                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.currentpersonalInsuranceCoverAmt}" /></span>/-</div>
					                </div>
					                <div class="fr additional">
					                  <h6 class="heading">Additional Req</h6>
					                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.accidentInsurance}" /></span>/-</div>
					                </div>
					              </div>
					              <div id="progressbar1">
					                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
					              </div>
					              <fmt:parseNumber var="miniAccident" value="${output.accidentInsurance}" />
					              <c:choose>
					              	<c:when test="${miniAccident gt 0 }">
					              		<c:set var="accidentPercent" value="${(output.currentpersonalInsuranceCoverAmt/output.accidentInsurance)*100}" />
					              		<c:if test="${accidentPercent gt 100}">
					              			<c:set var="accidentPercent" value="100" />
					              		</c:if>
					              	</c:when>
					              	<c:otherwise>
					              		<c:set var="accidentPercent" value="0" />
					              	</c:otherwise>
					              </c:choose>
								  <div class="percentage_slider"><fmt:formatNumber type="number" maxFractionDigits="2" value="${accidentPercent}" />%</div>
					              <p class="txt">
					              	<fmt:parseNumber var="currentAccidental" type="number" value="${output.currentpersonalInsuranceCoverAmt}" />
					              	<fmt:parseNumber var="idealAccidental" type="number" value="${output.accidentInsurance}" />
					              	<fmt:parseNumber var="diffAccidental" type="number" value="${idealAccidental - currentAccidental}" />
					              	<c:if test="${diffAccidental > 0 }">
					              		Take Accidental Disability Insurance for Rs. <fmt:formatNumber type="number" maxFractionDigits="2" value="${diffAccidental}" /> (${output.accidentMonths} months income)
					                </c:if>
					                <c:if test="${diffAccidental <= 0 }">
					                 	Excellent! You have adequate Accidental Disability Insurance coverage.
					                </c:if>
					              </p>
					            </div>
					          </div>
					        </li>
					        <c:if test="${output.fpplanTypeId eq '522002' }">
					        <c:set var="criticalCount" value="0" />
					        <c:set var="accidentCount" value="0" />
					        <li class="margin_li margin_top fl">
					          <div class="table clearfix">
										<div class="table-header fl">
							               <ul>
							                   <li class="one fl" style="font-size: 11px;">Policy Name</li>
							                   <li class="two fl" style="font-size: 11px;">Insured Name</li>
							                   <li class="three fl" style="font-size: 11px;">Sum Assured</li>
							               </ul>
							           </div>  
							           <c:forEach items="${output.documentList}" var="insuranceList">
							           	<c:if test="${insuranceList.documentId eq '48027'}">
							            	<div class="first-row fl">
								                <ul>
								                    <li class="one fl" style="font-size: 10px;">${insuranceList.documentName}</li>
								                    <li class="two fl" style="font-size: 10px;">${insuranceList.flag}</li>
								                    <li class="three fl" style="font-size: 10px;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${insuranceList.fileName}" /></li>
								                </ul>
								            </div>
							            </c:if>
							           </c:forEach> 
					  		  </div><!-- End "Table" -->
							</li>
							<li class="fl">
					 			<div class="table clearfix">
										<div class="table-header fl">
							               <ul>
							                   <li class="one fl" style="font-size: 11px;">Policy Name</li>
							                   <li class="two fl" style="font-size: 11px;">Insured Name</li>
							                   <li class="three fl" style="font-size: 11px;">Sum Assured</li>
							               </ul>
							           </div>
							           <c:forEach items="${output.documentList}" var="insuranceList">
							           	<c:if test="${insuranceList.documentId eq '48025'}">
							            	<div class="first-row fl">
								                <ul>
								                    <li class="one fl" style="font-size: 10px;">${insuranceList.documentName}</li>
								                    <li class="two fl" style="font-size: 10px;">${insuranceList.flag}</li>
								                    <li class="three fl" style="font-size: 10px;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${insuranceList.fileName}" /></li>
								                </ul>
								            </div>
							            </c:if>
							           </c:forEach>
					  			</div><!-- End "Table" -->
					  		</li>
					  		</c:if>
					      </ul>
					    </div>
					    <h2 class="secondary_heading" style="margin-top: 20px;">What To Do?</h2>
					    <div class="box3 report">
					      <div class="row">
					          <div class="col-md-4">
					          	<div class="sub_box1">Though we wish they don't, Bad things may happen to anyone. It is important to be protected against setbacks like income loss, health loss etc to ensure your wealth is available for your Goals and Dreams.</div>
					          </div>
					          <div class="col-md-4">
					          	<div class="table1 clearfix">
					  	<div class="table-header1 fl">
					    	Protect yourself with(In Lacs)
					    </div>
					    <div class="row">
					    	<div class="col-md-7 pr br">
					        	<p class="bb">Life Insurance for</p>
					            <p class="bb">Health Insurance for</p>
					            <p class="bb">Critical Illness Insurance</p>
					            <p>Accidental Insurance</p>
					        </div>
					        <div class="col-md-5 pl">
					        	<p class="bb">
					        		<span class="rs_symbol"></span>
					        		<c:choose>
					     				<c:when test="${diffLife > 0}">
					     					${diffLife / 100000}
					     				</c:when>
					     				<c:otherwise>
						     				0.00
					     				</c:otherwise>
					    			</c:choose>
								</p>
					            <p class="bb">
									<span class="rs_symbol"></span>
						       		<c:choose>
						    				<c:when test="${diffHealth > 0}">
						    					${diffHealth / 100000}
						    				</c:when>
						    				<c:otherwise>
						     				0.00
						    				</c:otherwise>
						   			</c:choose>
								</p>
					            <p class="bb">
					            	<span class="rs_symbol"></span>
						       		<c:choose>
						    				<c:when test="${diffCritical > 0}">
						    					${diffCritical / 100000}
						    				</c:when>
						    				<c:otherwise>
						     				0.00
						    				</c:otherwise>
						   			</c:choose>
								</p>
					            <p>
					            	<span class="rs_symbol"></span>
						       		<c:choose>
						    				<c:when test="${diffAccidental > 0}">
						    					${diffAccidental / 100000}
						    				</c:when>
						    				<c:otherwise>
						     				0.00
						    				</c:otherwise>
						   			</c:choose>
								</p>
					        </div>
					    </div>
					    
					
					    
					  </div><!-- End "Table" -->
					          </div>
					          <div class="col-md-4">
					          	<div class="sub_box2" style="margin-top: 0px !important;">	          	
					            	<div class="head">Assumptions</div>
					            	<div class="sub_assumptions">
					                    <p>1. Inflation is assumed at ${output.inflationRate}%</p>
					                    <p>2. Assets are grown as per assumed growth rate of asset class.</p>
					                    <!-- <p>3. If you have indicated a range value anywhere, the amount used for calculations is the average of the lower value and higher value in the range.</p> -->
					                    <c:choose >						
										    <c:when test="${output.saving=='0'}">
												<p>3. Life insurance needs are calculated as per Human Life Value.</p>
										    </c:when>
										    <c:when test="${output.saving=='1'}">
										    	<p>3. Life insurance needs are calculated as per Expense Replacement Method.</p>
										    </c:when>
										    <c:otherwise>
										   		<p>3. Life insurance needs are calculated as per Income Replacement Method.</p>
										    </c:otherwise>
									 	</c:choose>
									 	<!-- <p>5. Your existing assets and regular investments are used to meet the goals that come (chronologically) first.</p>
					      				<P>6. If there is money left after utilizing for the initial goal, then the remaining amount is used for subsequent goals and retirement.</p> -->
					            	</div><!-- end of sub_assumptions -->
					          	</div>
					          </div>      
					      </div><!-- end of Row -->
					    </div><!-- end of box3 -->
					    </div>
					      <div class="footer1 clearfix" style="page-break-after:always">
						    <div class="fl footer_tagline"></div>
						    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
						  </div>
				   </div>
  			</c:when>
  			<c:otherwise>
  				<div class="box2 variable">
			  		<ul class="reset clearfix">
			        <li class="margin_li">
			          <div class="emergency_category rel clearfix">
			            <h3 class="category_name">Disabilities</h3>
			            <div class="emergency_desc fl">
			              <p class="txt">Disability to an earning member will increase expenses and also affect income. Disability can happen because of critical illnesses or accidents.</p>
			            </div>
			            <div class="goal_logo_year disabilities"> </div>
			            <div class="emergency_action fr">
			              <div class="fund_status clearfix">
			                <div class="fl available">
			                  <h6 class="heading">Available</h6>
			                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.currentCriticalIllnesCoverAmout}" /></span>/-</div>
			                </div>
			                <div class="fr additional">
			                  <h6 class="heading">Additional Req</h6>
			                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.criticalIllnessInsurance}" /></span>/-</div>
			                </div>
			              </div>
			              <div id="progressbar4">
			                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
			              </div>
			              <fmt:parseNumber var="miniCri" value="${output.criticalIllnessInsurance}" />
					              <c:choose>
					              	<c:when test="${miniCri gt 0 }">
					              		<c:set var="criPercent" value="${(output.currentCriticalIllnesCoverAmout/output.criticalIllnessInsurance)*100}" />
					              		<c:if test="${criPercent gt 100}">
					              			<c:set var="criPercent" value="100" />
					              		</c:if>
					              	</c:when>
					              	<c:otherwise>
					              		<c:set var="criPercent" value="0" />
					              	</c:otherwise>
					              </c:choose>
								  <div class="percentage_slider"><fmt:formatNumber type="number" maxFractionDigits="2" value="${criPercent}" />%</div>
			              <p class="txt">
			              	<fmt:parseNumber var="currentCritical" type="number" value="${output.currentCriticalIllnesCoverAmout}" />
			              	<fmt:parseNumber var="idealCritical" type="number" value="${output.criticalIllnessInsurance}" />
			              	<fmt:parseNumber var="diffCritical" type="number" value="${idealCritical - currentCritical}" />
			              	<c:if test="${diffCritical > 0 }">
			              		Take Critical illness insurance for Rs. <fmt:formatNumber type="number" maxFractionDigits="2" value="${diffCritical}" /> (${output.criticalMonths} months income).
			                </c:if>
			                <c:if test="${diffCritical <= 0 }">
			                 	Excellent! You have adequate Critical Illness Insurance coverage.
			                </c:if>
			              </p>
			            </div>
			          </div>
			        </li>
			        <li>
			          <div class="emergency_category rel clearfix">
			            <h3 class="category_name">Personal Accident</h3>
			            <div class="emergency_desc fl">
			              <p class="txt">Disability to an earning member will increase expenses and also affect income. Disability can happen because of Critical Illnesses or Accidents.</p>
			            </div>
			            <div class="goal_logo_year health_setback"> </div>
			            <div class="emergency_action fr">
			              <div class="fund_status clearfix">
			                <div class="fl available">
			                  <h6 class="heading">Available</h6>
			                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.currentpersonalInsuranceCoverAmt}" /></span>/-</div>
			                </div>
			                <div class="fr additional">
			                  <h6 class="heading">Additional Req</h6>
			                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${output.accidentInsurance}" /></span>/-</div>
			                </div>
			              </div>
			              <div id="progressbar1">
			                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
			              </div>
			              <fmt:parseNumber var="miniAccident" value="${output.accidentInsurance}" />
					              <c:choose>
					              	<c:when test="${miniAccident gt 0 }">
					              		<c:set var="accidentPercent" value="${(output.currentpersonalInsuranceCoverAmt/output.accidentInsurance)*100}" />
					              		<c:if test="${accidentPercent gt 100}">
					              			<c:set var="accidentPercent" value="100" />
					              		</c:if>
					              	</c:when>
					              	<c:otherwise>
					              		<c:set var="accidentPercent" value="0" />
					              	</c:otherwise>
					              </c:choose>
								  <div class="percentage_slider"><fmt:formatNumber type="number" maxFractionDigits="2" value="${accidentPercent}" />%</div>
			              <p class="txt">
			              	<fmt:parseNumber var="currentAccidental" type="number" value="${output.currentpersonalInsuranceCoverAmt}" />
			              	<fmt:parseNumber var="idealAccidental" type="number" value="${output.accidentInsurance}" />
			              	<fmt:parseNumber var="diffAccidental" type="number" value="${idealAccidental - currentAccidental}" />
			              	<c:if test="${diffAccidental > 0 }">
			              		Take Accidental Disability Insurance for Rs. <fmt:formatNumber type="number" maxFractionDigits="2" value="${diffAccidental}" /> (${output.accidentMonths} months income)
			                </c:if>
			                <c:if test="${diffAccidental <= 0 }">
			                 	Excellent! You have adequate Accidental Disability Insurance coverage.
			                </c:if>
			              </p>
			            </div>
			          </div>
			        </li>
			        <c:if test="${output.fpplanTypeId eq '522002' }">
			        <c:set var="criticalCount" value="0" />
			        <c:set var="accidentCount" value="0" />
			        <li class="margin_li margin_top fl">
			          <div class="table clearfix">
								<div class="table-header fl">
					               <ul>
					                   <li class="one fl" style="font-size: 11px;">Policy Name</li>
					                   <li class="two fl" style="font-size: 11px;">Insured Name</li>
					                   <li class="three fl" style="font-size: 11px;">Sum Assured</li>
					               </ul>
					           </div>  
					           <c:forEach items="${output.documentList}" var="insuranceList">
					           	<c:if test="${insuranceList.documentId eq '48027'}">
					            	<div class="first-row fl">
						                <ul>
						                    <li class="one fl" style="font-size: 10px;">${insuranceList.documentName}</li>
						                    <li class="two fl" style="font-size: 10px;">${insuranceList.flag}</li>
						                    <li class="three fl" style="font-size: 10px;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${insuranceList.fileName}" /></li>
						                </ul>
						            </div>
					            </c:if>
					           </c:forEach> 
			  		  </div><!-- End "Table" -->
					</li>
					<li class="fl">
			 			<div class="table clearfix">
								<div class="table-header fl">
					               <ul>
					                   <li class="one fl" style="font-size: 11px;">Policy Name</li>
					                   <li class="two fl" style="font-size: 11px;">Insured Name</li>
					                   <li class="three fl" style="font-size: 11px;">Sum Assured</li>
					               </ul>
					           </div>
					           <c:forEach items="${output.documentList}" var="insuranceList">
					           	<c:if test="${insuranceList.documentId eq '48025'}">
					            	<div class="first-row fl">
						                <ul>
						                    <li class="one fl" style="font-size: 10px;">${insuranceList.documentName}</li>
						                    <li class="two fl" style="font-size: 10px;">${insuranceList.flag}</li>
						                    <li class="three fl" style="font-size: 10px;"><fmt:formatNumber type="number" maxFractionDigits="2" value="${insuranceList.fileName}" /></li>
						                </ul>
						            </div>
					            </c:if>
					           </c:forEach>
			  			</div><!-- End "Table" -->
			  		</li>
			  		</c:if>
			      </ul>
			    </div>
			    <h2 class="secondary_heading" style="margin-top: 20px;">What To Do?</h2>
			    <div class="box3 report">
			      <div class="row">
			          <div class="col-md-4">
			          	<div class="sub_box1">Though we wish they don't, Bad things may happen to anyone. It is important to be protected against setbacks like income loss, health loss etc to ensure your wealth is available for your Goals and Dreams.</div>
			          </div>
			          <div class="col-md-4">
			          	<div class="table1 clearfix">
			  	<div class="table-header1 fl">
			    	Protect yourself with(In Lacs)
			    </div>
			    <div class="row">
			    	<div class="col-md-7 pr br">
			        	<p class="bb">Life Insurance for</p>
			            <p class="bb">Health Insurance for</p>
			            <p class="bb">Critical Illness Insurance</p>
			            <p>Accidental Insurance</p>
			        </div>
			        <div class="col-md-5 pl">
			        	<p class="bb">
			        		<span class="rs_symbol"></span>
			        		<c:choose>
			     				<c:when test="${diffLife > 0}">
			     					${diffLife / 100000}
			     				</c:when>
			     				<c:otherwise>
				     				0.00
			     				</c:otherwise>
			    			</c:choose>
						</p>
			            <p class="bb">
							<span class="rs_symbol"></span>
				       		<c:choose>
				    				<c:when test="${diffHealth > 0}">
				    					${diffHealth / 100000}
				    				</c:when>
				    				<c:otherwise>
				     				0.00
				    				</c:otherwise>
				   			</c:choose>
						</p>
			            <p class="bb">
			            	<span class="rs_symbol"></span>
				       		<c:choose>
				    				<c:when test="${diffCritical > 0}">
				    					${diffCritical / 100000}
				    				</c:when>
				    				<c:otherwise>
				     				0.00
				    				</c:otherwise>
				   			</c:choose>
						</p>
			            <p>
			            	<span class="rs_symbol"></span>
				       		<c:choose>
				    				<c:when test="${diffAccidental > 0}">
				    					${diffAccidental / 100000}
				    				</c:when>
				    				<c:otherwise>
				     				0.00
				    				</c:otherwise>
				   			</c:choose>
						</p>
			        </div>
			    </div>
			    
			
			    
			  </div><!-- End "Table" -->
			          </div>
			          <div class="col-md-4">
			          	<div class="sub_box2" style="margin-top:0px !important;">	          	
			            	<div class="head">Assumptions</div>
			            	<div class="sub_assumptions">
			                    <p>1. Inflation is assumed at ${output.inflationRate}%</p>
			                    <p>2. Assets are grown as per assumed growth rate of asset class.</p>
			                    <!-- <p>3. If you have indicated a range value anywhere, the amount used for calculations is the average of the lower value and higher value in the range.</p> -->
			                    <c:choose >						
								    <c:when test="${output.saving=='0'}">
										<p>3. Life insurance needs are calculated as per Human Life Value.</p>
								    </c:when>
								    <c:when test="${output.saving=='1'}">
								    	<p>3. Life insurance needs are calculated as per Expense Replacement Method.</p>
								    </c:when>
								    <c:otherwise>
								   		<p>3. Life insurance needs are calculated as per Income Replacement Method.</p>
								    </c:otherwise>
							 	</c:choose>
							 	<!-- <p>5. Your existing assets and regular investments are used to meet the goals that come (chronologically) first.</p>
			      				<P>6. If there is money left after utilizing for the initial goal, then the remaining amount is used for subsequent goals and retirement.</p> -->
			            	</div><!-- end of sub_assumptions -->
			          	</div>
			          </div>      
			      </div><!-- end of Row -->
			    </div><!-- end of box3 -->
			    </div>
			      <div class="footer1 clearfix" style="page-break-after:always">
				    <div class="fl footer_tagline"></div>
				    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)<c:set var="pageCount">${pageCount + 1}</c:set></div>
				  </div>
			</div>
  			</c:otherwise>
  		</c:choose>
</c:if>

<!--*************** ACE THEME ***************-->
<!-- basic scripts -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/js/ace/jquery.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath}/js/ace/bootstrap.js"></script>
		<!-- page specific plugin scripts -->
		<script src="${pageContext.request.contextPath}/js/ace/jquery-ui.custom.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/chosen.jquery.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/date-time/bootstrap-datepicker.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/date-time/bootstrap-timepicker.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/date-time/moment.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/date-time/daterangepicker.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/date-time/bootstrap-datetimepicker.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/bootstrap-colorpicker.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/jquery.knob.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/jquery.autosize.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/jquery.inputlimiter.1.3.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/jquery.maskedinput.js"></script>
		<!-- ace scripts -->
		<script src="${pageContext.request.contextPath}/js/ace/ace/elements.colorpicker.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/ace/elements.fileinput.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/ace/elements.spinner.js"></script>
		<script src="${pageContext.request.contextPath}/js/ace/ace/ace.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">

		$(document).ready(function(){
			
			//Emergency Planning
			var emerRate = ${comprehensiveDetails.emerRating};
			if( emerRate == 1 ){
				$('#94001_1').addClass("active");
			}else if( emerRate == 2 ){
				$('#94001_2').addClass("active");
			}else if( emerRate == 3 ){
				$('#94001_3').addClass("active");
			}else if( emerRate == 4 ){
				$('#94001_4').addClass("active");
			}else if( emerRate == 5 ){
				$('#94001_5').addClass("active");
			}
			var emerSituation = "${comprehensiveDetails.emerSituation}";
			var emerFaced = "${comprehensiveDetails.emerFaced}";
			if( emerSituation == '1' ){
				$('#94002_1').attr("checked","checked");
				if( emerFaced.indexOf("94003") >= 0 ){
					$('#94003').addClass("active");	
				}
				if( emerFaced.indexOf("94004") >= 0 ){
					$('#94004').addClass("active");	
				}
				if( emerFaced.indexOf("94005") >= 0 ){
					$('#94005').addClass("active");	
				}
				if( emerFaced.indexOf("94006") >= 0 ){
					$('#94006').addClass("active");	
				}
				if( emerFaced.indexOf("94007") >= 0 ){
					$('#94007').addClass("active");	
				}
			}else if( emerSituation == '0' ){
				$('#94002_0').addClass("active");
			}
			var emerAsset = "${comprehensiveDetails.emerAsset}";
			if(emerAsset == '1'){
				$('#94008_1').addClass("active");
			}else if(emerAsset == '0'){
				$('#94008_0').addClass("active");
			}
			var emerMonths = "${comprehensiveDetails.emerMonths}";
			if( emerMonths >0 && emerMonths <=2 ){
				$('#94138').addClass("active");
			}else if( emerMonths >2 &&  emerMonths <=5  ){
				$('#94139').addClass("active");
			}else if( emerMonths >5 &&  emerMonths <=8  ){
				$('#94140').addClass("active");
			}else if( emerMonths >8 &&  emerMonths <=11  ){
				$('#94141').addClass("active");
			}else if( emerMonths >= 12 ){
				$('#94142').addClass("active");
			}
			var emerFallBack = "${comprehensiveDetails.emerFallBack}";
			if( emerFallBack == 94517 ){
				$('#94517').addClass("active");
			}else if( emerFallBack == 94518 ){
				$('#94518').addClass("active");
			}else if( emerFallBack == 94519 ){
				$('#94519').addClass("active");
			}else if( emerFallBack == 94520 ){
				$('#94520').addClass("active");
				$('#94520_other').val(${comprehensiveDetails.emerFallBackOther});
			}
			
			var emerCurrent = "${output.currentEmergencyFund}";
			var emerIdeal = "${output.minimumEmergencyFund}";
			generateAngle(emerCurrent,emerIdeal);
			
			//Risk Cover
			var rating = "";
			rating = parseInt('${comprehensiveDetails.ratingRisk}');
			if(rating == ""){
				rating = 0;
			}
			$( "#input-size-slider11" ).slider({value: rating});
			
			<c:if test="${output.fpplanTypeId eq '522002'}">
				<c:choose>
					<c:when test="${comprehensiveDetails.lifeAmount gt '0'}">
						$("#dolifeRisk").attr('checked','checked');
					</c:when>
					<c:otherwise>
						$("#dolifeRisk").removeAttr('checked');
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003'}">
				<c:choose>
					<c:when test="${comprehensiveDetails.lifeAmount gt '0'}">
						$("#dolifeRisk").attr('checked','checked');
					</c:when>
					<c:otherwise>
						$("#dolifeRisk").removeAttr('checked');
					</c:otherwise>
				</c:choose>
			</c:if>
			
			var whatKind = "${comprehensiveDetails.lifeKind}";
			if( whatKind.indexOf("94014") >= 0 ){
				$("#94014").addClass("active")
			}
			if( whatKind.indexOf("94015") >= 0 ){
				$("#94015").addClass("active")
			}
			if( whatKind.indexOf("94016") >= 0 ){
				$("#94016").addClass("active")
			}
			if( whatKind.indexOf("94017") >= 0 ){
				$("#94017").addClass("active");
			}
			
			<c:if test="${output.fpplanTypeId eq '522002'}">
				<c:choose>
					<c:when test="${comprehensiveDetails.healthAmt gt '0'}">
						$("#doHealthRisk").attr('checked','checked');
					</c:when>
					<c:otherwise>
						$("#doHealthRisk").removeAttr('checked');
					</c:otherwise>
				</c:choose>
			</c:if>
		
			<c:if test="${output.fpplanTypeId eq '522002'}">
				<c:choose>
					<c:when test="${comprehensiveDetails.criticalAmt gt '0'}">
						$("#doCriticalRisk").attr('checked','checked');
					</c:when>
					<c:otherwise>
						$("#doCriticalRisk").removeAttr('checked');
					</c:otherwise>
				</c:choose>
			</c:if>
	
			<c:if test="${output.fpplanTypeId eq '522002'}">
				<c:choose>
					<c:when test="${comprehensiveDetails.accidentAmt gt '0'}">
						$("#doAccidentRisk").attr('checked','checked');
					</c:when>
					<c:otherwise>
						$("#doAccidentRisk").removeAttr('checked');
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003'}">
				<c:choose>
					<c:when test="${comprehensiveDetails.doHealth eq '1'}">
						$("#doHealthRisk").attr('checked','checked');
					</c:when>
					<c:otherwise>
						$("#doHealthRisk").removeAttr('checked');
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003'}">
			<c:choose>
				<c:when test="${comprehensiveDetails.doCritical eq '1'}">
					$("#doCriticalRisk").attr('checked','checked');
				</c:when>
				<c:otherwise>
					$("#doCriticalRisk").removeAttr('checked');
				</c:otherwise>
			</c:choose>
			</c:if>
			
			<c:if test="${output.fpplanTypeId eq '522001' or output.fpplanTypeId eq '522003'}">
			<c:choose>
				<c:when test="${comprehensiveDetails.doAccident eq '1'}">
					$("#doAccidentRisk").attr('checked','checked');
				</c:when>
				<c:otherwise>
					$("#doAccidentRisk").removeAttr('checked');
				</c:otherwise>
			</c:choose>
			</c:if>
			
			<c:choose>
				<c:when test="${comprehensiveDetails.doAsset eq '1'}">
					$("#doAssetRisk").attr('checked','checked');
				</c:when>
				<c:otherwise>
					$("#doAssetRisk").removeAttr('checked');
				</c:otherwise>
			</c:choose>
		});
			
	
			jQuery(function($) {
				$( "#input-size-slider11" ).slider({
					range: "min",
					min: 0,
					max: 5,
					step: 1
					
				});
			});
			
			
			function generateAngle(analysisAmount,idealAmount)
			{
				var range=0;
				var $elie='';
				var $elie1='';
				if(analysisAmount=='null'){
					analysisAmount = 0.0;
				}
				else
				{
					analysisAmount = parseFloat(analysisAmount);
				}
				if(idealAmount=='null'){
					idealAmount = 0.0;
				}
				else
				{
					idealAmount = parseFloat(idealAmount);
				}
				var angleToRotate = -90;
				if(analysisAmount > idealAmount){
					range = analysisAmount;
					angleToRotate = 90;
					createRange(range);
			  		$elie = $(".arrow.current");
			    	rotate(angleToRotate);
			 		
			 		
			 	//set other needle
			 	
			 	angleToRotate = ((idealAmount/range)*180) - 90;
			 	$elie1 = $(".arrow.ideal");
			    rotate1(angleToRotate);
			 	
			 		
				}
				else if(analysisAmount <= idealAmount){
					range = idealAmount;
					createRange(range);
					angleToRotate = 90;
				 	$elie = $(".arrow.ideal");
			    	rotate(angleToRotate);
			 		
			 		//set other needle
			 	 	angleToRotate = ((analysisAmount/range)*180) - 90;
			 	 	$elie1 = $(".arrow.current");
			 	    rotate1(angleToRotate);
			 	 	
				}
				
				function rotate(degree) {
				    	$elie.css({
				                 '-webkit-transform': 'rotate(' + degree + 'deg)',
				                 '-moz-transform': 'rotate(' + degree + 'deg)',
				                 '-ms-transform': 'rotate(' + degree + 'deg)',
				                 '-o-transform': 'rotate(' + degree + 'deg)',
				                 'transform': 'rotate(' + degree + 'deg)',
				                 
				     	});
				 	}
				
				function rotate1(degree) {
			 		$elie1.css({
			             '-webkit-transform': 'rotate(' + degree + 'deg)',
			             '-moz-transform': 'rotate(' + degree + 'deg)',
			             '-ms-transform': 'rotate(' + degree + 'deg)',
			             '-o-transform': 'rotate(' + degree + 'deg)',
			             'transform': 'rotate(' + degree + 'deg)',
			             
			 		});
					}
			}
			
			
			function createRange(highest){
				var range = Math.round(highest);
				$('#first').html('0 L');
				$('#second').html((range*1/500000).toFixed(2) +' L');
				$('#third').html((range*2/500000).toFixed(2)+' L');
				$('#fourth').html((range*3/500000).toFixed(2)+ ' L');
				$('#fifth').html((range*4/500000).toFixed(2)+ ' L');
				$('#sixth').html((range/100000).toFixed(2)+' L');
			}
			
		</script> 
<!--*************** ACE THEME ***************-->

<!-- Succession Planning -->

<style>
	/***Goals My Dreams Starts***/
#succession_planning .container { position: relative; width: 92%; margin: 0 auto; height: 313px; }
#succession_planning .question { width:210px; height:210px; border:2px solid <%=colorCode%>; -moz-border-radius: 125px; -webkit-border-radius: 125px; border-radius: 125px; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; background:url(${pageContext.request.contextPath}/images/diyimages/question_bg.png) no-repeat 41px 64px; position: absolute; left:0; top: 52px; z-index:150 }
#succession_planning .action { height:294px; width:294px;background-color: #fff; border:2px solid <%=colorCode%>; -moz-border-radius: 172px; -webkit-border-radius: 172px; border-radius: 172px; -moz-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; -webkit-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; position: absolute; left:165px; z-index:100}
#succession_planning .importance { width:305px; height: 200px; background: <%=colorCodeLeft%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; position: absolute; right:0; top: 48px; z-index:50; color:#fff; font-family: "Aller Bold";  margin: 0px 12px 0px 0px; }
#succession_planning .importance .imp_head { font-size:19px; margin: 16px 0 12px 52px; width: 230px; }
#succession_planning .importance .txt { font-size: 13px; margin: 0 0 0 55px; width: 242px; height: 149px; line-height: 17px; -moz-border-radius: 0 0 63px 0; -webkit-border-radius: 0 0 63px 0; border-radius: 0 0 63px 0; }
#succession_planning .action .action_head { font-family: "Aller Bold"; font-size: 28px;margin: 37px 0 0 54px; width: 234px; }
#succession_planning .action .txt { font-family: "Aller Bold"; font-size: 12px;margin: 7px 0 0 45px;text-align:justify; width: 234px; height: 202px; border-radius: 0 0 115px 71px; color: <%=colorCode%>; line-height:20px;padding: 0 0 0 5px; }
#succession_planning .question .txt { font-family: "Aller Bold"; font-size: 15px; margin: 53px 0 0 20px; width: 137px; height: 149px; -moz-border-radius: 0 0 0 76px; -webkit-border-radius: 0 0 0 76px; border-radius: 0 0 0 76px; color: <%=colorCode%>; line-height: 23px; }
#succession_planning .question .icon { height:74px; width:74px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid <%=colorCode%>; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; position: absolute; top: -35px; left:70px; background: #FFF url(${pageContext.request.contextPath}/images/diyimages/asset-investment.png) no-repeat center center;background-size: 55px; }
#succession_planning .question .yes_no_answer { position: absolute; top: 62px; right: 8px; height: 94px; width: 33px; text-align: center; font-size: 13px; font-family: "Aller Bold"; }
#succession_planning .question .yes_no_answer .custom_radio { height:11px; width:11px; border:1px solid <%=colorCode%>; -moz-border-radius: 18px; -webkit-border-radius: 18px; border-radius: 18px; margin:3px auto 0 }
#succession_planning .question .yes_no_answer li { margin: 3px 0 19px; }
#succession_planning .question .yes_no_answer .custom_radio.selected { background:url(${pageContext.request.contextPath}/images/diyimages/custom_selected.png) no-repeat center center }
#succession_planning .container_ul li { margin:20px 0 0}
/* #succession_planning .action .txt{font-size: 12px;margin: 7px 0 0 45px;text-align:justify;}
#succession_planning .action .action_head{font-size: 28px;margin: 37px 0 0 54px;} */
/***Goals My Dreams Ends***/
</style>
<c:if test="${fn:contains(fpSection, '39007')}">
<a name="SUCCESSION_PLANNING_${pageCount+1}"></a>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt2">${output.salutation}${output.opportunityName}</h2>
    </div>
    <h1 class="page_heading fr">Succession Planning</h1>
  </div>
  <div class="content" id="succession_planning">
    <ul class="reset clearfix container_ul">
      <li>
        <div class="container clearfix">
          <div class="question fl">
            <p class="txt">Does your family know what all assets you have?</p>
            <div class="icon"></div>
            <ul class="reset clearfix yes_no_answer">
              <li>
                <p class="yes_no">YES</p>
                <div class="custom_radio <c:if test="${output.succession['FamilyAware']=='1'}">selected </c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${output.succession['FamilyAware']=='0'}">selected </c:if>"></div>
              </li>
            </ul>
          </div>
          <div class="action fl">
            <h4 class="action_head">What to Do?</h4>
            <p class="txt">Prepare an exhaustive list of<br/> 
				-Movable Assets<br/> 
				-Investment assets<br/>
				-Money receivable from others<br/>
				-Money payable to others
				along with details of a/c nos, phone nos. etc.
			</p>
          </div>
          <div class="importance fr">
            <h4 class="imp_head">Why it is Important ?</h4>
            <p class="txt"> Truth is lakhs of crores of money lies
              unclaimed in insurance companies' and banks' coffers. A man works hard and builds assets and purchases insurance policies to protect his family. But does not inform his wife about it. A widowed mother struggles with her children to make ends meet. </p>
          </div>
        </div>
      </li>
      <li>
        <div class="container clearfix">
          <div class="question fl">
            <p class="txt">Will your family be able to access them easily?</p>
            <div class="icon"></div>
            <ul class="reset clearfix yes_no_answer">
              <li>
                <p class="yes_no">YES</p>
                <div class="custom_radio <c:if test="${output.succession['Will']=='1'}">selected </c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${output.succession['Will']=='0'}">selected </c:if>"></div>
              </li>
            </ul>
          </div>
          <div class="action fl">
            <h4 class="action_head">What to Do?</h4>
            <p class="txt">Hold investments<br/>
				-Jointly with spouse / someone you trust<br/>
				-Either or survivor mode is preferable<br/>
				Update nominations in your bank a/cs, investment a/cs, housing society records etc.
			</p>
          </div>
          <div class="importance fr">
            <h4 class="imp_head">Why it is Important ?</h4>
            <p class="txt">Imagine a person falling sick and getting admitted in a hospital. The family knows there are investments but has no way to access it. A family member is nominated, but in this circumstance nomination doesn't help.</p>
          </div>
        </div>
      </li>
      <li>
        <div class="container clearfix">
          <div class="question fl">
            <p class="txt">Does your family know how to use the assets?</p>
            <div class="icon"></div>
            <ul class="reset clearfix yes_no_answer">
              <li>
                <p class="yes_no">YES</p>
                <div class="custom_radio <c:if test="${output.succession['JointInvestment']=='1'}">selected </c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${output.succession['JointInvestment']=='0'}">selected </c:if>"></div>
              </li>
            </ul>
          </div>
          <div class="action fl">
            <h4 class="action_head">What to Do?</h4>
            <p class="txt">Prepare a Will and include details of<br/>
				-Who should inherit what?<br/>
				-How loans have to be discharged?<br/>
				-Who should be guardian for minor children?<br/>
				-Who should execute the Will<br/>
				Create Trusts to ensure that the money<br/>is used only for the benefit of who it is<br/> meant for.
			</p>
          </div>
          <div class="importance fr">
            <h4 class="imp_head">Why it is Important ?</h4>
            <p class="txt">Imagine a widowed woman getting a huge sum from insurance policies. With so much to handle, and so many people around will she be able to make the best of this money to safeguard her / childrens' future? The man's dependent parents are not aware of their rights on their son's wealth.</p>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="footer1 clearfix">
    <div class="fl footer_tagline"></div>
    <div class="fr page_no">(<span class="no">${pageCount+1}</span>)</div>
  </div>
</div>
</c:if>
</body>
</html>