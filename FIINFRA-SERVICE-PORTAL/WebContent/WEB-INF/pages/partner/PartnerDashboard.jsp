<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Partner Dashboard</title>
<script src="<%=request.getContextPath()%>/js/angular.js"></script>
<script type="text/javascript">
function goback() {
	//location.href="loadrole.htm";
	history.back();
}

var app = angular.module("MyApp", []);

app.filter('offset', function() {
  return function(input, start) {
    start = parseInt(start, 10);
    return input.slice(start);
  };
});

app.controller("PaginationCtrl", function($scope,$http) {

  $scope.itemsPerPage = 5;
  $scope.currentPage = 0;
//  $scope.items = [];

 var partyID =jQuery('#partyID').val();
	
  $scope.items=$http.get($('#contextPath').val()+"/dashboard/showPartnerActivityTracker.htm?partyID="+partyID)
	  .success(function(response) { 
		 
		  $scope.items = response;
	
  $scope.range = function() {
    var rangeSize = 2;
    var ret = [];
    var start;

    start = $scope.currentPage;
    if ( start > $scope.pageCount()-rangeSize ) {
      start = $scope.pageCount()-rangeSize+1;
    }

    for (var i=start; i<start+rangeSize; i++) {
      ret.push(i);
    }
    return ret;
  };

  $scope.prevPage = function() {
    if ($scope.currentPage > 0) {
      $scope.currentPage--;
    }
  };

  $scope.prevPageDisabled = function() {
    return $scope.currentPage === 0 ? "disabled" : "";
  };

  $scope.pageCount = function() {
    return Math.ceil($scope.items.length/$scope.itemsPerPage)-1;
  };

  $scope.nextPage = function() {
    if ($scope.currentPage < $scope.pageCount()) {
      $scope.currentPage++;
    }
  };

  $scope.nextPageDisabled = function() {
    return $scope.currentPage === $scope.pageCount() ? "disabled" : "";
  };

  $scope.setPage = function(n) {
    $scope.currentPage = n;
  };
	  });
});
 </script>

<script>

function reload(){
	
	location.reload();
}


/* geteditactivitytype();
geteditactivitycontext(); */
function editcallvalidation(){
	
	if($('#editactivityNote').val()==''){
		
		var message='Please Enter Call Note.';
		 var callback=false;
		 alertmessage(message,callback);
		 return false;
	}
	if($('#editactivitySpend').val()==""){
		
		var message='Please Enter Call duration.';
		 var callback=false;
		 alertmessage(message,callback);
		 return false;
	}
	return true;
}
function editcall(){
		 
/*			 alert('INN');
			 $('#editactivitySubContextId').empty();
			 var subcontextList = [];
		        $.each($("#editactivitySubContextId option:selected"), function(){            
		        	subcontextList.push($(this).val());
		        });
		 var subcontext=subcontextList.join(","); */   
	
			 var subcontext = $('#editactivitySubContextId option:selected').map(function(i,v) {
				    return this.value;
				}).get();
			 
			 subcontext = $('#editactivityStatusId').val() +','+subcontext;	
			var contextList = [];
	        $.each($("#input[name='editactivityContextId']:checked"), function(){            
	        	contextList.push($(this).val());
	        });
	        var context=contextList.join(","); 
			
	        
	        var editch = [];
	        $('.pinToggles1:checked').each(function ()
	        		{
	            var e = $(this);
	            editch.push(e.val());
	        });
	        if(editch== ""){
	    		 var message='Please select at least Call Contex.';
	    		 var callback=false;
	    		 alertmessage(message,callback);
	    	 	 //alert('Please select at least one Reason for rating');
	    	 //return;
	     			 }else{
	        if(editcallvalidation()==true){
          $.ajax({
	              type: "POST",
	              url :jQuery('#contextPath').val()+"/dashboard/addPartnerActivity.htm?activityContextId="+context+"&activitySubContextId="+subcontext,
	              data: jQuery('#editactivity').serialize(),
	              success: function(result) {
	            	  jQuery("#error-msg3").remove();
	            	  var activityId=$('#editactivityId').val();
	            	  //var sendEmail=document.getElementById("sendEmail").checked;
	            	  
	            	  var sendEmail=$('input[name="sendEmail"]:checked').val();
	            
	            		  if( sendEmail == 1 || sendEmail == 2 || sendEmail == 3 || sendEmail == 4){
	            			    var message='Call tracker log updated successfully & mail has been sent.';
	      						var callback=true;
	      						alertmessage(message,callback);
	            
	            			 // alert("Call tracker log updated successfully & mail has been sent");
			            	}else{
			            			var message='Call tracker log updated successfully.';
		      						var callback=true;
		      						alertmessage(message,callback);
			            		
			            		//alert("Call tracker log updated successfully");
			            	}
	            	  //jQuery("#success-msg").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(3000);
	            	  document.getElementById("editactivity").reset();
	            	  //jQuery("#list").empty();
	            	  //List();
	            	  //reload();
					},
	              error: function() {alert('failed');}
	            });
			}
	        }
}

function callvalidation(){
	
	if($('#activityNote').val()==''){
		
		var message='Please Enter Call Note.';
		 var callback=false;
		 alertmessage(message,callback);
		 return false;
	}
	if($('#activitySpend').val()==""){
		
		var message='Please Enter Call duration.';
		 var callback=false;
		 alertmessage(message,callback);
		 return false;
	}
	return true;
}
function saveCall()
{
	//alert($('#activityContextId').val());
	
	 /* if(jQuery('#addactivity').valid()){ */  
		// var sendEmail=jQuery('#sendEmail').val();
	 
	  var values = [];
		    $('.pinToggles:checked').each(function ()
		    		{
		        var e = $(this);
		        values.push(e.val());
		    });
	 
	 
	 var subcontextList = [];
	        $.each($("#activitySubContextId option:selected"), function(){            
	        	subcontextList.push($(this).val());
	        });
	        
	        var chcountries = [];
	        $.each($("input[name='activityContextId']:checked"), function(){            
	        	chcountries.push($(this).val());
	        });
	        if(chcountries== ""){
	    		 var message='Please select at least Call Contex.';
	    		 var callback=false;
	    		 alertmessage(message,callback);
	    	 	 //alert('Please select at least one Reason for rating');
	    	 //return;
	     			 }else{
			 	var subcontext=subcontextList.join(",");	 
			   subcontext = $('#activityStatusId').val() +','+subcontext;	
	 if(callvalidation()==true)
	{
	$.ajax({
             type: "POST",
             data: $('#addactivity').serialize(),
             url :$('#contextPath').val()+"/dashboard/addPartnerActivity.htm?activityContextId="+values+"&activitySubContextId="+subcontext,
             success: function(result) {
     			  
     			 jQuery("#error-msg03").remove();
              	  var activityId=$('#activityId').val();
              	  var sendEmail=$('input[name="sendEmail"]:checked').val();
           
   	            	  if( sendEmail == 1 || sendEmail == 2 || sendEmail == 3 || sendEmail == 4){
   	            		var message='Call tracker log added successfully & mail has been sent.';
  						var callback=true;
  						alertmessage(message,callback);
   	            		
   	            		  //showAlertMessage("Success", "<br/>Call tracker log added successfully & mail has been sent", "confirmation");
   	            	  }else{
   	            	 
   	            		var message='Call tracker log added successfully.';
  						var callback=true;
  						alertmessage(message,callback);
   	            		 
   						 resetval();
   	            		  //showAlertMessage("Success", "<br/>Call tracker log added successfully", "confirmation");
   	            	  }
              	  //  jQuery("#success-msg").show().html("<span class='label label-success'>Records added successfully</span>").fadeOut(3000);
              	  document.getElementById("addactivity").reset();
              	  $("#list").empty();

             }
	});
	}
	     			 }
   }
function editNote(){

	//$("#editnote").modal('show');	
	$("#editnote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
	$("#addnote").hide();
	}
function List()
{

	$("#list").show();	
	$("#addnote").hide();	
	$("#addnote1").hide();	
	$("#editnote").hide();	
	location.reload();
	}
	
function getActivity(value){
	var activityId=value;
	 $.ajax({
			
			type : "POST", 
			//data:$('#addactivity').serialize(),
			url :$('#contextPath').val()+"/dashboard/getActivityId.htm?activityId="+activityId,
			dataType: 'json',
			contentType : 'application/json',
			success : function(result) {
				$('#editactivityContextId').empty();
						$('#editactivityTypeId,editactivityId').empty();
			 $.each( result, function( index, value ) {
		
				var activitySpend=value.activitySpend;
				var activityNote=value.activityNote;
				var codeValue=value.codeValue;
				var activityTypeId=value.activityTypeId;
				var activityContextId =value.activityContextId;
				var activitySubContextId =value.activitySubContextId;
				var activityId=value.activityId;
				var activityStatusid =activitySubContextId.split(',')[0];
				
				//$("#editactivityTypeId option[value='"+activityTypeId+"']").prop("selected", "selected");
				 var i=0;
				if(activityStatusid == 20701){i=0;}else{i=1;}
				var select = document.getElementById("editactivityStatusId");
				select.options[i].selected = true;
				$("#editactivityId").val(activityId);
				$("#editactivitySpend").val(activitySpend);
				$("#editactivityNote").val(activityNote); 
				 getList(activityTypeId);
				 sourceid1(activityContextId);
				 sourceid2(activitySubContextId);
				}); 
			}
	 });
	
}

function sourceid1(data)
{

var str = data;
var arr = str.split(",");
var i;
var a=new Array();
for(i=0;i<arr.length;i++)
{
   a[i]=arr[i];
}
  	$.ajax({ 				
	   		  type: "POST",
	   		 url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=189',
	   		 dataType: 'json',
			  contentType: 'application/json',
			success:function(result)
			{ 
				//alert(result);
				var m=arr.length;
			 	var ab=0;
   			 $.each(result, function( index, value ){
		
				   var module=value.codeValue;
			       var modulename=value.codeValueId;
				
				ab++;
				if(modulename==189016 || modulename==189017 || modulename==189018 || modulename==189019 || modulename==189020 || modulename==189021 || modulename==189022 || modulename==189023 || modulename==189024 || modulename==189025 || modulename==189026 || modulename==189032 || modulename==189033)
				{ 
			       for(i=0;i<arr.length;i++)
			       {
			    	   if(a[i]==modulename)
			    		   {
			       	 $('#editactivityContextId').append('<input type="checkbox"  checked="true" id="editactivityContextId1" onclick="showselection1('+modulename+');" class="pinToggles1" name="activityContextId" value="'+modulename+'"/>'+module+'<br>');
			       	 
			       	a.splice(i, 1);
			       	i=arr.length;
			       	 
			       	
			       }
			    	   else
			    		   {
			    		   $('#editactivityContextId').append('<input type="checkbox" id="editactivityContextId1" onclick="showselection1('+modulename+');" class="pinToggles1" name="activityContextId" value="'+modulename+'"/>'+module+'<br>');
			    		 	i=arr.length;
			    		   }
			       }
			       }
			});
					
						
	   		  }
	   	
	   	});
	  
	   
}
/* $('.pinToggles1').click(function(event) {  //on click 
	   alert("fgf");
	   	 
	    }
	}); */

function sourceid2(data)
{

var str = data;
var arr;
if (str != null) {
 arr = str.split(",");}
 else{ 
 arr = "0";
 }
var i;
var a=new Array();
for(i=0;i<arr.length;i++)
{
   a[i]=arr[i];
}

$.ajax({ 				
		  type: "POST",
		 url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=191',
		 dataType: 'json',
	  contentType: 'application/json',
	success:function(result)
	{ 
		
		var m=arr.length;
	 	var ab=0;
		 $.each(result, function( index, value ){

		   var module=value.codeValue;
	       var modulename=value.codeValueId;
		
		ab++;
		for(i=0;i<arr.length;i++)
	       {
	    	   if(a[i]==modulename)
	    		   {
	    	$('#editactivitySubContextId').append('<option  value="'+modulename+'" selected="selected" >'+module+'</option>');
	       
	       	a.splice(i, 1);
	       	i=arr.length;
	       	 
	       	
	       }
	    	  /*  else
	    		   {
	    		   
	    		   $('#editactivitySubContextId').append('<option  value="'+modulename+'" >'+module+'</option>');
	    		 	i=arr.length;
	    		   } */
	       }
		 
	});
			
				
		
		
	}
	
	}); 

	  
	   
}

function getList(activityTypeId){
	 $.ajax({ 				
		   	type: "POST",
		   	url:$('#contextPath').val()+'/ping/getPicklistValues.htm?codeTypeIds=188',
		   	dataType: 'json',
			contentType: 'application/json',
			success:function(result){ 
				 $.each( result, function( index, value ) {
					var codeTypeId=value.codeTypeId;
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;

					 if(codeValueId == activityTypeId){
							$("#editactivityTypeId").append('<option value="'+codeValueId+'" selected="selected"  >'+codeValue+'</option>');	
						}else {
							$("#editactivityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');
							}
				 });
				}  	
		   	});
}
	
function getactivitycontext(){
	 $.ajax({
			
			type : "POST", 
			url :$('#contextPath').val()+"/dashboard/showPartnerActivityContext.htm",
			//dataType: 'json',
			contentType : 'application/json',
			success : function(result) {
				//$('#activityContextId1').append('<option value="">--Select--</option>');
				 $.each( result, function( index, value ) {
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;
					/* alert(codeValue); */
					/* $("#activityContextId1").append('<option value="'+codeValueId+'" >'+codeValue+'</option>'); */
					
					$('#activityContextId1').append('<input type="checkbox"  class="pinToggles" onclick="showselection();" id="activityContextId" name="activityContextId" value="'+codeValueId+'"/>'+codeValue+'<br>');
					
					
					
				 });
				}
			});
}
function showselection1(value)  
{ 
	var context=value;

  var countries = [];
   $('.pinToggles1:checked').each(function ()
   		{
       var e = $(this);
       countries.push(e.val());
   });
   
   context=countries.join(",");
   //alert("context"+context);
       $.ajax({
        type: "POST",
        url :$('#contextPath').val()+"/dashboard/getMultiselect.htm?context="+context,
        success: function(result) {
       	 
      	$('#editactivitySubContextId').empty();
			$.each( result, function( index, value ) {
				var codeValue=value.codeValue;
				var codeValueId=value.codeValueId;
				$("#editactivitySubContextId").append('<option value="'+codeValueId+'">'+codeValue+'</option>');
			 });
        }
  }); 
   }
function showselection()  
{  
	
	var countries = [];
    $.each($("input[name='activityContextId']:checked"), function(){            
        countries.push($(this).val());
    });
    
  var context=countries.join(",");
    
       $.ajax({
        type: "POST",
        url :$('#contextPath').val()+"/dashboard/getMultiselect.htm?context="+context,
        success: function(result) {
      	$('#activitySubContextId').empty();
			$.each( result, function( index, value ) {
				var codeValue=value.codeValue;
				var codeValueId=value.codeValueId;
				$("#activitySubContextId").append('<option value="'+codeValueId+'">'+codeValue+'</option>');
			 });
        }
  }); 
} 
/* function  getactivitytype(){

	 $.ajax({
			
			type : "POST", 
			url :$('#contextPath').val()+"/dashboard/showPartnerActivityType.htm",
			//dataType: 'json',
			contentType : 'application/json',
			success : function(result) {
				/* $('#activityTypeId').append('<option value="">--Select--</option>'); 
				 $.each( result, function( index, value ) {
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;
					//alert(codeValueId)
					
					$("#activityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>')
				 });
				}
			});
}



function  geteditactivitytype(){

	 $.ajax({
			
			type : "POST", 
			url :$('#contextPath').val()+"/dashboard/showPartnerActivityType.htm",
			//dataType: 'json',
			contentType : 'application/json',
			success : function(result) {
				$('#editactivityTypeId').append('<option value="">--Select--</option>');
				 $.each( result, function( index, value ) {
					var codeValue=value.codeValue;
					var codeValueId=value.codeValueId;
					//alert(codeValueId)
					
					$("#editactivityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>')
				 });
				}
			});
} 
*/
function addNote() 
{
	
	$("#deletenote, #editnote, #ratingnote, #ratinghistorynote").hide();
	//$('#addnote').modal('show');
	$("#addnote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
}

function repeatcallreason(){
	ViewStatus(1);
	ratingNote();
	
}
function addNote1(){
	//$("#addnote").show();	
	//getactivitytype();
//getactivitycontext();
	$("#addnote,#deletenote, #editnote,#uploadUser,#LoginonBehalf,#setdefault").hide();	
	/* var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width/3); */

	/* $("#popUpAlertaddnote").css ('height','600px');
	$("#popUpAlertaddnote").css ('width','650px'); */

	$("#addnote1").modal({
	    backdrop: 'static',
	    keyboard: false
	});
	//$('#addnote1').modal('show');
	}

function ratingHistoryNote() 
{
	
	$("#deletenote, #editnote, #addnote, #ratingnote").hide();
//	$('#ratinghistorynote').modal('show');
	$("#ratinghistorynote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
}
function ratingNote() 
{
	
	$("#deletenote, #editnote, #addnote, #ratinghistorynote").hide();
	//$('#ratingnote').modal('show');
	$("#ratingnote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
}
function dndnote(){
	$("#dndnote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
//	$('#dndnote').modal('show');
	
}
</script>
</head>
<body ng-app="MyApp">
<jsp:include page="../common/header.jsp" />
 <input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
 <input id="partyID" type="hidden" name="contextPath" value="${partyID}" />
 <input type="hidden" id="otherReasonID" name="otherReason" />
<input type="hidden" id="lastCallDateID" name="lastCallDate" />
  
  
  
  
  
  <div class="modal fade" id="addnote1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 		<div class="modal-dialog">
    	<div class="modal-content">
    		<form id="addactivity" class="form-horizontal" >
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Call Tracker</h4>
      	</div>
      	
      	<div id="success-msg"></div>
      		<div class="modal-body">
      		
					
							
      		 
      				<input type="hidden" id="activityOriginatedByPartyID" name="activityOriginatedByPartyID" value="${partyID}"/>
					<input type="hidden" id="activityId" name="activityId" value="0"/>
			
      				<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Type<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							<select id="activityTypeId" name="activityTypeId" class="form-control" style="width:250px; float:left;"><option value="">--Select--</option></select>
								
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
		
			<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Status<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							<select id="activityStatusId" name="activityStatusId" class="form-control" style="width:250px; float:left;"><option value="">--Select--</option></select>
								
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
				<!-- 	<span  class="searchpadding padding_top" style="float:left; width:150px;">Call Status     <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:250px;">
				<select  id="activityStatusId" name="activityStatusId" class="form-control" style="width:250px; float:left;">
				</select>
			</span>
		<div class="clearfix"></div> -->
		
					

<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Contex<span class="red">*</span></label>
						
						
						

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<div class="test" id="activityContextId">
								</div>
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call SubContext</label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<select id="activitySubContextId" name="activitySubContextId" multiple="multiple" class="form-control" style="width:250px; float:left;">
			
		</select>
								
							</div>
						</div>
					</div>
					
					
					
					
								<div class="space-2"></div>
					
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Note<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<textarea class="form-control" name="activityNote" id="activityNote" rows="5"></textarea>
			
		
								
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
					
					<div class="space-2"></div>



					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Duration <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="number" min="1" max="60" step="1" value="1" id="activitySpend" name="activitySpend"> Mins 
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">end Email </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<span class="searchpadding padding_top" style="float:left; width:250px;">
			 
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="1">Partner<br>
				
				
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="2">RM<br>
				
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="3">Both
			
			</span>
								
							</div>
						</div>
					</div>
					
					<div class="space-2"></div>

				</div><!-- modal body end -->
					
					
					</form>
					<div class="modal-footer">
						    		
								
                    			
                    			<input class="btn btn-sm btn-primary" name="saveclose" value="Save &amp; Close" id="savenew" type="button" onclick="saveCall()">
                    			<button  class="btn btn-sm btn-danger" onClick="List();"><i class='fa fa-times'></i>Cancel</button> 
					</div>
			</div>
		</div>
			</div>
  
  
  
  
   
  <div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 		<div class="modal-dialog">
    	<div class="modal-content">
    	
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();";><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Call Tracker</h4>
      	</div>
      	
      		<form id="editactivity" class="form-horizontal" >
      		<div class="modal-body">
      		
					
							
      		 
      			<input type="hidden" id="activityOriginatedByPartyID" name="activityOriginatedByPartyID" value="${partyID}"/>
				<input type="hidden" id="editactivityId" name="activityId" value=""/>
			
      				<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Type<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<select  id="editactivityTypeId" name="activityTypeId" class="form-control" style="width:250px; float:left;">
				</select>
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Status <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
						<select  id="editactivityStatusId" name="activityStatusId" class="form-control" style="width:250px; float:left;">
				</select>
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
			<!-- 			<span  class="searchpadding padding_top" style="float:left; width:150px;">Call Status     <span class="red">*</span> </span>
			<span  class="searchpadding padding_top" style="float:left;width:250px;">
				<select  id="editactivityStatusId" name="activityStatusId" class="form-control" style="width:250px; float:left;">
				</select>
			</span>
		<div class="clearfix"></div> -->

<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Contex<span class="red">*</span></label>
						
						
						

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<div id="editactivityContextId"></div>
								</div>
								
							</div>
						</div>
					
					<div class="space-2"></div>
					
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call SubContext</label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<select  id="editactivitySubContextId" name="activitySubContextId" multiple="multiple"  class="form-control" style="width:250px; float:left;">
			
		</select>
							</div>
						</div>
					</div>
					
					
					
					
								<div class="space-2"></div>
					
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Note<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<textarea class="form-control" name="activityNote" id="editactivityNote" rows="5" ></textarea>
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
					
					<div class="space-2"></div>



					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Call Duration <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							 <input type="number" min="1" max="60" step="1" value="1" id="editactivitySpend" name="activitySpend">Mins 
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Send Email </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<span class="searchpadding padding_top" style="float:left; width:250px;">
			 
				<input type="radio" name="sendEmail"  class="radiocheck" id="send11" value="1">Partner<br>
				<c:if test="${roleId == 203}">
				<input type="radio" name="sendEmail"  class="radiocheck" id="send" value="4">PST</br>
				</c:if>
					<c:if test="${roleId == 5}">
				<input type="radio" name="sendEmail"  class="radiocheck" id="send" value="2">RM</br>
				</c:if>
				<input type="radio" name="sendEmail" class="radiocheck" id="send" value="3">Both
			</span>
			
			
								
							</div>
						</div>
					</div>
					
					<div class="space-2"></div>

				</div><!-- modal body end -->
					
					<div class="modal-footer">
						    		
								
                    			
                    			<input class="btn btn-sm btn-primary" name="saveclose" value="Save &amp; Close" id="editsaveclose" type="button" onclick="editcall()">
                    			<button  class="btn btn-sm btn-danger" onClick="List();"><i class='fa fa-times'></i>Cancel</button> 
					</div>
					</form>
			</div>
		</div>
			</div>
  
  
  
  
  
  
  
  
<!-- Select Reason for Partner Rating Define Rating -->    
<div class="modal fade" id="ratingnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
 	  	<div class="modal-content">
      	
      	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"  onclick="reload();"><span aria-hidden="true">&times;</span></button>
        
        <h4 class="modal-title" id="myModalLabel">Select Reason for Partner Rating</h4>
     	</div>
     	<div class="ratingnotescroll" >
     	 <div class="modal-body">
     	      	 <div class="row">
				

			<input type="hidden" id="confirmreason" name="confirmreason" />
			<input type="hidden" id="reasonidString" name="reasonidString" />
		  	<input type="hidden" id="partnerParty" name="partnerParty" value='<%=request.getParameter("partyID")%>' />
			<input	type="hidden" id="rollId" name="rollId"	value="${sessionScope.userSession.roleId}"> 
			


			
			




				<form class="form-horizontal"  id="editratting">
							
					<div class="from-group">
					<div class="col-xs-12">
						
						<input type="radio" id="onboarded" name=onboarded value="1" onclick="#"/><b>ONBOARDED</b>
					
						<input type="radio" id="notonboarded" name=notonboarded value="1" onclick="#"/><b>NOT-ONBOARDED</b>
						</div>
					</div>
					&nbsp;
						<div class="clearfix"></div>
					<div class="from-group">
						<div class="col-xs-12 ">		
							<span class="searchpadding padding_top" id="statusId2" style="padding-left:0px"  onChange="getreasonForRating(1)"></span>
							<br/>
							</div>
					</div>
				&nbsp;
					
					
					<div class="from-group">
					<label class="control-laabel col-xs-12 col-sm-2 no-padding-right" for="OtherNote">Other Note:</label>
						<div class="col-xs-12 col-sm-10">				
				<!-- 				 <textarea name="otherNote"  id="otherNote" placeholder='Other Note'></textarea -->
								 <textarea name="otherNote"  id="otherNote" class="autosize-transition form-control" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 52px;" placeholder='Other Note'></textarea>	
				
						</div>
					
								
					</div>
					
					<div class="clearfix"></div>
					<div class="clearfix"></div>
					<div class="table-responsive"
						style="width: 95%; margin: 10px auto; border: none;">

						<table id="partnerRating"
							class="table table-hover table-striped table-bordered">

						</table>
					</div>					
				</form>
				
				
		 </div>
		 </div>
		 </div>
                    
     		 <div class="modal-footer">
				<button class="btn btn-sm btn-primary" name="saveclose" id="Save"
							onClick="getselectedReason();" ><i class='ace-icon fa fa-plus'></i>Save</button>
				<button class="btn btn-sm btn-danger" onClick="reload();" value="Cancel" id="Cancel"><i class='ace-icon fa fa-trash'></i>Cancel</button>		
			</div>
       </div>
   </div>
 </div>
 
 <!-- Partner Rating History -->
<!-- fro dnd radio button -->
	<div class="modal fade" id="dndnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Message</h4>
        	</div>
				   Once you select DND or NOT TO BE CONTACTED than it should not allow to be reversed back. Do you want to proceed?
	
				  <div class="modal-footer">
				 
					<form >		
					  <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="check();"> Yes</button>
					  <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
					   type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>	
					</form>
						</div>
						    				
				</div>
 		</div>
 		</div>
<!-- - -->

		
<!-- call tarcker -->    
<div class="modal fade" id="ratinghistorynote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
 	  	<div class="modal-content">
      	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Partner Rating History </h4>
        
     	</div>
     	 <div class="modal-body">
     	 <div class="from-group ">
			
				<form id="Historyrating" >
					
					<div class="clearfix"></div>			
						<table id="partnerRatingHistory"
							class="table table-hover table-striped table-bordered" >
							<tr>
									<th class="thead" width="10%">Partner Rating</th>
									<th class="thead" width="15%">Last Updated By</th>
									<th class="thead" width="20%">Last Modified Date</th>
									<th class="thead" width="40%">Last Reason's</th>
							</tr>
						</table>
						
						
						
					
					</form>
					</div>
					<div class="from-group ">
					<div class="clearfix"></div>
						<div class="modal-footer">
						<input class="dbtn" onClick="reload();" value="Cancel" id="Cancel" 	type="button"> <br />
					</div>
				
				</div>
			</div>
                    
     		 
       </div>
   </div>
 </div>
                    
<div class="row">                    
     <div class="pull-right">
    <div class="clearfix">
    					<button id="SPloginhistorybackLink" class="btn btn-md btn-sm" onClick="goback();">Back</button>    
        				</div>    
    			 </div> 					                   
 	</div>
 	<div class="space-2"></div>
<div class="row">

<div class="alert alert-warning">
	<div class="page-header">
		<h1>
		Partner Dashboard for ${partnername}
		</h1>
	</div>	
		
	<c:if test="${lastLogin != ''} || ${lastLogin != null}">Last Login on ${lastLogin}
     	<c:choose>
			<c:when test="${active=='true'}">
				<span class="label label-success arrowed">
					<a href="#" style="color: #FFF;">Active </a>
				</span>	
			</c:when>

			<c:otherwise>
				<span class="label label-danger arrowed">
					<a href="#" style="color: #FFF;">InActive </a>
				</span>	
			</c:otherwise>

		</c:choose>
	</c:if>
</div>
 </div>
                                     
 <div class="col-md-7">
    <div class="row">
    
    
     <!-- Overall Entities & Accounts -->  
      <div class="col-md-12">
        <div class="space"></div>
        <div class="widget-box widget-color-dark">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Overall Entities & Accounts</h4>
         </div>
          <div class="widget-body">
            <div class="widget-main no-padding">
              <!-- #section:pages/dashboard.conversations -->
               <div class="row">
					<div class="col-xs-12">
                     <div class="table-responsive">
                     <table id="entitiesAccnts" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Duration</th>
                    <th>Opportunities</th>
                    <th>Clients</th>
                    <th>Premium Clients</th>
                    <th>Folio Accounts</th>
                  </tr>
                </thead>
                <tbody>
               
                </tbody>
              </table>
               </div> </div> </div>
            </div>
            </div>
       </div>
 	</div>
     
		</div> 
  </div>
  
      
      
    
  <div class="col-md-5">
		<h4 class="row header smaller lighter blue">
			<span class="col-sm-7">
				<i class="ace-icon fa fa-user"></i> Partner Rating <span id="ratingonboard"></span>
			</span>
			
		</h4>
    	
		<span class="searchpadding padding_top"
			style="float: left; width: 150px; padding: 10 10px;">Partner
			Rating/Ranking 
		</span>
		<span class="searchpadding padding_top"
			style="float: left; padding: 10 10px;"> <select
			name="statusRefId" class="form-control" id="statusId" disabled></select>
		</span>
		&nbsp;
		&nbsp;
		<span class="label ticket-label">
		<a href="#" id="SPEditPartnerRatingLink"><img
				src="<%=request.getContextPath()%>/images/edit.png"
				onClick="ViewStatus(1);ratingNote();"></a>
		</span>
		&nbsp;
		<span class="label ticket-label" ><a
			href="#" id="SPEditPartnerRatingLink"><img
				src="<%=request.getContextPath()%>/images/history.png"
				onClick="ratingHistoryNote();showRatingHistory()"></a>
		</span>
    	
        
      </div>
      
                                    
      <div class="col-md-5">
		<h4 class="row header smaller lighter blue">
			<span class="col-sm-6">
				<i class="ace-icon fa fa-headphones"></i> Call Tracker
			</span>
            
            <span class="col-sm-6 pull-right">
				<button id="bootbox-options" onClick="addNote1();" class="btn btn-xs btn-success pull-right"><i class="ace-icon fa fa-plus"></i> Add</button>
			</span>
			
		</h4>
        
        <div class="widget-body">
											<div class="widget-main padding-8">
												<!-- #section:pages/profile.feed -->
												<div id="list" ng-app="" ng-controller="PaginationCtrl" class="profile-feed">
													<div class="profile-activity clearfix" ng-repeat="item in items | offset: currentPage*itemsPerPage | limitTo: itemsPerPage">
														<div>
															<img class="pull-left" alt="Alex Doe's avatar" src="../assets/avatars/avatar5.png" />
															<a class="user" > Alex Doe </a>
															{{ item.activityType }} /  {{ item.activityContext }}
															<a href="#">Take a look</a>

															<div class="time">
																<i class="ace-icon fa fa-clock-o bigger-110"></i>
																an hour ago
															</div>
														</div>

														<div class="tools action-buttons">
															<a href="#" class="blue">
														    	 <input type="hidden" id="callactivityId" name="activityId" value="{{item.activityId}}">
																<i class="ace-icon fa fa-pencil bigger-125" onclick="editNote();getActivity({{item.activityId}});"></i>
															</a>

															
														</div>
													</div>




												<!-- /section:pages/profile.feed -->
												<!-- 	  pagination starts -->
        							<ul class="pager">
											<li class="previous" ng-class="prevPageDisabled()">
												<a href ng-click="prevPage()">&larr; Previous</a>
											</li>

											<li class="next" ng-class="nextPageDisabled()">
												<a href ng-click="nextPage()">Next &rarr;</a>
														</li>
											</ul>
									     <!--    pagination ends --> 
									    	
											</div>
										</div>
									
								
										
									</div>

                                            
      
        
      </div>
      
      
      
      
                                            
 <div class="col-md-12">
 <div class="row">
  	<!-- Data Collection -->
  	<div class="col-md-12">
        <div class="space"></div>
        <div class="widget-box widget-color-dark">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Execution Enabler</h4>
          </div>
          <div class="widget-body">
            <div class="widget-main no-padding">
              <!-- #section:pages/dashboard.conversations -->
               <div class="row">
					<div class="col-xs-12">
                    <div class="table-responsive"  style=" height: 400px;    overflow-y: auto;">
                <table id="executionEnabler" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Assets</th>
                    <th>Recommended Instrument</th>
                    <th>No. of Opportunities</th>
                    <th>Total Investment Amount SIP</th>
                    <th>Total Investment Amount Lumsum/Premium Amount/Fees</th>
                    <th>Brokerage</th>
                    <th>Potential Revenue SIP</th>
                    <th>Potential Revenue Lumsum</th>
                  </tr>
                </thead>
                <tbody>
                 
                </tbody>
              </table>
                	</div></div></div>
            	</div>
           </div>
      </div>
  	</div>
  </div>
  </div>
      
                                       
 <div class="col-md-7">
 <div class="row">
  	<!-- Data Collection -->
  	<div class="col-md-12">
        <div class="space"></div>
        <div class="widget-box widget-color-dark">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Data Collection</h4>
          </div>
          <div class="widget-body">
            <div class="widget-main no-padding">
              <!-- #section:pages/dashboard.conversations -->
               <div class="row">
					<div class="col-xs-12">
                    <div class="table-responsive">
                <table id="datacollection" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Duration</th>
                    <th>Data Collection Activated</th>
                    <th>Data Collection Completed</th>
                    <th>Contact</th>
                    <th>Goals</th>
                    <th>Goal Amount</th>
                    <th>Investment Amount</th>
                    <th>Potential Revenue</th>
                  </tr>
                </thead>
                <tbody>
                 
                </tbody>
              </table>
                	</div></div></div>
            	</div>
           </div>
      </div>
  	</div>
  
  
	  <!-- Execution -->    
	  <div class="col-md-12">
	        <div class="space"></div>
	        <div class="widget-box widget-color-dark">
	          <div class="widget-header">
	            <h4 class="widget-title lighter smaller">Execution</h4>
	          </div>
	          <div class="widget-body">
	            <div class="widget-main no-padding">
	              <!-- #section:pages/dashboard.conversations -->
	              <div class="row">
						<div class="col-xs-12">
                                  <div class="table-responsive">
									<table id="execution" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>Duration</th>
											<th>Execution Open</th>
											<th>Execution Completed</th>
											<th>Investment Amount</th>
											<th>Actual Revenue</th>
										</tr>
									</thead>
									 <tbody>
										
									</tbody>
								</table>
                               </div>
							</div>
						</div>
	          		  </div>
	          	</div>
	       </div>
	 </div>
      
      
 <!-- Last 10 Contact Login -->     
 <div class="col-md-12 col-xs-12">
        <div class="space"></div>
        <div class="widget-box widget-color-dark">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Last 10 Contact Login</h4>
          </div>
          <div class="widget-body">
            <div class="widget-main no-padding">
              <!-- #section:pages/dashboard.conversations -->
              <div class="row">
				<div class="col-xs-12">
                   <div class="table-responsive">
                 <table id="topuser" class="table table-striped table-bordered table-hover">
                	<thead>
	                  <tr>
	                    <th>Name</th>
	                    <th>Login Date</th>
	                    <th>Time</th>
	                  </tr>
                </thead>
                <tbody>
                  
                </tbody>
              </table>
              </div></div></div>
             </div>
           </div>
          </div>
      </div>
      
      
      <div class="col-md-12 col-xs-12 col-sm-12">
        <div class="space"></div>
        <div class="widget-box widget-color-dark">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Open Execution Tracker</h4>
          </div>
          <div class="widget-body">
            <div class="widget-main no-padding">
              <div class="row">
				<div class="col-xs-12">
                 <div class="table-responsive">
		             <table id="topexetracker" class="table table-striped table-bordered table-hover">
		               <thead>
		                 <tr>
		                   <th>Name</th>
		                   <th>Date</th>
		                   <th>Contact</th>
		                  <!--  <th>Txn Type</th> -->
		                   <th>Product</th>
		                   <th>Txn Amount (Rs.)</th>
		                  <!--  <th>Elapsed Days</th> -->
		                   <th>Status</th>
		                 </tr>
		               </thead>
		               <tbody>
		               </tbody>
		             </table>
               </div> </div> </div>
              <!-- /section:pages/dashboard.conversations -->
              
            </div>
            <!-- /.widget-main -->
          </div>
          <!-- /widget-body -->
        </div>
      </div>
      
    </div>
</div>
    
   
 
      
      
      <div class="col-md-5">
		<h4 class="row header smaller lighter blue">
			<span class="col-sm-7">
				<i class="ace-icon fa fa-arrows-h"></i> Subscription
			</span>
			
		</h4>
    	<div class="box-header">
					 <h3><label id="subxName"></label><span style="font-size:11px;color:gray; "></span></h3>  
					 </div> 
					<div class="panel-body tab-content-padding" id="currSubx">
					<span  class="searchpadding padding_top" style="float:left; width:150px;">Valid Till</span>
<span  class="searchpadding padding_top"   style="float:left; width:100px;"><label id="expDate"></label></span>
       <div class="clearfix"></div>
 
        <span class="searchpadding padding_top" style="float:left; width:150px;">Last Payment Amount</span>
<span  class="searchpadding padding_top"  style="float:left; width:100px;"><label id="lastPaymentAmount"></label></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Last Payment Date</span>
<span  class="searchpadding padding_top"   style="float:left; width:100px;"><label id="lastPaymentDate"></label></span>

							<div class="clearfix"></div>
							<span class="searchpadding padding_top"
								style="float: left; width: 150px;">Last Payment Status</span> <span
								class="searchpadding padding_top"
								style="float: left; width: 100px;"><label
								id="paymentStatusID"></label></span>


							<div class="clearfix"></div>

						</div>
        
      </div>
      
      
      
      
      
      
      
      
      
      <div class="col-md-5">
		<h4 class="row header smaller lighter blue">
			<span class="col-sm-7">
				<i class="ace-icon fa fa-calendar-o"></i> Task Calender
			</span>
		</h4>
    	<div id="calendar"></div>
       <div class="nav nav-pills hide widget-box widget-color-transparent">
          <div class="widget-body">
            <div class="widget-main no-padding scrollable">
              <!-- #section:pages/dashboard.conversations -->
              <table id="taskdetails" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <th>Task Owner</th>
                    <th>Subject</th>
                     <th>Date</th>
                      <th>Priority</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
              
                </tbody>
              </table>
           </div>
          </div>
        </div> 
    <!--Last contact End -->
  </div>
  
    	<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>    
    <script type="text/javascript">
			jQuery(function($) {
				ViewStatus(0);
				
/* initialize the external events
	-----------------------------------------------------------------*/
	 var partyID = $('#partyID').val();
	$.ajax({
		
		type : "POST", 
		url :$('#contextPath').val()+"/dashboard/showAdvTaskAlert.htm?partyID="+partyID,
		//dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
			//alert(result)
			var firstRow = new Array();	
				firstRow.push('Goal');
				firstRow.push('Goal By Type');
				var title = 'Goal By Type:  ';
						//+ $("#leadSourceRange option:selected").text();
				var outerArray = create2dArrayforgoal(result);
				renderCalendar(outerArray);
	}
});				
				
function create2dArrayforgoal(result) {
 		isDataAvailable = false;
 		var innerArray = new Array();
 		var outerArray = new Array();
 		var date;
 		for ( var i = 0; i < result.length; i++) {

 			innerArray = new Array();
 			date= String.valueOf(result[i].taskSubject);
 			innerArray.push('{"title": "'+result[i].taskSubject+'", "start":"'+result[i].taskDate+'"}');	
 			outerArray.push(innerArray);
 		}
 		return outerArray;
 }

	$('#external-events div.external-event').each(function() {

		// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		// it doesn't need to have a start or end
		var eventObject = {
			title: $.trim($(this).text()) // use the element's text as the event title
		};

		// store the Event Object in the DOM element so we can get to it later
		$(this).data('eventObject', eventObject);

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});
		
	});




	/* initialize the calendar
	-----------------------------------------------------------------*/

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	function renderCalendar(outerArray) {
		   var start = "["
			  	  var outarray=outerArray.toString()+"]";
			  	  var result = start.concat(outarray);
	var calendar = $('#calendar').fullCalendar({
		//isRTL: true,
		 buttonHtml: {
			prev: '<i class="ace-icon fa fa-chevron-left"></i>',
			next: '<i class="ace-icon fa fa-chevron-right"></i>'
		},
	
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		events:JSON.parse(result)
		,
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar !!!
		drop: function(date, allDay) { // this function is called when something is dropped
		
			// retrieve the dropped element's stored Event Object
			var originalEventObject = $(this).data('eventObject');
			var $extraEventClass = $(this).attr('data-class');
			
			
			// we need to copy it, so that multiple events don't have a reference to the same object
			var copiedEventObject = $.extend({}, originalEventObject);
			
			// assign it the date that was reported
			copiedEventObject.start = date;
			copiedEventObject.allDay = allDay;
			if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
			
			// render the event on the calendar
			// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
			$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
			
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
			
		}
		,
		selectable: true,
		selectHelper: true,
		select: function(start, end, allDay) {
			
		/* 	bootbox.prompt("New Event Title :", function(title) {
				if (title !== null) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay,
							className: 'label-info'
						},
						true // make the event "stick"
					);
				}
			}) */;
			

			calendar.fullCalendar('unselect');
		}
		,
		eventClick: function(calEvent, jsEvent, view) {
		/* var s=calEvent.title;
			alert(s);
			alert(jsEvent);
			alert(view);
			//display a modal
			var modal = 
			'<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				   <form class="no-margin">\
					  <label>Change event name &nbsp;</label>\
					  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
				   </form>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>';
		
		
			var modal = $(modal).appendTo('body');
			modal.find('form').on('submit', function(ev){
				ev.preventDefault();

				calEvent.title = $(this).find("input[type=text]").val();
				calendar.fullCalendar('updateEvent', calEvent);
				modal.modal("hide");
			});
			modal.find('button[data-action=delete]').on('click', function() {
				calendar.fullCalendar('removeEvents' , function(ev){
					return (ev._id == calEvent._id);
				})
				modal.modal("hide");
			});
			
			modal.modal('show').on('hidden', function(){
				modal.remove();
			}); */
 

			//console.log(calEvent.id);
			//console.log(jsEvent);
			//console.log(view);

			// change the border color just for fun
			//$(this).css('border-color', 'red');

		}
		
	});
	}

})
		</script>
  
      
      
      <!-- <div class="col-md-5">
	    <div class="space"></div>
	    <div class="widget-box">
	        <div class="widget-header">
	           <h4 class="widget-title lighter smaller">Query</h4>
	         </div>
	         <div class="widget-body">
	           <div class="widget-main no-padding"> 
	               <div class="dialogs">
	                   <div id="queryList" class="query dialogdiv">
	                    </div>
	               </div>
	           </div>
	         </div>
	     </div>
	  </div>
      
       <div id="gupshupMsg" class="dialogs">
	          </div> -->
      
        <!-- Start  gup shup -->
 <%--  <div class="col-md-5">
	  <div class="space"></div>
	    <div class="widget-box">
	      <div class="widget-header">
	        <h4 class="widget-title lighter smaller">Recent Chat</h4>
	      </div>
	      <div class="widget-body">
        <div class="widget-main no-padding">
          <!-- #section:pages/dashboard.conversations -->
          <div class="dialogs" >
          		<div id="recentchat" class="dialogs">
	          </div>
           
           
          </div>
          
          <!-- /section:pages/dashboard.conversations -->
          <form id="sendquery" method="post">
          				<input type="hidden" id="chatOnRelatedPartyID" name="chatOnRelatedPartyID" value="${partyID}"/>
						<input type="hidden" id="chatContactTypeID" name="chatContactTypeID" value="${recordTypeID}"/>
						<input type="hidden" id="chatTypeId" name="chatTypeId" value="16001"/>
						<input type="hidden" id="parentChatID" name="parentChatID" value="0"/>
				<div class="form-actions">
					<div class="input-group">
						<input placeholder="Type your message here ..." type="text" class="form-control" name="chatText" id="sendmessage">
						<span class="input-group-btn">
							<button class="btn btn-sm btn-info no-radius" onclick="sendChat();" type="button">
								<i class="ace-icon fa fa-share"></i>
								Send
							</button>
						</span>
					</div>
				</div>
			</form>
        </div>
        <!-- /.widget-main -->
      </div>
	    </div>
	</div> --%>
</div>
<footer>
	<jsp:include page="../common/footer.jsp" />
</footer>
</body>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
////////////////ScrollBar////////////
	$('.ratingnotescroll').ace_scroll({
	size: 600
	 });
	 var partyID = $('#partyID').val();
	 getdataforrecentchat();
	 
//call tracker type

 $.ajax({ 				
			   	type: "POST",
			   	url:$('#contextPath').val()+'/ping/getPicklistValues.htm?codeTypeIds=188,189,207',
			   	dataType: 'json',
				contentType: 'application/json',
				success:function(result){ 
					$('#activityContextId,#activityTypeId,#activityStatusId').empty();
					//$('#activityTypeId').append('<option value="">--Select--</option>');
					 $.each( result, function( index, value ) {
						var codeTypeId=value.codeTypeId;
						var codeValue=value.codeValue;
						var codeValueId=value.codeValueId;
						if(codeTypeId == 189 && codeValueId==189016 || codeValueId==189017 || codeValueId==189018 || codeValueId==189019 || codeValueId==189020 || codeValueId==189021 || codeValueId==189022 || codeValueId==189023 || codeValueId==189024 || codeValueId==189025 || codeValueId==189026 || codeValueId==189032 || codeValueId==189033){
							$("#activityContextId").append('<input type="checkbox" id="activityContextId" name="activityContextId" onclick="showselection();" value="'+codeValueId+'">'+codeValue+'<br>');		
							
							
						}else if(codeTypeId == 188){
							if(codeValueId == 188007){
							$("#activityTypeId").append('<option value="'+codeValueId+'" selected="selected" >'+codeValue+'</option>');}
							else{
								$("#activityTypeId").append('<option value="'+codeValueId+'"  >'+codeValue+'</option>');
							}
						}
						else if(codeTypeId == 207){
							$("#activityStatusId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');		
						}
						
					 });
					}  	
			   	});
		 
		 $.ajax({ 				
			   	type: "POST",
			   	url:$('#contextPath').val()+'/ping/getPicklistValues.htm?codeTypeIds=189,188,207',
			   	dataType: 'json',
				contentType: 'application/json',
				success:function(result){ 
					$('#editactivityContextId,#editactivityTypeId,#editactivityStatusId').empty();
				
					 $.each( result, function( index, value ) {
						var codeTypeId=value.codeTypeId;
						var codeValue=value.codeValue;
						var codeValueId=value.codeValueId;
						 if(codeTypeId == 189){
							$("#editactivityContextId").append('<option value="'+codeValueId+'">'+codeValue+'</option>');	
						}else if(codeTypeId == 188){
							$("#editactivityTypeId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');	
						}
						else if(codeTypeId == 207){
							$("#editactivityStatusId").append('<option value="'+codeValueId+'" >'+codeValue+'</option>');	
						}
					 });
					}  	
			   	});
// open entities and accounts
$.ajax({
	
	type : "POST", 
	url :$('#contextPath').val()+"/dashboard/showPartnerEntAccnts.htm?partyID="+partyID,
	contentType : 'application/json',
	success : function(result) {
		//alert(result)
		 $.each( result, function( index, value ) {
			 var duration=value.duration;
			 var oppnumbers=value.oppnumbers;
			 var clientnumbers=value.clientnumbers;
			 var premiumnumbers=value.premiumnumbers;
			 var folionumbers=value.folionumbers;
				if(duration == 'Total'){
				var row=document.createElement('tr'); 
				 $(row).append("<td class='danger'>"+duration+"</td>")
				  .append("<td class='danger'>" + oppnumbers + "</td>")
				  .append("<td class='danger'>" + clientnumbers + "</td>")
				  .append("<td class='danger'>" + premiumnumbers + "</td>")
				  .append("<td class='danger'>" + folionumbers + "</td>")
				  .append("</tr>");
	             $("#entitiesAccnts").append(row);
	             }
				else {		
				 var row=document.createElement('tr'); 
				 $(row).append("<td style='background-color:#EEE;'>"+duration+"</td>")
				  .append("<td>" + oppnumbers + "</td>")
				  .append("<td>" + clientnumbers + "</td>")
				  .append("<td>" + premiumnumbers + "</td>")
				  .append("<td>" + folionumbers + "</td>")
				  .append("</tr>");
			    $("#entitiesAccnts").append(row); 
			}
		 });
	}
});

//data collection
//
 $.ajax({
					
	type : "POST", 
	url :$('#contextPath').val()+"/dashboard/showPartnerDataCollection.htm?partyID="+partyID,
	contentType : 'application/json',
	success : function(result) {
		//alert(result)
		 $.each( result, function( index, value ) {
			 var duration =value.duration;
			 var dataCollectionActivated =value.dataCollectionActivated;
			 var dataCollectionCompleted=value.dataCollectionCompleted;
			 var opportunities=value.opportunities;
			 var goals=value.goals;
			 var goalAmount=value.goalAmount;
			 var investmentAmount=value.investmentAmount;
			 var potentialRevenue=value.potentialRevenue;
			
			 if(duration == 'Total'){
			 var row=document.createElement('tr'); 
			 $(row).append("<td class='danger'>"+duration+"</td>")
            	 .append("<td class='danger'>"+ dataCollectionActivated +"</td>")
			  	 .append("<td class='danger'>"+dataCollectionCompleted+"</td>")
			     .append("<td class='danger'>"+opportunities+"</td>")
			     .append("<td class='danger'>"+goals+"</td>")
			     .append("<td class='danger'>"+goalAmount+"</td>")
			     .append("<td class='danger'>"+investmentAmount+"</td>")
			     .append("<td class='danger'>"+potentialRevenue+"</td>")
            	 .append("</tr>");
             $("#datacollection").append(row);
			 }
			 else{
			 var row=document.createElement('tr'); 
			 $(row).append("<td>"+duration+"</td>")
            	 .append("<td>"+ dataCollectionActivated +"</td>")
			  	 .append("<td>"+dataCollectionCompleted+"</td>")
			     .append("<td>"+opportunities+"</td>")
			     .append("<td>"+goals+"</td>")
			     .append("<td>"+goalAmount+"</td>")
			     .append("<td>"+investmentAmount+"</td>")
			     .append("<td>"+potentialRevenue+"</td>")
            	 .append("</tr>");
             $("#datacollection").append(row);			
			}	 
		
			
		 });
	}
});



//getExecutionEnabler

$.ajax({
					
	type : "POST", 
	url :$('#contextPath').val()+"/dashboard/getExecutionEnabler.htm?partyID="+partyID,
	contentType : 'application/json',
	success : function(result) {
		//alert(result)
		//$('#executionEnabler').tableScroll({height:200});
		 $.each( result, function( index, value ) {
			 var assets =value.assets;
			 var recommendedInstrument =value.recommendedInstrument;
			 var oppsCount=value.oppsCount;
			 var totalSIP=value.totalSIP;
			 var totalLumsum=value.totalLumsum;
			 var brokerage=value.brokerage;
			 var estiamteRevenueSIP=value.productName;
			 var estiamteRevenueLumsum=value.estiamteRevenue;
			
			 if(assets == 'Total'){
			 var row=document.createElement('tr'); 
			 $(row).append("<td class='danger'>"+assets+"</td>")
            	 .append("<td class='danger'>"+ recommendedInstrument +"</td>")
			  	 .append("<td class='danger'>"+oppsCount+"</td>")
			     .append("<td class='danger'>"+totalSIP+"</td>")
			     .append("<td class='danger'>"+totalLumsum+"</td>")
			     .append("<td class='danger'>"+brokerage+"</td>")
			     .append("<td class='danger'>"+estiamteRevenueSIP+"</td>")
			     .append("<td class='danger'>"+estiamteRevenueLumsum+"</td>")
            	 .append("</tr>");
             $("#executionEnabler").append(row);
			 }
			 else{
			 var row=document.createElement('tr'); 
			 $(row).append("<td>"+assets+"</td>")
            	 .append("<td>"+ recommendedInstrument +"</td>")
			  	 .append("<td>"+oppsCount+"</td>")
			     .append("<td>"+totalSIP+"</td>")
			     .append("<td>"+totalLumsum+"</td>")
			     .append("<td>"+brokerage+"</td>")
			     .append("<td>"+estiamteRevenueSIP+"</td>")
			     .append("<td>"+estiamteRevenueLumsum+"</td>")
            	 .append("</tr>");
             $("#executionEnabler").append(row);			
			}	 
		
			
		 });
	}
});


//Execution
 $.ajax({
		type : "POST", 
		url :$('#contextPath').val()+"/dashboard/showPartnerExecution.htm?partyID="+partyID,
		contentType : 'application/json',
		success : function(result) {
			//alert(result);
			if(result != 0){
			 $.each( result, function( index, value ) {
				 var duration=value.duration;
				 var executionOpen=value.executionOpen;
				 var executionCompleted=value.executionCompleted;
				 var investmentAmount=value.investmentAmount;
				 var actualRevenue=value.actualRevenue;
				 var row=document.createElement('tr');
				 if(duration == 'Total'){
				 var row=document.createElement('tr'); 
				 $(row).append("<td class='danger'>"+duration+"</td>")
				  .append("<td class='danger'>" + executionOpen + "</td>")
				  .append("<td class='danger'>" + executionCompleted + "</td>")
				  .append("<td class='danger'>" + investmentAmount + "</td>")
				  .append("<td class='danger'>" + actualRevenue + "</td>")
				  .append("</tr>");
               		$("#execution").append(row); 	 
				 }
				 else{
				 var row=document.createElement('tr'); 
				 $(row).append("<td>"+duration+"</td>")
				  .append("<td>" + executionOpen + "</td>")
				  .append("<td>" + executionCompleted + "</td>")
				  .append("<td>" + investmentAmount + "</td>")
				  .append("<td>" + actualRevenue + "</td>")
				  .append("</tr>");
               		$("#execution").append(row); 
				 }
			 });
			}
			else{
				$("#error").append("Records not found");
			}
		}
});

//call tracker 
//alert(partyID);
$.ajax({
		type : "POST", 
		url :jQuery('#contextPath').val()+"/dashboard/showPartnerActivityTracker.htm?partyID="+partyID,
		//dataType: 'json',
		contentType : 'application/json',
		success : function(result) {
			//alert(result);
			/* if(result != 0){
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
			} */
		}
		 });
//Last 10 Login

 $.ajax({
	 	type : "POST", 
		url :$('#contextPath').val()+"/dashboard/showPartnerLastLogin.htm?partyID="+partyID,
		contentType : 'application/json',
		success : function(result) {
		//alert(result);
		if(result != 0){
			 $.each( result, function( index, value ) {
				 var code =value.codeValue;
				  if(code == "Opportunity"){
					  var row=document.createElement('tr');
                      $(row).append("<td><i class='opportunityicon' title='Opportunity'></i>"+ value.lastName +"</td>")
                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
                       .append("<td>" + value.lastCurrentDateTime + "</td>")
                       .append("</tr>");
                      $("#topuser").append(row); 
				  }
				  else if(code == "Client"){
					  var row=document.createElement('tr');
                      $(row).append("<td><i class='clienticon' title='Client'></i>"+ value.lastName +"</td>")
                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
                       .append("<td>" + value.lastCurrentDateTime + "</td>")
                       .append("</tr>");
                      $("#topuser").append(row);
				  }
				  else{
					  var row=document.createElement('tr');
                      $(row).append("<td><i class='pclienticon' title='PClient'></i>"+ value.lastName +"</td>")
                       .append("<td>" + value.lastCurrentDateLogin + "</td>")
                       .append("<td>" + value.lastCurrentDateTime + "</td>")
                       .append("</tr>");
                      $("#topuser").append(row);
				  }
			 });
		}else{
			 $("#error-msg1").append("<span class='label label-danger'>Records not found</span>");
		}
	}
 });
 
 $.ajax({
	type : "POST", 
	url :$('#contextPath').val()+"/dashboard/showPartnerPendingQuery.htm?partyID="+partyID,
	contentType : 'application/json',
	success : function(result) {
		//alert(result);	
		if(result != 0){
		 $.each(result, function( index, value ){
			 var subject=value.subject;
			 var status=value.status;
			 var queryOwnerName=value.queryOwnerName;
			 var lastUpdatedDate=value.lastUpdatedDate;
		//	 $('#queryAdvList').append('<li class="list-group-item" style="border:none; padding-left: 0;">	<span class=" pull-right " ><span class="label label-info">'+status+'</span></span><i class="pull-left muted icon-bar-chart" style="margin-top:.3em;"></i><div style="border-bottom:1px solid #eee; padding-bottom:10px;"><p class="title"><a href="#"> '+subject+'</a></p><p class="info"> By <a href="#">'+queryOwnerName+',</a>'+lastUpdatedDate+' </a></p></div></li>');
			 $('#queryList').append('<a class="body" href="#"> <span class="pull-right"><span class="label label-success">'+status+'</span></span> <div class="text">'+subject+'</div><span class="time"> by </span><span class="name">'+queryOwnerName+'</span><span class="time"> On '+lastUpdatedDate+'</span> </a>');
				 
		 });
		}else{
			$("#queryList").append("</br></br><span class='label label-danger'>Records not found</span>");
		}
		
	}
});
 
 //execution tracker
 
 $.ajax({
		type : "POST", 
		url :$('#contextPath').val()+"/dashboard/showPartnerExeTracker.htm?partyID="+partyID,
		contentType : 'application/json',
		success : function(result) {
		//alert(result)
		if(result != 0){
		 $.each( result, function( index, value ) {
			 var lastName=value.lastName;
			 var productName=value.productName;
			 var status=value.status;
			 var date=value.date;
			 var opportunity=value.opportunity;
			 var txnType=value.txnType;
			 var txnamount=value.txnamount;
			 var elapseddays=value.elapseddays;
			 
			  var row=document.createElement('tr');
                    $(row).append("<td>"+ value.lastName +"</td>")
                      .append("<td>" + value.date + "</td>")
                     .append("<td>" + value.opportunity + "</td>")
                     .append("<td>" + productName + "</td>")
                     .append("<td>" + txnamount + "</td>")
                     .append("<td><span class='label label-success'>"+status+"</span></td>")
                     .append("</tr>");
                    $("#topexetracker").append(row); 
		 });
		}else{
			$("#error-msg2").append("<span class='label label-danger'>Records not found</span>");
		}
	}
});


 //refresh page every 90000 msec for recent chat  
setInterval(function() {
         getdataforrecentchat();
  }, 90000);
 
 //subscription
	 $.ajax({
			url :$('#contextPath').val()+"/subx/getCurrentSubx?partyId="+partyID,
			success : function(result) {			
				if(result['subxName']!=null){
				$('#subxName').html(result["subxName"]);
				$('#expDate').html(result["subscriptionExpiryDate"]);
				$('#lastPaymentAmount').html(result["lastPaymentAmount"]);
				$('#lastPaymentDate').html(result["lastPaymentDate"]);
				$('#paymentStatusID').html(result["lastPaymentStatus"]);
			}
				else{
					
					$('#subxName').html("Subscription");
					$('#currSubx').html("Pending T&C Acceptance");					
				}
			}
	 });
 
	 
	 //recent chat
	 function getdataforrecentchat(){
	  $.ajax({
			
			type : "POST", 
			url :$('#contextPath').val()+"/dashboard/showPartnerRecentChat.htm?partyID="+partyID,
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
				     var elem = $('#recentchat');
		             //var atBottom = (elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight());
		             if(recordTypeID == 14008 || recordTypeID ==14012 || recordTypeID==14001){
		            	 $("#recentchat").append('<div class="itemdiv dialogdiv"><div class="user"><img src="${_cdn}/assets/avatars/avatar.png"></div><div class="body"><div class="time"><i class="ace-icon fa fa-clock-o"></i><span class="green">'+lastUpdatedDate+'</span></div><div class="name"><a href="#">'+clientName+'</a></div><div class="text">'+chatText+'</div> </div></div>');
		            	//<div class="tools"><a href="#" class="btn btn-minier btn-info"><i class="icon-only ace-icon fa fa-share"></i></a></div>
		            	 // if (atBottom) $('#recentchat').scrollTop($('#recentchat')[0].scrollHeight);
		             }else  if(recordTypeID == 14003){
		              	 $("#recentchat").append('<div class="itemdiv dialogdiv"><div class="user"><img src="${_cdn}/assets/avatars/avatar.png"></div><div class="body"><div class="time"><i class="ace-icon fa fa-clock-o"></i><span class="green">'+lastUpdatedDate+'</span></div><div class="name"><a href="#">'+clientName+'</a></div><div class="text">'+chatText+'</div> </div></div>');
		   	          
		            	// if (atBottom) $('#recentchat').scrollTop($('#recentchat')[0].scrollHeight);
		             }
		          });
			}else{

				 $("#recentchat").append("<span class='label label-danger'>Records not found</span>");
			}
			
			}
	});
	}
	
 	
 });
 
 
function sendChat(){
	var sendmessagedata=$('#sendmessage').val(); 
	if(sendmessagedata==""||sendmessagedata==null){
			var message='please enter your message.';
			var callback=false;
			alertmessage(message,callback)
			
		/* bootbox.dialog({
			message: "<span class='bigger-110'>please enter your message</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						
						
					}
				}
			}
		}); */
			$('#sendmessage').focus();
	}else{
		
	 $.ajax({
        type: "POST",
        url :$('#contextPath').val()+"/dashboard/sendQuery.htm",
        data: $('#sendquery').serialize(),
        success: function() {
      	//alert('Record Added successfully');
      	getdataforrecentchat();
      	
        }
  	});
}
}

function getdataforrecentchat(){
	 var partyID = $('#partyID').val();
	  $.ajax({
			
			type : "POST", 
			url :$('#contextPath').val()+"/dashboard/showPartnerRecentChat.htm?partyID="+partyID,
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
				     var elem = $('#recentchat');
				     //<div class="tools"><a href="#" class="btn btn-minier btn-info"><i class="icon-only ace-icon fa fa-share"></i></a></div>
		             //var atBottom = (elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight());
		             if(recordTypeID == 14008 || recordTypeID ==14012 || recordTypeID==14001){
		            	 $("#recentchat").append('<div class="itemdiv dialogdiv"><div class="user"><img src="${_cdn}/assets/avatars/avatar.png"></div><div class="body"><div class="time"><i class="ace-icon fa fa-clock-o"></i><span class="green">'+lastUpdatedDate+'</span></div><div class="name"><a href="#">'+clientName+'</a></div><div class="text">'+chatText+'</div> </div></div>');
		            	// if (atBottom) $('#recentchat').scrollTop($('#recentchat')[0].scrollHeight);
		            	 $('#sendmessage').val('');
		             }else  if(recordTypeID == 14003){
		              	 $("#recentchat").append('<div class="itemdiv dialogdiv"><div class="user"><img src="${_cdn}/assets/avatars/avatar.png"></div><div class="body"><div class="time"><i class="ace-icon fa fa-clock-o"></i><span class="green">'+lastUpdatedDate+'</span></div><div class="name"><a href="#">'+clientName+'</a></div><div class="text">'+chatText+'</div></div></div>');
		              	$('#sendmessage').val('');
		            	// if (atBottom) $('#recentchat').scrollTop($('#recentchat')[0].scrollHeight);
		             }
		          });
			}else{

				 $("#recentchat").append("<span class='label label-danger'>Records not found</span>");
			}
			}
	  
	});
	}
 //END document ready
 


	

 function getCurruntRatingnReason(id)
 {
 	var ratingid = 0;
 	var reasonidString = "" ;
 	var otherinfo="";
 	var partnerParty = document.getElementById("partnerParty").value;
 	if(id==0)
 		{
 	//alert("getCurruntRatingnReason"+partnerParty)
 	
 	$('#lastCallDateID').val('');
 	$('#lastCallDateID').hide();
 	 $.ajax({
 			
 			type : "POST", 
 			url :$('#contextPath').val()+"/dashboard/getCurruntRatingnReason.htm?partnerParty="+partnerParty,
 			//dataType: 'json',
 			contentType : 'application/json',
 			success : function(result) {
 				$(result).each(function(i, obj) {
 					
 				  //alert("success");
 					if(obj.ratingId == null){
 						//alert("If");
 						 return false;
 					}else{
 						//alert("else");
 					     ratingid= obj.ratingId;
 					     reasonidString = obj.reasonIdString;
 						    OtherReason = obj.otherReason;
 						    LastCallDate = obj.lastCallDate;
 						    otherinfo = obj.extraNote;
 					     //alert(otherinfo);
 					     $('#otherNote').val(otherinfo);
 					     $('input[name="radioall"]').attr('disabled', true); 
 					    if(ratingid != 5009){
 				 			
 				 			$('#onboarded').prop('checked', true);
 				 			$('#notonboarded').prop('checked', false);
 				 			 var val = " - Onboarded";
 					    	 $("#ratingonboard").html(val);
 				 		}
 			
 				 
 				    
 					   
 					   //alert("LastCallDate"+LastCallDate);
 					    document.getElementById("reasonidString").value = reasonidString;
 					    document.getElementById("otherReasonID").value = OtherReason; 
 					   // document.getElementById("lastCallDateID").value = LastCallDate;
 					    $('#lastCallDateID').show();
 					    //  alert("if"+reasonidString);
 				    var select = document.getElementById("statusId");
 					 for(var i = 0;i < select.options.length;i++){
 					     if(select.options[i].value == ratingid  )
 					     {
 					         select.options[i].selected = true;
 					     }
 					 }	
 					 
//  					    $('#'+ratingid+'').prop('checked', true);
 					}
 					
 				 });
 				  			 
 			}
 	 
 	 });
 }
 	else{
 		//alert("getCurruntRatingnReason"+partnerParty)
 		 $.ajax({
 				
 				type : "POST", 
 				url :$('#contextPath').val()+"/dashboard/getCurruntRatingnReason.htm?partnerParty="+partnerParty,
 				//dataType: 'json',
 				contentType : 'application/json',
 				success : function(result) {
 					$(result).each(function(i, obj) {
 						
 					  //alert("success");
 						if(obj.ratingId == null){
 							//alert("If");
 							 return false;
 						}else{
 							//alert("else");
 					  ratingid= obj.ratingId;
 					    reasonidString = obj.reasonIdString;
 					    OtherReason = obj.otherReason;
 					   LastCallDate = obj.lastMonthDate;
 					   otherinfo = obj.extraNote;
//  					     alert(otherinfo);
 					     $('#otherNote').val(otherinfo);
 					    //alert("LastCallDate"+LastCallDate);
 					    document.getElementById("reasonidString").value = reasonidString;
 					    document.getElementById("otherReasonID").value = OtherReason;
 					    document.getElementById("lastCallDateID").value = LastCallDate;
 					    $('input[name="radioall"]').attr('disabled', true); 
//  					   alert("sss");
 					    if(ratingid != 5009){
 				 			//alert(ratingid)
 				 			$('#onboarded').prop('checked', true);
 				 			$('#notonboarded').prop('checked', false);
 				 			$('input[name="radioall"]').attr('disabled', false); 
 				 			$("#5009").prop('disabled', true);
 							var val = " - Onboarded";
 					    	 $("#ratingonboard").html(val);
 				 		}
 					    

 					    $('#'+ratingid+'').prop('checked', true);
 						 
 						}
 						
 					 });
 					  			 
 				}
 		 
 		 });
 		
 		 getreasonForRating(0);
 		
 	}
 	 
 	 
 }

 $('#notonboarded').click(function(event) {  //on click 
	 if(this.checked) { // check select status

				var roll = $('#rollId').val();
	 
				 if(roll == 1 || roll == 9){
//	 				 alert("Welcome Admin");
					 $('#notonboarded').prop('checked', true);
						$('#onboarded').prop('checked', false);
//	 					 $("#statusId2").children("option[value^=5009]").show();
						$('input[name="radioall"]').attr('disabled', true);
						$('#5009').prop('disabled', false);
						 $('#5009').prop('checked', true);
						/* var select = document.getElementById("statusId2");
						 select.options[8].selected = true; */
						// $('#statusId2').prop('disabled', true);
						 
						 getreasonForRating(1);
			}
			else{
//	 					alert("Already ONBOARDED, For update please contact to Admin");
						var message='Already ONBOARDED, For update please contact to Admin.';
  						var callback=false;
  						alertmessage(message,callback);
						
						//alert(" Already ONBOARDED, For update please contact to Admin");
						$('#notonboarded').prop('checked', false);
						$('#onboarded').prop('checked', true);
			}
	 }
	});


	$('#onboarded').click(function(event) {  //on click 
	     if(this.checked) { // check select status
//	     	 alert("Welcome onboard");
	  	   $('#notonboarded').prop('checked', false);
//	   	 $('#statusId2').prop('disabled', false); 
	$('input[name="radioall"]').attr('disabled', false);
	  	
		 
		 $('#5002').prop('checked', true);
		 $('#5009').prop('disabled', true);
		  //$("#statusId2").children("option[value^=5009]").hide();
		 getreasonForRating(1);
	    	 
	     }
	 });
	
	function check(){
		
//	 	alert("here");
		
		$('input[name="radioall"]').attr('disabled', true); 
		$('#onboarded').prop('disabled', true); 
		$('#notonboarded').prop('disabled', true); 
		$('#dndnote').hide();
	}
	function getreasonForRating(edit){
		var ratingID ;
		if(edit == 0){
			ratingID = $('#statusId').val();
			var ratingvalue= $('option:selected').html();
//	  		$("#ratingstatus").html('');
	 		//$("#otherReasontxtId").html(ratingvalue);
	 		
	 		
		}else{
		
		ratingID = $("input[name='radioall']:checked").val();
		

	 		
	 		if(ratingID == 5008 || ratingID == 5004){

			dndnote();			
	 		//alert("Once you select DND or NOT TO BE CONTACTED than it should not allow to be reversed back. Do you want to proceed");
			//$('.ZebraDialog_Button1').attr('href','javascript:check()');
			//$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
				
			}
	 		
		}
		 
		
			 var reasonIdString= document.getElementById("reasonidString").value;
			 
			 var OtherReasonID= document.getElementById("otherReasonID").value;
			 var LastCallDateID= document.getElementById("lastCallDateID").value;
			var str = reasonIdString;
			var arr = str.split(",");
			var b;
			var data=new Array();
			for(b=0;b<arr.length;b++)
			{
			    data[b]=arr[b];
			   // alert("hii"+data[b] );
			}

	 var i=0;
	 var arr =new Array();
		 $.ajax({
			
				type : "POST", 
				url :$('#contextPath').val()+"/dashboard/showReasonForRating.htm?ratingID="+ratingID,
				//dataType: 'json',
				contentType : 'application/json',
				success : function(result) {
					//alert("Hii"+result);
					
					var a=0;
					$("#partnerRating tr").detach();
					if(result != ''){
					
					 var column=document.createElement('tr'); 
					$(column).append("<th class='thead' width='5%'><input type='checkbox' id='selecctall1'  name='selecctall1'></th>")
	          	   			 .append("<th class='thead' width='21%'>Reason</th>")
	          	   			 .append("<th class='thead' width='15%'>Other</th>")
				  			.append("</tr>");
	            $("#partnerRating").append(column);
					}
					  $(result).each(function(i, obj) {
							a++;
						 var reason =obj.reason;
						 var id =obj.reasonId;
						
						 
								
						 arr[i]=id;
						
						// alert("id" +arr[i]);
					   if( reason == 'Not answering calls / email  from more than 1 month'){
						  var row=document.createElement('tr'); 
							 $(row).append("<td  style='background-color:#EEE;<span class='thead'><input type='checkbox' id='chk"+i+"' class='checkbox1' name='chkdeleteselect' value="+id+"> </td>")
				            	   .append("<td>"+ reason +"</td>")
				            	
				            	  .append("<td> <input type='text' name='lastMonthDate' id='lastMonthDateId' style='width: 150px;' disabled   readonly='true' placeholder='Enter Last call Date'></textarea> </td>")
				            	   
				            	   .append("</tr>");
		                      $("#partnerRating").append(row);
		                      var LastCallDateID1= document.getElementById("lastCallDateID").value;
		                      if(LastCallDateID1 == null)
		                    	  {
		                    	      $("#lastMonthDateId").val('');
		                    	  }
		                      else 
		                    	  {
		                    	  $("#lastMonthDateId").val(LastCallDateID1);  
		                    	  }
		                      
		                      
					  }else if(reason != 'Others'){
							 var row=document.createElement('tr'); 
							 $(row).append("<td  style='background-color:#EEE;<span class='thead'><input type='checkbox' id='chk"+i+"' class='checkbox1' name='chkdeleteselect' value="+id+"> </td>")
				            	   .append("<td>"+ reason +"</td>")
				            	    .append("<td>  </td>")
				            	   
				            	   .append("</tr>");
		                      $("#partnerRating").append(row);
		                      
		                      
						  }else{
						  var row=document.createElement('tr'); 
							 $(row).append("<td  style='background-color:#EEE;<span class='thead'><input type='checkbox' id='chk"+i+"' class='checkbox1' name='chkdeleteselect' value="+id+"> </td>")
				            	   .append("<td>"+ reason +"</td>")
				            	
				            	  .append("<td> <textarea class='form-control' rows='2' id='otherReasonId' name='text' maxlength='1000' width='50'  disabled></textarea> </td>")
				            	   
				            	   .append("</tr>");
		                      $("#partnerRating").append(row);
		                      if($('#statusId').val() == $("input[name='radioall']:checked").val() ){
		                      $("#otherReasonId").val(OtherReasonID);
		                      }
		                      }
	                      i++;
	                      
					 });
					  
					  
					  
					 
					  var slvals=a*72;
							  if(slvals == 0 || slvals <= 500)
								  {
								  $("#popUpAlertaddnote").css('height', 350);
								  }else{
							  $("#popUpAlertaddnote").css('height', slvals);
							  		}
						
						if(arr.length == data.length ){$('#selecctall1').prop('checked', true);}	  
					//for checked the current rating checkbox		  
					  for(var t=0;t<arr.length;t++)
						  {//alert("for "+t );
						  for(var y=0;y<data.length;y++)
							  {
							  if(arr[t]==data[y])  {
								  //alert("in"+t);
								  $('#chk'+t+'').prop('checked', true);
							  }
							  
							   if(data[y]==202013 || data[y]== 204013 )  {
									$('#otherReasonId').prop('disabled', false);  }
							  /*  else {$('#otherReasonId').prop('disabled', true);} */
								  
							  }
						  
						  }
					  
					
					  
					  $('#selecctall1').click(function(event) {  //on click 
				        if(this.checked) { // check select status
				        	$('.checkbox1').each(function() { //loop through each checkbox
				                this.checked = true;  //select all checkboxes with class   "checkbox1"               
				            });
				        
				        	 if(this.checked) {	
								  // alert('hg');
									$('#otherReasonId').prop('disabled', false);
									$('#lastMonthDateId').prop('disabled', false);
								}
									
								
				        }else{
				            $('.checkbox1').each(function() { //loop through each checkbox
				            	this.checked = false; //deselect all checkboxes with class "checkbox1"                       
				            });
				           
							$('#otherReasonId').prop('disabled', true);
							$('#lastMonthDateId').prop('disabled', true);
							$('#otherReasonId').val('');	
							$('#lastMonthDateId').val('');	
				        }
				    });
					  
					  $(".checkbox1").click(function () {
						   $("#selecctall1").prop('checked', ($('.checkbox1:checked').length == $('.checkbox1').length) ? true : false);   
						  
						   });
					  
					  if($("input[name='radioall']:checked").val() == 5001 ){
						 
						  if(document.getElementById("chk12").checked == true  ){	
								$('#otherReasonId').prop('disabled', false);
							}
							else{	$('#otherReasonId').prop('disabled', true);	}
							
						  $('#chk12').click(function() {
							if(document.getElementById("chk12").checked == true  ){	
								$('#otherReasonId').prop('disabled', false);
							}
							else{	$('#otherReasonId').prop('disabled', true);	$('#otherReasonId').val('');	}
							});
						  $("#selecctall1").prop('checked', ($('.checkbox1:checked').length == $('.checkbox1').length) ? true : false);
						  
						  
					  }else if($("input[name='radioall']:checked").val() == 5003) {
						 
						  $("#selecctall1").prop('checked', ($('.checkbox1:checked').length == $('.checkbox1').length) ? true : false); 
						  
						  if(document.getElementById("chk11").checked == true  ){	
								$('#lastMonthDateId').prop('disabled', false);
							}
							else{	$('#lastMonthDateId').prop('disabled', true);	}
						 
						  if(document.getElementById("chk12").checked == true  ){	
								$('#otherReasonId').prop('disabled', false);
							}
							else{	$('#otherReasonId').prop('disabled', true);	}
					  
						
						  $('#chk12').click(function() {
							
							if(document.getElementById("chk12").checked == true  ){	
								$('#otherReasonId').prop('disabled', false);
							}
							else{	$('#otherReasonId').prop('disabled', true);$('#otherReasonId').val('');	}
							});
					  }
					   
					   $('#chk11').click(function() {
							if(document.getElementById("chk11").checked == true  && $("input[name='radioall']:checked").val() == 5003 ){	
								$('#lastMonthDateId').prop('disabled', false);
							}
							else{	$('#lastMonthDateId').prop('disabled', true); $('#lastMonthDateId').val('');	}
							});
					   
					   $('#lastMonthDateId').datepicker({
					        changeMonth : true,
					        changeYear : true,
					        maxDate : '0',
					        yearRange : "1900:2200",
					        //dateFormat : "mm-dd-yy"
					        dateFormat : "yy-mm-dd"
					       }); 

					   
						       
				}
		 });
		 
		
	 }

  function alertmessage(message, callback){
	  if(callback==true){
			
			bootbox.dialog({
			  	message: "<span class='bigger-110'>"+message+"</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							location.reload();  
						}
					}
				}
			});
			  
	  }else{
	  bootbox.dialog({
		  	message: "<span class='bigger-110'>"+message+"</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
							
					}
				}
			}
		});
	  }
  }
 function ratingValidation(){
 	
 	var message='';
 	var callback=false;
 		//alert("hie"+$('#lastMonthDateId').val());
 		if( $("input[name='radioall']:checked").val() == 5003 && document.getElementById("chk11").checked == true   ){	
 			if($('#lastMonthDateId').val() == '')
 				{
 				 message='Last Call Date is required.';
 		 		 alertmessage(message,callback);
 					 //alert("Last Call Date is required.");
 					 $("#lastMonthDateId").focus();
 			         return false;
 				}
 			
 		}
 		
 		if(  $("input[name='radioall']:checked").val()== 5003 && document.getElementById("chk12").checked == true   ){	
 			if($('#otherReasonId').val()== '')
 				{
 		    		  message='Other Reason is required.';
	 		 		 alertmessage(message,callback);
 					// alert("Other Reason is required.");
 					 $("#otherReasonId").focus();
 			         return false;
 				}
 		}
 	
 		if($("input[name='radioall']:checked").val()== 5001  && document.getElementById("chk12").checked == true  ){	
 			if($('#otherReasonId').val() == '')
 				{
 				  message='Other Reason is required.';
 		 		 alertmessage(message,callback);
 					 $("#otherReasonId").focus();
 			         return false;
 				}
 		}
 	
 	return true;
 }


 function getselectedReason()
 { 
 	  var selectedlvals = [];
 	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
 		  selectedlvals.push($(this).val());
 	  });
 	 var rtid = $("input[name='radioall']:checked").val();
 	 //alert(selectedlvals);
 	if(rtid == 5001  ||  rtid == 5002 || rtid == 5003){
 	 if(selectedlvals == ""){
 		 var message='Please select at least one Reason for rating.';
 		var callback=false;
 		 alertmessage(message,callback);
 	 	 //alert('Please select at least one Reason for rating');
 	 //return;
  			 }else{
  				 if(rtid==5001 || rtid==5003){
  					 
  				  if(document.getElementById("chk12").checked == true){
  					var othersvalue=$('#otherReasonId').val();
  					if(othersvalue==''){
  						var message='Other reason is required.';
  						var callback=false;
  						 alertmessage(message,callback);
  						  						
  						}else{
  							  document.getElementById("confirmreason").value = selectedlvals;
    			  		 	  if(ratingValidation()==true){
    			  		 	  saveReasonsForRating();							
    			  		 	  							  }
    			  		 	  }
  				 
  				   				   			  
  		 	  }else{
  		 		  document.getElementById("confirmreason").value = selectedlvals;
    		 	  if(ratingValidation()==true){
    		 	  saveReasonsForRating();  		 		  
	  		 	  }
	  			 }
 	}else{
	  document.getElementById("confirmreason").value = selectedlvals;
 	  if(ratingValidation()==true){
 	  saveReasonsForRating();  		
 								  }
 		 }
 }
 	}else{
 		 document.getElementById("confirmreason").value = selectedlvals;
 	 	  if(ratingValidation()==true){
 	 	  saveReasonsForRating();  		
 	}
 	}
}

 
 function saveReasonsForRating(){
		
		var ratingID = $("input[name='radioall']:checked").val();
			var ratingvalue= $('option:selected').html();
	 		$("#ratingstatus").html(ratingvalue);
	 		
	 		  var reasonIdString= document.getElementById("confirmreason").value;
	 		 
	 		var partnerParty = document.getElementById("partnerParty").value;
	 		var otherReason = $('#otherReasonId').val();
	 		var lastMonthDate =  $('#lastMonthDateId').val();
	 		var othernote =  $('#otherNote').val();
	 		 if(lastMonthDate == undefined ){
	 		lastMonthDate= '1900-01-01' ;
	 		} else{
	 			
	 			var dt = lastMonthDate.split("-");
	 			var day = dt[2];
	 			var mn = dt[1];
	 			var yr = dt[0];
	 			lastMonthDate = mn+"-"+day+"-"+yr;
	 		}
	 		
		 $.ajax({
			
				type : "POST", 
				url :$('#contextPath').val()+"/dashboard/saveReasonsForRating.htm?ratingID="+ratingID+"&reasonIdString="+reasonIdString+"&partnerParty="+partnerParty+"&otherReason="+otherReason+"&lastMonthDate="+lastMonthDate+"&othernote="+othernote+"&ratingvalue="+ratingvalue,
				//dataType: 'json',
				contentType : 'application/json',
				success : function(result) {
					var message='Rating Assigned Successfully.';
					var callback=true;
					alertmessage(message,callback);
					/* bootbox.dialog({
					  	message: "<span class='bigger-110'>Rating Assigned Successfully.</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {
									location.reload();
								}
							}
						}
					});	 */
					 // alert("Rating Assigned Successfully");
					  //location.reload();	
				}
		 });
	 }



 function saveReasonsForRating(){
		
		var ratingID = $("input[name='radioall']:checked").val();
			var ratingvalue= $('option:selected').html();
	 		$("#ratingstatus").html(ratingvalue);
	 		
	 		  var reasonIdString= document.getElementById("confirmreason").value;
	 		var partnerParty = document.getElementById("partnerParty").value;
	 		var otherReason = $('#otherReasonId').val();
	 		var lastMonthDate =  $('#lastMonthDateId').val();
	 		var othernote =  $('#otherNote').val();
	 		 if(lastMonthDate == undefined ){
	 		lastMonthDate= '1900-01-01' ;
	 		} else{
	 			
	 			var dt = lastMonthDate.split("-");
	 			var day = dt[2];
	 			var mn = dt[1];
	 			var yr = dt[0];
	 			lastMonthDate = mn+"-"+day+"-"+yr;
	 		}
	 		
		 $.ajax({
			
				type : "POST", 
				url :$('#contextPath').val()+"/dashboard/saveReasonsForRating.htm?ratingID="+ratingID+"&reasonIdString="+reasonIdString+"&partnerParty="+partnerParty+"&otherReason="+otherReason+"&lastMonthDate="+lastMonthDate+"&othernote="+othernote+"&ratingvalue="+ratingvalue,
				//dataType: 'json',
				contentType : 'application/json',
				success : function(result) {
					var message='Rating Assigned Successfully.';
					var callback=true;
					alertmessage(message,callback);
					
				}
		 });
	 }



 function showRatingHistory()
 {
 		var partnerParty = document.getElementById("partnerParty").value;
 		var a=0;
 		$.ajax({
 	
 		type : "POST", 
 		url :$('#contextPath').val()+"/dashboard/showRatingHistory.htm?partnerParty="+partnerParty,
 		//dataType: 'json',
 		contentType : 'application/json',
 		success : function(result) {
 			
 			  
 			  $(result).each(function(i, obj) {
 					a++;
 				// alert("Rating History"+obj.ratingvalue);
 				 var Rating = obj.ratingvalue;
 				 var LastModifiedby =obj.lastModifiedby;
 				 var LastmodifiedDate =obj.lastmodifiedDate;
 				var HistoryReasons = obj.historyReasons;
 				 var row=document.createElement('tr'); 
 				  $(row).append("<td>"+ Rating +"</td>")	
 				 		.append("<td>"+ LastModifiedby +"</td>")	   
 				 		.append("<td>"+ LastmodifiedDate +"</td>")
 				 		.append("<td>"+ HistoryReasons +"</td>")
 	            	   .append("</tr>");
                 $("#partnerRatingHistory").append(row);
                
                 
 			 });
 			  
 		}
 		 
 	
 		
  });
 		 /* var slvals=a*140;
 		  if(slvals == 0 || slvals <= 250)
 			  {
 			  $("#popUpAlertaddnote").css('height', 650);
 			  }else{
 		  $("#popUpAlertaddnote").css('height', slvals);
 		  		} */
 	
 	}
 function ViewStatus(ids)
 {
	 $('#statusId2').empty();
 	   	$.ajax({ 				
 	   		  type: "POST",
 	   		  url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=5',
 	   		  dataType: 'json',
 			  contentType: 'application/json',
 			  success:function(result)
 	   		  { 
 						    if(ids==0){ 	
 						      	ids=5009;
 						    	var id = '#statusId';
 						       	 $('#statusId').empty();
 						        	
 						     
 						       	$(result).each(function(i, obj) {
 						          var module=obj.codeValue;
 							        var modulename=obj.codeValueId;
 							    if(ids == modulename)
 								    {
 							      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
//  							    	 $(id).append('<input type="checkbox" class="pinToggles" checked name="module" value="'+modulename+'"/>'+module+'');
 							      	} else{
 							      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
//  							      		 $(id).append('<input type="checkbox" class="pinToggles" name="module" value="'+modulename+'"/>'+module+'');
 							      	}
 							        	
 								 //  $('#common_popup_div,#shadow_div_web_app').remove();
 								   });
 								   var val = " - Not-Onboarded";
 					    	 $("#ratingonboard").html(val);
 						       	getCurruntRatingnReason(0);
 						   
 						    }else{
 						    	ids=5009;
 						    	var id2 = '#statusId2';
 						       	// $('#statusId2').empty();
 						       	$('#notonboarded').prop('checked', true);
 						    	$('#onboarded').prop('checked', false);
 						       	$(result).each(function(i, obj) {
 						          var module=obj.codeValue;
 							        var modulename=obj.codeValueId;
 							    if(ids == modulename)
 								    {
 							      		//$(id2).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
 							      		$(id2).append('<input type="radio" class="pinToggles" checked name="radioall" id="'+modulename+'" value="'+modulename+'"/>'+module+'&nbsp;&nbsp;&nbsp;');
 							      		
 							      	} else{
 							      		//$(id2).append('<option value="'+ modulename+'">'+ module + '</option>');
 							      		 $(id2).append('<input type="radio" class="pinToggles" name="radioall" id="'+modulename+'" value="'+modulename+'"/>'+module+'&nbsp;&nbsp;&nbsp;');
 							      	}
 							        	
 								 //  $('#common_popup_div,#shadow_div_web_app').remove();
 								   });
 						        $('input[name="radioall"]').attr('disabled', true); 
 						        $('#5009').attr('disabled', false); 
 						       	getCurruntRatingnReason(1);
 						    }
 						
 	   		  }
 	   	
 	   	});
 	  
 	   	
 	   
 }



 $(document).ready(function() {
 	 //openPopupWebApp('centerLoadingImage', 25, 35);
 		 ViewStatus(0);
 		 $('#SPPartnerLink').addClass("active");
 		 
 		 
 		 
 	 });
 $('#menu-wplook-sub-menu2').addClass('active');
 </script>	
</html>