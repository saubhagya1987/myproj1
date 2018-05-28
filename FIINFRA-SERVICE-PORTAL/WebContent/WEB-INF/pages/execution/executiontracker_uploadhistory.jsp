<%-- <%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<!DOCTYPE html>
<html lang="en"><head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">  
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <meta name="description" content="">    
    <meta name="author" content="">     
<title>RTA File Uploads- Upload History</title>      
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
    
        
      
<!-- -responsive css-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />


<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>

	 

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

<style>
.dropdown-menu {
	min-width: 190px ;
	} 
</style>

<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
  
<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

</head>   
<body>
<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />   
<!-- <script >
 
function addNote(){  
	$("#addnote").show();	
	$("#deletenote, #editnote").hide();	
	$("#popUpAlertaddnote").css ('height','420px')
	$("#popUpAlertaddnote").css ('width','650px')
	$("#popUpAlertaddnote").css ('top','150px')
	$("#popUpAlertaddnote").css ('left','400px')
	} 
	
function deleteNote(){ 
	$("#deletenote").show();	
	$("#addnote").hide();	
	$("#popUpAlertaddnote").css ('height','250px')
	$("#popUpAlertaddnote").css ('width','300px')
 
	}
	
	
</script> -->
<script type="text/javascript"> 
function pagesizeurl(){  
	  var pageSize=$('#page').val(); 
	   window.location.href= $('#contextPath').val()+'/seret/getUploadHistory.htm?pageSize='+pageSize;
	 }
	 


function reload(){ 
	window.location.href=$('#contextPath').val()+'/seret/getUploadHistory.htm';
}

function quickSearchPartner(e){
	//alert('in search');  
	var event = window.event ? window.event : e;
	//alert(event.keyCode);
	
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
		return;
	if(event.keyCode==13){
		search();
		return;  
	}
	$('#common_popup_div,#shadow_div_web_app').remove();
	//alert($('#quickSearch').val()); 
	//alert('hi'+ $('#quickSearchpart').val()); 
	var searchString = $('#quickSearchpart').val(); 
$.ajax({
	  url: $('#contextPath').val()+"/birtreport/getPartnerList.htm?searchString="+searchString,
	  method:"post", 
	  success:function(result){
		  
		  var userLabelValueList = new Array();
			 $(result).each(function(i,obj){
					var object = {};
					object.value = obj.partyID;
					object.label = obj.partnerName;
					userLabelValueList.push(object);
				/* 	alert("Hello:::::"+ obj.partyID);
					alert("Hi:::::::::"+obj.partnerName); */
					  
			 });  
//				 alert("object.label:::"+  object.label);
			 $("#quickSearchpart")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			      if ( event.keyCode === $.ui.keyCode.TAB &&
			    	$( this ).data( "ui-autocomplete" ).menu.active ) {
			        event.preventDefault();
			      }
			    })
			   
			     
			    .autocomplete({
			      minLength: 0,
			      source: function( request, response ) {
			       last=extractLast(request.term);
			       if(last==null || last=='' || last==' ')
					{
						return false;
					}
			       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
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
//					        	partyId=ui.item.value;
				        	$('#quickSearchHiddenpart').val(ui.item.value)
					
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
  
function split( val ) {
    return val.split( /;\s*/ );
} 
function extractLast( term ) {
    return split( term ).pop();
} 
  

     
function sendForReprocess(id,records){
	//alert('hi'+ id +' '+records);
	if(id== null){ 
		return; 
	} 
	    
	$.ajax({  
		type : "GET", 
		url : $('#contextPath').val()+'/seret/requestforreprocess.htm?queueId='+id,
		dataType : "json",  
		success : function(data){      
		  //alert(data);    
			
			   
		  tempId = data;   
     	 //alert(tempId.length);      
		if(tempId.length==1)     
		{  
  		alert("Record reprocessed successfully !");  
  		location.reload(); 
  		return true;
 	  
		}         
		    
		else  
		{   
	  		alert("Record reprocessed failed !");    
	  		location.reload(); 
	  		return true; 
	 	
			}         
			          
		}     
	});     
} 
function confirmReprocess(id,status){ 
	
	
	 var  finished =status.trim();    
	 
	  	if(finished == 'Finished'){      
	  	
	  		/* var reprocessDivId  = "#reprocessresponsediv_" + id; */
	  		var reprocessDivId  = "#reprocessresponsediv" ;
	  		
	  		$(reprocessDivId).modal('show');  
	  		/* $(reprocessDivId).show();  */
	  		       
	    	   
	    }            
	  	else{        
	    	
	    	  var reprocessFailedDivId  = "#reprocessfaileddiv";
	    	  $(reprocessFailedDivId).modal('show');     
	  		 /* $(reprocessFailedDivId).show();  */       
	  	}   
	    
}       
    
  
	     
	 function deleteBulkReprocess()   
     	{ 
	 	  var slvals = [] ;
	 	  $('input:checkbox[id=chkToDeletedepartmentId]:checked').each(function() {
	 		
	 	  slvals.push($(this).val());
	 	  }) ;   
	 	   
	 	document.getElementById("confirmdelete").value = slvals;  
		  if(slvals<=0)
			  {  
				bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one item.</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
								//Example.show("Primary button");
							}
						}
					}
				});

			  }   
		  else{
			 
			  confirmReprocess1();
		  }   
	          
	   };   
	   
	   function confirmReprocess1(){
		   
			var reprocessDivId  = "#reprocessresponsediv" ;
			/* $(reprocessDivId).modal('show');  */ 
			 $(reprocessDivId).modal('show');    
		}    
  
	   function confirmDelete()     
		{  
		   	
			  var slvals= document.getElementById("confirmdelete").value;
			  var batchId= document.getElementById("chkToDeletedepartmentId").value;
			  
			  var tempId;  
			 
			 
			 	$.ajax({               
	     				type : 'POST',    
	     				url : $('#contextPath').val()+"/seret/bulkReprocess.htm?Lists="+slvals+"&queueId="+batchId,   
	     				
	     			success : function(result) 
	     		  {	     
	     				  //alert("Record reprocessed successfully !");
	     				  var reprocessDivId  = "#reprocessresponsediv" ;
			 			  $(reprocessDivId).modal('hide');  
	     				  
	     				 bootbox.dialog({
		 						message: "<span class='bigger-110'>Record reprocessed successfully !</span>",
		 						buttons: 			
		 						{  
		 							"click" :
		 							{
		 								"label" : "OK!",
		 								"className" : "btn-sm btn-primary",
		 								"callback": function() {
		 									location.reload();
		 									var reprocessDivId  = "#reprocessresponsediv" ;
		 				     				  $(reprocessDivId).modal('hide');
		 								}
		 							}
		 						}
		 					}); 
	     				  
	     				   
	     				    
	     			}      
	     		             
	     		  });     
			 	
			 	//$(reprocessDivId).hide(); 
			 	 
		}
	        
	   function downloadAttachmentDownload(filepath,fileName) { 
		     
		 window.location.href= $('#contextPath').val()+'/seret/downloadAttachmentDownload.htm?filepath='+filepath+"&fileName="+fileName; 
		// alert(filepath);
		 if(filepath == "null")
			 {
			 alert('file not found !');
			 }
					
		}    
	   
	   function errorfind(){
		   
			var reprocessDivId  = "#reprocessresponsediv" ;
			/* $(reprocessDivId).modal('show');  */ 
			 $(reprocessDivId).modal('show');    
		}    
	   
	   
	   
	
	        
	</script>
 
<!--css popup window start 1-->  
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px;" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   	<div class="heading_contactform"><h3>Log Trouble Ticket</h3></div>
        <div id="poptable_contactform">
        	    
             <div class="full">
              <input type="text" class="form-control" placeholder="Subject">
               </div>
                <div class="full" >
               <textarea class="form-control" rows="3" placeholder="Your Question" style="height: 100px;"></textarea>
			</div>  
             <div class="full">
              <input type="text" class="form-control" placeholder="Attach File" >
              
               </div> 
 </div>
   <div class="topbuttonholder">
        	<form><input class="dbtn" value="Send Email"   id="loginButton" type="button">	
            <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>  
        
	</div>   
</div>
    <!-- delete-->
  
  <div class="modal fade" id="reprocessresponsediv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Reprocess Records</h4>
		      </div>
      <div class="modal-body">
			
    <%--  
  <div class="popupnewup1" style="float:left;" id="reprocessresponsediv">
   <div class="close" ><a onClick="$('.popupnewup1').hide()" href="#"><img alt="" src="<%=request.getContextPath() %>/images/btn_close.gif" /></a></div>
        <table class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0" id="reprocessresponsetable">
        	  --%>
            
            	<br>Please confirm to reprocess records !<br><br> 
            
            	<form>
				  <div id="Yes"  class="btn btn-sm btn-primary" onClick="confirmDelete();"><i class='ace-icon fa fa-plus'></i>Yes</div>
				  
                  <div id="No"  class="btn btn-sm btn-danger" onClick="reload();"><i class='ace-icon fa fa-trash'></i>No</div> 
                 
				</form>
			
		</div>
	</div>
</div>
</div>


<div class="modal fade" id="reprocessfaileddiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Reprocess Records</h4>
		      </div>
      <div class="modal-body">
			
            	<br>Can not reprocess records !<br><br> 
            	
		</div>
	</div>
</div>
</div>


<div class="modal fade" id="reprocessresponsediv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Reprocess Records</h4>
		      </div>
      <div class="modal-body">
	          	<br>Please confirm reprocess of Batch Id ${data.batchId} having ${data.recordCount} records<br><br> 
            
            	<form>
				  <div id="Yes"  class="btn btn-sm btn-primary" onClick="confirmDelete();"><i class='ace-icon fa fa-plus'></i>Yes</div>
				  
                  <div id="No"  class="btn btn-sm btn-danger" "><i class='ace-icon fa fa-trash'></i>No</div> 
                 
				</form>
			
		</div>
	</div>
</div>
</div>
    <!-- delete-->   

<!--css popup window 1 close-->
<!--css popup window start 2-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:300px; height:300px; top:100px; left:40%!important;" id="popUpAlert" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlert')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> </h3></div>
        <div id="poptable_contactform">
        	<span class="text">
          Submitting new request to reprocess selected Batch. The new batch id is 9821</span>
 </div>
  
           
	</div>  
</div>
<!--css popup window 2 close-->

<jsp:include page="../common/header.jsp"></jsp:include>

 <!-- Center part start --> 
 
     
  <input type="hidden" name="confirmdelete" id="confirmdelete" value="">    
  <input type="hidden" name="errortoshow" id="errortoshow" value="<%=request.getParameter("error")%>">     
       
     <div class="container white">  
    	<div class="container-head">
          
<!--           <div class="col-md-12" style="text-align: right; width:96%;"><span style="float:left;">RTA File Uploads</span> -->
          <div class="page-header clearfix">   <h1 class="pull-left" ><B>RTA File Uploads</B></h1></div>
          <!-- <span  class="col-md-10" style="float:right; margin-top:-3px;"> <input name="searchtext"  type="text" id="tags"  placeholder="Quick Search"></span> -->
          </div >    
       
          </div >           
       
        <div class="container-body " style="padding:5px;">
                
        </div>        
	  	<div class="container-body">     
         
        <!-- center -->   
      
      <div class="col-md-2 sidebar-offcanvas" role="navigation" style="margin-top:17px; padding-left:10px;" >
            <div class="list-group">
        		<a class="list-group-item active" href="#">RTA File Uploads</a>   
 				 <%-- <a href="<%=request.getContextPath() %>/seret/getNewFilesUpload.htm" class="list-group-item" id="SPUploadViewLink" class="list-group-item">New Upload  </a> --%> 
                <a href="<%=request.getContextPath() %>/seret/getUploadHistory.htm" class="list-group-item" id="SPUploadHistory"><strong>Upload History</strong></a></div>
                   
        </div>          
        <div class="col-md-10"  style="margin-top:17px; padding-left:10px;"  > 
			   
 <!-- center -->     
        
         <div class="list-group"> 
        		<a class="list-group-item active" href="#" >Upload History </a>
        		 
        		   <div class="list-group-item" > 
					        
					  	<div class="accordion-heading" style="float:right;">
					  		<a id="SPBulkReprocessLink" href="#" onClick="deleteNote();" >
					  		<input data-params="{}" type="button" id="bulkButton" class="btn btn-sm btn-primary " value="  Bulk Reprocess"   onClick="deleteBulkReprocess();"   title="Bulk Reprocess" alt="Bulk Reprocess"></a>
					  	</div>            
					   	           
                <!-- accordion start-->
                
                <div class="accordion pull-left col-md-12" id="accordFundSel" style="margin-left:-5px;">
                  <div class="accordion-group">
                     <div class="pull-left fundtool_left_col_head "> </div> 
<!--                     <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <span style=" margin-top:0px;" class="searchiconb"  alt="Search" title="Search"></span> </a> </div> -->
					
					  
                    <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                      <div class="accordion-inner table-responsive ">
                      <div style="width: 1300px;">
                          <!--1 search start-->      
                          <div class="filterbox searchpadding">
                            <div class="head">Date Range </div>
                           <div class="drop_box_body">
                            <span class="searchtext"> Start Date</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" /> 
                            <span class="searchtext">Time</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                              
                             <br>
                         	</div>
                         </div>
                          <div class="filterbox searchpadding">
                            <div class="head">Source</div>
                            <div class="drop_box_body">
                              <ul class="nav  nav-stacked">
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox">
                                  Mutual Fund RTA - CAMS </li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox">
                                  Mutual Fund RTA - Karvy</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox">
                                  Mutual Fund RTA - Templeton</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox" checked>
                                  Mutual Fund RTA - Sundaram</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox" checked>
                                  NJ</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox" checked>
                                  Prudent </li>
                              </ul>
                            </div>
                          </div>
                          <div class="filterbox searchpadding">
                            <div class="head">File Type</div>
                            <div class="drop_box_body">  
                              <ul class="nav  nav-stacked">
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox" checked>
                                  Client </li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox" checked>
                                  Transaction</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox" checked>
                                  Units Recon</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox" checked>
                                  Trial Commission</li>
                              </ul>
                            </div>
                          </div>
                          <div class="filterbox searchpadding">
                            <div class="head">Upload By </div>
                            <div class="drop_box_body">
                              <ul class="nav  nav-stacked">
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox">
                                  Pradip</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox">
                                  Sunil</li>
                                <li>
                                  <input id="15Large"  value="15Large" type="checkbox">
                                  Rahul</li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- accordion-inner END-->
                     <div class="col-md-1">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                    </div>
                    <!-- accordion-body END -->
                  </div>
                  <!-- accordion-group END -->
                </div>
           <!-- accordion  END 
   <!-- accordion End --> 
               
  
                            
   <div class="row">    </div> 
      
			     
				<div class="table-responsive" id="display_table_lead" style="border:none;">  
						<div id="toreload">
						 <table id="grid-table"></table>
						 <div id="grid-pager"></div>
						 
				</div>  
				 
						 <div class="pull-left">
		     				 <div class="hr-12"></div>
		     				 <div class="topmenuleft margin_5px" >
		          			 	<span>Export options:</span>
		          			 	<a href="<%=request.getContextPath()%>/seret/uploadHistoryCSV.htm" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-140"></i></a>
								<a href="<%=request.getContextPath()%>/seret/uploadHistoryExecl.htm" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-140"></i></a> 
		          			 	
		                    </div>
							</div>
				</div> 

                     
			    </div>    
			</div>   
			 </div> 
			</div> 
		  	   

        <!-- Center-->      
            
			
	<script type="text/javascript">
			
	var grid_data = '${uploadHistoryList}';
	
	var index  = JSON.parse(grid_data);
	
			
			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			];
			
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
					//for this example we are using local data
					subGridRowExpanded: function (subgridDivId, rowId) {
						var subgridTableId = subgridDivId + "_t";
						$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
						$("#" + subgridTableId).jqGrid({
							datatype: 'local',
							data: subgrid_data,
							colNames: ['No','Item Name','Qty'],
							colModel: [
								{ name: 'id', width: 50 },
								{ name: 'name', width: 150 },
								{ name: 'qty', width: 50 }
							]
						});
					},
					
				
	
					data: index, 
					datatype: "local",
					height: 250,
					colNames:['','Partner Name','ARN','Date','Batch Id', 'Source and File Type','Upload<br>Source Type<br>','FileName','Status','Error <br> Count','Record <br> Count','Success <br> Count','Action'],
					colModel:[
						 
					      
						{name:'', index:'checkbox',width:50 ,sortable:false,formatter:function(cellvalue, options,rowObject) {
							if(rowObject.status=='Finished'){
						    return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.batchId+'" name="chkToDeletedepartmentId" id="chkToDeletedepartmentId"  >';
						    }else{return '<input role="checkbox" type="checkbox"  class="cbox" value="'+rowObject.batchId+'" name="chkToDeletedepartmentId" id="chkToDeletedepartmentId"   disabled> ';}
						}},     
						
						  
						
						{name:'partnername',index:'partnername',width:300},
						{name:'arn',index:'arn'},  
						{name:'createdDate',index:'createdDate',width:300},  
						{name:'batchId',index:'batchId'},
						{name:'transactionType',index:'transactionType',width:400,cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'uploadSourceType',index:'UploadSourceType',width:180,cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'fileName',index:'fileName',width:400,cellattr: function (rowId, tv, rawObject, cm, rdata) { return 'style="white-space: normal;"' }},
						{name:'status',index:'status'}, 
						{name:'errorCount',index:'errorCount'},
						{name:'recordCount',index:'recordCount'},
						{name:'successCount',index:'successCount'},
						
						{name:'action',index:'action',width:100,formatter:function(cellvalue, options,rowObject) {
						
						    return  '<a onclick="openActionPopup(\''+rowObject.filepath+'\' ,\''+rowObject.fileName+'\','+rowObject.batchId+' ,\''+rowObject.status+'\')">Action</a>';
						     
						}},  
						
						
						
					], 
			
			
					
					viewrecords : true,
					rowNum:15,
					rowList:[10,20,100,1000],
					pager : pager_selector,
					altRows: true,
					//toppager: true,
					
					multiselect: false,
					//multikey: "ctrlKey",
			        multiboxonly: false,
			
			        autowidth: true,
		            shrinkToFit: true,	
			        
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					/* caption: "jqGrid with inline editing" */
			
					//,autowidth: true,
			
			
					/**
					,
					grouping:true, 
					groupingView : { 
						 groupField : ['name'],
						 groupDataSorted : true,
						 plusicon : 'fa fa-chevron-down bigger-110',
						 minusicon : 'fa fa-chevron-up bigger-110'
					},
					caption: "Grouping"
					*/
			
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				
			
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});
			
			
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
						search: true,
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
						/**
						multipleGroup:true,
						showQuery: true
						*/
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
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
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
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
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
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
		</script>
		
		<script>
		
	
		function ViewErrorCount(batchId){
			window.location.href = $('#contextPath').val()+"/seret/getbulkuploaderrorcount.htm?queueId="+batchId;
		}
		function ViewUploadedTrans(batchId){

			window.location.href = $('#contextPath').val()+"/seret/getbulkuploadtransactiohistorydetails.htm?queueId="+batchId;
		}
		
		function openActionPopup(filepath,fileName,batchId,status){
	//	alert('Hi');
			/*'+rowObject.filepath+',\''+rowObject.fileName+'\','+rowObject.batchId+','+rowObject.status+'\'  */
			$('#SPDownloadLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();downloadAttachmentDownload(\''+filepath+'\',\''+fileName+'\')'); 
			$('#SPReProcessLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();confirmReprocess('+batchId+',\''+status+'\')');
			$('#ViewErrorCountLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();ViewErrorCount('+batchId+')');
			$('#SPViewUploadedTransLink a').attr('onclick','$( ".ui-dialog-titlebar-close").click();ViewUploadedTrans('+batchId+')');
	
			
			/* if(executionStatus<1){
				//hide data collection link here
			} */
			if('${sessionScope.userSession.buId}'!='27829'){
				$('#SPDownloadLink').removeClass('hide');
				$('#SPReProcessLink').removeClass('hide');
				$('#ViewErrorCountLink').removeClass('hide');
				$('#SPViewUploadedTransLink').removeClass('hide');
				
				
			}else{
				$('#SPDownloadLink').removeClass('hide');
				$('#SPReProcessLink').removeClass('hide');
				$('#ViewErrorCountLink').removeClass('hide');
				$('#SPViewUploadedTransLink').removeClass('hide');
				
			}
			
			
		/* 	$( ".action_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
                width: "auto",
			});  */
			
			$( ".action_dialog" ).removeClass('hide').dialog({
			     resizable: false, 
			     modal: true, 
			                 width: "auto",
			                 position: { my: "center", at: "right", of: window },
			                 
			                }); 
			    
			 
		}
		
        jQuery(function($) {
        	$("#search").keyup(function(event) {
				if (event.keyCode == 13) {
					oppsearch();
				}
			});
       /*  $( ".action" ).on('click', function(e) {
					e.preventDefault();
				
					$( ".action_dialog" ).removeClass('hide').dialog({
						resizable: true,
						modal: true,
                        width: "auto",
					});
				}); */
				
				$( ".progress").on('click', function(e) {
					e.preventDefault();
				
					$( ".progress_dialog" ).removeClass('hide').dialog({
						resizable: false,
						modal: true,
						width: "auto",
                        
					});
				});
			});
			
         
        
        </script>
		
	
<div class="common_dialog hide action_dialog" >
  <table id="" class="table table-bordered table-striped" width="100%" cellpadding="0" cellspacing="0" >
    <tbody>
      <tr id="">
        <th class="thead">Action List</th>
       
      </tr>
      <tr id="">
        <td id="SPDownloadLink"><i class="fa fa-check"></i> <a onclick=""><span class="">Download File</span></a></td>
      
      </tr>
      <tr id="">
        <td id="SPReProcessLink"><i class="fa fa-database"></i> <a onclick=""><span class="">Reprocess</span></a></td>
      </tr>
      <tr id="">
        <td id="ViewErrorCountLink"><i class="fa fa-clock-o"></i> <a onclick=""><span class="">View Error Count</span></a></td>
        
      </tr>
      <tr id="">
        <td id="SPViewUploadedTransLink"><i class="fa fa-question-circle"></i> <a onclick=""><span class="">View Uploaded Transaction</span></a></td>
       
      </tr>
     
    </tbody>
  </table>
</div>

       
  
<jsp:include page="../common/footer.jsp" />
<script type="text/javascript">
var hidePopupTimeoutId;
 $(document).ready(function(){
	/* (function(){ */
	var err =$('#errortoshow').val();
	
	if(err == 'true'){  
		   
	
		  
		alert('File Not Found !');
		 
	 	
		 
		window.location.href= $('#contextPath').val()+'/seret/getUploadHistory.htm';
		  
	}
	
	
}); 

	</script>
</body>
</html> 