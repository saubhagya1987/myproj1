<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>


<title>Analysis Report</title>
<style>
/***Custom ${pageContext.request.contextPath}/resources/css/fonts Strats***/
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

/***Custom fonts Ends***/
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
#analysis_report_content .client_details .category_ul .cat_name { font-family: "Aller Bold"; font-size: 15px; width: 100%; text-align: center; margin: 27px 0 0; }
#analysis_report_content .client_details .category_ul .first .category{ background:url(${pageContext.request.contextPath}/resources/images/pdf_personal_info.png) no-repeat center center #fff}
#analysis_report_content .client_details .category_ul .second .category{ background:url(${pageContext.request.contextPath}/resources/images/pdf_risk_profile.png) no-repeat center center #fff}
#analysis_report_content .client_details .category_ul .third .category{ background: url(${pageContext.request.contextPath}/resources/images/pdf_current_financial.png) no-repeat center center #fff}
#analysis_report_content .client_details .category_ul .fourth .category{ background: url(${pageContext.request.contextPath}/resources/images/pdf_future_excpectation.png) no-repeat center center #fff}
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
            <div class="cat_name">Personal Information</div>
          </li>
          <li class="second fl">
            <div class="category"></div>
            <div class="cat_name">Risk Profile</div>
          </li>
          <li class="third fl">
            <div class="category"></div>
            <div class="cat_name">Current Financial</div>
          </li>
          <li class="fourth fl">
            <div class="category"></div>
            <div class="cat_name">Future Expectation</div>
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
  <br>
<script>
$(document).ready(function(){

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
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: #1D87BD; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
.theme_color { color: #1D87BD; }
/***Common Css Ends***/
/***Emergency Planning Starts***/
#emergency-planning .emergency_desc { width:255px; height:140px; background: #9CBC01; -moz-border-radius: 109px 0 0 109px; -webkit-border-radius:109px 0 0 109px; border-radius:109px 0 0 109px; -moz-box-shadow: -1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: -1px 2px 2px 0px #6C6C6C; box-shadow: -1px 2px 2px 0px #6C6C6C; }
#emergency-planning .emergency_action { width:255px; height:140px; background: #368EBC; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; }
#emergency-planning .goal_logo_year { height:50px; width:50px; background: #3A3A3A; position: absolute; margin: 0; top:-23px; left:9px; -moz-border-radius: 41px; -webkit-border-radius: 41px; border-radius: 41px; -moz-box-shadow: 0px 0px 0px 4px #FFF; -webkit-box-shadow: 0px 0px 0px 4px #FFF; box-shadow: 0px 0px 0px 4px #FFF; }
#emergency-planning .goal_logo_year.loss_of_job { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/loss_of_job.png) no-repeat center center }
#emergency-planning .goal_logo_year.early_death { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/early_death.png)no-repeat center center }
#emergency-planning .goal_logo_year.health_setback { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/health_setback.png)no-repeat center center }
#emergency-planning .goal_logo_year.disabilities { background:#3A3A3A url(${pageContext.request.contextPath}/resources/images/disabilities.png)no-repeat center center }
#emergency-planning .emergency_category { margin:0 auto 0; width:511px; }
#emergency-planning .fixed {height: 238px; }
#emergency-planning .fixed ul { padding: 55px 0 0 0; }
#emergency-planning .emergency_category .category_name { position: absolute; top: -19px; width: 48%; right: 3px; font-size: 19px; font-family: "Aller Bold"; }
#emergency-planning .emergency_category .emergency_desc .txt { color: #FFF; font-size: 12px; margin:37px 0 0; padding:0 7px 0 19px; line-height: 14px; height: 103px; border-radius: 34px 0 0 72px; overflow: hidden; text-align: left }
#emergency-planning .emergency_category .fund_status { margin: 15px 0 0; font-size:13px; width:229px }
#emergency-planning .emergency_category .fund_status .heading { height:18px }
#emergency-planning .emergency_category .fund_status .value { color:#fff }
#emergency-planning .emergency_category .fund_status .value .rs_symbol { background:url(${pageContext.request.contextPath}/resources/images/white_ruppe.png) no-repeat center center; width:7px; height:11px; display:inline-block; vertical-align: -2px; margin: 0 2px 0 0; }
#emergency-planning .emergency_category .fund_status .available { width:50%; text-align:center }
#emergency-planning .emergency_category .fund_status .additional { width:50%; text-align:center }
#emergency-planning .emergency_category .emergency_action .txt { color: #FFF; font-size: 12px; padding: 0 8px; line-height: 14px; text-align: left; height: 73px; border-radius: 0 11px 80px 0; overflow: hidden; }
#emergency-planning .emergency_category .ui-progressbar { background:#056595; height:14px; border:none; -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0; width: 197px; margin: 5px auto 3px; overflow: hidden; position:relative }
#emergency-planning .emergency_category .ui-progressbar .ui-progressbar-value { background:#9cbc01; height: 8px; margin-top: 2px; margin-bottom: 2px; }
#emergency-planning .emergency_category .ui-progressbar .segments { position:absolute; top:-3px }
#emergency-planning .emergency_category .ui-progressbar .segments span { color: #056595; display:inline-block; width:1px; margin:0; position:absolute }
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
#emergency-planning .variable {height:580px; }
#emergency-planning .variable > ul li{margin: 34px 0 0;}
#emergency-planning .variable .secondary_heading { background:#1D87BD url(${pageContext.request.contextPath}/resources/images/header_pattern.png) no-repeat center right; height:34px; text-align:center; font-size: 23px; color: #FFF; font-family: "Aller Bold"; text-shadow: 1px 2px 1px #0B2B3C; line-height: 31px; text-indent: 348px; }
#emergency-planning .report { height: 223px;}
#emergency-planning .report .container { background: #F4F4F4; border: 2px solid #368EBC; min-height: 185px; width:256px; -moz-border-radius: 100px 100px 0 0; -webkitborder-radius: 100px 100px 0 0; border-radius: 100px 100px 0 0; padding: 10px; font-family: "Aller Bold"; font-size:12px }
#emergency-planning .report > ul { margin: 0 auto; width: 575px; }
#emergency-planning .report .first .txt { margin: 50px 0 0; line-height: 18px; text-align: justify; }
#emergency-planning .report .second ul { width: 218px; margin:10px auto 0; text-align: center; }
#emergency-planning .report .second ul li { margin: 0 0 8px 0; line-height: 14px; }
#emergency-planning .report .rs_symbol { display: inline-block; background: url(${pageContext.request.contextPath}/resources/images/theme_color_ruppe.png) no-repeat center center; width: 8px; height: 11px; margin: 0px 1px 0 3px; vertical-align: -2px; }
/***Emergency Planning Ends***/

</style>
<div class="header clearfix">
    <div class="desc_heading fl">
      <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div>
      <h2 class="head_txt2">${adviserGoals.name}</h2>
    </div>
    <h1 class="page_heading fr">Emergency Planning</h1>
  </div>
  <div class="content" id="emergency-planning">
    <div class="box1 fixed">
      <ul class="reset clearfix">
        <li>
          <div class="emergency_category rel clearfix">
            <h3 class="category_name">Loss of Job</h3>
            <div class="emergency_desc fl">
              <p class="txt">Sudden health issues, loss of job can happen to anyone. Very important to be prepared.</p>
            </div>
            <div class="goal_logo_year loss_of_job"> </div>
            <div class="emergency_action fr">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.minimumEmergncyFund}</span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Recommended Requirement</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.idealEmergencyFund}</span> lacs</div>
                </div>
              </div>
              <div id="progressbar1">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <p class="txt">Set aside 6 months worth of expenses.Build this corpus - keep them in bankaccounts or liquid mutual funds - joint holding with someone who you trust</p>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="box2 variable">
      <h2 class="secondary_heading">Risk Planning</h2>
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
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.lifeCurrentCover}</span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Recommended Requirement</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.lifeIdealCover}</span> lacs</div>
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
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.healthCurrentCover}</span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Recommended Requirement</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.healthIdealCover}</span> lacs</div>
                </div>
              </div>
              <div id="progressbar3">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <p class="txt">
              <c:set var="diffHealth" value="${suggestionData.healthIdealCover - suggestionData.healthIdealCover}"/>
              <c:if test="${diffHealth > 0 }">
              Get Basic health insurance of Rs. ${diffHealth} lacs for each person in the family.
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
              <p class="txt">Disability to an earning member will increase expenses and also affect income. Disability can happen because of critical illnesses or accidents.</p>
            </div>
            <div class="goal_logo_year disabilities"> </div>
            <div class="emergency_action fr">
              <div class="fund_status clearfix">
                <div class="fl available">
                  <h6 class="heading">Available</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.accidentCurrentCover + suggestionData.criticalCurrentCover}</span> lacs</div>
                </div>
                <div class="fr additional">
                  <h6 class="heading">Recommended Requirement</h6>
                  <div class="value"><span class="rs_symbol"></span><span class="amount">${suggestionData.accidentIdealCover + suggestionData.criticalIdealCover}</span> lacs</div>
                </div>
              </div>
              <div id="progressbar4">
                <div class="segments"><span class="first">|</span> <span class="second">|</span> <span class="third">|</span> <span class="fourth">|</span> <span class="fifth">|</span><span class="six">|</span><span class="seven">|</span><span class="eight">|</span><span class="nine">|</span><span class="ten">|</span><span class="eleven">|</span> </div>
              </div>
              <p class="txt">
              <c:set var="diffCritical" value="${ suggestionData.criticalIdealCover - suggestionData.criticalCurrentCover}"/>
              <c:set var="diffAccidental" value="${ suggestionData.accidentIdealCover - suggestionData.accidentCurrentCover}"/>
              <c:if test="${diffCritical > 0 }">
              Take critical illness insurance for Rs. ${diffCritical} lacs (one year income).
              </c:if>  <c:if test="${diffCritical <= 0 }">
              Excellent! You have adequate critical illness insurance coverage.
              </c:if>
              <c:if test="${diffAccidental > 0}">
              <br> Accidental Disability Insurance for Rs. ${diffAccidental} lacs (one year income)
               </c:if>
                <c:if test="${diffAccidental <= 0}">
               Excellent! You have adequate accidental disability insurance coverage.
               </c:if>
               </p>
               
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="box3 report">
      <ul class="clearfix reset">
        <li class="fl first">
          <div class="container">
            <p class="txt">Though we wish they don't, Bad things may happen to anyone. It is important to be protected against setbacks like income loss, health loss etc to ensure your wealth is available for your Goals and Dreams.</p>
          </div>
        </li>
        <li class="fr second">
          <div class="container">
            <ul class="reset clearfix">
              <li> Protect yourself with</li>
              <li>Life Insurance for <span class="rs_symbol"></span><span class="theme_color">${diffLife} lacs</span></li>
              <li>Health insurance - Basic for each family member <span class="rs_symbol"></span><span class="theme_color"> ${diffHealth} lacs</span></li>
             <!--  <li>Health insurance - Top up - for the whole family <span class="rs_symbol"></span><span class="theme_color">10,00,000</span></li> -->
              <li>Critical illness insurance <span class="rs_symbol"></span><span class="theme_color">${diffCritical} lacs</span></li>
              <li>Accidental Disability insurance <span class="rs_symbol"></span><span class="theme_color">${diffAccidental} lacs</span></li>
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
<br>
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
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: center; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: #1D87BD; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
.theme_color { color: #1D87BD; }
/***Common Css Ends***/
/***Goals My Dreams Starts***/
#succession_planning .container { position: relative; width: 92%; margin: 0 auto; height: 313px; }
#succession_planning .question { width:210px; height:210px; border:2px solid #1D87BD; -moz-border-radius: 125px; -webkit-border-radius: 125px; border-radius: 125px; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; background:url(${pageContext.request.contextPath}/resources/images/question_bg.png) no-repeat 41px 64px; position: absolute; left:0; top: 52px; z-index:150 }
#succession_planning .action { height:294px; width:294px; border:2px solid #1D87BD; -moz-border-radius: 172px; -webkit-border-radius: 172px; border-radius: 172px; -moz-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; -webkit-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; position: absolute; left:165px; z-index:100 }
#succession_planning .importance { width:305px; height: 200px; background: #9CBC01; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; position: absolute; right:0; top: 48px; z-index:50; color:#fff; font-family: "Aller Bold"; }
#succession_planning .importance .imp_head { font-size:19px; margin: 16px 0 12px 28px; width: 230px; }
#succession_planning .importance .txt { font-size: 13px; margin: 0 0 0 43px; width: 242px; height: 149px; line-height: 17px; -moz-border-radius: 0 0 63px 0; -webkit-border-radius: 0 0 63px 0; border-radius: 0 0 63px 0; }
#succession_planning .action .action_head { font-family: "Aller Bold"; font-size: 23px; margin: 65px 0 0 54px; width: 234px; }
#succession_planning .action .txt { font-family: "Aller Bold"; font-size: 15px; margin: 11px 0 0 54px; width: 234px; height: 202px; border-radius: 0 0 115px 71px; color: #1D87BD; line-height:23px;padding: 0 0 0 5px; }
#succession_planning .question .txt { font-family: "Aller Bold"; font-size: 15px; margin: 53px 0 0 20px; width: 137px; height: 149px; -moz-border-radius: 0 0 0 76px; -webkit-border-radius: 0 0 0 76px; border-radius: 0 0 0 76px; color: #1D87BD; line-height: 23px; }
#succession_planning .question .icon { height:74px; width:74px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid #1D87BD; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; position: absolute; top: -35px; left:70px; background: #FFF url(${pageContext.request.contextPath}/resources/images/investment_icon.png) no-repeat center center; }
#succession_planning .question .yes_no_answer { position: absolute; top: 62px; right: 8px; height: 94px; width: 33px; text-align: center; font-size: 13px; font-family: "Aller Bold"; }
#succession_planning .question .yes_no_answer .custom_radio { height:11px; width:11px; border:1px solid #1D87BD; -moz-border-radius: 18px; -webkit-border-radius: 18px; border-radius: 18px; margin:3px auto 0 }
#succession_planning .question .yes_no_answer li { margin: 3px 0 19px; }
#succession_planning .question .yes_no_answer .custom_radio.selected { background:url(${pageContext.request.contextPath}/resources/images/custom_selected.png) no-repeat center center }
#succession_planning .container_ul li { margin:37px 0 0}
/***Goals My Dreams Ends***/

#succession_planning .action .action_head {
	font-size: 28px;
	margin: 37px 0 0 54px;
}

#succession_planning .action .txt {
	font-size: 12px;
	margin: 7px 0 0 54px;
}

</style>
<div class="header clearfix">
    <div class="desc_heading fl">
      <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div>
      <h2 class="head_txt2">${adviserGoals.name}</h2>
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
                <div class="custom_radio <c:if test="${suggestionData.investJointly==1}">selected </c:if>" > </div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${suggestionData.investJointly==0}">selected </c:if>"></div>
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
                <div class="custom_radio <c:if test="${suggestionData.awareInvest==1}">selected </c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${suggestionData.awareInvest==0}">selected </c:if>"></div>
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
                <div class="custom_radio <c:if test="${suggestionData.awareInvest==1}">selected </c:if>"></div>
              </li>
              <li>
                <p class="yes_no">NO</p>
                <div class="custom_radio <c:if test="${suggestionData.awareInvest==0}">selected </c:if>"></div>
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
  <div class="footer clearfix">
    <div class="fl footer_tagline">True Friends of New Investors</div>
    <div class="fr page_no">(<span class="no">3</span>)</div>
  </div>
  <br>
</div>
</body>
</html>
