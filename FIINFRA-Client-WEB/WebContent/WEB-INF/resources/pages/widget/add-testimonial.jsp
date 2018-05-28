<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- Custom Selectbox starts -->
<script>
$(document).ready(function(){
    $('#testimonial-form').validate({
    	errorClass:"errors", 
        rules: {
        	url: "required",
        	text: "required"
        	
        },
        messages: {
        	url: "Enter Heading",
        	text: "Enter description"
        }
       
    });
    });
</script>
<script>
	function saveTestimonial(action) {
		
		$('#action').val(action);
		if($('#testimonial-form').valid()){
	 		$('#testimonial-form').submit();	
	 	}
		
	}
</script>

<!-- Custom Selectbox Ends -->
<form:form action="${pageContext.request.contextPath}/common/save/testimonial"
			commandName="testimonialData" method="POST" 
			id="testimonial-form">
			<form:errors path="*" cssclass="error" class="error"></form:errors> 
  <!-- end of "header" id --> 
    
  
  <!-- end of "header-strip" id -->
  
  <!-- end of "inner-shadow-strip" id -->
  <div class="clearfix"></div>
  <div id="contents" class="clearfix">
    <div id="add_new_query" class="in_content clearfix"> 
       
        
  <!--         <ul class="reset clearfix">
            <li class="clearfix container_li">
              <label class="form_label">Type</label>
              <select id="add_Query_Type">
                <option>Select</option>
                <option>General</option>
                <option>Data Collection Tool Input</option>
                <option>Analysis Report</option>
                <option>Client Action Plan</option>
                <option>Partner Action Plan</option>
                <option>Product Recommendation</option>
                <option>Execution</option>
              </select>
            </li>
            <li class="clearfix container_li">
              <label class="form_label">Heading</label>
              <input id="second_col_input" class="common_input" type="text" name="url" >
            </li>
            
            <li class="clearfix container_li">
              <label class="form_label">Description</label>
                    <textarea class="txt-editor common_textarea" name="text" cols="" rows="" ></textarea>
            </li>
            
          </ul> -->
          
         <fieldset>
        
          <div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-1 control-label">Heading</label>
					<div class="col-lg-4">
						<input id="second_col_input" name="url" placeholder="Heading" class="form-control" type="text" value="">
					</div>
				</div>
				<br>
				<br>
			</div>
				<div class="col-xs-12 ">
					<div class="form-group">
						<label for="textArea" class="col-lg-1 control-label">Description</label>
						<div class="col-lg-4">
							<textarea name="text" placeholder="Description"
								class="form-control" type="text" value=""></textarea>
						</div>
					</div>
					<br> <br>
				</div>
			</fieldset>
			<br>
				<br>
          
          
            <div class="col-xs-12" align="center">
                
                        <!--a class="anch save_n_close" href="#"><span class="txt">Save &amp; Close</span></a-->
                        <input type="submit" value="Save &amp; Close" class="btn-primary btn-xs btn" onClick="saveTestimonial('new')">            
                
                        <a href="${pageContext.request.contextPath}/common/testimonials" ><input type="button" value="Cancel" class="btn-primary btn-xs btn"></a>
                
          </div>    
             
 
            <!-- <div class="footer_buttons"><ul class="reset clearfix btn_grup">           
            
            <li class="fl list"><a class="anch save_n_close" onClick="saveTestimonial('new')" href="#"><span class="txt">Save &amp; Close</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul></div> -->       
    </div>
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
  </form:form>

<!-- End of "wrapper" id -->
