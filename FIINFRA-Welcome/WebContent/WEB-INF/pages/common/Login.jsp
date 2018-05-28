<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Login</title>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">

<!--[if lte IE 10]>
   <div style="background-color : #FFFF99;">
   <BANNER >
   		 <t><font color="#00000">This website may not work properly on the browser you are using, please</font></t>
   		 <a href="http://www.google.com/intl/en/chrome/browser/">
   		 	<font color="428bca"> Click here to Download Google Chrome</font>.
   		 </a> 
   		      		    	
   </BANNER>
   </div>
	          	
<![endif]-->


<div style="background-color: #FFFF99; "> 

</div>    


 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<!-- -responsive css-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<!-- <link href="https://myffreedom.in/FFreedom_Portal/images/favicon.ico" rel="shortcut icon"> -->



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

<style >.leftside ul li p
{width: 240px;
height: 17px;
text-align: left !important;
overflow: hidden !important;
font-size: 9px;
}
</style>	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.cycle.all.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('.slideshow').cycle({
		fx: 'fade' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
		
	});
	
// 	$.ajax({
// 		type : "GET",
// 		url : "RSSFeed.jsp",
// 		success:function(result){
// 			result=JSON.parse(result);
// 			var i=0
// 			$('#rssFeeds').empty();
// 			while(i<result.length){
// 				var title=result[i];
// 				i+=1;
// 				var link=result[i];
// 				i+=1;
// 				$('#rssFeeds').append('<li><a target="_blank" href="'+link+'">'+title+'</a></li>');
// 			}
			
// 		}
		
// 	});

	$.ajax({			   				
  		type: "GET",
  		url: $('#contextPath').val()+'/FIINFRA-WEB/common/logout.htm',
		 dataType: 'json',
		 contentType: 'application/json',
		 success:function(result)
	   	{ 
			
														
	    }
	   	
	   	});
});

function validatelogin() {
	// document.getElementById("loginButton").focus();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var isvalidForm = true;
	if (userName == "") {
		$('#user_name_message_Login').show();
		// document.forgotpassword_form.submit();
		isvalidForm = false;
	} else {
		$('#user_name_message_Login').hide();
	}
	if (password == "") {

		// $('#user_name_message_Login').hide();
		$('#password_message_Login').show();
		isvalidForm = false;
	} else {
		$('#password_message_Login').hide();
	}

	if (isvalidForm == true) {
		document.loginForm.action = "https://fi-i.com/Fiinfra/login";
		document.loginForm.submit();
	}
}
$("#password").keyup(function(event) {
	if (event.keyCode == 13) {
		$("#loginButton").click();
	}
});
function searchKeyPress(e) {
	// look for window.event in case event isn't passed in
	if (typeof e == 'undefined' && window.event) {
		e = window.event;
	}
	if (e.keyCode == 13) {
		document.getElementById('loginButton').click();
	}
}

function windowpop(url, width, height) {
    var leftPosition, topPosition;
    //Allow for borders.
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
    //Allow for title and status bars.
    topPosition = (window.screen.height / 2) - ((height / 2) + 50);
    //Open the window.
    window.open(url, "Window", "status=no,height=" + height + ",width=" + width + ",resizable=yes,left=" + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY=" + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
}

</script>


</head>
<body>
<style>
body{
background: url("images/bgnew1.jpg") repeat scroll 0% 0% transparent;
}

</style>

<%
String error="";
try{
	 error =request.getParameter("error");
	 if(error==null){
		 error="";
	 }
}catch(Exception e){
}

%>
<!--Css popup start-->
<div style="display: none;" id="blanket"></div>


<div style="display: none;" id="popUpDiv">
<div class="close"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="<%=request.getContextPath() %>/images/btn_close.gif" /></a></div>
<br /><br />


    <div id="popupwrapper">
   		<!--<div class="topbuttonholder">
        	<form><input class="button" value="Previous"   id="loginButton" type="button">	
            <input class="button" value="Next" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>-->
  		<div class="headingpop"><h3>Terms Of Use</h3></div>
        <div id="poptable">
        	<p ><strong>TERMS OF USE AGREEMENT</strong><br/>
        	  TERMS OF USE AGREEMENT is made by <strong>Freedom Wealth Solutions Pvt. Ltd.</strong> (Hereinafter referred to as "<strong>Ffreedom</strong>"), a company incorporated under The Companies Act, 1956 in India and having its registered office at 506/507, Morya Landmark ll, Opp. Infinity Mall, Link Road, Andheri (West) - 400 053 and you as user of the Services, Secure Portals and/or Websites (Hereinafter referred to as "<strong>User</strong>")<br/><br/>
           <b> DEFINITIONS</b><br/>
"Services" means online access to Freedom Financials Intermediary Infrastructure Platform, its portals, websites, modules, features and related services.<br/><br/>
"Using" means to access, install, or otherwise benefit from using the functionality of the services.
"User" means any person who obtains Services or Website for his own purpose or on behalf of someone else and includes any legal entity that obtained the service and on whose behalf it is used.
"Online Platform" means <a href="www.fi-i.com">www.fi-i.com</a> online platform and related portals, other FFreedom holding and subsidiary company websites, securely accessed Portals and all web-pages appearing, appended, available along with this online platform.<br/>
<br/>
<b>USE OF THE ONLINE PLATFORM</b><br/>
User is hereby allowed to use the Online Platform subject to the terms and conditions of this Terms of Use Agreement, Privacy Policy and any other terms and conditions to be made applicable to the Online Platform (together "Online Platform Usage Frame"). Any new terms and conditions which will be applicable to the Online Platform may be incorporated as part of Online Platform Usage Frame. In case there is any conflict between the Terms of Use Agreement and other policies the Terms of Use Agreement will govern.<br/><br/>
The words "use" or "using" in this Terms of Use Agreement, means any time an individual (a "user"), directly or indirectly views the Online Platform and uses for any other purpose.<br/><br/>
User conveys acceptance to Online Platform Usage Frame everytime the User uses the Online Platform. User has discretion not to use the Online Platform, so in terms User's use of the Online Platform despite the right and power not to use, it is construed that the User has accepted the Online Platform Usage Frame.<br/><br/>
Ffreedom retains the right to change Terms of Use Agreement from time to time and such modification will be effective from when it is published. Everytime you use the Online Platform, shall constitute your acceptance of changes made to Terms of Use Agreement.<br/><br/>
Ffreedom can provide User, subject to acceptance of terms and conditions of the Online Platform Usage Frame and payment of fees as may be applicable, at its sole discretion the User Name and Password ("User Account"). Ffreedom solely reserves the right to accept or reject application without obligation of explanation. Ffreedom reserves the right to store, evaluate, anlayse, verify, and authenticate the Personal information and data provided by the User. The User acknowledges hereby that Ffreedom continues to maintain right to close the User Account without any notice for any reasons whatsoever it may be.<br/><br/>
<b>OWNERSHIP OF INTELLECTUAL PROPERTY</b><br/>
Online Platform Usage Frame is the intellectual property of Ffreedom its affiliates, subsidiaries, licensors, suppliers, service providers, vendors, advertisers, promotional partners, or sponsors and are legally protected, without limitation, under Indian Laws as well as applicable foreign laws, regulations and treaties. You must not alter, delete or conceal any copyright or other notices contained on the Software, Online Platform, including notices on any Online Platform Matter you download, transmit, display, print or reproduce from the Online Platform. You shall not, nor will you allow any third party (whether or not for your benefit) to reproduce, modify, create derivative works from, display, perform, publish, distribute, disseminate, broadcast or circulate to any third party (including, without limitation, on or via a third party Online Platform), or otherwise use, any Online Platform Matter without the express prior written consent of Ffreedom. Any unauthorized or prohibited use of any Online Platform Material may subject you to civil liability, criminal prosecution, or both, under applicable civil and/or criminal and/or any other laws and regulations.<br/><br/>

If you believe that the Online Platform contains elements that infringe your intellectual property rights in your work, please notify us immediately. If we receive intellectual property right infringement claim notification, and it is felt appropriate, we may remove all such content which is indicated as infringing and/or take any other appropriate action.<br/><br/>
<b>USER </b> <br/>
IPR of User: Ffreedom does not claim any ownership in any of the content, including any text, data, information, images, photographs, video, or other material, that you upload, transmit or store on the Online Platform.<br/><br/>
<b>RULES OF CONDUCT</b><br/>
The Services and the Online Platform is to be used solely for your exclusive, non-assignable, non-transferable and limited personal use and for no other purposes. Your use of the Services and Online Platform is subject to all applicable local, state, national laws and regulations and international treaties wherever applicable. You shall not use, allow, or enable others to use the Services and Online Platform, or knowingly condone use of this Online Platform by others, in any manner that is, attempts to, or is likely to:</p>
<div id="poptablelist" style="width:90%">
<p>
	<ul>
<li>    Impersonate somebody that your real entity, fake identity or any combination of both or anything related to fake or improper impersonation.<br/></li>
 <li>Be ethically not acceptable, violates laws and regulations of any state, country.<br/></li>
  <li>Affect reputation of the Online Platform or any other party in whatsoever manner.<br/></li>
   <li>    Send or result in the transmission of SPAM, junk e-mail, chain letters, duplicative or unsolicited messages, or so-called "spamming" and "phishing";<br/></li>
    <li>Transmit, distribute or upload programs or materials that contain malicious code, such as viruses, timebombs, worms, trojan horses, spyware, or other potentially harmful programs or other material or information;<br/></li>
   <li> Upload or distribute any data, information or content that is not developed by you, or without obtaining appropriate licence or permissions.<br/></li>
   <li>Upload any content defamatory, or violative of privacy or publicity rights, or contents showing or stating pornographic, discrimination on sex, religion, skin color, race, nationality or any other socially undesirable material.<br/></li>
   <li> Modify, disrupt, impair, alter or interfere with the use, features, functions, operation or maintenance of the Online Platform.<br/></li>
   <li> Reverse engineer the Online Platform.<br/></li>
   <li> Or any other usage in inappropriate manner.<br/></li>
   </ul>
</div>
<p>
<strong>CONTENTS ON THE ONLINE PLATFORM</strong><br/>
The Online Platform may provide a facility to the User to post your contents - data, emails, photographs, blogs, comments, opinions, expressions, chat text, or any other text on the Online Platform whether by use of Services or otherwise ("the Content"). The Online Platform at sole discretion has right to display fully or partially or not to display the Content. User confirms that the Content is Users work and possesses necessary rights and licenses to display the Content on the Online Platform. User acknowledges that Ffreedom retains the right to delete such contents without any notice or explanation. User acknowledges that the Content once displayed on the Online Platform is beyond control of Ffreedom and it will be open for view by any other User.<br/><br/>
As a User if you find some material which is written about you, your work, or related to you in some manner and if you feel it as derogatory, malicious, wrongful or in any manner discomforting you, do notify us. If necessary, we may delete such content posted on the Online Platform.<br/><br/>
<strong>ADVERTISEMENTS</strong><br/>
The Online Platform will also post, display, publish or provide links of advertisements of Advertisers. Ffreedom doesn't endorse the advertisements or advertisers or quality, suitability, merchantability, fitness, warranties of the product and/or services offered by such advertisers. User shall directly deal with the Advertisers.<br/><br/>
<strong>LINKS TO THIRD PARTY SITES</strong><br/>
We may provide links of other websites on the Online Platform, without any warranty, merchantability, endorsement, suitability, any assurance of quality, authenticity, and appropriateness to view such websites and responsibility, liability, obligations on part of the Website.<br/><br/>
<strong>DISCLAIMER  AND LIMITATIONS OF LIABILITY</strong><br/>
THIS SERVICE, ONLINE PLATFORM, AND ALL MATERIALS, PRODUCTS AND POSTINGS ARE MADE AVAILABLE ON AN "AS IS" AND "AS AVAILABLE" BASIS, WITHOUT ANY REPRESENTATION OR WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, OR ANY GUARANTEE OR ASSURANCE. THE SERVICES OR ONLINE PLATFORM WILL BE AVAILABLE FOR USE, OR THAT ALL PRODUCTS, FEATURES, FUNCTIONS OR OPERATIONS WILL BE AVAILABLE OR PERFORM AS DESCRIBED. THE SERVICES, THE ONLINE PLATFORM ARE NOT HACK PROOF. THE DATA MAY GET PILFERED, DAMAGED, LOST, GARBLED OR BECOME USELESS DUE TO UNLAWFUL ACTIVITIES BEYOND CONTROL OF Ffreedom. Without limiting the foregoing, we are not responsible or liable for any malicious code, delays, inaccuracies, errors, or omissions arising out of your use of the Online Platform. You understand, acknowledge and agree that you are assuming the entire risk as to your data, quality, accuracy, performance, timeliness, adequacy, completeness, correctness, authenticity, safety, security and validity of any and all features and functions of the Online Platform, including, without limitation, postings and Materials associated with your use of the Online Platform.<br/><br/>
YOU UNDERSTAND AND AGREE THAT, TO THE FULLEST EXTENT PERMISSIBLE BY LAW, THE ONLINE PLATFORM, Ffreedom, THE PARENT COMPANIES, OR THEIR RESPECTIVE SUCCESSORS AND ASSIGNS, OR ANY OF THEIR SUBSIDIARIES, AFFILIATES, OR THEIR RESPECTIVE OFFICERS, DIRECTORS, EMPLOYEES, AGENTS, LICENSORS, REPRESENTATIVES, OPERATIONAL SERVICE PROVIDERS, ADVERTISERS, OR SUPPLIERS, SHALL NOT BE LIABLE FOR ANY LOSS OR DAMAGE, OF ANY KIND, DIRECT OR INDIRECT, IN CONNECTION WITH OR ARISING FROM USE OF THE SOFTWARE OR ONLINE PLATFORM OR FROM THIS AGREEMENT, INCLUDING, BUT NOT LIMITED TO, COMPENSATORY, CONSEQUENTIAL, INCIDENTAL, INDIRECT, SPECIAL OR PUNITIVE DAMAGES.<br/><br/>
Notwithstanding any claim, you specifically acknowledge and agree that your sole and exclusive remedy for any loss or damage shall be to have Ffreedom, upon written notice from you to us, attempt to correct deficient services under this Agreement and, if correction or replacement is not reasonably commercially practicable for Ffreedom, to refund any monies actually paid by you for Services or use of the Online Platform and to terminate and discontinue your use of the Online Platform. You further understand and acknowledge the liability of the Online Platform is limited to the payment received by Ffreedom in past one year. As a result, you acknowledge and agree that Ffreedom assumes no liability, responsibility or obligation to exchange of data, transmit, process, store, and receive. You shall not hold Ffreedom responsible for any third party liability incurred by you due to usage of the Software or Online Platform.<br/><br/>
<strong>INDEMNIFICATION</strong><br/>
You agree to indemnify, defend and hold Ffreedom, its parents, subsidiaries, affiliates, successors, assigns and licensors, the Online Platform, or any of their respective officers, directors, employees, agents, vendors, licensors, representatives, advertisers, service providers and suppliers harmless from and against any and all claims, actions, losses, expenses, damages and costs (including reasonable attorneys' fees), resulting from any breach or violation of this Agreement by you, or due to your activities related to the Online Platform or by usage of the Services, whether by use of User name and Password or not.
<br/><br/>
Ffreedom, its parents, subsidiaries, affiliates, assigns and licensors reserve the right to assume, at its sole expense, the exclusive defense and control of any such claim or action and all negotiations for settlement or compromise, and you agree to fully cooperate with them in the defense of any such claim, action, settlement or compromise negotiations, as requested by the Parent Companies.
<br/><br/>
<strong>PRIVACY</strong><br/>
We respect your privacy and the use and protection of your Personal Information. Please see our Privacy Policy for important information and disclosures relating to the collection and use of your Personal Information in connection with your use of the Online Platform.
<br/><br/>
<strong>APPLICABLE LAWS</strong><br/>
This Agreement, together with any Additional Terms, Rules, our Privacy Policy and any other regulations, procedures and policies which we refer to and which are hereby incorporated by reference, contains the entire understanding and agreement between you and Ffreedom and supersedes any and all prior or inconsistent understandings relating to the Services and Online Platform and your use of the Services and Online Platform. This Agreement cannot be changed or terminated orally. If any provision of this Agreement is held to be illegal, invalid or unenforceable, this will not affect any other provisions and the Agreement will be deemed amended to the extent necessary to make it legal, valid and enforceable. Any provision which must survive in order to allow us to enforce its meaning shall survive the termination of this Agreement; however, no action arising out of this Agreement or your use of the Services or Online Platform, regardless of form or the basis of the claim, may be brought by you more than six (6) months after the cause of action has arisen (or if multiple causes, from the date the first such cause arose).<br/><br/>
 This Agreement and your use of the Services and Online Platform is governed by, construed and enforced in accordance with the laws of India applicable to contracts made, executed and wholly performed on the Online Platform, and, for the purposes of any and all legal or equitable actions, you specifically agree and submit to the exclusive jurisdiction and venue of the Courts of Mumbai, Maharashtra, India and you will not object to such jurisdiction or venue on the grounds of lack of personal jurisdiction or otherwise.<br/><br/>
 <strong>FORCE MAJEURE</strong><br/>
Without limiting the foregoing, under no circumstances shall Ffreedom be held liable for any damage or loss due to deficiency in performance of the Services or Online Platform resulting directly or indirectly from acts of nature, forces, or causes beyond its reasonable control, including, without limitation, Internet failures, computer equipment failures, telecommunication equipment failures, other equipment failures, electrical power failures, strikes, labor disputes, riots, insurrections, civil disturbances, shortages of labor or materials, fires, earthquakes, floods, tsunamis, storms, explosions, acts of God, war, governmental actions, orders of domestic or foreign courts or tribunals, nonperformance of third parties, or loss of or fluctuations in heat, light, or air conditioning.<br/><br/>
<strong>GENERAL PROVISIONS</strong><br/>
Each part of this Terms of Use Agreement is independent of each other. If any part of these Terms of Use Agreement is found void and unenforceable, it will not affect the validity of the balance of this Agreement, which shall remain valid and enforceable according to its terms. Updates may be licensed to you by Ffreedom with additional or different terms. In case of any breach of Terms of Use Agreement, Ffreedom has a right to terminate Terms of Use Agreement forthwith.<br/><br/>
<strong>IF YOU DO NOT ACCEPT AND ABIDE BY THIS TERMS OF USE AGREEMENT, YOU MUST NOT USE THE ONLINE PLATFORM AND ITS SERVICES.</strong><br/><br/>
</p>
 </div>
    

	</div>
</div>

<div style="display: none;" id="popUpDiv123">
<div class="close"><a onClick="popup('popUpDiv123')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>
<br /><br />


    <div id="popupwrapper">
   		<!--<div class="topbuttonholder">
        	<form><input class="button" value="Previous"   id="loginButton" type="button">	
            <input class="button" value="Next" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>-->
  		<div class="headingpop"><h3>Privacy Policy</h3></div>
        <div id="poptable">
        <p>
        	  This Privacy Policy sets forth the best security practices and procedures adopted by FFreedom Intermediary Infrastructure Private Limited ("FINFRA") and shall apply to the use and disclosure and sharing of sensitive personal data or information ("Personal Information") provided by the registered users of the website <a href="www.fi-i.com">www.fi-i.com</a> ("Website"), which is owned and operated by FINFRA This policy is equally applicable on the visitors to the Website. <br/><br/>
              We value the trust you have placed with us. To provide you with a convenient and safe online experience, we have implemented measures to protect the confidentiality, integrity, and security of your Personal Information, its storage and transmission through the World Wide Web. This Privacy Policy explains how we protect Personal Information provided by you through the Website and how we store and use that information, to deliver the services on the Website.<br/><br/>
           <b> Personal Information</b><br/>
It is mandatory to register in order to use the Website. The Website constitutes of all FINFRA operated online portals, applications and systems available to all registered users and accessible from the world wide web. All Platform services and facilities are available only to registered Website users. If you intend to use the services provided by our Website and/or register online for any of our services, it is at your own volition, risk and after reading and confirming it to this Privacy Policy and Terms of Use. <br/><br/>
>From time to time, the Website may also request other Personal Information to provide you with other benefits of the Services. On all such occasions, you will have the opportunity to provide or to decline to provide that Personal Information.<br/><br/>
At the time of registration, you will share certain Personal & KYC Information with us. Such Personal Information may include your personal identifiable information such as your name, address, telephone, address, your e-mail ids, your risk profile created by us or generated by any system, and any other proprietary information which you may share.
<br/><br/>
In case you participate in services and facilities provided by the Website, you will be required to provide additional information as per the rules and regulations pertaining to such services and facilities. Such information will also remain in our database and will be considered as your Personal Information.
<br/><br/>
In case after registration you wish to delete your account, you may do so. All your Personal Information will be deleted from our Website and expunged from our databases. Further access to your account will be removed with immediate effect. Notwithstanding anything above, portions of your data, consisting aggregate data derived from your Personal Information, may remain on FINFRA servers and databases indefinitely. Your data may also remain on the backup servers or media. FINFRA keeps these backups to ensure our continued ability to provide the Services to you in the event of malfunction or damage to primary production servers.
<br/><br/>

<b>Protection of Information and storage</b><br/>
As a matter of security, we take back-up of systems periodically. Only authorized personnel are allowed to have access to the Website related databases. <br/><br/>

<b>Cookies</b><br/>
We may place a text file called a "cookie" in the browser files of your computer. The cookie itself does not contain Personal Information although it will enable the Website to relate your use of the Website to information that you have specifically and knowingly provided to the Website. The Cookies enable us to remember you, your choices and some data field contents which you would be required to fill-in. <br/><br/>

<b>Advertisements </b> <br/>
On our Website, we may post advertisements provided by Advertisers & Sponsors. These Advertisers might set cookies on their Website. We are not responsible for any of these Advertisers. You on your entire risk and volition are advised to deal with the Advertisers if you intend to. By allowing such advertisements we do not recommend or market or warranty the Advertisers, quality, commitment, deliverables, fitness to consumption, reasonability and Advertisers commitment to protect your Personal Information. <br/><br/>
<b>Third Party Services and Websites</b><br/>
>From time to time, FINFRA may permit third parties to offer subscription and/or registration-based services through the Website. FINFRA is not responsible for any actions or policies of such third parties, and you should check the applicable privacy policy of such third party when providing personally identifiable information. Further, FINFRA will not be responsible if you do not get the benefits announced, if any, by the third parties permitted to offer subscription and registration based services on its Website.<br/><br/>


<strong>Pre-approved Sharing of Personal Information</strong><br/>
We endeavour to protect your Personal Information. Only subject to your prior approval, we may share your Personal Information with our service providers and our business partners only in a non-personally identifiable manner. After your approval , Personal Information could be shared so that you may receive news letters, offers, information about new products, services, launches, facilities, schemes and other information, if applicable. The information collected from you and other users may be analysed in different manners. We may also share such analysis with our services providers and our business partners. <br/><br/>
In case we are required to disclose your Personal Information in order to assist the Government Authority or in adherence to the Court or to protect the interest of the Website and/or any particular user(s), we will disclose it without obtaining prior permission from you. You authorize us to disclose your Personal Information. 
<br/><br/>
<strong>Changes to Privacy Policy</strong><br/>
We have and continue to have the right to modify, change or update Privacy Policy at any time by sufficiently highlighting on the Website about such change. However, we will use your Personal Information in a manner consistent with Privacy Policy at the time you shared Personal Information. You are encouraged to check the Website often to get updated about Privacy Policy. You acknowledge that by virtue of usage of the Website you provide acceptance of the Privacy Policy. <br/><br/>

</p>
 </div>
 </div>
 </div>

<!-- <script>
$('.logo').css('z-index','9999999999999999');
</script> -->
<input type="hidden" id="contextPath" value="<%=request.getContextPath() %>">

 <div class="row" style="background-color: #B13966">
      <div class="headstrip"></div>
      <div class="container">
	  <div style=" width: 1170px;  height: 93px;  margin: 0px auto;">
	  <div id="logo_f" class="logo" style="background:url('<%=request.getContextPath()%>/images/BU_Logo.png') no-repeat;background-size:100% !important;width: 250px;height: 70px; margin: 20px 0px 10px 7px; background-position:-13px 3px;"></div></div>
      
<!--       	<div class="starter">  -->
<!--         	<h2>Sign in to your account</h2> -->
<!--         </div> -->
        <div align="col-xs-6 col-md-4">
         <div class="login-form" style = "margin-top: 30px;">
         		<h3 style="margin-bottom: 10px;">Sign In</h3>
         		
         		
         		<form id="login_form" class="fr" method="post"  action="<core:url value="/j_spring_security_check"/>">
        <ul class="reset" style="list-style-type: none;padding-left: 2px;">
         <p>
           <core:if test="${not empty param.error}">
				<font color="red">
					Login error. <br />
					Reason : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
				</font>
			</core:if>
			
			<core:if test="${not empty param.val_param}">
				<font color="red">
					
					Reason : Session Timeout
				</font>
			</core:if>
			
       	</p> 
          <li class="user_li">
            USERNAME<br/>
            <input type="text" class="fr" name="j_username"  autofocus required/>
            <div class="clr"></div>
          </li>
          <li class="pass_li">
            PASSWORD<br/>
            <input type="password" name="j_password" required/>
            <div class="clr"></div>
          </li>
          <li class="clearfix login_li">
<!--             <div class="fl"> -->
<!--               <input type="checkbox" class="remember" id="remember"  name="_spring_security_remember_me" checked/> -->
<!--               <span id="custom_check" class="custom_check"></span> <span class="remember_txt">Remember me</span> </div> -->
            <div class="fr">
            <br/>
              <input type="submit" value="LOGIN" class="login_btn"/>
               
            </div>
           
          </li>
          <li class="clearfix"><a href="<%=request.getContextPath()%>/forgotPassword.htm?page=shubhchintak" class="forgot fr" > <br/>Forgot your password?</a></li>
          <li><br/>
               <a href="https://www.facebook.com/axismfexpertslounge" style="color: #428bca; padding-left: 80px;" target="_blank">Connect with us 
<img src="<%=request.getContextPath() %>/images/facebook.png" alt="" style="height: 25px; "> </a></li>
        </ul>
      </form>
         </div>
      </div>
</div>
</div>
	  <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
<!--       <ol class="carousel-indicators"> -->
<!--         <li data-target="#myCarousel" data-slide-to="0" class=""></li> -->
<!--         <li class="" data-target="#myCarousel" data-slide-to="1"></li> -->
<!--         <li class="active" data-target="#myCarousel" data-slide-to="2"></li> -->
<!--       </ol> -->
      <div class="carousel-inner">
        <div class="item active">
        <img src="<%=request.getContextPath() %>/images/Subhchintak_Banner.gif" >
         <!-- <img src="" data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">--.
          <div class="container">
          <!--  <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget 
quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor 
id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>-->
          </div>
        </div>
      </div>
     <!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>-->
    </div><!-- /.carousel -->

	
            

       
       
            

	<div class="row" style="margin-bottom: 75px;">
    <div class="container">
    	<div class="col-xs-12 col-md-8 ">
		<div class="leftside margintop">
                	<h2>Videos</h2>
                      <ul>
                    	<li>
							<p style="width: 240px;  height: 17px;  text-align: left !important;  overflow: hidden !important;">The role of Shubhchintaks in educating investors</p>
							<iframe width="242" height="137" src="https://www.youtube.com/embed/watch?v=CQTJevJBDHM&index=1&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u&showinfo=0"></iframe></li>
                        <li> 
							<p>Revolutionizing investment planning</p>
							<iframe width="242" height="137" src="https://www.youtube.com/embed/watch?v=DNx-tgueYmQ&index=4&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u&showinfo=0"> </iframe></li>
						<li>
							<p>The art of discovering capturing dreams</p>
							<iframe width="242" height="137" src="https://www.youtube.com/embed/watch?v=C61JSm6omTU&index=6&list=PLEhtzo1XHPL14G3WfYJDbV4Vjys11Vi1u&showinfo=0"></iframe></li>
						
						
<!-- 						<li><iframe width="242" height="137" src="https://youtube.com/embed/pgk7-Etcl5g"></iframe></li> -->
<!--                         <li> <iframe width="242" height="137" src="https://youtube.com/embed/ZEYxRG9Ai90"> </iframe></li> -->
<!-- 						<li><iframe width="242" height="137" src="https://youtube.com/embed/GVHq-HlCOxI"></iframe></li> -->
                    </ul>
                    
                     
                    	
                   
                 
      </div>        
        </div>
        
	  	<div class="col-md-4 col-sm-12 ">
        
       <div class="rightside margintop" style="width:340px; height: 140px; overflow-y: auto; overflow-x: hidden; ">
                 
                 <h2>Quick Links</h2>                 
                    <div id="list">
<%--                     <style> --%>
<!--  	.mc_head { font-family:Arial; font-size:12px; color:#FFFFFF; text-decoration:none } */
/* 	.mc_head:hover { font-family:Arial; font-size:12px; color:#FFFFFF; text-decoration:underline } */  -->
<%-- 	</style> --%>
<!-- 	<table cellspacing='0' cellpadding='0' style='border-width:1px; border-style:solid; border-color:#736D63' border=0 bgcolor='#FFFFFF' width='300px' height='250px'> -->
<!-- 	<tr bgcolor='#736D63'> -->
<!-- 	<td height='18px' align=left colspan=4 class='mc_head'>&nbsp;&nbsp;<B>Market News from <a href='https://www.moneycontrol.com' class='mc_head'>Moneycontrol.com</a></B>&nbsp;</td>	 -->
<!-- 	</tr> -->
<!-- 	<tR><td align=left valign=top> -->
<!-- 	<iframe id='mc_feed' name='mc_feed' src='https://www.moneycontrol.com/moneycontrol_feeds/preview.php?category=Market News&ref=mc_feed&title_size=12px&title_bold=Yes&summ_size=11px&font_family=Arial&num_news=10&show_description=Yes&fcolor=000099&desccolor=333333&datecolor=999999&boardercolor=736D63&backgroundcolor=FFFFFF&show_images=Yes&show_dates=Yes&format=300x250' framespacing='0' frameborder='no' scrolling='auto' allowtransparency='true' width="300px" height="250px"></iframe> -->
<!-- 	</td></tr> -->
<!-- 	</table> -->
               
                    <ul id="rssFeeds">
                   	<!--<li><a target="_blank" href="https://axismf.com/Downloads/BondMarketReview_Axis.pdf">Get an update on debt markets</a></li>
                   	<li><a target="_blank" href="https://axismf.com/Mutual-Fund/Index.aspx ">Planning for child education? Try Pehla Kadam</a></li>
                   	<li><a target="_blank" href="https://axismf.com/Mutual-Fund/Funda-Singhs-Fundas.aspx">Know Funda Singh's Fundas</a></li>
                   	<li><a target="_blank" href="https://axismf.com/common/kalse.aspx">Understand how compound interest affects you with Kal Se calculator</a></li>
                   	<li><a target="_blank" href="https://axismf.com/common/powerof1000.aspx">See the difference those extra 1000 rupees make in the long run. Try</a></li>
                   	<li><a target="_blank" href="https://axismf.com/Flash/EatingoutTool.html">Did you know that cutting down on just 1 outing a month starting from age 25 could get you? Try Eating Out calculator</a></li>
					-->
					<li><a target="_blank" href="https://www.axismf.com/Downloads/Outlook2015.pdf ">Outlook 2015</a></li>
                   	<li><a target="_blank" href="http://zimmedar.me/healthcarekit/#/0">An investment guide for better health</a></li>
                   	<li><a target="_blank" href="https://www.axismf.com/downloads/GlobalEducationGuide.pdf ">Plan for children's education with Pehla Kadam</a></li>
                   	<li><a target="_blank" href="https://www.axismf.com/Downloads/Emailer/Retirement%20Brochure.pdf ">Investment planning for retirement</a></li>
                    </ul>
              
<!--                      <a href=""> More... </a><br>                       -->
<%--                       By<img src="<%=request.getContextPath()%>/images/moneycontrol_logo.png">     --%>
                      </div>                              
                        
                     </div>
                </div>
            </div>
        </div>

<jsp:include page="footer.jsp" />
<style>
#footercontainer1 {
/* 	position:absolute; */
/* 	top:86%; */
/* 	left:0%; */
/* 	width:100%; */
     position:fixed; 
     left: 0; 
     bottom: 0; 
     height: 70px;
     width: 100%; 
     background-color: #F2F2F2 !important;
      }
</style>
</body>
</html>
