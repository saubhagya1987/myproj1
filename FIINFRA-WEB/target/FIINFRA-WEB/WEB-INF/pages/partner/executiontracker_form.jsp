<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Execution Tracker : Preprinted Form</title>
   <style>
   .ui-widget .ui-widget { font-size: 1em; }
   </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section>
	    <div class="">
    		<div class="main-content">
              <div class="main-contnet-inner">
                <div class="page-content">
                  <div class="page-header clearfix">
                     <h1 class="pull-left">
                     Execution Tracker for <c:choose>
							<c:when test="${sessionScope.clientType==14006}">
								<i title="Client" class="clienticon"> </i>
							</c:when>
							<c:when test="${sessionScope.clientType==14007}">
								<i title="PClient" class="pclienticon"> </i>
							</c:when>
							<c:when test="${sessionScope.clientType==14005}">
								<i class="opportunityicon"></i>
							</c:when>
						</c:choose>${sessionScope.contactName}
                     </h1>
                     </div>
	  		<div class="container-body">
	  	  		<jsp:include page="executiontracker_actions.jsp"></jsp:include>
	  	  		<div class="col-md-9" style="margin-bottom:10px;">
	  	  			<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Available pre-printed forms
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
								
									<div id="jqGrid_container">
       	  							<table id="grid-table"></table>
									<div id="grid-pager"></div>
									<input type="hidden" name="listSize" id="listSize" value="${listSize}">
								</div>	
							
								</div>
							</div>
						</div>
					</div>
        			<div class="clearfix"></div>
        			<form name="saveEtForm" id="saveEtForm">
        			<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Form Details
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="product">Product<span class="red">*</span></label>
											<div class="col-sm-7">
												<select name="select" id="fpExecutionId" class="input-xxlarge" onChange="loadForm(this.value);" validate="1" emsg="Product">
													<option value="">---select product---</option>
													<c:forEach items="${etFormList}" var="element">           
														<option value="${element.fpExecutionId }" >${element.productId}</option>
													</c:forEach>
												</select>
												<div id="fpExecutionId_error" class="help-block hide">Please select product.</div>
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="investmentAmount">Investment Amount<span class="red">*</span></label>
						                	<div class="col-sm-7">
						                  		<input type="text" class="input-xxlarge" title="" value="" id="investmentAmount"  validate="1" emsg="investment amount" onkeypress="return isNumber(event)">
												<div id="investmentAmount_error" class="help-block hide">Please	enter investment amount.</div>
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="txnType">Transaction Type</label>
											<div class="col-sm-7">
												<select name="select" class="input-xxlarge" id="txnType">
		                      						<option >Growth </option>
		                      						<option >Dividend Reinvest </option>
		                      						<option >Dividend Payout </option>
                  								</select>
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="investmentType">Investment Type<span class="red">*</span></label>
						                	<div class="col-sm-7">
						                  		<select name="select"  class="input-xxlarge" id="investmentType" validate="1" emsg="investment type" disabled>
		                      						<option >Growth </option>
		                      						<option >Dividend Reinvest </option>
		                      						<option >Dividend Payout </option>
		                  						</select>
						                	</div>
										</div>
									</div>
										
								</div>
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Distributor Details
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="arnCode">ARN Code</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="arnCode" onkeypress="return isNumber(event)">
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="subBrokerCode">Sub-broker Code</label>
						                	<div class="col-sm-7">
						                  		<input type="text" class="input-xxlarge" title="" id="subBrokerCode" onkeypress="return isNumber(event)">
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="euin">EUIN No</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="euin" >
											</div>
										</div>
										
									</div>
										
								</div>
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Investor Details (1st Applicant)
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="folioNo">Existing Folio No</label>
											<div class="col-sm-7">
												<div style="position:relative;width:200px;height:25px;border:0;padding:0;margin:0;">
													<select id="folioNo" class="input-xxlarge" style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue').value=this.options[this.selectedIndex].text; document.getElementById('idValue').value=this.options[this.selectedIndex].value;loadFolioDetails()">
													</select>
													<input name="displayValue" placeholder="Type or select folio no" id="displayValue" style="position:absolute;top:0px;left:0px;width:183px;width:180px\9;#width:180px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
													<input name="idValue" id="idValue" type="hidden">
												</div>
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderTitle">Title</label>
						                	<div class="col-sm-7">
						                  		<select name="Query To" class="input-xxlarge" id="firstHolderTitle">
			                                		<option>Mr.</option>
			                                		<option>Mrs.</option>
		           								</select>
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderName">Name</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="firstHolderName" >
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderGender">Gender</label>
						                	<div class="col-sm-7">
						                  		<select name="Query To" class="input-xxlarge" id="firstHolderGender">
		                                			<option>Male</option>
		                                			<option>Female</option>
												</select>
						                	</div>
										</div>
									</div>
										
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderDob">Date of Birth</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="Birth Date" placeholder="dd/mm/yyyy" width="300" id="firstHolderDob">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderPanNo">PAN</label>
						                	<div class="col-sm-7">
						                  		<input type="text" class="input-xxlarge" title="" id="firstHolderPanNo" maxlength="10"  onchange="ValidatePAN(this.value,'#firstHolderPanNo');">
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderEmailId">Email ID</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="firstHolderEmailId">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderMobileNo">Mobile No</label>
						                	<div class="col-sm-7">
						                  		<input type="text" class="input-xxlarge" title="" id="firstHolderMobileNo" onkeypress="return isNumber(event)"  maxlength="12">
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderContactNoRes">Contact No (Res)</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="firstHolderContactNoRes" onkeypress="return isNumber(event)">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderContactNoOff">Contact No (Off)</label>
						                	<div class="col-sm-7">
						                  		<input type="text" class="input-xxlarge" title="" id="firstHolderContactNoOff" onkeypress="return isNumber(event)">
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderGuardianName">Guardian Name [for Minor]</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="firstHolderGuardianName">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderGuardianRelation">Guardian Relationship</label>
						                	<div class="col-sm-7">
						                  		<select name="Query To" class="input-xxlarge" id="firstHolderGuardianRelation">
		                                			<option>Mother</option>
		                                			<option>Father</option>
		                                			<option>Court Appointed</option>
												</select>
						                	</div>
										</div>
									</div>
									
								</div>
								</div>
							</div>
						</div>
						
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Investor Details (2nd Applicant)
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="secondHolderTitle">Title</label>
											<div class="col-sm-7">
												<select name="Query To" class="input-xxlarge"  id="secondHolderTitle">
                                					<option>Mr.</option>
                                					<option>Mrs.</option>
												</select>
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="secondHolderName">Name</label>
						                	<div class="col-sm-7">
						                  		<div class="col-sm-9">
								                  	<div style="position:relative;width:200px;height:25px;border:0;padding:0;margin:0;">
														<select id="secondHolderName" class="input-xxlarge"  style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue1').value=this.options[this.selectedIndex].text; document.getElementById('idValue1').value=this.options[this.selectedIndex].value; getPan(this.value,'#secondHolderPanNo','#secondHolderTitle');">
														</select>
														<input name="displayValue1" placeholder="Type or select name" id="displayValue1" style="position:absolute;top:0px;left:0px;width:183px;width:180px\9;#width:180px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
														<input name="idValue1" id="idValue1" type="hidden">
													</div>
								                </div>
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="secondHolderPanNo">PAN</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="secondHolderPanNo" onchange="ValidatePAN(this.value,'#secondHolderPanNo');">
											</div>
										</div>
										
									</div>
										
								</div>
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Investor Details (3rd Applicant)
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="thirdHolderTitle">Title</label>
											<div class="col-sm-7">
												<select name="Query To" class="input-xxlarge"  id="thirdHolderTitle">
                                					<option>Mr.</option>
                                					<option>Mrs.</option>
												</select>
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="thirdHolderName">Name</label>
						                	<div class="col-sm-7">
						                  		<div class="col-sm-9">
								                  	<div style="position:relative;width:200px;height:25px;border:0;padding:0;margin:0;">
														<select id="thirdHolderName" class="input-xxlarge"  style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue2').value=this.options[this.selectedIndex].text; document.getElementById('idValue2').value=this.options[this.selectedIndex].value;getPan(this.value,'#thirdHolderPanNo','#thirdHolderTitle');">
														</select>
														<input name="displayValue2" placeholder="Type or select name" id="displayValue2" style="position:absolute;top:0px;left:0px;width:183px;width:180px\9;#width:180px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
														<input name="idValue2" id="idValue2" type="hidden">
													</div>
								                </div>
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="thirdHolderPanNo">PAN</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="thirdHolderPanNo" onchange="ValidatePAN(this.value,'#thirdHolderPanNo');" >
											</div>
										</div>
										
									</div>
										
								</div>
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Address Details  (1st Applicant)
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderAddress">Address</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge"  title="" id="firstHolderAddress">
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderCountry">Country</label>
						                	<div class="col-sm-7">
						                  		<div class="col-sm-9">
								                  	<select name="City3" class="input-xxlarge" id="firstHolderCountry">
						               					<option>India</option>
							           				</select>
								                </div>
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderState">State</label>
											<div class="col-sm-7">
												<input type="text" name="City2" class="input-xxlarge"  id="firstHolderState" onBlur="getCities(this.value,'firstHolderCity')"/>
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderCity">City</label>
						                	<div class="col-sm-7">
						                  		<div class="col-sm-9">
								                  	<input type="text" name="City" class="input-xxlarge" id="firstHolderCity"/>
								                </div>
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="firstHolderZipCode">Zip Code</label>
											<div class="col-sm-7">
												<input type="text" class="input-xxlarge" title="" id="firstHolderZipCode">
											</div>
										</div>
										
									</div>
										
								</div>
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Other Details
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="applicationStatus">Applicant Status</label>
											<div class="col-sm-7">
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
											<label class="col-sm-5 control-label no-padding-right" for="modeOfHolding">Mode of Holding</label>
						                	<div class="col-sm-7">
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
											<label class="col-sm-5 control-label no-padding-right" for="occupation">Occupation</label>
											<div class="col-sm-7">
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
										
									</div>
										
								</div>
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Bank Details
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="bankName">Name of Bank</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" title="" id="bankName">
												
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="branchkName">Branch Name</label>
						                	<div class="col-sm-7">
						                  		<input type="text" class="form-control" title="" id="branchkName">
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="bankAddress">Address</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" title="" id="bankAddress">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="bankState">State</label>
						                	<div class="col-sm-7">
						                  		<input type="text" name="City2" class="form-control" id="bankState" onBlur="getCities(this.value,'bankCity')"> 
						                	</div>
										</div>
									</div>
										
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="bankCity">City</label>
											<div class="col-sm-7">
												<input type="text" name="City" class="form-control" id="bankCity">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="bankAcType">Account Type</label>
						                	<div class="col-sm-7">
						                  		<select name="Mode Of Holding" class="form-control" id="bankAcType">
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
											<label class="col-sm-5 control-label no-padding-right" for="bankAcNo">Account No</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" title="" id="bankAcNo">
											</div>
										</div>
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="bankMicrCode">MICR Code</label>
						                	<div class="col-sm-7">
						                  		<input type="text" class="form-control" title="" id="bankMicrCode"  maxlength="10">
						                	</div>
										</div>
									</div>
									
									<div class="row">
										<div class="form-group col-md-6 clearfix">
											<label class="col-sm-5 control-label no-padding-right" for="bankIfscCode">IFSC Code</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" title="" id="bankIfscCode"  maxlength="11">
											</div>
										</div>
										
									</div>
									
									
									
								</div>
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Nominee Details
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main clearfix">
									
									<div id="toreload">
									    <table id="data" class="table table-hover table-bordered table-striped">
										    <thead>
									    	    <tr>
									        	    <th class="thead"><a href="#">No</a></th>
									                <th class="thead"><a href="#">Name</a></th>
									                <th class="thead"><a href="#">Address </a></th>
									                <th class="thead"><a href="#">DOB</a></th>
									                <th class="thead"><a href="#">Relationship </a></th>
									                <th class="thead"><a href="#">Allocation%</a></th>
									                <th class="thead"><a href="#">Guardian Name[If minor]</a></th>
									                <th class="thead"><a href="#">Guardian Address[If minor]</a></th>
									            </tr>
									        </thead>
									        <tbody>
									        	<tr>
									            	<td>1</td>
									                <td>
														<div style="position:relative;width:120px;height:25px;border:0;padding:0;margin:0;">
															<select id="nomineeName1" style="position:absolute;top:0px;left:-5px;width:130px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue3').value=this.options[this.selectedIndex].text; document.getElementById('idValue3').value=this.options[this.selectedIndex].value; setNomineeDetails(this.value,'#nomineeDob1','#nomineeRelation1');">
															</select>
															<input name="displayValue3" placeholder="Type or select name" id="displayValue3" style="position:absolute;top:0px;left:-5px;width:115px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
															<input name="idValue3" id="idValue3" type="hidden">
														</div>
			           								</td>
			           								<td><input type="text" class="form-control" title="" id="nomineeAddress1"></td>
									                <td><input type="text" class="form-control" title="" placeholder="dd/mm/yyyy" id="nomineeDob1"></td>
									                <td>
									                	<select name="Relations" class="form-control" id="nomineeRelation1" >
									                    	<option>Spouse</option>
									                        <option>Husband</option>
									                        <option>Wife</option>
									                        <option>Mother</option>
										                    <option>Father </option>
									                        <option>Sister</option>
									                        <option>Brother</option>
									                        <option>Daughter</option>
									                        <option>Son</option>                       
									                    </select>
									                 </td>
									                 <td><input type="text" class="form-control" title="" id="nomineeAllocation1" onkeypress="return isNumber(event)" ></td>
									                 <td>
								    					<div style="position:relative;width:135px;height:25px;border:0;padding:0;margin:0;">
															<select class="form-control" id="nomineeGuardianName1" style="position:absolute;top:0px;left:0px;width:135px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue4').value=this.options[this.selectedIndex].text; document.getElementById('idValue4').value=this.options[this.selectedIndex].value;">
															</select>
															<input name="displayValue4" placeholder="Type or select name" id="displayValue4" style="position:absolute;top:0px;left:0px;width:115px;height:23px;border:1px solid #556;" onfocus="this.select()" type="text">
															<input name="idValue4" id="idValue4" type="hidden">
														</div>
													 </td>
			               							 <td><input type="text" class="form-control" title="" id="nomineeGuardianAddress1"></td>
												</tr>
			         							<tr>
			           								<td>2</td>
			           								<td>
														<div style="position:relative;width:120px;height:25px;border:0;padding:0;margin:0;">
															<select id="nomineeName2" style="position:absolute;top:0px;left:-5px;width:130px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue5').value=this.options[this.selectedIndex].text; document.getElementById('idValue5').value=this.options[this.selectedIndex].value;setNomineeDetails(this.value,'#nomineeDob2','#nomineeRelation2');">
															</select>
															<input name="displayValue5" placeholder="Type or select name" id="displayValue5" style="position:absolute;top:0px;left:-5px;width:115px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
															<input name="idValue5" id="idValue5" type="hidden">
														</div>
			          								</td>
			           								<td><input type="text" class="form-control" title="" id="nomineeAddress2"></td>
			           								<td><input type="text" class="form-control" title="" placeholder="dd/mm/yyyy" id="nomineeDob2"></td>
			           								<td>
			           									<select name="Relations" class="form-control" id="nomineeRelation2"  >
			                   								<option>Spouse</option>
									                        <option>Husband</option>
									                        <option>Wife</option>
									                        <option>Mother</option>
									                       	<option>Father </option>
									                        <option>Sister</option>
									                        <option>Brother</option>
									                        <option>Daughter</option>
									                        <option>Son</option>
									                        <option>Son</option>
									                        <option> Daughter</option>
									                    </select>
									                </td>
									                <td><input type="text" class="form-control" title="" id="nomineeAllocation2" onkeypress="return isNumber(event)" ></td>
			           								<td>
														<div style="position:relative;width:135px;height:25px;border:0;padding:0;margin:0;">
															<select id="nomineeGuardianName2" style="position:absolute;top:0px;left:0px;width:135px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue6').value=this.options[this.selectedIndex].text; document.getElementById('idValue6').value=this.options[this.selectedIndex].value;">
																		</select>
															<input name="displayValue6" placeholder="Type or select name" id="displayValue6" style="position:absolute;top:0px;left:0px;width:119px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
															<input name="idValue6" id="idValue6" type="hidden">
														</div>
			           								</td>
			               							<td><input type="text" class="form-control" title="" id="nomineeGuardianAddress2"></td>
			         							</tr>
												<tr>
			           								<td>3</td>
			           								<td>
			           									<div style="position:relative;width:120px;height:25px;border:0;padding:0;margin:0;">
															<select id="nomineeName3" style="position:absolute;top:0px;left:-5px;width:130px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue7').value=this.options[this.selectedIndex].text; document.getElementById('idValue7').value=this.options[this.selectedIndex].value;setNomineeDetails(this.value,'#nomineeDob3','#nomineeRelation3');">
															</select>
															<input name="displayValue7" placeholder="Type or select name" id="displayValue7" style="position:absolute;top:0px;left:-5px;width:115px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
															<input name="idValue7" id="idValue7" type="hidden">
														</div>
			           								</td>
								                  	<td><input type="text" class="form-control" title="" id="nomineeAddress3"></td>
								                  	<td><input type="text" class="form-control" title="" placeholder="dd/mm/yyyy" id="nomineeDob3"></td>
								                  	<td>
								                  		<select name="Relations" class="form-control" id="nomineeRelation3"  >
								                    		<option>Spouse</option>
								                        	<option>Husband</option>
								                        	<option>Wife</option>
								                        	<option>Mother</option>
								                        	<option>Father </option>
								                        	<option>Sister</option>
								                        	<option>Brother</option>
								                        	<option>Daughter</option>
								                        	<option>Son</option>
								                        	<option>Son</option>
								                        	<option> Daughter</option>
								                    	</select>
								                  	</td>
								                  	<td><input type="text" class="form-control" title="" id="nomineeAllocation3" onkeypress="return isNumber(event)"></td>
								                  	<td>
								                 		<div style="position:relative;width:135px;height:25px;border:0;padding:0;margin:0;">
															<select id="nomineeGuardianName3" style="position:absolute;top:0px;left:0px;width:135px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue8').value=this.options[this.selectedIndex].text; document.getElementById('idValue8').value=this.options[this.selectedIndex].value;">
															</select>
															<input name="displayValue8" placeholder="Type or select name" id="displayValue8" style="position:absolute;top:0px;left:0px;width:119px;height:23px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
															<input name="idValue8" id="idValue8" type="hidden">
														</div>
			          								</td>
			          								<td><input type="text" class="form-control" title="" id="nomineeGuardianAddress3"></td>
			         							</tr>
			       							</tbody>
			 							</table>
		    						</div> 
								</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
							<input type="hidden" name="newSize" id="newSize" value="${listSize}">
							<div id="Save" class="btn btn-primary btn-xs dbtn pull-right"  onclick="generateForm();">
									<i class="ace-icon fa fa-check bigger-110"></i>
									Generate Form
							</div>
						</div>
						</form>
						
					</div>
      				<div class="clearfix"></div>
	  	  		</div>
			</div> 
			</div>
			</div>
			</div>     
       	
	</section>
              
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
		function loadPreprintedForm(){
			var myVar = setInterval(function(){
			var fpActionPlanId = $('#fpActionPlanId').val();
		 	$("#toreload1").load('${pageContext.request.contextPath}/et/openEtForm.htm?fpActionPlanId='+fpActionPlanId+' #toreload1', function( response, status, xhr ) {
		      try{
		    	  	var oldSize = $('#listSize').val();
		    		var newSz = $('#newSize').val();
		    	 	if(oldSize > newSz){
		    	 		stopLoadingPreprintedForm(myVar);
		    	 	}
		      }catch(e){
		        // closePopupWebApp('');       
		      }
		     });},15000);
		}
		
		function stopLoadingPreprintedForm(myVar){
			clearInterval(myVar);
		}
		
		function enableTf2(){
			$("#stageType, #save1, #cancel1").show();
			$('#manufacturer, #product, #scheme, #option, #investmenttype, #investmentamount, #frequency, #allocation ').removeAttr("disabled", true);
		}
		
		function autoPopulateETForm(){
			$.ajax({
				type : "GET",
				url : $('#contextPath').val()+'/et/autoPolpulateEtForm.htm?fpActionPlanId='+$('#fpActionPlanId').val(),
				success : function(result) {
						//alert(JSON.stringify(result));
						$('#arnCode').val(result.arnCode);
						$('#firstHolderTitle').val(result.title1);
						$('#firstHolderName').val(result.name1);
						$('#firstHolderGender').val(result.gender1);
						$('#firstHolderDob').val(result.dob1);
						$('#firstHolderPanNo').val(result.panNo1);
						$('#firstHolderEmailId').val(result.emailId1);
						$('#firstHolderMobileNo').val(result.mobileNo1);
						$('#euin').val(result.euin);
						$('#firstHolderAddress').val(result.address1);
						$('#firstHolderCountry').val(result.country1);
						$('#firstHolderState').val(result.state1);
						$('#firstHolderCity').val(result.city1);
						$('#firstHolderZipCode').val(result.zipCode1);
						$('#bankName').val(result.bankName);
						$('#branchkName').val(result.branchName);
						$('#bankAddress').val(result.bankAddress);
						$('#bankState').val(result.bankState);
						$('#bankCity').val(result.bankCity);
						$('#bankAcType').val(result.bankAcType);
						$('#bankAcNo').val(result.bankAcNo);
						$('#bankMicrCode').val(result.bankMicrCode);
						$('#bankIfscCode').val(result.bankIfscCode);
				}
			});
		}

		function preLoadInvestmentAmount(){
			var text=$("#fpExecutionId option:selected").text().trim();
			var totalLength=text.length;
			var amount=text.substr(text.indexOf('Rs.')+3,text.indexOf(']')-text.indexOf('Rs.')-4);
			amount=amount.replace(/\,/g,'');
			$('#investmentAmount').val(amount);
		}
		
		function preloadInvType(){
			var text=$("#fpExecutionId option:selected").text().trim();
			if(text.indexOf('SIP')>0){
				$('#investmentType').val(96001);
			}else if(text.indexOf('Lumpsum')>0){
				$('#investmentType').val(96002);
			}else if(text.indexOf('Premium')>0){
				$('#investmentType').val(96003);
			}else if(text.indexOf('Fee')>0){
				$('#investmentType').val(96004);
			}
		}

		function loadForm(fpExecutionId,obj){
			if(fpExecutionId==0)
				return;
			preLoadInvestmentAmount();
			preloadInvType();
			$.ajax({
				type : "GET",
				url : $('#contextPath').val()+'/et/loadEtForm.htm?fpExecutionId='+fpExecutionId,
				success : function(result) {
				if(result.arnCode!="" && result.arnCode!="undefined" && result.arnCode!=undefined)
					$('#arnCode').val(result.arnCode);
					$('#subBrokerCode').val(result.subBrokerCode);
					if(result.title1!="" && result.title1!="undefined" && result.title1!=undefined)
						$('#firstHolderTitle').val(result.title1);
						//alert(result.name1);
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
					if(result.investmentAmount!="" && result.investmentAmount!="undefined" && result.investmentAmount!=undefined)
						$('#investmentAmount').val(result.investmentAmount);
						$('#firstHolderGuardianRelation').val(result.gauradinaRelation1);
						$('#firstHolderGuardianName').val(result.guardianName1);
						$('#applicationStatus').val(result.applicationStatus1);
						$('#modeOfHolding').val(result.modeOfHolding1);
						$('#occupation').val(result.occupation1);
						$('#secondHolderTitle').val(result.title2);
						//alert(result.name2);
						$('#secondHolderName').val(result.name2);$('#displayValue1').val(result.name2);
						$('#secondHolderPanNo').val(result.panNo2);
						$('#thirdHolderTitle').val(result.title3);
						$('#thirdHolderName').val(result.name3);$('#displayValue2').val(result.name3);
						$('#thirdHolderPanNo').val(result.panNo3);
						//$('#scheme').val(result.schemeName);
						//$('#option').val(result.schemeOption);
						//	$('#investmentAmount').val(result.investmentAmount);
						//$('#investmentType').val(result.investmentTypeId);
						$('#txnType').val(result.transactionTypeId);
						$('#nomineeName1').val(result.nomineeName1);$('#displayValue3').val(result.nomineeName1);
						$('#nomineeName2').val(result.nomineeName2);$('#displayValue5').val(result.nomineeName2);
						$('#nomineeName3').val(result.nomineeName3);$('#displayValue7').val(result.nomineeName3);
						$('#nomineeAddress1').val(result.nomineeAddress1);
						$('#nomineeAddress2').val(result.nomineeAddress2);
						$('#nomineeAddress3').val(result.nomineeAddress3);
					if(result.nomineeDob1=='01/01/1900'){
						$('#nomineeDob1').val(null);
					} else{ 
						$('#nomineeDob1').val(result.nomineeDob1);
					}
					if(result.nomineeDob2=='01/01/1900'){
						$('#nomineeDob2').val(null);
					} else{ 
						$('#nomineeDob2').val(result.nomineeDob2);
					}
					//$('#nomineeDob3').val(result.nomineeDob3);
					if(result.nomineeDob3=='01/01/1900'){
						$('#nomineeDob3').val(null);
					} else{ 
						$('#nomineeDob3').val(result.nomineeDob3);
					}
						$('#nomineeRelation1').val(result.nomineeRelation1);
						$('#nomineeRelation2').val(result.nomineeRelation2);
						$('#nomineeRelation3').val(result.nomineeRelation3);
						$('#nomineeGuardianName1').val(result.nomineeGuardianName1);
						$('#nomineeGuardianName2').val(result.nomineeGuardianName2);
						$('#nomineeGuardianName3').val(result.nomineeGuardianName3);
					if(result.nomineeAllocationPercent1=='0.00'){
						$('#nomineeAllocation1').val('');
					} else{ 
						$('#nomineeAllocation1').val(result.nomineeAllocationPercent1);
					}
					if(result.nomineeAllocationPercent2=='0.00'){
						$('#nomineeAllocation2').val('');
					} else{ 
						$('#nomineeAllocation2').val(result.nomineeAllocationPercent2);
					}
					if(result.nomineeAllocationPercent3=='0.00'){
						$('#nomineeAllocation3').val('');
					} else{ 
						$('#nomineeAllocation3').val(result.nomineeAllocationPercent3);
					}
						$('#nomineeGuardianAddress1').val(result.nomineeGuardianAddress1);
						$('#nomineeGuardianAddress2').val(result.nomineeGuardianAddress2);
						$('#nomineeGuardianAddress3').val(result.nomineeGuardianAddress3);
					if(result.euin!="" && result.euin!="undefined" && result.euin!=undefined)
						$('#euin').val(result.euin);
					if(result.bankName!="" && result.bankName!="undefined" && result.bankName!=undefined)
						$('#bankName').val(result.bankName);
					if(result.branchName!="" && result.branchName!="undefined" && result.branchName!=undefined)
						$('#branchkName').val(result.branchName);
					if(result.bankAddress!="" && result.bankAddress!="undefined" && result.bankAddress!=undefined)
						$('#bankAddress').val(result.bankAddress);
					if(result.bankAcType!="" && result.bankAcType!="undefined" && result.bankAcType!=undefined)
						$('#bankAcType').val(result.bankAcType);
					if(result.bankCity!="" && result.bankCity!="undefined" && result.bankCity!=undefined)
						$('#bankCity').val(result.bankCity);
					if(result.bankAcNo!="" && result.bankAcNo!="undefined" && result.bankAcNo!=undefined)
						$('#bankAcNo').val(result.bankAcNo);
					if(result.bankIfscCode!="" && result.bankIfscCode!="undefined" && result.bankIfscCode!=undefined)
						$('#bankIfscCode').val(result.bankIfscCode);
					if(result.bankMicrCode!="" && result.bankMicrCode!="undefined" && result.bankMicrCode!=undefined)
						$('#bankMicrCode').val(result.bankMicrCode);
					if(result.address1!="" && result.address1!="undefined" && result.address1!=undefined)
						$('#firstHolderAddress').val(result.address1);
					if(result.country1!="" && result.country1!="undefined" && result.country1!=undefined)
						$('#firstHolderCountry').val(result.country1);
					if(result.state1!="" && result.state1!="undefined" && result.state1!=undefined)
						$('#firstHolderState').val(result.state1);
					if(result.city1!="" && result.city1!="undefined" && result.city1!=undefined)
						$('#firstHolderCity').val(result.city1);
					if(result.zipCode1!="" && result.zipCode1!="undefined" && result.zipCode1!=undefined)
						$('#firstHolderZipCode').val(result.zipCode1);
						$('#folioNo').empty();
						$('#folioNo').append('<option value="0">---select---</option>');
						$(result.folioNos).each(function(i,obj){
						//	alert(obj);
						$('#folioNo').append('<option value="'+obj+'">'+obj+'</option>');
				});		
						$('#folioNo').val(result.folioNo);
						for(var key in result.products){
						//alert(obj);
							$('#product').append('<option value="'+key+'">'+result.products[key]+'</option>');
						}	
							$('#product').val(result.productId);	
							$('#txnType').val(86001);
							$('#txnType').attr('disabled','disabled');
				}
			});
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
					//$jq_1_9_1('#'+childId).autocomplete({
					$('#'+childId).autocomplete({
						source: cityArrayList
					});
				}
			});
			
		}

		$(document).ready(function(){
			
		// var $jq_1_9_1 = $.noConflict();
			$('#firstHolderDob,#nomineeDob1,#nomineeDob2,#nomineeDob3').datepicker({
				changeMonth : true,
				changeYear : true,
				maxDate : '0',
				yearRange : "1900:2200",
				dateFormat : "dd/mm/yy"
			});
			
			$('#executionLink').addClass('active');
			$('#prePrintedForm').css('font-weight','bold');
			
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
						$('#investmentType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					}
				});
					$('#txnType').val(86001);
					$('#txnType').attr('disabled','disabled');
					autoPopulateETForm();
					getApplicantName();
				}
			});
			//$jq_1_9_1('#firstHolderState,#bankState').autocomplete({
			$('#firstHolderState,#bankState').autocomplete({
				source: availableStates
			});
		});
			
		function saveForm(){
			var obj=new Object();
			obj.fpExecutionId=$('#fpExecutionId').val();
			obj.arnCode=$('#arnCode').val();
			obj.subBrokerCode=$('#subBrokerCode').val();
			var newFolioNo='';
			if($('#folioNo').val()==0 || $('#folioNo').val()==null){
				newFolioNo=$('#displayValue').val();
			} else{
				newFolioNo=$('#folioNo').val();
			}
			obj.folioNo=newFolioNo;
			var new2ndHolderName='';
			if($('#secondHolderName').val()==0){
				new2ndHolderName=$('#displayValue1').val();
			} else{
				new2ndHolderName=$('#secondHolderName').val();
			}
			obj.name2=new2ndHolderName;
				
			var new3rdHolderName='';
			if($('#thirdHolderName').val()==0){
				//if selected folio no is blank then check entered folio no
				new3rdHolderName=$('#displayValue2').val();
			} else{
					
			new3rdHolderName=$('#thirdHolderName').val();
			}
			obj.name3=new3rdHolderName;
				
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
			//obj.name2=$('#secondHolderName').val();
			obj.panNo2=$('#secondHolderPanNo').val();
			obj.title3=$('#thirdHolderTitle').val();
			//obj.name3=$('#thirdHolderName').val();
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
			obj.productId=$('#product').val();
			//obj.schemeName=$('#scheme').val();
			var sch=$('#fpExecutionId option:selected').text();
		  	obj.schemeName=sch.substr(0,sch.indexOf('['));
			obj.schemeOption=$('#option').val();
			obj.investmentAmount=$('#investmentAmount').val().replace("",0);
			obj.investmentTypeId=$('#investmentType').val();
			obj.transactionTypeId=$('#txnType').val();
			
			var nomName1='';
			if($('#nomineeName1').val()==0){
				//if selected folio no is blank then check entered folio no
				nomName1=$('#displayValue3').val();
			} else{
				nomName1=$('#nomineeName1').val();
			}
			obj.nomineeName1=nomName1;
			//obj.nomineeName1=$('#nomineeName1').val();
			obj.nomineeAddress1=$('#nomineeAddress1').val();
			if($('#nomineeDob1').val()!='')
				obj.nomineeDob1=$('#nomineeDob1').val();
				obj.nomineeRelation1=$('#nomineeRelation1').val();
				obj.nomineeAllocationPercent1=$('#nomineeAllocation1').val();
				
				var nomGardName1='';
				if($('#nomineeGuardianName1').val()==0){
					//if selected folio no is blank then check entered folio no
					nomGardName1=$('#displayValue4').val();
				} else{
					
					nomGardName1=$('#nomineeGuardianName1').val();
				}
				obj.nomineeGuardianName1=nomGardName1;
				//obj.nomineeGuardianName1=$('#nomineeGuardianName1').val();
				obj.nomineeGuardianAddress1=$('#nomineeGuardianAddress1').val();
				
				var nomName2='';
				if($('#nomineeName2').val()==0){
					//if selected folio no is blank then check entered folio no
					nomName2=$('#displayValue5').val();
				} else{
					nomName2=$('#nomineeName2').val();
				}
				obj.nomineeName2=nomName2;
				//obj.nomineeName2=$('#nomineeName2').val();
				obj.nomineeAddress2=$('#nomineeAddress2').val();
				if($('#nomineeDob2').val()!='')
				obj.nomineeDob2=$('#nomineeDob2').val();
				obj.nomineeRelation2=$('#nomineeRelation2').val();
				obj.nomineeAllocationPercent2=$('#nomineeAllocation2').val();
				
				var nomGardName2='';
				if($('#nomineeGuardianName2').val()==0){
					//if selected folio no is blank then check entered folio no
					nomGardName2=$('#displayValue6').val();
				} else{
					
					nomGardName2=$('#nomineeGuardianName2').val();
				}
				obj.nomineeGuardianName2=nomGardName2;
				//obj.nomineeGuardianName2=$('#nomineeGuardianName2').val();
				obj.nomineeGuardianAddress2=$('#nomineeGuardianAddress2').val();
				
				var nomName3='';
				if($('#nomineeName3').val()==0){
					//if selected folio no is blank then check entered folio no
					nomName3=$('#displayValue7').val();
				} else{
					
					nomName3=$('#nomineeName3').val();
				}
				obj.nomineeName3=nomName3;
				//obj.nomineeName3=$('#nomineeName3').val();
				obj.nomineeAddress3=$('#nomineeAddress3').val();
				//alert($('#nomineeDob3').val());
				if($('#nomineeDob3').val()!='')
				obj.nomineeDob3=$('#nomineeDob3').val();
				obj.nomineeRelation3=$('#nomineeRelation3').val();
				obj.nomineeAllocationPercent3=$('#nomineeAllocation3').val();
				
				var nomGardName3='';
				if($('#nomineeGuardianName3').val()==0){
					//if selected folio no is blank then check entered folio no
					nomGardName3=$('#displayValue8').val();
				} else{
					
					nomGardName3=$('#nomineeGuardianName3').val();
				}
				obj.nomineeGuardianName3=nomGardName3;
				//obj.nomineeGuardianName3=$('#nomineeGuardianName3').val();
				obj.nomineeGuardianAddress3=$('#nomineeGuardianAddress3').val();
				
				obj.euin=$('#euin').val();
				//obj.cityCategory=$('#cityCategory').val();
				
				//alert(obj.euin);
				//alert($('#fpExecutionId').val());
				$.ajax({
			  		url: $('#contextPath').val()+"/et/saveEtForm.htm?fpExecutionId="+$('#fpExecutionId').val(),
					method:"post",
					contentType: 'application/json',
			        data:JSON.stringify(obj),
				    dataType: 'json',
					success:function(result){
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
			var isValidated=true;
			isValidated=validateInputForm('saveEtForm');
			if(!isAllocationPercentageProper()) {
				return;
			}
			
			if (!isValidated)
				return;
			saveForm();
			$.ajax({
				  url: $('#contextPath').val()+"/et/generateEtForm.htm?fpExecutionId="+$('#fpExecutionId').val()+"&fpActionPlanId="+$('#fpActionPlanId').val(),
				  method:"post",
				  success:function(result){
					  if(result.success!=null){
						  showAlertMessage1("Success", result.success+'\n',	"confirmation", doNothing);
					  }
			 		  else{
			 			 showAlertMessage1("Error",
			 					result.error+'\n',
									"confirmation", doNothing);  }
					  
					  loadPreprintedForm();
			  }		 
		 }); 
		}

		function viewDoc(docId){
			$('#documentIdToDownload').val(docId);
			document.downloadAttachmentForm.submit();
		}
		
		function emailDoc(docId,partyid){
			
			if(docId!=0 && partyid!=0){
				$.ajax({
					type : "GET",
					url : $('#contextPath').val()+'/et/sendEmail.htm?docId='+docId+'&partyId='+partyid,
					dataType : "json",
					success : function(data){
						
						if(data=='success'){
							showAlertMessage1("Success", "Email has been sent successfully"+'\n',"confirmation", doNothing);
						
						}else{
							showAlertMessage1("Error",data.error+'\n',"confirmation", doNothing);
						}
				 			 
					} 
				});
			}
		}
		
		function loadFolioDetails(){
			var folioId = $("#folioNo").val();
			if (folioId==0)
				return;
			$.ajax({
				type : "GET",
				url : $('#contextPath').val()+'/et/loadfoliodetails.htm?folioId='+folioId,
				dataType : "json",
				success : function(data){
					
					if(data!=null){
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
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
		
		function getApplicantName(){
			var fpActionPlanId = $('#fpActionPlanId').val();
			$.ajax
				({
			    	type: "GET",
			    	url : $('#contextPath').val()+'/et/getApplicantDetails.htm?actionPlanId='+fpActionPlanId,
			      	dataType: 'json',
			      	contentType: 'application/json',
			        success:function(result)
			      	{ 		   
			        	$("#secondHolderName, #thirdHolderName, #nomineeName1, #nomineeName2, #nomineeName3, #nomineeGuardianName1, #nomineeGuardianName2, #nomineeGuardianName3").empty();
						$("#secondHolderName, #thirdHolderName, #nomineeName1, #nomineeName2, #nomineeName3, #nomineeGuardianName1, #nomineeGuardianName2, #nomineeGuardianName3").append('<option value="0">--Select--</option>');
			        	$(result).each(function(i,obj){ 
			        		var id=obj.partyId;
							var name=obj.name2; 
							$("#secondHolderName, #thirdHolderName, #nomineeName1, #nomineeName2, #nomineeName3, #nomineeGuardianName1, #nomineeGuardianName2, #nomineeGuardianName3").append('<option value="'+ name +'">'+ name + '</option>');
					        panarr[obj.name2] = obj.panNo2;
					        salutionarr[obj.name2] = obj.title2;
					        dobarr[obj.name2] = obj.dob1;
					        relationarr[obj.name2] = obj.nomineeRelation1;
						 }); 
			      	}
			   });
		};
		
		function split( val ) {
		    return val.split( /;\s*/ );
		} 
		function extractLast( term ) {
		    return split( term ).pop();
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
			    //alert( index + ' : ' + value );
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
				alert('Please enter valid pancard number');
				$(selectId).select();
				$(selectId).focus();
				return false;
			}
		}
	</script>
	
	<!-- <script type="text/javascript">
		var grid_data=${avaibaleForms};
		index=grid_data;
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
					plusicon : "ace-icon fa fa-plus center bigger-110 blue",
					minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
					openicon : "ace-icon fa fa-chevron-right center orange"
				},
		
				data: index,
				datatype: "local",
				height: 300,
				colNames:['docId','partyId','Product','Form Name','Generated On','Action'],
				colModel:[
					{name:'docId',index:'docId', width:5,hidden:true},
					{name:'partyId',index:'partyId', width:5,hidden:true},
					{name:'productId',index:'productId', width:460,},
					{name:'formName',index:'formName', width:670,},
					{name:'generatedOn',index:'generatedOn', width:150,},
					{name:'action',index:'action',formatter:function(cellvalue, options,rowObject) {
					    return '<a onclick="openActionPopup('+rowObject.docId+','+rowObject.partyId+')">Action</a>';
					}},
				], 
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
				pager : pager_selector,
				altRows: true,
				multiselect: false,
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
			
				//editurl: "/dummy.html",//nothing is saved
				/* autowidth: false,
				shrinkToFit: true, */
				//caption: "Execution Tracker For",
				
				});
			/* 	var captionName='Available pre-printed forms';
				$(grid_selector).jqGrid('setCaption', captionName);
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				 */
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
						search: false,
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
					buttons.addClass('btn btn-xs').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
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
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-xs btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-xs btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-xs btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
				
				}
				
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					
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
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
			function openActionPopup(docId,partyId){
				
				$('#ViewdocId a').attr('onClick','viewDoc('+docId+')');
				$('#dwnloaddocId a').attr('onClick','viewDoc('+docId+')');
				$('#emailDocId a').attr('onClick','emailDoc('+docId+','+partyId+')');
				$( ".action_dialog" ).removeClass('hide').dialog({
					resizable: false,
					modal: true,
                    width: "auto",
				});
			}
		</script>
 -->		
 <script type="text/javascript">
		var grid_data=${avaibaleForms};
		index=grid_data;
		jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
				
			$(window).bind('resize', function() {
			    var width = $('#jqGrid_container').width();
			    $('#grid-table').setGridWidth(width);
			});
				
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
		
				data: index,
				datatype: "local",
				//width:590,
				height: '100%',
				//shrinkToFit: false,
				colNames:['docId','partyId','Product','Form Name','Generated On','Action'],
				colModel:[
					{name:'docId',index:'docId', width:5,hidden:true},
					{name:'partyId',index:'partyId', width:5,hidden:true},
					{name:'productId',index:'productId', width:380},
					{name:'formName',index:'formName', width:600},
					{name:'generatedOn',index:'generatedOn', width:135},
					{name:'action',index:'action',width:50,formatter:function(cellvalue, options,rowObject) {
					    return '<a onclick="openActionPopup('+rowObject.docId+','+rowObject.partyId+')">Action</a>';
					}},
				], 
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
				pager : pager_selector,
				altRows: true,
				multiselect: false,
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
			
				//editurl: "/dummy.html",//nothing is saved
				/* autowidth:true,
				shrinkToFit:true,
				caption: "Tracking History", */
				
				});
				
				
				
				/* $(grid_selector).jqGrid('setCaption', captionName);
				$(window).triggerHandler('resize.jqGrid'); *///trigger window resize to make the grid get the correct size
				
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
						search: false,
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
						/* recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						} */
					},
					{
						//new record form
						//width: 700,
						/* closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						} */
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
					buttons.addClass('btn btn-xs').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
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
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-xs btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-xs btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-xs btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
				
				}
				
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					
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
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
		function openActionPopup(docId,partyId){
			
			$('#ViewdocId a').attr('onClick','viewDoc('+docId+')');
			$('#dwnloaddocId a').attr('onClick','viewDoc('+docId+')');
			$('#emailDocId a').attr('onClick','emailDoc('+docId+','+partyId+')');
			$( ".action_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
                width: "auto",
			});
		}
		</script>
		<div class="common_dialog hide action_dialog">
		<table class="table table-bordered table-striped">
			<tr>
				<th class="thead">Action List</th>
			</tr>
			<tr>
				<td id="ViewdocId">
					<i class="outputreport_icon"></i>
					<a href="#" style="color: #333;">
						<span class="user">View</span>
					</a>
				</td>
			</tr>
			<tr>
				<td id="dwnloaddocId">
					<i class="download_icon"></i>
					<a href="#" style="color: #333;">
						<span class="user">Download</span>
					</a>
				</td>
			</tr>
			<tr>
				<td id="emailDocId">
					<i class="emailicon"></i>
					<a href="#" style="color: #333;">
						<span class="user">Email</span>
					</a>
				</td>
			</tr>

		</table>
	</div>
	</body>
</html>