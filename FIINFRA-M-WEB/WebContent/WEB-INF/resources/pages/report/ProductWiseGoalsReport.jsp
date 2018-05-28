<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
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
 
 %>
<!--Common Custom checkbox -->

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
/* Basic Css Ends*/
.wrapper2 { width:792px; margin:0 auto; /* height:1124px; */ color:#3a3a3a; font-family: 'allerregular';}
.wrapper2 .verticle_side { height:60px; width:1124px; background-color:#3a3a3a; position:absolute; top:532px; margin: 0px 0px 0px -533px; z-index:5; -webkit-transform: rotate(270deg); -moz-transform: rotate(270deg); -o-transform: rotate(270deg); }
.wrapper2 .verticle_side p.verticle { font-family: "Aller Bold"; font-size:24px; color:#fff; text-align: center; line-height: 60px; /*-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg); -o-transform: rotate(270deg);*/ }
.header2 { height:65px; background:<%=colorCode %> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size:754px auto;}
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0 0px; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { /*height:1041px*/ }
.footer { height:18px; background:#c0c0c0 }
.page_heading { /* color: #FFF; */ font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: left; width: 388px; position:relative; text-shadow: 1px 3px 1px #414141; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
/* .head_txt2 { color: #1D87BD; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center } */
.theme_color { color: #1D87BD; }
/***Common Css Ends***/

/*Common Custom checkbox ends*/
.c_box { height:20px; width:20px; margin: 0 auto; }
/*** Common custom checkbobx ***/
.default_checkbox { opacity:0; display:none }
.common_custom_checkbox { background: url(${pageContext.request.contextPath}/resources/images/blank_checkbox.png) no-repeat center center; height:20px; width:20px; display:block; }
.white_checkbox_checked { background: url(${pageContext.request.contextPath}/resources/images/checkbox.png) no-repeat center center; display: block; height: 20px; width: 20px; }
/*** Common custom checkbobx ends ***/


/***Financial Planning Summary Starts***/
.head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 50px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;  }
/***Financial Planning Summary Ends***/

.goals_icon_bx{ width:82px; height:82px; position:absolute; right: 8px; top: 0; border:3px solid <%=colorCodeLeft%>; border-radius: 50px; background-color:#FFF; }
.goals_icon{ width:56px; height:45px; background:url(${pageContext.request.contextPath}/resources/images/my_dream_goal_icon.png) no-repeat center center; margin: 18px 13px;}

.ifa_head_logo { width:45px; height:47px; background:url(${pageContext.request.contextPath}/resources/images/ifa_head_logo.png) no-repeat center center; float:left; margin-left: 15px; }
.content .description { height:auto; margin: 10px 20px; height: 62px;
border:3px solid <%=colorCodeLeft %>; border-radius: 5px; padding:5px; -webkit-box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); -moz-box-shadow:    0px 3px 5px 0px rgba(50, 50, 50, 0.75); box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); }
.content .description .title { font-size:14px; font-family: "Aller Bold"; }
.content .description .txt { font-size:12px; text-indent: 20px; font-family: "allerregular"; text-align: justify; }
/*green box*/
.box { width:100%; /*height:100px;*/ border-top:1px solid #333; margin-top:22px; position:relative; }
.box .greenNew { background-color:<%=colorCodeLeft%>;  border-radius: 15px; padding:5px 10px; font-size: 14px; text-align:left; font-family: "Aller Bold"; color:#000; position:absolute; top: -12px; left: 10px; }
/*blue box*/
.box .blue { background-color:<%=colorCode%>; border-radius: 15px; padding:5px 12px; font-size: 14px; text-align:center; font-family: "Aller Bold"; color:#000; position:absolute; right: 10px; top: -10px; }
.box .blue .lumpsum { float:left; }
.box .blue .lumpsum .rupee { color:#FFF; margin-left:5px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width:7px; height:11px; display: inline-block; }
.box .blue .lumpsum .amt { color:#FFF; border-bottom:1px dashed #8bb51a; margin-left:5px; font-family: "allerregular"; }
.box .blue .sip { float:left; margin-left: 20px; }
.box .blue .sip .rupee { color:#FFF; margin-left:5px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width:7px; height:11px; display: inline-block; }
.box .blue .sip .amt { color:#FFF; border-bottom:1px dashed #8bb51a; margin-left:5px; font-family: "allerregular"; }
/*green box*/
/*green box*/
.box .grey_box_cnt { margin:0px 10px 12px 10px; width:auto; }
.box .grey_box_cnt .grey_box { width:140px; background-color:#dedede; position:relative; z-index:9; float:left; margin-top: 27px; }
.box .grey_box_cnt .grey_box:after { width:140px; background: url(${pageContext.request.contextPath}/resources/images/bx_shadow.png) no-repeat center center; content: ""; position: absolute; display: block; height: 15px; bottom: -7px; z-index: -1; }
.box .grey_box .top { width:140px; height:40px; background-color:#dedede; }
.box .grey_box .top .logo { width: 40px; height: 40px; position: absolute; left: -2px; top: -2px; border: 1px solid <%=colorCodeLeft%>; border-radius: 50px; background-color: #FFF; color:<%=colorCode%>; }

/* Title */

.box .grey_box .top .title { text-align: left; font-family: "Aller Bold"; color: <%=colorCode%>; font-size: 12px; width: 98px; float: right; margin-top: 10px; }
.box .grey_box .top .title .yr { text-align: left; font-family: "allerregular"; color: <%=colorCode%>; font-size: 10px; width: 98px; float: right; margin-top: 5px; }

/*icons*/
.box .grey_box .top .logo .house { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/house.png) no-repeat center center; }
.box .grey_box .top .logo .car { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/car.png) no-repeat center center; }
.box .grey_box .top .logo .education { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/education.png) no-repeat center center; }
.box .grey_box .top .logo .vacation { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/vacation.png) no-repeat center center; }
.box .grey_box .top .logo .wedding { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/wedding.png) no-repeat center center; }

.box .grey_box .top .logo .business { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/icns-business.png) no-repeat center center; }
.box .grey_box .top .logo .special { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/special-goal.png) no-repeat center center;background-size: 70%;}
.box .grey_box .top .logo .other{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/other_goals.png) no-repeat center center; background-size: 70%;}
.box .grey_box .top .logo .retirement{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/retirement_plan.png) no-repeat center center; }

/*icons*/
.box .grey_box .top .title { text-align: left; font-family: "Aller Bold"; color: <%=colorCode%>; font-size: 12px; width: 98px; float: right; margin-top: 10px; }
.box .grey_box .middle { width:140px; height:114px; border-bottom:1px solid <%=colorCodeLeft%>; }
/*Left*/
.box .grey_box .middle .left { width:69px; height:114px; border-right:1px solid <%=colorCodeLeft%>; float:left }
.box .grey_box .middle .left .title { font-family: "Aller Bold"; color: <%=colorCode%>; font-size: 8px; text-align:center; margin: 8px auto 8px auto; }
.box .grey_box .middle .left .img { width:47px; height:40px; background-image: url(${pageContext.request.contextPath}/resources/images/lumpsum_amount.png); margin: 7px auto 5px auto; }
/*amount*/
.box .grey_box .middle .left .lumpsum { float:left; margin-top:5px; }
.box .grey_box .middle .left .lumpsum .rupee { color:#FFF; margin:0 2px 0 5px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width:7px; height:11px; float: left; }
.box .grey_box .middle .left .lumpsum .amt { color:<%=colorCode%>; font-size: 10px; float:left; }
/*Left*/

/*Right*/
.box .grey_box .middle .right { width:70px; height:114px; float:left; }
.box .grey_box .middle .right .title { font-family: "Aller Bold"; color: <%=colorCode%>; font-size: 8px; text-align:center; margin: 8px auto 8px auto; }
.box .grey_box .middle .right .img { width:24px; height:35px; background: url(${pageContext.request.contextPath}/resources/images/sip_amount.png) no-repeat; margin: 8px auto 10px auto; }
/*amount*/
.box .grey_box .middle .right .sip { float:left; margin-top: 5px; }
.box .grey_box .middle .right .sip .rupee { color:#FFF; margin:0 2px 0 5px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width:7px; height:11px; float: left; }
.box .grey_box .middle .right .sip .amt { color:<%=colorCode%>; font-size: 10px; float:left; }
/*Right*/

.box .grey_box .bottom { width:140px; height:30px; background-color:#dedede; }
/*left*/
.box .grey_box .bottom .left { width:69px; height:30px; float:left }
.box .grey_box .bottom .left .title { font-family: "aller bold"; color: #000; font-size: 7px; margin-bottom: 2px; margin-top: 4px; text-align:center; }
.box .grey_box .bottom .left .rupee { color:#FFF; margin:0 3px 0 2px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width:7px; height:11px; float: left; }
.box .grey_box .bottom .left .amt { color:#000; font-size: 9px; border-bottom: 1px dashed <%=colorCode%>; float: left; width:53px; padding-bottom:2px; height:10px; }
/*left*/
/*right*/
.box .grey_box .bottom .right { width:69px; height:30px; float:left }
.box .grey_box .bottom .right .title { font-family: "aller bold"; color: #000; font-size: 7px; margin-bottom: 3px; margin-top: 4px; text-align:center; }
.box .grey_box .bottom .right .date_bx { width:69px; height:11px; margin-left: 5px; }
.box .grey_box .bottom .right .date_bx .date_no { width: 10px; height: 9px; border: 1px solid #000; float: left; font-size: 7px; color: #cfcfcf; background-color: #FFF; margin-left: -1px; text-align: center; padding-top: 1px; }
/*right*/


.divide_line{ height:135px; width:1px; background-color:#dfdfdf; float:left; margin:25px 8px 0 9px; }
</style>
<div class="wrapper2 clearfix">
  <div class="header2 clearfix">
    <div class="desc_heading fl">
      <div class="ifa_head_logo"></div>
      <h2 class="head_txt1">${ContactDetails.name}</h2>
    </div>
    <h1 class="page_heading fr">Goals - My Dreams
      <div class="goals_icon_bx"><div class="goals_icon"></div></div>
    </h1>
  </div>
  <div class="content" id="financial_planning_summary_content">
    <div class="description">
      <div class="title">Description</div>
      <div class="txt"> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit.	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis .</div>
    </div>
   <%--  <c:forEach var="product" items="${goalDetails}">
    <div class="box">
    <div class="greenNew"></div>
    <div class="blue">
        <div class="lumpsum">Total Lumpsum :
          <div class="rupee"></div>
          <span class="amt"></span></div>
        <div class="sip">Total SIP :
          <div class="rupee"></div>
          <span class="amt"></span></div>
      </div>
    <c:forEach var="goallist" items="${product.value.clientActionPlanList}">
    goalName : ${goallist.goalName}
    lumpSumAmt : ${goallist.lumpSumAmt}
    sipAmt : ${goallist.sipAmt}
    </c:forEach> 
    <br>
    </c:forEach>--%>
    <c:set var="rowCounter" value="${1}"/>
     <c:set var="totalCounter" value="${1}"/>
    <c:forEach var="product" items="${productWiseGoalDetails}">
     <div class="box clearfix">
      <div class="greenNew">${product.value.productName}</div>
      <div class="blue">
        <div class="lumpsum">Total Lumpsum :
          <div class="rupee"></div>
          <span class="amt">${product.value.totalLumpSumAmt}</span></div>
        <div class="sip">Total SIP :
          <div class="rupee"></div>
          <span class="amt">${product.value.totalSipAmt}</span></div>
      </div>
      
     <div class="grey_box_cnt clearfix">
     <c:set var="counter" value="${1}"/>
     <c:set var="pageCnt2" value="2"/>
     <c:forEach var="goallist" items="${product.value.clientActionPlanList}">
     <div class="grey_box"> 
          <!--Top-->
          <div class="top">
            <div class="logo">
            <c:choose>
			  <c:when test="${goallist.goalTypeId==35001}">
			    <!-- education -->
			    <div class="education"></div>
			  </c:when>
			  <c:when test="${goallist.goalTypeId==35003}">
			   <!-- house -->
			   <div class="house"></div>
			  </c:when>
			   <c:when test="${goallist.goalTypeId==35004}">
			    <!-- wedding -->
			    <div class="wedding"></div>
			  </c:when>
			  <c:when test="${goallist.goalTypeId==35005}">
			    <!-- travel and vacation -->
			    <div class="vacation"></div>
			  </c:when>
			  <c:when test="${goallist.goalTypeId==35006}">
			    <!-- car -->
			  <div class="car"></div>
			  </c:when>
			  <c:when test="${goallist.goalTypeId==35008}">
			    <!-- Special -->
			    <div class="special"></div>
			  </c:when>
			   <c:when test="${goallist.goalTypeId==35012}">
			    <!-- BUsiness -->
			    <div class="business"></div>
			  </c:when>
			  <c:when test="${goallist.goalTypeId==35013}">
			    <!-- Other -->
			    <div class="other"></div>
			  </c:when>
			  <c:when test="${goallist.goalTypeId==35015}">
			   <!-- Retirement -->
			   <div class="retirement"></div>
			  </c:when>
			</c:choose>
            </div>
            <div class="title">${goallist.goalName}<div class="yr">goal year (${goallist.goalYear})</div></div>
          </div>
          <!--Top--> 
          <!--Middle-->
          <div class="middle">
            <div class="left">
              <div class="title">Lumpsum Amount </div>
              <div class="img"></div>
              <div class="c_box"> <span class="common_custom_checkbox"></span>
                <input type="checkbox" class="default_checkbox"/>
              </div>
              <div class="lumpsum">
                <div class="rupee"></div>
                <span class="amt">${goallist.lumpSumAmt}</span></div>
            </div>
            <div class="right">
              <div class="title">SIP Amount </div>
              <div class="img"></div>
              <div class="c_box"> <span class="common_custom_checkbox"></span>
                <input type="checkbox" class="default_checkbox"/>
              </div>
              <div class="sip">
                <div class="rupee"></div>
                <span class="amt">${goallist.sipAmt}</span></div>
            </div>
          </div>
          <!--Middle--> 
          
          <!--Bottom-->
          <div class="bottom">
            <div class="left">
              <div class="title">Approved Amount </div>
              <div class="rupee"></div>
              <span class="amt"></span></div>
            <div class="right">
              <div class="title">Execution Date</div>
              <div class="date_bx">
                <div class="date_no">D</div>
                <div class="date_no">D</div>
                <div class="date_no">M</div>
                <div class="date_no">M</div>
                <div class="date_no">Y</div>
                <div class="date_no">Y</div>
              </div>
            </div>
          </div>
          <!--Bottom--> 
        </div>
        <!-- test -->
        
        <c:if test="${counter % 5 != 0 }">
        <div class="divide_line"></div>
        </c:if>
        <c:if test="${counter % 5 == 0 }">
        <br><br><br>
        </c:if>
        <c:set var="counter" value="${counter+1}"/> 
        
        <c:set var="totalCounter" value="${totalCounter+1}"/>
        <c:if test="${totalCounter == 25 }">
        <div class="footer clearfix"> 
	    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
	  	</div>
        <div style="page-break-before:always"></div>
        <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
        <c:set var="totalCounter" value="${1}"/>
        <c:set var="rowCounter" value="1"/>
        <c:set var="pageCnt2" value="${pageCnt2+1}"/>
        </c:if>
        
         
        </c:forEach>
        </div>
           
    </div>
    <c:set var="rowCounter" value="${rowCounter+1}"/>
    <c:if test="${rowCounter % 5 == 0 }">
    <div class="footer clearfix"> 
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
    <c:set var="pageCnt2" value="${pageCnt2+1}"/>
  	</div>
        <div style="page-break-before:always"></div>
        <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
         <c:set var="totalCounter" value="1"/>
    </c:if>
    </c:forEach>
    
    <!--One Row Ends-->
    
    
    
  </div>
  <c:if test="${totalCounter !=1 }">
  <div class="footer clearfix"> 
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  </div>
  </c:if>
</div>
<c:if test="${totalCounter !=1 }">
<div style="page-break-before:always"></div>
<c:set var="pageNumber" value="${pageNumber+1 }"/>
</c:if>

