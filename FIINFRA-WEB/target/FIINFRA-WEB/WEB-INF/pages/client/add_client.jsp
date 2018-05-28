<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Add New Client</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        
        <!-- Center part start -->
        <section>
          <form id="addClientForm"  name="FileUploadForm"
			action="<%=request.getContextPath()%>/client/saveClient.htm"  enctype="multipart/form-data" 
			method="post">
            <div class="">
              <div class="page-header">
                <h1>Add New Client</h1>
              </div>
              <div class="container-body"> 
                <!--Personal Details Start -->
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-header">
                    <h5 class="widget-title">Personal Details</h5>
                  </div>
                  <div class="widget-body">
                    <div class="widget-main clearfix">
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="firstname">First Name</label>
                          <div class="col-sm-9">
                            <input type="text" id="firstname" name="firstName" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="First Name"/>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="lastname">Last Name<span class="red">*</span></label>
                          <div class="col-sm-9">
                            <input type="text" id="lastname" name="lastName" validate="1" emsg="Last Name" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="Last Name"/>
                            <div id="lastname_error" class="help-block hide">Please provide a valid last name.</div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="title">Title</label>
                          <div class="col-sm-9">
                            <select name="salutationID" id="title" class="input-xxlarge">
                              <option value="0">---Select---</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="companyName">Company Name</label>
                          <div class="col-sm-9">
                            <input type="text" id="companyName" name="companyName"  class="input-xxlarge" placeholder="Company Name">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="designation">Designation</label>
                          <div class="col-sm-9">
                            <input type="text" id="designation" name="workDesignation"  class="input-xxlarge" placeholder="Designation">
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="designation">Occupation</label>
                          <div class="col-sm-9">
                            <select name="workProfession" id="occupation" class="input-xxlarge">
                              <option value="0">---Select---</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="designation">Date of Birth (Age)</label>
                          <div class="col-sm-9"><i class="fa fa-calendar bigger-120"></i>&nbsp;&nbsp;
                            <input name="dob" type="text" id="dob" validate="date" emsg="Date Of Birth" class="input-large" placeholder="Birth Date" onchange="ageCount(id);"   />
                            <input type="text" id="AgeYrs" name="age" readonly class="input-small" placeholder="">
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="anniversaryDate">Anniversary Date</label>
                          <div class="col-sm-9"><i class="fa fa-calendar bigger-120"></i>&nbsp;&nbsp;
                            <input name="anniversaryDate" type="text" id="anniversaryDate" validate="date" emsg="Anniversary Date" class="input-large" placeholder="Anniversary Date"/>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="designation">Marital Status</label>
                          <div class="col-sm-9">
                            <select name="martialStatusID" id="martialStatusID" class="input-xxlarge">
                              <option value="0">---Select---</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="genderID">Gender</label>
                          <div class="col-sm-9">
                            <select name="genderID" id="genderID" class="input-xxlarge">
                              <option value="0">---Select---</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="panNo">PAN No</label>
                          <div class="col-sm-9">
                            <input type="text" id="panNo" name="panNo" validate="pan" emsg="PAN No" class="input-xxlarge" placeholder="PAN No.">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--Personal Details End -->
                <div class="space-8"></div>
                <!--Contact Details Start -->
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-header">
                    <h5 class="widget-title">Contact Details</h5>
                  </div>
                  <div class="widget-body">
                    <div class="widget-main clearfix">
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="email">Email<span class="red">*</span></label>
                          <div class="col-sm-9">
                            <input type="text" class="input-xxlarge form-control" id="email" name="email" validate="email" emsg="Email" placeholder="Email"/>
                            <div id="email_error" class="help-block hide">Please provide a valid email.</div>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="mobile">Mobile</label>
                          <div class="col-sm-9">
                            <input type="text" class="input-xxlarge form-control Number1" id="mobile" name="mobile" maxlength="15" placeholder="Mobile"/>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="alternateMobile">Alternate Mobile</label>
                          <div class="col-sm-9">
                            <input type="text" class="input-xxlarge form-control Number1" id="alternateMobile" name="contactMobile2" maxlength=15 placeholder="Alternate Mobile"/>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="address">Address</label>
                          <div class="col-sm-9">
                            <input type="text" class="input-xxlarge form-control" id="address" name="address" placeholder="Address"/>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="country">Country</label>
                          <div class="col-sm-9">
                            <select name="country" id="country" class="input-xxlarge form-control">
                              <option value="0">---Select---</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="state">State</label>
                          <div class="col-sm-9">
                            <select name="state" id="state" class="input-xxlarge form-control" onchange="retrieveCityList(event,'addClientForm');">
                              <option value="0">---Select---</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="city">City</label>
                          <div class="col-sm-9">
                            <input type="text" id="city"  class="input-xxlarge form-control" placeholder="City">
                            <input type="hidden" name="city" id="cityHidden">
                          </div>
                        </div>
                        <div class="form-group col-md-6 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="pinCode">Pin Code</label>
                          <div class="col-sm-9">
                            <input type="text" class="input-xxlarge form-control" id="pinCode" name="pinCode" onkeydown="allowIntegersOnly(id,event)" placeholder="Pin Code"/>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--Contact Details End -->
                
                <div class="space-8"></div>
                <div class="topmenu rightAlign">
                  <button class="btn btn-primary btn-xs" type="button" name="Save & New" onclick="saveClient(0)">Save & New</button>
                  <button class="btn btn-primary btn-xs" type="button" name="Save & Close" onclick="saveClient(1)">Save & Close</button>
                  <a href="<%=request.getContextPath()%>/client/getClientList.htm">
                  <div class="visible-xs northspace1"></div>
                  <button class="btn btn-primary btn-xs" type="button" name="Cancel">Cancel</button>
                  </a></div>
                
                <!-- center end --> 
              </div>
            </div>
          </form>
        </section>
        <!-- Center part End -->
        
        <jsp:include page="../common/footer.jsp" />
<script>
var userLabelValueList = new Array();
var cityId=0;
$(function() {
	showSelectedTab('clientLink');
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=2,3,81,12,13,65',
		success : function(result) {
			//$('#title').empty();
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				 if(codeTypeId==81){
					$('#title').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				 } else if(codeTypeId==2){
					$('#state').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==3){
					$('#country').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==13){
					$('#martialStatusID').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==12){
					$('#genderID').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==65){
					$('#occupation').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}				
			});
			try{
				$('#dob').datepicker({
					changeMonth : true,
					changeYear : true,
					maxDate : '0',
					yearRange : "1900:2200",
					dateFormat : "dd/mm/yy"

				});
				}catch(e){
					try{
					$jq_1_9_1('#dob').datepicker({
						changeMonth : true,
						changeYear : true,
						maxDate : '0',
						yearRange : "1900:2200",
						dateFormat : "dd/mm/yy"

					});
					}catch(e){
						$jq_1_9_2('#dob').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "dd/mm/yy"

						});
					}
				}
				
				try{
					$('#anniversaryDate').datepicker({
						changeMonth : true,
						changeYear : true,
						maxDate : '0',
						yearRange : "1900:2200",
						dateFormat : "dd/mm/yy"

					});
					}catch(e){
						try{
						$jq_1_9_1('#anniversaryDate').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "dd/mm/yy"

						});
						}catch(e){
							$jq_1_9_2('#anniversaryDate').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
						}
					}
					
			
		}});
});

function saveClient(isToClose){
	var isValidated=true;
	isValidated=validateInputForm('addClientForm');
	
	var res=checkSelectedUserInHierarchy();
// 	alert('res---checkSelectedUserInHierarchy----'+res);
	if(res==true)
	{
	if(isValidated==true){
		if(cityId==0 || cityId==undefined){
			$('#cityHidden').val($('#city').val());
		}else{
			$('#cityHidden').val(cityId);
		}
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/client/saveClient.htm',
				data:$('#addClientForm').serialize(),
				success : function(result) {
					var recordCount=result[0];
					var clientPartyId=result[1];
					var isPanExist=result[2];					
					if(recordCount>0){
						if(isToClose==1){
							localStorage.setItem('actionName',$('#contextPath').val()+'/client/getClientList.htm');
							showAlertMessage1("Message",
									"<br/>Client saved successfully.",
									"information", redirectFunction);
						}else{
							localStorage.setItem('actionName', $('#contextPath').val()+'/addClient.htm');
							showAlertMessage1("Message",
									"<br/>Client saved successfully.",
									"information", redirectFunction);
						}
						
					}else if(isPanExist=='1'){
	            		showAlertMessage("Error","This PAN No. already exist in system. Please enter different PAN No.", 'error', doNothing);
	            	}
				},
				error: function(msg) {
	            }, onComplete: function (data) {
	            }
// 					else{
// 						showAlertMessage1("Error",
// 								"The connection to the server has been lost. Please try again later.",
// 								"error", doNothing);
// 					}
// 					}
				}).submit();
			
	}else{
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/client/getClientList.htm',
			data: $('#addClientForm').serialize(),
			success : function(result) {
				var recordCount=result[0];
				var clientPartyId=result[1];
				var isPanExist=result[2];	
				
            	if(recordCount>0){
            		if(isToClose!=1){
        				localStorage.setItem('actionName', $('#contextPath').val()+'/client/getClientList.htm');
        				showAlertMessage("Success", "<br/>Client saved successfully.", "confirmation", redirectFunction);
        			}else{
        				localStorage.setItem('actionName', $('#contextPath').val()+'/addClient.htm');
        				showAlertMessage("Success", "<br/>Client saved successfully.", "confirmation", redirectFunction);
        			}
            	}else if(isPanExist=='1'){
            		showAlertMessage("Error","This PAN No. already exist in system. Please enter different PAN No.", 'error', doNothing);
            	}
			}
		});
	}
	
// 		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	}
}

function split( val ) {
    return val.split( /;\s*/ );
}

function extractLast( term ) {
    return split( term ).pop();
}

function ageCount(id) {
	var dob=$('#'+id).val();
    
    var date1 = new Date();
    var  dob1= document.getElementById("dob").value.split("/");;
    date2= new Date(dob1[2], dob1[1] - 1, dob1[0]);
//     var date2=new Date(dob);
    var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
    if (pattern.test(dob)) {
        var y1 = date1.getFullYear(); //getting current year
        var y2 = date2.getFullYear(); //getting dob year
        
        var age = y1 - y2;           //calculating age 
//         document.write("Age : " + age);
        $('#AgeYrs').val(getAge(date2));
        return true;
    } else {
        alert("Invalid date format. Please Input in (dd/mm/yyyy) format!");
        return false;
    }

}

function retrieveCityList(event,id){
	var parentId=$('#'+id+' #state').val();
	cityArrayList = new Array();
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/common/getCityList.htm?parentId='+parentId,
		success : function(result) {
			$(result).each(function(i,obj) {
				var object = {};
				object.value = obj.codeValueId;
				object.label = obj.codeValue;
				cityArrayList.push(object);
			});
// 			 $jq_1_9_1('#'+id+' #city').val('');
// 			 $jq_1_9_1('#'+id+' #cityHidden').val('');
			
		    $('#'+id+' #city')
		    // don't navigate away from the field on tab when selecting an item
		    .bind( "keydown", function( event ) {
		      if ( event.keyCode ===  $.ui.keyCode.TAB &&
		          $( this ).data( "ui-autocomplete" ).menu.active ) {
		        event.preventDefault();
		      }
		    })
		    .autocomplete({
		      minLength: 0,
		      source: function( request, response ) {
		        // delegate back to autocomplete, but extract the last term
		    	  response(  $.ui.autocomplete.filter(cityArrayList, request.term) );
		      },
		      focus: function() {
		        // prevent value inserted on focus
		        return false;
		      },
		      select: function( event, ui ) {
		    	  var terms = split( this.value );
			        
			        console.log('terms='+terms);
			        
			        // remove the current input
			        terms.pop();
			        // add the selected item 
			        terms.push(ui.item.label);
			        cityId=ui.item.value;
// 					alert(cityId)   
			        // add placeholder to get the comma-and-space at the end
			        terms.push( "" );
			        this.value = terms.join( "" );
			        
			        var labelArr = $(this).data('label') || new Array();
			        labelArr.push(ui.item);
			        $(this).data('label',labelArr);
			        console.log($(this).data());
			        
			        return false;
		      }
		    });
		} 
	});
}


</script>
<script>
function addNote(){

$("#addnote").show();	
$("#deletenote, #editnote").hide();	

}

function deleteNote(){

$("#deletenote").show();	
$("#addnote, #editnote").hide();	

}
function editNote(){

$("#editnote").show();	
$("#addnote, #deletenote").hide();	

}
$('#mobile').blur(function(){
	if($('#mobile').val().length < 10){
		 //alert("Contact No's length should not be less than 10 digit.");
		 showAlertMessage1("Error", "Mobile no's length should not be less than 10 digit." + '\n', "confirmation", doNothing);
		 $('#mobile').val('');
		 $('#mobile').css('border','1px solid red');
		// $("#mobile").focus();
	}else{
		$('#mobile').css('border-color','');
	}
}); 
$('#alternateMobile').blur(function(){
	if($('#alternateMobile').val().length < 10){
		 //alert("Contact No's length should not be less than 10 digit.");
		 showAlertMessage1("Error", "Alternate  mobile no's length should not be less than 10 digit." + '\n', "confirmation", doNothing);
		 $('#alternateMobile').val('');
		 $('#alternateMobile').css('border','1px solid red');
		 // $("#alternateMobile").focus();
	}else{
		$('#alternateMobile').css('border-color','');
	}
}); 
</script>
</body>
</html>