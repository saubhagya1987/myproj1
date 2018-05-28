<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.fiinfra.common.util.FiinfraUtility"%>
	<%@page import="in.fiinfra.common.diy.models.UserSession"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en"><head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
   
<title>Partner Profile</title>
 
 <style>
.jstree .icn { width: 20px; height: 20px; display: inline-block; background: url(images/jstree.png) no-repeat 0 0 transparent }
.jstree .icn.plus { background-position: -15px -20px }
.jstree .icn.area { background-position: -2px -3px }
.jstree .icn.user { background-position: -25px -3px }
.jstree .icn.star { background-position: -50px -3px }
.jstree-default .jstree-open > .jstree-ocl { background: url(images/jstree.png) no-repeat -3px -25px transparent }
.jstree-default .jstree-closed > .jstree-ocl { background: url(images/jstree.png) no-repeat -28px -25px transparent }
.jstree-default .jstree-clicked { background: none; border-radius: 0; box-shadow: none; color: #AE2760;}
ul.jstree-container-ul { /* background: #8F8F8F;*/ overflow: hidden }
li.jstree-open > ul { /*  background: #DADADA;*/ display: block; }
li.jstree-open > ul li.jstree-open > ul { /*background: #F2F2F2;*/ position: relative; left: -24px; padding-left: 24px; width: 100%; }
.txt-bx { border: 1px solid rgb(204, 204, 204); box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px inset; width: 100%; background: none rgb(255, 255, 255); }
.jstree-container-ul{
overflow-x:auto !important; 
}
</style>
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
 <script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<script>
</script>
 	<script>
 $(document).ready(function(){	
// $('#hierarchyDiv').remove();
		try{
			$('#startDate').datepicker({
				changeMonth : true,
				changeYear : true,
				
				yearRange : "1900:2200",
				dateFormat : "d-M-yy"

			});
			}catch(e){
				try{
				$jq_1_9_1('#startDate').datepicker({
					changeMonth : true,
					changeYear : true,
					
					yearRange : "1900:2200",
					dateFormat : "d-M-yy"

				});
				}catch(e){
					$('#startDate').datepicker({
						changeMonth : true,
						changeYear : true,
						
						yearRange : "1900:2200",
						dateFormat : "d-M-yy"

					});
				}
			}
			try{
				$('#endDate').datepicker({
					changeMonth : true,
					changeYear : true,
					minDate : '0',
					yearRange : "1900:2200",
					dateFormat : "d-M-yy"

				});
				}catch(e){
					try{
					$jq_1_9_1('#endDate').datepicker({
						changeMonth : true,
						changeYear : true,
						maxDate : '0',
						yearRange : "1900:2200",
						dateFormat : "d-M-yy"

					});
					}catch(e){
						$('#endDate').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "d-M-yy"

						});
					}
				}
				try{
					$('#registrationDate').datepicker({
						changeMonth : true,
						changeYear : true,
						maxDate : '0',
						yearRange : "1900:2200",
						dateFormat : "dd/mm/yy"

					});
					}catch(e){
						try{
						$jq_1_9_1('#registrationDate').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "dd/mm/yy"

						});
						}catch(e){
							$('#registrationDate').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
						}
					}
 });</script>

 <!-- Center part start -->

	<div class="">
		<div class="container-head">
			<div class="page-header">
				<h1>Profile <small><c:choose>
					<c:when test="${sessionScope.locationName==''}">
					${sessionScope.name}
         		 </c:when>
					<c:when test="${sessionScope.name==''}">
					${sessionScope.locationName}
         		 </c:when>
					<c:otherwise>
         		 	${sessionScope.userSession.name}
         		 </c:otherwise>
				</c:choose></small></h1>
				
			</div>

		</div>

		<div class="container-body " style="padding: 5px;"></div>
		<div class="container-body">

			<!-- center -->

<div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top: 10px; padding-left: 10px;">
	<div class="list-group">
		<a class="list-group-item active" style="cursor: default;">Profile</a>
		<a class="list-group-item profiledivlink" id="personalInfoPPLink" name="personalInfoDiv" onclick="showDiv('personalInfoDiv')" style="font-weight: bold">Personal Info</a> 
		<a class="list-group-item profiledivlink" id="addressPPLink" name="addressDiv" onclick="showDiv('addressDiv')">Address</a> 
		<a class="list-group-item profiledivlink" id="bankDetailsPPLink" name="bankDetailsDiv" onclick="showDiv('bankDetailsDiv')">Bank Details</a>
		<a class="list-group-item profiledivlink" id="servicesPPLink" name="servicesDiv" onclick="showDiv('servicesDiv')">Services </a> 						
		<a class="list-group-item profiledivlink" id="financialProductPPLink" name="financialProductDiv" onclick="showDiv('financialProductDiv')">My Financial Products</a>
		<a class="list-group-item profiledivlink" id="myPersonalizationPPLink" name="myPersonalizationDiv" onclick="showDiv('myPersonalizationDiv')">My Personalization</a> 
		<a class="list-group-item profiledivlink" id="userAccountPPLink" name="userAccountDiv" onclick="showDiv('userAccountDiv')">My User Account</a> 
		<a class="list-group-item profiledivlink" id="teamMemberPPLink" name="teamMemberDiv" onclick="showDiv('teamMemberDiv')">My Assigned Service Team</a> 
		<a class="list-group-item profiledivlink" id="documentsLinkPartner" name="documentsDetailsDiv" onclick="showDiv('documentsDetailsDiv')">Documents</a> 
		<a class="list-group-item profiledivlink" id="partnerInterestedFPLink" name="partnerInterestedFPDiv" onclick="showDiv('partnerInterestedFPDiv')">Interested FP </a>
		<c:choose>
			<c:when test="${sessionScope.userSession.buId!='27829'}">
					<a class="list-group-item profiledivlink" id="subscriptionLink" name="subscriptionDiv" onclick="showSubscriptionDiv('subscriptionDiv')">My Subscriptions</a>
					<a class="list-group-item profiledivlink" id="paymentHistoryLink" name="paymentHistoryDiv" onclick="showPaymentDiv('paymentHistoryDiv')">Payment History</a>
			</c:when>
		</c:choose>
		<a class="list-group-item profiledivlink" id="mfFileUploadConfigPPLink" name="mfFileUploadConfigDiv" onclick="showPaymentDiv('mfFileUploadConfigDiv')">MF Auto Upload Configuration</a>
		<c:choose>
			<c:when	test="${sessionScope.userSession.recordtypeId!='14014' && sessionScope.userSession.partyId eq sessionScope.oldpartyId}">
				<a class="list-group-item profiledivlink" id="manageHierachyLink" name="manageHierachyLinkDiv" onclick="showDiv('manageHierachyLinkDiv')">Manage Hierarchy</a>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		<a class="list-group-item profiledivlink" id="NACHDetailPPLink" name="NACHDetailDiv" onclick="showNACHDiv('NACHDetailDiv')">Auto Payment</a>
		<a class="list-group-item olTransactionLink" id="olTransactionLink"  onclick="showDiv('onlineTransationDiv')">Online Transactions - Configuration</a>
	</div>
</div>

<div class="col-md-9" style="margin-top: 10px; padding-left: 10px;">
<!-- center -->

<!-- Personal Info start -->
<div class="list-group profiledivs" id="personalInfoDiv">
    <a class="list-group-item active"  >Personal Info </a>
 <div class="list-group-item">
      	
<div class="row">
<form id="personalInfo_1Form" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/partner/savePartnerProfilePhoto.htm">
	<input type="hidden" name="sectionName" value="PersonalInfo1" />
	<div class="col-md-4 searchpadding padding_top" style="padding: 5px;" id="personalInfo_1FormDiv">
		<img style="width: 100%; height: 100%" id="photoImage" onerror="showDefaultImageOnError(id)" src="<%=FiinfraUtility.getImagePath(request, photoPath,"images/img.png")%>"><br>
		<input type="file" name="image" id="photoFile" style="display: none"> <i class="emailicon"></i>&nbsp;
		<input type="text" size="28px" id="contactEmail" name="contactEmail" style="margin-bottom: 4px; border: none; background: none; box-shadow: none;" validate="email" emsg="Email" /><br> <i class="callicon"></i>&nbsp;
		<input type="text" size="28px" id="contactMobile" name="contactMobile" style="border: none; background: none; box-shadow: none;" onkeydown="allowIntegersOnly(id,event)" maxlength=15/><br> <i class="callicon"></i>&nbsp;
		<input type="text" size="28px" id="alternetcontact" name="alternetcontact" style="border: none; background: none; box-shadow: none;" placeholder='Enter alternate contact' onkeydown="allowIntegersOnly(id,event)" /><br>

		<div class="btn-primary btn-xs btn hide" type="button" id="cancel1" name="personalInfo_1FormDiv" onclick="savePartnerProfile('personalInfo_1FormDiv')">Save</div>
		<div class="btn-primary btn-xs btn hide" type="button" id="save1" name="personalInfo_1FormDiv" onclick="disableProfileDiv('personalInfo_1FormDiv')">Cancel</div>
		<div class="btn-primary btn-xs btn hide" type="button" id="removePhoto" name="personalInfo_1FormDiv" onclick="cancelLogo(2)">Remove Photo</div>

<a onClick="enableProfileDiv(name);" name="personalInfo_1FormDiv" id="personalInfoEditLink"	class="btn btn-xs btn-primary pull-left"> <i class="ace-icon fa fa-pencil-square-o"></i>Edit</a>
	</div>
</form>
<div class="col-md-8 searchpadding padding_top" style="padding: 5px;" id="personalInfo_2FormDiv">
	<a onClick="enableProfileDiv(name);" name="personalInfo_2FormDiv" id="personalInfo_2FormDiv" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
	</a>
	<form method="post" id="personalInfo_2Form">
		<div class="row">
			<div class="form-group col-md-12 clearfix">
					<label class="col-sm-3 control-label no-padding-right" for="salutationId">Salutation</label>
				<div class="col-sm-9">
					<select id="salutationId" style="border: none; background: none;" name="salutationId"></select>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12 clearfix">
				<label class="col-sm-3 control-label no-padding-right" for="firstName">First Name</label>
			<div class="col-sm-9">
				<input type="text" id="firstName" name="firstName" style="border: none; background: none;" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="First Name" />
			</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12 clearfix">
				<label class="col-sm-3 control-label no-padding-right" for="lastName">Last Name <span class="red">*</span></label>
			<div class="col-sm-9">
				<input type="text" id="lastName" name="lastName" style="border: none; background: none;" validate="1" emsg="Last Name" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="Last Name" />
			<div id="lastName_error" class="help-block hide">Please provide a valid last name.</div>
			</div>
			</div>
		</div>
				
		<div class="row">
			<div class="form-group col-md-12 clearfix">
				<label class="col-sm-3 control-label no-padding-right" for="companyName">Company Name</label>
				<div class="col-sm-9">
					<input name="companyName" type="text" style="border: none; background: none;" class="input-xxlarge" id="companyName" placeholder="Company Name" />
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12 clearfix">
				<label class="col-sm-3 control-label no-padding-right" for="panNo">PAN No</label>
				<div class="col-sm-9">
					<input name="panNo" type="text" style="border: none; background: none;" id="panNo" class="input-xxlarge" validate="pan" emsg="PAN No" placeholder="Pan No" />
					<div id="panNo_error" class="help-block hide">Please provide a valid PAN No.</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12 clearfix">
				<label class="col-sm-3 control-label no-padding-right" for="contactHome">Home Phone</label>
				<div class="col-sm-9">
					<input name="contactHome" type="text" style="border: none; background: none;" id="contactHome" placeholder="Home Phone" maxlength=15 class="Number1" />
				</div>
			</div>
		</div>
		
	 	<div class="row">
			<div class="form-group col-md-12 clearfix">
				<label class="col-sm-3 control-label no-padding-right" for="dob">Birth Date</label>
				<div class="col-sm-9">
					<input name="dob" type="text" id="dob" style="border: none; background: none;" validate="date" emsg="Date of Birth" />
					<div id="dob_error" class="help-block hide">Please provide a valid Date of Birth.</div>
				</div>
			</div>
	 	</div>

							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="websiteUrl">Website</label>
									<div class="col-sm-9">
										<input name="websiteUrl" type="text"
											style="border: none; background: none;" id="websiteUrl"
											placeholder="Website" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="arn">ARN</label>
									<div class="col-sm-9">
										ARN-<input name="arn" type="text"
											style="border: none; background: none;" id="arn"
											placeholder="ARN" readonly
											onkeydown="allowIntegersOnly(id,event)" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="location">Location</label>
									<div class="col-sm-9" id="location">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="euin">EUIN</label>
									<div class="col-sm-9">
										<input name="euin" type="text"
											style="border: none; background: none;" id="euin"
											placeholder="EUIN" onkeydown="allowIntegersOnly(id,event)" />
									</div>
								</div>
							</div>


							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="fbLink">Facebook Link</label>
									<div class="col-sm-9">
										<input name="fbLink" id="fbLink"
											style="border: none; background: none;" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="twitterLink">Twitter Link</label>
									<div class="col-sm-9">
										<input name="twitterLink" id="twitterLink"
											style="border: none; background: none;" />
									</div>
								</div>
							</div>

							<div class="topmenu pull-right">
								<div class="btn-primary btn-xs btn hide" 
									id="cancel" name="personalInfo_2FormDiv"
									onclick="savePartnerProfile('personalInfo_2FormDiv')">Save</div>
								<div class="btn btn-xs btn-primary hide" 
									id="save" name="personalInfo_2FormDiv"
									onclick="disableProfileDiv('personalInfo_2FormDiv')">Cancel</div>
							</div>
		</form>
</div><!--col-md-8   -->
</div><!-- row div -->
</div></div>
<!-- Personal Info ends -->
	
	<!-- address  starts --> 
 <div class="list-group profiledivs" id="addressDiv" style="display: none">
        		<a class="list-group-item active" href="#">Address</a>
                <div class="list-group-item">
      	
        	<div class="row">
        	  <div class="col-md-12 searchpadding padding_top" id="officeAddress"> 
                  
        	    <strong>Office Address</strong><span style="float:right;"> 
        	    <a onClick="enableProfileDiv(name);" name="officeAddress" id="addressPPLink" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 </a><br>
                  </span>
                  <form method="post" id="officeAddressForm">
                  <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="street1">Address Line 1 </label>
		                <div class="col-sm-9">
		                  <input name="street1" class="input-xxlarge" emsg="street1" type="text" id=street1 style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="street2">Address Line 2 </label>
		                <div class="col-sm-9">
		                  <input name="street2" class="input-xxlarge" emsg="street2" type="text" id=street2 style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="street3">Address Line 3 </label>
		                <div class="col-sm-9">
		                  <input name="street3" class="input-xxlarge" emsg="street3" type="text" id=street3 style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="country">Country</label>
		                <div class="col-sm-9">
		                <select id="country" name="country" class="input-xlarge form-control" style="box-shadow:none;" readonly="readonly">
		                <option value="0">--Select--</option><option value="3001">India</option></select>
		                </div>
		              </div>
		          </div>
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="state">State</label>
		                <div class="col-sm-9">
		                  <select name="state" id="state" class="input-xxlarge" onchange="retrieveCityList(event,'contactDetailsForm');" style="border:none;background:none;"  readonly="readonly" ></select>
		                </div>
		              </div>
		          </div>
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="city">City</label>
		                <div class="col-sm-9">
		                  <input type="text" id="city" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
                   	  	  <input type="hidden" name="city" id="cityHidden">
		                </div>
		              </div>
		              </div>
		              <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="pinCode">Pin Code</label>
		                <div class="col-sm-9">
		                  <input name="postalCode" type="text" id="pinCode" class="input-xxlarge" style="border:none;background:none;box-shadow:none;" onkeydown="allowIntegersOnly(id,event)"/>
		                </div>
		              </div>
		              </div>
		              <div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="officeAddress" onclick="savePartnerProfile('officeAddress')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="officeAddress" onclick="disableProfileDiv('officeAddress')">Cancel</div>
				      </div>
                  </form>
                  
                  <strong>Residence Address</strong><span style="float:right;"> 
			  <span id="sameAsAboveSpan" style="display:none"><input type="checkbox" id="sameAsAboveCb" onchange="copyOfficeAddress()" style="opacity: 100;position: relative;width: 14px;height: 13px;"> <span style="position: relative;top: -2px;font-weight: bold;">Same as above</span></span>
			   <a onClick="enableProfileDiv(name);" name="residenceAddress" id="residenceAddress" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 </a>
                </span>
                <form method="post" id="residenceAddressForm">
                	<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="street1">Address Line 1 </label>
		                <div class="col-sm-9">
		                  <input name="street1" class="input-xxlarge" emsg="street1" type="text" id=street1 style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="street2">Address Line 2 </label>
		                <div class="col-sm-9">
		                  <input name="street2" class="input-xxlarge" emsg="street2" type="text" id=street2 style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="street3">Address Line 3 </label>
		                <div class="col-sm-9">
		                  <input name="street3" class="input-xxlarge" emsg="street3" type="text" id=street3 style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="country">Country</label>
		                <div class="col-sm-9">
		                  <select name="country" id="country" class="input-xxlarge" style="border:none;background:none;" readonly="readonly">
		                  <option>INDIA</option></select>
		                </div>
		              </div>
		          </div>
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="state">State</label>
		                <div class="col-sm-9">
		                  <select name="state" id="state" class="input-xxlarge" onchange="retrieveCityList(event,'residenceAddress');" style="border:none;background:none;"  readonly="readonly"></select>
		                </div>
		              </div>
		          </div>
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="city">City</label>
		                <div class="col-sm-9">
		                  <input type="text" id="city" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
                   	  	  <input type="hidden" name="city" id="cityHidden">
		                </div>
		              </div>
		              </div>
		              <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="pinCode">Pin Code</label>
		                <div class="col-sm-9">
		                  <input name="postalCode" type="text" id="pinCode" class="input-xxlarge" style="border:none;background:none;box-shadow:none;" onkeydown="allowIntegersOnly(id,event)"/>
		                </div>
		              </div>
		              </div>
		              <div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="residenceAddress" onclick="savePartnerProfile('residenceAddress')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="residenceAddress" onclick="disableProfileDiv('residenceAddress')">Cancel</div>
				      </div>
                  </form>
        	  </div>
        	</div>
</div>
</div>
 
  <!-- address  ends --> 
 
 
  <!-- Bank  starts --> 
  <div class="list-group profiledivs" id="bankDetailsDiv" style="display: none">
        		<a class="list-group-item active" href="#">Bank Details</a>
                <div class="list-group-item">
      	
        	<div class="row">     		 
       	 	<div class="col-md-12 searchpadding padding_top" id="bankDiv"> <strong>Bank Account Details</strong><span style="float:right;">
            <a onClick="enableProfileDiv(name);" name="bankDiv"  class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
			</a>
       	 	</span>
       	 	<form method="post" id="bankForm">
       	 	
       	 	<div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-3 control-label no-padding-right" for="bankName">Bank Name</label>
		              <div class="col-sm-9">
		                  <input name="bankName" type="text" id="bankName" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              </div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-3 control-label no-padding-right" for="branchname">Branch Name</label>
		              <div class="col-sm-9">
		                  <input name="branchname" type="text" id="branchname" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              </div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-3 control-label no-padding-right" for="bankcity">City</label>
		              <div class="col-sm-9">
		                  <input name="city" type="text" id="bankcity" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              </div>
		         </div>
		    </div>
		    
		     <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="accounttype">Account Type</label>
		                <div class="col-sm-9">
		                  <select name="accounttype" id="accounttype" class="input-xxlarge" style="border:none;background:none;">
		                  <option>Saving</option>
                          <option>Current </option>
                          </select>
		                </div>
		              </div>
		     </div>
		     
		     <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-3 control-label no-padding-right" for="accountNo"> Account No</label>
		              <div class="col-sm-9">
		                  <input name="accountNo" type="text" id="accountNo" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              </div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-3 control-label no-padding-right" for="micrCode">MICR Code</label>
		              <div class="col-sm-9">
		                  <input name="micrCode" type="text" id="micrCode" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              </div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-3 control-label no-padding-right" for="ifscCode">IFSC Code</label>
		              <div class="col-sm-9">
		                  <input name="ifscCode" type="text" id="ifscCode" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              </div>
		         </div>
		    </div>
		     
		     <div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="bankDiv" onclick="savePartnerProfile('bankDiv')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="bankDiv" onclick="disableProfileDiv('bankDiv')">Cancel</div>
			 </div>
		     
           	         </form>
              </div>
       	 </div>
</div>
</div>
  
   <!-- Bank  ends --> 
   
   <!-- services  starts --> 
  <div class="list-group profiledivs" id="servicesDiv" style="display: none">
        		<a class="list-group-item active" href="#">Services</a>
                <div class="list-group-item">
      	
        	<div class="row">     		
       	 	<div class="col-md-12 searchpadding padding_top" id="autoPlanConfigurationDetails"><strong>  </strong><span style="float:right;">
            <a onClick="enableProfileDiv(name);" name="autoPlanConfigurationDetails" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
			</a>
       	 	</span>
       	 	
       	 	<div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode"><i class="addicon">Email</i></label>
		              <div class="col-xs-3">
							<label>
								<input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="isEmailActivated" id="isEmailActivated" disabled>
								<span class="lbl"></span>
							</label>
  					  </div>
		              <div class="col-sm-4"></div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-11.5 widget-header clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Email ID</label>
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Activated On</label>
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Last Accessed On</label>		              
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		         	  <div class="col-sm-4" id="serviceEmailId">
		              </div>
		              <div class="col-sm-4" id="emailActivationDate">
		              </div>
		              <div class="col-sm-4" id="serviceEmailIdLastAccessedDate">
		              </div>
		         </div>
		    </div>
		    		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="isSmsActivated"><i class="addicon">SMS</i></label>
		              <div class="col-xs-4">
							<label>
								<input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="isSmsActivated" id="isSmsActivated" disabled>
								<span class="lbl"></span>
							</label>
  					  </div>
		              <div class="col-sm-4"></div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="isWebsiteActivated"><i class="addicon">Website</i></label>
		              <div class="col-xs-4">
							<label>
								<input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="isWebsiteActivated" id="isWebsiteActivated" disabled>
								<span class="lbl"></span>
							</label>
  					  </div>
		              <div class="col-sm-4"></div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-11.5 widget-header clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Website URL</label>
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Activated On</label>
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Last Accessed On</label>		              
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="isBackOfficeActivated"><i class="addicon">MF Backoffice</i></label>
		              <div class="col-xs-4">
							<label>
								<input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="isBackOfficeActivated" id="isBackOfficeActivated" disabled="disabled">
								<span class="lbl"></span>
							</label>
  					  </div>
		              <div class="col-sm-4"></div>
		         </div>
		    </div>
		    
		    <div class="row">
		         <div class="form-group col-md-11.5 widget-header clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Account ID</label>
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Activated On</label>
		              <label class="col-sm-4 control-label no-padding-right" for="ifscCode">Last Accessed On</label>		              
		         </div>
		    </div>
		     
		      <div class="row">
		         <div class="form-group col-md-12 clearfix">
		         	  <div class="col-sm-4">Account
		              </div>
		              <div class="col-sm-4" id="backOfficeActivationDate">
		              </div>
		              <div class="col-sm-4" id="backOfficeLastAccessedDate">
		              </div>
		         </div>
		    </div>
		     
		     <div class="row">
		         <div class="form-group col-md-12 clearfix">
		              <label class="col-sm-4 control-label no-padding-right" for="isAutoPlanEnabled"><i class="addicon">Auto Plan Configuration</i></label>
		              <div class="col-xs-4">
							<label>
								<input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="isAutoPlanEnabled" id="isAutoPlanEnabled">
								<span class="lbl"></span>
							</label>
  					  </div>
		              <div class="col-sm-4"></div>
		         </div>
		    </div>
		     
		     <div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="autoPlanConfigurationDetails" onclick="savePartnerProfile('autoPlanConfigurationDetails')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="autoPlanConfigurationDetails" onclick="disableProfileDiv('autoPlanConfigurationDetails')">Cancel</div>
			 </div>
			
              </div>
       	 </div>
</div>
</div>
  
<!-- services  ends --> 
   
   
<!-- my financial products  starts --> 
<div class="list-group profiledivs" id="financialProductDiv" style="display: none">
      <a class="list-group-item active" href="#">Financial Products</a>
        <div class="list-group-item">	
        	<div class="row">     		
       	 	<div class="col-md-12 searchpadding padding_top"> <strong>Select the assets & financial products you offer to your clients</strong><span style="float:right;">
       	 	 <a onClick="enableProfileDiv(name);" name="financialProductServicesFormDiv" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
			</a>
       	 	</span>
       	 	  <table class="table  borderping whiten" cellpadding="5" cellspacing="5" id="financialProductServicesFormDiv">
              <tr>
              <td>
              <table class="table table-striped" cellpadding="5" cellspacing="5" id="financialProductServices">
                <tr>
                  <th class="thead" >Asset Class </th>
                  <th class="thead"> Do you offer this?</th>
                  <th class="thead" >Service Code<a href="#" data-toggle="tooltip" data-placement="top" title="Know what is service code"><i class="queryicon"></i> </a></th>
                  <th class="thead"> Manufacturers<a href="#" data-toggle="tooltip" data-placement="top" title="Select the Manufacturers who's products you currently offer to your customers"><i class="queryicon"></i> </a></th>
                </tr>
                
              </table>
              </td>
                        </tr>
                        <tr>
                      <td colspan="2" align="right"> 
					    <div id="cancel" class="btn-primary btn btn-xs hide" name="financialProductServicesFormDiv" onclick="savePartnerProfile('financialProductServicesFormDiv')">Save</div> 
					  <div id="save" class="btn-primary btn btn-xs hide"  name="financialProductServicesFormDiv" onclick="disableProfileDiv('financialProductServicesFormDiv')">Cancel</div></td>
                    </tr>
       	 	</table>
              </div>
       	 </div>
</div>
</div>
  
   <!--  my financial products  ends --> 
   
   
   <!-- my personaliazation  starts --> 
  
 <div class="list-group profiledivs" id="myPersonalizationDiv" style="display: none">
 	<a class="list-group-item active" href="#"> My Personalization</a>
    <div class="list-group-item">      	
      <div class="row">
        
       	 	<div class="col-md-12 searchpadding padding_top" >
       	 	 	<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-9 control-label no-padding-right" >Email Details<i class="addicon"></i></label>
		                <label class="col-sm-3 control-label no-padding-right"></label>
		              </div>
		         </div>
		         
		         <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-4 control-label no-padding-right" for="emailCommunicationName" >Name</label>
		                <div class="col-sm-4">
		                  <input name="emailCommunicationName" type="text" id="emailCommunicationName" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              	</div>
		                <label class="col-sm-4 control-label no-padding-right" ></label>
		              </div>
		         </div>
		         
		         <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-4 control-label no-padding-right" for="emailCommunicationId" >Email ID</label>
		                <div class="col-sm-4">
		                  <input name="emailCommunicationId" type="text" id="emailCommunicationId" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              	</div>
		                <label class="col-sm-4 control-label no-padding-right" ></label>
		              </div>
		         </div>
		         
		        <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right">Email Signature</label>
		                <div class="col-sm-9">
		                	<a onClick="enableProfileDiv(name);" name="email_signature_details" id="email_signature_details" class="btn btn-xs btn-primary pull-right">
								<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 			</a>
				 		</div>
				 		<form method="post" id="emailSignatureForm">
				 			<div class="row">
								<div class="form-group col-md-12 clearfix">									
									<div class="col-sm-12">
										<div  id="emailSignature" style="width: 100%; height: 120px;" rows="10" class="wysiwyg-editor" contenteditable="false">
						            	</div>
						            	<textarea name="emailSignature" id="emailSignatureHidden" style="width: 100%; height: 120px;" rows="10" class="hide">
						            	</textarea>
									<div id="emailBody_error" class="help-block hide">Please provide a valid body.</div>
									</div>
								</div>
							</div>
							
							<div class="topmenu pull-right">
				        		<div class="btn-primary btn-xs btn hide" id="cancel" name="email_signature_details" onclick="savePartnerProfile('email_signature_details')">Save</div>
				        		<div class="btn btn-xs btn-primary hide" id="save" name="email_signature_details" onclick="disableProfileDiv('email_signature_details')">Cancel</div>
				      		</div>
				 		</form>
		           	</div>		                
		         </div>
		         

				 <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right">Disclaimer</label>
		                <div class="col-sm-9">
		                	<a onClick="enableProfileDiv(name);" name="email_disclaimer_details" id="email_disclaimer_details" class="btn btn-xs btn-primary pull-right" >
								<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 			</a>
				 		</div>
				 		<form method="post" id="emailDisclaimerForm">
				 			<div class="row">
								<div class="form-group col-md-12 clearfix">									
									<div class="col-sm-12">
										<div  id="disclaimer" style="width: 100%; height: 120px;" rows="10" class="wysiwyg-editor" contenteditable="false">
						            	</div>
						            	<textarea name="disclaimer" id="disclaimerHidden" style="width: 100%; height: 120px;" rows="10" class="hide">
						            	</textarea>
									</div>
								</div>
							</div>
							
							<div class="topmenu pull-right">
				        		<div class="btn-primary btn-xs btn hide" id="cancel" name="email_disclaimer_details" onclick="savePartnerProfile('email_disclaimer_details')">Save</div>
				        		<div class="btn btn-xs btn-primary hide" id="save" name="email_disclaimer_details" onclick="disableProfileDiv('email_disclaimer_details')">Cancel</div>
				      		</div>
				 		</form>
		           	</div>		                
		         </div>	
		         
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right">DND Template</label>
		                <div class="col-sm-9">
		                	<a onClick="enableProfileDiv(name);" name="email_dnd_details" id="email_dnd_details" class="btn btn-xs btn-primary pull-right">
								<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 			</a>
				 		</div>
				 		<form method="post" id="emailDNDForm">
				 			<div class="row">
								<div class="form-group col-md-12 clearfix">									
									<div class="col-sm-12">
										<div id="dnd" style="width: 100%; height: 120px;" rows="10" class="wysiwyg-editor" contenteditable="false" >											
						            	</div>
						            	<textarea name="dnd" id="dndHidden" style="width: 100%; height: 120px;" rows="10" class="hide">											
						            	</textarea>
									</div>
								</div>
							</div>
							
							<div class="topmenu pull-right">
				        		<div class="btn-primary btn-xs btn hide" id="cancel" name="email_dnd_details" onclick="savePartnerProfile('email_dnd_details')">Save</div>
				        		<div class="btn btn-xs btn-primary hide" id="save" name="email_dnd_details" onclick="disableProfileDiv('email_dnd_details')">Cancel</div>
				      		</div>
				 		</form>
		           	</div>		                
		         </div>	 	
		         
		         <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right">Others</label>
		                <div class="col-sm-9">
		                	<a onClick="enableProfileDiv(name);" name="email_other_details" id="email_other_details" class="btn btn-xs btn-primary pull-right">
								<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 			</a>
				 		</div>
				 		<form id="emailOtherDetailsForm" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/partner/savePartnerProfilePhoto.htm">
				 		<input  type="hidden"   name="sectionName" value="EmailOtherDetails" />
				 			<div class="row">
		              				<div class="form-group col-md-12 clearfix">
		                				<label class="col-sm-3 control-label no-padding-right">SMS Signature</label>
		                				<div class="col-sm-9">
		                  					<input name="smsSignature" type="text" id="smsSignature" class="input-xxlarge" style="border:none;background:none;box-shadow:none;"/>
		              					</div>		                			
		              				</div>
		         			</div>	
				 		
				 			<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right">Themes </label>
									<div class="col-sm-9">
										<select name="theme" id="theme" class="input-xxlarge" onchange="applyTheme();" disabled="disabled">
										</select>		
										<input type="hidden" name="themeName" id="themeName" readonly>						
									</div>
								</div>
							</div>
				 			<div class="row">
								<div class="form-group col-md-12 clearfix">									
									<div class="col-sm-12">
										<label class="col-sm-3 control-label no-padding-right">Logo</label>
		                				<div class="col-sm-9"><img src="<%=FiinfraUtility.getImagePath(request, logoPath, "images/img.png") %>" id="logoImage" style="width: 250px;height: 150px"><br/>
		                  				<c:choose>
        								  <c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
											<div class="btn-primary btn-xs btn" type="button"  name="cancel" style="display: none" id="logoCancel" onclick="cancelLogo(1)">Remove Logo</div>
											<span class="red none" id="logoMessage"> * For best results please upload logo in size 150 X 60 px</span>
										  </c:when>
										</c:choose>
     		  								<input type="file" name="image" id="logoFile" style="display: none">
		              					</div>
									</div>
								</div>
							</div>
							
							<div class="topmenu pull-right">
				        		<div class="btn-primary btn-xs btn hide" id="cancel" name="email_other_details" onclick="savePartnerProfile('email_other_details')">Save</div>
				        		<div class="btn btn-xs btn-primary hide" id="save" name="email_other_details" onclick="disableProfileDiv('email_other_details')">Cancel</div>
				      		</div>
				 		</form>
		           	</div>		                
		         </div>	 	
		         
		      </div>
    	</div>
	</div>
</div>
<!-- my personaliazation  ends --> 
    
    
<!-- security  starts --> 
  
 <div class="list-group profiledivs" id="userAccountDiv" style="display: none">
      <a class="list-group-item active" href="#">My User Account</a>
      <div class="list-group-item">      	
        	<div class="row" id="userAccountFormDiv">
     		        
       	 	<div class="col-md-12 searchpadding padding_top" id="user_account_details">
       	 		<a onClick="enableProfileDiv(name);" name="user_account_details" id="user_account_details" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 </a>       	 	
       	 	<form method="post" id="userAccoundDetailsForm">
       	 		 	<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="userName">User Name</label>
		                <div class="col-sm-9" id="userName">
		                </div>
		              </div>
		            </div>
		            
		            <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="password">Change Password</label>
		                <div class="col-sm-9">
		                  <a id="changePasswordLink"  style="cursor: default;text-decoration: none">Click here</a>
		                </div>
		              </div>
		            </div>
       	 			
       	 			 <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="securityQuestionId">Security Question</label>
		                <div class="col-sm-9">
		                  <select id="securityQuestionId" class="input-xxlarge" name="securityQuestionId" style="border:none;background:none;"></select>
		                </div>
		              </div>
		             </div>
		             
		             <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="securityAnswer">Security Answer</label>
		                <div class="col-sm-9">
		                  <input name="securityAnswer" class="input-xxlarge" type="text" id="securityAnswer" style="border:none;background:none;box-shadow:none;" />
		                </div>
		              </div>
		             </div>
		             
		              <div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="user_account_details" onclick="savePartnerProfile('user_account_details')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="user_account_details" onclick="disableProfileDiv('user_account_details')">Cancel</div>
				      </div>				
              </form>
              </div>
       	 </div>
</div>
</div>
    <!-- security  ends --> 
    
    
    <!-- my assigned service team  starts --> 
   <div class="list-group profiledivs" id="teamMemberDiv" style="display: none">
   		  <a class="list-group-item active" href="#">My Assigned Service Team</a>
   		  <div class="list-group-item">
            <div class="row">
              <div class="col-md-12 searchpadding padding_top table-responsive "> <p class="strong southspace1">My Assigned Service Team </strong>
              
                  <table class="table table-hover table-bordered" cellpadding="5" cellspacing="5" id="teamMemberDetail">                    
                  </table>
              </div>
            </div>
	       </div>
         </div>
        
  
    <!-- my assigned service team  ends --> 
 
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
				             <th class="thead"><input onchange="togleDocumentSelect()" id="0" type="checkbox" class="checkbox"></th>
				             <th class="thead"><a href="#"> File Name</a></th>
				             <th class="thead"><a href="#">Document Name</a></th>
				             <th class="thead"><a href="#">Created By</a></th>
				             <th class="thead"><a href="#">Date </a></th>
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

<div class="list-group profiledivs" id="partnerInterestedFPDiv" style="display: none">
     <a class="list-group-item active" href="#">Interested FP Sections</a>
     <div class="list-group-item">
          <div class="row">
        		  <div class="col-md-12 searchpadding padding_top" id="interestedFPDetails">
        		  <a onClick="enableProfileDiv(name);" name="interestedFPDetails" id="partnerInterestedFPEditLink" class="btn btn-xs btn-primary pull-right">
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
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="interestedFPDetails" onclick="savePartnerProfile('interestedFPDetails')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="interestedFPDetails" onclick="disableProfileDiv('interestedFPDetails')">Cancel</div>
				    </div>
                    	</form>
                  </div>
        </div>                
    </div>
</div>

<!-- Documents Details ends -->

<!-- Auto Plan Section -->
<div class="list-group profiledivs" id="autoPlanConfigurationDiv" style="display: none">
        		<a class="list-group-item active" href="#">Auto Plan Configuration</a>
                <div class="list-group-item">
                <div class="row">
        		  <div class="col-md-12 searchpadding padding_top" id="autoPlanConfigurationDetails"> 
        		  <a onClick="enableProfileDiv(name);" name="autoPlanConfigurationDetails" id="partnerAutoPlanConfigurationEditLink" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				  </a>
				 <div class="clearfix"></div>
                
                <form method="post" id="autoPlanConfigurationForm">
               	 	<div class="row">
	                	<div class="col-md-12" id="isAutoPlanEnabled" >
	                	</div>
                	</div>
                	
                	<div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="autoPlanConfigurationDetails" onclick="savePartnerProfile('autoPlanConfigurationDetails')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="autoPlanConfigurationDetails" onclick="disableProfileDiv('autoPlanConfigurationDetails')">Cancel</div>
				    </div>
                </form>
                  </div>
                 </div>                
                </div>
</div>

<!-- Auto Plan Section -->

<div class="list-group profiledivs" id="subscriptionDiv" style="display: none">
     <a class="list-group-item active" href="#">My Subscriptions</a>
         <div class="list-group-item">
               <div class="searchpadding " id="newSubxData">
               <br>
              
               </div>    
               <div class="pull-left" id="countPlan">  </div>
                	<div class="topmenu" style="margin-top:-20px"> 
                	<input type="hidden" id="categoryId"/>      
					<div class="topmenu pull-right">
				        <button class="btn-primary" type="button" id="btnPayment" name="btnPayment" onclick="makePayment()">Buy Online</button>
				        
				      </div>
 					</div> 
             	
                <div class="row">    
                 <div class="table-responsive" id="display_table_lead" style="border:none;">
		  			<div id="toreload">    		
                		<form method="post" id="documentsDetailsForm">
		              	
		              	<div class="row">
		              	</div>
		              	<div class="row">
	                		<div class="col-md-12 widget-header" id="subxTable" >
	                		</div>
                		</div>
		             	
                			<table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="subxTable">
                			<thead>
				             <tr>				               
				               <th class="thead"> <a href="#">Subscription Package</a></th>
				               <th class="thead"><a href="#">Start Date</a></th>
				               <th class="thead"> <a href="#">End Date</a></th>
				                <th class="thead"> <a href="#">Status</a></th>
				             </tr>
							</thead>
                			<tbody>
                			
                			</tbody>
                			</table>
               			 </form>
                	</div>
                </div>
                 </div>                
                 </div>
                </div>


<!-- Subscription ends -->

<div class="list-group profiledivs" id="paymentHistoryDiv" style="display: none">
        		<a class="list-group-item active" href="#">Payment History</a>
                <div class="list-group-item">
                	<div class="topmenu" style="margin-top:0px"> 
                	  

 					</div> 
                <div class="row">    
                 <div class="table-responsive" id="display_table_lead" style="border:none; height: 385px">
		  			<div id="toreload">    		
                		<form method="post" id="documentsDetailsForm">
                			<table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="paymentTable">
                			<thead>
				             <tr>
				               
				               <th class="thead"> <a href="#"> Payment Date</a></th>
				               <th class="thead"><a href="#">Product</a></th>
				               <th class="thead"><a href="#">Valid till</a></th>
				               <th class="thead"> <a href="#">Order No.</a></th>
				               <th class="thead"><a href="#">Txn Ref No.</a></th>
				               <th class="thead"><a href="#">Amount</a></th>
				               <th class="thead"><a href="#">Status</a></th>
				               <th class="thead"><a href="#">Receipt</a></th>
				                </tr>
							</thead>
							<tbody >
							</tbody>
                	
                			</table>
               			 </form>
                	</div>
                </div>
                 </div>                
                </div>
</div>

<!-- payment History end -->

<div class="list-group profiledivs" id="transactionHistoryDiv" style="display: none">
        		<a class="list-group-item active" href="#">Transaction History</a>
                <div class="list-group-item">
                	<div class="topmenu" style="margin-top:0px"></div> 
                <div class="row">    
                 <div class="table-responsive" id="display_table_lead" style="border:none; height: 385px">
		  			<div id="toreload">    		
                		<form method="post" id="documentsDetailsForm">
                			<table class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0" id="transactionTable">
                			<thead>
				             <tr>
				               
				               <th class="thead"> <a href="#"> Order No</a></th>
				               <th class="thead"><a href="#">Order Date</a></th>
				               <th class="thead"><a href="#">Start Date</a></th>
				               <th class="thead"><a href="#">End Date</a></th>
				               <th class="thead"> <a href="#">Order Amount</a></th>
				               <th class="thead"><a href="#">Order Status</a></th>
				               <th class="thead"><a href="#">Product Details</a></th>
				                </tr>
							</thead>
                	
                		<tbody>
                			</table>
               			 </form>
                	</div>
                </div>
                 </div>                
                </div>
</div>

<!-- Transaction History -->


  <!-- Mf Config  starts --> 
  <div class="list-group profiledivs" id="mfFileUploadConfigDiv" style="display: none">
        		<a class="list-group-item active" href="#">MF Auto Upload Configuration</a>
                <div class="list-group-item">
      	
        	<div class="row">
     		
        
       	 	<div class="col-md-12 searchpadding padding_top" id="mfFileUploadConfigTable"> <strong>MF Auto Upload Configuration</strong><span style="float:right;">
            <a onClick="enableProfileDiv(name);" name="mfFileUploadConfigTable" id="mfFileUploadConfigEditPPLink" class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 </a>
       	 	</span>
       	 	<form method="post" id="mfFileUploadConfigForm">
       	 		<div class="row">
		           <div class="form-group col-md-12 clearfix">
		               <label class="col-sm-3 control-label no-padding-right" for="camsPassword">Password for CAMS Files</label>
		               <div class="col-sm-9">
		                  <input name="camsPassword" type="password" style="border:none;background:none;" id="camsPassword" class="input-xxlarge" maxlength="25"/>
		               </div>
		              </div>
		        </div>
		        
		        <div class="row">
		           <div class="form-group col-md-12 clearfix">
		               <label class="col-sm-3 control-label no-padding-right" for="karvyPassword">Password for Karvy Files</label>
		               <div class="col-sm-9">
		                  <input name="karvyPassword" type="password" style="border:none;background:none;" id="karvyPassword" class="input-xxlarge" maxlength="25"/>
		               </div>
		              </div>
		        </div>
		        
		        <div class="row">
		           <div class="form-group col-md-12 clearfix">
		               <label class="col-sm-3 control-label no-padding-right" for="sundaramPassword">Password for Sundaram Files</label>
		               <div class="col-sm-9">
		                  <input name="sundaramPassword" type="password" style="border:none;background:none;" id="sundaramPassword" class="input-xxlarge" maxlength="25"/>
		               </div>
		              </div>
		        </div>
		        
		         <div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="mfFileUploadConfigTable" onclick="savePartnerProfile('mfFileUploadConfigTable')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="mfFileUploadConfigTable" onclick="disableProfileDiv('mfFileUploadConfigTable')">Cancel</div>
				 </div>       	 	
              </form>
              </div>
       	 </div>
</div>
</div>
<!-- Mf Config  ends -->

				<!-- Online Transaction configuration -->
				<div class="list-group profiledivs" id="onlineTransationDiv"
					style="display: none">
					<a class="list-group-item active" href="#">Online Transaction
						configuration</a>
					<div>
						<div class="tabbable">
							<ul
								class="nav nav-tabs padding-12 tab-color-blue background-blue"
								id="myTab4">
								<li class="active"><a data-toggle="tab" href="#mutualFunds"
									aria-expanded="true">Mutual Funds</a></li>

								<!-- <li class=""><a data-toggle="tab" href="#insurance"
									aria-expanded="false">Insurance</a></li> -->

							</ul>

							<div class="tab-content">
								<div class="alert alert-info">
									<strong>Disclaimer!</strong> Please select only those AMCs with whom you are registered.
									 Selecting incorrect AMC may lead to non-payment of brokerage<br>
								</div>
								<div id="mutualFunds" class="tab-pane active">
									<div class="row">
										<div class="form-group  widget-header clearfix">
											<label class="col-sm-4 control-label no-padding-right"
												for="ifscCode">AMC</label> <label
												class="col-sm-2 control-label no-padding-right"
												for="ifscCode">Purchase</label> <label
												class="col-sm-2 control-label no-padding-right"
												for="ifscCode">Redemption</label> <label
												class="col-sm-2 control-label no-padding-right"
												for="ifscCode">Switch</label> <label
												class="col-sm-2 control-label no-padding-right"
												for="ifscCode">SIP Registration </label>
										</div>
									</div>
									<div class="row" id="productList">
										<!-- List is loading dyanamically search for /partner/getOLTransactionConfiguration.htm String -->
									</div>

									<div class="topmenu pull-right">
									
										<div class="btn-primary btn-xs btn" id="save"
											onclick="saveOnlineConfiguration()">Save Configuration</div>
									</div>
									<div class="clearfix"></div>

								</div>

								<!-- <div id="insurance" class="tab-pane">
									<p>Food truck fixie locavore, accusamus mcsweeney's marfa
										nulla single-origin coffee squid.</p>
								</div> -->

							</div>
						</div>
					</div>
				</div>


				<!-- Online Transaction configuration End  -->




				<!--  hierachy  -->
 <div class="mh-action" id="mh-moveuser" style="display:none"> <strong id="nodeLabel">Move User</strong>
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
                            <div id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post" id="manageHeirarchyLocationForm">
                                <input type="hidden" name="parentNodeId" id="parentNodeId" value="63">
                                <input type="hidden" name="level" id="level" value="4">
                                <input type="hidden" name="locationId" id="locationId" value="0">
														<div class="row">
															<div class="form-group col-md-12 clearfix">
																<label class="col-sm-3 control-label no-padding-right"
																	for="nodeLocation">Location Name</label>
																<div class="col-sm-7">
																	<input name="nodeLocation" type="text" class="input-xxlarge" validate="1" emsg="Location Name" id="nodeLocation">
																	 <div id="nodeLocation_error" class="help-block hide">Please provide a valid location name.</div>
																</div>
															</div>
														</div>
														
														<div class="row">
															<div class="form-group col-md-12 clearfix">
																<label class="col-sm-3 control-label no-padding-right"
																	for="nodeDescription">Description</label>
																<div class="col-sm-7">
																	<input name="nodeDescription" type="text" id="nodeDescription" validate="1" emsg="Description" class="input-xxlarge">
																    <div id="nodeDescription_error" class="help-block hide">Please provide a valid description.</div>
																</div>
															</div>
														</div>
														
													 	<div class="row  pull-right">
													 	    <div class="form-group col-md-3 clearfix">
															 <label class="col-sm-3"></label>
																<div class="col-sm-5">
																</div>
															</div>
															 <div class="form-group col-md-3 clearfix">
															 <label class="col-sm-3"></label>
																<div class="col-sm-5">
																	  <div id="saveLocation" class="btn btn-primary btn-xs  createNewBtn" name="manageHeirarchyLocation" onclick="savePartnerProfile('manageHeirarchyLocation')"><i class="fa fa-plus"></i> Save </div>
																</div>
															</div>
															<div class="form-group col-md-3 clearfix">
																	 <label class="col-sm-3"></label>
																<div class="col-sm-5">
																	 <div id="cancelLocation" class="btn btn-primary btn-xs  createNewBtn" name="manageHeirarchyLocation" onclick="disableProfileDiv('manageHeirarchyLocation')">Cancel</div>
																</div>
															</div>
														</div> 
													
                                </form>
                              </div>
                            </div>
                          </div>


                          <div class="mh-action" id="mh-sec-adduser"> <strong id="userLabel">Add User</strong>&mdash;<strong id="partName" style="color: #AE2760"></strong>
                            <div class="table-responsive" id="display_table_lead" style="border:none;">
                              <div >
                                <form method="post" id="manageHeirarchySavePartnerForm"  name="manageHeirarchySavePartnerForm">
                                  <table class="table table-striped" cellpadding="5" cellspacing="5">
                                    <tr>
                                      <td width="25%">First Name <span class="red">*</span></td>
                                      <td width="75%"><input  type="text" id="partner_firstName"  name="partner_firstName" validate="1" emsg="Last Name" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Last Name <span class="red">*</span></td>
                                      <td width="75%"><input name="partner_lastName" id="partner_lastName"  validate="1" emsg="Last Name" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">User Name <span class="red">*</span></td>
                                      <td width="75%"><input name="partner_loginName" id="partner_loginName"  validate="1" emsg="Last Name" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Company Name</td>
                                      <td width="75%"><input name="partner_companyName" id="partner_companyName" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">Email <span class="red">*</span></td>
                                      <td width="75%"><input id="partner_contactEmail" name="partner_contactEmail" validate="email" emsg="Email" type="text" class="txt-bx"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">ARN </td>
                                      <td width="75%"><input id="partner_ARN" name="partner_ARN" type="text"  class="txt-bx" onkeydown="allowIntegersOnly(id,event)"></td>
                                    </tr>
                                    <tr>
                                      <td width="25%">EUIN </td>
                                      <td width="75%"><input id="partner_euin" name="partner_euin" type="text" class="txt-bx" onkeydown="allowIntegersOnly(id,event)"></td>
                                    </tr>

                                    <tr>
                                    <td width="25%">Is Head of Node</td>
                                    <td width="75%"><select id="isHeadNode" name="isHeadNode"  validate="1" emsg="isHeadNode">
        					      <option value="0">---Select---</option>
        					      <option value="1">Yes</option>
        					      <option value="2">No</option>
        					      </select> </td>
        					      
        					      </tr>
                                  </table>
                                    <div class="row" >
	                      <div class="col-lg-3 pull-right text-right"  style="width: 30% !important;">
	                        <input type="button" class="btn" value="Save" name="manageHeirarchySavePartner"  id="manageHeirarchySavePartner" onclick="savePartnerProfile(name)"/>
	                        <input type="button" class="btn" value="Cancel" onclick="disableProfileDiv(name)" name="manageHeirarchyCancelPartner"/>
	                      <input type="hidden" name="currentNode" id="currentNode" value="3">
	                      <input type="hidden" name="partyId" id="partyId" value="0">
						   <input type="hidden" name="pst" id="pst" value="71709">
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
           
            
<!--     hierarchy end -->
        
        <!-- NACH  -->

<div class="list-group profiledivs" id="NACHDetailDiv" style="display: none">
        		<a class="list-group-item active" href="#">Auto Payment Details</a>
      <div class="list-group-item">
      	<div id="nachInitiate" style="display: none;">
		<form id="nachInit" action="${pageContext.request.contextPath}/nach/initiateNACH.htm"> 
		
				<button type="button" class="btn-primary btn btn-xs" onClick="openNachDialog()" style="float: right;">Auto Payment Initiation Request</button>
		</form>
		<div>
		<center> <strong><h4></h4></strong></center>
		Thank you for showing interest in making auto payments!
 <div>
<br/><br/>With FIINFRA Auto Payment facility, you need to register once & set standing instructions at your convenience to pay your due subscription on time, every time.
No more logging on to website to make your subscription payments.
 
 
<br/><strong>Convenience:</strong> 
<br/>No need to track subscription payment due dates. Set 'Auto Subscription Payment' today to forget all worries. 
<br/><strong>Additional Security:</strong> 
<br/>Set Auto Subscription Pay for a specific payment limit or for the total amount due & manage your payments better.
<br/><strong>SMS & Email Alerts:</strong> 
<br/>Get regular SMS & Email alerts on subscription payments.
 
<br/> <br/><strong>FAQs:</strong>
<ol>
<li>How can I register for Auto Payment?
You can initiate the request for Auto payment by clicking "Auto Payment Initiation Request" button on the top of the page.
<br/>Mandate form is available with your RM and PST. Please fill in the Mandate form and submit to your RM/ PST OR you may courier it to below address

<br/><strong>Address</strong> : 
<br/>Accounts Department, FIINFRA
<br/>506/507, Morya Landmark-II, 
<br/>Near Infinity Mall, Link Road, 
<br/>Andheri (W), Mumbai-53</li>
<br/>
<li>How can I cancel the Auto Payment?
A cancellation form needs to be filled and submitted to PST/ RM. You can contact RM/ PST for more details.
</li><br/>
<li>How much time does it take to enable Auto Payments?
It takes around 7-10 working days after your form has been submitted OR couriered.
	</li></ol>
	</div>	
		</div>
	</div> 
        	<div class="row" id="nachDetail">
        	  <div class="col-md-12 searchpadding padding_top" id="officeAddress">                   
                  <a onClick="enableNACHDiv(name);" name="nachPersonal"  class="btn btn-xs btn-primary pull-right">
					<i class="ace-icon fa fa-pencil-square-o"></i>Edit
				 </a>
                  <form method="post" id="nachPersonal" action="${pageContext.request.contextPath}/nach/saveNACH.htm">
                  	<input type="hidden"  name="nachId" id="nachId">
		             
		             <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachPartyName">Name as in Bank Account<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="nachPartyName" class="input-xxlarge" type="text" id="nachPartyName" style="border:none;background:none;box-shadow:none;" />
		                </div>
		              </div>
		             </div>
		             
		             <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachEmail">Email <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="nachEmail" class="input-xxlarge" type="text" id="nachEmail" style="border:none;background:none;box-shadow:none;" />
		                </div>
		              </div>
		             </div>
		             
		             <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachMobile">Phone No</label>
		                <div class="col-sm-9">
		                  <input name="nachMobile" class="input-xxlarge Number1" type="text" id="nachMobile" style="border:none;background:none;box-shadow:none;" />
		                </div>
		              </div>
		             </div>
                  	
                  	<div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="officeAddress" onclick="savePartnerProfile('officeAddress')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="officeAddress" onclick="disableProfileDiv('officeAddress')">Cancel</div>
				    </div>

                  
              <strong>Bank Details</strong><span style="float:right;"> 
			  <span id="sameAsAboveSpan" style="display:none"><input type="checkbox" id="sameAsAboveCb" onchange="copyOfficeAddress()" style="opacity: 100;position: relative;width: 14px;height: 13px;"> <span style="position: relative;top: -2px;font-weight: bold;">Same as above</span></span>
              </span>
            	<div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="bankName">Bank Name<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="bankName" class="input-xxlarge" emsg="street1" type="text" id=bankName style="border:none;background:none;" />
		                </div>
		              </div>
	          	</div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachBranch">Branch</label>
		                <div class="col-sm-9">
		                  <input name="branch" class="input-xxlarge" type="text" id=nachBranch style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="accounttypeId">Account Type</label>
		                <div class="col-sm-9">
		                  <input name="accountId" class="input-xxlarge" type="text" id=accounttypeId style="border:none;background:none;" />
		                </div>
		              </div>
		          </div>
		          
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachAccountNo">Account No.<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="accountNumber" class="input-xxlarge" type="text" id=nachAccountNo style="border:none;background:none;" onkeydown="allowIntegersOnly(id,event)"/>
		                </div>
		              </div>
		          </div>
		          
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachMicr">MICR<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="micr" class="input-xxlarge" type="text" id=nachMicr style="border:none;background:none;" onkeydown="allowIntegersOnly(id,event)"/>
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachIfsc">IFSC<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="ifsc" class="input-xxlarge" type="text" id=nachIfsc style="border:none;background:none;" onkeydown="allowIntegersOnly(id,event)"/>
		                </div>
		              </div>
		          </div>
		          <div class="topmenu pull-right">
				        <div class="btn-primary btn-xs btn hide" id="cancel" name="residenceAddress" onclick="savePartnerProfile('residenceAddress')">Save</div>
				        <div class="btn btn-xs btn-primary hide" id="save" name="residenceAddress" onclick="disableProfileDiv('residenceAddress')">Cancel</div>
				  </div>
                  
                  <strong>Auto Payment Details</strong><span style="float:right;"> 
			  <span id="sameAsAboveSpan" style="display:none"><input type="checkbox" id="sameAsAboveCb" onchange="copyOfficeAddress()" style="opacity: 100;position: relative;width: 14px;height: 13px;"> <span style="position: relative;top: -2px;font-weight: bold;">Same as above</span></span>
                </span>
                  <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="registrationDate">Registration Date</label>
		                <div class="col-sm-9">
		                  <input name="registrationDate" class="input-xxlarge" type="text" id="registrationDate"  type="hidden"/>
		                </div>
		              </div>
		          </div>
		          
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="startDate">Start Date <span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="startDate" class="input-xxlarge" type="text" id="startDate"  />
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="startDate">End Date<span class="red">*</span></label>
		                <div class="col-sm-9">
		                  <input name="endDate" class="input-xxlarge" type="text" id="endDate"  />
		                </div>
		              </div>
		          </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="nachStatus">Status</label>
		                <div class="col-sm-9">
		                  <select id="nachStatus" name="nachStatus" style="border:none;background:none;box-shadow:none;" disabled></select>
		                  <input type="hidden" name="status" id="status">
		                </div>
		              </div>
		           </div>
		          
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="reason">Reason</label>
		                <div class="col-sm-9">
		                  <input name="errorDetail" class="input-xxlarge" type="text" id="reason"  />
		                </div>
		              </div>
		          </div>
		          
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="frequencyId">Frequency</label>
		                <div class="col-sm-9">
		                  <select id="frequencyId" name="frequencyId" style="border:none;background:none;box-shadow:none;"></select>
		                </div>
		              </div>
		           </div>
		           
		           <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="limitAmount">Limit Amount</label>
		                <div class="col-sm-9">
		                  <input name="limitAmount" class="input-xxlarge" type="text" id="limitAmount"  />
		                </div>
		              </div>
		          </div>
		          
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="reference1">Reference 1</label>
		                <div class="col-sm-9">
		                  <input name="reference1" class="input-xxlarge" type="text" id="reference"  />
		                </div>
		              </div>
		          </div>
		          
		          <div class="row">
		              <div class="form-group col-md-12 clearfix">
		                <label class="col-sm-3 control-label no-padding-right" for="reference2">Reference 2</label>
		                <div class="col-sm-9">
		                  <input name="reference2" class="input-xxlarge" type="text" id="reference2"  />
		                </div>
		              </div>
		          </div>
		           
		          <div class="topmenu pull-right">
				     <div class="btn-primary btn-xs btn hide" id="cancel" name="nachPersonal" onclick="saveNACHDetails()">Save</div>
				     <div class="btn btn-xs btn-primary hide" type="button" id="save" name="nachPersonal" onclick="showNACHDiv('NACHDetailDiv')">Cancel</div>
				  </div>                 
        	  </div>
        	</div>
</div>
</div>

<div id="nachDialog" title="Initiate Auto Payment">Are you sure you want to initiate Auto Payment?</div>
<div id="nachDialogForMove" title="Move User">Are you sure you want to Move User?</div>
</div>

	<!--NACH ends  -->
</div>  <!-- End Col 9 Div -->
</div>  <!-- End Container Body Div -->   
<br/><br/>
</div><!-- End Container White Div -->
<!-- Center part End -->          
<jsp:include page="../common/footer.jsp" />

<script src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>

<!-- <div style="display: none; width:500px; height:400px; top:114px !important;z-index: 9999;background-color: #fff;padding: 20px;box-shadow: 0 0 10px 2px #535b68;border: 1px #fff solid;" id="addDocumentPopup" class="alert" > -->
<%-- <div class="close" style="margin-right:10px;"><a onClick="$('#addDocumentPopup').hide();$('#blanket').hide()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div> --%>
<!-- <div id="addDocument"> -->
<!--     <div id="popupwrapper_contactform"> -->
<!--    		<div class="heading_contactform"><h3> Add Document</h3></div> -->
<!--         <div id="poptable_contactform" style="padding:10px;"> -->
<%--         <form enctype="multipart/form-data" method="post" id="addDocumentFormData" action="<%=request.getContextPath() %>/common/saveDocuments.htm"> --%>
<!--         	<input type="file" multiple="multiple" name="documentFiles" id="documentFiles" style="display: none" onchange="showDocuments()"> -->
<!--         	<input class="btn dbtn" type="button" value="Choose File" name="Choose File" onclick="documentFiles.click()"> -->
<!--         	 <div id="documentList" style="margin-top: 10px;height: 156px;overflow: auto;"> </div> -->
<%--         	 <input type="hidden" id="documentPartyId" name="partyId" value="${sessionScope.userSession.partyId}"> --%>
<!--         	 </form> -->
 

<!--  </div> -->

<!--   <div class="topbuttonholder"> -->
<!--         	<form> -->
<!--         	<input class="dbtn" value="Save" id="popupSavenoteBtn" type="button" title="Save Note" onclick="saveDocument()" alt="Save">	 -->
<!--             <input class="dbtn" value="Cancel" id="popupCancelnoteBtn" type="button" onClick="$('#addDocumentPopup').hide();$('#blanket').hide()" title="Cancel Note" alt="Cancel Note" >	 -->
<!--            	</form>	 -->
<!--         </div> -->
<!--         </div> -->
<!-- 	</div> -->
   
   
<!-- </div> -->

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
          <input type="hidden" id="documentPartyId" name="partyId" value="">
        </form>
      </div>
      <div class="modal-footer">
        
        <button type="button" id="popupSavenoteBtn" class="btn btn-primary btn-xs" onclick="saveDocument()">Save</button>
        <button type="button" class="btn btn-primary btn-xs" onclick="removeDocument()" id="popupCancelnoteBtn" data-dismiss="modal">Cancel</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>


<script>
var isVisited=0;
var usernamez='';
var locationId=0;
var locationDesToSet='';
var locationNameToSet='';
//var $=jQuery.noConflict();
function customMenu(node) {
	var sessionPartyId='${sessionScope.userSession.partyId}';
    var tree = $jq_1_9_1("#jstree").jstree(true);

    if (node.type == 'root') {
        var items = {
            addLocationItem: {
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

            },
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
                icon: "fa fa-trash-o"

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
    } else if (node.type == 'area') {
    	$('#manageHeirarchySavePartnerForm #partner_loginName').attr('disabled',false);
    	$('#manageHeirarchySavePartnerForm #partner_ARN').attr('disabled',false);
		$('#manageHeirarchySavePartnerForm #partner_euin').attr('disabled',false);
		$('#manageHeirarchySavePartnerForm #isHeadNode').attr('disabled',false);
		
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
                icon: "fa fa-trash-o"

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
                icon: "fa fa-trash-o"

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
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#pnl-mhaddedit #mh-addlocation').hide();
						$('#userLabel').html('Add User');
						$('#manageHeirarchySavePartnerForm #partyId').val(0);
						$('#manageHeirarchySavePartnerForm #isHeadNode').removeAttr('disabled');
// 					});
                },
                icon: "fa fa-trash-o"

            }
        };
    } else if (node.type == 'user' && ($('#manageHeirarchySavePartnerForm #partyId').val()!=sessionPartyId)) { 
        var items = {
            editUserItem: {
                label: "Edit User",
                action: function(obj) {
                 //   alert("Edit User");
                    //tree.delete_node(node);
// 					$('#pnl-mhaddedit .mh-action').hide(function() {
						$('#pnl-mhaddedit #mh-sec-adduser').show();
						$('#pnl-mhaddedit #mh-addlocation').hide();
						$('#userLabel').html('Edit User');
						getEditPartner($('#manageHeirarchySavePartnerForm #partyId').val());
// 					});
                },
                icon: "fa fa-trash-o"

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
                icon: "fa fa-trash-o"

            },   
            
            accessList: {
                label: "Access List",
                action: function(obj) {
                	accessList();
				},
                icon: "fa fa-plus"

            }   

        };
    }

    return items;
}
function getEditPartner(partyId)
{
	//alert(partyId)
	 $.ajax({
		 type :'POST',
         url : $('#contextPath').val() +"/partner/getPartnerDetails.htm?partyId="+partyId,
		 success : function(result)
		 {
			 id='manageHeirarchySavePartner';
			 $('#manageHeirarchySavePartnerForm #partner_firstName').val(result.firstName);
			 $('#manageHeirarchySavePartnerForm #partner_lastName').val(result.lastName);
			 $('#manageHeirarchySavePartnerForm #partner_loginName').val(result.userName);
			 $('#manageHeirarchySavePartnerForm #partner_companyName').val(result.companyName);
			 $('#manageHeirarchySavePartnerForm #partner_contactEmail').val(result.contactEmail);
			 $('#manageHeirarchySavePartnerForm #partner_ARN').val(result.arn);
			 $('#manageHeirarchySavePartnerForm #partner_euin').val(result.euin);
		 	 $('#manageHeirarchySavePartnerForm #isHeadNode').val(result.isHeadNode);	 
		 	 $('#manageHeirarchySavePartnerForm #partner_loginName').attr('disabled',true);
		 	 
// 		 	if(result.recordTypeID!='14014')
// 		 	{
// 		 		$('#manageHeirarchySavePartnerForm #partner_ARN').attr('disabled',true);
// 	 			$('#manageHeirarchySavePartnerForm #partner_euin').attr('disabled',true);
// 		 	}
		 	 $('#manageHeirarchySavePartnerForm #partner_ARN').attr('disabled',true);
			 $('#manageHeirarchySavePartnerForm #partner_euin').attr('disabled',true);
			 $('#manageHeirarchySavePartnerForm #isHeadNode').removeAttr('disabled');
		 }
	 });
	
}
function getDeletePartner(partyId)
{
	//alert('partyId to delete='+partyId);
	$.ajax({
		type : 'POST',
		url :  $('#contextPath').val() +"/partner/deletePartner.htm?partyId="+partyId,
				success :function(result)
				{
					//alert(result);
					
					var result=result;					
					if(result==1){
						showAlertMessage1("Success",
								"<br/>User Deleted successfully.",
								"information",reloadPage);
 					}else {
 						showAlertMessage("Error","<br/> Error occured while deleting Partner. ", 'error', doNothing);
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
// 	    	isDocumentSelected=1;
			var documentName = $('#documentFiles').get(0).files[i].name;
	    	
	    	var regex = new RegExp("(.*?)\.(exe|jar|dll|apk|bat|bin|cmd|com|cpl|gadget|ins|inx|isu|job|jse|lnk|msc|msi|msp|mst|paf|pif|ps1|reg|rgs|sct|shb|shs|u3p|vb|vbe|vbs|vbscript|ws|wsf)$");	    	
	    	if(!(regex.test(documentName))) {
	    		isDocumentSelected=1;
	    	}else{	    		   
	    		showAlertMessage1("Error",
						"Executable Files not allowed. ",
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
		$('input[name="document"]').each(function(i,obj) { //loop through each checkbox
            this.checked = true;  //select all checkboxes with class   "checkbox1"    
		$(obj).attr('checked','checked');
        });
	}else{
		isCheckedDoc=true;
		$('input[name="document"]').removeAttr('checked');
	}
}


function openAddDocumentPopup(){
	
// 	$("#addnote").show();	
// 	$("#deletenote, #editnote").hide();	
// 	$('#addDocumentPopup').show();
// 	$('#blanket').show();
	$("#documentList").html("");
//		alert($(window).height())
// 	var height = ($(window).height() / 2) - (parseInt($('#addDocumentPopup').css('height'))/2);
//		alert(height)
// 	$('#addDocumentPopup').css('top',height);
// 	var width = ($(window).width() / 2) - (parseInt($('#addDocumentPopup').css('width'))/2);
// 	$('#addDocumentPopup').css('margin-left', width);
// 	$('#addDocumentPopup').css('position','fixed');
	$('#documentFiles').val('');
}


function openFileDailog(id){
	$('#'+id).click();
	document.getElementById("documentaddBtn").remove();
	
}

function removeDocument(){
    $(".ace-file-input .remove").click();
}

function saveDocument(){
	if(isDocumentSelected==1){
	//var partyIdnew=$('#partyIdFromRequest').val();
	openPopupWebApp('centerLoadingImage', 25, 35);	
 	//$('#documentPartyId').val(partyIdnew); 	
	//var partytId= $('#documentPartyId').val();
	$('#${sessionScope.userSession.partyId}').removeAttr('disabled');
	$.ajax({
        type: "GET",
        url : '<%=request.getContextPath() %>/common/saveDocuments.htm?partyId=${sessionScope.userSession.partyId}',
		data: $('#addDocumentFormData').serialize(),
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
     });
	}else{
		showAlertMessage1("Error",
				"<br/>Please select document first.",
				"error", doNothing);
		$('.ZebraDialog').css('z-index','9999999999999999');
	}
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
		$('#residenceAddressForm #pinCode').val($('#officeAddressForm #pinCode').val());
	}else{
		$('#residenceAddressForm #street1').val('');
		$('#residenceAddressForm #street2').val('');
		$('#residenceAddressForm #street3').val('');
		$('#residenceAddressForm #country').val(0);
		$('#residenceAddressForm #state').val(0);
		$('#residenceAddressForm #city').val('');
		$('#residenceAddressForm #cityHidden').val(0);
		$('#residenceAddressForm #pinCode').val('');
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
	$('#'+id+' input,#'+id+' select,#'+id+' form textarea').removeAttr('readonly');
	
	$('#isEmailActivated').attr('disabled','disabled');
	$('#isSmsActivated').attr('disabled','disabled');
	$('#isWebsiteActivated').attr('disabled','disabled');
	$('#isBackOfficeActivated').attr('disabled','disabled');
	//$('#theme').attr('disabled',true);
	$('#theme').attr('disabled',true);
	$('#arn').attr('readonly',true);
	
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
		$('#theme').attr('disabled',true);
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
		$('#theme').attr('disabled',false);
		$('#logoFile').removeAttr('disabled');
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
		$('#camsPassword').attr('type','password');
		$('#karvyPassword').attr('type','password');
		$('#sundaramPassword').attr('type','password');
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
		$('#theme').attr('disabled',true);
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
		url : $('#contextPath').val()+"/partner/deletePartnerLocationData.htm",
		data : $('#manageHeirarchyLocationForm').serialize(),
		success : function(result) {
			var recordCount=result[0];
			var isChildNodeExist=result[1];	
			
			if(recordCount==1){
				showAlertMessage1("Success",
						"<br/>Location Deleted successfully.",
						"information",reloadPage);
			}else if(isChildNodeExist==1){
				showAlertMessage("Error","<br/>The Location is not Empty.", 'error', doNothing);
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
	
	var currentNode=$('#manageHeirarchySavePartnerForm #currentNode').val();
	if(currentNode!=nodeId){
		$('#manageHeirarchyLocationForm #parentNodeId').val(nodeId);
		$('#manageHeirarchyLocationForm #level').val(level);
		$('#manageHeirarchyLocationForm #locationId').val(nodeId);
		locationNameToSet=locationName;
		locationDesToSet=locDescription;
		$('#locateName').append(locationNameToSet);
		$('#partName').append(locationNameToSet);
		openNachDialogForMove();
	}else{
		showAlertMessage("Message", "<br/> Please select another Location. User is in same Location.", "information", doNothing);
	}
}
var globalPartyId='';
function userClick(nodeId,partyId,name){	
	userNameToSet=name;
	usernamez=userNameToSet;
	globalPartyId=partyId;
	$("#locateName").empty();
	$("#partName").empty();
// 	$('#partName').append(userNameToSet);
	
	$('#manageHeirarchySavePartnerForm #partyId').val(partyId);
	$('#manageHeirarchySavePartnerForm #currentNode').val(nodeId);
}
function createTree(result){
 	//alert(result);
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
		}else{
			createChildNodesForMove(locationId,level,nodeList);
		}
	}); 
	
	$jq_1_9_1('#jstree2').jstree('destroy');
	$jq_1_9_1('#jstree2').jstree({
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
		setTimeout(function() {
			setChildArray(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

 function createChildNodesForMove(nodeId,nodeLevel,nodeList){
	 var currentNode = $('#manageHeirarchySavePartnerForm #currentNode').val();
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
			
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		} 
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
			obj.type=typeName;
			obj.nodeId=locationId;
			obj.level=level;
			obj.children=new Array();
			childArray.push(obj);
		}
		setTimeout(function() {
			setChildArray(nodeId,nodeLevel,childArray)
		}, 10000);
	});
}

function getChildArray(nodeId,nodeLevel){
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
	
	var i=0;
	while(i<currentArryToIterate.length){
	var obj=currentArryToIterate[i];
	var level=obj['level'];
	var nodeId1=obj['nodeId'];
	var level2=currentObj['level'];
	var nodeId2=currentObj['nodeId'];
	if(level==level2 && nodeId1==nodeId2){
		obj.children=childArray;
		currentArryToIterate[i]=obj;
		myObj.children=currentArryToIterate;
		return;
	}else{
	}
	i+=1;
	}
	}
$(function() {
	
	$('#pnl-mhaddedit .mh-action').hide();
	$('#pnl-mh-advisor-addedit .mh-action').hide();

	$('#pnl-mh-sec-addedit .mh-action').hide();
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=81,3,2,68,92,52,39',
		success : function(result) {
			$('#interestedFPs').empty();
			$('#salutationId').empty();
			$('#residenceAddress #country').empty();
			$('#residenceAddress #state').empty();
			$('#officeAddress #country').empty();
			$('#officeAddress #state').empty();
			$('#accounttype').empty();
			$('#theme').empty();
			$('#securityQuestionId').empty();
			
			$('#residenceAddress #country,#salutationId,#residenceAddress #state,#officeAddress #country,#officeAddress #state,#securityQuestionId').append('<option value="0">--Select--</option>')
			
			$(result).each(function(i,obj) {
				var codeTypeId=obj.codeTypeId;
				var codeValue=obj.codeValue;
				var codevalueId=obj.codeValueId;		
				
				if(codeTypeId==81){
				$('#salutationId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==3){
					$('#residenceAddress #country').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#officeAddress #country').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==2){
					$('#residenceAddress #state').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					$('#officeAddress #state').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==68){
					$('#accounttype').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==92){
					$('#theme').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}else if(codeTypeId==52){
					$('#securityQuestionId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
				}
				else if(codeTypeId==39 && obj.mappedValue1=='FPSections'){
					$('#interestedFPs').append('<div class="col-md-6"><label><input class="ace ace-switch ace-switch-7" type="checkbox" id="interestedFP'+codevalueId+'" name="interestedFP"><span class="lbl">&nbsp;&nbsp;&nbsp;&nbsp; '+ codeValue+'</span></label></div>');
				}
				
			});
	
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/partner/getPartnerProfileDetails.htm",
		success : function(result) {
			
			var firstName=result.firstName;
			var lastName=result.lastName;
			var userName=result.userName;
			var securityQuestionId=result.securityQuestionId;
			var securityAnswer=result.securityAnswer;
			var salutationId=result.salutationId;
			var companyName=result.companyName;
			var panNo=result.panNo;
			var contactEmail=result.contactEmail;
			var contactMobile=result.contactMobile;
			var alternetMobile=result.alternetcontact;
			var contactHome=result.contactHome;
			var dob=result.dob;
			var websiteUrl=result.websiteUrl;
			var arn=result.arn;
			var euin=result.euin;
			var emailCommunicationName=result.emailCommunicationName;
			var emailCommunicationId=result.emailCommunicationId;
			var addressDataList=result.addressDataList;
			var bankName=result.bankName;
			var branchname=result.branchname;
			var city=result.city;
			var accounttype=result.accounttype;
			var accountNo=result.accountNo;
			var micrCode=result.micrCode;
			var ifscCode=result.ifscCode;
			var isEmailActivated=result.isEmailActivated;
			var emailActivationDate=result.emailActivationDate;
			var serviceEmailId=result.serviceEmailId;
			var serviceEmailIdLastAccessedDate=result.serviceEmailIdLastAccessedDate;
			var isSmsActivated=result.isSmsActivated;
			var smsActivationDate=result.smsActivationDate;
			var isWebsiteActivated=result.isWebsiteActivated;
			var websiteActivationDate=result.websiteActivationDate;
			var websiteLastAccessedDate=result.websiteLastAccessedDate;
			var isBackOfficeActivated=result.isBackOfficeActivated;
			var backOfficeActivationDate=result.backOfficeActivationDate;
			var backOfficeLastAccessedDate=result.backOfficeLastAccessedDate;
			assetClassList=result.assetClassList;
			var productOfferingList=result.productOfferingList;
			var emailSignature=result.emailSignature;
			var disclaimer=result.disclaimer;
			var autoPlanEnabled=result.autoPlanEnabled;
			var dnd=result.dnd;
			var smsSignature=result.smsSignature;
			var theme=result.theme;
			var photo=result.photo;
			var logo=result.logo;
			var teamMemberDataList=result.teamMemberDataList;
			var manufacturerList=result.manufacturerList;
			allManufacturers=manufacturerList;
			$(manufacturerList).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				var attributeCodeId=object.attributeCodeId;
				if(attributeCodeId==46002){
					debtManufacturers.push(object);
				}else if(attributeCodeId==46001){
					equityManufacturers.push(object);
					debtManufacturers.push(object);
				}else if(attributeCodeId==46003){
					goldManufacturers.push(object);
				}else if(attributeCodeId==46004){
					insuranceManufacturers.push(object);
				}else if(attributeCodeId==46006){
					loansManufacturers.push(object);
				}else if(attributeCodeId==46007){
					realEstateManufacturers.push(object);
				}else if(attributeCodeId==46005){
					serviceManufacturers.push(object);
				}
			});
			var defaultOption='<option value="0">--Select--</option>';
			debtSelectHTML+='<select class="manufacturer">';
			debtSelectHTML+=defaultOption;
			$(debtManufacturers).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				debtSelectHTML+='<option value="'+partyId+'">'+attributeValue+'</option>';
			})
			debtSelectHTML+='</select>';
			
			equitySelectHTML+='<select class="manufacturer">';
			equitySelectHTML+=defaultOption;
			$(equityManufacturers).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				equitySelectHTML+='<option value="'+partyId+'">'+attributeValue+'</option>';
			})
			equitySelectHTML+='</select>';
			
			goldSelectHTML+='<select class="manufacturer">';
			goldSelectHTML+=defaultOption;
			$(goldManufacturers).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				goldSelectHTML+='<option value="'+partyId+'">'+attributeValue+'</option>';
			})
			goldSelectHTML+='</select>';
			
			insuranceSelectHTML+='<select class="manufacturer">';
			insuranceSelectHTML+=defaultOption;
			$(insuranceManufacturers).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				insuranceSelectHTML+='<option value="'+partyId+'">'+attributeValue+'</option>';
			})
			insuranceSelectHTML+='</select>';
			
			loansSelectHTML+='<select class="manufacturer">';
			loansSelectHTML+=defaultOption;
			$(loansManufacturers).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				loansSelectHTML+='<option value="'+partyId+'">'+attributeValue+'</option>';
			})
			loansSelectHTML+='</select>';
			
			realEstateSelectHTML+='<select class="manufacturer">';
			realEstateSelectHTML+=defaultOption;
			$(realEstateManufacturers).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				realEstateSelectHTML+='<option value="'+partyId+'">'+attributeValue+'</option>';
			})
			realEstateSelectHTML+='</select>';
			
			serviceSelectHTML+='<select class="manufacturer">';
			serviceSelectHTML+=defaultOption;
			$(serviceManufacturers).each(function(i,object) {
				var partyId=object.partyId;
				var attributeValue=object.attributeValue;
				serviceSelectHTML+='<option value="'+partyId+'">'+attributeValue+'</option>';
			})
			serviceSelectHTML+='</select>';
			
			$('#photoImage').attr('src',$('#contextPath').val()+'/app/images'+photo);
			$('#logoImage').attr('src',$('#contextPath').val()+'/app/images'+logo);
			
			$('#firstName').val(firstName);
			$('#lastName').val(lastName);
			$('#userName').html(userName);
			$('#securityQuestionId').val(securityQuestionId);
			$('#securityAnswer').val(securityAnswer);
			$('#salutationId').val(salutationId);
			$('#companyName').val(companyName);
			$('#panNo').val(panNo);
			$('#contactEmail').val(contactEmail);
			$('#contactMobile').val(contactMobile);
			$('#alternetcontact').val(alternetMobile);
			$('#contactHome').val(contactHome);
			$('#dob').val(dob);
			$('#websiteUrl').val(websiteUrl);
			$('#arn').val(arn);
			$('#euin').val(euin);
			$('#emailCommunicationName').val(emailCommunicationName);
			$('#emailCommunicationId').val(emailCommunicationId);
			$('#bankName').val(bankName);
			$('#branchname').val(branchname);
			$('#bankcity').val(city);
			$('#accounttype').val(accounttype);
			if(accounttype==0){
				$("#accounttype").val($("#accounttype option:first").val());
			}
			$('#accountNo').val(accountNo);
			$('#micrCode').val(micrCode);
			$('#ifscCode').val(ifscCode);
			if(isEmailActivated==1){
				$('#isEmailActivated').attr('checked','checked');
			}
			$('#emailActivationDate').html(emailActivationDate);
			$('#serviceEmailId').html(serviceEmailId);
			$('#serviceEmailIdLastAccessedDate').html(serviceEmailIdLastAccessedDate);
			if(isSmsActivated==1){
				$('#isSmsActivated').attr('checked','checked');
			}
			if(isWebsiteActivated==1){
				$('#isWebsiteActivated').attr('checked','checked');
			}
			$('#websiteActivationDate').html(websiteActivationDate);
			$('#websiteLastAccessedDate').html(websiteLastAccessedDate);
			if(isBackOfficeActivated==1){
				$('#isBackOfficeActivated').attr('checked','checked');
			}
			$('#backOfficeActivationDate').html(backOfficeActivationDate);
			$('#backOfficeLastAccessedDate').html(backOfficeLastAccessedDate);
			$('#emailSignature').html(emailSignature);
			$('#disclaimer').html(disclaimer);
			$('#dnd').html(dnd);
			$('#smsSignature').val(smsSignature);
			$('#theme').val(theme);
			$('#euin').html(result.euin);
			$('#location').html(result.location);
			$('#fbLink').val(result.fbLink);
			$('#twitterLink').val(result.twitterLink);
			
			if(autoPlanEnabled=='1'){
				$('#isAutoPlanEnabled').attr('checked','checked');
			}
			
			if(theme==0){
				$("#theme").val($("#theme option:first").val());
			}
			
			$('#camsPassword').val(result.camsPassword);
			$('#karvyPassword').val(result.karvyPassword);
			$('#sundaramPassword').val(result.sundaramPassword);
			
			$(addressDataList).each(function(i,obj) {
				var street1=obj.street1;
				var street2=obj.street2;
				var street3=obj.street3;
				var addressType=obj.addressType;
				var city=obj.city;
				var state=obj.state;
				var country=obj.country;
				var postalCode=obj.postalCode;
				
				if(addressType=='Home'){
					residenceCityId=obj.cityId;
					$('#residenceAddress #street1').val(street1);
					$('#residenceAddress #street2').val(street2);
					$('#residenceAddress #street3').val(street3);
					$('#residenceAddress #country').val(country);
					$('#residenceAddress #state').val(state);
					$('#residenceAddress #city').val(city);
					$('#residenceAddress #pinCode').val(postalCode);
				}else{
					officeCityId=obj.cityId;
					$('#officeAddress #street1').val(street1);
					$('#officeAddress #street2').val(street2);
					$('#officeAddress #street3').val(street3);
					$('#officeAddress #country').val(country);
					$('#officeAddress #state').val(state);
					$('#officeAddress #city').val(city);
					$('#officeAddress #pinCode').val(postalCode);
				}
			});
			$('#teamMemberDetail').empty();
			$(teamMemberDataList).each(function(i,obj) {
				var label=obj.label;
				var name=obj.name;
				var email=obj.email;
				var mobileNo=obj.mobileNo;
				if(i==0){
					$('#teamMemberDetail').append('<tr><td colspan="4"><strong>'+label+'</strong></td></tr><tr class=""><th class="thead"  >Name</th><th class="thead"  >Website</th><th class="thead"  >Mobile No. </th></tr>');
					
				}else{
					$('#teamMemberDetail').append('<tr><td colspan="4"><strong>'+label+'</strong> </td></tr><tr class=""><th class="thead"  >Name</th><th class="thead"  >Email ID</th><th class="thead"  >Mobile No. </th></tr>');
				}
				$('#teamMemberDetail').append('<tr><td >'+name+'</td><td >'+email+'</td><td >'+mobileNo+'</td></tr>');
			});
			
			
			$(assetClassList).each(function(i,obj) {
				var codeValueId=obj.codeValueId;
				var codeValue=obj.codeValue;
				var displaySeqNo=obj.displaySeqNo;
				$('#financialProductServices').append('<tr id="tr0'+codeValueId+'" name="'+codeValueId+'"><td >'+codeValue+'</td> <td ><span class="no" id="isServiceProvidedSpan'+codeValueId+'">No</span> <select name="isServiceProvided" class="form-control" id="isServiceProvidedSelect'+codeValueId+'" style="border:none;background:none;box-shadow:none;display:none;" onchange="changeLable('+codeValueId+')"><option value="0">No</option><option value="1">Yes </option> </select></td><td ><input  type="text" id="serviceCode'+codeValueId+'" style="border:none;background:none;box-shadow:none;" value=" " /></td><td id="select0'+codeValueId+'"></td></tr>');
			});
			var i=0;
			while(i<productOfferingList.length){
				var obj=productOfferingList[i];
				var assetClass=obj.attributeValue;
				obj=productOfferingList[i+1];
				var isServiceProvided=obj.attributeValue;
				obj=productOfferingList[i+2];
				var serviceCode=obj.attributeValue;
				obj=productOfferingList[i+3];
				var manufactureres=obj.attributeValue;
				obj=productOfferingList[i+4];
				i+=4;
				if(isServiceProvided==1){
					$('#isServiceProvidedSpan'+assetClass).html('Yes');
					$('#isServiceProvidedSpan'+assetClass).attr('class','yes');
					$('#isServiceProvidedSelect'+assetClass).val(isServiceProvided);
					$('#serviceCode'+assetClass).val(serviceCode);
					var m = manufactureres.split(",");
					$(m).each(function(i,obj) {
						var selectHtml='';
						if(assetClass==46002){
							selectHtml=debtSelectHTML;
						}else if(assetClass==46001){
							selectHtml=equitySelectHTML;
						}else if(assetClass==46003){
							selectHtml=goldSelectHTML;
						}else if(assetClass==46004){
							selectHtml=insuranceSelectHTML;
						}else if(assetClass==46006){
							selectHtml=loansSelectHTML;
						}else if(assetClass==46007){
							selectHtml=realEstateSelectHTML;
						}else if(assetClass==46005){
							selectHtml=serviceSelectHTML;
						}
						if(i==0){
							$('#select0'+assetClass).append('<i class="deleteicon none" onclick="removeManufacturer(\'tr0'+assetClass+'\','+assetClass+')"></i>'+selectHtml);
						}else{
							$('tr#tr'+(i-1)+assetClass).after('<tr id="tr'+i+assetClass+'" name="'+assetClass+'"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td id="select'+i+assetClass+'"><i class="deleteicon none" onclick="removeManufacturer(\'tr'+i+assetClass+'\','+assetClass+')"></i>'+selectHtml+'</td><tr>');
						}
						$('#select'+i+assetClass+' select').val(obj);
						if(i=m.length-1){
							$('#select'+i+assetClass).append('&nbsp;<a href="#" onClick="addnewManufacturer('+assetClass+');" name="'+assetClass+'"  alt="Add Manufacturer"  title="Add Manufacturers"><i class="addicon none"></i></a>');
						}
					});
				}
				
			}
			
			var documentsDataList=result.documentDataList;
			$(documentsDataList).each(function(i,obj){
				var fileName=obj.fileName;
				var documentName=obj.documentName;
				var documentCreatedBy=obj.createdByName;
				var documentCreatedDate=obj.createdDate;
				var docId=obj.documentId;
									
				$('#documentsDetails').append('<tbody>');
				$('#documentsDetails').append('<tr><td><span class="thead"><input id="documnet'+docId+'" name="document" type="checkbox" class="checkbox"></span></td> <td ><a onclick="downloadAttachment('+docId+')">'+fileName+'</a></td> <td>'+documentName+'</td> <td>'+documentCreatedBy+'</td> <td>'+documentCreatedDate+'</td> </tr>');
				$('#documentsDetails').append('</tbody>');
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
					$('#dob').datepicker({
						changeMonth : true,
						changeYear : true,
						maxDate : '0',
						yearRange : "1900:2200",
						dateFormat : "dd/mm/yy"

					});
				}
			}
				
			$('.nicEdit-panelContain').parent().css('width','100%');
			$('.wysiwyg-editor').parent().css('width','100%');
			$('body input,select,textarea').attr('disabled','disabled');
			
			$('#documentsDetailsDiv input,#addDocumentPopup input').removeAttr('disabled','disabled');
			$('#mh-sec-adduser input').removeAttr('disabled','disabled');
			$('#mh-sec-addlocation input').removeAttr('disabled','disabled');
			$('#mh-addlocation input').removeAttr('disabled','disabled');
			$('#buttons input').removeAttr('disabled','disabled');
			$('#photoFile').parent().hide();
			$('#btnPayment').removeAttr('disabled','disabled');
			var sectionId=localStorage.getItem('showSection');
			if(sectionId!='' && sectionId!=undefined){
			showDiv(sectionId);
			}
			localStorage.setItem('showSection','');
			makeEditor('emailSignature');
			makeEditor('disclaimer');
			makeEditor('dnd');
			$('.wysiwyg-editor').attr('contenteditable','false');
			
		}
	});
	}
	});
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
	})
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

function accessList(){
	  var partyId=0;
      var searchtext='';
      var memberName=usernamez;
      partyId=globalPartyId;
      window.location.href = $('#contextPath').val()+"/partner/roleAccessList.htm?partyId="+partyId+"&sourceId=31001"+"&memberName="+memberName;
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
			url : $('#contextPath').val()+'/partner/getHeirarchyData.htm',
			success : function(result) {
				createTree(result);
			}
	});
	}
	
	else if(id=="manageHierachyLinkDivForMoveUser")
	{
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/getHeirarchyData.htm',
			success : function(result) {
				trees(result);
			}
	});
	}
	
	else if(id=="onlineTransationDiv" && isVisited==0)
	{
		var partyid =0 ;
		var innerHTMML='';
		var purchaseList='';
		var redemptionList='';
		var switchList='';
		var registrationList='';
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/partner/getOLTransactionConfiguration.htm',
			success : function(result) {
				var partySetting = result.partySettings;
				var partyAttribute = result.partyAttributes;
				//for party setting
				$(partyAttribute).each(function(i,obj) {
					if(obj.id==146003){
						purchaseList=obj.name;
					}
					else if(obj.id==146004){
						redemptionList=obj.name;
					}
					else if(obj.id==146005){
						switchList=obj.name;
					}
					else if(obj.id==146006){
						registrationList=obj.name;
					}
				});
				//for party attribute
				$(partySetting).each(function(i,obj) {
					
					if(partyid != obj.partyId){
						partyid = obj.partyId;
						innerHTMML = innerHTMML+'<div class="form-group col-md-12 clearfix" id="'+obj.partyId+'">';
						innerHTMML = innerHTMML+'<label class="col-sm-4 control-label no-padding-right" for="isSmsActivated">';
						innerHTMML = innerHTMML+'<i class="addicon">'+obj.partyName+'</i></label>';
						//purchase
						if(obj.partySettingTypeId==146003){
							innerHTMML = innerHTMML+'<div class="col-sm-2" >';
							innerHTMML = innerHTMML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="purchaseMF" id="purchaseMF'+obj.partyId +'">'	
							innerHTMML = innerHTMML+'<span class="lbl"></span>';
							innerHTMML = innerHTMML+'</label> </div>';
						}//redemption
						else if(obj.partySettingTypeId==146004){
							innerHTMML = innerHTMML+'<div class="col-sm-2">';
							innerHTMML = innerHTMML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="redemptionMF" id="redemptionMF'+obj.partyId +'">'	
							innerHTMML = innerHTMML+'<span class="lbl"></span>';
							innerHTMML = innerHTMML+'</label> </div>';
						}//switch
						else if(obj.partySettingTypeId==146005){
							innerHTMML = innerHTMML+'<div class="col-sm-2">';
							innerHTMML = innerHTMML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="switchMF" id="switchMF'+obj.partyId +'" >'	
							innerHTMML = innerHTMML+'<span class="lbl"></span>';
							innerHTMML = innerHTMML+'</label> </div>';
						}//SIP registration
						else if(obj.partySettingTypeId==146006){
							innerHTMML = innerHTMML+'<div class="col-sm-2">';
							innerHTMML = innerHTMML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="SIPRegistration" id="SIPRegistration'+obj.partyId +'" >'	
							innerHTMML = innerHTMML+'<span class="lbl"></span>';
							innerHTMML = innerHTMML+'</label> </div>';
						}
						innerHTMML = innerHTMML+'</div>';
						$("#productList").append(innerHTMML);
						innerHTMML = '';
					}
					else if(partyid == obj.partyId){
						var newHTML='';
						//purchase
						if(obj.partySettingTypeId==146003){
							newHTML = newHTML+'<div class="col-sm-2" >';
							newHTML = newHTML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="purchaseMF" id="purchaseMF'+obj.partyId +'">'	
							newHTML = newHTML+'<span class="lbl"></span>';
							newHTML = newHTML+'</label> </div>';
						}//redemption
						else if(obj.partySettingTypeId==146004){
							newHTML = newHTML+'<div class="col-sm-2">';
							newHTML = newHTML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="redemptionMF" id="redemptionMF'+obj.partyId +'">'	
							newHTML = newHTML+'<span class="lbl"></span>';
							newHTML = newHTML+'</label> </div>';
						}//switch
						else if(obj.partySettingTypeId==146005){
							newHTML = newHTML+'<div class="col-sm-2">';
							newHTML = newHTML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="switchMF" id="switchMF'+obj.partyId +'" >'	
							newHTML = newHTML+'<span class="lbl"></span>';
							newHTML = newHTML+'</label> </div>';
						}//SIP registration
						else if(obj.partySettingTypeId==146006){
							newHTML = newHTML+'<div class="col-sm-2">';
							newHTML = newHTML+'<label> <input name="switch-field-1" class="ace ace-switch ace-switch-7" type="checkbox" name="SIPRegistration" id="SIPRegistration'+obj.partyId +'" >'	
							newHTML = newHTML+'<span class="lbl"></span>';
							newHTML = newHTML+'</label> </div>';
						}
						$("#"+obj.partyId).append(newHTML);		
					}
				});//end loop
				//assign selected values to checkbox
				purchaseList = purchaseList.split(",");
				if(purchaseList != "" && purchaseList != ''){
					for(var i=0;i<purchaseList.length-1;i++){
						$("#purchaseMF"+purchaseList[i]).attr('checked','checked');
					}
				}
				redemptionList = redemptionList.split(",");
				if(redemptionList != "" && redemptionList != ''){
					for(var i=0;i<redemptionList.length-1;i++){
						$("#redemptionMF"+redemptionList[i]).attr('checked','checked');
					}
				}
				switchList = switchList.split(",");
				if(switchList != "" && switchList != ''){
					for(var i=0;i<switchList.length-1;i++){
						$("#switchMF"+switchList[i]).attr('checked','checked');
					}
				}
				registrationList = registrationList.split(",");
				if(registrationList != "" && registrationList != ''){
					for(var i=0;i<purchaseList.length-1;i++){
						$("#SIPRegistration"+registrationList[i]).attr('checked','checked');
					}
				}
			
				
			}//end success
	});//end ajax
		isVisited=1;
		$('body, html, #onlineTransationDiv').scrollTop(0);
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
function savePartnerProfile(id){
	var isValidated=true;
	var sectionName="";
	var actionName="";
	var formId="";
	if(id=='personalInfo_1FormDiv'){
		isValidated=validateInputForm(id);
		if(isValidated==true){
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
	            		$('#photoImage').attr('src',$('#contextPath').val()+'/app/images'+msg[1]);
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
		
		if($('#securityAnswer').val()=='')
			{
			showAlertMessage1("Error",
					"<br/>Please enter the Security Answer.",
					"error", doNothing);
			$('.ZebraDialog').css('z-index','9999999999999999');
			isValidated=false;
			}
		
		if($('#securityAnswer').val()!='' && ($('#securityQuestionId').val()==0 && $('#securityQuestionId').val()==undefined)){
			isValidated=false;
			$('#securityQuestionId').css('border-color','red');
			$('#securityQuestionId').attr('title', 'Please Select Security Question.');
		}
		
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
		sectionName="InterestedFPDetails";		
		actionName="partner/savePartnerProfileData.htm?partyId=${sessionScope.userSession.partyId}&sectionName="+sectionName;
		isValidated=validateInputForm(id);
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
	}else if(id=='manageHeirarchyLocation'){
		sectionName="ManageHeirarchyLocation";
		actionName="partner/savePartnerLocationData.htm";	
		formId="manageHeirarchyLocationForm";
		isValidated=validateInputForm(formId);
		var nodeLocation=$('#nodeLocation').val();
		var nodeDescription=$('#nodeDescription').val();
		var nodePartyId=<%=userSession.getPartyId()%>;
		
		if(nodeLocation=='' || nodeDescription=='')
		{
			isValidated=false;
		} else{
			isValidated=true;
		}

		if(isValidated==true){
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/'+actionName,
				data:$('#manageHeirarchyLocationForm').serialize(),
				success : function(result) {
					
					var locationresult=result;
					
					if(result==1){						
						$('#locationresult').val("1");
						showAlertMessage("Success", "<br/>Location saved successfully.", "confirmation", redirectHierarchy);
					}
					else{
						
					}
					
				}
			});		
		}
	}
	else if(id=="manageHeirarchySavePartner")
	{
	actionName="partner/savePartnerData.htm";
	formId="manageHeirarchySavePartnerForm";
	var pst =71709;
	var isValidData =true;
	isValidData =addPartnerRequiredValidation();
	 
	var partyId = $('#manageHeirarchySavePartnerForm #partyId').val();
	var nameuser=$('#partner_loginName').val();
	
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
		}else{
			formId='EmailOtherDetailsFormHidden';
			$('#smsSignatureHidden').val($('#smsSignature').val())
			$('#themeNameHidden').val($("#theme option:selected").text());
			$('#themeHidden').val($('#theme').val());
		}
		$('#'+formId+' input').removeAttr('disabled');
		
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
	}
	else if(id=='change_password_div'){
		//isValidated=validateInputForm('changePasswordForm');
		var isPopupOpen=false;
		if(isValidated==false){
			isPopupOpen=true;
		}
		var oldPassword=$('#oldPassword').val();
		var newPassword=$('#newPassword').val();
		var confirmPassword=$('#confirmPassword').val();
		 if (oldPassword.length == 0 || !(oldPassword.length > 0)) {
				$('oldPassword_error').html('Please provide a valid current password.');
				addCssStyles('oldPassword','Please provide a valid current password.');
				$('#oldPassword').css('border','1px solid red');
				$('#oldPassword').attr('title','Please provide a valid current password.');
				isValidated=false;
				$('#oldPassword_error').removeClass('hide');;
				$('#oldPassword_error').parent().parent().parent().addClass('has-error');
			}
		 if (confirmPassword.length == 0) {
				$('confirmPassword_error').html('Please provide a valid confirm password.');
				addCssStyles('confirmPassword','Please provide a valid confirm password.');
				$('#confirmPassword').css('border','1px solid red');
				$('#confirmPassword').attr('title','Please provide a valid confirm password.');
				isValidated=false;
				$('#confirmPassword_error').removeClass('hide');;
				$('#confirmPassword_error').parent().parent().parent().addClass('has-error');
			}
		if ((newPassword.length<8 || newPassword.length>15) && newPassword.length > 0) {
			$('#newPassword_error').html('New Password must be 8-15 characters long.');
			addCssStyles('newPassword','New Password must be 8-15 characters long.');
			$('#newPassword').css('border','1px solid red');
			$('#newPassword').attr('title','New Password must be 8-15 characters long.');
			isValidated=false;
			$('#newPassword_error').removeClass('hide');;
			$('#newPassword_error').parent().parent().parent().addClass('has-error');
			
		}else if (newPassword.contains(' ')) {
			$('#newPassword_error').html('Space are not allow in password field.');
			addCssStyles('newPassword','Space are not allow in password field.');
			$('#newPassword').css('border','1px solid red');
			$('#newPassword').attr('title','Space are not allow in password field.');
			isValidated=false;
			$('#newPassword_error').removeClass('hide');;
			$('#newPassword_error').parent().parent().parent().addClass('has-error');

		} else if (!newPassword.match(/^(?=.*?[a-z])(?=.*?\d)(?=.*[!@.#$%^&*])/i)) {
			$('#newPassword_error').html('At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
			addCssStyles('newPassword','At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
			$('#newPassword').css('border','1px solid red');
			$('#newPassword').attr('title','At least one letter, one digit and one special character from [!,@,.,#,$,%,^,&,*] required in password.');
			isValidated=false;
			$('#newPassword_error').removeClass('hide');;
			$('#newPassword_error').parent().parent().parent().addClass('has-error');
		}else{
			$('#newPassword').css('border-color','grey');
			$('#newPassword').removeAttr('title');
		}
		if(newPassword!=confirmPassword){
			$('#confirmPassword_error').html('Confirm Password must be same as New Password.');
			addCssStyles('confirmPassword','Confirm Password must be same as New Password.');
			$('#confirmPassword').css('border','1px solid red');
			$('#confirmPassword').attr('title','Confirm Password must be same as New Password.');
			isValidated=false;
			$('#confirmPassword_error').removeClass('hide');;
			$('#confirmPassword_error').parent().parent().parent().addClass('has-error');
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
			//showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
			$('.ZebraDialog').css('z-index','9999999999');
		}
		
		
	}
		
	if(isValidated==true && id!='personalInfo_1FormDiv' && id!='email_other_details' && id!='financialProductServicesFormDiv' && id!='change_password_div' && id!='interestedFPDetails' && id!='autoPlanConfigurationDetails' && id!='manageHeirarchyLocation' && id!='manageHeirarchySavePartner' ){
		//alert('Hi');
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/'+actionName+'?sectionName='+sectionName,
			data:$('#'+formId).serialize(),
			success : function(result) {
				if(result>0){
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing)
				}else{}
				
				if(id=='user_account_details'){	
					$('#password').val('****');
				//	alert('Hi--'+id);
					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
				}	
				else if(id=='residenceAddress'){
				$('#sameAsAboveSpan').hide();}
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

function getUniqueArn()
{
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
	$('#popUpChangePassword').modal('show');
}
function closeChangePasswordPopup(){
	$('#popUpChangePassword').hide();
	$('#blanket').hide();
}
function applyTheme(){
	//$('body').append('<link rel="stylesheet" href="'+$('#contextPath').val()+'/css/'+$("#theme option:selected").text()+'.css" />');
	$('#mainheaderBody').attr('class','no-skin '+$("#theme option:selected").text()+'_'+$("#theme").val()+'');
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
function printMe(){
	alert('printMe');
	var PDF = document.getElementById('printFrame');
      PDF.focus();
      PDF.contentWindow.print();
	
}

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
           
	var subxRows='';
		
	for(var i=0;i<data.length;i++){
		console.log(data[i]);
		subxRows+='<tr><td>'+data[i]['productName']+'</td><td>'+data[i]['startDate']+'</td><td>'+data[i]['endDate']+'</td><td>'+data[i]['type']+'-'+data[i]['status']+'</td></tr>';
	}
	$('#subxTable tbody').empty();
	$('#subxTable tbody').html(subxRows);
		
		if(newSubxData){
	
		$('#newSubxData').html('<strong>'+newSubxData[0]['activeSubx']+'</strong>');
		
		 $('#btnPayment').attr('disabled',false);
		
		if(newSubxData[0]['subxPlanLimit']!=0){
			if(newSubxData[0]['planCount']<newSubxData[0]['subxPlanLimit']){
			$('#countPlan').html("Get one month free subscription by creating "+(newSubxData[0]['subxPlanLimit']-newSubxData[0]['planCount']) +" more plans");
		
			}
			else{
					$('#countPlan').html("Congratulation !! You will get one month free subscription.");
			}
		}
		$('#categoryId').val(newSubxData[0]['categoryId']);
	}
	else{
		
		$('#btnPayment').attr('disabled',true);
		$('#btnPayment').hide();
	} 
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
	           +'<a  href="'+reportLink+'&paymentId='+data[i]["paymentID"]+'"><span class="user">' 
	           + 'Download Receipt</span></a></li>'
	           +'<li id="paymentPrint">'
	           +'<a  onClick="popup('+popUpAlertaddnote+');reportnote();getPaymentReceipt('+clickData+' '+data[i]['paymentID']+')"><span class="user">' 
	           +'Print Receipt</span></a></li> </ul></span></display:column>';
		 
		 validity=data[i]['validTill'];
		 }
	  paymentRows+='<tr><td>'+data[i]['paymentDate']+'</td><td>'+data[i]['productName']+'</td><td>'+ validity+'</td><td>'+data[i]['TrxnRefNo']+'</td><td>'+data[i]['pgTrx']+'</td><td>'+data[i]['paymentAmount']+'/-</td><td>'+data[i]['paymentStatus']+'</td><td>'+actions+'</td></tr>';
	 
	 }
	 
	 $('#paymentTable tbody').html(paymentRows);
	}

function getPaymentReceipt(reportName,partyId,paymentId) {
	 var ReportFormat="pdf";
	 var buId=<%=userSession.getBuId()%>
	var reporturl ="<%=request.getContextPath()%>/pg/printReceipt.htm?ReportName="+reportName+"&ReportFormat=html&paymentId="+paymentId+"&partyId="+partyId+"&buId="+buId;
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
}
function bindNACHDiv(data){
	$('#nachInitiate').hide();
		$('#nachDetail').show();
	if(data){
	
	$('#nachPartyName').val(data['partyName']);
	$('#nachBankName').val(data['bankName']);
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
	}
	
	for(var i=0;i<data['status'].length;i++){
		
		var selected='';
		if(data['statusId']==data['status'][i]['id']){
			selected='selected';
		}
		
		$('#nachStatus').append('<option value="'+data['status'][i]['id']+'"'+selected+'>'+data['status'][i]['value']+'</option>');
	}
	for(var i=0;i<data['accountType'].length;i++){
		var selected='';
		if(data['accountTypeId']==data['accountType'][i]['id']){
			selected='selected';
		}
		$('#accounttypeId').append('<option value="'+data['accountType'][i]['id']+'"'+selected+'>'+data['accountType'][i]['value']+'</option>');
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
 	 $.ajax({
			type : 'GET',
			url :  $('#contextPath').val() +"/partner/updateCurrentNodeIdForPartyId.htm?partyId="+partyId+"&nodeId="+nodeId,
					success :function(result)
					{
						var result=result;					
						if(result==1){
							showAlertMessage1("Success",
									"<br/>User Moved successfully.",
									"information",reloadPage);
	 					}else {
	 						showAlertMessage("Error","<br/> Error occured while Moving User. ", 'error', doNothing);
	 					}
					}
		});
} 

function  reportnote()
{
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
    		$('#subscriptionDiv input').prop('disabled',false);
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

//save Online transaction configuration
function saveOnlineConfiguration(){

		var checkedIds="";
		var purchaseMFList="";
		var redemptionMFList="";
		var switchMFList="";
		var SIPRegistrationList="";
		//var id = id.substring(id.indexOf('purchaseMF')+12);
		
		checkedIds =checkedIds+  $("#productList :checkbox:checked").map(function() {
			if((this.id).substring(0,8).localeCompare('purchase')==0){
				purchaseMFList =purchaseMFList+(this.id).substring(10,15)+','; 
			}
			else if((this.id).substring(0,10).localeCompare('redemption')==0){
				redemptionMFList =redemptionMFList+(this.id).substring(12,17)+','; 
			}
			else if((this.id).substring(0,6).localeCompare('switch')==0){
				switchMFList =switchMFList+(this.id).substring(8,13)+','; 
			}
			else if((this.id).substring(0,15).localeCompare('SIPRegistration')==0){
				SIPRegistrationList =SIPRegistrationList+(this.id).substring(15,20)+','; 
			}
		       return this.id;
		    }).get(); 
		
		var URLString =  $('#contextPath').val() +"/partner/saveOLTransactionConfiguration.htm?purchase="+purchaseMFList+
				"&redemption="+redemptionMFList+"&switch="+switchMFList+"&SIPRegistration="+SIPRegistrationList
		$.ajax({
			 type :'GET',
	         url : URLString,
	         success : function(result)
			 {
			 	if(result){
			 		$('body, html, #onlineTransationDiv').scrollTop(0);
			 		showAlertMessage1("Success",
							"<br/>Configuration saved successfully.",
							"information",doNothing);
			 	}
			 	else{
			 		showAlertMessage("Error","<br/> Error occured while saving Configuration. ", 'error', doNothing);
			 	}
			 }
		 });
}


$('#contactHome').blur(function(){
	if($('#contactHome').val().length < 10){
		 //alert("Home Phone No's length should not be less than 10 digit.");
		 showAlertMessage1("Error", "Home Phone no's length should not be less than 10 digit." + '\n', "confirmation", doNothing);
		 $('#contactHome').val('');
		 $('#contactHome').css('border','1px solid red');
		// $("#contactHome").focus();
	}else{
		$('#contactHome').css('border-color','');
	}
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
     <a onClick="printDiv('reportview')" style="float: right;margin-top: 5px;margin-right: 20px;padding: 5px;background-color: #ae2760;border-radius: 5px;width: 80px;text-align: center;font-size: 13px;color: #fff;">Print</a>
    </div>
    <div id="downloadOptions" align="right">
    </div>
    <div id="poptable_contactform" style="padding: 10px; height: 850px;width:800px;">

     <div id="reportview"></div>
    </div>
   </div>
  </div>
 </div>

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
 <form id="changePasswordForm">
			 <table class="table table-striped" cellpadding="5" cellspacing="5" id="change_password_div" style="width: 98%;margin-left: 10px;margin-top: 10px;">
                <tr>
                      <td width="22%" style="border-top: none !important;">Current Password <span class="red">*</span></td>
               	      <td width="78%" style="border-top: none !important;"><input  type="password" id="oldPassword" name="oldPassword" maxlength="15" style="width: 100%" emsg="Current Password"/></td>
                </tr>
                 <tr>
                 	    <td width="22%" style="border-top: none !important;"></td>
               	  		<td width="22%" style="border-top: none !important;"><span id="oldPassword_error" class="help-block hide">Please provide a valid current password.</span></td>
                </tr>
                <tr>
                    	<td width="22%" style="border-top: none !important;">New Password <span class="red">*</span></td>
               	  		<td width="78%" style="border-top: none !important;"><input  type="password" id="newPassword" name="newPassword" maxlength="15" style="width: 100%" emsg="New Password"/></td>
                </tr>
                 <tr>
                 	    <td width="22%" style="border-top: none !important;"></td>
               	  		<td width="22%" style="border-top: none !important;"><span id="newPassword_error" class="help-block hide">Please provide a valid new password.</span></td>
                </tr>
                <tr>
                    <td width="25%" style="border-top: none !important;">Confirm Password <span class="red">*</span></td>
               	  	<td width="78%" style="border-top: none !important;"><input  type="password" id="confirmPassword" name="confirmPassword" maxlength="15" style="width: 100%"  emsg="Confirm Password"/></td>
                </tr>
                <tr>
                        <td width="22%" style="border-top: none !important;"></td>
               	  		<td width="22%" style="border-top: none !important;"><span id="confirmPassword_error" class="help-block hide">Please provide a valid confirm password.</span></td>
                </tr>
                 <tr>
                      <td colspan="2" align="right" style="border-top: none !important;"> <input id="changePasswordButton" class="btn btn-primary btn-xs" type="button" value="Save" name="change_password_div" onclick="savePartnerProfile(name)">  <input id="save" class="btn btn-primary btn-xs" type="button" value="Cancel" name="change_password_div" onclick="closeChangePasswordPopup()"></td>
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