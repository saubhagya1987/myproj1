<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="application/x-www-form-urlencoded" />
<title>Analysis Report</title>
<style>
/***Custom Fonts Strats***/
@font-face {
 font-family: 'open_sanslight';
 src: url('${pageContext.request.contextPath}/resources/css/fonts/opensans-light-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/fonts/opensans-light-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-light-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-light-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-light-webfont.svg#open_sanslight') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
font-family:"Aller Bold";
src:url("${pageContext.request.contextPath}/resources/css/fonts/Aller_Bd.eot?") format("eot"), url("${pageContext.request.contextPath}/resources/css/fonts/Aller_Bd.woff") format("woff"), url("${pageContext.request.contextPath}/resources/css/fonts/Aller_Bd.ttf") format("truetype"), url("${pageContext.request.contextPath}/resources/css/fonts/Aller_Bd.svg#Aller-Bold") format("svg");
font-weight:normal;
font-style:normal;
}
 @font-face {
 font-family: 'allerregular';
 src: url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.svg#allerregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'alleritalic';
 src: url('${pageContext.request.contextPath}/resources/css/fonts/aller_it-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/fonts/aller_it-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_it-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_it-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_it-webfont.svg#alleritalic') format('svg');
 font-weight: normal;
 font-style: normal;
}
 @font-face {
 font-family: 'open_sansregular';
 src: url('${pageContext.request.contextPath}/resources/css/fonts/opensans-regular-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/fonts/opensans-regular-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-regular-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-regular-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-regular-webfont.svg#open_sansregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'open_sansbold';
 src: url('${pageContext.request.contextPath}/resources/css/fonts/opensans-bold-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/fonts/opensans-bold-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-bold-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-bold-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-bold-webfont.svg#open_sansbold') format('svg');
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
.wrapper { width:792px; margin:0 auto; height:1124px; color:#3a3a3a; font-family: 'allerregular'; }
.header { height:65px; background:#1d87bd url(${pageContext.request.contextPath}/resources/images/header_pattern.png) no-repeat center right }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { height:1041px }
.footer { height:18px; background:#c0c0c0 }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: #1D87BD; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
.theme_color { color: #1D87BD; }
/***Common Css Ends***/
/***Analysis Report Starts***/
.head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 47px; text-align: center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; }
#analysis_report_content .ifa_details { height:310px; padding:0 35px; }
#analysis_report_content .ifa_details .add_details { margin:44px 0 0; width:48% }
#analysis_report_content .ifa_details .name { font-family: "Aller Bold"; font-size: 23px; margin: 0 0 3px 0; }
#analysis_report_content .ifa_details .address { width:300px; font-size: 17px; line-height: 21px; }
#analysis_report_content .ifa_details .logo { margin:24px 0 0; width:48%; text-align: right }
#analysis_report_content .client_details { height:380px;}
#analysis_report_content .client_details .name { color: #1D87BD; font-family: "Aller Bold"; font-size: 32px; margin: 0 0 0 32px; padding: 15px 0 0; }
#analysis_report_content .client_details .category { height:116px; width:116px; border:2px solid #1D87BD; -moz-border-radius: 69px; -webkit-border-radius: 69px; border-radius: 69px;-moz-box-shadow: 0px 0px 4px 2px #9F9F9F;-webkit-box-shadow: 0px 0px 4px 2px #9F9F9F;box-shadow: 0px 0px 4px 2px #9F9F9F; }
#analysis_report_content .client_details .grid_adjuster { margin-left:-30px }
#analysis_report_content .client_details .category_ul { margin:50px 0 0 }
#analysis_report_content .client_details .category_ul li { margin-left:70px }
#analysis_report_content .client_details .category_ul .cat_name { font-family: "Aller Bold"; font-size: 15px; width: 100%; text-align: center; margin: 27px 0 0;height: 19px; }
#analysis_report_content .client_details .category_ul .value{margin: 20px 0 0;}
#analysis_report_content .client_details .category_ul .value span{border-bottom: 1px dashed #1D87BD;padding: 0 10px;font-family: "Aller Bold"; font-size: 22px;}
#analysis_report_content .client_details .category_ul .first .category{ background:url(${pageContext.request.contextPath}/resources/images/Goals.png) no-repeat center center #fff}
#analysis_report_content .client_details .category_ul .second .category{ background:url(${pageContext.request.contextPath}/resources/images/Goals_Value.png) no-repeat center center #fff}
#analysis_report_content .client_details .category_ul .third .category{ background: url(${pageContext.request.contextPath}/resources/images/asset-investment.png) no-repeat center center #fff}
#analysis_report_content .client_details .category_ul .fourth .category{ background: url(${pageContext.request.contextPath}/resources/images/Goals_Completed.png) no-repeat center center #fff}
#analysis_report_content .disclaimer{height: 351px; padding:0 20px}
#analysis_report_content .disclaimer .heading{ color:#1D87BD;font-family: "Aller Bold"; font-size: 15px; margin:0 0 24px}
#analysis_report_content .disclaimer .txt{font-size: 15px;height: 265px; line-height:19px;text-align: justify;}
#analysis_report_content .disclaimer .btm_logo{ background:url(${pageContext.request.contextPath}/resources/images/btm_logo.png) no-repeat center center;width:194px;height:35px}
/***Analysis Report Ends***/
</style>
</head>

<body>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt1">Steps to financial freedom </h2>
    </div>
    <h1 class="page_heading fr">Analysis Report</h1>
  </div>
  <div class="content" id="analysis_report_content">
    <div class="box1 ifa_details clearfix">
      <div class="add_details fl">
        <h4 class="name">${adviserGoals.ownerName}</h4>
        <p class="address">${adviserGoals.address}</p>
      </div>
      <div class="fr logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_logo.png"/> </div>
    </div>
    <div class="box2 client_details">
      <h4 class="name"><span class="c_name">${adviserGoals.name}</span> :</h4>
      <div class="grid_adjuster">
        <ul class="reset clearfix category_ul">
          <li class="first fl">
            <div class="category"></div>
            <div class="cat_name">No. of Goals</div>
            <div class="theme_color value centerAll"><span>${adviserGoals.noOfGoal}</span></div>
          </li>
          <li class="second fl">
            <div class="category"></div>
            <div class="cat_name">Total Goal Value</div>
             <div class="theme_color value centerAll"><span>${adviserGoals.totalGoalValue}</span>lacs</div>
          </li>
          <li class="third fl">
            <div class="category"></div>
            <div class="cat_name">Allocated Assets<br/> Value</div>
             <div class="theme_color value centerAll"><span>${adviserGoals.allocatedTotalAsset}</span>lacs</div>
          </li>
          <li class="fourth fl">
            <div class="category"></div>
            <div class="cat_name">Goals Completed</div>
             <div class="theme_color value centerAll"><span>${adviserGoals.goalsCompleted}</span></div>
          </li>
        </ul>
      </div>
    </div>
    <div class="box3 disclaimer">
	    <h4 class="heading">Disclaimer</h4>
		<p class="txt">This document is prepared on a proprietary algorithm-based technological Platform owned and maintained by FIINFRA. This document is based entirely on the information provided by you or your Distributor. Despite our best efforts, due care and precautions, there may be some variables used in generation of this document which have not been unaccounted for, or miscalculated, by the Platform. FIINFRA cannot and shall not be held liable for any pecuniary or non-pecuniary harm caused to you, your Distributor or any third party if the contents of this document are relied upon for any decision, or represented or disseminated further, whether correctly or incorrectly. The contents of this document do not qualify as investment advice and/or financial planning, or any variant thereof, under India's applicable regulatory framework, including the Securities and Exchange Board of India (Investment Adviser) Regulations, 2013, as amended from time to time, and FIINFRA does not assure any financial goals to be attained, any profits to be made, or losses to be avoided, whether directly, indirectly, incidentally or consequentially, by you or your Distributor or any third party, by relying upon this document, or any content therein. Investments are subject to a variety of risks, uncertainties and other factors that could cause actual results to differ materially from expectations as expressed or implied under this document.</p>
	  	<div class="btm_logo fr"></div>
	  	<div class="clr"></div>
    </div>
  </div>
  <div class="footer clearfix">
    <div class="fl footer_tagline">True Friends of New Investors</div>
    <div class="fr page_no">(<span class="no">1</span>)</div>
  </div>
</div>
<br/>
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
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox) {
 
    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        slide: function (event, ui) {
            $(ctrlTextBox).text(ui.value);
			
        }
    });
     $(ctrlTextBox).text($(ctrlName).slider("value"));
	
}

/*** Common Function For Value Slider Ends ***/

</script>
<style>
/***Custom Fonts Strats***/
@font-face {
 font-family: 'open_sanslight';
 src: url('${pageContext.request.contextPath}/resources/css/opensans-light-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/opensans-light-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/opensans-light-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/opensans-light-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/fonts/opensans-light-webfont.svg#open_sanslight') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
font-family:"Aller Bold";
src:url("${pageContext.request.contextPath}/resources/css/Aller_Bd.eot?") format("eot"), url("${pageContext.request.contextPath}/resources/css/fonts/Aller_Bd.woff") format("woff"), url("${pageContext.request.contextPath}/resources/css/Aller_Bd.ttf") format("truetype"), url("${pageContext.request.contextPath}/resources/css/fonts/Aller_Bd.svg#Aller-Bold") format("svg");
font-weight:normal;
font-style:normal;
}
 @font-face {
 font-family: 'allerregular';
 src: url('${pageContext.request.contextPath}/resources/css/aller_rg-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/aller_rg-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/fonts/aller_rg-webfont.svg#allerregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'alleritalic';
 src: url('${pageContext.request.contextPath}/resources/css/aller_it-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/aller_it-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/aller_it-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/aller_it-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/aller_it-webfont.svg#alleritalic') format('svg');
 font-weight: normal;
 font-style: normal;
}
 @font-face {
 font-family: 'open_sansregular';
 src: url('${pageContext.request.contextPath}/resources/css/opensans-regular-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/opensans-regular-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/opensans-regular-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/opensans-regular-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/opensans-regular-webfont.svg#open_sansregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'open_sansbold';
 src: url('${pageContext.request.contextPath}/resources/css/opensans-bold-webfont.eot');
 src: url('${pageContext.request.contextPath}/resources/css/opensans-bold-webfont.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/resources/css/opensans-bold-webfont.woff') format('woff'), url('${pageContext.request.contextPath}/resources/css/opensans-bold-webfont.ttf') format('truetype'), url('${pageContext.request.contextPath}/resources/css/opensans-bold-webfont.svg#open_sansbold') format('svg');
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
.wrapper { width:792px; margin:0 auto; height:1124px; color:#3a3a3a; font-family: 'allerregular'; }
.header { height:65px; background:#1d87bd url(${pageContext.request.contextPath}/resources/images/header_pattern.png) no-repeat center right }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { height:1041px }
.footer { height:18px; background:#c0c0c0 }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: #1D87BD; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
/***Common Css Ends***/
/***Goals My Dreams Starts***/
#goals_my_dreams { font-family: "Aller Bold"; }
#goals_my_dreams .box1 { min-height: 622px; }
#goals_my_dreams .goal_ul li { width:254px; margin: 77px 0 0; }
#goals_my_dreams .goal_cat { font-size:12px; margin:0 0 10px 0; text-align:center; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:100%; }
#goals_my_dreams .goal_cat .specific { color:#1d87bd }
#goals_my_dreams .goal_asset_desc .goal_val { width:106px; height:88px; background:#9cbc01; margin:0 15px 0 0; -moz-border-radius: 55px 0 0 55px; -webkit-border-radius: 55px 0 0 55px; border-radius: 55px 0 0 55px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#goals_my_dreams .goal_asset_desc .asset_val { width:106px; height:88px; background:#368ebc; margin:0 0 0 15px; -moz-border-radius:0 55px 55px 0; -webkit-border-radius:0 55px 55px 0; border-radius:0 55px 55px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#goals_my_dreams .goal_asset_desc .goal_val .heading { font-size:10px; text-align:center; margin: 6px 0 0; }
#goals_my_dreams .goal_asset_desc .asset_val .heading { color:#fff; font-size:10px; text-align:center; margin: 6px 0 0; }
#goals_my_dreams .goal_asset_desc .goal_value { font-size: 20px; width: 40px; margin:21px 0 0 23px; text-align: center; border-bottom: 1px dashed; padding: 0 0 1px 0; }
#goals_my_dreams .goal_asset_desc .goal_value:after { content: "lac"; position: absolute; font-size: 12px; top: 3px; right: -18px; }
#goals_my_dreams .goal_asset_desc .goal_value:before { content: ""; background: url(${pageContext.request.contextPath}/resources/images/black_rupee.png) no-repeat center center; width: 8px; height: 11px; top: 4px; left: -10px; display: block; position: absolute; }
#goals_my_dreams .goal_asset_desc .asset_value { font-size: 20px; width: 40px; margin:21px 0 0 44px; text-align: center; border-bottom: 1px dashed; padding: 0 0 1px 0; color:#fff }
#goals_my_dreams .goal_asset_desc .asset_value:after { content: "lac"; position: absolute; font-size: 12px; top: 3px; right: -18px; color:#fff }
#goals_my_dreams .goal_asset_desc .asset_value:before { content: ""; background: url(${pageContext.request.contextPath}/resources/images/white_ruppe.png) no-repeat center center; width: 8px; height: 11px; top: 4px; left: -11px; display: block; position: absolute; }
#goals_my_dreams .goal_detal .goal_logo_year { height:69px; width:69px; background: #3A3A3A; position: absolute; margin: 0; top: 9px; left: 91px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#goals_my_dreams .goal_detal .goal_logo_year .year { text-align: center; color: #FFF; margin: 47px 0 0; font-size: 13px; }
#goals_my_dreams .goal_detal .goal_logo_year.travel_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/travel_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.car_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/car_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.edu_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/education_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.business_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/business_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.property_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/property_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .goal_logo_year.spcial_logo { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/special_goal.png) no-repeat center 7px }
#goals_my_dreams .goal_detal .slider_parent { width: 174px; margin: 4px auto 0; }
#goals_my_dreams .goal_detal .goal_slider { /*background: url(${pageContext.request.contextPath}/resources/images/slider_bg.png) no-repeat center center;*/ width: 141px; height: 20px; border: none; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; position:relative }
#goals_my_dreams .goal_detal .goal_slider:after { content:""; display:block; width: 157px; height: 20px; position:absolute; background: url(${pageContext.request.contextPath}/resources/images/slider_bg.png) no-repeat center center; left: -14px; }
#goals_my_dreams .goal_detal .ui-slider .ui-slider-handle {
background url(../images/slider_button.png) no-repeat; height: 8px; width: 8px; border: none; -moz-box-shadow: 0px 1px 2px 0px #000; -webkit-box-shadow: 0px 1px 2px 0px #000; box-shadow: 0px 1px 2px 0px #000; top: 7px !important; }
#goals_my_dreams .goal_detal .goal_slider_value { font-size:12px; border:none; font-family: "Aller Bold"; width: 22px; position:relative; margin:4px 0 0 10px; }
#goals_my_dreams .goal_detal .goal_slider_value:after { content: "%"; display: block; position: absolute; color: #3A3A3A; top: 0; right:-13px; font-size: 12px; }
#goals_my_dreams .goal_detal .result_stat { border:3px solid #3a3a3a; -moz-border-radius: 19px; -webkit-border-radius: 19px; border-radius: 19px; width: 87%; margin: 0 auto; height:94px }
#goals_my_dreams .goal_detal .result_stat .achievable_txt { text-align: center; font-size: 13px; line-height: 13px; margin: 9px 0 0; }
#goals_my_dreams .goal_detal .result_stat .paraTxt { margin:2px 0 2px 0; font-size:11px }
#goals_my_dreams .goal_detal .result_stat .invst_txt { font-size:8px }
#goals_my_dreams .goal_detal .result_stat .reg_invesment { width:49%; border-right:1px solid #bddcec; height: 60px; }
#goals_my_dreams .goal_detal .result_stat .one_time_invesment { width:50%; height: 60px; }
#goals_my_dreams .goal_detal .result_stat .amount { font-size:12px; margin:15px 0 3px 0; position:relative }
#goals_my_dreams .goal_detal .result_stat .amount .val:before { content: ""; display: block; position: absolute; background: url(${pageContext.request.contextPath}/resources/images/black_rupee.png) no-repeat center center; width: 8px; height: 11px; left: -10px; top: 3px; }
#goals_my_dreams .goal_detal .result_stat .thumb_status { width:56px; border-top:1px solid #3a3a3a; -moz-border-radius: 12px 0 0 0; -webkit-border-radius:12px 0 0 0; border-radius: 12px 0 0 0; }
#goals_my_dreams .goal_detal .result_stat .txt_status { background:#f0f0f0; border-top:1px solid #3a3a3a; border-left:1px solid #3a3a3a; width:163px; font-size:10px; line-height:18px; color:#000; -moz-border-radius: 0 0 18px 0; -webkit-border-radius: 0 0 18px 0; border-radius: 0 0 18px 0; }
#goals_my_dreams .goal_detal .result_stat .txt_status.achievable_txt_status { width: 100%; border-left: 0; -moz-border-radius: 0 0 18px 18px; -webkit-border-radius: 0 0 18px 18px; border-radius: 0 0 18px 18px; }
#goals_my_dreams .goal_detal .result_stat .achievable_yes_thumb { background:url(${pageContext.request.contextPath}/resources/images/achivable_yes_thumb.png) no-repeat center center; width:59px; height:49px; margin:12px auto 14px; }
#goals_my_dreams .goal_detal .result_stat .thumb_status.achievable { background:url(${pageContext.request.contextPath}/resources/images/thumb_up.png) no-repeat center center; height: 18px; }
#goals_my_dreams .goal_detal .result_stat .thumb_status.partially_achievable { background:url(${pageContext.request.contextPath}/resources/images/partial_achivable.png) no-repeat center center; height: 18px; }
#goals_my_dreams .goal_detal .result_stat .thumb_status.not_achievable { background:url(${pageContext.request.contextPath}/resources/images/not_achivable.png) no-repeat center center; height:18px }
#goals_my_dreams .final_summary .container { background:#f4f4f4; border:1px solid #368ebc; min-height:241px; width:190px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; -moz-box-shadow: 0px 2px 0px 0px #999; -webkit-box-shadow: 0px 2px 0px 0px #999; box-shadow: 0px 2px 0px 0px #999; padding:10px }
#goals_my_dreams .final_summary > li { margin: 0 26px 0; }
#goals_my_dreams .report { margin: 137px 0 0; }
.theme_color { color:#1D87BD }
#goals_my_dreams .report .second p.txt1 { line-height: 30px; margin: 54px 0 0; text-align: center; font-size: 12px; }
#goals_my_dreams .report .third p { line-height: 30px; text-align: center; font-size: 12px; }
#goals_my_dreams .report .third p.txt1 { margin:38px 0 0; line-height: 18px; }
#goals_my_dreams .report .third p.txt2 { line-height: 14px; text-align: left; margin: 11px 0 0; }
#goals_my_dreams .report .third .asset_combo li { margin: 3px 0; list-style: disc; }
#goals_my_dreams .report .third .asset_combo { margin: 3px 0 0 14px; list-style: disc; }
#goals_my_dreams .report .first .money_flow { font-size: 12px; margin: 41px 0 0; text-align: center; }
#goals_my_dreams .report .first .money_flow li { line-height:20px; }
#goals_my_dreams .report .first .money_flow li .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/resources/images/black_rupee.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
#goals_my_dreams .report .first .investment .heading { background: #343434; border-top: 1px solid #AEAEAE; border-bottom: 1px solid #AEAEAE; margin: 0 0 0 -10px; width: 210px; color: #FFF; font-size: 16px; text-align: center; height: 22px; line-height: 21px; }
#goals_my_dreams .report .first .running { width:50%; text-align:left; font-size:12px }
#goals_my_dreams .report .first .reqiured { width:50%; text-align:right; font-size:12px }
#goals_my_dreams .report .first .investment p { line-height: 24px; }
#goals_my_dreams .report .first .investment { border-bottom: 1px solid #898989; -moz-box-shadow:0px 2px 5px 1px #A8A8A8; -webkit- box-shadow:0px 2px 5px 1px #A8A8A8;
box-shadow:0px 2px 5px 1px #A8A8A8; width: 189px; margin: 20px 0 0 -10px; padding: 0 10px; }
/***Goals My Dreams Ends***/
</style>

<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div>
      <h2 class="head_txt2">${adviserGoals.name}</h2>
    </div>
    <h1 class="page_heading fr">Goals - My Dreams</h1>
  </div>
		
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
        
        <c:forEach items="${goalDetails}" var="goalDetail"  varStatus="iCounter"> 
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
             		<c:set var="thumbStatusText" value="Can Achieve" />
             	</c:when>
             	<c:when test="${goalCompletedPercent gt 81}">
             		<c:set var="thumbStatus" value="partially_achievable" />
             		<c:set var="thumbStatusText" value="Partially Achieve" />
             	</c:when>
             	<c:when test="${goalCompletedPercent lt 80}">
             		<c:set var="thumbStatus" value="not_achievable" />
             		<c:set var="thumbStatusText" value="Can Not Achieve" />
             	</c:when>
				<c:otherwise></c:otherwise>
            </c:choose>

			<c:set var="goalLogo" value="spcial_logo" />
			<c:choose>
             	<c:when test="${goalDetail.goalTypeName eq 'Car'}">
             		<c:set var="goalLogo" value="car_logo" />             		
             	</c:when>
             	<c:when test="${goalDetail.goalTypeName eq 'Higher Education'}">
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
				<c:otherwise></c:otherwise>
            </c:choose>
            
	 		<li class="fl">			
	            <div class="goal_detal">
	              <h3 class="goal_cat"><span class="main_cat">${goalDetail.goalTypeName }</span> - <span class="specific">${goalDetail.goalName }</span></h3>
	              <div class="goal_asset_desc rel clearfix">
	                <div class="goal_val fl">
	                  <h5 class="heading">Goal Value</h5>
	                  <div class="value goal_value rel">${goalDetail.goalAmountPv}</div>
	                </div>
	                <div class="goal_logo_year ${goalLogo}">
	                  <div class="year">${goalDetail.goalEndYear }</div>
	                </div>
	                <div class="asset_val fl">
	                  <h5 class="heading">Asset Value</h5>
	                  <div class="value asset_value rel">${goalDetail.assetValue}</div>
	                </div>
	              </div>
	              <div class="slider_parent clearfix">
	                <div class="goal_slider fl" id="slider_${iCounter.index}"></div>
	                <div class="fr goal_slider_value" id="sliderVal_${iCounter.index}"></div>
	                 <script>
	                	createSlider('#slider_${iCounter.index}',0, 100, 1,'#sliderVal_${iCounter.index}');
	                	$("#sliderVal_${iCounter.index}").text("${goalCompletedPercent}");                	
	                </script>
	              </div>
	              
	              <c:choose>
	              	<c:when test="${goalCompletedPercent eq 100 }">
	              		<div class="result_stat">
			                <div class="achievable_yes_thumb"></div>
			                <div class="quick_status clearfix">
			                  <div class="centerAll txt_status achievable_txt_status">This goal can be achieved with exsting asset</div>
			                </div>
		              </div>
	              	</c:when>
	              	<c:otherwise>
		              	<div class="result_stat">
			                <p class="centerAll paraTxt">Investment Required to Achieve Goal</p>
			                <div class="fl reg_invesment">
			                  <p class="amount centerAll"><span class="val rel">${goalDetail.regularInvestAmt}</span>/-</p>
			                  <p class="centerAll invst_txt">Regular Investment</p>
			                </div>
			                <div class="fr one_time_invesment">
			                  <p class="amount centerAll"><span class="val rel">${goalDetail.lumpsumAmount}</span>/-</p>
			                  <p class="centerAll invst_txt">One time Investment</p>
			                </div>
			                <div class="clr">&nbsp;</div>
			                <div class="quick_status clearfix">                	
			                	
			                  <div class="fl thumb_status ${thumbStatus}"></div>
			                  <div class="fr centerAll txt_status">${thumbStatusText}</div>
			                </div>
		              	</div>
	              	</c:otherwise>
	              </c:choose>
	            </div>
	          </li>          
	   	 </c:forEach>
                   
        </ul>
      </div>
    </div>
  <div class="box2 report">
      <ul class="clearfix reset final_summary">
        <li class="fl first">
          <div class="container">
            <ul class="reset money_flow">
              <li>Your Income - <span class="rs_symbol"></span><span class="val theme_color">${income}</span></li>
              <li>Your Expenses -<span class="rs_symbol"></span> <span class="val theme_color">${expenses}</span></li>
              <li>Your Loan EMI -<span class="rs_symbol"></span> <span class="val theme_color">${loanEMI}</span></li>
              <li>SURPLUS AVAILABLE -<span class="rs_symbol"></span> <span class="val theme_color">${surpluseAvbl}</span></li>
            </ul>
            <div class="investment">
              <h5 class="heading">Investment</h5>
              <div class="fl running">
                <p class="txt">Current</p>
                <p class="amount"><span class="rs_symbol"></span><span class="val">${currentInvestment}</span>/-</p>
              </div>
              <div class="fr reqiured">
                <p class="txt">Required</p>
                <p class="amount"><span class="rs_symbol"></span><span class="val">${requiredInvestment}</span>/-</p>
              </div>
              <div class="clr"></div>
            </div>
          </div>
        </li>
        <li class="fl second">
          <div class="container">
            <p class="txt1">DREAMS can become <span class="theme_color">REALITY</span> when
              You can improve <span class="theme_color">SURPLUS</span> And <span class="theme_color">INVEST</span> properly
              And <span class="theme_color">REBALANCE</span> regularly</p>
          </div>
        </li>
        <li class="fl third">
          <div class="container ">
            <p class="txt1">Invest in different assets in 
              proportions suitable to your goal 
              and your risk tolerance</p>
            <p class="txt2"> <span class="theme_color">ASSET ALLOCATION</span> can be done in combination of</p>
            <ul class="reset paraTxt asset_combo">
              <li class="theme_color">Fixed deposits</li>
              <li class="theme_color">Shares</li>
              <li class="theme_color">Mutual Funds</li>
              <li class="theme_color">Gold</li>
              <li class="theme_color">Property</li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
  </div>
  <div class="footer clearfix">
    <div class="fl footer_tagline">True Friends of New Investors</div>
    <div class="fr page_no">(<span class="no">2</span>)</div>
  </div>
</div>
</body>
</html>
