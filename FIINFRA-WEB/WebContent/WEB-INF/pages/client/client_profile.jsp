<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Client - Profile</title>

<style>
.checkbox { opacity: 1 !important; /* position: relative !important; */ width: auto !important; }
</style>

</head>
<body>

   
 
<div style="display: none; width:500px; height:400px; top:114px !important" id="popUpAlertaddnote" class="alert" >
  <div class="close" style="margin-right:10px;"><a onClick="$('#popUpAlertaddnote').hide();$('#blanket').hide()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
  <!--<div id="addnote">
    <div id="popupwrapper_contactform">
      <div class="heading_contactform">
        <h3> Add Note</h3>
      </div>
      <div id="poptable_contactform" style="padding:10px;">
        <textarea name="noteText" id="noteText" class="form-control" rows="13"></textarea>
        <input id="noteIdtemp" name="noteId" type="hidden">
      </div>
      <div class="topbuttonholder">
        <form>
          <input class="dbtn" value="Save" id="popupSavenoteBtn" type="button" title="Save Note" onclick="saveNote()" alt="Save Note">
          <input class="dbtn" value="Cancel" id="popupCancelnoteBtn" type="button" onClick="$('#popUpAlertaddnote').hide();$('#blanket').hide()" title="Cancel Note" alt="Cancel Note" >
        </form>
      </div>
    </div>
  </div>-->
  
  <!-- delete-->
  <div id="deletenote">
    <div id="popupwrapper_contactform">
      <div class="heading_contactform">
        <h3> Message</h3>
      </div>
      <div id="poptable_contactform" style="padding:10px;"> Do you want to delete this Note? </div>
      <div class="topbuttonholder">
        <form>
          <input class="dbtn" value="Yes" onclick="deleteNotes()" id="Yesbtn" type="button">
          <input class="dbtn" value="No" id="Nobtn" onClick="popup('popUpAlertaddnote')" type="button">
        </form>
      </div>
    </div>
  </div>
  
  <!--Edit --> 
  <!-- delete-->
  <div id="editnote">
    <div id="popupwrapper_contactform">
      <div class="heading_contactform">
        <h3> Edit Note</h3>
      </div>
      <div id="poptable_contactform" style="padding:10px;">
        <textarea class="form-control" rows="5">Evaluate every active client and opportunity against all available and active Tags that match this client and build up the matching tag list for each such record.</textarea>
      </div>
      <div class="topbuttonholder">
        <form>
          <input class="dbtn" value="Save" id="Save" type="button">
          <input class="dbtn" value="Cancel" id="Cancel" type="button">
        </form>
      </div>
    </div>
  </div>
</div>
<!--<div style="display: none; width:500px; height:400px; top:114px !important;z-index: 9999;background-color: #fff;padding: 20px;box-shadow: 0 0 10px 2px #535b68;border: 1px #fff solid;" id="addDocumentPopup" class="alert" >
  <div class="close" style="margin-right:10px;"><a onClick="$('#addDocumentPopup').hide();$('#blanket').hide()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
  <div id="addDocument">
    <div id="popupwrapper_contactform">
      <div class="page-header">
        <h3> Add Document</h3>
      </div>
      <div id="poptable_contactform" style="padding:10px;">
        <form enctype="multipart/form-data" method="post" id="addDocumentFormData" action="<%=request.getContextPath() %>/common/saveDocuments.htm">
          <input type="file" multiple name="documentFiles" id="documentFiles" style="display: none" onchange="showDocuments()">
          <input class="btn btn-primary btn-xs" type="button" value="Choose File" name="Choose File" onclick="documentFiles.click()">
          <div id="documentList" style="margin-top: 10px;height: 120px;overflow: auto;"> </div>
          <input type="hidden" id="documentPartyId" name="partyId">
        </form>
      </div>
      <div class="row pull-right">
      <div class="form-group col-md-12 clearfix">
        <form>
          <input class="btn-primary btn btn-xs" value="Save" id="popupSavenoteBtn" type="button" title="Save Note" onclick="saveDocument()" alt="Save">
          <input class="btn-primary btn btn-xs" value="Cancel" id="popupCancelnoteBtn" type="button" onClick="$('#addDocumentPopup').hide();$('#blanket').hide()" title="Cancel Note" alt="Cancel Note" >
        </form>
        </div>
      </div>
    </div>
  </div>
</div>-->
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />

<script src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<!-- Center part start -->
<!--css popup window start 2-->

	<!-- Add Note -->
     <div class="modal fade" id="addnote" aria-hidden="true">
  <div class="modal-dialog" id="popupwrapper_contactform">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add/Edit Note</h4>
      </div>
      <div class="modal-body" id="poptable_contactform">
       <textarea name="noteText" id="noteText" class="form-control" rows="13"></textarea>
        <input id="noteIdtemp" name="noteId" type="hidden">
      </div>
      <div class="modal-footer">
      <form>
        
        <button type="button" id="popupSavenoteBtn" class="btn btn-primary btn-xs" onclick="saveNote()">Save Note</button>
        <button type="button" class="btn btn-primary btn-xs" onclick="removeDocument()" id="popupCancelnoteBtn" data-dismiss="modal">Cancel Note</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
  
   <div class="modal fade" id="addDocumentPopup" aria-hidden="true">
  <div class="modal-dialog" id="addDocument">
    <div class="modal-content" id="popupwrapper_contactform">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"> Add Document</h4>
      </div>
      <div class="modal-body" id="poptable_contactform">
        <form enctype="multipart/form-data" method="post" id="addDocumentFormData" action="<%=request.getContextPath() %>/common/saveDocuments.htm">
          <input type="file" multiple name="documentFiles" id="documentFiles" style="display: none" onchange="showDocuments()">
          <!--<input class="btn btn-primary btn-xs" type="button" value="Choose File" name="Choose File" onclick="documentFiles.click()">-->
          <div id="documentList" style="margin-top: 10px;height: 120px;overflow: auto;"> </div>
          <input type="hidden" id="documentPartyId" name="partyId">
        </form>
      </div>
      <div class="modal-footer">
        
        <button type="button" id="popupSavenoteBtn" class="btn btn-primary btn-xs" onclick="saveDocument()">Save</button>
        <button type="button" class="btn btn-default btn-xs" id="popupCancelnoteBtn" data-dismiss="modal">Cancel</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>

<div class="">
  <div class="page-header">
	<h1>Profile<span id="profileNameId"></span></h1>
  </div>
 
  <div class="container-body">
    
    <!-- center -->
    
    <div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px;padding-left:10px;">
      <div class="list-group"><a class="list-group-item active" style="cursor: default;">Profile</a><a class="list-group-item profiledivlink" id="personalDetailsLink"  name="personalDetailsDiv1" onclick="showDiv('personalDetailsDiv1')" style="font-weight: bold">Personal Details</a><a class="list-group-item profiledivlink" id="contactDetailsLink" name="contactDetailsDiv" onclick="showDiv('contactDetailsDiv')" >Contact Details</a><a class="list-group-item profiledivlink" id="familyDetailsLink" name="familyDetailsDiv" onclick="showDiv('familyDetailsDiv')" >Family Details</a><a class="list-group-item profiledivlink" id="operationalDetailsLink" name="operationalDetailsDiv" onclick="showDiv('operationalDetailsDiv')" >Operational Details</a><a class="list-group-item profiledivlink" id="notesDetailsLink" name="notesDetailsDiv" onclick="showDiver('notesDetailsDiv')" >Notes</a><a class="list-group-item profiledivlink" id="documentDetailsLink" name="documentsDetailsDiv" onclick="showDiv('documentsDetailsDiv')" >Documents</a><a class="list-group-item profiledivlink" id="assumptionDetailsLink" name="assumptionsDetailsDiv" onclick="showDiv('assumptionsDetailsDiv')" >Assumptions</a><a class="list-group-item profiledivlink" id="healthHistoryDetailsLink" name="healthHistoryDetailsDiv" onclick="showDiv('healthHistoryDetailsDiv')" >Health History</a><a class="list-group-item profiledivlink" id="clientInterestedFPLink" name="clientInterestedFPDiv" onclick="showDiv('clientInterestedFPDiv')" >Interested FP</a></div>
    </div>
    <div class="col-md-9"  style="margin-top:10px; padding-left:10px;" >
      
      <!-- center -->
      
      <div class="list-group profiledivs" id="personalDetailsDiv1"><a class="list-group-item active" href="#">Personal Details</a>
        <div class="list-group-item">
          <div class="row">
            <div class="col-md-12 searchpadding padding_top" id="personalDetailsDiv"><a onClick="enableClientDiv(name);" name="personalDetailsDiv" id="personalDetailsEditLink" class="btn btn-xs btn-primary pull-right">
     <i class="ace-icon fa fa-pencil-square-o"></i>Edit
     </a>
     <div class="clearfix"></div>
              <form method="post"  id="PersonalDetailsForm">
                
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="firstName">First Name</label>		
                    <div class="col-sm-9">	
                    <input name="firstName" type="text" id="firstName"  class="input-xlarge" onkeyup="nospecialCharacters(id,event)" style="background:none;box-shadow:none;"/></div>
                  </div>
                  </div>
                   
                   <div class="row">
                   <div class="form-group col-md-12 clearfix">	
                     <label class="col-sm-3 control-label no-padding-right" for="lastName">Last Name<span class="red">*</span></label>
                    <div class="col-sm-9">	<input name="lastName" type="text" class="input-xlarge" id="lastName" onkeyup="nospecialCharacters(id,event)"  validate="1" emsg="Last Name" style="background:none;box-shadow:none;"/></div>
                  </div>
                  </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="salutationId">Title</label>
                    <div class="col-sm-9"><select  id="salutationId" name="salutationId" class="input-xlarge" style="box-shadow:none;">
                      </select></div>
                  </div>
                 </div>
                  
                 <div class="row">
                 <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="companyName">Company Name</label>
                   <div class="col-sm-9"><input name="companyName" type="text" id="companyName" class="input-xlarge" style="background:none;box-shadow:none;" /></div>
                  </div>
                 </div>
                  
                 <div class="row">
                 <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="designation">Designation</label>
                    <div class="col-sm-9"><input name="workDesignation" type="text" id="designation"  class="input-xlarge" style="background:none;box-shadow:none;" /></div>
                  </div>
                  </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="occupation">Occupation</label>
                    <div class="col-sm-9"><select name="workProfession" id="occupation" class="form-control input-xlarge" style="box-shadow:none;">
                      </select></div>
                  </div>
                   </div>
                   
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="panNo">PAN No</label>
                    <div class="col-sm-9"><input name="panNo" type="text" id="panNo" validate="pan" emsg="PAN No" class="input-xlarge" style="background:none;box-shadow:none;" /></div>
                  </div>
                  </div>
                  
                 <div class="row">
                 <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="dob">Date of Birth (Age)</label>
                    <div class="col-sm-9">
                    <input name="dob" type="text" id="dob" validate="date" emsg="Date Of Birth"  class="input-large" style="background:none;box-shadow:none;" onchange="ageCount(id);" />
                      <input name="age" type="text" id="AgeYrs" readonly  class="input-small" style="background:none;box-shadow:none;" /></td>
                     </div>
                  </div>
                  </div>
                  
                  <div class="row">
                 <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="anniversaryDate">Anniversary Date</label>
                    <div class="col-sm-9">
                    <input name="anniversaryDate" type="text" id="anniversaryDate" validate="date" emsg="Anniversary Date"  class="input-large" style="background:none;box-shadow:none;"/>
                     </div>
                  </div>
                  </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="martialStatusID">Martial Status</label>
                    <div class="col-sm-9"><select  id="martialStatusID" name="martialStatusID" class="input-xlarge" style="box-shadow:none;">
                      </select></div>
                 </div>
                 </div>
                 
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="genderID">Gender</label>
                    <div class="col-sm-9"><select  id="genderID" name="genderID" class="input-xlarge" style="box-shadow:none;">
                      </select></div>
                  </div>
                  </div>
                  
                 <div class="row pull-right">
                 <div class="form-group col-md-12 clearfix">	
                    <input id="cancel" class="btn-primary btn none hide" type="button" value="Save" name="personalDetailsDiv" onclick="saveClientProfile(name)">
                      <input id="save" class="btn-primary btn hide" type="button" value="Cancel" name="personalDetailsDiv" onclick="disableClientDiv(name)">
                  </div>    
                  </div>     
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Personal Details ends -->
      
      <!-- Contact Details starts -->
      
      <div class="list-group profiledivs" id="contactDetailsDiv" style="display: none"><a class="list-group-item active" href="#">Contact Details</a>
        <div class="list-group-item">
          <div class="row">
            <div class="col-md-12 searchpadding padding_top" id="contactDetails"><a onClick="enableClientDiv(name);" name="contactDetails" id="contactDetailsEditLink" class="btn btn-xs btn-primary pull-right">
     <i class="ace-icon fa fa-pencil-square-o"></i>Edit
     </a>
     <div class="clearfix"></div>
              <form method="post" id="contactDetailsForm">               
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="contactEmail">Email<span class="red">*</span></label>
                    <div class="col-sm-9"><input name="contactEmail" type="text" validate="email" emsg="Email" id="contactEmail" class="input-xlarge" style="border:none;background:none;box-shadow:none;" /></div>
                  </div>
                 </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="contactMobile">Mobile</label>
                    <div class="col-sm-9"><input name="contactMobile"   maxlength=15 type="text" id="contactMobile" class="input-xlarge Number1" style="border:none;background:none;box-shadow:none;" /></div>
                  </div>
                   </div>
                  
                  <div class="row">
                    <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="contactMobile2">Alternate Mobile</label>
                    <div class="col-sm-9"><input name="contactMobile2" maxlength=15 type="text" id="contactMobile2" class="input-xlarge Number1" style="background:none;box-shadow:none;"  /></div>
                 </div>
                  </div>
                 
                 <div class="row">
                  	<div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="street1">Address Line 1</label>
                    <div class="col-sm-9"><input name="street1" type="text" id="street1" class="input-xlarge" style="background:none;box-shadow:none;"  /></div>
                 </div>
                  </div>
                 
                 <div class="row">
                 <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="street2">Address Line 2</label>
                    <div class="col-sm-9"><input name="street2" type="text" id="street2" class="input-xlarge" style="background:none;box-shadow:none;"  /></div>
                  </div>
                   </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="street3">Address Line 3</label>
                    <div class="col-sm-9"><input name="street3" type="text" id="street3" class="input-xlarge" style="background:none;box-shadow:none;"  /></div>
                  </div>
                   </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="country">Country</label>
                    <div class="col-sm-9"><select id="country" name="country" class="input-xlarge" style="box-shadow:none;">
                      </select></div>
                  </div>
                   </div>
                  
                 <div class="row">
                 <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="state">State</label>
                    <div class="col-sm-9"><select id="state" name="state" onchange="retrieveCityList(event,'contactDetailsForm');" class="input-xlarge" style="box-shadow:none;" readonly="readonly">
                      </select></div>
                  </div>
                   </div>
                  
                 <div class="row">
                    <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="city">City</label>
                    <div class="col-sm-9"><input  type="text" id="city" class="input-xlarge" style="background:none;box-shadow:none;"  />
                      <input type="hidden" name="city" id="cityHidden"></div>
                 </div>
                  </div>
                 
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">	
                    <label class="col-sm-3 control-label no-padding-right" for="pinCode">Pin Code</label>                    
                    <div class="col-sm-9"><input name="postalCode" type="text" id="pinCode" class="input-xlarge" style="background:none;box-shadow:none;" /></div>
                 </div>
                  </div>
                 
                 <div class="row pull-right">
                    <input id="cancel" class="btn-primary btn hide" type="button" value="Save" name="contactDetails" onclick="saveClientProfile(name)">
                      <input id="save" class="btn-primary btn hide" type="button" value="Cancel" name="contactDetails" onclick="disableClientDiv(name)">
                  </div> 
                   <div class="space-8"></div>        
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Contact Details ends -->
      
      <!-- Family Details starts -->
      <div class="list-group profiledivs" id="familyDetailsDiv" style="display: none"><a class="list-group-item active" href="#">Family Details</a>
        <div class="list-group-item">
          <div class="row">
            <div class="col-md-12 searchpadding padding_top"><a onClick="enableClientDiv(name);" name="familyDetailsForm" id="familyDetailsEditLink" class="btn btn-xs btn-primary pull-right">
     <i class="ace-icon fa fa-pencil-square-o"></i>Edit
     </a>
     <div class="clearfix"></div>
     <br>
              <form method="post" id="familyDetailsForm">
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-header">
							<h5 class="widget-title">Your Immediate Family</h5>
						</div>
                  <div class="widget-body">
                  <div class="widget-main clearfix">                   
                    <div class="row">
					<div class="col-xs-12">
					<div class="table-responsive">
					<table id="immediateFamilyTable" class="table table-striped table-hover">
					<thead>
												<tr>													
													<th>Relationship</th>
													<th>First Name</th>
													<th>Last Name</th>
													<th>PAN No.</th>
													<th>Work Profession</th>
													<th>DOB</th>
													<th>Age</th>
												</tr>
											</thead>

											<tbody>
												<tr id="spouseRow">													
													<td>Spouse</td>
													<td><input style="background:none;box-shadow:none;width: 70% !important;" name="spouseName" class="form-control  pull-left" type="text" id="spouseName" onkeyup="nospecialCharacters(id,event)" value="" >
                          								<a class="choose2" href="#" id="lookup" onclick="showClientPopup(${sessionScope.userSession.partyId},'spouseName');">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td>
													<td><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="spouseLname" class="form-control  pull-left" type="text" id="spouseLname" value="" onkeyup="nospecialCharacters(id,event)"></td>
													<td ><input style="border:none;background:none;box-shadow:none;width: 90% !important;" validate="pan" emsg="PAN No" name="spousePAN" class="form-control  pull-left" type="text" id="spousePAN"  value=""></td>
                        <td><select style="border:none;box-shadow:none;width: 70% !important;" validate="workprofessionSpouse" emsg="PAN No" name="workprofessionSpouse" class="form-control  pull-left"  id="workprofessionSpouse">
                          </select></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 97% !important;" name="spouseDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('spouseDob','')" class="form-control  pull-left dob" type="text" id="spouseDob"  value=""></td>
                        <td ><input name="spouseAge" style="border:none;background:none;box-shadow:none;width:30px !important;" readonly class="form-control  pull-left" type="text" id="spouseAge"  value="" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td>
                        <td></td>
                        <input type="hidden" id="spousePartyId" value="0">
                        <input type="hidden" name="spouseSelectedFromContact" id="spouseSelectedFromContact" value="false">
                        
												</tr>

											</tbody>
										</table>
										</div>
									</div><!-- /.span -->
								</div>
                  </div>
                  </div>
                </div>
                <!-- end-->
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-header">
							<h5 class="widget-title">Parents, In-laws and Siblings</h5>
						</div>
                 <div class="widget-body">
                  <div class="widget-main clearfix">
                    <div class="row">
					<div class="col-xs-12">
					<div class="table-responsive">
					<table id="extendedFamilyTable" class="table table-striped table-hover">
					<thead>
                      <tr>
                        <th>Relationship</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>PAN No.</th>
                        <th>Work Profession.</th>
                        <th>DOB</th>
                        <th>Age</th>                                              
                      </tr>
                      </thead>
                      <tr>
                        <td >Mother</td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 70% !important;" name="motherName" class="form-control  pull-left" type="text" id="motherName" onkeyup="nospecialCharacters(id,event)" value="" >
                          <a class="choose2" href="#" id="lookupmother" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="motherLname" class="form-control  pull-left" type="text" id="motherLname" onkeyup="nospecialCharacters(id,event)" value="" ></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 90% !important;" validate="pan" emsg="PAN No" name="motherPAN" class="form-control  pull-left" type="text" id="motherPAN"  value="" validate="pan" emsg="PAN No"></td>
                        <td ><select style="border:none;box-shadow:none;width: 70% !important;" validate="workprofessionMother" emsg="PAN No" name="workprofessionMother" class="form-control  pull-left"  id="workprofessionMother">
                          </select></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 97% !important;"  name="motherDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('motherDob','')" class="form-control  pull-left dob" type="text" id="motherDob"  value=""></td>
                        <td ><input  style="border:none;background:none;box-shadow:none;width: 30px !important;"  name="motherAge" readonly class="form-control  pull-left" type="text" id="motherAge"  value="" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td>
                        <td></td>
                        <input type="hidden" id="motherPartyId" value="0">
                        <input type="hidden" name="motherSelectedFromContact" id="motherSelectedFromContact" value="false">
                      </tr>
                      <tr>
                        <td >Father</td>
                        <td><input  style="border:none;background:none;box-shadow:none;width: 70% !important;"  name="fatherName" class="form-control  pull-left" type="text" id="fatherName" onkeyup="nospecialCharacters(id,event)" value="" >
                          <a class="choose2" href="#" id="father" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="fatherLname" class="form-control  pull-left" type="text" id="fatherLname"  value="" onkeyup="nospecialCharacters(id,event)"></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 90% !important;" validate="pan" emsg="PAN No" name="fatherPAN" class="form-control  pull-left" type="text" id="fatherPAN" value="" validate="pan" emsg="PAN No"></td>
                        <td ><select style="border:none;box-shadow:none;width: 70% !important;" validate="workprofessionFather" emsg="PAN No" name="workprofessionFather" class="form-control  pull-left"  id="workprofessionFather">
                          </select></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width:97% !important;"  name="fatherDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('fatherDob','')" class="form-control  pull-left dob" type="text" id="fatherDob"  value=""  ></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 30px !important;"  name="fatherAge" readonly class="form-control  pull-left" type="text" id="fatherAge"  value="" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                        <td></td>
                        <input type="hidden" id="fatherPartyId" value="0">
                        <input type="hidden" name="fatherSelectedFromContact" id="fatherSelectedFromContact" value="false">
                      </tr>
                      <tr>
                        <td >Mother in law</td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 70% !important;"  name="motherInLawName" class="form-control  pull-left" type="text" id="motherInLawName" value="" onkeyup="nospecialCharacters(id,event)">
                          <a class="choose2" href="#" id="motherInLaw" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="motherInLawLname" class="form-control  pull-left" type="text" id="motherInLawLname"  value="" onkeyup="nospecialCharacters(id,event)" ></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 90% !important;" validate="pan" emsg="PAN No" name="motherInLawPAN" class="form-control  pull-left" type="text" id="motherInLawPAN"  value="" validate="pan" emsg="PAN No"></td>
                        <td ><select style="border:none;box-shadow:none;width: 70% !important;" validate="workprofessionMotherInLow" emsg="PAN No" name="workprofessionMotherInLow" class="form-control  pull-left"  id="workprofessionMotherInLow">
                          </select></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width:97% !important;"  name="motherInLawDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('motherInLawDob','')" class="form-control  pull-left dob" type="text" id="motherInLawDob"  value=""  ></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 30px !important;"  name="motherInLawAge" readonly class="form-control  pull-left" type="text" id="motherInLawAge"  value="" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                        <td></td>
                        <input type="hidden" id="motherInLawPartyId" value="0">
                        <input type="hidden" name="motherInLawSelectedFromContact" id="motherInLawSelectedFromContact" value="false">
                      </tr>
                      <tr id="fatherInLawRow">
                        <td >Father in law</td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 70% !important;"  name="fatherInLawName" class="form-control  pull-left" type="text" id="fatherInLawName" value="" onkeyup="nospecialCharacters(id,event)">
                          <a class="choose2" href="#" id="fatherInLaw" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="fatherInLawLname" class="form-control  pull-left" type="text" id="fatherInLawLname"  value="" onkeyup="nospecialCharacters(id,event)"></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 90% !important;" validate="pan" emsg="PAN No" name="fatherInLawPAN" class="form-control  pull-left" type="text" id="fatherInLawPAN" value="" validate="pan" emsg="PAN No" ></td>
                        <td ><select style="border:none;box-shadow:none;width: 70% !important;" validate="workprofessionFatherInLow" emsg="PAN No" name="workprofessionFatherInLow" class="form-control  pull-left"  id="workprofessionFatherInLow">
                          </select></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width:97% !important;"  name="fatherInLawDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('fatherInLawDob','')" class="form-control  pull-left dob" type="text" id="fatherInLawDob"  value=""  ></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 30px !important;"  name="fatherInLawAge" readonly class="form-control  pull-left" type="text" id="fatherInLawAge"  value="" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/>
                        <td></td>
                        <input type="hidden" id="fatherInLawPartyId" value="0">
                        <input type="hidden" name="fatherInlowSelectedFromContact" id="fatherInlowSelectedFromContact" value="false">
                          </td>
                      </tr>
                      <tr id="HUFRow">
                        <td >HUF</td>
                        <td width="15%"><input style="border:none;background:none;box-shadow:none;width: 70% !important;" name="HUFName" class="form-control  pull-left" type="text" id="HUFName" value="" onkeyup="nospecialCharacters(id,event)">
                          <a class="choose2" href="#" id="huf" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="HUFLname" class="form-control  pull-left" type="text" id="HUFLname" value="" onkeyup="nospecialCharacters(id,event)"></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 90% !important;" validate="pan" emsg="PAN No" name="HUFPAN" class="form-control  pull-left" type="text" id="HUFPAN"  value="" validate="pan" emsg="PAN No" ></td>
                        <td ><select style="border:none;box-shadow:none;width: 70% !important;" validate="workprofessionHuf" emsg="PAN No" name="workprofessionHuf" class="form-control  pull-left"  id="workprofessionHuf">
                          </select></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width:97% !important;" name="HUFDob" validate="date" emsg="DOB" onchange="setAgeFromDOB('HUFDob','')" class="form-control  pull-left dob" type="text" id="HUFDob"  value=""  ></td>
                        <td ><input style="border:none;background:none;box-shadow:none;width: 30px !important;" name="HUFAge" readonly class="form-control  pull-left" type="text" id="HUFAge"  value="" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td>
                        <input type="hidden" id="HUFPartyId" value="0">
                        <input type="hidden" name="hufSelectedFromContact" id="hufSelectedFromContact" value="false">
                        <td></td>
                      </tr>
                      </table>
                      </div>
                    </div>
                    </div>
                   <div class="row pull-right">
          				  <div class="form-group col-md-12 clearfix">	                      
                        <input id="cancel" class="btn btn-primary none hide" type="button" value="Save" name="familyDetailsForm" onclick="saveClientProfile(name)">
                          <input id="save" class="btn btn-primary none hide" type="button" value="Cancel" name="familyDetailsForm" onclick="disableClientDiv(name)">                     
                    </div>
                    </div>
                  </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Family Details ends -->
      
      <!-- Operational Details starts -->
      <div class="list-group profiledivs" id="operationalDetailsDiv" style="display: none"><a class="list-group-item active" href="#">Operational Details</a>
        <div class="list-group-item">
          <div class="row">
            <div class="col-md-12 searchpadding padding_top"><a onClick="enableClientDiv(name);" name="operationalDetailsForm" id="operationalDetailsEditLink" class="btn btn-xs btn-primary pull-right">
     <i class="ace-icon fa fa-pencil-square-o"></i>Edit
     </a>
     <div class="clearfix"></div>
              <form method="post" id="operationalDetailsForm">
                <input type="hidden" id="offeringsXML" name="offeringsXML">
                                
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="clientCategory">Client Category</label>
            <div class="col-sm-9"><select name="clientCategory" id="clientCategory" style="box-shadow:none;" class="input-xlarge">
                      </select></div>
                 </div>
                 </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="offerings">Interested in Offerings</label>
                    <div class="col-sm-9"><ul class="nav  nav-stacked" id="offerings">
                      </ul></div>
                  </div>
                  </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="clientActivated">Client Portal Activated?</label>
                    <div class="col-sm-9"><input  type="text" id="clientActivated" style="background:none;box-shadow:none;"  readonly="readonly" class="input-xlarge"/></div>
                 </div>
                 </div>
                 
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="memberShipStartDate">Membership start date</label>
                    <div class="col-sm-9"><input  type="text" id="memberShipStartDate" style="background:none;box-shadow:none;" class="input-xlarge"  readonly="readonly"/></div>
                  </div>
                  </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="memberShipEndDate">Membership end date</label>
                    <div class="col-sm-9"><input  type="text" id="memberShipEndDate" class="input-xlarge" style=";background:none;box-shadow:none;"  readonly="readonly"/></div>
                  </div>
                  </div>
                  
                 <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="nextRenewalDate">Next Renewal Due On</label>
                    <div class="col-sm-9"><input  type="text" id="nextRenewalDate" class="input-xlarge" style="background:none;box-shadow:none;"  readonly="readonly"/></div>
                  </div>
                  </div>
                  
                  <div class="row">
                  <div class="form-group col-md-12 clearfix">
                    <label class="col-sm-3 control-label no-padding-right" for="lastRenewedOn">Last Renewed On</label>
                    <div class="col-sm-9"><input  type="text" id="lastRenewedOn" class="input-xlarge" style="background:none;box-shadow:none;"  readonly="readonly"/></div>
                 </div>
                 </div>
                 
                  <div class="row pull-right">
                  <div class="form-group col-md-12 clearfix">
                    <input id="cancel" class="btn-primary btn none hide" type="button" value="Save" name="operationalDetailsForm" onclick="saveClientProfile(name)">
                      <input id="save" class="btn-primary btn none hide" type="button" value="Cancel" name="operationalDetailsForm" onclick="disableClientDiv(name)">
                  </div>
                  </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Operational Details ends -->
      
      <!-- Notes Details starts -->
      <div class="list-group profiledivs" id="notesDetailsDiv" style="display: none"><a class="list-group-item active" href="#">Notes Details</a>
        <div class="list-group-item">
        <div class="row ">
        <div class="form-group col-md-12 clearfix">
          <div class="topmenu text-right" style="margin-top:0px"><a href="#" id="addNotesLink">
            <button class="btn-primary btn btn-xs createNewBtn" id="noteadd" title="New Note" alt="New Note" onClick="addNote();" data-toggle="modal" data-target="#addnote"><i class="fa fa-check"></i> Add</button>
            </a><a href="#" onClick="deleteNotes();" id="deleteNotesLink">
            <button type="button" class="btn-primary btn btn-xs deleteBtn" id="deletenotebtn"  title="Delete Note" alt="Delete Note"><i class="fa fa-trash-o"></i> Delete</button>
            </a></div>
            </div>
            </div>
          <div class="row">
            <div class="table-responsive" id="display_table_lead" style="border:none;">
              <div id="toreload">
                <form method="post" id="notesDetailsForm">
                  <table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="notesDetails">
                    <thead>
                      <tr>
                        <th width="4%" class="thead">&nbsp;</th>
                        <th width="4%" class="thead"><input onchange="togleNoteSelect()" id="0" type="checkbox"></th>
                        <th width="65%"  class="thead"><a href="#">Note Text</a></th>
                        <th width="13%"  class="thead"><a href="#">Created By</a></th>
                        <th width="14%" class="thead"><a href="#">Date</a></th>
                      </tr>
                    </thead>                  
                  </table>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Notes Details ends -->
      
      <!-- Documents Details starts -->
      <form id="documentUploadForm" method="post"  action="<%=request.getContextPath() %>/opportunity/saveDocument.htm"
							enctype="multipart/form-data" name="bulk_document_form" >
      <div class="list-group profiledivs" id="documentsDetailsDiv" style="display: none">
      <a class="list-group-item active" href="#">Documents Details</a>
      <div class="list-group-item">
      <div class="row">
        <div class="form-group col-md-12 clearfix">
      <div class="topmenu text-right" style="margin-top:0px">
      <a href="#"   id="addDocumentLink">
        <button type="button" class="btn-primary btn btn-xs createNewBtn" id="documentaddBtn" title="New Attachment" alt="New Attachment" name="Choose File" data-toggle="modal" data-target="#addDocumentPopup" onclick="openAddDocumentPopup()"><i class="fa fa-check"></i> Add</button>
       <span id="documentAttachment1name"></span>
        <input type="file" name="documentAttachment" id="documentAttachment1" style="display: none;">
        </a>        
        <a onClick="deleteDocument();"  id="deleteDocumentLink">
        <button data-params="{}" type="button" class="btn-primary btn btn-xs deleteBtn" onClick="deleteDocuments()" title="Delete" alt="Delete Opportunities"><i class="fa fa-trash-o"></i> Delete</button>
        </a>
        </div>
        </div>
        </div>
      <div class="row">
      <div class="table-responsive" id="display_table_lead" style="border:none;">
      <div id="toreload">
      <form method="post" id="documentsDetailsForm">
        <table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="documentsDetails">
          <thead>
            <tr>
              <th class="thead"><input onchange="togleDocumentSelect()" id="0" type="checkbox"></th>
              <th class="thead"><a href="#">File Name</a></th>
              <th class="thead"><a href="#">Document Name</a></th>
              <th class="thead"><a href="#">Created By</a></th>
              <th class="thead"><a href="#">Date</a></th>
            </tr>
          </thead>   
        </table>
      </form>
    </div>
  </div>
</div>
</div>
</div>
</form>
<!-- Documents Details ends -->

<!-- Assumptions Details starts -->
<div class="list-group profiledivs" id="assumptionsDetailsDiv" style="display: none"><a class="list-group-item active" href="#">Assumptions Details</a>
  <div class="list-group-item">
    <div class="row">
      <div class="col-md-12 searchpadding padding_top"><span style="float:right;">
        </span>
        <div class="clearfix"></div>
        <form method="post" id="assumptionsDetailsForm">          
            <div class="row pull-right">
                <div class="form-group col-md-12 clearfix">	
              <c:choose>
                  <c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
                    <input id="cancel" class="btn btn-xs btn-primary" type="button" value="Save" name="assumptionsDetails" onclick="saveClientProfile(name)">
                  </c:when>
                </c:choose>
                <input id="save" class="btn btn-primary btn-xs" type="button" value="Cancel" name="assumptionsDetails" onclick="disableClientDiv(name)">
                <div class="visible-xs northspace1"></div>
                <input id="cancel" class="btn btn-primary btn-xs" type="button" title="Set Default" value="Set Default" onclick="confirmSetDefault()" >
            </div>
            </div>
            <div class="clearfix"></div>
            <div class="clearfix"></div>
          <div id="assumptionsDetails">
          
            <div id="lastRow">
            <div class="row pull-right">
                <div class="form-group col-md-12 clearfix">	
              <c:choose>
                  <c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
                    <input id="editAssumptionLink" class="btn btn-primary btn-xs" type="button" value="Save" name="assumptionsDetails" onclick="saveClientProfile(name)">
                  </c:when>
                </c:choose>
                <input  class="btn btn-primary btn-xs" type="button" value="Cancel" name="assumptionsDetails" onclick="disableClientDiv(name)">
                <div class="visible-xs northspace1"></div>
                <input id="cancel" class="btn btn-primary btn-xs" type="button" title="Set Default" value="Set Default" onclick="confirmSetDefault()" >
            </div>
          </div>
          </div>
          </div>
        </form>
        <form id="assumptionXMLFORM">
          <input type="hidden" name="dataXML" id="assumptionDataXML">
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Assumptions Details ends -->

<!-- Health History Details Starts -->
<div class="list-group profiledivs" id="healthHistoryDetailsDiv" style="display: none"><a class="list-group-item active" href="#">Health History Details</a>
  <div class="list-group-item">
    <div class="row">
      <div class="col-md-12 searchpadding padding_top"><a onClick="enableClientDiv(name);" name="healthHistoryDetails" id="healthHistoryDetailsEditLink" class="btn btn-xs btn-primary pull-right">
     <i class="ace-icon fa fa-pencil-square-o"></i>Edit
     </a>
     <div class="clearfix"></div>
        <form method="post" id="healthHistoryDetailsForm">
        <div id="healthHistoryDetails">
          <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91053">Smoke</label>
              <div class="col-sm-9"><select id="91053" name="healthoption" class="form-control input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91054">Alcohol</label>
              <div class="col-sm-9"><select id="91054" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
           </div>
           </div>
           
            <div class="row">
               <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91055">Diabetes</label>
              <div class="col-sm-9"><select id="91055" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
           </div>
           </div>
           
           <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91056">Hypertension/High Blood Pressure</label>
              <div class="col-sm-9"><select id="91056" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
                        
            <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91057">Respiratory Disorder</label>
              <div class="col-sm-9"><select id="91057" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
            
           <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91058">HIV/AIDS/STD</label>
              <div class="col-sm-9"><select id="91058" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91059">Liver problem</label>
              <div class="col-sm-9"><select id="91059" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
            
           <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91060">Cancer/Tumor</label>
              <div class="col-sm-9"><select id="91060" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91061">Heart problem</label>
              <div class="col-sm-9"><select id="91061" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
           </div>
           </div>
           
            <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91062">Arthritis/Joint Pain</label>
              <div class="col-sm-9"><select id="91062" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
           </div>
           </div>
           
           <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91063">Kidney Problem</label>
              <div class="col-sm-9"><select id="91063" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
            
           <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91064">Paralysis/Stroke</label>
              <div class="col-sm-9"><select id="91064" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
           </div>
           </div>
           
            <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91065">Congenital problem</label>
              <div class="col-sm-9"><select id="91065" name="healthoption" class="input-xlarge"  style="background:none;box-shadow:none;">
                </select></div>
            </div>
            </div>
            
           <div class="row">
                <div class="form-group col-md-12 clearfix">	
              <label class="col-sm-3 control-label no-padding-right" for="91066">Others</label>
              <div class="col-sm-9"><input name="healthoption" type="text" class="input-xlarge" id="91066" style="background:none;box-shadow:none;" value=" " /></div>
            </div>
            </div>
            
            <div class="row pull-right">
                <div class="form-group col-md-12 clearfix">	
              <input id="cancel" class="btn btn-primary none hide" type="button" value="Save" name="healthHistoryDetails" onclick="saveClientProfile(name)">
                <input id="save" class="btn btn-primary none hide" type="button" value="Cancel" name="healthHistoryDetails" onclick="disableClientDiv(name)">
            </div>
            </div> 
            </div> 
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Health History Details ends -->

<!-- Interested Details starts -->
<div class="list-group profiledivs" id="clientInterestedFPDiv" style="display: none">
	<a class="list-group-item active" href="#">Interested FP Sections</a>
  	<div class="list-group-item">
    <div class="row">
      <div class="col-md-12 searchpadding padding_top" id="interestedFPDetails">
      <a onClick="enableClientDiv(name);" name="interestedFPDetails" id="clientInterestedFPEditLink" class="btn btn-xs btn-primary pull-right">
     	<i class="ace-icon fa fa-pencil-square-o"></i>Edit
      </a>
      <div class="clearfix"></div>
        <form method="post" id="interestFPForm">          
            <input type="hidden" id="interestedFpXML" name="interestedFpXML">
            <div class="row">
               <div class="col-md-12" id="interestedFPs" >
               </div>
            </div>
         
			<div class="topmenu pull-right">
			    <button class="btn-primary btn-xs btn hide" type="button" id="cancel" name="interestedFPDetails" onclick="saveClientProfile(name)">Save</button>
			    <button class="btn btn-xs btn-primary hide" type="button" id="save" name="interestedFPDetails" onclick="disableClientDiv(name)">Cancel</button>
			</div>
         
        </form>
      </div>
    </div>
 	</div>
</div>
<!-- Interested Details ends -->
</div>
</div>
</div>
<!-- Center part End -->
<form id="familyMemberDetailsForm">
  <input type="hidden" id="familyMemberXML" name="familyMemberXML"/>
</form>
<form id="healthHistoryForm">
  <input type="hidden" id="healthXML" name="healthXML"/>
</form>
<jsp:include page="../common/footer.jsp" />
<script>

var isDocumentSelected=0;
var isChecked=true;
var list;
var  noteId;
var  docId;
var isCheckedDoc=true;
var workProfessionSelect;
function confirmSetDefault(){
  	var innerHTML="All Advice Assumptions values will be set to";
  	innerHTML=innerHTML+" default.";
  	innerHTML=innerHTML+" Are you sure you want to continue ?";
	showAlertMessage("Message", "<br/>" + innerHTML, "question",
			doNothing1);
	$('.ZebraDialog_Button1').attr('href','javascript:setDefault()');
	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}

function setDefault(){
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/partner/setDefault?partyId='+$('#partyIdFromRequest').val(),
		success : function(result) {
			if(result=="success"){
				localStorage.setItem('dataRestored','true');
				reloadPage();
				
			}					
		}
	});
}
function togleNoteSelect(){
	if(isChecked==true){
		isChecked=false;
		$('input[name="note"]').attr('checked','checked');
	}else{
		isChecked=true;
		$('input[name="note"]').removeAttr('checked');
	}
}

function showDocuments(){
	$('#documentList').empty();
	    for (var i = 0; i < $('#documentFiles').get(0).files.length; ++i) {
	    	$('#documentList').append($('#documentFiles').get(0).files[i].name+'<br/>');
// 	    	isDocumentSelected=1;
			var documentName = $('#documentFiles').get(0).files[i].name;
	    	
	    	var regex = new RegExp("(.*?)\.(exe|jar|dll|apk|bat|bin|cmd|com|cpl|gadget|ins|inx|isu|job|jse|lnk|msc|msi|msp|mst|paf|pif|ps1|reg|rgs|sct|shb|shs|u3p|vb|vbe|vbs|vbscript|ws|wsf)$");	    	
	    	if(!(regex.test(documentName))) {
	    		isDocumentSelected=1;
	    	}else{	    		   
	    		showAlertMessage1("Error",
						"Executable Files not allowed.",
						"error", doNothing);
				$('.ZebraDialog').css('z-index','9999999999999999');
	    		isDocumentSelected=0;
	    	}
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


function addNote(){
	/*$("#addDocument").show();	
	$("#deletenote, #editnote").hide();	
	$('#popUpAlertaddnote').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width);
	$('#popUpAlertaddnote').css('position','fixed');*/
	
	$('#noteText').val('');
	$('#noteIdtemp').val(0);
	removeCssStyles('noteText');
}

function openAddDocumentPopup(){
	removeDocument();	
	/*$("#addnote").show();	
	$("#deletenote, #editnote").hide();	
	$('#addDocumentPopup').show();
	$('#blanket').show();*/
	$("#documentList").html("");
	/*var height = ($(window).height() / 2) - (parseInt($('#addDocumentPopup').css('height'))/2);
	$('#addDocumentPopup').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#addDocumentPopup').css('width'))/2);
	$('#addDocumentPopup').css('margin-left', width);
	$('#addDocumentPopup').css('position','fixed');*/
	$('#documentFiles').val('');
}

function deleteNote(){
	$("#deletenote").show();	
	$("#addnote, #editnote").hide();	
}
	
function editNote(noteIdTemp){
	//$("#deletenote, #editnote").hide();	
	noteId = noteIdTemp;
	/*$('#popUpAlertaddnote').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width);
	$('#popUpAlertaddnote').css('position','fixed');*/
	$('#noteText').val($('#notetext'+noteId).html())
	$('#noteIdtemp').val(noteId);
}





function saveNote(){	
	var partyIdnew=$('#partyIdFromRequest').val();		
		var isValidated=true;
		if($('#noteText').val()==''){
			addCssStyles('noteText','Please enter Note Text.');
			isValidated=false;
		}else{
				removeCssStyles('noteText');
		}
		if(isValidated==true){
				var noteT= $('#noteText').val();				
				$.ajax({
					type : "POST",
					url : $('#contextPath').val()+"/opportunity/saveNote.htm?notetext="+noteT+"&partyId="+partyIdnew+'&noteId='+$('#noteIdtemp').val(),
					
					//data:$('#notesDetails').serialize(),
// 					data:$('#saveNoteForm').serialize(),					
					success : function(result) {
						//alert(result);
						if(result>0){
							$('#addnote').modal('hide');
// 							$("#popUpAlertaddnote").hide();			
//  							localStorage.setItem('actionName',$('#contextPath').val()+'/opportunity/getNotesList.htm');
							showAlertMessage("Success",
									"<br/>Note saved successfully.",
									"confirmation",reloadNotes() );
							
// 							reloadPage
							$('.ZebraDialog').css('z-index','9999999999999999');
						}else{
							showAlertMessage1("Error",
									"The connection to the server has been lost. Please try again later.",
									"error", doNothing);
							$('.ZebraDialog').css('z-index','9999999999999999');
						}						
					}
				});
		}	
}

function reloadDocuments(){
	var partyIdDocuments=$('#partyIdFromRequest').val();
// 	alert(partyIdNote);
	$('#documentsDetails').empty();
	$('#documentsDetails').append('<thead><tr><th class="thead"><input onchange="togleDocumentSelect()" id="0" type="checkbox"></th><th class="thead"><a href="#">File Name</a></th><th class="thead"><a href="#">Document Name</a></th><th class="thead"><a href="#">Created By</a></th><th class="thead"><a href="#">Date</a></th></tr></thead>');
	 
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/common/getReloadDocumentsList.htm?partyId=" + partyIdDocuments,
		success : function(result) {
// 			alert(result);
			$(result).each(function(i,obj) {
				$('#documentsDetails')
				.append(
						'<tr id="documentsDetails'
								+ i
								+ '"></tr>');
				$('#documentsDetails' + i)
				.append(
						'<td><span class="thead"><input id='+"documnet"+obj.documentId+' name="document" type="checkbox"></span>&nbsp;&nbsp;</td>');
				
				$('#documentsDetails' + i)
				.append(
						'<td><a onclick="downloadAttachment('+obj.documentId+')">'+obj.fileName+'</a></td>');
				
				$('#documentsDetails' + i)
				.append(
						'<td> '
								+ obj.documentName
								+ '</td>');
				$('#documentsDetails' + i)
				.append(
						'<td> '
								+ obj.createdByName
								+ '</td>');
				
				$('#documentsDetails' + i)
				.append(
						'<td> '
								+ obj.createdDate
								+ '</td>');		
			});
			
		}
	});
	
}


function reloadNotes(){
	var partyIdNote=$('#partyIdFromRequest').val();
// 	alert(partyIdNote);
	$('#notesDetails').empty();
	$('#notesDetails').append('<thead><tr><th width="4%" class="thead">&nbsp;</th><th width="4%" class="thead"><input onchange="togleNoteSelect()" id="0" type="checkbox"></th><th width="65%"  class="thead"><a href="#">Note Text</a></th><th width="13%"  class="thead"> <a href="#">Created By</a></th><th width="14%" class="thead"><a href="#">Date </a></th></tr></thead>');
	
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/common/getReloadNotesList.htm?partyId=" + partyIdNote,
		success : function(result) {
// 			alert(result);
			$(result).each(function(i,obj) {
				$('#notesDetails')
				.append(
						'<tr id="notesDetails'
								+ i
								+ '"></tr>');
				$('#notesDetails' + i)
				.append(
						'<td><a id="editNotesLink" onclick="editNote('+obj.notesId+')" data-toggle="modal" data-target="#addnote"><img src="/FIINFRA-WEB/images/edit.png" alt="Edit" title="Edit"></a>&nbsp;&nbsp;</td>');
				$('#notesDetails' + i)
				.append(
						'<td><input id='+"note"+obj.notesId+' name="note" type="checkbox" enabled=""></td>');
				$('#notesDetails' + i)
				.append(
						'<td> '
								+ obj.notesText
								+ '</td>');
				$('#notesDetails' + i)
				.append(
						'<td> '
								+ obj.recordedBy
								+ '</td>');
				$('#notesDetails' + i)
				.append(
						'<td> '
								+ obj.updatedOn
								+ '</td>');
				
		
			});
			
		}
	});
	
}


function removeDocument(){
    $(".ace-file-input .remove").click();
}

function saveDocument(){
	if(isDocumentSelected==1){
	var partyIdnew=$('#partyIdFromRequest').val();
	openPopupWebApp('centerLoadingImage', 25, 35);
	$('#documentPartyId').val(partyIdnew);
	 $('#addDocumentFormData').ajaxForm({
         success: function(msg) {
         	var result=msg;
         	if(result=='success'){
         		$("#addDocumentPopup").hide();	
         		closePopupWebApp('');
//				localStorage.setItem('actionName',$('#contextPath').val()+'/opportunity/getNotesList.htm');
			showAlertMessage("Success",
					"<br/>Document saved successfully.",
					"confirmation",reloadDocuments());
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
		$("#addDocumentPopup").hide();
		showAlertMessage1("Error",
				"<br/>Please select document first.",
				"error", doNothing);
		$('.ZebraDialog').css('z-index','9999999999999999');
	}
}
function deleteNotes() {
// 	$("#popUpAlertaddnote").hide();	
	list = new Array();
	var id='';
	$('#notesDetails :checked').each(function(i, obj) {
		if($(this).attr('id')!=0){
			id=$(this).attr('id');
			list[i] = id.substring(id.indexOf('note')+4);
		}
		
	});
	if (list.length == 0) {
		showAlertMessage1("Message",
				"Please select at least one Note to delete.",
				"information", doNothing);
		$('.ZebraDialog').css('z-index','9999999999999999');
	} else{
		var message = "";
		if (list.length == 1) {
			message = "Do you want to delete this Note?";
		} else {
			message = "Do you want to delete these Notes?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog').css('z-index','9999999999999999');
		$('.ZebraDialog_Button1').attr('href','javascript:deleteNotesTrue()');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	}
}	

function deleteNotesTrue() {
	var message = "";
	if (list.length == 1) {
		message = "Note successfully deleted.";
	} else {
		message = "Notes successfully deleted.";
	}

	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+"/opportunity/deleteNote.htm?noteIds=" + list,
			success : function(result) {
				if(result=='success'){
					localStorage.setItem('actionName',
							window.location.pathname+'?partyId='+$('#partyIdFromRequest').val());
					showAlertMessage1("Success",
							'<br/>' + message,
							"confirmation", reloadNotes());
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
function deleteDocument() {
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
							"confirmation", reloadDocuments());
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



function addNotePop(){
	$("#addnote1").show();	
	$("#deletenote, #editnote").hide();	
}

function deleteNote(){
	$("#deletenote").show();	
	$("#addnote1, #editnote").hide();	
}
	


var cityId=0;
var isEditFamilyMember=0;
var assumptionList;
$("#contactDetails #city").change(function() {
	cityId=0;
});

function enableTf(){
$('#fname, #lname, #title, #compantname, #designation, #occupation, #location, #age, #age2, #maritals, #gender, #panno').css('background-color','rgb(255, 255, 255)');
$('#fname, #lname, #title, #compantname, #designation, #occupation, #location, #age, #age2, #maritals, #gender, #panno').css('border','1px solid rgb(204, 204, 204)');
$('#fname, #lname, #title, #compantname, #designation, #occupation, #location, #age, #age2, #maritals, #gender, #panno').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
$('#fname, #lname, #title, #compantname, #designation, #occupation, #location, #age, #age2, #maritals, #gender, #panno').css('font-size','11px');
$('#fname, #lname, #title, #compantname, #designation, #occupation, #location, #age, #age2, #maritals, #gender, #panno').css('display','block');
$("#save, #cancel").show();	
$("#maritalsa, #gendera").hide();	
}

function enableClientDiv(id){
	$('#'+id+' input,#'+id+' select').css('background-color','rgb(255, 255, 255)');
	$('#'+id+' input,#'+id+' select').css('border','1px solid rgb(204, 204, 204)');
	$('#'+id+' input,#'+id+' select').css('box-shadow','0px 1px 1px rgba(0, 0, 0, 0.075) inset');
	$('#'+id+' input,#'+id+' select').removeAttr('disabled');
	$('a[name="'+id+'"]').hide();
	$('input[name="'+id+'"]').show();
	$('input[name="'+id+'"]').removeClass('hide');
	if(id=='familyDetailsForm')
		isEditFamilyMember=1;
	else if(id=='interestedFPDetails'){
		$('button[name="'+id+'"]').show();
		$('button[name="'+id+'"]').removeClass('hide');
		$('#interestedFP39002,#interestedFP39005,#interestedFP39006,#interestedFP39009').attr('disabled','disabled');		
	}
}

function disableClientDiv(id){
	
	if(id=='personalDetailsDiv'){
		 id='personalDetailsDiv1';
	 }else if(id=='contactDetails'){
		 id='contactDetailsDiv';
	 }else if(id=='familyDetailsForm'){
		 id='familyDetailsDiv';
	 }else if(id=='operationalDetailsForm'){
		 id='operationalDetailsDiv';
	 }else if(id=='healthHistoryDetails'){
		 id='healthHistoryDetailsDiv';
	 }
	 else if(id=='notesDetails'){
		 id='notesDetailsDiv';
	 }
	 else if(id=='documentsDetails'){
		 id='documentsDetailsDiv';
	 }else if(id=='assumptionsDetails'){
		 id='assumptionsDetailsDiv';
	 }else if(id=='interestedFPDetails'){
		 id='clientInterestedFPDiv';
	 }
	
	 localStorage.setItem('showSection',id);
	 location.reload();
}

function disableClientDiv1(id){
	$('#'+id+' input,#'+id+' select').css('background','none');
	$('#'+id+' input,#'+id+' select').css('border','none');
	$('#'+id+' input,#'+id+' select').css('box-shadow','none');
	$('#'+id+' input,#'+id+' select').attr('disabled','disabled');
	$('#'+id+' .nicEdit-main').attr('contenteditable','false');
	
	$('a[name="'+id+'"]').show();
	$('input[name="'+id+'"]').hide();
	$('button[name="'+id+'"]').hide();
}

function showDiv(id){
	
	$('.profiledivs').hide();
	$('#'+id).show();
	$('#'+id+' #state').change();
	$('.profiledivlink').css('font-weight','normal');
	$('a[name="'+id+'"]').css('font-weight','bold');
	
 	document.getElementById("noteadd").disabled=false;
 	document.getElementById("deletenotebtn").disabled=false;
// 	document.getElementById("popupSavenoteBtn").disabled=false;
// 	document.getElementById("popupCancelnoteBtn").disabled=false;	 
}

//These is a Temporary Function To enable The Buttons Please Check above Function for Issues not working for NotesDetailsDiv
function showDiver(id){
	$('.profiledivs').hide();
	$('#'+id).show();
	$('#'+id+' #state').change();
	$('.profiledivlink').css('font-weight','normal');
	$('a[name="'+id+'"]').css('font-weight','bold');
	
	document.getElementById("noteadd").disabled=false;
 	document.getElementById("deletenotebtn").disabled=false;
 	document.getElementById("popupSavenoteBtn").disabled=false;
	document.getElementById("popupCancelnoteBtn").disabled=false;
}

$(function() {
	$(".topmenu .ace-file-input").hide();
	var partyId=$('#partyIdFromRequest').val();
	showSelectedTab('clientLink');
	var restored=localStorage.getItem('dataRestored');
	if(restored=='true'){
		localStorage.setItem('dataRestored','');
		showDiv('assumptionsDetailsDiv')
		showAlertMessage("Success", "<br/>Data restored successfully.", "confirmation", doNothing);
		
	}
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=81,12,13,1,2,3,26,65,134,15,27,39',
		success : function(result) {
			$('#interestedFPs').empty();	
			$('#salutationId').empty();								//salutationId-81
			$('#martialStatusID').empty();							//martialStatusID-13
			$('#genderID').empty();									//genderID-12
			$('#contactDetails #city').empty();						//city-1
			$('#contactDetails #state').empty();					//state-2
			$('#contactDetails #country').empty();					//country-3
			$('#familyDetails #relationshipId').empty();			//relation-26
			
			$('#salutationId,#martialStatusID,#genderID,#contactDetails #city,#contactDetails #state,#contactDetails #country,#familyDetails #relationshipId').append('<option value="0">--Select--</option>');
			$('#occupation').empty();
			$('#occupation').append('<option value="0">---Select---</option>');
			$('#clientCategory').empty();
			$('#91053,#91054,#91055,#91056,#91057,#91058,#91059,#91060,#91061,#91062,#91063,#91064,#91064,#91065,#91066').append('<option value="0">---Select---</option>');
// 			$('#occupation').append('<option value="0">---Select---</option>');
			$('#workprofessionSpouse').append('<option value="0">---Select---</option>');
			$('#workprofessionMother').append('<option value="0">---Select---</option>');
			$('#workprofessionFather').append('<option value="0">---Select---</option>');
			$('#workprofessionMotherInLow').append('<option value="0">---Select---</option>');
			$('#workprofessionFatherInLow').append('<option value="0">---Select---</option>');
			$('#workprofessionHuf').append('<option value="0">---Select---</option>');
// 			$('#childWorkprofession1').append('<option value="0">---Select---</option>');
// 			$('#siblingWorkprofession1').append('<option value="0">---Select---</option>');
			workProfessionSelect = '<select style="box-shadow:none;width: 70% !important;" validate="workprofession" emsg="PAN No" name="workprofession"  class="form-control  pull-left" id="workprofession">';
					workProfessionSelect+='<option value="0">--Select--</option>';
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;
				
				if(codeTypeId==81){
					$('#salutationId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==13){
					$('#martialStatusID').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==12){
					$('#genderID').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==1){
					$('contactDetails #city').append('<option value="'+codevalueId+'">'+codeValue+'</option>');					
				}else if(codeTypeId==2){
					$('#contactDetails #state').append('<option value="'+codevalueId+'">'+codeValue+'</option>');				
				}else if(codeTypeId==3){
					$('#contactDetails #country').append('<option value="'+codevalueId+'">'+codeValue+'</option>');				
				}else if(codeTypeId==26){
					$('#familyDetails #relationshipId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');				
				}else if(codeTypeId==65){
					$('#occupation').append('<option value="'+codevalueId+'">'+codeValue+'</option>');	
					$('#workprofessionSpouse').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#workprofessionMother').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#workprofessionFather').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#workprofessionMotherInLow').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#workprofessionFatherInLow').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#workprofessionHuf').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					workProfessionSelect+='<option value="'+codevalueId+'">'+codeValue+'</option>';
				}else if(codeTypeId==134){
					$('#offerings').append('<li> <div class="checkbox"><label><input id="offering'+obj.mappedValue1+'" name="offering"  type="checkbox" class="ace"><span class="lbl">'+codeValue+'</span></label></div></li><li>');
				}else if(codeTypeId==15){
					if(codevalueId>15002)
					$('#clientCategory').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==39 && obj.mappedValue1=='FPSections'){
					$('#interestedFPs').append('<div class="col-md-6"><label><input class="ace ace-switch ace-switch-7" type="checkbox" id="interestedFP'+codevalueId+'" name="interestedFP"><span class="lbl" style="position: relative;left: 15px;top: -19px;">&nbsp;&nbsp;&nbsp;&nbsp; '+ codeValue+'</span></label></div>');
				}
				else if(codeTypeId==27){
					if(codevalueId<27003)
						$('#91053,#91054,#91055,#91056,#91057,#91058,#91059,#91060,#91061,#91062,#91063,#91064,#91064,#91065,#91066').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					else
						$('#91053,#91054').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					}
			});
			
				$.ajax({
					type : 'POST',
					url : $('#contextPath').val()+"/client/getClientProfileDetails.htm?partyId="+partyId,
					success : function(result) {	
						
						var firstName=result.firstName;
						var lastName=result.lastName;
						var salutationId=result.salutationId;
						var companyName=result.companyName;
						var designation=result.workDesignation;
						var occupation=result.workProfession;				
						var panNo=result.panNo;
						var dob= result.dob;
						var anniversaryDate=result.anniversaryDate;
						var age=result.age;
						var martialStatusId=result.martialStatusID;						
						var genderId=result.genderID;				
						var contactEmail=result.contactEmail;
						var contactMobile=result.contactMobile;
						var contactMobile2=result.contactMobile2;
					
						$('#firstName').val(firstName);
						$('#lastName').val(lastName);		
						$("#profileNameId").html(" - "+firstName+"  "+lastName);
						$('#salutationId').val(salutationId);
						$('#companyName').val(companyName);
						$('#designation').val(designation);
						$('#occupation').val(occupation);
						$('#dob').val(dob);
						$('#anniversaryDate').val(anniversaryDate);
						
						$('#age').val(age);
						$('#panNo').val(panNo);
						$('#martialStatusID').val(martialStatusId);
						$('#genderID').val(genderId);
						$('#contactEmail').val(contactEmail);
						$('#contactMobile').val(contactMobile);
						$('#contactMobile2').val(contactMobile2);
						$('#clientCategory').val(result.clientCategory);
						$('#clientActivated').val(result.isClientActivated==1?'Yes':'No');
						$('#memberShipStartDate').val(result.memberShipStartDate);
						$('#memberShipEndDate').val(result.memberShipEndDate);
						$('#nextRenewalDate').val(result.nextRenewalDate);
						$('#lastRenewedOn').val(result.lastRenewedOn);
						
						var addressDataList=result.addressDataList;
						$(addressDataList).each(function(i,obj) {
							var street1=obj.street1;
							var street2=obj.street2;
							var street3=obj.street3;
							var addressType=obj.addressType;
							var city=obj.city;
							var state=obj.state;
							var country=obj.country1;
							var postalCode=obj.postalCode;
							
							cityId=obj.cityId;
							$('#contactDetails #street1').val(street1);
							$('#contactDetails #street2').val(street2);
							$('#contactDetails #street3').val(street3);
							$('#contactDetails #country').val(country);
							$('#contactDetails #state').val(state);
							$('#contactDetails #city').val(city);
							$('#contactDetails #pinCode').val(postalCode);						
						});
						ageCount('dob');
						var familyMemberDataList=result.familyDataList;	
						
						var childCounter=0;
						var sibblingCounter=0;
						var isAnyChild=0;
						var isAnySibbling=0;
// 						var familyMemberDataList=result.familyMemberDataList;												
						$(familyMemberDataList).each(function(i,obj) {					
							var firstName=obj.firstName;
							var lastName=obj.lastName;
							var relationshipId=obj.relationshipId;
							var dob=obj.dob;
							var age=obj.age;
							var panNo=obj.panNo;
							var comment=obj.comment;
							var partyId=obj.partyId;
							var workProfession= obj.workProfession;
							if(relationshipId==26001){
//	 							alert('Hi'+lastName);
//	 							alert('Hello'+panNo);
								$('#spouseDob').val(dob);
							$('#spouseName').val(firstName);
							$('#spouseLname').val(lastName);
							$('#spousePAN').val(panNo);
							$('#spouseAge').val(age);
							$('#spousePartyId').val(partyId);
							$('#workprofessionSpouse').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
									{
									
									}
								else{
									$('#lookup').hide();
								}
								
							}else if(relationshipId==26011){
								$('#motherDob').val(dob);
								$('#motherName').val(firstName);
								$('#motherLname').val(lastName);
								$('#motherPAN').val(panNo);
//		 						if(motherAge!=0)
								$('#motherAge').val(age);
								$('#motherPartyId').val(partyId);
								$('#workprofessionMother').val(workProfession);
								
								if(partyId=='' || partyId==0 || partyId=='0')
								{
									
								}
								else{
									
									$('#lookupmother').hide();
								}
							}else if(relationshipId==26010){
								$('#fatherName').val(firstName);
								$('#fatherLname').val(lastName);
								$('#fatherPAN').val(panNo);
//		 						if(fatherAge!=0)
								$('#fatherAge').val(age);
								$('#fatherDob').val(dob);
								$('#fatherPartyId').val(partyId);
								$('#workprofessionFather').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								
								}
								else{
									$('#father').hide();
								}
							}else if(relationshipId==26005){
								$('#motherInLawName').val(firstName);
								$('#motherInLawLname').val(lastName);
								$('#motherInLawPAN').val(panNo);
//		 						if(motherInLawAge!=0)
								$('#motherInLawAge').val(age);
								$('#motherInLawDob').val(dob);
								$('#motherInLawPartyId').val(partyId);
								$('#workprofessionMotherInLow').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								
								}
								else{
									$('#motherInLaw').hide();
								}
							}else if(relationshipId==26014){
								$('#fatherInLawName').val(firstName);
								$('#fatherInLawLname').val(lastName);
								$('#fatherInLawPAN').val(panNo);
//		 						if(fatherInLawAge!=0)
								$('#fatherInLawAge').val(age);
								$('#fatherInLawDob').val(dob);
								$('#fatherInLawPartyId').val(partyId);
								$('#workprofessionFatherInLow').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								
								}
								else{
									$('#fatherInLaw').hide();
								}
							}else if(relationshipId==26015){
								$('#HUFName').val(firstName);
								$('#HUFLname').val(lastName);
								$('#HUFPAN').val(panNo);
//		 						if(fatherInLawAge!=0)
								$('#HUFAge').val(age);
								$('#HUFDob').val(dob);
								$('#HUFPartyId').val(partyId);
								$('#workprofessionHuf').val(workProfession);
								if(partyId=='' || partyId==0 || partyId=='0')
								{
								
								}
								else{
									$('#huf').hide();
								}
							}else{
								if(relationshipId==26002){
									isAnyChild=1;									
									childCounter+=1;
										$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td > <span id="child1" >Child '+childCounter+'</span></td><td ><input name="childname" style="width: 70% !important;" type="text" id="childname'+childCounter+'"   value="'+firstName+'" onkeyup="nospecialCharacters(id,event)" /><input type="hidden" id="partyIdchild'+childCounter+'"  value="'+partyId+'"></td><td ><input style="background:none;box-shadow:none;width: 75% !important;" name="childLname" class="form-control  pull-left" type="text" id="childLname'+childCounter+'"  value="'+lastName+'" onkeyup="nospecialCharacters(id,event)" ></td><td><input style="width: 90% !important;" name="childPAN" type="text" id="childPAN'+childCounter+'" class="form-control  pull-left" validate="pan" emsg="PAN No" value="'+panNo+'" /><input type="hidden" id="partyIdchild'+childCounter+'"  value="'+partyId+'"></td><td >'+workProfessionSelect+'</td><td><input name="childDob" validate="date" emsg="DOB" value="'+dob+'" style="width=97% !important;" onchange="setAgeFromDOB(name,'+childCounter+')" class="form-control  pull-left dob" type="text" id="childDob'+childCounter+'"  value="" ></td><td  ><input style="width: 30px !important;" readonly="readonly" name="childage" class="form-control  pull-left" type="text" id="childage'+childCounter+'"  value="'+age+'" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td id="tdchild'+childCounter+'"></td></tr>');
										$('#childWorkprofession'+childCounter).empty();
										$('#childWorkprofession'+childCounter).append('<option value="0">---Select---</option>');
										
										var codeTypeId;
										var codeValue;
										var codevalueId;
										
										$('#childRow'+childCounter + ' #workprofession ').val(workProfession);
								}else if(relationshipId==26004){
									isAnySibbling=1;
									sibblingCounter+=1;
										$('#extendedFamilyTable').append('<tr id="sibblingRow'+sibblingCounter+'" name="sibbling"><td width="15%">Sibling '+sibblingCounter+'</td><td width="15%"><input name="sibblingname" style="width: 70% !important;" class="form-control  pull-left" type="text" id="sibblingname'+sibblingCounter+'"  value="'+firstName+'" onkeyup="nospecialCharacters(id,event)"/><input type="hidden" id="partyIdsibbling'+sibblingCounter+'"  value="'+partyId+'"></td><td width="15%"><input style="background:none;box-shadow:none;width: 75% !important;" name="sibblingLname" class="form-control  pull-left" type="text" id="sibblingLname'+sibblingCounter+'"  value="'+lastName+'" onkeyup="nospecialCharacters(id,event)" ></td><td width="15%"><input style="width: 90% !important;" name="sibblingPAN" class="form-control  pull-left" type="text" id="sibblingPAN'+sibblingCounter+'"  value="'+panNo+'" validate="pan" emsg="PAN No"></td><td width="20%">'+workProfessionSelect+'</td><td width="15%"><input name="sibblingDob" value="'+dob+'" style="width=97% !important;" validate="date" emsg="DOB" onchange="setAgeFromDOB(name,'+sibblingCounter+')" class="form-control  pull-left dob" type="text" id="sibblingDob'+sibblingCounter+'"  value=""></td></td><td width="20%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+sibblingCounter+'" style="width:30px !important"  value="'+age+'" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td id="tdsibbling'+sibblingCounter+'"></td></tr>');
										$('#sibblingRow'+sibblingCounter + ' #workprofession ').val(workProfession);										
								}
							}					
						
						});	
						
						$('#immediateFamilyTable input,#extendedFamilyTable input').css('border','none');
						$('#immediateFamilyTable input').css('background','none');
						$('#immediateFamilyTable input').css('box-shadow','none');
						if(isAnyChild==1){
							$('#tdchild'+childCounter).append('<a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="fa fa-plus"> </i></a>');
						
						}else{
							childCounter=1;
							
							$('#immediateFamilyTable').append('<tr id="childRow'+childCounter+'" name="child"><td width="10%"><span id="child1" >Child '+childCounter+'</span></td><td width="15%"><input name="childname"  type="text" style="width: 70% !important;" id="childname'+childCounter+'"  class="form-control  pull-left" onkeyup="nospecialCharacters(id,event)" /><input type="hidden" id="partyIdchild'+childCounter+'"  value="0"><input type="hidden" name="childSelectedFromContact'+childCounter+'" id="childSelectedFromContact'+childCounter+'" value="false"> <a class="choose2" href="#" id="lookupchild'+childCounter+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td><td width="15%"><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="childLname" class="form-control  pull-left" type="text"  id="childLname'+childCounter+'"  value="" onkeyup="nospecialCharacters(id,event)"></td><td width="15%"><input style="width: 90% !important;" name="childPAN" type="text" id="childPAN'+childCounter+'" class="form-control  pull-left" validate="pan" emsg="PAN No" /></td> <td width="20%">'+workProfessionSelect+'</td><td width="15%"><input name="childDob" validate="date" emsg="DOB" class="form-control  pull-left dob" style="width=97% !important;" onchange="setAgeFromDOB(name,'+childCounter+')" type="text" id="childDob'+childCounter+'"  value=""  ></td></td><td width="20%"><input style="width: 30px !important;" name="childage" readonly="readonly" class="form-control  pull-left" type="text" id="childage'+childCounter+'" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="10%" id="tdchild'+childCounter+'"></td></tr>');
							$('#tdchild'+childCounter).append('<a  onClick="addRow(\'child\');" alt="Add Child" title="Add Child" id="childplusicon"> <i class="fa fa-plus"  style="display: inline;"> </i></a>');
						}
						if(isAnySibbling==1){
							$('#tdsibbling'+sibblingCounter).append('<a  onClick="addRow(\'sibbling\');" alt="Add Child" title="Add Child" id="sibblingplusicon"> <i class="fa fa-plus"> </i></a>');
						}else{
							sibblingCounter=1;
							$('#extendedFamilyTable').append('<tr id="sibblingRow'+sibblingCounter+'" name="sibbling"><td width="15%">Sibling '+sibblingCounter+'</td><td   width="15%"><input name="sibblingname" style="width: 70% !important;" class="form-control  pull-left" type="text" id="sibblingname'+sibblingCounter+'" onkeyup="nospecialCharacters(id,event)"><input type="hidden" id="partyIdsibbling'+sibblingCounter+'"  value="0"><input type="hidden" name="sibblingSelectedFromContact'+sibblingCounter+'" id="sibblingSelectedFromContact'+sibblingCounter+'" value="false"><a class="choose2" href="#" id="lookupsibbling'+sibblingCounter+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td><td width="15%"><input style="border:none;background:none;box-shadow:none;width: 75% !important;" name="sibblingLname" class="form-control  pull-left" type="text" id="sibblingLname'+sibblingCounter+'"  value="" onkeyup="nospecialCharacters(id,event)" ></td><td width="15%"><input style="width: 90% !important;" name="sibblingPAN" class="form-control  pull-left" type="text" id="sibblingPAN'+sibblingCounter+'" validate="pan" emsg="PAN No"><input type="hidden" id="partyIdsibbling'+sibblingCounter+'"  value="0"></td><td width="20%">'+workProfessionSelect+'</td><td width="15%"><input name="sibblingDob" validate="date" emsg="DOB" type="text" class="form-control  pull-left dob" style="width=97% !important;" onchange="setAgeFromDOB(name,'+sibblingCounter+')" id="sibblingDob'+sibblingCounter+'"  value=""></td></td><td  width="20%"><input name="sibblingage" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+sibblingCounter+'" style="width:30px !important" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td id="tdsibbling'+sibblingCounter+'"></td></tr>');
							$('#tdsibbling'+sibblingCounter).append('<a  onClick="addRow(\'sibbling\');" alt="Add Child" title="Add Child" id="sibblingplusicon"> <i class="fa fa-plus"> </i></a>');
						}
						try{
							$('.dob').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
							}catch(e){
								try{
								$jq_1_9_1('.dob').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
								}catch(e){
									$jq_1_9_2('.dob').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								}
							}
							
							//anniversaryDate
							try{
								$('.anniversaryDate').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
								}catch(e){
									try{
									$jq_1_9_1('.anniversaryDate').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
									}catch(e){
										$jq_1_9_2('.anniversaryDate').datepicker({
											changeMonth : true,
											changeYear : true,
											maxDate : '0',
											yearRange : "1900:2200",
											dateFormat : "dd/mm/yy"

										});
									}
								}
							
						$('#immediateFamilyTable input,#extendedFamilyTable input').css('border','none');
						$('#immediateFamilyTable input').css('background','none');
						$('#immediateFamilyTable input').css('box-shadow','none');	
						
						var notesDataList=result.notesDataList;
					
					$(notesDataList).each(function(i,obj){
						var noteText=obj.noteText;
						var createdBy=obj.noteTag;
						var createdDate=obj.createdDate;
						var noteId=obj.noteId;						
					
						$('#notesDetails').append('<tbody>');
						$('#notesDetails').append('<tr><td><a id="editNotesLink" onclick="editNote('+noteId+')" data-toggle="modal" data-target="#addnote"><img src="'+$('#contextPath').val()+'/images/edit.png" alt="Edit" title="Edit"></a>&nbsp;&nbsp;</td> <td><input id="note'+noteId+'" name="note" type="checkbox" enabled></td> <td id="notetext'+noteId+'">'+noteText+'</td> <td>'+createdBy+'</td> <td>'+createdDate+'</td> </tr>');
						$('#notesDetails').append('</tbody>');
					});
						
					var documentsDataList=result.documentDatas;
					$(documentsDataList).each(function(i,obj){
						var fileName=obj.fileName;
						var documentName=obj.documentName;
						var documentCreatedBy=obj.createdByName;
						var documentCreatedDate=obj.createdDate;
						var docId=obj.documentId;
											
						$('#documentsDetails').append('<tbody>');
						$('#documentsDetails').append('<tr><td><span class="thead"><input id="documnet'+docId+'" name="document" type="checkbox"></span></td> <td ><a onclick="downloadAttachment('+docId+')">'+fileName+'</a></td> <td>'+documentName+'</td> <td>'+documentCreatedBy+'</td> <td>'+documentCreatedDate+'</td> </tr>');
						$('#documentsDetails').append('</tbody>');
					});
					
						
						var partyAttributeDatas=result.partyAttributeDatas;
	 					$(partyAttributeDatas).each(function(i,obj) {
	 						
								var attributeCodeId=obj.attributeCodeId;
								var attributeCodeValue=obj.attributeValue;
								if(attributeCodeValue=='1'){
									$('#offering'+attributeCodeId).attr('checked','checked');
								}
	 					});
	 					
	 					var partyAttributeDatas=result.partyAttributeDatasHealth;
	 					$(partyAttributeDatas).each(function(i,obj) {
	 						
								var attributeCodeId=obj.attributeCodeId;
								var attributeCodeValue=obj.attributeValue;
									if(attributeCodeValue!=0)
									$('#'+attributeCodeId).val(attributeCodeValue);
	 					});
	 					
	 					var partyAttributeDatasFp=result.interestedFpList;

	 						$(partyAttributeDatasFp).each(function(i,obj) {
	 							
	 							var attributeCodeId=obj.attributeCodeId;
	 							var attributeCodeValue=obj.attributeValue;
	 							var selectedSections=attributeCodeValue.split(',');
	 							$(selectedSections).each(function(i,obj) {
	 							$('#interestedFP'+obj).attr('checked','checked');
	 							});
	 						}); 
						
						$.ajax({
							type : 'POST',
							url : $('#contextPath').val()+"/common/getAdviceAssumptions.htm?partyId="+partyId,
							success : function(result) {
							assumptionList=result;
							$(result).each(function(i,obj) {
						$('#lastRow').before('<div class="row"><div class="form-group col-md-12 clearfix">	<label class="col-sm-3 control-label no-padding-right" for="genderID">'+obj.displayLabel+'</label><div class="col-sm-9"><div class="col-sm-9"><div class="scale clearfix"><div class="scale_range" style="width:100%"><span class="low extrem" id="assumption'+obj.assumptionCodeId+'left">'+obj.valueStartRange+'</span><span class="high extrem" id="assumption'+obj.assumptionCodeId+'right">'+obj.valueEndRange+'</span></div><div aria-disabled="false" style="width:100%" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="assumption'+obj.assumptionCodeId+'range"><a  class="ui-slider-handle ui-state-default ui-corner-all" href="#"></a></div></div></div><div class="col-sm-2"><div class="scale clearfix"><div class="counter_parent pad-nesw2"><input class="range_counter input-small" type="text" value="'+obj.assumptionValue+'" id="assumption'+obj.assumptionCodeId+'"/></div></div></div></div></div></div>');
						if(obj.valueDataTypeId==37004){
							createSlider('#assumption'+obj.assumptionCodeId+'range',parseInt(obj.valueStartRange),parseInt(obj.valueEndRange),0.25,'#assumption'+obj.assumptionCodeId);
						}else if(obj.valueDataTypeId==37003){
							createSlider('#assumption'+obj.assumptionCodeId+'range',parseInt(obj.valueStartRange),parseInt(obj.valueEndRange),1000,'#assumption'+obj.assumptionCodeId);
						}
						else{
							createSlider('#assumption'+obj.assumptionCodeId+'range',parseInt(obj.valueStartRange),parseInt(obj.valueEndRange),1,'#assumption'+obj.assumptionCodeId);
						}
						$('#assumption'+obj.assumptionCodeId).val(obj.assumptionValue);
					});		
					$('#assumptionsDetails input[type="text"]').change(function() {
						var id=$(this).attr('id');
						var left=parseFloat($('#'+id+'left').html());
						var right=parseFloat($('#'+id+'right').html());
						var value=$('#'+id).val();
						value=value<parseFloat($('#'+id+'left').html())?0:(value>parseFloat($('#'+id+'right').html())?parseFloat($('#'+id+'right').html()):(((value-left)/(right-left))*100))
						$('#'+id+'range a.ui-slider-handle').css('left',value+'%');							
					});	
					$( ".ui-slider-handle" ).hover(function(event) {
						 if(isEditAssumption==true){
							 
						 }else{
							 event.preventDefault();
						 }
						});
					$('#assumptionsDetails input[type="text"]').each(function() {
						$(this).change();			
					});
					$('#assumptionsDetails input[type="text"]').each(function() {
						$(this).attr('onkeydown','validateAssumption(id,event)');
					});
						
					try{
						$('#dob').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "dd/mm/yy"

						});
						}catch(e){
							try{
							$jq_1_9_1('#dob').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
							}catch(e){
								$jq_1_9_2('#dob').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
							}
						}			

						try{
							$('#anniversaryDate').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
							}catch(e){
								try{
								$jq_1_9_1('#anniversaryDate').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
								}catch(e){
									$jq_1_9_2('#anniversaryDate').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								}
							}
						//	$('input[type="text"]').css('width','100%');
						$('#dob').css('width','40%');
					     $('#AgeYrs').css('width','10%');
						$('select').addClass('form-control');
						$('#familyDetailsDiv input[type="text"]').css('width','87%');						
						$('.nicEdit-panelContain').parent().css('width','100%');
						$('.nicEdit-main').parent().css('width','100%');
						$('.nicEdit-main').css('width','100%');
						$('body input,select').attr('disabled','disabled');
						$('.nicEdit-main').attr('contenteditable','false');
						$('#familyDetailsForm input').css('background','white !important');
						$('#notesDetails input,#documentsDetailsDiv input,#addDocumentPopup input,#popUpAlertaddnote input,#assumptionsDetailsForm input').removeAttr('disabled','disabled');
						$('input[type="button"]').css('cursor','pointer');
						$('#PersonalDetailsForm').css('margin-top','25px');
						$('#contactDetailsForm').css('margin-top','25px');
						$('#originationDetailsForm').css('margin-top','28px');
						$('#trackerDetailsForm').css('margin-top','25px');
						$('#interestFPForm').css('margin-top','25px');
						$('#operationalDetailsForm').css('margin-top','25px');
						$('#healthHistoryDetailsForm').css('margin-top','25px');
						
						var sectionId=localStorage.getItem('showSection');
						if(sectionId!='' && sectionId!=undefined){
						showDiv(sectionId);
						}
						localStorage.setItem('showSection','');
						activateSecurity();			
			}
			});
		}
		});
		}
});
});	
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox) {

 try{
		$(ctrlName).slider({
	        min: minVal,
	        max: maxVal,
	        step: stepBy,
	        slide: function (event, ui) {
	            $jq_1_9_1(ctrlTextBox).val(ui.value);
				
	        }
	    });
		}catch(e){
			try{
			$jq_1_9_1(ctrlName).slider({
		        min: minVal,
		        max: maxVal,
		        step: stepBy,
		        slide: function (event, ui) {
		            $jq_1_9_1(ctrlTextBox).val(ui.value);
					
		        }
		    });
			}catch(e){
				$jq_1_9_2(ctrlName).slider({
			        min: minVal,
			        max: maxVal,
			        step: stepBy,
			        slide: function (event, ui) {
			            $jq_1_9_1(ctrlTextBox).val(ui.value);
						
			        }
			    });
			}
		}
 
		try{
			$(ctrlTextBox).val($(ctrlName).slider("value"));
			}catch(e){
				try{
				$jq_1_9_1(ctrlTextBox).val($jq_1_9_1(ctrlName).slider("value"));
				}catch(e){
					$jq_1_9_2(ctrlTextBox).val($jq_1_9_2(ctrlName).slider("value"));
				}
			}

 $jq_1_9_1(ctrlTextBox).keyup(function () {
     $jq_1_9_1(ctrlTextBox).val();
     $jq_1_9_1(ctrlName).slider('value', $jq_1_9_1(ctrlTextBox).val());
 });
 try{
		$(ctrlTextBox).keyup(function () {
	        $(ctrlTextBox).val();
	        $(ctrlName).slider('value', $(ctrlTextBox).val());
	    });
		}catch(e){
			try{
				  $jq_1_9_1(ctrlTextBox).keyup(function () {
				        $jq_1_9_1(ctrlTextBox).val();
				        $jq_1_9_1(ctrlName).slider('value', $jq_1_9_1(ctrlTextBox).val());
				    });
			}catch(e){
				  $jq_1_9_2(ctrlTextBox).keyup(function () {
				        $jq_1_9_2(ctrlTextBox).val();
				        $jq_1_9_2(ctrlName).slider('value', $jq_1_9_2(ctrlTextBox).val());
				    });
			}
		}
	
}
function addRow(name){
	if(isEditFamilyMember==1){
	var totalRow = $('tr[name="'+name+'"]').size();
	if(name=='child'){
		$('#childplusicon').remove();
		$('#immediateFamilyTable').append('<tr id="childRow'+(totalRow+1)+'" name="child"><td width="10%"><span id="child1" >Child '+(totalRow+1)+'</span></td><td width="15%"><input name="childname" style="width: 70% !important;" type="text" id="childname'+(totalRow+1)+'" class="form-control  pull-left" onkeyup="nospecialCharacters(id,event)"/><input type="hidden" id="partyIdchild'+(totalRow+1)+'"  value="0"><input type="hidden" name="childSelectedFromContact'+(totalRow+1)+'" id="childSelectedFromContact'+(totalRow+1)+'" value="false"> <a class="choose2" href="#" id="lookupchild'+(totalRow+1)+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td><td width="15%"><input style="box-shadow:none;width: 75% !important;" name="childLname" class="form-control  pull-left" type="text" id="childLname'+(totalRow+1)+'"  value="" onkeyup="nospecialCharacters(id,event)" ></td><td width="15%"><input name="childPAN" type="text" id="childPAN'+(totalRow+1)+'" style="width:90% !important" class="form-control  pull-left" validate="pan" emsg="PAN No" /></td><td width="20%">'+workProfessionSelect+'</td><td width="15%"><input name="childDob" class="form-control  pull-left dob" style="width:97% !important" validate="date" emsg="DOB" onchange="setAgeFromDOB(name,'+(totalRow+1)+')" type="text" id="childDob'+(totalRow+1)+'"  value=""  ></td></td><td width="20%"><input name="childage" style="background-color:white;width: 30px !important;" readonly="readonly" type="text" id="childage'+(totalRow+1)+'"  class="form-control  pull-left" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="10%"><a id="childplusicon" onClick="addRow(\'child\');" alt="Add Child" title="Add Child"> <i class="fa fa-plus"  style="display: inline;"> </i></a></td></tr>');
	}else{
		$('#sibblingplusicon').remove();
		$('#extendedFamilyTable').append('<tr id="sibblingRow'+(totalRow+1)+'" name="sibbling"><td width="15%">Sibling '+(totalRow+1)+'</td><td width="15%"><input name="sibblingname" style="width: 70% !important;" class="form-control  pull-left" type="text" id="sibblingname'+(totalRow+1)+'" onkeyup="nospecialCharacters(id,event)"><input type="hidden" id="partyIdsibbling'+(totalRow+1)+'"  value="0"><input type="hidden" name="sibblingSelectedFromContact'+(totalRow+1)+'" id="sibblingSelectedFromContact'+(totalRow+1)+'" value="false"><a class="choose2" href="#" id="lookupsibbling'+(totalRow+1)+'" onclick="showClientPopup(${sessionScope.userSession.partyId},id);">&nbsp;<i class="fa fa-search" title="Click here to select from existing contact"></i></a></td><td width="15%"><input style="box-shadow:none;width: 75% !important;" name="sibblingLname" class="form-control  pull-left" type="text" id="sibblingLname'+(totalRow+1)+'"  value="" onkeyup="nospecialCharacters(id,event)" ></td><td width="15%"><input name="sibblingPAN" class="form-control  pull-left" type="text" id="sibblingPAN'+(totalRow+1)+'" style="width:90% !important" validate="pan" emsg="PAN No"></td><td width="20%">'+workProfessionSelect+'</td><td width="15%"><input name="sibblingDob" class="form-control  pull-left dob" style="width:97% !important" validate="date" emsg="DOB" onchange="setAgeFromDOB(name,'+(totalRow+1)+')" type="text" id="sibblingDob'+(totalRow+1)+'"  value=""></td></td><td width="20%"><input name="sibblingage" style="background-color:white;width: 30px !important" readonly="readonly" class="form-control  pull-left" type="text" id="sibblingage'+(totalRow+1)+'" maxlength="3" onkeydown="allowIntegersOnly(id,event)"/></td><td width="10%"><a id="sibblingplusicon"  onClick="addRow(\'sibbling\');" alt="Add More " title="Add Sibbling"> <i class="fa fa-plus"> </i></a></td></tr>');
	}
	
	try{
		$('.dob').datepicker({
			changeMonth : true,
			changeYear : true,
			maxDate : '0',
			yearRange : "1900:2200",
			dateFormat : "dd/mm/yy"

		});
		}catch(e){
			try{
			$jq_1_9_1('.dob').datepicker({
				changeMonth : true,
				changeYear : true,
				maxDate : '0',
				yearRange : "1900:2200",
				dateFormat : "dd/mm/yy"

			});
			}catch(e){
				$jq_1_9_2('.dob').datepicker({
					changeMonth : true,
					changeYear : true,
					maxDate : '0',
					yearRange : "1900:2200",
					dateFormat : "dd/mm/yy"

				});
			}
		}
	$('#familyDetailsForm input').css('background','white !important');
	$('input[name="sibblingage"],input[name="childage"]').css('background-color','white !important');
	}
	$('#familyDetailsForm input').css('background','white !important');
	$('input[name="sibblingage"],input[name="childage"]').css('background-color','white !important');
}

function ageCount(id) {
	var dob=$('#'+id).val();
    
    var date1 = new Date();
    var  dob1= document.getElementById("dob").value.split("/");;
    date2= new Date(dob1[2], dob1[1] - 1, dob1[0]);
    var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
    if (pattern.test(dob)) {
        var y1 = date1.getFullYear(); //getting current year
        var y2 = date2.getFullYear(); //getting dob year
        
        var age = y1 - y2;           //calculating age 
        $('#AgeYrs').val(getAge(date2));
        return true;
    } else {
    	$('#AgeYrs').val(0);
        return false;
    }
}

function changeAssumption(id){
	
	if(id==98021 || id==98022 || id==98027 || id==98046 || id==98019 || id==98001){
		var left=parseFloat($('#assumption'+id+'left').html());
		var right=parseFloat($('#assumption'+id+'right').html());
		var range=parseFloat($('#assumption'+id+'range').val());
		var value=left+((right-left)*(range/100));
		$('#assumption'+id).val(Math.round(value));
	}else{
		var left=parseFloat($('#assumption'+id+'left').html());
		var right=parseFloat($('#assumption'+id+'right').html());     
		var range=parseFloat($('#assumption'+id+'range').val());
		var value=left+((right-left)*(range/100));
		$('#assumption'+id).val((value.toString().indexOf(".") !== -1) ? value.toFixed(2) : value);
	}
}

function showDiv(id){
	$('.profiledivs').hide();
	$('#'+id).show();
	$('#'+id+' #state').change();
	$('.profiledivlink').css('font-weight','normal');
	$('a[name="'+id+'"]').css('font-weight','bold');
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
// 			$('#'+id+' #city')
// 		    // don't navigate away from the field on tab when selecting an item
// 		    .bind( "keydown", function( event ) {
// 		      if ( event.keyCode ===  $.ui.keyCode.TAB &&
// 		          $( this ).data( "ui-autocomplete" ).menu.active ) {
// 		        event.preventDefault();
// 		      }
// 		    })
// 		    .autocomplete({
// 		      minLength: 0,
// 		      source: function( request, response ) {
// 		        // delegate back to autocomplete, but extract the last term
// 		    	  response(  $.ui.autocomplete.filter(cityArrayList, request.term) );
// 		      },
// 		      focus: function() {
// 		        // prevent value inserted on focus
// 		        return false;
// 		      },
// 		      select: function( event, ui ) {
// 		    	  var terms = split( this.value );
			        
// 			        console.log('terms='+terms);
			        
// 			        // remove the current input
// 			        terms.pop();
// 			        // add the selected item 
// 			        terms.push(ui.item.label);
			       
// 			        	cityId=ui.item.value;
							        
// 			        // add placeholder to get the comma-and-space at the end
// 			        terms.push( "" );
// 			        this.value = terms.join( "" );
			        
// 			        var labelArr = $(this).data('label') || new Array();
// 			        labelArr.push(ui.item);
// 			        $(this).data('label',labelArr);
// 			        console.log($(this).data());
			        
// 			        return false;
// 		      }
// 		    });
		} 
	});
}
function saveClientProfile(sectionId){
	isValidated=true;
	var partyIdArray = new Array();
	var iValidateDuplicateParty=false;
	var sectionName="";
	var actionName="";
	var formId="";
	var partyId=$('#partyIdFromRequest').val();
	if(sectionId=='personalDetailsDiv'){
		
		sectionName="PersonalDetails";
		isValidated=validateInputForm(sectionId);
		actionName="client/saveClientProfile.htm?partyId="+partyId+'&sectionName='+sectionName;
		formId="PersonalDetailsForm";
		
		
	} else if(sectionId=='contactDetails'){
		
		sectionName="ContactDetails";
		isValidated=validateInputForm(sectionId);
		actionName="client/saveClientProfileAddressData.htm?partyId="+partyId+'&sectionName='+sectionName;
		formId="contactDetailsForm";
		if(cityId==0 || cityId==undefined){
			$('#'+sectionId+' #cityHidden').val($('#'+sectionId+' #city').val());
		}else{
			$('#'+sectionId+' #cityHidden').val(cityId);
		}
		
	} else if(sectionId=='familyDetailsForm'){
		isValidated=validateInputForm(sectionId);
		sectionName="FamilyDetails";
		actionName="client/saveClientProfileFamilyMemberData.htm?partyId="+partyId+'&sectionName='+sectionName;
		formId="familyDetailsForm";		
		if($('#spouseAge').val()=='' || $('#spouseAge').val()==undefined)
			$('#spouseAge').val(0);
		if($('#motherAge').val()=='' || $('#motherAge').val()==undefined)
			$('#motherAge').val(0);
		if($('#fatherAge').val()=='' || $('#fatherAge').val()==undefined)
			$('#fatherAge').val(0);
		if($('#motherInLawAge').val()=='' || $('#motherInLawAge').val()==undefined)
			$('#motherInLawAge').val(0);
		if($('#fatherInLawAge').val()=='' || $('#fatherInLawAge').val()==undefined)
			$('#fatherInLawAge').val(0);
		if($('#spouseLname').val()!==''){
			$('#spouseLname').css('border-color','grey');
			$('#spouseLname').removeAttr('title');
		}else if($('#spouseDob').val()!=''){
			$('#spouseLname').css('border-color','red');
			$('#spouseLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#spouseName').val()!=''){
			$('#spouseLname').css('border-color','red');
			$('#spouseLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#spousePAN').val()!=''){
			$('#spouseLname').css('border-color','red');
			$('#spouseLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#workprofessionSpouse').val()!='0'){
			$('#spouseLname').css('border-color','red');
			$('#spouseLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else{
			$('#spouseLname').css('border-color','grey');
			$('#spouseLname').removeAttr('title');
			
		}
		
		if($('#motherLname').val()!==''){
			$('#motherLname').css('border-color','grey');
			$('#motherLname').removeAttr('title');
		}else if($('#motherDob').val()!=''){
			$('#motherLname').css('border-color','red');
			$('#motherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}else if($('#motherName').val()!=''){
			$('#motherLname').css('border-color','red');
			$('#motherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#motherPAN').val()!=''){
			$('#motherLname').css('border-color','red');
			$('#motherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#workprofessionMother').val()!='0'){
			$('#motherLname').css('border-color','red');
			$('#motherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else{
			$('#motherLname').css('border-color','grey');
			$('#motherLname').removeAttr('title');
			
		}
		
		if($('#fatherLname').val()!==''){
			$('#fatherLname').css('border-color','grey');
			$('#fatherLname').removeAttr('title');
		}else if($('#fatherDob').val()!=''){
			$('#fatherLname').css('border-color','red');
			$('#fatherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}else if($('#fatherName').val()!=''){
			$('#fatherLname').css('border-color','red');
			$('#fatherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#fatherPAN').val()!=''){
			$('#fatherLname').css('border-color','red');
			$('#fatherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#workprofessionFather').val()!='0'){
			$('#fatherLname').css('border-color','red');
			$('#fatherLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else{
			$('#fatherLname').css('border-color','grey');
			$('#fatherLname').removeAttr('title');
			
		}
		
		if($('#motherInLawLname').val()!==''){
			$('#motherInLawLname').css('border-color','grey');
			$('#motherInLawLname').removeAttr('title');
		}else if($('#motherInLawDob').val()!=''){
			$('#motherInLawLname').css('border-color','red');
			$('#motherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}else if($('#motherInLawName').val()!=''){
			$('#motherInLawLname').css('border-color','red');
			$('#motherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#motherInLawPAN').val()!=''){
			$('#motherInLawLname').css('border-color','red');
			$('#motherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#workprofessionMotherInLow').val()!='0'){
			$('#motherInLawLname').css('border-color','red');
			$('#motherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else{
			$('#motherInLawLname').css('border-color','grey');
			$('#motherInLawLname').removeAttr('title');
			
		}
		
		if($('#fatherInLawLname').val()!==''){
			$('#fatherInLawLname').css('border-color','grey');
			$('#fatherInLawLname').removeAttr('title');
		}else if($('#fatherInLawDob').val()!=''){
			$('#fatherInLawLname').css('border-color','red');
			$('#fatherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}else if($('#fatherInLawName').val()!=''){
			$('#fatherInLawLname').css('border-color','red');
			$('#fatherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#fatherInLawPAN').val()!=''){
			$('#fatherInLawLname').css('border-color','red');
			$('#fatherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#workprofessionFatherInLow').val()!='0'){
			$('#fatherInLawLname').css('border-color','red');
			$('#fatherInLawLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else{
			$('#fatherInLawLname').css('border-color','grey');
			$('#fatherInLawLname').removeAttr('title');
			
		}
		
		if($('#HUFLname').val()!==''){
			$('#HUFLname').css('border-color','grey');
			$('#HUFLname').removeAttr('title');
		}else if($('#HUFDob').val()!=''){
			$('#HUFLname').css('border-color','red');
			$('#HUFLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}else if($('#HUFName').val()!=''){
			$('#HUFLname').css('border-color','red');
			$('#HUFLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#HUFPAN').val()!=''){
			$('#HUFLname').css('border-color','red');
			$('#HUFLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else if($('#workprofessionHuf').val()!='0'){
			$('#HUFLname').css('border-color','red');
			$('#HUFLname').attr('title', 'Please Enter Last Name.');
			isValidated=false;
		}
		else{
			$('#HUFLname').css('border-color','grey');
			$('#HUFLname').removeAttr('title');
			
		}
		var familyMemberXml="";
		$('input[name="childname"]').each(function(i,obj) {
			var isValidRow=true;
			id=$(obj).attr('id');
			count=id.substring(id.indexOf('childname')+9);
			var firstName = $('#childLname'+count).val();
			var name=$(obj).val();
			var panNo=$('#childPAN'+count).val();
			var dob=$('#childDob'+count).val();
			var age=$('#childage'+count).val();
			var partyId=$('#partyIdchild'+count).val();
			var workprofession =$('#childRow'+count + ' #workprofession ').val();
			
			if(age=='' || age==undefined)
				age=0;
			if(firstName!==''){
				isValidRow=true;
				$('#childLname'+count).css('border-color','grey');
				$('#childLname'+count).removeAttr('title');
			}else if(dob!='' && dob!=undefined){
				$('#childLname'+count).css('border-color','red');
				$('#childLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}else if(name!=''){
				$('#childLname'+count).css('border-color','red');
				$('#childLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}
			else if(panNo!=''){
				$('#childLname'+count).css('border-color','red');
				$('#childLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}
			else if(workprofession!='0'){
				$('#childLname'+count).css('border-color','red');
				$('#childLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}
			else{
				$('#childLname'+count).css('border-color','grey');
				$('#childLname'+count).removeAttr('title');
				
			}
			var isChilSelectedFromContact = $('#childSelectedFromContact'+count).val();
			
			if(isValidRow==true && $.trim(firstName)!==''){
				if(isChilSelectedFromContact==undefined || isChilSelectedFromContact=='undefined')
					{
					isChilSelectedFromContact=false;
					}
				familyMemberXml+='<FamilyMember>';
				familyMemberXml+='<RelationshipId>26002</RelationshipId>';
				familyMemberXml+='<Name>'+name+'</Name>';
				familyMemberXml+='<PanNo>'+panNo+'</PanNo>';
				familyMemberXml+='<DOB>'+dob+'</DOB>';
				familyMemberXml+='<Age>'+age+'</Age>';
				familyMemberXml+='<PartyId>'+partyId+'</PartyId>';
				familyMemberXml+='<selectedFromContact>'+isChilSelectedFromContact+'</selectedFromContact>';
				familyMemberXml+='<WorkProfession>'+workprofession+'</WorkProfession>';
				familyMemberXml+='<LName>'+firstName+'</LName>';
				familyMemberXml+='</FamilyMember>';
								
				if(partyId==0)
					{
					
					}
				else{
					partyIdArray.push(partyId);
				}
				
			}else if(isValidRow==false){
				isValidated=false;
			}
			
		});
		count=0;
		$('input[name="sibblingname"]').each(function(i,obj) {
			var isValidRow=true;
			id=$(obj).attr('id');
			
			count=id.substring(id.indexOf('sibblingname')+12);
			var name=$(obj).val();
			var firstName = $('#sibblingLname'+count).val();
			var panNo=$('#sibblingPAN'+count).val();
			var dob=$('#sibblingDob'+count).val();
			var age=$('#sibblingage'+count).val();
			var partyId=$('#partyIdsibbling'+count).val();
			var workprofession =$('#sibblingRow'+count + ' #workprofession ').val();
			
			if(age=='' || age==undefined)
				age=0;
			if(firstName!==''){
				isValidRow=true;
				$('#sibblingLname'+count).css('border-color','grey');
				$('#sibblingLname'+count).removeAttr('title');
			}else if(dob!='' && dob!=undefined){
				$('#sibblingLname'+count).css('border-color','red');
				$('#sibblingLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}else if(name!=''){
				$('#sibblingLname'+count).css('border-color','red');
				$('#sibblingLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}
			else if(panNo!=''){
				$('#sibblingLname'+count).css('border-color','red');
				$('#sibblingLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}
			else if(workprofession!='0'){
				$('#sibblingLname'+count).css('border-color','red');
				$('#sibblingLname'+count).attr('title', 'Please Enter Last Name.');
				isValidRow=false;
			}
			else{
				$('#sibblingLname'+count).css('border-color','grey');
				$('#sibblingLname'+count).removeAttr('title');
				
			}
			var isSibblingSelectedFromContact = $('#sibblingSelectedFromContact'+count).val();
			if(isValidRow==true && $.trim(firstName)!==''){
				if(isSibblingSelectedFromContact==undefined || isSibblingSelectedFromContact=='undefined')
				{
					isSibblingSelectedFromContact=false;
				}
				familyMemberXml+='<FamilyMember>';
				familyMemberXml+='<RelationshipId>26004</RelationshipId>';
				familyMemberXml+='<Name>'+name+'</Name>';
				familyMemberXml+='<PanNo>'+panNo+'</PanNo>';
				familyMemberXml+='<DOB>'+dob+'</DOB>';
				familyMemberXml+='<Age>'+age+'</Age>';
				familyMemberXml+='<PartyId>'+partyId+'</PartyId>';
				familyMemberXml+='<selectedFromContact>'+isSibblingSelectedFromContact+'</selectedFromContact>';
				familyMemberXml+='<WorkProfession>'+workprofession+'</WorkProfession>';
				familyMemberXml+='<LName>'+firstName+'</LName>';
				familyMemberXml+='</FamilyMember>';
				isIndextOf=partyIdArray.indexOf(partyId);
				
				if(partyId==0)
					{
					
					}
				else{
					partyIdArray.push(partyId);
				}
			
			}else if(isValidRow==false){
				isValidated=false;
			}
			
		});
		var isselectedSpouse=$('#spouseSelectedFromContact').val();
		if(isValidated==true){
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26001</RelationshipId>';			
			familyMemberXml+='<Name>'+$('#spouseName').val()+'</Name>';
			familyMemberXml+='<PanNo>'+$('#spousePAN').val()+'</PanNo>';
			familyMemberXml+='<DOB>'+$('#spouseDob').val()+'</DOB>';
			familyMemberXml+='<Age>'+$('#spouseAge').val()+'</Age>';
			familyMemberXml+='<PartyId>'+$('#spousePartyId').val()+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+isselectedSpouse+'</selectedFromContact>';	
			familyMemberXml+='<WorkProfession>'+$('#workprofessionSpouse').val()+'</WorkProfession>';
			familyMemberXml+='<LName>'+$('#spouseLname').val()+'</LName>';
			familyMemberXml+='</FamilyMember>';
					
		if($('#spousePartyId').val()==0)
					{
					
					}
				else{
					partyIdArray.push($('#spousePartyId').val());
				}
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26011</RelationshipId>';
			familyMemberXml+='<Name>'+$('#motherName').val()+'</Name>';
			familyMemberXml+='<PanNo>'+$('#motherPAN').val()+'</PanNo>';
			familyMemberXml+='<DOB>'+$('#motherDob').val()+'</DOB>';
			familyMemberXml+='<Age>'+$('#motherAge').val()+'</Age>';
			familyMemberXml+='<PartyId>'+$('#motherPartyId').val()+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+$('#motherSelectedFromContact').val()+'</selectedFromContact>';	
			familyMemberXml+='<WorkProfession>'+$('#workprofessionMother').val()+'</WorkProfession>';
			familyMemberXml+='<LName>'+$('#motherLname').val()+'</LName>';
			familyMemberXml+='</FamilyMember>';
						
			if($('#motherPartyId').val()==0)
			{
			
			}
		else{
			partyIdArray.push($('#motherPartyId').val());
		}
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26010</RelationshipId>';
			familyMemberXml+='<Name>'+$('#fatherName').val()+'</Name>';
			familyMemberXml+='<PanNo>'+$('#fatherPAN').val()+'</PanNo>';
			familyMemberXml+='<DOB>'+$('#fatherDob').val()+'</DOB>';
			familyMemberXml+='<Age>'+$('#fatherAge').val()+'</Age>';
			familyMemberXml+='<PartyId>'+$('#fatherPartyId').val()+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+$('#fatherSelectedFromContact').val()+'</selectedFromContact>';	
			familyMemberXml+='<WorkProfession>'+$('#workprofessionFather').val()+'</WorkProfession>';
			familyMemberXml+='<LName>'+$('#fatherLname').val()+'</LName>';
			familyMemberXml+='</FamilyMember>';
		
			if($('#fatherPartyId').val()==0)
			{
			
			}
		else{
			partyIdArray.push($('#fatherPartyId').val());
		}
			
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26005</RelationshipId>';
			familyMemberXml+='<Name>'+$('#motherInLawName').val()+'</Name>';
			familyMemberXml+='<PanNo>'+$('#motherInLawPAN').val()+'</PanNo>';
			familyMemberXml+='<DOB>'+$('#motherInLawDob').val()+'</DOB>';
			familyMemberXml+='<Age>'+$('#motherInLawAge').val()+'</Age>';
			familyMemberXml+='<PartyId>'+$('#motherInLawPartyId').val()+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+$('#motherInLawSelectedFromContact').val()+'</selectedFromContact>';	
			familyMemberXml+='<WorkProfession>'+$('#workprofessionMotherInLow').val()+'</WorkProfession>';
			familyMemberXml+='<LName>'+$('#motherInLawLname').val()+'</LName>';
			familyMemberXml+='</FamilyMember>';
			
			if($('#motherInLawPartyId').val()==0)
			{
			
			}
		else{
			partyIdArray.push($('#motherInLawPartyId').val());
		}

			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26014</RelationshipId>';
			familyMemberXml+='<Name>'+$('#fatherInLawName').val()+'</Name>';
			familyMemberXml+='<PanNo>'+$('#fatherInLawPAN').val()+'</PanNo>';
			familyMemberXml+='<DOB>'+$('#fatherInLawDob').val()+'</DOB>';
			familyMemberXml+='<Age>'+$('#fatherInLawAge').val()+'</Age>';
			familyMemberXml+='<PartyId>'+$('#fatherInLawPartyId').val()+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+$('#fatherInlowSelectedFromContact').val()+'</selectedFromContact>';	
			familyMemberXml+='<WorkProfession>'+$('#workprofessionFatherInLow').val()+'</WorkProfession>';
			familyMemberXml+='<LName>'+$('#fatherInLawLname').val()+'</LName>';
			familyMemberXml+='</FamilyMember>';
			if($('#fatherInLawPartyId').val()==0)
			{
			
			}
		else{
			partyIdArray.push($('#fatherInLawPartyId').val());
		}
			familyMemberXml+='<FamilyMember>';
			familyMemberXml+='<RelationshipId>26015</RelationshipId>';
			familyMemberXml+='<Name>'+$('#HUFName').val()+'</Name>';
			familyMemberXml+='<PanNo>'+$('#HUFPAN').val()+'</PanNo>';
			familyMemberXml+='<DOB>'+$('#HUFDob').val()+'</DOB>';
			familyMemberXml+='<Age>'+$('#HUFAge').val()+'</Age>';
			familyMemberXml+='<PartyId>'+$('#HUFPartyId').val()+'</PartyId>';
			familyMemberXml+='<selectedFromContact>'+$('#hufSelectedFromContact').val()+'</selectedFromContact>';	
			familyMemberXml+='<WorkProfession>'+$('#workprofessionHuf').val()+'</WorkProfession>';
			familyMemberXml+='<LName>'+$('#HUFLname').val()+'</LName>';
			familyMemberXml+='</FamilyMember>';
		
			
			if($('#HUFPartyId').val()==0)
			{
			
			}
		else{
			partyIdArray.push($('#HUFPartyId').val());
		}
			iValidateDuplicateParty=checkIfArrayIsUnique(partyIdArray);
			if(iValidateDuplicateParty==true)
				{
				showAlertMessage("Error", "<br/>Duplicate Family Member Selected.", "error", doNothing);	
				return ;
				}
			console.log('familyMemberXml:---'+familyMemberXml);
			$('#familyMemberXML').removeAttr('disabled');
			$('#familyMemberXML').val(familyMemberXml);
			
			
			showAlertMessage1("Message","The Assets and Goals of this Family Member will also get deleted. Are you sure, you want to delete them?", 'question', doNothing1);
			$('.ZebraDialog_Button1').attr('href','javascript:deleteFamilyMemberTrue()');
			$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
// 			$.ajax({
// 				type : "POST",
// 				url : $('#contextPath').val()+'/'+actionName,
// 				data:$('#familyMemberDetailsForm').serialize(),
// 				success : function(result) {
// 					var recordCount=result[0];
// 					var isPanExist=result[1];
// 					var isFamilyMemberPresent=result[2];
// 					if(recordCount==1){
// 						showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
// 						setTimeout(function(){
// 							disableClientDiv("familyDetailsForm");
// 							  foo();
// 							},3000);
// 					}
// 					else if(isPanExist==1){
// 	            		showAlertMessage("Error","This PAN No. already exist in system. Please enter different PAN No.", 'error', doNothing);
// 	            	}
// 					else if(isFamilyMemberPresent==1)
// 					{
// 					showAlertMessage("Error","You can not delete this family member as some goals are mapped to this member. You need to first remove those goals and then you can delete this member.", 'error', doNothing);
// 					}
// 					disableClientDiv1(sectionId);
// 				}
// 			});
		}
		
 	} else if(sectionId=='operationalDetailsForm'){
 		sectionName="OperationalDetails";
		actionName="client/saveClientProfile.htm?partyId="+partyId+'&sectionName='+sectionName;
		formId="operationalDetailsForm";
		var offeringsXML='<Root>';
		$('input[name="offering"]').each(function() {
			var id=$(this).attr('id');
			id=id.substring(id.indexOf('offering')+8);
			if ($(this).is(':checked')) {
				offeringsXML+='<Attribute>';
				offeringsXML+='<AttributeCodeId>'+id+'</AttributeCodeId>';
				offeringsXML+='<AttributeCodeValue>1</AttributeCodeValue>';
				offeringsXML+='</Attribute>';
			}else{
				offeringsXML+='<Attribute>';
				offeringsXML+='<AttributeCodeId>'+id+'</AttributeCodeId>';
				offeringsXML+='<AttributeCodeValue>0</AttributeCodeValue>';
				offeringsXML+='</Attribute>';
			}
		});
		offeringsXML+='</Root>';
		$('#offeringsXML').val(offeringsXML);
 		
 	} else if(sectionId=='notesDetails'){
 		sectionName="notesDetails";
		isValidated=validateInputForm(sectionId);
		actionName="client/saveClientProfile.htm?partyId="+partyId+'&sectionName='+sectionName;
		formId="notesDetailsForm";
 	} else if(sectionId=='documentsDetails'){
 		sectionName="documentsDetails";
		isValidated=validateInputForm(sectionId);
		actionName="client/saveClientProfile.htm?partyId="+partyId+'&sectionName='+sectionName;
		formId="documentsDetails";
 	} else if(sectionId=='interestedFPDetails'){
		
		sectionName="InterestedFPDetails";		
		actionName="client/saveClientProfile.htm?partyId="+partyId+'&sectionName='+sectionName;
		isValidated=validateInputForm(sectionId);
		formId="interestFPForm";

		var interestedFpXML='';
		var attributeCodeIds="";
		$('input[name="interestedFP"]').each(function() {
			var id=$(this).attr('id');
			id=id.substring(id.indexOf('interestedFP')+12);
			
			if ($(this).is(':checked')) {
				attributeCodeIds+=id+",";
			}
			else{

			}
			
		});
		if(attributeCodeIds!=''){
			attributeCodeIds=attributeCodeIds.substring(0,attributeCodeIds.lastIndexOf(','));
		}
		interestedFpXML+='<Attribute>';
		interestedFpXML+='<AttributeCodeId>91115</AttributeCodeId>';
		interestedFpXML+='<AttributeCodeValue>'+attributeCodeIds+'</AttributeCodeValue>';
		interestedFpXML+='</Attribute>';		
		if(attributeCodeIds!=''){
			$('#interestedFpXML').val(interestedFpXML);	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName,
			data:$('#interestFPForm').serialize(),
			success : function(result) {		
				var record=result[0];
				if(record==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
				}
				else{
					
				}
				disableClientDiv1(sectionId);
			}
		});
		}
		
		console.log('interestedFpXML---------'+interestedFpXML);		
	}
 	else if(sectionId=='healthHistoryDetails'){
 		sectionName="HealthHistoryDetails";
		actionName="client/saveClientProfile.htm?partyId="+partyId+'&sectionName='+sectionName;
		var healthXML='<Root>';
		$('select[name="healthoption"]').each(function() {
			healthXML+='<Attribute>';
			healthXML+='<AttributeCodeId>'+$(this).attr('id')+'</AttributeCodeId>';
			healthXML+='<AttributeCodeValue>'+$(this).val()+'</AttributeCodeValue>';
			healthXML+='</Attribute>';
		});
		$('input[name="healthoption"]').each(function() {
			healthXML+='<Attribute>';
			healthXML+='<AttributeCodeId>'+$(this).attr('id')+'</AttributeCodeId>';
			healthXML+='<AttributeCodeValue>'+$(this).val()+'</AttributeCodeValue>';
			healthXML+='</Attribute>';
		});
		healthXML+='</Root>';
		$('#healthXML').val(healthXML);
		$('#healthXML').removeAttr('disabled');
		formId='healthHistoryForm';
 	} 
 	
 	else if(sectionId=='assumptionsDetails'){
 		sectionName="AssumptionDetails";
		actionName="common/saveAdviceAssumption.htm?partyId="+partyId+'&recordTypeId=14006';
		formId="assumptionXMLFORM";
		$('#assumptionsDetails input[type="text"]').each(function() {
				var id=$(this).attr('id');
				var left=parseFloat($('#'+id+'left').html());
				var right=parseFloat($('#'+id+'right').html());
				var value=parseFloat($('#'+id).val());
				if(value<left ||value>right  || isNaN(value)){
					isValidated=false;
					addCssStyles(id, "Please enter value in range.");
				}else{
					removeCssStyles(id);
				}
		});
		if(isValidated==true){
			var dataXML='<Root>';
			$(assumptionList).each(function(i,obj) {
				var assumptionCodeId=obj.assumptionCodeId;
				var assumptionValue=$('#assumption'+assumptionCodeId).val();
				var valueDataTypeId=obj.valueDataTypeId;
				var displayLabel=obj.displayLabel;
				var valueEndRange=obj.valueEndRange;
				var valueStartRange=obj.valueStartRange;
				var id=obj.id;
				dataXML+='<Assumption>';
					dataXML+='<AssumptionCodeId>'+assumptionCodeId+'</AssumptionCodeId>';
					dataXML+='<AssumptionValue>'+assumptionValue+'</AssumptionValue>';
					dataXML+='<ValueDataTypeId>'+valueDataTypeId+'</ValueDataTypeId>';
					dataXML+='<DisplayLabel>'+displayLabel+'</DisplayLabel>';
					dataXML+='<ValueEndRange>'+valueEndRange+'</ValueEndRange>';
					dataXML+='<ValueStartRange>'+valueStartRange+'</ValueStartRange>';
					if(obj.recordTypeId==14006){
						dataXML+='<Id>'+id+'</Id>';
					}else{
						dataXML+='<Id>0</Id>';
					}
					
				dataXML+='</Assumption>';
			});
			dataXML+='</Root>';
			console.log('dataXML:---'+dataXML)
			$('#assumptionDataXML').val(dataXML);
			$('#assumptionDataXML').removeAttr('disabled');
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/'+actionName,
				data:$('#'+formId).serialize(),
				success : function(result) {
					if(result==true){
						showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
					}					
				}
			});
		}else{
			showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
		}
 	}
	
	if((isValidated==true) && (sectionId!='contactDetails' && sectionId!='familyDetailsForm' && sectionId!='notesDetails' && sectionId!='documentsDetails' && sectionId!='assumptionsDetails' && sectionId!='interestedFPDetails')){
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName,
			data:$('#'+formId).serialize(),
			success : function(result) {
				var recordCount=result[0];
				var isPanExist=result[1];	
				
				if(recordCount==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
					disableClientDiv1(sectionId);
				}	
				else if(isPanExist=='1'){
            		showAlertMessage("Error","This PAN No. already exist in system. Please enter different PAN No.", 'error', doNothing);
            	}				
			}
		});
	}else if(isValidated==true && sectionId=='contactDetails'){	
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName,
			
			data:$('#'+formId).serialize(),
			success : function(result) {
				var recordCount=result[0];
				var isPanExist=result[1];	
				
				if(recordCount==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
				}
				
				disableClientDiv1(sectionId);
			}
		});
	}else if(isValidated==true && sectionId=='notesDetails'){
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName+'?sectionName='+sectionName,
			data:$('#'+formId).serialize(),
			success : function(result) {
				if(result==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
				}
				
				disableClientDiv1(sectionId);
			}
		});
	}else if(isValidated==true && sectionId=='documentsDetails'){
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName+'?sectionName='+sectionName,
			data:$('#'+formId).serialize(),
			success : function(result) {
				if(result==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
				}
				
				disableClientDiv1(sectionId);
			}
		});
	}
}

function deleteFamilyMemberTrue(){
	var partyId=$('#partyIdFromRequest').val();
	var message = "Family Member successfully deleted.";	
	var sectionId='familyDetailsForm';
	isValidated=validateInputForm(sectionId);
	sectionName="FamilyDetails";	
	actionName="opportunity/saveOpportunityProfileFamilyMemberData.htm?partyId="+partyId+'&sectionName='+sectionName;
	
	setTimeout(function() {
		$.ajax({
			type : 'POST',
			url : $('#contextPath').val()+'/'+actionName,
			data:$('#familyMemberDetailsForm').serialize(),
			success : function(result) {
// 				alert(result);
				var recordCount=result[0];
// 				alert('deleteFamilyMemberTrue--'+recordCount);
				if(recordCount==1){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
				}else if(isPanExist==1){
	            		showAlertMessage("Error","This PAN No. already exist in system. Please enter different PAN No.", 'error', doNothing);
	            }
				
				else{
					showAlertMessage1("Error",
							"The connection to the server has been lost. Please try again later.",
							"error", doNothing);
				}
				disableClientDiv1(sectionId);				
			}
		});
	}, 3000);
}


function showClientPopup(partyId,Id){
	if(isEditFamilyMember==1){
	
	var searchString="";
	var isFromProfile=true;
	partyId=$('#partyIdFromRequest').val();
	  openPopupWebApp('centerLoadingImage', 25, 35);

	var name;
		$.ajax({
		  url: $('#contextPath').val()+"/et/quickSearchContacts.htm?searchString="+searchString,
		  method:"post",
		  success:function(result){
			  $('#contactsDetails').empty();
			  $('#contactsDetails').append('<thead> <tr> <th class="thead">Select</th> <th class="thead"> <a href="#">First Name</a></th> <th class="thead"> <a href="#">Last Name</a></th><th class="thead"><a href="#">Pan No</a></th>  <th class="thead"> <a href="#">DOB</a></th><th class="thead"><a href="#">Age </a></th> </tr></thead>');
			  $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyId;
					name=obj.name;
					var fname = obj.fName;
					var lname = obj.lName;
					var name=fname +','+lname
					var panno=obj.panNo;
					var dob=obj.dob;
					var age=obj.age;
					var recordTypeId=obj.recordTypeId;
					//alert('')
					if(panno=='')
			  		{
						panno='0';	
			  		}
					if(dob=='')
						{
						dob='0'
						}
					if(age=='')
			  		{
						age='0'	
			  		}
					var contactIcon;
					var title;
					if(recordTypeId==14005)
					{
						contactIcon="opportunityicon";
						title="Opportunity";
					}
				else if(recordTypeId==14006)
					{
					contactIcon="pclienticon";
					title="Client";
					}
				else{
					contactIcon="clienticon";
					title="PremiumClient"
				}
					$('#contactsDetails').append('<tbody>');
					$('#contactsDetails').append("<tr><td><span class='thead'><a href='#' title='"+name+"' name='"+dob+"' id='"+panno+"'  onclick='showSelectedContactDetails("+Id+","+obj.partyId+",title,id,name,"+obj.age+");'>Select</a></td> <td ><i class="+contactIcon+" title="+title+"></i>"+fname+"</td> <td>"+lname+"</td> <td>"+obj.panNo+"</td> <td>"+obj.dob+"</td> <td>"+obj.age+"</td> </tr>");
					
					$('#contactsDetails').append('</tbody>');
					
			 }); 
			$('#rowId').val(Id) ;
				
		  }
		});
	openClientPopup();
	}
	
}
function showSelectedContactDetails(rowId,partyid,name,panno,dob,age)
{
	var nameArray =new Array();
	
	nameArray= name.split(',');
var fname= nameArray[0];
	var lname= nameArray[1];
	cloeseClientPopup();
	enableClientDiv("familyDetailsForm");
	if(dob==0 || dob=='0')
		{
		dob="";
		}
	if(panno==0 || panno=='0')
	{
		panno="";
	}
	if(panno==0 || panno=='0')
	{
		panno="";
	}
	if(age==0 || age=='0')
	{
		age="";
	}
var isChild= false;
var isSibaling=false
var childCounter;
var siblingCounter;
var abc=$('#rowId').val().substring(11,12);
if($('#rowId').val().contains("lookupchild"))
	{
	isChild=true;
	childCounter=$('#rowId').val().substring(11,12);
	}
	if($('#rowId').val().contains("lookupsibbling"));
	{
	isSibaling=true;
	siblingCounter=$('#rowId').val().substring(14,15);
	}
	var rowId = $('#rowId').val();
	if(rowId=='spouseName'){
		$('#spouseDob').val(dob);
		$('#spouseName').val(fname);
		$('#spouseLname').val(lname)
		$('#spousePAN').val(panno);
		$('#spouseAge').val(age);
		$('#spousePartyId').val(partyid);
		$('#spouseSelectedFromContact').val(true);
		disebleRow(rowId)
	}
	else if(rowId=='lookupmother'){
		$('#motherDob').val(dob);
		$('#motherName').val(fname);
		$('#motherLname').val(lname)
		$('#motherPAN').val(panno);
		$('#motherAge').val(age);
		$('#motherPartyId').val(partyid);
		$('#motherSelectedFromContact').val(true);
		disebleRow(rowId)
	}
	
	else if(rowId=='father')
	{
	$('#fatherName').val(fname);
	$('#fatherLname').val(lname);
	$('#fatherPAN').val(panno);
	$('#fatherAge').val(age);
	$('#fatherDob').val(dob);
	$('#fatherPartyId').val(partyid);
	$('#fatherSelectedFromContact').val(true);
	}
else if(rowId=='motherInLaw')
{
	$('#motherInLawName').val(fname);
	$('#motherInLawLname').val(lname)
	$('#motherInLawPAN').val(panno);
	$('#motherInLawAge').val(age);
	$('#motherInLawDob').val(dob);
	$('#motherInLawPartyId').val(partyid);
	$('#motherInLawSelectedFromContact').val(true);
	disebleRow(rowId)
}
else if(rowId=='fatherInLaw')
{
	$('#fatherInLawName').val(fname);
	$('#fatherInLawLname').val(lname);
	$('#fatherInLawPAN').val(panno);
	$('#fatherInLawAge').val(age);
	$('#fatherInLawDob').val(dob);
	$('#fatherInLawPartyId').val(partyid);
	$('#fatherInlowSelectedFromContact').val(true);
	disebleRow(rowId)
}
else if(rowId=='huf')
	{
	$('#HUFName').val(fname);
	$('#HUFLname').val(lname);
	$('#HUFPAN').val(panno);
	$('#HUFAge').val(age);
	$('#HUFDob').val(dob);
	$('#HUFPartyId').val(partyid);
	$('#hufSelectedFromContact').val(true);
	disebleRow(rowId)
	}
	else if(isChild==true)
		{
		$('#childname'+childCounter).val(fname)
		$('#childLname'+childCounter).val(lname)
		$('#childPAN'+childCounter).val(panno)
		$('#childDob'+childCounter).val(dob)
		$('#childage'+childCounter).val(age)
		$('#partyIdchild'+childCounter).val(partyid)
		$('#childSelectedFromContact'+childCounter).val(true);
		disebleMultipleRow(childCounter,isChild,'child')
		}
	else if(isSibaling==true)
	{
	$('#sibblingname'+siblingCounter).val(fname);
	$('#sibblingLname'+siblingCounter).val(lname);
	$('#sibblingPAN'+siblingCounter).val(panno);
	$('#sibblingDob'+siblingCounter).val(dob);
	$('#sibblingage'+siblingCounter).val(age);
	$('#partyIdsibbling'+siblingCounter).val(partyid);
	$('#sibblingSelectedFromContact'+siblingCounter).val(true);
	disebleMultipleRow(siblingCounter,isSibaling,'sibling')
	}
}
function disebleRow(rowId)
{
	if(rowId=='spouseName'){
		$('#spouseDob').attr('disabled','disabled');
		$('#spouseName').attr('disabled','disabled');
		$('#spouseLname').attr('disabled','disabled');
		$('#spousePAN').attr('disabled','disabled');
		$('#spouseAge').attr('disabled','disabled');
	}
	else if(rowId=='lookupmother'){
		$('#motherDob').attr('disabled','disabled');
		$('#motherName').attr('disabled','disabled');
		$('#motherLname').attr('disabled','disabled');
		$('#motherPAN').attr('disabled','disabled');
		$('#motherAge').attr('disabled','disabled');
		
	}
	else if(rowId=='father')
	{
	$('#fatherName').attr('disabled','disabled');
	$('#fatherPAN').attr('disabled','disabled');
	$('#fatherLname').attr('disabled','disabled');
	$('#fatherAge').attr('disabled','disabled');
	$('#fatherDob').attr('disabled','disabled');

	}
else if(rowId=='motherInLaw')
{
	$('#motherInLawName').attr('disabled','disabled');
	$('#motherInLawPAN').attr('disabled','disabled');
	$('#motherInLawLname').attr('disabled','disabled');
	$('#motherInLawAge').attr('disabled','disabled');
	$('#motherInLawDob').attr('disabled','disabled');
		
}
else if(rowId=='fatherInLaw')
{
	$('#fatherInLawName').attr('disabled','disabled');
	$('#fatherInLawPAN').attr('disabled','disabled');
	$('#fatherInLawLname').attr('disabled','disabled');
	$('#fatherInLawAge').attr('disabled','disabled');
	$('#fatherInLawDob').attr('disabled','disabled');
	
}
else if(rowId=='huf')
	{
	$('#HUFName').attr('disabled','disabled');
	$('#HUFPAN').attr('disabled','disabled');
	$('#HUFLname').attr('disabled','disabled');
	$('#HUFAge').attr('disabled','disabled');
	$('#HUFDob').attr('disabled','disabled');

	}	
}
function disebleMultipleRow(counter,type,mRow)
{
	if(type==true && mRow=='child')
	{
	$('#childname'+counter).attr('disabled','disabled');
	$('#childLname'+counter).attr('disabled','disabled');
	$('#childPAN'+counter).attr('disabled','disabled');	
	$('#childDob'+counter).attr('disabled','disabled');
	$('#childage'+counter).attr('disabled','disabled');
	
	}
else if(type==true && mRow=='sibling')
{
$('#sibblingname'+counter).attr('disabled','disabled');

$('#sibblingLname'+counter).attr('disabled','disabled');
$('#sibblingPAN'+counter).attr('disabled','disabled');
$('#sibblingDob'+counter).attr('disabled','disabled');
$('#sibblingage'+counter).attr('disabled','disabled');
}
}
</script>
<form id="personalDetailsDivHidden" method="POST"  action="<%=request.getContextPath()%>/client/saveClientProfileData.htm">
  <input  type="hidden"   name="sectionName" value="personalDetailsDiv" />
</form>
<form id="saveNoteForm">
  <input  type="hidden" name="partyId" value="partyId" />
</form>
<%
int partyId=Integer.parseInt(request.getParameter("partyId"));

%>
<input type="hidden" id="partyIdFromRequest" value="<%=partyId%>">
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
  <input type="hidden" name="docId" id="documentIdToDownload">
</form>
<style type="text/css">
/*** Do not delete this ****/
/*#assumptionsDetailsForm .ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after{display:none}*/	
/*** Do not delete this ****/
/*.ui-slider .ui-slider-handle { background: url(${pageContext.request.contextPath}/images/${sessionScope.userSession.themeName}/slider_button.png) no-repeat; height: 25px; width: 25px; -moz-border-radius: 14px; -webkit-border-radius: 14px; border-radius: 14px; border: none; -moz-box-shadow: 2px 2px 5px 0px #7E8892; -webkit-box-shadow: 2px 2px 5px 0px #7E8892; box-shadow: 2px 2px 5px 0px #7E8892; top: -.5em; cursor: pointer; }
.ui-slider { width: 189px; background: #FFF; border: 1px solid #939EAA; height: 8px; -moz-box-shadow: 1px 1px 3px 0px #BEBEBE inset; -webkit-box-shadow: 1px 1px 3px 0px #BEBEBE inset; box-shadow: 1px 1px 3px 0px #BEBEBE inset; -webkit-border-radius: 8px; -moz-border-radius: 8px; border-radius: 8px; margin-top: 20px; }*/
/*.range_counter { font-family: "Aller Bold"; font-size:19px!important; text-shadow: 1px 1px 0px #FFF; width: 113px!important; text-align: center; color: #9F2443; text-shadow: 0px 0px 0px #000; border: none; background: none; }
.scale_range { width: 193px; position: relative; float: left; }
.scale_range .extrem { position: absolute; color: #3e3e3a; font-size: 14px; font-family: "Verdana, Arial, Helvetica, sans-serif;"; top: -4px; }
.scale_range .low { left: -5px; }
.scale_range .high { right: -5px; }*/
/* .scale .counter_parent { position: relative; float: right; margin-top: -21px; } */
/*.scale .counter_parent:after { content: ""; height: 0px; width: 51px; position: absolute; display: block; bottom: -5px; border-bottom: 1px dashed #656561; left: 19%; }*/
</style>
<!-- 	for merge client pop up code -->
<div style="display: none;" id="blanket"></div>
<!-- <div style="display: none; width:644px; height:370px; overflow:auto;" id="popUpOpenClient" class="popUpQuery" > -->
<%--   <div class="close" style="margin-right:10px; margin-bottom:30px;"><a onClick="cloeseClientPopup()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div> --%>
  <!-- -->
   <div class="modal fade" id="popUpOpenClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Contacts</h4>
      </div>
      <div class="modal-body">
  <div class="row"><br>
    <br>
    <div class="list-group" id="changePasswordDetailsDiv" >
<!--     <a class="list-group-item active">Contacts</a> -->
      <form id="mergeClientForm" class="clearfix" style="height:350px;overflow: auto">
        <input type="hidden" name="rowId" id="rowId" value="">
        <div class="table-responsive" id="display_table_lead" style="border:none;float: left;">
          <table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="contactsDetails">
            <thead>
              <tr>
                <th class="thead">Select</th>
                <th class="thead"><a href="#">First Name</a></th>
                <th class="thead"><a href="#">Last Name</a></th>
                <th class="thead"><a href="#">Pan No</a></th>
                <th class="thead"><a href="#">DOB</a></th>
                <th class="thead"><a href="#">Age</a></th>
              </tr>
            </thead>
          </table>
        </div>
        <input type="hidden" id="basecontactPartyIdForMerge" name="basecontactPartyIdForMerge" value="${sessionScope.contactPartyIdForMerge}">
      </form>
    </div>
  </div></div></div></div></div>
<!-- </div> -->
</body>
</html>