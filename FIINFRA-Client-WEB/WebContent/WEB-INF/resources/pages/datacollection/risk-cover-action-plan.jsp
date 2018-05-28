<!DOCTYPE html>
<html>
<head>
<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
 
});
</script>
<!-- Custom Selectbox Ends -->

<!--Common Custom checkbox -->
<!--Common Custom checkbox -->
<script>
$(document).ready(function(){
  $("body").on("click",".common_custom_checkbox",function(){
    $(this).toggleClass("white_checkbox_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
});
</script>
<!--Common Custom checkbox ends-->

<!-- custom scroll to "common_in_content" --> 
<script>
$(document).ready(function(){
    $('.risk_cover_action_plan_bx_in').slimScroll();
  });

</script>
<!-- custom scroll to "common_in_content" --> 
</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper" id="risk_cover"> 
  <!-- Main starts--> 
  <!--section class="main"--> 
    <!-- Common_content Starts-->
    <section class="content common_content"> 
      <!-- Common_in_contnet starts-->
      <section class="dc_in_content common_in_content action_plan_page clearfix">
        <div class="risk_cover_action_plan_bx">
          <ul class="reset clearfix risk_cover_action_plan_bx_ul">
            <li class="input_title_one fl"> Sr. No  </li>
            <li class="input_title_two fl"> Risk  </li>
            <li class="input_title_three fl"> Cover Required </li>
            <li class="input_title_four fl">Cover Available</li>
            <li class="input_title_five fl">Recommended Product</li>
            <li class="input_title_six fl"> Premium Amt in</li>
            <li class="input_title_seven fl"><div class="title_one">Client Approval</div><div class="title_two"> Status</div> </li>
            <li class="input_title_eight fl"><div class="title_three">Action</div> </li>
           
          </ul>
          <div class="risk_cover_action_plan_bx_in">
          <ul class="reset clearfix risk_cover_action_plan_bx_ul">
            <li class="input_one fl"> <span class="txt"> 1 </span> </li>
            <li class="input_two fl"> <span class="txt"> Critical Illness </span> </li>
            <li class="input_three fl"> <span class="txt"> 1 Lac </span> </li>
            <li class="input_four fl"> <span class="txt">25,000 </span> </li>
            <li class="input_five fl">
              <select class="sel_box">
                <option>Birla Critical Illin</option>
              </select>
            </li>
            <li class="input_six fl">
             <img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
<input name="" type="text" class="input" placeholder="2,000">
            </li>
            <li class="input_seven fl"> <span class="app_txt"> Sent for Approval</span> </li>
            <li class="input_eight fl">  <span class="common_custom_checkbox"></span><input type="checkbox" class="default_checkbox"/> <div class="app_txt_sent">  Email Sent for Approval </div> <div class="clr"></div></li>
           
          </ul>
          <ul class="reset clearfix risk_cover_action_plan_bx_ul">
            <li class="input_one fl"> <span class="txt"> 2 </span> </li>
            <li class="input_two fl"> <span class="txt"> Early Death </span> </li>
            <li class="input_three fl"> <span class="txt"> 2 Crore </span> </li>
            <li class="input_four fl"> <span class="txt">50 Lacs </span> </li>
            <li class="input_five fl">
              <select class="sel_box">
                <option>LIC Life Insurance</option>
              </select>
            </li>
            <li class="input_six fl">
             <img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
<input name="" type="text" class="input" placeholder="25,000">
            </li>
            <li class="input_seven fl"> <span class="app_not_txt"> Not Approved</span> </li>
            <li class="input_eight fl">  <span class="common_custom_checkbox"></span><input type="checkbox" class="default_checkbox"/> <div class="app_txt_send">Send Email for Approval </div> <div class="clr"></div></li>
           
          </ul>
          
          </div>
        </div>            
        <div class="clr"></div>

      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list"><a href="data-collection.html" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="data-collection.html" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list"><a href="financial-readiness.html" class="anch skip"><span class="txt">Skip</span></a></li>
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
        <a href="risk-cover.html" class="back navgation"><span class="txt">Back</span></a> <a href="retirement-readiness.html" class="next navgation"><span class="txt">Next</span></a></section>
      
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
