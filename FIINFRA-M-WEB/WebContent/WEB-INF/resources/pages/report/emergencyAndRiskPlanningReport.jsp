<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.wrapper4 { width:792px; margin:0 auto;/* height:1124px */;color:#3a3a3a; font-family: 'allerregular';margin-bottom:20px; }
.header4 { height:65px; background:<%=colorCode %> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size:754px auto;}
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { /* height:740px */ }
.footer { height:18px; background:#c0c0c0; width:100%; margin-top:10px;}
.page_heading { /* color: #FFF;  */font-size: 23px; font-family: "Aller Bold"; line-height: 63px; /* text-align: center; */ width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
/* .head_txt2 { color: <%=colorCode%>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center } */
.theme_color { color: <%=colorCode%>; }
/***Common Css Ends***/


/***Goals My Dreams Starts***/
#er_planning .container { position: relative; width: 92%; margin: 0 auto; height: 220px; }
#er_planning .description{width:770px; height:100px; border:1px solid <%=colorCodeLeft%>; margin:10px auto 0px auto;box-shadow:0px 3px 5px #3a3a3a;}
#er_planning .description p{font-family:"allerregular"; font-size:16px; font-weight:bold; color:#3a3a3a; padding:5px;}
#er_planning .description span{font-family:"allerregular"; font-size:14px; color:#3a3a3a; margin:5px 0px 0px 5px; width:760px;}

#er_planning .emergency_plan{margin:10px 0px 0px 0px;}
#er_planning .emergency_plan .shadow_small{background: url(${pageContext.request.contextPath}/resources/images/shadow_small.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;left: 38px;top: 350px;z-index: -5;opacity: 0.7;}
#er_planning .emergency_plan .shadow_small2{background: url(${pageContext.request.contextPath}/resources/images/shadow_small.png) no-repeat;width: 50%;margin: 0px 0px 0px 0px;position: relative;left: 455px;top: 334px;z-index: -5;opacity: 0.7;}
#er_planning .emergency_plan .ep_header p{font-family:"allerregular"; font-size:18px; color:<%=colorCode%>; font-weight:bold; margin:10px 0px 0px 0px;text-shadow: 0px 1px 1px #8F8F8F;}
#er_planning .emergency_plan .ep_header .line{width:590px; height:2px; background-color:#b3b3b3; margin:20px 0px 0px 10px;}

/******************** ONE TIME START **************************/
#er_planning .emergency_plan .onetime{width:380px; height:auto; border:1px solid #dbdbdb; margin:30px 0px 0px 0px; background-color:#fff;}
#er_planning .emergency_plan .onetime .onetime_header{height:35px; width:180px; border-radius:30px; background-color:<%=colorCodeLeft%>;position: relative;top: -20px;left: 30px;}
#er_planning .emergency_plan .onetime .onetime_header p{text-align:center; line-height:35px; font-family:"allerregular"; font-size:15px; color:#3a3a3a; font-weight:bold;}
#er_planning .emergency_plan .onetime .amount p{font-family:"allerregular"; font-size:15px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 30px;}
#er_planning .emergency_plan .onetime .amount .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:0px 0px 0px 0px;}
#er_planning .emergency_plan .onetime .amount .money{font-family:"allerregular"; font-size:20px; color:<%=colorCode%>; border-bottom:2px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .onetime .onetime_line{width:330px; height:1px; background-color:#bdbdbd; margin:0px auto;} 

#er_planning .emergency_plan .onetime .sug_inv p{ font-family:"allerregular"; font-size:15px; font-weight:bold; text-shadow: 0px 1px 1px #8F8F8F; color: <%=colorCode%>; margin: 10px 0px 0px 22px;}


#er_planning .emergency_plan .onetime .product1{margin: 30px 0px 0px 20px;}
#er_planning .emergency_plan .onetime .product1 p{font-family:"allerregular"; font-size:14px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 15px;}
#er_planning .emergency_plan .onetime .product1 .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
#er_planning .emergency_plan .onetime .product1 .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .onetime .product1 .chkbx{width:10px; height:10px; border:1px solid #666; }
/*--------------------------------------------------------*/
#er_planning .emergency_plan .onetime .product2{margin: 15px 0px 0px 60px;}
#er_planning .emergency_plan .onetime .product2 p{font-family:"allerregular"; font-size:14px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 15px;}
#er_planning .emergency_plan .onetime .product2 .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
#er_planning .emergency_plan .onetime .product2 .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .onetime .product2 .chkbx{width:10px; height:10px; border:1px solid #666; }

/*--------------------------------------------------------*/
#er_planning .emergency_plan .onetime .product3{margin: 15px 0px 0px 60px;}
#er_planning .emergency_plan .onetime .product3 p{font-family:"allerregular"; font-size:14px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 15px;}
#er_planning .emergency_plan .onetime .product3 .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
#er_planning .emergency_plan .onetime .product3 .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .onetime .product3 .chkbx{width:10px; height:10px; border:1px solid #666; }

/*--------------------------------------------------------*/
#er_planning .emergency_plan .onetime .app_amt{margin: 30px 0px 0px 60px;}
#er_planning .emergency_plan .onetime .app_amt p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}
#er_planning .emergency_plan .onetime .app_amt .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px; margin-top:10px;}
#er_planning .emergency_plan .onetime .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>; margin-top:10px;}
#er_planning .emergency_plan .onetime bottom_left{display:inline-block;}

/*--------------------------------------------------------*/
#er_planning .emergency_plan .onetime .exec_date{margin: 30px 50px 0px 0px;}
#er_planning .emergency_plan .onetime .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}

#er_planning .emergency_plan .onetime .exec_date .chkbx{width:10px; height:10px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
#er_planning .emergency_plan .onetime .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

#er_planning .emergency_plan .onetime bottom_right{display:inline-block;}

/******************** ONE TIME END **************************/

/******************** SIP START **************************/
#er_planning .emergency_plan .sip{width:380px; height:auto; border:1px solid #dbdbdb; margin:30px 0px 0px 0px; background-color:#fff;}
#er_planning .emergency_plan .sip .sip_header{height:35px; width:180px; border-radius:30px; background-color:<%=colorCode%>;position: relative;top: -20px;left: 170px;}
#er_planning .emergency_plan .sip .sip_header p{text-align:center; line-height:35px; font-family:"allerregular"; font-size:15px; color:#3a3a3a; font-weight:bold;}
#er_planning .emergency_plan .sip .amount p{font-family:"allerregular"; font-size:15px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 30px;}
#er_planning .emergency_plan .sip .amount .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:0px 0px 0px 0px;}
#er_planning .emergency_plan .sip .amount .money{font-family:"allerregular"; font-size:20px; color:<%=colorCode%>; border-bottom:2px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .sip .sip_line{width:330px; height:1px; background-color:#bdbdbd; margin:0px auto;} 

#er_planning .emergency_plan .sip .sug_inv p{ font-family:"allerregular"; font-size:15px; font-weight:bold; text-shadow: 0px 1px 1px #8F8F8F; color: <%=colorCode%>; margin: 10px 0px 0px 22px;}


#er_planning .emergency_plan .sip .product1{margin: 30px 0px 0px 20px;}
#er_planning .emergency_plan .sip .product1 p{font-family:"allerregular"; font-size:14px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 15px;}
#er_planning .emergency_plan .sip .product1 .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
#er_planning .emergency_plan .sip .product1 .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .sip .product1 .chkbx{width:10px; height:10px; border:1px solid #666; }
/*--------------------------------------------------------*/
#er_planning .emergency_plan .sip .product2{margin: 15px 0px 0px 60px;}
#er_planning .emergency_plan .sip .product2 p{font-family:"allerregular"; font-size:14px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 15px;}
#er_planning .emergency_plan .sip .product2 .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
#er_planning .emergency_plan .sip .product2 .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .sip .product2 .chkbx{width:10px; height:10px; border:1px solid #666; }

/*--------------------------------------------------------*/
#er_planning .emergency_plan .sip .product3{margin: 15px 0px 0px 60px;}
#er_planning .emergency_plan .sip .product3 p{font-family:"allerregular"; font-size:14px; color:#3a3a3a; font-weight:bold; display: inline-block; margin: 0px 0px 0px 15px;}
#er_planning .emergency_plan .sip .product3 .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px;}
#er_planning .emergency_plan .sip .product3 .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>;}
#er_planning .emergency_plan .sip .product3 .chkbx{width:10px; height:10px; border:1px solid #666; }

/*--------------------------------------------------------*/
#er_planning .emergency_plan .sip .app_amt{margin: 30px 0px 0px 60px;}
#er_planning .emergency_plan .sip .app_amt p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}
#er_planning .emergency_plan .sip .app_amt .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:-3px 0px 0px 0px; background-size: 8px 12px; margin-top:10px;}
#er_planning .emergency_plan .sip .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>; margin-top:10px;}
#er_planning .emergency_plan .sip bottom_left{display:inline-block;}

/*--------------------------------------------------------*/
#er_planning .emergency_plan .sip .exec_date{margin: 30px 50px 0px 0px;}
#er_planning .emergency_plan .sip .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 7px;}

#er_planning .emergency_plan .sip .exec_date .chkbx{width:10px; height:10px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
#er_planning .emergency_plan .sip .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

#er_planning .emergency_plan .sip bottom_right{display:inline-block;}

/******************** SIP END **************************/

/******************** RISK PLANNING START **************************/

#er_planning .risk_planning{margin:20px 0px 0px 0px;}
#er_planning .risk_planning .shadow_big1{background: url(${pageContext.request.contextPath}/resources/images/shadow_big.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;
left: -10px;top: -10px;z-index: -5;opacity: 0.7;background-size: 800px 21px;}
#er_planning .risk_planning .shadow_big2{background: url(${pageContext.request.contextPath}/resources/images/shadow_big.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;
left: -10px;top:-10px;z-index: -5;opacity: 0.7;background-size: 800px 21px;}
#er_planning .risk_planning .shadow_big3{background: url(${pageContext.request.contextPath}/resources/images/shadow_big.png) no-repeat;width: 100%;margin: 0px 0px 0px 0px;position: relative;
left: -10px;top: -10px;z-index: -5;opacity: 0.7;background-size: 800px 21px;}

.rp_header p{font-family:"allerregular"; font-size:18px; color:<%=colorCode%>; font-weight:bold; margin:10px 0px 0px 0px;text-shadow: 0px 1px 1px #8F8F8F;}
.rp_header .line{width:663px; height:2px; background-color:#b3b3b3; margin:20px 0px 0px 10px;}

.early_death_header{height: 28px;width: 200px;border-radius: 30px;background-color: <%=colorCodeLeft%>;
position: relative;top: -14px;left: 30px;}
.early_death_header p{font-family:"allerregular"; font-size:15px; color:#3a3a3a; margin:6px 0px 0px 12px;text-shadow: 0px 1px 1px #8F8F8F;}

.r_p{width:792px; /* height:210px; */ border-top:1px solid #dbdbdb; border-bottom:1px solid #dbdbdb;  margin:30px 0px 0px 0px;background-color: #FFF;}
.early_death_header .icon_bg{width:50px; height:50px; border:1px solid <%=colorCodeLeft%>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/resources/images/early_death_gray.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

.early_death_header .icon_bg2{width:50px; height:50px; border:1px solid <%=colorCodeLeft%>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/resources/images/disabilities_gray.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

.early_death_header .icon_bg3{width:50px; height:50px; border:1px solid <%=colorCodeLeft%>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/resources/images/health_setback_gray.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

.early_death_header .icon_bg4{width:50px; height:50px; border:1px solid <%=colorCodeLeft%>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/resources/images/Personal-Accident.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

.early_death_header .icon_bg5{width:50px; height:50px; border:1px solid <%=colorCodeLeft%>; margin:-12px 10px 0px 0px; border-radius:50px; background-color: #FFF; background-image:url(${pageContext.request.contextPath}/resources/images/critical-illness.png);background-size: 35px 35px;background-repeat: no-repeat;background-position: center;}

/**** Existing ****/
.existing_header{height: 28px;width: 510px;border-radius: 30px;background-color: <%=colorCode%>;position: relative;top: -14px;left:90px;}
.existing_header .existing{margin: 1px 0px 0px 20px;}
.existing_header .existing p{font-family: "allerregular";font-size: 15px;color: #000;display: inline-block;margin: 5px 0px 0px 6px;}
.existing_header .existing .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;height: 20px;width: 20px;margin-left: 10px;display: inline-block;margin: 3px 0px 0px 0px;}
.existing_header .existing .money{font-family: "allerregular";font-size: 20px;color: #fff;border-bottom: 2px dashed <%=colorCodeLeft%>;margin: 2px 0px 0px 0px; font-weight:bold;}

/**** Required ****/

.existing_header .required{margin: 1px 20px 0px 0px;}
.existing_header .required p{font-family: "allerregular";font-size: 15px;color: #000;display: inline-block;margin: 5px 0px 0px 6px;}
.existing_header .required .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;height: 20px;width: 20px;margin-left: 10px;display: inline-block;margin: 3px 0px 0px 0px;}
.existing_header .required .money{font-family: "allerregular";font-size: 20px;color: #fff;border-bottom: 2px dashed <%=colorCodeLeft%>;margin: 2px 0px 0px 0px; font-weight:bold;}


/**** suggestion **
.suggestion{margin: 20px 0px 0px 0px;}
.suggestion .sugg_heading{font-family: "allerregular";font-size: 15px;color: <%=colorCode%>; margin: 3px 0px 0px 0px;}
.suggestion p{font-family: "allerregular";font-size: 15px;color: #000;display: inline-block;margin: 3px 0px 0px 3px;}
.suggestion .money{font-family: "allerregular";font-size: 24px;color: <%=colorCode%>;border-bottom: 2px dashed <%=colorCodeLeft%>; margin: -3px 0px 0px 0px;font-weight: bold;}
.suggestion .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px;}

*** sug_product ***
.sug_product{margin:80px 0px 0px 0px;}
.sug_product  p{font-family: "allerregular";font-size: 14px;color: #3A3A3A;font-weight: bold;display: inline-block;margin: 0px 0px 0px 0px;}

*************************** prod1**************************
.sug_product .prod1{margin: 35px 0px 0px -150px; width:260px; display:inline-block;}
.sug_product .prod1 .chkbx{width: 15px;height: 15px;border: 1px solid #666;}
.sug_product .prod1 .prd_name{width: 240px;height: 25px;background-color: #3a3a3a;margin: -4px 0px 0px 2px;line-height: 25px;}
.sug_product .prod1 .prd_name p{font-family: "allerregular";font-size: 12px;color: #fff;font-weight:normal !important;display: inline-block;margin: 0px 0px 0px 5px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .prd_name .grn_patch{width: 110px;height: 40px;background-color: #;background-color: <%=colorCodeLeft%>;position: relative;left: 125px;top: -33px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .prd_name .grn_patch .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;
height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px; margin:10px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .prd_name .grn_patch .money{font-family: "allerregular";font-size: 15px;color: #FFF;border-bottom: 2px dashed #3a3a3a;margin: 6px 0px 0px 0px;font-weight: bold;}

**** Approved Amt *******
----------------------------------------------------
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt{margin: 30px 0px 0px -245px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt p{font-family:"allerregular" !important; font-size:10px !important; color:#3a3a3a !important;margin: 0px 0px 0px -73px; font-weight:normal !important;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:25px 0px 0px 0px; background-size: 8px 12px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>; margin-top:29px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .bottom_left{display:inline-block;}

------------------------------------------------------
#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date{margin: -35px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 25px;font-weight:normal !important;}

#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date .chkbx{width:15px; height:15px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

#er_planning  .risk_planning .r_p .sug_product .prod1 .bottom_right{display:inline-block;}

/**** suggestion new  ****/
.suggestion{margin: 20px 0px 0px 0px;}
.suggestion .sugg_heading{font-family: "allerregular";font-size: 15px;color: <%=colorCode%>; margin: 3px 0px 0px 0px;}
.suggestion p{font-family: "allerregular";font-size: 15px;color: #000;display: inline-block;margin: 3px 0px 0px 3px;}
.suggestion .money{font-family: "allerregular";font-size: 24px;color: <%=colorCode%>;border-bottom: 2px dashed <%=colorCodeLeft%>; margin: -3px 0px 0px 0px;font-weight: bold;}
.suggestion .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px;}

/**** sug_product new ****/
.sug_product{margin:80px 0px 0px 0px;}
.sug_product  p{font-family: "allerregular";font-size: 14px;color: #3A3A3A;font-weight: bold;display: inline-block;margin: 0px 0px 0px 0px;}


/**************************** prod1 New****************************/
.sug_product .prod1{margin: 35px 0px 0px 0px; width:260px;}
.sug_product .prod1 .chkbx{width: 15px;height: 15px;border: 1px solid #666;}
.sug_product .prod1 .prd_name{width: 240px;height: 25px;background-color: #3a3a3a;margin: -4px 0px 0px 2px;line-height: 25px;}
.sug_product .prod1 .prd_name p{font-family: "allerregular";font-size: 12px;color: #fff;font-weight:normal !important;display: inline-block;margin: 0px 0px 0px 5px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .prd_name .grn_patch{width: 110px;height: 40px;background-color: #;background-color: <%=colorCodeLeft%>;position: relative;left: 125px;top: -33px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .prd_name .grn_patch .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;
height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px; margin:10px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .prd_name .grn_patch .money{font-family: "allerregular";font-size: 15px;color: #FFF;border-bottom: 2px dashed #3a3a3a;margin: 6px 0px 0px 0px;font-weight: bold;}

/****** Approved Amt ********/
/*--------------------------------------------------------*/
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt{margin: 30px 0px 0px -245px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt p{font-family:"allerregular" !important; font-size:10px !important; color:#3a3a3a !important;margin: 0px 0px 0px -73px; font-weight:normal !important;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:25px 0px 0px 0px; background-size: 8px 12px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>; margin-top:29px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .bottom_left{display:inline-block;}

/*--------------------------------------------------------*/
#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date{margin: -38px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 25px;font-weight:normal !important;}

#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date .chkbx{width:15px; height:15px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
#er_planning  .risk_planning .r_p .sug_product .prod1 .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

#er_planning  .risk_planning .r_p .sug_product .prod1 .bottom_right{display:inline-block;}
.sug_prd{position: relative;top: 0px;left: 0px;}


/**************************** prod2*************************
#er_planning  .risk_planning .r_p .sug_product .prod2{margin: 20px 0px 0px 0px; width:260px; display:inline-block;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .chkbx{width: 15px;height: 15px;border: 1px solid #666;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .prd_name{width: 240px;height: 25px;background-color: #3a3a3a;margin: -4px 0px 0px 2px;line-height: 25px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .prd_name p{font-family: "allerregular";font-size: 12px;color: #fff;font-weight:normal !important;display: inline-block;margin: 0px 0px 0px 5px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .prd_name .grn_patch{width: 110px;height: 40px;background-color: #;background-color: <%=colorCodeLeft%>;position: relative;left: 125px;top: -33px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .prd_name .grn_patch .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;
height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px; margin:10px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .prd_name .grn_patch .money{font-family: "allerregular";font-size: 15px;color: #FFF;border-bottom: 2px dashed #3a3a3a;margin: 6px 0px 0px 0px;font-weight: bold;}

***** Approved Amt *******
--------------------------------------------------------
#er_planning  .risk_planning .r_p .sug_product .prod2 .app_amt{margin: 30px 0px 0px -245px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .app_amt p{font-family:"allerregular" !important; font-size:10px !important; color:#3a3a3a !important;margin: 0px 0px 0px -73px; font-weight:normal !important;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .app_amt .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:20px 0px 0px 0px; background-size: 8px 12px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>; margin-top:29px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .bottom_left{display:inline-block;}

-----------------------------------------------------
#er_planning  .risk_planning .r_p .sug_product .prod2 .exec_date{margin: 30px 50px 0px 0px; margin: 15px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 25px;font-weight:normal !important;}

#er_planning  .risk_planning .r_p .sug_product .prod2 .exec_date .chkbx{width:15px; height:15px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
#er_planning  .risk_planning .r_p .sug_product .prod2 .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

#er_planning  .risk_planning .r_p .sug_product .prod2 .bottom_right{display:inline-block;}
*************************** prod3***************************
#er_planning  .risk_planning .r_p .sug_product .prod3{margin: 20px 0px 0px 0px; width:260px;display:inline-block;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .chkbx{width: 15px;height: 15px;border: 1px solid #666;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .prd_name{width: 240px;height: 25px;background-color: #3a3a3a;margin: -4px 0px 0px 2px;line-height: 25px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .prd_name p{font-family: "allerregular";font-size: 12px;color: #fff;font-weight:normal !important;display: inline-block;margin: 0px 0px 0px 5px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .prd_name .grn_patch{width: 110px;height: 40px;background-color: #;background-color: <%=colorCodeLeft%>;position: relative;left: 125px;top: -33px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .prd_name .grn_patch .rupee{background: url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center;
height: 20px;width: 20px;margin-left: 0px;display: inline-block;background-size: 8px 13px; margin:10px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .prd_name .grn_patch .money{font-family: "allerregular";font-size: 15px;color: #FFF;border-bottom: 2px dashed #3a3a3a;margin: 6px 0px 0px 0px;font-weight: bold;}

***** Approved Amt *******
-------------------------------------------------------
#er_planning  .risk_planning .r_p .sug_product .prod3 .app_amt{margin: 30px 0px 0px -245px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .app_amt p{font-family:"allerregular" !important; font-size:10px !important; color:#3a3a3a !important;margin: 0px 0px 0px -73px; font-weight:normal !important;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .app_amt .rupee{background:url(${pageContext.request.contextPath}/resources/images/rupee_thumb.png) no-repeat center center; height:20px; width:20px; margin-left:10px; display: inline-block; margin:20px 0px 0px 0px; background-size: 8px 12px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .app_amt .money{font-family:"allerregular"; font-size:15px; color:<%=colorCode%>; border-bottom:1px dashed <%=colorCodeLeft%>; margin-top:29px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .bottom_left{display:inline-block;}

--------------------------------------------------------
#er_planning  .risk_planning .r_p .sug_product .prod3 .exec_date{margin: 30px 50px 0px 0px; margin: 15px 0px 0px 0px;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .exec_date p{font-family:"allerregular"; font-size:10px; color:#3a3a3a;margin: 0px 0px 0px 25px;font-weight:normal !important;}

#er_planning  .risk_planning .r_p .sug_product .prod3 .exec_date .chkbx{width:15px; height:15px; border:1px solid #666; display:inline-block; font-family:"allerregular"; font-size:10px; color:#c4c4c4; text-align:center;}
#er_planning  .risk_planning .r_p .sug_product .prod3 .exec_date .chkbx_grp{margin:20px 0px 0px 7px;}

#er_planning  .risk_planning .r_p .sug_product .prod3 .bottom_right{display:inline-block;}


/******************** RISK PLANNING END **************************/


/***Goals My Dreams Ends***/
</style>
<div class="wrapper4 clearfix">
  <div class="header4 clearfix">
    <div class="desc_heading fl">
   <%--    <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div> --%>
      <h2 class="head_txt2">${ContactDetails.name}</h2>
    </div>
    <h1 class="page_heading fr">Emergency & Risk Planning</h1>
    <!--div class="icon"></div-->
  </div>
  <div class="content" id="er_planning">
  <div class="description"><p>DESCRIPTION</p><span>To tide over emergencies like loss of job or loss in business or sudden health set backs or natural calamities a sum <br>&nbsp;&nbsp;equivalent to 6 months expenses have to be maintained as emergency funds.</span></div>
  
  <div class="emergency_plan">
  	<div class="ep_header fl">
    	<p class="fl">Emergency Planning</p><div class="line fr"></div>
    </div>
    <c:set var="totalCounterOneTime" value="${1}"/>
    <c:set var="totalCounterSIP" value="${1}"/>
    <div class="onetime fl">
    	<div class="onetime_header"><p>One Time</p></div>
        <div class="amount"><p class="fl">Amount :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyPlanningOneTimeAmt}/-</span></div>
        <br><br><br>
        <div class="onetime_line"></div>
        <div class="sug_inv"><p>Suggested Investment</p></div>
        <c:forEach var="emergencyProductList" items="${emergencyPlanningDataList}">
        <div class="product1 fl"><div class="chkbx fl"></div><p class="fl">${emergencyProductList.productName} :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyProductList.lumpSumAmt}/-</span></div>
        <c:set var="totalCounterOneTime" value="${totalCounterOneTime+1}"/>
        
        </c:forEach>
        <div class="bottom_left fl">
        <div class="app_amt fl"><p>Approved Amount</p><span class="rupee fl">    </span><span class="money fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
        </div>
        
        <div class="bottom_left fr">
        <div class="exec_date fl"><p class="fl">Execution Date</p><div class="chkbx_grp"><div class="chkbx">D</div><div class="chkbx">D</div><div class="chkbx">M</div><div class="chkbx">M</div><div class="chkbx">Y</div><div class="chkbx">Y</div></div>
        </div>        
    </div>
    
    
    </div>
    <div class="shadow_small">&nbsp;</div>
    
    <div class="sip fr">
    	<div class="sip_header"><p>SIP (MONTHLY)</p></div>
        <div class="amount"><p class="fl">Amount :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyPlanningSIPMonthlyAmt}/-</span></div>
        <br><br><br>
        <div class="sip_line"></div>
        <div class="sug_inv"><p>Suggested Investment</p></div>
        <c:forEach var="emergencyProductList" items="${emergencyPlanningDataList}">
        <div class="product1 fl"><div class="chkbx fl"></div><p class="fl">${emergencyProductList.productName} :-</p><span class="rupee fl">    </span><span class="money fl">${emergencyProductList.sipAmt}/-</span></div>
        <c:set var="totalCounterSIP" value="${totalCounterSIP+1}"/>
        </c:forEach>
        <div class="bottom_left fl">
        <div class="app_amt fl"><p>Approved Amount</p><span class="rupee fl">    </span><span class="money fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
        </div>
        
        <div class="bottom_left fr">
        <div class="exec_date fl"><p class="fl">Execution Date</p><div class="chkbx_grp"><div class="chkbx">D</div><div class="chkbx">D</div><div class="chkbx">M</div><div class="chkbx">M</div><div class="chkbx">Y</div><div class="chkbx">Y</div></div>
        </div>
        
    </div>
        
    </div>
    <div class="shadow_small2">&nbsp;</div>
    
  </div><!-- end of "emergency_plan" --> 
  
  		<%-- <c:if test="${totalCounterOneTime > 10 or  totalCounterSIP > 10}">
        <div class="footer clearfix"> 
	    <div class="fr page_no">(<span class="no">${7}</span>)</div>
	  	</div>
        <div style="page-break-before:always"></div>
        <c:set var="totalCounterOneTime" value="1"/>
        <c:set var="totalCounterSIP" value="1"/>
        </c:if> --%>
  
  <div class="footer clearfix fl">
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  </div>
  <div style="page-break-before:always"></div>
  <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
  
  <div class="risk_planning fl">
  	
    <div class="rp_header fl">
    	<p class="fl">Risk Planning</p><div class="line fr"></div>
    </div>
    
    <c:forEach var="riskData" items="${riskPlanningProductDetails}">
     
    <div class="r_p fl">	
        <div class="early_death_header fl"><p class="fl">${riskData.key}</p>
        <c:if test="${riskData.key eq 'Early Death'}">
        <div class="icon_bg fr"></div>
        </c:if>
        <c:if test="${riskData.key eq 'Personal Accident'}">
        <div class="icon_bg4 fr"></div>
        </c:if>
        <c:if test="${riskData.key eq 'Critical Illness'}">
        <div class="icon_bg5 fr"></div>
        </c:if>
        <c:if test="${riskData.key eq 'Health Setback'}">
        <div class="icon_bg3 fr"></div>
        </c:if>
        <c:if test="${riskData.key eq 'Disability'}">
        <div class="icon_bg2 fr"></div>
        </c:if>
        
        </div>
        <div class="existing_header fl">
            <div class="existing fl">
	            <p class="fl">Existing :</p><span class="rupee fl"></span><span class="money fl">${riskData.value.existingCover}</span><!-- <p class="fl">Cr</p> -->
            </div>
            
            <div class="required fr">
	            <p class="fl">Required :</p><span class="rupee fl"></span><span class="money fl">${riskData.value.requiredCover}</span><!-- <p class="fl">Cr</p> -->
            </div>
            
        <!--div class="icon_bg fl"></div--></div>
        
        <div class="suggestion fl">
 	   	<span class="sugg_heading fl">Suggestion :</span><p class="fl">Take a Term Cover For</p><span class="rupee fl"></span><span class="money fl">
 	   	<c:if test="${(riskData.value.requiredCover  - riskData.value.existingCover) gt 0.0}">
 	   	<fmt:formatNumber type="number" value = "${riskData.value.requiredCover - riskData.value.existingCover}" />
 	   	</c:if>
 	   	<c:if test="${(riskData.value.requiredCover  - riskData.value.existingCover) <= 0.0}">
 	   	0.0
 	   	</c:if>
 	   	</span><p class="fl"></p>
        </div>
        
        <div class="sug_product">
        <c:set var="counter" value="${1}"/>
           <c:forEach var="product" items="${riskData.value.clientActionPlanList}"> 
           
            <c:if test="${not empty product.productName}">
               <c:if test="${counter eq 1 }">
               <div class="sug_prd"><p>Suggested Products</p></div>
               </c:if>
            <div class="prod1 fl">
            	<div class="chkbx fl"></div>
                <div class="prd_name fl">
                	<p>${product.productName}</p>
                    <div class="grn_patch">
                    	<span class="rupee fl"></span>
                        <span class="money fl">${product.insuranceAmount}/-</span>
                    </div>
                </div>
                <div class="bottom_left fl">
        			<div class="app_amt fl"><p>Approved Amount</p><span class="rupee fl">    </span><span class="money fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
        		</div>
                <div class="bottom_left fr">
        			<div class="exec_date fl"><p class="fl">Execution Date</p><div class="chkbx_grp"><div class="chkbx">D</div><div class="chkbx">D</div><div class="chkbx">M</div><div class="chkbx">M</div><div class="chkbx">Y</div><div class="chkbx">Y</div></div>
        			</div>        
    			</div>
            </div>
            </c:if>
          <c:set var="counter" value="${counter+1}"/>
        <c:set var="totalCounterOneTime" value="${totalCounterOneTime + 1}"/> 
        <%-- 
        commentd bcoz css problem
        <c:if test="${totalCounterOneTime > 2100 }">
        <div class="footer clearfix" style="margin-top: 0px;"> 
	    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
	  	</div>
        <div style="page-break-before:always"></div>
        <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
        <c:set var="totalCounterOneTime" value="1"/>
        </c:if> 
         --%>
         </c:forEach>  
        </div>
	</div><!-- end of "r_p" -->
    <div class="shadow_big1 fl">&nbsp;</div>
     <c:set var="totalCounterOneTime" value="${totalCounterOneTime + 1}"/> 
        <%-- 
        commentd bcoz css problem
        <c:if test="${totalCounterOneTime > 2100 }">
        <div class="footer clearfix" style="margin-top: 0px;"> 
	    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
	  	</div>
        <div style="page-break-before:always"></div>
        <c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
        
        <c:set var="totalCounterOneTime" value="1"/>
        </c:if> 
         --%>   
        
    </c:forEach>
    
  </div><!-- End of "risk_planning" -->

  </div><!-- End of "content" -->  
  <c:if test="${totalCounterOneTime != 1 }">
  <div class="footer clearfix fl">
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  </div>
  </c:if>
</div>
<c:if test="${totalCounterOneTime != 1 }">
<div style="page-break-before:always"></div>
<c:set var="pageNumber" value="${pageNumber+1 }" scope="request" />
</c:if>
