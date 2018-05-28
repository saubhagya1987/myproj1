<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Bulk Upload Txn</title>
<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
-->



<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
-->


<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script type="text/javascript">
var hidePopupTimeoutId;
$(".choose1").live("mouseover", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".popupnewping1").show();
});


$(".choose1").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".popupnewping1").hide();
    },500);
});

$(".popupnewping1").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".popupnewping1").live("mouseleave", function() {
    $(".popupnewping1").hide();
});



function listFileNames(fileComponentId , fileNameLisitingComponent){
	var fileComp = document.getElementById(fileComponentId);
	var fileNameListing = $("#"+fileNameLisitingComponent);
	
	fileNameListing.empty();
	
	for(var i=0 ; i < fileComp.files.length &&  fileComp.files.length!=1 ; i++){
		var file = fileComp.files[i];
		var liComp = "<li>"+ file.name +"</li>";
		fileNameListing.append(liComp);
	}
	
};
/*
function deleteFromFileComponent(index){
	var fileComp = document.getElementById("fileuploadcomponent");
	var fileNameListing =   $("#filenames");
	var newFiles =[] ;
	 //fileComp.files.splice(index,1);
	 for(var i=0 ; i < fileComp.files.length ; i++){
		 if(i!=index){
			 newFiles.push(fileComp.files[i]);
		 }
	 }
	 fileComp.files = newFiles;
	 fileNameListing.empty();
		
	for(var i=0 ; i < fileComp.files.length &&  fileComp.files.length!=1 ; i++){
		var file = fileComp.files[i];
		var liComp = "<li>"+ file.name + " &nbsp;<a onclick='deleteFromFileComponent(\""+i+"\")'></a></li>";
		fileNameListing.append(liComp);
	}
	
	
};`
*/

</script>
</head>
<body>
	<!--css popup window start 1-->
	F
	<jsp:include page="../common/header.jsp" />


	<!-- Center part start -->
	<section>




		<div class="container">
			<div class="container-head">

				<div class="col-md-12" style="text-align: right;">
					<span style="float: left;">Bulk Upload Txn</span>
				</div>
			</div>

			<div class="container-body " style="padding: 5px;"></div>
			<div class="container-body">
				</br>
				<!-- center -->

				<div class="col-md-3 sidebar-offcanvas" role="navigation"
					style="padding-left: 10px;">
					<div class="list-group">
						<a class="list-group-item active" href="#">Bulk Upload Txn</a> <a
							href="#" class="list-group-item"><strong>New Upload
						</strong></a> <a href="uploadhistory.html" class="list-group-item">Upload
							History</a>
					</div>

				</div>
				<div class="col-md-9" style="padding-left: 10px;">

					<!-- center -->

					<div class="list-group">
						<a class="list-group-item active" href="#">New Upload </a>
						
						<form method="POST"
							action="<%=request.getContextPath()%>/et/saveBulkUpload.htm"
							enctype="multipart/form-data">
							<div class="list-group-item">
								<div class="row">
									<!-- 1 START-->
									<div class="col-md-4 searchpadding padding_top">Transaction
										Source</div>
									<div class="col-md-8 searchpadding padding_top">
										<select name="txnSource" class="form-control">
											<option>Mutual Fund RTA-CAMS</option>
											<option>Mutual Fund RTA-Karvy</option>
											<option>Mutual Fund RTA-Templeton</option>
											<option>Mutual Fund RTA-Sundaram</option>
											<option>NJ</option>
											<option>Prudent</option>

										</select>
									</div>
									<!-- 1 END-->

									<!-- 2 START-->
									<div class="row">
										<div class="col-md-4 searchpadding padding_top">File
											Type</div>
										<div class="col-md-8 searchpadding padding_top">
											<select name="fileType" class="form-control">
												<option>Client</option>
												<option>Transaction</option>
												<option>Units Recon</option>
												<option>Trial Commission</option>



											</select>
										</div>
									</div>
									<!-- 2 eND-->
									<!-- 3 START-->
									<div class="row">
										<div class="col-md-4 searchpadding padding_top">Browse</div>
										<div class="col-md-4 searchpadding padding_top">
											<input class="btn dbtn" id="fileuploadcomponent" type="file"
												value="Choose File" name="files" multiple
												onchange="listFileNames('fileuploadcomponent','filenames');">
										</div>
										<div class="col-md-4">
											<ul id="filenames"
												style="list-style: none; padding-top: 10px"></ul>
										</div>
									</div>
									<!-- 2 eND-->
									<div class="col-md-4 searchpadding padding_top">
										<br />
										<br />
									</div>
									<div class="col-md-8 searchpadding padding_top">
										<input class="btn dbtn" type="submit" value="Upload"
											name="Upload" data-toggle="tooltip" data-placement="left"
											title="File XXXXXX.xls for MF RTA CAMS – Folio upload has been uploaded successfully and queued for processing. You will receive an email notification on completion of the request. Visit Upload History section to view details of the upload.">

										<input class="btn dbtn" type="button" value="Cancel"
											name="Cancel">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Center part End -->

		<footer>
			<div class="row">
				<div class="bottomstrip">
					<div class="container">
						<div id="powerby">
							<img src="<%=request.getContextPath() %>/images/finfra_logo.png">
						</div>
						<div class="copyright">
							�2013 Freedom Wealth Solutions Pvt. Ltd. All Rights Reserved. |
							<a href="#" onClick=>Terms Of Use </a>| <a href="#">Privacy
								Policy</a>
						</div>
					</div>

				</div>
			</div>
			<!-- END login-form -->
			</div>
			</div>
		</footer>
</body>
</html>