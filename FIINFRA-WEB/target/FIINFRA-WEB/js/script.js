
$(document).ready(function(){

		$('#contact-form').validate({
	    rules: {
	    	fullname: {
	    	  minlength: 5,
    		  required: true
	      },
	      	email: {
	    	  required: true,
					email:true
	      },
	        mobile: {
	      	  number: 1,
	          required: true
	      },
	        gender:{
	    	  required:true
	      },
	      searchString:{
	    	  required:true
	    	  },
	      Startdatename:{
	    	  required:true
	      },
					age:{
	    	  number: 1,
	        required: true
	      },
					url:{
	    	  url: true,
	        required: true
	      },
					city:{
					required:true
				},
					message:{
					minlength: 5,
	        required: true				
				}
	    },
	    highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
      unhighlight: function(element){
            $(element).closest('.form-group').removeClass('has-error');
        },
	  });

}); // end document.ready
