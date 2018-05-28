<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<title>Service Teams List</title>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

<style type="text/css">
/* .dropdown-menu{
left:-76px !important;   
} */
  
.page-title{margin: 13px 0 0px 8px !important; font-weight: bolder; }  

.  h1{font-family: Arial !important;}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
   <input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
	<input type="hidden" name="confirmdelete" id="confirmdelete">

<!-- Add team member start here -->		
<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" onclick="location.reload()" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Add Service Team Member</h4> 
      		</div> 

      		<div id="success-msg"></div><!-- success msg display -->
      		<div id="form-box">

      				<div id="success-msg"></div>
      				<div id="form-box">

      				<form class="form-horizontal" id="addForm">
      				<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Select Role :<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="roleID" id="roleID" class="col-xs-12 col-sm-9" onfocus="getClear()"></select>
									

								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">First Name :<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="firstName" id="addFirstName" class="col-xs-12 col-sm-9" placeholder="First name">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Middle Name :</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="middleName" id="addMiddleName" class="col-xs-12 col-sm-9" placeholder="Middle Name">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Last Name  :<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text"	name="lastName" id="addLastName" class="col-xs-12 col-sm-9" placeholder="Last Name">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">User Name  :<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text"	name="userName" id="addUserName" class="col-xs-12 col-sm-9" placeholder="User Name">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Email Id :<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="contactemail" id="addEmailId" class="col-xs-12 col-sm-9" placeholder="Email Id" onchange='f2(this);'>
								</div>
							 </div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Mobile No :<span class="red">*</span></label>
							  <div class="col-xs-12 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="ace-icon fa fa-phone"></i>
									</span>
								<input name="contactMobile" type="text" id="addMobilNo" />
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
								<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Assign Department:<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="departmentID" id="departmentID" class="col-xs-12 col-sm-9" onfocus="getClear()"></select>
									

								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
									
					</div><!-- modal body end -->
					
					<div class="modal-footer">
						    <button  class="btn btn-sm btn-primary" onClick="addTeamMemberList(0);"><i class='ace-icon fa fa-plus'></i>Save & New</button>
							<button  class="btn btn-sm btn-primary" onClick="addTeamMemberList(1);"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
                   			<button  class="btn btn-sm btn-danger" onClick="resetVal();location.reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button> 
					</div>
					</form>
			</div>
		</div>
	</div>
</div>
</div>
<!-- Add team member end here -->

<!-- Delete start -->
<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
       	<div class="modal-content">
        	<div class="modal-header">
            	 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       			 <h4 class="modal-title">Message</h4>
       			 </div>
       			 <div class="modal-body">
       			 Are you sure that you want to delete this Service Team member ? Please confirm.
            </div>
    		
      		<div class="modal-footer">
   					<div class="clearfix"></div>
     				<div style="float: right;">
      				<form>
                    	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"> Yes</button>
        				<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"> No</button>
     	 			</form>
      				</div>
   		   </div>
  	</div>
</div>

<!-- delete end -->

<!---- Bulk upload Team Member Start ---->
		

		
<div class="modal fade" id="uploadUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Team Members selected for Bulk Allocation</h4> 
      		</div>
      		
      			<div class="modal-body">
      			<form id="bulkall" name="bulkall" method="post"> 
      		<input type="hidden" name="partyIdList" id="bulkPartyIds"/>
<input type="hidden" name="alloBU" id="allocatedBuId"/>
					<table class="table table-striped" style="margin-top: 10px;">
						<tr>
							<th class="class">Available Biz Unit [Department]</th>
							<th></th>
							<th class="class">Allocated Biz Unit [Department]</th>
						</tr>
						<tr>
							<td>
								<select name="from_select_list" id="from_select_list" size="8" multiple="multiple" style="height: 150px; width: 200px"></select>
							</td>
							<td>
								<table>
									<tr>
										<td>
											<input class="btn btn-sm btn-primary" value="Move >>" id="moveright" type="button" onclick="move_list_items('from_select_list','to_select_list');">
										</td>
									</tr>
									<tr>
										<td>
											<div class="space"></div>
										</td>
									</tr>
									<tr>
										<td>
											<input class="btn btn-sm btn-danger" value="<< Move" id="moveleft" type="button" onclick="move_list_items('to_select_list','from_select_list');">
										</td>
									</tr>
								</table>
							</td>
							<td>
								<select name="departmentIdList" id="to_select_list" size="8" multiple="multiple" style="height:150px; width:150px"></select>
							</td>
						</tr>
					</table>
					<span class="searchpadding padding_top" style="float: left; width: 150px;"> Starts On <span class="red">*</span>
					</span> 
					
					<div class="col-sm-9"><i class="fa fa-calendar bigger-120"></i>&nbsp;&nbsp;
                  		<input name="startDate" type="text" id="addstartDatepickerId" readonly="readonly" validate="date" maxlength="20" class="input-large" placeholder="Start Date" />
                	</div>
					<span class="searchpadding padding_top" style="float: left; width: 150px;"> Expires On </span> 
						
					<div class="col-sm-9"><i class="fa fa-calendar bigger-120"></i>&nbsp;&nbsp;
                  		<input name="expiryDate" type="text" id="addexpireDatepickerId" readonly="readonly" validate="date" maxlength="20" class="input-large" placeholder="End Date" />
                	</div>
                	<div class="clearfix"></div>
                	<div class="space"></div>
					</form>
				<div class="clearfix"></div>
				<div class="topbuttonholder" style="text-align: center; margin-top: 10px;">
					<div style="float:right;">
						<button  class="btn btn-sm btn-primary" onClick="saveBulkAllocation();"><i class='ace-icon fa fa-plus'></i>Save</button>
                    	<button  class="btn btn-sm btn-danger" onClick="location.reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button>
					</div>
					<div class="clearfix"></div>
				</div>
			
				</div>
			
	</div>
  </div>
</div> 
<!---- Bulk upload Team Member End ---->	


<!---- Edit Service Team Member Start ---->
<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
    		<form class="form-horizontal" id="editForm" >
      		<div class="modal-header">
        		<button type="button" class="close" onClick="location.reload();" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Edit Service Team Member</h4> 
      		</div> 
      		<input type="hidden" id="editpartytype" name="editpartytype">
			<input type="hidden" name="partyID" id="partyids">
				<!--<div class="modal-body">
					
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Party Type:</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<input type="hidden" name="partyID" id="partyids">
								<select name="editpartytype" id="editpartytype" class="col-xs-12 col-sm-9" onfocus="editpartytypelist();">
                               	 <option>Service Team Member</option>	
 								</select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
					-->	
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Member Name:<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="editmembername" id="editmembername" readonly="readonly" class="col-xs-12 col-sm-9"  placeholder="Harish Bharke">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
	
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Email Id:<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="contactemail" id="editemailid" class="col-xs-12 col-sm-9" placeholder="" onchange='f2(this);'>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Mobile No:<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								
								<div class="input-group">
									<span class="input-group-addon">
										<i class="ace-icon fa fa-phone"></i>
									</span>
								<input name="contactMobile"  id="editmobileno"  placeholder="Mobile No"  type="text" />
								</div>
								<div class="clearfix">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
					</div>
					 <div class="modal-footer">
        				<button  class="btn btn-sm btn-primary" onClick="teamMemberUpdate();"><i class='ace-icon fa fa-plus'></i>Save</button>
                    		<button  class="btn btn-sm btn-danger" onClick="location.reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button> 
    				 </div>
    				 </form>	
    			</div>
		</div>
</div>
<!---- Edit Service Team Member End ---->

<!-- Service Team Action Start-->
<div class="common_dialog hide action_dialog">
  	<table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
    	<tbody>
      	<tr id="">
        	<th class="thead">Action List</th>
      	</tr>
      	<tr id="">
        	<td id="SPServiceTeamActionLink"><i class="fa fa-check"></i> <a onclick=""><span class="">Allocation</span></a></td>
      	</tr>
    	</tbody>
  	</table>
</div>

<!-- Service Team Action End-->
	<!--Nav Menu Start-->
	<div class="navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--<a class="navbar-brand" href="#"> </a>-->
			</div>
		</div>
	</div>
	<!---- Nav Menu End ---->
	
	<!-- <div class="page-header">
		<h1 class="pull-left">Service Teams List</h1>
              <form class="form-search pull-right">
               		<span class="input-icon">
                		<input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                		<i class="ace-icon fa fa-search nav-search-icon"></i>
                	</span>
               </form>
         <div class="clearfix"></div>
	</div> -->
	
	<div class="page-title page-header clearfix">
       <h1 class="pull-left">Service Teams List</h1> 
       </div>
                        
	<!---- Center part start ---->
	<section>
			<div class="container-body">
				
				<ul class="pagination pagination-sm"></ul>	
				<div class="pull-right">
					
					<button id="SPBulkAllocationServiceTeamLink" class="btn btn-xs btn-primary" onClick="bulkAllocate();"><i class='ace-icon fa fa-database'></i>Bulk Allocation</button>
					<button id="SPAddNewServiceTeamLink" class="btn btn-xs btn-primary" onClick="addNote();loadRole();"><i class='ace-icon fa fa-plus'></i>New Member</button>
                    <button id="SPDeleteServiceTeamLink" class="btn btn-xs btn-primary" onClick="deleteTeamMemberList();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
									
				</div>
				
				<div class="clearfix"></div>
							
				<div class="table-responsive" id="display_table_lead">
					<div id="toreload">
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
					</div>
				</div>


				<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >
          			 	<span>Export options:</span>
          			 	
          					<a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-120"></i></a>
          					<a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-120"></i></a>
          					
                    </div>
				</div>
				
				<div class="pull-right">
				<div class="hr-12"></div>
				
					<button id="SPBulkAllocationServiceTeamLink" class="btn btn-xs btn-primary" onClick="bulkAllocate();"><i class='ace-icon fa fa-database'></i>Bulk Allocation</button>
					<button id="SPAddNewServiceTeamLink" class="btn btn-xs btn-primary" onClick="addNote();loadRole();"><i class='ace-icon fa fa-plus'></i>New Member</button>
                    <button id="SPDeleteServiceTeamLink" class="btn btn-xs btn-primary" onClick="deleteTeamMemberList();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
										
				</div>
				
			</div> 
		
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	<script>
      function numbersOnly(oToCheckField, oKeyEvent) {        
        var s = String.fromCharCode(oKeyEvent.charCode);
        var containsDecimalPoint = /\./.test(oToCheckField.value);
        return oKeyEvent.charCode === 0 || /\d/.test(s) || 
            /\./.test(s) && !containsDecimalPoint;
      }
    </script>

	<script>

	function departmentlist()
	 {
		
	 	$.ajax({    	 
	      type: "POST",
	      url: $('#contextPath').val()+'/teammember/getDepartmentSection.htm?bizunit=',  
	      dataType: 'json', 
	      contentType: 'application/json',     
	         success:function(result)  
	      { 
	      
	       		//	$('#adddepartment').empty();         
	     			$('#departmentID').append('<option value="0">--Select--</option>');
	 		
	       			 $(result).each(   
	    		  
	       			 function(i, obj) {
	       			
	       				var moduleid=obj.departmentId;
	       				var moduleName=obj.displayShortName;  
	       				//alert(moduleid);
	       				//alert(moduleName);
	     	   
	         $('#departmentID').append('<option value="'+ moduleid+'">'+ moduleName + '</option>');
	       
	        });     

	     
	      }
	   
	   });   
	 	
	 }
	
	function getClear()
	{
		
		$('#success-msg').val('');
		$('#success-msg').empty();
	}
	
	function pagesizeurl(){
		//var pageSize=$('#page').val();	
	 	//window.location.href= $('#contextPath').val()+'/teammember/loadteammember.htm?pageSize='+pageSize;
		$("#toreload").load('${pageContext.request.contextPath}/teammember/loadteammember.htm #toreload', {
			   object: '${object}',
			   pageSize: $('#page').val(),

		}, function( response, status, xhr ) {
		      try{
		        
		        //closePopupWebApp('');
		    	  $('#selecctall').click(function(event) {  //on click 
		    	        if(this.checked) { // check select status
		    	            $('.checkbox1').each(function() { //loop through each checkbox
		    	                this.checked = true;  //select all checkboxes with class "checkbox1"               
		    	            });
		    	        }else{
		    	            $('.checkbox1').each(function() { //loop through each checkbox
		    	                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
		    	            });         
		    	        }
		    	    });
		      }catch(e){
		        // closePopupWebApp('');       
		      }
		     });
	}

function addNote(){
	$("#deletenote, #editnote, #uploadUser").hide();	
	//$('#addnote').modal('show');
	$("#addnote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
	}

function deleteNote(){
	$("#editnote,#addnote, #uploadUser").hide(); 
	//$('#deletenote').modal('show');
	$("#deletenote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
	}

function editNote(){
	$("#deletenote, #addnote, #uploadUser").hide();	
	//$('#editnote').modal('show');
	$("#editnote").modal({
	    backdrop: 'static',
	    keyboard: false
	});
	}

function UploadUser(){
	$("#addnote, #editnote, #deletenote").hide();
	//$('#uploadUser').modal('show');
	$("#uploadUser").modal({
	    backdrop: 'static',
	    keyboard: false
	});
	}





function LoginonBehalf(){

$("#LoginonBehalf").show();	
/* $("#LoginonBehalf").modal({
    backdrop: 'static',
    keyboard: false
}); */
$("#addnote, #editnote, #uploadUser, #deletenote").hide();	
$("#popUpAlertaddnote").css ('height','250px')
$("#popUpAlertaddnote").css ('width','300px')

}


function biz(){
$("#biz").show();	
$("#user, #role, #city").hide();	

}
function user(){
$("#user").show();	
$("#biz, #role, #city").hide();	

}
function role(){
$("#role").show();	
$("#biz, #user, #city").hide();		
}
	
function city(){
$("#city").show();	
$("#biz, #user, #role").hide();		
}

function biz1(){
$("#biz1").show();	
$("#user1, #role1, #city1").hide();	

}
function user1(){
$("#user1").show();	
$("#biz1, #role1, #city1").hide();	

}
function role1(){
$("#role1").show();	
$("#biz1, #user1, #city1").hide();		
}
	
function city1(){
$("#city1").show();	
$("#biz1, #user1, #role1").hide();		
}

//select all checkbox
$(document).ready(function() {
    $('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            $('.checkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"               
            });
        }else{
            $('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
            });         
        }
    });
    
});


//on page load role dropdown list
/* $(document).ready(function(){
	
	loadRole();
  }) */

function addTeamMemberList(closePopup)
{
	$('#success-msg').empty();
	var checkPopup=closePopup;
	
	//alert("WEEEEEE");
	/* 
			//removed blank spaces before submit data
			document.getElementById("addFirstName").value = document.getElementById("addFirstName").value.trim();
			document.getElementById("addMiddleName").value = document.getElementById("addMiddleName").value.trim();
			document.getElementById("addLastName").value = document.getElementById("addLastName").value.trim();
			document.getElementById("addUserName").value = document.getElementById("addUserName").value.trim();
			document.getElementById("addEmailId").value = document.getElementById("addEmailId").value.trim();
			
			
	$.ajax({
		type :'POST',
		url : $('#contextPath').val()+"/teammember/addNewTeamMember.htm",
		data:$('#addForm').serialize(),
		 success : function(result) { 
           alert( 'Team member added successfully.');
		 }
		});
	} */
/* 	$.mask.definitions['~']='[+-]';
	$('#phone').mask('(999) 999-9999');
	
	$('.input-mask-phone').mask('(999) 999-9999');
	
	jQuery.validator.addMethod("phone", function (value, element) {
		return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
	}, "Enter a valid phone number."); */
	
	
	jQuery.validator.addMethod("phone", function (value, element) {
		return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
	}, "Enter a valid phone number.");
	
	
	var validator=$('#addForm').validate({
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
			
			roleID: {
				required: true
			},
			firstName: {
				required: true
			},
			lastName:{
				required: true
			},
			userName: {
				required: true
			},
			contactemail:{
				required: true,
				email:true
			},
			contactMobile:{
				required: true,
				number:true,
				minlength:10,
				maxlength:10
			}
			
		},

		messages: {
			email: {
				required: "Please provide a valid email.",
				email: "Please provide a valid email."
			},
			password: {
				required: "Please specify a password.",
				minlength: "Please specify a secure password."
			},
			state: "Please choose state",
			subscription: "Please choose at least one option",
			gender: "Please choose gender",
			agree: "Please accept our policy"
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
			//alert('INN');
				document.getElementById("addFirstName").value = document.getElementById("addFirstName").value.trim();
				document.getElementById("addMiddleName").value = document.getElementById("addMiddleName").value.trim();
				document.getElementById("addLastName").value = document.getElementById("addLastName").value.trim();
				document.getElementById("addUserName").value = document.getElementById("addUserName").value.trim();
				document.getElementById("addEmailId").value = document.getElementById("addEmailId").value.trim();
				$.ajax({
					type :'POST',
					url : $('#contextPath').val()+"/teammember/addNewTeamMember.htm",
					data:$('#addForm').serialize(),
					 success : function(result) { 
							// alert('Checkpopup'+checkPopup);							
						 	
						if(checkPopup == 0){
							 $('#success-msg').empty();	
							 $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>You successfully saved team member.</p></div>');
							 document.getElementById("addForm").reset();	   
						}
						if(checkPopup == 1){
							$("#addnote").hide();
							 bootbox.dialog({
									message: "<span class='bigger-110'>Team member saved successfully</span>",
									buttons: 			
									{
										"click" :
										{
											"label" : "OK!",
											"className" : "btn-sm btn-primary",
											"callback": function() {
												 location.reload();
												 document.getElementById("addForm").reset();	
											}
										}
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

function resetVal()
{
	   // $('#roleID').append('<option value="0">--Select role--</option>');
	    $("#roleID option[value='0']").attr('selected', 'selected');
		$('#addFirstName').val('');
		$('#addMiddleName').val('');
		$('#addLastName').val('');
		$('#addUserName').val('');
		$('#addEmailId').val('');
		$('#addMobilNo').val('');
		
}

 


function checkMemberName()
{
 var userName = $('#addUserName').val().trim();
 if(userName=="")
 {
  	return false;
 }
 if(userName!="")
 {
 	 $.ajax
  	({         
      type: "GET",
      url: $('#contextPath').val()+"/teammember/getUniqueMember.htm?userName="+userName, 
      dataType: 'json',										
      async : false,											
      contentType: 'application/json',
      success : function(result) 
		 { 
          
    	  	if(result == 1){
    	  		alert('User name already exist');
    	  		$('#addUserName').val('');
    	  		return true;
    	  	} else {
    	  		return false;
    	  	}
        	
		 }
        /*  success:function(result)
      { 
       	  $(result).each(
						function(i, obj) 
						{
							var module=obj.userStatus;
							alert("UserStatus="+module);
							if(module==1)
								{
								 alert('MemberName is already exists');
								 +$('#addUserName').val('');
								}
						});					
          
        
      } */
   
   });
 }
 
}


/*  function addgeneratePassword()
{
    var addpasswordId = '';
    var availableSymbols = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0987654321_@#$*";
    for(var i = 0; i < 20; i++)
    {
        var symbol = availableSymbols[(Math.floor(Math.random() * availableSymbols.length))];
        addpasswordId += symbol;
       
    }
    //$('#addpasswordId').val(addpasswordId);
    return addpasswordId;
}  */




function edit(partyID,username,pramodmob,email)
{
	  	//editpartytypelist();
	  	//alert(partyID);
		//alert(username);
		//alert(pramodmob);
		//alert(email);
	  
	  
	  document.getElementById("partyids").value=partyID;
	  
	 	
	    $("#editmembername").val(username);
	    $("#editemailid").val(email);
	    $("#editmobileno").val(pramodmob); 
	 //   document.getElementById("#partyids").value=partyID;
	    
		/* $('#editpartytype').empty();
		$('#editpartytype').append('<option value="'+ recordid+'">'+ codevalue + '</option>');
		$('#editpartytype').append('<option value="0">--Select--</option>');
	     */
		//popup('popUpAlertaddnote');
}


function teamMemberUpdate()
{
	/* $.mask.definitions['~']='[+-]';
	$('#phone').mask('(999) 999-9999');
	
	$('.input-mask-phone').mask('(999) 999-9999'); */
	
	jQuery.validator.addMethod("phone", function (value, element) {
		return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
	}, "Enter a valid phone number.");
	
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
			
			roleID: {
				required: true
			},
			firstName: {
				required: true
			},
			lastName:{
				required: true
			},
			userName: {
				required: true
			},
			contactemail:{
				required: true,
				email:true
			},
			contactMobile:{
				required: true,
				number:true,
				maxlength:10,
				minlength:10
			}
			
		}, 

		messages: {
			email: {
				required: "Please provide a valid email.",
				email: "Please provide a valid email."
			},
			password: {
				required: "Please specify a password.",
				minlength: "Please specify a secure password."
			},
			state: "Please choose state",
			subscription: "Please choose at least one option",
			gender: "Please choose gender",
			agree: "Please accept our policy"
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
				$.ajax({
					type :'GET',
					url : $('#contextPath').val()+"/teammember/updateTeamMember.htm",
					data:$('#editForm').serialize(),
				    success:function(result)
				      { 
				    	$("#editnote").hide();
				    	 bootbox.dialog({
								message: "<span class='bigger-110'>Team member updated successfully</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 location.reload();
											 document.getElementById("editForm").reset();	
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

	function bulkAllocate(){
		var selectedlvals = [];
		  $('input:checkbox[id=chkdeleteselect]:checked').each(function() {
			  selectedlvals.push($(this).val());
		  });
		 //alert('Selected Checkbox values are: ' + selectedlvals);
		//document.getElementById("memCount").innerHTML=selectedlvals.length;
		if(selectedlvals == ""){
			 //alert('Please select at least one Team member to Allocate');
			 bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one Team member to Allocate</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
								//Example.show("Primary button");
							}
						}
					}
				});

			 return;
		  }
		else
			{
				UploadUser();
			}
		
		//alert(selectedlvals);
		
		loadDepartment();
		$('#bulkPartyIds').val(selectedlvals);
		//document.getElementById("bulkpartyIds").value = selectedlvals;
		//document.forms['bulkall'].elements['bulkpartyIds'].value= selectedlvals
		
		//popup('popUpAlertaddnote');
	}
  
	
	function loadDepartment()
	{
		
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/teammember/loadAvailableBizUnitDepartment.htm",
			dataType: 'json',
			contentType: 'application/json',
			success : function(result) {
				//var statusList=result;
				//$("#reordervalues").append('<div id="popupwrapper_contactform">	<div class="heading_contactform"><h3>Reorder values</h3></div><br>'+codeTypeId+'['+codeType+']</div>');
				$('#from_select_list').empty();
				$(result).each(
						function(i, obj) {

							var codeValue = obj.displayShortName;
							var codeValueId = obj.departmentId;
							var buid = obj.buid;
							i++;
							//alert("codeValueId="+codeValueId);
							//alert("BuId="+buid);
							$('#from_select_list').append('<option value="'+codeValueId+','+buid+'"> ['+ codeValue +']</option>');
						});
				
				//$('#select3').empty();
				
				//$('#bulkPartyIds').val(val);
						}
	            
	  });
	}
	
	
  /* start code to delete list items  */
	function deleteTeamMemberList()
	{ 
		  var selectedlvals = [];
		  $('input:checkbox[id=chkdeleteselect]:checked').each(function() {
			  selectedlvals.push($(this).val());
		  });
		// alert('Selected Checkbox values are: ' + selectedlvals);
		if(selectedlvals == "")
		{	
			/* bootbox.confirm("Please select at least one item to delete", function(result) {	
				
			}); */
			
			bootbox.dialog({
				message: "<span class='bigger-110'>Please select at least one item to delete.</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							//Example.show("Primary button");
						}
					}
				}
			});

			
			
			 return;
		  }
		else
			{
				deleteNote();
			}
		  document.getElementById("confirmdelete").value = selectedlvals;
		  
	};

	 function confirmDelete()
	{
		 var selectedlvals= document.getElementById("confirmdelete").value;
		 
	   	  $.ajax({
				   type : 'GET',
				   url : $('#contextPath').val()+"/teammember/deleteTeamMemberList.htm?selectedlvalz="+selectedlvals,
	 			   success : function(result)
		            {
	 				  if(result == 0){
	 					 $("#deletenote").hide();
		 				  bootbox.dialog({
		 						message: "<span class='bigger-110'>One or More Selected Service Team Member is allocated to Parter from list, So Cannot delete it..</span>",
		 						buttons: 			
		 						{
		 							"click" :
		 							{
		 								"label" : "OK!",
		 								"className" : "btn-sm btn-primary",
		 								"callback": function() {
		 									//location.reload();
		 								}
		 							}
		 						}
		 					});
	 				 	 }else {
	 				 		 
	 				 		$("#deletenote").hide();
			 				  bootbox.dialog({
			 						message: "<span class='bigger-110'>Service team member deleted successfully.</span>",
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
	 				      // Do something after 5 seconds
	 				  
	 				 
	 				 //location.reload();
                   }
		   }); 
	}
	 function reload()
		{
			location.reload();
		}
	   

 function validEmail(addEmailId) 
 {
     
     var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
     
     if (filter.test($('#addEmailId').val())) 
     {
         return true;
     }
     else 
     {
         return false;
     }
 }  
 
 function editvalidEmail(editemailid) 
 {
     
     var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
     
     if (filter.test($('#editemailid').val())) 
     {
         return true;
     }
     else 
     {
         return false;
     }
 }  

 
/*  $('#addMobilNo').blur(function(){
	    if ($('#addMobilNo').val().match(/[^0-9 ]/g)) 
	    {
	       this.value = this.value.replace(/[^0-9 ]/g, '');
	    }
	});
 
 $('#editmobileno').blur(function(){
	    if ($('#editmobileno').val().match(/[^0-9 ]/g)) 
	    {
	       this.value = this.value.replace(/[^0-9 ]/g, '');
	    }
	}); */
 //Avoide Extra space
 
 $('#addUserName').keyup(function() {
	    $(this).val(function(i, value) {
	       return value.replace(/\s/, '');
	    }); 
	});
 

 
 function bulkAllocationRequiredVals(){http://localhost:8080/FIINFRA-SERVICE-PORTAL/teammember/loadteammember.htm#
	 
	 if($('#to_select_list').val()==null)
	 {
		 //alert('Please allocate department');
		   bootbox.dialog({
				message: "<span class='bigger-110'>Please allocate department.</span>",
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
		 
		 return false;
	 }
	 
	 if($('#addstartDatepickerId').val()=="")
		{
			alert('Please enter start Date');
			//$('#addstartDatepickerId').removeAttr("readonly");
			  
			$('#addstartDatepickerId').focus();
			return false;
		}

	 return true;
 }
 

	function move_list_items(sourceid, destinationid)
	{
		//alert(sourceid);
		$("#"+sourceid+"  option:selected").appendTo("#"+destinationid);
	}
 
 function saveBulkAllocation()
 {
	 if(bulkAllocationRequiredVals() == true)
	 {
		 
		 var ddlArray= new Array();
		 var dd2Array= new Array();
		 var ddl = document.getElementById('to_select_list');
		 for (i = 0; i < ddl.options.length; i++) {
			 //alert(ddl.options[i].value);
			 var s= ddl.options[i].value.split(",");
		   // ddlArray[i] = ddl.options[i].value; 
		   for (var k = 0; k < s.length; k++) 
		   {
		   		//alert(s[k]);
		   		if(k==0)
		   		{
		   			ddlArray[i] = s[k];
		   		}
		   		if(k==1)
		   		{
		   			dd2Array[i] = s[k];
		   		}
		   		
			 	//k++;
		   }
	  }
		ddlArray.map(function(val) { return val.split(",").reverse().join(","); });
		dd2Array.map(function(val) { return val.split(",").reverse().join(","); });
		 
		var myJoinedString = ddlArray.join(',');
		var myJoinedString1 = dd2Array.join(','); 
		
		 //alert(myJoinedString);
		// alert(myJoinedString1);
		 
		/* var s= myJoinedString.split(",");
		
		var deptarray= new Array();
		var bizarray = new Array();
         for (var k = 0,k1=1; k < s.length; k=k+2,k1=k1+2) {
               
        	 deptarray.push(s.options[k].value); */
        	 
        	 //deptarray[k] = s.options[k].value; 
        	 //bizarray[k1] = s.options[k1].value; 
        	 	/* var a=s[k];
               var b=s[k1];
               alert(a);
               alert(b) */
		//}
		// alert(deptarray);
		 //alert(bizarray);
		 
		 $('#departmentIdList').val(myJoinedString);
		 $('#allocatedBuId').val(myJoinedString1);
		// alert(myJoinedString); 
		   /*  var ids = $('#to_select_list').val();
			var selectedPartyIds = document.getElementById("bulkPartyIds").value;
			var startDate  = $('#addstartDatepickerId').val();
			var expiryDate = $('#addexpireDatepickerId').val();
			
			alert(ids);
			alert(selectedPartyIds);  
			alert(startDate);
			alert(expiryDate); */
		
		$.ajax({
			type :'POST',
			url : $('#contextPath').val()+"/teammember/addBulkAllocation.htm",
			//url : $('#contextPath').val()+"/teammember/addBulkAllocation.htm?departmentIds="+ids+"&partyIds="+selectedPartyIds+"&startDate="+startDate+"&expiryDate="+expiryDate,
			data:$('#bulkall').serialize(),
					
			success : function(result) 
			 { 
				/* 
	            alert( 'Department allocated successfully.');
	            location.reload(); */
	     	   bootbox.dialog({
					message: "<span class='bigger-110'>Department allocated successfully.</span>",
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
	 
 }
 
//get role
	function loadRole(){
	
		 $.ajax
		 ({
	            
	    type: "GET",
	    url: $('#contextPath').val()+'/broadcast/getRoleList.htm', 
	    dataType: 'json',
	    contentType: 'application/json',
	       success:function(result)
	    { 
	    	  
		    $('#roleID').empty();
		    $('#roleID').append('<option value="">--Select role--</option>');  	
	      	$(result).each(function(i, obj) {
	    
	   
	    		var rolename = obj.roleName;
	    		var roleid = obj.roleID;
	    		
		   		$('#roleID').append('<option value="'+ roleid+'">'+ rolename + '</option>');	
	
	   });
	    }
	 
	 });
	}
 
 
 
 $(document).ready(function() {
	 	var d = new Date();

		var month = d.getMonth()+1;
		var day = d.getDate();

		var output = (day<10 ? '0' : '') + day + '/' +		(month<10 ? '0' : '') + month + '/' +		d.getFullYear();

		$("#addstartDatepickerId").val(output);
	    $("#addstartDatepickerId").datepicker({
	        showOn: 'button',
	        minDate : '0',
	        buttonText: 'Show date',
	        buttonImageOnly: true,
	        buttonImage: '../images/calendar.gif',
	        dateFormat: 'dd/mm/yy',
	        constrainInput: true,
	        
	        onSelect: function(selected) 
	        {
	            $("#addexpireDatepickerId").datepicker("option","minDate", selected)
	         }
	    });

	    $(".ui-datepicker-trigger").mouseover(function() {
	        $(this).css('cursor', 'pointer');
	    });
	});

	$(document).ready(function() {
		var output = '31/12/2099';
		$("#addexpireDatepickerId").val(output);
	    $("#addexpireDatepickerId").datepicker({
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
	
	function f2(el) 
	{
	    el.value = el.value.toLowerCase();
	}
	
	function getXLS()
	{
			window.location.href = "<%=request.getContextPath()%>/teammember/teammemberExecl.htm";
	}
	function getCSV()
	{
			window.location.href ="<%=request.getContextPath()%>/teammember/teammemberCSV.htm";
	}
	
	</script>
	
	
	<!--------------------------- New UI changes code ------------------------------>
	
	
	<script type="text/javascript">
	var grid_data='${teamMemberList}';
	//alert(grid_data);
	index=JSON.parse(grid_data);
	/*var index=new Array();
	$(grid_data).each(function(i,obj) {
		var object = {};
		object.name = obj.name;
		object.pingOwner=obj.pingOwner;
		object.notifyTemplateID=obj.notifyTemplateID;
		index.push(object);
		
	});*/
	
	
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
			//datatype: "local",
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
			height: 350,
			ignoreCase: true,
			//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
			colNames:[' ',' ','Team Member Name','User Name','Allocated BU & Departments','Email ID','Action'],
			colModel:[
					/* {name:'myac',index:' ', width:50, fixed:true, sortable:false, resize:false,
					formatter:'actions', 
					formatoptions:{ 
						keys:true,
						delbutton: false,//disable delete button
						//delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
						editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
					}}, */
					{name:'myac',index:' ', width:50, fixed:true, sortable:false, resize:false,
					formatter: function(cellvalue, options,rowObject) {
			              return '<a href="#" onclick="editNote();edit('+rowObject.partyID+',\''+rowObject.userName+'\',\''+rowObject.contactMobile+'\',\''+rowObject.contactemail+'\',\''+rowObject.codeValue+'\');" id="SPEditServiceTeamLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			              								
			          }},
					{name:'chkeditselected', index:'checkbox',width:50,sortable:false,formatter:function(cellvalue, options,rowObject) {
						return '<input role="checkbox" type="checkbox"  class="cbox" id="chkdeleteselect" value="'+rowObject.partyID+'" name="chkdeleteselect[]">';
					
					}},
		/* 			{name:'favouriteTemplate', index:'favouriteTemplate',formatter:function(cellvalue, options,rowObject) {
					var html='';
				    if(rowObject.favouriteTemplate==1)
				    	html+= '<i class="favoriteicon" title="Favorite"></i><br/><br/>';
				    if(rowObject.mostUsedTemplate==1)
				    	html+= '<i class="mostusedNewicon" title="Most Used"></i><br/><br/>';
				    if(rowObject.mostPopularTemplate==1)
				    	html+= '<i class="popularicon" title="Most Popular"></i><br/><br/>';
				    return html;
				}}, */
				//{name:'ListMember', index:'editLink'/* ,formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addPing.htm?notifyTemplateId='} */},
				{name:'userName',index:'userName'},
				{name:'lastName',index:'lastName',},
				{name:'alloBU',index:'alloBU', width:'200'},
				{name:'contactemail',index:'contactemail'},
			
				{name:'action',index:'action', width:'100',formatter:function(cellvalue, options,rowObject) {
				    return '<a onclick="openActionPopup('+rowObject.partyID+',\''+rowObject.userName+'\')">Action</a>';
				    
				}},
				/*{name:'sdate',index:'sdate',width:90, editable:true, sorttype:"date",unformat: pickDate},
				{name:'name',index:'name', width:150,editable: true,editoptions:{size:"20",maxlength:"30"}},
				{name:'stock',index:'stock', width:70, editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch},
				{name:'ship',index:'ship', width:90, editable: true,edittype:"select",editoptions:{value:"FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}},
				{name:'note',index:'note', width:150, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}}*/ 
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
			//caption: "jqGrid with inline editing"
	
			autowidth: true,
            shrinkToFit: true,	
	
	
	
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
	

	
</script>	

<script>
	function ViewServiceTeamAction(partyID,userName)
	{
  		 window.location.href = $('#contextPath').val()+"/teammember/allocationList.htm?partyID="+partyID+"&userName="+userName;
   
	}
  
	function openActionPopup(partyID,userName)
	{
		//alert("partyID="+partyID);
		//alert("userName="+userName);
		
   		$('#SPServiceTeamActionLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();ViewServiceTeamAction('+partyID+',\''+userName+'\')'); 
   		if('${sessionScope.userSession.buId}'!='27829')
   		{
    		$('#SPServiceTeamActionLink').removeClass('hide');
   		}
   		else
   		{
    		$('#SPServiceTeamActionLink').removeClass('hide');
   		}
   
   
    $( ".action_dialog" ).removeClass('hide').dialog({
    resizable: false,
    modal: true,
    width: "auto",
    }); 
    }
  
    jQuery(function(cash) {
    $("#search").keyup(function(event) {
    if (event.keyCode == 13) 
    {
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
    $('#SPServiceTeamLink').addClass('active');
	 $('#SPBizUnitLink').addClass('active');
</script>
  
 



</body>
</html>
