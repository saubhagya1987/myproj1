<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="in.fiinfra.common.common.QueryCommentData"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Custom Selectbox starts -->
<script>
	 $(document).ready(
			function() {

		
	    $("#comment_type").each(function () {
	        var radios = $(this).find(":radio").hide();
	    });

				$("#comment_type").slider(
						{
	        min: 1,
	        max: 2,
	        step: 1,
	        slide: function (event, ui) {
	            $("#comment_type .ui-slider-handle").empty();
	            if (ui.value == 1) {
									$("#comment_type .ui-slider-handle").css(
											"margin-left", "2px");

	                $("#comment_type .frist").click();
	                var x = $(".frist").val();
									$("#comment_type .ui-slider-handle")
											.append(x);
	            } else if (ui.value == 2) {
									$("#comment_type .ui-slider-handle").css(
											"margin-left", "-46px");
	                $("#comment_type .second").click();
	                var x = $("#comment_type .second").val();
									$("#comment_type .ui-slider-handle")
											.append(x);
	            }

	        }

	    });
	    $("#comment_type .ui-slider-handle").css("margin-left", "2px");
	    var x = $(".frist").val();
	    $("#comment_type .ui-slider-handle").append(x);
	});
	function saveMessage(){
			//alert("ok");
		var validated =  $('#query-message').validate({
			errorClass:"errors", 
	        rules: {
	        	commentText: "required"
	        },
	        messages: {
	        	commentText: "Enter Comment"
	        }
	       
	    });
	 	if(validated){
	 		$('#query-message').submit();	
	 	}
		
	}
</script>
<%-- <div id="header-strip" class="fl">
   <jsp:include page="../menu.jsp"></jsp:include>
    <h3 class="clearfix fl">QUERY-MESSAGES</h3>
  </div> --%>
<!-- <div id="inner-shadow-strip"></div> -->
<%-- <a href="${pageContext.request.contextPath}${returnUrl}" ><input
		type="button" value="Back" class="add-new-query-btn clearfix fr btn btn-danger"></a><br><br> --%>

<!-- <section class="content common_content">
				
			<section class="in_content common_in_content" id="query-comment-content-in"> 
              <div class="query_mssg_parent"> -->
				
				

				<%
					QueryData query= (QueryData) request.getAttribute("data");
				        List<QueryCommentData> commentList= query.getQueryCommentDatas();
				%>
				
				
				
			
<%-- <div class="comment-bx">
          		<div class="comment-profile-bx-left">
		<img
			src="<%=FiinfraUtility.getImagePath(request, query.getPhotoPath(), "resources/images/photo.jpg")%>"
			width="76" height="76" alt="">
          		</div>
          <div class="comment-cnt-bx-right">
            <div class="comment-title-one"><%=query.getSubject()%></div>
           
		<textarea name="" cols="" rows="" disabled class="comment-title-two"
			value="Lorem Ipsum"><%=query.getNotes()%></textarea>
		<textarea name="" cols="" rows="" disabled class="comment-txt"
			value="Lorem Ipsum"><%=query.getLastUpdatedDate()+" by "+ query.getQueryOwnerName()%></textarea>
          
          </div>
        </div>

				<%
					for(QueryCommentData q:commentList) {
				%>
				
        <div class="comment-bx-two-drop-shadow">
          <div class="comment-bx-two-inset">
		<div class="comment-profile-one">
			<img
				src="<%=FiinfraUtility.getImagePath(request, q.getPhotoPath(), "resources/images/photo.jpg")%>"
				width="30" height="31" alt="">
		</div>
            <div>
            
			<textarea name="" cols="" rows="" disabled class="comment-title-one"
				value="Lorem Ipsum"><%=q.getCommentText()%></textarea>
			<textarea name="" cols="" rows="" disabled class="comment-title-txt"
				value="Lorem Ipsum"><%=q.getCreatedDate() +" by "+q.getCommentOwner()%></textarea>
            </div>
          </div>
        </div>

		<%
			}
	%>

				<form:form
					action="${pageContext.request.contextPath}/query/comment/save"
	commandName="queryComment" method="POST" enctype="multipart/form-data"
	id="query-message">
					<input type="hidden" value="${returnUrl}" name="returnUrl"/>
					<form:input path="queryId" type="hidden" />
					
					<div class="comment-bx-two-drop-shadow">
						<div class="comment-bx-two-inset">
			<div class="comment-profile-one"></div>
							<div class="comment-profile-two">
								<form:textarea path="commentText" rows="5" class="txt-editor"
									cols="30" placeholder="Query Comment" />
													
							</div>
							<div class="clearfix"></div>
						</div>
					</div>

					<!-- Box Two Ends -->

	<!-- ADD Cancle -->
	<a href="${pageContext.request.contextPath}${returnUrl}"><input
		type="button" value="Cancel" class="btn fr"></a>

	<input type="button" value="Add Comment" class="btn fr"
		onClick="saveMessage('new')" id="query_btn_margin">
	<!--  ADD Cancle -->
				</form:form>
				</div>
			</section>
        
</section> --%>
	
	<!-- Main ends-->

<!-- Wrapper ends-->



<!-- Demo Code -->
<fieldset>
        
          <div class="col-xs-12 ">
				<div class="form-group">
					<label  class="col-lg-1 control-label">Title :</label>
					<div class="col-lg-4">
						<!-- <input id="second_col_input" name="url"  class="form-control" type="text" value=> -->
						<label><%=query.getSubject()%></label>
					</div>
				</div>
				<br>
				<br>
			</div>
				<div class="col-xs-12 ">
					<div class="form-group">
						<label  class="col-lg-1 control-label">Description:</label>
						<div class="col-lg-4">
							<%-- <textarea name="text" class="form-control" type="text" value=<%=query.getNotes()%>></textarea> --%>
							<label><%=query.getNotes()%></label>
						</div>
					</div>
					<br> <br>
				</div>
			</fieldset>
<div class="col-sm-6">
	<div class="widget-box">
		<div class="widget-header">
			<h4 class="widget-title lighter smaller">
				<i class="ace-icon fa fa-comment blue"></i> Messages
			</h4>
		</div>

		<div class="widget-body">
			<div class="widget-main no-padding">
				<!-- #section:pages/dashboard.conversations -->
				<div class="dialogs">
					<%
						for(QueryCommentData q:commentList) {
					%>
					<div class="itemdiv dialogdiv">
						<div class="user">
							<img alt="Alexa's Avatar"
								src="<%=FiinfraUtility.getImagePath(request, q.getPhotoPath(), "resources/images/photo.jpg")%>" />
						</div>

						<div class="body">
							<div class="time">
								<i class="ace-icon fa fa-clock-o"></i> <span class="green"><%=q.getCreatedDate()%></span>
							</div>

							<div class="name">
								<a href="#"><%=query.getQueryOwnerName()%></a>
							</div>
							<div class="text"><%=q.getCommentText()%></div>

							<!-- <div class="tools">
								<a href="#" class="btn btn-minier btn-info"> <i
									class="icon-only ace-icon fa fa-share"></i>
								</a>
							</div> -->
						</div>
					</div>

					<%
						}
					%>




				</div>

				<!-- /section:pages/dashboard.conversations -->
				<form:form
	action="${pageContext.request.contextPath}/query/comment/save"
	commandName="queryComment" method="POST" enctype="multipart/form-data"
	id="query-message">
	<input type="hidden" value="${returnUrl}" name="returnUrl" />
	<form:input path="queryId" type="hidden" />
					<div class="form-actions">
						<div class="input-group">
							<!-- <input placeholder="Query Comment" type="text" class="form-control" name="message" path="commentText"/> -->
							
							
	
							<!-- <input path="commentText" rows="5" class="form-control"
								placeholder="Query Comment" />  -->
								
							<form:input type="text" path="commentText" class="form-control" placeholder="Query Comment" />									
								
								<!-- <input type="button" value="Add Comment" class="ace-icon btn btn-success"
								onClick="saveMessage('new')" id="query_btn_margin"> --> 
								
								<span class="input-group-btn">
								<button class="btn-primary btn-xs btn" type="button" onClick="saveMessage('new')" id="query_btn_margin">
																		
																		Add Comment
																	</button>
								

							</span>
						</div>
					</div>
			</form:form>
			</div>
			<!-- /.widget-main -->
		</div>
		<!-- /.widget-body -->
	</div>
	<!-- /.widget-box -->
</div>
<!-- /.col -->


