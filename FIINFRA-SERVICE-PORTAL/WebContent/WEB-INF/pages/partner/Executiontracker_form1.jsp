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
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
    
<style>

#ui-id-1{
	width:168px!important;
	padding-left:20px!important;}
#ui-id-2{
	width:168px!important;
	padding-left:24px!important;}
.ui-menu-item{
	list-style:none !important;}
.ui-corner-all{
	margin-left:-10px!important;}
.ui-helper-hidden-accessible{color:#000;}

</style>  
 <!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>-->
 <script>
	$(function() {
		var availableTags = [
			"ActionScript",
			"AppleScript",
			"Asp",
			"BASIC",
			"C",
			"C++",
			"Clojure",
			"COBOL",
			"ColdFusion",
			"Erlang",
			"Fortran",
			"Groovy",
			"Haskell",
			"Java",
			"JavaScript",
			"Lisp",
			"Perl",
			"PHP",
			"Python",
			"Ruby",
			"Scala",
			"Scheme"
		];
		$( "#tags" ).autocomplete({
// 			source: availableTagsendrange1
			
		});
		
	});
	</script>

<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>

<script type="text/javascript">
/* function addSetting()
{
//	alert("Hi");
	//codeValue();
	resetVal();
	codeValue(); 
	popup('popUpAlertaddnote');
	} */
	
	 function PCurl(){
		 var partnerId=$('#quickSearchHiddenpart').val();
		 var clientId =$('#quickSearchHidden').val();
		 
		  window.location.href= $('#contextPath').val()+'/spexecution/loadPripintedList.htm?partnerId='+partnerId+"&clientId="+clientId;
<%-- 		  <li id="SPPrePrintedFormLink" class="active"><a href="<%=request.getContextPath()%>/spexecution/loadPripintedList.htm">Preprinted Form    	</a></li> --%>
		 }
	
	function quickSearchContacts(e){
			
			var event = window.event ? window.event : e;
			//alert(event.keyCode);
			$('#quickSearchHiddenpart').val()
			if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
				return;
			if(event.keyCode==13){
				search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			//alert($('#quickSearch').val());
		$.ajax({
			  url: $('#contextPath').val()+"/birtreport/getClientList.htm?searchString="+$('#quickSearch').val()+"&partnerId="+$('#quickSearchHiddenpart').val(),
					  
			  method:"post",
			  success:function(result){
	 
				 
				  var userLabelValueList = new Array();
					 $(result).each(function(i,obj){
							var object = {};
							object.value = obj.partyID;
							object.label = obj.clientName;
						/* alert("obj.partyID :::::"+obj.partyID);
						alert("obj.clientName :::::"+obj.clientName); */
						
							userLabelValueList.push(object);
						
					 }); 
					 
					 $("#quickSearch")
					    // don't navigate away from the field on tab when selecting an item
					    .bind( "keydown", function( event ) {
					      if ( event.keyCode === $.ui.keyCode.TAB &&
					    	$( this ).data( "ui-autocomplete" ).menu.active ) {
					        event.preventDefault();
					      }
					    })
					   
					    
					    .autocomplete({
					      minLength: 0,
					      source: function( request, response ) {
					       last=extractLast(request.term);
					       if(last==null || last=='' || last==' ')
							{
								return false;
							}
					       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
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
//	 					        	partyId=ui.item.value;
						        	$('#quickSearchHidden').val(ui.item.value)
							
						        terms.push( "" );
						        this.value = terms.join( "" );
						        
						        var labelArr = $(this).data('label') || new Array();
						        labelArr.push(ui.item);
						        $(this).data('label',labelArr);
						        console.log($(this).data());
						        
						        return false;
					      }
					    });
				  
					//resetVal();
//		 		 alert(availableTags);
			  }
			});

		}
		 function split( val ) {
			    return val.split( /;\s*/ );
			} 
			function extractLast( term ) {
			    return split( term ).pop();
			} 
   
function addquickSearchContacts(e){
		
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			search();
			return;
		}
		$('#common_popup_div,#shadow_div_web_app').remove();
		 $('.ui-autocomplete').css('z-index','9999999999999999');
		//alert($('#quickSearch').val());
	$.ajax({
		  url: $('#contextPath').val()+"/birtreport/getClientList.htm?searchString="+$('#addquickSearch').val()+"&partnerId="+$('#addquickSearchHiddenpart').val(),
				  
		  method:"post",
		  success:function(result){
 
			 
			  var userLabelValueList = new Array();
				 $(result).each(function(i,obj){
						var object = {};
						object.value = obj.partyID;
						object.label = obj.clientName;
					/* alert("obj.partyID :::::"+obj.partyID);
					alert("obj.clientName :::::"+obj.clientName); */
					
						userLabelValueList.push(object);
					
				 }); 
				 
				 $("#addquickSearch")
				    // don't navigate away from the field on tab when selecting an item
				    .bind( "keydown", function(event) {
				      if ( event.keyCode === $.ui.keyCode.TAB &&
				    	$(this).data("ui-autocomplete" ).menu.active ) {
				        event.preventDefault();
				      }
				    })
				   
				    
				    .autocomplete({
				      minLength: 0,
				      source: function( request, response ) {
				       last=extractLast(request.term);
				       if(last==null || last=='' || last==' ')
						{
							return false;
						}
				       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
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
// 					        	partyId=ui.item.value;
					        	$('#addquickSearchHidden').val(ui.item.value)
						
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
					        var labelArr = $(this).data('label') || new Array();
					        labelArr.push(ui.item);
					        $(this).data('label',labelArr);
					        console.log($(this).data());
					        
					        return false;
				      }
				    });
			  
				//resetVal();
//	 		 alert(availableTags);
		  }
		});

	}
	 function split( val ) {
		    return val.split( /;\s*/ );
		} 
		function extractLast( term ) {
		    return split( term ).pop();
		} 
function quickSearchPartner(e){

	var event = window.event ? window.event : e;
	//alert(event.keyCode);
	
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
		return;
	if(event.keyCode==13){
		search();
		return;
	}
	$('#common_popup_div,#shadow_div_web_app').remove();
	//alert($('#quickSearch').val());
$.ajax({
	  url: $('#contextPath').val()+"/birtreport/getPartnerList.htm?searchString="+$('#quickSearchpart').val(),
	  method:"post",
	  success:function(result){

		 
		  var userLabelValueList = new Array();
			 $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyID;

					object.label = obj.partnerName;
					userLabelValueList.push(object);
				/* 	alert("Hello:::::"+ obj.partyID);
					alert("Hi:::::::::"+obj.partnerName); */
					
			 }); 
//				 alert("object.label:::"+  object.label);
			 $("#quickSearchpart")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			      if ( event.keyCode === $.ui.keyCode.TAB &&
			    	$( this ).data( "ui-autocomplete" ).menu.active ) {
			        event.preventDefault();
			      }
			    })
			   
			    
			    .autocomplete({
			      minLength: 0,
			      source: function( request, response ) {
			       last=extractLast(request.term);
			       if(last==null || last=='' || last==' ')
					{
						return false;
					}
			       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
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
//					        	partyId=ui.item.value;
				        	$('#quickSearchHiddenpart').val(ui.item.value)
				//alert(""+ $('#quickSearchHiddenpart').val());
				        terms.push( "" );
				        this.value = terms.join( "" );
				        
				        var labelArr = $(this).data('label') || new Array();
				        labelArr.push(ui.item);
				        $(this).data('label',labelArr);
				        console.log($(this).data());
				        
				        return false;
			      }
			    });
		  
			//resetVal();
// 		 alert(availableTags);
	  }
	});

}
  
function editValidation()
{
//var a=$('#startRangess').val();
//var a1=$('#endRangess').val();
//var a2=$('#defaultValue').val();
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
	
	/*   if(a1<=a)
		  {
		  alert("Please enter end range value grather than start range value");
		  $('#endRangess').val('');
		  $('#startRangess').val('');
		  $('#startRangess').focus();
		  return false;
		  } 
	  if(a2>a1&&a2<a)
	  {
	    alert('Please enter corect default value');
	    alert("Enter Default  value");
		 $('#addDataTypeValue').val('');
		 $('#addDataTypeValue').focus();
         return false;
	  } */
	  
	  return true;
	
}	
function editEndValid()
{
	/* var a=$('#startRangess').val();
	var a1=$('#endRangess').val();
	var a2=$('#defaultValue').val(); */
	var start=0;
	start=$('#startRangess').val();
	var end=0;
	end=$('#endRangess').val();
	var defaultval=0;
	defaultval=$('#defaultValue').val();
	
	//alert(start+" "+defaultval+" "+end);
//alert('ok2');
	
if(start.length>0 ||end.length>0)
{

	 if((start==0))
	{
	 alert("Please Enter Start Range  Value.");
		 $('#startRangess').val('');
		// $('#addRangeEnd').val('');
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
		//alert('yes');
	  	$('#defaultValue').focus();
	  	return false;
	 }
	 if(start!="" && end!="" && (parseInt(defaultval, 10) > parseInt(end, 10)))
	{
	  	alert("Please Enter Default Value Between Start Range Value And End Range Value.");
		//alert('yes1');
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
	//alert(defaultval);
	
if(start.length>0 ||end.length>0)
	{
	if(($('#addRangeStart').val().trim()=="")) 
	  {
			 alert("Please Enter Start Range  Value.");
			// $('#addRangeStart').val('');
			// $('#addRangeEnd').val('');
			 $('#addRangeStart').focus();
	         return false;
	     }
	else if(($('#addRangeEnd').val().trim()=="")) 
	  {
			 alert("Please Enter End Range Value.");
			// $('#addRangeStart').val('');
			// $('#addRangeEnd').val('');
			 $('#addRangeEnd').focus();
	         return false;
	     }
	
	
	
	else if((start==0))
		{
		 alert("Please Enter Start Range  Value.");
			 $('#addRangeStart').val('');
			// $('#addRangeEnd').val('');
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
			// $('#addRangeEnd').val('');
			 $('#addRangeStart').val('');
		  $('#addDataTypeValue').focus();
		 }
	else if(end!="" && start!="" &&(parseInt(defaultval, 10) > parseInt(end, 10)))
	{
		  alert("Please Enter Default Value Less Than  End Range Value.");
		  $('#addDataTypeValue').val('');
			 $('#addRangeEnd').val('');
			// $('#addRangeStart').val('');
		  $('#addDataTypeValue').focus();
		 }
	
	
	
	/* if(start!="" && end!="" && (parseInt(defaultval, 10) < parseInt(start, 10)))
	{
	  	alert("Please Enter Default Value Between Start Range Value And End Range Value.");
		//alert('yes');
	  	$('#defaultValue').focus();
	  	return false;
	 }
	 if(start!="" && end!="" && (parseInt(defaultval, 10) > parseInt(end, 10)))
	{
	  	alert("Please Enter Default Value Between Start Range Value And End Range Value.");
		//alert('yes1');
	  	$('#defaultValue').focus();
	  	return false;
	 }
	 */
	
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
/* 	var a1=$('#addRangeEnd').val();
	var a=$('#addRangeStart').val();
	var a2=$('#addDataTypeValue').val(); */

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
	  if ( isNaN($('#addRangeStart').val())) 
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
	
/* 	  if(a<=a1)
	  {
	  alert("Please enter end range value grather than start range value");
	  $('#addRangeEnd').val('');
	  $('#addRangeStart').val('');
	  $('#addRangeStart').focus();
	  return false;
	  }
	  
	  if(a2>a&&a2<=a1)
		  {
		    alert('Please enter corect default value');
		//    alert("Enter Default  value");
			 $('#addDataTypeValue').val('');
			 $('#addDataTypeValue').focus();
	         return false;
		  } */
	  
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
		  alert('Please select at least one Record.');
		
		  }
	  else
		  {
		  popup('popUpAlertaddnote'); 
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
	  var a=0;
			$(result).each(function(i, obj) 
					{
				a++;	
		});
	 	  alert('Record deleted Successfully');
	  location.reload();		 			
  }
     
  }); 
}

function updateSetting()
{
	
	if(editValidation()== true && editEndValid()==true)
	{
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
					alert('Setting Updated Successfully');
		
					location.reload();
		}
	});
}
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
						 
					    
					//  alert(startRange1);
					 //  alert(endRange1);
					  //  alert(settingTypeValue);
					 //   alert(settingType);
					    if(settingType==undefined)
					    	{
					    	alert('Please Select Party Type');
					    	partySetting();
					    	
					    	}
					    else
					    	{
					    //		alert('yes');
					    		
					    		 $('#settingType').append('<option value="'+settingType+'">'+settingTypeValue+'</option>');
					    	}
					    
					    $('#attributeCodeId').append('<option value="'+attributeCodeId+'">'+codevalue+'</option>');
					     $('#dataTypeId').append('<option value="'+dataTypeId+'">'+dataType+'</option>');
					    
					
					     ($('#attributeValue').val(attributeValue));
					     ($('#defaultValue').val(defaultValue));
					     ($('#startRangess').val(startRange1));
					     ($('#endRangess').val(endRange1));
					     ($('#partyId').val(partyId));
					     ($('#partySettingId').val(partySettingId)); 
					           
					      
					
					});		
					popup('popUpAlertaddnote');
		}
		});
	

}
function reloads()
{
	location.reload();
}

function resetVal()
{
	$('#addDataTypeValue').val('');
	$('#addRangeStart').val('');
	$('#addRangeEnd').val('');
	$('#addCodeValue').val('');
}
function addExitSetting()
{
	
	if(addValidation()== true  && addEndValid()==true)
	{
	var abc=document.getElementById("addCodeValue").value;
	var aa = abc.trim();
	var addDataTypeValue=document.getElementById("addDataTypeValue").value;
	var addRangeStart=document.getElementById("addRangeStart").value;
	var addRangeEnd=document.getElementById("addRangeEnd").value;
	addRangeStart.trim();
	addRangeEnd.trim();
	addDataTypeValue.trim();
	abc.trim();
	
	var partyId=document.getElementById("partyIds").value;
	
	$.ajax({
		type :'POST',  
		url : $('#contextPath').val()+"/setting/getUniqueSetting.htm?partyId="+partyId+
		"&addCodeValueId="+$('#addCodeValueId').val(),
				success : function(result) 
				{

					
				//	alert(result);
					if(result==1)
						{
					//	alert("Party Setting Is modify");
						$.ajax({
							type :'POST',  
							url : $('#contextPath').val()+"/setting/addBizSetting.htm?partyId="+partyId+
							"&addAssumeType="+$('#addAssumeType').val()+
							"&addCodeValueId="+$('#addCodeValueId').val()+
							"&addDataTypeValue="+addDataTypeValue+
							"&addCodeValue="+aa+
							"&addDataType="+$('#addDataType').val()+
							"&addRangeStart="+addRangeStart+
							"&addRangeEnd="+addRangeEnd,
									success : function(result) 
									{
										//showAlertMessage1("Message","<br/>Setting has saved successfully.");
                                        //  alert("Party Setting Is modify");
						 				alert('Setting Updated Successfully');
										location.reload();
							}
							});
						}
					else
						{
						$.ajax({
							type :'POST',  
							url : $('#contextPath').val()+"/setting/addBizSetting.htm?partyId="+partyId+
							"&addAssumeType="+$('#addAssumeType').val()+
							"&addCodeValueId="+$('#addCodeValueId').val()+
							"&addDataTypeValue="+addDataTypeValue+
							"&addCodeValue="+aa+
							"&addDataType="+$('#addDataType').val()+
							"&addRangeStart="+addRangeStart+
							"&addRangeEnd="+addRangeEnd,
									success : function(result) 
									{
										//showAlertMessage1("Message","<br/>Setting has saved successfully.");

						 				alert('Setting Added Successfully');
										location.reload();
							}
							});
						}
					
//	 				alert('Setting Added Successfully');
					
		}
		});
	
	
	
/* 		 */

	}
}
function addNewSetting()
{

if(addValidation()== true && addEndValid()==true)
{
var abc=document.getElementById("addCodeValue").value;
var addDataTypeValue=document.getElementById("addDataTypeValue").value;
var addRangeStart=document.getElementById("addRangeStart").value;
var addRangeEnd=document.getElementById("addRangeEnd").value;
var partyId=document.getElementById("partyIds").value;

$.ajax({
	type :'POST',  
	url : $('#contextPath').val()+"/setting/getUniqueSetting.htm?partyId="+partyId+
	"&addCodeValueId="+$('#addCodeValueId').val(),
			success : function(result) 
			{

				
			//	alert(result);
				if(result==1)
					{
				//	alert("Party Setting Is modify");
					$.ajax({
						type :'POST',  
						url : $('#contextPath').val()+"/setting/addBizSetting.htm?partyId="+partyId+
						"&addAssumeType="+$('#addAssumeType').val()+
						"&addCodeValueId="+$('#addCodeValueId').val()+
						"&addDataTypeValue="+$('#addDataTypeValue').val()+
						"&addCodeValue="+$('#addCodeValue').val()+
						"&addDataType="+$('#addDataType').val()+
						"&addRangeStart="+$('#addRangeStart').val()+
						"&addRangeEnd="+$('#addRangeEnd').val(),
								success : function(result) 
								{
								//	alert('Result--------'+result);
									
									alert('Setting Updated Successfully');
									 $('#common_popup_div,#shadow_div_web_app').remove();
									resetVal();
						}
						});
					}
				else
					{
					$.ajax({
						type :'POST',  
						url : $('#contextPath').val()+"/setting/addBizSetting.htm?partyId="+partyId+
						"&addAssumeType="+$('#addAssumeType').val()+
						"&addCodeValueId="+$('#addCodeValueId').val()+
						"&addDataTypeValue="+$('#addDataTypeValue').val()+
						"&addCodeValue="+$('#addCodeValue').val()+
						"&addDataType="+$('#addDataType').val()+
						"&addRangeStart="+$('#addRangeStart').val()+
						"&addRangeEnd="+$('#addRangeEnd').val(),
								success : function(result) 
								{
								//	alert('Result--------'+result);
//						 			showAlertMessage("Setting saved successfully.");
									
									alert('Setting Added Successfully');
									 $('#common_popup_div,#shadow_div_web_app').remove();
									resetVal();
						}
						});
					}
				
// 				alert('Setting Added Successfully');
				
	}
	});



}

}

function attribute()
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
						     $('#attributeCodeId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
						    }
						
							});				
							
						
					
   		  }
   	
   	});
  
}
function partySetting()
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
						     $('#settingType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
						    }
							
							
							});				
							
						
					
   		  }
   	
   	});
  
}
function dataType()
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
								     $('#dataTypeId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
								    }
								
									
									});				
									
								
							
		   		  }
		   	
		   	});
		  
	
	
}
function codeValue()
{
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

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
</head>
<body>
<jsp:include page="../common/header.jsp" />
<%HttpSession hes=request.getSession();%>
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
		<input type="hidden" name="confirmdelete" id="confirmdelete"> 
<input type="hidden" name="partyIds" id="partyIds" value="<%=request.getAttribute("partyId")%>">
<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="reloads();" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3>Log Trouble Ticket</h3></div>
        <div id="poptable_contactform">
        	
             <div class="full">
              <input type="text" class="form-control" placeholder="Subject">
               </div>
                <div class="full" >
               <textarea class="form-control" rows="3" placeholder="Your Question" style="height: 100px;"></textarea>
			</div>
             <div class="full">
              <input type="text" class="form-control" placeholder="Attach File" >
              
               </div>
 </div>
   <div class="topbuttonholder">
        	<form><input class="dbtn" value="Send Email"   id="loginButton" type="button">	
            <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>  
        
	</div>
</div>
<!--css popup window 1 close-->
<!--css popup window start 2-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:650px; height:620px; top:100px; overflow: auto;" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="reloads();" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
<div id="addnote">
    <div id="popupwrapper_contactform">
   		<div class="heading_contactform" ><h3>Add Setting</h3></div>
        <div id="poptable_contactform" style="padding:10px; height:350px;">
        <form name="addSettings">
        	<span  class="searchpadding padding_top" style="float:left; width:150px;">Type    <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;">
<select name="addAssumeType" id="addAssumeType" class="form-control" style="width:300px; float:left;">
                                <option>Security</option>	
                                 <option>Assumption</option>
                                  <option>Recommend</option>
                                
                               
        </select>
        
</span>
        <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;"> Name  <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<select name="addCodeValueId" id="addCodeValueId" class="form-control" style="width:300px; float:left;">
                                <option>MinPasswordLength</option>	
                                 <option>MinPasswordLength
</option>
                                  <option>MinPasswordLength
</option> 
                               
                               
        </select></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Value  <span class="red">*</span>  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="addCodeValue" id="addCodeValue" class="form-control" placeholder="Value"></span>
<div class="clearfix"></div>
      
<span class="searchpadding padding_top" style="float:left; width:150px;">Data Type   <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<select name="addDataType" id="addDataType" class="form-control" style="width:300px; float:left;">
                                <option>Integer</option>	
                                 <option>Integer</option>
                              </select>
</span>
<div class="clearfix"></div>  
<span class="searchpadding padding_top" style="float:left; width:150px;"> Default Value <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="addDataTypeValue" id="addDataTypeValue" class="form-control" placeholder=" Default Value ">
</span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Range Start Value </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="addRangeStart" id="addRangeStart"  class="form-control" >
</span>
        <div class="clearfix"></div>
         <span  class="searchpadding padding_top" style="float:left; width:150px;"> Range End Value</span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="addRangeEnd" id="addRangeEnd"   class="form-control" ></span>
         <div class="clearfix"></div>
        </form>
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save & New" id="Save" onclick="addNewSetting()" type="button">	
            <input class="dbtn" value="Save & Close" id="Save" type="button" onclick="addExitSetting()" >	
            <input class="dbtn" onClick="reloads();" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
    
    
   
    <!-- delete-->
    <div id="deletenote">
    <div id="popupwrapper_contactform" style="height:100px;width:250px;">
   		
  		<div class="heading_contactform"><h3> Message</h3></div>
        <div id="poptable_contactform" style="padding:10px; height:100px;">
        	Do you want to delete this selected records? Please confirm.
 </div>
  <div class="topbuttonholder">
        	<form><input class="dbtn" value="Yes" id="Yes" type="button" onclick="confirmDelete()">	
            <input class="dbtn" value="No" id="No" type="button" onclick="popup('popUpAlertaddnote')">
           	</form>	
        </div>
        </div>
	</div>
    
    <!-- delete-->
    
     <!-- Edit-->
    <div id="editnote" style="left: 450px;top:125px">
    <form name="editForm" id="editForm" method="post">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Edit Setting </h3></div>
      <div id="poptable_contactform" style="padding:10px; height:350px;">
     
       <input type="hidden" name="partyId" id="partyId">
      <input type="hidden" name="partySettingId" id="partySettingId">
        	<span  class="searchpadding padding_top" style="float:left; width:150px;">Type    <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;">
<select name="settingType"  id="settingType"  name="settingType" onfocus="partySetting()" class="form-control" style="width:300px; float:left;">
                            <!--     <option>Security</option>	
                                 <option>Assumption</option>
                                  <option>Recommend</option> -->
                                
                               
        </select>
</span>
        <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;"> Name  <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<select name="attributeCodeId" id="attributeCodeId" class="form-control" onfocus="attribute()" style="width:300px; float:left;">
<!--                                 <option>MinPasswordLength</option>	
                                 <option>MinPasswordLength
</option>
                                  <option>MinPasswordLength
</option> -->
                                
                               
        </select></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Value  <span class="red">*</span>  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="attributeValue" id="attributeValue" class="form-control" placeholder=""></span>
<div class="clearfix"></div>
      
<span class="searchpadding padding_top" style="float:left; width:150px;">Data Type   <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<select   name="dataTypeId" id="dataTypeId"class="form-control" onfocus="dataType()" style="width:300px; float:left;">
                         <!--        <option>Integer</option>	
                                 <option>Integer</option> -->
                              </select>
</span> 
<div class="clearfix"></div>
<span class="searchpadding padding_top" style="float:left; width:150px;"> Default Value <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="defaultValue" id="defaultValue" class="form-control" placeholder="">
</span>
<div class="clearfix"></div>  
        <span class="searchpadding padding_top" style="float:left; width:150px;">Range Start Value </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="startRangess" id="startRangess" class="form-control" placeholder="">
</span> 
        <div class="clearfix"></div>
         <span  class="searchpadding padding_top" style="float:left; width:150px;"> Range End Value</span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" name="endRangess" id="endRangess" class="form-control"    placeholder=" "></span>
         <div class="clearfix"></div>
        
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save" id="Save" type="button" onclick="updateSetting()">	
           
            <input class="dbtn" onClick="popup('popUpAlertaddnote')" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
      </form>
	</div>
</div>
<!--css popup window 2 close-->
<!-- <div class="row headerstrip">
  <div class="headstrip"></div>
   
    </div>  -->
    
      <!--Nav Menu Start--> 
 <div class="navbar-inverse">
	<div class="container">
    <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    <!--<a class="navbar-brand" href="#"> </a>-->
	</div>
    <div class="collapse navbar-collapse paddingleft"> 
  <!--   	<ul class="nav navbar-nav">
       		<li  ><a href="serviceportal_landing.html" alt="Home" title="Home" onClick="Home">Home</a></li>
            <li ><a href="partner_dashboard.html"  alt="Partner" title="Partner" >Partner</a></li>
            <li><a href="opportunities.html"  alt="Opportunities" title="Opportunities" >Opportunities</a></li>
            <li><a href="client.html"  alt="Clients" title="Clients">Clients</a> </li>
            <li><a href="operation.html"  alt="Operation" title="Operation">Operation</a> </li>
             <li><a href="executiontracker.html"  alt="Execution" title="Execution">Execution </a> </li>
            <li><a href="chat.html" alt="Chat" title="Chat">Chat</a></li>
            <li><a href="#" alt="Tasks" title="Tasks">Tasks</a></li>
            <li><a href="query.html" alt="Query" title="Query">Query</a></li>
            <li><a href="report.html" alt="Reports" title="Reports">Reports</a></li>
            <li><a href="broadcast_list.html" alt="CRM Tools" title="CRM Tools">CRM Tools</a></li>
            <li class="active"><a href="bizunit.html" alt="Biz Unit" title="Biz Unit">Biz Unit</a></li>
            <li><a href="user_list.html" alt="Security" title="Security">Security</a></li>
            <li><a href="codetype_list.html" alt="Masters" title="Masters">Masters</a></li>
        </ul> -->
      </div>
    </div>
 </div>
<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 
<!-- </div>
</div> -->
<div class="container">
	<div class="portfoliostrip collapse navbar-collapse">
    	<ul class="navbar-sub"> 
             <li id="SPRTAFileUploadLink"><a href="<%=request.getContextPath()%>/seret/getUploadHistory.htm">RTA File Upload</a></li>
          
            <li id="SPPrePrintedFormLink" class="active"><a href="<%=request.getContextPath()%>/spexecution/loadPripintedList.htm">Preprinted Form    	</a></li>
          
        </ul>
	</div>        
  </div>   
 <!-- Center part start -->
 <div class="container white">
    	<div class="container-head">
        
   <!--    <div class="col-md-12" style="text-align: right;"><span style="float:left;">Execution Tracker for   -->
      
      
      
      	<div class="col-md-12" style="text-align: right;">
					<!-- accordion start-->
					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
						<form id="searchs" method="post">
							<div class="col-md-11" style="width: 96%;">
								<span style="float: left;">Execution Tracker for </span> <span
									class="col-md-10" style="float: right; margin-top: -3px;">
									<input name="searchtext" type="text" id="tags"
									placeholder="Quick Search">
								</span>
							</div>
						</form>
							<div class="accordion-heading">
								<a class="accordion-toggle " data-toggle="collapse"
									data-parent="#accordFundSel" href="#collapseFundSel"> 
									<!-- <span
									style="margin-top: 0px;" class="searchicon" alt="Search"
									title="Search"></span> -->
								</a>
							</div>

							<!-- accordion-body END -->
						</div>
						<!-- accordion-group END -->
					</div>
					<!-- accordion  END -->

					<!-- accordion End -->
				</div>
      
      
      
      
<!--       
 </span>
           </div > -->
          </div >
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      
        <!-- center -->
      
<%--       <div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px;padding-left:10px;">
            <div class="list-group">
        		<a class="list-group-item active" href="#">Sections</a>
               <a id="SPBUProfileGeneralLink" href="<%=request.getContextPath()%>/bizunit/loadviewprofile.htm?partyId=<%=hes.getAttribute("partyId")%>" class="list-group-item">General</a>
              	<a id="SPBUProfileWhiteLabelLink"  href="<%=request.getContextPath()%>/bizunit/loadwhitelabel.htm?partyId=<%=hes.getAttribute("partyId")%>" class="list-group-item">White Label</a>  	
                <a id="SPBUProfileSettingsLink"  class="list-group-item" href="#"><strong>Settings</strong></a>
              <a id="SPBUProfileAssumptionsLink" href="<%=request.getContextPath()%>/loadAssumptions.htm" class="list-group-item">Assumptions</a>  
                <!-- <a id="SPBUProfileAssumptionsLink" class="list-group-item" href="product_recommendation.html">Product Recommendation</a>   -->         </div>
           
        </div>	 --%>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
<%-- 						       <a href="loadwhitelabel.htm?partyId=<%=request.getAttribute("partyId") %>" class="list-group-item">White Label</a> --%>

			
			
 <!-- center -->
        
         <div class="list-group" style="width:1200px">
        		<a class="list-group-item active" href="#">Priprinted Form </a>
                <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel" style="margin-left:-5px;">
                <div class="accordion-group">
                  <div class="pull-left fundtool_left_col_head ">  </div>
                  <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <!-- <span style=" margin-top:0px;" class="searchiconb"  alt="Search" title="Search"></span> --> </a> </div>
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
                      <div style="width: 1500px;">
                        <!--1 search start -->
                       
                        <div class="filterbox searchpadding">
                          <div class="head">Setting Type</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Security </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Assumption</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Recommend</li>
                                                        </ul>
                          </div>
                        </div>
                     </div>
                    
                      <!-- accordion-inner END --> 
                  <div class="col-md-5">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                   
                    </div>
                    
                   
                    
                  </div>
                  <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
   <!-- accordion End -->
                
                	<%-- <form name="abcform" id="searchs" method="Post" action="<%=request.getContextPath()%>/testimonial/loadtestimonialsList.htm"> --%>

		<div class="searchboxreport">
		
		
			<span class="style1"><b>Partner Name </b></span>
			<input name="text" type="text" id="quickSearchpart" name="searchString" onkeydown="quickSearchPartner(this);" placeholder="Quick Search" autocomplete="off" style="width: 300px;">
			
			<input  type="hidden" id="quickSearchHiddenpart" name="searchPartnerId"  placeholder="Quick Search" style="width: 300px;">
			

			<span class="style1"><b>Client Name </b></span>
			<span ><input name="text" type="text" id="quickSearch" name="searchString" onkeydown="quickSearchContacts(this);"    placeholder="Quick Search" autocomplete="off" style="width: 300px;">
			<input  type="hidden" id="quickSearchHidden" name="searchClientId"  placeholder="Quick Search" style="width: 300px;">
				
				<span style=" margin-top:0px;">            <!--  url: $('#contextPath').val()+"/birtreport/getClientList.htm?searchString="+$('#quickSearch').val()+"&partnerId="+$('#quickSearchHiddenpart').val(), -->
			
			<input type="submit" name="submit" alt="search" value="" onclick="PCurl();" class="searchicon" style="border:none; padding-right:15px;padding-top:18px;"/>						
					</span></span>
			</div>	
			</form>		
  <div class="list-group-item">
  <div class="clearfix"></div>

 	<div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
			             
		
			              
			              
                     			<display:table name="trackData" uid="objPortalUser"
							class="table table-hover table-bordered table-striped"
							requestURI="#" sort="list" pagesize="${size}" id="data">


							<display:column title="Product" property="formName" sortable="true"></display:column>
							<display:column title="Form Name" property="formName" sortable="true"></display:column>
							<display:column title="Generated On" property="generatedOn" sortable="true"></display:column>

				
			
						</display:table> 
			              
			                        

     </div> 
     </div>
 
				<div class="col-sm-7">

					<ul class="pagination pagination-sm"
						style="float: left; margin-right: 20px;">
	
					</ul>



					<div class="topmenuleft">
						<div class="customDropdown">
						
							      <span >Page Size:</span>&nbsp;
     <!-- <select  type="button" name="pageSize" id="page" value="10"> -->
     <select  type="button" name="pageSize" id="page" onchange="pagesizeurl()">
     	
     	    <option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
           <option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
               <option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
               <option value="500" <c:if test="${size==500}"> selected="selected" </c:if>>500</option>
               <option value="10000">Show All&nbsp;</option>
     	
     	
     	<!-- <option selected="selected" value="10">10</option>
     	<option value="20">20</option>
     	<option value="50">50</option>
     	<option value="100">100&nbsp;</option> -->
     </select>  
						</div>
					</div>
					<div class="topmenuleft">

						<ul>
							<li>Export options:</li>
							<li><a
								href="<%=request.getContextPath()%>/spexecution/priprintedCSV.htm"
								title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
							<li><a
								href="<%=request.getContextPath()%>/spexecution/priprintedExcel.htm"
								title="Export in Excel" alt="Export in Excel"> <i
									class="excelicon"></i></a></li>
							<!--     <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
						</ul>



					</div>
				</div>
 
 	
  <!--   <div class="topmenu">
    <a id="SPBUProfSettingsAddNewLink" href="#" onClick="addNote();" class="pagerLink">
    <input type="button" class="dbtn createNewBtn" value="  New"   onClick="addSetting()" title="Save" alt="Save"></a>
    <a id="SPBUProfSettingsDeleteLink" href="#" onClick="deleteNote();" class="pagerLink" >
    <input  type="button" class="dbtn deleteBtn" value="  Delete"  onClick="deleteSetting()" title="Cancel" alt="Cancel"></a>
    </div> -->
	 <div class="clearfix"></div>
</div>


</div></div>      	<br/><br/>
       	</div>
</div>           	
<!-- Center part End -->          

<footer>
<jsp:include page="../common/footer.jsp" />
	<%-- <div class="row">
    <div class="bottomstrip">
                	<div class="container">
                     <div id="powerby"><img src="<%=request.getContextPath()%>/images/finfra_logo.png" > </div>
                   	 <div class="copyright">2013 Freedom Wealth Solutions Pvt. Ltd. All Rights Reserved.  | <a href="#"  onClick=>Terms Of Use </a>|  <a href="#">Privacy Policy</a></div>
                </div>
              
   	  </div></div>
		  <!-- END login-form -->
		<!-- </div>
</div> --> --%>
</footer>
<script type="text/javascript">

function pagesizeurl(){
	  var pageSize=$('#page').val();                 //spexecution/loadPripintedList.htm
	   window.location.href= $('#contextPath').val()+'/spexecution/loadPripintedList.htm?pageSize='+pageSize;
	 }
</script>

<script>
function addNote(){
$("#addnote").show();	
$("#deletenote, #editnote").hide();	
$("#popUpAlertaddnote").css ('left','450px');
$("#popUpAlertaddnote").css ('top','125px');
$("#popUpAlertaddnote").css ('height','520px');
$("#popUpAlertaddnote").css ('width','650px');
}

function deleteNote(){
$("#deletenote").show();	
$("#addnote, #editnote").hide();	
$("#popUpAlertaddnote").css ('left','580px');
$("#popUpAlertaddnote").css ('top','260px');
$("#popUpAlertaddnote").css ('height','250px');
$("#popUpAlertaddnote").css ('width','300px');

}
function editNote(){ 
$("#editnote").show();	
$("#addnote, #deletenote").hide();
$("#popUpAlertaddnote").css ('height','520px');
$("#popUpAlertaddnote").css ('width','650px');

}
</script>
<script type="text/javascript">
$(function() {
	

   		 
	codeValue();     
	//codevalue1();

	});

</script>

</body>
</html>