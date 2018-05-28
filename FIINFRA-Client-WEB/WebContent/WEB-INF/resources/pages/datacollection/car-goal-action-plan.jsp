<!DOCTYPE html>
<html>
<head>



<!-- intilazie custom checkbox starts-->

<!-- Type of emergency faced select ends -->

<!-- Custom Selectbox starts -->

<link type="text/css" rel="stylesheet" href="../css/selectboxlt.css" />
<script src="../js/plugin/selectboxit.js"></script>

<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
 
});
</script>
<!-- Custom Selectbox Ends -->

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

<!-- custom scroll to "common_in_content" --> 
<script>
$(document).ready(function(){
    $('.purchase_car_action_plan_bx_in').slimScroll();
  });

</script>
<!-- custom scroll to "common_in_content" --> 

</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper" id="purchase_car"> 
  <!-- Main starts-->
  <section class="main">        
      <!-- Common_content Starts-->
      <section class="content common_content"> 
        <!-- Common_in_contnet starts-->
        <section class="dc_in_content common_in_content action_plan_page clearfix">
           <div class="Asset_Allocation_bx">
        <div class="Asset_Allocation_bx_left">
          <div class="label">Goal Year:</div>
          <div class="txt">2020</div>
        </div>
        <div class="Asset_Allocation_bx_right">
          <div class="label">Asset Allocation:</div>
          <ul>
            <li><img src="${pageContext.request.contextPath}/resources/images/asset_allocation_shares.png" width="41" height="40" alt=""> <span>Shares</span></li>
            <li><img src="${pageContext.request.contextPath}/resources/images/asset_allocation_shares.png" width="41" height="40" alt=""> <span>Property</span></li>
          </ul>
        </div>
      </div>
      <div class="Goal_Completion_bx">
        <div class="Goal_Completion_bx_left">
          <div class="label">Goal Completion: </div>
          <div class="txt">25%</div>
        </div>
      </div>
      
          <div class="purchase_car_action_plan_bx">
            <ul class="reset clearfix purchase_car_action_plan_bx_ul">
              <li class="input_title_one fl"> Goal Target Amount </li>
              <li class="input_title_one_of_one fl">Recommended Investment </li>
              <li class="input_title_two fl">
                <div class="title_one">Allocation</div>
                <div class="title_two"> Recommended</div>
              </li>
              <li class="input_title_three fl">
                <div class="title_three">Actual</div>
              </li>
              <li class="input_title_four fl"> Recommended Product </li>
              <li class="input_title_five fl">Investment Amount</li>
              <li class="input_title_six fl">
                <div class="title_thr">Client Approval</div>
                <div class="title_two"> Status</div>
              </li>
              <li class="input_title_seven fl">
                <div class="title_three">Action</div>
              </li>
            </ul>
            <div class="purchase_car_action_plan_bx_in">
            <ul class="reset clearfix purchase_car_action_plan_bx_ul">
              <li class="input_one fl">
                <div class="input_counter_parent rupee">
                  <input type="text" class="input_range_counter" id="d_payment" value="6">
                  <span class="unit dynamic">lacs</span> </div>
              </li>
              <li class="input_one_of_one fl">
                <ul>
                  <li>
                    <div>
                      <input name="" type="radio" value="" style="float:left;">
                      <label>Lumpsum</label>
                    </div>
                    <div> <img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                      <input name="" type="text" class="input" placeholder="25,000">
                    </div>
                  </li>
                  <li>
                    <div>
                      <input name="" type="radio" value="" style="float:left;">
                      <label>SIP</label>
                    </div>
                    <div> <img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                      <input name="" type="text" class="input" placeholder="25,000">
                    </div>
                  </li>
                </ul>
              </li>
              <li class="input_two fl">
                <div class="title_input_one"> EQUITY </div>
                <div class="title_input_two_bx">
                  <div class="title_input_two"> 60 </div>
                  <span class="unit dynamic">%</span></div>
              </li>
              <li class="input_three fl">
                <div class="title_input_three_bx">
                  <div class="title_input_three"> 60 </div>
                  <span class="unit dynamic">%</span></div>
              </li>
              <li class="input_four fl">
                <ul>
                  <li>
                    <div class="mandatory"> </div>
                    Axis Income Fund </li>
                  <li>
                    <div class="mandatory"> </div>
                    Birla Income Fund </li>
                  <li>
                    <div class="mandatory"> </div>
                    HDFC Income Fund </li>
                  <li>
                    <div class="add">+</div>
                    <div class="clr"></div>
                  </li>
                </ul>
              </li>
              <li class="input_five fl">
                <ul>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                </ul>
              </li>
              <li class="input_six fl">
                <ul>
                  <li> <span class="app_txt02"> Sent for Approval</span></li>
                  <li> <span class="app_txt"> Not Approval</span></li>
                  <li> <span class="app_txt"> Not Approval</span></li>
                </ul>
              </li>
              <li class="input_seven fl">
                <ul>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                </ul>
                <div class="clr"></div>
              </li>
            </ul>
            <ul class="reset clearfix purchase_car_action_plan_bx_ul">
              <li class="input_one fl">
               
              </li>
              <li class="input_one_of_one fl">
                <ul>
                  <li>
                   
                  </li>
                  <li>
                    
                    
                  </li>
                </ul>
              </li>
              <li class="input_two fl">
                <div class="title_input_one"> DEBT </div>
                <div class="title_input_two_bx">
                  <div class="title_input_two"> 60 </div>
                  <span class="unit dynamic">%</span></div>
              </li>
              <li class="input_three fl">
                <div class="title_input_three_bx">
                  <div class="title_input_three"> 60 </div>
                  <span class="unit dynamic">%</span></div>
              </li>
              <li class="input_four fl">
                <ul>
                  <li>
                    <div class="mandatory"> </div>
                    Axis Income Fund </li>
                  <li>
                    <div class="mandatory"> </div>
                    Birla Income Fund </li>
                  <li>
                    <div class="mandatory"> </div>
                    HDFC Income Fund </li>
                  <li>
                    <div class="add">+</div>
                    <div class="clr"></div>
                  </li>
                </ul>
              </li>
              <li class="input_five fl">
                <ul>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                </ul>
              </li>
              <li class="input_six fl">
                <ul>
                  <li> <span class="app_txt02"> Sent for Approval</span></li>
                  <li> <span class="app_txt"> Not Approval</span></li>
                  <li> <span class="app_txt"> Not Approval</span></li>
                </ul>
              </li>
              <li class="input_seven fl">
                <ul>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                </ul>
                <div class="clr"></div>
              </li>
            </ul>
            
            <ul class="reset clearfix purchase_car_action_plan_bx_ul">
              <li class="input_one fl">
               
              </li>
              <li class="input_one_of_one fl">
                <ul>
                  <li>
                   
                  </li>
                  <li>
                    
                    
                  </li>
                </ul>
              </li>
              <li class="input_two fl">
                <div class="title_input_one"> GOLD </div>
                <div class="title_input_two_bx">
                  <div class="title_input_two"> 60 </div>
                  <span class="unit dynamic">%</span></div>
              </li>
              <li class="input_three fl">
                <div class="title_input_three_bx">
                  <div class="title_input_three"> 60 </div>
                  <span class="unit dynamic">%</span></div>
              </li>
              <li class="input_four fl">
                <ul>
                  <li>
                    <div class="mandatory"> </div>
                    Axis Income Fund </li>
                  <li>
                    <div class="mandatory"> </div>
                    Birla Income Fund </li>
                  <li>
                    <div class="mandatory"> </div>
                    HDFC Income Fund </li>
                  <li>
                    <div class="add">+</div>
                    <div class="clr"></div>
                  </li>
                </ul>
              </li>
              <li class="input_five fl">
                <ul>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                  <li><img src="${pageContext.request.contextPath}/resources/images/rupee-symbol_small.png" alt="" width="7" height="12" hspace="7">
                    <input name="" type="text" class="input" placeholder="25,000">
                  </li>
                </ul>
              </li>
              <li class="input_six fl">
                <ul>
                  <li> <span class="app_txt02"> Sent for Approval</span></li>
                  <li> <span class="app_txt"> Not Approval</span></li>
                  <li> <span class="app_txt"> Not Approval</span></li>
                </ul>
              </li>
              <li class="input_seven fl">
                <ul>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                  <li> <span class="common_custom_checkbox"></span>
                    <input type="checkbox" class="default_checkbox"/>
                  </li>
                </ul>
                <div class="clr"></div>
              </li>
            </ul>
          <div class="clr"></div>    </div>
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
          <a href="emergency-readiness.html" class="back navgation"><span class="txt">Back</span></a> <a href="retirement-readiness.html" class="next navgation"><span class="txt">Next</span></a></section>
        
        <!-- Common footer ends -->
        <div class="overlay"></div>
      </section>
      <!-- Common_content Ends--> 
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<script type="text/javascript">	
	equalHeightEightCol($('.input_one'), $('.input_one_of_one'), $('.input_two'), $('.input_three'), $('.input_four'), $('.input_five'), $('.input_six'), $('.input_seven'))
</script>
</body>
</html>
