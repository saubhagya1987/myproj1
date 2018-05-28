$(document).ready(function(){
	getshuplist();
	//getGsCommentCount();
	
	
	
	$('#comment-form').validate({
	    rules: {
	      postCommentText:{
				
			    required: true				
			}
	    },
	    highlight: function(element) {
	        $(element).closest('.form-group').addClass('has-error');
	    },
	  unhighlight: function(element){
	        $(element).closest('.form-group').removeClass('has-error');
	    },
	    submitHandler: function(form) {
	    	jQuery.ajax({
	          type: "POST",
	          url :$('#contextPath').val()+"/dashboard/addGupShupComment.htm",
	          data: $(form).serialize(),
	          cache: true,
	          success: function() {
	        	 
	        	  $("#success-msg").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(5000);
	        	  document.getElementById("comment-form").reset();
	        	  getshuplist();
	          },
	          error: function() {alert('failed');}
	        });
	        return false;
	    }
	  });
	
	$('#contact-form').validate({
    rules: {
    	
      postId: {
      required: true
      },
    	postUrl: {
    
		  required: true
      },
		postText:{
		
		     required: true				
			}
    },
    highlight: function(element) {
        $(element).closest('.form-group').addClass('has-error');
    },
  unhighlight: function(element){
        $(element).closest('.form-group').removeClass('has-error');
    },
    submitHandler: function(form) {
    	jQuery.ajax({
          type: "POST",
          url :jQuery('#contextPath').val()+"/dashboard/addgupShup.htm",
          data: $(form).serialize(),
          cache: true,
          success: function() {
        	
        	  $("#success-msg-edit").show().html("<span class='label label-success'>Records updated successfully</span>").fadeOut(5000);
        	  document.getElementById("contact-form").reset();
       	     getshuplist();
          },
          error: function() {alert('failed');}
        });
        return false;
    }
  });

	
	$('#add-form').validate({
	    rules: {
	    	
	      postId: {
	      required: true
	      },
	    	postUrl: {
	    	  
			  required: true
	      },
			postText:{
				
			     required: true				
				}
	    },
	    highlight: function(element) {
	        $(element).closest('.form-group').addClass('has-error');
	    },
	  unhighlight: function(element){
	        $(element).closest('.form-group').removeClass('has-error');
	    },
	    submitHandler: function(form) {
	    	jQuery.ajax({
	          type: "POST",
	          url :jQuery('#contextPath').val()+"/dashboard/addgupShup.htm",
	          data: $(form).serialize(),
	          cache: true,
	          success: function() {
	        	
	        	  $("#success-msg-add").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(5000);
	        	  document.getElementById("add-form").reset();
	       	     getshuplist();
	          },
	          error: function() {alert('failed');}
	        });
	        return false;
	    }
	  });
	
	 function getshuplist(){
		 var contextPath=$('#contextPath').val();
		 var partyId=$('#partyId').val();
		 
		 $.ajax({
				
				type : "POST", 
				url :$('#contextPath').val()+"/dashboard/showGupShupList.htm",
				//dataType: 'json',
				contentType : 'application/json',
				success : function(result) {
					
						$('#gupshupMsg').empty();
						if(result != 0){
						$.each( result, function( index, value ) {
							
							 var postId=value.postId;
							// alert(index);
							 var postUrl=value.postUrl;
							 var postText=value.postText;
							 var postPerson=value.postPerson;
				             var createDate=value.createDate; 
				             var postPartyId=value.postPartyId;
				             getGsUserLike(postId);
				             getGsLikeCount(postId);
				             getGsCommentCount(postId);
				             if(partyId == postPartyId){
				            	 $('#gupshupMsg').append('<input type="hidden" name="postId" id="pid" value="'+postId+'"/><span class="label ticket-label"><a href="#" id="SPEditGupShupLink"><img src="'+contextPath+'/images/edit.png" data-toggle="modal" data-target=".editgupshup" onClick="getEditGuspShup('+postId+')"></a></span><span style="color: #428bca;text-decoration: none;">'+postUrl+'</span><span class="pull-right"><a href="#" onclick="getCommentList('+postId+')" data-toggle="modal" data-target=".comment"><img src="'+contextPath+'/images/comment_icon.png" title="Comments"/></a><span id="c'+postId+'"></span><a href="#" onclick="getLikeList('+postId+')" data-toggle="modal" data-target=".like"><img src="'+contextPath+'/images/Like-icon.png" width="28px" height="25px" title="Like"></a><span id="p'+postId+'"></span></span></br>'+postText+'</br><b>'+createDate+' by '+postPerson+'</b><br><a href="#" id="isLike'+postId+'" name="0" onClick="getPostId('+postId+',name)">Like</a>&nbsp<a href="#" id="mycomment" data-toggle="modal" data-target=".postcomment" onClick="getPostCommentId('+postId+')">Comment</a></br></br>');
				             }
				             else{
				            	 $('#gupshupMsg').append('<input type="hidden" name="postId" id="pid" value="'+postId+'"/><span style="color: #428bca;text-decoration: none;">'+postUrl+'</span><span class="pull-right"><a href="#" onclick="getCommentList('+postId+')" data-toggle="modal" data-target=".comment"><img src="'+contextPath+'/images/comment_icon.png" title="Comments"/></a><span id="c'+postId+'"></span><a href="#" onclick="getLikeList('+postId+')" data-toggle="modal" data-target=".like"><img src="'+contextPath+'/images/Like-icon.png" width="28px" height="25px" title="Like"></a><span id="p'+postId+'"></span></span></br>'+postText+'</br><b>'+createDate+' by '+postPerson+'</b><br><a href="#" id="isLike'+postId+'" name="0" onClick="getPostId('+postId+',name)">Like</a>&nbsp<a href="#" id="mycomment" data-toggle="modal" data-target=".postcomment" onClick="getPostCommentId('+postId+')">Comment</a></br></br>');
				             }
				            });
					
						}
						else{
							$('#gupshupMsg').append("</br><span class='label label-danger'>Records not found</span>");
						}
					}
				});
	 }

	
	 
}); // end document.ready

function getLikeList(postId){

	var contextPath=$('#contextPath').val();
	$.ajax({
		type : "GET", 
		url :$('#contextPath').val()+"/dashboard/showGsLikeList.htm?likeRefID="+postId,
		//dataType: 'json',
		contentType : 'application/json',
		success : function(result){

			$("#like_list").empty();
			$.each( result, function( index, value ) {
				var likePerson=value.likePerson;
				$("#like_list").append('<li class="list-group-item"> <img src="'+contextPath+'/images/Like-icon.png" width="28px" height="25px" title="Like"/> <span class="badge">'+likePerson+'</span>');
			});

		}
 });
}
function getCommentList(postId){
	var contextPath=$('#contextPath').val();
	$.ajax({
		type : "GET", 
		url :$('#contextPath').val()+"/dashboard/showGsCommentList.htm?postId="+postId,
		//dataType: 'json',
		contentType : 'application/json',
		success : function(result){

				$("#comment_list").empty();
			$.each( result, function( index, value ) {
				var postCommentText=value.postCommentText;
				var commentPerson=value.commentPerson;
				var createdDate=value.createdDate;
				$("#comment_list").append('<li class="list-group-item"><span class="badge" id="commentPerson">'+commentPerson+'</span><img src="'+contextPath+'/images/comment_icon.png" title="Comment"/>'+postCommentText+'</br>  Commented:'+createdDate+'</li>');
			});
	

		}
 });
}
function getGsUserLike(postId){
	$.ajax({
		type : "GET", 
		url :$('#contextPath').val()+"/dashboard/showGsUserLike.htm?postId="+postId,
		//dataType: 'json',
		contentType : 'application/json',
		success : function(result){
		
			$.each( result, function( index, value ) {
				var likeRefType=value.likeRefType;
				var likeRefID=value.likeRefID;
				$("#isLike"+likeRefID).empty();
				$("#isLike"+likeRefID).text('Liked');
			});
				

		}
 });
}
function getGsCommentCount(postId){
	
	 $.ajax({
			type : "GET", 
			url :$('#contextPath').val()+"/dashboard/showGsCommentCount.htm?postId="+postId,
			//dataType: 'json',
			contentType : 'application/json',
			success : function(result){
				
					
				$.each( result, function( index, value ) {
					var commentCount=value.commentCount;
					$("#c"+postId).empty();
					$("#c"+postId).append(commentCount);
				});
				
			}
	 });
}
function  getPostId(postId,isLike){
	
	$.ajax({

		type : "POST",
		url : $('#contextPath').val() + '/dashboard/addGupShupLike.htm?likeRefID='+postId,
		dataType: 'json',
		contentType : 'application/json',
		success : function() {
			
          	if(isLike==0){
				$("#isLike"+postId).text("Liked").removeAttr("href");
				getGsLikeCount(postId);
          	}else{
          		$("#isLike"+postId).text("Like");
          	}
		}
	});
}

function getGsLikeCount(postId){

	 $.ajax({
			type : "GET", 
			url :$('#contextPath').val()+"/dashboard/showGsLikeCount.htm?postId="+postId,
			//dataType: 'json',
			contentType : 'application/json',
			success : function(result){
				
				$.each( result, function( index, value ) {
					var likeCount=value.likeCount;
					$("#p"+postId).empty();
					$("#p"+postId).append(likeCount);
				});
	
			}
	 });

}

function getEditGuspShup(postId){
	 $.ajax({
			
			type : "POST", 
			//data:$('#addactivity').serialize(),
			url :$('#contextPath').val()+"/dashboard/getEditGSId.htm?postId="+postId,
			dataType: 'json',
			contentType : 'application/json',
			success : function(result) {
				
				/*$('#pd').empty();
				$('#purl').empty();
				$('#postText').empty();*/
				
				$.each( result, function( index, value ) {
					var postUrl=value.postUrl;
					var postText=value.postText;
					var postId=value.postId;
					
					$('#pd').val(postId);
					$('#purl').val(postUrl);
					$('#postText').val(postText);
					
				});
			}
	 });
	
}
