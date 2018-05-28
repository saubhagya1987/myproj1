<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>User List</title>


</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
	<input type="hidden" name="confirmdelete" id="confirmdelete">
	<input type="hidden" name="partyId" id="partyId">
	
		<!------- ADD USER --------->
		<div style="display: none;" id="blanket"></div>
		
			
			<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" onclick="reload();" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Add User</h4> 
      		</div> 
      		  	<div id="success-msg"></div>
      		  	<div class="modal-body">
     <form class="form-horizontal" id="xyzform" method="POST">
     <input type="hidden" name="SDSD" id="SDSD">
            <input type="hidden" name="actionvalue" id="actionvalue" value="">
            
         	<input type="hidden" name="quetext" id="quetexthidden">
         	<input type="hidden" name="anstext" id="anstexthidden">
          <!-- hideen field for editor validation -->

					
					<div class="form-group">
						<!-- <span class="searchpadding padding_top" style="float: left; width: 150px;">User Type <span class="red">*</span></span> -->
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">User Type :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										
										<select name="recordTypeId" id="addnewpartype"class="col-xs-12 col-sm-9" onfocus="clearmessage();"></select>
									</div>
								</div>
						</div>
							<div class="space-2"></div>

						<div class="form-group">
						
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">User Name :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										
										<input type="text" name="userName" id="adduserName" class="col-xs-12 col-sm-9" placeholder="User Name" onfocus="clearmessage();">
									</div>
								</div>
						</div>
						<div class="space-2"></div>
						<div class="form-group">
					
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">First Name :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="firstName" id="addfirstName" class="col-xs-12 col-sm-9" placeholder="First Name">
									</div>
								</div>
						</div>
							
							<div class="space-2"></div>
							
							<div class="form-group">
						
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Last Name :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="lastName" id="addlastName" class="col-xs-12 col-sm-9" placeholder="Last Name">
									</div>
								</div>
						</div>
							
							<div class="space-2"></div>
							
						<div class="form-group">
						
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Email ID :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="emailID" id="adduserNameId" class="col-xs-12 col-sm-9" placeholder="Email ID" onchange='f2(this);'>
									</div>
								</div>
						</div>
						
						<div class="space-2"></div>

						<div class="form-group">
					
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Start Date :<span class="red">*</span></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix"> 
										<input type='text' name="accessStartDate" readonly="readonly" id="addstartDatepickerId" maxlength="20" />
									</div>
								</div>
						</div>
						
						<div class="space-2"></div>
						
						<div class="form-group">
					
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Expiry Date :</label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix"> 
										<input type='text' name="accessEndDate" readonly="readonly" id="addexpireDatepickerId" placeholder="Expiry Date" maxlength="20" />
										
									</div>
								</div>
						</div>
						
						<div class="space-2"></div>

						<div class="form-group">
					
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Select Role :<span class="red">*</span></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<select name="roleID" id="addroleId" class="col-xs-12 col-sm-9"></select>
									</div>
								</div>
						</div>
						
						<div class="space-2"></div>
					
					<div class="modal-footer">
							<div class="clearfix">
								<button id="SPAddNewfaqLink" class="btn btn-sm btn-primary"  onclick="savefaq(0);" ><i class='ace-icon fa fa-plus'></i>Save & New</button>
								<button id="SPAddNewfaqLink" class="btn btn-sm btn-primary" onclick="savefaq(1);" ><i class='ace-icon fa fa-plus'></i>Save & Close</button>
								
								<button  class="btn btn-sm btn-danger" onClick="reload();"><i class='fa fa-times'></i>Cancel</button> 
								<!-- <button id="SPcloseaddfaqLink" class="btn btn-sm btn-danger"  onclick="reloads();" ><i class='ace-icon fa fa-plus'></i>close</button> -->
								<!-- <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" onclick="reload();" class="close" data-dismiss="modal" aria-label="Close">
								<i class="ace-icon fa fa-plus"></i> Cancel</button> -->
							</div>
						</div>
						
						</form>
						</div>
					
					
					
			</div>
			</div>
			</div>
			
			
		<!------------ Add User End  ------------>

		<!----------- Delete User Start -------------->
			

<!--  	<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
       		<div class="modal-content">
        		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		<h4 class="modal-title" id="myModalLabel">Message</h4> 
   						Are you sure that you want to delete this User ? Please confirm.
   					<div class="clearfix"></div>
   					<div class="space"></div>
   					
     				<div style="float: right;">
      				<form>
                    	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDeleteUsers();"><i class="ace-icon fa fa-check"></i> Yes</button>
        				<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>
     	 			</form>
     				</div>
     				<div class="clearfix"></div>
    			</div>
   			</div>
  		</div>
 	</div> -->


<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
       	<div class="modal-content">
        	<div class="modal-header">
            	 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       			 <h4 class="modal-title">Delete Record</h4>
       			 </div>
       			 <div class="modal-body">
       			 Do you want to delete this selected records? Please confirm.
            </div>
    		
      		<div class="modal-footer">
   					<div class="clearfix"></div>
     				<div style="float: right;">
      				<form>
                    	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDeleteUsers();"> Yes</button>
        				<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"> No</button>
     	 			</form>
      				</div>
   		   </div>
  	</div>
</div>
</div>
		
		
		
		<!---- Delete User End ---->

		<!---- Password reset start ----->

		<!-- <div id="passwordnote">
			<div id="#popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Message</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 100px;">Do
					you want to reset the password....? please click on Reset</div>
				<div class="topbuttonholder">
					<form>
						<input type="hidden" name="confirmreset" id="confirmreset">
						<input class="dbtn" value="Reset" id="Reset" type="button"
							onclick="resetpassword();popup('popUpAlertaddnote');"> <input
							class="dbtn" value="Cancel" id="Cancel" type="button"
							onclick="popup('popUpAlertaddnote');reload();">
					</form>
				</div>
			</div>
		</div> -->
		
		
		<div class="modal fade" id="passwordnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<input type="hidden" name="confirmreset" id="confirmreset">
    	<div class="modal-dialog">
       		<div class="modal-content">
        		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		<h4 class="modal-title" id="myModalLabel">Reset Password </h4> 
            		</div>
            		<div class="modal-body">
            		
   						Do you want to reset the password....? please click on Reset.
   						</div>
   					<div class="clearfix"></div>
   					<div class="space"></div>
   					
     				<div class="modal-footer">
      				<form>
                    	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" data-dismiss="modal" onclick="resetpassword();"> Reset</button>
        				<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close">Cancel</button>
     	 			</form>
     				</div>
     				<div class="clearfix"></div>
    			</div>
   			</div>
  		</div>
 	
		
		<!----- Password reset end ----->

		<!----- Update user start ------>
		
			
			<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" onClick="location.reload();" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Edit User</h4> 
      		</div> 
      		<div class="modal-body">
				<form class="form-horizontal" id="updateform" name="updateform">
				
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">User Type :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<select name="recordTypeId" id="partytype"class="col-xs-12 col-sm-9"></select>
									</div>
								</div>
						</div>
						
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">User Name :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="userName" id="username" readonly="readonly" class="col-xs-12 col-sm-9" placeholder="User Name">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">First Name :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="firstName" id="firstname" class="col-xs-12 col-sm-9" placeholder="First Name">
									</div>
								</div>
						</div>
										
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Last Name :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="lastName" id="lastname" class="col-xs-12 col-sm-9" placeholder="Last Name">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Email ID :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="emailID" id="email" readonly="readonly" onchange='f2(this);' class="col-xs-12 col-sm-9" placeholder="Email ID">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Starts On :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="accessStartDate" id="editaccesdateon" type="text" readonly="readonly" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Access Expiry Date :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="accessEndDate" id="editaccessexpireon" type="text" readonly="readonly" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>	
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Select Role :<span class="red">*</span></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<select name="roleID" id="editRole" class="col-xs-12 col-sm-9"></select>
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Control Options :<span class="red">*</span></label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input id="lockedStatus" name="isLocked" type="checkbox"> 
										<span class="user">Locked?</span> .
										<input id="loggedStatus" name="isLogged" type="checkbox" onclick="return false">
										<span class="user">LoggedIn?</span> 
										<input id="forcePassword" name="isForceChange" type="checkbox"> 
										<span class="user">Force Change Password? </span>
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Account Lock Datetime :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="accountLockDate" id="editaccessdate" type="text" readonly="readonly" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Account Lock Release Datetime :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="accountReleaseDate" id="editaccessexpire" type="text" readonly="readonly" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Login Attempts :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="loginAttempts" id="loginAttempts" type="text" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Last Successful Login Datetime :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="lastLoginTime" id="logintime" type="text" readonly="readonly" >
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Last Failed Login Datetime :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="lastLogingFailed" id="lastLoginFail" type="text" readonly="readonly" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Last Login IP Address :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input name="lastLoginIPAddress" id="ipaddress" type="text" readonly="readonly" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Next Password Change Datetime :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										
										<input name="nextPasswordChangeDate" id="nextpass" type="text" readonly="readonly" maxlength="20">
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Created By/On :</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<span style="float: left; width: 145px; margin-right: 10px;">
						 					<input type="text" name="creatBy" id="createdbys" readonly="readonly" class="form-control" placeholder=" ">
										</span>&nbsp; 
										<span style="float: left; width: 150px;"> 
											<input type="text" name="createdateon" id="createdateon" readonly="readonly" class="form-control" placeholder=" ">
										</span>
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" for="email">Last Modified By/On:</label> 
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										
										<span style="float: left; width: 145px; margin-right: 10px;"> 
											<input type="text" name="modifybys" id="modifybys" readonly="readonly" class="form-control" placeholder=" ">
										</span>&nbsp; 
										<span style="float: left; width: 150px;"> 
											<input type="text" name="lastModifyBy" id="lastmodifyon" readonly="readonly" class="form-control" placeholder=" ">
										</span>
									</div>
								</div>
						</div>
							
						<div class="space-2"></div>
				</div>	
		 
					 	<div class="modal-footer">
			
							<button  class="btn btn-sm btn-primary" onClick="editUser();"><i class='ace-icon fa fa-plus'></i>Save</button>
                    		<!-- <button  class="btn btn-sm btn-danger" onClick="reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button>  -->
                    		<button  class="btn btn-sm btn-danger" onClick="reload();"><i class='fa fa-times'></i>Cancel</button> 
					
						</div>
				</form>
					
		</div>
		</div></div>
	
		
	<!---- Update user end ---->
	<!-- User Action popup start  -->
	
	<div class="common_dialog hide action_dialog">
  	<table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0">
    	<tbody>
      	<tr id="">
        	<th class="thead">Action List</th>
      	</tr>
      	<tr id="">
        	<td id="SPUserResetPasswordLink"><i class="fa fa-check"></i> <a onclick=""><span class="">Reset Password</span></a></td>
      	</tr>
      	<tr id="">
        	<td id="SPUserLogInOnBehalfLink"><i class="fa fa-check"></i> <a onclick=""><span class="">Login on Behalf</span></a></td>
      	</tr>
      	<tr id="">
      		<td id="SPUserViewAuditHistoryLink"><i class="fa fa-check"></i> <a onclick=""><span class="">View Audit History</span></a></td>
      	</tr>
      	<tr id="">
        	<td id="SPUserViewLoginHistoryLink"><i class="fa fa-check"></i> <a onclick=""><span class="">View Login History</span></a></td>
      	</tr>
    	</tbody>
  	</table>
	</div>
	
	<!-- User Action popup end  -->
	<!----- Nav Menu Start ----->
	
	<div class="navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-target=".navbar-collapse"
					data-toggle="collapse" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
		</div>
	</div>
	
	<!-- Nav Menu end -->
	
	<div class="page-header">
		<h1 class="pull-left">User List</h1>
               <form class="form-search pull-right">
               		<%-- <span class="input-icon">
                		<input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                		<i class="ace-icon fa fa-search nav-search-icon"></i>
                	</span> --%>
               </form>
         <div class="clearfix"></div>
	</div>
	
	<!-- center part start -->
	
	<section>
			<div class="container-body">
				
				<ul class="pagination pagination-sm"></ul>	
				<div class="pull-right">
					
					<button id="SPAddNewUserLink" class="btn btn-xs btn-primary" onClick="addNote();addUsers();addpartyName();dStartDate();"><i class='ace-icon fa fa-plus'></i>New User</button>
                    <button id="SPDeleteUserLink" class="btn btn-xs btn-primary" onClick="deleteUsers();"><i class='ace-icon fa fa-trash'></i>Delete</button> 
									
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
				
			<!-- 	<div class="pull-right">
				<div class="hr-12"></div>
		
							<button id="SPAddNewUserLink" class="btn btn-xs btn-primary" onClick="addNote();addUsers();addpartyName();dStartDate();"><i class='ace-icon fa fa-plus'></i>New User</button>
                    		<button id="SPDeleteUserLink" class="btn btn-xs btn-primary" onClick="deleteUsers();"><i class='ace-icon fa fa-trash'></i>Delete</button>
										
				</div>	 -->	
			</div>		
	</section>
	<!-- center part end -->
	
	<footer>
		<jsp:include page="../common/footer.jsp" />
		<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
	</footer>


<script>
function clearmessage(){
	

	  $('#success-msg').empty();

	
}

function addNote(){
	$("#deletenote, #editnote").hide();	
//	$('#addnote').modal('show'); 
	$("#addnote").modal({
	     backdrop: 'static',
	     keyboard: false
	 });

	
	}

function deleteNote(){
	$("#editnote,#addnote").hide(); 
	$('#deletenote').modal('show'); 
	}

function editNote(){
	$("#deletenote, #addnote").hide();	
//	$('#editnote').modal('show'); 
	$("#editnote").modal({
	     backdrop: 'static',
	     keyboard: false
	 });

	}

function passwordNote()
{
	$("#addnote, #editnote, #deletenote").hide();
	$('#passwordnote').modal('show'); 
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
</script>
	<script type="text/javascript">

	function dStartDate()
	{
		var d = new Date();
		var month = d.getMonth()+1;
		var day = d.getDate();
		var output = (day<10 ? '0' : '') + day + '/' + (month<10 ? '0' : '') + month + '/' + d.getFullYear();
		$("#addstartDatepickerId").val(output);		
	}
	
	/* ------ Add user code start ------ */

	 function savefaq(isclose){
			$('#SDSD').val(isclose);
			$('#actionvalue').val(isclose);
			$('#hiddeneditor').val($('#quetext').text());
			//alert($('#hiddeneditor').val());
			$('#anshiddeneditor').val($('#anstext').text());
			//alert($('#anshiddeneditor').val());
			//alert('HIIEE'+	$('#hiddeneditor').val())
			
		
			
			jQuery.validator.addMethod("newparty", function (value, element) {
    	    	return response = ( $('#addnewpartype').val() == '0' ) ? false: true ;
      		 }, "please select User type. ");
			
			jQuery.validator.addMethod("role", function (value, element) {
    	    	return response = ( $('#addroleId').val() == '0' ) ? false: true ;
      		 }, "please select Role. ");
			
			
			jQuery.validator.addMethod("myarn", function (value, element) {
				
				if($('#adduserName').val()==""){}else{var userName = $('#adduserName').val();}
				
				$.ajax
   				({               
       		type: 'POST',
       		url: $('#contextPath').val()+"/user/getUnqUserName.htm?userName="+userName,
       		async : false,											
       		contentType: 'application/json',
      		success:function(result)
       		{ 
        	  	
					response = ( result != '' ) ? false: true ;
				   
				     }
				
			  });   
	return response;
    }, "");
    
    
			
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
					recordTypeId: {
						required: true,
						newparty:true,
					},
					userName: {
						required: true,
						 myarn:true,
						
					},
					accessStartDate:{
						required: true,
					},
					lastName: {
						required: true,
						
					},
					emailID:{
						required: true,
						email:true,
						
					},					
					roleID:{
						required:true,
						role:true,
						
						
					}
				},

				messages: {
					recordTypeId:"please select User type. ",
					
					lastName:"Please provide valid Last name.",
					emailID: "Please provide valid EmailID.",
					accessStartDate: "Please Provide valid Start Date",
					roleID: "please select Role.",
					
					userName:{
				         required:"Please provide valid User name.",
				         myarn:"UserName Already Exist."
		     	},
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
						
						var ISClosed=$('#SDSD').val(); 	
						$.ajax({
							type :'POST',
							data:$('#xyzform').serialize(),
							url : $('#contextPath').val()+"/user/addNewUser.htm",
						 	success : function(result) 
						 	{ 
					      		
					       
					      		 if(ISClosed==1){
					           	  bootbox.dialog({
											message: "<span class='bigger-110'>User saved successfully</span>",
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
									  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>User added successfully.</p></div>');
									  resetVal();
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

	 
	
	
/* function addUser(isclose)
{
	$('#SDSD').val(isclose);
	var ISClosed=$('#SDSD').val(); 	
	$.ajax({
		type :'POST',
		data:$('#userform').serialize(),
		url : $('#contextPath').val()+"/user/addNewUser.htm",
	 	success : function(result) 
	 	{ 
      		
       
      		 if(ISClosed==1){
           	  bootbox.dialog({
						message: "<span class='bigger-110'>User saved successfully</span>",
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
				  $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>User added successfully.</p></div>');
				  resetVal();
	      	       	  addNote();
		             
	             }
		}
  	});
 	}
  */
function resetVal()
	{			
		$('#adduserName').val('');
		$('#addlastName').val('');
		$('#addfirstName').val('');
		$('#adduserNameId').val('');
		//$('#addstartDatepickerId').val('');
		$('#addexpireDatepickerId').val('');
		$('#addsecurityAnsId').val('');
		$('#addroleId').val(0);
	}

function  addUsers()
{
	addNote();
	addpartyName();
	userRolelist('add',0);
}


function addpartyName()
{	
 	$.ajax(
   			{ 				
   		  type: "POST",
   		  url: $('#contextPath').val()+'/user/getPartyName.htm',	
   		  dataType: 'json',
		  contentType: 'application/json',
		  success:function(result)
   		  { 
			   			$('#addnewpartype').empty();
			   			$("#addnewpartype").append('<option value="0">----Select User Type----</option>');
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueID;
										var modulename=obj.codeValue;
										$('#addnewpartype').append('<option value="'+ module+'">'+ modulename + '</option>');
									});			 							
   		  }
   	
   	});
}
 

 /* ------ Add user code end ------ */
 /*--- Update user code start ---  */

function userUpdate(userID)
{
	$.ajax(
   			{ 				
   		  type: "POST",
   		
   		  url: $('#contextPath').val()+'/user/getUserDetail.htm?userIDs='+userID,		
   		  dataType: 'json',
		  contentType: 'application/json',
		  success:function(result)			   		  
   		  { 			   			
			   			$(result).each(function(i, obj) 
			   			{
							var codeValue=obj.codeValue;
							var recordTypeId=obj.recordTypeId;
							var emailID=obj.emailID;
							var userName=obj.userName;
							var accessStartDate=obj.accessStartDate;
							var accessEndDate=obj.accessEndDate;
							var roleName=obj.roleName;
							var roleID=obj.roleID;
							var isActive=obj.isActive;
							var isLocked=obj.isLocked;
							var isLogged=obj.isLogged;
							var isForceChange=obj.isForceChange;
							var accountLockDate=obj.accountLockDate;
							var accountReleaseDate=obj.accountReleaseDate;
							var loginAttempts=obj.loginAttempts;
							var lastLoginTime=obj.lastLoginTime;
							var lastLogingFailed=obj.lastLogingFailed;
							var lastLoginIPAddress=obj.lastLoginIPAddress;
							var nextPasswordChangeDate=obj.nextPasswordChangeDate;
							var createDates=obj.createDates;
							var lastModifiedDates=obj.lastModifiedDates;
							var creatBy=obj.creatBy;
							var lastModifyBy=obj.lastModifyBy;
							var codeValueName=obj.codeValueName;
							var lastName=obj.lastName;
							var firstName=obj.firstName;
						
							document.getElementById("partyId").value = userID;  
																					
							($('#username').val(userName));
							($('#firstname').val(firstName));
							($('#lastname').val(lastName)); 
						 	($('#email').val(emailID));
						 	($('#editaccesdateon').val(accessStartDate));
							($('#editaccessexpireon').val(accessEndDate));
							($('#editRole').val(roleID));
						 	($('#editaccessdate').val(accountLockDate));
							($('#editaccessexpire').val(accountReleaseDate));
							($('#loginAttempts').val(loginAttempts));
							($('#logintime').val(lastLoginTime));
							($('#lastLoginFail').val(lastLogingFailed));
							($('#ipaddress').val(lastLoginIPAddress));
							($('#nextpass').val(nextPasswordChangeDate));
							($('#createdateon').val(createDates));
							($('#lastmodifyon').val(lastModifiedDates));
							($('#createdbys').val(creatBy));
							($('#modifybys').val(lastModifyBy));
							
							$('#partytype').empty();
							$('#partytype').append('<option value="'+ recordTypeId+'">'+ codeValueName + '</option>');
 							userRolelist('edit',roleID);
																			
			if(isLocked==true)
				{
					document.getElementById("lockedStatus").checked = true;	
				}
			else
				{
					document.getElementById("lockedStatus").checked = false;
				} 
					  
					  
			if(isLogged==true)
				{
					document.getElementById("loggedStatus").checked = true;	
				}
			else
				{
					document.getElementById("loggedStatus").checked = false;
				} 
					 
			if(isForceChange==true)
				{
					 document.getElementById("forcePassword").checked = true;	
				}
			else
				{
					document.getElementById("forcePassword").checked = false;
				} 
					
				});
   		  }  	
   	});
}	

 
function editUser(isclose){
	
	$('#ehiddeneditor').val($('#editque').text());

	$('#eanshiddeneditor').val($('#editans').text());

	jQuery.validator.addMethod("role", function (value, element) {
   	return response = ( $('#editRole').val() == '0' ) ? false: true ;
		 }, "Please select Role name. ");
	
	jQuery.validator.addMethod("faqsection", function (value, element) {
    	return response = ( $('#qtypes').val() == '0' ) ? false: true ;
       }, "Faq Section is required ");
	
	
	
 var validator=$('#updateform').validate({
	 
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
			firstName: {
				required: true,
				
			},
			lastName:{
				required: true
			},
			qtypes: {
				required: true,
				faqsection:true
			},
			accessStartDate:{
				required: true,
				
			},
			roleID:{
				required: true,
				role:true
				
			}				
			
		},

		messages: {
			firstName: "Please provide valid First Name.",
			lastName: "Please provide valid Last Name.",
			accessStartDate: "Please select valid Start Date",
			roleID: "Please select Role name.",
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
				updateUser();
				
			}
		},
		invalidHandler: function (form) {
			
		}
	});
}  
 
 
 
function updateUser()
{
	if(editReqValidation()== true)
	{	
	      var isLocked=document.getElementById("lockedStatus").checked;		
	      var isforcePass=document.getElementById("forcePassword").checked;
	      var loginAttempts=$('#loginAttempts').val();	     
 	$.ajax({
		type :'POST',  
     	url : $('#contextPath').val() +"/user/updateUser.htm?partytype="+$('#partytype').val()+
     	"&firstName="+$('#firstname').val()+
     	"&lastName="+$('#lastname').val()+
     	"&roleID="+$('#editRole').val()+
     	"&securityQueID=null"+
     	"&emailID="+$('#email').val()+
     	"&securityAns=null"+
     	"&accessStartDate="+$('#editaccesdateon').val()+
     	"&accessEndDate="+$('#editaccessexpireon').val()+
     	"&isLogged="+isLocked+
    	"&isForceChange="+isforcePass+
    	"&loginAttempts="+loginAttempts+
     	"&userId="+$('#partyId').val(),  
     
		success : function(result)
		{
					 bootbox.dialog({
	 						message: "<span class='bigger-110'>User Updated successfully</span>",
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
	else
		{
			editNote();
		}
}

function editReqValidation()
{	
	  if ( editvalidEmail()== false) 
	  {
			 alert("Please enter valid EmailID");
			 $('#email').val('');
			 $('#email').focus();
	         return false;
	   }
	   if($('#lastname').val().trim()=="")
		{
			alert('Please enter User Last Name');
			$('#lastname').focus();
			return false;
	 	}
	  return true;
}

function editvalidEmail(email) 
{
	var email = $('#email').val().toLowerCase();
    var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test(email)) 
    {
        return true;
    }
    else 
    {
        return false;
    }
}

function editpartyName()
{
	$('#partytype').empty();
	
 	$.ajax({ 				
   		  type: "POST",
   		  url: $('#contextPath').val()+'/user/getPartyName.htm',	
   		  dataType: 'json',
		  contentType: 'application/json',
		  success:function(result)
   		  { 			   		
			$(result).each(
			function(i, obj) {
			var module = obj.codeValueID;
			var modulename=obj.codeValue;
							
			$('#partytype').append('<option value="'+ module+'">'+ modulename + '</option>');   
			});			 	
   		  }
   	});
}
	
  /*--- Update user code end ---  */
 /* ------ Role list dorpdown start ------ */
 
 function userRolelist(action,ids)
 {
	   	$.ajax({ 				
	   		type: "POST",
	   		url: $('#contextPath').val()+'/user/getRoleName.htm',
	   		dataType: 'json',
			contentType: 'application/json',
		    success:function(result)
	   		  { 
				   	if(action=='edit')
				   	{
						 var id = '#editRole';
						 $('#editRole').empty();
					}
				   	else
				   	{	
						 var id = '#addroleId';
						 $('#addroleId').empty();
						 $("#addroleId").append('<option value="0">----Select Role----</option>');
					}
					$(result).each(function(i, obj) 
					{
						 var module=obj.roleID;
						 var modulename=obj.roleName;
					if(ids == module)
					{
						 $(id).append('<option value="'+ module+'" selected="selected">'+ modulename + '</option>');
					} 
					else
					{
						$(id).append('<option value="'+ module+'">'+ modulename + '</option>');	
					}
					});		
	   		  }	   	
	   	});
 	}

 /* ------ Role list dorpdown end ------ */
 
 /* ------ Delete user code start  ------ */

 
 function deleteUsers()   
     
  {  var slvals = []
	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
	  slvals.push($(this).val());
	  });
  /* alert('Selected Checkbox values are: ' + slvals); */
	
	  
	 document.getElementById("confirmdelete").value = slvals;
	//alert(slvals);  
  if(slvals<=0)
		  {
		  /* 	  alert('Please select at least one Item !'); */
		  bootbox.dialog({
				message: "<span class='bigger-110'>Please select at least one Record.</span>",
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
		
		
	  else
		  {
		  deleteNote();  
		  }
}  
 
 

 
 function confirmDeleteUsers()
 {
	   //alert("Hiiiiiiiii");

	   var selval= document.getElementById("confirmdelete").value;
	   //alert("selected values="+selval);
	    $.ajax({
		    type : 'POST',
		    url : $('#contextPath').val()+"/user/deleteUser.htm?Lists="+selval,
		    success : function(result) 
		    {
		    	  /* alert('User deleted successfully'); 
		    	  reload(); */
		    	  
		    	$("#deletenote").hide();
				  bootbox.dialog({
						message: "<span class='bigger-110'>Record Deleted Successfully.</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() 
								{
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
 
	  
	   
/* ------ Delete user code end  ------ */  
 

function setpassword(userid)
	{
		 //alert("Hi in setpassword");
		 //alert("Userid="+userid);
		 
		 passwordNote();
		 document.getElementById("partyId").value = userid;
	}
	   
function resetpassword()
	{
		var userId= document.getElementById("partyId").value;	
		
		
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/user/repassword.htm?userId="+userId,
			success : function(result) 
			{
				bootbox.dialog({
						message: "<span class='bigger-110'>Your New password is : </span>"+result,
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
	 
/* ------ Email validation start ------- */

 function validEmail(adduserNameId) 
 {
 	 var email = $('#adduserNameId').val().toLowerCase(); 
     var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;  
     if (filter.test(email)) 
     {
         return true;
     }
     else 
     {
         return false;
     }
 }
 
 /* ------ Email validation end ------- */

/* ----- Unique user name start ------ */

function checkUserName()
 	{
  		var userName = $('#adduserName').val().trim();
 		
  	if(userName=="")
  	{
   		return false;
  	}
  	if(userName!="")
  	{
  	 $.ajax
   		({               
       		type: 'POST',
       		url: $('#contextPath').val()+"/user/getUnqUserName.htm?userName="+userName, 
       		dataType: 'json',										
       		async : false,											
       		contentType: 'application/json',
      		success:function(result)
       		{ 
        	  if(result == 1)
        	  {
        	  		alert('User name already exist');
        	  		$('#adduserName').val('');
        	  		
        	  		return true;
        	  }
        	  else
        	  {
        	  		return false;
        	  }
       }
    
    });
  }
  
 }
 
/* ----- Unique user name end ------ */
  
function pagesizeurl()
	{
		var pageSize=$('#page').val();	
	 	window.location.href= $('#contextPath').val()+'/user/loaduser.htm?pageSize='+pageSize;
	} 
  
	$(document).ready(function() {
	    $('#selecctall').click(function(event) {  
	        if(this.checked) { 
	            $('.checkbox1').each(function() { 
	                this.checked = true;                
	            });
	        }else{
	            $('.checkbox1').each(function() { 
	                this.checked = false;                       
	            });         
	        }
	    });
	    
	});
	

function f2(el) 
	{
	    el.value = el.value.toLowerCase();
	}

function checkLogBehalf()
	{
		//showAlertMessage("Message", "Login On Behalf is currently disabled for this user.<br/>Respective User should first the accept Terms & Conditions.","confirmation", reload);
		alert("Login On Behalf is currently disabled for this user. Respective User should first the accept Terms & Conditions.");
	}
	
	
function getXLS()
{
		window.location.href ="<%=request.getContextPath()%>/user/userExecl.htm";
}
function getCSV()
{
		window.location.href ="<%=request.getContextPath()%>/user/userCSV.htm";
}
	



function Viewloginonbehalf(allCount,userName,roleID,recordTypeId)
{
	
	//alert("allCount="+allCount);
	//alert("userName="+userName);
	//alert("roleID="+roleID);
	//alert("recordTypeId="+recordTypeId);
	
	if (allCount>=1)
		{
			window.location.href = $('#contextPath').val()+"/loginonbehalf/getUserInfo.htm?userName="+userName+"&roleID="+roleID+"&recordTypeId="+recordTypeId+"&GOTO=index";
		}
	else if (recordTypeId == 14012)
		{
			window.location.href = $('#contextPath').val()+"/loginonbehalf/getUserInfo.htm?userName="+userName+"&roleID="+roleID+"&recordTypeId="+recordTypeId+"&GOTO=index";
		}
	else if (recordTypeId == 14008)
		{
			window.location.href = $('#contextPath').val()+"/loginonbehalf/getUserInfo.htm?userName="+userName+"&roleID="+roleID+"&recordTypeId="+recordTypeId+"&GOTO=index";
		}
	else
		{
			checkLogBehalf();
		}
		 
}

function Viewaudithistory(userID,userName)
{	
		 //alert("userID="+userID);
		 //alert("userName="+userName);
		 window.location.href = $('#contextPath').val()+"/user/loadAuditHistory.htm?userId="+userID+"&userName="+userName;

}


function Viewloginhistory(userID)
{
		//alert("userID="+userID);
		//String currentuser="user";
		 window.location.href = $('#contextPath').val()+"/user/loadLoginHist.htm?userId="+userID+"&currentPage=user";

}


function openActionPopup(userID,userName,roleID,recordTypeId,allCount)

{
	
	    $('#SPUserResetPasswordLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();setpassword('+userID+')');
	 	$('#SPUserLogInOnBehalfLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();Viewloginonbehalf('+allCount+',\''+userName+'\',\''+roleID+'\',\''+recordTypeId+'\')');
	 	$('#SPUserViewAuditHistoryLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();Viewaudithistory('+userID+',\''+userName+'\')'); 
		$('#SPUserViewLoginHistoryLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();Viewloginhistory('+userID+')');
		  

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

/* ----- Datepicker start ------ */

$(document).ready(function() {
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
	        constrainInput: true,   
	    });
	    $(".ui-datepicker-trigger").mouseover(function() {
	        $(this).css('cursor', 'pointer');
	    });
	});
	
$(document).ready(function() {
    $("#editaccesdateon").datepicker({
        showOn: 'button',
        minDate : '0',
        buttonText: 'Show date',
        buttonImageOnly: true,
        buttonImage: '../images/calendar.gif',
        dateFormat: 'dd/mm/yy',
        constrainInput: true,   
        onSelect: function(selected) 
        {
	          $("#editaccessexpireon").datepicker("option","minDate", selected)
	    }
    });

    $(".ui-datepicker-trigger").mouseover(function() {
        $(this).css('cursor', 'pointer');
    });
});

$(document).ready(function() {	
   $("#editaccessexpireon").datepicker({
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


$('#adduserName').blur(function(){
	//alert($('#quickSearch').val());
	 var arr = $('#adduserName').val();
	// alert("sai");
	var str='';
		str = arr.replace(/\s/g, '');
	 
	 $('#adduserName').val(str);
  }); 

/* ------- datepicker code end ------- */

</script>

<!------- New UI changes code --------->
	
	
	<script type="text/javascript">
	var grid_data=${userDatalist};
	//alert(grid_data);
	//index=JSON.parse(grid_data);
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
			
	
	
			data: grid_data,
			datatype: "local",
			height: 350,
			ignoreCase: true,
			//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
			colNames:[' ',' ','User Type','User Name','Biz Unit','Email ID','Contact No','Assigned Role','Action','Last LoginTime'],
			colModel:[
					
					{name:'checkbox', index:'checkbox',width:50,sortable:false,formatter:function(cellvalue, options,rowObject) {
						return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.userID+'" value="'+rowObject.userID+'"  id="chkdeleteselect" name="chkdeleteselect"  >';
					
					}},
 
					{name:'myac',index:' ', width:50, fixed:true, sortable:false, resize:false,
					formatter: function(cellvalue, options,rowObject) {
			              return '<a href="#" onclick="editNote();userUpdate('+rowObject.userID+',\''+rowObject.userName+'\');" id="SPEditUserLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			             
			          }},
					
		
				{name:'codeValueName',index:'codeValueName',cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
				{name:'userName',index:'userName',cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
				{name:'lastName',index:'lastName',cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
				{name:'emailID',index:'emailID',cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
				{name:'contactMobile',index:'contactMobile'},
				{name:'roleName',index:'roleName'},
			
				{name:'action',index:'action', width:'150',formatter:function(cellvalue, options,rowObject) {
				    return '<a onclick="openActionPopup('+rowObject.userID+',\''+rowObject.userName+'\',\''+rowObject.roleID+'\',\''+rowObject.recordTypeId+'\',\''+rowObject.allCount+'\')">Action</a>';
				    
				}},
				
				{name:'lastLoginTime',index:'lastLoginTime'},
				
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
	
	       /*  loadComplete : function() {
	            var table = this;
	            setTimeout(function(){
	             styleCheckbox(table);
	             
	             updateActionIcons(table);
	             updatePagerIcons(table);
	             enableTooltips(table);
	            }, 0);
	           }, */
	           
	           
	           loadComplete : function() {
					var table = this;
					setTimeout(function(){
						styleCheckbox(table);
						if($('#selectAll').attr('id')==undefined)
						$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll" style="margin-right: 25px;">');
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
	$('#menu-wplook-sub-menu8').addClass('active');
	 $('#SPUserLink').addClass('active');
	


	
</script>	

</body>
</html>