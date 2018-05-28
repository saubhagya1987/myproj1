<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Biz Unit List</title>






<script type="text/javascript">

function getClear()
{
	
	$('#success-msg').val('');
	$('#success-msg').empty();
}

function saveBu(isclose)
{
$('#istoClose').val(isclose);
	$.validator.addMethod("alphaNumeric", function (value, element) {
	    return this.optional(element) || /^[ 0-9a-zA-Z]+$/.test(value);
	}, " Only letters allowed.");

	
	$.validator.addMethod("alphaNumeric1", function (value, element) {
	    return this.optional(element) || /^[()/ ,.0-9a-zA-Z]+$/.test(value);
	}, "Special character not allowed.");
	
	var validator=$('#addform').validate({
		errorElement: 'div',
		errorClass: 'help-block',
		focusInvalid: false,
		ignore: "",
		 icon: {
		valid: 'glyphicon glyphicon-ok',
		invalid: 'glyphicon glyphicon-remove',
		validating: 'glyphicon glyphicon-refresh'
		},
		rules: {
			lastName: {
				required:true,
				alphaNumeric:true
				//alphanumeric: true
				
		},
		
		companyName: {
			required:true,
			alphaNumeric:true
			
	},
	
				shortName: {
					required:true,
					alphaNumeric:true
					
			},
			street: {
				required:true,
				alphaNumeric1:true
				
			},
			street3: {
				
				alphaNumeric1:true
				
			},
			street2: {
				
				alphaNumeric1:true
				
			},
			zipCode: {
				required:true,
				number: true,
				maxlength:6,
				minlength:6,
			}
						
						
			
		},

		messages: {
			lastName: {
				required: "Please enter BU name."				
			},
			companyName: {
				required: "Please enter company name."				
			},
			shortName: {
				required: "Please enter short name."				
			},
			street:{
				required: "Please enter address."
			},
			
			zipCode:{
				required: "Please enter zipcode."
			}
			
			
			
			
		},


		highlight: function (e) {
			$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
		},

		success: function (e) {
			$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
			$(e).remove();
		},

		errorPlacement: function (error, element) {
			if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
				var controls = element.closest('div[class*="col-"]');
				if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
				else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
			}
			else if(element.is('.select2')) {
				error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
			}
			else if(element.is('.chosen-select')) {
				error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
			}
			else error.insertAfter(element.parent());
		},

		submitHandler: function (form) {
			
			if(validator.form()){

			 	$.ajax({
					type :'POST',  
					

					data:$('#addform').serialize(),
					url : $('#contextPath').val() +"/bizunit/addBizUnit.htm",
			    
			    		 
							success : function(result) 
							{
								
								var isclose1=$('#istoClose').val();
								
								   if(isclose1==1){
									   bootbox.dialog({
											message: "<span class='bigger-110'>Biz Unit saved successfully.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
														 location.reload();
														 //resetval();
													}
												}
											}
										});
									   
									   
						              }else{
						            	  

						            	  $('#success-msg').empty();	
										  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Biz Unit saved successfully.</p></div>');
										  resetVal();
						            	  addNote();
							              //popup('popUpAlertaddnote').show();
							             
						              }
								 
								
					}
				});
			}
		},
		invalidHandler: function (form) {
			
		}
	});
	
}



function newBu()
{
	//alert("yes");
	getCountry();
	addNote();
	//popup('popUpAlertaddnote');
	
	}
	function getEditUniqueBu()
	{
		
		if($('#editBizUnitName').val().trim()==""||$('#editBizUnitName').val()==$('#oldname').val())
			{
			
			}
				else
			{
		$.ajax(
	   			{ 				
	   		  type: "POST",
	   		  url:$('#contextPath').val()+'/bizunit/getUniqueBizUnit.htm?addBizName='+$('#editBizUnitName').val(),	
	   	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			//  alert(result);
				   			if(result==1)
				   				{
				   				//alert('BizUnit Already Exist');
				   			
				   				bootbox.dialog({
				   				  	message: "<span class='bigger-110'>BizUnit Already Exist.</span>",
				   					buttons: 			
				   					{
				   						"click" :
				   						{
				   							"label" : "OK!",
				   							"className" : "btn-sm btn-primary",
				   							"callback": function() {
				   				//				location.reload();
				   							}
				   						}
				   					}
				   				});
				   				
				   				$('#editBizUnitName').val($('#oldname').val());
				   				$('#editBizUnitName').focus();
				   				}

						
	   		  }
	   	
	   	});
			}
	}
	function getUniqueBizUnit()
	{
	
	if($('#addBizName').val().trim()=="")
		{
		
		}

	else
		{
	$.ajax(
	   			{ 				
	   		  type: "POST",
	   		  url:$('#contextPath').val()+'/bizunit/getUniqueBizUnit.htm?addBizName='+$('#addBizName').val(),	
	   	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			if(result==1)
				   				{
				   				//alert('BizUnit already exit');
				   				
				   				
				   				bootbox.dialog({
				   				  	message: "<span class='bigger-110'>BizUnit Already Exist.</span>",
				   					buttons: 			
				   					{
				   						"click" :
				   						{
				   							"label" : "OK!",
				   							"className" : "btn-sm btn-primary",
				   							"callback": function() {
				   				//				location.reload();
				   							}
				   						}
				   					}
				   				});
				   				$('#addBizName').val('');
				   				$('#addBizName').focus();
				   				}

						
	   		  }
	   	
	   	});
	}
	}
function pagesizeurl(){
	  var pageSize=$('#page').val(); 
	   window.location.href= $('#contextPath').val()+'/bizunit/loadBizUnitList.htm?pageSize='+pageSize;
	 }

	function getStateName(ids)
{

		
		var con=$('#editCountry').val();
		if(con==null)
			{
			con=3001;
			}
	$.ajax(
   			{ 				
   		  type: "POST",
   		  url:$('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+con,	
   	   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			$('#editState').empty();	   			
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										var modulename=obj.codeValue;
										  if(ids == module)
										    {
									      		$('#editState').append('<option value="'+ module+'" selected="selected">'+ modulename + '</option>');
									      	} else{
									      		$('#editState').append('<option value="'+ module+'">'+ modulename + '</option>');	
									      	}
										
									});	
							//getCityName();

					
   		  }
   	
   	});

}
	
	function reload()
	{
		  location.reload();
	}
	
	function copyBu(partyId,name)
	{
	//	alert("yes");
		document.getElementById("partyIdss").value=partyId;
		$('#mmm').html(name);
		$('#mmm1').html(name);
		
		SetDefault();
		//popup('popUpAlertaddnote');
	}

	function copyBuYes()
	{
		$.ajax(
	   			{ 				
	   		  type: "POST",
	   		  url: $('#contextPath').val()+'/bizunit/copyBu.htm?partyId='+$('#partyIdss').val(),	
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			  alert('Copy Biz Unit Successfully');
				   			  location.reload();
	   		  }
	   		   	
	   		   	});
	   			
		
		
	}
	
	
	
function getCityName(stateid,cityid)
{
	$.ajax(
   			{ 				
   		  type: "POST",
   		  url: $('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+stateid,	
   		
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   		
							$('#editCity').empty();
						
								
				
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										var modulename=obj.codeValue;
										if(cityid == module){
											$('#editCity').append('<option value="'+ module+'" selected="selected">'+ modulename + '</option>');
										} else{
											$('#editCity').append('<option value="'+ module+'">'+ modulename + '</option>');
										}
										
									});					

					
   		  }
   	
   	});
	
}



function deleteBizUnit()
{ 
	  var slvals = []
	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
	  slvals.push($(this).val());
	  })
	
	  
	 document.getElementById("confirmdelete").value = slvals;
	  if(slvals<=0)
		  {
		  //alert('Please Select at Least One Record.');
		  
		  bootbox.dialog({
			  	message: "<span class='bigger-110'>Please select at least one Record.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
			//				location.reload();
						}
					}
				}
			});
		  
		 // location.reload();
		 // popup('popUpAlertaddnote');
		  }
	  else
		  {
		 // alert("yes");
		  deleteNote();  
		  }
	  
};


	 function confirmDelete()
	{
		 $('#deletenote').hide();
		 var slvals= document.getElementById("confirmdelete").value;
		   	  $.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/bizunit/deleteBizUnit.htm?Lists="+slvals,
		
	  success : function(result) 
	  {	  
		 
		  
		   bootbox.dialog({
				message: "<span class='bigger-110'>Biz unit deleted successfully.</span>",
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
		  
		 	  //alert('Biz unit deleted successfully.');
		  		 			
	  }
	     
	  }); 
	}



	
	function getCounrtyName(ids)
{
  	$.ajax(
   			{ 				
   		  type: "POST",
   		  	url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=3',
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   		
			   			$('#editCountry').empty();
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										var modulename=obj.codeValue;
						if(ids==module)
							{
							$('#editCountry').append('<option value="'+ module+'"  selected="selected">'+ modulename + '</option>');
							}
						else
							{
							$('#editCountry').append('<option value="'+ module+'">'+ modulename + '</option>');
							}
							
										
									});					
							//getStateName(0);
   		  }
   	});
}

	
	
function getCountry()
{
	
  	$.ajax(
   			{ 				
   		  type: "POST",
   		  url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=3',
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   		
			   			$('#addBizConutry').empty();							
							$(result).each(
									function(i, obj) {
										
										
										
								        var module=obj.codeValue;
								        var modulename=obj.codeValueId;
										
										$('#addBizConutry').append('<option value="'+ modulename+'">'+ module + '</option>');
										
									});
					
							getState();
   		  }
   	});
}



function editBizUnit(partyId,name)
{

	document.getElementById("oldname").value = name;
	
$('#editpartyId').val(partyId);
	$.ajax(
   			{ 				
   		  type: "POST",
   		
   		  url: $('#contextPath').val()+'/bizunit/getBizUnitDetail.htm?partyId='+partyId,	
   				  dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			$(result).each(function(i, obj) {
			
			   		
			   			
			   			   
			   			    var  lastName=obj.lastName;
			   				var  partyId=obj.partyId;
			   				var  companyName=obj.companyName;
			   				var  emailId=obj.emailId;
			   				var  commName=obj.commName;
			   				var  updateon=obj.updateon;
			   				var  shortName=obj.shortName;
			   		
			   				var  city=obj.city;
			   				var  state=obj.state;
			   				var  country=obj.country;
			   				var  stateId=obj.stateId;
			   				var  cityId=obj.cityId;
			   				var  countryId=obj.countryId;
			   				var  street=obj.street;
			   				var  street2=obj.street2;
			   				var  street3=obj.street3;
			   				var  zipCode=obj.zipCode;
			   				var  twitter=obj.twitter;
			   				
			   				$('#editZipCode').val(zipCode);
			   				($('#editBizUnitName').val(lastName));
			   				($('#editShortName').val(shortName));
			   				($('#editCompanyName').val(companyName));
			   				($('#editAddress1').val(street));
			   				($('#editAddress2').val(street2));
			   				($('#editAddress3').val(street3)); 
			   				$('#edittwitter').val(twitter);
			   				
			   			
			   				
		  					if(countryId==undefined)
	   						{
	   						getCounrtyName(0);
	   						}
	   					else
	   						{
	   						getCounrtyName(countryId);
	   						}
	   					if(stateId==undefined)
   						{
                             getStateName(0);
                             stateId=0;
   						}
   					else
   						{
   						getStateName(stateId);
   						}
	   					
	   					if(cityId==undefined)
   						{
	   					 getCityName(stateId,0);
   						}
   					else
   						{
   						$('#editState').val(stateId);
	   					 $('#editCity').val(cityId);
	   					 
	   					 getCityName(stateId,cityId);
	   					 
   						}
	
							  //popup('popUpAlertaddnote');
						editNote();
							
							
								
							
									 	

						});
   		  }
   	
   	});
	
	
	
}

function validtwitter(data) 
{
	     var filter =/^@[A-Za-z0-9_]{1,15}$/;
	    if (filter.test(data)) 
	    {
	    
	        return true;
	    }
	    else 
	    {
	    
	        return false;
	    }
}




function updateBizUnit()
{


	
	
	


	$.validator.addMethod("alphaNumeric", function (value, element) {
	    return this.optional(element) || /^[ 0-9a-zA-Z]+$/.test(value);
	}, " Only letters allowed.");

	
	$.validator.addMethod("alphaNumeric1", function (value, element) {
	    return this.optional(element) || /^[()/ ,.0-9a-zA-Z]+$/.test(value);
	}, "Special character not allowed.");
	
	var validator=$('#editForm').validate({
		errorElement: 'div',
		errorClass: 'help-block',
		focusInvalid: false,
		ignore: "",
		 icon: {
		valid: 'glyphicon glyphicon-ok',
		invalid: 'glyphicon glyphicon-remove',
		validating: 'glyphicon glyphicon-refresh'
		},
		rules: {
			lastName: {
				required:true,
				alphaNumeric:true
				//alphanumeric: true
				
		},
		
		companyName: {
			required:true,
			alphaNumeric:true
			
	},
	
				shortName: {
					required:true,
					alphaNumeric:true
					
			},
			street: {
				required:true,
				alphaNumeric1:true
				
			},
			
			street2: {
			
				alphaNumeric1:true
				
			},
			street3: {
			
				alphaNumeric1:true
				
			},
			
			
			zipCode: {
				required:true,
				number: true,
				maxlength:6,
				minlength:6,
			}
						
						
			
		},

		messages: {
			lastName: {
				required: "Please enter BU name."				
			},
			companyName: {
				required: "Please enter company name."				
			},
			shortName: {
				required: "Please enter short name."				
			},
			street:{
				required: "Please enter address."
			},
			
			zipCode:{
				required: "Please enter zipcode."
			}
			
			
			
			
		},


		highlight: function (e) {
			$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
		},

		success: function (e) {
			$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
			$(e).remove();
		},

		errorPlacement: function (error, element) {
			if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
				var controls = element.closest('div[class*="col-"]');
				if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
				else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
			}
			else if(element.is('.select2')) {
				error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
			}
			else if(element.is('.chosen-select')) {
				error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
			}
			else error.insertAfter(element.parent());
		},

		submitHandler: function (form) {
			
			if(validator.form()){
				
				
			 	$.ajax({
					type :'POST',  

					data:$('#editForm').serialize(),
					 url: $('#contextPath').val()+'/bizunit/updateBizUnit.htm',
			  
			          				success : function(result)
							{
					
			          				   bootbox.dialog({
											message: "<span class='bigger-110'>Biz Unit updated successfully.</span>",
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
			          					
					}
				});
			}
		},
		invalidHandler: function (form) {
			
		}
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



}


function getState()
{

	$.ajax(
   			{ 				
   		  type: "POST",
   		  url:$('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+$('#addBizConutry').val(),	
   	   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
										
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										var modulename=obj.codeValue;
										
										$('#addBizState').append('<option value="'+ module+'">'+ modulename + '</option>');
									});	
							getCity();

					
   		  }
   	
   	});

}
function getCity()
{

	$.ajax(
   			{ 				
   		  type: "POST",
   		  url: $('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+$('#addBizState').val(),	
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   		
							$('#addBizCity').empty();
						
							
				
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										var modulename=obj.codeValue;
										$('#addBizCity').append('<option value="'+ module+'">'+ modulename + '</option>');
										$('#shadow_div_web_app').hide();
									});					

   		  }
   	
   	});
	
}

function resetVal()
{
	$('#addBizName').val('');
	$('#addBizCompany').val('');
	$('#addBizAdd1').val('');
	$('#addBizAdd2').val('');
	$('#addBizAdd3').val('');
	$('#addBizConutry').val('');
	$('#addBizState').val('');
	$('#addBizCity').val('');
	$('#addBizZipcode').val('');
	$('#addBizShort').val('');

	$('#addtwitter').val('');
	
	
	//$('#addBizConutry').focus('');
	
	
	getCountry();
}
function editValidation()
{
	var myLength = $("#editZipCode").val().length;
	var abc= $("#editZipCode").val();
	var twiterlen=$("#edittwitter").val().length; 
	  if ( $('#editBizUnitName').val().trim()=="") 
	  {
			 alert("Please Enter Biz Unit Name.");
			 $('#addBizName').val('');
			 $('#addBizName').focus();
	         return false;
	     } 
	  if ( $('#editShortName').val().trim()=="") 
	  {
			 alert("Please  Enter Short Name.");
			 $('#editShortName').val('');
			 $('#editShortName').focus();
	         return false;
	     } 
	  if ( $('#editCompanyName').val().trim()=="") 
	  {
			 alert("Please Enter Company Name.");
			 $('#editCompanyName').val('');
			 $('#editCompanyName').focus();
	         return false;
	     } 
	  if ( $('#editAddress1').val().trim()=="") 
	  {
			 alert("Please Enter Address.");
			 $('#editAddress').val('');
			 $('#editAddress').focus();
	         return false;
	     } 

	  if ( $('#editZipCode').val().trim()=="") 
	  {
			 alert("Please Enter Zipcode.");
			 $('#editZipCode').val('');
			 $('#editZipCode').focus();
	         return false;
	     } 
	  
	  
	  if (isNaN(abc)) 
	  {
		 
			 alert("Please Enter Numeric Value in zipcode.");
			 $('#editZipCode').val('');
			 $('#editZipCode').focus();
	         return false;
	     } 
	  
	  if (myLength!=6) 
	  {
			 alert("Please Enter Valid Zipcode");
			 $('#editZipCode').val('');
			 $('#editZipCode').focus();
	         return false;
	     } 
	  if(twiterlen>0)
		  {
		  if(twiterlen>15)
		  {

				 alert("Please Enter twitter link 20 charater ");
				 $('#edittwitter').val('');
				 $('#edittwitter').focus();
		         return false;  
		  }
			if(validtwitter($("#edittwitter").val())==false)
			{
			alert("Please Enter Valid Twitterlink.");
			 $('#edittwitter').val('');
			 $('#edittwitter').focus();
	        return false;
			}
		  return true;
		  }
	  
	  
return true;
}
function addValidation()
{
	var myLength = $("#addBizZipcode").val().length;
	var abc=$("#addBizZipcode").val();
	var twiterlen=$("#addtwitter").val().length; 
	  if ( $('#addBizName').val().trim()=="") 
	  {
			 alert("Please Enter BizUnit Name.");
			 $('#addBizName').val('');
			 $('#addBizName').focus();
	         return false;
	     } 
	  if ( $('#addBizShort').val().trim()=="") 
	  {
			 alert("Please Enter Shortname.");
			 $('#addBizShort').val('');
			 $('#addBizShort').focus();
	         return false;
	     } 
	  if ( $('#addBizCompany').val().trim()=="") 
	  {
			 alert("Please Enter Company Name.");
			 $('#addBizCompany').val('');
			 $('#addBizCompany').focus();
	         return false;
	     }
	  if ( $('#addBizAdd1').val().trim()=="") 
	  {
			 alert("Please Enter Address.");
			 $('#addBizAdd1').val('');
			 $('#addBizAdd1').focus();
			 return false;
	     } 
 
 
	  if ( $('#addBizZipcode').val().trim()=="") 
	  {
			 alert("Please Enter  Zipcode.");
			 $('#addBizZipcode').val('');
			 $('#addBizZipcode').focus();
	         return false;
	     } 
	  if (isNaN(abc)) 
	  {
		 
			 alert("Please Enter Numeric Value in zipcode.");
			 $('#addBizZipcode').val('');
			 $('#addBizZipcode').focus();
	         return false;
	     } 
	  

	  if (myLength!=6) 
	  {
			 alert("Enter Enter Valid Zipcode.");
			 $('#addBizZipcode').val('');
			 $('#addBizZipcode').focus();
	         return false;
	     } 
	  
	  if(twiterlen>0)
		  {
		  if(twiterlen>15)
			  {
			  alert("Please enter Twitter Link only 15. character.");
				 $('#addtwitter').val('');
				 $('#addtwitter').focus();
		         return false; 
			  }
		  
			if(validtwitter($("#addtwitter").val())==false)
			{
			alert("Please Enter Valid Twitterlink.");
			 $('#addtwitter').val('');
			 $('#addtwitter').focus();
	        return false;
			}
		  return true;
		  }
	  
	  return true;
}




function doAdd(isclose)
{
	if(addValidation()==true)
	{

 	$.ajax({
		type :'POST',  
		

		data:$('#addform').serialize(),
		url : $('#contextPath').val() +"/bizunit/addBizUnit.htm",
    
    		 
				success : function(result) 
				{
					
					   if(isclose==1){
						   bootbox.dialog({
								message: "<span class='bigger-110'>Biz Unit saved successfully.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 location.reload();
											// resetval();
										}
									}
								}
							});
						   
						   
			              }else{
			            	  

			            	  $('#success-msg').empty();	
							  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Biz Unit saved successfully.</p></div>');
							  resetVal();
							  getCountry();
			            	  addNote();
				              //popup('popUpAlertaddnote').show();
				             
			              }
					 
					
		}
	});
}

}



</script>


<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">
</head>
<body>
	<jsp:include page="../common/common_popup.jsp" />
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<input type="hidden" name="partyIdss" id="partyIdss">
	<input type="hidden" id="buId" value="${sessionScope.userSession.buId}" />
	<input type="hidden" name="confirmdelete" id="confirmdelete">
	<input type="hidden" name="oldname" id="oldname">
	<input type="hidden" name="istoClose" id="istoClose">
	
	<!--css popup window start 1-->
	
	<%-- <div style="display: none; width: 450px; height: 380px; top: 100px"
		id="popUpDiv">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpDiv')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>

		<div id="popupwrapper_contactform">

			<div class="heading_contactform">
				<h3>Log Trouble Ticket</h3>
			</div>
			<div id="poptable_contactform">

				<div class="full">
					<input type="text" class="form-control" placeholder="Subject">
				</div>
				<div class="full">
					<textarea class="form-control" rows="3" placeholder="Your Question"
						style="height: 100px;"></textarea>
				</div>
				<div class="full">
					<input type="text" class="form-control" placeholder="Attach File">

				</div>
			</div>
			<div class="topbuttonholder">
				<form>
					<input class="dbtn" value="Send Email" id="loginButton"
						type="button"> <input class="dbtn" value="Cancel"
						onClick="popup('popUpDiv')" id="loginButton" type="button">
				</form>
			</div>

		</div>
	</div> --%>
	
	<!--css popup window 1 close-->
	
	
	
	
	
	<!--css popup window start 2-->
	
	
				<div class="page-header">
							<h1 class="pull-left">Biz Unit List</h1>
                       	    <div class="clearfix"></div>
                         </div>
	
		
		<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 		<div class="modal-dialog">
    	<div class="modal-content">
    		<form id="addform" class="form-horizontal" >
        <div class="modal-header">
        	<button type="button" class="close" onclick="location.reload()" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add BU</h4>
      	</div>
      	
      	<div id="success-msg"></div>
      		<div class="modal-body">
      		
					
							
      		
      		
      				
           			<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Biz Unit<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Biz Unit"  id="addBizName" name="lastName"  onfocus="getClear()" onblur="getUniqueBizUnit()" >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>

<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Short Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Short Name"  id="addBizShort" name="shortName"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Company Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Company Name"  id="addBizCompany" name="companyName"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>



					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Address <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Address"  id="addBizAdd1" name="street"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email"> </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6"  id="addBizAdd2" name="street2"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
							
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email"> </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6"   id="addBizAdd3" name="street3"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>

	
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Country <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<select name="countryId" id="addBizConutry" class="input-xxlarge"	onfocus="getCountry()" onchange="getState()" style="width: 300px; float: left;"></select>
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
						
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">State <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								
								
		                	
		                	<select	name="stateId" id="addBizState" class="input-xxlarge"	onfocus="getState()" onchange="	getCity();"	style="width: 300px; float: left;"></select>
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
						
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">City <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<select	name="cityId" id="addBizCity" class="input-xxlarge"	 	style="width: 300px; float: left;"></select>
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Zipcode <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6"  id="addBizZipcode" name="zipCode"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Twitter Link </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
																				   
								<input type="text" class="col-xs-12 col-sm-6"  id="addtwitter" name="twitter"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>

				</div><!-- modal body end -->
					
					<div class="modal-footer">
						    		<button  class="btn btn-sm btn-primary" onClick="saveBu(0);"><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button  class="btn btn-sm btn-primary" onClick="saveBu(1);"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
                    			<button  class="btn btn-sm btn-danger" onClick="reload();"><i class='fa fa-times'></i>Cancel</button> 
					</div>
					</form>
			</div>
		</div>
			</div>	
           					
           			<!-- 			 				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizName">Biz Unit<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="lastname" id="addBizName"  placeholder="Biz Unit "  onblur="getUniqueBizUnit()" class="input-xxlarge"/>
		                   <div id="addBizName_error" class="help-block hide">Please provide a valid Biz Unit Name.</div>
		                </div> 
		              </div>  
           			</div>
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizShort">Short Name <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="shortName" id="addBizShort"  placeholder="Short Name "   class="input-xxlarge"/>
		                   <div id="addBizShort_error" class="help-block hide">Please provide a valid Biz Unit Short Name.</div>
		                </div> 
		              </div>  
           			</div>	
           			
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizCompany">Company Name<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="companyName" id="addBizCompany"  placeholder="Company Name "   class="input-xxlarge"/>
		                   <div id="addBizCompany_error" class="help-block hide">Please provide a valid Company Name.</div>
		                </div> 
		              </div>  
           			</div>
						
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizAdd1">Address<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="street" id="addBizAdd1"  placeholder="Company Name "   class="input-xxlarge"/>
		                   <div id="addBizAdd1_error" class="help-block hide">Please provide a valid Address.</div>
		                </div> 
		              </div>  
           			</div>
						
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizAdd2"></label>
		                <div class="col-sm-9">
		                  <input type="text" name="street2" id="addBizAdd2"  placeholder=""   class="input-xxlarge"/>
		                   <div id="addBizAdd2_error" class="help-block hide">Please provide a valid Address.</div>
		                </div> 
		              </div>  
           			</div>
			
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizAdd3"></label>
		                <div class="col-sm-9">
		                  <input type="text" name="street3" id="addBizAdd3"  placeholder=""   class="input-xxlarge"/>
		                   <div id="addBizAdd3_error" class="help-block hide">Please provide a valid Address.</div>
		                </div> 
		              </div>  
           			</div>
			
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizConutry">Country<span class="red">*</span></label>
		                <div class="col-sm-9">
		                	<select name="countryId" id="addBizConutry" class="input-xxlarge"	onfocus="getCountry()" onchange="getState()" style="width: 300px; float: left;"></select>
		                	<select	name="stateId" id="addBizState" class="input-xxlarge"	onfocus="getState()" onchange="	getCity();"	style="width: 300px; float: left;"></select>
		                    <div id="addBizConutry_error" class="help-block hide">Please Select Counrty .</div>
		                </div> 
		              </div>  
           			</div>
				
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		               	<label class="col-sm-3 control-label no-padding-right" for="addBizState">State<span class="red">*</span></label>
		                	<div class="col-sm-9">
		                		<select	name="stateId" id="addBizState" class="input-xxlarge"	onfocus="getState()" onchange="	getCity();"	style="width: 300px; float: left;"></select>
		                    	<div id="addBizState_error" class="help-block hide">Please Select State .</div>
		                	</div> 
		              </div>  
           			</div>
					
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizCity">City<span class="red">*</span></label>
		                <div class="col-sm-9">
							<select	name="cityId" id="addBizCity" class="input-xxlarge"	 	style="width: 300px; float: left;"></select>
		                    <div id="addBizCity_error" class="help-block hide">Please Select State .</div>
		                </div> 
		              </div>  
           			</div>
					
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addBizZipcode">Zip Code<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="zipCode" id="addBizZipcode"    class="input-xxlarge"/>
		                   <div id="addBizZipcode_error" class="help-block hide">Please provide a valid zipcode.</div>
		                </div> 
		              </div>  
           			</div>
					
						
					<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addtwitter">Twitter Link</label>
		                <div class="col-sm-9">
		                   <input type="text" name="twitter" id="addtwitter"    class="input-xxlarge"/>
		                   <div id="addtwitter_error" class="help-block hide">Please provide a valid Twitter Link.</div>
		                </div> 
		              </div>  
           			</div>
           			
           			
           				<div class="modal-footer">
           					<div class="clearfix"></div>
							<div class="space"></div>
								
								
						 <div class="topbuttonholder">
						 	<div style="float:right;">
						 -->
						
					
				

				
				
				
						
		
				
			<!-- </div></div></div></div> -->
		
		
		
			
		
		
		
		
		
		
		
		
		
		
				<!-- <div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add BU</h4>
      </div>
		
		  <div class="modal-body">

				<div id="poptable_contactform" style="padding: 10px; height: 450px;">
					<form name="abc">
						<span class="searchpadding padding_top"		style="float: left; width: 150px;">Biz Unit <span class="red">*</span>
						  </span> 
						 <span class="searchpadding padding_top" style="float: left;">	
							<input type="text" name="addBizName" id="addBizName"
							class="form-control" placeholder="Biz Unit "  onblur="getUniqueBizUnit()">
						</span> 
						
						
						<div class="row">
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Role Name<span class="red">*</span></label>
                  <div class="col-sm-9">
                    <input type="text" name="roleName" id="roleNameId"  class="input-xxlarge"/>
                     <div id="roleNameId_error" class="help-block hide">Please provide a valid Role Name.</div>
                  </div> 
                </div>  
                
                <div class="form-group col-md-12 clearfix">
                  <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Role Name<span class="red">*</span></label>
                  <div class="col-sm-9">
                    <input type="text" name="roleName" id="roleNameId" onchange="getRoleName('add');" class="input-xxlarge"/>
                     <div id="roleNameId_error" class="help-block hide">Please provide a valid Role Name.</div>
                  </div> 
                </div>  
                
              </div>
						
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Short Name <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="addBizShort" id="addBizShort"  class="form-control"
							placeholder="Short Name"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Company Name <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="addBizCompany" id="addBizCompany" class="form-control"
							placeholder="Company Name "></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Address <span
							class="red">*</span></span> <span class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="addBizAdd1" id="addBizAdd1" class="form-control"
							placeholder=" Address">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="addBizAdd2" id="addBizAdd2" class="form-control"
							placeholder=" ">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="addBizAdd3" id="addBizAdd3" class="form-control"
							placeholder=" ">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Country <span
							class="red">*</span></span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select
							name="addBizConutry" id="addBizConutry" class="form-control"
							onfocus="getCountry()" onchange="getState()"
							style="width: 300px; float: left;">
								  <option value="3001">India	</option>	


						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">State <span class="red">*</span>
						</span> <span class="searchpadding padding_top" style="float: left;">
							<select name="addBizState" id="addBizState" onfocus="getState()" onchange="	getCity();"
							class="form-control" style="width: 300px; float: left;">
								<option>Maharashtra</option>	
                                <option>Manipur</option>
                                <option>Meghalaya</option>

						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">City <span class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select
							name="addBizCity" id="addBizCity" class="form-control"
							onfocus="getCity()" style="width: 300px; float: left;">
								       <option>Mumbai</option>	
                                <option>Pune</option>


						</select></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"> Zip Code <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="addBizZipcode" id="addBizZipcode" class="form-control">
						</span>
						<div class="clearfix"></div>
						
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Twitter Link
							
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="addtwitter" id="addtwitter" maxlength=15 class="form-control"
							></span>
						<div class="clearfix"></div>
						

					</form>

				</div>

</div></div></div> -->

		
			
		


		<!-- Login on behalf start-->
<!-- 		<div id="LoginonBehalf">
			<div id="popupwrapper_contactform"
				style="height: 100px; width: 250px;">

				<div class="heading_contactform">
					<h3>Message</h3>
				</div>
		
		</div> -->

		<!-- Login on behalf End-->

		<!-- Set default start-->
		<!-- <div id="setdefault">
			<div id="popupwrapper_contactform"
				style="height: 100px; width: 250px;">

				<div class="heading_contactform">
					<h3>Message</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 100px;">

					Currently BU <strong>Sandeep</strong> is set to default. You are
					changing BU <strong>Rahul</strong> as the new default. Please
					confirm.
				</div>
				<div class="topbuttonholder">
					<form>
						<input class="dbtn" value="Copy" id="Copy" type="button">
						<input class="dbtn" onClick="popup('popUpAlertaddnote')"
							value="Cancel" id="Cancel" type="button">
					</form>
				</div>
			</div>
		</div>
 -->
		<!-- Set default End-->
		<!-- delete-->
		
		
			
		<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Message</h4> 
		<!-- <div id="deletenote"> -->
			Do you want to delete this Bizunit items ? Please confirm.
					<div style="float: right;">
						
							
									 
									
								<button id="" class="btn btn-sm btn-primary"  onclick="confirmDelete();" ><i class='ace-icon fa fa-plus'></i>Yes</button>
								<button id="" class="btn btn-sm btn-danger"  class="close" data-dismiss="modal"  ><i class='fa fa-times'></i>No</button>
						
							
							<!-- 
							<input class="dbtn" value="Yes" id="Yes" type="button"
								onclick="confirmDelete();popup('popUpAlertaddnote');" /> 
								<input
								class="dbtn" value="No" id="No" type="button"
								onclick="popup('popUpAlertaddnote');"/> -->
						
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="setdefault" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Message</h4> 
		<!-- <div id="deletenote"> -->
			
			
					Copy  <strong> <span id="mmm"></span>  </strong> to new BU as <strong>copy of <span id="mmm1"></span></strong>
					 Please confirm.
			
					<div style="float: right;">
						<form>
						
								<button id="" class="btn btn-sm btn-primary"  onclick="copyBuYes();" ><i class='ace-icon fa fa-plus'></i>Yes</button>
								<button id="" class="btn btn-sm btn-danger"   class="close" data-dismiss="modal"  ><i class='fa fa-times'></i>No</button>
						
						
						
						<!-- 	<input class="dbtn" value="Yes" id="Yes" type="button"		onclick="copyBuYes()" /> 
								<input		class="dbtn" value="No" id="No" type="button"				onclick="popup('popUpAlertaddnote');"/> -->
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	
		
	
	
	<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 		<div class="modal-dialog">
    	<div class="modal-content">
    		<form id="editForm" class="form-horizontal" >
        <div class="modal-header">
        	<button type="button" class="close" onclick="location.reload()" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit BU</h4>
      	</div>
      	
      	<div id="success-msg"></div>
      		<div class="modal-body">
      		
					
							
				
				<input type="hidden" id="editpartyId" name="partyId">
      		
      		
      				
           			<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Biz Unit<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Biz Unit"  id="editBizUnitName" name="lastName" onblur="getEditUniqueBu()" >
								   
							</div>
						</div>
					</div>
					<div class="space-2"></div>

<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Short Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Short Name"  id="editShortName" name="shortName"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Company Name<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Company Name"   id="editCompanyName" name="companyName"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>



					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Address <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6" placeholder="Address"  id="editAddress1"  name="street"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email"> </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6"  id="editAddress2" name="street2"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
							
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email"> </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6"   id="editAddress3" name="street3"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>

	
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Country <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								
								
		                  							<select	name="countryId" id="editCountry" class="input-xxlarge"	onfocus="getCountry()" onchange="getState()"	></select>
		                  							
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
						
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">State <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								
								
		                	<select	name="stateId" id="editState" class="input-xxlarge"	onfocus="getStateName(0)" onchange="getCityName(this.value,0);"	></select>
		                	
								
	   					
	   							
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
						
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">City <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<select	name="cityId" id="editCity" class="input-xxlarge"></select>
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Zipcode <span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6"  id="editZipCode" name="zipCode"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Twitter Link </label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<input type="text" class="col-xs-12 col-sm-6"  id="edittwitter" name="twitter"  >
								
							</div>
						</div>
					</div>
					<div class="space-2"></div>

				</div><!-- modal body end -->
					
					<div class="modal-footer">
						    			<button  class="btn btn-sm btn-primary"  onclick="updateBizUnit();" ><i class='ace-icon fa fa-plus'></i>Save</button>
								<button  class="btn btn-sm btn-danger"   class="close" data-dismiss="modal" aria-label="Close" ><i class='fa fa-times'></i>Cancel</button>
					</div>
					</form>
			</div>
		</div>
			</div>	
		

<!-- 
<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit BU</h4>
      </div>
      <div class="modal-body">
			
				<div class="heading_contactform">
					<h3>Add Role</h3>
				</div>
				<form id="editForm">
				
				<input type="hidden" id="editpartyId" name="partyId">
				
				
				
				
				
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editBizUnitName">Biz Unit<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="lastName" id="editBizUnitName"  placeholder="Biz Unit "  onblur="getUniqueBizUnit()" class="input-xxlarge"/>
		                   <div id="editBizUnitName_error" class="help-block hide">Please provide a valid Biz Unit Name.</div>
		                </div> 
		              </div>  
           			</div>
           		
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editShortName">Short Name <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="shortName" id="editShortName"  placeholder="Short Name "   class="input-xxlarge"/>
		                   <div id="editShortName_error" class="help-block hide">Please provide a valid Biz Unit Short Name.</div>
		                </div> 
		              </div>  
           			</div>	
           			
           	
						
						
						
							<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editCompanyName">Company Name<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="companyName" id="editCompanyName"  placeholder="Company Name "   class="input-xxlarge"/>
		                   <div id="editCompanyName_error" class="help-block hide">Please provide a valid Company Name.</div>
		                </div> 
		              </div>  
           			</div>
						
									<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editAddress1">Address<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="street" id="editAddress1"  placeholder="Company Name "   class="input-xxlarge"/>
		                   <div id="editAddress1_error" class="help-block hide">Please provide a valid Address.</div>
		                </div> 
		              </div>  
           			</div>
						
											<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editAddress2"></label>
		                <div class="col-sm-9">
		                  <input type="text" name="street2" id="editAddress2"  placeholder=""   class="input-xxlarge"/>
		                   <div id="editAddress2_error" class="help-block hide">Please provide a valid Address.</div>
		                </div> 
		              </div>  
           			</div>
						
														<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editAddress3"></label>
		                <div class="col-sm-9">
		                  <input type="text" name="street3" id="editAddress3"  placeholder=""   class="input-xxlarge"/>
		                   <div id="editAddress3_error" class="help-block hide">Please provide a valid Address.</div>
		                </div> 
		              </div>  
           			</div>
			
			
					
										<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editCountry">Country<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                  							<select	name="countryId" id="editCountry" class="input-xxlarge"	onfocus="getCountry()" onchange="getState()"	style="width: 300px; float: left;">
								  


						</select>
		                  
		                   <div id="editCountry_error" class="help-block hide">Please Select Counrty .</div>
		                </div> 
		              </div>  
           			</div>
							


					

									<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editState">State<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  							
		                  							
						</select>
		                   <div id="editState_error" class="help-block hide">Please Select State .</div>
		                </div> 
		              </div>  
           			</div>
					
					
									<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editCity">City<span class="red">*</span></label>
		                <div class="col-sm-9">
		                
						</select>
		                   <div id="editCity_error" class="help-block hide">Please Select State .</div>
		                </div> 
		              </div>  
           			</div>
					
					
									<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="editZipCode">Zip Code<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input type="text" name="zipCode" id="editZipCode"    class="input-xxlarge"/>
		                   <div id="editZipCodecode_error" class="help-block hide">Please provide a valid zipcode.</div>
		                </div> 
		              </div>  
           			</div>
					
						
										<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="edittwitter">Twitter Link</label>
		                <div class="col-sm-9">
		                  <input type="text" name="twitter" id="edittwitter"    class="input-xxlarge"/>
		                   <div id="edittwitter_error" class="help-block hide">Please provide a valid Twitter Link.</div>
		                </div> 
		              </div>  
           			</div>
					
						
			

						
				
						




	
						 
					
					
				</form>
						<div class="space-2"></div>
				
					 
						<div class="modal-footer">					
								<button  class="btn btn-sm btn-primary"  onclick="updateBizUnit();" ><i class='ace-icon fa fa-plus'></i>Save</button>
								<button  class="btn btn-sm btn-danger"   class="close" data-dismiss="modal" aria-label="Close" ><i class='fa fa-times'></i>Cancel</button>
							</div>
	
				
				
			</div></div></div></div> -->
		

		<!-- Edit-->
		<!-- <div id="editnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Edit BU</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 450px;">
					<input type="hidden" name="partyIds" id="partyIds"> <span
						class="searchpadding padding_top"
						style="float: left; width: 150px;">Biz Unit <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top" style="float: left;">
						<input type="text" name="editBizUnitName" id="editBizUnitName"  
						class="form-control" onblur="getEditUniqueBu()" placeholder="Biz Unit ">
					</span> </span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Short Name <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 305px;"> <input type="text"
						name="editShortName" id="editShortName"  class="form-control"
						placeholder="Short Name"></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Company Name <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 305px;"> <input type="text"
						name="editCompanyName" id="editCompanyName" class="form-control"
						placeholder="Company Name 
"></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Address <span
						class="red">*</span></span> <span class="searchpadding padding_top"
						style="float: left; width: 305px;"> <input type="text"
						name="editAddress1" id="editAddress1" class="form-control"
						placeholder="Address">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;"> </span> <span
						class="searchpadding padding_top"
						style="float: left; width: 305px;"> <input type="text"
						name="editAddress2" id="editAddress2" class="form-control"
						placeholder=" ">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;"> </span> <span
						class="searchpadding padding_top"
						style="float: left; width: 305px;"> <input type="text"
						name="editAddress3" id="editAddress3" class="form-control"
						placeholder=" ">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Country <span
						class="red">*</span></span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <select
						name="editCountry" id="editCountry"  onchange="getStateName(0)"
						class="form-control" style="width: 300px; float: left;">


					</select>
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">State <span class="red">*</span>
					</span> <span class="searchpadding padding_top" style="float: left;">
						<select name="editState" id="editState"  onchange="getCityName(this.value,0);"
						class="form-control" style="width: 300px; float: left;">

					</select>
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">City <span class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 300px;"> <select name="editCity"
						id="editCity"  class="form-control"
						style="width: 300px; float: left;">



					</select></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;"> Zip Code <span
						class="red">*</span>
					</span> <span class="searchpadding padding_top"
						style="float: left; width: 305px;"> <input type="text"
						name="editZipCode" id="editZipCode" class="form-control"
						placeholder="">
					</span>
					<div class="clearfix"></div>


<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Twitter Link
							
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 305px;"> <input type="text"
							name="edittwitter" id="edittwitter"  maxlength="15" class="form-control"
							></span>
						<div class="clearfix"></div>


				</div>
				<div class="topbuttonholder">
					<input class="dbtn" value="Save" id="Save" type="button"
						onclick="updateBizUnit()"> <input class="dbtn"
						onClick="popup('popUpAlertaddnote')" value="Cancel" id="Cancel"
						type="button">
				</div>
			</div>
		</div>
	 -->
	<!--css popup window 2 close-->


	<!--Nav Menu Start-->
	<div class="navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-target=".navbar-collapse"
					data-toggle="collapse" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--<a class="navbar-brand" href="#"> </a>-->
			</div>

		</div>
	</div>

	<div class="pull-right">
<div class="space"></div>
     <button id="SPAddBULink"   class="btn btn-sm btn-primary" onClick="newBu();"><i class='ace-icon fa fa-plus'></i>New BU</button>
                    <button id="SPDeleteBULink"  class="btn btn-xs btn-danger" onClick="deleteBizUnit();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
         </div>
    
    
    <div class="clearfix"></div>
    <div class="space"></div>

       <table id="grid-table"></table>
       <div id="grid-pager"></div>
  
    <div class="pull-left">
          <div class="space"></div>
          <div class="topmenuleft margin_5px" >
               <span>Export options:</span>
               
               <a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-140"></i></a>
               <a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-140"></i></a>
               
                    </div>
    </div>
    
    <div class="pull-right">
    <div class="space"></div>
    
      <button id="SPAddBULink" class="btn btn-sm btn-primary" onClick="newBu();"><i class='ace-icon fa fa-plus'></i>New BU</button>
                    <button id="SPDeleteBULink" class="btn btn-xs btn-danger" onClick="deleteBizUnit();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
         
    </div>
   

	<footer>
	<jsp:include page="../common/footer.jsp" />
		<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	</footer>
	<script>

/* 
 $( document ).ready(function() {
	    console.log( "ready!" );
	}); */
 
 
 function copyBuNote()
 {
	 
 }
function addNote(){
//$("#addnote").show();	
$("#deletenote, #editnote,#uploadUser,#LoginonBehalf,#setdefault").hide();	
/* var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
$('#popUpAlertaddnote').css('top',height);
var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
$('#popUpAlertaddnote').css('margin-left', width/3); */

/* $("#popUpAlertaddnote").css ('height','600px');
$("#popUpAlertaddnote").css ('width','650px'); */


$('#addnote').modal('show');
}
function UploadUser(){
$("#uploadUser").show();	
$("#deletenote, #editnote, #addnote, #LoginonBehalf,#setdefault").hide();	
$("#popUpAlertaddnote").css ('height','300px')
$("#popUpAlertaddnote").css ('width','650px')
}


/* function LoginonBehalf(){

$("#LoginonBehalf").show();	
$("#addnote, #editnote, #uploadUser, #deletenote,#setdefault").hide();	
$("#popUpAlertaddnote").css ('left','550px');
$("#popUpAlertaddnote").css ('top','190px');

$("#popUpAlertaddnote").css ('height','250px')
$("#popUpAlertaddnote").css ('width','300px')

} */

function deleteNote(){

//$("#deletenote").show();	
$("#addnote, #editnote, #uploadUser, #LoginonBehalf,#setdefault").hide();	
$('#deletenote').modal('show');
/* var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
$('#popUpAlertaddnote').css('top',height);
var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
$('#popUpAlertaddnote').css('margin-left', width/3);
$("#popUpAlertaddnote").css ('height','250px');
$("#popUpAlertaddnote").css ('width','300px'); */

}
function editNote(){

//$("#editnote").show();	
$("#addnote, #deletenote, #uploadUser, #LoginonBehalf,#setdefault").hide();	

$('#editnote').modal('show');
/* var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
$('#popUpAlertaddnote').css('top',height);
var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
$('#popUpAlertaddnote').css('margin-left', width/3);

$("#popUpAlertaddnote").css ('height','600px');
$("#popUpAlertaddnote").css ('width','650px');
 */
}

 function SetDefault(){

//$("#setdefault").show();	
$('#setdefault').modal('show');
$("#addnote, #deletenote, #uploadUser, #LoginonBehalf,#editnote").hide();	


}
 
</script>


		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			var grid_data = ${UnitBiz}
			
			
/* 			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8}
			]; */
			
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
				
				//resize to fit page size
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
			    })
				//resize on sidebar collapse/expand
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 0);
					}
			    })
				
				//if your grid is inside another element, for example a tab pane, you should use its parent's width:
				/**
				$(window).on('resize.jqGrid', function () {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				})
				//and also set width when tab pane becomes visible
				$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				  if($(e.target).attr('href') == '#mygrid') {
					var parent_width = $(grid_selector).closest('.tab-pane').width();
					$(grid_selector).jqGrid( 'setGridWidth', parent_width );
				  }
				})
				*/
				
				
			
			
			
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
			
					//subgrid options
					subGrid : false,
					//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
					//datatype: "xml",
					subGridOptions : {
						plusicon : "ace-icon fa fa-plus center bigger-110 blue",
						minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
						openicon : "ace-icon fa fa-chevron-right center orange"
					},
					//for this example we are using local data
					subGridRowExpanded: function (subgridDivId, rowId) {
						var subgridTableId = subgridDivId + "_t";
						$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
						$("#" + subgridTableId).jqGrid({
							datatype: 'local',
							data: subgrid_data,
							colNames: ['No','Item Name','Qty'],
							colModel: [
								{ name: 'id', width: 50 },
								{ name: 'name', width: 150 },
								{ name: 'qty', width: 50 }
							]
						});
					},
					
			
			
					data: grid_data,
					datatype: "local",
					height: 250,
					colNames:[' ',' ','Biz Unit','Company Name','Short Name','Common Email ID','Common Name','Action','Updated on'],
					colModel:[
					 	{name:'myac',index:'', width:50, fixed:true, sortable:false, resize:false,


					 		 formatter: function(cellvalue, options,rowObject) {
					 		                
					 		                return '<a href="#" onclick="editBizUnit('+rowObject.partyId+',\''+rowObject.lastName+'\');" id="SPEditBULink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
					 		   												
							}
						}, 
						
						
						
						   {name:'chkdeleteselect',index:'', width:50, sortable:false,formatter:function(cellvalue, options,rowObject) {
						       return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.partyId+'" id="chkdeleteselect" name="chkdeleteselect">';
						   }}, 
						{name:'lastName'},
					 	{name:'companyName'},
						{name:'shortName'},
						{name:'emailId'},
						{name:'commName'},
						//{name:'Action',index:'Action'} 
						{name:'action',index:'action',formatter:function(cellvalue, options,rowObject) 
							{
							
							   return '<a href="#" onclick="openActionPopup('+rowObject.partyId+',\''+rowObject.lastName+'\')">Action</a>';
							}
						,
						
							
						
						
						}, 
					
						{name:'updateon'},
						
						
					//	formatter:function(cellvalue, options,rowObject) 
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30,50,100],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					multiselect: false,
					//multikey: "ctrlKey",
			        multiboxonly: true,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					//caption: "Biz Unit List"
			
					autowidth: true,
			
			
					/**
					,
					grouping:true, 
					groupingView : { 
						 groupField : ['name'],
						 groupDataSorted : true,
						 plusicon : 'fa fa-chevron-down bigger-110',
						 minusicon : 'fa fa-chevron-up bigger-110'
					},
					caption: "Grouping"
					*/
			
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				
			
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});
			
			
				//switch element when editing inline
				function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
			
			
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: false,
						editicon : 'ace-icon fa fa-pencil blue',
						add: false,
						addicon : 'ace-icon fa fa-plus-circle purple',
						del: false,
						delicon : 'ace-icon fa fa-trash-o red',
						search: true,
						searchicon : 'ace-icon fa fa-search orange',
						refresh: false,
						refreshicon : 'ace-icon fa fa-refresh green',
						view: false,
						viewicon : 'ace-icon fa fa-search-plus grey',
					},
					{
						//edit record form
						//closeAfterEdit: true,
						//width: 700,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if(form.data('styled')) return false;
							
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							
							form.data('styled', true);
						},
						onClick : function(e) {
							//alert(1);
						}
					},
					{
						//search form
						recreateForm: true,
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true,
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						}
					}
				)
			
			
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
							  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
							
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
			
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
		
		function openActionPopup(partyId,lastName){
			//alert(partyID);
			//$('#SPPartnerDashboardLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();partnerDashboard(\''+firstName+'\',\''+lastName+'\',' +partyID+',' +recordTypeID+',\''+lastLogin+'\','+isActive+')');
		
			
			$('#SPCopyBULink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();copyBu('+partyId+',\''+lastName+'\')');
			 $('#SPViewDetailsBULink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();viewDetail('+partyId+')'); 
			
	    
			if('${sessionScope.userSession.buId}'!='27827'){
				$('#SPCopyBULink a').removeClass('hide');
				$('#SPViewDetailsBULink a').removeClass('hide');
				
				
		
				
			/* 	$('#PartnerActionPlanLink1 #PartnerActionPlanLink').attr('class','hide');
				$('#ClientActionPlanLink1 #ClientActionPlanLink').attr('class','hide');
 */		
				
			}else{
				$('#SPCopyBULink a').removeClass('hide');
				$('#SPViewDetailsBULink a').removeClass('hide');
				
				
			
			$( ".action_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
                width: "auto",
			});
		}
		}
    jQuery(function($) {
        	$("#search").keyup(function(event) {
				if (event.keyCode == 13) {
					oppsearch();
				}
			}); 
        $( ".action" ).on('click', function(e) {
					e.preventDefault();
				
					$( ".action_dialog" ).removeClass('hide').dialog({
						resizable: false,
						modal: true,
                        width: "auto",
					});
				});
				
		$( ".progress").on('click', function(e) {
			e.preventDefault();
		
			$( ".progress_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
				width: "auto",
                      
			});
		});
     });	 

</script>
<script type="text/javascript">
function viewDetail(partyID)
{
	
	window.location.href= $('#contextPath').val()+'/bizunit/loadviewprofile.htm?partyId='+partyID;
	
	
}

function getXLS()
{
  window.location.href = "<%=request.getContextPath()%>/bizunit/bizunitExcel.htm";
}
function getCSV()
{
  window.location.href ="<%=request.getContextPath()%>/bizunit/bizunitCSV.htm";
}



</script>



<div class="common_dialog hide action_dialog">
  <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
    <tbody>
      <tr id="">
        <th class="thead">Action List</th>
       
      </tr>
    
         <tr id="SPViewDetailsBULink">
        <td id="SPViewDetailsBULink"><i class="fa fa-windows"></i> <a onclick=""><span class="">View Details</span></a></td>
        
      </tr>
      <tr id="SPCopyBULink">
        <td id="SPCopyBULink"><i class="fa fa-windows"></i> <a onclick=""><span class="">Copy BU</span></a></td>
        
      </tr>
      
    
      
    </tbody>
  </table>
</div>

</body>

<!-- $( document ).ready(function() {
	
	
	showDiv('manageHierachyLinkDiv');
	
	//getHeirachyData();
	//showDiv('manageHierachyLinkDiv');
}); -->
</html>