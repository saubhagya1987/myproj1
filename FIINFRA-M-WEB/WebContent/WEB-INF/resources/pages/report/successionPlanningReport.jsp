<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.wrapper5 { width:792px; margin:0 auto; height:1124px;color:#3a3a3a; font-family: 'allerregular';margin-top:20px;}
.header5 { height:65px; background:<%=colorCode %> url(${pageContext.request.contextPath}/resources/images/<%=imagePath%>) no-repeat center right;background-size:754px auto;}
.desc_heading { background: #FFF; width: 366px; height: 50px; margin: 7px 0 0; border-radius: 0 30px 30px 0; -moz-border-radius: 0 30px 30px 0; -webkit-border-radius: 0 30px 30px 0; }
/* .content { height:740px } */
.footer { height:18px; background:#c0c0c0 }
.page_heading { position:relative; /* color: #FFF; */ font-size: 23px; font-family: "Aller Bold"; line-height: 63px; text-align: left; width: 393px; text-shadow: 1px 2px 1px #0B2B3C; }
.footer { font-size:12px; font-family: "Aller Bold"; line-height: 19px; }
.footer .footer_tagline { margin:0 0 0 22px; }
.page_no { margin:0 26px 0 0; }
.ifa_head_logo { height: 47px; margin: 1px; width:auto; overflow:hidden; display: inline-block }
.ifa_head_logo img { max-height:100%; width:auto; }
/* .head_txt2 { color: <%=colorCode%>; font-size: 23px; font-family: "Aller Bold"; display: inline-block; margin: 0 0 0 14px; vertical-align: 12px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width:298px; text-align:center } */
.theme_color { color: <%=colorCode%>; }
/***Common Css Ends***/
/***Goals My Dreams Starts***/
#succession_planning .container { position: relative; width: 92%; margin: 0 auto; height: 220px; }
#succession_planning .question { width:134px; height:134px; border:2px solid <%=colorCode%>; -moz-border-radius: 125px; -webkit-border-radius: 125px; border-radius: 125px; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; background:url(${pageContext.request.contextPath}/resources/images/question_bg2.png) no-repeat 35px 30px; position: absolute; left:0; top: 52px; z-index:150 }
#succession_planning .action { height:200px; width:200px; border:2px solid <%=colorCode%>; -moz-border-radius: 172px; -webkit-border-radius: 172px; border-radius: 172px; -moz-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; -webkit-box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; box-shadow: 0px 9px 18px -4px #828282, -37px 0 0 163px #FFF inset; position: absolute; left:105px; top:15px; z-index:100; background-color: #FFF; }
#succession_planning .importance { width:220px; height: 127px; background: <%=colorCodeLeft%>; -moz-border-radius: 0 109px 109px 0; -webkit-border-radius: 0 109px 109px 0; border-radius: 0 109px 109px 0; -moz-box-shadow: 1px 2px 2px 0px #6C6C6C; -webkit-box-shadow: 1px 2px 2px 0px #6C6C6C; box-shadow: 1px 2px 2px 0px #6C6C6C; position: absolute; left:280px; top: 48px; z-index:50; color:#fff; font-family: "Aller Bold"; }
#succession_planning .importance .imp_head { font-size:14px; margin: 5px 0 4px 28px; width: 230px; }
#succession_planning .importance .txt { font-size: 10px;margin: 0 0 0 30px;width: 168px;height: 99px;line-height: 11px;-moz-border-radius: 0 0 63px 0;-webkit-border-radius: 0 0 63px 0;border-radius: 0 0 63px 0; }
#succession_planning .action .action_head { font-family: "Aller Bold"; font-size: 23px; margin: 25px 0 0 34px; width: 234px; }
#succession_planning .action .txt { font-family: "Allerregular";font-size: 10px;margin: 0px 0 0 28px;width: 147px;height: 132px;
border-radius: 0 0 115px 71px;color: <%=colorCode%>;line-height: 13px;padding: 0 0 0 5px; }
#succession_planning .question .txt {font-family: "Aller Bold";font-size: 12px;margin: 30px 0 0 12px;width: 96px;height: 59px;
-moz-border-radius: 0 0 0 76px;-webkit-border-radius: 0 0 0 76px;border-radius: 0 0 0 76px;color: <%=colorCode%>;line-height: 15px; }
#succession_planning .question .icon { height:45px; width:45px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid <%=colorCode%>; -moz-box-shadow: 0px 9px 18px -4px #828282; -webkit-box-shadow: 0px 9px 18px -4px #828282; box-shadow: 0px 9px 18px -4px #828282; position: absolute; top: -25px; left:45px; background: #FFF url(${pageContext.request.contextPath}/resources/images/succession_icon.png) no-repeat center center; }
#succession_planning .question .yes_no_answer { position: absolute; top: 35px; right: 0px; height: 94px; width: 33px; text-align: center; font-size: 10px; font-family: "Aller Bold"; }
#succession_planning .question .yes_no_answer .custom_radio { height:11px; width:11px; border:1px solid <%=colorCode%>; -moz-border-radius: 18px; -webkit-border-radius: 18px; border-radius: 18px; margin:3px auto 0 }
#succession_planning .question .yes_no_answer li { margin: 3px 0 8px; }
#succession_planning .question .yes_no_answer .custom_radio.selected { background:url(${pageContext.request.contextPath}/resources/images/custom_selected.png) no-repeat center center }
#succession_planning .container_ul li { margin:0 0 0 120px;}

.wrapper5.header5 .icon { height:60px; width:60px; -moz-border-radius:76px; -webkit-border-radius: 76px; border-radius:76px; border: 2px solid <%=colorCodeLeft%>; position: absolute; top: 31px; right: 14px; background: #FFF url(${pageContext.request.contextPath}/resources/images/succession_gray.png) no-repeat center center; }

/*************** Table CSS Start ****************/
.wrapper5 .table{width:500px; margin:0px auto -15px auto; background-color: #E6E6E6;padding-bottom: 15px;}
.wrapper5 .table li{list-style-type:none; display:inline-block; font-size:12px; font-family:"allerregular";font-weight:bold;}
.wrapper5 .table ul{margin-left: -20px;}
.wrapper5.table-header{width:100%; height:20px; background-color:<%=colorCodeLeft%>;}
.wrapper5 .table-header li.one{line-height:15px; width:117px;}
.wrapper5 .table-header li.two{line-height:15px; width:117px; margin-left:32px;}
.wrapper5 .table-header li.three{line-height:15px; width:67px; margin-left: 15px;}
.wrapper5 .table-header li.four{line-height:15px; width:117px;width: 27px;margin-left: 46px;}

.wrapper5 .first-row{margin-top:20px;}
.wrapper5 .first-row ul li.one{width: 140px !important; margin: 0px 0px 0px 0px;}
.wrapper5 .first-row ul li.two{width: 135px !important; margin: 0px 0px 0px 14px;}
.wrapper5 .first-row ul li.three{width: 117px !important;}
.wrapper5 .first-row ul li.four{width:0px !important;}

.wrapper5 .second-row{margin-top:60px;}
.wrapper5 .second-row ul li.one{width: 140px !important; margin: 0px 0px 0px 0px;}
.wrapper5 .second-row ul li.two{width: 135px !important; margin: 0px 0px 0px 14px;}
.wrapper5 .second-row ul li.three{width: 117px !important;}
.wrapper5 .second-row ul li.four{width:0px !important;}

.wrapper5 .third-row{margin-top:100px;}
.wrapper5 .third-row ul li.one{width: 140px !important; margin: 0px 0px 0px 0px;}
.wrapper5 .third-row ul li.two{width: 135px !important; margin: 0px 0px 0px 14px;}
.wrapper5 .third-row ul li.three{width: 117px !important;}
.wrapper5 .third-row ul li.four{width:0px !important;}

/*************** Table CSS End ****************/

/******************Signature****************/
.signature li{list-style-type:none; display:inline-block; font-size:12px; font-family:"allerregular";font-weight:bold;}
.signature .sign-header{width:100%; height:30px; background-color:#3a3a3a; line-height: 28px;}
.signature .sign-header li{color:#fff; font-size:12px;}
.signature .sign-header .one{margin-left:20px;}
.signature .sign-header .two{margin-left:450px;}

.signature .sign-box li{width:140px; height:40px; border:2px <%=colorCodeLeft%> solid;}
.signature .sign-box .two{margin-left:430px;}


.signature .place .one{color:<%=colorCode%>;}
.signature .place .two{margin-left:403px; color:<%=colorCode%>;}

.signature .date .one{color:<%=colorCode%>;}
.signature .date .two{margin-left:410px; color:<%=colorCode%>;}

/******************Signature****************/

/***Goals My Dreams Ends***/
</style>
<c:forEach var="clientActionPlane" items="${successionPlanningDetails}">
<c:set var="investJointly" value="${clientActionPlane.investJointly}"/>
<c:set var="awareInvest" value="${clientActionPlane.awareInvest}"/>
<c:set var="prepareWill" value="${clientActionPlane.prepareWill}"/>
<c:set var="productId" value="${clientActionPlane.productId}"/>
</c:forEach>
<div class="wrapper5 clearfix">
  <div class="header5 clearfix">
    <div class="desc_heading fl">
      <%-- <div class="ifa_head_logo"><img src="${pageContext.request.contextPath}/resources/images/ifa_head_logo.png"/></div> --%>
      <h2 class="head_txt2">${ContactDetails.name}</h2>
    </div>
    <h1 class="page_heading fr">Succession Planning<div class="icon"></div></h1>
   
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
  
  <c:if test="${productId != 0}">
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
	    <!-- <div class="first-row fl">
    	<ul>
        	<li class="one fl">Take a Power Attorney</li>
            <li class="two fl">ABC will writing services</li>
            <li class="three fl">21 Aug, 2014</li>
            <li class="four fl">5000/-</li>
        </ul>
       </div> -->
	  </c:if>
    </c:forEach>
    
     <!-- <div class="first-row fl">
    	<ul>
        	<li class="one fl">Take a Power Attorney</li>
            <li class="two fl">ABC will writing services</li>
            <li class="three fl">21 Aug, 2014</li>
            <li class="four fl">5000/-</li>
        </ul>
     </div>
    
    <div class="second-row">
    	<ul>
        	<li class="one fl">Write a Will</li>
            <li class="two fl">ABC will writing services</li>
            <li class="three fl">25 Aug, 2014</li>
            <li class="four fl">5000/-</li>
        </ul>
    </div>
    
    <div class="third-row">
    	<ul>
        	<li class="one fl">Take a Power Attorney</li>
            <li class="two fl">ABC will writing services</li>
            <li class="three fl">28 Aug, 2014</li>
            <li class="four fl">5000/-</li>
        </ul>
    </div>  -->
    
  </div><!-- End "Table" -->
  </c:if>	
  
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
        	<li><span class="one">Place:</span><span style="color:<%=colorCodeLeft%>">--------------------------</span></li>
            <li><span class="two">Place:</span><span style="color:<%=colorCodeLeft%>">--------------------------</span></li>
        </ul>
    </div> 
    
    <div class="date">
       	<ul>
        	<li><span class="one">Date:</span><span style="color:<%=colorCodeLeft%>">--------------------------</span></li>
            <li><span class="two">Date:</span><span style="color:<%=colorCodeLeft%>">--------------------------</span></li>
        </ul>
    </div>   
  </div><!-- End Of "Signature" -->
  
  
  <div class="footer clearfix" style="margin-top: 100px;">
    <!--div class="fl footer_tagline">True Friends of New Investors</div-->
    <div class="fr page_no">(<span class="no">${pageNumber}</span>)</div>
  </div>
</div>
