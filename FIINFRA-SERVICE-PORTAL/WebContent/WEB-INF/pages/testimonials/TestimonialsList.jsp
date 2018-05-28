<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Testimonial</title>

<script type="text/javascript">

function submitAddTestimonial()
{
	var isaction=$('#actionvalue').val();
	//alert(""+isaction);
	$.ajax({
		type :'POST',
		data:$('#addform').serialize(),
		
url : $('#contextPath').val() +"/testimonial/addTestimonial.htm",
		 success : function(result) 
		 {
	      if(isaction==1){        	
        	   bootbox.dialog({
	 						message: "<span class='bigger-110'>Record Added Successfully</span>",
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
			    $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Record Added Successfully.</p></div>');
        	resetval();
        	addNote();
           }
         
  		}
  
	});
}
/*------------------------------------------Function End for Add testimonial-----------------------  */


function resetval()
{
	
	    $('#addquickSearchpart').val('');
		$('#addquickSearchHiddenpart').val('');
		$('#addquickSearch').val('');
		$('#addquickSearchHidden').val('');
		$('#documentNameId').val('');
		$('#descriptionNoteId').val('');
		$('#statusId').val(0);
      		
}


function sendToEditTestimonial(id,partnername,partnerId,clientName,clientId,url,text,statusRefId)
{
	
	//alert("text"+text);
	$('#testimonialId').val(id);
	$('#editquickSearchpart').val(partnername);
	$('#editquickSearchHiddenpart').val(partnerId);
	$('#editquickSearch').val(clientName);//append('<option value="'+ clientId +'">'+ clientName + '</option>');
	$('#editquickSearchHidden').val(clientId);
	$('#editHeaderName').val(url);
	$('#obj11').val(text);
	
	addTestimonialStatus('edit',statusRefId);
	//popup('popUpAlertaddnote');	
	editNote();
	
	
}
/* ----------------------------------------------Function for Edit Testimonial------------------------------------- */



function submitEditTestimonial()
{    
	$.ajax({
		type :'POST',
		data:$('#Editform').serialize(),		
		url : $('#contextPath').val() +"/testimonial/editTestimonial.htm",
		 success : function(result) 
		 {
			 bootbox.dialog({
					message: "<span class='bigger-110'>Record Updated successfully</span>",
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
/* ----------------------------------------------Function End for Edit Testimonial------------------------------------- */


/* -------------------------------Funtion for delete Testimonial---------------------------------------------------- */
function deleteTestomonial()
	{ 
		  var selectedlvals = [];
		  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
			  selectedlvals.push($(this).val());
		  });
		
		if(selectedlvals == ""){
			 bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one Item for delete</span>",
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
				
		return;
	  }else{
		  			
			  		 document.getElementById("confirmdelete").value = selectedlvals;
			  		deleteNote();
	  } 
		
	};


 function confirmDelete()
		{		
			 var selectedlvals= document.getElementById("confirmdelete").value;			 
			   	  $.ajax({
				   type : 'POST',
				   url : $('#contextPath').val()+"/testimonial/deleteTestimonial.htm?selectedlvalz="+selectedlvals,
			
				  success : function(result)
	            {
					  bootbox.dialog({
	 						message: "<span class='bigger-110'>Record Deleted Successfully</span>",
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
 /* -------------------------------Funtion End for delete Testimonial---------------------------------------------------- */
		 
function reload()
{
	
location.reload();
}

function autovalid(n){
	 if(n==0){
		 //$("#addquickSearchpart").val('');
		 $('#addquickSearchHiddenpart').val(''); 
	}
	 else{
		// $("#editquickSearchpart").val('');
		 $('#addquickSearchHidden').val(''); 
		 
	 }
	
	 
}
function onkeyupforaddpartner(){
	if($('#addquickSearchpart').val()==""){
		
		$('#addquickSearch').first().focus();	
	}		
	$('#addquickSearchpart').first().focus();
	
	if($('#valueforautocomplete').val()!=""){
	 var addlength=$('#addquickSearchpart').val();
		var a=addlength.length;
		if(a==0){
		$('#addquickSearch').first().focus();
		
	}
		$('#addquickSearchpart').first().focus();
	}
	
	}

function onkeyupforaddclient(){
if($('#addquickSearch').val()==""){
	$('#addquickSearchpart').first().focus();
	}		
$('#addquickSearch').first().focus();	
	if($('#valueforautocomplete').val()!=""){
		 var addlength=$('#addquickSearch').val();
			var a=addlength.length;
			if(a==0){
			$('#addquickSearchpart').first().focus();
			
		}
			$('#addquickSearch').first().focus();
		}
	
}



</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />

<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width: 450px; height: 380px; top: 100px"	id="popUpDiv">
  <div class="close" style="margin-right: 10px;"><a onClick="popup('popUpDiv');" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
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
						type="button">
        <input class="dbtn" value="Cancel"
						onClick="popup('popUpDiv')" id="loginButton" type="button">
      </form>
    </div>
  </div>
</div>
<!--css popup window 1 close-->
<!--css popup window start 2-->

<!-------------------------------------------------Add Testimonial----------------------------------------------------------------------- -->
<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">   
   
      <div class="modal-header">
      <div id="success-msg"></div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">Add Testimonial</h3>
      </div>
      <div class="modal-body">
      <form  class="form-horizontal" id="addform"  >
      	  
      	  <input type="hidden" name="actionvalue" id="actionvalue" value="">
      	  <input type="hidden" name="valueforautocomplete" id="valueforautocomplete" value="">
      	  
		  <input type="hidden" name="confirmdelete" id="confirmdelete" value="">
          <input type="hidden" id="hiddenPartyId" name="hiddenPartyIdName" value="" />
          <input type="hidden" id="hdnDownloadSectionId" name="hdnDownloadSectionName" value="" />
          <input type="hidden" id="hiddenIsToClose" name="hiddenIsToClose" value="<%=request.getAttribute("hiddenIsToClosee")%>" />
          
      
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="PartnerName">Partner Name<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											<input type="text" id="addquickSearchpart" 	name="searchString" onfocus="addquickSearchPartner(this);" placeholder="Quick Search"  autofocus  onchange="autovalid(0);" onkeyup="onkeyupforaddpartner();">           			  				
											<input type="hidden" id="addquickSearchHiddenpart" name="partnerId" placeholder="Quick Search" >
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="ClientName">Client Name<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											  <input type="text" id="addquickSearch" name="esearchString" onfocus="addquickSearchContacts(this);" placeholder="Quick Search" autofocus onchange="autovalid(1)"  onkeyup="onkeyupforaddclient();">
           				  					  <input type="hidden" id="addquickSearchHidden" name="clientId" placeholder="Quick Search">		
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
										<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Heading">Heading<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											        <input type="text" class="form-control" id="documentNameId" name="url">		
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="DescriptionNote">Description Note<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											         <textarea class="form-control" rows="5" id="descriptionNoteId" name="text" maxlength="400"></textarea>	
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="DescriptionNote">Status<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											       <select name="statusRefId" class="form-control" id="statusId">
                			  				<!--     <option>Shubhchintak</option>	
                            	    		<option>FIINFRA</option>
                               		 		<option>SPA</option>
                                			<option>AXIS</option> -->
           									     </select>
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									<div class="modal-footer">
							<div class="clearfix">
								<button id="SPAddNewtestimonialLink" class="btn btn-sm btn-primary"  onclick="AddTestimonial(0);" ><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button id="SPAddNewtestimonialLink" class="btn btn-sm btn-primary" onclick="AddTestimonial(1);" ><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								<button id="SPcloseaddtestimonialLink" class="btn btn-sm btn-danger"  onclick="reload();" ><i class='ace-icon fa fa-plus'></i>close</button>
							</div>
						</div>
									
					
   				
									
</form>  
	 
</div>
</div> 
</div>
</div>

<!-- --------------------Add Testimonial over----------------------------- -->

<!-------------------------------------------------delete Testimonial-------------------------------------------------->

<div class="modal fade" id="deletenote" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">Message</h3>
      </div>
      <div class="modal-body">
       <div class="form-group">
						<label class="control-laabel col-xs-12 " for="Heading">Do you want to delete this Testimonial? Please confirm.<span class="red">*</span></label>
						
						<div class="clearfix"></div>
	  </div>
	  <div class="space-2"></div>  
       
          <div class="modal-footer">          
              <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();">Yes</button>
              <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close">
              <i class="ace-icon fa fa-close"></i>No
              </button>           
          </div>
    
      </div>
    </div>
  </div>
</div>

<!-- delete-->

<!----------------------- Edit  Download--------------------------------------------------->

<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();"> <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">Edit Testimonial</h3>
      </div>
      <div class="modal-body">
         <form  class="form-horizontal" id="Editform"  >      	  
      	  
			<input type="hidden" id="hdndocumentId" name="hdndocumentIdNm">
            <input type="hidden" id="hiddenEditIsToClose" name="hiddenEditIsToClose" value="<%=request.getAttribute("hiddenEditIsToClosee")%>" />
            <input type="hidden" id="isToClose" name="isToClose" value="<%=request.getParameter("isToClose")%>" />
            <input type="hidden" id="isToClosee" name="isToClosee"  value="<%=request.getParameter("isToClosee")%>" />
            <input type="hidden" id="testimonialId" name="id">
      
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="PartnerName">Partner Name<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											  <input type="text" id="editquickSearchpart"	name="partnerName" onKeyUp="editquickSearchPartner(this);" placeholder="Quick Search" readonly='true' style="width: 300px;"> 
                					          <input type="hidden" id="editquickSearchHiddenpart" name="partnerId" placeholder="Quick Search" style="width: 300px;">
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="ClientName">Client Name<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											 <input type="text" id="editquickSearch" name="clientName"
												onKeyUp="editquickSearchContacts(this);"
												placeholder="Quick Search" readonly='true'
												style="width: 300px;">                 
              						    	   <input type="hidden" id="editquickSearchHidden" name="clientId" placeholder="Quick Search" style="width: 300px;">		
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
										<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="Heading">Heading<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											        <input type="text" class="form-control" id="editHeaderName" name="url">	
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="DescriptionNote">Description Note<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											          <textarea class="form-control" rows="5" id="obj11" name="text" maxlength="400"></textarea>	
											</div>
										</div>
									</div>
									<div class="space-2"></div>
									
									<div class="form-group">
										<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="DescriptionNote">Status<span class="red">*</span></label>				
										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">											
											      <select name="statusRefId" class="form-control"
												id="editstatusId">
						                      <!--     <option>Shubhchintak</option>	
						                                <option>FIINFRA</option>
						                                <option>SPA</option>
						                                <option>AXIS</option> -->
						                   	  </select>
										</div>
										</div>
									</div>
									<div class="space-2"></div>
									<div class="modal-footer">
							<div class="clearfix">
								<button id="SPedittestimonialLink" class="btn btn-primary btn-sm"  onclick="EditTestimonial();">Save</button>						
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="reload();">
                				<i class="ace-icon fa fa-close"></i>Cancel
                				</button>
							</div>
						</div>
									
					
   				
									
</form>
     </div>
    </div>
  </div>
</div>
<!---------------------------------------- end edit Testimonial------------------------------------------->

<!--css popup window 2 close-->

<!--breadcrum Menu Start-->

<div class="page-header">
  <h1 class="pull-left">Testimonial List</h1>
  <div class="clearfix"></div>
</div>

<!-- Center part start -->
<section>
  <div class="container-body">
   <form name="abcform" id="searchs" method="post" action="<%=request.getContextPath()%>/testimonial/loadtestimonialsList.htm">
   <input type="hidden" name="isAutocomplete" id="isAutocompletesubmit" value="<%=request.getAttribute("isAutocomplete") %>>" >
    <div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-1 no-padding-right" for="DescriptionNote">Partner Name<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-3">														 
 			          	<input class="col-md-12 col-xs-12" type="text" id="quickSearchpart" name="searchString" onfocus="quickSearchPartner(this);" placeholder="Quick Search" autocomplete="off">
          			    <input type="hidden" id="quickSearchHiddenpart" name="searchPartnerId"	placeholder="Quick Search">
						</div>

						<label class="control-laabel col-xs-12 col-sm-1 no-padding-right" for="DescriptionNote">Client Name<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-3">														 
 			          	 <input class="col-md-12 col-xs-12" type="text" id="quickSearch" name="searchString" onfocus="quickSearchContacts(this);" placeholder="Quick Search" autocomplete="off">
         				 <input type="hidden" id="quickSearchHidden" name="searchClientId"	placeholder="Quick Search">
						</div>
						
						<div class="col-xs-12 col-sm-1">		
						<button type="submit" value="Submit" name="submit" alt="search" class="btn btn-xs btn-success"><i class="ace-icon fa fa-check"></i>Submit</button>
						</div>					
   </div>     
   </form>
   	
						<div class=" col-xs-12 col-sm-3">
    					<div class="form-group clearfix">
   						<div class="pull-right">
    					<button id="SPAddNewTestimonialLink" value="New Testimonial" class="btn btn-xs btn-primary" onclick="newtesti();"><i class="ace-icon fa fa-plus"></i>New Testimonial</button>
    					<button id="SPDeleteFAQLink" value="Delete" class="btn btn-xs btn-danger" onclick="deleteTestomonial();"><i class="ace-icon fa fa-trash"></i>Delete</button>
        				<button id="SPbackroleaccessLink" class="btn btn-xs btn-sm" onClick="goback();">Back</button>    
        				<input type="hidden" name="confirmdelete" id="confirmdelete">
    					</div>    
    				    </div>
    					</div>  						
						<div class="clearfix"></div>
  
       
    <div class="table-responsive" id="display_table_lead"
				style="border: none;">
      <div id="toreload">
        <table id="grid-table">
        </table>
        <div id="grid-pager"></div>
        
        <!-- Center-->
      </div>
    </div>
    <div class="space"></div>
    <div class="pull-left">
      <div class="hr-12"></div>
      <div class="topmenuleft margin_5px"><span>Export options:</span> <a
						href="<%=request.getContextPath()%>/testimonial/testimonialsCSV.htm"
						title="Export in CSV" alt="Export in CSV"><i
						class="fa fa-file-pdf-o bigger-140"></i></a> <a
						href="<%=request.getContextPath()%>/testimonial/testimonialsExecl.htm"
						title="Export in Excel" alt="Export in Excel"><i
						class="fa fa-file-excel-o bigger-140"></i></a></div>
    </div>

    					<div class="form-group clearfix">
   						<div class="pull-right">
    					<button id="SPAddNewTestimonialLink" value="New Testimonial" class="btn btn-xs btn-primary" onclick="newtesti();"><i class="ace-icon fa fa-plus"></i>New Testimonial</button>
    					<button id="SPDeleteFAQLink" value="Delete" class="btn btn-xs btn-danger" onclick="deleteTestomonial();"><i class="ace-icon fa fa-trash"></i>Delete</button>
        							<button id="SPbackroleaccessLink" class="btn btn-xs btn-sm" onClick="goback();">Back</button>    
        				<input type="hidden" name="confirmdelete" id="confirmdelete">
    					</div>    
    				    </div>    											
						<div class="clearfix"></div>
  </div>
</section>
<!-- Center part End -->

<footer>
  <jsp:include page="../common/footer.jsp" />
  	<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
</footer>

<script>
 function pagesizeurl(){
  var pageSize=$('#page').val(); 
  window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm?pageSize='+pageSize;
   //window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm';
 }
 
 function PCurl(){
	 var partnerId=$('#quickSearchHiddenpart').val();
	 var clientId =$('#quickSearchHidden').val();
	 
	  window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm?partnerId='+partnerId+"&clientId="+clientId;
	   //window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm';
	 }
	 

function addNote(){
	
//	$("#addnote").modal('show');	
	$("#addnote").modal({
	    backdrop: 'static',
	    keyboard: false
	});	
	$("#deletenote, #editnote").hide();
	$("#tags").hide();
}
function newtesti(){
	
	
	addTestimonialStatus('add',0);
	addNote();
}

function deleteNote(){
	$("#deletenote").modal('show');	
	$("#addnote, #editnote").hide();
}

function editNote(){
	$("#editnote").modal('show');	
	$("#addnote, #deletenote").hide();
}

</script>

<!-- Quick Search for Add  -->
<script type="text/javascript">  

	function addquickSearchPartner(e){
		
	   $('#success-msg').empty();
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			//search();
			return;
		}
		/* $('#common_popup_div,#shadow_div_web_app').remove(); */
		 $('.ui-autocomplete').css('z-index','999999999999999999999999999999	');		 
		//alert($('#quickSearch').val());
	$.ajax({
		  url: $('#contextPath').val()+"/birtreport/getPartnerList.htm?searchString="+$('#addquickSearchpart').val(),
		  method:"post",
		  success:function(result){
 
			 
			  var userLabelValueList = new Array();
				 $(result).each(function(i,obj){
						var object = {};
						object.value = obj.partyID;

						object.label = obj.partnerName;
						userLabelValueList.push(object);
					 	//alert("Hello:::::"+ obj.partyID);
						//alert("Hi:::::::::"+obj.partnerName); 
						
				 }); 
// 				 alert("object.label:::"+  object.label);
				 $("#addquickSearchpart")
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
// 					        	partyId=ui.item.value;
					        	$('#addquickSearchHiddenpart').val(ui.item.value)
						
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
	
	
function addquickSearchContacts(e){
		
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			//search();
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
				 
				 $("#addquickSearch").bind( "keydown", function(event) {
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
		</script>
<script type="text/javascript">  

		function editquickSearchPartner(e){

			var event = window.event ? window.event : e;
			//alert(event.keyCode);
			
			if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
				return;
			if(event.keyCode==13){
				//search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			 $('.ui-autocomplete').css('z-index','9999999999999999');
			//alert($('#quickSearch').val());
		$.ajax({
			  url: $('#contextPath').val()+"/birtreport/getPartnerList.htm?searchString="+$('#editquickSearchpart').val(),
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
//	 				 alert("object.label:::"+  object.label);
					 $("#editquickSearchpart")
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
						        	$('#editquickSearchHiddenpart').val(ui.item.value)
							
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
		
		
	function editquickSearchContacts(e){
			
			var event = window.event ? window.event : e;
			//alert(event.keyCode);
			
			if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
				return;
			if(event.keyCode==13){
				//search();
				return;
			}
			$('#common_popup_div,#shadow_div_web_app').remove();
			 $('.ui-autocomplete').css('z-index','9999999999999999');
			//alert($('#quickSearch').val());
		$.ajax({
			  url: $('#contextPath').val()+"/birtreport/getClientList.htm?searchString="+$('#editquickSearch').val()+"&partnerId="+$('#editquickSearchHiddenpart').val(),
					  
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
					 
					 $("#editquickSearch")
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
						        	$('#editquickSearchHidden').val(ui.item.value)
							
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
			</script>

<!-- Quick Search for Listing Testimonial  start-->
<script>  
			function reload()
			{
				location.reload();
			}

	function quickSearchPartner(e){

		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			//search();
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
// 				 alert("object.label:::"+  object.label);
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
// 					        	partyId=ui.item.value;
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
//	 		 alert(availableTags);
		  }
		});

	}
	
	
function quickSearchContacts(e){
		
		var event = window.event ? window.event : e;
		//alert(event.keyCode);
		$('#quickSearchHiddenpart').val()
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
			return;
		if(event.keyCode==13){
			//search();
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
// 					        	partyId=ui.item.value;
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
		</script>
<script type="text/javascript">
		

		
function goback() {
	//location.href="loadrole.htm";
	history.back();
}
		 $(document).ready(function(){
			 
			 var nullvalue="";
			 $('#valueforautocomplete').val(nullvalue);
			 
			
			 
			 document.onkeydown = fkey;
			 function fkey(e){
			         e = e || window.event;
			        
			         if (e.keyCode == 116) {
			            
			         	 window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm'; 
			         }
			         }
			  
		/* 	 alert($('#isAutocompletesubmit').val());
			 if($('#isAutocompletesubmit').val()==1){
				 window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm'; 
				 
			 } */
			 
			 /* 
			 window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm'; */
	          //addNewDownload('add',0);
	          //addTestimonialStatus('add',0);
	          //editNewDownload();
	      	});
		
		function addTestimonialStatus(action,ids)
		{
			 //alert(action);
			   	$.ajax(
			   			{ 				
			   		  type: "POST",
			   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=137',
			   		 dataType: 'json',
					  contentType: 'application/json',
						   		  success:function(result)
			   		  { 
						   			 if(action=='edit')
						   			 {
								        	var id = '#editstatusId';
								        	$('#editstatusId').empty();
								        }else{
								        	
								        	var id = '#statusId';
								       	 $('#statusId').empty();
								       	 $('#statusId').append('<option value="0">--Select--</option>');
								        	//$('#downloadSectionId').empty();
								        }
						   			// alert(id);
						   		//	 alert(ids);
								      $(result).each(function(i, obj) {
								          var module=obj.codeValue;
									        var modulename=obj.codeValueId;
										    if(ids == modulename)
										    {
									      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
									      	} else{
									      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
									      	}
										 //  $('#common_popup_div,#shadow_div_web_app').remove();
										   });
						   			 
									//	$('#').empty();
									//	 $('#').empty();						
											
							
								
			   		  }
			   	
			   	});
			  
			   
		}
		
		function EditTestimonial(action){			
			//alert('HIIEE')
			var validator=$('#Editform').validate({
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
				
				url:{
					required: true		
				},	
				text:{
					required:true
					
				}
				
			},

			messages: {	
				
				url:"Heading is required.",
				text:"Description Note is rquired"
				
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
					// validation perform
					//alert("validate"+action);
					
					submitEditTestimonial();
							
				}
			},
			invalidHandler: function (form) {
				
			}
		});
		}			
		
		
		function AddTestimonial(action){
			$('#actionvalue').val(action);

		
			/* $('#valueforautocomplete') for the autocomplete list */
			$('#valueforautocomplete').val(1);
			/* End */
			
			jQuery.validator.addMethod("partneradd", function (value, element) {
	   	    	return response = ( $('#addquickSearchHiddenpart').val() == null ) ? false: true ;
	     		 }, "Partner Name must be valid.");
		
			jQuery.validator.addMethod("clientadd", function (value, element) {
	   	    	return response = ( $('#addquickSearchHidden').val() == null ) ? false: true ;
	     		 }, "Client Name must be valid.");
			
			jQuery.validator.addMethod("status", function (value, element) {
	   	    	return response = ( $('#statusId').val() == '0' ) ? false: true ;
	     		 }, "Status is required ");
			//alert('HIIEE')
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
				
				
				partnerId:{
					required: true,
					partneradd:true
				},
				clientId:{
					required:true,
					clientadd:true
				},				
				url: {
					required: true
				},
				text:{
					required:true
					
				},
				statusRefId:{
					
					required:true,
					status:true
				}
			},

			messages: {
				
				url:"Heading is required.",
				text:"Description Note is rquired",
				statusRefId:"Status is required",
				partnerId:"Partner Name must be valid.",
				clientId:"Client Name must be valid."
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
					// validation perform
					//alert("validate"+action);
					
					submitAddTestimonial();
							
				}
			},
			invalidHandler: function (form) {
				
			}
		});
		}	
		</script>
<script type="text/javascript">
			
		
			// var grid_data=${testimonialsList};
			

			 var grid_data=${testimonialsList};
			
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
			
					
					
					
			
			
					data: grid_data,
					datatype: "local",
					height: 350,
					colNames:[' ','','Partner Name','Client Name','Testimonial Name','Header','Description Note','Status'],
					colModel:[
					/* 	  {name:'Edit', width:80, fixed:true, sortable:false, resize:false,
							formatter:'actions',						
							formatoptions:{ 
								keys:true,
								delbutton: false,//disable delete button
								
								delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
								editformbutton:true, editOptions:{recreateForm: true,beforeShowForm:beforeEditCallback,}
								}
							}, */
							
						{name : 'myac',index :'',width : 60, fixed : true, sortable : false, resize : false,
		        				  formatter:function(cellvalue, options,rowObject) {
		              				return '<a href="#" onclick="sendToEditTestimonial('+rowObject.id+',\''+rowObject.partnerName+'\',\''+rowObject.partnerId+'\',\''+rowObject.clientName+'\',\''+rowObject.clientId+'\',\''+rowObject.url+'\',\''+rowObject.text+'\',\''+rowObject.statusRefId+'\');"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';

											}
										},

										{
											name : 'checkbox',
											sortable : false,
											width : 55,
											formatter : function(cellvalue,
													options, rowObject) {
												return '<input role="checkbox" type="checkbox"  class="cbox" id="chkdeleteselect" value="'+rowObject.id+'" name="chkdeleteselect">';
											}
										},
										{
											name : 'partnerName'
										},
										{
											name : 'clientName'
										},
										{
											name : 'userName',
											width : 300
										},
										{
											name : 'url'
										},
										{
											name : 'text'
										},
										{
											formatter : function(cellvalue,
													options, rowObject) {
												if (rowObject.statusRefId == 137001) {
													return '<span class="label label-warning";>'
															+ "New" + '</span>';

												} else if (rowObject.statusRefId == 137002) {
													return '<span  class="label label-success";>'
															+ "Approved"
															+ '</span>';

												} else {
													return '<span class="label label-danger";>'
															+ "Rejected"
															+ '</span>';

												}

											}
										}, ],

								viewrecords : true,
								rowNum : 10,
								rowList : [ 10, 20, 30 ],
								pager : pager_selector,
								//altRows: true,
								//toppager: true,
								//height:"auto",
								//multiselect: true,
								//multikey: "ctrlKey",
								multiboxonly : true,

								loadComplete : function() {
									var table = this;
									setTimeout(function() {
										styleCheckbox(table);

										updateActionIcons(table);
										updatePagerIcons(table);
										enableTooltips(table);
									}, 0);
								},

								editurl : "/dummy.html",//nothing is saved
								//caption: "jqGrid with inline editing"

								//autowidth: true,
								width : '100%',

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
			function aceSwitch(cellvalue, options, cell) {
				setTimeout(function() {
					$(cell).find('input[type=checkbox]').addClass(
							'ace ace-switch ace-switch-5').after(
							'<span class="lbl"></span>');
				}, 0);
			}
			//enable datepicker
			function pickDate(cellvalue, options, cell) {
				setTimeout(function() {
					$(cell).find('input[type=text]').datepicker({
						format : 'yyyy-mm-dd',
						autoclose : true
					});
				}, 0);
			}

			//navButtons
			jQuery(grid_selector).jqGrid(
					'navGrid',
					pager_selector,
					{ //navbar options
						edit : false,
						editicon : 'ace-icon fa fa-pencil blue',
						add : false,
						addicon : 'ace-icon fa fa-plus-circle purple',
						del : false,
						delicon : 'ace-icon fa fa-trash-o red',
						search : true,
						searchicon : 'ace-icon fa fa-search orange',
						refresh : false,
						refreshicon : 'ace-icon fa fa-refresh green',
						view : false,
						viewicon : 'ace-icon fa fa-search-plus grey',
					},
					{
						//edit record form
						//closeAfterEdit: true,
						//width: 700,
						recreateForm : true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-titlebar').wrapInner(
									'<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd : true,
						recreateForm : true,
						viewPagerButtons : false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-titlebar').wrapInner(
									'<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm : true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if (form.data('styled'))
								return false;

							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-titlebar').wrapInner(
									'<div class="widget-header" />')
							style_delete_form(form);

							form.data('styled', true);
						},
						onClick : function(e) {
							//alert(1);
						}
					},
					{
						//search form
						recreateForm : true,
						afterShowSearch : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-title').wrap(
									'<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw : function() {
							style_search_filters($(this));
						},
						multipleSearch : true,
					/**
					multipleGroup:true,
					showQuery: true
					 */
					},
					{
						//view record form
						recreateForm : true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-title').wrap(
									'<div class="widget-header" />')
						}
					})

			function style_edit_form(form) {
				//enable datepicker on "sdate" field and switches for "stock" field
				form.find('input[name=sdate]').datepicker({
					format : 'yyyy-mm-dd',
					autoclose : true
				})

				form.find('input[name=stock]').addClass(
						'ace ace-switch ace-switch-5').after(
						'<span class="lbl"></span>');
				//don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
				//.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

				//update buttons classes
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-primary').prepend(
						'<i class="ace-icon fa fa-check"></i>');
				buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')

				buttons = form.next().find('.navButton a');
				buttons.find('.ui-icon').hide();
				buttons.eq(0).append(
						'<i class="ace-icon fa fa-chevron-left"></i>');
				buttons.eq(1).append(
						'<i class="ace-icon fa fa-chevron-right"></i>');
			}

			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm btn-white btn-round').find(
						'[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend(
						'<i class="ace-icon fa fa-trash-o"></i>');
				buttons.eq(1).addClass('btn-default').prepend(
						'<i class="ace-icon fa fa-times"></i>')
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
				buttons.find('.EditButton a[id*="_reset"]').addClass(
						'btn btn-sm btn-info').find('.ui-icon').attr('class',
						'ace-icon fa fa-retweet');
				buttons.find('.EditButton a[id*="_query"]').addClass(
						'btn btn-sm btn-inverse').find('.ui-icon').attr(
						'class', 'ace-icon fa fa-comment-o');
				buttons.find('.EditButton a[id*="_search"]').addClass(
						'btn btn-sm btn-purple').find('.ui-icon').attr('class',
						'ace-icon fa fa-search');
			}

			function beforeDeleteCallback(e) {
				var form = $(e[0]);
				if (form.data('styled'))
					return false;

				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
						.wrapInner('<div class="widget-header" />')
				style_delete_form(form);

				form.data('styled', true);
			}

			function beforeEditCallback(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
						.wrapInner('<div class="widget-header" />')
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
				var replacement = {
					'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
					'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
					'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
					'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
				};
				$(
						'.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon')
						.each(
								function() {
									var icon = $(this);
									var $class = $.trim(icon.attr('class')
											.replace('ui-icon', ''));

									if ($class in replacement)
										icon.attr('class', 'ui-icon '
												+ replacement[$class]);
								})
			}

			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({
					container : 'body'
				});
				$(table).find('.ui-pg-div').tooltip({
					container : 'body'
				});
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