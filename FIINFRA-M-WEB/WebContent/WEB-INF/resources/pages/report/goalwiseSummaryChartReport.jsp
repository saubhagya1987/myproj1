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
.wrapper3 { width:792px; margin:0 auto;/* height:1124px; */color:#3a3a3a; font-family: 'allerregular'; }
.wrapper3 .verticle_side { height:60px; width:1124px; background-color:#3a3a3a; position:absolute; top:532px; margin: 0px 0px 0px -533px; z-index:5; -webkit-transform: rotate(270deg); -moz-transform: rotate(270deg); -o-transform: rotate(270deg); }
.wrapper3 .verticle_side p.verticle { font-family: "Aller Bold"; font-size:24px; color:#fff; text-align: center; line-height: 60px; /*-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg); -o-transform: rotate(270deg);*/ }
.header3 { height:65px; background:<%=colorCode %> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size:754px auto;}
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
.head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 50px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; }
/***Financial Planning Summary Ends***/

.goals_icon_bx { width:82px; height:82px; position:absolute; right: 8px; top: 0; border:3px solid <%=colorCodeLeft%>; border-radius: 50px; background-color:#FFF; }
.goals_icon { width:56px; height:45px; background:url(${pageContext.request.contextPath}/resources/images/my_dream_goal_icon.png) no-repeat center center; margin: 18px 13px; }
.ifa_head_logo { width:45px; height:47px; background:url(${pageContext.request.contextPath}/resources/images/ifa_head_logo.png) no-repeat center center; float:left; margin-left: 15px; }
.content .description { height:auto; margin: 10px 20px; height: 62px; border:3px solid <%=colorCodeLeft %>; border-radius: 5px; padding:5px; -webkit-box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); -moz-box-shadow:0px 3px 5px 0px rgba(50, 50, 50, 0.75); box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); }
.content .description .title { font-size:14px; font-family: "Aller Bold"; }
.content .description .txt { font-size:12px; text-indent: 20px; font-family: "allerregular"; text-align: justify; }
/*green box*/
.box { width:100%; /*height:100px;*/ border-top:1px solid #333; margin-top:22px; position:relative; }
.box .green { background-color:<%=colorCodeLeft%>; border-radius: 15px; padding:5px 10px 5px 55px; font-size: 14px; text-align:left; font-family: "allerregular"; color:#000; position:absolute; top: -12px; left: 10px; }
.box .green .logo { width: 40px; height: 40px; position: absolute; top: -8px; left: 5px; border: 1px solid <%=colorCodeLeft%>; border-radius: 50px; background-color: #FFF; color:#1d87bd; }
/*icons*/
.box .green .logo .house { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/house.png) no-repeat center center; }
.box .green .logo .car { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/car.png) no-repeat center center; }
.box .green .logo .education { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/education.png) no-repeat center center; }
.box .green .logo .vacation { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/vacation.png) no-repeat center center; }
.box .green .logo .wedding { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/wedding.png) no-repeat center center; }

.box .green .logo .business { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/icns-business.png) no-repeat center center; }
.box .green .logo .special { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/special-goal.png) no-repeat center center; background-size: 70%; }
.box .green .logo .other{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/other_goals.png) no-repeat center center; background-size: 70%; }
.box .green .logo .retirement{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/resources/images/retirement_plan.png) no-repeat center center; }


/*icons*/

/*green box*/
/*green box*/
.box .grey_box_cnt_two { margin:27px 0px 12px 0px; width:auto; z-index: 9; background-color:#fff; border-bottom:1px solid #5d5d5d; }
.box .grey_box_cnt_two:after { margin:27px 10px 12px 10px; width:100%; background: url(${pageContext.request.contextPath}/resources/images/big_drop_shadow.png) no-repeat center center; content: ""; position: absolute; display: block; height: 15px; bottom: -7px; z-index: -1; }
.box .grey_box_cnt_two .grey_box { width:140px; background-color:#dedede; position:relative; z-index:9; float:left; }
.box .grey_box_cnt_two .grey_box:after { width:140px; background: url(${pageContext.request.contextPath}/resources/images/bx_shadow.png) no-repeat center center; content: ""; position: absolute; display: block; height: 15px; bottom: -7px; z-index: -1; }
.box .grey_box .top { width:140px; height:40px; background-color:#dedede; }
.box .grey_box .top .title { text-align: left; font-family: "Aller Bold"; color: <%=colorCode%>; font-size: 12px; width: 98px; float: right; margin-top: 10px; }
.box .grey_box .middle { width:140px; height:114px; border-bottom:1px solid <%=colorCodeLeft%>; }
/*left*/


/*title*/
.GWS_title_bx { width: 100%; margin-bottom:10px; margin-top:10px; background-color:#f3f3f3; }
.GWS_title_bx ul { list-style:none; padding: 0; margin: 0; }
.GWS_title_bx ul li.input_title_one { width: 13%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 20px; }
.GWS_title_bx ul li.input_title_two { width: 13%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; }
.GWS_title_bx ul li.input_title_three { width: 16%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; text-align:center; }
.GWS_title_bx ul li.input_title_four { width: 12%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 1px 0px 37px; text-align:center; }
.GWS_title_bx ul li.input_title_five { width: 10%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 32px; text-align:center; }
.GWS_title_bx ul li.input_title_six { width: 9%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; text-align:center; }
.GWS_title_bx ul li.input_title_seven { width: 3%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; }
.input_rupee_txt { font-family: "allerregular"; }
/*title ends*/

/*txt*/
.GWS_txt { width: 100%; margin-bottom:5px; margin-top:5px; }
.GWS_txt ul { list-style:none; padding: 0; margin: 0; }
.GWS_txt ul li.input_txt_one { width: 14%; padding-right:10px; font-family: "allerregular"; font-size: 12px; color: #000; margin-left: 19px; }
.GWS_txt ul li.input_txt_two { width: 11%; margin:5px 6px 0px 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
.GWS_txt ul li.input_txt_two .bx { border-bottom:1px dashed <%=colorCodeLeft%>; width:62%; padding-bottom: 5px; }
.GWS_txt ul li.input_txt_two .bx .txt { color:<%=colorCode%>; font-family: "aller bold"; font-size: 14px; }
.GWS_txt ul li.input_txt_two .bx .per { }
.GWS_txt ul li.input_txt_three { width: 21%; margin-left: 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
/*Recommended Investment Amount Box*/
.ria_bx { width:168px; height:40px; background-color: <%=colorCode%>; border-radius: 6px; -moz-border-radius: 6px; -webkit-border-radius: 6px; }

.ria_bx .left{line-height:20px;}

.check_bx{width: 22px;height: 34px;float: left;}

.check_bx_top{width: 20px;height: 22px;float: left;background: url(${pageContext.request.contextPath}/resources/images/blank_checkbox.png) no-repeat center center;}

.check_bx_bottom{width: 20px;height: 14px;float: left;background: url(${pageContext.request.contextPath}/resources/images/blank_checkbox.png) no-repeat center center;}
.ria_bx .right { width:85px; height:26px; text-align:right; }
.ria_bx .right .rupee { color: #FFF; margin: 5px 3px 0 4px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width: 7px; height: 11px; float: left; }
.ria_bx .right .amt { color: #fff; margin:5px 3px 0 4px; font-size: 10px; border-bottom: 1px dashed <%=colorCodeLeft%>; float: left; padding-bottom: 2px; height: 8px; width: 75%; text-align: left; }
/*Recommended Investment Amount Box*/


.GWS_txt ul li.input_txt_four { width: 16%; margin-left: 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
/*Rupee Box*/
.GWS_txt ul li.input_txt_four .rupee { color: #FFF; margin: 5px 3px 0 4px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width: 7px; height: 11px; float: left; }
.GWS_txt ul li.input_txt_four .amt { font-family: "aller bold"; font-size: 14px; color: <%=colorCode%>; margin:2px 3px 0 4px; font-size: 14px; border-bottom: 1px dashed <%=colorCodeLeft%>; float: left; padding-bottom: 2px; height: 14px; }
/*Rupee Box*/

.GWS_txt ul li.input_txt_five { width: 13%; margin:5px 0px 0px 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
/*Date Box*/
.GWS_txt ul li.input_txt_five .date_bx { width:105px; height:16px; margin-left: 0px; }
.GWS_txt ul li.input_txt_five .date_bx .date_no { width: 13px; height: 13px; border: 1px solid #000; float: left; font-size: 12px; color: #cfcfcf; background-color: #FFF; margin-left: 2px; text-align: center; padding-top: 1px; }
/*Date Box*/

.GWS_txt ul li.input_txt_six { width: 9%; margin:5px 0px 0px 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
.GWS_txt ul li.input_txt_six .date_no { width: 13px; height: 13px; border: 1px solid #000; font-size: 12px; color: #cfcfcf; background-color: #FFF; margin-left: auto; text-align: center; padding-top: 1px; margin-top: 0px; margin-right: auto; margin-bottom: 0px; }
/*Date Box*/

.GWS_txt ul li.input_txt_seven { width: 11%; margin:5px 0px 0px 0px; font-family: "aller bold"; font-size: 12px; color: #3a3a3a; }
.GWS_txt ul li.input_txt_seven .rupee { color: #FFF; margin: 5px 3px 0 4px; background-image: url(${pageContext.request.contextPath}/resources/images/ruppe.png); width: 7px; height: 11px; float: left; }
.GWS_txt ul li.input_txt_seven .amt { font-family: "aller bold"; font-size: 14px; color: <%=colorCode%>; margin: 2px 3px 0 4px; font-size: 14px; border-bottom: 1px dashed <%=colorCodeLeft%>; float: left; padding-bottom: 2px; height: 14px; }

/*txt ends*/
</style>
<div class="wrapper3 clearfix">
  <div class="header3 clearfix">
    <div class="desc_heading fl">
      <div class="ifa_head_logo"></div>
      <h2 class="head_txt1">${ContactDetails.name}</h2>
    </div>
    <h1 class="page_heading fr">Goals wise Summary Chart
      <div class="goals_icon_bx">
        <div class="goals_icon"></div>
      </div>
    </h1>
  </div>
  <div class="content" id="financial_planning_summary_content">
  <c:set var="totalCount" value="2"/>
  <c:forEach var="goals" items="${GoalWiseProductDetails}">
    <c:forEach var="productlist" items="${goals.value.clientActionPlanList}">
    <c:set var="goalName" value="${productlist.goalName}"/>
    <c:set var="goalTypeId" value="${productlist.goalTypeId}"/>
    </c:forEach>
    <div class="box clearfix">
      <div class="green">${goalName}
        <div class="logo">
        <c:choose>
			  <c:when test="${goalTypeId==35001}">
			    <!-- education -->
			    <div class="education"></div>
			  </c:when>
			  <c:when test="${goalTypeId==35003}">
			   <!-- house -->
			   <div class="house"></div>
			  </c:when>
			   <c:when test="${goalTypeId==35004}">
			    <!-- wedding -->
			    <div class="wedding"></div>
			  </c:when>
			  <c:when test="${goalTypeId==35005}">
			    <!-- travel and vacation -->
			    <div class="vacation"></div>
			  </c:when>
			  <c:when test="${goalTypeId==35006}">
			    <!-- car -->
			  <div class="car"></div>
			  </c:when>
			  <c:when test="${goalTypeId==35008}">
			    <!-- Special -->
			    <div class="special"></div>
			  </c:when>
			   <c:when test="${goalTypeId==35012}">
			    <!-- BUsiness -->
			    <div class="business"></div>
			  </c:when>
			  <c:when test="${goalTypeId==35013}">
			    <!-- Other -->
			    <div class="other"></div>
			  </c:when>
			  <c:when test="${goalTypeId==35015}">
			   <!-- Retirement -->
			   <div class="retirement"></div>
			  </c:when>
			</c:choose>
        </div>
      </div>
      <div class="grey_box_cnt_two">
        <div class="GWS_title_bx">
          <ul>
            <li class="input_title_one fl">Recommended Products</li>
            <li class="input_title_two fl">Goal Fulfillment Percentage</li>
            <li class="input_title_three fl">Recommended Investment Amount</li>
            <li class="input_title_four fl">Approved Amount</li>
            <li class="input_title_five fl">Execution Date</li>
            <li class="input_title_six fl">Client Approval</li>
            <c:if test="${reportFor eq 'advisor'}">
            <li class="input_title_seven fl">Potential Revenue</li>
            </c:if>
            <div class="clr"></div>
          </ul>
        </div>
        <c:forEach var="productlist" items="${goals.value.clientActionPlanList}" varStatus="innerRowCount">
        <div class="GWS_txt">
          <ul>
            <li class="input_txt_one fl">${productlist.productName} </li>
            <li class="input_txt_two fl">
              <div class="bx"> <span class="txt">${productlist.goalPercentage}</span> <span class="per">%</span> </div>
            </li>
            <li class="input_txt_three fl">
              <div class="ria_bx clearfix">
              <div class="check_bx"> <div class="check_bx_top"></div> <div class="check_bx_bottom"></div></div>
                <div class="left fl">Lumpsum :<br/>
                  SIP :</div>
                <div class="right fl">
                  <div class="rupee"></div>
                  <div class="amt">${productlist.lumpSumAmt}</div>
                  <div class="rupee"></div>
                  <div class="amt">${productlist.sipAmt}</div>
                </div>
              </div>
            </li>
            <li class="input_txt_four fl">
              <div class="rupee"></div>
              <div class="amt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            </li>
            <li class="input_txt_five fl">
              <div class="date_bx">
                <div class="date_no">D</div>
                <div class="date_no">D</div>
                <div class="date_no">M</div>
                <div class="date_no">M</div>
                <div class="date_no">Y</div>
                <div class="date_no">Y</div>
              </div>
            </li>
            <li class="input_txt_six fl">
              <div class="date_no"> </div>
            </li>
            <c:if test="${reportFor eq 'advisor'}">
            <li class="input_txt_seven fl">
              <div class="rupee"></div>
              <div class="amt">${productlist.revenueAmount}</div>
            </li>
            </c:if>
            <div class="clr"></div>
          </ul>
          <!-- txt ends--> 
          
        </div>
       <c:set var="totalCount" value="${totalCount+1}"/>
        <c:if test="${totalCount eq 25}">
        <div class="footer clearfix"> 
    	<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  		</div>
        <div style="page-break-before:always"></div>
        <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
        <c:set var="totalCount" value="0"/>
        </c:if>
        </c:forEach>
      </div>
    </div>
    <c:set var="totalCount" value="${totalCount+2}"/>
    <c:if test="${totalCount > 25}">
    <div class="footer clearfix"> 
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  	</div>
        <div style="page-break-before:always"></div>
        <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
        <c:set var="totalCount" value="${2}"/>
    </c:if>
    </c:forEach>
    <!--One Row Ends--> 
    
    <!--Second Row Ends--> 
    
    <!--Third Row Ends--> 
    
  </div>
  <c:if test="${totalCount != 0 and totalCount != 2 }">
  <div class="footer clearfix"> 
    <!-- div class="fl footer_tagline">True Friends of New Investors</div -->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  </div>
  </c:if>
</div>
<c:if test="${totalCount != 0 and totalCount != 2 }">
<div style="page-break-before:always"></div>
 <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
</c:if>

