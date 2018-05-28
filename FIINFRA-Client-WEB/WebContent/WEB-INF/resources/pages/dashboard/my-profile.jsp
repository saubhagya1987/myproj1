<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.common.util.AuthHandler"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.Date"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.common.diy.models.Party"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@page import="in.fiinfra.common.common.ProfileData"%>
<% UserSession _USER = AuthHandler.getCurrentUser(); %>
<script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.Jcrop.css" type="text/css" /> 
<style>
.ui-button  {
    background:#87b87f !important;
   
    
}​
</style>

<script>
  function saveProfile(action){
	 alert(('#profile-form').serialize());
if($('#birth_date').datepicker('getDate') == null ){
		  showMessage('Please Enter Date Of Birth',true);
		  return;
	  }
	  if($('#genderId').val() ==null ||  $('#genderId').val() =='' || $('#genderId').val() ==0   ){
		  showMessage('Please Select Gender',true);
		  return;
	  } 
 	  if($('#panNumber').val().length >10 ){
		  showMessage('Please Enter Valid Pan Number',true);
		  return;
	  }  
	  
	   if($("#profile-form" ).validate()){
		  $('#action').val(action);
		  //alert($("#profile-form" ).serialize());
		   $('#profile-form').submit();   
		   
	  } 
  }
  </script>
<script>

function checkPan(val) {
    
    if (val != "") {
    	return  /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(val);
    }
    return true;
}

$(document).ready(function(){
	
	$("#panNumber").focusout(function(){
		  $(this).val( $(this).val().toUpperCase() );
		});
	$("#panNumber").attr('maxlength','10');
	
	
	$.validator.addMethod("checkPan", function (value, element) {
        return checkPan(value);
    }, 'Invalid Pan No');
	
	
$("#profile-form").validate({ 
	errorClass:"errors", 
	ignore: "",
	invalidHandler: function(e, validator){
        if(validator.errorList.length)
        var tabb=jQuery(validator.errorList[0].element).closest(".tab_border").index();
       //$('#tabs a[href="#' + jQuery(validator.errorList[0].element).closest(".tab_border").attr('id') + '"]').tab('option','active',tabb == -1 ? 0 : tabb - 1);
       $('#tabs').tabs('option', 'active', tabb == -1 ? 0 : tabb - 1);
    },
	
	 rules : {
		 
		 lastName: { required:true },
         email : {required : true , email : true },
         salutationId : {required : true ,digits: true,	min:1 },
         panNumber:{checkPan: true}
	 },
	 messages : {
		 
		 lastName : "Enter Last name",
		 email : {required:"Enter email ID", email: "Enter valid mail ID"},
		 salutationId : "Enter salutation",
		 panNumber :{exactlength:'Invalid Pan number',pattern:'Invalid Pan number'}
	 } 
});


});

</script>
<script>
 var checkPopupRedirect=true;
  function showPasswordPopup(src){
	
	  /* $('#password_details_bx').dialog('open');
	  $(".ui-dialog-titlebar-close").hide(); */
	  
	 /*  bootbox.confirm("<form id='infos' action=''>\
			  Existing Password:<input type='text'  /><br/><br/>\
			  New Password:<input type='text' /><br/><br/>\
			  Re-EnterPassword:<input type='text' />\
			    </form>", function(result) {
			        if(result)
			            $('#infos').submit();
			}); */
	  bootbox.confirm("<span>Password should be combination of letters + special characters + numbers</span><br/><br/><form id='infos' action=''>\
			  &nbsp&nbsp&nbsp&nbsp&nbsp&nbspExisting Password:<input type='password'  /><br/><br/>\
			  &nbsp&nbsp&nbsp&nbsp&nbsp&nbspNew Password:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='password' /><br/><br/>\
			  &nbsp&nbsp&nbsp&nbsp&nbsp&nbspRe-EnterPassword:<input type='password' /><br/><br/>\
			    </form>", function(result) {
			if(result==true)
				{
				/* window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa=income"; */
				}
			
			}); 
  }
 
  $(document).ready(function(){
	  
	  $('#password_details_bx').dialog({
		    autoOpen: false,
		    closeOnEscape: false,
		    dialogClass:'',
			width:'auto',
			height:'auto',
			minHeight: 80,
			modal: true,
			title:"Change Password",
			 buttons: {
			        "Submit": function() {
			        			        
			        	if($("#existingPassword").val()=='' ||$("#newPassword").val()==''||$("#reEnterPassword").val()==''){
			        		$("#erroMsg").html("All fields are mandatory");
			        	}else{
			        	savePassword();
			        	}    	
			        		
			        	
			         // $( this ).dialog( "close" );
			        }
	  <% if(!_USER.getIsForceChangePasswordOnLogin()){%>
	  ,
			        "Cancel": function() {
			        	cancleClick();
			          //$( this ).dialog( "close" );
			        }
			      
		 <%}%>
			      }
		});  
	  
	  <% if(_USER.getIsForceChangePasswordOnLogin()){%>
	  	  checkPopupRedirect = false;	
	  	  showPasswordPopup('force');
		 
	  <%}%>
	    
  });
  function cancleClick(){
	  
	  $("#erroMsg").html("");
	  $("#existingPassword").val('');
	  $("#newPassword").val('');
	  $("#reEnterPassword").val('');
  if(checkPopupRedirect=true){
	 
	  $('#password_details_bx').dialog('close');
	  
  }else{
	  window.location.href="${pageContext.request.contextPath}/sign-out?buId=<%=_USER.getBuId()%>";
  }
  }
  </script>
  
<script>
 function validate(){
	
  $(function() {
    
    $("#password-form").validate({
   
    	
    	errorClass:"errors", 
        rules: {
        	existingPassword: {required: true},
        	newPassword: {required: true},
        	reEnterPassword: {required: true}
            
        },
        
        // Specify the validation error messages
        messages: {
        	existingPassword: "Please enter Existing Password",
        	newPassword: "Please enter New Password",
        	reEnterPassword: "Please Re-Enter New Password",
      },
       
    });



  });
  }
  </script>  
  
<script>

var naturalWidth = 0;
var naturalHeight = 0;
var ratioW = 0;
var ratioH = 0;
var aspectRatio =  1;
var JcropAPI ;
function attachJCrop(){
	
	if(JcropAPI){
		JcropAPI.destroy();	
	}
	
	JcropAPI = $('#preview').data('Jcrop');
	
	//var h = $('#preview').width() /aspectRatio ;
	//var imageHeight = $('#preview').height();
	//var y = (imageHeight/2)-(h/2);
	//alert(imageHeight +'  '+h +' '+y);
	$('#preview').Jcrop({
		minSize: [50, 50],
		setSelect:   [ 10, 10, 100, 100],
		bgFade: true,
		aspectRatio: 1,
		bgOpacity: .3,
	    onChange: function(c) {
	    	//console.log(c.x * ratioW+' '+c.y* ratioH+' '+c.w* ratioW+'  '+c.h* ratioH);
	    	$('[name="x"]').val(c.x * ratioW);
	    	$('[name="y"]').val(c.y* ratioH);
	    	$('[name="w"]').val(c.w* ratioW);
	    	$('[name="h"]').val(c.h* ratioH);
		},
		onSelect: function(c) {
	    	//console.log(c.x * ratioW+' '+c.y* ratioH+' '+c.w* ratioW+'  '+c.h* ratioH);
	    	$('[name="x"]').val(c.x * ratioW);
	    	$('[name="y"]').val(c.y* ratioH);
	    	$('[name="w"]').val(c.w* ratioW);
	    	$('[name="h"]').val(c.h* ratioH);
		},
	    bgColor: 'black',
	    bgOpacity: .3
	}

	);
	$('[name="x"]').val(10);
	$('[name="y"]').val(10);
	$('[name="w"]').val(100);
	$('[name="h"]').val(100);
}

function readURL(input) {
	$("#preview").attr('src','');
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		

		reader.onload = function(e) {
			$('#preview').attr('src',
					e.target.result);
			attachJCrop();
			var image = $('#preview');

			var originalWidth = image[0].naturalWidth; 
			var originalHeight = image[0].naturalHeight;
			var w = $('#preview').width();
			var h = $('#preview').height();
			
			console.log(originalWidth +'  '+originalHeight);
			
			ratioW = (originalWidth)/(w);
			ratioH = (originalHeight)/(h);
			if(ratioW ==0){
				ratioW = 1;
			}
			if(ratioW ==0){
				ratioW = 1;
			}
			if(ratioH ==0){
				ratioH = 1;
			}
			
			//alert(originalWidth +'  '+originalHeight +'  '+ratioW +'  '+ ratioH );
			//console.log(originalWidth +"  "+originalHeight +" "+w +"  "+h +"  "+ratioW +"  "+ratioH);
			
		}

		reader.readAsDataURL(input.files[0]);
	}
}

</script>

  <script>
  
  function initControls(){
	 /*  $("select").selectBoxIt(); */
	  $( ".datepicker" ).datepicker({
		  dateFormat: "dd-MMM-yy",
	      showOn: "button",
		  buttonText: '',
		  yearRange: "-100:+0", 
		  changeMonth: true,
	      changeYear: true,
	      maxDate: '0'
	     });
	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	  
	  $( "#birth_date" ).datepicker({
		  dateFormat: "dd-MMM-yy",
	      showOn: "button",
		  buttonText: '',
		  yearRange: "-100:+0", 
		  changeMonth: true,
	      changeYear: true,
	      maxDate: '0'
	     });

	  $( ".datepicker" ).attr( 'readOnly' , 'true' );
  }
$(document).ready(function(){
  	$( "#tabs" ).tabs();
    $("#upload").change(function() {
		readURL(this);
		//$('#preview').Jcrop();
	});
	  initControls();
	  
 
});
</script>
  <!-- Custom Selectbox Ends -->
  <script>
$(document).ready(function(){

  $(".selectboxit-container ").click(function(){
    //$('#personal_details_accordian').perfectScrollbar("update");
	//$('#contact_details_accordian').perfectScrollbar("update");
//	$('.family_details').perfectScrollbar("update");
	});
	 $(".thumb_select_ul a").click(function(){
		 
		
    $(this).children(".categoery").toggleClass("applicable");
     
     if($(this).hasClass('male')){
    	 $('#genderFemale').removeClass("applicable");
     }
     else{
    	 $('#genderMale').removeClass("applicable");
     }
     
     if($('#genderFemale').hasClass('applicable')){
    	 $('#genderMale').removeClass("applicable");
    	 $("#genderId").val(12002);
     }
     if($('#genderMale').hasClass('applicable')){
    	 $('#genderFemale').removeClass("applicable");
    	 $("#genderId").val(12001);
     }
}) 
}) 
</script>

  <!-- custom scroll to "common_in_content" -->
  <script>
$(document).ready(function(){
	  //Tracker Details Rating value Slider
	  createSlider('#Conversion_Probability',0,100,1,"#C_P_Value")
	  createSlider('#opportunity_rating',1,3,1,"")
	  
	  
  });

</script>
  <!-- custom scroll to "common_in_content" -->

  <script>

  
  $(function() {
    $( "#Profile_Info_Tab" ).accordion({
		heightStyle: "content",
    autoHeight: false,
    clearStyle: true, 
		
		});

	
	 // Preferred Product Count Intlalized	
	var count=3;
	
	//Add Button Starts
	//Add Button Starts
  $(".family_details").on("click", ".add", function() {
	   $(this).fadeOut();
	   count++;
	   
	$(this).prev(".close").fadeIn();

	for (var i=0;i<100;i++){
		if(!$('#associatedFirstName'+i).length >0){
			count = i;
			break;
		}
	}
	
	
	$(this).closest('ul').find('[id^=relationshipId]')
	var selectBox = "<select id='relationshipId"+count+"' name='associatedParties["+count +"].relationshipId'> " +
	$(this).closest('ul').find('[id^=relationshipId]').html() +	 "</select>" ;
	$(this).closest('ul').find('[id^=workProfessionFamily]')
	var selectBox1 = "<select id='workProfessionFamily"+count+"' name='associatedParties["+count +"].workProfession'> " +
	$(this).closest('ul').find('[id^=workProfessionFamily]').html() +	 "</select>" ;
	
	var div = "<ul class='reset clearfix Family_Details_col clearfix'><li class='clearfix li_one'>" +
	 "<input id='associatedFirstName"+count +"' name='associatedParties["+count +"].firstName' type='text' class='common_input' placeholder='First Name'/></li>" +
	 "<li  class='clearfix li_two'><input id='associatedLastName"+count +"' name='associatedParties["+count +"].lastName' type='text' class='common_input' placeholder='Last Name'/></li>"+
	 "<li class='clearfix li_three'><input id='birth_date"+count+"' name='c' type='text' placeholder='dd-mmm-yyyy' class='birth_date common_input5 datepicker'></input></li>"+
	 "<li class='clearfix li_five'>"+selectBox+"</li>"+
	 "<li class='clearfix li_five'>"+selectBox1+"</li>"+
	 "<li class='clearfix li_five'><input name='associatedParties["+count +"].panNumber' type='text' id='panNo' class='common_input' placeholder='Pan Number' ></li>"+
	 "<li class='clearfix li_six'><span class='common_input3'></span><div class='close '>X</div><div class='add'>+</div></li></ul>"; 
	
	
	 $(this).parent().closest("ul").after(div);
	 
	 $('#relationshipId'+count).val("-1");
	 $('#workProfession'+count).val("-1");
	 
	 //$(this).parent().closest("ul").find('[id^=relationshipId]').val("-1");
	 
	 
	 $(".birth_date").rules("add", {
			
		 "CheckDOB": true,
			
	}); 
	 
	 
	
	
	addValidationForFamilyDetails();
	   //Preferred Product Count Written
	 $("select").selectBoxIt();
	 // createSlider("#your_age"+count,0,100,1,"#age"+count);
	  
     $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  yearRange: "-100:+0", 
	  changeMonth: true,
      changeYear: true,
      maxDate: '0'
     });
     
     $( ".datepicker" ).attr( 'readOnly' , 'true' );

  
   $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
     
	  //$('.EP_cnt').perfectScrollbar('update');
	 
	  
	});

// Close Button 
$(".family_details").on("click", ".close", function() {
	
	$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
	$(this).parent().closest("ul").prev("ul").addClass("moved_down");
	var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
	
	var partyID =  $(this).closest('ul').find('[id^=relatedPartyId]').val();
	
	var element = $(this);
	
	if(partyID >0){
		$('body').addClass("loading");
	
		showConfirm("Delete Current Record ?", function() {
			
				 $.ajax(
						    {
						        url : "${pageContext.request.contextPath}/profile/profile/delete?RelatedPartyId="+partyID,
						        type: "GET",
						        dataType: 'json',
						        success:function(data, textStatus, jqXHR)
						        {	
						        	$("body").removeClass("loading");
						        	if(data.error){
						    			showMessage(data.error,true);
						    			clearTimeout(timeout);
						    		}
						    		else{
						    			
						    			showMessage(data.success,false);
						    			if($(".Family_Details_col").length == 1){
						    				  $(element).parent().closest('ul').find('input[id^=associatedLastName]').val('');
						    				  $(element).parent().closest('ul').find('input[id^=associatedFirstName]').val('');
						    				  $(element).parent().closest('ul').find('input[id^=birth_date]').datepicker('setDate', null);
						    				  $(element).parent().closest('ul').find('input[id^=relatedPartyId]').val(-1);
						    				  $(element).parent().closest('ul').find('[id^=relationshipId]').prop('selectedIndex', 0);
						    				  $(element).parent().closest('ul').find('[id^=relationshipId]').change();
						    				  $(element).parent().closest('ul').find('input[id^=panNo]').val('');
						    				  $(element).parent().closest('ul').find('[id^=workProfessionFamily]').prop('selectedIndex', 0);
						    				  $(element).parent().closest('ul').find('[id^=workProfessionFamily]').change();
						    			}
						    			else{
							        	$(element).parent().closest("ul").remove();
							    	    $("ul:last-of-type").find(".add").fadeIn(); 
						    			}
						    		}
						        },
						        error: function(jqXHR, textStatus, errorThrown)
						        {
						        	$("body").removeClass("loading");
						        	showMessage('Error While Saving.',true);
						        }
						    });
		});
	}
	else{
		ensureOne();
		$(this).parent().closest("ul").remove();
	    $("ul:last-of-type").find(".add").fadeIn(); 
	    
	}
	
	// removing record

// Preferred Product Ends

	
	});	
	
	
	<% Party party1=(Party)request.getAttribute("party");  
	// if(!party1.getAssociatedParties().isEmpty()){
	 //for(int i=0;i<party1.getAssociatedParties().size()+5;i++){
	 %>
	 addValidationForFamilyDetails();

  });
  
  function ensureOne(){
	  
    if($(".Family_Details_col").length == 0){
		  $(".family_details").click();
	  }
  }
  
  function addValidationForFamilyDetails(){
		 $(".Family_Details_col").each(function( ) {
			  
				
			  var lName = $(this).find('input[id^=associatedLastName]');
			  var fName = $(this).find('input[id^=associatedFirstName]');
			  var dob = $(this).find('input[id^=birth_date]');
			  var relation = $(this).find('select[id^=relationshipId]');
			  var id = $(this).find('input[id^=relatedPartyId]').val();
			  var pNum = $(this).find('input[id^=panNo]');
			 
			  
/* 			  $(fName).rules("add", {
				   	minlength: 1,
				   	required: {
				   		depends: function () { console.log($(fName).val()); return id>0 || $(lName).val().length>0 ;}
				   	},
				    	messages: {
				       	required: "Required input",
				       	minlength: "Please Enter Valid Name"
				      }  
				  }); */
		      errorClass:"errors", 
			  $(lName).rules("add", {
			   	minlength: 1,
			   	required: {
			   		depends: function () { console.log($(fName).val()); return id>0 || $(lName).val().length>0 ;}
			   	},
			    	messages: {
			       	required: "Required input",
			       	minlength: "Please Enter Valid Name"
			      }  
			  });

			  $(dob).rules("add", {
				   
				   required: {depends: function () { return id>0 || $(lName).val().length>0 ;}},
				      messages: {
				       required: "Required input",
				       
				      } 
			  });
			  
			  $(relation).rules("add", {
				   min:function() {
					     return (id>0 || $(lName).val().length>0) ? 1:-1 ;
					   },
				      messages: {
				       min: "Required input",
				      }  
				  });
			  
		    $(pNum).rules("add", {
		    	checkPan: {
		    	depends: function () {
		    		return id>0 || $(lName).val().length>0 ;
		    		}, 
		    	},
			      messages: {
			    	  checkPan: "Enter proper pan Number"
			      }  
			  });
		  
		 });
		 
		 
  }
  </script>
  <script>
$(document).ready(function(){	
	
	$("select#country1").bind({
		"change": function(){
			if($("#country1").val() != ""){
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevaluesforparentid?parentId=" + $("#country1").val(), '{}', "#state1");	
			}
		}
	});


	$("select#state1").bind({
		"change": function(){
			if($("#stateId").val() != ""){
				jsonPopulateDropdown("${pageContext.request.contextPath}/common/getCities?parentId=" + $("#state1").val(), '{}', "#city1", true);	
			}
		}
	});
	
});
</script>
<script type="text/javascript">


</script>
  </head>
  <% ProfileData myProfile=(ProfileData)request.getAttribute("profile"); %>
  
  
  
  
                                        <div class="fr btn-group">
					 					<button type="submit" onclick="showPasswordPopup('changePwd')" class="btn-primary btn-xs btn">My Password 
                                          <i class=""></i></button>
                                          </div>
                                         <!-- <a class="btn btn-success" onclick="addMcl()">Add MCL</a> -->
                                         
					<!-- <input type="submit" class="btn btn-info btn-sm" name="submit" value="Download" /> -->
				
    
     <%-- <a href="#" class="my-history-btn clearfix fr">My History</a> --%>
      <%--  <a class="right my-docs-btn clearfix fr btn btn-success" onclick="showPasswordPopup('changePwd')"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Password</a> --%>
      <%--  <a href="${pageContext.request.contextPath}/profile/password" class="my-password-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Password</a> --%> 
      <%--  <a href="#" class="my-profile-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Profile</a> --%>
    <!-- end of "header-strip" id -->
    
    
    <!-- end of "inner-shadow-strip" id -->
    <% Party party=(Party)request.getAttribute("party");  
       UserSession user = AuthHandler.getCurrentUser();
    %>
    
    <div id="contents">
    <form:form action="${pageContext.request.contextPath}/profile/save"
			commandName="party" method="POST" id = "profile-form" enctype="multipart/form-data">
      <section class="in_content clearfix" id="personalization">
        <div style="padding:10px 10px 0;">
        	<div class="tabbable">
            <ul class="nav nav-tabs" id="myTab4">
              <li class="active"><a data-toggle="tab" href="#tabs-1">Personal Details</a></li>
              <li><a data-toggle="tab" href="#tabs-2">Contact Details</a></li>
              <li><a data-toggle="tab" href="#tabs-3">Family Details</a></li>
              <li><a data-toggle="tab" href="#tabs-4">Profile Photo</a></li>
            
            </ul>
             <div class="tab-content">
            <div id="tabs-1" class="tab-pane in active">
              <div id="personal_details"> 
             <%--  ${success} --%> 
              <form:input path="id" name="partyId" type="hidden"></form:input>
              <form:input path="recordTypeId" name="recordTypeId" type="hidden"></form:input>
              <fieldset>
                 <div class="col-xs-12 ">
                <div class="form-group"> <span > </span>
                <div class="col-lg-2">
                <label class="form_label">Name</label>
                </div>
                <div class="col-lg-2">
                 <select id="salutationId" name="salutationId" class="form-control" >
                  <option value='0'>--Select--</option>
                  <%  List<CodeValueData> salutations=(List<CodeValueData>)request.getAttribute("salutations");
                  for (CodeValueData idv:salutations){
                  %>
                  
                  <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(party.getSalutationId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
                  <%}%>
                  </select>
                  </div>
                  <div class="col-lg-4">
                <form:input id="firstName" path="firstName" type="text" class="form-control" value="<%=party.getFirstName() %>" placeholder="First Name" />
                </div>
                <div class="col-lg-4">
                <form:input path="lastName"  type="text" class="form-control required" value="<%=party.getLastName() %>" placeholder="Last Name" /> 
                </div>
              </div>
               
              </div>
               </fieldset>
              <br>
             <hr>
              <!-- New Code  -->
              
              <!-- New Code End -->
              <div class="row">
              
               <fieldset>
               <div class="col-xs-12">
               	
                  
                  	<div class="form-group">
                   
                      <label class="col-lg-2 control-label">Date of Birth <span class="required">*</span></label>
                      
                       <div class="col-lg-3">
                       <div class="input-group">
                      <input id="birth_date" data-provide="datepicker" data-date-format="d-M-yyyy" path="dobAsString" type="text" class="form-control datepicker"  value="<%=party.getDobAsString()%>" name="dobAsString" placeholder="dd-mmm-yyyy" ></input>
                   			<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>
                   	</div>
                   	<label class="col-lg-2 control-label">Occupation</label>
                      
                      <div class="col-lg-3">
                      <form:select path="workProfession" id="workProfession" itemLabel="name" itemValue="id"
							items="${occupations}" class="form-control">
						</form:select>
						</div>
                   	</div>
                   	<br> <br>
                   
                   
                   <div class="form-group">
                      <label class="col-lg-2 control-label">Gender <span class="required">*</span></label>
                     <div class="col-lg-3"> 
                      <ul class="reset clearfix thumb_select_ul emergency_categoery_ul" >
                        <li class="fl clickable" id="male" ><a class ='male' href="#">
                          <div id = "genderMale" class="categoery <%= Integer.valueOf(12001).equals(party.getGenderId())? "applicable":""%>">
                          <div class="thumb male" ></div>
                        </div>
                          <label class="label">Male</label>
                          </a></li>
                        <li class="fl clickable" id="female" ><a class ='female' href="#">
                          <div id = "genderFemale"  class="categoery <%=Integer.valueOf(12002).equals(party.getGenderId())? "applicable":""%>">
                          <div class="thumb female"></div>
                        </div>
                          <label class="label">Female</label>
                          </a></li>
                          <input name="genderId" id="genderId" value="<%=party.getGenderId() == null ? 0 : party.getGenderId()  %>"  type="hidden" >
                        </input>
                      </ul>
                      </div>
                      <label class="col-lg-2 control-label">Company Name</label>
                    
                     <div class="col-lg-3"> 
                      <form:input class="form-control" path="companyName"></form:input>
                      </div>
                      </div>
                      <br> <br>
                   		<label class="col-lg-2 control-label">Designation</label>
                     
                      <div class="col-lg-3"> 
                      <form:input class="form-control" type="text" path="workDesignation"></form:input>
                      </div>
                    <br><br>
                    <br>
                     <div class="form-group">
                  
                      <label class="col-lg-2 control-label">Marital Status</label>
                     
                      <div class="col-lg-3">
                      <form:select id="maritalStatusID" path="maritalStatusID" class="form-control" >
                      <option value='0'>--Select--</option>
                  <%  List<CodeValueData> maritalStatus=(List<CodeValueData>)request.getAttribute("maritalStatus");
                  
                  for (CodeValueData idv:maritalStatus){
                  %>
                  
                  <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(party.getMaritalStatusID())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getCodeValue())%></option>
                  <%}%>
                  </form:select>
                  </div>
                  <label class="col-lg-2 control-label">PAN No</label>
                     
                      <div class="col-lg-3"> 
                      <form:input class="form-control" type="text" id="panNumber" path="panNumber" value="<%=CommonUtils.emptyIfNull(party.getPanNumber())  %>" ></form:input>
                      </div>
                  </div>
                  <br> <br>
                 
                 
                  </div>
               </fieldset>
                
               
                	<%-- <fieldset>
                	<div class="col-xs-12">
                	
                  
                   <div class="form-group">
                   	
                      <label class="col-lg-2 control-label">Occupation</label>
                      
                      <div class="col-lg-3">
                      <form:select path="workProfession" id="workProfession" itemLabel="name" itemValue="id"
							items="${occupations}" class="form-control">
						</form:select>
						</div>
						</div>
						<br> <br>
                 
                 	
                   
                   <div class="form-group">
                   	
                      <label class="col-lg-2 control-label">Company Name</label>
                    
                     <div class="col-lg-3"> 
                      <form:input class="form-control" path="companyName"></form:input>
                      </div>
                      </div>
                      <br> <br>
                 	
                   
                   
                   
                   <div class="form-group">
                   	
                      <label class="col-lg-2 control-label">Designation</label>
                     
                      <div class="col-lg-3"> 
                      <form:input class="form-control" type="text" path="workDesignation"></form:input>
                      </div>
                      </div>
                      <br> <br>
                 
                   
                   
                  
                   <div class="form-group">
                  
                      <label class="col-lg-2 control-label">PAN No</label>
                     
                      <div class="col-lg-3"> 
                      <form:input class="form-control" type="text" id="panNumber" path="panNumber" value="<%=CommonUtils.emptyIfNull(party.getPanNumber())  %>" ></form:input>
                      </div>
                      </div>
                      <br> <br>
           		
           			</div>
           			
				</fieldset> --%>
               </div>
              </div>
              <div class="clr"> </div>
            </div>
            <div id="tabs-2" class="tab-pane">
            
              <div id="contact_details">
               <fieldset>
               <div class="col-xs-12">
                  
                  	<div class="form-group">
                   
                       <label class="col-sm-2 control-label">Address 1</label>
                       <div class="col-sm-2">
                       <form:input name="input" type="text" class="form-control no-padding-left" path="addressList[0].street1"></form:input>
                   	</div>
                   	
                   	 <form:input type="hidden" class="common_input" path="addressList[0].id"></form:input>
                   	<label class="col-sm-2 control-label">Country</label>
                      <div class="col-sm-2">
                      <form:select path="addressList[0].countryId" id="country1" itemLabel="name" itemValue="id"
							items="${countries}" class="form-control">
						</form:select>
						</div>
						
						 <label class="col-sm-2 control-label">Email <span class="required">*</span></label>
                       <div class="col-sm-2">
                       <form:input  type="text" class="form-control" path="contactEmail1"></form:input>
                   	</div>
						
                   	</div>
                   	<br> <br>
                   	
                  </div>
                  
                  
                  <div class="col-xs-12">
                  
                  	<div class="form-group">
                   
                       <label class="col-sm-2 control-label">Address 2</label>
                       <div class="col-sm-2">
                       <form:input name="input" type="text" class="form-control" path="addressList[0].street2"></form:input>
                   	</div>
                   	
                   	
                   	
                   	 
                   	 <label class="col-sm-2 control-label">State</label>
                      <div class="col-sm-2">
                      <form:select path="addressList[0].stateId" id="state1" itemLabel="name" itemValue="id"
							items="${states}" class="form-control">
						</form:select>
						</div>
						
						
						
						  <label class="col-sm-2 control-label">Mobile</label>
                       <div class="col-sm-2">
                       <form:input  type="text" class="form-control" path="contactMobile1"></form:input>
                   	</div>
						
                   	</div>
                   	<br> <br>
                   	
                  </div>
                  <div class="col-xs-12">
                  
                  	<div class="form-group">
                   
                       <label class="col-sm-2 control-label">Address 3</label>
                       <div class="col-sm-2">
                       <form:input name="input" type="text" class="form-control" path="addressList[0].street3"></form:input>
                   	</div>
                   	
                   	
                   	
                   	 
                   	 <label class="col-sm-2 control-label">City</label>
                      <div class="col-sm-2">
                      <%-- <form:select path="addressList[0].cityId" id="city1" itemLabel="name" itemValue="id" items="${cities}"class="form-control">
						</form:select> --%>
						<form:select class="form-control"
							path="addressList[0].cityId" id="city1" itemLabel="name" itemValue="id" items="${cities}"
							>
						</form:select>
						</div>
						
						
						
						  <label class="col-sm-2 control-label">Alternate No.</label>
                       <div class="col-sm-2">
                       <form:input name="input" type="text" class="form-control " path="contactMobile2"></form:input>
                   	</div>
						
                   	</div>
                   	<br> <br>
                   	
                  </div>
                  
                  
                  
                  <div class="col-xs-12">
                  
                  	<div class="form-group">
                   
                       <label class="col-sm-2 control-label"></label>
                       <div class="col-sm-2">
                       
                   	</div>
                   	
                   	
                   	
                   	 
                   	 <label class="col-sm-2 control-label">Pin Code</label><span > </span>
                      <div class="col-sm-2">
                      <form:input type="text"  id="pincode"  class="form-control pincode rel pincode" path="addressList[0].postalCode"></form:input>
						</div>
						
						
						
						  <label class="col-sm-2 control-label"></label>
                       <div class="col-sm-2">
                       
                   	</div>
						
                   	</div>
                   	<br> <br>
                   	
                  </div>
                  
               </fieldset>
                <%-- <div class="Cont_Details_first_col">
                  <ul class="reset clearfix Cont_Details_first_col_ul">
                    <li class="clearfix">
                      <label class="form_label">Address 1</label>
                      <form:input name="input" type="text" class="common_input" path="addressList[0].street1"></form:input>
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Address 2</label>
                      <form:input name="input" type="text" class="common_input" path="addressList[0].street2"></form:input>
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Address 3</label>
                      <form:input name="input" type="text" class="common_input" path="addressList[0].street3"></form:input>
                    </li>
                  </ul>
                </div> --%>
                <%-- <div class="Cont_Details_second_col">
                <form:input type="hidden" class="common_input" path="addressList[0].id"></form:input>
                  <ul class="reset clearfix Cont_Details_second_col_ul">
                    <li class="clearfix">
                      <label class="form_label">Country</label>
                      <form:select path="addressList[0].countryId" id="country1" itemLabel="name" itemValue="id"
							items="${countries}" >
						</form:select>
						
                    </li>
                    <li class="clearfix">
                      <label class="form_label">State</label>
                      <div>
                      <form:select path="addressList[0].stateId" id="state1" itemLabel="name" itemValue="id"
							items="${states}" >
						</form:select>
						</div>
                    </li>
                    <li class="clearfix">
                      <label class="form_label">City</label>
                      <div>
                      <form:select
							path="addressList[0].cityId" id="city1" itemLabel="name" itemValue="id" items="${cities}"
							>
						</form:select>
						</div>
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Pin Code</label><span > </span>
                      <form:input type="text"  id="pincode"  class="common_input pincode rel pincode" path="addressList[0].postalCode"></form:input>
                    </li>
                  </ul>
                </div> --%>
               <%--  <div class="Cont_Details_third_col">
                  <ul class="reset clearfix Cont_Details_third_col_ul">
                    <li class="clearfix"> 
                      <label class="form_label">Email</label>
                      <form:input  type="text" class="common_input " path="contactEmail1"></form:input>
                    </li>
                    <li class="clearfix"> <span > </span>
                      <label class="form_label">Mobile</label>
                      <form:input  type="text" class="common_input" path="contactMobile1"></form:input>
                    </li>
                    <li class="clearfix">
                      <label class="form_label">Alternate No.</label>
                      <form:input name="input" type="text" class="common_input " path="contactMobile2"></form:input>
                    </li>
                  </ul> 
                </div> --%>
                
              </div>
             
              <div class="clr"> </div>
            </div>
            <div id="tabs-3" class="tab-pane">
              <div class="family_details">
              <%-- <ul class="reset clearfix Family_Details_col clearfix">
                  <li class="clearfix li_one">
                    <form:input name="input" placeholder="First Name" type="text" class="common_input" path="associatedParties[0].firstName"></form:input>
                  		<form:input path="associatedParties[0].relatedPartyId" type="hidden"/>
                  </li>
                  <li class="clearfix li_two">
                    <form:input name="input" placeholder="Last Name" type="text" class="common_input" path="associatedParties[0].lastName"></form:input>
                  
                  </li>
                  <li class="clearfix li_three">
                    <input id="birth_date1" name="input" type="text" placeholder="dd-mmm-yyyy" class="birth_date common_input5 datepicker" disabled>
                  
                  </li>
                  <li class="clearfix li_five">
                    <form:select path="associatedParties[0].relationshipId" id="associatedParties" itemLabel="codeValue" itemValue="codeValueId"
							items="${relations}" >
						</form:select>
                  </li>
                  <li class="clearfix li_six"> <span class="common_input3">Sr. Citizen</span> </li>
                </ul>
                <ul class="reset clearfix Family_Details_col clearfix">
                  <li class="clearfix li_one">
                   <form:input name="input" placeholder="First Name" type="text" class="common_input" path="associatedParties[1].firstName"></form:input>
                  <form:input path="associatedParties[1].relatedPartyId" type="hidden"/>
                  </li>
                  <li class="clearfix li_two">
                    <form:input name="input" placeholder="Last Name" type="text" class="common_input" path="associatedParties[1].lastName"></form:input>
                  </li>
                  <li class="clearfix li_three">
                    <input id="birth_date2" name="input" type="text" placeholder="dd-mmm-yyyy" class="birth_date common_input5 datepicker" disabled>
                  </li>
                  <li class="clearfix li_five">
                     <form:select path="associatedParties[1].relationshipId" id="associatedParties" itemLabel="codeValue" itemValue="codeValueId"
							items="${relations}" >
						</form:select>
                  </li>
                  <li class="clearfix li_six"> <span class="common_input3">Sr. Citizen</span> </li>
                </ul>
                <ul class="reset clearfix Family_Details_col clearfix">
                  <li class="clearfix li_one">
                    <form:input name="input" placeholder="First Name" type="text" class="common_input" path="associatedParties[2].firstName"></form:input>
                  <form:input path="associatedParties[2].relatedPartyId" type="hidden"/>
                  </li>
                  <li class="clearfix li_two">
                    <form:input name="input" placeholder="Last Name" type="text" class="common_input" path="associatedParties[2].lastName"></form:input>
                  </li>
                  <li class="clearfix li_three">
                    <input id="birth_date3" name="input" type="text" placeholder="dd-mmm-yyyy" class="birth_date common_input5 datepicker" disabled>
                  </li>
                  <li class="clearfix li_five">
                    <form:select path="associatedParties[2].relationshipId" id="associatedParties" itemLabel="codeValue" itemValue="codeValueId"
							items="${relations}" >
						</form:select>
                  </li>
                  <li class="clearfix li_six"> <span class="common_input3">Minor</span>
                    <div class="add">+</div>
                  </li>
                </ul>
                 --%>
                <% 
                int i=0;
                boolean hasDummy = false;
                if(party.getAssociatedParties().isEmpty()){
                	Party dummy = new Party();
                	party.getAssociatedParties().add(dummy);
                	hasDummy = true;
                }
                for(Party p: party.getAssociatedParties()){ %>
                 <ul class="reset clearfix Family_Details_col clearfix">
                  <li class="clearfix li_one" >
                    <input value="<%=CommonUtils.emptyIfNull(p.getFirstName()) %>" id="associatedFirstName<%=i%>" type="text" class="col-sm-2 common_input" name="associatedParties[<%=i %>].firstName" placeholder="First Name"></input>
                  <input id="relatedPartyId<%=i%>" name="associatedParties[<%=i%>].relatedPartyId" type="hidden" value="<%=p.getRelatedPartyId()!= null?p.getRelatedPartyId():""%>"/>
                  </li>
                  <li class="clearfix li_two">
                    <input value="<%=CommonUtils.emptyIfNull(p.getLastName()) %>" id="associatedLastName<%=i%>" type="text" class="col-sm-2 common_input" name="associatedParties[<%=i %>].lastName" placeholder="Last Name"></input>
                  </li>
               
                  <li class="clearfix li_three">
                    <input id="birth_date<%=i %>" data-provide="datepicker" data-date-format="d-M-yyyy" value="<%=CommonUtils.emptyIfNull(p.getDobAsString()) %>" name="associatedParties[<%=i %>].dobAsString" type="text" placeholder="dd-mmm-yyyy" class="col-sm-2 form-conrtrol birth_date common_input5 datepicker bD" style="width:106px;"></input>
          		</li>
							
                  <li class="clearfix li_five">
                   <select id="relationshipId<%=i %>" name="associatedParties[<%=i %>].relationshipId" class="form-control valid">
                  <%  List<KeyValue> relations =(List<KeyValue>) request.getAttribute("relations");
                  for (KeyValue idv:relations){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=new Integer(idv.getId()).equals(p.getRelationshipId())?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select>
                    <%-- <select name="associatedParties[<%=i %>].relationshipId" id="associatedParties" itemLabel="codeValue" itemValue="codeValueId"
							items="${relations}" >
						</select> --%>
                  </li>
                  <li class="clearfix li_five">
                  <%  List<KeyValue> occupations =(List<KeyValue>) request.getAttribute("occupations"); %>
                      <input type="hidden" id="workProfession" value="${family.workProfession}" />
                      <select  id="workProfessionFamily<%=i%>"  name="associatedParties[<%=i %>].workProfession" class="form-control valid" >
						<%for (KeyValue idv:occupations){
							 %>
                  
                  <option value='<%=idv.getId()%>' <%=CommonUtils.toInt(p.getWorkProfession())==idv.getId() ?" selected ":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  
						</select>
                    </li>
                     <li class="clearfix li_five">
                    <input value="<%=CommonUtils.emptyIfNull(p.getPanNumber())%>" id="panNo" type="text" class="col-sm-2 common_input" name="associatedParties[<%=i %>].panNumber" placeholder="Pan Number"></input>
                  </li>
                  
                  <%Date dob = CommonUtils.toDate(p.getDob());
                  	String ageText = "";
                  	if(dob != null){
                  		int age = CommonUtils.getAge(dob);
                  		ageText = age<18 && age>=0 ?"Minor": age>=60?"Senior":"";
                  	}
                  	
                  %>
                  <li class="clearfix li_six"> <span id="minorText" class="common_input3"><%=ageText%></span>
                  	<%if(i+1==party.getAssociatedParties().size()){ %>
                    <div class="add">+</div>
                    <%} %>
                    
                    <div class='close' style="<%=hasDummy ?" display:none ":"" %>" >X</div>
                  </li>
                  
                </ul> 
                
                
                
                
                
                 <%
                
                i++;
                } %> 
              </div>
              <div class="clr"></div>
            </div>
           <div id="tabs-4" class="tab-pane">
              <div class="profile_photo">
              <input type="hidden" value="-1" name="x">
    		<input type="hidden" value="-1" name="y">
    		<input type="hidden" value="-1" name="w">
    		<input type="hidden" value="-1" name="h">
            
     		<div > <img style="width:150px;height:auto;float:center;"  id="preview" alt="" 
     		<%  
     		  if(!StringUtils.isEmpty(user.getPhoto())){
     		%>
     		 src = "<%=FiinfraUtility.getImagePath(request, user.getPhoto(), "") %>"
     		 <%} %>	/></div>
    		
    		<div class="upload_btn">
    		<input class="northspace4" type="file" name="image" capture="camera" accept="image/*" id="upload"/>
    		</div>    
    		<div style="margin:20px 0px 0px 30px;color:#3a3a3a;"><p style="font-size:12px !important;">Please upload the image of following dimensions for best results</p>
    		<p style="margin:5px 0px 0px 70px; font-size:12px !important;"> 
    		<p style="margin:5px 0px 0px 0px;"> <span style="font-weight:bold">width:</span> 99 px -<span style="font-weight:bold"> height:</span> 128 px</p>
          <p style="margin:5px 0px 0px 0px;"> <span style="font-weight:bold">width:</span> 35 mm -<span style="font-weight:bold"> height:</span> 45 mm</p></div>
              </div>
              <div class="clr"></div>
            </div>
             </div>
          </div><br/><br/>
          <div align="center">
          <form>
                    	<input type="submit" class="submit_btn btn-primary btn-xs btn" onclick="saveProfile(); return false;" value="Submit">
                        <a  class="btn-primary btn-xs btn"  href="${pageContext.request.contextPath}/profile/dashboard">Cancel</a>
                      
          </form>
          </div>
        </div>
         <div id="password_details_bx">
     <div id="password_details">
            <div class="fl first_col">
            <%-- <form name="password-form" id="password-form" action="${pageContext.request.contextPath}/profile/changePassword" method="post"> --%>
              <form name="password-form" id="password-form">
              <ul class="reset clearfix first_col_ul">
                <li class="clearfix"> <span class="mandatory"> </span>
                  <label class="">Existing Password (from email)</label>
                  <input name="existingPassword" id="existingPassword" type="password" class="common_input" style="float: right;margin-bottom: 3px;">
                </li>
                <li class="clearfix"> <span class="mandatory"> </span>
                  <label class="form_label">New Password</label>
                  <input name="newPassword" id="newPassword" type="password" class="common_input" style="float: right;margin-bottom: 3px;">
                </li>
                <li class="clearfix"> <span class="mandatory"> </span>
                  <label class="form_label">Re-enter Password</label>
                  <input name="reEnterPassword" id="reEnterPassword" type="password" class="common_input"style="float: right;">
                </li>
              </ul>
              </form>
            </div>
           
            <div class="clr"></div>
          </div>
          <div class="btn_bx2">
           <span id="erroMsg" style="color:#B03060;"></span>
            <%-- <form>
              <input type="button" onclick="savePassword();" class="submit_btn" value="SUBMIT">
              <input type="button" onclick="cancleClick();" class="cancel_btn" value="CANCEL">
            </form> --%>
          </div>
     </div>
      </section>
      </form:form>
     </div>
     
    
  <script>
	function savePassword(){
		var existingPassword=$("#existingPassword").val(); 
		var  newPassword =$("#newPassword").val();
		var  reEnterPassword=$("#reEnterPassword").val();
		$.ajax({
			type : "POST",
			data:{"existingPassword":existingPassword,"newPassword":newPassword,"reEnterPassword":reEnterPassword},
			url : '${pageContext.request.contextPath}/profile/changePassword',
			success : function(result) {
				if(result['result']=="error")
					{$("#erroMsg").html(result['error']);
					}
				else if (result['result']=="success"){
					$("#password_details_bx").dialog('close');
					 /* window.location.href="${pageContext.request.contextPath}/profile/home"; */
					window.location.href="${pageContext.request.contextPath}/FIINFRA-Client-WEB/sign-out";
				}
			}
		});
		
		/* $('#password-form').submit(); */
		
	 }
	
	function cancelPwd(){
		
		if($('#src').val()&&$('#src').val()=="changePwd"){
		
			location.href="${pageContext.request.contextPath}/profile/";
		}
		else{
			location.href="${pageContext.request.contextPath}/sign-out?buId=<%=user.getBuId()%>";
		}
		
	}

  </script>
   
  
