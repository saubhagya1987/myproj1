<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Add/Edit Opportunity</title>

<script type="text/javascript">
	//bkLib.onDomLoaded(function() { nicEditors.allTextAreas();});
</script>
</head>
<body>

	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 500px; height: 400px; top: 100px"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		<div id="addnote">
			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Add Note</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px;">
					<textarea name="noteText" id="noteText" class="form-control"
						rows="5"></textarea>
				</div>
				<div class="topbuttonholder">
					<form>
						<!--         		<input type="button" class="dbtn createNewBtn" value="Add Comment" title="Add Comment" onclick="addComment()" alt="Add Comment"> -->
						<input type="button" class="dbtn" value="Save Note"
							title="Save Note" onclick="saveNote()" alt="Save Note" id="Save">
						<input class="dbtn" value="Cancel" id="Cancel" type="button">
					</form>
				</div>
			</div>
		</div>

		<!-- delete-->
		<div id="deletenote">
			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Message</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px;">Do you
					want to delete this Note?</div>
				<div class="topbuttonholder">
					<form>
						<input type="button" class="dbtn deleteBtn" value="  Delete"
							title="Delete" onclick="deleteNotes()"> <input
							class="dbtn" value="Yes" id="Yes" type="button"> <input
							class="dbtn" value="No" id="No" type="button">
					</form>
				</div>
			</div>
		</div>
		<!-- delete-->
		<!--Edit -->

		<div id="editnote">
			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Edit Note</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px;">
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
	<!--css popup window 2 close-->

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/common_popup.jsp" />
	<form id="addOpportunityForm" name="FileUploadForm"
		action="<%=request.getContextPath()%>/opportunity/saveOpportunity.htm"
		enctype="multipart/form-data" method="post">
		<input type="hidden" name="offeringsXML" id="offeringsXML"> <input
			type="hidden" id="partyIdToSend" name="partyId" />
		<div class="">
			<div class="page-header">
				<h1>Add/Edit Opportunity</h1>
			</div>
			<div class="container-body">
				<!--Personal Details Start -->
				<div class="widget-box" style="margin-top: 10px;">
					<div class="widget-header">
						<h5 class="widget-title">Personal Details</h5>
					</div>
					<div class="widget-body">
						<div class="widget-main clearfix">
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="firstname">First Name</label>
									<div class="col-sm-9">
										<input type="text" id="firstname" name="firstName"
											class="input-xxlarge" onkeyup="nospecialCharacters(id,event)"
											placeholder="First Name" />
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="lastname">Last Name<span class="red">*</span></label>
									<div class="col-sm-9">
										<input type="text" id="lastname" name="lastName" validate="1"
											emsg="Last Name" class="input-xxlarge"
											onkeyup="nospecialCharacters(id,event)"
											placeholder="Last Name" />
										<div id="lastname_error" class="help-block hide">Please
											provide a valid lastname.</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="title">Title</label>
									<div class="col-sm-9">
										<select name="salutationID" id="title" class="input-xxlarge">
										</select>
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="companyName">Company Name</label>
									<div class="col-sm-9">
										<input type="text" id="companyName" name="companyName"
											class="input-xxlarge" placeholder="Company Name">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="designation">Designation</label>
									<div class="col-sm-9">
										<input type="text" id="designation" name="workDesignation"
											class="input-xxlarge" placeholder="Designation">
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="designation">Occupation</label>
									<div class="col-sm-9">
										<select name="workProfession" id="occupation"
											class="input-xxlarge">
											<option value="0">---Select---</option>
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="designation">Marital Status</label>
									<div class="col-sm-9">
										<select name="martialStatusID" id="martialStatusID"
											class="input-xxlarge">
										</select>
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="genderID">Gender</label>
									<div class="col-sm-9">
										<select name="genderID" id="genderID" class="input-xxlarge">
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="designation">Date of Birth (Age)</label>
									<div class="col-sm-9">
										<i class="fa fa-calendar bigger-120"></i>&nbsp;&nbsp; <input
											name="dob" type="text" id="dob" validate="date"
											emsg="Date Of Birth" class="input-large"
											placeholder="Birth Date" onchange="ageCount(id);" /> <input
											type="text" id="AgeYrs" name="age" readonly
											class="input-small" placeholder="">
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="anniversaryDate">Anniversary Date</label>
									<div class="col-sm-9">
										<i class="fa fa-calendar bigger-120"></i>&nbsp;&nbsp; <input
											name="anniversaryDate" type="text" id="anniversaryDate" validate="date"
											emsg="Anniversary Date" class="input-large"
											placeholder="Anniversary Date" /> 
									</div>
								</div>
							</div>
							
							<div class="row">								
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="panNo">PAN No</label>
									<div class="col-sm-9">
										<input type="text" id="panNo" name="panNo" validate="pan"
											emsg="PAN No" class="input-xxlarge" placeholder="PAN No.">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Personal Details End -->
				<div class="space-8"></div>
				<!--Contact Details Start -->
				<div class="widget-box" style="margin-top: 10px;">
					<div class="widget-header">
						<h5 class="widget-title">Contact Details</h5>
					</div>
					<div class="widget-body">
						<div class="widget-main clearfix">
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="contactEmail">Email<span class="red">*</span></label>
									<div class="col-sm-9">
										<input type="text" id="contactEmail" name="contactEmail"
											class="input-xxlarge" validate="email" emsg="Email"
											class="form-control" placeholder="Email" />
										<div id="contactEmail_error" class="help-block hide">Please
											provide a valid email.</div>
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="mobile">Mobile</label>
									<div class="col-sm-9">
										<input type="text" id="mobile" name="mobile"
											class="input-xxlarge Number1" maxlength=10 validate="mobile"  
											class="form-control" placeholder="Mobile" />	
										<div id="mobile_error" class="help-block hide">Mobile no's length should not be less than 10 digit.</div>									
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="contactMobile2">Alternate Mobile</label>
									<div class="col-sm-9">
										<input type="text"  id="contactMobile2" name="contactMobile2"
											class="input-xxlarge Number1 form-control" maxlength=10 validate="mobile"
											placeholder="Alternate Mobile" />
										<div id="contactMobile2_error" class="help-block hide">Alternate  mobile no's length should not be less than 10 digit.</div>
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="address">Address</label>
									<div class="col-sm-9">
										<input type="text" id="address" name="address"
											class="input-xxlarge" class="form-control"
											placeholder="Address" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="country">Country</label>
									<div class="col-sm-9">
										<select name="country" id="country"
											class="input-xxlarge form-control">
										</select>
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="state">State</label>
									<div class="col-sm-9">
										<select name="state" id="state"
											class="input-xxlarge form-control"
											onchange="retrieveCityList(event,'addOpportunityForm');">
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="country">City</label>
									<div class="col-sm-9">
										<input type="text" id="city"
											class="input-xxlarge form-control" placeholder="City" /> <input
											type="hidden" name="city" id="cityHidden">
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="state">Pin Code</label>
									<div class="col-sm-9">
										<input type="text" id="pinCode" name="pinCode"
											onkeydown="allowIntegersOnly(id,event)"
											class="input-xxlarge form-control" placeholder="Pin Code" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Contact Details End -->
				<div class="space-8"></div>
				<!--Origination  Details Start -->
				<div class="widget-box" style="margin-top: 10px;">
					<div class="widget-header">
						<h5 class="widget-title">Origination Details</h5>
					</div>
					<div class="widget-body">
						<div class="widget-main clearfix">
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="campaignName">Campaign Name</label>
									<div class="col-sm-9">
										<input type="text" id="campaignName" name="campaignName"
											class="input-xxlarge form-control"
											placeholder="Campaign Name" />
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="opportunitySource">Opportunity Source</label>
									<div class="col-sm-9">
										<select name="contactSourceTypeID" id="opportunitySource"
											class="input-xxlarge form-control">
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="contactReferalName">Referred By</label>
									<div class="col-sm-9">
										<input type="text" id="contactReferalName"
											name="contactReferalName" class="input-xxlarge form-control"
											placeholder="Referred By" />
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="offerings">Interested in Offerings</label>
									<div class="col-sm-9">
										<ul class="nav  nav-stacked" id="offerings">
											<li>
                                                
                                                <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Retirement Planning</span> </label>
</div>
                                                
                                                
                                                </li>
											<li>    
                                          <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Succession Planning</span> </label>
</div>      
                                                
                                                </li>
											<li>
                                                <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Tax Planning</span> </label>
</div>      
                                                
                                                </li>
											<li>
                                                
                                                <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Mutual Funds</span> </label>
</div>      
                                                </li>
											<li>
                                                
                                                <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Life Insurance</span> </label>
</div>      
                                                
                                                </li>
											<li>
                                             <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> General Insurance</span> </label>
</div>         
                                                
                                                </li>
											<li>
                                           <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Loans</span> </label>
</div>              
                                                
                                                
                                                </li>
											<li>
                                             
                                             <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Other Value-Added Services</span> </label>
</div>                 
                                                
                                                </li>
											<li>
                                            
                                             <div class="checkbox">
  <label>
    <input name="form-field-checkbox" type="checkbox" class="ace" id="15Large" value="15Large">
    <span class="lbl"> Other Investment Products</span> </label>
</div>                    
                                                
                                                
                                                </li>
										</ul>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Origination  Details End -->
				<div class="space-8"></div>
				<!--Tracking   Details Start -->
				<div class="widget-box" style="margin-top: 10px;">
					<div class="widget-header">
						<h5 class="widget-title">Tracking Details</h5>
					</div>
					<div class="widget-body">
						<div class="widget-main clearfix">
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="opportunityStatus">Opportunity Status</label>
									<div class="col-sm-9">
										<select name="opportunityStatusID" id="opportunityStatus"
											class="input-xxlarge form-control">
										</select>
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="opportunityRating">Opportunity Rating</label>
									<div class="col-sm-9">
										<select name="opportunityRatingID" id="opportunityRating"
											class="input-xxlarge form-control">
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="opportunityStatus">Conversion Probablity</label>
									<div class="col-sm-9">
										<select name="convertProbablity" id="convertProbablity"
											class="input-xxlarge form-control">
										</select>
									</div>
								</div>
								<div class="form-group col-md-6 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="opportunityRating">Next Action</label>
									<div class="col-sm-9">
										<select name="nextActionID" id="nextAction"
											class="input-xxlarge form-control">
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Tracking   Details End -->
				<div class="space-8"></div>
				<div class="topmenu rightAlign">
					<button class="btn-primary btn btn-xs southspace1" type="button" id="saveNew"
						name="Save & New" onclick="saveOpportunity(0)">Save & New</button>
					<button class="btn btn-primary btn btn-xs southspace1" type="button" id="saveClose"
						name="Save & Close" onclick="saveOpportunity(1)">Save &
						Close</button>
					<a
						href="<%=request.getContextPath()%>/opportunity/getOpportunitiesList.htm">
						<button class="btn btn-primary btn-xs southspace1" type="button" name="Cancel">Cancel</button>
					</a>
				</div>

				<!-- center end -->
			</div>
		</div>
	</form>

	<!-- Center part End -->

	<jsp:include page="../common/footer.jsp" />
	<script>
		var userLabelValueList = new Array();
		var cityId = 0;

		function openFileDailog(id) {
			$('#' + id).click();
		}

		$(function() {
			showSelectedTab('opportunityLink');
			$
					.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/common/getPicklistValues.htm?codeTypeIds=1,2,3,4,6,5,130,8,81,65,134,12,13',
						success : function(result) {
							$('#offerings').empty();
							$(
									'#title,#state,#country,#opportunitySource,#opportunityStatus,#opportunityRating,#convertProbablity,#nextAction,#occupation,#martialStatusID,#genderID')
									.empty();
							$(
									'#title,#state,#country,#opportunitySource,#opportunityStatus,#opportunityRating,#convertProbablity,#nextAction,#occupation,#martialStatusID,#genderID')
									.append(
											'<option value="0">--Select--</option>');

							$(result)
									.each(
											function(i, obj) {

												var codeTypeId = obj.codeTypeId;
												var codeValue = obj.codeValue;
												var codevalueId = obj.codeValueId;
												// 				$('#occupation').append('<opton value="0">---Select---</option>');
												if (codeTypeId == 81) {
													$('#title')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 1) {
													$('#city')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 2) {
													$('#state')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 3) {
													$('#country')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 4) {
													$('#opportunitySource')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 6) {
													$('#opportunityStatus')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 5) {
													if(codevalueId == 5001 || codevalueId == 5002 || codevalueId == 5003){
													$('#opportunityRating')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
													}
												} else if (codeTypeId == 130) {
													$('#convertProbablity')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 8) {
													$('#nextAction')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 65) {
													$('#occupation')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 13) {
													$('#martialStatusID')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 12) {
													$('#genderID')
															.append(
																	'<option value="'+codevalueId+'">'
																			+ codeValue
																			+ '</option>');
												} else if (codeTypeId == 134) {
													$('#offerings')
															.append(
																	'<li><div class="checkbox"><label><input id="offering'+obj.mappedValue1+'" name="offering"  type="checkbox" class="ace"><span class="lbl"> '
																			+  codeValue
																			+ '</span></label></div></li><li>');
												}
											});
							try {
								$('#dob').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
							} catch (e) {
								try {
									$jq_1_9_1('#dob').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								} catch (e) {
									$jq_1_9_2('#dob').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								}
							}

							try {
								$('#anniversaryDate').datepicker({
									changeMonth : true,
									changeYear : true,
									maxDate : '0',
									yearRange : "1900:2200",
									dateFormat : "dd/mm/yy"

								});
							} catch (e) {
								try {
									$jq_1_9_1('#anniversaryDate').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								} catch (e) {
									$jq_1_9_2('#anniversaryDate').datepicker({
										changeMonth : true,
										changeYear : true,
										maxDate : '0',
										yearRange : "1900:2200",
										dateFormat : "dd/mm/yy"

									});
								}
							}
							
							var partyId = $('#partyIdFromRequest').val();
							if (partyId == 0) {

							} else {
								//alert('Hi in else');

								$
										.ajax({
											type : 'POST',
											url : $('#contextPath').val()
													+ "/opportunity/getOpportunityDetails.htm?partyId="
													+ partyId,

											success : function(result) {
												$(result)
														.each(
																function(i, obj) {

																	var firstName = obj.firstName;
																	var lastName = obj.lastName;
																	var title = obj.salutationID;
																	var companyName = obj.companyName;
																	var designation = obj.designation;
																	var occupation = obj.occupation;
																	
																	var dob = obj.dob;
																	var anniversaryDate = obj.anniversaryDate;
																	var age = obj.age;
																	var panNo = obj.panNo;
																						    
																	var contactEmail = obj.contactEmail;
																	
																	var mobile = obj.mobile;
																	var contactMobile2 = obj.contactMobile2;
																	var martialStatusId = obj.martialStatusID;
																	var genderId = obj.genderID;
																	var campaignName = obj.campaignName;
																	var contactSourceTypeID = obj.contactSourceTypeID;
																	var contactReferalName = obj.contactReferalName;
																	// 					    alert(contactReferalName)
																	var opportunityStatusID = obj.opportunityStatusID;
																	var opportunityRatingID = obj.opportunityRatingID;
																	var convertProbablity = obj.convertProbablity;
																	var nextActionID = obj.nextActionID;

																	// 					    alert(martialStatusId);
																	// 					    alert(genderId);

																	$(
																			'#firstname')
																			.val(
																					firstName);
																	$(
																			'#lastname')
																			.val(
																					lastName);
																	$('#title')
																			.val(
																					title);
																	$(
																			'#companyName')
																			.val(
																					companyName);
																	$(
																			'#designation')
																			.val(
																					designation);
																	$(
																			'#occupation')
																			.val(
																					occupation);
																	$('#dob')
																			.val(
																					dob);
																	$('AgeYrs')
																			.val(
																					age);
																	$('#anniversaryDate').val(anniversaryDate);
																	
																	$('#panNo')
																			.val(
																					panNo);
																	$(
																			'#martialStatusID')
																			.val(
																					martialStatusId);
																	$(
																			'#genderID')
																			.val(
																					genderId);
																	
																//	alert("contactEmail-----"+contactEmail);
																	$('#contactEmail').val(contactEmail);
																	$('#mobile')
																			.val(
																					mobile);
																	$(
																			'#contactMobile2')
																			.val(
																					contactMobile2);

																	var addressDataList = result.addressDataList;
																	$(
																			addressDataList)
																			.each(
																					function(
																							i,
																							obj) {
																						var address = obj.street1;
																						var city = obj.city;
																						var state = obj.state1;
																						var country = obj.country1;
																						var pinCode = obj.postalCode;
																						cityId = obj.cityId;

																						$(
																								'#address')
																								.val(
																										address);
																						$(
																								'#city')
																								.val(
																										city);
																						$(
																								'#state')
																								.val(
																										state);
																						$(
																								'#country')
																								.val(
																										country);
																						$(
																								'#pinCode')
																								.val(
																										pinCode);
																					});
																	$("#city")
																			.change(
																					function() {
																						cityId = 0;
																					});
																	ageCount('dob')
																	var partyAttributeDatas = result.partyAttributeDatas;
																	$(
																			partyAttributeDatas)
																			.each(
																					function(
																							i,
																							obj) {

																						var attributeCodeId = obj.attributeCodeId;
																						var attributeCodeValue = obj.attributeValue;
																						// 							alert(attributeCodeValue)
																						if (attributeCodeValue == '1') {
																							$(
																									'#offering'
																											+ attributeCodeId)
																									.attr(
																											'checked',
																											'checked');
																						}
																					});

																	$(
																			'#campaignName')
																			.val(
																					campaignName);
																	$(
																			'#opportunitySource')
																			.val(
																					contactSourceTypeID);
																	$(
																			'#contactReferalName')
																			.val(
																					contactReferalName);
																	$(
																			'#opportunityStatus')
																			.val(
																					opportunityStatusID);
																	$(
																			'#opportunityRating')
																			.val(
																					opportunityRatingID);
																	$(
																			'#convertProbablity')
																			.val(
																					convertProbablity);
																	$(
																			'#nextAction')
																			.val(
																					nextActionID);

																});

											}
										});
								document.getElementById("saveNew").value = "Save & New";
								document.getElementById("saveClose").value = "Save & Close";
							} //end of else
						}
					});
		});

		function retrieveCityList(event, id) {
			var parentId = $('#' + id + ' #state').val();
			cityArrayList = new Array();
			$
					.ajax({
						type : "GET",
						url : $('#contextPath').val()
								+ '/common/getCityList.htm?parentId='
								+ parentId,
						success : function(result) {
							$(result).each(function(i, obj) {
								var object = {};
								object.value = obj.codeValueId;
								object.label = obj.codeValue;
								cityArrayList.push(object);
							});
							
							$('#' + id + ' #city')
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.data(
																		"ui-autocomplete").menu.active) {
													event.preventDefault();
												}
											})
									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													// delegate back to autocomplete, but extract the last term
													response($.ui.autocomplete
															.filter(
																	cityArrayList,
																	request.term));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},
												select : function(event, ui) {
													var terms = split(this.value);

													console.log('terms='
															+ terms);

													// remove the current input
													terms.pop();
													// add the selected item 
													terms.push(ui.item.label);
													cityId = ui.item.value;
													// 					alert(cityId)   
													// add placeholder to get the comma-and-space at the end
													terms.push("");
													this.value = terms.join("");

													var labelArr = $(this)
															.data('label')
															|| new Array();
													labelArr.push(ui.item);
													$(this).data('label',
															labelArr);
													console.log($(this).data());

													return false;
												}
											});
						}
					});
		}

		function saveOpportunity(isToClose) {
			var isValidated = true;
			isValidated = validateInputForm('addOpportunityForm');

			var partyId = $('#partyIdFromRequest').val();

			var res = checkSelectedUserInHierarchy();
			// 	alert('res---checkSelectedUserInHierarchy-666666--'+res);
			if (res == true) {
				if (isValidated == true) {
					//Disabled after Clieck on Save...
					$("#saveClose").attr("disabled", "disabled");

					if (cityId == 0 || cityId == undefined) {
						$('#cityHidden').val($('#city').val());
					} else {
						$('#cityHidden').val(cityId);
					}

					var offeringsXML = '<Root>';
					$('input[name="offering"]')
							.each(
									function() {
										var id = $(this).attr('id');
										id = id.substring(id
												.indexOf('offering') + 8);
										if ($(this).is(':checked')) {
											offeringsXML += '<Attribute>';
											offeringsXML += '<AttributeCodeId>'
													+ id + '</AttributeCodeId>';
											offeringsXML += '<AttributeCodeValue>1</AttributeCodeValue>';
											offeringsXML += '</Attribute>';
										} else {
											offeringsXML += '<Attribute>';
											offeringsXML += '<AttributeCodeId>'
													+ id + '</AttributeCodeId>';
											offeringsXML += '<AttributeCodeValue>0</AttributeCodeValue>';
											offeringsXML += '</Attribute>';
										}
									});
					offeringsXML += '</Root>';
					$('#offeringsXML').val(offeringsXML);
					console.log('offeringsXML---------' + offeringsXML);
					$('#partyIdToSend').val($('#partyIdFromRequest').val());
					$
							.ajax(
									{
										type : "POST",
										url : $('#contextPath').val()
												+ '/opportunity/saveOpportunity.htm',
										data : $('#addOpportunityForm')
												.serialize(),

										success : function(result) {

											var recordCount = result[0];
											var OppPartyId = result[1];
											var isPanExist = result[2];

											if (recordCount > 0) {
												if (isToClose == 1) {
													localStorage
															.setItem(
																	'actionName',
																	$(
																			'#contextPath')
																			.val()
																			+ '/opportunity/getOpportunitiesList.htm');

													showAlertMessage1(
															"Message",
															"<br/>Opportunity has saved successfully.",
															"information",
															redirectFunction);
													// 				saveClose

												} else {
													localStorage
															.setItem(
																	'actionName',
																	$(
																			'#contextPath')
																			.val()
																			+ '/addOpportunity.htm');
													showAlertMessage1(
															"Message",
															"<br/>Opportunity has saved successfully.",
															"information",
															redirectFunction);
												}

											} else if (isPanExist == '1') {
												showAlertMessage(
														"Error",
														"This PAN No. already has exist in system. Please enter different PAN No.",
														'error', doNothing);
											}
										},
										error : function(msg) {
										},
										onComplete : function(data) {
										}
									// 					}
									}).submit();

				} else {
					$
							.ajax({
								type : "POST",
								url : $('#contextPath').val()
										+ '/opportunity/getOpportunitiesList.htm',
								data : $('#addOpportunityForm').serialize(),
								success : function(result) {
									var recordCount = result[0];
									var clientPartyId = result[1];
									var isPanExist = result[2];

									if (recordCount > 0) {
										if (isToClose != 1) {
											localStorage
													.setItem(
															'actionName',
															$('#contextPath')
																	.val()
																	+ '/opportunity/getOpportunitiesList.htm');
											showAlertMessage(
													"Success",
													"<br/>Opportunity has saved successfully.",
													"confirmation",
													redirectFunction);
										} else {
											localStorage
													.setItem(
															'actionName',
															$('#contextPath')
																	.val()
																	+ '/addOpportunity.htm');
											showAlertMessage(
													"Success",
													"<br/>Opportunity has saved successfully.",
													"confirmation",
													redirectFunction);
										}
									} else if (isPanExist == '1') {
										showAlertMessage(
												"Error",
												"This PAN No. already has exist in system. Please enter different PAN No.",
												'error', doNothing);
									}
								}
							});
				}
			}
		}

		function split(val) {
			return val.split(/;\s*/);
		}

		function extractLast(term) {
			return split(term).pop();
		}

		function ageCount(id) {
			var dob = $('#' + id).val();

			var date1 = new Date();
			var dob1 = document.getElementById("dob").value.split("/");
			;
			date2 = new Date(dob1[2], dob1[1] - 1, dob1[0]);
			var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
			if (pattern.test(dob)) {
				var y1 = date1.getFullYear(); //getting current year
				var y2 = date2.getFullYear(); //getting dob year

				var age = y1 - y2; //calculating age 
				//         document.write("Age : " + age);
				$('#AgeYrs').val(getAge(date2));
				return true;
			} else {
				return false;
			}

		}

		function saveNote() {
			var isValidated = true;
			if ($('#noteText').val() == '') {
				addCssStyles('noteText', 'Please enter Note Text.');
				isValidated = false;
			} else {
				removeCssStyles('noteText');
			}
			if (isValidated == true) {

				var noteT = $('#noteText').val();
				alert('Hi..........' + noteT);
				$
						.ajax({
							type : "POST",
							url : $('#contextPath').val()
									+ '/opportunity/saveNote.htm',
							data : $('#notesDetails').serialize(),
							success : function(result) {
								alert(result);
								var noteText = result.noteText;
								var createdBy = result.createdBy;
	
								if (result == success) {
									showAlertMessage("Success",
											"<br/>Note saved successfully.",
											"confirmation", doNothing);

									$('#notesDetails').append('<tbody>');
									$('#notesDetails')
											.append(
													'<tr><td><a href="#"><img src="'
															+ $('#contextPath')
																	.val()
															+ '/images/edit.png" alt="Edit" title="Edit"></a>&nbsp;&nbsp;</td> <td><input id="205282" name="2052822" type="checkbox"></td> <td>'
															+ noteText
															+ '</td> <td>'
															+ createdBy
															+ '</td> <td>'
															+ createdDate
															+ '</td> </tr>');
									$('#notesDetails').append('</tbody>');
									// 							});
								}
								alert('No Success');
								//disableOpportunityDiv1(sectionId);
							}
						});
			} else {
				$('#notesDetailsForm').cancel();
			}
		}

		
		function deleteNotes() {
			list = new Array();
			$('#data :checked').each(function(i, obj) {
				list[i] = $(this).attr('id');
			});
			if (list.length == 0) {
				showAlertMessage1("Message",
						"Please select at least one Note to delete.",
						"information", doNothing);
			} else {
				var message = "";
				if (list.length == 1) {
					message = "Do you want to delete this Note?";
				} else {
					message = "Do you want to delete these Notes?";
				}
				showAlertMessage1("Message", "<br/>" + message, "question",
						doNothing1);
				$('.ZebraDialog_Button1').attr('href',
						'javascript:deleteNotesTrue()');
				$('.ZebraDialog_Button0')
						.attr('href', 'javascript:doNothing()');
			}
		}

		function deleteNotesTrue() {
			var message = "";
			if (list.length == 1) {
				message = "Note successfully deleted.";
			} else {
				message = "Notes successfully deleted.";
			}
			setTimeout(
					function() {
						$
								.ajax({
									type : 'POST',
									url : $('#contextPath').val()
											+ "/opportunity/deleteNote.htm?noteIds="
											+ list,
									success : function(result) {
										if (result == 'success') {
											localStorage.setItem('actionName',
													window.location.pathname);
											showAlertMessage1("Success",
													'<br/>' + message,
													"confirmation",
													redirectFunction1);

										} else {
											showAlertMessage1(
													"Error",
													"The connection to the server has been lost. Please try again later.",
													"error", doNothing);
										}

									}
								});
					}, 500);
		}

		function addNote() {
			$("#addnote").show();
			$("#deletenote, #editnote").hide();
		}

		function deleteNote() {
			$("#deletenote").show();
			$("#addnote, #editnote").hide();
		}

		function editNote() {
			$("#editnote").show();
			$("#addnote, #deletenote").hide();
		}
	</script>
	<form id="notesDetails">
		<input type="hidden" id="noteText" name="noteText">
	</form>
	<%
		String noteResult = "fail";
		int noteId = 0;
		noteResult = session.getAttribute("NoteResult") == null
				? "fail"
				: session.getAttribute("NoteResult").toString();
		noteId = session.getAttribute("NoteId") == null ? 0 : Integer
				.parseInt(session.getAttribute("NoteId").toString());
		if (noteResult.equals("success")) {
			session.setAttribute("NoteResult", "fail");
			session.setAttribute("NoteId", 0);
	%>
	<input type="hidden" id="noteResult" value="success" />
	<input type="hidden" id="noteIdToOpen" value="<%=noteId%>" />
	<%
		} else {
	%>
	<input type="hidden" id="noteResult" value="fail" />
	<input type="hidden" id="noteIdToOpen" value="0" />
	<%
		}
	%>
	<%
		String documentResult = "fail";
		int documentId = 0;
		documentResult = session.getAttribute("DocumentResult") == null
				? "fail"
				: session.getAttribute("DocumentResult").toString();
		documentId = session.getAttribute("DocumentId") == null
				? 0
				: Integer.parseInt(session.getAttribute("DocumentId")
						.toString());
		if (documentResult.equals("success")) {
			session.setAttribute("DocumentResult", "fail");
			session.setAttribute("DocumentId", 0);
	%>
	<input type="hidden" id="documentResult" value="success" />
	<input type="hidden" id="documentIdToOpen" value="<%=noteId%>" />
	<%
		} else {
	%>
	<input type="hidden" id="documentResult" value="fail" />
	<input type="hidden" id="documentIdToOpen" value="0" />
	<%
		}
	%>
	<%
		int opartyId = 0;
		try {
			opartyId = Integer.parseInt(request.getParameter("partyId")
					.toString());
			if (opartyId != 0) {
	%>
	<input type="hidden" id="partyIdFromRequest" name="partyId"
		value="<%=opartyId%>">
	<%
		}
		} catch (Exception e) {
	%>
	<input type="hidden" id="partyIdFromRequest" value="0">
	<%
		}
	%>

</body>
<script>
	$(document).ready(function() {
		$('#firstName').keypress(function(event) {

			if (event.which == 190) {
				event.preventDefault();
				//alert('Hi....' + event);
				

			}

			
		});
	});
	
// 	$('#mobile').blur(function(){
// 		if($('#mobile').val().length < 10){
// 			 //alert("Contact No's length should not be less than 10 digit.");
// 			 showAlertMessage1("Error", "Mobile no's length should not be less than 10 digit." + '\n', "confirmation", doNothing);
// 			 $('#mobile').val('');
// 			 $('#mobile').css('border','1px solid red');
// 			// $("#mobile").focus();
// 		}else{
// 			$('#mobile').css('border-color','');
// 		}
// 	}); 
// 	$('#contactMobile2').blur(function(){
// 		if($('#contactMobile2').val().length < 10){
// 			 //alert("Contact No's length should not be less than 10 digit.");
// // 			 showAlertMessage1("Error", "Alternate  mobile no's length should not be less than 10 digit." + '\n', "confirmation", doNothing);
// 			 $('#contactMobile2').val('');
// 			 $('#contactMobile2').css('border','1px solid red');
// 			 $('#contactMobile2').css('border','1px solid red');
// 			 $("#contactMobile2").focus();
// 		}else{
// 			$('#contactMobile2').css('border-color','');
// 		}
// 	}); 
	
</script>

</html>