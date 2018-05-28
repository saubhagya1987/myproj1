<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Partner Setup -Notification</title>
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
 
  <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
 
    


<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/popup.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css"> --%>
<link href="<%=request.getContextPath()%>/css/custom.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/basic.css" rel="stylesheet" type="text/css">
<!-- -responsive css-->
<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script> --%>
<script src="<%=request.getContextPath()%>/js/toggles.js"></script>
<%-- <script src="<%=request.getContextPath()%>/js/jquery_ui_range_slider.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/js/perfect-scrollbar.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/js/selectboxit.js"></script> --%>




<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">


<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

<!-- custom scroll to "common_in_content" -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/selectboxlt.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/perfect-scrollbar.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/responsive.css" />
<link href="${pageContext.request.contextPath}/css/diy/custom.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/my_account_submenu.js"></script>
<!--<script src="js/diy/jquery.ddslick.js"></script>-->
<%-- <script src="${pageContext.request.contextPath}/js/diy/jquery_ui_range_slider.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.autosize.input.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.slimscroll.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/selectboxit.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/diy/plugin/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/common/common.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/common_modal.js"></script> --%>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/recommedation.css" />

</head>
<body>
 <script>
 var $jq_1_9_1 = $.noConflict();
 $(function() {
// 	 $( "#tabs" ).tabs();
// 	    $('.ui-tabs-panel').perfectScrollbar();
});


  </script>
<style>

#advice_recommendation_in .column_left {
    background-image: url('../../images/diy/advice_reco_bg.png');
    background-repeat: no-repeat;
    height: 462px;
    width: 468px !important;
    float: left;
    background-position: 82px 193px;
}


#advice_recommendation_in .advice_recommendation_dc #risk_cover {
    left: 10%;
    top: 7%;
}

#advice_recommendation_in .advice_recommendation_dc #loan_planning {
    top: 6%;
    left: 31%;
}



#advice_recommendation_in .advice_recommendation_dc #emergency_planning {
    left: 0%;
    top: 22%;
}

#advice_recommendation_in .advice_recommendation_dc #goal_plan {
    left: 21%;
    top: 22%;
}

#advice_recommendation_in .advice_recommendation_dc #tax_planning {
    top: 22%;
    right: 41%;
}

#advice_recommendation_in .advice_recommendation_dc #succession_planning {
    top: 36%;
    left: 10%;
}

#advice_recommendation_in .advice_recommendation_dc #vacation_planning {
    top: 36%;
    left: 31%;
}


.content.common_content #advice_recommendation_in .advice_recommendation_dc .head {
    font-family: "allerregular";
    font-size: 9px;
    color: #3E3E3A;
    position: absolute;
    text-align: center;
    top: 32%;
    width: 90%;
    font-weight: 700;
}

#advice_recommendation_in .advice_recommendation_dc .category .hit_area span {
    color: #3E3E3A;
    font-size: 9px;
    font-family: "allerregular";
    display: block;
    position: absolute;
    text-align: center;
    top: 46%;
    left: 10%;
    width: 77%;
}

#help_tips_top .help_tips_top_in {
background-color: #CA93A9;
height: 25px;
line-height: 25px;
text-align: center;
font-size: 15px;
color: #000;
font-family: verdana;
font-weight: bold;
}

#advice_recommendation_in #tabs .heading {
    margin: 0px 0px 10px;
    color: #942754;
    font-size: 13px;
    font-weight: bold;
}

#advice_recommendation_in #tabs p{
 font-size: 11px;
    font-weight: bold;
text-align:left;
}
</style> 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;"><span style="float:left;">Partner Setup </span>
           </div >
          </div >
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      
        <!-- center -->
      
      <jsp:include page="sidebar_setup.jsp"></jsp:include>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Product Recommendation </a>
               
<div class="list-group-item">
<div class="row">
	<div class="col-md-12 ">
<!-- Recommdendation Start -->   
  <section class="content common_content">
         
     <section class="in_content clearfix" id="advice_recommendation_in"> 
        <!-- DC submenu Ends-->
        
        <div class="column_left clearfix">
          <div class="advice_recommendation_dc">
            <div class="category" id="risk_cover"><a class="hit_area" href="${pageContext.request.contextPath}/partner/recommendation/riskCover">
              <h4 class="head">Risk Cover</h4>
              <span>It doesn't matter how hard you hit if you cannot take a punch...</span></a></div>
            <div class="category" id="loan_planning"><a class="hit_area" href="${pageContext.request.contextPath}/partner/recommendation/loans">
              <h4 class="head">Loans</h4>
              <span>Loans are both good and bad...</span></a></div>
            <div class="category" id="goal_plan"><a class="hit_area" href="${pageContext.request.contextPath}/partner/goalPlanning">
              <h4 class="head">Goal Plan</h4>
              <span>Setting goals and investing for goals in-stills discipline and focus...</span></a></div>
            <div class="category" id="tax_planning"><a class="hit_area" href="${pageContext.request.contextPath}/partner/taxPlanning">
              <h4 class="head">Tax Planning</h4>
              <span>Paying tax is a responsibility, saving tax is a right...</span></a></div>
            <div class="category" id="emergency_planning"><a class="hit_area" href="${pageContext.request.contextPath}/partner/recommendation/emergencyPlanning">
              <h4 class="head">Emergency Planning</h4>
              <span>Accidents or health setbacks can happen to anyone and the need for large...</span></a></div>
            <div class="category" id="vacation_planning"><a class="hit_area" href="${pageContext.request.contextPath}/partner/vacationPlanning">
              <h4 class="head">Vacation Planning</h4>
              <span>Lorem ipsum dolor sit
              amet, consectetur adipis
              cinglor sitelit ipsum dolor...</span></a></div>
            <div class="category" id="succession_planning"><a class="hit_area" href="${pageContext.request.contextPath}/partner/successionPlanning">
              <h4 class="head">Succession Planning</h4>
              <span>Planning to smoothly pass on your assets is as important as life insurance itself...</span></a></div>
          </div>
          <div class="clr"></div>
        </div>
        <div class="column_right clearfix">
          <div id="help_tips_top" class="clearfix">
            <div class="help_tips_top_in">HELP TIPS</div>
          </div>
           <div id="tabs">
  <ul class="reset clearfix">
    <li id="risk_cover_tab"><a href="#risk_cover_content"></a></li>
    <li id="loans_tab"><a href="#loans_tab_content"></a></li>
    <li id="emergency_planning_tab"><a href="#emergency_planning_contnent"></a></li>
    <li id="goal_plan_tab"><a href="#goal_plan_content"></a></li>
    <li id="tax_planning_tab"><a href="#tax_planning_contnet"></a></li>
    <li id="succession_planning_tab"><a href="#succession_planning_content"></a></li>
    <li id="vacation_planning_tab"><a href="#vacation_planning_contnet"></a></li>
  </ul>
  <div id="risk_cover_content">
  <h3 class="heading">Risk Cover</h3>
   <p class="strong"> "It doesn't matter how hard you hit if you cannot take a punch"</p>  

<p>Assets are built with a lot of hard work. But it takes just one unfortunate event like a health crisis or a freak accident to wipe it all away.</p>

<p>Protecting your key assets from common risks is as important if not more important, than building more assets.</p>

<p class="strong northspace1">Key assets are </p>
<ul>
<li>Earning capacity of an individual</li>
<li>Physical or other assets that generate income  / save costs</li>
</ul>

<p class="strong">Common risks </p>
<p class="strong">That impact earning capacity of an individual are</p>
<ul>
<li>Early death</li>   <li> Critical illnesses</li>     <li>Accidents</li>    <li>Health setbacks</li>
<p class="strong">That can destroy assets that generate income are</p>
<li>Natural calamities</li>    <li>Man made mischief</li>    <li>Law suits</li>
</ul>

<p>Insurance is the most economical way of protecting most risks. </p>
  </div>
  <div id="loans_tab_content">
   <h3 class="heading">Loans</h3>
   <p>Loans are both good and bad.</p> 
<p>Good because they help you purchase big assets without having all the money and yet enjoying most of the wealth the asset creates.</p>
<p>Bad because, you have to bear the interest cost and there is constant pressure on cash flows.</p>
<p>Managing loans better can substantially improve your financial situation. </p>
<p class="strong northspace1">A few ways to managing loans responsibly are :</p>
 <ul>
<li>Borrow only when it will improve your net worth</li>
 <li>Borrow at competitive costs</li>
 <li>Repay on time avoiding penalties</li>
 <li>Pay off loans earlier if you can </li>
 <li>Maintain all paperwork diligently</li>
 <li>Check your credit rating scores on a periodic basis </li>

</ul>
  </div>
  <div id="emergency_planning_contnent">
   <h3 class="heading">Emergency Planning</h3>
    <p>Emergencies can happen. We have in our lifetime witnessed earthquakes, tsunamis, cyclones, deluge and a few other natural calamities which have thrown many peoples' life in disarray. Accidents or health setbacks can happen to anyone and the need for large amounts of money in short notice may arise, followed by long periods of income loss.</p>

<p class="strong northspace1">Creating an emergency fund will help to</p>
<ul>
<li>Avoid borrowing</li>
<li>Avoid distress selling of assets</li>
<li>Avoid use of assets meant for some other goals</li>
</ul>

<p class="strong">How much Emergency funds a person needs to be decided on the following basis</p>
<ul>
<li>More the number of sources of income lesser is the amount required</li>
<li>More stable income with better employment benefits lesser is the amount required</li>
</ul>

<p>However an amount equivalent to atleast <strong>6 times household expenses</strong> is strongly recommended. And it is best to maintain that amount in safe and accessible investments like</p>
<ul>
<li>Liquid funds</li>
<li>Bank fixed deposits</li>
<li>Savings bank account</li>
</ul>

  </div>
  
  <div id="goal_plan_content">
   <h3 class="heading">Goal Plan</h3>
   <p> Setting goals and investing for goals instills discipline and focus to the whole exercise of investment planning.</p>
<p>Once investments are aligned to goals, the need for action is triggered not by market movements not in our control but on life events, more in our control.
</p>
<p class="strong northspace1">The Steps to Goal based planning are :</p>
<ul>
<li>Identify and name the Goal</li>
<li>Specify when you would like the goal achieved</li>
<li>Specify how much if might cost if the goal is to be achieved today</li>
<li>Check if existing assets can be used for this goal and calculate if that is going to be enough</li>
<li>If yes, provide for regular rebalancing of assets and ensure that asset can be converted to cash and used at the time of goal</li>
<li>If not, depending on time to goal and risk profile, arrive at additional investments to be made to meet the goal</li>
<li>Choose the right investment options and begin investing. </li>
<li>Stick to the plan till goal is reached.</li>
</ul>
  </div>
  
  <div id="tax_planning_contnet">
    <h3 class="heading">Tax Planning</h3>
    <p>"Paying tax is a responsibility, saving tax is a right"</p>
<p>All income whether salary or business income or rent or interest or lottery – are all subject to income tax.</p>
<p>Tax laws undergo regular change. With some expert help and advance planning you could save some money from the taxman and invest it for your own future use.</p>


  </div>
  
  <div id="succession_planning_content">
    <h3 class="heading">Succession Planning</h3>
  <p> Planning to smoothly pass on your assets is as important as life insurance itself.</p> 
<p class="strong">A well designed succession plan provides for</p>
<ul>
<li>Giving enough knowledge to the family on details of assets available</li>
<li>Making certain assets easily available to family when you can't operate it yourself (emergency situations)</li>
<li>In the unfortunate event of death, all dependents get easy access to the wealth you would like them to have.</li>
</ul>
<p>Succession Planning is a specialized and complex area and seeking expert help is recommended.</p>

  </div>
  
  <div id="vacation_planning_contnet">
   <h3 class="heading">Vacation Planning</h3>
  </div>
  
</div>
   <div id="help_tips_bottom" class="clearfix"> 
<div class="clr"> </div>
</div>      
          
        </div>
      </section>
    </section>    
      
      
      
<!-- Recommdendation End -->   
	 </div>
</div>
<span style="float:right;"><br>
                  </span></div>
        	
     </div>
    </div>
</div>
</div></div>      	<br/><br/>
       	</div>
</div>
      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />

</body>
</html>