<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@page import="java.util.Map"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <script src="${pageContext.request.contextPath}/resources/js/media.js"></script> --%>
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
<div class="wrapper">
  <section class="main"> 
<!-- Type of emergency faced select ends -->
     <form:form action="${pageContext.request.contextPath}/notes/save"
			commandName="q" method="POST" enctype="multipart/form-data"
			id="query-form">
    <!-- Common_content Starts-->
      <!-- Common_in_contnet starts-->
      <section class="in_content add-document common_in_content clearfix">
        <div class="add_docs_parent">
         <h2 class="heading"><span class="title">Add Document</span> </h2>
                    <div class="add_docs_parent_inside">
  <div class="first_column">
              <ul class="reset clearfix second_col_ul">
                <li class="clearfix">
                  <p>
                  </p>
                </li>
              <section class="in_content common_in_content clearfix" id="add_query_content_in" > 
                <div class="fl third_col">
                  <ul class="reset clearfix second_col_ul">
                  <li class="clearfix">
                    <div class="preview_label">  <label class="form_label">Document Type</label></div> 
            <div class="preview_label_cnt">  <select id="personal">
              <option>Select Manufacturer</option>
              <option>Axis</option>
              <option>ICICI</option>
            </select></div> </li>
                  
                    <li class="clearfix">
              			<label class="form_label">Document Name</label>
              <input id="second_col_input" class="common_input" placeholder="lorem ipsum comment" type="text" name="input">
            </li>
            <li class="clearfix"><label class="form_label">Description</label>
								<form:textarea path="description" rows="5" class="txt-editor" cols="30" placeholder="lorem ipsum comment" />
			</li>
          </ul>
         
           <div class="clearfix" id="main_actions">
          <ul class="reset clearfix fr btn_grup">
          <li class="clearfix">
                    <ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
                 <li class="fl list"><a  class="anch save_n_close" href="add-document-preview.html">
                  <div class="categoery">
                    <div class="thumb add_docs_cancel"></div>
                  </div>
                <li class="fl"><a href="add-doc-take-photo.html">
                  <div class="categoery">
                  
                    <div class="thumb add_docs_take_photo"></div>
                  </div>
                  <input type="file" name="cemera" accept="image/*" capture>
                  
                  <input type="file" accept="image/*" capture>
                  <label class="label">Take Photo</label>
                  </a></li>
                <li class="fl"><a href="${pageContext.request.contextPath}/notes/doc-upload/doc-preview">
                  <div class="categoery not_applicable">
                    <div class="thumb add_docs_upload_file"></div>
                  </div>
                  <label class="label">Select File</label>
                  </a></li>
                  <li class="fl"><a href="add-document-preview.html">
                  <div class="categoery">
                    <div class="thumb add_docs_save anch save_n_close"></div>s
                    <label class="label">Save</label>
                  </div>
                  </a>
                  </li>
                 </ul>
                 </li>
              </ul>
              <div class="sec_column">  
			<input class="input" placeholder="File Name" type="text" name="input">
              <button id="photo_upload" class="browse_btn">Browse</button>
        </div>       
      </div>    
        <!-- Box Third Ends -->       
    
       </section>        
          <!-- <div class="photo_frame">
              <p>Your Photo Here</p>
              <img id="preview" src="#" alt="" /> </div>
            <div class="upload_btn">
              <form>
                <input type="file" accept="image/*" id="upload"/>
              </form>
              <button id="photo_upload" class="common_btn">Browse</button>
            </div>-->
            </div>    
            </div>
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
    </form:form>
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->
</body>
</html>