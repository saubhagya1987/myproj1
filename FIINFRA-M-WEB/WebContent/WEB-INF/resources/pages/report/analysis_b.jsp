<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="themeIdTemp" value="${adviserGoals.theme}"/>
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

<link type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>


<title>Analysis Report</title>
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
.header { height:65px; background:url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { height:1030px }
.footer { height:18px; background:#c0c0c0 }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px;text-align: left; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode%>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
.theme_color { color: <%=colorCode%>; }
.theme_background{background-color:<%=colorCode%>; }
.theme_dashed_border_bottom{border-bottom: 1px dashed <%=colorCode%>;}
.theme_doubble_border{border:2px solid <%=colorCode%>;}
.theme_faint_border{ border:1px solid <%=colorCode%>}
.northspace3{margin-top:15px}
/***Common Css Ends***/
/***Analysis Report Starts***/
.head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 47px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; }
#analysis_report_content .ifa_details {height: 250px;padding: 60px 35px 0;}
#analysis_report_content .ifa_details .add_details { margin:0 0; width:48% }
#analysis_report_content .ifa_details .name { font-family: "Aller Bold"; font-size: 23px; margin: 0 0 3px 0; }
#analysis_report_content .ifa_details .address { width:300px; font-size: 17px; line-height: 21px; }
#analysis_report_content .ifa_details .logo { margin: 0; width:150px; height:125px; text-align: center;padding:5px }
#analysis_report_content .ifa_details .logo img { max-width: 100%; max-height: 100%; }
#analysis_report_content .client_details { height:380px;margin: 0 0 80px 0; }
#analysis_report_content .client_details .name {font-family: "Aller Bold"; font-size: 32px; margin: 0; padding: 15px 0 0; text-align:center }
#analysis_report_content .client_details .client_address{ height: 20px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
#analysis_report_content .client_details .category { height:116px; width:116px; border:2px solid <%=colorCode%>; -moz-border-radius: 69px; -webkit-border-radius: 69px; border-radius: 69px; -moz-box-shadow: 0px 0px 4px 2px #9F9F9F; -webkit-box-shadow: 0px 0px 4px 2px #9F9F9F; box-shadow: 0px 0px 4px 2px #9F9F9F;} 
#analysis_report_content .client_details .grid_adjuster { margin-left:-30px }
#analysis_report_content .client_details .category_ul { margin:50px 0 0 }
#analysis_report_content .client_details .category_ul li { margin-left:74px }
#analysis_report_content .client_details .category_ul .cat_name { font-family: "Aller Bold"; font-size: 15px; width: 100%; text-align: center; margin: 27px 0 0; height: 19px; }
#analysis_report_content .client_details .category_ul .value { margin: 20px 0 0; }
#analysis_report_content .client_details .category_ul .value span { border-bottom: 1px dashed <%=colorCode%>; padding: 0 10px; font-family: "Aller Bold"; font-size: 22px; }
#analysis_report_content .client_details .category_ul .first .category { background:url(${pageContext.request.contextPath}/resources/images/goal_icon.png) no-repeat center center #fff }
#analysis_report_content .client_details .category_ul .second .category { background:url(${pageContext.request.contextPath}/resources/images/risk_profile_report.png) no-repeat center center #fff;}
#analysis_report_content .client_details .category_ul .third .category { background: url(${pageContext.request.contextPath}/resources/images/emergency_report.png) no-repeat center center #fff }
#analysis_report_content .client_details .category_ul .fourth .category { background: url(${pageContext.request.contextPath}/resources/images/risk_planning_report.png) no-repeat center center #fff }
#analysis_report_content .disclaimer { height:330px; padding:0 20px }
#analysis_report_content .disclaimer .heading {font-family: "Aller Bold"; font-size: 12px; margin:0 0 10px }
#analysis_report_content .disclaimer .txt { font-size:11px; height:190px; line-height:19px; text-align: justify; }
#analysis_report_content .disclaimer .btm_logo { background:url(${pageContext.request.contextPath}/resources/images/finfra-logo-small.png) no-repeat center center; width:76px; height:20px }
#goals_my_dreams .report .goal_report_table.assumptions_made{width: 60%;margin: 5px auto 0}

#goals_my_dreams .description { height:auto;height: auto;border:1px solid <%=colorCodeLeft %>; border-radius: 5px; padding: 2px 5px 2px 5px; -webkit-box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); -moz-box-shadow:    0px 3px 5px 0px rgba(50, 50, 50, 0.75); box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75);font-size: 15px;margin-top: 15px; }
#goals_my_dreams .description .goal_nm{font-size:12px; text-indent: 20px; font-family: "allerregular"; text-align: justify; margin:5px 0px 5px 0px;}
#goals_my_dreams .description .goal_nm span{font-weight:bold;}
#goals_my_dreams .description .title { font-size:14px; font-family: "Aller Bold"; }
#goals_my_dreams .description .title{width:770px; height:100px; border:1px solid <%=colorCodeLeft %>; margin:10px auto 0px auto;box-shadow:0px 3px 5px #3a3a3a;}

#goals_my_dreams.content{height:1025px}

.rupee_big{color:#FFF; margin-left:5px;background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat;width:10px; height:16px;display: inline-block;}
.rupee_small{color:#FFF; margin-left:5px; background:url(${pageContext.request.contextPath}/resources/images/ruppe.png) no-repeat; width:7px; height:11px; display: inline-block;}
.rupee_white{color:#FFF; margin-left:5px; background:url(${pageContext.request.contextPath}/resources/images/ruppe_w.png) no-repeat; width:7px; height:11px; display: inline-block;}

/***Analysis Report Ends***/
</style>
<c:if test="${not empty theme}">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/${theme}" />
</c:if>
</head>

<body>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt1">Steps to financial freedom </h2>
    </div>
    <h1 class="page_heading fl" style="margin: 10px 0 0 0;line-height: 24px;text-align: left;font-size: 20px;color: #FFF;font-family:'Aller Bold;width: 393px;">Analysis Report - Goals, Emergency and Risk</h1>
  </div>
  <div class="content" id="analysis_report_content">
    <div class="box1 ifa_details clearfix">
      <div class="add_details fl">
        <h4 class="name">${adviserGoals.ownerName}</h4>
        <c:set var="pieces" value="${fn:split(adviserGoals.address, '_')}"/>
        <p class="address">${pieces[0]}</p>
        <p class="address">${pieces[1]}</p>
        <p class="address">${pieces[2]}</p>
      </div>
      <%-- <div class="fr logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_logo.png"/> </div> --%>
      <c:set var="photoPath" value="${adviserGoals.logoPath}"/>
      <%-- <c:set var="buPath" value="${adviserGoals.buLogoPath}"/> --%>
      <%-- PhotoPath <c:out value="${photoPath}"/> --%>
      <div class="fr logo theme_faint_border">
      	<%-- <img src="${pageContext.request.contextPath}/resources/images/ifa_logo.png"/> --%> 
      	<%
      	String photoPath1=(String) pageContext.getAttribute("photoPath");
		String x = "D:/Ffreedom-DI/images/"+photoPath1;
		File file = new File(x);
		%>
		<%-- <c:out value="<%=x %>"></c:out> --%>
				<% if (file.exists() && !file.isDirectory()) { %> 
			<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath1%>" style="height: 216px;width: 224px;" alt="Advisor Logo"/></a>
	   <% } else { %>
	   		<img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" style="height: 216px;width: 224px;" alt="Advisor Logo" /></a>
	    <% } %>
      </div>
    </div>
    <div class="box2 client_details">
      <h4 class="name"><span class="c_name theme_color">${adviserGoals.name}</span></h4>
      <c:set var="clientpieces" value="${fn:split(adviserGoals.clientAddress, '_')}"/>
        <%-- <p class="centerAll client_address">${clientpieces[0]}</p>
        <p class="centerAll client_address">${clientpieces[1]}</p> --%>
        <%-- <p class="centerAll client_address">${clientpieces[2]}</p> --%>
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
        </ul>
      </div>
    </div>
    <div class="box3 disclaimer">
    <h4 class="heading theme_color">Disclaimer</h4>
    <c:choose>
	    	<c:when test="${buPartyId eq '27829' }">
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
  <div class="footer clearfix" style="page-break-after:always">
  <div class="btm_logo fl"  style="display:none;
    background: url(/FIINFRA-M-WEB/resources/images/finfra-logo-small.png) no-repeat center center;  width: 76px;  height: 20px;  margin: -30px 0 0 21px;"></div>
    <!-- <div class="fl footer_tagline">True Friends of New Investors</div> -->
    <div class="fr page_no">(<span class="no">1</span>)</div>
  </div>
  
  <br>
  <link type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script>
$(document).ready(function(){
// createSlider('#travel_slider',0,100,1,'#travel_slider_value');
// createSlider('#car_slider',0,100,1,'#car_slider_value');
// createSlider('#education_slider',0,100,1,'#education_slider_value');
// createSlider('#business_slider',0,100,1,'#business_slider_value');
// createSlider('#property_slider',0,100,1,'#property_slider_value');
// createSlider('#spcial_goal_slider',0,100,1,'#spcial_goal_slider_value');  
/*** Common Function For Value Slider Starts ***/
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
    //$(ctrlTextBox).text($(ctrlName).slider("value"));
 
}

/*** Common Function For Value Slider Ends ***/

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
.southspace1 { margin-bottom:5px }
/* Basic Css Ends*/
.wrapper { width:792px; margin:0 auto; height:1124px; color:#3a3a3a; font-family: 'allerregular'; }
.header { height:65px; background:<%=colorCode%> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { height:1030px }
.footer { height:18px; background:#c0c0c0 }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode%>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:336px; text-align:center; line-height: 50px; }
.theme_color { color: <%=colorCode%>; }
.theme_background { background-color:<%=colorCode%>!important; }
.theme_dashed_border_bottom { border-bottom: 1px dashed <%=colorCode%>; }
.theme_doubble_border { border:2px solid <%=colorCode%>; }
.theme_faint_border { border:1px solid <%=colorCode%> }
.theme_border{ border:1px solid <%=colorCode%>; }
/***Common Css Ends***/
/***Goals My Dreams Starts***/
#goals_my_dreams { font-family: "Aller Bold"; }
#goals_my_dreams .box1 { min-height:485px; padding-top: 15px }
#goals_my_dreams .box1 .page_header { font-size: 24px; color: #FFF; text-align: center; background: url(${pageContext.request.contextPath}/resources/images/header_pattern.png) no-repeat center right; font-family: "Aller Bold"; height: 32px; line-height: 32px; text-shadow: 0px 2px 1px #000; }
#goals_my_dreams .goal_ul li { width:47%; margin:3px 0 0 23px; }
#goals_my_dreams .goal_cat { font-size:12px; margin:0 0 10px 0; text-align:center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:100%; height: 13px; }
#goals_my_dreams .goal_cat .specific { color:<%=colorCode%> }
#goals_my_dreams .goal_asset_desc .goal_val { width:170px; height:88px; background:<%=colorCodeLeft%>; margin:0 15px 0 0; -moz-border-radius: 20px 0 0 20px; -webkit-border-radius: 20px 0 0 20px; border-radius: 20px 0 0 20px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#goals_my_dreams .goal_asset_desc .asset_val { width:170px; height:88px; background:<%=colorCode%>; margin:0 0 0 15px; -moz-border-radius:0 20px 20px 0; -webkit-border-radius:0 20px 20px 0; border-radius:0 20px 20px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#goals_my_dreams .goal_asset_desc .goal_val .heading { font-size:11px; text-align:center; margin:5px 0 0;color:#fff;float:none}
#goals_my_dreams .goal_asset_desc .asset_val .heading { color:#fff; font-size:10px; text-align:center; margin: 5px 0 0;float:none }
#goals_my_dreams .goal_asset_desc .goal_value { font-size: 13px; width:48px; margin:10px 0 20px 59px; text-align: center; border-bottom: 1px dashed; padding: 0 0 1px 0;color:#fff }
#goals_my_dreams .goal_asset_desc .goal_value .lbl,#goals_my_dreams .asset_value .lbl{ position: absolute;top: 3px;font-size: 11px;left: -38px;}
#goals_my_dreams .goal_asset_desc .goal_value:after { content: "lac"; position: absolute; font-size: 12px; top: 3px; right: -18px; }
#goals_my_dreams .goal_asset_desc .goal_value:before { content: ""; background: url(${pageContext.request.contextPath}/resources/images/white_ruppe.png) no-repeat center center; width: 8px; height: 11px; top: 4px; left: -10px; display: block; position: absolute; }
#goals_my_dreams .goal_asset_desc .asset_value { font-size: 13px; width: 40px;margin:10px 0 20px 81px; text-align: center; border-bottom: 1px dashed; padding: 0 0 1px 0; color:#fff }
#goals_my_dreams .goal_asset_desc .asset_value:after { content: "lac"; position: absolute; font-size: 12px; top: 3px; right: -16px; color:#fff }
#goals_my_dreams .goal_asset_desc .asset_value:before { content: ""; background: url(${pageContext.request.contextPath}/resources/images/white_ruppe.png) no-repeat center center; width: 8px; height: 11px; top: 4px; left: -8px; display: block; position: absolute; }
#goals_my_dreams .goal_detal .goal_logo_year { height:69px; width:69px; background: #3A3A3A; position: absolute; margin: 0; top: 9px; left:149px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#goals_my_dreams .goal_detal .goal_logo_year .year { text-align: center; color: #FFF; margin: 47px 0 0; font-size: 13px; }
#goals_my_dreams .goal_detal .goal_logo_year.travel_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/travel_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.car_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/car_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.edu_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/education_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.business_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/business_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.property_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/property_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.spcial_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/special_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.retirement_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/retirement_plan_report.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.wedding_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/wedding_goal_report.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .slider_parent { width: 174px; margin: 4px auto 0; }
#goals_my_dreams .goal_detal .goal_slider { /*background: url(${pageContext.request.contextPath}/resources/images/slider_bg.png) no-repeat center center;*/ width: 141px; height: 20px; border: none; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; position:relative }
#goals_my_dreams .goal_detal .goal_slider:after { content:""; display:block; width: 157px; height: 20px; position:absolute; background: url(${pageContext.request.contextPath}/resources/images/slider_bg.png) no-repeat center center; left: -14px; }
#goals_my_dreams .goal_detal .ui-slider .ui-slider-handle {
background url(../${pageContext.request.contextPath}/resources/images/slider_button_rpt.png) no-repeat; height: 8px; width: 8px; border: none; -moz-box-shadow: 0px 1px 2px 0px #000; -webkit-box-shadow: 0px 1px 2px 0px #000; box-shadow: 0px 1px 2px 0px #000; top: 7px !important; }
#goals_my_dreams .goal_detal .goal_slider_value { font-size:12px; border:none; font-family: "none"; width: 22px; position:relative; margin:4px 0 0 10px; }
#goals_my_dreams .goal_detal .goal_slider_value:after { content: "%"; display: block; position: absolute; color: #3A3A3A; top: 0; right:-13px; font-size: 12px; }
#goals_my_dreams .goal_detal .result_stat { border:3px solid #3a3a3a; -moz-border-radius: 19px; -webkit-border-radius: 19px; border-radius: 19px; width: 98%; margin: 0 auto; height:94px }
#goals_my_dreams .goal_detal .result_stat .achievable_txt { text-align: center; font-size: 13px; line-height: 13px; margin: 9px 0 0; }
#goals_my_dreams .goal_detal .result_stat .paraTxt { margin:2px 0 2px 0; font-size:13px }
#goals_my_dreams .goal_detal .result_stat .invst_txt { font-size:10px }
#goals_my_dreams .goal_detal .result_stat .reg_invesment { width:49%; border-right:1px solid #bddcec; height: 58x; }
#goals_my_dreams .goal_detal .result_stat .one_time_invesment { width:50%; height:58px; }
#goals_my_dreams .goal_detal .result_stat .amount { font-size:14px; margin:15px 0 3px 0; position:relative }
#goals_my_dreams .goal_detal .result_stat .amount .val:before { content: ""; display: block; position: absolute; background: url(${pageContext.request.contextPath}/resources/images/black_rupee.png) no-repeat center center; width: 8px; height: 11px; left: -10px; top: 3px; }
#goals_my_dreams .goal_detal .result_stat .thumb_status { width:56px; border-top:1px solid #3a3a3a; -moz-border-radius: 12px 0 0 0; -webkit-border-radius:12px 0 0 0; border-radius: 12px 0 0 0; }
#goals_my_dreams .goal_detal .result_stat .txt_status { background:#f0f0f0; border-top:1px solid #3a3a3a; border-left:1px solid #3a3a3a; width:100%; font-size:12px; line-height:18px; color:#fff; -moz-border-radius: 0 0 16px 17px; -webkit-border-radius: 0 0 16px 17px; border-radius: 0 0 16px 17px; }
#goals_my_dreams .goal_detal .result_stat .txt_status.achievable_txt_status { width: 100%; border-left: 0; -moz-border-radius: 0 0 18px 18px; -webkit-border-radius: 0 0 18px 18px; border-radius: 0 0 18px 18px; }
#goals_my_dreams .goal_detal .result_stat .achievable_yes_thumb { background:url(${pageContext.request.contextPath}/resources/images/achivable_yes_thumb.png) no-repeat center center; width:59px; height:49px; margin:12px auto 14px; }
#goals_my_dreams .goal_detal .result_stat .quick_status .achievable { background:#2D951B;}
#goals_my_dreams .goal_detal .result_stat .quick_status .partially_achievable { background:#E69528;}
#goals_my_dreams .goal_detal .result_stat .quick_status .not_achievable { background:#D21C45;}
#goals_my_dreams .final_summary{ margin:-121px 0 0}
#goals_my_dreams .final_summary .container { background:#f4f4f4; border:1px solid <%=colorCode%>; min-height:241px; width:190px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; -moz-box-shadow: 0px 2px 0px 0px #999; -webkit-box-shadow: 0px 2px 0px 0px #999; box-shadow: 0px 2px 0px 0px #999; padding:10px }
#goals_my_dreams .final_summary > li { margin: 0 26px 0; }
#goals_my_dreams .report { margin: 0 0 0;padding: 0 10px; }
#goals_my_dreams .report .report_txt { font-size:12px; line-height: 14px; }
#goals_my_dreams .report .report_desc{height: 55px;overflow: hidden;text-overflow: ellipsis;}
#goals_my_dreams .report .goal_report_table{font-family: 'allerregular'; font-size:12px;width: 257px;
margin: 2px auto 0;}
#goals_my_dreams .report .goal_report_table th{color:#fff;text-align:center}
#goals_my_dreams .report .goal_report_table th,#goals_my_dreams .report .goal_report_table td{ padding:5px}
#goals_my_dreams .report .goal_report_table .col1{ width:96px}
#goals_my_dreams .report .goal_report_table .col2{ width:39px}
#goals_my_dreams .report .goal_report_table .col3{width:39px}
#goals_my_dreams .report .goal_report_table .col4{width:39px}
#goals_my_dreams .report .secondary_heading { background:<%=colorCode%> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; }
.theme_color { color:<%=colorCode%> }
#goals_my_dreams .report .second p.txt1 { line-height: 30px; margin: 54px 0 0; text-align: center; font-size: 12px; }
#goals_my_dreams .report .third p { line-height: 30px; text-align: center; font-size: 12px; }
#goals_my_dreams .report .third p.txt1 { margin:38px 0 0; line-height: 18px; }
#goals_my_dreams .report .third p.txt2 { line-height: 14px; text-align: left; margin: 11px 0 0; }
#goals_my_dreams .report .third .asset_combo li { margin: 3px 0; list-style: disc; }
#goals_my_dreams .report .third .asset_combo { margin: 3px 0 5px 14px; list-style: disc; }
#goals_my_dreams .report .third .asset_combo_parent { border-bottom: 1px solid #898989;
-moz-box-shadow: 0px 3px 5px -1px #A8A8A8;-webkit-box-shadow: 0px 3px 5px -1px #A8A8A8;box-shadow:0px 3px 5px -1px #A8A8A8;width: 196px;margin: 6px 0 0 -9px;
padding: 0 0 0 12px; }
#goals_my_dreams .report .third .asset_combo_parent { border-bottom: 1px solid #898989;
-moz-box-shadow: 0px 3px 5px -1px #A8A8A8;-webkit-box-shadow: 0px 3px 5px -1px #A8A8A8;box-shadow:0px 3px 5px -1px #A8A8A8;width: 196px;margin: 6px 0 0 -9px;
padding: 0 0 0 12px; }
#goals_my_dreams .report .first .money_flow { font-size: 12px; margin: 41px 0 0; text-align: center; }
#goals_my_dreams .report .first .money_flow li { line-height:20px; }
#goals_my_dreams .report .first .money_flow li .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/resources/images/black_rupee.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
#goals_my_dreams .report .first .investment .heading { background: #343434; border-top: 1px solid #AEAEAE; border-bottom: 1px solid #AEAEAE; margin: 0 0 0 -10px; width: 210px; color: #FFF; font-size: 16px; text-align: center; height: 22px; line-height: 21px; }
#goals_my_dreams .report .first .running { width:50%; text-align:left; font-size:12px }
#goals_my_dreams .report .first .reqiured { width:50%; text-align:right; font-size:12px }
#goals_my_dreams .report .first .investment p { line-height: 24px; }
#goals_my_dreams .report .first .investment { border-bottom: 1px solid #898989; -moz-box-shadow:0px 2px 5px 1px #A8A8A8; -webkit- box-shadow:0px 2px 5px 1px #A8A8A8;
box-shadow:0px 2px 5px 1px #A8A8A8; width: 189px; margin: 20px 0 0 -10px; padding: 0 10px; }
#goals_my_dreams .report .btm_logo {background: url(${pageContext.request.contextPath}/resources/images/finfra-logo-small.png) no-repeat center center;
width: 76px;height: 20px;margin: 21px 0 0 9px;}
.what_to_do th,.what_to_do td{padding:5px;font-family: 'allerregular';font-size: 12px;}
.what_to_do th{color: #fff;text-align: center;}
.what_to_do .col1{width:200px}
.what_to_do .col2{width:95px}
.assumption_footer .assumption_txt{position: absolute;top: -27px;left:20%;font-size: 11px;}

.secondary_heading { background:<%=colorCode%> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; }
/***Goals My Dreams Ends***/
</style>

<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div> --%>
      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/logo-images/70757/1-40-flat-logos_1408719471572.png"/></div> --%>
      <h2 class="head_txt2">${adviserGoals.name}</h2>
    </div>
    <h1 class="page_heading fr"></h1>
  </div>
  <br>
  <p class="secondary_heading" style="margin-top: -10px;">Goals - My Dreams</p>
		
  <div class="content" id="goals_my_dreams">
    <div class="box1 goals">
      <div class="grid_adjuster">
        <ul class="reset clearfix goal_ul">
        
        <c:set var="income" value="0" />
        <c:set var="expenses" value="0" />
        <c:set var="loanEMI" value="0" />
        <c:set var="surpluseAvbl" value="0" />
        <c:set var="currentInvestment" value="0" />
        <c:set var="requiredInvestment" value="0" />
        
        <c:set var="goalCount">0</c:set>
        <c:set var="pageNumber">2</c:set>
        <%-- <c:set var="goalNoteFlag" value="0"/> --%>
        <c:set var="goalNoteFlag" value="1"/> 
        <c:forEach items="${goalDetails}" var="goalDetail"  varStatus="iCounter"> 
        
        	<c:if test="${not empty goalDetail.goalDescription}">
       			<c:set var="goalNoteFlag" value="1"/>
       		</c:if>         
			<c:set var="thumbStatus" value="" />
			<c:set var="thumbStatusText" value="" />
			
			<c:set var="income" value="${goalDetail.monthlyincome}" />
	        <c:set var="expenses" value="${goalDetail.expence}" />
	        <c:set var="loanEMI" value="${goalDetail.loanreapayment }" />
	        <c:set var="surpluseAvbl" value="${goalDetail.surplus }" />
	        <c:set var="currentInvestment" value="${goalDetail.currentinvest }" />
	        <c:set var="requiredInvestment" value="${goalDetail.havetoinvest}" />
			
			<fmt:parseNumber var="goalCompletedPercent" type="number" value="${goalDetail.goalCompletedPercent}" />
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
             	<c:when test="${goalDetail.goalTypeName eq 'Car'}">
             		<c:set var="goalLogo" value="car_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Education'}">
             		<c:set var="goalLogo" value="edu_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Start Business'}">
             		<c:set var="goalLogo" value="business_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Property or House'}">
             		<c:set var="goalLogo" value="property_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Travel or Vacation'}">
             		<c:set var="goalLogo" value="travel_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Others'}">
             		<c:set var="goalLogo" value="spcial_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Retirement'}">
             		<c:set var="goalLogo" value="retirement_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Marriage'}">
             		<c:set var="goalLogo" value="wedding_logo" />             		
             	</c:when>
				<c:otherwise></c:otherwise>
            </c:choose>
            
            <c:if test="${goalCount eq 6}">
            		<c:set var="goalCount">0</c:set>
            		</ul>
				      </div>
				    </div>            		
            		<div class="box2 report">
				    	<!-- <div class="btm_logo fl"></div> -->
				    	<div class="clr"></div>
				    </div> 
				  </div>
				  <div class="footer clearfix" style="margin-top: -35px">
				  	<div class="btm_logo fl"  style="display:none;
    						background: url(/FIINFRA-M-WEB/resources/images/finfra-logo-small.png) no-repeat center center;  width: 76px;  height: 20px;  margin: -30px 0 0 21px;"></div>
				   <!-- <div class="fl footer_tagline">True Friends of New Investors</div> -->
				    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
				    <c:set var="pageNumber">${pageNumber + 1}</c:set>
				  </div>
				</div>
				<br/>
            	<div class="wrapper">
				  <div class="header clearfix">
				    <div class="desc_heading fl">
				      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div> --%>
				      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/logo-images/70757/1-40-flat-logos_1408719471572.png"/></div> --%>
				      <h2 class="head_txt2">${adviserGoals.name}</h2>
				    </div>
				    <h1 class="page_heading fr"></h1>
				  </div>
						
				  <div class="content" id="goals_my_dreams">
				    <div class="box1 goals">
				      <div class="grid_adjuster">
				        <ul class="reset clearfix goal_ul">
            </c:if>
            
	 		<li class="fl">			
	            <div class="goal_detal">
	              <h3 class="goal_cat"><span class="main_cat">${goalDetail.goalTypeName }</span> - <span class="specific">${goalDetail.goalName}</span></h3>
	              <div class="goal_asset_desc rel clearfix">
	                <div class="goal_val fl">
	                  <h5 class="heading"><c:choose>
	                  	<c:when test="${goalDetail.loanTaken eq 'Down Payment' }">
	                  		Down Payment PV
	                  	</c:when>
	                  	<c:otherwise>
	                  		 PV
	                  	</c:otherwise>
	                  </c:choose></h5>
	                  <div class="clr"></div>
	                  <div class="value goal_value rel"><span class="lbl">Goal</span><fmt:formatNumber type="number" pattern="#.00" minIntegerDigits="1" maxFractionDigits="2" value="${goalDetail.goalAmountPv}"/></div>
	                   <div class="value goal_value rel"><span class="lbl">Asset</span><fmt:formatNumber type="number" pattern="#.00" minIntegerDigits="1" maxFractionDigits="2" value="${goalDetail.assetValue}"/></div>
	                </div>
	                <div class="goal_logo_year ${goalLogo}">
	                  <div class="year">${goalDetail.goalEndYear }</div>
	                </div>
	                <div class="asset_val fl">
	                  <h5 class="heading fr"><c:choose>
	                  <c:when test="${goalDetail.loanTaken eq 'Down Payment' }">
	                  		Down Payment FV
	                  	</c:when>
	                  	<c:otherwise>
	                  		 FV
	                  	</c:otherwise>
	                  </c:choose></h5>
	                  <div class="clr"></div>
	                  <div class="value asset_value rel"><span class="lbl">Goal</span><fmt:formatNumber type="number" pattern="#.00" minIntegerDigits="1" maxFractionDigits="2" value="${goalDetail.goalFv}"/></div>
	                  <div class="value asset_value rel"><span class="lbl">Asset</span><fmt:formatNumber type="number" pattern="#.00" minIntegerDigits="1" maxFractionDigits="2" value="${goalDetail.assetFv}"/></div>
	                </div>
	              </div>
	              <div class="slider_parent clearfix">
	                <div class="goal_slider fl" id="slider_${iCounter.index}"></div>
	                <div class="fr goal_slider_value" id="sliderVal_${iCounter.index}"></div>
	                 <script>
	                 	createSlider('#slider_${iCounter.index}',0, 100, 1,'#sliderVal_${iCounter.index}','${goalCompletedPercent}');
	                	$("#sliderVal_${iCounter.index}").text("${goalCompletedPercent}");                	
	                </script>
	              </div>
	              
	              <c:choose>
	              	<c:when test="${goalCompletedPercent eq 100 }">
	              		<div class="result_stat">
			                <div class="achievable_yes_thumb"></div>
			                <div class="quick_status clearfix">
			                  <div class="centerAll txt_status achievable_txt_status ${thumbStatus}">This goal can be achieved with existing asset</div>
			                </div>
		              </div>
	              	</c:when>
	              	<c:otherwise>
		              	<div class="result_stat">
			                <p class="centerAll paraTxt">Investment Required to Achieve ${goalDetail.loanTaken}</p>
			                <div class="fl reg_invesment">
			                  <p class="amount centerAll"><span class="val rel">${goalDetail.regularInvestAmt}</span></p>
			                  <p class="centerAll invst_txt">Regular Investment</p>
			                </div>
			                <div class="fr one_time_invesment">
			                  <p class="amount centerAll"><span class="val rel">${goalDetail.lumpsumAmount}</span></p>
			                  <p class="centerAll invst_txt">One time Investment</p>
			                </div>
			                <div class="clr">&nbsp;</div>
			                <div class="quick_status clearfix">                	
			                	
			                  <%-- <div class="fl thumb_status ${thumbStatus}"></div> --%>
			                  <div class="fr centerAll txt_status ${thumbStatus}">${thumbStatusText}</div>
			                </div>
		              	</div>
	              	</c:otherwise>
	              </c:choose>
	            </div>
	          </li>          
	          
	          <c:set var="goalCount">${goalCount + 1}</c:set>
	          
	   	 </c:forEach>
              
            <c:choose>
		         <c:when test="${goalNoteFlag eq 1}">
		         	<c:set var="cntVar" value="2"/>
		         </c:when>
		         <c:otherwise>
		         	<c:set var="cntVar" value="3"/>
		         </c:otherwise>
		    </c:choose>  
              
         <c:choose>                   
	         <c:when test="${(goalCount gt cntVar) or (goalCount eq 0)}">
	         		</ul>
				      </div>
				      
				   <c:if test="${goalNoteFlag eq 1}">
		              	<div class="description">
		                <p style="font-weight:bold;">Notes</p>
		                <div class="goal_nm">
							<p><span class="inlineBlock" style="min-width: 150px;">Retirement :- </span></p>
							<p style="margin-left: 20px;">For Retirement Goal the PV denotes the present value of Monthly Expense as on today and 
							FV denotes the FV of monthly expense as in retirement Year.</p>
					    </div>
		                   <c:forEach var="goalNote" items="${goalDetails}">
		                   <c:if test="${not empty goalNote.goalDescription}">
						      <div class="goal_nm">
						       		<p><span class="inlineBlock" style="min-width: 150px;">${goalNote.goalName} :- </span></p>
						       		<p style="margin-left: 20px;">${goalNote.goalDescription}</p>
			                  </div>
			               </c:if>
			               	</c:forEach>
	           			</div>
			           	<c:set var="goalNoteFlag" value="0"/>
			       </c:if>
				      
				    </div>  
				    <div class="box2 report">
				    	<!-- <div class="btm_logo fl"></div> -->
				    	<div class="clr"></div>
				    </div>          		            		
				  </div>
				  <div class="footer clearfix" style="margin-top: -35px">
				  	<div class="btm_logo fl"  style="display:none;
    						background: url(/FIINFRA-M-WEB/resources/images/finfra-logo-small.png) no-repeat center center;  width: 76px;  height: 20px;  margin: -30px 0 0 21px;"></div>
				  <!-- <div class="fl footer_tagline">True Friends of New Investors</div> --> 
				    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
				    <c:set var="pageNumber">${pageNumber + 1}</c:set>
				  </div>
				  
				  
				  
				</div>
				<br/>
            	<div class="wrapper">
				  <div class="header clearfix">
				    <div class="desc_heading fl">
				      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div> --%>
				      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/logo-images/70757/1-40-flat-logos_1408719471572.png"/></div> --%>
				      <h2 class="head_txt2">${adviserGoals.name}</h2>
				    </div>
				    <h1 class="page_heading fr"> </h1>
				  </div>
						
				  <div class="content" id="goals_my_dreams">
				    <div class="box1 goals">
			<c:if test="${goalNoteFlag eq 1}">
              	<div class="description">
                <p style="font-weight:bold;">Notes</p>
                <div class="goal_nm">
					<p><span class="inlineBlock" style="min-width: 150px;">Retirement :- </span></p>
					<p style="margin-left: 20px;">For Retirement Goal the PV denotes the present value of Monthly Expense as on today and 
					FV denotes the FV of monthly expense as in retirement Year.</p>
			    </div>
                   <c:forEach var="goalNote" items="${goalDetails}">
                   <c:if test="${not empty goalNote.goalDescription}">
				      <div class="goal_nm">
				       		<p><span class="inlineBlock" style="min-width: 150px;">${goalNote.goalName} :- </span></p>
				       		<p style="margin-left: 20px;">${goalNote.goalDescription}</p>
	                  </div>
	               </c:if>
	               	</c:forEach>
	           	</div>
	           	<c:set var="goalNoteFlag" value="0"/>
	          </c:if>
				    </div>
				    <div class="box2 report">
					      <p class="report_txt southspace1 secondary_heading">My Cash Flow</p>
			      		<p class="report_txt report_desc southspace1">
			      		To achieve your goals you can use both the assets you have already built as well as assets you will build in future. You can build assets in future when you invest your monthly surplus amount (excess of income over expenses) wisely.
						Where you should invest your money can be decided based on two parameters 1) How many years later will you need the money? 2) How much risk can you tolerate in your investments?
			      		</p>
					    <table class="goal_report_table fl" style="margin-top: -10px;">
					        <tbody>
					        <tr>
					        	<th class="theme_background theme_border col1">Description</th>
					        	<th class="theme_background theme_border col1">Amount</th>
					        </tr>
					        <tr>
					          <td class="theme_border">Your Income</td><td class="theme_border"><span class="rupee_small"></span> ${income}</td>
					          </tr>
					          <tr>
					          <td class="theme_border">Your Expense</td><td class="theme_border">
					          <span class="rupee_small"></span>
						          <c:choose>
						          	<c:when test="${empty expenses}">
						          		0.0
						          	</c:when>
						          	<c:otherwise>
						          		${expenses}
						          	</c:otherwise>
						          </c:choose>
					          </td>
					          </tr>
					          <tr>
					          <td class="theme_border">Your Loan EMI</td><td class="theme_border"><span class="rupee_small"></span> ${loanEMI}</td>
					        </tr> 
					        <tr>
					          <td class="theme_border">Current Investment</td><td class="theme_border"><span class="rupee_small"></span> ${currentInvestment}</td>
					        </tr>        
					      </tbody></table>
					      <table class="goal_report_table fr" style="margin-top: -10px">
					        <tbody>      
					        	<tr>
					        		<th class="theme_background theme_border col1">Surplus Available <span class="rupee_white"></span> ${surpluseAvbl}</th>
					        	
					        	</tr>
					        	<tr>
					        		<td class="theme_border col1 centerAll strong">Investment Required</td>
					        	</tr>
					        	<tr>
					        		<td class="theme_border centerAll"><span class="rupee_small"></span> ${requiredInvestment}</td>
					        	</tr>
						  </tbody></table>
					      <div class="clr"></div>
					      <c:choose>
					      	<c:when test="${adviserGoals.riskProfileId eq 40001}">
					      		<p class="report_txt southspace1 secondary_heading northspace3" style="margin-top: 6px;">My Risk Profile : <span class="profile_type">Conservative</span></p>
					      		<p class="report_txt report_desc">You may not like taking too much risk with your investments.   You may find it more comfortable to pay off your loans (if you have any) over investing any surplus money for growth.If you choose investments that are more stable and give steady returns, you are likely to stick to your decisions and hence will be in a better position to reach your goals.However, there could be some risks that you may not be seeing now - like risk of capital erosion due to inflation.</p>
					      	</c:when>
					      	<c:when test="${adviserGoals.riskProfileId eq 40002}">
					      		<p class="report_txt southspace1 secondary_heading northspace3" style="margin-top: 6px;">My Risk Profile : <span class="profile_type">Balanced</span></p>
					      		<p class="report_txt report_desc">You are more likely to take moderate risk with your investments. You probably understand different kinds of risks - risks that can result in loss to capital in the short term and risks that can result in loss to purchasing power in the long term.If you have a loan and some surplus money, you are likely to weigh the costs and benefits of repaying loans vs. investing the money and then taking a decision.</p>
					      	</c:when>
					      	<c:when test="${adviserGoals.riskProfileId eq 40003}">
					      		<p class="report_txt southspace1 secondary_heading northspace3" style="margin-top: 6px;">My Risk Profile : <span class="profile_type">Aggressive</span></p>
					      		<p class="report_txt report_desc">You probably have a high appetite for risk and are willing to try new things and give second chances. Steady investments where there is not much action may make you restless.  You are likely to forget the losses of the past and expect a repeat of the good times.</p>
					      	</c:when>
					      </c:choose>
					      <p class="secondary_heading" style="margin-top: -10px;">Recommended Asset Allocation</p>     
					      <table class="goal_report_table">
					        <tr>
					          <th class="theme_background theme_border col1">Years to Goal</th>
					          <th class="theme_background theme_border col2">Equity</th>
					          <th class="theme_background theme_border col3">Debt</th>
					          <th class="theme_background theme_border col4">Gold</th>
					        </tr>        
					        <c:forEach items="${riskProfileMap}" var="riskProfileList">
					        	<tr>
						          <td class="theme_border">${riskProfileList.key}</td>
						          <c:forEach items="${riskProfileList.value}" var="riskProfile">
						          	<td class="theme_border centerAll">${riskProfile.allocationPercent}%</td>
						          </c:forEach>	          
						        </tr>
					        </c:forEach>        
					      </table>
					    <div class="clr"></div> 
					   
					  
					   <%-- <table class="goal_report_table assumptions_made">
					        <tbody>
					        <tr>
					        	<th class="theme_background theme_border" colspan="4">Assumptions Made</th>
					        	
					        </tr>
					        <tr>
					          <td class="theme_border">Inflation</td>
					          <td class="theme_border">Returns From Equity</td>
					         <td class="theme_border">Returns From Debt</td>
					          <td class="theme_border">Returns From Gold</td>
					          </tr>
					          <tr>
					          <td class="theme_border">${adviserGoals.inflationRate}</td>
					          <td class="theme_border">${adviserGoals.equityFund}</td>
					          <td class="theme_border">${adviserGoals.debtFund}</td>
					          <td class="theme_border">${adviserGoals.goldFund}</td>
					        </tr>        
					      </tbody></table> --%>
					    <div class="clr"></div>
					    </div>					    
					  </div>
					  <div class="footer clearfix assumption_footer rel" style="margin-top:-25px;">
					  <p class="assumption_txt"><span class="strong">Assumptions Made : </span>Inflation:${adviserGoals.inflationRate}%,Returns From Equity:${adviserGoals.equityFund}%,Returns From Debt:${adviserGoals.debtFund}%,Returns From Gold:${adviserGoals.goldFund}%</p>
					  	<div class="btm_logo fl"  style="display:none;
    						background: url(/FIINFRA-M-WEB/resources/images/finfra-logo-small.png) no-repeat center center;  width: 76px;  height: 20px;  margin: -30px 0 0 21px;"></div>
					     <!-- <div class="fl footer_tagline">True Friends of New Investors</div> --> 
					    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
				    	<c:set var="pageNumber">${pageNumber + 1}</c:set>
					  </div>
					</div>
	         </c:when>  
	         <c:otherwise>
	         	        </ul>
					      </div>
					      
			<c:if test="${goalNoteFlag eq 1}">
              	<div class="description">
                <p style="font-weight:bold;">Notes</p>
                <div class="goal_nm">
					<p><span class="inlineBlock" style="min-width: 150px;">Retirement :- </span></p>
					<p style="margin-left: 20px;">For Retirement Goal the PV denotes the present value of Monthly Expense as on today and 
					FV denotes the FV of monthly expense as in retirement Year.</p>
			    </div>
                   <c:forEach var="goalNote" items="${goalDetails}">
                   <c:if test="${not empty goalNote.goalDescription}">
				      <div class="goal_nm">
				       		<p><span class="inlineBlock" style="min-width: 150px;">${goalNote.goalName} :- </span></p>
				       		<p style="margin-left: 20px;">${goalNote.goalDescription}</p>
	                  </div>
	               </c:if>
	               	</c:forEach>
	           	</div>
	           	<c:set var="goalNoteFlag" value="0"/>
	          </c:if>
					      
					    </div>
					  <div class="box2 report">
					      <p class="report_txt southspace1 secondary_heading">My Cash Flow</p>
			      		<p class="report_txt report_desc southspace1">
			      		To achieve your goals you can use both the assets you have already built as well as assets you will build in future. You can build assets in future when you invest your monthly surplus amount (excess of income over expenses) wisely.
						Where you should invest your money can be decided based on two parameters 1) How many years later will you need the money? 2) How much risk can you tolerate in your investments?
			      		</p>
					    <table class="goal_report_table fl" style="margin-top: -10px;">
					        <tbody>
					        <tr>
					        	<th class="theme_background theme_border col1">Description</th>
					        	<th class="theme_background theme_border col1">Amount</th>
					        </tr>
					        <tr>
					          <td class="theme_border">Your Income</td><td class="theme_border"><span class="rupee_small"></span> ${income}</td>
					          </tr>
					          <tr>
					          <td class="theme_border">Your Expense</td><td class="theme_border">
					          <span class="rupee_small"></span>
						          <c:choose>
						          	<c:when test="${empty expenses}">
						          		0.0
						          	</c:when>
						          	<c:otherwise>
						          		${expenses}
						          	</c:otherwise>
						          </c:choose>
					          </td>
					          </tr>
					          <tr>
					          <td class="theme_border">Your Loan EMI</td><td class="theme_border"><span class="rupee_small"></span> ${loanEMI}</td>
					        </tr>
					        <tr>
					          <td class="theme_border">Current Investment</td><td class="theme_border"><span class="rupee_small"></span> ${currentInvestment}</td>
					        </tr>         
					      </tbody></table>
					      <table class="goal_report_table fr" style="margin-top: -10px">
					        <tbody>      
					        	<tr>
					        		<th class="theme_background theme_border col1">Surplus Available <span class="rupee_white"></span> ${surpluseAvbl}</th>
					        	
					        	</tr>
					        	<tr>
					        		<td class="theme_border col1 centerAll strong">Investment Required</td>
					        	</tr>
					        	<tr>
					        		<td class="theme_border centerAll"><span class="rupee_small"></span> ${requiredInvestment}</td>
					        	</tr>
						  </tbody></table>
					      <div class="clr"></div>
					      <c:choose>
					      	<c:when test="${adviserGoals.riskProfileId eq 40001}">
					      		<p class="report_txt southspace1 secondary_heading northspace3" style="margin-top: 6px;">My Risk Profile : <span class="profile_type">Conservative</span></p>
					      		<p class="report_txt report_desc">You may not like taking too much risk with your investments.   You may find it more comfortable to pay off your loans (if you have any) over investing any surplus money for growth.If you choose investments that are more stable and give steady returns, you are likely to stick to your decisions and hence will be in a better position to reach your goals.However, there could be some risks that you may not be seeing now - like risk of capital erosion due to inflation.</p>
					      	</c:when>
					      	<c:when test="${adviserGoals.riskProfileId eq 40002}">
					      		<p class="report_txt southspace1 secondary_heading northspace3" style="margin-top: 6px;">My Risk Profile : <span class="profile_type">Balanced</span></p>
					      		<p class="report_txt report_desc">You are more likely to take moderate risk with your investments. You probably understand different kinds of risks - risks that can result in loss to capital in the short term and risks that can result in loss to purchasing power in the long term.If you have a loan and some surplus money, you are likely to weigh the costs and benefits of repaying loans vs. investing the money and then taking a decision.</p>
					      	</c:when>
					      	<c:when test="${adviserGoals.riskProfileId eq 40003}">
					      		<p class="report_txt southspace1 secondary_heading northspace3" style="margin-top: 6px;">My Risk Profile : <span class="profile_type">Aggressive</span></p>
					      		<p class="report_txt report_desc">You probably have a high appetite for risk and are willing to try new things and give second chances. Steady investments where there is not much action may make you restless.  You are likely to forget the losses of the past and expect a repeat of the good times.</p>
					      	</c:when>
					      </c:choose>
					      <p class="secondary_heading" style="margin-top: -10px;">Recommended Asset Allocation</p>    
					      <table class="goal_report_table">
					        <tr>
					          <th class="theme_background theme_border col1">Years to Goal</th>
					          <th class="theme_background theme_border col2">Equity</th>
					          <th class="theme_background theme_border col3">Debt</th>
					          <th class="theme_background theme_border col4">Gold</th>
					        </tr>        
					        <c:forEach items="${riskProfileMap}" var="riskProfileList">
					        	<tr>
						          <td class="theme_border">${riskProfileList.key}</td>
						          <c:forEach items="${riskProfileList.value}" var="riskProfile">
						          	<td class="theme_border centerAll">${riskProfile.allocationPercent}%</td>
						          </c:forEach>	          
						        </tr>
					        </c:forEach>        
					      </table>
					      <div class="clr"></div> 
					   
					  
					  <%--  <table class="goal_report_table assumptions_made">
					        <tbody>
					        <tr>
					        	<th class="theme_background theme_border" colspan="4">Assumptions Made</th>
					        	
					        </tr>
					        <tr>
					          <td class="theme_border">Inflation</td>
					          <td class="theme_border">Returns From Equity</td>
					         <td class="theme_border">Returns From Debt</td>
					          <td class="theme_border">Returns From Gold</td>
					          </tr>
					          <tr>
					          <td class="theme_border">${adviserGoals.inflationRate}</td>
					          <td class="theme_border">${adviserGoals.equityFund}</td>
					          <td class="theme_border">${adviserGoals.debtFund}</td>
					          <td class="theme_border">${adviserGoals.goldFund}</td>
					        </tr>        
					      </tbody></table> --%>
					    <div class="clr"></div>      
					    </div>					    
					  </div>
					  <div class="footer clearfix assumption_footer rel" style="margin-top:-25px;">
					  <p class="assumption_txt"><span class="strong">Assumptions Made : </span>Inflation:${adviserGoals.inflationRate}%,Returns From Equity:${adviserGoals.equityFund}%,Returns From Debt:${adviserGoals.debtFund}%,Returns From Gold:${adviserGoals.goldFund}%</p>
					  	<div class="btm_logo fl"  style="display:none;background: url(/FIINFRA-M-WEB/resources/images/finfra-logo-small.png) no-repeat center center;  width: 76px;  height: 20px;  margin: -30px 0 0 21px;"></div>
					    <!-- <div class="fl footer_tagline">True Friends of New Investors</div> -->
					    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
				    	<c:set var="pageNumber">${pageNumber + 1}</c:set>
					  </div>
					</div>
	         </c:otherwise>
         </c:choose>
         
<br/>
<c:if test="${fn:contains(fpSection, '39001') or fn:contains(fpSection, '39003') }">
<script>
$(document).ready(function(){
	
	/*var fpsection = "${fpSection}";
	var result = fpsection.split(",");
	result = result.sort(); */
	/* alert(result.indexOf("39002")); */

function createProgressbar(ctrlName,val) {

    $(ctrlName).progressbar({
      value: val
    });
    
}

   createProgressbar('#progressbar1',${suggestionData.minimumEmergncyFund / suggestionData.idealEmergencyFund * 100});
   createProgressbar('#progressbar2',${suggestionData.lifeCurrentCover / suggestionData.lifeIdealCover * 100});
   createProgressbar('#progressbar3',${suggestionData.healthCurrentCover / suggestionData.healthIdealCover * 100});
   createProgressbar('#progressbar4',${((suggestionData.accidentCurrentCover + suggestionData.criticalCurrentCover)/(suggestionData.accidentIdealCover + suggestionData.criticalIdealCover)) * 100});
	
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
.header { height:65px; background:<%=colorCode%> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { height:1030px }
.footer { height:18px; background:#c0c0c0 }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode%>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 336px; text-align: center; line-height: 50px; }
.theme_color { color: <%=colorCode%>; }
.theme_background { background-color: <%=colorCode%>!important; }
/***Common Css Ends***/
/***Emergency Planning Starts***/
#emergency-planning.content{height: 1000px;} 
#emergency-planning .box1 .page_header { font-size: 24px; color: #FFF; text-align: center; background: url(images/header_pattern.png) no-repeat center right; font-family: "Aller Bold"; height: 32px; line-height: 32px; text-shadow: 0px 2px 1px #000; }
#emergency-planning .emergency_desc { width:255px; height:140px; background: <%=colorCodeLeft%>; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:255px; height:140px; background: <%=colorCode%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:50px; width:50px; background: #3A3A3A; position: absolute; margin: 0; top:-23px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0 auto 0; width:511px; }
#emergency-planning .fixed { height:169px; padding-top: 10px; }
#emergency-planning .fixed ul { padding:19px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 19px; font-family: "Aller Bold"; color:#000 }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 12px; margin:37px 0 0; padding:0 7px 0 19px; line-height: 14px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align: left }
#emergency-planning .emergency_category .fund_status { margin: 15px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:18px; color: #fff; font-size: 11px; }
#emergency-planning .emergency_category .fund_status .value { color:#fff }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/resources/images/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:50%; text-align:center }
#emergency-planning .emergency_category .fund_status .additional { width:50%; text-align:center }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 12px; padding: 0 8px; line-height: 14px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .emergency_action .txt .req_money { color:#000 }
#emergency-planning .emergency_category .ui-progressbar { background:#FFF/* #056595 */; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 197px; margin: 5px auto 3px; overflow: hidden; position:relative }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:<%=colorCodeLeft%>; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color:#000/* #056595 */; display:inline-block; width:1px; margin:0; position:absolute }
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
#emergency-planning .variable { height:550px; }
#emergency-planning .variable > ul li { margin:29px 0 0; }
#emergency-planning .variable .secondary_heading{background:<%=colorCode%> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; }
#emergency-planning .box3.report .secondary_heading{background:<%=colorCode%> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; margin:0 0 10px 0 }
#goals_my_dreams .report .secondary_heading { background:<%=colorCode%> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size: 754px auto; height:29px; text-align:center; font-size: 20px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height:26px; }
#emergency-planning .report { height: 280px; }

#emergency-planning .report .container { background: #F4F4F4; border: 1px solid <%=colorCode%>; min-height: 94px; width:256px; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 95%; }
#emergency-planning .report .first .txt { margin: 0 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/resources/images/theme_color_ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
#emergency-planning .btm_logo { background: url(${pageContext.request.contextPath}/resources/images/finfra-logo-small.png) no-repeat center center; width: 76px; height: 20px; margin:-30px 0 0 21px }
/***Emergency Planning Ends***/
</style>
<c:choose>
	<c:when test="${fn:contains(fpSection, '39001')}">
		<div class="header clearfix">
	    <div class="desc_heading fl">
	      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div> --%>
	      <h2 class="head_txt2">${adviserGoals.name}</h2>
	    </div>
	   <%-- 	<c:set var="fpsection" value="${fn:split(fpSection, ',')}" /> --%>
	    <h1 class="page_heading fr"></h1>
	  </div>
	  <br><p class="secondary_heading" style="margin-top: -10px;">Emergency Planning</p>
	</c:when>
	<c:otherwise>
		<div class="header clearfix">
	    <div class="desc_heading fl">
	      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div> --%>
	      <h2 class="head_txt2">${adviserGoals.name}</h2>
	    </div>
	   <%-- 	<c:set var="fpsection" value="${fn:split(fpSection, ',')}" /> --%>
	    <h1 class="page_heading fr"></h1>
	  </div>
	  <br><p class="secondary_heading">Risk Planning</p>
	</c:otherwise>
</c:choose>
<div class="content" id="emergency-planning">

	<c:if test="${fn:contains(fpSection, '39001')}">		
    <div class="box1 fixed">
      <ul class="reset clearfix">
        <li>
          <div class="emergency_category rel clearfix">
            <h3 class="category_name">Loss of Job</h3>
            <div class="emergency_desc fl">
              <p class="txt">Sudden health issues, loss of job can happen to anyone. It is very important to be prepared.</p>
            </div>
            <div class="goal_logo_year loss_of_job"> </div>
            <div class="emergency_action fr">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.minimumEmergncyFund}" /></span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Required</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.idealEmergencyFund}" /></span> lacs</div>
                </div>
              </div>
              <div id="progressbar1">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <p class="txt">Set aside 6 months worth of expenses. Build this corpus - keep them in bank accounts or liquid mutual funds. Ensure joint holding with someone who you trust.</p>
            </div>
          </div>
        </li>
      </ul>
    </div>
	</c:if>
	<c:if test="${fn:contains(fpSection, '39003')}">
		<div class="box2 variable">
		<c:if test="${fn:contains(fpSection, '39003') and fn:contains(fpSection, '39001') }">
      <p class="secondary_heading">Risk Planning</p></c:if>
      <ul class="reset clearfix">
        <li>
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
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.lifeCurrentCover}" /></span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Required</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.lifeIdealCover}" /></span> lacs</div>
                </div>
              </div>
              <div id="progressbar2">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <p class="txt">
               <c:set var="diffLife" value="${suggestionData.lifeIdealCover - suggestionData.lifeCurrentCover}"/>
              <c:if test="${diffLife > 0 }">
              Get yourself a term life insurance policy for Rs. ${diffLife} lacs
                </c:if>
                <c:if test="${diffLife <= 0 }">
                 Excellent! You have adequate life insurance coverage.
                </c:if>
                <br>
                Your Insurance Is Calculated Using 
                <c:choose>
                	<c:when test="${suggestionData.insuranceMethod == 0}"> HLV </c:when>
                	<c:when test="${suggestionData.insuranceMethod == 1}"> Expense </c:when>
                	<c:when test="${suggestionData.insuranceMethod == 2}"> Income </c:when>
                </c:choose> Method.
                </p>
            </div>
          </div>
        </li>
        <li>
          <div class="emergency_category rel clearfix">
            <h3 class="category_name">Health Setback</h3>
            <div class="emergency_desc fl">
              <p class="txt">Our hurried lifestyle makes us vulnerable to many illnesses. Many families suffer financially due to hospitalization expenses. Insurance can safeguard your wealth and give peace of mind.</p>
            </div>
            <div class="goal_logo_year health_setback"> </div>
            <div class="emergency_action fr">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.healthCurrentCover}" /></span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Required</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.healthIdealCover}" /></span> lacs</div>
                </div>
              </div>
              <div id="progressbar3">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <p class="txt">
              <c:set var="diffHealth" value="${suggestionData.healthIdealCover - suggestionData.healthCurrentCover}"/>
              <c:if test="${diffHealth > 0 }">
              Get Basic health insurance of Rs. ${diffHealth} lacs to all family.
              </c:if> 
              <c:if test="${diffHealth <= 0 }">
                Excellent! You have adequate health insurance coverage.
              </c:if>
                
                <!-- &amp; Additional Top up health cover of Rs.10,00,000 for the family (floater) --></p>
            </div>
          </div>
        </li>
        <li>
          <div class="emergency_category rel clearfix">
            <h3 class="category_name">Disabilities</h3>
            <div class="emergency_desc fl">
              <p class="txt">Disability to an earning member will increase expenses and also affect income. Disability can happen because of Critical Illnesses or Accidents.</p>
            </div>
            <div class="goal_logo_year disabilities"> </div>
            <div class="emergency_action fr">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.accidentCurrentCover + suggestionData.criticalCurrentCover}" /></span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Required</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount"><fmt:formatNumber type="number" maxFractionDigits="2" value="${suggestionData.accidentIdealCover + suggestionData.criticalIdealCover}" /></span> lacs</div>
                </div>
              </div>
              <div id="progressbar4">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <p class="txt">
              <c:set var="diffCritical" value="${ suggestionData.criticalIdealCover - suggestionData.criticalCurrentCover}"/>
              <c:set var="diffAccidental" value="${ suggestionData.accidentIdealCover - suggestionData.accidentCurrentCover}"/>
              <c:if test="${diffCritical > 0 }">
              Take Critical Illness Insurance for Rs. ${diffCritical} lacs (one year income).
              </c:if>  <c:if test="${diffCritical <= 0 }">
              Excellent! You have adequate Critical Illness Insurance coverage.
              </c:if>
              <c:if test="${diffAccidental > 0}">
              <br> Take Accidental Disability Insurance for Rs. ${diffAccidental} lacs (one year income)
               </c:if>
                <c:if test="${diffAccidental <= 0}">
               Excellent! You have adequate Accidental Disability Insurance coverage.
               </c:if>
               </p>
               
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="box3 report">
    <p class="secondary_heading">What To Do?</p>
      <ul class="clearfix reset">
        <li class="fl first">
          <div class="container">
            <p class="txt">Though we wish they don't, Bad things may happen to anyone. It is important to be protected against setbacks like income loss, health loss etc to ensure your wealth is available for your Goals and Dreams.</p>
          </div>
        </li>
        <li class="fr second">
       <%--   <div class="container">--%> 
         <table class="what_to_do fr">
					        <tbody>      
					        	<tr>
					        		<th class="theme_background theme_border col1" colspan="2">Protect yourself with(In Lacs)</th>
					        	
					        	</tr>
					        	
					        	<tr>
					        		<td class="theme_border col1">Life Insurance for</td>
					        		<td class="theme_border col2">
					        		<span class="rupee_small"></span>
					        			<c:choose>
						        			<c:when test="${diffLife > 0}">
						        				${diffLife} Lacs
						        			</c:when>
						        			<c:otherwise>
						        				0.00 Lacs
						        			</c:otherwise>
					        			</c:choose>
					        		</td>
					        	</tr>
						        <tr>
						          <td class="theme_border">Health insurance for</td>
						          <td class="theme_border">
						          <span class="rupee_small"></span>
						          	<c:choose>
						        			<c:when test="${diffHealth > 0}">
						        				${diffHealth} Lacs
						        			</c:when>
						        			<c:otherwise>
						        				0.00 Lacs
						        			</c:otherwise>
					        			</c:choose>
						          </td>
						        </tr>
						         <tr>
						          <td class="theme_border">Critical Illness Insurance</td>
						          <td class="theme_border">
						          <span class="rupee_small"></span>
						          	<c:choose>
						        			<c:when test="${diffCritical > 0}">
						        				${diffCritical} Lacs
						        			</c:when>
						        			<c:otherwise>
						        				0.00 Lacs
						        			</c:otherwise>
					        			</c:choose>
						          </td>
						        </tr>
						         <tr>
						          <td class="theme_border">Accidental Disability insurance</td>
						          <td class="theme_border">
						          <span class="rupee_small"></span>
						          	<c:choose>
						        			<c:when test="${diffAccidental > 0}">
						        				${diffAccidental} Lacs
						        			</c:when>
						        			<c:otherwise>
						        				0.00 Lacs
						        			</c:otherwise>
					        			</c:choose>
						          </td>
						        </tr>
					      </tbody></table>
          <%--   <ul class="reset clearfix">
              <li> Protect yourself with</li>
              <li>Life Insurance for <span class="rs_symbol"></span><span class="theme_color">
              <c:choose>
              	<c:when test="${diffLife > 0}">
              		<fmt:formatNumber type="number" maxFractionDigits="2" value="${diffLife}" />
              	</c:when>
              	<c:otherwise>
              		0.00 
              	</c:otherwise>
              </c:choose>
              lacs</span></li>
              <li>Health insurance for <span class="rs_symbol"></span><span class="theme_color">
              <c:choose>
              	<c:when test="${diffHealth > 0}">
              		<fmt:formatNumber type="number" maxFractionDigits="2" value="${diffHealth}" />
              	</c:when>
              	<c:otherwise>
              		0.00 
              	</c:otherwise>
              </c:choose>
               lacs</span></li>
             <!--  <li>Health insurance - Top up - for the whole family <span class="rs_symbol"></span><span class="theme_color">10,00,000</span></li> -->
              <li>Critical Illness Insurance <span class="rs_symbol"></span><span class="theme_color">
              <c:choose>
              	<c:when test="${diffCritical > 0}">
              		<fmt:formatNumber type="number" maxFractionDigits="2" value="${diffCritical}" />
              	</c:when>
              	<c:otherwise>
              		0.00 
              	</c:otherwise>
              </c:choose>
               lacs</span></li>
              <li>Accidental Disability insurance <span class="rs_symbol"></span><span class="theme_color">
              <c:choose>
              	<c:when test="${diffAccidental > 0}">
              		<fmt:formatNumber type="number" maxFractionDigits="2" value="${diffAccidental}" />
              	</c:when>
              	<c:otherwise>
              		0.00 
              	</c:otherwise>
              </c:choose>
               lacs</span></li>
            </ul>
          </div>
        </li>
      </ul>--%>
    <%-- </div>  --%>  
	</c:if>
  </div>
  <div class="footer clearfix" style="margin-top:-40px;">
  	<div class="btm_logo fl"  style="display:none;
    background: url(/FIINFRA-M-WEB/resources/images/finfra-logo-small.png) no-repeat center center;  width: 76px;  height: 20px;  margin: -30px 0 0 21px;"></div>
    <!-- <div class="fl footer_tagline">True Friends of New Investors</div> -->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
	<c:set var="pageNumber">${pageNumber + 1}</c:set>
  </div>
  
<br>
</c:if>
</body>
</html>