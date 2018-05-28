<!DOCTYPE html>
<html lang="en">
<head>
	<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
    <link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Transaction History</title>
 	<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
 	<script src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js"></script>
 	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.dataTables.css" />
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
	
	<!-- Edit Transaction start here -->		
<div class="modal fade" id=edit tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close"  data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Edit Mutual Funds Transaction</h4> 
      		</div> 

      		<div id="success-msg"></div><!-- success msg display -->
      		<div id="form-box">

      				<div id="success-msg"></div>
      				<div id="form-box">
					<input type="hidden" name="firstName4" id="amcId" value="" class="col-xs-12 col-sm-9" placeholder="Total Txn Amt">
      				<form class="form-horizontal" id="addEditMFForm">
      				<div class="modal-body">
      					<input type="hidden" name="firstName3" id="pmTxnId" value="" class="col-xs-12 col-sm-9" placeholder="Total Txn Amt">
						<input type="hidden" name="firstName2" id="clientId" value="" class="col-xs-12 col-sm-9" placeholder="Total Txn Amt">
						<input type="hidden" name="firstName2" id="txt" value="" class="col-xs-12 col-sm-9" placeholder="Total Txn Amt">
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Investor Name<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="mfinvName" id="clientName" class="col-xs-12 col-sm-9" ></select>
									

								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Txn Type<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="txnType" id="txnType" class="col-xs-12 col-sm-9"  onChange="hideShowSIPDetails(this.value);"></select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Txn Date<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="startDate" name="startDate" id="startDate"  value="" class="col-xs-12 col-sm-9" placeholder="TXN Date">
								</div>
							</div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">AMC</label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="amc" id="amc" onchange="searchAssets(this,this.id,'mf')" class="col-xs-12 col-sm-9" >
									
									</select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Scheme Name<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<select name="productName" id="productId" class="col-xs-12 col-sm-9"  ></select>
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Folio No<span class="red">*</span></label>
							 <div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="folioNumber" id="folioNumber" value="" class="col-xs-12 col-sm-9" placeholder="Folio No">
								</div>
							 </div>
						</div>
						<div class="space-2"></div>
									
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Total Txn Amt</label>
							  <div class="col-xs-12 col-sm-9">
								<div class="input-group">
									
									<input type="text" name="txnAmount" id="txnAmount" value="" onBlur="populateSIPAmount();calculateTotalUnits('txnAmount','txtPriceNav','mf-units','');" class="col-xs-12 col-sm-9" placeholder="Total Txn Amt">
								
								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
								<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Purchase NAV<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="txtPriceNav" id="txtPriceNav" value="" onBlur="calculateTotalUnits('txnAmount','txtPriceNav','txtUnitQty','');" class="col-xs-12 col-sm-9" placeholder="Purchase NAV">

								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div class="form-group">
							<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Units<span class="red">*</span></label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="txtUnitQty" id="txtUnitQty" value="" class="col-xs-12 col-sm-9"  placeholder="Unit" readonly="readonly">

								</div>
							</div>
						</div>
						<div class="space-2"></div>
						
						<div id="sipDetails" style="display:none">
								<div class="form-group">
								<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">SIP Start Date<span class="red">*</span></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="sipStartDate" id="sipStartDate" value="" class="col-xs-12 col-sm-9" >
	
									</div>
								</div>
							</div>
							<div class="space-2"></div>
							
							<div class="form-group">
								<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">SIP End Date<span class="red">*</span></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="sipEndDate" id="sipEndDate" value="" class="col-xs-12 col-sm-9" >
	
									</div>
								</div>
							</div>
							<div class="space-2"></div>
							
							<div class="form-group">
								<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">SIP Amount<span class="red">*</span></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
										<input type="text" name="sipAmount" id="sipAmount" value="" class="col-xs-12 col-sm-9" >
	
									</div>
								</div>
							</div>
							<div class="space-2"></div>
              							
	              				<div class="form-group">
								<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">SIP Frequency<span class="red">*</span></label>
								<div class="col-xs-12 col-sm-9">
									<div class="clearfix">
											<select name="sipFrequency" id="sipFrequency"  class="col-xs-12 col-sm-9" >
												
											</select>
	
									</div>
								</div>
							</div>
							<div class="space-2"></div>			
	           							
	           							
	           							
              			</div>
						
									
					</div><!-- modal body end -->
					
					<div class="modal-footer">
						    <button  class="btn btn-sm btn-primary" onClick="saveMFDetailsForm();">Save & Close</button>
                   			<button  class="btn btn-sm btn-primary" data-dismiss="modal" >Cancel</button> 
					</div>
					</form>
			</div>
		</div>
	</div>
</div>
</div>
<!-- Edit Transaction end here -->
	<section>
    	
    		<div class="main-content">
              <div class="main-contnet-inner">
                <div class="page-content">
                  <div class="page-header clearfix">
                     <h1 class="pull-left">
                    MF Transaction Details
                     </h1>
                     </div>
       		<div class="container-body">
       			<div class="col-md-12" >
       		   <div class="form-horizontal">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Client Name:</label>
				    <div class="col-sm-10" id="clientNameID">
				      
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">Folio Number:</label>
				    <div class="col-sm-10" id="folioNumberID">
				      
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">AMC:</label>
				    <div class="col-sm-10" id="amcID">
				      
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">Scheme Name:</label>
				    <div class="col-sm-10" id="productNameID">
				      
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">TXN Date:</label>
				    <div class="col-sm-10" id="txnDateID">
				      
				    </div>
				  </div>
				 </div>
				 </div>
	      		<div class="col-md-12" >
       				<table id="example" class="table table-striped table-bordered table-hover" >
						        <thead>
						            <tr>
						                <th>TXN ID</th>
						                <th>Client Name</th>
						                <th>Folio Number</th>
						                <th>AMC</th>
						                <th>Scheme Name</th>
						                <th>TXN Date</th>
						                <th>Client ID</th>
						                <!-- <th>PartyAsset ID</th> -->
						                <!-- <th>TxnType ID</th> -->
						                <th>TXN Type</th>
						                <th>TXN Amount</th>
						                <th>Unit</th>
						                <th>Purchase Nav</th>
						                <th>Action</th>
						            </tr>
						        </thead>
						 		<tbody></tbody>
						    </table>
	
				</div>
			</div>
		</div>  
			</div>
			</div>
		  	    	
    </section>             	
<jsp:include page="../common/footer.jsp" />
<script>

  
</script>
<script>
$( document ).ready(function() {
	
	var dataSet = ${MFTransactionDetailstData};
	var table=$('#example').DataTable( {
		"data": dataSet,
		 "columns": [
            { "data": "pmTxnId" },
            { "data": "clientName" },
            { "data": "folioNumber" },
            { "data": "amc" },
            { "data": "productName" },
            { "data": "startDate" },
           	{ "data": "clientId" },
          /*  { "data": "partyAssetId" },
            { "data": "txnTypeId" }, */
            { "data": "txnType" },
            { "data": "txnAmount" },
            { "data": "txtUnitQty" },
            { "data": "txtPriceNav" }
           
            
        ],
        "columnDefs": [
            {
            "targets": 11,
            "data": null,
            "defaultContent": "<div class='dropdown'><button class='btn btn-default dropdown-toggle' type='button' id='dropdownMenu1' data-toggle='dropdown' aria-expanded='true'>Action<span class='caret'></span></button><ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'><li role='presentation'><a role='menuitem' tabindex='-1' class='delete-transaction' href='#''><i class='fa fa-trash-o'></i> Delete Transaction</a></li><li role='presentation'><a role='menuitem' class='edit-transaction' tabindex='-1' href='#''><i class='fa fa-pencil'></i> Edit Transaction</a></li></ul></div>"
            },
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [ 6 ],
                "visible": false,
                "searchable": false
            }
        ],
       
        "aLengthMenu": [100,50,25,10],
        
        initComplete: function () {
            var api = this.api();
 
            api.columns().indexes().flatten().each( function ( i ) {
                
            	//client Name
            	var clientName = api.column(1);
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $("#clientNameID").empty() )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        clientName
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                clientName.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
                
              //folio Number
            	var folioNumber = api.column(2);
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $("#folioNumberID").empty() )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        folioNumber
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                folioNumber.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
                
              //AMC
            	var amc = api.column(3);
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $("#amcID").empty() )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        amc
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                amc.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
                
                //Scheme Name
            	var productName = api.column(4);
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $("#productNameID").empty() )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        productName
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                productName.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
                
              //TXN Date
            	var txnDate = api.column(5);
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $("#txnDateID").empty() )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
 
                        txnDate
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
 
                txnDate.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
            } );
        }
    });
	//end of datatables
	
	$('#example tbody').on( 'click', '.delete-transaction', function () {
        var data = table.row( $(this).parents('tr') ).data();
        
        $.each( data, function( index, value ) {
         if(index == 'pmTxnId'){
        	 deleteTransaction(value);    
         }
       
        });
       
    } );
	
	$('#example tbody').on( 'click', '.edit-transaction', function () {
        var data = table.row( $(this).parents('tr') ).data();
        
        $.each( data, function( index, value ) {
         if(index == 'pmTxnId'){
        	 editTransaction(value);    
         }
         if(index == 'clientId'){
        	 loadDataForAddEditFIForm(value);    
        	
         }	
        });
       
    } );
	
	

});



function editTransaction(id){
	
	 $("#edit").modal({
	    backdrop: 'static',
	    keyboard: false
	});  
	
	 $('#startDate,#sipStartDate,#sipEndDate').datepicker({
			changeMonth : true,
			changeYear : true,		
			yearRange : "-100:+100",
			dateFormat : "dd/mm/yy"

		});
	 
	 getselectTransactionDetails(id);
	 
	
}


 function getselectTransactionDetails(id){
	
	 $.ajax({
		 	type : "GET", 
			url :$('#contextPath').val()+"/folio/getSelectedCMFTransaction.htm?pmTxnId="+id,
			contentType : 'application/json',
			success : function(result) {
				$("#clientId,#productId,#productName,#txt").empty();
				$.each( result, function( index, value ) {
					var pmTxnId=value.pmTxnId;
					var clientId=value.clientId;
					var clientName=value.clientName;
					var folioNumber=value.folioNumber;
					var productName=value.productName;
					var amc=value.amc;
					var txnTypeId=value.txnTypeId;
					var txnType=value.txnType;
					var startDate=value.startDate;
					var productId=value.productId;
					var txtPriceNav=value.txtPriceNav;
					var txnAmount=value.txnAmount;
					var txtUnitQty=value.txtUnitQty;
					var amcId=value.amcId;
					var sipStartDate=value.sipStartDate;
					var sipFrequency=value.sipFrequency;
					var sipEndDate=value.sipEndDate;
					var sipAmount=value.sipAmount;
					var sipFrequencyId=value.sipFrequencyId;
					$('#pmTxnId').val(pmTxnId);
					$('#txnType').append('<option value="'+txnTypeId+'" selected="selected">'+txnType+'</option>');
					/* $('#clientName').append('<option value="'+clientId+'" selected="selected">'+clientName+'</option>'); */
					$('#amcId').val(amcId);
					$('#productId').append('<option value="'+productId+'">'+productName+'</option>');
					$("#txtPriceNav").val(txtPriceNav);
					$("#txnAmount").val(txnAmount);
					$("#txtUnitQty").val(txtUnitQty);
					$("#folioNumber").val(folioNumber);
					$("#startDate").val(startDate);
					$("#txtPriceNav").val(txtPriceNav);
					$("#txtUnitQty").val(txtUnitQty);
					$("#clientId").val(clientId);
					$("#productId").val(productId);
					$("#txt").val(txnTypeId);
					if(txnTypeId ==502020){
						
						$("#sipStartDate").val(sipStartDate);
						$("#sipEndDate").val(sipEndDate);
						$("#sipAmount").val(sipAmount);
						$("#sipFrequency").append('<option value='+sipFrequencyId+' selected="selected">'+sipFrequency+'</option>')
						hideShowSIPDetails(txnTypeId);
					}
				});
			}
	 });

} 

function deleteTransaction(id){
	bootbox.dialog({
		message: "<span class='bigger-110'>Do you want to delete transaction</span>",
		buttons: 			
		{
			
			"click" :
			{
				"label" : "YES!",
				"className" : "btn-sm btn-primary",
				"callback": function() {
					var pmTxnId=id;
					
					$.ajax({
						type : "POST", 
				    	url :$('#contextPath').val()+"/folio/deleteClientMFTransaction.htm?pmTxnId="+pmTxnId,
				    	contentType : 'application/json',
				    	success : function(result) {
				    		if(result.feedback=='success'){
								showAlertMessage1("Success", "MF Transaction deleted successfully"+'\n',"confirmation", reloadPage);
									 
							}else{
								showAlertMessage1("Error",data.error+'\n',"confirmation", reloadPage);
							}
				    	}
				    });
				}
			},
			"danger" :
			{
				"label" : "NO!",
				"className" : "btn-sm btn-primary",
				"callback": function() {
					//Example.show("uh oh, look out!");
				}
			}, 
		}
	});
	
}



function reloadPage(){
	location.reload();
}


function getAllAMCList(id){
	var productId=$("#amcId").val();
	
	$.ajax({			   				
		type: "GET",
  		url: $('#contextPath').val()+'/folio/getAMCList.htm?id='+id,
	 	ataType: 'json',
		contentType: 'application/json',
	 	success:function(result)
   		{ 
	 		$('#amc').empty();
	 				
			$(result).each(function(i, obj) {
				var id=obj.partyId;
				var name=obj.lName; 
				if(productId ==id){
					
					$('#amc').append('<option value="'+ id+'" selected="selected" >'+ name + '</option>');
				}else{
					$('#amc').append('<option value="'+ id+'">'+ name + '</option>');
				}
			});
	  	}
	}); 
}

function loadDataForAddEditFIForm(id){
	

	mapAssets= {};
	$.ajax({
	  	url: $('#contextPath').val()+"/folio/getClientMFDetailsForAddEditForm.htm?partyId="+id,		 
		method:"GET",
	  	contentType: 'application/json',
        dataType: 'json',
	  	success:function(result){
	  		
	  		if(!isObjectNull(result)) {
	  			var transactionTypes = result.transactionType;
	  			var investorNames = result.investorNames;
	  			
	  			if(!isObjectNull(transactionTypes)) {
	  				loadOptionsInSelectStatementForAddEditForm('#txnType', transactionTypes);
	  				
	  			}
	  			
	  			loadInvesterNameDropbox(investorNames);
	  			
	  			getAllAMCList(id);
	  		}
	  	
	  }
	});

}

function loadInvesterNameDropbox(result) {
	
	
	$("#clientName").empty(); 
	$(result).each(function(i,obj) {
		var name=obj.name;
		var id=obj.key;
		
			$("#clientName").append('<option value="'+id+'">'+name+'</option>');
		
	});
}

function loadOptionsInSelectStatementForAddEditForm(selectId, result) {
	var abc=$("#txt").val();
	
	$("#txnType").empty();
	$(result).each(function(i,obj) {
		var codeValue=obj.name;
		var codeValueId=obj.key;
		if( abc=codeValueId){		
			$("#txnType").append('<option value="'+codeValueId+'" selected="selected">'+codeValue+'</option>');
		}else{
			$("#txnType").append('<option value="'+codeValueId+'">'+codeValue+'</option>');
		}
	});
}


function searchAssets(e,id,searchType){
var event = window.event ? window.event : e;
//alert($('#mf-txn-type').val());
var amcid=0;
var searchStr='';
var clientPartyId=0;
 if(searchType=='mf'){
	 amcid = $('#amc').val();
	 searchStr='';
	 $('#productName').empty();
	 
}  else {
	 searchStr=$('#amcId').val().replace(/%20/g, " ");
}

 if($('#txnType').val()=='502014'){
	
	 clientPartyId=$('#clientId').val();
 } 
 
if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 || event.keyCode==13 )
	return;


window.quickSearchAssetRequest =$.ajax({
	  url: $('#contextPath').val()+"/folio/quickSearchAssets.htm?searchType="+searchType+"&mfAMCId="+amcid+"&searchString="+searchStr+"&clientPartyId="+clientPartyId,
	  method:"get",
	  success:function(result){
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
			  	$('#productId').empty();
			  	//$('#mf-asset-name').append('<option value="0">--Select Scheme--</option>');
			  	$.each( result.data, function( key, value ) {
			  	  
			  		$('#productId').append('<option value="'+key+'">'+value+'</option>');
			  	});
		  }
	  }
	});
}

function calculateTotalTxnAmount(id1,id2,id3,id4){
	var brkAmount=0;
	if(id4!='' && $('#'+id4).val()!=''){
		brkAmount=$('#'+id4).val();
	}
	if($('#'+id1).val()!='' && $('#'+id2).val()!=''){
			
			var amt=parseFloat(($('#'+id1).val()*$('#'+id2).val())+parseFloat(brkAmount)).toFixed(4);
				
				$('#'+id3).val(amt);
		}	
}

function calculateTotalUnits(id1,id2,id3,id4){
	
	var brkAmount=0;
	if(id4!='' && $('#'+id4).val()!=''){
		brkAmount=$('#'+id4).val();
	}
	if($('#'+id1).val()!='' && $('#'+id2).val()!=''){
			
			//var units =parseFloat($('#'+id1).val()/$('#'+id2).val()).toFixed(4);
			var units = parseFloat($('#'+id1).val()/$('#'+id2).val()).toFixed(4);
			//units = units.toFixed(4);
			$('#'+id3).val(units);
		}	
}

function saveMFDetailsForm() {
	if($('#txnType').val()=='502020'){
		var validator1=$('#addEditMFForm').validate({			
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
				folioNumber: {
					required: true
				},
				txnAmount:{
					required: true
				},
				txtUnitQty:{
					required:true
				},
				txtPriceNav:{
					required:true
				},
				startDate:{
					required:true
				},
				sipStartDate:{
					required:true,
				},
				sipEndDate:{
					required:true,
				},
				sipAmount:{
					required:true,
				},
				
				
			},
		
			messages: {
				
				folioNumber: "Please enter folio number",
				txnAmount:"Please enter transaction amount",
				txtUnitQty:"Please enter units ",
				txtPriceNav:"Please enter price nav",
				startDate:"Please enter transaction date",
				sipStartDate:"Please enter sip start date",
				sipAmount:"Please enter sip ammount",
				sipEndDate:"Please enter sip end date"
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
				
				if(validator1.form()){ // validation perform
				
					
					var mfPortfolioData = {};
					var pmTxnId=$('#pmTxnId').val();
					var txnType= $('#txnType').val();
					var txnDate = $('#startDate').val();
					var folioNo = $("#folioNumber").val();
					var productId = $('#productId').val();
					var mfQuantity = $('#txtUnitQty').val();
					var mfNav = $("#txtPriceNav").val();
					var totalTxAmount = $("#txnAmount").val();
					var sipStartDate = $("#sipStartDate").val();
					var sipEndDate = $("#sipEndDate").val();
					var sipAmount  = $("#sipAmount").val();
					var sipFrequency= $("#sipFrequency").val();
					var clientId=$("#clientName").val();
					//var productId=$('#mf-asset-name').val();
					
					var mfName =$("#productId option[value="+productId+"]").text();
					mfPortfolioData.pmTxnId = pmTxnId;
					mfPortfolioData.transactionType = txnType;
					mfPortfolioData.transactionDate = txnDate;
					mfPortfolioData.folioNumber = folioNo;
					mfPortfolioData.assetName = mfName;
					mfPortfolioData.quantity = mfQuantity;
					mfPortfolioData.price = mfNav;
					mfPortfolioData.totalTransactionAmount = totalTxAmount;
					mfPortfolioData.productId = productId;
					mfPortfolioData.clientName = clientId;
					
					if($('#txnType').val()=='502020'){
						mfPortfolioData.sipStartDate = sipStartDate;
						mfPortfolioData.sipEndDate = sipEndDate;
						mfPortfolioData.sipAmount = sipAmount;
						mfPortfolioData.sipFrequency = sipFrequency;
					}
					//alert(JSON.stringify(stockPortfolioData));
					
					selectedInvestorId=$('#clientName').val();
					$("#edit").hide();
					$.ajax({
						url: $('#contextPath').val()+"/folio/addEntryForMF.htm?clientId="+selectedInvestorId+"&pmTxnID="+pmTxnId,		 
						method:"POST",
					  	contentType: 'application/json',
				        dataType: 'json',
				        data:JSON.stringify(mfPortfolioData),
					  	success:function(result){
					  		showAlertMessage1("Success", "MF Transaction updated successfully"+'\n',"confirmation", reloadPage);
					  }
					});
					
				}
			},
			invalidHandler: function (form) {
				
			}
		});
	
	}else{
		var validator1=$('#addEditMFForm').validate({			
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
				folioNumber: {
					required: true
				},
				txnAmount:{
					required: true
				},
				txtUnitQty:{
					required:true
				},
				txtPriceNav:{
					required:true
				},startDate:{
					required:true
				}
				
			},
			
			messages: {
				
				folioNumber: "Please enter folio number",
				txnAmount:"Please enter transaction amount",
				txtUnitQty:"Please enter units ",
				txtPriceNav:"Please enter purchase nav",
				startDate:"Please enter transaction date"
				
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
				
				if(validator1.form()){ // validation perform
					
					
					var mfPortfolioData = {};
					var pmTxnId=$('#pmTxnId').val();
					var txnType= $('#txnType').val();
					var txnDate = $('#startDate').val();
					var folioNo = $("#folioNumber").val();
					var productId = $('#productId').val();
					var mfQuantity = $('#txtUnitQty').val();
					var mfNav = $("#txtPriceNav").val();
					var totalTxAmount = $("#txnAmount").val();
					var sipStartDate = $("#sipStartDate").val();
					var sipEndDate = $("#sipEndDate").val();
					var sipAmount  = $("#sipAmount").val();
					var sipFrequency= $("#sipFrequency").val();
					var clientId=$("#clientName").val();
					//var productId=$('#mf-asset-name').val();
					
					var mfName =$("#productId option[value="+productId+"]").text();
					mfPortfolioData.pmTxnId = pmTxnId;
					mfPortfolioData.transactionType = txnType;
					mfPortfolioData.transactionDate = txnDate;
					mfPortfolioData.folioNumber = folioNo;
					mfPortfolioData.assetName = mfName;
					mfPortfolioData.quantity = mfQuantity;
					mfPortfolioData.price = mfNav;
					mfPortfolioData.totalTransactionAmount = totalTxAmount;
					mfPortfolioData.productId = productId;
					mfPortfolioData.clientName = clientId;
					
					if($('#txnType').val()=='502020'){
						mfPortfolioData.sipStartDate = sipStartDate;
						mfPortfolioData.sipEndDate = sipEndDate;
						mfPortfolioData.sipAmount = sipAmount;
						mfPortfolioData.sipFrequency = sipFrequency;
					}
					//alert(JSON.stringify(stockPortfolioData));
					$("#edit").hide();
					selectedInvestorId=$('#clientName').val();

					$.ajax({
						url: $('#contextPath').val()+"/folio/addEntryForMF.htm?clientId="+selectedInvestorId+"&pmTxnID="+pmTxnId,		 
						method:"POST",
					  	contentType: 'application/json',
				        dataType: 'json',
				        data:JSON.stringify(mfPortfolioData),
					  	success:function(result){
					  		showAlertMessage1("Success", "MF Transaction updated successfully"+'\n',"confirmation", reloadPage);
					  }
					});
					
				}
			},
			invalidHandler: function (form) {
				
			}
		});
	}
	
}



function hideShowSIPDetails(mfTxnType){
	
	if(mfTxnType=="502020"){
		$('#sipDetails').show();
		$('#sipDetails input,#sipDetails select').attr('validate');
		getAllAMCList(0);
	}if(mfTxnType=="502014"){
		$('#sipDetails input,#sipDetails select').removeAttr('validate');
		$('#sipDetails').hide();
		getAllAMCList($('#clientId').val());
	}if(mfTxnType=="502012"){
		
		$('#sipDetails input,#sipDetails select').removeAttr('validate');
		$('#sipDetails').hide();
		getAllAMCList(0);
	}
}
</script>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
</body>
</html>