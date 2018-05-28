<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
	<%@page import="in.fiinfra.common.diy.models.UserSession"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
   
   
<title>User Profile</title>
 
 <style>
.jstree .icn { width: 20px; height: 20px; display: inline-block; background: url(images/jstree.png) no-repeat 0 0 transparent  !important }
.jstree .icn.plus { background-position: -15px -20px !important}
.jstree .icn.area { background-position: -2px -3px !important}
.jstree .icn.user { background-position: -25px -3px !important}
.jstree .icn.star { background-position: -50px -3px !important}
.jstree-default .jstree-open > .jstree-ocl { background: url(images/jstree.png) no-repeat -3px -25px transparent  !important }
.jstree-default .jstree-closed > .jstree-ocl { background: url(images/jstree.png) no-repeat -28px -25px transparent  !important }
.jstree-default .jstree-clicked { background: none; border-radius: 0; box-shadow: none; color: #AE2760;}
ul.jstree-container-ul { /* background: #8F8F8F;*/ overflow: hidden }
li.jstree-open > ul { /*  background: #DADADA;*/ display: block; }
li.jstree-open > ul li.jstree-open > ul { /*background: #F2F2F2;*/ position: relative; left: -24px; padding-left: 24px; width: 100%; }
.txt-bx { border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px inset; width: 100%; background: none rgb(255, 255, 255); }
.jstree-container-ul{
overflow-x:auto !important; 
}

</style>

<link href="<%=request.getContextPath()%>/js/jstree/themes/default/style.min.css"
	rel="stylesheet">
	
<%
  	String photoPath = null;
	String logoPath = null;
  	UserSession userSession = (UserSession) request.getSession().getAttribute("userSession"); 
  	if(userSession != null){
  		photoPath = userSession.getPhoto();
  		logoPath = userSession.getLogo();
  	}
%>

</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
 <script type="text/javascript"	src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
 
 <script src="<%=request.getContextPath()%>/js/jstree/jstree.min.js"></script> 
	
	


<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>


        
          <div class="page-header" >
          <h1 class="pull-left">User Profile for ${userSession.name}</h1> 
<div class="clearfix"></div>
         </div >

 	

 <!-- Center part start -->
<div class="row">
	<div class="container pull-left">


		<div class="container-body " style="padding: 5px;"></div>
		<div class="container-body">

<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" onclick="location.reload()" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Message</h4> 
		<!-- <div id="deletenote"> -->
			Are you want to move user?
					<div style="float: right;">
						
							
									 
									
								<button id="" class="btn btn-sm btn-primary"  onclick="moveUser();" ><i class='ace-icon fa fa-plus'></i>Yes</button>
								<button id="" class="btn btn-sm btn-danger"  class="close" data-dismiss="modal"  ><i class='fa fa-times'></i>No</button>
					
						
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	

			<!-- center -->

<div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top: 10px; padding-left: 10px;">
	<div class="list-group">
	
	
	 
	
	             <a id="SPGeneralProfileLink" href="<%=request.getContextPath()%>/common/loaduserProlife.htm" class="list-group-item">Profile</a>

				<a id="SPchangepwdLink" class="list-group-item" href="<%=request.getContextPath()%>/common/loaduserpassword.htm">Change Password</a>
				
	<a class="list-group-item profiledivlink" id="SPManageHierachyLink" name="manageHierachyLinkDiv" onclick="showDiv('manageHierachyLinkDiv')">
	<strong>Manage Hierarchy</strong></a>
	                 
	</div>
</div>

<div class="col-md-9" style="margin-top: 10px; padding-left: 10px;">

   
<!--  hierachy  -->
 <div class="mh-action" id="mh-moveuser" style="display:none"> <strong id="nodeLabel">Move User</strong>&mdash;<strong id="locateName" style="color: #AE2760"></strong>
                 <div class="table-responsive" id="display_table_lead" style="border:none;">
				<div class="list-group profiledivs"
					id="manageHierachyLinkDivForMoveUser">
					<div class="col-md-3">
						<div id="jstree2" class="thumbnail"></div>
					</div>
				</div>
</div></div>
             <div class="list-group profiledivs" id="manageHierachyLinkDiv" style="display: none">
              <div  > <a class="list-group-item active" style="cursor: default;">Manage Hierarchy </a>
                  <div class="list-group-item" id="biz-panels">
                    <div class="row">
                      <div class="col-md-3">
                        <div id="jstree" class="thumbnail"> </div>
                      </div>
                      <div class="col-md-8" style="margin-left:10px; width: 73%;">
                        <div id="pnl-mhaddedit">
                          <div class="mh-action" id="mh-addlocation"> <strong id="nodeLabel">Add Location </strong>&mdash;<strong id="locateName" style="color: #AE2760"></strong>
                            <div class="" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post" id="manageHeirarchyLocationForm">
                                <input type="hidden" name="parentNodeId" id="parentNodeId" value="63">
                                <input type="hidden" name="level" id="level" value="4">
                                <input type="hidden" name="locationId" id="locationId" value="0">
														<div class="row">
															<div class="form-group col-md-12 clearfix">
																<label class="col-sm-3 control-label no-padding-right"
																	for="nodeLocation">Location Name<span
						class="red">*</span></label>
																<div class="col-sm-9">
																	<input name="nodeLocation" type="text" class="input-xxlarge" validate="1" emsg="Location Name" id="nodeLocation">
																	 <div id="nodeLocation_error" class="help-block hide">Please provide a valid location name.</div>
																</div>
															</div>
														</div>
														
														<div class="row">
															<div class="form-group col-md-12 clearfix">
																<label class="col-sm-3 control-label no-padding-right"
																	for="nodeDescription">Description<span
						class="red">*</span></label>
																<div class="col-sm-9">
																	<input name="nodeDescription" type="text" id="nodeDescription" validate="1" emsg="Description" class="input-xxlarge">
																    <div id="nodeDescription_error" class="help-block hide">Please provide a valid description.</div>
																</div>
															</div>
														</div>
														
													 	<div class="row  pull-right">
													 	    <div class="form-group col-md-6 clearfix">
															 <label class="col-sm-3"></label>
																<div class="col-sm-9">
																</div>
															</div>
															 <div class="form-group col-md-3 clearfix">
															 <label class="col-sm-3"></label>
																<div class="col-sm-9">
																	  <div id="saveLocation" class="btn btn-primary btn-xs  createNewBtn" name="manageHeirarchyLocation" onclick="savePartnerProfile('manageHeirarchyLocation')"> Save </div>
																</div>
															</div>
															<div class="form-group col-md-3 clearfix">
																	 <label class="col-sm-3"></label>
																<div class="col-sm-9">
																	 <div id="cancelLocation" class="btn btn-primary btn-xs  createNewBtn" name="manageHeirarchyLocation" onclick="location.reload()">Cancel</div>
																</div>
															</div>
														</div> 
													
                                </form>
                              </div>
                            </div>
                          </div>

		<!-- <div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Add User</h4> 
      		</div> 
      		  	<div id="success-msg"></div>
      		  	<div class="modal-body">
     <form class="form-horizontal" id="xyzform" method="POST">
     <input type="hidden" name="SDSD" id="SDSD">
            <input type="hidden" name="actionvalue" id="actionvalue" value="">
            
         	<input type="hidden" name="quetext" id="quetexthidden">
         	<input type="hidden" name="anstext" id="anstexthidden">
          hideen field for editor validation

					
					<div class="form-group">
						<span class="searchpadding padding_top" style="float: left; width: 150px;">User Type <span class="red">*</span></span>
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
								<button id="SPcloseaddfaqLink" class="btn btn-sm btn-danger"  onclick="reloads();" ><i class='ace-icon fa fa-plus'></i>close</button>
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-plus"></i> Cancel</button>
							</div>
						</div>
						
						</form>
						</div>
					
					
					
			</div>
			</div>
			</div> -->
                         
                         
                         
                         
                          <div class="mh-action" id="mh-sec-adduser"> <strong id="userLabel">Add User</strong>&mdash;<strong id="partName" style="color: #AE2760"></strong>
                            <div class="" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post" id="manageHeirarchySavePartnerForm"  name="manageHeirarchySavePartnerForm">
                                <input type="hidden" name="parentNodeId" id="parentNodeId">
                                
                                <input type="hidden" name="recordTypeId" id="recordTypeId1"/>
                                
                                
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    
                                                       
                                  <!--
                                    
                                    <tr>
                                      <td width="25%">User Type  <span class="red">*</span></td>
                                      <td width="75%">
                                      <select name="recordTypeId11" id="addnewpartype" class="col-xs-12 col-sm-9" ></select>
                                       
                                      </td>
            
                                   
                                    </tr> 
                                                    <tr>
                                      <td width="25%">User Name <span class="red">*</span></td>
                                      <td width="75%"><input id="adduserName" name="userName" validate="email" emsg="Email" type="text" class="txt-bx" onchange='f2(this);'></td>
                                    </tr>
                                    <tr>
        
                                    
                                      <td width="25%">First Name <span class="red">*</span></td>
                                      <td width="75%"><input name="firstName" id="addfirstName"  validate="1" emsg="User Name" type="text" class="txt-bx"></td>
                                    </tr>
                                 
                                    <tr>
                                      <td width="25%">Last Name</td>
                                      <td width="75%"><input name="lastName" id="addlastName" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Email ID <span class="red">*</span></td>
                                      <td width="75%"><input id="emailId" name="emailID" validate="email" emsg="Email" type="text" class="txt-bx" onchange='f2(this);'></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Access Start Date </td>
                                      <td width="75%"><input id="addstartDatepickerId" name="accessStartDate"  readonly="readonly" type="text"  class="txt-bx" ></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Access Expiry Date </td>
                                      <td width="75%"><input id="addexpireDatepickerId" name="accessEndDate" readonly="readonly" type="text" class="txt-bx" ></td>
                                    </tr> -->
                                    
                                    <tr>
                                      <td width="25%">Select User Name <span
						class="red">*</span></td>
                                      <td width="75%">
                                      
                                      
                                      <select name="addPartyId" id="addPartyId" class="col-xs-12 col-sm-9"></select>
                                      </td>
                                  
                                    </tr>

                                    
                                    
                                    <tr>
                                    
                                    
                                    <td width="25%">Is Head of Node<span
						class="red">*</span></td>
                                    <td width="75%"><select id="isHeadNode" name="headNode"  validate="1" emsg="isHeadNode">
        					      <!-- <option value="0">---Select---</option> -->
        					      <option value="1">Yes</option>
        					      <option value="2">No</option>
        					      </select> </td>
        					      
        					      </tr>
                                  </table>
                                    <div class="row" >
	                      <div class="col-lg-3 pull-right text-right"  style="width: 30% !important;">
	                         <!-- <input type="button" class="btn" value="Save" name="manageHeirarchySavePartner"  id="manageHeirarchySavePartner" onclick="saveUser()"/> -->
	                        <div id="manageHeirarchySavePartner" class="btn btn-primary btn-xs  createNewBtn" name="manageHeirarchySavePartner" onclick="saveUser()"> Save </div>
	                        	<!-- <button id="SPAddNewfaqLink" class="btn btn-sm btn-primary" onclick="saveUser();" ><i class='ace-icon fa fa-plus'></i>Save</button> -->
								<!-- <button id="SPcloseaddfaqLink" class="btn btn-sm btn-danger"  onclick="reloads();" ><i class='ace-icon fa fa-plus'></i>close</button> -->
								
								<div id="cancelLocation" class="btn btn-primary btn-xs  createNewBtn" name="manageHeirarchyLocation" onclick="location.reload()">Cancel</div>
								<!-- <button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close">
								<i class="ace-icon fa fa-plus"></i> Cancel</button> -->
	                        
	                        <!-- <input type="button" class="btn" value="Cancel" onclick="disableProfileDiv(name)" name="manageHeirarchyCancelPartner"/> -->
	                      <input type="hidden" name="currentNode" id="currentNode" >
	                      <input type="hidden" name="partyId" id="partyId">
						   <input type="hidden" name="pst" id="pst" >
                  			  </div>
                  			  </div>
                                </form>
                              </div>
                            </div>
                          </div> 
                          
                        </div>
                      </div>
                    </div>

                  </div>
              
              </div>
            </div>
            </div>
           
            
<!--     hierarchy end -->
        
        <!-- NACH  -->




	<!--NACH ends  -->
</div>  <!-- End Col 9 Div -->
</div>  
</div>
<!-- End Container Body Div -->   
<br/><br/>

<!-- Center part End -->          
<jsp:include page="../common/footer.jsp" />

<div style="display: none; width:500px; height:400px; top:114px !important;z-index: 9999;background-color: #fff;padding: 20px;box-shadow: 0 0 10px 2px #535b68;border: 1px #fff solid;" id="addDocumentPopup" class="alert" >
<div class="close" style="margin-right:10px;"><a onClick="$('#addDocumentPopup').hide();$('#blanket').hide()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
<div id="addDocument">
    <div id="popupwrapper_contactform">
   		<div class="heading_contactform"><h3> Add Document</h3></div>
        <div id="poptable_contactform" style="padding:10px;">
        <form enctype="multipart/form-data" method="post" id="addDocumentFormData" action="<%=request.getContextPath() %>/common/saveDocuments.htm">
        	<input type="file" multiple="multiple" name="documentFiles" id="documentFiles" style="display: none" onchange="showDocuments()">
        	<input class="btn dbtn" type="button" value="Choose File" name="Choose File" onclick="documentFiles.click()">
        	 <div id="documentList" style="margin-top: 10px;height: 156px;overflow: auto;"> </div>
        	 <input type="hidden" id="documentPartyId" name="partyId" value="${sessionScope.userSession.partyId}">
        	 </form>
 

 </div>

  <div class="topbuttonholder">
        	<form>
        	<input class="dbtn" value="Save" id="popupSavenoteBtn" type="button" title="Save Note" onclick="saveDocument()" alt="Save">	
            <input class="dbtn" value="Cancel" id="popupCancelnoteBtn" type="button" onClick="$('#addDocumentPopup').hide();$('#blanket').hide()" title="Cancel Note" alt="Cancel Note" >	
           	</form>	
        </div>
        </div>
	</div>
   
   
</div>

<script>

var locationId=0;
var locationDesToSet='';
var locationNameToSet='';
//var $=jQuery.noConflict();
function customMenu(node) {


    var tree = $jq_1_9_1("#jstree").jstree(true);
    
    if (node.type == 'root') {
        var items = {
      /*       addLocationItem: {
                label: "Add Location ",
                action: function(obj) {
                	//alert("Edit User");
                     //tree.delete_node(node);
// 					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show() ;
						$('#pnl-mhaddedit #mh-sec-adduser').hide();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
						$('#nodeLocation').val('');
						$('#nodeDescription').val('');
// 					});
					
                },
                icon: "fa fa-trash-o"

            }, */
            editItem: {
                label: "Edit Location",
                action: function(obj) {
//                 	$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#pnl-mhaddedit #mh-sec-adduser').hide();
						$('#nodeLabel').html('Edit Location');
					 	$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						//$('#locationId').val(locationId);
// 					});
                },
                icon: "fa fa-pencil"

            },
			
//             addUserItem: {
//                 label: "Add User",
//                 action: function(obj) {
//                     //alert("Edit User");
//                     //tree.delete_node(node);
// // 					$('#pnl-mhaddedit .mh-action').hide(function() {
// 						$('#pnl-mhaddedit #mh-sec-adduser').show();
// 						$('#pnl-mhaddedit #mh-addlocation').hide();
// 						$('#userLabel').html('Add User');
// 						$('#manageHeirarchySavePartnerForm #partyId').val(0);
// // 					});
//                 },
//                 icon: "fa fa-trash-o"

//             }
			
        };
    } 
    
    
    
    
    else if (node.type == 'area') 
    {
    	$('#manageHeirarchySavePartnerForm #partner_loginName').attr('disabled',false);
    	$('#manageHeirarchySavePartnerForm #partner_ARN').attr('disabled',false);
		$('#manageHeirarchySavePartnerForm #partner_euin').attr('disabled',false);
		
    	var partnerForm=document.getElementById("manageHeirarchySavePartnerForm");
    	partnerForm.reset();
        var items = {
			addLocationItem: {
                label: "Add Location",
                action: function(obj) {
                 //  alert("Add Location");
                    //tree.delete_node(node);
// 					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#pnl-mhaddedit #mh-sec-adduser').hide();
						$('#nodeLabel').html('Add Location');
						$('#manageHeirarchyLocationForm #locationId').val(0);
						$('#nodeLocation').val('');
						$('#nodeDescription').val('');
// 					});
                },
                icon: "fa fa-plus"

            },

            editItem: {
                label: "Edit Location",
                action: function(obj) {
                  //  alert("Edit Location");
                    //tree.delete_node(node);
// 					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-addlocation').show();
						$('#pnl-mhaddedit #mh-sec-adduser').hide();
						$('#nodeLabel').html('Edit Location');
						$('#manageHeirarchyLocationForm #nodeDescription').val(locationDesToSet);
					 	$('#manageHeirarchyLocationForm #nodeLocation').val(locationNameToSet);
						//$('#locationId').val(locationId);
// 					});
                },
                icon: "fa fa-pencil"

            },
              deleteItem: {
                label: "Delete Location",
                action: function(obj) {                	
                 	var delLocationId=$('#manageHeirarchyLocationForm #locationId').val();              		
                    deleteLocation(delLocationId);

                },
                icon: "fa fa-trash-o"

            },
            addUserItem: {
                label: "Add User",
                action: function(obj) {
                  //  alert("Add User");
                    //tree.delete_node(node);
// 					$('#pnl-mhaddedit .mh-action').hide(function() {
	//addpartyName();
	data();
	//userRolelist(0);
	//setStartDate();
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#pnl-mhaddedit #mh-addlocation').hide();
						$('#userLabel').html('Add User');
					//	$('#manageHeirarchySavePartnerForm #partyId').val(0);
// 					});
                },
                icon: "fa fa-plus"

            }
        };
    } else if (node.type == 'user') {
        var items = {
            editUserItem: {
                label: "Edit User",
                action: function(obj) {
                 //   alert("Edit User");
                    //tree.delete_node(node);
// 					$('#pnl-mhaddedit .mh-action').hide(function() {
	
	
	//addpartyName();
//	userRolelist(0);
	
							//alert($('#manageHeirarchySavePartnerForm #partyId').val()+"$('#manageHeirarchySavePartnerForm #partyId').val()");
							
							//var nodeid=$('#manageHeirarchySavePartnerForm #currentNode').val();
							
							//alert($('#manageHeirarchySavePartnerForm #partyId').val());
							
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#pnl-mhaddedit #mh-addlocation').hide();
						$('#userLabel').html('Edit User');
						getEditPartner($('#manageHeirarchySavePartnerForm #partyId').val());
// 					});
                },
                icon: "fa fa-pencil"

            },                        deleteItem: {
                label: "Delete User",
                action: function(obj) {
                	getDeletePartner($('#manageHeirarchySavePartnerForm #partyId').val());
                   // alert("Add User");
                    //tree.delete_node(node);
				//	$('#pnl-mhaddedit .mh-action').hide(function() {
				//		$('#pnl-mhaddedit #mh-advisor-delete-user').show();
				//	});
                },
                icon: "fa fa-trash-o"

            },
            moveUser: {
                label: "Move User",
                action: function(obj) {
                		//alert("user moved");
                		$('#mh-moveuser').show(); 
						$('#pnl-mhaddedit #mh-sec-adduser').hide();
						$('#pnl-mhaddedit #mh-addlocation').hide();
				
						showDiv("manageHierachyLinkDivForMoveUser");	
						
				},
                icon: "fa fa-minus-square"

            }   

        };
    }

    return items;
}

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

function f2(el) 
{
    el.value = el.value.toLowerCase();
}
function setStartDate()
{
	var d = new Date();
	var month = d.getMonth()+1;
	var day = d.getDate();
	var output = (day<10 ? '0' : '') + day + '/' + (month<10 ? '0' : '') + month + '/' + d.getFullYear();
	$("#addstartDatepickerId").val(output);		
}
function saveUser()
{
	
	  
	var partryid=$('#addPartyId').val();
	var nodeid=$('#manageHeirarchySavePartnerForm #currentNode').val();
	//alert(nodeid+"nodeid");
	var isHeadNode=$('#isHeadNode').val();
 	$.ajax({
		type :'POST',  
		
			url : $('#contextPath').val() +"/heirarchy/addPartnerHeirarchy.htm?partyid="+partryid+"&nodeid="+nodeid+"&headNode="+isHeadNode,
    
    		 
				success : function(result) 
				{
					
					   bootbox.dialog({
							message: "<span class='bigger-110'>User added successfully.</span>",
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
		
					 
					
		}
	});
	
	
}


/* function saveUser()
{
	
	
	
	var partyId = $('#manageHeirarchySavePartnerForm #partyId').val();
	alert(partyId+"partyId");
	if(partyId==0)
		{
		
		
		$('#recordTypeId1').val($('#addnewpartype').val());
		$.ajax({
			type :'POST',
			data:$('#manageHeirarchySavePartnerForm').serialize(),
			url : $('#contextPath').val()+"/user/addNewUser.htm",
		 	success : function(result) 
		 	{ 
	      		
	       
	      		 
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
	           	
	             
			}
	  	});
		}
	else
		{
		$('#recordTypeId1').val($('#addnewpartype').val());
		$.ajax({
			type :'POST',
			data:$('#manageHeirarchySavePartnerForm').serialize(),
			url : $('#contextPath').val()+"/user/updateUserProfile.htm",
		 	success : function(result) 
		 	{ 
	           	  bootbox.dialog({
							message: "<span class='bigger-110'>User updated successfully</span>",
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
 */


function data()
 {
	 
	 var nodeid=$('#manageHeirarchySavePartnerForm #currentNode').val();
	 
	 
	  	$.ajax({ 				
	   		type: "POST",													  
	   		url: $('#contextPath').val()+'/heirarchy/getHeirarchyUserName.htm?currentNodeId='+nodeid,
	   		dataType: 'json',
			contentType: 'application/json',
		    success:function(result)
	   		  {
		   			$('#addPartyId').empty();	   			
						$(result).each(
								function(i, obj) {
									   var module=obj.lastName;
								       var modulename=obj.partyID;
									  
								      		$('#addPartyId').append('<option value="'+  modulename+'">'+module + '</option>');	
								});	
						$('#addPartyId').attr('disabled',false);
	   		  }	   	
	   	});
	 
	 
	 //alert($('#nodeId').val());
 }

function userRolelist(action)
{
	   	$.ajax({ 				
	   		type: "POST",
	   		url: $('#contextPath').val()+'/user/getRoleName.htm',
	   		dataType: 'json',
			contentType: 'application/json',
		    success:function(result)
	   		  { 
				
				//		 var id = '#addroleId';
						 $('#addroleId').empty();
			//			 $("#addroleId").append('<option value="0">----Select Role----</option>');
			
					$(result).each(function(i, obj) 
					{
						 var module=obj.roleID;
						 var modulename=obj.roleName;
				if(module==2)

					{
					
					}
				else
					{
					 if(action == module)
						{
							 $('#addroleId').append('<option value="'+ module+'" selected="selected">'+ modulename + '</option>');
						} 
						else
						{
							$('#addroleId').append('<option value="'+ module+'">'+ modulename + '</option>');	
						}
					}
					
					});		
	   		  }	   	
	   	});
	}


/* function addpartyName()
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
			   			document.getElementById("addnewpartype").disabled = true;
			   			/* $("#addnewpartype").append('<option value="0">----Select User Type----</option>');
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueID;
										var modulename=obj.codeValue;
									if(14012==module)
										{
										$('#addnewpartype').append('<option value="'+ module+'">'+ modulename + '</option>');
										}
										
									});			 							
   		  }
   	
   	});
} */
function getEditPartner(partyId)
{
	if(partyId==0)
		{
		  bootbox.dialog({
			  	message: "<span class='bigger-110'>Please select user .</span>",
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
		
		
	 $.ajax({
		 type :'POST',
         url : $('#contextPath').val() +"/heirarchy/getPartnerDetails.htm?partyId="+partyId,
		 success : function(result)
		 {
			 
			 id='manageHeirarchySavePartner';
			 //$('#manageHeirarchySavePartnerForm #addfirstName').val(result.firstName);
			// $('#manageHeirarchySavePartnerForm #addlastName').val(result.lastName);
		//	 $('#manageHeirarchySavePartnerForm #adduserName').val(result.userName);
			 var name=result.firstName+' '+result.lastName;
			 
			 document.getElementById("addPartyId").options.length=0;
			 $('#addPartyId').append('<option value="'+ partyId+'">'+ name + '</option>');
			// $('#addPartyId').attr('disabled',true);
			 
			/*  $('#manageHeirarchySavePartnerForm #partner_companyName').val(result.companyName); */
		//	 $('#manageHeirarchySavePartnerForm #emailId').val(result.contactEmail);
			 /* $('#manageHeirarchySavePartnerForm #partner_ARN').val(result.arn);
			 $('#manageHeirarchySavePartnerForm #partner_euin').val(result.euin); */
		 	 $('#manageHeirarchySavePartnerForm #isHeadNode').val(result.isHeadNode);
			 
		//	 $('#manageHeirarchySavePartnerForm #addstartDatepickerId').val(result.accesStartDate);
			// $('#manageHeirarchySavePartnerForm #addexpireDatepickerId').val(result.accesEndDate);
		 //	 $('#manageHeirarchySavePartnerForm #adduserName').attr('disabled',true);
		 	 
// 		 	if(result.recordTypeID!='14014')
// 		 	{
// 		 		$('#manageHeirarchySavePartnerForm #partner_ARN').attr('disabled',true);
// 	 			$('#manageHeirarchySavePartnerForm #partner_euin').attr('disabled',true);
// 		 	}
//userRolelist(result.roleId);
		/*  	 $('#manageHeirarchySavePartnerForm #partner_ARN').attr('disabled',true);
			 $('#manageHeirarchySavePartnerForm #partner_euin').attr('disabled',true); */
		 }
	 });
}
}
function getDeletePartner(partyId)
{
	//alert('partyId to delete='+partyId);
	$.ajax({
		type : 'POST',
		url :  $('#contextPath').val() +"/heirarchy/deletePartner.htm?partyId="+partyId,
				success :function(result)
				{
					//alert(result);
					
					var result=result;					
					if(result==1){
						//showAlertMessage1("Success",								"<br/>User Deleted successfully.",								"information",reloadPage);
						
						 
			           	  bootbox.dialog({
									message: "<span class='bigger-110'>User Deleted successfully.</span>",
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
						
						
 					}else {
 					 	  bootbox.dialog({
								message: "<span class='bigger-110'> Error occured while deleting Partner.</span>",
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
 						//showAlertMessage("Error","<br/> Error occured while deleting Partner. ", 'error', doNothing);
 					}
				}
	});
}

// jashd
var debtManufacturers=new Array();
var equityManufacturers=new Array();
var goldManufacturers=new Array();
var insuranceManufacturers=new Array();
var loansManufacturers=new Array();
var realEstateManufacturers=new Array();
var serviceManufacturers=new Array();
var assetClassList;
var debtSelectHTML='';
var equitySelectHTML='';
var goldSelectHTML='';
var insuranceSelectHTML='';
var loansSelectHTML='';
var realEstateSelectHTML='';
var serviceSelectHTML='';

var allManufacturers;
var residenceCityId=0;
var officeCityId=0;
var isImageSelected=0;
var isLogoSelected=0;
var  docId;
var isCheckedDoc=true; 
var isDocumentSelected=0;
var option="";
var childrenArray = new Array();
var treeArray = new Array();
var myObj = new Object();
var currentArryToIterate = new Array();
var currentObj=new Object();



function showDocuments(){
	$('#documentList').empty();
	    for (var i = 0; i < $('#documentFiles').get(0).files.length; ++i) {
	    	$('#documentList').append($('#documentFiles').get(0).files[i].name+'<br/>');
	    	isDocumentSelected=1;
	    }
}

function togleDocumentSelect(){
	if(isCheckedDoc==true){
		isCheckedDoc=false;
		$('input[name="document"]').attr('checked','checked');
	}else{
		isCheckedDoc=true;
		$('input[name="document"]').removeAttr('checked');
	}
}


function openAddDocumentPopup(){
	
	$("#addnote").show();	
	$("#deletenote, #editnote").hide();	
	$('#addDocumentPopup').show();
	$('#blanket').show();
	$("#documentList").html("");
//		alert($(window).height())
	var height = ($(window).height() / 2) - (parseInt($('#addDocumentPopup').css('height'))/2);
//		alert(height)
	$('#addDocumentPopup').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#addDocumentPopup').css('width'))/2);
	$('#addDocumentPopup').css('margin-left', width);
	$('#addDocumentPopup').css('position','fixed');
	$('#documentFiles').val('');
}


function openFileDailog(id){
	$('#'+id).click();
	document.getElementById("documentaddBtn").remove();
	
}

function saveDocument(){
	if(isDocumentSelected==1){
	var partyIdnew=$('#partyIdFromRequest').val();
	openPopupWebApp('centerLoadingImage', 25, 35);
// 	$('#documentPartyId').val(partyIdnew);
	$('#${sessionScope.userSession.partyId}').removeAttr('disabled');
	 $('#addDocumentFormData').ajaxForm({
         success: function(msg) {
         	var result=msg;
         	if(result=='success'){
         		$("#addDocumentPopup").hide();	
         		closePopupWebApp('');
//				localStorage.setItem('actionName',$('#contextPath').val()+'/opportunity/getNotesList.htm');
			showAlertMessage("Success",
					"<br/>Document saved successfully.",
					"confirmation",reloadPage );
//				reloadPage
			$('.ZebraDialog').css('z-index','9999999999999999');
		}else{
			closePopupWebApp('');
			showAlertMessage1("Error",
					"The connection to the server has been lost. Please try again later.",
					"error", doNothing);
			$('.ZebraDialog').css('z-index','9999999999999999');
		}						
         },
         error: function(msg) {
         }, onComplete: function (data) {
         }
     }).submit();
	}else{
		showAlertMessage1("Error",
				"<br/>Please select document first.",
				"error", doNothing);
		$('.ZebraDialog').css('z-index','9999999999999999');
	}
}


function deleteDocument() {
// 	$("#popUpAlertaddnote").hide();	
	list = new Array();
	var id='';
	$('#documentsDetails :checked').each(function(i, obj) {
		if($(this).attr('id')!=0){
			id=$(this).attr('id');
			list[i] = id.substring(id.indexOf('document')+9);
		}
		
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Document to delete.",
				"information", doNothing);
		$('.ZebraDialog').css('z-index','9999999999999999');
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Document?";
		} else {
			message = "Do you want to delete these Documents?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog').css('z-index','9999999999999999');
		$('.ZebraDialog_Button1').attr('href','javascript:deleteDocumentsTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}	

function deleteDocumentsTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Document successfully deleted.";
	} else {
		message = "Documents successfully deleted.";
	}

	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/common/deleteObject.htm?ids=" + list+'&object=document',
			success : function(result) {
				if(result=='success'){
					localStorage.setItem('actionName',
							window.location.pathname+'?partyId='+$('#partyIdFromRequest').val());
					showAlertMessage1("Success",
							'<br/>' + message,
							"confirmation", redirectFunction1);
					$('.ZebraDialog').css('z-index','9999999999999999');
				}else{
					showAlertMessage1("Error",
							"The connection to the server has been lost. Please try again later.",
							"error", doNothing);
					$('.ZebraDialog').css('z-index','9999999999999999');
				}
				
			}
		});
	}, 500);
}


$("#residenceAddress #city").change(function() {
	residenceCityId=0;
	});
$("#officeAddress #city").change(function() {
	officeCityId=0;
	});
$('#photoFile').change(function() {
	var extensionToCheck=$('#photoFile').val().substring(($('#photoFile').val()
			.lastIndexOf('.') + 1));
	if (extensionToCheck == 'jpg' || extensionToCheck == 'jpeg'
		|| extensionToCheck == 'png' || extensionToCheck == 'gif'
		|| extensionToCheck == 'ioc' || extensionToCheck == 'bmp'
		|| extensionToCheck == 'psd' || extensionToCheck == 'tif'
		|| extensionToCheck == 'pspimage' || extensionToCheck == 'thm'
		|| extensionToCheck == 'yuv' || extensionToCheck == 'ai'
		|| extensionToCheck == 'drw' || extensionToCheck == 'eps'
		|| extensionToCheck == 'ps' || extensionToCheck == 'svg') {
		$('#photoFileName').html($('#photoFile').val().substring($('#photoFile').val().lastIndexOf('\\')+1));
		isImageSelected=1;
	}else{
		alert('please select valid image');
		$('#photoFile').val('');
		$('#photoFileName').html('');
		isImageSelected=0;
	}
	
	
// 	$('#photoImage').hide();
})

$('#logoFile').change(function() {
	var extensionToCheck=$('#logoFile').val().substring(($('#logoFile').val()
			.lastIndexOf('.') + 1));
	if (extensionToCheck == 'jpg' || extensionToCheck == 'jpeg'
		|| extensionToCheck == 'png' || extensionToCheck == 'gif'
		|| extensionToCheck == 'ioc' || extensionToCheck == 'bmp'
		|| extensionToCheck == 'psd' || extensionToCheck == 'tif'
		|| extensionToCheck == 'pspimage' || extensionToCheck == 'thm'
		|| extensionToCheck == 'yuv' || extensionToCheck == 'ai'
		|| extensionToCheck == 'drw' || extensionToCheck == 'eps'
		|| extensionToCheck == 'ps' || extensionToCheck == 'svg') {
		$('#logoFileName').html($('#logoFile').val().substring($('#logoFile').val().lastIndexOf('\\')+1));
		isLogoSelected=1;
	}else{
		alert('please select valid image');
		$('#logoFile').val('');
		$('#logoFileName').html('');
		isLogoSelected=0;
	}
	
	
// 	$('#photoImage').hide();
})
function copyOfficeAddress(){
	if($('#sameAsAboveCb').is(':checked')==true){
		$('#residenceAddressForm #street1').val($('#officeAddressForm #street1').val());
		$('#residenceAddressForm #street2').val($('#officeAddressForm #street2').val());
		$('#residenceAddressForm #street3').val($('#officeAddressForm #street3').val());
		$('#residenceAddressForm #country').val($('#officeAddressForm #country').val());
		$('#residenceAddressForm #state').val($('#officeAddressForm #state').val());
		$('#residenceAddressForm #city').val($('#officeAddressForm #city').val());
		$('#residenceAddressForm #cityHidden').val($('#officeAddressForm #cityHidden').val());
		$('#residenceAddressForm #postalCode').val($('#officeAddressForm #postalCode').val());
	}else{
		$('#residenceAddressForm #street1').val('');
		$('#residenceAddressForm #street2').val('');
		$('#residenceAddressForm #street3').val('');
		$('#residenceAddressForm #country').val(0);
		$('#residenceAddressForm #state').val(0);
		$('#residenceAddressForm #city').val('');
		$('#residenceAddressForm #cityHidden').val(0);
		$('#residenceAddressForm #postalCode').val('');
	}
}

function enableTff(){
$('#email, #cell').css('background-color','rgb(255, 255, 255)');
$('#email, #cell').css('border','1px solid rgb(204, 204, 204)');
$('#email, #cell').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
$('#email, #cell').css('font-size','11px');
$("#save1, #cancel1").show();	


}
function enableTf(){
$('#salutation, #fname, #lname, #cname, #panno, #hphone, #bdate, #site, #arncode').css('background-color','rgb(255, 255, 255)');
$('#salutation, #fname, #lname, #cname, #panno, #hphone, #bdate, #site, #arncode').css('border','1px solid rgb(204, 204, 204)');
$('#salutation, #fname, #lname, #cname, #panno, #hphone, #bdate, #site, #arncode').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
$('#salutation, #fname, #lname, #cname, #panno, #hphone, #bdate, #site, #arncode').css('font-size','11px');
$("#save, #cancel").show();	


}

function enableProfileDiv(id){
	$('#'+id+' input,#'+id+' select,#'+id+' form textarea').css('background-color','rgb(255, 255, 255)');
	$('#'+id+' input,#'+id+' select,#'+id+' form textarea').css('border','1px solid rgb(204, 204, 204)');
	$('#'+id+' input,#'+id+' select,#'+id+' form textarea').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
	$('#'+id+' input,#'+id+' select,#'+id+' form textarea').removeAttr('disabled');
	
	$('#isEmailActivated').attr('disabled','disabled');
	$('#isSmsActivated').attr('disabled','disabled');
	$('#isWebsiteActivated').attr('disabled','disabled');
	$('#isBackOfficeActivated').attr('disabled','disabled');
	
	/*$('#'+id+' form .wysiwyg-editor').attr('contenteditable','true');
	$('#'+id+' form .wysiwyg-editor').removeAttr('disabled');
	$('#'+id+' form .wysiwyg-editor').prop('disabled', false);*/
	
	if(id=='email_signature_details'){
		$('#emailSignature').attr('contenteditable','true');
		$('#emailSignatureHidden').removeAttr('disabled');
	}else if(id=='email_disclaimer_details'){
		$('#disclaimer').attr('contenteditable','true');
		$('#disclaimerHidden').removeAttr('disabled');
	}else if(id=='email_dnd_details'){
		$('#dnd').attr('contenteditable','true');
		$('#dndHidden').removeAttr('disabled');
	}
	
	//$('#'+id+' div').attr('contenteditable','true');
// 	$('#'+id+' input,select').css('font-size','11px');
	$('a[name="'+id+'"]').hide();
	$('input[name="'+id+'"]').show();
	$('div[name="'+id+'"]').removeClass('hide');
	if(id=='personalInfo_1FormDiv'){
		//$('#photochoose').show();
		$('#photoFile').parent().show();
		//alert('sdas'+$('#photoImage').attr('src'));
		if($('#photoImage').attr('src')=='/FIINFRA-WEB/images/chatuser.png' || $('#photoImage').attr('src')==' ' )
		{
			$('#removePhoto').hide();	
		}
		else{
			$('#removePhoto').show();	
		}
		
	}else if(id=='email_other_details'){
		$('#logoMessage').show();
		//$('#logochoose').show();
		$('#logoFile').parent().show();
		//alert($('#logoImage').attr('src'))
		
		if($('#logoImage').attr('src')=='/FIINFRA-WEBimages/img.png' || $('#logoImage').attr('src')==' ' )
		{
			$('#logoCancel').hide();	
		}
		else{
			$('#logoCancel').show();	
		}
		
		
	}else if(id=='residenceAddress'){
		$('#sameAsAboveSpan').show();
		$('#sameAsAboveCb').removeAttr('disabled');
	}else if(id=='financialProductServicesFormDiv'){
		$('.deleteicon').show();
		$('.addicon').show();
		$(assetClassList).each(function(i,obj) {
			var codeValueId=obj.codeValueId;
			var selectHtml='';
			var id=codeValueId;
			if(id==46002){
				selectHtml=debtSelectHTML;
			}else if(id==46001){
				selectHtml=equitySelectHTML;
			}else if(id==46003){
				selectHtml=goldSelectHTML;
			}else if(id==46004){
				selectHtml=insuranceSelectHTML;
			}else if(id==46006){
				selectHtml=loansSelectHTML;
			}else if(id==46007){
				selectHtml=realEstateSelectHTML;
			}else if(id==46005){
				selectHtml=serviceSelectHTML;
			}
			var addHtml='&nbsp;<a onClick="addnewManufacturer('+id+');" name="'+id+'"  alt="Add Manufacturer"  title="Add Manufacturers"><i class="addicon"></i></a>';
			if($('#select0'+id).html()=='&nbsp;' || $('#select0'+id).html()==''){
				$('#select0'+id).append('<i class="deleteicon" onclick="removeManufacturer(\'tr0'+id+'\','+id+')"></i>'+selectHtml+addHtml);
			}
			else if($('a[name="'+codeValueId+'"]').html()==undefined){
					$('#select0'+id).append(addHtml);
// 				$('#select0'+codeValueId).append('&nbsp;<a href="#" onClick="addnewManufacturer('+codeValueId+');" name="'+codeValueId+'"  alt="Add Manufacturer"  title="Add Manufacturers"><i class="addicon"></i></a>');
			}
			$('#isServiceProvidedSelect'+codeValueId).show();
			$('#isServiceProvidedSpan'+codeValueId).hide();
		});
	}else if(id=='user_account_details'){
		if('${sessionScope.userSession.partyId}'=='${sessionScope.oldpartyId}'){
		
		$('#changePasswordLink').attr('onclick','openChangePasswordPopup()');
		$('#changePasswordLink').css('cursor','pointer');
		$('#change_password_div input,#change_password_div select').removeAttr('disabled');
		}
	}
	else if(id=='interestedFPDetails'){
// 		alert('Hi');
		$('#interestedFP39002,#interestedFP39005,#interestedFP39006,#interestedFP39009').attr('disabled','disabled');
	}else if(id=='mfFileUploadConfigTable'){
		$('#camsPassword').attr('type','text');
		$('#karvyPassword').attr('type','text');
		$('#sundaramPassword').attr('type','text');
	}else if(id=='manageHierachyLinkDiv'){
// 		alert('Hi');
	}
		
}
function disableProfileDiv(id){
	 if(id=='personalInfo_1FormDiv' || id=='personalInfo_2FormDiv'){
		 id='personalInfoDiv';
	 }else if(id=='email_details' || id=='email_signature_details' || id=='email_disclaimer_details' || id=='email_dnd_details' || id=='email_other_details'){
		 id='myPersonalizationDiv';
	 }else if(id=='bankDiv'){
		 id='bankDetailsDiv';
	 }else if(id=='user_account_details'){
		 id='userAccountDiv';
	 }else if(id=='residenceAddress' || id=='officeAddress'){
		 id='addressDiv';
	 }else if(id=='financialProductServicesFormDiv'){
		 id='financialProductDiv';
	 } else if(id=='documentsDetails'){
		 id='documentsDetailsDiv';
	 }else if(id=='interestedFPDetails'){
		 id='partnerInterestedFPDiv';
	 }else if(id=='autoPlanConfigurationDetails'){
		 id='servicesDiv';
	 }else if(id=='mfFileUploadConfigTable'){
		 id='mfFileUploadConfigDiv';
	 }else if(id=='manageHeirarchyLocation'){
		 id='manageHierachyLinkDiv';			
	 }
	 else if(id=="manageHeirarchyCancelPartner")
	 {
	 id="manageHierachyLinkDiv";
	 }
	 localStorage.setItem('showSection',id);
	 location.reload();
}
function disableProfileDiv1(id){	
	$('#'+id+' input,#'+id+' select,#'+id+' textarea').css('background','none');
	$('#'+id+' input,#'+id+' select,#'+id+' textarea').css('border','none');
	$('#'+id+' input,#'+id+' select,#'+id+' textarea').css('box-shadow','none');
	$('#'+id+' input,#'+id+' select,#'+id+' textarea').attr('disabled','disabled');
	//$('#'+id+' .wysiwyg-editor').attr('contenteditable','false');
	
	if(id=='email_signature_details'){
		$('#emailSignature').attr('contenteditable','false');
	}else if(id=='email_disclaimer_details'){
		$('#disclaimer').attr('contenteditable','false');
	}else if(id=='email_dnd_details'){
		$('#dnd').attr('contenteditable','false');
	}
	
// 	$('#'+id+' input,select').css('font-size','11px');
	$('a[name="'+id+'"]').show();
	$('input[name="'+id+'"]').hide();
	$('div[name="'+id+'"]').addClass('hide');
	if(id=='personalInfo_1FormDiv'){
		$('#photochoose').hide();
		$('#photoFile').val('');
		$('#photoFileName').html('');
		$('#photoFile').parent().hide();
		isImageSelected=0;
	}else if(id=='email_other_details'){
		$('#logochoose').hide();
		$('#logoCancel').hide();
		$('#logoFile').val('');
		$('#logoFileName').html('');
		$('#logoMessage').hide();
		$('#logoFile').parent().hide();
		isLogoSelected=0;
	}else if(id=='financialProductServicesFormDiv'){
		$('.deleteicon').hide();
		$('.addicon').hide();
		$(assetClassList).each(function(i,obj) {
			var codeValueId=obj.codeValueId;
			$('#isServiceProvidedSelect'+codeValueId).hide();
			$('#isServiceProvidedSpan'+codeValueId).show();
		});
	}
	else if(id=='manageHeirarchyLocation'){
		$('#mh-addlocation input').removeAttr('disabled','disabled');	
		$('#saveLocation').show();
		$('#cancelLocation').show();
	
	}else if(id=='manageHeirarchyLocationUnder'){
		$('#mh-sec-addlocation input').removeAttr('disabled','disabled');	
		$('#saveLocationUnder').show();
		$('#cancelLocationUnder').show();
	
	}
	
	
}

function deleteLocation(locationId){	
	$('#locationId').val(locationId);
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/heirarchy/deletePartnerLocationData.htm",
		data : $('#manageHeirarchyLocationForm').serialize(),
		success : function(result) {
			var recordCount=result[0];
			var isChildNodeExist=result[1];	
			
			if(recordCount==1){
				
				
				
				
				  bootbox.dialog({
					  	message: "<span class='bigger-110'>Location Deleted successfully.</span>",
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
				
				
				
				//showAlertMessage1("Success",						"<br/>Location Deleted successfully.",						"information",reloadPage);
			}else if(isChildNodeExist==1){
				
				  bootbox.dialog({
					  	message: "<span class='bigger-110'>The Location is not Empty..</span>",
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
				//showAlertMessage("Error","<br/>The Location is not Empty.", 'error', doNothing);
			}
			
			else if(isChildNodeExist==2){
				
				  bootbox.dialog({
					  	message: "<span class='bigger-110'>Cannot delete main root.</span>",
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
				//showAlertMessage("Error","<br/>The Location is not Empty.", 'error', doNothing);
			}
		}
	});
}

function locationClick(nodeId,level,locationName,locDescription){

	$("#locateName").empty();
	$("#partName").empty();
	
	$('#manageHeirarchySavePartnerForm #currentNode').val(nodeId);
	$('#manageHeirarchyLocationForm #parentNodeId').val(nodeId);
	$('#manageHeirarchyLocationForm #level').val(level);
	$('#manageHeirarchyLocationForm #locationId').val(nodeId);
	locationNameToSet=locationName;
	locationDesToSet=locDescription;
	$('#locateName').append(locationNameToSet);
	$('#partName').append(locationNameToSet);
}

function locationClickForMove(nodeId,level,locationName,locDescription){

	//alert(nodeId);
	$("#nodeId").val(nodeId);
	$("#locateName").empty();
	$("#partName").empty();
	
	$('#manageHeirarchySavePartnerForm #currentNode').val(nodeId);
	$('#manageHeirarchyLocationForm #parentNodeId').val(nodeId);
	$('#manageHeirarchyLocationForm #level').val(level);
	$('#manageHeirarchyLocationForm #locationId').val(nodeId);
	locationNameToSet=locationName;
	locationDesToSet=locDescription;
	$('#locateName').append(locationNameToSet);
	$('#partName').append(locationNameToSet);
	openNachDialogForMove();
	deleteNote();
	
	  
	
}
function deleteNote(){

	//$("#deletenote").show();	
	
	$('#deletenote').modal('show');


	}
function userClick(nodeId,partyId,name){
	
	userNameToSet=name;
	$("#locateName").empty();
	$("#partName").empty();
// 	$('#partName').append(userNameToSet);
	
	$('#manageHeirarchySavePartnerForm #partyId').val(partyId);
	$('#manageHeirarchySavePartnerForm #currentNode').val(nodeId);
}
function createTree(result){
// 	alert(result)
// 	result = JSON.parse(result);
	var nodeList=result.lstLocationData;
	var userList=result.lstPartnerHeirarchyData;
	childrenArray= new Array();
	myObj = new Object();
	$(nodeList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		if(level==0){
			typeName='root';
			myObj.text='<b class="normal-fonts-location" onmousedown="locationClick(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			myObj.state='{opened": "true","selected":"true"}';
			myObj.type=typeName;
			myObj.nodeId=locationId;
			myObj.level=level;
			myObj.children=childrenArray;
			currentArryToIterate=childrenArray;
			createChildNodes(locationId,level,nodeList);
			createChildUsers(locationId,level,userList);
		}else{
			createChildNodes(locationId,level,nodeList);
			createChildUsers(locationId,level,userList);
		}
	});
	
	$jq_1_9_1('#jstree').jstree('destroy');
	$jq_1_9_1('#jstree').jstree({
        "contextmenu": {
            "select_node": true,
            "show_at_node": false,
            "items": customMenu
        },
        "types": {
            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
            "root": {"icon": "", "valid_children": ["area"]},
            "default": {"valid_children": ["default", "file"]},
            "user": {"icon": "icn user", "valid_children": []},
            "area": {"icon": "icn area", "valid_children": []}
        },
        "plugins": ["contextmenu", "types"],
        'core': {
            'data': [
				myObj
            ]
        }

    });
    $("#jstree").on('open_node.jstree', function(e, data) {
        $('li.jstree-open > ul li.jstree-open > ul').css({
            'width': ($(this).width() + 0) + 'px'
        });
    });
}
 
 function trees(result)
 {
	var nodeList=result.lstLocationData;
	var userList=result.lstPartnerHeirarchyData;
 	childrenArray= new Array();
	myObj = new Object();
	$(nodeList).each(function(i,obj)
	{
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		if(level==0){
			typeName='root';
			myObj.text='<b class="normal-fonts-location" onmousedown="locationClick(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			myObj.state='{opened": "true","selected":"true"}';
			myObj.type=typeName;
			myObj.nodeId=locationId;
			myObj.level=level;
			myObj.children=childrenArray;
			currentArryToIterate=childrenArray;
			createChildNodesForMove(locationId,level,nodeList);
//			createChildUsersForMove(locationId,level,userList);
		}else{
			createChildNodesForMove(locationId,level,nodeList);
//			createChildUsersForMove(locationId,level,userList);
		}
	}); 
	
	$jq_1_9_1('#jstree2').jstree('destroy');
	$jq_1_9_1('#jstree2').jstree({
//        "contextmenu": {
//            "select_node": true,
//            "show_at_node": false,
      //      "items": customMenu
//        },
        "types": {
            "#": {"max_children": 1, "max_depth": 4, "valid_children": ["root"]},
            "root": {"icon": "", "valid_children": ["area"]},
            "default": {"valid_children": ["default", "file"]},
            "user": {"icon": "icn user", "valid_children": []},
            "area": {"icon": "icn area", "valid_children": []}
        },
        "plugins": ["types"],
       'core': {
            'data': [
				myObj
            ]
        }

    });
     $("#jstree2").on('open_node.jstree2', function(e, data) {
        $('li.jstree2-open > ul li.jstree2-open > ul').css({
            'width': ($(this).width() + 0) + 'px'
        });
    }); 
} 


function createChildNodes(nodeId,nodeLevel,nodeList){
	$(nodeList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		var childArray=new Array();
		getChildArray(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			obj.text='<b class="normal-fonts-location" onmousedown="locationClick(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

 function createChildNodesForMove(nodeId,nodeLevel,nodeList){
	$(nodeList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
		var parentNodeId=obj.parentNodeId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var typeName='area';
		var childArray=new Array();
		getChildArray(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
 		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			obj.text='<b class="normal-fonts-location" onmousedown="locationClickForMove(\''+locationId+'\',\''+(level+1)+'\',\''+locationName+'\',\''+locationDescription+'\')">'+locationName+'</b>';
			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			
	//		alert(locationId);
			
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		} 
		//myObj.children=childArray;
 		setChildArray(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray(nodeId,nodeLevel,childArray)
		}, 10000);
	});
} 

function createChildUsers(nodeId,nodeLevel,userList){
	$(userList).each(function(i,obj) {
		var locationId=obj.locationId;
		var locationName=obj.locationName;
		var locationDescription=obj.locationDescription;
// 		var parentNodeId=obj.parentNodeId;
		var parentNodeId=locationId;
		var level=obj.level;
		var displaySeqNo=obj.displaySeqNo;
		var name=obj.userName;
		var partyId=obj.partyId;
		var headOfNode=obj.headOfNode;
		var typeName='user';
		var childArray=new Array();
		getChildArray(nodeId,nodeLevel);
		childArray=currentArryToIterate;
		currentArryToIterate==new Array();
		if(childArray==undefined)
			childArray=myObj['children'];
		if(parentNodeId==nodeId){
			var obj=new Object();
			if(headOfNode==true)
				obj.text='<span class="icn star"></span><b class="normal-fonts-location" onmousedown="userClick(\''+locationId+'\',\''+partyId+'\',\''+name+'\')">'+name+'</b>';
			else
				obj.text='<b class="normal-fonts-location" onmousedown="userClick(\''+locationId+'\',\''+partyId+'\',\''+name+'\')">'+name+'</b>';
// 			obj.state='{opened": "true","selected":"true"}';
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		//myObj.children=childArray;
// 		setChildArray(nodeId,nodeLevel,childArray);
		setTimeout(function() {
			setChildArray(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

function getChildArray(nodeId,nodeLevel){
// 	if(currentArryToIterate=='' || currentArryToIterate==undefined){
// 		//alert('in if')
// 		currentArryToIterate=myObj['children'];
// 	}
// 		var obj=currentArryToIterate[0];
// 		if(obj==undefined || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
// 			currentObj=myObj;
// 			return;
// 			}
// 		var level=obj['level'];
// 		var nodeId1=obj['nodeId'];
// 		if(level==nodeLevel && nodeId1==nodeId){
// 			currentArryToIterate=obj['children'];
// 			currentObj=obj;
// 		}else{
// 			currentArryToIterate = jQuery.grep(currentArryToIterate, function( a ) {
// 	 			  return a !== obj;
// 	 			});
			
// 			setTimeout(function() {
// 				getChildArray(nodeId,nodeLevel);
// 			}, 3000);
// 		}
	currentArryToIterate=myObj['children'];
	if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
		currentObj=myObj;
			return;
		}
		var i=0;
		while(i<currentArryToIterate.length){
			var obj=currentArryToIterate[i];
			var level=obj['level'];
			var nodeId1=obj['nodeId'];
			if(level==nodeLevel && nodeId1==nodeId){
				currentArryToIterate=obj['children'];
	 			currentObj=obj;
				return;
			}else{
				var isToReturn=getChildArray1(nodeId,nodeLevel,obj);
				if(isToReturn==true){
					return;
				}
			}
			i+=1;
		}
}

function getChildArray1(nodeId,nodeLevel,newObj){
	var currentArryToIterate1=new Array();
	currentArryToIterate1=newObj['children'];
	if(currentArryToIterate1.length==0 || (newObj['level']==nodeLevel && newObj['nodeId']==nodeId)){
		//currentObj=newObj;
			return false;
		}
		var i=0;
		while(i<currentArryToIterate1.length){
			var obj=currentArryToIterate1[i];
			var level=obj['level'];
			var nodeId1=obj['nodeId'];
			if(level==nodeLevel && nodeId1==nodeId){
				currentArryToIterate=obj['children'];
	 			currentObj=obj;
				return true;
			}else{
				var isToReturn=getChildArray1(nodeId,nodeLevel,obj);
				if(isToReturn==true){
					return;
				}
			}
			i+=1;
		}
}
function setChildArray(nodeId,nodeLevel,childArray){
	currentArryToIterate=myObj['children'];
	if(currentArryToIterate.length==0 || (myObj['level']==nodeLevel && myObj['nodeId']==nodeId)){
		myObj.children=childArray;
		return;
		}
	
// 	alert(myObj.level==nodeLevel && myObj.nodeId==nodeId)
	var i=0;
	while(i<currentArryToIterate.length){
	var obj=currentArryToIterate[i];
	//alert(obj.nodeId)
	var level=obj['level'];
	var nodeId1=obj['nodeId'];
	var level2=currentObj['level'];
	var nodeId2=currentObj['nodeId'];
	//alert(level+"-----------"+nodeId1+"--------"+level2+"-----------"+nodeId2)
	if(level==level2 && nodeId1==nodeId2){
		obj.children=childArray;
		currentArryToIterate[i]=obj;
		//alert(obj.locationName)
// 		currentArryToIterate = $.map(currentArryToIterate, function (obj, i) {
// 		    return {
// 		        regex: new RegExp('\\b' + i + '\\b', 'g'),
// 		        value: obj
// 		    };
// 		});
		myObj.children=currentArryToIterate;
		return;
	}else{
// 		currentArryToIterate = jQuery.grep(currentArryToIterate, function( a ) {
//  			  return a !== obj;
//  			});
		
// 		setTimeout(function() {
// 			setChildArray(nodeId,nodeLevel,childArray)
// 		}, 3000);
	}
	i+=1;
	}
	}
$(function() {
	
	$('#pnl-mhaddedit .mh-action').hide();
	$('#pnl-mh-advisor-addedit .mh-action').hide();

	$('#pnl-mh-sec-addedit .mh-action').hide();
	

});

function cancelLogo(isLogo)
{
	var id=0;
	if(isLogo=='1')
		{
		id=91036;
		}
	else{
		id=91035;	
	}
		
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/partner/deleteLogoOrPhoto.htm?attributeCodeId='+id,
				success : function(result) {
					if(result>=1 && id==91036)
						{
							$('#logoImage').attr('src','');
							$('#headerLogoImage').attr('src','');
							$('#logoCancel').hide();
							showAlertMessage("Success", "<br/>Logo Removed successfully.", "confirmation", doNothing);
						}
					else{
						$('#photoImage').attr('src','');
						$('#removePhoto').hide();
						showAlertMessage("Success", "<br/>Photo Removed successfully.", "confirmation", doNothing);
					}
				}
			});
		
	//location.reload();
}
function changeLable(id){
	if($('#isServiceProvidedSelect'+id).val()==1){
		$('#isServiceProvidedSpan'+id).html('Yes');
		$('#isServiceProvidedSpan'+id).attr('class','yes');
	}else{
		$('#isServiceProvidedSpan'+id).html('No');
		$('#isServiceProvidedSpan'+id).attr('class','no');
	}
		
}



function removeManufacturer(id,assetClass){
	var i=id.substring(id.indexOf('tr')+2,id.indexOf(assetClass));
	var maxRow;
	var lastRowId;
	var secondLastRowId;
	var totalRow = $('tr[name="'+assetClass+'"]').size();
	$('tr[name="'+assetClass+'"]').each(function(i,obj) {
		maxRow=$(obj).attr('id').substring($(obj).attr('id').indexOf('tr')+2,$(obj).attr('id').indexOf(assetClass));
		lastRowId=$(obj).attr('id');
		if((i+2)==totalRow){
			secondLastRowId=$(obj).attr('id');
		}
// 		alert($(obj).attr('id'))
	})
// 	alert(secondLastRowId+'----'+lastRowId+'-------'+id)
// 	alert(i)
// 	var tableSize = $('tr[name="'+assetClass+'"]').size();
	$('#'+id+' select').val(0);
	if(i!=0){
		$('#'+id).remove();
		var addHtml='&nbsp;<a onClick="addnewManufacturer('+assetClass+');" name="'+assetClass+'"  alt="Add Manufacturer"  title="Add Manufacturers"><i class="addicon"></i></a>';
		if(id==lastRowId){
			var i=secondLastRowId.substring(secondLastRowId.indexOf('tr')+2,secondLastRowId.indexOf(assetClass));
			$('#select'+i+assetClass).append(addHtml);
		}
		
	}
}

function addnewManufacturer(id){
	var totalRow = $('tr[name="'+id+'"]').size();
	var lastRowId;
	$('tr[name="'+id+'"]').each(function(i,obj) {
		tableSize=$(obj).attr('id').substring($(obj).attr('id').indexOf('tr')+2,$(obj).attr('id').indexOf(id));
		lastRowId=$(obj).attr('id');
// 		alert($(obj).attr('id'))
	})
	tableSize=parseInt(tableSize)+1;
	var addHtml='&nbsp;<a onClick="addnewManufacturer('+id+');" name="'+id+'"  alt="Add Manufacturer"  title="Add Manufacturers"><i class="addicon"></i></a>';
	$('a[name="'+id+'"]').remove();
	var selectHtml='';
	if(id==46002){
		selectHtml=debtSelectHTML;
	}else if(id==46001){
		selectHtml=equitySelectHTML;
	}else if(id==46003){
		selectHtml=goldSelectHTML;
	}else if(id==46004){
		selectHtml=insuranceSelectHTML;
	}else if(id==46006){
		selectHtml=loansSelectHTML;
	}else if(id==46007){
		selectHtml=realEstateSelectHTML;
	}else if(id==46005){
		selectHtml=serviceSelectHTML;
	}
	if(totalRow==1 && ($('#select0'+id).html()=='&nbsp;' || $('#select0'+id).html()=='')){
		$('#select0'+id).append('<i class="deleteicon" onclick="removeManufacturer(\'tr0'+id+'\','+id+')"></i>'+selectHtml+addHtml);
	}else{
		$('tr#'+lastRowId).after('<tr id="tr'+tableSize+id+'" name="'+id+'"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td id="select'+tableSize+id+'"><i class="deleteicon" onclick="removeManufacturer(\'tr'+tableSize+id+'\','+id+')"></i>'+selectHtml+addHtml+'</td><tr>');
	}
	
}



function showDiv(id){
	$('.profiledivs').hide();
	$('#'+id).show();
	$('#'+id+' #state').change();
	$('.profiledivlink').css('font-weight','normal');
	$('a[name="'+id+'"]').css('font-weight','bold');
	
	if(id=="manageHierachyLinkDiv")
	{
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/heirarchy/getHeirarchyData.htm',
			success : function(result) {
				createTree(result);
			}
	});
	}
	
	else if(id=="manageHierachyLinkDivForMoveUser")
	{
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/heirarchy/getHeirarchyData.htm',
			success : function(result) {
				//alert(result);
				trees(result);
			}
	});
	} 
}

function redirectHierarchy(){
	var locForm = document.getElementById("manageHeirarchyLocationForm");	
	locForm.reset();
	var partnerForm=document.getElementById("manageHeirarchySavePartnerForm");
	partnerForm.reset();
	document.getElementById("mh-sec-adduser").style.display = "none";
	document.getElementById("mh-addlocation").style.display = "none";
	showDiv('manageHierachyLinkDiv');
}

function split( val ) {
    return val.split( /;\s*/ );
  }
  function extractLast( term ) {
    return split( term ).pop();
  }

function retrieveCityList(event,id){
	var parentId=$('#'+id+' #state').val();
	cityArrayList = new Array();
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/common/getCityList.htm?parentId='+parentId,
		success : function(result) {
			$(result).each(function(i,obj) {
				var object = {};
				object.value = obj.codeValueId;
				object.label = obj.codeValue;
				cityArrayList.push(object);
			});
		    $('#'+id+' #city')
		    // don't navigate away from the field on tab when selecting an item
		    .bind( "keydown", function( event ) {
		      if ( event.keyCode ===  $.ui.keyCode.TAB &&
		          $( this ).data( "ui-autocomplete" ).menu.active ) {
		        event.preventDefault();
		      }
		    })
		    .autocomplete({
		      minLength: 0,
		      source: function( request, response ) {
		        // delegate back to autocomplete, but extract the last term
		    	  response(  $.ui.autocomplete.filter(cityArrayList, request.term) );
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
			        if(id=="residenceAddress"){
			        	residenceCityId=ui.item.value;
			        }else{
			        	officeCityId=ui.item.value;
			        }
					
//				alert('a='+a);
			        // 					        feedItemPost
//			        alert('id='+ui);
			        
			        // add placeholder to get the comma-and-space at the end
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
// validate="1" emsg="Subject"
function savePartnerProfile(id){
	var isValidated=true;
	var sectionName="";
	var actionName="";
	var formId="";
	if(id=='personalInfo_1FormDiv'){
		isValidated=validateInputForm(id);
		if(isValidated==true){
// 		alert(isValidated);
		var formId='';
		if(isImageSelected==1){
			formId='personalInfo_1Form'
		}else{
			formId='personalInfo_1FormHidden';
			$('#contactEmailHidden').val($('#contactEmail').val());
			$('#contactMobileHidden').val($('#contactMobile').val());
			$('#alternetMobileHidden').val($('#alternetcontact').val());
		}
		$('#'+formId+' input').removeAttr('disabled');
		sectionName="PersonalInfo1";
		openPopupWebApp('centerLoadingImage', 25, 35);
		 $('#'+formId).ajaxForm({
	            success: function(msg) {
	            	closePopupWebApp('');
	            	var result=msg[0];
	            	if(result=='success' && isImageSelected==1){
	            		//if('${sessionScope.userSession.partyId}'=='${sessionScope.oldpartyId}'){
	            		$('#photoImage').attr('src',$('#contextPath').val()+'/app/images'+msg[1]);
	            		//}
	            		showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
	            		$('#photochoose').hide();
	            		$('#photoFile').val('');
	            		$('#photoFileName').html('');
	            		isImageSelected=0;
	            	}else if(result=='success'){
	            		showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
	            	}else{
	            		showAlertMessage("Error",
	        					"There are some validation errors on the page please check to proceed further.",
	        					"error", doNothing);
	            	}
	            	disableProfileDiv1(id);
	            	
	            },
	            error: function(msg) {
	            	closePopupWebApp('');
	            	showAlertMessage("Error",
        					"There are some validation errors on the page please check to proceed further.",
        					"error", doNothing);
	            }, onComplete: function (data) {
	            	closePopupWebApp('');
	            	showAlertMessage("Error",
        					"There are some validation errors on the page please check to proceed further.",
        					"error", doNothing);
	            }
	        }).submit();
		}
	}else if(id=='personalInfo_2FormDiv'){
		sectionName="PersonalInfo2";
		isValidated=validateInputForm(id);
		actionName="partner/savePartnerProfileData.htm";
		formId="personalInfo_2Form";
	}else if(id=='email_details'){
		sectionName="EmailDetails";
		isValidated=validateInputForm(id);
		actionName="partner/savePartnerProfileData.htm";
		formId="emailDetailsForm";
	}else if(id=='email_signature_details'){
		sectionName="EmailSignature";
		isValidated=validateInputForm(id);
		
		var data = $('#emailSignature').html();
		$('#emailSignatureHidden').val(data);
		actionName="partner/savePartnerProfileData.htm";
		formId="emailSignatureForm";
	}else if(id=='email_disclaimer_details'){
		sectionName="EmailDisclaimer";
		isValidated=validateInputForm(id);
		var data = $('#disclaimer').html();
		$('#disclaimerHidden').val(data);
		actionName="partner/savePartnerProfileData.htm";
		formId="emailDisclaimerForm";
	}else if(id=='email_dnd_details'){
		sectionName="EmailDND";
		isValidated=validateInputForm(id);
		var data = $('#dnd').html();
		$('#dndHidden').val(data);
		actionName="partner/savePartnerProfileData.htm";
		formId="emailDNDForm";
	}else if(id=='bankDiv'){
		sectionName="BankDetails";
		isValidated=validateInputForm(id);
		actionName="partner/savePartnerProfileData.htm";
		formId="bankForm";
	}else if(id=='mfFileUploadConfigTable'){
		sectionName="MFFileUploadCongiuration";
		isValidated=validateInputForm(id);
		actionName="partner/savePartnerProfileData.htm";
		formId="mfFileUploadConfigForm";
	}else if(id=='user_account_details'){
		sectionName="UserAccountDetails";
		isValidated=validateInputForm(id);
		
		if($('#securityAnswer').val()!='' && ($('#securityQuestionId').val()==0 && $('#securityQuestionId').val()==undefined)){
			isValidated=false;
			$('#securityQuestionId').css('border-color','red');
			$('#securityQuestionId').attr('title', 'Please Select Security Question.');
		}else{
			$('#securityQuestionId').css('border-color','grey');
			$('#securityQuestionId').removeAttr('title');
		}
		
		if(($('#securityQuestionId').val()==0 && $('#securityAnswer').val()!='')){
			isValidated=false;
			$('#securityQuestionId').css('border-color','red');
			$('#securityQuestionId').attr('title', 'Please Select Security Question.');
		}
		
		
		if(($('#password').val()=='****' || $('#password').val()==undefined || $('#password').val()==null) && isValidated==true){
			$('#password').val('');
		}
		actionName="partner/savePartnerProfileData.htm";
		formId="userAccoundDetailsForm";
	}else if(id=='residenceAddress'){
		sectionName="RecidenceAddress";
		isValidated=validateInputForm(id);
		actionName="partner/savePartnerProfileAddressData.htm";
		formId="residenceAddressForm";
		if(residenceCityId==0 || residenceCityId==undefined){
			$('#'+id+' #cityHidden').val($('#'+id+' #city').val());
		}else{
			$('#'+id+' #cityHidden').val(residenceCityId);
		}
		
	}else if(id=='documentsDetails'){

		sectionName="DocumentDetails";
		isValidated=validateInputForm(sectionId);
		actionName="opportunity/saveOpportunityProfileDocumentData.htm?partyId=${sessionScope.userSession.partyId}&sectionName="+sectionName;
		formId="documentsDetailsForm";		
		if(isValidated==true){
//	 		alert('In AJAX if '+sectionId);
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/'+actionName+'?sectionName='+sectionName,
				data:$('#'+formId).serialize(),
				success : function(result) {
					if(result==1){
						showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
					}
					
					disableProfileDiv1(sectionId);
				}
			});
		}
	}else if(id=='autoPlanConfigurationDetails'){
		sectionName="AutoPlanConfiguration";
		actionName="partner/saveAutoPlanConfiguration.htm";
		var isAutoPlanEnabled=0;
		if ($('#isAutoPlanEnabled').is(':checked')) {
			isAutoPlanEnabled=1;
		}
		if(isValidated==true){
//	 		alert('In AJAX if '+sectionId);
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/'+actionName+'?sectionName='+sectionName+'&isAutoPlanEnabled='+isAutoPlanEnabled,
				success : function(result) {
					if(result==1){
						showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
					}
					
					disableProfileDiv1(id);
				}
			});
		}
	}
	else if(id=='interestedFPDetails'){
// 		alert("Section---"+id);
		sectionName="InterestedFPDetails";		
		actionName="partner/savePartnerProfileData.htm?partyId=${sessionScope.userSession.partyId}&sectionName="+sectionName;
		isValidated=validateInputForm(id);
		formId="interestFPForm";
// 		alert(formId);
// 		var interestedFpXML='<Root>';
		var interestedFpXML='';
		var attributeCodeIds="";
		$('input[name="interestedFP"]').each(function() {
			var id=$(this).attr('id');
			id=id.substring(id.indexOf('interestedFP')+12);
// 			alert("Fp id--"+id);
			
			if ($(this).is(':checked')) {
				attributeCodeIds+=id+",";
			}
			else{
// 				interestedFpXML+='<Attribute>';
// 				interestedFpXML+='<AttributeCodeId>'+id+'</AttributeCodeId>';
// 				interestedFpXML+='<AttributeCodeValue>0</AttributeCodeValue>';
// 				interestedFpXML+='</Attribute>';
			}
			
		});
		if(attributeCodeIds!=''){
			attributeCodeIds=attributeCodeIds.substring(0,attributeCodeIds.lastIndexOf(','));
		}
		interestedFpXML+='<Attribute>';
		interestedFpXML+='<AttributeCodeId>91115</AttributeCodeId>';
		interestedFpXML+='<AttributeCodeValue>'+attributeCodeIds+'</AttributeCodeValue>';
		interestedFpXML+='</Attribute>';
// 		interestedFpXML+='</Root>';
// 		alert("XML---"+interestedFpXML);
		if(attributeCodeIds!=''){
			$('#interestedFpXML').val(interestedFpXML);	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName,
			data:$('#interestFPForm').serialize(),
			success : function(result) {
				
				if(result==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing)
				}
				else{
					
				}
				disableProfileDiv1(id);
			}
		});
		}
		
		console.log('interestedFpXML---------'+interestedFpXML);		
	}
	
	
	else if(id=='officeAddress'){
		sectionName="OfficeAddress";
		isValidated=validateInputForm(id);
		actionName="partner/savePartnerProfileAddressData.htm";
		formId="officeAddressForm";
		if(officeCityId==0 || officeCityId==undefined){
			$('#'+id+' #cityHidden').val($('#'+id+' #city').val());
		}else{
			$('#'+id+' #cityHidden').val(officeCityId);
		}
	}else if(id=='manageHeirarchyLocation')
	{
// 		$('#mh-addlocation input[id="saveLocation"]').attr('disabled','disabled');


		if ($.trim($('#nodeLocation').val()) == '') 
			{
				$('#nodeLocation').css('border-color','#d16e6c');
				$('#nodeLocation_error').removeClass('hide');
				isValidated = false;
				
			}
			else{				
				$('#nodeLocation_error').addClass('hide');				
				$('#nodeLocation').css('border-color','#d5d5d5');
			}
		if ($.trim($('#nodeDescription').val()) == '') 
		{
			$('#nodeDescription').css('border-color','#d16e6c');
			$('#nodeDescription_error').removeClass('hide');
			isValidated = false;
			
		}
		else{				
			$('#nodeDescription_error').addClass('hide');				
			$('#nodeDescription').css('border-color','#d5d5d5');
		}

		
		sectionName="ManageHeirarchyLocation";
		actionName="heirarchy/savePartnerLocationData.htm";	
		formId="manageHeirarchyLocationForm";
		//alert('In -- '+sectionName);
		//isValidated=validateInputForm(formId);
		//isValidated=true;
		var nodeLocation=$('#nodeLocation').val();
		var nodeDescription=$('#nodeDescription').val();
		var nodePartyId=<%=userSession.getPartyId()%>;
		
		if(nodeLocation=='' || nodeDescription=='')
		{
			isValidated=false;
		} else{
			isValidated=true;
		}
		//alert('Validated----***********-------'+isValidated);			

		if(isValidated==true){
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/'+actionName,
				data:$('#manageHeirarchyLocationForm').serialize(),
				success : function(result) {
					
					var locationresult=result;
					
					if(result==1){						
						$('#locationresult').val("1");
						
						  bootbox.dialog({
							  	message: "<span class='bigger-110'>Location saved successfully.</span>",
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
					else{
						
					}
					
				}
			});		
		}
	}
	else if(id=="manageHeirarchySavePartner")
	{
// 		var partnerForm=document.getElementById("manageHeirarchySavePartnerForm");
// 		partnerForm.reset();
		
	actionName="partner/savePartnerData.htm";
	formId="manageHeirarchySavePartnerForm";
	var pst =71709;
	var isValidData =true;
	isValidData =addPartnerRequiredValidation();
	 
	var partyId = $('#manageHeirarchySavePartnerForm #partyId').val();
   // alert('partyId='+partyId)
//	alert('isValidData='+isValidData);
	var nameuser=$('#partner_loginName').val();
	//alert('User----'+nameuser);
	
	if (nameuser.contains(' ')) {
		$('#partner_loginName').css('border-color','red');
		$('#partner_loginName').attr('title', 'Space are not allow in password field.');
		isValidData = false;
	}
	
	if(isValidData==false){
		 showAlertMessage("Error",
					"There are some validation errors on the page please check to proceed further.",
					"error", doNothing);
		 return;
	 }
	 else{
		 //alert('in else also');
		  $.ajax({
				 type :'POST',
		         url : $('#contextPath').val() +'/'+actionName,
		         data:$('#manageHeirarchySavePartnerForm').serialize(),
				 success : function(result)
				 {
					 var zero="0";
					 result=result.split("~");
					 
					 if(result[0]==1){
						 showAlertMessage("Error",
									"<br/>Username already exist.",
									"error", doNothing);
						 $('#manageHeirarchySavePartner').show();
					 }
					 else if(result[0]==2)
						 {
						 showAlertMessage("Error",
									"User ARN and EUIN Combination already present.",
									"error", doNothing);
						 $('#manageHeirarchySavePartner').show();
						 }
					 else{
						 showAlertMessage("Success", "<br/>User saved Successfully.", "confirmation", redirectHierarchy);
						// $('#manageHeirarchySavePartner').show();
						//alert('Partner added.');
						
					 }
					
					
					
			}
			});
	 }
	}
	else if(id=='email_other_details'){
		var formId='';
		if(isLogoSelected==1){
			formId='emailOtherDetailsForm';
			$('#themeName').val($("#theme option:selected").text());
// 			$('#smsSignature').val($('#'+id).find('.wysiwyg-editor').html());
		}else{
			formId='EmailOtherDetailsFormHidden';
// 			$('#smsSignatureHidden').val($('#'+id).find('.wysiwyg-editor').html());
			$('#smsSignatureHidden').val($('#smsSignature').val())
			$('#themeNameHidden').val($("#theme option:selected").text());
			$('#themeHidden').val($('#theme').val());
		}
		$('#'+formId+' input').removeAttr('disabled');
		
// 		$('#
//Image').removeAttr('src');
// 		$('#logoImage').removeAttr('src');
		openPopupWebApp('centerLoadingImage', 25, 35);
		sectionName="EmailOtherDetails";
		 $('#'+formId).ajaxForm({
	            success: function(msg) {
	            	closePopupWebApp('');
	            	var result=msg[0];
	            	if(result=='success' && isLogoSelected==1){
	            		if('${sessionScope.userSession.partyId}'=='${sessionScope.oldpartyId}'){
	            		
	            		$('#headerLogoImage').attr('src',$('#contextPath').val()+'/app/images'+msg[1]);
	            		}
	            		$('#logoImage').attr('src',$('#contextPath').val()+'/app/images'+msg[1]);
	            		$('#headerLogoImage').show();
	            		showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
	            		$('#logochoose').hide();
	            		$('#logoCancel').hide();
	            		$('#logoFile').val('');
	            		$('#logoFileName').html('');
	            		isLogoSelected=0;
	            		
	            	}else if(result=='success'){
	            		showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
	            	}else{
	            		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	            	}
	            	disableProfileDiv1(id);
	            	
	            },
	            error: function(msg) {
	            	closePopupWebApp('');
	            	showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	            }, onComplete: function (data) {
	            	closePopupWebApp('');
	            	showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	            }
	        }).submit();
	}else if(id=='financialProductServicesFormDiv'){
		var isvalidSection=true;
		var productXML='';
		$(assetClassList).each(function(i,obj) {
			var codeValueId=obj.codeValueId;
			var codeValue=obj.codeValue;
			var displaySeqNo=obj.displaySeqNo;
			var isServiceProvided=$('#isServiceProvidedSelect'+codeValueId).val();
			var serviceCode=$('#serviceCode'+codeValueId).val();
			
			productXML+='<AssetClass>';
			productXML+='<CodeValueId>'+codeValueId+'</CodeValueId>';
			productXML+='<DisplaySeqNo>'+displaySeqNo+'</DisplaySeqNo>';
			if(isServiceProvided==1){
				if(serviceCode=='' || serviceCode==undefined){
					isvalidSection=false;
					$('#serviceCode'+codeValueId).css('border-color','red');
					$('#serviceCode'+codeValueId).attr('title', 'Please enter Service Code.');
				}else{
					$('#serviceCode'+codeValueId).css('border-color','grey');
					$('#serviceCode'+codeValueId).removeAttr('title');
					productXML+='<IsServiceProvided>1</IsServiceProvided>';
					productXML+='<ServiceCode>'+serviceCode+'</ServiceCode>';
					var manufacturers="";
					$('tr[name="'+codeValueId+'"]').each(function(i,obj) {
						var id=$(obj).attr('id');
						if(manufacturers==''){
							manufacturers+=$('#'+id+' select.manufacturer').val();	
						}else{
							if(isManufacturerExist(manufacturers,$('#'+id+' select.manufacturer').val())==true){
								isvalidSection=false;
								$('#'+id+' select.manufacturer').css('border-color','red');
								$('#'+id+' select.manufacturer').attr('title', 'This Manufacturer is already selected. Please remove it.');
							}else{
								manufacturers+=','+$('#'+id+' select.manufacturer').val();
								$('#'+id+' select.manufacturer').css('border-color','grey');
								$('#'+id+' select.manufacturer').removeAttr('title');
							}
						}
						
					})
					productXML+='<Manufacturers>'+manufacturers+'</Manufacturers>';
				}
				
			}else{
				productXML+='<IsServiceProvided>0</IsServiceProvided>';
				productXML+='<ServiceCode></ServiceCode>';
				productXML+='<ServiceCode></ServiceCode>';
				productXML+='<Manufacturers></Manufacturers>';
				$('#serviceCode'+codeValueId).val('');
				$('tr[name="'+codeValueId+'"]').each(function(i,obj) {
					var id=$(obj).attr('id');
					removeManufacturer(id,codeValueId);
				})
			}
			productXML+='</AssetClass>';
			
		});
		if(isvalidSection==true){
		$('#financialProductServicesForm input').removeAttr('disabled');
// 		productXML+='</Root>';
		$('#productXml').val(productXML);
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/savePartnerProfileFinancialProducts.htm?sectionName=FinancialProduct',
			data:$('#financialProductServicesForm').serialize(),
			success : function(result) {
				if(result==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing)
				}
				disableProfileDiv1(id);
			}
		});
		}
// 		$('#financialProductServicesForm').submit();
	}
	else if(id=='change_password_div'){
		isValidated=validateInputForm('changePasswordForm');
		var isPopupOpen=false;
		if(isValidated==false){
			isPopupOpen=true;
		}
		var oldPassword=$('#oldPassword').val();
		var newPassword=$('#newPassword').val();
		var confirmPassword=$('#confirmPassword').val();
		if ((newPassword.length<8 || newPassword.length>15) && newPassword.length > 0) {
			$('#newPassword').css('border-color','red');
			$('#newPassword').attr('title', 'New Password must be 8-15 characters long.');
			isValidated = false;
		}else if (newPassword.contains(' ')) {
			$('#newPassword').css('border-color','red');
			$('#newPassword').attr('title', 'Space are not allow in password field.');
			isValidated = false;
		} else if (!newPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*[!@.#$%^&*])/i)) {
			$('#newPassword').css('border-color','red');
			$('#newPassword').attr('title', 'At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
			isValidated = false;
		}else{
			$('#newPassword').css('border-color','grey');
			$('#newPassword').removeAttr('title');
		}
		if(newPassword!=confirmPassword){
			$('#confirmPassword').css('border-color','red');
			$('#confirmPassword').attr('title', 'Confirm Password must be same as New Password.');
			isValidated = false;
		}else{
			$('#confirmPassword').css('border-color','grey');
			$('#confirmPassword').removeAttr('title');
		}
		
		if(isValidated==true){
			$('#changePasswordButton').attr('disabled','disabled');
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/common/chnagePassword.htm',
				data:$('#changePasswordForm').serialize(),
				success : function(result) {
					if(result>0){
						showAlertMessage("Success", "<br/>Password changed successfully.", "confirmation", doNothing);
						$('.ZebraDialog').css('z-index','9999999999');
						closeChangePasswordPopup();
					}else{
						showAlertMessage("Error","<br/>Current password does not match.", 'error', doNothing);
						$('.ZebraDialog').css('z-index','9999999999');
					}
					$('#changePasswordButton').removeAttr('disabled');
				}
			});
		}else if(isPopupOpen==false){
			showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
			$('.ZebraDialog').css('z-index','9999999999');
		}
		
		
	}
		
	if(isValidated==true && id!='personalInfo_1FormDiv' && id!='email_other_details' && id!='financialProductServicesFormDiv' && id!='change_password_div' && id!='interestedFPDetails' && id!='autoPlanConfigurationDetails' && id!='manageHeirarchyLocation' && id!='manageHeirarchySavePartner' ){
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName+'?sectionName='+sectionName,
			data:$('#'+formId).serialize(),
			success : function(result) {
				if(result>0){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing)
				}else{}
				if(id=='user_account_details')
				
					$('#password').val('****');
				
				else if(id=='residenceAddress')
				$('#sameAsAboveSpan').hide();
				else if(id=='mfFileUploadConfigTable'){
					$('#camsPassword').attr('type','password');
					$('#karvyPassword').attr('type','password');
					$('#sundaramPassword').attr('type','password');
				}
				disableProfileDiv1(id);
			}
		});
	}
	
}
// $('#partner_ARN').blur(function(){
// 	getUniqueArn();
// });

// $('#partner_euin').change(function(){
// 	getUniqueArn();
// });
function getUniqueArn()
{
	//alert('in method');
	if($('#partner_ARN').val()==""){}else{var arn = $('#partner_ARN').val();}
	
	if($('#partner_euin').val()==""){}else{var arn = $('#partner_euin').val();}
	
	$.ajax({     
     type: "POST",
     url : $('#contextPath').val() +"/partnersp/getUniqueArn.htm?arn="+arn,  
     dataType: 'json', 
     contentType: 'application/json',     
        success:function(result)  
     { 
      			 $(result).each(
      			 function(i, obj) {
      				 if((obj.arn)==null || (obj.arn)==""){
      					 
      				} else{
      					alert('ARN already exist');
      					$('#partner_ARN').val('');
      					$("#partner_ARN").focus();
      					/* $('#eARN').val('');
      					$("#eARN").focus(); */
      				}
                  });     
    
     }
  
  });   

} 
function redirectHome()
{
	disableProfileDiv("manageHeirarchyCancelPartner");
}
function isManufacturerExist(manufacturers,m){
	var manufacturersArray=manufacturers.split(",");
	if(manufacturersArray.contains(m)){
		return true;
	}else{
		return false;
	}
}

function openChangePasswordPopup(){
	$('#oldPassword').val('');
	$('#newPassword').val('');
	$('#confirmPassword').val('');
	/*$('#popUpChangePassword').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpChangePassword').css('height'))/2);
	$('#popUpChangePassword').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpChangePassword').css('width'))/2);
	$('#popUpChangePassword').css('margin-left', width);
	$('#popUpChangePassword').css('position','fixed');*/
	$('#popUpChangePassword').modal('show');
}
function closeChangePasswordPopup(){
	$('#popUpChangePassword').hide();
	$('#blanket').hide();
}
function applyTheme(){
	$('body').append('<link rel="stylesheet" href="'+$('#contextPath').val()+'/css/'+$("#theme option:selected").text()+'.css" />');
}
</script>

<script>

function printTransaction(orderId){
	
/* 	var hiddenIFrameID = 'hiddenDownloader',
    iframe = document.getElementById(hiddenIFrameID);
	alert(iframe);
	if (iframe == null) {
   		 iframe = document.createElement('iframe');
    	 iframe.id = hiddenIFrameID;
  	 	 iframe.style.display = 'none';
   	 	 document.body.appendChild(iframe);
	} 
	$("<iframe id='printFrame'  onload='printMe();' ></iframe>").appendTo("body")
    .attr('src', '${pageContext.request.contextPath}/pg/printReceipt')
    .load(function() 
     {
    	alert('iframe loaded');
     });
//	$(iframe).attr('src','${pageContext.request.contextPath}/pg/printReceipt');
	 $(iframe).load(function () {
	        alert('iframe loaded');
	        
	    });
	*/
}
/* function printMe(){
	alert('printMe');
	var PDF = document.getElementById('printFrame');
      PDF.focus();
      PDF.contentWindow.print();
	
} */

/* $(document).ready(function(){
    $("transactionPrint").click(function(e) {
        $('a#test').attr({target: '_blank', 
                href  : 'http://localhost/text.txt'});
    });
    var downloadURL = function downloadURL(url) {
        var hiddenIFrameID = 'hiddenDownloader',
            iframe = document.getElementById(hiddenIFrameID);
        if (iframe === null) {
            iframe = document.createElement('iframe');
            iframe.id = hiddenIFrameID;
            iframe.style.display = 'none';
            document.body.appendChild(iframe);
        }
        iframe.src = url;
        iframe.contentWindow.print();
        onload=setFrameLoaded();

    };
}); */



function makePayment(){
	
	$('#btnPayment').removeAttr('disabled');
	
	var categoryId=$('#categoryId').val();
	
	window.location.href=$('#contextPath').val()+'/pg/orderConfirmation.htm';
}

function showSubscriptionDiv(divId){
	
	showDiv(divId);
	//alert($('#'+divId+' input').val());
	$('#'+divId+' input').attr('disabled',false);
	$.ajax({
		type : "GET",
		url : '${pageContext.request.contextPath}/pg/showSubscription.htm',
		
		success : function(result) {
			bindSubxDiv(result);
		}
	});
	
	
}

function bindSubxDiv(subxData){
	
	var data=subxData[1];
	
	var newSubxData=subxData[0];
	
	
	var actions='<display:column sortable="true" title="Action"><span class="dropdown"> <a id="Action6"   class="dropdown-toggle" href="#" data-toggle="dropdown"'
          +  'style="text-decoration: none;">Action<span class="caret"></span></a>'
          +'<ul class="dropdown-menu" id="ActionMenu6" style="left:-96px !important;">'
          +'<li id="SPPartnerDashboardLink">'
          +'<a href="<%=request.getContextPath()%>/pg/printReceipt"><span class="user">'
          + 'View Transactions</span></a></li>'
          +'<li id="SPOpportunityListLink">'
          +'<a href="<%=request.getContextPath()%>/partnersp/getPaymentList.htm?partyId=${data.partyID}"><span class="user">'
          + 'View Payments</span></a></li> </ul></span></display:column>';
           
           
          //alert(JSON.stringify(data[0]['subscriptionStartDate']));
	var subxRows='';
		
	for(var i=0;i<data.length;i++){
		console.log(data[i]);
		
		
		subxRows+='<tr><td>'+data[i]['productName']+'</td><td>'+data[i]['startDate']+'</td><td>'+data[i]['endDate']+'</td><td>'+data[i]['type']+'-'+data[i]['status']+'</td></tr>';
	
	}
	$('#subxTable tbody').empty();
	$('#subxTable tbody').html(subxRows);
	
	
	
	//if(newSubxData!=null){
		
		if(newSubxData){
	
		$('#newSubxData').html('<strong>'+newSubxData[0]['activeSubx']+'</strong>');
		
		 $('#btnPayment').attr('disabled',false);
		
		if(newSubxData[0]['subxPlanLimit']!=0){
			if(newSubxData[0]['planCount']<newSubxData[0]['subxPlanLimit']){
			//$('#countPlan').html("Just create"+7-newSubxData[0]['planCount'] +"more plans to get one month free Subscription");
			$('#countPlan').html("Get one month free subscription by creating "+(newSubxData[0]['subxPlanLimit']-newSubxData[0]['planCount']) +" more plans");
		
			}
			else{
					$('#countPlan').html("Congratulation !! You will get one month free subscription.");
			}
		}
		$('#categoryId').val(newSubxData[0]['categoryId']);
	}
	/* else if(newSubxData&&newSubxData[0]['amountDue']==0){
		$('#newSubxData').html('<strong>'+newSubxData[0]['activeSubx']+'</strong>');
		$('#btnPayment').hide();
		$('#btnPayment').attr('disabled',true);
	} */
	else{
		
		$('#btnPayment').attr('disabled',true);
		$('#btnPayment').hide();
	} 
		
//}
}


function showPaymentDiv(divId){
	showDiv(divId);
	$.ajax({
		type : "GET",
		url : '${pageContext.request.contextPath}/pg/showPayment.htm',
		
		success : function(result) {
			
			bindPaymentDiv(result);
		}
	});
	
	
}
function bindPaymentDiv(data){
	 
	 
	 var actions='';
	  
	var partyId=<%=userSession.getPartyId()%>;
		var buId=<%=userSession.getBuId()%>;
	    var contextPath="${pageContext.request.contextPath}";     
	    var ReportName="'PaymentReceipt.rptdesign'";
	    var ReportName_D="PaymentReceipt.rptdesign";
	    var ReportFormat="pdf";  
	    var reportLink="<%=request.getContextPath()%>/pg/printReceipt?ReportName="+ReportName_D+"&partyId="+partyId+"&ReportFormat="+ReportFormat+"&buId="+buId;
	    var clickData=ReportName+','+partyId+',';
	    var popUpAlertaddnote="'popUpAlertaddnote'"; 
	    
	    var paymentRows=''
	 for(var i=0;i<data.length;i++){
		 actions='';
		var validity='';
		 if(data[i]['paymentStatusID']==148003){
	  actions='<display:column sortable="true" title="Action"><span class="dropdown"> <a id="Action6"   class="dropdown-toggle" href="#" data-toggle="dropdown"'
	           +  'style="text-decoration: none;">Action<span class="caret"></span></a>'
	           +'<ul class="dropdown-menu" id="ActionMenu6" style="left:-96px !important;">'
	           +'<li id="paymentDownload">'
	         <%--   +'<a href="<%=request.getContextPath()%>/pg/printReceipt"><span class="user">' --%>
	          +'<a  href="'+reportLink+'&paymentId='+data[i]["paymentID"]+'"><span class="user">' 
	           + 'Download Receipt</span></a></li>'
	           +'<li id="paymentPrint">'
	 /*  +'<a  onClick="printReceipt('+data[i]['paymentID']+')"><span class="user">' */
	           /* +'<a  href="'+reportLink+'&paymentId='+data[i]["paymentID"]+'"><span class="user">' */
	             +'<a  onClick="popup('+popUpAlertaddnote+');reportnote();getPaymentReceipt('+clickData+' '+data[i]['paymentID']+')"><span class="user">' 
	           +'Print Receipt</span></a></li> </ul></span></display:column>';
		 
		 validity=data[i]['validTill'];
		 }
	  paymentRows+='<tr><td>'+data[i]['paymentDate']+'</td><td>'+data[i]['productName']+'</td><td>'+ validity+'</td><td>'+data[i]['TrxnRefNo']+'</td><td>'+data[i]['pgTrx']+'</td><td>'+data[i]['paymentAmount']+'/-</td><td>'+data[i]['paymentStatus']+'</td><td>'+actions+'</td></tr>';
	 
	 }
	 
	 $('#paymentTable tbody').html(paymentRows);
	}
<%-- function bindPaymentDiv(data){
	
	var actions='';
          
	var paymentRows=''
	for(var i=0;i<data.length;i++){
		
		if(data[i]['paymentStatusID']==148002){
		actions='<display:column sortable="true" title="Action"><span class="dropdown"> <a id="Action6"   class="dropdown-toggle" href="#" data-toggle="dropdown"'
	          +  'style="text-decoration: none;">Action<span class="caret"></span></a>'
	          +'<ul class="dropdown-menu" id="ActionMenu6" style="left:-96px !important;">'
	          +'<li id="paymentDownload">'
	          +'<a href="<%=request.getContextPath()%>/pg/printReceipt"><span class="user">'
	          + 'Download</span></a></li>'
	          +'<li id="paymentPrint">'
	          +'<a  onClick="printReceipt('+data[i]['paymentID']+')"><span class="user">'
	          + 'Print</span></a></li> </ul></span></display:column>';
		}
		
		paymentRows+='<tr><td>'+data[i]['paymentDate']+'</td><td>'+data[i]['productName']+'</td><td>'+data[i]['TrxnRefNo']+'</td><td>'+data[i]['pgTrx']+'</td><td>'+data[i]['paymentAmount']+'/-</td><td>'+data[i]['paymentStatus']+'</td><td>'+actions+'</td></tr>';
	
	}
	
	$('#paymentTable tbody').html(paymentRows);
} --%>

function getPaymentReceipt(reportName,partyId,paymentId) {
	 //alert("paymentId : "+paymentId+" partyId : "+partyId);
	 var ReportFormat="pdf";
	 var buId=<%=userSession.getBuId()%>
	var reporturl ="<%=request.getContextPath()%>/pg/printReceipt.htm?ReportName="+reportName+"&ReportFormat=html&paymentId="+paymentId+"&partyId="+partyId+"&buId="+buId;
	//alert("Report Name:" +reportName+" BiId : "+buId+"contextPath :"+contextPath);
	$("#reportview").html("Loading...");
	 
	    $('#reportview').load(reporturl ,function(response, status, xhr) {
	     
	      if (status == "error") {
	     var msg = "Sorry but there was an error getting details ! ";
	  $("#reportview").html(msg + xhr.status + " " + xhr.statusText);
	   }else{
	    $('#downloadOptions').show();    
	    $('.div_dragger').trigger("click");
	   }
	    });
	    
	    currentReportName=reportName; 
	}
	
function showNACHDiv(divId){
	
	showDiv(divId);
	
	$('#'+divId+' input').attr('disabled',false);
	$.ajax({
		type : "GET",
		url : '${pageContext.request.contextPath}/nach/showNACHDetails.htm',
		
		success : function(result) {
			bindNACHDiv(result);
		}
	});
	
	
}

function enableNACHDiv(id){
	
	enableProfileDiv(id);
	$('#nachStatus').attr("disabled","disabled");
	$("#nachEmail").removeAttr("style");
	//$('#registrationDate2').attr("disabled","disabled");
}
function bindNACHDiv(data){
	//alert(JSON.stringify(data))
	$('#nachInitiate').hide();
		$('#nachDetail').show();
	if(data){
	
	$('#nachPartyName').val(data['partyName']);
	$('#nachBankName').val(data['bankName']);
	//$('#nachBranch').val(data['branch']);
	$('#nachAccountNo').val(data['accountNo']);
	$('#nachMicr').val(data['micr']);
	$('#nachEmail').val(data['email']);
	$('#nachMobile').val(data['mobile']);
	$('#nachIfsc').val(data['ifsc']);
	$('#startDate').val(data['startDate']);
	$('#endDate').val(data['endDate']);
	$('#note').val(data['note']);
	$('#reason').val(data['errorDetail']);
	
	$('#limitAmount').val(data['limitAmount']);
	$('#nachId').val(data['nachId']);
	$('#reference').val(data['reference1'])
	$('#reference2').val(data['reference2'])
	$('#note').val(data['remark']);
	$('#registrationDate').val(data['registrationDate']);
	$('#registrationDate2').text(data['registrationDate']);
	$('#status').val(data['statusId']);
	for(var i=0;i<data['frequencies'].length;i++){
	
		var selected='';
		if(data['freqId']==data['frequencies'][i]['id']){
			selected='selected';
		}
		$('#frequencyId').append('<option value="'+data['frequencies'][i]['id']+'"'+selected+'>'+data['frequencies'][i]['value']+'</option>');
		//console.log(JSON.stringify(data['frequencies'][i]['value']));
	}
	
	for(var i=0;i<data['status'].length;i++){
		
		var selected='';
		if(data['statusId']==data['status'][i]['id']){
			selected='selected';
		}
		
		$('#nachStatus').append('<option value="'+data['status'][i]['id']+'"'+selected+'>'+data['status'][i]['value']+'</option>');
		//console.log(JSON.stringify(data['frequencies'][i]['value']));
	}
	for(var i=0;i<data['accountType'].length;i++){
		var selected='';
		if(data['accountTypeId']==data['accountType'][i]['id']){
			selected='selected';
		}
		$('#accounttypeId').append('<option value="'+data['accountType'][i]['id']+'"'+selected+'>'+data['accountType'][i]['value']+'</option>');
		//console.log(JSON.stringify(data['frequencies'][i]['value']));
	}
	disableProfileDiv1("nachPersonal");
	$("#nachEmail").css("width","300px");
	}
	else{
		$('#nachInitiate').show();
		$('#nachDetail').hide();
	}
}

function saveNACHDetails(){
	
	//alert($('#nachPersonal').serialize());
	//$('#nachPersonal').submit();
	
	var error= validateNachForm();
		
	if(error&&error!=''){
		
		showAlertMessage("Validation Error", "<br/>"+error, "error", doNothing);
	}
	else{
	$.ajax({
		type : "POST",
		
		 data : $('#nachPersonal').serialize(),
		url : '${pageContext.request.contextPath}/nach/saveNACH.htm',
		success : function(result) {
				if(result['response']=='success'){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
					disableProfileDiv1("nachPersonal");
				}
				else{
					showAlertMessage("Error", "<br/>Error while saving Data", "error", doNothing);
				}
		}
	});
	}
}

function validateNachForm(){
	var error='';
	if($('#nachPartyName').val()==''){
		error='Please enter Name as in Bank Account';
		return error;
		
	}
	 if($('#nachAccountNo').val()==''){
		error='Please enter Account Number';
		return error;
		
	}
	 if($('#nachEmail').val()==''){
		error='Please enter email address';
		return error;
	}
	 if($('#nachBankName').val()==''){
		error='Please enter Bank Name';
		return error;
	}
	 if($('#nachIfsc').val()==''&&$('#nachMicr').val()==''){
		error='Please enter either IFSC code or MICR';
		return error;
	}
	 if($('#startDate').val()==''){
		error='Please enter start Date';
		return error;
	}
	 if($('#endDate').val()==''){
		error='Please enter end date';
		return error;
	}
	  if($("#limitAmount").val() < 500){
		   error="Limit Amount should be greater than 500";
		   
		   return error ; 
		  }
	/* else  if($("#emailId").val() != ""){
		   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		  //alert(reg.test($("#emailId").val())== false );
		   if (reg.test($("#emailId").val()) == false) 
           {
			   
			   error="Invalid EmailId";      
			return error;   
           }
 } */
	  if($("#nachMobile").val() != ""){
		   var regExp = /^(\([0-9]{3}\) |[0-9]{3})[0-9]{3}[0-9]{4}/;
		   
           if (regExp.test($("#nachMobile").val()) == false) 
           {
        	  error="Invalid Phone No.";      
   			return error;   
           }
 } 
	  if($("#nachIfsc").val() != ""){
   	var regExp = /^([0-9]|[a-z])+([0-9a-z]+)$/i;
   
           if (regExp.test($("#nachIfsc").val()) == false) 
           {
        	  
        	   error="Invalid IFSC.";      
      			return error; 
           }
  }
	 if($("#nachAccountNo").val() != ""){
		 
		 if( $("#nachAccountNo").val().length > 15 )
		   {
			  
			  error="Invalid Account Number";      
		return error;
	}
	 }
	 if($("#nachMicr").val() != ""){
		  var regExp = /^([0-9])+([0-9]+)$/i;
	
		          if (regExp.test($("#nachMicr").val()) == false) 
		          {
		        	  error="Invalid MICR";      
		    			return error;
		          }
		  }
	 if($("#startDate").datepicker('getDate') >  $("#endDate").datepicker('getDate')  ){
		 error="Start Date should be before End Date";      
			return error;
		  }
	else{
		
		return error;
	}
	
}

$(function() {
	 

	 $("#nachDialog").dialog(
	     {
	      autoOpen : false,
	      width:800,
	      show : {
	       effect : "blind",
	       duration : 200
	      },
	      hide : {
	       effect : "explode",
	       duration : 200
	      },
	      buttons : {
	       "Ok" : function() {
	        initiateNach();
	       },
	       "Cancel" : function() {
	    	   $(this).dialog("close");
		       }
	      }
	     }); 
});

function moveUser()
{
	funMoveUser($('#manageHeirarchySavePartnerForm #partyId').val(),$('#nodeId').val());	
}
	
$(function()
		{
			$("#nachDialogForMove").dialog(
		     {
		      autoOpen : false,
		      width:800,
		      show : {
		       effect : "blind",
		       duration : 200
		      },
		      hide : {
		       effect : "explode",
		       duration : 200
		      },
		      buttons : {
		       "Ok" : function() {
		
		    	   funMoveUser($('#manageHeirarchySavePartnerForm #partyId').val(),$('#nodeId').val());	   
		    	   $(this).dialog("close");
		       },
		       
		       "Cancel" : function() {
		    	   $(this).dialog("close");
			       }
		      }
		     }); 
	});	
	
function openNachDialog(){
	$("#nachDialog").dialog("open");
	
}
function initiateNach(){
	location.href="${pageContext.request.contextPath}/nach/initiateNACH.htm"
}

function openNachDialogForMove(){
	
	$("#nachDialogForMove").dialog("open");
	
	
}

 function initiateNach(){
	location.href="${pageContext.request.contextPath}/nach/initiateNACH.htm";
}


function funMoveUser(partyId,nodeId)
{
	alert(partyId);
	alert(nodeId);
	
	
 	 $.ajax({
			type : 'GET',
			url :  $('#contextPath').val() +"/heirarchy/updateCurrentNodeIdForPartyId.htm?partyId="+partyId+"&nodeId="+nodeId,
					success :function(result)
					{
			//			alert(result);
						
						var result=result;					
						if(result==1)
						{
						   	  bootbox.dialog({
									message: "<span class='bigger-110'>User Moved successfully.</span>",
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
							//showAlertMessage1("Success","<br/>User Moved successfully.",										"information",reloadPage);
	 					}else {
	 					   	  bootbox.dialog({
									message: "<span class='bigger-110'>Can not move use here because partner mapped.</span>",
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
	 						//showAlertMessage("Error","<br/> Error occured while Moving User. ", 'error', doNothing);
	 					}
					}
		});
} 

function  reportnote()
{
	//alert("Report Called");
	$("#reportnote").show();
	$("#popUpAlertaddnote").css ('margin-top','50px');
	$("#popUpAlertaddnote").css ('height','1000px');
	$("#popUpAlertaddnote").css ('width','860px');
}	
function printReceipt(paymentId){
	
	var data = $('#payOnlineFrm').serialize();
	$.ajax({
		type : "POST",
		dataType: 'json',
		 data : {'paymentId':paymentId,'partyId':70757,'ReportName':"paymentReceipt.rptdesign",'format':"pdf"},
		url : '${pageContext.request.contextPath}/pg/printReceipt',
		success : function(result) {
					
		}
		
	});

	
	
}

function showTransactionDiv(divId){
	showDiv(divId);
	$.ajax({
		type : "GET",
		url : '${pageContext.request.contextPath}/pg/showTransactions.htm',
		
		success : function(result) {
			
			bindTransactionDiv(result);
		}
	});
	
	
}

function bindTransactionDiv(data){
	
	var actions='<display:column sortable="true" title="Action"><span class="dropdown"> <a id="Action6"   class="dropdown-toggle" href="#" data-toggle="dropdown"'
        +  'style="text-decoration: none;">Action<span class="caret"></span></a>'
        +'<ul class="dropdown-menu" id="ActionMenu6" style="left:-96px !important;">'
        +'<li id="transactionDownload">'
        +'<a href="<%=request.getContextPath()%>/pg/printReceipt"><span class="user">'
        + 'Download </span></a></li>'
        +'<li id="transactionPrint">'
        +'<a onClick="printTransaction()" ><span class="user">'
        + 'Print</span></a></li>';
       
	var transactionRows=''
		for(var i=0;i<data.length;i++){
			
			transactionRows+='<tr><td>'+data[i]['orderNumber']+'</td><td>'+data[i]['orderDate']+'</td><td>'+data[i]['startDate']+'</td><td>'+data[i]['endDate']+'</td><td>'+data[i]['orderAmount']+'/-</td><td>'+data[i]['orderStatus']+'</td><td>'+data[i]['productDetails']+'</td></tr>';
		
		}
		
		$('#transactionTable tbody').html(transactionRows);
	
}

$( document ).ready(function() {
    var view= '<%=request.getParameter("view")%>';
   
    
    if(view=='subx'){
    	
    		$("#subscriptionLink").trigger("click");
    		//$("#subscriptionDiv input").removeAttr('disabled');
    		//$("#subscriptionDiv input").prop('disabled',false);
    		//$("#btnPayment").removeAttr('disabled');
    		//$('#btnPayment').attr('disabled',false);
    		$('#subscriptionDiv input').prop('disabled',false);
    		
    		//alert($('#subscriptionDiv input').prop("disabled"));	
    	
    }
    $('#subscriptionDiv input').prop('disabled',false);
});
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}


$( document ).ready(function() {
	showDiv('manageHierachyLinkDiv')
});


</script>
<div
  style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto;"
  id="popUpAlertaddnote" class="alert">
  <div class="close" style="margin-right: 10px;">
   <a onClick="popup('popUpAlertaddnote');resetVal();" href="#"><img alt="Close"
    src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
    
  </div>

  <div id="reportnote">
   <div id="popupwrapper_contactform">

    <div class="heading_contactform">
     <h3>Report</h3>
     <!-- <input type="button" onclick="printDiv('reportnote')" value="print a div!"  style="float: right;z-index: 999;"/> -->
     <a onClick="printDiv('reportview')" style="float: right;margin-top: 5px;margin-right: 20px;padding: 5px;background-color: #ae2760;border-radius: 5px;width: 80px;text-align: center;font-size: 13px;color: #fff;">Print</a>
    </div>
    <div id="downloadOptions" align="right">
   
     <!-- <br><br> -->
    
     <%-- <a class="pdficon" title="Download in Pdf" alt="Download in Pdf"href="#" onclick="downloadPartnersInTrialPeriod('pdf',${sessionScope.userSession.buId})"></a>
      <a class="excelicon" title="Download in Excel" alt="Download in Excel"href="#" onclick="downloadclientsummary('xls',${sessionScope.userSession.buId})"></a>
      <a class="docicon" title="Download in Doc" alt="Download in Doc" href="#" onclick="downloadclientsummary('doc',${sessionScope.userSession.buId})"></a> --%>
    </div>
    <div id="poptable_contactform" style="padding: 10px; height: 850px;width:800px;">

     <!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

     <div id="reportview"></div>
    </div>
   </div>
  </div>
 </div>

<!-- <div style="display: none;" id="blanket"></div> -->
<!-- <div style="display: none; width:644px; height:300px; overflow:auto;" id="popUpChangePassword" class="popUpQuery" > -->
<%-- <div class="close" style="margin-right:10px; margin-bottom:30px;"><a onClick="closeChangePasswordPopup()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div> --%>
<!-- -->
<div class="modal fade" id="popUpChangePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Change Password</h4>
      </div>
      <div class="modal-body">
<div class="row">
 <div class="list-group" id="changePasswordDetailsDiv" >
<!--  <a class="list-group-item active">Change Password</a> -->
 <form id="changePasswordForm">
			 <table class="table table-striped" cellpadding="5" cellspacing="5" id="change_password_div" style="width: 98%;margin-left: 10px;margin-top: 10px;">
                	<tr>
                    	<td width="22%" style="border-top: none !important;">Current Password <span class="red">*</span></td>
               	      <td width="78%" style="border-top: none !important;"><input  type="password" id="oldPassword" name="oldPassword" maxlength="15" style="width: 100%" validate="1" emsg="Current Password"/></td>
                </tr>
                <tr>
                    	<td width="22%" style="border-top: none !important;">New Password <span class="red">*</span></td>
               	  		<td width="78%" style="border-top: none !important;"><input  type="password" id="newPassword" name="newPassword" maxlength="15" style="width: 100%" validate="1" emsg="New Password"/></td>
                </tr>
                <tr>
                    <td width="25%" style="border-top: none !important;">Confirm Password <span class="red">*</span></td>
               	  	<td width="78%" style="border-top: none !important;"><input  type="password" id="confirmPassword" name="confirmPassword" maxlength="15" style="width: 100%" validate="1" emsg="Confirm Password"/></td>
                </tr>
                 <tr>
                      <td colspan="2" align="right" style="border-top: none !important;"> <input id="changePasswordButton" class="btn dbtn" type="button" value="Save" name="change_password_div" onclick="savePartnerProfile(name)">  <input id="save" class="btn dbtn" type="button" value="Cancel" name="change_password_div" onclick="closeChangePasswordPopup()"></td>
                    </tr>
              </table>
   </form>
	</div>
       </div>
</div>
</div></div></div>
<input  type="hidden" name="locationresult" id="locationresult" value="0" />
<input  type="hidden" name="nodeId" id="nodeId" value="0" />
<form id="personalInfo_1FormHidden" method="POST"  action="<%=request.getContextPath()%>/partner/savePartnerProfilePhoto.htm">
	<input  type="hidden"  id="contactEmailHidden" name="contactEmail"/>
	<input  type="hidden"  id="contactMobileHidden" name="contactMobile" />
	<input  type="hidden"  id="alternetMobileHidden" name="alternetcontact" />
	
	<input  type="hidden"   name="sectionName" value="PersonalInfo1" />
</form>
<form id="EmailOtherDetailsFormHidden" method="POST"  action="<%=request.getContextPath()%>/partner/savePartnerProfilePhoto.htm">
	<input  type="hidden"  id="smsSignatureHidden" name="smsSignature"/>
	<input  type="hidden"  id="themeHidden" name="theme" />
	<input  type="hidden"   name="sectionName" value="EmailOtherDetails" />
	<input type="hidden" id="themeNameHidden" name="themeName">
</form>
<form id="financialProductServicesForm" method="POST"  action="<%=request.getContextPath()%>/partner/savePartnerProfileFinancialProducts.htm">
	<input  type="hidden"  id="productXml" name="productXml" />
	<input  type="hidden"   name="sectionName" value="FinancialProduct" />
</form>
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
</body>
</html>