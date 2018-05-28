<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%-- <%@page import="in.fiinfra.partner.controller.PartnerProfileController"%> --%>
<%-- <%@page import="in.fiinfra.common.diy.models.UserSession"%> --%>
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
<c:set var="pageNumber" value="1"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Action Plan PDF</title>
</head>
<style>
.page2 .box .test {
background:url(/FIINFRA-APP/images/diyimages/shoping-cart.png) no-repeat 10px 9px #C2D872; color:#000;
background-size:22px 20px;
width:48px; height:47px;
border-radius: 29px;
font-size: 11px;
text-align: center;
font-family: "Aller Bold";
position: absolute;
right: 10px;
top: -27px; z-index: 999; line-height: 72px; 
}
	/************************* Common CSS ***********************************/
/***Custom Fonts Strats***/
/* @font-face {
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
}*/ 
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
.wrapper { width:792px; margin:0 auto; height:1124px; color:#3a3a3a; font-family: 'allerregular'; }
.wrapper .verticle_side{height:60px; width:1124px; background-color:#3a3a3a; position:absolute; top:532px; margin: 0px 0px 0px -533px;z-index:5; -webkit-transform: rotate(270deg);-moz-transform: rotate(270deg); -o-transform: rotate(270deg);}
.wrapper .verticle_side p.verticle{ font-family: "Aller Bold"; font-size:24px; color:#fff; text-align: center;line-height: 60px; /*-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg); -o-transform: rotate(270deg);*/}
.header { height:65px; background:<%=colorCode %> url(${pageContext.request.contextPath}/images/diyimages/<%=imagePath %>) no-repeat center right; background-size:100%;}
.desc_heading1 { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0 38px; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0 0px; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content {/* height:1041px; overflow:hidden; */ width:100%; height: 1000px; }
.footer { height:18px; background:#c0c0c0;width: 800px; }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: left; width: 300px; margin-left: 45px; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode %>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
.theme_color { color: <%=colorCode %>; }
/***Common Css Ends***/
/************************* Common CSS ***********************************/

/************************* Page 1 CSS *******************************/
/***Financial Planning Summary Starts***/
.page1 .head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 47px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; }
.page1 .content{height:1041px;} 
.page1 #financial_planning_summary_content .ifa_details { height:310px; padding:0 35px; }
.page1 #financial_planning_summary_content .ifa_details .add_details { margin:44px 0 0 50px;; width:38% }
.page1 #financial_planning_summary_content .ifa_details .name { font-family: "Aller Bold"; font-size: 23px; margin: 0 0 3px 0; }
.page1 #financial_planning_summary_content .ifa_details .address { width:300px; font-size: 17px; line-height: 21px; }
.page1 #financial_planning_summary_content .ifa_details .logo { margin:24px 0 0; width:48%; text-align: right }
.page1 #financial_planning_summary_content .client_details { height:320px;}
.page1 #financial_planning_summary_content .client_details .name { color: <%=colorCode %>; font-family: "Aller Bold"; font-size: 32px; margin: 0 0 0 90px; padding: 15px 0 0; }
.page1 #financial_planning_summary_content .client_details .category { height:74px; width:74px; border:2px solid <%=colorCode %>; -moz-border-radius: 69px; -webkit-border-radius: 69px; border-radius: 69px;-moz-box-shadow: 0px 0px 4px 2px #9F9F9F;-webkit-box-shadow: 0px 0px 4px 2px #9F9F9F;box-shadow: 0px 0px 4px 2px #9F9F9F; }
.page1 #financial_planning_summary_content .client_details .grid_adjuster { margin-left:-30px }
.page1 #financial_planning_summary_content .client_details .category_ul { margin:50px 0 0 35px; }
.page1 #financial_planning_summary_content .client_details .category_ul li { margin-left:79px }
.page1 #financial_planning_summary_content .client_details .category_ul .cat_name { font-family: "Aller Bold"; font-size: 12px; width: 100%; text-align: center; margin: 20px 0 0;height: 19px; }
.page1 #financial_planning_summary_content .client_details .category_ul .value{margin: 20px 0 0;}
.page1 #financial_planning_summary_content .client_details .category_ul .value span{border-bottom: 1px dashed <%=colorCode %>;padding: 0 10px;font-family: "Aller Bold"; font-size: 22px;}
.page1 #financial_planning_summary_content .client_details .category_ul .first .category{ background:url(${pageContext.request.contextPath}/images/diyimages/my_dream_goal_icon.png) no-repeat center center #fff}
.page1 #financial_planning_summary_content .client_details .category_ul .second .category{ background:url(${pageContext.request.contextPath}/images/diyimages/emergency.png) no-repeat center center #fff}
.page1 #financial_planning_summary_content .client_details .category_ul .third .category{ background: url(${pageContext.request.contextPath}/images/diyimages/risk.png) no-repeat center center #fff}
.page1 #financial_planning_summary_content .client_details .category_ul .fourth .category{ background: url(${pageContext.request.contextPath}/images/diyimages/succession.png) no-repeat center center #fff}
.page1 #financial_planning_summary_content .client_details .category_ul .five .category{ background: url(${pageContext.request.contextPath}/images/diyimages/retirement.png) no-repeat center center #fff}
.page1 #financial_planning_summary_content .disclaimer{height: 351px; margin:0 0 0 90px}
.page1 #financial_planning_summary_content .disclaimer .heading{ color:<%=colorCode %>;font-family: "Aller Bold"; font-size: 15px; margin:0 0 24px}
.page1 #financial_planning_summary_content .disclaimer .txt{font-size: 14px;height: 325px; line-height:19px;text-align: justify;}
.page1 #financial_planning_summary_content .disclaimer .btm_logo{ background:url(${pageContext.request.contextPath}/images/diyimages/btm_logo.png) no-repeat center center;width:194px;height:35px}

/* .page1 #financial_planning_summary_content .disclaimer .btm_logo1{ background:url(${pageContext.request.contextPath}/images/diyimages/fiinfra-logo.png) no-repeat center center;width:140px;height:35px} */

/***Financial Planning Summary Ends***/
/************************* Page 1 CSS *******************************/

/************************* Page 2 CSS *******************************/
/***Financial Planning Summary Starts***/

.page2 .c_box{margin: 5px 0px 0px 28px;}

.page2 .head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 50px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; color:<%=colorCode %>; }
.page2 .ifa_head_logo { width:45px; height:47px; /* background:url(${pageContext.request.contextPath}/images/diyimages/ifa_head_logo.png) no-repeat center center; */ float:left; margin-left: 15px; }
/***Financial Planning Summary Ends***/

.page2 .goals_icon_bx{ width:72px; height:72px; position:relative; right: 8px; top: 0; border:3px solid <%=colorCodeLeft %>; border-radius: 50px; background-color:#FFF; }
.page2 .goals_icon{ width:56px; height:45px; background:url(${pageContext.request.contextPath}/images/diyimages/my_dream_goal_icon.png) no-repeat center center; margin: 13px 8px;}
.page2 .content .description { height:auto;height: auto;border:1px solid <%=colorCodeLeft %>; border-radius: 5px; padding: 2px 5px 2px 5px; -webkit-box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); -moz-box-shadow:    0px 3px 5px 0px rgba(50, 50, 50, 0.75); box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75);font-size: 15px; }
.page2 .content .description .goal_nm{font-size:12px; text-indent: 20px; font-family: "allerregular"; text-align: justify; margin:5px 0px 5px 0px;}
.page2 .content .description .goal_nm span{font-weight:bold;}
.page2 .content .description .title { font-size:14px; font-family: "Aller Bold"; }
.page2 .content .description .title{width:770px; height:100px; border:1px solid <%=colorCodeLeft %>; margin:10px auto 0px auto;box-shadow:0px 3px 5px #3a3a3a;}

/*.content .description .txt { font-size:12px; text-indent: 20px; font-family: "allerregular"; text-align: justify; }*/
/*green box*/
.page2 .box { width:100%; /*height:100px;*/ border-top:1px solid #333; margin-top:25px; position:relative; }
.page2 .box .green { background-color:<%=colorCodeLeft %>; width:auto; padding-top:5px; padding-bottom:5px; padding-left:10px;padding-right:10px; border-radius: 15px; font-size: 14px; text-align:center; font-family: "Aller Bold"; color:#FFF; position:absolute; top: -12px; left: 10px; }
/*blue box*/
.page2 .box .blue { background-color:<%=colorCode %>; border-radius: 15px; padding:5px 12px; font-size: 14px; text-align:center; font-family: "Aller Bold"; color:#000; position:absolute; right: 68px; top: -13px; }
.page2 .box .blue .lumpsum { float:left; }
.page2 .box .blue .lumpsum .rupee { color:#FFF; margin-left:5px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe_w.png); width:7px; height:11px; display: inline-block; }
.page2 .box .blue .lumpsum .amt { color:#FFF; border-bottom:1px dashed #8bb51a; margin-left:5px; font-family: "allerregular"; }
.page2 .box .blue .sip { float:left; margin-left: 20px; }
.page2 .box .blue .sip .rupee { color:#FFF; margin-left:5px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe_w.png); width:7px; height:11px; display: inline-block; }
.page2 .box .blue .sip .amt { color:#FFF; border-bottom:1px dashed #8bb51a; margin-left:5px; font-family: "allerregular"; }
/*green box*/
/*green box*/
.page2 .box .grey_box_cnt { margin:27px 10px 12px 10px; width:auto; }
.page2 .box .grey_box_cnt .grey_box { width:140px; background-color:#dedede; position:relative; z-index:9; float:left; margin-bottom: 10px; }
.page2 .box .grey_box_cnt .grey_box:after { width:140px; background: url(${pageContext.request.contextPath}/images/diyimages/bx_shadow.png) no-repeat center center; content: ""; position: absolute; display: block; height: 15px; bottom: -7px; z-index: -1; }
.page2 .box .grey_box .top { width:140px; height:40px; background-color:#dedede; }
.page2 .box .grey_box .top .logo { width: 40px; height: 40px; position: absolute; left: -2px; top: -2px; border: 1px solid <%=colorCodeLeft %>; border-radius: 50px; background-color: #FFF; color:<%=colorCode %>; }
/*icons*/
.page2 .box .grey_box .top .logo .house { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/house.png) no-repeat center center; }
.page2 .box .grey_box .top .logo .car { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/car.png) no-repeat center center; }
.page2 .box .grey_box .top .logo .education { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/education.png) no-repeat center center; }
.page2 .box .grey_box .top .logo .vacation { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/vacation.png) no-repeat center center; }
.page2 .box .grey_box .top .logo .wedding { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/wedding.png) no-repeat center center; }
.page2 .grey_box .top .logo .business { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/icns-business.png) no-repeat center center; }
.page2 .grey_box .top .logo .special { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/special-goal.png) no-repeat center center;background-size: 70%;}
.page2 .grey_box .top .logo .other{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/other_goals.png) no-repeat center center; background-size: 70%;}
.page2 .grey_box .top .logo .retirement{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/retirement_plan.png) no-repeat center center; }

/*icons*/
.page2 .box .grey_box .top .title { text-align: left; font-family: "Aller Bold"; color: <%=colorCode %>; font-size: 10px; width: 98px; float: right; margin-top: 3px; }
.page2 .box .grey_box .top .goal_year{text-align: left;font-family: "allerregular";color: <%=colorCode %>;font-size: 8px;width: 72px;float: right;margin-top: 3px;}
.page2 .box .grey_box .top .goal_year span{font-weight:bold; font-size: 10px;}
.page2 .box .grey_box .middle { width:140px; height:114px; border-bottom:1px solid <%=colorCode %>; }
/*Left*/
.page2 .box .grey_box .middle .left { width:69px; height:114px; border-right:1px solid <%=colorCode %>; float:left }
.page2 .box .grey_box .middle .left .title { font-family: "Aller Bold"; color: <%=colorCode %>; font-size: 8px; text-align:center; margin: 8px auto 8px auto; }
.page2 .box .grey_box .middle .left .img { width:47px; height:40px; background-image: url(${pageContext.request.contextPath}/images/diyimages/lumpsum_amount.png); margin: 7px auto 5px auto; }
/*amount*/
.page2 .box .grey_box .middle .left .lumpsum { float:left; margin-top:5px; }
.page2 .box .grey_box .middle .left .lumpsum .rupee { color:#FFF; margin:0 1px 0 2px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png); width:7px; height:11px; float: left; }
.page2 .box .grey_box .middle .left .lumpsum .amt { color:<%=colorCode %>; font-size: 10px; float:left; }
/*Left*/

/*Right*/
.page2 .box .grey_box .middle .right { width:70px; height:114px; float:left; }
.page2 .box .grey_box .middle .right .title { font-family: "Aller Bold"; color: <%=colorCode %>; font-size: 8px; text-align:center; margin: 8px auto 8px auto; }

.page2 .box .grey_box .middle .right .img { width:24px; height:35px; background: url(${pageContext.request.contextPath}/images/diyimages/sip_amount.png) no-repeat; margin: 8px auto 10px auto; }
/*amount*/
.page2 .box .grey_box .middle .right .sip { float:left; margin-top: 5px; }
.page2 .box .grey_box .middle .right .sip .rupee { color:#FFF; margin:0 2px 0 5px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png); width:7px; height:11px; float: left; }
.page2 .box .grey_box .middle .right .sip .amt { color:<%=colorCode %>; font-size: 10px; float:left; }
/*Right*/

.page2 .box .grey_box .bottom { width:140px; height:30px; background-color:#dedede; }
/*left*/
.page2 .box .grey_box .bottom .left { width:69px; height:30px; float:left }
.page2 .box .grey_box .bottom .left .title { font-family: "aller bold"; color: #000; font-size: 7px; margin-bottom: 2px; margin-top: 4px; text-align:center; }
.page2 .box .grey_box .bottom .left .rupee { color:#FFF; margin:0 3px 0 2px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png); width:7px; height:11px; float: left; }
.page2 .box .grey_box .bottom .left .amt { color:#000; font-size: 9px; border-bottom: 1px dashed <%=colorCode %>; float: left; width:53px; padding-bottom:2px; height:10px; }
/*left*/
/*right*/
.page2 .box .grey_box .bottom .right { width:69px; height:30px; float:left }
.page2 .box .grey_box .bottom .right .title { font-family: "aller bold"; color: #000; font-size: 7px; margin-bottom: 3px; margin-top: 4px; text-align:center; }
.page2 .box .grey_box .bottom .right .date_bx { width:69px; height:11px; margin-left: 5px; }
.page2 .box .grey_box .bottom .right .date_bx .date_no { width: 10px; height: 9px; border: 1px solid #000; float: left; font-size: 7px; color: #cfcfcf; background-color: #FFF; margin-left: -1px; text-align: center; padding-top: 1px; }
/*right*/
.page2 .divide_line{ height:135px; width:1px; background-color:#dfdfdf; float:left; margin:25px 8px 0 9px; }
/************************* Page 2 CSS *******************************/

/************************* Page 3 CSS *******************************/
/*Common Custom checkbox ends*/
.page3 .c_box { height:20px; width:20px; margin: 0 auto; }
/*** Common custom checkbobx ***/
.page3 .default_checkbox { opacity:0; display:none }
.page3 .common_custom_checkbox { background: url(${pageContext.request.contextPath}/images/diyimages/blank_checkbox.png) no-repeat center center; height:20px; width:20px; display:block; }
.page3 .white_checkbox_checked { background: url(${pageContext.request.contextPath}/images/diyimages/checkbox.png) no-repeat center center; display: block; height: 20px; width: 20px; }
/*** Common custom checkbobx ends ***/


/***Financial Planning Summary Starts***/
.page3 .head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 50px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; color:<%=colorCode %>; }
/***Financial Planning Summary Ends***/

.page3 .goals_icon_bx { width:72px; height:72px; position:relative; right: 8px; top: 0; border:3px solid <%=colorCodeLeft %>; border-radius: 50px; background-color:#FFF; }
.page3 .goals_icon { width:56px; height:45px; background:url(${pageContext.request.contextPath}/images/diyimages/my_dream_goal_icon.png) no-repeat center center; margin: 18px 13px; }
.page3 .ifa_head_logo { width:45px; height:47px; /* background:url(${pageContext.request.contextPath}/images/diyimages/ifa_head_logo.png) no-repeat center center; */ float:left; margin-left: 15px; }
.page3 .content .description { height:auto; margin: 10px 20px; height: 62px; border:3px solid <%=colorCodeLeft %>; border-radius: 5px; padding:5px; -webkit-box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); -moz-box-shadow:0px 3px 5px 0px rgba(50, 50, 50, 0.75); box-shadow: 0px 3px 5px 0px rgba(50, 50, 50, 0.75); }
.page3 .content .description .title { font-size:14px; font-family: "Aller Bold"; }
.page3.content .description .txt { font-size:12px; text-indent: 20px; font-family: "allerregular"; text-align: justify; }
/*green box*/
.page3 .box { width:100%; /*height:100px;*/ border-top:1px solid #333; margin-top:22px; position:relative; }
.page3 .box .green { background-color:<%=colorCodeLeft %>; border-radius: 15px; padding:5px 10px 5px 55px; font-size: 14px; text-align:left; font-family: "allerregular"; color:#FFF; position:absolute; top: -12px; left: 10px; }
.page3 .box .green .logo { width: 40px; height: 40px; position: absolute; top: -8px; left: 5px; border: 1px solid <%=colorCodeLeft %>; border-radius: 50px; background-color: #FFF; color:<%=colorCode %>; }
/*icons*/
.page3 .box .green .logo .house { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/house.png) no-repeat center center; }
.page3 .box .green .logo .car { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/car.png) no-repeat center center; }
.page3 .box .green .logo .education { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/education.png) no-repeat center center; }
.page3 .box .green .logo .vacation { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/vacation.png) no-repeat center center; }
.page3 .box .green .logo .wedding { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/wedding.png) no-repeat center center; }
.page3 .box .green .logo .business { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/icns-business.png) no-repeat center center; }
.page3 .box .green .logo .special { width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/special-goal.png) no-repeat center center; background-size: 70%; }
.page3 .box .green .logo .other{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/other_goals.png) no-repeat center center; background-size: 70%; }
.page3 .box .green .logo .retirement{ width: 40px; height: 40px; background: url(${pageContext.request.contextPath}/images/diyimages/retirement_plan.png) no-repeat center center; }

/*icons*/

/*green box*/
/*green box*/
.page3 .box .grey_box_cnt { margin:27px 0px 12px 0px; width:auto; z-index: 9; background-color:#fff; border-bottom:1px solid #5d5d5d; }
.page3 .box .grey_box_cnt:after { margin:27px 10px 26px 10px; width:100%; background: url(${pageContext.request.contextPath}/images/diyimages/shadow_big.png) no-repeat center center; content: ""; position: absolute; display: block; height: 15px; bottom: -18px; z-index: -1; }
.page3 .box .grey_box_cnt .grey_box { width:140px; background-color:#dedede; position:relative; z-index:9; float:left; }
.page3 .box .grey_box_cnt .grey_box:after { width:140px; background: url(${pageContext.request.contextPath}/images/diyimages/bx_shadow.png) no-repeat center center; content: ""; position: absolute; display: block; height: 15px; bottom: -7px; z-index: -1; }
.page3 .box .grey_box .top { width:140px; height:40px; background-color:#dedede; }
.page3 .box .grey_box .top .title { text-align: left; font-family: "Aller Bold"; color: <%=colorCode %>; font-size: 12px; width: 98px; float: right; margin-top: 10px; }
.page3 .box .grey_box .middle { width:140px; height:114px; border-bottom:1px solid <%=colorCode %>; }
/*left*/


/*title*/
.page3 .GWS_title_bx { width: 100%; margin-bottom:10px; margin-top:20px; background-color:#f3f3f3; }
.page3 .GWS_title_bx ul { list-style:none; padding: 0; margin: 0; }
.page3 .GWS_title_bx ul li.input_title_one { width: 12.5%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 20px; }
.page3 .GWS_title_bx ul li.input_title_two { width: 13%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; }
.page3 .GWS_title_bx ul li.input_title_three { width: 16%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; text-align:center; }
.page3 .GWS_title_bx ul li.input_title_four { width: 12%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 1px 0px 37px; text-align:center; }
.page3 .GWS_title_bx ul li.input_title_five { width: 10%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 32px; text-align:center; }
.page3 .GWS_title_bx ul li.input_title_six { width: 9%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; text-align:center; }
.page3 .GWS_title_bx ul li.input_title_seven { width: 3%; font-family: "allerregular"; font-size: 12px; color: #3a3a3a; margin: 2px 0px 0px 10px; }
.page3 .input_rupee_txt { font-family: "allerregular"; }
/*title ends*/

/*txt*/
.page3 .GWS_txt { width: 100%; margin-bottom:5px; margin-top:5px; }
.page3 .GWS_txt ul { list-style:none; padding: 0; margin: 0; }
.page3 .GWS_txt ul li.input_txt_one { width: 13%; padding-right: 1%; font-family: "allerregular"; font-size: 12px; color: #000; margin-left: 19px; line-height: 12px; }
.page3 .GWS_txt ul li.input_txt_two { width: 10%; margin:-3px 6px 0px 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
.page3 .GWS_txt ul li.input_txt_two .bx { border-bottom:1px dashed <%=colorCodeLeft %>; width:60%; padding-bottom: 5px; }
.page3 .GWS_txt ul li.input_txt_two .bx .txt { color:<%=colorCode %>; font-family: "aller bold"; font-size: 14px; }
.page3 .GWS_txt ul li.input_txt_two .bx .per { }
.page3 .GWS_txt ul li.input_txt_three { width: 23.8%; margin-left: 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
/*Recommended Investment Amount Box*/
.page3 .ria_bx { width:180px; background-color: <%=colorCode %>; border-radius: 6px; -moz-border-radius: 6px; -webkit-border-radius: 6px; padding:0px 0 5px 0px; }
.page3 .ria_bx .chk_bx{width:20px; height:26px; padding:5px;}
.page3 .ria_bx .chk_bx .chk_bx1{width:10px; height:10px; border:1px solid #fff; margin:0px 0px 5px 0px; background-color:#fff;}
.page3 .ria_bx .left { width: 60px; height: 26px; text-align:right; padding-top: 3px; line-height: 16px; font-family: "allerregular"; font-size: 11px; color: #000; }
.page3 .ria_bx .right { width:75px; height:26px; text-align:right; }
.page3 .ria_bx .right .rupee { color: #FFF; margin: 5px 3px 0 4px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe_w.png); width: 7px; height: 11px; float: left; }
.page3 .ria_bx .right .amt { color: #fff; margin:5px 3px 0 4px; font-size: 10px; border-bottom: 1px dashed <%=colorCodeLeft %>; float: left; padding-bottom: 2px; height: 8px;width:70%; }
/*Recommended Investment Amount Box*/


.page3 .GWS_txt ul li.input_txt_four { width: 14%; margin-left: 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
/*Rupee Box*/
.page3 .GWS_txt ul li.input_txt_four .rupee { color: #FFF; margin: 5px 3px 0 4px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png); width: 7px; height: 11px; float: left; }
.page3 .GWS_txt ul li.input_txt_four .amt { font-family: "aller bold"; font-size: 14px; color: <%=colorCode %>; margin:2px 3px 0 4px; font-size: 14px; border-bottom: 1px dashed <%=colorCodeLeft %>; float: left; padding-bottom: 2px; height: 14px; }
/*Rupee Box*/

.page3 .GWS_txt ul li.input_txt_five { width: 13.5%; margin:5px 0px 0px 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
/*Date Box*/
.page3 .GWS_txt ul li.input_txt_five .date_bx { width:105px; height:16px; margin-left: 0px; }
.page3 .GWS_txt ul li.input_txt_five .date_bx .date_no { width: 13px; height: 13px; border: 1px solid #000; float: left; font-size: 12px; color: #cfcfcf; background-color: #FFF; margin-left: 2px; text-align: center; padding-top: 1px; }
/*Date Box*/

.page3 .GWS_txt ul li.input_txt_six { width: 9%; margin:5px 0px 0px 0px; font-family: "allerregular"; font-size: 12px; color: #000; }
.page3 .GWS_txt ul li.input_txt_six .date_no { width: 13px; height: 13px; border: 1px solid #000; font-size: 12px; color: #cfcfcf; background-color: #FFF; margin-left: auto; text-align: center; padding-top: 1px; margin-top: 0px; margin-right: auto; margin-bottom: 0px; }
/*Date Box*/

.page3 .GWS_txt ul li.input_txt_seven { width: 11%; margin:5px 0px 0px 0px; font-family: "aller bold"; font-size: 12px; color: #3a3a3a; }
.page3 .GWS_txt ul li.input_txt_seven .rupee { color: #FFF; margin: 5px 3px 0 4px; background-image: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png); width: 7px; height: 11px; float: left; }
.page3 .GWS_txt ul li.input_txt_seven .amt { font-family: "aller bold"; font-size: 14px; color: <%=colorCode %>; margin: 2px 3px 0 4px; font-size: 14px; border-bottom: 1px dashed <%=colorCodeLeft %>; float: left; padding-bottom: 2px; height: 14px; }
/************************* Page 3 CSS *******************************/

/************************* Page 4 CSS *******************************/
/***Goals My Dreams Starts***/
.page4 #er_planning .container { position: relative; width: 92%; margin: 0 auto; height: 220px; }
.page4 .content{height:1025px;}
.page4 #er_planning .description{width:770px; height:100px; border:1px solid <%=colorCodeLeft %>; margin:10px auto 0px auto;box-shadow:0px 3px 5px #3a3a3a;}
.page4 #er_planning .description p{font-family:"allerregular"; font-size:16px; font-weight:bold; color:#3a3a3a; padding:5px;}
.page4 #er_planning .description span{font-family:"allerregular"; font-size:14px; color:#3a3a3a; margin:5px 0px 0px 5px; width:760px;}

.page4 #er_planning .emergency_plan{margin:10px 0px 0px 0px;}
.page4 #er_planning .emergency_plan .shadow_small{background: url(${pageContext.request.contextPath}/images/diyimages/shadow_small.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;left: 38px;top: 350px;z-index: -5;opacity: 0.7;}
.page4 #er_planning .emergency_plan .shadow_small2{background: url(${pageContext.request.contextPath}/images/diyimages/shadow_small.png) no-repeat;width: 50%;margin: 0px 0px 0px 0px;position: relative;left: 455px;top: 334px;z-index: -5;opacity: 0.7;}
.page4 #er_planning .emergency_plan .ep_header p{font-family:"allerregular"; font-size:18px; color:<%=colorCode %>; font-weight:bold; margin:10px 0px 0px 0px;text-shadow: 0px 1px 1px #8F8F8F;}
.page4 #er_planning .emergency_plan .ep_header .line{width:590px; height:2px; background-color:#b3b3b3; margin:20px 0px 0px 10px;}

/******************** ONE TIME START **************************/
.page4 #er_planning .emergency_plan .onetime{width:378px; height:auto;/* border:1px solid #dbdbdb;*/ margin:0px 0px 0px 0px;/* background-color:#fff;*/}
.page4 #er_planning .emergency_plan .onetime .onetime_header{height:35px; width:180px; border-radius:30px; background-color:<%=colorCodeLeft %>;position: relative;top: -17px;left: 30px;}
.page4 #er_planning .emergency_plan .onetime .onetime_header p{text-align:center; line-height:35px; font-family:"allerregular"; font-size:15px; color:#FFF; font-weight:bold;}
.page4 #er_planning .emergency_plan .onetime .amount p{font-family:"allerregular"; font-size:15px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 30px;}
.page4 #er_planning .emergency_plan .onetime .amount .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:0px 0px 0px 0px;}
.page4 #er_planning .emergency_plan .onetime .amount .money{font-family:"allerregular"; font-size:20px; color:<%=colorCode %>; border-bottom:2px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .onetime .onetime_line{width:100%; height:1px; background-color:#bdbdbd; margin:0px auto;} 
.page4 #er_planning .emergency_plan .onetime .amount{height: 10px;}
.page4 #er_planning .emergency_plan .onetime .sug_inv p{ font-family:"allerregular"; font-size:15px; font-weight:bold; text-shadow: 0px 1px 1px #8F8F8F; color: <%=colorCode %>; margin: 10px 0px 0px 5px;}


.page4 #er_planning .emergency_plan .onetime .product1{margin: 30px 0px 0px 5px; width:100%;}
.page4 #er_planning .emergency_plan .onetime .product1 p{font-family:"allerregular"; font-size:10px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 5px;}
.page4 #er_planning .emergency_plan .onetime .product1 .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
.page4 #er_planning .emergency_plan .onetime .product1 .money{font-family:"allerregular"; font-size:10px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .onetime .product1 .chkbx{width:10px; height:10px; border:1px solid #666; }
/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .onetime .product2{margin: 30px 0px 0px 5px; width:100%;}
.page4 #er_planning .emergency_plan .onetime .product2 p{font-family:"allerregular"; font-size:10px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 5px;}
.page4 #er_planning .emergency_plan .onetime .product2 .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
.page4 #er_planning .emergency_plan .onetime .product2 .money{font-family:"allerregular"; font-size:10px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .onetime .product2 .chkbx{width:10px; height:10px; border:1px solid #666; }

/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .onetime .product3{margin: 30px 0px 0px 5px; width:100%;}
.page4 #er_planning .emergency_plan .onetime .product3 p{font-family:"allerregular"; font-size:10px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 5px;}
.page4 #er_planning .emergency_plan .onetime .product3 .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
.page4 #er_planning .emergency_plan .onetime .product3 .money{font-family:"allerregular"; font-size:10px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .onetime .product3 .chkbx{width:10px; height:10px; border:1px solid #666; }

/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .onetime .app_amt{margin: 30px 0px 0px 60px;}
.page4 #er_planning .emergency_plan .onetime .app_amt p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}
.page4 #er_planning .emergency_plan .onetime .app_amt .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px; margin-top:10px;}
.page4 #er_planning .emergency_plan .onetime .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>; margin-top:10px;}
.page4 #er_planning .emergency_plan .onetime bottom_left{display:inline-block;}

/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .onetime .exec_date{margin: 30px 50px 0px 0px;}
.page4 #er_planning .emergency_plan .onetime .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}

.page4 #er_planning .emergency_plan .onetime .exec_date .chkbx{width:10px; height:10px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
.page4 #er_planning .emergency_plan .onetime .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

.page4 #er_planning .emergency_plan .onetime bottom_right{display:inline-block;}

/******************** ONE TIME END **************************/

/******************** SIP START **************************/
.page4 #er_planning .emergency_plan .sip{width:377px; height:300px;/* border:1px solid #dbdbdb;*/ margin:0px 0px 0px 0px; /*background-color:#fff;*/}
.page4 #er_planning .emergency_plan .sip .sip_header{height:35px; width:180px; border-radius:30px; background-color:<%=colorCode %>;position: relative;top: -20px;left: 170px;}
.page4 #er_planning .emergency_plan .sip .sip_header p{text-align:center; line-height:35px; font-family:"allerregular"; font-size:15px; color:#FFF; font-weight:bold;}
.page4 #er_planning .emergency_plan .sip .amount p{font-family:"allerregular"; font-size:15px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 30px;}
.page4 #er_planning .emergency_plan .sip .amount .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:0px 0px 0px 0px;}
.page4 #er_planning .emergency_plan .sip .amount .money{font-family:"allerregular"; font-size:20px; color:<%=colorCode %>; border-bottom:2px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .sip .sip_line{width:100%; height:1px; background-color:#bdbdbd; margin:0px auto;} 

.page4 #er_planning .emergency_plan .sip .sug_inv p{ font-family:"allerregular"; font-size:15px; font-weight:bold; text-shadow: 0px 1px 1px #8F8F8F; color: <%=colorCode %>; margin: 10px 0px 0px 5px;}

.page4 .onetime_sip{width:98%; height:auto; border:1px solid #D3D3D3; padding:0px 5px 5px 5px; margin:30px 0px 0px 0px;}
.page4 .onetime_sip .devider{width: 1px;height: 280px;background-color: #C9C9C9;margin: 20px 0px 0px 18px;}
.page4 #er_planning .emergency_plan .sip .product1{margin: 30px 0px 0px 5px; width:100%;}
.page4 #er_planning .emergency_plan .sip .product1 p{font-family:"allerregular"; font-size:10px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 5px;}
.page4 #er_planning .emergency_plan .sip .product1 .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
.page4 #er_planning .emergency_plan .sip .product1 .money{font-family:"allerregular"; font-size:10px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .sip .product1 .chkbx{width:10px; height:10px; border:1px solid #666; }
/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .sip .product2{margin: 30px 0px 0px 5px; width:100%;}
.page4 #er_planning .emergency_plan .sip .product2 p{font-family:"allerregular"; font-size:10px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 5px;}
.page4 #er_planning .emergency_plan .sip .product2 .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
.page4 #er_planning .emergency_plan .sip .product2 .money{font-family:"allerregular"; font-size:10px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .sip .product2 .chkbx{width:10px; height:10px; border:1px solid #666; }
/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .sip .product3{margin: 30px 0px 0px 5px; width:100%;}
.page4 #er_planning .emergency_plan .sip .product3 p{font-family:"allerregular"; font-size:10px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 5px;}
.page4 #er_planning .emergency_plan .sip .product3 .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
.page4 #er_planning .emergency_plan .sip .product3 .money{font-family:"allerregular"; font-size:10px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>;}
.page4 #er_planning .emergency_plan .sip .product3 .chkbx{width:10px; height:10px; border:1px solid #666; }

/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .sip .app_amt{margin: 30px 0px 0px 60px;}
.page4 #er_planning .emergency_plan .sip .app_amt p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}
.page4 #er_planning .emergency_plan .sip .app_amt .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px; margin-top:10px;}
.page4 #er_planning .emergency_plan .sip .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>; margin-top:10px;}
.page4 #er_planning .emergency_plan .sip bottom_left{display:inline-block;}

/*--------------------------------------------------------*/
.page4 #er_planning .emergency_plan .sip .exec_date{margin: 30px 50px 0px 0px;}
.page4 #er_planning .emergency_plan .sip .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}

.page4 #er_planning .emergency_plan .sip .exec_date .chkbx{width:10px; height:10px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
.page4 #er_planning .emergency_plan .sip .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

.page4 #er_planning .emergency_plan .sip bottom_right{display:inline-block;}

.wrapper .page4 .header .icon { height:72px; width:72px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid <%=colorCodeLeft %>; position: relative; top: 0px;left: 708px; background: #FFF url(${pageContext.request.contextPath}/images/diyimages/emergency.png) no-repeat center center; }

/******************** SIP END **************************/
/************************* Page 4 CSS *******************************/

/************************* Page 5 CSS *******************************/
/***Goals My Dreams Starts***/
.page5 #er_planning .container { position: relative; width: 92%; margin: 0 auto; height: 220px; }
.page5 #er_planning .description{width:770px; height:100px; border:1px solid <%=colorCodeLeft %>; margin:10px auto 0px auto;box-shadow:0px 3px 5px #3a3a3a;}
.page5 #er_planning .description p{font-family:"allerregular"; font-size:16px; font-weight:bold; color:#3a3a3a; padding:5px;}
.page5 #er_planning .description span{font-family:"allerregular"; font-size:14px; color:#3a3a3a; margin:5px 0px 0px 5px; width:760px;}

/******************** RISK PLANNING START **************************/
.page5 .content{/* height:1041px; overflow:hidden; */}

.page5 #er_planning .risk_planning{margin:20px 0px 0px 0px;}
.page5 #er_planning .risk_planning .shadow_big1{background: url(${pageContext.request.contextPath}/images/diyimages/shadow_big.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;left: -10px;top: -10px;z-index: -5;opacity: 0.7;background-size: 800px 21px;}
.page5 #er_planning .risk_planning .shadow_big2{background: url(${pageContext.request.contextPath}/images/diyimages/shadow_big.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;left: -10px;top:-10px;z-index: -5;opacity: 0.7;background-size: 800px 21px;}
.page5 #er_planning .risk_planning .shadow_big3{background: url(${pageContext.request.contextPath}/images/diyimages/shadow_big.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;left: -10px;top: -10px;z-index: -5;opacity: 0.7;background-size: 800px 21px;}

.page5 .rp_header p{font-family:"allerregular"; font-size:18px; color:<%=colorCode %>; font-weight:bold; margin:10px 0px 0px 0px;text-shadow: 0px 1px 1px #8F8F8F;}
.page5 .rp_header .line{width:663px; height:2px; background-color:#b3b3b3; margin:20px 0px 0px 10px;}

.page5 .early_death_header{height: 28px;width: 200px;border-radius: 30px;background-color: <%=colorCodeLeft %>;
position: relative;top: -14px;left: 30px;}
.early_death_header p{font-family:"allerregular"; font-size:15px; color:#FFF; margin:6px 0px 0px 12px;text-shadow: 0px 1px 1px #8F8F8F;}

.page5 .r_p{padding-bottom:20px;width:792px; height:auto; border-top:1px solid #dbdbdb; border-bottom:1px solid #dbdbdb;  margin:30px 0px 0px 0px;background-color: #FFF;}
.page5 .early_death_header .icon_bg{width:50px; height:50px; border:1px solid <%=colorCodeLeft %>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/images/diyimages/early_death_gray.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

.page5 .early_death_header .icon_bg2{width:50px; height:50px; border:1px solid <%=colorCodeLeft %>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/images/diyimages/disabilities_gray.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

.page5 .early_death_header .icon_bg3{width:50px; height:50px; border:1px solid <%=colorCodeLeft %>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/images/diyimages/health_setback_gray.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

.page5 .early_death_header .icon_bg4{width:50px; height:50px; border:1px solid <%=colorCodeLeft %>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/images/diyimages/Personal-Accident.png);background-size: 19px 40px;background-repeat: no-repeat;background-position: center;}

.page5 .early_death_header .icon_bg5{width:50px; height:50px; border:1px solid <%=colorCodeLeft %>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/images/diyimages/critical-illness.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}


/**** Existing ****/
.page5 .existing_header{height: 28px;width: auto;border-radius: 30px;background-color: <%=colorCode %>;position: relative;top: -14px;right: 10px;}
.page5 .existing_header .existing{margin: 1px 0px 0px 20px;}
.page5 .existing_header .existing p{font-family: "allerregular";font-size: 15px;color: #000;display: inline-block;margin: 5px 0px 0px 6px;}
.page5 .existing_header .existing .rupee{background: url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb_w.png) no-repeat center center; background-size:40%;height: 20px;width: 20px;margin-left: 10px;display: inline-block;margin: 3px 0px 0px 0px;}
.page5 .existing_header .existing .money{font-family: "allerregular";font-size: 16px;color: #fff;border-bottom: 2px dashed <%=colorCodeLeft %>;margin: 4px 0px 0px 0px;}

/**** Required ****/

.page5 .existing_header .required{margin: 1px 20px 0px 0px;}
.page5 .existing_header .required p{font-family: "allerregular";font-size: 15px;color: #000;display: inline-block;margin: 5px 0px 0px 6px;}
.page5 .existing_header .required .rupee{background: url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb_w.png) no-repeat center center;background-size: 40%;
height: 20px;width: 20px;margin-left: 10px;display: inline-block;margin: 3px 0px 0px 0px;}
.page5 .existing_header .required .money{font-family: "allerregular";font-size: 16px;color: #fff;border-bottom: 2px dashed <%=colorCodeLeft %>;margin: 4px 0px 0px 0px;}


/**** suggestion ****/
.page5 .suggestion{margin: 5px 0px 0px 0px;}
.page5 .suggestion .sugg_heading{font-family: "allerregular";font-size: 15px;color: <%=colorCode %>; margin: 3px 0px 0px 0px;}
.page5 .suggestion p{font-family: "allerregular";font-size: 15px;color: #000;display: inline-block;margin: 3px 0px 0px 3px;}
.page5 .suggestion .money{font-family: "allerregular";font-size: 16px;color: <%=colorCode %>;border-bottom: 2px dashed <%=colorCodeLeft %>; margin: 1px 0px 0px 0px;font-weight: bold;}
.page5 .suggestion .rupee{background: url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center;height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px;}

/**** sug_product ****/
.page5 .sug_product{margin:0px 0px 0px 0px;}
.page5 .sug_product  p{font-family: "allerregular";font-size: 14px;color: #3A3A3A;font-weight: bold;display: inline-block;margin: 0px 0px 0px 0px;}

/**************************** prod1****************************/
.page5 .sug_product .prod1{margin: 10px 5px 0px 0px; width:49%;}
.page5 .sug_product .prod1 .chkbx1{width: 15px;height: 15px;border: 1px solid #666; margin: 15px 0px 0px 15px;}
.page5 .sug_product .prod1 .chkbx{width: 15px;height: 15px;border: 1px solid #666;}
.page5 .sug_product .prod1 .prd_name{width: 50%;height: 50px;background-color: #3a3a3a;margin: 0px 0px 0px 0px;line-height: 50px;}
.page5 .sug_product .prod1 .prd_name p{font-family: "allerregular";font-size: 12px;color: #fff;font-weight:normal !important;display: inline-block;margin: 0px 0px 0px 5px; line-height: 15px;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .grn_patch{width: 50%;height: 50px;background-color: #;background-color: <%=colorCodeLeft %>;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .grn_patch .half_part .amt_type{font-family: "allerregular";font-size: 12px;color: #FFF; line-height: 25px;margin: 0px 0px 0px 5px; width:95px;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .grn_patch .half_part .rupee{background: url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb_w.png) no-repeat center center;height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px; margin:2px 0px 0px 0px;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .grn_patch .half_part .money{font-family: "allerregular";font-size: 11px;color: #FFF;border-bottom: 1px dashed #3a3a3a;margin: 6px 0px 0px 0px;}

/****** Approved Amt ********/
/*--------------------------------------------------------*/
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt{margin: 10px 0px 0px 50px;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt p{font-family:"arial" !important; font-size:10px !important; color:#3a3a3a !important;margin: 0px 0px 0px 0px; font-weight:normal !important; width: auto;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt .rupee{background:url(${pageContext.request.contextPath}/images/diyimages/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin:20px 0px 0px -90px; background-size: 8px 12px;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode %>; border-bottom:1px dashed <%=colorCodeLeft %>; margin:35px 0px 0px -70px; width:70px;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .bottom_left{width:50%;}

/*--------------------------------------------------------*/
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date{margin: 10px 0px 0px 30px;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 25px;font-weight:normal !important;}

.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date .chkbx{width:15px; height:15px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

.page5 #er_planning  .risk_planning .r_p .sug_product .prod1 .bottom_right{display:inline-block;}
.page5 .sug_prd{position: relative;/* top: 30px;left: -288px; */}
.page5 .sug_prd2 { margin-top: 10px; }

.wrapper .page5 .header .icon { height:72px; width:72px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid <%=colorCodeLeft %>; position: relative; top: 0px;left: 708px; background: #FFF url(${pageContext.request.contextPath}/images/diyimages/risk.png) no-repeat center center; }

/************************* Page 5 CSS *******************************/

/************************* Page 6 CSS *******************************/
.page6 .content { height:704px; overflow:hidden; width:100%;}
.page6 #succession_planning .container { position: relative; width: 92%; margin: 0 auto; height: 220px; }
.page6 #succession_planning .question { width:134px; height:134px; border:2px solid <%=colorCode %>; -moz-border-radius: 125px; -webkit-border-radius: 125px; border-radius: 125px; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; background:url(${pageContext.request.contextPath}/images/diyimages/question_bg2.png) no-repeat 35px 30px; position: absolute; left:0; top: 52px; z-index:150 }
.page6 #succession_planning .action { height:200px; width:200px; border:2px solid <%=colorCode %>; -moz-border-radius: 172px; -webkit-border-radius: 172px; border-radius: 172px; -moz-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; -webkit-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; position: absolute; left:105px; top:15px; z-index:100; background-color: #FFF; }
.page6 #succession_planning .importance { width:220px; height: 127px; background: <%=colorCodeLeft %>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; position: absolute; left:280px; top: 48px; z-index:50; color:#fff; font-family: "Aller Bold"; }
.page6 #succession_planning .importance .imp_head { font-size:14px; margin: 5px 0 4px 28px; width: 230px; }
.page6 #succession_planning .importance .txt { font-size: 10px;margin: 0 0 0 30px;width: 168px;height: 99px;line-height: 11px;-moz-border-radius: 0 0 63px 0;-webkit-border-radius: 0 0 63px 0;border-radius: 0 0 63px 0; }
.page6 #succession_planning .action .action_head { font-family: "Aller Bold"; font-size: 23px; margin: 25px 0 0 34px; width: 234px; }
.page6 #succession_planning .action .txt { font-family: "Allerregular";font-size: 10px;margin: 0px 0 0 28px;width: 147px;height: 132px;
border-radius: 0 0 115px 71px;color: <%=colorCode %>;line-height: 13px;padding: 0 0 0 5px; }
.page6 #succession_planning .question .txt {font-family: "Aller Bold";font-size: 12px;margin: 30px 0 0 12px;width: 96px;height: 59px;
-moz-border-radius: 0 0 0 76px;-webkit-border-radius: 0 0 0 76px;border-radius: 0 0 0 76px;color: <%=colorCode %>;line-height: 15px; }
.page6 #succession_planning .question .icon { height:45px; width:45px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid <%=colorCode %>; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; position: absolute; top: -25px; left:45px; background: #FFF url(${pageContext.request.contextPath}/images/diyimages/succession_icon.png) no-repeat center center; }
.page6 #succession_planning .question .yes_no_answer { position: absolute; top: 35px; right: 0px; height: 94px; width: 33px; text-align: center; font-size: 10px; font-family: "Aller Bold"; }
.page6 #succession_planning .question .yes_no_answer .custom_radio { height:11px; width:11px; border:1px solid <%=colorCode %>; -moz-border-radius: 18px; -webkit-border-radius: 18px; border-radius: 18px; margin:3px auto 0 }
.page6 #succession_planning .question .yes_no_answer li { margin: 3px 0 8px; }
.page6 #succession_planning .question .yes_no_answer .custom_radio.selected { background:url(${pageContext.request.contextPath}/images/diyimages/custom_selected.png) no-repeat center center }
.page6 #succession_planning .container_ul li { margin:0 0 0 120px;}

.wrapper .page6 .header .icon { height:72px; width:72px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid <%=colorCodeLeft %>; position: relative; top: 0px;left: 708px; background: #FFF url(${pageContext.request.contextPath}/images/diyimages/succession_gray.png) no-repeat center center; }

/*************** Table CSS Start ****************/
.wrapper .page6 .table{width:600px; margin:0px auto -15px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper .page6 .table li{list-style-type:none; display:inline-block; font-size:12px; font-family:"allerregular";font-weight:bold;}
.wrapper .page6 .table ul{margin-left: -20px;}
.wrapper .page6 .table-header{width:100%; height:20px; background-color:<%=colorCodeLeft %>;}
.wrapper .page6 .table-header li.one{line-height:15px; width:117px;}
.wrapper .page6 .table-header li.two{line-height:15px; width:180px; margin-left:32px;}
.wrapper .page6 .table-header li.three{line-height:15px; width:120px; margin-left: 15px;}
.wrapper .page6 .table-header li.four{line-height:15px; width:117px;width: 27px;margin-left: 46px;}

.wrapper .page6 .first-row{margin-top:0px;}
.wrapper .page6 .first-row ul li.one{width: 140px !important; margin: 0px 0px 0px 0px;}
.wrapper .page6 .first-row ul li.two{width: 198px !important; margin: 0px 0px 0px 14px;}
.wrapper .page6 .first-row ul li.three{width: 168px !important;}
.wrapper .page6 .first-row ul li.four{width:0px !important;}

/*************** Table CSS End ****************/

/******************Signature****************/
.page6 .signature li{list-style-type:none; display:inline-block; font-size:12px; font-family:"allerregular";font-weight:bold;}
.page6 .signature .sign-header{width:100%; height:30px; background-color:#3a3a3a; line-height: 28px;}
.page6 .signature .sign-header li{color:#fff; font-size:12px;}
.page6 .signature .sign-header .one{margin-left:20px;}
.page6 .signature .sign-header .two{margin-left:450px;}

.page6 .signature .sign-box li{width:140px; height:40px; border:2px <%=colorCodeLeft %> solid;}
.page6 .signature .sign-box .two{margin-left:405px;}


.page6 .signature .place .one{color:<%=colorCode %>;}
.page6 .signature .place .two{margin-left:403px; color:<%=colorCode %>;}

.page6 .signature .date .one{color:<%=colorCode %>;}
.page6 .signature .date .two{margin-left:410px; color:<%=colorCode %>;}

/******************Signature****************/
/************************* Page 6 CSS *******************************/

/************************* Page 7 CSS *******************************/
.page7 .content { height:1041px; overflow:hidden; width:100%; }
.page7 .common_header p { font-family:"allerregular"; font-size:18px; color:<%=colorCode %>; font-weight:bold; margin:10px 0px 0px 0px; text-shadow: 0px 1px 1px #8F8F8F; }
.page7 .common_header .line { width:595px; height:2px; background-color:#b3b3b3; margin:20px 0px 0px 10px; }


.wrapper .page7 .table { width:600px; margin:40px auto 0px auto; background-color: #E6E6E6; padding-bottom: 15px; }
.wrapper .page7 .table li { list-style-type:none; display:inline-block; font-size:12px; font-family:"allerregular"; font-weight:bold; }
.wrapper .page7 .table ul { margin-left: -20px; }
.wrapper .page7 .table-header { width:100%; height:20px; background-color:<%=colorCodeLeft %>;color: #FFF; }
.wrapper .page7 .table-header li.one { line-height:15px; width:125px; }
.wrapper .page7 .table-header li.two { line-height:15px; width:140px; margin-left:32px; }
.wrapper .page7 .table-header li.three { line-height:15px; width:120px; margin-left: 15px; }
.wrapper .page7 .table-header li.four { line-height:15px; width:117px; margin-left: 6px; }
.wrapper .page7 .first-row { margin-top:0px; }
.wrapper .page7 .first-row ul li.one { width: 148px !important; margin: 0px 0px 0px 0px; }
.wrapper .page7 .first-row ul li.two { width: 158px !important; margin: 0px 0px 0px 14px; }
.wrapper .page7 .first-row ul li.three { width: 168px !important; }
.wrapper .page7 .first-row ul li.four { width:0px !important; }

/************************* Page 7 CSS *******************************/

.page1 {height: 1124px;}
.page2 {height: 1124px;}
.page3 {height: 1124px;}
.page4 {height: 1124px;}
.page5 {height: 1124px;}
.page6 {height: 1124px;}
.page7 {height: 1124px;}
.rupeeIcon {background: url(${pageContext.request.contextPath}/images/diyimages/ruppe.png); width: 8px;height:13px; display: inline-block;background-size: 100%;}
</style>
<body>
	<div class="wrapper">
	
	      <div class="page1 fl">
            <div class="verticle_side">
              <p class="verticle">Action Plan For ${ContactDetails.name} made on <%=strDate%></p>
            </div>
            <div class="header clearfix">
              <div class="desc_heading1 fl">
                <h2 class="head_txt1">Steps to financial freedom </h2>
              </div>
              <h1 class="page_heading fl">Financial Action Plan</h1>
            </div>
            <div class="content" id="financial_planning_summary_content">
              <div class="box1 ifa_details clearfix">
                <div class="add_details fl">
                  <h4 class="name">${ContactDetails.ownerName}</h4>
                  <c:set var="addressList" value="${fn:split(ContactDetails.address, '_')}" />
        		  <p class="address"> ${addressList[0]}<br>${addressList[1]}<br>${addressList[2]}</p>
                </div>
                <div class="fr logo">
                
                <c:set var="photoPath" value="${ContactDetails.logoPath}"/>
                <%-- <img src="${pageContext.request.contextPath}/images/diyimages/ifa_logo.png"/>  --%>
                	<%
				      	String photoPath1=(String) pageContext.getAttribute("photoPath");
						String x = "D:/Ffreedom-DI/images/"+photoPath1;
						File file = new File(x);
					%>
					<% if (file.exists() && !file.isDirectory()) { %> 
						<img src="${pageContext.request.contextPath}<%="/app/images/"+photoPath1%>" alt="Advisor Logo" style="max-width: 150px;max-height: 60px;"/></a>
				    <% } else { %>
				   		<img src="${pageContext.request.contextPath}/images/diyimages/temp_logo.png" alt="Advisor Logo" style="max-width: 150px;max-height: 60px;"/></a>
				    <% } %>
                </div>
              </div>
              <div class="box2 client_details" style="text-align: center;">
                <h4 class="name"><span class="c_name">${ContactDetails.name}</span></h4>
                <c:if test="${reportFor eq 'advisor'}">
					<c:set var="totalRevenue" value="0"/>
					<c:forEach var="goals" items="${GoalWiseProductDetails}" varStatus="mapCount">
					<c:forEach var="productlist" items="${goals.value.clientActionPlanList}">
					<fmt:parseNumber var="revenue" type="number" value="${productlist.revenueAmount}" />
					<c:set var="totalRevenue" value="${totalRevenue + revenue}"/>
					</c:forEach>
					</c:forEach>
					<h2 class="name" style="font-size: 20px;">Total Annual Revenue : <span class="rupeeIcon"></span> <span style="color: black;font-size:19px;">${totalRevenue} /-</span></h2>
                </c:if>
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
                <c:choose>
                	<c:when test="${buPartyId eq '27829'}">
                		<p class="txt">This document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FINFRA. This document is based entirely on the information provided by you . Despite our best efforts, due care and precautions, there may be some variables used in generation of this document which have not been unaccounted for, or miscalculated, by the Platform. FINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, or any third party if the contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or incorrectly. The contents of this document do not qualify as investment advice and/or financial planning, or any variant thereof, under India's applicable regulatory framework, including the Securities and Exchange Board of India (Investment Adviser) Regulations, 2013, as amended from time to time, and FINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be avoided, whether directly, indirectly, incidentally or consequentially, by you or  any third party, by relying upon this document, or any content therein. Investments are subject to a variety of risks, uncertainties and other factors that could cause actual results to differ materially from expectations as expressed or implied under this document.</p>
                	</c:when>
                	<c:otherwise>
                		<p class="txt">This document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FIINFRA. This document is based entirely on the information provided by you or your Distributor. Despite our best efforts, due care and precautions, there may be some variables used in generation of this document which have not been unaccounted for, or miscalculated, by the Platform. FIINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, your Distributor or any third party if the contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or incorrectly. The contents of this document do not qualify as investment advice and/or financial planning, or any variant thereof, under India's applicable regulatory framework, including the Securities and Exchange Board of India (Investment Adviser) Regulations, 2013, as amended from time to time, and FIINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be avoided, whether directly, indirectly, incidentally or consequentially, by you or your Distributor or any third party, by relying upon this document, or any content therein. Investments are subject to a variety of risks, uncertainties and other factors that could cause actual results to differ materially from expectations as expressed or implied under this document.</p>
                	</c:otherwise>
                </c:choose>
                <!--div class="btm_logo fr"></div-->
                <div class="btm_logo1 fl"></div>
                <div class="clr"></div>
              </div>
            </div>
            <div class="footer clearfix" style="page-break-after:always"> 
              <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
            </div>
            <c:set var="pageNumber" value="${pageNumber+1 }" />
          </div>
         <!------------------------------------------ End of "page1" ------------------------------------------>
        
           <c:if test="${not(empty(GoalWiseProductDetails))}">
           <div class="page3 fl">
	              <div class="header clearfix">
	              <div class="desc_heading fl">
	                <div class="ifa_head_logo"></div>
	                <h2 class="head_txt1">${ContactDetails.name} </h2>
	              </div>
	              <h1 class="page_heading fl">Goals wise Summary Chart</h1>
	              <div class="goals_icon_bx fr">
	                <div class="goals_icon"></div>
	              </div>
	              
	             </div>
             <div class="content" id="financial_planning_summary_content">
                <c:set var="rowCount" value="0"/>
			     <c:set var="headerFlag" value="0"/>
			     	
			    <c:forEach var="goals" items="${GoalWiseProductDetails}" varStatus="mapCount">  
			     
			     <c:set var="rowCount" value="${rowCount + 1}"/>
			     
			     <c:if test="${rowCount gt 16}">
			     	<c:set var="headerFlag" value="1"/>
			     	<c:set var="rowCount" value="1"/>
			     	</div>
			     	<c:if test="${mapCount.count eq fn:length(GoalWiseProductDetails)}">
						     <p style="font-size: 14px;text-align: center;">${assumptionsMade}</p>
					 </c:if>
			        	<div class="clr"></div>
				        <div class="footer clearfix" style="page-break-after:always"> 
		             		<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
		             		<c:set var="pageNumber" value="${pageNumber+1 }" />
	           			</div>
			        </div>
			        <div class="page3 fl">
		              <div class="header clearfix">
		              <div class="desc_heading fl">
		                <div class="ifa_head_logo"></div>
		                <h2 class="head_txt1">${ContactDetails.name}</h2>
		              </div>
		              <h1 class="page_heading fl">Goals wise Summary Chart</h1>
		              <div class="goals_icon_bx fr">
		                <div class="goals_icon"></div>
		              </div>
		              
		             </div>
		            <div class="content" id="financial_planning_summary_content">
			     </c:if>
			     
			     <c:set var="headerFlag" value="0"/>
			     
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
			      <div class="grey_box_cnt">
			        <div class="GWS_title_bx">
			          <ul>
			            <li class="input_title_one fl">Recommended Products</li>
			            <li class="input_title_two fl">Existing Asset Allocation %</li>
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
			        
			        <c:set var="rowCount" value="${rowCount + 1}"/>
			        
			        <c:if test="${rowCount eq 16}">
			        	<c:set var="rowCount" value="2"/>
			         	<c:set var="headerFlag" value="1"/>
					        </div>
					        </div>
					        </div>
					        <c:if test="${mapCount.count eq fn:length(GoalWiseProductDetails)}">
						     <p style="font-size: 14px;text-align: center;">${assumptionsMade}</p>
							 </c:if>
					        <div class="clr"></div>
						        <div class="footer clearfix" style="page-break-after:always"> 
			             		<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
			             		<c:set var="pageNumber" value="${pageNumber+1 }" />
			           			</div>
					        </div>
					         <div class="page3 fl">
				              <div class="header clearfix">
				              <div class="desc_heading fl">
				                <div class="ifa_head_logo"></div>
				                <h2 class="head_txt1">${ContactDetails.name}</h2>
				              </div>
				              <h1 class="page_heading fl">Goals wise Summary Chart</h1>
				              <div class="goals_icon_bx fr">
				                <div class="goals_icon"></div>
				              </div>
				              
				             </div>
				            <div class="content" id="financial_planning_summary_content">
				            <div class="box clearfix">
				            <div class="grey_box_cnt">
					        <div class="GWS_title_bx">
					          <ul>
					            <li class="input_title_one fl">Recommended Products</li>
					            <li class="input_title_two fl">Existing Asset Allocation %</li>
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
			        </c:if>
			        
			         <c:set var="headerFlag" value="0"/>
			       			       
			        <div class="GWS_txt">
			          <ul>
			            <li class="input_txt_one fl">${productlist.productName} </li>
			            <li class="input_txt_two fl">
			              <div class="bx"> <span class="txt">${productlist.goalPercentage}</span> <span class="per">%</span> </div>
			            </li>
			            <li class="input_txt_three fl">
			              <div class="ria_bx clearfix">
			               <div class="chk_bx fl">
                            <div class="chk_bx1"></div>
                            <div class="chk_bx1"></div>
                          </div>
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
			       
			        </c:forEach>
			      </div>
			    </div>
			    			    
			    </c:forEach>
	            <c:if test="${not (headerFlag eq 1) }">  
		            </div>
		             <p style="font-size: 14px;text-align: center;">${assumptionsMade}</p>
				    <div class="clr"></div>
		            <div class="footer clearfix" style="page-break-after:always"> 
		              <!--div class="fl footer_tagline">True Friends of New Investors</div-->
		              <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
		              <c:set var="pageNumber" value="${pageNumber+1 }" />
		            </div>
		          </div>
	          </c:if>
          </c:if>
          
          
          <!------------------------------------------ End of "page3" ------------------------------------------>
          
          
            
          
          <c:if test="${not(empty(productWiseGoalDetails))}">
          <c:set var="mainHeader" value="0"/>
          <div class="page2 fl">
            <div class="header clearfix">
              <div class="desc_heading fl">
                <div class="ifa_head_logo"></div>
                <h2 class="head_txt1">${ContactDetails.name}</h2>
              </div>
              <h1 class="page_heading fl">Goals - My Dreams</h1>
              <div class="goals_icon_bx fr">
                <div class="goals_icon"></div>
              </div>
              
            </div>
            <c:set var="mainHeader" value="1"/>
            
            <div class="content" id="financial_planning_summary_content">
            
            <div class="description" style="margin-top: 20px;">
	        <p style="font-weight: bold;">DESCRIPTION</p>
	        <span><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The assets that you have already built will help you reach your goals.
                   	 Sometimes what you already have may not be sufficient. In that case you have to invest from now 
                   	 till the time your goals have to be funded, in such a way that you will have enough money at the right time. 
                   	 You will also have to regularly review and re-balance your investments to ensure you achieve your goals.
					 </p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Not investing now for the goals can mean not having enough to realize the dream resulting in having to borrow,
					 sell off assets or compromise on the goal.</p></span></div> 
	          
              <!--  Coding Starts -->
             
             <c:set var="elementCounter" value="0"/>
		     <c:set var="rowCounter" value="1"/>
		     <c:set var="testRow" value="4"/>
		     <c:set var="headerFlag" value="0"/>
		      
		   <c:forEach var="product" items="${productWiseGoalDetails}" varStatus="mapCount">
		     
		     <div class="box">
		      <div class="green">${product.value.productName}</div>
		     
		      <div class="blue">
		        <div class="lumpsum">Total Lumpsum :
		          <div class="rupee"></div>
		          <span class="amt">${product.value.totalLumpSumAmt}</span></div>
		        <div class="sip">Total SIP :
		          <div class="rupee"></div>
		          <span class="amt">${product.value.totalSipAmt}</span>
		        </div>
		      </div>
		      
		        <!-- For purchase product -->
		      <c:if test="${reportFor eq 'client'}">
		      	<c:if test="${not empty product.value.purchaseUrl }">
		      		<a class="test" target="_blank" href="${product.value.purchaseUrl}">Buy</a>
		      	</c:if>
		      </c:if>
		      
		     <div class="grey_box_cnt clearfix">
		     
		     <c:set var="divLineCounter" value="1"/>
		     <c:forEach begin="0" var="goallist" items="${product.value.clientActionPlanList}">
		        
		        <c:set var="elementCounter" value="${elementCounter + 1}"/>
		        <c:if test="${elementCounter eq 6}">
		        	<c:set var="elementCounter" value="1"/>
		        	<c:set var="rowCounter" value="${rowCounter + 1}"/>
		        	
		        	<c:if test="${rowCounter eq testRow}">
		        			<c:set var="testRow" value="5"/>
		        			<c:set var="rowCounter" value="1"/>
			        		</div>
			        		</div>
			        		</div>
			        		<c:if test="${mapCount.count eq fn:length(productWiseGoalDetails)}">
						     	<p style="font-size: 14px;text-align: center;">${assumptionsMade}</p>
						    </c:if>	
			        		<div class="clr"></div>
			        		<div class="footer clearfix" style="page-break-after:always"> 
                  				<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
                  				<c:set var="pageNumber" value="${pageNumber+1 }"/>
                			</div>
                			</div>
                		<c:set var="headerFlag" value="0"/>
			        	<div class="page2 fl">
			            <div class="header clearfix">
			              <div class="desc_heading fl">
			                <div class="ifa_head_logo"></div>
			                <h2 class="head_txt1">${ContactDetails.name}</h2>
			              </div>
			              <h1 class="page_heading fl">Goals - My Dreams</h1>
			              <div class="goals_icon_bx fr">
			                <div class="goals_icon"></div>
			              </div>
			            </div>
			            <c:set var="mainHeader" value="0"/>
			            <c:set var="headerFlag" value="1"/>
			            <div class="content" id="financial_planning_summary_content">
			            <div class="box">					      
					    <div class="grey_box_cnt clearfix">
		        	</c:if>
		        </c:if>
		        
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
		              
		              <div class="lumpsum">
		                <div class="rupee"></div>
		                <span class="amt">${goallist.lumpSumAmt}</span>
		              </div>
		              <div class="c_box fl"> <span class="common_custom_checkbox"></span>
		                <input type="checkbox" class="default_checkbox"/>
		              </div>
		            </div>
		            <div class="right">
		              <div class="title">SIP Amount </div>
		              <div class="img"></div>
		              
		              <div class="sip">
		                <div class="rupee"></div>
		                <span class="amt">${goallist.sipAmt}</span>
		              </div>
		              <div class="c_box fl"> <span class="common_custom_checkbox"></span>
		                <input type="checkbox" class="default_checkbox"/>
		              </div>
		            </div>
		          </div>
		          <!--Middle--> 
		          
		          <!--Bottom-->
		          <div class="bottom">
		            <div class="left">
		              <div class="title">Approved Amount</div>
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
		        <c:if test="${divLineCounter % 5 != 0 }">
		        <div class="divide_line"></div>
		        </c:if>
		        
		        <c:set var="divLineCounter" value="${divLineCounter+1}"/> 
		      
		        </c:forEach>
		        </div>
		    </div>		         		        
		        <c:set var="rowCounter" value="${rowCounter + 1}"/>
		        <c:set var="elementCounter" value="0"/>
		        	
		        	<c:if test="${mapCount.count lt fn:length(productWiseGoalDetails)}">
		        		<c:if test="${rowCounter eq testRow}">
		        			<c:set var="testRow" value="5"/>
		        			<c:set var="rowCounter" value="1"/>
		        			</div>
			        		<c:if test="${mapCount.count eq fn:length(productWiseGoalDetails)}">
						     <p style="font-size: 14px;text-align: center;">${assumptionsMade}</p>
						    </c:if>	
			        		<div class="clr"></div>
			        		<div class="footer clearfix" style="page-break-after:always"> 
                  				<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
                  				<c:set var="pageNumber" value="${pageNumber+1 }" />
                			</div>
                		</div>
                		
                		<c:set var="headerFlag" value="0"/>
			        	<div class="page2 fl">
			            <div class="header clearfix">
			              <div class="desc_heading fl">
			                <div class="ifa_head_logo"></div>
			                <h2 class="head_txt1">${ContactDetails.name}</h2>
			              </div>
			              <h1 class="page_heading fl">Goals - My Dreams</h1>
			              <div class="goals_icon_bx fr">
			                <div class="goals_icon"></div>
			              </div>
			            </div>
			            <c:set var="mainHeader" value="0"/>
			            <c:set var="headerFlag" value="1"/>
			             <div class="content" id="financial_planning_summary_content">
		        	  </c:if>
		        	</c:if>
		    </c:forEach>
              
           <!--------------------------  coding end ----------------------------->
          <c:set var="goalNoteTextFlag" value="0"/>
          <c:forEach var="goalNote" items="${goalNoteList}">
          <c:if test="${not empty goalNote.goalNoteText}">
          <c:set var="goalNoteTextFlag" value="1"/>
          </c:if>
          </c:forEach>
          
          	 <c:if test="${goalNoteTextFlag eq 1}">
              <div class="description">
                <p style="font-weight:bold;">Notes</p>
                   <c:forEach var="goalNote" items="${goalNoteList}">
                   	<c:if test="${not empty goalNote.goalNoteText}">
				       		<div class="goal_nm">
				       			<p><span class="inlineBlock" style="min-width:130px;">${goalNote.goalName} :- </span> ${goalNote.goalNoteText}</p>
	                     	</div>
	                </c:if>    	
	                </c:forEach>
	           </div>
	          </c:if>
	        <c:if test="${headerFlag eq 1}">
	        
	           </div>
			      <c:if test="${mapCount.count eq fn:length(productWiseGoalDetails)}">
						     <p style="font-size: 14px;text-align: center;">${assumptionsMade}</p>
				  </c:if>	
			      	<div class="clr"></div>
			       		<div class="footer clearfix" style="page-break-after:always"> 
                  			<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
                   			 <c:set var="pageNumber" value="${pageNumber+1 }" />
                			</div>
                			<c:set var="headerFlag" value="0"/>
                		</div>
	        
	        
	        </c:if>
	          
	        <c:if test="${mainHeader eq 1}">
            </div>
             <p style="font-size: 14px;text-align: center;">${assumptionsMade}</p>
		    <div class="clr"></div>
            	<div class="footer clearfix" style="page-break-after:always"> 
                  				<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
                  				<c:set var="pageNumber" value="${pageNumber+1 }" />
            	</div>
          	</div>
          </c:if> 
          </c:if>
           <!------------------------------------------ End of "page2" ------------------------------------------> 
          
        <c:if test="${fn:contains(fpSection, '39001')}">
        <c:if test="${not(empty(emergencyPlanningDataList))}">
         <div class="page4 fl">
		  <div class="header clearfix">
		    <div class="desc_heading fl">
		      <div class="ifa_head_logo"></div>
		      <h2 class="head_txt2">${ContactDetails.name}</h2>
		    </div>
		    <h1 class="page_heading fl">Emergency Planning</h1>
		    <div class="icon"></div>
		  </div>
		  <div class="content" id="er_planning">
		  <div class="description"><p>DESCRIPTION</p><span>To tide over emergencies like loss of job or loss in business or sudden health set backs or natural calamities a sum <br>&nbsp;&nbsp;equivalent to 6 months expenses have to be maintained as emergency funds.</span></div>
		  
		  <div class="emergency_plan">
		  	<div class="ep_header fl">
		    	<p class="fl">Emergency Planning</p><div class="line fr"></div>
		    </div>
		    <div class="onetime_sip fl">
          <div class="onetime fl" style="margin-left: 40px;">
            <div class="onetime_header"><p>One Time</p></div>
            <div class="amount"><p class="fl">Amount :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyPlanningOneTimeAmt} /-</span></div>
            <br><br>
            <div class="onetime_line" style="width: 690px;"></div>
            <div class="sug_inv"><p>Suggested Investment</p></div>
            
            <c:forEach var="emergencyProductList" items="${emergencyPlanningDataList}">
            <div class="product1 fl"><div class="chkbx fl"></div><p class="fl">${emergencyProductList.productName} :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyProductList.lumpSumAmt} /-</span></div>
            <c:set var="totalCounterOneTime" value="${totalCounterOneTime+1}"/>
           </c:forEach>
            
            <div class="bottom_left fl">
            <div class="app_amt fl"><p>Approved Amount</p><span class="rupee fl"></span><span class="money fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
            </div>
            
            <div class="bottom_left fr">
            <div class="exec_date fl"><p class="fl">Execution Date</p><div class="chkbx_grp"><div class="chkbx">D</div><div class="chkbx">D</div><div class="chkbx">M</div><div class="chkbx">M</div><div class="chkbx">Y</div><div class="chkbx">Y</div></div>
            </div>        
        </div>
        
        
        </div>
        
        <!-- <div class="devider fl"></div> -->
         <%-- <div class="sip fr">
            <div class="sip_header"><p>Monthly</p></div>
            <div class="amount"><p class="fl">Amount :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyPlanningSIPMonthlyAmt} /-</span></div>
            <br><br>
            <p style="font-size: 12px; font-weight: bold; line-height:10px;">Put part of the amount in deposit account.<br><br>Invest the rest in an SIP and continue for six months.</p>
            <br>
            <div class="sip_line"></div>
            <div class="sug_inv"><p>Suggested Investment</p></div>
            
            <c:forEach var="emergencyProductList" items="${emergencyPlanningDataList}">
            <div class="product1 fl"><div class="chkbx fl"></div><p class="fl">${emergencyProductList.productName} :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyProductList.existingCover} /-</span></div>
        	<c:set var="totalCounterSIP" value="${totalCounterSIP+1}"/>
        	</c:forEach>
            
            <div class="bottom_left fl">
            <div class="app_amt fl"><p>Approved Amount</p><span class="rupee fl">    </span><span class="money fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
            </div>
            
            <div class="bottom_left fr">
            <div class="exec_date fl"><p class="fl">Execution Date</p><div class="chkbx_grp"><div class="chkbx">D</div><div class="chkbx">D</div><div class="chkbx">M</div><div class="chkbx">M</div><div class="chkbx">Y</div><div class="chkbx">Y</div></div>
            </div>
            
        </div>
            
        </div> --%>
        
    </div><!-- end of "onetime_sip" -->
    <div class="shadow_big_half fl">&nbsp;</div>
    
	  </div><!-- end of "emergency_plan" --> 
	    
	  </div><!-- End of "content" -->    
	  <div class="footer clearfix" style="page-break-after:always">
	    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
	    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
	    <c:set var="pageNumber" value="${pageNumber+1 }" />
	  </div>
		</div>
		</c:if>
		</c:if>
		<!--------------------------------------------------------------------- end of "page4"---------------------------- -->  
		 <c:if test="${fn:contains(fpSection, '39003')}">
		 <c:if test="${not(empty(riskPlanningProductDetails))}">
		 <div class="page5 fl">
	    <div class="header clearfix">
	      <div class="desc_heading fl">
	      <div class="ifa_head_logo"></div>
	        <h2 class="head_txt2">${ContactDetails.name}</h2>
	      </div>
	      <h1 class="page_heading fl">Risk Planning</h1>
	      <div class="icon"></div> 
	    </div>
	    <div class="content" id="er_planning">
	      <div class="description">
	        <p>DESCRIPTION</p>
	        <span>To tide over emergencies like loss of job or loss in business or sudden health set backs or natural calamities a sum <br>
	        &nbsp;&nbsp;equivalent to 6 months expenses have to be maintained as emergency funds.</span></div>
	      <div class="risk_planning fl">
	        <div class="rp_header fl">
	          <p class="fl">Risk Planning</p>
	          <div class="line fr"></div>
	        </div>
	        
	      <!--  coding start -->
	      
	      <c:set var="rowCount" value="2"/>
	      <c:set var="elementCount" value="0"/>
	      <c:set var="footerFlag" value="0"/>	      
         <c:forEach var="riskData" items="${riskPlanningProductDetails}">
         
        	<c:set var="rowCount" value="${rowCount + 1}"/>
        	<c:if test="${rowCount gt 9}">
        		<c:set var="footerFlag" value="1"/>
			        </div></div>
			        <div class="clr"></div>
			        <div class="footer clearfix" style="page-break-after:always"> 
			      	<!--div class="fl footer_tagline">True Friends of New Investors</div-->
			      	<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
			      	<c:set var="pageNumber" value="${pageNumber+1 }" />
			        </div>
			        
			        </div>
		        	<div class="page5 fl">
			    <div class="header clearfix">
			      <div class="desc_heading fl">
			      <div class="ifa_head_logo"></div>
			        <h2 class="head_txt2">${ContactDetails.name}</h2>
			      </div>
			      <h1 class="page_heading fl">Risk Planning</h1>
			      <div class="icon"></div> 
			    </div>
			    <div class="content" id="er_planning">
		        <div class="risk_planning fl">
		        <c:set var="rowCount" value="1"/>
		        <!-- <div class="r_p fl">
		        <div class="sug_product fl"> -->
        	</c:if>        
         <c:set var="footerFlag" value="0"/>
          <div class="r_p fl">
          <div class="early_death_header fl">
            <p class="fl">${riskData.key}</p>
            <c:if test="${riskData.key eq 'Early Death'}">
            <c:set var="insuranceName" value="Early Death"/>
	        <div class="icon_bg fr"></div>
	        </c:if>
	        <c:if test="${riskData.key eq 'Personal Accident'}">
	        <c:set var="insuranceName" value="Personal Accident"/>
	        <div class="icon_bg4 fr"></div>
	        </c:if>
	        <c:if test="${riskData.key eq 'Critical Illness'}">
	        <c:set var="insuranceName" value="Critical Illness"/>
	        <div class="icon_bg5 fr"></div>
	        </c:if>
	        <c:if test="${riskData.key eq 'Health Setback'}">
	        <c:set var="insuranceName" value="Health Setback"/>
	        <div class="icon_bg3 fr"></div>
	        </c:if>
	        <c:if test="${riskData.key eq 'Disability'}">
	        <c:set var="insuranceName" value="Disability"/>
	        <div class="icon_bg2 fr"></div>
	        </c:if>
          </div>
          <div class="existing_header fr">
            <div class="existing fl">
              <p class="fl">Existing :</p>
              <span class="rupee fl"></span><span class="money fl">${riskData.value.existingCover}</span>
              <p class="fl"></p>
            </div>
            <div class="required fr">
              <p class="fl">Required :</p>
              <span class="rupee fl"></span><span class="money fl">${riskData.value.requiredCover}</span>
              <p class="fl"></p>
            </div>
            
            <!--div class="icon_bg fl"></div--></div>
          <div class="suggestion fl"> <span class="sugg_heading fl">Suggestion :</span>
	            <c:if test="${riskData.value.decimalNumber gt 0.0}">
	            <c:choose>
	            <c:when test="${riskData.key eq 'Personal Accident'}">
	        		<p class="fl">Take A Personal Accidental Cover For </p>
	            </c:when>
	            <c:when test="${riskData.key eq 'Critical Illness'}">
	        		<p class="fl">Take A Critical Illness Cover For </p>
	            </c:when>
	            <c:when test="${riskData.key eq 'Health Setback'}">
	        		<p class="fl">Take A Health Cover For </p>
	            </c:when>
		 	   	<c:otherwise>
	        		<p class="fl">Take A Life Insurance Cover For </p>
	            </c:otherwise>
	            </c:choose>
		 	   	 <span class="money fl">
		 	   	 <span class="rupee fl"></span>
		 	   	 	${riskData.value.moneyFormatted}
		 	   	 </span>
		 	   	</c:if>
		 	   	<c:if test="${riskData.value.decimalNumber <= 0.0}">
		 	   	 <p class="fl">Excellent You have adequate ${insuranceName} insurance coverage</p>
		 	   	</c:if>
            <p>The premiums are approximate. In some cases the premium is not available. Please seek information from your advisor.</p>
            <p class="fl"></p>
          </div>
          <div class="clr"></div>
          
          
          <div class="sug_product fl">
          <c:set var="counter" value="${1}"/>
          <c:forEach var="product" items="${riskData.value.clientActionPlanList}"> 
         	<c:set var="footerFlag" value="0"/>
          <c:if test="${not empty product.productName and product.isPreferred eq 1}">
            <c:set var="elementCount" value="${elementCount +1}"/>
            <c:if test="${elementCount eq 3}">
            	<c:set var="elementCount" value="1"/>
            	<c:set var="rowCount" value="${rowCount + 1}"/>
	        	<c:if test="${rowCount gt 9}">
	        		<c:set var="footerFlag" value="1"/>
				        </div></div>
				        <div class="clr"></div>
				        <div class="footer clearfix" style="page-break-after:always"> 
				      	<!--div class="fl footer_tagline">True Friends of New Investors</div-->
				      	<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
				      	<c:set var="pageNumber" value="${pageNumber+1 }" />
				        </div>
				        
				        </div>
			        	<div class="page5 fl">
				    <div class="header clearfix">
				      <div class="desc_heading fl">
				      <div class="ifa_head_logo"></div>
				        <h2 class="head_txt2">${ContactDetails.name}</h2>
				      </div>
				      <h1 class="page_heading fl">Risk Planning</h1>
				      <div class="icon"></div> 
				    </div>
				    <div class="content" id="er_planning">
			        <div class="risk_planning fl">
			        <div class="r_p fl">
			        <div class="sug_product fl">
	        		<c:set var="rowCount" value="1"/>
	        	</c:if>        
            </c:if>
            
            <c:if test="${counter eq 1 }">
               <div class="sug_prd">
                <p>Suggested Products (Preferred)</p>
         	   </div>
            </c:if>
            
            <div class="prod1 fl">
              <div class="prd_name fl">
                <p>${product.productName}</p>
              </div>
              <div class="grn_patch fl">
                <div class="half_part fl"> <span class="amt_type fl">Sum Assured</span> <span class="rupee fl"></span> <span class="money fl">${product.lumpSumAmt} /-</span> </div>
                <!-- end of "upper_part" -->
                
                <div class="half_part fl"> <span class="amt_type fl">Premium Amount</span> 
                <c:choose>
                <c:when test="${product.premiumAmount eq '0'}">
                <span class="rupee fl" style="display: none;"></span> <span class="money fl"> &nbsp;&nbsp; NA</span> 
                </c:when>
                <c:otherwise>
                <span class="rupee fl"></span> <span class="money fl">${product.premiumAmount} /-</span>
                </c:otherwise>
                </c:choose>
                </div>
                <!-- end of "upper_part" --> 
              </div>
              <!-- end of "grn_patch" -->
              
              <div class="bottom_left fl">
                <div class="chkbx1 fl"></div>
                <div class="app_amt fl">
                  <p class="fl">Approved Sum Assured</p>
                  <span class="rupee fl"></span> <span class="money fl"></span> </div>
              </div>
              <div class="bottom_left fr">
                <div class="exec_date fl">
                  <p class="fl">Execution Date</p>
                  <div class="chkbx_grp">
                    <div class="chkbx">D</div>
                    <div class="chkbx">D</div>
                    <div class="chkbx">M</div>
                    <div class="chkbx">M</div>
                    <div class="chkbx">Y</div>
                    <div class="chkbx">Y</div>
                  </div>
                  <!-- end of "chkbx_grp" --> 
                </div>
                <!-- end of "exec_date" --> 
              </div>
              <!-- end of "bottom_left" --> 
            </div>
            <!-- end of "prod1" -->
          
          <c:set var="counter" value="${counter+1}"/>
          
          </c:if>
          
          </c:forEach>
          </div>
          <c:if test="${elementCount gt 0}">
          	<c:set var="elementCount" value="0"/>
          	<c:set var="rowCount" value="${rowCount + 1}"/>
          </c:if>
         
          
          <div class="sug_product fl"> 
          <c:set var="counter" value="${1}"/>
          <c:forEach var="product" items="${riskData.value.clientActionPlanList}"> 
          <c:set var="footerFlag" value="0"/>
          <c:set var="rowCount" value="${rowCount + 1}"/>
          <c:if test="${not empty product.productName and product.isPreferred eq 0}">
          <c:set var="elementCount" value="${elementCount +1}"/>
            <c:if test="${elementCount eq 3}">
            	<c:set var="elementCount" value="1"/>
            	<c:set var="rowCount" value="${rowCount + 1}"/>
	        	<c:if test="${rowCount gt 9}">
	        		<c:set var="footerFlag" value="1"/>
				        </div></div>
				        <div class="clr"></div>
				        <div class="footer clearfix" style="page-break-after:always"> 
				      	<!--div class="fl footer_tagline">True Friends of New Investors</div-->
				      	<div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
				      	<c:set var="pageNumber" value="${pageNumber+1 }" />
				        </div>
				        
				        </div>
			        	<div class="page5 fl">
				    <div class="header clearfix">
				      <div class="desc_heading fl">
				      <div class="ifa_head_logo"></div>
				        <h2 class="head_txt2">${ContactDetails.name}</h2>
				      </div>
				      <h1 class="page_heading fl">Risk Planning</h1>
				      <div class="icon"></div> 
				    </div>
				    <div class="content" id="er_planning">
			        <div class="risk_planning fl">
			        <div class="r_p fl">
			        <div class="sug_product fl">
			        <c:set var="rowCount" value="1"/>
	        	</c:if>        
            </c:if>
          
           
           <c:if test="${counter eq 1 }">
               <div class="sug_prd2">
          		  <p>Suggested Products (Alternative)</p>
          	   </div>
           </c:if>
          
            <div class="prod1 fl">
              <div class="prd_name fl">
                <p>${product.productName}</p>
              </div>
              <div class="grn_patch fl">
                <div class="half_part fl"> <span class="amt_type fl">Cover Amount</span> <span class="rupee fl"></span> <span class="money fl">${product.lumpSumAmt} /-</span> </div>
                <!-- end of "upper_part" -->
                
                <div class="half_part fl"> <span class="amt_type fl">Premium Amount</span>
                
                <c:choose>
                <c:when test="${product.insuranceAmount eq '0'}">
                 <span class="rupee fl" style="display: none;"></span> <span class="money fl">&nbsp;&nbsp;NA</span>
                 </c:when>
                 <c:otherwise>
                 <span class="rupee fl"></span> <span class="money fl">${product.insuranceAmount} /-</span>
                 </c:otherwise> 
                 </c:choose>
                 </div>
                <!-- end of "upper_part" --> 
              </div>
              <!-- end of "grn_patch" -->
              
              <div class="bottom_left fl">
                <div class="chkbx1 fl"></div>
                <div class="app_amt fl">
                  <p class="fl">Approved Sum Assured</p>
                  <span class="rupee fl"></span> <span class="money fl"></span> </div>
              </div>
              <div class="bottom_left fr">
                <div class="exec_date fl">
                  <p class="fl">Execution Date</p>
                  <div class="chkbx_grp">
                    <div class="chkbx">D</div>
                    <div class="chkbx">D</div>
                    <div class="chkbx">M</div>
                    <div class="chkbx">M</div>
                    <div class="chkbx">Y</div>
                    <div class="chkbx">Y</div>
                  </div>
                  <!-- end of "chkbx_grp" --> 
                </div>
                <!-- end of "exec_date" --> 
              </div>
              <!-- end of "bottom_left" --> 
            </div>
            <!-- end of "prod1" -->
            <c:set var="counter" value="${counter+1}"/>
          </c:if>
           
          </c:forEach>
          </div>
        </div>
        <div class="shadow_big1 fl">&nbsp;</div>
        <!-- end of "r_p" -->
        
        <c:if test="${elementCount gt 0}">
          	<c:set var="elementCount" value="0"/>
          	<c:set var="rowCount" value="${rowCount + 1}"/>
          </c:if>
          
        </c:forEach>
        <!--  coding end -->
      </div>
      <!-- End of "risk_planning" --> 
      
    </div>
    <!-- End of "content" -->
    <c:if test="${not (footerFlag eq 1)}">
    <div class="clr"></div>
    <div class="footer clearfix" style="page-break-after:always"> 
      <!--div class="fl footer_tagline">True Friends of New Investors</div-->
      <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
      <c:set var="pageNumber" value="${pageNumber+1 }" />
    </div>
  </div>
  </c:if>
  <!-- ------------------------------------------------------end of "page5"---------------------------------------------- -->
  </c:if>
  </c:if>
  
  
  
  <c:if test="${not(empty(loanRecommendationList)) or not(empty(taxPlanningList)) or not(empty(vacationPlanningList))}">
  
  <div class="page7 fl">
    <div class="header clearfix">
      <div class="desc_heading fl">
        <div class="ifa_head_logo"></div>
        <h2 class="head_txt2">${ContactDetails.name}</h2>
      </div>
      <h1 class="page_heading fl">Other Reccomendation</h1>
      <div class="icon"></div>
    </div>
    <div class="content" id="other">
    
     <c:if test="${loanRecommendationList.size() > 0 }">
      <div class="common_header fl">
          <p class="fl">Loan Recommendation</p>
          <div class="line fr"></div>
       </div><!-- Loan Type -->
       
      <div class="table clearfix">
          <div class="table-header">
            <ul>
              <li class="one">Loan Type</li>
              <li class="two">Recommended Product</li>
              <li class="three">Potential Revenue</li>
              <!--li class="four">Fees</li-->
            </ul>
          </div>
          <c:forEach var="loanRecommendation" items="${loanRecommendationList}">
          <div class="first-row fl">
            <ul>
              <li class="one fl">${loanRecommendation.goalName}</li>
              <li class="two fl">${loanRecommendation.productName}</li>
              <li class="three fl">${loanRecommendation.revenueAmount} /-</li>
              <!--li class="four fl">5000/-</li-->
            </ul>
          </div>
          </c:forEach>
          
                
      </div>  <!-- End "Table" --> 
      </c:if>
      
      <c:if test="${taxPlanningList.size() > 0 }">
      <div class="common_header fl">
          <p class="fl">Tax Planning</p>
          <div class="line fr"></div>
       </div> <!-- Tax Planning -->
      
      <div class="table clearfix">
          <div class="table-header">
            <ul>
              <li class="one">Recommended Service</li>
              <li class="two">Service Provider</li>
              <li class="three">Fees</li>
              <li class="four">Potential Revenue</li>
            </ul>
          </div>
          <c:forEach var="taxPlanning" items="${taxPlanningList}">
          <div class="first-row fl">
            <ul>
              <li class="one fl">${taxPlanningList.productName}</li>
              <li class="two fl">${taxPlanningList.manufacturerName}</li>
              <li class="three fl">${taxPlanningList.revenueAmount}</li>
              <li class="four fl">${taxPlanningList.revenueAmount}</>
            </ul>
          </div>
          </c:forEach>
        </div>  <!-- End "Table" --> 
      </c:if>
      <c:if test="${vacationPlanningList.size() > 0 }">
      <div class="common_header fl">
          <p class="fl">Vaccation Planning</p>
          <div class="line fr"></div>
       </div>  <!-- Vaccation Planning -->
      
      <div class="table clearfix">
          <div class="table-header">
            <ul>
              <li class="one">Product Name</li>
              <li class="two">Service Provider</li>
              <li class="three">Fees</li>
              <li class="four">Potential Revenue</li>
            </ul>
          </div>
          <c:forEach var="vacationPlanning" items="${vacationPlanningList}">
          <div class="first-row fl">
            <ul>
              <li class="one fl">${taxPlanningList.productName}</li>
              <li class="two fl">${taxPlanningList.manufacturerName}</li>
              <li class="three fl">${taxPlanningList.revenueAmount}</li>
              <li class="four fl">${taxPlanningList.revenueAmount}</>
            </ul>
          </div>
          </c:forEach>
               
        </div>  <!-- End "Table" -->
      </c:if>
      
    </div><!-- end of "content" -->
   	    
    <div class="footer clearfix"> 
      <!--div class="fl footer_tagline">True Friends of New Investors</div-->
      <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
      <c:set var="pageNumber" value="${pageNumber+1 }" />
    </div>
  </div>
  </c:if> 
  
  <!------------------------------------------------ end of "page7"-------------------------------------------- --> 
  
  <c:if test="${fn:contains(fpSection, '39007')}">
  <c:if test="${not(empty(successionPlanningDetails))}">
  
  <c:forEach var="clientActionPlane" items="${successionPlanningDetails}">
		<c:set var="investJointly" value="${clientActionPlane.investJointly}"/>
		<c:set var="awareInvest" value="${clientActionPlane.awareInvest}"/>
		<c:set var="prepareWill" value="${clientActionPlane.prepareWill}"/>
		<c:set var="productId" value="${clientActionPlane.productId}"/>
	</c:forEach>
 		
  	<div class="page6 fl">
  	<div class="header clearfix">
    <div class="desc_heading fl">
      <div class="ifa_head_logo"></div>
      <h2 class="head_txt2">${ContactDetails.name}</h2>
    </div>
    <h1 class="page_heading fl">Succession Planning</h1>
    <div class="icon"></div>
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
                <div class="custom_radio <c:if test="${awareInvest==1}">selected</c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${awareInvest==0}">selected</c:if>"></div>
              </li>
            </ul>
          </div>
          <div class="action fl">
            <h4 class="action_head">What to Do?</h4>
            <p class="txt">Prepare an exhaustive list of 
                                        - Movable Assets 
                                        - Investment assets
                                        - Money receivable from others
                                        - Money payable to others
                                        along with details of a/c nos, phone nos. etc.
			</p>
          </div>
          <div class="importance fl">
            <h4 class="imp_head">Why it is Important ?</h4>
            <p class="txt"> Lakhs of crores of money lies unclaimed in insurance companies' and banks' coffers. A man works hard and builds assets and purchases insurance policies to protect his family. But does not inform his wife about it. A widowed mother struggles with her children to make ends meet. </p>
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
                <div class="custom_radio <c:if test="${investJointly==1}">selected</c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${investJointly==0}">selected</c:if>"></div>
              </li>
            </ul>
          </div>
          <div class="action fl">
            <h4 class="action_head">What to Do?</h4>
            <p class="txt">Hold investments
                                        - Jointly with spouse / someone you trust
                                        - Either or survivor mode is preferable
                               		       Update nominations in your bank a/cs, investment a/cs, housing society records etc.</p>
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
                <div class="custom_radio <c:if test="${prepareWill==1}">selected</c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${prepareWill==0}">selected</c:if>"></div>
              </li>
            </ul>
          </div>
          <div class="action fl">
            <h4 class="action_head">What to Do?</h4>
            <p class="txt">Prepare a Will and include details of
                                         - Who should inherit what?
                                        - How loans have to be discharged?
                                        - Who should be guardian for minor children?
                                        - Who should execute the Will
                                        Create Trusts to ensure that the money is used only for the benefit of who it is meant for.</p>
          </div>
          <div class="importance fr">
            <h4 class="imp_head">Why it is Important ?</h4>
            <p class="txt">Imagine a widowed woman getting a huge sum from insurance policies. With so much to handle, and so many people around will she be able to make the best of this money to safeguard her / childrens' future? The man's dependent parents are not aware of their rights on their son's wealth.
</p>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <c:if test="${productId != 0 }">
  <c:choose >
  <c:when test="${fn:length(successionPlanningDetails) gt 4} ">
  
      
      <div class="clr"></div> 
	  <div class="footer clearfix" style="page-break-after:always">
	    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
	    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
	    <c:set var="pageNumber" value="${pageNumber+1 }" />
	  </div>
	  <div class="header clearfix">
	    <div class="desc_heading fl">
	      <div class="ifa_head_logo"></div>
	      <h2 class="head_txt2">${ContactDetails.name}</h2>
	    </div>
	    <h1 class="page_heading fl">Succession Planning</h1>
	    <div class="icon"></div>
	  </div>
	  <div class="content" id="succession_planning">
  
  
  
  	
  </c:when>
  </c:choose>  
  <div class="table clearfix">
  	<div class="table-header">
    	<ul>
        	<li class="one">Action</li>
            <li class="two">Product</li>
            <li class="three">Date</li>
            <li class="four">Fees</li>
        </ul>
    </div>
    
    <c:forEach var="clientActionPlane" items="${successionPlanningDetails}">
      <c:if test="${not empty clientActionPlane.goalName or not empty clientActionPlane.productName}">
    <div class="first-row fl">
	    	<ul>
	        	<li class="one fl">${clientActionPlane.goalName}</li>
	            <li class="two fl">${clientActionPlane.productName}</li>
	            <li class="three fl">${clientActionPlane.successionDate}</li>
	            <li class="four fl">${clientActionPlane.insuranceAmount} /-</li>
	        </ul>
	</div>
	</c:if>
	</c:forEach>
        
  </div>
  </c:if>
  <!-- End "Table" -->
  <c:if test="${reportFor eq 'client'}">	  
  <div class="signature">
  	<div class="sign-header">
    	<ul>
        	<li class="one">Advisor Signature</li>
            <li class="two">Client Signature</li>
        </ul>
    </div>
    
    <div class="sign-box">
    	<ul>
        	<li class="one"></li>
            <li class="two"></li>
        </ul>
    </div>
    
    <div class="place">
       	<ul>
        	<li><span class="one">Place:</span><span style="color:<%=colorCodeLeft %>">--------------------------</span></li>
            <li><span class="two">Place:</span><span style="color:<%=colorCodeLeft %>">--------------------------</span></li>
        </ul>
    </div> 
    
    <div class="date">
       	<ul>
        	<li><span class="one">Date:</span><span style="color:<%=colorCodeLeft %>">--------------------------</span></li>
            <li><span class="two">Date:</span><span style="color:<%=colorCodeLeft %>">--------------------------</span></li>
        </ul>
    </div>   
  </div><!-- End Of "Signature" -->
  </c:if>
  <c:choose>
  	<c:when test="${reportFor eq 'client'}">
  		<div class="footer clearfix" style="margin-top:80px;">
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
    <c:set var="pageNumber" value="${pageNumber+1 }" />
  </div>
  	</c:when>
  	<c:otherwise>
  		<div class="footer clearfix" style="margin-top:253px;">
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
    <c:set var="pageNumber" value="${pageNumber+1 }" />
  </div>
  	</c:otherwise>
  </c:choose>
</div>
<!-- --------------------------------------------------------------------end of "page6"------------------------------------------- -->
  	</c:if>
  </c:if>
 		 
</div>
<!-- end of "wrapper" -->

</body>
</html>
