<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>View User Profile-Setting</title>



<script type="text/javascript">
function addSetting()
{
	resetVal();
	codeValue(); 
	addNote();
	//popup('popUpAlertaddnote');
	}
function getClear()
{
	
	$('#success-msg').val('');
	$('#success-msg').empty();
}
   
function editValidation()
{
	  if ( $('#attributeValue').val().trim()=="") 
	  {
			 alert("Please Enter Default Value.");
			 $('#attributeValue').val('');
			 $('#attributeValue').focus();
	         return false;
	     } 
	  if ( $('#defaultValue').val().trim()=="") 
	  {
			 alert("Please Enter Default  Value.");
			 $('#defaultValue').val('');
			 $('#defaultValue').focus();
	         return false;
	     } 
	  if ( isNaN($('#defaultValue').val())) 
	  {
			 alert("Please Enter Numeric Value in Default Value.");
			 $('#defaultValue').val('');
			 $('#defaultValue').focus();
	         return false;
	     } 
	  if ( isNaN($('#startRangess').val())) 
	  {
			 alert("Please Enter Numeric Value in Start Range.");
			 $('#startRangess').val('');
			 $('#startRangess').focus();
	         return false;
	     } 
	  if ( isNaN($('#endRangess').val())) 
	  {
			 alert("Please Enter Numeric Value in End Range.");
			 $('#endRangess').val('');
			 $('#endRangess').focus();
	         return false;
	     } 
	
	  
	  return true;
	
}	
function editEndValid()
{
	var start=0;
	start=$('#startRangess').val();
	var end=0;
	end=$('#endRangess').val();
	var defaultval=0;
	defaultval=$('#defaultValue').val();
	
if(start.length>0 ||end.length>0)
{

	 if((start==0))
	{
	 alert("Please Enter Start Range  Value.");
		 $('#startRangess').val('');
		 $('#startRangess').focus();
         return false;
	
	}
 if((end==0))
{
	 alert("Please Enter End Range  Value.");
		 $('#endRangess').val('');
		 $('#endRangess').focus();
         return false;
	
	} 
 if((defaultval==0))
{
	 alert("Please Enter Default  Value.");
		 $('#defaultValue').val('');
		 $('#defaultValue').focus();
         return false;
	
	} 
	if(start!="" && end!="" && (parseInt(defaultval, 10) < parseInt(start, 10)))
	{
	  	alert("Please Enter Default Value Between Start Range Value And End Range Value.");
	  	$('#defaultValue').focus();
	  	return false;
	 }
	 if(start!="" && end!="" && (parseInt(defaultval, 10) > parseInt(end, 10)))
	{
	  	alert("Please Enter Default Value Between Start Range Value And End Range Value.");
	  	$('#defaultValue').focus();
	  	return false;
	 }
	
	return true;
}
return true;
}

function addEndValid()
{

	var end=$('#addRangeEnd').val();
	var start=$('#addRangeStart').val();
	var defaultval=$('#addDataTypeValue').val();
	
if(start.length>0 ||end.length>0)
	{
	if(($('#addRangeStart').val().trim()=="")) 
	  {
			 alert("Please Enter Start Range  Value.");
			 $('#addRangeStart').focus();
	         return false;
	     }
	else if(($('#addRangeEnd').val().trim()=="")) 
	  {
			 alert("Please Enter End Range Value.");
			 $('#addRangeEnd').focus();
	         return false;
	     }
	
	
	
	else if((start==0))
		{
		 alert("Please Enter Start Range  Value.");
			 $('#addRangeStart').val('');
			 $('#addRangeStart').focus();
	         return false;
		
		}
	else if((end==0))
	{
		 alert("Please Enter End Range  Value.");
			 $('#addRangeEnd').val('');
			 $('#addRangeEnd').focus();
	         return false;
		
		} 
	else if((defaultval==0))
	{
		 alert("Please Enter Default  Value.");
			 $('#addDataTypeValue').val('');
			 $('#addDataTypeValue').focus();
	         return false;
		
		} 
	
	
	else if(end!="" && start!="" && (parseInt(defaultval, 10) < parseInt(start, 10)))
	{
		  alert("Please Enter Default Value Greater Than Start Range Value .");
		  $('#addDataTypeValue').val('');
			 $('#addRangeStart').val('');
		  $('#addDataTypeValue').focus();
		 }
	else if(end!="" && start!="" &&(parseInt(defaultval, 10) > parseInt(end, 10)))
	{
		  alert("Please Enter Default Value Less Than  End Range Value.");
		  $('#addDataTypeValue').val('');
			 $('#addRangeEnd').val('');
		  $('#addDataTypeValue').focus();
		 }
	

	
	else
		{
		return true;
		}
	
	
	}
else
	{
	return true;
	}
	
	  
	  
}

function addValidation()
{


	  if ( $('#addCodeValue').val().trim()=="") 
	  {
			 alert("Please Enter Code Value.");
			 $('#addCodeValue').val('');
			 $('#addCodeValue').focus();
	         return false;
	     } 
	  if ( $('#addDataTypeValue').val().trim()=="") 
	  {
			 alert("Please Enter Default  Value.");
			 $('#addDataTypeValue').val('');
			 $('#addDataTypeValue').focus();
	         return false;
	     } 
	  if ( isNaN($('#addDataTypeValue').val())) 
	  {
			 alert("Please Enter Numeric Value in Default Value.");
			 $('#addDataTypeValue').val('');
			 $('#addDataTypeValue').focus();
	         return false;
	     } 
	  if (isNaN($('#addRangeStart').val())) 
	  {
			 alert("Please Enter Numeric  Value in Start Range.");
			 $('#addRangeStart').val('');
			 $('#addRangeStart').focus();
	         return false;
	     } 
	  if ( isNaN($('#addRangeEnd').val())) 
	  {
			 alert("Please Enter Numeric Value in End Range.");
			 $('#addRangeEnd').val('');
			 $('#addRangeEnd').focus();
	         return false;
	     } 
	
	  
	  return true;
	
}
	
function deleteSetting()
{
	  var slvals = []
 	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
 	  slvals.push($(this).val());
 	  })
 	 document.getElementById("confirmdelete").value = slvals;
	  if(slvals<=0)
		  {
		  //alert('Please select at least one Record.');
		  
		  
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
		
		  }
	  else
		  {
		 deleteNote();
		  // popup('popUpAlertaddnote'); 
		  }
}



function confirmDelete()
{
	 var slvals= document.getElementById("confirmdelete").value;
	 
	   	  $.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/setting/deleteBizUnitSetting.htm?Lists="+slvals,
	
 success : function(result) 
 {	  
	 

	   bootbox.dialog({
			message: "<span class='bigger-110'>Setting deleted successfully.</span>",
			buttons: 			
			{
				"click" :
				{
					"label" : "OK!",
					"className" : "btn-sm btn-primary",
					"callback": function() {
						location.reload();
					//	window.open($('#contextPath').val()+"/setting/loadprofile_setting.htm?partyId="+$('#partyIds').val());
					}
				}
			}
		}); 
	  
	 
	  		 			
 }
    
 }); 
}
/* 

function confirmDelete()
{
	 var slvals= document.getElementById("confirmdelete").value;
	   	  $.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/setting/deleteBizUnitSetting.htm?Lists="+slvals,
	
  success : function(result) 
  {	  

			   bootbox.dialog({
					message: "<span class='bigger-110'>Setting deleted successfully.</span>",
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
} */

function updateSetting()
{
	

	
	$.validator.addMethod("alphaNumeric", function (value, element) {
	    return this.optional(element) || /^[0-9a-zA-Z]+$/.test(value);
	}, " Only letters and number allowed.");
	
	

 

 
 $.validator.addMethod('le', function(value, element, param) {
     return this.optional(element) || value <= $(param).val();
}, 'Invalid value');
$.validator.addMethod('ge', function(value, element, param) {
	
     return this.optional(element) || value >= $(param).val();
}, 'Invalid value');


$.validator.addMethod('defau', function(value, element, param) {
	return this.optional(element) || value >= $(param).val();
}, 'Invalid value ');


/* $.validator.addMethod('defaude', function(value, element, param) {
	return this.optional(element) || value <= $(param).val();
}, 'Invalid value '); */
 
	
/* 	$.validator.addMethod("alphaNumeric1", function (value, element) {
	    return this.optional(element) || /^[,.0-9a-zA-Z]+$/.test(value);
	}, "Special character not allowed."); */
	
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
			attributeValue: {
				required:true,
				alphaNumeric:true
		},
		
		defaultValue: {
			required:true,
			number:true/* ,
			defaude:'#endRangess' */
	},

	startRange: {
	                required: {
	            		depends: function(element)
	            		{
	            			return $("#endRangess").val()!="";
	            		}
	            	},
	                number:true,
	                
	                le: '#endRangess',
	                 
	                
	            },
	            endRange: {
	            	required: {
	            		depends: function(element)
	            		{
	            			return $("#startRangess").val()!="";
	            		}
	            	},
	            	        	number:true,
	            	        	ge: '#startRangess', 
	            	        	defau:'#defaultValue'
	            }
	            
	             
	            
			
		},

		messages: {
			attributeValue: {
				required: "Please enter value."				
			},
			
			defaultValue: {
				required: "Please enter default value."				
			},
			endRange: {
				required: "Please enter end range value."
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

		submitHandler: function (form) 
		{
			
			
			
			
			 
		 	$.ajax({
				type :'POST',  
				
				data:$('#editForm').serialize(),
		     url : $('#contextPath').val() +"/setting/updateBizSetting.htm",
						success : function(result) 
						{
							
				
							
							
							
							  bootbox.dialog({
								  	message: "<span class='bigger-110'>Setting Updated Successfully.</span>",
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
			
			/*  
			 document.getElementById("attributeValue").value=document.getElementById("attributeValue").value.trim();
			 
			 var defaultValue1= document.getElementById("defaultValue").value;
			 var defaultValue = $.trim(defaultValue1);
			 
			 document.getElementById("defaultValue").value = defaultValue;
			
			 
		 	$.ajax({
				type :'POST',  
				
				data:$('#editForm').serialize(),
		     url : $('#contextPath').val() +"/setting/updateBizSetting.htm",
						success : function(result) 
						{
							
				
							
							
							
							  bootbox.dialog({
								  	message: "<span class='bigger-110'>Setting Updated Successfully.</span>",
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
			});  */
		},
		invalidHandler: function (form) {
			
		}
	});	
	
	
	

}
function editSetting(partySettingId)
{
	
	var partyId=document.getElementById("partyIds").value;
	
			$.ajax({
		type :'POST',  
		url : $('#contextPath').val()+"/setting/getSettingDetail.htm?partyId="+partyId+
		"&partySettingId="+partySettingId,
		
				success : function(result) 
				{
					$(result).each(function(i,obj) {
					    var partyId=obj.partyId;
					    var	   partySettingId=obj.partySettingId;
					    var	   attributeCodeId=obj.attributeCodeId;
					    var	  attributeValue=obj.attributeValue;
					    var	   defaultValue=obj.defaultValue;
					    var	   dataType=obj.dataType;
					    var	   dataTypeId=obj.dataTypeId;
					    var	  codevalue=obj.codevalue;
					    var	   startRange1=obj.startRangess;
					    var	   endRange1=obj.endRangess;
					    var	  settingType=obj.settingType;
					    var	 settingTypeValue=obj.settingTypeValue;
					    if(settingType==undefined)
					    	{
					    	
					    	
					  	  bootbox.dialog({
							  	message: "<span class='bigger-110'>Please Select Party Type.</span>",
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
					    	
					    	
					    	partySetting(0);
					    	
					    	}
					    else
					    	{
					    	partySetting(settingType);
					    	}
					    
					    
					    
					    if(attributeCodeId==undefined)
				    	{
				    	
				    	attribute(0);
				    	
				    	}
				    else
				    	{
				    	attribute(attributeCodeId);
				    	}
					    
					    
					   if(dataTypeId==undefined)
						   {
						   
						   }
					   else
						   {
						   
						   dataTypess(dataTypeId);
						   
						   }
					   
					
					   
					
					     ($('#attributeValue').val(attributeValue));
					     ($('#defaultValue').val(defaultValue));
					     ($('#startRangess').val(startRange1));
					     ($('#endRangess').val(endRange1));
					     ($('#partyId').val(partyId));
					     ($('#partySettingId').val(partySettingId)); 
					           
					      
					
					});		
					editNote();
					//popup('popUpAlertaddnote');
		}
		});
	

}
function reload()
{
	location.reload();
}
function data1()
{
	alert("here");
	var id = getParameterByName('partyID');
	alert(id);
	alert("ok");
	 //  window.location.href= $('#contextPath').val()+'/bizunit/loadprofile_setting.htm?partyId='+id;
}
function resetVal()
{
	$('#addDataTypeValue').val('');
	$('#addRangeStart').val('');
	$('#addRangeEnd').val('');
	$('#addCodeValue').val('');
	codeValue();
}





function doAdd(isclose)
{
	
	$.validator.addMethod("alphaNumeric", function (value, element) {
	    return this.optional(element) || /^[0-9a-zA-Z]+$/.test(value);
	}, " Only letters and number allowed.");
	
	
/* 	$.validator.addMethod("threenumber", function (value, element) {
	    
		var defalut=parseInt($('#addDataTypeValue').val());
		var start=parseInt($('#addRangeStart').val());
		var end=parseInt($('#addRangeEnd').val());
		
		 return this.optional(element) || /^[0-9a-zA-Z]+$/.test(value);
		
		
	}, " Only letters and number allowed.");
	
 */
 

 
 $.validator.addMethod('le', function(value, element, param) {
     return this.optional(element) || value <= $(param).val();
}, 'Invalid value');
$.validator.addMethod('ge', function(value, element, param) {
	
     return this.optional(element) || value >= $(param).val();
}, 'Invalid value');


$.validator.addMethod('defau', function(value, element, param) {
	return this.optional(element) || value >= $(param).val();
}, 'Invalid value ');
 
	
/* 	$.validator.addMethod("alphaNumeric1", function (value, element) {
	    return this.optional(element) || /^[,.0-9a-zA-Z]+$/.test(value);
	}, "Special character not allowed."); */
	
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
			attributeValue: {
				required:true,
				alphaNumeric:true
		},
		
		defaultValue: {
			required:true,
			number:true
	},

	startRange: {
	                required: {
	            		depends: function(element)
	            		{
	            			return $("#addRangeEnd").val()!="";
	            		}
	            	},
	                number:true,
	                
	                le: '#addRangeEnd',
	                 
	                
	            },
	            endRange: {
	            	required: {
	            		depends: function(element)
	            		{
	            			return $("#addRangeStart").val()!="";
	            		}
	            	},
	            	        	number:true,
	            	        	ge: '#addRangeStart', 
	            	        	defau:'#addDataTypeValue'
	            }
	            
	         
	            
			
		},

		messages: {
			attributeValue: {
				required: "Please enter value."				
			},
			
			defaultValue: {
				required: "Please enter default value."				
			},
			endRange: {
				required: "Please enter end range value."
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

				

				$("#addCodeValue").val().trim();
				
				$("#addDataTypeValue").val().trim();
				$("#addRangeStart").val().trim();
				$("#addRangeEnd").val().trim();
				
				var partyId=document.getElementById("partyIds").value;
				
				$('#addPartyID').val(partyId);
				$.ajax({
					type :'POST',  
					url : $('#contextPath').val()+"/setting/getUniqueSetting.htm?partyId="+partyId+
					"&addCodeValueId="+$('#addCodeValueId').val(),
							success : function(result) 
							{
								
								if(result==1)
									{
									$.ajax({
										type :'POST',  
										data:$('#addform').serialize(),
										url : $('#contextPath').val()+"/setting/addBizSetting.htm",/* ?partyId="+partyId+
										"&addAssumeType="+$('#addAssumeType').val()+
										"&addCodeValueId="+$('#addCodeValueId').val()+
										"&addDataTypeValue="+addDataTypeValue+
										"&addCodeValue="+aa+
										"&addDataType="+$('#addDataType').val()+
										"&addRangeStart="+addRangeStart+
										"&addRangeEnd="+addRangeEnd, */
												success : function(result) 
												{
													
													
												    
													
													   
													
													   if(isclose==1){
														   bootbox.dialog({
																message: "<span class='bigger-110'>Setting updated successfully.</span>",
																buttons: 			
																{
																	"click" :
																	{
																		"label" : "OK!",
																		"className" : "btn-sm btn-primary",
																		"callback": function() {
																			 location.reload();
																			 resetval();
																		}
																	}
																}
															});
														   
														   
														   //location.reload();
											              }else{
											            	  
											            	  $('#success-msg').empty();	
															  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Setting updated successfully.</p></div>');
															  resetVal();
											            	  addNote();
												              //popup('popUpAlertaddnote').show();
												             
											              }
													
													
											/* 		
													if(isclose==1){
											            	  location.reload();
											              }else{
											            	  resetVal();
											       	       
											            	  addNote().show();
												              popup('popUpAlertaddnote').show();
												             
											              } */
													
									 			
										}
										});
									}
								else
									{
									$.ajax({
										type :'POST',  
										data:$('#addform').serialize(),
										url : $('#contextPath').val()+"/setting/addBizSetting.htm",/* ?partyId="+partyId+
										"&addAssumeType="+$('#addAssumeType').val()+
										"&addCodeValueId="+$('#addCodeValueId').val()+
										"&addDataTypeValue="+addDataTypeValue+
										"&addCodeValue="+aa+
										"&addDataType="+$('#addDataType').val()+
										"&addRangeStart="+addRangeStart+
										"&addRangeEnd="+addRangeEnd, */
												success : function(result) 
												{
									 			//	alert('Setting Added Successfully');
									 				
									 				
									 				
													   if(isclose==1){
														   bootbox.dialog({
																message: "<span class='bigger-110'>Setting saved successfully.</span>",
																buttons: 			
																{
																	"click" :
																	{
																		"label" : "OK!",
																		"className" : "btn-sm btn-primary",
																		"callback": function() {
																			 location.reload();
																			 resetval();
																		}
																	}
																}
															});
														   
														   
														   //location.reload();
											              }else{
											            	  
											            	  $('#success-msg').empty();	
															  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Setting saved successfully.</p></div>');
															  resetVal();
											            	  addNote();
												              //popup('popUpAlertaddnote').show();
												             
											              }
									 				
									 				
									 				
									 				
									 			/* 	
													   if(isclose==1){
											            	  location.reload();
											              }else{
											            	  resetVal();
											       	       
											            	  addNote().show();
												              popup('popUpAlertaddnote').show();
												             
											              } */
										}
										});
									}
								
								
					}
					});
				
				
				


				
			}
		},
		invalidHandler: function (form) {
			
		}
	});	
	
	
	}



function attribute(id)
{
	$.ajax(
   			{ 				
   		  type: "POST",
   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=98',
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			
							$('#addCodeValueId').empty();
							
							$(result).each(function(i,obj) {
							    var codeTypeId=obj.codeTypeId;
							    var codeValue=obj.codeValue;
							    var codevalueId=obj.codeValueId;
							      
						    if(codeTypeId==98){
						    	
						    	if(id==codevalueId)
						    		{
						    		$('#attributeCodeId').append('<option value="'+codevalueId+'" selected="selected">'+codeValue+'</option>');
						    		}
						    	else
						    		{
						    		$('#attributeCodeId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');		
						    		}
						     
						    }
						
							});				
							
						
					
   		  }
   	
   	});
  
}
function partySetting(id)
{
	$.ajax(
   			{ 				
   		  type: "POST",
   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=146',
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			
							$('#settingType').empty();
							
							$(result).each(function(i,obj) {
							    var codeTypeId=obj.codeTypeId;
							    var codeValue=obj.codeValue;
							    var codevalueId=obj.codeValueId;
							      
					 if(codeTypeId==146){
						 if(codevalueId==id)
							 {
							 $('#settingType').append('<option value="'+codevalueId+'" selected="selected">'+codeValue+'</option>');
							 }
						 else
							 {
							 $('#settingType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');	 
							 }
						
						    }
							
							
							});				
							
						
					
   		  }
   	
   	});
  
}
function dataTypess(ids)
{
		   	$.ajax(
		   			{ 				
		   		  type: "POST",
		   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=37',
		   		 dataType: 'json',
				  contentType: 'application/json',
					   		  success:function(result)
		   		  { 
					   			
									$('#dataTypeId').empty();
									
									$(result).each(function(i,obj) {
									    var codeTypeId=obj.codeTypeId;
									    var codeValue=obj.codeValue;
									    var codevalueId=obj.codeValueId;
							 if(codeTypeId==37){
								 
								 if(ids==codevalueId)
									 {
									 $('#dataTypeId').append('<option value="'+codevalueId+'" selected="selected">'+codeValue+'</option>');
									 }
								 else
									 {
									 $('#dataTypeId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
									 }
								     
								    }
								
									
									});				
									
								
							
		   		  }
		   	
		   	});
		  
	
	
}
function codeValue()
{
	//alert("here");
	  $('#addAssumeType').empty();
		   	$.ajax(
		   			{ 				
		   		  type: "POST",
		   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=98,37,146',
		   		 dataType: 'json',
				  contentType: 'application/json',
					   		  success:function(result)
		   		  { 
					   			
									$('#addAssumeType').empty();
									$('#addDataType').empty();
									$('#addCodeValueId').empty();
									
									$(result).each(function(i,obj) {
									    var codeTypeId=obj.codeTypeId;
									    var codeValue=obj.codeValue;
									    var codevalueId=obj.codeValueId;

								    if(codeTypeId==98){
								    	
								     $('#addCodeValueId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
								    }
									else if(codeTypeId==37){
								     $('#addDataType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
								    }
									else if(codeTypeId==146){
								     $('#addAssumeType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
								    }
									
									
									});				
									
								
							
		   		  }
		   	
		   	});
		  
	
	
}

</script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
</head>
<body>
<jsp:include page="../common/header.jsp" />
<%HttpSession hes=request.getSession();%>
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
		<input type="hidden" name="confirmdelete" id="confirmdelete"> 
<input type="hidden" name="partyIds" id="partyIds" value="<%=request.getAttribute("partyId")%>">
<!--css popup window start 1-->

<div class="page-header clearfix">
                <h1 class="pull-left"><B>Biz Unit Profile for <%=hes.getAttribute("nameBizUnit")%></B></h1>
                <div class="nav-search pull-right" id="">
                  
                </div>
               </div>
<div class="row">
  		<div class="col-md-2">
  		<div class="list-group">
        		<a class="list-group-item active" href="#">Sections</a>
                <a id="SPBUProfileGeneralLink" href="<%=request.getContextPath()%>/bizunit/loadviewprofile.htm?partyId=<%=hes.getAttribute("partyId")%>" class="list-group-item">General</a>
              	<a id="SPBUProfileWhiteLabelLink"  href="<%=request.getContextPath()%>/bizunit/loadwhitelabel.htm?partyId=<%=hes.getAttribute("partyId")%>" class="list-group-item">White Label</a>  	
                <a id="SPBUProfileSettingsLink"  class="list-group-item" href="#"><strong>Settings</strong></a>
                <a id="SPBUProfileAssumptionsLink" href="<%=request.getContextPath()%>/loadAssumptions.htm" class="list-group-item">Assumptions</a>  
                <%-- <a id="SPProductRecommendationsLink"  href="<%=request.getContextPath()%>/partner/recommendation/getProductRecommendations.htm?partyId=<%=hes.getAttribute("partyId")%>"  class="list-group-item">Product Recommendation</a> --%>   
                </div>
  		
  		</div>
  		<div class="col-md-10">
  		
  		
  		<div class="list-group">
        			<a class="list-group-item active" href="#">Biz Unit Setting  </a>
           				<div class="list-group-item">
           				<div class="topmenu pull-right margin_5px">
       							
       							  
     <button id="SPBUProfSettingsAddNewLink" class="btn btn-sm btn-primary" onClick="addSetting();"><i class='ace-icon fa fa-plus'></i>New </button>
                    <button id="SPBUProfSettingsDeleteLink" class="btn btn-sm btn-danger" onClick="deleteSetting()"><i class='ace-icon fa fa-trash'></i>Delete</button>
       				
						</div>
                    <div class="clearfix"></div>
  		
  		<div class="table-responsive" id="display_table_lead">
  			<div id="toreload">
	  			<table id="grid-table" ></table>
				<div id="grid-pager"></div>
			</div>
		</div>	
		
		 <div class="clearfix"></div>

                           <div class="row">
     						<div class="topmenu pull-right margin_5px">
     						  
     <button id="SPBUProfSettingsAddNewLink" class="btn btn-sm btn-primary" onClick="addSetting();"><i class='ace-icon fa fa-plus'></i>New </button>
                    <button id="SPBUProfSettingsDeleteLink" class="btn btn-sm btn-danger" onClick="deleteSetting()"><i class='ace-icon fa fa-trash'></i>Delete</button>
                              
 							</div>

   						</div>
		
		</div>
		
		</div>
 		
   	</div> 	
   	</div>

    

<!--css popup window 1 close-->
<!--css popup window start 2-->
<!-- <div style="display: none;" id="blanket"></div> -->

<!-- <div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Setting</h4>
      </div>
      <div id="success-msg"></div>
      <div class="modal-body">
			
				<div class="heading_contactform">
					<h3>Add Role</h3>
				</div>
				<form id="addform" name="addform">
				
						
		<input type="hidden" id="addPartyID" name="partyId">
				
		
		
		
		
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addAssumeType">Type<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                  <select name="settingType" id="addAssumeType" class="input-xxlarge" style="width:300px; float:left;">
		                  </select>
		                   <div id="addAssumeType_error" class="help-block hide">Please select type.</div>
		                </div> 
		              </div>  
           			</div>
          
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addCodeValueId">Name<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                  <select name="attributeCodeId" id="addCodeValueId" class="input-xxlarge" style="width:300px; float:left;">
		                  </select>
		                   <div id="addCodeValueId_error" class="help-block hide">Please select type.</div>
		                </div> 
		              </div>  
           			</div> 		
           		     			
          
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addCodeValue"> Value <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="attributeValue" id="addCodeValue" class="form-control" placeholder="Value">
		                   <div id="addCodeValue_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	
           			
           				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addDataType">Data Type<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                  <select name="dataTypeId" id="addDataType" class="input-xxlarge" style="width:300px; float:left;"></select>
		                   <div id="addDataType_error" class="help-block hide">Please select type.</div>
		                </div> 
		              </div>  
           			</div>
           		
         
           	
						  			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addDataTypeValue">Default Value <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="defaultValue" id="addDataTypeValue" class="form-control" placeholder="Value">
		                   <div id="addDataTypeValue_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	
						
							  			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addRangeStart">Range Start Value </label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="startRange" id="addRangeStart" class="form-control" placeholder="Value">
		                   <div id="addDataTypeValue_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	  

							  			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="addRangeEnd">Range End Value </label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="endRange" id="addRangeEnd" class="form-control" placeholder="Value">
		                   <div id="addRangeStart_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	
				</form>
				
				
				<div class="modal-footer">
				
           					<div class="clearfix"></div>
							<div class="space"></div>
								
								
						 <div class="topbuttonholder">
						 	<div style="float:right;">
						
								<button  class="btn btn-sm btn-primary" onClick="doAdd(0);"><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button  class="btn btn-sm btn-primary" onClick="doAdd(1);"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
                    			<button  class="btn btn-sm btn-danger" onClick="reload();"><i class='fa fa-times'></i>Cancel</button> 
					
							</div>
							</div>
						<div class="clearfix"></div>
						</div>
				
				
		
		
				
				
			</div></div></div></div>
			
			 -->
			
			
			<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 		<div class="modal-dialog">
    	<div class="modal-content">
    		
    		
        <div class="modal-header">
        	<button type="button" class="close" onclick="location.reload()" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add BU Setting</h4>
      	</div>
      	
      	<div id="success-msg"></div>
      		<div class="modal-body">
      		<form id="addform" class="form-horizontal" name="addform" >
      		<input type="hidden" id="addPartyID" name="partyId">

					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Type <span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								 <select name="settingType" id="addAssumeType" onfocus="getClear()" class="input-xxlarge"></select>
							</div>
						</div>

					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Name <span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								  <select name="attributeCodeId" id="addCodeValueId" onfocus="getClear()" class="input-xxlarge"></select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
      				
      				
           			<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Value<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" class="col-xs-12 col-sm-6" name="attributeValue" id="addCodeValue"  onfocus="getClear()" placeholder="Value">
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Data Type<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<select name="dataTypeId" id="addDataType" class="input-xxlarge" ></select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Defalut Value<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="defaultValue" id="addDataTypeValue" class="col-xs-12 col-sm-6" placeholder="Default Value">			
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
								<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Start Range</label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="startRange" id="addRangeStart" class="col-xs-12 col-sm-6" >			
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
								<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >End Range</label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="endRange" id="addRangeEnd" class="col-xs-12 col-sm-6" >			
							</div>
						</div>
					</div>
					<div class="space-2"></div>
				</div>
					
					<div class="modal-footer">
						  
                    			
                    			<button  class="btn btn-sm btn-primary" onClick="doAdd(0);"><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button  class="btn btn-sm btn-primary" onClick="doAdd(1);"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								</form> 
								<button  class="btn btn-sm btn-danger"  class="close"  onClick="reload();"><i class='fa fa-times'></i>Cancel</button>
							
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
        <h4 class="modal-title" id="myModalLabel">Edit BU Setting</h4>
      	</div>
      	
      	<div id="success-msg"></div>
      		<div class="modal-body">
      	
      		
      		
				<input type="hidden" name="partyId" id="partyId">
		<input type="hidden" name="partySettingId" id="partySettingId">
		

					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Type <span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								 <select name="settingType" id="settingType" class="input-xxlarge"></select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Name <span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								  <select name="attributeCodeId" id="attributeCodeId" class="input-xxlarge"></select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
      				
      				
           			<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Value<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" class="col-xs-12 col-sm-6" name="attributeValue" id="attributeValue"  placeholder="Value">
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Data Type<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<select name="dataTypeId" id="dataTypeId" class="input-xxlarge" ></select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Defalut Value<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="defaultValue" id="defaultValue" class="col-xs-12 col-sm-6" placeholder="Default Value">			
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
								<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Start Range</label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="startRange" id="startRangess" class="col-xs-12 col-sm-6" >			
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					 
								<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >End Range</label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<input type="text" name="endRange" id="endRangess" class="col-xs-12 col-sm-6" >			
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					   
		                 
					
					
 


				</div><!-- modal body end -->
					
					<div class="modal-footer">
						  
                    				<button  class="btn btn-sm btn-primary"  onclick="updateSetting();" ><i class='ace-icon fa fa-plus'></i>Save</button>
								<button  class="btn btn-sm btn-danger"  class="close" data-dismiss="modal" ><i class='fa fa-times'></i>Cancel</button>
								
								
					</div>
					</form>
			</div>
		</div>
			</div>	
			
			
			
			
			
			<!-- <div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Setting</h4>
      </div>
      <div class="modal-body">
			
				<div class="heading_contactform">
					<h3>Add Role</h3>
				</div>
				<form id="editForm" name="editForm">
				
						
		
				<input type="hidden" name="partyId" id="partyId">
		<input type="hidden" name="partySettingId" id="partySettingId">
		
		
		
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="settingType">Type<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                  <select name="settingType" id="settingType" class="input-xxlarge" style="width:300px; float:left;">
		                  </select>
		                   <div id="settingType_error" class="help-block hide">Please select type.</div>
		                </div> 
		              </div>  
           			</div>
          
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="attributeCodeId">Name<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                  <select name="attributeCodeId" id="attributeCodeId" class="input-xxlarge" style="width:300px; float:left;">
		                  </select>
		                   <div id="attributeCodeId_error" class="help-block hide">Please select type.</div>
		                </div> 
		              </div>  
           			</div> 		
           		     			
          
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="attributeValue"> Value <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="attributeValue" id="attributeValue" class="form-control" placeholder="Value">
		                   <div id="attributeValue_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	
           			
           				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="dataTypeId">Data Type<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                  <select name="dataTypeId" id="dataTypeId" class="input-xxlarge" style="width:300px; float:left;"></select>
		                   <div id="dataTypeId_error" class="help-block hide">Please select type.</div>
		                </div> 
		              </div>  
           			</div>
           		
         
           	
						  			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="defaultValue">Default Value <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="defaultValue" id="defaultValue" class="form-control" placeholder="Value">
		                   <div id="defaultValue_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	
						
							  			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="startRange">Range Start Value </label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="startRange" id="startRangess"  class="form-control" placeholder="Value"></span>
		                   <div id="startRange_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	

							  			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="endRange">Range End Value </label>
		                <div class="col-sm-9">
		                  
		                 <input type="text" name="endRange" id="endRangess" class="form-control" placeholder="Value"></span>
		                   <div id="endRange_error" class="help-block hide">Please provide a valid value.</div>
		                </div> 
		              </div>  
           			</div>	
						
						
						 
						
						
						 
					
					
				</form>
				
				<div class="modal-footer">
						<div class="space-2"></div>
				
					 
						<div class="modal-footer">					
								<button  class="btn btn-sm btn-primary"  onclick="updateSetting();" ><i class='ace-icon fa fa-plus'></i>Save</button>
								<button  class="btn btn-sm btn-danger"  class="close" data-dismiss="modal" ><i class='fa fa-times'></i>Cancel</button>
								
								
								
							</div>
				
				
				
						
				</div>
						
				<div class="clearfix"></div>
				
				
			</div></div></div></div> -->
			
			
			
				<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Message</h4> 
		<!-- <div id="deletenote"> -->
			Do you want to delete this Biz Unit Setting items ? Please confirm.
					<div style="float: right;">
						
					
								
										<button id="" class="btn btn-sm btn-primary"  onclick="confirmDelete();" ><i class='ace-icon fa fa-plus'></i>Yes</button>
										<button id="" class="btn btn-sm btn-danger"  class="close" data-dismiss="modal" ><i class='fa fa-times'></i>No</button>
						
								
						
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
			

 <div class="navbar-inverse">
	<div class="container">
    <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    
	</div>
    <div class="collapse navbar-collapse paddingleft"> 
  
      </div>
    </div>
 </div>

 <div class="container white">
    	
    	
    		 
				<div class="col-md-12" style="text-align: right;">
				
					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
						
						<form>
       
       
      </form>
						
					

						
						</div>
						
					</div>
					

				</div>
    	
 
       

	  	
</div>           	
<!-- Center part End -->          

<footer>
<jsp:include page="../common/footer.jsp" />
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	
</footer>
<script>
function addNote(){
//$("#addnote").show();	
$("#deletenote, #editnote").hide();	
$('#addnote').modal('show');
/* $("#popUpAlertaddnote").css ('left','450px');
$("#popUpAlertaddnote").css ('top','125px');
$("#popUpAlertaddnote").css ('height','520px');
$("#popUpAlertaddnote").css ('width','650px'); */
}

function deleteNote(){
/* $("#deletenote").show(); */	
$('#deletenote').modal('show');
$("#addnote, #editnote").hide();	
/* $("#popUpAlertaddnote").css ('left','580px');
$("#popUpAlertaddnote").css ('top','260px');
$("#popUpAlertaddnote").css ('height','250px');
$("#popUpAlertaddnote").css ('width','300px'); */

}
function editNote(){ 

$('#editnote').modal('show');
$("#addnote, #deletenote").hide();


}
</script>
<script type="text/javascript">
$(function() {
	

   		 
	codeValue();     
	//codevalue1();

	});

</script>

<script type="text/javascript">
			var grid_data = ${SettingList}
			
			
			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8}
			];
			
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
					colNames:[' ', ' ','Setting Type','Setting Name','Setting Value','Value Type'],
					colModel:[
					
					          
{name:'myac',index:'', width:30, fixed:true, sortable:false, resize:false,


	 formatter: function(cellvalue, options,rowObject) {
	                
	                return '<a href="#" onclick="editSetting('+rowObject.partySettingId+');" id="SPBUProfSettingsEditLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
	                											
	}
}, 



  {name:'chkdeleteselect',index:'', width:30, sortable:false,formatter:function(cellvalue, options,rowObject) {
      return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.partySettingId+'" id="chkdeleteselect" name="chkdeleteselect">';
  }}, 

					          
						{name:'settingTypeValue',width:50,index:'settingTypeValue'} ,
					 	{name:'codevalue',index:'codevalue',width:50},
							{name:'attributeValue',index:'attributeValue'},
						{name:'dataType',index:'dataType'}/*,
						{name:'commName',index:'commName', sorttype:"int"},
						{name:'Action',index:'Action'}  */
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,30],
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
							.wrapInner('<div class="widget-header" />');
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
		</script>

</body>
</html>