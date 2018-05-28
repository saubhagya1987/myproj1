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

<title>Product Revenue List</title>
<style type="text/css">
th.ui-th-column div {
   white-space: normal !important;
    height: auto !important;
    padding: 2px;
}
</style>

<!-- Placed at the end of the document so the pages load faster -->

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script> --%>
<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<%-- <link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
 --%>


 <script   type="text/javascript">
 
 

 
 
 
 
 
 
 
 
 
 
 
 $(document).ready(function() {
		
	/* 	var d = new Date();
		var month = d.getMonth()+1;
		var day = d.getDate();
		var output = (day<10 ? '0' : '') + day + '/' +
		(month<10 ? '0' : '') + month + '/' +
		d.getFullYear();
		$("#startDateId").val(output);
 	$("#startDateId").datepicker({
	       	showOn: 'button',
	       	minDate : '0',
	       	buttonText: 'Show date',
	       	buttonImageOnly: true,
	       	buttonImage: '../images/calendar.gif',
	       	dateFormat: 'dd/mm/yy',
	       	constrainInput: true,
	       	
	       	onSelect: function(selected) 
	        {
	        	$("#endDateId").datepicker("option","minDate", selected)
	        }
	});
	     	
	$("#endDateId").datepicker({
 	showOn: 'button',
   	minDate : '0',
   	buttonText: 'Show date',
   	buttonImageOnly: true,
   	buttonImage: '../images/calendar.gif',
   	dateFormat: 'dd/mm/yy',
   	constrainInput: true,
	});  */
	     	
	$("#startAmount").keypress(function (event) {
	//if the letter is not digit then display error and don't type anything
		if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
			event.preventDefault();
		    $("#errmsg").html("Please enter digits Only").show().fadeOut(2500);
		} // prevent if not number/dot
		var text = $(this).val();

	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
	        event.preventDefault();
	      $("#errmsg").html("You can enter only two digits after decimal").show().fadeOut(2500);
	    }
	});
			
	$("#endAmount").keypress(function (event) {
	//if the letter is not digit then display error and don't type anything
		if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
			event.preventDefault();
		    $("#errmsg").html("Please enter digits Only").show().fadeOut(2500);
		} // prevent if not number/dot
		var text = $(this).val();

	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
	        event.preventDefault();
	      $("#errmsg").html("You can enter only two digits after decimal").show().fadeOut(2500);
	    }
	});
			
	$("#endAmount").change(function(){
		var start = document.getElementById('startAmount').value;
		var end = document.getElementById('endAmount').value;
		//alert(end-start);
		if(end-start < 0){
			$("#errmsg").html("End amount must be greater than start amount").show().fadeOut(2500);
		    document.getElementById('endAmount').value = "";
		    $('#endAmount').focus();
		    return false;
		} else{
			$('#startYear').focus();
		}
		return true;
	});
			
	$("#startYear").keypress(function (e) {
	//if the letter is not digit then display error and don't type anything
		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			//display error message
			$("#errmsg1").html("Please enter digits Only").show().fadeOut(2500);
			return false;
		}
	});
	$("#endYear").keypress(function (e) {
		//if the letter is not digit then display error and don't type anything
		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	    //display error message
		   	$("#errmsg1").html("Please enter digits Only").show().fadeOut(2500);
		    return false;
		}
	});
	$("#endYear").change(function(){
		var start = document.getElementById('startYear').value;
 	var end = document.getElementById('endYear').value;
 	if(end-start < 0){
			$("#errmsg1").html("End year should be greater than start year").show().fadeOut(2500);
			document.getElementById('endYear').value = "";
			$('#endYear').focus();
			return false;
		} 
 	return true;
	});
	
	$("#endYear").change(function(){
		var start = document.getElementById('startYear').value;
 	var end = document.getElementById('endYear').value;
 	if(end-start < 0){
			$("#errmsg1").html("End year should be greater than start year").show().fadeOut(2500);
			document.getElementById('endYear').value = "";
			$('#endYear').focus();
			return false;
		} 
 	return true;
	});
	
	
	
	$('#trialRevenue').keypress(function (event) {
	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
	        event.preventDefault();
	      $("#errmsg2").html("Please enter digits Only").show().fadeOut(2500);
	    }

	    var text = $(this).val();

	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
	        event.preventDefault();
	      $("#errmsg2").html("You can enter only two digits after decimal").show().fadeOut(2500);
	    }
	});
	
	$('#upFrontRevenue').keypress(function (event) {
	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
	        event.preventDefault();
	      $("#errmsg3").html("Please enter digits Only").show().fadeOut(2500);
	    }

	    var text = $(this).val();

	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
	        event.preventDefault();
	      $("#errmsg3").html("You can enter only two digits after decimal").show().fadeOut(2500);
	    }
	});
	
	$('#oneTimeRevenue').keypress(function (event) {
	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
	        event.preventDefault();
	      $("#errmsg4").html("Please enter digits Only").show().fadeOut(2500);
	    }

	    var text = $(this).val();

	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
	        event.preventDefault();
	      $("#errmsg4").html("You can enter only two digits after decimal").show().fadeOut(2500);
	    }
	});
		
			
	});//document ready function ends here

</script> 

 
<script type="text/javascript">
	
		
	function saveRevenue(isToClose,action){
		if(checkRequiredVals() == true){
			doAdd(isToClose,action);
		} 
	}

	function checkRequiredVals(){
		//alert($('#revenueTypeId').val());
		if ($('#partyId').val().trim()=="") {
			alert("Please enter Revenue Level.");
			$('#addquickSearch').focus();
	        return false;
	    }
		if ($('#partyId').val().trim()=='0') {
			alert("Please enter Revenue Level.");
			$('#addquickSearch').focus();
	        return false;
	    }
		if ($('#startAmount').val().trim()=="") {
			alert("Please enter amount range.");
			$('#startAmount').focus();
	        return false;
	    }
		if ($('#endAmount').val().trim()=="") {
			alert("Please enter amount range.");
			$('#endAmount').focus();
	        return false;
	    }
		if ($('#startYear').val().trim()=="") {
			alert("Please enter start year.");
			$('#startYear').focus();
	        return false;
	    }
		if ($('#endYear').val().trim()=="") {
			alert("Please enter end year.");
			$('#endYear').focus();
	        return false;
	    }
		if ($('#revenueTypeId').val().trim()=="") {
			alert("Please enter revenue type.");
			$('#revenueTypeId').focus();
	        return false;
	    }
		if ($('#revenueTypeId').val()==51001) {
			if ($('#oneTimeRevenue').val().trim()=="") {
				alert("Please enter one time revenue.");
				$('#oneTimeRevenue').focus();
		        return false;
		    }
	    }
		if ($('#revenueTypeId').val()==51002) {
			if ($('#trialRevenue').val().trim()=="" && $('#upFrontRevenue').val().trim()=="") {
				alert("Please enter trail revenue or upfront revenue.");
				$('#trialRevenue').focus();
		        return false;
		    }
	    }
		if ($('#revenueTypeId').val()==51003) {
			if ($('#trialRevenue').val().trim()=="" && $('#upFrontRevenue').val().trim()=="") {
				alert("Please enter trail revenue or upfront revenue.");
				$('#trialRevenue').focus();
		        return false;
		    }
			if ($('#oneTimeRevenue').val().trim()=="") {
				alert("Please enter one time revenue.");
				$('#oneTimeRevenue').focus();
		        return false;
		    }
	    }
		return true;
	}
	
	function doAdd(closePopup,action){
		//alert($("#revenueForm").html());
		//alert(closePopup+":"+action);
		if(action=='edit'){
			
			if($('#revenueTypeId').val() == 51001){
				$('#trialRevenue').val(null);
				$('#upFrontRevenue').val(null);
			}
			
			if($('#revenueTypeId').val() == 51002){
				$('#oneTimeRevenue').val(null);
			}
		}
		
		
		$.ajax({
				type :'GET',
				url:$('#contextPath').val()+'/product/addOrUpdateProductRevenue.htm',
				data:$('#addRevForm').serialize(),
				success : function(result){
					//alert(result);
		            if(closePopup==1 && action=='edit'){
		            	//alert('Record updated successfully');
		            	 bootbox.dialog({
								message: "<span class='bigger-110'>Record updated successfully. </span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											//Example.show("Primary button");
											location.reload();
										}
									}
								}
							});
		            	
		            } else if(closePopup==1 && action=='add'){
		             //  	alert('Record added successfully');
		                bootbox.dialog({
							message: "<span class='bigger-110'>Record added successfully. </span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										//Example.show("Primary button");
										location.reload();
									}
								}
							}
						});
	            	
		            } else{
		            	//alert('Record added successfully');
		            	bootbox.dialog({
							message: "<span class='bigger-110'>Record added successfully. </span>",
							buttons: 			
							{
								"click" :
								{
									"label" : "OK!",
									"className" : "btn-sm btn-primary",
									"callback": function() {
										//Example.show("Primary button");
										location.reload();
									}
								}
							}
						});
		            	resetValues();
		            }
		  		}
		});
	}

	function resetValues(){
		/* document.getElementById("title").innerHTML="Add"; */
		
		
	//	$("#addnote").modal('show'); 
		
 	$("#addnote").modal({
		     backdrop: 'static',
		     keyboard: false
		 });

 
		
		var d = new Date();
		var month = d.getMonth()+1;
		var day = d.getDate();
		var output = (day<10 ? '0' : '') + day + '/' +
		  (month<10 ? '0' : '') + month + '/' +			
		  d.getFullYear();
		$("#startDateId").val(output);
		$("#endDateId").val('');
		$('#startAmount').val('');
		$('#endAmount').val('');
		$('#startYear').val('');
		$('#endYear').val('');
		$('#trialRevenue').val('');
		$('#upFrontRevenue').val('');
		$('#oneTimeRevenue').val('');
		$('#addquickSearch').val('');
		$('#partyId').val(0);
		$('#recordTypeId').val(14002);
		$('#revenueTypeId').val(51001);
		
		$("#fees").show();
		$("#commission").hide();
		$("#popUpAlertaddnote").css('height', '450px');
		document.getElementById('poptable_contactform1').style.height = '320px';
		//show add buttons
		$('#editbuttons').fadeOut('fast');
		$('#addbuttons').fadeIn('slow');
		$('#productRevBookId').val(0);
	} 
	
	function updateProductRevenue(prdbookid,revTypeId,startDt,endDt,startAmnt,endAmnt,styr,enyr,onetmRev,upFrntRev,trailRev,rectid,partyId,partyName){
		//alert(prdbookid+"->"+revTypeId + " : >" + startAmnt +">" + endAmnt+"->"+endAmnt+"->"+"->"+styr+"->"+enyr+"->"+onetmRev+"->"+upFrntRev+"->"+trailRev);
		
	//	$("#addnote").modal('show');  
		$("#addnote").modal({
	     backdrop: 'static',
	     keyboard: false
	 });
		
	alert(prdbookid+"->"+revTypeId + " : >" + startAmnt +">" + endAmnt+"->"+endAmnt+"->"+"->"+styr+"->"+enyr+"->"+onetmRev+"->"+upFrntRev+"->"+trailRev);
		
		/* document.getElementById("title").innerHTML="Edit"; commented by suvarna*/
		document.getElementById("productRevBookId").value = prdbookid;
		$("#startDateId").val(startDt);
		
		//$("#endDateId").val(endDt);
		if(endDt == NA)
		{
		$('#endDateId').val('');
		}
	else
		{
		$('#endDateId').val(endDt);	
		}
		
		$('#startAmount').val(startAmnt);
		$('#endAmount').val(endAmnt);
		$('#startYear').val(styr); 
		$('#endYear').val(enyr);
		
		$('#partyId').val(partyId); 
		$('#addquickSearch').val(partyName);
		
		document.getElementById("editStartAmount").value = startAmnt;
		document.getElementById("editEndAmount").value = endAmnt;
		
		document.getElementById("editStartYear").value = styr;
		document.getElementById("editEndYear").value = enyr;
		
		
		getRevenueType(revTypeId);
		getRecordType(rectid);
		//show commission or fees or both depend on id
		if (revTypeId == 51002) {
			$("#commission").show();
			$("#fees").hide();
			$("#popUpAlertaddnote").css('height', '505px');
			document.getElementById('poptable_contactform1').style.height = '365px';

		}

		else if (revTypeId == 51001) {
			$("#fees").show();
			$("#commission").hide();
			$("#popUpAlertaddnote").css('height', '500px');
			document.getElementById('poptable_contactform1').style.height = '320px';

		}
		
		else if (revTypeId == 51003) {
			$("#fees").show();
			$("#commission").show();
			document.getElementById('poptable_contactform1').style.height = '405px';
			$("#popUpAlertaddnote").css('height', '542px');
		}

		
		if(onetmRev==0)
			{
			$('#oneTimeRevenue').val('');
			}
		else
			{
			$('#oneTimeRevenue').val(onetmRev);	
			}
		if(upFrntRev==0)
		{
			$('#upFrontRevenue').val('');
		}
	else
		{
		$('#upFrontRevenue').val(upFrntRev);	
		}
	
		if(trailRev==0)
		{
			$('#trialRevenue').val('');
		}
	else
		{
		$('#trialRevenue').val(trailRev);	
		}
	//	$('#trialRevenue').val(trailRev);
				
		//show edit buttons
		$('#addbuttons').fadeOut('fast');
		$('#editbuttons').fadeIn('slow');
		
	}
	
	//get source
	function getRevenueType(id)
	{
		$.ajax
		({
	    	type: "GET",
	      	url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=51',
	      	dataType: 'json',
	      	contentType: 'application/json',
	        success:function(result)
	      	{ 		        
	        	$('#revenueTypeId').empty();
	        	$(result).each(function(i, obj) {
	     		var revenueType = obj.codeValue;
	      		var revenueTypeId = obj.codeValueId;
		      	if(id == revenueTypeId){
		      		$('#revenueTypeId').append('<option value="'+ revenueTypeId+'" selected="selected">'+ revenueType + '</option>');
	      		} else{
	      			$('#revenueTypeId').append('<option value="'+ revenueTypeId+'">'+ revenueType + '</option>');	
	      		}
	     		});
	      	}
	   });
	}
	
	function revenueTypeChange(id) {
		//alert(id);
		if ($('#revenueTypeId').val() == 51002) {
			$("#commission").show();
			$("#fees").hide();
			$("#popUpAlertaddnote").css('height', '505px');
			document.getElementById('poptable_contactform1').style.height = '365px';
		}

		else if ($('#revenueTypeId').val() == 51001) {
			$("#fees").show();
			$("#commission").hide();
			$("#popUpAlertaddnote").css('height', '465px');
			document.getElementById('poptable_contactform1').style.height = '320px';
		}
		
		else if ($('#revenueTypeId').val() == 51003) {
			$("#fees").show();
			$("#commission").show();
			
			//document.getElementById('poptable_contactform').style.height = '425px';
			//$('poptable_contactform1').css({"height":"425px !important;"});
			//$('#poptable_contactform1').removeClass('pcf').addClass('newpcf');
			document.getElementById('poptable_contactform1').style.height = '405px';
			$("#popUpAlertaddnote").css('height', '542px');
		}
	}
	
	function getRecordTypeList(){
		var id = $('#recordTypeId').val();
		//alert(id + ": " + $('#addquickSearch').val());
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			search();
			return;
		}
		//$('#common_popup_div,#shadow_div_web_app').remove();
		 $('.ui-autocomplete').css('z-index','9999999999999999');
		$.ajax
		({
	    	type: "GET",
	      	url:$('#contextPath').val()+'/product/getRecordTypeById.htm?id='+id+'&searchString='+$('#addquickSearch').val(),
	      	dataType: 'json',
	      	contentType: 'application/json',
	        success:function(result)
	      	{ 		   
	        	var userLabelValueList = new Array();
	        	$(result).each(function(i, obj) {
		     		//var recordType = obj.recordType;
		      		//var partyId = obj.partyId;
	        		var object = {};
					object.value = obj.partyId;

					object.label = obj.recordType;
					userLabelValueList.push(object);
		     	});
	        	
	        	
	        	
	        	 $("#addquickSearch")
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
					        	$('#partyId').val(ui.item.value)
						
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
	function split( val ) {
	    return val.split( /;\s*/ );
	} 
	function extractLast( term ) {
	    return split( term ).pop();
	} 
	

	function autovalid(){
		alert('Please select valid Revenue Level.');
		$('#addquickSearch').val('');
		$('#partyId').val('0');
		$('#addquickSearch').focus();
	}
		 
	function getRecordType(recid)
	{
		$.ajax
		({
	    	type: "GET",
	      	url:$('#contextPath').val()+'/product/getRecordType.htm',
	      	dataType: 'json',
	      	contentType: 'application/json',
	        success:function(result)
	      	{ 		        
	        	$('#recordTypeId').empty();
	        	$(result).each(function(i, obj) {
	     		var recordType = obj.recordType;
	      		var recordTypeId = obj.recordTypeId;
		      	if(recid == recordTypeId){
		      		$('#recordTypeId').append('<option value="'+ recordTypeId+'" selected="selected">'+ recordType + '</option>');
	      		} else{
	      			$('#recordTypeId').append('<option value="'+ recordTypeId+'">'+ recordType + '</option>');	
	      		}
	     		});
	      	}
	   });
	}
	
	function changePageSize(){
		var prodid = $('#masterProductId').val();
		var prodName = $('#prodname').val();
		var searchtext=$('#searchtext').val();
	 	$("#toreload").load('${pageContext.request.contextPath}/product/revenue_master.htm #toreload', {
		   object: '${object}',
		   pageSize: $('#page').val(),
		   id: prodid,
		   productName: prodName,
		   searchtext:searchtext,

	}, function( response, status, xhr ) {
	      try{
	        //closePopupWebApp('');
	      }catch(e){
	        // closePopupWebApp('');       
	      }
	     });
	}
	
	function checkAmountRange(){
		var startAmt = $('#startAmount').val().trim();
		var endAmt   = $('#endAmount').val().trim();
		var prodId   = $('#masterProductId').val();
		
		var oldsa = document.getElementById("editStartAmount").value;
		var oldea = document.getElementById("editEndAmount").value;
		//$.trim(oldea)==$.trim(newDt)
		
		if(startAmt != "" && endAmt != "" && ($.trim(oldsa)!=startAmt) && ($.trim(oldea)!=endAmt)){
			//alert('inn');
			$.ajax({
				type :'GET',
				//url : $('#contextPath').val()+"/product/checkProductRevenueRange.htm?productId="+prodId+"&StartAmount="+startAmt+"&endAmount="+endAmt+"&startYear="+startYr+"&endYear="+endYr,
				url:$('#contextPath').val()+'/product/checkProductRevenueRange.htm',
				data:$('#addRevForm').serialize(),
				success : function(result){
					if(result>0){
						alert('Product Revenue amount range already exist');
						document.getElementById('startAmount').value="";
	    				document.getElementById('endAmount').value="";
	    				$('#startAmount').focus();
					} 
		  		}
			});
		}
	}
	
	function checkYearRange(){
		var startYr  = $('#startYear').val();
		var endYr    = $('#endYear').val();
		var prodId   = $('#masterProductId').val();
		
		var oldsyr = document.getElementById("editStartYear").value;
		var oldeyr = document.getElementById("editEndYear").value;

		//if(startYr != "" && endYr != "" && (($.trim(oldsyr)!=startYr) && ($.trim(oldeyr)!=endYr)){
		if(startYr != "" && endYr != "" && (($.trim(oldsyr)!=startYr) || ($.trim(oldeyr)!=endYr))){
		//alert("Product Id: " + prodId + ","+"Start Amount"+startAmt+","+"End Amount "+endAmt+","+"Start Year : "+startYr+","+"End Year : "+endYr)
		
			$.ajax({
				type :'GET',
				//url : $('#contextPath').val()+"/product/checkProductRevenueRange.htm?productId="+prodId+"&StartAmount="+startAmt+"&endAmount="+endAmt+"&startYear="+startYr+"&endYear="+endYr,
				url:$('#contextPath').val()+'/product/checkProductRevenueYearRange.htm',
				data:$('#addRevForm').serialize(),
				success : function(result){
					if(result>0){
						alert('Product Revenue year range already exist');
						document.getElementById('startYear').value="";
						document.getElementById('endYear').value="";
	    				$('#startYear').focus();
					} 
		  		}
			}); 
		}  
	}
	</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" /> 
	<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />  
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	
	<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog"> 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">  Product Revenue &#45; ${prodName} </h4> 
      </div>  
      <div class="modal-body">    
			<!-- <div id="popupwrapper_contactform">  -->
   
 			<form id="addRevForm" method="post">
				<input type="hidden" name="productId" id="masterProductId" value="${productId}" />
				<input type="hidden" name="prodname" id="prodname" value="${prodName}" /> 
				<input type="hidden" name="productRevBookId" id="productRevBookId" />
				
				<input type="hidden" name="editStartAmount" id="editStartAmount">
				<input type="hidden" name="editEndAmount" id="editEndAmount">
				
				<input type="hidden" name="editStartYear" id="editStartYear">
				<input type="hidden" name="editEndYear" id="editEndYear">
 	      
  		       <div id="popupwrapper_contactform"> 
				 
				<div id="poptable_contactform1">
					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Revenue Level <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top" style="float: left; width: 153px;"> 
						<select id="recordTypeId" name="recordTypeId" class="form-control" onchange="getRecordTypeList();">
							<!-- <option value="14002">Biz Unit</option>
							<option value="14003">Partner</option>
							<option value="14005">Contact</option> -->
						</select>
					</span> 
					<span class="searchpadding padding_top" style="float: left; width: 153px;"> 
					</span>
					<span class="searchpadding padding_top"	style="float: left; width: 178px;  margin-left: 7px;">
						<input type="text" id="addquickSearch" name="addquickSearch" class="form-control" onKeyUp="getRecordTypeList();" onchange="autovalid();">
						
					</span> 
					<span class="searchpadding padding_top"	style="float: left; margin-top: 7px;">
						<!-- <i class="searchiconblue"></i> --> 
						<input  type="hidden" id="partyId" name="partyId">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 155px; margin-top: 7px;">Start Date <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"
						style="float: left; width: 400px; margin-top: 7px;"> 
						<input name="startDate" type="text" id="startDateId" readonly="readonly" style="float: left;">
						
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 155px; margin-top: 7px;">End Date </span> 
					<span
						class="searchpadding padding_top"
						style="float: left; width: 400px; margin-top: 7px;"> 
						<input name="endDate" type="text" id="endDateId" readonly="readonly" style="float: left;">
					</span>
					<div class="clearfix"></div>

					<span class="searchpadding padding_top"
						style="float: left; width: 155px; margin-top: 7px;">Amount Range <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"
						style="float: left; width: 153px; margin-top: 7px; ">
						<input type="text" id="startAmount" name="startAmount" class="form-control" maxlength="19" onchange="checkAmountRange();"></span> 
					<span
						class="searchpadding padding_top"
						style="float: left; width: 153px; margin-top: 7px;  margin-left: 7px;"> 
						<input type="text" id="endAmount" name="endAmount" class="form-control" maxlength="19" onchange="checkAmountRange();">
					</span>
					<span id="errmsg" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
					<div class="clearfix"></div>

					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Year Range <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"
						style="float: left; width: 153px;">
						<input type="text" id="startYear" name="startYear" class="form-control" maxlength="4" onchange="checkYearRange();"></span> 
					<span
						class="searchpadding padding_top"
						style="float: left; width: 153px;  margin-left: 7px;"> 
						<input type="text" id="endYear" name="endYear" class="form-control" maxlength="4" onchange="checkYearRange();">
					</span>
					<span id="errmsg1" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Revenue Type <span
						class="red">*</span>
					</span>  
					<span class="searchpadding padding_top"	style="float: left; width: 300px;"> 
						<select name="revenueTypeId" class="form-control" onChange="revenueTypeChange(this.value)" id="revenueTypeId">
							<!-- <option value="1" selected>Commission</option>
							<option value="2">Fees</option> -->
						</select>
					</span>
					<div class="clearfix"></div>

					<div id="commission" style="display: none;">
						<span class="searchpadding padding_top"
							style="float: left; width: 155px;">Trail Revenue % </span> 
						<span class="searchpadding padding_top" style="float: left; width: 153px;">
							<input id="trialRevenue" name="trialRevenue" type="text" class="form-control" maxlength="6">
						</span>
						<span id="errmsg2" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>

						<span class="searchpadding padding_top"
							style="float: left; width: 155px;">Upfront Revenue % </span> 
						<span class="searchpadding padding_top"	style="float: left; width: 153px;">
							<input id="upFrontRevenue" name="upFrontRevenue" type="text" maxlength="6" class="form-control">
						</span>
						<span id="errmsg3" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>

					</div>
					<div class="clearfix"></div>
					<div id="fees">

						<span class="searchpadding padding_top"
							style="float: left; width: 155px; margin-top: 7px;">One-Time Revenue % <span	class="red">*</span> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 153px ; margin-top: 7px;">
							<input id="oneTimeRevenue" name="oneTimeRevenue" type="text" class="form-control" maxlength="6"></span>
						<span id="errmsg4" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>
					</div>

				</div>

			</div>
  
       </form>
   <!--  </div>   -->  
	</div>     
	  
	 
	   
	<div class="modal-footer" id="addbuttons">  
		<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveRevenue(0,'add');">	Save &amp; New</button>
		<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveRevenue(1,'add');" >Save &amp; Close</button>
		<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div> 
	     
	<div class="modal-footer" id="editbuttons">  
		<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveRevenue(1,'edit');">	Save </button>
		<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div>   
	      
     </div> 
      
     </div>
    </div>  
	
	
	<%-- <div style="display: none; width: 650px; height: 450px; top: 100px" id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		<div id="addnote">  
			<form id="addRevForm" method="post">
				<input type="hidden" name="productId" id="masterProductId" value="${productId}" />
				<input type="hidden" name="prodname" id="prodname" value="${prodName}" /> 
				<input type="hidden" name="productRevBookId" id="productRevBookId" />
				
				<input type="hidden" name="editStartAmount" id="editStartAmount">
				<input type="hidden" name="editEndAmount" id="editEndAmount">
				
				<input type="hidden" name="editStartYear" id="editStartYear">
				<input type="hidden" name="editEndYear" id="editEndYear">
				
			<div id="popupwrapper_contactform"> 
				<div class="heading_contactform">  
					<h3><label id="title"> </label> Product Revenue &#45; ${prodName}</h3>
				</div>
				<div id="poptable_contactform1">
					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Revenue Level <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top" style="float: left; width: 153px;"> 
						<select id="recordTypeId" name="recordTypeId" class="form-control" onchange="getRecordTypeList();">
							<!-- <option value="14002">Biz Unit</option>
							<option value="14003">Partner</option>
							<option value="14005">Contact</option> -->
						</select>
					</span> 
					<span class="searchpadding padding_top"	style="float: left; width: 178px;">
						<input type="text" id="addquickSearch" name="addquickSearch" class="form-control" onKeyUp="getRecordTypeList();" onchange="autovalid();">
						
					</span> 
					<span class="searchpadding padding_top"	style="float: left; margin-top: 7px;">
						<!-- <i class="searchiconblue"></i> --> 
						<input  type="hidden" id="partyId" name="partyId">
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Start Date <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"
						style="float: left; width: 400px;"> 
						<input name="startDate" type="text" id="startDateId" readonly="readonly" style="float: left;">
						
					</span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">End Date </span> 
					<span
						class="searchpadding padding_top"
						style="float: left; width: 400px;"> 
						<input name="endDate" type="text" id="endDateId" readonly="readonly" style="float: left;">
						
					</span>
					<div class="clearfix"></div>

					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Amount Range <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"
						style="float: left; width: 153px;">
						<input type="text" id="startAmount" name="startAmount" class="form-control" maxlength="19" onchange="checkAmountRange();"></span> 
					<span
						class="searchpadding padding_top"
						style="float: left; width: 153px;"> 
						<input type="text" id="endAmount" name="endAmount" class="form-control" maxlength="19" onchange="checkAmountRange();">
					</span>
					<span id="errmsg" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
					<div class="clearfix"></div>

					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Year Range <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"
						style="float: left; width: 153px;">
						<input type="text" id="startYear" name="startYear" class="form-control" maxlength="4" onchange="checkYearRange();"></span> 
					<span
						class="searchpadding padding_top"
						style="float: left; width: 153px;"> 
						<input type="text" id="endYear" name="endYear" class="form-control" maxlength="4" onchange="checkYearRange();">
					</span>
					<span id="errmsg1" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
					<div class="clearfix"></div>
					<span class="searchpadding padding_top"
						style="float: left; width: 155px;">Revenue Type <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"	style="float: left; width: 300px;"> 
						<select name="revenueTypeId" class="form-control" onChange="revenueTypeChange(this.value)" id="revenueTypeId">
							<!-- <option value="1" selected>Commission</option>
							<option value="2">Fees</option> -->
						</select>
					</span>
					<div class="clearfix"></div>

					<div id="commission" style="display: none;">
						<span class="searchpadding padding_top"
							style="float: left; width: 155px;">Trail Revenue % </span> 
						<span class="searchpadding padding_top" style="float: left; width: 153px;">
							<input id="trialRevenue" name="trialRevenue" type="text" class="form-control" maxlength="6">
						</span>
						<span id="errmsg2" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>

						<span class="searchpadding padding_top"
							style="float: left; width: 155px;">Upfront Revenue % </span> 
						<span class="searchpadding padding_top"	style="float: left; width: 153px;">
							<input id="upFrontRevenue" name="upFrontRevenue" type="text" maxlength="6" class="form-control">
						</span>
						<span id="errmsg3" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>

					</div>
					<div id="fees">

						<span class="searchpadding padding_top"
							style="float: left; width: 155px;">One-Time Revenue % <span	class="red">*</span> </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 153px;">
							<input id="oneTimeRevenue" name="oneTimeRevenue" type="text" class="form-control" maxlength="6"></span>
						<span id="errmsg4" style="float:left; width:480px; padding-top: 10px;padding-left:153px;"></span>
						<div class="clearfix"></div>
					</div>

				</div>


				<div class="topbuttonholder" id="addbuttons">
					<input class="dbtn" value="Save & New" id="Save" type="button" onclick="saveRevenue(0,'add');">
					<input class="dbtn" value="Save & Close" id="Save" type="button" onclick="saveRevenue(1,'add');">
					<input class="dbtn" onClick="popup('popUpAlertaddnote');window.location.reload();" value="Cancel" id="Cancel" type="button">
				</div>
				
				<div class="topbuttonholder" id="editbuttons" style="display:none">
					<input class="dbtn" value="Save" id="Save" type="button" onclick="saveRevenue(1,'edit');">
					<input class="dbtn" onClick="popup('popUpAlertaddnote')" value="Cancel" id="Cancel" type="button">
				</div>
			</div>
			</form>
		</div>


		<!-- delete-->
		<div id="deletenote">
			<div id="popupwrapper_contactform"
				style="height: 100px; width: 250px;">

				<div class="heading_contactform">
					<h3>Message</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 100px;">
					Do you want to delete this selected records? Please confirm.</div>
				<div class="topbuttonholder">
					<form>
						<input class="dbtn" value="Yes" id="Yes" type="button"> <input
							class="dbtn" value="No" id="No" type="button">
					</form>
				</div>
			</div>
		</div>

		
	</div> --%>
	<!--css popup window 2 close-->


	<%-- <div class="container">
		<div class="portfoliostrip collapse navbar-collapse">
			<ul class="navbar-sub">
				<li id="SPCodeTypeLink"><a href="<%=request.getContextPath()%>/codetype/loadcodetypedata.html">Code Type</a></li>
            	<li id="SPNotificationTemplatesLink"><a href="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm">Notification Templates</a></li>
				<li id="SPNotificationEventsLink"><a href="<%=request.getContextPath()%>/notifyevent/getEventlist.htm">Notification Events</a></li>
            	<li id="SPProductLink" class="active"><a href="<%=request.getContextPath()%>/product/loadproductlist.htm">Product</a></li>
            	<li id="SPProductCatRevLink"><a href="<%=request.getContextPath()%>/product/category_revenue.htm">Product Category Revenue</a></li>
            	<li id="SPProductManufacturerLink"><a href="<%=request.getContextPath()%>/product/product_manufacturer.htm">Product Manufacturer</a></li>
			</ul>
		</div>
	</div> --%>
	<!-- Center part start -->
	<section>
	<div class="container-body" >
		<!-- <div class="container white"> -->
			<div class="container-head">
			
			 <div class="page-header clearfix">
            <h1 class="pull-left">Product Revenue List &#45; ${prodName} </h1>
            <div class="nav-search pull-right" id="">
              <form id="myForm1" method="post">
             <!--  <span  class="col-md-10" style="float:right; margin-top:-18px;"> 
                  					<input name="searchtext" type="text" id="searchtext"
										placeholder="Quick Search">
                  				</span> -->
              
                <%-- <span class="input-icon">
                <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                <i class="ace-icon fa fa-search nav-search-icon"></i></span> --%>
              </form>
             </div>  
           	    <!-- accordion-group END -->
              </div>
		  </div>
			
				<%-- <div class="col-md-12" style="text-align: right;">
					<!-- accordion start-->
					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
							<form id="myForm1" method="post">
							<div class="col-md-11" style="width: 96%;">
								<span style="float: left;">Product Revenue List &#45; ${prodName}</span> <span class="col-md-10"
									style="float: right; margin-top: -18px;"> 
									<input name="searchtext" type="text" id="searchtext"
										placeholder="Quick Search">
										</span>
							</div>
							</form>
							
							<!-- accordion-body END -->
						</div>
						<!-- accordion-group END -->
					</div>
					<!-- accordion  END -->


					<!-- accordion End -->
				</div> --%>
		
			<!-- <div class="container-body" > -->
				<!-- center -->
				<ul class="pagination pagination-sm"></ul>	
				  <div class="pull-right">
				  
				   <a id="SPProdRevMasterAddLink" href="#" onClick="getRevenueType(0);getRecordType(0);addNote();resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Product Revenue  "
						onClick="showButtons(0);" title="New Product Revenue"
						alt="New Product Revenue"> 
					</a>  		
				  

					<!-- <a id="SPProdRevMasterAddLink" href="#" onClick="getRevenueType(0);getRecordType(0);addNote();resetValues();">
					<input data-params="{}"
						type="button" class="dbtn createNewBtn"
						value="  New Product Revenue  "
						onClick="showButtons(0);" title="New Product Revenue"
						alt="New Product Revenue"></a> -->
				
				</div>
                <div class="clearfix"></div>
				
					<div class="table-responsive" id="display_table_lead" style="border:none;"> 
		  				<div id="toreload">
						<table id="grid-table"></table>      
			 			<div id="grid-pager"></div>      
					    </div>
				    </div>
  
				<!-- <div class="col-sm-7"> -->

					



				<%-- 	<div class="topmenuleft">
						<div class="customDropdown">
							<span>Page Size:</span>&nbsp; 
							<select  type="button" name="pageSize" id="page" onchange="changePageSize();">
								<option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
								<option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
								<option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
								<option value="100" <c:if test="${size==100}"> selected="selected" </c:if>>100</option>
								<option value="500" <c:if test="${size==500}"> selected="selected" </c:if>>500</option>
								<option value="10000">Show All&nbsp;</option>
							</select>
						</div>
					</div> --%>
					
						<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >
							<span>Export options: </span>

							<a id="csvExp" href="<%=request.getContextPath()%>/product/revenueExport.htm?id=${productId}&type=CSV" title="Export in CSV" alt="Export in CSV">

					<%-- 		<a id="csvExp" href="<%=request.getContextPath()%>/product/revenueExport.htm?id=${productId}&productName=${prodName}&type=CSV" title="Export in CSV" alt="Export in CSV"> --%>

							<i class="fa fa-file-pdf-o bigger-140"></i></a>
							
							<a id="excelExp" href="<%=request.getContextPath()%>/product/revenueExport.htm?id=${productId}&type=excel" title="Export in Excel" alt="Export in Excel"> 
							<i class="fa fa-file-excel-o bigger-140"></i></a>
						</div>
					</div>
	  
					
					
					<%-- <div class="topmenuleft">

						<ul>
							<li>Export options:</li>
							<li><a href="<%=request.getContextPath()%>/product/revenueExport.htm?id=${productId}&productName=${prodName}&type=CSV" title="Export in CVS" alt="Export in CVS"><i
									class="cvsicon"></i></a></li>
							<li><a href="<%=request.getContextPath()%>/product/revenueExport.htm?id=${productId}&productName=${prodName}&type=excel" title="Export in Excel"
								alt="Export in Excel"> <i class="excelicon"></i></a></li>
							
						</ul>



					</div>
			 --%>
				 <div class="pull-right">
        	       <div class="hr-12"></div>
					   <a id="SPProdRevMasterAddLink" href="#" onClick="getRevenueType(0);getRecordType(0);addNote();resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Product Revenue  "
						onClick="showButtons(0);" title="New Product Revenue"
						alt="New Product Revenue"> 
					</a>  		
				  
					
				</div>
			 </div> 

	<!-- 	</div> -->
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"> -->
	<script>
		function addNote() {

		//	$("#addnote").modal('show'); 
			
			$("#addnote").modal({
			     backdrop: 'static',
			     keyboard: false
			 });

			
			/* $("#deletenote, #editnote").hide();
			//$("#popUpAlertaddnote").css('height', '465px');
			$("#popUpAlertaddnote").css('width', '650px');
			$("#popUpAlertaddnote").css ('left','350px');
			$("#popUpAlertaddnote").css ('top','92px'); */
		}

		function deleteNote() {

			/* $("#deletenote").show();
			$("#addnote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '250px');
			$("#popUpAlertaddnote").css('width', '300px'); */
		}
		function editNote() {

			/* $("#editnote").show();
			$("#addnote, #deletenote").hide();
			$("#popUpAlertaddnote").css('height', '500px');
			$("#popUpAlertaddnote").css('width', '650px');
			$("#popUpAlertaddnote").css ('left','350px'); */
		}
 
		
	</script>


<script type="text/javascript">

var grid_data='${revBookList}'; 

index=JSON.parse(grid_data);  
   
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

		//subgrid options
		subGrid : false,
		//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
		//datatype: "xml",
		subGridOptions : {
			//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
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
		 
	 

		data: index, 
		datatype: "local",
		height:300,
		colNames:[' ','Revenue Level','Start Date <br> End Date','Start Amount <br> End Amount','Start Year <br> End Year','Revenue Type','One TimeRevenue <br> Upfront Revenue <br> Trail Revenue'],
		colModel:[
		     
			/* updateProductRevenue(${data.productRevBookId},${data.revenueTypeId},'${data.startDate}','${data.endDate}',
					'${data.startAmount}','${data.endAmount}','${data.startYear}','${data.endYear}','${data.oneTimeRevenue}',
					'${data.upFrontRevenue}','${data.trialRevenue}',${data.recordTypeId},${data.partyId},'${data.partyName}') */      
		          
			{name:'productRevBookId',index:'productRevBookId',formatter:function(cellvalue, options,rowObject) {
			return '<a href="#" onclick="showButtons(1);updateProductRevenue('+rowObject.productRevBookId+',\''+rowObject.revenueTypeId+'\',\''+rowObject.startDate+'\',\''+rowObject.endDate+'\',\''+rowObject.startAmount+'\',\''+rowObject.endAmount+'\',\''+rowObject.startYear+'\',\''+rowObject.endYear+'\',\''+rowObject.oneTimeRevenue+'\',\''+rowObject.upFrontRevenue+'\',\''+rowObject.trialRevenue+'\',\''+rowObject.recordTypeId+'\',\''+rowObject.partyId+'\',\''+rowObject.partyName+'\');" id="'+rowObject.productRevBookId+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			}},             
		    {name:'recordType',index:'recordType',width: 200}, 
			/* {name:'startDate  endDate',index:'startDateId  endDateId'}, */
			{name:'startDate',index:'startDate',width:200,formatter:function(cellvalue, options,rowObject) {
     	  	    
			    var html1='';
			    if(rowObject.startDate==null)
			    	{
			    	html1+='<span >'+"NA<br>"+'</span>';
			    	}
			    else{
			    	html1+='<span >'+rowObject.startDate+'<br>'+'</span>';
			    	}
			    if(rowObject.endDate==null)
		    		{
		    	html1+='<span >'+"NA<br>"+'</span>';
		    		}
		    	else{
		    	 
			    html1+='<span >'+rowObject.endDate+'<br>'+'</span>';
		    		}
  
			   
			    return html1; 
			
			}}, 
			
			{name:'startAmount', index:'startAmount',formatter:function(cellvalue, options,rowObject) {
     	  	    
			    var html='';
			    if(rowObject.startAmount==null)
			    	{
			    	html+='<span >'+"NA<br>"+'</span>';
			    	}
			    else{
			    	html+='<span >'+rowObject.startAmount+'<br>'+'</span>'
			    }
			    if(rowObject.endAmount==null)
		    	{
		    	html+='<span >'+"NA<br>"+'</span>';
		    	}
		    else{
		    	 
			    html+='<span >'+rowObject.endAmount+'<br>'+'</span>'
		    }
  
			   
			    return html; 
			
			        
			}},   
			{name:'startYear', index:'startYear',formatter:function(cellvalue, options,rowObject) {
     	  	    
			    var html='';
			    if(rowObject.startYear==null)
			    	{
			    	html+='<span >'+"NA<br>"+'</span>';
			    	}
			    else{
			    	html+='<span >'+rowObject.startYear+'<br>'+'</span>'
			    }
			    if(rowObject.endYear==null)
		    	{
		    	html+='<span >'+"NA<br>"+'</span>';
		    	}
		    else{
		    	 
			    html+='<span >'+rowObject.endYear+'<br>'+'</span>'
		    }
  
			   
			    return html; 
			
			        
			}},    
			  
			{name:'revenueType',index:'revenueType'}, 
			{name:'oneTimeRevenue', index:'oneTimeRevenue',width: 200,formatter:function(cellvalue, options,rowObject) {
     	  	    
			    var html='';
			if(rowObject.oneTimeRevenue==0.00)
			    	{
			    	html+='<span >'+"NA<br>"+'</span>';
			    	}
			 else{
			    	html+='<span >'+rowObject.oneTimeRevenue+'<br>'+'</span>';
			    }
			 if(rowObject.upFrontRevenue==0.00)
		    	{
		    	html+='<span >'+"NA<br>"+'</span>';
		    	}
		    else{
			    html+='<span >'+rowObject.upFrontRevenue+'<br>'+'</span>';
		    	}
			if(rowObject.trialRevenue==0.00)
		    	{
		    	html+='<span >'+"NA<br>"+'</span>';
		    	}
		    else{
			    html+='<span >'+rowObject.trialRevenue+'<br>'+'</span>';
		    	}
  
			   
			    return html; 
			
			        
			}}, 
			 
			 
			    
		],      
		
		
		viewrecords : true,
		rowNum:10, 
		rowList:[10,20,50,100,1000],
		pager : pager_selector,
		altRows: true,
		//toppager: true,
		//multiselect: true, 
		//multikey: "ctrlKey",
        multiboxonly: true,
    	//height:"auto",
		
    	
    	loadComplete : function() {
			var table = this;
			setTimeout(function(){
				styleCheckbox(table);
				if($('#selectAll').attr('id')==undefined)
				$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll">');
				updateActionIcons(table);
				updatePagerIcons(table);
				enableTooltips(table);
				$('#selectAll').click(function(event) {  //on click 
			        if(this.checked) { // check select status
			            $('.cbox').each(function(i,obj) { //loop through each checkbox
			                this.checked = true;  //select all checkboxes with class   "checkbox1"    
						$(obj).attr('checked','checked');
			            });
			        }else{
			            $('.cbox').each(function(i,obj) { //loop through each checkbox
			                this.checked = false; //deselect all checkboxes with class "checkbox1"
			            	$(obj).removeAttr('checked');
			            });         
			        }
			        $('#selectAll').checked = true;
			    });
				
			}, 0); 
			
		},  

		editurl: "/dummy.html",//nothing is saved
		//caption: "jqGrid with inline editing"

		autowidth: true,
        	

		 

	});
	$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
	
	

	

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
 
$(document).ready(function() {
	var d = new Date();
	var month = d.getMonth()+1;
	var day = d.getDate();
	/* var output = (day<10 ? '0' : '') + day + '/' +
				(month<10 ? '0' : '') + month + '/' +
				d.getFullYear(); */
	 var output = d.getFullYear() + '-' +
	 			  (month<10 ? '0' : '') + month + '-' +			
	 			  (day<10 ? '0' : '') + day;
					
	//alert(output);			
	$("#priceDateId").val(output);
	
 	$("#priceDateId").datepicker({
    	showOn: 'button',
    	//minDate : '0',
    	buttonText: 'Show date',
    	buttonImageOnly: true,
    	buttonImage: '../images/calendar.gif',
    	dateFormat: 'yy-mm-dd',
    	constrainInput: true,
    	
    	onSelect: function(selected){
    		$(this).datepicker('hide');
		        checkPrice();
		      }
	});

 	
 	/* $("#priceValue").keypress(function (event) {
		//if the letter is not digit then display error and don't type anything
			if(event.which < 46 || event.which > 59) {
    			event.preventDefault();
    			$("#errmsg").html("Please enter digits Only").show().fadeOut("slow");
			} // prevent if not number/dot
			if(event.which == 46 && $(this).val().indexOf('.') != -1) {
	   			event.preventDefault();
			}
	}); */
	

 	$('#priceValue').keypress(function (event) {
  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
  	        event.preventDefault();
  	      $("#errmsg").html("Please enter digits Only").show().fadeOut(2500);
  	    }

  	    var text = $(this).val();

  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 4)) {
  	        event.preventDefault();
  	      $("#errmsg").html("You can enter only four digits after decimal").show().fadeOut(2500);
  	    }
  	});
 	
 	
	//check already price is present for date
	 /* $("#priceValue").change(function(){
		 
		 checkPrice();	
		}); */  

	
		
});//ready function end here  

function showButtons(id){   
	//show add buttons    
	
	if(id == 0){ //show add buttons
		
		$('#editbuttons').fadeOut('fast');
		$('#addbuttons').fadeIn('slow');
		}     
	if(id == 1){//show edit buttons
		
		$('#addbuttons').fadeOut('fast');   
		$('#editbuttons').fadeIn('slow');    
		}
	    
} ;  

/* ----- Datepicker start ------ */

$(document).ready(function() {
	    $("#startDateId").datepicker({
	        showOn: 'button',
	        minDate : '0',
	        buttonText: 'Show date',
	        buttonImageOnly: true,
	        buttonImage: '../images/calendar.gif',
	        dateFormat: 'dd/mm/yy',
	        constrainInput: true,    
	       onSelect: function(selected) 
	       {
	       		$("#startDateId").datepicker("option","minDate", selected)
	       }
	    });
	    $(".ui-datepicker-trigger").mouseover(function() {
	        $(this).css('cursor', 'pointer');
	    });
	});

$(document).ready(function() {
	    $("#startDateId").datepicker({
	        showOn: 'button',
	        minDate : '0',
	        buttonText: 'Show date',
	        buttonImageOnly: true,
	        buttonImage: '../images/calendar.gif',
	        dateFormat: 'dd/mm/yy',
	        constrainInput: true,   
	    });
	    $(".ui-datepicker-trigger").mouseover(function() {
	        $(this).css('cursor', 'pointer');
	    });
	});
	
$(document).ready(function() {
    $("#endDateId").datepicker({
        showOn: 'button',
        minDate : '0',
        buttonText: 'Show date',
        buttonImageOnly: true,
        buttonImage: '../images/calendar.gif',
        dateFormat: 'dd/mm/yy',
        constrainInput: true,   
        onSelect: function(selected) 
        {
	          $("#endDateId").datepicker("option","minDate", selected)
	    }
    });

    $(".ui-datepicker-trigger").mouseover(function() {
        $(this).css('cursor', 'pointer');
    });
});

$(document).ready(function() {	
   $("#endDateId").datepicker({
    	showOn: 'button',
    	minDate : '0',
    	buttonText: 'Show date',
    	buttonImageOnly: true,
    	buttonImage: '../images/calendar.gif',
    	dateFormat: 'dd/mm/yy',
    	constrainInput: true
});

$(".ui-datepicker-trigger").mouseover(function() {
    $(this).css('cursor', 'pointer');
});
});




/* ------- datepicker code end ------- */


</script>
</body>
</html>