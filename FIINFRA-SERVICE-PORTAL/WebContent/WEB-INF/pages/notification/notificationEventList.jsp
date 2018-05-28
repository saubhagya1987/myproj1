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
<title>Notification Event List</title>   
 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script> 
       
      
 <!-- -responsive css-->
  
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
    
</head> 
<body >
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />   
<input type="hidden" id="buId" value="${sessionScope.userSession.buId}"/>              
<!--css popup window start 1--> 
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

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
	
 	<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog"> 
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="resetval();location.reload();"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add New Event</h4> 
      </div> 
      <div class="modal-body">    
			<!-- <div id="popupwrapper_contactform">  -->
  			<input type="hidden" name="confirmdelete" id="confirmdelete" >  
 			<form id="Adddepartment"> 
 	      <div id="success-msg"></div>	   
 			
 				
  		        <div class="row"> 
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Category</label>
				                <div class="col-sm-9">
				                 	<select name="category" class="form-control" id="category" style="float:left;  width:300px;"  >
		  						 	</select>
				                 </div> 
				              </div>   
		           			</div>
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">System</label>
		                <div class="col-sm-9">
		                 	<select name="system" class="form-control"  id="system" style="float:left;  width:300px;"   >
                            </select>
		                 </div> 
		              </div>  
           			</div>
           			
           			 
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Event Name  </label>
		                <div class="col-sm-9">
		                 	<input name="name" class="form-control" id="name" >
		                 </div> 
		              </div>  
           			</div>   
           			 
           				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Event Description  </label>
		                <div class="col-sm-9">
		                 	<span  class="searchpadding padding_top "  Id="dtext">   
							<textarea name="destext" class="form-control" id="destext" rows="5" class="editor"></textarea></span>
		                 </div> 
		              </div>  
           			</div> 
        <!--  </div>    -->
  
       </form>
   <!--  </div>   --> 
	</div>     
	  
	
	<div class="modal-footer">
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="doAdd()">	Save &amp; New</button>
	<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="doExit()"  >Save &amp; Close</button>
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="resetval();location.reload();"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div> 
	      
     </div> 
      
     </div></div>    
      
    <!-- delete--> 
    <div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content"> 
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Message</h4> 
      </div> 
      <div class="modal-body">    
          
         	Do you want to delete this selected records? Please confirm.
        	<form>   
            <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();">	Yes</button>
			<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>
	 		     
           	</form>	   
 	</div>  
         
     </div></div> </div>
    <!-- delete--> 
    <!-- Edit starts--> 
              
     <div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">  
    <div class="modal-content"> 
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit Event</h4> 
      </div> 
      <div class="modal-body">    
   		<form id="updateform">      
  			<input type="hidden" name="eventIdEdit" id="eventIdEdit">  
         
             <div class="row"> 
				              <div class="form-group col-md-12 clearfix">
				                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Category</label>
				                <div class="col-sm-9">
				                 	<select name="editcategory" class="form-control" style="float:left; width:300px;" id="editcategory" >   
                               		</select>
				                 </div> 
				              </div>   
		           			</div>  
		           			
		      	<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">System</label>
		                <div class="col-sm-9">
		                 	<select name="editsystem" class="form-control" id="editsystem"   > 
                            </select>
		                 </div> 
		              </div>  
           			</div>
           			
           			
           			<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Event Name  </label>
		                <div class="col-sm-9">
		                 <input name="editName" class="form-control" id="editName">
		                 </div> 
		              </div>  
           			</div>   
           			 
           				<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="roleNameId">Event Description  </label>
		                <div class="col-sm-9">
		                 	<span  class="searchpadding padding_top "  Id="dtext">   
							<span  class="searchpadding padding_top " style="float:left; width:400px; "  Id="editdtext">
							<textarea name="editdestext" class="form-control" rows="5" id="editdestext" class="editor"></textarea></span>    </div> 
		              </div>  
           			</div> 
       </form>        
             
 </div>  
   
    <div class="modal-footer">
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="doUpdate()">Save</button>
	
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div> 
 </div>    

      
   
	      
     </div>
      
   <!--  </div> -->   
	</div> 

      
     
<!-- edit ends css popup window 2 close-->

    
      <!--Nav Menu Start--> 
 <div > 
	<div class="container">  
    <!-- <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    <a class="navbar-brand" href="#"> </a>
	</div> -->   

    </div>       
 </div>
<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 
  
 <!-- Center part start -->
 <section>

      
    
    	 <div class="page-header">
							<h1 class="pull-left">Notify Event</h1>
                       	    <div class="clearfix"></div>
                         </div>
  	  <div class="container-body">
        <!-- center -->
        
        
     	
<div class="topmenu">   
        	    
<a id="SPNotificationEventsAddLink" href="#" onClick="addNote();" ><input data-params="{}" type="button"  class="btn btn-sm btn-primary" value="  New Event "   onClick="addCategory(),addSystem(),popup('popUpAlertaddnote')" title="New Event" alt="New Event"></a>
<a id="SPNotificationEventsDeleteLink" href="#" onClick="deleteNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-danger" value="  Delete"  onClick="deleteEvent(),popup('popUpAlertaddnote');" title="Delete" alt="Delete"></a>
</div>
     <div class="clearfix"></div>
		<div class="table-responsive" id="display_table_lead">    
					<div id="toreload">         
						<table id="grid-table"></table>
						<div id="grid-pager"></div>                     
                   
						<!-- Center-->  
					</div>
				</div>        
 <div class="clearfix"></div>
`<div class="topmenuleft">
   
						<ul>
							<li>Export options:</li>
							<li><a
								href="<%=request.getContextPath()%>/notifyevent/notifyeventCSV.htm"
								title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-140"></i></a></li>
							<li><a 
								href="<%=request.getContextPath()%>/notifyevent/notifyeventExecl.htm"
								title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-140"></i></a></li>   

							<!-- <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
						</ul>
	
	</div>   

	<div class="topmenu">
<div class="hr-12"></div>
<a id="SPNotificationEventsAddLink" href="#" onClick="addNote();" ><input data-params="{}" type="button"  class="btn btn-sm btn-primary" value="  New Event "   onClick="addCategory(),addSystem(),popup('popUpAlertaddnote')" title="New Event" alt="New Event"></a>
<a id="SPNotificationEventsDeleteLink" href="#" onClick="deleteNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-danger" value="  Delete"  onClick="deleteEvent(),popup('popUpAlertaddnote');" title="Delete" alt="Delete"></a>
  
        </div>		  
     </div> 
          
     
 
  </section>           	
<!-- Center part End -->          

<footer>
<jsp:include page="../common/footer.jsp" /> 
</footer> 
<script>
/* function pagesizeurl(){
	  var pageSize=$('#page').val(); 
	   window.location.href= $('#contextPath').val()+'/notifyevent/getEventlist.htm?pageSize='+pageSize;
	 }
   */ 
 
function addNote(){
	$('#addnote').modal('show');   
}   

function deleteNote(){
   $('#deletenote').modal('show');   
}
function editNote(){ 
   $('#editnote').modal('show');  
}
   
/* start code to delete Notify Event  */ 

function deleteEvent()   
     
  {  
	   var slvals = [];   
	  $('input:checkbox[name=chkToDeleteeventId]:checked').each(function() {
	  slvals.push($(this).val());  
	  }) ;      
	 /* alert('Selected Checkbox values are: ' + slvals); */
	 
	 document.getElementById("confirmdelete").value = slvals;  
	  if(slvals<=0)  
		  {
	/* 	  alert('Please select at least one Item !'); */
		   
		  bootbox.dialog({
				message: "<span class='bigger-110'>Please select at least one Item</span>",
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
		     
		  
 
  };      
                
               
	 function confirmDelete()
	{
		 
		 var slvals= document.getElementById("confirmdelete").value;
		 //alert('Selected Item is in confirm delete '+slvals);
		 //alert('hi');   
		   	  $.ajax({           
			type : 'POST',           
			url : $('#contextPath').val()+"/notifyevent/deleteEventList.htm?Lists="+slvals, 
			 
		success : function(result)      
	  {	  
		  //alert('Deleted selected='+slvals);  
		     
		  bootbox.dialog({
				message: "<span class='bigger-110'>Notification Event Deleted Successfully</span>",
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
		  	  //alert('Notification Event Deleted Successfully !');     
		
		  		 			      
	  }
	           
	  });       
	}
		 /* end code to delete Notify Event  */
		 
	function addCategory()
	{
			 
	$.ajax            
	 ({     
             
     type: "POST",
     url: $('#contextPath').val()+'/notifyevent/getCategorySection.htm',  
     dataType: 'json', 
     contentType: 'application/json',     
        success:function(result)
     {     
        	   
		$('#category').empty();         
		$('#category').append('<option value="0">--Select--</option>');

       $(result).each(  
   		    
       function(i, obj) {
    	   
    	   var module = obj.codevalue;  
    	   var moduleid = obj.codevalueId;  
    	   
        $('#category').append('<option value="'+ moduleid+'">'+module+'</option>');
      
       });     


     }    
     
  }); 
	
}
   
function addSystem()
{  
	
	  
$.ajax            
 ({         
           
 type: "POST",
 url: $('#contextPath').val()+'/notifyevent/getSystemSection.htm',  
 dataType: 'json', 
 contentType: 'application/json',     
    success:function(result)
 {   
     
	$('#system').empty();         
	$('#system').append('<option value="0">--Select--</option>');
	
   $(result).each(   
		     
   function(i, obj) {
	   
	   var module = obj.codevalue;  
	   var moduleid = obj.codevalueId;
	    
    $('#system').append('<option value="'+ moduleid+'">'+module+'</option>');
  
   });      
 }    
  
});   

}  

/*       
 $(document).ready(function(){
	addSystem();     
  });   
      */

      function resetval()   
  	{    
  	   
  	 	$('#category').val(0);  
  	  	$('#system').val(0);  
  	   	$('#name').val(''); 
  	   	$('#destext').val('');    
  	   	
  	} 
      
function doAdd(){
	
	 var myLength = $("#name").val().length;
		//  alert("lenght="+myLength);
	 var myLength1 = $("#destext").val().length;
	 
	 if(document.getElementById('category').selectedIndex == 0)
	  { 
	  alert("Please Select Category !");  
	  return false;
	  }
	 else    
		    
	if(document.getElementById('system').selectedIndex == 0)
		{ 
		 alert("Please Select System !");  
		 return false;
		}
	else        
		         
	if(myLength>255)        
		 {  
		 alert('Name max length is 255.You can not enter more Character !');
		 }
	else if(myLength1>255)     
		 {    
		 alert('Description  max length is 255.You can not enter more Character !');
		 }
	else if($('#name').val()==""||$('#name').val().trim()=="")
		{
		alert('Please Enter Name !');   
		} 
	
	    
	else {        
		  
	 $.ajax({     
		type :'POST',
		data:$('#Adddepartment').serialize(),  
		 
url : $('#contextPath').val() +"/notifyevent/addNotifyevent.htm",
		 success : function(result)     
		 {   
		    
	       if(result >=1)     
	    	   {     
	    	   bootbox.dialog({
	      		  	message: "<span class='bigger-110'>Notify Event already exist.</span>",
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
	    	   
	    	 //  alert("Notify Event already exist !");
		    	/* $('#common_popup_div,#shadow_div_web_app').remove(); */
	    	   resetval();
               /* addNote().show();      
               popup('popUpAlertaddnote').show(); */
	    	   }  
	       else {  
	    	   $('#success-msg').empty();	
			   $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><strong><i class="ace-icon fa fa-check"></i></strong>Record successfully added</div>');
				
	    	  /*  $('#common_popup_div,#shadow_div_web_app').remove();   */
          resetval();  
         /*  addNote().show();   
          popup('popUpAlertaddnote').show(); */
          
          
	       } 
 }
              
	});  
	}   
}
 
function doExit(){     
	var myLength = $("#name").val().length;
	//  alert("lenght="+myLength);
 var myLength1 = $("#destext").val().length;
 
 if(document.getElementById('category').selectedIndex == 0)
  { 
  alert("Please Select Category !");  
  return false;
  }
 else    
	    
if(document.getElementById('system').selectedIndex == 0)
	{ 
	 alert("Please Select System !");  
	 return false;
	}
else        
	        
if(myLength>255)   
	 {  
	 alert('Name max length is 255.You can not enter more Character !');
	 }
else if(myLength1>255)     
	 {    
	 alert('Description  max length is 255.You can not enter more Character !');
	 }
else if($('#name').val()==""||$('#name').val().trim()=="")
	{
	alert('Please Enter Name !'); 
	}
/* else if($('#destext').val()==""||$('#destext').val().trim()=="")
	{
	alert('Please Enter Description !');      
	} */
 
else {    
 $.ajax({         
	type :'POST',
	data:$('#Adddepartment').serialize(),  
	 
url : $('#contextPath').val() +"/notifyevent/addNotifyevent.htm",
	 success : function(result)     
	 { 
           
		 if(result >=1)     
		  	   {    
			 bootbox.dialog({
	      		  	message: "<span class='bigger-110'>Notify Event already exist.</span>",
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
		  	  // alert("Notify Event already exist !");
		  	   resetval();         
		        } 
		 else
			 {   

	    	   bootbox.dialog({
	      		  	message: "<span class='bigger-110'>Record Added successfully.</span>",
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
}
          
}); 
} 
}

function editCategory(codevalueId)
{   
	
	
	$('#editcategory').empty();     
$.ajax               
 ({    
	   
 type: "POST",
 url: $('#contextPath').val()+'/notifyevent/getCategorySection.htm',  
 dataType: 'json', 
 contentType: 'application/json',          
    success:function(result)
 {    
    
	//$('#editcategory').empty();         
	//$('#editcategory').append('<option value="0">--Select--</option>');

   $(result).each(  
		    
   function(i, obj) {
	      
	   var module = obj.codevalue;  
	   var moduleid = obj.codevalueId;    
	   if(codevalueId == moduleid){
		   $('#editcategory').append('<option value="'+moduleid+'" selected="selected">'+module+'</option>');
	   }  
	    else {   
		   $('#editcategory').append('<option value="'+moduleid+'">'+module+'</option>');   
	   } 
   
  
   });   

 
 }    

});  

}   

function editSystem(systemID)
{   
	$('#editsystem').empty();     
$.ajax                
 ({    
	   
 type: "POST",
 url: $('#contextPath').val()+'/notifyevent/getSystemSection.htm',  
 dataType: 'json', 
 contentType: 'application/json',           
    success:function(result)
 {    
    
	//$('#editsystem').empty();         
	//$('#editsystem').append('<option value="0">--Select--</option>');

   $(result).each(  
		    
   function(i, obj) {      
	      
	   var module = obj.codevalue;  
	   var moduleid = obj.codevalueId;    
	   if(systemID == moduleid){
		   $('#editsystem').append('<option value="'+ moduleid+'" selected="selected">'+module+'</option>');
	   }
	   else {
		   $('#editsystem').append('<option value="'+ moduleid+'">'+module+'</option>');
	   }
   
  
   });   

 
 }    

});  

}  

     

function updateEvent(notifyeventid,name,category,event_System,description,codevalueId,systemID,eventcategoryid)
{  	   
		$('#editnote').modal('show'); 
	 	$('#eventIdEdit').val(notifyeventid);     
		$('#editName').val(name);                   
		 
		$('#editdestext').val(description);    
		      
		$('#editcategory').empty();   
		editCategory(codevalueId);  
		
		$('#editsystem').empty();  
		editSystem(systemID); 
}  
       
function doUpdate(){     
	 //alert('in update');  
	 $.ajax({        
		  		type :'POST',   
		  		data:$('#updateform').serialize(),
		        url : $('#contextPath').val() +"/notifyevent/editNotifyevent.htm",
		       
		  				success : function(result)          
		  				{ 
		  					 bootbox.dialog({
		  		      		  	message: "<span class='bigger-110'>Update sucessfully.</span>",
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
      

$('#destext').blur(function(){
    if ($('#destext').val().match(/[^a-zA-Z0-9. ]/g)) {
           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
       }
  });    
 

$('#destext').blur(function(){
    if ($('#destext').val().match(/[^a-zA-Z0-9. ]/g)) {
           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
       }
  });


$('#editName').blur(function(){
    if ($('#editName').val().match(/[^a-zA-Z0-9. ]/g)) {
           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, ''); 
       }
  });

$('#editdestext').blur(function(){
    if ($('#editdestext').val().match(/[^a-zA-Z0-9. ]/g)) {
           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
       }
  });

$('#editName').blur(function(){
    if ($('#editName').val().match(/[^a-zA-Z0-9. ]/g)) {
           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
       }
  });

$('#editdestext').blur(function(){
    if ($('#editdestext').val().match(/[^a-zA-Z0-9. ]/g)) {
           this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
       }
  });
 
  
</script>  
<script>
$(document).ready(function(){
  $("#user").click(function(){
  $("#usermenu").slideToggle();
	});  

	
});

</script>
<script type="text/javascript">



var grid_data='${eventList}';

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
		colNames:[' ',' ','Category','Event Name','System','Event Description','Is Active?'],
		colModel:[     
		            
			{name:'notifyeventid',index:'notifyeventid',width:50,formatter:function(cellvalue, options,rowObject) {
				return '<a href="#" onclick="updateEvent('+rowObject.notifyeventid+',\''+rowObject.category+'\',\''+rowObject.name+'\',\''+rowObject.event_System+'\',\''+rowObject.description+'\');" id="'+rowObject.notifyeventid+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			}}, 
			{name:'checkbox', sortable:false,width:50,formatter:function(cellvalue, options,rowObject) {
			    return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.notifyeventid+'" id="chkToDeleteeventId" name="chkToDeleteeventId">';
			}},              
			    
			/* '+rowObject.notifyeventid+',\''+rowObject.category+'\',\''+rowObject.name+'\',\''+rowObject.event_System+'\',\''+rowObject.description+'\' */
			{name:'category',index:'category',width:150},     
			{name:'name',index:'name',width:200}, 
			{name:'event_System',index:'event_System',width:230}, 
			{name:'description',index:'description',width:380},  
			{name:'isActive', index:'isActive',width:100,formatter:function(cellvalue, options,rowObject) {
				  
			    if(rowObject.isActive==1)       
			    	return '<span class="label label-info" >Active</span>';
			    else
			    	return '<span class="label label-info">InActive</span>'; 
			     
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
        shrinkToFit:false,	


		 

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
 
  

</script>

 
</body>
</html> 