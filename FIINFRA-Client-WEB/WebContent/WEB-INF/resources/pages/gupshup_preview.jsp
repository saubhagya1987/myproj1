<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.cp.GupShupData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.common.GupShupCommentData"%> 
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>
<% List<Integer> lst = ((List<Integer>) request.getAttribute("lst")); 
	GupShupData n=(GupShupData) request.getAttribute("gupshup");
%>
<!--Slider Starts -->

<!-- <style> -->
    <!-- .bx-prev.disabled, .bx-next.disabled {display: none !important}  -->
<!-- </style> -->
<script>
   
  var postIds = [];
  var loaded = [];
  var currentSlide =  0;
  
  <%for(int i=0;i<lst.size();i++){ 
     int d = lst.get(i);
  %>
  	postIds[<%= i %>] = "<%= d %>";
  	
	<%
	if(n != null && n.getId().equals(lst.get(i))){ %>
	  currentSlide =  <%=i%>; 
	  loaded.push(currentSlide);
	 <%}%>
  	
  	
  <%}%>
	function saveComment(action) {
		
		
		if(postIds.length ==0){
			showMessage("Invalid Post",true);
			return ;
		}
		var curSlide = $('#add_docs_slider').bxSlider().getCurrentSlide();
		$("#postId").val(postIds[curSlide]);
		if($('#comment-form').valid()){
	 		$('#comment-form').submit();	
		}
	}
	
</script>
<script>
$(document).ready(function(){
    
    $('#comment-form').validate({
    	errorClass:"errors", 
        rules: {
        	commentText: "required",
        	
        },
        messages: {
        	commentText: "Enter Comment Text"
            }
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
</script>
<script>

function save(id){
	if($('#likeCount'+id).hasClass('disabled')){
		return;
	}
	
	var data=id;
	$.ajax({
	
	url : "${pageContext.request.contextPath}/common/liked?postId="+<%=n.getId()%>,
	type: "GET",
    dataType: 'json',
    data : {'postId':data},
	success : function(data) {
		showMessage('Thank You for like');
		$('#likeCount'+id).text(data);
		$('#likeCount'+id).addClass('disabled');

	},
	error : function(msg) {
		
	}
});
}


$(document).ready(function(){
	 $('.add_docs_bx_slider').bxSlider(
		{ 
	        infiniteLoop : false,
	        hideControlOnEnd: true,
	        autoControls : false,
// 	       adaptiveHeight: true,
//   			mode: 'fade', 
	       
	        startSlide:currentSlide,
			onSlideNext : function($slideElement, oldIndex, newIndex){
				
				if(newIndex >= postIds.length){
					return;
				}
				if ($.inArray(postIds[newIndex], loaded) !== -1){
					return;
				}
				
				 $.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/common/gupshupById?postId="+postIds[newIndex],
						success : function(data) {
							loaded.push(postIds[newIndex]);
							var postId = postIds[newIndex];
							$('#post_'+postId).html(data);

						},
						error : function(msg) {
							var postId = postIds[newIndex];
							$('#post_'+postId).html(msg.d);
						}
					});
			 },
			 onSlidePrev : function($slideElement, oldIndex, newIndex){
					
					if(newIndex < 0){
						return;
					}
					if ($.inArray(postIds[newIndex], loaded) !== -1){
						return;
					}
					
					 $.ajax({
							type : "GET",
							url : "${pageContext.request.contextPath}/common/gupshupById?postId="+postIds[newIndex],
							success : function(data) {
								loaded.push(postIds[newIndex]);
								var postId = postIds[newIndex];
								console.log(data);
								$('#post_'+postId).html(data);

							},
							error : function(msg) {
								var postId = postIds[newIndex];
								$('#post_'+postId).html(msg.d);
							}
						});
				 }	 
		
		}

	);
		
  
});


</script>

<!--Slider Starts -->



<body>

<div id="wrapper" class="clearfix">

  <%-- <div id="header-strip" class="fl">
     <jsp:include page="menu.jsp"></jsp:include>
    <h3 class="clearfix fl">GUP-SHUP</h3>
    
  </div> --%>
  <!-- end of "header-strip" id -->
  
  <!-- <div id="inner-shadow-strip"></div> -->
  <!-- end of "inner-shadow-strip" id -->
  
  <div id="contents">
    <section class="in_content clearfix" id="gup_shup_main">
      <% 
            if(n!=null){%>
      <div class="gup_shup_main_in">
<!--        <div class="label">What's your monthly household expenditure?</div>-->
        
       
        <div class="calcy_li_bx">
          <div class="calcy_li_bx_in">
            <div class="add_document_slider">
              <ul class="add_docs_bx_slider clearfix" id="add_docs_slider">
                            <%  if(lst != null) {
                            	for(int i :lst){ 
                if(n.getId().equals(i)){
              %>
              <jsp:include page="gupshup_append.jsp" />
              <%}else{%>
               
               <li class="clearfix" id= "post_<%=i%>">
                   <div class="mon_house_exp_bx clearfix">
								<div class="mon_house_exp_bx_in_cnt clearfix">
									<div class="comment_bx_without_dashed"></div>
								</div>
					</div>

				</li>
                      <%
                      	}
                      			}
                      		}
                      %>
                      
              </ul>
              <div class="rply_bx">
                      <form id="comment-form" method="POST" action="${pageContext.request.contextPath}/common/add" class="add">
                       <input type="hidden" id="postId" name="postId"  />
                       	<br><br>
                        <div class="title">Reply</div>
                       <!--  <textarea class="txt_area" id = "commentText" name = "commentText" cols="" rows="" form="comment-form"></textarea>
                        <input type="submit" onClick="saveComment(this);return false;" value="Submit" class="login_btn fr"> -->
                       
		<div class="input-group">
			
			<input id="commentText" name="commentText" type="text" class="form-control"	value=""> 
				<span class="input-group-btn">
				<input type="submit" onClick="saveComment(this);return false;" value="submit" class="btn-primary btn-xs btn">
					</span>
		</div>
		</form>
	</div>
                        
             </div>
            </div>
          </div>
        </div>
        </section>
      </div>
      <% } 
       else{%>
            
            	 <div class="no_data_message">No Gupshup found !</div>
            	<%}
            %>
					<%-- <div class="rply_bx">
                      <form id="comment-form" method="POST" action="${pageContext.request.contextPath}/common/add" class="add">
                       <input type="hidden" id="postId" name="postId"  />
                        <div class="title">Reply</div>
                        <textarea class="txt_area" id = "commentText" name = "commentText" cols="" rows="" form="comment-form"></textarea>
                        <input type="submit" onClick="saveComment(this);return false;" value="Submit" class="login_btn fr">
                        </form> 
                      </div> --%>
      
      <!-- DC submenu Ends--> 
      
   
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  <!-- end of "contents" id -->

<!-- End of "wrapper" id -->







	