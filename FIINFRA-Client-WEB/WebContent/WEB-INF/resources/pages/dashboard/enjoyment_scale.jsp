
<!--Slider Starts -->
<script>
$(document).ready(function(){
//  $('.add_docs_bx_slider').bxSlider();
  
});
</script>

<!--Slider Starts -->

<!--Common Custom checkbox -->
<script>
$(document).ready(function(){
  $("body").on("click",".common_custom_checkbox",function(){
    $(this).toggleClass("white_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
});
</script>
<!--Common Custom checkbox ends-->
<div id="wrapper" class="clearfix">
<div id="header-strip" class="fl">
    <h3 class="clearfix fl">FEEDBACK</h3>
    </div>
  <!-- end of "header-strip" id -->
  
  <div id="inner-shadow-strip"></div>
  <!-- end of "inner-shadow-strip" id -->
  
  <div id="contents">
    <section class="in_content clearfix" id="feedback_main">
      <div class="feeback_bx_in">
        <div class="label">How do you expect financial planning to help in your life?</div>
        </label>
        <div class="calcy_li_bx">
          <div class="calcy_li_bx_in">
            <div class="add_document_slider">
              <ul class="add_docs_bx_slider clearfix">
              
               <a class="bx-prev" id="prev" href=""></a>
               <a class="bx-next" id="next" href=""></a>


                <li>
                  <div class="mon_house_exp_bx clearfix">
                    <div class="mon_house_exp_bx_in_left clearfix">
                      <div class="top">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help me put my expenses in order</label>
                      </div>
                      <div class="middle">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help with managing my existing portfolio of investment</label>
                      </div>
                      <div class="bottom">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help with planning of retirement</label>
                      </div>
                    </div>
                    <div class="mon_house_exp_bx_in_center clearfix">
                      <div class="top">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help with getting out of debts</label>
                      </div>
                      <div class="middle">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help with achieving my goals</label>
                      </div>
                      <div class="bottom">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help with effeciently transfering my assets to others</label>
                      </div>
                    </div>
                    <div class="mon_house_exp_bx_in_right clearfix">
                      <div class="top">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help with making right investments</label>
                      </div>
                      <div class="middle">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Help with financially protecting myself 
                          and my family against possible risks</label>
                      </div>
                      <div class="bottom">
                        <div class="c_box"> <span class="common_custom_checkbox"></span>
                          <input type="checkbox" class="default_checkbox"/>
                        </div>
                        <label>Any other</label>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- DC submenu Ends--> 
      
    </section>
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
</div>
<!-- End of "wrapper" id -->
</body>
</html>
