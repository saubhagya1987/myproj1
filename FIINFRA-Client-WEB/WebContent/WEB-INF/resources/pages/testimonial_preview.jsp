<!--Slider Starts -->
<%@page import="in.fiinfra.cp.TestimonialData"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.List"%>
<div class="page-content">
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>
<% List<Integer> lst = (List<Integer>) request.getAttribute("lst") ;
	TestimonialData n=(TestimonialData) request.getAttribute("testimonial");
Integer currentPostId = (Integer)request.getAttribute("currentPostId");
if(currentPostId == null){
	currentPostId = 0;
}

%>	
 
<style>
    .bx-prev.disabled, .bx-next.disabled {display: none !important}
</style>        
<script>

var currentSlide =  0; 
var testimonialIds = [];
var loaded = [];
var slider ;


<%for(int i=0;i<lst.size();i++){ 
	int d = lst.get(i);
   
%>
	testimonialIds[<%= i %>] = "<%= d %>";
	<%
	if(n != null && n.getId().equals(lst.get(i))){ %>
	  currentSlide =  <%=i%>; 
	  loaded.push(currentSlide);
	 <%}%>
<%}%>


	function saveComment(action) {
		
		$('#action').val(action);
		$('#comment-form').submit();
	}

	$(document).ready(function(){
		
			$('.add_docs_bx_slider').bxSlider(
			{ 

		        infiniteLoop : false,
		        hideControlOnEnd: true,
		        autoControls : false,
		        startSlide:currentSlide,
				onSlideNext : function($slideElement, oldIndex, newIndex){
					if(newIndex >= testimonialIds.length){
						return;
					}
					if ($.inArray(testimonialIds[newIndex], loaded) !== -1){
						return;
					}
					
					 $.ajax({
							type : "GET",
							url : "${pageContext.request.contextPath}/common/testimonialById?testimonialId="+testimonialIds[newIndex],
							contentType : "application/json; charset=utf-8",
							success : function(data) {
								loaded.push(testimonialIds[newIndex]);
								var testimonialId = testimonialIds[newIndex];
								$('#testimonial_'+testimonialId).html(data);

							},
							error : function(msg) {
								var testimonialId = testimonialIds[newIndex];
								$('#testimonial_'+testimonialId).html(msg.d);
							}
						});
				 },
				 onSlidePrev : function($slideElement, oldIndex, newIndex){
						if(newIndex < 0){
							return;
						}
						if ($.inArray(testimonialIds[newIndex], loaded) !== -1){
							return;
						}
						
						 $.ajax({
								type : "GET",
								url : "${pageContext.request.contextPath}/common/testimonialById?testimonialId="+testimonialIds[newIndex],
								contentType : "application/json; charset=utf-8",
								success : function(data) {
									loaded.push(testimonialIds[newIndex]);
									var testimonialId = testimonialIds[newIndex];
									$('#testimonial_'+testimonialId).html(data);

								},
								error : function(msg) {
									var testimonialId = testimonialIds[newIndex];
									$('#testimonial_'+testimonialId).html(msg.d);
								}
							});
					 }
			
			
			}

		);
		
			
	  
	});
/* $(document).ready(function(){
	slider = $('.add_docs_bx_slider').bxSlider(
		{
			 onSlideNext : function($slideElement, oldIndex, newIndex){
				
				 $.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/common/testimonialById?testimonialId="+testimonialIds[newIndex],
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(data) {
							
							$('#add_docs_slider').append(data);
							 $('#add_docs_slider').bxSlider().reloadSlider();
						},
						error : function(msg) {
							$('.result').html(msg.d);
						}
					});
		     }
		}
		
		);
  
}); */
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

  <%-- <div id="header-strip" class="fl">
  <jsp:include page="menu.jsp"></jsp:include>
    <h3 class="clearfix fl">TESTIMONIALS</h3>
    
    <a href="${pageContext.request.contextPath}/common/add/testimonial" class="my-docs-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" /><p>New Testimonial</p></a>
  </div> --%>
  
   <div class="topmenu pull-right">
     <a href="/FIINFRA-Client-WEB/common/add/testimonial" class="btn-primary btn-xs btn">Add New Testimonial</a>
     </div>
  <br/><br/>
  <div id="contents">
    <section class="in_content clearfix" id="testimonial_main">
      <% 
            if(n!=null){%>
      <div class="testimonial_main_in">
<!--        <div class="label">What's your monthly household expenditure?</div>-->
        
        <div class="calcy_li_bx">
          <div class="calcy_li_bx_in">
            
            <div class="add_document_slider">
              <ul class="add_docs_bx_slider clearfix" id="add_docs_slider">
              <%  if(lst != null) {for(int i :lst){ 
                if(n.getId().equals(i)){
              %>
              <jsp:include page="testimonial_append.jsp" />
              <%}else{%>
               
               <li class="clearfix" id= "testimonial_<%=i%>">
                   <div class="mon_house_exp_bx clearfix">
                  <div class="mon_house_exp_bx_in_cnt clearfix">
                    <div class="comment_bx_without_dashed">
                    </div>
                    </div>
                    </div>
                      
                      </li>
                      <%}}} %>
              </ul>
            </div>
           
          </div>
        </div>
        </div>
         <%} 
            else{%>
            
            	 <div class="no_data_message">No testimonial written. You can become first to write Testimonial !</div>
            	<%}
            %>
      
      <!-- DC submenu Ends--> 
      
    </section>
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->
</div>