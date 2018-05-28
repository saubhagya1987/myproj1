<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>FAQ-List</title>



<script type="text/javascript"> 
function reloads()
{
	location.reload();
}

function pagesizeurl(){
	  var pageSize=$('#page').val(); 	
	   window.location.href= $('#contextPath').val()+'/faq/loadFaqLists.htm?pageSize='+pageSize;
	 }
	
function faqUpdate(id,bupartyid,faq,data)
{
	var select = document.getElementById("partyname");
    for(var i = 0;i < select.options.length;i++){
        if(select.options[i].value ==bupartyid  )
        {
            select.options[i].selected = true;
        }
    }
	
    if(select.options.length == 0)
    	{
    	bupartyName('edit',bupartyid);
    	}
    else
    	{
    	}
   
	faqmodulelist('edit',faq); 
	$('#source_list1').empty();  
		sourceid1(data);
		 document.getElementById("faqsId").value = id;
	
	$.ajax(
   			{ 				
   		  type: "POST",
   		
   		  url: $('#contextPath').val()+'/faq/getFaqDetail.htm?faqId='+id,	
   				  dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			$(result).each(function(i, obj) {
			
			   		
			   			
			   			    
			   			    var  question=obj.faqQuestionText;
			   				var  answer=obj.faqAnswerText;
			   				$('#editque').html(question);
			   				//alert(answer);
			   				$('#editans').html(answer);
			   				});
   		  }
   	
   	});
	}
	   function resetval()
	   {
			  
		   $('#anstext').val('');
		   $('#quetext').val('');
		   $('#anstext').html('');
		   $('#quetext').html('');
		   $('#bupartyname').val(0);
		   $('#qtype').val(0);
		   
		   
		    $('.pinToggles').filter(':checkbox').prop('checked',false);
		    $('#all1').filter(':checkbox').prop('checked',false);
		    
		  
	   	   toggleArea1(); 
				   }
	   function newfaqs()
	   {
		   bupartyName('add',0);
		   faqmodulelist('add',0);
		   sourceid();
		/*     popup('popUpAlertaddnote'); */
		    
	   }
	  
	   function Editfaq(isclose){
			//alert(	$('#ehiddeneditor').val());
			$('#ehiddeneditor').val($('#editque').text());
			//alert(	$('#ehiddeneditor').val());
			$('#eanshiddeneditor').val($('#editans').text());
		//	alert(	$('#eanshiddeneditor').val());
			jQuery.validator.addMethod("party", function (value, element) {
   	    	return response = ( $('#partyname').val() == '0' ) ? false: true ;
     		 }, "Biz Unit is required ");
			jQuery.validator.addMethod("faqsection", function (value, element) {
		    	return response = ( $('#qtypes').val() == '0' ) ? false: true ;
		       }, "Faq Section is required ");
			
		 var validator=$('#editform').validate({
			 
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
					
					name: {
							editor:true
					},
					partyname: {
						required: true,
						party:true
					},
					all:{
						required: true
					},
					qtypes: {
						required: true,
						faqsection:true
					},
					ehiddeneditor:{
						required: true,
						
					},
					eanshiddeneditor:{
						required: true,
						
					}				
					
				},

				messages: {
					ehiddeneditor: "Question Text is Required.",
					eanshiddeneditor: "Answer Text is Required.",
					all: "Please select source id.",
					name: "Question is Required.",
					editor: "Question is Required.",
					partyname:"Biz Unit is Required.",
					qtypes:"Faq Section is required."
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
					
					if(validator.form()){ // validation perform
						//alert("doadd");
						updatesFaq();
						
					}
				},
				invalidHandler: function (form) {
					
				}
			});
		}  
function updatesFaq()
{
	 document.getElementById("equetexthidden").value = $('#editque').html();
	 document.getElementById("eanstexthidden").value = $('#editans').html();
	
	 var values = [];
	    $('.pinToggles1:checked').each(function ()
	    		{
	        var e = $(this);
	        values.push(e.val());
	    });
	 
	 try
	 {
			$('#editsourceId').val(values);	 
		
	 }
	 catch(e)
	 {	 }
	
	$.ajax({
		type :'POST',  
		
		data:$('#editform').serialize(),
     url : $('#contextPath').val() +"/faq/updateFaq.htm",
				success : function(result) 
				{
					 bootbox.dialog({
	 						message: "<span class='bigger-110'>Faq Updated successfully</span>",
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
function selectAll()
{
	//source_list
	$('#source_list').checked=true;
	
}


function sourceid()
 {
	
var nav=0;
	   	$.ajax(
	   			{ 				
	   		  type: "POST",
	   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=31',
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  	{ 
				   			  $('#source_list').empty();
		   			 $.each(result, function( index, value ){
				
						   var module=value.codeValue;
					       var modulename=value.codeValueId;
					nav++;	
						 $('#source_list').append('<input type="checkbox" class="pinToggles" name="all" value="'+modulename+'"/>'+module+'<br>');
						
					});
					
		   			 //var slvals= document.getElementById("confirmdelete").value;	
		   			document.getElementById("addcount").value = nav;
	   		  	}
	   	
	   	});
	  
	   
 }

function test(id){
	
	var am='chk'+id;
	
	
	if ($('#'+am+'').is(":checked"))
	{
		
	     var flag = 0;
         $(".pinToggles1").each(function(){
             if(!$(this).is(":checked"))
             flag=1;
         });              
           if(flag == 0){ $("#all").prop("checked", true);}
           else{
         	  $("#all").prop("checked", false);
           }
		
	}
	else
		{
		 $("#all").prop("checked", false);
		}

	
	
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

	   	$.ajax(
	   			{ 				
	   		  type: "POST",
	   		  url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=31',
	   		  dataType: 'json',
			  contentType: 'application/json',
				//$('#source_list1').empty();  
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
					       	 $('#source_list1').append('<input type="checkbox" checked="true" id="chk'+modulename+'" onClick="test('+a[i]+');" class="pinToggles1" name="all" value="'+modulename+'"/>'+module+'<br>');
					       	 
					       	a.splice(i, 1);
					       	i=arr.length;
					       	 					       	
					       }
					    	   else
					    		   {
					    		   $('#source_list1').append('<input type="checkbox" id="chk'+a[i]+'" onClick="test('+a[i]+');" class="pinToggles1" name="all" value="'+modulename+'"/>'+module+'<br>');
					    		 	i=arr.length;
					    		   }
					       }
					});
					
						if(m==ab)
							{
							  $("#all").prop("checked", true);
							}
	   		  }
	   	
	   	});
	  
	   
 }
  

  function faqmodulelist(action,ids)
   {
	   	$.ajax(
	   			{ 				
	   		  type: "POST",
	   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=25',
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			 if(action=='edit')
				   			 {
						        	var id = '#qtypes';
						        	$('#qtypes').empty();
						        }else{
						        	
						        	var id = '#qtype';
						        	$('#qtype').empty();
						        	$("#qtype").append('<option value="0">----Select Faq Section----</option>');
						        }
						      $(result).each(function(i, obj) {
						          var module=obj.codeValue;
							        var modulename=obj.codeValueId;
								    if(ids == modulename)
								    {
							      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
							      	} else{
							      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
							      	}
								   });
				   	  }
	   	
	   	});
	  
	   
   }
          
  function bupartyName(action,ids)
   {
		
	   	$.ajax(
	   			{
	   					   				
	   		  type: "POST",
	   		  url: $('#contextPath').val()+'/faq/getBupartyname.htm',	
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			//alert(result);
				   			 if(action=='edit')
				   			 {
						        	var id = '#partyname';
						        	$('#partyname').empty();
						           	$("#partyname").append('<option value="0">----Select Biz Unit----</option>');
						        }else{
						        	
						        	var id = '#bupartyname';
						        	$('#bupartyname').empty();
						        	$("#bupartyname").append('<option value="0">----Select Biz Unit----</option>');
						   
						        }
				   			
										$(result).each(	function(i, obj) {
								
											var bupartyid=obj.buId;								        
											var bupartyname=obj.lastName; 									
										    if(ids == bupartyid)
										    {
										    	
									      		$(id).append('<option value="'+ bupartyid+'" selected="selected">'+ bupartyname + '</option>');
									      	} else{
									      		$(id).append('<option value="'+ bupartyid+'">'+ bupartyname + '</option>');	
									      	}
							});
	   		  }
	   	
	   	});

   }
 
   
   
   
   function deleteFaq()
   
   { 
 	  var slvals = []
 	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
 	  slvals.push($(this).val());
 	  })
 	 document.getElementById("confirmdelete").value = slvals;
	  if(slvals<=0)
		  { 
		  bootbox.dialog({
		  	message: "<span class='bigger-110'>Please select at least one Record.</span>",
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
		
		  //location.reload();
		  
		  }else{
			  deleteNote();
		  }

 	  
   };
   
   
	 function confirmDelete()
	{
		 var slvals= document.getElementById("confirmdelete").value;
		  $.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/faq/deleteFaq.htm?Lists="+slvals,
		
	  success : function(result) 
	  {	  
		  var a=0;
 			$(result).each(function(i, obj) 
 					{
					a++;	
			});
 			
 			 bootbox.dialog({
					message: "<span class='bigger-110'>Faq deleted successfully</span>",
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
   
	 function savefaq(isclose){
			$('#actionvalue').val(isclose);
			$('#hiddeneditor').val($('#quetext').text());
			//alert($('#hiddeneditor').val());
			$('#anshiddeneditor').val($('#anstext').text());
			//alert($('#anshiddeneditor').val());
			//alert('HIIEE'+	$('#hiddeneditor').val())
			
			jQuery.validator.addMethod("buparty", function (value, element) {
    	    	return response = ( $('#bupartyname').val() == '0' ) ? false: true ;
      		 }, "Biz Unit is required ");
			jQuery.validator.addMethod("faqsection", function (value, element) {
		    	return response = ( $('#qtype').val() == '0' ) ? false: true ;
		       }, "Faq Section is required ");
			
		 var validator=$('#xyzform').validate({
			 
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
					
					name: {
							editor:true
					},
					bupartyname: {
						required: true,
						buparty:true
					},
					all:{
						required: true
					},
					qtype: {
						required: true,
						faqsection:true
					},
					hiddeneditor:{
						required: true,
						
					},					
					anshiddeneditor:{
						required:true,
						
					}
				},

				messages: {
					hiddeneditor:"Question Text is Required.",
					anshiddeneditor:"Answer Text is Required.",
					all: "Please select source id.",
					name: "Question is Required.",
					editor: "Question is Required.",
					bupartyname:"Biz Unit is Required.",
					qtype:"Faq Section is required."
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
					
					if(validator.form()){ // validation perform
						//alert("doadd");
					doadd();
						
					}
				},
				invalidHandler: function (form) {
					
				}
			});
		}

	 
	 function doadd() 
		{	
		 var isclose=$('#actionvalue').val();
		 document.getElementById("quetexthidden").value = $('#quetext').html();
		 document.getElementById("anstexthidden").value = $('#anstext').html();
				 
	 	 var values = [];
		    $('.pinToggles:checked').each(function ()
		    		{
		        var e = $(this);
		        values.push(e.val());
		    });
		 
	 	 try
	 	 {
	 		$('#add_sourceId').val(values);	 
	 	 }
	 	 catch(e)
	 	 {
	 		 //alert("yes");
	 	 }
	 	 		$.ajax({
				type :'POST',
				data:$('#xyzform').serialize(),
				
		url : $('#contextPath').val() +"/faq/addFaq.htm",
				 success : function(result) 
				 {
			          
	              //alert('Record Added successfully');
	              $('#common_popup_div,#shadow_div_web_app').remove();
	             
	              if(isclose==1){
	            	  bootbox.dialog({
							message: "<span class='bigger-110'>Faq saved successfully</span>",
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
	            	
	              }else{
	            	  $('#success-msg').empty();	
					  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Faq saved successfully.</p></div>');
					  resetval();
	       	       	  addNote().show();
		             
	              }
	             
		  }
		});
	
		}
</script>
</head>

<body>
 		<jsp:include page="../common/header.jsp" />
		<!--css popup window start 1-->
		<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />

	<input type="hidden" id="addcount">
	<input type="hidden" id="editcount">
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 450px; height: 380px; top: 100px"
		id="popUpDiv">
		<div class="close" style="margin-right: 10px;">
			<a onClick="reloads()" href="#"><img alt=""
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
	</div>
	
	
	<!--css popup window 1 close-->
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
<!---------------------------------------------- delete start------------------------------------------------------------->
	
	<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Message</h4>
        	Do you want to delete this FAQ? Please confirm.
				 <div style="float:right;">
					<form>		
					  <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"> Yes</button>
					  <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
					   type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>	
					</form>
						</div>
						    </div>.					
				</div>
 		</div>
 		</div>
 <!--------------------------------------------------- delete End---------------------------------------------------------->


<!----------------------------------------------- Edit start---------------------------------------------------------------->
		<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
         <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h3 class="modal-title" id="myModalLabel">Edit FAQ</h3> 
      </div>
         <div class="modal-body">
              <form class="form-horizontal" id="editform" method="POST">
         	<input type="hidden" name="editque" id="equetexthidden">
			<input type="hidden" name="editans" id="eanstexthidden">
        	<input type="hidden" name="faqsId" id="faqsId">
          <!-- hideen field for editor validation -->
		
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Biz Unit">Biz Unit<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							  <select  id="partyname" name="partyname" class="form-control" ></select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
					 <input type="hidden" name="sourceId"  id="editsourceId">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="SourceID">Source ID<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<div id="showHideAll2" class="col-sm-9"> 
									    <div id="showHideAll1"> 
									 	<input type="checkbox" name="all" value="all" id="all">ALL
										</div>
									 <span  style="float: left; width: 400px;" id="source_list1" name="all"></span>
								</div>
						</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="FAQ Section">FAQ Section<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								 <select name="qtypes" class="form-control" id="qtypes">
								<option></option>
								</select>
						</div>
						</div>
					</div>
					<div class="space-2"></div>	
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Question Text">Question Text<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<div class="wysiwyg-editor" id="editque" ></div>
							<input type="hidden" id="ehiddeneditor" name="ehiddeneditor">			
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="AnswerText">Answer Text<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<div class="wysiwyg-editor" id="editans"></div>
							<input type="hidden" id="eanshiddeneditor" name="eanshiddeneditor">	
							</div>
						</div>
					</div>
					<div class="space-2"></div>
				
					 
						<div class="modal-footer">					
								<button id="SPAddNewfaqLink" class="btn btn-sm btn-primary"  onclick="Editfaq();" ><i class='ace-icon fa fa-plus'></i>Save</button>
								<button id="SPcloseaddfaqLink" class="btn btn-sm btn-danger"  onclick="reloads();" ><i class='ace-icon fa fa-plus'></i>close</button>
							</div>
							
			</form>
       		</div>
	 </div>
	 </div>
	 </div>
<!--------------------------------------------------------------- EditFaq END ------------------------------------------------------------------------------ -->



<!---------------------------------------------------- Add Faq Start ------------------------------------------------------------------------------------- -->
		<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
         <div class="modal-content">
         <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <h3 class="modal-title" id="myModalLabel">Add FAQ</h3> 
      </div>
      	<div id="success-msg"></div>
         <div class="modal-body">
           <form class="form-horizontal" id="xyzform" method="POST">
            <input type="hidden" name="actionvalue" id="actionvalue" value="">
            
         	<input type="hidden" name="quetext" id="quetexthidden">
         	<input type="hidden" name="anstext" id="anstexthidden">
          <!-- hideen field for editor validation -->

					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Biz Unit">Biz Unit<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							  <select  id="bupartyname" name="bupartyname" class="form-control" ></select>
							</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					<div class="form-group">
					  <input type="hidden" name="sourceId"  id="add_sourceId">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="SourceID">Source ID<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								<div id="showHideAll3" class="col-sm-9"> 
									    <div id="showHideAll"> 
									 	<input type="checkbox" name="all" value="all1" id="all1">ALL
										</div>
									 <span  style="float: left; width: 400px;" id="source_list" name="all"></span>
								</div>
						</div>
						</div>
					</div>
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="FAQ Section">FAQ Section<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
								 <select name="qtype" class="form-control" id="qtype">
								<option></option>
								</select>
						</div>
						</div>
					</div>
					<div class="space-2"></div>	
				
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Question Text">Question Text<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<div class="wysiwyg-editor" id="quetext" ></div>
							<div class="clearfix"></div>	
							<input type="hidden" id="hiddeneditor" name="hiddeneditor">								
							</div>
						</div>
					</div>
	
					<div class="space-2"></div>
					
					
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="AnswerText">Answer Text<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							<div class="wysiwyg-editor" id="anstext"></div>
							<input type="hidden" id="anshiddeneditor" name="anshiddeneditor">	
							</div>
						</div>
					</div>
					<div class="space-2"></div>
				
					
						<div class="modal-footer">
							<div class="clearfix">
								<button id="SPAddNewfaqLink" class="btn btn-sm btn-primary"  onclick="savefaq(0);" ><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button id="SPAddNewfaqLink" class="btn btn-sm btn-primary" onclick="savefaq(1);" ><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								<button id="SPcloseaddfaqLink" class="btn btn-sm btn-danger"  onclick="reloads();" ><i class='ace-icon fa fa-plus'></i>close</button>
							</div>
						</div>
				
			</form>
					<div>
		</div>
		</div>
		</div>
		</div>
		</div>
<!---------------------------------------- -----Add Faq END ------------------------------------------------------------------------------------------ -->
	

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
	
	<!--Nav Menu End-->
	<!--breadcrum Menu Start-->

						<div class="page-header">
							<h1 class="pull-left">FAQ List</h1>
                       	    <div class="clearfix"></div>
                         </div>
                            
                            

									<!-- Center part start -->
	<section>
	 		
			
			<div class="container-body" style="margin-top: 0px;">
				<!-- center -->
						<ul class="pagination pagination-sm">
						</ul>
				<div class="pull-right">
					
                   <button id="SPAddFAQLink" class="btn btn-sm btn-primary " onClick="addNote();newfaqs();"><i class='ace-icon fa fa-plus'></i> New FAQ</button>

				<!-- 	<a id="SPAddFAQLink" href="#" onClick="addNote();" class="pagerLink">
					<input data-params="{}" type="button" class="btn btn-sm btn-primary"
						value="  New FAQ " onClick="newfaqs();" title=" New FAQ"
						alt=" New FAQ"></a> -->
						
					 <a id="SPDeleteFAQLink" href="#" onClick="" class="pagerLink">
					 <input data-params="{}" type="button"	class="btn btn-sm btn-danger" value="  Delete"
						onClick="deleteFaq();" title="Delete"
						alt="Delete"></a> <input type="hidden" name="confirmdelete"
						id="confirmdelete">
				</div>
		<div class="clearfix"></div>
		
				<div class="table-responsive" id="display_table_lead" style="border: none;">
					<div id="toreload">
		            <table id="grid-table">   	                 
	                 </table>
	                 <div id="grid-pager"></div>
				
						<!-- Center-->
					</div>
					
				</div>


				
					<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >

						<span>Export options:</span>
							<a href="<%=request.getContextPath()%>/faq/faqCSV.htm"
								title="Export in CSV" alt="Export in CSV">	 <i class="fa fa-file-pdf-o bigger-140"></i></a>
							<a href="<%=request.getContextPath()%>/faq/faqExecl.htm"title="Export in Excel" alt="Export in Excel" >
										 <i class="fa fa-file-excel-o bigger-140"></i>
							</a>
							<!--     <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
						
					</div></div>				
				
			
				<div class="pull-right">
				<div class="hr-12"></div>
				   <button id="SPAddFAQLink" class="btn btn-sm btn-primary " onClick="addNote();newfaqs();"><i class='ace-icon fa fa-plus'></i> New FAQ</button>

					<!-- <a id="SPAddFAQLink" href="#" onClick="addNote();" class="pagerLink"><input data-params="{}"
						type="button" class="btn btn-sm btn-primary" value="  New FAQ "
						onClick="newfaqs();" title=" New FAQ" alt=" New FAQ"></a>  -->
						
						<a id="SPDeleteFAQLink"	href="#" onClick="" class="pagerLink">
						<input data-params="{}"
						type="button" class="btn btn-sm btn-danger" value="  Delete"
						onClick="deleteFaq();" title="Delete"
						alt="Delete"></a>
				</div>

		</div>
		</section>
	 



	<!-- Center part End -->

	<footer>
	  <jsp:include page="../common/footer.jsp" />
	  <script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>

	</footer>




	
<script>
	
	$('#showHideAll1').on('change', 'input[type=checkbox]', function () 
			{
		//alert('done');
		
	      if ($('#all').is(':checked')) {
	    	//alert("if");
	        $('.pinToggles1').prop('checked', true)
	    }
	    else {
	    	//alert("else");
	    $('.pinToggles1').prop('checked', false)
	    } 


	});
	 
	
	 $('#showHideAll2').on('change', 'input[type=checkbox]',function () {
	 
		$( ".pinToggles1" ).change(function() {
			///alert('yes');
          var flag = 0;
          $(".pinToggles1").each(function(){
          	//alret(i);
              if(!$(this).is(":checked"))
              flag=1;
          })              
            if(flag == 0){ $("#all").prop("checked", true);}
            else{
          	  $("#all").prop("checked", false)
            }
          
   
		});
		
  });
	   
  
	 
	 
		$('#showHideAll').on('change', 'input[type=checkbox]', function () 
				{
			
			
		      if ($('#all1').is(':checked')) {
		    	//alert("if");
		        $('.pinToggles').prop('checked', true)
		    }
		    else {
		    	//alert("else");
		    $('.pinToggles').prop('checked', false)
		    } 


		});
		 
		
		 $('#showHideAll3').on('change', 'input[type=checkbox]',function () {
		 
			$( ".pinToggles" ).change(function() {
			
	          var flag = 0;
	          $(".pinToggles").each(function(){
	          	//alret(i);
	              if(!$(this).is(":checked"))
	              flag=1;
	          })              
	            if(flag == 0){ $("#all1").prop("checked", true);}else{
	          	  $("#all1").prop("checked", false)
	            }
	          
	   
			});
			
	  });
		   
  
	</script>
	

	<script>
$(document).ready(function(){
		makeEditor('quetext,#anstext');
		makeEditor('editque,#editans');
	}); 
function addNote(){

		
$("#deletenote, #k").hide();
$("#searchs").hide();
$("#tags").hide();
$("#abcdefg").hide();
//$("#addnote").modal('show');
$("#addnote").modal({
    backdrop: 'static',
    keyboard: false
});

}

function deleteNote(){
$('#deletenote').modal('show'); 
$(" #editnote,#addnote").hide(); 
}
function editNote()
{
	
//$("#editnote").modal('show');
$("#editnote").modal({
    backdrop: 'static',
    keyboard: false
});

$("#addnote, #deletenote").hide();
$("#tags").hide();
$("#abcdefg").hide();
}


</script>


	<script>


  var area1, area2;
  $('#anstext').val('');
  $('#quetext').val('');
 
  function toggleArea1() {
				try{
                area1.removeInstance('anstext');
				}catch(e){
					
				}
	       
	       quetext.style.height = "40px";
	       anstext.style.height = "90px";
	              new nicEditor({maxHeight : 50}).panelInstance('quetext');
	              new nicEditor({maxHeight : 100}).panelInstance('anstext');
	           
  }
 
  function addArea2() {
	  try{
	  area2.removeInstance('quetext');
	  }catch(e)
	  {
			
		}
  }
  function removeArea2() {
        area2.removeInstance('myArea2');
  }
 </script>
<script type="text/javascript">
			
		
			/*  var grid_data=${faqList}; */
			
			 var grid_data=${faqList};
			
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
				
				jQuery(grid_selector).jqGrid({
					//direction: "rtl",
					data: grid_data,
					datatype: "local",
					height: 360,
					ignoreCase: true,
					colNames:[' ','','Biz Unit','FAQ Section','Question Text','Answer Text','Updated By','Updated on'],
					colModel:[
					
						{name : 'myac',width : 60, fixed : true, sortable : false, resize : false,
        				  formatter:function(cellvalue, options,rowObject) {
              				return '<a href="#" onclick="editNote();faqUpdate('+rowObject.faqId+',\''+rowObject.buPartyID+'\',\''+rowObject.faqModuleID+'\',\''+rowObject.sourceID+'\');"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
                                                                          
         				 }},
						
						
						
						{name:'',sortable:false,width:55,formatter:function(cellvalue, options,rowObject) {
						    return '<input role="checkbox" type="checkbox"  class="checkbox1" id="chkdeleteselect" value="'+rowObject.faqId+'" name="chkdeleteselect">';
						}},
						{name:'lastName'},
						{name:'codeValue'},
						{name:'faqQuestionText',width:300,cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'faqAnswerText',ShrinkToFit:true,width:300,cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'userName'},
						{name:'lastModifiedDate'},
					], 
				
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
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
			
					//autowidth: true,
					  width:'100%',
			
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
			$('#menu-wplook-sub-menu6').addClass('active');
			$('#SPFaqLink').addClass('active');

			</script>
</body>
</html>
