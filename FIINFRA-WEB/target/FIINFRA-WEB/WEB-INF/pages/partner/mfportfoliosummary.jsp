<!DOCTYPE html>
<html lang="en"><head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>MF Portfolio </title>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>   
   	<script>
   		google.load("visualization", "1", {packages:["corechart"]});
   		
   		function displayBarChart (chartType){
  
   			google.setOnLoadCallback(drawChart(chartType));
   			google.setOnLoadCallback(drawPieChart());
   		}
   		
 		function drawPieChart(){
	 
	  		$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>/folio/displayfoliopiechart.htm",
			dataType : "json",
			success : function(result) {
				//alert(JSON.stringify(result));
				   var innerArray=new Array();
				   innerArray.push('Products');
				   innerArray.push('Products per ProductType');
				   var outerArray=new Array();
				   outerArray.push(innerArray);
				   
				   var result1=result['ProductType'];
				  // alert(JSON.stringify(result1));
				   for(key in result1){
					   innerArray=new Array();
					   innerArray.push(key);
					   innerArray.push(parseInt(result1[key]));
					   outerArray.push(innerArray);   
					   
				   }
				   
				   var data = google.visualization.arrayToDataTable(outerArray);
				   var options = {
				          title: 'Products per ProductType',
				          hAxis: {title: 'ProductType', titleTextStyle: {color: 'red'}}
				        };
					
				        var chart = new google.visualization.PieChart(document.getElementById('prodType'));
				        chart.draw(data, options);

				        
				   var result2=result['SubCategory'];				  
				   innerArray=new Array();
				   innerArray.push('Products');
				   innerArray.push('Products per SubCategory');
				    outerArray=new Array();
				   outerArray.push(innerArray);
				   for(key in result2){
					   innerArray=new Array();
					   innerArray.push(key);
					   innerArray.push(parseInt(result2[key]));
					   outerArray.push(innerArray);   
					   
				   }
				   
				  
				        
			        data = google.visualization.arrayToDataTable(outerArray);
				    options = {
				          title: 'Products per SubCategory',
				          hAxis: {title: 'SubCategory', titleTextStyle: {color: 'red'}}
				        };
					
				        var chart = new google.visualization.PieChart(document.getElementById('subCat'));
				        chart.draw(data, options);  
				        $('#prodType').css('height','265px');
				   	 $('#subCat').css('height','265px');

				
		}
		});
	
 		}
 		
   		function drawChart(chartType) {
	   		var data=false;
	  		
	   		$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>/folio/partneraummonthwise.htm?chartType="+chartType,
			dataType : "json",
			success : function(result) {
				//alert(JSON.stringify(result));
				   var innerArray=new Array();
				   innerArray.push('Months');
				   innerArray.push(chartType);
				   var outerArray=new Array();
				   outerArray.push(innerArray);
				   
				   for(key in result){
					   innerArray=new Array();
					  // alert(key);
					//   alert(parseFloat(result[key]));
					   innerArray.push(key);
					   innerArray.push(parseFloat(result[key]));
					   outerArray.push(innerArray);
					   data=true;
					   
				   }
				  if(data){ 				  
				   
				   var data = google.visualization.arrayToDataTable(outerArray);
				   var options = {
				          title: chartType+' Monthwise',
				          hAxis: {title: 'Month', titleTextStyle: {color: 'red'}}
				        };
					
				        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
				        chart.draw(data, options);
				  }else{
					  document.getElementById('chart_div').innerHTML="Data not available";
				  }
				
			}
			});
		}

  
		//var getMfFolioSummary = function(){alert(1);
		function getMfFolioSummary(){
			$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>"+'/folio/mffoliosummary.htm',
			dataType : "json",
			success : function(result) {
				var tableId = $('#mfpracticesummarytable');
				for(key in result){
					var label = key;
					var value = result[label];
					var entry = "<tr><td>"+label+"</td><td>"+value+"</td></tr>";
					tableId.append(entry);
				}
			}
			});	
		} ;
	
		var getMfTop10ProductInfo = function(){
			$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>"+'/folio/portfolioproductinfo.htm',
			dataType : "json",
			success : function(result) {
				if(result!=null){
					appendToTable("#datafortop10products",result[0]);
					appendToTable("#datafortop10productsCat",result[1]);
					appendToTable("#datafortop10productsSubCat",result[2]);
				}
				
				function appendToTable(tableId , data){
					var table = $(tableId);
					for(var i =0 ; i < data.length ; i++){
						var productname = data[i].productCategory;
						var purchaseAmount = data[i].purchaseAmount;
						var redemptionAmt = data[i].redemptionAmount;
						var sip = data[i].sip;
						var netSales = data[i].netSales;
						
						var row = "<tr><td>"+productname+"</td>"+
						"<td>"+purchaseAmount+"</td>"+
						"<td>"+redemptionAmt+"</td>"+
						"<td>"+sip+"</td>"+
						"<td>"+""+"</td>"+
						"<td>"+netSales+"</td></tr>";
						table.append(row);
					}
					
				};
			}
			});	
		} ;
	

	</script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<section>
  <div class="page-header">
							<h1>
							MF Portfolio
								
							</h1>
						</div>
  
   <div class="tabbable">
  <ul class="nav nav-tabs" id="">
    <li class="dropdown active"> <a id="myportfolio" data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">My Portfolio <i class="ace-icon fa fa-caret-down bigger-110 width-auto"></i></a>
      <ul class="dropdown-menu dropdown-info" id="myportfolioMenu">
        <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/folio/foliopage.htm'">MF Portfolio</a> </li>
        <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/folio/openclientportfolio.htm'">Client Portfolio </a> </li>
        <li> <a id="MfTransactionDeatilslink" data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/folio/getClientMFTransactionDetails.htm?clientId=0&partyAssetId=0'">MF Transaction Details </a> </li>
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
    <div id="myportfolio" class="tab-pane fade in active clearfix">
    <div class="col-md-12" style="margin-bottom:10px;">
        			<div class="col-xs-12 col-sm-4 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									MF Practice Summary
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="mfpracticesummarytable" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Item</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
             
             		 <div class="col-xs-12 col-sm-8 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<select name="Saving" class="form-control" onChange="drawChart (this.value);">
		                            	<option>AUM</option>
		                                <option>Clients	</option>
		                                <option>Folios</option>
			                        </select>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<div id="chart_div" style="width: 700px; height: 300px;margin-top: 50px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					
        			<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Top 10 Products
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="datafortop10products" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Product Name</th>
												<th>Purchase</th>
												<th>Redemption</th>
												<th>SIP</th>
												<th>Others</th>
												<th>Net Sales</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
        			<div class="clearfix"></div>
    				
					<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Top 10 Product Category
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="datafortop10productsCat" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Product Category</th>
												<th>Purchase</th>
												<th>Redemption</th>
												<th>SIP</th>
												<th>Others</th>
												<th>Net Sales</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
      				<div class="clearfix"></div>
		      		
		       	  	<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Top 10 Product Sub-Category
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
									
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="datafortop10productsSubCat" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Product Sub-Category</th>
												<th>Purchase</th>
												<th>Redemption</th>
												<th>SIP</th>
												<th>Others</th>
												<th>Net Sales</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
       	  			<div class="clearfix"></div>
       	  			
       	  			<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Product Type
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table>
										<tr>
											<td>
												<div id="prodType" style="width: 525px; height: 250px;"></div>	
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Sub Category
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table>
										<tr>
											<td>
												<div id="subCat" style="width: 525px; height: 250px;"></div>	
											</td>
										</tr>
										
									</table>
								</div>
							</div>
						</div>
					</div>
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


 
  	<!--<div class="">
		<div class="portfoliostrip collapse navbar-collapse">
			<ul class="navbar-sub">
            	<li class="active dropdown"  >
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="myportfolio">My Portfolio <b class="caret"></b></a>
                    <ul class="dropdown-menu" id="myportfolioMenu">
						 <li style="margin: 0;" >
                            <a href="<%=request.getContextPath()%>/folio/foliopage.htm" style="color:#929292; margin:0;">MF Portfolio</a>
                        </li>
                        <li style="margin:0 ;">
                            <a href="<%=request.getContextPath() %>/folio/openclientportfolio.htm" style="color:#929292; margin:0;">Client Portfolio </a>
                        </li>
                    </ul>
                </li>
                <li><a href="<%=request.getContextPath()%>/et/getTxnSource.htm">File Uploads</a></li>
               	<li><a onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History</a></li>
                   
                <li><a href="<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm"> Reports</a></li>
                <li><a href="<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}"> Preprinted Form</a></li>
                <li id="autoAllocatedAssetsLink"><a href="<%=request.getContextPath()%>/et/assetAutoAllocation.htm">Auto Allocated Assets</a></li>
			
            </ul>
        </div>    
     </div>-->   
    
	
  		<!--<div class="">
    		
    
  	  		<div class="container-body clearfix">
				<div class="col-md-12" style="margin-bottom:10px;">
        			<div class="col-xs-12 col-sm-4 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									MF Practice Summary
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="mfpracticesummarytable" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Item</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
             
             		 <div class="col-xs-12 col-sm-8 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<select name="Saving" class="form-control" onChange="drawChart (this.value);">
		                            	<option>AUM</option>
		                                <option>Clients	</option>
		                                <option>Folios</option>
			                        </select>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<div id="chart_div" style="width: 700px; height: 300px;margin-top: 50px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					
        			<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Top 10 Products
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="datafortop10products" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Product Name</th>
												<th>Purchase</th>
												<th>Redemption</th>
												<th>SIP</th>
												<th>Others</th>
												<th>Net Sales</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
        			<div class="clearfix"></div>
    				
					<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Top 10 Product Category
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="datafortop10productsCat" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Product Category</th>
												<th>Purchase</th>
												<th>Redemption</th>
												<th>SIP</th>
												<th>Others</th>
												<th>Net Sales</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
      				<div class="clearfix"></div>
		      		
		       	  	<div class="col-xs-12 col-sm-12 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Top 10 Product Sub-Category
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
									
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table id="datafortop10productsSubCat" class="table table-striped table-bordered table-hover">
										<thead class="thin-border-bottom">
											<tr>
												<th>Product Sub-Category</th>
												<th>Purchase</th>
												<th>Redemption</th>
												<th>SIP</th>
												<th>Others</th>
												<th>Net Sales</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
       	  			<div class="clearfix"></div>
       	  			
       	  			<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Product Type
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table>
										<tr>
											<td>
												<div id="prodType" style="width: 525px; height: 250px;"></div>	
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-6 widget-container-col ui-sortable">
						<div class="widget-box widget-color-blue ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title bigger lighter">
									Sub Category
								</h5>
								<div class="widget-toolbar widget-toolbar-light no-border">
									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>
								</div>
							</div>
							<div class="widget-body">
								<div class="widget-main no-padding">
									<table>
										<tr>
											<td>
												<div id="subCat" style="width: 525px; height: 250px;"></div>	
											</td>
										</tr>
										
									</table>
								</div>
							</div>
						</div>
					</div>
        		</div>
     		</div>
		</div>-->
	</section>           	

	<jsp:include page="../common/footer.jsp" />
	
<script>
	$(document).ready(function(){
		
	//$('#folioLink').attr('class','active');
	//$('#PortFolio').addClass('active');
		getMfFolioSummary();
		getMfTop10ProductInfo();
		displayBarChart ('AUM');
		$("#myportfolio").click(function(){
			$("#myportfolioMenu").slideToggle();
		});	
	});
	
	
</script> 
</body>
</html>
