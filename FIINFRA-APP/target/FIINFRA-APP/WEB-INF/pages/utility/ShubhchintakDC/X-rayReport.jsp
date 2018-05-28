	<!DOCTYPE html>
<%@page import="in.fiinfra.common.common.StringUtils"%>
<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.utility.facade.AuthHandler"%> 
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="themeIdTemp" value="${themeId}"/>
<% 
 //UserSession _USER = AuthHandler.getCurrentUser();
Integer themeId = (Integer) pageContext.getAttribute("themeIdTemp");
 
 String colorCode="#952754";
 String colorCodeLeft="#a8a8a8";
 String imagePath="header_pattern_magento.png";
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Financial X Ray Page 1</title>

<!--Common Custom checkbox -->

<style>
/***Custom Fonts Strats***/
@font-face {
 font-family: 'open_sanslight';
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-light-webfont.eot');
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-light-webfont.eot?#iefix') format('embedded-opentype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-light-webfont.woff') format('woff'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-light-webfont.ttf') format('truetype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-light-webfont.svg#open_sanslight') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
font-family:"Aller Bold";
src:url("${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/Aller_Bd.eot?") format("eot"), url("${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/Aller_Bd.woff") format("woff"), url("${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/Aller_Bd.ttf") format("truetype"), url("${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/Aller_Bd.svg#Aller-Bold") format("svg");
font-weight:normal;
font-style:normal;
}
 @font-face {
 font-family: 'allerregular';
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_rg-webfont.eot');
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_rg-webfont.eot?#iefix') format('embedded-opentype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_rg-webfont.woff') format('woff'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_rg-webfont.ttf') format('truetype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_rg-webfont.svg#allerregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'alleritalic';
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_it-webfont.eot');
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_it-webfont.eot?#iefix') format('embedded-opentype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_it-webfont.woff') format('woff'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_it-webfont.ttf') format('truetype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/aller_it-webfont.svg#alleritalic') format('svg');
 font-weight: normal;
 font-style: normal;
}
 @font-face {
 font-family: 'open_sansregular';
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-regular-webfont.eot');
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-regular-webfont.eot?#iefix') format('embedded-opentype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-regular-webfont.woff') format('woff'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-regular-webfont.ttf') format('truetype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-regular-webfont.svg#open_sansregular') format('svg');
 font-weight: normal;
 font-style: normal;
}
@font-face {
 font-family: 'open_sansbold';
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-bold-webfont.eot');
 src: url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-bold-webfont.eot?#iefix') format('embedded-opentype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-bold-webfont.woff') format('woff'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-bold-webfont.ttf') format('truetype'), url('${baseUrl}/FIINFRA-Client-WEB/resources/css/fonts/opensans-bold-webfont.svg#open_sansbold') format('svg');
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

/* Basic Css Ends*/
.wrapper { width:792px; margin:0 auto; height:1100 px; color:#3a3a3a; font-family: 'allerregular'; border: 1px solid; position: relative;}
.wrapper .verticle_side { height:60px; width:1124px; background-color:#3a3a3a; position:absolute; top:532px; margin: 0px 0px 0px -533px; z-index:5; -webkit-transform: rotate(270deg); -moz-transform: rotate(270deg); -o-transform: rotate(270deg); }
.wrapper .verticle_side p.verticle { font-family: "Aller Bold"; font-size:24px; color:#fff; text-align: center; line-height: 60px; /*-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg); -o-transform: rotate(270deg);*/ }
.header { height:65px; background:<%=colorCode %>; }
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0 0px; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
.content { /*height:1041px*/ }
.footer { height:18px; background:#c0c0c0 }
.page_heading { color: #FFF; font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: right; width: 388px; position:relative; text-shadow: 1px 3px 1px #414141; margin-right:20px; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; position: absolute; width: 100%; bottom: 0;}
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 20px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
.head_txt2 { color: <%=colorCode %>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center }
/***Common Css Ends***/

/***Financial Planning Summary Starts***/
.head_txt1 { font-family: "Aller Bold"; font-size: 23px; line-height: 50px; text-align: left; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; color:#000; margin-left:20px; }
/***Financial Planning Summary Ends***/

.com_logo { margin:10px 20px 0px 0 }


/*X-Ray Analysis Page Starts*/
#xray_analysis .wrapper_box_in { width:100%;}
/*Top Box*/
#xray_analysis .bx_one_shadow { background: url(${baseUrl}/FIINFRA-Client-WEB/resources/images/shadow_new.png) no-repeat center bottom; padding-bottom:4px; margin-top:10px;}
#xray_analysis .bx_one { background-color:#FFF; width:auto; border:1px solid #b5b5b5; margin: 0 20px; padding: 7px; }
#xray_analysis .bx_one .left { width:69%; margin-top: 30px; }
#xray_analysis .bx_one .left_top { width:auto; margin-bottom: 20px; }
#xray_analysis .bx_one .left_top .tag { width:auto; font-family:Aller Bold; font-size:22px; color:#3a3a3e; }
#xray_analysis .bx_one .left_top .title { width:auto; font-family:Aller Bold; font-size:22px; color:#952754; }
#xray_analysis .bx_one .left .txt { width:auto; font-family:allerregular; font-size:15px; color:#3a3a3e; }
#xray_analysis .bx_one .left_bottom { width:auto; border:1px solid #b5b5b5; }
#xray_analysis .bx_one .right { width:25%; background-color:#ededed; font-family:Aller Bold; font-size:19px; color:#3a3a3e; text-align:center; padding:12px; line-height: 25px; }
#xray_analysis .bx_one span { color:<%=colorCode %>; font-size:18px; }
/*Top Box*/
.ar{ margin: 15px auto; width: 89%; font-family:Aller Bold; font-size:16px; color:#3a3a3e; }
/*Middle Box*/

#xray_analysis .bx_two_one { background-color:#FFF; width:75%; border-bottom:2px solid #dbdbdb; margin: 0 60px 10px 93px; position:relative; padding:15px 0px 23px 33px; font-size:17px; line-height:21px; text-align:justify;}
#xray_analysis .bx_two_one .circle:after { content: ""; width: 2px; height: 75px; position: absolute; background: #dbdbdb; bottom: -66px; display: block; left: 49%; }
#xray_analysis .bx_two_one span { font-family:Aller Bold; font-size:17px; color:<%=colorCode %>; }
#xray_analysis .bx_two_one .circle { width:45px; height:45px; position:absolute; border-radius: 25px; background-color:<%=colorCode %>; font-family:Aller Bold; color: #fff; text-align: center; line-height: 44px; font-size: 22px; top: 10%; left: -23px; }
#xray_analysis .bx_two { background-color:#FFF; width:75%; border-bottom:2px solid #dbdbdb; margin: 0 60px 10px 93px; position:relative; padding:15px 0px 18px 33px; font-size:17px; line-height:21px; text-align:justify;}
#xray_analysis .bx_two .circle:after { content: ""; width: 2px; height: 108px; position: absolute; background: #dbdbdb; bottom: -100px; display: block; left: 49%; }
#xray_analysis .bx_two span { font-family:Aller Bold; font-size:17px; color:<%=colorCode %>; }
#xray_analysis .bx_two .circle { width:45px; height:45px; position:absolute; border-radius: 25px; background-color:<%=colorCode %>; font-family:Aller Bold; color: #fff; text-align: center; line-height: 44px; font-size: 22px; top: 10%; left: -23px; }

#xray_analysis .bx_two_one_two { background-color:#FFF; width:75%; border-bottom:2px solid #dbdbdb; margin: 0 60px 10px 93px; position:relative; padding:15px 0px 23px 33px; font-size:17px; line-height:21px; text-align:justify;}
#xray_analysis .bx_two_one_two .circle:after { content: ""; width: 2px; height: 95px; position: absolute; background: #dbdbdb; bottom: -86px; display: block; left: 49%; }
#xray_analysis .bx_two_one_two span { font-family:Aller Bold; font-size:17px; color:<%=colorCode %>; }
#xray_analysis .bx_two_one_two .circle { width:45px; height:45px; position:absolute; border-radius: 25px; background-color:<%=colorCode %>; font-family:Aller Bold; color: #fff; text-align: center; line-height: 44px; font-size: 22px; top: 10%; left: -23px; }

/*Middle Box*/

/*bottom Box*/
#xray_analysis .bx_three_shadow { background: url(${baseUrl}/FIINFRA-Client-WEB/resources/images/shadow_new.png) no-repeat center bottom; padding-bottom:4px; margin-top:10px; }
#xray_analysis .bx_three { background-color:#FFF; width:auto; border:1px solid #b5b5b5; margin: 0 5px; padding: 15px; }
/*#xray_analysis .bx_three  { width:43%; }*/
#xray_analysis .bx_three .title { width:auto; font-family:Aller Bold; font-size:20px; color:#000; margin-bottom:25px; }
#xray_analysis .bx_three .txt { width:auto; font-family:allerregular; font-size:14px; color:#3a3a3e; margin-bottom:15px; }
/*bottom Box*/

/*Main bottom Box*/
#xray_analysis .bx_four { background-color:#FFF; width:auto; margin: 0 20px 0 20px; padding: 5px; font-family:allerregular; color: #3a3a3e; font-size:14px }
#xray_analysis .bx_four .wrm { font-family:Aller Bold; color: <%=colorCode %>; font-size:15px; margin-top:20px;}
#xray_analysis .bx_four .ff { font-family:Aller Bold; color: #000; font-size:15px; margin-top:10px; margin-bottom:6px;}
/*Main bottom Box*/
/*X-Ray Analysis Page Starts*/

</style>
</head>

<c:set var="ownerLogo" value="${ownerLogo}"/>
<input type="hidden" name="logo" value="${ownerLogo}">
<body>
    <% 
    
    
    String ownerLogo1 =(String) pageContext.getAttribute("ownerLogo");
   
    
    String baseURL = (String) request.getAttribute("baseUrl");
    String ownerLogo = baseURL+"/FIINFRA-Client-WEB/"+"resources/images/temp_logo.png";
    if(!StringUtils.isEmpty(ownerLogo1)){
    	if(ownerLogo1.startsWith("/")){
    		ownerLogo = baseURL+"/FIINFRA-APP/app/images"+ownerLogo1;	
    	}
    	else{
    		ownerLogo = baseURL+"/FIINFRA-APP/app/images/"+ownerLogo1;
    	}
    }
    
    //ownerLogo = baseURL+"/FIINFRA-Client-WEB/"+"resources/images/sws_logo.png";
    
    String name = (String) request.getAttribute("name");
    if(name != null && name.trim().startsWith(".")){
    	name = name.replace(".", "");
    }
    request.setAttribute("name", name);
      
    %>
<div class="wrapper">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt1">${name}</h2>
    </div>
    <h1 class="page_heading fr">Financial X-Ray</h1>
  </div>
  <section class="in_content clearfix" id="xray_analysis">
    <div class="wrapper_box_in">

    
      <div class="com_logo fr"><img src="<%=ownerLogo%>" width="auto" height="60" ></div>
      <div class="clr"></div>
      <!--Box One Starts-->
      <div class="bx_one_shadow clearfix">
        <div class="bx_one clearfix">
          <div class="left fl">
            <div class="txt"> We Congratulate you for taking the Financial X-Ray and taking the first step in your journey towards financial freedom. </div>
          </div>
          <div class="right fr"> Your Financial X-Ray Score is <br/>
            <span>(${totalScore})</span> on 100. </div>
        </div>
      </div>
      <!--Box One Ends-->
      
      <div class="ar"> The analysis report will try to put in perspective your current situation on the following issues of importance</div>
      
      <!--  <div class="bx_two clearfix"> Please find a following detailed analysis of your X-Ray: </div>-->
      
      <div class="bx_two_one clearfix">
        <div class="circle">1</div>
        <span>Articulation of Financial Goals:</span> The first step in financial planning process is to articulate your financial goals and responsibilities. If goals are your destination the financial plan is the road map which will help you to reach your goals smoothly and in a definite time horizon. </div>
      <div class="bx_two_one_two clearfix">
        <div class="circle">2</div>
        <span>Contingency Planning:</span> Financial planning begins with bracing yourself for unforeseen events or emergencies and reducing the impact of adverse conditions in your life. A contingency fund is a backup plan in case of a job loss/income loss or any other emergency. Everyone needs to plan for some emergencies like health related expenses and Social Responsibilities.</div>
      <div class="bx_two clearfix">
        <div class="circle">3</div>
        <span>Risk Planning:</span> Risk Planning includes three areas: Life, Health and Asset. We follow a scientific approach of calculating the Human Life Value to determine the correct Insurance needs for our clients. Health Insurance is one of the most critical ways to cover the Health related risks which if not planned, might have a huge financial impact. Similarly, Assets should also be insured against any natural disasters or other such events. </div>
      <div class="bx_two clearfix">
        <div class="circle">4</div>
        <span>Retirement Goals:</span> Retirement has the highest weightage in your financial goals, as this is the period where you would get time to do things apart from your professional life. We strongly believe that "Retirement means not to stop working but to stop working for money". Hence, you should have a retirement corpus in place ,not only a corpus but a plan on how you would like to spend the days in your retirement. </div>
      <div class="bx_two_one_two clearfix">
        <div class="circle">5</div>
        <span>Estate Planning :</span> Irrespective of the any stage of your life it is always a good idea to plan for your dependents since life sometimes takes unfortunate unexpected turns, it is advisable to keep your bank accounts in joint names and if not, do have a POA which can take care of any emergencies. Do not leave things to chance, prepare a Will well in advance to protect your family. </div>
    </div>
  </section>
  <div class=" clearfix"> 
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <!-- <div class="fr page_no">(<span class="no">1</span>)</div> -->
  </div>
</div>

<div style="page-break-before:always"></div>
<br>
<!--  Next Page Start Here -->

<div class="wrapper" class="clearfix">
  <div class="header clearfix">
    <div class="desc_heading fl">
      <h2 class="head_txt1">${name}</h2>
    </div>
    <h1 class="page_heading fr">Financial X-Ray</h1>
  </div>
  <!-- end of "inner-shadow-strip" id -->
  
    <section class="in_content clearfix" id="xray_analysis">
      <div class="wrapper_box_in">
      
                <!--Box One Starts-->
        <div class="bx_three_shadow clearfix">
          <div class="bx_three">
          
          <div class="title">Summary of Analysis for ${name}</div>
                
 <%
 		Map<Integer,List<Integer>> answersMap = (Map<Integer,List<Integer>>) request.getAttribute("answersMap");
 %>               
 
<%if(answersMap.get(1).contains(1) && answersMap.get(2).contains(1) ){%>
<p>You have planned your monthly budgets and are following it too, this shows that you have already taken the first step towards your financial security. This forms a strong base for planning your finances well.</p>
<p>&nbsp;</p>
<% } %>
<%if(answersMap.get(1).contains(1) && !answersMap.get(2).contains(1) ){%>
 <p>You have planned your monthly budgests but you are unable to follow it. This situation is very common amongst Indian households. There needs to be a stronger focus on consciously following a monthly budget and ensure systematically planned savings, which will help you in deployment of these funds in the right asset allocation based on your goals.</p>
 <p>&nbsp;</p>
 <% } %>    
<%if(!answersMap.get(1).contains(1)){%>
 <p>You have stated that you have not planned your monthly budgets. One should always plan their monthly budgets and have a stronger focus on consciously following a monthly budget to ensure systematically planned savings, which will help you in deployment of these funds in the right asset allocation based on your goal.</p>
 <p>&nbsp;</p>
 <% } %>
<%if(answersMap.get(4).contains(1) && answersMap.get(5).contains(1)){%>
<p>You have stated that you can maintain a similar lifestyle in case of an income loss. This means that you have an emergency fund in place, kindly ensure that this fund can fulfil 6 months of your monthly expenses and is invested in highly liquid options. The Plan will throw light on the best options available.</p>
<p>&nbsp;</p>
<% } %>    
<%if(answersMap.get(4).contains(1) && !answersMap.get(5).contains(1)){%>
<p>You have stated that you can maintain a similar lifestyle in case of an income loss. This means that you have an emergency fund in place but you don't know how much do you require to maintain a similar lifestyle, kindly ensure that a kitty that can fulfil 6 months of your monthly expenses is available in a highly liquid investment option. The Plan will throw light on the best options available.</p>
<p>&nbsp;</p>
 <% } %> 
<%if(!answersMap.get(4).contains(1)){%>
<p>You have stated that you cannot maintain a similar lifestyle in case of an income loss. This means that you don't have an emergency fund in place, so kindly ensure that a kitty that can fulfil 6 months of your monthly expenses is available in a highly liquid investment option. The Plan will throw light on the best options available.</p>
<p>&nbsp;</p>
<% } %>    
<%if(answersMap.get(6).contains(1) && answersMap.get(7).contains(1)){%>
<p>You already have Life Insurance policies in place and you are also aware of the amount of Insurance cover required, A financial Planner can help you identify the appropriate cover that you require. This is done based upon the formulae of Human Life Value which will be incorporated in your Financial Plan.</p>
<p>&nbsp;</p>
<% } %>     
<%if(answersMap.get(6).contains(1) && !answersMap.get(7).contains(1)){%>
<p>You already have Life Insurance policies in place but you are not aware of the amount of Insurance cover required. A financial Planner can help you identify the appropriate cover that you require. This is done based upon the formulae of Human Life Value which will be incorporated in your Financial Plan.</p>
<p>&nbsp;</p>
<% } %>    
<%if(!answersMap.get(6).contains(1)){%>
<p>Not having any Life Insurance increases the probability of your goals being jeopardised and your family's financial security being at stake to an unfortunate incident. A financial Planner can help you identify the appropriate cover that you require. This is done based upon the formulae of Human Life Value which will be incorporated in your Financial Plan.</p>
<p>&nbsp;</p>
<% } %>    
<%if(answersMap.get(8).contains(1)){%>
<p>You have protected yourself  and your family against medical contingencies. The plan will ascertain the adequacy of your medical cover and update you if better products are available. Your financial plan will suggest the most suitable product for your health insurance. Not only medical Plans, but plans for Critical Illness, accidental disability  and asset insurance can add a level of protection against contingencies.</p>
<p>&nbsp;</p>
 <% } %>      
<%if(!answersMap.get(8).contains(1)){%>
<p>You have not protected yourself  and your family against medical contingencies. With the rising costs of medication and the increasing vulnerability of falling ill, a health insurance plan can protect you financially during medical emergencies. Your financial plan will suggest the most suitable product for your health insurance. Not only medical Plans, but plans for Critical Illness, accidental disability  and asset insurance can add a level of protection against contingencies.</p>
<p>&nbsp;</p>
 <% } %>      
<%if(answersMap.get(11).contains(1) && answersMap.get(12).contains(1) && answersMap.get(13).contains(1) ){%>
<p>Ascertaining your Goals with Amounts, Dates and Time Horizon is a predicament to achieve your goals. Doing this will help you make better investments decision and successfully achieve your goals. Your Financial Plan will periodically give intricate details about the same.<br/><br/>
Review and Rebalancing the investments in alignment with your goals is the key to achieve your financial goals. We strongly believe and follow the scientific approach of reviewing your financial plan periodically and rebalancing it in the context of your goals.
It is good to see that you have identified and planned your goals with amount, dates and Time horizon. Investing the same in the right direction with correct amounts is of equal importance.</p>
<p>&nbsp;</p>
<% } %>
<%if(answersMap.get(11).contains(1) && !answersMap.get(12).contains(1)){%>
<p>Ascertaining your Goals with Amounts, Dates and Time Horizon is a predicament to achieve your goals. Doing this will help you make better investments decision and successfully achieve your goals. Your Financial Plan will periodically give intricate details about the same.<br/><br/>
In your context we would like to say that you have identified and  your goals with amount and dates but you haven't planned as to how will you achieve those goals .A Financial Planner will help you achieve your goals .</p>
<p>&nbsp;</p>
<% } %>       
<%if(answersMap.get(14).contains(1) && answersMap.get(15).contains(1)){%>
<p>You follow a regular asset review and rebalancing policy which is a healthy sign in financial planning. Review and Rebalancing the investments in alignment with your goals is the key to achieve your financial goals. We strongly believe and follow the scientific approach of reviewing your financial plan periodically and rebalancing it in the context of your goals.</p>
<p>&nbsp;</p>
<% } %>     
<%if(!answersMap.get(14).contains(1) && !answersMap.get(15).contains(1)){%>
<p>You do not follow a regular asset review and rebalancing policy which is not a very healthy sign in financial planning. Review and Rebalancing the investments in alignment with your goals is the key to achieve your financial goals. We strongly believe and follow the scientific approach of reviewing your financial plan periodically and rebalancing it in the context of your goals.</p>
<p>&nbsp;</p>
 <% } %>    
<%if(answersMap.get(16).contains(1)){%>
<p>You make your Investments in various asset classes which proves tha you understand the importance of the principle of diversification. With market volatility and asset value fluctuation setting a target asset allocation and regularly rebalancing your portfolio at the established level plays a pivotal role in Financial Planning.</p>
<p>&nbsp;</p>
<% } %>    
<%if(!answersMap.get(16).contains(1)){%>
<p>Putting all your savings and hard earned money in a single asset class may not be the right path in achieving your targeted goal. Your Investments are concentrated in a few asset classes which shows that you do not follow the principle of diversification. With market volatility and asset value fluctuation setting a target asset allocation and regularly rebalancing your portfolio at the established level plays a pivotal role in Financial Planning.</p>
<p>&nbsp;</p>
<% } %>
<%if(answersMap.get(20).contains(1) && answersMap.get(21).contains(1) ){%>
<p>We spend almost 1/3rd of our life in Retirement period during which the regular cash inflows are restricted. Our Plan will be framed taking your retirement planning into consideration. This will ensure that your post retirement phase is managed smoothly. You are Planning for your retirement and you even know how much corpus will be required during your retirement. Your financial plan will ascertain the same and validate the amount of retirement corpus that you have in mind.</p>
<p>&nbsp;</p>
<% } %>
<%if(answersMap.get(20).contains(1) && !answersMap.get(21).contains(1) ){%>
<p>We spend almost 1/3rd of our life in Retirement period during which the regular cash inflows are restricted. Our Plan will be framed taking your retirement planning into consideration. This will ensure that your post retirement phase is managed smoothly. You are Planning for your retirement but you don't how much corpus will be required during your retirement. Your financial plan will ascertain the same and validate the amount of retirement corpus that you have in mind.</p>
<p>&nbsp;</p>
<% } %>
<%if(!answersMap.get(20).contains(1)){%>
<p>We spend almost 1/3rd of our life in Retirement period during which the regular cash inflows are restricted. Our Plan will be framed taking your retirement planning into consideration. This will ensure that your post retirement phase is managed smoothly. You are not Planning for your retirement and you don't know how much corpus will be required during your retirement. Your financial plan will ascertain the same and validate the amount of retirement corpus that you have in mind.</p>
<p>&nbsp;</p>
<% } %>
               
<!-- <p>You have planned your monthly budgets and are following it too, this shows that you have already taken the first step towards your financial security. This forms a strong base for planning your finances well.</p>
<p>&nbsp;</p>

<p>You have stated that you can maintain a similar lifestyle in case of an income loss. This means that you have an emergency fund in place, kindly ensure that this fund can fulfil 6 months of your monthly expenses and is invested in highly liquid options. The Plan will throw light on the best options available</p>
<p>&nbsp;</p>

<p>You already have Life Insurance policies in place and you are also aware of the amount of Insurance cover required, A financial Planner can help you identify the appropriate cover that you require. This is done based upon the formulae of Human Life Value which will be incorporated in your Financial Plan</p>
<p>&nbsp;</p>

<p>You have protected yourself and your family against medical contingencies. The plan will ascertain the adequacy of your medical cover and update you if better products are available. Your financial plan will suggest the most suitable product for your health insurance. Not only medical Plans, but plans for Critical Illness, accidental disability and asset insurance can add a level of protection against contingencies.  </p>
<p>&nbsp;</p>
<p>Ascertaining your Goals with Amounts, Dates and Time Horizon is a predicament to achieve your goals. Doing this will help you make better investments decision and successfully achieve your goals. Your Financial Plan will periodically give intricate details about the same.</p>
<p>&nbsp;</p>
<p> Review and Rebalancing the investments in alignment with your goals is the key to achieve your financial goals. We at Ffreedom, strongly believe and follow the scientific approach of reviewing your financial plan goals. We at Ffreedom, strongly believe and follow the scientific approach of reviewing your financial plan periodically and rebalancing it in the context of your goals. It is good to see that you have identified and planned your goals with amount, dates and Time horizon. Investing the same in the right direction with correct amounts is of equal importance.  </p>
<p>&nbsp;</p>
<p>You follow a regular asset review and rebalancing policy which is a healthy sign in financial planning. Review and Rebalancing the investments in alignment with your goals is the key to achieve your financial goals. We at Ffreedom, strongly believe and follow the scientific approach of reviewing your financial plan periodically and rebalancing it in the context of your goals</p>
<p>&nbsp;</p>
<p> You make your Investments in various asset classes which proves tha you understand the importance of the principle of diversification. With market volatility and asset value fluctuation setting a target asset allocation and regularly rebalancing your portfolio at the established level plays a pivotal role in Financial Planning.  </p>
<p>&nbsp;</p>
<p>We spend almost 1/3rd of our life in Retirement period during which the regular cash inflows are restricted. Our Plan will be framed taking your retirement planning into consideration. This will ensure that your post retirement phase is managed smoothly. You are Planning for your retirement and you even know how much corpus will be required during your retirement. Your financial plan will ascertain the same and validate the amount of retirement corpus that you have in mind. </p>
 -->        
       </div>
  </div>
<!--Box One Ends-->
 <div class="bx_four">We use a progressive asset allocation process after taking into consideration a conservative assumptions on equity and debt as well as inflation due to which you are able to meet your requirements. Also, we give tax-efficient options to our client.
<br/><br/>
The journey to a great destination begins with a small step!
<br/><br/>
We look forward to be your partner in your journey towards financial freedom and helping you in articulation of your personalised financial plan.


<div class="wrm">Warm Regards,</div>
<div class="ff">${companyName}</div>
       
      </div>
      </section>
      
  <div class=" clearfix"> 
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <!-- <div class="fr page_no">(<span class="no">2</span>)</div> -->
  </div>  
      
  </div>
 


</body>
</html>
