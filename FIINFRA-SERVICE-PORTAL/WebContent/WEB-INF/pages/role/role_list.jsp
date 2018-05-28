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
<title>Role List</title>
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
	
	<!--css popup window start 1-->
	<!--Add Service Team Member Start-->
	<div style="display: none;" id="blanket"></div>

		<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
 	  	<div class="modal-content">
      	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Role</h4>
     	</div>
     		<div id="success-msg"></div>
     	 <div class="modal-body">
     
     	 			<form class="form-horizontal" id="addform1" method="POST">
     	 			<input type="hidden" name="SDSD" id="SDSD">
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Role Name :<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								
								 <input type="text" name="roleName" id="roleNameId" onchange="getRoleName('add');" class="col-xs-12 col-sm-6"/>
							</div>
						</div>
					</div>
     	 		
     	 			<div class="space-2"></div> 
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Description :</label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
		                  <textarea
								class="form-control" rows="5" name="roleDescription"
								id="descriptionId" class="col-xs-12 col-sm-6"></textarea>
								 </div> 
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			
     	 			<div class="space-2"></div> 
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Start Date :<span class="red">*</span></label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								
								  <input type="text" name="startDate"  readonly='true' id="startDatepickerId" class="col-xs-12 col-sm-6"/>
							</div>
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			
     	 			<div class="space-2"></div> 
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Expiry Date :</label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								
								 <input type="text" name="expiryDate"  readonly='true' id="expireDatepickerId" class="col-xs-12 col-sm-6"/>
							</div>
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			
     	 			<div class="space-2"></div> 
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Control Options :</label>

						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								
								 <input id="isactiveId" name="isActive" type="checkbox" checked="checked" >&nbsp<label>  Active?</label>
							</div>
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			<div class="modal-footer"> 
     	 			<div class="form-group">
						
						<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="platform"></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
								<button id="SPRoleAddNewLink" class="btn btn-sm btn-primary"  onclick="addNewRole(0);" ><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button id="SPRoleAddNewLink" class="btn btn-sm btn-primary" onclick="addNewRole(1);" ><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-plus"></i> Cancel</button>
							</div>
						</div>
					</div>	
				</div> 
					
			</form>
			</div></div> </div></div>
     	 		
			
					

			<!-- delete-->
<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Delete Record</h4>
          </div>
          <div class="modal-body">
        	Do you want to delete this selected records? Please confirm.
        	</div>
				 <div class="modal-footer">
					<form>		
					
					  <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"> Yes</button>
					  <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"
					  class="close" data-dismiss="modal" aria-label="Close">No</button>	
					</form>
						</div>
						    </div>.					
				</div>
 		</div>
 		
		<!-- delete-->
		

		<!-- Edit-->
		
		
			<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 			 <div class="modal-dialog">
    		<div class="modal-content">
    		<div class="modal-header">
      	 	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       	 	<h4 class="modal-title" id="myModalLabel">Edit Role</h4>
      		</div>
      	<div class="modal-body">

			
			
			<form class="form-horizontal" id="updateform" method="POST">
			<input type="hidden" name="roleId" id="roleIdEdit">
			<input type="hidden" name="oldNameId" id="oldNameId">
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Role Name :<span class="red">*</span></label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							 <input type="text" name="roleName" id="roleNameIdEdit" onblur="getRoleName('edit');" class="col-xs-12 col-sm-6"/>
							</div>
						</div>
					</div>
     	 		
     	 			<div class="space-2"></div> 
     	 			
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="roledescriptionIdEdit">Description :</label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							 <textarea
								class="form-control" rows="5" name="roleDescription"
								id="roledescriptionIdEdit" class="col-xs-12 col-sm-6"></textarea>
							</div>
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			
     	 			
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Start Date :<span class="red">*</span></label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							  <input type="text" name="startDate"  readonly='true' id="editstartDatepickerId" class="col-xs-12 col-sm-6"/>
							</div>
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			
     	 			
						<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Expiry Date :</label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							 <input type="text" name="expiryDate"  readonly='true' id="editexpireDatepickerId" class="col-xs-12 col-sm-6"/>
							</div>
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			
     	 		
					<div class="form-group">
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Control Options :</label>
						 <div class="col-xs-12 col-sm-9">
							<div class="clearfix"> 
							 <input id="isactiveIdEdit" name="isActive" type="checkbox" checked="checked" >&nbsp<label>  Active?</label>
							</div>
						</div>
					</div>
					
     	 			<div class="space-2"></div> 
     	 			<div class="modal-footer"> 
     	 			<div class="form-group">
						
						<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="platform"></label>
						<div class="col-xs-12 col-sm-9">
							<div class="clearfix">
							
							<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="submitEditedRole();"> Save</button>
       						<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger"type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button> 
							
							
							</div>
						</div>
					</div>	
				</div> 
					
			</form>
			</div> </div></div></div>	
     	 	
		<!-- Edit End-->

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
	
	<%-- <div class="page-header">
		<h1 class="pull-left">Role List</h1>
               <form class="form-search pull-right">
               		<span class="input-icon">
                		<input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                		<i class="ace-icon fa fa-search nav-search-icon"></i>
                	</span>
               </form>
         <div class="clearfix"></div>
	</div> --%>
	
	<div class="page-title page-header clearfix">
       <h1 class="pull-left">Role List</h1> 
       </div>
                        
	<!---- Center part start ---->
	<section>
			<div class="container-body" >
				
				<ul class="pagination pagination-sm"></ul>	
				<div class="pull-right">
					
					
					
					
				 	<button id="SPRoleAddNewLink" class="btn btn-xs btn-primary" onClick="addNote();"><i class='ace-icon fa fa-plus'></i>New Role</button>
					<button id="SPRoleDeleteLink" class="btn btn-xs btn-primary" onClick="deleteRole();"><i class='ace-icon fa fa-trash'></i>Delete</button>
                   
									
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
          			 	
          					<a href="<%=request.getContextPath()%>/rolelist/roleCSV.htm" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-140"></i></a>
							<a href="<%=request.getContextPath()%>/rolelist/roleExecl.htm" title="Export in Excel" alt="Export in Excel"> <i class="fa fa-file-excel-o bigger-140"></i></a></ul>
                    </div>
				</div>
				
				<!-- <div class="pull-right">
				<div class="hr-12"></div>
					<button id="SPRoleAddNewLink" class="btn btn-sm btn-primary" onClick="addNote();"><i class='ace-icon fa fa-plus'></i>New Role</button>
					<button id="SPRoleDeleteLink" class="btn btn-sm btn-primary" onClick="deleteRole();"><i class='ace-icon fa fa-trash'></i>Delete</button>
                	   <button id="SPDeleteServiceTeamLink" class="btn btn-xs btn-danger" onClick="deleteTeamMemberList();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
										
				</div> -->
				
			</div>
		
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />

	</footer>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	<script>
	
	function pagesizeurl(){
		//var pageSize=$('#page').val();	
	 	//window.location.href= $('#contextPath').val()+'/rolelist/loadrole.htm?pageSize='+pageSize;
	 	
		$("#toreload").load('${pageContext.request.contextPath}/rolelist/loadrole.htm #toreload', {
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
		function addNote() 
		{
			
			$("#deletenote, #editnote").hide();
		//	$('#addnote').modal('show');
			$("#addnote").modal({
			     backdrop: 'static',
			     keyboard: false
			 });

			
		}

		function deleteNote() 
		{
			$("#addnote, #editnote").hide();
			$('#deletenote').modal('show');
			
		}
		
		function editNote()
		{
			$("#addnote, #deletenote").hide();	
		//	$('#editnote').modal('show');
			$("#editnote").modal({
			     backdrop: 'static',
			     keyboard: false
			 });

		}
		
		function biz() 
		{
			$("#biz").show();
			$("#user, #role, #city").hide();

		}
		
		function user() 
		{
			$("#user").show();
			$("#biz, #role, #city").hide();
		}
		
		function role() 
		{
			$("#role").show();
			$("#biz, #user, #city").hide();
		}

		function city() 
		{
			$("#city").show();
			$("#biz, #user, #role").hide();
		}

		function biz1()
		{
			$("#biz1").show();
			$("#user1, #role1, #city1").hide();

		}
		
		function user1() 
		{
			$("#user1").show();
			$("#biz1, #role1, #city1").hide();

		}
		
		function role1() 
		{
			$("#role1").show();
			$("#biz1, #user1, #city1").hide();
		}

		function city1() 
		{
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
		
		
		
	
		
		function resetval()
		{
			    $('#roleNameId').val('');
				$('#descriptionId').val('');
				$('#startDatepickerId').val('');
				$('#expireDatepickerId').val('');
				document.getElementById('isactiveId').checked=true;
		}
		
	  
		  
		  function doaddexit() 
			{	
			
			
			    if(getRoleName()==true){
					
					return;
				}
	 

   				if($('#roleNameId').val().trim()=="")
   				{
   					alert('Please enter role name');
   				 	$('#roleNameId').focus();
   				}	
   				
   				else if($('#startDatepickerId').val().trim()=="")
   				{
   	   				alert('Please select start date ');
   	   			 	$('#startDatepickerId').focus();
   	   			}
   				
   				else
   					{
 				
		    $.ajax({
		       type :'POST',
		       data:$('#addform').serialize(),
		       url: $('#contextPath').val() +"/rolelist/addRole.htm",/* ?roleName="+$('#roleNameId').val() +"&roleDescription = "+$('#descriptionId').val()+"&startDate = "+$('#startdateId').val()+"&expiryDate = "+$('#expirydateId').val()+"&isActive = "+$('#isactiveId').val(), */
		       success : function(result) 
		    			{
		    	            alert('Role added successfully');
		                	location.reload();
		                	
		              	}
		          });
								
			}
			}
				
		
		  
		  	   
		  function updateRole(id,rolename,roleDescription,startDate,expiryDate,isActive)
		    { 
			 	  
			  
			    document.getElementById("roleIdEdit").value = id;
			    document.getElementById("roleNameIdEdit").value = rolename;
			    
			    document.getElementById("oldNameId").value = rolename;
			    
			    document.getElementById("roledescriptionIdEdit").value = roleDescription;
			    document.getElementById("editstartDatepickerId").value=startDate; 
			    document.getElementById("editexpireDatepickerId").value=expiryDate;
			    document.getElementById("isactiveIdEdit").value = isActive;
			    
		       if(isActive=='true')
		    		{
			    	   
		    		   document.getElementById("isactiveIdEdit").checked = true;	
			    	   
		    		}
		    	   else
		    		{
		    			
		    	    	document.getElementById("isactiveIdEdit").checked = false;
		    			
		    		} 
		    
			   
		    }
		  
		  
			function submitEditedRole()
			{
			 	if(editRoleRequiredVals() == true)
			 	{
			 		roleUpdate();
				} 
			}
		  	  
			
			function editRoleRequiredVals()
			{
				 if ($('#roleNameIdEdit').val().trim()=="") 
				 {
					 alert("Role name is required.");
					 $('#roleNameIdEdit').focus();
			         return false;
			     } 
				 
				 if ($('#editstartDatepickerId').val().trim()=="") 
				 {
					 alert("Start date field should not be blank!");
					 $('#editstartDatepickerId').focus();
			         return false;
			     } 
				 
				 var start = $('#editstartDatepickerId').val(); 
				 var end = $('#editexpireDatepickerId').val();
				 if(process(end) < process(start)){
					 alert("End date should be greater than Start date");
					 document.getElementById("editexpireDatepickerId").value= "";
				     $('#editexpiryDatepickerId').focus();
				     return false;
			    }
				 return true;
				 
				 
			}
			
			function process(date){
				
				   var parts = date.split("/");
				   return new Date(parts[2], parts[1] - 1, parts[0]);
				}
			
		  	  function roleUpdate()
		  	  {
		  		
		  	  		var editRoleName1= document.getElementById("roleNameIdEdit").value;
					var editRoleName = $.trim(editRoleName1);
					document.getElementById("roleNameIdEdit").value = editRoleName;
		  	  	    
					var roleDescription1= document.getElementById("roledescriptionIdEdit").value;
					var roleDescription = $.trim(roleDescription1);
					document.getElementById("roledescriptionIdEdit").value = roleDescription;
				
					
					 var isact=$("#isactiveIdEdit").is(":checked");
					 
					 //alert(islogin);
					 if(isact==true){
						 document.getElementById("isactiveIdEdit").value = true;
					 }else{
						 document.getElementById("isactiveIdEdit").value = false;
					 }
					
					
					if(editRoleName!="")
					{
					 $.ajax
					 ({
				      type: "POST", 
				      data:$('#updateform').serialize(),
				      url: $('#contextPath').val() +"/rolelist/roleUpdate.htm",
				       
				      success:function(result)
				      {
				    	 // alert('Role updated successfully.');
				    	  bootbox.dialog({
								message: "<span class='bigger-110'>Role updated successfully. </span>",
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
		 				 /*  location.reload(); */
				      }
				   
				   });
					}
					
		  	  }
		  
		
		    
		
		function deleteRole()
	  		{ 
			    var selvals = []
			    $('input:checkbox[id=chkdeleteselect]:checked').each(function() {
			    	selvals.push($(this).val());
			    })
			    
			     // alert('Selected Checkbox values are:- ' + selvals);
			  
			   document.getElementById("confirmdelete").value = selvals;
			   if(selvals<=0)
				  {
				  //	alert('Please select records for delete');
				  	bootbox.dialog({
						message: "<span class='bigger-110'>Please select at least one Record.</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {
									//Example.show("Primary button");
									 //location.reload();
								}
							}
						}
					});
         	   
				  	
				  	//popup('popUpAlertaddnote');
				  }
			   else{
					  deleteNote();
				  }
			  
			    
			  }
			   
			   
		function confirmDelete()
			 {
			
			
			    var selvals= document.getElementById("confirmdelete").value;
			
			    $.ajax({
					   type : 'POST',
					   url : $('#contextPath').val()+"/rolelist/deleteRole.htm?Lists="+selvals,
		 			   success : function(result)
			            {
		 				  $("#deletenote").hide();
				    	  //  alert('Role deleted successfully.');
				    	    bootbox.dialog({
								message: "<span class='bigger-110'>Record Deleted Successfully. </span>",
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
						 
	                   }
			   }); 
			  }
		function reload()
		{
			location.reload();
		}
		
		
		
		   
		
				  
		$(document).ready(function() {
 		    $("#startDatepickerId").datepicker({
 		        showOn: 'button',
 		        minDate : '0',
 		        buttonText: 'Show date',
 		        buttonImageOnly: true,
 		        buttonImage: '../images/calendar.gif',
 		        dateFormat: 'dd/mm/yy',
 		        constrainInput: true,
 		        
 		       
 		       onSelect: function(selected) {
 		       $("#expireDatepickerId").datepicker("option","minDate", selected)
 		       }
 		    });

 		    $(".ui-datepicker-trigger").mouseover(function() {
 		        $(this).css('cursor', 'pointer');
 		    });
 		});
		
		$(document).ready(function() {
 		    $("#expireDatepickerId").datepicker({
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
 		    $("#editstartDatepickerId").datepicker({
 		        showOn: 'button',
 		        minDate : '0',
 		        buttonText: 'Show date',
 		        buttonImageOnly: true,
 		        buttonImage: '../images/calendar.gif',
 		        dateFormat: 'dd/mm/yy',
 		        constrainInput: true,
 		        
 		       
 		       onSelect: function(selected) {
 		       $("#editexpireDatepickerId").datepicker("option","minDate", selected)
 		       }
 		    });

 		    $(".ui-datepicker-trigger").mouseover(function() {
 		        $(this).css('cursor', 'pointer');
 		    });
 		});
		
		$(document).ready(function() {
 		    $("#editexpireDatepickerId").datepicker({
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
		
		
		 $('#roleNameId').blur(function(){
	    	   if ($('#roleNameId').val().match(/[^a-zA-Z0-9. ]/g)) 
	    	     {
	                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	             }
	        }); 
	
		 $('#roleNameIdEdit').blur(function(){
	    	   if ($('#roleNameIdEdit').val().match(/[^a-zA-Z0-9. ]/g)) 
	    	     {
	                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	             }
	        }); 
		 
		 
		 
		 
		
			
			
	 	 /* function getRoleName(action)
			{
				var roleName;
				var oldRoleName=null;
				if(action=='add'){
					//alert('in add');
					roleName = $('#roleNameId').val().trim();
					$('#roleNameIdEdit').val('');
					$('#oldNameId').val('');
					
				} else{
					//alert('in edit');
					$('#roleNameId').val('');
					roleName = $('#roleNameIdEdit').val().trim();
					//get old role name
					oldRoleName = $('#oldNameId').val();
				}
				//alert('New name : '+ roleName + ' ' + " Old Name :" + oldRoleName);
				
				
				if(roleName!="" && (oldRoleName != roleName))
				{
					
				 $.ajax
				 ({
			              
			      type: "GET",
			      url: $('#contextPath').val()+"/rolelist/getUniqueRoleName.htm?roleName="+roleName, 
			      dataType: 'json',
			      async : false,
			      contentType: 'application/json',
			         success:function(result)
			      { 
			        	//alert("result  is::"+result);
             
            		 if(result==1)
             	  {
                
                 	//alert("Role Name Already Exist");
                 	if(action=='add'){
                 		$('#roleNameId').val('');
                 		$('#roleNameId').focus();
                 	} else{
                 		//$('#roleNameIdEdit').val()=oldRoleName;
                 		document.getElementById("roleNameIdEdit").value=oldRoleName;
                 		//$('#roleNameIdEdit').focus();
                 	}
                 	//return true;
                
             	  }
            	 
			      }
			   
			   });
				}
				
			}  */
			
				
		
			
			


			
	</script>
	
<script type="text/javascript">
function openPopupPingAction(id){
	$('#'+id).show();
}

function suspendPing(notifyTemplateId){
	notifyTemplateId=$('#notifyTemplateIdHidden').val();
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val(false);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/updatePingActiveFlag.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping suspended successfully.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}

function reactivatePing(notifyTemplateId){
	notifyTemplateId=$('#notifyTemplateIdHidden').val();
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val(true);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/updatePingActiveFlag.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping reactivated successfully.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}
function pagesizeurl(){
	var pageSize=$('#page').val();	
// 	window.location.href= $('#contextPath').val()+'/opportunity/getOpportunitiesList.htm?pageSize='+pageSize;
	setResult('');	
}



function setResult(filterRuleCriteria){
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/ping/getPings.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{
// 	        	oppReady()
	        //addPageSize(filterRuleCriteria,pageval);
	        //$('#hfilterRule').val(filterRuleCriteria);
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
	 }


function markAsFavouritePing(notifyTemplateId){
	notifyTemplateId=$('#notifyTemplateIdHidden').val();
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val("1");
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/markPingAsFavourite.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping marked as favourite.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}

function removeAsFavouritePing(notifyTemplateId){
	notifyTemplateId=$('#notifyTemplateIdHidden').val();
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$('#isActive').val("0");
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/markPingAsFavourite.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "<br/>Ping Unmarked as favourite.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}
function clonePing(notifyTemplateId,pingName){
	notifyTemplateId=$('#notifyTemplateIdHidden').val();
	pingName=$('#notifyTemplateNameHidden').val();
	$('#notifyTemplateIdToSend').val(notifyTemplateId);
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/clonePing.htm',
		data:$('#pingForm').serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success", "Copy of ping "+pingName+" created and saved.", "confirmation", reloadPage);
			}else{
				showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
			}
		}
	});
}

/**
 * deletes multiple users after taking confirmation.
 */
function deletePings() {
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll' && $(this).attr('id')!='chkdeleteselect' && $(this).attr('id')!='' && $(this).attr('id')!=undefined && $(this).attr('id')!=0)
		list[i] = $(this).attr('id');
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Ping to delete.",
				"information", doNothing);
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Ping?";
		} else {
			message = "Do you want to delete these Pings?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deletePingsTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}

function deletePingsTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Ping successfully deleted.";
	} else {
		message = "Pings successfully deleted.";
	}
	setTimeout(function() {
		$('#notifyTemplateIdToSend').val(list);
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/ping/deletePing.htm',
			data:$('#pingForm').serialize(),
			success : function(result) {
				if(result>0){
					showAlertMessage("Success", "<br/>"+message+"", "confirmation", reloadPage);
				}else{
					showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", doNothing);
				}
			}
		});
	}, 500);
}
$(function() {
	$('#pingLibraryManagerLink').css('font-weight','bold');
})

</script>
<form id="pingForm">
	<input type="hidden" id="notifyTemplateIdToSend" name="notifyTemplateId"/>
	<input type="hidden" id="isActive" name="isActive"/>
</form>


<script type="text/javascript">
			var grid_data=${roleDataList};
			index=grid_data;
			
		//	alert('Hi..........'+grid_data);
			
			

			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8},
			 {id:"9", name:"sub grid item 9", qty: 3},
			 {id:"10", name:"sub grid item 10", qty: 5},
			 {id:"11", name:"sub grid item 11", qty: 9},
			 {id:"12", name:"sub grid item 12", qty: 8}
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
					
			
			
					data: index,
					datatype: "local",
					height: 350,
					ignoreCase: true,
					//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
					colNames:[' ',' ','Role Name','Start Date','Expiry Date','Status','Action'],
					colModel:[
						
						{name:'chkdeleteselect',width:10,sortable:false,formatter:function(cellvalue, options,rowObject) {
							
							return '<input role="checkbox" type="checkbox"  class="cbox" id="chkdeleteselect" value="'+rowObject.roleId+'" name="chkdeleteselect[]">';
						}}, 
					          
						{name : 'myac',index :'',width : 50, fixed : true, sortable : false, resize : false,
					              formatter:function(cellvalue, options,rowObject) {
					                  return '<a href="#" onclick="editNote();updateRole('+rowObject.roleId+',\''+rowObject.roleName+'\',\''+rowObject.roleDescription+'\',\''+rowObject.startDate+'\',\''+rowObject.expiryDate+'\',\''+rowObject.isActive+'\');"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';}},
							
						{name:'roleName',index:'roleName',width:30},
						{name:'startDate',index:'startDate',width:50, editable:true, sorttype:"date",unformat: pickDate}, 
						
						{name:'expiryDate',index:'expiryDate', width:50, editable: true,sorttype:"date",unformat: pickDate},
						{width:30,formatter:function(cellvalue, options,rowObject) {
							       if(rowObject.isActive==true){
							        return '<span class="label label-info"  style="background: #5bc0de;">'+"Active"+'</span>';
							        
							       }else {
							        return '<span style="background: #5bc0de;">'+"InActive"+'</span>';
							        } }},  
							    
						{width:20,formatter:function(cellvalue, options,rowObject) {
								     return "<a href='${pageContext.request.contextPath}/rolelist/roleAccessList.htm?roleId=" +rowObject.roleId+
								        "&roleName="+rowObject.roleName+"' class='requestlink'>"+"Access List"+ "</a>";}},  
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
							if($('#selectAll').attr('id')==undefined)
							$('#jqgh_grid-table_checkbox').before('<br/>');
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
						        $('#k').checked = true;
						    });
							
						}, 0);
						
					},
			
			
					editurl: "/dummy.html",//nothing is saved
					//caption: "jqGrid with inline editing"
			
					autowidth: true,
					//  width:'100%',
			
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
		<script type="text/javascript">
		//save autoping
		
		function addNewRole(isclose){
		$('#SDSD').val(isclose);
		
		jQuery.validator.addMethod("role", function (value, element) {
	    	return response = ( $('#addroleId').val() == '0' ) ? false: true ;
  		 }, "please select Role. ");
		
		
		/* jQuery.validator.addMethod("myarn", function (value, element) {
			
			if($('#roleNameId').val()==""){}else{var roleName = $('#roleNameId').val();} */
			
		jQuery.validator.addMethod("myarn", function (value, element) {
				
				if($('#roleNameId').val()==""){}else{var roleName = $('#roleNameId').val();}
			
			$.ajax
			 ({
		              
		      type: "GET",
		      url: $('#contextPath').val()+"/rolelist/getUniqueRoleName.htm?roleName="+roleName, 
		      dataType: 'json',
		      async : false,
		      contentType: 'application/json',
		         success:function(result)
   				{ 
    	  	
				response = ( result != '' ) ? false: true ;
			   
			     }
			
					  });   
				return response;
				}, "");

		
		
		
		
		
				var validator=$('#addform1').validate({
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
					
					roleName: {
						required: true,
						myarn:true,
					},
					
					startDate:{
						required: true
					}
					
					
				},


				messages: {
					roleName: {
						required: "Please provide a valid Role Name.",
						myarn: "RoleName already Exist."
					},
					startDate: {
						required: "Please provide a valid Start Date.",
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
					var ISClosed=$('#SDSD').val();
						 $.ajax({
						     	type :'GET',
						     	data:$('#addform1').serialize(),
						     	url: $('#contextPath').val() +"/rolelist/addRole.htm",
						     		success : function(result) 
						     			{			     				
						     						     			
						     			 	if(ISClosed==1){
						     			 		 bootbox.dialog({
														message: "<span class='bigger-110'>Role added successfully</span>",
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
						     			 	} else{
									           	  $('#success-msg').empty();	
												  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Role added successfully.</p></div>');
												  resetval();
									      	       	  addNote();
										             
									             }
				 		     			}
						  
						
						  
						        	 });
					}
			},
			invalidHandler: function (form) {
				
			}
		});
	}
	$('#menu-wplook-sub-menu8').addClass('active');
	 $('#SPRoleLink').addClass('active');
	</script>
</body>
</html>