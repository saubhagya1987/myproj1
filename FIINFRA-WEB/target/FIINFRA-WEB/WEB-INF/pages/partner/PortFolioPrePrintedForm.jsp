<!DOCTYPE html>
<html lang="en"><head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>PortFolio : Preprinted Form</title>

<script type="text/javascript">
var hidePopupTimeoutId;
$(".choose1").live("click", function (e) {
    clearTimeout( hidePopupTimeoutId );
    var id='#docId_'+$(this).attr('id');
    $(id).show();
    return false; // prevent default click action from happening!
    e.preventDefault(); 
});

$(".popupform").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".popupform").live("mouseleave", function() {
    $(".popupform").hide();
});


</script>
<style>
.popupform{
position: relative;
top: 45%;
left: 0%;
}
</style>
<style>
	 .ui-autocomplete {
	    max-height: 270px;
	    overflow-y: auto;
	    /* prevent horizontal scrollbar */
	    overflow-x: hidden;
	    /* add padding to account for vertical scrollbar */
	    padding-right: 20px;
		}
		/* IE 6 doesn't support max-height
		 * we use height instead, but this forces the menu to always be this tall
		 */
		* html .ui-autocomplete {
		    height: 100px;
		}
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>

 <!-- Center part start -->
 <section>
    <div class="">
          		<div class="page-header">
				<h1>Preprinted Form</h1>
			</div>
            <div class="tabbable">
    <ul class="nav nav-tabs" id="">
      <li class="dropdown"> <a id="myportfolio" data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">My Portfolio <i class="ace-icon fa fa-caret-down bigger-110 width-auto"></i></a>
        <ul class="dropdown-menu dropdown-info" id="myportfolioMenu">
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/folio/foliopage.htm'">MF Portfolio</a> </li>
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/folio/openclientportfolio.htm'">Client Portfolio </a> </li>
        </ul>
      </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getTxnSource.htm'">RTA File Uploads </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm'">Reports</a> </li>
      <li class="active"> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}'">Preprinted Form</a> </li>
      <li id="autoAllocatedAssetsLink"> <a onclick="window.location.href='<%=request.getContextPath()%>/et/assetAutoAllocation.htm'">Auto Allocated Assets</a> </li>
        <li id="autoAllocatedAssetsLink"> <a onclick="showPasswordDialog();">MF Auto Upload Configuration</a> </li>
    </ul>
    <div class="tab-content">
      <div id="" class="tab-pane fade in active clearfix">
       
	            <jsp:include page="PortFolioPrePrintedActions.jsp"></jsp:include> 
   <form name="saveEtForm" id="saveEtForm">
        <div class="col-md-9"  style="margin-top:0px; padding-left:10px;" >
			
 <!-- center -->
			 <input type="hidden" id="hdnclientpartyid"/>      
			<div class="list-group">
			  <a class="list-group-item active" href="#">Preprinted Form <span id="hdnClientName"></span></a>
  
<!--  ------------------------------------------------------------  -->

                        <div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									<div class="widget-header">
										<h5 class="widget-title">Form Details</h5>
									</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"
												for="quickSearch">Client Name<span class="red">*</span></label>
												<input type="hidden" id="blankClientPartyId" validate="1" emsg="Client Name">
           										<input type="hidden" id="blankProductId" validate="1" emsg="Product">
											<div class="col-sm-9">
												 <input class="input-xxlarge" name="searchtext" type="text" id="quickSearch" validate="1" emsg="Client Name" placeholder="Search Client Name" onkeyup="quickSearchContacts();">
												<div id="quickSearch_error" class="help-block hide">Please
													provide a valid client name.</div>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"
												for="fpExecutionId">Product<span class="red">*</span></label>
											<div class="col-sm-9">
													  <input class="input-xxlarge" name="select"   id="fpExecutionId" validate="1" emsg="Product"   type="text" placeholder="MF Product Search"  onChange="loadForm(this.value);">
												<div id="fpExecutionId_error" class="help-block hide">Please
													provide a valid product.</div>
											</div>
										</div>
									</div>
									
									
										<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"
												for="investmentAmount">Investment Amount<span class="red">*</span></label>
											<div class="col-sm-9">
												  <input type="text" class="input-xxlarge" title="Investment Amount" value="" id="investmentAmount"  validate="1" emsg="Investment Amount" onkeypress="return isNumber(event)">
												<div id="investmentAmount_error" class="help-block hide">Please
													provide a valid investment amount.</div>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"
												for="txnType">Transaction Type<span class="red">*</span></label>
											<div class="col-sm-9">
												 <select name="select" class="input-xxlarge" id="txnType" validate="select" emsg="Transaction Type">
													<option>Growth</option>
													<option>Dividend Reinvest</option>
													<option>Dividend Payout</option>
												</select>

												<div id="fpExecutionId_error" class="help-block hide">Please
													provide a valid transaction type.</div>
											</div>
										</div>
									</div>
									
										<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"
												for="investmentType">Investment Type<span class="red">*</span></label>
											<div class="col-sm-9">
												  
												   <select name="select"  class="input-xxlarge" id="investmentType" validate="1" emsg="investment type">
								                      <option >Growth </option>
								                      <option >Dividend Reinvest </option>
								                      <option >Dividend Payout </option>
								                  </select>
												  
												<div id="investmentType_error" class="help-block hide">Please
													provide a valid investment type.</div>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"
												for="txnType"></label>
											<div class="col-sm-9">
											</div>
										</div>
									</div>
									</div></div></div></div>
									
									
									<!--Distributor Details Start -->
							<div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									<div class="widget-header">
										<h5 class="widget-title">Distributor Details</h5>
									</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">ARN Code</label>
											<div class="col-sm-9">
												 <input type="text" class="input-xxlarge" title="Arn Code" id="arnCode" onkeypress="return isNumber(event)">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Sub-broker Code</label>
											<div class="col-sm-9">
											    <input type="text" class="input-xxlarge" title="Sub Broker Code" id="subBrokerCode" onkeypress="return isNumber(event)">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">EUIN No</label>
											<div class="col-sm-9">
												  <input type="text" class="input-xxlarge" title="euin" id="euin" >
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"> </label>
											<div class="col-sm-9">
											</div>
										</div>
									</div>
									</div></div></div></div>
									<!--Distributor Details End -->
									
									<!--Investor Details (1st Applicant) Start -->
							<div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									<div class="widget-header">
										<h5 class="widget-title">Investor Details (1st Applicant)</h5>
									</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Existing Folio No</label>
											<div class="col-sm-9">
												 <select id="folioNo" style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" class="input-xxlarge" onchange="document.getElementById('displayValue').value=this.options[this.selectedIndex].text; document.getElementById('idValue').value=this.options[this.selectedIndex].value;loadFolioDetails()">
                                                 </select>
                                                 <input name="displayValue" class="input-xxlarge" placeholder="Type or select folio no" id="displayValue" style="position:absolute;top:0px;left:0px;width:183px;width:180px\9;#width:180px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
												 <input name="idValue" id="idValue" type="hidden">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Title</label>
											<div class="col-sm-9">
											    <select name="Query To" class="input-xxlarge"
													id="firstHolderTitle">
													<option>Mr.</option>
													<option>Mrs.</option>
												</select>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Name</label>
											<div class="col-sm-9">
												 <input type="text" class="input-xxlarge" title="" id="firstHolderName">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Gender</label>
											<div class="col-sm-9">
												<select name="Query To" class="input-xxlarge"
													id="firstHolderGender">
													<option>Male</option>
													<option>Female</option>
												</select>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Date of Birth</label>
											<div class="col-sm-9">
												 <input type="text" class="input-xxlarge  pull-left" title="Birth Date" placeholder="dd/mm/yyyy" width="300" id="firstHolderDob">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">PAN</label>
											<div class="col-sm-9">
												 <input type="text" class="input-xxlarge" title="" id="firstHolderPanNo" maxlength="10" onchange="ValidatePAN(this.value,'#firstHolderPanNo');" >
											</div>
										</div>
									</div>
									
										<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right" for="firstHolderEmailId">Email ID<span style="color:red">*</span></label>
											<div class="col-sm-9">
											  <input type="text" class="input-xxlarge" title="" id="firstHolderEmailId" validate="email" emsg="email">
											  <div id="firstHolderEmailId_error" class="help-block hide">Please provide a valid email id.</div>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Mobile No</label>
											<div class="col-sm-9">
												 <input type="text" class="input-xxlarge" title="" id="firstHolderMobileNo" onkeypress="return isNumber(event)"  maxlength="12">
											</div>
										</div>
									</div>
									
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Contact No (Res)</label>
											<div class="col-sm-9">
											   <input type="text" class="input-xxlarge" title="" id="firstHolderContactNoRes" onkeypress="return isNumber(event)">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Contact No (Off)</label>
											<div class="col-sm-9">
											 <input type="text" class="input-xxlarge" title="" id="firstHolderContactNoOff" onkeypress="return isNumber(event)">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"> Guardian Name [for Minor]</label>
											<div class="col-sm-9">
											   <input type="text" class="input-xxlarge" title="" id="firstHolderGuardianName">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Guardian Relationship </label>
											<div class="col-sm-9">
											 <select name="Query To" class="input-xxlarge"
													id="firstHolderGuardianRelation">
													<option>Mother</option>
													<option>Father</option>
													<option>Court Appointed</option>
											</select>
											</div>
										</div>
									</div>
									</div></div></div></div>
									<!--Investor Details (1st Applicant) End -->
									
									 <!--Investor Details (2nd Applicant)Start -->
					 <div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									 <div class="widget-header">
										<h5 class="widget-title">Investor Details (2nd Applicant)</h5>
									</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Title</label>
											<div class="col-sm-9">
												<select
													name="Query To" class="input-xxlarge" id="secondHolderTitle">
													<option>Mr.</option>
													<option>Mrs.</option>
												</select>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Name</label>
											<div class="col-sm-9">
											    <select id="secondHolderName" style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue1').value=this.options[this.selectedIndex].text; document.getElementById('idValue1').value=this.options[this.selectedIndex].value; getPan(this.value,'#secondHolderPanNo','#secondHolderTitle');">
												</select>
												<input name="displayValue1" placeholder="Type or select name" id="displayValue1" style="position:absolute;top:0px;left:0px;width:183px;width:180px\9;#width:180px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
												<input name="idValue1" id="idValue1" type="hidden">
										   </div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"></label>
											<div class="col-sm-9">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right" for="secondHolderPanNo">PAN</label>
											<div class="col-sm-9">
											    <input type="text" class="input-xxlarge" title="" id="secondHolderPanNo" maxlength="10" validate="pan" emsg="pan"  onchange="ValidatePAN(this.value,'#secondHolderPanNo');">
											    <div id="secondHolderPanNo_error" class="help-block hide">Please provide a valid pan.</div>
										   </div>
										</div>
									</div>
									</div></div></div></div>
									 <!--Personal Details End -->  
									 
									 <!--Investor Details (3rd Applicant)Start -->
							<div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									  <div class="widget-header">
										<h5 class="widget-title">Investor Details (3rd Applicant)</h5>
									</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Title</label>
											<div class="col-sm-9">
												<select name="Query To" class="input-xxlarge"
													id="thirdHolderTitle">
													<option>Mr.</option>
													<option>Mrs.</option>
												</select>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Name</label>
											<div class="col-sm-9">
												<select id="thirdHolderName" style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue2').value=this.options[this.selectedIndex].text; document.getElementById('idValue2').value=this.options[this.selectedIndex].value;getPan(this.value,'#thirdHolderPanNo','#thirdHolderTitle');">
												</select>
												<input name="displayValue2" placeholder="Type or select name" id="displayValue2" style="position:absolute;top:0px;left:0px;width:183px;width:180px\9;#width:180px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
												<input name="idValue2" id="idValue2" type="hidden">
										   </div>
										</div>
									</div>
									 
									 	
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"></label>
											<div class="col-sm-9">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right" for="thirdHolderPanNo">PAN</label>
											<div class="col-sm-9">
											    <input type="text" class="input-xxlarge" title="" id="thirdHolderPanNo" maxlength="10" validate="pan" emsg="pan"  onchange="ValidatePAN(this.value,'#thirdHolderPanNo');">
											    <div id="thirdHolderPanNo_error" class="help-block hide">Please provide a valid pan.</div>
										   </div>
										</div>
									</div>
									</div></div></div></div>
								<!--Investor Details (3rd Applicant) End -->
										 
								<!--Investor Address (1st Applicant)Start -->
								
								<div class="row">
	    						<div class="widget-box" style="margin-top:10px;">
						        <div class="widget-body">
						        	<div class="widget-main clearfix">
										 <div class="widget-header">
											<h5 class="widget-title">Address Details (1st Applicant)</h5>
										</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Address</label>
											<div class="col-sm-9">
											 <input type="text" class="input-xxlarge" title="" id="firstHolderAddress">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Country</label>
											<div class="col-sm-9">
												<select name="City3" class="input-xxlarge"
													id="firstHolderCountry">
													<option>India</option>
												</select>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">State</label>
											<div class="col-sm-9">
											 <input type="text" name="City2" class="input-xxlarge" id="firstHolderState" onBlur="getCities(this.value,'firstHolderCity')"/>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">City</label>
											<div class="col-sm-9">
												<input type="text" name="City" class="input-xxlarge" id="firstHolderCity"/>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Zip Code</label>
											<div class="col-sm-9">
											  <input type="text" class="input-xxlarge" title="" id="firstHolderZipCode">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"></label>
											<div class="col-sm-9">
											</div>
										</div>
									</div>
									</div></div></div></div>
								<!--Investor Address (1st Applicant)End -->
										   
										   
										   
							<!--Other Details Start -->
							<div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									 <div class="widget-header">
										<h5 class="widget-title">Other Details</h5>
									</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Applicant Status</label>
											<div class="col-sm-9">
												  <select name="Application Status" class="input-xxlarge" id="applicationStatus">
									                <option>Individual</option>
									                <option>Trust</option>
									                <option>HUF</option>
									                <option>Partnership</option>
									                <option>Pvt Ltd Company</option>
									              </select>	
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Mode Of Holding</label>
											<div class="col-sm-9">
											   <select name="Mode Of Holding" class="input-xxlarge" id="modeOfHolding">
								                <option>Single</option>
								                <option>Joint</option>
								                <option>Any one or Survivor</option>
								              </select>	
										   </div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Occupation</label>
											<div class="col-sm-9">
											    <select name="Occupation" class="input-xxlarge" id="occupation">
									                <option>Professional</option>
									                <option>Business</option>
									                <option>Service</option>
									                <option>Student</option>
									                <option>Housewife</option>
									                <option>Retired</option>
									             </select>	
										   </div>
											
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"></label>
											<div class="col-sm-9">
										   </div>
										</div>
									</div>
									</div></div></div></div>
									 <!--Other Details End --> 
									 
							<!--Bank Details Start -->
						 <div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									 <div class="widget-header">
										<h5 class="widget-title">Bank Details</h5>
									</div>
									<div class="space-10"></div>
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Name of Bank</label>
											<div class="col-sm-9">
									              <input type="text" class="input-xxlarge" title="" id="bankName">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Branch Name</label>
											<div class="col-sm-9">
								                <input type="text" class="input-xxlarge" title="" id="branchkName">
										   </div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Address</label>
											<div class="col-sm-9">
									             <input type="text" class="input-xxlarge" title="" id="bankAddress">
										   </div>
											
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">State</label>
											<div class="col-sm-9">
											  <input type="text" name="City2" class="input-xxlarge" id="bankState" onBlur="getCities(this.value,'bankCity')">
										   </div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">City</label>
											<div class="col-sm-9">
									              <input type="text" name="City" class="input-xxlarge" id="bankCity">
										   </div>
											
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Account Type</label>
											<div class="col-sm-9">
											     <select name="Mode Of Holding" class="input-xxlarge" id="bankAcType">
									                <option>Savings</option>
									                <option>Current</option>
									                <option>NRO</option>
									                <option>NRE</option>
									                <option>FCNR</option>
									              </select>	
										   </div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">Account No</label>
											<div class="col-sm-9">
									               <input type="text" class="input-xxlarge" title="" id="bankAcNo">
										   </div>
											
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">MICR Code</label>
											<div class="col-sm-9">
									               <input type="text" class="input-xxlarge" title="" id="bankMicrCode"  maxlength="10">
										   </div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right">IFSC Code</label>
											<div class="col-sm-9">
									                 <input type="text" class="input-xxlarge" title="" id="bankIfscCode"  maxlength="10">
										   </div>
											
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-3 control-label no-padding-right"></label>
											<div class="col-sm-9">
										   </div>
										</div>
									</div>
									</div></div></div></div>
									 <!--Bank Details End --> 
									
								<!--Nominee Details Start -->
					     <div class="row">
    						<div class="widget-box" style="margin-top:10px;">
					        <div class="widget-body">
					        	<div class="widget-main clearfix">
									 <div class="widget-header">
										<h5 class="widget-title">Nominee Details</h5>
									</div>
									<div class="space-10"></div>
									<table id="data"
										class="table table-hover table-bordered table-striped"
										cellpadding="0" cellspacing="0">
										<thead>
											<tr>
												<th class="thead"><a href="#">No</a></th>
												<th class="thead"><a href="#">Name</a></th>
												<th class="thead"><a href="#">Address </a></th>
												<th class="thead"><a href="#">DOB</a></th>
												<th class="thead"><a href="#">Relationship </a></th>
												<th class="thead"><a href="#">Allocation%</a></th>
												<th class="thead"><a href="#">Guardian Name[If
														minor]</a></th>
												<th class="thead"><a href="#">Guardian Address[If
														minor]</a></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>
													<div
														style="position: relative; width: 120px; height: 25px; border: 0; padding: 0; margin: 0;">
														<select id="nomineeName1"
															style="position: absolute; top: 0px; left: -5px; width: 130px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
															onchange="document.getElementById('displayValue3').value=this.options[this.selectedIndex].text; document.getElementById('idValue3').value=this.options[this.selectedIndex].value; setNomineeDetails(this.value,'#nomineeDob1','#nomineeRelation1');">

														</select> <input name="displayValue3"
															placeholder="Type or select name" id="displayValue3"
															style="position: absolute; top: 0px; left: -5px; width: 115px; height: 23px; height: 21px\9; # height: 18px; border: 1px solid #556;"
															onfocus="this.select()" type="text"> <input
															name="idValue3" id="idValue3" type="hidden">
													</div>
												</td>
												<td><input type="text" class="form-control" title=""
													id="nomineeAddress1"></td>
												<td><input type="text" class="form-control" title=""
													placeholder="dd/mm/yyyy" id="nomineeDob1"></td>
												<td><select name="Relations" class="form-control"
													id="nomineeRelation1">
														<option>Spouse</option>
														<option>Husband</option>
														<option>Wife</option>
														<option>Mother</option>
														<option>Father</option>
														<option>Sister</option>
														<option>Brother</option>
														<option>Daughter</option>
														<option>Son</option>
												</select></td>
												<td><input type="text" class="form-control" title=""
													id="nomineeAllocation1" onkeypress="return isNumber(event)"></td>
												<td>
													<div
														style="position: relative; width: 135px; height: 25px; border: 0; padding: 0; margin: 0;">
														<select class="form-control" id="nomineeGuardianName1"
															style="position: absolute; top: 0px; left: 0px; width: 135px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
															onchange="document.getElementById('displayValue4').value=this.options[this.selectedIndex].text; document.getElementById('idValue4').value=this.options[this.selectedIndex].value;">

														</select> <input name="displayValue4"
															placeholder="Type or select name" id="displayValue4"
															style="position: absolute; top: 0px; left: 0px; width: 115px; height: 23px; border: 1px solid #556;"
															onfocus="this.select()" type="text"> <input
															name="idValue4" id="idValue4" type="hidden">
													</div>

												</td>
												<td><input type="text" class="form-control" title=""
													id="nomineeGuardianAddress1"></td>

											</tr>
											<tr>
												<td>2</td>
												<td>
													<div
														style="position: relative; width: 120px; height: 25px; border: 0; padding: 0; margin: 0;">
														<select id="nomineeName2"
															style="position: absolute; top: 0px; left: -5px; width: 130px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
															onchange="document.getElementById('displayValue5').value=this.options[this.selectedIndex].text; document.getElementById('idValue5').value=this.options[this.selectedIndex].value;setNomineeDetails(this.value,'#nomineeDob2','#nomineeRelation2');">

														</select> <input name="displayValue5"
															placeholder="Type or select name" id="displayValue5"
															style="position: absolute; top: 0px; left: -5px; width: 115px; height: 23px; height: 21px\9; # height: 18px; border: 1px solid #556;"
															onfocus="this.select()" type="text"> <input
															name="idValue5" id="idValue5" type="hidden">
													</div>
												</td>
												<td><input type="text" class="form-control" title=""
													id="nomineeAddress2"></td>
												<td><input type="text" class="form-control" title=""
													placeholder="dd/mm/yyyy" id="nomineeDob2"></td>
												<td><select name="Relations" class="form-control"
													id="nomineeRelation2">
														<option>Spouse</option>
														<option>Husband</option>
														<option>Wife</option>
														<option>Mother</option>
														<option>Father</option>
														<option>Sister</option>
														<option>Brother</option>
														<option>Daughter</option>
														<option>Son</option>
														<option>Son</option>
														<option>Daughter</option>

												</select></td>
												<td><input type="text" class="form-control" title=""
													id="nomineeAllocation2" onkeypress="return isNumber(event)"></td>
												<td>
													<div
														style="position: relative; width: 135px; height: 25px; border: 0; padding: 0; margin: 0;">
														<select id="nomineeGuardianName2"
															style="position: absolute; top: 0px; left: 0px; width: 135px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
															onchange="document.getElementById('displayValue6').value=this.options[this.selectedIndex].text; document.getElementById('idValue6').value=this.options[this.selectedIndex].value;">

														</select> <input name="displayValue6"
															placeholder="Type or select name" id="displayValue6"
															style="position: absolute; top: 0px; left: 0px; width: 119px; height: 23px; height: 21px\9; # height: 18px; border: 1px solid #556;"
															onfocus="this.select()" type="text"> <input
															name="idValue6" id="idValue6" type="hidden">
													</div>
												</td>
												<td><input type="text" class="form-control" title=""
													id="nomineeGuardianAddress2"></td>
											</tr>

											<tr>
												<td>3</td>
												<td>

													<div
														style="position: relative; width: 120px; height: 25px; border: 0; padding: 0; margin: 0;">
														<select id="nomineeName3"
															style="position: absolute; top: 0px; left: -5px; width: 130px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
															onchange="document.getElementById('displayValue7').value=this.options[this.selectedIndex].text; document.getElementById('idValue7').value=this.options[this.selectedIndex].value;setNomineeDetails(this.value,'#nomineeDob3','#nomineeRelation3');">

														</select> <input name="displayValue7"
															placeholder="Type or select name" id="displayValue7"
															style="position: absolute; top: 0px; left: -5px; width: 115px; height: 23px; height: 21px\9; # height: 18px; border: 1px solid #556;"
															onfocus="this.select()" type="text"> <input
															name="idValue7" id="idValue7" type="hidden">
													</div>
												</td>
												<td><input type="text" class="form-control" title=""
													id="nomineeAddress3"></td>
												<td><input type="text" class="form-control" title=""
													placeholder="dd/mm/yyyy" id="nomineeDob3"></td>
												<td><select name="Relations" class="form-control"
													id="nomineeRelation3">
														<option>Spouse</option>
														<option>Husband</option>
														<option>Wife</option>
														<option>Mother</option>
														<option>Father</option>
														<option>Sister</option>
														<option>Brother</option>
														<option>Daughter</option>
														<option>Son</option>

														<option>Son</option>
														<option>Daughter</option>

												</select></td>
												<td><input type="text" class="form-control" title=""
													id="nomineeAllocation3" onkeypress="return isNumber(event)"></td>
												<td>
													<div
														style="position: relative; width: 135px; height: 25px; border: 0; padding: 0; margin: 0;">
														<select id="nomineeGuardianName3"
															style="position: absolute; top: 0px; left: 0px; width: 135px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
															onchange="document.getElementById('displayValue8').value=this.options[this.selectedIndex].text; document.getElementById('idValue8').value=this.options[this.selectedIndex].value;">

														</select> <input name="displayValue8"
															placeholder="Type or select name" id="displayValue8"
															style="position: absolute; top: 0px; left: 0px; width: 119px; height: 23px; height: 21px\9; # height: 18px; border: 1px solid #556;"
															onfocus="this.select()" type="text"> <input
															name="idValue8" id="idValue8" type="hidden">
													</div>
												</td>
												<td><input type="text" class="form-control" title=""
													id="nomineeGuardianAddress3"></td>
											</tr>
										</tbody>
									</table>
                               </div></div></div></div>
							 <!--Nominee Details End -->	   
						 </div>
				      </div>
<!--  ------------------------------------------------------------  -->

    	 <div class="topmenu pull-right">           
  			<input class="btn btn-primary btn-xs dbtn" type="button" value="Generate Form" name="Generate Form" onClick="saveForm();"> 
        </div> 
        </form>
	       		
      </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
    </div>
  </div>
        
	  	
</div>
</section>
      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
<form id="downloadAttachmentForm" name="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>

<input type="hidden" id="fpActionPlanId" value="${param.fpActionPlanId}"/>
<script>
var panarr = {};
var salutionarr = {};
var dobarr = {};
var relationarr = {};

function enableTf2(){

$("#stageType, #save1, #cancel1").show();
$('#manufacturer, #product, #scheme, #option, #investmenttype, #investmentamount, #frequency, #allocation ').removeAttr("disabled", true);
}

function autoPopulateETForm(){
	var productid=0;
	var clientPartyId=$('#clientPartyIdHidden').val();
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/et/loadPortFolioPrePrintedForm.htm?productid='+productid+'&clientPartyId='+clientPartyId,
		success : function(result) {
				
					if(result.arnCode!="" && result.arnCode!="undefined" && result.arnCode!=undefined)
					$('#arnCode').val(result.arnCode);
					$('#subBrokerCode').val(result.subBrokerCode);
					
					if(result.name1!="" && result.name1!="undefined" && result.name1!=undefined)
					$('#firstHolderName').val(result.name1);
					
					if(result.gender1!="" && result.gender1!="undefined" && result.gender1!=undefined)
					$('#firstHolderGender').val(result.gender1);
					
					if(result.dob1!="" && result.dob1!="undefined" && result.dob1!=undefined)
					$('#firstHolderDob').val(result.dob1);
					
					if(result.panNo1!="" && result.panNo1!="undefined" && result.panNo1!=undefined)
					$('#firstHolderPanNo').val(result.panNo1);
					
					if(result.emailId1!="" && result.emailId1!="undefined" && result.emailId1!=undefined)
					$('#firstHolderEmailId').val(result.emailId1);
					
					if(result.mobileNo1!="" && result.mobileNo1!="undefined" && result.mobileNo1!=undefined)
					$('#firstHolderMobileNo').val(result.mobileNo1);
					
					
					if(result.contactNoRes1!="" && result.contactNoRes1!="undefined" && result.contactNoRes1!=undefined)
					$('#firstHolderContactNoRes').val(result.contactNoRes1);
					
					if(result.contactNoOff1!="" && result.contactNoOff1!="undefined" && result.contactNoOff1!=undefined)
					$('#firstHolderContactNoOff').val(result.contactNoOff1);
					
					$('#txnType').val(result.transactionTypeId);
					
					if(result.euin!="" && result.euin!="undefined" && result.euin!=undefined)
					$('#euin').val(result.euin);
					
					if(result.bankName!="" && result.bankName!="undefined" && result.bankName!=undefined)
					$('#bankName').val(result.bankName);
					
					if(result.branchName!="" && result.branchName!="undefined" && result.branchName!=undefined)
					$('#branchkName').val(result.branchName);
					
					if(result.bankAcType!="" && result.bankAcType!="undefined" && result.bankAcType!=undefined)
					$('#bankAcType').val(result.bankAcType);
					
					if(result.bankAcNo!="" && result.bankAcNo!="undefined" && result.bankAcNo!=undefined)
					$('#bankAcNo').val(result.bankAcNo);
					
					if(result.bankIfscCode!="" && result.bankIfscCode!="undefined" && result.bankIfscCode!=undefined)
					$('#bankIfscCode').val(result.bankIfscCode);
					
					if(result.bankMicrCode!="" && result.bankMicrCode!="undefined" && result.bankMicrCode!=undefined)
					$('#bankMicrCode').val(result.bankMicrCode);
					
					$('#folioNo').empty();
					$('#folioNo').append('<option value="0">---select---</option>');
					$(result.folioNos).each(function(i,obj){
						$('#folioNo').append('<option value="'+obj+'">'+obj+'</option>');
					});		
					$('#folioNo').val(result.folioNo);
					
					$('#txnType').val(86001);
 					
				}
			});
			
		}

function loadForm(productid,obj){
/*  var id = productid.split("~");
 	var productid=id[1].split("]")[0];
 	var quickSearch=$("#quickSearch").val();
 	var clientPartyId=quickSearch.split("~")[1].split("]")[0];
		
 	if(productid==0)
 		return;
	preLoadInvestmentAmount();
	preloadInvType(); */
}

function getCities(parentId,childId){	
	parentId=statesMap[parentId];
	
	var cityArrayList=new Array();
	$('#'+childId).empty();
	
	$.ajax({
		type : "GET",
		url : $('#contextPath').val()+'/common/getCityList.htm?parentId='+parentId,
		success : function(result) {
			$(result).each(function(i,obj) {
				var object = {};
				object.value = obj.codeValueId;
				object.label = obj.codeValue;
				
				cityArrayList.push(obj.codeValue);
			});
				$('#'+childId).autocomplete({
				source: cityArrayList
			});
		}
	});
	
}
$(document).ready(function(){
	
	$('#firstHolderDob,#nomineeDob1,#nomineeDob2,#nomineeDob3').datepicker({
		changeMonth : true,
		changeYear : true,
		maxDate : '0',
		yearRange : "1900:2200",
		dateFormat : "dd/mm/yy"

	});
	
	$('#PortFolio').addClass('active');
	$('#loadPrePrintedFormToGenerate').css('font-weight','bold');
	
	
	
	 availableStates=new Array();
	 statesMap=new Object();
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=81,3,2,68,26,64,66,65,86,96',//
		success : function(result) {
			
			
			$('#firstHolderCountry,#investmentType,#txnType,#firstHolderTitle,#secondHolderTitle,#thirdHolderTitle,#bankAcType,#nomineeRelation1,#nomineeRelation2,#nomineeRelation3,#applicationStatus,#modeOfHolding,#occupation,#firstHolderGuardianRelation').
			empty();
			
			$('#firstHolderCountry,#investmentType,#txnType,#firstHolderTitle,#secondHolderTitle,#thirdHolderTitle,#bankAcType,#nomineeRelation1,#nomineeRelation2,#nomineeRelation3,#applicationStatus,#modeOfHolding,#occupation,#firstHolderGuardianRelation').
			append('<option value="" >---select---</option>');
			$(result).each(function(i,obj) {
			var codeTypeId=obj.codeTypeId;
			var codeValue=obj.codeValue;
			var codevalueId=obj.codeValueId;
			if(codeTypeId==81){
			$('#firstHolderTitle').append('<option value="'+codeValue+'">'+codeValue+'</option>');
			$('#secondHolderTitle').append('<option value="'+codeValue+'">'+codeValue+'</option>');
			$('#thirdHolderTitle').append('<option value="'+codeValue+'">'+codeValue+'</option>');
			
			}else if(codeTypeId==3){
				$('#firstHolderCountry').append('<option value="'+codeValue+'">'+codeValue+'</option>');
			}else if(codeTypeId==2){
				availableStates.push(codeValue);
				statesMap[codeValue]=codevalueId;
			}
			else if(codeTypeId==68){
				$('#bankAcType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
			}
			
			else if(codeTypeId==26){
				$('#nomineeRelation1,#nomineeRelation2,#nomineeRelation3,#firstHolderGuardianRelation').append('<option value="'+codeValue+'">'+codeValue+'</option>');
			}
			else if(codeTypeId==64){
				$('#applicationStatus').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
			}
			else if(codeTypeId==66){
				$('#modeOfHolding').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
			}
			else if(codeTypeId==65){
				$('#occupation').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
			}
			else if(codeTypeId==86){
				
				$('#txnType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
			}
			else if(codeTypeId==96){
				if(codevalueId!=96003 && codevalueId!=96004)
				$('#investmentType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
			}
			});
			
			$('#txnType').val(86001);
			setTimeout(function(){closePopupWebApp('');},500);
			  $.ajax({
					 type :'GET',
			         url : $('#contextPath').val() +'/et/loadMutualFundProduct.htm?searchStr='+$('#fpExecutionId').val(),
					 success : function(result) 
					 {
						       availableTags1 = new Array();
						        $(result).each(
				      			 function(i, value) {
				      				 var object = {};
										object.value = value.productId;
										object.label = value.productName;
										availableTags1.push(object);
				      					      				
				                  }); 
						        
								$('#fpExecutionId')
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
							    	  response(  $.ui.autocomplete.filter(availableTags1, request.term) );
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
								        $('#productIdHidden').val(ui.item.value);
								        $('#blankProductId').val(ui.item.value);
								        // add placeholder to get the comma-and-space at the end
								        terms.push( "" );
								        this.value = terms.join( "" );
								        
								        var labelArr = $(this).data('label') || new Array();
								        labelArr.push(ui.item);
								        $(this).data('label',labelArr);
								        console.log($(this).data());
								       // autoPopulateETForm();
								        return false;
							      }
							    });
				}
				});
 			 $('#txnType').attr('disabled','disabled');
			
		}
	});
		$('#firstHolderState,#bankState').autocomplete({
			source: availableStates
		});
});
	
	function saveForm(){
		
		var obj=new Object();
		obj.fpExecutionId=0;
		obj.arnCode=$('#arnCode').val();
		obj.subBrokerCode=$('#subBrokerCode').val();
		
		if($('#folioNo').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.folioNo=$('#displayValue').val();
		} else{
			
			obj.folioNo=$('#folioNo').val();
		}
		
		obj.title1=$('#firstHolderTitle').val();
		obj.name1=$('#firstHolderName').val();
		obj.gender1=$('#firstHolderGender').val();
		obj.dob1=$('#firstHolderDob').val();
		obj.panNo1=$('#firstHolderPanNo').val();
		obj.emailId1=$('#firstHolderEmailId').val();
		obj.mobileNo1=$('#firstHolderMobileNo').val();
		obj.contactNoRes1=$('#firstHolderContactNoRes').val();
		obj.contactNoOff1=$('#firstHolderContactNoOff').val();
		obj.guardianName1=$('#firstHolderGuardianName').val();
		obj.guardianRelation1=$('#firstHolderGuardianRelation').val();
		obj.title2=$('#secondHolderTitle').val();
		

		if($('#secondHolderName').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.name2=$('#displayValue1').val();
		} else{
			
			obj.name2=$('#secondHolderName').val();
		}
		
		obj.panNo2=$('#secondHolderPanNo').val();
		obj.title3=$('#thirdHolderTitle').val();
		
		if($('#thirdHolderName').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.name3=$('#displayValue2').val();
		} else{
			
			obj.name3=$('#thirdHolderName').val();
		}
		
		obj.panNo3=$('#thirdHolderPanNo').val();
		obj.address1=$('#firstHolderAddress').val();
		obj.country1=$('#firstHolderCountry').val();
		obj.state1=$('#firstHolderState').val();
		obj.city1=$('#firstHolderCity').val();
		obj.zipCode1=$('#firstHolderZipCode').val();
		obj.applicationStatus1=$('#applicationStatus').val();
		obj.modeOfHolding1=$('#modeOfHolding').val();
		obj.occupation1=$('#occupation').val();
		obj.bankName=$('#bankName').val();
		obj.branchName=$('#branchkName').val();
		obj.bankAddress=$('#bankAddress').val();
		obj.bankCity=$('#bankCity').val();
		obj.bankAcType=$('#bankAcType').val();
		obj.bankAcNo=$('#bankAcNo').val();
		obj.bankMicrCode=$('#bankMicrCode').val();
		obj.bankIfscCode=$('#bankIfscCode').val();
		obj.bankState=$('#bankState').val();
				
		obj.productId=$('#productIdHidden').val();
		obj.partyId=$('#clientPartyIdHidden').val();
		
  		obj.schemeName=$('#fpExecutionId').val();
		
		obj.schemeOption=$('#option').val();
		obj.investmentAmount=$('#investmentAmount').val().replace("",0);
		obj.investmentTypeId=$('#investmentType').val();
		obj.transactionTypeId=$('#txnType').val();
		
		
		if($('#nomineeName1').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.nomineeName1=$('#displayValue3').val();
		} else{
			
			obj.nomineeName1=$('#nomineeName1').val();
		}
		
		obj.nomineeAddress1=$('#nomineeAddress1').val();
		if($('#nomineeDob1').val()!='')
		obj.nomineeDob1=$('#nomineeDob1').val();
		obj.nomineeRelation1=$('#nomineeRelation1').val();
		obj.nomineeAllocationPercent1=$('#nomineeAllocation1').val();
		
		if($('#nomineeGuardianName1').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.nomineeGuardianName1=$('#displayValue4').val();
		} else{
			
			obj.nomineeGuardianName1=$('#nomineeGuardianName1').val();
		}
		
		obj.nomineeGuardianAddress1=$('#nomineeGuardianAddress1').val();
		
		if($('#nomineeName2').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.nomineeName2=$('#displayValue5').val();
		} else{
			
			obj.nomineeName2=$('#nomineeName2').val();
		}
		
		obj.nomineeAddress2=$('#nomineeAddress2').val();
		if($('#nomineeDob2').val()!='')
		obj.nomineeDob2=$('#nomineeDob2').val();
		obj.nomineeRelation2=$('#nomineeRelation2').val();
		obj.nomineeAllocationPercent2=$('#nomineeAllocation2').val();
		if($('#nomineeGuardianName2').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.nomineeGuardianName2=$('#displayValue6').val();
		} else{
			
			obj.nomineeGuardianName2=$('#nomineeGuardianName2').val();
		}
		
		obj.nomineeGuardianAddress2=$('#nomineeGuardianAddress2').val();
		
		if($('#nomineeName3').val()==0){
			//if selected folio no is blank then check entered folio no
			 obj.nomineeName3=$('#displayValue7').val();
		} else{
			
			 obj.nomineeName3=$('#nomineeName3').val();
		}
		
		obj.nomineeAddress3=$('#nomineeAddress3').val();
		if($('#nomineeDob3').val()!='')
		obj.nomineeDob3=$('#nomineeDob3').val();
		obj.nomineeRelation3=$('#nomineeRelation3').val();
		obj.nomineeAllocationPercent3=$('#nomineeAllocation3').val();
		
		if($('#nomineeGuardianName3').val()==0){
			//if selected folio no is blank then check entered folio no
			obj.nomineeGuardianName3=$('#displayValue8').val();
		} else{
			
			obj.nomineeGuardianName3=$('#nomineeGuardianName3').val();
		}
		
		obj.nomineeGuardianAddress3=$('#nomineeGuardianAddress3').val();
		obj.euin=$('#euin').val();
		
		var isValidated = true;
		isValidated = validateInputForm('saveEtForm');
		if (!isAllocationPercentageProper()) {
			return;
		}

		if (!isValidated)
			return;
		
		$.ajax({
			  url: $('#contextPath').val()+"/et/saveEtForm.htm?fpExecutionId=0",
			  method:"post",
			  contentType: 'application/json',
		        data:JSON.stringify(obj),
		        dataType: 'json',
			  success:function(result){
				  $('#fpExecutionId').val(result.fpExecutionId);
				  generateForm();
			  }		 
				 }); 

	}
/**
 * @description function to validate if allocation percentage has not exceeded 100%
 */
function isAllocationPercentageProper() {
	 if($('#nomineeAllocation1').val().length === 0 && $('#nomineeAllocation2').val().length === 0 && $('#nomineeAllocation3').val().length ===0) {
		 return true;
	 }
	var nomineeAllocation1Val = Number($('#nomineeAllocation1').val().trim()|| 0);
	var nomineeAllocation2Val = Number($('#nomineeAllocation2').val() || 0);
	var nomineeAllocation3Val = Number($('#nomineeAllocation3').val() || 0);
	var total = nomineeAllocation1Val + nomineeAllocation2Val + nomineeAllocation3Val;
	if(total != 100) {
		 showAlertMessage1("Error",
					'Total Allocation percentage for all nominees should be exactly 100'+'\n',
						"error", doNothing);
		 return false;
	}else {
		return true;
	}	
	  
}	
function generateForm(){
	
		var blankClientPartyId=$('#blankClientPartyId').val();
		var blankProductId=$('#blankProductId').val();
		
	   if(blankClientPartyId == ""){
			$('#quickSearch').val('');
		}
	   
	   if(blankProductId == ""){
		   $('#fpExecutionId').val('');
		}

		var isValidated = true;
		isValidated = validateInputForm('saveEtForm');
		if (!isAllocationPercentageProper()) {
			return;
		}

		if (!isValidated)
			return;
		var id = $('#fpExecutionId').val();
		$.ajax({
			url : $('#contextPath').val()
					+ "/et/generateEtForm.htm?fpExecutionId="+$('#fpExecutionId').val()
					+ "&fpActionPlanId=0",
			method : "post",
			success : function(result) {
				if (result.success != null) {
					showAlertMessage1("Success", result.success + '\n',
							"confirmation", doNothing);
				} else {
					showAlertMessage1("Error", result.error + '\n',
							"confirmation", doNothing);
				}
			}
		});

		clearForm();
	}

	function clearForm() {
		$('#blankProductId').val('');
		$('#blankClientPartyId').val('');
		$('#fpExecutionId').val('');
		$('#quickSearch').val('');

		$('#arnCode').val('');
		$('#subBrokerCode').val('');
		$('#folioNo').val('');
		$('#firstHolderTitle').val('');
		$('#firstHolderName').val('');
		$('#firstHolderGender').val('');
		$('#firstHolderDob').val('');
		$('#firstHolderPanNo').val('');
		$('#firstHolderEmailId').val('');
		$('#firstHolderMobileNo').val('');
		$('#firstHolderContactNoRes').val('');
		$('#firstHolderContactNoOff').val('');
		$('#firstHolderGuardianName').val('');
		$('#firstHolderGuardianRelation').val('');
		$('#secondHolderTitle').val('');
		$('#secondHolderName').val('');
		$('#secondHolderPanNo').val('');
		$('#thirdHolderTitle').val('');
		$('#thirdHolderName').val('');
		$('#thirdHolderPanNo').val('');
		$('#firstHolderAddress').val('');
		$('#firstHolderCountry').val('');
		$('#firstHolderState').val('');
		$('#firstHolderCity').val('');
		$('#firstHolderZipCode').val('');
		$('#applicationStatus').val('');
		$('#modeOfHolding').val('');
		$('#occupation').val('');
		$('#bankName').val('');
		$('#branchkName').val('');
		$('#bankAddress').val('');
		$('#bankCity').val('');
		$('#bankAcType').val('');
		$('#bankAcNo').val('');
		$('#bankMicrCode').val('');
		$('#bankIfscCode').val('');
		$('#bankState').val('');

		$('#productIdHidden').val('');
		$('#clientPartyIdHidden').val('');

		$('#investmentAmount').val('');
		$('#investmentType').val('');

		$('#nomineeName1').val('');
		$('#nomineeAddress1').val('');

		$('#nomineeDob1').val('');
		$('#nomineeRelation1').val('');
		$('#nomineeAllocation1').val('');
		$('#nomineeGuardianName1').val('');
		$('#nomineeGuardianAddress1').val('');

		$('#nomineeName2').val('');
		$('#nomineeAddress2').val('');

		$('#nomineeDob2').val('');
		$('#nomineeRelation2').val('');
		$('#nomineeAllocation2').val('');
		$('#nomineeGuardianName2').val('');
		$('#nomineeGuardianAddress2').val('');

		$('#nomineeName3').val('');
		$('#nomineeAddress3').val('');

		$('#nomineeDob3').val('');
		$('#nomineeRelation3').val('');
		$('#nomineeAllocation3').val('');
		$('#nomineeGuardianName3').val('');
		$('#nomineeGuardianAddress3').val('');
		$('#euin').val('');
		$("#hdnClientName").html('');
			
		
		$('#displayValue').val('');
		$('#displayValue1').val('');
		$('#displayValue2').val('');
		$('#displayValue3').val('');
		
		$('#displayValue4').val('');
		$('#displayValue5').val('');
		$('#displayValue6').val('');
		$('#displayValue7').val('');
		$('#displayValue8').val('');

	}


	function loadFolioDetails() {
		var folioId = $("#folioNo").val();
		if (folioId == 0)
			return;
		$.ajax({
			type : "GET",
			url : $('#contextPath').val() + '/et/loadfoliodetails.htm?folioId='
					+ folioId,
			dataType : "json",
			success : function(data) {

				if (data != null) {
					$("#nomineeName1").val(data.nomineeName1);
					$("#nomineeName2").val(data.nomineeName2);
					$("#nomineeName3").val(data.nomineeName3);

					$("#nomineeAddress1").val(data.nomineeAddress1);
					$("#nomineeAddress2").val(data.nomineeAddress2);
					$("#nomineeAddress3").val(data.nomineeAddress3);

					$("#nomineeDob1").val(data.nomineeDob1);
					$("#nomineeDob2").val(data.nomineeDob2);
					$("#nomineeDob3").val(data.nomineeDob3);

					$("#secondHolderTitle").val(data.title1);
					$("#secondHolderName").val(data.name1);
					$("#secondHolderPanNo").val(data.panNo1);

					$("#thirdHolderTitle").val(data.title2);
					$("#thirdHolderName").val(data.name2);
					$("#thirdHolderPanNo").val(data.panNo2);

				}

			}
		});

	};
	function isNumber(evt) {
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode > 31 && ((charCode < 48) || (charCode > 57))) {
			return false;
		}
		return true;
	}

	
	function getApplicantName(){
				
	   var fpActionPlanId = 0;
	   var clientPartyId = $('#clientPartyIdHidden').val();
		$.ajax({
					type : "GET",
					url : $('#contextPath').val()
							+ '/et/getApplicantDetails.htm?actionPlanId='
							+ fpActionPlanId+ '&partyId=' + clientPartyId,
					dataType : 'json',
					contentType : 'application/json',
					success : function(result) {

						$(
								"#secondHolderName, #thirdHolderName, #nomineeName1, #nomineeName2, #nomineeName3, #nomineeGuardianName1, #nomineeGuardianName2, #nomineeGuardianName3")
								.empty();
						$(
								"#secondHolderName, #thirdHolderName, #nomineeName1, #nomineeName2, #nomineeName3, #nomineeGuardianName1, #nomineeGuardianName2, #nomineeGuardianName3")
								.append('<option value="0">--Select--</option>');
						$(result)
								.each(
										function(i, obj) {

											var id = obj.partyId;
											var name = obj.name2;
											$(
													"#secondHolderName, #thirdHolderName, #nomineeName1, #nomineeName2, #nomineeName3, #nomineeGuardianName1, #nomineeGuardianName2, #nomineeGuardianName3")
													.append(
															'<option value="'+ name +'">'
																	+ name
																	+ '</option>');
											panarr[obj.name2] = obj.panNo2;
											salutionarr[obj.name2] = obj.title2;
											dobarr[obj.name2] = obj.dob1;
											relationarr[obj.name2] = obj.nomineeRelation1;
										});

					}
				});
	};

	function split(val) {
		return val.split(/;\s*/);
	}
	function extractLast(term) {
		return split(term).pop();
	}

	function quickSearchContacts() {
		setTimeout(function() {
			closePopupWebApp('');
		}, 200);

		$
				.ajax({
					url : $('#contextPath').val()
							+ "/et/quickSearchContacts.htm?searchString="
							+ $('#quickSearch').val(),
					method : "post",
					success : function(result) {
						availableTags = new Array();
						$(result).each(
								function(i, obj) {

									var object = {};
									object.value = obj.partyId;
									object.label = obj.fName + ' ' + obj.lName
											+ '[' + obj.panNo + ' '
											+ obj.emailId + ']';
									availableTags.push(object);
								});

						$('#quickSearch')
								// don't navigate away from the field on tab when selecting an item
								.bind(
										"keydown",
										function(event) {
											if (event.keyCode === $.ui.keyCode.TAB
													&& $(this).data(
															"ui-autocomplete").menu.active) {
												event.preventDefault();
											}
										})
								.autocomplete(
										{
											minLength : 0,
											source : function(request, response) {
												// delegate back to autocomplete, but extract the last term
												response($.ui.autocomplete
														.filter(availableTags,
																request.term));
											},
											focus : function() {
												// prevent value inserted on focus
												return false;
											},
											select : function(event, ui) {
												var terms = split(this.value);

												console.log('terms=' + terms);

												// remove the current input
												terms.pop();
												// add the selected item 
												terms.push(ui.item.label);
												$('#clientPartyIdHidden').val(ui.item.value);
												$('#blankClientPartyId').val(ui.item.value);

												/*add placeholder to get the comma-and-space at the end */
												terms.push("");
												this.value = terms.join("");

												var labelArr = $(this).data(
														'label')
														|| new Array();
												labelArr.push(ui.item);
												$(this).data('label', labelArr);
												console.log($(this).data());
												autoPopulateETForm();
												getApplicantName();
												return false;
											}
										});
					}
				});

		$("#quickSearch").blur(function() {
			if ($('#blankClientPartyId').val() == "") {
				$("#hdnClientName").html("");
			} else {
				var clientName = $("#quickSearch").val().split("[")[0];
				if (clientName == "") {
				} else {
					$("#hdnClientName").html(" for " + clientName);
					$("#firstHolderName").val(clientName);
				}
				if ($("#quickSearch").val().split("[")[1] == undefined) {
					$("#hdnClientName").html("");
				}
			}
		});
		
		$(document).scroll(function() {
			var clientName = $("#quickSearch").val().split("[")[0];
			$("#firstHolderName").val(clientName);
		});

		$("#fpExecutionId").blur(function() {
		});
		function split(val) {
			return val.split(/;\s*/);
		}
		function extractLast(term) {
			return split(term).pop();
		}
	}
	
	function getPan(partyId,divId,salDivId){
		
		$.each(panarr, function (index, value) {
		    if(index==partyId){
		    	$(divId).val(value);
		    }
		});
		
		$.each(salutionarr, function (index, value) {
		    if(index==partyId){
		    	$(salDivId).val(value);
		    }
		});
	}

	function setNomineeDetails(partyId,dobDivId,relationDivId){
		$.each(dobarr, function (index, value) {
		    if(index==partyId){
		    	$(dobDivId).val(value);
		    	return false;
		    }
		});
		
		$.each(relationarr, function (index, value) {
		    if(index==partyId){
		    	$(relationDivId).val(value);
		    	return false;
		    }
		});
	}
	function ValidatePAN(Obj,selectId){
		var a=Obj;
		var regex1=/^([A-Za-z]{5})+([0-9]{4})+([A-Za-z]{1})$/; 
		if(regex1.test(a)=="")
		{
			//alert('Please enter valid pancard number');
			showAlertMessage("Error","Please enter valid pancard number.", 'error', doNothing);
			$(selectId).select();
			$(selectId).focus();
			return false;
		}
	}
</script>
<input type="hidden" id="productIdHidden" value="0">
 <input type="hidden" id="clientPartyIdHidden" value="0">

</body>
</html>