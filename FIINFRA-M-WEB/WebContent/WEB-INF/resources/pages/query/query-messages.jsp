<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.common.QueryCommentData"%>
<%@page import="in.fiinfra.common.common.QueryData"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<!-- Custom Selectbox starts -->
<script>
initialData = [];
finalData = [];
	$(document).ready(function() {

		$("select").selectBoxIt();
		$('.common_in_content').slimScroll();
		$('.first_block').slimScroll();
	    $("#comment_type").each(function () {
	        var radios = $(this).find(":radio").hide();
	    });

	    $("#comment_type").slider({
	        min: 1,
	        max: 2,
	        step: 1,
	        slide: function (event, ui) {
	            $("#comment_type .ui-slider-handle").empty();
	            if (ui.value == 1) {
	                $("#comment_type .ui-slider-handle").css("margin-left", "2px");

	                $("#comment_type .frist").click();
	                var x = $(".frist").val();
	                $("#comment_type .ui-slider-handle").append(x);
	            } else if (ui.value == 2) {
	                $("#comment_type .ui-slider-handle").css("margin-left", "-46px");
	                $("#comment_type .second").click();
	                var x = $("#comment_type .second").val();
	                $("#comment_type .ui-slider-handle").append(x);
	            }
	        }

	    });
	    $("#comment_type .ui-slider-handle").css("margin-left", "2px");
	    var x = $(".frist").val();
	    $("#comment_type .ui-slider-handle").append(x);
	    
	    $("#commentText").val(''); 
	    checkDataInitial();
	    $("#confirmDialog .close").click(function(){
	 	    $(".overlay").fadeOut("slow");
	 	 $("#confirmDialog").fadeOut("slow");
	 	  });

	});
	function formSubmit() {
		if($("#commentText").val() != ''  )
			{
				$("#queryMessageForm").submit();
			}
		else {
			$("#successDialog").html("Please enter Query Comment");
			$( "#successDialog").dialog( "open" );
		}
		
	}
	
	function checkDataInitial(){
		initialData = [];
		initialData.push($("#commentText").val());
		initialData.push(($("input[type='radio'][name='target_type']:checked").val()));
		initialData.push($("#Contct_name").val());
		initialData.push($("#status").val());
		initialData.push($("#queryAttachment").val());
	}
	function checkDataFinal(){
		finalData = [];
		finalData.push($("#commentText").val());
		finalData.push(($("input[type='radio'][name='target_type']:checked").val()));
		finalData.push($("#Contct_name").val());
		finalData.push($("#status").val());
		finalData.push($("#queryAttachment").val());
		
	}
	
	function backPage(url) {
		checkDataFinal();
		if(initialData.toString() == finalData.toString()){ 
			javascript:location.href=url;
		 }else{
			 
			 $(".aa_up").html("<spring:message code='dataChanged' />");
				$(".aa_yes").click(function(){
				cancelPage(url);
				});	
				$(".overlay").fadeIn();
				$("#confirmDialog").fadeIn();
		} 
	}
	
	function closeDialog(){
		  $(".overlay").fadeOut("slow");
		     $("#confirmDialog").fadeOut("slow");
	}	
	
	function cancelPage(url){
		javascript:location.href=url;
	}
	
</script>

		<section class="content common_content query_msg">
		<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  			<div class="modal_content">
    		<div class="aa_up">
      		<spring:message code="dataChanged" />
    	</div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
				<c:choose>
					<c:when test="${not empty link}">
						<a href="${pageContext.request.contextPath}${link}" class="header_back_btn">Back</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="header_back_btn" onClick="backPage('${pageContext.request.contextPath}/query/list');">Back</a>
					</c:otherwise>
				</c:choose>
			<section class="in_content common_in_content" id="query-comment-content-in"> 
              <div class="first_block">						
				<%
					QueryData query= (QueryData) request.getAttribute("data");
				        List<QueryCommentData> commentList= query.getQueryCommentDatas();
				%>
		<div class="comment-bx">
          		<div class="comment-profile-bx-left"><img src="<%=FiinfraUtility.getImagePath(request, query.getPhotoPath(), "resources/images/comment-profile2.jpg") %>" width="76" height="76" alt=""></div>
          <div class="comment-cnt-bx-right">
            <div class="comment-title-one"><%=query.getSubject()%></div>
           
           <textarea name="" cols="" rows="" disabled class="comment-title-two" value="Lorem Ipsum"><%=query.getNotes()%></textarea>
          <textarea name="" cols="" rows="" disabled class="comment-txt" value="Lorem Ipsum"><%=query.getLastUpdatedDate()+" by "+ query.getQueryOwnerName()%></textarea>
          
          </div>
        </div>
				<%
					for(QueryCommentData q:commentList) {
				%>				
        <div class="comment-bx-two-drop-shadow">
          <div class="comment-bx-two-inset">
            <div class="comment-profile-one"><img src="<%=FiinfraUtility.getImagePath(request, q.getPhotoPath(), "resources/images/temp_logo.png") %>" width="30" height="31" alt=""></div>
            <div>
            
            <textarea name="" cols="" rows="" disabled class="comment-title-one" value="Lorem Ipsum"><%=q.getCommentText()%></textarea>
            <textarea name="" cols="" rows="" disabled class="comment-title-txt" value="Lorem Ipsum"><%=q.getCreatedDate() +" by "+q.getCommentOwner()%></textarea>
            </div>
          </div>
        </div>
		<%
			}
	%>
</div>
				<form:form
					action="${pageContext.request.contextPath}/query/comment/save"
					commandName="queryComment" method="POST"
					enctype="multipart/form-data"
					name="queryMessageForm"
					id="queryMessageForm">
					<form:input path="queryId" type="hidden" />
					<div class="comment-bx-two-drop-shadow">
						<div class="comment-bx-two-inset">
							<div class="comment-profile-one">
							 <% String photoPath = null;
							 	UserSession user = (UserSession) request.getSession().getAttribute("userSession"); 
							 	if(user != null){
							 		photoPath = user.getPhoto();
							 	}
							 	%>
								<img
									src="<%=FiinfraUtility.getImagePath(request, photoPath, "resources/images/temp_logo.png") %>"
									width="30" height="31" alt="">
							</div>
							<div class="comment-profile-two">
								<form:textarea path="commentText" rows="5" class="txt-editor"
									cols="30" placeholder="Query Comment" id="commentText"/>
								<div class="below-txt-editor-box">
									<div class="below-txt-editor-box-left">
										<ul>
											<li class="clearfix"><label class="form_label">Comment
													Type</label>
													
							<div id="comment_type" class="common_sliding_radio">
              					<span class="lbl_first lbl">Private</span>   
              					<span class="lbl_second lbl">Public</span> 
   								<input type="radio" name="target_type" value="Private" class="frist" checked />
   								<input type="radio" name="target_type" value="Public" class="second" />
   								
   								<form:radiobutton path="commentTypeName" id ="target_type" value="Private" required="required" />
								<form:radiobutton path="commentTypeName" id ="target_type" value="Public"  required="required" />
							</div>
													
							</li>
							<li><label class="form_label">Change Status</label> 
											<form:select
													path="status" name="status" itemLabel="name" itemValue="id" items="${status}">
												</form:select></li>
											<li><input type="button" value="Add Comment" onclick="formSubmit()"
												class="query_btn common_btn" id="query_btn_margin"></li>
										</ul>
									</div>
									<div class="below-txt-editor-box-right">
										<ul>
										 	<li>
											<form:input type="file" path="queryAttachment" size="50"
												class="query_btn common_btn" />
											</li>
<!-- 											<li><input type="submit" value="Attach"
												class="query_btn"> <input type="submit"
												value="Add Attachment" class="query_btn"></li>
 -->										</ul>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>

					<!-- Box Two Ends -->
				</form:form>
			</section>
		</section>
	</section>
	<!-- Main ends-->
</div>
<!-- Wrapper ends-->
