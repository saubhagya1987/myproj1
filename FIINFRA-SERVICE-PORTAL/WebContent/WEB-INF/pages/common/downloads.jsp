<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Downloads -Welcome Kit </title>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

</head>
<body>
<jsp:include page="header.jsp" />
 

 <!-- Center part start -->
         <div class="page-header">
            <h1> Downloads </h1>
          </div>
        <div class="container-head">
          <div class="col-md-12" style="text-align: right;">
            			<!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                <!--   <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Downloads </span> </div> -->
                  <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"><!-- <span style=" margin-top:0px;" class="searchicon"  alt="Search" title="Search"></span>--> </a> </div>
                  	  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
               <div class="accordion-inner ">
                      <div >
                        <!--1 search start -->
                      
                        </div>
                    </div>
                    <!-- accordion-inner END -->
                    
                    <div class="box_button pull-left">
                      <button type="button" id="updatefilterlist" class="btn">Update Filter List</button><br><br>
                    </div>
                    <br>
                     <table class="filterDet_table serchboxnew" width="100%" cellspacing="5" cellpadding="5">
                      <thead>
                      	<tr>
                        	<td colspan="2" style="background-color:#646363; color:#fff; font-size:12px; text-align:left;">Filters</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr valign="top">
                          <th width="100">Favourites :</th>
                          <td><div class="alertn pull-left">Delivery Channel
                               
                            <input class="closen" data-dismiss="alert" value="×" type="button">
                          </div></td>
                        </tr>
                        
                        <tr valign="top">
                          <th width="100">Matching Tag:</th>
                          <td><div id="excFilterDet" class="pull-left">
                              <div class="alertn pull-left"> Investment
                                
                                <input class="closen" data-dismiss="alert" value="×" type="button">
                              </div>
                            <div class="alertn pull-left"> Child education
                               
                              <input class="closen" data-dismiss="alert" value="×" type="button">
                            </div>
                            <div class="alertn pull-left">Education
                                
                                  <input class="closen" data-dismiss="alert" value="×" type="button">
                              </div>
                          </div></td>
                        </tr>
                        <tr valign="top">
                          <th width="100"> All</th>
                          <td><div  class="pull-left">
                              <div class="alertn pull-left">Women
                                 
                                <input class="closen" data-dismiss="alert" value="×" type="button">
                              </div><div class="alertn pull-left">Child
                                 
                                <input class="closen" data-dismiss="alert" value="×" type="button">
                              </div>
                          </div></td>
                        </tr>
                      </tbody>
                    </table>
                    
                   
                  </div>
                  <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
 
              
               <!-- accordion End -->
            </div >
          </div >
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
        
        <!-- center -->
      
      <div class=" col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:0px;">
            <div class="list-group" style="padding-left:10px;" id="downloadModules">        		
            </div>           
      </div>
        <div class="col-md-9"  style="margin-top:0px; padding-left:10px;" id="documentListDiv">
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Welcome Kit</a>
           <div class="list-group-item">
      	
        	<div class="row">
       	 </div>
</div>
</div>
</div>      	<br/><br/>
       	</div>
<!-- </div> -->
      
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />

<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<form method="post" action="<%=request.getContextPath()%>/downloads/getDownloadsValues.htm">
		<input type="hidden" name="downloads">
	</form>

	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocuments.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>


<script type="text/javascript">
var $j = jQuery.noConflict();
$j(document).ready(function(){
		viewDownloads(); 
});
</script>
<script type="text/javascript">
function viewDownloads(){
//	alert('Hello.....');
	$.ajax({
		type : 'GET',
		url : $('#contextPath').val()+"/download/getDownloadsList.htm",
		success : function(result){
			//alert(result);
			$('#documentListDiv').empty();
			$('#downloadModules').empty();
			$('#downloadModules').append('<a class="list-group-item active" href="#">Downloads</a>');
				$(result).each(					
					function(i, obj) {
					var documentID=obj.documentID;
					var documentText=obj.documentText;
					var documentName=obj.documentName;
					var DownloadModuleName=obj.downloadModuleName;
					var downloadModuleID=obj.downloadModuleID;
					var downloadDescription=obj.downloadDescription;
					var downloadIsShareDownload=obj.isShareDownload;
					var downloadIsShareView=obj.isShareView;
					
					if($('#'+downloadModuleID).html()==undefined || $('#'+downloadModuleID).html()==null){
						$('#downloadModules').append('<a id="'+downloadModuleID+'" onclick="showDocuments(id)"  class="list-group-item"><strong>'+DownloadModuleName+'</strong></a>');
						if(i==0){
							$('#documentListDiv').append('<div class="list-group docs" name="'+downloadModuleID+'"><a class="list-group-item active" >'+DownloadModuleName+'</a><div class="list-group-item"><div class="row" id="row'+downloadModuleID+'">  </div>');
							
						}else{
							$('#documentListDiv').append('<div class="list-group docs" name="'+downloadModuleID+'" style="display:none"><a class="list-group-item active" >'+DownloadModuleName+'</a><div class="list-group-item"><div class="row" id="row'+downloadModuleID+'">  </div>');
						}						   
					}
					
					
					if(downloadIsShareDownload==1 && downloadIsShareView==1){						
						 $('#row'+downloadModuleID).append('<div class="downloadstrip row"><div class="col-md-12"><div class="col-md-1 col-xs-2 centerAll"><i class="fa fa-file bigger-130"></i></div><div class="col-md-9" ><h3 class="northspace0">'+documentText+'</h3><p>'+downloadDescription+'</p></div><div class="col-md-2 pull-right"><a onclick="downloadAttachment('+documentID+')" title="View"><i class="fa fa-eye bigger-170"></i></a><a class="westspace3" onclick="downloadAttachment('+documentID+')" title="Download"><i class="fa fa-download bigger-150"></i></div></div></div>'); 
					
					}else if(downloadIsShareDownload==0 && downloadIsShareView==1){
						$('#row'+downloadModuleID).append('<div class="downloadstrip row"><div class="col-md-12"> <div class="col-md-1 col-xs-2 centerAll"><i class="fa fa-file bigger-130"></i></div><div class="col-md-9" ><h3 class="northspace0">'+documentText+'</h3><p>'+downloadDescription+'</p></div><div class="col-md-2 pull-right"><a onclick="downloadAttachment('+documentID+')" title="View"><i class="fa fa-eye bigger-170"></i></a>&nbsp;</div> </div></div> ');
					}else if(downloadIsShareDownload==1 && downloadIsShareView==0){
						$('#row'+downloadModuleID).append('<div class="downloadstrip row"><div class="col-md-12"> <div class="col-md-1 col-xs-2 centerAll"><i class="fa fa-file bigger-130"></i></div><div class="col-md-9" ><h3 class="northspace0">'+documentText+'</h3><p>'+downloadDescription+'</p></div><div class="col-md-2 pull-right"><a class="westspace3" onclick="downloadAttachment('+documentID+')" title="Download"><i class="fa fa-download bigger-150"></i></a></div> </div></div> ');
					}else{
						$('#row'+downloadModuleID).append('<div class="downloadstrip row"><div class="col-md-12"> <div class="col-md-1 col-xs-2 centerAll"><i class="fa fa-file bigger-130"></i></div><div class="col-md-9" ><h3 class="northspace0">'+documentText+'</h3><p>'+downloadDescription+'</p></div><div class="col-md-2 pull-right"></div> </div></div> ');	
					}
					
					
				});
		}
	});
	 
}

function showDocuments(id){
	$('.docs').hide();
	$('div[name="'+id+'"]').show();
}

function downloadAttachment(docId){
	if(docId==0){
		$("#msgDialog").html("Document is not available.");
	}else{
		$('#documentIdToDownload').removeAttr('disabled');
		$('#documentIdToDownload').val(docId);
		$('#downloadAttachmentForm').submit();
	}


}

</script>

</body>
</html>