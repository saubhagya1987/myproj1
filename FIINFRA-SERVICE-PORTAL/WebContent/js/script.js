jQuery.noConflict();
jQuery(document).ready(function(){
	//getactivitytracker();
	getdataforrecentchat();
	 var contextPath=jQuery('#contextPath').val();

	
	 $("#activitySpend").keypress(function (e) {
	     //if the letter is not digit then display error and don't type anything
	     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	        //display error message
	        $("#errmsg").html("Digits Only").show().fadeOut("slow");
	         $(this).addClass('errrorInput');
	               return false;
	     }else{
	        $(this).removeClass('errrorInput');
	     }
	         
	   });
	 
	 jQuery('#sendquery').validate({
	    rules: {
	    	chatText: {
	    	  minlength: 1,
    		  required: true
	      }
	    },
	  //custom error messages
        messages: {
        	chatText:{
          required: "Please enter your message"
          }
        },
	    highlight: function(element) {
	    	jQuery(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function(element){
        	jQuery(element).closest('.form-group').removeClass('has-error');
        },
        
        submitHandler: function(form) {
        	jQuery.ajax({
              type: "POST",
              url :jQuery('#contextPath').val()+"/dashboard/sendQuery.htm",
              data: $(form).serialize(),
              timeout: 3000,
              success: function() {
            	//alert('Record Added successfully');
            	  
            	  $("div").scroll(function(){
            		    $("span").text(x+=1);
            	  });
				//location.reload();
            	  $("#recentchat").empty();
            	  document.getElementById("sendquery").reset();
            	  
            	  getdataforrecentchat();
            	  $("#recentchat").focus();
              },
              error: function() {alert('failed');}
            });
            return false;
        }
        
        
	  });
	 



	 
	 jQuery('#addactivity').validate({
		 
		    rules: {
		    	activityTypeId:{
		    		required: true
		    	},
		    	activityContextId:{
		    		required: true
		    	},
		    	activitySpend:{
		    		 number: 1,
		    		 required: true
		    	},
		    	activityNote: {
	    		  required: true
		      }
		    },
		    highlight: function(element) {
		    	jQuery(element).closest('#error-msg').addClass('has-error');
	        },
	        unhighlight: function(element){
	        	jQuery(element).closest('#error-msg').removeClass('has-error');
	        }, 
		  });
	 
	 jQuery('#savenew').click(function() {
		 if(jQuery('#addactivity').valid()){  
			// var sendEmail=jQuery('#sendEmail').val();
			
             jQuery.ajax({
	              type: "POST",
	              url :jQuery('#contextPath').val()+"/dashboard/addPartnerActivity.htm",
	              data: jQuery('#addactivity').serialize(),
	              success: function(result) {
	            	//  alert(sendEmail);
	            	  jQuery("#error-msg03").remove();
	            	  var activityId=$('#activityId').val();
	            	  var sendEmail=$('input[name="sendEmail"]:checked').val();
	         
		            	  if( sendEmail == 1 || sendEmail == 2 || sendEmail == 3 || sendEmail == 4){
		            	  showAlertMessage("Success", "<br/>Call tracker log added successfully & mail has been sent", "confirmation");
		            	  }else{
		            	  showAlertMessage("Success", "<br/>Call tracker log added successfully", "confirmation");
		            	  }
	            	  //  jQuery("#success-msg").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(3000);
	            	  document.getElementById("addactivity").reset();
	            	  jQuery("#list").empty();
	            	
					},
	              error: function() {alert('failed');}
	            });
		 }
	    });
	 jQuery('#saveclose').click(function() {
		 if(jQuery('#addactivity').valid()){  
			
             jQuery.ajax({
	              type: "POST",
	              url :jQuery('#contextPath').val()+"/dashboard/addPartnerActivity.htm",
	              data: jQuery('#addactivity').serialize(),
	              success: function(result) {
	            	  jQuery("#error-msg3").remove();
	            	  var activityId=$('#activityId').val();
	            	  //var sendEmail=document.getElementById("sendEmail").checked;
	            	  
	            	  var sendEmail=$('input[name="sendEmail"]:checked').val();
	            	
		            	  if( sendEmail == 1 || sendEmail == 2 || sendEmail == 3 || sendEmail == 4){
		            	  showAlertMessage("Success", "<br/>Call tracker log added successfully & mail has been sent", "confirmation");
		            	  }else{
		            	  showAlertMessage("Success", "<br/>Call tracker log added successfully", "confirmation");
		            	  }
	            	   //jQuery("#success-msg").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(3000);
	            	  document.getElementById("addactivity").reset();
	            	  jQuery("#list").empty();
	            	reload();
					},
	              error: function() {alert('failed');}
	            });
		 }
	    });
	 
	 jQuery('#editactivity').validate({
		 
		    rules: {
		    	activityTypeId:{
		    		required: true
		    	},
		    	activityContextId:{
		    		required: true
		    	},
		    	activitySpend:{
		    		 number: 1,
		    		 required: true
		    	},
		    	activityNote: {
	    		  required: true
		      }
		    },
		    highlight: function(element) {
		    	jQuery(element).closest('#error-msg').addClass('has-error');
	        },
	        unhighlight: function(element){
	        	jQuery(element).closest('#error-msg').removeClass('has-error');
	        }, 
		  });
	 
	 jQuery('#editsavenew').click(function() {
		 if(jQuery('#editactivity').valid()){  
			// var sendEmail=jQuery('#sendEmail').val();
			
          jQuery.ajax({
	              type: "POST",
	              url :jQuery('#contextPath').val()+"/dashboard/addPartnerActivity.htm",
	              data: jQuery('#editactivity').serialize(),
	              success: function(result) {
	            	//  alert(sendEmail);
	            	  jQuery("#error-msg03").remove();
	            	  var activityId=$('#editactivityId').val();
	            	  var sendEmail=$('input[name="sendEmail"]:checked').val();
	            	 
	            	  var sendEmail=$('input[name="sendEmail"]:checked').val();
	  	            
            		  if( sendEmail == 1 || sendEmail == 2 || sendEmail == 3 || sendEmail == 4){
		            	  showAlertMessage("Success", "<br/>Call tracker log updated successfully & mail has been sent", "confirmation");
		            	}else{
		            	  showAlertMessage("Success", "<br/>Call tracker log updated successfully", "confirmation");
		            	}
            		  
	            	  //  jQuery("#success-msg").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(3000);
	            	  document.getElementById("editactivity").reset();
	            	  jQuery("#list").empty();
	            	  reload();
					},
	              error: function() {alert('failed');}
	            });
		 }
	    });
	 jQuery('#editsaveclose').click(function() {
		 if(jQuery('#editactivity').valid()){  
			
          jQuery.ajax({
	              type: "POST",
	              url :jQuery('#contextPath').val()+"/dashboard/addPartnerActivity.htm",
	              data: jQuery('#editactivity').serialize(),
	              success: function(result) {
	            	  jQuery("#error-msg3").remove();
	            	  var activityId=$('#editactivityId').val();
	            	  //var sendEmail=document.getElementById("sendEmail").checked;
	            	  
	            	  var sendEmail=$('input[name="sendEmail"]:checked').val();
	            
	            		  if( sendEmail == 1 || sendEmail == 2 || sendEmail == 3 || sendEmail == 4){
			            	  showAlertMessage("Success", "<br/>Call tracker log updated successfully & mail has been sent", "confirmation");
			            	}else{
			            	  showAlertMessage("Success", "<br/>Call tracker log updated successfully", "confirmation");
			            	}
	            	  //jQuery("#success-msg").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(3000);
	            	  document.getElementById("editactivity").reset();
	            	  jQuery("#list").empty();
	            	  List();
	            	  reload();
					},
	              error: function() {alert('failed');}
	            });
		 }
	    });
	 
	 function reload()
	 {
	 location.reload();
	 }
	/* function  getactivitytracker(){
		 var contextPath=jQuery('#contextPath').val();
			var partyID =jQuery('#partyID').val();
		// alert(partyID)
			jQuery.ajax({
				
				type : "POST", 
				url :jQuery('#contextPath').val()+"/dashboard/showPartnerActivityTracker.htm?partyID="+partyID,
				//dataType: 'json',
				contentType : 'application/json',
				success : function(result) {
					//alert(result)
					if(result != 0){
						jQuery.each( result, function( index, value ) {
						 var activityType=value.activityType;
						 var activityNote=value.activityNote;
						 var activityFor=value.activityFor;
						 var activityDate=value.activityDate;
						 var activitySpend=value.activitySpend;
						 var activityId=value.activityId;
						 var postPartyId=value.postPartyId;
						 var activityContext=value.activityContext;
						 
						 $("#list").append('<div class="ticket"> <span class="label ticket-label"><a id="SPEditActivityTrackerLink" href="#"><img src="'+contextPath+'/images/edit.png" onClick="editNote();getActivity('+activityId+')"></a></span><strong>'+activityType+'/'+activityContext+'</strong><br/><span style="display:inline-block;width:280px; white-space: nowrap;overflow:hidden !important;text-overflow: ellipsis;">'+activityNote+'</span></span><br/><span class="ticket-info"> By <span style="color: #428bca;text-decoration: none;">'+activityFor+' </span>'+activityDate+', Duration: '+activitySpend+' mins  </span></div>');
						 
					 });
					}else{
						$("#error-msg3").append("<span class='label label-danger'>Records not found</span>");
					}
				}
		 });
	 }
	*/
	 function getdataforrecentchat() {
		 
			// alert('hiii');
			 var contextPath=$('#contextPath').val();
			// alert(contextPath)
			 var partyID = $('#partyID').val();
			// alert(partyID)
			// alert($('#contextPath').val())
			 $.ajax({
		
					type : "POST", 
					url :$('#contextPath').val()+"/dashboard/showPartnerRecentChat.htm?partyID="+partyID,
					//dataType: 'json',
					contentType : 'application/json',
					success : function(result) {
					//alert(result)	
						 $("#recentchat").empty();
					if(result != 0){
						 $.each(result, function( index, value ){
							 var chatText=value.chatText;
							 var chatUrl=value.chatUrl;
							 var lastUpdatedDate=value.lastUpdatedDate;
				             var recordTypeID=value.recordTypeID;
				             var clientName=value.clientName;
				             var firstDocumenturl=value.firstDocumenturl;
	
				           // alert(documentId);
				            // alert(firstDocumenturl);
				             
				             var elem = $('#recentchat');
				             var atBottom = (elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight());
				             if(recordTypeID == 14008 || recordTypeID ==14012 || recordTypeID==14001){
				            	 $("#recentchat").append('<div class="chat-conv "><img data-original-title="'+clientName+'" alt="Avatar" class="c-avatar ttip" src="'+contextPath+'/images/chatusercomment.png" data-toggle="tooltip" title="'+clientName+'"><div style="top: -23px; right: -6px; display: block;" class="tooltip fade top in"><div class="tooltip-arrow"></div><div class="tooltip-inner">'+clientName+'</div></div><div class="c-bubble"><div class="msg">'+chatText+'&nbsp<a href="'+chatUrl+'" class="chat-url">'+chatUrl+'</a></div><div><small>'+lastUpdatedDate+'</small></div><span></span></div></div>'); 
				            	 
				            	 if (atBottom) $('#recentchat').scrollTop($('#recentchat')[0].scrollHeight);
				             }else  if(recordTypeID == 14003){
				            	 $("#recentchat").append('<div class="chat-conv sent"><img data-original-title="'+clientName+'" alt="Avatar" class="c-avatar ttip" src="'+contextPath+'/images/chatusercomment.png" data-toggle="tooltip" title="'+clientName+'"><div style="top: -23px; left: -2px; display: block;" class="tooltip fade top in"><div class="tooltip-arrow"></div><div class="tooltip-inner">'+clientName+'</div></div><div class="c-bubble"><div class="msg">'+chatText+'&nbsp<a href="'+chatUrl+'" class="chat-url">'+chatUrl+'</a></div><div><small>'+lastUpdatedDate+'</small></div><span></span></div></div>'); 
				         
				            	 if (atBottom) $('#recentchat').scrollTop($('#recentchat')[0].scrollHeight);
				             }
				          });
					}else{
	
						 $("#recentchat").append("<span class='label label-danger'>Records not found</span>");
					}
					}
			 });
		 }	
	 

	 setInterval(function() {
         getdataforrecentchat();
     }, 90000
     
	 );
	 
}); // end document.ready