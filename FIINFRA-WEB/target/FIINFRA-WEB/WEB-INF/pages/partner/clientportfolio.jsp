<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Portfolio</title>
<style type="text/css">
/*do not delete it*/
.ui-autocomplete{
	z-index:1050 !important;
}
</style>
</head>

<body>

	<form:form method="POST" modelAttribute="nominations"
		id="nominationsForm" style="visibility:hidden;display:none;"
		action="openfolioNominations.htm">
		<input type="text" id="nominationsForm-partyAssetId"
			name="partyAssetId" />
		<input type="text" id="nominationsForm-clientId" name="clientId" />
		<input type="text" id="nominationsForm-assetName" name="assetName" />
	</form:form>
	<input type="hidden" id="partyAssetId" />
	<input type="hidden" id="clientId" value="0"/>

	<jsp:include page="../common/header.jsp" />

	<!-- Center part start -->
	<section>
      <div class="page-header">
							<h1>
								Client Portfolio
								
							</h1>
						</div>
                        <div class="tabbable">
  <ul class="nav nav-tabs" id="">
    <li class="dropdown active"> <a id="myportfolio" data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">My Portfolio <i class="ace-icon fa fa-caret-down bigger-110 width-auto"></i></a>
      <ul class="dropdown-menu dropdown-info" id="myportfolioMenu">
        <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/folio/foliopage.htm'">MF Portfolio</a> </li>
        <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/folio/openclientportfolio.htm'">Client Portfolio </a> </li>
      </ul>
    </li>
    <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getTxnSource.htm'">RTA File Uploads </a> </li>
    <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History </a> </li>
    <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm'">Reports</a> </li>
    <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}'">Preprinted Form</a> </li>
    <li id="autoAllocatedAssetsLink"> <a onclick="window.location.href='<%=request.getContextPath()%>/et/assetAutoAllocation.htm'">Auto Allocated Assets</a> </li>
   <li id="autoAllocatedAssetsLink"> <a onclick="showPasswordDialog();">MF Auto Upload Configuration</a> </li>
  </ul>
  <div class="tab-content">
    <div id="clientportfolio" class="tab-pane fade in active clearfix">
    <div class="col-md-12" style="margin-bottom:10px;">
					<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 id="folioName" class="widget-title bigger lighter">
									
								</h5>
								<div class="widget-toolbar widget-toolbar no-border">
									
										<select id="clientId" name="clientId" class="form-control" onchange="getClientPortfolio(this.value);">
						             		<option value="0"> --Select Client--  </option>
						                 	<c:forEach var="item" items="${contactData}">
						                 		<option value="${item.partyId}">${item.name}</option>
						                 	</c:forEach>
						   				</select>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main">
									<div class="row">
										<div class="col-md-3">
											<div class="well well-lg">
												<div class="row">
													<div class="col-md-4">
														<i class="ace-icon fa icon-opportunity green bigger-300 "></i>
													</div>
													<div class="col-md-8">
														<h5 class="dark">Assets</h5>
														<h4 class="blue" id="totalassetvalue">NA</h4>
														
														
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-md-3">
											<div class="well well-lg">
												<div class="row">
													<div class="col-md-4">
														<i class="ace-icon fa fa-bar-chart green bigger-300 "></i>
													</div>
													<div class="col-md-8">
														<h5 class="dark">Liablities</h5>
														<h4 class="blue" id="totalliabilitiesvalue">NA</h4>
														
													
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-md-3">
											<div class="well well-lg">
												<div class="row">
													<div class="col-md-4">
														<i class="ace-icon fa fa-rupee green bigger-300 "></i>
													</div>
													<div class="col-md-8">
														<h5 class="dark">Networth</h5>
														<h4 class="blue" id="totalnetworthvalue">NA</h4>
														
													</div>
												</div>
											</div>
										</div>
										
										<div class="col-md-3">
											<div class="well well-lg">
												<div class="row">
													<div class="col-md-4">
														<i class="ace-icon fa fa-mortar-board green bigger-300 "></i>
													</div>
													<div class="col-md-8">
														<h5 class="blue">Bank Account  <span id="totalbankaccs">NA</span> </h5>
														<h4 class="blue">DP Account <span id="totaldpaccs">NA</span></h4>
														
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
            <div class="clearfix"></div>   
            <div class="col-md-12" style="margin-bottom:10px;">
					<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Client Portfolio Summary
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<div>
									<table class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Particular</th>
												<th>Investment Cost (Rs)</th>
												<th>Current Value (Rs)</th>
												<th>Net Gain/Loss</th>
											</tr>
										</thead>
										<tbody>
											<tr id="stocks" class="tablescroll tablescroll_head">
												<td width="13%" style="cursor: pointer">
													<i id="arrowicon0" class="ace-icon fa fa-chevron-down"></i> Stocks
												</td>
												<td width="11%">0.00</td>
												<td width="10%">0.00</td>
												<td width="15%">0.00(0.00%)</td>
											</tr>
											<tr>
												<td colspan="4">
													<div class="widget-box widget-color-dark ui-sortable-handle">
													<div class="widget-header widget-header-small">
														<h6 class="widget-title">
															Stock Summary
														</h6>
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up" data-icon-show="fa-chevron-down" data-icon-hide="fa-chevron-up"></i>
															</a>
														</div>
														<div class="widget-toolbar no-border open">
															<button id="StocksAddLink"  class="btn btn-xs btn-yellow bigger" onclick="addstock('Add','','','','','','','',0,0);" >
																<i class="ace-icon fa fa-plus"></i>
																Add New
															</button>
															
														</div>
													</div>
													<div class="widget-body">
													<div class="widget-main no-padding">
													<div class="tablescroll_wrapper">
														
														<table class="tablescroll_body table table-striped table-bordered table-hover" id="stocks-details">
														
														</table>
													</div>
													</div>
													</div>
													</div>
												</td>
											</tr>
											<tr id="mutualfunds" class="tablescroll tablescroll_head">
												<td width="13%" style="cursor: pointer">
												<i id="arrowicon1" class="ace-icon fa fa-chevron-down"></i> Mutual Funds</td>
												<td width="11%">0.00</td>
												<td width="10%">0.00</td>
												<td width="15%">0.00(0.00%)</td>
											</tr>
											
											<tr>
												<td colspan="4">
													<div class="widget-box widget-color-dark ui-sortable-handle">
													<div class="widget-header widget-header-small">
														<h6 class="widget-title">
															Mutual Fund Summary
														</h6>
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up" data-icon-show="fa-chevron-down" data-icon-hide="fa-chevron-up"></i>
															</a>
														</div>
														<div class="widget-toolbar no-border open">
															<button id="MFAddLink"  class="btn btn-xs btn-yellow bigger" onclick="addMutualFunds();" >
																<i class="ace-icon fa fa-plus"></i>
																Add New
															</button>
															
														</div>
													</div>
													<div class="widget-body">
													<div class="widget-main no-padding">
													<div class="tablescroll_wrapper">
														
														<table class="tablescroll_body table table-striped table-bordered table-hover" id="mutualfund-details">
														
														</table>
													</div>
													</div>
													</div>
													</div>
												</td>
											</tr>
											
											<tr id="ulip" class="tablescroll tablescroll_head">
												<td width="13%" style="cursor: pointer">
													<i id="arrowicon2" class="ace-icon fa fa-chevron-down"></i> ULIP</td>
												<td width="11%">0.00</td>
												<td width="10%">0.00</td>
												<td width="15%">0.00(0.00%)</td>
											</tr>
											<tr>
												<td colspan="4">
												<div class="widget-box widget-color-dark ui-sortable-handle">
													<div class="widget-header widget-header-small">
														<h6 class="widget-title">
															ULIP Summary
														</h6>
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up" data-icon-show="fa-chevron-down" data-icon-hide="fa-chevron-up"></i>
															</a>
														</div>
														<div class="widget-toolbar no-border open">
															<button id="ULIPAddLink"  class="btn btn-xs btn-yellow bigger" onclick="addUlip('Add',0,0,'','','','','',0,'','');" >
																<i class="ace-icon fa fa-plus"></i>
																Add New
															</button>
															
														</div>
													</div>
													<div class="widget-body">
													<div class="widget-main no-padding">
													<div class="tablescroll_wrapper">
														
														<table class="tablescroll_body table table-striped table-bordered table-hover" id="ulip-details">
														
														</table>
													</div>
													</div>
													</div>
													</div>
													
												</td>
											</tr>
											<tr id="fixedincome" class="tablescroll tablescroll_head">
												<td width="13%" style="cursor: pointer">
												<i id="arrowicon3" class="ace-icon fa fa-chevron-down"></i> Fixed Income</td>
												<td width="11%">0.00</td>
												<td width="10%">0.00</td>
												<td width="15%">0.00(0.00%)</td>
											</tr>
											<tr>
												<td colspan="4">
													<div class="widget-box widget-color-dark ui-sortable-handle">
													<div class="widget-header widget-header-small">
														<h6 class="widget-title">
															Fixed Income Summary
														</h6>
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up" data-icon-show="fa-chevron-down" data-icon-hide="fa-chevron-up"></i>
															</a>
														</div>
														<div class="widget-toolbar no-border open">
															<button id="FixedIncomeAddLink"  class="btn btn-xs btn-yellow bigger" onclick="addFixIncome('Add','','','','','','','','');" >
																<i class="ace-icon fa fa-plus"></i>
																Add New
															</button>
															
														</div>
													</div>
													<div class="widget-body">
													<div class="widget-main no-padding">
													<div class="tablescroll_wrapper">
														
														<table class="tablescroll_body table table-striped table-bordered table-hover" id="fixedincome-details">
														
														</table>
													</div>
													</div>
													</div>
													</div>
													
												</td>
											</tr>
											

											
											<tr id="bullion" class="tablescroll tablescroll_head">
												<td width="13%" style="cursor: pointer">
												<i id="arrowicon6" class="ace-icon fa fa-chevron-down"></i> Gold</td>
												<td width="11%">0.00</td>
												<td width="10%">0.00</td>
												<td width="15%">0.00(0.00%)</td>
											</tr>
											<tr>
												<td colspan="4">
													<div class="widget-box widget-color-dark ui-sortable-handle">
													<div class="widget-header widget-header-small">
														<h6 class="widget-title">
															Gold Summary
														</h6>
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up" data-icon-show="fa-chevron-down" data-icon-hide="fa-chevron-up"></i>
															</a>
														</div>
														<div class="widget-toolbar no-border open">
															<button id=""  class="btn btn-xs btn-yellow bigger" onclick="addGold('Add','','','','','');">
																<i class="ace-icon fa fa-plus"></i>
																Add New
															</button>
															
														</div>
													</div>
													<div class="widget-body">
													<div class="widget-main no-padding">
													<div class="tablescroll_wrapper">
														
														<table class="tablescroll_body table table-striped table-bordered table-hover" id="bullion-details">
														
														</table>
													</div>
													</div>
													</div>
													</div>
													
												</td>
											</tr>
											
											<tr id="property" class="tablescroll tablescroll_head">
												<td width="13%" style="cursor: pointer">
												<i id="arrowicon7" class="ace-icon fa fa-chevron-down"></i> Property</td>
												<td width="11%">0.00</td>
												<td width="10%">0.00</td>
												<td width="15%">0.00(0.00%)</td>
											</tr>
											<tr>
												<td colspan="4">
													<div class="widget-box widget-color-dark ui-sortable-handle">
													<div class="widget-header widget-header-small">
														<h6 class="widget-title">
															Property Summary
														</h6>
														<div class="widget-toolbar">
															<a href="#" data-action="collapse">
																<i class="ace-icon fa fa-chevron-up" data-icon-show="fa-chevron-down" data-icon-hide="fa-chevron-up"></i>
															</a>
														</div>
														<div class="widget-toolbar no-border open">
															<button id="propertyAddLink"  class="btn btn-xs btn-yellow bigger" onclick="addProperty('Add','','','','','','');">
																<i class="ace-icon fa fa-plus"></i>
																Add New
															</button>
															
														</div>
													</div>
													<div class="widget-body">
													<div class="widget-main no-padding">
													<div class="tablescroll_wrapper">
														
														<table class="tablescroll_body table table-striped table-bordered table-hover" id="property-details">
														
														</table>
													</div>
													</div>
													</div>
													</div>
													
												</td>
											</tr>
											
											
										</tbody>
										
									</table>
								</div>
								
								</div>
							</div>
						</div>
					</div>
        			<div class="clearfix"></div>
				</div>     
      
    </div>
    <div id="" class="tab-pane fade">
     
    </div>
    <div id="" class="tab-pane fade">
      
    </div>
    <div id="" class="tab-pane fade">
      
    </div>
  </div>
</div>
		
		
			<!-- modal pop up for stock -->
			<div class="modal fade" id="popUpaddStock" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="stockTitle">Add Stock</h4>
				      </div>
      				  <div class="modal-body">
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<form id="addEditStockForm" name="addEditStockForm" novalidate>
      								<input type="hidden" id="stpartyAssetId"/>
      								<input type="hidden" id="stproductId"/>
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="txnTypeStocks">Investor Name:</label>
							                <div class="col-sm-9">
							                 	<select name="invName" class="form-control" id="investorName">
												</select>
							                </div>
							            </div>
              						</div>
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="txnTypeStocks">Txn Type<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="Party type" class="form-control" id="txnTypeStocks" validate="1" emsg="Txn Type">
												</select>
							                </div>
							            </div>
              						</div>
               						<div class="row">
              							<div class="form-group col-md-12 clearfix">
                							<label class="col-sm-3 control-label no-padding-right" for="stocks-txndate">Txn Date<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input name="stocks-txndate"	type="text" id="stocks-txndate" validate="1" emsg="Txn Date"
													class="datepicker">
             									<!-- <div id="stocks-txndate_error" class="help-block hide">Please select txn. date.</div> -->
                							</div>
              							</div>
              						</div>
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="exchangeTypeStocks">Exchange</label>
                							<div class="col-sm-9">
                  								<select	id="exchangeTypeStocks" name="Party type" class="form-control">
													<option>NSE</option>
													<option>BSE</option>
												</select>
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stock-name">Stock Name<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input id="stock-name"	type="text" class="form-control"
													onKeyUp="searchAssets(this,this.id,'Stock');" placeholder="Quick Search"
													class="form-control ui-autocomplete-input" autocomplete="off" validate="1"
													emsg="Stock Name">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-quantity">Quantity<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input	id="stocks-quantity" type="text" class="form-control allowFloatWithPrecision4"
							 						validate="1" emsg="Stock Quantity" 
													onBlur="calculateTotalTxnAmount('stocks-quantity','stocks-price','stocks-totaltxnamt','stocks-brokrageamt');">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-price">Price<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input id="stocks-price" type="text" class="form-control allowFloatWithPrecision4"
							 						validate="1" emsg="Stock Price" onBlur="calculateTotalTxnAmount('stocks-price','stocks-quantity','stocks-totaltxnamt','stocks-brokrageamt');">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right"  for="stocks-brokrageamt">Brokerage Amt</label>
                							<div class="col-sm-9">
                  								<input type="text"
													id="stocks-brokrageamt" class="form-control allowFloatWithPrecision4" onBlur="calculateTotalTxnAmount('stocks-price','stocks-quantity','stocks-totaltxnamt','stocks-brokrageamt');">
                								<!-- <div id="stocks-brokrageamt-error" class="help-block">Please provide a valid email.</div> -->
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-totaltxnamt">Total Txn Amt<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input	id="stocks-totaltxnamt" type="text" class="form-control allowFloatWithPrecision4"
							 						validate="1" emsg="Total Txn Amount" readonly>
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="dmatAccounts">Demat Account</label>
                							<div class="col-sm-9">
                  								<input type="text"	id="dmatAccounts" name="Party type" class="form-control">
                							</div>
              							</div>
              						</div>
              						
              						
        
      							</form>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer" id="addbuttonsStock" >
  						
  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveStockDetailsForm('Add');">
  							<i class="fa fa-plus"></i>Save & Close
  						</button>
  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
  					</div>
  					
  					<div class="modal-footer" id="editbuttonsStock">
  						
  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveStockDetailsForm('Update');">
  							<i class="fa fa-plus"></i>Update
  						</button>
  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
  					</div>
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for stock end-->
  		
  		<!-- modal pop up for MF -->
  		<div class="modal fade" id="popUpaddMF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="mfTitle">Add Mutual Funds</h4>
				      </div>
      				  <div class="modal-body">
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<form id="addEditMFForm" novalidate>
             						
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="txnTypeStocks">Investor Name<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="mfinvName" class="form-control" id="investorNameMF" validate="1">
												</select>
							                </div>
							            </div>
              						</div>
             						
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="txnTypeStocks">Txn Type<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="Party type" id="mf-txn-type" class="form-control"
													validate="1" emsg="Txn Type" onChange="hideShowSIPDetails(this.value);">
												</select>
							                </div>
							            </div>
              						</div>
               						<div class="row">
              							<div class="form-group col-md-12 clearfix">
                							<label class="col-sm-3 control-label no-padding-right" for="mf-txn-date">Txn Date<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input name="address"
													type="text" id="mf-txn-date" class="datepicker" readonly
													style="float: left;"  validate="1" emsg="Txn Date">
							             	
                							</div>
              							</div>
              						</div>
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="mf_asset_amc">AMC<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<select id="mf_asset_amc" name="mf_asset_amc" class="form-control" validate="select" emsg="select AMC" onchange="searchAssets(this,this.id,'mf');">
													<!-- <option value="0">--Select AMC--</option> -->
												</select>
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stock-name">Scheme<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<select id="mf-asset-name" name="mf-asset-name" class="form-control" validate="1" emsg="Fund Name">
													<option>--Select Scheme--</option>
												</select>
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-quantity">Folio No<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text" id="mf-folio-no"
													class="form-control" validate="1" emsg="Folio Number"/>
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="dmatAccounts">Total Txn Amt<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text"
													class="form-control allowFloatWithPrecision4"  validate="1" emsg="Total Txn Amount"
													id="mf-total-txn-amount" onBlur="populateSIPAmount();calculateTotalUnits('mf-total-txn-amount','mf-nav','mf-units','');">
                							</div>
              							</div>
              						</div>
              						
              						<!-- <div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right"  for="stocks-brokrageamt">Brokerage Amt<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text"
													id="stocks-brokrageamt" class="form-control allowFloatWithPrecision4" onBlur="calculateTotalTxnAmount('stocks-price','stocks-quantity','stocks-totaltxnamt','stocks-brokrageamt');">
                								
                							</div>
              							</div>
              						</div> -->
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-totaltxnamt">Purchase NAV<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text"
													class="form-control allowFloatWithPrecision4"  id="mf-nav" validate="1" emsg="NAV"
													onBlur="calculateTotalUnits('mf-total-txn-amount','mf-nav','mf-units','');" >
                							</div>
              							</div>
              						</div>
              						
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-price">Units<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text" class="form-control allowFloatWithPrecision4" validate="1" emsg="Units" id="mf-units"  readonly="readonly">
                							</div>
              							</div>
              						</div>
              						<div id="sipDetails" style="display:none">
              							<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="mf-sip-start-date">SIP Start Date</label>
	                							<div class="col-sm-9">
	                  								<input name="address"
														type="text" id="mf-sip-start-date" readonly validate="1" emsg="SIP Start Date" class="datepicker"
														style="float: left;" >
	                							</div>
	              							</div>
              							</div>
              						
	              						<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="mf-sip-end-date">SIP End Date</label>
	                							<div class="col-sm-9">
	                  								<input readonly validate="1" emsg="SIP End Date" name="address"
														type="text" id="mf-sip-end-date" class="datepicker"
														style="float: left;" >
	                							</div>
	              							</div>
	           							</div>
	           							
	           							<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="dmatAccounts">SIP Amount</label>
	                							<div class="col-sm-9">
	                  								<input name="" validate="1" emsg="SIP Amount"
								 						type="text" style="float: left;" 
														id="mf-sip-amount" class="allowFloatWithPrecision4">
	                							</div>
	              							</div>
	           							</div>
	           							
	           							<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="dmatAccounts">SIP Payout Frequency</label>
	                							<div class="col-sm-9">
	                  								<select	name="Party type" class="form-control"
														style="float: left; margin-top: 5px;" id="mf-sip-frequency" validate="1" emsg="SIP Payout Frequency">
															<option>Monthly</option>
															<option>Yearly</option>
													</select>
	                							</div>
	              							</div>
	           							</div>
	           							
	           							
              						</div>
      							</form>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer">
  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveMFDetailsForm();">
  							<i class="fa fa-plus"></i>Save & Close
  						</button>
  					</div>
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for MF End -->
  		
  		<!-- modal pop up for ULIP-->
  		<div class="modal fade" id="popUpaddULIP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="ulipTitle">Add ULIP</h4>
				      </div>
      				  <div class="modal-body">
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<form id="addEditULIPForm" novalidate>
             						<input type="hidden" id="ulippartyAssetId"/>
             						<input type="hidden" id="ulipproductId"/>
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="investorNameULIP">Investor Name<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="ulipinvName" class="form-control" id="investorNameULIP" validate="1">
												</select>
							                </div>
							            </div>
              						</div>
             						
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="ulip-txn-type">Txn Type<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="Party type" class="form-control"
													style="width: 300px; float: left;" id="ulip-txn-type" validate="1" emsg="Txn Type">
														<option>Purchase</option>
														<option>Sell</option>
												</select>
							                </div>
							            </div>
              						</div>
               						<div class="row">
              							<div class="form-group col-md-12 clearfix">
                							<label class="col-sm-3 control-label no-padding-right" for="ulip-txn-date">Txn Date<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input name="address"
													type="text" class="datepicker" style="float: left;"
													 id="ulip-txn-date" validate="1" emsg="Txn Date">
							             	
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="policyNo">Policy No</label>
                							<div class="col-sm-9">
                  								<input type="text" class="form-control" id="policyNo">
                							</div>
              							</div>
              						</div>
              						
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="ulip-scheme-name">Scheme Name</label>
                							<div class="col-sm-9">
                  								<input type="text" class="form-control"
													validate="1" emsg="Scheme Name" id="ulip-scheme-name" onKeyUp="searchAssets(this,this.id,'ULIP');">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-price">Units<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text" class="form-control allowFloatWithPrecision4"
													 id="ulip-units" validate="1" emsg="Units"
													onBlur="calculateTotalTxnAmount('ulip-units','ulip-nav','ulip-total-txn-amount','');">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="stocks-totaltxnamt">NAV<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text"
													class="form-control allowFloatWithPrecision4"  id="ulip-nav" validate="1" emsg="NAV"
													onBlur="calculateTotalTxnAmount('ulip-nav','ulip-units','ulip-total-txn-amount','');">
                							</div>
              							</div>
              						</div>
              						
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="ulip-total-txn-amount">Total Txn Amt</label>
                							<div class="col-sm-9">
                  								<input type="text"
													class="form-control allowFloatWithPrecision4"  readonly id="ulip-total-txn-amount" validate="1" emsg="Total Txn Amount">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="ulip-total-txn-amount">Narration</label>
                							<div class="col-sm-9">
                  								<textarea class="form-control" rows="3" id="ulip-narration"></textarea>
                							</div>
              							</div>
              						</div>
              						
      							</form>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer" id="addbuttonsULIP" >
						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveULIPDetailsForm('Add');">
	  						<i class="fa fa-plus"></i>Save & Close
	  					</button>
	  					<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	  				</div>
	  				<div class="modal-footer" id="editbuttonsULIP">
	  					<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveULIPDetailsForm('Update');">
	  						<i class="fa fa-plus"></i>Update
	  					</button>
	  					<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	  				</div>
  					
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for ULIP End -->
  		
  		<!-- modal pop up for Fixed Income-->
  		<div class="modal fade" id="popUpaddFI" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="fiTitle">Add Fixed Income</h4>
				      </div>
      				  <div class="modal-body">
      				  	
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<form id="addEditFIForm" novalidate>
             						<input type="hidden" id="FIpartyAssetId"/>
             						<div class="row">
			         					<div class="form-group col-md-12 clearfix">
							            	<label class="col-sm-3 control-label no-padding-right" for="investorNameFI">Investor Name<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="fiinvName" class="form-control" id="investorNameFI" validate="1">
												</select>
							                </div>
							            </div>
			    					</div>
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="fi-txn-type">Txn Type<span class="red">*</span></label>
							                <div class="col-sm-9">
													<select name="Party type" class="form-control"
														style="width: 300px; float: left;" id="fi-txn-type"
														validate="1" emsg="Txn Type">
														<option>Purchase</option>
														<option>Sell</option>
													</select>
												</div>
							            </div>
              						</div>
               						<div class="row">
              							<div class="form-group col-md-12 clearfix">
                							<label class="col-sm-3 control-label no-padding-right" for="fi-txn-date">Txn Date<span class="red">*</span></label>
                							<div class="col-sm-9">
													<input name="address"
													type="text" class="datepicker" style="float: left;"
													 id="fi-txn-date" validate="1" emsg="Txn Date">

												</div>
              							</div>
              						</div>
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-deposit-type">Deposit Type</label>
                							<div class="col-sm-9">
													<select name="Deposit type" onChange="depositTypeChange()"
														id="fi-deposit-type" validate="1" emsg="Deposit Type"
														class="form-control" style="width: 300px; float: left;">
														<option value="1" selected>Fixed Deposit</option>
														<option value="2">Recurring Deposit</option>
														<option value="3">Bonds</option>
														<option value="3">PO Savings Scheme</option>
														<option value="3">PPF</option>
														<option value="3">PF</option>
													</select>
												</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-manufacturer">Manufacturer<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text" class="form-control" 
													id="fi-manufacturer" validate="1" emsg="Manufacturer" onKeyUp="searchAssets(this,this.id,'fixedincome');">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-principal-amount">Principal Amount<span class="red">*</span></label>
                							<div class="col-sm-9">
													<input type="text" class="form-control"
														id="fi-principal-amount" validate="1"
														emsg="Principal Amount">
												</div>
              							</div>
              						</div>
              						
              						<!--Recurring Deposit start -->
									<div id="RecurringDeposit" style="display: none;">
	              						<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="fi-installment-amount">Installment Amount</label>
	                							<div class="col-sm-9">
	                  								<input type="text" id="fi-installment-amount" validate="1" emsg="Installment Amount"
														class="form-control">
	                							</div>
	              							</div>
	              						</div>
	              						
	              						<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="fi-installment-frequency">Installment Freq.</label>
	                							<div class="col-sm-9">
	                  								<select
														name="Party type" class="form-control" id="fi-installment-frequency" validate="1" emsg="Installment Frequency"
														style="float: left; margin-top: 5px; width: 120px;">
															<option>Yearly</option>
															<option>Monthly</option>
													</select>
	                							</div>
	              							</div>
	              						</div>
              						
              						</div>
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-maurity-amount">Maturity Amount</label>
                							<div class="col-sm-9">
                  								<input name="address" class="form-control" id="fi-maurity-amount" validate="1" emsg="Maturity Amount" type="text">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-maurity-date">Maturity Date</label>
                							<div class="col-sm-9">
                  								<input name="address"
													type="text" id="fi-maurity-date" validate="1" emsg="Maturity Date" class="datepicker">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-interest-rate">Interest %</label>
                							<div class="col-sm-9">
													<input name="intrate" class="form-control" type="text" id="fi-interest-rate" validate="1" emsg="Interest Rate">
											</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-interest-frequency">Interest Frequency </label>
                							<div class="col-sm-9">
													<select name="Party type" class="form-control"
														id="fi-interest-frequency" validate="1"
														emsg="Interest Frequency"
														style="float: left; margin-top: 5px; width: 120px;">
														<option>Daily</option>
														<option>Weekly</option>
														<option>Fortnightly</option>
														<option>Weekly</option>
														<option>Monthly</option>
														<option>Quarterly</option>
														<option>Half-yearly</option>
														<option>Yearly</option>
													</select>
												</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-interest-frequency">Interest Payout </label>
                							<div class="col-sm-9">
													<select name="Party type" class="form-control"
														id="fi-interest-payout-frequency" validate="1"
														emsg="Interest Payout Frequency"
														style="float: left; margin-top: 5px; width: 120px;">
														<option>Daily</option>
														<option>Weekly</option>
														<option>Fortnightly</option>
														<option>Weekly</option>
														<option>Monthly</option>
														<option>Quarterly</option>
														<option>Half-yearly</option>
														<option>Yearly</option>
													</select>
												</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-payout-option">Payout Option</label>
                							<div class="col-sm-9">
													<select name="Party type" class="form-control"
														id="fi-payout-option" validate="1" emsg="Payout Option"
														style="float: left; margin-top: 5px; width: 120px;">
														<option>Cheque/DD</option>
														<option>Credit Bank Account</option>
													</select>
												</div>
              							</div>
              						</div>
              						
              						<!-- Bonds Start -->
									<div id="Bonds" style="display: none;">
	              						<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="fi-face-value">Face Value</label>
	                							<div class="col-sm-9">
														<input name="" id="fi-face-value" validate="1" emsg="Face Value"
														type="text">
													</div>
	              							</div>
	              						</div>
	              						
	              						<div class="row">
	              							<div class="form-group col-md-12 clearfix">
	               								<label class="col-sm-3 control-label no-padding-right" for="fi-certificate-no">Certificate No(s)</label>
	                							<div class="col-sm-9">
														<input name="" id="fi-certificate-no" validate="1"
															emsg="Certificate No(s)" type="text">
													</div>
	              							</div>
	              						</div>
	              						
              						</div>
              						<!-- Bonds End -->
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="fi-narration">Narration </label>
                							<div class="col-sm-9">
													<textarea id="fi-narration"
														class="form-control" rows="3" ></textarea>
												</div>
              							</div>
              						</div>
      							</form>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer" id="addbuttonsFI" >
	  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveFIDetailsForm('Add');">
	  							<i class="fa fa-plus"></i>Save & Close
	  						</button>
	  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	  						
	  				</div>
	  				<div class="modal-footer" id="editbuttonsFI" >
	  					<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveFIDetailsForm('Update');">
	  						<i class="fa fa-plus"></i>Update
	  					</button>
	  					<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	  				</div>
  					
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for Fixed Income End -->
  		
  		<!-- modal pop up for Gold-->
  		<div class="modal fade" id="popUpaddGold" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="goldTitle">Add Gold</h4>
				      </div>
      				  <div class="modal-body">
      				  	
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<form id="addEditGoldForm" novalidate>
      								<input type="hidden" id="GOLDpartyAssetId"/>
             						<div class="row">
			         					<div class="form-group col-md-12 clearfix">
							            	<label class="col-sm-3 control-label no-padding-right" for="investorNameGold">Investor Name<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="invNameGold" class="form-control" id="investorNameGold" validate="1">
												</select>
							                </div>
							            </div>
			    					</div>
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="gold-txn-type">Txn Type<span class="red">*</span></label>
							                <div class="col-sm-9">
													<select id="gold-txn-type" name="Party type" class="form-control"
														style="width: 300px; float: left;">
														<option>Purchase</option>
														<option>Sell</option>
													</select>
												</div>
							            </div>
              						</div>
               						<div class="row">
              							<div class="form-group col-md-12 clearfix">
                							<label class="col-sm-3 control-label no-padding-right" for="gold-txn-date">Txn Date<span class="red">*</span></label>
                							<div class="col-sm-9">
												<input name="goldName" type="text" id="gold-txn-date"
														validate="1" emsg="Txn Date" class="datepicker"
														style="float: left; width: 120px;">
											</div>
              							</div>
              						</div>
              						
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="gold-current-val">Current Value</label>
                							<div class="col-sm-9">
                  								<input type="text" id="gold-current-val" class="form-control allowFloatWithPrecision4" >
                							</div>
              							</div>
              						</div>
									
									<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="gold-year-invst">Yearly Investement</label>
                							<div class="col-sm-9">
                  								<input type="text" id="gold-year-invst" class="form-control allowFloatWithPrecision4" >
                							</div>
              							</div>
              						</div>
									
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="gold-descp">Description </label>
                							<div class="col-sm-9">
													<textarea id="gold-descp"
														class="form-control" rows="3" ></textarea>
												</div>
              							</div>
              						</div>

      							</form>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer" id="addbuttonsGOLD" >
  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveGoldDetailsForm('Add');">
  							<i class="fa fa-plus"></i>Save & Close
  						</button>
  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
  					</div>
  					<div class="modal-footer" id="editbuttonsGOLD" >
  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="saveGoldDetailsForm('Update');">
  							<i class="fa fa-plus"></i>Update
 						</button>
  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
  					</div>
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for gold End -->
  		
  		<!-- modal pop up for Property-->
  		<div class="modal fade" id="popUpaddProperty" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="propTitle">Add Property</h4>
				      </div>
      				  <div class="modal-body">
      				  	
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<form id="addEditPropForm" novalidate>
      								<input type="hidden" id="ProppartyAssetId"/>
             						<div class="row">
			         					<div class="form-group col-md-12 clearfix">
							            	<label class="col-sm-3 control-label no-padding-right" for="investorNameProp">Investor Name<span class="red">*</span></label>
							                <div class="col-sm-9">
							                 	<select name="fiinvName" class="form-control" id="investorNameProp" validate="1">
												</select>
							                </div>
							            </div>
			    					</div>
             						<div class="row">
              							<div class="form-group col-md-12 clearfix">
							                <label class="col-sm-3 control-label no-padding-right" for="prop-txn-type">Txn Type<span class="red">*</span></label>
							                <div class="col-sm-9">
													<select id="prop-txn-type" name="Party type" class="form-control"
														style="width: 300px; float: left;">
														<option>Purchase</option>
														<option>Sell</option>
													</select>
												</div>
							            </div>
              						</div>
               						<div class="row">
              							<div class="form-group col-md-12 clearfix">
                							<label class="col-sm-3 control-label no-padding-right" for="prop-txn-date">Purchase Date<span class="red">*</span></label>
                							<div class="col-sm-9">
												<input name="propdt" type="text" id="prop-txn-date"
														validate="1" emsg="Txn Date" class="datepicker"
														style="float: left; width: 120px;">
											</div>
              							</div>
              						</div>
              						
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="prop-Name">Property Name<span class="red">*</span></label>
                							<div class="col-sm-9">
                  								<input type="text" class="form-control" id="prop-Name">
                							</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="prop-principal-amount">Purchase Amount<span class="red">*</span></label>
                							<div class="col-sm-9">
													<input type="text" id="prop-principal-amount" class="form-control allowFloatWithPrecision4" >
												</div>
              							</div>
              						</div>
              						
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="prop-current-val">Current Value</label>
                							<div class="col-sm-9">
                  								<input type="text" id="prop-current-val" class="form-control allowFloatWithPrecision4" >
                							</div>
              							</div>
              						</div>
              						<div class="row">
              							<div class="form-group col-md-12 clearfix">
               								<label class="col-sm-3 control-label no-padding-right" for="prop-descp">Description </label>
                							<div class="col-sm-9">
													<textarea id="prop-descp"
														class="form-control" rows="3" ></textarea>
												</div>
              							</div>
              						</div>

      							</form>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer" id="addbuttonsProp" >
	  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="savePropertyDetailsForm('Add');">
	  							<i class="fa fa-plus"></i>Save & Close
	  						</button>
	  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	  					</div>
	  					<div class="modal-footer" id="editbuttonsProp" >
	  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="savePropertyDetailsForm('Update');">
	  							<i class="fa fa-plus"></i>Update
	  						</button>
	  						<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	  					</div>
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for property End -->
  		
  		<!-- modal pop up for view transaction-->
  		<div class="modal fade" id="ViewTxt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">View Transactions</h4>
				      </div>
      				  <div class="modal-body">
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<div id="poptable_contactform" style="padding: 10px; height: 200px;">
									Asset Name: <strong><span id="assetName">NA</span>,</strong> Fund-<strong><span
										id="assetType">NA</span></strong>, Current Value: <strong><span
										id="currentValue">NA</span></strong>, Allocated Value [%] <strong><span
										id="allocatedValue">NA</span></strong>, Available Value [%] <strong><span
										id="availableValue"></span></strong>
									
									<table  class="tablescroll_body table table-striped table-bordered table-hover"
										style="margin-top: 10px;" id="viewTransactionsTable">
				
									</table>
				
				
								</div>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer">
  						
  					</div>
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for view transaction End -->
  		
  		
  		<!-- modal pop up for map to goal-->
  		<div class="modal fade bs-example-modal-lg" id="MaptoGoal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  				<div class="modal-dialog modal-lg">
    				<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">Map to Goal</h4>
				      </div>
      				  <div class="modal-body">
  						<div class="row" >
    						<div class="list-group" id="changePasswordDetailsDiv" >
      							<div>
									Asset Name: <strong id="assetNameGoal">NA</strong> Current Value: <strong
										id="currentValueGoal">NA</strong>, Allocated Value [%] <strong
										id="allocatedValueGoal">NA</strong>, Available Value [%] <strong
										id="availableValueGoal">NA</strong>
									<table class="tablescroll_body table table-striped table-bordered table-hover"
										style="margin-top: 10px;" id="goalMapping">
				
									</table>
									
				
								</div>
    						</div>
  						</div>
  					</div>
  					<div class="modal-footer">
  						<button data-bb-handler="confirm" type="button" class="btn btn-primary" id="save"  onclick="updateGoalAlloation();">
	  							<i class="fa fa-plus"></i>Update
	  					</button>
	  					<button data-bb-handler="cancel" type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
  						
  					</div>
  				</div>
  			</div>
  		</div>
  		<!-- modal pop up for map to goal End -->
	
</section>
<!-- Center part End -->
	<jsp:include page="../common/footer.jsp" />
	
	<script src="<%=request.getContextPath()%>/js/clientPortfolio.js"></script>
	
	<script type="text/javascript">//<![CDATA[ 
	$(window).load(
	function(){
	;	
	(function ($) {
	    var scrollbarWidth = 0;

    function getScrollbarWidth() {
        if (scrollbarWidth) return scrollbarWidth;
        var div = $('<div style="width:50px;height:50px;overflow:auto;position:absolute;top:-200px;left:-200px;"><div style="height:100px;"></div></div>');
        $('body').append(div);
        var w1 = $('div', div).innerWidth();
        div.css('overflow-y', 'auto');
        var w2 = $('div', div).innerWidth();
        $(div).remove();
        scrollbarWidth = (w1 - w2);
        return scrollbarWidth;
    }
    $.fn.tableScroll = function (options) {
        if (options == 'undo') {
            var container = $(this).parent().parent();
            container.find('.tablescroll_head thead').prependTo(this);
            container.find('.tablescroll_foot tfoot').appendTo(this);
            container.before(this);
            container.empty();
            return;
        }
        var settings = $.extend({}, $.fn.tableScroll.defaults, options);
		
        settings.scrollbarWidth = getScrollbarWidth();
        this.each(function () {
            var flush = settings.flush;
            var tb = $(this).addClass('tablescroll_body');
            var wrapper = $('<div class="tablescroll_wrapper" ></div>').insertBefore(tb).append(tb);
            // check for a predefined container
            if (!wrapper.parent('div').hasClass(settings.containerClass)) {
                $('<div></div>').addClass(settings.containerClass).insertBefore(wrapper).append(wrapper);
            }
            var width = settings.width ? settings.width : tb.outerWidth();
            wrapper.css({
                'width': width + 'px',
                    'height': settings.height + 'px',
                    'overflow': 'auto'
            });
			
            tb.css('width', width + 'px');
            // with border difference
            var wrapper_width = wrapper.outerWidth();
            var diff = wrapper_width - width;
            // assume table will scroll
            wrapper.css({
                width: ((width - diff) + settings.scrollbarWidth) + 'px'
            });
            tb.css('width', (width - diff) + 'px');
            if (tb.outerHeight() <= settings.height) {
                wrapper.css({
                    height: 'auto',
                    width: (width - diff) + 'px'
                });
                flush = false;
            }
            // using wrap does not put wrapper in the DOM right
            // away making it unavailable for use during runtime
            // tb.wrap(wrapper);
            // possible speed enhancements
            var has_thead = $('thead', tb).length ? true : false;
            var has_tfoot = $('tfoot', tb).length ? true : false;
            var thead_tr_first = $('thead tr:first', tb);
            var tbody_tr_first = $('tbody tr:first', tb);
            var tfoot_tr_first = $('tfoot tr:first', tb);
            // remember width of last cell
            var w = 0;
            $('th, td', thead_tr_first).each(function (i) {
                w = $(this).width();
                $('th:eq(' + i + '), td:eq(' + i + ')', thead_tr_first).css('width', w + 'px');
                $('th:eq(' + i + '), td:eq(' + i + ')', tbody_tr_first).css('width', w + 'px');
                if (has_tfoot) $('th:eq(' + i + '), td:eq(' + i + ')', tfoot_tr_first).css('width', w + 'px');
            });
            if (has_thead) {
                var tbh = $('<table class="tablescroll_head" cellspacing="0"></table>').insertBefore(wrapper).prepend($('thead', tb));
            }
            if (has_tfoot) {
                var tbf = $('<table class="tablescroll_foot" cellspacing="0"></table>').insertAfter(wrapper).prepend($('tfoot', tb));
            }
            if (tbh != undefined) {
                tbh.css('width', width + 'px');
                if (flush) {
                    $('tr:first th:last, tr:first td:last', tbh).css('width', (w + settings.scrollbarWidth) + 'px');
                    tbh.css('width', wrapper.outerWidth() + 'px');
                }
            }
            if (tbf != undefined) {
                tbf.css('width', width + 'px');
                if (flush) {
                    $('tr:first th:last, tr:first td:last', tbf).css('width', (w + settings.scrollbarWidth) + 'px');
                    tbf.css('width', wrapper.outerWidth() + 'px');
                }
            }
        });
        return this;
    };
    // public
    $.fn.tableScroll.defaults = {
        flush: true, // makes the last thead and tbody column flush with the scrollbar
        width: null, // width of the table (head, body and foot), null defaults to the tables natural width
        height: 280, // height of the scrollable area
        containerClass: 'tablescroll' // the plugin wraps the table in a div with this css class
    };
})(jQuery);

mapAssets=new Object();
map =new Object();
//amcmap =new Object();
autoCompleteArray=new Array();
$(function() {
	
	$('.headstrip').remove();
	
	//$( "#mf-nav,#mf-sip-amount" ).blur(calculateUnitsForMF);
	
	$( "#mf-folio-no,#dmatAccounts" ).autocomplete({
					source: autoCompleteArray
				});
	
	$(".allowFloatWithPrecision4").on("keypress keyup blur",function (event) {
        //this.value = this.value.replace(/[^0-9\.]/g,'');
		$(this).val($(this).val().replace(/[^0-9\.]/g,''));
		 var value=$(this).val();

		        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
		            
		            event.preventDefault();
		        }
		      if(value.substr($(this).val().indexOf('.'),$(this).val().length).length>4)
		          event.preventDefault();

     });
	
	
	$('#stocks-txndate,#mf-txn-date,#mf-sip-start-date,#mf-sip-end-date,#ulip-txn-date,#fi-txn-date,#fi-maurity-date,#prop-txn-date,#gold-txn-date').datepicker({
		changeMonth : true,
		changeYear : true,		
		yearRange : "-100:+100",
		dateFormat : "dd/mm/yy"

	});
	$('#stocks-txndate,#mf-txn-date,#mf-sip-start-date,#mf-sip-end-date,#ulip-txn-date,#fi-txn-date,#fi-maurity-date,#prop-txn-date,#gold-txn-date').attr('readonly',true);
	
	$('#stocks-txndate,#mf-txn-date,#mf-sip-start-date,#mf-sip-end-date,#ulip-txn-date,#fi-txn-date,#fi-maurity-date,#prop-txn-date','#gold-txn-date').blur(function(){
		if ($('#fi-txn-date').val().match(/[^ - ]/g) 
				|| $('#fi-maurity-date').val().match(/[^ - ]/g)
				|| $('#stocks-txndate').val().match(/[^ - ]/g)
				|| $('#mf-txn-date').val().match(/[^ - ]/g)
				|| $('#mf-sip-start-date').val().match(/[^ - ]/g)
				|| $('#mf-sip-end-date').val().match(/[^ - ]/g)
				|| $('#prop-txn-date').val().match(/[^ - ]/g)
				|| $('#gold-txn-date').val().match(/[^ - ]/g)
				|| $('#ulip-txn-date').val().match(/[^ - ]/g)) {
		    this.value = this.value.replace(/[^ - ]/g, '');
		}
		});
	
	$('#quickSearch').keypress(function(event){
		
		var keycode = (event.keyCode ? event.keyCode : event.which);
		
		if(keycode == '13'){
			  //alert(availableTags);
			//alert('You pressed a "enter" key in textbox:'+map[$('#quickSearch').val()]);
			//if(typeof parentId!='undefined'){
			if(typeof map[$('#quickSearch').val()]!="undefined"){ 
				getPortFolioData(map[$('#quickSearch').val()]);
				$('#clientId').val(map[$('#quickSearch').val()]);
			} else{
				//alert('Please select valid name');
				showAlertMessage('Error','<br/>Please select valid name!','error');
			}
			
			var isFirefox = typeof InstallTrigger !== 'undefined';   // Firefox 1.0+
			if (isFirefox == true){
			   $('#quickSearch').val('');
			}
		}
		event.stopPropagation();
	});
	

	var partyId='${param.partyId}';
	//alert(partyId);
	if(partyId==undefined || partyId==""){
		partyId=0;
	}
	getPortFolioData(partyId);
	
	//loadAllPicklists();
    $jq_1_9_1('#stocksDetails,#mfDetails').tableScroll({
        Height: 150
    });

	$('.tablescroll_head').each(function () {
    $(this).next().slideToggle();
});
$('.tablescroll_wrapper').css('overflow','auto!important');
});

 

//accordion
$('.tablescroll_head').click(function () {
    $(this).next().slideToggle();
    
    var trid = $(this).closest('tr').attr('id'); // get particular table row ID
    
    if(trid == 'stocks'){
    	$('#arrowicon0').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    if(trid == 'mutualfunds'){
    	$('#arrowicon1').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    if(trid == 'ulip'){
    	$('#arrowicon2').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    if(trid == 'fixedincome'){
    	$('#arrowicon3').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    if(trid == 'postoffice'){
    	$('#arrowicon4').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    if(trid == 'retirement'){
    	$('#arrowicon5').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    if(trid == 'bullion'){
    	$('#arrowicon6').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    if(trid == 'property'){
    	$('#arrowicon7').toggleClass("fa-chevron-down fa-chevron-up"); 
    }
    
    
    
});



});//]]>



function searchAssets(e,id,searchType){
	
	var event = window.event ? window.event : e;
	//alert($('#mf-txn-type').val());
	var amcid=0;
	var searchStr='';
	var clientPartyId=0;
	 if(searchType=='mf'){
		 amcid = $('#'+id).val();
		 searchStr='';
		 $('#mf-asset-name').empty();
		 
	} else {
		 searchStr=$('#'+id).val().replace(/%20/g, " ");
	}
	
	 if($('#mf-txn-type').val()=='502014'){
		
		 clientPartyId=$('#clientId').val();
	 } 
	 
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 || event.keyCode==13 )
		return;
	
	$('#common_popup_div,#shadow_div_web_app').hide();
	if(window.quickSearchAssetRequest)
		window.quickSearchAssetRequest.abort();
	else
		window.quickSearchAssetRequest=null;
	window.quickSearchAssetRequest =$.ajax({
		  url: $('#contextPath').val()+"/folio/quickSearchAssets.htm?searchType="+searchType+"&mfAMCId="+amcid+"&searchString="+searchStr+"&clientPartyId="+clientPartyId,
		  method:"get",
		  success:function(result){
			  $('#common_popup_div,#shadow_div_web_app').hide();
			  
			  if(searchType!='mf'){
					var	 availableTagsStock = new Array();
					$('#'+id).autocomplete({
						source: availableTagsStock
					});
				 
					for (var key in result.data) {
						availableTagsStock.push(result.data[key]);
						mapAssets[result.data[key]]=(key);
					}
			  } else {
					
				  	//load drop down for MF scheme
				  	$('#mf-asset-name').empty();
				  	//$('#mf-asset-name').append('<option value="0">--Select Scheme--</option>');
				  	$.each( result.data, function( key, value ) {
				  	  
				  		$('#mf-asset-name').append('<option value="'+key+'">'+value+'</option>');
				  	});
			  }
		  }
		});

}


/*
function quickSearchContacts(e){
	
	var event = window.event ? window.event : e;
	//alert(event.keyCode);
	
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
		return;
	if(event.keyCode==13){
		document.location.href= $('#contextPath').val()+"/folio/openclientportfolio.htm?partyId="+map[$('#quickSearch').val()];
		
	}
	$('#common_popup_div,#shadow_div_web_app').hide();
	$.ajax({
		  url: $('#contextPath').val()+"/et/quickSearchContacts.htm?searchString="+$('#quickSearch').val(),
		  method:"post",
		  success:function(result){
			  $('#common_popup_div,#shadow_div_web_app').hide();
			  map=new Object();
				 availableTags = new Array();
				$( "#quickSearch" ).autocomplete({
					source: availableTags
				});
			 
			 $(result).each(function(i,obj){
				 
				 availableTags.push(obj.fName+' '+obj.lName +'['+obj.panNo+' '+obj.emailId+']');
				 map[obj.fName+' '+obj.lName +'['+obj.panNo+' '+obj.emailId+']']=(obj.partyId);
				 
			 }); 
			  
			
		  }
		});

}
*/

function isFloat(value) {
	var valid = (value.match(/^-?\d*(\.\d+)?$/));
	alert(valid);
	return valid;
}

/**
 * @descrition loads data for transaction type , exchange type , dmat acc for add/edit stock form
 */
function loadDataForAddEditStockForm(investorId) {
	mapAssets = {};
	$.ajax({
		  	url: $('#contextPath').val()+"/folio/getClientStockDetailsForAddEditForm.htm?partyId="+$('#clientId').val(),		 
			method:"GET",
		  	contentType: 'application/json',
	        dataType: 'json',
		  	success:function(result){
		  		if(!isObjectNull(result)) {
		  			var transactionTypes = result.transactionType;
		  			var exchangeTypes = result.exchangeType
		  			var dMatAccounts = result.dMatAccounts;
		  			var investorNames = result.investorNames;
		  			if(!isObjectNull(transactionTypes)) {
		  				loadOptionsInSelectStatementForAddEditForm('#txnTypeStocks', transactionTypes);
		  				$('#txnTypeStocks').val(502010);
		  			}
		  			
		  			if(!isObjectNull(exchangeTypes)) {
		  				loadOptionsInSelectStatementForAddEditForm('#exchangeTypeStocks', exchangeTypes);
		  			}
		  			
		  			if(!isObjectNull(dMatAccounts)) {
		  				autoComplete('#dmatAccounts', dMatAccounts);
		  			}
		  			
		  			loadInvesterNameDropbox('#investorName',investorNames,investorId);
		  		}
		  	
		  }
		});
	
}

function loadInvesterNameDropbox(selectId, result,investorId) {
	$(selectId).empty();
	var currentPartyId;
	if(investorId==0){
		currentPartyId=$('#clientId').val();
	}else{
		currentPartyId=investorId;
	}
	
	$(result).each(function(i,obj) {
		var name=obj.name;
		var id=obj.key;
		if(currentPartyId==id){
			$(selectId).append('<option value="'+id+'" selected="selected">'+name+'</option>');
		}else{
			$(selectId).append('<option value="'+id+'">'+name+'</option>');
		}
		
		
		
	});
}

function loadOptionsInSelectStatementForAddEditForm(selectId, result) {
	
	$(selectId).empty();
	if(selectId=='#fi-deposit-type'){
		$(selectId).append('<option value="" >---select---</option>');	
	}
	
	$(result).each(function(i,obj) {
		var codeValue=obj.name;
		var codeValueId=obj.key;
		$(selectId).append('<option value="'+codeValueId+'">'+codeValue+'</option>');
	});
}

function autoComplete(selectId, result){
	$(result).each(function(i,obj) {
		var codeValue=obj.name;
		var codeValueId=obj.key;
		autoCompleteArray.push(codeValue);
	});
}


function getClientPortfolio(clientId){
	document.location.href= $('#contextPath').val()+"/folio/openclientportfolio.htm?partyId="+clientId;
}

</script>
	
<script>

	function depositTypeChange(){
		if ($('#fi-deposit-type').val()==48011){
				$("#FixDeposit").show();	
				$("#RecurringDeposit, #Bonds").hide();
			}
			
			else
			if ($('#fi-deposit-type').val()==48053){
				$("#RecurringDeposit").show();	
				$("#FixDeposit, #Bonds").hide();
				
			}
			else{
			
				$("#Bonds").show();	
				$("#RecurringDeposit, #FixDeposit").hide();
			}
	}
</script>

	<script>
$(document).ready(function(){
  $("#user").click(function(){
  //$("#usermenu").slideToggle();
	});
	
	
	$("#Help").click(function(){
  $("#HelpMenu").slideToggle();
	});
	
	 $("#Contact").click(function(){
  $("#ContactMenu").slideToggle();
	});
	 $("#myportfolio").click(function(){
  $("#myportfolioMenu").slideToggle();
	});	
	 
	 
	
	 
	  	$('#fi-principal-amount, #fi-maurity-amount, #fi-interest-rate').keypress(function (event) {
	  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
	  	        event.preventDefault();
	  	      //$("#errmsg4").html("Please enter digits Only").show().fadeOut(2500);
	  	    }

	  	    var text = $(this).val();

	  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 2)) {
	  	        event.preventDefault();
	  	      //$("#errmsg4").html("You can enter only two digits after decimal").show().fadeOut(2500);
	  	    }
	   });
});


</script>
<input type="hidden" id="hiddenPartyId">
</body>
</html>
