
<script>
$(document).ready(function(){
  $('.add_docs_bx_slider').bxSlider();
  
});
</script>

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

  <!-- end of "header" id -->

  <!-- end of "nav-menu" id -->
  <div id="header-strip" class="fl">
    <h3 class="clearfix fl">FINANCIAL X-RAY</h3>
   </div>
  <!-- end of "header-strip" id -->
  
  <div id="inner-shadow-strip"></div>
  <!-- end of "inner-shadow-strip" id -->
  
  <div id="contents">
    <section class="in_content clearfix" id="x_ray_main">
      <div class="fin_x_ray">
        <div class="label">What's your monthly household expenditure?</div></label>
        <div class="calcy_li_bx">
          <div class="calcy_li_bx_in">
            <div class="add_document_slider">
              <ul class="add_docs_bx_slider clearfix">
                
                
                <li>
                  <div class="mon_house_exp_bx clearfix">
                    <div class="mon_house_exp_bx_in_left clearfix">
                    
                    <div class="top">
                      <div class="c_box"> <span class="common_custom_checkbox"></span>
                        <input type="checkbox" class="default_checkbox"/>
                      </div> 
                       <label> Below 15,000/- </label>
                        </div>
                        
                        
                        <div class="bottom">
                      <div class="c_box"> <span class="common_custom_checkbox"></span>
                        <input type="checkbox" class="default_checkbox"/>
                      </div> 
                       <label> 30,000/- to 50,000/-</label>
                        </div>
                        
                    </div>
                    <div class="mon_house_exp_bx_in_right clearfix">
                         <div class="top">
                      <div class="c_box"> <span class="common_custom_checkbox"></span>
                        <input type="checkbox" class="default_checkbox"/>
                      </div> 
                       <label> Below 15,000/- </label>
                        </div>
                        
                        
                        <div class="bottom">
                      <div class="c_box"> <span class="common_custom_checkbox"></span>
                        <input type="checkbox" class="default_checkbox"/>
                      </div> 
                       <label> 30,000/- to 50,000/-</label>
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

