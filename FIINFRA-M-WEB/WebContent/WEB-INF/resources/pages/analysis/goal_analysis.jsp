<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Car Goal Analysis</title>
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />

<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/my_account_submenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.slimscroll.js"></script> --%>
<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
  
    $('.analysis_parent .legacy').slimScroll();
	$('.analysis_parent .analysis_description').slimScroll();
  });

</script>
<!-- custom scroll to "common_in_content" -->

</script>
<!-- intilazie custom checkbox starts-->
<script>
$(document).ready(function(){
$('.toggle').toggles();
 //assets accessible AND distributed value Slider
	  createSlider('#succession_rating',1,5,1,"#S_R_Value")
}) 
</script>
<!-- intilazie custom checkbox ends-->

</head>
<body>
<!-- Wrapper starts-->
<div class="wrapper" id="purchase_car"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Header Starts-->
    <header class="common_header inner_header">
      <section class="top_header clearfix"> <a href="#" class="setting fr"></a>
        <div class="logout_pop_up"><a href="#" class="myaccount_btn"><span class="my_acc_icon"> </span> <span class="my_acc_txt"> MY ACCOUNT</span></a> <a href="index.html" class="logout_btn"><span class="my_logout_icon"> </span> <span class="my_logout_txt"> LOGOUT</span></a> </div>
        <section class="submenu">
          <div class="menu_section">
            <ul class="clearfix reset">
              <li class="fl menu chng_prof"><a href="my-profile-personal-information.html" class="anch"><span class="icon"></span><span class="txt">Change Profile</span></a></li>
              <li class="fl menu adv_assum"><a href="advice-assumptions.html" class="anch"><span class="icon"></span><span class="txt">Advice Assumptions</span></a></li>
              <li class="fl menu chang_pass"><a href="#" class="anch"><span class="icon"></span><span class="txt">Change Password</span></a>
                <section id="password_change">
                  <form method="post" action="" name="change_password">
                    <ul class="reset">
                      <li>
                        <label>Existing Password (from email)</label>
                        <input type="password" class="pass" id="exist_pass" autofocus required>
                      </li>
                      <li>
                        <label>New Password</label>
                        <input type="password" class="pass" name="new_pass" required>
                      </li>
                      <li>
                        <label>Re-enter Password</label>
                        <input type="password" class="pass re_pass" name="re_pass" required>
                        <span class="error re_enter_error">Password did not match</span> </li>
                      <li class="clearfix">
                        <input type="submit" value="Submit" class="fl magento_btn" onclick="return validateForm()">
                        <input type="reset" value="Cancel" class="fr magento_btn" id="cancel">
                      </li>
                    </ul>
                  </form>
                </section>
              </li>
              <li class="fl menu adv_recomm"><a href="advice-recommendations.html" class="anch"><span class="icon"></span><span class="txt">Advice Recommendations</span></a></li>
               <li class="fl menu interested_fp"><a href="" class="anch"><span class="icon"></span><span class="txt">Interested FP</span></a></li>
            </ul>
          </div>
          <p class="personal"><a href="#" class="anchor">Personalization</a></p>
        </section>
        <a href="#" class="header_add add2"><img src="${pageContext.request.contextPath}/resources/images/add2.png" /></a> <a href="#" class="header_add add1"><img src="${pageContext.request.contextPath}/resources/images/add1.png" /></a>
        <div class="fl" id="logo"><a href="dashboard.html"><img src="${pageContext.request.contextPath}/resources/images/temp_logo.png" height="61" width="140" alt=""/></a></div>
      </section>
          <div class="page_header">
            <h1 class="heading clearfix"><a href="#" class="drop_menu"></a><span class="head_txt">PURCHASE A CAR</span><span class="heading_icon"><span class="head_icon"></span></span>
          <div class="desc_container">
            <input type="text" maxlength="31" class="car_description" value="Car For Vicky" data-autosize-input='{ "space":0 }'/>
            <a href="#" class="edit"></a></div>
        </h1>
          </div>
    </header>
    <!-- Header Ends--> 
    <!-- Common_content Starts-->
    <section class="content common_content">
      <div class="combined_submenu clearfix">
        <div class="partner_dashboard_submenu">
          <h4 class="heading"><a href="dashboard.html">Partner Dashboard</a></h4>
          <div class="menu_section">
            <ul class="clearfix reset ">
              <li class="menu my_config"><a href="advice-assumptions.html" class="anch"><span class="thumb"></span><span class="txt">My Configuration</span></a></li>
              <li class="menu goals"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Goals</span></a></li>
              <li class="menu contacts"><a href="list-of-contacts.html" class="anch"><span class="thumb"></span><span class="txt">Contacts</span></a></li>
              <li class="menu report"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Reports</span></a></li>
              <li class="menu task"><a href="list-of-tasks.html" class="anch"><span class="thumb"></span><span class="txt">Tasks</span></a></li>
              <li class="menu query"><a href="query.html" class="anch"><span class="thumb"></span><span class="txt">Raise a Query</span></a></li>
              <li class="menu alert"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Alerts</span></a></li>
              <li class="menu chat"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Chat</span></a></li>
            </ul>
          </div>
        </div>
        <div class="dc_dashboard_submenu">
          <h4 class="heading"><a href="data-collection.html">Data Collection Dashboard</a></h4>
          <ul class="clearfix reset first_col_menu">
            <li class="menu emergency"><a href="emergency-readiness.html" class="anch"><span class="thumb"></span><span class="txt">Emergency</span></a></li>
            <li class="menu risk_cover"><a href="risk-cover.html" class="anch"><span class="thumb"></span><span class="txt">Risk Cover</span></a></li>
            <li class="menu retirement"><a href="retirement-readiness.html" class="anch"><span class="thumb"></span><span class="txt">Retirement</span></a></li>
            <li class="menu succession"><a href="succession-readiness.html" class="anch"><span class="thumb"></span><span class="txt">Succession</span></a></li>
            <li class="menu financial"><a href="financial-readiness.html" class="anch"><span class="thumb"></span><span class="txt">Financial</span></a></li>
            <li class="menu cash_flow"><a href="cash-flow.html" class="anch"><span class="thumb"></span><span class="txt">Cash Flow</span></a></li>
            <li class="menu loan_status"><a href="loan-status.html" class="anch"><span class="thumb"></span><span class="txt">Loan Status</span></a></li>
            <li class="menu last clearfix"><a href="profile-info.html" class="anch personal_info"><span class="thumb"></span><span class="txt">Personal Info.</span></a> <a href="risk-profile.html" class="anch risk_profile"><span class="thumb"></span><span class="txt">Risk Profile</span></a> <a href="my-goals.html" class="anch my_goals"><span class="thumb"></span><span class="txt">My Goals</span></a></li>
          </ul>
          <ul class="clearfix reset sec_col_menu">
            <li class="menu education"><a href="education-goal-future-financial.html" class="anch"><span class="thumb"></span><span class="txt">Education</span></a></li>
            <li class="menu property"><a href="purchase-property-future-financial.html" class="anch"><span class="thumb"></span><span class="txt">Property</span></a></li>
            <li class="menu wedding"><a href="wedding-goal.html" class="anch"><span class="thumb"></span><span class="txt">Wedding</span></a></li>
            <li class="menu car"><a href="car-goal.html" class="anch"><span class="thumb"></span><span class="txt">Car</span></a></li>
            <li class="menu travel"><a href="travel-n-vacaction-goal.html" class="anch"><span class="thumb"></span><span class="txt">Travel</span></a></li>
            <li class="menu business"><a href="business-goal.html" class="anch"><span class="thumb"></span><span class="txt">Business</span></a></li>
            <li class="menu special_goal"><a href="special-goal.html" class="anch"><span class="thumb"></span><span class="txt">Special Goal</span></a></li>
            <li class="menu other"><a href="other-goal.html" class="anch"><span class="thumb"></span><span class="txt">Other Goal</span></a></li>
          </ul>
          <div class="clr"></div>
        </div>
        <div class="contact_configuration_submenu">
          <h4 class="heading"><a>Contact Configuration</a></h4>
          <div class="menu_section">
            <ul class="clearfix reset ">
              <li class="menu coantact_setting"><a href="#" class="anch"><span class="thumb"></span><span class="txt">Contact Settings</span></a></li>
             <!-- <li class="menu contact_rec"><a href="#" class="anch"><span class="thumb"></span><span class="txt"> Contact Recommendations</span></a></li>-->
              <li class="menu interested_fp_config">
					<a href="${pageContext.request.contextPath}/partner/getInterstedFpSection" class="anch"><span class="thumb"></span><span class="txt">FP Section</span></a>
				</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- Common_in_contnet starts-->
      <section class="in_content analysis_page common_in_content clearfix" id="succession-readiness-analysis">
        <div class="analysis_parent">
          <div class="first_column">
            <h2 class="heading">first take</h2>
            <div class="thumb thumb_down"></div>
          </div>
          <div class="second_column">
            <h2 class="heading">Analysis</h2>
            <div class="analysis_one_car_goal">
            <div class="ana_title_year">2014</div>
            <div class="ana_title_amt">[4,54,545/-]</div>
            
           <div class="analysis_one_car_goal_img"> <img src="${pageContext.request.contextPath}/resources/images/ana_danger.png" width="67" height="96" alt=""></div></div> 
            
            <div class="analysis_middle_car_goal"><div class="car_ana_title"> in <span class="car_ana_title_active">2020</span> You will need
 an amount of<span class="car_ana_title_active">
10,51,390</span> for
achieving your goal</div>
         </div>
            <div class="analysis_third_car_goal">
                        <div class="ana_title_year">2020</div>
            <div class="ana_title_amt">[10,51,390/-]</div>

             <div class="analysis_third_car_goal_img">  <img src="${pageContext.request.contextPath}/resources/images/ana_com.png" width="123" height="152" alt=""></div></div><div class="clr"></div>
          </div>
          <div class="clr"></div>
          <div class="first_row">
          
          <div class="Car_Des"><div class="title">Description</div>
         <p class="txt">Whatever you are doing now will help you accumulate <span class="txt_act">60%</span> of the total amount you will need.</p>          </div>
         
         <div class="Car_Scale"><div class="title">Achievement Scale</div>
         <div class="label">Value of Allocated
Assets</div> 

 <div class="range"><div class="range_label_min">2014</div><div class="range_label_max">2030</div><div class="progress_bar"><div class="range_label">60%</div></div></div></div>         </div>
         
         </div> 
     
     </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
            <li class="fl list"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="retirement-readiness.html" class="back navgation"><span class="txt">Back</span></a> <a href="financial-readiness.html" class="next navgation"><span class="txt">Next</span></a></section>
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<!-- Emergency Confidence range value calculator starts --> 
<script>
  $("input[name='confidence_input']")
    .each(function () {
      var input = $(this);
      $("<span>")
        .addClass("output hide-elem")
		.attr('id', 'confidence_input')
        .insertAfter($(this));
    })
    .bind("slider:ready slider:changed", function (event, data) {
      $(this)
        .nextAll(".output:first")
          .html(data.value.toFixed(0));
    });
  </script> 
<!-- Emergency Confidence range value calculator ends --> 
<!-- without income range value calculator strats --> 
<script>
  $("input[name='W_income_input']")
    .each(function () {
      var input = $(this);
      $("<span>")
        .addClass("output1 hide-elem")
		.attr('id', 'W_income_input')
        .insertAfter($(this));
    })
    .bind("slider:ready slider:changed", function (event, data) {
      $(this)
        .nextAll(".output1:first")
          .html(data.value.toFixed(0));
    });
  </script> 
<!-- without income range value calculator strats -->
</body>
</html>