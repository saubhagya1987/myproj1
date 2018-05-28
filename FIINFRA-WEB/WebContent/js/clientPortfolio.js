function getPortFolioData(partyId){
	var url = $('#contextPath').val()+"/folio/getClientPortfolioSummary.htm?partyId="+partyId;
	$.ajax({
		type : "GET",
		url : url,
		dataType : "json",
		success : function(data){
			if(data !== null){
				
				initialiseGrid();
				
				if(!isObjectNull(data.clientportfolioaggregatesummary) && (data.clientportfolioaggregatesummary.length !== 0) ){
					var obj = data.clientportfolioaggregatesummary[0];
					updateAggregateSummaryUI(obj);
				};
				
				if(!isObjectNull(data.clientportfoliosummary) && (data.clientportfoliosummary.length !== 0)){
					detailSummary(data.clientportfoliosummary);
				}
				if(!isObjectNull(data.stocks) && (data.stocks.length !== 0)){
					loadStockDetails(data.stocks);
				}
				if(!isObjectNull(data.mf) && (data.mf.length !== 0)){
					loadMFDetails(data.mf);
				}
				if(!isObjectNull(data.ulip) && (data.ulip.length !== 0)){
					loadUlipDetails(data.ulip);
				}
				if(!isObjectNull(data.fd) && (data.fd.length !== 0)){
					loadFixedIncomeDetails(data.fd);
				}
				
				if(!isObjectNull(data.postOffice) && (data.postOffice.length !== 0)){
					//loadPostOfficeDetails(data.postOffice);
				}
				if(!isObjectNull(data.retirement) && (data.retirement.length !== 0)){
					//loadRetirenmentDetails(data.retirement);
				}
				
				if(!isObjectNull(data.gold) && (data.gold.length !== 0)){
					loadBullionDetails(data.gold);
				}
				if(!isObjectNull(data.property) && (data.property.length !== 0)){
					loadPropertyDetails(data.property);
				}
				if(!isObjectNull(data.partyId) && (data.partyId.length !== 0)){
					var obj = data.partyId[0];
					var clientId = obj.clientId;
					$('#clientId').val(clientId);
				}
				
			}				
		},
		error : function(xhr,status,error){
			showAlertMessage('System Error','<br/>System error occured!!!','error');
		}
	});
	
	
}



function updateAggregateSummaryUI(obj){
	var assests = obj.toatalAssets;
	var liabilities = obj.liablities;
	var netWorth = obj.netWorth;
	var bankAccount = obj.bankAcs;
	var dpaAccount = obj.dpAcs;	
	var folioName=obj.name+' '+ 'portfolio';
	var clientId=obj.clientId;
	$("#totalassetvalue").html(assests);
	$("#totalliabilitiesvalue").html(liabilities);
	$("#totalnetworthvalue").html(netWorth);
	$("#totalbankaccs").html(bankAccount);
	$("#totaldpaccs").html(dpaAccount);
	$("#folioName").html(folioName);
	$('#clientId').val(clientId);
}

function detailSummary(obj){
	var idArray = ['stocks','mutualfunds','ulip','fixedincome','postoffice','retirement','bullion','property'];      
	$.each( obj, function( j, data ){
		var ele = $('#'+idArray[j]).html('');
		var assetType = data.assetType;
		var investmentValue = data.investmentValue;
		var currentValue = data.currentValue;
		var netGainLoss  = data.netGainLoss;
		var cagr = data.cagr;
		var row = "<td style='width:22%;cursor: pointer'><i id='arrowicon"+j+"'    class='ace-icon fa fa-chevron-down'></i> "+assetType+"</td>"+"<td style='width:21%'>"+investmentValue+"</td>"+"<td style='width:16%'>"+currentValue+"</td>"+"<td style='width:27%'>"+netGainLoss+"</td>";
		ele.append(row);
	});
}

function loadStockDetails(obj){
	var ele = $('#stocks-details');
	$.each( obj, function( j, data ){
		var rowObj = {};
		var keys = ['investName','stockName','quantity','investmentValue','currentPrice','currentPriceDate','currentValue','netGainLoss','nominationStatus','mappedToGoal','goalAllocationPercent','partyAssetId'] ;
		rowObj.investName = data.investorName;
		rowObj.stockName = data.assetName;
		rowObj.schemeName = data.assetName;
		rowObj.quantity = data.quantity;
		rowObj.investmentValue=data.investmentValue;	
		rowObj.currentPrice = data.currentPrice;
		rowObj.currentPriceDate = data.currentPriceDate;
		rowObj.currentValue=data.currentValue;
		rowObj.netGainLoss  = data.netGainLoss;
		rowObj.nominationStatus = data.nominationStatus;
		rowObj.mappedToGoal=data.mappedToGoal;
		rowObj.goalAllocationPercent=data.goalAllocationPercent;
		rowObj.partyAssetId = data.partyAssetId;
		//rowObj.transactionDate = data.transactionDate;
		//rowObj.purchasePrice = data.purchasePrice;
		rowObj.investmentDate = data.investmentDate;
		rowObj.txnPriceNAV = data.txnPriceNAV;
		rowObj.txnAmount = data.txnAmount;
		rowObj.clientId = data.clientId;
		rowObj.productId = data.productId;
		ele.append(getRow(rowObj,keys,true,'stock'));
	});
}

function loadMFDetails(obj){
	var ele = $('#mutualfund-details');
	$.each( obj, function( j, data ){
		var rowObj = {};
		var keys = ['investName','schemeName','folioNo','quantity','investmentValue','currentPrice','currentPriceDate','netGainLoss','currentValue','nominationStatus','mappedToGoal','goalAllocationPercent','partyAssetId'] ;
		rowObj.investName = data.investorName;
		rowObj.schemeName = data.assetName;
		rowObj.folioNo=data.folioNo;
		rowObj.quantity = data.quantity;
		rowObj.investmentValue=data.investmentValue;	
		rowObj.currentPrice = data.currentPrice;
		rowObj.currentPriceDate = data.currentPriceDate;
		rowObj.netGainLoss  = data.netGainLoss;
		rowObj.currentValue=data.currentValue;
		rowObj.nominationStatus = data.nominationStatus;
		rowObj.mappedToGoal=data.mappedToGoal;	
		rowObj.goalAllocationPercent = data.goalAllocationPercent;
		rowObj.partyAssetId = data.partyAssetId;
		//rowObj.transactionDate = data.transactionDate;
		//rowObj.purchasePrice = data.purchasePrice;
		ele.append(getRow(rowObj,keys,true,'MF'));
	});
}

function loadUlipDetails(obj){
	var ele = $('#ulip-details');
	$.each( obj, function( j, data ){
		var keys = ['investName','schemeName','folioNo','quantity','investmentValue','currentPrice','currentPriceDate','netGainLoss','currentValue','nominationStatus','mappedToGoal','goalAllocationPercent','partyAssetId','transactionDate','purchasePrice'] ;
		var rowObj = {};
		rowObj.investName = data.investorName;
		rowObj.schemeName = data.assetName;
		rowObj.folioNo=data.folioNo;
		rowObj.quantity = data.quantity;
		rowObj.investmentValue=data.investmentValue;	
		rowObj.currentPrice = data.currentPrice;
		rowObj.currentPriceDate = data.currentPriceDate;
		rowObj.netGainLoss  = data.netGainLoss;
		rowObj.currentValue=data.currentValue;
		rowObj.nominationStatus = data.nominationStatus;
		rowObj.mappedToGoal=data.mappedToGoal;			
		rowObj.goalAllocationPercent = data.goalAllocationPercent;
		rowObj.partyAssetId = data.partyAssetId;
		rowObj.transactionDate = data.transactionDate;
		rowObj.purchasePrice = data.purchasePrice;
		rowObj.txnAmount = data.txnAmount;
		rowObj.clientId = data.clientId;
		rowObj.productId = data.productId;
		ele.append(getRow(rowObj,keys,true,'ULIP'));
	});
}

function loadFixedIncomeDetails(obj){
	var ele = $('#fixedincome-details');
	$.each( obj, function( j, data ){
		var keys = ['investName','schemeName','investmentValue','investmentDate','interest','invPeroid','maturityValue','maturityDate','currentValue','nominationStatus','mappedToGoal','goalAllocationPercent','partyAssetId'] ;
		var rowObj = {};
		rowObj.investName = data.investorName;
		rowObj.schemeName = data.assetName;
		rowObj.investmentValue=data.investmentValue;	
		rowObj.investmentDate = data.investmentDate ;
		rowObj.interest = data.interestRate;
		rowObj.invPeroid = data.investmentPeriod;
		rowObj.maturityValue = data.maturityValue;
		rowObj.maturityDate = data.maturityDate;
		rowObj.currentValue = data.currentValue;
		rowObj.nominationStatus = data.nominationStatus;
		rowObj.mappedToGoal = data.mappedToGoal;
		rowObj.goalAllocationPercent = data.goalAllocationPercent;
		rowObj.partyAssetId = data.partyAssetId;
		
		//rowObj.clientId = data.clientId;
		ele.append(getRow(rowObj,keys,true,'FI'));
	});
}

function loadBullionDetails(obj){
	var ele = $('#bullion-details');
	$.each( obj, function( j, data ){
		//var keys = ['schemeName','folioNo','quantity','investmentValue','currentPrice','currentPriceDate','netGainLoss','currentValue','nominationStatus','mappedToGoal','goalAllocationPercent','partyAssetId'] ;
		var keys = ['investName','schemeName','investmentValue','currentValue','nominationStatus','mappedToGoal','goalAllocationPercent','partyAssetId'] ;
		var rowObj = {};
		rowObj.investName = data.investorName;
		rowObj.schemeName = data.assetName;
		//rowObj.folioNo=data.folioNo;
		//rowObj.quantity = data.quantity;
		rowObj.investmentValue=data.investmentValue;	
		//rowObj.currentPrice = data.currentPrice;
		//rowObj.currentPriceDate = data.currentPriceDate;
		//rowObj.netGainLoss  = data.netGainLoss;
		rowObj.currentValue=data.currentValue;
		rowObj.nominationStatus = data.nominationStatus;
		rowObj.mappedToGoal=data.mappedToGoal;			
		rowObj.goalAllocationPercent = data.goalAllocationPercent;
		rowObj.partyAssetId = data.partyAssetId;
		rowObj.investmentDate = data.investmentDate;
		rowObj.clientId = data.clientId;
		ele.append(getRow(rowObj,keys,true,'GOLD'));
	});
}


function loadPropertyDetails(obj){
	var ele = $('#property-details');
	$.each( obj, function( j, data ){
		//var keys = ['assetName','propertyLocation','propertyArea','purchaseRate','investmentDate','investmentValue','currentPrice','currentValue','netGainLoss','partyAssetId'] ;
		var keys = ['schemeName','investmentDate','purchaseRate','currentValue','netGainLoss','nominationStatus','mappedToGoal','goalAllocationPercent','partyAssetId'] ;
		var rowObj = {};
		rowObj.schemeName = data.assetName;
		//rowObj.propertyLocation = data.propertyLocation;
		//rowObj.propertyArea = data.propertyArea;
		rowObj.investmentDate=data.investmentDate;
		rowObj.purchaseRate=data.investmentValue;	
		rowObj.investmentValue = data.investmentValue;
		//rowObj.currentPrice  = data.currentPrice;
		rowObj.currentValue=data.currentValue;
		rowObj.netGainLoss=data.netGainLoss;
		rowObj.nominationStatus = data.nominationStatus;
		rowObj.mappedToGoal=data.mappedToGoal;	
		rowObj.goalAllocationPercent = data.goalAllocationPercent;
		rowObj.partyAssetId = data.partyAssetId;
		rowObj.clientId = data.clientId;
		ele.append(getRow(rowObj,keys,true,'PROP'));
	});
}


function getRow(rowObject,keys,createActionColumn,type){
	
	var colStr ="";
	var rowStr = "";
	var partyAssetId = null;
	if(!isObjectNull(rowObject) && !isObjectNull(keys)){ 
		
		for (var i=0; i<keys.length;i++) {
			var  colVal = rowObject[keys[i]];
			var key = keys[i];
			if(key!=='partyAssetId'){
			  
			  switch(key){
			  case 'nominationStatus':
				  switch(colVal){
				  case "Yes":
					  colStr = colStr + "<td ><span class='label label-success arrowed-in arrowed-in-right'>"+colVal+"</span></td>" ;
					  break;
				  case "No":
					  colStr = colStr + "<td ><span class='label label-warning'>"+colVal+"</span></td>" ;
					  break;
				  }
				  break;
			  case 'mappedToGoal':
				  switch(colVal){
				  case "Yes":
					  colStr = colStr + "<td ><i class='ace-icon fa fa-check green bigger-200'></i></td>" ;
					  break;
				  case "No":
					  colStr = colStr + "<td > <i class='ace-icon fa fa-close red bigger-200'></i></td>" ;
					  break;
				  }
				  break;
			  default:
				  colStr = colStr + "<td>"+colVal + "</td>";
			  }
			}else{
				partyAssetId = rowObject[key];
			}
		}
		if(createActionColumn){
			rowStr = "<tr>"+colStr+""+createActionCol(rowObject,type)+"</tr>";
		}else{
			rowStr = "<tr>"+colStr+"</tr>";
		}
	}
	
	
	return rowStr;
}


function initialiseGrid(){
	var ele = $('#stocks-details');
	header='<thead class="thin-border-bottom"> <tr class="tablescroll_headn">'+
		'<th>Investor Name</th>'+
		'<th>Stock Name</th>'+
        '<th  >Quantity</th>'+
        '<th  >Investment Value</th>'+
        '<th  >Current Price</th>'+
        '<th  >Current Price Date</th>'+
        '<th>Current  Value</th>'+
        '<th >Net Gain/Loss[%]</th>'+
        '<th width="8%" >Nomination Status</th>'+
        '<th width="7%" >Mapped to Goal?</th>'+
        '<th width="8%" >Allocation[%]</th>'+
        //'<th width="16%" >Transaction Date</th>'+
        //'<th width="16%" >Purchase Price</th>'+
        '<th width="16%" >Action</th>'+
	 '</tr></thead>';
	 ele.html(header);
	 
	ele = $('#mutualfund-details');
		
	header='<thead class="thin-border-bottom"> <tr  class="tablescroll_headn">'+
			'<th>Investor Name</th>'+
			'<th  >Scheme Name </th>'+
	        '<th  >Folio No</th>'+
	        '<th >Units Held</th>'+
	        '<th >Investment Value</th>'+
	        '<th >NAV</th>'+
	        '<th >NAV Date</th>'+
	        '<th>Net Gain/Loss[%]</th>'+
	        '<th>Current Value</th>'+
	        '<th >Nomination Status</th>'+
	        '<th >Mapped to Goal?</th>'+
	        '<th width="8%" >Allocation[%]</th>'+
	        //'<th width="16%" >Transaction Date</th>'+
	        //'<th width="16%" >Purchase Price</th>'+
	        '<th width="16%" >Action</th>'+
			'</tr></thead>';
	 ele.html(header);
	 
	 ele = $('#ulip-details');
	 
	  header='<thead class="thin-border-bottom"> <tr class="tablescroll_headn">'+
	  	 '<th>Investor Name</th>'+   
	  	 '<th  >Scheme Name </th>'+
         '<th  >Policy No</th>'+
         '<th >Units Held</th>'+
         '<th >Investment Value</th>'+
         '<th >NAV</th>'+
         '<th >NAV Date</th>'+
         '<th>Net Gain/Loss[%]</th>'+
         '<th>Current Value</th>'+
         '<th width="8%" >Nomination Status</th>'+
         '<th width="6%" >Mapped to Goal?</th>'+
         '<th width="8%" >Allocation[%]</th>'+
         '<th width="16%" >Transaction Date</th>'+
         '<th width="16%" >Purchase Price</th>'+
         '<th width="16%" >Action</th>'+
		 '</tr></thead>';
		 ele.html(header);
	 
	 ele = $('#fixedincome-details');
	  header='<thead class="thin-border-bottom"><tr class="tablescroll_headn">'+
	    '<th>Investor Name</th>'+   
	  	'<th >Asset Name</th>'+
        ' <th >Invested  Amount	</th>'+
         '<th  >Investment  Date</th>'+
        ' <th >Interest[%]</th>'+
         '<th >Duration</th>'+
         '<th >Maturity Value</th>'+
        ' <th >Maturity Date</th>'+
         '<th>Current  Value</th>'+
         '<th width="8%" >Nomination Status</th>'+
         '<th width="7%" >Mapped to Goal?</th>'+
         '<th width="8%" >Allocation[%]</th>'+
         '<th width="17%" >Action</th>'+
			 ' </tr></thead>';
	 
	 ele.html(header);
	 
	 
	 
	 ele = $('#bullion-details');
	 header='<thead class="thin-border-bottom"><tr  class="tablescroll_headn">'+
	 	'<th>Investor Name</th>'+   
	 	'<th  >Asset Name </th>'+
         //'<th  >Folio No</th>'+
         //'<th >Units Held</th>'+
         '<th >Investment Value</th>'+
         //'<th >NAV</th>'+
         //'<th >NAV Date</th>'+
        // '<th>Net Gain/Loss[%]</th>'+
         '<th>Current Value</th>'+
         '<th>Nomination Status</th>'+
         '<th>Mapped to Goal?</th>'+
         '<th>Allocation[%]</th>'+
         '<th>Action</th>'+
		  '</tr></thead>';
	 ele.html(header);
	 
	 ele = $('#property-details');
	 header='<thead class="thin-border-bottom"><tr  class="tablescroll_headn">'+
        ' <th width="15%" >Property Name [Type]</th>'+
         //'<th width="9%"  >Location</th>'+
         //'<th width="6%" >Area</th>'+
         //'<th width="7%" >Rate</th>'+
         '<th width="9%"  >Purchase Date</th>'+
         '<th width="9%" >Purchase Price 	</th>'+
         //'<th width="6%" >Current Rate</th>'+
         '<th width="9%" >Current Value</th>'+
         '<th >Net Gain/Loss[%]</th>'+
         '<th>Nomination Status</th>'+
         '<th>Mapped to Goal?</th>'+
         '<th>Allocation[%]</th>'+
         '<th>Action</th>'+
         '</tr></thead>';
	 ele.html(header);
}


function createActionCol(rowObject,type){
	var clientId=$('#clientId').val();
	var col = "";
	var id= rowObject.partyAssetId;
	
	col = "<td  class='dropdown'><a class='dropdown-toggle' href='#' data-toggle='dropdown' style='text-decoration:none;'>Action"+
	"<span class='caret'></span></a>"+
	"<ul id="+type+" class='dropdown-menu dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close' style='width: 80px;margin-right:20px;'>"+
	'<li><a href="#" style="color:#333;" onclick="ViewTxt(\''+rowObject.partyAssetId +'\');"><i class="fa fa-eye"></i><span>View  Transactions</span></a></li>'+
	'<li><a href="#" onclick="MaptoGoal(\''+rowObject.partyAssetId +'\');"  style="color:#333;"><i class="fa icon-my-goals" ></i><span>Map to Goals</span></a></li>'+
	//'<li><a onClick="openFolioNomimatins(\''+rowObject.partyAssetId+'\',\''+rowObject.schemeName+'\',\''+clientId+'\');" style="color:#333;"><i class="fa fa-refresh"></i><span class="user">Update Nominations</span></a></li>'+
	'<li><a href="../folio/openfolioNominations.htm?partyAssetId='+rowObject.partyAssetId+'&assetName='+rowObject.schemeName+'&clientId='+clientId+'" style="color:#333;"><i class="fa fa-refresh"></i><span class="user"> Update Nominations</span></a></li>'+
    '<li id="edittranslink"></li>'+
     '<li id="deltranslink"></li>'+
     '<ul></td>';
	var coltype=type;
	if(coltype == 'stock'){
		col=col.replace('<li id="edittranslink"></li>','<li><a href="#" style="color:#333;" onclick="addstock(\''+'edit'+'\',\''+rowObject.partyAssetId +'\',\''+rowObject.stockName +'\',\''+rowObject.quantity+'\',\''+rowObject.currentPrice+'\',\''+rowObject.investmentDate+'\',\''+rowObject.txnPriceNAV+'\',\''+rowObject.txnAmount+'\',\''+rowObject.clientId+'\',\''+rowObject.productId+'\');"><i class="fa fa-pencil"></i><span class="user">Edit Transaction</span></a></li>');
	}
	if(coltype == 'MF'){
		col=col.replace('<li id="edittranslink"></li>','<li><a href="../folio/getClientMFTransactionDetails.htm?clientId='+clientId+'&partyAssetId='+id+'" style="color:#333;"><i class="fa fa-pencil"></i><span class="user"> Edit Transaction</span></a></li>');
	}
	if(coltype == 'ULIP'){
		col=col.replace('<li id="edittranslink"></li>','<li><a href="#" style="color:#333;" onclick="addUlip(\''+'edit'+'\',\''+rowObject.partyAssetId +'\',\''+rowObject.clientId+'\',\''+rowObject.schemeName+'\',\''+rowObject.folioNo+'\',\''+rowObject.transactionDate+'\',\''+rowObject.quantity+'\',\''+rowObject.currentPrice+'\',\''+rowObject.productId+'\',\''+rowObject.txnAmount+'\',\''+rowObject.purchasePrice+'\');"><i class="fa fa-pencil"></i><span class="user">Edit Transaction</span></a></li>');
	}
	if(coltype == 'FI'){
		col=col.replace('<li id="edittranslink"></li>','<li><a href="#" style="color:#333;" onclick="addFixIncome(\''+'edit'+'\',\''+rowObject.partyAssetId +'\',\''+rowObject.clientId+'\',\''+rowObject.schemeName+'\',\''+rowObject.investmentValue+'\',\''+rowObject.investmentDate+'\',\''+rowObject.maturityValue+'\',\''+rowObject.maturityDate+'\',\''+rowObject.interest+'\');"><i class="fa fa-pencil"></i><span class="user">Edit Transaction</span></a></li>');
	}
	if(coltype == 'GOLD'){
		col=col.replace('<li id="edittranslink"></li>','<li><a href="#" style="color:#333;" onclick="addGold(\''+'edit'+'\',\''+rowObject.partyAssetId +'\',\''+rowObject.clientId+'\',\''+rowObject.investmentValue+'\',\''+rowObject.investmentDate+'\',\''+rowObject.currentValue+'\');"><i class="fa fa-pencil"></i><span class="user">Edit Transaction</span></a></li>');
	}
	if(coltype == 'PROP'){
		col=col.replace('<li id="edittranslink"></li>','<li><a href="#" style="color:#333;" onclick="addProperty(\''+'edit'+'\',\''+rowObject.partyAssetId +'\',\''+rowObject.clientId+'\',\''+rowObject.assetName+'\',\''+rowObject.investmentDate+'\',\''+rowObject.investmentValue+'\',\''+rowObject.currentValue+'\');"><i class="fa fa-pencil"></i><span class="user">Edit Transaction</span></a></li>');
	}
	if(coltype != 'MF'){
		col=col.replace('<li id="deltranslink"></li>','<li><a href="#" style="color:#333;" onclick="deleteTransaction(\''+rowObject.partyAssetId +'\')";><i class="fa fa-trash-o"></i><span class="user">Delete Transaction</span></a></li>');
	}
	
	return col;
}

function openFolioNomimatins(partyAssetId , assetName , clientId ){
	$("#nominationsForm-partyAssetId").val(partyAssetId);
	$('#nominationsForm-assetName').val(assetName);
	$('#nominationsForm-clientId').val(clientId);
	document.getElementById("nominationsForm").submit();
	
}


function getAllAMCList(id){
	//alert(id);
	$.ajax({			   				
		 	type: "GET",
  		url: $('#contextPath').val()+'/folio/getAMCList.htm?id='+id,
	 	ataType: 'json',
		contentType: 'application/json',
	 	success:function(result)
   		{ 
	 		$('#mf_asset_amc').empty();
	 		$('#mf-asset-name').empty();
	 		$('#mf_asset_amc').append('<option value="0">--Select AMC--</option>');		
			$(result).each(function(i, obj) {
				var id=obj.partyId;
				var name=obj.lName; 
					$('#mf_asset_amc').append('<option value="'+ id+'">'+ name + '</option>');
			});
	  	}
	}); 
}


window.setViewTransactionDetails = function (partyAssetId){
	var url = $('#contextPath').val()+"/folio/viewTransactions.htm?partyAssetId="+partyAssetId;
	$.ajax({
		type : "GET",
		url : url,
		dataType : "json",
		success : function(data){
			if(!isObjectNull(data)){
				
				if(!isObjectNull(data.transactionSummary) && data.transactionSummary!==0){
					var transactionSummary = data.transactionSummary[0];
					$("#assetName").html(transactionSummary.assetName);
					$("#assetType").html(transactionSummary.assetType);
					$("#assetAmount").html(transactionSummary.assetAmount);
					$("#allocatedValue").html(transactionSummary.allocatedValue);
					$("#availableValue").html(transactionSummary.availableValue);
					$("#currentValue").html(transactionSummary.currentValue);
				}
				
				if(!isObjectNull( data.transactionTableSummary) &&  data.transactionTableSummary.length!==0){
					var transactionTableSummary = data.transactionTableSummary;
					var headers = ' <tr>'+
              			' <th width="17%" class="thead">Txn Date</th>'+
                          '<th width="20%" class="thead"> Txn Type</th>'+
                          '<th width="32%" class="thead"> Txn Amount (Rs.)</th>'+
                          '<th width="17%"  class="thead">Units/Qty</th>'+
                          '<th width="14%" class="thead"> Price</th>'
                        '</tr>';
                        $('#viewTransactionsTable').html(headers);
                        
					$.each( transactionTableSummary, function( i, obj ) {
						var rowObj = {};
						rowObj.txnDate = obj.txnDate;
						rowObj.txnType = obj.txnType;
						rowObj.txnAmount = obj.txnAmount;
						rowObj.units = obj.units;
						rowObj.txnPrice = obj.txnPrice
						var keys = ['txnDate','txnType','txnAmount','units','txnPrice'];
						$('#viewTransactionsTable').append(getRow(rowObj, keys,false)); 
						});
					
				}
			}
		},
		error : function(xhr,status,error){
			showAlertMessage('System Error','<br/>System error occured!!!','error');
		}
	});
}


window.setGoalMapping = function (partyAssetId){
	var url = $('#contextPath').val()+"/folio/goalMapping.htm?partyAssetId="+partyAssetId;
	$.ajax({
		type : "GET",
		//TODO to remove the harcoded party id
		url : url,
		dataType : "json",
		success : function(data){
			if(!isObjectNull(data)){
				
				if(!isObjectNull(data.transactionSummary) && data.transactionSummary!==0){
					var transactionSummary = data.transactionSummary[0];
					$("#assetNameGoal").html(transactionSummary.assetName);
					$("#allocatedValueGoal").html(transactionSummary.allocatedValue);
					$("#availableValueGoal").html(transactionSummary.availableValue);
					$("#currentValueGoal").html(transactionSummary.currentValue);
						
				}
				
				var headers='<tr>'+
                 '<th>Goal Type</th>'+
                 '<th>Goal Name</th>'+
                 '<th>Goal Value</th>'+
                 '<th>Goal Year</th>'+
                 '<th>Goal Current Amount </th>'+
                 '<th>Allocated Assets List</th>'+
                 '<th>Allocate this Asset? </th>'+
                 '<th>Allocation %</th>'+
                 '<th>Allocation %</th>'+
               '</tr> ';
				
               $('#goalMapping').html(headers);
				if(!isObjectNull( data.goalSummary) &&  data.goalSummary.length!==0){
					var goalSummary = data.goalSummary;
					    
					$.each( goalSummary, function( i, obj ) {
						var rowObj = {};
						rowObj.goalId = obj.goalId;
						rowObj.goalType = obj.goalType;
						rowObj.goalName = obj.goalName;
						rowObj.goalValue = obj.goalValue;
						rowObj.goalYear = obj.goalYear;
						rowObj.goalCurrentAmount = obj.goalCurrentAmount;
						rowObj.assetList = obj.assetList;
						rowObj.allocate = obj.allocate;
						rowObj.allocationPercent = obj.allocationPercent;
												
						$('#goalMapping').append('<tr><td>'+rowObj.goalType+'</td><td>'+rowObj.goalName+'</td><td>'+rowObj.goalValue+'</td><td>'+rowObj.goalYear+'</td><td>'+rowObj.goalCurrentAmount+'</td><td>'+rowObj.assetList+'</td><td><select class="form-control" id="select'+rowObj.goalId+'" onchange="enableOrDisableAllo('+rowObj.goalId+',this.value);"><option value="Yes">Yes</option><option value="No">No</option></select></td><td>'+rowObj.allocationPercent+'</td><td><input name="goalId" id="'+rowObj.goalId+'" value="'+rowObj.allocationPercent+'" onkeypress="return isNumber(event)"  type="text" class="form-control" title="" readonly="readonly"></td></tr>');
						
						//$('#select'+rowObj.goalId);
						$('#select'+rowObj.goalId+' option:contains(' + rowObj.allocate + ')').attr('selected', 'selected');
						});
					
				}									
				
			}
		},
		error : function(xhr,status,error){
			showAlertMessage('System Error','<br/>System error occured!!!','error');
		}
	});
}

function enableOrDisableAllo(id,val){
	
	if(val=='Yes'){
		
		document.getElementById(id).removeAttribute('readonly');
		
	}
	if(val=='No'){
		
		document.getElementById(id).setAttribute('readonly', 'readonly');
	}
	
}

function updateGoalAlloation(){
	var arr=[];
	var totalAllocation=0;
	$('input[name="goalId"]').each(function(i,element){
		var obj=new Object();
		obj.id=$(this).attr('Id');
		obj.goalAmountPv=$(this).val();
		totalAllocation=parseFloat(totalAllocation)+parseFloat(obj.goalAmountPv);
		arr.push(obj);
		
	});

	if(totalAllocation>100){
		
		 alert('Total allocation must not exceed 100%\n');
		return;
	}
	$.ajax({
		  url: $('#contextPath').val()+"/folio/updateGoalMapping.htm?partyAssetId="+$('#partyAssetId').val(),
  
		method:"POST",
		  contentType: 'application/json',
	        data:JSON.stringify(arr),
	        dataType: 'json',
		  success:function(result){
			  $('#MaptoGoal').modal('hide') ;
			  if(result.success!=null){
				  showAlertMessage1("Success",
							'<br/>' +  result.success,
							"confirmation", refreshPage1);
				  /*showAlertMessage1("Success",
						  result.success+'\n',
							"confirmation", doNothing);  
			  // popup('popUpAlertaddnote');
				$('.ZebraDialog_Button0').attr('href','javascript:refreshpage()'); */
			  }
	 		  else{
	 			 showAlertMessage1("Error",
	 					result.error+'\n',
							"confirmation", doNothing);  
	 			//popup('popUpAlertaddnote');
			
		  }
		  }
		});
}


function loadDataForAddEditMFForm(){
	mapAssets= {};
	$.ajax({
	  	url: $('#contextPath').val()+"/folio/getClientMFDetailsForAddEditForm.htm?partyId="+$('#clientId').val(),		 
		method:"GET",
	  	contentType: 'application/json',
        dataType: 'json',
	  	success:function(result){
	  		if(!isObjectNull(result)) {
	  			var transactionTypes = result.transactionType;
	  			var folioNo = result.folioNo;
	  			var sipFrequency = result.sipFrequency;
	  			var investorNames = result.investorNames;
	  			if(!isObjectNull(transactionTypes)) {
	  				loadOptionsInSelectStatementForAddEditForm('#mf-txn-type', transactionTypes);
	  				$('#mf-txn-type').val(502012);
	  				hideShowSIPDetails(502012);
	  			}
	  			
	  			if(!isObjectNull(folioNo)) {
	  				autoComplete('#mf-folio-no', folioNo);
	  			}
	  			
	  			if(!isObjectNull(sipFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#mf-sip-frequency', sipFrequency);
	  			}
	  			
	  			loadInvesterNameDropbox('#investorNameMF',investorNames,0);
	  		}
	  	
	  }
	});

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

function calculateUnitsForMF(){
	if($('#mf-sip-amount').val()!='' && $('#mf-nav').val()!=''){
		
		var units=parseFloat($('#mf-sip-amount').val()/$('#mf-nav').val()).toFixed(4);
			
			$('#mf-units').val(units);
	}
}
function populateSIPAmount(){
	$('#mf-sip-amount').val($('#mf-total-txn-amount').val());
}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    //if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    if ((evt.which != 46 || $(this).val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
    	evt.preventDefault();
    	return false;
    }
    return true;
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
	
	//alert(id1);alert(id2);alert(id3);alert(id4);
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

function loadDataForAddEditULIPForm(investorId){
	mapAssets= {};
	$.ajax({
	  	url: $('#contextPath').val()+"/folio/getClientULIPDetailsForAddEditForm.htm?partyId="+$('#clientId').val(),		 
		method:"GET",
	  	contentType: 'application/json',
        dataType: 'json',
	  	success:function(result){
	  		if(!isObjectNull(result)) {
	  			var transactionTypes = result.transactionType;
	  			var investorNames = result.investorNames;
	  			
	  			if(!isObjectNull(transactionTypes)) {
	  				loadOptionsInSelectStatementForAddEditForm('#ulip-txn-type', transactionTypes);
	  				$('#ulip-txn-type').val(502010);
	  			}	 
	  			loadInvesterNameDropbox('#investorNameULIP',investorNames,investorId);
	  		}
	  	
	  }
	});

}

function saveULIPDetailsForm(txnmode) {
	var ulipPortfolioData = {};
	var txnType= $('#ulip-txn-type').val();
	var txnDate = $('#ulip-txn-date').val();
	var schemeName = $('#ulip-scheme-name').val();
	var ulipQuantity = $('#ulip-units').val();
	var ulipPrice = $('#ulip-nav').val();
	var ulipTotalAmt = $('#ulip-total-txn-amount').val();
	//var productId=mapAssets[$('#ulip-scheme-name').val()];
	var productId;
	var narration=$('#ulip-narration').val();
	var investPartId=$('#investorNameULIP').val();
	var policyNo = $('#policyNo').val();
	var mode=txnmode;
	var partyAssetId=$('#ulippartyAssetId').val();
	
	ulipPortfolioData.transactionType = txnType;
	ulipPortfolioData.transactionDate = txnDate;
	ulipPortfolioData.assetName = schemeName;
	ulipPortfolioData.quantity = ulipQuantity;
	ulipPortfolioData.price = ulipPrice;
	ulipPortfolioData.totalTransactionAmount = ulipTotalAmt;
	//ulipPortfolioData.productId = productId;
	ulipPortfolioData.narration = narration;
	ulipPortfolioData.policyNo = policyNo;
	ulipPortfolioData.mode = mode;
	ulipPortfolioData.partyAssetId = partyAssetId;
	//alert(JSON.stringify(ulipPortfolioData));
	
	var message="";
	if(txnmode=='Add'){
		message="ULIP added successfully.";
		productId=mapAssets[$('#ulip-scheme-name').val()];
	}else{
		message="ULIP updated successfully.";
		productId=mapAssets[$('#ulip-scheme-name').val()];
		if(productId==undefined || productId=='undefined'){
			productId=$('#ulipproductId').val();
		}
	}
	
	ulipPortfolioData.productId = productId;
	
	var isValidated=true;
	isValidated=validateInputForm1('addEditULIPForm');
	
	if (!isValidated)
		return;
	
	if(productId==undefined || productId=='undefined'){
		addCssStyles('ulip-scheme-name', 'Please enter valid Scheme Name');
		return;
	}else{
		removeCssStyles('ulip-scheme-name');
	}

	var selectedInvestorId=0;
	if(investPartId!=''){
		selectedInvestorId=investPartId;
	} else{
		selectedInvestorId=$('#clientId').val();
	}
	
	
	$.ajax({
		url: $('#contextPath').val()+"/folio/addEntryForULIP.htm?clientId="+selectedInvestorId,		 
		method:"POST",
	  	contentType: 'application/json',
        dataType: 'json',
        data:JSON.stringify(ulipPortfolioData),
	  	success:function(result){
	  		$('#popUpaddULIP').modal('hide') ;
	  		if(result.statusCode==200){
	  			showAlertMessage1("Success",
						'<br/>' +  message,
						"confirmation", refreshPage1);
	  			/*showAlertMessage1("Success",
	  					result.message+'\n',
							"confirmation", doNothing); 
	  			$('.ZebraDialog_Button0').attr('href','javascript:refreshpage()');*/
	  		}else{
	  			showAlertMessage1("Error",
	  					result.message+'\n',
							"error", doNothing);
	  		}
	  }
	});
	
	
}



function loadDataForAddEditFIForm(investorId){
	mapAssets= {};
	$.ajax({
	  	url: $('#contextPath').val()+"/folio/getClientFIDetailsForAddEditForm.htm?partyId="+$('#clientId').val(),		 
		method:"GET",
	  	contentType: 'application/json',
        dataType: 'json',
	  	success:function(result){
	  		if(!isObjectNull(result)) {
	  			var transactionTypes = result.transactionType;
	  			var depositType = result.depositType;
	  			var installmentFrequency = result.installmentFrequency;
	  			var interestFrequency = result.interestFrequency;
	  			var interestPayoutFrequency = result.interestPayoutFrequency;
	  			var payoutOption = result.payoutOption;
	  			var investorNames = result.investorNames;
	  			if(!isObjectNull(transactionTypes)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-txn-type', transactionTypes);
	  				$('#fi-txn-type').val(502010);
	  			}
	  			
	  			if(!isObjectNull(depositType)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-deposit-type', depositType);
	  			}
	  			
	  			if(!isObjectNull(installmentFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-installment-frequency', installmentFrequency);
	  			}
	  			if(!isObjectNull(interestFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-interest-frequency', interestFrequency);
	  			}
	  			if(!isObjectNull(interestPayoutFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-interest-payout-frequency', interestPayoutFrequency);
	  			}
	  			if(!isObjectNull(payoutOption)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-payout-option', payoutOption);
	  			}
	  			
	  			loadInvesterNameDropbox('#investorNameFI',investorNames,investorId);
	  		}
	  	
	  }
	});

}

function loadDataForAddEditGold(investorId){
	mapAssets= {};
	$.ajax({
	  	url: $('#contextPath').val()+"/folio/getClientGoldDetailsForAddEditForm.htm?partyId="+$('#clientId').val(),		 
		method:"GET",
	  	contentType: 'application/json',
        dataType: 'json',
	  	success:function(result){
	  		if(!isObjectNull(result)) {
	  			var transactionTypes = result.transactionType;
	  			/*var depositType = result.depositType;
	  			var installmentFrequency = result.installmentFrequency;
	  			var interestFrequency = result.interestFrequency;
	  			var interestPayoutFrequency = result.interestPayoutFrequency;
	  			var payoutOption = result.payoutOption;*/
	  			var investorNames = result.investorNames;
	  			if(!isObjectNull(transactionTypes)) {
	  				loadOptionsInSelectStatementForAddEditForm('#gold-txn-type', transactionTypes);
	  				$('#gold-txn-type').val(502010);
	  			}
	  			
	  			/*if(!isObjectNull(depositType)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-deposit-type', depositType);
	  			}
	  			
	  			if(!isObjectNull(installmentFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-installment-frequency', installmentFrequency);
	  			}
	  			if(!isObjectNull(interestFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-interest-frequency', interestFrequency);
	  			}
	  			if(!isObjectNull(interestPayoutFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-interest-payout-frequency', interestPayoutFrequency);
	  			}
	  			if(!isObjectNull(payoutOption)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-payout-option', payoutOption);
	  			}*/
	  			
	  			loadInvesterNameDropbox('#investorNameGold',investorNames,investorId);
	  		}
	  	
	  }
	});

}

function loadDataForAddEditProperty(){
	mapAssets= {};
	$.ajax({
	  	url: $('#contextPath').val()+"/folio/getClientPropertyDetailsForAddEditForm.htm?partyId="+$('#clientId').val(),		 
		method:"GET",
	  	contentType: 'application/json',
        dataType: 'json',
	  	success:function(result){
	  		if(!isObjectNull(result)) {
	  			var transactionTypes = result.transactionType;
	  			/*var depositType = result.depositType;
	  			var installmentFrequency = result.installmentFrequency;
	  			var interestFrequency = result.interestFrequency;
	  			var interestPayoutFrequency = result.interestPayoutFrequency;
	  			var payoutOption = result.payoutOption;*/
	  			var investorNames = result.investorNames;
	  			if(!isObjectNull(transactionTypes)) {
	  				loadOptionsInSelectStatementForAddEditForm('#prop-txn-type', transactionTypes);
	  				$('#prop-txn-type').val(502010);
	  			}
	  			
	  			/*if(!isObjectNull(depositType)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-deposit-type', depositType);
	  			}
	  			
	  			if(!isObjectNull(installmentFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-installment-frequency', installmentFrequency);
	  			}
	  			if(!isObjectNull(interestFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-interest-frequency', interestFrequency);
	  			}
	  			if(!isObjectNull(interestPayoutFrequency)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-interest-payout-frequency', interestPayoutFrequency);
	  			}
	  			if(!isObjectNull(payoutOption)) {
	  				loadOptionsInSelectStatementForAddEditForm('#fi-payout-option', payoutOption);
	  			}*/
	  			
	  			loadInvesterNameDropbox('#investorNameProp',investorNames,0);
	  		}
	  	
	  }
	});

}


function saveFIDetailsForm(txnmode) {
	
	
	var fixedIncomePortfolioData = {};
	
	var txnType= $('#fi-txn-type').val();
	var txnDate = $('#fi-txn-date').val();
	var depositType = $('#fi-deposit-type').val();
	var manufacturer = $('#fi-manufacturer').val();
	var installmentAmount = $('#fi-installment-amount').val();
	var installmentFrequency = $('#fi-installment-frequency').val();
	var maturityAmount = $('#fi-maurity-amount').val();
	var maturityDate = $('#fi-maurity-date').val();
	var interestRate = $('#fi-interest-rate').val();
	var interestFrequency = $('#fi-interest-frequency').val();
	var interestPayoutFrequency= $('#fi-interest-payout-frequency').val();
	var payoutOption = $('#fi-payout-option').val();
	var narration = $('#fi-narration').val();
	var principalAmount = $('#fi-principal-amount').val();
	var faceValue = $('#fi-face-value').val();
	var certificateNo = $('#fi-certificate-no').val();
	var investPartId=$('#investorNameFI').val();
	var partyAssetId=$('#ProppartyAssetId').val();
	var mode=txnmode;
	
	
	fixedIncomePortfolioData.transactionType=txnType;
	fixedIncomePortfolioData.transactionDate=txnDate;
	fixedIncomePortfolioData.depositType=depositType;
	fixedIncomePortfolioData.assetName=manufacturer;
	fixedIncomePortfolioData.maturityAmount=maturityAmount;
	fixedIncomePortfolioData.maturityDate=maturityDate;
	fixedIncomePortfolioData.interestRate=interestRate;
	fixedIncomePortfolioData.interestFrequency=interestFrequency;
	fixedIncomePortfolioData.interestPayoutFrequency=interestPayoutFrequency;
	fixedIncomePortfolioData.payoutOption=payoutOption;
	fixedIncomePortfolioData.narration=narration;
	fixedIncomePortfolioData.partyAssetId = partyAssetId;
	fixedIncomePortfolioData.mode = mode;
	
		
	if ($('#fi-deposit-type').val()==48011){
		
		fixedIncomePortfolioData.totalTransactionAmount=principalAmount;
		$('#fi-face-value').removeAttr('validate');
		$('#fi-certificate-no').removeAttr('validate');
		$('#fi-installment-amount').removeAttr('validate');
		$('#fi-installment-frequency').removeAttr('validate');
		
		$('#fi-principal-amount').attr('validate');
		
	}else if ($('#fi-deposit-type').val()==48053){
		fixedIncomePortfolioData.totalTransactionAmount=installmentAmount;
		fixedIncomePortfolioData.installmentFrequency=installmentFrequency;
		
		$('#fi-face-value').removeAttr('validate');
		$('#fi-certificate-no').removeAttr('validate');
		$('#fi-principal-amount').removeAttr('validate');
		
		$('#fi-installment-frequency').attr('validate');
		$('#fi-installment-amount').attr('validate');
		
		
	}else{
		fixedIncomePortfolioData.certificateNo=certificateNo;
		fixedIncomePortfolioData.totalTransactionAmount=faceValue;
		
		$('#fi-installment-amount').removeAttr('validate');
		$('#fi-installment-frequency').removeAttr('validate');
		$('#fi-principal-amount').removeAttr('validate');
		
		$('#fi-face-value').attr('validate');
		$('#fi-certificate-no').attr('validate');
	}
	
	
	//alert(JSON.stringify(stockPortfolioData));
	
	var isValidated=true;
	isValidated=validateInputForm1('addEditFIForm');
	
	if (!isValidated)
		return;
	
// 	if(productId==undefined || productId=='undefined'){
// 		addCssStyles('stock-name', 'Please enter valid Stock Name');
// 		return;
// 	}else{
// 		removeCssStyles('stock-name');
// 	}
	
	var selectedInvestorId=0;
	if(investPartId!=''){
		selectedInvestorId=investPartId;
	} else{
		selectedInvestorId=$('#clientId').val();
	}
	
	var message="";
	if(txnmode=='Add'){
		message="Fixed income added successfully.";
	}else{
		message="Fixed income updated successfully.";
	}
	
	$.ajax({
		url: $('#contextPath').val()+"/folio/addEntryForFI.htm?clientId="+selectedInvestorId,		 
		method:"POST",
	  	contentType: 'application/json',
        dataType: 'json',
        data:JSON.stringify(fixedIncomePortfolioData),
	  	success:function(result){
	  		$('#popUpaddFI').modal('hide') ;
	  		if(result.statusCode==200){
	  			showAlertMessage1("Success",
						'<br/>' +  message,
						"confirmation", refreshPage1);
	  			/*showAlertMessage1("Success",
	  					result.message+'\n',
							"confirmation", doNothing);
	  			$('.ZebraDialog_Button0').attr('href','javascript:refreshpage()');*/
	  		}else{
	  			showAlertMessage1("Error",
	  					result.message+'\n',
							"error", doNothing);
	  		}
	  }
	});
	
	
}
function refreshpage(){
	$('.ZebraDialog_Button0').attr('href','javascript:logoutClick(0)');
	document.location.href= $('#contextPath').val()+"/folio/openclientportfolio.htm?partyId="+$('#clientId').val();
}


/**
 * @description function to save add/edit stock details
 */
function saveStockDetailsForm(txnmode) {
	var stockPortfolioData = {};
	var txnType= $('#txnTypeStocks').val();
	var txnDate = $('#stocks-txndate').val();
	var exchangeTypeStock = $('#exchangeTypeStocks').val();
	var stockName = $('#stock-name').val();
	var stockQuantity = $('#stocks-quantity').val();
	var stockPrice = $('#stocks-price').val();
	var stockBrokrageAmt = $('#stocks-brokrageamt').val();
	var stockTotalAmt = $('#stocks-totaltxnamt').val();
	var dmatAcc = $('#dmatAccounts').val();
	//var productId=mapAssets[$('#stock-name').val()];
	var productId;
	var investPartId=$('#investorName').val();
	var partyAssetId=$('#stpartyAssetId').val();
	var mode=txnmode;
	
	stockPortfolioData.transactionType = txnType;
	stockPortfolioData.transactionDate = txnDate;
	stockPortfolioData.exchange = exchangeTypeStock;
	stockPortfolioData.assetName = stockName;
	stockPortfolioData.quantity = stockQuantity;
	stockPortfolioData.price = stockPrice;
	stockPortfolioData.brokrageAmount = stockBrokrageAmt;
	stockPortfolioData.totalTransactionAmount = stockTotalAmt;
	stockPortfolioData.partyAssetId = partyAssetId;
	stockPortfolioData.mode = mode;
	
	if(dmatAcc!='')
	stockPortfolioData.dMatAccount = dmatAcc;
	
	//alert(JSON.stringify(stockPortfolioData));
	
	var message="";
	if(txnmode=='Add'){
		message="Stock added successfully.";
		productId=mapAssets[$('#stock-name').val()];
	}else{
		message="Stock updated successfully.";
		productId=mapAssets[$('#stock-name').val()];
		if(productId==undefined || productId=='undefined'){
			productId=$('#stproductId').val();
		}
	}
	
	stockPortfolioData.productId = productId;
	
	var isValidated=true;
	isValidated=validateInputForm1('addEditStockForm');
	
	if (!isValidated)
		return;
	
	if(productId==undefined || productId=='undefined'){
		addCssStyles('stock-name', 'Please enter valid Stock Name');
		return;
	}else{
		removeCssStyles('stock-name');
	}
	
	var selectedInvestorId=0;
	if(investPartId!=''){
		selectedInvestorId=investPartId;
	} else{
		selectedInvestorId=$('#clientId').val();
	}
	
	
	
	$.ajax({
		url: $('#contextPath').val()+"/folio/addEntryForStock.htm?clientId="+selectedInvestorId,		 
		method:"POST",
	  	contentType: 'application/json',
        dataType: 'json',
        data:JSON.stringify(stockPortfolioData),
	  	success:function(result){
	  		$('#popUpaddStock').modal('hide') ;
	  		
	  		if(result.success!=null){
	  			localStorage.setItem('actionName',
						window.location.pathname);
				showAlertMessage1("Success",
						'<br/>' +  message,
						"confirmation", refreshPage1); 
	  			/*showAlertMessage1("Success",
						  result.success+'\n',
							"confirmation", doNothing);
				  $('.ZebraDialog_Button0').attr('href','javascript:refreshpage()'); */
	  		}
	 		  else
	 			 showAlertMessage1("Error",
	 					result.error+'\n',
							"error", doNothing);  
		  		 
	  }
	});
	
}



/**
 * @description function to save add/edit mfform details
 */
function saveMFDetailsForm() {
	var mfPortfolioData = {};
	var txnType= $('#mf-txn-type').val();
	var txnDate = $('#mf-txn-date').val();
	var folioNo = $("#mf-folio-no").val();
	var productId = $('#mf-asset-name').val();
	var mfQuantity = $('#mf-units').val();
	var mfNav = $("#mf-nav").val();
	var totalTxAmount = $("#mf-total-txn-amount").val();
	var sipStartDate = $("#mf-sip-start-date").val();
	var sipEndDate = $("#mf-sip-end-date").val();
	var sipAmount  = $("#mf-sip-amount").val();
	var sipFrequency= $("#mf-sip-frequency").val();
	//var productId=$('#mf-asset-name').val();
	
	var mfName =$("#mf-asset-name option[value="+productId+"]").text();
	
	mfPortfolioData.transactionType = txnType;
	mfPortfolioData.transactionDate = txnDate;
	mfPortfolioData.folioNumber = folioNo;
	mfPortfolioData.assetName = mfName;
	mfPortfolioData.quantity = mfQuantity;
	mfPortfolioData.price = mfNav;
	mfPortfolioData.totalTransactionAmount = totalTxAmount;
	var investPartId=$('#investorNameMF').val();
	
	if($('#mf-txn-type').val()=='502020'){
		mfPortfolioData.sipStartDate = sipStartDate;
		mfPortfolioData.sipEndDate = sipEndDate;
		mfPortfolioData.sipAmount = sipAmount;
		mfPortfolioData.sipFrequency = sipFrequency;
	}
	mfPortfolioData.productId = productId;
	//alert(JSON.stringify(stockPortfolioData));
	
	var isValidated=true;
	isValidated=validateInputForm1('addEditMFForm');
	
	if (!isValidated)
		return;
	
	if(productId==undefined || productId=='undefined'){
		addCssStyles('stock-name', 'Please enter valid Fund Name');
		return;
	}else{
		removeCssStyles('stock-name');
	}
	
	var selectedInvestorId=0;
	if(investPartId!=''){
		selectedInvestorId=investPartId;
	} else{
		selectedInvestorId=$('#clientId').val();
	}
	
	$.ajax({
		url: $('#contextPath').val()+"/folio/addEntryForMF.htm?clientId="+selectedInvestorId+"&pmTxnID=0",		 
		method:"POST",
	  	contentType: 'application/json',
        dataType: 'json',
        data:JSON.stringify(mfPortfolioData),
	  	success:function(result){
	  		$('#popUpaddMF').modal('hide') ;
	  		
	  		if(result.statusCode==200){
	  			localStorage.setItem('actionName',
						window.location.pathname);
				showAlertMessage1("Success",
						'<br/>' +  result.message,
						"confirmation", refreshPage1);  
	  			/*showAlertMessage1("Success",
	  					result.message+'\n',
							"confirmation", doNothing); 
	  			$('.ZebraDialog_Button0').attr('href','javascript:refreshpage()');*/
	  		}else{
	  			showAlertMessage1("Error",
	  					result.message+'\n',
							"error", doNothing);
	  		}
	  }
	});
	
}


/**
 * @description function to save add/edit gold details
 */
function saveGoldDetailsForm(txnmode) {
	var mfPortfolioData = {};
	var txnType= $('#gold-txn-type').val();
	var txnDate = $('#gold-txn-date').val();
	//var propName = $('#prop-Name').val();
	//var totalTxAmount = $("#prop-principal-amount").val();
	var yearInvst = $("#gold-year-invst").val();
	var currentValue=$("#gold-current-val").val();
	var propDescp=$("#gold-descp").val();
	var partyAssetId=$('#GOLDpartyAssetId').val();
	var mode=txnmode;

	
	mfPortfolioData.transactionType = txnType;
	mfPortfolioData.transactionDate = txnDate;
	//mfPortfolioData.assetName = propName;
	mfPortfolioData.totalTransactionAmount = yearInvst;
	mfPortfolioData.price =currentValue;
	//mfPortfolioData.price = yearInvst;
	mfPortfolioData.narration = propDescp;
	mfPortfolioData.partyAssetId = partyAssetId;
	mfPortfolioData.mode = mode;
	
	var investPartId=$('#investorNameGold').val();
	
	
	
	var isValidated=true;
	isValidated=validateInputForm1('addEditGoldForm');
	
	if (!isValidated)
		return;
	
	
	
	var selectedInvestorId=0;
	if(investPartId!=''){
		selectedInvestorId=investPartId;
	} else{
		selectedInvestorId=$('#clientId').val();
	}
	
	var message="";
	if(txnmode=='Add'){
		message="Gold added successfully.";
	}else{
		message="Gold updated successfully.";
	}
	
	$.ajax({
		url: $('#contextPath').val()+"/folio/addEntryForGold.htm?clientId="+selectedInvestorId,		 
		method:"POST",
	  	contentType: 'application/json',
        dataType: 'json',
        data:JSON.stringify(mfPortfolioData),
	  	success:function(result){
	  		$('#popUpaddGold').modal('hide') ;
	  		
	  		if(result.statusCode==200){
	  			showAlertMessage1("Success",
						'<br/>' +  message,
						"confirmation", refreshPage1);
	  			/* showAlertMessage1("Success",
	  					result.message+'\n',
							"confirmation", doNothing); 
	  			$('.ZebraDialog_Button0').attr('href','javascript:refreshpage()');*/
	  		}else{
	  			showAlertMessage1("Error",
	  					result.message+'\n',
							"error", doNothing);
	  		}
	  }
	});
	
}


/**
 * @description function to save add/edit property details
 */
function savePropertyDetailsForm(txnmode) {
	var mfPortfolioData = {};
	var txnType= $('#prop-txn-type').val();
	var txnDate = $('#prop-txn-date').val();
	var propName = $('#prop-Name').val();
	var totalTxAmount = $("#prop-principal-amount").val();
	var currentValue=$("#prop-current-val").val();
	var propDescp=$("#prop-descp").val();
	var partyAssetId=$('#ProppartyAssetId').val();
	var mode=txnmode;

	
	mfPortfolioData.transactionType = txnType;
	mfPortfolioData.transactionDate = txnDate;
	mfPortfolioData.assetName = propName;
	mfPortfolioData.totalTransactionAmount = totalTxAmount;
	mfPortfolioData.price = currentValue;
	mfPortfolioData.narration = propDescp;
	mfPortfolioData.partyAssetId = partyAssetId;
	mfPortfolioData.mode = mode;
	
	var investPartId=$('#investorNameProp').val();
	
	
	
	var isValidated=true;
	isValidated=validateInputForm1('addEditPropForm');
	
	if (!isValidated)
		return;
	
	
	
	var selectedInvestorId=0;
	if(investPartId!=''){
		selectedInvestorId=investPartId;
	} else{
		selectedInvestorId=$('#clientId').val();
	}
	var message="";
	if(txnmode=='Add'){
		message="Property added successfully.";
	}else{
		message="Property updated successfully.";
	}
	$.ajax({
		url: $('#contextPath').val()+"/folio/addEntryForProperty.htm?clientId="+selectedInvestorId,		 
		method:"POST",
	  	contentType: 'application/json',
        dataType: 'json',
        data:JSON.stringify(mfPortfolioData),
	  	success:function(result){
	  		$('#popUpaddProperty').modal('hide') ;
	  		
	  		if(result.statusCode==200){
	  			showAlertMessage1("Success",
						'<br/>' +  message,
						"confirmation", refreshPage1);
	  			/* showAlertMessage1("Success",
	  					result.message+'\n',
							"confirmation", doNothing); 
	  			$('.ZebraDialog_Button0').attr('href','javascript:refreshpage()');*/
	  		}else{
	  			showAlertMessage1("Error",
	  					result.message+'\n',
							"error", doNothing);
	  		}
	  }
	});
	
}
//open pop up boxes
function addstock(mode,partyAssetId,stockname,quantity,price,investmentDate,txnPriceNAV,txnAmount,investorId,productId){
	
	$("#popUpaddStock").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});
	
	//$('#popUpaddStock').modal('show') ;
	
	if(mode=='edit'){
		$('#stock-name').val(stockname);
		$('#stpartyAssetId').val(partyAssetId);
		$('#stocks-quantity').val(quantity);
		//$('#stocks-price').val(price);
		$('#stocks-price').val(txnPriceNAV);
		$('#stocks-txndate').val(investmentDate);
		$('#stocks-totaltxnamt').val(txnAmount);
		$('#stproductId').val(productId);
		//stocks-brokrageamt
		//stocks-totaltxnamt
		//dmatAccounts
		$('#editbuttonsStock').show('fast');
		$('#addbuttonsStock').hide('slow');
		document.getElementById("stockTitle").innerHTML="Edit Stock";
	}
	if(mode=='Add'){
		$('#investorName').empty();
		$('#stock-name').val('');
		$('#stpartyAssetId').val(0);
		$('#stocks-quantity').val('');
		$('#stocks-price').val('');
		$('#stocks-brokrageamt').val('');
		$('#stocks-totaltxnamt').val('');
		$('#stocks-txndate').val('');
		$('#dmatAccounts').val('');
		$('#stproductId').val(0);
		
		$('#addbuttonsStock').show('fast');
		$('#editbuttonsStock').hide('slow');
		document.getElementById("stockTitle").innerHTML="Add Stock";
		
	}
	loadDataForAddEditStockForm(investorId);
}

function addMutualFunds(){

	loadDataForAddEditMFForm();//getAllAMCList(0);
	//$('#popUpaddMF').modal('show');
	$("#popUpaddMF").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});
}

function addUlip(mode,partyAssetId,investorId,schemename,policyNo,transactionDate,quantity,currentPrice,productId,txnAmount,purchasePrice){
	
	//$('#popUpaddULIP').modal('show');
	$("#popUpaddULIP").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});
	
	if(mode=='edit'){
		$('#ulippartyAssetId').val(partyAssetId);
		//$('#ulip-txn-type').val(0);
		$('#ulip-txn-date').val(transactionDate);
		$('#ulip-scheme-name').val(schemename);
		$('#policyNo').val(policyNo);
		$('#ulip-units').val(quantity);
		//$('#ulip-nav').val(currentPrice);
		$('#ulip-nav').val(purchasePrice);
		$('#ulipproductId').val(productId);
		$('#ulip-total-txn-amount').val(txnAmount);
		//$('#ulip-narration').val('');
		document.getElementById("ulipTitle").innerHTML="Edit ULIP";
		$('#editbuttonsULIP').show('fast');
		$('#addbuttonsULIP').hide('slow');
	}
	if(mode=='Add'){
		$('#investorNameULIP').empty();
		$('#ulippartyAssetId').val(0);
		
		//$('#ulip-txn-type').val(0);
		$('#ulip-txn-date').val('');
		$('#ulip-scheme-name').val('');
		$('#policyNo').val('');
		$('#ulip-units').val('');
		$('#ulip-nav').val('');
		$('#ulip-total-txn-amount').val('');
		$('#ulip-narration').val('');
		$('#ulipproductId').val(0);
		
		document.getElementById("ulipTitle").innerHTML="Add ULIP";
		$('#addbuttonsULIP').show('fast');
		$('#editbuttonsULIP').hide('slow');
	}
	loadDataForAddEditULIPForm(investorId);
}


function addFixIncome(mode,partyAssetId,investorId,assetName,investmentValue,investmentDate,maturityValue,maturityDate,interestRate){
	if(mode=='edit'){
		$('#FIpartyAssetId').val(partyAssetId);
		//$('#fi-txn-type').val(0);
		$('#fi-txn-date').val(investmentDate);
		//$('#fi-deposit-type').val(0);
		$('#fi-manufacturer').val(assetName);
		$('#fi-principal-amount').val(investmentValue);
		//$('#fi-installment-amount').val(0);
		//$('#fi-installment-frequency').val(0);
		$('#fi-maurity-amount').val(maturityValue);
		$('#fi-maurity-date').val(maturityDate);
		$('#fi-interest-rate').val(interestRate);
		//$('#fi-interest-frequency').val(0);
		//$('#fi-interest-payout-frequency').val(0);
		//$('#fi-payout-option').val(0);
		//$('#fi-face-value').val(0);
		//$('#fi-certificate-no').val(0);
		//$('#fi-narration').val(0);
		document.getElementById("fiTitle").innerHTML="Edit Fixed Income";
		$('#editbuttonsFI').show('fast');
		$('#addbuttonsFI').hide('slow');
	}
	if(mode=='Add'){
		
		$('#FIpartyAssetId').val(0);
		$('#investorNameFI').empty();
		
		$('#fi-txn-type').val(0);
		$('#fi-txn-date').val('');
		//$('#fi-deposit-type').val(0);
		$('#fi-manufacturer').val('');
		$('#fi-principal-amount').val('');
		//$('#fi-installment-amount').val(0);
		//$('#fi-installment-frequency').val(0);
		$('#fi-maurity-amount').val('');
		$('#fi-maurity-date').val('');
		$('#fi-interest-rate').val('');
		//$('#fi-interest-frequency').val(0);
		//$('#fi-interest-payout-frequency').val(0);
		//$('#fi-payout-option').val(0);
		//$('#fi-face-value').val(0);
		//$('#fi-certificate-no').val(0);
		$('#fi-narration').val('');
		document.getElementById("fiTitle").innerHTML="Add Fixed Income";
		$('#addbuttonsFI').show('fast');
		$('#editbuttonsFI').hide('slow');
	}
	loadDataForAddEditFIForm(investorId);
	//$('#popUpaddFI').modal('show');
	$("#popUpaddFI").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});

}

function addGold(mode,partyAssetId,investorId,investmentValue,investmentDate,currentValue){
	if(mode=='edit'){
		$('#GOLDpartyAssetId').val(partyAssetId);
		//$('#gold-txn-type').val('');
		$('#gold-txn-date').val(investmentDate);
		$('#gold-current-val').val(currentValue); 
		$('#gold-year-invst').val(investmentValue);
		//$('#gold-descp').val('');
		document.getElementById("goldTitle").innerHTML="Edit Gold";
		$('#editbuttonsGOLD').show('fast');
		$('#addbuttonsGOLD').hide('slow');
	}
	if(mode=='Add'){
		$('#GOLDpartyAssetId').val(0);
		$('#investorNameGold').empty();
		$('#gold-txn-type').val(0);
		$('#gold-txn-date').val('');
		$('#gold-current-val').val('');
		$('#gold-year-invst').val('');
		$('#gold-descp').val('');
		document.getElementById("goldTitle").innerHTML="Add Gold";
		$('#addbuttonsGOLD').show('fast');
		$('#editbuttonsGOLD').hide('slow');
	}
	loadDataForAddEditGold(investorId);
	//$('#popUpaddGold').modal('show');
	$("#popUpaddGold").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});

}

function addProperty(mode,partyAssetId,investorId,schemename,purchaseDate,investmentValue,currentValue){
	if(mode=='edit'){
		$('#ProppartyAssetId').val(partyAssetId);
		//$('#prop-txn-type').val(0);
		$('#prop-txn-date').val(purchaseDate);
		$('#prop-Name').val(schemename);
		$('#prop-principal-amount').val(investmentValue);
		$('#prop-current-val').val(currentValue);
		//$('#prop-descp').val(0);
		document.getElementById("propTitle").innerHTML="Edit Property";
		$('#editbuttonsProp').show('fast');
		$('#addbuttonsProp').hide('slow');
	}
	if(mode=='Add'){
		$('#ProppartyAssetId').val(0);
		$('#investorNameProp').empty();
		//$('#prop-txn-type').val(0);
		$('#prop-txn-date').val('');
		$('#prop-Name').val('');
		$('#prop-principal-amount').val('');
		$('#prop-current-val').val('');
		$('#prop-descp').val('');
		
		document.getElementById("propTitle").innerHTML="Add Property";
		$('#addbuttonsProp').show('fast');
		$('#editbuttonsProp').hide('slow');
	}
	loadDataForAddEditProperty(investorId);
	//$('#popUpaddProperty').modal('show');
	$("#popUpaddProperty").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});

}

function ViewTxt(partyAssetId){
	setViewTransactionDetails(partyAssetId);
	//$('#ViewTxt').modal('show');
	$("#ViewTxt").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});
}


function MaptoGoal(partyAssetId){
	$('#partyAssetId').val(partyAssetId);
	setGoalMapping(partyAssetId);
	//$('#MaptoGoal').modal('show');
	$("#MaptoGoal").modal({
	    backdrop: 'static',
	    keyboard: false,
	    show:true
	});
}


function getAllAMCList(id){
	//alert(id);
	$.ajax({			   				
		 	type: "GET",
  		url: $('#contextPath').val()+'/folio/getAMCList.htm?id='+id,
	 	ataType: 'json',
		contentType: 'application/json',
	 	success:function(result)
   		{ 
	 		$('#mf_asset_amc').empty();
	 		$('#mf-asset-name').empty();
	 		$('#mf_asset_amc').append('<option value="0">--Select AMC--</option>');		
			$(result).each(function(i, obj) {
				var id=obj.partyId;
				var name=obj.lName; 
				
					$('#mf_asset_amc').append('<option value="'+ id+'">'+ name + '</option>');
					
											
				});
				
				
   		  	}
   	
   		}); 
}


function deleteTransaction(partyAssetId){
	
	if (partyAssetId != 0) {
		var message = "";
		if (partyAssetId != 0) {
			message = "Do you want to delete this Transaction?";
		} else {
			message = "Do you want to delete these Transaction?";
		}
		showAlertMessage1("Message", "<br/>" + message, "question",
				doNothing1);
		$('.ZebraDialog_Button1').attr('href','javascript:deleteSelectedTrans('+partyAssetId+')');
		$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
		/*bootbox.dialog({
			message: "<span class='bigger-110'>"+message+"</span>",
			buttons: 			
			{
				
			
				"click" :
				{
					"label" : "YES!",
					"className" : "btn-xs btn-primary",
					"callback": function() {
						deleteSelectedTrans(partyAssetId)
						//Example.show("Primary button");
					}
				},
				"danger" :
				{
					"label" : "NO!",
					"className" : "btn-xs btn-danger"
					
				}
			}
		});*/

	}
}


function deleteSelectedTrans(partyAssetId){
	
	var stockPortfolioData = {};
	
	var mode='Delete';
	
	stockPortfolioData.partyAssetId = partyAssetId;
	stockPortfolioData.mode = mode;
	
	var message = "";
	message = "Transaction successfully deleted.";
	setTimeout(function() {
		$.ajax({
			
			url : $('#contextPath').val()+"/folio/deleteClientTransaction.htm?clientId=0",		 
			method:"POST",
		  	contentType: 'application/json',
	        dataType: 'json',
	        data:JSON.stringify(stockPortfolioData),
			success : function(result) {
				if(result.feedback!=null){
					localStorage.setItem('actionName',
							window.location.pathname);
					showAlertMessage1("Success",
							'<br/>' + message,
							"confirmation", refreshPage1);
					/*bootbox.dialog({
						message: "<span class='bigger-110'>"+message+"</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-xs btn-primary",
								"callback": function() {
									location.reload();
									//Example.show("Primary button");
								}
							}
						}
					});*/
					
					
				}else{
					showAlertMessage1("Error",
							"The connection to the server has been lost. Please try again later.",
							"error", doNothing);
					/*bootbox.dialog({
						message: "<span class='bigger-110'>The connection to the server has been lost. Please try again later.</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-xs btn-primary",
								"callback": function() {
									location.reload();
									//Example.show("Primary button");
								}
							}
						}
					});*/
					
				}
				
			}
		});
	}, 500);
}

function refreshPage1() {
	location.reload(true);
}