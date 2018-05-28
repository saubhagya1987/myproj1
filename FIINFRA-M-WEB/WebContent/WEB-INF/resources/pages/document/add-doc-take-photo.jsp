<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Add Document</title>
<!-- <link rel="shortcut icon" href="../images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="../css/basic.css" />
<link type="text/css" rel="stylesheet" href="../css/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="../css/toggles.css" />
<link type="text/css" rel="stylesheet" href="../css/main.css" />
<link href="../css/custom.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="../css/responsive.css" />
<link type="text/css" rel="stylesheet" href="../css/selectboxlt.css" />

<script src="../js/plugin/jquery-1.11.0.min.js"></script>
<script src="../js/plugin/jquery-ui.js"></script>
<script src="../js/plugin/jquery.ui.touch-punch.js"></script>
<script src="../js/plugin/toggles.js"></script>
<script src="../js/my_account_submenu.js"></script>
<script src="../js/jquery_ui_range_slider.js"></script>
<script src="../js/plugin/jquery.slimscroll.js"></script>
<script src="../js/plugin/selectboxit.js"></script> -->
<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
  
 // $('.add_docs_parent_inside').slimScroll();
  });

</script>
<!-- custom scroll to "common_in_content" -->

<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
 
});
</script>
<!-- Custom Selectbox Ends -->

<!-- Type of emergency faced select starts -->
<script>
$(document).ready(function(){
  $(".thumb_select_ul a").click(function(){
 $(".thumb_select_ul a").children(".categoery").removeClass("not_applicable");
    $(this).children(".categoery").addClass("not_applicable");
	
	
	
});

$("#borrow_sell").on('toggle', function (e, active) {
    if (active) {
   

	  $(".divshow ").fadeIn("slow");
	
	   
    } else {
    
	  
	   $(".divshow ").fadeOut("slow");
    }
	
});

});
</script>
<!-- Type of emergency faced select ends -->

</head>
<body>
<!-- Wrapper starts-->
<div class="wrapper" id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
   
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
              <!--<li class="menu contact_rec"><a href="#" class="anch"><span class="thumb"></span><span class="txt"> Contact Recommendations</span></a></li>-->
               <li class="menu interested_fp_config">
					<a href="${pageContext.request.contextPath}/partner/getInterstedFpSection" class="anch"><span class="thumb"></span><span class="txt">FP Section</span></a>
				</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- Common_in_contnet starts-->
      <section class="in_content add-document common_in_content clearfix">
        <div class="add_docs_parent">
         <h2 class="heading"><span class="title">Add Document</span> </h2>
                    <div class="add_docs_parent_inside">
  <div class="first_column">
              <ul class="reset clearfix second_col_ul">
                <li class="clearfix">
                  <p>
           <div class="preview_label"> <label class="label">Document Type</label></div> 
            <div class="preview_label_cnt">   <select id="personal">
              <option>Select Manufacturer</option>
              <option>Axis</option>
              <option>ICICI</option>
            </select></div> 
                  </p>
                </li>
              <li class="clearfix">
                      <p>
                    <div class="preview_label"> <label class="label">Document Name</label></div> 
                      <div class="preview_label_cnt">  <input class="input" placeholder="Document Name" type="text" name="input"></div> 
                   
                      </p>
                    </li>
                    
                    <li class="clearfix">
                     <p>  <div class="preview_label"><label class="label">Description</label></div> 
                    <div class="preview_label_cnt"> <textarea class="comment" name="" cols="" rows="" placeholder="Contact Type"></textarea></div> 
                    </p>  </li>

                    <li class="clearfix">
                    <ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
              <li class="fl"><a href="add-document-preview.html">
                  <div class="categoery">
                    <div class="thumb add_docs_cancel"></div>
                  </div>
                  <label class="label">Back</label>
                  </a></li>
                <li class="fl"><a href="add-doc-take-photo.html">
                  <div class="categoery not_applicable">
                    <div class="thumb add_docs_take_photo"></div>
                  </div>
                  <label class="label">Take Photo</label>
                  </a></li>
                <li class="fl"><a href="add-doc-upload-file.html">
                  <div class="categoery">
                    <div class="thumb add_docs_upload_file"></div>
                  </div>
                  <label class="label">Select File</label>
                  </a></li>
                  <li class="fl"><a href="add-document-preview.html">
                  <div class="categoery">
                    <div class="thumb add_docs_save"></div>
                  </div>
                  <label class="label">Save</label>
                  </a></li>
              </ul> </li>
              </ul>
              
            </div>
         
          <div class="sec_column"><img src="${pageContext.request.contextPath}/resources/images/camera.png" alt="" width="122" height="108" hspace="105" vspace="100"> </div> </div>
          <div class="clr"></div>
        </div>
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts --> 
      <!--     <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list"><a href="#" class="anch add_note"><span class="txt">Add Notes</span></a></li>
            <li class="fl list"><a href="#" class="anch add_doc"><span class="txt">Add Doc</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation"><span class="txt">Back</span></a> <a href="#" class="next navgation"><span class="txt">Next</span></a></section> --> 
      
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->
</body>
</html>